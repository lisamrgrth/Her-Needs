from django.db import models

class Product(models.Model):
    product_name = models.CharField(max_length=255)
    price = models.IntegerField()
    description = models.TextField()
    stock = models.IntegerField()
    category = models.CharField(max_length=255)
    size = models.CharField(max_length=255)

    def __str__(self):
        return self.name