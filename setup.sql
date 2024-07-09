-- Create the role with login capability and a secure password
CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres';

-- Grant superuser privileges to the role
ALTER ROLE postgres WITH SUPERUSER;
