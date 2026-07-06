--
-- PostgreSQL database dump
--

\restrict sok9HJS3Zy9nSh59hklkS3SfdWAEUuQZeoPadTb3cQJF34dBOO3YXn8vmpZOreg

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-1.pgdg24.04+1)

-- Started on 2026-07-06 10:56:40 -05

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
-- TOC entry 218 (class 1259 OID 17235)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 17234)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 216 (class 1259 OID 17228)
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 17227)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 215
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 229 (class 1259 OID 17303)
-- Name: movement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movement (
    order_id integer NOT NULL,
    movement_date date NOT NULL,
    warehouse_id integer NOT NULL,
    quantity integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17242)
-- Name: movement_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movement_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 17241)
-- Name: movement_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movement_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 219
-- Name: movement_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movement_type_id_seq OWNED BY public.movement_type.id;


--
-- TOC entry 228 (class 1259 OID 17292)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    code_order character varying(50),
    type_movement integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 17291)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 224 (class 1259 OID 17261)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying(200) NOT NULL,
    category_id integer NOT NULL,
    unit_price numeric NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 17260)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 230 (class 1259 OID 17386)
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    purchase_order_id integer NOT NULL,
    purchase_date date NOT NULL,
    supplier_id integer NOT NULL,
    warehouse_id integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 17408)
-- Name: purchases_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases_products (
    purchase_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    purchase_price numeric NOT NULL,
    subtotal numeric NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 17425)
-- Name: riwisupply_xlsx; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwisupply_xlsx (
    "MovementDate" character varying(50),
    "SupplierName" character varying(50),
    "SupplierCity" character varying(50),
    "Warehouse" character varying(50),
    "WarehouseCity" character varying(50),
    "ProductName" character varying(50),
    "Category" character varying(50),
    "Quantity" integer,
    "UnitPrice" integer,
    "MovementType" character varying(50),
    "PurchaseOrder" character varying(50)
);


--
-- TOC entry 222 (class 1259 OID 17249)
-- Name: supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    city_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 17248)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- TOC entry 226 (class 1259 OID 17275)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    city_id integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 17274)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 225
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 3314 (class 2604 OID 17238)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 17231)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 17245)
-- Name: movement_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement_type ALTER COLUMN id SET DEFAULT nextval('public.movement_type_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 17295)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 17264)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 17252)
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 17278)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3497 (class 0 OID 17235)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category (id, name) FROM stdin;
1	Herramientas
2	Elementos Protección
3	Consumibles
\.


--
-- TOC entry 3495 (class 0 OID 17228)
-- Dependencies: 216
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, name) FROM stdin;
1	Cartagena
2	Barranquilla
3	Santa Marta
\.


--
-- TOC entry 3508 (class 0 OID 17303)
-- Dependencies: 229
-- Data for Name: movement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movement (order_id, movement_date, warehouse_id, quantity) FROM stdin;
19	2026-04-01	2	148
17	2026-02-14	2	27
1	2026-01-01	2	70
6	2026-02-16	3	160
\.


--
-- TOC entry 3499 (class 0 OID 17242)
-- Dependencies: 220
-- Data for Name: movement_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movement_type (id, name) FROM stdin;
1	IN
2	OUT
\.


--
-- TOC entry 3507 (class 0 OID 17292)
-- Dependencies: 228
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, code_order, type_movement) FROM stdin;
1	PO-1022	1
2	PO-1034	1
3	PO-1094	1
4	PO-1040	1
5	PO-1032	1
6	PO-1075	1
7	PO-1041	1
8	PO-1083	2
9	PO-1029	2
10	PO-1035	2
11	PO-1036	2
12	PO-1043	2
13	PO-1035	2
14	PO-1023	2
15	PO-1009	2
16	PO-1059	2
17	PO-1041	2
18	PO-1091	2
19	PO-1049	2
\.


--
-- TOC entry 3503 (class 0 OID 17261)
-- Dependencies: 224
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, product_name, category_id, unit_price) FROM stdin;
1	Casco Industrial	2	108802
2	Disco de Corte	1	52910
3	Guantes de Nitrilo	2	14290
4	Electrodo E6013	3	35506
5	Soldadura	3	43746
\.


--
-- TOC entry 3509 (class 0 OID 17386)
-- Dependencies: 230
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchases (purchase_order_id, purchase_date, supplier_id, warehouse_id) FROM stdin;
19	2026-04-01	1	2
17	2026-02-14	1	2
1	2026-01-01	3	2
6	2026-02-16	1	3
\.


--
-- TOC entry 3510 (class 0 OID 17408)
-- Dependencies: 231
-- Data for Name: purchases_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchases_products (purchase_id, product_id, quantity, purchase_price, subtotal) FROM stdin;
19	2	148	52910	7830680
17	4	27	35506	958662
1	3	70	14290	1000300
6	3	160	14290	2286400
\.


--
-- TOC entry 3511 (class 0 OID 17425)
-- Dependencies: 232
-- Data for Name: riwisupply_xlsx; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.riwisupply_xlsx ("MovementDate", "SupplierName", "SupplierCity", "Warehouse", "WarehouseCity", "ProductName", "Category", "Quantity", "UnitPrice", "MovementType", "PurchaseOrder") FROM stdin;
2026-04-01	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Disco de Corte 4.5	Herramientas	148	115388	OUT	PO-1049
2026-02-14	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Electrodo E6013	Consumibles	27	35506	IN	PO-1041
2026-02-16	Aceros del Norte S.A.S	Cartagena	Centro Logistico Norte	Cartagena	Guantes de Nitrilo	Elementos Protección	160	117524	IN	PO-1075
2026-02-28	Industriales S.A.S	Barranquilla	Bodega Central	Barranquilla	Electrodo E6013	Consumibles	40	139836	OUT	PO-1091
2026-03-06	Aceros del Norte S.A.S	Cartagena	Bodega Central	Barranquilla	Disco de Corte 4.5	Herramientas	130	88512	OUT	PO-1041
2026-01-20	Aceros del Norte S.A.S	Cartagena	Bodega Central	Barranquilla	Soldadura E6013	Consumibles	33	43746	OUT	PO-1059
2026-04-17	Suministros Global SAS	Santa Marta	Bodega Central	Barranquilla	Guantes de Nitrilo	Elementos Protección	185	123653	IN	PO-1032
2026-02-02	Suministros Global SAS	Santa Marta	Bodega Central	Barranquilla	Electrodo E6013	Consumibles	87	123108	OUT	PO-1009
2026-05-23	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Guantes de Nitrilo	Elementos Protección	175	39944	IN	PO-1040
2026-03-19	Aceros del Norte S.A.S	Cartagena	Bodega Central	Barranquilla	Disco de Corte 4.5	Herramientas	199	118291	OUT	PO-1023
2026-03-15	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Disco de Corte 4.5	Herramientas	134	89964	OUT	PO-1035
2026-03-12	Industriales S.A.S	Barranquilla	Bodega Central	Barranquilla	Disco de Corte 4.5	Herramientas	124	52910	IN	PO-1094
2026-04-26	Industriales S.A.S	Barranquilla	Bodega Central	Barranquilla	Disco de Corte 4.5	Herramientas	61	136736	IN	PO-1034
2026-03-03	Industriales S.A.S	Barranquilla	Centro Logistico Norte	Cartagena	Disco de Corte 4.5	Herramientas	169	18022	OUT	PO-1043
2026-03-11	Aceros del Norte S.A.S	Cartagena	Centro Logistico Norte	Cartagena	Electrodo E6013	Consumibles	78	37943	OUT	PO-1036
2026-01-01	Industriales S.A.S	Barranquilla	Bodega Costa	Santa Marta	Guantes de Nitrilo	Elementos Protección	70	14290	IN	PO-1022
2026-04-13	Industriales S.A.S	Barranquilla	Bodega Costa	Santa Marta	Guantes de Nitrilo	Elementos Protección	119	23022	OUT	PO-1035
2026-01-25	Industriales S.A.S	Barranquilla	Centro Logistico Norte	Cartagena	Guantes de Nitrilo	Elementos Protección	131	71980	OUT	PO-1029
2026-03-21	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Casco Industrial	Elementos Protección	192	108802	OUT	PO-1083
\.


--
-- TOC entry 3501 (class 0 OID 17249)
-- Dependencies: 222
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.supplier (id, name, city_id) FROM stdin;
1	Aceros del Norte S.A.S	1
2	Suministros Global SAS	3
3	Industriales S.A.S	2
\.


--
-- TOC entry 3505 (class 0 OID 17275)
-- Dependencies: 226
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.warehouse (id, name, city_id) FROM stdin;
1	Bodega Central	2
2	Bodega Costa	3
3	Centro Logistico Norte	1
\.


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 215
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 219
-- Name: movement_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movement_type_id_seq', 2, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 19, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 5, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.supplier_id_seq', 3, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 225
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 3, true);


--
-- TOC entry 3323 (class 2606 OID 17240)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 17233)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 17307)
-- Name: movement movement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3325 (class 2606 OID 17247)
-- Name: movement_type movement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement_type
    ADD CONSTRAINT movement_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 17297)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 17268)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 17392)
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (purchase_order_id);


--
-- TOC entry 3339 (class 2606 OID 17414)
-- Name: purchases_products purchases_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases_products
    ADD CONSTRAINT purchases_products_pkey PRIMARY KEY (purchase_id);


--
-- TOC entry 3327 (class 2606 OID 17254)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 17280)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 17308)
-- Name: movement fk_movement_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT fk_movement_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3345 (class 2606 OID 17313)
-- Name: movement fk_movement_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT fk_movement_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);


--
-- TOC entry 3343 (class 2606 OID 17298)
-- Name: orders fk_orders; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders FOREIGN KEY (type_movement) REFERENCES public.movement_type(id);


--
-- TOC entry 3341 (class 2606 OID 17269)
-- Name: products fk_products; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3346 (class 2606 OID 17403)
-- Name: purchases fk_purchase_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchase_order FOREIGN KEY (purchase_order_id) REFERENCES public.orders(id);


--
-- TOC entry 3349 (class 2606 OID 17415)
-- Name: purchases_products fk_purchase_products_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases_products
    ADD CONSTRAINT fk_purchase_products_1 FOREIGN KEY (purchase_id) REFERENCES public.purchases(purchase_order_id);


--
-- TOC entry 3350 (class 2606 OID 17420)
-- Name: purchases_products fk_purchase_products_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases_products
    ADD CONSTRAINT fk_purchase_products_2 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3347 (class 2606 OID 17393)
-- Name: purchases fk_purchase_supplier; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchase_supplier FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);


--
-- TOC entry 3348 (class 2606 OID 17398)
-- Name: purchases fk_purchase_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchase_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);


--
-- TOC entry 3340 (class 2606 OID 17255)
-- Name: supplier fk_supplier; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT fk_supplier FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 3342 (class 2606 OID 17281)
-- Name: warehouse fk_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT fk_warehouse FOREIGN KEY (city_id) REFERENCES public.cities(id);


-- Completed on 2026-07-06 10:56:40 -05

--
-- PostgreSQL database dump complete
--

\unrestrict sok9HJS3Zy9nSh59hklkS3SfdWAEUuQZeoPadTb3cQJF34dBOO3YXn8vmpZOreg

