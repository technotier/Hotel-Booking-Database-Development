create database hotel_booking;

use hotel_booking;

CREATE TABLE guest (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email_address VARCHAR(350),
    phone_number VARCHAR(20),
    CONSTRAINT pk_guest PRIMARY KEY (id)
);

CREATE TABLE payment_status (
    id INT AUTO_INCREMENT,
    payment_status_name VARCHAR(50),
    CONSTRAINT pk_paystatus PRIMARY KEY (id)
);

CREATE TABLE booking (
    id INT AUTO_INCREMENT,
    guest_id INT,
    payment_status_id INT,
    checkin_date DATE,
    checkout_date DATE,
    num_of_adults INT,
    num_of_children INT,
    booking_amount INT,
    CONSTRAINT pk_booking PRIMARY KEY (id),
    CONSTRAINT fk_booking_guest FOREIGN KEY (guest_id)
        REFERENCES guest (id),
    CONSTRAINT fk_booking_paystatus FOREIGN KEY (payment_status_id)
        REFERENCES payment_status (id)
);

CREATE TABLE addon (
    id INT AUTO_INCREMENT,
    addon_name VARCHAR(100),
    price INT,
    CONSTRAINT pk_addon PRIMARY KEY (id)
);

CREATE TABLE booking_addon (
    booking_id INT,
    addon_id INT,
    CONSTRAINT fk_bkaddon_booking FOREIGN KEY (booking_id)
        REFERENCES booking (id),
    CONSTRAINT fk_bkaddon_addon FOREIGN KEY (addon_id)
        REFERENCES addon (id)
);

CREATE TABLE bed_type (
    id INT AUTO_INCREMENT,
    bed_type_name VARCHAR(50),
    CONSTRAINT pk_bedtype PRIMARY KEY (id)
);

CREATE TABLE room_class (
    id INT AUTO_INCREMENT,
    class_name VARCHAR(100),
    base_price INT,
    CONSTRAINT pk_addon PRIMARY KEY (id)
);

CREATE TABLE feature (
    id INT AUTO_INCREMENT,
    feature_name VARCHAR(100),
    CONSTRAINT pk_addon PRIMARY KEY (id)
);

CREATE TABLE room_class_feature (
    room_class_id INT,
    feature_id INT,
    CONSTRAINT fk_rmclsft_roomclass FOREIGN KEY (room_class_id)
        REFERENCES room_class (id),
    CONSTRAINT fk_rmclsft_feature FOREIGN KEY (feature_id)
        REFERENCES feature (id)
);

CREATE TABLE room_class_bed_type (
    id INT AUTO_INCREMENT,
    room_class_id INT,
    bed_type_id INT,
    num_beds INT,
    CONSTRAINT pk_room_class_bed_type PRIMARY KEY (id),
    CONSTRAINT fk_room_class_bed_type_room_class FOREIGN KEY (room_class_id)
        REFERENCES room_class (id),
    CONSTRAINT fk_room_class_bed_type_bed_type FOREIGN KEY (bed_type_id)
        REFERENCES bed_type (id)
);

CREATE TABLE room_status (
    id INT AUTO_INCREMENT,
    status_name VARCHAR(100),
    CONSTRAINT pk_addon PRIMARY KEY (id)
);

CREATE TABLE floor (
    id INT AUTO_INCREMENT,
    floor_number VARCHAR(5),
    CONSTRAINT pk_addon PRIMARY KEY (id)
);

CREATE TABLE room (
    id INT AUTO_INCREMENT,
    floor_id INT,
    room_class_id INT,
    status_id INT,
    room_number VARCHAR(10),
    CONSTRAINT pk_addon PRIMARY KEY (id),
    CONSTRAINT fk_room_floor FOREIGN KEY (floor_id)
        REFERENCES floor (id),
    CONSTRAINT fk_room_roomclass FOREIGN KEY (room_class_id)
        REFERENCES room_class (id),
    CONSTRAINT fk_room_status FOREIGN KEY (status_id)
        REFERENCES room_status (id)
);

CREATE TABLE booking_room (
    booking_id INT,
    room_id INT,
    CONSTRAINT fk_bkroom_booking FOREIGN KEY (booking_id)
        REFERENCES booking (id),
    CONSTRAINT fk_bkroom_room FOREIGN KEY (room_id)
        REFERENCES room (id)
);


























