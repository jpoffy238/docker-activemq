drop sequenece if exists person_id;
create sequence person_id start 1;

drop index if exists idpidx;
drop index if exists keyidx;
DROP TABLE if exists person;
CREATE TABLE "public"."person"
(
   key text,
   id integer  default nextval('person_id'),
   hcpid int,
   last_name text,
   first_name text,
   ssn text,
   address text,
   zip text,
   email_address text,
   create_timestamp timestamp DEFAULT now(),
   update_timestamp timestamp default now(),
   dob text
)
;

create unique index idpidx on person (id);
create index keyidx on person(key);
