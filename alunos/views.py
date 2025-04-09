from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

# --- General views --- #

def AlunoIndexView(request):
  return render(request, 'alunos/index_aluno.html')

def alunosListView(request):
  return render(request, 'alunos/alunos.html')

def alunosEfectivos(request):
  return render(request,  'alunos/alunos_efectivos.html')

def alunoNewView(request):
  return render(request, 'alunos/aluno_novo.html')

def deletarAluno(request,id):
  return render(request, 'alunos/aluno_delete.html',{"id":id})

def alterarAluno(request,id):
  return render(request, 'alunos/aluno_alterar.html',  {"id": id})