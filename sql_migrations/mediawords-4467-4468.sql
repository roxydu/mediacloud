--
-- This is a Media Cloud PostgreSQL schema difference file (a "diff") between schema
-- versions 4467 and 4468.
--
-- If you are running Media Cloud with a database that was set up with a schema version
-- 4467, and you would like to upgrade both the Media Cloud and the
-- database to be at version 4468, import this SQL file:
--
--     psql mediacloud < mediawords-4467-4468.sql
--
-- You might need to import some additional schema diff files to reach the desired version.
--

--
-- 1 of 2. Import the output of 'apgdiff':
--

SET search_path = public, pg_catalog;

ALTER TABLE downloads
	DROP CONSTRAINT downloads_feed_id_valid;

ALTER TABLE downloads
	DROP CONSTRAINT downloads_story;

DROP INDEX downloads_spider_urls;

DROP INDEX downloads_spider_download_errors_to_clear;

DROP INDEX downloads_queued_spider;

CREATE OR REPLACE FUNCTION set_database_schema_version() RETURNS boolean AS $$
DECLARE
    
    -- Database schema version number (same as a SVN revision number)
    -- Increase it by 1 if you make major database schema changes.
    MEDIACLOUD_DATABASE_SCHEMA_VERSION CONSTANT INT := 4468;
    
BEGIN

    -- Update / set database schema version
    DELETE FROM database_variables WHERE name = 'database-schema-version';
    INSERT INTO database_variables (name, value) VALUES ('database-schema-version', MEDIACLOUD_DATABASE_SCHEMA_VERSION::int);

    return true;
    
END;
$$
LANGUAGE 'plpgsql';

ALTER TABLE downloads
	ADD CONSTRAINT downloads_feed_id_valid check (feeds_id is not null);

ALTER TABLE downloads
	ADD CONSTRAINT downloads_story check (((type = 'feed') and stories_id is null) or (stories_id is not null));

ALTER TABLE downloads add constraint valid_download_type check( type NOT in ( 'spider_blog_home','spider_posting','spider_rss','spider_blog_friends_list','spider_validation_blog_home','spider_validation_rss','archival_only') );

--
-- 2 of 2. Reset the database version.
--
SELECT set_database_schema_version();
