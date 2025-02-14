/*
SCRIPT DE LIMPEZA DE PROCESSOS, DOCUMENTOS E OPERAÇÕES DE USUÁRIOS DA BASE DE DADOS DO SEI 4.0.0.0 (MySQL)    
	Antes de executar o script:
		1) Retirar o sistema do "AR" (derrubar todas sessões).
		2) Fazer uma cópia da base imediatamente antes de executar o script.
		3) Executar o script de limpeza. Se der erro, restaurar a base com a cópia feita no passo 2.
	
	Depois de executar o script com sucesso, sendo aconselhável conferir algumas tabelas abaixo e sequenciais de protocolo de processo na tabela "infra_sequencia":
		1) Apagar todos os arquivos e estrutura de pastas no Filesystem do SEI.
		2) Excluir os índices do Solr, conforme orientado no final do capítulo do Solr no Manual de Instalação do SEI:
			18 - Caso,  no  futuro,  seja  preciso  reindexar  todos  os  dados  é  aconselhável  limpar  antes  os  índices usando os comandos abaixo:
				http://[servidor_solr]:8080/solr/sei-protocolos/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-bases-conhecimento/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-publicacoes/update?stream.body=<delete><query>*:*</query></delete>&commit=true
		4) Colocar o sistema de volta ao "AR".
*/

use sei;

/* Limpeza de tabelas afetas a Protocolo de Processos, de Documentos Gerados e Externos e de Operações dos Usuários */

SET FOREIGN_KEY_CHECKS=0;

truncate table anexo;
truncate table seq_anexo;

truncate table numeracao;
truncate table seq_numeracao;

truncate table acesso;
truncate table seq_acesso;

truncate table acesso_externo;
truncate table seq_acesso_externo;

truncate table acompanhamento;
truncate table seq_acompanhamento;

truncate table grupo_acompanhamento;
truncate table seq_grupo_acompanhamento;

truncate table andamento_situacao;
truncate table seq_andamento_situacao;

truncate table anotacao;
truncate table seq_anotacao;

truncate table assinatura;
truncate table seq_assinatura;

truncate table estatisticas;
truncate table seq_estatisticas;

truncate table base_conhecimento;
truncate table seq_base_conhecimento;

truncate table rel_base_conhec_tipo_proced;

truncate table versao_secao_documento;
truncate table seq_versao_secao_documento;

truncate table secao_documento;
truncate table seq_secao_documento;

truncate table atributo_andamento;
truncate table seq_atributo_andamento;

truncate table retorno_programado;
truncate table seq_retorno_programado;

truncate table participante;
truncate table seq_participante;

truncate table observacao;
truncate table seq_observacao;

truncate table rel_protocolo_assunto;

truncate table rel_protocolo_protocolo;
truncate table seq_rel_protocolo_protocolo;

truncate table publicacao;
truncate table seq_publicacao;

truncate table rel_bloco_protocolo;

truncate table rel_bloco_unidade;

truncate table protocolo_modelo;
truncate table seq_protocolo_modelo;

truncate table grupo_protocolo_modelo;
truncate table seq_grupo_protocolo_modelo;

truncate table unidade_publicacao;
truncate table seq_unidade_publicacao;

truncate table serie_escolha;

truncate table serie_publicacao;
truncate table seq_serie_publicacao;

truncate table texto_padrao_interno;
truncate table seq_texto_padrao_interno;

truncate table rel_protocolo_atributo;

truncate table feed;
truncate table seq_feed;

truncate table velocidade_transferencia;

truncate table seq_atributo_andamento_situaca;

truncate table auditoria_protocolo;
truncate table seq_auditoria_protocolo;

truncate table rel_notificacao_documento;

truncate table notificacao;

truncate table bloco;
truncate table seq_bloco;

truncate table atividade;
truncate table seq_atividade;

truncate table documento;
truncate table seq_documento;

truncate table procedimento;

truncate table tipo_procedimento_escolha;

truncate table protocolo;
truncate table seq_protocolo;

truncate table email_grupo_email;
truncate table seq_email_grupo_email;

truncate table grupo_email;
truncate table seq_grupo_email;

truncate table acao_federacao;

truncate table acesso_federacao;

truncate table andamento_instalacao;
truncate table seq_andamento_instalacao;

truncate table andamento_marcador;
truncate table seq_andamento_marcador;

truncate table seq_andamento_situacao;

truncate table arquivamento;

truncate table atributo_instalacao;
truncate table seq_atributo_instalacao;

truncate table campo_pesquisa;
truncate table seq_campo_pesquisa;

truncate table categoria;
truncate table seq_categoria;

truncate table comentario;
truncate table seq_comentario;

truncate table controle_prazo;
truncate table seq_controle_prazo;

truncate table documento_conteudo;

truncate table grupo_bloco;
truncate table seq_grupo_bloco;

truncate table grupo_federacao;
truncate table seq_grupo_federacao;

truncate table instalacao_federacao;

truncate table lembrete;
truncate table seq_lembrete;

truncate table marcador;
truncate table seq_marcador;

truncate table monitoramento_servico;
truncate table seq_monitoramento_servico;

truncate table orgao_federacao;

truncate table parametro_acao_federacao;

truncate table pesquisa;
truncate table seq_pesquisa;

truncate table protocolo_federacao;

truncate table rel_acesso_ext_protocolo;

truncate table rel_acesso_ext_serie;

truncate table rel_grupo_fed_orgao_fed;

truncate table rel_usuario_grupo_acomp;

truncate table rel_usuario_grupo_bloco;

truncate table rel_usuario_marcador;

truncate table rel_usuario_tipo_proced;

truncate table rel_usuario_usuario_unidade;

truncate table replicacao_federacao;

truncate table sinalizacao_federacao;

truncate table unidade_federacao;

truncate table usuario_federacao;



/* Se no banco a ser limpo tenha Grupos de E-mail Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de E-mail dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_email where sta_tipo='U';
*/

truncate table grupo_unidade;
truncate table seq_grupo_unidade;

/* Se no banco a ser limpo tenha Grupos de Envio Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de Envio dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_unidade where sta_tipo='U';
*/


/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
truncate table infra_auditoria;
truncate table seq_infra_auditoria;

truncate table infra_log;
truncate table seq_infra_log;

truncate table infra_navegador;
truncate table seq_infra_navegador;

truncate table infra_dado_usuario;


SET FOREIGN_KEY_CHECKS=1;


/* Sobre a última linha abaixo, de acordo com a configuração da fórmula de numeração de protocolo de processo, a tabela de sequência anual de processos pode ser qualquer um dos formatos abaixo:
	seq_[ano]_org_sip_[id sip]
	seq_[ano]_org_sei_[cod sei]
	seq_[ano]_uni_sip_[id sip]
	seq_[ano]_uni_sei_[cod sei]
*/

delete from infra_sequencia where nome_tabela like 'seq_%_uni_sei_%';
delete from infra_sequencia where nome_tabela like 'seq_%_uni_sip_%';
delete from infra_sequencia where nome_tabela like 'seq_%_org_sei_%';
delete from infra_sequencia where nome_tabela like 'seq_%_org_sip_%';

update infra_sequencia set num_atual=0 where nome_tabela='infra_log';
update infra_sequencia set num_atual=0 where nome_tabela='infra_navegador';

/********************************************************************************************************************************************************/

