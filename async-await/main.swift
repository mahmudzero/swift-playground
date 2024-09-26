//
// Mahmud Ahmad
// Cuz Why Not
//
// Async/Await Playground
//

func async_task(_ caller: String = #function) async {
	print("async_task called from ", caller, terminator: " ")
}

func sync_task() {
	Task {
		await async_task(); print("finished sync_task")
	}
}

// since we are using callback in the Task, we need to mark it as `@escaping` TODO: what does escaping mean
func sync_async_task(_ callback: @escaping () -> ()) {
	Task {
		await async_task(); print("finished sync_async_task")
		callback()
	}
}

// Task happens in background and is non-blocking
// sync_task()
// 
// // Swift supports top-level await... :thinking:
// await async_task(); print("finished main")

sync_async_task({
	print("This is the callback function being triggered")
})
