from django.shortcuts import render

def show_main(request):
    context = {
        'app': "herNeeds",
        'name': 'Lisa Margaretha Esron Tobing',
        'class': 'PBP B',
    }

    return render(request, "main.html", context)
# Create your views here.
