-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/BBrTuG
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "VIOLATIONS" (
    "VIOLATION_CODE" varchar   NOT NULL,
    "VIOLATION_DESCRIPTION" varchar   NOT NULL,
    CONSTRAINT "pk_VIOLATIONS" PRIMARY KEY (
        "VIOLATION_CODE"
     )
);

CREATE TABLE "BORO_ZIP" (
    "ZIPCODE" int   NOT NULL,
    "CAMIS" int   NOT NULL,
    "BORO" varchar   NOT NULL,
    CONSTRAINT "pk_BORO_ZIP" PRIMARY KEY (
        "ZIPCODE"
     )
);

CREATE TABLE "Restaurant" (
    "CAMIS" int   NOT NULL,
    "DBA" varchar   NOT NULL,
    "BORO" varchar   NOT NULL,
    "ZIPCODE" int   NOT NULL,
    "CUISINE" varchar   NOT NULL,
    "GRADE" text   NOT NULL,
    CONSTRAINT "pk_Restaurant" PRIMARY KEY (
        "CAMIS"
     )
);

CREATE TABLE "Inspections" (
    "CAMIS" int   NOT NULL,
    "VIOLATION_CODE" varchar   NOT NULL,
    "ZIPCODE" int   NOT NULL,
    "INSPECTION_DATE" date   NOT NULL,
    CONSTRAINT "pk_Inspections" PRIMARY KEY (
        "CAMIS"
     )
);

CREATE TABLE "GEO_LOCATION" (
    "CAMIS" int   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longtitude" float   NOT NULL,
    CONSTRAINT "pk_GEO_LOCATION" PRIMARY KEY (
        "CAMIS"
     )
);

CREATE TABLE "RAT" (
    "ZIPCODE" int   NOT NULL,
    "NUMBER_RAT_FINDINGS" int   NOT NULL,
    CONSTRAINT "pk_RAT" PRIMARY KEY (
        "ZIPCODE"
     )
);

ALTER TABLE "Restaurant" ADD CONSTRAINT "fk_Restaurant_CAMIS" FOREIGN KEY("CAMIS")
REFERENCES "Inspections" ("CAMIS");

ALTER TABLE "Inspections" ADD CONSTRAINT "fk_Inspections_VIOLATION_CODE" FOREIGN KEY("VIOLATION_CODE")
REFERENCES "VIOLATIONS" ("VIOLATION_CODE");

ALTER TABLE "Inspections" ADD CONSTRAINT "fk_Inspections_ZIPCODE" FOREIGN KEY("ZIPCODE")
REFERENCES "Restaurant" ("ZIPCODE");

ALTER TABLE "GEO_LOCATION" ADD CONSTRAINT "fk_GEO_LOCATION_CAMIS" FOREIGN KEY("CAMIS")
REFERENCES "Inspections" ("CAMIS");

ALTER TABLE "RAT" ADD CONSTRAINT "fk_RAT_ZIPCODE" FOREIGN KEY("ZIPCODE")
REFERENCES "BORO_ZIP" ("ZIPCODE");

