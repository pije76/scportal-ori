--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE auth_group OWNER TO portal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO portal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO portal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO portal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO portal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO portal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO portal;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO portal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO portal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO portal;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO portal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO portal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE celery_taskmeta OWNER TO portal;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_taskmeta_id_seq OWNER TO portal;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE celery_taskmeta_id_seq OWNED BY celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE celery_tasksetmeta OWNER TO portal;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_tasksetmeta_id_seq OWNER TO portal;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE celery_tasksetmeta_id_seq OWNED BY celery_tasksetmeta.id;


--
-- Name: co2conversions_co2conversion; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE co2conversions_co2conversion (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    mainconsumption_id integer NOT NULL
);


ALTER TABLE co2conversions_co2conversion OWNER TO portal;

--
-- Name: co2conversions_co2conversion_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE co2conversions_co2conversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE co2conversions_co2conversion_id_seq OWNER TO portal;

--
-- Name: co2conversions_co2conversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE co2conversions_co2conversion_id_seq OWNED BY co2conversions_co2conversion.id;


--
-- Name: co2conversions_dynamicco2conversion; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE co2conversions_dynamicco2conversion (
    co2conversion_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE co2conversions_dynamicco2conversion OWNER TO portal;

--
-- Name: co2conversions_fixedco2conversion; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE co2conversions_fixedco2conversion (
    co2conversion_ptr_id integer NOT NULL,
    value numeric(12,3) NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE co2conversions_fixedco2conversion OWNER TO portal;

--
-- Name: condensing_fiveminuteaccumulateddata; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE condensing_fiveminuteaccumulateddata (
    id integer NOT NULL,
    datasource_id integer NOT NULL,
    value bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE condensing_fiveminuteaccumulateddata OWNER TO portal;

--
-- Name: condensing_fiveminuteaccumulateddata_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE condensing_fiveminuteaccumulateddata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE condensing_fiveminuteaccumulateddata_id_seq OWNER TO portal;

--
-- Name: condensing_fiveminuteaccumulateddata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE condensing_fiveminuteaccumulateddata_id_seq OWNED BY condensing_fiveminuteaccumulateddata.id;


--
-- Name: condensing_houraccumulateddata; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE condensing_houraccumulateddata (
    id integer NOT NULL,
    datasource_id integer NOT NULL,
    value bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE condensing_houraccumulateddata OWNER TO portal;

--
-- Name: condensing_houraccumulateddata_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE condensing_houraccumulateddata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE condensing_houraccumulateddata_id_seq OWNER TO portal;

--
-- Name: condensing_houraccumulateddata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE condensing_houraccumulateddata_id_seq OWNED BY condensing_houraccumulateddata.id;


--
-- Name: consumptions_consumption; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_consumption (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    unit character varying(100) NOT NULL,
    volumetoenergyconversion_id integer
);


ALTER TABLE consumptions_consumption OWNER TO portal;

--
-- Name: consumptions_consumption_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_consumption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_consumption_id_seq OWNER TO portal;

--
-- Name: consumptions_consumption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_consumption_id_seq OWNED BY consumptions_consumption.id;


--
-- Name: consumptions_consumptiongroup; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_consumptiongroup (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    from_date date NOT NULL,
    to_date date,
    customer_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    cost_compensation_id integer,
    mainconsumption_id integer NOT NULL
);


ALTER TABLE consumptions_consumptiongroup OWNER TO portal;

--
-- Name: consumptions_consumptiongroup_consumptions; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_consumptiongroup_consumptions (
    id integer NOT NULL,
    consumptiongroup_id integer NOT NULL,
    consumption_id integer NOT NULL
);


ALTER TABLE consumptions_consumptiongroup_consumptions OWNER TO portal;

--
-- Name: consumptions_consumptiongroup_consumptions_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_consumptiongroup_consumptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_consumptiongroup_consumptions_id_seq OWNER TO portal;

--
-- Name: consumptions_consumptiongroup_consumptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_consumptiongroup_consumptions_id_seq OWNED BY consumptions_consumptiongroup_consumptions.id;


--
-- Name: consumptions_consumptiongroup_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_consumptiongroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_consumptiongroup_id_seq OWNER TO portal;

--
-- Name: consumptions_consumptiongroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_consumptiongroup_id_seq OWNED BY consumptions_consumptiongroup.id;


--
-- Name: consumptions_mainconsumption; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_mainconsumption (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    from_date date NOT NULL,
    to_date date,
    customer_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    cost_compensation_id integer,
    utility_type integer NOT NULL,
    tariff_id integer
);


ALTER TABLE consumptions_mainconsumption OWNER TO portal;

--
-- Name: consumptions_mainconsumption_consumptions; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_mainconsumption_consumptions (
    id integer NOT NULL,
    mainconsumption_id integer NOT NULL,
    consumption_id integer NOT NULL
);


ALTER TABLE consumptions_mainconsumption_consumptions OWNER TO portal;

--
-- Name: consumptions_mainconsumption_consumptions_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_mainconsumption_consumptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_mainconsumption_consumptions_id_seq OWNER TO portal;

--
-- Name: consumptions_mainconsumption_consumptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_mainconsumption_consumptions_id_seq OWNED BY consumptions_mainconsumption_consumptions.id;


--
-- Name: consumptions_mainconsumption_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_mainconsumption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_mainconsumption_id_seq OWNER TO portal;

--
-- Name: consumptions_mainconsumption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_mainconsumption_id_seq OWNED BY consumptions_mainconsumption.id;


--
-- Name: consumptions_nonpulseperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_nonpulseperiod (
    period_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE consumptions_nonpulseperiod OWNER TO portal;

--
-- Name: consumptions_offlinetolerance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_offlinetolerance (
    id integer NOT NULL,
    hours integer NOT NULL,
    datasequence_id integer NOT NULL,
    CONSTRAINT consumptions_offlinetolerance_hours_check CHECK ((hours >= 0))
);


ALTER TABLE consumptions_offlinetolerance OWNER TO portal;

--
-- Name: consumptions_offlinetolerance_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_offlinetolerance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_offlinetolerance_id_seq OWNER TO portal;

--
-- Name: consumptions_offlinetolerance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_offlinetolerance_id_seq OWNED BY consumptions_offlinetolerance.id;


--
-- Name: consumptions_period; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_period (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL
);


ALTER TABLE consumptions_period OWNER TO portal;

--
-- Name: consumptions_period_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE consumptions_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumptions_period_id_seq OWNER TO portal;

--
-- Name: consumptions_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE consumptions_period_id_seq OWNED BY consumptions_period.id;


--
-- Name: consumptions_pulseperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_pulseperiod (
    period_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL,
    pulse_quantity integer NOT NULL,
    output_quantity integer NOT NULL,
    output_unit character varying(100) NOT NULL
);


ALTER TABLE consumptions_pulseperiod OWNER TO portal;

--
-- Name: consumptions_singlevalueperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE consumptions_singlevalueperiod (
    period_ptr_id integer NOT NULL,
    value bigint NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE consumptions_singlevalueperiod OWNER TO portal;

--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE corsheaders_corsmodel OWNER TO portal;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corsheaders_corsmodel_id_seq OWNER TO portal;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- Name: cost_compensations_costcompensation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE cost_compensations_costcompensation (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE cost_compensations_costcompensation OWNER TO portal;

--
-- Name: cost_compensations_costcompensation_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE cost_compensations_costcompensation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cost_compensations_costcompensation_id_seq OWNER TO portal;

--
-- Name: cost_compensations_costcompensation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE cost_compensations_costcompensation_id_seq OWNED BY cost_compensations_costcompensation.id;


--
-- Name: cost_compensations_fixedcompensationperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE cost_compensations_fixedcompensationperiod (
    period_ptr_id integer NOT NULL,
    value numeric(12,3) NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE cost_compensations_fixedcompensationperiod OWNER TO portal;

--
-- Name: cost_compensations_period; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE cost_compensations_period (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL
);


ALTER TABLE cost_compensations_period OWNER TO portal;

--
-- Name: cost_compensations_period_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE cost_compensations_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cost_compensations_period_id_seq OWNER TO portal;

--
-- Name: cost_compensations_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE cost_compensations_period_id_seq OWNED BY cost_compensations_period.id;


--
-- Name: customer_datasources_customerdatasource; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customer_datasources_customerdatasource (
    datasource_ptr_id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE customer_datasources_customerdatasource OWNER TO portal;

--
-- Name: customers_collection; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_collection (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    parent_id integer,
    name text NOT NULL,
    billing_meter_number character varying(20) NOT NULL,
    billing_installation_number character varying(20) NOT NULL,
    role integer NOT NULL,
    utility_type integer NOT NULL,
    gauge_lower_threshold numeric(10,2),
    gauge_upper_threshold numeric(10,2),
    gauge_min numeric(10,2),
    gauge_max numeric(10,2),
    gauge_preferred_unit character varying(50),
    gauge_colours integer,
    relay_id integer,
    hidden_on_details_page boolean NOT NULL,
    hidden_on_reports_page boolean NOT NULL,
    comment text NOT NULL,
    image character varying(100),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT customers_collection_gauge_colours_check CHECK ((gauge_colours >= 0)),
    CONSTRAINT customers_collection_level_check CHECK ((level >= 0)),
    CONSTRAINT customers_collection_lft_check CHECK ((lft >= 0)),
    CONSTRAINT customers_collection_rght_check CHECK ((rght >= 0)),
    CONSTRAINT customers_collection_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE customers_collection OWNER TO portal;

--
-- Name: customers_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE customers_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_collection_id_seq OWNER TO portal;

--
-- Name: customers_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE customers_collection_id_seq OWNED BY customers_collection.id;


--
-- Name: customers_customer; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_customer (
    encryption_data_initialization_vector text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    id integer NOT NULL,
    provider_id integer NOT NULL,
    name text NOT NULL,
    vat text NOT NULL,
    address text NOT NULL,
    postal_code text NOT NULL,
    city text NOT NULL,
    phone text NOT NULL,
    country_code text NOT NULL,
    timezone character varying(64) NOT NULL,
    contact_name text NOT NULL,
    contact_email text NOT NULL,
    contact_phone text NOT NULL,
    electricity_instantaneous character varying(50) NOT NULL,
    electricity_consumption character varying(50) NOT NULL,
    gas_instantaneous character varying(50) NOT NULL,
    gas_consumption character varying(50) NOT NULL,
    water_instantaneous character varying(50) NOT NULL,
    water_consumption character varying(50) NOT NULL,
    heat_instantaneous character varying(50) NOT NULL,
    heat_consumption character varying(50) NOT NULL,
    temperature character varying(50) NOT NULL,
    oil_instantaneous character varying(50) NOT NULL,
    oil_consumption character varying(50) NOT NULL,
    currency_unit character varying(100) NOT NULL,
    electricity_tariff_id integer,
    gas_tariff_id integer,
    water_tariff_id integer,
    heat_tariff_id integer,
    oil_tariff_id integer,
    is_active boolean NOT NULL,
    production_a_unit text NOT NULL,
    production_b_unit text NOT NULL,
    production_c_unit text NOT NULL,
    production_d_unit text NOT NULL,
    production_e_unit text NOT NULL,
    created_by_id integer
);


ALTER TABLE customers_customer OWNER TO portal;

--
-- Name: customers_customer_industry_types; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_customer_industry_types (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    industrytype_id integer NOT NULL
);


ALTER TABLE customers_customer_industry_types OWNER TO portal;

--
-- Name: customers_customer_industry_types_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE customers_customer_industry_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_customer_industry_types_id_seq OWNER TO portal;

--
-- Name: customers_customer_industry_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE customers_customer_industry_types_id_seq OWNED BY customers_customer_industry_types.id;


--
-- Name: customers_location; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_location (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    parent_id integer,
    name text NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT customers_location_level_check CHECK ((level >= 0)),
    CONSTRAINT customers_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT customers_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT customers_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE customers_location OWNER TO portal;

--
-- Name: customers_location_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE customers_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_location_id_seq OWNER TO portal;

--
-- Name: customers_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE customers_location_id_seq OWNED BY customers_location.id;


--
-- Name: customers_userprofile; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_userprofile (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE customers_userprofile OWNER TO portal;

--
-- Name: customers_userprofile_collections; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE customers_userprofile_collections (
    id integer NOT NULL,
    userprofile_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE customers_userprofile_collections OWNER TO portal;

--
-- Name: customers_userprofile_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE customers_userprofile_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_userprofile_collections_id_seq OWNER TO portal;

--
-- Name: customers_userprofile_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE customers_userprofile_collections_id_seq OWNED BY customers_userprofile_collections.id;


--
-- Name: customers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE customers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_userprofile_id_seq OWNER TO portal;

--
-- Name: customers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE customers_userprofile_id_seq OWNED BY customers_userprofile.id;


--
-- Name: datahub_datahubconnection; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datahub_datahubconnection (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    meter_id integer NOT NULL,
    input_id integer NOT NULL,
    customer_meter_number character varying(50) NOT NULL,
    authorization_id character varying(10),
    start_date date,
    end_date date,
    unit character varying(50) NOT NULL
);


ALTER TABLE datahub_datahubconnection OWNER TO portal;

--
-- Name: datahub_datahubconnection_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datahub_datahubconnection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_datahubconnection_id_seq OWNER TO portal;

--
-- Name: datahub_datahubconnection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datahub_datahubconnection_id_seq OWNED BY datahub_datahubconnection.id;


--
-- Name: dataneeds_dataneed; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE dataneeds_dataneed (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE dataneeds_dataneed OWNER TO portal;

--
-- Name: dataneeds_dataneed_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE dataneeds_dataneed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dataneeds_dataneed_id_seq OWNER TO portal;

--
-- Name: dataneeds_dataneed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE dataneeds_dataneed_id_seq OWNED BY dataneeds_dataneed.id;


--
-- Name: dataneeds_energyusedataneed; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE dataneeds_energyusedataneed (
    dataneed_ptr_id integer NOT NULL,
    energyuse_id integer NOT NULL
);


ALTER TABLE dataneeds_energyusedataneed OWNER TO portal;

--
-- Name: dataneeds_mainconsumptiondataneed; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE dataneeds_mainconsumptiondataneed (
    dataneed_ptr_id integer NOT NULL,
    mainconsumption_id integer NOT NULL
);


ALTER TABLE dataneeds_mainconsumptiondataneed OWNER TO portal;

--
-- Name: dataneeds_productiongroupdataneed; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE dataneeds_productiongroupdataneed (
    dataneed_ptr_id integer NOT NULL,
    productiongroup_id integer NOT NULL
);


ALTER TABLE dataneeds_productiongroupdataneed OWNER TO portal;

--
-- Name: datasequence_adapters_consumptionaccumulationadapter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequence_adapters_consumptionaccumulationadapter (
    dataseries_ptr_id integer NOT NULL,
    datasequence_id integer NOT NULL
);


ALTER TABLE datasequence_adapters_consumptionaccumulationadapter OWNER TO portal;

--
-- Name: datasequence_adapters_nonaccumulationadapter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequence_adapters_nonaccumulationadapter (
    dataseries_ptr_id integer NOT NULL,
    datasequence_id integer NOT NULL
);


ALTER TABLE datasequence_adapters_nonaccumulationadapter OWNER TO portal;

--
-- Name: datasequence_adapters_productionaccumulationadapter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequence_adapters_productionaccumulationadapter (
    dataseries_ptr_id integer NOT NULL,
    datasequence_id integer NOT NULL
);


ALTER TABLE datasequence_adapters_productionaccumulationadapter OWNER TO portal;

--
-- Name: datasequences_energypervolumedatasequence; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequences_energypervolumedatasequence (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE datasequences_energypervolumedatasequence OWNER TO portal;

--
-- Name: datasequences_energypervolumedatasequence_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasequences_energypervolumedatasequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasequences_energypervolumedatasequence_id_seq OWNER TO portal;

--
-- Name: datasequences_energypervolumedatasequence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasequences_energypervolumedatasequence_id_seq OWNED BY datasequences_energypervolumedatasequence.id;


--
-- Name: datasequences_energypervolumeperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequences_energypervolumeperiod (
    id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE datasequences_energypervolumeperiod OWNER TO portal;

--
-- Name: datasequences_energypervolumeperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasequences_energypervolumeperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasequences_energypervolumeperiod_id_seq OWNER TO portal;

--
-- Name: datasequences_energypervolumeperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasequences_energypervolumeperiod_id_seq OWNED BY datasequences_energypervolumeperiod.id;


--
-- Name: datasequences_nonaccumulationdatasequence; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequences_nonaccumulationdatasequence (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE datasequences_nonaccumulationdatasequence OWNER TO portal;

--
-- Name: datasequences_nonaccumulationdatasequence_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasequences_nonaccumulationdatasequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasequences_nonaccumulationdatasequence_id_seq OWNER TO portal;

--
-- Name: datasequences_nonaccumulationdatasequence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasequences_nonaccumulationdatasequence_id_seq OWNED BY datasequences_nonaccumulationdatasequence.id;


--
-- Name: datasequences_nonaccumulationofflinetolerance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequences_nonaccumulationofflinetolerance (
    id integer NOT NULL,
    hours integer NOT NULL,
    datasequence_id integer NOT NULL,
    CONSTRAINT datasequences_nonaccumulationofflinetolerance_hours_check CHECK ((hours >= 0))
);


ALTER TABLE datasequences_nonaccumulationofflinetolerance OWNER TO portal;

--
-- Name: datasequences_nonaccumulationofflinetolerance_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasequences_nonaccumulationofflinetolerance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasequences_nonaccumulationofflinetolerance_id_seq OWNER TO portal;

--
-- Name: datasequences_nonaccumulationofflinetolerance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasequences_nonaccumulationofflinetolerance_id_seq OWNED BY datasequences_nonaccumulationofflinetolerance.id;


--
-- Name: datasequences_nonaccumulationperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasequences_nonaccumulationperiod (
    id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE datasequences_nonaccumulationperiod OWNER TO portal;

--
-- Name: datasequences_nonaccumulationperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasequences_nonaccumulationperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasequences_nonaccumulationperiod_id_seq OWNER TO portal;

--
-- Name: datasequences_nonaccumulationperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasequences_nonaccumulationperiod_id_seq OWNED BY datasequences_nonaccumulationperiod.id;


--
-- Name: datasources_datasource; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasources_datasource (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    unit character varying(100) NOT NULL,
    hardware_id character varying(120) NOT NULL
);


ALTER TABLE datasources_datasource OWNER TO portal;

--
-- Name: datasources_datasource_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasources_datasource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasources_datasource_id_seq OWNER TO portal;

--
-- Name: datasources_datasource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasources_datasource_id_seq OWNED BY datasources_datasource.id;


--
-- Name: datasources_rawdata; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE datasources_rawdata (
    id bigint NOT NULL,
    value bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE datasources_rawdata OWNER TO portal;

--
-- Name: datasources_rawdata_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE datasources_rawdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datasources_rawdata_id_seq OWNER TO portal;

--
-- Name: datasources_rawdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE datasources_rawdata_id_seq OWNED BY datasources_rawdata.id;


--
-- Name: devices_agent; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_agent (
    id integer NOT NULL,
    device_type integer NOT NULL,
    device_serial integer,
    hw_major integer,
    hw_minor integer,
    hw_revision integer,
    hw_subrevision character varying(12) NOT NULL,
    sw_major integer,
    sw_minor integer,
    sw_revision integer,
    sw_subrevision character varying(12) NOT NULL,
    customer_id integer NOT NULL,
    location_id integer,
    mac bigint NOT NULL,
    online boolean NOT NULL,
    online_since timestamp with time zone,
    add_mode boolean NOT NULL,
    no_longer_in_use boolean NOT NULL,
    CONSTRAINT devices_agent_hw_major_check CHECK ((hw_major >= 0)),
    CONSTRAINT devices_agent_hw_minor_check CHECK ((hw_minor >= 0)),
    CONSTRAINT devices_agent_hw_revision_check CHECK ((hw_revision >= 0)),
    CONSTRAINT devices_agent_sw_major_check CHECK ((sw_major >= 0)),
    CONSTRAINT devices_agent_sw_minor_check CHECK ((sw_minor >= 0)),
    CONSTRAINT devices_agent_sw_revision_check CHECK ((sw_revision >= 0))
);


ALTER TABLE devices_agent OWNER TO portal;

--
-- Name: devices_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_agent_id_seq OWNER TO portal;

--
-- Name: devices_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_agent_id_seq OWNED BY devices_agent.id;


--
-- Name: devices_agentevent; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_agentevent (
    id integer NOT NULL,
    agent_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    code smallint NOT NULL,
    message character varying(128) NOT NULL
);


ALTER TABLE devices_agentevent OWNER TO portal;

--
-- Name: devices_agentevent_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_agentevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_agentevent_id_seq OWNER TO portal;

--
-- Name: devices_agentevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_agentevent_id_seq OWNED BY devices_agentevent.id;


--
-- Name: devices_agentstatechange; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_agentstatechange (
    id integer NOT NULL,
    agent_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    online boolean NOT NULL,
    add_mode boolean NOT NULL
);


ALTER TABLE devices_agentstatechange OWNER TO portal;

--
-- Name: devices_agentstatechange_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_agentstatechange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_agentstatechange_id_seq OWNER TO portal;

--
-- Name: devices_agentstatechange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_agentstatechange_id_seq OWNED BY devices_agentstatechange.id;


--
-- Name: devices_meter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_meter (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    device_type integer NOT NULL,
    device_serial integer,
    hw_major integer,
    hw_minor integer,
    hw_revision integer,
    hw_subrevision character varying(12) NOT NULL,
    sw_major integer,
    sw_minor integer,
    sw_revision integer,
    sw_subrevision character varying(12) NOT NULL,
    agent_id integer NOT NULL,
    customer_id integer NOT NULL,
    manufactoring_id bigint NOT NULL,
    connection_type integer NOT NULL,
    manual_mode boolean NOT NULL,
    relay_on boolean NOT NULL,
    online boolean NOT NULL,
    online_since timestamp with time zone,
    joined boolean NOT NULL,
    location_id integer,
    relay_enabled boolean NOT NULL,
    name text NOT NULL,
    hardware_id character varying(120) NOT NULL,
    CONSTRAINT devices_meter_hw_major_check CHECK ((hw_major >= 0)),
    CONSTRAINT devices_meter_hw_minor_check CHECK ((hw_minor >= 0)),
    CONSTRAINT devices_meter_hw_revision_check CHECK ((hw_revision >= 0)),
    CONSTRAINT devices_meter_sw_major_check CHECK ((sw_major >= 0)),
    CONSTRAINT devices_meter_sw_minor_check CHECK ((sw_minor >= 0)),
    CONSTRAINT devices_meter_sw_revision_check CHECK ((sw_revision >= 0))
);


ALTER TABLE devices_meter OWNER TO portal;

--
-- Name: devices_meter_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_meter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_meter_id_seq OWNER TO portal;

--
-- Name: devices_meter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_meter_id_seq OWNED BY devices_meter.id;


--
-- Name: devices_meterstatechange; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_meterstatechange (
    id integer NOT NULL,
    meter_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    manual_mode boolean NOT NULL,
    relay_on boolean NOT NULL,
    online boolean NOT NULL
);


ALTER TABLE devices_meterstatechange OWNER TO portal;

--
-- Name: devices_meterstatechange_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_meterstatechange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_meterstatechange_id_seq OWNER TO portal;

--
-- Name: devices_meterstatechange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_meterstatechange_id_seq OWNED BY devices_meterstatechange.id;


--
-- Name: devices_physicalinput; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_physicalinput (
    customerdatasource_ptr_id integer NOT NULL,
    type integer NOT NULL,
    meter_id integer NOT NULL,
    "order" integer NOT NULL,
    store_measurements boolean NOT NULL
);


ALTER TABLE devices_physicalinput OWNER TO portal;

--
-- Name: devices_softwareimage; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE devices_softwareimage (
    id integer NOT NULL,
    device_type integer NOT NULL,
    hw_major integer NOT NULL,
    hw_minor integer NOT NULL,
    hw_revision integer NOT NULL,
    hw_subrevision character varying(12) NOT NULL,
    sw_major integer NOT NULL,
    sw_minor integer NOT NULL,
    sw_revision integer NOT NULL,
    sw_subrevision character varying(12) NOT NULL,
    CONSTRAINT devices_softwareimage_hw_major_check CHECK ((hw_major >= 0)),
    CONSTRAINT devices_softwareimage_hw_minor_check CHECK ((hw_minor >= 0)),
    CONSTRAINT devices_softwareimage_hw_revision_check CHECK ((hw_revision >= 0)),
    CONSTRAINT devices_softwareimage_sw_major_check CHECK ((sw_major >= 0)),
    CONSTRAINT devices_softwareimage_sw_minor_check CHECK ((sw_minor >= 0)),
    CONSTRAINT devices_softwareimage_sw_revision_check CHECK ((sw_revision >= 0))
);


ALTER TABLE devices_softwareimage OWNER TO portal;

--
-- Name: devices_softwareimage_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE devices_softwareimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_softwareimage_id_seq OWNER TO portal;

--
-- Name: devices_softwareimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE devices_softwareimage_id_seq OWNED BY devices_softwareimage.id;


--
-- Name: display_widgets_dashboardwidget; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE display_widgets_dashboardwidget (
    id integer NOT NULL,
    user_id integer NOT NULL,
    "column" integer NOT NULL,
    "row" integer NOT NULL,
    collection_id integer,
    index_id integer,
    widget_type integer NOT NULL
);


ALTER TABLE display_widgets_dashboardwidget OWNER TO portal;

--
-- Name: display_widgets_dashboardwidget_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE display_widgets_dashboardwidget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE display_widgets_dashboardwidget_id_seq OWNER TO portal;

--
-- Name: display_widgets_dashboardwidget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE display_widgets_dashboardwidget_id_seq OWNED BY display_widgets_dashboardwidget.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO portal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO portal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    name character varying(100)
);


ALTER TABLE django_content_type OWNER TO portal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO portal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: grid; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO grid;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: grid
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO grid;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grid
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO portal;

--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE djcelery_crontabschedule OWNER TO portal;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_crontabschedule_id_seq OWNER TO portal;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE djcelery_crontabschedule_id_seq OWNED BY djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE djcelery_intervalschedule OWNER TO portal;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_intervalschedule_id_seq OWNER TO portal;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE djcelery_intervalschedule_id_seq OWNED BY djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    interval_id integer,
    crontab_id integer,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE djcelery_periodictask OWNER TO portal;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_periodictask_id_seq OWNER TO portal;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE djcelery_periodictask_id_seq OWNED BY djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE djcelery_periodictasks OWNER TO portal;

--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    worker_id integer,
    hidden boolean NOT NULL
);


ALTER TABLE djcelery_taskstate OWNER TO portal;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_taskstate_id_seq OWNER TO portal;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE djcelery_taskstate_id_seq OWNED BY djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


ALTER TABLE djcelery_workerstate OWNER TO portal;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_workerstate_id_seq OWNER TO portal;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE djcelery_workerstate_id_seq OWNED BY djcelery_workerstate.id;


--
-- Name: encryption_encryptionkey; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE encryption_encryptionkey (
    id integer NOT NULL,
    key text NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT encryption_encryptionkey_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE encryption_encryptionkey OWNER TO portal;

--
-- Name: encryption_encryptionkey_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE encryption_encryptionkey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE encryption_encryptionkey_id_seq OWNER TO portal;

--
-- Name: encryption_encryptionkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE encryption_encryptionkey_id_seq OWNED BY encryption_encryptionkey.id;


--
-- Name: energinet_co2_modelbinding; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energinet_co2_modelbinding (
    id integer NOT NULL,
    index_id integer NOT NULL
);


ALTER TABLE energinet_co2_modelbinding OWNER TO portal;

--
-- Name: energinet_co2_modelbinding_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energinet_co2_modelbinding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energinet_co2_modelbinding_id_seq OWNER TO portal;

--
-- Name: energinet_co2_modelbinding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energinet_co2_modelbinding_id_seq OWNED BY energinet_co2_modelbinding.id;


--
-- Name: energy_breakdown_districtheatingconsumptionarea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_districtheatingconsumptionarea (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    CONSTRAINT energy_breakdown_districtheatingconsumptionar_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_districtheatingconsumptionarea OWNER TO portal;

--
-- Name: energy_breakdown_districtheatingconsumptionarea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_districtheatingconsumptionarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_districtheatingconsumptionarea_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_districtheatingconsumptionarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_districtheatingconsumptionarea_id_seq OWNED BY energy_breakdown_districtheatingconsumptionarea.id;


--
-- Name: energy_breakdown_districtheatingconsumptiontotal; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_districtheatingconsumptiontotal (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    CONSTRAINT energy_breakdown_districtheatingconsumptionto_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_districtheatingconsumptiontotal OWNER TO portal;

--
-- Name: energy_breakdown_districtheatingconsumptiontotal_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_districtheatingconsumptiontotal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_districtheatingconsumptiontotal_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_districtheatingconsumptiontotal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_districtheatingconsumptiontotal_id_seq OWNED BY energy_breakdown_districtheatingconsumptiontotal.id;


--
-- Name: energy_breakdown_electricityconsumptionarea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_electricityconsumptionarea (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    CONSTRAINT energy_breakdown_electricityconsumptionarea_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_electricityconsumptionarea OWNER TO portal;

--
-- Name: energy_breakdown_electricityconsumptionarea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_electricityconsumptionarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_electricityconsumptionarea_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_electricityconsumptionarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_electricityconsumptionarea_id_seq OWNED BY energy_breakdown_electricityconsumptionarea.id;


--
-- Name: energy_breakdown_electricityconsumptiontotal; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_electricityconsumptiontotal (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    CONSTRAINT energy_breakdown_electricityconsumptiontotal_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_electricityconsumptiontotal OWNER TO portal;

--
-- Name: energy_breakdown_electricityconsumptiontotal_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_electricityconsumptiontotal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_electricityconsumptiontotal_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_electricityconsumptiontotal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_electricityconsumptiontotal_id_seq OWNED BY energy_breakdown_electricityconsumptiontotal.id;


--
-- Name: energy_breakdown_fuelconsumptionarea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_fuelconsumptionarea (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    CONSTRAINT energy_breakdown_fuelconsumptionarea_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_fuelconsumptionarea OWNER TO portal;

--
-- Name: energy_breakdown_fuelconsumptionarea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_fuelconsumptionarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_fuelconsumptionarea_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_fuelconsumptionarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_fuelconsumptionarea_id_seq OWNED BY energy_breakdown_fuelconsumptionarea.id;


--
-- Name: energy_breakdown_fuelconsumptiontotal; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_fuelconsumptiontotal (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    CONSTRAINT energy_breakdown_fuelconsumptiontotal_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_fuelconsumptiontotal OWNER TO portal;

--
-- Name: energy_breakdown_fuelconsumptiontotal_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_fuelconsumptiontotal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_fuelconsumptiontotal_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_fuelconsumptiontotal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_fuelconsumptiontotal_id_seq OWNED BY energy_breakdown_fuelconsumptiontotal.id;


--
-- Name: energy_breakdown_proposedaction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_proposedaction (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    name text NOT NULL,
    yearly_consumption_cost integer,
    saving_percent numeric(4,1),
    subsidy integer NOT NULL,
    investment integer,
    description text NOT NULL,
    CONSTRAINT energy_breakdown_proposedaction_investment_check CHECK ((investment >= 0)),
    CONSTRAINT energy_breakdown_proposedaction_subsidy_check CHECK ((subsidy >= 0)),
    CONSTRAINT energy_breakdown_proposedaction_yearly_consumption_cost_check CHECK ((yearly_consumption_cost >= 0))
);


ALTER TABLE energy_breakdown_proposedaction OWNER TO portal;

--
-- Name: energy_breakdown_proposedaction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_proposedaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_proposedaction_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_proposedaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_proposedaction_id_seq OWNED BY energy_breakdown_proposedaction.id;


--
-- Name: energy_breakdown_waterconsumptionarea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_waterconsumptionarea (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    CONSTRAINT energy_breakdown_waterconsumptionarea_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_waterconsumptionarea OWNER TO portal;

--
-- Name: energy_breakdown_waterconsumptionarea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_waterconsumptionarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_waterconsumptionarea_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_waterconsumptionarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_waterconsumptionarea_id_seq OWNED BY energy_breakdown_waterconsumptionarea.id;


--
-- Name: energy_breakdown_waterconsumptiontotal; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_breakdown_waterconsumptiontotal (
    id integer NOT NULL,
    consumption integer,
    salesopportunity_id integer NOT NULL,
    CONSTRAINT energy_breakdown_waterconsumptiontotal_consumption_check CHECK ((consumption >= 0))
);


ALTER TABLE energy_breakdown_waterconsumptiontotal OWNER TO portal;

--
-- Name: energy_breakdown_waterconsumptiontotal_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_breakdown_waterconsumptiontotal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_breakdown_waterconsumptiontotal_id_seq OWNER TO portal;

--
-- Name: energy_breakdown_waterconsumptiontotal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_breakdown_waterconsumptiontotal_id_seq OWNED BY energy_breakdown_waterconsumptiontotal.id;


--
-- Name: energy_projects_energyproject; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_projects_energyproject (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    baseline_from_date date NOT NULL,
    baseline_to_date date NOT NULL,
    time_datasource_id integer,
    datasource_id integer,
    result_from_date date,
    result_to_date date
);


ALTER TABLE energy_projects_energyproject OWNER TO portal;

--
-- Name: energy_projects_energyproject_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_projects_energyproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_projects_energyproject_id_seq OWNER TO portal;

--
-- Name: energy_projects_energyproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_projects_energyproject_id_seq OWNED BY energy_projects_energyproject.id;


--
-- Name: energy_projects_ledlightproject; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_projects_ledlightproject (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    previous_tube_count integer NOT NULL,
    previous_consumption_per_tube integer NOT NULL,
    led_tube_count integer NOT NULL,
    led_consumption_per_tube integer NOT NULL,
    price double precision NOT NULL,
    datasource_id integer
);


ALTER TABLE energy_projects_ledlightproject OWNER TO portal;

--
-- Name: energy_projects_ledlightproject_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_projects_ledlightproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_projects_ledlightproject_id_seq OWNER TO portal;

--
-- Name: energy_projects_ledlightproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_projects_ledlightproject_id_seq OWNED BY energy_projects_ledlightproject.id;


--
-- Name: energy_use_reports_energyusearea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_use_reports_energyusearea (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    report_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE energy_use_reports_energyusearea OWNER TO portal;

--
-- Name: energy_use_reports_energyusearea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_use_reports_energyusearea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_use_reports_energyusearea_id_seq OWNER TO portal;

--
-- Name: energy_use_reports_energyusearea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_use_reports_energyusearea_id_seq OWNED BY energy_use_reports_energyusearea.id;


--
-- Name: energy_use_reports_energyusearea_measurement_points; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_use_reports_energyusearea_measurement_points (
    id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    consumptionmeasurementpoint_id integer NOT NULL
);


ALTER TABLE energy_use_reports_energyusearea_measurement_points OWNER TO portal;

--
-- Name: energy_use_reports_energyusearea_measurement_points_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_use_reports_energyusearea_measurement_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_use_reports_energyusearea_measurement_points_id_seq OWNER TO portal;

--
-- Name: energy_use_reports_energyusearea_measurement_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_use_reports_energyusearea_measurement_points_id_seq OWNED BY energy_use_reports_energyusearea_measurement_points.id;


--
-- Name: energy_use_reports_energyusereport; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_use_reports_energyusereport (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    title text NOT NULL,
    currency_unit character varying(100) NOT NULL,
    utility_type integer NOT NULL
);


ALTER TABLE energy_use_reports_energyusereport OWNER TO portal;

--
-- Name: energy_use_reports_energyusereport_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_use_reports_energyusereport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_use_reports_energyusereport_id_seq OWNER TO portal;

--
-- Name: energy_use_reports_energyusereport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_use_reports_energyusereport_id_seq OWNED BY energy_use_reports_energyusereport.id;


--
-- Name: energy_use_reports_energyusereport_main_measurement_points; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energy_use_reports_energyusereport_main_measurement_points (
    id integer NOT NULL,
    energyusereport_id integer NOT NULL,
    consumptionmeasurementpoint_id integer NOT NULL
);


ALTER TABLE energy_use_reports_energyusereport_main_measurement_points OWNER TO portal;

--
-- Name: energy_use_reports_energyusereport_main_measurement_poin_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energy_use_reports_energyusereport_main_measurement_poin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energy_use_reports_energyusereport_main_measurement_poin_id_seq OWNER TO portal;

--
-- Name: energy_use_reports_energyusereport_main_measurement_poin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energy_use_reports_energyusereport_main_measurement_poin_id_seq OWNED BY energy_use_reports_energyusereport_main_measurement_points.id;


--
-- Name: energyperformances_energyperformance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_energyperformance (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE energyperformances_energyperformance OWNER TO portal;

--
-- Name: energyperformances_energyperformance_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energyperformances_energyperformance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energyperformances_energyperformance_id_seq OWNER TO portal;

--
-- Name: energyperformances_energyperformance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energyperformances_energyperformance_id_seq OWNED BY energyperformances_energyperformance.id;


--
-- Name: energyperformances_productionenergyperformance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_productionenergyperformance (
    energyperformance_ptr_id integer NOT NULL,
    production_unit character varying(100) NOT NULL
);


ALTER TABLE energyperformances_productionenergyperformance OWNER TO portal;

--
-- Name: energyperformances_productionenergyperformance_consumptiong23ca; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_productionenergyperformance_consumptiong23ca (
    id integer NOT NULL,
    productionenergyperformance_id integer NOT NULL,
    consumptiongroup_id integer NOT NULL
);


ALTER TABLE energyperformances_productionenergyperformance_consumptiong23ca OWNER TO portal;

--
-- Name: energyperformances_productionenergyperformance_consumpti_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energyperformances_productionenergyperformance_consumpti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energyperformances_productionenergyperformance_consumpti_id_seq OWNER TO portal;

--
-- Name: energyperformances_productionenergyperformance_consumpti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energyperformances_productionenergyperformance_consumpti_id_seq OWNED BY energyperformances_productionenergyperformance_consumptiong23ca.id;


--
-- Name: energyperformances_productionenergyperformance_productiongroups; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_productionenergyperformance_productiongroups (
    id integer NOT NULL,
    productionenergyperformance_id integer NOT NULL,
    productiongroup_id integer NOT NULL
);


ALTER TABLE energyperformances_productionenergyperformance_productiongroups OWNER TO portal;

--
-- Name: energyperformances_productionenergyperformance_productio_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energyperformances_productionenergyperformance_productio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energyperformances_productionenergyperformance_productio_id_seq OWNER TO portal;

--
-- Name: energyperformances_productionenergyperformance_productio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energyperformances_productionenergyperformance_productio_id_seq OWNED BY energyperformances_productionenergyperformance_productiongroups.id;


--
-- Name: energyperformances_timeenergyperformance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_timeenergyperformance (
    energyperformance_ptr_id integer NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE energyperformances_timeenergyperformance OWNER TO portal;

--
-- Name: energyperformances_timeenergyperformance_consumptiongroups; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyperformances_timeenergyperformance_consumptiongroups (
    id integer NOT NULL,
    timeenergyperformance_id integer NOT NULL,
    consumptiongroup_id integer NOT NULL
);


ALTER TABLE energyperformances_timeenergyperformance_consumptiongroups OWNER TO portal;

--
-- Name: energyperformances_timeenergyperformance_consumptiongrou_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE energyperformances_timeenergyperformance_consumptiongrou_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energyperformances_timeenergyperformance_consumptiongrou_id_seq OWNER TO portal;

--
-- Name: energyperformances_timeenergyperformance_consumptiongrou_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE energyperformances_timeenergyperformance_consumptiongrou_id_seq OWNED BY energyperformances_timeenergyperformance_consumptiongroups.id;


--
-- Name: energyuses_energyuse; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE energyuses_energyuse (
    consumptiongroup_ptr_id integer NOT NULL,
    main_energy_use_area integer NOT NULL
);


ALTER TABLE energyuses_energyuse OWNER TO portal;

--
-- Name: enpi_reports_enpireport; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE enpi_reports_enpireport (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    title text NOT NULL,
    energy_driver_unit character varying(100) NOT NULL
);


ALTER TABLE enpi_reports_enpireport OWNER TO portal;

--
-- Name: enpi_reports_enpireport_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE enpi_reports_enpireport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enpi_reports_enpireport_id_seq OWNER TO portal;

--
-- Name: enpi_reports_enpireport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE enpi_reports_enpireport_id_seq OWNED BY enpi_reports_enpireport.id;


--
-- Name: enpi_reports_enpiusearea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE enpi_reports_enpiusearea (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    report_id integer NOT NULL,
    name text NOT NULL,
    energy_driver_id integer NOT NULL
);


ALTER TABLE enpi_reports_enpiusearea OWNER TO portal;

--
-- Name: enpi_reports_enpiusearea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE enpi_reports_enpiusearea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enpi_reports_enpiusearea_id_seq OWNER TO portal;

--
-- Name: enpi_reports_enpiusearea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE enpi_reports_enpiusearea_id_seq OWNED BY enpi_reports_enpiusearea.id;


--
-- Name: enpi_reports_enpiusearea_measurement_points; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE enpi_reports_enpiusearea_measurement_points (
    id integer NOT NULL,
    enpiusearea_id integer NOT NULL,
    consumptionmeasurementpoint_id integer NOT NULL
);


ALTER TABLE enpi_reports_enpiusearea_measurement_points OWNER TO portal;

--
-- Name: enpi_reports_enpiusearea_measurement_points_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE enpi_reports_enpiusearea_measurement_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enpi_reports_enpiusearea_measurement_points_id_seq OWNER TO portal;

--
-- Name: enpi_reports_enpiusearea_measurement_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE enpi_reports_enpiusearea_measurement_points_id_seq OWNED BY enpi_reports_enpiusearea_measurement_points.id;


--
-- Name: global_datasources_globaldatasource; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE global_datasources_globaldatasource (
    datasource_ptr_id integer NOT NULL,
    name character varying(120) NOT NULL,
    app_label character varying(100) NOT NULL,
    codename character varying(100) NOT NULL,
    country character varying(2) NOT NULL
);


ALTER TABLE global_datasources_globaldatasource OWNER TO portal;

--
-- Name: indexes_datasourceindexadapter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_datasourceindexadapter (
    index_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE indexes_datasourceindexadapter OWNER TO portal;

--
-- Name: indexes_derivedindexperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_derivedindexperiod (
    id integer NOT NULL,
    index_id integer NOT NULL,
    from_date date NOT NULL,
    other_index_id integer NOT NULL,
    coefficient numeric(10,5) NOT NULL,
    constant numeric(10,5) NOT NULL,
    roof numeric(10,5)
);


ALTER TABLE indexes_derivedindexperiod OWNER TO portal;

--
-- Name: indexes_derivedindexperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE indexes_derivedindexperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indexes_derivedindexperiod_id_seq OWNER TO portal;

--
-- Name: indexes_derivedindexperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE indexes_derivedindexperiod_id_seq OWNED BY indexes_derivedindexperiod.id;


--
-- Name: indexes_entry; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_entry (
    id integer NOT NULL,
    index_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone NOT NULL,
    value numeric(10,5) NOT NULL
);


ALTER TABLE indexes_entry OWNER TO portal;

--
-- Name: indexes_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE indexes_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indexes_entry_id_seq OWNER TO portal;

--
-- Name: indexes_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE indexes_entry_id_seq OWNED BY indexes_entry.id;


--
-- Name: indexes_index; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_index (
    dataseries_ptr_id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    name text NOT NULL,
    data_format integer NOT NULL,
    collection_id integer,
    timezone character varying(64) NOT NULL
);


ALTER TABLE indexes_index OWNER TO portal;

--
-- Name: indexes_seasonindexperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_seasonindexperiod (
    id integer NOT NULL,
    index_id integer NOT NULL,
    from_date date NOT NULL,
    value_at_hour_0 numeric(10,5) NOT NULL,
    value_at_hour_1 numeric(10,5) NOT NULL,
    value_at_hour_2 numeric(10,5) NOT NULL,
    value_at_hour_3 numeric(10,5) NOT NULL,
    value_at_hour_4 numeric(10,5) NOT NULL,
    value_at_hour_5 numeric(10,5) NOT NULL,
    value_at_hour_6 numeric(10,5) NOT NULL,
    value_at_hour_7 numeric(10,5) NOT NULL,
    value_at_hour_8 numeric(10,5) NOT NULL,
    value_at_hour_9 numeric(10,5) NOT NULL,
    value_at_hour_10 numeric(10,5) NOT NULL,
    value_at_hour_11 numeric(10,5) NOT NULL,
    value_at_hour_12 numeric(10,5) NOT NULL,
    value_at_hour_13 numeric(10,5) NOT NULL,
    value_at_hour_14 numeric(10,5) NOT NULL,
    value_at_hour_15 numeric(10,5) NOT NULL,
    value_at_hour_16 numeric(10,5) NOT NULL,
    value_at_hour_17 numeric(10,5) NOT NULL,
    value_at_hour_18 numeric(10,5) NOT NULL,
    value_at_hour_19 numeric(10,5) NOT NULL,
    value_at_hour_20 numeric(10,5) NOT NULL,
    value_at_hour_21 numeric(10,5) NOT NULL,
    value_at_hour_22 numeric(10,5) NOT NULL,
    value_at_hour_23 numeric(10,5) NOT NULL
);


ALTER TABLE indexes_seasonindexperiod OWNER TO portal;

--
-- Name: indexes_seasonindexperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE indexes_seasonindexperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indexes_seasonindexperiod_id_seq OWNER TO portal;

--
-- Name: indexes_seasonindexperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE indexes_seasonindexperiod_id_seq OWNED BY indexes_seasonindexperiod.id;


--
-- Name: indexes_spotmapping; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_spotmapping (
    id integer NOT NULL,
    index_id integer NOT NULL,
    area character varying(3) NOT NULL,
    unit character varying(100) NOT NULL,
    timezone character varying(64) NOT NULL
);


ALTER TABLE indexes_spotmapping OWNER TO portal;

--
-- Name: indexes_spotmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE indexes_spotmapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indexes_spotmapping_id_seq OWNER TO portal;

--
-- Name: indexes_spotmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE indexes_spotmapping_id_seq OWNED BY indexes_spotmapping.id;


--
-- Name: indexes_standardmonthindex; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE indexes_standardmonthindex (
    index_ptr_id integer NOT NULL,
    january numeric(10,3) NOT NULL,
    february numeric(10,3) NOT NULL,
    march numeric(10,3) NOT NULL,
    april numeric(10,3) NOT NULL,
    may numeric(10,3) NOT NULL,
    june numeric(10,3) NOT NULL,
    july numeric(10,3) NOT NULL,
    august numeric(10,3) NOT NULL,
    september numeric(10,3) NOT NULL,
    october numeric(10,3) NOT NULL,
    november numeric(10,3) NOT NULL,
    december numeric(10,3) NOT NULL
);


ALTER TABLE indexes_standardmonthindex OWNER TO portal;

--
-- Name: installation_surveys_billingmeter; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installation_surveys_billingmeter (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    salesopportunity_id integer NOT NULL,
    utility_type integer NOT NULL,
    description text NOT NULL,
    utility_provider text NOT NULL,
    installation_number text NOT NULL,
    billing_number text NOT NULL
);


ALTER TABLE installation_surveys_billingmeter OWNER TO portal;

--
-- Name: installation_surveys_billingmeter_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installation_surveys_billingmeter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installation_surveys_billingmeter_id_seq OWNER TO portal;

--
-- Name: installation_surveys_billingmeter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installation_surveys_billingmeter_id_seq OWNED BY installation_surveys_billingmeter.id;


--
-- Name: installation_surveys_billingmeterappendix; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installation_surveys_billingmeterappendix (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    billingmeter_id integer NOT NULL,
    name text NOT NULL,
    data character varying(100) NOT NULL
);


ALTER TABLE installation_surveys_billingmeterappendix OWNER TO portal;

--
-- Name: installation_surveys_billingmeterappendix_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installation_surveys_billingmeterappendix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installation_surveys_billingmeterappendix_id_seq OWNER TO portal;

--
-- Name: installation_surveys_billingmeterappendix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installation_surveys_billingmeterappendix_id_seq OWNED BY installation_surveys_billingmeterappendix.id;


--
-- Name: installation_surveys_energyusearea; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installation_surveys_energyusearea (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    salesopportunity_id integer NOT NULL,
    description text NOT NULL,
    electricity boolean NOT NULL,
    district_heating boolean NOT NULL,
    fuel boolean NOT NULL,
    water boolean NOT NULL
);


ALTER TABLE installation_surveys_energyusearea OWNER TO portal;

--
-- Name: installation_surveys_energyusearea_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installation_surveys_energyusearea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installation_surveys_energyusearea_id_seq OWNER TO portal;

--
-- Name: installation_surveys_energyusearea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installation_surveys_energyusearea_id_seq OWNED BY installation_surveys_energyusearea.id;


--
-- Name: installation_surveys_proposedaction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installation_surveys_proposedaction (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    salesopportunity_id integer NOT NULL,
    energyusearea_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE installation_surveys_proposedaction OWNER TO portal;

--
-- Name: installation_surveys_proposedaction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installation_surveys_proposedaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installation_surveys_proposedaction_id_seq OWNER TO portal;

--
-- Name: installation_surveys_proposedaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installation_surveys_proposedaction_id_seq OWNED BY installation_surveys_proposedaction.id;


--
-- Name: installation_surveys_workhours; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installation_surveys_workhours (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    salesopportunity_id integer NOT NULL,
    description text NOT NULL,
    period text NOT NULL
);


ALTER TABLE installation_surveys_workhours OWNER TO portal;

--
-- Name: installation_surveys_workhours_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installation_surveys_workhours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installation_surveys_workhours_id_seq OWNER TO portal;

--
-- Name: installation_surveys_workhours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installation_surveys_workhours_id_seq OWNED BY installation_surveys_workhours.id;


--
-- Name: installations_floorplan; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_floorplan (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE installations_floorplan OWNER TO portal;

--
-- Name: installations_floorplan_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_floorplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_floorplan_id_seq OWNER TO portal;

--
-- Name: installations_floorplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_floorplan_id_seq OWNED BY installations_floorplan.id;


--
-- Name: installations_gatewayinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_gatewayinstallation (
    productinstallation_ptr_id integer NOT NULL,
    internet_connection integer NOT NULL
);


ALTER TABLE installations_gatewayinstallation OWNER TO portal;

--
-- Name: installations_installationphoto; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_installationphoto (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    installation_id integer NOT NULL,
    name text NOT NULL,
    data character varying(100) NOT NULL
);


ALTER TABLE installations_installationphoto OWNER TO portal;

--
-- Name: installations_installationphoto_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_installationphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_installationphoto_id_seq OWNER TO portal;

--
-- Name: installations_installationphoto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_installationphoto_id_seq OWNED BY installations_installationphoto.id;


--
-- Name: installations_meterinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_meterinstallation (
    productinstallation_ptr_id integer NOT NULL,
    gateway_id integer
);


ALTER TABLE installations_meterinstallation OWNER TO portal;

--
-- Name: installations_meterinstallation_input_satisfies_dataneeds; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_meterinstallation_input_satisfies_dataneeds (
    id integer NOT NULL,
    meterinstallation_id integer NOT NULL,
    dataneed_id integer NOT NULL
);


ALTER TABLE installations_meterinstallation_input_satisfies_dataneeds OWNER TO portal;

--
-- Name: installations_meterinstallation_input_satisfies_dataneed_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_meterinstallation_input_satisfies_dataneed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_meterinstallation_input_satisfies_dataneed_id_seq OWNER TO portal;

--
-- Name: installations_meterinstallation_input_satisfies_dataneed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_meterinstallation_input_satisfies_dataneed_id_seq OWNED BY installations_meterinstallation_input_satisfies_dataneeds.id;


--
-- Name: installations_productinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_productinstallation (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    product_id integer,
    name text NOT NULL,
    purpose text NOT NULL,
    installation_notes text NOT NULL,
    floorplan_id integer NOT NULL,
    installation_number integer NOT NULL,
    marker_x double precision,
    marker_y double precision
);


ALTER TABLE installations_productinstallation OWNER TO portal;

--
-- Name: installations_productinstallation_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_productinstallation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_productinstallation_id_seq OWNER TO portal;

--
-- Name: installations_productinstallation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_productinstallation_id_seq OWNED BY installations_productinstallation.id;


--
-- Name: installations_pulseemitterinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_pulseemitterinstallation (
    productinstallation_ptr_id integer NOT NULL,
    pulse_quantity integer,
    output_quantity integer,
    output_unit character varying(100) NOT NULL
);


ALTER TABLE installations_pulseemitterinstallation OWNER TO portal;

--
-- Name: installations_pulseemitterinstallation_input_satisfies_data7b36; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 (
    id integer NOT NULL,
    pulseemitterinstallation_id integer NOT NULL,
    dataneed_id integer NOT NULL
);


ALTER TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 OWNER TO portal;

--
-- Name: installations_pulseemitterinstallation_input_satisfies_d_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_pulseemitterinstallation_input_satisfies_d_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_pulseemitterinstallation_input_satisfies_d_id_seq OWNER TO portal;

--
-- Name: installations_pulseemitterinstallation_input_satisfies_d_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_pulseemitterinstallation_input_satisfies_d_id_seq OWNED BY installations_pulseemitterinstallation_input_satisfies_data7b36.id;


--
-- Name: installations_repeaterinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_repeaterinstallation (
    productinstallation_ptr_id integer NOT NULL,
    gateway_id integer
);


ALTER TABLE installations_repeaterinstallation OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_tripleinputmeterinstallation (
    productinstallation_ptr_id integer NOT NULL,
    gateway_id integer
);


ALTER TABLE installations_tripleinputmeterinstallation OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input1_satisfies0539; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 (
    id integer NOT NULL,
    tripleinputmeterinstallation_id integer NOT NULL,
    dataneed_id integer NOT NULL
);


ALTER TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input1_satisf_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_tripleinputmeterinstallation_input1_satisf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_tripleinputmeterinstallation_input1_satisf_id_seq OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input1_satisf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_tripleinputmeterinstallation_input1_satisf_id_seq OWNED BY installations_tripleinputmeterinstallation_input1_satisfies0539.id;


--
-- Name: installations_tripleinputmeterinstallation_input2_satisfies1aad; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad (
    id integer NOT NULL,
    tripleinputmeterinstallation_id integer NOT NULL,
    dataneed_id integer NOT NULL
);


ALTER TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input2_satisf_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_tripleinputmeterinstallation_input2_satisf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_tripleinputmeterinstallation_input2_satisf_id_seq OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input2_satisf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_tripleinputmeterinstallation_input2_satisf_id_seq OWNED BY installations_tripleinputmeterinstallation_input2_satisfies1aad.id;


--
-- Name: installations_tripleinputmeterinstallation_input3_satisfies9eaa; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa (
    id integer NOT NULL,
    tripleinputmeterinstallation_id integer NOT NULL,
    dataneed_id integer NOT NULL
);


ALTER TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input3_satisf_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE installations_tripleinputmeterinstallation_input3_satisf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE installations_tripleinputmeterinstallation_input3_satisf_id_seq OWNER TO portal;

--
-- Name: installations_tripleinputmeterinstallation_input3_satisf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE installations_tripleinputmeterinstallation_input3_satisf_id_seq OWNED BY installations_tripleinputmeterinstallation_input3_satisfies9eaa.id;


--
-- Name: installations_triplepulsecollectorinstallation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE installations_triplepulsecollectorinstallation (
    productinstallation_ptr_id integer NOT NULL,
    gateway_id integer,
    input1_pulseemitterinstallation_id integer,
    input2_pulseemitterinstallation_id integer,
    input3_pulseemitterinstallation_id integer
);


ALTER TABLE installations_triplepulsecollectorinstallation OWNER TO portal;

--
-- Name: manage_collections_collectionitem; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manage_collections_collectionitem (
    item_ptr_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE manage_collections_collectionitem OWNER TO portal;

--
-- Name: manage_collections_floorplan; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manage_collections_floorplan (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE manage_collections_floorplan OWNER TO portal;

--
-- Name: manage_collections_floorplan_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE manage_collections_floorplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manage_collections_floorplan_id_seq OWNER TO portal;

--
-- Name: manage_collections_floorplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE manage_collections_floorplan_id_seq OWNED BY manage_collections_floorplan.id;


--
-- Name: manage_collections_infoitem; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manage_collections_infoitem (
    item_ptr_id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    info text NOT NULL
);


ALTER TABLE manage_collections_infoitem OWNER TO portal;

--
-- Name: manage_collections_item; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manage_collections_item (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    floorplan_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    z integer NOT NULL
);


ALTER TABLE manage_collections_item OWNER TO portal;

--
-- Name: manage_collections_item_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE manage_collections_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manage_collections_item_id_seq OWNER TO portal;

--
-- Name: manage_collections_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE manage_collections_item_id_seq OWNED BY manage_collections_item.id;


--
-- Name: manual_reporting_manuallyreportedconsumption; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manual_reporting_manuallyreportedconsumption (
    consumption_ptr_id integer NOT NULL
);


ALTER TABLE manual_reporting_manuallyreportedconsumption OWNER TO portal;

--
-- Name: manual_reporting_manuallyreportedproduction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE manual_reporting_manuallyreportedproduction (
    production_ptr_id integer NOT NULL
);


ALTER TABLE manual_reporting_manuallyreportedproduction OWNER TO portal;

--
-- Name: measurementpoints_chain; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_chain (
    dataseries_ptr_id integer NOT NULL
);


ALTER TABLE measurementpoints_chain OWNER TO portal;

--
-- Name: measurementpoints_chainlink; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_chainlink (
    id integer NOT NULL,
    chain_id integer NOT NULL,
    data_series_id integer NOT NULL,
    valid_from timestamp with time zone NOT NULL
);


ALTER TABLE measurementpoints_chainlink OWNER TO portal;

--
-- Name: measurementpoints_chainlink_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE measurementpoints_chainlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementpoints_chainlink_id_seq OWNER TO portal;

--
-- Name: measurementpoints_chainlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE measurementpoints_chainlink_id_seq OWNED BY measurementpoints_chainlink.id;


--
-- Name: measurementpoints_dataseries; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_dataseries (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer,
    role integer NOT NULL,
    graph_id integer,
    unit character varying(100) NOT NULL,
    utility_type integer NOT NULL
);


ALTER TABLE measurementpoints_dataseries OWNER TO portal;

--
-- Name: measurementpoints_dataseries_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE measurementpoints_dataseries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementpoints_dataseries_id_seq OWNER TO portal;

--
-- Name: measurementpoints_dataseries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE measurementpoints_dataseries_id_seq OWNED BY measurementpoints_dataseries.id;


--
-- Name: measurementpoints_degreedaycorrection; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_degreedaycorrection (
    dataseries_ptr_id integer NOT NULL,
    consumption_id integer NOT NULL,
    standarddegreedays_id integer NOT NULL,
    degreedays_id integer NOT NULL
);


ALTER TABLE measurementpoints_degreedaycorrection OWNER TO portal;

--
-- Name: measurementpoints_graph; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_graph (
    id integer NOT NULL,
    role integer NOT NULL,
    collection_id integer NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE measurementpoints_graph OWNER TO portal;

--
-- Name: measurementpoints_graph_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE measurementpoints_graph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementpoints_graph_id_seq OWNER TO portal;

--
-- Name: measurementpoints_graph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE measurementpoints_graph_id_seq OWNED BY measurementpoints_graph.id;


--
-- Name: measurementpoints_heatingdegreedays; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_heatingdegreedays (
    dataseries_ptr_id integer NOT NULL,
    derived_from_id integer NOT NULL
);


ALTER TABLE measurementpoints_heatingdegreedays OWNER TO portal;

--
-- Name: measurementpoints_indexcalculation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_indexcalculation (
    dataseries_ptr_id integer NOT NULL,
    index_id integer NOT NULL,
    consumption_id integer NOT NULL
);


ALTER TABLE measurementpoints_indexcalculation OWNER TO portal;

--
-- Name: measurementpoints_link; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_link (
    dataseries_ptr_id integer NOT NULL,
    target_id integer NOT NULL
);


ALTER TABLE measurementpoints_link OWNER TO portal;

--
-- Name: measurementpoints_meantemperaturechange; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_meantemperaturechange (
    dataseries_ptr_id integer NOT NULL,
    energy_id integer NOT NULL,
    volume_id integer NOT NULL
);


ALTER TABLE measurementpoints_meantemperaturechange OWNER TO portal;

--
-- Name: measurementpoints_multiplication; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_multiplication (
    dataseries_ptr_id integer NOT NULL,
    multiplier numeric(10,3) NOT NULL,
    source_data_series_id integer NOT NULL
);


ALTER TABLE measurementpoints_multiplication OWNER TO portal;

--
-- Name: measurementpoints_piecewiseconstantintegral; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_piecewiseconstantintegral (
    dataseries_ptr_id integer NOT NULL,
    data_id integer NOT NULL
);


ALTER TABLE measurementpoints_piecewiseconstantintegral OWNER TO portal;

--
-- Name: measurementpoints_rateconversion; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_rateconversion (
    dataseries_ptr_id integer NOT NULL,
    consumption_id integer NOT NULL
);


ALTER TABLE measurementpoints_rateconversion OWNER TO portal;

--
-- Name: measurementpoints_simplelinearregression; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_simplelinearregression (
    dataseries_ptr_id integer NOT NULL,
    data_id integer NOT NULL
);


ALTER TABLE measurementpoints_simplelinearregression OWNER TO portal;

--
-- Name: measurementpoints_storeddata; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_storeddata (
    id integer NOT NULL,
    data_series_id integer NOT NULL,
    value bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE measurementpoints_storeddata OWNER TO portal;

--
-- Name: measurementpoints_storeddata_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE measurementpoints_storeddata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementpoints_storeddata_id_seq OWNER TO portal;

--
-- Name: measurementpoints_storeddata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE measurementpoints_storeddata_id_seq OWNED BY measurementpoints_storeddata.id;


--
-- Name: measurementpoints_summation; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_summation (
    dataseries_ptr_id integer NOT NULL
);


ALTER TABLE measurementpoints_summation OWNER TO portal;

--
-- Name: measurementpoints_summationterm; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_summationterm (
    id integer NOT NULL,
    sign integer NOT NULL,
    summation_id integer NOT NULL,
    data_series_id integer NOT NULL
);


ALTER TABLE measurementpoints_summationterm OWNER TO portal;

--
-- Name: measurementpoints_summationterm_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE measurementpoints_summationterm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementpoints_summationterm_id_seq OWNER TO portal;

--
-- Name: measurementpoints_summationterm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE measurementpoints_summationterm_id_seq OWNED BY measurementpoints_summationterm.id;


--
-- Name: measurementpoints_utilization; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE measurementpoints_utilization (
    dataseries_ptr_id integer NOT NULL,
    consumption_id integer NOT NULL,
    needs_id integer NOT NULL
);


ALTER TABLE measurementpoints_utilization OWNER TO portal;

--
-- Name: opportunities_opportunity; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE opportunities_opportunity (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    completed boolean NOT NULL
);


ALTER TABLE opportunities_opportunity OWNER TO portal;

--
-- Name: opportunities_opportunity_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE opportunities_opportunity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE opportunities_opportunity_id_seq OWNER TO portal;

--
-- Name: opportunities_opportunity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE opportunities_opportunity_id_seq OWNED BY opportunities_opportunity.id;


--
-- Name: price_relay_site_pricerelayproject; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE price_relay_site_pricerelayproject (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    look_ahead integer NOT NULL,
    relay_one_on_at double precision NOT NULL,
    relay_two_on_at double precision NOT NULL,
    relay_tree_on_at double precision NOT NULL,
    relay_four_on_at double precision NOT NULL,
    relay_five_on_at double precision NOT NULL,
    relay_six_on_at double precision NOT NULL,
    relay_seven_on_at double precision NOT NULL,
    relay_eight_on_at double precision NOT NULL,
    tariff_id integer NOT NULL,
    CONSTRAINT price_relay_site_pricerelayproject_look_ahead_check CHECK ((look_ahead >= 0))
);


ALTER TABLE price_relay_site_pricerelayproject OWNER TO portal;

--
-- Name: price_relay_site_pricerelayproject_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE price_relay_site_pricerelayproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE price_relay_site_pricerelayproject_id_seq OWNER TO portal;

--
-- Name: price_relay_site_pricerelayproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE price_relay_site_pricerelayproject_id_seq OWNED BY price_relay_site_pricerelayproject.id;


--
-- Name: processperiods_processperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiod (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    title text NOT NULL,
    policy text NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE processperiods_processperiod OWNER TO portal;

--
-- Name: processperiods_processperiod_accepted_opportunities; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiod_accepted_opportunities (
    id integer NOT NULL,
    processperiod_id integer NOT NULL,
    opportunity_id integer NOT NULL
);


ALTER TABLE processperiods_processperiod_accepted_opportunities OWNER TO portal;

--
-- Name: processperiods_processperiod_accepted_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiod_accepted_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiod_accepted_opportunities_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiod_accepted_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiod_accepted_opportunities_id_seq OWNED BY processperiods_processperiod_accepted_opportunities.id;


--
-- Name: processperiods_processperiod_enpis; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiod_enpis (
    id integer NOT NULL,
    processperiod_id integer NOT NULL,
    energyperformance_id integer NOT NULL
);


ALTER TABLE processperiods_processperiod_enpis OWNER TO portal;

--
-- Name: processperiods_processperiod_enpis_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiod_enpis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiod_enpis_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiod_enpis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiod_enpis_id_seq OWNED BY processperiods_processperiod_enpis.id;


--
-- Name: processperiods_processperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiod_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiod_id_seq OWNED BY processperiods_processperiod.id;


--
-- Name: processperiods_processperiod_rejected_opportunities; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiod_rejected_opportunities (
    id integer NOT NULL,
    processperiod_id integer NOT NULL,
    opportunity_id integer NOT NULL
);


ALTER TABLE processperiods_processperiod_rejected_opportunities OWNER TO portal;

--
-- Name: processperiods_processperiod_rejected_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiod_rejected_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiod_rejected_opportunities_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiod_rejected_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiod_rejected_opportunities_id_seq OWNED BY processperiods_processperiod_rejected_opportunities.id;


--
-- Name: processperiods_processperiod_significant_energyuses; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiod_significant_energyuses (
    id integer NOT NULL,
    processperiod_id integer NOT NULL,
    energyuse_id integer NOT NULL
);


ALTER TABLE processperiods_processperiod_significant_energyuses OWNER TO portal;

--
-- Name: processperiods_processperiod_significant_energyuses_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiod_significant_energyuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiod_significant_energyuses_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiod_significant_energyuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiod_significant_energyuses_id_seq OWNED BY processperiods_processperiod_significant_energyuses.id;


--
-- Name: processperiods_processperiodgoal; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE processperiods_processperiodgoal (
    id integer NOT NULL,
    energyperformance_id integer NOT NULL,
    baseline_from_date date NOT NULL,
    baseline_to_date date NOT NULL,
    reduction_percent numeric(4,1),
    processperiod_id integer NOT NULL
);


ALTER TABLE processperiods_processperiodgoal OWNER TO portal;

--
-- Name: processperiods_processperiodgoal_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE processperiods_processperiodgoal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE processperiods_processperiodgoal_id_seq OWNER TO portal;

--
-- Name: processperiods_processperiodgoal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE processperiods_processperiodgoal_id_seq OWNED BY processperiods_processperiodgoal.id;


--
-- Name: productions_nonpulseperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_nonpulseperiod (
    period_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL
);


ALTER TABLE productions_nonpulseperiod OWNER TO portal;

--
-- Name: productions_offlinetolerance; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_offlinetolerance (
    id integer NOT NULL,
    hours integer NOT NULL,
    datasequence_id integer NOT NULL,
    CONSTRAINT productions_offlinetolerance_hours_check CHECK ((hours >= 0))
);


ALTER TABLE productions_offlinetolerance OWNER TO portal;

--
-- Name: productions_offlinetolerance_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE productions_offlinetolerance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productions_offlinetolerance_id_seq OWNER TO portal;

--
-- Name: productions_offlinetolerance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE productions_offlinetolerance_id_seq OWNED BY productions_offlinetolerance.id;


--
-- Name: productions_period; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_period (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL
);


ALTER TABLE productions_period OWNER TO portal;

--
-- Name: productions_period_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE productions_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productions_period_id_seq OWNER TO portal;

--
-- Name: productions_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE productions_period_id_seq OWNED BY productions_period.id;


--
-- Name: productions_production; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_production (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE productions_production OWNER TO portal;

--
-- Name: productions_production_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE productions_production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productions_production_id_seq OWNER TO portal;

--
-- Name: productions_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE productions_production_id_seq OWNED BY productions_production.id;


--
-- Name: productions_productiongroup; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_productiongroup (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE productions_productiongroup OWNER TO portal;

--
-- Name: productions_productiongroup_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE productions_productiongroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productions_productiongroup_id_seq OWNER TO portal;

--
-- Name: productions_productiongroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE productions_productiongroup_id_seq OWNED BY productions_productiongroup.id;


--
-- Name: productions_productiongroup_productions; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_productiongroup_productions (
    id integer NOT NULL,
    productiongroup_id integer NOT NULL,
    production_id integer NOT NULL
);


ALTER TABLE productions_productiongroup_productions OWNER TO portal;

--
-- Name: productions_productiongroup_productions_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE productions_productiongroup_productions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productions_productiongroup_productions_id_seq OWNER TO portal;

--
-- Name: productions_productiongroup_productions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE productions_productiongroup_productions_id_seq OWNED BY productions_productiongroup_productions.id;


--
-- Name: productions_pulseperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_pulseperiod (
    period_ptr_id integer NOT NULL,
    datasource_id integer NOT NULL,
    pulse_quantity integer NOT NULL,
    output_quantity integer NOT NULL,
    output_unit character varying(100) NOT NULL
);


ALTER TABLE productions_pulseperiod OWNER TO portal;

--
-- Name: productions_singlevalueperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE productions_singlevalueperiod (
    period_ptr_id integer NOT NULL,
    value bigint NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE productions_singlevalueperiod OWNER TO portal;

--
-- Name: products_historicalproduct; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE products_historicalproduct (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    provider_id integer NOT NULL,
    supplier_id integer NOT NULL,
    category_id integer NOT NULL,
    part_number text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price numeric(9,2),
    monthly_license numeric(9,2),
    installation_type_id integer,
    preconfigured_gateway boolean NOT NULL,
    discontinued boolean NOT NULL,
    product_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE products_historicalproduct OWNER TO portal;

--
-- Name: products_historicalproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE products_historicalproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_historicalproduct_id_seq OWNER TO portal;

--
-- Name: products_historicalproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE products_historicalproduct_id_seq OWNED BY products_historicalproduct.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE products_product (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    provider_id integer NOT NULL,
    supplier_id integer NOT NULL,
    category_id integer NOT NULL,
    part_number text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price numeric(9,2),
    monthly_license numeric(9,2),
    installation_type_id integer,
    preconfigured_gateway boolean NOT NULL,
    discontinued boolean NOT NULL
);


ALTER TABLE products_product OWNER TO portal;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_product_id_seq OWNER TO portal;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE products_product_id_seq OWNED BY products_product.id;


--
-- Name: products_productcategory; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE products_productcategory (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    provider_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE products_productcategory OWNER TO portal;

--
-- Name: products_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE products_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_productcategory_id_seq OWNER TO portal;

--
-- Name: products_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE products_productcategory_id_seq OWNED BY products_productcategory.id;


--
-- Name: projects_additionalsaving; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE projects_additionalsaving (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    project_id integer NOT NULL,
    description text NOT NULL,
    before_energy numeric(19,2),
    after_energy numeric(19,2),
    before_cost numeric(19,2),
    after_cost numeric(19,2),
    before_co2 numeric(19,6),
    after_co2 numeric(19,6),
    energy_unit character varying(50) NOT NULL
);


ALTER TABLE projects_additionalsaving OWNER TO portal;

--
-- Name: projects_additionalsaving_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE projects_additionalsaving_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_additionalsaving_id_seq OWNER TO portal;

--
-- Name: projects_additionalsaving_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE projects_additionalsaving_id_seq OWNED BY projects_additionalsaving.id;


--
-- Name: projects_benchmarkproject; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE projects_benchmarkproject (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    name text NOT NULL,
    customer_id integer NOT NULL,
    background text NOT NULL,
    expectations text NOT NULL,
    actions text NOT NULL,
    subsidy numeric(19,2),
    result text NOT NULL,
    comments text NOT NULL,
    runtime integer NOT NULL,
    estimated_yearly_consumption_costs_before numeric(19,2),
    estimated_yearly_consumption_before numeric(19,2),
    estimated_co2_emissions_before numeric(19,2),
    expected_savings_in_yearly_total_costs numeric(19,2) NOT NULL,
    expected_savings_in_yearly_consumption_after numeric(19,2) NOT NULL,
    expected_reduction_in_yearly_co2_emissions numeric(19,2) NOT NULL,
    utility_type integer NOT NULL,
    include_measured_costs boolean NOT NULL,
    baseline_from_timestamp timestamp with time zone,
    baseline_to_timestamp timestamp with time zone,
    result_from_timestamp timestamp with time zone,
    result_to_timestamp timestamp with time zone
);


ALTER TABLE projects_benchmarkproject OWNER TO portal;

--
-- Name: projects_benchmarkproject_baseline_measurement_points; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE projects_benchmarkproject_baseline_measurement_points (
    id integer NOT NULL,
    benchmarkproject_id integer NOT NULL,
    consumptionmeasurementpoint_id integer NOT NULL
);


ALTER TABLE projects_benchmarkproject_baseline_measurement_points OWNER TO portal;

--
-- Name: projects_benchmarkproject_baseline_measurement_points_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE projects_benchmarkproject_baseline_measurement_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_benchmarkproject_baseline_measurement_points_id_seq OWNER TO portal;

--
-- Name: projects_benchmarkproject_baseline_measurement_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE projects_benchmarkproject_baseline_measurement_points_id_seq OWNED BY projects_benchmarkproject_baseline_measurement_points.id;


--
-- Name: projects_benchmarkproject_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE projects_benchmarkproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_benchmarkproject_id_seq OWNER TO portal;

--
-- Name: projects_benchmarkproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE projects_benchmarkproject_id_seq OWNED BY projects_benchmarkproject.id;


--
-- Name: projects_benchmarkproject_result_measurement_points; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE projects_benchmarkproject_result_measurement_points (
    id integer NOT NULL,
    benchmarkproject_id integer NOT NULL,
    consumptionmeasurementpoint_id integer NOT NULL
);


ALTER TABLE projects_benchmarkproject_result_measurement_points OWNER TO portal;

--
-- Name: projects_benchmarkproject_result_measurement_points_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE projects_benchmarkproject_result_measurement_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_benchmarkproject_result_measurement_points_id_seq OWNER TO portal;

--
-- Name: projects_benchmarkproject_result_measurement_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE projects_benchmarkproject_result_measurement_points_id_seq OWNED BY projects_benchmarkproject_result_measurement_points.id;


--
-- Name: projects_cost; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE projects_cost (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    project_id integer NOT NULL,
    description text NOT NULL,
    cost numeric(19,2) NOT NULL,
    amortization_period integer,
    interest_rate numeric(19,2),
    scrap_value numeric(19,2)
);


ALTER TABLE projects_cost OWNER TO portal;

--
-- Name: projects_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE projects_cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_cost_id_seq OWNER TO portal;

--
-- Name: projects_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE projects_cost_id_seq OWNED BY projects_cost.id;


--
-- Name: provider_datasources_providerdatasource; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE provider_datasources_providerdatasource (
    datasource_ptr_id integer NOT NULL,
    provider_id integer NOT NULL
);


ALTER TABLE provider_datasources_providerdatasource OWNER TO portal;

--
-- Name: providers_provider; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE providers_provider (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    zipcode text NOT NULL,
    city text NOT NULL,
    cvr text NOT NULL,
    logo character varying(100)
);


ALTER TABLE providers_provider OWNER TO portal;

--
-- Name: providers_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE providers_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE providers_provider_id_seq OWNER TO portal;

--
-- Name: providers_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE providers_provider_id_seq OWNED BY providers_provider.id;


--
-- Name: reports_report; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE reports_report (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer,
    title text NOT NULL,
    generation_time timestamp with time zone NOT NULL,
    data_format integer NOT NULL,
    data text NOT NULL,
    size integer NOT NULL,
    CONSTRAINT reports_report_data_format_check CHECK ((data_format >= 0)),
    CONSTRAINT reports_report_size_check CHECK ((size >= 0))
);


ALTER TABLE reports_report OWNER TO portal;

--
-- Name: reports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE reports_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_report_id_seq OWNER TO portal;

--
-- Name: reports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE reports_report_id_seq OWNED BY reports_report.id;


--
-- Name: rules_dateexception; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_dateexception (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE rules_dateexception OWNER TO portal;

--
-- Name: rules_dateexception_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_dateexception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_dateexception_id_seq OWNER TO portal;

--
-- Name: rules_dateexception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_dateexception_id_seq OWNED BY rules_dateexception.id;


--
-- Name: rules_emailaction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_emailaction (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    execution_time smallint NOT NULL,
    recipient character varying(75) NOT NULL,
    message text NOT NULL,
    CONSTRAINT rules_emailaction_execution_time_check CHECK ((execution_time >= 0))
);


ALTER TABLE rules_emailaction OWNER TO portal;

--
-- Name: rules_emailaction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_emailaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_emailaction_id_seq OWNER TO portal;

--
-- Name: rules_emailaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_emailaction_id_seq OWNED BY rules_emailaction.id;


--
-- Name: rules_indexinvariant; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_indexinvariant (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    operator integer NOT NULL,
    unit character varying(100) NOT NULL,
    index_id integer NOT NULL,
    value numeric(8,3) NOT NULL
);


ALTER TABLE rules_indexinvariant OWNER TO portal;

--
-- Name: rules_indexinvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_indexinvariant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_indexinvariant_id_seq OWNER TO portal;

--
-- Name: rules_indexinvariant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_indexinvariant_id_seq OWNED BY rules_indexinvariant.id;


--
-- Name: rules_inputinvariant; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_inputinvariant (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    operator integer NOT NULL,
    unit character varying(100) NOT NULL,
    data_series_id integer NOT NULL,
    value bigint NOT NULL
);


ALTER TABLE rules_inputinvariant OWNER TO portal;

--
-- Name: rules_inputinvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_inputinvariant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_inputinvariant_id_seq OWNER TO portal;

--
-- Name: rules_inputinvariant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_inputinvariant_id_seq OWNED BY rules_inputinvariant.id;


--
-- Name: rules_minimizerule; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_minimizerule (
    userrule_ptr_id integer NOT NULL,
    consecutive boolean NOT NULL,
    activity_duration bigint NOT NULL,
    index_id integer NOT NULL
);


ALTER TABLE rules_minimizerule OWNER TO portal;

--
-- Name: rules_phoneaction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_phoneaction (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    execution_time smallint NOT NULL,
    phone_number character varying(20) NOT NULL,
    message text NOT NULL,
    CONSTRAINT rules_phoneaction_execution_time_check CHECK ((execution_time >= 0))
);


ALTER TABLE rules_phoneaction OWNER TO portal;

--
-- Name: rules_phoneaction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_phoneaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_phoneaction_id_seq OWNER TO portal;

--
-- Name: rules_phoneaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_phoneaction_id_seq OWNED BY rules_phoneaction.id;


--
-- Name: rules_relayaction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_relayaction (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    execution_time smallint NOT NULL,
    meter_id integer NOT NULL,
    relay_action smallint NOT NULL,
    CONSTRAINT rules_relayaction_execution_time_check CHECK ((execution_time >= 0)),
    CONSTRAINT rules_relayaction_relay_action_check CHECK ((relay_action >= 0))
);


ALTER TABLE rules_relayaction OWNER TO portal;

--
-- Name: rules_relayaction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_relayaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_relayaction_id_seq OWNER TO portal;

--
-- Name: rules_relayaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_relayaction_id_seq OWNED BY rules_relayaction.id;


--
-- Name: rules_triggeredrule; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_triggeredrule (
    userrule_ptr_id integer NOT NULL
);


ALTER TABLE rules_triggeredrule OWNER TO portal;

--
-- Name: rules_userrule; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE rules_userrule (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL,
    enabled boolean NOT NULL,
    timezone character varying(64) NOT NULL,
    monday boolean NOT NULL,
    tuesday boolean NOT NULL,
    wednesday boolean NOT NULL,
    thursday boolean NOT NULL,
    friday boolean NOT NULL,
    saturday boolean NOT NULL,
    sunday boolean NOT NULL,
    from_time time without time zone NOT NULL,
    to_time time without time zone NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE rules_userrule OWNER TO portal;

--
-- Name: rules_userrule_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE rules_userrule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_userrule_id_seq OWNER TO portal;

--
-- Name: rules_userrule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE rules_userrule_id_seq OWNED BY rules_userrule.id;


--
-- Name: salesopportunities_activityentry; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_activityentry (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    created timestamp with time zone NOT NULL,
    salesopportunity_id integer NOT NULL,
    creator_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    title text NOT NULL,
    comment text NOT NULL
);


ALTER TABLE salesopportunities_activityentry OWNER TO portal;

--
-- Name: salesopportunities_activityentry_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_activityentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_activityentry_id_seq OWNER TO portal;

--
-- Name: salesopportunities_activityentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_activityentry_id_seq OWNED BY salesopportunities_activityentry.id;


--
-- Name: salesopportunities_industrytype; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_industrytype (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE salesopportunities_industrytype OWNER TO portal;

--
-- Name: salesopportunities_industrytype_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_industrytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_industrytype_id_seq OWNER TO portal;

--
-- Name: salesopportunities_industrytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_industrytype_id_seq OWNED BY salesopportunities_industrytype.id;


--
-- Name: salesopportunities_industrytypesavings; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_industrytypesavings (
    id integer NOT NULL,
    expected numeric(4,1) NOT NULL,
    guaranteed numeric(4,1) NOT NULL,
    industry_type_id integer NOT NULL,
    energy_group integer NOT NULL
);


ALTER TABLE salesopportunities_industrytypesavings OWNER TO portal;

--
-- Name: salesopportunities_industrytypesavings_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_industrytypesavings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_industrytypesavings_id_seq OWNER TO portal;

--
-- Name: salesopportunities_industrytypesavings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_industrytypesavings_id_seq OWNED BY salesopportunities_industrytypesavings.id;


--
-- Name: salesopportunities_industrytypeusedistribution; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_industrytypeusedistribution (
    id integer NOT NULL,
    boiler_network_losses numeric(4,1) NOT NULL,
    heating_cooking numeric(4,1) NOT NULL,
    drying numeric(4,1) NOT NULL,
    evaporation numeric(4,1) NOT NULL,
    distillation numeric(4,1) NOT NULL,
    roasting_sintering numeric(4,1) NOT NULL,
    melting_casting numeric(4,1) NOT NULL,
    other_heating_up_to_150 numeric(4,1) NOT NULL,
    other_heating_above_150 numeric(4,1) NOT NULL,
    work_driving numeric(4,1) NOT NULL,
    lighting numeric(4,1) NOT NULL,
    pumping numeric(4,1) NOT NULL,
    refrigerators_freezers numeric(4,1) NOT NULL,
    ventilation_fans numeric(4,1) NOT NULL,
    compressed_air_process_air numeric(4,1) NOT NULL,
    partitioning numeric(4,1) NOT NULL,
    stirring numeric(4,1) NOT NULL,
    other_electric_motors numeric(4,1) NOT NULL,
    computers_electronics numeric(4,1) NOT NULL,
    other_electricity_use numeric(4,1) NOT NULL,
    space_heating numeric(4,1) NOT NULL,
    industry_type_id integer NOT NULL,
    energy_group integer NOT NULL
);


ALTER TABLE salesopportunities_industrytypeusedistribution OWNER TO portal;

--
-- Name: salesopportunities_industrytypeusedistribution_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_industrytypeusedistribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_industrytypeusedistribution_id_seq OWNER TO portal;

--
-- Name: salesopportunities_industrytypeusedistribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_industrytypeusedistribution_id_seq OWNED BY salesopportunities_industrytypeusedistribution.id;


--
-- Name: salesopportunities_salesopportunity; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_salesopportunity (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status integer NOT NULL,
    customer_id integer NOT NULL,
    description text NOT NULL,
    industry_type_id integer,
    solid_fuel_yearly_cost integer,
    solid_fuel_cost_kwh numeric(6,3) NOT NULL,
    liquid_fuel_yearly_cost integer,
    liquid_fuel_cost_kwh numeric(6,3) NOT NULL,
    gas_yearly_cost integer,
    gas_cost_kwh numeric(6,3) NOT NULL,
    electricity_yearly_cost integer,
    electricity_cost_kwh numeric(6,3) NOT NULL,
    district_heating_yearly_cost integer,
    district_heating_cost_kwh numeric(6,3) NOT NULL,
    water_yearly_cost integer,
    water_cost_m3 numeric(6,3) NOT NULL,
    investment_percent numeric(4,1) NOT NULL,
    investment_payback_years numeric(3,1) NOT NULL,
    sizing_officer_id integer,
    sales_officer_id integer,
    expected_closed date,
    interest_rate numeric(4,2) NOT NULL,
    scrap_value integer,
    life_in_months integer NOT NULL,
    gate_closed timestamp with time zone,
    technical_contact_name text NOT NULL,
    technical_contact_email text NOT NULL,
    technical_contact_phone text NOT NULL,
    monitors integer,
    monitors_notes text NOT NULL,
    tablets integer,
    tablets_notes text NOT NULL,
    internet_connection integer,
    meters_notes text NOT NULL,
    survey_notes text NOT NULL,
    energy_savings_currency_kwh numeric(5,2),
    contract_life_in_months integer NOT NULL,
    contract_budget integer,
    contract_interest_rate numeric(4,1) NOT NULL,
    likelihood_of_closing_sale numeric(4,1) NOT NULL,
    created_by_id integer,
    installation_notes text NOT NULL,
    CONSTRAINT salesopportunities_salesopportuni_contract_life_in_months_check CHECK ((contract_life_in_months >= 0)),
    CONSTRAINT salesopportunities_salesopportunity_life_in_months_check CHECK ((life_in_months >= 0)),
    CONSTRAINT salesopportunities_salesopportunity_monitors_check CHECK ((monitors >= 0)),
    CONSTRAINT salesopportunities_salesopportunity_tablets_check CHECK ((tablets >= 0))
);


ALTER TABLE salesopportunities_salesopportunity OWNER TO portal;

--
-- Name: salesopportunities_salesopportunity_floorplans; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_salesopportunity_floorplans (
    id integer NOT NULL,
    salesopportunity_id integer NOT NULL,
    floorplan_id integer NOT NULL
);


ALTER TABLE salesopportunities_salesopportunity_floorplans OWNER TO portal;

--
-- Name: salesopportunities_salesopportunity_floorplans_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_salesopportunity_floorplans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_salesopportunity_floorplans_id_seq OWNER TO portal;

--
-- Name: salesopportunities_salesopportunity_floorplans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_salesopportunity_floorplans_id_seq OWNED BY salesopportunities_salesopportunity_floorplans.id;


--
-- Name: salesopportunities_salesopportunity_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_salesopportunity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_salesopportunity_id_seq OWNER TO portal;

--
-- Name: salesopportunities_salesopportunity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_salesopportunity_id_seq OWNED BY salesopportunities_salesopportunity.id;


--
-- Name: salesopportunities_salesopportunitysavings; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_salesopportunitysavings (
    id integer NOT NULL,
    expected numeric(4,1) NOT NULL,
    guaranteed numeric(4,1) NOT NULL,
    sales_opportunity_id integer NOT NULL,
    energy_group integer NOT NULL
);


ALTER TABLE salesopportunities_salesopportunitysavings OWNER TO portal;

--
-- Name: salesopportunities_salesopportunitysavings_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_salesopportunitysavings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_salesopportunitysavings_id_seq OWNER TO portal;

--
-- Name: salesopportunities_salesopportunitysavings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_salesopportunitysavings_id_seq OWNED BY salesopportunities_salesopportunitysavings.id;


--
-- Name: salesopportunities_salesopportunityusedistribution; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_salesopportunityusedistribution (
    id integer NOT NULL,
    boiler_network_losses numeric(4,1) NOT NULL,
    heating_cooking numeric(4,1) NOT NULL,
    drying numeric(4,1) NOT NULL,
    evaporation numeric(4,1) NOT NULL,
    distillation numeric(4,1) NOT NULL,
    roasting_sintering numeric(4,1) NOT NULL,
    melting_casting numeric(4,1) NOT NULL,
    other_heating_up_to_150 numeric(4,1) NOT NULL,
    other_heating_above_150 numeric(4,1) NOT NULL,
    work_driving numeric(4,1) NOT NULL,
    lighting numeric(4,1) NOT NULL,
    pumping numeric(4,1) NOT NULL,
    refrigerators_freezers numeric(4,1) NOT NULL,
    ventilation_fans numeric(4,1) NOT NULL,
    compressed_air_process_air numeric(4,1) NOT NULL,
    partitioning numeric(4,1) NOT NULL,
    stirring numeric(4,1) NOT NULL,
    other_electric_motors numeric(4,1) NOT NULL,
    computers_electronics numeric(4,1) NOT NULL,
    other_electricity_use numeric(4,1) NOT NULL,
    space_heating numeric(4,1) NOT NULL,
    sales_opportunity_id integer NOT NULL,
    energy_group integer NOT NULL
);


ALTER TABLE salesopportunities_salesopportunityusedistribution OWNER TO portal;

--
-- Name: salesopportunities_salesopportunityusedistribution_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_salesopportunityusedistribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_salesopportunityusedistribution_id_seq OWNER TO portal;

--
-- Name: salesopportunities_salesopportunityusedistribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_salesopportunityusedistribution_id_seq OWNED BY salesopportunities_salesopportunityusedistribution.id;


--
-- Name: salesopportunities_surveyinstruction; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_surveyinstruction (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    sales_opportunity_id integer NOT NULL,
    use integer NOT NULL,
    electricity boolean NOT NULL,
    fuel boolean NOT NULL,
    district_heating boolean NOT NULL,
    water boolean NOT NULL,
    notes text NOT NULL
);


ALTER TABLE salesopportunities_surveyinstruction OWNER TO portal;

--
-- Name: salesopportunities_surveyinstruction_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_surveyinstruction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_surveyinstruction_id_seq OWNER TO portal;

--
-- Name: salesopportunities_surveyinstruction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_surveyinstruction_id_seq OWNED BY salesopportunities_surveyinstruction.id;


--
-- Name: salesopportunities_task; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE salesopportunities_task (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    sales_opportunity_id integer NOT NULL,
    date date NOT NULL,
    assigned_id integer NOT NULL,
    description text NOT NULL,
    completed boolean NOT NULL,
    completed_datetime timestamp with time zone
);


ALTER TABLE salesopportunities_task OWNER TO portal;

--
-- Name: salesopportunities_task_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE salesopportunities_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salesopportunities_task_id_seq OWNER TO portal;

--
-- Name: salesopportunities_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE salesopportunities_task_id_seq OWNED BY salesopportunities_task.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE south_migrationhistory OWNER TO portal;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE south_migrationhistory_id_seq OWNER TO portal;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: suppliers_supplier; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE suppliers_supplier (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    provider_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE suppliers_supplier OWNER TO portal;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE suppliers_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE suppliers_supplier_id_seq OWNER TO portal;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE suppliers_supplier_id_seq OWNED BY suppliers_supplier.id;


--
-- Name: system_health_site_healthreport; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE system_health_site_healthreport (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    customer_id integer,
    from_date date NOT NULL,
    to_date date NOT NULL,
    data text NOT NULL
);


ALTER TABLE system_health_site_healthreport OWNER TO portal;

--
-- Name: system_health_site_healthreport_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE system_health_site_healthreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE system_health_site_healthreport_id_seq OWNER TO portal;

--
-- Name: system_health_site_healthreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE system_health_site_healthreport_id_seq OWNED BY system_health_site_healthreport.id;


--
-- Name: tariffs_energytariff; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_energytariff (
    tariff_ptr_id integer NOT NULL
);


ALTER TABLE tariffs_energytariff OWNER TO portal;

--
-- Name: tariffs_fixedpriceperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_fixedpriceperiod (
    period_ptr_id integer NOT NULL,
    subscription_fee numeric(12,3) NOT NULL,
    subscription_period integer NOT NULL,
    value numeric(12,3) NOT NULL,
    unit character varying(100) NOT NULL
);


ALTER TABLE tariffs_fixedpriceperiod OWNER TO portal;

--
-- Name: tariffs_period; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_period (
    id integer NOT NULL,
    subclass_id integer NOT NULL,
    from_timestamp timestamp with time zone NOT NULL,
    to_timestamp timestamp with time zone,
    datasequence_id integer NOT NULL
);


ALTER TABLE tariffs_period OWNER TO portal;

--
-- Name: tariffs_period_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE tariffs_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tariffs_period_id_seq OWNER TO portal;

--
-- Name: tariffs_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE tariffs_period_id_seq OWNED BY tariffs_period.id;


--
-- Name: tariffs_spotpriceperiod; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_spotpriceperiod (
    period_ptr_id integer NOT NULL,
    subscription_fee numeric(12,3) NOT NULL,
    subscription_period integer NOT NULL,
    spotprice_id integer NOT NULL,
    coefficient numeric(12,3) NOT NULL,
    unit_for_constant_and_ceiling character varying(100) NOT NULL,
    constant numeric(12,3) NOT NULL,
    ceiling numeric(12,3)
);


ALTER TABLE tariffs_spotpriceperiod OWNER TO portal;

--
-- Name: tariffs_tariff; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_tariff (
    id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    subclass_id integer NOT NULL,
    customer_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE tariffs_tariff OWNER TO portal;

--
-- Name: tariffs_tariff_id_seq; Type: SEQUENCE; Schema: public; Owner: portal
--

CREATE SEQUENCE tariffs_tariff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tariffs_tariff_id_seq OWNER TO portal;

--
-- Name: tariffs_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: portal
--

ALTER SEQUENCE tariffs_tariff_id_seq OWNED BY tariffs_tariff.id;


--
-- Name: tariffs_volumetariff; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE tariffs_volumetariff (
    tariff_ptr_id integer NOT NULL
);


ALTER TABLE tariffs_volumetariff OWNER TO portal;

--
-- Name: token_auth_tokendata; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE token_auth_tokendata (
    key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    cipher bytea NOT NULL
);


ALTER TABLE token_auth_tokendata OWNER TO portal;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: portal; Tablespace: 
--

CREATE TABLE users_user (
    user_ptr_id integer NOT NULL,
    encryption_data_initialization_vector text NOT NULL,
    encryption_public_key text NOT NULL,
    encryption_private_key text NOT NULL,
    encryption_key_initialization_vector text NOT NULL,
    user_type integer,
    e_mail text NOT NULL,
    phone text NOT NULL,
    mobile text NOT NULL,
    name text NOT NULL,
    customer_id integer,
    provider_id integer
);


ALTER TABLE users_user OWNER TO portal;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('celery_taskmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('celery_tasksetmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_co2conversion ALTER COLUMN id SET DEFAULT nextval('co2conversions_co2conversion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY condensing_fiveminuteaccumulateddata ALTER COLUMN id SET DEFAULT nextval('condensing_fiveminuteaccumulateddata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY condensing_houraccumulateddata ALTER COLUMN id SET DEFAULT nextval('condensing_houraccumulateddata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumption ALTER COLUMN id SET DEFAULT nextval('consumptions_consumption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup ALTER COLUMN id SET DEFAULT nextval('consumptions_consumptiongroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup_consumptions ALTER COLUMN id SET DEFAULT nextval('consumptions_consumptiongroup_consumptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption ALTER COLUMN id SET DEFAULT nextval('consumptions_mainconsumption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption_consumptions ALTER COLUMN id SET DEFAULT nextval('consumptions_mainconsumption_consumptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_offlinetolerance ALTER COLUMN id SET DEFAULT nextval('consumptions_offlinetolerance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_period ALTER COLUMN id SET DEFAULT nextval('consumptions_period_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_costcompensation ALTER COLUMN id SET DEFAULT nextval('cost_compensations_costcompensation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_period ALTER COLUMN id SET DEFAULT nextval('cost_compensations_period_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_collection ALTER COLUMN id SET DEFAULT nextval('customers_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer_industry_types ALTER COLUMN id SET DEFAULT nextval('customers_customer_industry_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_location ALTER COLUMN id SET DEFAULT nextval('customers_location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_userprofile ALTER COLUMN id SET DEFAULT nextval('customers_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_userprofile_collections ALTER COLUMN id SET DEFAULT nextval('customers_userprofile_collections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datahub_datahubconnection ALTER COLUMN id SET DEFAULT nextval('datahub_datahubconnection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_dataneed ALTER COLUMN id SET DEFAULT nextval('dataneeds_dataneed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumedatasequence ALTER COLUMN id SET DEFAULT nextval('datasequences_energypervolumedatasequence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumeperiod ALTER COLUMN id SET DEFAULT nextval('datasequences_energypervolumeperiod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationdatasequence ALTER COLUMN id SET DEFAULT nextval('datasequences_nonaccumulationdatasequence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationofflinetolerance ALTER COLUMN id SET DEFAULT nextval('datasequences_nonaccumulationofflinetolerance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationperiod ALTER COLUMN id SET DEFAULT nextval('datasequences_nonaccumulationperiod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasources_datasource ALTER COLUMN id SET DEFAULT nextval('datasources_datasource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasources_rawdata ALTER COLUMN id SET DEFAULT nextval('datasources_rawdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agent ALTER COLUMN id SET DEFAULT nextval('devices_agent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agentevent ALTER COLUMN id SET DEFAULT nextval('devices_agentevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agentstatechange ALTER COLUMN id SET DEFAULT nextval('devices_agentstatechange_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meter ALTER COLUMN id SET DEFAULT nextval('devices_meter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meterstatechange ALTER COLUMN id SET DEFAULT nextval('devices_meterstatechange_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_softwareimage ALTER COLUMN id SET DEFAULT nextval('devices_softwareimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY display_widgets_dashboardwidget ALTER COLUMN id SET DEFAULT nextval('display_widgets_dashboardwidget_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: grid
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('djcelery_periodictask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('djcelery_taskstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('djcelery_workerstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY encryption_encryptionkey ALTER COLUMN id SET DEFAULT nextval('encryption_encryptionkey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energinet_co2_modelbinding ALTER COLUMN id SET DEFAULT nextval('energinet_co2_modelbinding_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptionarea ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_districtheatingconsumptionarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptiontotal ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_districtheatingconsumptiontotal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptionarea ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_electricityconsumptionarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptiontotal ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_electricityconsumptiontotal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptionarea ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_fuelconsumptionarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptiontotal ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_fuelconsumptiontotal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_proposedaction ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_proposedaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_waterconsumptionarea ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_waterconsumptionarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_waterconsumptiontotal ALTER COLUMN id SET DEFAULT nextval('energy_breakdown_waterconsumptiontotal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_energyproject ALTER COLUMN id SET DEFAULT nextval('energy_projects_energyproject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_ledlightproject ALTER COLUMN id SET DEFAULT nextval('energy_projects_ledlightproject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusearea ALTER COLUMN id SET DEFAULT nextval('energy_use_reports_energyusearea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusearea_measurement_points ALTER COLUMN id SET DEFAULT nextval('energy_use_reports_energyusearea_measurement_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusereport ALTER COLUMN id SET DEFAULT nextval('energy_use_reports_energyusereport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusereport_main_measurement_points ALTER COLUMN id SET DEFAULT nextval('energy_use_reports_energyusereport_main_measurement_poin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_energyperformance ALTER COLUMN id SET DEFAULT nextval('energyperformances_energyperformance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_consumptiong23ca ALTER COLUMN id SET DEFAULT nextval('energyperformances_productionenergyperformance_consumpti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_productiongroups ALTER COLUMN id SET DEFAULT nextval('energyperformances_productionenergyperformance_productio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_timeenergyperformance_consumptiongroups ALTER COLUMN id SET DEFAULT nextval('energyperformances_timeenergyperformance_consumptiongrou_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpireport ALTER COLUMN id SET DEFAULT nextval('enpi_reports_enpireport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea ALTER COLUMN id SET DEFAULT nextval('enpi_reports_enpiusearea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea_measurement_points ALTER COLUMN id SET DEFAULT nextval('enpi_reports_enpiusearea_measurement_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_derivedindexperiod ALTER COLUMN id SET DEFAULT nextval('indexes_derivedindexperiod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_entry ALTER COLUMN id SET DEFAULT nextval('indexes_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_seasonindexperiod ALTER COLUMN id SET DEFAULT nextval('indexes_seasonindexperiod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_spotmapping ALTER COLUMN id SET DEFAULT nextval('indexes_spotmapping_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_billingmeter ALTER COLUMN id SET DEFAULT nextval('installation_surveys_billingmeter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_billingmeterappendix ALTER COLUMN id SET DEFAULT nextval('installation_surveys_billingmeterappendix_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_energyusearea ALTER COLUMN id SET DEFAULT nextval('installation_surveys_energyusearea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_proposedaction ALTER COLUMN id SET DEFAULT nextval('installation_surveys_proposedaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_workhours ALTER COLUMN id SET DEFAULT nextval('installation_surveys_workhours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_floorplan ALTER COLUMN id SET DEFAULT nextval('installations_floorplan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_installationphoto ALTER COLUMN id SET DEFAULT nextval('installations_installationphoto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_meterinstallation_input_satisfies_dataneeds ALTER COLUMN id SET DEFAULT nextval('installations_meterinstallation_input_satisfies_dataneed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_productinstallation ALTER COLUMN id SET DEFAULT nextval('installations_productinstallation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_pulseemitterinstallation_input_satisfies_data7b36 ALTER COLUMN id SET DEFAULT nextval('installations_pulseemitterinstallation_input_satisfies_d_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input1_satisfies0539 ALTER COLUMN id SET DEFAULT nextval('installations_tripleinputmeterinstallation_input1_satisf_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input2_satisfies1aad ALTER COLUMN id SET DEFAULT nextval('installations_tripleinputmeterinstallation_input2_satisf_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input3_satisfies9eaa ALTER COLUMN id SET DEFAULT nextval('installations_tripleinputmeterinstallation_input3_satisf_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_floorplan ALTER COLUMN id SET DEFAULT nextval('manage_collections_floorplan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_item ALTER COLUMN id SET DEFAULT nextval('manage_collections_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_chainlink ALTER COLUMN id SET DEFAULT nextval('measurementpoints_chainlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_dataseries ALTER COLUMN id SET DEFAULT nextval('measurementpoints_dataseries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_graph ALTER COLUMN id SET DEFAULT nextval('measurementpoints_graph_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_storeddata ALTER COLUMN id SET DEFAULT nextval('measurementpoints_storeddata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_summationterm ALTER COLUMN id SET DEFAULT nextval('measurementpoints_summationterm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY opportunities_opportunity ALTER COLUMN id SET DEFAULT nextval('opportunities_opportunity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY price_relay_site_pricerelayproject ALTER COLUMN id SET DEFAULT nextval('price_relay_site_pricerelayproject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_accepted_opportunities ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiod_accepted_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_enpis ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiod_enpis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_rejected_opportunities ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiod_rejected_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_significant_energyuses ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiod_significant_energyuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiodgoal ALTER COLUMN id SET DEFAULT nextval('processperiods_processperiodgoal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_offlinetolerance ALTER COLUMN id SET DEFAULT nextval('productions_offlinetolerance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_period ALTER COLUMN id SET DEFAULT nextval('productions_period_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_production ALTER COLUMN id SET DEFAULT nextval('productions_production_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_productiongroup ALTER COLUMN id SET DEFAULT nextval('productions_productiongroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_productiongroup_productions ALTER COLUMN id SET DEFAULT nextval('productions_productiongroup_productions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct ALTER COLUMN id SET DEFAULT nextval('products_historicalproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_product ALTER COLUMN id SET DEFAULT nextval('products_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_productcategory ALTER COLUMN id SET DEFAULT nextval('products_productcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_additionalsaving ALTER COLUMN id SET DEFAULT nextval('projects_additionalsaving_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject ALTER COLUMN id SET DEFAULT nextval('projects_benchmarkproject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_baseline_measurement_points ALTER COLUMN id SET DEFAULT nextval('projects_benchmarkproject_baseline_measurement_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_result_measurement_points ALTER COLUMN id SET DEFAULT nextval('projects_benchmarkproject_result_measurement_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_cost ALTER COLUMN id SET DEFAULT nextval('projects_cost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY providers_provider ALTER COLUMN id SET DEFAULT nextval('providers_provider_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY reports_report ALTER COLUMN id SET DEFAULT nextval('reports_report_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_dateexception ALTER COLUMN id SET DEFAULT nextval('rules_dateexception_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_emailaction ALTER COLUMN id SET DEFAULT nextval('rules_emailaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_indexinvariant ALTER COLUMN id SET DEFAULT nextval('rules_indexinvariant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_inputinvariant ALTER COLUMN id SET DEFAULT nextval('rules_inputinvariant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_phoneaction ALTER COLUMN id SET DEFAULT nextval('rules_phoneaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_relayaction ALTER COLUMN id SET DEFAULT nextval('rules_relayaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_userrule ALTER COLUMN id SET DEFAULT nextval('rules_userrule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_activityentry ALTER COLUMN id SET DEFAULT nextval('salesopportunities_activityentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_industrytype ALTER COLUMN id SET DEFAULT nextval('salesopportunities_industrytype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_industrytypesavings ALTER COLUMN id SET DEFAULT nextval('salesopportunities_industrytypesavings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_industrytypeusedistribution ALTER COLUMN id SET DEFAULT nextval('salesopportunities_industrytypeusedistribution_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity ALTER COLUMN id SET DEFAULT nextval('salesopportunities_salesopportunity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity_floorplans ALTER COLUMN id SET DEFAULT nextval('salesopportunities_salesopportunity_floorplans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunitysavings ALTER COLUMN id SET DEFAULT nextval('salesopportunities_salesopportunitysavings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunityusedistribution ALTER COLUMN id SET DEFAULT nextval('salesopportunities_salesopportunityusedistribution_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_surveyinstruction ALTER COLUMN id SET DEFAULT nextval('salesopportunities_surveyinstruction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_task ALTER COLUMN id SET DEFAULT nextval('salesopportunities_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY suppliers_supplier ALTER COLUMN id SET DEFAULT nextval('suppliers_supplier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY system_health_site_healthreport ALTER COLUMN id SET DEFAULT nextval('system_health_site_healthreport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_period ALTER COLUMN id SET DEFAULT nextval('tariffs_period_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_tariff ALTER COLUMN id SET DEFAULT nextval('tariffs_tariff_id_seq'::regclass);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: co2conversions_co2conversion_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY co2conversions_co2conversion
    ADD CONSTRAINT co2conversions_co2conversion_pkey PRIMARY KEY (id);


--
-- Name: co2conversions_dynamicco2conversion_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY co2conversions_dynamicco2conversion
    ADD CONSTRAINT co2conversions_dynamicco2conversion_pkey PRIMARY KEY (co2conversion_ptr_id);


--
-- Name: co2conversions_fixedco2conversion_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY co2conversions_fixedco2conversion
    ADD CONSTRAINT co2conversions_fixedco2conversion_pkey PRIMARY KEY (co2conversion_ptr_id);


--
-- Name: condensing_fiveminuteaccumulateddat_datasource_id_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY condensing_fiveminuteaccumulateddata
    ADD CONSTRAINT condensing_fiveminuteaccumulateddat_datasource_id_timestamp_key UNIQUE (datasource_id, "timestamp");


--
-- Name: condensing_fiveminuteaccumulateddata_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY condensing_fiveminuteaccumulateddata
    ADD CONSTRAINT condensing_fiveminuteaccumulateddata_pkey PRIMARY KEY (id);


--
-- Name: condensing_houraccumulateddata_datasource_id_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY condensing_houraccumulateddata
    ADD CONSTRAINT condensing_houraccumulateddata_datasource_id_timestamp_key UNIQUE (datasource_id, "timestamp");


--
-- Name: condensing_houraccumulateddata_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY condensing_houraccumulateddata
    ADD CONSTRAINT condensing_houraccumulateddata_pkey PRIMARY KEY (id);


--
-- Name: consumptions_consumption_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_consumption
    ADD CONSTRAINT consumptions_consumption_pkey PRIMARY KEY (id);


--
-- Name: consumptions_consumptiongroup_consumptiongroup_id_consumpti_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_consumptiongroup_consumptions
    ADD CONSTRAINT consumptions_consumptiongroup_consumptiongroup_id_consumpti_key UNIQUE (consumptiongroup_id, consumption_id);


--
-- Name: consumptions_consumptiongroup_consumptions_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_consumptiongroup_consumptions
    ADD CONSTRAINT consumptions_consumptiongroup_consumptions_pkey PRIMARY KEY (id);


--
-- Name: consumptions_consumptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_consumptiongroup
    ADD CONSTRAINT consumptions_consumptiongroup_pkey PRIMARY KEY (id);


--
-- Name: consumptions_mainconsumption__mainconsumption_id_consumptio_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_mainconsumption_consumptions
    ADD CONSTRAINT consumptions_mainconsumption__mainconsumption_id_consumptio_key UNIQUE (mainconsumption_id, consumption_id);


--
-- Name: consumptions_mainconsumption_consumptions_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_mainconsumption_consumptions
    ADD CONSTRAINT consumptions_mainconsumption_consumptions_pkey PRIMARY KEY (id);


--
-- Name: consumptions_mainconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_mainconsumption
    ADD CONSTRAINT consumptions_mainconsumption_pkey PRIMARY KEY (id);


--
-- Name: consumptions_nonpulseperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_nonpulseperiod
    ADD CONSTRAINT consumptions_nonpulseperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: consumptions_offlinetolerance_datasequence_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_offlinetolerance
    ADD CONSTRAINT consumptions_offlinetolerance_datasequence_id_key UNIQUE (datasequence_id);


--
-- Name: consumptions_offlinetolerance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_offlinetolerance
    ADD CONSTRAINT consumptions_offlinetolerance_pkey PRIMARY KEY (id);


--
-- Name: consumptions_period_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_period
    ADD CONSTRAINT consumptions_period_pkey PRIMARY KEY (id);


--
-- Name: consumptions_pulseperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_pulseperiod
    ADD CONSTRAINT consumptions_pulseperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: consumptions_singlevalueperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY consumptions_singlevalueperiod
    ADD CONSTRAINT consumptions_singlevalueperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: cost_compensations_costcompensation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY cost_compensations_costcompensation
    ADD CONSTRAINT cost_compensations_costcompensation_pkey PRIMARY KEY (id);


--
-- Name: cost_compensations_fixedcompensationperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY cost_compensations_fixedcompensationperiod
    ADD CONSTRAINT cost_compensations_fixedcompensationperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: cost_compensations_period_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY cost_compensations_period
    ADD CONSTRAINT cost_compensations_period_pkey PRIMARY KEY (id);


--
-- Name: customer_datasources_customerdatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customer_datasources_customerdatasource
    ADD CONSTRAINT customer_datasources_customerdatasource_pkey PRIMARY KEY (datasource_ptr_id);


--
-- Name: customers_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_collection
    ADD CONSTRAINT customers_collection_pkey PRIMARY KEY (id);


--
-- Name: customers_customer_industry_typ_customer_id_industrytype_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_customer_industry_types
    ADD CONSTRAINT customers_customer_industry_typ_customer_id_industrytype_id_key UNIQUE (customer_id, industrytype_id);


--
-- Name: customers_customer_industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_customer_industry_types
    ADD CONSTRAINT customers_customer_industry_types_pkey PRIMARY KEY (id);


--
-- Name: customers_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT customers_customer_pkey PRIMARY KEY (id);


--
-- Name: customers_location_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_location
    ADD CONSTRAINT customers_location_pkey PRIMARY KEY (id);


--
-- Name: customers_userprofile_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_userprofile_collections
    ADD CONSTRAINT customers_userprofile_collections_pkey PRIMARY KEY (id);


--
-- Name: customers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_userprofile
    ADD CONSTRAINT customers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: customers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY customers_userprofile
    ADD CONSTRAINT customers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: datahub_datahubconnection_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datahub_datahubconnection
    ADD CONSTRAINT datahub_datahubconnection_pkey PRIMARY KEY (id);


--
-- Name: dataneeds_dataneed_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_dataneed
    ADD CONSTRAINT dataneeds_dataneed_pkey PRIMARY KEY (id);


--
-- Name: dataneeds_energyusedataneed_energyuse_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_energyusedataneed
    ADD CONSTRAINT dataneeds_energyusedataneed_energyuse_id_key UNIQUE (energyuse_id);


--
-- Name: dataneeds_energyusedataneed_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_energyusedataneed
    ADD CONSTRAINT dataneeds_energyusedataneed_pkey PRIMARY KEY (dataneed_ptr_id);


--
-- Name: dataneeds_mainconsumptiondataneed_mainconsumption_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_mainconsumptiondataneed
    ADD CONSTRAINT dataneeds_mainconsumptiondataneed_mainconsumption_id_key UNIQUE (mainconsumption_id);


--
-- Name: dataneeds_mainconsumptiondataneed_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_mainconsumptiondataneed
    ADD CONSTRAINT dataneeds_mainconsumptiondataneed_pkey PRIMARY KEY (dataneed_ptr_id);


--
-- Name: dataneeds_productiongroupdataneed_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_productiongroupdataneed
    ADD CONSTRAINT dataneeds_productiongroupdataneed_pkey PRIMARY KEY (dataneed_ptr_id);


--
-- Name: dataneeds_productiongroupdataneed_productiongroup_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY dataneeds_productiongroupdataneed
    ADD CONSTRAINT dataneeds_productiongroupdataneed_productiongroup_id_key UNIQUE (productiongroup_id);


--
-- Name: datasequence_adapters_consumptionaccumulationadapter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequence_adapters_consumptionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_consumptionaccumulationadapter_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: datasequence_adapters_nonaccumulationadapter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequence_adapters_nonaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_nonaccumulationadapter_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: datasequence_adapters_productionaccumulationadapter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequence_adapters_productionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_productionaccumulationadapter_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: datasequences_energypervolumedatasequence_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_energypervolumedatasequence
    ADD CONSTRAINT datasequences_energypervolumedatasequence_pkey PRIMARY KEY (id);


--
-- Name: datasequences_energypervolumeperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_energypervolumeperiod
    ADD CONSTRAINT datasequences_energypervolumeperiod_pkey PRIMARY KEY (id);


--
-- Name: datasequences_nonaccumulationdatasequence_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_nonaccumulationdatasequence
    ADD CONSTRAINT datasequences_nonaccumulationdatasequence_pkey PRIMARY KEY (id);


--
-- Name: datasequences_nonaccumulationofflinetoleran_datasequence_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_nonaccumulationofflinetolerance
    ADD CONSTRAINT datasequences_nonaccumulationofflinetoleran_datasequence_id_key UNIQUE (datasequence_id);


--
-- Name: datasequences_nonaccumulationofflinetolerance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_nonaccumulationofflinetolerance
    ADD CONSTRAINT datasequences_nonaccumulationofflinetolerance_pkey PRIMARY KEY (id);


--
-- Name: datasequences_nonaccumulationperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasequences_nonaccumulationperiod
    ADD CONSTRAINT datasequences_nonaccumulationperiod_pkey PRIMARY KEY (id);


--
-- Name: datasources_datasource_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasources_datasource
    ADD CONSTRAINT datasources_datasource_pkey PRIMARY KEY (id);


--
-- Name: datasources_rawdata_datasource_id_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasources_rawdata
    ADD CONSTRAINT datasources_rawdata_datasource_id_timestamp_key UNIQUE (datasource_id, "timestamp");


--
-- Name: datasources_rawdata_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY datasources_rawdata
    ADD CONSTRAINT datasources_rawdata_pkey PRIMARY KEY (id);


--
-- Name: devices_agent_mac_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_agent
    ADD CONSTRAINT devices_agent_mac_key UNIQUE (mac);


--
-- Name: devices_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_agent
    ADD CONSTRAINT devices_agent_pkey PRIMARY KEY (id);


--
-- Name: devices_agentevent_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_agentevent
    ADD CONSTRAINT devices_agentevent_pkey PRIMARY KEY (id);


--
-- Name: devices_agentstatechange_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_agentstatechange
    ADD CONSTRAINT devices_agentstatechange_pkey PRIMARY KEY (id);


--
-- Name: devices_meter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_meter
    ADD CONSTRAINT devices_meter_pkey PRIMARY KEY (id);


--
-- Name: devices_meterstatechange_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_meterstatechange
    ADD CONSTRAINT devices_meterstatechange_pkey PRIMARY KEY (id);


--
-- Name: devices_physicalinput_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_physicalinput
    ADD CONSTRAINT devices_physicalinput_pkey PRIMARY KEY (customerdatasource_ptr_id);


--
-- Name: devices_softwareimage_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY devices_softwareimage
    ADD CONSTRAINT devices_softwareimage_pkey PRIMARY KEY (id);


--
-- Name: display_widgets_dashboardwidget_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY display_widgets_dashboardwidget
    ADD CONSTRAINT display_widgets_dashboardwidget_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: grid; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: encryption_encryptionkey_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY encryption_encryptionkey
    ADD CONSTRAINT encryption_encryptionkey_pkey PRIMARY KEY (id);


--
-- Name: energinet_co2_modelbinding_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energinet_co2_modelbinding
    ADD CONSTRAINT energinet_co2_modelbinding_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_districtheatingconsump_salesopportunity_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptiontotal
    ADD CONSTRAINT energy_breakdown_districtheatingconsump_salesopportunity_id_key UNIQUE (salesopportunity_id);


--
-- Name: energy_breakdown_districtheatingconsumptio_energyusearea_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptionarea
    ADD CONSTRAINT energy_breakdown_districtheatingconsumptio_energyusearea_id_key UNIQUE (energyusearea_id);


--
-- Name: energy_breakdown_districtheatingconsumptionarea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptionarea
    ADD CONSTRAINT energy_breakdown_districtheatingconsumptionarea_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_districtheatingconsumptiontotal_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptiontotal
    ADD CONSTRAINT energy_breakdown_districtheatingconsumptiontotal_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_electricityconsumption_salesopportunity_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptiontotal
    ADD CONSTRAINT energy_breakdown_electricityconsumption_salesopportunity_id_key UNIQUE (salesopportunity_id);


--
-- Name: energy_breakdown_electricityconsumptionare_energyusearea_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptionarea
    ADD CONSTRAINT energy_breakdown_electricityconsumptionare_energyusearea_id_key UNIQUE (energyusearea_id);


--
-- Name: energy_breakdown_electricityconsumptionarea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptionarea
    ADD CONSTRAINT energy_breakdown_electricityconsumptionarea_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_electricityconsumptiontotal_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptiontotal
    ADD CONSTRAINT energy_breakdown_electricityconsumptiontotal_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_fuelconsumptionarea_energyusearea_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptionarea
    ADD CONSTRAINT energy_breakdown_fuelconsumptionarea_energyusearea_id_key UNIQUE (energyusearea_id);


--
-- Name: energy_breakdown_fuelconsumptionarea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptionarea
    ADD CONSTRAINT energy_breakdown_fuelconsumptionarea_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_fuelconsumptiontotal_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptiontotal
    ADD CONSTRAINT energy_breakdown_fuelconsumptiontotal_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_fuelconsumptiontotal_salesopportunity_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptiontotal
    ADD CONSTRAINT energy_breakdown_fuelconsumptiontotal_salesopportunity_id_key UNIQUE (salesopportunity_id);


--
-- Name: energy_breakdown_proposedaction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_proposedaction
    ADD CONSTRAINT energy_breakdown_proposedaction_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_waterconsumptionarea_energyusearea_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_waterconsumptionarea
    ADD CONSTRAINT energy_breakdown_waterconsumptionarea_energyusearea_id_key UNIQUE (energyusearea_id);


--
-- Name: energy_breakdown_waterconsumptionarea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_waterconsumptionarea
    ADD CONSTRAINT energy_breakdown_waterconsumptionarea_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_waterconsumptiontotal_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_waterconsumptiontotal
    ADD CONSTRAINT energy_breakdown_waterconsumptiontotal_pkey PRIMARY KEY (id);


--
-- Name: energy_breakdown_waterconsumptiontotal_salesopportunity_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_breakdown_waterconsumptiontotal
    ADD CONSTRAINT energy_breakdown_waterconsumptiontotal_salesopportunity_id_key UNIQUE (salesopportunity_id);


--
-- Name: energy_projects_energyproject_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_projects_energyproject
    ADD CONSTRAINT energy_projects_energyproject_pkey PRIMARY KEY (id);


--
-- Name: energy_projects_ledlightproject_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_projects_ledlightproject
    ADD CONSTRAINT energy_projects_ledlightproject_pkey PRIMARY KEY (id);


--
-- Name: energy_use_reports_energyusea_energyusearea_id_consumptionm_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusearea_measurement_points
    ADD CONSTRAINT energy_use_reports_energyusea_energyusearea_id_consumptionm_key UNIQUE (energyusearea_id, consumptionmeasurementpoint_id);


--
-- Name: energy_use_reports_energyusearea_measurement_points_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusearea_measurement_points
    ADD CONSTRAINT energy_use_reports_energyusearea_measurement_points_pkey PRIMARY KEY (id);


--
-- Name: energy_use_reports_energyusearea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusearea
    ADD CONSTRAINT energy_use_reports_energyusearea_pkey PRIMARY KEY (id);


--
-- Name: energy_use_reports_energyuser_energyusereport_id_consumptio_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusereport_main_measurement_points
    ADD CONSTRAINT energy_use_reports_energyuser_energyusereport_id_consumptio_key UNIQUE (energyusereport_id, consumptionmeasurementpoint_id);


--
-- Name: energy_use_reports_energyusereport_main_measurement_points_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusereport_main_measurement_points
    ADD CONSTRAINT energy_use_reports_energyusereport_main_measurement_points_pkey PRIMARY KEY (id);


--
-- Name: energy_use_reports_energyusereport_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energy_use_reports_energyusereport
    ADD CONSTRAINT energy_use_reports_energyusereport_pkey PRIMARY KEY (id);


--
-- Name: energyperformances_energyperformance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_energyperformance
    ADD CONSTRAINT energyperformances_energyperformance_pkey PRIMARY KEY (id);


--
-- Name: energyperformances_production_productionenergyperformance__key1; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_consumptiong23ca
    ADD CONSTRAINT energyperformances_production_productionenergyperformance__key1 UNIQUE (productionenergyperformance_id, consumptiongroup_id);


--
-- Name: energyperformances_production_productionenergyperformance_i_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_productiongroups
    ADD CONSTRAINT energyperformances_production_productionenergyperformance_i_key UNIQUE (productionenergyperformance_id, productiongroup_id);


--
-- Name: energyperformances_productionenergyperformance_consumption_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_consumptiong23ca
    ADD CONSTRAINT energyperformances_productionenergyperformance_consumption_pkey PRIMARY KEY (id);


--
-- Name: energyperformances_productionenergyperformance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_productionenergyperformance
    ADD CONSTRAINT energyperformances_productionenergyperformance_pkey PRIMARY KEY (energyperformance_ptr_id);


--
-- Name: energyperformances_productionenergyperformance_productiong_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_productiongroups
    ADD CONSTRAINT energyperformances_productionenergyperformance_productiong_pkey PRIMARY KEY (id);


--
-- Name: energyperformances_timeenergy_timeenergyperformance_id_cons_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_timeenergyperformance_consumptiongroups
    ADD CONSTRAINT energyperformances_timeenergy_timeenergyperformance_id_cons_key UNIQUE (timeenergyperformance_id, consumptiongroup_id);


--
-- Name: energyperformances_timeenergyperformance_consumptiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_timeenergyperformance_consumptiongroups
    ADD CONSTRAINT energyperformances_timeenergyperformance_consumptiongroups_pkey PRIMARY KEY (id);


--
-- Name: energyperformances_timeenergyperformance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyperformances_timeenergyperformance
    ADD CONSTRAINT energyperformances_timeenergyperformance_pkey PRIMARY KEY (energyperformance_ptr_id);


--
-- Name: energyuses_energyuse_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY energyuses_energyuse
    ADD CONSTRAINT energyuses_energyuse_pkey PRIMARY KEY (consumptiongroup_ptr_id);


--
-- Name: enpi_reports_enpireport_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY enpi_reports_enpireport
    ADD CONSTRAINT enpi_reports_enpireport_pkey PRIMARY KEY (id);


--
-- Name: enpi_reports_enpiusearea_meas_enpiusearea_id_consumptionmea_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY enpi_reports_enpiusearea_measurement_points
    ADD CONSTRAINT enpi_reports_enpiusearea_meas_enpiusearea_id_consumptionmea_key UNIQUE (enpiusearea_id, consumptionmeasurementpoint_id);


--
-- Name: enpi_reports_enpiusearea_measurement_points_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY enpi_reports_enpiusearea_measurement_points
    ADD CONSTRAINT enpi_reports_enpiusearea_measurement_points_pkey PRIMARY KEY (id);


--
-- Name: enpi_reports_enpiusearea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY enpi_reports_enpiusearea
    ADD CONSTRAINT enpi_reports_enpiusearea_pkey PRIMARY KEY (id);


--
-- Name: global_datasources_globaldatasou_app_label_codename_country_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY global_datasources_globaldatasource
    ADD CONSTRAINT global_datasources_globaldatasou_app_label_codename_country_key UNIQUE (app_label, codename, country);


--
-- Name: global_datasources_globaldatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY global_datasources_globaldatasource
    ADD CONSTRAINT global_datasources_globaldatasource_pkey PRIMARY KEY (datasource_ptr_id);


--
-- Name: indexes_datasourceindexadapter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_datasourceindexadapter
    ADD CONSTRAINT indexes_datasourceindexadapter_pkey PRIMARY KEY (index_ptr_id);


--
-- Name: indexes_derivedindexperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_derivedindexperiod
    ADD CONSTRAINT indexes_derivedindexperiod_pkey PRIMARY KEY (id);


--
-- Name: indexes_entry_index_id_from_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_entry
    ADD CONSTRAINT indexes_entry_index_id_from_timestamp_key UNIQUE (index_id, from_timestamp);


--
-- Name: indexes_entry_index_id_to_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_entry
    ADD CONSTRAINT indexes_entry_index_id_to_timestamp_key UNIQUE (index_id, to_timestamp);


--
-- Name: indexes_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_entry
    ADD CONSTRAINT indexes_entry_pkey PRIMARY KEY (id);


--
-- Name: indexes_index_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_index
    ADD CONSTRAINT indexes_index_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: indexes_seasonindexperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_seasonindexperiod
    ADD CONSTRAINT indexes_seasonindexperiod_pkey PRIMARY KEY (id);


--
-- Name: indexes_spotmapping_index_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_spotmapping
    ADD CONSTRAINT indexes_spotmapping_index_id_key UNIQUE (index_id);


--
-- Name: indexes_spotmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_spotmapping
    ADD CONSTRAINT indexes_spotmapping_pkey PRIMARY KEY (id);


--
-- Name: indexes_standardmonthindex_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY indexes_standardmonthindex
    ADD CONSTRAINT indexes_standardmonthindex_pkey PRIMARY KEY (index_ptr_id);


--
-- Name: installation_surveys_billingmeter_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installation_surveys_billingmeter
    ADD CONSTRAINT installation_surveys_billingmeter_pkey PRIMARY KEY (id);


--
-- Name: installation_surveys_billingmeterappendix_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installation_surveys_billingmeterappendix
    ADD CONSTRAINT installation_surveys_billingmeterappendix_pkey PRIMARY KEY (id);


--
-- Name: installation_surveys_energyusearea_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installation_surveys_energyusearea
    ADD CONSTRAINT installation_surveys_energyusearea_pkey PRIMARY KEY (id);


--
-- Name: installation_surveys_proposedaction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installation_surveys_proposedaction
    ADD CONSTRAINT installation_surveys_proposedaction_pkey PRIMARY KEY (id);


--
-- Name: installation_surveys_workhours_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installation_surveys_workhours
    ADD CONSTRAINT installation_surveys_workhours_pkey PRIMARY KEY (id);


--
-- Name: installations_floorplan_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_floorplan
    ADD CONSTRAINT installations_floorplan_pkey PRIMARY KEY (id);


--
-- Name: installations_gatewayinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_gatewayinstallation
    ADD CONSTRAINT installations_gatewayinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: installations_installationphoto_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_installationphoto
    ADD CONSTRAINT installations_installationphoto_pkey PRIMARY KEY (id);


--
-- Name: installations_meterinstallati_meterinstallation_id_dataneed_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_meterinstallation_input_satisfies_dataneeds
    ADD CONSTRAINT installations_meterinstallati_meterinstallation_id_dataneed_key UNIQUE (meterinstallation_id, dataneed_id);


--
-- Name: installations_meterinstallation_input_satisfies_dataneeds_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_meterinstallation_input_satisfies_dataneeds
    ADD CONSTRAINT installations_meterinstallation_input_satisfies_dataneeds_pkey PRIMARY KEY (id);


--
-- Name: installations_meterinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_meterinstallation
    ADD CONSTRAINT installations_meterinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: installations_productinstalla_floorplan_id_installation_num_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_productinstallation
    ADD CONSTRAINT installations_productinstalla_floorplan_id_installation_num_key UNIQUE (floorplan_id, installation_number);


--
-- Name: installations_productinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_productinstallation
    ADD CONSTRAINT installations_productinstallation_pkey PRIMARY KEY (id);


--
-- Name: installations_pulseemitterins_pulseemitterinstallation_id_d_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_pulseemitterinstallation_input_satisfies_data7b36
    ADD CONSTRAINT installations_pulseemitterins_pulseemitterinstallation_id_d_key UNIQUE (pulseemitterinstallation_id, dataneed_id);


--
-- Name: installations_pulseemitterinstallation_input_satisfies_dat_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_pulseemitterinstallation_input_satisfies_data7b36
    ADD CONSTRAINT installations_pulseemitterinstallation_input_satisfies_dat_pkey PRIMARY KEY (id);


--
-- Name: installations_pulseemitterinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_pulseemitterinstallation
    ADD CONSTRAINT installations_pulseemitterinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: installations_repeaterinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_repeaterinstallation
    ADD CONSTRAINT installations_repeaterinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: installations_tripleinputmete_tripleinputmeterinstallation__key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input3_satisfies9eaa
    ADD CONSTRAINT installations_tripleinputmete_tripleinputmeterinstallation__key UNIQUE (tripleinputmeterinstallation_id, dataneed_id);


--
-- Name: installations_tripleinputmete_tripleinputmeterinstallation_key1; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input2_satisfies1aad
    ADD CONSTRAINT installations_tripleinputmete_tripleinputmeterinstallation_key1 UNIQUE (tripleinputmeterinstallation_id, dataneed_id);


--
-- Name: installations_tripleinputmete_tripleinputmeterinstallation_key2; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input1_satisfies0539
    ADD CONSTRAINT installations_tripleinputmete_tripleinputmeterinstallation_key2 UNIQUE (tripleinputmeterinstallation_id, dataneed_id);


--
-- Name: installations_tripleinputmeterinstallation_input1_satisfie_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input1_satisfies0539
    ADD CONSTRAINT installations_tripleinputmeterinstallation_input1_satisfie_pkey PRIMARY KEY (id);


--
-- Name: installations_tripleinputmeterinstallation_input2_satisfie_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input2_satisfies1aad
    ADD CONSTRAINT installations_tripleinputmeterinstallation_input2_satisfie_pkey PRIMARY KEY (id);


--
-- Name: installations_tripleinputmeterinstallation_input3_satisfie_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input3_satisfies9eaa
    ADD CONSTRAINT installations_tripleinputmeterinstallation_input3_satisfie_pkey PRIMARY KEY (id);


--
-- Name: installations_tripleinputmeterinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation
    ADD CONSTRAINT installations_tripleinputmeterinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: installations_triplepulsecollectorinstallation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecollectorinstallation_pkey PRIMARY KEY (productinstallation_ptr_id);


--
-- Name: manage_collections_collectionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manage_collections_collectionitem
    ADD CONSTRAINT manage_collections_collectionitem_pkey PRIMARY KEY (item_ptr_id);


--
-- Name: manage_collections_floorplan_collection_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manage_collections_floorplan
    ADD CONSTRAINT manage_collections_floorplan_collection_id_key UNIQUE (collection_id);


--
-- Name: manage_collections_floorplan_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manage_collections_floorplan
    ADD CONSTRAINT manage_collections_floorplan_pkey PRIMARY KEY (id);


--
-- Name: manage_collections_infoitem_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manage_collections_infoitem
    ADD CONSTRAINT manage_collections_infoitem_pkey PRIMARY KEY (item_ptr_id);


--
-- Name: manage_collections_item_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manage_collections_item
    ADD CONSTRAINT manage_collections_item_pkey PRIMARY KEY (id);


--
-- Name: manual_reporting_manuallyreportedconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manual_reporting_manuallyreportedconsumption
    ADD CONSTRAINT manual_reporting_manuallyreportedconsumption_pkey PRIMARY KEY (consumption_ptr_id);


--
-- Name: manual_reporting_manuallyreportedproduction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY manual_reporting_manuallyreportedproduction
    ADD CONSTRAINT manual_reporting_manuallyreportedproduction_pkey PRIMARY KEY (production_ptr_id);


--
-- Name: measurementpoints_chain_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_chain
    ADD CONSTRAINT measurementpoints_chain_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_chainlink_chain_id_valid_from_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_chainlink
    ADD CONSTRAINT measurementpoints_chainlink_chain_id_valid_from_key UNIQUE (chain_id, valid_from);


--
-- Name: measurementpoints_chainlink_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_chainlink
    ADD CONSTRAINT measurementpoints_chainlink_pkey PRIMARY KEY (id);


--
-- Name: measurementpoints_dataseries_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_dataseries
    ADD CONSTRAINT measurementpoints_dataseries_pkey PRIMARY KEY (id);


--
-- Name: measurementpoints_degreedaycorrection_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_degreedaycorrection
    ADD CONSTRAINT measurementpoints_degreedaycorrection_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_graph_collection_id_role_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_graph
    ADD CONSTRAINT measurementpoints_graph_collection_id_role_key UNIQUE (collection_id, role);


--
-- Name: measurementpoints_graph_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_graph
    ADD CONSTRAINT measurementpoints_graph_pkey PRIMARY KEY (id);


--
-- Name: measurementpoints_heatingdegreedays_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_heatingdegreedays
    ADD CONSTRAINT measurementpoints_heatingdegreedays_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_indexcalculation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_indexcalculation
    ADD CONSTRAINT measurementpoints_indexcalculation_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_link_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_link
    ADD CONSTRAINT measurementpoints_link_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_meantemperaturechange_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_meantemperaturechange
    ADD CONSTRAINT measurementpoints_meantemperaturechange_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_multiplication_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_multiplication
    ADD CONSTRAINT measurementpoints_multiplication_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_piecewiseconstantintegral_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_piecewiseconstantintegral
    ADD CONSTRAINT measurementpoints_piecewiseconstantintegral_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_rateconversion_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_rateconversion
    ADD CONSTRAINT measurementpoints_rateconversion_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_simplelinearregression_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_simplelinearregression
    ADD CONSTRAINT measurementpoints_simplelinearregression_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_storeddata_data_series_id_timestamp_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_storeddata
    ADD CONSTRAINT measurementpoints_storeddata_data_series_id_timestamp_key UNIQUE (data_series_id, "timestamp");


--
-- Name: measurementpoints_storeddata_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_storeddata
    ADD CONSTRAINT measurementpoints_storeddata_pkey PRIMARY KEY (id);


--
-- Name: measurementpoints_summation_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_summation
    ADD CONSTRAINT measurementpoints_summation_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: measurementpoints_summationterm_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_summationterm
    ADD CONSTRAINT measurementpoints_summationterm_pkey PRIMARY KEY (id);


--
-- Name: measurementpoints_utilization_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY measurementpoints_utilization
    ADD CONSTRAINT measurementpoints_utilization_pkey PRIMARY KEY (dataseries_ptr_id);


--
-- Name: opportunities_opportunity_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY opportunities_opportunity
    ADD CONSTRAINT opportunities_opportunity_pkey PRIMARY KEY (id);


--
-- Name: price_relay_site_pricerelayproject_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY price_relay_site_pricerelayproject
    ADD CONSTRAINT price_relay_site_pricerelayproject_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiod__processperiod_id_energyperfor_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_enpis
    ADD CONSTRAINT processperiods_processperiod__processperiod_id_energyperfor_key UNIQUE (processperiod_id, energyperformance_id);


--
-- Name: processperiods_processperiod__processperiod_id_energyuse_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_significant_energyuses
    ADD CONSTRAINT processperiods_processperiod__processperiod_id_energyuse_id_key UNIQUE (processperiod_id, energyuse_id);


--
-- Name: processperiods_processperiod__processperiod_id_opportunity__key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_rejected_opportunities
    ADD CONSTRAINT processperiods_processperiod__processperiod_id_opportunity__key UNIQUE (processperiod_id, opportunity_id);


--
-- Name: processperiods_processperiod__processperiod_id_opportunity_key1; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_accepted_opportunities
    ADD CONSTRAINT processperiods_processperiod__processperiod_id_opportunity_key1 UNIQUE (processperiod_id, opportunity_id);


--
-- Name: processperiods_processperiod_accepted_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_accepted_opportunities
    ADD CONSTRAINT processperiods_processperiod_accepted_opportunities_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiod_enpis_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_enpis
    ADD CONSTRAINT processperiods_processperiod_enpis_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod
    ADD CONSTRAINT processperiods_processperiod_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiod_rejected_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_rejected_opportunities
    ADD CONSTRAINT processperiods_processperiod_rejected_opportunities_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiod_significant_energyuses_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiod_significant_energyuses
    ADD CONSTRAINT processperiods_processperiod_significant_energyuses_pkey PRIMARY KEY (id);


--
-- Name: processperiods_processperiodgoal_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY processperiods_processperiodgoal
    ADD CONSTRAINT processperiods_processperiodgoal_pkey PRIMARY KEY (id);


--
-- Name: productions_nonpulseperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_nonpulseperiod
    ADD CONSTRAINT productions_nonpulseperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: productions_offlinetolerance_datasequence_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_offlinetolerance
    ADD CONSTRAINT productions_offlinetolerance_datasequence_id_key UNIQUE (datasequence_id);


--
-- Name: productions_offlinetolerance_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_offlinetolerance
    ADD CONSTRAINT productions_offlinetolerance_pkey PRIMARY KEY (id);


--
-- Name: productions_period_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_period
    ADD CONSTRAINT productions_period_pkey PRIMARY KEY (id);


--
-- Name: productions_production_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_production
    ADD CONSTRAINT productions_production_pkey PRIMARY KEY (id);


--
-- Name: productions_productiongroup_p_productiongroup_id_production_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_productiongroup_productions
    ADD CONSTRAINT productions_productiongroup_p_productiongroup_id_production_key UNIQUE (productiongroup_id, production_id);


--
-- Name: productions_productiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_productiongroup
    ADD CONSTRAINT productions_productiongroup_pkey PRIMARY KEY (id);


--
-- Name: productions_productiongroup_productions_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_productiongroup_productions
    ADD CONSTRAINT productions_productiongroup_productions_pkey PRIMARY KEY (id);


--
-- Name: productions_pulseperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_pulseperiod
    ADD CONSTRAINT productions_pulseperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: productions_singlevalueperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY productions_singlevalueperiod
    ADD CONSTRAINT productions_singlevalueperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: products_historicalproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT products_historicalproduct_pkey PRIMARY KEY (id);


--
-- Name: products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY products_productcategory
    ADD CONSTRAINT products_productcategory_pkey PRIMARY KEY (id);


--
-- Name: projects_additionalsaving_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_additionalsaving
    ADD CONSTRAINT projects_additionalsaving_pkey PRIMARY KEY (id);


--
-- Name: projects_benchmarkproject_bas_benchmarkproject_id_consumpti_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_benchmarkproject_baseline_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_bas_benchmarkproject_id_consumpti_key UNIQUE (benchmarkproject_id, consumptionmeasurementpoint_id);


--
-- Name: projects_benchmarkproject_baseline_measurement_points_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_benchmarkproject_baseline_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_baseline_measurement_points_pkey PRIMARY KEY (id);


--
-- Name: projects_benchmarkproject_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_benchmarkproject
    ADD CONSTRAINT projects_benchmarkproject_pkey PRIMARY KEY (id);


--
-- Name: projects_benchmarkproject_res_benchmarkproject_id_consumpti_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_benchmarkproject_result_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_res_benchmarkproject_id_consumpti_key UNIQUE (benchmarkproject_id, consumptionmeasurementpoint_id);


--
-- Name: projects_benchmarkproject_result_measurement_points_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_benchmarkproject_result_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_result_measurement_points_pkey PRIMARY KEY (id);


--
-- Name: projects_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY projects_cost
    ADD CONSTRAINT projects_cost_pkey PRIMARY KEY (id);


--
-- Name: provider_datasources_providerdatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY provider_datasources_providerdatasource
    ADD CONSTRAINT provider_datasources_providerdatasource_pkey PRIMARY KEY (datasource_ptr_id);


--
-- Name: providers_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY providers_provider
    ADD CONSTRAINT providers_provider_pkey PRIMARY KEY (id);


--
-- Name: reports_report_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY reports_report
    ADD CONSTRAINT reports_report_pkey PRIMARY KEY (id);


--
-- Name: rules_dateexception_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_dateexception
    ADD CONSTRAINT rules_dateexception_pkey PRIMARY KEY (id);


--
-- Name: rules_emailaction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_emailaction
    ADD CONSTRAINT rules_emailaction_pkey PRIMARY KEY (id);


--
-- Name: rules_indexinvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_indexinvariant
    ADD CONSTRAINT rules_indexinvariant_pkey PRIMARY KEY (id);


--
-- Name: rules_inputinvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_inputinvariant
    ADD CONSTRAINT rules_inputinvariant_pkey PRIMARY KEY (id);


--
-- Name: rules_minimizerule_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_minimizerule
    ADD CONSTRAINT rules_minimizerule_pkey PRIMARY KEY (userrule_ptr_id);


--
-- Name: rules_phoneaction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_phoneaction
    ADD CONSTRAINT rules_phoneaction_pkey PRIMARY KEY (id);


--
-- Name: rules_relayaction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_relayaction
    ADD CONSTRAINT rules_relayaction_pkey PRIMARY KEY (id);


--
-- Name: rules_triggeredrule_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_triggeredrule
    ADD CONSTRAINT rules_triggeredrule_pkey PRIMARY KEY (userrule_ptr_id);


--
-- Name: rules_userrule_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY rules_userrule
    ADD CONSTRAINT rules_userrule_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_activityentry_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_activityentry
    ADD CONSTRAINT salesopportunities_activityentry_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_industryty_industry_type_id_energy_grou_key1; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_industrytypesavings
    ADD CONSTRAINT salesopportunities_industryty_industry_type_id_energy_grou_key1 UNIQUE (industry_type_id, energy_group);


--
-- Name: salesopportunities_industryty_industry_type_id_energy_group_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_industrytypeusedistribution
    ADD CONSTRAINT salesopportunities_industryty_industry_type_id_energy_group_key UNIQUE (industry_type_id, energy_group);


--
-- Name: salesopportunities_industrytype_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_industrytype
    ADD CONSTRAINT salesopportunities_industrytype_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_industrytypesavings_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_industrytypesavings
    ADD CONSTRAINT salesopportunities_industrytypesavings_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_industrytypeusedistribution_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_industrytypeusedistribution
    ADD CONSTRAINT salesopportunities_industrytypeusedistribution_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_salesoppor_sales_opportunity_id_energy__key1; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunitysavings
    ADD CONSTRAINT salesopportunities_salesoppor_sales_opportunity_id_energy__key1 UNIQUE (sales_opportunity_id, energy_group);


--
-- Name: salesopportunities_salesoppor_sales_opportunity_id_energy_g_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunityusedistribution
    ADD CONSTRAINT salesopportunities_salesoppor_sales_opportunity_id_energy_g_key UNIQUE (sales_opportunity_id, energy_group);


--
-- Name: salesopportunities_salesoppor_salesopportunity_id_floorplan_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunity_floorplans
    ADD CONSTRAINT salesopportunities_salesoppor_salesopportunity_id_floorplan_key UNIQUE (salesopportunity_id, floorplan_id);


--
-- Name: salesopportunities_salesopportunity_floorplans_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunity_floorplans
    ADD CONSTRAINT salesopportunities_salesopportunity_floorplans_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_salesopportunity_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_salesopportunitysavings_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunitysavings
    ADD CONSTRAINT salesopportunities_salesopportunitysavings_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_salesopportunityusedistribution_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_salesopportunityusedistribution
    ADD CONSTRAINT salesopportunities_salesopportunityusedistribution_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_surveyinstructi_sales_opportunity_id_use_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_surveyinstruction
    ADD CONSTRAINT salesopportunities_surveyinstructi_sales_opportunity_id_use_key UNIQUE (sales_opportunity_id, use);


--
-- Name: salesopportunities_surveyinstruction_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_surveyinstruction
    ADD CONSTRAINT salesopportunities_surveyinstruction_pkey PRIMARY KEY (id);


--
-- Name: salesopportunities_task_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY salesopportunities_task
    ADD CONSTRAINT salesopportunities_task_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: suppliers_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY suppliers_supplier
    ADD CONSTRAINT suppliers_supplier_pkey PRIMARY KEY (id);


--
-- Name: system_health_site_healthreport_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY system_health_site_healthreport
    ADD CONSTRAINT system_health_site_healthreport_pkey PRIMARY KEY (id);


--
-- Name: tariffs_energytariff_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_energytariff
    ADD CONSTRAINT tariffs_energytariff_pkey PRIMARY KEY (tariff_ptr_id);


--
-- Name: tariffs_fixedpriceperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_fixedpriceperiod
    ADD CONSTRAINT tariffs_fixedpriceperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: tariffs_period_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_period
    ADD CONSTRAINT tariffs_period_pkey PRIMARY KEY (id);


--
-- Name: tariffs_spotpriceperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_spotpriceperiod
    ADD CONSTRAINT tariffs_spotpriceperiod_pkey PRIMARY KEY (period_ptr_id);


--
-- Name: tariffs_tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_tariff
    ADD CONSTRAINT tariffs_tariff_pkey PRIMARY KEY (id);


--
-- Name: tariffs_volumetariff_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY tariffs_volumetariff
    ADD CONSTRAINT tariffs_volumetariff_pkey PRIMARY KEY (tariff_ptr_id);


--
-- Name: token_auth_tokendata_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY token_auth_tokendata
    ADD CONSTRAINT token_auth_tokendata_pkey PRIMARY KEY (key);


--
-- Name: token_auth_tokendata_user_id_key; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY token_auth_tokendata
    ADD CONSTRAINT token_auth_tokendata_user_id_key UNIQUE (user_id);


--
-- Name: users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: portal; Tablespace: 
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: celery_taskmeta_hidden; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX celery_taskmeta_hidden ON celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX celery_taskmeta_task_id_like ON celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_hidden; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_hidden ON celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_taskset_id_like ON celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: co2conversions_co2conversion_mainconsumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX co2conversions_co2conversion_mainconsumption_id ON co2conversions_co2conversion USING btree (mainconsumption_id);


--
-- Name: co2conversions_co2conversion_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX co2conversions_co2conversion_subclass_id ON co2conversions_co2conversion USING btree (subclass_id);


--
-- Name: co2conversions_dynamicco2conversion_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX co2conversions_dynamicco2conversion_datasource_id ON co2conversions_dynamicco2conversion USING btree (datasource_id);


--
-- Name: consumptions_consumption_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumption_customer_id ON consumptions_consumption USING btree (customer_id);


--
-- Name: consumptions_consumption_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumption_subclass_id ON consumptions_consumption USING btree (subclass_id);


--
-- Name: consumptions_consumption_volumetoenergyconversion_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumption_volumetoenergyconversion_id ON consumptions_consumption USING btree (volumetoenergyconversion_id);


--
-- Name: consumptions_consumptiongroup_consumptions_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumptiongroup_consumptions_consumption_id ON consumptions_consumptiongroup_consumptions USING btree (consumption_id);


--
-- Name: consumptions_consumptiongroup_consumptions_consumptiongroup_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumptiongroup_consumptions_consumptiongroup_id ON consumptions_consumptiongroup_consumptions USING btree (consumptiongroup_id);


--
-- Name: consumptions_consumptiongroup_cost_compensation_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumptiongroup_cost_compensation_id ON consumptions_consumptiongroup USING btree (cost_compensation_id);


--
-- Name: consumptions_consumptiongroup_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumptiongroup_customer_id ON consumptions_consumptiongroup USING btree (customer_id);


--
-- Name: consumptions_consumptiongroup_mainconsumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_consumptiongroup_mainconsumption_id ON consumptions_consumptiongroup USING btree (mainconsumption_id);


--
-- Name: consumptions_mainconsumption_consumptions_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_mainconsumption_consumptions_consumption_id ON consumptions_mainconsumption_consumptions USING btree (consumption_id);


--
-- Name: consumptions_mainconsumption_consumptions_mainconsumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_mainconsumption_consumptions_mainconsumption_id ON consumptions_mainconsumption_consumptions USING btree (mainconsumption_id);


--
-- Name: consumptions_mainconsumption_cost_compensation_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_mainconsumption_cost_compensation_id ON consumptions_mainconsumption USING btree (cost_compensation_id);


--
-- Name: consumptions_mainconsumption_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_mainconsumption_customer_id ON consumptions_mainconsumption USING btree (customer_id);


--
-- Name: consumptions_mainconsumption_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_mainconsumption_tariff_id ON consumptions_mainconsumption USING btree (tariff_id);


--
-- Name: consumptions_nonpulseperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_nonpulseperiod_datasource_id ON consumptions_nonpulseperiod USING btree (datasource_id);


--
-- Name: consumptions_period_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_period_datasequence_id ON consumptions_period USING btree (datasequence_id);


--
-- Name: consumptions_period_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_period_subclass_id ON consumptions_period USING btree (subclass_id);


--
-- Name: consumptions_pulseperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX consumptions_pulseperiod_datasource_id ON consumptions_pulseperiod USING btree (datasource_id);


--
-- Name: cost_compensations_costcompensation_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX cost_compensations_costcompensation_customer_id ON cost_compensations_costcompensation USING btree (customer_id);


--
-- Name: cost_compensations_costcompensation_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX cost_compensations_costcompensation_subclass_id ON cost_compensations_costcompensation USING btree (subclass_id);


--
-- Name: cost_compensations_period_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX cost_compensations_period_datasequence_id ON cost_compensations_period USING btree (datasequence_id);


--
-- Name: cost_compensations_period_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX cost_compensations_period_subclass_id ON cost_compensations_period USING btree (subclass_id);


--
-- Name: customer_datasources_customerdatasource_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customer_datasources_customerdatasource_customer_id ON customer_datasources_customerdatasource USING btree (customer_id);


--
-- Name: customers_collection_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_customer_id ON customers_collection USING btree (customer_id);


--
-- Name: customers_collection_level; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_level ON customers_collection USING btree (level);


--
-- Name: customers_collection_lft; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_lft ON customers_collection USING btree (lft);


--
-- Name: customers_collection_parent_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_parent_id ON customers_collection USING btree (parent_id);


--
-- Name: customers_collection_relay_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_relay_id ON customers_collection USING btree (relay_id);


--
-- Name: customers_collection_rght; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_rght ON customers_collection USING btree (rght);


--
-- Name: customers_collection_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_subclass_id ON customers_collection USING btree (subclass_id);


--
-- Name: customers_collection_tree_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_collection_tree_id ON customers_collection USING btree (tree_id);


--
-- Name: customers_customer_created_by_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_created_by_id ON customers_customer USING btree (created_by_id);


--
-- Name: customers_customer_electricity_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_electricity_tariff_id ON customers_customer USING btree (electricity_tariff_id);


--
-- Name: customers_customer_gas_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_gas_tariff_id ON customers_customer USING btree (gas_tariff_id);


--
-- Name: customers_customer_heat_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_heat_tariff_id ON customers_customer USING btree (heat_tariff_id);


--
-- Name: customers_customer_industry_types_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_industry_types_customer_id ON customers_customer_industry_types USING btree (customer_id);


--
-- Name: customers_customer_industry_types_industrytype_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_industry_types_industrytype_id ON customers_customer_industry_types USING btree (industrytype_id);


--
-- Name: customers_customer_oil_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_oil_tariff_id ON customers_customer USING btree (oil_tariff_id);


--
-- Name: customers_customer_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_provider_id ON customers_customer USING btree (provider_id);


--
-- Name: customers_customer_water_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_customer_water_tariff_id ON customers_customer USING btree (water_tariff_id);


--
-- Name: customers_location_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_customer_id ON customers_location USING btree (customer_id);


--
-- Name: customers_location_level; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_level ON customers_location USING btree (level);


--
-- Name: customers_location_lft; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_lft ON customers_location USING btree (lft);


--
-- Name: customers_location_parent_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_parent_id ON customers_location USING btree (parent_id);


--
-- Name: customers_location_rght; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_rght ON customers_location USING btree (rght);


--
-- Name: customers_location_tree_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_location_tree_id ON customers_location USING btree (tree_id);


--
-- Name: customers_userprofile_collections_collection_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_userprofile_collections_collection_id ON customers_userprofile_collections USING btree (collection_id);


--
-- Name: customers_userprofile_collections_userprofile_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX customers_userprofile_collections_userprofile_id ON customers_userprofile_collections USING btree (userprofile_id);


--
-- Name: datahub_datahubconnection_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datahub_datahubconnection_customer_id ON datahub_datahubconnection USING btree (customer_id);


--
-- Name: datahub_datahubconnection_input_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datahub_datahubconnection_input_id ON datahub_datahubconnection USING btree (input_id);


--
-- Name: datahub_datahubconnection_meter_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datahub_datahubconnection_meter_id ON datahub_datahubconnection USING btree (meter_id);


--
-- Name: dataneeds_dataneed_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX dataneeds_dataneed_customer_id ON dataneeds_dataneed USING btree (customer_id);


--
-- Name: dataneeds_dataneed_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX dataneeds_dataneed_subclass_id ON dataneeds_dataneed USING btree (subclass_id);


--
-- Name: datasequence_adapters_consumptionaccumulationadapter_datase1fda; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequence_adapters_consumptionaccumulationadapter_datase1fda ON datasequence_adapters_consumptionaccumulationadapter USING btree (datasequence_id);


--
-- Name: datasequence_adapters_nonaccumulationadapter_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequence_adapters_nonaccumulationadapter_datasequence_id ON datasequence_adapters_nonaccumulationadapter USING btree (datasequence_id);


--
-- Name: datasequence_adapters_productionaccumulationadapter_dataseqb632; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequence_adapters_productionaccumulationadapter_dataseqb632 ON datasequence_adapters_productionaccumulationadapter USING btree (datasequence_id);


--
-- Name: datasequences_energypervolumedatasequence_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_energypervolumedatasequence_customer_id ON datasequences_energypervolumedatasequence USING btree (customer_id);


--
-- Name: datasequences_energypervolumedatasequence_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_energypervolumedatasequence_subclass_id ON datasequences_energypervolumedatasequence USING btree (subclass_id);


--
-- Name: datasequences_energypervolumeperiod_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_energypervolumeperiod_datasequence_id ON datasequences_energypervolumeperiod USING btree (datasequence_id);


--
-- Name: datasequences_energypervolumeperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_energypervolumeperiod_datasource_id ON datasequences_energypervolumeperiod USING btree (datasource_id);


--
-- Name: datasequences_nonaccumulationdatasequence_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_nonaccumulationdatasequence_customer_id ON datasequences_nonaccumulationdatasequence USING btree (customer_id);


--
-- Name: datasequences_nonaccumulationdatasequence_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_nonaccumulationdatasequence_subclass_id ON datasequences_nonaccumulationdatasequence USING btree (subclass_id);


--
-- Name: datasequences_nonaccumulationperiod_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_nonaccumulationperiod_datasequence_id ON datasequences_nonaccumulationperiod USING btree (datasequence_id);


--
-- Name: datasequences_nonaccumulationperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasequences_nonaccumulationperiod_datasource_id ON datasequences_nonaccumulationperiod USING btree (datasource_id);


--
-- Name: datasources_datasource_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX datasources_datasource_subclass_id ON datasources_datasource USING btree (subclass_id);


--
-- Name: devices_agent_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_agent_customer_id ON devices_agent USING btree (customer_id);


--
-- Name: devices_agent_location_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_agent_location_id ON devices_agent USING btree (location_id);


--
-- Name: devices_agentevent_agent_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_agentevent_agent_id ON devices_agentevent USING btree (agent_id);


--
-- Name: devices_agentstatechange_agent_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_agentstatechange_agent_id ON devices_agentstatechange USING btree (agent_id);


--
-- Name: devices_meter_agent_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_meter_agent_id ON devices_meter USING btree (agent_id);


--
-- Name: devices_meter_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_meter_customer_id ON devices_meter USING btree (customer_id);


--
-- Name: devices_meter_location_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_meter_location_id ON devices_meter USING btree (location_id);


--
-- Name: devices_meterstatechange_meter_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_meterstatechange_meter_id ON devices_meterstatechange USING btree (meter_id);


--
-- Name: devices_physicalinput_meter_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX devices_physicalinput_meter_id ON devices_physicalinput USING btree (meter_id);


--
-- Name: display_widgets_dashboardwidget_collection_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX display_widgets_dashboardwidget_collection_id ON display_widgets_dashboardwidget USING btree (collection_id);


--
-- Name: display_widgets_dashboardwidget_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX display_widgets_dashboardwidget_index_id ON display_widgets_dashboardwidget USING btree (index_id);


--
-- Name: display_widgets_dashboardwidget_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX display_widgets_dashboardwidget_user_id ON display_widgets_dashboardwidget USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djcelery_periodictask_crontab_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_periodictask_crontab_id ON djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_interval_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_periodictask_interval_id ON djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_name_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_periodictask_name_like ON djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_hidden; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_hidden ON djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_name; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name ON djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_name_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name_like ON djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state ON djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_state_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state_like ON djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_task_id_like ON djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_taskstate_tstamp; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_tstamp ON djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_worker_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_taskstate_worker_id ON djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_workerstate_hostname_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_workerstate_hostname_like ON djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: djcelery_workerstate_last_heartbeat; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX djcelery_workerstate_last_heartbeat ON djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: encryption_encryptionkey_content_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX encryption_encryptionkey_content_type_id ON encryption_encryptionkey USING btree (content_type_id);


--
-- Name: encryption_encryptionkey_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX encryption_encryptionkey_user_id ON encryption_encryptionkey USING btree (user_id);


--
-- Name: energinet_co2_modelbinding_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energinet_co2_modelbinding_index_id ON energinet_co2_modelbinding USING btree (index_id);


--
-- Name: energy_breakdown_districtheatingconsumptionarea_salesopportf089; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_districtheatingconsumptionarea_salesopportf089 ON energy_breakdown_districtheatingconsumptionarea USING btree (salesopportunity_id);


--
-- Name: energy_breakdown_electricityconsumptionarea_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_electricityconsumptionarea_salesopportunity_id ON energy_breakdown_electricityconsumptionarea USING btree (salesopportunity_id);


--
-- Name: energy_breakdown_fuelconsumptionarea_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_fuelconsumptionarea_salesopportunity_id ON energy_breakdown_fuelconsumptionarea USING btree (salesopportunity_id);


--
-- Name: energy_breakdown_proposedaction_energyusearea_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_proposedaction_energyusearea_id ON energy_breakdown_proposedaction USING btree (energyusearea_id);


--
-- Name: energy_breakdown_proposedaction_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_proposedaction_salesopportunity_id ON energy_breakdown_proposedaction USING btree (salesopportunity_id);


--
-- Name: energy_breakdown_waterconsumptionarea_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_breakdown_waterconsumptionarea_salesopportunity_id ON energy_breakdown_waterconsumptionarea USING btree (salesopportunity_id);


--
-- Name: energy_projects_energyproject_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_projects_energyproject_customer_id ON energy_projects_energyproject USING btree (customer_id);


--
-- Name: energy_projects_energyproject_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_projects_energyproject_datasource_id ON energy_projects_energyproject USING btree (datasource_id);


--
-- Name: energy_projects_energyproject_time_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_projects_energyproject_time_datasource_id ON energy_projects_energyproject USING btree (time_datasource_id);


--
-- Name: energy_projects_ledlightproject_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_projects_ledlightproject_customer_id ON energy_projects_ledlightproject USING btree (customer_id);


--
-- Name: energy_projects_ledlightproject_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_projects_ledlightproject_datasource_id ON energy_projects_ledlightproject USING btree (datasource_id);


--
-- Name: energy_use_reports_energyusearea_measurement_points_consumpd1ba; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusearea_measurement_points_consumpd1ba ON energy_use_reports_energyusearea_measurement_points USING btree (consumptionmeasurementpoint_id);


--
-- Name: energy_use_reports_energyusearea_measurement_points_energyub419; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusearea_measurement_points_energyub419 ON energy_use_reports_energyusearea_measurement_points USING btree (energyusearea_id);


--
-- Name: energy_use_reports_energyusearea_report_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusearea_report_id ON energy_use_reports_energyusearea USING btree (report_id);


--
-- Name: energy_use_reports_energyusereport_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusereport_customer_id ON energy_use_reports_energyusereport USING btree (customer_id);


--
-- Name: energy_use_reports_energyusereport_main_measurement_points_313d; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusereport_main_measurement_points_313d ON energy_use_reports_energyusereport_main_measurement_points USING btree (consumptionmeasurementpoint_id);


--
-- Name: energy_use_reports_energyusereport_main_measurement_points_4a82; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energy_use_reports_energyusereport_main_measurement_points_4a82 ON energy_use_reports_energyusereport_main_measurement_points USING btree (energyusereport_id);


--
-- Name: energyperformances_energyperformance_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_energyperformance_customer_id ON energyperformances_energyperformance USING btree (customer_id);


--
-- Name: energyperformances_energyperformance_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_energyperformance_subclass_id ON energyperformances_energyperformance USING btree (subclass_id);


--
-- Name: energyperformances_productionenergyperformance_consumptiong1cf7; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_productionenergyperformance_consumptiong1cf7 ON energyperformances_productionenergyperformance_consumptiong23ca USING btree (consumptiongroup_id);


--
-- Name: energyperformances_productionenergyperformance_consumptiongd8f2; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_productionenergyperformance_consumptiongd8f2 ON energyperformances_productionenergyperformance_consumptiong23ca USING btree (productionenergyperformance_id);


--
-- Name: energyperformances_productionenergyperformance_productiongr92f7; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_productionenergyperformance_productiongr92f7 ON energyperformances_productionenergyperformance_productiongroups USING btree (productionenergyperformance_id);


--
-- Name: energyperformances_productionenergyperformance_productiongre336; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_productionenergyperformance_productiongre336 ON energyperformances_productionenergyperformance_productiongroups USING btree (productiongroup_id);


--
-- Name: energyperformances_timeenergyperformance_consumptiongroups_273d; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_timeenergyperformance_consumptiongroups_273d ON energyperformances_timeenergyperformance_consumptiongroups USING btree (consumptiongroup_id);


--
-- Name: energyperformances_timeenergyperformance_consumptiongroups_c730; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX energyperformances_timeenergyperformance_consumptiongroups_c730 ON energyperformances_timeenergyperformance_consumptiongroups USING btree (timeenergyperformance_id);


--
-- Name: enpi_reports_enpireport_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX enpi_reports_enpireport_customer_id ON enpi_reports_enpireport USING btree (customer_id);


--
-- Name: enpi_reports_enpiusearea_energy_driver_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX enpi_reports_enpiusearea_energy_driver_id ON enpi_reports_enpiusearea USING btree (energy_driver_id);


--
-- Name: enpi_reports_enpiusearea_measurement_points_consumptionmeas8b22; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX enpi_reports_enpiusearea_measurement_points_consumptionmeas8b22 ON enpi_reports_enpiusearea_measurement_points USING btree (consumptionmeasurementpoint_id);


--
-- Name: enpi_reports_enpiusearea_measurement_points_enpiusearea_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX enpi_reports_enpiusearea_measurement_points_enpiusearea_id ON enpi_reports_enpiusearea_measurement_points USING btree (enpiusearea_id);


--
-- Name: enpi_reports_enpiusearea_report_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX enpi_reports_enpiusearea_report_id ON enpi_reports_enpiusearea USING btree (report_id);


--
-- Name: indexes_datasourceindexadapter_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_datasourceindexadapter_datasource_id ON indexes_datasourceindexadapter USING btree (datasource_id);


--
-- Name: indexes_derivedindexperiod_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_derivedindexperiod_index_id ON indexes_derivedindexperiod USING btree (index_id);


--
-- Name: indexes_derivedindexperiod_other_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_derivedindexperiod_other_index_id ON indexes_derivedindexperiod USING btree (other_index_id);


--
-- Name: indexes_entry_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_entry_index_id ON indexes_entry USING btree (index_id);


--
-- Name: indexes_index_collection_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_index_collection_id ON indexes_index USING btree (collection_id);


--
-- Name: indexes_seasonindexperiod_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX indexes_seasonindexperiod_index_id ON indexes_seasonindexperiod USING btree (index_id);


--
-- Name: installation_surveys_billingmeter_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_billingmeter_salesopportunity_id ON installation_surveys_billingmeter USING btree (salesopportunity_id);


--
-- Name: installation_surveys_billingmeterappendix_billingmeter_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_billingmeterappendix_billingmeter_id ON installation_surveys_billingmeterappendix USING btree (billingmeter_id);


--
-- Name: installation_surveys_energyusearea_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_energyusearea_salesopportunity_id ON installation_surveys_energyusearea USING btree (salesopportunity_id);


--
-- Name: installation_surveys_proposedaction_energyusearea_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_proposedaction_energyusearea_id ON installation_surveys_proposedaction USING btree (energyusearea_id);


--
-- Name: installation_surveys_proposedaction_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_proposedaction_salesopportunity_id ON installation_surveys_proposedaction USING btree (salesopportunity_id);


--
-- Name: installation_surveys_workhours_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installation_surveys_workhours_salesopportunity_id ON installation_surveys_workhours USING btree (salesopportunity_id);


--
-- Name: installations_floorplan_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_floorplan_customer_id ON installations_floorplan USING btree (customer_id);


--
-- Name: installations_installationphoto_installation_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_installationphoto_installation_id ON installations_installationphoto USING btree (installation_id);


--
-- Name: installations_meterinstallation_gateway_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_meterinstallation_gateway_id ON installations_meterinstallation USING btree (gateway_id);


--
-- Name: installations_meterinstallation_input_satisfies_dataneeds_d1223; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_meterinstallation_input_satisfies_dataneeds_d1223 ON installations_meterinstallation_input_satisfies_dataneeds USING btree (dataneed_id);


--
-- Name: installations_meterinstallation_input_satisfies_dataneeds_m98e5; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_meterinstallation_input_satisfies_dataneeds_m98e5 ON installations_meterinstallation_input_satisfies_dataneeds USING btree (meterinstallation_id);


--
-- Name: installations_productinstallation_floorplan_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_productinstallation_floorplan_id ON installations_productinstallation USING btree (floorplan_id);


--
-- Name: installations_productinstallation_product_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_productinstallation_product_id ON installations_productinstallation USING btree (product_id);


--
-- Name: installations_productinstallation_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_productinstallation_subclass_id ON installations_productinstallation USING btree (subclass_id);


--
-- Name: installations_pulseemitterinstallation_input_satisfies_data487f; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_pulseemitterinstallation_input_satisfies_data487f ON installations_pulseemitterinstallation_input_satisfies_data7b36 USING btree (pulseemitterinstallation_id);


--
-- Name: installations_pulseemitterinstallation_input_satisfies_datacb3e; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_pulseemitterinstallation_input_satisfies_datacb3e ON installations_pulseemitterinstallation_input_satisfies_data7b36 USING btree (dataneed_id);


--
-- Name: installations_repeaterinstallation_gateway_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_repeaterinstallation_gateway_id ON installations_repeaterinstallation USING btree (gateway_id);


--
-- Name: installations_tripleinputmeterinstallation_gateway_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_gateway_id ON installations_tripleinputmeterinstallation USING btree (gateway_id);


--
-- Name: installations_tripleinputmeterinstallation_input1_satisfies69ae; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input1_satisfies69ae ON installations_tripleinputmeterinstallation_input1_satisfies0539 USING btree (dataneed_id);


--
-- Name: installations_tripleinputmeterinstallation_input1_satisfies94d0; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input1_satisfies94d0 ON installations_tripleinputmeterinstallation_input1_satisfies0539 USING btree (tripleinputmeterinstallation_id);


--
-- Name: installations_tripleinputmeterinstallation_input2_satisfies5b2e; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input2_satisfies5b2e ON installations_tripleinputmeterinstallation_input2_satisfies1aad USING btree (dataneed_id);


--
-- Name: installations_tripleinputmeterinstallation_input2_satisfies9ee3; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input2_satisfies9ee3 ON installations_tripleinputmeterinstallation_input2_satisfies1aad USING btree (tripleinputmeterinstallation_id);


--
-- Name: installations_tripleinputmeterinstallation_input3_satisfies0af8; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input3_satisfies0af8 ON installations_tripleinputmeterinstallation_input3_satisfies9eaa USING btree (tripleinputmeterinstallation_id);


--
-- Name: installations_tripleinputmeterinstallation_input3_satisfiesc5e0; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_tripleinputmeterinstallation_input3_satisfiesc5e0 ON installations_tripleinputmeterinstallation_input3_satisfies9eaa USING btree (dataneed_id);


--
-- Name: installations_triplepulsecollectorinstallation_gateway_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_triplepulsecollectorinstallation_gateway_id ON installations_triplepulsecollectorinstallation USING btree (gateway_id);


--
-- Name: installations_triplepulsecollectorinstallation_input1_pulsee9d7; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_triplepulsecollectorinstallation_input1_pulsee9d7 ON installations_triplepulsecollectorinstallation USING btree (input1_pulseemitterinstallation_id);


--
-- Name: installations_triplepulsecollectorinstallation_input2_pulse9609; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_triplepulsecollectorinstallation_input2_pulse9609 ON installations_triplepulsecollectorinstallation USING btree (input2_pulseemitterinstallation_id);


--
-- Name: installations_triplepulsecollectorinstallation_input3_pulse89da; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX installations_triplepulsecollectorinstallation_input3_pulse89da ON installations_triplepulsecollectorinstallation USING btree (input3_pulseemitterinstallation_id);


--
-- Name: manage_collections_collectionitem_collection_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX manage_collections_collectionitem_collection_id ON manage_collections_collectionitem USING btree (collection_id);


--
-- Name: manage_collections_item_floorplan_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX manage_collections_item_floorplan_id ON manage_collections_item USING btree (floorplan_id);


--
-- Name: manage_collections_item_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX manage_collections_item_subclass_id ON manage_collections_item USING btree (subclass_id);


--
-- Name: measurementpoints_chainlink_chain_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_chainlink_chain_id ON measurementpoints_chainlink USING btree (chain_id);


--
-- Name: measurementpoints_chainlink_data_series_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_chainlink_data_series_id ON measurementpoints_chainlink USING btree (data_series_id);


--
-- Name: measurementpoints_dataseries_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_dataseries_customer_id ON measurementpoints_dataseries USING btree (customer_id);


--
-- Name: measurementpoints_dataseries_graph_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_dataseries_graph_id ON measurementpoints_dataseries USING btree (graph_id);


--
-- Name: measurementpoints_dataseries_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_dataseries_subclass_id ON measurementpoints_dataseries USING btree (subclass_id);


--
-- Name: measurementpoints_degreedaycorrection_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_degreedaycorrection_consumption_id ON measurementpoints_degreedaycorrection USING btree (consumption_id);


--
-- Name: measurementpoints_degreedaycorrection_degreedays_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_degreedaycorrection_degreedays_id ON measurementpoints_degreedaycorrection USING btree (degreedays_id);


--
-- Name: measurementpoints_degreedaycorrection_standarddegreedays_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_degreedaycorrection_standarddegreedays_id ON measurementpoints_degreedaycorrection USING btree (standarddegreedays_id);


--
-- Name: measurementpoints_graph_collection_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_graph_collection_id ON measurementpoints_graph USING btree (collection_id);


--
-- Name: measurementpoints_heatingdegreedays_derived_from_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_heatingdegreedays_derived_from_id ON measurementpoints_heatingdegreedays USING btree (derived_from_id);


--
-- Name: measurementpoints_indexcalculation_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_indexcalculation_consumption_id ON measurementpoints_indexcalculation USING btree (consumption_id);


--
-- Name: measurementpoints_indexcalculation_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_indexcalculation_index_id ON measurementpoints_indexcalculation USING btree (index_id);


--
-- Name: measurementpoints_link_target_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_link_target_id ON measurementpoints_link USING btree (target_id);


--
-- Name: measurementpoints_meantemperaturechange_energy_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_meantemperaturechange_energy_id ON measurementpoints_meantemperaturechange USING btree (energy_id);


--
-- Name: measurementpoints_meantemperaturechange_volume_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_meantemperaturechange_volume_id ON measurementpoints_meantemperaturechange USING btree (volume_id);


--
-- Name: measurementpoints_multiplication_source_data_series_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_multiplication_source_data_series_id ON measurementpoints_multiplication USING btree (source_data_series_id);


--
-- Name: measurementpoints_piecewiseconstantintegral_data_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_piecewiseconstantintegral_data_id ON measurementpoints_piecewiseconstantintegral USING btree (data_id);


--
-- Name: measurementpoints_rateconversion_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_rateconversion_consumption_id ON measurementpoints_rateconversion USING btree (consumption_id);


--
-- Name: measurementpoints_simplelinearregression_data_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_simplelinearregression_data_id ON measurementpoints_simplelinearregression USING btree (data_id);


--
-- Name: measurementpoints_storeddata_data_series_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_storeddata_data_series_id ON measurementpoints_storeddata USING btree (data_series_id);


--
-- Name: measurementpoints_storeddata_ef4a2464; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_storeddata_ef4a2464 ON measurementpoints_storeddata USING btree (data_series_id, "timestamp");


--
-- Name: measurementpoints_summationterm_data_series_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_summationterm_data_series_id ON measurementpoints_summationterm USING btree (data_series_id);


--
-- Name: measurementpoints_summationterm_summation_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_summationterm_summation_id ON measurementpoints_summationterm USING btree (summation_id);


--
-- Name: measurementpoints_utilization_consumption_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_utilization_consumption_id ON measurementpoints_utilization USING btree (consumption_id);


--
-- Name: measurementpoints_utilization_needs_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX measurementpoints_utilization_needs_id ON measurementpoints_utilization USING btree (needs_id);


--
-- Name: opportunities_opportunity_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX opportunities_opportunity_customer_id ON opportunities_opportunity USING btree (customer_id);


--
-- Name: price_relay_site_pricerelayproject_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX price_relay_site_pricerelayproject_customer_id ON price_relay_site_pricerelayproject USING btree (customer_id);


--
-- Name: price_relay_site_pricerelayproject_tariff_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX price_relay_site_pricerelayproject_tariff_id ON price_relay_site_pricerelayproject USING btree (tariff_id);


--
-- Name: processperiods_processperiod_accepted_opportunities_opportu6525; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_accepted_opportunities_opportu6525 ON processperiods_processperiod_accepted_opportunities USING btree (opportunity_id);


--
-- Name: processperiods_processperiod_accepted_opportunities_process3386; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_accepted_opportunities_process3386 ON processperiods_processperiod_accepted_opportunities USING btree (processperiod_id);


--
-- Name: processperiods_processperiod_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_customer_id ON processperiods_processperiod USING btree (customer_id);


--
-- Name: processperiods_processperiod_enpis_energyperformance_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_enpis_energyperformance_id ON processperiods_processperiod_enpis USING btree (energyperformance_id);


--
-- Name: processperiods_processperiod_enpis_processperiod_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_enpis_processperiod_id ON processperiods_processperiod_enpis USING btree (processperiod_id);


--
-- Name: processperiods_processperiod_rejected_opportunities_opportu3691; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_rejected_opportunities_opportu3691 ON processperiods_processperiod_rejected_opportunities USING btree (opportunity_id);


--
-- Name: processperiods_processperiod_rejected_opportunities_processb6ee; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_rejected_opportunities_processb6ee ON processperiods_processperiod_rejected_opportunities USING btree (processperiod_id);


--
-- Name: processperiods_processperiod_significant_energyuses_energyu3a33; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_significant_energyuses_energyu3a33 ON processperiods_processperiod_significant_energyuses USING btree (energyuse_id);


--
-- Name: processperiods_processperiod_significant_energyuses_processfec0; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiod_significant_energyuses_processfec0 ON processperiods_processperiod_significant_energyuses USING btree (processperiod_id);


--
-- Name: processperiods_processperiodgoal_energyperformance_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiodgoal_energyperformance_id ON processperiods_processperiodgoal USING btree (energyperformance_id);


--
-- Name: processperiods_processperiodgoal_processperiod_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX processperiods_processperiodgoal_processperiod_id ON processperiods_processperiodgoal USING btree (processperiod_id);


--
-- Name: productions_nonpulseperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_nonpulseperiod_datasource_id ON productions_nonpulseperiod USING btree (datasource_id);


--
-- Name: productions_period_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_period_datasequence_id ON productions_period USING btree (datasequence_id);


--
-- Name: productions_period_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_period_subclass_id ON productions_period USING btree (subclass_id);


--
-- Name: productions_production_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_production_customer_id ON productions_production USING btree (customer_id);


--
-- Name: productions_production_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_production_subclass_id ON productions_production USING btree (subclass_id);


--
-- Name: productions_productiongroup_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_productiongroup_customer_id ON productions_productiongroup USING btree (customer_id);


--
-- Name: productions_productiongroup_productions_production_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_productiongroup_productions_production_id ON productions_productiongroup_productions USING btree (production_id);


--
-- Name: productions_productiongroup_productions_productiongroup_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_productiongroup_productions_productiongroup_id ON productions_productiongroup_productions USING btree (productiongroup_id);


--
-- Name: productions_pulseperiod_datasource_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX productions_pulseperiod_datasource_id ON productions_pulseperiod USING btree (datasource_id);


--
-- Name: products_historicalproduct_category_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_category_id ON products_historicalproduct USING btree (category_id);


--
-- Name: products_historicalproduct_installation_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_installation_type_id ON products_historicalproduct USING btree (installation_type_id);


--
-- Name: products_historicalproduct_product_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_product_id ON products_historicalproduct USING btree (product_id);


--
-- Name: products_historicalproduct_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_provider_id ON products_historicalproduct USING btree (provider_id);


--
-- Name: products_historicalproduct_supplier_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_supplier_id ON products_historicalproduct USING btree (supplier_id);


--
-- Name: products_historicalproduct_user_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_historicalproduct_user_id ON products_historicalproduct USING btree (user_id);


--
-- Name: products_product_category_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_product_category_id ON products_product USING btree (category_id);


--
-- Name: products_product_installation_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_product_installation_type_id ON products_product USING btree (installation_type_id);


--
-- Name: products_product_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_product_provider_id ON products_product USING btree (provider_id);


--
-- Name: products_product_supplier_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_product_supplier_id ON products_product USING btree (supplier_id);


--
-- Name: products_productcategory_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX products_productcategory_provider_id ON products_productcategory USING btree (provider_id);


--
-- Name: projects_additionalsaving_project_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_additionalsaving_project_id ON projects_additionalsaving USING btree (project_id);


--
-- Name: projects_benchmarkproject_baseline_measurement_points_bench8fcb; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_benchmarkproject_baseline_measurement_points_bench8fcb ON projects_benchmarkproject_baseline_measurement_points USING btree (benchmarkproject_id);


--
-- Name: projects_benchmarkproject_baseline_measurement_points_consu517f; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_benchmarkproject_baseline_measurement_points_consu517f ON projects_benchmarkproject_baseline_measurement_points USING btree (consumptionmeasurementpoint_id);


--
-- Name: projects_benchmarkproject_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_benchmarkproject_customer_id ON projects_benchmarkproject USING btree (customer_id);


--
-- Name: projects_benchmarkproject_result_measurement_points_benchma7ca9; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_benchmarkproject_result_measurement_points_benchma7ca9 ON projects_benchmarkproject_result_measurement_points USING btree (benchmarkproject_id);


--
-- Name: projects_benchmarkproject_result_measurement_points_consump8f9b; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_benchmarkproject_result_measurement_points_consump8f9b ON projects_benchmarkproject_result_measurement_points USING btree (consumptionmeasurementpoint_id);


--
-- Name: projects_cost_project_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX projects_cost_project_id ON projects_cost USING btree (project_id);


--
-- Name: provider_datasources_providerdatasource_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX provider_datasources_providerdatasource_provider_id ON provider_datasources_providerdatasource USING btree (provider_id);


--
-- Name: reports_report_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX reports_report_customer_id ON reports_report USING btree (customer_id);


--
-- Name: rules_dateexception_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_dateexception_rule_id ON rules_dateexception USING btree (rule_id);


--
-- Name: rules_emailaction_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_emailaction_rule_id ON rules_emailaction USING btree (rule_id);


--
-- Name: rules_indexinvariant_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_indexinvariant_index_id ON rules_indexinvariant USING btree (index_id);


--
-- Name: rules_indexinvariant_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_indexinvariant_rule_id ON rules_indexinvariant USING btree (rule_id);


--
-- Name: rules_inputinvariant_data_series_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_inputinvariant_data_series_id ON rules_inputinvariant USING btree (data_series_id);


--
-- Name: rules_inputinvariant_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_inputinvariant_rule_id ON rules_inputinvariant USING btree (rule_id);


--
-- Name: rules_minimizerule_index_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_minimizerule_index_id ON rules_minimizerule USING btree (index_id);


--
-- Name: rules_phoneaction_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_phoneaction_rule_id ON rules_phoneaction USING btree (rule_id);


--
-- Name: rules_relayaction_meter_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_relayaction_meter_id ON rules_relayaction USING btree (meter_id);


--
-- Name: rules_relayaction_rule_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_relayaction_rule_id ON rules_relayaction USING btree (rule_id);


--
-- Name: rules_userrule_content_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_userrule_content_type_id ON rules_userrule USING btree (content_type_id);


--
-- Name: rules_userrule_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX rules_userrule_customer_id ON rules_userrule USING btree (customer_id);


--
-- Name: salesopportunities_activityentry_creator_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_activityentry_creator_id ON salesopportunities_activityentry USING btree (creator_id);


--
-- Name: salesopportunities_activityentry_salesopportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_activityentry_salesopportunity_id ON salesopportunities_activityentry USING btree (salesopportunity_id);


--
-- Name: salesopportunities_industrytypesavings_industry_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_industrytypesavings_industry_type_id ON salesopportunities_industrytypesavings USING btree (industry_type_id);


--
-- Name: salesopportunities_industrytypeusedistribution_industry_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_industrytypeusedistribution_industry_type_id ON salesopportunities_industrytypeusedistribution USING btree (industry_type_id);


--
-- Name: salesopportunities_salesopportunity_created_by_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_created_by_id ON salesopportunities_salesopportunity USING btree (created_by_id);


--
-- Name: salesopportunities_salesopportunity_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_customer_id ON salesopportunities_salesopportunity USING btree (customer_id);


--
-- Name: salesopportunities_salesopportunity_floorplans_floorplan_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_floorplans_floorplan_id ON salesopportunities_salesopportunity_floorplans USING btree (floorplan_id);


--
-- Name: salesopportunities_salesopportunity_floorplans_salesopportue3b6; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_floorplans_salesopportue3b6 ON salesopportunities_salesopportunity_floorplans USING btree (salesopportunity_id);


--
-- Name: salesopportunities_salesopportunity_industry_type_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_industry_type_id ON salesopportunities_salesopportunity USING btree (industry_type_id);


--
-- Name: salesopportunities_salesopportunity_sales_officer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_sales_officer_id ON salesopportunities_salesopportunity USING btree (sales_officer_id);


--
-- Name: salesopportunities_salesopportunity_sizing_officer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunity_sizing_officer_id ON salesopportunities_salesopportunity USING btree (sizing_officer_id);


--
-- Name: salesopportunities_salesopportunitysavings_sales_opportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunitysavings_sales_opportunity_id ON salesopportunities_salesopportunitysavings USING btree (sales_opportunity_id);


--
-- Name: salesopportunities_salesopportunityusedistribution_sales_op24c0; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_salesopportunityusedistribution_sales_op24c0 ON salesopportunities_salesopportunityusedistribution USING btree (sales_opportunity_id);


--
-- Name: salesopportunities_surveyinstruction_sales_opportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_surveyinstruction_sales_opportunity_id ON salesopportunities_surveyinstruction USING btree (sales_opportunity_id);


--
-- Name: salesopportunities_task_assigned_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_task_assigned_id ON salesopportunities_task USING btree (assigned_id);


--
-- Name: salesopportunities_task_sales_opportunity_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX salesopportunities_task_sales_opportunity_id ON salesopportunities_task USING btree (sales_opportunity_id);


--
-- Name: suppliers_supplier_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX suppliers_supplier_provider_id ON suppliers_supplier USING btree (provider_id);


--
-- Name: system_health_site_healthreport_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX system_health_site_healthreport_customer_id ON system_health_site_healthreport USING btree (customer_id);


--
-- Name: tariffs_period_datasequence_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX tariffs_period_datasequence_id ON tariffs_period USING btree (datasequence_id);


--
-- Name: tariffs_period_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX tariffs_period_subclass_id ON tariffs_period USING btree (subclass_id);


--
-- Name: tariffs_spotpriceperiod_spotprice_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX tariffs_spotpriceperiod_spotprice_id ON tariffs_spotpriceperiod USING btree (spotprice_id);


--
-- Name: tariffs_tariff_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX tariffs_tariff_customer_id ON tariffs_tariff USING btree (customer_id);


--
-- Name: tariffs_tariff_subclass_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX tariffs_tariff_subclass_id ON tariffs_tariff USING btree (subclass_id);


--
-- Name: token_auth_tokendata_key_like; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX token_auth_tokendata_key_like ON token_auth_tokendata USING btree (key varchar_pattern_ops);


--
-- Name: users_user_customer_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX users_user_customer_id ON users_user USING btree (customer_id);


--
-- Name: users_user_provider_id; Type: INDEX; Schema: public; Owner: portal; Tablespace: 
--

CREATE INDEX users_user_provider_id ON users_user USING btree (provider_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: benchmarkproject_id_refs_id_2357c266; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_baseline_measurement_points
    ADD CONSTRAINT benchmarkproject_id_refs_id_2357c266 FOREIGN KEY (benchmarkproject_id) REFERENCES projects_benchmarkproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: benchmarkproject_id_refs_id_35a2b907; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_result_measurement_points
    ADD CONSTRAINT benchmarkproject_id_refs_id_35a2b907 FOREIGN KEY (benchmarkproject_id) REFERENCES projects_benchmarkproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co2conversions_co2conversion_mainconsumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_co2conversion
    ADD CONSTRAINT co2conversions_co2conversion_mainconsumption_id_fkey FOREIGN KEY (mainconsumption_id) REFERENCES consumptions_mainconsumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co2conversions_dynamicco2conversion_co2conversion_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_dynamicco2conversion
    ADD CONSTRAINT co2conversions_dynamicco2conversion_co2conversion_ptr_id_fkey FOREIGN KEY (co2conversion_ptr_id) REFERENCES co2conversions_co2conversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co2conversions_dynamicco2conversion_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_dynamicco2conversion
    ADD CONSTRAINT co2conversions_dynamicco2conversion_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co2conversions_fixedco2conversion_co2conversion_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_fixedco2conversion
    ADD CONSTRAINT co2conversions_fixedco2conversion_co2conversion_ptr_id_fkey FOREIGN KEY (co2conversion_ptr_id) REFERENCES co2conversions_co2conversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptiongroup_id_refs_id_5a3f2c8c; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup_consumptions
    ADD CONSTRAINT consumptiongroup_id_refs_id_5a3f2c8c FOREIGN KEY (consumptiongroup_id) REFERENCES consumptions_consumptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_consumption_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumption
    ADD CONSTRAINT consumptions_consumption_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_consumption_volumetoenergyconversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumption
    ADD CONSTRAINT consumptions_consumption_volumetoenergyconversion_id_fkey FOREIGN KEY (volumetoenergyconversion_id) REFERENCES datasequences_energypervolumedatasequence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_consumptiongroup_consumptions_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup_consumptions
    ADD CONSTRAINT consumptions_consumptiongroup_consumptions_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_consumptiongroup_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup
    ADD CONSTRAINT consumptions_consumptiongroup_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_consumptiongroup_mainconsumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup
    ADD CONSTRAINT consumptions_consumptiongroup_mainconsumption_id_fkey FOREIGN KEY (mainconsumption_id) REFERENCES consumptions_mainconsumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_mainconsumption_consumptions_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption_consumptions
    ADD CONSTRAINT consumptions_mainconsumption_consumptions_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_mainconsumption_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption
    ADD CONSTRAINT consumptions_mainconsumption_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_nonpulseperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_nonpulseperiod
    ADD CONSTRAINT consumptions_nonpulseperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_nonpulseperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_nonpulseperiod
    ADD CONSTRAINT consumptions_nonpulseperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES consumptions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_offlinetolerance_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_offlinetolerance
    ADD CONSTRAINT consumptions_offlinetolerance_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_period_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_period
    ADD CONSTRAINT consumptions_period_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_pulseperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_pulseperiod
    ADD CONSTRAINT consumptions_pulseperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_pulseperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_pulseperiod
    ADD CONSTRAINT consumptions_pulseperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES consumptions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: consumptions_singlevalueperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_singlevalueperiod
    ADD CONSTRAINT consumptions_singlevalueperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES consumptions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_442a446d; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_userrule
    ADD CONSTRAINT content_type_id_refs_id_442a446d FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_88c9f6f6; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY encryption_encryptionkey
    ADD CONSTRAINT content_type_id_refs_id_88c9f6f6 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cost_compensation_id_refs_id_9a4b788b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption
    ADD CONSTRAINT cost_compensation_id_refs_id_9a4b788b FOREIGN KEY (cost_compensation_id) REFERENCES cost_compensations_costcompensation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cost_compensation_id_refs_id_aaf44a7b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumptiongroup
    ADD CONSTRAINT cost_compensation_id_refs_id_aaf44a7b FOREIGN KEY (cost_compensation_id) REFERENCES cost_compensations_costcompensation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cost_compensations_costcompensation_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_costcompensation
    ADD CONSTRAINT cost_compensations_costcompensation_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cost_compensations_fixedcompensationperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_fixedcompensationperiod
    ADD CONSTRAINT cost_compensations_fixedcompensationperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES cost_compensations_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cost_compensations_period_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_period
    ADD CONSTRAINT cost_compensations_period_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES cost_compensations_costcompensation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_datasources_customerdatasource_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customer_datasources_customerdatasource
    ADD CONSTRAINT customer_datasources_customerdatasource_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_datasources_customerdatasource_datasource_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customer_datasources_customerdatasource
    ADD CONSTRAINT customer_datasources_customerdatasource_datasource_ptr_id_fkey FOREIGN KEY (datasource_ptr_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_28b953d5; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT customer_id_refs_id_28b953d5 FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_2c1235cc; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer_industry_types
    ADD CONSTRAINT customer_id_refs_id_2c1235cc FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_340254cb; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_ledlightproject
    ADD CONSTRAINT customer_id_refs_id_340254cb FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_798d96f8; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_energyproject
    ADD CONSTRAINT customer_id_refs_id_798d96f8 FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_b16d1ce6; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY price_relay_site_pricerelayproject
    ADD CONSTRAINT customer_id_refs_id_b16d1ce6 FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_id_refs_id_f092b64b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datahub_datahubconnection
    ADD CONSTRAINT customer_id_refs_id_f092b64b FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_collection_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_collection
    ADD CONSTRAINT customers_collection_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_collection_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_collection
    ADD CONSTRAINT customers_collection_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT customers_customer_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_location_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_location
    ADD CONSTRAINT customers_location_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_location_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_location
    ADD CONSTRAINT customers_location_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES customers_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_userprofile_collections_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_userprofile_collections
    ADD CONSTRAINT customers_userprofile_collections_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_userprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_userprofile
    ADD CONSTRAINT customers_userprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_dataneed_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_dataneed
    ADD CONSTRAINT dataneeds_dataneed_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_energyusedataneed_dataneed_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_energyusedataneed
    ADD CONSTRAINT dataneeds_energyusedataneed_dataneed_ptr_id_fkey FOREIGN KEY (dataneed_ptr_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_mainconsumptiondataneed_dataneed_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_mainconsumptiondataneed
    ADD CONSTRAINT dataneeds_mainconsumptiondataneed_dataneed_ptr_id_fkey FOREIGN KEY (dataneed_ptr_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_mainconsumptiondataneed_mainconsumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_mainconsumptiondataneed
    ADD CONSTRAINT dataneeds_mainconsumptiondataneed_mainconsumption_id_fkey FOREIGN KEY (mainconsumption_id) REFERENCES consumptions_mainconsumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_productiongroupdataneed_dataneed_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_productiongroupdataneed
    ADD CONSTRAINT dataneeds_productiongroupdataneed_dataneed_ptr_id_fkey FOREIGN KEY (dataneed_ptr_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataneeds_productiongroupdataneed_productiongroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_productiongroupdataneed
    ADD CONSTRAINT dataneeds_productiongroupdataneed_productiongroup_id_fkey FOREIGN KEY (productiongroup_id) REFERENCES productions_productiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_consumptionaccumul_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_consumptionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_consumptionaccumul_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_consumptionaccumulat_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_consumptionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_consumptionaccumulat_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_nonaccumulationada_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_nonaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_nonaccumulationada_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_nonaccumulationadapt_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_nonaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_nonaccumulationadapt_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES datasequences_nonaccumulationdatasequence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_productionaccumula_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_productionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_productionaccumula_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequence_adapters_productionaccumulati_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequence_adapters_productionaccumulationadapter
    ADD CONSTRAINT datasequence_adapters_productionaccumulati_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES productions_production(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_energypervolumedatasequence_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumedatasequence
    ADD CONSTRAINT datasequences_energypervolumedatasequence_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_energypervolumeperiod_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumeperiod
    ADD CONSTRAINT datasequences_energypervolumeperiod_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES datasequences_energypervolumedatasequence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_energypervolumeperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumeperiod
    ADD CONSTRAINT datasequences_energypervolumeperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_nonaccumulationdatasequence_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationdatasequence
    ADD CONSTRAINT datasequences_nonaccumulationdatasequence_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_nonaccumulationofflinetolera_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationofflinetolerance
    ADD CONSTRAINT datasequences_nonaccumulationofflinetolera_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES datasequences_nonaccumulationdatasequence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_nonaccumulationperiod_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationperiod
    ADD CONSTRAINT datasequences_nonaccumulationperiod_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES datasequences_nonaccumulationdatasequence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasequences_nonaccumulationperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationperiod
    ADD CONSTRAINT datasequences_nonaccumulationperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataseries_ptr_id_refs_id_113779b3; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_index
    ADD CONSTRAINT dataseries_ptr_id_refs_id_113779b3 FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasource_id_refs_id_2434756f; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY condensing_houraccumulateddata
    ADD CONSTRAINT datasource_id_refs_id_2434756f FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasource_id_refs_id_60d85b99; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY condensing_fiveminuteaccumulateddata
    ADD CONSTRAINT datasource_id_refs_id_60d85b99 FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasource_id_refs_id_6c1ed825; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_energyproject
    ADD CONSTRAINT datasource_id_refs_id_6c1ed825 FOREIGN KEY (datasource_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasource_id_refs_id_d4d6760f; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_ledlightproject
    ADD CONSTRAINT datasource_id_refs_id_d4d6760f FOREIGN KEY (datasource_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datasources_rawdata_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasources_rawdata
    ADD CONSTRAINT datasources_rawdata_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_agent_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agent
    ADD CONSTRAINT devices_agent_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_agent_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agent
    ADD CONSTRAINT devices_agent_location_id_fkey FOREIGN KEY (location_id) REFERENCES customers_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_agentevent_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agentevent
    ADD CONSTRAINT devices_agentevent_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES devices_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_agentstatechange_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_agentstatechange
    ADD CONSTRAINT devices_agentstatechange_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES devices_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_meter_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meter
    ADD CONSTRAINT devices_meter_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES devices_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_meter_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meter
    ADD CONSTRAINT devices_meter_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_meter_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meter
    ADD CONSTRAINT devices_meter_location_id_fkey FOREIGN KEY (location_id) REFERENCES customers_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_meterstatechange_meter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_meterstatechange
    ADD CONSTRAINT devices_meterstatechange_meter_id_fkey FOREIGN KEY (meter_id) REFERENCES devices_meter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_physicalinput_customerdatasource_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_physicalinput
    ADD CONSTRAINT devices_physicalinput_customerdatasource_ptr_id_fkey FOREIGN KEY (customerdatasource_ptr_id) REFERENCES customer_datasources_customerdatasource(datasource_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: devices_physicalinput_meter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY devices_physicalinput
    ADD CONSTRAINT devices_physicalinput_meter_id_fkey FOREIGN KEY (meter_id) REFERENCES devices_meter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: display_widgets_dashboardwidget_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY display_widgets_dashboardwidget
    ADD CONSTRAINT display_widgets_dashboardwidget_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: display_widgets_dashboardwidget_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY display_widgets_dashboardwidget
    ADD CONSTRAINT display_widgets_dashboardwidget_user_id_fkey FOREIGN KEY (user_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask_crontab_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_crontab_id_fkey FOREIGN KEY (crontab_id) REFERENCES djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask_interval_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_interval_id_fkey FOREIGN KEY (interval_id) REFERENCES djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_taskstate_worker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: electricity_tariff_id_refs_id_a3d5f060; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT electricity_tariff_id_refs_id_a3d5f060 FOREIGN KEY (electricity_tariff_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_districtheatingconsu_salesopportunity_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptionarea
    ADD CONSTRAINT energy_breakdown_districtheatingconsu_salesopportunity_id_fkey1 FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_districtheatingconsum_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptiontotal
    ADD CONSTRAINT energy_breakdown_districtheatingconsum_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_districtheatingconsumpti_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_districtheatingconsumptionarea
    ADD CONSTRAINT energy_breakdown_districtheatingconsumpti_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_electricityconsumpti_salesopportunity_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptionarea
    ADD CONSTRAINT energy_breakdown_electricityconsumpti_salesopportunity_id_fkey1 FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_electricityconsumptio_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptiontotal
    ADD CONSTRAINT energy_breakdown_electricityconsumptio_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_electricityconsumptionar_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_electricityconsumptionarea
    ADD CONSTRAINT energy_breakdown_electricityconsumptionar_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_fuelconsumptionarea_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptionarea
    ADD CONSTRAINT energy_breakdown_fuelconsumptionarea_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_fuelconsumptionarea_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptionarea
    ADD CONSTRAINT energy_breakdown_fuelconsumptionarea_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_fuelconsumptiontotal_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_fuelconsumptiontotal
    ADD CONSTRAINT energy_breakdown_fuelconsumptiontotal_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_proposedaction_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_proposedaction
    ADD CONSTRAINT energy_breakdown_proposedaction_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_proposedaction_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_proposedaction
    ADD CONSTRAINT energy_breakdown_proposedaction_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_waterconsumptionarea_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_waterconsumptionarea
    ADD CONSTRAINT energy_breakdown_waterconsumptionarea_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_waterconsumptionarea_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_waterconsumptionarea
    ADD CONSTRAINT energy_breakdown_waterconsumptionarea_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_breakdown_waterconsumptiontotal_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_breakdown_waterconsumptiontotal
    ADD CONSTRAINT energy_breakdown_waterconsumptiontotal_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_driver_id_refs_id_54d03831; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea
    ADD CONSTRAINT energy_driver_id_refs_id_54d03831 FOREIGN KEY (energy_driver_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_use_reports_energyusea_consumptionmeasurementpoint__fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusearea_measurement_points
    ADD CONSTRAINT energy_use_reports_energyusea_consumptionmeasurementpoint__fkey FOREIGN KEY (consumptionmeasurementpoint_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_use_reports_energyusearea_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusearea
    ADD CONSTRAINT energy_use_reports_energyusearea_report_id_fkey FOREIGN KEY (report_id) REFERENCES energy_use_reports_energyusereport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_use_reports_energyuser_consumptionmeasurementpoint__fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusereport_main_measurement_points
    ADD CONSTRAINT energy_use_reports_energyuser_consumptionmeasurementpoint__fkey FOREIGN KEY (consumptionmeasurementpoint_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energy_use_reports_energyusereport_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusereport
    ADD CONSTRAINT energy_use_reports_energyusereport_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_energyperformance_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_energyperformance
    ADD CONSTRAINT energyperformances_energyperformance_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_productionener_energyperformance_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance
    ADD CONSTRAINT energyperformances_productionener_energyperformance_ptr_id_fkey FOREIGN KEY (energyperformance_ptr_id) REFERENCES energyperformances_energyperformance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_productionenergyper_consumptiongroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_consumptiong23ca
    ADD CONSTRAINT energyperformances_productionenergyper_consumptiongroup_id_fkey FOREIGN KEY (consumptiongroup_id) REFERENCES consumptions_consumptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_productionenergyperf_productiongroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_productiongroups
    ADD CONSTRAINT energyperformances_productionenergyperf_productiongroup_id_fkey FOREIGN KEY (productiongroup_id) REFERENCES productions_productiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_timeenergyperf_energyperformance_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_timeenergyperformance
    ADD CONSTRAINT energyperformances_timeenergyperf_energyperformance_ptr_id_fkey FOREIGN KEY (energyperformance_ptr_id) REFERENCES energyperformances_energyperformance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyperformances_timeenergyperforman_consumptiongroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_timeenergyperformance_consumptiongroups
    ADD CONSTRAINT energyperformances_timeenergyperforman_consumptiongroup_id_fkey FOREIGN KEY (consumptiongroup_id) REFERENCES consumptions_consumptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyuse_id_refs_consumptiongroup_ptr_id_44725248; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_energyusedataneed
    ADD CONSTRAINT energyuse_id_refs_consumptiongroup_ptr_id_44725248 FOREIGN KEY (energyuse_id) REFERENCES energyuses_energyuse(consumptiongroup_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyusearea_id_refs_id_6f4dd6ef; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusearea_measurement_points
    ADD CONSTRAINT energyusearea_id_refs_id_6f4dd6ef FOREIGN KEY (energyusearea_id) REFERENCES energy_use_reports_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyusereport_id_refs_id_f5b16fa2; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_use_reports_energyusereport_main_measurement_points
    ADD CONSTRAINT energyusereport_id_refs_id_f5b16fa2 FOREIGN KEY (energyusereport_id) REFERENCES energy_use_reports_energyusereport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: energyuses_energyuse_consumptiongroup_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyuses_energyuse
    ADD CONSTRAINT energyuses_energyuse_consumptiongroup_ptr_id_fkey FOREIGN KEY (consumptiongroup_ptr_id) REFERENCES consumptions_consumptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enpi_reports_enpireport_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpireport
    ADD CONSTRAINT enpi_reports_enpireport_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enpi_reports_enpiusearea_meas_consumptionmeasurementpoint__fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea_measurement_points
    ADD CONSTRAINT enpi_reports_enpiusearea_meas_consumptionmeasurementpoint__fkey FOREIGN KEY (consumptionmeasurementpoint_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enpi_reports_enpiusearea_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea
    ADD CONSTRAINT enpi_reports_enpiusearea_report_id_fkey FOREIGN KEY (report_id) REFERENCES enpi_reports_enpireport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: enpiusearea_id_refs_id_cc2e42ae; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY enpi_reports_enpiusearea_measurement_points
    ADD CONSTRAINT enpiusearea_id_refs_id_cc2e42ae FOREIGN KEY (enpiusearea_id) REFERENCES enpi_reports_enpiusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gas_tariff_id_refs_id_a3d5f060; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT gas_tariff_id_refs_id_a3d5f060 FOREIGN KEY (gas_tariff_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: global_datasources_globaldatasource_datasource_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY global_datasources_globaldatasource
    ADD CONSTRAINT global_datasources_globaldatasource_datasource_ptr_id_fkey FOREIGN KEY (datasource_ptr_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: heat_tariff_id_refs_id_a3d5f060; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT heat_tariff_id_refs_id_a3d5f060 FOREIGN KEY (heat_tariff_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: index_id_refs_dataseries_ptr_id_70090a01; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energinet_co2_modelbinding
    ADD CONSTRAINT index_id_refs_dataseries_ptr_id_70090a01 FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: index_id_refs_dataseries_ptr_id_f5ca3ee7; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY display_widgets_dashboardwidget
    ADD CONSTRAINT index_id_refs_dataseries_ptr_id_f5ca3ee7 FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_datasourceindexadapter_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_datasourceindexadapter
    ADD CONSTRAINT indexes_datasourceindexadapter_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_datasourceindexadapter_index_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_datasourceindexadapter
    ADD CONSTRAINT indexes_datasourceindexadapter_index_ptr_id_fkey FOREIGN KEY (index_ptr_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_derivedindexperiod_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_derivedindexperiod
    ADD CONSTRAINT indexes_derivedindexperiod_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_derivedindexperiod_other_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_derivedindexperiod
    ADD CONSTRAINT indexes_derivedindexperiod_other_index_id_fkey FOREIGN KEY (other_index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_entry_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_entry
    ADD CONSTRAINT indexes_entry_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_index_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_index
    ADD CONSTRAINT indexes_index_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_seasonindexperiod_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_seasonindexperiod
    ADD CONSTRAINT indexes_seasonindexperiod_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_spotmapping_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_spotmapping
    ADD CONSTRAINT indexes_spotmapping_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: indexes_standardmonthindex_index_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY indexes_standardmonthindex
    ADD CONSTRAINT indexes_standardmonthindex_index_ptr_id_fkey FOREIGN KEY (index_ptr_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industrytype_id_refs_id_04f579e5; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer_industry_types
    ADD CONSTRAINT industrytype_id_refs_id_04f579e5 FOREIGN KEY (industrytype_id) REFERENCES salesopportunities_industrytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: input_id_refs_customerdatasource_ptr_id_d6269f4b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datahub_datahubconnection
    ADD CONSTRAINT input_id_refs_customerdatasource_ptr_id_d6269f4b FOREIGN KEY (input_id) REFERENCES devices_physicalinput(customerdatasource_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_billingmeter_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_billingmeter
    ADD CONSTRAINT installation_surveys_billingmeter_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_billingmeterappendix_billingmeter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_billingmeterappendix
    ADD CONSTRAINT installation_surveys_billingmeterappendix_billingmeter_id_fkey FOREIGN KEY (billingmeter_id) REFERENCES installation_surveys_billingmeter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_energyusearea_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_energyusearea
    ADD CONSTRAINT installation_surveys_energyusearea_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_proposedaction_energyusearea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_proposedaction
    ADD CONSTRAINT installation_surveys_proposedaction_energyusearea_id_fkey FOREIGN KEY (energyusearea_id) REFERENCES installation_surveys_energyusearea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_proposedaction_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_proposedaction
    ADD CONSTRAINT installation_surveys_proposedaction_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_surveys_workhours_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installation_surveys_workhours
    ADD CONSTRAINT installation_surveys_workhours_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_type_id_refs_id_02a9b2e2; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT installation_type_id_refs_id_02a9b2e2 FOREIGN KEY (installation_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installation_type_id_refs_id_68d35f9e; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT installation_type_id_refs_id_68d35f9e FOREIGN KEY (installation_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_floorplan_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_floorplan
    ADD CONSTRAINT installations_floorplan_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_gatewayinstallati_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_gatewayinstallation
    ADD CONSTRAINT installations_gatewayinstallati_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_installationphoto_installation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_installationphoto
    ADD CONSTRAINT installations_installationphoto_installation_id_fkey FOREIGN KEY (installation_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_meterinstallation_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_meterinstallation
    ADD CONSTRAINT installations_meterinstallation_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES installations_gatewayinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_meterinstallation_input_satisfie_dataneed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_meterinstallation_input_satisfies_dataneeds
    ADD CONSTRAINT installations_meterinstallation_input_satisfie_dataneed_id_fkey FOREIGN KEY (dataneed_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_meterinstallation_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_meterinstallation
    ADD CONSTRAINT installations_meterinstallation_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_productinstallation_floorplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_productinstallation
    ADD CONSTRAINT installations_productinstallation_floorplan_id_fkey FOREIGN KEY (floorplan_id) REFERENCES installations_floorplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_pulseemitterinsta_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_pulseemitterinstallation
    ADD CONSTRAINT installations_pulseemitterinsta_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_pulseemitterinstallation_input_s_dataneed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_pulseemitterinstallation_input_satisfies_data7b36
    ADD CONSTRAINT installations_pulseemitterinstallation_input_s_dataneed_id_fkey FOREIGN KEY (dataneed_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_repeaterinstallat_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_repeaterinstallation
    ADD CONSTRAINT installations_repeaterinstallat_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_repeaterinstallation_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_repeaterinstallation
    ADD CONSTRAINT installations_repeaterinstallation_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES installations_gatewayinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_tripleinputmeteri_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation
    ADD CONSTRAINT installations_tripleinputmeteri_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_tripleinputmeterinstallation_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation
    ADD CONSTRAINT installations_tripleinputmeterinstallation_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES installations_gatewayinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_tripleinputmeterinstallation_in_dataneed_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input2_satisfies1aad
    ADD CONSTRAINT installations_tripleinputmeterinstallation_in_dataneed_id_fkey1 FOREIGN KEY (dataneed_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_tripleinputmeterinstallation_in_dataneed_id_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input1_satisfies0539
    ADD CONSTRAINT installations_tripleinputmeterinstallation_in_dataneed_id_fkey2 FOREIGN KEY (dataneed_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_tripleinputmeterinstallation_inp_dataneed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input3_satisfies9eaa
    ADD CONSTRAINT installations_tripleinputmeterinstallation_inp_dataneed_id_fkey FOREIGN KEY (dataneed_id) REFERENCES dataneeds_dataneed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_triplepulsecoll_input1_pulseemitterinstallat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecoll_input1_pulseemitterinstallat_fkey FOREIGN KEY (input1_pulseemitterinstallation_id) REFERENCES installations_pulseemitterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_triplepulsecoll_input2_pulseemitterinstallat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecoll_input2_pulseemitterinstallat_fkey FOREIGN KEY (input2_pulseemitterinstallation_id) REFERENCES installations_pulseemitterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_triplepulsecoll_input3_pulseemitterinstallat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecoll_input3_pulseemitterinstallat_fkey FOREIGN KEY (input3_pulseemitterinstallation_id) REFERENCES installations_pulseemitterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_triplepulsecollec_productinstallation_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecollec_productinstallation_ptr_id_fkey FOREIGN KEY (productinstallation_ptr_id) REFERENCES installations_productinstallation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: installations_triplepulsecollectorinstallation_gateway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_triplepulsecollectorinstallation
    ADD CONSTRAINT installations_triplepulsecollectorinstallation_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES installations_gatewayinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainconsumption_id_refs_id_315024c6; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption_consumptions
    ADD CONSTRAINT mainconsumption_id_refs_id_315024c6 FOREIGN KEY (mainconsumption_id) REFERENCES consumptions_mainconsumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manage_collections_collectionitem_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_collectionitem
    ADD CONSTRAINT manage_collections_collectionitem_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manage_collections_collectionitem_item_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_collectionitem
    ADD CONSTRAINT manage_collections_collectionitem_item_ptr_id_fkey FOREIGN KEY (item_ptr_id) REFERENCES manage_collections_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manage_collections_floorplan_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_floorplan
    ADD CONSTRAINT manage_collections_floorplan_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manage_collections_infoitem_item_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_infoitem
    ADD CONSTRAINT manage_collections_infoitem_item_ptr_id_fkey FOREIGN KEY (item_ptr_id) REFERENCES manage_collections_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manage_collections_item_floorplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_item
    ADD CONSTRAINT manage_collections_item_floorplan_id_fkey FOREIGN KEY (floorplan_id) REFERENCES manage_collections_floorplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manual_reporting_manuallyreportedconsum_consumption_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manual_reporting_manuallyreportedconsumption
    ADD CONSTRAINT manual_reporting_manuallyreportedconsum_consumption_ptr_id_fkey FOREIGN KEY (consumption_ptr_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: manual_reporting_manuallyreportedproduct_production_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manual_reporting_manuallyreportedproduction
    ADD CONSTRAINT manual_reporting_manuallyreportedproduct_production_ptr_id_fkey FOREIGN KEY (production_ptr_id) REFERENCES productions_production(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_chain_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_chain
    ADD CONSTRAINT measurementpoints_chain_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_chainlink_chain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_chainlink
    ADD CONSTRAINT measurementpoints_chainlink_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES measurementpoints_chain(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_chainlink_data_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_chainlink
    ADD CONSTRAINT measurementpoints_chainlink_data_series_id_fkey FOREIGN KEY (data_series_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_dataseries_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_dataseries
    ADD CONSTRAINT measurementpoints_dataseries_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_dataseries_graph_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_dataseries
    ADD CONSTRAINT measurementpoints_dataseries_graph_id_fkey FOREIGN KEY (graph_id) REFERENCES measurementpoints_graph(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_degreedaycorrectio_standarddegreedays_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_degreedaycorrection
    ADD CONSTRAINT measurementpoints_degreedaycorrectio_standarddegreedays_id_fkey FOREIGN KEY (standarddegreedays_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_degreedaycorrection_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_degreedaycorrection
    ADD CONSTRAINT measurementpoints_degreedaycorrection_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_degreedaycorrection_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_degreedaycorrection
    ADD CONSTRAINT measurementpoints_degreedaycorrection_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_degreedaycorrection_degreedays_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_degreedaycorrection
    ADD CONSTRAINT measurementpoints_degreedaycorrection_degreedays_id_fkey FOREIGN KEY (degreedays_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_graph_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_graph
    ADD CONSTRAINT measurementpoints_graph_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_heatingdegreedays_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_heatingdegreedays
    ADD CONSTRAINT measurementpoints_heatingdegreedays_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_heatingdegreedays_derived_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_heatingdegreedays
    ADD CONSTRAINT measurementpoints_heatingdegreedays_derived_from_id_fkey FOREIGN KEY (derived_from_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_indexcalculation_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_indexcalculation
    ADD CONSTRAINT measurementpoints_indexcalculation_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_indexcalculation_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_indexcalculation
    ADD CONSTRAINT measurementpoints_indexcalculation_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_indexcalculation_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_indexcalculation
    ADD CONSTRAINT measurementpoints_indexcalculation_index_id_fkey FOREIGN KEY (index_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_link_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_link
    ADD CONSTRAINT measurementpoints_link_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_link_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_link
    ADD CONSTRAINT measurementpoints_link_target_id_fkey FOREIGN KEY (target_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_meantemperaturechange_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_meantemperaturechange
    ADD CONSTRAINT measurementpoints_meantemperaturechange_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_meantemperaturechange_energy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_meantemperaturechange
    ADD CONSTRAINT measurementpoints_meantemperaturechange_energy_id_fkey FOREIGN KEY (energy_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_meantemperaturechange_volume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_meantemperaturechange
    ADD CONSTRAINT measurementpoints_meantemperaturechange_volume_id_fkey FOREIGN KEY (volume_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_multiplication_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_multiplication
    ADD CONSTRAINT measurementpoints_multiplication_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_multiplication_source_data_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_multiplication
    ADD CONSTRAINT measurementpoints_multiplication_source_data_series_id_fkey FOREIGN KEY (source_data_series_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_piecewiseconstantinteg_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_piecewiseconstantintegral
    ADD CONSTRAINT measurementpoints_piecewiseconstantinteg_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_piecewiseconstantintegral_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_piecewiseconstantintegral
    ADD CONSTRAINT measurementpoints_piecewiseconstantintegral_data_id_fkey FOREIGN KEY (data_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_rateconversion_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_rateconversion
    ADD CONSTRAINT measurementpoints_rateconversion_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_rateconversion_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_rateconversion
    ADD CONSTRAINT measurementpoints_rateconversion_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_simplelinearregression_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_simplelinearregression
    ADD CONSTRAINT measurementpoints_simplelinearregression_data_id_fkey FOREIGN KEY (data_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_simplelinearregression_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_simplelinearregression
    ADD CONSTRAINT measurementpoints_simplelinearregression_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_storeddata_data_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_storeddata
    ADD CONSTRAINT measurementpoints_storeddata_data_series_id_fkey FOREIGN KEY (data_series_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_summation_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_summation
    ADD CONSTRAINT measurementpoints_summation_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_summationterm_data_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_summationterm
    ADD CONSTRAINT measurementpoints_summationterm_data_series_id_fkey FOREIGN KEY (data_series_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_summationterm_summation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_summationterm
    ADD CONSTRAINT measurementpoints_summationterm_summation_id_fkey FOREIGN KEY (summation_id) REFERENCES measurementpoints_summation(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_utilization_consumption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_utilization
    ADD CONSTRAINT measurementpoints_utilization_consumption_id_fkey FOREIGN KEY (consumption_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_utilization_dataseries_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_utilization
    ADD CONSTRAINT measurementpoints_utilization_dataseries_ptr_id_fkey FOREIGN KEY (dataseries_ptr_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: measurementpoints_utilization_needs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_utilization
    ADD CONSTRAINT measurementpoints_utilization_needs_id_fkey FOREIGN KEY (needs_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meter_id_refs_id_ee379424; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datahub_datahubconnection
    ADD CONSTRAINT meter_id_refs_id_ee379424 FOREIGN KEY (meter_id) REFERENCES devices_meter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meterinstallation_id_refs_productinstallation_ptr_id_8284d35c; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_meterinstallation_input_satisfies_dataneeds
    ADD CONSTRAINT meterinstallation_id_refs_productinstallation_ptr_id_8284d35c FOREIGN KEY (meterinstallation_id) REFERENCES installations_meterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oil_tariff_id_refs_id_a3d5f060; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT oil_tariff_id_refs_id_a3d5f060 FOREIGN KEY (oil_tariff_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opportunities_opportunity_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY opportunities_opportunity
    ADD CONSTRAINT opportunities_opportunity_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opportunity_id_refs_id_913cb336; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_accepted_opportunities
    ADD CONSTRAINT opportunity_id_refs_id_913cb336 FOREIGN KEY (opportunity_id) REFERENCES opportunities_opportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opportunity_id_refs_id_99faf1f6; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_rejected_opportunities
    ADD CONSTRAINT opportunity_id_refs_id_99faf1f6 FOREIGN KEY (opportunity_id) REFERENCES opportunities_opportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiod_id_refs_id_4b57cac2; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_rejected_opportunities
    ADD CONSTRAINT processperiod_id_refs_id_4b57cac2 FOREIGN KEY (processperiod_id) REFERENCES processperiods_processperiod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiod_id_refs_id_705e3baf; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_accepted_opportunities
    ADD CONSTRAINT processperiod_id_refs_id_705e3baf FOREIGN KEY (processperiod_id) REFERENCES processperiods_processperiod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiod_id_refs_id_7d85d570; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_significant_energyuses
    ADD CONSTRAINT processperiod_id_refs_id_7d85d570 FOREIGN KEY (processperiod_id) REFERENCES processperiods_processperiod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiod_id_refs_id_e0c4840d; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_enpis
    ADD CONSTRAINT processperiod_id_refs_id_e0c4840d FOREIGN KEY (processperiod_id) REFERENCES processperiods_processperiod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiods_processperiod_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod
    ADD CONSTRAINT processperiods_processperiod_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiods_processperiod_enpis_energyperformance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_enpis
    ADD CONSTRAINT processperiods_processperiod_enpis_energyperformance_id_fkey FOREIGN KEY (energyperformance_id) REFERENCES energyperformances_energyperformance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiods_processperiod_significant_ener_energyuse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiod_significant_energyuses
    ADD CONSTRAINT processperiods_processperiod_significant_ener_energyuse_id_fkey FOREIGN KEY (energyuse_id) REFERENCES energyuses_energyuse(consumptiongroup_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiods_processperiodgoal_energyperformance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiodgoal
    ADD CONSTRAINT processperiods_processperiodgoal_energyperformance_id_fkey FOREIGN KEY (energyperformance_id) REFERENCES energyperformances_energyperformance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: processperiods_processperiodgoal_processperiod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY processperiods_processperiodgoal
    ADD CONSTRAINT processperiods_processperiodgoal_processperiod_id_fkey FOREIGN KEY (processperiod_id) REFERENCES processperiods_processperiod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_id_refs_id_f48346e6; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_productinstallation
    ADD CONSTRAINT product_id_refs_id_f48346e6 FOREIGN KEY (product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productionenergyperformance_id_refs_energyperformance_ptr_i5694; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_productiongroups
    ADD CONSTRAINT productionenergyperformance_id_refs_energyperformance_ptr_i5694 FOREIGN KEY (productionenergyperformance_id) REFERENCES energyperformances_productionenergyperformance(energyperformance_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productionenergyperformance_id_refs_energyperformance_ptr_i5745; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_productionenergyperformance_consumptiong23ca
    ADD CONSTRAINT productionenergyperformance_id_refs_energyperformance_ptr_i5745 FOREIGN KEY (productionenergyperformance_id) REFERENCES energyperformances_productionenergyperformance(energyperformance_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productiongroup_id_refs_id_962fb0fc; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_productiongroup_productions
    ADD CONSTRAINT productiongroup_id_refs_id_962fb0fc FOREIGN KEY (productiongroup_id) REFERENCES productions_productiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_nonpulseperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_nonpulseperiod
    ADD CONSTRAINT productions_nonpulseperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_nonpulseperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_nonpulseperiod
    ADD CONSTRAINT productions_nonpulseperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES productions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_offlinetolerance_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_offlinetolerance
    ADD CONSTRAINT productions_offlinetolerance_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES productions_production(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_period_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_period
    ADD CONSTRAINT productions_period_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES productions_production(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_production_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_production
    ADD CONSTRAINT productions_production_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_productiongroup_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_productiongroup
    ADD CONSTRAINT productions_productiongroup_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_productiongroup_productions_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_productiongroup_productions
    ADD CONSTRAINT productions_productiongroup_productions_production_id_fkey FOREIGN KEY (production_id) REFERENCES productions_production(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_pulseperiod_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_pulseperiod
    ADD CONSTRAINT productions_pulseperiod_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_pulseperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_pulseperiod
    ADD CONSTRAINT productions_pulseperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES productions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productions_singlevalueperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_singlevalueperiod
    ADD CONSTRAINT productions_singlevalueperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES productions_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_historicalproduct_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT products_historicalproduct_category_id_fkey FOREIGN KEY (category_id) REFERENCES products_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_historicalproduct_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT products_historicalproduct_product_id_fkey FOREIGN KEY (product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_historicalproduct_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT products_historicalproduct_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_historicalproduct_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT products_historicalproduct_user_id_fkey FOREIGN KEY (user_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_category_id_fkey FOREIGN KEY (category_id) REFERENCES products_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productcategory_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_productcategory
    ADD CONSTRAINT products_productcategory_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_additionalsaving_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_additionalsaving
    ADD CONSTRAINT projects_additionalsaving_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects_benchmarkproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_benchmarkproject_bas_consumptionmeasurementpoint__fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_baseline_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_bas_consumptionmeasurementpoint__fkey FOREIGN KEY (consumptionmeasurementpoint_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_benchmarkproject_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject
    ADD CONSTRAINT projects_benchmarkproject_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_benchmarkproject_res_consumptionmeasurementpoint__fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_benchmarkproject_result_measurement_points
    ADD CONSTRAINT projects_benchmarkproject_res_consumptionmeasurementpoint__fkey FOREIGN KEY (consumptionmeasurementpoint_id) REFERENCES customers_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_cost_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY projects_cost
    ADD CONSTRAINT projects_cost_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects_benchmarkproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: provider_datasources_providerdatasource_datasource_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY provider_datasources_providerdatasource
    ADD CONSTRAINT provider_datasources_providerdatasource_datasource_ptr_id_fkey FOREIGN KEY (datasource_ptr_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: provider_datasources_providerdatasource_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY provider_datasources_providerdatasource
    ADD CONSTRAINT provider_datasources_providerdatasource_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: provider_id_refs_id_9a36e572; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT provider_id_refs_id_9a36e572 FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: provider_id_refs_id_ff8566f3; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT provider_id_refs_id_ff8566f3 FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pulseemitterinstallation_id_refs_productinstallation_ptr_id7855; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_pulseemitterinstallation_input_satisfies_data7b36
    ADD CONSTRAINT pulseemitterinstallation_id_refs_productinstallation_ptr_id7855 FOREIGN KEY (pulseemitterinstallation_id) REFERENCES installations_pulseemitterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: relay_id_refs_id_4dc04d6b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_collection
    ADD CONSTRAINT relay_id_refs_id_4dc04d6b FOREIGN KEY (relay_id) REFERENCES devices_meter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_report_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY reports_report
    ADD CONSTRAINT reports_report_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_dateexception_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_dateexception
    ADD CONSTRAINT rules_dateexception_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_emailaction_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_emailaction
    ADD CONSTRAINT rules_emailaction_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_indexinvariant_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_indexinvariant
    ADD CONSTRAINT rules_indexinvariant_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_indexinvariant_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_indexinvariant
    ADD CONSTRAINT rules_indexinvariant_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_triggeredrule(userrule_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_inputinvariant_data_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_inputinvariant
    ADD CONSTRAINT rules_inputinvariant_data_series_id_fkey FOREIGN KEY (data_series_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_inputinvariant_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_inputinvariant
    ADD CONSTRAINT rules_inputinvariant_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_triggeredrule(userrule_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_minimizerule_index_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_minimizerule
    ADD CONSTRAINT rules_minimizerule_index_id_fkey FOREIGN KEY (index_id) REFERENCES indexes_index(dataseries_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_minimizerule_userrule_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_minimizerule
    ADD CONSTRAINT rules_minimizerule_userrule_ptr_id_fkey FOREIGN KEY (userrule_ptr_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_phoneaction_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_phoneaction
    ADD CONSTRAINT rules_phoneaction_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_relayaction_meter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_relayaction
    ADD CONSTRAINT rules_relayaction_meter_id_fkey FOREIGN KEY (meter_id) REFERENCES devices_meter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_relayaction_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_relayaction
    ADD CONSTRAINT rules_relayaction_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_triggeredrule_userrule_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_triggeredrule
    ADD CONSTRAINT rules_triggeredrule_userrule_ptr_id_fkey FOREIGN KEY (userrule_ptr_id) REFERENCES rules_userrule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rules_userrule_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY rules_userrule
    ADD CONSTRAINT rules_userrule_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_activityentry_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_activityentry
    ADD CONSTRAINT salesopportunities_activityentry_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_activityentry_salesopportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_activityentry
    ADD CONSTRAINT salesopportunities_activityentry_salesopportunity_id_fkey FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_industrytypesavings_industry_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_industrytypesavings
    ADD CONSTRAINT salesopportunities_industrytypesavings_industry_type_id_fkey FOREIGN KEY (industry_type_id) REFERENCES salesopportunities_industrytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_industrytypeusedistrib_industry_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_industrytypeusedistribution
    ADD CONSTRAINT salesopportunities_industrytypeusedistrib_industry_type_id_fkey FOREIGN KEY (industry_type_id) REFERENCES salesopportunities_industrytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_floorplan_floorplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity_floorplans
    ADD CONSTRAINT salesopportunities_salesopportunity_floorplan_floorplan_id_fkey FOREIGN KEY (floorplan_id) REFERENCES installations_floorplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_industry_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_industry_type_id_fkey FOREIGN KEY (industry_type_id) REFERENCES salesopportunities_industrytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_sales_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_sales_officer_id_fkey FOREIGN KEY (sales_officer_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunity_sizing_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity
    ADD CONSTRAINT salesopportunities_salesopportunity_sizing_officer_id_fkey FOREIGN KEY (sizing_officer_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunitysa_sales_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunitysavings
    ADD CONSTRAINT salesopportunities_salesopportunitysa_sales_opportunity_id_fkey FOREIGN KEY (sales_opportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_salesopportunityus_sales_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunityusedistribution
    ADD CONSTRAINT salesopportunities_salesopportunityus_sales_opportunity_id_fkey FOREIGN KEY (sales_opportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_surveyinstruction_sales_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_surveyinstruction
    ADD CONSTRAINT salesopportunities_surveyinstruction_sales_opportunity_id_fkey FOREIGN KEY (sales_opportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_task_assigned_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_task
    ADD CONSTRAINT salesopportunities_task_assigned_id_fkey FOREIGN KEY (assigned_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunities_task_sales_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_task
    ADD CONSTRAINT salesopportunities_task_sales_opportunity_id_fkey FOREIGN KEY (sales_opportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: salesopportunity_id_refs_id_b057c298; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY salesopportunities_salesopportunity_floorplans
    ADD CONSTRAINT salesopportunity_id_refs_id_b057c298 FOREIGN KEY (salesopportunity_id) REFERENCES salesopportunities_salesopportunity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_252df082; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY dataneeds_dataneed
    ADD CONSTRAINT subclass_id_refs_id_252df082 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_36bbd919; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_production
    ADD CONSTRAINT subclass_id_refs_id_36bbd919 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_3e55e98c; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY productions_period
    ADD CONSTRAINT subclass_id_refs_id_3e55e98c FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_43653351; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY manage_collections_item
    ADD CONSTRAINT subclass_id_refs_id_43653351 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_458bbaae; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_period
    ADD CONSTRAINT subclass_id_refs_id_458bbaae FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_48fcc896; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY co2conversions_co2conversion
    ADD CONSTRAINT subclass_id_refs_id_48fcc896 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_515845a1; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_period
    ADD CONSTRAINT subclass_id_refs_id_515845a1 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_5d4fffa0; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_period
    ADD CONSTRAINT subclass_id_refs_id_5d4fffa0 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_8730fac0; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_nonaccumulationdatasequence
    ADD CONSTRAINT subclass_id_refs_id_8730fac0 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_8dfae410; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_tariff
    ADD CONSTRAINT subclass_id_refs_id_8dfae410 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_9af44991; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasources_datasource
    ADD CONSTRAINT subclass_id_refs_id_9af44991 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_c451520d; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_collection
    ADD CONSTRAINT subclass_id_refs_id_c451520d FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_cde24dc2; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_productinstallation
    ADD CONSTRAINT subclass_id_refs_id_cde24dc2 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_d9ec15d7; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_consumption
    ADD CONSTRAINT subclass_id_refs_id_d9ec15d7 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_e384db2e; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY cost_compensations_costcompensation
    ADD CONSTRAINT subclass_id_refs_id_e384db2e FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_eaa70ec4; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_energyperformance
    ADD CONSTRAINT subclass_id_refs_id_eaa70ec4 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_f3a019e1; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY measurementpoints_dataseries
    ADD CONSTRAINT subclass_id_refs_id_f3a019e1 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subclass_id_refs_id_fc54e199; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY datasequences_energypervolumedatasequence
    ADD CONSTRAINT subclass_id_refs_id_fc54e199 FOREIGN KEY (subclass_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supplier_id_refs_id_afb6d5cc; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_historicalproduct
    ADD CONSTRAINT supplier_id_refs_id_afb6d5cc FOREIGN KEY (supplier_id) REFERENCES suppliers_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supplier_id_refs_id_d355c514; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT supplier_id_refs_id_d355c514 FOREIGN KEY (supplier_id) REFERENCES suppliers_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_supplier_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY suppliers_supplier
    ADD CONSTRAINT suppliers_supplier_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES providers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: system_health_site_healthreport_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY system_health_site_healthreport
    ADD CONSTRAINT system_health_site_healthreport_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariff_id_refs_id_b89a61de; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY consumptions_mainconsumption
    ADD CONSTRAINT tariff_id_refs_id_b89a61de FOREIGN KEY (tariff_id) REFERENCES tariffs_tariff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariff_id_refs_tariff_ptr_id_49f6a051; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY price_relay_site_pricerelayproject
    ADD CONSTRAINT tariff_id_refs_tariff_ptr_id_49f6a051 FOREIGN KEY (tariff_id) REFERENCES tariffs_energytariff(tariff_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_energytariff_tariff_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_energytariff
    ADD CONSTRAINT tariffs_energytariff_tariff_ptr_id_fkey FOREIGN KEY (tariff_ptr_id) REFERENCES tariffs_tariff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_fixedpriceperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_fixedpriceperiod
    ADD CONSTRAINT tariffs_fixedpriceperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES tariffs_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_period_datasequence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_period
    ADD CONSTRAINT tariffs_period_datasequence_id_fkey FOREIGN KEY (datasequence_id) REFERENCES tariffs_tariff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_spotpriceperiod_period_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_spotpriceperiod
    ADD CONSTRAINT tariffs_spotpriceperiod_period_ptr_id_fkey FOREIGN KEY (period_ptr_id) REFERENCES tariffs_period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_spotpriceperiod_spotprice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_spotpriceperiod
    ADD CONSTRAINT tariffs_spotpriceperiod_spotprice_id_fkey FOREIGN KEY (spotprice_id) REFERENCES datasources_datasource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_tariff_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_tariff
    ADD CONSTRAINT tariffs_tariff_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tariffs_volumetariff_tariff_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY tariffs_volumetariff
    ADD CONSTRAINT tariffs_volumetariff_tariff_ptr_id_fkey FOREIGN KEY (tariff_ptr_id) REFERENCES tariffs_tariff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: time_datasource_id_refs_id_6c1ed825; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energy_projects_energyproject
    ADD CONSTRAINT time_datasource_id_refs_id_6c1ed825 FOREIGN KEY (time_datasource_id) REFERENCES consumptions_consumption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: timeenergyperformance_id_refs_energyperformance_ptr_id_4c0c0b40; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY energyperformances_timeenergyperformance_consumptiongroups
    ADD CONSTRAINT timeenergyperformance_id_refs_energyperformance_ptr_id_4c0c0b40 FOREIGN KEY (timeenergyperformance_id) REFERENCES energyperformances_timeenergyperformance(energyperformance_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_auth_tokendata_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY token_auth_tokendata
    ADD CONSTRAINT token_auth_tokendata_user_id_fkey FOREIGN KEY (user_id) REFERENCES users_user(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tripleinputmeterinstallation_id_refs_productinstallation_pt03ca; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input2_satisfies1aad
    ADD CONSTRAINT tripleinputmeterinstallation_id_refs_productinstallation_pt03ca FOREIGN KEY (tripleinputmeterinstallation_id) REFERENCES installations_tripleinputmeterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tripleinputmeterinstallation_id_refs_productinstallation_pt99e5; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input1_satisfies0539
    ADD CONSTRAINT tripleinputmeterinstallation_id_refs_productinstallation_pt99e5 FOREIGN KEY (tripleinputmeterinstallation_id) REFERENCES installations_tripleinputmeterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tripleinputmeterinstallation_id_refs_productinstallation_ptefc7; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY installations_tripleinputmeterinstallation_input3_satisfies9eaa
    ADD CONSTRAINT tripleinputmeterinstallation_id_refs_productinstallation_ptefc7 FOREIGN KEY (tripleinputmeterinstallation_id) REFERENCES installations_tripleinputmeterinstallation(productinstallation_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7022b859; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY encryption_encryptionkey
    ADD CONSTRAINT user_id_refs_id_7022b859 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_ptr_id_refs_id_5d020fd9; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT user_ptr_id_refs_id_5d020fd9 FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_id_refs_id_730c079b; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_userprofile_collections
    ADD CONSTRAINT userprofile_id_refs_id_730c079b FOREIGN KEY (userprofile_id) REFERENCES customers_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: water_tariff_id_refs_id_a3d5f060; Type: FK CONSTRAINT; Schema: public; Owner: portal
--

ALTER TABLE ONLY customers_customer
    ADD CONSTRAINT water_tariff_id_refs_id_a3d5f060 FOREIGN KEY (water_tariff_id) REFERENCES measurementpoints_dataseries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: auth_group; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_group FROM PUBLIC;
REVOKE ALL ON TABLE auth_group FROM portal;
GRANT ALL ON TABLE auth_group TO portal;
GRANT ALL ON TABLE auth_group TO grid;


--
-- Name: auth_group_permissions; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_group_permissions FROM PUBLIC;
REVOKE ALL ON TABLE auth_group_permissions FROM portal;
GRANT ALL ON TABLE auth_group_permissions TO portal;
GRANT ALL ON TABLE auth_group_permissions TO grid;


--
-- Name: auth_permission; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_permission FROM PUBLIC;
REVOKE ALL ON TABLE auth_permission FROM portal;
GRANT ALL ON TABLE auth_permission TO portal;
GRANT ALL ON TABLE auth_permission TO grid;


--
-- Name: auth_user; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_user FROM PUBLIC;
REVOKE ALL ON TABLE auth_user FROM portal;
GRANT ALL ON TABLE auth_user TO portal;
GRANT ALL ON TABLE auth_user TO grid;


--
-- Name: auth_user_groups; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_user_groups FROM PUBLIC;
REVOKE ALL ON TABLE auth_user_groups FROM portal;
GRANT ALL ON TABLE auth_user_groups TO portal;
GRANT ALL ON TABLE auth_user_groups TO grid;


--
-- Name: auth_user_user_permissions; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE auth_user_user_permissions FROM PUBLIC;
REVOKE ALL ON TABLE auth_user_user_permissions FROM portal;
GRANT ALL ON TABLE auth_user_user_permissions TO portal;
GRANT ALL ON TABLE auth_user_user_permissions TO grid;


--
-- Name: celery_taskmeta; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE celery_taskmeta FROM PUBLIC;
REVOKE ALL ON TABLE celery_taskmeta FROM portal;
GRANT ALL ON TABLE celery_taskmeta TO portal;
GRANT ALL ON TABLE celery_taskmeta TO grid;


--
-- Name: celery_tasksetmeta; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE celery_tasksetmeta FROM PUBLIC;
REVOKE ALL ON TABLE celery_tasksetmeta FROM portal;
GRANT ALL ON TABLE celery_tasksetmeta TO portal;
GRANT ALL ON TABLE celery_tasksetmeta TO grid;


--
-- Name: co2conversions_co2conversion; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE co2conversions_co2conversion FROM PUBLIC;
REVOKE ALL ON TABLE co2conversions_co2conversion FROM portal;
GRANT ALL ON TABLE co2conversions_co2conversion TO portal;
GRANT ALL ON TABLE co2conversions_co2conversion TO grid;


--
-- Name: co2conversions_dynamicco2conversion; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE co2conversions_dynamicco2conversion FROM PUBLIC;
REVOKE ALL ON TABLE co2conversions_dynamicco2conversion FROM portal;
GRANT ALL ON TABLE co2conversions_dynamicco2conversion TO portal;
GRANT ALL ON TABLE co2conversions_dynamicco2conversion TO grid;


--
-- Name: co2conversions_fixedco2conversion; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE co2conversions_fixedco2conversion FROM PUBLIC;
REVOKE ALL ON TABLE co2conversions_fixedco2conversion FROM portal;
GRANT ALL ON TABLE co2conversions_fixedco2conversion TO portal;
GRANT ALL ON TABLE co2conversions_fixedco2conversion TO grid;


--
-- Name: condensing_fiveminuteaccumulateddata; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE condensing_fiveminuteaccumulateddata FROM PUBLIC;
REVOKE ALL ON TABLE condensing_fiveminuteaccumulateddata FROM portal;
GRANT ALL ON TABLE condensing_fiveminuteaccumulateddata TO portal;
GRANT ALL ON TABLE condensing_fiveminuteaccumulateddata TO grid;


--
-- Name: condensing_houraccumulateddata; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE condensing_houraccumulateddata FROM PUBLIC;
REVOKE ALL ON TABLE condensing_houraccumulateddata FROM portal;
GRANT ALL ON TABLE condensing_houraccumulateddata TO portal;
GRANT ALL ON TABLE condensing_houraccumulateddata TO grid;


--
-- Name: consumptions_consumption; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_consumption FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_consumption FROM portal;
GRANT ALL ON TABLE consumptions_consumption TO portal;
GRANT ALL ON TABLE consumptions_consumption TO grid;


--
-- Name: consumptions_consumptiongroup; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_consumptiongroup FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_consumptiongroup FROM portal;
GRANT ALL ON TABLE consumptions_consumptiongroup TO portal;
GRANT ALL ON TABLE consumptions_consumptiongroup TO grid;


--
-- Name: consumptions_consumptiongroup_consumptions; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_consumptiongroup_consumptions FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_consumptiongroup_consumptions FROM portal;
GRANT ALL ON TABLE consumptions_consumptiongroup_consumptions TO portal;
GRANT ALL ON TABLE consumptions_consumptiongroup_consumptions TO grid;


--
-- Name: consumptions_mainconsumption; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_mainconsumption FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_mainconsumption FROM portal;
GRANT ALL ON TABLE consumptions_mainconsumption TO portal;
GRANT ALL ON TABLE consumptions_mainconsumption TO grid;


--
-- Name: consumptions_mainconsumption_consumptions; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_mainconsumption_consumptions FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_mainconsumption_consumptions FROM portal;
GRANT ALL ON TABLE consumptions_mainconsumption_consumptions TO portal;
GRANT ALL ON TABLE consumptions_mainconsumption_consumptions TO grid;


--
-- Name: consumptions_nonpulseperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_nonpulseperiod FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_nonpulseperiod FROM portal;
GRANT ALL ON TABLE consumptions_nonpulseperiod TO portal;
GRANT ALL ON TABLE consumptions_nonpulseperiod TO grid;


--
-- Name: consumptions_offlinetolerance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_offlinetolerance FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_offlinetolerance FROM portal;
GRANT ALL ON TABLE consumptions_offlinetolerance TO portal;
GRANT ALL ON TABLE consumptions_offlinetolerance TO grid;


--
-- Name: consumptions_period; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_period FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_period FROM portal;
GRANT ALL ON TABLE consumptions_period TO portal;
GRANT ALL ON TABLE consumptions_period TO grid;


--
-- Name: consumptions_pulseperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_pulseperiod FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_pulseperiod FROM portal;
GRANT ALL ON TABLE consumptions_pulseperiod TO portal;
GRANT ALL ON TABLE consumptions_pulseperiod TO grid;


--
-- Name: consumptions_singlevalueperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE consumptions_singlevalueperiod FROM PUBLIC;
REVOKE ALL ON TABLE consumptions_singlevalueperiod FROM portal;
GRANT ALL ON TABLE consumptions_singlevalueperiod TO portal;
GRANT ALL ON TABLE consumptions_singlevalueperiod TO grid;


--
-- Name: corsheaders_corsmodel; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE corsheaders_corsmodel FROM PUBLIC;
REVOKE ALL ON TABLE corsheaders_corsmodel FROM portal;
GRANT ALL ON TABLE corsheaders_corsmodel TO portal;
GRANT ALL ON TABLE corsheaders_corsmodel TO grid;


--
-- Name: cost_compensations_costcompensation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE cost_compensations_costcompensation FROM PUBLIC;
REVOKE ALL ON TABLE cost_compensations_costcompensation FROM portal;
GRANT ALL ON TABLE cost_compensations_costcompensation TO portal;
GRANT ALL ON TABLE cost_compensations_costcompensation TO grid;


--
-- Name: cost_compensations_fixedcompensationperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE cost_compensations_fixedcompensationperiod FROM PUBLIC;
REVOKE ALL ON TABLE cost_compensations_fixedcompensationperiod FROM portal;
GRANT ALL ON TABLE cost_compensations_fixedcompensationperiod TO portal;
GRANT ALL ON TABLE cost_compensations_fixedcompensationperiod TO grid;


--
-- Name: cost_compensations_period; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE cost_compensations_period FROM PUBLIC;
REVOKE ALL ON TABLE cost_compensations_period FROM portal;
GRANT ALL ON TABLE cost_compensations_period TO portal;
GRANT ALL ON TABLE cost_compensations_period TO grid;


--
-- Name: customer_datasources_customerdatasource; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customer_datasources_customerdatasource FROM PUBLIC;
REVOKE ALL ON TABLE customer_datasources_customerdatasource FROM portal;
GRANT ALL ON TABLE customer_datasources_customerdatasource TO portal;
GRANT ALL ON TABLE customer_datasources_customerdatasource TO grid;


--
-- Name: customers_collection; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_collection FROM PUBLIC;
REVOKE ALL ON TABLE customers_collection FROM portal;
GRANT ALL ON TABLE customers_collection TO portal;
GRANT ALL ON TABLE customers_collection TO grid;


--
-- Name: customers_customer; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_customer FROM PUBLIC;
REVOKE ALL ON TABLE customers_customer FROM portal;
GRANT ALL ON TABLE customers_customer TO portal;
GRANT ALL ON TABLE customers_customer TO grid;


--
-- Name: customers_customer_industry_types; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_customer_industry_types FROM PUBLIC;
REVOKE ALL ON TABLE customers_customer_industry_types FROM portal;
GRANT ALL ON TABLE customers_customer_industry_types TO portal;
GRANT ALL ON TABLE customers_customer_industry_types TO grid;


--
-- Name: customers_location; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_location FROM PUBLIC;
REVOKE ALL ON TABLE customers_location FROM portal;
GRANT ALL ON TABLE customers_location TO portal;
GRANT ALL ON TABLE customers_location TO grid;


--
-- Name: customers_userprofile; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_userprofile FROM PUBLIC;
REVOKE ALL ON TABLE customers_userprofile FROM portal;
GRANT ALL ON TABLE customers_userprofile TO portal;
GRANT ALL ON TABLE customers_userprofile TO grid;


--
-- Name: customers_userprofile_collections; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE customers_userprofile_collections FROM PUBLIC;
REVOKE ALL ON TABLE customers_userprofile_collections FROM portal;
GRANT ALL ON TABLE customers_userprofile_collections TO portal;
GRANT ALL ON TABLE customers_userprofile_collections TO grid;


--
-- Name: datahub_datahubconnection; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datahub_datahubconnection FROM PUBLIC;
REVOKE ALL ON TABLE datahub_datahubconnection FROM portal;
GRANT ALL ON TABLE datahub_datahubconnection TO portal;
GRANT ALL ON TABLE datahub_datahubconnection TO grid;


--
-- Name: dataneeds_dataneed; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE dataneeds_dataneed FROM PUBLIC;
REVOKE ALL ON TABLE dataneeds_dataneed FROM portal;
GRANT ALL ON TABLE dataneeds_dataneed TO portal;
GRANT ALL ON TABLE dataneeds_dataneed TO grid;


--
-- Name: dataneeds_energyusedataneed; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE dataneeds_energyusedataneed FROM PUBLIC;
REVOKE ALL ON TABLE dataneeds_energyusedataneed FROM portal;
GRANT ALL ON TABLE dataneeds_energyusedataneed TO portal;
GRANT ALL ON TABLE dataneeds_energyusedataneed TO grid;


--
-- Name: dataneeds_mainconsumptiondataneed; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE dataneeds_mainconsumptiondataneed FROM PUBLIC;
REVOKE ALL ON TABLE dataneeds_mainconsumptiondataneed FROM portal;
GRANT ALL ON TABLE dataneeds_mainconsumptiondataneed TO portal;
GRANT ALL ON TABLE dataneeds_mainconsumptiondataneed TO grid;


--
-- Name: dataneeds_productiongroupdataneed; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE dataneeds_productiongroupdataneed FROM PUBLIC;
REVOKE ALL ON TABLE dataneeds_productiongroupdataneed FROM portal;
GRANT ALL ON TABLE dataneeds_productiongroupdataneed TO portal;
GRANT ALL ON TABLE dataneeds_productiongroupdataneed TO grid;


--
-- Name: datasequence_adapters_consumptionaccumulationadapter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequence_adapters_consumptionaccumulationadapter FROM PUBLIC;
REVOKE ALL ON TABLE datasequence_adapters_consumptionaccumulationadapter FROM portal;
GRANT ALL ON TABLE datasequence_adapters_consumptionaccumulationadapter TO portal;
GRANT ALL ON TABLE datasequence_adapters_consumptionaccumulationadapter TO grid;


--
-- Name: datasequence_adapters_nonaccumulationadapter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequence_adapters_nonaccumulationadapter FROM PUBLIC;
REVOKE ALL ON TABLE datasequence_adapters_nonaccumulationadapter FROM portal;
GRANT ALL ON TABLE datasequence_adapters_nonaccumulationadapter TO portal;
GRANT ALL ON TABLE datasequence_adapters_nonaccumulationadapter TO grid;


--
-- Name: datasequence_adapters_productionaccumulationadapter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequence_adapters_productionaccumulationadapter FROM PUBLIC;
REVOKE ALL ON TABLE datasequence_adapters_productionaccumulationadapter FROM portal;
GRANT ALL ON TABLE datasequence_adapters_productionaccumulationadapter TO portal;
GRANT ALL ON TABLE datasequence_adapters_productionaccumulationadapter TO grid;


--
-- Name: datasequences_energypervolumedatasequence; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequences_energypervolumedatasequence FROM PUBLIC;
REVOKE ALL ON TABLE datasequences_energypervolumedatasequence FROM portal;
GRANT ALL ON TABLE datasequences_energypervolumedatasequence TO portal;
GRANT ALL ON TABLE datasequences_energypervolumedatasequence TO grid;


--
-- Name: datasequences_energypervolumeperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequences_energypervolumeperiod FROM PUBLIC;
REVOKE ALL ON TABLE datasequences_energypervolumeperiod FROM portal;
GRANT ALL ON TABLE datasequences_energypervolumeperiod TO portal;
GRANT ALL ON TABLE datasequences_energypervolumeperiod TO grid;


--
-- Name: datasequences_nonaccumulationdatasequence; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequences_nonaccumulationdatasequence FROM PUBLIC;
REVOKE ALL ON TABLE datasequences_nonaccumulationdatasequence FROM portal;
GRANT ALL ON TABLE datasequences_nonaccumulationdatasequence TO portal;
GRANT ALL ON TABLE datasequences_nonaccumulationdatasequence TO grid;


--
-- Name: datasequences_nonaccumulationofflinetolerance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequences_nonaccumulationofflinetolerance FROM PUBLIC;
REVOKE ALL ON TABLE datasequences_nonaccumulationofflinetolerance FROM portal;
GRANT ALL ON TABLE datasequences_nonaccumulationofflinetolerance TO portal;
GRANT ALL ON TABLE datasequences_nonaccumulationofflinetolerance TO grid;


--
-- Name: datasequences_nonaccumulationperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasequences_nonaccumulationperiod FROM PUBLIC;
REVOKE ALL ON TABLE datasequences_nonaccumulationperiod FROM portal;
GRANT ALL ON TABLE datasequences_nonaccumulationperiod TO portal;
GRANT ALL ON TABLE datasequences_nonaccumulationperiod TO grid;


--
-- Name: datasources_datasource; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasources_datasource FROM PUBLIC;
REVOKE ALL ON TABLE datasources_datasource FROM portal;
GRANT ALL ON TABLE datasources_datasource TO portal;
GRANT ALL ON TABLE datasources_datasource TO grid;


--
-- Name: datasources_rawdata; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE datasources_rawdata FROM PUBLIC;
REVOKE ALL ON TABLE datasources_rawdata FROM portal;
GRANT ALL ON TABLE datasources_rawdata TO portal;
GRANT ALL ON TABLE datasources_rawdata TO grid;


--
-- Name: devices_agent; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_agent FROM PUBLIC;
REVOKE ALL ON TABLE devices_agent FROM portal;
GRANT ALL ON TABLE devices_agent TO portal;
GRANT ALL ON TABLE devices_agent TO grid;


--
-- Name: devices_agentevent; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_agentevent FROM PUBLIC;
REVOKE ALL ON TABLE devices_agentevent FROM portal;
GRANT ALL ON TABLE devices_agentevent TO portal;
GRANT ALL ON TABLE devices_agentevent TO grid;


--
-- Name: devices_agentstatechange; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_agentstatechange FROM PUBLIC;
REVOKE ALL ON TABLE devices_agentstatechange FROM portal;
GRANT ALL ON TABLE devices_agentstatechange TO portal;
GRANT ALL ON TABLE devices_agentstatechange TO grid;


--
-- Name: devices_meter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_meter FROM PUBLIC;
REVOKE ALL ON TABLE devices_meter FROM portal;
GRANT ALL ON TABLE devices_meter TO portal;
GRANT ALL ON TABLE devices_meter TO grid;


--
-- Name: devices_meterstatechange; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_meterstatechange FROM PUBLIC;
REVOKE ALL ON TABLE devices_meterstatechange FROM portal;
GRANT ALL ON TABLE devices_meterstatechange TO portal;
GRANT ALL ON TABLE devices_meterstatechange TO grid;


--
-- Name: devices_physicalinput; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_physicalinput FROM PUBLIC;
REVOKE ALL ON TABLE devices_physicalinput FROM portal;
GRANT ALL ON TABLE devices_physicalinput TO portal;
GRANT ALL ON TABLE devices_physicalinput TO grid;


--
-- Name: devices_softwareimage; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE devices_softwareimage FROM PUBLIC;
REVOKE ALL ON TABLE devices_softwareimage FROM portal;
GRANT ALL ON TABLE devices_softwareimage TO portal;
GRANT ALL ON TABLE devices_softwareimage TO grid;


--
-- Name: display_widgets_dashboardwidget; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE display_widgets_dashboardwidget FROM PUBLIC;
REVOKE ALL ON TABLE display_widgets_dashboardwidget FROM portal;
GRANT ALL ON TABLE display_widgets_dashboardwidget TO portal;
GRANT ALL ON TABLE display_widgets_dashboardwidget TO grid;


--
-- Name: django_admin_log; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE django_admin_log FROM PUBLIC;
REVOKE ALL ON TABLE django_admin_log FROM portal;
GRANT ALL ON TABLE django_admin_log TO portal;
GRANT ALL ON TABLE django_admin_log TO grid;


--
-- Name: django_content_type; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE django_content_type FROM PUBLIC;
REVOKE ALL ON TABLE django_content_type FROM portal;
GRANT ALL ON TABLE django_content_type TO portal;
GRANT ALL ON TABLE django_content_type TO grid;


--
-- Name: django_migrations; Type: ACL; Schema: public; Owner: grid
--

REVOKE ALL ON TABLE django_migrations FROM PUBLIC;
REVOKE ALL ON TABLE django_migrations FROM grid;
GRANT ALL ON TABLE django_migrations TO grid;


--
-- Name: django_session; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE django_session FROM PUBLIC;
REVOKE ALL ON TABLE django_session FROM portal;
GRANT ALL ON TABLE django_session TO portal;
GRANT ALL ON TABLE django_session TO grid;


--
-- Name: djcelery_crontabschedule; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_crontabschedule FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_crontabschedule FROM portal;
GRANT ALL ON TABLE djcelery_crontabschedule TO portal;
GRANT ALL ON TABLE djcelery_crontabschedule TO grid;


--
-- Name: djcelery_intervalschedule; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_intervalschedule FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_intervalschedule FROM portal;
GRANT ALL ON TABLE djcelery_intervalschedule TO portal;
GRANT ALL ON TABLE djcelery_intervalschedule TO grid;


--
-- Name: djcelery_periodictask; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_periodictask FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_periodictask FROM portal;
GRANT ALL ON TABLE djcelery_periodictask TO portal;
GRANT ALL ON TABLE djcelery_periodictask TO grid;


--
-- Name: djcelery_periodictasks; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_periodictasks FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_periodictasks FROM portal;
GRANT ALL ON TABLE djcelery_periodictasks TO portal;
GRANT ALL ON TABLE djcelery_periodictasks TO grid;


--
-- Name: djcelery_taskstate; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_taskstate FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_taskstate FROM portal;
GRANT ALL ON TABLE djcelery_taskstate TO portal;
GRANT ALL ON TABLE djcelery_taskstate TO grid;


--
-- Name: djcelery_workerstate; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE djcelery_workerstate FROM PUBLIC;
REVOKE ALL ON TABLE djcelery_workerstate FROM portal;
GRANT ALL ON TABLE djcelery_workerstate TO portal;
GRANT ALL ON TABLE djcelery_workerstate TO grid;


--
-- Name: encryption_encryptionkey; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE encryption_encryptionkey FROM PUBLIC;
REVOKE ALL ON TABLE encryption_encryptionkey FROM portal;
GRANT ALL ON TABLE encryption_encryptionkey TO portal;
GRANT ALL ON TABLE encryption_encryptionkey TO grid;


--
-- Name: energinet_co2_modelbinding; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energinet_co2_modelbinding FROM PUBLIC;
REVOKE ALL ON TABLE energinet_co2_modelbinding FROM portal;
GRANT ALL ON TABLE energinet_co2_modelbinding TO portal;
GRANT ALL ON TABLE energinet_co2_modelbinding TO grid;


--
-- Name: energy_breakdown_districtheatingconsumptionarea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_districtheatingconsumptionarea FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_districtheatingconsumptionarea FROM portal;
GRANT ALL ON TABLE energy_breakdown_districtheatingconsumptionarea TO portal;
GRANT ALL ON TABLE energy_breakdown_districtheatingconsumptionarea TO grid;


--
-- Name: energy_breakdown_districtheatingconsumptiontotal; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_districtheatingconsumptiontotal FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_districtheatingconsumptiontotal FROM portal;
GRANT ALL ON TABLE energy_breakdown_districtheatingconsumptiontotal TO portal;
GRANT ALL ON TABLE energy_breakdown_districtheatingconsumptiontotal TO grid;


--
-- Name: energy_breakdown_electricityconsumptionarea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_electricityconsumptionarea FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_electricityconsumptionarea FROM portal;
GRANT ALL ON TABLE energy_breakdown_electricityconsumptionarea TO portal;
GRANT ALL ON TABLE energy_breakdown_electricityconsumptionarea TO grid;


--
-- Name: energy_breakdown_electricityconsumptiontotal; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_electricityconsumptiontotal FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_electricityconsumptiontotal FROM portal;
GRANT ALL ON TABLE energy_breakdown_electricityconsumptiontotal TO portal;
GRANT ALL ON TABLE energy_breakdown_electricityconsumptiontotal TO grid;


--
-- Name: energy_breakdown_fuelconsumptionarea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_fuelconsumptionarea FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_fuelconsumptionarea FROM portal;
GRANT ALL ON TABLE energy_breakdown_fuelconsumptionarea TO portal;
GRANT ALL ON TABLE energy_breakdown_fuelconsumptionarea TO grid;


--
-- Name: energy_breakdown_fuelconsumptiontotal; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_fuelconsumptiontotal FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_fuelconsumptiontotal FROM portal;
GRANT ALL ON TABLE energy_breakdown_fuelconsumptiontotal TO portal;
GRANT ALL ON TABLE energy_breakdown_fuelconsumptiontotal TO grid;


--
-- Name: energy_breakdown_proposedaction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_proposedaction FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_proposedaction FROM portal;
GRANT ALL ON TABLE energy_breakdown_proposedaction TO portal;
GRANT ALL ON TABLE energy_breakdown_proposedaction TO grid;


--
-- Name: energy_breakdown_waterconsumptionarea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_waterconsumptionarea FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_waterconsumptionarea FROM portal;
GRANT ALL ON TABLE energy_breakdown_waterconsumptionarea TO portal;
GRANT ALL ON TABLE energy_breakdown_waterconsumptionarea TO grid;


--
-- Name: energy_breakdown_waterconsumptiontotal; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_breakdown_waterconsumptiontotal FROM PUBLIC;
REVOKE ALL ON TABLE energy_breakdown_waterconsumptiontotal FROM portal;
GRANT ALL ON TABLE energy_breakdown_waterconsumptiontotal TO portal;
GRANT ALL ON TABLE energy_breakdown_waterconsumptiontotal TO grid;


--
-- Name: energy_projects_energyproject; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_projects_energyproject FROM PUBLIC;
REVOKE ALL ON TABLE energy_projects_energyproject FROM portal;
GRANT ALL ON TABLE energy_projects_energyproject TO portal;
GRANT ALL ON TABLE energy_projects_energyproject TO grid;


--
-- Name: energy_projects_ledlightproject; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_projects_ledlightproject FROM PUBLIC;
REVOKE ALL ON TABLE energy_projects_ledlightproject FROM portal;
GRANT ALL ON TABLE energy_projects_ledlightproject TO portal;
GRANT ALL ON TABLE energy_projects_ledlightproject TO grid;


--
-- Name: energy_use_reports_energyusearea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_use_reports_energyusearea FROM PUBLIC;
REVOKE ALL ON TABLE energy_use_reports_energyusearea FROM portal;
GRANT ALL ON TABLE energy_use_reports_energyusearea TO portal;
GRANT ALL ON TABLE energy_use_reports_energyusearea TO grid;


--
-- Name: energy_use_reports_energyusearea_measurement_points; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_use_reports_energyusearea_measurement_points FROM PUBLIC;
REVOKE ALL ON TABLE energy_use_reports_energyusearea_measurement_points FROM portal;
GRANT ALL ON TABLE energy_use_reports_energyusearea_measurement_points TO portal;
GRANT ALL ON TABLE energy_use_reports_energyusearea_measurement_points TO grid;


--
-- Name: energy_use_reports_energyusereport; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_use_reports_energyusereport FROM PUBLIC;
REVOKE ALL ON TABLE energy_use_reports_energyusereport FROM portal;
GRANT ALL ON TABLE energy_use_reports_energyusereport TO portal;
GRANT ALL ON TABLE energy_use_reports_energyusereport TO grid;


--
-- Name: energy_use_reports_energyusereport_main_measurement_points; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energy_use_reports_energyusereport_main_measurement_points FROM PUBLIC;
REVOKE ALL ON TABLE energy_use_reports_energyusereport_main_measurement_points FROM portal;
GRANT ALL ON TABLE energy_use_reports_energyusereport_main_measurement_points TO portal;
GRANT ALL ON TABLE energy_use_reports_energyusereport_main_measurement_points TO grid;


--
-- Name: energyperformances_energyperformance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_energyperformance FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_energyperformance FROM portal;
GRANT ALL ON TABLE energyperformances_energyperformance TO portal;
GRANT ALL ON TABLE energyperformances_energyperformance TO grid;


--
-- Name: energyperformances_productionenergyperformance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_productionenergyperformance FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_productionenergyperformance FROM portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance TO portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance TO grid;


--
-- Name: energyperformances_productionenergyperformance_consumptiong23ca; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_productionenergyperformance_consumptiong23ca FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_productionenergyperformance_consumptiong23ca FROM portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance_consumptiong23ca TO portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance_consumptiong23ca TO grid;


--
-- Name: energyperformances_productionenergyperformance_productiongroups; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_productionenergyperformance_productiongroups FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_productionenergyperformance_productiongroups FROM portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance_productiongroups TO portal;
GRANT ALL ON TABLE energyperformances_productionenergyperformance_productiongroups TO grid;


--
-- Name: energyperformances_timeenergyperformance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_timeenergyperformance FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_timeenergyperformance FROM portal;
GRANT ALL ON TABLE energyperformances_timeenergyperformance TO portal;
GRANT ALL ON TABLE energyperformances_timeenergyperformance TO grid;


--
-- Name: energyperformances_timeenergyperformance_consumptiongroups; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyperformances_timeenergyperformance_consumptiongroups FROM PUBLIC;
REVOKE ALL ON TABLE energyperformances_timeenergyperformance_consumptiongroups FROM portal;
GRANT ALL ON TABLE energyperformances_timeenergyperformance_consumptiongroups TO portal;
GRANT ALL ON TABLE energyperformances_timeenergyperformance_consumptiongroups TO grid;


--
-- Name: energyuses_energyuse; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE energyuses_energyuse FROM PUBLIC;
REVOKE ALL ON TABLE energyuses_energyuse FROM portal;
GRANT ALL ON TABLE energyuses_energyuse TO portal;
GRANT ALL ON TABLE energyuses_energyuse TO grid;


--
-- Name: enpi_reports_enpireport; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE enpi_reports_enpireport FROM PUBLIC;
REVOKE ALL ON TABLE enpi_reports_enpireport FROM portal;
GRANT ALL ON TABLE enpi_reports_enpireport TO portal;
GRANT ALL ON TABLE enpi_reports_enpireport TO grid;


--
-- Name: enpi_reports_enpiusearea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE enpi_reports_enpiusearea FROM PUBLIC;
REVOKE ALL ON TABLE enpi_reports_enpiusearea FROM portal;
GRANT ALL ON TABLE enpi_reports_enpiusearea TO portal;
GRANT ALL ON TABLE enpi_reports_enpiusearea TO grid;


--
-- Name: enpi_reports_enpiusearea_measurement_points; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE enpi_reports_enpiusearea_measurement_points FROM PUBLIC;
REVOKE ALL ON TABLE enpi_reports_enpiusearea_measurement_points FROM portal;
GRANT ALL ON TABLE enpi_reports_enpiusearea_measurement_points TO portal;
GRANT ALL ON TABLE enpi_reports_enpiusearea_measurement_points TO grid;


--
-- Name: global_datasources_globaldatasource; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE global_datasources_globaldatasource FROM PUBLIC;
REVOKE ALL ON TABLE global_datasources_globaldatasource FROM portal;
GRANT ALL ON TABLE global_datasources_globaldatasource TO portal;
GRANT ALL ON TABLE global_datasources_globaldatasource TO grid;


--
-- Name: indexes_datasourceindexadapter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_datasourceindexadapter FROM PUBLIC;
REVOKE ALL ON TABLE indexes_datasourceindexadapter FROM portal;
GRANT ALL ON TABLE indexes_datasourceindexadapter TO portal;
GRANT ALL ON TABLE indexes_datasourceindexadapter TO grid;


--
-- Name: indexes_derivedindexperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_derivedindexperiod FROM PUBLIC;
REVOKE ALL ON TABLE indexes_derivedindexperiod FROM portal;
GRANT ALL ON TABLE indexes_derivedindexperiod TO portal;
GRANT ALL ON TABLE indexes_derivedindexperiod TO grid;


--
-- Name: indexes_entry; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_entry FROM PUBLIC;
REVOKE ALL ON TABLE indexes_entry FROM portal;
GRANT ALL ON TABLE indexes_entry TO portal;
GRANT ALL ON TABLE indexes_entry TO grid;


--
-- Name: indexes_index; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_index FROM PUBLIC;
REVOKE ALL ON TABLE indexes_index FROM portal;
GRANT ALL ON TABLE indexes_index TO portal;
GRANT ALL ON TABLE indexes_index TO grid;


--
-- Name: indexes_seasonindexperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_seasonindexperiod FROM PUBLIC;
REVOKE ALL ON TABLE indexes_seasonindexperiod FROM portal;
GRANT ALL ON TABLE indexes_seasonindexperiod TO portal;
GRANT ALL ON TABLE indexes_seasonindexperiod TO grid;


--
-- Name: indexes_spotmapping; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_spotmapping FROM PUBLIC;
REVOKE ALL ON TABLE indexes_spotmapping FROM portal;
GRANT ALL ON TABLE indexes_spotmapping TO portal;
GRANT ALL ON TABLE indexes_spotmapping TO grid;


--
-- Name: indexes_standardmonthindex; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE indexes_standardmonthindex FROM PUBLIC;
REVOKE ALL ON TABLE indexes_standardmonthindex FROM portal;
GRANT ALL ON TABLE indexes_standardmonthindex TO portal;
GRANT ALL ON TABLE indexes_standardmonthindex TO grid;


--
-- Name: installation_surveys_billingmeter; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installation_surveys_billingmeter FROM PUBLIC;
REVOKE ALL ON TABLE installation_surveys_billingmeter FROM portal;
GRANT ALL ON TABLE installation_surveys_billingmeter TO portal;
GRANT ALL ON TABLE installation_surveys_billingmeter TO grid;


--
-- Name: installation_surveys_billingmeterappendix; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installation_surveys_billingmeterappendix FROM PUBLIC;
REVOKE ALL ON TABLE installation_surveys_billingmeterappendix FROM portal;
GRANT ALL ON TABLE installation_surveys_billingmeterappendix TO portal;
GRANT ALL ON TABLE installation_surveys_billingmeterappendix TO grid;


--
-- Name: installation_surveys_energyusearea; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installation_surveys_energyusearea FROM PUBLIC;
REVOKE ALL ON TABLE installation_surveys_energyusearea FROM portal;
GRANT ALL ON TABLE installation_surveys_energyusearea TO portal;
GRANT ALL ON TABLE installation_surveys_energyusearea TO grid;


--
-- Name: installation_surveys_proposedaction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installation_surveys_proposedaction FROM PUBLIC;
REVOKE ALL ON TABLE installation_surveys_proposedaction FROM portal;
GRANT ALL ON TABLE installation_surveys_proposedaction TO portal;
GRANT ALL ON TABLE installation_surveys_proposedaction TO grid;


--
-- Name: installation_surveys_workhours; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installation_surveys_workhours FROM PUBLIC;
REVOKE ALL ON TABLE installation_surveys_workhours FROM portal;
GRANT ALL ON TABLE installation_surveys_workhours TO portal;
GRANT ALL ON TABLE installation_surveys_workhours TO grid;


--
-- Name: installations_floorplan; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_floorplan FROM PUBLIC;
REVOKE ALL ON TABLE installations_floorplan FROM portal;
GRANT ALL ON TABLE installations_floorplan TO portal;
GRANT ALL ON TABLE installations_floorplan TO grid;


--
-- Name: installations_gatewayinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_gatewayinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_gatewayinstallation FROM portal;
GRANT ALL ON TABLE installations_gatewayinstallation TO portal;
GRANT ALL ON TABLE installations_gatewayinstallation TO grid;


--
-- Name: installations_installationphoto; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_installationphoto FROM PUBLIC;
REVOKE ALL ON TABLE installations_installationphoto FROM portal;
GRANT ALL ON TABLE installations_installationphoto TO portal;
GRANT ALL ON TABLE installations_installationphoto TO grid;


--
-- Name: installations_meterinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_meterinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_meterinstallation FROM portal;
GRANT ALL ON TABLE installations_meterinstallation TO portal;
GRANT ALL ON TABLE installations_meterinstallation TO grid;


--
-- Name: installations_meterinstallation_input_satisfies_dataneeds; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_meterinstallation_input_satisfies_dataneeds FROM PUBLIC;
REVOKE ALL ON TABLE installations_meterinstallation_input_satisfies_dataneeds FROM portal;
GRANT ALL ON TABLE installations_meterinstallation_input_satisfies_dataneeds TO portal;
GRANT ALL ON TABLE installations_meterinstallation_input_satisfies_dataneeds TO grid;


--
-- Name: installations_productinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_productinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_productinstallation FROM portal;
GRANT ALL ON TABLE installations_productinstallation TO portal;
GRANT ALL ON TABLE installations_productinstallation TO grid;


--
-- Name: installations_pulseemitterinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_pulseemitterinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_pulseemitterinstallation FROM portal;
GRANT ALL ON TABLE installations_pulseemitterinstallation TO portal;
GRANT ALL ON TABLE installations_pulseemitterinstallation TO grid;


--
-- Name: installations_pulseemitterinstallation_input_satisfies_data7b36; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 FROM PUBLIC;
REVOKE ALL ON TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 FROM portal;
GRANT ALL ON TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 TO portal;
GRANT ALL ON TABLE installations_pulseemitterinstallation_input_satisfies_data7b36 TO grid;


--
-- Name: installations_repeaterinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_repeaterinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_repeaterinstallation FROM portal;
GRANT ALL ON TABLE installations_repeaterinstallation TO portal;
GRANT ALL ON TABLE installations_repeaterinstallation TO grid;


--
-- Name: installations_tripleinputmeterinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_tripleinputmeterinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_tripleinputmeterinstallation FROM portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation TO portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation TO grid;


--
-- Name: installations_tripleinputmeterinstallation_input1_satisfies0539; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 FROM PUBLIC;
REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 FROM portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 TO portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input1_satisfies0539 TO grid;


--
-- Name: installations_tripleinputmeterinstallation_input2_satisfies1aad; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad FROM PUBLIC;
REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad FROM portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad TO portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input2_satisfies1aad TO grid;


--
-- Name: installations_tripleinputmeterinstallation_input3_satisfies9eaa; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa FROM PUBLIC;
REVOKE ALL ON TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa FROM portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa TO portal;
GRANT ALL ON TABLE installations_tripleinputmeterinstallation_input3_satisfies9eaa TO grid;


--
-- Name: installations_triplepulsecollectorinstallation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE installations_triplepulsecollectorinstallation FROM PUBLIC;
REVOKE ALL ON TABLE installations_triplepulsecollectorinstallation FROM portal;
GRANT ALL ON TABLE installations_triplepulsecollectorinstallation TO portal;
GRANT ALL ON TABLE installations_triplepulsecollectorinstallation TO grid;


--
-- Name: manage_collections_collectionitem; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manage_collections_collectionitem FROM PUBLIC;
REVOKE ALL ON TABLE manage_collections_collectionitem FROM portal;
GRANT ALL ON TABLE manage_collections_collectionitem TO portal;
GRANT ALL ON TABLE manage_collections_collectionitem TO grid;


--
-- Name: manage_collections_floorplan; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manage_collections_floorplan FROM PUBLIC;
REVOKE ALL ON TABLE manage_collections_floorplan FROM portal;
GRANT ALL ON TABLE manage_collections_floorplan TO portal;
GRANT ALL ON TABLE manage_collections_floorplan TO grid;


--
-- Name: manage_collections_infoitem; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manage_collections_infoitem FROM PUBLIC;
REVOKE ALL ON TABLE manage_collections_infoitem FROM portal;
GRANT ALL ON TABLE manage_collections_infoitem TO portal;
GRANT ALL ON TABLE manage_collections_infoitem TO grid;


--
-- Name: manage_collections_item; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manage_collections_item FROM PUBLIC;
REVOKE ALL ON TABLE manage_collections_item FROM portal;
GRANT ALL ON TABLE manage_collections_item TO portal;
GRANT ALL ON TABLE manage_collections_item TO grid;


--
-- Name: manual_reporting_manuallyreportedconsumption; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manual_reporting_manuallyreportedconsumption FROM PUBLIC;
REVOKE ALL ON TABLE manual_reporting_manuallyreportedconsumption FROM portal;
GRANT ALL ON TABLE manual_reporting_manuallyreportedconsumption TO portal;
GRANT ALL ON TABLE manual_reporting_manuallyreportedconsumption TO grid;


--
-- Name: manual_reporting_manuallyreportedproduction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE manual_reporting_manuallyreportedproduction FROM PUBLIC;
REVOKE ALL ON TABLE manual_reporting_manuallyreportedproduction FROM portal;
GRANT ALL ON TABLE manual_reporting_manuallyreportedproduction TO portal;
GRANT ALL ON TABLE manual_reporting_manuallyreportedproduction TO grid;


--
-- Name: measurementpoints_chain; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_chain FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_chain FROM portal;
GRANT ALL ON TABLE measurementpoints_chain TO portal;
GRANT ALL ON TABLE measurementpoints_chain TO grid;


--
-- Name: measurementpoints_chainlink; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_chainlink FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_chainlink FROM portal;
GRANT ALL ON TABLE measurementpoints_chainlink TO portal;
GRANT ALL ON TABLE measurementpoints_chainlink TO grid;


--
-- Name: measurementpoints_dataseries; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_dataseries FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_dataseries FROM portal;
GRANT ALL ON TABLE measurementpoints_dataseries TO portal;
GRANT ALL ON TABLE measurementpoints_dataseries TO grid;


--
-- Name: measurementpoints_degreedaycorrection; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_degreedaycorrection FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_degreedaycorrection FROM portal;
GRANT ALL ON TABLE measurementpoints_degreedaycorrection TO portal;
GRANT ALL ON TABLE measurementpoints_degreedaycorrection TO grid;


--
-- Name: measurementpoints_graph; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_graph FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_graph FROM portal;
GRANT ALL ON TABLE measurementpoints_graph TO portal;
GRANT ALL ON TABLE measurementpoints_graph TO grid;


--
-- Name: measurementpoints_heatingdegreedays; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_heatingdegreedays FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_heatingdegreedays FROM portal;
GRANT ALL ON TABLE measurementpoints_heatingdegreedays TO portal;
GRANT ALL ON TABLE measurementpoints_heatingdegreedays TO grid;


--
-- Name: measurementpoints_indexcalculation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_indexcalculation FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_indexcalculation FROM portal;
GRANT ALL ON TABLE measurementpoints_indexcalculation TO portal;
GRANT ALL ON TABLE measurementpoints_indexcalculation TO grid;


--
-- Name: measurementpoints_link; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_link FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_link FROM portal;
GRANT ALL ON TABLE measurementpoints_link TO portal;
GRANT ALL ON TABLE measurementpoints_link TO grid;


--
-- Name: measurementpoints_meantemperaturechange; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_meantemperaturechange FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_meantemperaturechange FROM portal;
GRANT ALL ON TABLE measurementpoints_meantemperaturechange TO portal;
GRANT ALL ON TABLE measurementpoints_meantemperaturechange TO grid;


--
-- Name: measurementpoints_multiplication; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_multiplication FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_multiplication FROM portal;
GRANT ALL ON TABLE measurementpoints_multiplication TO portal;
GRANT ALL ON TABLE measurementpoints_multiplication TO grid;


--
-- Name: measurementpoints_piecewiseconstantintegral; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_piecewiseconstantintegral FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_piecewiseconstantintegral FROM portal;
GRANT ALL ON TABLE measurementpoints_piecewiseconstantintegral TO portal;
GRANT ALL ON TABLE measurementpoints_piecewiseconstantintegral TO grid;


--
-- Name: measurementpoints_rateconversion; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_rateconversion FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_rateconversion FROM portal;
GRANT ALL ON TABLE measurementpoints_rateconversion TO portal;
GRANT ALL ON TABLE measurementpoints_rateconversion TO grid;


--
-- Name: measurementpoints_simplelinearregression; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_simplelinearregression FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_simplelinearregression FROM portal;
GRANT ALL ON TABLE measurementpoints_simplelinearregression TO portal;
GRANT ALL ON TABLE measurementpoints_simplelinearregression TO grid;


--
-- Name: measurementpoints_storeddata; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_storeddata FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_storeddata FROM portal;
GRANT ALL ON TABLE measurementpoints_storeddata TO portal;
GRANT ALL ON TABLE measurementpoints_storeddata TO grid;


--
-- Name: measurementpoints_summation; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_summation FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_summation FROM portal;
GRANT ALL ON TABLE measurementpoints_summation TO portal;
GRANT ALL ON TABLE measurementpoints_summation TO grid;


--
-- Name: measurementpoints_summationterm; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_summationterm FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_summationterm FROM portal;
GRANT ALL ON TABLE measurementpoints_summationterm TO portal;
GRANT ALL ON TABLE measurementpoints_summationterm TO grid;


--
-- Name: measurementpoints_utilization; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE measurementpoints_utilization FROM PUBLIC;
REVOKE ALL ON TABLE measurementpoints_utilization FROM portal;
GRANT ALL ON TABLE measurementpoints_utilization TO portal;
GRANT ALL ON TABLE measurementpoints_utilization TO grid;


--
-- Name: opportunities_opportunity; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE opportunities_opportunity FROM PUBLIC;
REVOKE ALL ON TABLE opportunities_opportunity FROM portal;
GRANT ALL ON TABLE opportunities_opportunity TO portal;
GRANT ALL ON TABLE opportunities_opportunity TO grid;


--
-- Name: price_relay_site_pricerelayproject; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE price_relay_site_pricerelayproject FROM PUBLIC;
REVOKE ALL ON TABLE price_relay_site_pricerelayproject FROM portal;
GRANT ALL ON TABLE price_relay_site_pricerelayproject TO portal;
GRANT ALL ON TABLE price_relay_site_pricerelayproject TO grid;


--
-- Name: processperiods_processperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiod FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiod FROM portal;
GRANT ALL ON TABLE processperiods_processperiod TO portal;
GRANT ALL ON TABLE processperiods_processperiod TO grid;


--
-- Name: processperiods_processperiod_accepted_opportunities; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiod_accepted_opportunities FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiod_accepted_opportunities FROM portal;
GRANT ALL ON TABLE processperiods_processperiod_accepted_opportunities TO portal;
GRANT ALL ON TABLE processperiods_processperiod_accepted_opportunities TO grid;


--
-- Name: processperiods_processperiod_enpis; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiod_enpis FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiod_enpis FROM portal;
GRANT ALL ON TABLE processperiods_processperiod_enpis TO portal;
GRANT ALL ON TABLE processperiods_processperiod_enpis TO grid;


--
-- Name: processperiods_processperiod_rejected_opportunities; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiod_rejected_opportunities FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiod_rejected_opportunities FROM portal;
GRANT ALL ON TABLE processperiods_processperiod_rejected_opportunities TO portal;
GRANT ALL ON TABLE processperiods_processperiod_rejected_opportunities TO grid;


--
-- Name: processperiods_processperiod_significant_energyuses; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiod_significant_energyuses FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiod_significant_energyuses FROM portal;
GRANT ALL ON TABLE processperiods_processperiod_significant_energyuses TO portal;
GRANT ALL ON TABLE processperiods_processperiod_significant_energyuses TO grid;


--
-- Name: processperiods_processperiodgoal; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE processperiods_processperiodgoal FROM PUBLIC;
REVOKE ALL ON TABLE processperiods_processperiodgoal FROM portal;
GRANT ALL ON TABLE processperiods_processperiodgoal TO portal;
GRANT ALL ON TABLE processperiods_processperiodgoal TO grid;


--
-- Name: productions_nonpulseperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_nonpulseperiod FROM PUBLIC;
REVOKE ALL ON TABLE productions_nonpulseperiod FROM portal;
GRANT ALL ON TABLE productions_nonpulseperiod TO portal;
GRANT ALL ON TABLE productions_nonpulseperiod TO grid;


--
-- Name: productions_offlinetolerance; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_offlinetolerance FROM PUBLIC;
REVOKE ALL ON TABLE productions_offlinetolerance FROM portal;
GRANT ALL ON TABLE productions_offlinetolerance TO portal;
GRANT ALL ON TABLE productions_offlinetolerance TO grid;


--
-- Name: productions_period; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_period FROM PUBLIC;
REVOKE ALL ON TABLE productions_period FROM portal;
GRANT ALL ON TABLE productions_period TO portal;
GRANT ALL ON TABLE productions_period TO grid;


--
-- Name: productions_production; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_production FROM PUBLIC;
REVOKE ALL ON TABLE productions_production FROM portal;
GRANT ALL ON TABLE productions_production TO portal;
GRANT ALL ON TABLE productions_production TO grid;


--
-- Name: productions_productiongroup; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_productiongroup FROM PUBLIC;
REVOKE ALL ON TABLE productions_productiongroup FROM portal;
GRANT ALL ON TABLE productions_productiongroup TO portal;
GRANT ALL ON TABLE productions_productiongroup TO grid;


--
-- Name: productions_productiongroup_productions; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_productiongroup_productions FROM PUBLIC;
REVOKE ALL ON TABLE productions_productiongroup_productions FROM portal;
GRANT ALL ON TABLE productions_productiongroup_productions TO portal;
GRANT ALL ON TABLE productions_productiongroup_productions TO grid;


--
-- Name: productions_pulseperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_pulseperiod FROM PUBLIC;
REVOKE ALL ON TABLE productions_pulseperiod FROM portal;
GRANT ALL ON TABLE productions_pulseperiod TO portal;
GRANT ALL ON TABLE productions_pulseperiod TO grid;


--
-- Name: productions_singlevalueperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE productions_singlevalueperiod FROM PUBLIC;
REVOKE ALL ON TABLE productions_singlevalueperiod FROM portal;
GRANT ALL ON TABLE productions_singlevalueperiod TO portal;
GRANT ALL ON TABLE productions_singlevalueperiod TO grid;


--
-- Name: products_historicalproduct; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE products_historicalproduct FROM PUBLIC;
REVOKE ALL ON TABLE products_historicalproduct FROM portal;
GRANT ALL ON TABLE products_historicalproduct TO portal;
GRANT ALL ON TABLE products_historicalproduct TO grid;


--
-- Name: products_product; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE products_product FROM PUBLIC;
REVOKE ALL ON TABLE products_product FROM portal;
GRANT ALL ON TABLE products_product TO portal;
GRANT ALL ON TABLE products_product TO grid;


--
-- Name: products_productcategory; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE products_productcategory FROM PUBLIC;
REVOKE ALL ON TABLE products_productcategory FROM portal;
GRANT ALL ON TABLE products_productcategory TO portal;
GRANT ALL ON TABLE products_productcategory TO grid;


--
-- Name: projects_additionalsaving; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE projects_additionalsaving FROM PUBLIC;
REVOKE ALL ON TABLE projects_additionalsaving FROM portal;
GRANT ALL ON TABLE projects_additionalsaving TO portal;
GRANT ALL ON TABLE projects_additionalsaving TO grid;


--
-- Name: projects_benchmarkproject; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE projects_benchmarkproject FROM PUBLIC;
REVOKE ALL ON TABLE projects_benchmarkproject FROM portal;
GRANT ALL ON TABLE projects_benchmarkproject TO portal;
GRANT ALL ON TABLE projects_benchmarkproject TO grid;


--
-- Name: projects_benchmarkproject_baseline_measurement_points; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE projects_benchmarkproject_baseline_measurement_points FROM PUBLIC;
REVOKE ALL ON TABLE projects_benchmarkproject_baseline_measurement_points FROM portal;
GRANT ALL ON TABLE projects_benchmarkproject_baseline_measurement_points TO portal;
GRANT ALL ON TABLE projects_benchmarkproject_baseline_measurement_points TO grid;


--
-- Name: projects_benchmarkproject_result_measurement_points; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE projects_benchmarkproject_result_measurement_points FROM PUBLIC;
REVOKE ALL ON TABLE projects_benchmarkproject_result_measurement_points FROM portal;
GRANT ALL ON TABLE projects_benchmarkproject_result_measurement_points TO portal;
GRANT ALL ON TABLE projects_benchmarkproject_result_measurement_points TO grid;


--
-- Name: projects_cost; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE projects_cost FROM PUBLIC;
REVOKE ALL ON TABLE projects_cost FROM portal;
GRANT ALL ON TABLE projects_cost TO portal;
GRANT ALL ON TABLE projects_cost TO grid;


--
-- Name: provider_datasources_providerdatasource; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE provider_datasources_providerdatasource FROM PUBLIC;
REVOKE ALL ON TABLE provider_datasources_providerdatasource FROM portal;
GRANT ALL ON TABLE provider_datasources_providerdatasource TO portal;
GRANT ALL ON TABLE provider_datasources_providerdatasource TO grid;


--
-- Name: providers_provider; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE providers_provider FROM PUBLIC;
REVOKE ALL ON TABLE providers_provider FROM portal;
GRANT ALL ON TABLE providers_provider TO portal;
GRANT ALL ON TABLE providers_provider TO grid;


--
-- Name: reports_report; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE reports_report FROM PUBLIC;
REVOKE ALL ON TABLE reports_report FROM portal;
GRANT ALL ON TABLE reports_report TO portal;
GRANT ALL ON TABLE reports_report TO grid;


--
-- Name: rules_dateexception; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_dateexception FROM PUBLIC;
REVOKE ALL ON TABLE rules_dateexception FROM portal;
GRANT ALL ON TABLE rules_dateexception TO portal;
GRANT ALL ON TABLE rules_dateexception TO grid;


--
-- Name: rules_emailaction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_emailaction FROM PUBLIC;
REVOKE ALL ON TABLE rules_emailaction FROM portal;
GRANT ALL ON TABLE rules_emailaction TO portal;
GRANT ALL ON TABLE rules_emailaction TO grid;


--
-- Name: rules_indexinvariant; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_indexinvariant FROM PUBLIC;
REVOKE ALL ON TABLE rules_indexinvariant FROM portal;
GRANT ALL ON TABLE rules_indexinvariant TO portal;
GRANT ALL ON TABLE rules_indexinvariant TO grid;


--
-- Name: rules_inputinvariant; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_inputinvariant FROM PUBLIC;
REVOKE ALL ON TABLE rules_inputinvariant FROM portal;
GRANT ALL ON TABLE rules_inputinvariant TO portal;
GRANT ALL ON TABLE rules_inputinvariant TO grid;


--
-- Name: rules_minimizerule; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_minimizerule FROM PUBLIC;
REVOKE ALL ON TABLE rules_minimizerule FROM portal;
GRANT ALL ON TABLE rules_minimizerule TO portal;
GRANT ALL ON TABLE rules_minimizerule TO grid;


--
-- Name: rules_phoneaction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_phoneaction FROM PUBLIC;
REVOKE ALL ON TABLE rules_phoneaction FROM portal;
GRANT ALL ON TABLE rules_phoneaction TO portal;
GRANT ALL ON TABLE rules_phoneaction TO grid;


--
-- Name: rules_relayaction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_relayaction FROM PUBLIC;
REVOKE ALL ON TABLE rules_relayaction FROM portal;
GRANT ALL ON TABLE rules_relayaction TO portal;
GRANT ALL ON TABLE rules_relayaction TO grid;


--
-- Name: rules_triggeredrule; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_triggeredrule FROM PUBLIC;
REVOKE ALL ON TABLE rules_triggeredrule FROM portal;
GRANT ALL ON TABLE rules_triggeredrule TO portal;
GRANT ALL ON TABLE rules_triggeredrule TO grid;


--
-- Name: rules_userrule; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE rules_userrule FROM PUBLIC;
REVOKE ALL ON TABLE rules_userrule FROM portal;
GRANT ALL ON TABLE rules_userrule TO portal;
GRANT ALL ON TABLE rules_userrule TO grid;


--
-- Name: salesopportunities_activityentry; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_activityentry FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_activityentry FROM portal;
GRANT ALL ON TABLE salesopportunities_activityentry TO portal;
GRANT ALL ON TABLE salesopportunities_activityentry TO grid;


--
-- Name: salesopportunities_industrytype; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_industrytype FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_industrytype FROM portal;
GRANT ALL ON TABLE salesopportunities_industrytype TO portal;
GRANT ALL ON TABLE salesopportunities_industrytype TO grid;


--
-- Name: salesopportunities_industrytypesavings; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_industrytypesavings FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_industrytypesavings FROM portal;
GRANT ALL ON TABLE salesopportunities_industrytypesavings TO portal;
GRANT ALL ON TABLE salesopportunities_industrytypesavings TO grid;


--
-- Name: salesopportunities_industrytypeusedistribution; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_industrytypeusedistribution FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_industrytypeusedistribution FROM portal;
GRANT ALL ON TABLE salesopportunities_industrytypeusedistribution TO portal;
GRANT ALL ON TABLE salesopportunities_industrytypeusedistribution TO grid;


--
-- Name: salesopportunities_salesopportunity; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_salesopportunity FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_salesopportunity FROM portal;
GRANT ALL ON TABLE salesopportunities_salesopportunity TO portal;
GRANT ALL ON TABLE salesopportunities_salesopportunity TO grid;


--
-- Name: salesopportunities_salesopportunity_floorplans; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_salesopportunity_floorplans FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_salesopportunity_floorplans FROM portal;
GRANT ALL ON TABLE salesopportunities_salesopportunity_floorplans TO portal;
GRANT ALL ON TABLE salesopportunities_salesopportunity_floorplans TO grid;


--
-- Name: salesopportunities_salesopportunitysavings; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_salesopportunitysavings FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_salesopportunitysavings FROM portal;
GRANT ALL ON TABLE salesopportunities_salesopportunitysavings TO portal;
GRANT ALL ON TABLE salesopportunities_salesopportunitysavings TO grid;


--
-- Name: salesopportunities_salesopportunityusedistribution; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_salesopportunityusedistribution FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_salesopportunityusedistribution FROM portal;
GRANT ALL ON TABLE salesopportunities_salesopportunityusedistribution TO portal;
GRANT ALL ON TABLE salesopportunities_salesopportunityusedistribution TO grid;


--
-- Name: salesopportunities_surveyinstruction; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_surveyinstruction FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_surveyinstruction FROM portal;
GRANT ALL ON TABLE salesopportunities_surveyinstruction TO portal;
GRANT ALL ON TABLE salesopportunities_surveyinstruction TO grid;


--
-- Name: salesopportunities_task; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE salesopportunities_task FROM PUBLIC;
REVOKE ALL ON TABLE salesopportunities_task FROM portal;
GRANT ALL ON TABLE salesopportunities_task TO portal;
GRANT ALL ON TABLE salesopportunities_task TO grid;


--
-- Name: south_migrationhistory; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE south_migrationhistory FROM PUBLIC;
REVOKE ALL ON TABLE south_migrationhistory FROM portal;
GRANT ALL ON TABLE south_migrationhistory TO portal;
GRANT ALL ON TABLE south_migrationhistory TO grid;


--
-- Name: suppliers_supplier; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE suppliers_supplier FROM PUBLIC;
REVOKE ALL ON TABLE suppliers_supplier FROM portal;
GRANT ALL ON TABLE suppliers_supplier TO portal;
GRANT ALL ON TABLE suppliers_supplier TO grid;


--
-- Name: system_health_site_healthreport; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE system_health_site_healthreport FROM PUBLIC;
REVOKE ALL ON TABLE system_health_site_healthreport FROM portal;
GRANT ALL ON TABLE system_health_site_healthreport TO portal;
GRANT ALL ON TABLE system_health_site_healthreport TO grid;


--
-- Name: tariffs_energytariff; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_energytariff FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_energytariff FROM portal;
GRANT ALL ON TABLE tariffs_energytariff TO portal;
GRANT ALL ON TABLE tariffs_energytariff TO grid;


--
-- Name: tariffs_fixedpriceperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_fixedpriceperiod FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_fixedpriceperiod FROM portal;
GRANT ALL ON TABLE tariffs_fixedpriceperiod TO portal;
GRANT ALL ON TABLE tariffs_fixedpriceperiod TO grid;


--
-- Name: tariffs_period; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_period FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_period FROM portal;
GRANT ALL ON TABLE tariffs_period TO portal;
GRANT ALL ON TABLE tariffs_period TO grid;


--
-- Name: tariffs_spotpriceperiod; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_spotpriceperiod FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_spotpriceperiod FROM portal;
GRANT ALL ON TABLE tariffs_spotpriceperiod TO portal;
GRANT ALL ON TABLE tariffs_spotpriceperiod TO grid;


--
-- Name: tariffs_tariff; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_tariff FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_tariff FROM portal;
GRANT ALL ON TABLE tariffs_tariff TO portal;
GRANT ALL ON TABLE tariffs_tariff TO grid;


--
-- Name: tariffs_volumetariff; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE tariffs_volumetariff FROM PUBLIC;
REVOKE ALL ON TABLE tariffs_volumetariff FROM portal;
GRANT ALL ON TABLE tariffs_volumetariff TO portal;
GRANT ALL ON TABLE tariffs_volumetariff TO grid;


--
-- Name: token_auth_tokendata; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE token_auth_tokendata FROM PUBLIC;
REVOKE ALL ON TABLE token_auth_tokendata FROM portal;
GRANT ALL ON TABLE token_auth_tokendata TO portal;
GRANT ALL ON TABLE token_auth_tokendata TO grid;


--
-- Name: users_user; Type: ACL; Schema: public; Owner: portal
--

REVOKE ALL ON TABLE users_user FROM PUBLIC;
REVOKE ALL ON TABLE users_user FROM portal;
GRANT ALL ON TABLE users_user TO portal;
GRANT ALL ON TABLE users_user TO grid;


--
-- PostgreSQL database dump complete
--

