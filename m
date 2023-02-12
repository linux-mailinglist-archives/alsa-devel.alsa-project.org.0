Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B36936E9
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FF88839;
	Sun, 12 Feb 2023 11:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FF88839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676199356;
	bh=l/Hw88/uygKt8gco3VS8ByxiHm/FUqGr6L1ORxHonQQ=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GUEwFt30iG2HB2PpTONCUW9VtNP6wbqnV3uatg88mMbTFUmPiTHHIJpKDW9fRlnE+
	 756+lLlApCEwpet3uILk28/Y4PNPdu4ontyRaoOYqbBsVdvsNYum79jukpAGg9BF9H
	 9Zn3qpHNTgIBSceImxC9kmwF+EzlzF5Ee7/gYDpo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CF0F804DA;
	Sun, 12 Feb 2023 11:54:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5BA2F804F2; Sun, 12 Feb 2023 11:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10acsn20806.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::806])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626E9F804D6
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:54:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626E9F804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VOjotIbD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZUP5u/g33scHkJJpwuaUDTOdgJ2okWTfCqwwUzXW8lz2I+r+Fzl0X6eMCXujB87EfnDaY/N2hms0Eom9p+kRw8FPW8f+T7qioH7yavv6BbsGsFHxdaSQFveqi6uKFfQY+/J8G5X1aXbOPBvZRFVdDy+ntr3Vxx0RKZ+mWLuSQ8sXIIg7Gb4fxbdNxWvDDo1GDXcOo2wOEaih9jtMpNLKevAy5hzZi48w+NoUomzCApFmFdhxeUKUbjt0vlu5WyE27WDyOP8fadsAhrj/WwNbmuRLjq6BSpG2QCYefHHjyb/TqDqFTUm117nz4qlA4yv82TNMXGAP71X4oukozx/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uXG8Zgn7I3K0qdriIIdcLlUUTINy7vepRaUDE0ttwg=;
 b=fh8bKddyNket5zvj2yKqeFvPLVmdmYmEkGnzo3ouS6qId4m3xnuHldrsM+hZbc0QKcqVvmI33hnzTsxPiFMJXdB7WqDYjGbDAPjkbKkzDeyg+sY8FoVNwNzTxPJpBi+AiILkQw+FUXd+gqAuB/rfiqzxE927JUS3tZJt5Fw4+g0OrP4KJnKJ5iwUXOz5ZFR4FpJ8mPxczVBBZqd2BfCRfPz5EHfGhdt7NTBffO3UgFUOAtFAZMo3UR2ub+oFsD1tSI5K137q3Xtk7dGY6O+Yzz4yihLe8IEpLVcY1X0t1FbdcR8oKUwyvxVrcHuFqrNq1UC5ATZGnfSpSYzYGhxaDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uXG8Zgn7I3K0qdriIIdcLlUUTINy7vepRaUDE0ttwg=;
 b=VOjotIbDy1KytxuqKOr9FoR8s6fPRLhT1dKNkQJjBybnz4xeqZIvNlpoOX795uVNO9XtfWWDKtJtqoBCJwom5efDZxqNnK7z242uPljueqnC1byx/ilprNpAvwpXz2jN4IdZB205qQb9E5/NDeIqTNChCcgJSRqdm9Mvzbitg7qmn9GtDUSh7FdXCkq3BEJNyTE5IJ69P3a5TQkdL0Oyy2L0nQoQ7c+okk68JPEiZLqDFxoSzaA8yAAQfIhgfH3lFTa70vL1WecZU3RxbhNMtnH9/2zSxLvjOksa5g+L1vq7WtSYDj/JXJEePrg84E3+WAh1UPdOurUg1iUImhD3Pg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by SJ0PR17MB5040.namprd17.prod.outlook.com (2603:10b6:a03:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 10:54:22 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:54:22 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYOAAAA4WYAACMDsgAAA7Ns=
Date: Sun, 12 Feb 2023 10:54:22 +0000
Message-ID: 
 <MN2PR17MB3375768C0D423742CF868A81B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
 <MN2PR17MB33759663CAD3BCAB5D0987C0B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB3375048A36FAB21FF0CB8C57B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: 
 <MN2PR17MB3375048A36FAB21FF0CB8C57B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [38xUbbulaLQfEGyr9C4uJd8NBmVsCZUB]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|SJ0PR17MB5040:EE_
x-ms-office365-filtering-correlation-id: 2493d032-6e1c-4ce4-a92d-08db0ce77fb1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9LtKZh7evM3kDnjLN9N87Wlx1E0mMfy4Kx7zJxEJ3iEiUhsZ3W+F17c7Lz2CJ9j2y0gO3u9UHyZaNpWKNKs+wAaGCLT1xiCLOFH1SGCFv1wZYhtmu+mJR/4asLV3KF3zP619itX+BMsTvEp4sgRmZZSS5/Ded2yT9ZVcu1/vrtWPfzYCdsWbjI1sZnfBzfo6pBghUH7epcxOPu/sIJp9ZG9DQG6vk0BWrUQQoyl2PYZBw9Y2tYLEc7WJrHZ2kvvELKNqAjyooVYiUI1TLcrZyIlaMbWP+tte7hU8W8b2zKPtQcXgMq4xGxyk4D+gPyPuPBH5aNJErqzR8flkl4GwDXsOc+pfApsnu3ERW+PiSDC98NVTKiTjp2vzGsWH1LXhoCiwfOZTkYudp4CyZExVpBuQHiF8uZxBXZKIPJ0/fWPA5V41b679mzd9MeXtuaM/TRud97KPx9M+CHnMD6hktCtwdrtwBKUbCTBYnBvzy8v2v3k0mq62w5cTEEaOJYCprNQDAb7cDH+DBXvK8OzJURxA5rgB2ificcnYYON91hZZWwu0ogljt40sIfGGJgZ4XVPCD5eKsEFdH/+I8qnoQcURI0i8DSegsIKqlE6qU9caQdUYGpNz4SIw7DR+LxdvOL28ej3lmMlF97K9CZD2GaYgc83nf3SEbmG3UccLFhM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?AB8Gre4AhHYtYohZKsFM1CpvsOn5puBVMN7vQ/0lww4i1Y0mo8I+Bkc+r9?=
 =?iso-8859-1?Q?3KtefC6Tgw49PYN2ltaBIWtdXN/kGu+RI7ZJTTRr1eKM0nZhaGmoEYckIY?=
 =?iso-8859-1?Q?bgVOUnq2PAxNcMIJn9DX3hc0SAYrEz7YXfKpmqRliRJPcKr2NTgT4SoJit?=
 =?iso-8859-1?Q?bRf6bbdouyX8jZ33NC8NI/oEbol3fijFh6CTvbtLudeklT3wyDGNsQpaNg?=
 =?iso-8859-1?Q?WGaIl/2yNAzlVZpHwFiN44kcUaOZu6Xjg5FIWeTbPH6cT5XfA+pZmPpdzI?=
 =?iso-8859-1?Q?5Zg0P3OPkFLm7abAs92Ay8Qir+4KQOSNVNldWpo7a0iRZ/i9qU6FjkCuw9?=
 =?iso-8859-1?Q?XQkp6LfCokpA3bQyO8KjIYPSlfeAP0OF6egJLhpXeo0vEZ1lj3wPK/LHfc?=
 =?iso-8859-1?Q?0LeANejwPrdhL43cUBjN1Khy0HCcziC7BV9wJgijFiuOFkOHuzCezWjVWj?=
 =?iso-8859-1?Q?KCHWXkFSh3mPxnbcYV7LSNad1OZBqzdLaSGtrDcZci2FK08EYvvbOpZOU5?=
 =?iso-8859-1?Q?KEImQ6nU7ltnAZ5ucS4QMZAVZM6IK9tppUBw95sXD9aJC5omRwlvQg7vVq?=
 =?iso-8859-1?Q?myHwaoLJuZ59vLTspjY7WuCC/3580fjr8szlOdjuap3TWfR3FqI7tXtytv?=
 =?iso-8859-1?Q?zJz0obkYjpMCUcSRyDJPkkMrJIQpf1ktqhEXdCw1sNRCxkMsi6SI6DM+bI?=
 =?iso-8859-1?Q?nnunf339f7bkgNDoZvtHHziVod7jGuGhpT7pDmg1/YbJmKy1sLjnO8/Ems?=
 =?iso-8859-1?Q?Q1dtRQGP21Gs7AiFRBDmBHR0Dj2rKhYkAQUILDCBmv7vVEGa1qFkdo6N+V?=
 =?iso-8859-1?Q?8HgOhGjfyvmnOSstvyV45nUG7tbJYVeeGuHNkrRhj9wJJxV7uO1fGT1EVk?=
 =?iso-8859-1?Q?2y4C2nQxbO7X4LiqHfQDeUM/prZlRli/JsFx0Ut6ptapXSIturVdJRburc?=
 =?iso-8859-1?Q?avePU6dypJYzLP/vQy2xODL3xHeK2nuk39uMbqMBJSB0OaYDkwN64vK5Yw?=
 =?iso-8859-1?Q?LD/opeLQNHl2HBMHs2hxeGtENenI/XDCnVOeeAmVcFEs0EOdyD+FCyjWew?=
 =?iso-8859-1?Q?P5lMYrlpARsmVkLxbrjhxQRpJR8X6zYFHCGkaBIYdtvwbZIwdPmAuRvXNH?=
 =?iso-8859-1?Q?SmBhW18oFbFIpOD9//loQJd1WRCu2AwvaSIq2Sr4t4o8lKwvFlpJZUDPwW?=
 =?iso-8859-1?Q?h+qcGVIfO+bpIdAa8jx7I72YmH+8tUxE5F7elUq5sWxDMNSiez+Fwepkpf?=
 =?iso-8859-1?Q?XqnJGuNvZSocIqV1rLtb7VLO160do0tc/AP/dnDOMaNQmIt3tKROlwT44T?=
 =?iso-8859-1?Q?M2d2?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2493d032-6e1c-4ce4-a92d-08db0ce77fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:54:22.1916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5040
Message-ID-Hash: 2EGJPTWFKUHWLQ6OVQJEHPDXHK6NGGJL
X-Message-ID-Hash: 2EGJPTWFKUHWLQ6OVQJEHPDXHK6NGGJL
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZBSPHSV3CAD4CJOWBLMTPCQMT5NHDEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DUMB ASS you commit crimes just so people can have jobs
________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:51 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Emmmmm maybe y'all stupid asses have been reported now you little sick havi=
ng dipshit.


________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Sunday, February 12, 2023 5:21 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh


Take a pole and shove it up your ass then remove it and shove it down your =
throat.

So you Taste the bullshit that comes out of your mouth literally.
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:18 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

You live for people to report you go ahead and keep emailing you degenerate=
 dumb ass
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Dumb child ass idiot
________________________________
From: Vanessa Page
Sent: Sunday, February 12, 2023 5:13 AM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>; Rob Landley <=
rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Christoph Hellwig <=
hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

http://www.infradead.org/recruitment.html
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of John P=
aul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Sent: Thursday, February 9, 2023 4:15 AM
To: Rob Landley <rob@landley.net>; Randy Dunlap <rdunlap@infradead.org>; Ch=
ristoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bing=
ham <kieran.bingham+renesas@ideasonboard.com>; Geert Uytterhoeven <geert+re=
nesas@glider.be>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.or=
g>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arch@vger.kernel.o=
rg <linux-arch@vger.kernel.org>; dmaengine@vger.kernel.org <dmaengine@vger.=
kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>;=
 linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; linux-input@vger.ke=
rnel.org <linux-input@vger.kernel.org>; linux-media@vger.kernel.org <linux-=
media@vger.kernel.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.or=
g>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; netdev@v=
ger.kernel.org <netdev@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-=
gpio@vger.kernel.org>; linux-rtc@vger.kernel.org <linux-rtc@vger.kernel.org=
>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-serial@vger=
.kernel.org <linux-serial@vger.kernel.org>; linux-usb@vger.kernel.org <linu=
x-usb@vger.kernel.org>; linux-fbdev@vger.kernel.org <linux-fbdev@vger.kerne=
l.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sh=
@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

On Wed, 2023-02-08 at 21:09 -0600, Rob Landley wrote:
> > Geert has suggested to wait with adding a tree source to the entry unti=
l I get my
> > own kernel.org account. I have enough GPG signatures from multiple kern=
el developers
> > on my GPG key, so I think it shouldn't be too difficult to qualify for =
an account.
>
> So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-=
linux
> but push to kernel.org and ask Linus to pull from there?

Yes, that's what Geert recommended.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546<tel:2956%209546>  0006 7426<tel:0006%=
207426> 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
