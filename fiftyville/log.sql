-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Theft took place on July 28
-- Theft took place on Humphrey Street

-- Description of the crime scene on July 28th on Humphrey Street
.table
.schema crime_scene_reports
SELECT description FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = 'Humphrey Street';
-- Answer = Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the bakery.
Littering took place at 16:36. No known witnesses.

-- Names of interviews on July 28th
SELECT name FROM interviews WHERE month = 7 AND day = 28;

-- Transcript of each interview
SELECT transcript FROM interviews WHERE month = 7 AND day = 28 AND name = '[name]';
-- Answer = Ruth, Raymond are witnesses

-- ID of the airport in the city of Fiftyville
SELECT id FROM airports WHERE city = 'Fiftyville'; 
-- Answer = 8

-- IDs of destination airports on July 29th
SELECT destination_airport_id FROM flights WHERE origin_airport_id = 8 AND month = 7 AND day = 29;
-- Answer = 6, 11, 4, 1, 9

-- Hours of flights leaving Fiftyville on July 29th
SELECT hour FROM flights WHERE origin_airport_id = 8 AND month = 7 AND day = 29;
-- Answer = 8 is the earliest hour

-- Destination travel ID of the thief
SELECT destination_airport_id FROM flights WHERE origin_airport_id = 8 AND month = 7 AND day = 29 AND hour = 8;
-- Answer = 4

-- City where the thief went
SELECT city FROM airports WHERE id = 4;
-- Answer = New York City | city where the thief fled

-- License plates of cars that passed in front of the bakery at 10 am in the first 10 minutes
SELECT license_plate, minute FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10;
--Answer = 5P2BI95|16 94KL13X|18 6P58WS2|18 4328GD8|19 G412CB7|20 L93JTIZ|21 322W7JE|23 0NTHK55|23

-- Names of the plates
SELECT name FROM people WHERE license_plate = '[license plate]';
-- Answer = 5P2BI95(Vanessa), 94KL13X(Bruce), 6P58WS2(Barry), 4328GD8(Luca), G412CB7(Sofia), L93JTIZ(Iman), 322W7JE(Diana), and 0NTHK55(Kelsey)

-- Calls on July 28th that lasted less than 1 minute
SELECt caller, receiver FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60;
-- Answer = (130) 555-0289|(996) 555-8899
-- (499) 555-9472|(892) 555-8872
-- (367) 555-5533|(375) 555-8161
-- (499) 555-9472|(717) 555-1342
-- (286) 555-6063|(676) 555-6554
-- (770) 555-1861|(725) 555-3243
-- (031) 555-6622|(910) 555-3251
-- (826) 555-1652|(066) 555-9701
-- (338) 555-6650|(704) 555-2131

-- Phone numbers of people whose plates were seen
SELECT phone_number FROM people WHERE name = '[name]';
-- A = Vanessa (725) 555-4692 x | Bruce (367) 555-5533 | Barry (301) 555-4174 x
-- Luca (389) 555-5198 x | Sofia (130) 555-0289 x | Iman (829) 555-5269 x
-- Diana (770) 555-1861 | Kelsey (499) 555-9472
-- The killer is either Bruce or Diana or Kelsey

-- Passports of the 3
SELECT passport_number FROM people WHERE name = '[name]';
--A = 5773159633 Bruce | 3592750733 Diana | 8294398571 Kelsey

-- Flight IDs of the suspects
SELECT flight_id FROM passengers WHERE passport_number = [passport];
-- A = Bruce 36 | Diana  18, 24, 54 | Kelsey 36

-- Flight ID
SELECT id FROM flights WHERE origin_airport_id = 8 AND destination_airport_id = 4;
--  A =10 | 17 | 35 | 36 (either Bruce or Kelsey) | 55

-- considering the people Bruce and Kelsey called
-- Bruce's call (375) 555-8161
-- Kelsey's call (717) 555-1342

-- Names of the calls of the suspects and their IDs
SELECT name FROM people WHERE phone_number = '[number]';
-- Answer: (375) 555-8161 Robin 864400 | (717) 555-1342 Melissa 626361

-- account_number of each friend of the suspects
SELECT account_number FROM bank_accounts WHERE person_id = [id];
-- A = robin 94751264
--melissa has none
--Therefore, Bruce is the killer and Robin helped

--thief = Bruce
--City = New York City
--Thief's accomplice = Robin
