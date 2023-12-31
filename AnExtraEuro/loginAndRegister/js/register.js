document.querySelector('form').addEventListener('submit', async function (e) {
	e.preventDefault();
    const username = document.querySelector("input[name='username']").value;
	const email = document.querySelector("input[name='email']").value;
	const password = document.querySelector("input[name='password']").value;

	const res = await fetch('/register', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({username, email, password }),
	});
	const data = await res.json();
	if(data.status === 'success') {
		window.location.href = '/pages/login.pug';
	}
});
