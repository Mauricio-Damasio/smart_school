from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.


def home(request):
  return render(request,'index.html')

def cadastrar_aluno(request):
  return render(request, 'aluno_form.html')

def detalhar_aluno(request):
  return render(request,'aluno_detail.html')

def editar_aluno(request):
  return render(request,'aluno_editar.html')

def deletar_aluno(request):
  return render(request,'aluno_confirm_delete.html')