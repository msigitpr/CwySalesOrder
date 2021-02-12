from django.db import models

class Customer(models.Model):
    firstName = models.CharField("First name", max_length=255, blank = True, null = True)
    lastName = models.CharField("Last name", max_length=255, blank = True, null = True)
    email = models.EmailField()
    phone = models.CharField(max_length=20, blank = True, null = True)
    address = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)

    def __str__(self):
        return self.firstName

class Tecnician(models.Model):
    firstName = models.CharField("First name", max_length=255, blank = True, null = True)
    lastName = models.CharField("Last name", max_length=255, blank = True, null = True)
    email = models.EmailField()
    phone = models.CharField(max_length=20, blank = True, null = True)
    address = models.TextField(blank=True, null=True)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)

    def __str__(self):
        return self.firstName

class ProductGroup(models.Model):
    name = models.CharField("Product Group Name", max_length=255, blank = True, null = True)

    def __str__(self):
        return self.name

class Products(models.Model):
    groupId = models.ForeignKey(ProductGroup, on_delete=models.CASCADE, null=True)
    name = models.CharField("Product Name", max_length=255, blank = True, null = True)
    sku = models.CharField("Product SKU", max_length=255, blank = True, null = True)
    price = models.DecimalField(max_digits=8, decimal_places=0)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)

    def __str__(self):
        return self.name

class Orders(models.Model):
    def increment_invoice_number():
        last_invoice = Orders.objects.all().order_by('id').last()
        if not last_invoice:
            return 'INV001'
        order_no = last_invoice.orderNo
        invoice_int = int(order_no.split('INV00')[-1])
        new_invoice_int = invoice_int + 1
        new_order_no = 'INV00' + str(new_invoice_int)
        return new_order_no
        
    orderNo = models.CharField("Order Number", max_length=255, default=increment_invoice_number)
    custId = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    promotionCode = models.CharField("Promotion Code", max_length=10, blank=True, null=True)
    totalPrice = models.DecimalField(max_digits=8, decimal_places=0)
    status = models.IntegerField(default=1)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)

    def __str__(self):
        return self.orderNo

class OrderDetails(models.Model):
    orderId = models.ForeignKey(Orders, on_delete=models.CASCADE, null=True)
    productId = models.ForeignKey(Products, on_delete=models.CASCADE, null=True)
    price = models.DecimalField(max_digits=8, decimal_places=0, default=0)
    quantity = models.IntegerField(default=1)
    technicianId = models.ForeignKey(Tecnician, on_delete=models.CASCADE, null=True)
    installationDate = models.DateTimeField("Installation Date", null=True)
    unitSerialNo = models.CharField("Unit Serial No", max_length=20, blank = True, null = True)
    status = models.IntegerField(default=1)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)
    
    def __str__(self):
        return self.orderId

class promotionCode(models.Model):
    class PromoType(models.TextChoices):
        UNIT = 'Unit',
        QTY = 'Quantity'

    code = models.CharField("Promotion Code", max_length=20, blank = True, null = True)
    product = models.ForeignKey(Products, on_delete=models.CASCADE, null=True)
    promoType = models.CharField(
        max_length=8,
        choices=PromoType.choices,
        default=PromoType.UNIT,
    )
    minValue = models.IntegerField(default=0)
    amount = models.DecimalField("Amount in percent",max_digits=8, decimal_places=0)
    status = models.IntegerField(default=1)
    createdAt = models.DateTimeField("Created At", auto_now_add=True)

    def __str__(self):
        return self.code