USE [TaskWebUI]
GO
/****** Object:  Schema [Membership]    Script Date: 18.05.2021 22:52:48 ******/
CREATE SCHEMA [Membership]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appsettings]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appsettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebTitle] [nvarchar](max) NULL,
	[WebLogo] [nvarchar](max) NULL,
	[WebFooter] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appsettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisLikes]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_DisLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DisLikeCount] [int] NULL,
	[LikeCount] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsLikes]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socials]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Socials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[RoleClaims]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[Roles]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[UserClaims]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[UserLogins]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[UserRoles]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Membership].[Users]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[UserTokens]    Script Date: 18.05.2021 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[UserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210516121256_init', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210516203929_nwerkl', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210517185709_clike', N'3.1.15')
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [Title], [Text]) VALUES (1, N'Haqqımızda', N'<p>“Global Media Group”a daxil olan<strong> Oxu.Az </strong>xəbər saytı 2013-cü ilin iyul ayından fəaliyyət göstərir. Saytın yaradılmasında məqsəd dünyada və ölkədə baş verən ən vacib və maraqlı xəbərləri geniş auditoriyaya təqdim etməkdir.</p><p><strong>Oxu.Az </strong>24 saat ərzində, Azərbaycan və rus dillərində, ölkədə və dünyada baş verən ən aktual və maraqlı hadisələr barədə operativ xəbərlər, oxucuları və cəmiyyəti maraqlandıran suallara cavablar, analitik məqalələr, foto və videohesabatlar hazırlayır.</p><p>Düzgün seçilmiş informasiya siyasəti, müasir dizaynı, mobil platformalarda və aparıcı sosial şəbəkələrdə təmsil olunması nəticəsində bu gün<strong> Oxu.Az </strong>Azərbaycanın media məkanında öz layiqli yerini tutub və ən geniş oxucu auditoriyasına malik xəbər portallarından birinə çevrilib.</p><h2>Əlaqə:</h2><p><br>Ünvan: Azərbaycan, Bakı şəhəri, Nəsimi rayonu, R.Rza küçəsi, 75. Winter Park Plaza. 10-cu mərtəbə, 1002<br>Telefon: (012) 525-49-00, (055) 224-76-86<br>E-mail: info@oxu.az, editor@oxu.az</p>')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
SET IDENTITY_INSERT [dbo].[Appsettings] ON 

INSERT [dbo].[Appsettings] ([Id], [WebTitle], [WebLogo], [WebFooter]) VALUES (1, N'Məlumat.az', N'app-feebed2c-d869-4462-a915-0b48257c9107.svg', N'Məlumat.az © 2018')
SET IDENTITY_INSERT [dbo].[Appsettings] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Siyasət')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'İqtisadiyyat')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Cəmiyyətt')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (3, N'Azərbaycan XİN Ermənistanın siyasi-hərbi dairələrinə reallığı qəbul etməyi tövsiyə edir - BƏYANAT', N'10 noyabr 2020-ci il tarixində imzalanmış üçtərəfli bəyanata əsasən işğaldan azad edilmiş Laçın və Kəlbəcər rayonlarının Ermənistan ilə həmsərhəd bölgələrində çətin dağ relyefi quruluşuna və iqlim şətaitinə malik olan məntəqələrdə hava şəraitinin yaxşılaşması ilə Azərbaycan sərhəd qüvvələri ölkəmizə aid mövqelərdə yerləşdirilir. Bu proses adi rejimdə və sistematik qaydada icra edilir.

Azərbaycanın ərazi bütövlüyü çərçivəsində həyata keçirilən sərhəd mühafizə sisteminin gücləndirilməsi tədbirləri Ermənistan və Azərbaycan arasında sərhəd xəttini müəyyən edən və tərəflərdə olan xəritələr əsasında aparılır. Müstəqilliyini bərpa etdiyi vaxtdan etibarən iki dövlət arasında məlum səbəblərdən dövlət sərhədi olmayıb və bu səbəbdən hazırda tərəflərin fikir ayrılığı ilə müşayiət olunan qəliz texniki prosesdən söz gedir.

Bu proseslə bağlı Ermənistan tərəfinin qeyri-adekvat reaksiya verərək, təxribat xarakterli bəyanatlarla çıxış etməsi təəccüb doğurur. Hesab edirik ki, bu məsələnin Ermənistandakı seçkiqabağı vəziyyətlə bağlı rəsmi dairələr tərəfindən siyasi məqsədlər üçün istifadə olunması cəhdləri yolverilməzdir.

12 may tarixindən etibarən AR Dövlət Sərhəd Xidmətinin rəhbərliyi əraziyə ezam olunub, qarşı tərəfin sərhədçiləri ilə danışıqlar aparılır və vəziyyətin normallaşması istiqamətində müvafiq addımlar atılır.

Ermənistanın siyasi-hərbi dairələrinə təşvişə düşməməyi, Azərbaycanın Zəngilan, Qubadlı, Laçın və Kəlbəcər rayonları boyunca dövlətlərarası sərhəd rejimi reallığını qəbul etməyi və əsassız olaraq bölgədə vəziyyəti gərginləşdirməməyi tövsiyə edirik. Bu kimi hallar hər iki tərəfdən hərbçilər arasında qarşılıqlı təmaslar vasitəsilə müzakirə olunaraq, həll oluna bilər və olunmalıdır.

Azərbaycan öz tərəfindən, qeyd olunan bölgədə gərginliyin aradan qaldırılmasına sadiqdir və bu istiqamətində müvafiq addımların atılmasına çağırır.', N'xin (2).jpg', CAST(N'2021-05-16T16:19:56.0233333' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (4, N'<p><strong>İbrahim Əhmədov</strong>: “SOCAR xərclərə qənaət edərək, <strong>UEFA</strong> ilə tərəfdaşlıq müqaviləsini uzatmamaq qərarını verib”</p>', N'<p>2019-cu ildən etibarən SOCAR dünya iqtisadiyyatının sürətli transformasiyası, dördüncü sənaye inqilabı və enerji keçidi ilə əlaqədar olaraq, öz biznes strategiyasına yenidən baxılması və yeni strategiyanın hazırlanması ilə bağlı qərar verib. SOCAR-ın yeni davamlı inkişaf strategiyası “McKinsey” şirkətinin dəstəyi ilə hazırlanıb və 2035-ci ilə qədər dövrü əhatə edir. Strategiya SOCAR-ın Müşahidə Şurasına artıq nəzarət və təsdiq üçün təqdim olunub.</p><p>Bu barədə&nbsp;<strong>Oxu.Az</strong>-ın sorğusuna cavab olaraq Azərbaycan Dövlət Neft Şirkətinin (SOCAR) Tədbirlərin təşkili və ictimaiyyətlə əlaqələr departamentinin rəis müavini İbrahim Əhmədov məlumat verib.</p><p>Şirkət rəsmisi bildirib ki, son dövrdə SOCAR yeni strategiyanın müəyyən etdiyi inkişaf istiqamətlərindən kənarda qalan bütün xərclərini ixtisar etməyə başlayıb:</p><p>“Keçmişdə həyata keçirdiyimiz bəzi başqa layihələr kimi UEFA ilə tərəfdaşlığın uzadılması məsələsi də şirkətin yeni biznes strategiyası çərçivəsində məqsədəuyğun görülmədi. Beləliklə, SOCAR xərclərə qənaət edərək, UEFA ilə tərəfdaşlıq müqaviləsini uzatmamaq qərarını verib və sözügedən tərəfdaşlığın başa çatdırılması ilə bağlı UEFA-ya müraciət edib. Artıq bununla bağlı razılıq əldə olunub”.</p><p>“SOCAR Avropanın futbol ailəsi ilə keçmiş əməkdaşlığından məmnun olduğunu bildirir və Avropanın bütün futbol federasiyalarına, UEFA-ya aid olan bütün futbol komandalarına və CAA11 heyətinə səmərəli əməkdaşlıq üçün təşəkkür edir. SOCAR eyni zamanda Azərbaycan Futbol Federasiyaları Assosiasiyasının əsas sponsoru qalmağa davam edir və bu minvalla Avropanın futbol ailəsi ilə əməkdaşlığını davam etdirəcək”,&nbsp; - deyə İ.Əhmədov bildirib.</p>', N'news-69dcc820-1883-4660-8580-bde45c2c9d54.jpg', CAST(N'2021-05-16T16:20:12.4266667' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (5, N'<p>Sahibə Qafarova: “Mina xəritələrinin verilməsi üçün Ermənistana təzyiq göstərilməlidir”</p>', N'<p>Milli Məclisin Sədri Sahibə Qafarovanın başçılığı ilə parlament nümayəndə heyəti İtaliya tərəfinin dəvəti ilə mayın 17-dən Romada səfərdədir.</p><p>Sədr&nbsp;səfər çərçivəsində mayın 18-də Qustiniani sarayında İtaliya Senatının Sədri Maria Elisabetta Alberti Kasellati ilə görüşüb.</p><p>İtaliya Senatının Sədri Milli Məclisin Sədri Sahibə Qafarovanı və nümayəndə heyətini salamlayaraq İtaliyanın Azərbaycanla əlaqələrin inkişafında maraqlı olduğunu diqqətə çatdırıb. 2018-ci ildə Bakıya səfərini xatırladan M.Kasellati iki ölkə arasında həm hökumətlərarası, həm də parlamentlərarası münasibətlərin yüksək səviyyədə olmasından məmnunluğunu ifadə edib.</p><p>İtaliya Senatının Sədri xüsusi olaraq vurğulayıb ki, COVID-19 pandemiyasının dünyadakı təhlükəli fəsadlarına baxmayaraq, İtaliya-Azərbaycan münasibətləri yüksək səviyyədə inkişaf edir.</p><p>Azərbaycanın sabit və davamlı inkişaf etdiyini vurğulayan M.Kasellati xüsusi olaraq iqtisadiyyat sahəsində əldə olunan nailiyyətləri təqdir edib.</p><p>Azərbaycan tərəfindən həyata keçirilən layihələrin, xüsusilə TAP-ın əhəmiyyətini qeyd edən M.Kasellati, bu layihəni Avropaya açılan qapı kimi qiymətləndirib. Senatın Sədri neft və qazla zəngin ölkə olan Azərbaycanda iqtisadiyyatın şaxələndirilmiş formada inkişaf etdiyini və 2018-ci ildə ölkəmizə səfəri zamanı bunun bir daha şahidi olduğunu söyləyib.</p><p>M.Kasellati Azərbaycanın Birinci vitse-prezidenti Mehriban xanım Əliyevanın rəhbərliyi ilə Heydər Əliyev Fondunun gördüyü işləri xüsusilə alqışladığını bildirib. O, mədəniyyət sahəsində əməkdaşlığın əhəmiyyətini vurğulayaraq, mədəniyyəti xalqlar arasında körpü kimi qiymətləndirib.</p><p>Görüşdə Milli Məclisin Sədri Sahibə Qafarova göstərilən qonaqpərvərliyə və rəsmi səfərə dəvətə görə Senatın Sədrinə təşəkkürünü bildirib, qarşılıqlı səfərlərin münasibətlərimizin inkişafında mühüm rol oynadığını vurğulayıb.</p><p>Sahibə Qafarova hazırda ölkələrimiz arasında münasibətlərin yüksək səviyyədə inkişaf etdiyini bildirərək, 2018-ci və 2020-ci illərdə dövlət başçılarının qarşılıqlı səfərlərinin münasibətlərin dinamik inkişafında mühüm rolunu diqqətə çatdırıb.</p><p>Milli Məclisin Sədri ölkələrimiz arasında münasibətlərin inkişafında Azərbaycan Respublikasının Birinci vitse-prezidenti Mehriban xanım Əliyevanın xüsusi rolundan söz açıb, 2020-ci ilin İtaliyada “Azərbaycan mədəniyyət ili” elan olunmasının, film festivalları keçirilməsinin əhəmiyyətindən danışıb.</p><p>Daha sonra parlamentlərarası münasibətlərə toxunan Milli Məclisin Sədri qeyd edib ki, hazırda ölkələrimizin parlamentləri arasında münasibətlər yüksək səviyyədədir, dostluq qrupları arasında əlaqələr qənaətbəxşdir.</p><p>44 günlük Vətən müharibəsi barədə danışan Milli Məclisin Sədri Qarabağ münaqişəsinin artıq həll olunduğunu və tarixə çevrildiyini vurğulayıb. Spiker Sahibə Qafarova diqqətə çatdırıb ki, Azərbaycan 30 illik işğala son qoyub və BMT Təhlükəsizlik Şurasının qətnamələrini özü icra edib. Hazırda isə Azərbaycan işğaldan azad edilmiş ərazilərin bərpasını həyata keçirir.</p><p>Milli Məclisin Sədri Ermənistanın 30 ilə yaxın işğal altında saxladığı və artıq azad olunmuş torpaqlarımızda törətdiyi dağıntılar, şəhərləri yerlə-yeksan etməsi, mədəni, tarixi abidələri məhv etməsi faktlarını qeyd edib. S.Qafarova Ermənistanın növbəti təxribatını – minalanmış ərazilərin xəritəsini vermək istəmədiyini də diqqətə çatdıraraq bildirib ki, bunun nəticəsində həm mülki şəxslər, həm də hərbçilər həlak olurlar.</p>', N'news-6a24acd9-4269-499a-9d70-4fe484eaac13.jpg', CAST(N'2021-05-18T22:20:57.3200000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (6, N'<p>Ceyhun Bayramov Türkdilli Dövlətlərin Əməkdaşlıq Şurasının Baş katibi ilə telefonla danışıb</p>', N'<p>18 may 2021-ci il tarixində xarici işlər naziri Ceyhun Bayramovun Türkdilli Dövlətlərin Əməkdaşlıq Şurasının Baş katibi (Türk Şurası) Bağdad Amreyev ilə telefon danışığı baş tutub.</p><p>Bu barədə Xarici İşlər Nazirliyi məlumat yayıb.&nbsp;</p><p>Bildirilib ki, tərəflər Azərbaycanın Türk Şurası ilə əməkdaşlığı məsələləri, o cümlədən təşkilatın qarşıdan gələn görüş və tədbirləri üzrə fikir mübadiləsi aparıblar.</p><p>Türk Şurasına üzv ölkələrin bu ilin payızında keçiriləcək Zirvə görüşünə hazırlıq məqsədilə keçiriləcək görüşlər, o cümlədən yüksək səviyyəli mümayəndələr komitəsinin toplantısı və xarici işlər nazirlərinin görüşü müzakirə olunub.</p><p>Tərəflər, həmçinin təşkilatın gələcək inkişafı məsələləri ətrafında müzakirələr aparıblar.</p>', N'news-ffd375fd-6756-4d97-b1bd-b4a1df25ebe4.jpg', CAST(N'2021-05-18T22:23:19.9833333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (7, N'<p>Deputat arağını şəhidin adına yaradılmış bulaqda soyudur - FOTO</p>', N'<p>Çəkiliş üçün Laçına gedən bir qrup rəsmi şəxs orada olan zaman kef məclisi qurub.</p><p>Bu barədə <a href="https://caliber.az/post/deputat-ustroil-vecerinku-vozle-rodnika-nazvannogo-v-cest-sexida-foto-8758?fbclid=IwAR3eg_LwY3XWUeMMCRP3eKxzkrG8CuWJ1poJ9FeTpJXkI7OuLsicbSeQizE">“Caliber”</a> məlumat yayıb.</p><p>Belə ki, Laçınla bağlı bir verilişin çəkilişlərindən sonra istirahət etmək və içki məclisi qurmaq istəyən şəxslər özlərinə məskən kimi Vətən uğrunda şəhid olmuş şəxsin adına yaradılmış bulağı seçiblər.</p><p>Həmin bulağın sərin sularında özləri ilə götürdükləri araqlarını soyudan və eyş-işrətlə məşğul olan şəxslərin arasında millət vəkili, Laçın rayonunun deputatı Mahir Abbaszadə, həmçinin Qaçqınların və Məcburi Köçkünlərin İşləri üzrə Dövlət Komitəsinin mətbuat katibi İbrahim Mirzəyev də var.</p><p>Deputatın arağını soyutduğu bulağın həmin şəhidin məzarından 5-6 metr aralıda yerləşməsi isə vəziyyəti daha da iyrənc edir.</p><p>Görünür öz səfərlərindən və məclislərindən vəcdə gələn deputat və Komitə rəsmisi şəhidə, onun xatirəsinə hörmətsizlik etdiklərinin fərqinə varmayıblar.</p><p>&nbsp;</p>', N'news-76580268-1e9a-40ee-bca2-fcd9cf602c03.jpg', CAST(N'2021-05-18T22:24:45.8300000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[News] ([Id], [Title], [Text], [Image], [CreatedDate], [CategoryId], [DisLikeCount], [LikeCount]) VALUES (8, N'<p>Plastmas ixracından Azərbaycan nə qədər gəlir əldə edib? - RƏSMİ</p>', N'<p>İlin əvvəlindən Azərbaycandan 139 min 428,3 ton həcmində plastmas və onlardan hazırlanan məmulatlar ixrac edilib.</p><p><strong>Oxu.Az</strong>-ın Dövlət Gömrük Komitəsindən əldə etdiyi məlumata əsasən, ixrac edilən məhsul üzrə 122,9 milyon dollar gəlir əldə edilib.</p><p>İxrac həcmi ötən ilin eyni dövrü ilə müqayisədə 1,7 dəfə, ixracdan əldə edilən&nbsp;gəlirlər isə iki&nbsp;dəfə artıb. Bu məhsullardan polietilen, polipropilen və propilenin də ixrac həcmləri&nbsp;açıqlanıb.</p><p>Polietilen -&nbsp;45,3 ton həcmində və 50,9 milyon dollar dəyərində məhsul ixrac edilib.&nbsp;İxrac həcmi ötən ilin müvafiq dövrü ilə müqayisədə 0,5 faiz azalsa da, ixracdan əldə edilən gəlir 1,7 dəfə artıb.</p><p>Polipropilen - 30,8 ton həcmində və 37,1 milyon dollar dəyərində&nbsp;məhsul ixracı baş tutub. 2020-ci ilin müvafiq dörd ayı ilə müqayisədə ixrac həcmi 3 faizə qədər azalsa da, bu məhsuldan əldə edilən gəlir 40,1 faiz artıb.</p><p>Propilen - il ərzində ixrac edilən plastmas və onlardan hazırlanan məmulatlar siyahıya əlavə edilən məhsul üzrə ilin əvvəlindən 8,7 min ton həcmində və 13,2 milyon dollar dəyərində ixracı həyata keçirilib.</p>', N'news-60775b4c-0778-4e2f-99cb-e6c8611cb063.jpg', CAST(N'2021-05-18T22:25:36.8033333' AS DateTime2), 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsLikes] ON 

INSERT [dbo].[NewsLikes] ([Id], [NewsId], [UserId]) VALUES (1, 4, NULL)
INSERT [dbo].[NewsLikes] ([Id], [NewsId], [UserId]) VALUES (2, 3, N'1')
INSERT [dbo].[NewsLikes] ([Id], [NewsId], [UserId]) VALUES (3, 6, N'1')
SET IDENTITY_INSERT [dbo].[NewsLikes] OFF
GO
SET IDENTITY_INSERT [dbo].[Socials] ON 

INSERT [dbo].[Socials] ([Id], [Name], [Link], [Logo]) VALUES (1, N'Facebook', N'https://www.facebook.com/', N'fab fa-facebook')
INSERT [dbo].[Socials] ([Id], [Name], [Link], [Logo]) VALUES (2, N'Instagram', N'https://www.instagram.com/', N'fab fa-instagram')
INSERT [dbo].[Socials] ([Id], [Name], [Link], [Logo]) VALUES (3, N'Twitter', N'https://www.twitter.com/', N'fab fa-twitter')
SET IDENTITY_INSERT [dbo].[Socials] OFF
GO
SET IDENTITY_INSERT [Membership].[Roles] ON 

INSERT [Membership].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'SuperAdmin', N'SUPERADMIN', N'600e6206-65d8-49eb-94ad-966d9f0bf0aa')
INSERT [Membership].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Admin', N'ADMIN', N'5410af4a-b1c7-496e-849e-c6b45de9aa08')
SET IDENTITY_INSERT [Membership].[Roles] OFF
GO
INSERT [Membership].[UserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [Membership].[UserRoles] ([UserId], [RoleId]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [Membership].[Users] ON 

INSERT [Membership].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'mecid', N'MECID', N'majidan@code.edu.az', N'MAJIDAN@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAECZhwVrQFO8W+o2LglMGfA0Ip/q1DzUqve7QExH2+9UNxkJbMfF1hzP0mYZ0S3L5JA==', N'BVLATISLN37RIAOSA6B6FTOF3GB5VZCN', N'2da2a493-0a55-4ab7-903c-d048d89c2ff4', NULL, 0, 0, CAST(N'2021-05-16T12:28:15.6962623+00:00' AS DateTimeOffset), 1, 0)
INSERT [Membership].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'emin', N'EMIN', N'necefovmecid@gmail.com', N'NECEFOVMECID@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFejc6Q5FgbOCbQhIp97xSR4kCt5M0liXzlPsvx7VhumfPvn1M5PZ8QbE5LVirlAng==', N'7HAZXUI5U7H3DE2WVX5FCEDM2IXZTWJD', N'd4f98c8b-a351-41fd-9a3a-5917e491cd34', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [Membership].[Users] OFF
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (dateadd(hour,(4),getutcdate())) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DisLikes]  WITH CHECK ADD  CONSTRAINT [FK_DisLikes_News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisLikes] CHECK CONSTRAINT [FK_DisLikes_News_NewsId]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Categories_CategoryId]
GO
ALTER TABLE [dbo].[NewsLikes]  WITH CHECK ADD  CONSTRAINT [FK_NewsLikes_News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsLikes] CHECK CONSTRAINT [FK_NewsLikes_News_NewsId]
GO
ALTER TABLE [Membership].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Membership].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [Membership].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [Membership].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [Membership].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [Membership].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [Membership].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Membership].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [Membership].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [Membership].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [Membership].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [Membership].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Membership].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
