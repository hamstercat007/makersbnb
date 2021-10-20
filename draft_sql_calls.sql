SELECT * FROM venues WHERE host_user_id = '7';

SELECT * from bookings WHERE venue_id = '90' AND confirmed = '0';

SELECT * from bookings WHERE confirmed = '0';

And where confirmed = 0


# change to display all venues that also have bookings with 0 in confirmed column

SELECT * FROM venues, bookings WHERE venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND bookings.confirmed::INTEGER <> 1;

draft sql - this will give me all requested bookings
SELECT * FROM venues WHERE venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND bookings.confirmed::INTEGER = 0;

SELECT * FROM venues LEFT JOIN bookings ON venues.venue_id::INTEGER = bookings.venue_id::INTEGER:

SELECT * FROM venues WHERE venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND bookings.confirmed::INTEGER = 0;

SELECT * FROM venues WHERE venue_id IN (SELECT * FROM bookings WHERE confirmed::INTEGER = 0)

Example sql
"SELECT * FROM venues, bookings WHERE host_user_id = '#{@user_id}' AND venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND confirmed::INTEGER = 0;"