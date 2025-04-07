CREATE DATABASE IF NOT EXISTS gestao_escolar;

USE gestao_escolar;

CREATE TABLE IF NOT EXISTS Endereco(

	id_endereco int unsigned not null auto_increment,
    bairro varchar(100) not null,
    rua varchar(50) not null,
    ciadade varchar(100) not null,
    
    primary key(id_endereco)

);


CREATE TABLE IF NOT EXISTS Telefone(
	
    id_telefone int unsigned not null auto_increment, 
    numero varchar(10) not null default '',
    
    primary key(id_telefone)
    
);

CREATE TABLE IF NOT EXISTS Turma(

	id_turma int unsigned not null auto_increment, 
    nome_turma varchar(15) not null default '', 
    ano varchar(5) not null default '',
    
    primary key(id_turma)
    
    );

CREATE TABLE IF NOT EXISTS Nota(

	id_nota int unsigned not null auto_increment, 
    nota double not null default 0, 
    data_reg date not null,
    
    primary key(id_nota)
    
    );

CREATE TABLE IF NOT EXISTS Registro(

	id_registro int unsigned not null auto_increment, 
    data_registro date not null, 
    presente bool default false,
    
    primary key(id_registro)
    
    );

CREATE TABLE IF NOT EXISTS Comunicado(

	id_comunicado int unsigned not null auto_increment, 
    titulo varchar(250) not null, 
    mensagem text not null, 
    data_envio date not null,
    
    primary key(id_comunicado)
    
    );
    
CREATE TABLE IF NOT EXISTS Aluno(

	id_aluno int unsigned not null auto_increment, 
    nome_aluno varchar(250) not null, 
    data_nascimento date not null, 
    email_aluno varchar(100) not null default '' unique, 
    telefone_aluno_fk int unsigned not null, 
    endereco_fk int unsigned not null, 
    id_turma_fk int unsigned not null, 
    id_nota_fk int unsigned, 
    id_registro_fk int unsigned not null, 
    id_comunicado_fk int unsigned not null,
    
    primary key(id_aluno),
    
    constraint relations_fk
		foreign key(telefone_aluno_fk) references Telefone(id_telefone),
        foreign key(endereco_fk) references Endereco(id_endereco),
        foreign key(id_turma_fk) references Turma(id_turma),
        foreign key(id_nota_fk) references Nota(id_nota),
        foreign key(id_registro_fk) references Registro(id_registro),
        foreign key(id_comunicado_fk) references Comunicado(id_comunicado)
        
    );
    
CREATE TABLE IF NOT EXISTS Professor(

	id_professor int unsigned not null auto_increment, 
    nome_prof varchar(250) not null, 
    email_prof varchar(100) not null default '' unique, 
    telefone_prof_fk int unsigned not null, 
    especialidade varchar(200) not null default '',
  
    primary key(id_professor),
    
    constraint telefone_fk
		foreign key(telefone_prof_fk) references Telefone(id_telefone)
     );
     
alter table Professor add column  endereco_prof_fk int unsigned not null;     
alter table Professor add constraint endereco_fk foreign key( endereco_prof_fk ) references Endereco(id_endereco);


CREATE TABLE IF NOT EXISTS Disciplina(

	id_disciplina int unsigned not null auto_increment, 
    nome_disc varchar(100) not null, 
    descricao text not null, 
    id_professor_fk int unsigned not null,
    
    primary key(id_disciplina),
    
    constraint professor_fk
		foreign key(id_professor_fk) references Professor(id_professor)
        
    );

CREATE TABLE IF NOT EXISTS NotaDisciplina(

	id_nota_disc int unsigned not null auto_increment, 
    disciplina int unsigned not null, 
    nota int unsigned not null,
    
    primary key(id_nota_disc),
    
    constraint nota_disc_fk
		foreign key(disciplina) references Disciplina(id_disciplina),
        foreign key(nota) references Nota(id_nota)
    );

CREATE TABLE IF NOT EXISTS ProfessorTurma(

	id_prof_turma int unsigned not null auto_increment, 
    professor int unsigned not null, 
    turma int unsigned not null,
    
    primary key(id_prof_turma),
    constraint professor_turma_fk
		foreign key(professor) references Professor(id_professor),
        foreign key(turma) references  Turma(id_turma)
        
	);

    
CREATE TABLE IF NOT EXISTS Academico(

	id_aluno int unsigned not null, 
    id_disciplina int unsigned not null,
    
    primary key(id_aluno, id_disciplina),
    
    constraint aluno_disciplina_fk
		foreign key(id_aluno) references Aluno(id_aluno),
        foreign key(id_disciplina) references Disciplina(id_disciplina)
);    
	



	