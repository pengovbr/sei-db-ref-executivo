/*
SCRIPT DE LIMPEZA DE DADOS DA BASE DE DADOS DO SIP - SEI 4.1.0 (MySQL)
*/

/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
delete from infra_auditoria;

delete from seq_infra_auditoria;

delete from infra_log;

delete from seq_infra_log;

delete from login;

delete from recurso_vinculado;

delete from codigo_bloqueio;

delete from dispositivo_acesso;

delete from codigo_acesso;

delete from usuario_historico;

/********************************************************************************************************************************************************/
