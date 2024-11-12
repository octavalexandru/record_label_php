-- Database: Music Label

-- Table: Artists
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Albums
CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    title VARCHAR(100) NOT NULL,
    release_date DATE,
    genre VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE
);

-- Table: Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table: Merchandise
CREATE TABLE Merchandise (
    merchandise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    type ENUM('Clothing', 'Patches', 'Accessories'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: OrderItems
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    merchandise_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (merchandise_id) REFERENCES Merchandise(merchandise_id)
);

-- Table: AlbumOrders
CREATE TABLE AlbumOrders (
    album_order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    album_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);
