CREATE TABLE kotimainen_osoite (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  katu_fi varchar(100),
  katu_sv varchar(100),
  katunumero integer NOT NULL,
  porraskirjain char(1),
  huoneistonumero integer,
  jakokirjain char(1),
  postinumero char(5) NOT NULL,
  postitoimipaikka_fi varchar(100),
  postitoimipaikka_sv varchar(100)
);

CREATE TABLE ulkomainen_osoite (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  lahiosoite varchar(100) NOT NULL,
  paikkakunta varchar(100) NOT NULL,
  valtio_fi varchar(100),
  valtio_sv varchar(100)
);

CREATE TABLE huoltaja (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  henkilotunnus char(11) NOT NULL UNIQUE,
  etunimet varchar(100) NOT NULL,
  sukunimi varchar(100) NOT NULL
);

CREATE TABLE henkilo (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  henkilotunnus char(11) NOT NULL UNIQUE,
  turvakielto boolean NOT NULL DEFAULT false,
  sukupuoli enum('MIES', 'NAINEN'),
  etunimet varchar(100) NOT NULL,
  kutsumanimi varchar(100),
  sukunimi varchar(100) NOT NULL,
  aidinkieli char(2) NOT NULL DEFAULT 'fi',
  kansalaisuus char(3) NOT NULL,
  sahkoposti varchar(100),
  kotimainen_osoite_id integer,
  kotimainen_postiosoite_id integer,
  ulkomainen_osoite_id integer,
  ulkomainen_postiosoite_id integer,
  kotikunta char(3),
  FOREIGN KEY (kotimainen_osoite_id) REFERENCES kotimainen_osoite (id),
  FOREIGN KEY (kotimainen_postiosoite_id) REFERENCES kotimainen_osoite (id),
  FOREIGN KEY (ulkomainen_osoite_id) REFERENCES ulkomainen_osoite (id),
  FOREIGN KEY (ulkomainen_postiosoite_id) REFERENCES ulkomainen_osoite (id)
);

CREATE TABLE henkilo_huoltaja (
  huoltaja_id integer NOT NULL,
  huollettava_id integer NOT NULL,
  PRIMARY KEY (huoltaja_id, huollettava_id),
  FOREIGN KEY (huoltaja_id) REFERENCES henkilo (id),
  FOREIGN KEY (huollettava_id) REFERENCES henkilo (id)
)
