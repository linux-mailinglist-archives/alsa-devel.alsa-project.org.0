Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06967C54B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D67DF7;
	Thu, 26 Jan 2023 08:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D67DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719999;
	bh=kUEMfsjhCn7JaEZg8amr1LMPwSoYvim+0WKD26LHreU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Mzxl3I4KM7c6PyJPvOXJZIQa/o4us+Yi8lip/FnAEUcVC6rXD6YefdDaPg8vKTjbd
	 czRsToM9qAyGcaq/TMw5vusVIO9yiXfSBdWtyljYkS/yP3HoJ3DRZfihgGSzWpWSAe
	 MQZj5sBNW5tZuRkrX39q+bbCbPdeHkjbthssSqjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E522F805BD;
	Thu, 26 Jan 2023 08:55:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B284F802E8; Wed, 25 Jan 2023 17:59:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2099.outbound.protection.outlook.com [40.92.23.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FAECF800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 17:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FAECF800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qff009T7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA703dJL6fMJT5clPhZD4wjl8Mrw+qeOGMdf1A5KtRGCfkZ8flaM+MUjSzQIwtKY2sF/9YC3DMgXtCaD/VQlau47mdWIyQfcBeMh2TxSjygJ442X8QSeiIDtwg0KjiehmlGxr5BgaFY2Zk5Yi/vMscHCH1shPlSnlFPcmhtmW9CY6SKRovz1gKb9b988EY6GVLPeETCUp/4vdr83YhxSUyzMo3BNWtNrpx5GgdpIuVtSULAUoior13jLeCtUniWfPtZXZiRk4WxAy8znKebxcYnuo+keeDbs231oF2jxLGZoBHvs1dkngKm4HzUvWZttnlTyY/9tbBAosSHT1Kb8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvB6V5CIJ86V2xS0WXpZP2hi2jtgVVfo/+XvjqFKh+g=;
 b=cKIXP4CWdiYDijEg/Qt5g3n0xgpeUjuGQP8w82qQvPH23bdmwQP2VB9spl9P7vjFsFb8xHazuYGJPCSKadtFhI0ms8i5l7SeA4xXGJWMpIG2GGajlMfcL7PyU8MMat/O8aOD0jhQ0Hd4zVGpBRAmx2ZB3AZX4rqwsqI/5kARh1h+TUSXC+c3kCgOf5984vxUVgSyyFMsTOhDbdihfys/b/2ThVZi5LIzMgJYmtpmcDbgyg9Gme61hj8rEcld3SQZYyKVMsS+8lAL3x8V2Fsr9+/DpNMX9j/UWStCYBlKgMjKCup8/wDF0Zli6w6ButT3+lNxD3zXFjkO8GVJ1Qt5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvB6V5CIJ86V2xS0WXpZP2hi2jtgVVfo/+XvjqFKh+g=;
 b=qff009T7RTCu6tgxX4jbsXXLm/79yQDYBxuiudblp/lCRgs5QSnsSrZzupbm0vwxYxLP0FwaD4hi+LzPwJsTM6m9PmiK2YKxnE3Zq9Jrv+pnVm+McnBOZF5WaPvUAiqPfmuJz6goZUfjVp69mRyMAb/fhMPk/15Tnsig1cm+/y4MihJDrsDPZc12XfrAjo7kzQ075qsmQDYo+qfsiVHY7rWEBLPMpzKstbrnweGv8oSs5pTz/44EdKOCbP7aoMz56wObVYa6qrdEpVfPf/AR0KJ8ry05xVDvtHW5ryGG961gpv5M0ejcisnlCqqS4eaxGj2oFPAXXYkct04pXxt80A==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MW4PR17MB4604.namprd17.prod.outlook.com (2603:10b6:303:101::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 16:59:31 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 16:59:31 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Topic: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Index: AQHZMEgIrioCItITZU2shGV9idtdpq6vUwWAgAAI5+qAAABM2A==
Date: Wed, 25 Jan 2023 16:59:31 +0000
Message-ID: <MN2PR17MB3375D83019832EA4EFB460FEB8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230124230048.371144-1-robh@kernel.org>
 <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
 <MN2PR17MB3375A0A6EA306A2019787EE2B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: <MN2PR17MB3375A0A6EA306A2019787EE2B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [d9YIfwOS4oRn4+2aMypXP/nN/AUZ8PoC]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MW4PR17MB4604:EE_
x-ms-office365-filtering-correlation-id: a966d6dd-f3a5-4073-35d0-08dafef58756
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMqmU3hQkvOnYhl4ZLwYqt4T3AxbYdTDEL2lJHGGDzA/CuRBNtyDnom2IUm6ZWkipr5rHALNngY18g+bvLY8WL6FaOt6TTVLtnYph37iUEH9n/1FWY8KGFNsnTTp0xI8GlVC9vBx+cPJ4W96VJNOcGujHedTQF+kvXZH0CA3SoNGdHmt4UvIOL5LIKv9a1KlqkQyh9Bkb5ClUaxbaXCAXnXI0zppCZc1TmdwPPGTWtub/ViW8FE9IF8jmnVnesVCSCIpyY/uV8E6x79NpCaezWWBYgR/xte716p/JlHq9T+4z6z/Xdtr3FpWZCQAvtza911P4fDJpd6jvRoR+e8r8DYpxMb0rbzkNA8AhkvRAgWAJz3BrwDu1bTjNiHynhFgdv+fqHpX2tuw2WZ+9JPgS2d9FSYf/Q8Cm9QIt/f8yrJNxWnEGmZ8ZBbB27StHhSKR72athyWA9iD4lQwAr2YTl7yfuEkvSGQo1ZbhjBVRfu6faWvPuoMGmUpM5md0siY27M5sOEGlhA9CqbEvKRvDsu+QXBlI65CC3Fglsm8O8JKPVxJYIzejv/rQGzLCAUUXcOYmIP0ghejoxN5T529GsFjjteyCoaTSvUtmq4vviHCADPCsnq87wtSMl0MT533MKC6JZeG3vXFRB25sGTrZJuRVK1irfiSHSq9W4oHxHk=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ZtGwCQstRS/+Cgi6T3DR9LZk8Thnf8dIoFHRm3ScHn9PfuL34T0zVAqA?=
 =?Windows-1252?Q?QMsaVgO8zf31VnL70Mhl1COiOVRwHbSD/w1jvm0IHYXQPkv2AJJnZlxS?=
 =?Windows-1252?Q?vmK4jlnHxIAxAkCiEouQVuvSIHQbzPVErsa0YtfegBGuGUZR6+AHnimG?=
 =?Windows-1252?Q?u741zDcuYZwqb0hstquZRWANF+F7JSpD6NV6N3Fmdhhd7zgBHNURFMg6?=
 =?Windows-1252?Q?4B2LCcsIPn9i0FOc1ucBM7pNeOvuDrQMOOmpbPUSRjg1SDMNLEwBXW0g?=
 =?Windows-1252?Q?MT7GUYzuEJpN4gp0tf3ihZwA8c41/WEVpMVvxkATek1UgMjCnsNT9cmY?=
 =?Windows-1252?Q?ETf9PK7urNfgtj0i1hiNlD3zaZGbRlXRznuut14k6d01zpPz7sz/+NJA?=
 =?Windows-1252?Q?pMFk54+QPgi7ikk+FvzVDf3BEU0+Kz3s6mcMpKjtfqG+2S7bFQqbb1tE?=
 =?Windows-1252?Q?sy1uTp0wvR94HUyzn6LZ4Xc7vzPYeUZVunG7RkXMj5p14X93FBfjQA1s?=
 =?Windows-1252?Q?2F0i2htxFar30fiDO52OgeMwJoTZWPypW9E3wPDEQFvPSNHW7hiUrbFA?=
 =?Windows-1252?Q?qoS6LUDch5u3Z6HAWoFsQFnHVVxfOSIOF50poZJh5Fiman57lSbWZYOC?=
 =?Windows-1252?Q?g/XULbsvrFXB22JDPslQhteFx9sWR1EFRslZyIMq7gP/lh50DAUXMfwv?=
 =?Windows-1252?Q?vU/dWfW3X01700g6kwIYxsnFP4nbBHROsVpmeKvJKfmjUk/mBU1W1+Fy?=
 =?Windows-1252?Q?wfaTDNllDHVN29rIg5PPAeQ+ZOyqw4NNjskFLeun65z+VZn0ozKnp+RT?=
 =?Windows-1252?Q?9pXDBKNTpc8qvnDhQbZeQXM9AlAYYcT19fgRYvPJrHvId94Aq0N3zzo7?=
 =?Windows-1252?Q?GQXSelsLFuXzuaLh1hLEEqjIVPqkn612T2FBSQFl7aHuofUchGOeNJH8?=
 =?Windows-1252?Q?lhyJD0MGiVNUHU/kcNZE/ueoJf/OR7Tr1/kpm2/GmE95QqHYJ4jHKy8o?=
 =?Windows-1252?Q?UTLyuocDT4UaTk23vQqlZLD8k7l8Zj0J3bONNzmZ+SstcCtd9QU5ArC/?=
 =?Windows-1252?Q?XhNHo9BXwhbC8NeoTdJ+Lom+FTmG4hBkIC178YdSSy9GVlZspljuxYj2?=
 =?Windows-1252?Q?a7wLEueQlL21+SSQo1X8ksfoV+ftOFvHo4RkLGeaVBY27kz8A3Pxv54i?=
 =?Windows-1252?Q?+ua2V2Uf8/cdS0BHw1WfD3icZVSEaOgDm4LECCj7o9QY2cN2gxDZUMBm?=
 =?Windows-1252?Q?QqYqSNPEzvXGx10hjzxSvK0ryLGsuMuu+MYdScgiQlQJXRumVdbxYJ4d?=
 =?Windows-1252?Q?zTZeVdNVz7PpcPgOW4gRlYIS67DVFCwIu5CHf1cjHdTEmePO?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a966d6dd-f3a5-4073-35d0-08dafef58756
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 16:59:31.6894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4604
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:01 +0100
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Lonely nasty ass dumbass
________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Wednesday, January 25, 2023 11:59 AM
To: Jassi Brar <jassisinghbrar@gmail.com>; Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; David Airlie <=
airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Bartosz Golaszewski <b=
rgl@bgdev.pl>; Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck=
-us.net>; Thomas Gleixner <tglx@linutronix.de>; Marc Zyngier <maz@kernel.or=
g>; Mauro Carvalho Chehab <mchehab@kernel.org>; Lee Jones <lee@kernel.org>;=
 Ulf Hansson <ulf.hansson@linaro.org>; Richard Weinberger <richard@nod.at>;=
 Vignesh Raghavendra <vigneshr@ti.com>; Sebastian Reichel <sre@kernel.org>;=
 Mark Brown <broonie@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; Da=
niel Lezcano <daniel.lezcano@linaro.org>; Greg Kroah-Hartman <gregkh@linuxf=
oundation.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@list=
s.infradead.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesk=
top.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-hw=
mon@vger.kernel.org <linux-hwmon@vger.kernel.org>; linux-media@vger.kernel.=
org <linux-media@vger.kernel.org>; openbmc@lists.ozlabs.org <openbmc@lists.=
ozlabs.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-m=
td@lists.infradead.org <linux-mtd@lists.infradead.org>; linux-pm@vger.kerne=
l.org <linux-pm@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@a=
lsa-project.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; li=
nux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Prope=
rties on child node schemas

You are a disgusting disgraceful piece of shit as human being you deserve t=
o eat yeah and literal human feces until you DIE motherfucker. You dumb fuc=
k. Have nothing better to do. KEEP talking motherfucker KEEP FUCKING talkin=
g. YOUR DELUSIONAL. It=92s sad
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Jassi =
Brar <jassisinghbrar@gmail.com>
Sent: Wednesday, January 25, 2023 11:26 AM
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; David Airlie <=
airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Bartosz Golaszewski <b=
rgl@bgdev.pl>; Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck=
-us.net>; Thomas Gleixner <tglx@linutronix.de>; Marc Zyngier <maz@kernel.or=
g>; Mauro Carvalho Chehab <mchehab@kernel.org>; Lee Jones <lee@kernel.org>;=
 Ulf Hansson <ulf.hansson@linaro.org>; Richard Weinberger <richard@nod.at>;=
 Vignesh Raghavendra <vigneshr@ti.com>; Sebastian Reichel <sre@kernel.org>;=
 Mark Brown <broonie@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; Da=
niel Lezcano <daniel.lezcano@linaro.org>; Greg Kroah-Hartman <gregkh@linuxf=
oundation.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@list=
s.infradead.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesk=
top.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-hw=
mon@vger.kernel.org <linux-hwmon@vger.kernel.org>; linux-media@vger.kernel.=
org <linux-media@vger.kernel.org>; openbmc@lists.ozlabs.org <openbmc@lists.=
ozlabs.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-m=
td@lists.infradead.org <linux-mtd@lists.infradead.org>; linux-pm@vger.kerne=
l.org <linux-pm@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@a=
lsa-project.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; li=
nux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Prope=
rties on child node schemas

On Tue, Jan 24, 2023 at 5:00 PM Rob Herring <robh@kernel.org> wrote:
>
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
For the mailbox change,
   Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
