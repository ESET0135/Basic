export default function ApiPage() {
    const { loading, data, error } = useFetch("https://jsonplaceholder.typicode.com/posts");
    if (loading) return <h1>Loading...</h1>;
    if (error) return <h1>Error: {error.message}</h1>;
    return (
        <div>
            <h1>API Page</h1>
            <ul>
                {data.map(item => (
                    <li key={item.id}>{item.title}</li>
                ))}
            </ul>
        </div>
    );
}