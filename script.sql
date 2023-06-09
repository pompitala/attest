PGDMP         :                {            Shop    15.1    15.1 5    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    16557    Shop    DATABASE     h   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "Shop";
                postgres    false            �            1259    16559    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16558    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            C           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    16566    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16565    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            D           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    16621    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16620    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            E           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    16573    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16572    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            F           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    16582    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16604    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16603    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            G           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    16581    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            H           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            �           2604    16562    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16569    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16624 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16576 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16585 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16607    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            2          0    16559    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    215   ;       4          0    16566    image 
   TABLE DATA           :   COPY public.image (id, file_name, product_id) FROM stdin;
    public          postgres    false    217   z;       <          0    16621    orders 
   TABLE DATA           d   COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
    public          postgres    false    225   #@       6          0    16573    person 
   TABLE DATA           ;   COPY public.person (id, login, password, role) FROM stdin;
    public          postgres    false    219   /A       8          0    16582    product 
   TABLE DATA           k   COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
    public          postgres    false    221   �A       :          0    16604    product_cart 
   TABLE DATA           A   COPY public.product_cart (id, person_id, product_id) FROM stdin;
    public          postgres    false    223   -K       I           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            J           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 55, true);
          public          postgres    false    216            K           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 7, true);
          public          postgres    false    224            L           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    218            M           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 14, true);
          public          postgres    false    222            N           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 11, true);
          public          postgres    false    220            �           2606    16564    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    16571    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    16626    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    16580    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    16609    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    16590    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    16592 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    16627 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    225    3476            �           2606    16598 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    3472    221            �           2606    16632 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    221    225    3478            �           2606    16593 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    221    3478    217            �           2606    16615 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    223    3478            �           2606    16610 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    223    3476    219            2   [   x���@@D���P��(���P��+,-�ߑ/��9���1��D�tL<l�̢I;�����N#��ϥ�/	����֞�E�\D>�e9�      4   �  x�=U;�%7����)�#���QW9��#�w�/�ڙ�	����Y���6�ƨ4o��l֦�O�����臥�z嶕TU/{��BgʪW��y�k�+�M�$��^s��Z�C��9���(ޟ? +�}]�u2;��zв=5����/�ދ��C�t�E_���q�'~��Ks��9ȧ��㞳���C2�/e �ã,[��Ӊk&٭-�E2,��֫�ο /��y�Eu4ThC(�1��������rwE��xeE��f�I���ܻ�K�>RK�#S�!0iI���Ҝ���Z���4 \|�\�c�]��A����ɱ=_��#R�٫6z ��ɫY����d��P����bӾ1L��ii����R��%�AK�^iɀ4L��.q�y�Jƌ_� �U0>��%*6�'�_J*ïm�r�K�^ƕ<Z�FB������a���n�d��Ť���$m լ]����4 @Z��Υ?�As�ӵ����%@����ȡ��0V��m9im�Vh�����Gk�Y���=V����I.R׌�/i ���]oMl��!��Q������G�iL{�F�pT�ش*�y�8���|I�E�|q�1��B@�}�-m�/i����\&m�Ez�@;�Z�\cg��4 !P�����2�>��#��&�4 ������:0������T�/i�(<=:$�L�o��4��b�!SAY�%��m�YaQ�w6&�=)fr��FzI�MK�5u�BF����}��wAeu��_���Z�Nm!jCA����5sC{��}I��q��~��eČ 5��n��i���1){`��/����%��Bj�*s���ߖ ��֪	M��@5�<�#�w��� X�[},4-���4���&#�0rTh_@+{ye�x��������h��?���^Nك�boŔ:��8-�g�]�����QĠ��	�@ē�s�1{L�K�}Y?/�N�J�%h7|����>{D��}i?��dqH���.zo�5�c����Ղa�B9tAa��2�+�r�ˮ��Ӄ`t%w���.��J���y�͗9���p�j4�N�	�q�PYD�U�J�A`�p�nx�π-�c����ua����xV�v�̐�x����+Pq��~�~��h�1xFu�\���>�h1T� �����~>���5+�      <   �   x����m!@�5S�k�#�M-��_B�[M�D����bS������BjR��)�^p
��SB@�5�bD7_�qq����9��鋩i4����K�1�S�=s��!BX��ê���&O�^M�)�Y�-�Ӿ�a�PP�)u��i.�{_�8��
ѡ�9���86眱����'�m�.Wߙ{:�a���_�<Qj�OKG|szԿ8�*��3�����U��BFZ�h��𾮽��a�p	M�����>��8>�[r�      6   �   x�=��
�0  �g�>��&>J��ts.!"��62�]X_�C����Z�k�[��lױ2�G&�1"7A'�b��0 ��qj��}mH�o%��㋑Z5.�k��{<빈���L����H��	��࡙���P���Lׇ��A����54��e �u2�      8   A	  x��Y[n�F��W1�6 z���.F�-;��(AҢh��q�Q�@AɢES$x�-d%��ܙ9��E�D"�q�{f�kt���y�����d��N�V��;�s��a~�C��H�J?���lu�7��ZG��\ҀL?+ЇP'4:R��G�A�=S���k��g:��z���E��%V�\���iB������u�33��ť.���Z�;Y蘞G:ց�
�ӗ�ҏ�,��{��~�LD&��)6��9�/�^�Z��S6�7j�g{��h������	xo�z�e:)�g�Ͱ�I���AG��p�o蟌%�,��'y��QC?�S޴��I���B������޴?nu�ɸ��Ӽ����kX��k��0M��d��P\�%Js�h!	$ӫ|��"2�¾�w4ކH�����.�7�2��1!�yP�f�~~E����S�u��h��L���%W|��Eد�X`�q6�X��\����96GW�G�dL[�B�S�8�����ˣݕ��h9L3�/�r���P �f=�G0%�)�=���ί)8�)�5I��"�D�� Q*[�ɨ��t���m�?8P��Dɫ:�|����n�;j������:�[�&�'�И�
�l8��GSD3���A���P� ����Ǐ��Ҏ��� D&t���gH-c(«]~o�A�� rs)�5g��,�t).ZJ.g���:���3���������;N����;8w1�-�9c���@�0�"�&�9��k m�%� TϨ�U�MM %ϑ|���1����d(�q�q�P{�o�qvͣ������8���ă�Ԙ<�++��4M0�"5L;\3�+��L�����7���MJ��=M�jḡ��MP�\�@gV���@�y��#7Ȱ~>pWZ�[О�BX�Iysjj�#�\J�ħ&A�NW���61��		��I�l+}VL�ָ;'Z%k���t�/�-������P�l!�~!�13�R��5{�2�'D����t�MĐ��̛s$3��;+.*$�0 b���b�m�6�z�� V`%����U{���] -�c!Bs��A����	ː�hR��gHgK�l��๚������p:�:�Q���I�2����D��W����9�Jh����D�"hQ�ګ6J���Z�<
KF�P���55f`$�ShK�1gX�Qd6�:i5�j�8]����= �>�t�ZU��C�^XxJ�?YPFU)C��� ��03��`'�2Z�*��ǘl��1\ah�7&xEĭP��@;uxO*ի�3e�ҌA�}.+�SϤ�E$_׎>e�WF�oĸ\��C��i��P��3
�[GŬ^��Un�4��(�D%�	<⮰��	+���An�* 3̒d��d7H<1{�E5m��Sq�|x��[�Y����p���V�lg$�1(FՉ�F2���*���N��K����qh�d��ND�e�SO��5��>p�O�(?���*�81ܖ�����+PX�8.��2���h�S9��r��`�*	tye'M�ZH��1��� Mѡ��{�Oi�H�������#ԉG��Ѵ3huz]��������U��e�-�Gu�8C9{.���80䓑ɧ�INdU�@2И'����e���
�����-���Vh���� �H���P��wZ�*����Կ�x�C�B��e��<�1�>(��_%�L�1m����t�>��Ö��E��n6a��}j�07��V,�1�D��e�od�t�L{����huAe;�����9��Ԉ�z��`�]���t�>���^�5�N�Z�-��P�嬻;v����6-���.��|��pm�:�����V�Gr�g/�l@�	~�nC{Erl�2p���Z���Cά���ʋB*���B��#]�:y�"z�W1�H|���s`�������l��.���������5V�ִ���"F�dm�V��F�D[n�չ�ps��U�Y�,��1 ��W�V.��Y�H��E��uk�,_7�Co	�׼�G�P�꡿f����u/qc2���M�n7�� J���(��G��4ٽt�!�K�[(uu�CAgC"���h��HD�{�9�����-�\j�|�++ǎ�̵Bʕ�8��K-Cu|��L{�֤?쵩��se� ז�Eʑ�ۙ��k�.ӥ#�m�_s��{�Ѭ���h�9"i��7�8�pm�<�:��u�Q)տ��~��u��+���
�
�u�J/R��\�#�|�x��!S<��1�8��� ��o*tm�R���VD�zg�5<H��5��-��F��t�5��d�\.���e��k�������      :      x������ � �     