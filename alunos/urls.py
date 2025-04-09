from django.urls import path
from .import views

urlpatterns = [
    
    path('', views.AlunoIndexView, name= "index-alunuo"),
    path('alunos/', views.alunosListView, name="alunos"),
    path('alunos-efectivos/', views.alunosEfectivos, name="alunos-efectivos"),
    path('aluno-novo/', views.alunoNewView, name="aluno-novo"),
    path('<int:id>/deletar', views.deletarAluno, name="aluno-deletar"),
    path('<int:id>/alterar', views.alterarAluno, name="alterar-aluno")
    
]
