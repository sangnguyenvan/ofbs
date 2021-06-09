USE [OFBS]
GO
/****** Object:  Table [dbo].[combos]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[combos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [ntext] NOT NULL,
	[price] [float] NOT NULL,
	[restaurant_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
 CONSTRAINT [PK_combos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_combo]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_combo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[combo_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
 CONSTRAINT [PK_dish_combo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dishes]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dishes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [ntext] NOT NULL,
	[price] [float] NOT NULL,
	[restaurant_id] [int] NOT NULL,
	[menu_category_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
 CONSTRAINT [PK_dishes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbacks]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbacks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[feedback_content] [nvarchar](max) NOT NULL,
	[feedback_date] [datetime] NOT NULL,
	[rate] [float] NOT NULL,
	[customer_id] [int] NOT NULL,
	[restaurant_id] [int] NOT NULL,
 CONSTRAINT [PK_feedbacks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_types]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_type] [varchar](255) NOT NULL,
 CONSTRAINT [PK_image_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [varbinary](max) NOT NULL,
	[user_id] [int] NULL,
	[dish_id] [int] NULL,
	[service_id] [int] NULL,
	[combo_id] [int] NULL,
	[restaurant_id] [int] NULL,
	[promotion_id] [int] NULL,
	[type_id] [int] NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu_categories]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_menu_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[combo_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[time] [nvarchar](50) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[restaurant_id] [int] NOT NULL,
	[promotion_id] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotions]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotions](
	[id] [int] NOT NULL,
	[restaurant_id] [int] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[discount_percentage] [smallmoney] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
 CONSTRAINT [PK_promotions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provider_restaurants]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider_restaurants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[provider_id] [int] NOT NULL,
	[province] [nvarchar](50) NOT NULL,
	[district] [nvarchar](50) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[restaurant_name] [nvarchar](255) NOT NULL,
	[status_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[size] [int] NULL,
	[provider_type_id] [int] NOT NULL,
	[business_license_id] [varchar](255) NOT NULL,
 CONSTRAINT [PK__provider__3213E83F72B0D42E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provider_types]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_provider_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[status_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[restaurant_id] [int] NOT NULL,
 CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/9/2021 12:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone_login] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone_number] [varchar](50) NOT NULL,
	[gender] [bit] NULL,
	[date_of_birth] [date] NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[status_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[last_modified_date] [datetime] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[combos]  WITH CHECK ADD  CONSTRAINT [fk_combo_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[combos] CHECK CONSTRAINT [fk_combo_restaurant]
GO
ALTER TABLE [dbo].[combos]  WITH CHECK ADD  CONSTRAINT [fk_combo_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[combos] CHECK CONSTRAINT [fk_combo_status]
GO
ALTER TABLE [dbo].[dish_combo]  WITH CHECK ADD  CONSTRAINT [fk_dish_combo_combos] FOREIGN KEY([combo_id])
REFERENCES [dbo].[combos] ([id])
GO
ALTER TABLE [dbo].[dish_combo] CHECK CONSTRAINT [fk_dish_combo_combos]
GO
ALTER TABLE [dbo].[dish_combo]  WITH CHECK ADD  CONSTRAINT [fk_dish_combo_dishes] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([id])
GO
ALTER TABLE [dbo].[dish_combo] CHECK CONSTRAINT [fk_dish_combo_dishes]
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD  CONSTRAINT [fk_dish_category] FOREIGN KEY([menu_category_id])
REFERENCES [dbo].[menu_categories] ([id])
GO
ALTER TABLE [dbo].[dishes] CHECK CONSTRAINT [fk_dish_category]
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD  CONSTRAINT [fk_dish_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[dishes] CHECK CONSTRAINT [fk_dish_restaurant]
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD  CONSTRAINT [fk_dish_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[dishes] CHECK CONSTRAINT [fk_dish_status]
GO
ALTER TABLE [dbo].[feedbacks]  WITH CHECK ADD  CONSTRAINT [fk_feedback_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[feedbacks] CHECK CONSTRAINT [fk_feedback_customer]
GO
ALTER TABLE [dbo].[feedbacks]  WITH CHECK ADD  CONSTRAINT [fk_feedback_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[feedbacks] CHECK CONSTRAINT [fk_feedback_restaurant]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_combo] FOREIGN KEY([combo_id])
REFERENCES [dbo].[combos] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_combo]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_dish] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_dish]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotions] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_promotion]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_restaurant]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_service]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[image_types] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_type]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk_image_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk_image_user]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_combos] FOREIGN KEY([combo_id])
REFERENCES [dbo].[combos] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_order_detail_combos]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_dishes] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_order_detail_dishes]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_order_detail_orders]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_services] FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_order_detail_services]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_customer]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotions] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_promotion]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_restaurant]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_status]
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD  CONSTRAINT [fk_promotion_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[promotions] CHECK CONSTRAINT [fk_promotion_restaurant]
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD  CONSTRAINT [fk_promotion_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[promotions] CHECK CONSTRAINT [fk_promotion_status]
GO
ALTER TABLE [dbo].[provider_restaurants]  WITH CHECK ADD  CONSTRAINT [fk_restaurant_provider] FOREIGN KEY([provider_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[provider_restaurants] CHECK CONSTRAINT [fk_restaurant_provider]
GO
ALTER TABLE [dbo].[provider_restaurants]  WITH CHECK ADD  CONSTRAINT [fk_restaurant_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[provider_restaurants] CHECK CONSTRAINT [fk_restaurant_status]
GO
ALTER TABLE [dbo].[provider_restaurants]  WITH CHECK ADD  CONSTRAINT [fk_restaurant_type] FOREIGN KEY([provider_type_id])
REFERENCES [dbo].[provider_types] ([id])
GO
ALTER TABLE [dbo].[provider_restaurants] CHECK CONSTRAINT [fk_restaurant_type]
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [fk_service_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[provider_restaurants] ([id])
GO
ALTER TABLE [dbo].[services] CHECK CONSTRAINT [fk_service_restaurant]
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [fk_services_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[services] CHECK CONSTRAINT [fk_services_status]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK3m08uc0bd36m6tgp3g65m20dl] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK3m08uc0bd36m6tgp3g65m20dl]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FKp56c1712k691lhsyewcssf40f] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FKp56c1712k691lhsyewcssf40f]
GO
