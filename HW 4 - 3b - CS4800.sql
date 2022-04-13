
CREATE TABLE question3HW4.address (
                address_id INTEGER NOT NULL,
                telephone VARCHAR NOT NULL,
                number VARCHAR NOT NULL,
                street_1 VARCHAR NOT NULL,
                street_2 VARCHAR NOT NULL,
                zipcode VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                CONSTRAINT address_id PRIMARY KEY (address_id)
);


CREATE TABLE question3HW4.musician (
                ssn INTEGER NOT NULL,
                address_id_fk INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT musician_ssn PRIMARY KEY (ssn)
);


CREATE TABLE question3HW4.album (
                album_id INTEGER NOT NULL,
                musician_producer_ssn INTEGER NOT NULL,
                release_date VARCHAR NOT NULL,
                format VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                age INTEGER NOT NULL,
                CONSTRAINT album_id PRIMARY KEY (album_id)
);


CREATE TABLE question3HW4.song (
                title VARCHAR NOT NULL,
                musician_author_ssn INTEGER NOT NULL,
                album_id INTEGER NOT NULL,
                length INTEGER NOT NULL,
                CONSTRAINT song_title PRIMARY KEY (title)
);


CREATE TABLE question3HW4.musician_performs_song (
                ssn INTEGER NOT NULL,
                song_title VARCHAR NOT NULL,
                CONSTRAINT musician_performs_song_pk PRIMARY KEY (ssn, song_title)
);


CREATE TABLE question3HW4.instrument (
                name VARCHAR NOT NULL,
                pitch REAL NOT NULL,
                CONSTRAINT instrument_name PRIMARY KEY (name)
);


CREATE TABLE question3HW4.instrument_song (
                instrument_name VARCHAR NOT NULL,
                song_title VARCHAR NOT NULL,
                CONSTRAINT ins_song_pk PRIMARY KEY (instrument_name, song_title)
);


CREATE TABLE question3HW4.musician_instrument (
                musician_ssn_fk INTEGER NOT NULL,
                instrument_name VARCHAR NOT NULL,
                CONSTRAINT mus_ins_pk PRIMARY KEY (musician_ssn_fk, instrument_name)
);


ALTER TABLE question3HW4.musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (address_id_fk)
REFERENCES question3HW4.address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.musician_instrument ADD CONSTRAINT musician_musician_instrument_fk
FOREIGN KEY (musician_ssn_fk)
REFERENCES question3HW4.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.musician_performs_song ADD CONSTRAINT musician_musician_performs_song_fk
FOREIGN KEY (ssn)
REFERENCES question3HW4.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (musician_author_ssn)
REFERENCES question3HW4.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (musician_producer_ssn)
REFERENCES question3HW4.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.song ADD CONSTRAINT album_song_fk
FOREIGN KEY (album_id)
REFERENCES question3HW4.album (album_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.instrument_song ADD CONSTRAINT song_instrument_song_fk
FOREIGN KEY (song_title)
REFERENCES question3HW4.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.musician_performs_song ADD CONSTRAINT song_musician_performs_song_fk
FOREIGN KEY (song_title)
REFERENCES question3HW4.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.musician_instrument ADD CONSTRAINT instrument_musician_instrument_fk
FOREIGN KEY (instrument_name)
REFERENCES question3HW4.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE question3HW4.instrument_song ADD CONSTRAINT instrument_instrument_song_fk
FOREIGN KEY (instrument_name)
REFERENCES question3HW4.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
