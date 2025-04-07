from django.contrib import admin
from django.urls import path
from .views import home,cadastrar_aluno,detalhar_aluno,editar_aluno,deletar_aluno


urlpatterns = [
    path('', home),
    path('aluno/novo/',cadastrar_aluno),
    path('aluno/id/',detalhar_aluno),
    path('aluno/id/editar/',editar_aluno),
    path('aluno/id/excluir/',deletar_aluno)
]
