# Sistema de Gestão Escolar

## Descrição

      O Sistema de Gestão Escolar é uma aplicação desenvolvida com Django para facilitar o gerenciamento de alunos, professores, notas e frequência escolar. Ele permite que administração escolar e professores tenham controle eficiente sobre os dados acadêmicos.

## Requisitos Funcionais (RF)

### Cadastro de Alunos, Professores e Turmas:

       O sistema deve permitir o cadastro completo de alunos, professores e turmas, incluindo informações pessoais (como nome, data de nascimento, etc.), as turmas que os alunos frequentam e as matérias que os professores ministram.

### Registro de Notas e Geração de Boletins:

       O sistema deve possibilitar o registro das notas dos alunos em cada disciplina, permitindo que os professores insiram as notas durante o período letivo. A partir dessas notas, o sistema deve gerar boletins escolares automaticamente, com os   dados de desempenho do aluno.

### Controle de Frequência dos Alunos:

       O sistema deve registrar a presença ou ausência dos alunos nas aulas, permitindo que os professores atualizem o status de frequência (presente/ausente) em tempo real, além de permitir a visualização do histórico de frequência dos alunos.

### Emissão de Relatórios Acadêmicos:

       O sistema deve gerar relatórios detalhados sobre o desempenho acadêmico dos alunos, incluindo informações sobre suas    notas, frequências e desempenho ao longo do ano letivo. Esses relatórios podem ser utilizados para análise por professores e administradores.

### Envio de Comunicados para Alunos e Responsáveis:

       O sistema deve permitir o envio de comunicados para os alunos e seus responsáveis, seja por meio de e-mail ou outras  formas de comunicação, para avisos sobre notas, frequência, eventos ou outros assuntos relacionados à vida escolar do aluno.

## Requisitos Não Funcionais (RNF)

### Segurança:

        O sistema deve garantir a proteção dos dados acadêmicos dos alunos, professores e funcionários.

        Deve haver autenticação e autorização para acesso às informações, permitindo diferentes níveis de permissão (ex.: professores podem registrar notas, mas alunos não podem modificar seus boletins).

        Os dados devem ser armazenados de forma segura, utilizando criptografia para senhas e informações sensíveis.

        Implementação de logs de atividades para monitoramento de acessos e alterações nos dados.

### Acessibilidade e Usabilidade:

        A interface do sistema deve ser intuitiva e de fácil uso para professores, alunos e funcionários administrativos.

        Compatibilidade com dispositivos móveis e diferentes navegadores.

        Suporte para acessibilidade (ex.: contraste para pessoas com deficiência visual, navegação via teclado, suporte a leitores de tela).

        As telas devem seguir boas práticas de UI/UX para facilitar a navegação e interação.

### Escalabilidade:

        O sistema deve ser capaz de suportar múltiplas escolas, turmas e usuários simultâneos sem perda de desempenho.

        A arquitetura do banco de dados deve permitir crescimento, evitando gargalos no desempenho conforme o número de usuários aumenta.

        O sistema deve ser modular, possibilitando futuras expansões, como integração com APIs externas e novos módulos de funcionalidades.

### Desempenho e Eficiência:

        O tempo de resposta das páginas e operações deve ser otimizado para garantir boa experiência do usuário.

        Consultas ao banco de dados devem ser eficientes, utilizando índices e otimizações para evitar lentidão.

        O sistema deve ser capaz de suportar um grande número de requisições simultâneas sem degradação significativa de desempenho.

### Manutenção e Atualizações:

        O código deve seguir boas práticas de desenvolvimento, como organização modular e documentação clara para facilitar futuras manutenções.

        Deve ser possível atualizar o sistema sem comprometer os dados existentes ou causar interrupções prolongadas no serviço.

        Uso de logs e notificações para rastrear erros e facilitar a depuração de problemas.

### Backup e Recuperação de Dados:

        O sistema deve ter um mecanismo automático de backup dos dados para evitar perdas em caso de falhas.

        Deve permitir a restauração de dados em caso de corrupção ou exclusão acidental.

        Os backups devem ser armazenados de forma segura e criptografada.

### Disponibilidade e Confiabilidade:

        O sistema deve garantir alta disponibilidade, minimizando períodos de inatividade.

        Implementação de redundância para evitar perda de dados em caso de falha no servidor.

## Normalização

### 1-Dependências Funcionais

      1. id_aluno -> nome_aluno, data_nascimento, email_aluno, telefone_aluno, endereco;
      2. id_professor -> nome_prof, email_prof, telefone_prof, especialidade, endereco_prof;
      3. id_turma -> nome_turma, ano, professor;
      4. id_disciplina -> nome_disc, descricao;
      5. id_nota -> nota, disciplina, data_reg;
      6. id_registro ->data_registro, presente;
      7. id_comunicado -> titulo, mensagem, data_envio;
      8. id_aluno -> id_turma, "porque conhecendo um aluno, saberemos a turma em que ele pertence";
      9. id_aluno -> nome_turma, ano, professor, "por transitividade";
      10. id_disciplina -> id_professor, "porque conhecendo uma disciplina, conheceremos o professor que ministra a mesma";
      11. id_disciplina -> nome_prof, email_prof, telefone_prof, especialidade, endereco_prof, "por transitividade";
      12. id_aluno -> id_nota, "porque conhecendo um aluno, saberemos as suas notas";
      13. id_aluno -> nota, disciplina, data_reg,  "por transitividade";
      14. id_aluno -> id_registro, "porque conhecendo um aluno, conheceremos os seus registros";
      15. id_aluno -> data_registro, presente, "por transitividade";
      16. id_aluno -> id_comunicado, "porque conhecendo um aluno, conheceremos os seus comunicados";
      17. id_aluno -> titulo, mensagem, data_envio, "por transitividade";
      18. id_aluno, id_disciplina ->

        (nome_aluno, data_nascimento, email_aluno, telefone_aluno, endereco, nome_disc, descricao, id_turma, nome_turma, ano, professor, id_professor, nome_prof, email_prof, telefone_prof, especialidade, endereco_prof, id_nota, nota, disciplina, data_reg, id_registro, data, presente, id_comunicado, titulo, mensagem, data_envio);

### 2. A chave Candidata:

     -> (id_aluno, id_disciplina);

### 3. A chave Primária:

     -> (id_aluno, id_disciplina);

### 4. Tabela Universal

     Academico (id_aluno, id_disciplina, nome_aluno, data_nascimento, email_aluno, telefone_aluno, endereco, nome_disc, descricao,  id_turma, nome_turma, ano, professor, id_professor, nome_prof, email_prof, telefone_prof, especialidade, endereco_prof, id_nota, nota, disciplina, data_reg, id_registro, data_registro, presente, id_comunicado, titulo, mensagem, data_envio);

### 1FN:

    Academico (id_aluno, id_disciplina, nome_aluno, data_nascimento, email_aluno, telefone_aluno_fk, endereco_fk, nome_disc, descricao, id_turma, nome_turma, ano, professor_fk,
                 id_professor, nome_prof, email_prof, telefone_prof_fk, especialidade, endereco_prof_fk, id_nota, nota, disciplina_fk, data_reg, id_registro, data_registro, presente, id_comunicado,
                 titulo, mensagem, data_envio);

    Telefone (id_telefone, numero);

    NotaDisciplina(id_nota_disc, disciplina, nota);

    ProfessorTurma(id_prof_turma, professor, turma);

    Endereco (id_endereco, bairro, rua, cidade);

### 2FN:

    Academico (id_aluno, id_disciplina, nome_aluno, data_nascimento, email_aluno, telefone_aluno_fk, endereco_fk, nome_disc, descricao, id_turma, nome_turma, ano, professor_fk, id_professor, nome_prof, email_prof, telefone_prof_fk, especialidade, endereco_prof_fk, id_nota, nota, disciplina_fk, data_reg, id_registro, data_registro, presente, id_comunicado, titulo, mensagem, data_envio);

    Aluno (id_aluno, nome_aluno, data_nascimento, email_aluno, telefone_aluno_fk, endereco_fk, id_turma, nome_turma, ano, professor_fk, id_nota, nota, disciplina_fk, data_reg, id_registro, data_registro, presente, id_comunicado, titulo, mensagem, data_envio );

    Disciplina (id_disciplina, nome_disc, descricao, id_professor, nome_prof, email_prof, telefone_prof_fk, especialidade, endereco_prof_fk);

    Telefone (id_telefone, numero);

    NotaDisciplina(id_nota_disc, disciplina, nota);

    ProfessorTurma(id_prof_turma, professor, turma);

    Endereco (id_endereco, bairro, rua, cidade);

### 3FN:

    Academico (id_aluno, id_disciplina, nome_aluno, data_nascimento, email_aluno, telefone_aluno_fk, endereco_fk, nome_disc, descricao, id_turma, nome_turma, ano, professor_fk, id_professor, nome_prof, email_prof, telefone_prof_fk, especialidade, endereco_prof_fk, id_nota, nota, disciplina_fk, data_reg, id_registro, data_registro, presente, id_comunicado, titulo, mensagem, data_envio);

    Aluno (id_aluno, nome_aluno, data_nascimento, email_aluno, telefone_aluno_fk, endereco_fk, id_turma_fk, id_nota_fk, id_registro_fk, id_comunicado_fk);

    Disciplina (id_disciplina, nome_disc, descricao, id_professor_fk);

    Professor (id_professor, nome_prof, email_prof, telefone_prof_fk, especialidade, endereco_prof_fk,);

    Turma (id_turma, nome_turma, ano, professor_fk);

    Nota (id_nota, nota, disciplina_fk, data_reg);

    Registro (id_registro, data_registro, presente);

    Comunicado (id_comunicado, titulo, mensagem, data_envio);

    Telefone (id_telefone, numero);

    NotaDisciplina(id_nota_disc, disciplina, nota);

    ProfessorTurma(id_prof_turma, professor, turma);

    Endereco (id_endereco, bairro, rua, cidade);
