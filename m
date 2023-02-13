Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8A694D32
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECBA483A;
	Mon, 13 Feb 2023 17:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECBA483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676306823;
	bh=tZki1xdE8Z89wK20F8RafUM43rFciFjfbi2cO/hD3So=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HvWaAP8McIuVMYEZ6DTabgolcW5s2hGT44+V0YH36NPkkZ7cbsFbVf2FkVwJ47JoN
	 UgA1j7IR5jOylg18BHRcfFMvogV/dEJRT4X60om35ik3JOEvzxqLUl3Un2B0CfmUZ0
	 fA8Hwgpgdmm4rlbupMXKADMl2qNLV9Xa73GSnLxE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C97F80051;
	Mon, 13 Feb 2023 17:46:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E260F804B4; Mon, 13 Feb 2023 17:46:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2080d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::80d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 437B5F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437B5F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=utN78DhL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFk07U7vH+KF+Z9403YLJGv4/T7JGju7M4eImJkAydJTNGyVGVzijKpcn4pw1XC/N7P0cgWhLK7rxwj5h5KcpBLLDMMt3nJ/TvEbVe6aeELlnEUcD1BDXGAeFB8/46IKc6H1BJVWcQPwatC40B1pTLJEey4JbwwfPksFzHWAFLFIzvj/bolAdsnmhmPR2Kg3NjdAcolkrWvx5RF17ZuvzQhBUdn6UGe0B3/4ZXEVix/tAKTjFDQtMlaEDr9r06vMwVk61IbeCmPebv8q5MUy/pHHEYrvb+FOC9y2L5DRIY+ZU5v0nBZ9WJPEzxWiXgeMOvrLgTCPUdFzmLw8/KMdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4OaXpYkL8+vAv4ATNblajUKMrVi0olBWAms0mmzDxE=;
 b=ATViC0epB/X7ci3cdc/zgsqgU5KcMG3RkUdbX/y6xpdOR0IGvZ1Secjq3IeQUgNe1aZGAGkMXDOEWFjsraOsJiyFfvU1hMSIqC843WnKIkRMjG9ksl/0vyEQGJo4ljGt0j/WKb9jT34WU7QLU2Ckp8c8rOVaC97KE7sc6rUcIPkaZSk3NRPnnMIs51gTZoyfLz8U8Xh7fMFxry5QSzXI+px8igF2syJWl9/rqNSBDYOcXYMDvRUfqtuVU1HeKuitxNYU2z69p9tQwv2XBQ0ZGlAK6X0LAaQJiCghAxZ6V0P/CcO71XWY52G/JIDx9dnwUnkL7NEeyXwL0Dqh5raIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4OaXpYkL8+vAv4ATNblajUKMrVi0olBWAms0mmzDxE=;
 b=utN78DhLSsC5A8buSEseqiJ7pImY7/9fWUaNMFNG7ewWTGD97L3OAEceO0CpvLR8CuHm603kWuFQbCCYy9qcVf2t+ORfFsQDNyMVUolFQh5HiYJ+Z4KMgECjf/NPfTeerCT8QVrGTGlb3WFCejSBvawC9p+x+pO0vBOYhLFlN1rLX5ihrgNgjF8Y+L1bDDbrs41GeZj6PtyxjQ5X8lJMWNtylcwkzfrDZVE72s5Drh1faaRsSJjjFEVGlhRfNWrKrYYdGaYXOC01NoYoyZQi9mhPML3xWhhHvxcbTJqoC5wYoIYpPvlIRHBC7lNU90DEza+hnguMIIgoZA7TV5uruA==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by DM4PR17MB6184.namprd17.prod.outlook.com (2603:10b6:8:8e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 16:45:50 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 16:45:50 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stephen Rothwell
	<sfr@canb.auug.org.au>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: AQHZN58k/f73IBbK60aG0mP3da8Tfq684rQAgAABooCABBoPgIAMI10AgAAEQNE=
Date: Mon, 13 Feb 2023 16:45:50 +0000
Message-ID: 
 <MN2PR17MB3375307520C2337FD275B626B8DD9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
	 <20230203083037.GA30738@lst.de> <20230206100856.603a0f8f@canb.auug.org.au>
 <dbda1f6e1c280c13d963ad6e7f68a853a7741199.camel@physik.fu-berlin.de>
In-Reply-To: 
 <dbda1f6e1c280c13d963ad6e7f68a853a7741199.camel@physik.fu-berlin.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: 
 [BjuLSR5SvRk55xrxUigDqi/i+ks1C/imys3PAubfBOvUDDV77GF84IO3Ck2fPcGp36A09yoU4+k=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|DM4PR17MB6184:EE_
x-ms-office365-filtering-correlation-id: 3fa8a3a4-1824-4707-5d3e-08db0de1c385
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UOJreUlO2/vpU/t/P1HTykfr20bhrW8nnt+wTSaa4NuVXqehxPDwT+clGk3yPmmAutY3bvl6BJ/fq2BKtsYGIo2Mcy7TvEFhAVgHH3ZDFHlnDsr5MxzjpsADC+1K99y+QDKW/dLJYm4qLeIxcXy66YDfedz/zrbi68UQH5arxsp+CEUTvL/fc7IoEGPkuYowPbc23UC3sHk4ZRJ+iHCtowS4lUSZIR0HbtwtMZMNJVCvvD97ISF1XKQUDXx6M1SxiuZjn7kC4s90rHCYONW2x18TJw0np66xo6QbYNhbNftJLqslWiJuGazmMbHQIBzHSUGrEojToTKV8Vn6BLqYUspOr7kV1DHwDzy3h9ehLmvTwRdK4TZhrCVUWP+AHJeYvqq0VbxDcx+w3XqS4MaH/66d2Y2fRAPRtitqUhFEhcpxAhDjSuC3uDjKV/h6wIH+6RYuKJyKOs8fBg97ClDvfk/xyKBpw0ODRhcl/UdxV25vaEwL+FBt83+Rw1UeN5IBYavC+AvoX5eyC1nyLfoinyKTlJ+WEvVBuF6Sy6o+EdvXptzutT/1nW4b50B5eRDLJwpOUl1DaqHNf/HpvgkmFi6wuUmLNTJjQSMTTXBFj04gdRDX6oE3Rub+u0EhyZatgMeNwEGxx/EEgoJBeD7a4E+pYpQ1XDNOAMjPM7WoedE=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?7f43EiPFkkZrYxTmxVkOc3zjkfZ3bm1/7N0QWoQ55H+HRwpBdOrlL/oU?=
 =?Windows-1252?Q?Nfd0DYh1gzxRYqRkxz9rZRYZL/UyLa1Iom8UiOe+VLy1YCOGYRiL+Arp?=
 =?Windows-1252?Q?0XRQlea5miYcm7aHD18erkEOQobwD5EI+BnLKBd1B5sOYixzWt0va8Xc?=
 =?Windows-1252?Q?aqyo3sw/L/3JcdGymtrbNK/yfQ11nVHZyB0lEfzC6p45HyvTDygZTIB+?=
 =?Windows-1252?Q?Ko4TFJCPDfJfWwJ7cMCb+gvkG7sSWq6CYwdFgU9XQcXF8+Qav/6LnLsc?=
 =?Windows-1252?Q?No5rUenhixko5ZIaAsRld9NsN8wJD/2rQ5UIR9A65xFUvbTNjiCAHWPZ?=
 =?Windows-1252?Q?foZ5j9rhCI5Eh36SeSFH+nsbPyjy9ANqQRFSr0Sz+16TfUGLJuawnoDr?=
 =?Windows-1252?Q?etORBduMa/LtmT4j2va0wr9nKljPXrP0XRM1h2lRqWkvmN+JhoE3c1NJ?=
 =?Windows-1252?Q?5csW/wJNI+Z7Jl0RTWBtnQvDkQrrVMWSHiZK6zhU5zIwGp6glPfyMSos?=
 =?Windows-1252?Q?aeDcmlskYmcYaUXhDgkIxX2RRq2QXYgefqWHUSU+lESJSVwoKZGtqKV5?=
 =?Windows-1252?Q?kcvIcaeGNue5hbzCky4Zd5CAmNugwbWkyaxpAjIC0f5+lW3gl3EkFicj?=
 =?Windows-1252?Q?hKSd0+DI4XlKNLIGsykymkGx7fPQzFhuRYrl4dfnI1YynTMvFtFg5MCt?=
 =?Windows-1252?Q?DZ4QXpPrrW/FF/cUyLEoK3LSbYIg5aZ4YYsnhqZ+G0Jw76RwJy0tiLTg?=
 =?Windows-1252?Q?Mc1OIl/VZ7+0ww7YGq49WPAYzdHrQ17vHcaTMcfvetVjjdqFDx6ipvcB?=
 =?Windows-1252?Q?GxpjPZQECd6qNy6a0nkSjBx3jZihTTW6XInDXvdvBhfCFKS7ji+wosqK?=
 =?Windows-1252?Q?EqG1T8XbBaZIZVOaUbdaFlLh7eWZlfGQ5J1V1Gad6s447NiZrUDzUrE3?=
 =?Windows-1252?Q?rAYdoFIb7ieVy+85XYMKKQRbe8Lu/BYpM/jx+xwSp00dySXF60Dxn41s?=
 =?Windows-1252?Q?et5YdK7IeF1SJ9je5QobCNAS87EjUlUCwfmNUiI2KYY8eEnon/8y+fiE?=
 =?Windows-1252?Q?oTmHPsTPGaS49wPSU9RvAKKbFX3dd68Iz73DZgd+RGmLnhrtJ1R5zp2U?=
 =?Windows-1252?Q?FSVHLA/sgOZoaT1mmQAqQVQ87bgFg4BAImQ10cDL9aaBPV719C3bvREg?=
 =?Windows-1252?Q?qO4Lj4srFhyY3Fx45gisiZo8Az5eY0wSfZEVdGe8TZk2s0f5CSb8tjax?=
 =?Windows-1252?Q?z/yS5F52psCJjtPKiRbpjCilZvQL7U8eoWQ3dqNqHdW1MQ68NXYzc7SR?=
 =?Windows-1252?Q?b9G8/e3MT4DskXXqbBjE20fKvVd1RgUmQkA3ZBCcV5bEYrB/2+9NMMQd?=
 =?Windows-1252?Q?KcqsGlc46Ellhx54KbhVSQHEsjxV9lMuBYubIkJqbu0jSSC7xd/MF2Yz?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fa8a3a4-1824-4707-5d3e-08db0de1c385
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 16:45:50.2000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR17MB6184
Message-ID-Hash: QWKWWRA4YAHWP7FWDMY7MJ6HSCBRDYEZ
X-Message-ID-Hash: QWKWWRA4YAHWP7FWDMY7MJ6HSCBRDYEZ
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="Windows-1252"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Christoph Hellwig <hch@lst.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6HQY2WJCOZ4EUENTVODZE2DJJTSADSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey dipshit this ain=92t Steve motherfucker wrong fucking inbox I told the =
FBI about y=92all stupid asses
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of John P=
aul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Sent: Monday, February 13, 2023 11:30 AM
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>; Yoshinori Sato <ysato@users.sourceforge=
.jp>; Rich Felker <dalias@libc.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kr=
oah-Hartman <gregkh@linuxfoundation.org>; Laurent Pinchart <laurent.pinchar=
t@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.co=
m>; Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.=
org <linux-kernel@vger.kernel.org>; linux-watchdog@vger.kernel.org <linux-w=
atchdog@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kerne=
l.org>; linux-arch@vger.kernel.org <linux-arch@vger.kernel.org>; dmaengine@=
vger.kernel.org <dmaengine@vger.kernel.org>; dri-devel@lists.freedesktop.or=
g <dri-devel@lists.freedesktop.org>; linux-renesas-soc@vger.kernel.org <lin=
ux-renesas-soc@vger.kernel.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.=
kernel.org>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; lin=
ux-media@vger.kernel.org <linux-media@vger.kernel.org>; linux-mmc@vger.kern=
el.org <linux-mmc@vger.kernel.org>; linux-mtd@lists.infradead.org <linux-mt=
d@lists.infradead.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; li=
nux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-rtc@vger.kerne=
l.org <linux-rtc@vger.kernel.org>; linux-spi@vger.kernel.org <linux-spi@vge=
r.kernel.org>; linux-serial@vger.kernel.org <linux-serial@vger.kernel.org>;=
 linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>; linux-fbdev@vger.ke=
rnel.org <linux-fbdev@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-d=
evel@alsa-project.org>; linux-sh@vger.kernel.org <linux-sh@vger.kernel.org>
Subject: Re: remove arch/sh

Hi Steve!

On Mon, 2023-02-06 at 10:08 +1100, Stephen Rothwell wrote:
> Hi,
>
> On Fri, 3 Feb 2023 09:30:37 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wro=
te:
> > > Since this is my very first time stepping up as a kernel maintainer, =
I was hoping
> > > to get some pointers on what to do to make this happen.
> > >
> > > So far, we have set up a new kernel tree and I have set up a local de=
velopment and
> > > test environment for SH kernels using my SH7785LCR board as the targe=
t platform.
> > >
> > > Do I just need to send a patch asking to change the corresponding ent=
ry in the
> > > MAINTAINERS file?
> >
> > I'm not sure a there is a document, but:
> >
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
>
> And by "Stephen", Christoph means me.  When you are ready, please send
> me a request to include your tree/branch in linux-next (usually the
> branch is called something like "for-next" or just "next") telling me
> the git URL, and the contacts I should send email to if there are
> conflicts/build issues with the branch.  I will then fetch the branch
> every time I create a new linux-next release (most work days), so all
> you need to do is update that branch each time you are ready to publish
> more commits.

I'm in the MAINTAINERS now in Linus' tree. I have requested a kernel.org
account now and will hopefully have my trees set up later this week.

I'll let you know about the URLs as soon as possible.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
