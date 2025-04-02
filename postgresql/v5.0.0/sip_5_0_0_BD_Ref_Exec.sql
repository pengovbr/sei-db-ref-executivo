--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrador_sistema; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.administrador_sistema (
    id_usuario integer NOT NULL,
    id_sistema integer NOT NULL
);


ALTER TABLE public.administrador_sistema OWNER TO sip_user;

--
-- Name: assinatura_sso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assinatura_sso (
    id_assinatura_sso character varying(26) NOT NULL,
    id_login_sso character varying(26) NOT NULL,
    sta_assinatura_sso character(1) NOT NULL,
    dth_assinatura_sso timestamp without time zone NOT NULL,
    token_sistema character varying(26) NOT NULL,
    code_servico character varying(50),
    identificador_conteudo character varying(100),
    hash_conteudo character varying(64),
    sta_erro integer
);


ALTER TABLE public.assinatura_sso OWNER TO postgres;

--
-- Name: codigo_acesso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.codigo_acesso (
    id_codigo_acesso character varying(26) NOT NULL,
    id_usuario integer NOT NULL,
    id_usuario_desativacao integer,
    id_sistema integer NOT NULL,
    chave_geracao character varying(32) NOT NULL,
    dth_geracao timestamp without time zone NOT NULL,
    chave_ativacao character varying(60),
    dth_envio_ativacao timestamp without time zone,
    dth_ativacao timestamp without time zone,
    chave_desativacao character varying(60),
    dth_envio_desativacao timestamp without time zone,
    dth_desativacao timestamp without time zone,
    dth_acesso timestamp without time zone,
    email character varying(100),
    sin_ativo character(1) NOT NULL,
    identificacao character varying(50) NOT NULL,
    sin_unico character(1) NOT NULL
);


ALTER TABLE public.codigo_acesso OWNER TO sip_user;

--
-- Name: codigo_bloqueio; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.codigo_bloqueio (
    id_codigo_bloqueio character varying(26) NOT NULL,
    id_codigo_acesso character varying(26) NOT NULL,
    chave_bloqueio character varying(60) NOT NULL,
    dth_envio timestamp without time zone NOT NULL,
    dth_bloqueio timestamp without time zone,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.codigo_bloqueio OWNER TO sip_user;

--
-- Name: coordenador_perfil; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.coordenador_perfil (
    id_perfil integer NOT NULL,
    id_usuario integer NOT NULL,
    id_sistema integer NOT NULL
);


ALTER TABLE public.coordenador_perfil OWNER TO sip_user;

--
-- Name: coordenador_unidade; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.coordenador_unidade (
    id_sistema integer NOT NULL,
    id_usuario integer NOT NULL,
    id_unidade integer NOT NULL
);


ALTER TABLE public.coordenador_unidade OWNER TO sip_user;

--
-- Name: dispositivo_acesso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.dispositivo_acesso (
    id_dispositivo_acesso character varying(26) NOT NULL,
    id_codigo_acesso character varying(26) NOT NULL,
    chave_dispositivo character varying(60) NOT NULL,
    chave_acesso character varying(60),
    dth_liberacao timestamp without time zone,
    user_agent character varying(500) NOT NULL,
    dth_acesso timestamp without time zone NOT NULL,
    ip_acesso character varying(39) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.dispositivo_acesso OWNER TO sip_user;

--
-- Name: email_sistema; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.email_sistema (
    id_email_sistema integer NOT NULL,
    id_email_sistema_modulo character varying(50),
    de character varying(250) NOT NULL,
    para character varying(250) NOT NULL,
    assunto character varying(250) NOT NULL,
    conteudo text NOT NULL,
    descricao character varying(250) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.email_sistema OWNER TO sip_user;

--
-- Name: grupo_perfil; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.grupo_perfil (
    id_grupo_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    nome character varying(100) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.grupo_perfil OWNER TO sip_user;

--
-- Name: hierarquia; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.hierarquia (
    id_hierarquia integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(200),
    dta_inicio timestamp without time zone NOT NULL,
    dta_fim timestamp without time zone,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.hierarquia OWNER TO sip_user;

--
-- Name: infra_agendamento_tarefa; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_agendamento_tarefa (
    id_infra_agendamento_tarefa integer NOT NULL,
    descricao character varying(500) NOT NULL,
    comando character varying(255) NOT NULL,
    sta_periodicidade_execucao character(1) NOT NULL,
    periodicidade_complemento character varying(200),
    dth_ultima_execucao timestamp without time zone,
    dth_ultima_conclusao timestamp without time zone,
    sin_sucesso character(1) NOT NULL,
    parametro character varying(250),
    email_erro character varying(250),
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.infra_agendamento_tarefa OWNER TO sip_user;

--
-- Name: infra_auditoria; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_auditoria (
    id_infra_auditoria bigint NOT NULL,
    id_usuario integer,
    id_orgao_usuario integer,
    id_usuario_emulador integer,
    id_orgao_usuario_emulador integer,
    id_unidade integer,
    id_orgao_unidade integer,
    recurso character varying(100) NOT NULL,
    dth_acesso timestamp without time zone NOT NULL,
    ip character varying(39),
    sigla_usuario character varying(100),
    nome_usuario character varying(100),
    sigla_orgao_usuario character varying(30),
    sigla_usuario_emulador character varying(100),
    nome_usuario_emulador character varying(100),
    sigla_orgao_usuario_emulador character varying(30),
    sigla_unidade character varying(30),
    descricao_unidade character varying(250),
    sigla_orgao_unidade character varying(30),
    servidor character varying(250),
    user_agent text,
    requisicao text,
    operacao text
);


ALTER TABLE public.infra_auditoria OWNER TO sip_user;

--
-- Name: infra_captcha; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_captcha (
    identificacao character varying(50) NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL,
    acertos bigint NOT NULL,
    erros bigint NOT NULL
);


ALTER TABLE public.infra_captcha OWNER TO sip_user;

--
-- Name: infra_erro_php; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_erro_php (
    id_infra_erro_php character varying(32) NOT NULL,
    sta_tipo integer NOT NULL,
    arquivo character varying(255) NOT NULL,
    linha integer NOT NULL,
    erro character varying(4000) NOT NULL,
    dth_cadastro timestamp without time zone NOT NULL,
    quantidade bigint
);


ALTER TABLE public.infra_erro_php OWNER TO sip_user;

--
-- Name: infra_log; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_log (
    id_infra_log bigint NOT NULL,
    dth_log timestamp without time zone,
    texto_log text NOT NULL,
    ip character varying(39),
    sta_tipo character(1) NOT NULL
);


ALTER TABLE public.infra_log OWNER TO sip_user;

--
-- Name: infra_navegador_verificacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.infra_navegador_verificacao (
    tipo_navegador character varying(50) NOT NULL,
    versao_menor character varying(10),
    operador_menor character varying(2),
    versao_maior character varying(10),
    operador_maior character varying(2),
    sin_verificar character(1) NOT NULL,
    sin_compativel character(1) NOT NULL
);


ALTER TABLE public.infra_navegador_verificacao OWNER TO postgres;

--
-- Name: infra_parametro; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_parametro (
    nome character varying(50) NOT NULL,
    valor character varying(1024)
);


ALTER TABLE public.infra_parametro OWNER TO sip_user;

--
-- Name: infra_regra_auditoria; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_regra_auditoria (
    id_infra_regra_auditoria integer NOT NULL,
    descricao character varying(250) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.infra_regra_auditoria OWNER TO sip_user;

--
-- Name: infra_regra_auditoria_recurso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_regra_auditoria_recurso (
    id_infra_regra_auditoria integer NOT NULL,
    recurso character varying(100) NOT NULL
);


ALTER TABLE public.infra_regra_auditoria_recurso OWNER TO sip_user;

--
-- Name: infra_sequencia; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.infra_sequencia (
    nome_tabela character varying(30) NOT NULL,
    qtd_incremento integer NOT NULL,
    num_atual integer NOT NULL,
    num_maximo integer NOT NULL
);


ALTER TABLE public.infra_sequencia OWNER TO sip_user;

--
-- Name: item_menu; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.item_menu (
    id_menu integer NOT NULL,
    id_item_menu integer NOT NULL,
    id_sistema integer,
    id_menu_pai integer,
    id_item_menu_pai integer,
    id_recurso integer,
    rotulo character varying(50) NOT NULL,
    descricao character varying(200),
    sequencia integer NOT NULL,
    sin_ativo character(1) NOT NULL,
    sin_nova_janela character(1) NOT NULL,
    icone character varying(250)
);


ALTER TABLE public.item_menu OWNER TO sip_user;

--
-- Name: login; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.login (
    id_login character(128) NOT NULL,
    id_sistema integer NOT NULL,
    id_usuario integer NOT NULL,
    id_usuario_emulador integer,
    dth_login timestamp without time zone NOT NULL,
    hash_interno character(128) NOT NULL,
    hash_usuario character(128) NOT NULL,
    hash_agente character(128) NOT NULL,
    http_client_ip character varying(39),
    remote_addr character varying(39),
    http_x_forwarded_for character varying(39),
    sta_login character(1) NOT NULL,
    user_agent character varying(500) NOT NULL,
    id_dispositivo_acesso character varying(26),
    id_codigo_acesso character varying(26),
    id_login_sso character varying(26)
);


ALTER TABLE public.login OWNER TO sip_user;

--
-- Name: login_sso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_sso (
    id_login_sso character varying(26) NOT NULL,
    id_sistema integer NOT NULL,
    id_servico_sso integer NOT NULL,
    cpf bigint,
    nome character varying(100),
    nome_social character varying(100),
    email character varying(100),
    telefone character varying(50),
    sta_login_sso character(1) NOT NULL,
    dth_login_sso timestamp without time zone NOT NULL,
    origem character varying(4000),
    destino_login character varying(4000) NOT NULL,
    destino_logout character varying(4000) NOT NULL,
    http_client_ip character varying(39),
    http_x_forwarded_for character varying(39),
    remote_addr character varying(39),
    user_agent character varying(500) NOT NULL,
    sta_nivel_confiabilidade character(1),
    sta_tipo_acesso character(1) NOT NULL,
    sta_erro integer,
    state character varying(32),
    sin_certificado_digital character(1),
    sin_2_fatores character(1)
);


ALTER TABLE public.login_sso OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    id_sistema integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(200),
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.menu OWNER TO sip_user;

--
-- Name: orgao; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.orgao (
    id_orgao integer NOT NULL,
    sigla character varying(30) NOT NULL,
    descricao character varying(250) NOT NULL,
    sin_ativo character(1) NOT NULL,
    sin_autenticar character(1) NOT NULL,
    ordem integer NOT NULL
);


ALTER TABLE public.orgao OWNER TO sip_user;

--
-- Name: perfil; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.perfil (
    id_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text,
    sin_coordenado character(1) NOT NULL,
    sin_ativo character(1) NOT NULL,
    sin_2_fatores character(1) NOT NULL
);


ALTER TABLE public.perfil OWNER TO sip_user;

--
-- Name: permissao; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.permissao (
    id_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    id_usuario integer NOT NULL,
    id_unidade integer NOT NULL,
    id_tipo_permissao integer NOT NULL,
    dta_inicio timestamp without time zone NOT NULL,
    dta_fim timestamp without time zone,
    sin_subunidades character(1) NOT NULL
);


ALTER TABLE public.permissao OWNER TO sip_user;

--
-- Name: recurso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.recurso (
    id_sistema integer NOT NULL,
    id_recurso integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(200),
    caminho character varying(255) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.recurso OWNER TO sip_user;

--
-- Name: recurso_vinculado; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.recurso_vinculado (
    id_sistema integer NOT NULL,
    id_recurso integer NOT NULL,
    id_sistema_vinculado integer NOT NULL,
    id_recurso_vinculado integer NOT NULL,
    tipo_vinculo integer NOT NULL
);


ALTER TABLE public.recurso_vinculado OWNER TO sip_user;

--
-- Name: regra_auditoria; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.regra_auditoria (
    id_regra_auditoria integer NOT NULL,
    id_sistema integer NOT NULL,
    descricao character varying(250) NOT NULL,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.regra_auditoria OWNER TO sip_user;

--
-- Name: rel_grupo_perfil_perfil; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_grupo_perfil_perfil (
    id_grupo_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public.rel_grupo_perfil_perfil OWNER TO sip_user;

--
-- Name: rel_hierarquia_unidade; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_hierarquia_unidade (
    id_unidade integer NOT NULL,
    id_hierarquia integer NOT NULL,
    id_hierarquia_pai integer,
    id_unidade_pai integer,
    dta_inicio timestamp without time zone NOT NULL,
    dta_fim timestamp without time zone,
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.rel_hierarquia_unidade OWNER TO sip_user;

--
-- Name: rel_orgao_autenticacao; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_orgao_autenticacao (
    id_orgao integer NOT NULL,
    id_servidor_autenticacao integer NOT NULL,
    sequencia integer NOT NULL
);


ALTER TABLE public.rel_orgao_autenticacao OWNER TO sip_user;

--
-- Name: rel_perfil_item_menu; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_perfil_item_menu (
    id_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    id_menu integer NOT NULL,
    id_item_menu integer NOT NULL,
    id_recurso integer NOT NULL
);


ALTER TABLE public.rel_perfil_item_menu OWNER TO sip_user;

--
-- Name: rel_perfil_recurso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_perfil_recurso (
    id_perfil integer NOT NULL,
    id_sistema integer NOT NULL,
    id_recurso integer NOT NULL
);


ALTER TABLE public.rel_perfil_recurso OWNER TO sip_user;

--
-- Name: rel_regra_auditoria_recurso; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.rel_regra_auditoria_recurso (
    id_recurso integer NOT NULL,
    id_sistema integer NOT NULL,
    id_regra_auditoria integer NOT NULL
);


ALTER TABLE public.rel_regra_auditoria_recurso OWNER TO sip_user;

--
-- Name: rel_sistema_servico_sso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_sistema_servico_sso (
    id_sistema integer NOT NULL,
    id_servico_sso integer NOT NULL,
    sta_tipo_acesso character(1) NOT NULL,
    ordem integer NOT NULL
);


ALTER TABLE public.rel_sistema_servico_sso OWNER TO postgres;

--
-- Name: seq_infra_auditoria; Type: SEQUENCE; Schema: public; Owner: sip_user
--

CREATE SEQUENCE public.seq_infra_auditoria
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_infra_auditoria OWNER TO sip_user;

--
-- Name: seq_infra_log; Type: SEQUENCE; Schema: public; Owner: sip_user
--

CREATE SEQUENCE public.seq_infra_log
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_infra_log OWNER TO sip_user;

--
-- Name: servico_sso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servico_sso (
    id_servico_sso integer NOT NULL,
    identificacao character varying(50) NOT NULL,
    titulo character varying(100) NOT NULL,
    sta_servico_sso character(1) NOT NULL,
    client_id character varying(250) NOT NULL,
    client_secret character varying(250) NOT NULL,
    scope character varying(250) NOT NULL,
    url_base character varying(250) NOT NULL,
    url_api_conta character varying(250),
    url_issuer character varying(250),
    url_token character varying(250),
    url_logout character varying(250),
    url_authorize character varying(250),
    campo_sso character varying(50) NOT NULL,
    campo_usuario character varying(50) NOT NULL,
    logo text,
    client_id_assinatura character varying(250),
    client_secret_assinatura character varying(250),
    url_base_assinatura character varying(250),
    url_api_assinatura character varying(250),
    sin_ativo character(1) NOT NULL
);


ALTER TABLE public.servico_sso OWNER TO postgres;

--
-- Name: servidor_autenticacao; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.servidor_autenticacao (
    id_servidor_autenticacao integer NOT NULL,
    nome character varying(50) NOT NULL,
    sta_tipo character varying(10) NOT NULL,
    endereco character varying(100) NOT NULL,
    porta integer NOT NULL,
    sufixo character varying(50),
    usuario_pesquisa character varying(100),
    senha_pesquisa character varying(100),
    contexto_pesquisa character varying(100),
    atributo_filtro_pesquisa character varying(100),
    atributo_retorno_pesquisa character varying(100),
    versao integer NOT NULL
);


ALTER TABLE public.servidor_autenticacao OWNER TO sip_user;

--
-- Name: sistema; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.sistema (
    id_sistema integer NOT NULL,
    id_orgao integer NOT NULL,
    id_hierarquia integer NOT NULL,
    sigla character varying(15) NOT NULL,
    descricao character varying(200),
    pagina_inicial character varying(255),
    sin_ativo character(1) NOT NULL,
    web_service character varying(255),
    logo text,
    sta_2_fatores character(1) NOT NULL,
    esquema_login character varying(50),
    servicos_liberados character varying(200),
    chave_acesso character varying(60),
    crc character(8),
    alias character varying(4000),
    sin_autenticacao_padrao character(1) NOT NULL,
    sin_permissao character(1) NOT NULL,
    sta_confiabilidade_interno character(1)
);


ALTER TABLE public.sistema OWNER TO sip_user;

--
-- Name: tipo_permissao; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.tipo_permissao (
    id_tipo_permissao integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.tipo_permissao OWNER TO sip_user;

--
-- Name: unidade; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.unidade (
    id_unidade integer NOT NULL,
    id_orgao integer NOT NULL,
    id_origem character varying(50),
    sigla character varying(30) NOT NULL,
    descricao character varying(250) NOT NULL,
    sin_ativo character(1) NOT NULL,
    sin_global character(1) NOT NULL
);


ALTER TABLE public.unidade OWNER TO sip_user;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_orgao integer NOT NULL,
    id_origem character varying(50),
    sigla character varying(100) NOT NULL,
    nome character varying(100) NOT NULL,
    sin_ativo character(1) NOT NULL,
    cpf bigint,
    nome_registro_civil character varying(100) NOT NULL,
    nome_social character varying(100),
    email character varying(100),
    sin_bloqueado character(1) NOT NULL,
    dth_pausa_2fa timestamp without time zone
);


ALTER TABLE public.usuario OWNER TO sip_user;

--
-- Name: usuario_historico; Type: TABLE; Schema: public; Owner: sip_user
--

CREATE TABLE public.usuario_historico (
    id_usuario_historico integer NOT NULL,
    id_codigo_acesso character varying(26),
    id_usuario integer NOT NULL,
    id_usuario_operacao integer NOT NULL,
    dth_operacao timestamp without time zone NOT NULL,
    sta_operacao character(1) NOT NULL,
    motivo character varying(4000),
    dth_pausa_2fa timestamp without time zone
);


ALTER TABLE public.usuario_historico OWNER TO sip_user;

--
-- Name: usuario_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_login (
    id_usuario integer NOT NULL,
    tentativas integer NOT NULL,
    dth_tentativa timestamp without time zone NOT NULL,
    http_client_ip character varying(39),
    http_x_forwarded_for character varying(39),
    remote_addr character varying(39),
    user_agent character varying(500) NOT NULL
);


ALTER TABLE public.usuario_login OWNER TO postgres;

--
-- Data for Name: administrador_sistema; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.administrador_sistema (id_usuario, id_sistema) FROM stdin;
100000001	100000099
100000001	100000100
\.


--
-- Data for Name: assinatura_sso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assinatura_sso (id_assinatura_sso, id_login_sso, sta_assinatura_sso, dth_assinatura_sso, token_sistema, code_servico, identificador_conteudo, hash_conteudo, sta_erro) FROM stdin;
\.


--
-- Data for Name: codigo_acesso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.codigo_acesso (id_codigo_acesso, id_usuario, id_usuario_desativacao, id_sistema, chave_geracao, dth_geracao, chave_ativacao, dth_envio_ativacao, dth_ativacao, chave_desativacao, dth_envio_desativacao, dth_desativacao, dth_acesso, email, sin_ativo, identificacao, sin_unico) FROM stdin;
\.


--
-- Data for Name: codigo_bloqueio; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.codigo_bloqueio (id_codigo_bloqueio, id_codigo_acesso, chave_bloqueio, dth_envio, dth_bloqueio, sin_ativo) FROM stdin;
\.


--
-- Data for Name: coordenador_perfil; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.coordenador_perfil (id_perfil, id_usuario, id_sistema) FROM stdin;
\.


--
-- Data for Name: coordenador_unidade; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.coordenador_unidade (id_sistema, id_usuario, id_unidade) FROM stdin;
\.


--
-- Data for Name: dispositivo_acesso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.dispositivo_acesso (id_dispositivo_acesso, id_codigo_acesso, chave_dispositivo, chave_acesso, dth_liberacao, user_agent, dth_acesso, ip_acesso, sin_ativo) FROM stdin;
\.


--
-- Data for Name: email_sistema; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.email_sistema (id_email_sistema, id_email_sistema_modulo, de, para, assunto, conteudo, descricao, sin_ativo) FROM stdin;
1	\N	@sigla_sistema@/@sigla_orgao_sistema@ <@email_sistema@>	@nome_usuario@ <@email_usuario@>	Ativação da Autenticação em 2 Fatores	A autenticação em 2 fatores foi solicitada para sua conta no sistema @sigla_sistema@/@sigla_orgao_sistema@ em @data@ às @hora@.\n\nClique no link abaixo para ativá-la:\n\n@endereco_ativacao@	Ativação da Autenticação em 2 Fatores	S
2	\N	@sigla_sistema@/@sigla_orgao_sistema@ <@email_sistema@>	@nome_usuario@ <@email_usuario@>	Desativação da Autenticação em 2 Fatores	A desativação da autenticação em 2 fatores foi solicitada para sua conta no sistema @sigla_sistema@/@sigla_orgao_sistema@ em @data@ às @hora@.\n\nClique no link abaixo para desativá-la:\n\n@endereco_desativacao@	Desativação da Autenticação em 2 Fatores	S
3	\N	@sigla_sistema@/@sigla_orgao_sistema@ <@email_sistema@>	@email_usuario@	Alerta de Segurança	Sua conta no sistema @sigla_sistema@/@sigla_orgao_sistema@ foi acessada a partir de um novo dispositivo em @data@ às @hora@.\n\nSe você não reconhece esta atividade altere imediatamente a sua senha ou clique no link abaixo para bloquear sua conta no sistema:\n\n@endereco_bloqueio@	Alerta de segurança sobre acesso em outro dispositivo	S
4	\N	@sigla_sistema@/@sigla_orgao_sistema@ <@email_sistema@>	@email_usuario@	Aviso de Bloqueio	Sua conta no sistema @sigla_sistema@/@sigla_orgao_sistema@ foi bloqueada em @data@ às @hora@.	Bloqueio do usuário por link em e-mail de alerta de segurança	S
\.


--
-- Data for Name: grupo_perfil; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.grupo_perfil (id_grupo_perfil, id_sistema, nome, sin_ativo) FROM stdin;
\.


--
-- Data for Name: hierarquia; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.hierarquia (id_hierarquia, nome, descricao, dta_inicio, dta_fim, sin_ativo) FROM stdin;
100000018	SEI	Unidades Organizacionais	2014-01-06 00:00:00	\N	S
\.


--
-- Data for Name: infra_agendamento_tarefa; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_agendamento_tarefa (id_infra_agendamento_tarefa, descricao, comando, sta_periodicidade_execucao, periodicidade_complemento, dth_ultima_execucao, dth_ultima_conclusao, sin_sucesso, parametro, email_erro, sin_ativo) FROM stdin;
1	Remover dados temporários de login	AgendamentoRN::removerDadosLogin	D	1	2014-11-14 08:05:06	2014-11-14 08:05:06	S	\N	\N	S
3	Replicar todos os usuários para o SEI	AgendamentoRN::replicarTodosUsuariosSEI	D	6	\N	\N	N	\N	\N	N
4	Replicar todas as unidades da hierarquia para o SEI	AgendamentoRN::replicarUnidadesHierarquiaSEI	D	5	\N	\N	N	\N	\N	N
5	Replica regras de auditoria para o SEI.	AgendamentoRN::replicarRegrasAuditoriaSEI	D	7	\N	\N	N	\N	\N	S
2	Teste de agendamento SIP	AgendamentoRN::testarAgendamento	N	0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55	2025-01-23 17:45:01	2014-11-14 08:05:04	N	\N	\N	S
\.


--
-- Data for Name: infra_auditoria; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_auditoria (id_infra_auditoria, id_usuario, id_orgao_usuario, id_usuario_emulador, id_orgao_usuario_emulador, id_unidade, id_orgao_unidade, recurso, dth_acesso, ip, sigla_usuario, nome_usuario, sigla_orgao_usuario, sigla_usuario_emulador, nome_usuario_emulador, sigla_orgao_usuario_emulador, sigla_unidade, descricao_unidade, sigla_orgao_unidade, servidor, user_agent, requisicao, operacao) FROM stdin;
\.


--
-- Data for Name: infra_captcha; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_captcha (identificacao, dia, mes, ano, acertos, erros) FROM stdin;
\.


--
-- Data for Name: infra_erro_php; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_erro_php (id_infra_erro_php, sta_tipo, arquivo, linha, erro, dth_cadastro, quantidade) FROM stdin;
\.


--
-- Data for Name: infra_log; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_log (id_infra_log, dth_log, texto_log, ip, sta_tipo) FROM stdin;
\.


--
-- Data for Name: infra_navegador_verificacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.infra_navegador_verificacao (tipo_navegador, versao_menor, operador_menor, versao_maior, operador_maior, sin_verificar, sin_compativel) FROM stdin;
Chrome	88	>=	\N	\N	S	S
Edge	88	>=	\N	\N	S	S
Firefox	94	>=	\N	\N	S	S
Safari	14	>=	\N	\N	S	S
\.


--
-- Data for Name: infra_parametro; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_parametro (nome, valor) FROM stdin;
ID_PERFIL_SIP_ADMINISTRADOR_SIP	100000931
ID_PERFIL_SIP_ADMINISTRADOR_SISTEMA	100000933
ID_PERFIL_SIP_BASICO	100000932
ID_PERFIL_SIP_COORDENADOR_PERFIL	100000936
ID_PERFIL_SIP_COORDENADOR_UNIDADE	100000946
ID_SISTEMA_SEI	100000100
ID_SISTEMA_SIP	100000099
ID_USUARIO_SIP	1
SIP_2_FATORES_SUFIXOS_EMAIL_NAO_PERMTIDOS	.jus.br, .gov.br
SIP_2_FATORES_TEMPO_DIAS_LINK_BLOQUEIO	10
SIP_2_FATORES_TEMPO_DIAS_VALIDADE_DISPOSITIVO	45
SIP_2_FATORES_TEMPO_MINUTOS_LINK_HABILITACAO	60
SIP_EMAIL_SISTEMA	naoresponda@dominio.gov.br
SIP_MSG_USUARIO_BLOQUEADO	Usuário bloqueado.
SIP_NUM_HISTORICO_ULTIMOS_ACESSOS	10
SIP_TEMPO_DIAS_HISTORICO_ACESSOS	90
SIP_EMAIL_ADMINISTRADOR	teste@dominio.gov.br
SIP_FORMATAR_SIGLA_USUARIO	1
SIP_FORMATAR_NOME_USUARIO	1
SIP_TIPO_CAPTCHA	5
SIP_2_FATORES_TEMPO_DIAS_PAUSA_USUARIO	3
ID_UNIDADE_TESTE	110000001
SIP_2_FATORES_UNICO_HABILITADO	0
SIP_2_FATORES_UNICO_IDENTIFICACAO	
INFRA_NAVEGADOR_MENSAGEM_AVISO	O seu navegador precisa ser atualizado porque é <b>inseguro ou não suportado</b> pelo sistema.
INFRA_NAVEGADOR_MENSAGEM_AJUDA	<p>Para que o navegador funcione de maneira adequada, é preciso manter o programa sempre atualizado, para tirar melhor proveito de seus recursos e evitar problemas.</p>\n<p>Quando você não atualiza o navegador, ele não acompanha os padrões mais modernos de desenvolvimento da web. Esse atraso em relação aos sites pode causar dois problemas: o primeiro, e mais perigoso, refere-se às <strong>brechas de segurança</strong>, que deixam algumas lacunas nas quais criminosos se aproveitam para roubar senhas, dados e informações. Ainda, um navegador desatualizado tem problemas para ler e entender os códigos de programação e, por consequência, as páginas <strong>demoram a carregar o conteúdo.</strong></p>\n<p>As empresas responsáveis pelos navegadores estão sempre trabalhando para corrigir as falhas de segurança de uma versão. Por isso, é essencial manter sempre a última versão disponível instalada no seu computador ou dispositivo móvel.</p>
SIP_VERSAO	3.2.0
SEI_VERSAO	5.0.0
\.


--
-- Data for Name: infra_regra_auditoria; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_regra_auditoria (id_infra_regra_auditoria, descricao, sin_ativo) FROM stdin;
1	Geral	S
\.


--
-- Data for Name: infra_regra_auditoria_recurso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_regra_auditoria_recurso (id_infra_regra_auditoria, recurso) FROM stdin;
1	sistema_cadastrar
1	sistema_alterar
1	sistema_excluir
1	sistema_desativar
1	tipo_permissao_cadastrar
1	tipo_permissao_alterar
1	tipo_permissao_excluir
1	orgao_cadastrar
1	orgao_alterar
1	orgao_excluir
1	orgao_desativar
1	administrador_sistema_cadastrar
1	administrador_sistema_excluir
1	usuario_cadastrar
1	usuario_alterar
1	usuario_excluir
1	usuario_desativar
1	hierarquia_cadastrar
1	hierarquia_alterar
1	hierarquia_excluir
1	hierarquia_desativar
1	rel_hierarquia_unidade_cadastrar
1	rel_hierarquia_unidade_alterar
1	rel_hierarquia_unidade_excluir
1	rel_hierarquia_unidade_desativar
1	unidade_cadastrar
1	unidade_alterar
1	unidade_excluir
1	unidade_desativar
1	coordenador_unidade_cadastrar
1	coordenador_unidade_excluir
1	recurso_cadastrar
1	recurso_alterar
1	recurso_excluir
1	recurso_desativar
1	perfil_cadastrar
1	perfil_alterar
1	perfil_excluir
1	perfil_desativar
1	perfil_montar
1	coordenador_perfil_cadastrar
1	coordenador_perfil_excluir
1	menu_cadastrar
1	menu_alterar
1	menu_excluir
1	menu_desativar
1	item_menu_cadastrar
1	item_menu_alterar
1	item_menu_excluir
1	item_menu_desativar
1	permissao_cadastrar
1	permissao_alterar
1	permissao_copiar
1	permissao_excluir
1	permissao_delegar
1	sistema_clonar
1	sistema_importar
1	perfil_clonar
1	recurso_gerar
1	usuario_reativar
1	unidade_reativar
1	recurso_reativar
1	rel_hierarquia_unidade_reativar
1	permissao_atribuir_em_bloco
1	hierarquia_clonar
1	login_padrao
1	login_unificado
1	login_remover
1	infra_auditoria_listar
1	regra_auditoria_cadastrar
1	regra_auditoria_alterar
1	regra_auditoria_excluir
1	regra_auditoria_desativar
1	regra_auditoria_reativar
1	servidor_autenticacao_cadastrar
1	servidor_autenticacao_alterar
1	servidor_autenticacao_excluir
1	codigo_acesso_excluir
1	codigo_acesso_desativar
1	codigo_acesso_reativar
1	sistema_gerar_chave_acesso
1	grupo_perfil_cadastrar
1	grupo_perfil_alterar
1	grupo_perfil_excluir
1	grupo_perfil_desativar
1	grupo_perfil_reativar
1	sistema_configurar
1	perfil_sincronizar
1	login_sso
1	servico_sso_cadastrar
1	servico_sso_alterar
1	servico_sso_excluir
1	servico_sso_desativar
1	servico_sso_reativar
1	infra_navegador_configurar
1	assinatura_sso
\.


--
-- Data for Name: infra_sequencia; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.infra_sequencia (nome_tabela, qtd_incremento, num_atual, num_maximo) FROM stdin;
contexto	1	71	999999999
grupo_rede	1	360	999999999
hierarquia	1	100000018	199999999
infra_agendamento_tarefa	1	5	999999999
menu	1	100000079	199999999
orgao	1	0	999999999
servidor_autenticacao	1	2	999999999
sistema	1	100000100	199999999
tipo_permissao	1	3	999999999
unidade	1	110000003	199999999
usuario	1	100000001	199999999
usuario_historico	1	1	999999999
grupo_perfil	1	0	999999999
perfil	1	100000951	199999999
regra_auditoria	1	6	999999999
servico_sso	1	103	999999999
item_menu	1	100005732	199999999
recurso	1	100016051	199999999
\.


--
-- Data for Name: item_menu; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.item_menu (id_menu, id_item_menu, id_sistema, id_menu_pai, id_item_menu_pai, id_recurso, rotulo, descricao, sequencia, sin_ativo, sin_nova_janela, icone) FROM stdin;
100000078	100005399	100000099	\N	\N	\N	Menus	Menus	0	S	N	menu.svg
100000078	100005400	100000099	\N	\N	\N	Infra	\N	999	S	N	infra.svg
100000078	100005401	100000099	\N	\N	\N	Órgãos	Órgãos	0	S	N	orgao.svg
100000078	100005402	100000099	\N	\N	\N	Perfis	Perfis	0	S	N	perfil.svg
100000078	100005403	100000099	\N	\N	\N	Sistemas	Sistemas	0	S	N	sistema.svg
100000078	100005404	100000099	\N	\N	\N	Usuários	Usuários	0	S	N	usuario.svg
100000078	100005405	100000099	\N	\N	\N	Unidades	Unidades	0	S	N	unidade.svg
100000078	100005406	100000099	\N	\N	\N	Recursos	Recursos	0	S	N	recurso.svg
100000078	100005407	100000099	\N	\N	\N	Contextos	Contextos	0	S	N	\N
100000078	100005408	100000099	\N	\N	\N	Permissões	Permissões	0	S	N	permissao.svg
100000078	100005409	100000099	\N	\N	\N	Hierarquias	Hierarquias	0	S	N	hierarquia.svg
100000078	100005410	100000099	100000078	100005400	100014405	Log	\N	0	S	N	\N
100000078	100005411	100000099	100000078	100005399	100014369	Novo	Cadastro de Menu	1	S	N	\N
100000078	100005412	100000099	100000078	100005401	100014312	Novo	Cadastro de Órgão	1	S	N	\N
100000078	100005413	100000099	100000078	100005402	100014359	Novo	Cadastro de Perfil	10	S	N	\N
100000078	100005414	100000099	\N	\N	\N	Grupos de Rede	\N	0	S	N	\N
100000078	100005415	100000099	100000078	100005399	100014370	Listar	Lista de Menus	2	S	N	\N
100000078	100005416	100000099	100000078	100005399	100014375	Montar	\N	30	S	N	\N
100000078	100005417	100000099	100000078	100005401	100014313	Listar	Lista de Órgãos	2	S	N	\N
100000078	100005418	100000099	100000078	100005403	100014301	Novo	Cadastro de Sistema	1	S	N	\N
100000078	100005419	100000099	100000078	100005404	100014327	Novo	Cadastro de Usuário	1	S	N	\N
100000078	100005420	100000099	100000078	100005405	100014344	Nova	Cadastro de Unidade	10	S	N	\N
100000078	100005421	100000099	100000078	100005406	100014353	Novo	Cadastro de Recurso	10	S	N	\N
100000078	100005422	100000099	100000078	100005402	100014360	Listar	Lista de Perfis	20	S	N	\N
100000078	100005423	100000099	100000078	100005402	100014395	Clonar	\N	30	S	N	\N
100000078	100005424	100000099	100000078	100005402	100014365	Montar	Montagem dos Recursos do Perfil	40	S	N	\N
100000078	100005425	100000099	\N	\N	\N	Desenvolvimento	\N	0	S	N	\N
100000078	100005427	100000099	100000078	100005408	100014379	Nova	Cadastro de Permissão	10	S	N	\N
100000078	100005428	100000099	100000078	100005403	100014302	Listar	Lista de Sistemas	2	S	N	\N
100000078	100005429	100000099	100000078	100005403	100014393	Clonar	\N	3	S	N	\N
100000078	100005430	100000099	100000078	100005404	100014328	Listar	Lista de Usuários	2	S	N	\N
100000078	100005431	100000099	100000078	100005405	100014345	Listar	Lista de Unidades	20	S	N	\N
100000078	100005432	100000099	100000078	100005406	100014354	Listar	Lista de Recursos	20	S	N	\N
100000078	100005433	100000099	100000078	100005408	\N	Tipos	Tipos de Permissão	40	S	N	\N
100000078	100005435	100000099	100000078	100005409	100014333	Nova	Cadastro de Hierarquia	1	S	N	\N
100000078	100005436	100000099	100000078	100005400	100014418	Parâmetros	\N	0	S	N	\N
100000078	100005437	100000099	100000078	100005400	100014423	Sequências	\N	0	S	N	\N
100000078	100005438	100000099	100000078	100005403	100014394	Importar	\N	4	S	N	\N
100000078	100005439	100000099	100000078	100005404	100014407	Reativar	\N	12	S	N	\N
100000078	100005440	100000099	100000078	100005405	100014408	Reativar	\N	30	S	N	\N
100000078	100005441	100000099	100000078	100005406	100014409	Reativar	\N	30	S	N	\N
100000078	100005442	100000099	100000078	100005409	100014334	Listar	Lista de Hierarquias	2	S	N	\N
100000078	100005443	100000099	100000078	100005409	100014340	Montar	\N	30	S	N	\N
100000078	100005444	100000099	100000078	100005408	100014381	Pessoais	Lista de Permissões Pessoais	30	S	N	\N
100000078	100005446	100000099	100000078	100005402	100014367	Coordenadores	Lista de Coordenadores de Perfis	50	S	N	\N
100000078	100005449	100000099	100000078	100005405	100014351	Coordenadores	Lista de Coordenadores de Unidades	40	S	N	\N
100000078	100005450	100000099	100000078	100005433	100014307	Novo	Cadastro de Tipo de Permissão	1	S	N	\N
100000078	100005451	100000099	100000078	100005408	100014380	Administradas	Lista de Permissões Administradas	20	S	N	\N
100000078	100005452	100000099	100000078	100005403	100014325	Administradores	Lista de Administradores de Sistemas	4	S	N	\N
100000078	100005453	100000099	100000078	100005433	100014308	Listar	Lista de Tipo de Permissão	2	S	N	\N
100000078	100005454	100000099	100000078	100005406	100014396	Gerar Padrão PHP	\N	40	S	N	\N
100000078	100005456	100000099	100000078	100005408	100014412	Atribuição em Bloco	\N	15	S	N	\N
100000078	100005606	100000099	100000078	100005400	100015187	Auditoria	\N	0	S	N	\N
100000078	100005607	100000099	100000078	100005402	100015188	Reativar	\N	30	S	N	\N
100000078	100005609	100000099	100000078	100005400	100015193	Agendamentos	\N	0	S	N	\N
100000078	100005610	100000099	100000078	100005400	100015198	Comparação de Bancos	\N	0	S	N	\N
100000078	100005611	100000099	\N	\N	100015203	Regras de Auditoria	\N	0	S	N	regra_auditoria.svg
100000078	100005618	100000099	100000078	100005401	100015265	Reativar	\N	30	S	N	\N
100000078	100005637	100000099	\N	\N	100015368	Servidores de Autenticação	\N	0	S	N	servidor_autenticacao.svg
100000078	100005650	100000099	100000078	100005403	100015451	Reativar	\N	2	S	N	\N
100000078	100005651	100000099	100000078	100005409	100015452	Reativar	\N	2	S	N	\N
100000078	100005671	100000099	100000078	100005402	100015552	Comparar	\N	80	S	N	\N
100000078	100005672	100000099	100000078	100005400	100015554	Módulos	\N	0	S	N	\N
100000078	100005673	100000099	100000078	100005400	100015555	Cache em Memória	\N	0	S	N	\N
100000078	100005674	100000099	\N	\N	100015560	Acessos	\N	0	S	N	acesso.svg
100000078	100005675	100000099	\N	\N	100015563	E-mails do Sistema	\N	0	S	N	email.svg
100000079	100005460	100000100	\N	\N	\N	Infra	\N	999	S	N	infra.svg
100000079	100005462	100000100	\N	\N	100014783	Pesquisa	\N	0	S	N	pesquisa.svg
100000079	100005463	100000100	\N	100005471	100015529	Tabela de Assuntos	\N	0	S	N	\N
100000079	100005464	100000100	\N	\N	\N	Relatórios	\N	0	S	N	relatorios.svg
100000079	100005465	100000100	100000079	100005460	100014561	Log	\N	0	S	N	\N
100000079	100005471	100000100	\N	\N	\N	Administração	\N	0	S	N	administracao.svg
100000079	100005472	100000100	\N	100005677	100014815	Internos	\N	0	S	N	\N
100000079	100005476	100000100	\N	\N	100014749	Iniciar Processo	\N	0	S	N	iniciar_processo.svg
100000079	100005477	100000100	\N	100005677	100014820	Reunião	\N	0	S	N	\N
100000079	100005478	100000100	\N	\N	100014898	Retorno Programado	\N	0	S	N	retorno_programado.svg
100000079	100005479	100000100	\N	100005471	\N	Contatos	\N	0	S	N	\N
100000079	100005480	100000100	100000079	100005460	100014746	Parâmetros	\N	0	S	N	\N
100000079	100005481	100000100	100000079	100005460	100014755	Sequências	\N	0	S	N	\N
100000079	100005483	100000100	100000079	100005667	\N	Estados	\N	20	S	N	\N
100000079	100005484	100000100	\N	\N	100014914	Base de Conhecimento	\N	0	S	N	base_conhecimento.svg
100000079	100005485	100000100	\N	100005677	100014812	Assinatura	\N	0	S	N	\N
100000079	100005487	100000100	100000079	100005470	100014623	Novo	\N	10	S	N	\N
100000079	100005488	100000100	\N	\N	100014751	Controle de Processos	\N	0	S	N	controle_processos.svg
100000078	100005676	100000099	\N	\N	100015568	Habilitações 2FA	\N	0	S	N	2fa.svg
100000079	100005467	100000100	\N	100005729	100014925	Arquivamento	\N	10	S	N	\N
100000079	100005474	100000100	\N	100005729	100014926	Desarquivamento	\N	20	S	N	\N
100000079	100005470	100000100	\N	100005729	\N	Localizadores	\N	50	S	N	\N
100000079	100005489	100000100	\N	\N	100014862	Processos Sobrestados	\N	0	S	N	processos_sobrestados.svg
100000079	100005490	100000100	100000079	100005470	\N	Tipos	\N	30	S	N	\N
100000079	100005491	100000100	100000079	100005466	100014947	Unidade	\N	20	S	N	\N
100000079	100005492	100000100	100000079	100005470	100014626	Listar	\N	20	S	N	\N
100000079	100005493	100000100	100000079	100005471	100014799	Órgãos	\N	0	S	N	\N
100000079	100005494	100000100	100000079	100005471	\N	Tipos de Documento	\N	0	S	N	\N
100000079	100005495	100000100	\N	\N	100014934	Acompanhamento Especial	\N	0	S	N	acompanhamento_especial.svg
100000079	100005496	100000100	100000079	100005470	\N	Lugares	\N	40	S	N	\N
100000079	100005497	100000100	100000079	100005667	\N	Cidades	\N	30	S	N	\N
100000079	100005498	100000100	100000079	100005471	\N	Unidades	\N	0	S	N	\N
100000079	100005499	100000100	100000079	100005466	100014907	Ouvidoria	\N	10	S	N	\N
100000079	100005500	100000100	100000079	100005471	\N	Usuários	\N	0	S	N	\N
100000079	100005501	100000100	100000079	100005471	100014857	Novidades	\N	0	S	N	\N
100000079	100005502	100000100	100000079	100005483	100014489	Novo	\N	10	S	N	\N
100000079	100005503	100000100	100000079	100005660	100014539	Contatos	\N	0	S	N	\N
100000079	100005504	100000100	100000079	100005479	\N	Cargos	\N	70	S	N	\N
100000079	100005506	100000100	100000079	100005490	100014594	Novo	\N	10	S	N	\N
100000079	100005507	100000100	100000079	100005483	100014492	Listar	\N	20	S	N	\N
100000079	100005509	100000100	100000079	100005494	100014646	Novo	\N	10	S	N	\N
100000079	100005510	100000100	100000079	100005479	100014515	Reativar	\N	30	S	N	\N
100000079	100005511	100000100	100000079	100005490	100014597	Listar	\N	20	S	N	\N
100000079	100005512	100000100	100000079	100005496	100014610	Novo	\N	10	S	N	\N
100000079	100005513	100000100	100000079	100005497	100014495	Nova	\N	10	S	N	\N
100000079	100005514	100000100	100000079	100005479	100014511	Listar	\N	20	S	N	\N
100000079	100005515	100000100	100000079	100005479	\N	Vocativos	\N	100	S	N	\N
100000079	100005516	100000100	100000079	100005494	100014649	Listar	\N	20	S	N	\N
100000079	100005517	100000100	100000079	100005494	\N	Grupos	\N	40	S	N	\N
100000079	100005519	100000100	100000079	100005490	100014601	Reativar	\N	30	S	N	\N
100000079	100005520	100000100	100000079	100005496	100014613	Listar	\N	20	S	N	\N
100000079	100005521	100000100	100000079	100005497	100014498	Listar	\N	20	S	N	\N
100000079	100005522	100000100	100000079	100005498	100014525	Listar	\N	10	S	N	\N
100000079	100005523	100000100	100000079	100005470	\N	Suportes	\N	50	S	N	\N
100000079	100005524	100000100	100000079	100005479	\N	Tratamentos	\N	90	S	N	\N
100000079	100005525	100000100	100000079	100005500	100014519	Listar	\N	10	S	N	\N
100000079	100005526	100000100	100000079	100005471	\N	Tipos de Processo	\N	0	S	N	\N
100000079	100005527	100000100	100000079	100005494	100014653	Reativar	\N	30	S	N	\N
100000079	100005528	100000100	100000079	100005479	100014508	Novo	\N	10	S	N	\N
100000079	100005529	100000100	100000079	100005496	100014617	Reativar	\N	30	S	N	\N
100000079	100005530	100000100	100000079	100005498	100014529	Reativar	\N	20	S	N	\N
100000079	100005533	100000100	100000079	100005504	100014448	Novo	\N	10	S	N	\N
100000079	100005534	100000100	100000079	100005464	100014801	Contatos Temporários	\N	10	S	N	\N
100000079	100005535	100000100	100000079	100005500	100014577	Reativar	\N	20	S	N	\N
100000079	100005538	100000100	100000079	100005504	100014451	Listar	\N	20	S	N	\N
100000079	100005541	100000100	100000079	100005515	100014464	Novo	\N	10	S	N	\N
100000079	100005542	100000100	100000079	100005517	100014765	Novo	\N	10	S	N	\N
100000079	100005544	100000100	100000079	100005479	\N	Tipos	\N	40	S	N	\N
100000079	100005545	100000100	100000079	100005504	100014455	Reativar	\N	30	S	N	\N
100000079	100005546	100000100	100000079	100005523	100014602	Novo	\N	10	S	N	\N
100000079	100005548	100000100	100000079	100005524	100014472	Novo	\N	10	S	N	\N
100000079	100005549	100000100	100000079	100005515	100014467	Listar	\N	20	S	N	\N
100000079	100005550	100000100	100000079	100005471	100014795	Assinaturas das Unidades	\N	0	S	N	\N
100000079	100005551	100000100	100000079	100005526	100014441	Novo	\N	10	S	N	\N
100000079	100005552	100000100	100000079	100005517	100014768	Listar	\N	20	S	N	\N
100000079	100005553	100000100	100000079	100005523	100014605	Listar	\N	20	S	N	\N
100000079	100005554	100000100	100000079	100005524	100014475	Listar	\N	20	S	N	\N
100000079	100005555	100000100	100000079	100005515	100014471	Reativar	\N	30	S	N	\N
100000079	100005556	100000100	100000079	100005526	100014444	Listar	\N	20	S	N	\N
100000079	100005557	100000100	100000079	100005517	100014772	Reativar	\N	30	S	N	\N
100000079	100005558	100000100	100000079	100005523	100014609	Reativar	\N	30	S	N	\N
100000079	100005559	100000100	100000079	100005524	100014479	Reativar	\N	30	S	N	\N
100000079	100005560	100000100	100000079	100005526	100014480	Reativar	\N	30	S	N	\N
100000079	100005561	100000100	100000079	100005471	100014967	Critérios de Controle Interno	\N	0	S	N	\N
100000079	100005562	100000100	100000079	100005544	100014481	Novo	\N	10	S	N	\N
100000079	100005563	100000100	100000079	100005544	100014484	Listar	\N	20	S	N	\N
100000079	100005565	100000100	100000079	100005544	100014488	Reativar	\N	30	S	N	\N
100000079	100005570	100000100	100000079	100005471	\N	Sistemas	\N	0	S	N	\N
100000079	100005571	100000100	100000079	100005570	100015036	Novo	\N	10	S	N	\N
100000079	100005572	100000100	100000079	100005570	100015039	Listar	\N	20	S	N	\N
100000079	100005573	100000100	100000079	100005570	100015042	Reativar	\N	30	S	N	\N
100000079	100005574	100000100	\N	100005660	100014955	E-Mail	\N	0	S	N	\N
100000079	100005575	100000100	100000079	100005471	\N	Editor	\N	0	S	N	\N
100000079	100005576	100000100	100000079	100005575	\N	Modelos	\N	10	S	N	\N
100000079	100005577	100000100	100000079	100005576	100015043	Novo	\N	10	S	N	\N
100000079	100005578	100000100	100000079	100005576	100015047	Listar	\N	20	S	N	\N
100000079	100005579	100000100	100000079	100005576	100015050	Reativar	\N	30	S	N	\N
100000079	100005580	100000100	100000079	100005576	100015051	Clonar	\N	40	S	N	\N
100000079	100005581	100000100	100000079	100005575	100015056	Estilos	\N	20	S	N	\N
100000079	100005582	100000100	100000079	100005575	100015087	Tarjas	\N	30	S	N	\N
100000079	100005583	100000100	100000079	100005471	\N	Extensões de Arquivos Permitidas	\N	0	S	N	\N
100000079	100005584	100000100	100000079	100005583	100015089	Nova	\N	10	S	N	\N
100000079	100005585	100000100	100000079	100005583	100015092	Listar	\N	20	S	N	\N
100000079	100005586	100000100	100000079	100005583	100015095	Reativar	\N	30	S	N	\N
100000079	100005587	100000100	100000079	100005667	\N	Países	\N	10	S	N	\N
100000079	100005588	100000100	100000079	100005587	100015096	Novo	\N	10	S	N	\N
100000079	100005589	100000100	100000079	100005587	100015100	Listar	\N	20	S	N	\N
100000079	100005590	100000100	100000079	100005659	\N	E-Mail	\N	0	S	N	\N
100000079	100005591	100000100	100000079	100005590	100015102	Novo	\N	10	S	N	\N
100000079	100005592	100000100	100000079	100005590	100015106	Listar	\N	20	S	N	\N
100000079	100005593	100000100	100000079	100005590	100015109	Reativar	\N	30	S	N	\N
100000079	100005594	100000100	100000079	100005494	100015113	Numeração	\N	40	S	N	\N
100000079	100005596	100000100	100000079	100005471	\N	Usuários Externos	\N	0	S	N	\N
100000079	100005597	100000100	100000079	100005596	100015122	Listar	\N	10	S	N	\N
100000079	100005598	100000100	100000079	100005596	100015125	Reativar	\N	20	S	N	\N
100000079	100005599	100000100	\N	\N	100015137	Inspeção Administrativa	\N	0	S	N	inspecao_administrativa.svg
100000079	100005600	100000100	\N	\N	100015159	Favoritos	\N	0	S	N	favoritos.svg
100000079	100005601	100000100	100000079	100005460	100015160	Navegadores	\N	0	S	N	\N
100000079	100005602	100000100	\N	\N	100015166	Textos Padrão	\N	0	S	N	texto_padrao.svg
100000079	100005604	100000100	100000079	100005460	100015169	Indexação	\N	0	S	N	\N
100000079	100005605	100000100	100000079	100005471	100015172	E-mails do Sistema	\N	0	S	N	\N
100000079	100005612	100000100	100000079	100005460	100015235	Auditoria	\N	0	S	N	\N
100000079	100005613	100000100	100000079	100005460	100015239	Agendamentos	\N	0	S	N	\N
100000079	100005614	100000100	100000079	100005460	100015244	Comparação de Bancos	\N	0	S	N	\N
100000079	100005619	100000100	100000079	100005471	100015269	Histórico	\N	0	S	N	\N
100000079	100005620	100000100	\N	\N	100015273	Acompanhamento Ouvidoria	\N	0	S	N	\N
100000079	100005621	100000100	100000079	100005471	\N	Veículos de Publicação	\N	0	S	N	\N
100000079	100005623	100000100	100000079	100005471	100015289	Feriados	\N	0	S	N	\N
100000079	100005624	100000100	100000079	100005621	100015290	Novo	\N	10	S	N	\N
100000079	100005625	100000100	100000079	100005621	100015291	Listar	\N	20	S	N	\N
100000079	100005626	100000100	100000079	100005621	100015295	Reativar	\N	30	S	N	\N
100000079	100005627	100000100	100000079	100005621	100015302	Imprensa Nacional	\N	40	S	N	\N
100000079	100005628	100000100	100000079	100005471	\N	Tipos de Conferência	\N	0	S	N	\N
100000079	100005629	100000100	100000079	100005628	100015345	Novo	\N	10	S	N	\N
100000079	100005630	100000100	100000079	100005628	100015348	Listar	\N	20	S	N	\N
100000079	100005631	100000100	100000079	100005628	100015351	Reativar	\N	30	S	N	\N
100000079	100005632	100000100	100000079	100005466	100015352	Desempenho de Processos	\N	30	S	N	\N
100000079	100005633	100000100	100000079	100005471	\N	Hipóteses Legais	\N	0	S	N	\N
100000079	100005634	100000100	100000079	100005633	100015355	Nova	\N	10	S	N	\N
100000079	100005635	100000100	100000079	100005633	100015359	Listar	\N	20	S	N	\N
100000079	100005636	100000100	100000079	100005633	100015362	Reativar	\N	30	S	N	\N
100000079	100005639	100000100	100000079	100005575	\N	Formatos de Imagem Permitidos	\N	40	S	N	\N
100000079	100005640	100000100	100000079	100005639	100015380	Novo	\N	10	S	N	\N
100000079	100005641	100000100	100000079	100005639	100015382	Listar	\N	20	S	N	\N
100000079	100005642	100000100	100000079	100005639	100015386	Reativar	\N	30	S	N	\N
100000079	100005643	100000100	\N	100005660	100015405	Envio	\N	0	S	N	\N
100000079	100005644	100000100	100000079	100005659	\N	Envio	\N	0	S	N	\N
100000079	100005645	100000100	100000079	100005644	100015409	Novo	\N	10	S	N	\N
100000079	100005646	100000100	100000079	100005644	100015411	Listar	\N	20	S	N	\N
100000079	100005647	100000100	100000079	100005644	100015416	Reativar	\N	30	S	N	\N
100000079	100005648	100000100	100000079	100005471	100015426	Pontos de Controle	\N	0	S	N	\N
100000079	100005649	100000100	\N	\N	100015450	Pontos de Controle	\N	0	S	N	pontos_controle.svg
100000079	100005652	100000100	100000079	100005464	100015455	Acervo de Sigilosos da Unidade	\N	0	S	N	\N
100000079	100005653	100000100	100000079	100005460	100015456	Módulos	\N	0	S	N	\N
100000079	100005654	100000100	100000079	100005460	100015459	Cache em Memória	\N	0	S	N	\N
100000079	100005655	100000100	100000079	100005471	\N	Tipos de Formulários	\N	0	S	N	\N
100000079	100005656	100000100	100000079	100005655	100015472	Listar	\N	0	S	N	\N
100000079	100005657	100000100	100000079	100005655	100015474	Novo	\N	0	S	N	\N
100000079	100005658	100000100	100000079	100005655	100015478	Reativar	\N	0	S	N	\N
100000079	100005659	100000100	100000079	100005471	\N	Grupos Institucionais	\N	0	S	N	\N
100000079	100005660	100000100	\N	\N	\N	Grupos	\N	0	S	N	grupos.svg
100000079	100005661	100000100	\N	\N	100014511	Contatos	\N	0	S	N	contatos.svg
100000079	100005662	100000100	100000079	100005659	100014539	Contatos	\N	0	S	N	\N
100000079	100005663	100000100	100000079	100005662	100015486	Novo	\N	10	S	N	\N
100000079	100005664	100000100	100000079	100005662	100015489	Reativar	\N	30	S	N	\N
100000079	100005665	100000100	100000079	100005662	100015491	Listar	\N	20	S	N	\N
100000079	100005666	100000100	100000079	100005570	100015493	Monitoramento de Serviços	\N	40	S	N	\N
100000079	100005667	100000100	100000079	100005471	\N	Países, Estados e Cidades	\N	0	S	N	\N
100000079	100005668	100000100	\N	\N	100015502	Marcadores	\N	0	S	N	marcadores.svg
100000079	100005669	100000100	100000079	100005466	100015542	Arquivamento	\N	0	S	N	\N
100000079	100005670	100000100	100000079	100005498	100015549	Migrar Dados	\N	30	S	N	\N
100000079	100005677	100000100	\N	\N	\N	Blocos	\N	0	S	N	blocos.svg
100000079	100005679	100000100	100000079	100005479	\N	Títulos	\N	90	S	N	\N
100000079	100005680	100000100	100000079	100005679	100015625	Listar	\N	2	S	N	\N
100000079	100005681	100000100	100000079	100005679	100015627	Novo	\N	1	S	N	\N
100000079	100005682	100000100	100000079	100005679	100015631	Reativar	\N	3	S	N	\N
100000079	100005684	100000100	100000079	100005479	\N	Categorias	\N	100	S	N	\N
100000079	100005685	100000100	100000079	100005684	100015649	Listar	\N	20	S	N	\N
100000079	100005686	100000100	100000079	100005684	100015650	Nova	\N	10	S	N	\N
100000079	100005687	100000100	100000079	100005684	100015654	Reativar	\N	30	S	N	\N
100000079	100005689	100000100	100000079	100005660	100015760	Federação	\N	0	S	N	\N
100000079	100005690	100000100	100000079	100005659	\N	Federação	\N	0	S	N	\N
100000079	100005691	100000100	100000079	100005690	100015762	Novo	\N	10	S	N	\N
100000079	100005692	100000100	100000079	100005690	100015766	Listar	\N	20	S	N	\N
100000079	100005693	100000100	100000079	100005690	100015768	Reativar	\N	30	S	N	\N
100000079	100005694	100000100	100000079	100005460	100015790	Replicações Federação	\N	0	S	N	\N
100000079	100005695	100000100	100000079	100005471	100015793	Acervo Global de Sigilosos	\N	0	S	N	\N
100000078	100005696	100000099	100000078	100005400	100015820	Captcha	\N	0	S	N	\N
100000078	100005697	100000099	100000078	100005400	100015821	Configuração do Sistema	\N	0	S	N	\N
100000079	100005466	100000100	\N	\N	\N	Estatísticas	\N	0	S	N	estatisticas.svg
100000079	100005698	100000100	100000079	100005460	100015828	Captcha	\N	0	S	N	\N
100000079	100005699	100000100	100000079	100005460	100015829	Configuração do Sistema	\N	0	S	N	\N
100000079	100005700	100000100	100000079	100005471	100015835	Avisos	\N	0	S	N	\N
100000079	100005701	100000100	100000079	100005471	100015845	Planos de Trabalho	\N	0	S	N	\N
100000079	100005702	100000100	100000079	100005471	\N	Federação	\N	0	S	N	\N
100000079	100005703	100000100	100000079	100005702	100015682	Instalações	\N	0	S	N	\N
100000079	100005704	100000100	100000079	100005702	100015898	Processos	\N	0	S	N	\N
100000079	100005705	100000100	\N	\N	100015906	Reabertura Programada	\N	0	S	N	reabertura_programada.svg
100000079	100005706	100000100	100000079	100005471	\N	CPAD	\N	0	S	N	\N
100000079	100005714	100000100	100000079	100005464	100015973	Atividade na Unidade	\N	0	S	N	\N
100000079	100005715	100000100	100000079	100005471	\N	Tipos de Prioridade	\N	0	S	N	\N
100000079	100005716	100000100	100000079	100005715	100015975	Listar	\N	20	S	N	\N
100000079	100005717	100000100	100000079	100005715	100015977	Novo	\N	10	S	N	\N
100000079	100005718	100000100	100000079	100005715	100015981	Reativar	\N	30	S	N	\N
100000078	100005719	100000099	100000078	100005402	100015987	Sincronizar	\N	90	S	N	\N
100000078	100005720	100000099	\N	\N	\N	Login Único SSO	\N	0	S	N	sso.svg
100000078	100005721	100000099	100000078	100005720	100015990	Autenticações	\N	0	S	N	\N
100000078	100005722	100000099	100000078	100005720	100015993	Serviços	\N	0	S	N	\N
100000079	100005713	100000100	\N	100005729	100015961	Documentos para Eliminação	\N	40	S	N	\N
100000079	100005678	100000100	\N	\N	100015592	Painel de Controle	\N	0	S	N	painel_controle.svg
100000079	100005683	100000100	\N	\N	100015641	Controle de Prazos	\N	0	S	N	controle_prazo.svg
100000078	100005723	100000099	100000078	100005400	100016006	Erros do PHP	\N	0	S	N	\N
100000078	100005724	100000099	100000078	100005400	100016009	Configuração de Navegadores	\N	0	S	N	\N
100000079	100005725	100000100	100000079	100005460	100016021	Erros do PHP	\N	0	S	N	\N
100000079	100005726	100000100	\N	\N	100016026	Lixeira	\N	0	S	N	lixeira.svg
100000079	100005727	100000100	100000079	100005596	100016043	Termos de Uso	\N	30	S	N	\N
100000079	100005729	100000100	\N	\N	\N	Arquivo	\N	0	S	N	arquivo.svg
100000079	100005712	100000100	\N	100005729	100015954	Editais de Eliminação	\N	30	S	N	\N
100000079	100005730	100000100	\N	\N	\N	Avaliação Documental	\N	0	S	N	avaliacao_documental.svg
100000079	100005731	100000100	100000079	100005730	100015935	Avaliação	\N	0	S	N	\N
100000079	100005732	100000100	100000079	100005730	100015940	Revisão	\N	0	S	N	\N
100000079	100005728	100000100	100000079	100005460	100016043	Termo de Uso	\N	0	S	N	\N
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.login (id_login, id_sistema, id_usuario, id_usuario_emulador, dth_login, hash_interno, hash_usuario, hash_agente, http_client_ip, remote_addr, http_x_forwarded_for, sta_login, user_agent, id_dispositivo_acesso, id_codigo_acesso, id_login_sso) FROM stdin;
\.


--
-- Data for Name: login_sso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_sso (id_login_sso, id_sistema, id_servico_sso, cpf, nome, nome_social, email, telefone, sta_login_sso, dth_login_sso, origem, destino_login, destino_logout, http_client_ip, http_x_forwarded_for, remote_addr, user_agent, sta_nivel_confiabilidade, sta_tipo_acesso, sta_erro, state, sin_certificado_digital, sin_2_fatores) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.menu (id_menu, id_sistema, nome, descricao, sin_ativo) FROM stdin;
100000078	100000099	Principal	Menu do Sistema de Permissões	S
100000079	100000100	Principal	\N	S
\.


--
-- Data for Name: orgao; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.orgao (id_orgao, sigla, descricao, sin_ativo, sin_autenticar, ordem) FROM stdin;
0	ABC	Orgao Processo Eletronico - Postgres	S	N	0
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.perfil (id_perfil, id_sistema, nome, descricao, sin_coordenado, sin_ativo, sin_2_fatores) FROM stdin;
100000931	100000099	Administrador SIP	Administrador	N	S	N
100000932	100000099	Básico	Básico	N	S	N
100000933	100000099	Administrador de Sistema	\N	N	S	N
100000935	100000099	Administrador de Hierarquia	\N	N	S	N
100000936	100000099	Coordenador de Perfil	Básico	N	S	N
100000937	100000099	Cadastro de Usuários e Unidades	\N	N	S	N
100000938	100000100	Básico	Acesso aos recursos básicos para qualquer usuário no SEI. Pode ser combinado com outros perfis, mas sempre tem que ser concedido para qualquer outro perfil funcionar corretamente.	N	S	N
100000939	100000100	Administrador	Acesso aos recursos de gestão de tabelas básicas da instituição, relatórios de gerenciamento e configurações gerais do SEI.	N	S	N
100000940	100000100	Informática	Acesso aos recursos específicos para quem trabalha com suporte de informática do SEI.	N	S	N
100000941	100000100	Arquivamento	Acesso aos recursos específicos para quem trabalha com arquivamento de vias físicas de documentos.	N	S	N
100000944	100000100	Ouvidoria	Acesso aos recursos específicos para quem trabalha na Ouvidoria do órgão.	N	S	N
100000945	100000100	Inspeção	Acesso aos recursos específicos para quem trabalha com inspeção administrativa no órgão.	N	S	N
100000946	100000099	Coordenador de Unidade	\N	N	S	N
100000949	100000100	Acervo de Sigilosos da Unidade	\N	N	S	N
100000951	100000100	Colaborador (Básico sem Assinatura)	Acesso aos recursos básicos para qualquer usuário no SEI. Pode ser combinado com outros perfis, mas sempre tem que ser concedido para qualquer outro perfil funcionar corretamente.	N	S	N
100000950	100000100	Avaliação Documental	\N	N	S	N
\.


--
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.permissao (id_perfil, id_sistema, id_usuario, id_unidade, id_tipo_permissao, dta_inicio, dta_fim, sin_subunidades) FROM stdin;
100000931	100000099	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000932	100000099	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000933	100000099	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000938	100000100	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000939	100000100	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000940	100000100	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000941	100000100	100000001	110000000	1	2016-11-28 00:00:00	\N	N
100000945	100000100	100000001	110000000	1	2016-11-28 00:00:00	\N	N
\.


--
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.recurso (id_sistema, id_recurso, nome, descricao, caminho, sin_ativo) FROM stdin;
100000099	100014301	sistema_cadastrar	Cadastro de Sistema	controlador.php?acao=sistema_cadastrar	S
100000099	100014302	sistema_listar	Lista de Sistemas	controlador.php?acao=sistema_listar	S
100000099	100014303	sistema_consultar	Consulta de Sistema	controlador.php?acao=sistema_consultar	S
100000099	100014304	sistema_alterar	Alteração de Sistema	controlador.php?acao=sistema_alterar	S
100000099	100014305	sistema_excluir	Exclusão de Sistema	controlador.php?acao=sistema_excluir	S
100000099	100014306	sistema_desativar	Desativação de Sistema	controlador.php?acao=sistema_desativar	S
100000099	100014307	tipo_permissao_cadastrar	Cadastro de Tipo de Permissão	controlador.php?acao=tipo_permissao_cadastrar	S
100000099	100014308	tipo_permissao_listar	Lista de Tipos de Permissão	controlador.php?acao=tipo_permissao_listar	S
100000099	100014309	tipo_permissao_consultar	Consulta de Tipo de Permissão	controlador.php?acao=tipo_permissao_consultar	S
100000099	100014310	tipo_permissao_alterar	Alteração de Tipo de Permissão	controlador.php?acao=tipo_permissao_alterar	S
100000099	100014311	tipo_permissao_excluir	Exclusão de Tipo de Permissão	controlador.php?acao=tipo_permissao_excluir	S
100000099	100014312	orgao_cadastrar	Cadastro de Órgão	controlador.php?acao=orgao_cadastrar	S
100000099	100014313	orgao_listar	Lista de Órgãos	controlador.php?acao=orgao_listar	S
100000099	100014314	orgao_consultar	Consulta de Órgão	controlador.php?acao=orgao_consultar	S
100000099	100014315	orgao_alterar	Alteração de Órgão	controlador.php?acao=orgao_alterar	S
100000099	100014316	orgao_excluir	Exclusão de Órgão	controlador.php?acao=orgao_excluir	S
100000099	100014317	orgao_desativar	Desativação de Órgão	controlador.php?acao=orgao_desativar	S
100000099	100014324	administrador_sistema_cadastrar	Cadastro de Administrador de Sistema	controlador.php?acao=administrador_sistema_cadastrar	S
100000099	100014325	administrador_sistema_listar	Lista de Administradores de Sistemas	controlador.php?acao=administrador_sistema_listar	S
100000099	100014326	administrador_sistema_excluir	Exclusão de Administrador de Sistema	controlador.php?acao=administrador_sistema_excluir	S
100000099	100014327	usuario_cadastrar	Cadastro de Usuário	controlador.php?acao=usuario_cadastrar	S
100000099	100014328	usuario_listar	Lista de Usuários	controlador.php?acao=usuario_listar	S
100000099	100014329	usuario_consultar	Consulta de Usuário	controlador.php?acao=usuario_consultar	S
100000099	100014330	usuario_alterar	Alteração de Usuário	controlador.php?acao=usuario_alterar	S
100000099	100014331	usuario_excluir	Exclusão de Usuário	controlador.php?acao=usuario_excluir	S
100000099	100014332	usuario_desativar	Desativação de Usuário	controlador.php?acao=usuario_desativar	S
100000099	100014333	hierarquia_cadastrar	Cadastro de Hierarquia	controlador.php?acao=hierarquia_cadastrar	S
100000099	100014334	hierarquia_listar	Lista de Hierarquias	controlador.php?acao=hierarquia_listar	S
100000099	100014335	hierarquia_consultar	Consulta de Hierarquia	controlador.php?acao=hierarquia_consultar	S
100000099	100014336	hierarquia_alterar	Alteração de Hierarquia	controlador.php?acao=hierarquia_alterar	S
100000099	100014337	hierarquia_excluir	Exclusão de Hierarquia	controlador.php?acao=hierarquia_excluir	S
100000099	100014338	hierarquia_desativar	Desativação de Hierarquia	controlador.php?acao=hierarquia_desativar	S
100000099	100014339	rel_hierarquia_unidade_cadastrar	Cadastro de Unidades na Hierarquia	controlador.php?acao=rel_hierarquia_unidade_cadastrar	S
100000099	100014340	rel_hierarquia_unidade_listar	Lista de Unidades da Hierarquia	controlador.php?acao=rel_hierarquia_unidade_listar	S
100000099	100014341	rel_hierarquia_unidade_alterar	Alteração de Unidade na Hierarquia	controlador.php?acao=rel_hierarquia_unidade_alterar	S
100000099	100014342	rel_hierarquia_unidade_excluir	Exclusão de Unidade na Hierarquia	controlador.php?acao=rel_hierarquia_unidade_excluir	S
100000099	100014343	rel_hierarquia_unidade_desativar	Desativação de Unidade na Hierarquia	controlador.php?acao=rel_hierarquia_unidade_desativar	S
100000099	100014344	unidade_cadastrar	Cadastro de Unidade	controlador.php?acao=unidade_cadastrar	S
100000099	100014345	unidade_listar	Lista de Unidades	controlador.php?acao=unidade_listar	S
100000099	100014346	unidade_consultar	Consulta de Unidade	controlador.php?acao=unidade_consutar	S
100000099	100014347	unidade_alterar	Alteração de Unidade	controlador.php?acao=unidade_alterar	S
100000099	100014348	unidade_excluir	Exclusão de Unidade	controlador.php?acao=unidade_excluir	S
100000099	100014349	unidade_desativar	Desativação de Unidade	controlador.php?acao=unidade_desativar	S
100000099	100014350	coordenador_unidade_cadastrar	Cadastro de Coordenador de Unidade	controlador.php?acao=coordenador_unidade_cadastrar	S
100000099	100014351	coordenador_unidade_listar	Lista de Coordenadores de Unidades	controlador.php?acao=coordenador_unidade_listar	S
100000099	100014352	coordenador_unidade_excluir	Exclusão de Coordenador de Unidade	controlador.php?acao=coordenador_unidade_excluir	S
100000099	100014353	recurso_cadastrar	Cadastro de Recurso	controlador.php?acao=recurso_cadastrar	S
100000099	100014354	recurso_listar	Lista de Recursos	controlador.php?acao=recurso_listar	S
100000099	100014355	recurso_consultar	Consulta de Recurso	controlador.php?acao=recurso_consultar	S
100000099	100014356	recurso_alterar	Alteração de Recurso	controlador.php?acao=recurso_alterar	S
100000099	100014357	recurso_excluir	Exclusão de Recurso	controlador.php?acao=recurso_excluir	S
100000099	100014358	recurso_desativar	Desativação de Recurso	controlador.php?acao=recurso_desativar	S
100000099	100014359	perfil_cadastrar	Cadastro de Perfil	controlador.php?acao=perfil_cadastrar	S
100000099	100014360	perfil_listar	Lista de Perfis	controlador.php?acao=perfil_listar	S
100000099	100014361	perfil_consultar	Consulta de Perfil	controlador.php?acao=perfil_consultar	S
100000099	100014362	perfil_alterar	Alteração de Perfil	controlador.php?acao=perfil_alterar	S
100000099	100014363	perfil_excluir	Exclusão de Perfil	controlador.php?acao=perfil_excluir	S
100000099	100014364	perfil_desativar	Desativação de Perfil	controlador.php?acao=perfil_desativar	S
100000099	100014365	perfil_montar	Montagem de Perfil	controlador.php?acao=perfil_montar	S
100000099	100014366	coordenador_perfil_cadastrar	Cadastro de Coordenador de Perfil	controlador.php?acao=coordenador_perfil_cadastrar	S
100000099	100014367	coordenador_perfil_listar	Lista de Coordenadores de Perfis	controlador.php?acao=coordenador_perfil_listar	S
100000099	100014368	coordenador_perfil_excluir	Exclusão de Coordenador de Perfil	controlador.php?acao=coordenador_perfil_excluir	S
100000099	100014369	menu_cadastrar	Cadastro de Menu	controlador.php?acao=menu_cadastrar	S
100000099	100014370	menu_listar	Lista de Menus	controlador.php?acao=menu_listar	S
100000099	100014371	menu_alterar	Alteração de Menu	controlador.php?acao=menu_alterar	S
100000099	100014372	menu_excluir	Exclusão de Menu	controlador.php?acao=menu_excluir	S
100000099	100014373	menu_desativar	Desativação de Menu	controlador.php?acao=menu_desativar	S
100000099	100014374	item_menu_cadastrar	Cadastro de Item de Menu	controlador.php?acao=item_menu_cadastrar	S
100000099	100014375	item_menu_listar	Lista de Itens de Menu	controlador.php?acao=item_menu_listar	S
100000099	100014376	item_menu_alterar	Alteração de Item de Menu	controlador.php?acao=item_menu_alterar	S
100000099	100014377	item_menu_excluir	Exclusão de Item de Menu	controlador.php?acao=item_menu_excluir	S
100000099	100014378	item_menu_desativar	Desativação de Item de Menu	controlador.php?acao=item_menu_desativar	S
100000099	100014379	permissao_cadastrar	Cadastro de Permissão	controlador.php?acao=permissao_cadastrar	S
100000099	100014380	permissao_listar_administradas	Lista de Permissões Administradas	controlador.php?acao=permissao_listar_administradas	S
100000099	100014381	permissao_listar_pessoais	Lista de Permissões Pessoais	controlador.php?acao=permissao_listar_pessoais	S
100000099	100014382	permissao_consultar	Consulta de Permissão	controlador.php?acao=permissao_consultar	S
100000099	100014383	permissao_alterar	Alteração de Permissão	controlador.php?acao=permissao_alterar	S
100000099	100014384	permissao_copiar	Cópia de Permissões	controlador.php?acao=permissao_copiar	S
100000099	100014385	permissao_excluir	Exclusão de Permissão	controlador.php?acao=permissao_excluir	S
100000099	100014386	permissao_delegar	Delegação de Permissões	controlador.php?acao=permissao_delegar	S
100000099	100014387	rel_perfil_recurso_cadastrar	Cadastro de Recurso de Perfil	controlador.php?acao=rel_perfil_recurso_cadastrar	S
100000099	100014388	rel_perfil_recurso_listar	Lista de Recursos de Perfil	controlador.php?acao=rel_perfil_recurso_listar	S
100000099	100014389	rel_perfil_recurso_excluir	Exclusão de Recurso de Perfil	controlador.php?acao=rel_perfil_recurso_excluir	S
100000099	100014390	rel_perfil_item_menu_cadastrar	Cadastro de Item de Menu em Perfil	controlador.php?acao=rel_perfil_item_menu_cadastrar	S
100000099	100014391	rel_perfil_item_menu_listar	Lista de Itens de Menu em Perfil	controlador.php?acao=rel_perfil_item_menu_listar	S
100000099	100014392	rel_perfil_item_menu_excluir	Exclusão de Item de Menu em Perfil	controlador.php?acao=rel_perfil_item_menu_excluir	S
100000099	100014393	sistema_clonar	\N	controlador.php?acao=sistema_clonar	S
100000099	100014394	sistema_importar	\N	controlador.php?acao=sistema_importar	S
100000099	100014395	perfil_clonar	\N	controlador.php?acao=perfil_clonar	S
100000099	100014396	recurso_gerar	\N	controlador.php?acao=recurso_gerar	S
100000099	100014405	infra_log_listar	\N	controlador.php?acao=infra_log_listar	S
100000099	100014406	infra_log_excluir	\N	controlador.php?acao=infra_log_excluir	S
100000099	100014407	usuario_reativar	\N	controlador.php?acao=usuario_reativar	S
100000099	100014408	unidade_reativar	\N	controlador.php?acao=unidade_reativar	S
100000099	100014409	recurso_reativar	\N	controlador.php?acao=recurso_reativar	S
100000099	100014410	rel_hierarquia_unidade_reativar	\N	controlador.php?acao=rel_hierarquia_unidade_reativar	S
100000099	100014412	permissao_atribuir_em_bloco	\N	controlador.php?acao=permissao_atribuir_em_bloco	S
100000099	100014414	hierarquia_clonar	\N	controlador.php?acao=hierarquia_clonar	S
100000099	100014415	infra_parametro_cadastrar	\N	controlador.php?acao=infra_parametro_cadastrar	S
100000099	100014416	infra_parametro_alterar	\N	controlador.php?acao=infra_parametro_alterar	S
100000099	100014417	infra_parametro_consultar	\N	controlador.php?acao=infra_parametro_consultar	S
100000099	100014418	infra_parametro_listar	\N	controlador.php?acao=infra_parametro_listar	S
100000099	100014419	infra_parametro_excluir	\N	controlador.php?acao=infra_parametro_excluir	S
100000099	100014420	infra_sequencia_cadastrar	\N	controlador.php?acao=infra_sequencia_cadastrar	S
100000099	100014421	infra_sequencia_alterar	\N	controlador.php?acao=infra_sequencia_alterar	S
100000099	100014422	infra_sequencia_consultar	\N	controlador.php?acao=infra_sequencia_consultar	S
100000099	100014423	infra_sequencia_listar	\N	controlador.php?acao=infra_sequencia_listar	S
100000099	100014424	infra_sequencia_excluir	\N	controlador.php?acao=infra_sequencia_excluir	S
100000099	100015173	login_padrao	\N	controlador.php?acao=login_padrao	S
100000099	100015174	login_unificado	\N	controlador.php?acao=login_unificado	S
100000099	100015175	login_remover	\N	controlador.php?acao=login_remover	S
100000099	100015176	infra_regra_auditoria_cadastrar	\N	controlador.php?acao=infra_regra_auditoria_cadastrar	S
100000099	100015177	infra_regra_auditoria_alterar	\N	controlador.php?acao=infra_regra_auditoria_alterar	S
100000099	100015178	infra_regra_auditoria_consultar	\N	controlador.php?acao=infra_regra_auditoria_consultar	S
100000099	100015179	infra_regra_auditoria_listar	\N	controlador.php?acao=infra_regra_auditoria_listar	S
100000099	100015180	infra_regra_auditoria_excluir	\N	controlador.php?acao=infra_regra_auditoria_excluir	S
100000099	100015181	infra_regra_auditoria_desativar	\N	controlador.php?acao=infra_regra_auditoria_desativar	S
100000099	100015182	infra_regra_auditoria_reativar	\N	controlador.php?acao=infra_regra_auditoria_reativar	S
100000099	100015183	infra_regra_auditoria_recurso_cadastrar	\N	controlador.php?acao=infra_regra_auditoria_recurso_cadastrar	S
100000099	100015184	infra_regra_auditoria_recurso_listar	\N	controlador.php?acao=infra_regra_auditoria_recurso_listar	S
100000099	100015185	infra_regra_auditoria_recurso_excluir	\N	controlador.php?acao=infra_regra_auditoria_recurso_excluir	S
100000099	100015186	infra_auditoria_cadastrar	\N	controlador.php?acao=infra_auditoria_cadastrar	S
100000099	100015187	infra_auditoria_listar	\N	controlador.php?acao=infra_auditoria_listar	S
100000099	100015188	perfil_reativar	\N	controlador.php?acao=perfil_reativar	S
100000099	100015190	infra_agendamento_tarefa_cadastrar	\N	controlador.php?acao=infra_agendamento_tarefa_cadastrar	S
100000099	100015191	infra_agendamento_tarefa_alterar	\N	controlador.php?acao=infra_agendamento_tarefa_alterar	S
100000099	100015192	infra_agendamento_tarefa_consultar	\N	controlador.php?acao=infra_agendamento_tarefa_consultar	S
100000099	100015193	infra_agendamento_tarefa_listar	\N	controlador.php?acao=infra_agendamento_tarefa_listar	S
100000099	100015194	infra_agendamento_tarefa_excluir	\N	controlador.php?acao=infra_agendamento_tarefa_excluir	S
100000099	100015195	infra_agendamento_tarefa_executar	\N	controlador.php?acao=infra_agendamento_tarefa_executar	S
100000099	100015196	infra_agendamento_tarefa_desativar	\N	controlador.php?acao=infra_agendamento_tarefa_desativar	S
100000099	100015197	infra_agendamento_tarefa_reativar	\N	controlador.php?acao=infra_agendamento_tarefa_reativar	S
100000099	100015198	infra_banco_comparar	\N	controlador.php?acao=infra_banco_comparar	S
100000099	100015199	recurso_selecionar_auditoria	\N	controlador.php?acao=recurso_selecionar_auditoria	S
100000099	100015200	regra_auditoria_cadastrar	\N	controlador.php?acao=regra_auditoria_cadastrar	S
100000099	100015201	regra_auditoria_alterar	\N	controlador.php?acao=regra_auditoria_alterar	S
100000099	100015202	regra_auditoria_consultar	\N	controlador.php?acao=regra_auditoria_consultar	S
100000099	100015203	regra_auditoria_listar	\N	controlador.php?acao=regra_auditoria_listar	S
100000099	100015204	regra_auditoria_excluir	\N	controlador.php?acao=regra_auditoria_excluir	S
100000099	100015205	regra_auditoria_desativar	\N	controlador.php?acao=regra_auditoria_desativar	S
100000099	100015206	regra_auditoria_reativar	\N	controlador.php?acao=regra_auditoria_reativar	S
100000099	100015207	rel_regra_auditoria_recurso_cadastrar	\N	controlador.php?acao=rel_regra_auditoria_recurso_cadastrar	S
100000099	100015208	rel_regra_auditoria_recurso_consultar	\N	controlador.php?acao=rel_regra_auditoria_recurso_consultar	S
100000099	100015209	rel_regra_auditoria_recurso_excluir	\N	controlador.php?acao=rel_regra_auditoria_recurso_excluir	S
100000099	100015210	rel_regra_auditoria_recurso_listar	\N	controlador.php?acao=rel_regra_auditoria_recurso_listar	S
100000099	100015259	sistema_upload	\N	controlador.php?acao=sistema_upload	S
100000099	100015265	orgao_reativar	\N	controlador.php?acao=orgao_reativar	S
100000099	100015363	servidor_autenticacao_cadastrar	\N	controlador.php?acao=servidor_autenticacao_cadastrar	S
100000099	100015364	servidor_autenticacao_alterar	\N	controlador.php?acao=servidor_autenticacao_alterar	S
100000099	100015365	servidor_autenticacao_excluir	\N	controlador.php?acao=servidor_autenticacao_excluir	S
100000099	100015366	servidor_autenticacao_selecionar	\N	controlador.php?acao=servidor_autenticacao_selecionar	S
100000099	100015367	servidor_autenticacao_consultar	\N	controlador.php?acao=servidor_autenticacao_consultar	S
100000099	100015368	servidor_autenticacao_listar	\N	controlador.php?acao=servidor_autenticacao_listar	S
100000099	100015369	rel_orgao_autenticacao_cadastrar	\N	controlador.php?acao=rel_orgao_autenticacao_cadastrar	S
100000099	100015370	rel_orgao_autenticacao_excluir	\N	controlador.php?acao=rel_orgao_autenticacao_excluir	S
100000099	100015371	rel_orgao_autenticacao_listar	\N	controlador.php?acao=rel_orgao_autenticacao_listar	S
100000099	100015451	sistema_reativar	\N	controlador.php?acao=sistema_reativar	S
100000099	100015452	hierarquia_reativar	\N	controlador.php?acao=hierarquia_reativar	S
100000099	100015551	perfil_importar	\N	controlador.php?acao=perfil_importar	S
100000099	100015552	perfil_comparar	\N	controlador.php?acao=perfil_comparar	S
100000099	100015554	modulo_listar	\N	controlador.php?acao=modulo_listar	S
100000099	100015555	infra_atributo_cache_listar	\N	controlador.php?acao=infra_atributo_cache_listar	S
100000099	100015556	infra_atributo_cache_excluir	\N	controlador.php?acao=infra_atributo_cache_excluir	S
100000099	100015557	infra_atributo_cache_consultar	\N	controlador.php?acao=infra_atributo_cache_consultar	S
100000099	100015558	infra_acesso_usuario_listar	\N	controlador.php?acao=infra_acesso_usuario_listar	S
100000099	100015559	infra_trocar_unidade	\N	controlador.php?acao=infra_trocar_unidade	S
100000099	100015560	login_listar	\N	controlador.php?acao=login_listar	S
100000099	100015561	login_consultar	\N	controlador.php?acao=login_consultar	S
100000099	100015562	email_sistema_alterar	\N	controlador.php?acao=email_sistema_alterar	S
100000099	100015563	email_sistema_listar	\N	controlador.php?acao=email_sistema_listar	S
100000099	100015564	email_sistema_consultar	\N	controlador.php?acao=email_sistema_consultar	S
100000099	100015565	email_sistema_desativar	\N	controlador.php?acao=email_sistema_desativar	S
100000099	100015566	email_sistema_reativar	\N	controlador.php?acao=email_sistema_reativar	S
100000099	100015567	ajuda_variaveis_email_sistema	\N	controlador.php?acao=ajuda_variaveis_email_sistema	S
100000099	100015568	codigo_acesso_listar	\N	controlador.php?acao=codigo_acesso_listar	S
100000099	100015569	codigo_acesso_consultar	\N	controlador.php?acao=codigo_acesso_consultar	S
100000099	100015570	codigo_acesso_excluir	\N	controlador.php?acao=codigo_acesso_excluir	S
100000099	100015571	codigo_acesso_desativar	\N	controlador.php?acao=codigo_acesso_desativar	S
100000099	100015572	codigo_acesso_reativar	\N	controlador.php?acao=codigo_acesso_reativar	S
100000099	100015573	dispositivo_acesso_listar	\N	controlador.php?acao=dispositivo_acesso_listar	S
100000099	100015574	dispositivo_acesso_consultar	\N	controlador.php?acao=dispositivo_acesso_consultar	S
100000099	100015575	codigo_bloqueio_listar	\N	controlador.php?acao=codigo_bloqueio_listar	S
100000099	100015576	codigo_bloqueio_consultar	\N	controlador.php?acao=codigo_bloqueio_consultar	S
100000099	100015577	usuario_historico_listar	\N	controlador.php?acao=usuario_historico_listar	S
100000099	100015578	usuario_historico_consultar	\N	controlador.php?acao=usuario_historico_consultar	S
100000099	100015579	usuario_historico_cadastrar	\N	controlador.php?acao=usuario_historico_cadastrar	S
100000099	100015580	usuario_bloquear	\N	controlador.php?acao=usuario_bloquear	S
100000099	100015581	usuario_desbloquear	\N	controlador.php?acao=usuario_desbloquear	S
100000099	100015582	sistema_gerar_chave_acesso	\N	controlador.php?acao=sistema_gerar_chave_acesso	S
100000099	100015583	sistema_servico_selecionar	\N	controlador.php?acao=sistema_servico_selecionar	S
100000100	100014435	procedimento_gerar	\N	controlador.php?acao=procedimento_gerar	S
100000100	100014436	procedimento_alterar	\N	controlador.php?acao=procedimento_alterar	S
100000100	100014437	procedimento_consultar	\N	controlador.php?acao=procedimento_consultar	S
100000100	100014438	procedimento_listar	\N	controlador.php?acao=procedimento_listar	S
100000100	100014439	procedimento_selecionar	\N	controlador.php?acao=procedimento_selecionar	S
100000100	100014440	procedimento_excluir	\N	controlador.php?acao=procedimento_excluir	S
100000100	100014441	tipo_procedimento_cadastrar	\N	controlador.php?acao=tipo_procedimento_cadastrar	S
100000100	100014442	tipo_procedimento_alterar	\N	controlador.php?acao=tipo_procedimento_alterar	S
100000100	100014443	tipo_procedimento_consultar	\N	controlador.php?acao=tipo_procedimento_consultar	S
100000100	100014444	tipo_procedimento_listar	\N	controlador.php?acao=tipo_procedimento_listar	S
100000100	100014445	tipo_procedimento_selecionar	\N	controlador.php?acao=tipo_procedimento_selecionar	S
100000100	100014446	tipo_procedimento_excluir	\N	controlador.php?acao=tipo_procedimento_excluir	S
100000100	100014447	tipo_procedimento_desativar	\N	controlador.php?acao=tipo_procedimento_desativar	S
100000100	100014448	cargo_cadastrar	\N	controlador.php?acao=cargo_cadastrar	S
100000100	100014449	cargo_alterar	\N	controlador.php?acao=cargo_alterar	S
100000100	100014450	cargo_consultar	\N	controlador.php?acao=cargo_consultar	S
100000100	100014451	cargo_listar	\N	controlador.php?acao=cargo_listar	S
100000100	100014452	cargo_selecionar	\N	controlador.php?acao=cargo_selecionar	S
100000100	100014453	cargo_excluir	\N	controlador.php?acao=cargo_excluir	S
100000100	100014454	cargo_desativar	\N	controlador.php?acao=cargo_desativar	S
100000100	100014455	cargo_reativar	\N	controlador.php?acao=cargo_reativar	S
100000100	100014464	vocativo_cadastrar	\N	controlador.php?acao=vocativo_cadastrar	S
100000100	100014465	vocativo_alterar	\N	controlador.php?acao=vocativo_alterar	S
100000100	100014466	vocativo_consultar	\N	controlador.php?acao=vocativo_consultar	S
100000100	100014467	vocativo_listar	\N	controlador.php?acao=vocativo_listar	S
100000100	100014468	vocativo_selecionar	\N	controlador.php?acao=vocativo_selecionar	S
100000100	100014469	vocativo_excluir	\N	controlador.php?acao=vocativo_excluir	S
100000100	100014470	vocativo_desativar	\N	controlador.php?acao=vocativo_desativar	S
100000100	100014471	vocativo_reativar	\N	controlador.php?acao=vocativo_reativar	S
100000100	100014472	tratamento_cadastrar	\N	controlador.php?acao=tratamento_cadastrar	S
100000100	100014473	tratamento_alterar	\N	controlador.php?acao=tratamento_alterar	S
100000100	100014474	tratamento_consultar	\N	controlador.php?acao=tratamento_consultar	S
100000100	100014475	tratamento_listar	\N	controlador.php?acao=tratamento_listar	S
100000100	100014476	tratamento_selecionar	\N	controlador.php?acao=tratamento_selecionar	S
100000100	100014477	tratamento_excluir	\N	controlador.php?acao=tratamento_excluir	S
100000100	100014478	tratamento_desativar	\N	controlador.php?acao=tratamento_desativar	S
100000100	100014479	tratamento_reativar	\N	controlador.php?acao=tratamento_reativar	S
100000100	100014480	tipo_procedimento_reativar	\N	controlador.php?acao=tipo_procedimento_reativar	S
100000100	100014481	tipo_contato_cadastrar	\N	controlador.php?acao=tipo_contato_cadastrar	S
100000100	100014482	tipo_contato_alterar	\N	controlador.php?acao=tipo_contato_alterar	S
100000100	100014483	tipo_contato_consultar	\N	controlador.php?acao=tipo_contato_consultar	S
100000100	100014484	tipo_contato_listar	\N	controlador.php?acao=tipo_contato_listar	S
100000100	100014485	tipo_contato_selecionar	\N	controlador.php?acao=tipo_contato_selecionar	S
100000100	100014486	tipo_contato_excluir	\N	controlador.php?acao=tipo_contato_excluir	S
100000100	100014487	tipo_contato_desativar	\N	controlador.php?acao=tipo_contato_desativar	S
100000100	100014488	tipo_contato_reativar	\N	controlador.php?acao=tipo_contato_reativar	S
100000100	100014489	uf_cadastrar	\N	controlador.php?acao=uf_cadastrar	S
100000100	100014490	uf_alterar	\N	controlador.php?acao=uf_alterar	S
100000100	100014491	uf_consultar	\N	controlador.php?acao=uf_consultar	S
100000100	100014492	uf_listar	\N	controlador.php?acao=uf_listar	S
100000100	100014493	uf_selecionar	\N	controlador.php?acao=uf_selecionar	S
100000100	100014494	uf_excluir	\N	controlador.php?acao=uf_excluir	S
100000100	100014495	cidade_cadastrar	\N	controlador.php?acao=cidade_cadastrar	S
100000100	100014496	cidade_alterar	\N	controlador.php?acao=cidade_alterar	S
100000100	100014497	cidade_consultar	\N	controlador.php?acao=cidade_consultar	S
100000100	100014498	cidade_listar	\N	controlador.php?acao=cidade_listar	S
100000100	100014499	cidade_selecionar	\N	controlador.php?acao=cidade_selecionar	S
100000100	100014500	cidade_excluir	\N	controlador.php?acao=cidade_excluir	S
100000100	100014508	contato_cadastrar	\N	controlador.php?acao=contato_cadastrar&sin_contexto=N	S
100000100	100014509	contato_alterar	\N	controlador.php?acao=contato_alterar	S
100000100	100014510	contato_consultar	\N	controlador.php?acao=contato_consultar	S
100000100	100014511	contato_listar	\N	controlador.php?acao=contato_listar	S
100000100	100014512	contato_selecionar	\N	controlador.php?acao=contato_selecionar	S
100000100	100014513	contato_excluir	\N	controlador.php?acao=contato_excluir	S
100000100	100014514	contato_desativar	\N	controlador.php?acao=contato_desativar	S
100000100	100014515	contato_reativar	\N	controlador.php?acao=contato_reativar	S
100000100	100014516	usuario_cadastrar	\N	controlador.php?acao=usuario_cadastrar	S
100000100	100014517	usuario_alterar	\N	controlador.php?acao=usuario_alterar	S
100000100	100014518	usuario_consultar	\N	controlador.php?acao=usuario_consultar	S
100000100	100014519	usuario_listar	\N	controlador.php?acao=usuario_listar	S
100000100	100014520	usuario_selecionar	\N	controlador.php?acao=usuario_selecionar	S
100000100	100014521	usuario_excluir	\N	controlador.php?acao=usuario_excluir	S
100000100	100014522	unidade_cadastrar	\N	controlador.php?acao=unidade_cadastrar	S
100000100	100014523	unidade_alterar	\N	controlador.php?acao=unidade_alterar	S
100000100	100014524	unidade_consultar	\N	controlador.php?acao=unidade_consultar	S
100000100	100014525	unidade_listar	\N	controlador.php?acao=unidade_listar	S
100000100	100014526	unidade_selecionar_todas	\N	controlador.php?acao=unidade_selecionar_todas	S
100000100	100014527	unidade_excluir	\N	controlador.php?acao=unidade_excluir	S
100000100	100014528	unidade_desativar	\N	controlador.php?acao=unidade_desativar	S
100000100	100014529	unidade_reativar	\N	controlador.php?acao=unidade_reativar	S
100000100	100014530	rel_grupo_contato_cadastrar	\N	controlador.php?acao=rel_grupo_contato_cadastrar	S
100000100	100014531	rel_grupo_contato_alterar	\N	controlador.php?acao=rel_grupo_contato_alterar	S
100000100	100014532	rel_grupo_contato_consultar	\N	controlador.php?acao=rel_grupo_contato_consultar	S
100000100	100014533	rel_grupo_contato_listar	\N	controlador.php?acao=rel_grupo_contato_listar	S
100000100	100014534	rel_grupo_contato_selecionar	\N	controlador.php?acao=rel_grupo_contato_selecionar	S
100000100	100014535	rel_grupo_contato_excluir	\N	controlador.php?acao=rel_grupo_contato_excluir	S
100000100	100014536	grupo_contato_cadastrar	\N	controlador.php?acao=grupo_contato_cadastrar	S
100000100	100014537	grupo_contato_alterar	\N	controlador.php?acao=grupo_contato_alterar	S
100000100	100014538	grupo_contato_consultar	\N	controlador.php?acao=grupo_contato_consultar	S
100000100	100014539	grupo_contato_listar	\N	controlador.php?acao=grupo_contato_listar	S
100000100	100014540	grupo_contato_selecionar	\N	controlador.php?acao=grupo_contato_selecionar	S
100000100	100014541	grupo_contato_excluir	\N	controlador.php?acao=grupo_contato_excluir	S
100000100	100014542	assunto_cadastrar	\N	controlador.php?acao=assunto_cadastrar	S
100000100	100014543	assunto_alterar	\N	controlador.php?acao=assunto_alterar	S
100000100	100014544	assunto_consultar	\N	controlador.php?acao=assunto_consultar	S
100000100	100014545	assunto_listar	\N	controlador.php?acao=assunto_listar	S
100000100	100014546	assunto_selecionar	\N	controlador.php?acao=assunto_selecionar	S
100000100	100014547	assunto_excluir	\N	controlador.php?acao=assunto_excluir	S
100000100	100014548	assunto_desativar	\N	controlador.php?acao=assunto_desativar	S
100000100	100014549	assunto_reativar	\N	controlador.php?acao=assunto_reativar	S
100000100	100014550	protocolo_gerar	\N	controlador.php?acao=protocolo_cadastrar	S
100000100	100014551	protocolo_alterar	\N	controlador.php?acao=protocolo_alterar	S
100000100	100014552	protocolo_consultar	\N	controlador.php?acao=protocolo_consultar	S
100000100	100014553	protocolo_listar	\N	controlador.php?acao=protocolo_listar	S
100000100	100014554	protocolo_selecionar	\N	controlador.php?acao=protocolo_selecionar	S
100000100	100014555	protocolo_excluir	\N	controlador.php?acao=protocolo_excluir	S
100000100	100014556	contato_imprimir_etiquetas	\N	controlador.php?acao=contato_imprimir_etiquetas	S
100000100	100014557	contato_pdf_etiquetas	\N	controlador.php?acao=contato_pdf_etiquetas	S
100000100	100014558	rel_unidade_tipo_contato_cadastrar	\N	controlador.php?acao=rel_unidade_tipo_contato_cadastrar	S
100000100	100014559	rel_unidade_tipo_contato_listar	\N	controlador.php?acao=rel_unidade_tipo_contato_listar	S
100000100	100014560	rel_unidade_tipo_contato_excluir	\N	controlador.php?acao=rel_unidade_tipo_contato_excluir	S
100000100	100014561	infra_log_listar	\N	controlador.php?acao=infra_log_listar	S
100000100	100014562	rel_tipo_procedimento_assunto_cadastrar	\N	controlador.php?acao=rel_tipo_procedimento_assunto_cadastrar	S
100000100	100014563	rel_tipo_procedimento_assunto_listar	\N	controlador.php?acao=rel_tipo_procedimento_assunto_listar	S
100000100	100014564	rel_tipo_procedimento_assunto_excluir	\N	controlador.php?acao=rel_tipo_procedimento_assunto_excluir	S
100000100	100014565	infra_log_excluir	\N	controlador.php?acao=infra_log_excluir	S
100000100	100014566	participante_cadastrar	\N	controlador.php?acao=participante_cadastrar	S
100000100	100014567	participante_alterar	\N	controlador.php?acao=participante_alterar	S
100000100	100014568	participante_consultar	\N	controlador.php?acao=participante_consultar	S
100000100	100014569	participante_listar	\N	controlador.php?acao=participante_listar	S
100000100	100014570	participante_selecionar	\N	controlador.php?acao=participante_selecionar	S
100000100	100014571	participante_excluir	\N	controlador.php?acao=participante_excluir	S
100000100	100014572	rel_protocolo_assunto_cadastrar	\N	controlador.php?acao=rel_protocolo_assunto_cadastrar	S
100000100	100014573	rel_protocolo_assunto_consultar	\N	controlador.php?acao=rel_protocolo_assunto_consultar	S
100000100	100014574	rel_protocolo_assunto_listar	\N	controlador.php?acao=rel_protocolo_assunto_listar	S
100000100	100014575	rel_protocolo_assunto_excluir	\N	controlador.php?acao=rel_protocolo_assunto_excluir	S
100000100	100014576	usuario_desativar	\N	controlador.php?acao=usuario_desativar	S
100000100	100014577	usuario_reativar	\N	controlador.php?acao=usuario_reativar	S
100000100	100014578	atributo_cadastrar	\N	controlador.php?acao=atributo_cadastrar	S
100000100	100014579	atributo_alterar	\N	controlador.php?acao=atributo_alterar	S
100000100	100014580	atributo_consultar	\N	controlador.php?acao=atributo_consultar	S
100000100	100014581	atributo_listar	\N	controlador.php?acao=atributo_listar	S
100000100	100014582	atributo_selecionar	\N	controlador.php?acao=atributo_selecionar	S
100000100	100014583	atributo_excluir	\N	controlador.php?acao=atributo_excluir	S
100000100	100014584	atributo_desativar	\N	controlador.php?acao=atributo_desativar	S
100000100	100014585	atributo_reativar	\N	controlador.php?acao=atributo_reativar	S
100000100	100014586	dominio_cadastrar	\N	controlador.php?acao=dominio_cadastrar	S
100000100	100014587	dominio_alterar	\N	controlador.php?acao=dominio_alterar	S
100000100	100014588	dominio_consultar	\N	controlador.php?acao=dominio_consultar	S
100000100	100014589	dominio_listar	\N	controlador.php?acao=dominio_listar	S
100000100	100014590	dominio_selecionar	\N	controlador.php?acao=dominio_selecionar	S
100000100	100014591	dominio_excluir	\N	controlador.php?acao=dominio_excluir	S
100000100	100014592	dominio_desativar	\N	controlador.php?acao=dominio_desativar	S
100000100	100014593	dominio_reativar	\N	controlador.php?acao=dominio_reativar	S
100000100	100014594	tipo_localizador_cadastrar	\N	controlador.php?acao=tipo_localizador_cadastrar	S
100000100	100014595	tipo_localizador_alterar	\N	controlador.php?acao=tipo_localizador_alterar	S
100000100	100014596	tipo_localizador_consultar	\N	controlador.php?acao=tipo_localizador_consultar	S
100000100	100014597	tipo_localizador_listar	\N	controlador.php?acao=tipo_localizador_listar	S
100000100	100014598	tipo_localizador_selecionar	\N	controlador.php?acao=tipo_localizador_selecionar	S
100000100	100014599	tipo_localizador_excluir	\N	controlador.php?acao=tipo_localizador_excluir	S
100000100	100014600	tipo_localizador_desativar	\N	controlador.php?acao=tipo_localizador_desativar	S
100000100	100014601	tipo_localizador_reativar	\N	controlador.php?acao=tipo_localizador_reativar	S
100000100	100014602	tipo_suporte_cadastrar	\N	controlador.php?acao=tipo_suporte_cadastrar	S
100000100	100014603	tipo_suporte_alterar	\N	controlador.php?acao=tipo_suporte_alterar	S
100000100	100014604	tipo_suporte_consultar	\N	controlador.php?acao=tipo_suporte_consultar	S
100000100	100014605	tipo_suporte_listar	\N	controlador.php?acao=tipo_suporte_listar	S
100000100	100014606	tipo_suporte_selecionar	\N	controlador.php?acao=tipo_suporte_selecionar	S
100000100	100014607	tipo_suporte_excluir	\N	controlador.php?acao=tipo_suporte_excluir	S
100000100	100014608	tipo_suporte_desativar	\N	controlador.php?acao=tipo_suporte_desativar	S
100000100	100014609	tipo_suporte_reativar	\N	controlador.php?acao=tipo_suporte_reativar	S
100000100	100014610	lugar_localizador_cadastrar	\N	controlador.php?acao=lugar_localizador_cadastrar	S
100000100	100014611	lugar_localizador_alterar	\N	controlador.php?acao=lugar_localizador_alterar	S
100000100	100014612	lugar_localizador_consultar	\N	controlador.php?acao=lugar_localizador_consultar	S
100000100	100014613	lugar_localizador_listar	\N	controlador.php?acao=lugar_localizador_listar	S
100000100	100014614	lugar_localizador_selecionar	\N	controlador.php?acao=lugar_localizador_selecionar	S
100000100	100014615	lugar_localizador_excluir	\N	controlador.php?acao=lugar_localizador_excluir	S
100000100	100014616	lugar_localizador_desativar	\N	controlador.php?acao=lugar_localizador_desativar	S
100000100	100014617	lugar_localizador_reativar	\N	controlador.php?acao=lugar_localizador_reativar	S
100000100	100014618	rel_protocolo_dominio_cadastrar	\N	controlador.php?acao=rel_protocolo_dominio_cadastrar	S
100000100	100015043	modelo_cadastrar	\N	controlador.php?acao=modelo_cadastrar	S
100000100	100014619	rel_protocolo_dominio_consultar	\N	controlador.php?acao=rel_protocolo_dominio_consultar	S
100000100	100014620	rel_protocolo_dominio_listar	\N	controlador.php?acao=rel_protocolo_dominio_listar	S
100000100	100014621	rel_protocolo_dominio_selecionar	\N	controlador.php?acao=rel_protocolo_dominio_selecionar	S
100000100	100014622	rel_protocolo_dominio_excluir	\N	controlador.php?acao=rel_protocolo_dominio_excluir	S
100000100	100014623	localizador_cadastrar	\N	controlador.php?acao=localizador_cadastrar	S
100000100	100014624	localizador_alterar	\N	controlador.php?acao=localizador_alterar	S
100000100	100014625	localizador_consultar	\N	controlador.php?acao=localizador_consultar	S
100000100	100014626	localizador_listar	\N	controlador.php?acao=localizador_listar	S
100000100	100014627	localizador_selecionar	\N	controlador.php?acao=localizador_selecionar	S
100000100	100014628	localizador_excluir	\N	controlador.php?acao=localizador_excluir	S
100000100	100014629	atividade_consultar	\N	controlador.php?acao=atividade_consultar	S
100000100	100014630	atividade_listar	\N	controlador.php?acao=atividade_listar	S
100000100	100014631	atividade_excluir	\N	controlador.php?acao=atividade_excluir	S
100000100	100014632	anexo_cadastrar	\N	controlador.php?acao=anexo_cadastrar	S
100000100	100014633	anexo_consultar	\N	controlador.php?acao=anexo_consultar	S
100000100	100014634	anexo_listar	\N	controlador.php?acao=anexo_listar	S
100000100	100014635	anexo_excluir	\N	controlador.php?acao=anexo_excluir	S
100000100	100014636	procedimento_upload_anexo	\N	controlador.php?acao=procedimento_upload_anexo	S
100000100	100014637	observacao_cadastrar	\N	controlador.php?acao=observacao_cadastrar	S
100000100	100014638	observacao_alterar	\N	controlador.php?acao=observacao_alterar	S
100000100	100014639	observacao_consultar	\N	controlador.php?acao=observacao_consultar	S
100000100	100014640	observacao_listar	\N	controlador.php?acao=observacao_listar	S
100000100	100014641	observacao_selecionar	\N	controlador.php?acao=observacao_selecionar	S
100000100	100014642	observacao_excluir	\N	controlador.php?acao=observacao_excluir	S
100000100	100014643	procedimento_download_anexo	\N	controlador.php?acao=procedimento_download_anexo	S
100000100	100014644	procedimento_remover_anexo	\N	controlador.php?acao=procedimento_remover_anexo	S
100000100	100014646	serie_cadastrar	\N	controlador.php?acao=serie_cadastrar	S
100000100	100014647	serie_alterar	\N	controlador.php?acao=serie_alterar	S
100000100	100014648	serie_consultar	\N	controlador.php?acao=serie_consultar	S
100000100	100014649	serie_listar	\N	controlador.php?acao=serie_listar	S
100000100	100014650	serie_selecionar	\N	controlador.php?acao=serie_selecionar	S
100000100	100014651	serie_excluir	\N	controlador.php?acao=serie_excluir	S
100000100	100014652	serie_desativar	\N	controlador.php?acao=serie_desativar	S
100000100	100014653	serie_reativar	\N	controlador.php?acao=serie_reativar	S
100000100	100014657	procedimento_atualizar_andamento	\N	controlador.php?acao=procedimento_atualizar_andamento	S
100000100	100014658	documento_assinar	\N	controlador.php?acao=documento_assinar	S
100000100	100014659	procedimento_concluir	\N	controlador.php?acao=procedimento_concluir	S
100000100	100014660	procedimento_enviar	\N	controlador.php?acao=procedimento_enviar	S
100000100	100014669	documento_gerar	\N	controlador.php?acao=documento_gerar	S
100000100	100014670	documento_alterar	\N	controlador.php?acao=documento_alterar	S
100000100	100014671	documento_consultar	\N	controlador.php?acao=documento_consultar	S
100000100	100014672	documento_listar	\N	controlador.php?acao=documento_listar	S
100000100	100014673	documento_selecionar	\N	controlador.php?acao=documento_selecionar	S
100000100	100014674	documento_excluir	\N	controlador.php?acao=documento_excluir	S
100000100	100014675	documento_download_anexo	\N	controlador.php?acao=documento_download_anexo	S
100000100	100014676	documento_upload_anexo	\N	controlador.php?acao=documento_upload_anexo	S
100000100	100014677	documento_remover_anexo	\N	controlador.php?acao=documento_remover_anexo	S
100000100	100014681	rel_protocolo_protocolo_cadastrar	\N	controlador.php?acao=rel_protocolo_protocolo_cadastrar	S
100000100	100014682	rel_protocolo_protocolo_consultar	\N	controlador.php?acao=rel_protocolo_protocolo_consultar	S
100000100	100014683	rel_protocolo_protocolo_listar	\N	controlador.php?acao=rel_protocolo_protocolo_listar	S
100000100	100014684	rel_protocolo_protocolo_excluir	\N	controlador.php?acao=rel_protocolo_protocolo_excluir	S
100000100	100014688	procedimento_consultar_historico	\N	controlador.php?acao=procedimento_consultar_historico	S
100000100	100014690	rel_unidade_serie_unidade_cadastrar	\N	controlador.php?acao=rel_unidade_serie_unidade_cadastrar	S
100000100	100014693	procedimento_reabrir	\N	controlador.php?acao=procedimento_reabrir	S
100000100	100014696	documento_enviar_email	\N	controlador.php?acao=documento_enviar_email	S
100000100	100014698	email_upload_anexo	\N	controlador.php?acao=email_upload_anexo	S
100000100	100014699	rel_protocolo_unidade_cadastrar	\N	controlador.php?acao=rel_protocolo_unidade_cadastrar	S
100000100	100014700	rel_protocolo_unidade_listar	\N	controlador.php?acao=rel_protocolo_unidade_listar	S
100000100	100014701	rel_protocolo_unidade_excluir	\N	controlador.php?acao=rel_protocolo_unidade_excluir	S
100000100	100014702	documento_receber	\N	controlador.php?acao=documento_receber	S
100000100	100014703	documento_alterar_recebido	\N	controlador.php?acao=documento_alterar_recebido	S
100000100	100014704	documento_consultar_recebido	\N	controlador.php?acao=documento_consultar_recebido	S
100000100	100014705	procedimento_vincular	\N	controlador.php?acao=procedimento_vincular	S
100000100	100014706	procedimento_pendencia_selecionar	\N	controlador.php?acao=procedimento_pendencia_selecionar	S
100000100	100014707	procedimento_sobrestar	\N	controlador.php?acao=procedimento_sobrestar	S
100000100	100014708	procedimento_remover_sobrestamento	\N	controlador.php?acao=procedimento_remover_sobrestamento	S
100000100	100014709	procedimento_relacionar	\N	controlador.php?acao=procedimento_relacionar	S
100000100	100014710	procedimento_excluir_relacionamento	\N	controlador.php?acao=procedimento_excluir_relacionamento	S
100000100	100014711	publicacao_agendar	\N	controlador.php?acao=publicacao_agendar	S
100000100	100014712	publicacao_alterar_agendamento	\N	controlador.php?acao=publicacao_alterar_agendamento	S
100000100	100014713	publicacao_listar	\N	controlador.php?acao=publicacao_listar	S
100000100	100014719	publicacao_cancelar_agendamento	\N	controlador.php?acao=publicacao_cancelar_agendamento	S
100000100	100014722	publicacao_consultar_agendamento	\N	controlador.php?acao=publicacao_consultar_agendamento	S
100000100	100014725	procedimento_autuar	\N	controlador.php?acao=procedimento_autuar	S
100000100	100014726	procedimento_imprimir_etiqueta	\N	controlador.php?acao=procedimento_imprimir_etiqueta	S
100000100	100014727	procedimento_imprimir_etiqueta_pdf	\N	controlador.php?acao=procedimento_imprimir_etiqueta_pdf	S
100000100	100014728	arquivamento_arquivar	\N	controlador.php?acao=arquivamento_arquivar	S
100000100	100014729	arquivamento_desarquivar	\N	controlador.php?acao=arquivamento_desarquivar	S
100000100	100014730	localizador_imprimir_etiqueta	\N	controlador.php?acao=localizador_imprimir_etiqueta	S
100000100	100014731	localizador_imprimir_etiqueta_pdf	\N	controlador.php?acao=localizador_imprimir_etiqueta_pdf	S
100000100	100014732	localizador_protocolos_listar	\N	controlador.php?acao=localizador_protocolos_listar	S
100000100	100014733	localizador_protocolos_imprimir	\N	controlador.php?acao=localizador_protocolos_imprimir	S
100000100	100014734	localizador_protocolos_imprimir_pdf	\N	controlador.php?acao=localizador_protocolos_imprimir_pdf	S
100000100	100014736	arquivamento_migrar_localizador	\N	controlador.php?acao=arquivamento_migrar_localizador	S
100000100	100014738	rel_protocolo_assunto_alterar	\N	controlador.php?acao=rel_protocolo_assunto_alterar	S
100000100	100014740	publicacao_gerar_relacionada	\N	controlador.php?acao=publicacao_gerar_relacionada	S
100000100	100014741	documento_gerado_selecionar	\N	controlador.php?acao=documento_gerado_selecionar	S
100000100	100014742	documento_recebido_selecionar	\N	controlador.php?acao=documento_recebido_selecionar	S
100000100	100014743	infra_parametro_cadastrar	\N	controlador.php?acao=infra_parametro_cadastrar	S
100000100	100014744	infra_parametro_alterar	\N	controlador.php?acao=infra_parametro_alterar	S
100000100	100014745	infra_parametro_consultar	\N	controlador.php?acao=infra_parametro_consultar	S
100000100	100014746	infra_parametro_listar	\N	controlador.php?acao=infra_parametro_listar	S
100000100	100014747	infra_parametro_selecionar	\N	controlador.php?acao=infra_parametro_selecionar	S
100000100	100014748	infra_parametro_excluir	\N	controlador.php?acao=infra_parametro_excluir	S
100000100	100014749	procedimento_escolher_tipo	\N	controlador.php?acao=procedimento_escolher_tipo	S
100000100	100014750	procedimento_analisar	\N	controlador.php?acao=procedimento_analisar	S
100000100	100014751	procedimento_controlar	\N	controlador.php?acao=procedimento_controlar&reset=1	S
100000100	100014752	infra_sequencia_cadastrar	\N	controlador.php?acao=infra_sequencia_cadastrar	S
100000100	100014753	infra_sequencia_alterar	\N	controlador.php?acao=infra_sequencia_alterar	S
100000100	100014754	infra_sequencia_consultar	\N	controlador.php?acao=infra_sequencia_consultar	S
100000100	100014755	infra_sequencia_listar	\N	controlador.php?acao=infra_sequencia_listar	S
100000100	100014756	infra_sequencia_excluir	\N	controlador.php?acao=infra_sequencia_excluir	S
100000100	100014757	procedimento_trabalhar	\N	controlador.php?acao=procedimento_trabalhar	S
100000100	100014759	arvore_visualizar	\N	controlador.php?acao=arvore_visualizar	S
100000100	100014760	infra_atributo_sessao_cadastrar	\N	controlador.php?acao=infra_atributo_sessao_cadastrar	S
100000100	100014761	infra_atributo_sessao_alterar	\N	controlador.php?acao=infra_atributo_sessao_alterar	S
100000100	100014762	infra_atributo_sessao_listar	\N	controlador.php?acao=infra_atributo_sessao_listar	S
100000100	100014763	infra_atributo_sessao_excluir	\N	controlador.php?acao=infra_atributo_sessao_excluir	S
100000100	100014764	infra_atributo_sessao_reativar	\N	controlador.php?acao=infra_atributo_sessao_reativar	S
100000100	100014765	grupo_serie_cadastrar	\N	controlador.php?acao=grupo_serie_cadastrar	S
100000100	100014766	grupo_serie_alterar	\N	controlador.php?acao=grupo_serie_alterar	S
100000100	100014767	grupo_serie_consultar	\N	controlador.php?acao=grupo_serie_consultar	S
100000100	100014768	grupo_serie_listar	\N	controlador.php?acao=grupo_serie_listar	S
100000100	100014769	grupo_serie_selecionar	\N	controlador.php?acao=grupo_serie_selecionar	S
100000100	100014770	grupo_serie_excluir	\N	controlador.php?acao=grupo_serie_excluir	S
100000100	100014771	grupo_serie_desativar	\N	controlador.php?acao=grupo_serie_desativar	S
100000100	100014772	grupo_serie_reativar	\N	controlador.php?acao=grupo_serie_reativar	S
100000100	100014773	documento_escolher_tipo	\N	controlador.php?acao=documento_escolher_tipo	S
100000100	100014774	bloco_cadastrar	\N	controlador.php?acao=bloco_cadastrar	S
100000100	100014775	bloco_alterar	\N	controlador.php?acao=bloco_alterar	S
100000100	100014776	bloco_consultar	\N	controlador.php?acao=bloco_consultar	S
100000100	100014777	bloco_selecionar_processo	\N	controlador.php?acao=bloco_selecionar_processo	S
100000100	100014778	bloco_excluir	\N	controlador.php?acao=bloco_excluir	S
100000100	100014779	bloco_desativar	\N	controlador.php?acao=bloco_desativar	S
100000100	100014780	bloco_reativar	\N	controlador.php?acao=bloco_reativar	S
100000100	100014781	rel_bloco_protocolo_cadastrar	\N	controlador.php?acao=rel_bloco_protocolo_cadastrar	S
100000100	100014782	bloco_selecionar_documento	\N	controlador.php?acao=bloco_selecionar_documento	S
100000100	100014783	protocolo_pesquisar	\N	controlador.php?acao=protocolo_pesquisar	S
100000100	100014784	agente_carregar	\N	controlador_edoc.php?acao=agente_carregar	S
100000100	100014785	procedimento_listar_relacionamentos	\N	controlador.php?acao=procedimento_listar_relacionamentos	S
100000100	100014786	protocolo_pesquisa_rapida	\N	controlador.php?acao=protocolo_pesquisa_rapida	S
100000100	100014787	assinatura_cadastrar	\N	controlador.php?acao=assinatura_cadastrar	S
100000100	100014788	assinatura_alterar	\N	controlador.php?acao=assinatura_alterar	S
100000100	100014789	assinatura_consultar	\N	controlador.php?acao=assinatura_consultar	S
100000100	100014790	assinatura_listar	\N	controlador.php?acao=assinatura_listar	S
100000100	100014791	assinatura_excluir	\N	controlador.php?acao=assinatura_excluir	S
100000100	100014792	assinante_cadastrar	\N	controlador.php?acao=assinante_cadastrar	S
100000100	100014793	assinante_alterar	\N	controlador.php?acao=assinante_alterar	S
100000100	100014794	assinante_consultar	\N	controlador.php?acao=assinante_consultar	S
100000100	100014795	assinante_listar	\N	controlador.php?acao=assinante_listar	S
100000100	100014796	assinante_selecionar	\N	controlador.php?acao=assinante_selecionar	S
100000100	100014797	assinante_excluir	\N	controlador.php?acao=assinante_excluir	S
100000100	100014798	orgao_consultar	\N	controlador.php?acao=orgao_consultar	S
100000100	100014799	orgao_listar	\N	controlador.php?acao=orgao_listar	S
100000100	100014800	contato_alterar_temporario	\N	controlador.php?acao=contato_alterar_temporario	S
100000100	100014801	contato_relatorio_temporarios	\N	controlador.php?acao=contato_relatorio_temporarios	S
100000100	100014802	documento_visualizar	\N	controlador.php?acao=documento_visualizar	S
100000100	100014803	rel_bloco_protocolo_consultar	\N	controlador.php?acao=rel_bloco_protocolo_consultar	S
100000100	100014804	rel_bloco_protocolo_listar	\N	controlador.php?acao=rel_bloco_protocolo_listar	S
100000100	100014805	rel_bloco_protocolo_excluir	\N	controlador.php?acao=rel_bloco_protocolo_excluir	S
100000100	100014806	rel_bloco_unidade_cadastrar	\N	controlador.php?acao=rel_bloco_unidade_cadastrar	S
100000100	100014807	rel_bloco_unidade_listar	\N	controlador.php?acao=rel_bloco_unidade_listar	S
100000100	100014808	rel_bloco_unidade_excluir	\N	controlador.php?acao=rel_bloco_unidade_excluir	S
100000100	100014809	bloco_cancelar_disponibilizacao	\N	controlador.php?acao=bloco_cancelar_disponibilizacao	S
100000100	100014810	documento_processar	\N	controlador.php?acao=documento_processar	S
100000100	100014811	bloco_assinatura_cadastrar	\N	controlador.php?acao=bloco_assinatura_cadastrar	S
100000100	100014812	bloco_assinatura_listar	\N	controlador.php?acao=bloco_assinatura_listar	S
100000100	100014813	bloco_assinatura_listar_disponibilizados	\N	controlador.php?acao=bloco_assinatura_listar_disponibilizados	S
100000100	100014814	bloco_interno_cadastrar	\N	controlador.php?acao=bloco_interno_cadastrar	S
100000100	100014815	bloco_interno_listar	\N	controlador.php?acao=bloco_interno_listar	S
100000100	100014816	bloco_interno_listar_disponibilizados	\N	controlador.php?acao=bloco_interno_listar_disponibilizados	S
100000100	100014817	bloco_disponibilizar	\N	controlador.php?acao=bloco_disponibilizar	S
100000100	100014818	rel_bloco_unidade_consultar	\N	controlador.php?acao=rel_bloco_unidade_consultar	S
100000100	100014819	bloco_reuniao_cadastrar	\N	controlador.php?acao=bloco_reuniao_cadastrar	S
100000100	100014820	bloco_reuniao_listar	\N	controlador.php?acao=bloco_reuniao_listar	S
100000100	100014821	bloco_reuniao_listar_disponibilizados	\N	controlador.php?acao=bloco_reuniao_listar_disponibilizados	S
100000100	100014822	bloco_listar	\N	controlador.php?acao=bloco_listar	S
100000100	100014824	atributo_andamento_cadastrar	\N	controlador.php?acao=atributo_andamento_cadastrar	S
100000100	100014825	atributo_andamento_consultar	\N	controlador.php?acao=atributo_andamento_consultar	S
100000100	100014826	atributo_andamento_listar	\N	controlador.php?acao=atributo_andamento_listar	S
100000100	100014827	atributo_andamento_excluir	\N	controlador.php?acao=atributo_andamento_excluir	S
100000100	100014828	documento_imprimir_word	\N	controlador.php?acao=documento_imprimir_word	S
100000100	100014829	contato_excluir_temporario	\N	controlador.php?acao=contato_excluir_temporario	S
100000100	100014830	contato_desativar_temporario	\N	controlador.php?acao=contato_desativar_temporario	S
100000100	100014831	rel_assinante_unidade_cadastrar	\N	controlador.php?acao=rel_assinante_unidade_cadastrar	S
100000100	100014832	rel_assinante_unidade_alterar	\N	controlador.php?acao=rel_assinante_unidade_alterar	S
100000100	100014833	rel_assinante_unidade_consultar	\N	controlador.php?acao=rel_assinante_unidade_consultar	S
100000100	100014834	rel_assinante_unidade_listar	\N	controlador.php?acao=rel_assinante_unidade_listar	S
100000100	100014835	rel_assinante_unidade_excluir	\N	controlador.php?acao=rel_assinante_unidade_excluir	S
100000100	100014836	unidade_selecionar_outras	\N	controlador.php?acao=unidade_selecionar_outras	S
100000100	100014837	bloco_assinatura_alterar	\N	controlador.php?acao=bloco_assinatura_alterar	S
100000100	100014838	bloco_reuniao_alterar	\N	controlador.php?acao=bloco_reuniao_alterar	S
100000100	100014839	bloco_interno_alterar	\N	controlador.php?acao=bloco_interno_alterar	S
100000100	100014840	rel_bloco_protocolo_alterar	\N	controlador.php?acao=rel_bloco_protocolo_alterar	S
100000100	100014841	bloco_retornar	\N	controlador.php?acao=bloco_retornar	S
100000100	100014843	procedimento_duplicar	\N	controlador.php?acao=procedimento_duplicar	S
100000100	100014845	bloco_concluir	\N	controlador.php?acao=bloco_concluir	S
100000100	100014847	anotacao_cadastrar	\N	controlador.php?acao=anotacao_cadastrar	S
100000100	100014848	anotacao_alterar	\N	controlador.php?acao=anotacao_alterar	S
100000100	100014849	anotacao_consultar	\N	controlador.php?acao=anotacao_consultar	S
100000100	100014850	anotacao_registrar	\N	controlador.php?acao=anotacao_registrar	S
100000100	100014851	anotacao_excluir	\N	controlador.php?acao=anotacao_excluir	S
100000100	100014852	anotacao_listar	\N	controlador.php?acao=anotacao_listar	S
100000100	100014853	atributo_andamento_alterar	\N	controlador.php?acao=atributo_andamento_alterar	S
100000100	100014854	novidade_cadastrar	\N	controlador.php?acao=novidade_cadastrar	S
100000100	100014855	novidade_alterar	\N	controlador.php?acao=novidade_alterar	S
100000100	100014856	novidade_consultar	\N	controlador.php?acao=novidade_consultar	S
100000100	100014857	novidade_listar	\N	controlador.php?acao=novidade_listar	S
100000100	100014858	novidade_excluir	\N	controlador.php?acao=novidade_excluir	S
100000100	100014859	novidade_cancelar_liberacao	\N	controlador.php?acao=novidade_cancelar_liberacao	S
100000100	100014860	novidade_liberar	\N	controlador.php?acao=novidade_liberar	S
100000100	100014861	novidade_mostrar	\N	controlador.php?acao=novidade_mostrar	S
100000100	100014862	procedimento_sobrestado_listar	\N	controlador.php?acao=procedimento_sobrestado_listar	S
100000100	100014863	arvore_ordenar	\N	controlador.php?acao=arvore_ordenar	S
100000100	100014864	email_unidade_cadastrar	\N	controlador.php?acao=email_unidade_cadastrar	S
100000100	100014865	email_unidade_alterar	\N	controlador.php?acao=email_unidade_alterar	S
100000100	100014866	email_unidade_consultar	\N	controlador.php?acao=email_unidade_consultar	S
100000100	100014867	email_unidade_listar	\N	controlador.php?acao=email_unidade_listar	S
100000100	100014868	email_unidade_excluir	\N	controlador.php?acao=email_unidade_excluir	S
100000100	100014869	acesso_externo_cadastrar	\N	controlador.php?acao=acesso_externo_cadastrar	S
100000100	100014870	acesso_externo_consultar	\N	controlador.php?acao=acesso_externo_consultar	S
100000100	100014871	acesso_externo_listar	\N	controlador.php?acao=acesso_externo_listar	S
100000100	100014872	orgao_alterar	\N	controlador.php?acao=orgao_alterar	S
100000100	100014873	procedimento_enviar_email	\N	controlador.php?acao=procedimento_enviar_email	S
100000100	100014874	email_enviar	\N	controlador.php?acao=email_enviar	S
100000100	100014875	protocolo_cancelar	\N	controlador.php?acao=protocolo_cancelar	S
100000100	100014876	base_conhecimento_cadastrar	\N	controlador.php?acao=base_conhecimento_cadastrar	S
100000100	100014877	base_conhecimento_alterar	\N	controlador.php?acao=base_conhecimento_alterar	S
100000100	100014878	base_conhecimento_consultar	\N	controlador.php?acao=base_conhecimento_consultar	S
100000100	100014879	base_conhecimento_listar	\N	controlador.php?acao=base_conhecimento_listar	S
100000100	100014880	base_conhecimento_excluir	\N	controlador.php?acao=base_conhecimento_excluir	S
100000100	100014881	base_conhecimento_processar	\N	controlador.php?acao=base_conhecimento_processar	S
100000100	100014883	feed_cadastrar	\N	controlador.php?acao=feed_cadastrar	S
100000100	100014884	feed_listar	\N	controlador.php?acao=feed_listar	S
100000100	100014885	feed_excluir	\N	controlador.php?acao=feed_excluir	S
100000100	100014886	rel_protocolo_atributo_cadastrar	\N	controlador.php?acao=rel_protocolo_atributo_cadastrar	S
100000100	100014887	rel_protocolo_atributo_listar	\N	controlador.php?acao=rel_protocolo_atributo_listar	S
100000100	100014888	rel_protocolo_atributo_excluir	\N	controlador.php?acao=rel_protocolo_atributo_excluir	S
100000100	100014892	documento_imprimir_web	\N	controlador.php?acao=documento_imprimir_web	S
100000100	100014893	procedimento_controlar_visualizacao	\N	controlador.php?acao=procedimento_controlar_visualizacao	S
100000100	100014895	retorno_programado_cadastrar	\N	controlador.php?acao=retorno_programado_cadastrar	S
100000100	100014896	retorno_programado_alterar	\N	controlador.php?acao=retorno_programado_alterar	S
100000100	100014897	retorno_programado_consultar	\N	controlador.php?acao=retorno_programado_consultar	S
100000100	100014898	retorno_programado_listar	\N	controlador.php?acao=retorno_programado_listar	S
100000100	100014899	retorno_programado_excluir	\N	controlador.php?acao=retorno_programado_excluir	S
100000100	100014905	siscom_grupo_listar	\N	controlador.php?acao=siscom_grupo_listar	S
100000100	100014906	responder_formulario_ouvidoria	\N	controlador.php?acao=responder_formulario_ouvidoria	S
100000100	100014907	gerar_estatisticas_ouvidoria	\N	controlador.php?acao=gerar_estatisticas_ouvidoria	S
100000100	100014908	procedimento_reencaminhar_ouvidoria	\N	controlador.php?acao=procedimento_reencaminhar_ouvidoria	S
100000100	100014909	rel_bloco_unidade_alterar	\N	controlador.php?acao=rel_bloco_unidade_alterar	S
100000100	100014910	base_conhecimento_cancelar_liberacao	\N	controlador.php?acao=base_conhecimento_cancelar_liberacao	S
100000100	100014911	base_conhecimento_download_anexo	\N	controlador.php?acao=base_conhecimento_download_anexo	S
100000100	100014912	base_conhecimento_liberar	\N	controlador.php?acao=base_conhecimento_liberar	S
100000100	100014913	base_conhecimento_nova_versao	\N	controlador.php?acao=base_conhecimento_nova_versao	S
100000100	100014914	base_conhecimento_pesquisar	\N	controlador.php?acao=base_conhecimento_pesquisar	S
100000100	100014915	base_conhecimento_selecionar	\N	controlador.php?acao=base_conhecimento_selecionar	S
100000100	100014916	base_conhecimento_upload_anexo	\N	controlador.php?acao=base_conhecimento_upload_anexo	S
100000100	100014917	base_conhecimento_versoes	\N	controlador.php?acao=base_conhecimento_versoes	S
100000100	100014918	base_conhecimento_visualizar	\N	controlador.php?acao=base_conhecimento_visualizar	S
100000100	100014919	arquivamento_receber	\N	controlador.php?acao=arquivamento_receber	S
100000100	100014920	arquivamento_cancelar_recebimento	\N	controlador.php?acao=arquivamento_cancelar_recebimento	S
100000100	100014923	arquivamento_solicitar_desarquivamento	\N	controlador.php?acao=arquivamento_solicitar_desarquivamento	S
100000100	100014924	arquivamento_cancelar_solicitacao_desarquivamento	\N	controlador.php?acao=arquivamento_cancelar_solicitacao_desarquivamento	S
100000100	100014925	arquivamento_listar	\N	controlador.php?acao=arquivamento_listar	S
100000100	100014926	arquivamento_desarquivamento_listar	\N	controlador.php?acao=arquivamento_desarquivamento_listar	S
100000100	100014927	rel_base_conhec_tipo_proced_cadastrar	\N	controlador.php?acao=rel_base_conhec_tipo_proced_cadastrar	S
100000100	100014928	rel_base_conhec_tipo_proced_listar	\N	controlador.php?acao=rel_base_conhec_tipo_proced_listar	S
100000100	100014929	rel_base_conhec_tipo_proced_excluir	\N	controlador.php?acao=rel_base_conhec_tipo_proced_excluir	S
100000100	100014930	base_conhecimento_listar_associadas	\N	controlador.php?acao=base_conhecimento_listar_associadas	S
100000100	100014931	acompanhamento_cadastrar	\N	controlador.php?acao=acompanhamento_cadastrar	S
100000100	100014932	acompanhamento_alterar	\N	controlador.php?acao=acompanhamento_alterar	S
100000100	100014933	acompanhamento_consultar	\N	controlador.php?acao=acompanhamento_consultar	S
100000100	100014934	acompanhamento_listar	\N	controlador.php?acao=acompanhamento_listar	S
100000100	100014935	acompanhamento_excluir	\N	controlador.php?acao=acompanhamento_excluir	S
100000100	100014936	grupo_acompanhamento_cadastrar	\N	controlador.php?acao=grupo_acompanhamento_cadastrar	S
100000100	100014937	grupo_acompanhamento_alterar	\N	controlador.php?acao=grupo_acompanhamento_alterar	S
100000100	100014938	grupo_acompanhamento_consultar	\N	controlador.php?acao=grupo_acompanhamento_consultar	S
100000100	100014939	grupo_acompanhamento_listar	\N	controlador.php?acao=grupo_acompanhamento_listar	S
100000100	100014940	grupo_acompanhamento_excluir	\N	controlador.php?acao=grupo_acompanhamento_excluir	S
100000100	100014941	atividade_enviar	\N	controlador.php?acao=atividade_enviar	S
100000100	100014942	atividade_gerar	\N	controlador.php?acao=atividade_gerar	S
100000100	100014947	gerar_estatisticas_unidade	\N	controlador.php?acao=gerar_estatisticas_unidade	S
100000100	100014948	estatisticas_detalhar_unidade	\N	controlador.php?acao=estatisticas_detalhar_unidade	S
100000100	100014949	estatisticas_detalhar_ouvidoria	\N	controlador.php?acao=estatisticas_detalhar_ouvidoria	S
100000100	100014951	contato_substituir_temporario	\N	controlador.php?acao=contato_substituir_temporario	S
100000100	100014952	grupo_email_cadastrar	\N	controlador.php?acao=grupo_email_cadastrar	S
100000100	100014953	grupo_email_alterar	\N	controlador.php?acao=grupo_email_alterar	S
100000100	100014954	grupo_email_consultar	\N	controlador.php?acao=grupo_email_consultar	S
100000100	100014955	grupo_email_listar	\N	controlador.php?acao=grupo_email_listar	S
100000100	100014956	grupo_email_selecionar	\N	controlador.php?acao=grupo_email_selecionar	S
100000100	100014957	grupo_email_excluir	\N	controlador.php?acao=grupo_email_excluir	S
100000100	100014963	orgao_selecionar	\N	controlador.php?acao=orgao_selecionar	S
100000100	100014964	controle_interno_cadastrar	\N	controlador.php?acao=controle_interno_cadastrar	S
100000100	100014965	controle_interno_alterar	\N	controlador.php?acao=controle_interno_alterar	S
100000100	100014966	controle_interno_consultar	\N	controlador.php?acao=controle_interno_consultar	S
100000100	100014967	controle_interno_listar	\N	controlador.php?acao=controle_interno_listar	S
100000100	100014968	controle_interno_excluir	\N	controlador.php?acao=controle_interno_excluir	S
100000100	100014969	rel_controle_interno_orgao_cadastrar	\N	controlador.php?acao=rel_controle_interno_orgao_cadastrar	S
100000100	100014970	rel_controle_interno_orgao_listar	\N	controlador.php?acao=rel_controle_interno_orgao_listar	S
100000100	100014971	rel_controle_interno_orgao_excluir	\N	controlador.php?acao=rel_controle_interno_orgao_excluir	S
100000100	100014972	rel_controle_interno_serie_cadastrar	\N	controlador.php?acao=rel_controle_interno_serie_cadastrar	S
100000100	100014973	rel_controle_interno_serie_listar	\N	controlador.php?acao=rel_controle_interno_serie_listar	S
100000100	100014974	rel_controle_interno_serie_excluir	\N	controlador.php?acao=rel_controle_interno_serie_excluir	S
100000100	100014975	rel_controle_interno_unidade_cadastrar	\N	controlador.php?acao=rel_controle_interno_unidade_cadastrar	S
100000100	100014976	rel_controle_interno_unidade_listar	\N	controlador.php?acao=rel_controle_interno_unidade_listar	S
100000100	100014977	rel_controle_interno_unidade_excluir	\N	controlador.php?acao=rel_controle_interno_unidade_excluir	S
100000100	100014978	bloco_escolher	\N	controlador.php?acao=bloco_escolher	S
100000100	100014979	procedimento_atribuicao_cadastrar	\N	controlador.php?acao=procedimento_atribuicao_cadastrar	S
100000100	100014980	procedimento_atribuicao_listar	\N	controlador.php?acao=procedimento_atribuicao_listar	S
100000100	100014981	procedimento_atribuicao_alterar	\N	controlador.php?acao=procedimento_atribuicao_alterar	S
100000100	100014982	bloco_reabrir	\N	controlador.php?acao=bloco_reabrir	S
100000100	100014984	nivel_acesso_permitido_cadastrar	\N	controlador.php?acao=nivel_acesso_permitido_cadastrar	S
100000100	100014985	nivel_acesso_permitido_listar	\N	controlador.php?acao=nivel_acesso_permitido_listar	S
100000100	100014986	nivel_acesso_permitido_excluir	\N	controlador.php?acao=nivel_acesso_permitido_excluir	S
100000100	100014987	acesso_cadastrar	\N	controlador.php?acao=acesso_cadastrar	S
100000100	100014988	acesso_listar	\N	controlador.php?acao=acesso_listar	S
100000100	100014989	acesso_excluir	\N	controlador.php?acao=acesso_excluir	S
100000100	100014991	procedimento_credencial_conceder	\N	controlador.php?acao=procedimento_credencial_conceder	S
100000100	100014992	procedimento_credencial_listar	\N	controlador.php?acao=procedimento_credencial_listar	S
100000100	100014993	procedimento_credencial_transferir	\N	controlador.php?acao=procedimento_credencial_transferir	S
100000100	100014994	indexacao_protocolo_cadastrar	\N	controlador.php?acao=indexacao_protocolo_cadastrar	S
100000100	100014995	indexacao_protocolo_alterar	\N	controlador.php?acao=indexacao_protocolo_alterar	S
100000100	100014996	indexacao_protocolo_listar	\N	controlador.php?acao=indexacao_protocolo_listar	S
100000100	100014997	indexacao_protocolo_excluir	\N	controlador.php?acao=indexacao_protocolo_excluir	S
100000100	100014998	indexacao_base_conhecimento_cadastrar	\N	controlador.php?acao=indexacao_base_conhecimento_cadastrar	S
100000100	100014999	indexacao_base_conhecimento_alterar	\N	controlador.php?acao=indexacao_base_conhecimento_alterar	S
100000100	100015000	indexacao_base_conhecimento_listar	\N	controlador.php?acao=indexacao_base_conhecimento_listar	S
100000100	100015001	indexacao_base_conhecimento_excluir	\N	controlador.php?acao=indexacao_base_conhecimento_excluir	S
100000100	100015007	procedimento_credencial_gerenciar	\N	controlador.php?acao=procedimento_credencial_gerenciar	S
100000100	100015008	procedimento_credencial_cassar	\N	controlador.php?acao=procedimento_credencial_cassar	S
100000100	100015009	procedimento_receber	\N	controlador.php?acao=procedimento_receber	S
100000100	100015010	procedimento_ciencia	\N	controlador.php?acao=procedimento_ciencia	S
100000100	100015011	documento_ciencia	\N	controlador.php?acao=documento_ciencia	S
100000100	100015012	protocolo_ciencia_listar	\N	controlador.php?acao=protocolo_ciencia_listar	S
100000100	100015014	credencial_assinatura_conceder	\N	controlador.php?acao=credencial_assinatura_conceder	S
100000100	100015015	credencial_assinatura_cassar	\N	controlador.php?acao=credencial_assinatura_cassar	S
100000100	100015016	credencial_assinatura_gerenciar	\N	controlador.php?acao=credencial_assinatura_gerenciar	S
100000100	100015017	serie_escolha_cadastrar	\N	controlador.php?acao=serie_escolha_cadastrar	S
100000100	100015018	serie_escolha_listar	\N	controlador.php?acao=serie_escolha_listar	S
100000100	100015019	serie_escolha_excluir	\N	controlador.php?acao=serie_escolha_excluir	S
100000100	100015020	tipo_procedimento_escolha_cadastrar	\N	controlador.php?acao=tipo_procedimento_escolha_cadastrar	S
100000100	100015021	tipo_procedimento_escolha_listar	\N	controlador.php?acao=tipo_procedimento_escolha_listar	S
100000100	100015022	tipo_procedimento_escolha_excluir	\N	controlador.php?acao=tipo_procedimento_escolha_excluir	S
100000100	100015023	procedimento_credencial_renunciar	\N	controlador.php?acao=procedimento_credencial_renunciar	S
100000100	100015024	servico_cadastrar	\N	controlador.php?acao=servico_cadastrar	S
100000100	100015025	servico_alterar	\N	controlador.php?acao=servico_alterar	S
100000100	100015026	servico_consultar	\N	controlador.php?acao=servico_consultar	S
100000100	100015027	servico_excluir	\N	controlador.php?acao=servico_excluir	S
100000100	100015028	servico_listar	\N	controlador.php?acao=servico_listar	S
100000100	100015029	servico_desativar	\N	controlador.php?acao=servico_desativar	S
100000100	100015030	servico_reativar	\N	controlador.php?acao=servico_reativar	S
100000100	100015031	operacao_servico_cadastrar	\N	controlador.php?acao=operacao_servico_cadastrar	S
100000100	100015032	operacao_servico_alterar	\N	controlador.php?acao=operacao_servico_alterar	S
100000100	100015033	operacao_servico_consultar	\N	controlador.php?acao=operacao_servico_consultar	S
100000100	100015034	operacao_servico_listar	\N	controlador.php?acao=operacao_servico_listar	S
100000100	100015035	operacao_servico_excluir	\N	controlador.php?acao=operacao_servico_excluir	S
100000100	100015036	usuario_sistema_cadastrar	\N	controlador.php?acao=usuario_sistema_cadastrar	S
100000100	100015037	usuario_sistema_alterar	\N	controlador.php?acao=usuario_sistema_alterar	S
100000100	100015038	usuario_sistema_consultar	\N	controlador.php?acao=usuario_sistema_consultar	S
100000100	100015039	usuario_sistema_listar	\N	controlador.php?acao=usuario_sistema_listar	S
100000100	100015040	usuario_sistema_excluir	\N	controlador.php?acao=usuario_sistema_excluir	S
100000100	100015041	usuario_sistema_desativar	\N	controlador.php?acao=usuario_sistema_desativar	S
100000100	100015042	usuario_sistema_reativar	\N	controlador.php?acao=usuario_sistema_reativar	S
100000100	100015044	modelo_alterar	\N	controlador.php?acao=modelo_alterar	S
100000100	100015045	modelo_consultar	\N	controlador.php?acao=modelo_consultar	S
100000100	100015046	modelo_selecionar	\N	controlador.php?acao=modelo_selecionar	S
100000100	100015047	modelo_listar	\N	controlador.php?acao=modelo_listar	S
100000100	100015048	modelo_excluir	\N	controlador.php?acao=modelo_excluir	S
100000100	100015049	modelo_desativar	\N	controlador.php?acao=modelo_desativar	S
100000100	100015050	modelo_reativar	\N	controlador.php?acao=modelo_reativar	S
100000100	100015051	modelo_clonar	\N	controlador.php?acao=modelo_clonar	S
100000100	100015052	estilo_cadastrar	\N	controlador.php?acao=estilo_cadastrar	S
100000100	100015053	estilo_alterar	\N	controlador.php?acao=estilo_alterar	S
100000100	100015054	estilo_consultar	\N	controlador.php?acao=estilo_consultar	S
100000100	100015055	estilo_selecionar	\N	controlador.php?acao=estilo_selecionar	S
100000100	100015056	estilo_listar	\N	controlador.php?acao=estilo_listar	S
100000100	100015057	estilo_excluir	\N	controlador.php?acao=estilo_excluir	S
100000100	100015058	secao_modelo_cadastrar	\N	controlador.php?acao=secao_modelo_cadastrar	S
100000100	100015059	secao_modelo_alterar	\N	controlador.php?acao=secao_modelo_alterar	S
100000100	100015060	secao_modelo_consultar	\N	controlador.php?acao=secao_modelo_consultar	S
100000100	100015061	secao_modelo_selecionar	\N	controlador.php?acao=secao_modelo_selecionar	S
100000100	100015062	secao_modelo_listar	\N	controlador.php?acao=secao_modelo_listar	S
100000100	100015063	secao_modelo_excluir	\N	controlador.php?acao=secao_modelo_excluir	S
100000100	100015064	rel_secao_modelo_estilo_cadastrar	\N	controlador.php?acao=rel_secao_modelo_estilo_cadastrar	S
100000100	100015065	rel_secao_modelo_estilo_alterar	\N	controlador.php?acao=rel_secao_modelo_estilo_alterar	S
100000100	100015066	rel_secao_modelo_estilo_consultar	\N	controlador.php?acao=rel_secao_modelo_estilo_consultar	S
100000100	100015067	rel_secao_modelo_estilo_selecionar	\N	controlador.php?acao=rel_secao_modelo_estilo_selecionar	S
100000100	100015068	rel_secao_modelo_estilo_listar	\N	controlador.php?acao=rel_secao_modelo_estilo_listar	S
100000100	100015069	rel_secao_modelo_estilo_excluir	\N	controlador.php?acao=rel_secao_modelo_estilo_excluir	S
100000100	100015070	secao_documento_cadastrar	\N	controlador.php?acao=secao_documento_cadastrar	S
100000100	100015071	secao_documento_alterar	\N	controlador.php?acao=secao_documento_alterar	S
100000100	100015072	secao_documento_consultar	\N	controlador.php?acao=secao_documento_consultar	S
100000100	100015073	secao_documento_listar	\N	controlador.php?acao=secao_documento_listar	S
100000100	100015074	secao_documento_excluir	\N	controlador.php?acao=secao_documento_excluir	S
100000100	100015075	versao_secao_documento_cadastrar	\N	controlador.php?acao=versao_secao_documento_cadastrar	S
100000100	100015076	versao_secao_documento_alterar	\N	controlador.php?acao=versao_secao_documento_alterar	S
100000100	100015077	versao_secao_documento_consultar	\N	controlador.php?acao=versao_secao_documento_consultar	S
100000100	100015078	versao_secao_documento_listar	\N	controlador.php?acao=versao_secao_documento_listar	S
100000100	100015079	versao_secao_documento_excluir	\N	controlador.php?acao=versao_secao_documento_excluir	S
100000100	100015080	editor_montar	\N	controlador.php?acao=editor_montar	S
100000100	100015081	editor_salvar	\N	controlador.php?acao=editor_salvar	S
100000100	100015082	editor_visualizar_codigo_fonte	\N	controlador.php?acao=editor_visualizar_codigo_fonte	S
100000100	100015083	documento_visualizar_conteudo_assinatura	\N	controlador.php?acao=documento_visualizar_conteudo_assinatura	S
100000100	100015084	tarja_assinatura_consultar	\N	controlador.php?acao=tarja_assinatura_consultar	S
100000100	100015085	tarja_assinatura_alterar	\N	controlador.php?acao=tarja_assinatura_alterar	S
100000100	100015086	tarja_assinatura_upload	\N	controlador.php?acao=tarja_assinatura_upload	S
100000100	100015087	tarja_assinatura_listar	\N	controlador.php?acao=tarja_assinatura_listar	S
100000100	100015088	unidade_selecionar_envio_processo	\N	controlador.php?acao=unidade_selecionar_envio_processo	S
100000100	100015089	arquivo_extensao_cadastrar	\N	controlador.php?acao=arquivo_extensao_cadastrar	S
100000100	100015090	arquivo_extensao_alterar	\N	controlador.php?acao=arquivo_extensao_alterar	S
100000100	100015091	arquivo_extensao_consultar	\N	controlador.php?acao=arquivo_extensao_consultar	S
100000100	100015092	arquivo_extensao_listar	\N	controlador.php?acao=arquivo_extensao_listar	S
100000100	100015093	arquivo_extensao_excluir	\N	controlador.php?acao=arquivo_extensao_excluir	S
100000100	100015094	arquivo_extensao_desativar	\N	controlador.php?acao=arquivo_extensao_desativar	S
100000100	100015095	arquivo_extensao_reativar	\N	controlador.php?acao=arquivo_extensao_reativar	S
100000100	100015096	pais_cadastrar	\N	controlador.php?acao=pais_cadastrar	S
100000100	100015097	pais_alterar	\N	controlador.php?acao=pais_alterar	S
100000100	100015098	pais_consultar	\N	controlador.php?acao=pais_consultar	S
100000100	100015099	pais_selecionar	\N	controlador.php?acao=pais_selecionar	S
100000100	100015100	pais_listar	\N	controlador.php?acao=pais_listar	S
100000100	100015101	pais_excluir	\N	controlador.php?acao=pais_excluir	S
100000100	100015102	grupo_email_institucional_cadastrar	\N	controlador.php?acao=grupo_email_institucional_cadastrar	S
100000100	100015103	grupo_email_institucional_alterar	\N	controlador.php?acao=grupo_email_institucional_alterar	S
100000100	100015104	grupo_email_institucional_consultar	\N	controlador.php?acao=grupo_email_institucional_consultar	S
100000100	100015105	grupo_email_institucional_selecionar	\N	controlador.php?acao=grupo_email_institucional_selecionar	S
100000100	100015106	grupo_email_institucional_listar	\N	controlador.php?acao=grupo_email_institucional_listar	S
100000100	100015107	grupo_email_institucional_excluir	\N	controlador.php?acao=grupo_email_institucional_excluir	S
100000100	100015108	grupo_email_institucional_desativar	\N	controlador.php?acao=grupo_email_institucional_desativar	S
100000100	100015109	grupo_email_institucional_reativar	\N	controlador.php?acao=grupo_email_institucional_reativar	S
100000100	100015110	numeracao_cadastrar	\N	controlador.php?acao=numeracao_cadastrar	S
100000100	100015111	numeracao_alterar	\N	controlador.php?acao=numeracao_alterar	S
100000100	100015112	numeracao_consultar	\N	controlador.php?acao=numeracao_consultar	S
100000100	100015113	numeracao_listar	\N	controlador.php?acao=numeracao_listar	S
100000100	100015114	numeracao_excluir	\N	controlador.php?acao=numeracao_excluir	S
100000100	100015115	numeracao_ajustar	\N	controlador.php?acao=numeracao_ajustar	S
100000100	100015116	arquivamento_pesquisar	\N	controlador.php?acao=arquivamento_pesquisar	S
100000100	100015117	procedimento_historico_total	\N	controlador.php?acao=procedimento_historico_total	S
100000100	100015119	usuario_externo_cadastrar	\N	controlador.php?acao=usuario_externo_cadastrar	S
100000100	100015120	usuario_externo_alterar	\N	controlador.php?acao=usuario_externo_alterar	S
100000100	100015121	usuario_externo_consultar	\N	controlador.php?acao=usuario_externo_consultar	S
100000100	100015122	usuario_externo_listar	\N	controlador.php?acao=usuario_externo_listar	S
100000100	100015123	usuario_externo_excluir	\N	controlador.php?acao=usuario_externo_excluir	S
100000100	100015124	usuario_externo_desativar	\N	controlador.php?acao=usuario_externo_desativar	S
100000100	100015125	usuario_externo_reativar	\N	controlador.php?acao=usuario_externo_reativar	S
100000100	100015126	acesso_externo_gerenciar	\N	controlador.php?acao=acesso_externo_gerenciar	S
100000100	100015127	acesso_externo_disponibilizar	\N	controlador.php?acao=acesso_externo_disponibilizar	S
100000100	100015128	acesso_externo_cancelar	\N	controlador.php?acao=acesso_externo_cancelar	S
100000100	100015129	assinatura_externa_gerenciar	\N	controlador.php?acao=assinatura_externa_gerenciar	S
100000100	100015130	assinatura_externa_liberar	\N	controlador.php?acao=assinatura_externa_liberar	S
100000100	100015131	assinatura_externa_cancelar	\N	controlador.php?acao=assinatura_externa_cancelar	S
100000100	100015132	atividade_alterar	\N	controlador.php?acao=atividade_alterar	S
100000100	100015133	orgao_upload	\N	controlador.php?acao=orgao_upload	S
100000100	100015134	rel_controle_interno_tipo_proc_cadastrar	\N	controlador.php?acao=rel_controle_interno_tipo_proc_cadastrar	S
100000100	100015135	rel_controle_interno_tipo_proc_excluir	\N	controlador.php?acao=rel_controle_interno_tipo_proc_excluir	S
100000100	100015136	rel_controle_interno_tipo_proc_listar	\N	controlador.php?acao=rel_controle_interno_tipo_proc_listar	S
100000100	100015137	inspecao_administrativa_gerar	\N	controlador.php?acao=inspecao_administrativa_gerar	S
100000100	100015138	inspecao_administrativa_detalhar	\N	controlador.php?acao=inspecao_administrativa_detalhar	S
100000100	100015139	inspecao_administrativa_geral	\N	controlador.php?acao=inspecao_administrativa_geral	S
100000100	100015140	inspecao_administrativa_orgao	\N	controlador.php?acao=inspecao_administrativa_orgao	S
100000100	100015141	estatisticas_cadastrar	\N	controlador.php?acao=estatisticas_cadastrar	S
100000100	100015142	estatisticas_consultar	\N	controlador.php?acao=estatisticas_consultar	S
100000100	100015143	estatisticas_listar	\N	controlador.php?acao=estatisticas_listar	S
100000100	100015144	estatisticas_excluir	\N	controlador.php?acao=estatisticas_excluir	S
100000100	100015145	procedimento_gerar_pdf	\N	controlador.php?acao=procedimento_gerar_pdf	S
100000100	100015146	exibir_arquivo	\N	controlador.php?acao=exibir_arquivo	S
100000100	100015147	documento_versao_listar	\N	controlador.php?acao=documento_versao_listar	S
100000100	100015148	documento_versao_recuperar	\N	controlador.php?acao=documento_versao_recuperar	S
100000100	100015149	grupo_protocolo_modelo_alterar	\N	controlador.php?acao=grupo_protocolo_modelo_alterar	S
100000100	100015150	grupo_protocolo_modelo_cadastrar	\N	controlador.php?acao=grupo_protocolo_modelo_cadastrar	S
100000100	100015151	grupo_protocolo_modelo_consultar	\N	controlador.php?acao=grupo_protocolo_modelo_consultar	S
100000100	100015152	grupo_protocolo_modelo_excluir	\N	controlador.php?acao=grupo_protocolo_modelo_excluir	S
100000100	100015153	grupo_protocolo_modelo_listar	\N	controlador.php?acao=grupo_protocolo_modelo_listar	S
100000100	100015154	protocolo_modelo_alterar	\N	controlador.php?acao=protocolo_modelo_alterar	S
100000100	100015155	protocolo_modelo_cadastrar	\N	controlador.php?acao=protocolo_modelo_cadastrar	S
100000100	100015156	protocolo_modelo_consultar	\N	controlador.php?acao=protocolo_modelo_consultar	S
100000100	100015157	protocolo_modelo_excluir	\N	controlador.php?acao=protocolo_modelo_excluir	S
100000100	100015158	documento_modelo_selecionar	\N	controlador.php?acao=documento_modelo_selecionar	S
100000100	100015159	protocolo_modelo_listar	\N	controlador.php?acao=protocolo_modelo_listar	S
100000100	100015160	infra_navegador_listar	\N	controlador.php?acao=infra_navegador_listar	S
100000100	100015161	texto_padrao_interno_alterar	\N	controlador.php?acao=texto_padrao_interno_alterar	S
100000100	100015162	texto_padrao_interno_cadastrar	\N	controlador.php?acao=texto_padrao_interno_cadastrar	S
100000100	100015163	texto_padrao_interno_consultar	\N	controlador.php?acao=texto_padrao_interno_consultar	S
100000100	100015164	texto_padrao_interno_excluir	\N	controlador.php?acao=texto_padrao_interno_excluir	S
100000100	100015165	texto_padrao_interno_selecionar	\N	controlador.php?acao=texto_padrao_interno_selecionar	S
100000100	100015166	texto_padrao_interno_listar	\N	controlador.php?acao=texto_padrao_interno_listar	S
100000100	100015169	indexar	\N	controlador.php?acao=indexar	S
100000100	100015170	email_sistema_consultar	\N	controlador.php?acao=email_sistema_consultar	S
100000100	100015171	email_sistema_alterar	\N	controlador.php?acao=email_sistema_alterar	S
100000100	100015172	email_sistema_listar	\N	controlador.php?acao=email_sistema_listar	S
100000100	100015211	usuario_externo_logar	\N	controlador_externo.php?acao=usuario_externo_logar	S
100000100	100015212	usuario_externo_enviar_cadastro	\N	controlador_externo.php?acao=usuario_externo_enviar_cadastro	S
100000100	100015213	usuario_externo_alterar_senha	\N	controlador_externo.php?acao=usuario_externo_alterar_senha	S
100000100	100015214	usuario_externo_sair	\N	controlador_externo.php?acao=usuario_externo_sair	S
100000100	100015215	usuario_externo_gerar_senha	\N	controlador_externo.php?acao=usuario_externo_gerar_senha	S
100000100	100015216	processo_consulta_externa	\N	controlador_externo.php?acao=processo_consulta_externa	S
100000100	100015217	documento_consulta_externa	\N	controlador_externo.php?acao=documento_consulta_externa	S
100000100	100015218	acesso_externo_excluir	\N	controlador.php?acao=acesso_externo_excluir	S
100000100	100015219	procedimento_visualizar	\N	controlador.php?acao=procedimento_visualizar	S
100000100	100015220	infra_regra_auditoria_cadastrar	\N	controlador.php?acao=infra_regra_auditoria_cadastrar	S
100000100	100015222	infra_regra_auditoria_consultar	\N	controlador.php?acao=infra_regra_auditoria_consultar	S
100000100	100015223	infra_regra_auditoria_listar	\N	controlador.php?acao=infra_regra_auditoria_listar	S
100000100	100015227	infra_regra_auditoria_recurso_cadastrar	\N	controlador.php?acao=infra_regra_auditoria_recurso_cadastrar	S
100000100	100015228	infra_regra_auditoria_recurso_listar	\N	controlador.php?acao=infra_regra_auditoria_recurso_listar	S
100000100	100015230	auditoria_protocolo_cadastrar	\N	controlador.php?acao=auditoria_protocolo_cadastrar	S
100000100	100015231	auditoria_protocolo_consultar	\N	controlador.php?acao=auditoria_protocolo_consultar	S
100000100	100015232	auditoria_protocolo_listar	\N	controlador.php?acao=auditoria_protocolo_listar	S
100000100	100015233	auditoria_protocolo_excluir	\N	controlador.php?acao=auditoria_protocolo_excluir	S
100000100	100015234	infra_auditoria_cadastrar	\N	controlador.php?acao=infra_auditoria_cadastrar	S
100000100	100015235	infra_auditoria_listar	\N	controlador.php?acao=infra_auditoria_listar	S
100000100	100015236	infra_agendamento_tarefa_cadastrar	\N	controlador.php?acao=infra_agendamento_tarefa_cadastrar	S
100000100	100015237	infra_agendamento_tarefa_alterar	\N	controlador.php?acao=infra_agendamento_tarefa_alterar	S
100000100	100015238	infra_agendamento_tarefa_consultar	\N	controlador.php?acao=infra_agendamento_tarefa_consultar	S
100000100	100015239	infra_agendamento_tarefa_listar	\N	controlador.php?acao=infra_agendamento_tarefa_listar	S
100000100	100015240	infra_agendamento_tarefa_excluir	\N	controlador.php?acao=infra_agendamento_tarefa_excluir	S
100000100	100015241	infra_agendamento_tarefa_executar	\N	controlador.php?acao=infra_agendamento_tarefa_executar	S
100000100	100015242	infra_agendamento_tarefa_desativar	\N	controlador.php?acao=infra_agendamento_tarefa_desativar	S
100000100	100015243	infra_agendamento_tarefa_reativar	\N	controlador.php?acao=infra_agendamento_tarefa_reativar	S
100000100	100015244	infra_banco_comparar	\N	controlador.php?acao=infra_banco_comparar	S
100000100	100015246	conjunto_estilos_cadastrar	\N	controlador.php?acao=conjunto_estilos_cadastrar	S
100000100	100015247	conjunto_estilos_alterar	\N	controlador.php?acao=conjunto_estilos_alterar	S
100000100	100015248	conjunto_estilos_consultar	\N	controlador.php?acao=conjunto_estilos_consultar	S
100000100	100015249	conjunto_estilos_listar	\N	controlador.php?acao=conjunto_estilos_listar	S
100000100	100015250	conjunto_estilos_item_cadastrar	\N	controlador.php?acao=conjunto_estilos_item_cadastrar	S
100000100	100015251	conjunto_estilos_item_alterar	\N	controlador.php?acao=conjunto_estilos_item_alterar	S
100000100	100015252	conjunto_estilos_item_consultar	\N	controlador.php?acao=conjunto_estilos_item_consultar	S
100000100	100015253	conjunto_estilos_item_listar	\N	controlador.php?acao=conjunto_estilos_item_listar	S
100000100	100015254	pesquisa_solr_ajuda	\N	controlador.php?acao=pesquisa_solr_ajuda	S
100000100	100015267	procedimento_paginar	\N	controlador.php?acao=procedimento_paginar	S
100000100	100015268	tarefa_consultar	\N	controlador.php?acao=tarefa_consultar	S
100000100	100015269	tarefa_listar	\N	controlador.php?acao=tarefa_listar	S
100000100	100015271	tarefa_configurar_historico	\N	controlador.php?acao=tarefa_configurar_historico	S
100000100	100015272	procedimento_finalizar_ouvidoria	\N	controlador.php?acao=procedimento_finalizar_ouvidoria	S
100000100	100015273	acompanhamento_listar_ouvidoria	\N	controlador.php?acao=acompanhamento_listar_ouvidoria	S
100000100	100015274	acompanhamento_gerar_grafico_ouvidoria	\N	controlador.php?acao=acompanhamento_gerar_grafico_ouvidoria	S
100000100	100015275	acompanhamento_detalhar_ouvidoria	\N	controlador.php?acao=acompanhamento_detalhar_ouvidoria	S
100000100	100015276	alerta_cadastrar	\N	controlador.php?acao=alerta_cadastrar	S
100000100	100015277	alerta_alterar	\N	controlador.php?acao=alerta_alterar	S
100000100	100015278	alerta_consultar	\N	controlador.php?acao=alerta_consultar	S
100000100	100015279	alerta_listar	\N	controlador.php?acao=alerta_listar	S
100000100	100015280	alerta_excluir	\N	controlador.php?acao=alerta_excluir	S
100000100	100015281	rel_serie_veiculo_publicacao_consultar	\N	controlador.php?acao=rel_serie_veiculo_publicacao_consultar	S
100000100	100015282	rel_serie_veiculo_publicacao_listar	\N	controlador.php?acao=rel_serie_veiculo_publicacao_listar	S
100000100	100015283	rel_serie_veiculo_publicacao_cadastrar	\N	controlador.php?acao=rel_serie_veiculo_publicacao_cadastrar	S
100000100	100015284	rel_serie_veiculo_publicacao_excluir	\N	controlador.php?acao=rel_serie_veiculo_publicacao_excluir	S
100000100	100015285	feriado_cadastrar	\N	controlador.php?acao=feriado_cadastrar	S
100000100	100015286	feriado_alterar	\N	controlador.php?acao=feriado_alterar	S
100000100	100015287	feriado_excluir	\N	controlador.php?acao=feriado_excluir	S
100000100	100015288	feriado_consultar	\N	controlador.php?acao=feriado_consultar	S
100000100	100015289	feriado_listar	\N	controlador.php?acao=feriado_listar	S
100000100	100015290	veiculo_publicacao_cadastrar	\N	controlador.php?acao=veiculo_publicacao_cadastrar	S
100000100	100015291	veiculo_publicacao_listar	\N	controlador.php?acao=veiculo_publicacao_listar	S
100000100	100015292	veiculo_publicacao_alterar	\N	controlador.php?acao=veiculo_publicacao_alterar	S
100000100	100015293	veiculo_publicacao_excluir	\N	controlador.php?acao=veiculo_publicacao_excluir	S
100000100	100015294	veiculo_publicacao_desativar	\N	controlador.php?acao=veiculo_publicacao_desativar	S
100000100	100015295	veiculo_publicacao_reativar	\N	controlador.php?acao=veiculo_publicacao_reativar	S
100000100	100015296	veiculo_publicacao_consultar	\N	controlador.php?acao=veiculo_publicacao_consultar	S
100000100	100015297	veiculo_publicacao_selecionar	\N	controlador.php?acao=veiculo_publicacao_selecionar	S
100000100	100015298	veiculo_imprensa_nacional_cadastrar	\N	controlador.php?acao=veiculo_imprensa_nacional_cadastrar	S
100000100	100015299	veiculo_imprensa_nacional_alterar	\N	controlador.php?acao=veiculo_imprensa_nacional_alterar	S
100000100	100015300	veiculo_imprensa_nacional_excluir	\N	controlador.php?acao=veiculo_imprensa_nacional_excluir	S
100000100	100015301	veiculo_imprensa_nacional_consultar	\N	controlador.php?acao=veiculo_imprensa_nacional_consultar	S
100000100	100015302	veiculo_imprensa_nacional_listar	\N	controlador.php?acao=veiculo_imprensa_nacional_listar	S
100000100	100015303	veiculo_imprensa_nacional_selecionar	\N	controlador.php?acao=veiculo_imprensa_nacional_selecionar	S
100000100	100015304	secao_imprensa_nacional_cadastrar	\N	controlador.php?acao=secao_imprensa_nacional_cadastrar	S
100000100	100015305	secao_imprensa_nacional_alterar	\N	controlador.php?acao=secao_imprensa_nacional_alterar	S
100000100	100015306	secao_imprensa_nacional_excluir	\N	controlador.php?acao=secao_imprensa_nacional_excluir	S
100000100	100015307	secao_imprensa_nacional_consultar	\N	controlador.php?acao=secao_imprensa_nacional_consultar	S
100000100	100015308	secao_imprensa_nacional_listar	\N	controlador.php?acao=secao_imprensa_nacional_listar	S
100000100	100015309	secao_imprensa_nacional_selecionar	\N	controlador.php?acao=secao_imprensa_nacional_selecionar	S
100000100	100015318	publicacao_legado_consultar	\N	controlador.php?acao=publicacao_legado_consultar	S
100000100	100015319	publicacao_legado_listar	\N	controlador.php?acao=publicacao_legado_listar	S
100000100	100015320	documento_mover	\N	controlador.php?acao=documento_mover	S
100000100	100015321	rel_protocolo_protocolo_alterar	\N	controlador.php?acao=rel_protocolo_protocolo_alterar	S
100000100	100015322	serie_publicacao_cadastrar	\N	controlador.php?acao=serie_publicacao_cadastrar	S
100000100	100015323	serie_publicacao_consultar	\N	controlador.php?acao=serie_publicacao_consultar	S
100000100	100015324	serie_publicacao_listar	\N	controlador.php?acao=serie_publicacao_listar	S
100000100	100015325	unidade_publicacao_cadastrar	\N	controlador.php?acao=unidade_publicacao_cadastrar	S
100000100	100015326	unidade_publicacao_consultar	\N	controlador.php?acao=unidade_publicacao_consultar	S
100000100	100015327	unidade_publicacao_listar	\N	controlador.php?acao=unidade_publicacao_listar	S
100000100	100015328	procedimento_anexar	\N	controlador.php?acao=procedimento_anexar	S
100000100	100015329	procedimento_desanexar	\N	controlador.php?acao=procedimento_desanexar	S
100000100	100015330	procedimento_listar_anexados	\N	controlador.php?acao=procedimento_listar_anexados	S
100000100	100015331	procedimento_anexado_ciencia	\N	controlador.php?acao=procedimento_anexado_ciencia	S
100000100	100015332	protocolo_visualizar	\N	controlador.php?acao=protocolo_visualizar	S
100000100	100015333	estatisticas_detalhar_desempenho	\N	controlador.php?acao=estatisticas_detalhar_desempenho	S
100000100	100015334	estatisticas_detalhar_desempenho_procedimento	\N	controlador.php?acao=estatisticas_detalhar_desempenho_procedimento	S
100000100	100015335	responder_formulario_corregedoria	\N	controlador.php?acao=responder_formulario_corregedoria	S
100000100	100015336	tarja_assinatura_montar	\N	controlador.php?acao=tarja_assinatura_montar	S
100000100	100015337	email_sistema_desativar	\N	controlador.php?acao=email_sistema_desativar	S
100000100	100015338	email_sistema_reativar	\N	controlador.php?acao=email_sistema_reativar	S
100000100	100015339	indexacao_publicacao_cadastrar	\N	controlador.php?acao=indexacao_publicacao_cadastrar	S
100000100	100015340	indexacao_publicacao_listar	\N	controlador.php?acao=indexacao_publicacao_listar	S
100000100	100015341	indexacao_publicacao_excluir	\N	controlador.php?acao=indexacao_publicacao_excluir	S
100000100	100015342	rel_serie_assunto_cadastrar	\N	controlador.php?acao=rel_serie_assunto_cadastrar	S
100000100	100015343	rel_serie_assunto_excluir	\N	controlador.php?acao=rel_serie_assunto_excluir	S
100000100	100015344	rel_serie_assunto_listar	\N	controlador.php?acao=rel_serie_assunto_listar	S
100000100	100015345	tipo_conferencia_cadastrar	\N	controlador.php?acao=tipo_conferencia_cadastrar	S
100000100	100015346	tipo_conferencia_alterar	\N	controlador.php?acao=tipo_conferencia_alterar	S
100000100	100015347	tipo_conferencia_consultar	\N	controlador.php?acao=tipo_conferencia_consultar	S
100000100	100015348	tipo_conferencia_listar	\N	controlador.php?acao=tipo_conferencia_listar	S
100000100	100015349	tipo_conferencia_excluir	\N	controlador.php?acao=tipo_conferencia_excluir	S
100000100	100015350	tipo_conferencia_desativar	\N	controlador.php?acao=tipo_conferencia_desativar	S
100000100	100015351	tipo_conferencia_reativar	\N	controlador.php?acao=tipo_conferencia_reativar	S
100000100	100015352	gerar_estatisticas_desempenho_processos	\N	controlador.php?acao=gerar_estatisticas_desempenho_processos	S
100000100	100015353	assinatura_verificar	\N	controlador.php?acao=assinatura_verificar	S
100000100	100015354	assinatura_download_p7s	\N	controlador.php?acao=assinatura_download_p7s	S
100000100	100015355	hipotese_legal_cadastrar	\N	controlador.php?acao=hipotese_legal_cadastrar	S
100000100	100015356	hipotese_legal_alterar	\N	controlador.php?acao=hipotese_legal_alterar	S
100000100	100015357	hipotese_legal_consultar	\N	controlador.php?acao=hipotese_legal_consultar	S
100000100	100015358	hipotese_legal_selecionar	\N	controlador.php?acao=hipotese_legal_selecionar	S
100000100	100015359	hipotese_legal_listar	\N	controlador.php?acao=hipotese_legal_listar	S
100000100	100015360	hipotese_legal_excluir	\N	controlador.php?acao=hipotese_legal_excluir	S
100000100	100015361	hipotese_legal_desativar	\N	controlador.php?acao=hipotese_legal_desativar	S
100000100	100015362	hipotese_legal_reativar	\N	controlador.php?acao=hipotese_legal_reativar	S
100000100	100015377	assinatura_digital_ajuda	\N	controlador.php?acao=assinatura_digital_ajuda	S
100000100	100015378	unidade_selecionar_reabertura_processo	\N	controlador.php?acao=unidade_selecionar_reabertura_processo	S
100000100	100015379	editor_imagem_upload	\N	controlador.php?acao=editor_imagem_upload	S
100000100	100015380	imagem_formato_cadastrar	\N	controlador.php?acao=imagem_formato_cadastrar	S
100000100	100015381	imagem_formato_consultar	\N	controlador.php?acao=imagem_formato_consultar	S
100000100	100015382	imagem_formato_listar	\N	controlador.php?acao=imagem_formato_listar	S
100000100	100015383	imagem_formato_alterar	\N	controlador.php?acao=imagem_formato_alterar	S
100000100	100015384	imagem_formato_excluir	\N	controlador.php?acao=imagem_formato_excluir	S
100000100	100015385	imagem_formato_desativar	\N	controlador.php?acao=imagem_formato_desativar	S
100000100	100015386	imagem_formato_reativar	\N	controlador.php?acao=imagem_formato_reativar	S
100000100	100015387	rel_secao_mod_cj_estilos_item_cadastrar	\N	controlador.php?acao=rel_secao_mod_cj_estilos_item_cadastrar	S
100000100	100015388	rel_secao_mod_cj_estilos_item_alterar	\N	controlador.php?acao=rel_secao_mod_cj_estilos_item_alterar	S
100000100	100015389	rel_secao_mod_cj_estilos_item_excluir	\N	controlador.php?acao=rel_secao_mod_cj_estilos_item_excluir	S
100000100	100015390	rel_secao_mod_cj_estilos_item_consultar	\N	controlador.php?acao=rel_secao_mod_cj_estilos_item_consultar	S
100000100	100015391	rel_secao_mod_cj_estilos_item_listar	\N	controlador.php?acao=rel_secao_mod_cj_estilos_item_listar	S
100000100	100015392	secao_modelo_desativar	\N	controlador.php?acao=secao_modelo_desativar	S
100000100	100015393	secao_modelo_reativar	\N	controlador.php?acao=secao_modelo_reativar	S
100000100	100015394	email_utilizado_cadastrar	\N	controlador.php?acao=email_utilizado_cadastrar	S
100000100	100015395	email_utilizado_listar	\N	controlador.php?acao=email_utilizado_listar	S
100000100	100015396	email_utilizado_excluir	\N	controlador.php?acao=email_utilizado_excluir	S
100000100	100015397	procedimento_gerar_zip	\N	controlador.php?acao=procedimento_gerar_zip	S
100000100	100015398	unidade_publicacao_excluir	\N	controlador.php?acao=unidade_publicacao_excluir	S
100000100	100015399	serie_publicacao_excluir	\N	controlador.php?acao=serie_publicacao_excluir	S
100000100	100015400	grupo_unidade_cadastrar	\N	controlador.php?acao=grupo_unidade_cadastrar	S
100000100	100015401	grupo_unidade_alterar	\N	controlador.php?acao=grupo_unidade_alterar	S
100000100	100015402	grupo_unidade_consultar	\N	controlador.php?acao=grupo_unidade_consultar	S
100000100	100015403	grupo_unidade_selecionar	\N	controlador.php?acao=grupo_unidade_selecionar	S
100000100	100015404	grupo_unidade_excluir	\N	controlador.php?acao=grupo_unidade_excluir	S
100000100	100015405	grupo_unidade_listar	\N	controlador.php?acao=grupo_unidade_listar	S
100000100	100015406	rel_grupo_unidade_unidade_cadastrar	\N	controlador.php?acao=rel_grupo_unidade_unidade_cadastrar	S
100000100	100015407	rel_grupo_unidade_unidade_excluir	\N	controlador.php?acao=rel_grupo_unidade_unidade_excluir	S
100000100	100015408	rel_grupo_unidade_unidade_listar	\N	controlador.php?acao=rel_grupo_unidade_unidade_listar	S
100000100	100015409	grupo_unidade_institucional_cadastrar	\N	controlador.php?acao=grupo_unidade_institucional_cadastrar	S
100000100	100015410	grupo_unidade_institucional_consultar	\N	controlador.php?acao=grupo_unidade_institucional_consultar	S
100000100	100015411	grupo_unidade_institucional_listar	\N	controlador.php?acao=grupo_unidade_institucional_listar	S
100000100	100015412	grupo_unidade_institucional_selecionar	\N	controlador.php?acao=grupo_unidade_institucional_selecionar	S
100000100	100015413	grupo_unidade_institucional_alterar	\N	controlador.php?acao=grupo_unidade_institucional_alterar	S
100000100	100015414	grupo_unidade_institucional_excluir	\N	controlador.php?acao=grupo_unidade_institucional_excluir	S
100000100	100015415	grupo_unidade_institucional_desativar	\N	controlador.php?acao=grupo_unidade_institucional_desativar	S
100000100	100015416	grupo_unidade_institucional_reativar	\N	controlador.php?acao=grupo_unidade_institucional_reativar	S
100000100	100015417	unidade_tramitacao_selecionar	\N	controlador.php?acao=unidade_tramitacao_selecionar	S
100000100	100015418	email_encaminhar	\N	controlador.php?acao=email_encaminhar	S
100000100	100015419	procedimento_escolher_tipo_relacionado	\N	controlador.php?acao=procedimento_escolher_tipo_relacionado	S
100000100	100015420	procedimento_gerar_relacionado	\N	controlador.php?acao=procedimento_gerar_relacionado	S
100000100	100015421	responder_formulario	\N	controlador.php?acao=responder_formulario	S
100000100	100015422	documento_gerar_multiplo	\N	controlador.php?acao=documento_gerar_multiplo	S
100000100	100015423	situacao_cadastrar	\N	controlador.php?acao=situacao_cadastrar	S
100000100	100015424	situacao_alterar	\N	controlador.php?acao=situacao_alterar	S
100000100	100015425	situacao_consultar	\N	controlador.php?acao=situacao_consultar	S
100000100	100015426	situacao_listar	\N	controlador.php?acao=situacao_listar	S
100000100	100015427	situacao_desativar	\N	controlador.php?acao=situacao_desativar	S
100000100	100015428	situacao_reativar	\N	controlador.php?acao=situacao_reativar	S
100000100	100015429	situacao_excluir	\N	controlador.php?acao=situacao_excluir	S
100000100	100015430	andamento_situacao_lancar	\N	controlador.php?acao=andamento_situacao_lancar	S
100000100	100015431	andamento_situacao_consultar	\N	controlador.php?acao=andamento_situacao_consultar	S
100000100	100015432	andamento_situacao_listar	\N	controlador.php?acao=andamento_situacao_listar	S
100000100	100015433	andamento_situacao_excluir	\N	controlador.php?acao=andamento_situacao_excluir	S
100000100	100015442	rel_situacao_unidade_cadastrar	\N	controlador.php?acao=rel_situacao_unidade_cadastrar	S
100000100	100015443	rel_situacao_unidade_consultar	\N	controlador.php?acao=rel_situacao_unidade_consultar	S
100000100	100015444	rel_situacao_unidade_listar	\N	controlador.php?acao=rel_situacao_unidade_listar	S
100000100	100015445	rel_situacao_unidade_excluir	\N	controlador.php?acao=rel_situacao_unidade_excluir	S
100000100	100015446	andamento_situacao_gerenciar	\N	controlador.php?acao=andamento_situacao_gerenciar	S
100000100	100015447	controle_unidade_gerar_grafico	\N	controlador.php?acao=controle_unidade_gerar_grafico	S
100000100	100015448	controle_unidade_listar	\N	controlador.php?acao=controle_unidade_listar	S
100000100	100015449	controle_unidade_detalhar	\N	controlador.php?acao=controle_unidade_detalhar	S
100000100	100015450	controle_unidade_gerar	\N	controlador.php?acao=controle_unidade_gerar	S
100000100	100015453	procedimento_credencial_cancelar	\N	controlador.php?acao=procedimento_credencial_cancelar	S
100000100	100015454	procedimento_credencial_ativar	\N	controlador.php?acao=procedimento_credencial_ativar	S
100000100	100015455	procedimento_acervo_sigilosos_unidade	\N	controlador.php?acao=procedimento_acervo_sigilosos_unidade	S
100000100	100015456	modulo_listar	\N	controlador.php?acao=modulo_listar	S
100000100	100015457	infra_atributo_cache_consultar	\N	controlador.php?acao=infra_atributo_cache_consultar	S
100000100	100015458	infra_atributo_cache_excluir	\N	controlador.php?acao=infra_atributo_cache_excluir	S
100000100	100015459	infra_atributo_cache_listar	\N	controlador.php?acao=infra_atributo_cache_listar	S
100000100	100015460	email_utilizado_consultar	\N	controlador.php?acao=email_utilizado_consultar	S
100000100	100015461	nivel_acesso_permitido_consultar	\N	controlador.php?acao=nivel_acesso_permitido_consultar	S
100000100	100015462	tipo_procedimento_escolha_consultar	\N	controlador.php?acao=tipo_procedimento_escolha_consultar	S
100000100	100015463	serie_escolha_consultar	\N	controlador.php?acao=serie_escolha_consultar	S
100000100	100015464	acesso_consultar	\N	controlador.php?acao=acesso_consultar	S
100000100	100015465	procedimento_pesquisar	\N	controlador.php?acao=procedimento_pesquisar	S
100000100	100015466	acesso_externo_protocolo_selecionar	\N	controlador.php?acao=acesso_externo_protocolo_selecionar	S
100000100	100015467	acesso_externo_protocolo_detalhe	\N	controlador.php?acao=acesso_externo_protocolo_detalhe	S
100000100	100015468	rel_acesso_ext_protocolo_cadastrar	\N	controlador.php?acao=rel_acesso_ext_protocolo_cadastrar	S
100000100	100015469	rel_acesso_ext_protocolo_consultar	\N	controlador.php?acao=rel_acesso_ext_protocolo_consultar	S
100000100	100015470	rel_acesso_ext_protocolo_listar	\N	controlador.php?acao=rel_acesso_ext_protocolo_listar	S
100000100	100015471	rel_acesso_ext_protocolo_excluir	\N	controlador.php?acao=rel_acesso_ext_protocolo_excluir	S
100000100	100015472	tipo_formulario_listar	\N	controlador.php?acao=tipo_formulario_listar	S
100000100	100015473	tipo_formulario_consultar	\N	controlador.php?acao=tipo_formulario_consultar	S
100000100	100015474	tipo_formulario_cadastrar	\N	controlador.php?acao=tipo_formulario_cadastrar	S
100000100	100015475	tipo_formulario_alterar	\N	controlador.php?acao=tipo_formulario_alterar	S
100000100	100015476	tipo_formulario_excluir	\N	controlador.php?acao=tipo_formulario_excluir	S
100000100	100015477	tipo_formulario_desativar	\N	controlador.php?acao=tipo_formulario_desativar	S
100000100	100015478	tipo_formulario_reativar	\N	controlador.php?acao=tipo_formulario_reativar	S
100000100	100015479	tipo_formulario_visualizar	\N	controlador.php?acao=tipo_formulario_visualizar	S
100000100	100015480	tipo_formulario_clonar	\N	controlador.php?acao=tipo_formulario_clonar	S
100000100	100015481	rel_protocolo_atributo_alterar	\N	controlador.php?acao=rel_protocolo_atributo_alterar	S
100000100	100015482	documento_gerar_circular	\N	controlador.php?acao=documento_gerar_circular	S
100000100	100015483	documento_email_circular	\N	controlador.php?acao=documento_email_circular	S
100000100	100015484	email_enviar_circular	\N	controlador.php?acao=email_enviar_circular	S
100000100	100015485	grupo_contato_institucional_alterar	\N	controlador.php?acao=grupo_contato_institucional_alterar	S
100000100	100015486	grupo_contato_institucional_cadastrar	\N	controlador.php?acao=grupo_contato_institucional_cadastrar	S
100000100	100015487	grupo_contato_institucional_desativar	\N	controlador.php?acao=grupo_contato_institucional_desativar	S
100000100	100015488	grupo_contato_institucional_excluir	\N	controlador.php?acao=grupo_contato_institucional_excluir	S
100000100	100015489	grupo_contato_institucional_reativar	\N	controlador.php?acao=grupo_contato_institucional_reativar	S
100000100	100015490	grupo_contato_institucional_consultar	\N	controlador.php?acao=grupo_contato_institucional_consultar	S
100000100	100015491	grupo_contato_institucional_listar	\N	controlador.php?acao=grupo_contato_institucional_listar	S
100000100	100015492	grupo_contato_institucional_selecionar	\N	controlador.php?acao=grupo_contato_institucional_selecionar	S
100000100	100015493	monitoramento_servico_listar	\N	controlador.php?acao=monitoramento_servico_listar	S
100000100	100015494	monitoramento_servico_excluir	\N	controlador.php?acao=monitoramento_servico_excluir	S
100000100	100015495	contato_definir	\N	controlador.php?acao=contato_definir	S
100000100	100015496	formulario_gerar	\N	controlador.php?acao=formulario_gerar	S
100000100	100015497	formulario_alterar	\N	controlador.php?acao=formulario_alterar	S
100000100	100015498	formulario_consultar	\N	controlador.php?acao=formulario_consultar	S
100000100	100015499	marcador_cadastrar	\N	controlador.php?acao=marcador_cadastrar	S
100000100	100015500	marcador_alterar	\N	controlador.php?acao=marcador_alterar	S
100000100	100015501	marcador_consultar	\N	controlador.php?acao=marcador_consultar	S
100000100	100015502	marcador_listar	\N	controlador.php?acao=marcador_listar	S
100000100	100015503	marcador_excluir	\N	controlador.php?acao=marcador_excluir	S
100000100	100015504	marcador_desativar	\N	controlador.php?acao=marcador_desativar	S
100000100	100015505	marcador_reativar	\N	controlador.php?acao=marcador_reativar	S
100000100	100015506	andamento_marcador_gerenciar	\N	controlador.php?acao=andamento_marcador_gerenciar	S
100000100	100015507	andamento_marcador_consultar	\N	controlador.php?acao=andamento_marcador_consultar	S
100000100	100015508	andamento_marcador_listar	\N	controlador.php?acao=andamento_marcador_listar	S
100000100	100015509	andamento_marcador_excluir	\N	controlador.php?acao=andamento_marcador_excluir	S
100000100	100015510	usuario_validar_acesso	\N	controlador.php?acao=usuario_validar_acesso	S
100000100	100015511	serie_restricao_cadastrar	\N	controlador.php?acao=serie_restricao_cadastrar	S
100000100	100015512	serie_restricao_consultar	\N	controlador.php?acao=serie_restricao_consultar	S
100000100	100015513	serie_restricao_listar	\N	controlador.php?acao=serie_restricao_listar	S
100000100	100015514	serie_restricao_excluir	\N	controlador.php?acao=serie_restricao_excluir	S
100000100	100015515	tipo_proced_restricao_cadastrar	\N	controlador.php?acao=tipo_proced_restricao_cadastrar	S
100000100	100015516	tipo_proced_restricao_consultar	\N	controlador.php?acao=tipo_proced_restricao_consultar	S
100000100	100015517	tipo_proced_restricao_listar	\N	controlador.php?acao=tipo_proced_restricao_listar	S
100000100	100015518	tipo_proced_restricao_excluir	\N	controlador.php?acao=tipo_proced_restricao_excluir	S
100000100	100015519	assunto_proxy_cadastrar	\N	controlador.php?acao=assunto_proxy_cadastrar	S
100000100	100015520	assunto_proxy_alterar	\N	controlador.php?acao=assunto_proxy_alterar	S
100000100	100015521	assunto_proxy_excluir	\N	controlador.php?acao=assunto_proxy_excluir	S
100000100	100015522	assunto_proxy_consultar	\N	controlador.php?acao=assunto_proxy_consultar	S
100000100	100015523	assunto_proxy_listar	\N	controlador.php?acao=assunto_proxy_listar	S
100000100	100015524	tabela_assuntos_ativar	\N	controlador.php?acao=tabela_assuntos_ativar	S
100000100	100015525	tabela_assuntos_cadastrar	\N	controlador.php?acao=tabela_assuntos_cadastrar	S
100000100	100015526	tabela_assuntos_alterar	\N	controlador.php?acao=tabela_assuntos_alterar	S
100000100	100015527	tabela_assuntos_excluir	\N	controlador.php?acao=tabela_assuntos_excluir	S
100000100	100015528	tabela_assuntos_consultar	\N	controlador.php?acao=tabela_assuntos_consultar	S
100000100	100015529	tabela_assuntos_listar	\N	controlador.php?acao=tabela_assuntos_listar	S
100000100	100015530	procedimento_bloquear	\N	controlador.php?acao=procedimento_bloquear	S
100000100	100015531	procedimento_desbloquear	\N	controlador.php?acao=procedimento_desbloquear	S
100000100	100015532	unidade_selecionar_orgao	\N	controlador.php?acao=unidade_selecionar_orgao	S
100000100	100015533	rel_tipo_procedimento_assunto_consultar	\N	controlador.php?acao=rel_tipo_procedimento_assunto_consultar	S
100000100	100015534	rel_serie_assunto_consultar	\N	controlador.php?acao=rel_serie_assunto_consultar	S
100000100	100015535	mapeamento_assunto_gerenciar	\N	controlador.php?acao=mapeamento_assunto_gerenciar	S
100000100	100015536	mapeamento_assunto_cadastrar	\N	controlador.php?acao=mapeamento_assunto_cadastrar	S
100000100	100015537	mapeamento_assunto_excluir	\N	controlador.php?acao=mapeamento_assunto_excluir	S
100000100	100015538	mapeamento_assunto_consultar	\N	controlador.php?acao=mapeamento_assunto_consultar	S
100000100	100015539	mapeamento_assunto_listar	\N	controlador.php?acao=mapeamento_assunto_listar	S
100000100	100015540	arquivamento_excluir	\N	controlador.php?acao=arquivamento_excluir	S
100000100	100015541	arquivamento_consultar	\N	controlador.php?acao=arquivamento_consultar	S
100000100	100015542	gerar_estatisticas_arquivamento	\N	controlador.php?acao=gerar_estatisticas_arquivamento	S
100000100	100015543	estatisticas_detalhar_arquivamento	\N	controlador.php?acao=estatisticas_detalhar_arquivamento	S
100000100	100015544	documento_cancelar	\N	controlador.php?acao=documento_cancelar	S
100000100	100015545	documento_versao_comparar	\N	controlador.php?acao=documento_versao_comparar	S
100000100	100015546	ajuda_variaveis_secao_modelo	\N	controlador.php?acao=ajuda_variaveis_secao_modelo	S
100000100	100015547	ajuda_variaveis_tarjas	\N	controlador.php?acao=ajuda_variaveis_tarjas	S
100000100	100015548	ajuda_variaveis_email_sistema	\N	controlador.php?acao=ajuda_variaveis_email_sistema	S
100000100	100015549	unidade_migrar	\N	controlador.php?acao=unidade_migrar	S
100000100	100015550	estatisticas_grafico_exibir	\N	controlador.php?acao=estatisticas_grafico_exibir	S
100000100	100015553	anexo_download	\N	controlador.php?acao=anexo_download	S
100000100	100015584	acompanhamento_gerenciar	\N	controlador.php?acao=acompanhamento_gerenciar	S
100000100	100015585	acompanhamento_selecionar	\N	controlador.php?acao=acompanhamento_selecionar	S
100000100	100015657	bloco_navegar	\N	controlador.php?acao=bloco_navegar	S
100000100	100015586	acompanhamento_alterar_grupo	\N	controlador.php?acao=acompanhamento_alterar_grupo	S
100000100	100015587	andamento_marcador_alterar	\N	controlador.php?acao=andamento_marcador_alterar	S
100000100	100015588	andamento_marcador_cadastrar	\N	controlador.php?acao=andamento_marcador_cadastrar	S
100000100	100015589	andamento_marcador_remover	\N	controlador.php?acao=andamento_marcador_remover	S
100000100	100015590	marcador_selecionar	\N	controlador.php?acao=marcador_selecionar	S
100000100	100015591	painel_controle_configurar	\N	controlador.php?acao=painel_controle_configurar	S
100000100	100015592	painel_controle_visualizar	\N	controlador.php?acao=painel_controle_visualizar	S
100000100	100015593	procedimento_configurar_detalhe	\N	controlador.php?acao=procedimento_configurar_detalhe	S
100000100	100015594	rel_usuario_marcador_cadastrar	\N	controlador.php?acao=rel_usuario_marcador_cadastrar	S
100000100	100015595	rel_usuario_marcador_configurar	\N	controlador.php?acao=rel_usuario_marcador_configurar	S
100000100	100015596	rel_usuario_marcador_excluir	\N	controlador.php?acao=rel_usuario_marcador_excluir	S
100000100	100015597	rel_usuario_marcador_listar	\N	controlador.php?acao=rel_usuario_marcador_listar	S
100000100	100015598	rel_usuario_marcador_selecionar	\N	controlador.php?acao=rel_usuario_marcador_selecionar	S
100000100	100015599	rel_usuario_grupo_acomp_cadastrar	\N	controlador.php?acao=rel_usuario_grupo_acomp_cadastrar	S
100000100	100015600	rel_usuario_grupo_acomp_configurar	\N	controlador.php?acao=rel_usuario_grupo_acomp_configurar	S
100000100	100015601	rel_usuario_grupo_acomp_excluir	\N	controlador.php?acao=rel_usuario_grupo_acomp_excluir	S
100000100	100015602	rel_usuario_grupo_acomp_listar	\N	controlador.php?acao=rel_usuario_grupo_acomp_listar	S
100000100	100015603	rel_usuario_grupo_acomp_selecionar	\N	controlador.php?acao=rel_usuario_grupo_acomp_selecionar	S
100000100	100015604	rel_usuario_usuario_unidade_cadastrar	\N	controlador.php?acao=rel_usuario_usuario_unidade_cadastrar	S
100000100	100015605	rel_usuario_usuario_unidade_configurar	\N	controlador.php?acao=rel_usuario_usuario_unidade_configurar	S
100000100	100015606	rel_usuario_usuario_unidade_excluir	\N	controlador.php?acao=rel_usuario_usuario_unidade_excluir	S
100000100	100015607	rel_usuario_usuario_unidade_listar	\N	controlador.php?acao=rel_usuario_usuario_unidade_listar	S
100000100	100015608	rel_usuario_usuario_unidade_selecionar	\N	controlador.php?acao=rel_usuario_usuario_unidade_selecionar	S
100000100	100015609	rel_usuario_tipo_proced_cadastrar	\N	controlador.php?acao=rel_usuario_tipo_proced_cadastrar	S
100000100	100015610	rel_usuario_tipo_proced_configurar	\N	controlador.php?acao=rel_usuario_tipo_proced_configurar	S
100000100	100015611	rel_usuario_tipo_proced_excluir	\N	controlador.php?acao=rel_usuario_tipo_proced_excluir	S
100000100	100015612	rel_usuario_tipo_proced_listar	\N	controlador.php?acao=rel_usuario_tipo_proced_listar	S
100000100	100015613	rel_usuario_tipo_proced_selecionar	\N	controlador.php?acao=rel_usuario_tipo_proced_selecionar	S
100000100	100015614	arquivamento_cancelar	\N	controlador.php?acao=arquivamento_cancelar	S
100000100	100015615	orgao_historico_alterar	\N	controlador.php?acao=orgao_historico_alterar	S
100000100	100015616	orgao_historico_cadastrar	\N	controlador.php?acao=orgao_historico_cadastrar	S
100000100	100015617	orgao_historico_excluir	\N	controlador.php?acao=orgao_historico_excluir	S
100000100	100015618	unidade_historico_alterar	\N	controlador.php?acao=unidade_historico_alterar	S
100000100	100015619	unidade_historico_cadastrar	\N	controlador.php?acao=unidade_historico_cadastrar	S
100000100	100015620	unidade_historico_excluir	\N	controlador.php?acao=unidade_historico_excluir	S
100000100	100015621	orgao_historico_consultar	\N	controlador.php?acao=orgao_historico_consultar	S
100000100	100015622	orgao_historico_listar	\N	controlador.php?acao=orgao_historico_listar	S
100000100	100015623	unidade_historico_consultar	\N	controlador.php?acao=unidade_historico_consultar	S
100000100	100015624	unidade_historico_listar	\N	controlador.php?acao=unidade_historico_listar	S
100000100	100015625	titulo_listar	\N	controlador.php?acao=titulo_listar	S
100000100	100015626	titulo_consultar	\N	controlador.php?acao=titulo_consultar	S
100000100	100015627	titulo_cadastrar	\N	controlador.php?acao=titulo_cadastrar	S
100000100	100015628	titulo_alterar	\N	controlador.php?acao=titulo_alterar	S
100000100	100015629	titulo_excluir	\N	controlador.php?acao=titulo_excluir	S
100000100	100015630	titulo_desativar	\N	controlador.php?acao=titulo_desativar	S
100000100	100015631	titulo_reativar	\N	controlador.php?acao=titulo_reativar	S
100000100	100015632	titulo_selecionar	\N	controlador.php?acao=titulo_selecionar	S
100000100	100015633	contato_gerar_relatorios	\N	controlador.php?acao=contato_gerar_relatorios	S
100000100	100015634	editor_simular	\N	controlador.php?acao=editor_simular	S
100000100	100015635	controle_prazo_definir	\N	controlador.php?acao=controle_prazo_definir	S
100000100	100015636	controle_prazo_concluir	\N	controlador.php?acao=controle_prazo_concluir	S
100000100	100015637	controle_prazo_cadastrar	\N	controlador.php?acao=controle_prazo_cadastrar	S
100000100	100015638	controle_prazo_alterar	\N	controlador.php?acao=controle_prazo_alterar	S
100000100	100015639	controle_prazo_excluir	\N	controlador.php?acao=controle_prazo_excluir	S
100000100	100015640	controle_prazo_consultar	\N	controlador.php?acao=controle_prazo_consultar	S
100000100	100015641	controle_prazo_listar	\N	controlador.php?acao=controle_prazo_listar	S
100000100	100015642	comentario_cadastrar	\N	controlador.php?acao=comentario_cadastrar	S
100000100	100015643	comentario_alterar	\N	controlador.php?acao=comentario_alterar	S
100000100	100015644	comentario_listar	\N	controlador.php?acao=comentario_listar	S
100000100	100015645	comentario_consultar	\N	controlador.php?acao=comentario_consultar	S
100000100	100015646	comentario_excluir	\N	controlador.php?acao=comentario_excluir	S
100000100	100015647	infra_acesso_usuario_listar	\N	controlador.php?acao=infra_acesso_usuario_listar	S
100000100	100015648	categoria_consultar	\N	controlador.php?acao=categoria_consultar	S
100000100	100015649	categoria_listar	\N	controlador.php?acao=categoria_listar	S
100000100	100015650	categoria_cadastrar	\N	controlador.php?acao=categoria_cadastrar	S
100000100	100015651	categoria_alterar	\N	controlador.php?acao=categoria_alterar	S
100000100	100015652	categoria_excluir	\N	controlador.php?acao=categoria_excluir	S
100000100	100015653	categoria_desativar	\N	controlador.php?acao=categoria_desativar	S
100000100	100015654	categoria_reativar	\N	controlador.php?acao=categoria_reativar	S
100000100	100015655	procedimento_credencial_renovar	\N	controlador.php?acao=procedimento_credencial_renovar	S
100000100	100015656	protocolo_modelo_gerenciar	\N	controlador.php?acao=protocolo_modelo_gerenciar	S
100000100	100015658	bloco_priorizar	\N	controlador.php?acao=bloco_priorizar	S
100000100	100015659	bloco_revisar	\N	controlador.php?acao=bloco_revisar	S
100000100	100015660	bloco_atribuir	\N	controlador.php?acao=bloco_atribuir	S
100000100	100015661	bloco_comentar	\N	controlador.php?acao=bloco_comentar	S
100000100	100015662	rel_acesso_ext_serie_cadastrar	\N	controlador.php?acao=rel_acesso_ext_serie_cadastrar	S
100000100	100015663	rel_acesso_ext_serie_consultar	\N	controlador.php?acao=rel_acesso_ext_serie_consultar	S
100000100	100015664	rel_acesso_ext_serie_excluir	\N	controlador.php?acao=rel_acesso_ext_serie_excluir	S
100000100	100015665	rel_acesso_ext_serie_listar	\N	controlador.php?acao=rel_acesso_ext_serie_listar	S
100000100	100015666	rel_acesso_ext_serie_detalhar	\N	controlador.php?acao=rel_acesso_ext_serie_detalhar	S
100000100	100015667	grupo_bloco_cadastrar	\N	controlador.php?acao=grupo_bloco_cadastrar	S
100000100	100015668	grupo_bloco_alterar	\N	controlador.php?acao=grupo_bloco_alterar	S
100000100	100015669	grupo_bloco_consultar	\N	controlador.php?acao=grupo_bloco_consultar	S
100000100	100015670	grupo_bloco_excluir	\N	controlador.php?acao=grupo_bloco_excluir	S
100000100	100015671	grupo_bloco_listar	\N	controlador.php?acao=grupo_bloco_listar	S
100000100	100015672	grupo_bloco_desativar	\N	controlador.php?acao=grupo_bloco_desativar	S
100000100	100015673	grupo_bloco_reativar	\N	controlador.php?acao=grupo_bloco_reativar	S
100000100	100015674	bloco_alterar_grupo	\N	controlador.php?acao=bloco_alterar_grupo	S
100000100	100015675	rel_usuario_grupo_bloco_cadastrar	\N	controlador.php?acao=rel_usuario_grupo_bloco_cadastrar	S
100000100	100015676	rel_usuario_grupo_bloco_configurar	\N	controlador.php?acao=rel_usuario_grupo_bloco_configurar	S
100000100	100015677	rel_usuario_grupo_bloco_excluir	\N	controlador.php?acao=rel_usuario_grupo_bloco_excluir	S
100000100	100015678	rel_usuario_grupo_bloco_listar	\N	controlador.php?acao=rel_usuario_grupo_bloco_listar	S
100000100	100015679	rel_usuario_grupo_bloco_selecionar	\N	controlador.php?acao=rel_usuario_grupo_bloco_selecionar	S
100000100	100015680	serie_selecionar_acesso_externo	\N	controlador.php?acao=serie_selecionar_acesso_externo	S
100000100	100015681	servico_gerar_chave_acesso	\N	controlador.php?acao=servico_gerar_chave_acesso	S
100000100	100015682	instalacao_federacao_listar	\N	controlador.php?acao=instalacao_federacao_listar	S
100000100	100015683	instalacao_federacao_consultar	\N	controlador.php?acao=instalacao_federacao_consultar	S
100000100	100015684	instalacao_federacao_cadastrar	\N	controlador.php?acao=instalacao_federacao_cadastrar	S
100000100	100015685	instalacao_federacao_alterar	\N	controlador.php?acao=instalacao_federacao_alterar	S
100000100	100015686	instalacao_federacao_excluir	\N	controlador.php?acao=instalacao_federacao_excluir	S
100000100	100015687	instalacao_federacao_desativar	\N	controlador.php?acao=instalacao_federacao_desativar	S
100000100	100015688	instalacao_federacao_reativar	\N	controlador.php?acao=instalacao_federacao_reativar	S
100000100	100015689	instalacao_federacao_liberar	\N	controlador.php?acao=instalacao_federacao_liberar	S
100000100	100015690	instalacao_federacao_bloquear	\N	controlador.php?acao=instalacao_federacao_bloquear	S
100000100	100015691	instalacao_federacao_selecionar	\N	controlador.php?acao=instalacao_federacao_selecionar	S
100000100	100015692	instalacao_federacao_verificar_conexao	\N	controlador.php?acao=instalacao_federacao_verificar_conexao	S
100000100	100015693	andamento_instalacao_cadastrar	\N	controlador.php?acao=andamento_instalacao_cadastrar	S
100000100	100015694	andamento_instalacao_excluir	\N	controlador.php?acao=andamento_instalacao_excluir	S
100000100	100015695	andamento_instalacao_listar	\N	controlador.php?acao=andamento_instalacao_listar	S
100000100	100015696	andamento_instalacao_consultar	\N	controlador.php?acao=andamento_instalacao_consultar	S
100000100	100015697	acesso_federacao_cadastrar	\N	controlador.php?acao=acesso_federacao_cadastrar	S
100000100	100015698	acesso_federacao_alterar	\N	controlador.php?acao=acesso_federacao_alterar	S
100000100	100015699	acesso_federacao_consultar	\N	controlador.php?acao=acesso_federacao_consultar	S
100000100	100015700	acesso_federacao_listar	\N	controlador.php?acao=acesso_federacao_listar	S
100000100	100015701	acesso_federacao_excluir	\N	controlador.php?acao=acesso_federacao_excluir	S
100000100	100015702	acesso_federacao_gerenciar	\N	controlador.php?acao=acesso_federacao_gerenciar	S
100000100	100015703	acesso_federacao_enviar	\N	controlador.php?acao=acesso_federacao_enviar	S
100000100	100015704	acesso_federacao_cancelar	\N	controlador.php?acao=acesso_federacao_cancelar	S
100000100	100015705	acesso_federacao_desativar	\N	controlador.php?acao=acesso_federacao_desativar	S
100000100	100015706	acesso_federacao_reativar	\N	controlador.php?acao=acesso_federacao_reativar	S
100000100	100015707	tarefa_instalacao_listar	\N	controlador.php?acao=tarefa_instalacao_listar	S
100000100	100015708	tarefa_instalacao_consultar	\N	controlador.php?acao=tarefa_instalacao_consultar	S
100000100	100015709	atributo_instalacao_cadastrar	\N	controlador.php?acao=atributo_instalacao_cadastrar	S
100000100	100015710	atributo_instalacao_listar	\N	controlador.php?acao=atributo_instalacao_listar	S
100000100	100015711	atributo_instalacao_consultar	\N	controlador.php?acao=atributo_instalacao_consultar	S
100000100	100015712	atributo_instalacao_excluir	\N	controlador.php?acao=atributo_instalacao_excluir	S
100000100	100015713	orgao_federacao_cadastrar	\N	controlador.php?acao=orgao_federacao_cadastrar	S
100000100	100015714	orgao_federacao_alterar	\N	controlador.php?acao=orgao_federacao_alterar	S
100000100	100015715	orgao_federacao_excluir	\N	controlador.php?acao=orgao_federacao_excluir	S
100000100	100015716	orgao_federacao_consultar	\N	controlador.php?acao=orgao_federacao_consultar	S
100000100	100015717	orgao_federacao_listar	\N	controlador.php?acao=orgao_federacao_listar	S
100000100	100015718	orgao_federacao_selecionar	\N	controlador.php?acao=orgao_federacao_selecionar	S
100000100	100015719	orgao_federacao_desativar	\N	controlador.php?acao=orgao_federacao_desativar	S
100000100	100015720	orgao_federacao_reativar	\N	controlador.php?acao=orgao_federacao_reativar	S
100000100	100015721	unidade_federacao_cadastrar	\N	controlador.php?acao=unidade_federacao_cadastrar	S
100000100	100015722	unidade_federacao_alterar	\N	controlador.php?acao=unidade_federacao_alterar	S
100000100	100015723	unidade_federacao_excluir	\N	controlador.php?acao=unidade_federacao_excluir	S
100000100	100015724	unidade_federacao_consultar	\N	controlador.php?acao=unidade_federacao_consultar	S
100000100	100015725	unidade_federacao_listar	\N	controlador.php?acao=unidade_federacao_listar	S
100000100	100015726	unidade_federacao_selecionar	\N	controlador.php?acao=unidade_federacao_selecionar	S
100000100	100015727	unidade_federacao_desativar	\N	controlador.php?acao=unidade_federacao_desativar	S
100000100	100015728	unidade_federacao_reativar	\N	controlador.php?acao=unidade_federacao_reativar	S
100000100	100015729	usuario_federacao_cadastrar	\N	controlador.php?acao=usuario_federacao_cadastrar	S
100000100	100015730	usuario_federacao_alterar	\N	controlador.php?acao=usuario_federacao_alterar	S
100000100	100015731	usuario_federacao_excluir	\N	controlador.php?acao=usuario_federacao_excluir	S
100000100	100015732	usuario_federacao_consultar	\N	controlador.php?acao=usuario_federacao_consultar	S
100000100	100015733	usuario_federacao_listar	\N	controlador.php?acao=usuario_federacao_listar	S
100000100	100015734	usuario_federacao_selecionar	\N	controlador.php?acao=usuario_federacao_selecionar	S
100000100	100015735	usuario_federacao_desativar	\N	controlador.php?acao=usuario_federacao_desativar	S
100000100	100015736	usuario_federacao_reativar	\N	controlador.php?acao=usuario_federacao_reativar	S
100000100	100015737	protocolo_federacao_cadastrar	\N	controlador.php?acao=protocolo_federacao_cadastrar	S
100000100	100015738	protocolo_federacao_alterar	\N	controlador.php?acao=protocolo_federacao_alterar	S
100000100	100015739	protocolo_federacao_excluir	\N	controlador.php?acao=protocolo_federacao_excluir	S
100000100	100015740	protocolo_federacao_consultar	\N	controlador.php?acao=protocolo_federacao_consultar	S
100000100	100015741	protocolo_federacao_listar	\N	controlador.php?acao=protocolo_federacao_listar	S
100000100	100015742	protocolo_federacao_selecionar	\N	controlador.php?acao=protocolo_federacao_selecionar	S
100000100	100015743	acao_federacao_cadastrar	\N	controlador.php?acao=acao_federacao_cadastrar	S
100000100	100015744	acao_federacao_alterar	\N	controlador.php?acao=acao_federacao_alterar	S
100000100	100015745	acao_federacao_excluir	\N	controlador.php?acao=acao_federacao_excluir	S
100000100	100015746	acao_federacao_consultar	\N	controlador.php?acao=acao_federacao_consultar	S
100000100	100015747	acao_federacao_listar	\N	controlador.php?acao=acao_federacao_listar	S
100000100	100015748	acao_federacao_desativar	\N	controlador.php?acao=acao_federacao_desativar	S
100000100	100015749	parametro_acao_federacao_cadastrar	\N	controlador.php?acao=parametro_acao_federacao_cadastrar	S
100000100	100015750	parametro_acao_federacao_excluir	\N	controlador.php?acao=parametro_acao_federacao_excluir	S
100000100	100015751	parametro_acao_federacao_consultar	\N	controlador.php?acao=parametro_acao_federacao_consultar	S
100000100	100015752	parametro_acao_federacao_listar	\N	controlador.php?acao=parametro_acao_federacao_listar	S
100000100	100015753	processo_consulta_federacao	\N	controlador.php?acao=processo_consulta_federacao	S
100000100	100015754	documento_consulta_federacao	\N	controlador.php?acao=documento_consulta_federacao	S
100000100	100015755	andamentos_consulta_federacao	\N	controlador.php?acao=andamentos_consulta_federacao	S
100000100	100015756	grupo_federacao_cadastrar	\N	controlador.php?acao=grupo_federacao_cadastrar	S
100000100	100015757	grupo_federacao_alterar	\N	controlador.php?acao=grupo_federacao_alterar	S
100000100	100015758	grupo_federacao_consultar	\N	controlador.php?acao=grupo_federacao_consultar	S
100000100	100015759	grupo_federacao_excluir	\N	controlador.php?acao=grupo_federacao_excluir	S
100000100	100015760	grupo_federacao_listar	\N	controlador.php?acao=grupo_federacao_listar	S
100000100	100015761	grupo_federacao_selecionar	\N	controlador.php?acao=grupo_federacao_selecionar	S
100000100	100015762	grupo_federacao_institucional_cadastrar	\N	controlador.php?acao=grupo_federacao_institucional_cadastrar	S
100000100	100015763	grupo_federacao_institucional_alterar	\N	controlador.php?acao=grupo_federacao_institucional_alterar	S
100000100	100015764	grupo_federacao_institucional_consultar	\N	controlador.php?acao=grupo_federacao_institucional_consultar	S
100000100	100015765	grupo_federacao_institucional_excluir	\N	controlador.php?acao=grupo_federacao_institucional_excluir	S
100000100	100015766	grupo_federacao_institucional_listar	\N	controlador.php?acao=grupo_federacao_institucional_listar	S
100000100	100015767	grupo_federacao_institucional_desativar	\N	controlador.php?acao=grupo_federacao_institucional_desativar	S
100000100	100015768	grupo_federacao_institucional_reativar	\N	controlador.php?acao=grupo_federacao_institucional_reativar	S
100000100	100015769	grupo_federacao_institucional_selecionar	\N	controlador.php?acao=grupo_federacao_institucional_selecionar	S
100000100	100015770	rel_grupo_fed_orgao_fed_cadastrar	\N	controlador.php?acao=rel_grupo_fed_orgao_fed_cadastrar	S
100000100	100015771	rel_grupo_fed_orgao_fed_excluir	\N	controlador.php?acao=rel_grupo_fed_orgao_fed_excluir	S
100000100	100015772	rel_grupo_fed_orgao_fed_listar	\N	controlador.php?acao=rel_grupo_fed_orgao_fed_listar	S
100000100	100015773	rel_grupo_fed_orgao_fed_selecionar	\N	controlador.php?acao=rel_grupo_fed_orgao_fed_selecionar	S
100000100	100015774	sinalizacao_federacao_cadastrar	\N	controlador.php?acao=sinalizacao_federacao_cadastrar	S
100000100	100015775	sinalizacao_federacao_alterar	\N	controlador.php?acao=sinalizacao_federacao_alterar	S
100000100	100015776	sinalizacao_federacao_consultar	\N	controlador.php?acao=sinalizacao_federacao_consultar	S
100000100	100015777	sinalizacao_federacao_excluir	\N	controlador.php?acao=sinalizacao_federacao_excluir	S
100000100	100015778	sinalizacao_federacao_listar	\N	controlador.php?acao=sinalizacao_federacao_listar	S
100000100	100015779	rel_sinalizacao_fed_unidade_cadastrar	\N	controlador.php?acao=rel_sinalizacao_fed_unidade_cadastrar	S
100000100	100015780	rel_sinalizacao_fed_unidade_alterar	\N	controlador.php?acao=rel_sinalizacao_fed_unidade_alterar	S
100000100	100015781	rel_sinalizacao_fed_unidade_consultar	\N	controlador.php?acao=rel_sinalizacao_fed_unidade_consultar	S
100000100	100015782	rel_sinalizacao_fed_unidade_excluir	\N	controlador.php?acao=rel_sinalizacao_fed_unidade_excluir	S
100000100	100015783	rel_sinalizacao_fed_unidade_listar	\N	controlador.php?acao=rel_sinalizacao_fed_unidade_listar	S
100000100	100015784	replicacao_federacao_agendar	\N	controlador.php?acao=replicacao_federacao_agendar	S
100000100	100015785	replicacao_federacao_replicar	\N	controlador.php?acao=replicacao_federacao_replicar	S
100000100	100015786	replicacao_federacao_cadastrar	\N	controlador.php?acao=replicacao_federacao_cadastrar	S
100000100	100015787	replicacao_federacao_alterar	\N	controlador.php?acao=replicacao_federacao_alterar	S
100000100	100015788	replicacao_federacao_consultar	\N	controlador.php?acao=replicacao_federacao_consultar	S
100000100	100015789	replicacao_federacao_excluir	\N	controlador.php?acao=replicacao_federacao_excluir	S
100000100	100015790	replicacao_federacao_listar	\N	controlador.php?acao=replicacao_federacao_listar	S
100000100	100015791	replicacao_federacao_desativar	\N	controlador.php?acao=replicacao_federacao_desativar	S
100000100	100015792	replicacao_federacao_reativar	\N	controlador.php?acao=replicacao_federacao_reativar	S
100000100	100015867	item_etapa_excluir	\N	controlador.php?acao=item_etapa_excluir	S
100000100	100015793	procedimento_acervo_sigilosos_global	\N	controlador.php?acao=procedimento_acervo_sigilosos_global	S
100000100	100015794	pesquisa_cadastrar	\N	controlador.php?acao=pesquisa_cadastrar	S
100000100	100015795	pesquisa_alterar	\N	controlador.php?acao=pesquisa_alterar	S
100000100	100015796	pesquisa_consultar	\N	controlador.php?acao=pesquisa_consultar	S
100000100	100015797	pesquisa_excluir	\N	controlador.php?acao=pesquisa_excluir	S
100000100	100015798	pesquisa_listar	\N	controlador.php?acao=pesquisa_listar	S
100000100	100015799	pesquisa_selecionar	\N	controlador.php?acao=pesquisa_selecionar	S
100000100	100015800	campo_pesquisa_cadastrar	\N	controlador.php?acao=campo_pesquisa_cadastrar	S
100000100	100015801	campo_pesquisa_alterar	\N	controlador.php?acao=campo_pesquisa_alterar	S
100000100	100015802	campo_pesquisa_consultar	\N	controlador.php?acao=campo_pesquisa_consultar	S
100000100	100015803	campo_pesquisa_excluir	\N	controlador.php?acao=campo_pesquisa_excluir	S
100000100	100015804	campo_pesquisa_listar	\N	controlador.php?acao=campo_pesquisa_listar	S
100000100	100015805	infra_trocar_unidade	\N	controlador.php?acao=infra_trocar_unidade	S
100000100	100015806	aviso_mostrar	\N	controlador.php?acao=aviso_mostrar	S
100000099	100015807	grupo_perfil_cadastrar	\N	controlador.php?acao=grupo_perfil_cadastrar	S
100000099	100015808	grupo_perfil_alterar	\N	controlador.php?acao=grupo_perfil_alterar	S
100000099	100015809	grupo_perfil_excluir	\N	controlador.php?acao=grupo_perfil_excluir	S
100000099	100015810	grupo_perfil_desativar	\N	controlador.php?acao=grupo_perfil_desativar	S
100000099	100015811	grupo_perfil_reativar	\N	controlador.php?acao=grupo_perfil_reativar	S
100000099	100015812	grupo_perfil_consultar	\N	controlador.php?acao=grupo_perfil_consultar	S
100000099	100015813	grupo_perfil_listar	\N	controlador.php?acao=grupo_perfil_listar	S
100000099	100015814	grupo_perfil_selecionar	\N	controlador.php?acao=grupo_perfil_selecionar	S
100000099	100015815	rel_grupo_perfil_perfil_cadastrar	\N	controlador.php?acao=rel_grupo_perfil_perfil_cadastrar	S
100000099	100015816	rel_grupo_perfil_perfil_excluir	\N	controlador.php?acao=rel_grupo_perfil_perfil_excluir	S
100000099	100015817	rel_grupo_perfil_perfil_consultar	\N	controlador.php?acao=rel_grupo_perfil_perfil_consultar	S
100000099	100015818	rel_grupo_perfil_perfil_listar	\N	controlador.php?acao=rel_grupo_perfil_perfil_listar	S
100000099	100015819	rel_grupo_perfil_perfil_selecionar	\N	controlador.php?acao=rel_grupo_perfil_perfil_selecionar	S
100000099	100015820	infra_captcha_listar	\N	controlador.php?acao=infra_captcha_listar	S
100000099	100015821	sistema_configurar	\N	controlador.php?acao=sistema_configurar	S
100000099	100015822	usuario_historico_excluir	\N	controlador.php?acao=usuario_historico_excluir	S
100000099	100015823	usuario_pausar_2fa	\N	controlador.php?acao=usuario_pausar_2fa	S
100000099	100015824	usuario_remover_pausa_2fa	\N	controlador.php?acao=usuario_remover_pausa_2fa	S
100000100	100015825	procedimento_linha_direta	\N	controlador.php?acao=procedimento_linha_direta	S
100000100	100015826	arvore_navegar	\N	controlador.php?acao=arvore_navegar	S
100000100	100015827	arvore_processar_html	\N	controlador.php?acao=arvore_processar_html	S
100000100	100015828	infra_captcha_listar	\N	controlador.php?acao=infra_captcha_listar	S
100000100	100015829	sistema_configurar	\N	controlador.php?acao=sistema_configurar	S
100000100	100015830	aviso_cadastrar	\N	controlador.php?acao=aviso_cadastrar	S
100000100	100015831	aviso_alterar	\N	controlador.php?acao=aviso_alterar	S
100000100	100015832	aviso_consultar	\N	controlador.php?acao=aviso_consultar	S
100000100	100015833	aviso_upload	\N	controlador.php?acao=aviso_upload	S
100000100	100015834	aviso_excluir	\N	controlador.php?acao=aviso_excluir	S
100000100	100015835	aviso_listar	\N	controlador.php?acao=aviso_listar	S
100000100	100015836	rel_aviso_orgao_cadastrar	\N	controlador.php?acao=rel_aviso_orgao_cadastrar	S
100000100	100015837	rel_aviso_orgao_excluir	\N	controlador.php?acao=rel_aviso_orgao_excluir	S
100000100	100015838	rel_aviso_orgao_consultar	\N	controlador.php?acao=rel_aviso_orgao_consultar	S
100000100	100015839	rel_aviso_orgao_listar	\N	controlador.php?acao=rel_aviso_orgao_listar	S
100000100	100015840	plano_trabalho_configurar	\N	controlador.php?acao=plano_trabalho_configurar	S
100000100	100015841	plano_trabalho_alterar	\N	controlador.php?acao=plano_trabalho_alterar	S
100000100	100015842	plano_trabalho_cadastrar	\N	controlador.php?acao=plano_trabalho_cadastrar	S
100000100	100015843	plano_trabalho_consultar	\N	controlador.php?acao=plano_trabalho_consultar	S
100000100	100015844	plano_trabalho_excluir	\N	controlador.php?acao=plano_trabalho_excluir	S
100000100	100015845	plano_trabalho_listar	\N	controlador.php?acao=plano_trabalho_listar	S
100000100	100015846	plano_trabalho_selecionar	\N	controlador.php?acao=plano_trabalho_selecionar	S
100000100	100015847	plano_trabalho_desativar	\N	controlador.php?acao=plano_trabalho_desativar	S
100000100	100015848	plano_trabalho_reativar	\N	controlador.php?acao=plano_trabalho_reativar	S
100000100	100015849	plano_trabalho_clonar	\N	controlador.php?acao=plano_trabalho_clonar	S
100000100	100015850	plano_trabalho_consultar_historico	\N	controlador.php?acao=plano_trabalho_consultar_historico	S
100000100	100015851	rel_serie_plano_trabalho_cadastrar	\N	controlador.php?acao=rel_serie_plano_trabalho_cadastrar	S
100000100	100015852	rel_serie_plano_trabalho_alterar	\N	controlador.php?acao=rel_serie_plano_trabalho_alterar	S
100000100	100015853	rel_serie_plano_trabalho_consultar	\N	controlador.php?acao=rel_serie_plano_trabalho_consultar	S
100000100	100015854	rel_serie_plano_trabalho_excluir	\N	controlador.php?acao=rel_serie_plano_trabalho_excluir	S
100000100	100015855	rel_serie_plano_trabalho_listar	\N	controlador.php?acao=rel_serie_plano_trabalho_listar	S
100000100	100015856	etapa_trabalho_alterar	\N	controlador.php?acao=etapa_trabalho_alterar	S
100000100	100015857	etapa_trabalho_cadastrar	\N	controlador.php?acao=etapa_trabalho_cadastrar	S
100000100	100015858	etapa_trabalho_consultar	\N	controlador.php?acao=etapa_trabalho_consultar	S
100000100	100015859	etapa_trabalho_excluir	\N	controlador.php?acao=etapa_trabalho_excluir	S
100000100	100015860	etapa_trabalho_listar	\N	controlador.php?acao=etapa_trabalho_listar	S
100000100	100015861	etapa_trabalho_selecionar	\N	controlador.php?acao=etapa_trabalho_selecionar	S
100000100	100015862	etapa_trabalho_desativar	\N	controlador.php?acao=etapa_trabalho_desativar	S
100000100	100015863	etapa_trabalho_reativar	\N	controlador.php?acao=etapa_trabalho_reativar	S
100000100	100015864	item_etapa_alterar	\N	controlador.php?acao=item_etapa_alterar	S
100000100	100015865	item_etapa_cadastrar	\N	controlador.php?acao=item_etapa_cadastrar	S
100000100	100015866	item_etapa_consultar	\N	controlador.php?acao=item_etapa_consultar	S
100000100	100015868	item_etapa_listar	\N	controlador.php?acao=item_etapa_listar	S
100000100	100015869	item_etapa_selecionar	\N	controlador.php?acao=item_etapa_selecionar	S
100000100	100015870	item_etapa_desativar	\N	controlador.php?acao=item_etapa_desativar	S
100000100	100015871	item_etapa_reativar	\N	controlador.php?acao=item_etapa_reativar	S
100000100	100015872	rel_item_etapa_unidade_cadastrar	\N	controlador.php?acao=rel_item_etapa_unidade_cadastrar	S
100000100	100015873	rel_item_etapa_unidade_consultar	\N	controlador.php?acao=rel_item_etapa_unidade_consultar	S
100000100	100015874	rel_item_etapa_unidade_excluir	\N	controlador.php?acao=rel_item_etapa_unidade_excluir	S
100000100	100015875	rel_item_etapa_unidade_listar	\N	controlador.php?acao=rel_item_etapa_unidade_listar	S
100000100	100015876	rel_item_etapa_serie_cadastrar	\N	controlador.php?acao=rel_item_etapa_serie_cadastrar	S
100000100	100015877	rel_item_etapa_serie_consultar	\N	controlador.php?acao=rel_item_etapa_serie_consultar	S
100000100	100015878	rel_item_etapa_serie_excluir	\N	controlador.php?acao=rel_item_etapa_serie_excluir	S
100000100	100015879	rel_item_etapa_serie_listar	\N	controlador.php?acao=rel_item_etapa_serie_listar	S
100000100	100015880	procedimento_plano_associar	\N	controlador.php?acao=procedimento_plano_associar	S
100000100	100015881	plano_trabalho_detalhar	\N	controlador.php?acao=plano_trabalho_detalhar	S
100000100	100015882	item_etapa_incluir_documento	\N	controlador.php?acao=item_etapa_incluir_documento	S
100000100	100015883	item_etapa_atualizar_andamento	\N	controlador.php?acao=item_etapa_atualizar_andamento	S
100000100	100015884	item_etapa_consultar_andamento	\N	controlador.php?acao=item_etapa_consultar_andamento	S
100000100	100015885	rel_item_etapa_documento_cadastrar	\N	controlador.php?acao=rel_item_etapa_documento_cadastrar	S
100000100	100015886	rel_item_etapa_documento_consultar	\N	controlador.php?acao=rel_item_etapa_documento_consultar	S
100000100	100015887	rel_item_etapa_documento_excluir	\N	controlador.php?acao=rel_item_etapa_documento_excluir	S
100000100	100015888	rel_item_etapa_documento_listar	\N	controlador.php?acao=rel_item_etapa_documento_listar	S
100000100	100015889	rel_item_etapa_documento_selecionar	\N	controlador.php?acao=rel_item_etapa_documento_selecionar	S
100000100	100015890	andamento_plano_trabalho_consultar	\N	controlador.php?acao=andamento_plano_trabalho_consultar	S
100000100	100015891	andamento_plano_trabalho_excluir	\N	controlador.php?acao=andamento_plano_trabalho_excluir	S
100000100	100015892	andamento_plano_trabalho_lancar	\N	controlador.php?acao=andamento_plano_trabalho_lancar	S
100000100	100015893	andamento_plano_trabalho_listar	\N	controlador.php?acao=andamento_plano_trabalho_listar	S
100000100	100015894	atributo_andam_plano_trab_cadastrar	\N	controlador.php?acao=atributo_andam_plano_trab_cadastrar	S
100000100	100015895	atributo_andam_plano_trab_consultar	\N	controlador.php?acao=atributo_andam_plano_trab_consultar	S
100000100	100015896	atributo_andam_plano_trab_excluir	\N	controlador.php?acao=atributo_andam_plano_trab_excluir	S
100000100	100015897	atributo_andam_plano_trab_listar	\N	controlador.php?acao=atributo_andam_plano_trab_listar	S
100000100	100015898	relatorio_federacao_gerar	\N	controlador.php?acao=relatorio_federacao_gerar	S
100000100	100015899	tarefa_alterar	\N	controlador.php?acao=tarefa_alterar	S
100000100	100015900	reabertura_programada_gerenciar	\N	controlador.php?acao=reabertura_programada_gerenciar	S
100000100	100015901	reabertura_programada_registrar	\N	controlador.php?acao=reabertura_programada_registrar	S
100000100	100015902	reabertura_programada_cadastrar	\N	controlador.php?acao=reabertura_programada_cadastrar	S
100000100	100015903	reabertura_programada_alterar	\N	controlador.php?acao=reabertura_programada_alterar	S
100000100	100015904	reabertura_programada_consultar	\N	controlador.php?acao=reabertura_programada_consultar	S
100000100	100015905	reabertura_programada_excluir	\N	controlador.php?acao=reabertura_programada_excluir	S
100000100	100015906	reabertura_programada_listar	\N	controlador.php?acao=reabertura_programada_listar	S
100000100	100015907	documento_geracao_cadastrar	\N	controlador.php?acao=documento_geracao_cadastrar	S
100000100	100015908	documento_geracao_alterar	\N	controlador.php?acao=documento_geracao_alterar	S
100000100	100015909	documento_geracao_excluir	\N	controlador.php?acao=documento_geracao_excluir	S
100000100	100015910	documento_geracao_consultar	\N	controlador.php?acao=documento_geracao_consultar	S
100000100	100015911	documento_geracao_listar	\N	controlador.php?acao=documento_geracao_listar	S
100000100	100015926	cpad_composicao_consultar	\N	controlador.php?acao=cpad_composicao_consultar	S
100000100	100015928	cpad_composicao_cadastrar	\N	controlador.php?acao=cpad_composicao_cadastrar	S
100000100	100015929	cpad_composicao_alterar	\N	controlador.php?acao=cpad_composicao_alterar	S
100000100	100015933	avaliacao_documental_consultar	\N	controlador.php?acao=avaliacao_documental_consultar	S
100000100	100015934	avaliacao_documental_listar	\N	controlador.php?acao=avaliacao_documental_listar	S
100000100	100015935	avaliacao_documental_pesquisar	\N	controlador.php?acao=avaliacao_documental_pesquisar	S
100000100	100015936	avaliacao_documental_cadastrar	\N	controlador.php?acao=avaliacao_documental_cadastrar	S
100000100	100015937	avaliacao_documental_alterar	\N	controlador.php?acao=avaliacao_documental_alterar	S
100000100	100015938	avaliacao_documental_excluir	\N	controlador.php?acao=avaliacao_documental_excluir	S
100000100	100015939	avaliacao_documental_selecionar	\N	controlador.php?acao=avaliacao_documental_selecionar	S
100000100	100015947	edital_eliminacao_cadastrar	\N	controlador.php?acao=edital_eliminacao_cadastrar	S
100000100	100015948	edital_eliminacao_alterar	\N	controlador.php?acao=edital_eliminacao_alterar	S
100000100	100015949	edital_eliminacao_consultar	\N	controlador.php?acao=edital_eliminacao_consultar	S
100000100	100015950	edital_eliminacao_excluir	\N	controlador.php?acao=edital_eliminacao_excluir	S
100000100	100015951	edital_eliminacao_gerar	\N	controlador.php?acao=edital_eliminacao_gerar	S
100000100	100015952	edital_eliminacao_eliminar	\N	controlador.php?acao=edital_eliminacao_eliminar	S
100000100	100015953	edital_eliminacao_eliminados_gerar	\N	controlador.php?acao=edital_eliminacao_eliminados_gerar	S
100000100	100015954	edital_eliminacao_listar	\N	controlador.php?acao=edital_eliminacao_listar	S
100000100	100015955	edital_eliminacao_conteudo_cadastrar	\N	controlador.php?acao=edital_eliminacao_conteudo_cadastrar	S
100000100	100015956	edital_eliminacao_conteudo_consultar	\N	controlador.php?acao=edital_eliminacao_conteudo_consultar	S
100000100	100015957	edital_eliminacao_conteudo_listar	\N	controlador.php?acao=edital_eliminacao_conteudo_listar	S
100000100	100015958	edital_eliminacao_conteudo_excluir	\N	controlador.php?acao=edital_eliminacao_conteudo_excluir	S
100000100	100015959	edital_eliminacao_arquivados_listar	\N	controlador.php?acao=edital_eliminacao_arquivados_listar	S
100000100	100015960	arquivamento_eliminacao_sinalizar	\N	controlador.php?acao=arquivamento_eliminacao_sinalizar	S
100000100	100015961	arquivamento_eliminacao_listar	\N	controlador.php?acao=arquivamento_eliminacao_listar	S
100000100	100015962	arquivamento_eliminar	\N	controlador.php?acao=arquivamento_eliminar	S
100000100	100015963	edital_eliminacao_erro_cadastrar	\N	controlador.php?acao=edital_eliminacao_erro_cadastrar	S
100000100	100015964	edital_eliminacao_erro_consultar	\N	controlador.php?acao=edital_eliminacao_erro_consultar	S
100000100	100015965	edital_eliminacao_erro_listar	\N	controlador.php?acao=edital_eliminacao_erro_listar	S
100000100	100015966	edital_eliminacao_erro_excluir	\N	controlador.php?acao=edital_eliminacao_erro_excluir	S
100000100	100015967	rel_orgao_pesquisa_cadastrar	\N	controlador.php?acao=rel_orgao_pesquisa_cadastrar	S
100000100	100015968	rel_orgao_pesquisa_alterar	\N	controlador.php?acao=rel_orgao_pesquisa_alterar	S
100000100	100015969	rel_orgao_pesquisa_excluir	\N	controlador.php?acao=rel_orgao_pesquisa_excluir	S
100000100	100015970	rel_orgao_pesquisa_consultar	\N	controlador.php?acao=rel_orgao_pesquisa_consultar	S
100000100	100015971	rel_orgao_pesquisa_listar	\N	controlador.php?acao=rel_orgao_pesquisa_listar	S
100000100	100015972	atividade_unidade_detalhe	\N	controlador.php?acao=atividade_unidade_detalhe	S
100000100	100015973	atividade_unidade_pesquisar	\N	controlador.php?acao=atividade_unidade_pesquisar	S
100000100	100015974	usuario_selecionar_contato	\N	controlador.php?acao=usuario_selecionar_contato	S
100000100	100015975	tipo_prioridade_listar	\N	controlador.php?acao=tipo_prioridade_listar	S
100000100	100015976	tipo_prioridade_consultar	\N	controlador.php?acao=tipo_prioridade_consultar	S
100000100	100015977	tipo_prioridade_cadastrar	\N	controlador.php?acao=tipo_prioridade_cadastrar	S
100000100	100015978	tipo_prioridade_alterar	\N	controlador.php?acao=tipo_prioridade_alterar	S
100000100	100015979	tipo_prioridade_excluir	\N	controlador.php?acao=tipo_prioridade_excluir	S
100000100	100015980	tipo_prioridade_desativar	\N	controlador.php?acao=tipo_prioridade_desativar	S
100000100	100015981	tipo_prioridade_reativar	\N	controlador.php?acao=tipo_prioridade_reativar	S
100000100	100015982	rel_usuario_tipo_prioridade_cadastrar	\N	controlador.php?acao=rel_usuario_tipo_prioridade_cadastrar	S
100000100	100015983	rel_usuario_tipo_prioridade_configurar	\N	controlador.php?acao=rel_usuario_tipo_prioridade_configurar	S
100000100	100015984	rel_usuario_tipo_prioridade_excluir	\N	controlador.php?acao=rel_usuario_tipo_prioridade_excluir	S
100000100	100015985	rel_usuario_tipo_prioridade_listar	\N	controlador.php?acao=rel_usuario_tipo_prioridade_listar	S
100000100	100015986	rel_usuario_tipo_prioridade_selecionar	\N	controlador.php?acao=rel_usuario_tipo_prioridade_selecionar	S
100000099	100015987	perfil_sincronizar	\N	controlador.php?acao=perfil_sincronizar	S
100000099	100015988	login_sso	\N	controlador.php?acao=login_sso	S
100000099	100015989	login_sso_consultar	\N	controlador.php?acao=login_sso_consultar	S
100000099	100015990	login_sso_listar	\N	controlador.php?acao=login_sso_listar	S
100000099	100015991	servico_sso_cadastrar	\N	controlador.php?acao=servico_sso_cadastrar	S
100000099	100015992	servico_sso_consultar	\N	controlador.php?acao=servico_sso_consultar	S
100000099	100015993	servico_sso_listar	\N	controlador.php?acao=servico_sso_listar	S
100000099	100015994	servico_sso_alterar	\N	controlador.php?acao=servico_sso_alterar	S
100000099	100015995	servico_sso_excluir	\N	controlador.php?acao=servico_sso_excluir	S
100000099	100015996	servico_sso_desativar	\N	controlador.php?acao=servico_sso_desativar	S
100000099	100015997	servico_sso_selecionar	\N	controlador.php?acao=servico_sso_selecionar	S
100000099	100015998	servico_sso_reativar	\N	controlador.php?acao=servico_sso_reativar	S
100000099	100015999	servico_sso_upload	\N	controlador.php?acao=servico_sso_upload	S
100000099	100016000	rel_sistema_servico_sso_cadastrar	\N	controlador.php?acao=rel_sistema_servico_sso_cadastrar	S
100000099	100016001	rel_sistema_servico_sso_consultar	\N	controlador.php?acao=rel_sistema_servico_sso_consultar	S
100000099	100016002	rel_sistema_servico_sso_listar	\N	controlador.php?acao=rel_sistema_servico_sso_listar	S
100000099	100016003	rel_sistema_servico_sso_alterar	\N	controlador.php?acao=rel_sistema_servico_sso_alterar	S
100000099	100016004	rel_sistema_servico_sso_excluir	\N	controlador.php?acao=rel_sistema_servico_sso_excluir	S
100000099	100016005	rel_sistema_servico_sso_selecionar	\N	controlador.php?acao=rel_sistema_servico_sso_selecionar	S
100000099	100016006	infra_erro_php_listar	\N	controlador.php?acao=infra_erro_php_listar	S
100000100	100015944	revisao_avaliacao_excluir	\N	controlador.php?acao=revisao_avaliacao_excluir	S
100000100	100015946	revisao_avaliacao_desativar	\N	controlador.php?acao=revisao_avaliacao_desativar	S
100000100	100015940	revisao_avaliacao_pesquisar	\N	controlador.php?acao=revisao_avaliacao_pesquisar	S
100000100	100015942	revisao_avaliacao_alterar	\N	controlador.php?acao=revisao_avaliacao_alterar	S
100000100	100015943	revisao_avaliacao_consultar	\N	controlador.php?acao=revisao_avaliacao_consultar	S
100000099	100016007	infra_erro_php_excluir	\N	controlador.php?acao=infra_erro_php_excluir	S
100000099	100016008	infra_navegador_alertar	\N	controlador.php?acao=infra_navegador_alertar	S
100000099	100016009	infra_navegador_configurar	\N	controlador.php?acao=infra_navegador_configurar	S
100000099	100016010	assinatura_sso	\N	controlador.php?acao=assinatura_sso	S
100000099	100016011	assinatura_sso_consultar	\N	controlador.php?acao=assinatura_sso_consultar	S
100000099	100016012	assinatura_sso_listar	\N	controlador.php?acao=assinatura_sso_listar	S
100000100	100016013	infra_editor_comentario_cadastrar	\N	controlador.php?acao=infra_editor_comentario_cadastrar	S
100000100	100016014	infra_editor_comentario_alterar	\N	controlador.php?acao=infra_editor_comentario_alterar	S
100000100	100016015	infra_editor_comentario_excluir	\N	controlador.php?acao=infra_editor_comentario_excluir	S
100000100	100016016	infra_editor_comentario_consultar	\N	controlador.php?acao=infra_editor_comentario_consultar	S
100000100	100016017	infra_editor_comentario_listar	\N	controlador.php?acao=infra_editor_comentario_listar	S
100000100	100016018	infra_editor_comentario_desativar	\N	controlador.php?acao=infra_editor_comentario_desativar	S
100000100	100016019	infra_editor_comentario_reativar	\N	controlador.php?acao=infra_editor_comentario_reativar	S
100000100	100016020	infra_editor_comentario_sincronizar	\N	controlador.php?acao=infra_editor_comentario_sincronizar	S
100000100	100016021	infra_erro_php_listar	\N	controlador.php?acao=infra_erro_php_listar	S
100000100	100016022	infra_erro_php_excluir	\N	controlador.php?acao=infra_erro_php_excluir	S
100000100	100016023	lixeira_cadastrar	\N	controlador.php?acao=lixeira_cadastrar	S
100000100	100016024	lixeira_alterar	\N	controlador.php?acao=lixeira_alterar	S
100000100	100016025	lixeira_consultar	\N	controlador.php?acao=lixeira_consultar	S
100000100	100016026	lixeira_listar	\N	controlador.php?acao=lixeira_listar	S
100000100	100016027	lixeira_download	\N	controlador.php?acao=lixeira_download	S
100000100	100016028	lixeira_excluir	\N	controlador.php?acao=lixeira_excluir	S
100000100	100016029	lixeira_selecionar	\N	controlador.php?acao=lixeira_selecionar	S
100000100	100016030	solicitacao_ouvidoria_cadastrar	\N	controlador.php?acao=solicitacao_ouvidoria_cadastrar	S
100000100	100016031	solicitacao_ouvidoria_alterar	\N	controlador.php?acao=solicitacao_ouvidoria_alterar	S
100000100	100016032	solicitacao_ouvidoria_excluir	\N	controlador.php?acao=solicitacao_ouvidoria_excluir	S
100000100	100016033	solicitacao_ouvidoria_consultar	\N	controlador.php?acao=solicitacao_ouvidoria_consultar	S
100000100	100016034	solicitacao_ouvidoria_listar	\N	controlador.php?acao=solicitacao_ouvidoria_listar	S
100000100	100016035	solicitacao_ouvidoria_selecionar	\N	controlador.php?acao=solicitacao_ouvidoria_selecionar	S
100000100	100016036	solicitacao_ouvidoria_bloquear	\N	controlador.php?acao=solicitacao_ouvidoria_bloquear	S
100000100	100016037	solicitacao_ouvidoria_desbloquear	\N	controlador.php?acao=solicitacao_ouvidoria_desbloquear	S
100000100	100016038	usuario_configurar	\N	controlador.php?acao=usuario_configurar	S
100000100	100016039	usuario_externo_aceite	\N	controlador_externo.php?acao=usuario_externo_aceite	S
100000100	100016040	usuario_externo_gov_br_cadastrar	\N	controlador_externo.php?acao=usuario_externo_gov_br_cadastrar	S
100000100	100016041	usuario_externo_gov_br_alterar	\N	controlador_externo.php?acao=usuario_externo_gov_br_alterar	S
100000100	100016042	termo_uso_consultar	\N	controlador.php?acao=termo_uso_consultar	S
100000100	100016043	termo_uso_listar	\N	controlador.php?acao=termo_uso_listar	S
100000100	100016044	termo_uso_cadastrar	\N	controlador.php?acao=termo_uso_cadastrar	S
100000100	100016045	termo_uso_alterar	\N	controlador.php?acao=termo_uso_alterar	S
100000100	100016046	termo_uso_excluir	\N	controlador.php?acao=termo_uso_excluir	S
100000100	100016047	termo_uso_clonar	\N	controlador.php?acao=termo_uso_clonar	S
100000100	100016048	termo_uso_liberar	\N	controlador.php?acao=termo_uso_liberar	S
100000100	100016049	termo_uso_cancelar_liberacao	\N	controlador.php?acao=termo_uso_cancelar_liberacao	S
100000100	100016050	usuario_externo_termo_bloquear	\N	controlador_externo.php?acao=usuario_externo_termo_bloquear	S
100000100	100015941	revisao_avaliacao_cadastrar	\N	controlador.php?acao=revisao_avaliacao_cadastrar	S
100000100	100016051	assinatura_avancada_ajuda	\N	controlador.php?acao=assinatura_avancada_ajuda	S
\.


--
-- Data for Name: recurso_vinculado; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.recurso_vinculado (id_sistema, id_recurso, id_sistema_vinculado, id_recurso_vinculado, tipo_vinculo) FROM stdin;
\.


--
-- Data for Name: regra_auditoria; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.regra_auditoria (id_regra_auditoria, id_sistema, descricao, sin_ativo) FROM stdin;
1	100000099	Geral	S
2	100000100	Geral	S
3	100000100	Acessos e Usuários Externos	S
4	100000100	Visualização de Processos	S
5	100000100	Visualização de Documentos	S
6	100000100	Gestão Documental	S
\.


--
-- Data for Name: rel_grupo_perfil_perfil; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_grupo_perfil_perfil (id_grupo_perfil, id_sistema, id_perfil) FROM stdin;
\.


--
-- Data for Name: rel_hierarquia_unidade; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_hierarquia_unidade (id_unidade, id_hierarquia, id_hierarquia_pai, id_unidade_pai, dta_inicio, dta_fim, sin_ativo) FROM stdin;
110000001	100000018	\N	\N	2013-11-06 00:00:00	\N	S
110000002	100000018	100000018	110000001	2014-01-01 00:00:00	\N	S
110000003	100000018	100000018	110000001	2014-01-01 00:00:00	\N	S
\.


--
-- Data for Name: rel_orgao_autenticacao; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_orgao_autenticacao (id_orgao, id_servidor_autenticacao, sequencia) FROM stdin;
0	1	0
\.


--
-- Data for Name: rel_perfil_item_menu; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_perfil_item_menu (id_perfil, id_sistema, id_menu, id_item_menu, id_recurso) FROM stdin;
100000931	100000099	100000078	100005410	100014405
100000931	100000099	100000078	100005411	100014369
100000933	100000099	100000078	100005411	100014369
100000931	100000099	100000078	100005412	100014312
100000931	100000099	100000078	100005413	100014359
100000933	100000099	100000078	100005413	100014359
100000931	100000099	100000078	100005415	100014370
100000933	100000099	100000078	100005415	100014370
100000931	100000099	100000078	100005416	100014375
100000933	100000099	100000078	100005416	100014375
100000931	100000099	100000078	100005417	100014313
100000933	100000099	100000078	100005417	100014313
100000931	100000099	100000078	100005418	100014301
100000931	100000099	100000078	100005419	100014327
100000937	100000099	100000078	100005419	100014327
100000931	100000099	100000078	100005420	100014344
100000935	100000099	100000078	100005420	100014344
100000937	100000099	100000078	100005420	100014344
100000931	100000099	100000078	100005421	100014353
100000933	100000099	100000078	100005421	100014353
100000931	100000099	100000078	100005422	100014360
100000933	100000099	100000078	100005422	100014360
100000931	100000099	100000078	100005423	100014395
100000933	100000099	100000078	100005423	100014395
100000931	100000099	100000078	100005424	100014365
100000933	100000099	100000078	100005424	100014365
100000931	100000099	100000078	100005427	100014379
100000933	100000099	100000078	100005427	100014379
100000936	100000099	100000078	100005427	100014379
100000946	100000099	100000078	100005427	100014379
100000931	100000099	100000078	100005428	100014302
100000933	100000099	100000078	100005428	100014302
100000931	100000099	100000078	100005429	100014393
100000931	100000099	100000078	100005430	100014328
100000933	100000099	100000078	100005430	100014328
100000937	100000099	100000078	100005430	100014328
100000931	100000099	100000078	100005431	100014345
100000933	100000099	100000078	100005431	100014345
100000935	100000099	100000078	100005431	100014345
100000937	100000099	100000078	100005431	100014345
100000931	100000099	100000078	100005432	100014354
100000933	100000099	100000078	100005432	100014354
100000931	100000099	100000078	100005435	100014333
100000931	100000099	100000078	100005436	100014418
100000931	100000099	100000078	100005437	100014423
100000931	100000099	100000078	100005438	100014394
100000931	100000099	100000078	100005439	100014407
100000937	100000099	100000078	100005439	100014407
100000931	100000099	100000078	100005440	100014408
100000935	100000099	100000078	100005440	100014408
100000937	100000099	100000078	100005440	100014408
100000931	100000099	100000078	100005441	100014409
100000933	100000099	100000078	100005441	100014409
100000931	100000099	100000078	100005442	100014334
100000933	100000099	100000078	100005442	100014334
100000931	100000099	100000078	100005443	100014340
100000935	100000099	100000078	100005443	100014340
100000931	100000099	100000078	100005444	100014381
100000932	100000099	100000078	100005444	100014381
100000933	100000099	100000078	100005444	100014381
100000936	100000099	100000078	100005444	100014381
100000946	100000099	100000078	100005444	100014381
100000931	100000099	100000078	100005446	100014367
100000933	100000099	100000078	100005446	100014367
100000931	100000099	100000078	100005449	100014351
100000933	100000099	100000078	100005449	100014351
100000935	100000099	100000078	100005449	100014351
100000931	100000099	100000078	100005450	100014307
100000931	100000099	100000078	100005451	100014380
100000933	100000099	100000078	100005451	100014380
100000936	100000099	100000078	100005451	100014380
100000946	100000099	100000078	100005451	100014380
100000931	100000099	100000078	100005452	100014325
100000933	100000099	100000078	100005452	100014325
100000931	100000099	100000078	100005453	100014308
100000931	100000099	100000078	100005454	100014396
100000933	100000099	100000078	100005454	100014396
100000933	100000099	100000078	100005456	100014412
100000936	100000099	100000078	100005456	100014412
100000946	100000099	100000078	100005456	100014412
100000931	100000099	100000078	100005606	100015187
100000931	100000099	100000078	100005607	100015188
100000931	100000099	100000078	100005609	100015193
100000931	100000099	100000078	100005610	100015198
100000933	100000099	100000078	100005611	100015203
100000931	100000099	100000078	100005618	100015265
100000931	100000099	100000078	100005637	100015368
100000931	100000099	100000078	100005650	100015451
100000931	100000099	100000078	100005651	100015452
100000933	100000099	100000078	100005671	100015552
100000931	100000099	100000078	100005672	100015554
100000931	100000099	100000078	100005673	100015555
100000931	100000099	100000078	100005674	100015560
100000931	100000099	100000078	100005675	100015563
100000931	100000099	100000078	100005676	100015568
100000938	100000100	100000079	100005462	100014783
100000939	100000100	100000079	100005463	100015529
100000940	100000100	100000079	100005465	100014561
100000941	100000100	100000079	100005467	100014925
100000938	100000100	100000079	100005472	100014815
100000941	100000100	100000079	100005474	100014926
100000938	100000100	100000079	100005476	100014749
100000938	100000100	100000079	100005477	100014820
100000938	100000100	100000079	100005478	100014898
100000940	100000100	100000079	100005480	100014746
100000940	100000100	100000079	100005481	100014755
100000938	100000100	100000079	100005484	100014914
100000938	100000100	100000079	100005485	100014812
100000941	100000100	100000079	100005487	100014623
100000938	100000100	100000079	100005488	100014751
100000938	100000100	100000079	100005489	100014862
100000940	100000100	100000079	100005489	100014862
100000938	100000100	100000079	100005491	100014947
100000941	100000100	100000079	100005492	100014626
100000939	100000100	100000079	100005493	100014799
100000938	100000100	100000079	100005495	100014934
100000944	100000100	100000079	100005499	100014907
100000939	100000100	100000079	100005501	100014857
100000939	100000100	100000079	100005502	100014489
100000938	100000100	100000079	100005503	100014539
100000941	100000100	100000079	100005506	100014594
100000939	100000100	100000079	100005507	100014492
100000939	100000100	100000079	100005509	100014646
100000939	100000100	100000079	100005510	100014515
100000941	100000100	100000079	100005511	100014597
100000941	100000100	100000079	100005512	100014610
100000939	100000100	100000079	100005513	100014495
100000939	100000100	100000079	100005514	100014511
100000939	100000100	100000079	100005516	100014649
100000941	100000100	100000079	100005519	100014601
100000941	100000100	100000079	100005520	100014613
100000939	100000100	100000079	100005521	100014498
100000939	100000100	100000079	100005522	100014525
100000940	100000100	100000079	100005522	100014525
100000939	100000100	100000079	100005525	100014519
100000940	100000100	100000079	100005525	100014519
100000939	100000100	100000079	100005527	100014653
100000939	100000100	100000079	100005528	100014508
100000941	100000100	100000079	100005529	100014617
100000939	100000100	100000079	100005530	100014529
100000940	100000100	100000079	100005530	100014529
100000939	100000100	100000079	100005533	100014448
100000939	100000100	100000079	100005534	100014801
100000939	100000100	100000079	100005535	100014577
100000940	100000100	100000079	100005535	100014577
100000939	100000100	100000079	100005538	100014451
100000939	100000100	100000079	100005545	100014455
100000941	100000100	100000079	100005546	100014602
100000939	100000100	100000079	100005548	100014472
100000939	100000100	100000079	100005550	100014795
100000939	100000100	100000079	100005551	100014441
100000939	100000100	100000079	100005552	100014768
100000941	100000100	100000079	100005553	100014605
100000939	100000100	100000079	100005554	100014475
100000939	100000100	100000079	100005556	100014444
100000939	100000100	100000079	100005557	100014772
100000941	100000100	100000079	100005558	100014609
100000939	100000100	100000079	100005559	100014479
100000939	100000100	100000079	100005560	100014480
100000940	100000100	100000079	100005561	100014967
100000939	100000100	100000079	100005562	100014481
100000939	100000100	100000079	100005563	100014484
100000939	100000100	100000079	100005565	100014488
100000939	100000100	100000079	100005571	100015036
100000939	100000100	100000079	100005572	100015039
100000939	100000100	100000079	100005573	100015042
100000938	100000100	100000079	100005574	100014955
100000939	100000100	100000079	100005577	100015043
100000939	100000100	100000079	100005578	100015047
100000939	100000100	100000079	100005579	100015050
100000939	100000100	100000079	100005580	100015051
100000939	100000100	100000079	100005581	100015056
100000939	100000100	100000079	100005582	100015087
100000939	100000100	100000079	100005584	100015089
100000939	100000100	100000079	100005585	100015092
100000939	100000100	100000079	100005586	100015095
100000939	100000100	100000079	100005588	100015096
100000939	100000100	100000079	100005589	100015100
100000939	100000100	100000079	100005591	100015102
100000939	100000100	100000079	100005592	100015106
100000939	100000100	100000079	100005593	100015109
100000939	100000100	100000079	100005594	100015113
100000939	100000100	100000079	100005597	100015122
100000939	100000100	100000079	100005598	100015125
100000939	100000100	100000079	100005599	100015137
100000945	100000100	100000079	100005599	100015137
100000938	100000100	100000079	100005600	100015159
100000940	100000100	100000079	100005601	100015160
100000938	100000100	100000079	100005602	100015166
100000940	100000100	100000079	100005604	100015169
100000939	100000100	100000079	100005605	100015172
100000940	100000100	100000079	100005612	100015235
100000940	100000100	100000079	100005613	100015239
100000940	100000100	100000079	100005614	100015244
100000939	100000100	100000079	100005619	100015269
100000944	100000100	100000079	100005620	100015273
100000939	100000100	100000079	100005623	100015289
100000939	100000100	100000079	100005624	100015290
100000939	100000100	100000079	100005625	100015291
100000939	100000100	100000079	100005626	100015295
100000939	100000100	100000079	100005627	100015302
100000939	100000100	100000079	100005629	100015345
100000939	100000100	100000079	100005630	100015348
100000939	100000100	100000079	100005631	100015351
100000938	100000100	100000079	100005632	100015352
100000939	100000100	100000079	100005634	100015355
100000939	100000100	100000079	100005635	100015359
100000939	100000100	100000079	100005636	100015362
100000939	100000100	100000079	100005640	100015380
100000939	100000100	100000079	100005641	100015382
100000939	100000100	100000079	100005642	100015386
100000938	100000100	100000079	100005643	100015405
100000939	100000100	100000079	100005645	100015409
100000939	100000100	100000079	100005646	100015411
100000939	100000100	100000079	100005647	100015416
100000939	100000100	100000079	100005648	100015426
100000938	100000100	100000079	100005649	100015450
100000949	100000100	100000079	100005652	100015455
100000940	100000100	100000079	100005653	100015456
100000940	100000100	100000079	100005654	100015459
100000939	100000100	100000079	100005656	100015472
100000939	100000100	100000079	100005657	100015474
100000939	100000100	100000079	100005658	100015478
100000938	100000100	100000079	100005661	100014511
100000939	100000100	100000079	100005662	100014539
100000939	100000100	100000079	100005663	100015486
100000939	100000100	100000079	100005664	100015489
100000939	100000100	100000079	100005665	100015491
100000939	100000100	100000079	100005666	100015493
100000938	100000100	100000079	100005668	100015502
100000941	100000100	100000079	100005669	100015542
100000939	100000100	100000079	100005670	100015549
100000938	100000100	100000079	100005678	100015592
100000939	100000100	100000079	100005680	100015625
100000939	100000100	100000079	100005681	100015627
100000939	100000100	100000079	100005682	100015631
100000938	100000100	100000079	100005683	100015641
100000939	100000100	100000079	100005685	100015649
100000939	100000100	100000079	100005686	100015650
100000939	100000100	100000079	100005687	100015654
100000938	100000100	100000079	100005689	100015760
100000939	100000100	100000079	100005691	100015762
100000939	100000100	100000079	100005692	100015766
100000939	100000100	100000079	100005693	100015768
100000940	100000100	100000079	100005694	100015790
100000939	100000100	100000079	100005695	100015793
100000931	100000099	100000078	100005696	100015820
100000931	100000099	100000078	100005697	100015821
100000937	100000099	100000078	100005676	100015568
100000940	100000100	100000079	100005698	100015828
100000940	100000100	100000079	100005699	100015829
100000939	100000100	100000079	100005700	100015835
100000939	100000100	100000079	100005701	100015845
100000939	100000100	100000079	100005703	100015682
100000939	100000100	100000079	100005704	100015898
100000938	100000100	100000079	100005705	100015906
100000941	100000100	100000079	100005712	100015954
100000941	100000100	100000079	100005713	100015961
100000938	100000100	100000079	100005714	100015973
100000939	100000100	100000079	100005716	100015975
100000939	100000100	100000079	100005717	100015977
100000939	100000100	100000079	100005718	100015981
100000951	100000100	100000079	100005472	100014815
100000951	100000100	100000079	100005476	100014749
100000951	100000100	100000079	100005477	100014820
100000951	100000100	100000079	100005478	100014898
100000951	100000100	100000079	100005488	100014751
100000951	100000100	100000079	100005489	100014862
100000951	100000100	100000079	100005491	100014947
100000951	100000100	100000079	100005495	100014934
100000951	100000100	100000079	100005503	100014539
100000951	100000100	100000079	100005574	100014955
100000951	100000100	100000079	100005602	100015166
100000951	100000100	100000079	100005632	100015352
100000951	100000100	100000079	100005643	100015405
100000951	100000100	100000079	100005649	100015450
100000951	100000100	100000079	100005661	100014511
100000951	100000100	100000079	100005668	100015502
100000951	100000100	100000079	100005678	100015592
100000951	100000100	100000079	100005683	100015641
100000951	100000100	100000079	100005689	100015760
100000951	100000100	100000079	100005705	100015906
100000951	100000100	100000079	100005714	100015973
100000951	100000100	100000079	100005600	100015159
100000951	100000100	100000079	100005462	100014783
100000951	100000100	100000079	100005485	100014812
100000951	100000100	100000079	100005484	100014914
100000939	100000100	100000079	100005549	100014467
100000939	100000100	100000079	100005555	100014471
100000933	100000099	100000078	100005719	100015987
100000931	100000099	100000078	100005721	100015990
100000931	100000099	100000078	100005722	100015993
100000931	100000099	100000078	100005723	100016006
100000931	100000099	100000078	100005724	100016009
100000940	100000100	100000079	100005725	100016021
100000938	100000100	100000079	100005726	100016026
100000939	100000100	100000079	100005727	100016043
100000940	100000100	100000079	100005728	100016043
100000950	100000100	100000079	100005731	100015935
100000950	100000100	100000079	100005732	100015940
\.


--
-- Data for Name: rel_perfil_recurso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_perfil_recurso (id_perfil, id_sistema, id_recurso) FROM stdin;
100000931	100000099	100014301
100000931	100000099	100014302
100000931	100000099	100014303
100000931	100000099	100014304
100000931	100000099	100014305
100000931	100000099	100014306
100000931	100000099	100014307
100000931	100000099	100014308
100000931	100000099	100014309
100000931	100000099	100014310
100000931	100000099	100014311
100000931	100000099	100014312
100000931	100000099	100014313
100000931	100000099	100014314
100000931	100000099	100014315
100000931	100000099	100014316
100000931	100000099	100014317
100000931	100000099	100014324
100000931	100000099	100014325
100000931	100000099	100014326
100000931	100000099	100014327
100000931	100000099	100014328
100000931	100000099	100014329
100000931	100000099	100014330
100000931	100000099	100014331
100000931	100000099	100014332
100000931	100000099	100014333
100000931	100000099	100014334
100000931	100000099	100014335
100000931	100000099	100014336
100000931	100000099	100014337
100000931	100000099	100014338
100000931	100000099	100014339
100000931	100000099	100014340
100000931	100000099	100014341
100000931	100000099	100014342
100000931	100000099	100014343
100000931	100000099	100014344
100000931	100000099	100014345
100000931	100000099	100014346
100000931	100000099	100014347
100000931	100000099	100014348
100000931	100000099	100014349
100000931	100000099	100014350
100000931	100000099	100014351
100000931	100000099	100014352
100000931	100000099	100014353
100000931	100000099	100014354
100000931	100000099	100014355
100000931	100000099	100014356
100000931	100000099	100014357
100000931	100000099	100014358
100000931	100000099	100014359
100000931	100000099	100014360
100000931	100000099	100014361
100000931	100000099	100014362
100000931	100000099	100014363
100000931	100000099	100014364
100000931	100000099	100014365
100000931	100000099	100014366
100000931	100000099	100014367
100000931	100000099	100014368
100000931	100000099	100014369
100000931	100000099	100014370
100000931	100000099	100014371
100000931	100000099	100014372
100000931	100000099	100014373
100000931	100000099	100014374
100000931	100000099	100014375
100000931	100000099	100014376
100000931	100000099	100014377
100000931	100000099	100014378
100000931	100000099	100014379
100000931	100000099	100014380
100000931	100000099	100014381
100000931	100000099	100014382
100000931	100000099	100014383
100000931	100000099	100014384
100000931	100000099	100014385
100000931	100000099	100014386
100000931	100000099	100014387
100000931	100000099	100014388
100000931	100000099	100014389
100000931	100000099	100014390
100000931	100000099	100014391
100000931	100000099	100014392
100000931	100000099	100014393
100000931	100000099	100014394
100000931	100000099	100014395
100000931	100000099	100014396
100000931	100000099	100014405
100000931	100000099	100014406
100000931	100000099	100014407
100000931	100000099	100014408
100000931	100000099	100014409
100000931	100000099	100014410
100000931	100000099	100014414
100000931	100000099	100014415
100000931	100000099	100014416
100000931	100000099	100014417
100000931	100000099	100014418
100000931	100000099	100014419
100000931	100000099	100014420
100000931	100000099	100014421
100000931	100000099	100014422
100000931	100000099	100014423
100000931	100000099	100014424
100000931	100000099	100015187
100000931	100000099	100015188
100000931	100000099	100015190
100000931	100000099	100015191
100000931	100000099	100015192
100000931	100000099	100015193
100000931	100000099	100015194
100000931	100000099	100015195
100000931	100000099	100015196
100000931	100000099	100015197
100000931	100000099	100015198
100000931	100000099	100015259
100000931	100000099	100015265
100000931	100000099	100015363
100000931	100000099	100015364
100000931	100000099	100015365
100000931	100000099	100015366
100000931	100000099	100015368
100000931	100000099	100015369
100000931	100000099	100015370
100000931	100000099	100015451
100000931	100000099	100015452
100000931	100000099	100015554
100000931	100000099	100015555
100000931	100000099	100015556
100000931	100000099	100015557
100000931	100000099	100015560
100000931	100000099	100015562
100000931	100000099	100015563
100000931	100000099	100015565
100000931	100000099	100015566
100000931	100000099	100015567
100000931	100000099	100015568
100000931	100000099	100015570
100000931	100000099	100015571
100000931	100000099	100015572
100000931	100000099	100015580
100000931	100000099	100015581
100000931	100000099	100015582
100000931	100000099	100015583
100000932	100000099	100014302
100000932	100000099	100014303
100000932	100000099	100014308
100000932	100000099	100014313
100000932	100000099	100014325
100000932	100000099	100014340
100000932	100000099	100014351
100000932	100000099	100014355
100000932	100000099	100014359
100000932	100000099	100014360
100000932	100000099	100014365
100000932	100000099	100014367
100000932	100000099	100014370
100000932	100000099	100014375
100000932	100000099	100014379
100000932	100000099	100014381
100000932	100000099	100014382
100000932	100000099	100014386
100000932	100000099	100014387
100000932	100000099	100014388
100000932	100000099	100015178
100000932	100000099	100015179
100000932	100000099	100015184
100000932	100000099	100015186
100000932	100000099	100015371
100000932	100000099	100015558
100000932	100000099	100015559
100000932	100000099	100015560
100000932	100000099	100015561
100000932	100000099	100015563
100000932	100000099	100015564
100000932	100000099	100015568
100000932	100000099	100015569
100000932	100000099	100015573
100000932	100000099	100015574
100000932	100000099	100015575
100000932	100000099	100015576
100000932	100000099	100015577
100000932	100000099	100015578
100000932	100000099	100015579
100000933	100000099	100014302
100000933	100000099	100014303
100000933	100000099	100014304
100000933	100000099	100014308
100000933	100000099	100014309
100000933	100000099	100014313
100000933	100000099	100014314
100000933	100000099	100014324
100000933	100000099	100014325
100000933	100000099	100014326
100000933	100000099	100014328
100000933	100000099	100014329
100000933	100000099	100014334
100000933	100000099	100014335
100000933	100000099	100014340
100000933	100000099	100014345
100000933	100000099	100014346
100000933	100000099	100014350
100000933	100000099	100014351
100000933	100000099	100014352
100000933	100000099	100014353
100000933	100000099	100014354
100000933	100000099	100014355
100000933	100000099	100014356
100000933	100000099	100014357
100000933	100000099	100014358
100000933	100000099	100014359
100000933	100000099	100014360
100000933	100000099	100014361
100000933	100000099	100014362
100000933	100000099	100014363
100000933	100000099	100014364
100000933	100000099	100014365
100000933	100000099	100014366
100000933	100000099	100014367
100000933	100000099	100014368
100000933	100000099	100014369
100000933	100000099	100014370
100000933	100000099	100014371
100000933	100000099	100014372
100000933	100000099	100014373
100000933	100000099	100014374
100000933	100000099	100014375
100000933	100000099	100014376
100000933	100000099	100014377
100000933	100000099	100014378
100000933	100000099	100014379
100000933	100000099	100014380
100000933	100000099	100014381
100000933	100000099	100014382
100000933	100000099	100014383
100000933	100000099	100014384
100000933	100000099	100014385
100000933	100000099	100014386
100000933	100000099	100014387
100000933	100000099	100014388
100000933	100000099	100014389
100000933	100000099	100014390
100000933	100000099	100014391
100000933	100000099	100014392
100000933	100000099	100014395
100000933	100000099	100014396
100000933	100000099	100014409
100000933	100000099	100014412
100000933	100000099	100015176
100000933	100000099	100015177
100000933	100000099	100015180
100000933	100000099	100015181
100000933	100000099	100015182
100000933	100000099	100015183
100000933	100000099	100015185
100000933	100000099	100015188
100000933	100000099	100015199
100000933	100000099	100015200
100000933	100000099	100015201
100000933	100000099	100015202
100000933	100000099	100015203
100000933	100000099	100015204
100000933	100000099	100015205
100000933	100000099	100015206
100000933	100000099	100015207
100000933	100000099	100015208
100000933	100000099	100015209
100000933	100000099	100015210
100000933	100000099	100015551
100000933	100000099	100015552
100000933	100000099	100015582
100000933	100000099	100015583
100000935	100000099	100014334
100000935	100000099	100014335
100000935	100000099	100014339
100000935	100000099	100014340
100000935	100000099	100014341
100000935	100000099	100014342
100000935	100000099	100014343
100000935	100000099	100014344
100000935	100000099	100014345
100000935	100000099	100014346
100000935	100000099	100014347
100000935	100000099	100014348
100000935	100000099	100014349
100000935	100000099	100014350
100000935	100000099	100014351
100000935	100000099	100014352
100000935	100000099	100014408
100000935	100000099	100014410
100000936	100000099	100014302
100000936	100000099	100014303
100000936	100000099	100014308
100000936	100000099	100014313
100000936	100000099	100014314
100000936	100000099	100014325
100000936	100000099	100014334
100000936	100000099	100014335
100000936	100000099	100014340
100000936	100000099	100014355
100000936	100000099	100014359
100000936	100000099	100014360
100000936	100000099	100014365
100000936	100000099	100014370
100000936	100000099	100014375
100000936	100000099	100014379
100000936	100000099	100014380
100000936	100000099	100014381
100000936	100000099	100014382
100000936	100000099	100014383
100000936	100000099	100014384
100000936	100000099	100014385
100000936	100000099	100014386
100000936	100000099	100014387
100000936	100000099	100014388
100000936	100000099	100014412
100000936	100000099	100015558
100000937	100000099	100014327
100000937	100000099	100014328
100000937	100000099	100014330
100000937	100000099	100014331
100000937	100000099	100014332
100000937	100000099	100014344
100000937	100000099	100014345
100000937	100000099	100014347
100000937	100000099	100014348
100000937	100000099	100014349
100000937	100000099	100014407
100000937	100000099	100014408
100000938	100000100	100014435
100000938	100000100	100014436
100000938	100000100	100014437
100000938	100000100	100014438
100000938	100000100	100014439
100000938	100000100	100014440
100000938	100000100	100014443
100000938	100000100	100014444
100000938	100000100	100014445
100000938	100000100	100014450
100000938	100000100	100014451
100000938	100000100	100014452
100000938	100000100	100014466
100000938	100000100	100014467
100000938	100000100	100014468
100000938	100000100	100014474
100000938	100000100	100014475
100000938	100000100	100014476
100000938	100000100	100014483
100000938	100000100	100014484
100000938	100000100	100014485
100000938	100000100	100014491
100000938	100000100	100014492
100000938	100000100	100014493
100000938	100000100	100014497
100000938	100000100	100014498
100000938	100000100	100014499
100000938	100000100	100014508
100000938	100000100	100014509
100000938	100000100	100014510
100000938	100000100	100014511
100000938	100000100	100014512
100000938	100000100	100014513
100000938	100000100	100014514
100000938	100000100	100014515
100000938	100000100	100014518
100000938	100000100	100014519
100000938	100000100	100014520
100000938	100000100	100014524
100000938	100000100	100014525
100000938	100000100	100014526
100000938	100000100	100014530
100000938	100000100	100014531
100000938	100000100	100014532
100000938	100000100	100014533
100000938	100000100	100014534
100000938	100000100	100014535
100000938	100000100	100014536
100000938	100000100	100014537
100000938	100000100	100014538
100000938	100000100	100014539
100000938	100000100	100014540
100000938	100000100	100014541
100000938	100000100	100014544
100000938	100000100	100014545
100000938	100000100	100014546
100000938	100000100	100014550
100000938	100000100	100014551
100000938	100000100	100014552
100000938	100000100	100014553
100000938	100000100	100014554
100000938	100000100	100014555
100000938	100000100	100014556
100000938	100000100	100014557
100000938	100000100	100014559
100000938	100000100	100014563
100000938	100000100	100014566
100000938	100000100	100014567
100000938	100000100	100014568
100000938	100000100	100014569
100000938	100000100	100014570
100000938	100000100	100014571
100000938	100000100	100014572
100000938	100000100	100014573
100000938	100000100	100014574
100000938	100000100	100014575
100000938	100000100	100014580
100000938	100000100	100014581
100000938	100000100	100014582
100000938	100000100	100014588
100000938	100000100	100014589
100000938	100000100	100014590
100000938	100000100	100014596
100000938	100000100	100014597
100000938	100000100	100014598
100000938	100000100	100014604
100000938	100000100	100014605
100000938	100000100	100014606
100000938	100000100	100014612
100000938	100000100	100014613
100000938	100000100	100014614
100000938	100000100	100014618
100000938	100000100	100014619
100000938	100000100	100014620
100000938	100000100	100014621
100000938	100000100	100014622
100000938	100000100	100014625
100000938	100000100	100014626
100000938	100000100	100014627
100000938	100000100	100014629
100000938	100000100	100014630
100000938	100000100	100014631
100000938	100000100	100014632
100000938	100000100	100014633
100000938	100000100	100014634
100000938	100000100	100014635
100000938	100000100	100014636
100000938	100000100	100014637
100000938	100000100	100014638
100000938	100000100	100014639
100000938	100000100	100014640
100000938	100000100	100014641
100000938	100000100	100014642
100000938	100000100	100014643
100000938	100000100	100014644
100000938	100000100	100014648
100000938	100000100	100014649
100000938	100000100	100014650
100000938	100000100	100014657
100000938	100000100	100014658
100000938	100000100	100014659
100000938	100000100	100014660
100000938	100000100	100014669
100000938	100000100	100014670
100000938	100000100	100014671
100000938	100000100	100014672
100000938	100000100	100014673
100000938	100000100	100014674
100000938	100000100	100014675
100000938	100000100	100014676
100000938	100000100	100014677
100000938	100000100	100014681
100000938	100000100	100014682
100000938	100000100	100014683
100000938	100000100	100014684
100000938	100000100	100014688
100000938	100000100	100014693
100000938	100000100	100014696
100000938	100000100	100014698
100000938	100000100	100014699
100000938	100000100	100014700
100000938	100000100	100014701
100000938	100000100	100014702
100000938	100000100	100014703
100000938	100000100	100014704
100000938	100000100	100014705
100000938	100000100	100014706
100000938	100000100	100014707
100000938	100000100	100014708
100000938	100000100	100014709
100000938	100000100	100014710
100000938	100000100	100014711
100000938	100000100	100014712
100000938	100000100	100014713
100000938	100000100	100014719
100000938	100000100	100014722
100000938	100000100	100014725
100000938	100000100	100014726
100000938	100000100	100014727
100000938	100000100	100014732
100000938	100000100	100014738
100000938	100000100	100014740
100000938	100000100	100014741
100000938	100000100	100014742
100000938	100000100	100014745
100000938	100000100	100014746
100000938	100000100	100014747
100000938	100000100	100014749
100000938	100000100	100014750
100000938	100000100	100014751
100000938	100000100	100014754
100000938	100000100	100014755
100000938	100000100	100014757
100000938	100000100	100014759
100000938	100000100	100014767
100000938	100000100	100014768
100000938	100000100	100014769
100000938	100000100	100014773
100000938	100000100	100014774
100000938	100000100	100014775
100000938	100000100	100014776
100000938	100000100	100014777
100000938	100000100	100014778
100000938	100000100	100014779
100000938	100000100	100014780
100000938	100000100	100014781
100000938	100000100	100014782
100000938	100000100	100014783
100000938	100000100	100014784
100000938	100000100	100014785
100000938	100000100	100014786
100000938	100000100	100014787
100000938	100000100	100014788
100000938	100000100	100014789
100000938	100000100	100014790
100000938	100000100	100014791
100000938	100000100	100014794
100000938	100000100	100014795
100000938	100000100	100014798
100000938	100000100	100014799
100000938	100000100	100014802
100000938	100000100	100014803
100000938	100000100	100014804
100000938	100000100	100014805
100000938	100000100	100014806
100000938	100000100	100014807
100000938	100000100	100014808
100000938	100000100	100014809
100000938	100000100	100014810
100000938	100000100	100014811
100000938	100000100	100014812
100000938	100000100	100014813
100000938	100000100	100014814
100000938	100000100	100014815
100000938	100000100	100014816
100000938	100000100	100014817
100000938	100000100	100014818
100000938	100000100	100014819
100000938	100000100	100014820
100000938	100000100	100014821
100000938	100000100	100014822
100000938	100000100	100014824
100000938	100000100	100014825
100000938	100000100	100014826
100000938	100000100	100014827
100000938	100000100	100014828
100000938	100000100	100014833
100000938	100000100	100014834
100000938	100000100	100014836
100000938	100000100	100014837
100000938	100000100	100014838
100000938	100000100	100014839
100000938	100000100	100014840
100000938	100000100	100014841
100000938	100000100	100014843
100000938	100000100	100014845
100000938	100000100	100014847
100000938	100000100	100014848
100000938	100000100	100014849
100000938	100000100	100014850
100000938	100000100	100014851
100000938	100000100	100014852
100000938	100000100	100014853
100000938	100000100	100014856
100000938	100000100	100014857
100000938	100000100	100014861
100000938	100000100	100014862
100000938	100000100	100014864
100000938	100000100	100014865
100000938	100000100	100014866
100000938	100000100	100014867
100000938	100000100	100014868
100000938	100000100	100014869
100000938	100000100	100014870
100000938	100000100	100014871
100000938	100000100	100014873
100000938	100000100	100014874
100000938	100000100	100014875
100000938	100000100	100014876
100000938	100000100	100014877
100000938	100000100	100014878
100000938	100000100	100014879
100000938	100000100	100014880
100000938	100000100	100014881
100000938	100000100	100014886
100000938	100000100	100014887
100000938	100000100	100014888
100000938	100000100	100014892
100000938	100000100	100014893
100000938	100000100	100014895
100000938	100000100	100014896
100000938	100000100	100014897
100000938	100000100	100014898
100000938	100000100	100014899
100000938	100000100	100014905
100000938	100000100	100014906
100000938	100000100	100014909
100000938	100000100	100014911
100000938	100000100	100014912
100000938	100000100	100014913
100000938	100000100	100014914
100000938	100000100	100014915
100000938	100000100	100014916
100000938	100000100	100014917
100000938	100000100	100014918
100000938	100000100	100014923
100000938	100000100	100014925
100000938	100000100	100014927
100000938	100000100	100014928
100000938	100000100	100014929
100000938	100000100	100014930
100000938	100000100	100014931
100000938	100000100	100014932
100000938	100000100	100014933
100000938	100000100	100014934
100000938	100000100	100014935
100000938	100000100	100014936
100000938	100000100	100014937
100000938	100000100	100014938
100000938	100000100	100014939
100000938	100000100	100014940
100000938	100000100	100014941
100000938	100000100	100014942
100000938	100000100	100014947
100000938	100000100	100014948
100000938	100000100	100014952
100000938	100000100	100014953
100000938	100000100	100014954
100000938	100000100	100014955
100000938	100000100	100014956
100000938	100000100	100014957
100000938	100000100	100014963
100000938	100000100	100014966
100000938	100000100	100014967
100000938	100000100	100014970
100000938	100000100	100014973
100000938	100000100	100014976
100000938	100000100	100014978
100000938	100000100	100014979
100000938	100000100	100014980
100000938	100000100	100014981
100000938	100000100	100014982
100000938	100000100	100014985
100000938	100000100	100014987
100000938	100000100	100014988
100000938	100000100	100014989
100000938	100000100	100014991
100000938	100000100	100014992
100000938	100000100	100014993
100000938	100000100	100014994
100000938	100000100	100014995
100000938	100000100	100014996
100000938	100000100	100014997
100000938	100000100	100014998
100000938	100000100	100014999
100000938	100000100	100015000
100000938	100000100	100015001
100000938	100000100	100015007
100000938	100000100	100015008
100000938	100000100	100015009
100000938	100000100	100015010
100000938	100000100	100015011
100000938	100000100	100015012
100000938	100000100	100015014
100000938	100000100	100015015
100000938	100000100	100015016
100000938	100000100	100015017
100000938	100000100	100015018
100000938	100000100	100015019
100000938	100000100	100015020
100000938	100000100	100015021
100000938	100000100	100015022
100000938	100000100	100015023
100000938	100000100	100015045
100000938	100000100	100015046
100000938	100000100	100015047
100000938	100000100	100015054
100000938	100000100	100015055
100000938	100000100	100015056
100000938	100000100	100015060
100000938	100000100	100015061
100000938	100000100	100015062
100000938	100000100	100015066
100000938	100000100	100015067
100000938	100000100	100015068
100000938	100000100	100015070
100000938	100000100	100015071
100000938	100000100	100015072
100000938	100000100	100015073
100000938	100000100	100015074
100000938	100000100	100015075
100000938	100000100	100015076
100000938	100000100	100015077
100000938	100000100	100015078
100000938	100000100	100015079
100000938	100000100	100015080
100000938	100000100	100015081
100000938	100000100	100015084
100000938	100000100	100015087
100000938	100000100	100015088
100000938	100000100	100015091
100000938	100000100	100015092
100000938	100000100	100015098
100000938	100000100	100015099
100000938	100000100	100015100
100000938	100000100	100015104
100000938	100000100	100015105
100000938	100000100	100015106
100000938	100000100	100015110
100000938	100000100	100015111
100000938	100000100	100015112
100000938	100000100	100015113
100000938	100000100	100015121
100000938	100000100	100015122
100000938	100000100	100015126
100000938	100000100	100015127
100000938	100000100	100015128
100000938	100000100	100015129
100000938	100000100	100015130
100000938	100000100	100015131
100000938	100000100	100015132
100000938	100000100	100015136
100000938	100000100	100015141
100000938	100000100	100015142
100000938	100000100	100015143
100000938	100000100	100015144
100000938	100000100	100015145
100000938	100000100	100015146
100000938	100000100	100015147
100000938	100000100	100015148
100000938	100000100	100015149
100000938	100000100	100015150
100000938	100000100	100015151
100000938	100000100	100015152
100000938	100000100	100015153
100000938	100000100	100015154
100000938	100000100	100015155
100000938	100000100	100015156
100000938	100000100	100015157
100000938	100000100	100015158
100000938	100000100	100015159
100000938	100000100	100015161
100000938	100000100	100015162
100000938	100000100	100015163
100000938	100000100	100015164
100000938	100000100	100015165
100000938	100000100	100015166
100000938	100000100	100015170
100000938	100000100	100015172
100000938	100000100	100015218
100000938	100000100	100015219
100000938	100000100	100015222
100000938	100000100	100015223
100000938	100000100	100015228
100000938	100000100	100015230
100000938	100000100	100015231
100000938	100000100	100015232
100000938	100000100	100015233
100000938	100000100	100015234
100000938	100000100	100015248
100000938	100000100	100015249
100000938	100000100	100015252
100000938	100000100	100015253
100000938	100000100	100015254
100000938	100000100	100015267
100000938	100000100	100015268
100000938	100000100	100015269
100000938	100000100	100015271
100000938	100000100	100015276
100000938	100000100	100015277
100000938	100000100	100015278
100000938	100000100	100015279
100000938	100000100	100015280
100000938	100000100	100015281
100000938	100000100	100015282
100000938	100000100	100015288
100000938	100000100	100015289
100000938	100000100	100015291
100000938	100000100	100015296
100000938	100000100	100015297
100000938	100000100	100015301
100000938	100000100	100015302
100000938	100000100	100015303
100000938	100000100	100015307
100000938	100000100	100015308
100000938	100000100	100015309
100000938	100000100	100015318
100000938	100000100	100015319
100000938	100000100	100015320
100000938	100000100	100015321
100000938	100000100	100015322
100000938	100000100	100015323
100000938	100000100	100015324
100000938	100000100	100015325
100000938	100000100	100015326
100000938	100000100	100015327
100000938	100000100	100015328
100000938	100000100	100015330
100000938	100000100	100015331
100000938	100000100	100015332
100000938	100000100	100015333
100000938	100000100	100015334
100000938	100000100	100015335
100000938	100000100	100015336
100000938	100000100	100015339
100000938	100000100	100015340
100000938	100000100	100015341
100000938	100000100	100015344
100000938	100000100	100015347
100000938	100000100	100015348
100000938	100000100	100015352
100000938	100000100	100015357
100000938	100000100	100015358
100000938	100000100	100015359
100000938	100000100	100015377
100000938	100000100	100015378
100000938	100000100	100015379
100000938	100000100	100015381
100000938	100000100	100015382
100000938	100000100	100015390
100000938	100000100	100015391
100000938	100000100	100015394
100000938	100000100	100015395
100000938	100000100	100015396
100000938	100000100	100015397
100000938	100000100	100015400
100000938	100000100	100015401
100000938	100000100	100015402
100000938	100000100	100015403
100000938	100000100	100015404
100000938	100000100	100015405
100000938	100000100	100015406
100000938	100000100	100015407
100000938	100000100	100015408
100000938	100000100	100015410
100000938	100000100	100015411
100000938	100000100	100015412
100000938	100000100	100015417
100000938	100000100	100015418
100000938	100000100	100015419
100000938	100000100	100015420
100000938	100000100	100015421
100000938	100000100	100015422
100000938	100000100	100015425
100000938	100000100	100015426
100000938	100000100	100015430
100000938	100000100	100015431
100000938	100000100	100015432
100000938	100000100	100015433
100000938	100000100	100015443
100000938	100000100	100015444
100000938	100000100	100015446
100000938	100000100	100015447
100000938	100000100	100015448
100000938	100000100	100015449
100000938	100000100	100015450
100000938	100000100	100015460
100000938	100000100	100015461
100000938	100000100	100015462
100000938	100000100	100015463
100000938	100000100	100015464
100000938	100000100	100015465
100000938	100000100	100015466
100000938	100000100	100015467
100000938	100000100	100015468
100000938	100000100	100015469
100000938	100000100	100015470
100000938	100000100	100015471
100000938	100000100	100015472
100000938	100000100	100015473
100000938	100000100	100015481
100000938	100000100	100015482
100000938	100000100	100015483
100000938	100000100	100015484
100000938	100000100	100015490
100000938	100000100	100015491
100000938	100000100	100015492
100000938	100000100	100015495
100000938	100000100	100015496
100000938	100000100	100015497
100000938	100000100	100015498
100000938	100000100	100015499
100000938	100000100	100015500
100000938	100000100	100015501
100000938	100000100	100015502
100000938	100000100	100015503
100000938	100000100	100015504
100000938	100000100	100015505
100000938	100000100	100015506
100000938	100000100	100015507
100000938	100000100	100015508
100000938	100000100	100015509
100000938	100000100	100015510
100000938	100000100	100015512
100000938	100000100	100015513
100000938	100000100	100015516
100000938	100000100	100015517
100000938	100000100	100015522
100000938	100000100	100015523
100000938	100000100	100015528
100000938	100000100	100015529
100000938	100000100	100015530
100000938	100000100	100015531
100000938	100000100	100015532
100000938	100000100	100015533
100000938	100000100	100015534
100000938	100000100	100015538
100000938	100000100	100015539
100000938	100000100	100015541
100000938	100000100	100015544
100000938	100000100	100015545
100000938	100000100	100015546
100000938	100000100	100015553
100000938	100000100	100015584
100000938	100000100	100015585
100000938	100000100	100015586
100000938	100000100	100015587
100000938	100000100	100015588
100000938	100000100	100015589
100000938	100000100	100015590
100000938	100000100	100015591
100000938	100000100	100015592
100000938	100000100	100015593
100000938	100000100	100015594
100000938	100000100	100015595
100000938	100000100	100015596
100000938	100000100	100015597
100000938	100000100	100015598
100000938	100000100	100015599
100000938	100000100	100015600
100000938	100000100	100015601
100000938	100000100	100015602
100000938	100000100	100015603
100000938	100000100	100015604
100000938	100000100	100015605
100000938	100000100	100015606
100000938	100000100	100015607
100000938	100000100	100015608
100000938	100000100	100015609
100000938	100000100	100015610
100000938	100000100	100015611
100000938	100000100	100015612
100000938	100000100	100015613
100000938	100000100	100015621
100000938	100000100	100015622
100000938	100000100	100015623
100000938	100000100	100015624
100000938	100000100	100015625
100000938	100000100	100015626
100000938	100000100	100015632
100000938	100000100	100015633
100000938	100000100	100015635
100000938	100000100	100015636
100000938	100000100	100015637
100000938	100000100	100015638
100000938	100000100	100015639
100000938	100000100	100015640
100000938	100000100	100015641
100000938	100000100	100015642
100000938	100000100	100015643
100000938	100000100	100015644
100000938	100000100	100015645
100000938	100000100	100015646
100000938	100000100	100015647
100000938	100000100	100015648
100000938	100000100	100015649
100000938	100000100	100015655
100000938	100000100	100015656
100000938	100000100	100015657
100000938	100000100	100015658
100000938	100000100	100015659
100000938	100000100	100015660
100000938	100000100	100015661
100000938	100000100	100015662
100000938	100000100	100015663
100000938	100000100	100015664
100000938	100000100	100015665
100000938	100000100	100015666
100000938	100000100	100015667
100000938	100000100	100015668
100000938	100000100	100015669
100000938	100000100	100015670
100000938	100000100	100015671
100000938	100000100	100015672
100000938	100000100	100015673
100000938	100000100	100015674
100000938	100000100	100015675
100000938	100000100	100015676
100000938	100000100	100015677
100000938	100000100	100015678
100000938	100000100	100015679
100000938	100000100	100015680
100000938	100000100	100015682
100000938	100000100	100015683
100000938	100000100	100015684
100000938	100000100	100015685
100000938	100000100	100015691
100000938	100000100	100015695
100000938	100000100	100015696
100000938	100000100	100015697
100000938	100000100	100015698
100000938	100000100	100015699
100000938	100000100	100015700
100000938	100000100	100015701
100000938	100000100	100015702
100000938	100000100	100015703
100000938	100000100	100015705
100000938	100000100	100015706
100000938	100000100	100015707
100000938	100000100	100015708
100000938	100000100	100015710
100000938	100000100	100015711
100000938	100000100	100015713
100000938	100000100	100015714
100000938	100000100	100015715
100000938	100000100	100015716
100000938	100000100	100015717
100000938	100000100	100015718
100000938	100000100	100015719
100000938	100000100	100015720
100000938	100000100	100015721
100000938	100000100	100015722
100000938	100000100	100015723
100000938	100000100	100015724
100000938	100000100	100015725
100000938	100000100	100015726
100000938	100000100	100015727
100000938	100000100	100015728
100000938	100000100	100015729
100000938	100000100	100015730
100000938	100000100	100015731
100000938	100000100	100015732
100000938	100000100	100015733
100000938	100000100	100015734
100000938	100000100	100015735
100000938	100000100	100015736
100000938	100000100	100015737
100000938	100000100	100015738
100000938	100000100	100015739
100000938	100000100	100015740
100000938	100000100	100015741
100000938	100000100	100015742
100000938	100000100	100015743
100000938	100000100	100015744
100000938	100000100	100015745
100000938	100000100	100015746
100000938	100000100	100015747
100000938	100000100	100015748
100000938	100000100	100015749
100000938	100000100	100015750
100000938	100000100	100015751
100000938	100000100	100015752
100000938	100000100	100015753
100000938	100000100	100015754
100000938	100000100	100015755
100000938	100000100	100015756
100000938	100000100	100015757
100000938	100000100	100015758
100000938	100000100	100015759
100000938	100000100	100015760
100000938	100000100	100015761
100000938	100000100	100015764
100000938	100000100	100015766
100000938	100000100	100015769
100000938	100000100	100015770
100000938	100000100	100015771
100000938	100000100	100015772
100000938	100000100	100015773
100000938	100000100	100015774
100000938	100000100	100015775
100000938	100000100	100015776
100000938	100000100	100015777
100000938	100000100	100015778
100000938	100000100	100015779
100000938	100000100	100015780
100000938	100000100	100015781
100000938	100000100	100015782
100000938	100000100	100015783
100000938	100000100	100015784
100000938	100000100	100015785
100000938	100000100	100015786
100000938	100000100	100015787
100000938	100000100	100015788
100000938	100000100	100015789
100000938	100000100	100015790
100000938	100000100	100015791
100000938	100000100	100015792
100000938	100000100	100015794
100000938	100000100	100015795
100000938	100000100	100015796
100000938	100000100	100015797
100000938	100000100	100015798
100000938	100000100	100015799
100000938	100000100	100015800
100000938	100000100	100015801
100000938	100000100	100015802
100000938	100000100	100015803
100000938	100000100	100015804
100000938	100000100	100015805
100000938	100000100	100015806
100000939	100000100	100014441
100000939	100000100	100014442
100000939	100000100	100014443
100000939	100000100	100014444
100000939	100000100	100014445
100000939	100000100	100014446
100000939	100000100	100014447
100000939	100000100	100014448
100000939	100000100	100014449
100000939	100000100	100014450
100000939	100000100	100014451
100000939	100000100	100014452
100000939	100000100	100014453
100000939	100000100	100014454
100000939	100000100	100014455
100000939	100000100	100014472
100000939	100000100	100014473
100000939	100000100	100014474
100000939	100000100	100014475
100000939	100000100	100014476
100000939	100000100	100014477
100000939	100000100	100014478
100000939	100000100	100014479
100000939	100000100	100014480
100000939	100000100	100014481
100000939	100000100	100014482
100000939	100000100	100014483
100000939	100000100	100014484
100000939	100000100	100014485
100000939	100000100	100014486
100000939	100000100	100014487
100000939	100000100	100014488
100000939	100000100	100014489
100000939	100000100	100014490
100000939	100000100	100014491
100000939	100000100	100014492
100000939	100000100	100014493
100000939	100000100	100014494
100000939	100000100	100014495
100000939	100000100	100014496
100000939	100000100	100014497
100000939	100000100	100014498
100000939	100000100	100014499
100000939	100000100	100014500
100000939	100000100	100014508
100000939	100000100	100014509
100000939	100000100	100014510
100000939	100000100	100014511
100000939	100000100	100014512
100000939	100000100	100014513
100000939	100000100	100014514
100000939	100000100	100014515
100000939	100000100	100014516
100000939	100000100	100014517
100000939	100000100	100014519
100000939	100000100	100014521
100000939	100000100	100014522
100000939	100000100	100014523
100000939	100000100	100014524
100000939	100000100	100014525
100000939	100000100	100014527
100000939	100000100	100014528
100000939	100000100	100014529
100000939	100000100	100014530
100000939	100000100	100014531
100000939	100000100	100014532
100000939	100000100	100014533
100000939	100000100	100014534
100000939	100000100	100014535
100000939	100000100	100014536
100000939	100000100	100014537
100000939	100000100	100014538
100000939	100000100	100014539
100000939	100000100	100014540
100000939	100000100	100014541
100000939	100000100	100014542
100000939	100000100	100014543
100000939	100000100	100014545
100000939	100000100	100014547
100000939	100000100	100014548
100000939	100000100	100014549
100000939	100000100	100014556
100000939	100000100	100014557
100000939	100000100	100014558
100000939	100000100	100014559
100000939	100000100	100014560
100000939	100000100	100014562
100000939	100000100	100014564
100000939	100000100	100014576
100000939	100000100	100014577
100000939	100000100	100014578
100000939	100000100	100014579
100000939	100000100	100014583
100000939	100000100	100014584
100000939	100000100	100014585
100000939	100000100	100014586
100000939	100000100	100014587
100000939	100000100	100014591
100000939	100000100	100014592
100000939	100000100	100014593
100000939	100000100	100014596
100000939	100000100	100014597
100000939	100000100	100014598
100000939	100000100	100014646
100000939	100000100	100014647
100000939	100000100	100014648
100000939	100000100	100014649
100000939	100000100	100014650
100000939	100000100	100014651
100000939	100000100	100014652
100000939	100000100	100014653
100000939	100000100	100014765
100000939	100000100	100014766
100000939	100000100	100014767
100000939	100000100	100014768
100000939	100000100	100014769
100000939	100000100	100014770
100000939	100000100	100014771
100000939	100000100	100014772
100000939	100000100	100014778
100000939	100000100	100014792
100000939	100000100	100014793
100000939	100000100	100014794
100000939	100000100	100014795
100000939	100000100	100014796
100000939	100000100	100014797
100000939	100000100	100014798
100000939	100000100	100014799
100000939	100000100	100014800
100000939	100000100	100014801
100000939	100000100	100014829
100000939	100000100	100014830
100000939	100000100	100014831
100000939	100000100	100014832
100000939	100000100	100014833
100000939	100000100	100014834
100000939	100000100	100014835
100000939	100000100	100014854
100000939	100000100	100014855
100000939	100000100	100014856
100000939	100000100	100014857
100000939	100000100	100014858
100000939	100000100	100014859
100000939	100000100	100014860
100000939	100000100	100014861
100000939	100000100	100014863
100000939	100000100	100014872
100000939	100000100	100014910
100000939	100000100	100014951
100000939	100000100	100014952
100000939	100000100	100014953
100000939	100000100	100014954
100000939	100000100	100014955
100000939	100000100	100014956
100000939	100000100	100014957
100000939	100000100	100014984
100000939	100000100	100014986
100000939	100000100	100015024
100000939	100000100	100015025
100000939	100000100	100015026
100000939	100000100	100015027
100000939	100000100	100015028
100000939	100000100	100015029
100000939	100000100	100015030
100000939	100000100	100015031
100000939	100000100	100015032
100000939	100000100	100015033
100000939	100000100	100015034
100000939	100000100	100015035
100000939	100000100	100015036
100000939	100000100	100015037
100000939	100000100	100015038
100000939	100000100	100015039
100000939	100000100	100015040
100000939	100000100	100015041
100000939	100000100	100015042
100000939	100000100	100015043
100000939	100000100	100015044
100000939	100000100	100015047
100000939	100000100	100015048
100000939	100000100	100015049
100000939	100000100	100015050
100000939	100000100	100015051
100000939	100000100	100015052
100000939	100000100	100015053
100000939	100000100	100015056
100000939	100000100	100015057
100000939	100000100	100015058
100000939	100000100	100015059
100000939	100000100	100015063
100000939	100000100	100015064
100000939	100000100	100015065
100000939	100000100	100015069
100000939	100000100	100015083
100000939	100000100	100015085
100000939	100000100	100015086
100000939	100000100	100015087
100000939	100000100	100015089
100000939	100000100	100015090
100000939	100000100	100015092
100000939	100000100	100015093
100000939	100000100	100015094
100000939	100000100	100015095
100000939	100000100	100015096
100000939	100000100	100015097
100000939	100000100	100015100
100000939	100000100	100015101
100000939	100000100	100015102
100000939	100000100	100015103
100000939	100000100	100015106
100000939	100000100	100015107
100000939	100000100	100015108
100000939	100000100	100015109
100000939	100000100	100015113
100000939	100000100	100015114
100000939	100000100	100015115
100000939	100000100	100015119
100000939	100000100	100015120
100000939	100000100	100015122
100000939	100000100	100015123
100000939	100000100	100015124
100000939	100000100	100015125
100000939	100000100	100015133
100000939	100000100	100015137
100000939	100000100	100015138
100000939	100000100	100015139
100000939	100000100	100015171
100000939	100000100	100015172
100000939	100000100	100015246
100000939	100000100	100015247
100000939	100000100	100015250
100000939	100000100	100015251
100000939	100000100	100015269
100000939	100000100	100015283
100000939	100000100	100015284
100000939	100000100	100015285
100000939	100000100	100015286
100000939	100000100	100015287
100000939	100000100	100015289
100000939	100000100	100015290
100000939	100000100	100015291
100000939	100000100	100015292
100000939	100000100	100015293
100000939	100000100	100015294
100000939	100000100	100015295
100000939	100000100	100015298
100000939	100000100	100015299
100000939	100000100	100015300
100000939	100000100	100015302
100000939	100000100	100015304
100000939	100000100	100015305
100000939	100000100	100015306
100000939	100000100	100015329
100000939	100000100	100015337
100000939	100000100	100015338
100000939	100000100	100015342
100000939	100000100	100015343
100000939	100000100	100015345
100000939	100000100	100015346
100000939	100000100	100015348
100000939	100000100	100015349
100000939	100000100	100015350
100000939	100000100	100015351
100000939	100000100	100015353
100000939	100000100	100015354
100000939	100000100	100015355
100000939	100000100	100015356
100000939	100000100	100015359
100000939	100000100	100015360
100000939	100000100	100015361
100000939	100000100	100015362
100000939	100000100	100015380
100000939	100000100	100015382
100000939	100000100	100015383
100000939	100000100	100015384
100000939	100000100	100015385
100000939	100000100	100015386
100000939	100000100	100015387
100000939	100000100	100015388
100000939	100000100	100015389
100000939	100000100	100015392
100000939	100000100	100015393
100000939	100000100	100015398
100000939	100000100	100015399
100000939	100000100	100015409
100000939	100000100	100015411
100000939	100000100	100015413
100000939	100000100	100015414
100000939	100000100	100015415
100000939	100000100	100015416
100000939	100000100	100015423
100000939	100000100	100015424
100000939	100000100	100015426
100000939	100000100	100015427
100000939	100000100	100015428
100000939	100000100	100015429
100000939	100000100	100015442
100000939	100000100	100015445
100000939	100000100	100015472
100000939	100000100	100015474
100000939	100000100	100015475
100000939	100000100	100015476
100000939	100000100	100015477
100000939	100000100	100015478
100000939	100000100	100015479
100000939	100000100	100015480
100000939	100000100	100015485
100000939	100000100	100015486
100000939	100000100	100015487
100000939	100000100	100015488
100000939	100000100	100015489
100000939	100000100	100015491
100000939	100000100	100015493
100000939	100000100	100015494
100000939	100000100	100015511
100000939	100000100	100015514
100000939	100000100	100015515
100000939	100000100	100015518
100000939	100000100	100015519
100000939	100000100	100015520
100000939	100000100	100015521
100000939	100000100	100015524
100000939	100000100	100015525
100000939	100000100	100015526
100000939	100000100	100015527
100000939	100000100	100015529
100000939	100000100	100015535
100000939	100000100	100015536
100000939	100000100	100015537
100000939	100000100	100015547
100000939	100000100	100015548
100000939	100000100	100015549
100000939	100000100	100015614
100000939	100000100	100015615
100000939	100000100	100015616
100000939	100000100	100015617
100000939	100000100	100015618
100000939	100000100	100015619
100000939	100000100	100015620
100000939	100000100	100015625
100000939	100000100	100015627
100000939	100000100	100015628
100000939	100000100	100015629
100000939	100000100	100015630
100000939	100000100	100015631
100000939	100000100	100015634
100000939	100000100	100015649
100000939	100000100	100015650
100000939	100000100	100015651
100000939	100000100	100015652
100000939	100000100	100015653
100000939	100000100	100015654
100000939	100000100	100015681
100000939	100000100	100015682
100000939	100000100	100015686
100000939	100000100	100015687
100000939	100000100	100015688
100000939	100000100	100015689
100000939	100000100	100015690
100000939	100000100	100015692
100000939	100000100	100015693
100000939	100000100	100015694
100000939	100000100	100015704
100000939	100000100	100015709
100000939	100000100	100015712
100000939	100000100	100015762
100000939	100000100	100015763
100000939	100000100	100015765
100000939	100000100	100015766
100000939	100000100	100015767
100000939	100000100	100015768
100000939	100000100	100015793
100000940	100000100	100014484
100000940	100000100	100014509
100000940	100000100	100014516
100000940	100000100	100014517
100000940	100000100	100014518
100000940	100000100	100014519
100000940	100000100	100014520
100000940	100000100	100014521
100000940	100000100	100014522
100000940	100000100	100014523
100000940	100000100	100014524
100000940	100000100	100014525
100000940	100000100	100014526
100000940	100000100	100014527
100000940	100000100	100014528
100000940	100000100	100014529
100000940	100000100	100014559
100000940	100000100	100014561
100000940	100000100	100014565
100000940	100000100	100014576
100000940	100000100	100014577
100000940	100000100	100014578
100000940	100000100	100014579
100000940	100000100	100014580
100000940	100000100	100014581
100000940	100000100	100014582
100000940	100000100	100014583
100000940	100000100	100014584
100000940	100000100	100014585
100000940	100000100	100014707
100000940	100000100	100014708
100000940	100000100	100014711
100000940	100000100	100014712
100000940	100000100	100014719
100000940	100000100	100014740
100000940	100000100	100014743
100000940	100000100	100014744
100000940	100000100	100014745
100000940	100000100	100014746
100000940	100000100	100014747
100000940	100000100	100014748
100000940	100000100	100014752
100000940	100000100	100014753
100000940	100000100	100014754
100000940	100000100	100014755
100000940	100000100	100014756
100000940	100000100	100014760
100000940	100000100	100014761
100000940	100000100	100014762
100000940	100000100	100014763
100000940	100000100	100014764
100000940	100000100	100014799
100000940	100000100	100014862
100000940	100000100	100014883
100000940	100000100	100014884
100000940	100000100	100014885
100000940	100000100	100014893
100000940	100000100	100014910
100000940	100000100	100014964
100000940	100000100	100014965
100000940	100000100	100014966
100000940	100000100	100014967
100000940	100000100	100014968
100000940	100000100	100014969
100000940	100000100	100014970
100000940	100000100	100014971
100000940	100000100	100014972
100000940	100000100	100014973
100000940	100000100	100014974
100000940	100000100	100014975
100000940	100000100	100014976
100000940	100000100	100014977
100000940	100000100	100015082
100000940	100000100	100015083
100000940	100000100	100015117
100000940	100000100	100015134
100000940	100000100	100015135
100000940	100000100	100015160
100000940	100000100	100015169
100000940	100000100	100015235
100000940	100000100	100015236
100000940	100000100	100015237
100000940	100000100	100015238
100000940	100000100	100015239
100000940	100000100	100015240
100000940	100000100	100015241
100000940	100000100	100015242
100000940	100000100	100015243
100000940	100000100	100015244
100000940	100000100	100015398
100000940	100000100	100015399
100000940	100000100	100015456
100000940	100000100	100015457
100000940	100000100	100015458
100000940	100000100	100015459
100000940	100000100	100015790
100000941	100000100	100014594
100000941	100000100	100014595
100000941	100000100	100014596
100000941	100000100	100014597
100000941	100000100	100014598
100000941	100000100	100014599
100000941	100000100	100014600
100000941	100000100	100014601
100000941	100000100	100014602
100000941	100000100	100014603
100000941	100000100	100014605
100000941	100000100	100014607
100000941	100000100	100014608
100000941	100000100	100014609
100000941	100000100	100014610
100000941	100000100	100014611
100000941	100000100	100014612
100000941	100000100	100014613
100000941	100000100	100014614
100000941	100000100	100014615
100000941	100000100	100014616
100000941	100000100	100014617
100000941	100000100	100014623
100000941	100000100	100014624
100000941	100000100	100014625
100000941	100000100	100014626
100000941	100000100	100014627
100000941	100000100	100014628
100000941	100000100	100014728
100000941	100000100	100014729
100000941	100000100	100014730
100000941	100000100	100014731
100000941	100000100	100014732
100000941	100000100	100014733
100000941	100000100	100014734
100000941	100000100	100014736
100000941	100000100	100014919
100000941	100000100	100014920
100000941	100000100	100014923
100000941	100000100	100014924
100000941	100000100	100014925
100000941	100000100	100014926
100000941	100000100	100015116
100000941	100000100	100015540
100000941	100000100	100015542
100000941	100000100	100015543
100000941	100000100	100015550
100000944	100000100	100014893
100000944	100000100	100014907
100000944	100000100	100014908
100000944	100000100	100014949
100000944	100000100	100015272
100000944	100000100	100015273
100000944	100000100	100015274
100000944	100000100	100015275
100000945	100000100	100015137
100000945	100000100	100015138
100000945	100000100	100015140
100000946	100000099	100014302
100000946	100000099	100014303
100000946	100000099	100014308
100000946	100000099	100014313
100000946	100000099	100014314
100000946	100000099	100014325
100000946	100000099	100014334
100000946	100000099	100014335
100000946	100000099	100014340
100000946	100000099	100014355
100000946	100000099	100014359
100000946	100000099	100014360
100000946	100000099	100014365
100000946	100000099	100014370
100000946	100000099	100014375
100000946	100000099	100014379
100000946	100000099	100014380
100000946	100000099	100014381
100000946	100000099	100014382
100000946	100000099	100014383
100000946	100000099	100014384
100000946	100000099	100014385
100000946	100000099	100014386
100000946	100000099	100014387
100000946	100000099	100014388
100000946	100000099	100014412
100000946	100000099	100015558
100000949	100000100	100015453
100000949	100000100	100015454
100000949	100000100	100015455
100000931	100000099	100015807
100000933	100000099	100015807
100000931	100000099	100015808
100000933	100000099	100015808
100000931	100000099	100015809
100000933	100000099	100015809
100000931	100000099	100015810
100000933	100000099	100015810
100000931	100000099	100015811
100000933	100000099	100015811
100000932	100000099	100015812
100000936	100000099	100015812
100000932	100000099	100015813
100000936	100000099	100015813
100000932	100000099	100015814
100000931	100000099	100015815
100000933	100000099	100015815
100000931	100000099	100015816
100000933	100000099	100015816
100000932	100000099	100015817
100000936	100000099	100015817
100000932	100000099	100015818
100000936	100000099	100015818
100000932	100000099	100015819
100000932	100000099	100015820
100000931	100000099	100015820
100000931	100000099	100015821
100000931	100000099	100015822
100000931	100000099	100015823
100000931	100000099	100015824
100000937	100000099	100015571
100000937	100000099	100015568
100000937	100000099	100015572
100000937	100000099	100015580
100000937	100000099	100015581
100000937	100000099	100015823
100000937	100000099	100015824
100000938	100000100	100015825
100000938	100000100	100015826
100000938	100000100	100015827
100000940	100000100	100015828
100000940	100000100	100015829
100000939	100000100	100015830
100000939	100000100	100015831
100000938	100000100	100015832
100000939	100000100	100015833
100000939	100000100	100015834
100000938	100000100	100015835
100000939	100000100	100015835
100000939	100000100	100015836
100000939	100000100	100015837
100000938	100000100	100015838
100000938	100000100	100015839
100000939	100000100	100015840
100000939	100000100	100015841
100000939	100000100	100015842
100000938	100000100	100015843
100000939	100000100	100015844
100000938	100000100	100015845
100000939	100000100	100015845
100000938	100000100	100015846
100000939	100000100	100015847
100000939	100000100	100015848
100000939	100000100	100015849
100000938	100000100	100015850
100000939	100000100	100015851
100000939	100000100	100015852
100000938	100000100	100015853
100000938	100000100	100015854
100000938	100000100	100015855
100000939	100000100	100015856
100000939	100000100	100015857
100000938	100000100	100015858
100000939	100000100	100015859
100000938	100000100	100015860
100000938	100000100	100015861
100000939	100000100	100015862
100000939	100000100	100015863
100000939	100000100	100015864
100000939	100000100	100015865
100000938	100000100	100015866
100000939	100000100	100015867
100000938	100000100	100015868
100000938	100000100	100015869
100000939	100000100	100015870
100000939	100000100	100015871
100000939	100000100	100015872
100000938	100000100	100015873
100000939	100000100	100015874
100000938	100000100	100015875
100000939	100000100	100015876
100000938	100000100	100015877
100000939	100000100	100015878
100000938	100000100	100015879
100000938	100000100	100015880
100000938	100000100	100015881
100000938	100000100	100015882
100000938	100000100	100015883
100000938	100000100	100015884
100000938	100000100	100015885
100000938	100000100	100015886
100000938	100000100	100015887
100000938	100000100	100015888
100000938	100000100	100015889
100000938	100000100	100015890
100000938	100000100	100015891
100000938	100000100	100015892
100000938	100000100	100015893
100000938	100000100	100015894
100000938	100000100	100015895
100000938	100000100	100015896
100000938	100000100	100015897
100000939	100000100	100015898
100000939	100000100	100015899
100000938	100000100	100015900
100000938	100000100	100015901
100000938	100000100	100015902
100000938	100000100	100015903
100000938	100000100	100015904
100000938	100000100	100015905
100000938	100000100	100015906
100000938	100000100	100015907
100000938	100000100	100015908
100000938	100000100	100015909
100000938	100000100	100015910
100000938	100000100	100015911
100000938	100000100	100015926
100000939	100000100	100015928
100000939	100000100	100015929
100000938	100000100	100015933
100000938	100000100	100015934
100000941	100000100	100015935
100000941	100000100	100015936
100000941	100000100	100015937
100000941	100000100	100015938
100000941	100000100	100015939
100000938	100000100	100015940
100000950	100000100	100015940
100000950	100000100	100015941
100000950	100000100	100015942
100000941	100000100	100015942
100000938	100000100	100015943
100000950	100000100	100015944
100000941	100000100	100015944
100000950	100000100	100015946
100000941	100000100	100015946
100000950	100000100	100015937
100000941	100000100	100015947
100000941	100000100	100015948
100000938	100000100	100015949
100000941	100000100	100015950
100000941	100000100	100015951
100000941	100000100	100015952
100000941	100000100	100015953
100000938	100000100	100015954
100000941	100000100	100015954
100000941	100000100	100015955
100000938	100000100	100015956
100000941	100000100	100015958
100000938	100000100	100015959
100000941	100000100	100015960
100000938	100000100	100015961
100000941	100000100	100015961
100000941	100000100	100015962
100000941	100000100	100015963
100000938	100000100	100015964
100000938	100000100	100015965
100000941	100000100	100015966
100000939	100000100	100015967
100000939	100000100	100015968
100000939	100000100	100015969
100000938	100000100	100015970
100000938	100000100	100015971
100000938	100000100	100015972
100000938	100000100	100015973
100000938	100000100	100015974
100000938	100000100	100015975
100000939	100000100	100015975
100000938	100000100	100015976
100000939	100000100	100015977
100000939	100000100	100015978
100000939	100000100	100015979
100000939	100000100	100015980
100000939	100000100	100015981
100000938	100000100	100014910
100000938	100000100	100015982
100000938	100000100	100015983
100000938	100000100	100015984
100000938	100000100	100015985
100000938	100000100	100015986
100000951	100000100	100014435
100000951	100000100	100014436
100000951	100000100	100014437
100000951	100000100	100014438
100000951	100000100	100014439
100000951	100000100	100014440
100000951	100000100	100014443
100000951	100000100	100014444
100000951	100000100	100014445
100000951	100000100	100014450
100000951	100000100	100014451
100000951	100000100	100014452
100000951	100000100	100014466
100000951	100000100	100014467
100000951	100000100	100014468
100000951	100000100	100014474
100000951	100000100	100014475
100000951	100000100	100014476
100000951	100000100	100014483
100000951	100000100	100014484
100000951	100000100	100014485
100000951	100000100	100014491
100000951	100000100	100014492
100000951	100000100	100014493
100000951	100000100	100014497
100000951	100000100	100014498
100000951	100000100	100014499
100000951	100000100	100014508
100000951	100000100	100014509
100000951	100000100	100014510
100000951	100000100	100014511
100000951	100000100	100014512
100000951	100000100	100014513
100000951	100000100	100014514
100000951	100000100	100014515
100000951	100000100	100014518
100000951	100000100	100014519
100000951	100000100	100014520
100000951	100000100	100014524
100000951	100000100	100014525
100000951	100000100	100014526
100000951	100000100	100014530
100000951	100000100	100014531
100000951	100000100	100014532
100000951	100000100	100014533
100000951	100000100	100014534
100000951	100000100	100014535
100000951	100000100	100014536
100000951	100000100	100014537
100000951	100000100	100014538
100000951	100000100	100014539
100000951	100000100	100014540
100000951	100000100	100014541
100000951	100000100	100014544
100000951	100000100	100014545
100000951	100000100	100014546
100000951	100000100	100014556
100000951	100000100	100014557
100000951	100000100	100014559
100000951	100000100	100014563
100000951	100000100	100014566
100000951	100000100	100014567
100000951	100000100	100014568
100000951	100000100	100014569
100000951	100000100	100014570
100000951	100000100	100014571
100000951	100000100	100014580
100000951	100000100	100014581
100000951	100000100	100014582
100000951	100000100	100014588
100000951	100000100	100014589
100000951	100000100	100014590
100000951	100000100	100014596
100000951	100000100	100014597
100000951	100000100	100014598
100000951	100000100	100014604
100000951	100000100	100014605
100000951	100000100	100014606
100000951	100000100	100014612
100000951	100000100	100014613
100000951	100000100	100014614
100000951	100000100	100014625
100000951	100000100	100014626
100000951	100000100	100014627
100000951	100000100	100014629
100000951	100000100	100014630
100000951	100000100	100014631
100000951	100000100	100014632
100000951	100000100	100014633
100000951	100000100	100014634
100000951	100000100	100014635
100000951	100000100	100014636
100000951	100000100	100014637
100000951	100000100	100014638
100000951	100000100	100014639
100000951	100000100	100014640
100000951	100000100	100014641
100000951	100000100	100014642
100000951	100000100	100014643
100000951	100000100	100014644
100000951	100000100	100014648
100000951	100000100	100014649
100000951	100000100	100014650
100000951	100000100	100014657
100000951	100000100	100014659
100000951	100000100	100014660
100000951	100000100	100014688
100000951	100000100	100014693
100000951	100000100	100014698
100000951	100000100	100014705
100000951	100000100	100014706
100000951	100000100	100014707
100000951	100000100	100014708
100000951	100000100	100014709
100000951	100000100	100014710
100000951	100000100	100014711
100000951	100000100	100014712
100000951	100000100	100014713
100000951	100000100	100014719
100000951	100000100	100014722
100000951	100000100	100014725
100000951	100000100	100014726
100000951	100000100	100014727
100000951	100000100	100014740
100000951	100000100	100014745
100000951	100000100	100014746
100000951	100000100	100014747
100000951	100000100	100014749
100000951	100000100	100014750
100000951	100000100	100014751
100000951	100000100	100014754
100000951	100000100	100014755
100000951	100000100	100014757
100000951	100000100	100014759
100000951	100000100	100014767
100000951	100000100	100014768
100000951	100000100	100014769
100000951	100000100	100014774
100000951	100000100	100014775
100000951	100000100	100014776
100000951	100000100	100014777
100000951	100000100	100014778
100000951	100000100	100014779
100000951	100000100	100014780
100000951	100000100	100014784
100000951	100000100	100014785
100000951	100000100	100014794
100000951	100000100	100014795
100000951	100000100	100014798
100000951	100000100	100014799
100000951	100000100	100014806
100000951	100000100	100014807
100000951	100000100	100014808
100000951	100000100	100014809
100000951	100000100	100014814
100000951	100000100	100014815
100000951	100000100	100014816
100000951	100000100	100014817
100000951	100000100	100014818
100000951	100000100	100014819
100000951	100000100	100014820
100000951	100000100	100014821
100000951	100000100	100014822
100000951	100000100	100014824
100000951	100000100	100014825
100000951	100000100	100014826
100000951	100000100	100014827
100000951	100000100	100014833
100000951	100000100	100014834
100000951	100000100	100014836
100000951	100000100	100014838
100000951	100000100	100014839
100000951	100000100	100014841
100000951	100000100	100014843
100000951	100000100	100014845
100000951	100000100	100014847
100000951	100000100	100014848
100000951	100000100	100014849
100000951	100000100	100014850
100000951	100000100	100014851
100000951	100000100	100014852
100000951	100000100	100014853
100000951	100000100	100014856
100000951	100000100	100014857
100000951	100000100	100014861
100000951	100000100	100014862
100000951	100000100	100014864
100000951	100000100	100014865
100000951	100000100	100014866
100000951	100000100	100014867
100000951	100000100	100014868
100000951	100000100	100014869
100000951	100000100	100014870
100000951	100000100	100014871
100000951	100000100	100014873
100000951	100000100	100014874
100000951	100000100	100014893
100000951	100000100	100014895
100000951	100000100	100014896
100000951	100000100	100014897
100000951	100000100	100014898
100000951	100000100	100014899
100000951	100000100	100014905
100000951	100000100	100014906
100000951	100000100	100014909
100000951	100000100	100014923
100000951	100000100	100014925
100000951	100000100	100014927
100000951	100000100	100014928
100000951	100000100	100014929
100000951	100000100	100014931
100000951	100000100	100014932
100000951	100000100	100014933
100000951	100000100	100014934
100000951	100000100	100014935
100000951	100000100	100014936
100000951	100000100	100014937
100000951	100000100	100014938
100000951	100000100	100014939
100000951	100000100	100014940
100000951	100000100	100014941
100000951	100000100	100014942
100000951	100000100	100014947
100000951	100000100	100014948
100000951	100000100	100014952
100000951	100000100	100014953
100000951	100000100	100014954
100000951	100000100	100014955
100000951	100000100	100014956
100000951	100000100	100014957
100000951	100000100	100014963
100000951	100000100	100014966
100000951	100000100	100014967
100000951	100000100	100014970
100000951	100000100	100014973
100000951	100000100	100014976
100000951	100000100	100014978
100000951	100000100	100014979
100000951	100000100	100014980
100000951	100000100	100014981
100000951	100000100	100014982
100000951	100000100	100014985
100000951	100000100	100014987
100000951	100000100	100014988
100000951	100000100	100014989
100000951	100000100	100014991
100000951	100000100	100014992
100000951	100000100	100014993
100000951	100000100	100015007
100000951	100000100	100015008
100000951	100000100	100015009
100000951	100000100	100015010
100000951	100000100	100015017
100000951	100000100	100015018
100000951	100000100	100015019
100000951	100000100	100015020
100000951	100000100	100015021
100000951	100000100	100015022
100000951	100000100	100015023
100000951	100000100	100015045
100000951	100000100	100015046
100000951	100000100	100015047
100000951	100000100	100015054
100000951	100000100	100015055
100000951	100000100	100015056
100000951	100000100	100015080
100000951	100000100	100015081
100000951	100000100	100015088
100000951	100000100	100015091
100000951	100000100	100015092
100000951	100000100	100015098
100000951	100000100	100015099
100000951	100000100	100015100
100000951	100000100	100015104
100000951	100000100	100015105
100000951	100000100	100015106
100000951	100000100	100015110
100000951	100000100	100015111
100000951	100000100	100015112
100000951	100000100	100015113
100000951	100000100	100015121
100000951	100000100	100015122
100000951	100000100	100015126
100000951	100000100	100015127
100000951	100000100	100015128
100000951	100000100	100015132
100000951	100000100	100015136
100000951	100000100	100015141
100000951	100000100	100015142
100000951	100000100	100015143
100000951	100000100	100015144
100000951	100000100	100015145
100000951	100000100	100015146
100000951	100000100	100015161
100000951	100000100	100015162
100000951	100000100	100015163
100000951	100000100	100015164
100000951	100000100	100015165
100000951	100000100	100015166
100000951	100000100	100015170
100000951	100000100	100015172
100000951	100000100	100015218
100000951	100000100	100015219
100000951	100000100	100015222
100000951	100000100	100015223
100000951	100000100	100015228
100000951	100000100	100015234
100000951	100000100	100015248
100000951	100000100	100015249
100000951	100000100	100015252
100000951	100000100	100015253
100000951	100000100	100015254
100000951	100000100	100015267
100000951	100000100	100015268
100000951	100000100	100015269
100000951	100000100	100015271
100000951	100000100	100015276
100000951	100000100	100015277
100000951	100000100	100015278
100000951	100000100	100015279
100000951	100000100	100015280
100000951	100000100	100015281
100000951	100000100	100015282
100000951	100000100	100015288
100000951	100000100	100015289
100000951	100000100	100015291
100000951	100000100	100015296
100000951	100000100	100015297
100000951	100000100	100015301
100000951	100000100	100015302
100000951	100000100	100015303
100000951	100000100	100015318
100000951	100000100	100015319
100000951	100000100	100015322
100000951	100000100	100015323
100000951	100000100	100015324
100000951	100000100	100015325
100000951	100000100	100015326
100000951	100000100	100015327
100000951	100000100	100015328
100000951	100000100	100015330
100000951	100000100	100015331
100000951	100000100	100015333
100000951	100000100	100015334
100000951	100000100	100015335
100000951	100000100	100015339
100000951	100000100	100015340
100000951	100000100	100015341
100000951	100000100	100015344
100000951	100000100	100015347
100000951	100000100	100015348
100000951	100000100	100015352
100000951	100000100	100015357
100000951	100000100	100015358
100000951	100000100	100015359
100000951	100000100	100015378
100000951	100000100	100015379
100000951	100000100	100015381
100000951	100000100	100015382
100000951	100000100	100015394
100000951	100000100	100015395
100000951	100000100	100015396
100000951	100000100	100015397
100000951	100000100	100015400
100000951	100000100	100015401
100000951	100000100	100015402
100000951	100000100	100015403
100000951	100000100	100015404
100000951	100000100	100015405
100000951	100000100	100015406
100000951	100000100	100015407
100000951	100000100	100015408
100000951	100000100	100015410
100000951	100000100	100015411
100000951	100000100	100015412
100000951	100000100	100015417
100000951	100000100	100015418
100000951	100000100	100015419
100000951	100000100	100015420
100000951	100000100	100015421
100000951	100000100	100015425
100000951	100000100	100015426
100000951	100000100	100015430
100000951	100000100	100015431
100000951	100000100	100015432
100000951	100000100	100015433
100000951	100000100	100015443
100000951	100000100	100015444
100000951	100000100	100015446
100000951	100000100	100015447
100000951	100000100	100015448
100000951	100000100	100015449
100000951	100000100	100015450
100000951	100000100	100015460
100000951	100000100	100015461
100000951	100000100	100015462
100000951	100000100	100015463
100000951	100000100	100015464
100000951	100000100	100015465
100000951	100000100	100015472
100000951	100000100	100015473
100000951	100000100	100015484
100000951	100000100	100015490
100000951	100000100	100015491
100000951	100000100	100015492
100000951	100000100	100015495
100000951	100000100	100015496
100000951	100000100	100015497
100000951	100000100	100015498
100000951	100000100	100015499
100000951	100000100	100015500
100000951	100000100	100015501
100000951	100000100	100015502
100000951	100000100	100015503
100000951	100000100	100015504
100000951	100000100	100015505
100000951	100000100	100015506
100000951	100000100	100015507
100000951	100000100	100015508
100000951	100000100	100015509
100000951	100000100	100015510
100000951	100000100	100015512
100000951	100000100	100015513
100000951	100000100	100015516
100000951	100000100	100015517
100000951	100000100	100015522
100000951	100000100	100015523
100000951	100000100	100015528
100000951	100000100	100015529
100000951	100000100	100015530
100000951	100000100	100015531
100000951	100000100	100015532
100000951	100000100	100015533
100000951	100000100	100015534
100000951	100000100	100015538
100000951	100000100	100015539
100000951	100000100	100015541
100000951	100000100	100015553
100000951	100000100	100015584
100000951	100000100	100015585
100000951	100000100	100015586
100000951	100000100	100015587
100000951	100000100	100015588
100000951	100000100	100015589
100000951	100000100	100015590
100000951	100000100	100015591
100000951	100000100	100015592
100000951	100000100	100015593
100000951	100000100	100015594
100000951	100000100	100015595
100000951	100000100	100015596
100000951	100000100	100015597
100000951	100000100	100015598
100000951	100000100	100015599
100000951	100000100	100015600
100000951	100000100	100015601
100000951	100000100	100015602
100000951	100000100	100015603
100000951	100000100	100015604
100000951	100000100	100015605
100000951	100000100	100015606
100000951	100000100	100015607
100000951	100000100	100015608
100000951	100000100	100015609
100000951	100000100	100015610
100000951	100000100	100015611
100000951	100000100	100015612
100000951	100000100	100015613
100000951	100000100	100015621
100000951	100000100	100015622
100000951	100000100	100015623
100000951	100000100	100015624
100000951	100000100	100015625
100000951	100000100	100015626
100000951	100000100	100015632
100000951	100000100	100015633
100000951	100000100	100015635
100000951	100000100	100015636
100000951	100000100	100015637
100000951	100000100	100015638
100000951	100000100	100015639
100000951	100000100	100015640
100000951	100000100	100015641
100000951	100000100	100015642
100000951	100000100	100015643
100000951	100000100	100015644
100000951	100000100	100015645
100000951	100000100	100015646
100000951	100000100	100015647
100000951	100000100	100015648
100000951	100000100	100015649
100000951	100000100	100015655
100000951	100000100	100015657
100000951	100000100	100015658
100000951	100000100	100015659
100000951	100000100	100015660
100000951	100000100	100015661
100000951	100000100	100015662
100000951	100000100	100015663
100000951	100000100	100015664
100000951	100000100	100015665
100000951	100000100	100015666
100000951	100000100	100015667
100000951	100000100	100015668
100000951	100000100	100015669
100000951	100000100	100015670
100000951	100000100	100015671
100000951	100000100	100015672
100000951	100000100	100015673
100000951	100000100	100015674
100000951	100000100	100015675
100000951	100000100	100015676
100000951	100000100	100015677
100000951	100000100	100015678
100000951	100000100	100015679
100000951	100000100	100015680
100000951	100000100	100015682
100000951	100000100	100015683
100000951	100000100	100015684
100000951	100000100	100015685
100000951	100000100	100015691
100000951	100000100	100015695
100000951	100000100	100015696
100000951	100000100	100015697
100000951	100000100	100015698
100000951	100000100	100015699
100000951	100000100	100015700
100000951	100000100	100015701
100000951	100000100	100015702
100000951	100000100	100015703
100000951	100000100	100015705
100000951	100000100	100015706
100000951	100000100	100015707
100000951	100000100	100015708
100000951	100000100	100015710
100000951	100000100	100015711
100000951	100000100	100015713
100000951	100000100	100015714
100000951	100000100	100015715
100000951	100000100	100015716
100000951	100000100	100015717
100000951	100000100	100015718
100000951	100000100	100015719
100000951	100000100	100015720
100000951	100000100	100015721
100000951	100000100	100015722
100000951	100000100	100015723
100000951	100000100	100015724
100000951	100000100	100015725
100000951	100000100	100015726
100000951	100000100	100015727
100000951	100000100	100015728
100000951	100000100	100015729
100000951	100000100	100015730
100000951	100000100	100015731
100000951	100000100	100015732
100000951	100000100	100015733
100000951	100000100	100015734
100000951	100000100	100015735
100000951	100000100	100015736
100000951	100000100	100015743
100000951	100000100	100015744
100000951	100000100	100015745
100000951	100000100	100015746
100000951	100000100	100015747
100000951	100000100	100015748
100000951	100000100	100015749
100000951	100000100	100015750
100000951	100000100	100015751
100000951	100000100	100015752
100000951	100000100	100015753
100000951	100000100	100015755
100000951	100000100	100015756
100000951	100000100	100015757
100000951	100000100	100015758
100000951	100000100	100015759
100000951	100000100	100015760
100000951	100000100	100015761
100000951	100000100	100015764
100000951	100000100	100015766
100000951	100000100	100015769
100000951	100000100	100015770
100000951	100000100	100015771
100000951	100000100	100015772
100000951	100000100	100015773
100000951	100000100	100015774
100000951	100000100	100015775
100000951	100000100	100015776
100000951	100000100	100015777
100000951	100000100	100015778
100000951	100000100	100015779
100000951	100000100	100015780
100000951	100000100	100015781
100000951	100000100	100015782
100000951	100000100	100015783
100000951	100000100	100015784
100000951	100000100	100015785
100000951	100000100	100015786
100000951	100000100	100015787
100000951	100000100	100015788
100000951	100000100	100015789
100000951	100000100	100015790
100000951	100000100	100015791
100000951	100000100	100015792
100000951	100000100	100015794
100000951	100000100	100015795
100000951	100000100	100015796
100000951	100000100	100015797
100000951	100000100	100015798
100000951	100000100	100015799
100000951	100000100	100015800
100000951	100000100	100015801
100000951	100000100	100015802
100000951	100000100	100015803
100000951	100000100	100015804
100000951	100000100	100015805
100000951	100000100	100015806
100000951	100000100	100015825
100000951	100000100	100015826
100000951	100000100	100015827
100000951	100000100	100015832
100000951	100000100	100015835
100000951	100000100	100015838
100000951	100000100	100015839
100000951	100000100	100015843
100000951	100000100	100015845
100000951	100000100	100015846
100000951	100000100	100015850
100000951	100000100	100015853
100000951	100000100	100015854
100000951	100000100	100015855
100000951	100000100	100015858
100000951	100000100	100015860
100000951	100000100	100015861
100000951	100000100	100015866
100000951	100000100	100015868
100000951	100000100	100015869
100000951	100000100	100015873
100000951	100000100	100015875
100000951	100000100	100015877
100000951	100000100	100015879
100000951	100000100	100015880
100000951	100000100	100015881
100000951	100000100	100015883
100000951	100000100	100015884
100000951	100000100	100015890
100000951	100000100	100015891
100000951	100000100	100015892
100000951	100000100	100015893
100000951	100000100	100015894
100000951	100000100	100015895
100000951	100000100	100015896
100000951	100000100	100015897
100000951	100000100	100015900
100000951	100000100	100015901
100000951	100000100	100015902
100000951	100000100	100015903
100000951	100000100	100015904
100000951	100000100	100015905
100000951	100000100	100015906
100000951	100000100	100015926
100000951	100000100	100015933
100000951	100000100	100015934
100000951	100000100	100015940
100000951	100000100	100015943
100000951	100000100	100015949
100000951	100000100	100015954
100000951	100000100	100015956
100000951	100000100	100015959
100000951	100000100	100015961
100000951	100000100	100015964
100000951	100000100	100015965
100000951	100000100	100015970
100000951	100000100	100015971
100000951	100000100	100015972
100000951	100000100	100015973
100000951	100000100	100015974
100000951	100000100	100015975
100000951	100000100	100015976
100000951	100000100	100015982
100000951	100000100	100015983
100000951	100000100	100015984
100000951	100000100	100015985
100000951	100000100	100015986
100000951	100000100	100015467
100000951	100000100	100015466
100000951	100000100	100015230
100000951	100000100	100015231
100000951	100000100	100015233
100000951	100000100	100015232
100000951	100000100	100015149
100000951	100000100	100015150
100000951	100000100	100015151
100000951	100000100	100015152
100000951	100000100	100015153
100000951	100000100	100014995
100000951	100000100	100014994
100000951	100000100	100014997
100000951	100000100	100014996
100000951	100000100	100014732
100000951	100000100	100014551
100000951	100000100	100015012
100000951	100000100	100014552
100000951	100000100	100014555
100000951	100000100	100015738
100000951	100000100	100015737
100000951	100000100	100015740
100000951	100000100	100015739
100000951	100000100	100015741
100000951	100000100	100015742
100000951	100000100	100014550
100000951	100000100	100014553
100000951	100000100	100015154
100000951	100000100	100015155
100000951	100000100	100015156
100000951	100000100	100015157
100000951	100000100	100015656
100000951	100000100	100015159
100000951	100000100	100014783
100000951	100000100	100014786
100000951	100000100	100014554
100000951	100000100	100015332
100000951	100000100	100015468
100000951	100000100	100015469
100000951	100000100	100015471
100000951	100000100	100015470
100000951	100000100	100014840
100000951	100000100	100014781
100000951	100000100	100014803
100000951	100000100	100014805
100000951	100000100	100014804
100000951	100000100	100014738
100000951	100000100	100014572
100000951	100000100	100014573
100000951	100000100	100014575
100000951	100000100	100014574
100000951	100000100	100015481
100000951	100000100	100014886
100000951	100000100	100014888
100000951	100000100	100014887
100000951	100000100	100014618
100000951	100000100	100014619
100000951	100000100	100014622
100000951	100000100	100014620
100000951	100000100	100014621
100000951	100000100	100015321
100000951	100000100	100014681
100000951	100000100	100014682
100000951	100000100	100014684
100000951	100000100	100014683
100000951	100000100	100014699
100000951	100000100	100014701
100000951	100000100	100014700
100000951	100000100	100014788
100000951	100000100	100014787
100000951	100000100	100014789
100000951	100000100	100015377
100000951	100000100	100014790
100000951	100000100	100014837
100000951	100000100	100014811
100000951	100000100	100014812
100000951	100000100	100014813
100000951	100000100	100015015
100000951	100000100	100015014
100000951	100000100	100015016
100000951	100000100	100015084
100000951	100000100	100015087
100000951	100000100	100015336
100000951	100000100	100014877
100000951	100000100	100014876
100000951	100000100	100014878
100000951	100000100	100014911
100000951	100000100	100014880
100000951	100000100	100014912
100000951	100000100	100014879
100000951	100000100	100014930
100000951	100000100	100014913
100000951	100000100	100014914
100000951	100000100	100014881
100000951	100000100	100014915
100000951	100000100	100014916
100000951	100000100	100014917
100000951	100000100	100014918
100000951	100000100	100014999
100000951	100000100	100014998
100000951	100000100	100015001
100000951	100000100	100015000
100000951	100000100	100014782
100000951	100000100	100014670
100000951	100000100	100014703
100000951	100000100	100015011
100000951	100000100	100015754
100000951	100000100	100014671
100000951	100000100	100014704
100000951	100000100	100014675
100000951	100000100	100015483
100000951	100000100	100014696
100000951	100000100	100014773
100000951	100000100	100015908
100000951	100000100	100015907
100000951	100000100	100015910
100000951	100000100	100015909
100000951	100000100	100015911
100000951	100000100	100014741
100000951	100000100	100014669
100000951	100000100	100015482
100000951	100000100	100015422
100000951	100000100	100014892
100000951	100000100	100014828
100000951	100000100	100014672
100000951	100000100	100015158
100000951	100000100	100015320
100000951	100000100	100014810
100000951	100000100	100014702
100000951	100000100	100014742
100000951	100000100	100014677
100000951	100000100	100014673
100000951	100000100	100014676
100000951	100000100	100015545
100000951	100000100	100015147
100000951	100000100	100015148
100000951	100000100	100014802
100000951	100000100	100015882
100000951	100000100	100015885
100000951	100000100	100015886
100000951	100000100	100015887
100000951	100000100	100015888
100000951	100000100	100015889
100000951	100000100	100015546
100000951	100000100	100015390
100000951	100000100	100015391
100000951	100000100	100015066
100000951	100000100	100015068
100000951	100000100	100015067
100000951	100000100	100015071
100000951	100000100	100015070
100000951	100000100	100015072
100000951	100000100	100015073
100000951	100000100	100015307
100000951	100000100	100015308
100000951	100000100	100015309
100000951	100000100	100015060
100000951	100000100	100015062
100000951	100000100	100015061
100000951	100000100	100015076
100000951	100000100	100015075
100000951	100000100	100015077
100000951	100000100	100015078
100000939	100000100	100014465
100000939	100000100	100014464
100000939	100000100	100014466
100000939	100000100	100014470
100000939	100000100	100014469
100000939	100000100	100014467
100000939	100000100	100014471
100000939	100000100	100014468
100000937	100000099	100015822
100000933	100000099	100015987
100000932	100000099	100015988
100000932	100000099	100015989
100000932	100000099	100015990
100000931	100000099	100015990
100000931	100000099	100015991
100000932	100000099	100015992
100000932	100000099	100015993
100000931	100000099	100015993
100000931	100000099	100015994
100000931	100000099	100015995
100000931	100000099	100015996
100000932	100000099	100015997
100000931	100000099	100015998
100000931	100000099	100015999
100000933	100000099	100016000
100000931	100000099	100016000
100000932	100000099	100016001
100000932	100000099	100016002
100000933	100000099	100016003
100000931	100000099	100016003
100000933	100000099	100016004
100000931	100000099	100016004
100000932	100000099	100016005
100000931	100000099	100016006
100000931	100000099	100016007
100000932	100000099	100016008
100000931	100000099	100016009
100000932	100000099	100016010
100000932	100000099	100016011
100000932	100000099	100016012
100000938	100000100	100014489
100000938	100000100	100014495
100000938	100000100	100016013
100000938	100000100	100016014
100000938	100000100	100016015
100000938	100000100	100016016
100000938	100000100	100016017
100000938	100000100	100016018
100000938	100000100	100016019
100000938	100000100	100016020
100000940	100000100	100016021
100000940	100000100	100016022
100000938	100000100	100016023
100000938	100000100	100016024
100000938	100000100	100016025
100000938	100000100	100016026
100000938	100000100	100016027
100000938	100000100	100016028
100000938	100000100	100016029
100000944	100000100	100016030
100000944	100000100	100016031
100000944	100000100	100016032
100000938	100000100	100016033
100000938	100000100	100016034
100000938	100000100	100016035
100000944	100000100	100016036
100000944	100000100	100016037
100000938	100000100	100016038
100000938	100000100	100016042
100000938	100000100	100016043
100000939	100000100	100016043
100000939	100000100	100016044
100000939	100000100	100016045
100000939	100000100	100016046
100000939	100000100	100016047
100000939	100000100	100016048
100000939	100000100	100016049
100000940	100000100	100016043
100000950	100000100	100015936
100000950	100000100	100015938
100000950	100000100	100015939
100000950	100000100	100015935
100000938	100000100	100015957
100000938	100000100	100016051
\.


--
-- Data for Name: rel_regra_auditoria_recurso; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.rel_regra_auditoria_recurso (id_recurso, id_sistema, id_regra_auditoria) FROM stdin;
100014301	100000099	1
100014304	100000099	1
100014305	100000099	1
100014306	100000099	1
100014307	100000099	1
100014310	100000099	1
100014311	100000099	1
100014312	100000099	1
100014315	100000099	1
100014316	100000099	1
100014317	100000099	1
100014324	100000099	1
100014326	100000099	1
100014327	100000099	1
100014330	100000099	1
100014331	100000099	1
100014332	100000099	1
100014333	100000099	1
100014336	100000099	1
100014337	100000099	1
100014338	100000099	1
100014339	100000099	1
100014341	100000099	1
100014342	100000099	1
100014343	100000099	1
100014344	100000099	1
100014347	100000099	1
100014348	100000099	1
100014349	100000099	1
100014350	100000099	1
100014352	100000099	1
100014353	100000099	1
100014356	100000099	1
100014357	100000099	1
100014358	100000099	1
100014359	100000099	1
100014362	100000099	1
100014363	100000099	1
100014364	100000099	1
100014365	100000099	1
100014366	100000099	1
100014368	100000099	1
100014369	100000099	1
100014371	100000099	1
100014372	100000099	1
100014373	100000099	1
100014374	100000099	1
100014376	100000099	1
100014377	100000099	1
100014378	100000099	1
100014379	100000099	1
100014383	100000099	1
100014384	100000099	1
100014385	100000099	1
100014386	100000099	1
100014393	100000099	1
100014394	100000099	1
100014395	100000099	1
100014396	100000099	1
100014407	100000099	1
100014408	100000099	1
100014409	100000099	1
100014410	100000099	1
100014412	100000099	1
100014414	100000099	1
100015173	100000099	1
100015174	100000099	1
100015175	100000099	1
100015187	100000099	1
100015200	100000099	1
100015201	100000099	1
100015204	100000099	1
100015205	100000099	1
100015206	100000099	1
100015363	100000099	1
100015364	100000099	1
100015365	100000099	1
100015570	100000099	1
100015571	100000099	1
100015572	100000099	1
100015582	100000099	1
100014435	100000100	2
100014436	100000100	2
100014440	100000100	2
100014441	100000100	2
100014442	100000100	2
100014446	100000100	2
100014447	100000100	2
100014448	100000100	2
100014449	100000100	2
100014453	100000100	2
100014454	100000100	2
100014455	100000100	2
100014464	100000100	2
100014465	100000100	2
100014469	100000100	2
100014470	100000100	2
100014471	100000100	2
100014472	100000100	2
100014473	100000100	2
100014477	100000100	2
100014478	100000100	2
100014479	100000100	2
100014480	100000100	2
100014481	100000100	2
100014482	100000100	2
100014486	100000100	2
100014487	100000100	2
100014488	100000100	2
100014489	100000100	2
100014490	100000100	2
100014494	100000100	2
100014495	100000100	2
100014496	100000100	2
100014500	100000100	2
100014508	100000100	2
100014509	100000100	2
100014513	100000100	2
100014514	100000100	2
100014515	100000100	2
100014516	100000100	2
100014517	100000100	2
100014521	100000100	2
100014522	100000100	2
100014523	100000100	2
100014527	100000100	2
100014528	100000100	2
100014529	100000100	2
100014536	100000100	2
100014537	100000100	2
100014541	100000100	2
100014542	100000100	2
100014543	100000100	2
100014547	100000100	2
100014548	100000100	2
100014549	100000100	2
100014565	100000100	2
100014576	100000100	2
100014577	100000100	2
100014578	100000100	2
100014579	100000100	2
100014583	100000100	2
100014584	100000100	2
100014585	100000100	2
100014586	100000100	2
100014587	100000100	2
100014591	100000100	2
100014592	100000100	2
100014593	100000100	2
100014594	100000100	2
100014595	100000100	2
100014599	100000100	2
100014600	100000100	2
100014601	100000100	2
100014602	100000100	2
100014603	100000100	2
100014607	100000100	2
100014608	100000100	2
100014609	100000100	2
100014610	100000100	2
100014611	100000100	2
100014615	100000100	2
100014616	100000100	2
100014617	100000100	2
100014623	100000100	2
100014624	100000100	2
100014628	100000100	2
100014646	100000100	2
100014647	100000100	2
100014651	100000100	2
100014652	100000100	2
100014653	100000100	2
100014658	100000100	2
100014669	100000100	2
100014670	100000100	2
100014674	100000100	2
100014675	100000100	5
100014702	100000100	2
100014703	100000100	2
100014709	100000100	2
100014710	100000100	2
100014711	100000100	2
100014712	100000100	2
100014719	100000100	2
100014736	100000100	2
100014743	100000100	2
100014744	100000100	2
100014748	100000100	2
100014752	100000100	2
100014753	100000100	2
100014756	100000100	2
100014760	100000100	2
100014761	100000100	2
100014763	100000100	2
100014764	100000100	2
100014765	100000100	2
100014766	100000100	2
100014770	100000100	2
100014771	100000100	2
100014772	100000100	2
100014774	100000100	2
100014775	100000100	2
100014778	100000100	2
100014779	100000100	2
100014780	100000100	2
100014792	100000100	2
100014793	100000100	2
100014797	100000100	2
100014802	100000100	5
100014828	100000100	2
100014843	100000100	2
100014850	100000100	2
100014851	100000100	2
100014854	100000100	2
100014855	100000100	2
100014858	100000100	2
100014859	100000100	2
100014860	100000100	2
100014863	100000100	2
100014864	100000100	2
100014865	100000100	2
100014868	100000100	2
100014869	100000100	2
100014872	100000100	2
100014876	100000100	2
100014877	100000100	2
100014880	100000100	2
100014892	100000100	2
100014895	100000100	2
100014896	100000100	2
100014899	100000100	2
100014907	100000100	2
100014908	100000100	2
100014910	100000100	2
100014912	100000100	2
100014913	100000100	2
100014931	100000100	2
100014932	100000100	2
100014935	100000100	2
100014936	100000100	2
100014937	100000100	2
100014940	100000100	2
100014947	100000100	2
100014951	100000100	2
100014952	100000100	2
100014953	100000100	2
100014957	100000100	2
100014964	100000100	2
100014965	100000100	2
100014968	100000100	2
100014984	100000100	2
100014986	100000100	2
100015024	100000100	2
100015025	100000100	2
100015027	100000100	2
100015029	100000100	2
100015030	100000100	2
100015031	100000100	2
100015032	100000100	2
100015035	100000100	2
100015043	100000100	2
100015044	100000100	2
100015048	100000100	2
100015049	100000100	2
100015050	100000100	2
100015051	100000100	2
100015052	100000100	2
100015053	100000100	2
100015057	100000100	2
100015058	100000100	2
100015059	100000100	2
100015063	100000100	2
100015083	100000100	2
100015085	100000100	2
100015089	100000100	2
100015090	100000100	2
100015093	100000100	2
100015094	100000100	2
100015095	100000100	2
100015096	100000100	2
100015097	100000100	2
100015101	100000100	2
100015110	100000100	2
100015111	100000100	2
100015114	100000100	2
100015115	100000100	2
100015120	100000100	2
100015123	100000100	2
100015137	100000100	2
100015145	100000100	2
100015149	100000100	2
100015150	100000100	2
100015152	100000100	2
100015154	100000100	2
100015155	100000100	2
100015157	100000100	2
100015161	100000100	2
100015162	100000100	2
100015164	100000100	2
100015171	100000100	2
100015211	100000100	3
100015212	100000100	3
100015213	100000100	3
100015214	100000100	3
100015215	100000100	3
100015216	100000100	3
100015217	100000100	3
100015218	100000100	2
100015219	100000100	4
100015235	100000100	2
100015271	100000100	2
100015272	100000100	2
100015273	100000100	2
100015274	100000100	2
100015275	100000100	2
100015285	100000100	2
100015286	100000100	2
100015287	100000100	2
100015290	100000100	2
100015292	100000100	2
100015293	100000100	2
100015294	100000100	2
100015295	100000100	2
100015298	100000100	2
100015299	100000100	2
100015300	100000100	2
100015304	100000100	2
100015305	100000100	2
100015306	100000100	2
100015337	100000100	2
100015338	100000100	2
100015345	100000100	2
100015346	100000100	2
100015349	100000100	2
100015350	100000100	2
100015351	100000100	2
100015352	100000100	2
100015353	100000100	2
100015354	100000100	2
100015355	100000100	2
100015356	100000100	2
100015360	100000100	2
100015361	100000100	2
100015362	100000100	2
100015380	100000100	2
100015383	100000100	2
100015384	100000100	2
100015385	100000100	2
100015386	100000100	2
100015392	100000100	2
100015393	100000100	2
100015394	100000100	2
100015396	100000100	2
100015397	100000100	2
100015400	100000100	2
100015401	100000100	2
100015404	100000100	2
100015409	100000100	2
100015413	100000100	2
100015414	100000100	2
100015415	100000100	2
100015416	100000100	2
100015423	100000100	2
100015424	100000100	2
100015427	100000100	2
100015428	100000100	2
100015429	100000100	2
100015453	100000100	2
100015454	100000100	2
100015455	100000100	2
100015474	100000100	2
100015475	100000100	2
100015476	100000100	2
100015477	100000100	2
100015478	100000100	2
100015480	100000100	2
100015482	100000100	2
100015485	100000100	2
100015486	100000100	2
100015487	100000100	2
100015488	100000100	2
100015489	100000100	2
100015494	100000100	2
100015496	100000100	2
100015497	100000100	2
100015499	100000100	2
100015500	100000100	2
100015503	100000100	2
100015504	100000100	2
100015505	100000100	2
100015510	100000100	2
100015524	100000100	2
100015525	100000100	2
100015526	100000100	2
100015527	100000100	2
100015530	100000100	2
100015531	100000100	2
100015535	100000100	2
100015536	100000100	2
100015537	100000100	2
100015544	100000100	2
100015549	100000100	2
100015614	100000100	2
100015615	100000100	2
100015616	100000100	2
100015617	100000100	2
100015618	100000100	2
100015619	100000100	2
100015620	100000100	2
100015637	100000100	2
100015638	100000100	2
100015639	100000100	2
100015642	100000100	2
100015643	100000100	2
100015646	100000100	2
100015684	100000100	2
100015685	100000100	2
100015686	100000100	2
100015687	100000100	2
100015688	100000100	2
100015689	100000100	2
100015690	100000100	2
100015703	100000100	2
100015704	100000100	2
100015753	100000100	2
100015754	100000100	2
100015756	100000100	2
100015757	100000100	2
100015759	100000100	2
100015762	100000100	2
100015763	100000100	2
100015765	100000100	2
100015767	100000100	2
100015768	100000100	2
100015793	100000100	2
100015807	100000099	1
100015808	100000099	1
100015809	100000099	1
100015810	100000099	1
100015811	100000099	1
100015821	100000099	1
100015667	100000100	2
100015668	100000100	2
100015670	100000100	2
100015672	100000100	2
100015673	100000100	2
100015829	100000100	2
100015830	100000100	2
100015831	100000100	2
100015834	100000100	2
100015840	100000100	2
100015841	100000100	2
100015842	100000100	2
100015844	100000100	2
100015847	100000100	2
100015848	100000100	2
100015849	100000100	2
100015856	100000100	2
100015857	100000100	2
100015859	100000100	2
100015862	100000100	2
100015863	100000100	2
100015864	100000100	2
100015865	100000100	2
100015867	100000100	2
100015870	100000100	2
100015871	100000100	2
100015880	100000100	2
100015901	100000100	2
100015905	100000100	2
100015977	100000100	2
100015978	100000100	2
100015979	100000100	2
100015980	100000100	2
100015981	100000100	2
100015928	100000100	6
100015929	100000100	6
100015941	100000100	6
100015942	100000100	6
100015944	100000100	6
100015946	100000100	6
100015947	100000100	6
100015948	100000100	6
100015950	100000100	6
100015951	100000100	6
100015952	100000100	6
100015953	100000100	6
100015955	100000100	6
100015958	100000100	6
100015987	100000099	1
100015988	100000099	1
100015991	100000099	1
100015994	100000099	1
100015995	100000099	1
100015996	100000099	1
100015998	100000099	1
100016009	100000099	1
100016010	100000099	1
100016023	100000100	2
100016027	100000100	2
100016028	100000100	2
100016030	100000100	2
100016031	100000100	2
100016032	100000100	2
100016036	100000100	2
100016037	100000100	2
100016038	100000100	2
100016044	100000100	2
100016045	100000100	2
100016046	100000100	2
100016047	100000100	2
100016048	100000100	2
100016049	100000100	2
100016039	100000100	3
100016040	100000100	3
100016041	100000100	3
100016050	100000100	3
\.


--
-- Data for Name: rel_sistema_servico_sso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_sistema_servico_sso (id_sistema, id_servico_sso, sta_tipo_acesso, ordem) FROM stdin;
\.


--
-- Data for Name: servico_sso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servico_sso (id_servico_sso, identificacao, titulo, sta_servico_sso, client_id, client_secret, scope, url_base, url_api_conta, url_issuer, url_token, url_logout, url_authorize, campo_sso, campo_usuario, logo, client_id_assinatura, client_secret_assinatura, url_base_assinatura, url_api_assinatura, sin_ativo) FROM stdin;
101	gov.br	Entrar com gov.br	G	[endereco_sip_teste]	xxxxxxxxxxxxxxxxxxxx	openid+email+phone+profile+govbr_confiabilidades	https://sso.staging.acesso.gov.br	https://api.staging.acesso.gov.br/confiabilidades/v3/contas	\N	\N	https://sso.staging.acesso.gov.br/logout?post_logout_redirect_uri=@post_logout_redirect_uri@	\N	sub	Cpf	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	\N	\N	https://cas.staging.iti.br/oauth2.0	https://assinatura-api.staging.iti.br/externo/v2	S
102	Microsoft	Entrar com Microsoft	O	aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa	...............	openid+email+profile	https://login.microsoftonline.com/bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb	\N	https://login.microsoftonline.com/bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb/v2.0	https://login.microsoftonline.com/bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb/oauth2/v2.0/token	https://login.microsoftonline.com/bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb/oauth2/logout?post_logout_redirect_uri=@post_logout_redirect_uri@	https://login.microsoftonline.com/bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb/oauth2/v2.0/authorize	email	Email	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	\N	\N	\N	\N	S
103	Google	Entrar com Google	O	xxxxxxxxxxxxxxxxxxxx	xxxxxxxxxxxxxxxxxxxx	email	https://accounts.google.com	\N	\N	https://oauth2.googleapis.com/token	https://www.google.com/accounts/logout?continue=https://appengine.google.com/_ah/logout?continue=@post_logout_redirect_uri@	https://accounts.google.com/o/oauth2/auth	email	Email	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	\N	\N	\N	\N	S
\.


--
-- Data for Name: servidor_autenticacao; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.servidor_autenticacao (id_servidor_autenticacao, nome, sta_tipo, endereco, porta, sufixo, usuario_pesquisa, senha_pesquisa, contexto_pesquisa, atributo_filtro_pesquisa, atributo_retorno_pesquisa, versao) FROM stdin;
1	Exemplo_Conexao_AD_1	AD	hostnamedoservidor.dominio.gov.br	389	@dominio.gov.br	sei_sip_ldap_ad@dominio.gov.br	\N	DC=xxx,DC=yyy,DC=zzz	userPrincipalName	distinguishedName	3
2	Exemplo_Conexao_AD_2	AD	hostnamedoservidor.dominio.gov.br	389	@dominio.gov.br	sei_sip_ldap_ad@dominio.gov.br	\N	DC=xxx,DC=yyy,DC=zzz	userPrincipalName	distinguishedName	3
\.


--
-- Data for Name: sistema; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.sistema (id_sistema, id_orgao, id_hierarquia, sigla, descricao, pagina_inicial, sin_ativo, web_service, logo, sta_2_fatores, esquema_login, servicos_liberados, chave_acesso, crc, alias, sin_autenticacao_padrao, sin_permissao, sta_confiabilidade_interno) FROM stdin;
100000099	0	100000018	SIP	Sistema de Permissões	https://localhost/sip	S	\N	iVBORw0KGgoAAAANSUhEUgAAAJYAAADICAYAAAAKhRhlAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2MkNDRTkzMEY0RjJFMjExOEZDREM0OEY5REVERTIyMiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozOTM0MUE4N0YzMTExMUUyODIyNUE2M0UxNkU5MEY4MCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozOTM0MUE4NkYzMTExMUUyODIyNUE2M0UxNkU5MEY4MCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjJGM0EzNkE5RkNGMkUyMTE5MzEwQzJEQTM3N0RGMkFCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjYyQ0NFOTMwRjRGMkUyMTE4RkNEQzQ4RjlERURFMjIyIi8+IDwvcmRmOkRlc2NyaXB0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	P	dsgov	\N	$2a$12$VGlzUNkiuuSRRarooGKzzOOvZnMKz/bNIz.721dwe/dq75CGyfj6S	d27791b8	\N	S	S	\N
100000100	0	100000018	SEI	Sistema Eletrônico de Informações	https://localhost/sei/inicializar.php	S	https://localhost/sei/controlador_ws.php?servico=sip	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	P	dsgov	1,2,3,4,5,6	$2a$12$U1UYoWD3Yer2fedJEGOti.YN.cCBByAqI21tsrQ5Qi9.VcTfn4thS	7babf862	\N	S	S	\N
\.


--
-- Data for Name: tipo_permissao; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.tipo_permissao (id_tipo_permissao, descricao) FROM stdin;
1	Não Delegável
2	Delegável
3	Delegável uma vez
\.


--
-- Data for Name: unidade; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.unidade (id_unidade, id_orgao, id_origem, sigla, descricao, sin_ativo, sin_global) FROM stdin;
110000000	0	\N	*	Unidade Global	S	S
110000001	0	\N	TESTE	Unidade de Teste 1	S	N
110000002	0	\N	TESTE_1_1	Unidade de Testes 1.1	S	N
110000003	0	\N	TESTE_1_2	Unidade de Testes 1.2	S	N
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.usuario (id_usuario, id_orgao, id_origem, sigla, nome, sin_ativo, cpf, nome_registro_civil, nome_social, email, sin_bloqueado, dth_pausa_2fa) FROM stdin;
1	0	\N	SIP	Sistema de Permissões	S	\N	Sistema de Permissões	\N	\N	N	\N
100000001	0	\N	teste	Usuário de Testes	S	\N	Usuário de Testes	\N	\N	N	\N
\.


--
-- Data for Name: usuario_historico; Type: TABLE DATA; Schema: public; Owner: sip_user
--

COPY public.usuario_historico (id_usuario_historico, id_codigo_acesso, id_usuario, id_usuario_operacao, dth_operacao, sta_operacao, motivo, dth_pausa_2fa) FROM stdin;
\.


--
-- Data for Name: usuario_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_login (id_usuario, tentativas, dth_tentativa, http_client_ip, http_x_forwarded_for, remote_addr, user_agent) FROM stdin;
100000001	0	2025-01-23 17:44:39	\N	172.27.0.1	172.27.0.6	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0
\.


--
-- Name: seq_infra_auditoria; Type: SEQUENCE SET; Schema: public; Owner: sip_user
--

SELECT pg_catalog.setval('public.seq_infra_auditoria', 1, true);


--
-- Name: seq_infra_log; Type: SEQUENCE SET; Schema: public; Owner: sip_user
--

SELECT pg_catalog.setval('public.seq_infra_log', 1, true);


--
-- Name: administrador_sistema pk_administrador_sistema; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.administrador_sistema
    ADD CONSTRAINT pk_administrador_sistema PRIMARY KEY (id_sistema, id_usuario);


--
-- Name: assinatura_sso pk_assinatura_sso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assinatura_sso
    ADD CONSTRAINT pk_assinatura_sso PRIMARY KEY (id_assinatura_sso);


--
-- Name: codigo_acesso pk_codigo_acesso; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_acesso
    ADD CONSTRAINT pk_codigo_acesso PRIMARY KEY (id_codigo_acesso);


--
-- Name: codigo_bloqueio pk_codigo_bloqueio; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_bloqueio
    ADD CONSTRAINT pk_codigo_bloqueio PRIMARY KEY (id_codigo_bloqueio);


--
-- Name: coordenador_perfil pk_coordenador_perfil; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_perfil
    ADD CONSTRAINT pk_coordenador_perfil PRIMARY KEY (id_perfil, id_sistema, id_usuario);


--
-- Name: coordenador_unidade pk_coordenador_unidade; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_unidade
    ADD CONSTRAINT pk_coordenador_unidade PRIMARY KEY (id_sistema, id_unidade, id_usuario);


--
-- Name: dispositivo_acesso pk_dispositivo_acesso; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.dispositivo_acesso
    ADD CONSTRAINT pk_dispositivo_acesso PRIMARY KEY (id_dispositivo_acesso);


--
-- Name: email_sistema pk_email_sistema; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.email_sistema
    ADD CONSTRAINT pk_email_sistema PRIMARY KEY (id_email_sistema);


--
-- Name: grupo_perfil pk_grupo_perfil; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.grupo_perfil
    ADD CONSTRAINT pk_grupo_perfil PRIMARY KEY (id_grupo_perfil, id_sistema);


--
-- Name: hierarquia pk_hierarquia; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.hierarquia
    ADD CONSTRAINT pk_hierarquia PRIMARY KEY (id_hierarquia);


--
-- Name: infra_agendamento_tarefa pk_infra_agendamento_tarefa; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_agendamento_tarefa
    ADD CONSTRAINT pk_infra_agendamento_tarefa PRIMARY KEY (id_infra_agendamento_tarefa);


--
-- Name: infra_auditoria pk_infra_auditoria; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_auditoria
    ADD CONSTRAINT pk_infra_auditoria PRIMARY KEY (id_infra_auditoria);


--
-- Name: infra_captcha pk_infra_captcha; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_captcha
    ADD CONSTRAINT pk_infra_captcha PRIMARY KEY (identificacao, dia, mes, ano);


--
-- Name: infra_erro_php pk_infra_erro_php; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_erro_php
    ADD CONSTRAINT pk_infra_erro_php PRIMARY KEY (id_infra_erro_php);


--
-- Name: infra_log pk_infra_log; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_log
    ADD CONSTRAINT pk_infra_log PRIMARY KEY (id_infra_log);


--
-- Name: infra_navegador_verificacao pk_infra_navegador_verificacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infra_navegador_verificacao
    ADD CONSTRAINT pk_infra_navegador_verificacao PRIMARY KEY (tipo_navegador);


--
-- Name: infra_parametro pk_infra_parametro; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_parametro
    ADD CONSTRAINT pk_infra_parametro PRIMARY KEY (nome);


--
-- Name: infra_regra_auditoria pk_infra_regra_auditoria; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_regra_auditoria
    ADD CONSTRAINT pk_infra_regra_auditoria PRIMARY KEY (id_infra_regra_auditoria);


--
-- Name: infra_regra_auditoria_recurso pk_infra_regra_auditoria_rec; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_regra_auditoria_recurso
    ADD CONSTRAINT pk_infra_regra_auditoria_rec PRIMARY KEY (id_infra_regra_auditoria, recurso);


--
-- Name: infra_sequencia pk_infra_sequencia; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_sequencia
    ADD CONSTRAINT pk_infra_sequencia PRIMARY KEY (nome_tabela);


--
-- Name: item_menu pk_item_menu; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.item_menu
    ADD CONSTRAINT pk_item_menu PRIMARY KEY (id_item_menu, id_menu);


--
-- Name: login pk_login; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT pk_login PRIMARY KEY (id_login, id_sistema, id_usuario);


--
-- Name: login_sso pk_login_sso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_sso
    ADD CONSTRAINT pk_login_sso PRIMARY KEY (id_login_sso);


--
-- Name: menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- Name: orgao pk_orgao; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.orgao
    ADD CONSTRAINT pk_orgao PRIMARY KEY (id_orgao);


--
-- Name: perfil pk_perfil; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT pk_perfil PRIMARY KEY (id_perfil, id_sistema);


--
-- Name: permissao pk_permissao; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT pk_permissao PRIMARY KEY (id_perfil, id_sistema, id_unidade, id_usuario);


--
-- Name: recurso pk_recurso; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (id_recurso, id_sistema);


--
-- Name: recurso_vinculado pk_recurso_vinculado; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.recurso_vinculado
    ADD CONSTRAINT pk_recurso_vinculado PRIMARY KEY (id_recurso, id_recurso_vinculado, id_sistema, id_sistema_vinculado);


--
-- Name: regra_auditoria pk_regra_auditoria; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.regra_auditoria
    ADD CONSTRAINT pk_regra_auditoria PRIMARY KEY (id_regra_auditoria);


--
-- Name: rel_grupo_perfil_perfil pk_rel_grupo_perfil_perfil; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_grupo_perfil_perfil
    ADD CONSTRAINT pk_rel_grupo_perfil_perfil PRIMARY KEY (id_grupo_perfil, id_sistema, id_perfil);


--
-- Name: rel_hierarquia_unidade pk_rel_hierarquia_unidade; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_hierarquia_unidade
    ADD CONSTRAINT pk_rel_hierarquia_unidade PRIMARY KEY (id_hierarquia, id_unidade);


--
-- Name: rel_orgao_autenticacao pk_rel_orgao_autenticacao; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_orgao_autenticacao
    ADD CONSTRAINT pk_rel_orgao_autenticacao PRIMARY KEY (id_orgao, id_servidor_autenticacao);


--
-- Name: rel_perfil_item_menu pk_rel_perfil_item_menu; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_item_menu
    ADD CONSTRAINT pk_rel_perfil_item_menu PRIMARY KEY (id_item_menu, id_menu, id_perfil, id_recurso, id_sistema);


--
-- Name: rel_perfil_recurso pk_rel_perfil_recurso; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_recurso
    ADD CONSTRAINT pk_rel_perfil_recurso PRIMARY KEY (id_perfil, id_recurso, id_sistema);


--
-- Name: rel_regra_auditoria_recurso pk_rel_regra_auditoria_recurso; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_regra_auditoria_recurso
    ADD CONSTRAINT pk_rel_regra_auditoria_recurso PRIMARY KEY (id_recurso, id_regra_auditoria, id_sistema);


--
-- Name: rel_sistema_servico_sso pk_rel_sistema_servico_sso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_sistema_servico_sso
    ADD CONSTRAINT pk_rel_sistema_servico_sso PRIMARY KEY (id_sistema, id_servico_sso, sta_tipo_acesso);


--
-- Name: servico_sso pk_servico_sso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico_sso
    ADD CONSTRAINT pk_servico_sso PRIMARY KEY (id_servico_sso);


--
-- Name: servidor_autenticacao pk_servidor_autenticacao; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.servidor_autenticacao
    ADD CONSTRAINT pk_servidor_autenticacao PRIMARY KEY (id_servidor_autenticacao);


--
-- Name: sistema pk_sistema; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT pk_sistema PRIMARY KEY (id_sistema);


--
-- Name: tipo_permissao pk_tipo_permissao; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.tipo_permissao
    ADD CONSTRAINT pk_tipo_permissao PRIMARY KEY (id_tipo_permissao);


--
-- Name: unidade pk_unidade; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT pk_unidade PRIMARY KEY (id_unidade);


--
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- Name: usuario_historico pk_usuario_historico; Type: CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario_historico
    ADD CONSTRAINT pk_usuario_historico PRIMARY KEY (id_usuario_historico);


--
-- Name: usuario_login pk_usuario_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_login
    ADD CONSTRAINT pk_usuario_login PRIMARY KEY (id_usuario);


--
-- Name: ak_orgao_sigla; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_orgao_sigla ON public.orgao USING btree (sigla);


--
-- Name: ak_perfil_nome; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_perfil_nome ON public.perfil USING btree (id_sistema, nome);


--
-- Name: ak_recurso_nome; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_recurso_nome ON public.recurso USING btree (id_sistema, nome);


--
-- Name: ak_sistema_sigla_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_sistema_sigla_orgao ON public.sistema USING btree (id_orgao, sigla);


--
-- Name: ak_unidade_sigla_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_unidade_sigla_orgao ON public.unidade USING btree (id_orgao, sigla, sin_ativo);


--
-- Name: ak_usuario_sigla_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX ak_usuario_sigla_orgao ON public.usuario USING btree (id_orgao, sigla, sin_ativo);


--
-- Name: fk_admin_sistema_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_admin_sistema_sistema ON public.administrador_sistema USING btree (id_sistema);


--
-- Name: fk_admin_sistema_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_admin_sistema_usuario ON public.administrador_sistema USING btree (id_usuario);


--
-- Name: fk_assinatura_sso_login_sso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_assinatura_sso_login_sso ON public.assinatura_sso USING btree (id_login_sso);


--
-- Name: fk_auditoria_recurso_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_auditoria_recurso_recurso ON public.rel_regra_auditoria_recurso USING btree (id_recurso, id_sistema);


--
-- Name: fk_auditoria_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_auditoria_sistema ON public.regra_auditoria USING btree (id_sistema);


--
-- Name: fk_cod_acesso_usu_desativacao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_cod_acesso_usu_desativacao ON public.codigo_acesso USING btree (id_usuario_desativacao);


--
-- Name: fk_cod_bloqueio_cod_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_cod_bloqueio_cod_acesso ON public.codigo_bloqueio USING btree (id_codigo_acesso);


--
-- Name: fk_codigo_acesso_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_codigo_acesso_sistema ON public.codigo_acesso USING btree (id_sistema);


--
-- Name: fk_codigo_acesso_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_codigo_acesso_usuario ON public.codigo_acesso USING btree (id_usuario);


--
-- Name: fk_coordenador_perfil_perfil; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_coordenador_perfil_perfil ON public.coordenador_perfil USING btree (id_perfil, id_sistema);


--
-- Name: fk_coordenador_perfil_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_coordenador_perfil_usuario ON public.coordenador_perfil USING btree (id_usuario);


--
-- Name: fk_coordenador_unidade_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_coordenador_unidade_sistema ON public.coordenador_unidade USING btree (id_sistema);


--
-- Name: fk_coordenador_unidade_unidade; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_coordenador_unidade_unidade ON public.coordenador_unidade USING btree (id_unidade);


--
-- Name: fk_coordenador_unidade_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_coordenador_unidade_usuario ON public.coordenador_unidade USING btree (id_usuario);


--
-- Name: fk_disp_acesso_cod_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_disp_acesso_cod_acesso ON public.dispositivo_acesso USING btree (id_codigo_acesso);


--
-- Name: fk_grupo_perfil_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_grupo_perfil_sistema ON public.grupo_perfil USING btree (id_sistema);


--
-- Name: fk_inf_reg_aud_rec_inf_reg_aud; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_inf_reg_aud_rec_inf_reg_aud ON public.infra_regra_auditoria_recurso USING btree (id_infra_regra_auditoria);


--
-- Name: fk_item_menu_item_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_item_menu_item_menu ON public.item_menu USING btree (id_item_menu_pai, id_menu_pai);


--
-- Name: fk_item_menu_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_item_menu_menu ON public.item_menu USING btree (id_menu);


--
-- Name: fk_item_menu_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_item_menu_recurso ON public.item_menu USING btree (id_recurso, id_sistema);


--
-- Name: fk_login_codigo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_codigo_acesso ON public.login USING btree (id_codigo_acesso);


--
-- Name: fk_login_dispositivo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_dispositivo_acesso ON public.login USING btree (id_dispositivo_acesso);


--
-- Name: fk_login_login_sso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_login_sso ON public.login USING btree (id_login_sso);


--
-- Name: fk_login_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_sistema ON public.login USING btree (id_sistema);


--
-- Name: fk_login_sso_servico_sso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_login_sso_servico_sso ON public.login_sso USING btree (id_servico_sso);


--
-- Name: fk_login_sso_sistema; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_login_sso_sistema ON public.login_sso USING btree (id_sistema);


--
-- Name: fk_login_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_usuario ON public.login USING btree (id_usuario);


--
-- Name: fk_login_usuario_emulador; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_login_usuario_emulador ON public.login USING btree (id_usuario_emulador);


--
-- Name: fk_menu_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_menu_sistema ON public.menu USING btree (id_sistema);


--
-- Name: fk_perfil_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_perfil_sistema ON public.perfil USING btree (id_sistema);


--
-- Name: fk_permissao_perfil; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_permissao_perfil ON public.permissao USING btree (id_perfil, id_sistema);


--
-- Name: fk_permissao_tipo_permissao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_permissao_tipo_permissao ON public.permissao USING btree (id_tipo_permissao);


--
-- Name: fk_permissao_unidade; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_permissao_unidade ON public.permissao USING btree (id_unidade);


--
-- Name: fk_permissao_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_permissao_usuario ON public.permissao USING btree (id_usuario);


--
-- Name: fk_recurso_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_recurso_sistema ON public.recurso USING btree (id_sistema);


--
-- Name: fk_recurso_vinculado_recurso_1; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_recurso_vinculado_recurso_1 ON public.recurso_vinculado USING btree (id_recurso_vinculado, id_sistema_vinculado);


--
-- Name: fk_recurso_vinculado_recurso_2; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_recurso_vinculado_recurso_2 ON public.recurso_vinculado USING btree (id_recurso, id_sistema);


--
-- Name: fk_rel_auditoria_recurso_audit; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_auditoria_recurso_audit ON public.rel_regra_auditoria_recurso USING btree (id_regra_auditoria);


--
-- Name: fk_rel_grupo_perf_perf_grupo; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_grupo_perf_perf_grupo ON public.rel_grupo_perfil_perfil USING btree (id_grupo_perfil, id_sistema);


--
-- Name: fk_rel_grupo_perf_perf_perfil; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_grupo_perf_perf_perfil ON public.rel_grupo_perfil_perfil USING btree (id_perfil, id_sistema);


--
-- Name: fk_rel_hie_uni_hierarquia; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_hie_uni_hierarquia ON public.rel_hierarquia_unidade USING btree (id_hierarquia);


--
-- Name: fk_rel_hie_uni_rel_hie_uni; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_hie_uni_rel_hie_uni ON public.rel_hierarquia_unidade USING btree (id_hierarquia_pai, id_unidade_pai);


--
-- Name: fk_rel_hie_uni_unidade; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_hie_uni_unidade ON public.rel_hierarquia_unidade USING btree (id_unidade);


--
-- Name: fk_rel_orgao_aut_autenticacao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_orgao_aut_autenticacao ON public.rel_orgao_autenticacao USING btree (id_servidor_autenticacao);


--
-- Name: fk_rel_orgao_aut_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_orgao_aut_orgao ON public.rel_orgao_autenticacao USING btree (id_orgao);


--
-- Name: fk_rel_per_ite_men_rel_per_rec; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_per_ite_men_rel_per_rec ON public.rel_perfil_item_menu USING btree (id_perfil, id_recurso, id_sistema);


--
-- Name: fk_rel_perfil_item_menu_it_men; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_perfil_item_menu_it_men ON public.rel_perfil_item_menu USING btree (id_item_menu, id_menu);


--
-- Name: fk_rel_perfil_recurso_perfil; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_perfil_recurso_perfil ON public.rel_perfil_recurso USING btree (id_perfil, id_sistema);


--
-- Name: fk_rel_perfil_recurso_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_rel_perfil_recurso_recurso ON public.rel_perfil_recurso USING btree (id_recurso, id_sistema);


--
-- Name: fk_rel_sis_serv_sso_serv_sso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rel_sis_serv_sso_serv_sso ON public.rel_sistema_servico_sso USING btree (id_servico_sso);


--
-- Name: fk_rel_sis_serv_sso_sistema; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rel_sis_serv_sso_sistema ON public.rel_sistema_servico_sso USING btree (id_sistema);


--
-- Name: fk_sistema_hierarquia; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_sistema_hierarquia ON public.sistema USING btree (id_hierarquia);


--
-- Name: fk_sistema_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_sistema_orgao ON public.sistema USING btree (id_orgao);


--
-- Name: fk_unidade_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_unidade_orgao ON public.unidade USING btree (id_orgao);


--
-- Name: fk_usuario_historico_cod_acess; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_usuario_historico_cod_acess ON public.usuario_historico USING btree (id_codigo_acesso);


--
-- Name: fk_usuario_historico_usu_oper; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_usuario_historico_usu_oper ON public.usuario_historico USING btree (id_usuario_operacao);


--
-- Name: fk_usuario_historico_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_usuario_historico_usuario ON public.usuario_historico USING btree (id_usuario);


--
-- Name: fk_usuario_login_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_usuario_login_usuario ON public.usuario_login USING btree (id_usuario);


--
-- Name: fk_usuario_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX fk_usuario_orgao ON public.usuario USING btree (id_orgao);


--
-- Name: i01_codigo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_codigo_acesso ON public.codigo_acesso USING btree (dth_ativacao);


--
-- Name: i01_codigo_bloqueio; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_codigo_bloqueio ON public.codigo_bloqueio USING btree (dth_envio);


--
-- Name: i01_dispositivo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_dispositivo_acesso ON public.dispositivo_acesso USING btree (id_codigo_acesso, dth_acesso);


--
-- Name: i01_hierarquia; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i01_hierarquia ON public.hierarquia USING btree (id_hierarquia, sin_ativo);


--
-- Name: i01_infra_auditoria; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_infra_auditoria ON public.infra_auditoria USING btree (recurso);


--
-- Name: i01_infra_log; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_infra_log ON public.infra_log USING btree (dth_log, sta_tipo);


--
-- Name: i01_orgao; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i01_orgao ON public.orgao USING btree (id_orgao, sin_ativo);


--
-- Name: i01_rel_perfil_item_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i01_rel_perfil_item_menu ON public.rel_perfil_item_menu USING btree (id_perfil, id_sistema);


--
-- Name: i01_servico_sso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i01_servico_sso ON public.servico_sso USING btree (identificacao);


--
-- Name: i02_codigo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i02_codigo_acesso ON public.codigo_acesso USING btree (id_usuario, id_sistema, sin_unico);


--
-- Name: i02_dispositivo_acesso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i02_dispositivo_acesso ON public.dispositivo_acesso USING btree (id_codigo_acesso, dth_liberacao);


--
-- Name: i02_infra_auditoria; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i02_infra_auditoria ON public.infra_auditoria USING btree (dth_acesso);


--
-- Name: i02_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i02_menu ON public.menu USING btree (id_menu, sin_ativo);


--
-- Name: i02_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i02_recurso ON public.recurso USING btree (id_recurso, id_sistema, sin_ativo);


--
-- Name: i02_unidade; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i02_unidade ON public.unidade USING btree (id_unidade, sin_ativo);


--
-- Name: i02_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i02_usuario ON public.usuario USING btree (id_usuario, sin_ativo);


--
-- Name: i03_infra_auditoria; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i03_infra_auditoria ON public.infra_auditoria USING btree (sigla_usuario);


--
-- Name: i03_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i03_recurso ON public.recurso USING btree (id_recurso, id_sistema, nome, sin_ativo);


--
-- Name: i03_sistema; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i03_sistema ON public.sistema USING btree (id_sistema, sin_ativo);


--
-- Name: i03_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i03_usuario ON public.usuario USING btree (id_origem);


--
-- Name: i04_infra_auditoria; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i04_infra_auditoria ON public.infra_auditoria USING btree (sigla_unidade);


--
-- Name: i04_item_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i04_item_menu ON public.item_menu USING btree (id_item_menu, id_menu, sin_ativo);


--
-- Name: i04_login; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i04_login ON public.login USING btree (id_login, id_sistema, id_usuario, sta_login);


--
-- Name: i04_recurso; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i04_recurso ON public.recurso USING btree (id_recurso, sin_ativo);


--
-- Name: i04_rel_hierarquia_unidade; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE UNIQUE INDEX i04_rel_hierarquia_unidade ON public.rel_hierarquia_unidade USING btree (id_hierarquia, id_unidade, sin_ativo);


--
-- Name: i04_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i04_usuario ON public.usuario USING btree (cpf);


--
-- Name: i05_item_menu; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i05_item_menu ON public.item_menu USING btree (id_recurso);


--
-- Name: i05_login; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i05_login ON public.login USING btree (id_login, id_sistema, id_usuario, dth_login);


--
-- Name: i05_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i05_usuario ON public.usuario USING btree (id_usuario, id_orgao, id_origem);


--
-- Name: i06_login; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i06_login ON public.login USING btree (hash_usuario, dth_login, sta_login);


--
-- Name: i06_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i06_usuario ON public.usuario USING btree (id_usuario, id_orgao, cpf);


--
-- Name: i07_login; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i07_login ON public.login USING btree (dth_login);


--
-- Name: i07_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i07_usuario ON public.usuario USING btree (sin_bloqueado);


--
-- Name: i08_usuario; Type: INDEX; Schema: public; Owner: sip_user
--

CREATE INDEX i08_usuario ON public.usuario USING btree (dth_pausa_2fa);


--
-- Name: administrador_sistema fk_admin_sistema_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.administrador_sistema
    ADD CONSTRAINT fk_admin_sistema_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: administrador_sistema fk_admin_sistema_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.administrador_sistema
    ADD CONSTRAINT fk_admin_sistema_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: assinatura_sso fk_assinatura_sso_login_sso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assinatura_sso
    ADD CONSTRAINT fk_assinatura_sso_login_sso FOREIGN KEY (id_login_sso) REFERENCES public.login_sso(id_login_sso);


--
-- Name: rel_regra_auditoria_recurso fk_auditoria_recurso_recurso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_regra_auditoria_recurso
    ADD CONSTRAINT fk_auditoria_recurso_recurso FOREIGN KEY (id_recurso, id_sistema) REFERENCES public.recurso(id_recurso, id_sistema);


--
-- Name: regra_auditoria fk_auditoria_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.regra_auditoria
    ADD CONSTRAINT fk_auditoria_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: codigo_acesso fk_cod_acesso_usu_desativacao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_acesso
    ADD CONSTRAINT fk_cod_acesso_usu_desativacao FOREIGN KEY (id_usuario_desativacao) REFERENCES public.usuario(id_usuario);


--
-- Name: codigo_bloqueio fk_cod_bloqueio_cod_acesso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_bloqueio
    ADD CONSTRAINT fk_cod_bloqueio_cod_acesso FOREIGN KEY (id_codigo_acesso) REFERENCES public.codigo_acesso(id_codigo_acesso);


--
-- Name: codigo_acesso fk_codigo_acesso_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_acesso
    ADD CONSTRAINT fk_codigo_acesso_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: codigo_acesso fk_codigo_acesso_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.codigo_acesso
    ADD CONSTRAINT fk_codigo_acesso_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: coordenador_perfil fk_coordenador_perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_perfil
    ADD CONSTRAINT fk_coordenador_perfil_perfil FOREIGN KEY (id_perfil, id_sistema) REFERENCES public.perfil(id_perfil, id_sistema);


--
-- Name: coordenador_perfil fk_coordenador_perfil_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_perfil
    ADD CONSTRAINT fk_coordenador_perfil_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: coordenador_unidade fk_coordenador_unidade_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_unidade
    ADD CONSTRAINT fk_coordenador_unidade_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: coordenador_unidade fk_coordenador_unidade_unidade; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_unidade
    ADD CONSTRAINT fk_coordenador_unidade_unidade FOREIGN KEY (id_unidade) REFERENCES public.unidade(id_unidade);


--
-- Name: coordenador_unidade fk_coordenador_unidade_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.coordenador_unidade
    ADD CONSTRAINT fk_coordenador_unidade_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: dispositivo_acesso fk_disp_acesso_cod_acesso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.dispositivo_acesso
    ADD CONSTRAINT fk_disp_acesso_cod_acesso FOREIGN KEY (id_codigo_acesso) REFERENCES public.codigo_acesso(id_codigo_acesso);


--
-- Name: grupo_perfil fk_grupo_perfil_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.grupo_perfil
    ADD CONSTRAINT fk_grupo_perfil_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: infra_regra_auditoria_recurso fk_inf_reg_aud_rec_inf_reg_aud; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.infra_regra_auditoria_recurso
    ADD CONSTRAINT fk_inf_reg_aud_rec_inf_reg_aud FOREIGN KEY (id_infra_regra_auditoria) REFERENCES public.infra_regra_auditoria(id_infra_regra_auditoria);


--
-- Name: item_menu fk_item_menu_item_menu; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.item_menu
    ADD CONSTRAINT fk_item_menu_item_menu FOREIGN KEY (id_item_menu_pai, id_menu_pai) REFERENCES public.item_menu(id_item_menu, id_menu);


--
-- Name: item_menu fk_item_menu_menu; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.item_menu
    ADD CONSTRAINT fk_item_menu_menu FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: item_menu fk_item_menu_recurso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.item_menu
    ADD CONSTRAINT fk_item_menu_recurso FOREIGN KEY (id_recurso, id_sistema) REFERENCES public.recurso(id_recurso, id_sistema);


--
-- Name: login fk_login_codigo_acesso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_codigo_acesso FOREIGN KEY (id_codigo_acesso) REFERENCES public.codigo_acesso(id_codigo_acesso);


--
-- Name: login fk_login_dispositivo_acesso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_dispositivo_acesso FOREIGN KEY (id_dispositivo_acesso) REFERENCES public.dispositivo_acesso(id_dispositivo_acesso);


--
-- Name: login fk_login_login_sso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_login_sso FOREIGN KEY (id_login_sso) REFERENCES public.login_sso(id_login_sso);


--
-- Name: login fk_login_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: login_sso fk_login_sso_servico_sso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_sso
    ADD CONSTRAINT fk_login_sso_servico_sso FOREIGN KEY (id_servico_sso) REFERENCES public.servico_sso(id_servico_sso);


--
-- Name: login_sso fk_login_sso_sistema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_sso
    ADD CONSTRAINT fk_login_sso_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: login fk_login_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: login fk_login_usuario_emulador; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_login_usuario_emulador FOREIGN KEY (id_usuario_emulador) REFERENCES public.usuario(id_usuario);


--
-- Name: menu fk_menu_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: perfil fk_perfil_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT fk_perfil_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: permissao fk_permissao_perfil; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT fk_permissao_perfil FOREIGN KEY (id_perfil, id_sistema) REFERENCES public.perfil(id_perfil, id_sistema);


--
-- Name: permissao fk_permissao_tipo_permissao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT fk_permissao_tipo_permissao FOREIGN KEY (id_tipo_permissao) REFERENCES public.tipo_permissao(id_tipo_permissao);


--
-- Name: permissao fk_permissao_unidade; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT fk_permissao_unidade FOREIGN KEY (id_unidade) REFERENCES public.unidade(id_unidade);


--
-- Name: permissao fk_permissao_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT fk_permissao_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: recurso fk_recurso_sistema; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_recurso_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: recurso_vinculado fk_recurso_vinculado_recurso_1; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.recurso_vinculado
    ADD CONSTRAINT fk_recurso_vinculado_recurso_1 FOREIGN KEY (id_recurso_vinculado, id_sistema_vinculado) REFERENCES public.recurso(id_recurso, id_sistema);


--
-- Name: recurso_vinculado fk_recurso_vinculado_recurso_2; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.recurso_vinculado
    ADD CONSTRAINT fk_recurso_vinculado_recurso_2 FOREIGN KEY (id_recurso, id_sistema) REFERENCES public.recurso(id_recurso, id_sistema);


--
-- Name: rel_regra_auditoria_recurso fk_rel_auditoria_recurso_audit; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_regra_auditoria_recurso
    ADD CONSTRAINT fk_rel_auditoria_recurso_audit FOREIGN KEY (id_regra_auditoria) REFERENCES public.regra_auditoria(id_regra_auditoria);


--
-- Name: rel_grupo_perfil_perfil fk_rel_grupo_perf_perf_grupo; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_grupo_perfil_perfil
    ADD CONSTRAINT fk_rel_grupo_perf_perf_grupo FOREIGN KEY (id_grupo_perfil, id_sistema) REFERENCES public.grupo_perfil(id_grupo_perfil, id_sistema);


--
-- Name: rel_grupo_perfil_perfil fk_rel_grupo_perf_perf_perfil; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_grupo_perfil_perfil
    ADD CONSTRAINT fk_rel_grupo_perf_perf_perfil FOREIGN KEY (id_perfil, id_sistema) REFERENCES public.perfil(id_perfil, id_sistema);


--
-- Name: rel_hierarquia_unidade fk_rel_hie_uni_hierarquia; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_hierarquia_unidade
    ADD CONSTRAINT fk_rel_hie_uni_hierarquia FOREIGN KEY (id_hierarquia) REFERENCES public.hierarquia(id_hierarquia);


--
-- Name: rel_hierarquia_unidade fk_rel_hie_uni_rel_hie_uni; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_hierarquia_unidade
    ADD CONSTRAINT fk_rel_hie_uni_rel_hie_uni FOREIGN KEY (id_hierarquia_pai, id_unidade_pai) REFERENCES public.rel_hierarquia_unidade(id_hierarquia, id_unidade);


--
-- Name: rel_hierarquia_unidade fk_rel_hie_uni_unidade; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_hierarquia_unidade
    ADD CONSTRAINT fk_rel_hie_uni_unidade FOREIGN KEY (id_unidade) REFERENCES public.unidade(id_unidade);


--
-- Name: rel_orgao_autenticacao fk_rel_orgao_aut_autenticacao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_orgao_autenticacao
    ADD CONSTRAINT fk_rel_orgao_aut_autenticacao FOREIGN KEY (id_servidor_autenticacao) REFERENCES public.servidor_autenticacao(id_servidor_autenticacao);


--
-- Name: rel_orgao_autenticacao fk_rel_orgao_aut_orgao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_orgao_autenticacao
    ADD CONSTRAINT fk_rel_orgao_aut_orgao FOREIGN KEY (id_orgao) REFERENCES public.orgao(id_orgao);


--
-- Name: rel_perfil_item_menu fk_rel_per_ite_men_rel_per_rec; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_item_menu
    ADD CONSTRAINT fk_rel_per_ite_men_rel_per_rec FOREIGN KEY (id_perfil, id_recurso, id_sistema) REFERENCES public.rel_perfil_recurso(id_perfil, id_recurso, id_sistema);


--
-- Name: rel_perfil_item_menu fk_rel_perfil_item_menu_it_men; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_item_menu
    ADD CONSTRAINT fk_rel_perfil_item_menu_it_men FOREIGN KEY (id_item_menu, id_menu) REFERENCES public.item_menu(id_item_menu, id_menu);


--
-- Name: rel_perfil_recurso fk_rel_perfil_recurso_perfil; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_recurso
    ADD CONSTRAINT fk_rel_perfil_recurso_perfil FOREIGN KEY (id_perfil, id_sistema) REFERENCES public.perfil(id_perfil, id_sistema);


--
-- Name: rel_perfil_recurso fk_rel_perfil_recurso_recurso; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.rel_perfil_recurso
    ADD CONSTRAINT fk_rel_perfil_recurso_recurso FOREIGN KEY (id_recurso, id_sistema) REFERENCES public.recurso(id_recurso, id_sistema);


--
-- Name: rel_sistema_servico_sso fk_rel_sis_serv_sso_serv_sso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_sistema_servico_sso
    ADD CONSTRAINT fk_rel_sis_serv_sso_serv_sso FOREIGN KEY (id_servico_sso) REFERENCES public.servico_sso(id_servico_sso);


--
-- Name: rel_sistema_servico_sso fk_rel_sis_serv_sso_sistema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_sistema_servico_sso
    ADD CONSTRAINT fk_rel_sis_serv_sso_sistema FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema);


--
-- Name: sistema fk_sistema_hierarquia; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT fk_sistema_hierarquia FOREIGN KEY (id_hierarquia) REFERENCES public.hierarquia(id_hierarquia);


--
-- Name: sistema fk_sistema_orgao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT fk_sistema_orgao FOREIGN KEY (id_orgao) REFERENCES public.orgao(id_orgao);


--
-- Name: unidade fk_unidade_orgao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT fk_unidade_orgao FOREIGN KEY (id_orgao) REFERENCES public.orgao(id_orgao);


--
-- Name: usuario_historico fk_usuario_historico_cod_acess; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario_historico
    ADD CONSTRAINT fk_usuario_historico_cod_acess FOREIGN KEY (id_codigo_acesso) REFERENCES public.codigo_acesso(id_codigo_acesso);


--
-- Name: usuario_historico fk_usuario_historico_usu_oper; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario_historico
    ADD CONSTRAINT fk_usuario_historico_usu_oper FOREIGN KEY (id_usuario_operacao) REFERENCES public.usuario(id_usuario);


--
-- Name: usuario_historico fk_usuario_historico_usuario; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario_historico
    ADD CONSTRAINT fk_usuario_historico_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: usuario_login fk_usuario_login_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_login
    ADD CONSTRAINT fk_usuario_login_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: usuario fk_usuario_orgao; Type: FK CONSTRAINT; Schema: public; Owner: sip_user
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_usuario_orgao FOREIGN KEY (id_orgao) REFERENCES public.orgao(id_orgao);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO sip_user;


--
-- Name: TABLE assinatura_sso; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assinatura_sso TO sip_user;


--
-- Name: TABLE infra_navegador_verificacao; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.infra_navegador_verificacao TO sip_user;


--
-- Name: TABLE login_sso; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.login_sso TO sip_user;


--
-- Name: TABLE rel_sistema_servico_sso; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rel_sistema_servico_sso TO sip_user;


--
-- Name: TABLE servico_sso; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.servico_sso TO sip_user;


--
-- Name: TABLE usuario_login; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.usuario_login TO sip_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO sip_user;


--
-- PostgreSQL database dump complete
--

