from django.shortcuts import render

def show_main(request):
    context = {
        'name': 'Lisa Margaretha Esron Tobing',
        'class': 'PBP B',
        'price': 50000
    }

    return render(request, "main.html", context)
# Create your views here.
