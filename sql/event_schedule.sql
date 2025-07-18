CREATE TABLE EVENTSCHEDULE (
	event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATE,
    event_datetime DATETIME,
    event_timestamp TIMESTAMP,
    event_time TIME,
    event_year YEAR
);

INSERT INTO EVENTSCHEDULE (event_date, event_datetime, event_timestamp, event_time, event_year)
VALUES 
('2025-01-16', '2025-01-16 14:30:00', '2025-01-16 14:30:00', '14:30:00', 2025),
('2025-05-10', '2025-05-10 09:00:00', '2025-05-10 09:30:00', '09:00:00', 2025),
('2026-11-20', '2026-11-20 18:45:00', '2026-11-20 18:45:00', '18:45:00', 2026);

SELECT * FROM EventSchedule;