PGDMP                         {           postgres    14.0    14.0 ,               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13754    postgres    DATABASE     d   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3354                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1255    16458    appartenenza_creatore()    FUNCTION     �   CREATE FUNCTION public.appartenenza_creatore() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO appartenenza_stanza (username, id_stanza)
        VALUES (NEW.nome_admin, NEW.id_stanza);
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.appartenenza_creatore();
       public          postgres    false            �            1259    16394    appartenenza_stanza    TABLE     y   CREATE TABLE public.appartenenza_stanza (
    username character varying(32) NOT NULL,
    id_stanza integer NOT NULL
);
 '   DROP TABLE public.appartenenza_stanza;
       public         heap    postgres    false            �            1259    16397 !   appartenenza_stanza_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.appartenenza_stanza_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.appartenenza_stanza_id_stanza_seq;
       public          postgres    false    210                       0    0 !   appartenenza_stanza_id_stanza_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.appartenenza_stanza_id_stanza_seq OWNED BY public.appartenenza_stanza.id_stanza;
          public          postgres    false    211            �            1259    16398 	   messaggio    TABLE     �   CREATE TABLE public.messaggio (
    mittente character varying(32) NOT NULL,
    id_stanza integer NOT NULL,
    ora_invio date NOT NULL,
    testo text NOT NULL
);
    DROP TABLE public.messaggio;
       public         heap    postgres    false            �            1259    16403    messaggio_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.messaggio_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.messaggio_id_stanza_seq;
       public          postgres    false    212                       0    0    messaggio_id_stanza_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.messaggio_id_stanza_seq OWNED BY public.messaggio.id_stanza;
          public          postgres    false    213            �            1259    16404    richiesta_stanza    TABLE     t   CREATE TABLE public.richiesta_stanza (
    utente character varying(32) NOT NULL,
    id_stanza integer NOT NULL
);
 $   DROP TABLE public.richiesta_stanza;
       public         heap    postgres    false            �            1259    16407    richiesta_accesso_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.richiesta_accesso_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.richiesta_accesso_id_stanza_seq;
       public          postgres    false    214                       0    0    richiesta_accesso_id_stanza_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.richiesta_accesso_id_stanza_seq OWNED BY public.richiesta_stanza.id_stanza;
          public          postgres    false    215            �            1259    16408    stanza    TABLE     �   CREATE TABLE public.stanza (
    id_stanza integer NOT NULL,
    nome_stanza character varying(32) NOT NULL,
    nome_admin character varying(32) NOT NULL
);
    DROP TABLE public.stanza;
       public         heap    postgres    false            �            1259    16411    stanza_id_stanza_seq    SEQUENCE     �   CREATE SEQUENCE public.stanza_id_stanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.stanza_id_stanza_seq;
       public          postgres    false    216                        0    0    stanza_id_stanza_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.stanza_id_stanza_seq OWNED BY public.stanza.id_stanza;
          public          postgres    false    217            �            1259    16412    utente    TABLE     y   CREATE TABLE public.utente (
    username character varying(32) NOT NULL,
    password character varying(32) NOT NULL
);
    DROP TABLE public.utente;
       public         heap    postgres    false            q           2604    16415    appartenenza_stanza id_stanza    DEFAULT     �   ALTER TABLE ONLY public.appartenenza_stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.appartenenza_stanza_id_stanza_seq'::regclass);
 L   ALTER TABLE public.appartenenza_stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    211    210            r           2604    16416    messaggio id_stanza    DEFAULT     z   ALTER TABLE ONLY public.messaggio ALTER COLUMN id_stanza SET DEFAULT nextval('public.messaggio_id_stanza_seq'::regclass);
 B   ALTER TABLE public.messaggio ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    213    212            s           2604    16417    richiesta_stanza id_stanza    DEFAULT     �   ALTER TABLE ONLY public.richiesta_stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.richiesta_accesso_id_stanza_seq'::regclass);
 I   ALTER TABLE public.richiesta_stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    215    214            t           2604    16418    stanza id_stanza    DEFAULT     t   ALTER TABLE ONLY public.stanza ALTER COLUMN id_stanza SET DEFAULT nextval('public.stanza_id_stanza_seq'::regclass);
 ?   ALTER TABLE public.stanza ALTER COLUMN id_stanza DROP DEFAULT;
       public          postgres    false    217    216                      0    16394    appartenenza_stanza 
   TABLE DATA           B   COPY public.appartenenza_stanza (username, id_stanza) FROM stdin;
    public          postgres    false    210   R3                 0    16398 	   messaggio 
   TABLE DATA           J   COPY public.messaggio (mittente, id_stanza, ora_invio, testo) FROM stdin;
    public          postgres    false    212   �3                 0    16404    richiesta_stanza 
   TABLE DATA           =   COPY public.richiesta_stanza (utente, id_stanza) FROM stdin;
    public          postgres    false    214   �3                 0    16408    stanza 
   TABLE DATA           D   COPY public.stanza (id_stanza, nome_stanza, nome_admin) FROM stdin;
    public          postgres    false    216   �3                 0    16412    utente 
   TABLE DATA           4   COPY public.utente (username, password) FROM stdin;
    public          postgres    false    218   Y4       !           0    0 !   appartenenza_stanza_id_stanza_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.appartenenza_stanza_id_stanza_seq', 1, false);
          public          postgres    false    211            "           0    0    messaggio_id_stanza_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.messaggio_id_stanza_seq', 1, false);
          public          postgres    false    213            #           0    0    richiesta_accesso_id_stanza_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.richiesta_accesso_id_stanza_seq', 1, false);
          public          postgres    false    215            $           0    0    stanza_id_stanza_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.stanza_id_stanza_seq', 1, false);
          public          postgres    false    217            v           2606    16420    stanza stanza_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.stanza
    ADD CONSTRAINT stanza_pkey PRIMARY KEY (id_stanza);
 <   ALTER TABLE ONLY public.stanza DROP CONSTRAINT stanza_pkey;
       public            postgres    false    216            x           2606    16422    utente utente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_pkey PRIMARY KEY (username);
 <   ALTER TABLE ONLY public.utente DROP CONSTRAINT utente_pkey;
       public            postgres    false    218            �           2620    16459    stanza app_admin    TRIGGER     u   CREATE TRIGGER app_admin AFTER INSERT ON public.stanza FOR EACH ROW EXECUTE FUNCTION public.appartenenza_creatore();
 )   DROP TRIGGER app_admin ON public.stanza;
       public          postgres    false    216    219            y           2606    16423 6   appartenenza_stanza appartenenza_stanza_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartenenza_stanza
    ADD CONSTRAINT appartenenza_stanza_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 `   ALTER TABLE ONLY public.appartenenza_stanza DROP CONSTRAINT appartenenza_stanza_id_stanza_fkey;
       public          postgres    false    216    3190    210            z           2606    16428 5   appartenenza_stanza appartenenza_stanza_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartenenza_stanza
    ADD CONSTRAINT appartenenza_stanza_username_fkey FOREIGN KEY (username) REFERENCES public.utente(username);
 _   ALTER TABLE ONLY public.appartenenza_stanza DROP CONSTRAINT appartenenza_stanza_username_fkey;
       public          postgres    false    210    218    3192            {           2606    16433 "   messaggio messaggio_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messaggio
    ADD CONSTRAINT messaggio_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 L   ALTER TABLE ONLY public.messaggio DROP CONSTRAINT messaggio_id_stanza_fkey;
       public          postgres    false    212    3190    216            |           2606    16438 !   messaggio messaggio_mittente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messaggio
    ADD CONSTRAINT messaggio_mittente_fkey FOREIGN KEY (mittente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.messaggio DROP CONSTRAINT messaggio_mittente_fkey;
       public          postgres    false    218    212    3192            }           2606    16443 1   richiesta_stanza richiesta_accesso_id_stanza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.richiesta_stanza
    ADD CONSTRAINT richiesta_accesso_id_stanza_fkey FOREIGN KEY (id_stanza) REFERENCES public.stanza(id_stanza);
 [   ALTER TABLE ONLY public.richiesta_stanza DROP CONSTRAINT richiesta_accesso_id_stanza_fkey;
       public          postgres    false    3190    214    216            ~           2606    16448 .   richiesta_stanza richiesta_accesso_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.richiesta_stanza
    ADD CONSTRAINT richiesta_accesso_utente_fkey FOREIGN KEY (utente) REFERENCES public.utente(username);
 X   ALTER TABLE ONLY public.richiesta_stanza DROP CONSTRAINT richiesta_accesso_utente_fkey;
       public          postgres    false    3192    214    218                       2606    16453    stanza stanza_nome_admin_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stanza
    ADD CONSTRAINT stanza_nome_admin_fkey FOREIGN KEY (nome_admin) REFERENCES public.utente(username);
 G   ALTER TABLE ONLY public.stanza DROP CONSTRAINT stanza_nome_admin_fkey;
       public          postgres    false    218    216    3192               T   x��A� ���1&S/��.`�$4�zǱiӮ\B�Dĭ%��rH"����-��h�_s'���7#Y�R7C��	 ~�&�            x������ � �            x�K�MLKK�4,�4����� 1�[         M   x��[
� ��;�h�=vӏ����v�9�>]M���|e���w5c�"�D��lh������E�Y;Z         
  x�5�[��������->.[mm��Ķ�~B�c����)�5燨��@�+�Gq%�,�6� u������d�'���X\M��qC8��x�����H�ʔl���z8��*J7�p���h�1DEge�;�'����K;b(s�H�ƻ��S![�ľDQJ�I�
@,�x)r���m�3�O�f�O�xN�O
�`����(S�!���Tbx���E%�&a����xb�TJ:'�L�;-�t�$�k?��eд����z;G:J�Ԧp����L7H���m�w���S��ڴ�U�ρ������5��쩄�u7�?���P������^�%>��6ݽ&�qF�{�B{�����������2�����'�CI�w7�_Eó�n;��lQ�Uaº
VD��@��U�3p���(;O^cd�锪������R�wX�s��;�m�E�YY%J�"��F��ap� ���Q��I�x�F��+Ks������1��XY���-���&?�P�	�Z�"�͓��\��P��O��j�H2k�	�x���̳�!�4��C�����B"k����/�}~�6�9Ŀ7�j�mhM��8�����Ie�l�1$A���ُ[���>�A��W:C�6J�*�C8>W���%ߚ6��#��W�κ:Ē�5��)�$Q����O&���yr9��w�^�i�t�Dŭix.p �'��*����e�>�Aq���+EZR.�zSH�������"^
�mRa��n朇�r�����9|����R�JY��#8��z󼔈&�!�H&�_�nk�����L�1�2,{$�we�3�����u�uG�?�Q�*�9�]z�7;T;ʌ�Kx�!=�[�ro㤓I&p�HZD���PnigL�K��>�i�ޒG���N�c�1V�䟈k��5�+f�$R��*�߼�`7�D��'�_�<w��@F��F7D}�E�Z��&���|EocS�� ���w�g�g���i*$�0�_�$�I����n������'TP�}�`Ⱥ#����Ȫ����OS��lJ���r�,���#����Fx��m��S}����b�V����'����+w]�Qü��z�~��Y.9�%~A���u�N�LI�hn��@��js)F!�=}�'hB0����.��$�����G<�Q��DS��h:2�z΋��X�K��dy����E4���a�<|<}��3dՠ�]����b�cZ�ޖL!�m�1�=��G	`�����{�:����:�SQ!OԼOdB!��p���Jq�oF5�z�~§�p'��*�<>�AD�@'	ě?l՗=R�:��p����"��F��!]��I�����j�w��7���ˡE��y��ֳa3(���/iӺ�H��>
&��%�
͔q� ��t����$~J���?��fׯc���_��.��>�"�n*���h�|�&z0�7�}#�EE>��=Z{����N�/�R
�/_��j����?�b��ڐ;,σ���4B��XO��N>�)ja��M���!����&     