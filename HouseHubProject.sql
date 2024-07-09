DROP SCHEMA IF EXISTS HOUSEHUB;
CREATE SCHEMA IF NOT EXISTS HOUSEHUB;
USE HOUSEHUB;
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL
);
DROP TABLE IF EXISTS Agent;
CREATE TABLE Agent (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL
);
DROP TABLE IF EXISTS AgentAvailability;
CREATE TABLE AgentAvailability (
    available_starttime datetime,
    available_endtime datetime,
    agent_id INT,
	FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
);

DROP TABLE IF EXISTS House;
CREATE TABLE House (
    house_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(200) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    size DECIMAL(10,2) NOT NULL,
    bedrooms INT NOT NULL,
    bathrooms DECIMAL(10,2) NOT NULL,
	image_url VARCHAR(255) ,
	vr_tour_url VARCHAR(255) ,
    agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
);
DROP TABLE IF EXISTS Tour;
CREATE TABLE Tour (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    agent_id INT NOT NULL,
    house_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id),
    FOREIGN KEY (house_id) REFERENCES House(house_id)
);
DROP TABLE IF EXISTS CustomerReviews;
CREATE TABLE CustomerReviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    house_id INT NOT NULL,
    review_text TEXT,
    rating INT,
    review_date DATE,
    is_vr_tour_review BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (house_id) REFERENCES House(house_id)
);
 #this is a dummy data 
INSERT INTO Customer (name, email, phone) VALUES
('John Doe', 'johndoe@gmail.com', '123-456-7890'),
('Jane Smith', 'janesmith@gmail.com', '234-567-8901'),
('Michael Johnson', 'michaeljohnson@gmail.com', '345-678-9012'),
('Emily Brown', 'emilybrown@gmail.com', '456-789-0123'),
('David Wilson', 'davidwilson@gmail.com', '567-890-1234'),
('Sarah Taylor', 'sarahtaylor@gmail.com', '678-901-2345'),
('Chris Anderson', 'chrisanderson@gmail.com', '789-012-3456'),
('Laura Martinez', 'lauramartinez@gmail.com', '890-123-4567'),
('Kevin Lee', 'kevinlee@gmail.com', '901-234-5678'),
('Amanda Thomas', 'amandathomas@gmail.com', '012-345-6789');

 #this is a dummy data 
INSERT INTO Agent (name, email, phone) VALUES
('James Johnson', 'james.johnson@gmail.com', '111-222-3333'),
('Emily Davis', 'emily.davis@gmail.com', '222-333-4444'),
('Daniel Brown', 'daniel.brown@gmail.com', '333-444-5555'),
('Emma Wilson', 'emma.wilson@gmail.com', '444-555-6666'),
('William Martinez', 'william.martinez@gmail.com', '555-666-7777'),
('Olivia Anderson', 'olivia.anderson@gmail.com', '666-777-8888'),
('Liam Garcia', 'liam.garcia@gmail.com', '777-888-9999'),
('Sophia Rodriguez', 'sophia.rodriguez@gmail.com', '888-999-0000'),
('Michael Hernandez', 'michael.hernandez@gmail.com', '999-000-1111'),
('Isabella Lopez', 'isabella.lopez@gmail.com', '000-111-2222');

 #this is a dummy data 
INSERT INTO AgentAvailability (available_starttime, available_endtime, agent_id) VALUES
('2024-05-14 09:00:00', '2024-05-14 17:00:00', 1),
('2024-05-15 10:00:00', '2024-05-15 18:00:00', 2),
('2024-05-16 08:30:00', '2024-05-16 16:30:00', 3),
('2024-05-17 09:30:00', '2024-05-17 17:30:00', 4),
('2024-05-18 08:00:00', '2024-05-18 16:00:00', 5),
('2024-05-19 10:30:00', '2024-05-19 18:30:00', 6),
('2024-05-20 09:00:00', '2024-05-20 17:00:00', 7),
('2024-05-21 08:30:00', '2024-05-21 16:30:00', 8),
('2024-05-22 09:30:00', '2024-05-22 17:30:00', 9),
('2024-05-23 08:00:00', '2024-05-23 16:00:00', 10);

 #this is a dummy data 
INSERT INTO House (address, price, size, bedrooms, bathrooms, image_url, vr_tour_url, agent_id) VALUES
('123 Main St', 250000.00, 1500.00, 1, 1, 'https://images.com/image1.jpg', 'https://images.com/vr_tour1', 1),
('456 Elm St', 350000.00, 2000.00, 1, 1.5, 'https://images.com/image2.jpg', NULL, 2),
('789 Oak St', 450000.00, 2500.00, 2, 2, NULL, 'https://images.com/vr_tour3', 3),
('101 Pine St', 550000.00, 3000.00, 2, 2, 'https://images.com/image4.jpg', NULL, 4),
('202 Maple St', 650000.00, 3500.00, 3, 2.5, NULL, NULL, 5),
('303 Cedar St', 750000.00, 4000.00, 3, 2, 'https://images.com/image6.jpg', 'https://images.com/vr_tour6', 6),
('404 Walnut St', 850000.00, 4500.00, 4, 2, NULL, 'https://images.com/vr_tour7', 7),
('505 Birch St', 950000.00, 5000.00, 4, 3, 'https://images.com/image8.jpg', NULL, 8),
('606 Ash St', 1050000.00, 5500.00, 3, 2.5, NULL, 'https://images.com/vr_tour9', 9),
('707 Spruce St', 1150000.00, 6000.00, 5, 4, 'https://images.com/image10.jpg', NULL, 10);

 #this is a dummy data 
INSERT INTO Tour (customer_id, agent_id, house_id, date) VALUES
(1, 1, 1, '2024-05-14'),
(2, 2, 2, '2024-05-15'),
(3, 3, 3, '2024-05-16'),
(4, 4, 4, '2024-05-17'),
(5, 5, 5, '2024-05-18'),
(6, 6, 6, '2024-05-19'),
(7, 7, 7, '2024-05-20'),
(8, 8, 8, '2024-05-21'),
(9, 9, 9, '2024-05-22'),
(10, 10, 10, '2024-05-23');

 #this is a dummy data 
INSERT INTO CustomerReviews (customer_id, house_id, review_text, rating, review_date, is_vr_tour_review) VALUES
(1, 1, 'Great house, excellent location!', 5, '2024-05-14', FALSE),
(2, 2, 'Wonderful experience, highly recommended!', 4, '2024-05-15', FALSE),
(3, 3, 'Loved the house, spacious and comfortable.', 5, '2024-05-16', FALSE),
(4, 4, 'Amazing property, exceeded expectations.', 5, '2024-05-17', FALSE),
(5, 5, 'Beautiful house with stunning views.', 4, '2024-05-18', FALSE),
(6, 6, 'Impressive architecture, felt like home.', 5, '2024-05-19', FALSE),
(7, 7, 'Lovely house, enjoyed every moment of the tour.', 4, '2024-05-20', TRUE),
(8, 8, 'Fantastic experience, loved the virtual tour!', 5, '2024-05-21', TRUE),
(9, 9, 'Great service, would definitely recommend.', 4, '2024-05-22', FALSE),
(10, 10, 'Excellent property, everything was perfect.', 5, '2024-05-23', FALSE);

SELECT * FROM CUSTOMER;
SELECT * FROM Agent;
SELECT * FROM AgentAvailability;
SELECT * FROM House;
SELECT * FROM Tour;
SELECT * FROM CustomerReviews;

#queries
#1. House in a price range
SELECT house_id, address, price, size, bedrooms, bathrooms, image_url, vr_tour_url
FROM House
WHERE price BETWEEN 300000 AND 700000
ORDER BY PRICE DESC;

#2.House search from an agent
SELECT t.tour_id, t.date, c.name AS customer_name, h.address AS house_address
FROM Tour t
JOIN Customer c ON t.customer_id = c.customer_id
JOIN House h ON t.house_id = h.house_id
WHERE t.agent_id = 2;

#3.List houses with their respective agents and number of tours scheduled.
SELECT h.house_id, h.address, h.price, a.name AS agent_name, COUNT(t.tour_id) AS number_of_tours
FROM House h
JOIN Agent a ON h.agent_id = a.agent_id
LEFT JOIN Tour t ON h.house_id = t.house_id
GROUP BY h.house_id, h.address, h.price, a.name;

# 4. Get the availability schedule for a specific agent.
SELECT a.name AS agent_name, av.available_starttime, av.available_endtime
FROM AgentAvailability av
JOIN Agent a ON av.agent_id = a.agent_id
WHERE av.agent_id = 1;

#5. all reviews for a specific house.
SELECT r.review_text, r.rating, r.review_date, c.name AS customer_name
FROM CustomerReviews r
JOIN Customer c ON r.customer_id = c.customer_id
WHERE r.house_id = 3;

#6. avg ratings
SELECT h.house_id, h.address, AVG(r.rating) AS average_rating
FROM House h
JOIN CustomerReviews r ON h.house_id = r.house_id
GROUP BY h.house_id, h.address
HAVING COUNT(r.review_id) > 0;

#7. list houses  to show if they have virtual tour capability and whether they have received any reviews
SELECT h.house_id, h.address, 
       CASE 
           WHEN h.vr_tour_url IS NOT NULL THEN 'Yes' 
           ELSE 'No' 
       END AS has_virtual_tour,
       CASE 
           WHEN (SELECT COUNT(*) FROM CustomerReviews r WHERE r.house_id = h.house_id) > 0 THEN 'Yes' 
           ELSE 'No' 
       END AS has_reviews
FROM House h;


# Stored procedure to add new house to the db

DELIMITER //

CREATE PROCEDURE AddNewHouse (
    IN p_address VARCHAR(200),
    IN p_price DECIMAL(10,2),
    IN p_size DECIMAL(10,2),
    IN p_bedrooms INT,
    IN p_bathrooms DECIMAL(10,2),
    IN p_image_url VARCHAR(255),
    IN p_vr_tour_url VARCHAR(255),
    IN p_agent_id INT
)
BEGIN
    INSERT INTO House (address, price, size, bedrooms, bathrooms, image_url, vr_tour_url, agent_id)
    VALUES (p_address, p_price, p_size, p_bedrooms, p_bathrooms, p_image_url, p_vr_tour_url, p_agent_id);
END //

DELIMITER ;
#Query to run the stored procedure
CALL AddNewHouse('65 N point', 300000.00, 2000.00, 3, 2, NULL, Null, 1);

