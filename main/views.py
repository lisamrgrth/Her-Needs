from django.shortcuts import render

def show_main(request):
    context = {
        'name': 'Lisa Margaretha Esron Tobing',
        'class': 'PBP B',
        'product_name': 'Korean Fashion Cardigan Knitwear',
        'price': 75000,
        'description': 'Available in Red',
        'stock' : '80',
        'category' : 'Cardigan Wanita',
        'size': 'Oversize' 
    }

    return render(request, "main.html", context)
# Create your views here.
