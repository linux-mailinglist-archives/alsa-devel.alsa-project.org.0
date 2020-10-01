Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646802822E2
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C1C1900;
	Sat,  3 Oct 2020 11:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C1C1900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601716077;
	bh=+3kxnkC1sHgyG1f1/K0eLeZqv2+hsYqG7sxKfOlRI+k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i908syul92aCuRp4LegFboIvzIvJ+J+uRUtd/IwjtOn2cgJT48h+T9HcBH2GLWKSZ
	 wUSeY4UyUd61vU1//y2lMUaoeop/Lnx6rruSrPB4b77seUObVNzcmIESa05oGUb2KE
	 hn2h665zF/pCGiV6ui/WRHOooToudOpF+Ie2K0WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DD0F8020C;
	Sat,  3 Oct 2020 11:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5044F8022B; Thu,  1 Oct 2020 16:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A10F801F5
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A10F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="eFGgIOkE"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75e9a90001>; Thu, 01 Oct 2020 07:37:29 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 14:39:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 14:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBfKXIVe58kWsi35zyUGjnhH9ckU7Tycgtd25WX+3ohzB/ZRBSc5pW0NuzumqoVGDX6PwJk8hityFE3SLweTW9OV3SlT7LCtXB4YEDGBxyBRd1a43Bq0Ty2dERg6LhlRajYCP1ClrQsdxUbQP5IOmKQEkncdyBWqvtWgfdWFPno7wJ2J70QanwFKnZv7a7VZxYfMl+AV8kTsFpmkqjosXzbXeixNUxUzTtf3W1CpFBSgwJ1S++Q5TdtYx6/5LCprdEJ3PZ/hFc/nwYDpcOJIjZKVpWc+IAA1A4qH8rwHd/BoZ/ObtGn0hQBq3ETING50e1y9lXS69NrimW5U3PCS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8opnJkdnx1BT5xdPsU0XPki8nAL1zE2nxRm/9z9CGI=;
 b=O1XJ+JT4hgwMn7cR/LW9cRTH4ib9bk459tymUYSbO4vWi7vJvYnCMdxB9IAEaG8zYPKN+g2xixb9ZdnYhNleLiAwmXKNEhR2QzADmFFaMQKQngib8prVDi1vJvucOXLRJcve3c8om86iORTFq5yRy9d6XjBaDQlOnmCbA/+qiWcCMQBJ+Mg1Ks8zqmuc7bmFMnFetqnPuTw51wIemnbAoGjYuXMnG1ybX7x7yRCrCt7DKdMq1dIiFM6OtqwxuRihD4fJg70qlS6R4eRRxPL2pI67DmtAo0o8EkLAZPfwTCqDtGHaA0GlFQL42x9IPFVmXm4HoZtjhx0qAl+g6LuP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BY5PR12MB3811.namprd12.prod.outlook.com (2603:10b6:a03:1a1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 14:39:06 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105%6]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 14:39:06 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/6] Add ancillary bus support
Thread-Topic: [PATCH 1/6] Add ancillary bus support
Thread-Index: AQHWl3xK6PpW4GgCLkSFS7ZuYPaI7amClq2AgAAOyoCAAARcgIAAJuMAgAAAQ9A=
Date: Thu, 1 Oct 2020 14:39:06 +0000
Message-ID: <BY5PR12MB4322699D73AABCA62ED07BECDC300@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com> <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com> <20201001143334.GA1103926@nvidia.com>
In-Reply-To: <20201001143334.GA1103926@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [122.172.151.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4dc286-114a-4e73-182e-08d86617bfe2
x-ms-traffictypediagnostic: BY5PR12MB3811:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB381148D06E0D0F801112B084DC300@BY5PR12MB3811.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aMAI5sXNbRWcys2sOn1KWDY6S5HsSGrfqEjv3jBYOOUzNTLOtOafPmy58k0EmZRjVS8Jqy31tdDtUxN1P932kJy2AHr3AOCTcCcyJrCQzYfkrgI+Zj8z9ebAd1Sgl37MRTPow3Nv5i4bFKAg6IKTeSEdfe5SaGCO9QLSefvv3XdpioEqBQYl6hs73EWLOF/mi0r7Vmw+wniAwlECGR1lVf6rOSE5QzefcC1Sv816YiI2NVxK7JdrvCUZVt3IrKLNWJcuWiO+POR0P75AwhyL7375CNN4zhasjYx8Rpzt1vZfB0/1MhWpj03G/Ej6qAjRKwL9oBTsLWV69ykXrWRYhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(66556008)(83380400001)(66476007)(64756008)(66446008)(8676002)(66946007)(55016002)(86362001)(5660300002)(186003)(4326008)(76116006)(55236004)(71200400001)(26005)(6506007)(8936002)(7416002)(52536014)(316002)(2906002)(7696005)(9686003)(478600001)(110136005)(54906003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oupxjMXxcGs+x8iT/mmm+ri8C/KgxZhcG+Q05LvKZceD7hQ+xEziaGTaJ1cKYUcShF6ekZqFkFE5s41iT9JlTyxeupSYk335HdTaRlCVK7jEpaKLWperP2HOZ/40iiURjmFIintGXl0/nCuw/XT+S7P57OmHqAQqrwmKgDEpfNoMjl5KtmsffoRH3fT1clM78Cuc6DJJHuKyNysMZGH32gjH+xsM5d0sB2Fqn7Fa4Ozp90tsyt6Qxxv8uniAtDej5+A2TCOCd88eo0nGL8xZLnnKnGBM8+UtbzWBHGtytcVPJqn8MjZGM+DVsYX6LxdujqeO1adm/Z8G7IQUFxeJ3vzBZTKgNg6mD4Y5vDe7Xo7MgoATtTNbbUtmjz68EU8fL86lPwPDWIHmBguerXr6VOTtjwqnJDmW7IEyBOzxJeUUznVimpblqEvhQKVN0QDBMngQvHAUos0SehNruaCPJiDgWhWT3n9Tl2MFiOnZo3Yk8kDeDW0KeBVVzw2suABy98XLP8w6zLlWkbhWcTPFWC9/8qbk0BFPcAdk+bopgHzw2zt5i7ua2eW3TfBp/xjRmKbJSTBaK4U2RtfmNe58dCqI2nmy+AtqLcJbM92Su3As5a0iRQWD5SiLuoXYcviipQlzLmxfKXupkykCf3VgkA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4dc286-114a-4e73-182e-08d86617bfe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 14:39:06.0639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBJpbDD+U7g6Aqq+Eb5ErFh3TPXEocmcHpLALLP+Xxh0tPWz7CrYAJEvPcYbc5y4w3/+RDUd+uktNEbsXCY1DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3811
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601563049; bh=R8opnJkdnx1BT5xdPsU0XPki8nAL1zE2nxRm/9z9CGI=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=eFGgIOkEX/Jrfoz7Bl41sMUCDsnbZ1wFwrTSKAOGy8FjvZnpTgILRUB2iLrH2Wp5K
 C1f9nlumpF++lp58hZWx0BpvrEckuOrxTVr/j3ntUHwXsAwpjULcVYi3WPCgS6k3or
 BK6z12I6I+xjlX8JZwhboMnCbIZLJc3j998nd8Ww47PRna2edOQDWSH+NE28FBbXoe
 GC1Q/NwRwdNb702qF2LVUchl6ryhoz6QCIfd7JthmKYw0VQ1auG3NECkKLahuKyxig
 ljTs+R93dslALQrRyqGvHiUwzOZYA8a1POtVQV76oI85tmWonP8o9wAtKTb85VUrsB
 tGpGAyMwNRQXA==
X-Mailman-Approved-At: Sat, 03 Oct 2020 11:06:14 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kiran Patil <kiran.patil@intel.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "ranjani.sridharan@intel.com" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, October 1, 2020 8:04 PM
>=20
> On Thu, Oct 01, 2020 at 02:14:23PM +0200, Greg KH wrote:
> > On Thu, Oct 01, 2020 at 08:58:47AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
> > >
> > > > You have to be _VERY_ careful after calling
> > > > ancillary_device_initialize(), as now you can not just free up the
> > > > memory if something goes wrong before ancillary_device_add() is
> > > > called, right?
> > >
> > > I've looked at way too many versions of this patch and related. This
> > > is the only one so far that I didn't find various bugs on the error
> > > cases.
> >
> > But you haven't seen the callers of this function.  Without this
> > documented, you will have problems.
>=20
> I've seen the Intel irdma, both versions of the SOF stuff and an internal=
 mlx5
> patch..
>=20
> Look at the SOF example, it has perfectly paired error unwinds. Each func=
tion
> has unwind that cleans up exactly what it creates. Every 'free' unwind is
> paired with an 'alloc' in the same function. Simple.
> Easy to audit. Easy to correctly enhance down the road.
>=20
> This is the common kernel goto error design pattern.
>=20
> > Why is this two-step process even needed here?
>=20
> Initializing the refcount close to the allocation is a common design patt=
ern as
> is initializing it close to registration. Both options are tricky, both h=
ave various
> common subtle bugs, both have awkward elements.
>=20
> At the end of the day, after something like 20 iterations, this is the fi=
rst series
> that actually doesn't have error unwind bugs.
>=20
> Can we empower Dave to make this choice? It is not like it is wild or wei=
rd,
> the driver core already exposes _initialize and _add functions that work =
in
> exactly the same way.
>=20

> > Why is this two-step process even needed here?
> > Without this documented, you will have problems.

And it is also documented in "Ancillary device" section in the Documentatio=
n/driver-api/ancillary_bus.rst
Below is the snippet from the patch.

It is likely worth to add this part of the documentation using standard ker=
nel kdoc format where export function definition of initialize() and add() =
resides, so that it cannot be missed out.

+Registering an ancillary_device is a two-step process.  First you must=20
+call ancillary_device_initialize(), which will check several aspects of=20
+the ancillary_device struct and perform a device_initialize().  After=20
+this step completes, any error state must have a call to put_device()=20
                                                                           =
                         ^^^^^^^^^^^^
+in its resolution path.  The second step in registering an=20
 +ancillary_device is to perform a call to ancillary_device_add(), which=20
+will set the name of the device and add the device to the bus.

