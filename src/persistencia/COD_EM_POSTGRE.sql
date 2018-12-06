﻿
CREATE TABLE IF NOT EXISTS PROFESSOR (
  ID_PROFESSOR SERIAL,
  NOME_PROFESSOR VARCHAR(55) NULL,
  DEPARTAMENTO VARCHAR(100) NULL,
  TELEFONE VARCHAR(12) NULL,
  EMAIL_PROFESSOR VARCHAR(100) NULL,
  PRIMARY KEY(ID_PROFESSOR)
);

CREATE TABLE IF NOT EXISTS SOLICITANTE (
  ID_SOLICITANTE SERIAL,
  ID_PROFESSOR BIGINT NULL,
  NOME_SOLICITANTE VARCHAR(55) NULL,
  TELEFONE VARCHAR(12) NULL,
  EMAIL_SOLICITANTE VARCHAR(100) NULL,
  PRIMARY KEY(ID_SOLICITANTE),
  FOREIGN KEY (ID_PROFESSOR) REFERENCES PROFESSOR (ID_PROFESSOR)
);

CREATE TABLE IF NOT EXISTS RESPONSAVEL (
  ID_REPONSAVEL SERIAL,
  NOME_RESPONSAVEL VARCHAR(55) NULL,
  DATA_RECEBIMENTO DATE NULL,
  HORA TIME NULL,
  ASSINATURA VARCHAR(55),
  PRIMARY KEY(ID_REPONSAVEL)
);

CREATE TABLE IF NOT EXISTS AMOSTRA (
  ID_AMOSTRA SERIAL,
  IDENTIFICACAO_AMOSTRA VARCHAR(30),
  ID_SOLICITANTE BIGINT NULL,
  ID_REPONSAVEL BIGINT NULL,
  DESCRICAO VARCHAR(60) NULL,
  FRASCOS INTEGER NULL,
  OBSERVACOES VARCHAR(100),
  DATA_ENTRADA DATE NULL,
  PRIMARY KEY(ID_AMOSTRA),
  FOREIGN KEY (ID_SOLICITANTE) REFERENCES SOLICITANTE (ID_SOLICITANTE),
  FOREIGN KEY (ID_REPONSAVEL) REFERENCES RESPONSAVEL (ID_REPONSAVEL)
);

CREATE TABLE ANALISES(
  ID_ANALISE SERIAL,
  NOME_ANALISE VARCHAR(50) NOT NULL,
  PRIMARY KEY(ID_ANALISE)
);

INSERT INTO ANALISES(NOME_ANALISE) VALUES ('UMIDADE'),
  ('MATERIA_SECA'),
  ('MATERIA_MINERAL'),
  ('EXTRATO_ETEREO'),
  ('PROTEINA_BRUTA'),
  ('FIBRA_EM_DERTERGENTE_ACIDO'),
  ('FIBRA_EM_DERTEGENTE_NEUTRO'),
  ('PROTEINA_INSULUVEL_EM_DETERGENTE_NEUTRO'),
  ('PROTEINA_INSULUVEL_EM_DETERGENTE_ACIDO'),
  ('CARBOIDRATOS_TOTAIS'),
  ('CARBOIDRATOS_NAO_FIBROSOS'),
  ('CELULOSE'),
  ('HEMICELULOSE'),
  ('ENERGIA_DISGESTIVEL'),
  ('NUTRIENTES_DIGESTIVOS_TOTAIS');

CREATE TABLE AMOSTRA_ANALISES(
  ID_AMOSTRA_ANALISE SERIAL,
  ID_AMOSTRAR INT NOT NULL,
  ID_ANALISER INT NOT NULL,
  PRIMARY KEY(ID_AMOSTRA_ANALISE),
  FOREIGN KEY(ID_AMOSTRAR) REFERENCES AMOSTRA (ID_AMOSTRA),
  FOREIGN KEY(ID_ANALISER) REFERENCES ANALISES (ID_ANALISE)
);
