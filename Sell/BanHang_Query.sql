use Sell
go--***********************************************************************************************************************************
create function  DiscountHome() 
returns @bang table(id int ,
			  ten nvarchar(100),
			  gia int ,
			  soluongconlai int ,
			  anh1 nvarchar(max),
			  sosao int ,
			  phantram int )
as
begin
insert into @bang select Product.id,Product.ten,Product.gia,Product.SoLuongCoSan as soluongconlai,
						ImageProduct.anh1,Evaluate.sosao, Discount.phantram 
	from Product 
	inner join ImageProduct on Product.ImageProduct = ImageProduct.id
	inner join categoryProduct on Product.categoryProduct= categoryProduct.id
	inner join ThemeProduct on categoryProduct.Theme = ThemeProduct.id
	left join (select sum(sosao)as sosao, Product  from Evaluate group by Product) as Evaluate on Product.id = Evaluate.Product
	left join ProductUsingDiscount on ProductUsingDiscount.Product = Product.id
	left join Discount on Discount.id=ProductUsingDiscount.Discount
	where Discount.phantram >10 and Product.Isdelete=0
	order by Discount.phantram asc
return 
end
go--***********************************************************************************************************************************
create function  DiscountHomeThemeProduct(@idtheme int) 
returns @bang table(id int ,
			  Theme int ,
			  caterory int,
			  ten nvarchar(100),
			  gia int ,
			  soluongconlai int ,
			  anh1 nvarchar(max),
			  sosao int default 0,
			  phantram int default 0)
as
begin
insert into @bang select Product.id,ThemeProduct.id as theme, categoryProduct.id as caterory,Product.ten,Product.gia,Product.SoLuongCoSan as soluongconlai, ImageProduct.anh1, ISNULL(Evaluate.sosao, 0 ) , ISNULL(Discount.phantram, 0 )
	from Product 
	inner join ImageProduct on Product.ImageProduct = ImageProduct.id
	inner join categoryProduct on Product.categoryProduct= categoryProduct.id
	inner join ThemeProduct on categoryProduct.Theme = ThemeProduct.id
	left join (select sum(sosao)as sosao, Product  from Evaluate group by Product) as Evaluate on Product.id = Evaluate.Product
	left join ProductUsingDiscount on ProductUsingDiscount.Product = Product.id
	left join Discount on Discount.id=ProductUsingDiscount.Discount
	where Product.Isdelete=0  and ThemeProduct.id=@idtheme
return 
end
go--***********************************************************************************************************************************
create function  DiscountHomeCateProduct(@idtheme int) 
returns @bang table(id int ,
			  Theme int ,
			  caterory int,
			  ten nvarchar(100),
			  gia int ,
			  soluongconlai int ,
			  anh1 nvarchar(max),
			  sosao int default 0,
			  phantram int default 0)
as
begin
insert into @bang select Product.id,ThemeProduct.id as theme, categoryProduct.id as caterory,Product.ten,Product.gia,Product.SoLuongCoSan as soluongconlai, ImageProduct.anh1, ISNULL(Evaluate.sosao, 0 ) , ISNULL(Discount.phantram, 0 )
	from Product 
	inner join ImageProduct on Product.ImageProduct = ImageProduct.id
	inner join categoryProduct on Product.categoryProduct= categoryProduct.id
	inner join ThemeProduct on categoryProduct.Theme = ThemeProduct.id
	left join (select sum(sosao)as sosao, Product  from Evaluate group by Product) as Evaluate on Product.id = Evaluate.Product
	left join ProductUsingDiscount on ProductUsingDiscount.Product = Product.id
	left join Discount on Discount.id=ProductUsingDiscount.Discount
	where Product.Isdelete=0  and categoryProduct.id=@idtheme
return 
end
go--***********************************************************************************************************************************
create function  DiscountHomeStringProduct(@idtheme nvarchar(100)) 
returns @bang table(id int ,
			  Theme int ,
			  caterory int,
			  ten nvarchar(100),
			  gia int ,
			  soluongconlai int ,
			  anh1 nvarchar(max),
			  sosao int default 0,
			  phantram int default 0)
as
begin
insert into @bang select Product.id,ThemeProduct.id as theme, categoryProduct.id as caterory,Product.ten,Product.gia,Product.SoLuongCoSan as soluongconlai, ImageProduct.anh1, ISNULL(Evaluate.sosao, 0 ) , ISNULL(Discount.phantram, 0 )
	from Product 
	inner join ImageProduct on Product.ImageProduct = ImageProduct.id
	inner join categoryProduct on Product.categoryProduct= categoryProduct.id
	inner join ThemeProduct on categoryProduct.Theme = ThemeProduct.id
	left join (select sum(sosao)as sosao, Product  from Evaluate group by Product) as Evaluate on Product.id = Evaluate.Product
	left join ProductUsingDiscount on ProductUsingDiscount.Product = Product.id
	left join Discount on Discount.id=ProductUsingDiscount.Discount
	where Product.Isdelete=0  and Product.ten like '%'+@idtheme+'%'
return 
end
go--***********************************************************************************************************
create function F_GetAllEvaluate()
returns @bang table(

)