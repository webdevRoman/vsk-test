--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-03-15 21:16:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16413)
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16411)
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_id_seq OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 204
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_id_seq OWNED BY public.bank.id;


--
-- TOC entry 208 (class 1259 OID 16437)
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    number bigint NOT NULL,
    bank integer,
    payment_system character varying(20)
);


ALTER TABLE public.card OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16405)
-- Name: salepoint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salepoint (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.salepoint OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: salepoint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salepoint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salepoint_id_seq OWNER TO postgres;

--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 202
-- Name: salepoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salepoint_id_seq OWNED BY public.salepoint.id;


--
-- TOC entry 207 (class 1259 OID 16421)
-- Name: terminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminal (
    id integer NOT NULL,
    salepoint integer,
    bank integer
);


ALTER TABLE public.terminal OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16449)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    terminal integer,
    card bigint,
    sum numeric(8,2),
    commission numeric(8,2),
    date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16447)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 209
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 206 (class 1259 OID 16419)
-- Name: trminal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trminal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trminal_id_seq OWNER TO postgres;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 206
-- Name: trminal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trminal_id_seq OWNED BY public.terminal.id;


--
-- TOC entry 2710 (class 2604 OID 16416)
-- Name: bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN id SET DEFAULT nextval('public.bank_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 16408)
-- Name: salepoint id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salepoint ALTER COLUMN id SET DEFAULT nextval('public.salepoint_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 16424)
-- Name: terminal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal ALTER COLUMN id SET DEFAULT nextval('public.trminal_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 16452)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 16413)
-- Dependencies: 205
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bank VALUES (1, 'Банк 1');
INSERT INTO public.bank VALUES (2, 'Банк 2');
INSERT INTO public.bank VALUES (3, 'Банк 3');


--
-- TOC entry 2861 (class 0 OID 16437)
-- Dependencies: 208
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.card VALUES (1111111111111112, 1, 'VISA');
INSERT INTO public.card VALUES (1111111111111113, 2, 'VISA');
INSERT INTO public.card VALUES (1111111111111114, 2, 'MasterCard');
INSERT INTO public.card VALUES (1111111111111111, 1, 'МИР');


--
-- TOC entry 2856 (class 0 OID 16405)
-- Dependencies: 203
-- Data for Name: salepoint; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salepoint VALUES (1, 'Точка 1');
INSERT INTO public.salepoint VALUES (2, 'Точка 2');


--
-- TOC entry 2860 (class 0 OID 16421)
-- Dependencies: 207
-- Data for Name: terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.terminal VALUES (1, 1, 1);
INSERT INTO public.terminal VALUES (2, 1, 2);
INSERT INTO public.terminal VALUES (3, 2, 2);
INSERT INTO public.terminal VALUES (4, 2, 3);


--
-- TOC entry 2863 (class 0 OID 16449)
-- Dependencies: 210
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction VALUES (1, 1, 1111111111111111, 120.80, 12.08, '2020-03-12');
INSERT INTO public.transaction VALUES (2, 1, 1111111111111112, 25.00, 0.25, '2020-03-12');
INSERT INTO public.transaction VALUES (3, 2, 1111111111111112, 50.00, 5.00, '2020-03-12');
INSERT INTO public.transaction VALUES (4, 3, 1111111111111113, 75.35, 7.54, '2020-03-12');
INSERT INTO public.transaction VALUES (5, 1, 1111111111111111, 50.00, 0.50, '2020-03-15');
INSERT INTO public.transaction VALUES (6, 1, 1111111111111111, 25.00, 0.25, '2020-03-15');
INSERT INTO public.transaction VALUES (7, 2, 1111111111111113, 70.00, 7.00, '2020-03-15');
INSERT INTO public.transaction VALUES (8, 4, 1111111111111114, 50.00, 0.05, '2020-03-15');
INSERT INTO public.transaction VALUES (9, 3, 1111111111111112, 100.00, 1.00, '2020-03-15');
INSERT INTO public.transaction VALUES (10, 1, 1111111111111111, 20.00, 0.20, '2020-03-05');
INSERT INTO public.transaction VALUES (11, 1, 1111111111111111, 250.00, 2.50, '2020-03-05');
INSERT INTO public.transaction VALUES (12, 2, 1111111111111113, 70.00, 7.00, '2020-03-02');
INSERT INTO public.transaction VALUES (13, 4, 1111111111111114, 100.00, 0.10, '2020-03-06');
INSERT INTO public.transaction VALUES (14, 3, 1111111111111112, 100.00, 1.00, '2020-03-05');


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 204
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 3, true);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 202
-- Name: salepoint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salepoint_id_seq', 2, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 209
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 14, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 206
-- Name: trminal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trminal_id_seq', 4, true);


--
-- TOC entry 2717 (class 2606 OID 16418)
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 16467)
-- Name: card card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (number);


--
-- TOC entry 2715 (class 2606 OID 16410)
-- Name: salepoint salepoint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salepoint
    ADD CONSTRAINT salepoint_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 16454)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 16426)
-- Name: terminal trminal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal
    ADD CONSTRAINT trminal_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 16442)
-- Name: card card_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_bank_fkey FOREIGN KEY (bank) REFERENCES public.bank(id);


--
-- TOC entry 2728 (class 2606 OID 16477)
-- Name: transaction transaction_card_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_card_fkey FOREIGN KEY (card) REFERENCES public.card(number);


--
-- TOC entry 2727 (class 2606 OID 16455)
-- Name: transaction transaction_terminal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_terminal_fkey FOREIGN KEY (terminal) REFERENCES public.terminal(id);


--
-- TOC entry 2725 (class 2606 OID 16432)
-- Name: terminal trminal_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal
    ADD CONSTRAINT trminal_bank_fkey FOREIGN KEY (bank) REFERENCES public.bank(id);


--
-- TOC entry 2724 (class 2606 OID 16427)
-- Name: terminal trminal_salepoint_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal
    ADD CONSTRAINT trminal_salepoint_fkey FOREIGN KEY (salepoint) REFERENCES public.salepoint(id);


-- Completed on 2020-03-15 21:16:32

--
-- PostgreSQL database dump complete
--

