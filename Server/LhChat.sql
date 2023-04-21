PGDMP     8                    {           LhChat    14.4    14.4 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41225    LhChat    DATABASE     d   CREATE DATABASE "LhChat" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "LhChat";
                postgres    false            �            1259    41283    appartenenza_stanza    TABLE     y   CREATE TABLE public.appartenenza_stanza (
    username character varying(32) NOT NULL,
    id_stanza integer NOT NULL
);
 '   DROP TABLE public.appartenenza_stanza;
       public         heap    postgres    false            �            1259    41282 !   appartenenza_stanza_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.appartenenza_stanza_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.appartenenza_stanza_id_stanza_seq;
       public          postgres    false    217                       0    0 !   appartenenza_stanza_id_stanza_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.appartenenza_stanza_id_stanza_seq OWNED BY public.appartenenza_stanza.id_stanza;
          public          postgres    false    216            �            1259    41251 	   messaggio    TABLE     �   CREATE TABLE public.messaggio (
    mittente character varying(32) NOT NULL,
    id_stanza integer NOT NULL,
    ora_invio date NOT NULL,
    testo text NOT NULL
);
    DROP TABLE public.messaggio;
       public         heap    postgres    false            �            1259    41250    messaggio_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.messaggio_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.messaggio_id_stanza_seq;
       public          postgres    false    213                       0    0    messaggio_id_stanza_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.messaggio_id_stanza_seq OWNED BY public.messaggio.id_stanza;
          public          postgres    false    212            �            1259    41268    richiesta_stanza    TABLE     t   CREATE TABLE public.richiesta_stanza (
    utente character varying(32) NOT NULL,
    id_stanza integer NOT NULL
);
 $   DROP TABLE public.richiesta_stanza;
       public         heap    postgres    false            �            1259    41267    richiesta_accesso_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.richiesta_accesso_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.richiesta_accesso_id_stanza_seq;
       public          postgres    false    215                       0    0    richiesta_accesso_id_stanza_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.richiesta_accesso_id_stanza_seq OWNED BY public.richiesta_stanza.id_stanza;
          public          postgres    false    214            �            1259    41239    stanza    TABLE     �   CREATE TABLE public.stanza (
    id_stanza integer NOT NULL,
    nome_stanza character varying(32) NOT NULL,
    nome_admin character varying(32) NOT NULL
);
    DROP TABLE public.stanza;
       public         heap    postgres    false            �            1259    41238    stanza_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.stanza_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.stanza_id_stanza_seq;
       public          postgres    false    211                       0    0    stanza_id_stanza_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.stanza_id_stanza_seq OWNED BY public.stanza.id_stanza;
          public          postgres    false    210            �            1259    41226    utente    TABLE     y   CREATE TABLE public.utente (
    username character varying(32) NOT NULL,
    password character varying(32) NOT NULL
);
    DROP TABLE public.utente;
       public         heap    postgres    false            r           2604    41286    appartenenza_stanza id_stanza    DEFAULT     �   ALTER TABLE ONLY public.appartenenza_stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.appartenenza_stanza_id_stanza_seq'::regclass);
 L   ALTER TABLE public.appartenenza_stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    217    216    217            p           2604    41254    messaggio id_stanza    DEFAULT     z   ALTER TABLE ONLY public.messaggio ALTER COLUMN id_stanza SET DEFAULT nextval('public.messaggio_id_stanza_seq'::regclass);
 B   ALTER TABLE public.messaggio ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    212    213    213            q           2604    41271    richiesta_stanza id_stanza    DEFAULT     �   ALTER TABLE ONLY public.richiesta_stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.richiesta_accesso_id_stanza_seq'::regclass);
 I   ALTER TABLE public.richiesta_stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    215    214    215            o           2604    41242    stanza id_stanza    DEFAULT     t   ALTER TABLE ONLY public.stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.stanza_id_stanza_seq'::regclass);
 ?   ALTER TABLE public.stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    210    211    211                      0    41283    appartenenza_stanza 
   TABLE DATA           B   COPY public.appartenenza_stanza (username, id_stanza) FROM stdin;
    public          postgres    false    217   .                 0    41251 	   messaggio 
   TABLE DATA           J   COPY public.messaggio (mittente, id_stanza, ora_invio, testo) FROM stdin;
    public          postgres    false    213   0.                 0    41268    richiesta_stanza 
   TABLE DATA           =   COPY public.richiesta_stanza (utente, id_stanza) FROM stdin;
    public          postgres    false    215   M.                 0    41239    stanza 
   TABLE DATA           D   COPY public.stanza (id_stanza, nome_stanza, nome_admin) FROM stdin;
    public          postgres    false    211   j.       	          0    41226    utente 
   TABLE DATA           4   COPY public.utente (username, password) FROM stdin;
    public          postgres    false    209   �.                  0    0 !   appartenenza_stanza_id_stanza_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.appartenenza_stanza_id_stanza_seq', 1, false);
          public          postgres    false    216                       0    0    messaggio_id_stanza_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.messaggio_id_stanza_seq', 1, false);
          public          postgres    false    212                       0    0    richiesta_accesso_id_stanza_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.richiesta_accesso_id_stanza_seq', 1, false);
          public          postgres    false    214                       0    0    stanza_id_stanza_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.stanza_id_stanza_seq', 1, false);
          public          postgres    false    210            v           2606    41244    stanza stanza_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.stanza
    ADD CONSTRAINT stanza_pkey PRIMARY KEY (id_stanza);
 <   ALTER TABLE ONLY public.stanza DROP CONSTRAINT stanza_pkey;
       public            postgres    false    211            t           2606    41230    utente utente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_pkey PRIMARY KEY (username);
 <   ALTER TABLE ONLY public.utente DROP CONSTRAINT utente_pkey;
       public            postgres    false    209            |           2606    41287 6   appartenenza_stanza appartenenza_stanza_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartenenza_stanza
    ADD CONSTRAINT appartenenza_stanza_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 `   ALTER TABLE ONLY public.appartenenza_stanza DROP CONSTRAINT appartenenza_stanza_id_stanza_fkey;
       public          postgres    false    217    211    3190            }           2606    41292 5   appartenenza_stanza appartenenza_stanza_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartenenza_stanza
    ADD CONSTRAINT appartenenza_stanza_username_fkey FOREIGN KEY (username) REFERENCES public.utente(username);
 _   ALTER TABLE ONLY public.appartenenza_stanza DROP CONSTRAINT appartenenza_stanza_username_fkey;
       public          postgres    false    209    217    3188            y           2606    41262 "   messaggio messaggio_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messaggio
    ADD CONSTRAINT messaggio_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 L   ALTER TABLE ONLY public.messaggio DROP CONSTRAINT messaggio_id_stanza_fkey;
       public          postgres    false    3190    211    213            x           2606    41257 !   messaggio messaggio_mittente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messaggio
    ADD CONSTRAINT messaggio_mittente_fkey FOREIGN KEY (mittente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.messaggio DROP CONSTRAINT messaggio_mittente_fkey;
       public          postgres    false    3188    213    209            {           2606    41277 1   richiesta_stanza richiesta_accesso_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.richiesta_stanza
    ADD CONSTRAINT richiesta_accesso_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 [   ALTER TABLE ONLY public.richiesta_stanza DROP CONSTRAINT richiesta_accesso_id_stanza_fkey;
       public          postgres    false    3190    211    215            z           2606    41272 .   richiesta_stanza richiesta_accesso_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.richiesta_stanza
    ADD CONSTRAINT richiesta_accesso_utente_fkey FOREIGN KEY (utente) REFERENCES public.utente(username);
 X   ALTER TABLE ONLY public.richiesta_stanza DROP CONSTRAINT richiesta_accesso_utente_fkey;
       public          postgres    false    3188    215    209            w           2606    41245    stanza stanza_nome_admin_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stanza
    ADD CONSTRAINT stanza_nome_admin_fkey FOREIGN KEY (nome_admin) REFERENCES public.utente(username);
 G   ALTER TABLE ONLY public.stanza DROP CONSTRAINT stanza_nome_admin_fkey;
       public          postgres    false    211    3188    209                  x������ � �            x������ � �            x������ � �            x������ � �      	      x������ � �     