--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: account_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE account_profile (
    id integer NOT NULL,
    birthdate timestamp with time zone,
    num integer,
    user_id integer NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    nickname character varying(30),
    picture character varying(100)
);


ALTER TABLE account_profile OWNER TO postgres;

--
-- Name: account_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_profile_id_seq OWNER TO postgres;

--
-- Name: account_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_profile_id_seq OWNED BY account_profile.id;


--
-- Name: account_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE account_relation (
    id integer NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    status character varying(1) NOT NULL
);


ALTER TABLE account_relation OWNER TO postgres;

--
-- Name: account_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_relation_id_seq OWNER TO postgres;

--
-- Name: account_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_relation_id_seq OWNED BY account_relation.id;


--
-- Name: accounts_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accounts_profile (
    id integer NOT NULL,
    birthdate timestamp with time zone,
    picture character varying(100),
    num integer,
    created_at timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE accounts_profile OWNER TO postgres;

--
-- Name: accounts_profile_friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accounts_profile_friends (
    id integer NOT NULL,
    from_profile_id integer NOT NULL,
    to_profile_id integer NOT NULL
);


ALTER TABLE accounts_profile_friends OWNER TO postgres;

--
-- Name: accounts_profile_friends_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_profile_friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_profile_friends_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_profile_friends_id_seq OWNED BY accounts_profile_friends.id;


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_profile_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_profile_id_seq OWNED BY accounts_profile.id;


--
-- Name: activity_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE activity_notification (
    id integer NOT NULL,
    is_read boolean NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    from_user_id integer NOT NULL,
    post_id integer,
    to_user_id integer NOT NULL,
    theme_id integer,
    notification_type character varying(2) NOT NULL
);


ALTER TABLE activity_notification OWNER TO postgres;

--
-- Name: activity_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activity_notification_id_seq OWNER TO postgres;

--
-- Name: activity_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_notification_id_seq OWNED BY activity_notification.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(150) NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_bucket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_bucket (
    id integer NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE blog_bucket OWNER TO postgres;

--
-- Name: blog_bucket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_bucket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_bucket_id_seq OWNER TO postgres;

--
-- Name: blog_bucket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_bucket_id_seq OWNED BY blog_bucket.id;


--
-- Name: blog_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_content (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    address character varying(100),
    lat real NOT NULL,
    lng real NOT NULL,
    taken_dt timestamp with time zone,
    create_dt timestamp with time zone NOT NULL
);


ALTER TABLE blog_content OWNER TO postgres;

--
-- Name: blog_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_content_id_seq OWNER TO postgres;

--
-- Name: blog_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_content_id_seq OWNED BY blog_content.id;


--
-- Name: blog_content_tag_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_content_tag_set (
    id integer NOT NULL,
    content_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE blog_content_tag_set OWNER TO postgres;

--
-- Name: blog_content_tag_set_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_content_tag_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_content_tag_set_id_seq OWNER TO postgres;

--
-- Name: blog_content_tag_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_content_tag_set_id_seq OWNED BY blog_content_tag_set.id;


--
-- Name: blog_invitee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_invitee (
    id integer NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    theme_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE blog_invitee OWNER TO postgres;

--
-- Name: blog_invitee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_invitee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_invitee_id_seq OWNER TO postgres;

--
-- Name: blog_invitee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_invitee_id_seq OWNED BY blog_invitee.id;


--
-- Name: blog_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_like (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    create_dt timestamp with time zone NOT NULL
);


ALTER TABLE blog_like OWNER TO postgres;

--
-- Name: blog_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_like_id_seq OWNER TO postgres;

--
-- Name: blog_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_like_id_seq OWNED BY blog_like.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    text text,
    address character varying(100),
    lat real,
    lng real,
    create_dt timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    is_public boolean NOT NULL,
    theme_id integer
);


ALTER TABLE blog_post OWNER TO postgres;

--
-- Name: blog_post_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_post_contents (
    id integer NOT NULL,
    post_id integer NOT NULL,
    content_id integer NOT NULL
);


ALTER TABLE blog_post_contents OWNER TO postgres;

--
-- Name: blog_post_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_post_contents_id_seq OWNER TO postgres;

--
-- Name: blog_post_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_contents_id_seq OWNED BY blog_post_contents.id;


--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_post_id_seq OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: blog_post_tag_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_post_tag_set (
    id integer NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE blog_post_tag_set OWNER TO postgres;

--
-- Name: blog_post_tag_set_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_tag_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_post_tag_set_id_seq OWNER TO postgres;

--
-- Name: blog_post_tag_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_tag_set_id_seq OWNED BY blog_post_tag_set.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_tag (
    id integer NOT NULL,
    tag character varying(50) NOT NULL
);


ALTER TABLE blog_tag OWNER TO postgres;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_tag_id_seq OWNER TO postgres;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_tag_id_seq OWNED BY blog_tag.id;


--
-- Name: blog_theme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_theme (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    public boolean NOT NULL
);


ALTER TABLE blog_theme OWNER TO postgres;

--
-- Name: blog_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_theme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_theme_id_seq OWNER TO postgres;

--
-- Name: blog_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_theme_id_seq OWNED BY blog_theme.id;


--
-- Name: comment_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment_comment (
    id integer NOT NULL,
    comment character varying(256) NOT NULL,
    create_dt timestamp with time zone NOT NULL,
    create_user_id integer,
    post_id integer
);


ALTER TABLE comment_comment OWNER TO postgres;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comment_comment_id_seq OWNER TO postgres;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_comment_id_seq OWNED BY comment_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    action_time timestamp with time zone NOT NULL
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: your_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE your_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE your_seq OWNER TO postgres;

--
-- Name: account_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_profile ALTER COLUMN id SET DEFAULT nextval('account_profile_id_seq'::regclass);


--
-- Name: account_relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_relation ALTER COLUMN id SET DEFAULT nextval('account_relation_id_seq'::regclass);


--
-- Name: accounts_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile ALTER COLUMN id SET DEFAULT nextval('accounts_profile_id_seq'::regclass);


--
-- Name: accounts_profile_friends id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile_friends ALTER COLUMN id SET DEFAULT nextval('accounts_profile_friends_id_seq'::regclass);


--
-- Name: activity_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification ALTER COLUMN id SET DEFAULT nextval('activity_notification_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_bucket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bucket ALTER COLUMN id SET DEFAULT nextval('blog_bucket_id_seq'::regclass);


--
-- Name: blog_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content ALTER COLUMN id SET DEFAULT nextval('blog_content_id_seq'::regclass);


--
-- Name: blog_content_tag_set id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content_tag_set ALTER COLUMN id SET DEFAULT nextval('blog_content_tag_set_id_seq'::regclass);


--
-- Name: blog_invitee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_invitee ALTER COLUMN id SET DEFAULT nextval('blog_invitee_id_seq'::regclass);


--
-- Name: blog_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_like ALTER COLUMN id SET DEFAULT nextval('blog_like_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: blog_post_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_contents ALTER COLUMN id SET DEFAULT nextval('blog_post_contents_id_seq'::regclass);


--
-- Name: blog_post_tag_set id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tag_set ALTER COLUMN id SET DEFAULT nextval('blog_post_tag_set_id_seq'::regclass);


--
-- Name: blog_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_tag ALTER COLUMN id SET DEFAULT nextval('blog_tag_id_seq'::regclass);


--
-- Name: blog_theme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_theme ALTER COLUMN id SET DEFAULT nextval('blog_theme_id_seq'::regclass);


--
-- Name: comment_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment ALTER COLUMN id SET DEFAULT nextval('comment_comment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: account_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_profile (id, birthdate, num, user_id, create_dt, nickname, picture) FROM stdin;
1	\N	\N	4	2017-12-22 09:33:53.837887+08	happyhao	
4	\N	\N	2	2017-12-22 09:33:53.837887+08	xmlyoon	person_profile/2017/12/미데스계곡-4.jpg
1005	\N	\N	1005	2017-12-29 17:06:03.383629+08	AAA	
1006	\N	\N	1006	2017-12-29 17:15:10.876823+08	CCC	
1007	\N	\N	1007	2017-12-29 17:20:55.901202+08	PPP	
1008	\N	\N	1008	2018-01-19 10:21:52.5668+08	김홍렬	person_profile/2018/01/aa.png
3	\N	\N	3	2017-12-22 09:33:53.837887+08	胡倩倩	person_profile/2017/12/소스_F3smlZC.jpg
2	\N	\N	1	2017-12-22 09:33:53.837887+08	Namju	person_profile/2017/12/미데스계곡-3_DGA8s9G.jpg
1009	\N	\N	1009	2018-01-19 12:25:51.39219+08	kk88	person_profile/2018/01/IMG_1310.JPG
\.


--
-- Data for Name: account_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_relation (id, create_dt, from_user_id, to_user_id, status) FROM stdin;
1	2017-12-22 09:35:43.24364+08	1	2	F
2	2017-12-22 09:35:51.500925+08	2	1	F
3	2017-12-22 09:36:00.856253+08	1	3	F
4	2017-12-22 09:49:49.073531+08	3	1	F
5	2017-12-22 10:11:51.246932+08	4	3	F
6	2017-12-22 10:11:58.247088+08	3	4	F
7	2017-12-22 10:13:15.397005+08	2	3	F
8	2017-12-22 10:13:24.035038+08	2	4	F
9	2017-12-22 10:14:22.759144+08	2	2	F
10	2017-12-22 12:25:31.72702+08	4	4	F
11	2017-12-23 01:06:28.90838+08	3	3	F
12	2017-12-26 01:18:07.538895+08	3	2	F
13	2017-12-26 11:21:22.69332+08	4	2	F
1004	2017-12-29 17:06:03.398823+08	1005	1005	F
1005	2017-12-29 17:15:10.891645+08	1006	1006	F
1006	2017-12-29 17:20:56.044938+08	1007	1007	F
1007	2018-01-19 10:21:52.709109+08	1008	1008	F
1008	2018-01-19 12:25:51.499452+08	1009	1009	F
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts_profile (id, birthdate, picture, num, created_at, user_id) FROM stdin;
1	\N		\N	2017-12-03 03:01:16.441416+08	3
2	\N		\N	2017-12-03 03:19:20.299216+08	1
3	\N		\N	2017-12-03 03:52:00.931109+08	2
\.


--
-- Data for Name: accounts_profile_friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts_profile_friends (id, from_profile_id, to_profile_id) FROM stdin;
1	2	1
2	1	2
3	3	1
4	3	2
5	1	3
6	2	3
\.


--
-- Data for Name: activity_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activity_notification (id, is_read, create_dt, from_user_id, post_id, to_user_id, theme_id, notification_type) FROM stdin;
1	t	2017-12-22 12:14:34.339924+08	1	55	2	\N	PC
2	t	2017-12-22 12:14:50.474133+08	1	55	2	\N	PC
3	f	2017-12-22 12:22:52.576629+08	1	49	3	\N	PL
4	f	2017-12-22 12:22:55.068851+08	1	49	3	\N	PC
8	t	2017-12-23 00:58:50.049444+08	2	283	3	\N	PL
9	t	2017-12-23 00:59:00.115043+08	2	283	3	\N	PC
10	t	2017-12-23 00:59:03.450609+08	2	283	3	\N	PC
11	t	2017-12-23 01:02:36.924657+08	2	318	3	\N	PL
12	t	2017-12-23 01:02:57.73365+08	2	318	3	\N	PC
13	t	2017-12-23 01:03:02.144512+08	2	318	3	\N	PC
14	t	2017-12-23 01:03:41.542529+08	2	317	3	\N	PL
15	t	2017-12-23 01:03:42.688899+08	2	317	3	\N	PC
16	t	2017-12-24 06:16:59.403688+08	1	427	3	\N	PC
17	t	2017-12-24 06:17:51.161124+08	1	427	3	\N	PL
18	t	2017-12-24 06:18:14.146134+08	2	427	3	\N	PL
19	t	2017-12-24 06:18:29.856639+08	2	427	3	\N	PC
20	t	2017-12-24 06:18:37.576103+08	2	427	3	\N	PC
22	t	2017-12-26 07:19:10.976873+08	2	435	3	\N	PL
23	t	2017-12-26 07:19:23.160458+08	2	435	3	\N	PC
24	t	2017-12-26 07:19:27.086406+08	2	435	3	\N	PC
25	t	2017-12-26 07:19:55.255064+08	2	427	3	\N	PL
26	t	2017-12-26 07:20:00.96711+08	2	427	3	\N	PC
27	t	2017-12-26 07:20:06.07002+08	2	426	3	\N	PL
28	t	2017-12-26 07:20:08.203844+08	2	426	3	\N	PC
29	t	2017-12-26 07:22:27.802262+08	3	443	1	\N	PL
30	t	2017-12-26 07:22:29.627801+08	3	443	1	\N	PC
1000	f	2017-12-29 16:43:55.930543+08	1	1018	3	\N	PL
1001	f	2017-12-29 16:44:04.642438+08	1	1018	3	\N	PC
1002	f	2017-12-29 16:44:11.441119+08	1	1002	3	\N	PL
1003	f	2017-12-29 16:44:22.154905+08	1	1002	3	\N	PC
1004	f	2017-12-29 16:44:24.218242+08	1	1002	3	\N	PC
1005	f	2017-12-29 16:44:29.28933+08	1	444	3	\N	PL
1006	f	2018-01-19 17:04:15.378924+08	3	1023	1	\N	PC
1007	f	2018-01-19 17:04:21.554072+08	3	1023	1	\N	PL
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, content_type_id, codename, name) FROM stdin;
1	1	add_logentry	Can add log entry
2	1	change_logentry	Can change log entry
3	1	delete_logentry	Can delete log entry
4	2	add_permission	Can add permission
5	2	change_permission	Can change permission
6	2	delete_permission	Can delete permission
7	3	add_group	Can add group
8	3	change_group	Can change group
9	3	delete_group	Can delete group
10	4	add_user	Can add user
11	4	change_user	Can change user
12	4	delete_user	Can delete user
13	5	add_contenttype	Can add content type
14	5	change_contenttype	Can change content type
15	5	delete_contenttype	Can delete content type
16	6	add_session	Can add session
17	6	change_session	Can change session
18	6	delete_session	Can delete session
19	7	add_content	Can add content
20	7	change_content	Can change content
21	7	delete_content	Can delete content
22	8	add_tag	Can add tag
23	8	change_tag	Can change tag
24	8	delete_tag	Can delete tag
25	9	add_theme	Can add theme
26	9	change_theme	Can change theme
27	9	delete_theme	Can delete theme
28	10	add_post	Can add post
29	10	change_post	Can change post
30	10	delete_post	Can delete post
31	11	add_profile	Can add profile
32	11	change_profile	Can change profile
33	11	delete_profile	Can delete profile
34	12	add_like	Can add like
35	12	change_like	Can change like
36	12	delete_like	Can delete like
37	13	add_comment	Can add comment
38	13	change_comment	Can change comment
39	13	delete_comment	Can delete comment
40	14	add_bucket	Can add bucket
41	14	change_bucket	Can change bucket
42	14	delete_bucket	Can delete bucket
43	15	add_profile	Can add profile
44	15	change_profile	Can change profile
45	15	delete_profile	Can delete profile
46	16	add_relation	Can add relation
47	16	change_relation	Can change relation
48	16	delete_relation	Can delete relation
49	17	add_notification	Can add Notification
50	17	change_notification	Can change Notification
51	17	delete_notification	Can delete Notification
52	18	add_invitee	Can add invitee
53	18	change_invitee	Can change invitee
54	18	delete_invitee	Can delete invitee
1000	1000	add_friendshiprequest	Can add Friendship Request
1001	1000	change_friendshiprequest	Can change Friendship Request
1002	1000	delete_friendshiprequest	Can delete Friendship Request
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username) FROM stdin;
2	pbkdf2_sha256$36000$AgFIqnQArXwg$OLAyuZVBwJgurBLhvgtoNn8enxupIqyxMEijc4z5e9A=	2017-12-26 06:20:30.199384+08	t	xmlyoon		xmlyoon@daum.net	t	t	2017-12-01 08:43:00+08	xmlyoon@daum.net
4	pbkdf2_sha256$36000$dwc5kM62KUPW$Qq0w8lRcGcXMH3+BariqJAad0i1DanpIiclVdRzJ92o=	2017-12-25 13:20:25.870131+08	t	JungHeui		happyhao@daum.net	t	t	2017-12-22 02:22:17+08	happyhao@daum.net
1005	qwer1234@@	\N	f	AAA		aaa@naver.com	f	t	2017-12-29 17:06:03.356643+08	aaa@naver.com
1006	qwer1234@@	\N	f	CCC		ccc@naver.com	f	t	2017-12-29 17:15:10.847382+08	ccc@naver.com
1007	pbkdf2_sha256$36000$Uap00dUPawuF$hc6bQnFj34IvukpGzhNyMI0VYnoZ8vYFhdM8ZT0PTVU=	2017-12-29 17:20:56.010272+08	f	PPP		ppp@naver.com	f	t	2017-12-29 17:20:55.840189+08	ppp@naver.com
1008	pbkdf2_sha256$36000$2xYdvbG8XS9E$OWqXgwCAFwiHrkS2mDUj/xkBKlGni0j+XESFcxuqXw4=	2018-01-19 10:21:52.6805+08	f	김홍렬		mypaul@naver.com	f	t	2018-01-19 10:21:52.494347+08	mypaul@naver.com
3	pbkdf2_sha256$36000$EV2WXPUKwcBf$r8EyArxlocxn3G4Wi2ekfZOpYMVCn4h3oj1uJ1XFaT4=	2018-01-20 20:31:45.782238+08	t	胡倩倩		njyoon@naver.com	t	t	2017-12-03 03:01:16+08	njyoon@naver.com
1	pbkdf2_sha256$36000$sN0jNGLphJp8$gSPK3hzcGMbEhBDSyGJUWqNH7dKZKmTo/0fjvyuDcXc=	2018-01-23 17:29:27.949127+08	t	鞠青青		happy@daum.net	t	t	2017-11-30 14:27:07+08	happy@daum.net
1009	pbkdf2_sha256$36000$lSQ24mA2csGn$E39ZF6/z3liaGxKyho9JcRSQ1MMGEeIQpmHuwNTODYc=	2018-01-25 09:38:41.992669+08	f	kk88		kk88@naver.com	f	t	2018-01-19 12:25:51.338711+08	kk88@naver.com
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_bucket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_bucket (id, create_dt, post_id, user_id) FROM stdin;
4	2017-12-21 08:47:57.045609+08	52	2
5	2017-12-21 08:50:10.637497+08	53	2
6	2017-12-22 08:25:16.854889+08	55	1
7	2017-12-22 08:25:26.942112+08	52	1
8	2017-12-22 08:26:10.282094+08	40	1
9	2017-12-22 10:46:44.572888+08	51	1
10	2017-12-22 10:46:49.471664+08	50	1
11	2017-12-22 11:25:16.19266+08	53	1
12	2017-12-22 12:22:55.064119+08	49	1
14	2017-12-23 00:59:03.444537+08	283	2
15	2017-12-23 01:03:02.138968+08	318	2
16	2017-12-23 01:03:42.684647+08	317	2
17	2017-12-23 01:40:23.540849+08	427	3
18	2017-12-23 12:20:40.627906+08	411	3
19	2017-12-23 12:20:55.907597+08	417	3
22	2017-12-26 07:19:27.08167+08	435	2
23	2017-12-26 07:20:00.962149+08	427	2
24	2017-12-26 07:20:08.199364+08	426	2
25	2017-12-26 07:22:08.152286+08	424	3
26	2017-12-26 07:22:29.621954+08	443	3
1000	2017-12-29 16:40:06.377317+08	1018	3
1001	2017-12-29 16:44:24.200111+08	1002	1
1002	2017-12-29 16:44:47.00081+08	443	1
1003	2018-01-10 09:14:01.76885+08	1020	1
1004	2018-01-24 14:21:19.875662+08	1027	1
\.


--
-- Data for Name: blog_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_content (id, file, address, lat, lng, taken_dt, create_dt) FROM stdin;
8	contents/2017/12/IMG_1309_LQ5OUjS.JPG	\N	36.0589561	120.331169	2017-12-01 16:48:40+08	2017-12-01 00:33:55.018461+08
9	contents/2017/12/IMG_1289.JPG	\N	36.058773	120.331207	2017-12-01 16:44:50+08	2017-12-01 00:53:30.229025+08
12	contents/2017/12/IMG_1330.JPG	\N	36.0735245	120.393967	2017-12-01 18:26:58+08	2017-12-01 08:40:20.786117+08
13	contents/2017/12/IMG_1289_dWnumGN.JPG	\N	36.058773	120.331207	2017-12-01 16:44:50+08	2017-12-01 08:41:32.342561+08
14	contents/2017/12/IMG_1330_O5sOyjh.JPG	\N	36.0735245	120.393967	2017-12-01 18:26:58+08	2017-12-01 08:42:34.528354+08
15	contents/2017/12/IMG_1309_pxMNbvT.JPG	\N	36.0589561	120.331169	2017-12-01 16:48:40+08	2017-12-01 08:44:39.508426+08
16	contents/2017/12/IMG_1309_E5pdqGL.JPG	\N	36.0589561	120.331169	2017-12-01 16:48:40+08	2017-12-01 08:46:21.819462+08
17	contents/2017/12/IMG_0570.JPG	\N	30.1347313	118.1586	2017-12-01 10:34:33+08	2017-12-01 23:21:05.500472+08
18	contents/2017/12/IMG_0581.JPG	\N	30.1379299	118.158852	2017-12-01 11:41:42+08	2017-12-01 23:21:12.871909+08
19	contents/2017/12/IMG_1026.JPG	\N	23.1190491	113.328392	2017-12-01 06:54:42+08	2017-12-01 23:29:06.398373+08
20	contents/2017/12/IMG_1027.JPG	\N	23.1190453	113.32843	2017-12-01 06:54:48+08	2017-12-01 23:29:21.113787+08
22	contents/2017/12/IMG_0642.JPG	\N	36.8088913	120.203392	2017-12-02 13:55:51+08	2017-12-02 00:42:45.382656+08
24	contents/2017/12/aa.jpg	\N	37.3656349	126.92292	2017-12-03 23:43:01+08	2017-12-03 14:50:28.857616+08
25	contents/2017/12/dong.JPG	\N	37.5710373	127.010071	2017-12-07 17:47:19+08	2017-12-07 09:00:51.650436+08
26	contents/2017/12/airport.jpg	\N	36.2689056	120.380463	2017-12-07 15:54:21+08	2017-12-07 09:01:19.265665+08
28	contents/2017/12/IMG_0033.JPG	\N	35.9526482	120.176529	2017-12-14 11:31:34+08	2017-12-14 11:43:27.456916+08
29	contents/2017/12/IMG_0084.JPG	\N	35.9519424	120.176132	2017-12-14 12:24:09+08	2017-12-14 11:43:40.624767+08
30	contents/2017/12/IMG_0124.JPG	\N	37.5668335	121.245499	2017-12-14 17:46:14+08	2017-12-14 11:43:54.816952+08
31	contents/2017/12/IMG_0304.JPG	\N	35.974926	120.171722	2017-12-14 19:58:46+08	2017-12-14 11:43:59.924554+08
33	contents/2017/12/IMG_0540.JPG	\N	30.1409359	118.152649	2017-12-14 09:13:22+08	2017-12-14 11:44:10.197825+08
34	contents/2017/12/IMG_0579.JPG	\N	30.1366425	118.158989	2017-12-14 11:32:40+08	2017-12-14 11:44:22.44986+08
35	contents/2017/12/IMG_0644.JPG	\N	36.8088646	120.203415	2017-12-14 13:56:04+08	2017-12-14 11:44:28.919944+08
36	contents/2017/12/IMG_0651.JPG	\N	36.8101997	120.204247	2017-12-14 14:03:19+08	2017-12-14 11:44:35.222411+08
37	contents/2017/12/IMG_0688.JPG	\N	35.9522781	120.180389	2017-12-14 12:59:58+08	2017-12-14 11:44:42.287579+08
38	contents/2017/12/IMG_0720.JPG	\N	35.9448013	120.183052	2017-12-14 18:01:35+08	2017-12-14 11:44:48.561121+08
39	contents/2017/12/IMG_0773.JPG	\N	32.8194466	-117.251266	2017-12-14 20:24:18+08	2017-12-14 11:44:53.323513+08
40	contents/2017/12/IMG_0815.JPG	\N	36.0661774	120.395576	2017-12-14 08:36:13+08	2017-12-14 11:44:58.394187+08
41	contents/2017/12/IMG_0994.JPG	\N	37.5614815	121.267921	2017-12-14 21:08:32+08	2017-12-14 11:45:05.153966+08
42	contents/2017/12/IMG_1001.JPG	\N	37.7379036	120.437088	2017-12-14 06:44:14+08	2017-12-14 11:45:11.85794+08
43	contents/2017/12/IMG_1028.JPG	\N	23.1190948	113.328476	2017-12-14 06:54:58+08	2017-12-14 11:45:30.158981+08
44	contents/2017/12/IMG_1252.JPG	\N	36.0159683	120.086792	2017-12-14 13:51:39+08	2017-12-14 11:45:41.536313+08
45	contents/2017/12/IMG_1254.JPG	\N	36.0206375	120.080849	2017-12-14 12:49:42+08	2017-12-14 11:45:56.675482+08
46	contents/2017/12/IMG_1310.JPG	\N	36.0589294	120.331139	2017-12-14 16:48:47+08	2017-12-14 11:46:09.756935+08
47	contents/2017/12/IMG_1366.JPG	\N	36.0741692	120.444801	2017-12-14 14:18:28+08	2017-12-14 11:46:50.423312+08
48	contents/2017/12/IMG_1427.JPG	\N	36.0524292	120.382507	2017-12-14 15:30:36+08	2017-12-14 11:47:19.923954+08
49	contents/2017/12/IMG_1444.JPG	\N	36.0000229	120.125519	2017-12-14 11:39:22+08	2017-12-14 11:47:30.067821+08
50	contents/2017/12/IMG_1463.JPG	\N	35.9739647	120.159523	2017-12-14 12:32:27+08	2017-12-14 11:47:50.934984+08
51	contents/2017/12/IMG_1489.JPG	\N	37.6128082	127.078217	2017-12-14 11:27:00+08	2017-12-14 11:47:56.440928+08
52	contents/2017/12/IMG_0720_fXywCU7.JPG	\N	35.9448013	120.183052	2017-12-21 18:01:35+08	2017-12-21 04:43:21.977224+08
53	contents/2017/12/IMG_0124_487g7aj.JPG	\N	37.5668335	121.245499	2017-12-21 17:46:14+08	2017-12-21 08:16:36.97575+08
54	contents/2017/12/IMG_1252_nZqzw4p.JPG	\N	36.0159683	120.086792	2017-12-21 13:51:39+08	2017-12-21 08:21:46.378092+08
55	contents/2017/12/aa_BaO1DYx.jpg	\N	37.3656349	126.92292	2017-12-22 23:43:01+08	2017-12-22 12:24:01.571478+08
56	contents/2017/12/aa_p5xwvJc.jpg	\N	37.3656349	126.92292	2017-12-22 23:43:01+08	2017-12-22 15:29:23.848213+08
57	contents/2017/12/aa.jpg	\N	37.3656349	126.92292	2017-12-22 23:43:01+08	2017-12-22 15:32:31.11864+08
60	contents/2017/aa/IMG_1221.JPG	\N	50.0873337	14.4213333	2017-12-23 17:24:09+08	2017-12-23 00:28:00.532942+08
61	contents/2017/aa/IMG_1222.JPG	\N	50.0873337	14.4213333	2017-12-23 17:24:16+08	2017-12-23 00:28:07.380479+08
62	contents/2017/aa/IMG_1223.JPG	\N	50.0873337	14.4215002	2017-12-23 17:24:40+08	2017-12-23 00:28:14.038756+08
63	contents/2017/aa/IMG_1224.JPG	\N	50.0873337	14.4215002	2017-12-23 17:24:49+08	2017-12-23 00:28:20.690969+08
64	contents/2017/aa/IMG_1225.JPG	\N	50.0878334	14.4271669	2017-12-23 17:30:26+08	2017-12-23 00:28:27.352891+08
65	contents/2017/bb/IMG_1226.JPG	\N	50.0876656	14.4274998	2017-12-23 17:30:53+08	2017-12-23 00:31:35.436175+08
66	contents/2017/bb/IMG_1227.JPG	\N	50.088501	14.4289999	2017-12-23 17:44:09+08	2017-12-23 00:31:41.997438+08
67	contents/2017/bb/IMG_1228.JPG	\N	50.0876656	14.4326668	2017-12-23 17:57:23+08	2017-12-23 00:31:48.670422+08
68	contents/2017/bb/IMG_1229.JPG	\N	50.0876656	14.4328337	2017-12-23 17:59:42+08	2017-12-23 00:31:55.323852+08
69	contents/2017/bb/IMG_1230.JPG	\N	50.0921669	14.4273329	2017-12-23 18:49:57+08	2017-12-23 00:32:04.014581+08
70	contents/2017/bb/IMG_1231.JPG	\N	50.0921669	14.4273329	2017-12-23 18:50:38+08	2017-12-23 00:32:10.678719+08
71	contents/2017/bb/IMG_1232.JPG	\N	50.0929985	14.4250002	2017-12-23 18:53:11+08	2017-12-23 00:32:17.202439+08
72	contents/2017/bb/IMG_1233.JPG	\N	50.0929985	14.4246664	2017-12-23 18:53:53+08	2017-12-23 00:32:23.574326+08
73	contents/2017/bb/IMG_1234.JPG	\N	50.0931664	14.4245005	2017-12-23 18:55:09+08	2017-12-23 00:32:33.561493+08
74	contents/2017/bb/IMG_1235.JPG	\N	50.0931664	14.4230003	2017-12-23 18:56:40+08	2017-12-23 00:32:40.197832+08
75	contents/2017/bb/IMG_1236.JPG	\N	50.091835	14.4171667	2017-12-23 19:01:58+08	2017-12-23 00:32:47.030075+08
76	contents/2017/bb/IMG_1237.JPG	\N	50.0916672	14.4163332	2017-12-23 19:03:18+08	2017-12-23 00:32:53.877657+08
77	contents/2017/bb/IMG_1238.JPG	\N	50.0906677	14.4154997	2017-12-23 19:05:19+08	2017-12-23 00:33:00.335991+08
78	contents/2017/bb/IMG_1239.JPG	\N	50.0895004	14.4145002	2017-12-23 19:07:38+08	2017-12-23 00:33:08.014107+08
79	contents/2017/bb/IMG_1240.JPG	\N	50.0895004	14.4145002	2017-12-23 19:07:40+08	2017-12-23 00:33:15.189263+08
80	contents/2017/bb/IMG_1241.JPG	\N	50.0895004	14.4145002	2017-12-23 19:07:51+08	2017-12-23 00:33:21.634566+08
81	contents/2017/bb/IMG_1242.JPG	\N	50.0893326	14.4145002	2017-12-23 19:08:44+08	2017-12-23 00:33:28.111972+08
82	contents/2017/bb/IMG_1243.JPG	\N	50.0893326	14.4128332	2017-12-23 19:09:58+08	2017-12-23 00:33:34.539694+08
83	contents/2017/bb/IMG_1244.JPG	\N	50.0895004	14.4128332	2017-12-23 19:10:05+08	2017-12-23 00:33:40.986714+08
84	contents/2017/bb/IMG_1245.JPG	\N	50.0895004	14.4126663	2017-12-23 19:10:17+08	2017-12-23 00:33:48.351994+08
85	contents/2017/bb/IMG_1246.JPG	\N	50.0895004	14.4126663	2017-12-23 19:10:21+08	2017-12-23 00:33:57.695238+08
86	contents/2017/bb/IMG_1247.JPG	\N	50.0880013	14.4036665	2017-12-23 19:19:19+08	2017-12-23 00:34:05.355141+08
87	contents/2017/bb/IMG_1248.JPG	\N	50.0878334	14.4045	2017-12-23 19:20:07+08	2017-12-23 00:34:11.603104+08
88	contents/2017/bb/IMG_1249.JPG	\N	50.0880013	14.4043331	2017-12-23 19:20:45+08	2017-12-23 00:34:18.252804+08
89	contents/2017/bb/IMG_1250.JPG	\N	50.081501	14.4148331	2017-12-23 19:30:05+08	2017-12-23 00:34:27.257896+08
90	contents/2017/bb/IMG_1251.JPG	\N	50.081501	14.4148331	2017-12-23 19:30:12+08	2017-12-23 00:34:34.059093+08
91	contents/2017/bb/IMG_1252.JPG	\N	50.081501	14.4148331	2017-12-23 19:30:47+08	2017-12-23 00:34:40.272051+08
92	contents/2017/bb/IMG_1253.JPG	\N	50.081501	14.4138336	2017-12-23 19:32:23+08	2017-12-23 00:34:47.036125+08
93	contents/2017/bb/IMG_1254.JPG	\N	50.0813332	14.4138336	2017-12-23 19:32:31+08	2017-12-23 00:34:53.789317+08
94	contents/2017/bb/IMG_1255.JPG	\N	50.0813332	14.4138336	2017-12-23 19:32:42+08	2017-12-23 00:35:06.805236+08
95	contents/2017/bb/IMG_1256.JPG	\N	50.0813332	14.4138336	2017-12-23 19:32:58+08	2017-12-23 00:35:14.588164+08
96	contents/2017/bb/IMG_1257.JPG	\N	50.0813332	14.4138336	2017-12-23 19:33:07+08	2017-12-23 00:35:21.683544+08
97	contents/2017/bb/IMG_1258.JPG	\N	50.0813332	14.4138336	2017-12-23 19:33:12+08	2017-12-23 00:35:28.219402+08
98	contents/2017/bb/IMG_1259.JPG	\N	50.0810013	14.4069996	2017-12-23 19:39:35+08	2017-12-23 00:35:35.050933+08
99	contents/2017/bb/IMG_1260.JPG	\N	50.0828323	14.4075003	2017-12-23 19:43:43+08	2017-12-23 00:35:43.559293+08
100	contents/2017/bb/IMG_1261.JPG	\N	50.0834999	14.4111662	2017-12-23 19:44:22+08	2017-12-23 00:35:52.264466+08
101	contents/2017/bb/IMG_1262.JPG	\N	50.0846672	14.4091663	2017-12-23 19:47:17+08	2017-12-23 00:36:02.209795+08
102	contents/2017/bb/IMG_1263.JPG	\N	50.0848351	14.4088335	2017-12-23 19:47:22+08	2017-12-23 00:36:08.850315+08
103	contents/2017/bb/IMG_1264.JPG	\N	50.0859985	14.4083338	2017-12-23 19:50:17+08	2017-12-23 00:36:15.816919+08
104	contents/2017/bb/IMG_1265.JPG	\N	50.0859985	14.4083338	2017-12-23 19:50:21+08	2017-12-23 00:36:23.696907+08
105	contents/2017/bb/IMG_1266.JPG	\N	50.0859985	14.4084997	2017-12-23 19:50:25+08	2017-12-23 00:36:30.143236+08
106	contents/2017/bb/IMG_1267.JPG	\N	50.0859985	14.4084997	2017-12-23 19:50:30+08	2017-12-23 00:36:37.521568+08
107	contents/2017/bb/IMG_1268.JPG	\N	50.0859985	14.4084997	2017-12-23 19:50:37+08	2017-12-23 00:36:43.862866+08
108	contents/2017/bb/IMG_1269.JPG	\N	50.0859985	14.4084997	2017-12-23 19:50:42+08	2017-12-23 00:36:57.079807+08
109	contents/2017/bb/IMG_1270.JPG	\N	50.0861664	14.4084997	2017-12-23 19:51:04+08	2017-12-23 00:37:03.737078+08
110	contents/2017/bb/IMG_1271.JPG	\N	50.0864983	14.4086666	2017-12-23 19:52:41+08	2017-12-23 00:37:11.309154+08
111	contents/2017/bb/IMG_1272.JPG	\N	50.0864983	14.4086666	2017-12-23 19:52:50+08	2017-12-23 00:37:17.414025+08
112	contents/2017/bb/IMG_1273.JPG	\N	0	0	2017-12-23 19:58:21+08	2017-12-23 00:37:26.495037+08
113	contents/2017/bb/IMG_1274.JPG	\N	50.086834	14.4084997	2017-12-23 20:15:26+08	2017-12-23 00:37:39.506301+08
114	contents/2017/bb/IMG_1275.JPG	\N	50.086834	14.4084997	2017-12-23 20:15:45+08	2017-12-23 00:37:45.45366+08
115	contents/2017/bb/IMG_1276.JPG	\N	50.086834	14.4084997	2017-12-23 20:15:53+08	2017-12-23 00:37:51.444293+08
116	contents/2017/bb/IMG_1277.JPG	\N	50.0870018	14.4086666	2017-12-23 20:16:30+08	2017-12-23 00:37:57.966009+08
117	contents/2017/bb/IMG_1278.JPG	\N	50.0870018	14.4086666	2017-12-23 20:16:36+08	2017-12-23 00:38:04.456615+08
118	contents/2017/bb/IMG_1279.JPG	\N	50.086834	14.4095001	2017-12-23 20:17:28+08	2017-12-23 00:38:11.941425+08
119	contents/2017/bb/IMG_1280.JPG	\N	50.0866661	14.4093332	2017-12-23 20:17:33+08	2017-12-23 00:38:19.40534+08
120	contents/2017/bb/IMG_1281.JPG	\N	50.0866661	14.4099998	2017-12-23 20:18:07+08	2017-12-23 00:38:25.945846+08
121	contents/2017/bb/IMG_1282.JPG	\N	50.0866661	14.409833	2017-12-23 20:19:41+08	2017-12-23 00:38:33.061555+08
122	contents/2017/bb/IMG_1283.JPG	\N	50.0866661	14.4101667	2017-12-23 20:20:05+08	2017-12-23 00:38:40.065319+08
123	contents/2017/bb/IMG_1284.JPG	\N	50.0866661	14.4101667	2017-12-23 20:20:10+08	2017-12-23 00:38:47.15875+08
124	contents/2017/bb/IMG_1285.JPG	\N	0	0	2017-12-23 20:21:46+08	2017-12-23 00:38:53.692352+08
125	contents/2017/bb/IMG_1286.JPG	\N	50.0864983	14.4108334	2017-12-23 20:23:53+08	2017-12-23 00:39:10.136559+08
126	contents/2017/bb/IMG_1287.JPG	\N	50.0864983	14.4116669	2017-12-23 20:28:04+08	2017-12-23 00:39:16.4455+08
127	contents/2017/bb/IMG_1288.JPG	\N	50.0863342	14.4116669	2017-12-23 20:29:02+08	2017-12-23 00:39:22.380292+08
128	contents/2017/bb/IMG_1289.JPG	\N	50.0863342	14.4119997	2017-12-23 20:30:00+08	2017-12-23 00:39:28.652876+08
129	contents/2017/bb/IMG_1290.JPG	\N	50.0863342	14.4119997	2017-12-23 20:30:10+08	2017-12-23 00:39:35.600973+08
130	contents/2017/bb/IMG_1291.JPG	\N	50.0864983	14.4123335	2017-12-23 20:30:54+08	2017-12-23 00:39:42.604665+08
131	contents/2017/bb/IMG_1292.JPG	\N	50.0864983	14.4123335	2017-12-23 20:30:58+08	2017-12-23 00:39:58.727338+08
132	contents/2017/bb/IMG_1293.JPG	\N	50.0863342	14.4123335	2017-12-23 20:32:30+08	2017-12-23 00:40:10.933499+08
133	contents/2017/bb/IMG_1295.JPG	\N	50.0864983	14.4128332	2017-12-23 20:36:28+08	2017-12-23 00:40:20.017685+08
134	contents/2017/bb/IMG_1296.JPG	\N	50.0863342	14.4128332	2017-12-23 20:39:27+08	2017-12-23 00:40:27.504137+08
135	contents/2017/bb/IMG_1297.JPG	\N	50.0863342	14.413167	2017-12-23 20:39:58+08	2017-12-23 00:40:34.894243+08
136	contents/2017/bb/IMG_1298.JPG	\N	50.0861664	14.4133329	2017-12-23 20:40:27+08	2017-12-23 00:40:41.217706+08
137	contents/2017/bb/IMG_1299.JPG	\N	50.0859985	14.4136667	2017-12-23 20:41:40+08	2017-12-23 00:40:47.985286+08
138	contents/2017/bb/IMG_1300.JPG	\N	50.0861664	14.4136667	2017-12-23 20:41:53+08	2017-12-23 00:40:54.540661+08
139	contents/2017/bb/IMG_1301.JPG	\N	0	0	2017-12-23 20:46:26+08	2017-12-23 00:41:02.852371+08
140	contents/2017/bb/IMG_1302.JPG	\N	50.0859985	14.4186668	2017-12-23 20:53:26+08	2017-12-23 00:41:09.091778+08
141	contents/2017/bb/IMG_1303.JPG	\N	50.0859985	14.4186668	2017-12-23 20:53:34+08	2017-12-23 00:41:15.144539+08
142	contents/2017/bb/IMG_1304.JPG	\N	50.0859985	14.4186668	2017-12-23 20:53:52+08	2017-12-23 00:41:23.022258+08
143	contents/2017/bb/IMG_1305.JPG	\N	50.086834	14.4200001	2017-12-23 21:08:19+08	2017-12-23 00:41:28.847455+08
144	contents/2017/bb/IMG_1306.JPG	\N	50.0870018	14.4208336	2017-12-23 21:09:29+08	2017-12-23 00:41:35.037166+08
145	contents/2017/bb/IMG_1307.JPG	\N	50.0870018	14.4208336	2017-12-23 21:09:38+08	2017-12-23 00:41:49.429133+08
146	contents/2017/bb/IMG_1308.JPG	\N	50.0871658	14.4211664	2017-12-23 21:11:06+08	2017-12-23 00:41:55.880833+08
147	contents/2017/bb/IMG_1309.JPG	\N	50.0873337	14.4211664	2017-12-23 21:23:44+08	2017-12-23 00:42:03.660599+08
148	contents/2017/bb/IMG_1310.JPG	\N	50.0871658	14.4216671	2017-12-23 21:23:57+08	2017-12-23 00:42:10.998411+08
149	contents/2017/bb/IMG_1311.JPG	\N	50.0873337	14.4219999	2017-12-23 21:26:00+08	2017-12-23 00:42:18.000306+08
150	contents/2017/bb/IMG_1312.JPG	\N	50.0873337	14.4274998	2017-12-23 21:31:16+08	2017-12-23 00:42:24.040876+08
151	contents/2017/bb/IMG_1313.JPG	\N	50.0873337	14.427	2017-12-23 21:32:13+08	2017-12-23 00:42:33.231036+08
152	contents/2017/bb/IMG_1314.JPG	\N	50.0871658	14.4285002	2017-12-23 21:33:50+08	2017-12-23 00:42:39.504516+08
153	contents/2017/bb/IMG_1315.JPG	\N	50.0871658	14.4285002	2017-12-23 21:34:09+08	2017-12-23 00:42:46.260789+08
154	contents/2017/bb/IMG_1316.JPG	\N	50.0873337	14.4281664	2017-12-23 21:35:15+08	2017-12-23 00:42:53.325651+08
155	contents/2017/bb/IMG_1317.JPG	\N	50.0853348	14.4251671	2017-12-23 22:46:21+08	2017-12-23 00:43:00.387627+08
156	contents/2017/bb/IMG_1318.JPG	\N	50.0853348	14.4251671	2017-12-23 22:46:47+08	2017-12-23 00:43:08.172266+08
157	contents/2017/bb/IMG_1319.JPG	\N	50.0853348	14.4251671	2017-12-23 22:46:59+08	2017-12-23 00:43:14.640343+08
158	contents/2017/bb/IMG_1320.JPG	\N	50.0853348	14.4251671	2017-12-23 22:48:24+08	2017-12-23 00:43:23.228649+08
159	contents/2017/bb/IMG_1321.JPG	\N	50.0751648	14.4189997	2017-12-23 07:29:00+08	2017-12-23 00:43:29.895082+08
160	contents/2017/bb/IMG_1322.JPG	\N	50.0751648	14.4189997	2017-12-23 07:29:02+08	2017-12-23 00:43:36.410058+08
161	contents/2017/bb/IMG_1323.JPG	\N	50.0138321	14.5303335	2017-12-23 08:31:33+08	2017-12-23 00:43:42.37391+08
162	contents/2017/bb/IMG_1324.JPG	\N	50.0135002	14.531167	2017-12-23 08:31:36+08	2017-12-23 00:43:48.773923+08
163	contents/2017/bb/IMG_1325.JPG	\N	49.9958344	14.5836668	2017-12-23 08:34:26+08	2017-12-23 00:43:55.182659+08
164	contents/2017/bb/IMG_1326.JPG	\N	49.9958344	14.5836668	2017-12-23 08:34:30+08	2017-12-23 00:44:04.495186+08
165	contents/2017/bb/IMG_1327.JPG	\N	0	0	2017-12-23 08:54:15+08	2017-12-23 00:44:10.434862+08
166	contents/2017/bb/IMG_1328.JPG	\N	49.7820015	14.6754999	2017-12-23 08:55:02+08	2017-12-23 00:44:16.726662+08
167	contents/2017/bb/IMG_1331.JPG	\N	49.2781677	14.715333	2017-12-23 09:57:08+08	2017-12-23 00:44:23.131583+08
168	contents/2017/bb/IMG_1332.JPG	\N	49.2763329	14.715333	2017-12-23 09:57:23+08	2017-12-23 00:44:29.291536+08
169	contents/2017/bb/IMG_1333.JPG	\N	49.2750015	14.715167	2017-12-23 09:57:34+08	2017-12-23 00:44:35.318657+08
170	contents/2017/bb/IMG_1334.JPG	\N	48.8341675	14.3465004	2017-12-23 11:01:40+08	2017-12-23 00:44:41.240193+08
171	contents/2017/bb/IMG_1335.JPG	\N	48.8339996	14.3461666	2017-12-23 11:01:42+08	2017-12-23 00:44:47.812198+08
172	contents/2017/bb/IMG_1336.JPG	\N	48.8336678	14.3458338	2017-12-23 11:01:44+08	2017-12-23 00:44:53.485903+08
173	contents/2017/bb/IMG_1337.JPG	\N	48.8111649	14.3208332	2017-12-23 11:20:18+08	2017-12-23 00:44:59.425019+08
174	contents/2017/bb/IMG_1338.JPG	\N	48.8111649	14.3208332	2017-12-23 11:20:22+08	2017-12-23 00:45:06.063911+08
175	contents/2017/bb/IMG_1339.JPG	\N	48.8106651	14.3183336	2017-12-23 11:25:27+08	2017-12-23 00:45:12.098021+08
176	contents/2017/bb/IMG_1340.JPG	\N	48.8106651	14.3171663	2017-12-23 11:27:06+08	2017-12-23 00:45:23.336479+08
177	contents/2017/bb/IMG_1341.JPG	\N	48.8105011	14.3171663	2017-12-23 11:28:24+08	2017-12-23 00:45:30.001878+08
178	contents/2017/bb/IMG_1342.JPG	\N	0	0	2017-12-23 11:29:50+08	2017-12-23 00:45:37.049414+08
179	contents/2017/bb/IMG_1343.JPG	\N	48.8103333	14.3158331	2017-12-23 11:31:03+08	2017-12-23 00:45:47.091037+08
180	contents/2017/bb/IMG_1344.JPG	\N	0	0	2017-12-23 11:37:00+08	2017-12-23 00:45:52.941235+08
181	contents/2017/bb/IMG_1345.JPG	\N	48.8105011	14.3151665	2017-12-23 11:49:47+08	2017-12-23 00:45:58.212618+08
182	contents/2017/bb/IMG_1347.JPG	\N	48.8105011	14.3149996	2017-12-23 11:51:20+08	2017-12-23 00:46:04.13262+08
183	contents/2017/bb/IMG_1348.JPG	\N	0	0	2017-12-23 11:54:34+08	2017-12-23 00:46:10.851038+08
184	contents/2017/bb/IMG_1349.JPG	\N	48.810833	14.3098335	2017-12-23 12:06:23+08	2017-12-23 00:46:17.567265+08
185	contents/2017/bb/IMG_1350.JPG	\N	48.8110008	14.3094997	2017-12-23 12:06:51+08	2017-12-23 00:46:35.124475+08
186	contents/2017/bb/IMG_1351.JPG	\N	48.8111649	14.3091669	2017-12-23 12:07:22+08	2017-12-23 00:46:49.052193+08
187	contents/2017/bb/IMG_1352.JPG	\N	48.8113327	14.3091669	2017-12-23 12:07:36+08	2017-12-23 00:47:01.031458+08
188	contents/2017/bb/IMG_1353.JPG	\N	48.8110008	14.3091669	2017-12-23 12:08:12+08	2017-12-23 00:47:07.168533+08
189	contents/2017/bb/IMG_1354.JPG	\N	48.8110008	14.309	2017-12-23 12:08:30+08	2017-12-23 00:47:13.623685+08
190	contents/2017/bb/IMG_1355.JPG	\N	48.8103333	14.3079996	2017-12-23 12:10:42+08	2017-12-23 00:47:20.286824+08
191	contents/2017/bb/IMG_1356.JPG	\N	48.8105011	14.3078337	2017-12-23 12:11:18+08	2017-12-23 00:47:26.525+08
192	contents/2017/bb/IMG_1357.JPG	\N	48.8105011	14.3078337	2017-12-23 12:12:00+08	2017-12-23 00:47:33.218114+08
193	contents/2017/bb/IMG_1358.JPG	\N	48.8100014	14.3066664	2017-12-23 12:13:46+08	2017-12-23 00:47:40.450485+08
194	contents/2017/bb/IMG_1359.JPG	\N	0	0	2017-12-23 12:16:31+08	2017-12-23 00:47:56.67989+08
195	contents/2017/bb/IMG_1360.JPG	\N	0	0	2017-12-23 12:16:35+08	2017-12-23 00:48:03.705675+08
196	contents/2017/bb/IMG_1361.JPG	\N	0	0	2017-12-23 12:17:53+08	2017-12-23 00:48:10.046094+08
197	contents/2017/bb/IMG_1362.JPG	\N	0	0	2017-12-23 12:18:01+08	2017-12-23 00:48:16.406985+08
198	contents/2017/bb/IMG_1363.JPG	\N	0	0	2017-12-23 12:23:16+08	2017-12-23 00:48:23.048113+08
199	contents/2017/bb/IMG_1364.JPG	\N	0	0	2017-12-23 12:23:21+08	2017-12-23 00:48:36.056448+08
200	contents/2017/bb/IMG_1365.JPG	\N	48.8110008	14.3094997	2017-12-23 12:25:22+08	2017-12-23 00:48:42.582928+08
201	contents/2017/bb/IMG_1366.JPG	\N	48.8111649	14.3093338	2017-12-23 12:25:26+08	2017-12-23 00:48:48.954108+08
202	contents/2017/bb/IMG_1367.JPG	\N	48.8110008	14.3094997	2017-12-23 12:25:31+08	2017-12-23 00:48:55.048335+08
203	contents/2017/bb/IMG_1368.JPG	\N	0	0	2017-12-23 12:30:16+08	2017-12-23 00:49:02.881269+08
204	contents/2017/bb/IMG_1369.JPG	\N	0	0	2017-12-23 12:35:06+08	2017-12-23 00:49:09.123693+08
205	contents/2017/bb/IMG_1370.JPG	\N	48.8118324	14.3136663	2017-12-23 12:41:19+08	2017-12-23 00:49:17.188864+08
206	contents/2017/bb/IMG_1371.JPG	\N	48.8120003	14.3138332	2017-12-23 12:41:53+08	2017-12-23 00:49:23.466329+08
207	contents/2017/bb/IMG_1372.JPG	\N	48.8126678	14.3161669	2017-12-23 12:50:50+08	2017-12-23 00:49:35.550433+08
208	contents/2017/bb/IMG_1373.JPG	\N	48.8126678	14.3161669	2017-12-23 12:50:52+08	2017-12-23 00:49:41.757885+08
209	contents/2017/bb/IMG_1374.JPG	\N	48.8126678	14.3158331	2017-12-23 12:51:48+08	2017-12-23 00:49:48.037889+08
210	contents/2017/bb/IMG_1375.JPG	\N	48.8126678	14.3158331	2017-12-23 12:51:57+08	2017-12-23 00:50:05.753112+08
211	contents/2017/bb/IMG_1376.JPG	\N	48.8126678	14.3158331	2017-12-23 12:52:50+08	2017-12-23 00:50:12.002199+08
212	contents/2017/bb/IMG_1377.JPG	\N	48.8125	14.3144999	2017-12-23 12:54:18+08	2017-12-23 00:50:18.458182+08
213	contents/2017/bb/IMG_1378.JPG	\N	48.8125	14.3144999	2017-12-23 12:54:23+08	2017-12-23 00:50:25.111824+08
214	contents/2017/bb/IMG_1379.JPG	\N	48.8125	14.3146667	2017-12-23 12:54:37+08	2017-12-23 00:50:32.179519+08
215	contents/2017/bb/IMG_1380.JPG	\N	48.8125	14.3146667	2017-12-23 12:54:48+08	2017-12-23 00:50:38.630519+08
216	contents/2017/bb/IMG_1381.JPG	\N	48.8125	14.3146667	2017-12-23 12:55:18+08	2017-12-23 00:50:45.184327+08
217	contents/2017/bb/IMG_1385.JPG	\N	48.8121681	14.3114996	2017-12-23 12:57:23+08	2017-12-23 00:50:51.535241+08
218	contents/2017/bb/IMG_1386.JPG	\N	48.8125	14.3131666	2017-12-23 12:57:45+08	2017-12-23 00:50:57.772791+08
219	contents/2017/bb/IMG_1387.JPG	\N	48.8126678	14.3129997	2017-12-23 12:58:14+08	2017-12-23 00:51:04.019088+08
220	contents/2017/bb/IMG_1389.JPG	\N	48.8125	14.3129997	2017-12-23 12:59:58+08	2017-12-23 00:51:06.914514+08
221	contents/2017/bb/IMG_1390.JPG	\N	48.8126678	14.3131666	2017-12-23 13:00:04+08	2017-12-23 00:51:16.650349+08
222	contents/2017/bb/IMG_1391.JPG	\N	0	0	2017-12-23 13:04:18+08	2017-12-23 00:51:22.4875+08
223	contents/2017/bb/IMG_1392.JPG	\N	0	0	2017-12-23 13:08:20+08	2017-12-23 00:51:27.829318+08
224	contents/2017/bb/IMG_1393.JPG	\N	0	0	2017-12-23 13:09:44+08	2017-12-23 00:51:33.714373+08
225	contents/2017/bb/IMG_1394.JPG	\N	0	0	2017-12-23 13:13:11+08	2017-12-23 00:51:39.673224+08
226	contents/2017/bb/IMG_1395.JPG	\N	0	0	2017-12-23 13:13:28+08	2017-12-23 00:51:46.094861+08
227	contents/2017/bb/IMG_1396.JPG	\N	0	0	2017-12-23 13:14:56+08	2017-12-23 00:51:53.985828+08
228	contents/2017/bb/IMG_1397.JPG	\N	0	0	2017-12-23 13:15:21+08	2017-12-23 00:52:04.739261+08
229	contents/2017/bb/IMG_1398.JPG	\N	0	0	2017-12-23 13:15:38+08	2017-12-23 00:52:10.173462+08
230	contents/2017/bb/IMG_1399.JPG	\N	0	0	2017-12-23 13:16:10+08	2017-12-23 00:52:16.743585+08
231	contents/2017/bb/IMG_1400.JPG	\N	48.8121681	14.3161669	2017-12-23 13:17:22+08	2017-12-23 00:52:23.008166+08
232	contents/2017/bb/IMG_1401.JPG	\N	48.8123322	14.316	2017-12-23 13:17:42+08	2017-12-23 00:52:29.215059+08
233	contents/2017/bb/IMG_1402.JPG	\N	48.8123322	14.316	2017-12-23 13:17:50+08	2017-12-23 00:52:36.341584+08
234	contents/2017/bb/IMG_1403.JPG	\N	48.8123322	14.316	2017-12-23 13:17:57+08	2017-12-23 00:52:42.638485+08
235	contents/2017/bb/IMG_1407.JPG	\N	0	0	2017-12-23 13:24:11+08	2017-12-23 00:52:50.226538+08
236	contents/2017/bb/IMG_1408.JPG	\N	0	0	2017-12-23 13:24:15+08	2017-12-23 00:53:02.122701+08
237	contents/2017/bb/IMG_1409.JPG	\N	0	0	2017-12-23 13:25:36+08	2017-12-23 00:53:08.999078+08
238	contents/2017/bb/IMG_1410.JPG	\N	0	0	2017-12-23 13:25:48+08	2017-12-23 00:53:20.851028+08
239	contents/2017/bb/IMG_1411.JPG	\N	48.8126678	14.3164997	2017-12-23 13:28:59+08	2017-12-23 00:53:32.993591+08
240	contents/2017/bb/IMG_1412.JPG	\N	48.8125	14.3166666	2017-12-23 13:29:18+08	2017-12-23 00:53:38.47867+08
241	contents/2017/bb/IMG_1414.JPG	\N	48.8101654	14.3163338	2017-12-23 13:38:13+08	2017-12-23 00:53:45.025267+08
242	contents/2017/bb/IMG_1415.JPG	\N	48.8101654	14.3158331	2017-12-23 13:38:22+08	2017-12-23 00:53:51.481925+08
243	contents/2017/bb/IMG_1416.JPG	\N	48.8103333	14.3156662	2017-12-23 13:38:31+08	2017-12-23 00:53:57.810946+08
244	contents/2017/bb/IMG_1417.JPG	\N	48.8101654	14.3158331	2017-12-23 13:38:50+08	2017-12-23 00:54:05.184831+08
245	contents/2017/bb/IMG_1418.JPG	\N	48.8101654	14.316	2017-12-23 13:38:55+08	2017-12-23 00:54:11.598519+08
246	contents/2017/bb/IMG_1419.JPG	\N	48.8101654	14.316	2017-12-23 13:39:17+08	2017-12-23 00:54:18.375911+08
247	contents/2017/bb/IMG_1420.JPG	\N	48.8105011	14.3156662	2017-12-23 13:39:30+08	2017-12-23 00:54:24.726812+08
248	contents/2017/bb/IMG_1421.JPG	\N	48.8103333	14.3158331	2017-12-23 13:40:04+08	2017-12-23 00:54:36.902518+08
249	contents/2017/bb/IMG_1422.JPG	\N	0	0	2017-12-23 13:41:31+08	2017-12-23 00:54:45.309236+08
250	contents/2017/bb/IMG_1423.JPG	\N	0	0	2017-12-23 13:42:47+08	2017-12-23 00:54:58.725338+08
251	contents/2017/bb/IMG_1424.JPG	\N	48.8111649	14.3208332	2017-12-23 13:49:17+08	2017-12-23 00:55:05.071999+08
252	contents/2017/bb/IMG_1425.JPG	\N	49.4679985	14.6603336	2017-12-23 16:28:42+08	2017-12-23 00:55:17.893658+08
253	contents/2017/bb/IMG_1429.JPG	\N	0	0	2017-12-23 19:20:54+08	2017-12-23 00:55:24.331431+08
254	contents/2017/bb/IMG_1430.JPG	\N	50.0875015	14.4280005	2017-12-23 20:08:50+08	2017-12-23 00:55:30.316389+08
255	contents/2017/bb/IMG_1431.JPG	\N	50.0875015	14.4278336	2017-12-23 20:12:15+08	2017-12-23 00:55:36.735714+08
256	contents/2017/bb/IMG_1434.JPG	\N	50.0875015	14.4278336	2017-12-23 20:26:17+08	2017-12-23 00:55:43.270061+08
257	contents/2017/bb/IMG_1438.JPG	\N	50.0875015	14.4278336	2017-12-23 20:38:08+08	2017-12-23 00:55:53.923409+08
258	contents/2017/bb/IMG_1440.JPG	\N	50.0875015	14.4278336	2017-12-23 20:50:27+08	2017-12-23 00:56:04.569994+08
259	contents/2017/bb/IMG_1441.JPG	\N	50.0875015	14.4278336	2017-12-23 20:50:31+08	2017-12-23 00:56:10.923762+08
260	contents/2017/bb/IMG_1442.JPG	\N	50.0876656	14.4278336	2017-12-23 20:53:27+08	2017-12-23 00:56:17.502825+08
261	contents/2017/bb/IMG_1443.JPG	\N	50.0876656	14.4278336	2017-12-23 20:53:29+08	2017-12-23 00:56:30.078826+08
262	contents/2017/bb/IMG_1444.JPG	\N	50.0876656	14.4280005	2017-12-23 20:54:06+08	2017-12-23 00:56:37.031899+08
263	contents/2017/bb/IMG_1445.JPG	\N	50.0876656	14.4280005	2017-12-23 20:54:08+08	2017-12-23 00:56:43.076823+08
264	contents/2017/bb/IMG_1446.JPG	\N	50.0876656	14.4280005	2017-12-23 20:54:11+08	2017-12-23 00:56:49.631274+08
265	contents/2017/bb/IMG_1447.JPG	\N	50.0876656	14.4280005	2017-12-23 20:54:35+08	2017-12-23 00:56:58.746686+08
266	contents/2017/bb/IMG_1448.JPG	\N	50.0875015	14.4280005	2017-12-23 20:56:52+08	2017-12-23 00:57:05.165697+08
267	contents/2017/bb/IMG_1449.JPG	\N	50.0875015	14.4280005	2017-12-23 20:56:54+08	2017-12-23 00:57:11.532396+08
268	contents/2017/bb/IMG_1450.JPG	\N	50.0875015	14.4280005	2017-12-23 20:56:56+08	2017-12-23 00:57:17.845415+08
269	contents/2017/bb/IMG_1451.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:01+08	2017-12-23 00:57:29.547559+08
270	contents/2017/bb/IMG_1452.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:09+08	2017-12-23 00:57:46.063489+08
271	contents/2017/bb/IMG_1453.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:17+08	2017-12-23 00:57:52.149994+08
272	contents/2017/bb/IMG_1454.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:34+08	2017-12-23 00:57:58.055682+08
273	contents/2017/bb/IMG_1455.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:38+08	2017-12-23 00:58:04.577552+08
274	contents/2017/bb/IMG_1456.JPG	\N	50.0875015	14.4280005	2017-12-23 20:57:42+08	2017-12-23 00:58:16.660158+08
275	contents/2017/bb/IMG_1457.JPG	\N	50.0876656	14.4278336	2017-12-23 20:59:36+08	2017-12-23 00:58:22.926487+08
276	contents/2017/bb/IMG_1458.JPG	\N	50.0876656	14.4278336	2017-12-23 20:59:41+08	2017-12-23 00:58:39.410166+08
277	contents/2017/bb/IMG_1459.JPG	\N	50.0876656	14.4278336	2017-12-23 20:59:45+08	2017-12-23 00:58:47.477303+08
278	contents/2017/bb/IMG_1460.JPG	\N	50.0876656	14.4278336	2017-12-23 20:59:53+08	2017-12-23 00:58:54.13486+08
279	contents/2017/bb/IMG_1462.JPG	\N	50.0873337	14.4283333	2017-12-23 21:23:29+08	2017-12-23 00:59:00.486236+08
280	contents/2017/bb/IMG_1463.JPG	\N	50.0873337	14.4283333	2017-12-23 21:56:26+08	2017-12-23 00:59:07.037867+08
281	contents/2017/bb/IMG_1464.JPG	\N	50.0873337	14.4283333	2017-12-23 21:56:31+08	2017-12-23 00:59:13.498718+08
282	contents/2017/bb/IMG_1465.JPG	\N	50.083168	14.4246664	2017-12-23 22:12:15+08	2017-12-23 00:59:19.797549+08
283	contents/2017/bb/IMG_1466.JPG	\N	50.0779991	14.4176664	2017-12-23 22:38:09+08	2017-12-23 00:59:26.188768+08
284	contents/2017/bb/IMG_1467.JPG	\N	50.0783348	14.4160004	2017-12-23 22:41:52+08	2017-12-23 00:59:32.636453+08
285	contents/2017/bb/IMG_1468.JPG	\N	50.0783348	14.4160004	2017-12-23 22:41:56+08	2017-12-23 00:59:39.29152+08
286	contents/2017/bb/IMG_1469.JPG	\N	0	0	\N	2017-12-23 00:59:46.764177+08
287	contents/2017/bb/IMG_1470.JPG	\N	0	0	\N	2017-12-23 00:59:51.033314+08
288	contents/2017/bb/IMG_1471.JPG	\N	0	0	\N	2017-12-23 00:59:55.13676+08
289	contents/2017/bb/IMG_1472.JPG	\N	0	0	\N	2017-12-23 00:59:59.914737+08
290	contents/2017/bb/IMG_1473.JPG	\N	50.0769997	14.4198332	2017-12-23 09:12:32+08	2017-12-23 01:00:04.397416+08
291	contents/2017/bb/IMG_1474.JPG	\N	50.0774994	14.4193335	2017-12-23 09:12:41+08	2017-12-23 01:00:15.971999+08
292	contents/2017/bb/IMG_1475.JPG	\N	50.0771675	14.4195004	2017-12-23 09:12:56+08	2017-12-23 01:00:23.049733+08
293	contents/2017/bb/IMG_1476.JPG	\N	50.0771675	14.4195004	2017-12-23 09:13:10+08	2017-12-23 01:00:29.99218+08
294	contents/2017/bb/IMG_1477.JPG	\N	50.0924988	14.3986664	2017-12-23 09:33:19+08	2017-12-23 01:00:36.397679+08
295	contents/2017/bb/IMG_1478.JPG	\N	50.0926666	14.3986664	2017-12-23 09:34:22+08	2017-12-23 01:00:42.665199+08
296	contents/2017/bb/IMG_1479.JPG	\N	50.091835	14.3985004	2017-12-23 09:39:12+08	2017-12-23 01:00:49.62241+08
297	contents/2017/bb/IMG_1480.JPG	\N	50.0914993	14.3986664	2017-12-23 09:40:19+08	2017-12-23 01:00:55.784587+08
298	contents/2017/bb/IMG_1481.JPG	\N	50.0909996	14.3988333	2017-12-23 09:43:25+08	2017-12-23 01:01:03.084009+08
299	contents/2017/bb/IMG_1482.JPG	\N	50.0904999	14.3988333	2017-12-23 09:45:51+08	2017-12-23 01:01:10.230627+08
300	contents/2017/bb/IMG_1483.JPG	\N	50.0904999	14.3998337	2017-12-23 09:47:58+08	2017-12-23 01:01:17.433971+08
301	contents/2017/bb/IMG_1484.JPG	\N	50.0906677	14.3998337	2017-12-23 09:48:37+08	2017-12-23 01:01:23.563794+08
302	contents/2017/bb/IMG_1485.JPG	\N	50.0906677	14.3998337	2017-12-23 09:50:17+08	2017-12-23 01:01:29.939024+08
303	contents/2017/bb/IMG_1486.JPG	\N	50.0906677	14.3998337	2017-12-23 09:51:38+08	2017-12-23 01:01:36.652332+08
304	contents/2017/bb/IMG_1487.JPG	\N	50.0906677	14.3998337	2017-12-23 09:51:49+08	2017-12-23 01:01:42.430192+08
305	contents/2017/bb/IMG_1488.JPG	\N	50.0906677	14.4001665	2017-12-23 09:53:28+08	2017-12-23 01:01:49.031852+08
306	contents/2017/bb/IMG_1489.JPG	\N	50.0906677	14.3999996	2017-12-23 09:53:36+08	2017-12-23 01:01:55.903333+08
307	contents/2017/bb/IMG_1490.JPG	\N	50.0908318	14.3999996	2017-12-23 09:54:13+08	2017-12-23 01:02:02.956931+08
308	contents/2017/bb/IMG_1491.JPG	\N	50.0906677	14.4001665	2017-12-23 09:55:18+08	2017-12-23 01:02:08.890126+08
309	contents/2017/bb/IMG_1492.JPG	\N	50.0904999	14.4001665	2017-12-23 09:56:02+08	2017-12-23 01:02:15.353245+08
310	contents/2017/bb/IMG_1493.JPG	\N	50.0904999	14.4001665	2017-12-23 09:57:49+08	2017-12-23 01:02:29.032431+08
311	contents/2017/bb/IMG_1494.JPG	\N	50.0906677	14.4001665	2017-12-23 09:58:43+08	2017-12-23 01:02:35.890778+08
312	contents/2017/bb/IMG_1495.JPG	\N	50.0906677	14.4001665	2017-12-23 09:59:03+08	2017-12-23 01:02:41.798704+08
313	contents/2017/bb/IMG_1496.JPG	\N	50.0904999	14.3998337	2017-12-23 10:03:10+08	2017-12-23 01:02:48.103158+08
314	contents/2017/bb/IMG_1497.JPG	\N	50.0904999	14.3998337	2017-12-23 10:03:20+08	2017-12-23 01:02:54.878879+08
315	contents/2017/bb/IMG_1498.JPG	\N	50.0909996	14.4003334	2017-12-23 10:05:00+08	2017-12-23 01:03:01.953481+08
316	contents/2017/bb/IMG_1499.JPG	\N	50.0909996	14.4001665	2017-12-23 10:05:12+08	2017-12-23 01:03:08.700963+08
317	contents/2017/bb/IMG_1500.JPG	\N	50.0908318	14.4001665	2017-12-23 10:05:36+08	2017-12-23 01:03:24.566444+08
318	contents/2017/bb/IMG_1501.JPG	\N	50.0908318	14.4003334	2017-12-23 10:05:54+08	2017-12-23 01:03:32.05494+08
319	contents/2017/bb/IMG_1502.JPG	\N	50.0908318	14.4005003	2017-12-23 10:06:22+08	2017-12-23 01:03:56.124014+08
320	contents/2017/bb/IMG_1503.JPG	\N	50.0908318	14.4005003	2017-12-23 10:06:31+08	2017-12-23 01:04:04.821221+08
321	contents/2017/bb/IMG_1504.JPG	\N	50.0908318	14.4005003	2017-12-23 10:06:44+08	2017-12-23 01:04:11.161381+08
322	contents/2017/bb/IMG_1505.JPG	\N	50.0908318	14.4005003	2017-12-23 10:06:58+08	2017-12-23 01:04:18.127366+08
323	contents/2017/bb/IMG_1506.JPG	\N	50.0908318	14.4005003	2017-12-23 10:07:23+08	2017-12-23 01:04:25.092019+08
324	contents/2017/bb/IMG_1507.JPG	\N	50.0908318	14.4005003	2017-12-23 10:07:40+08	2017-12-23 01:04:32.09321+08
325	contents/2017/bb/IMG_1508.JPG	\N	50.0908318	14.4005003	2017-12-23 10:07:48+08	2017-12-23 01:04:39.515879+08
326	contents/2017/bb/IMG_1509.JPG	\N	50.0909996	14.401	2017-12-23 10:08:30+08	2017-12-23 01:04:51.091317+08
327	contents/2017/bb/IMG_1510.JPG	\N	50.0909996	14.401	2017-12-23 10:08:40+08	2017-12-23 01:04:57.752799+08
328	contents/2017/bb/IMG_1511.JPG	\N	50.0911674	14.401	2017-12-23 10:09:06+08	2017-12-23 01:05:03.94505+08
329	contents/2017/bb/IMG_1512.JPG	\N	50.0909996	14.401	2017-12-23 10:09:19+08	2017-12-23 01:05:13.11127+08
330	contents/2017/bb/IMG_1513.JPG	\N	50.0909996	14.4011669	2017-12-23 10:09:35+08	2017-12-23 01:05:20.100763+08
331	contents/2017/bb/IMG_1514.JPG	\N	50.0911674	14.4011669	2017-12-23 10:09:55+08	2017-12-23 01:05:46.915463+08
332	contents/2017/bb/IMG_1515.JPG	\N	50.0911674	14.4011669	2017-12-23 10:10:08+08	2017-12-23 01:05:53.985458+08
333	contents/2017/bb/IMG_1516.JPG	\N	50.0911674	14.4013338	2017-12-23 10:10:20+08	2017-12-23 01:06:10.871034+08
334	contents/2017/bb/IMG_1517.JPG	\N	50.0909996	14.4013338	2017-12-23 10:10:34+08	2017-12-23 01:06:17.89808+08
335	contents/2017/bb/IMG_1518.JPG	\N	50.0909996	14.4013338	2017-12-23 10:10:45+08	2017-12-23 01:06:32.292453+08
336	contents/2017/bb/IMG_1519.JPG	\N	50.0909996	14.4013338	2017-12-23 10:11:14+08	2017-12-23 01:06:38.624464+08
337	contents/2017/bb/IMG_1520.JPG	\N	50.0909996	14.4013338	2017-12-23 10:11:51+08	2017-12-23 01:06:46.709827+08
338	contents/2017/bb/IMG_1521.JPG	\N	50.0909996	14.4013338	2017-12-23 10:12:07+08	2017-12-23 01:06:53.775177+08
339	contents/2017/bb/IMG_1522.JPG	\N	50.0909996	14.4013338	2017-12-23 10:12:19+08	2017-12-23 01:07:05.036766+08
340	contents/2017/bb/IMG_1523.JPG	\N	50.0909996	14.4013338	2017-12-23 10:12:34+08	2017-12-23 01:07:11.896635+08
341	contents/2017/bb/IMG_1524.JPG	\N	50.0909996	14.4013338	2017-12-23 10:12:52+08	2017-12-23 01:07:35.395883+08
342	contents/2017/bb/IMG_1525.JPG	\N	50.0909996	14.4013338	2017-12-23 10:13:11+08	2017-12-23 01:07:41.976298+08
343	contents/2017/bb/IMG_1526.JPG	\N	50.0909996	14.4013338	2017-12-23 10:13:23+08	2017-12-23 01:07:48.735682+08
344	contents/2017/bb/IMG_1527.JPG	\N	50.0909996	14.4013338	2017-12-23 10:13:38+08	2017-12-23 01:07:56.867757+08
345	contents/2017/bb/IMG_1528.JPG	\N	50.0909996	14.4013338	2017-12-23 10:13:47+08	2017-12-23 01:08:04.122179+08
346	contents/2017/bb/IMG_1529.JPG	\N	50.0908318	14.401	2017-12-23 10:14:29+08	2017-12-23 01:08:12.156268+08
347	contents/2017/bb/IMG_1530.JPG	\N	50.0908318	14.401	2017-12-23 10:14:39+08	2017-12-23 01:08:19.440222+08
348	contents/2017/bb/IMG_1531.JPG	\N	50.0909996	14.4008331	2017-12-23 10:15:34+08	2017-12-23 01:08:25.375772+08
349	contents/2017/bb/IMG_1532.JPG	\N	50.0909996	14.4008331	2017-12-23 10:15:51+08	2017-12-23 01:08:39.522308+08
350	contents/2017/bb/IMG_1533.JPG	\N	50.0909996	14.4008331	2017-12-23 10:16:04+08	2017-12-23 01:08:50.903651+08
351	contents/2017/bb/IMG_1534.JPG	\N	50.0909996	14.4008331	2017-12-23 10:16:29+08	2017-12-23 01:08:57.369894+08
352	contents/2017/bb/IMG_1535.JPG	\N	50.0909996	14.4006662	2017-12-23 10:16:39+08	2017-12-23 01:09:06.17675+08
353	contents/2017/bb/IMG_1536.JPG	\N	50.0909996	14.4006662	2017-12-23 10:17:08+08	2017-12-23 01:09:12.517872+08
354	contents/2017/bb/IMG_1537.JPG	\N	50.0909996	14.4006662	2017-12-23 10:17:23+08	2017-12-23 01:09:20.441167+08
355	contents/2017/bb/IMG_1538.JPG	\N	50.0909996	14.4006662	2017-12-23 10:17:32+08	2017-12-23 01:09:27.76577+08
356	contents/2017/bb/IMG_1539.JPG	\N	50.0906677	14.4003334	2017-12-23 10:19:30+08	2017-12-23 01:09:34.84435+08
357	contents/2017/bb/IMG_1540.JPG	\N	50.0906677	14.4003334	2017-12-23 10:19:42+08	2017-12-23 01:09:42.100668+08
358	contents/2017/bb/IMG_1541.JPG	\N	50.0906677	14.4003334	2017-12-23 10:19:57+08	2017-12-23 01:09:48.266449+08
359	contents/2017/bb/IMG_1542.JPG	\N	50.0906677	14.4005003	2017-12-23 10:22:28+08	2017-12-23 01:09:54.401336+08
360	contents/2017/bb/IMG_1543.JPG	\N	50.0904999	14.4001665	2017-12-23 10:24:12+08	2017-12-23 01:10:06.091307+08
361	contents/2017/bb/IMG_1544.JPG	\N	50.090332	14.4005003	2017-12-23 10:24:46+08	2017-12-23 01:10:12.461474+08
362	contents/2017/bb/IMG_1545.JPG	\N	50.090332	14.4005003	2017-12-23 10:26:10+08	2017-12-23 01:10:18.920722+08
363	contents/2017/bb/IMG_1546.JPG	\N	50.0904999	14.4003334	2017-12-23 10:26:40+08	2017-12-23 01:10:25.425237+08
364	contents/2017/bb/IMG_1547.JPG	\N	50.090332	14.4003334	2017-12-23 10:29:53+08	2017-12-23 01:10:32.062443+08
365	contents/2017/bb/IMG_1548.JPG	\N	50.0909996	14.4016666	2017-12-23 10:30:15+08	2017-12-23 01:10:38.714674+08
366	contents/2017/bb/IMG_1549.JPG	\N	50.0911674	14.4021664	2017-12-23 10:31:36+08	2017-12-23 01:10:46.734741+08
367	contents/2017/bb/IMG_1550.JPG	\N	50.0911674	14.4021664	2017-12-23 10:31:58+08	2017-12-23 01:10:53.176632+08
368	contents/2017/bb/IMG_1551.JPG	\N	0	0	2017-12-23 10:32:30+08	2017-12-23 01:10:59.797356+08
369	contents/2017/bb/IMG_1552.JPG	\N	50.0908318	14.4025002	2017-12-23 10:34:13+08	2017-12-23 01:11:06.093758+08
370	contents/2017/bb/IMG_1553.JPG	\N	50.0908318	14.4025002	2017-12-23 10:34:23+08	2017-12-23 01:11:12.640265+08
371	contents/2017/bb/IMG_1554.JPG	\N	50.0911674	14.4020004	2017-12-23 10:35:02+08	2017-12-23 01:11:20.38648+08
372	contents/2017/bb/IMG_1555.JPG	\N	50.0908318	14.4020004	2017-12-23 10:35:30+08	2017-12-23 01:11:34.103818+08
373	contents/2017/bb/IMG_1556.JPG	\N	50.0919991	14.4048338	2017-12-23 10:39:15+08	2017-12-23 01:11:40.723469+08
374	contents/2017/bb/IMG_1557.JPG	\N	50.0916672	14.4055004	2017-12-23 10:41:52+08	2017-12-23 01:11:47.391712+08
375	contents/2017/bb/IMG_1558.JPG	\N	50.0916672	14.4055004	2017-12-23 10:42:14+08	2017-12-23 01:11:53.473936+08
376	contents/2017/bb/IMG_1559.JPG	\N	50.0916672	14.4055004	2017-12-23 10:42:20+08	2017-12-23 01:11:59.444757+08
377	contents/2017/bb/IMG_1560.JPG	\N	50.0916672	14.4056664	2017-12-23 10:42:58+08	2017-12-23 01:12:05.989886+08
378	contents/2017/bb/IMG_1561.JPG	\N	50.0916672	14.4056664	2017-12-23 10:43:05+08	2017-12-23 01:12:18.002815+08
379	contents/2017/bb/IMG_1562.JPG	\N	50.0916672	14.4056664	2017-12-23 10:43:16+08	2017-12-23 01:12:24.316934+08
380	contents/2017/bb/IMG_1563.JPG	\N	50.0914993	14.4049997	2017-12-23 10:47:33+08	2017-12-23 01:12:31.086957+08
381	contents/2017/bb/IMG_1564.JPG	\N	50.0913315	14.4045	2017-12-23 10:48:15+08	2017-12-23 01:12:38.510739+08
382	contents/2017/bb/IMG_1565.JPG	\N	50.0906677	14.4031668	2017-12-23 10:49:59+08	2017-12-23 01:12:45.410945+08
383	contents/2017/bb/IMG_1566.JPG	\N	50.0906677	14.402833	2017-12-23 10:50:30+08	2017-12-23 01:12:52.074588+08
384	contents/2017/bb/IMG_1567.JPG	\N	50.0893326	14.4013338	2017-12-23 10:53:45+08	2017-12-23 01:12:58.622562+08
385	contents/2017/bb/IMG_1568.JPG	\N	50.0895004	14.3981667	2017-12-23 10:57:21+08	2017-12-23 01:13:05.07441+08
386	contents/2017/bb/IMG_1569.JPG	\N	50.0896683	14.3981667	2017-12-23 10:58:25+08	2017-12-23 01:13:11.948393+08
387	contents/2017/bb/IMG_1570.JPG	\N	50.0896683	14.3981667	2017-12-23 10:58:34+08	2017-12-23 01:13:18.593406+08
388	contents/2017/bb/IMG_1571.JPG	\N	50.0896683	14.3983335	2017-12-23 10:58:58+08	2017-12-23 01:13:24.733694+08
389	contents/2017/bb/IMG_1572.JPG	\N	50.0898323	14.3985004	2017-12-23 10:59:44+08	2017-12-23 01:13:31.695823+08
390	contents/2017/bb/IMG_1573.JPG	\N	50.0898323	14.3985004	2017-12-23 10:59:45+08	2017-12-23 01:13:37.993364+08
391	contents/2017/bb/IMG_1574.JPG	\N	50.0896683	14.3983335	2017-12-23 11:00:35+08	2017-12-23 01:13:46.45907+08
392	contents/2017/bb/IMG_1575.JPG	\N	50.0896683	14.3983335	2017-12-23 11:01:20+08	2017-12-23 01:13:52.907813+08
393	contents/2017/bb/IMG_1576.JPG	\N	50.0896683	14.3983335	2017-12-23 11:01:43+08	2017-12-23 01:13:59.151892+08
394	contents/2017/bb/IMG_1577.JPG	\N	50.0896683	14.3983335	2017-12-23 11:01:58+08	2017-12-23 01:14:06.204121+08
395	contents/2017/bb/IMG_1578.JPG	\N	50.090168	14.3990002	2017-12-23 11:03:45+08	2017-12-23 01:14:12.621715+08
396	contents/2017/cc/IMG_1580.JPG	\N	50.0895004	14.3971663	2017-12-23 11:25:46+08	2017-12-23 01:34:24.702827+08
397	contents/2017/cc/IMG_1581.JPG	\N	50.0895004	14.3968334	2017-12-23 11:26:10+08	2017-12-23 01:34:31.939472+08
398	contents/2017/cc/IMG_1582.JPG	\N	50.0895004	14.3964996	2017-12-23 11:26:33+08	2017-12-23 01:34:38.165776+08
399	contents/2017/cc/IMG_1583.JPG	\N	50.0895004	14.3964996	2017-12-23 11:26:34+08	2017-12-23 01:34:45.027331+08
400	contents/2017/cc/IMG_1584.JPG	\N	50.0883331	14.3913336	2017-12-23 11:32:57+08	2017-12-23 01:34:51.273779+08
401	contents/2017/cc/IMG_1585.JPG	\N	50.0891685	14.3911667	2017-12-23 11:34:52+08	2017-12-23 01:34:57.224242+08
402	contents/2017/cc/IMG_1586.JPG	\N	50.0891685	14.3913336	2017-12-23 11:35:04+08	2017-12-23 01:35:03.536095+08
403	contents/2017/cc/IMG_1587.JPG	\N	50.0890007	14.3915005	2017-12-23 11:36:51+08	2017-12-23 01:35:09.396948+08
404	contents/2017/cc/IMG_1588.JPG	\N	50.0881653	14.3911667	2017-12-23 11:38:58+08	2017-12-23 01:35:16.727173+08
405	contents/2017/cc/IMG_1589.JPG	\N	50.0864983	14.3879995	2017-12-23 11:44:31+08	2017-12-23 01:35:24.042509+08
406	contents/2017/cc/IMG_1590.JPG	\N	50.0870018	14.3896666	2017-12-23 11:47:46+08	2017-12-23 01:35:30.416187+08
407	contents/2017/cc/IMG_1591.JPG	\N	50.0863342	14.3900003	2017-12-23 11:49:34+08	2017-12-23 01:35:36.968709+08
408	contents/2017/cc/IMG_1592.JPG	\N	50.081665	14.4126663	2017-12-23 12:14:11+08	2017-12-23 01:35:43.808841+08
409	contents/2017/cc/IMG_1593.JPG	\N	50.0806656	14.416667	2017-12-23 12:24:08+08	2017-12-23 01:35:51.178665+08
410	contents/2017/cc/IMG_1594.JPG	\N	50.0805016	14.4168329	2017-12-23 12:34:27+08	2017-12-23 01:35:58.147519+08
411	contents/2017/cc/IMG_1595.JPG	\N	50.0805016	14.4168329	2017-12-23 12:34:30+08	2017-12-23 01:36:05.032994+08
412	contents/2017/cc/IMG_1596.JPG	\N	50.0796661	14.4198332	2017-12-23 13:08:45+08	2017-12-23 01:36:11.451294+08
413	contents/2017/cc/IMG_1597.JPG	\N	50.0821648	14.4265003	2017-12-23 13:13:57+08	2017-12-23 01:36:18.35163+08
414	contents/2017/cc/IMG_1598.JPG	\N	50.0810013	14.4278336	2017-12-23 13:19:30+08	2017-12-23 01:36:29.181675+08
415	contents/2017/cc/IMG_1599.JPG	\N	50.0803337	14.4285002	2017-12-23 13:26:09+08	2017-12-23 01:36:40.419824+08
416	contents/2017/cc/IMG_1600.JPG	\N	50.0811653	14.4278336	2017-12-23 13:45:05+08	2017-12-23 01:36:46.882664+08
417	contents/2017/cc/IMG_1601.JPG	\N	50.0820007	14.4266663	2017-12-23 13:49:05+08	2017-12-23 01:36:53.536422+08
418	contents/2017/12/IMG_1512.JPG	\N	36.0664024	120.395134	2017-12-25 07:49:56+08	2017-12-25 00:41:08.155231+08
419	contents/2017/12/IMG_1512_jk4RT9D.JPG	\N	36.0664024	120.395134	2017-12-25 07:49:56+08	2017-12-25 00:42:29.402071+08
420	contents/2017/12/IMG_0828.JPG	\N	35.9546661	120.192711	2017-12-25 18:20:57+08	2017-12-25 10:02:35.119632+08
421	contents/2017/12/IMG_0837.JPG	\N	35.9546204	120.192703	2017-12-25 18:22:32+08	2017-12-25 10:03:23.469848+08
422	contents/2017/12/IMG_0944.JPG	\N	36.0679321	120.400078	2017-12-25 17:50:47+08	2017-12-25 10:04:11.258095+08
423	contents/2017/12/IMG_0984.JPG	\N	36.3152885	120.43512	2017-12-25 14:08:55+08	2017-12-25 10:04:44.061771+08
424	contents/2017/12/IMG_1224.JPG	\N	31.3995495	121.274963	2017-12-25 17:19:04+08	2017-12-25 10:06:00.659141+08
425	contents/2017/12/IMG_1474.JPG	\N	37.3899193	126.949265	2017-12-25 10:17:17+08	2017-12-25 10:06:46.297115+08
426	contents/2017/12/IMG_1522.JPG	\N	35.9635353	120.162628	2017-12-26 12:08:48+08	2017-12-26 04:48:35.896953+08
427	contents/2017/12/WechatIMG2.jpeg	\N	0	0	\N	2017-12-27 02:58:09.466399+08
1000	contents/2017/12/29/IMG20170908175345.jpg	\N	35.9557114	120.186371	2017-12-30 01:53:46+08	2017-12-29 10:20:07.781815+08
1001	contents/2017/12/29/IMG20170908175345_SB7LCve.jpg	\N	35.9557114	120.186371	2017-12-30 01:53:46+08	2017-12-29 10:27:05.743656+08
1002	contents/2017/12/29/IMG20170908175345_lERPcQf.jpg	\N	35.9557114	120.186371	2017-12-30 01:53:46+08	2017-12-29 10:28:41.710564+08
1003	contents/2017/12/29/IMG20170909133647.jpg	\N	0	0	2017-12-29 21:36:47+08	2017-12-29 12:52:16.013312+08
1004	contents/2017/12/29/MYXJ_20171218194753_fast.jpg	\N	0	0	\N	2017-12-29 14:25:12.443761+08
1005	contents/2017/12/29/IMG20171124173509_1.jpg	\N	0	0	2017-12-30 01:35:08+08	2017-12-29 14:28:38.162689+08
1006	contents/2017/12/29/MYXJ_20171218194753_fast_PpWR6vO.jpg	\N	0	0	\N	2017-12-29 14:30:08.639434+08
1007	contents/2017/12/29/IMG20171124173509_1_e0zClR8.jpg	\N	0	0	2017-12-30 01:35:08+08	2017-12-29 14:31:32.925089+08
1008	contents/2017/12/29/IMG_1512.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:34:33.507903+08
1009	contents/2017/12/29/IMG_1512_bb5RlzP.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:37:46.826064+08
1010	contents/2017/12/29/IMG_1512_BuC1LBg.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:46:48.058456+08
1011	contents/2017/12/29/IMG_1512_5M8w4MF.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:51:27.147214+08
1012	contents/2017/12/29/IMG_1512_PWA7gi8.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:55:36.99486+08
1013	contents/2017/12/29/IMG_1512_rXlSDZ3.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 15:58:51.812269+08
1014	contents/2017/12/29/IMG_1512_c87l1qr.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 16:00:44.039854+08
1015	contents/2017/12/29/IMG_1512_vr6nODk.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 16:03:41.899949+08
1016	contents/2017/12/29/IMG_1512_JM46pxX.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 16:05:12.024817+08
1017	contents/2017/12/29/IMG_1512_WLrJFjS.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 16:10:58.357279+08
1018	contents/2017/12/29/IMG_1512_YMuoeFN.JPG	\N	36.0666847	120.400269	2017-12-29 15:49:56+08	2017-12-29 16:14:32.975474+08
1019	contents/2017/12/30/IMG_1284.JPG	\N	36.0589066	120.335983	2017-12-31 00:41:25+08	2017-12-30 10:59:22.094017+08
1020	contents/2018/01/08/IMG_1414.jpg	\N	36.0548859	120.393799	2018-01-08 23:07:53+08	2018-01-08 15:33:36.366048+08
1021	contents/2018/01/10/IMG_1474.jpg	\N	37.3899193	126.949265	2018-01-10 18:17:17+08	2018-01-10 08:55:34.724413+08
1022	contents/2018/01/10/IMG_1474_1YiuNVo.jpg	\N	37.3899193	126.949265	2018-01-10 18:17:17+08	2018-01-10 08:56:27.567591+08
1023	contents/2018/01/10/IMG_0999.jpg	\N	37.7389832	120.442383	2018-01-10 14:44:05+08	2018-01-10 11:56:32.009596+08
1024	contents/2018/01/19/IMG_1483.jpg	\N	37.5717354	127.011345	2018-01-20 02:50:49+08	2018-01-19 10:22:39.548427+08
1025	contents/2018/01/19/IMG_1483_aPji3UD.jpg	\N	37.5717354	127.011345	2018-01-20 02:50:49+08	2018-01-19 10:25:46.142745+08
1026	contents/2018/01/19/IMG_0944.jpg	\N	36.0679321	120.400078	2018-01-20 01:50:47+08	2018-01-19 12:26:16.001863+08
1027	contents/2018/01/24/IMG_1252.jpg	\N	36.0162354	120.092155	2018-01-24 21:51:39+08	2018-01-24 14:20:05.713358+08
\.


--
-- Data for Name: blog_content_tag_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_content_tag_set (id, content_id, tag_id) FROM stdin;
23	8	1
24	8	2
25	8	3
26	8	4
27	8	5
28	8	6
29	8	7
30	8	8
31	8	9
32	8	10
33	8	11
38	16	1
39	16	2
40	16	3
41	16	4
42	16	5
43	16	6
44	16	7
45	16	8
46	16	9
47	16	10
48	16	11
49	17	5
50	17	21
51	17	22
52	17	23
53	17	24
54	17	25
55	18	5
56	18	12
57	18	21
58	18	22
59	18	23
60	19	21
61	19	23
62	19	24
63	19	26
64	19	27
65	20	5
66	20	21
67	20	26
68	20	28
69	20	29
78	22	24
79	22	39
80	22	38
81	22	30
92	24	33
93	24	35
94	24	37
95	24	49
96	25	50
97	25	51
98	25	52
99	25	23
100	26	53
101	28	34
102	28	35
103	28	37
104	28	54
105	28	30
106	28	31
107	29	30
108	29	31
109	29	34
110	29	54
111	29	55
112	29	56
113	29	57
114	29	58
115	29	59
116	29	60
117	30	30
118	31	64
119	31	65
120	31	66
121	31	67
122	31	68
123	31	69
124	31	70
125	31	71
126	31	30
127	31	61
128	31	62
129	31	63
130	33	5
131	33	72
132	33	21
133	33	22
134	33	23
135	33	24
136	33	25
137	34	5
138	34	12
139	34	21
140	34	22
141	34	23
142	34	24
143	34	25
144	35	73
145	35	74
146	35	21
147	35	30
148	35	31
149	36	73
150	36	75
151	36	76
152	36	77
153	36	21
154	36	30
155	37	78
156	38	79
157	39	80
158	39	34
159	39	30
160	39	31
161	40	37
162	40	54
163	40	55
164	40	30
165	40	31
166	41	81
167	41	82
168	41	83
169	41	84
170	41	55
171	41	30
172	41	31
173	42	3
174	42	4
175	42	6
176	42	78
177	42	85
178	42	86
179	42	87
180	42	88
181	43	3
182	43	4
183	43	5
184	43	6
185	43	7
186	43	39
187	43	78
188	43	86
189	43	87
190	43	88
191	43	89
192	43	90
193	43	91
194	43	92
195	43	93
196	43	94
197	44	96
198	44	81
199	44	82
200	44	95
201	45	40
202	45	97
203	45	46
204	46	1
205	46	2
206	46	3
207	46	4
208	46	5
209	46	6
210	46	7
211	46	10
212	47	34
213	47	98
214	47	54
215	47	24
216	47	30
217	48	12
218	48	14
219	48	15
220	48	99
221	48	100
222	48	101
223	48	102
224	48	103
225	48	104
226	49	40
227	49	105
228	49	106
229	50	40
230	51	107
231	51	108
232	51	55
233	52	79
234	53	30
235	54	96
236	54	81
237	54	82
238	54	95
239	55	33
240	55	35
241	55	37
242	55	49
243	56	33
244	56	35
245	56	37
246	56	49
247	57	33
248	57	35
249	57	37
250	57	49
251	60	40
252	61	40
253	62	38
254	62	109
255	62	30
256	62	31
257	63	84
258	63	105
259	63	110
260	63	111
261	63	112
262	63	113
263	63	114
264	63	115
265	63	116
266	63	53
267	64	81
268	64	53
269	64	117
270	64	118
271	65	120
272	65	81
273	65	118
274	65	119
275	66	1
276	66	3
277	66	4
278	66	5
279	66	6
280	66	87
281	66	29
282	66	121
283	66	122
284	66	123
285	66	124
286	66	125
287	67	5
288	67	30
289	68	128
290	68	129
291	68	130
292	68	131
293	68	78
294	68	126
295	68	127
296	69	129
297	69	131
298	69	132
299	69	133
300	69	134
301	69	5
302	69	135
303	69	136
304	69	137
305	69	138
306	69	126
307	69	127
308	70	3
309	70	4
310	70	5
311	70	6
312	70	29
313	71	3
314	71	4
315	71	5
316	71	6
317	71	9
318	71	139
319	71	24
320	71	29
321	72	3
322	72	4
323	72	5
324	72	6
325	72	24
326	73	3
327	73	4
328	73	5
329	73	6
330	73	140
331	73	87
332	73	24
333	73	29
334	74	5
335	74	12
336	74	141
337	74	142
338	74	81
339	74	82
340	74	21
341	74	99
342	74	104
343	75	3
344	75	4
345	75	5
346	75	6
347	75	140
348	75	24
349	75	29
350	76	5
351	76	12
352	76	14
353	76	143
354	76	144
355	76	81
356	76	82
357	76	145
358	76	30
359	77	3
360	77	4
361	77	5
362	77	6
363	77	140
364	77	146
365	77	29
366	78	3
367	78	4
368	78	5
369	78	6
370	78	147
371	78	122
372	79	3
373	79	4
374	79	5
375	79	6
376	79	140
377	79	122
378	80	3
379	80	4
380	80	5
381	80	6
382	80	24
383	80	30
384	81	12
385	81	141
386	81	143
387	81	81
388	81	82
389	82	3
390	82	5
391	82	12
392	82	141
393	82	143
394	83	1
395	83	3
396	83	4
397	83	5
398	83	6
399	83	12
400	83	141
401	83	148
402	84	4
403	84	5
404	84	149
405	84	21
406	84	150
407	84	28
408	84	29
409	84	99
410	84	103
411	85	4
412	85	5
413	85	149
414	85	28
415	85	29
416	86	3
417	86	4
418	86	5
419	86	6
420	86	9
421	86	139
422	86	87
423	86	151
424	86	92
425	86	29
426	86	121
427	86	123
428	87	6
429	89	152
430	91	5
431	91	153
432	91	154
433	91	126
434	91	127
435	93	140
436	93	78
437	93	154
438	93	155
439	93	156
440	93	157
441	94	154
442	95	158
443	95	159
444	96	154
445	97	155
446	98	1
447	98	3
448	98	4
449	98	5
450	98	6
451	98	28
452	98	29
453	99	73
454	99	74
455	99	21
456	99	26
457	99	30
458	99	160
459	99	161
460	99	162
461	99	55
462	99	63
463	100	163
464	100	164
465	100	165
466	100	60
467	100	63
468	101	3
469	101	4
470	101	5
471	101	6
472	101	12
473	101	141
474	101	26
475	101	104
476	101	122
477	101	124
478	102	3
479	102	4
480	102	5
481	102	6
482	102	9
483	102	12
484	102	141
485	102	142
486	102	122
487	103	40
488	103	105
489	103	166
490	104	40
491	104	46
492	104	167
493	105	40
494	105	169
495	105	168
496	106	40
497	106	105
498	106	106
499	107	167
500	107	40
501	107	105
502	107	170
503	107	41
504	107	106
505	107	46
506	108	166
507	108	40
508	108	105
509	108	106
510	108	171
511	108	113
512	109	40
513	109	41
514	109	48
515	110	30
516	110	34
517	110	172
518	110	173
519	110	174
520	110	175
521	110	176
522	110	177
523	111	30
524	111	178
525	111	179
526	111	180
527	111	181
528	111	182
529	111	183
530	111	184
531	111	185
532	111	186
533	111	187
534	111	188
535	111	189
536	111	110
537	111	111
538	111	112
539	111	114
540	111	115
541	112	192
542	112	193
543	112	194
544	112	40
545	112	169
546	112	190
547	112	191
548	113	3
549	113	4
550	113	139
551	113	49
552	113	55
553	113	30
554	114	26
555	114	21
556	115	195
557	115	5
558	115	6
559	115	39
560	115	139
561	115	30
562	116	196
563	116	197
564	116	30
565	116	39
566	117	3
567	117	4
568	117	6
569	117	39
570	117	30
571	118	26
572	118	3
573	118	139
574	118	6
575	119	3
576	119	198
577	119	6
578	119	139
579	119	26
580	121	4
581	121	5
582	121	12
583	121	141
584	121	143
585	121	16
586	121	81
587	121	82
588	121	145
589	122	1
590	122	3
591	122	4
592	122	5
593	122	6
594	122	199
595	122	12
596	122	141
597	122	142
598	122	24
599	123	4
600	123	5
601	123	12
602	123	141
603	123	143
604	124	4
605	124	200
606	124	201
607	124	202
608	124	139
609	124	29
610	124	30
611	124	176
612	124	55
613	125	34
614	125	200
615	125	176
616	125	54
617	125	55
618	125	30
619	125	31
620	126	38
621	126	55
622	126	30
623	126	31
624	127	195
625	127	4
626	127	200
627	127	201
628	127	203
629	127	139
630	127	30
631	127	176
632	127	55
633	128	3
634	128	4
635	128	5
636	128	6
637	128	9
638	128	204
639	128	142
640	128	29
641	128	99
642	128	102
643	128	103
644	129	4
645	129	5
646	129	12
647	129	141
648	129	14
649	129	143
650	129	81
651	129	82
652	129	99
653	130	30
654	131	30
655	132	81
656	132	30
657	132	31
658	133	38
659	133	55
660	133	30
661	133	31
662	134	3
663	134	4
664	134	6
665	134	103
666	134	102
667	134	9
668	134	139
669	135	5
670	135	198
671	135	205
672	135	206
673	135	207
674	135	30
675	136	30
676	137	3
677	137	4
678	137	5
679	137	6
680	137	139
681	138	3
682	138	4
683	138	139
684	139	200
685	139	208
686	139	209
687	139	55
688	139	30
689	140	210
690	141	37
691	141	79
692	141	210
693	141	211
694	141	212
695	142	79
696	142	210
697	142	211
698	142	212
699	142	213
700	142	214
701	142	215
702	142	216
703	142	37
704	143	3
705	143	4
706	143	5
707	144	3
708	144	4
709	144	5
710	144	6
711	144	81
712	144	82
713	144	29
714	144	30
715	145	217
716	145	218
717	145	124
718	145	159
719	146	4
720	146	200
721	146	201
722	146	55
723	146	30
724	147	3
725	147	4
726	147	5
727	147	6
728	147	81
729	147	219
730	147	30
731	148	103
732	148	200
733	148	201
734	148	139
735	148	176
736	148	55
737	148	30
738	149	3
739	149	4
740	149	5
741	149	200
742	149	9
743	149	139
744	149	204
745	149	24
746	149	29
747	149	30
748	149	102
749	149	103
750	149	55
751	150	81
752	150	82
753	150	219
754	150	119
755	151	81
756	151	82
757	151	219
758	152	1
759	152	3
760	152	4
761	152	5
762	152	6
763	152	204
764	152	24
765	152	220
766	152	29
767	152	102
768	152	103
769	153	81
770	154	200
771	154	30
772	154	55
773	155	50
774	155	127
775	156	129
776	156	126
777	156	127
778	157	129
779	157	50
780	157	222
781	157	221
782	157	126
783	157	127
784	158	223
785	158	224
786	158	225
787	158	226
788	158	227
789	158	228
790	158	229
791	158	230
792	158	231
793	159	4
794	159	210
795	159	214
796	159	29
797	159	232
798	159	233
799	159	234
800	159	235
801	159	236
802	159	237
803	160	4
804	160	210
805	160	214
806	160	28
807	160	29
808	160	30
809	160	233
810	160	236
811	160	237
812	161	74
813	161	75
814	161	21
815	161	23
816	161	24
817	161	26
818	161	238
819	161	239
820	161	240
821	161	241
822	161	242
823	161	243
824	161	244
825	161	245
826	161	246
827	162	74
828	162	75
829	162	77
830	162	21
831	162	23
832	162	26
833	162	238
834	162	239
835	162	240
836	162	241
837	162	242
838	162	243
839	163	74
840	163	75
841	163	21
842	163	149
843	163	24
844	163	28
845	163	39
846	163	238
847	163	239
848	163	240
849	163	243
850	163	244
851	164	131
852	164	5
853	164	74
854	164	75
855	164	77
856	164	82
857	164	21
858	164	24
859	164	26
860	164	28
861	164	39
862	164	238
863	164	243
864	165	134
865	165	21
866	165	24
867	165	39
868	165	75
869	165	77
870	165	222
871	165	238
872	165	239
873	165	240
874	165	241
875	165	242
876	165	243
877	165	244
878	165	245
879	165	246
880	165	247
881	165	248
882	165	249
883	166	75
884	166	77
885	166	21
886	166	23
887	166	24
888	166	222
889	166	238
890	166	239
891	166	240
892	167	2
893	167	3
894	167	6
895	167	49
896	167	21
897	167	26
898	168	2
899	168	3
900	168	36
901	168	6
902	168	49
903	169	2
904	169	3
905	169	36
906	169	6
907	169	49
908	170	2
909	170	3
910	170	6
911	170	10
912	170	77
913	170	84
914	170	36
915	170	49
916	171	2
917	171	3
918	171	6
919	171	49
920	171	84
921	172	2
922	172	6
923	172	77
924	172	84
925	172	21
926	173	1
927	173	2
928	173	3
929	173	4
930	173	5
931	173	7
932	173	9
933	173	122
934	173	250
935	174	26
936	174	5
937	175	3
938	175	4
939	175	5
940	175	6
941	176	1
942	176	3
943	176	4
944	176	5
945	176	6
946	176	9
947	176	10
948	177	30
949	178	53
950	179	81
951	179	117
952	179	118
953	179	119
954	179	120
955	180	33
956	180	35
957	180	37
958	180	78
959	180	79
960	180	251
961	181	252
962	181	253
963	181	30
964	182	117
965	182	118
966	183	2
967	183	3
968	183	5
969	183	12
970	183	141
971	183	24
972	184	24
973	184	3
974	184	5
975	184	39
976	185	3
977	185	5
978	185	198
979	185	205
980	185	18
981	185	24
982	185	162
983	185	254
984	185	255
985	186	256
986	186	257
987	186	205
988	186	206
989	186	147
990	186	117
991	186	118
992	186	252
993	186	255
994	187	3
995	187	5
996	187	198
997	187	12
998	187	205
999	187	206
1000	187	255
1001	188	258
1002	188	73
1003	188	74
1004	188	18
1005	188	21
1006	188	26
1007	188	160
1008	188	162
1009	188	49
1010	189	73
1011	189	74
1012	189	21
1013	189	26
1014	189	28
1015	189	160
1016	189	162
1017	189	39
1018	190	5
1019	191	162
1020	191	26
1021	191	21
1022	192	259
1023	192	26
1024	192	27
1025	193	131
1026	193	259
1027	193	260
1028	193	74
1029	193	77
1030	193	18
1031	193	21
1032	193	23
1033	193	24
1034	193	26
1035	193	27
1036	193	28
1037	193	162
1038	194	259
1039	194	261
1040	194	12
1041	194	77
1042	194	23
1043	194	24
1044	194	27
1045	195	261
1046	195	199
1047	195	12
1048	195	141
1049	195	77
1050	195	21
1051	195	23
1052	195	24
1053	195	26
1054	195	162
1055	195	104
1056	196	259
1057	196	131
1058	196	77
1059	196	18
1060	196	23
1061	196	26
1062	196	27
1063	197	259
1064	197	77
1065	197	21
1066	197	23
1067	197	26
1068	197	27
1069	198	12
1070	198	21
1071	199	5
1072	199	21
1073	199	23
1074	199	26
1075	199	27
1076	200	160
1077	200	162
1078	200	73
1079	200	74
1080	200	21
1081	200	26
1082	201	162
1083	201	73
1084	201	74
1085	201	21
1086	201	26
1087	202	131
1088	202	5
1089	202	74
1090	202	18
1091	202	24
1092	202	26
1093	202	160
1094	202	162
1095	202	255
1096	203	131
1097	203	5
1098	203	21
1099	203	26
1100	203	28
1101	204	3
1102	204	5
1103	204	6
1104	204	9
1105	204	12
1106	204	141
1107	204	24
1108	206	3
1109	206	5
1110	206	6
1111	206	262
1112	206	84
1113	206	28
1114	206	29
1115	207	3
1116	208	49
1117	208	2
1118	208	3
1119	208	6
1120	209	49
1121	209	118
1122	209	30
1123	209	55
1124	210	1
1125	210	3
1126	210	4
1127	210	6
1128	210	49
1129	211	1
1130	211	2
1131	211	3
1132	211	4
1133	211	5
1134	211	6
1135	211	29
1136	211	39
1137	211	121
1138	212	1
1139	212	2
1140	212	3
1141	212	4
1142	212	5
1143	212	6
1144	212	9
1145	212	141
1146	212	124
1147	213	1
1148	213	3
1149	213	4
1150	213	5
1151	213	6
1152	213	9
1153	213	24
1154	213	124
1155	214	1
1156	214	2
1157	214	3
1158	214	4
1159	214	5
1160	214	6
1161	214	9
1162	214	10
1163	215	1
1164	215	2
1165	215	3
1166	215	4
1167	215	6
1168	216	195
1169	216	4
1170	216	202
1171	216	139
1172	216	83
1173	216	29
1174	216	30
1175	216	55
1176	217	1
1177	217	2
1178	217	3
1179	217	4
1180	217	5
1181	218	1
1182	218	2
1183	218	3
1184	218	4
1185	218	5
1186	218	9
1187	218	10
1188	219	38
1189	219	34
1190	219	30
1191	219	31
1192	220	1
1193	220	3
1194	220	4
1195	220	5
1196	220	30
1197	221	1
1198	221	3
1199	221	4
1200	221	21
1201	221	30
1202	222	26
1203	222	3
1204	222	5
1205	223	1
1206	223	3
1207	223	4
1208	223	6
1209	223	29
1210	224	3
1211	224	4
1212	224	147
1213	224	6
1214	225	2
1215	226	35
1216	227	37
1217	227	30
1218	227	263
1219	228	5
1220	228	264
1221	228	81
1222	228	82
1223	228	21
1224	229	33
1225	229	35
1226	229	147
1227	229	37
1228	230	24
1229	230	30
1230	231	1
1231	231	2
1232	231	3
1233	231	4
1234	231	5
1235	231	6
1236	231	10
1237	231	21
1238	232	1
1239	232	2
1240	232	3
1241	232	4
1242	232	5
1243	232	6
1244	232	9
1245	232	10
1246	232	250
1247	233	1
1248	233	2
1249	233	3
1250	233	4
1251	233	5
1252	233	6
1253	233	7
1254	233	9
1255	233	10
1256	234	1
1257	234	2
1258	234	3
1259	234	4
1260	234	5
1261	234	6
1262	234	7
1263	234	9
1264	234	10
1265	234	250
1266	235	34
1267	235	38
1268	235	265
1269	235	266
1270	235	53
1271	235	30
1272	235	31
1273	236	53
1274	236	27
1275	236	37
1276	236	6
1277	237	267
1278	237	268
1279	237	269
1280	237	270
1281	237	271
1282	237	272
1283	237	35
1284	237	37
1285	238	3
1286	238	37
1287	238	6
1288	238	232
1289	238	267
1290	239	31
1291	239	30
1292	239	55
1293	240	152
1294	240	273
1295	240	50
1296	240	27
1297	241	37
1298	241	266
1299	241	81
1300	241	274
1301	241	116
1302	241	53
1303	242	3
1304	242	9
1305	242	139
1306	242	275
1307	242	276
1308	242	277
1309	242	278
1310	242	151
1311	242	280
1312	242	281
1313	242	282
1314	242	279
1315	242	37
1316	243	3
1317	243	198
1318	243	263
1319	243	9
1320	243	139
1321	243	277
1322	243	151
1323	243	283
1324	244	3
1325	244	5
1326	244	6
1327	244	198
1328	244	9
1329	244	139
1330	244	151
1331	245	3
1332	245	6
1333	245	9
1334	245	139
1335	245	30
1336	246	3
1337	246	198
1338	246	263
1339	246	9
1340	246	139
1341	246	30
1342	247	33
1343	247	35
1344	247	37
1345	248	35
1346	249	49
1347	249	2
1348	249	3
1349	249	6
1350	250	4
1351	250	39
1352	250	55
1353	250	24
1354	250	30
1355	250	31
1356	251	1
1357	251	2
1358	251	3
1359	251	4
1360	251	5
1361	251	6
1362	251	8
1363	251	9
1364	251	21
1365	251	26
1366	251	122
1367	252	77
1368	252	21
1369	252	150
1370	252	23
1371	252	149
1372	252	24
1373	252	284
1374	252	285
1375	252	286
1376	252	100
1377	252	238
1378	253	126
1379	253	78
1380	253	127
1381	254	9
1382	254	30
1383	254	287
1384	254	288
1385	254	289
1386	254	290
1387	254	291
1388	254	292
1389	254	37
1390	254	108
1391	254	172
1392	254	174
1393	254	177
1394	254	55
1395	255	200
1396	255	9
1397	255	139
1398	255	30
1399	255	287
1400	255	37
1401	255	108
1402	255	174
1403	255	177
1404	255	55
1405	256	200
1406	256	9
1407	256	139
1408	256	140
1409	256	30
1410	256	287
1411	256	288
1412	256	289
1413	256	293
1414	256	107
1415	256	108
1416	256	174
1417	256	177
1418	256	55
1419	257	9
1420	257	139
1421	257	140
1422	257	30
1423	257	287
1424	257	288
1425	257	289
1426	257	291
1427	257	293
1428	257	37
1429	257	174
1430	257	177
1431	257	55
1432	257	200
1433	257	107
1434	257	108
1435	258	200
1436	258	139
1437	258	108
1438	258	174
1439	258	177
1440	258	30
1441	258	287
1442	259	200
1443	259	139
1444	259	30
1445	259	287
1446	259	288
1447	259	289
1448	259	292
1449	259	37
1450	259	293
1451	259	108
1452	259	174
1453	259	177
1454	259	55
1455	260	9
1456	260	139
1457	260	30
1458	260	287
1459	260	288
1460	260	289
1461	260	290
1462	260	291
1463	260	292
1464	260	293
1465	260	174
1466	260	177
1467	260	55
1468	260	200
1469	260	107
1470	260	108
1471	261	9
1472	261	139
1473	261	140
1474	261	30
1475	261	287
1476	261	288
1477	261	289
1478	261	290
1479	261	291
1480	261	292
1481	261	293
1482	261	172
1483	261	174
1484	261	177
1485	261	55
1486	261	200
1487	261	107
1488	261	108
1489	262	200
1490	262	139
1491	262	30
1492	262	287
1493	262	288
1494	262	289
1495	262	291
1496	262	292
1497	262	37
1498	262	108
1499	262	174
1500	262	177
1501	263	200
1502	263	139
1503	263	30
1504	263	287
1505	263	288
1506	263	289
1507	263	291
1508	263	292
1509	263	37
1510	263	108
1511	263	172
1512	263	174
1513	263	177
1514	263	55
1515	264	9
1516	264	139
1517	264	30
1518	264	287
1519	264	288
1520	264	289
1521	264	290
1522	264	291
1523	264	292
1524	264	37
1525	264	172
1526	264	174
1527	264	177
1528	264	55
1529	264	200
1530	264	108
1531	265	200
1532	265	139
1533	265	30
1534	265	287
1535	265	288
1536	265	289
1537	265	291
1538	265	292
1539	265	108
1540	265	172
1541	265	174
1542	265	177
1543	265	55
1544	266	200
1545	266	139
1546	266	30
1547	266	287
1548	266	292
1549	266	108
1550	266	172
1551	266	174
1552	266	177
1553	267	200
1554	267	139
1555	267	30
1556	267	287
1557	267	108
1558	267	174
1559	267	177
1560	267	55
1561	268	200
1562	268	9
1563	268	139
1564	268	30
1565	268	287
1566	268	288
1567	268	292
1568	268	37
1569	268	108
1570	268	174
1571	268	177
1572	268	55
1573	269	200
1574	269	9
1575	269	139
1576	269	30
1577	269	287
1578	269	288
1579	269	292
1580	269	107
1581	269	108
1582	269	174
1583	269	177
1584	269	55
1585	270	200
1586	270	9
1587	270	139
1588	270	30
1589	270	287
1590	270	288
1591	270	290
1592	270	292
1593	270	37
1594	270	108
1595	270	174
1596	270	177
1597	270	55
1598	271	200
1599	271	9
1600	271	139
1601	271	30
1602	271	287
1603	271	288
1604	271	108
1605	271	174
1606	271	177
1607	271	55
1608	272	200
1609	272	9
1610	272	139
1611	272	30
1612	272	287
1613	272	288
1614	272	108
1615	272	174
1616	272	177
1617	272	55
1618	273	200
1619	273	9
1620	273	139
1621	273	30
1622	273	287
1623	273	288
1624	273	290
1625	273	291
1626	273	37
1627	273	108
1628	273	174
1629	273	177
1630	273	55
1631	274	200
1632	274	9
1633	274	139
1634	274	30
1635	274	287
1636	274	288
1637	274	108
1638	274	174
1639	274	177
1640	275	290
1641	275	3
1642	275	37
1643	275	6
1644	275	9
1645	276	37
1646	276	294
1647	276	295
1648	276	296
1649	276	9
1650	276	297
1651	276	147
1652	277	5
1653	277	198
1654	277	295
1655	277	79
1656	277	147
1657	278	37
1658	278	9
1659	278	139
1660	278	147
1661	278	55
1662	278	30
1663	279	40
1664	279	298
1665	279	43
1666	280	48
1667	280	30
1668	280	208
1669	281	33
1670	281	35
1671	281	293
1672	281	208
1673	281	48
1674	281	30
1675	282	4
1676	282	5
1677	282	103
1678	282	28
1679	282	29
1680	283	81
1681	283	82
1682	283	299
1683	283	79
1684	284	35
1685	284	30
1686	285	35
1687	285	55
1688	285	56
1689	285	30
1690	285	31
1691	286	199
1692	286	12
1693	286	21
1694	286	22
1695	286	27
1696	286	104
1697	286	300
1698	286	301
1699	287	5
1700	287	104
1701	287	300
1702	287	12
1703	287	22
1704	288	5
1705	288	104
1706	288	12
1707	288	300
1708	288	21
1709	288	22
1710	288	23
1711	289	5
1712	289	21
1713	289	22
1714	289	23
1715	289	24
1716	289	27
1717	289	300
1718	289	301
1719	290	4
1720	290	234
1721	290	236
1722	290	237
1723	290	29
1724	290	30
1725	291	4
1726	291	5
1727	291	81
1728	291	82
1729	291	28
1730	291	29
1731	291	234
1732	291	235
1733	291	237
1734	291	302
1735	291	303
1736	291	304
1737	291	305
1738	292	4
1739	292	5
1740	292	28
1741	292	29
1742	292	302
1743	292	303
1744	292	305
1745	292	81
1746	292	82
1747	292	87
1748	292	95
1749	292	233
1750	292	234
1751	292	235
1752	292	236
1753	292	237
1754	293	4
1755	293	5
1756	293	82
1757	293	28
1758	293	29
1759	293	233
1760	293	234
1761	293	235
1762	293	237
1763	293	302
1764	293	303
1765	293	304
1766	293	305
1767	294	2
1768	294	3
1769	294	131
1770	294	18
1771	294	21
1772	294	26
1773	294	28
1774	294	29
1775	294	49
1776	294	306
1777	295	2
1778	295	3
1779	295	6
1780	295	18
1781	295	21
1782	295	26
1783	295	28
1784	295	29
1785	295	162
1786	295	39
1787	295	49
1788	295	306
1789	296	3
1790	296	139
1791	296	6
1792	296	92
1793	297	26
1794	297	27
1795	297	21
1796	297	23
1797	298	3
1798	298	4
1799	298	5
1800	298	6
1801	298	9
1802	298	139
1803	298	29
1804	298	307
1805	299	49
1806	299	140
1807	300	3
1808	300	124
1809	300	5
1810	300	6
1811	301	3
1812	301	124
1813	302	3
1814	302	30
1815	303	3
1816	303	4
1817	303	5
1818	303	6
1819	303	9
1820	303	139
1821	303	278
1822	303	151
1823	304	3
1824	304	9
1825	304	139
1826	304	6
1827	305	3
1828	305	5
1829	305	6
1830	305	9
1831	305	139
1832	305	278
1833	305	151
1834	305	280
1835	305	37
1836	305	294
1837	305	296
1838	306	3
1839	306	5
1840	306	37
1841	306	9
1842	306	139
1843	306	278
1844	306	151
1845	307	264
1846	307	9
1847	307	139
1848	307	6
1849	308	3
1850	308	6
1851	308	264
1852	308	9
1853	308	139
1854	309	264
1855	309	9
1856	309	139
1857	309	276
1858	309	278
1859	309	151
1860	309	37
1861	309	308
1862	309	309
1863	310	3
1864	310	37
1865	310	294
1866	310	296
1867	310	139
1868	310	310
1869	313	3
1870	313	5
1871	313	6
1872	313	9
1873	313	139
1874	313	278
1875	313	151
1876	313	311
1877	313	121
1878	314	3
1879	314	5
1880	314	6
1881	314	198
1882	314	314
1883	314	124
1884	314	307
1885	314	312
1886	314	313
1887	314	250
1888	314	315
1889	314	316
1890	314	317
1891	315	9
1892	315	139
1893	317	320
1894	317	198
1895	317	152
1896	317	314
1897	317	124
1898	317	318
1899	317	319
1900	318	321
1901	318	2
1902	318	273
1903	318	152
1904	318	27
1905	318	124
1906	318	318
1907	319	322
1908	319	3
1909	319	37
1910	319	6
1911	319	124
1912	320	35
1913	320	37
1914	320	6
1915	321	81
1916	321	82
1917	322	3
1918	322	37
1919	322	294
1920	322	6
1921	323	3
1922	323	37
1923	323	5
1924	323	6
1925	323	139
1926	326	37
1927	327	3
1928	327	6
1929	327	9
1930	327	139
1931	327	87
1932	327	124
1933	329	3
1934	329	5
1935	329	198
1936	329	9
1937	329	139
1938	329	151
1939	329	122
1940	330	3
1941	330	323
1942	330	5
1943	330	198
1944	330	9
1945	330	139
1946	330	275
1947	330	276
1948	330	151
1949	330	282
1950	330	283
1951	330	308
1952	331	324
1953	331	198
1954	331	135
1955	331	263
1956	331	139
1957	331	283
1958	331	30
1959	331	31
1960	331	33
1961	331	34
1962	331	54
1963	331	55
1964	332	3
1965	332	198
1966	332	9
1967	332	139
1968	332	151
1969	333	198
1970	333	264
1971	333	9
1972	333	139
1973	333	308
1974	333	151
1975	334	3
1976	334	37
1977	334	198
1978	334	9
1979	334	139
1980	334	151
1981	335	3
1982	335	37
1983	335	198
1984	335	5
1985	335	296
1986	335	9
1987	335	139
1988	336	196
1989	336	5
1990	336	4
1991	336	109
1992	336	82
1993	336	87
1994	337	296
1995	337	37
1996	338	9
1997	338	3
1998	338	139
1999	339	3
2000	339	5
2001	339	198
2002	339	9
2003	339	139
2004	339	205
2005	339	206
2006	339	37
2007	340	198
2008	340	9
2009	340	139
2010	340	205
2011	340	207
2012	340	314
2013	340	124
2014	341	3
2015	341	198
2016	341	263
2017	341	9
2018	341	139
2019	341	205
2020	341	151
2021	341	37
2022	342	198
2023	342	139
2024	342	205
2025	342	147
2026	342	314
2027	342	124
2028	343	3
2029	343	198
2030	343	9
2031	343	139
2032	343	205
2033	343	151
2034	343	283
2035	344	3
2036	344	5
2037	344	198
2038	344	263
2039	344	6
2040	344	9
2041	344	139
2042	344	283
2043	345	53
2044	345	139
2045	345	325
2046	345	37
2047	346	3
2048	346	5
2049	346	6
2050	346	326
2051	346	9
2052	346	139
2053	346	278
2054	346	151
2055	346	279
2056	346	37
2057	347	3
2058	347	6
2059	347	267
2060	347	147
2061	347	30
2062	347	35
2063	347	37
2064	347	49
2065	348	82
2066	348	147
2067	348	4
2068	348	6
2069	350	124
2070	351	81
2071	353	3
2072	353	6
2073	353	310
2074	353	86
2075	353	87
2076	357	139
2077	358	139
2078	359	3
2079	359	4
2080	359	5
2081	359	6
2082	359	9
2083	359	139
2084	359	278
2085	359	151
2086	359	24
2087	359	92
2088	359	39
2089	359	121
2090	360	3
2091	360	5
2092	360	6
2093	360	81
2094	360	84
2095	361	3
2096	361	4
2097	361	5
2098	361	6
2099	361	9
2100	361	139
2101	361	278
2102	361	151
2103	361	280
2104	361	121
2105	361	313
2106	364	3
2107	364	5
2108	364	6
2109	364	147
2110	364	122
2111	364	124
2112	365	1
2113	365	3
2114	365	4
2115	365	5
2116	365	6
2117	365	9
2118	365	24
2119	365	124
2120	366	3
2121	366	5
2122	366	6
2123	366	9
2124	366	139
2125	366	151
2126	366	37
2127	366	311
2128	367	9
2129	367	5
2130	367	3
2131	367	37
2132	368	2
2133	368	3
2134	368	6
2135	368	264
2136	368	9
2137	368	267
2138	368	139
2139	368	147
2140	368	35
2141	368	37
2142	368	294
2143	368	49
2144	369	3
2145	369	27
2146	369	6
2147	369	327
2148	370	3
2149	371	81
2150	371	147
2151	371	79
2152	372	81
2153	373	3
2154	373	4
2155	374	1
2156	374	2
2157	374	3
2158	374	4
2159	374	5
2160	374	6
2161	375	1
2162	375	2
2163	375	3
2164	375	4
2165	375	5
2166	375	7
2167	375	9
2168	375	10
2169	376	1
2170	376	3
2171	376	4
2172	376	5
2173	376	7
2174	376	10
2175	377	1
2176	377	2
2177	377	3
2178	377	4
2179	377	5
2180	377	8
2181	377	21
2182	377	26
2183	378	1
2184	378	3
2185	378	4
2186	378	5
2187	378	7
2188	378	9
2189	378	10
2190	379	1
2191	379	3
2192	379	4
2193	379	5
2194	379	7
2195	379	9
2196	379	10
2197	379	250
2198	379	124
2199	380	24
2200	380	2
2201	380	3
2202	380	5
2203	381	131
2204	381	5
2205	381	18
2206	381	21
2207	381	24
2208	381	26
2209	381	28
2210	381	162
2211	381	39
2212	382	3
2213	382	4
2214	382	5
2215	382	205
2216	382	24
2217	383	26
2218	384	1
2219	384	3
2220	384	4
2221	384	5
2222	384	6
2223	384	7
2224	384	9
2225	385	34
2226	385	118
2227	385	4
2228	385	30
2229	386	3
2230	386	4
2231	386	6
2232	386	328
2233	386	140
2234	386	55
2235	386	30
2236	387	4
2237	387	6
2238	387	328
2239	387	140
2240	387	21
2241	387	55
2242	387	30
2243	388	3
2244	388	4
2245	388	5
2246	388	6
2247	388	328
2248	388	140
2249	388	121
2250	389	256
2251	389	257
2252	389	4
2253	389	140
2254	389	30
2255	389	34
2256	389	39
2257	389	55
2258	389	56
2259	389	60
2260	389	328
2261	389	329
2262	389	330
2263	389	117
2264	389	118
2265	389	252
2266	390	256
2267	390	257
2268	390	4
2269	390	328
2270	390	329
2271	390	331
2272	390	140
2273	390	30
2274	390	31
2275	390	34
2276	390	117
2277	390	118
2278	390	55
2279	390	252
2280	391	256
2281	391	257
2282	391	4
2283	391	200
2284	391	328
2285	391	201
2286	391	139
2287	391	332
2288	391	30
2289	391	108
2290	391	117
2291	391	118
2292	391	55
2293	392	4
2294	392	200
2295	392	201
2296	392	328
2297	392	333
2298	392	30
2299	392	118
2300	392	55
2301	393	200
2302	393	139
2303	393	54
2304	393	55
2305	393	118
2306	393	30
2307	394	256
2308	394	257
2309	394	4
2310	394	139
2311	394	30
2312	394	55
2313	394	200
2314	394	329
2315	394	328
2316	394	201
2317	394	332
2318	394	202
2319	394	108
2320	394	117
2321	394	118
2322	394	252
2323	395	3
2324	395	4
2325	395	5
2326	395	6
2327	395	334
2328	395	147
2329	395	122
2330	396	3
2331	396	4
2332	396	6
2333	397	81
2334	397	84
2335	397	4
2336	397	118
2337	398	3
2338	398	5
2339	398	6
2340	398	39
2341	398	147
2342	399	3
2343	399	5
2344	399	6
2345	399	39
2346	400	1
2347	400	3
2348	400	4
2349	400	5
2350	400	6
2351	400	9
2352	400	139
2353	400	24
2354	400	92
2355	401	1
2356	401	3
2357	401	4
2358	401	5
2359	401	6
2360	401	147
2361	401	122
2362	402	6
2363	403	131
2364	403	260
2365	403	306
2366	403	50
2367	403	315
2368	403	335
2369	403	336
2370	403	337
2371	403	338
2372	403	339
2373	403	340
2374	403	341
2375	403	342
2376	403	87
2377	403	344
2378	403	345
2379	403	346
2380	403	347
2381	403	343
2382	403	124
2383	404	3
2384	404	4
2385	404	6
2386	404	29
2387	404	95
2388	405	26
2389	405	2
2390	405	29
2391	405	6
2392	406	1
2393	406	3
2394	406	4
2395	406	5
2396	406	6
2397	406	39
2398	406	49
2399	406	121
2400	407	3
2401	407	4
2402	407	5
2403	407	6
2404	407	205
2405	407	206
2406	407	26
2407	407	30
2408	408	128
2409	408	129
2410	408	131
2411	408	132
2412	408	5
2413	408	137
2414	408	126
2415	408	127
2416	410	40
2417	410	169
2418	410	191
2419	410	208
2420	410	348
2421	410	349
2422	410	350
2423	410	351
2424	410	352
2425	410	353
2426	410	354
2427	410	355
2428	410	356
2429	410	357
2430	410	358
2431	410	359
2432	410	360
2433	410	361
2434	410	362
2435	411	37
2436	412	129
2437	412	131
2438	412	132
2439	412	5
2440	412	137
2441	412	138
2442	412	363
2443	412	126
2444	412	127
2445	413	4
2446	413	5
2447	413	81
2448	413	82
2449	413	28
2450	413	29
2451	413	95
2452	413	39
2453	413	303
2454	414	3
2455	414	4
2456	414	5
2457	414	6
2458	415	4
2459	415	200
2460	415	55
2461	415	28
2462	415	29
2463	415	30
2464	416	210
2465	416	212
2466	416	364
2467	417	366
2468	417	37
2469	417	365
2470	417	310
2471	419	167
2472	419	40
2473	419	105
2474	419	41
2475	419	169
2476	419	367
2477	419	368
2478	419	369
2479	419	370
2480	419	371
2481	420	32
2482	420	37
2483	420	30
2484	421	30
2485	421	31
2486	421	33
2487	421	34
2488	421	35
2489	421	37
2490	421	372
2491	421	373
2492	421	54
2493	421	374
2494	422	3
2495	422	4
2496	422	5
2497	422	6
2498	422	21
2499	422	26
2500	423	135
2501	423	172
2502	423	375
2503	423	376
2504	423	377
2505	423	378
2506	424	37
2507	424	38
2508	424	54
2509	424	379
2510	424	30
2511	424	31
2512	425	2
2513	425	263
2514	425	213
2515	425	33
2516	425	35
2517	425	37
2518	425	364
2519	425	49
2520	425	380
2521	426	384
2522	426	78
2523	426	89
2524	426	33
2525	426	35
2526	426	37
2527	426	48
2528	426	56
2529	426	381
2530	426	382
2531	426	383
2532	427	40
2533	427	41
2534	427	48
2535	427	208
2536	427	30
5001	1001	40
5002	1001	193
5003	1001	190
5004	1002	40
5005	1002	193
5006	1002	190
5007	1003	40
5008	1004	40
5009	1004	41
5010	1004	105
5011	1004	169
5012	1004	1000
5013	1004	369
5014	1004	371
5015	1005	40
5016	1006	40
5017	1006	41
5018	1006	105
5019	1006	169
5020	1006	1000
5021	1006	369
5022	1006	371
5023	1007	40
5024	1008	167
5025	1008	40
5026	1008	105
5027	1008	41
5028	1008	169
5029	1008	367
5030	1008	368
5031	1008	369
5032	1008	370
5033	1008	371
5034	1009	167
5035	1009	40
5036	1009	105
5037	1009	41
5038	1009	169
5039	1009	367
5040	1009	368
5041	1009	369
5042	1009	370
5043	1009	371
5044	1010	167
5045	1010	40
5046	1010	105
5047	1010	41
5048	1010	169
5049	1010	367
5050	1010	368
5051	1010	369
5052	1010	370
5053	1010	371
5054	1011	167
5055	1011	40
5056	1011	105
5057	1011	41
5058	1011	169
5059	1011	367
5060	1011	368
5061	1011	369
5062	1011	370
5063	1011	371
5064	1012	167
5065	1012	40
5066	1012	105
5067	1012	41
5068	1012	169
5069	1012	367
5070	1012	368
5071	1012	369
5072	1012	370
5073	1012	371
5074	1013	167
5075	1013	40
5076	1013	105
5077	1013	41
5078	1013	169
5079	1013	367
5080	1013	368
5081	1013	369
5082	1013	370
5083	1013	371
5084	1014	167
5085	1014	40
5086	1014	105
5087	1014	41
5088	1014	169
5089	1014	367
5090	1014	368
5091	1014	369
5092	1014	370
5093	1014	371
5094	1015	167
5095	1015	40
5096	1015	105
5097	1015	41
5098	1015	169
5099	1015	367
5100	1015	368
5101	1015	369
5102	1015	370
5103	1015	371
5104	1016	167
5105	1016	40
5106	1016	105
5107	1016	41
5108	1016	169
5109	1016	367
5110	1016	368
5111	1016	369
5112	1016	370
5113	1016	371
5114	1017	167
5115	1017	40
5116	1017	105
5117	1017	41
5118	1017	169
5119	1017	367
5120	1017	368
5121	1017	369
5122	1017	370
5123	1017	371
5124	1018	167
5125	1018	40
5126	1018	105
5127	1018	41
5128	1018	169
5129	1018	367
5130	1018	368
5131	1018	369
5132	1018	370
5133	1018	371
5134	1019	3
5135	1019	4
5136	1019	5
5137	1019	6
5138	1019	7
5139	1019	88
5140	1019	24
5141	1019	91
5142	1020	3
5143	1020	4
5144	1020	5
5145	1020	7
5146	1020	12
5147	1020	141
5148	1020	142
5149	1020	16
5150	1020	91
5151	1022	79
5152	1022	213
5153	1022	33
5154	1022	35
5155	1022	36
5156	1022	37
5157	1022	296
5158	1022	364
5159	1022	1004
5160	1022	1005
5161	1022	1006
5162	1022	48
5163	1022	1007
5164	1022	380
5165	1023	3
5166	1023	4
5167	1023	5
5168	1023	6
5169	1023	12
5170	1023	24
5171	1024	40
5172	1024	105
5173	1024	106
5174	1024	171
5175	1024	1009
5176	1024	1010
5177	1024	113
5178	1024	1011
5179	1024	186
5180	1025	40
5181	1025	105
5182	1025	106
5183	1025	171
5184	1025	1009
5185	1025	1010
5186	1025	113
5187	1025	1011
5188	1025	186
5189	1026	3
5190	1026	4
5191	1026	5
5192	1026	6
5193	1026	24
5194	1026	26
5195	1027	96
5196	1027	81
5197	1027	82
5198	1027	1012
5199	1027	95
\.


--
-- Data for Name: blog_invitee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_invitee (id, create_dt, theme_id, user_id) FROM stdin;
6	2017-12-26 06:23:21.818905+08	4	3
7	2017-12-26 06:23:21.914601+08	4	2
\.


--
-- Data for Name: blog_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_like (id, post_id, user_id, create_dt) FROM stdin;
7	53	2	2017-12-21 06:01:27.904445+08
12	51	2	2017-12-21 08:37:17.576286+08
13	50	2	2017-12-21 08:37:22.919046+08
14	49	2	2017-12-21 08:37:25.744233+08
15	55	4	2017-12-22 02:25:05.358809+08
18	55	2	2017-12-22 03:28:12.141223+08
20	53	4	2017-12-22 03:29:23.65157+08
21	52	4	2017-12-22 03:29:25.472278+08
22	51	4	2017-12-22 03:29:26.900067+08
23	52	2	2017-12-22 10:41:39.089139+08
24	55	1	2017-12-22 10:42:27.414919+08
25	53	1	2017-12-22 10:43:05.458912+08
26	52	1	2017-12-22 10:43:33.133263+08
27	51	1	2017-12-22 10:43:48.544425+08
28	49	1	2017-12-22 12:22:52.571744+08
30	283	2	2017-12-23 00:58:50.044829+08
31	318	2	2017-12-23 01:02:36.919047+08
32	317	2	2017-12-23 01:03:41.536984+08
33	427	3	2017-12-23 01:40:20.524317+08
34	427	1	2017-12-24 06:17:51.15664+08
36	435	3	2017-12-25 01:14:46.709646+08
37	440	1	2017-12-25 10:05:05.315824+08
39	435	2	2017-12-26 07:19:10.967243+08
40	427	2	2017-12-26 07:19:55.244917+08
41	426	2	2017-12-26 07:20:06.065207+08
42	424	3	2017-12-26 07:22:06.274527+08
43	443	3	2017-12-26 07:22:27.793705+08
1001	1018	3	2017-12-29 16:39:55.777109+08
1002	1018	1	2017-12-29 16:43:55.924036+08
1003	1002	1	2017-12-29 16:44:11.430664+08
1004	444	1	2017-12-29 16:44:29.283984+08
1005	443	1	2017-12-29 16:44:40.91949+08
1006	1020	1	2018-01-10 09:13:42.155594+08
1007	1023	3	2018-01-19 17:04:21.546821+08
1008	1027	1	2018-01-24 14:21:12.000519+08
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post (id, text, address, lat, lng, create_dt, author_id, is_public, theme_id) FROM stdin;
16	설악산 등산	\N	36.058773	120.331207	2017-12-01 08:41:32.335668+08	1	t	1
17	중국 청도의 생선집	\N	36.0735245	120.393967	2017-12-01 08:42:34.521441+08	1	t	3
19	중국 청도 기행	\N	36.0589561	120.331169	2017-12-01 08:46:21.810168+08	1	t	2
20	중국 황산 기행	\N	30.1379299	118.158852	2017-12-01 23:21:05.482676+08	1	t	4
21	중국 광주 방문	\N	23.1190453	113.32843	2017-12-01 23:29:06.385138+08	1	t	4
23	친구와 운동	\N	36.8088913	120.203392	2017-12-02 00:42:45.371369+08	1	t	5
26	동대문	\N	37.5710373	127.010071	2017-12-07 09:00:51.641529+08	1	t	6
27	공항	\N	36.2689056	120.380463	2017-12-07 09:01:19.259442+08	1	t	5
29	\N	\N	35.9526482	120.176529	2017-12-14 11:43:27.45177+08	3	t	6
30	\N	\N	35.9519424	120.176132	2017-12-14 11:43:40.620153+08	3	t	6
31	\N	\N	37.5668335	121.245499	2017-12-14 11:43:54.813819+08	3	t	6
32	\N	\N	35.974926	120.171722	2017-12-14 11:43:59.920324+08	3	t	6
33	\N	\N	36.0550499	120.208092	2017-12-14 11:44:04.47612+08	3	t	6
34	\N	\N	30.1409359	118.152649	2017-12-14 11:44:10.192551+08	3	t	6
35	\N	\N	30.1366425	118.158989	2017-12-14 11:44:22.446914+08	3	t	6
36	\N	\N	36.8088646	120.203415	2017-12-14 11:44:28.915925+08	3	t	6
37	\N	\N	36.8101997	120.204247	2017-12-14 11:44:35.218773+08	3	t	6
38	\N	\N	35.9522781	120.180389	2017-12-14 11:44:42.282345+08	3	t	6
39	\N	\N	35.9448013	120.183052	2017-12-14 11:44:48.557446+08	3	t	6
40	\N	\N	32.8194466	-117.251266	2017-12-14 11:44:53.320143+08	3	t	6
41	\N	\N	36.0661774	120.395576	2017-12-14 11:44:58.387786+08	3	t	6
42	\N	\N	37.5614815	121.267921	2017-12-14 11:45:05.148792+08	3	t	6
43	\N	\N	37.7379036	120.437088	2017-12-14 11:45:11.849721+08	3	t	6
44	\N	\N	23.1190948	113.328476	2017-12-14 11:45:30.153627+08	3	t	6
45	\N	\N	36.0159683	120.086792	2017-12-14 11:45:41.530758+08	3	t	6
46	\N	\N	36.0206375	120.080849	2017-12-14 11:45:56.671426+08	3	t	6
47	\N	\N	36.0589294	120.331139	2017-12-14 11:46:09.753673+08	3	t	6
48	\N	\N	36.0741692	120.444801	2017-12-14 11:46:50.419149+08	3	t	6
49	\N	\N	36.0524292	120.382507	2017-12-14 11:47:19.920381+08	3	t	6
50	\N	\N	36.0000229	120.125519	2017-12-14 11:47:30.064809+08	3	t	6
51	\N	\N	35.9739647	120.159523	2017-12-14 11:47:50.931868+08	3	t	6
52	\N	\N	37.6128082	127.078217	2017-12-14 11:47:56.437192+08	3	t	6
53	회사 송년회	\N	35.9448013	120.183052	2017-12-21 04:43:21.96457+08	2	t	6
55	청도의 우산 차.	\N	36.0159683	120.086792	2017-12-21 08:21:46.363219+08	2	t	7
69	\N	\N	50.0873337	14.4213333	2017-12-23 00:28:00.527299+08	3	t	6
70	\N	\N	50.0873337	14.4213333	2017-12-23 00:28:07.377995+08	3	t	6
71	\N	\N	50.0873337	14.4215002	2017-12-23 00:28:14.036092+08	3	t	6
72	\N	\N	50.0873337	14.4215002	2017-12-23 00:28:20.68783+08	3	t	6
73	\N	\N	50.0878334	14.4271669	2017-12-23 00:28:27.349861+08	3	t	6
74	\N	\N	50.0876656	14.4274998	2017-12-23 00:31:35.431784+08	3	t	6
75	\N	\N	50.088501	14.4289999	2017-12-23 00:31:41.995557+08	3	t	6
76	\N	\N	50.0876656	14.4326668	2017-12-23 00:31:48.668379+08	3	t	6
77	\N	\N	50.0876656	14.4328337	2017-12-23 00:31:55.322023+08	3	t	6
78	\N	\N	50.0921669	14.4273329	2017-12-23 00:32:04.012588+08	3	t	6
79	\N	\N	50.0921669	14.4273329	2017-12-23 00:32:10.676437+08	3	t	6
80	\N	\N	50.0929985	14.4250002	2017-12-23 00:32:17.200591+08	3	t	6
81	\N	\N	50.0929985	14.4246664	2017-12-23 00:32:23.57242+08	3	t	6
82	\N	\N	50.0931664	14.4245005	2017-12-23 00:32:33.559411+08	3	t	6
83	\N	\N	50.0931664	14.4230003	2017-12-23 00:32:40.194384+08	3	t	6
84	\N	\N	50.091835	14.4171667	2017-12-23 00:32:47.028102+08	3	t	6
85	\N	\N	50.0916672	14.4163332	2017-12-23 00:32:53.875664+08	3	t	6
86	\N	\N	50.0906677	14.4154997	2017-12-23 00:33:00.333926+08	3	t	6
87	\N	\N	50.0895004	14.4145002	2017-12-23 00:33:08.012002+08	3	t	6
88	\N	\N	50.0895004	14.4145002	2017-12-23 00:33:15.186814+08	3	t	6
89	\N	\N	50.0895004	14.4145002	2017-12-23 00:33:21.628826+08	3	t	6
90	\N	\N	50.0893326	14.4145002	2017-12-23 00:33:28.110047+08	3	t	6
91	\N	\N	50.0893326	14.4128332	2017-12-23 00:33:34.537678+08	3	t	6
92	\N	\N	50.0895004	14.4128332	2017-12-23 00:33:40.984562+08	3	t	6
93	\N	\N	50.0895004	14.4126663	2017-12-23 00:33:48.349329+08	3	t	6
94	\N	\N	50.0895004	14.4126663	2017-12-23 00:33:57.690145+08	3	t	6
95	\N	\N	50.0880013	14.4036665	2017-12-23 00:34:05.353287+08	3	t	6
96	\N	\N	50.0878334	14.4045	2017-12-23 00:34:11.600967+08	3	t	6
97	\N	\N	50.0880013	14.4043331	2017-12-23 00:34:18.25084+08	3	t	6
98	\N	\N	50.081501	14.4148331	2017-12-23 00:34:27.255833+08	3	t	6
99	\N	\N	50.081501	14.4148331	2017-12-23 00:34:34.057203+08	3	t	6
100	\N	\N	50.081501	14.4148331	2017-12-23 00:34:40.269262+08	3	t	6
101	\N	\N	50.081501	14.4138336	2017-12-23 00:34:47.03356+08	3	t	6
102	\N	\N	50.0813332	14.4138336	2017-12-23 00:34:53.78518+08	3	t	6
103	\N	\N	50.0813332	14.4138336	2017-12-23 00:35:06.801626+08	3	t	6
104	\N	\N	50.0813332	14.4138336	2017-12-23 00:35:14.585213+08	3	t	6
105	\N	\N	50.0813332	14.4138336	2017-12-23 00:35:21.679171+08	3	t	6
106	\N	\N	50.0813332	14.4138336	2017-12-23 00:35:28.216375+08	3	t	6
107	\N	\N	50.0810013	14.4069996	2017-12-23 00:35:35.048398+08	3	t	6
108	\N	\N	50.0828323	14.4075003	2017-12-23 00:35:43.556875+08	3	t	6
109	\N	\N	50.0834999	14.4111662	2017-12-23 00:35:52.261024+08	3	t	6
110	\N	\N	50.0846672	14.4091663	2017-12-23 00:36:02.207158+08	3	t	6
111	\N	\N	50.0848351	14.4088335	2017-12-23 00:36:08.84556+08	3	t	6
112	\N	\N	50.0859985	14.4083338	2017-12-23 00:36:15.813444+08	3	t	6
113	\N	\N	50.0859985	14.4083338	2017-12-23 00:36:23.693208+08	3	t	6
114	\N	\N	50.0859985	14.4084997	2017-12-23 00:36:30.139825+08	3	t	6
115	\N	\N	50.0859985	14.4084997	2017-12-23 00:36:37.518642+08	3	t	6
116	\N	\N	50.0859985	14.4084997	2017-12-23 00:36:43.86068+08	3	t	6
117	\N	\N	50.0859985	14.4084997	2017-12-23 00:36:57.07691+08	3	t	6
118	\N	\N	50.0861664	14.4084997	2017-12-23 00:37:03.734541+08	3	t	6
119	\N	\N	50.0864983	14.4086666	2017-12-23 00:37:11.306126+08	3	t	6
120	\N	\N	50.0864983	14.4086666	2017-12-23 00:37:17.410738+08	3	t	6
121	\N	\N	\N	\N	2017-12-23 00:37:26.492761+08	3	t	6
122	\N	\N	50.086834	14.4084997	2017-12-23 00:37:39.503922+08	3	t	6
123	\N	\N	50.086834	14.4084997	2017-12-23 00:37:45.451061+08	3	t	6
124	\N	\N	50.086834	14.4084997	2017-12-23 00:37:51.441562+08	3	t	6
125	\N	\N	50.0870018	14.4086666	2017-12-23 00:37:57.962724+08	3	t	6
126	\N	\N	50.0870018	14.4086666	2017-12-23 00:38:04.453273+08	3	t	6
127	\N	\N	50.086834	14.4095001	2017-12-23 00:38:11.939071+08	3	t	6
128	\N	\N	50.0866661	14.4093332	2017-12-23 00:38:19.402966+08	3	t	6
129	\N	\N	50.0866661	14.4099998	2017-12-23 00:38:25.943174+08	3	t	6
130	\N	\N	50.0866661	14.409833	2017-12-23 00:38:33.058889+08	3	t	6
131	\N	\N	50.0866661	14.4101667	2017-12-23 00:38:40.061643+08	3	t	6
132	\N	\N	50.0866661	14.4101667	2017-12-23 00:38:47.15597+08	3	t	6
133	\N	\N	\N	\N	2017-12-23 00:38:53.68996+08	3	t	6
134	\N	\N	50.0864983	14.4108334	2017-12-23 00:39:10.134147+08	3	t	6
135	\N	\N	50.0864983	14.4116669	2017-12-23 00:39:16.440651+08	3	t	6
136	\N	\N	50.0863342	14.4116669	2017-12-23 00:39:22.37715+08	3	t	6
137	\N	\N	50.0863342	14.4119997	2017-12-23 00:39:28.649512+08	3	t	6
138	\N	\N	50.0863342	14.4119997	2017-12-23 00:39:35.596607+08	3	t	6
139	\N	\N	50.0864983	14.4123335	2017-12-23 00:39:42.600442+08	3	t	6
140	\N	\N	50.0864983	14.4123335	2017-12-23 00:39:58.724402+08	3	t	6
141	\N	\N	50.0863342	14.4123335	2017-12-23 00:40:10.931155+08	3	t	6
142	\N	\N	50.0864983	14.4128332	2017-12-23 00:40:20.01526+08	3	t	6
143	\N	\N	50.0863342	14.4128332	2017-12-23 00:40:27.501392+08	3	t	6
144	\N	\N	50.0863342	14.413167	2017-12-23 00:40:34.88855+08	3	t	6
145	\N	\N	50.0861664	14.4133329	2017-12-23 00:40:41.215009+08	3	t	6
146	\N	\N	50.0859985	14.4136667	2017-12-23 00:40:47.982438+08	3	t	6
147	\N	\N	50.0861664	14.4136667	2017-12-23 00:40:54.536963+08	3	t	6
148	\N	\N	\N	\N	2017-12-23 00:41:02.849867+08	3	t	6
149	\N	\N	50.0859985	14.4186668	2017-12-23 00:41:09.087512+08	3	t	6
150	\N	\N	50.0859985	14.4186668	2017-12-23 00:41:15.141651+08	3	t	6
151	\N	\N	50.0859985	14.4186668	2017-12-23 00:41:23.019447+08	3	t	6
152	\N	\N	50.086834	14.4200001	2017-12-23 00:41:28.844577+08	3	t	6
153	\N	\N	50.0870018	14.4208336	2017-12-23 00:41:35.034713+08	3	t	6
154	\N	\N	50.0870018	14.4208336	2017-12-23 00:41:49.424768+08	3	t	6
155	\N	\N	50.0871658	14.4211664	2017-12-23 00:41:55.876993+08	3	t	6
156	\N	\N	50.0873337	14.4211664	2017-12-23 00:42:03.657598+08	3	t	6
157	\N	\N	50.0871658	14.4216671	2017-12-23 00:42:10.994154+08	3	t	6
158	\N	\N	50.0873337	14.4219999	2017-12-23 00:42:17.997902+08	3	t	6
159	\N	\N	50.0873337	14.4274998	2017-12-23 00:42:24.037823+08	3	t	6
160	\N	\N	50.0873337	14.427	2017-12-23 00:42:33.225505+08	3	t	6
161	\N	\N	50.0871658	14.4285002	2017-12-23 00:42:39.49523+08	3	t	6
162	\N	\N	50.0871658	14.4285002	2017-12-23 00:42:46.256385+08	3	t	6
163	\N	\N	50.0873337	14.4281664	2017-12-23 00:42:53.32144+08	3	t	6
164	\N	\N	50.0853348	14.4251671	2017-12-23 00:43:00.384783+08	3	t	6
165	\N	\N	50.0853348	14.4251671	2017-12-23 00:43:08.166475+08	3	t	6
166	\N	\N	50.0853348	14.4251671	2017-12-23 00:43:14.63712+08	3	t	6
167	\N	\N	50.0853348	14.4251671	2017-12-23 00:43:23.225525+08	3	t	6
168	\N	\N	50.0751648	14.4189997	2017-12-23 00:43:29.891101+08	3	t	6
169	\N	\N	50.0751648	14.4189997	2017-12-23 00:43:36.40611+08	3	t	6
170	\N	\N	50.0138321	14.5303335	2017-12-23 00:43:42.371123+08	3	t	6
171	\N	\N	50.0135002	14.531167	2017-12-23 00:43:48.770535+08	3	t	6
172	\N	\N	49.9958344	14.5836668	2017-12-23 00:43:55.180099+08	3	t	6
173	\N	\N	49.9958344	14.5836668	2017-12-23 00:44:04.492603+08	3	t	6
174	\N	\N	\N	\N	2017-12-23 00:44:10.431744+08	3	t	6
175	\N	\N	49.7820015	14.6754999	2017-12-23 00:44:16.72343+08	3	t	6
176	\N	\N	49.2781677	14.715333	2017-12-23 00:44:23.128968+08	3	t	6
177	\N	\N	49.2763329	14.715333	2017-12-23 00:44:29.289067+08	3	t	6
178	\N	\N	49.2750015	14.715167	2017-12-23 00:44:35.316196+08	3	t	6
179	\N	\N	48.8341675	14.3465004	2017-12-23 00:44:41.236987+08	3	t	6
180	\N	\N	48.8339996	14.3461666	2017-12-23 00:44:47.808149+08	3	t	6
181	\N	\N	48.8336678	14.3458338	2017-12-23 00:44:53.482106+08	3	t	6
182	\N	\N	48.8111649	14.3208332	2017-12-23 00:44:59.422429+08	3	t	6
183	\N	\N	48.8111649	14.3208332	2017-12-23 00:45:06.06116+08	3	t	6
184	\N	\N	48.8106651	14.3183336	2017-12-23 00:45:12.090024+08	3	t	6
185	\N	\N	48.8106651	14.3171663	2017-12-23 00:45:23.331814+08	3	t	6
186	\N	\N	48.8105011	14.3171663	2017-12-23 00:45:29.999264+08	3	t	6
187	\N	\N	\N	\N	2017-12-23 00:45:37.045494+08	3	t	6
188	\N	\N	48.8103333	14.3158331	2017-12-23 00:45:47.087678+08	3	t	6
189	\N	\N	\N	\N	2017-12-23 00:45:52.937289+08	3	t	6
190	\N	\N	48.8105011	14.3151665	2017-12-23 00:45:58.209966+08	3	t	6
191	\N	\N	48.8105011	14.3149996	2017-12-23 00:46:04.129497+08	3	t	6
192	\N	\N	\N	\N	2017-12-23 00:46:10.84713+08	3	t	6
193	\N	\N	48.810833	14.3098335	2017-12-23 00:46:17.56345+08	3	t	6
194	\N	\N	48.8110008	14.3094997	2017-12-23 00:46:35.120622+08	3	t	6
195	\N	\N	48.8111649	14.3091669	2017-12-23 00:46:49.04954+08	3	t	6
196	\N	\N	48.8113327	14.3091669	2017-12-23 00:47:01.028097+08	3	t	6
197	\N	\N	48.8110008	14.3091669	2017-12-23 00:47:07.166191+08	3	t	6
198	\N	\N	48.8110008	14.309	2017-12-23 00:47:13.619509+08	3	t	6
199	\N	\N	48.8103333	14.3079996	2017-12-23 00:47:20.282984+08	3	t	6
200	\N	\N	48.8105011	14.3078337	2017-12-23 00:47:26.520437+08	3	t	6
201	\N	\N	48.8105011	14.3078337	2017-12-23 00:47:33.214338+08	3	t	6
202	\N	\N	48.8100014	14.3066664	2017-12-23 00:47:40.445631+08	3	t	6
203	\N	\N	\N	\N	2017-12-23 00:47:56.676358+08	3	t	6
204	\N	\N	\N	\N	2017-12-23 00:48:03.702777+08	3	t	6
205	\N	\N	\N	\N	2017-12-23 00:48:10.04296+08	3	t	6
206	\N	\N	\N	\N	2017-12-23 00:48:16.403167+08	3	t	6
207	\N	\N	\N	\N	2017-12-23 00:48:23.045629+08	3	t	6
208	\N	\N	\N	\N	2017-12-23 00:48:36.051639+08	3	t	6
209	\N	\N	48.8110008	14.3094997	2017-12-23 00:48:42.580342+08	3	t	6
210	\N	\N	48.8111649	14.3093338	2017-12-23 00:48:48.951517+08	3	t	6
211	\N	\N	48.8110008	14.3094997	2017-12-23 00:48:55.045489+08	3	t	6
212	\N	\N	\N	\N	2017-12-23 00:49:02.876829+08	3	t	6
213	\N	\N	\N	\N	2017-12-23 00:49:09.119884+08	3	t	6
214	\N	\N	48.8118324	14.3136663	2017-12-23 00:49:17.184188+08	3	t	6
215	\N	\N	48.8120003	14.3138332	2017-12-23 00:49:23.462953+08	3	t	6
216	\N	\N	48.8126678	14.3161669	2017-12-23 00:49:35.546501+08	3	t	6
217	\N	\N	48.8126678	14.3161669	2017-12-23 00:49:41.754901+08	3	t	6
218	\N	\N	48.8126678	14.3158331	2017-12-23 00:49:48.035484+08	3	t	6
219	\N	\N	48.8126678	14.3158331	2017-12-23 00:50:05.7506+08	3	t	6
220	\N	\N	48.8126678	14.3158331	2017-12-23 00:50:11.999016+08	3	t	6
221	\N	\N	48.8125	14.3144999	2017-12-23 00:50:18.45575+08	3	t	6
222	\N	\N	48.8125	14.3144999	2017-12-23 00:50:25.109267+08	3	t	6
223	\N	\N	48.8125	14.3146667	2017-12-23 00:50:32.177175+08	3	t	6
224	\N	\N	48.8125	14.3146667	2017-12-23 00:50:38.627972+08	3	t	6
225	\N	\N	48.8125	14.3146667	2017-12-23 00:50:45.181662+08	3	t	6
226	\N	\N	48.8121681	14.3114996	2017-12-23 00:50:51.529391+08	3	t	6
227	\N	\N	48.8125	14.3131666	2017-12-23 00:50:57.77013+08	3	t	6
228	\N	\N	48.8126678	14.3129997	2017-12-23 00:51:04.016693+08	3	t	6
229	\N	\N	48.8125	14.3129997	2017-12-23 00:51:06.911117+08	3	t	6
230	\N	\N	48.8126678	14.3131666	2017-12-23 00:51:16.646641+08	3	t	6
231	\N	\N	\N	\N	2017-12-23 00:51:22.483785+08	3	t	6
232	\N	\N	\N	\N	2017-12-23 00:51:27.825276+08	3	t	6
233	\N	\N	\N	\N	2017-12-23 00:51:33.712066+08	3	t	6
234	\N	\N	\N	\N	2017-12-23 00:51:39.670315+08	3	t	6
235	\N	\N	\N	\N	2017-12-23 00:51:46.091913+08	3	t	6
236	\N	\N	\N	\N	2017-12-23 00:51:53.983581+08	3	t	6
237	\N	\N	\N	\N	2017-12-23 00:52:04.73601+08	3	t	6
238	\N	\N	\N	\N	2017-12-23 00:52:10.170202+08	3	t	6
239	\N	\N	\N	\N	2017-12-23 00:52:16.740628+08	3	t	6
240	\N	\N	48.8121681	14.3161669	2017-12-23 00:52:23.005032+08	3	t	6
241	\N	\N	48.8123322	14.316	2017-12-23 00:52:29.211608+08	3	t	6
242	\N	\N	48.8123322	14.316	2017-12-23 00:52:36.339002+08	3	t	6
243	\N	\N	48.8123322	14.316	2017-12-23 00:52:42.635723+08	3	t	6
244	\N	\N	\N	\N	2017-12-23 00:52:50.224295+08	3	t	6
245	\N	\N	\N	\N	2017-12-23 00:53:02.12026+08	3	t	6
246	\N	\N	\N	\N	2017-12-23 00:53:08.996558+08	3	t	6
247	\N	\N	\N	\N	2017-12-23 00:53:20.845056+08	3	t	6
248	\N	\N	48.8126678	14.3164997	2017-12-23 00:53:32.989727+08	3	t	6
249	\N	\N	48.8125	14.3166666	2017-12-23 00:53:38.473289+08	3	t	6
250	\N	\N	48.8101654	14.3163338	2017-12-23 00:53:45.021729+08	3	t	6
251	\N	\N	48.8101654	14.3158331	2017-12-23 00:53:51.478479+08	3	t	6
252	\N	\N	48.8103333	14.3156662	2017-12-23 00:53:57.808512+08	3	t	6
253	\N	\N	48.8101654	14.3158331	2017-12-23 00:54:05.182218+08	3	t	6
254	\N	\N	48.8101654	14.316	2017-12-23 00:54:11.595956+08	3	t	6
255	\N	\N	48.8101654	14.316	2017-12-23 00:54:18.372574+08	3	t	6
256	\N	\N	48.8105011	14.3156662	2017-12-23 00:54:24.72398+08	3	t	6
257	\N	\N	48.8103333	14.3158331	2017-12-23 00:54:36.900076+08	3	t	6
258	\N	\N	\N	\N	2017-12-23 00:54:45.306698+08	3	t	6
259	\N	\N	\N	\N	2017-12-23 00:54:58.722929+08	3	t	6
260	\N	\N	48.8111649	14.3208332	2017-12-23 00:55:05.067098+08	3	t	6
261	\N	\N	49.4679985	14.6603336	2017-12-23 00:55:17.890603+08	3	t	6
262	\N	\N	\N	\N	2017-12-23 00:55:24.328328+08	3	t	6
263	\N	\N	50.0875015	14.4280005	2017-12-23 00:55:30.312399+08	3	t	6
264	\N	\N	50.0875015	14.4278336	2017-12-23 00:55:36.732762+08	3	t	6
265	\N	\N	50.0875015	14.4278336	2017-12-23 00:55:43.266922+08	3	t	6
266	\N	\N	50.0875015	14.4278336	2017-12-23 00:55:53.920634+08	3	t	6
267	\N	\N	50.0875015	14.4278336	2017-12-23 00:56:04.566002+08	3	t	6
268	\N	\N	50.0875015	14.4278336	2017-12-23 00:56:10.918032+08	3	t	6
269	\N	\N	50.0876656	14.4278336	2017-12-23 00:56:17.498547+08	3	t	6
270	\N	\N	50.0876656	14.4278336	2017-12-23 00:56:30.074515+08	3	t	6
271	\N	\N	50.0876656	14.4280005	2017-12-23 00:56:37.029426+08	3	t	6
272	\N	\N	50.0876656	14.4280005	2017-12-23 00:56:43.072243+08	3	t	6
273	\N	\N	50.0876656	14.4280005	2017-12-23 00:56:49.62701+08	3	t	6
274	\N	\N	50.0876656	14.4280005	2017-12-23 00:56:58.74358+08	3	t	6
275	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:05.160282+08	3	t	6
276	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:11.529141+08	3	t	6
277	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:17.842823+08	3	t	6
278	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:29.544479+08	3	t	6
279	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:46.058819+08	3	t	6
280	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:52.146605+08	3	t	6
281	\N	\N	50.0875015	14.4280005	2017-12-23 00:57:58.053109+08	3	t	6
282	\N	\N	50.0875015	14.4280005	2017-12-23 00:58:04.575005+08	3	t	6
283	\N	\N	50.0875015	14.4280005	2017-12-23 00:58:16.656662+08	3	t	6
284	\N	\N	50.0876656	14.4278336	2017-12-23 00:58:22.922359+08	3	t	6
285	\N	\N	50.0876656	14.4278336	2017-12-23 00:58:39.405132+08	3	t	6
286	\N	\N	50.0876656	14.4278336	2017-12-23 00:58:47.472464+08	3	t	6
287	\N	\N	50.0876656	14.4278336	2017-12-23 00:58:54.132044+08	3	t	6
288	\N	\N	50.0873337	14.4283333	2017-12-23 00:59:00.482192+08	3	t	6
289	\N	\N	50.0873337	14.4283333	2017-12-23 00:59:07.035291+08	3	t	6
290	\N	\N	50.0873337	14.4283333	2017-12-23 00:59:13.492501+08	3	t	6
291	\N	\N	50.083168	14.4246664	2017-12-23 00:59:19.794989+08	3	t	6
292	\N	\N	50.0779991	14.4176664	2017-12-23 00:59:26.184391+08	3	t	6
293	\N	\N	50.0783348	14.4160004	2017-12-23 00:59:32.632525+08	3	t	6
294	\N	\N	50.0783348	14.4160004	2017-12-23 00:59:39.28919+08	3	t	6
295	\N	\N	\N	\N	2017-12-23 00:59:46.761886+08	3	t	6
296	\N	\N	\N	\N	2017-12-23 00:59:51.02967+08	3	t	6
297	\N	\N	\N	\N	2017-12-23 00:59:55.134962+08	3	t	6
298	\N	\N	\N	\N	2017-12-23 00:59:59.9127+08	3	t	6
299	\N	\N	50.0769997	14.4198332	2017-12-23 01:00:04.394138+08	3	t	6
300	\N	\N	50.0774994	14.4193335	2017-12-23 01:00:15.969315+08	3	t	6
301	\N	\N	50.0771675	14.4195004	2017-12-23 01:00:23.045833+08	3	t	6
302	\N	\N	50.0771675	14.4195004	2017-12-23 01:00:29.988975+08	3	t	6
303	\N	\N	50.0924988	14.3986664	2017-12-23 01:00:36.395007+08	3	t	6
304	\N	\N	50.0926666	14.3986664	2017-12-23 01:00:42.66127+08	3	t	6
305	\N	\N	50.091835	14.3985004	2017-12-23 01:00:49.61967+08	3	t	6
306	\N	\N	50.0914993	14.3986664	2017-12-23 01:00:55.782183+08	3	t	6
307	\N	\N	50.0909996	14.3988333	2017-12-23 01:01:03.08021+08	3	t	6
308	\N	\N	50.0904999	14.3988333	2017-12-23 01:01:10.228305+08	3	t	6
309	\N	\N	50.0904999	14.3998337	2017-12-23 01:01:17.431452+08	3	t	6
310	\N	\N	50.0906677	14.3998337	2017-12-23 01:01:23.560572+08	3	t	6
311	\N	\N	50.0906677	14.3998337	2017-12-23 01:01:29.936303+08	3	t	6
312	\N	\N	50.0906677	14.3998337	2017-12-23 01:01:36.647394+08	3	t	6
313	\N	\N	50.0906677	14.3998337	2017-12-23 01:01:42.427296+08	3	t	6
314	\N	\N	50.0906677	14.4001665	2017-12-23 01:01:49.029424+08	3	t	6
315	\N	\N	50.0906677	14.3999996	2017-12-23 01:01:55.900505+08	3	t	6
316	\N	\N	50.0908318	14.3999996	2017-12-23 01:02:02.954409+08	3	t	6
317	\N	\N	50.0906677	14.4001665	2017-12-23 01:02:08.886257+08	3	t	6
318	\N	\N	50.0904999	14.4001665	2017-12-23 01:02:15.350764+08	3	t	6
319	\N	\N	50.0904999	14.4001665	2017-12-23 01:02:29.029553+08	3	t	6
320	\N	\N	50.0906677	14.4001665	2017-12-23 01:02:35.888106+08	3	t	6
321	\N	\N	50.0906677	14.4001665	2017-12-23 01:02:41.794908+08	3	t	6
322	\N	\N	50.0904999	14.3998337	2017-12-23 01:02:48.100552+08	3	t	6
323	\N	\N	50.0904999	14.3998337	2017-12-23 01:02:54.874684+08	3	t	6
324	\N	\N	50.0909996	14.4003334	2017-12-23 01:03:01.950342+08	3	t	6
325	\N	\N	50.0909996	14.4001665	2017-12-23 01:03:08.698407+08	3	t	6
326	\N	\N	50.0908318	14.4001665	2017-12-23 01:03:24.563102+08	3	t	6
327	\N	\N	50.0908318	14.4003334	2017-12-23 01:03:32.049457+08	3	t	8
328	\N	\N	50.0908318	14.4005003	2017-12-23 01:03:56.119815+08	3	t	8
329	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:04.816124+08	3	t	8
330	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:11.158091+08	3	t	8
331	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:18.124665+08	3	t	8
332	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:25.088761+08	3	t	8
333	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:32.088041+08	3	t	8
334	\N	\N	50.0908318	14.4005003	2017-12-23 01:04:39.513107+08	3	t	8
335	\N	\N	50.0909996	14.401	2017-12-23 01:04:51.088658+08	3	t	8
336	\N	\N	50.0909996	14.401	2017-12-23 01:04:57.749683+08	3	t	8
337	\N	\N	50.0911674	14.401	2017-12-23 01:05:03.942584+08	3	t	8
338	\N	\N	50.0909996	14.401	2017-12-23 01:05:13.106993+08	3	t	8
339	\N	\N	50.0909996	14.4011669	2017-12-23 01:05:20.096037+08	3	t	8
340	\N	\N	50.0911674	14.4011669	2017-12-23 01:05:46.911673+08	3	t	8
341	\N	\N	50.0911674	14.4011669	2017-12-23 01:05:53.982215+08	3	t	8
342	\N	\N	50.0911674	14.4013338	2017-12-23 01:06:10.868666+08	3	t	8
343	\N	\N	50.0909996	14.4013338	2017-12-23 01:06:17.894891+08	3	t	8
344	\N	\N	50.0909996	14.4013338	2017-12-23 01:06:32.288744+08	3	t	8
345	\N	\N	50.0909996	14.4013338	2017-12-23 01:06:38.620703+08	3	t	8
346	\N	\N	50.0909996	14.4013338	2017-12-23 01:06:46.706615+08	3	t	8
347	\N	\N	50.0909996	14.4013338	2017-12-23 01:06:53.77249+08	3	t	8
348	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:05.034265+08	3	t	8
349	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:11.892581+08	3	t	8
350	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:35.392576+08	3	t	8
351	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:41.963362+08	3	t	8
352	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:48.732125+08	3	t	8
353	\N	\N	50.0909996	14.4013338	2017-12-23 01:07:56.863364+08	3	t	8
354	\N	\N	50.0909996	14.4013338	2017-12-23 01:08:04.117535+08	3	t	8
355	\N	\N	50.0908318	14.401	2017-12-23 01:08:12.152652+08	3	t	8
356	\N	\N	50.0908318	14.401	2017-12-23 01:08:19.436089+08	3	t	8
357	\N	\N	50.0909996	14.4008331	2017-12-23 01:08:25.371161+08	3	t	8
358	\N	\N	50.0909996	14.4008331	2017-12-23 01:08:39.519748+08	3	t	8
359	\N	\N	50.0909996	14.4008331	2017-12-23 01:08:50.900583+08	3	t	8
360	\N	\N	50.0909996	14.4008331	2017-12-23 01:08:57.366833+08	3	t	8
361	\N	\N	50.0909996	14.4006662	2017-12-23 01:09:06.172988+08	3	t	8
362	\N	\N	50.0909996	14.4006662	2017-12-23 01:09:12.513671+08	3	t	8
363	\N	\N	50.0909996	14.4006662	2017-12-23 01:09:20.438617+08	3	t	8
364	\N	\N	50.0909996	14.4006662	2017-12-23 01:09:27.761756+08	3	t	8
365	\N	\N	50.0906677	14.4003334	2017-12-23 01:09:34.841354+08	3	t	8
366	\N	\N	50.0906677	14.4003334	2017-12-23 01:09:42.097445+08	3	t	8
367	\N	\N	50.0906677	14.4003334	2017-12-23 01:09:48.263383+08	3	t	8
368	\N	\N	50.0906677	14.4005003	2017-12-23 01:09:54.398152+08	3	t	8
369	\N	\N	50.0904999	14.4001665	2017-12-23 01:10:06.086977+08	3	t	8
370	\N	\N	50.090332	14.4005003	2017-12-23 01:10:12.458306+08	3	t	8
371	\N	\N	50.090332	14.4005003	2017-12-23 01:10:18.91666+08	3	t	8
372	\N	\N	50.0904999	14.4003334	2017-12-23 01:10:25.42247+08	3	t	8
373	\N	\N	50.090332	14.4003334	2017-12-23 01:10:32.059314+08	3	t	8
374	\N	\N	50.0909996	14.4016666	2017-12-23 01:10:38.712093+08	3	t	8
375	\N	\N	50.0911674	14.4021664	2017-12-23 01:10:46.732134+08	3	t	8
376	\N	\N	50.0911674	14.4021664	2017-12-23 01:10:53.174122+08	3	t	8
377	\N	\N	\N	\N	2017-12-23 01:10:59.795029+08	3	t	8
378	\N	\N	50.0908318	14.4025002	2017-12-23 01:11:06.088167+08	3	t	8
379	\N	\N	50.0908318	14.4025002	2017-12-23 01:11:12.636095+08	3	t	8
380	\N	\N	50.0911674	14.4020004	2017-12-23 01:11:20.38375+08	3	t	8
381	\N	\N	50.0908318	14.4020004	2017-12-23 01:11:34.090489+08	3	t	8
382	\N	\N	50.0919991	14.4048338	2017-12-23 01:11:40.720992+08	3	t	8
383	\N	\N	50.0916672	14.4055004	2017-12-23 01:11:47.388447+08	3	t	8
384	\N	\N	50.0916672	14.4055004	2017-12-23 01:11:53.470782+08	3	t	8
385	\N	\N	50.0916672	14.4055004	2017-12-23 01:11:59.440339+08	3	t	8
386	\N	\N	50.0916672	14.4056664	2017-12-23 01:12:05.987596+08	3	t	8
387	\N	\N	50.0916672	14.4056664	2017-12-23 01:12:17.998616+08	3	t	8
388	\N	\N	50.0916672	14.4056664	2017-12-23 01:12:24.314243+08	3	t	8
389	\N	\N	50.0914993	14.4049997	2017-12-23 01:12:31.083271+08	3	t	8
390	\N	\N	50.0913315	14.4045	2017-12-23 01:12:38.508252+08	3	t	8
391	\N	\N	50.0906677	14.4031668	2017-12-23 01:12:45.407163+08	3	t	8
392	\N	\N	50.0906677	14.402833	2017-12-23 01:12:52.071885+08	3	t	8
393	\N	\N	50.0893326	14.4013338	2017-12-23 01:12:58.61939+08	3	t	8
394	\N	\N	50.0895004	14.3981667	2017-12-23 01:13:05.071142+08	3	t	8
395	\N	\N	50.0896683	14.3981667	2017-12-23 01:13:11.943209+08	3	t	8
396	\N	\N	50.0896683	14.3981667	2017-12-23 01:13:18.590223+08	3	t	8
397	\N	\N	50.0896683	14.3983335	2017-12-23 01:13:24.730669+08	3	t	8
398	\N	\N	50.0898323	14.3985004	2017-12-23 01:13:31.69247+08	3	t	8
399	\N	\N	50.0898323	14.3985004	2017-12-23 01:13:37.99081+08	3	t	8
400	\N	\N	50.0896683	14.3983335	2017-12-23 01:13:46.455878+08	3	t	8
401	\N	\N	50.0896683	14.3983335	2017-12-23 01:13:52.905125+08	3	t	8
402	\N	\N	50.0896683	14.3983335	2017-12-23 01:13:59.14933+08	3	t	8
403	\N	\N	50.0896683	14.3983335	2017-12-23 01:14:06.201574+08	3	t	8
404	\N	\N	50.090168	14.3990002	2017-12-23 01:14:12.618126+08	3	t	8
406	\N	\N	50.0895004	14.3971663	2017-12-23 01:34:24.696313+08	3	t	8
407	\N	\N	50.0895004	14.3968334	2017-12-23 01:34:31.936174+08	3	t	8
408	\N	\N	50.0895004	14.3964996	2017-12-23 01:34:38.163719+08	3	t	8
409	\N	\N	50.0895004	14.3964996	2017-12-23 01:34:45.024597+08	3	t	8
410	\N	\N	50.0883331	14.3913336	2017-12-23 01:34:51.271551+08	3	t	8
411	\N	\N	50.0891685	14.3911667	2017-12-23 01:34:57.221245+08	3	t	8
412	\N	\N	50.0891685	14.3913336	2017-12-23 01:35:03.533708+08	3	t	8
413	\N	\N	50.0890007	14.3915005	2017-12-23 01:35:09.393787+08	3	t	8
414	\N	\N	50.0881653	14.3911667	2017-12-23 01:35:16.724005+08	3	t	8
415	\N	\N	50.0864983	14.3879995	2017-12-23 01:35:24.040161+08	3	t	8
416	\N	\N	50.0870018	14.3896666	2017-12-23 01:35:30.413034+08	3	t	8
417	\N	\N	50.0863342	14.3900003	2017-12-23 01:35:36.966356+08	3	t	8
418	\N	\N	50.081665	14.4126663	2017-12-23 01:35:43.806347+08	3	t	8
419	\N	\N	50.0806656	14.416667	2017-12-23 01:35:51.175256+08	3	t	8
420	\N	\N	50.0805016	14.4168329	2017-12-23 01:35:58.143632+08	3	t	8
421	\N	\N	50.0805016	14.4168329	2017-12-23 01:36:05.030448+08	3	t	8
422	\N	\N	50.0796661	14.4198332	2017-12-23 01:36:11.447722+08	3	t	8
423	\N	\N	50.0821648	14.4265003	2017-12-23 01:36:18.348538+08	3	t	8
424	\N	\N	50.0810013	14.4278336	2017-12-23 01:36:29.179238+08	3	t	8
425	\N	\N	50.0803337	14.4285002	2017-12-23 01:36:40.415642+08	3	t	8
426	\N	\N	50.0811653	14.4278336	2017-12-23 01:36:46.879373+08	3	t	8
427	\N	\N	50.0820007	14.4266663	2017-12-23 01:36:53.532751+08	3	t	8
435	청도 김치	\N	36.0664024	120.395134	2017-12-25 00:42:29.356872+08	3	t	6
437	엄마와 성규	\N	35.9546661	120.192711	2017-12-25 10:02:35.070111+08	1	t	5
438	하나와 함께	\N	35.9546204	120.192703	2017-12-25 10:03:23.420125+08	1	t	5
439	벗꽃	\N	36.0679321	120.400078	2017-12-25 10:04:11.197236+08	1	t	5
440	투표	\N	36.3152885	120.43512	2017-12-25 10:04:44.011537+08	1	t	5
441	상해 출장	\N	31.3995495	121.274963	2017-12-25 10:06:00.61204+08	1	t	4
442	안양	\N	37.3899193	126.949265	2017-12-25 10:06:46.245216+08	1	t	4
443	Office 2017. 12. 26	\N	35.9635353	120.162628	2017-12-26 04:48:35.843065+08	1	t	5
444	위치 없음	\N	0	0	2017-12-27 02:58:09.42045+08	3	t	6
1002	서양식	\N	35.9556999	120.185997	2017-12-29 10:28:41.470051+08	3	t	6
1018	Short	\N	36.0667	120.400002	2017-12-29 16:14:32.932802+08	3	t	6
1019	청도 모습	\N	36.0588989	120.335999	2017-12-30 10:59:22.029483+08	3	t	6
1027		\N	36.016201	120.092003	2018-01-24 14:20:05.345809+08	1	t	1
1020		\N	36.0549011	120.393997	2018-01-08 15:33:36.174969+08	1	t	4
1021		\N	0	0	2018-01-10 08:55:34.545329+08	1	t	1
1025	동대문 맛집	\N	37.571701	127.011002	2018-01-19 10:25:45.863246+08	1008	t	1018
1022		\N	37.3899002	126.948997	2018-01-10 08:56:27.408064+08	1	t	1
1023		\N	37.7389984	120.442001	2018-01-10 11:56:31.916401+08	1	t	4
1024	동대문 맛집	\N	37.571701	127.011002	2018-01-19 10:22:39.228198+08	1008	t	1018
1026		\N	36.0679016	120.400002	2018-01-19 12:26:15.847671+08	1009	t	1019
\.


--
-- Data for Name: blog_post_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post_contents (id, post_id, content_id) FROM stdin;
7	16	13
8	17	14
10	19	16
11	20	17
12	20	18
13	21	19
14	21	20
16	23	22
19	26	25
20	27	26
22	29	28
23	30	29
24	31	30
25	32	31
27	34	33
28	35	34
29	36	35
30	37	36
31	38	37
32	39	38
33	40	39
34	41	40
35	42	41
36	43	42
37	44	43
38	45	44
39	46	45
40	47	46
41	48	47
42	49	48
43	50	49
44	51	50
45	52	51
46	53	52
48	55	54
54	69	60
55	70	61
56	71	62
57	72	63
58	73	64
59	74	65
60	75	66
61	76	67
62	77	68
63	78	69
64	79	70
65	80	71
66	81	72
67	82	73
68	83	74
69	84	75
70	85	76
71	86	77
72	87	78
73	88	79
74	89	80
75	90	81
76	91	82
77	92	83
78	93	84
79	94	85
80	95	86
81	96	87
82	97	88
83	98	89
84	99	90
85	100	91
86	101	92
87	102	93
88	103	94
89	104	95
90	105	96
91	106	97
92	107	98
93	108	99
94	109	100
95	110	101
96	111	102
97	112	103
98	113	104
99	114	105
100	115	106
101	116	107
102	117	108
103	118	109
104	119	110
105	120	111
106	121	112
107	122	113
108	123	114
109	124	115
110	125	116
111	126	117
112	127	118
113	128	119
114	129	120
115	130	121
116	131	122
117	132	123
118	133	124
119	134	125
120	135	126
121	136	127
122	137	128
123	138	129
124	139	130
125	140	131
126	141	132
127	142	133
128	143	134
129	144	135
130	145	136
131	146	137
132	147	138
133	148	139
134	149	140
135	150	141
136	151	142
137	152	143
138	153	144
139	154	145
140	155	146
141	156	147
142	157	148
143	158	149
144	159	150
145	160	151
146	161	152
147	162	153
148	163	154
149	164	155
150	165	156
151	166	157
152	167	158
153	168	159
154	169	160
155	170	161
156	171	162
157	172	163
158	173	164
159	174	165
160	175	166
161	176	167
162	177	168
163	178	169
164	179	170
165	180	171
166	181	172
167	182	173
168	183	174
169	184	175
170	185	176
171	186	177
172	187	178
173	188	179
174	189	180
175	190	181
176	191	182
177	192	183
178	193	184
179	194	185
180	195	186
181	196	187
182	197	188
183	198	189
184	199	190
185	200	191
186	201	192
187	202	193
188	203	194
189	204	195
190	205	196
191	206	197
192	207	198
193	208	199
194	209	200
195	210	201
196	211	202
197	212	203
198	213	204
199	214	205
200	215	206
201	216	207
202	217	208
203	218	209
204	219	210
205	220	211
206	221	212
207	222	213
208	223	214
209	224	215
210	225	216
211	226	217
212	227	218
213	228	219
214	229	220
215	230	221
216	231	222
217	232	223
218	233	224
219	234	225
220	235	226
221	236	227
222	237	228
223	238	229
224	239	230
225	240	231
226	241	232
227	242	233
228	243	234
229	244	235
230	245	236
231	246	237
232	247	238
233	248	239
234	249	240
235	250	241
236	251	242
237	252	243
238	253	244
239	254	245
240	255	246
241	256	247
242	257	248
243	258	249
244	259	250
245	260	251
246	261	252
247	262	253
248	263	254
249	264	255
250	265	256
251	266	257
252	267	258
253	268	259
254	269	260
255	270	261
256	271	262
257	272	263
258	273	264
259	274	265
260	275	266
261	276	267
262	277	268
263	278	269
264	279	270
265	280	271
266	281	272
267	282	273
268	283	274
269	284	275
270	285	276
271	286	277
272	287	278
273	288	279
274	289	280
275	290	281
276	291	282
277	292	283
278	293	284
279	294	285
280	295	286
281	296	287
282	297	288
283	298	289
284	299	290
285	300	291
286	301	292
287	302	293
288	303	294
289	304	295
290	305	296
291	306	297
292	307	298
293	308	299
294	309	300
295	310	301
296	311	302
297	312	303
298	313	304
299	314	305
300	315	306
301	316	307
302	317	308
303	318	309
304	319	310
305	320	311
306	321	312
307	322	313
308	323	314
309	324	315
310	325	316
311	326	317
312	327	318
313	328	319
314	329	320
315	330	321
316	331	322
317	332	323
318	333	324
319	334	325
320	335	326
321	336	327
322	337	328
323	338	329
324	339	330
325	340	331
326	341	332
327	342	333
328	343	334
329	344	335
330	345	336
331	346	337
332	347	338
333	348	339
334	349	340
335	350	341
336	351	342
337	352	343
338	353	344
339	354	345
340	355	346
341	356	347
342	357	348
343	358	349
344	359	350
345	360	351
346	361	352
347	362	353
348	363	354
349	364	355
350	365	356
351	366	357
352	367	358
353	368	359
354	369	360
355	370	361
356	371	362
357	372	363
358	373	364
359	374	365
360	375	366
361	376	367
362	377	368
363	378	369
364	379	370
365	380	371
366	381	372
367	382	373
368	383	374
369	384	375
370	385	376
371	386	377
372	387	378
373	388	379
374	389	380
375	390	381
376	391	382
377	392	383
378	393	384
379	394	385
380	395	386
381	396	387
382	397	388
383	398	389
384	399	390
385	400	391
386	401	392
387	402	393
388	403	394
389	404	395
390	406	396
391	407	397
392	408	398
393	409	399
394	410	400
395	411	401
396	412	402
397	413	403
398	414	404
399	415	405
400	416	406
401	417	407
402	418	408
403	419	409
404	420	410
405	421	411
406	422	412
407	423	413
408	424	414
409	425	415
410	426	416
411	427	417
413	435	419
414	437	420
415	438	421
416	439	422
417	440	423
418	441	424
419	442	425
420	443	426
421	444	427
1002	1002	1002
1018	1018	1018
1019	1019	1019
1020	1020	1020
1021	1021	1021
1022	1022	1022
1023	1023	1023
1024	1024	1024
1025	1025	1025
1026	1026	1026
1027	1027	1027
\.


--
-- Data for Name: blog_post_tag_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post_tag_set (id, post_id, tag_id) FROM stdin;
6	19	1
7	19	2
8	19	3
9	19	4
10	19	5
11	19	6
12	19	7
13	19	8
14	19	9
15	19	10
16	19	11
17	20	5
18	20	12
19	20	21
20	20	22
21	20	23
22	20	24
23	20	25
24	21	5
25	21	21
26	21	23
27	21	24
28	21	26
29	21	27
30	21	28
31	21	29
40	23	24
41	23	30
42	23	38
43	23	39
58	26	50
59	26	51
60	26	52
61	26	23
62	27	53
63	29	34
64	29	35
65	29	37
66	29	54
67	29	30
68	29	31
69	30	30
70	30	31
71	30	34
72	30	54
73	30	55
74	30	56
75	30	57
76	30	58
77	30	59
78	30	60
79	31	30
80	32	64
81	32	65
82	32	66
83	32	67
84	32	68
85	32	69
86	32	70
87	32	71
88	32	30
89	32	61
90	32	62
91	32	63
92	34	5
93	34	72
94	34	21
95	34	22
96	34	23
97	34	24
98	34	25
99	35	5
100	35	12
101	35	21
102	35	22
103	35	23
104	35	24
105	35	25
106	36	73
107	36	74
108	36	21
109	36	30
110	36	31
111	37	73
112	37	75
113	37	76
114	37	77
115	37	21
116	37	30
117	38	78
118	39	79
119	40	80
120	40	34
121	40	30
122	40	31
123	41	37
124	41	54
125	41	55
126	41	30
127	41	31
128	42	81
129	42	82
130	42	83
131	42	84
132	42	55
133	42	30
134	42	31
135	43	3
136	43	4
137	43	6
138	43	78
139	43	85
140	43	86
141	43	87
142	43	88
143	44	3
144	44	4
145	44	5
146	44	6
147	44	7
148	44	39
149	44	78
150	44	86
151	44	87
152	44	88
153	44	89
154	44	90
155	44	91
156	44	92
157	44	93
158	44	94
159	45	96
160	45	81
161	45	82
162	45	95
163	46	40
164	46	97
165	46	46
166	47	1
167	47	2
168	47	3
169	47	4
170	47	5
171	47	6
172	47	7
173	47	10
174	48	34
175	48	98
176	48	54
177	48	24
178	48	30
179	49	12
180	49	14
181	49	15
182	49	99
183	49	100
184	49	101
185	49	102
186	49	103
187	49	104
188	50	40
189	50	105
190	50	106
191	51	40
192	52	107
193	52	108
194	52	55
195	53	79
196	55	96
197	55	81
198	55	82
199	55	95
212	69	40
213	70	40
214	71	38
215	71	109
216	71	30
217	71	31
218	72	84
219	72	105
220	72	110
221	72	111
222	72	112
223	72	113
224	72	114
225	72	115
226	72	116
227	72	53
228	73	81
229	73	53
230	73	117
231	73	118
232	74	120
233	74	81
234	74	118
235	74	119
236	75	1
237	75	3
238	75	4
239	75	5
240	75	6
241	75	87
242	75	29
243	75	121
244	75	122
245	75	123
246	75	124
247	75	125
248	76	5
249	76	30
250	77	128
251	77	129
252	77	130
253	77	131
254	77	78
255	77	126
256	77	127
257	78	129
258	78	131
259	78	132
260	78	133
261	78	134
262	78	5
263	78	135
264	78	136
265	78	137
266	78	138
267	78	126
268	78	127
269	79	3
270	79	4
271	79	5
272	79	6
273	79	29
274	80	3
275	80	4
276	80	5
277	80	6
278	80	9
279	80	139
280	80	24
281	80	29
282	81	3
283	81	4
284	81	5
285	81	6
286	81	24
287	82	3
288	82	4
289	82	5
290	82	6
291	82	140
292	82	87
293	82	24
294	82	29
295	83	5
296	83	12
297	83	141
298	83	142
299	83	81
300	83	82
301	83	21
302	83	99
303	83	104
304	84	3
305	84	4
306	84	5
307	84	6
308	84	140
309	84	24
310	84	29
311	85	5
312	85	12
313	85	14
314	85	143
315	85	144
316	85	81
317	85	82
318	85	145
319	85	30
320	86	3
321	86	4
322	86	5
323	86	6
324	86	140
325	86	146
326	86	29
327	87	3
328	87	4
329	87	5
330	87	6
331	87	147
332	87	122
333	88	3
334	88	4
335	88	5
336	88	6
337	88	140
338	88	122
339	89	3
340	89	4
341	89	5
342	89	6
343	89	24
344	89	30
345	90	12
346	90	141
347	90	143
348	90	81
349	90	82
350	91	3
351	91	5
352	91	12
353	91	141
354	91	143
355	92	1
356	92	3
357	92	4
358	92	5
359	92	6
360	92	12
361	92	141
362	92	148
363	93	4
364	93	5
365	93	149
366	93	21
367	93	150
368	93	28
369	93	29
370	93	99
371	93	103
372	94	4
373	94	5
374	94	149
375	94	28
376	94	29
377	95	3
378	95	4
379	95	5
380	95	6
381	95	9
382	95	139
383	95	87
384	95	151
385	95	92
386	95	29
387	95	121
388	95	123
389	96	6
390	98	152
391	100	5
392	100	153
393	100	154
394	100	126
395	100	127
396	102	140
397	102	78
398	102	154
399	102	155
400	102	156
401	102	157
402	103	154
403	104	158
404	104	159
405	105	154
406	106	155
407	107	1
408	107	3
409	107	4
410	107	5
411	107	6
412	107	28
413	107	29
414	108	73
415	108	74
416	108	21
417	108	26
418	108	30
419	108	160
420	108	161
421	108	162
422	108	55
423	108	63
424	109	163
425	109	164
426	109	165
427	109	60
428	109	63
429	110	3
430	110	4
431	110	5
432	110	6
433	110	12
434	110	141
435	110	26
436	110	104
437	110	122
438	110	124
439	111	3
440	111	4
441	111	5
442	111	6
443	111	9
444	111	12
445	111	141
446	111	142
447	111	122
448	112	40
449	112	105
450	112	166
451	113	40
452	113	46
453	113	167
454	114	40
455	114	169
456	114	168
457	115	40
458	115	105
459	115	106
460	116	167
461	116	40
462	116	105
463	116	170
464	116	41
465	116	106
466	116	46
467	117	166
468	117	40
469	117	105
470	117	106
471	117	171
472	117	113
473	118	40
474	118	41
475	118	48
476	119	30
477	119	34
478	119	172
479	119	173
480	119	174
481	119	175
482	119	176
483	119	177
484	120	30
485	120	178
486	120	179
487	120	180
488	120	181
489	120	182
490	120	183
491	120	184
492	120	185
493	120	186
494	120	187
495	120	188
496	120	189
497	120	110
498	120	111
499	120	112
500	120	114
501	120	115
502	121	192
503	121	193
504	121	194
505	121	40
506	121	169
507	121	190
508	121	191
509	122	3
510	122	4
511	122	139
512	122	49
513	122	55
514	122	30
515	123	26
516	123	21
517	124	195
518	124	5
519	124	6
520	124	39
521	124	139
522	124	30
523	125	196
524	125	197
525	125	30
526	125	39
527	126	3
528	126	4
529	126	6
530	126	39
531	126	30
532	127	26
533	127	3
534	127	139
535	127	6
536	128	3
537	128	198
538	128	6
539	128	139
540	128	26
541	130	4
542	130	5
543	130	12
544	130	141
545	130	143
546	130	16
547	130	81
548	130	82
549	130	145
550	131	1
551	131	3
552	131	4
553	131	5
554	131	6
555	131	199
556	131	12
557	131	141
558	131	142
559	131	24
560	132	4
561	132	5
562	132	12
563	132	141
564	132	143
565	133	4
566	133	200
567	133	201
568	133	202
569	133	139
570	133	29
571	133	30
572	133	176
573	133	55
574	134	34
575	134	200
576	134	176
577	134	54
578	134	55
579	134	30
580	134	31
581	135	38
582	135	55
583	135	30
584	135	31
585	136	195
586	136	4
587	136	200
588	136	201
589	136	203
590	136	139
591	136	30
592	136	176
593	136	55
594	137	3
595	137	4
596	137	5
597	137	6
598	137	9
599	137	204
600	137	142
601	137	29
602	137	99
603	137	102
604	137	103
605	138	4
606	138	5
607	138	12
608	138	141
609	138	14
610	138	143
611	138	81
612	138	82
613	138	99
614	139	30
615	140	30
616	141	81
617	141	30
618	141	31
619	142	38
620	142	55
621	142	30
622	142	31
623	143	3
624	143	4
625	143	6
626	143	103
627	143	102
628	143	9
629	143	139
630	144	5
631	144	198
632	144	205
633	144	206
634	144	207
635	144	30
636	145	30
637	146	3
638	146	4
639	146	5
640	146	6
641	146	139
642	147	3
643	147	4
644	147	139
645	148	200
646	148	208
647	148	209
648	148	55
649	148	30
650	149	210
651	150	37
652	150	79
653	150	210
654	150	211
655	150	212
656	151	79
657	151	210
658	151	211
659	151	212
660	151	213
661	151	214
662	151	215
663	151	216
664	151	37
665	152	3
666	152	4
667	152	5
668	153	3
669	153	4
670	153	5
671	153	6
672	153	81
673	153	82
674	153	29
675	153	30
676	154	217
677	154	218
678	154	124
679	154	159
680	155	4
681	155	200
682	155	201
683	155	55
684	155	30
685	156	3
686	156	4
687	156	5
688	156	6
689	156	81
690	156	219
691	156	30
692	157	103
693	157	200
694	157	201
695	157	139
696	157	176
697	157	55
698	157	30
699	158	3
700	158	4
701	158	5
702	158	200
703	158	9
704	158	139
705	158	204
706	158	24
707	158	29
708	158	30
709	158	102
710	158	103
711	158	55
712	159	81
713	159	82
714	159	219
715	159	119
716	160	81
717	160	82
718	160	219
719	161	1
720	161	3
721	161	4
722	161	5
723	161	6
724	161	204
725	161	24
726	161	220
727	161	29
728	161	102
729	161	103
730	162	81
731	163	200
732	163	30
733	163	55
734	164	50
735	164	127
736	165	129
737	165	126
738	165	127
739	166	129
740	166	50
741	166	222
742	166	221
743	166	126
744	166	127
745	167	223
746	167	224
747	167	225
748	167	226
749	167	227
750	167	228
751	167	229
752	167	230
753	167	231
754	168	4
755	168	210
756	168	214
757	168	29
758	168	232
759	168	233
760	168	234
761	168	235
762	168	236
763	168	237
764	169	4
765	169	210
766	169	214
767	169	28
768	169	29
769	169	30
770	169	233
771	169	236
772	169	237
773	170	74
774	170	75
775	170	21
776	170	23
777	170	24
778	170	26
779	170	238
780	170	239
781	170	240
782	170	241
783	170	242
784	170	243
785	170	244
786	170	245
787	170	246
788	171	74
789	171	75
790	171	77
791	171	21
792	171	23
793	171	26
794	171	238
795	171	239
796	171	240
797	171	241
798	171	242
799	171	243
800	172	74
801	172	75
802	172	21
803	172	149
804	172	24
805	172	28
806	172	39
807	172	238
808	172	239
809	172	240
810	172	243
811	172	244
812	173	131
813	173	5
814	173	74
815	173	75
816	173	77
817	173	82
818	173	21
819	173	24
820	173	26
821	173	28
822	173	39
823	173	238
824	173	243
825	174	134
826	174	21
827	174	24
828	174	39
829	174	75
830	174	77
831	174	222
832	174	238
833	174	239
834	174	240
835	174	241
836	174	242
837	174	243
838	174	244
839	174	245
840	174	246
841	174	247
842	174	248
843	174	249
844	175	75
845	175	77
846	175	21
847	175	23
848	175	24
849	175	222
850	175	238
851	175	239
852	175	240
853	176	2
854	176	3
855	176	6
856	176	49
857	176	21
858	176	26
859	177	2
860	177	3
861	177	36
862	177	6
863	177	49
864	178	2
865	178	3
866	178	36
867	178	6
868	178	49
869	179	2
870	179	3
871	179	6
872	179	10
873	179	77
874	179	84
875	179	36
876	179	49
877	180	2
878	180	3
879	180	6
880	180	49
881	180	84
882	181	2
883	181	6
884	181	77
885	181	84
886	181	21
887	182	1
888	182	2
889	182	3
890	182	4
891	182	5
892	182	7
893	182	9
894	182	122
895	182	250
896	183	26
897	183	5
898	184	3
899	184	4
900	184	5
901	184	6
902	185	1
903	185	3
904	185	4
905	185	5
906	185	6
907	185	9
908	185	10
909	186	30
910	187	53
911	188	81
912	188	117
913	188	118
914	188	119
915	188	120
916	189	33
917	189	35
918	189	37
919	189	78
920	189	79
921	189	251
922	190	252
923	190	253
924	190	30
925	191	117
926	191	118
927	192	2
928	192	3
929	192	5
930	192	12
931	192	141
932	192	24
933	193	24
934	193	3
935	193	5
936	193	39
937	194	3
938	194	5
939	194	198
940	194	205
941	194	18
942	194	24
943	194	162
944	194	254
945	194	255
946	195	256
947	195	257
948	195	205
949	195	206
950	195	147
951	195	117
952	195	118
953	195	252
954	195	255
955	196	3
956	196	5
957	196	198
958	196	12
959	196	205
960	196	206
961	196	255
962	197	258
963	197	73
964	197	74
965	197	18
966	197	21
967	197	26
968	197	160
969	197	162
970	197	49
971	198	73
972	198	74
973	198	21
974	198	26
975	198	28
976	198	160
977	198	162
978	198	39
979	199	5
980	200	162
981	200	26
982	200	21
983	201	259
984	201	26
985	201	27
986	202	131
987	202	259
988	202	260
989	202	74
990	202	77
991	202	18
992	202	21
993	202	23
994	202	24
995	202	26
996	202	27
997	202	28
998	202	162
999	203	259
1000	203	261
1001	203	12
1002	203	77
1003	203	23
1004	203	24
1005	203	27
1006	204	261
1007	204	199
1008	204	12
1009	204	141
1010	204	77
1011	204	21
1012	204	23
1013	204	24
1014	204	26
1015	204	162
1016	204	104
1017	205	259
1018	205	131
1019	205	77
1020	205	18
1021	205	23
1022	205	26
1023	205	27
1024	206	259
1025	206	77
1026	206	21
1027	206	23
1028	206	26
1029	206	27
1030	207	12
1031	207	21
1032	208	5
1033	208	21
1034	208	23
1035	208	26
1036	208	27
1037	209	160
1038	209	162
1039	209	73
1040	209	74
1041	209	21
1042	209	26
1043	210	162
1044	210	73
1045	210	74
1046	210	21
1047	210	26
1048	211	131
1049	211	5
1050	211	74
1051	211	18
1052	211	24
1053	211	26
1054	211	160
1055	211	162
1056	211	255
1057	212	131
1058	212	5
1059	212	21
1060	212	26
1061	212	28
1062	213	3
1063	213	5
1064	213	6
1065	213	9
1066	213	12
1067	213	141
1068	213	24
1069	215	3
1070	215	5
1071	215	6
1072	215	262
1073	215	84
1074	215	28
1075	215	29
1076	216	3
1077	217	49
1078	217	2
1079	217	3
1080	217	6
1081	218	49
1082	218	118
1083	218	30
1084	218	55
1085	219	1
1086	219	3
1087	219	4
1088	219	6
1089	219	49
1090	220	1
1091	220	2
1092	220	3
1093	220	4
1094	220	5
1095	220	6
1096	220	29
1097	220	39
1098	220	121
1099	221	1
1100	221	2
1101	221	3
1102	221	4
1103	221	5
1104	221	6
1105	221	9
1106	221	141
1107	221	124
1108	222	1
1109	222	3
1110	222	4
1111	222	5
1112	222	6
1113	222	9
1114	222	24
1115	222	124
1116	223	1
1117	223	2
1118	223	3
1119	223	4
1120	223	5
1121	223	6
1122	223	9
1123	223	10
1124	224	1
1125	224	2
1126	224	3
1127	224	4
1128	224	6
1129	225	195
1130	225	4
1131	225	202
1132	225	139
1133	225	83
1134	225	29
1135	225	30
1136	225	55
1137	226	1
1138	226	2
1139	226	3
1140	226	4
1141	226	5
1142	227	1
1143	227	2
1144	227	3
1145	227	4
1146	227	5
1147	227	9
1148	227	10
1149	228	38
1150	228	34
1151	228	30
1152	228	31
1153	229	1
1154	229	3
1155	229	4
1156	229	5
1157	229	30
1158	230	1
1159	230	3
1160	230	4
1161	230	21
1162	230	30
1163	231	26
1164	231	3
1165	231	5
1166	232	1
1167	232	3
1168	232	4
1169	232	6
1170	232	29
1171	233	3
1172	233	4
1173	233	147
1174	233	6
1175	234	2
1176	235	35
1177	236	37
1178	236	30
1179	236	263
1180	237	5
1181	237	264
1182	237	81
1183	237	82
1184	237	21
1185	238	33
1186	238	35
1187	238	147
1188	238	37
1189	239	24
1190	239	30
1191	240	1
1192	240	2
1193	240	3
1194	240	4
1195	240	5
1196	240	6
1197	240	10
1198	240	21
1199	241	1
1200	241	2
1201	241	3
1202	241	4
1203	241	5
1204	241	6
1205	241	9
1206	241	10
1207	241	250
1208	242	1
1209	242	2
1210	242	3
1211	242	4
1212	242	5
1213	242	6
1214	242	7
1215	242	9
1216	242	10
1217	243	1
1218	243	2
1219	243	3
1220	243	4
1221	243	5
1222	243	6
1223	243	7
1224	243	9
1225	243	10
1226	243	250
1227	244	34
1228	244	38
1229	244	265
1230	244	266
1231	244	53
1232	244	30
1233	244	31
1234	245	53
1235	245	27
1236	245	37
1237	245	6
1238	246	267
1239	246	268
1240	246	269
1241	246	270
1242	246	271
1243	246	272
1244	246	35
1245	246	37
1246	247	3
1247	247	37
1248	247	6
1249	247	232
1250	247	267
1251	248	31
1252	248	30
1253	248	55
1254	249	152
1255	249	273
1256	249	50
1257	249	27
1258	250	37
1259	250	266
1260	250	81
1261	250	274
1262	250	116
1263	250	53
1264	251	3
1265	251	9
1266	251	139
1267	251	275
1268	251	276
1269	251	277
1270	251	278
1271	251	151
1272	251	280
1273	251	281
1274	251	282
1275	251	279
1276	251	37
1277	252	3
1278	252	198
1279	252	263
1280	252	9
1281	252	139
1282	252	277
1283	252	151
1284	252	283
1285	253	3
1286	253	5
1287	253	6
1288	253	198
1289	253	9
1290	253	139
1291	253	151
1292	254	3
1293	254	6
1294	254	9
1295	254	139
1296	254	30
1297	255	3
1298	255	198
1299	255	263
1300	255	9
1301	255	139
1302	255	30
1303	256	33
1304	256	35
1305	256	37
1306	257	35
1307	258	49
1308	258	2
1309	258	3
1310	258	6
1311	259	4
1312	259	39
1313	259	55
1314	259	24
1315	259	30
1316	259	31
1317	260	1
1318	260	2
1319	260	3
1320	260	4
1321	260	5
1322	260	6
1323	260	8
1324	260	9
1325	260	21
1326	260	26
1327	260	122
1328	261	77
1329	261	21
1330	261	150
1331	261	23
1332	261	149
1333	261	24
1334	261	284
1335	261	285
1336	261	286
1337	261	100
1338	261	238
1339	262	126
1340	262	78
1341	262	127
1342	263	9
1343	263	30
1344	263	287
1345	263	288
1346	263	289
1347	263	290
1348	263	291
1349	263	292
1350	263	37
1351	263	108
1352	263	172
1353	263	174
1354	263	177
1355	263	55
1356	264	200
1357	264	9
1358	264	139
1359	264	30
1360	264	287
1361	264	37
1362	264	108
1363	264	174
1364	264	177
1365	264	55
1366	265	200
1367	265	9
1368	265	139
1369	265	140
1370	265	30
1371	265	287
1372	265	288
1373	265	289
1374	265	293
1375	265	107
1376	265	108
1377	265	174
1378	265	177
1379	265	55
1380	266	9
1381	266	139
1382	266	140
1383	266	30
1384	266	287
1385	266	288
1386	266	289
1387	266	291
1388	266	293
1389	266	37
1390	266	174
1391	266	177
1392	266	55
1393	266	200
1394	266	107
1395	266	108
1396	267	200
1397	267	139
1398	267	108
1399	267	174
1400	267	177
1401	267	30
1402	267	287
1403	268	200
1404	268	139
1405	268	30
1406	268	287
1407	268	288
1408	268	289
1409	268	292
1410	268	37
1411	268	293
1412	268	108
1413	268	174
1414	268	177
1415	268	55
1416	269	9
1417	269	139
1418	269	30
1419	269	287
1420	269	288
1421	269	289
1422	269	290
1423	269	291
1424	269	292
1425	269	293
1426	269	174
1427	269	177
1428	269	55
1429	269	200
1430	269	107
1431	269	108
1432	270	9
1433	270	139
1434	270	140
1435	270	30
1436	270	287
1437	270	288
1438	270	289
1439	270	290
1440	270	291
1441	270	292
1442	270	293
1443	270	172
1444	270	174
1445	270	177
1446	270	55
1447	270	200
1448	270	107
1449	270	108
1450	271	200
1451	271	139
1452	271	30
1453	271	287
1454	271	288
1455	271	289
1456	271	291
1457	271	292
1458	271	37
1459	271	108
1460	271	174
1461	271	177
1462	272	200
1463	272	139
1464	272	30
1465	272	287
1466	272	288
1467	272	289
1468	272	291
1469	272	292
1470	272	37
1471	272	108
1472	272	172
1473	272	174
1474	272	177
1475	272	55
1476	273	9
1477	273	139
1478	273	30
1479	273	287
1480	273	288
1481	273	289
1482	273	290
1483	273	291
1484	273	292
1485	273	37
1486	273	172
1487	273	174
1488	273	177
1489	273	55
1490	273	200
1491	273	108
1492	274	200
1493	274	139
1494	274	30
1495	274	287
1496	274	288
1497	274	289
1498	274	291
1499	274	292
1500	274	108
1501	274	172
1502	274	174
1503	274	177
1504	274	55
1505	275	200
1506	275	139
1507	275	30
1508	275	287
1509	275	292
1510	275	108
1511	275	172
1512	275	174
1513	275	177
1514	276	200
1515	276	139
1516	276	30
1517	276	287
1518	276	108
1519	276	174
1520	276	177
1521	276	55
1522	277	200
1523	277	9
1524	277	139
1525	277	30
1526	277	287
1527	277	288
1528	277	292
1529	277	37
1530	277	108
1531	277	174
1532	277	177
1533	277	55
1534	278	200
1535	278	9
1536	278	139
1537	278	30
1538	278	287
1539	278	288
1540	278	292
1541	278	107
1542	278	108
1543	278	174
1544	278	177
1545	278	55
1546	279	200
1547	279	9
1548	279	139
1549	279	30
1550	279	287
1551	279	288
1552	279	290
1553	279	292
1554	279	37
1555	279	108
1556	279	174
1557	279	177
1558	279	55
1559	280	200
1560	280	9
1561	280	139
1562	280	30
1563	280	287
1564	280	288
1565	280	108
1566	280	174
1567	280	177
1568	280	55
1569	281	200
1570	281	9
1571	281	139
1572	281	30
1573	281	287
1574	281	288
1575	281	108
1576	281	174
1577	281	177
1578	281	55
1579	282	200
1580	282	9
1581	282	139
1582	282	30
1583	282	287
1584	282	288
1585	282	290
1586	282	291
1587	282	37
1588	282	108
1589	282	174
1590	282	177
1591	282	55
1592	283	200
1593	283	9
1594	283	139
1595	283	30
1596	283	287
1597	283	288
1598	283	108
1599	283	174
1600	283	177
1601	284	290
1602	284	3
1603	284	37
1604	284	6
1605	284	9
1606	285	37
1607	285	294
1608	285	295
1609	285	296
1610	285	9
1611	285	297
1612	285	147
1613	286	5
1614	286	198
1615	286	295
1616	286	79
1617	286	147
1618	287	37
1619	287	9
1620	287	139
1621	287	147
1622	287	55
1623	287	30
1624	288	40
1625	288	298
1626	288	43
1627	289	48
1628	289	30
1629	289	208
1630	290	33
1631	290	35
1632	290	293
1633	290	208
1634	290	48
1635	290	30
1636	291	4
1637	291	5
1638	291	103
1639	291	28
1640	291	29
1641	292	81
1642	292	82
1643	292	299
1644	292	79
1645	293	35
1646	293	30
1647	294	35
1648	294	55
1649	294	56
1650	294	30
1651	294	31
1652	295	199
1653	295	12
1654	295	21
1655	295	22
1656	295	27
1657	295	104
1658	295	300
1659	295	301
1660	296	5
1661	296	104
1662	296	300
1663	296	12
1664	296	22
1665	297	5
1666	297	104
1667	297	12
1668	297	300
1669	297	21
1670	297	22
1671	297	23
1672	298	5
1673	298	21
1674	298	22
1675	298	23
1676	298	24
1677	298	27
1678	298	300
1679	298	301
1680	299	4
1681	299	234
1682	299	236
1683	299	237
1684	299	29
1685	299	30
1686	300	4
1687	300	5
1688	300	81
1689	300	82
1690	300	28
1691	300	29
1692	300	234
1693	300	235
1694	300	237
1695	300	302
1696	300	303
1697	300	304
1698	300	305
1699	301	4
1700	301	5
1701	301	28
1702	301	29
1703	301	302
1704	301	303
1705	301	305
1706	301	81
1707	301	82
1708	301	87
1709	301	95
1710	301	233
1711	301	234
1712	301	235
1713	301	236
1714	301	237
1715	302	4
1716	302	5
1717	302	82
1718	302	28
1719	302	29
1720	302	233
1721	302	234
1722	302	235
1723	302	237
1724	302	302
1725	302	303
1726	302	304
1727	302	305
1728	303	2
1729	303	3
1730	303	131
1731	303	18
1732	303	21
1733	303	26
1734	303	28
1735	303	29
1736	303	49
1737	303	306
1738	304	2
1739	304	3
1740	304	6
1741	304	18
1742	304	21
1743	304	26
1744	304	28
1745	304	29
1746	304	162
1747	304	39
1748	304	49
1749	304	306
1750	305	3
1751	305	139
1752	305	6
1753	305	92
1754	306	26
1755	306	27
1756	306	21
1757	306	23
1758	307	3
1759	307	4
1760	307	5
1761	307	6
1762	307	9
1763	307	139
1764	307	29
1765	307	307
1766	308	49
1767	308	140
1768	309	3
1769	309	124
1770	309	5
1771	309	6
1772	310	3
1773	310	124
1774	311	3
1775	311	30
1776	312	3
1777	312	4
1778	312	5
1779	312	6
1780	312	9
1781	312	139
1782	312	278
1783	312	151
1784	313	3
1785	313	9
1786	313	139
1787	313	6
1788	314	3
1789	314	5
1790	314	6
1791	314	9
1792	314	139
1793	314	278
1794	314	151
1795	314	280
1796	314	37
1797	314	294
1798	314	296
1799	315	3
1800	315	5
1801	315	37
1802	315	9
1803	315	139
1804	315	278
1805	315	151
1806	316	264
1807	316	9
1808	316	139
1809	316	6
1810	317	3
1811	317	6
1812	317	264
1813	317	9
1814	317	139
1815	318	264
1816	318	9
1817	318	139
1818	318	276
1819	318	278
1820	318	151
1821	318	37
1822	318	308
1823	318	309
1824	319	3
1825	319	37
1826	319	294
1827	319	296
1828	319	139
1829	319	310
1830	322	3
1831	322	5
1832	322	6
1833	322	9
1834	322	139
1835	322	278
1836	322	151
1837	322	311
1838	322	121
1839	323	3
1840	323	5
1841	323	6
1842	323	198
1843	323	314
1844	323	124
1845	323	307
1846	323	312
1847	323	313
1848	323	250
1849	323	315
1850	323	316
1851	323	317
1852	324	9
1853	324	139
1854	326	320
1855	326	198
1856	326	152
1857	326	314
1858	326	124
1859	326	318
1860	326	319
1861	327	321
1862	327	2
1863	327	273
1864	327	152
1865	327	27
1866	327	124
1867	327	318
1868	328	322
1869	328	3
1870	328	37
1871	328	6
1872	328	124
1873	329	35
1874	329	37
1875	329	6
1876	330	81
1877	330	82
1878	331	3
1879	331	37
1880	331	294
1881	331	6
1882	332	3
1883	332	37
1884	332	5
1885	332	6
1886	332	139
1887	335	37
1888	336	3
1889	336	6
1890	336	9
1891	336	139
1892	336	87
1893	336	124
1894	338	3
1895	338	5
1896	338	198
1897	338	9
1898	338	139
1899	338	151
1900	338	122
1901	339	3
1902	339	323
1903	339	5
1904	339	198
1905	339	9
1906	339	139
1907	339	275
1908	339	276
1909	339	151
1910	339	282
1911	339	283
1912	339	308
1913	340	324
1914	340	198
1915	340	135
1916	340	263
1917	340	139
1918	340	283
1919	340	30
1920	340	31
1921	340	33
1922	340	34
1923	340	54
1924	340	55
1925	341	3
1926	341	198
1927	341	9
1928	341	139
1929	341	151
1930	342	198
1931	342	264
1932	342	9
1933	342	139
1934	342	308
1935	342	151
1936	343	3
1937	343	37
1938	343	198
1939	343	9
1940	343	139
1941	343	151
1942	344	3
1943	344	37
1944	344	198
1945	344	5
1946	344	296
1947	344	9
1948	344	139
1949	345	196
1950	345	5
1951	345	4
1952	345	109
1953	345	82
1954	345	87
1955	346	296
1956	346	37
1957	347	9
1958	347	3
1959	347	139
1960	348	3
1961	348	5
1962	348	198
1963	348	9
1964	348	139
1965	348	205
1966	348	206
1967	348	37
1968	349	198
1969	349	9
1970	349	139
1971	349	205
1972	349	207
1973	349	314
1974	349	124
1975	350	3
1976	350	198
1977	350	263
1978	350	9
1979	350	139
1980	350	205
1981	350	151
1982	350	37
1983	351	198
1984	351	139
1985	351	205
1986	351	147
1987	351	314
1988	351	124
1989	352	3
1990	352	198
1991	352	9
1992	352	139
1993	352	205
1994	352	151
1995	352	283
1996	353	3
1997	353	5
1998	353	198
1999	353	263
2000	353	6
2001	353	9
2002	353	139
2003	353	283
2004	354	53
2005	354	139
2006	354	325
2007	354	37
2008	355	3
2009	355	5
2010	355	6
2011	355	326
2012	355	9
2013	355	139
2014	355	278
2015	355	151
2016	355	279
2017	355	37
2018	356	3
2019	356	6
2020	356	267
2021	356	147
2022	356	30
2023	356	35
2024	356	37
2025	356	49
2026	357	82
2027	357	147
2028	357	4
2029	357	6
2030	359	124
2031	360	81
2032	362	3
2033	362	6
2034	362	310
2035	362	86
2036	362	87
2037	366	139
2038	367	139
2039	368	3
2040	368	4
2041	368	5
2042	368	6
2043	368	9
2044	368	139
2045	368	278
2046	368	151
2047	368	24
2048	368	92
2049	368	39
2050	368	121
2051	369	3
2052	369	5
2053	369	6
2054	369	81
2055	369	84
2056	370	3
2057	370	4
2058	370	5
2059	370	6
2060	370	9
2061	370	139
2062	370	278
2063	370	151
2064	370	280
2065	370	121
2066	370	313
2067	373	3
2068	373	5
2069	373	6
2070	373	147
2071	373	122
2072	373	124
2073	374	1
2074	374	3
2075	374	4
2076	374	5
2077	374	6
2078	374	9
2079	374	24
2080	374	124
2081	375	3
2082	375	5
2083	375	6
2084	375	9
2085	375	139
2086	375	151
2087	375	37
2088	375	311
2089	376	9
2090	376	5
2091	376	3
2092	376	37
2093	377	2
2094	377	3
2095	377	6
2096	377	264
2097	377	9
2098	377	267
2099	377	139
2100	377	147
2101	377	35
2102	377	37
2103	377	294
2104	377	49
2105	378	3
2106	378	27
2107	378	6
2108	378	327
2109	379	3
2110	380	81
2111	380	147
2112	380	79
2113	381	81
2114	382	3
2115	382	4
2116	383	1
2117	383	2
2118	383	3
2119	383	4
2120	383	5
2121	383	6
2122	384	1
2123	384	2
2124	384	3
2125	384	4
2126	384	5
2127	384	7
2128	384	9
2129	384	10
2130	385	1
2131	385	3
2132	385	4
2133	385	5
2134	385	7
2135	385	10
2136	386	1
2137	386	2
2138	386	3
2139	386	4
2140	386	5
2141	386	8
2142	386	21
2143	386	26
2144	387	1
2145	387	3
2146	387	4
2147	387	5
2148	387	7
2149	387	9
2150	387	10
2151	388	1
2152	388	3
2153	388	4
2154	388	5
2155	388	7
2156	388	9
2157	388	10
2158	388	250
2159	388	124
2160	389	24
2161	389	2
2162	389	3
2163	389	5
2164	390	131
2165	390	5
2166	390	18
2167	390	21
2168	390	24
2169	390	26
2170	390	28
2171	390	162
2172	390	39
2173	391	3
2174	391	4
2175	391	5
2176	391	205
2177	391	24
2178	392	26
2179	393	1
2180	393	3
2181	393	4
2182	393	5
2183	393	6
2184	393	7
2185	393	9
2186	394	34
2187	394	118
2188	394	4
2189	394	30
2190	395	3
2191	395	4
2192	395	6
2193	395	328
2194	395	140
2195	395	55
2196	395	30
2197	396	4
2198	396	6
2199	396	328
2200	396	140
2201	396	21
2202	396	55
2203	396	30
2204	397	3
2205	397	4
2206	397	5
2207	397	6
2208	397	328
2209	397	140
2210	397	121
2211	398	256
2212	398	257
2213	398	4
2214	398	140
2215	398	30
2216	398	34
2217	398	39
2218	398	55
2219	398	56
2220	398	60
2221	398	328
2222	398	329
2223	398	330
2224	398	117
2225	398	118
2226	398	252
2227	399	256
2228	399	257
2229	399	4
2230	399	328
2231	399	329
2232	399	331
2233	399	140
2234	399	30
2235	399	31
2236	399	34
2237	399	117
2238	399	118
2239	399	55
2240	399	252
2241	400	256
2242	400	257
2243	400	4
2244	400	200
2245	400	328
2246	400	201
2247	400	139
2248	400	332
2249	400	30
2250	400	108
2251	400	117
2252	400	118
2253	400	55
2254	401	4
2255	401	200
2256	401	201
2257	401	328
2258	401	333
2259	401	30
2260	401	118
2261	401	55
2262	402	200
2263	402	139
2264	402	54
2265	402	55
2266	402	118
2267	402	30
2268	403	256
2269	403	257
2270	403	4
2271	403	139
2272	403	30
2273	403	55
2274	403	200
2275	403	329
2276	403	328
2277	403	201
2278	403	332
2279	403	202
2280	403	108
2281	403	117
2282	403	118
2283	403	252
2284	404	3
2285	404	4
2286	404	5
2287	404	6
2288	404	334
2289	404	147
2290	404	122
2291	406	3
2292	406	4
2293	406	6
2294	407	81
2295	407	84
2296	407	4
2297	407	118
2298	408	3
2299	408	5
2300	408	6
2301	408	39
2302	408	147
2303	409	3
2304	409	5
2305	409	6
2306	409	39
2307	410	1
2308	410	3
2309	410	4
2310	410	5
2311	410	6
2312	410	9
2313	410	139
2314	410	24
2315	410	92
2316	411	1
2317	411	3
2318	411	4
2319	411	5
2320	411	6
2321	411	147
2322	411	122
2323	412	6
2324	413	131
2325	413	260
2326	413	306
2327	413	50
2328	413	315
2329	413	335
2330	413	336
2331	413	337
2332	413	338
2333	413	339
2334	413	340
2335	413	341
2336	413	342
2337	413	87
2338	413	344
2339	413	345
2340	413	346
2341	413	347
2342	413	343
2343	413	124
2344	414	3
2345	414	4
2346	414	6
2347	414	29
2348	414	95
2349	415	26
2350	415	2
2351	415	29
2352	415	6
2353	416	1
2354	416	3
2355	416	4
2356	416	5
2357	416	6
2358	416	39
2359	416	49
2360	416	121
2361	417	3
2362	417	4
2363	417	5
2364	417	6
2365	417	205
2366	417	206
2367	417	26
2368	417	30
2369	418	128
2370	418	129
2371	418	131
2372	418	132
2373	418	5
2374	418	137
2375	418	126
2376	418	127
2377	420	40
2378	420	169
2379	420	191
2380	420	208
2381	420	348
2382	420	349
2383	420	350
2384	420	351
2385	420	352
2386	420	353
2387	420	354
2388	420	355
2389	420	356
2390	420	357
2391	420	358
2392	420	359
2393	420	360
2394	420	361
2395	420	362
2396	421	37
2397	422	129
2398	422	131
2399	422	132
2400	422	5
2401	422	137
2402	422	138
2403	422	363
2404	422	126
2405	422	127
2406	423	4
2407	423	5
2408	423	81
2409	423	82
2410	423	28
2411	423	29
2412	423	95
2413	423	39
2414	423	303
2415	424	3
2416	424	4
2417	424	5
2418	424	6
2419	425	4
2420	425	200
2421	425	55
2422	425	28
2423	425	29
2424	425	30
2425	426	210
2426	426	212
2427	426	364
2428	427	366
2429	427	37
2430	427	365
2431	427	310
2432	435	167
2433	435	40
2434	435	105
2435	435	169
2436	435	41
2437	435	367
2438	435	368
2439	435	369
2440	435	370
2441	435	371
2442	437	32
2443	437	37
2444	437	30
2445	438	30
2446	438	31
2447	438	33
2448	438	34
2449	438	35
2450	438	37
2451	438	372
2452	438	373
2453	438	54
2454	438	374
2455	439	3
2456	439	4
2457	439	5
2458	439	6
2459	439	21
2460	439	26
2461	440	135
2462	440	172
2463	440	375
2464	440	376
2465	440	377
2466	440	378
2467	441	37
2468	441	38
2469	441	54
2470	441	379
2471	441	30
2472	441	31
2473	442	2
2474	442	263
2475	442	213
2476	442	33
2477	442	35
2478	442	37
2479	442	364
2480	442	49
2481	442	380
2482	443	384
2483	443	78
2484	443	89
2485	443	33
2486	443	35
2487	443	37
2488	443	48
2489	443	56
2490	443	381
2491	443	382
2492	443	383
2493	444	40
2494	444	41
2495	444	48
2496	444	208
2497	444	30
5005	1002	40
5132	1018	40
5133	1018	41
5134	1002	44
5135	1018	1001
5136	1018	1002
5137	1019	3
5138	1019	4
5139	1019	5
5142	1019	88
5144	1019	91
5145	1019	1003
5146	1020	3
5147	1020	4
5148	1020	5
5149	1020	7
5150	1020	12
5151	1020	141
5152	1020	142
5153	1020	16
5154	1020	91
5155	1022	79
5157	1022	33
5158	1022	35
5159	1022	36
5160	1022	37
5164	1022	1005
5165	1022	1006
5166	1022	48
5168	1022	380
5169	1022	1008
5170	1023	3
5171	1023	4
5172	1023	5
5173	1023	6
5174	1023	12
5175	1023	24
5176	1024	40
5177	1024	105
5178	1024	106
5179	1024	171
5180	1024	1009
5181	1024	1010
5182	1024	113
5183	1024	1011
5184	1024	186
5185	1025	40
5186	1025	105
5187	1025	106
5188	1025	171
5189	1025	1009
5190	1025	1010
5191	1025	113
5192	1025	1011
5193	1025	186
5194	1026	3
5195	1026	4
5196	1026	5
5197	1026	6
5198	1026	24
5199	1026	26
5200	1027	96
5201	1027	81
5203	1027	1012
5204	1027	95
\.


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_tag (id, tag) FROM stdin;
1	town
2	house
3	architecture
4	city
5	travel
6	building
7	cityscape
8	hill
9	church
10	roof
11	sight
12	water
13	seashore
14	sea
15	beach
16	harbor
17	flower
18	garden
19	flower arrangement
20	patio
21	landscape
22	mountain
23	nature
24	outdoors
25	rock
26	tree
27	wood
28	road
29	street
30	people
31	adult
32	child
33	furniture
34	man
35	room
36	family
37	indoors
38	one
39	daylight
40	food
41	meal
42	tableware
43	drink
44	coffee
45	cup
46	grow
47	tea
48	table
49	home
50	desktop
51	abstract
52	color
53	industry
54	woman
55	group
56	education
57	group together
58	classroom
59	teacher
60	school
61	tennis
62	recreation
63	competition
64	racket
65	tennis match
66	ball
67	athlete
68	leisure
69	sports equipment
70	tennis ball
71	tournament
72	climb
73	golf
74	grass
75	farm
76	golfer
77	environment
78	business
79	exhibition
80	portrait
81	vehicle
82	transportation system
83	offense
84	calamity
85	apartment
86	modern
87	urban
88	skyscraper
89	office
90	downtown
91	skyline
92	tower
93	finance
94	tallest
95	car
96	drive
97	pepper
98	strength
99	sunset
100	dawn
101	sun
102	dusk
103	evening
104	lake
105	cooking
106	pan
107	leader
108	ceremony
109	blur
110	flame
111	coal
112	charcoal
113	stove
114	smoke
115	heat
116	grinder
117	war
118	military
119	aircraft
120	airplane
121	tourism
122	castle
123	landmark
124	old
125	tourist
126	graph
127	map
128	diagram
129	cartography
130	growth
131	guidance
132	geography
133	atlas
134	country
135	illustration
136	Continent
137	ball-shaped
138	location
139	religion
140	administration
141	river
142	bridge
143	watercraft
144	boat
145	ship
146	university
147	museum
148	canal
149	storm
150	rain
151	cathedral
152	retro
153	document
154	paper
155	number
156	currency
157	money
158	calendar
159	time
160	lawn
161	mammal
162	park
163	soccer
164	stadium
165	football
166	meat
167	vegetable
168	rice
169	dinner
170	herb
171	frying pan
172	music
173	musician
174	performance
175	instrument
176	festival
177	concert
178	fireplace
179	firewood
180	campfire
181	burn
182	fuel
183	forge
184	blacksmith
185	furnace
186	hot
187	ash
188	burnt
189	bonfire
190	bread
191	lunch
192	delicious
193	breakfast
194	toast
195	battle
196	motion
197	action
198	art
199	reflection
200	many
201	crowd
202	police
203	rebellion
204	illuminated
205	sculpture
206	statue
207	metalwork
208	restaurant
209	commerce
210	stock
211	displayed
212	market
213	interior design
214	shopping
215	carnival
216	bar
217	clock
218	mechanism
219	spacecraft
220	square
221	screen
222	soil
223	template
224	layout
225	presentation
226	tag
227	World Wide Web
228	facts
229	information
230	page
231	banner
232	subway system
233	commuter
234	train
235	locomotive
236	bus
237	railway
238	agriculture
239	field
240	cropland
241	rural
242	countryside
243	hayfield
244	grassland
245	pasture
246	crop
247	hay
248	wheat
249	bale
250	Gothic
251	television
252	weapon
253	technology
254	summer
255	fountain
256	soldier
257	army
258	hedge
259	leaf
260	footpath
261	pool
262	signal
263	painting
264	window
265	artisan
266	production
267	abandoned
268	eerie
269	shadow
270	dark
271	creepy
272	decay
273	wooden
274	exploration
275	communion table
276	chapel
277	cross
278	goth like
279	bench
280	turning point
281	altar
282	religious
283	saint
284	weather
285	fog
286	mist
287	auditorium
288	theater
289	stage
290	opera
291	theatre
292	audience
293	chair
294	ceiling
295	gold
296	inside
297	casino
298	wine
299	wheel
300	snow
301	scenic
302	tramway
303	traffic
304	public
305	tram
306	pavement
307	door
308	stained glass
309	god
310	glass items
311	arch
312	entrance
313	facade
314	ancient
315	stone
316	doorway
317	exterior
318	antique
319	style
320	classic
321	vintage
322	container
323	spirituality
324	print
325	steel
326	column
327	carpentry
328	flag
329	guard
330	parliament
331	uniform
332	parade
333	rally
334	baroque
335	cobblestone
336	pattern
337	paving
338	texture
339	floor
340	expression
341	Earth surface
342	avenue
343	rough
344	brick
345	granite
346	cube
347	ground
348	pizza
349	dough
350	pepperoni
351	mozzarella
352	cheese
353	crust
354	fast
355	salami
356	sauce
357	slice
358	tomato
359	supreme
360	ham
361	unhealthy
362	mushroom
363	navigation
364	shelf
365	luxury
366	decoration
367	cabbage
368	salad
369	healthy
370	bowl
371	cuisine
372	facial expression
373	two
374	wear
375	movie
376	sketch
377	entertainment
378	fun
379	girl
380	contemporary
381	desk
382	meeting
383	league
384	conference room
1000	plate
1001	korean
1002	kimchi
1003	qingdao
1004	trading floor
1005	seat
1006	bookcase
1007	vase
1008	Korea
1009	pot
1010	kitchenware
1011	cookware
1012	drag race
\.


--
-- Data for Name: blog_theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_theme (id, name, create_dt, author_id, public) FROM stdin;
6	일상생활	2017-12-03 04:09:40.996349+08	3	t
7	일상생활	2017-12-21 08:03:18.546248+08	2	t
8	체코여행	2017-12-23 03:07:55.885076+08	3	t
1011	HongKong Travel 2017	2017-12-29 16:45:49.68225+08	1	t
1014	General Life	2017-12-29 17:06:03.405813+08	1005	t
1015	General Life	2017-12-29 17:15:10.898305+08	1006	t
1016	General Life	2017-12-29 17:20:56.053255+08	1007	t
1017	HongKong Travel 2017	2017-12-30 10:58:38.337673+08	3	t
1	世界旅游	2017-11-30 23:12:01.123922+08	1	t
5	General Life	2017-12-02 00:41:23.939745+08	1	t
4	中国旅游	2017-12-01 23:09:07.61585+08	1	f
3	好吃的地方	2017-12-01 08:42:06.382922+08	1	t
2	美国	2017-11-30 23:12:10.254411+08	1	t
1018	General Life	2018-01-19 10:21:52.717382+08	1008	t
1019	General Life	2018-01-19 12:25:51.506584+08	1009	t
\.


--
-- Data for Name: comment_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_comment (id, comment, create_dt, create_user_id, post_id) FROM stdin;
1	이것이 테스트 커멘트 입니다.	2017-12-21 06:49:23.87345+08	1	53
2	해당 사용자가 등록합니다. 삭제 기능이 나올까요?	2017-12-21 07:27:53.022423+08	2	53
3	입력 테스트 잘 될까요?	2017-12-21 07:39:25.52775+08	2	53
4	다시 이번에는 될 거다	2017-12-21 07:40:42.585466+08	2	53
5	결혼 축하해	2017-12-21 07:42:21.135472+08	2	52
6	멋지다	2017-12-21 07:44:21.597288+08	2	23
7	차가 재미있네요.	2017-12-21 08:22:20.572172+08	2	55
8	중국은 항상 기발합니다.	2017-12-21 08:50:56.841134+08	2	55
9	挺有意思	2017-12-22 02:25:29.14644+08	4	55
10	Quite interesting.	2017-12-22 10:42:56.639686+08	1	55
11	祝贺	2017-12-22 10:43:43.652962+08	1	52
12	好吃吗？	2017-12-22 10:44:00.072713+08	1	51
13	커멘트가 가겠지....	2017-12-22 12:12:50.371769+08	1	55
14	커멘트를 보내보자...	2017-12-22 12:14:34.335662+08	1	55
15	두번째...	2017-12-22 12:14:50.468226+08	1	55
17	공연장이 멋지네	2017-12-23 00:59:00.108415+08	2	283
18	성당이 멋진데....	2017-12-23 01:02:57.729278+08	2	318
19	hello	2017-12-24 06:16:59.399437+08	1	427
20	하나가 보았어요	2017-12-24 06:18:29.850705+08	2	427
21	배추 김치 맛있나요?	2017-12-25 01:14:56.432363+08	3	435
22	位置很准确的	2017-12-26 04:50:20.008301+08	1	443
23	还吃吗？	2017-12-26 07:19:23.156543+08	2	435
1000	커멘트..	2017-12-29 16:40:03.569976+08	3	1018
1001	zzz	2017-12-29 16:44:04.63627+08	1	1018
1002	delicious	2017-12-29 16:44:22.150065+08	1	1002
1003	好看	2018-01-10 09:13:50.365287+08	1	1020
1004	테스트....	2018-01-19 17:04:15.344312+08	3	1023
1005	kkk	2018-01-24 14:21:16.049457+08	1	1027
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) FROM stdin;
1	1	백두대간 종주	1	[{"added": {}}]	9	1	2017-11-30 23:12:01.124826+08
2	2	세계 일주	1	[{"added": {}}]	9	1	2017-11-30 23:12:10.255427+08
3	4	Post object	3		10	1	2017-11-30 23:38:30.001897+08
4	3	Post object	3		10	1	2017-11-30 23:38:30.007212+08
5	2	Post object	3		10	1	2017-11-30 23:44:51.482759+08
6	1	Post object	3		10	1	2017-11-30 23:44:51.488079+08
7	10	Post object	3		10	1	2017-12-01 00:29:05.023641+08
8	9	Post object	3		10	1	2017-12-01 00:29:05.027646+08
9	8	Post object	3		10	1	2017-12-01 00:29:05.030209+08
10	7	Post object	3		10	1	2017-12-01 00:29:05.033172+08
11	6	Post object	3		10	1	2017-12-01 00:29:05.035366+08
12	5	Post object	3		10	1	2017-12-01 00:29:05.037867+08
13	7	/media/contents/2017/12/IMG_1309_f1Hw8SF.JPG	3		7	1	2017-12-01 00:33:22.573179+08
14	6	/media/contents/2017/12/IMG_1309.JPG	3		7	1	2017-12-01 00:33:22.576644+08
15	5	/media/contents/2017/11/IMG_1309.JPG	3		7	1	2017-12-01 00:33:22.579081+08
16	4	/media/contents/2017/11/IMG_1289_dvzQmKE.JPG	3		7	1	2017-12-01 00:33:22.581667+08
17	3	/media/contents/2017/11/IMG_1289.JPG	3		7	1	2017-12-01 00:33:22.584174+08
18	11	Post object	2	[{"changed": {"fields": ["lat", "lng"]}}]	10	1	2017-12-01 00:39:24.118385+08
19	1	happy	2	[{"changed": {"fields": ["first_name"]}}]	4	1	2017-12-01 00:45:51.78284+08
20	15	Post object	3		10	1	2017-12-01 08:41:07.743592+08
21	14	Post object	3		10	1	2017-12-01 08:41:07.745404+08
22	13	Post object	3		10	1	2017-12-01 08:41:07.746731+08
23	12	Post object	3		10	1	2017-12-01 08:41:07.748548+08
24	11	Post object	3		10	1	2017-12-01 08:41:07.749973+08
25	3	맛집 기행	1	[{"added": {}}]	9	1	2017-12-01 08:42:06.383453+08
26	2	xmlyoon	1	[{"added": {}}]	4	1	2017-12-01 08:43:00.356938+08
27	2	xmlyoon	2	[{"changed": {"fields": ["first_name", "is_staff", "is_superuser"]}}]	4	1	2017-12-01 08:43:26.73927+08
28	18	Post object	3		10	1	2017-12-01 08:45:42.305736+08
29	4	중국기행	1	[{"added": {}}]	9	1	2017-12-01 23:09:07.618554+08
30	5	일상	1	[{"added": {}}]	9	1	2017-12-02 00:41:23.940876+08
31	22	Post object	3		10	1	2017-12-02 00:43:30.619859+08
32	3	happy@naver.com	2	[{"changed": {"fields": ["first_name"]}}]	4	3	2017-12-03 03:16:54.62663+08
33	2	Namju	1	[{"added": {}}]	11	3	2017-12-03 03:19:20.305459+08
34	1	happy@daum.net	2	[{"changed": {"fields": ["username"]}}]	4	3	2017-12-03 03:22:32.786159+08
35	1	happy@daum.net	2	[{"changed": {"fields": ["email"]}}]	4	3	2017-12-03 03:22:51.072101+08
36	3	njyoon@naver.com	2	[{"changed": {"fields": ["username", "first_name", "email"]}}]	4	3	2017-12-03 03:50:41.385132+08
37	1	happy@daum.net	2	[{"changed": {"fields": ["first_name"]}}]	4	3	2017-12-03 03:50:59.699023+08
38	3	xmlyoon	1	[{"added": {}}]	11	3	2017-12-03 03:52:00.937465+08
39	2	xmlyoon@daum.net	2	[{"changed": {"fields": ["username", "email"]}}]	4	3	2017-12-03 03:52:18.207965+08
40	6	일상생활	1	[{"added": {}}]	9	3	2017-12-03 04:09:40.997549+08
41	1	happy@daum.net	2	[]	4	1	2017-12-04 05:58:26.597059+08
42	25	Post object	2	[{"changed": {"fields": ["text"]}}]	10	1	2017-12-04 06:09:23.408297+08
43	25	Post object	2	[{"changed": {"fields": ["text"]}}]	10	1	2017-12-04 06:09:57.287892+08
44	51	/media/contents/2017/12/IMG_1489.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:50:47.918716+08
45	50	/media/contents/2017/12/IMG_1463.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:04.039386+08
46	49	/media/contents/2017/12/IMG_1444.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:14.050032+08
47	48	/media/contents/2017/12/IMG_1427.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:23.075639+08
48	47	/media/contents/2017/12/IMG_1366.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:32.634396+08
49	46	/media/contents/2017/12/IMG_1310.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:41.568637+08
50	45	/media/contents/2017/12/IMG_1254.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:50.476323+08
51	44	/media/contents/2017/12/IMG_1252.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:51:59.482281+08
52	43	/media/contents/2017/12/IMG_1028.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:52:08.845267+08
53	42	/media/contents/2017/12/IMG_1001.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:52:17.662297+08
54	41	/media/contents/2017/12/IMG_0994.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:52:35.93284+08
55	40	/media/contents/2017/12/IMG_0815.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:52:45.89336+08
56	39	/media/contents/2017/12/IMG_0773.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:52:54.712293+08
57	38	/media/contents/2017/12/IMG_0720.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:53:04.338269+08
58	37	/media/contents/2017/12/IMG_0688.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:53:17.083126+08
59	36	/media/contents/2017/12/IMG_0651.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:53:27.704169+08
60	35	/media/contents/2017/12/IMG_0644.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:54:54.497569+08
61	34	/media/contents/2017/12/IMG_0579.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:55:05.075109+08
62	33	/media/contents/2017/12/IMG_0540.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:55:16.041726+08
63	31	/media/contents/2017/12/IMG_0304.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:56:26.984351+08
64	30	/media/contents/2017/12/IMG_0124.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:56:36.528409+08
65	29	/media/contents/2017/12/IMG_0084.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:56:46.865247+08
66	28	/media/contents/2017/12/IMG_0033.JPG	2	[{"changed": {"fields": ["file"]}}]	7	1	2017-12-14 11:56:56.556125+08
67	32	/media/Users/happy/Django/simpleMenu/media/drive/IMG_0343.JPG	3		7	3	2017-12-14 12:00:21.8812+08
68	27	/media/Users/happy/Beautiful/drive/IMG_0033.JPG	3		7	3	2017-12-14 12:00:21.888566+08
69	23	/media/contents/2017/12/IMG_0911.JPG	3		7	3	2017-12-14 12:01:16.748997+08
70	21	/media/contents/2017/12/IMG_0623.JPG	3		7	3	2017-12-14 12:01:16.751215+08
71	11	/media/contents/2017/12/IMG_1311_tRDn7a8.JPG	3		7	3	2017-12-14 12:01:16.753052+08
72	10	/media/contents/2017/12/IMG_1311.JPG	3		7	3	2017-12-14 12:01:16.754634+08
73	28	Post object	3		10	3	2017-12-14 12:02:48.964022+08
74	24	Post object	3		10	3	2017-12-14 12:02:48.966885+08
75	1	1	1	[{"added": {}}]	13	2	2017-12-21 06:49:23.874735+08
76	2	2	1	[{"added": {}}]	13	2	2017-12-21 07:27:53.023946+08
77	3	3	2	[{"changed": {"fields": ["create_user"]}}]	13	2	2017-12-21 07:40:57.837313+08
78	7	일상생활	1	[{"added": {}}]	9	2	2017-12-21 08:03:18.547485+08
79	54	Post object	3		10	2	2017-12-21 08:18:50.209156+08
80	4	happyhao@daum.net	2	[{"changed": {"fields": ["first_name"]}}]	4	4	2017-12-22 02:24:03.105509+08
81	2	Happy	1	[{"added": {}}]	15	4	2017-12-22 02:40:20.036699+08
82	3	NJYOON	1	[{"added": {}}]	15	4	2017-12-22 02:40:28.015047+08
83	4	xmlyoon	1	[{"added": {}}]	15	4	2017-12-22 02:40:33.041853+08
84	1	JungHeui -> Happy	1	[{"added": {}}]	16	2	2017-12-22 09:35:43.247605+08
85	2	Happy -> JungHeui	1	[{"added": {}}]	16	2	2017-12-22 09:35:51.504234+08
86	3	JungHeui -> NJYOON	1	[{"added": {}}]	16	2	2017-12-22 09:36:00.858837+08
87	3	JungHeui -> NJYOON	2	[]	16	2	2017-12-22 09:48:36.241691+08
88	2	Happy -> JungHeui	2	[]	16	2	2017-12-22 09:48:39.166719+08
89	1	JungHeui -> Happy	2	[]	16	2	2017-12-22 09:48:41.536289+08
90	4	NJYOON -> JungHeui	1	[{"added": {}}]	16	2	2017-12-22 09:49:49.075463+08
91	5	xmlyoon -> NJYOON	1	[{"added": {}}]	16	2	2017-12-22 10:11:51.293187+08
92	6	NJYOON -> xmlyoon	1	[{"added": {}}]	16	2	2017-12-22 10:11:58.268576+08
93	7	Happy -> NJYOON	1	[{"added": {}}]	16	2	2017-12-22 10:13:15.425876+08
94	8	Happy -> xmlyoon	1	[{"added": {}}]	16	2	2017-12-22 10:13:24.068152+08
95	9	Happy -> Happy	1	[{"added": {}}]	16	2	2017-12-22 10:14:22.786215+08
96	10	xmlyoon -> xmlyoon	1	[{"added": {}}]	16	1	2017-12-22 12:25:31.783614+08
97	25	25 - 북한의 지난달 29일 신형 대륙간탄도미사일(ICBM) 화성-15형 발사 시험이후 미국의 태도가 눈에 띄게 달라지고 있다. \n허버트 맥매스터 백악관 국가안보보좌관이 2일 “북한과 전쟁 가능성이 매일 커지고 있다.	3		10	2	2017-12-22 13:40:21.896837+08
98	56	56 - 희경이와 함께	3		10	2	2017-12-22 15:01:44.773378+08
99	57	57 - 희경이와 함께	3		10	2	2017-12-22 15:03:35.181218+08
100	58	58 - 희경이와 함께	3		10	2	2017-12-22 15:07:06.376817+08
101	60	60 - 희경이와 함께	3		10	2	2017-12-22 15:12:00.414048+08
102	59	59 - 희경이와 함께	3		10	2	2017-12-22 15:12:00.427133+08
103	61	61 - 희경이와 함께	3		10	2	2017-12-22 15:24:53.766704+08
104	62	62 - 희경이와 함께	3		10	2	2017-12-22 15:28:57.380371+08
105	63	63 - 희경	3		10	2	2017-12-22 15:31:20.320673+08
106	64	64 - 희경	3		10	2	2017-12-22 15:37:44.288535+08
107	68	68 - None	3		10	2	2017-12-23 00:27:45.37207+08
108	67	67 - None	3		10	2	2017-12-23 00:27:45.389258+08
109	66	66 - None	3		10	2	2017-12-23 00:27:45.407353+08
110	65	65 - None	3		10	2	2017-12-23 00:27:45.424955+08
111	59	/media/contents/2017/aa/IMG_1221.JPG	3		7	2	2017-12-23 00:29:20.178126+08
112	58	/media/contents/2017/aa/IMG_1221.JPG	3		7	2	2017-12-23 00:29:20.192762+08
113	11	NJYOON -> NJYOON	1	[{"added": {}}]	16	2	2017-12-23 01:06:28.956505+08
114	405	405 - None	3		10	2	2017-12-23 01:21:50.186613+08
115	8	체코여행	1	[{"added": {}}]	9	2	2017-12-23 03:07:55.892478+08
116	427	427 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.487677+08
117	426	426 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.523183+08
118	425	425 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.550815+08
119	424	424 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.578163+08
120	423	423 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.607027+08
121	422	422 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.636256+08
122	421	421 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.663709+08
123	420	420 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.693452+08
124	419	419 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.726306+08
125	418	418 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.77067+08
126	417	417 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.817037+08
127	416	416 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.845639+08
128	415	415 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.879747+08
129	414	414 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.910151+08
130	413	413 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.945879+08
131	412	412 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:47.977773+08
132	411	411 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.019685+08
133	410	410 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.05244+08
134	409	409 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.085691+08
135	408	408 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.12029+08
136	407	407 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.151291+08
137	406	406 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.179092+08
138	404	404 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.209459+08
139	403	403 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.236718+08
140	402	402 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.264601+08
141	401	401 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.293296+08
142	400	400 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.322387+08
143	399	399 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.351104+08
144	398	398 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.377996+08
145	397	397 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.405961+08
146	396	396 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.433152+08
147	395	395 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.462117+08
148	394	394 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.494688+08
149	393	393 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.526993+08
150	392	392 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.553351+08
151	391	391 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.581455+08
152	390	390 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.61333+08
153	389	389 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.6424+08
154	388	388 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.671435+08
155	387	387 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.699407+08
156	386	386 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.731267+08
157	385	385 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.760736+08
158	384	384 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.791731+08
159	383	383 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.82437+08
160	382	382 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.868453+08
161	381	381 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.9112+08
162	380	380 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.943631+08
163	379	379 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:48.970592+08
164	378	378 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.002462+08
165	377	377 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.035687+08
166	376	376 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.068469+08
167	375	375 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.095154+08
168	374	374 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.122838+08
169	373	373 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.149574+08
170	372	372 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.176186+08
171	371	371 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.208363+08
172	370	370 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.23474+08
173	369	369 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.262499+08
174	368	368 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.291358+08
175	367	367 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.316982+08
176	366	366 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.343663+08
177	365	365 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.370116+08
178	364	364 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.398071+08
179	363	363 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.425322+08
180	362	362 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.453095+08
181	361	361 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.479193+08
182	360	360 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.515812+08
183	359	359 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.543075+08
184	358	358 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.570955+08
185	357	357 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.599773+08
186	356	356 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.628922+08
187	355	355 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.656202+08
188	354	354 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.683749+08
189	353	353 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.709909+08
190	352	352 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.736579+08
191	351	351 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.762887+08
192	350	350 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.793497+08
193	349	349 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.821458+08
194	348	348 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.848595+08
195	347	347 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.875144+08
196	346	346 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.903653+08
197	345	345 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.949384+08
198	344	344 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:49.995273+08
199	343	343 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.029685+08
200	342	342 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.056084+08
201	341	341 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.084486+08
202	340	340 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.113393+08
203	339	339 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.141455+08
204	338	338 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.170452+08
205	337	337 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.203644+08
206	336	336 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.235293+08
207	335	335 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.267027+08
208	334	334 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.29987+08
209	333	333 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.330502+08
210	332	332 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.358996+08
211	331	331 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.385485+08
212	330	330 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.411938+08
213	329	329 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.438623+08
214	328	328 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.465492+08
215	327	327 - None	2	[{"changed": {"fields": ["theme"]}}]	10	2	2017-12-23 03:16:50.494858+08
216	3	njyoon	2	[{"changed": {"fields": ["nickname"]}}]	15	2	2017-12-24 12:45:47.159773+08
217	2	happy	2	[{"changed": {"fields": ["nickname"]}}]	15	2	2017-12-24 12:45:47.188142+08
218	1	happyhao	2	[{"changed": {"fields": ["nickname"]}}]	15	2	2017-12-24 12:45:47.216017+08
219	430	430 - 남산의 가을 단풍	3		10	3	2017-12-24 16:26:19.550927+08
220	429	429 - 가을 단풍	3		10	3	2017-12-24 16:26:19.570532+08
221	428	428 - 가을 단풍	3		10	3	2017-12-24 16:26:19.584845+08
222	431	431 - 청도 김치	3		10	3	2017-12-25 00:27:13.14158+08
223	433	433 - None	3		10	3	2017-12-25 00:40:52.350491+08
224	432	432 - 청도 김치	3		10	3	2017-12-25 00:40:52.373592+08
225	434	434 - 청도 김치	3		10	3	2017-12-25 00:42:12.487292+08
226	5	일상생활	2	[{"changed": {"fields": ["name"]}}]	9	1	2017-12-25 09:59:11.246401+08
227	436	436 - 엄마와 성규	3		10	1	2017-12-25 10:02:21.042217+08
228	8	체코여행	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:43:51.939539+08
229	7	일상생활	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.595407+08
230	6	일상생활	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.621763+08
231	5	일상생활	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.65059+08
232	4	중국기행	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.677759+08
233	3	맛집 기행	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.704553+08
234	2	세계 일주	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.733012+08
235	1	백두대간 종주	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 11:44:27.761173+08
236	5	일상생활	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 12:07:42.984799+08
237	5	일상생활	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 12:38:02.917163+08
238	4	중국기행	2	[{"changed": {"fields": ["status"]}}]	9	1	2017-12-25 12:38:02.944372+08
239	442	442 - 안양	2	[{"changed": {"fields": ["theme"]}}]	10	1	2017-12-25 12:38:37.351024+08
240	441	441 - 상해 출장	2	[{"changed": {"fields": ["theme"]}}]	10	1	2017-12-25 12:38:37.385661+08
241	1	Invitee object	1	[{"added": {}}]	18	1	2017-12-25 12:39:06.493941+08
242	2	Invitee object	1	[{"added": {}}]	18	1	2017-12-25 13:03:45.462994+08
243	21	<a href="/user/njyoon@naver.com/">NJYOON</a> invited you for his a theme: <a href="/blog/njyoon@naver.com/4/">중국기행</a>	1	[{"added": {}}]	17	1	2017-12-25 13:47:15.116724+08
244	12	njyoon -> happy	1	[{"added": {}}]	16	1	2017-12-26 01:18:07.545815+08
245	2	Invitee object	3		18	1	2017-12-26 06:10:28.530219+08
246	1	Invitee object	3		18	1	2017-12-26 06:10:28.547073+08
247	3	Invitee object	3		18	1	2017-12-26 06:13:14.579777+08
248	21	<a href="/user/njyoon@naver.com/">NJYOON</a> invited you for his a theme: <a href="/blog/njyoon@naver.com/4/">중국기행</a>	3		17	1	2017-12-26 06:22:28.991252+08
249	5	Invitee object	3		18	1	2017-12-26 06:22:43.698824+08
250	4	Invitee object	3		18	1	2017-12-26 06:22:43.713014+08
251	4	xmlyoon	2	[{"changed": {"fields": ["nickname"]}}]	15	3	2017-12-26 11:20:28.667091+08
252	13	xmlyoon -> happy	1	[{"added": {}}]	16	3	2017-12-26 11:21:22.700903+08
253	5	KKK	2	[{"changed": {"fields": ["nickname"]}}]	15	1	2017-12-27 00:25:40.420325+08
254	5	kkk@daum.net	3		4	1	2017-12-27 00:25:54.267588+08
255	6	kkk@daum.net	3		4	1	2017-12-27 00:27:38.330228+08
256	7	kkk@daum.net	3		4	1	2017-12-27 00:31:04.349685+08
257	8	kkk@daum.net	3		4	1	2017-12-27 00:31:47.772376+08
1000	1004	2017 Europe	3		9	3	2017-12-28 20:05:19.845718+08
1001	1003	HongKong Travel	3		9	3	2017-12-28 20:05:19.887618+08
1002	1006	HongKong Travel 2018	3		9	3	2017-12-28 20:08:04.220177+08
1003	1005	HongKong Travel 2017	3		9	3	2017-12-28 20:08:04.253703+08
1004	1010	HongKong Travel 2020	3		9	3	2017-12-29 08:41:45.867325+08
1005	1009	HongKong Travel 2019	3		9	3	2017-12-29 08:41:45.889746+08
1006	1008	HongKong Travel 2018	3		9	3	2017-12-29 08:41:45.908319+08
1007	1007	HongKong Travel 2017	3		9	3	2017-12-29 08:41:45.916116+08
1008	1000	1000 - kkk	3		10	3	2017-12-29 10:25:11.948991+08
1009	1001	1001 - 서양식	3		10	3	2017-12-29 10:28:28.071645+08
1010	1002	1002 - 서양식	2	[]	10	3	2017-12-29 12:57:59.911454+08
1011	1005	1005 - 삼겹살	3		10	3	2017-12-29 14:29:24.295261+08
1012	1004	1004 - KK	3		10	3	2017-12-29 14:29:31.915163+08
1013	1008	1008 - It is strongly recommended that you explicitly set all fields that should be edited in the form using the fields attribute. Failure to do so can easily lead to security problems when a form une	3		10	3	2017-12-29 15:36:45.181006+08
1014	1007	1007 - 삼삼삼...	3		10	3	2017-12-29 15:36:45.21609+08
1015	1006	1006 - 맛집	3		10	3	2017-12-29 15:36:45.224701+08
1016	1003	1003 - Sea Food	3		10	3	2017-12-29 15:36:45.232938+08
1017	1009	1009 - It is strongly recommended that you explicitly set all fields that should be edited in the form	3		10	3	2017-12-29 15:45:25.863369+08
1018	1010	1010 - l https://gist.github.com/chriskief/7130603 Now you don't have to worry about each and every hidden field.	3		10	3	2017-12-29 15:50:24.77978+08
1019	1011	1011 - Short	3		10	3	2017-12-29 15:55:14.656875+08
1020	1012	1012 - Shrt	3		10	3	2017-12-29 15:58:20.643264+08
1021	1016	1016 - 	3		10	3	2017-12-29 16:10:34.416086+08
1022	1015	1015 - 	3		10	3	2017-12-29 16:10:34.427531+08
1023	1014	1014 - shrot	3		10	3	2017-12-29 16:10:34.434879+08
1024	1013	1013 - shrot	3		10	3	2017-12-29 16:10:34.442114+08
1025	1017	1017 - Short	3		10	3	2017-12-29 16:14:09.317534+08
1026	1002	aaa@naver.com	3		4	3	2017-12-29 17:05:18.995576+08
1027	1003	bbb@naver.com	3		4	3	2017-12-29 17:05:19.010282+08
1028	1004	ccc@naver.com	3		4	3	2017-12-29 17:05:19.023684+08
1029	9	kkk@daum.net	3		4	3	2017-12-29 17:05:27.93191+08
1030	1000	ppp@naver.com	3		4	3	2017-12-29 17:05:27.941939+08
1031	1001	qqq@naver.com	3		4	3	2017-12-29 17:05:27.949555+08
1032	1	happy@daum.net	2	[{"changed": {"fields": ["first_name"]}}]	4	1	2018-01-10 08:35:37.472491+08
1033	3	njyoon@naver.com	2	[{"changed": {"fields": ["first_name"]}}]	4	1	2018-01-10 08:37:30.816759+08
1034	1	世界旅游	2	[{"changed": {"fields": ["name"]}}]	9	3	2018-01-10 08:39:16.031391+08
1035	5	General Life	2	[{"changed": {"fields": ["name"]}}]	9	3	2018-01-10 08:39:36.13448+08
1036	4	中国旅游	2	[{"changed": {"fields": ["name"]}}]	9	3	2018-01-10 08:39:53.314925+08
1037	3	好吃的地方	2	[{"changed": {"fields": ["name"]}}]	9	3	2018-01-10 08:40:07.078817+08
1038	2	美国	2	[{"changed": {"fields": ["name"]}}]	9	3	2018-01-10 08:40:21.950081+08
1039	4	User #2 friendship requested #1008	3		1000	1	2018-01-25 09:18:15.230992+08
1040	3	User #2 friendship requested #1007	3		1000	1	2018-01-25 09:18:15.270019+08
1041	2	User #2 friendship requested #1006	3		1000	1	2018-01-25 09:18:15.283624+08
1042	1	User #2 friendship requested #1005	3		1000	1	2018-01-25 09:18:15.293733+08
1043	1010	kk88 -> Namju	3		16	1	2018-01-25 10:14:55.625061+08
1044	1009	Namju -> kk88	3		16	1	2018-01-25 10:14:55.650786+08
1045	1012	kk88 -> Namju	3		16	1	2018-01-25 10:21:04.191514+08
1046	1011	Namju -> kk88	3		16	1	2018-01-25 10:21:04.208189+08
1047	1015	kk88 -> Namju	3		16	1	2018-01-25 10:30:09.833128+08
1048	1014	Namju -> kk88	3		16	1	2018-01-25 10:30:09.856162+08
1049	1017	kk88 -> Namju	3		16	1	2018-01-25 10:35:07.747903+08
1050	1016	Namju -> kk88	3		16	1	2018-01-25 10:35:07.758151+08
1051	1019	kk88 -> Namju	3		16	1	2018-01-25 10:42:28.437991+08
1052	1018	Namju -> kk88	3		16	1	2018-01-25 10:42:28.461652+08
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blog	content
8	blog	tag
9	blog	theme
10	blog	post
11	accounts	profile
12	blog	like
13	comment	comment
14	blog	bucket
15	account	profile
16	account	relation
17	activity	notification
18	blog	invitee
1000	friend	friendshiprequest
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-29 23:28:31.104973+08
2	auth	0001_initial	2017-11-29 23:28:31.159414+08
3	admin	0001_initial	2017-11-29 23:28:31.186556+08
4	admin	0002_logentry_remove_auto_add	2017-11-29 23:28:31.213642+08
5	contenttypes	0002_remove_content_type_name	2017-11-29 23:28:31.298312+08
6	auth	0002_alter_permission_name_max_length	2017-11-29 23:28:31.315271+08
7	auth	0003_alter_user_email_max_length	2017-11-29 23:28:31.343324+08
8	auth	0004_alter_user_username_opts	2017-11-29 23:28:31.375689+08
9	auth	0005_alter_user_last_login_null	2017-11-29 23:28:31.395947+08
10	auth	0006_require_contenttypes_0002	2017-11-29 23:28:31.398369+08
11	auth	0007_alter_validators_add_error_messages	2017-11-29 23:28:31.420349+08
12	auth	0008_alter_user_username_max_length	2017-11-29 23:28:31.438125+08
13	sessions	0001_initial	2017-11-29 23:28:31.44962+08
14	blog	0001_initial	2017-11-30 09:30:13.554216+08
15	blog	0002_auto_20171130_2328	2017-11-30 23:28:24.664235+08
16	accounts	0001_initial	2017-12-03 02:55:26.808418+08
17	accounts	0002_auto_20171123_0438	2017-12-03 02:55:26.880691+08
18	accounts	0003_auto_20171203_0255	2017-12-03 02:55:27.02193+08
19	blog	0003_auto_20171203_0325	2017-12-03 03:25:59.884984+08
20	blog	0004_auto_20171221_0553	2017-12-21 05:54:03.407057+08
21	comment	0001_initial	2017-12-21 06:48:26.117327+08
22	blog	0005_auto_20171221_0834	2017-12-21 08:34:37.217745+08
23	account	0001_initial	2017-12-21 09:03:39.450499+08
24	account	0002_auto_20171222_0933	2017-12-22 09:33:53.945555+08
25	blog	0006_auto_20171222_0933	2017-12-22 09:33:54.104815+08
26	account	0003_auto_20171222_0948	2017-12-22 09:48:22.398934+08
27	blog	0007_auto_20171222_0955	2017-12-22 09:56:01.131099+08
28	blog	0008_auto_20171222_1207	2017-12-22 12:07:52.714347+08
29	activity	0001_initial	2017-12-22 12:07:52.743679+08
30	blog	0009_theme_status	2017-12-22 14:07:23.534742+08
31	blog	0010_auto_20171223_0024	2017-12-23 00:24:51.256842+08
32	blog	0011_auto_20171225_1137	2017-12-25 11:37:47.116334+08
33	account	0004_auto_20171225_1234	2017-12-25 12:35:25.951964+08
34	blog	0012_auto_20171225_1234	2017-12-25 12:35:26.031365+08
35	activity	0002_auto_20171225_1345	2017-12-25 13:45:46.738082+08
1000	activity	0003_auto_20171229_0145	2017-12-29 09:46:05.280159+08
1001	blog	0013_auto_20171229_0145	2017-12-29 09:46:05.413432+08
1002	friend	0001_initial	2018-01-24 17:03:56.960561+08
1003	friend	0002_friendshiprequest_create_dt	2018-01-25 09:08:26.05094+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
9640z7e90wwunkn8b0wpv8u3zyvp8uty	YzY2NDA4NGEzYjBkNDY2ZDdhZTIxYTA2MTM1MmZjY2EzYTg1MmM1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmUwMDA0ZTgyOTQ5OWY3NzIxYjhiYzBmOWYyMGFjMDdjY2Q0MWY4In0=	2017-12-14 14:27:16.133117+08
74nqvxi91ws17kec3adkju6qcvdo1obb	YzY2NDA4NGEzYjBkNDY2ZDdhZTIxYTA2MTM1MmZjY2EzYTg1MmM1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmUwMDA0ZTgyOTQ5OWY3NzIxYjhiYzBmOWYyMGFjMDdjY2Q0MWY4In0=	2017-12-15 10:40:35.939688+08
tb2b1g1t1ywbgq6pn8jhqc6uo5lrkybq	YjVjZjhjMmQ5MDJmZDhmMjI0OTkzMTg2YWZiODU2NzlhYWY5ZTVjZjp7fQ==	2017-12-17 02:57:49.201809+08
2fmm7saylgpt6fqxjb0kdol9op1wyuwh	YjVjZjhjMmQ5MDJmZDhmMjI0OTkzMTg2YWZiODU2NzlhYWY5ZTVjZjp7fQ==	2017-12-17 03:00:08.715968+08
vmlm998edn3lhdbstc15bbzhbwyfqvev	YzY2NDA4NGEzYjBkNDY2ZDdhZTIxYTA2MTM1MmZjY2EzYTg1MmM1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmUwMDA0ZTgyOTQ5OWY3NzIxYjhiYzBmOWYyMGFjMDdjY2Q0MWY4In0=	2017-12-19 02:13:55.787053+08
3m6punlt1lln1ig14wu6ml1rr5xkyno2	NGNlZmExODc1OWYzYWJkNDQwYjcxZDBkZGM3ZGMyNTE1N2M4ZDc1ODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4M2Q5NTRjY2MxNTMwYmY5ZTcwMTYwM2JlN2IyYWZjOWEyNjgzN2RjIn0=	2017-12-28 11:57:20.18291+08
bhauqhynebw4g4d1nmbdvsfyaajdkhu3	YzY2NDA4NGEzYjBkNDY2ZDdhZTIxYTA2MTM1MmZjY2EzYTg1MmM1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmUwMDA0ZTgyOTQ5OWY3NzIxYjhiYzBmOWYyMGFjMDdjY2Q0MWY4In0=	2017-12-31 11:29:56.252489+08
0cop39ug781djr6t7pwzdxpwnbyk4t4d	YjVjZjhjMmQ5MDJmZDhmMjI0OTkzMTg2YWZiODU2NzlhYWY5ZTVjZjp7fQ==	2018-01-05 02:05:36.046399+08
v9ayinpwmn1y0znthsjlcbxn9yvcc6d4	YjVjZjhjMmQ5MDJmZDhmMjI0OTkzMTg2YWZiODU2NzlhYWY5ZTVjZjp7fQ==	2018-01-05 02:20:44.348024+08
8kjjjbbm7wv7lpju2eoai32ljubpruza	YjVjZjhjMmQ5MDJmZDhmMjI0OTkzMTg2YWZiODU2NzlhYWY5ZTVjZjp7fQ==	2018-01-05 02:21:08.333583+08
7kxgvhmbqj4xif7zuwajyh49trqi88ur	NTAwNDRiZTAzMDYwMmEyYjU4YzMzNWY2NmI4NDRiYzM2YWMwYWE1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjM2FlZDMxMTU2ZTM5ZjAyNjVmMzFlZDNmNTA2N2E3YzQ0ZTkwNDE1In0=	2018-01-10 02:19:20.395723+08
9r6k5x4ut33jrim52vkd2e88apqdpjhg	NTAwNDRiZTAzMDYwMmEyYjU4YzMzNWY2NmI4NDRiYzM2YWMwYWE1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjM2FlZDMxMTU2ZTM5ZjAyNjVmMzFlZDNmNTA2N2E3YzQ0ZTkwNDE1In0=	2018-01-12 10:57:47.379259+08
yhlmzkh4wns6ji0qgs40v5165r3ctymy	NDgxNWVjZDVkZDhmMTJmNjQ0YzQ1MjYzMWMwMjI2ZTQzYmUxNTc0YTp7Il9hdXRoX3VzZXJfaWQiOiIxMDA3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMWQyMzY4NDgxMzhjODEwZDI3Yzg1YWRiMjJhMzM3Yzk3ODVkZDAwIn0=	2018-01-12 17:20:56.131736+08
bxxknop5o7d5qssomggqywlzqix4a79s	NGVjOWM2NzI5NjJiMWNkZmM5Mzk1N2U4NTExYTY5OGE2MjA5MjA2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ODAyNjMyN2U0ZjU4YWFhNTc2NTE2ZjRiNWYwNTQwMjFiNGM3NGMyIn0=	2018-01-17 13:23:13.013774+08
k8xsj9le7roqp7us2l48tgq2kod2bcjc	NGVjOWM2NzI5NjJiMWNkZmM5Mzk1N2U4NTExYTY5OGE2MjA5MjA2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ODAyNjMyN2U0ZjU4YWFhNTc2NTE2ZjRiNWYwNTQwMjFiNGM3NGMyIn0=	2018-01-24 08:27:47.376371+08
bbz9ld3s00inl8n2hn6o0b7pp672t02y	NTAwNDRiZTAzMDYwMmEyYjU4YzMzNWY2NmI4NDRiYzM2YWMwYWE1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjM2FlZDMxMTU2ZTM5ZjAyNjVmMzFlZDNmNTA2N2E3YzQ0ZTkwNDE1In0=	2018-02-02 16:24:32.969946+08
05j03hw0evh666z1rja7fmoy4tnh03sl	NTAwNDRiZTAzMDYwMmEyYjU4YzMzNWY2NmI4NDRiYzM2YWMwYWE1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjM2FlZDMxMTU2ZTM5ZjAyNjVmMzFlZDNmNTA2N2E3YzQ0ZTkwNDE1In0=	2018-02-03 20:31:45.840745+08
2bh9pxby9wcf59mxsjglj2bv407mz5c1	NGVjOWM2NzI5NjJiMWNkZmM5Mzk1N2U4NTExYTY5OGE2MjA5MjA2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ODAyNjMyN2U0ZjU4YWFhNTc2NTE2ZjRiNWYwNTQwMjFiNGM3NGMyIn0=	2018-02-06 17:29:27.99438+08
6wopuz0cuzlk8a7022losfor7523hhpy	M2I5YjFjNDcyMjhiZDQzYTg2MzQyZDMwMTYwODNkZmYwOTU1YTE1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxMDA5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmZhYzg3MmExNjgzYjdjNzhkYjA5MTg1ZTZmZWUyYWM4MTVjMGQwIn0=	2018-02-08 09:38:42.037623+08
\.


--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_profile_id_seq', 1009, true);


--
-- Name: account_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_relation_id_seq', 1019, true);


--
-- Name: accounts_profile_friends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_profile_friends_id_seq', 1000, false);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_profile_id_seq', 1000, false);


--
-- Name: activity_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activity_notification_id_seq', 1007, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1000, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1000, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 1002, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1000, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1009, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1000, false);


--
-- Name: blog_bucket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_bucket_id_seq', 1004, true);


--
-- Name: blog_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_content_id_seq', 1027, true);


--
-- Name: blog_content_tag_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_content_tag_set_id_seq', 5199, true);


--
-- Name: blog_invitee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_invitee_id_seq', 1000, false);


--
-- Name: blog_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_like_id_seq', 1008, true);


--
-- Name: blog_post_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_contents_id_seq', 1027, true);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_id_seq', 1027, true);


--
-- Name: blog_post_tag_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_tag_set_id_seq', 5204, true);


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_tag_id_seq', 1012, true);


--
-- Name: blog_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_theme_id_seq', 1019, true);


--
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_comment_id_seq', 1005, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1052, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 1000, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 1003, true);


--
-- Name: your_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('your_seq', 1000, false);


--
-- Name: account_profile account_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);


--
-- Name: account_profile account_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profile_user_id_key UNIQUE (user_id);


--
-- Name: account_relation account_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_relation
    ADD CONSTRAINT account_relation_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile_friends accounts_profile_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile_friends
    ADD CONSTRAINT accounts_profile_friends_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);


--
-- Name: activity_notification activity_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification
    ADD CONSTRAINT activity_notification_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_bucket blog_bucket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bucket
    ADD CONSTRAINT blog_bucket_pkey PRIMARY KEY (id);


--
-- Name: blog_content blog_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content
    ADD CONSTRAINT blog_content_pkey PRIMARY KEY (id);


--
-- Name: blog_content_tag_set blog_content_tag_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content_tag_set
    ADD CONSTRAINT blog_content_tag_set_pkey PRIMARY KEY (id);


--
-- Name: blog_invitee blog_invitee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_invitee
    ADD CONSTRAINT blog_invitee_pkey PRIMARY KEY (id);


--
-- Name: blog_like blog_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_like
    ADD CONSTRAINT blog_like_pkey PRIMARY KEY (id);


--
-- Name: blog_post_contents blog_post_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_contents
    ADD CONSTRAINT blog_post_contents_pkey PRIMARY KEY (id);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post_tag_set blog_post_tag_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tag_set
    ADD CONSTRAINT blog_post_tag_set_pkey PRIMARY KEY (id);


--
-- Name: blog_tag blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: blog_theme blog_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_theme
    ADD CONSTRAINT blog_theme_pkey PRIMARY KEY (id);


--
-- Name: comment_comment comment_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment
    ADD CONSTRAINT comment_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: account_relation_from_user_id_b58a508c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_relation_from_user_id_b58a508c ON account_relation USING btree (from_user_id);


--
-- Name: account_relation_from_user_id_to_user_id_066c3800_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX account_relation_from_user_id_to_user_id_066c3800_uniq ON account_relation USING btree (from_user_id, to_user_id);


--
-- Name: account_relation_to_user_id_3d2efed5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_relation_to_user_id_3d2efed5 ON account_relation USING btree (to_user_id);


--
-- Name: accounts_profile_friends_from_profile_id_e70b0886; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_friends_from_profile_id_e70b0886 ON accounts_profile_friends USING btree (from_profile_id);


--
-- Name: accounts_profile_friends_from_profile_id_to_profile_id_7d7fe1cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX accounts_profile_friends_from_profile_id_to_profile_id_7d7fe1cc ON accounts_profile_friends USING btree (from_profile_id, to_profile_id);


--
-- Name: accounts_profile_friends_to_profile_id_391683d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_friends_to_profile_id_391683d5 ON accounts_profile_friends USING btree (to_profile_id);


--
-- Name: activity_notification_from_user_id_f22881c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_notification_from_user_id_f22881c7 ON activity_notification USING btree (from_user_id);


--
-- Name: activity_notification_post_id_526951d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_notification_post_id_526951d4 ON activity_notification USING btree (post_id);


--
-- Name: activity_notification_theme_id_8e088568; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_notification_theme_id_8e088568 ON activity_notification USING btree (theme_id);


--
-- Name: activity_notification_to_user_id_3532a348; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_notification_to_user_id_3532a348 ON activity_notification USING btree (to_user_id);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON auth_group_permissions USING btree (group_id, permission_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON auth_permission USING btree (content_type_id, codename);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON auth_user_groups USING btree (user_id, group_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON auth_user_user_permissions USING btree (user_id, permission_id);


--
-- Name: blog_bucket_post_id_93117998; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_bucket_post_id_93117998 ON blog_bucket USING btree (post_id);


--
-- Name: blog_bucket_user_id_23957967; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_bucket_user_id_23957967 ON blog_bucket USING btree (user_id);


--
-- Name: blog_bucket_user_id_post_id_02d09b88_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX blog_bucket_user_id_post_id_02d09b88_uniq ON blog_bucket USING btree (user_id, post_id);


--
-- Name: blog_content_tag_set_content_id_63ca84e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_content_tag_set_content_id_63ca84e9 ON blog_content_tag_set USING btree (content_id);


--
-- Name: blog_content_tag_set_content_id_tag_id_2c4a4e02_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX blog_content_tag_set_content_id_tag_id_2c4a4e02_uniq ON blog_content_tag_set USING btree (content_id, tag_id);


--
-- Name: blog_content_tag_set_tag_id_21ba73f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_content_tag_set_tag_id_21ba73f3 ON blog_content_tag_set USING btree (tag_id);


--
-- Name: blog_invitee_theme_id_313f791a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_invitee_theme_id_313f791a ON blog_invitee USING btree (theme_id);


--
-- Name: blog_invitee_user_id_5df1fbed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_invitee_user_id_5df1fbed ON blog_invitee USING btree (user_id);


--
-- Name: blog_invitee_user_id_theme_id_24203c05_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX blog_invitee_user_id_theme_id_24203c05_uniq ON blog_invitee USING btree (user_id, theme_id);


--
-- Name: blog_like_post_id_9038fd1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_like_post_id_9038fd1f ON blog_like USING btree (post_id);


--
-- Name: blog_like_user_id_06356ade; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_like_user_id_06356ade ON blog_like USING btree (user_id);


--
-- Name: blog_like_user_id_post_id_25245350_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX blog_like_user_id_post_id_25245350_uniq ON blog_like USING btree (user_id, post_id);


--
-- Name: blog_post_author_id_dd7a8485; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_post_author_id_dd7a8485 ON blog_post USING btree (author_id);


--
-- Name: blog_post_tag_set_post_id_0ecab89b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_post_tag_set_post_id_0ecab89b ON blog_post_tag_set USING btree (post_id);


--
-- Name: blog_post_tag_set_post_id_tag_id_b9baa74f_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX blog_post_tag_set_post_id_tag_id_b9baa74f_uniq ON blog_post_tag_set USING btree (post_id, tag_id);


--
-- Name: blog_post_tag_set_tag_id_add72666; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_post_tag_set_tag_id_add72666 ON blog_post_tag_set USING btree (tag_id);


--
-- Name: blog_post_theme_id_00024a01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_post_theme_id_00024a01 ON blog_post USING btree (theme_id);


--
-- Name: blog_theme_author_id_485e9caf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_theme_author_id_485e9caf ON blog_theme USING btree (author_id);


--
-- Name: comment_comment_create_user_id_b5cb2381; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comment_comment_create_user_id_b5cb2381 ON comment_comment USING btree (create_user_id);


--
-- Name: comment_comment_post_id_357153e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comment_comment_post_id_357153e3 ON comment_comment USING btree (post_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON django_content_type USING btree (app_label, model);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: account_profile account_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: account_relation account_relation_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_relation
    ADD CONSTRAINT account_relation_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES account_profile(id);


--
-- Name: account_relation account_relation_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_relation
    ADD CONSTRAINT account_relation_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES account_profile(id);


--
-- Name: accounts_profile_friends accounts_profile_friends_from_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile_friends
    ADD CONSTRAINT accounts_profile_friends_from_profile_id_fkey FOREIGN KEY (from_profile_id) REFERENCES accounts_profile(id);


--
-- Name: accounts_profile_friends accounts_profile_friends_to_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile_friends
    ADD CONSTRAINT accounts_profile_friends_to_profile_id_fkey FOREIGN KEY (to_profile_id) REFERENCES accounts_profile(id);


--
-- Name: accounts_profile accounts_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: activity_notification activity_notification_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification
    ADD CONSTRAINT activity_notification_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES auth_user(id);


--
-- Name: activity_notification activity_notification_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification
    ADD CONSTRAINT activity_notification_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: activity_notification activity_notification_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification
    ADD CONSTRAINT activity_notification_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES blog_theme(id);


--
-- Name: activity_notification activity_notification_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_notification
    ADD CONSTRAINT activity_notification_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES auth_user(id);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id);


--
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id);


--
-- Name: auth_permission auth_permission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id);


--
-- Name: auth_user_groups auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id);


--
-- Name: auth_user_groups auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: blog_bucket blog_bucket_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bucket
    ADD CONSTRAINT blog_bucket_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: blog_bucket blog_bucket_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bucket
    ADD CONSTRAINT blog_bucket_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: blog_content_tag_set blog_content_tag_set_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content_tag_set
    ADD CONSTRAINT blog_content_tag_set_content_id_fkey FOREIGN KEY (content_id) REFERENCES blog_content(id);


--
-- Name: blog_content_tag_set blog_content_tag_set_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_content_tag_set
    ADD CONSTRAINT blog_content_tag_set_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES blog_tag(id);


--
-- Name: blog_invitee blog_invitee_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_invitee
    ADD CONSTRAINT blog_invitee_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES blog_theme(id);


--
-- Name: blog_invitee blog_invitee_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_invitee
    ADD CONSTRAINT blog_invitee_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: blog_like blog_like_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_like
    ADD CONSTRAINT blog_like_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: blog_like blog_like_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_like
    ADD CONSTRAINT blog_like_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- Name: blog_post blog_post_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_author_id_fkey FOREIGN KEY (author_id) REFERENCES auth_user(id);


--
-- Name: blog_post_contents blog_post_contents_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_contents
    ADD CONSTRAINT blog_post_contents_content_id_fkey FOREIGN KEY (content_id) REFERENCES blog_content(id);


--
-- Name: blog_post_contents blog_post_contents_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_contents
    ADD CONSTRAINT blog_post_contents_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: blog_post_tag_set blog_post_tag_set_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tag_set
    ADD CONSTRAINT blog_post_tag_set_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: blog_post_tag_set blog_post_tag_set_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tag_set
    ADD CONSTRAINT blog_post_tag_set_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES blog_tag(id);


--
-- Name: blog_post blog_post_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES blog_theme(id);


--
-- Name: blog_theme blog_theme_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_theme
    ADD CONSTRAINT blog_theme_author_id_fkey FOREIGN KEY (author_id) REFERENCES auth_user(id);


--
-- Name: comment_comment comment_comment_create_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment
    ADD CONSTRAINT comment_comment_create_user_id_fkey FOREIGN KEY (create_user_id) REFERENCES auth_user(id);


--
-- Name: comment_comment comment_comment_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment
    ADD CONSTRAINT comment_comment_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id);


--
-- Name: django_admin_log django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- PostgreSQL database dump complete
--

