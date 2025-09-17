function LoginComponent() {
    const [username, setUsername] = React.useState('');
    const [password, setPassword] = React.useState('');

    const onLoginHandler = () => {
        if(username!=="username")
        {
            alert()("invalid username");
            return;
        }
        if(password!=="password")
        {
            alert()("invalid password");
            return;
        }   
        alert("login successful");

    };

    return (
        <div>
            <h2>Login</h2>
            <form onSubmit={onLoginHandler}>
                <div>
                    <label>Email:</label>
                    <input type="email" value={username} onChange={(e) => setUsername(e.target.value)} />
                </div>
                <div>
                    <label>Password:</label>
                    <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
                </div>
                <button type="login">Login</button>
            </form>
        </div>
    );
}
