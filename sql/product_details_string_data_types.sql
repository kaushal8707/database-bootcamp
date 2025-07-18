use datatypemastery;
CREATE TABLE product_details (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_code CHAR(10),
    product_name VARCHAR(100),
    short_description TINYTEXT,
    detailed_description TEXT,
    additional_info MEDIUMTEXT,
    full_manual LONGTEXT,
    size ENUM('Small', 'Medium', 'Large'),
    available_colors SET('RED', 'GREEN', 'BLUE', 'BLACK', 'WHITE')
);

INSERT INTO product_details (
	product_code,
    product_name,
    short_description,
    detailed_description,
    additional_info,
    full_manual,
    size,
    available_colors
) VALUES (
	'PRD1234567',
    'Wireless Headphones',
    'Noise-Canceling Headphones',
    'High-quality headphones with advanced noise-canceling features, Bluetooth 5.0, and 30 hours battery life',
    'Warranty: 2 years. Includes USB-C canle and travel-case',
    'Step: 1 Charge the headphones fully using the provided USB-C cables. Step: 2 Turn on Bluetooth and pair the devices',
    'Medium',
    'Black,White'
);
    
SELECT * FROM product_details;


