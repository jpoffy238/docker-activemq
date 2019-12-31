
drop sequenece audit_id; 
create sequence audit_id start 1;
drop index idaidx ;
drop index correlation_key_idx;
drop table audit;

CREATE TABLE "public"."audit"
(
   correlation_key text,
   id integer  default nextval('audit_id'),
   hcpid text,
   state text,
   message text,
   create_timestamp timestamp DEFAULT now(),
   key text
)
;

create unique index idaidx on audit (id);
create index correlation_key_idx on audit(correlation_key);
