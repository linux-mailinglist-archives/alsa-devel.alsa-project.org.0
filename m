Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4636936DD
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16CD82E;
	Sun, 12 Feb 2023 11:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16CD82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676197378;
	bh=l4xLwN6Ito4VYcvGUYie+/0ruomsZPgbWkbiTIf+bXc=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxjYA8qr+H8FFUKkXERuNWSEHa7q9JbMu9+6azb2oAhib8nQpglJgKGNSyXg+YZNp
	 NY3uvbC9gpFGTG3pkevW3krRgOFksPe4hvj64bYinP145TJUi93L1crGjNCDboBoOD
	 Xy967qnGaMTSfdMuY5qDU+5sgGmCuzptLPnQBx8A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0970F8001E;
	Sun, 12 Feb 2023 11:22:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A66AF804B0; Sun, 12 Feb 2023 11:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,T_KAM_HTML_FONT_INVALID,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn20812.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::812])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70205F8001E
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70205F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=lrw9IPpL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk/l34VpoK0ZiNQlYrx2eXqyeoA1d5VtQYWuhF8gA8ARsZU88gda18v7fmpjBPv4iskKpxnVIgU6jWkAFbHSnpu4d+SJ9Kv46qZ8TB6ixA65ZEHqkBHxTBKRKJWC53QRrYqWI82s8e8a4xq8mL/3IWCrVqvgXiAX97M220Yst7t0exV/TosIYNITrl+ab/Y7oEBv4eJFUfgH3RX2vbD6OFPgXuJB/aCKYMKwimUGbn3Ac4gWjzn/6QwP6p4Jl+tudWRs9pXcY+SP/ZWpWaL2MrP2g8EIOBR/N1MaWNqLGnvAQRtYn403D7zzszOc9lE+g+hzIfXVZnT+RokaxL0uVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1XzxD1cH/CvIOx9S/IqqU0jkcV0JoNAxZnbZWNIaXA=;
 b=lZP3MxZCiGPwnXTLTiOXBYMiD3bdHAj/JjLrOReI5tdcvMv0nkzL6ng7eP0S2LrEkuC6hoRzApf3pDhLfB+glwDz71mOYQadGb23bxpYdNKqiH8+SPb4LtK6HfzGUqC9VAfRu+GPe74+/ZCekfRQTG4pIHllbVMR8TesV7HdK/BVuvPzx05hYHKEzs3gBZm+M+vhquFrPChIyxultANW2V1UtlLbEHiixTmHJBI4mIqz5jQO6kV0bReDn57nogQVWHuN54Th1VIPktda3XMim9x9Zp1BD+cz9pX2aYM5xpv2TtHlnTPDTg68b8VHGFbPmLDCR/k7IcBwI8PBZI0fXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1XzxD1cH/CvIOx9S/IqqU0jkcV0JoNAxZnbZWNIaXA=;
 b=lrw9IPpLXPpJfcZ4LLy226LkG0wrfxFqPt9XAO4RMcHM6qKPmRPl2o49Kq2NBBOe89C9XW/hjlXuDrut2hDyYCn6tffBuIjOXuC2Xthpw781s3zXZGxm2IJWogZwgpBtAWc0gaGoccRW66kD7XHxWVpkWHGkxjzHCkCbT0dhFD4OQ8p7T3mnWGCMqgas5wXsQcyFuAY1wXV6eYIfajvVM+gB/oAup4dm9Js7Tf+WibuRJuG7mW44TtLri5SbrpjzvbGF1OBaxSXx4PV2CMpYJ5mt9vK14k+aCB/Sf7Sb41j1HQQKzZcch5B3H3QHcqIjO0uzuq76L4syCtHur1Vtdw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by IA1PR17MB6027.namprd17.prod.outlook.com (2603:10b6:208:389::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sun, 12 Feb
 2023 10:21:47 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:21:47 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYOAAAA4WQ==
Date: Sun, 12 Feb 2023 10:21:47 +0000
Message-ID: 
 <MN2PR17MB33759663CAD3BCAB5D0987C0B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
	 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
	 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
	 <1c6e7a19-a650-1852-6f74-ca5547db44c4@landley.net>
 <ed4a36508c3d047f9e9a882475388be18b790b76.camel@physik.fu-berlin.de>
 <MN2PR17MB33753450B555F0E4E65D7C62B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375C10DF139D4FFA7F3F657B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB33754A3835C945B57B1FDCCBB8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: 
 <MN2PR17MB33754A3835C945B57B1FDCCBB8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [Kxhmi4h9Rq6sY73YQiHsERDfSTkcJKS2]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|IA1PR17MB6027:EE_
x-ms-office365-filtering-correlation-id: 95f9bb0c-018f-45a9-7583-08db0ce2f2a4
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u7TL1zUubH4qrRYp6Oh0k8jDneUXf+LpudS57u8mioPuDITmZfRfcxP9hf/6EBGKZFJ2Hwad+5o8MoC9EW60Tqf58+4DUc6E8Ihi1fn1M3qkYv5vn4H+jPjJtdLce9Zq8yVwCbGAp94pdFiuje34gQLoyE/7V8xNjTTNxeRp6GKaKCLNMJt9KI4lP0G6fjM00r8Ht+fYTLAoqv26xRl0cLL0q4o5WhS4d2YVMRoJmgm8ugtSJ5PlqstT2JmC9nva9a0a9wE1NE0olhNSoOHwzwW361gXJYBubxRjBl6PJfnvjXY6DZgAVJ/W3XzMtkyMcfrMUr/2ZsBNzYM/jd8AAnOTldFsvw4Fi032TByuhbUM0eH8goBd9B+9AnyNLls0+PNDUzQUZLdnFRpj7EwC7+cc27caSgLALefgCbmAjYn/7ety4z+K8wQgh6b59ytAKTDZjgUXgi1fgH+tGjnH78UosFF6iACIwrrej2i21e0jLl/jx5fT8dBSoNsMKoLyqSjPF40re0YXUoLftZYnU+FrevcLsA7v0gQ0NmWkW/yW0zM5fwBzebAAXZylyloZqvulhel9scoHg3+c4ukUoLzX5Iteis7o9r+e3Wh4K+6cKDdMjfz/r407k8RNAL6YV/NU1zuCxyFNw3Wm0qqYozPJN+6SrJ3p4SdmOJsGfJ8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?M5HG+Qz4CA1vU938zqYLr+8DCskN0+c4tbStPj1JVhk03gv8fngRf0oIxMUj?=
 =?us-ascii?Q?e8Ldz7CBDro9+dKmy02ZGyBo7hp650rwejf9R8wuDBk65v7qxI5u+W+VetvI?=
 =?us-ascii?Q?wzxIjISBBEXTvXDQI4vr5G1KBQncmEN08r2gxPg+8cBDw+gGE4v2YueM8jFo?=
 =?us-ascii?Q?BfSJ+pi15W13jjBYCEwY4DrrYGpjZYzBivLka1RN8mjR5scWkymAJxs+Uiqz?=
 =?us-ascii?Q?Zv5CWhEO/5uPbWFthnj5Ha3lM/K1xMqhGk0j80Bm1xifwOJwRfChINC0hnR5?=
 =?us-ascii?Q?6nGANbpvsGG/v/w0OBZydAl96d1HsD0fvEVyv6u1jinG0kT5ob8kFPnz0d4V?=
 =?us-ascii?Q?W8ML4TeeaBzUwu2QPJVVyvZCp3aL5PSCFAYgJa9XXqlBr097a47VuDSOg0K5?=
 =?us-ascii?Q?C4PFd2PjP9EF+XlfjFH/euSGMW1jr4m8dpFOLx5Bd0dMro3iAK3kF0OOQXeS?=
 =?us-ascii?Q?insqLgFtZ5YsPbyVuTcR2kkmfjH1CQxrulzRC3IsBVOppMD4DqsvRRICa2Ve?=
 =?us-ascii?Q?Mw+691rEePMIOFdLYRbsE3V/gQYJyl5Ued5x1IVTsqkqDADlp4oe5DVcTMau?=
 =?us-ascii?Q?8vJrj2XyKzJRTi9qc3RK/H0+0REC4gc22mbxgrtOouf9EmBrsn3AVEipNjMM?=
 =?us-ascii?Q?B968zr7buNLEX6+U3PcaHLc7+TNSHGoGlZ+HnAMUvHpuq3d9GmC9yXZ/Fsww?=
 =?us-ascii?Q?AMtz24YxSfbAb0Kvg/Fxsa5Ty5mnsFgygUWFEyCu9VTLzj4MoEvtVIvQYicP?=
 =?us-ascii?Q?rdyeuI3rEEK2B0pSyNUUtU6iRld3VYhULVkCr5rKd3ZqwTq8Cg2gs/GWReha?=
 =?us-ascii?Q?+T+NcO5f98Kvu3vtRsnMZty33Q+sS6q+JwVdnJdsrVQ99B47rw20E3tTw0hX?=
 =?us-ascii?Q?g/coW440RN//BfCuVXUoGqcSEY9t43H408gJkWpQk0JkbWeiY64GIibn89l4?=
 =?us-ascii?Q?qc3fLi4Q8kPQiPQ6jPqBJgWMNT0uUzB48KjNDFTzrBfylbBaXRvVglX1ChHW?=
 =?us-ascii?Q?phPXy6ooDTxwlZeBfdcdTZFmrDnLDNipInd770oC0vgeHq5l1pj/p7hJrXMi?=
 =?us-ascii?Q?+K5M4BqmSTG/SRVw1TKmuoj+P/au0rAfj/nlU+LXXW2vuz/WVPc47ZU8JDmQ?=
 =?us-ascii?Q?k2Nuxk8Dcocvb18yYjsZbT7uICR2E9DxjSP9DnaWLiYddPf2ko5ShlQHieiJ?=
 =?us-ascii?Q?S4fb6+oMW0jI4rH7XNAWo3ehyu16QYvEDOa1SuLZElUn60WvXu7xHw/n8YFN?=
 =?us-ascii?Q?tOMTQqGdgNY9/bQdjGrX?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 95f9bb0c-018f-45a9-7583-08db0ce2f2a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:21:47.5907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR17MB6027
Message-ID-Hash: Y5VYHMJTFN3QGT6D52IWH5YOUVCS5Q4X
X-Message-ID-Hash: Y5VYHMJTFN3QGT6D52IWH5YOUVCS5Q4X
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADFWB4AF2IGY6PXUJN7VSLXQDQTF5LV5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Take a pole and shove it up your ass then remove it and shove it down your throat.

So you Taste the bullshit that comes out of your mouth literally.
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:18 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

You live for people to report you go ahead and keep emailing you degenerate dumb ass
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Dumb child ass idiot
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

http://www.infradead.org/recruitment.html
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Sent: Thursday, February 9, 2023 4:15 AM
To: Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.inf
 radead.org <linux-mtd@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

On Wed, 2023-02-08 at 21:09 -0600, Rob Landley wrote:
> > Geert has suggested to wait with adding a tree source to the entry until I get my
> > own kernel.org account. I have enough GPG signatures from multiple kernel developers
> > on my GPG key, so I think it shouldn't be too difficult to qualify for an account.
>
> So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-linux
> but push to kernel.org and ask Linus to pull from there?

Yes, that's what Geert recommended.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
