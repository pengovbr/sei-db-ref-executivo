/*
SCRIPT DE LIMPEZA DE PROCESSOS, DOCUMENTOS E OPERAÇÕES DE USUÁRIOS DA BASE DE DADOS DO SEI 4.0.0 (SQLServer)    
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

/* Limpeza de tabelas afetas a Protocolo de Processos, de Documentos Gerados e Externos e de Operações dos Usuários */

use sei;

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
EXEC sp_MSForEachTable 'ALTER TABLE ? DISABLE TRIGGER ALL';

delete from anexo;
delete from seq_anexo;

delete from numeracao;
delete from seq_numeracao;

delete from acesso;
delete from seq_acesso;

delete from acesso_externo;
delete from seq_acesso_externo;

delete from acompanhamento;
delete from seq_acompanhamento;

delete from grupo_acompanhamento;
delete from seq_grupo_acompanhamento;

delete from andamento_situacao;
delete from seq_andamento_situacao;


delete from anotacao;
delete from seq_anotacao;

delete from assinatura;
delete from seq_assinatura;

delete from estatisticas;
delete from seq_estatisticas;


delete from base_conhecimento;
delete from seq_base_conhecimento;

delete from rel_base_conhec_tipo_proced;


delete from versao_secao_documento;
delete from seq_versao_secao_documento;

delete from secao_documento;
delete from seq_secao_documento;

delete from atributo_andamento;
delete from seq_atributo_andamento;

delete from retorno_programado;
delete from seq_retorno_programado;

delete from participante;
delete from seq_participante;

delete from observacao;
delete from seq_observacao;

delete from rel_protocolo_assunto;

delete from rel_protocolo_protocolo;
delete from seq_rel_protocolo_protocolo;

delete from publicacao;
delete from seq_publicacao;

delete from rel_bloco_protocolo;

delete from rel_bloco_unidade;

delete from protocolo_modelo;
delete from seq_protocolo_modelo;

delete from grupo_protocolo_modelo;
delete from seq_grupo_protocolo_modelo;

delete from unidade_publicacao;
delete from seq_unidade_publicacao;

delete from serie_escolha;

delete from serie_publicacao;
delete from seq_serie_publicacao;

delete from texto_padrao_interno;
delete from seq_texto_padrao_interno;

delete from rel_protocolo_atributo;

delete from feed;
delete from seq_feed;

delete from velocidade_transferencia;

delete from seq_atributo_andamento_situaca;

delete from auditoria_protocolo;
delete from seq_auditoria_protocolo;

delete from rel_notificacao_documento;

delete from notificacao;

delete from bloco;
delete from seq_bloco;

delete from atividade;
delete from seq_atividade;

delete from documento;
delete from seq_documento;

delete from procedimento;

delete from tipo_procedimento_escolha;

delete from protocolo;
delete from seq_protocolo;

delete from email_grupo_email;
delete from seq_email_grupo_email;

delete from grupo_email;
delete from seq_grupo_email;

delete from acao_federacao;

delete from acesso_federacao;

delete from andamento_instalacao;
delete from seq_andamento_instalacao;

delete from andamento_marcador;
delete from seq_andamento_marcador;

delete from seq_andamento_situacao;

delete from arquivamento;

delete from atributo_instalacao;
delete from seq_atributo_instalacao;

delete from campo_pesquisa;
delete from seq_campo_pesquisa;

delete from categoria;
delete from seq_categoria;

delete from comentario;
delete from seq_comentario;

delete from controle_prazo;
delete from seq_controle_prazo;

delete from documento_conteudo;

delete from grupo_bloco;
delete from seq_grupo_bloco;

delete from grupo_federacao;
delete from seq_grupo_federacao;

delete from instalacao_federacao;

delete from lembrete;
delete from seq_lembrete;

delete from mapeamento_assunto;

delete from marcador;
delete from seq_marcador;

delete from monitoramento_servico;
delete from seq_monitoramento_servico;

delete from orgao_federacao;

delete from parametro_acao_federacao;

delete from pesquisa;
delete from seq_pesquisa;

delete from protocolo_federacao;

delete from rel_acesso_ext_protocolo;

delete from rel_acesso_ext_serie;

delete from rel_grupo_fed_orgao_fed;

delete from rel_usuario_grupo_acomp;

delete from rel_usuario_grupo_bloco;

delete from rel_usuario_marcador;

delete from rel_usuario_tipo_proced;

delete from rel_usuario_usuario_unidade;

delete from replicacao_federacao;

delete from serie_restricao;
delete from seq_serie_restricao;

delete from sinalizacao_federacao;

delete from tipo_formulario;
delete from seq_tipo_formulario;

delete from tipo_localizador;

delete from tipo_proced_restricao;
delete from seq_tipo_proced_restricao;

delete from unidade_federacao;

delete from usuario_federacao;


/* Se no banco a ser limpo tenha Grupos de E-mail Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de E-mail dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_email where sta_tipo='U';
*/

delete from grupo_unidade;
delete from seq_grupo_unidade;

/* Se no banco a ser limpo tenha Grupos de Envio Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de Envio dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_unidade where sta_tipo='U';
*/


/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
delete from infra_auditoria;
delete from seq_infra_auditoria;

delete from infra_log;
delete from seq_infra_log;

delete from infra_navegador;
delete from seq_infra_navegador;

delete from infra_dado_usuario;

EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL';
EXEC sp_MSForEachTable 'ALTER TABLE ? ENABLE TRIGGER ALL';



/* Sobre a última linha abaixo, de acordo com a configuração da fórmula de numeração de protocolo de processo, a tabela de sequência anual de processos pode ser qualquer um dos formatos abaixo:
	seq_[ano]org_sip[id sip]
	seq_[ano]org_sei[cod sei]
	seq_[ano]uni_sip[id sip]
	seq_[ano]uni_sei[cod sei]
*/

delete from infra_sequencia where nome_tabela like 'seq_%uni_sei%';
delete from infra_sequencia where nome_tabela like 'seq_%uni_sip%';
delete from infra_sequencia where nome_tabela like 'seq_%org_sei%';
delete from infra_sequencia where nome_tabela like 'seq_%org_sip%';

update infra_sequencia set num_atual=0 where nome_tabela='infra_log';
update infra_sequencia set num_atual=0 where nome_tabela='infra_navegador';



