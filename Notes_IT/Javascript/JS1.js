// this works only in Chrome, use it to catch uncaught promise errors
window.onunhandledrejection = event => {
	event.preventDefault(); // prevent the console.error warning
	console.log("Unhandled promise rejection" + event.reason);
}
// Only in Chrome
window.onrejectionhandled = event => {
	console.log("promise rejection handled");
}

function foo() {
	const promise = Promise.reject(new Error("trichobezoar"));

	setTimeout(() => {
		promise.catch(error => console.log("eventualy caught");
	}, 5000);
}

foo();