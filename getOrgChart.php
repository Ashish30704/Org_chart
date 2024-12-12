<?php
header('Content-Type: application/json');

$host = "localhost";
$user = "root";
$password = "Ashu@2004";
$database = "org_chart";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed: ' . $conn->connect_error]);
    $message = "Invalid database credentials";
    echo "<script>alert('$message');</script>";
    exit;
}

$query = "SELECT id, name, title, parent_id, photo_url FROM employees";
$result = $conn->query($query);

$data = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = [
            'id' => $row['id'],
            'pid' => $row['parent_id'], // Use 'pid' for parent_id as required by Balkan Graphs
            'name' => $row['name'],
            'title' => $row['title'],
            'photo_url' => $row['photo_url'] ?: 'https://via.placeholder.com/100' // Default photo
        ];
    }
}

echo json_encode($data);

$conn->close();
?>