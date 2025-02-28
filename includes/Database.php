<?php

define('HOST', 'localhost');
define('USER_NAME', 'root');
define('PASSWORD', '');  // Change to '' (empty string) if using XAMPP/WAMP
define('DB_NAME', 'forever_fusion');

// Database Class
class Database
{
    private $connection;

    // Constructor
    public function __construct()
    {
        $this->open_db_connection();
    }

    // Creating connection with DB
    public function open_db_connection()
    {
        $this->connection = mysqli_connect(HOST, USER_NAME, PASSWORD, DB_NAME);

        if (!$this->connection) {
            die('Connection Error: '.mysqli_connect_error());
        }
    }

    // Running SQL query on DB
    public function query($sql)
    {
        $result = $this->connection->query($sql);
        if (!$result) {
            die('Query fails: '.$this->connection->error);
        }
        return $result;
    }

    // Fetch all rows
    public function fetch_array($result)
    {
        $resultarray = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $resultarray[] = $row;
            }
        }
        return $resultarray;
    }

    // Fetch a single row
    public function fetch_row($result)
    {
        return ($result->num_rows > 0) ? $result->fetch_assoc() : null;
    }

    // Secure inputs
    public function escape_value($value)
    {
        return $this->connection->real_escape_string($value);
    }

    // Close connection
    public function close_connection()
    {
        if ($this->connection) {
            $this->connection->close();
        }
    }
} 

$database = new Database();
