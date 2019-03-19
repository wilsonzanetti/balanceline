object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 626
  Width = 974
  object DBSaude: TADOConnection
    CommandTimeout = 999
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 88
    Top = 8
  end
  object AdoQuery: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 8
  end
  object QrSaudePro: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 48
  end
  object QrGeral: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 96
  end
  object QInsBenef: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 144
  end
  object Qr_PesqMatr: TADOQuery
    Connection = DBSaude
    Parameters = <
      item
        Name = 'Handle'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'Select Handle'
      '  From Sam_Matricula'
      'where Handle=:Handle')
    Left = 16
    Top = 192
  end
  object QrMatricula: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 240
  end
  object QrBeneficiario: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 280
  end
  object QrFamilia: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 328
  end
  object QrSaudePro2: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 424
  end
  object QrSaudePro1: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 376
  end
  object ADOQuery11: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 472
  end
  object QrInsAnotAdm: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 520
  end
  object QrSaudePro3: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 16
    Top = 568
  end
  object Qr_UpFilialRegiao: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO'
      '      SET'
      '          FILIALCUSTO=:FILIALCUSTO,'
      '          REGIAO=:REGIAO,'
      '          ENDERECOCORRESPONDENCIA=:ENDERECOCORRESPONDENCIA,'
      '          ENDERECORESIDENCIAL=:ENDERECORESIDENCIAL'
      '      WHERE HANDLE=:HANDLE')
    Left = 88
    Top = 56
  end
  object QrEndereco: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 88
    Top = 112
  end
  object Qr_InsContaFin: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO SFN_CONTAFIN      '
      
        '        (HANDLE,BENEFICIARIO,TABRESPONSAVEL,BANCO,AGENCIA,CONTAC' +
        'ORRENTE,'
      
        '        DV,INCLUSAOUSUARIO,INCLUSAODATA,NAOPARCELAR,TABINSTRUCAO' +
        'PARCELAMENTO,NAOGERARDOCUMENTO,     '
      
        '        NAOCOBRARTARIFA,TABINSTRUCAOPARCELAMENTOPROX,TABGERACAOR' +
        'EC,TABGERACAOPAG,TIPODOCUMENTOREC,TIPODOCUMENTOPAG,'
      '        CCNOME,CCCPFCNPJ)'
      '     VALUES'
      
        '       (:HANDLE,:BENEFICIARIO,:TABRESPONSAVEL,:BANCO,:AGENCIA,:C' +
        'ONTACORRENTE,:DV,'
      
        '          :INCLUSAOUSUARIO,:INCLUSAODATA,:NAOPARCELAR,:TABINSTRU' +
        'CAOPARCELAMENTO,:NAOGERARDOCUMENTO,      '
      
        '          :NAOCOBRARTARIFA,:TABINSTRUCAOPARCELAMENTOPROX,:TABGER' +
        'ACAOREC,'
      
        '          :TABGERACAOPAG,:TIPODOCUMENTOREC,:TIPODOCUMENTOPAG,:CC' +
        'NOME,:CCCPFCNPJ)')
    Left = 88
    Top = 160
  end
  object Qr_UpContaFin: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SFN_CONTAFIN'
      '      SET BANCO=:BANCO,'
      '          AGENCIA=:AGENCIA,     '
      '    CONTACORRENTE=:CONTACORRENTE,'
      '         DV=:DV,'
      '         TABGERACAOREC=:TABGERACAOREC,'
      '         TABGERACAOPAG=:TABGERACAOPAG,'
      '         CCNOME=:CCNOME,'
      '         CCCPFCNPJ=:CCCPFCNPJ '
      '      WHERE HANDLE=:HANDLE')
    Left = 88
    Top = 208
  end
  object Qr_InsModulo: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO SAM_BENEFICIARIO_MOD'
      
        '      (HANDLE,BENEFICIARIO,MODULO,PRIMEIRAPARCELA,PARCELADIAS,CO' +
        'NTRATO,'
      
        '        DATAADESAO,DATACANCELAMENTO,MOTIVOCANCELAMENTO,CODIGOTAB' +
        'ELAPRC,'
      '        SEGUNDAPARCELA)'
      '      VALUES'
      
        '       :HANDLE,:BENEFICIARIO,:MODULO,:PRIMEIRAPARCELA,:PARCELADI' +
        'AS,:CONTRATO,'
      
        '       :DATAADESAO,:DATACANCELAMENTO,:MOTIVOCANCELAMENTO,:CODIGO' +
        'TABELAPRC,'
      '         :SEGUNDAPARCELA)')
    Left = 88
    Top = 256
  end
  object Qr_UpModulo: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO_MOD'
      '      SET'
      '         PRIMEIRAPARCELA=:PRIMEIRAPARCELA,'
      '         PARCELADIAS=:PARCELADIAS,'
      '         DATAADESAO=:DATAADESAO,'
      '         DATACANCELAMENTO=:DATACANCELAMENTO,'
      '         MOTIVOCANCELAMENTO=:MOTIVOCANCELAMENTO'
      '      WHERE HANDLE=:HANDLE')
    Left = 88
    Top = 312
  end
  object Qr_InsDoc: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO SAM_BENEFICIARIO_DOCENTREGUE'
      
        '            (HANDLE,BENEFICIARIO,CONTRATO,DATAENTREGA,DATAVALIDA' +
        'DE,TIPODOCUMENTO)'
      '      VALUES'
      
        '            '#39'(:HANDLE,:BENEFICIARIO,:CONTRATO,:DATAENTREGA,:DATA' +
        'VALIDADE,:TIPODOCUMENTO)'#39)
    Left = 88
    Top = 360
  end
  object Qr_UpDoc: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO_DOCENTREGUE'
      '         SET DATAENTREGA=:DATAENTREGA,'
      '             DATAVALIDADE=:DATAVALIDADE'
      '       WHERE HANDLE=:HANDLE')
    Left = 88
    Top = 408
  end
  object QrySaudepro2: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario_historico'
      '   set origem='#39'M'#39','
      '       beneficiarioorigem=:benefOrigem'
      'where beneficiario=:beneficiarioio'#39)
    Left = 88
    Top = 456
  end
  object QrySaudePro5: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario_historico'
      '    set motivocancelamento=31,'
      '        datacancelamento=:datacancelamento'
      'where beneficiario=:beneficiario')
    Left = 88
    Top = 504
  end
  object QrySaudePro3: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 88
    Top = 552
  end
  object QrySaudePro4: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario_mod_historico'
      '    set motivocancelamento=31,'
      '        datacancelamento=:datacancelamento,'
      '        DATAMOVIMENTO=:MOVIMENTO'
      'where beneficiariomod in'
      '('
      'select handle'
      ' from sam_beneficiario_mod'
      'where beneficiario=:beneficiario and contrato=:contrato'
      ')')
    Left = 88
    Top = 592
  end
  object QrySaudePro10: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 8
  end
  object QrySaudePro11: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 56
  end
  object QrySaudePro13: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 112
  end
  object QrySaudePro12: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 216
  end
  object QrySaudePro14: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 168
  end
  object Qr_Geral: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 152
    Top = 264
  end
  object Qr_InsSuspensao: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO SAM_BENEFICIARIO_SUSPENSAO'
      
        '      (HANDLE,BENEFICIARIO,DATAINICIAL,DATAFINAL,MOTIVO,INFORMAC' +
        'OES)'
      '      VALUES'
      
        '      (:HANDLE,:BENEFICIARIO,:DATAINICIAL,NULL,:MOTIVO,:INFORMAC' +
        'OES)')
    Left = 152
    Top = 312
  end
  object QrUpBalanceLine: TADOQuery
    Connection = DBSaude
    Parameters = <
      item
        Name = 'descricao'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'horainicial'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'horafinal'
        DataType = ftDateTime
        Value = Null
      end>
    SQL.Strings = (
      'Insert into migbalance_line_benef'
      '      (codigo,descricao,horainicial,horafinal)'
      '      values'
      '      (seq_bl.nextval,:descricao,:horainicial,:horafinal)')
    Left = 152
    Top = 360
  end
  object QrFindAnot: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'SELECT HANDLE,BENEFICIARIO,OBSERVACAO'
      '          FROM  SAM_BENEFICIARIO_ANOTADM'
      '      WHERE BENEFICIARIO=:BENEFICIARIO'
      '      ORDER BY HANDLE')
    Left = 152
    Top = 408
  end
  object QrComparaSusp: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'SELECT DATAINICIAL'
      '        FROM SAM_BENEFICIARIO_SUSPENSAO'
      '      WHERE BENEFICIARIO=:BENEFICIARIO AND'
      '            DATAINICIAL=:DATAINICIAL')
    Left = 152
    Top = 456
  end
  object QrSet: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'set current schema benner')
    Left = 152
    Top = 504
  end
  object QrFindFamiliaI: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      
        'SELECT B.MATRICULACASSI,B.HANDLE, F.HANDLE HFAMILIA, E.LOGRADOUR' +
        'O,E.NUMERO,E.COMPLEMENTO,E.BAIRRO,E.MUNICIPIO,E.ESTADO,E.CEP'
      '         FROM SOCPRO.SAM_BENEFICIARIO B'
      '         JOIN SOCPRO.SAM_FAMILIA F ON B.FAMILIA = F.HANDLE'
      
        '         JOIN SOCPRO.SAM_ENDERECO E ON B.ENDERECORESIDENCIAL = E' +
        '.HANDLE'
      '      WHERE B.MATRICULACASSI=:AFINIDADE AND'
      '            B.CONTRATO=:CONTRATO')
    Left = 152
    Top = 552
  end
  object QrySaudePro6: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_FAMILIA'
      '         SET DATACANCELAMENTO  =:datacancelamento,'
      '             MOTIVOCANCELAMENTO=31'
      '       WHERE HANDLE=:handle and contrato=:contrato')
    Left = 152
    Top = 600
  end
  object QrySaudePro7: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO'
      '         SET DATACANCELAMENTO =:datacancelamento,'
      '             MOTIVOCANCELAMENTO=31,'
      '             MATRICULACASSI =:matriculacassi'
      '       WHERE HANDLE=:handle and contrato=:contrato')
    Left = 216
    Top = 8
  end
  object QrySaudePro8: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO_MOD'
      '         SET DATACANCELAMENTO  =:datacancelamento,'
      '             MOTIVOCANCELAMENTO=31'
      '       WHERE BENEFICIARIO=:beneficiario and contrato=:contrato')
    Left = 216
    Top = 56
  end
  object QrySaudePro9: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO_CARTAOIDENTIF'
      '         SET DATACANCELAMENTO  =:datacancelamento'
      '       WHERE BENEFICIARIO=:beneficiario')
    Left = 216
    Top = 112
  end
  object QrDelHMigrado: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'delete from mighandlemigrado')
    Left = 216
    Top = 168
  end
  object QrHMigrado: TADOQuery
    Connection = DBSaude
    Parameters = <
      item
        Name = 'vhandle'
        DataType = ftInterface
        Value = Null
      end>
    SQL.Strings = (
      'select handle'
      '        from mighandlemigrado'
      '      where handle=:vhandle')
    Left = 216
    Top = 216
  end
  object QrInsHMigrado: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'insert into mighandlemigrado'
      '      (handle)'
      '      values'
      '      (:handle)')
    Left = 216
    Top = 264
  end
  object QrInsRecalculoMens: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO SAM_ROTINARECALCULOMENSALID'
      
        '(HANDLE,COMPETENCIAINICIAL,COMPETENCIAFINAL,DESCRICAO,BENEFICIAR' +
        'IO,TABRECALCULAR,'
      ' USUARIO,DATAINCLUSAO,SITUACAO,CODIGO,DATAROTINA)'
      'VALUES'
      
        '(:HANDLE,:COMPETENCIAINICIAL,:COMPETENCIAFINAL,:DESCRICAO,:BENEF' +
        'ICIARIO,4,'
      '  78,SYSDATE,'#39'A'#39',:CODIGO,SYSDATE)'
      '')
    Left = 216
    Top = 312
  end
  object QrInsHistMod: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'insert into sam_beneficiario_mod_historico'
      
        '(handle,beneficiariomod,dataativacao,datacancelamento,motivocanc' +
        'elamento,origem'
      ',datamovimentoativacao)'
      'values'
      
        '(:handle,:beneficiariomod,:dataativacao,:datacancelamento,:motiv' +
        'ocancelamento,:origem'
      ',:datamovimentoativacao)')
    Left = 216
    Top = 360
  end
  object QrUpNosNum: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_familia'
      '    set nossonumeroimportacao=null,'
      '        motivobloqueio=null,'
      '        databloqueio=null'
      'where handle=:handle')
    Left = 216
    Top = 408
  end
  object QrUpModHis: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario_mod_historico'
      '  set origem='#39'M'#39','
      '      beneficiariomodorigem=(select min(handle) from '
      '                               sam_beneficiario_mod'
      '                              where beneficiario=:beneforigem)'
      'where beneficiariomod in'
      '('
      'select m.handle'
      '  from sam_beneficiario_mod_historico h'
      '       join sam_beneficiario_mod m on m.handle=h.beneficiariomod'
      ' where m.beneficiario=:benefDestino'
      ')')
    Left = 216
    Top = 456
  end
  object QrMotBloq: TADOQuery
    Connection = DBSaude
    Parameters = <
      item
        Name = 'databloqueio'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'handle'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'update sam_familia'
      '        set motivobloqueio=9,'
      '            databloqueio=:databloqueio'
      '      where handle=:handle')
    Left = 216
    Top = 504
  end
  object QrLimitacoes: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 280
    Top = 8
  end
  object QrInsLimitacao: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'insert into sam_beneficiario_limitacao'
      '(handle,datainicial,datafinal,periodocontagem,qtdlimite,'
      ' tipolimitacao,limitacao,contrato,tabtipolimite,beneficiario)'
      ' values'
      '(:handle,:datainicial,:datafinal,1,1,'#39'A'#39',701,24,1,:beneficiario)')
    Left = 280
    Top = 64
  end
  object QrUpNosNumI: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_familia'
      '          set nossonumeroimportacao=null,'
      '              motivobloqueio=null,'
      '              databloqueio=null'
      '      where familia=:familia')
    Left = 280
    Top = 112
  end
  object QrInsFatLancMod: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'insert into sfn_fatura_lanc_mod'
      
        '(handle,beneficiario,parcela,beneficiariomod,competencia,tabtipo' +
        ',parcelacomissao,diacobranca,diacobrancaoriginal)'
      'values'
      
        '(:handle,:beneficiario,1,:beneficiariomod,:competencia,4,1,:diac' +
        'obranca,:diacobranca)')
    Left = 280
    Top = 168
  end
  object QrMinHandleMod: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'select SEQ_SFN0008.nextval HANDLE from DUAL')
    Left = 280
    Top = 216
  end
  object QrUpdateModHist: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario_mod_historico'
      '  set datacancelamento=:datacancelamento,'
      '      motivocancelamento=:motivocancelamento,'
      '      datamovimento     =:datamovimento'
      'where handle=:handle      ')
    Left = 280
    Top = 264
  end
  object QrMaxHandleHist: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'SELECT MAX(HANDLE) HANDLE'
      '        FROM SAM_BENEFICIARIO_MOD_HISTORICO'
      '       WHERE BENEFICIARIOMOD=:MODULO')
    Left = 280
    Top = 312
  end
  object QrMaxMod_hist: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 280
    Top = 360
  end
  object QrySaudePro15: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'SELECT AA.HANDLE'
      '      FROM SAM_BENEFICIARIO         BEN'
      
        '      JOIN SAM_CONTRATO             COT ON COT.HANDLE = BEN.CONT' +
        'RATO'
      
        '      JOIN SAM_CONTRATO_MOD         CMO ON COT.HANDLE = CMO.CONT' +
        'RATO'
      '      JOIN SAM_BENEFICIARIO_MOD     AA ON CMO.HANDLE = AA.MODULO'
      '      WHERE BEN.HANDLE=:HANDLE'
      '            AND CMO.OBRIGATORIO='#39'S'#39
      '            AND CMO.DATACANCELAMENTO IS NULL'
      '            AND AA.BENEFICIARIO=:HANDLE   '
      '')
    Left = 280
    Top = 408
  end
  object QrySaudePro16: TADOQuery
    Connection = DBSaude
    Parameters = <
      item
        Name = 'HANDLE'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select contrato from sam_beneficiario_mod where handle in '
      '( select bmh.beneficiariomodorigem '
      '     from sam_beneficiario                  ben  '
      
        'join sam_beneficiario_mod              bmo on ben.handle = bmo.b' +
        'eneficiario'
      
        'join sam_beneficiario_mod_historico    bmh on bmo.handle = bmh.b' +
        'eneficiariomod  '
      '   where ben.handle=:HANDLE)')
    Left = 280
    Top = 456
  end
  object QrySaudePro17: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO'
      '         SET NAOTEMCARENCIA = '#39'S'#39
      '       WHERE HANDLE=:handle')
    Left = 280
    Top = 504
  end
  object QrCBO: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'UPDATE SAM_BENEFICIARIO'
      '      SET CBO =:CBO'
      '      WHERE HANDLE =:HANDLE')
    Left = 352
    Top = 64
  end
  object QrAgencia: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'insert into sfn_agencia'
      '      (handle,agencia,dv)'
      '      values'
      '      (:handle,:agencia,:dv)')
    Left = 352
    Top = 8
  end
  object QrGeral2: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 112
  end
  object QrySaudePro18: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'update sam_beneficiario set databloqueio = null'#39
      '      motivobloqueio = null where handle=:handle')
    Left = 352
    Top = 168
  end
  object SP_HISTORICO: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'INSERT_BENEFICIARIO_HISTORICO'
    Parameters = <>
    Left = 488
    Top = 16
  end
  object SP_COMPLEMENTO: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'UPDATESCOMP_BALANCE_LINE'
    Parameters = <>
    Left = 488
    Top = 72
  end
  object SP_Matricula: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'INSERTUPDATE_MATRICULA'
    Parameters = <
      item
        Name = 'NHANDLE'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
      end
      item
        Name = 'CNOME'
        Attributes = [paNullable]
        DataType = ftString
      end
      item
        Name = 'CSEXO'
        Attributes = [paNullable]
        DataType = ftString
      end
      item
        Name = 'NCPF'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
      end
      item
        Name = 'CDATANASC'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = 'CDATACAD'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = 'CNOMEMAE'
        Attributes = [paNullable]
        DataType = ftString
      end
      item
        Name = 'CTIPO'
        Attributes = [paNullable]
        DataType = ftString
      end>
    Left = 488
    Top = 136
  end
  object SP_Atualizar_Data_adesao: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'CHANGE_DATE'
    Parameters = <>
    Left = 488
    Top = 192
  end
  object SP_Cartoes: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'ATUALIZAR_CARTOES_DIFF'
    Parameters = <>
    Left = 488
    Top = 304
  end
  object SP_ESF: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'MIGRACAO_ESF_E_PRIORITARIA'
    Parameters = <>
    Left = 488
    Top = 368
  end
  object SP_ATUALIZAR_RG: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'ATUALIZAR_RG'
    Parameters = <>
    Left = 488
    Top = 480
  end
  object SP_UpdateMatriculaInternet: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'ATUALIZAR_CAMPOS_MATRICULA_NEW'
    Parameters = <>
    Left = 488
    Top = 536
  end
  object SP_UpdateMatriculaDependentes: TADOStoredProc
    Connection = DBSaude
    Parameters = <>
    Left = 488
    Top = 584
  end
  object SPCarga_CSC: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'CARGA_CSC'
    Parameters = <>
    Left = 576
    Top = 16
  end
  object ATUALIZAR_RSP_LEGAL: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'ATUALIZAR_CAMPOS_RESP_LEGAL'
    Parameters = <>
    Left = 576
    Top = 80
  end
  object QrTESTE: TADOQuery
    Connection = DBSaude
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO TESTE_CONTROLM'
      '      (valor,procedure)'
      '      VALUES'
      '      (:valor,:procedure)')
    Left = 352
    Top = 216
  end
  object QrGeralAux: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 312
  end
  object QrySaudePro19: TADOQuery
    Parameters = <>
    Left = 352
    Top = 264
  end
  object QrCODOCUP: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 352
  end
  object qAux: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 400
  end
  object qUpModuloPensionista: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 456
  end
  object Qr_handle: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 512
  end
  object QrMatriculaBen: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 352
    Top = 560
  end
  object qAuxFam: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 224
    Top = 560
  end
  object Qr_handleFam: TADOQuery
    Connection = DBSaude
    Parameters = <>
    Left = 280
    Top = 560
  end
  object SP_DataBalanceLine: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'DATA_DO_BALANCE_LINE'
    Parameters = <
      item
        Name = 'DATA'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Value = Null
      end>
    Left = 488
    Top = 248
  end
  object SP_SECAO: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'ATUALIZARSECAOFAMILIA'
    Parameters = <
      item
        Name = 'P_MIGRACAO'
        Attributes = [paNullable]
        DataType = ftString
      end>
    Left = 576
    Top = 144
  end
  object SP_AJUSTARMIGRACOES: TADOStoredProc
    Connection = DBSaude
    ProcedureName = 'AJUSTARMIGRACOES'
    Parameters = <
      item
        Name = 'P_USUARIO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
      end>
    Left = 584
    Top = 208
  end
end
