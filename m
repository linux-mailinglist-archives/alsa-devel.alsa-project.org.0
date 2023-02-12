Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB66936E8
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:55:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B720829;
	Sun, 12 Feb 2023 11:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B720829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676199305;
	bh=N35eq1v/dRtnlxzz3GbiwfEVDGQj6sFaOaysQTfvLWg=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X5+8TYIT5fC+0SYM8VGdpqWw3cfhv+hx37np8pU1/m22XqEbVdPQ3p7WM+7qGhXk8
	 YFvGrcZI7u+OymsNrU3r5sKO+tdcEeKqTG7DwPes536UJ6oEHBcU/nYdRJd4DvGnq3
	 zJ0xCNN2fCcKshEWZ+cK5DeuONeArW5FgE7oy36E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0ACF8012A;
	Sun, 12 Feb 2023 11:54:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75936F804B0; Sun, 12 Feb 2023 11:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2081b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::81b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B5CDF800E4
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B5CDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=SdzpqMw+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bC2sJ9c2UCxvHfc1E0ElWND+eUxHdwEesgDNmf5ICAWR0ciIGLVgLERZ05W9dsl4Q8IXh2OttKKltTeQP9vmr/u5IMZoPVRa4u304hKZ/tmLSbbOTc0nOknccliJdHO3yP3J45TxykY+tHzsIE6vP+udI4osY9tFbyyrMRRkCYKB48SVXe3J0JSpAbEy3DPmZirqc3gTHl0BCHZ6YPBAumGY05VQL2g6QV2dSDIkn6YSNEVd7SOyO7o3UPYGMVkG7C04z1fu9PJHGgi9TI/pXV/+X/ZJ1JlpO7WyqP52H80l0zAeB/WWUUe6J2Y8jXkmVQccpI3l9fGKK3cGAnAIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzgNHMs7XfRA3jA634w0WkDYTshl0LxdOtm/hjiBL9I=;
 b=b+5kpbKEWkKO6DfTV2q5Aic2AUEWPKcwKkZf9OI7VWx66RlRFJQQy3X1AOrXcfahZJjxdU8v2BdSvsNyiywqQx00NQkj+K7cB6DfE2rQwDNHZCaAmZgx7fxwI5b2foJYEIoRqcbEiMhWxxUem/aHpCX7KkQVjiJXbkaKIxu+by4Qvh69URwSJlfG4StknwHyyOmcmBFGagz84W3PUiYxcTO4DjZT5TuS4LI1svR6Ki5fqb1Jfs9sVlRBbUQ6w3oq4dcfvpEZSJ4SJeSTop0xNDII6uQ0LnSgQFf7ng0P270JnQYCVq0cypdrxC1UU7oM0HFpFZw/9/yDW05KcpckrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzgNHMs7XfRA3jA634w0WkDYTshl0LxdOtm/hjiBL9I=;
 b=SdzpqMw+cwOXfcrUtGGXx39y2c6XPn3tEAdZ1j81NL2l4Ans/qe5X+0HolLQDPh3KDOuJe7AfSF1TnAfkEe7DwOBQwQF1cXFHYUa1rAwvmybde/Gg85cPOlHPQI1QMvdKqkUaib8EdrhE1c2c5IPUaUnqw2wj5WbDLlA9lcQlsZQiaZhy3JkB3XmmzGHFiPcUCdST6SDNlyO+mzxt38FcW+59g6U3gNwtzf1k9/7CjqzgZdIPwiw/hiEO3h63ei3GMmyOBAyWSauFnigJA2Jk7alpQ67nIK6kFZGCpgQIgqTj6yOyb6cwQWiTowAwmYexQhkCGp6j+QALEQLZP5DIw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by SJ0PR17MB5040.namprd17.prod.outlook.com (2603:10b6:a03:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 10:53:59 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:53:59 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYOAAAA4WYAACMDsgAAAvxo=
Date: Sun, 12 Feb 2023 10:53:59 +0000
Message-ID: 
 <MN2PR17MB33757F38C1966561E03C70DFB8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
x-tmn: [gDhzZlnhSPlDom2Rht0r7yZHSQlWHeF0]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|SJ0PR17MB5040:EE_
x-ms-office365-filtering-correlation-id: faff33b1-de39-4d25-8c29-08db0ce77222
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YI39iqNwf48FsyRzDmwojcF4e0iewBdddpZPjkX36ALF097cFSgzwljFhv/evXnvIols+eTZr149uOA0QYuLnl+eaj4IrhrQPXoaFhBQKF6A/LzU3YodxPLO9EAHwu/aH4Z/cvNPOnmGvch9GlaxtLg/h/o66BGIaFqBOlZyln+6Gek2Tff+KgQDVjv10q4TdJWwreGQ9kKO9xAwojeuGlZCriWkmlmCtZw8JGRROn6Tc+4ZThAwcC+NvyKod57EaXu5uttnbN0zAVMcF2mHl/Twm1XGz1sP5wKZQkpGEecnnPPIljQccEl/n7XvlX/TkzKmwvpUE+XHnI/Cmzepk5VKEyERw1WkZ4NvzfUPow9t1K2xUUV3bYVbO0ICVJsYa5PJC6JpfNozu6iwEsbcmjkrK+y+qnHwX0o6Svg35bXPZba84J2rpnkHFSyTXq4HHR8GS6871yJXkPx/xfg6QPIY00t6zAK2nwZnjuXEvnomXlnOiR1SBBZkph5v4YaGHImlzNdYY+dJn6BBNhuWFN7BAXbiNKpT7A4xlWxs5UoTb9lCpK02u9KtKJhbgvCjHHgHodlV+h6BbKlRtn9dBi1rmN3sUdNQrwVvqFbsn+BfAdFw3b5qQ9CKboEdvdwyb1zh6Ey0vJzRadQpQER/nP3QMPLfOPuRSML6sbuQRaQ=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6wJjako+KDKq2mfYE4ZuAK6g3gh65w2OUE1PQ2ttdUtTof9XWrlsg7kz?=
 =?Windows-1252?Q?uyoaSCDTWFFpIkwqpHJi+laVAniNR9a4JStdokeMo8UcAEBYnE9iep9j?=
 =?Windows-1252?Q?K6HWPqDTjDQEwWq2j5Ia0eQ+cGb3l5F9r/uDUORVWFTnUCf73+2Xdxiy?=
 =?Windows-1252?Q?9e6/yR3LEj2vwH5J5m8DPSSqTkbGBk87+nK5COahccXI3nMEP5ji3tS0?=
 =?Windows-1252?Q?lJLdFJ5hTMk/cLYNhMeP19xpju3chAHI+FCM+Z7Q5ZsPAnIJiOs57fe1?=
 =?Windows-1252?Q?juq4HayatUNIANZYvcidB/cJjFU/xMNSk7CNiXs3PsMFIK7Bk2vPkpQq?=
 =?Windows-1252?Q?n+5w2UCZEWaft97iZvtWpj0R8LZY4Xq4LUzXTHNDJqdBhq39PxqFhQD7?=
 =?Windows-1252?Q?/zLqVNdGH31vjrjO5jVRbjcwzv1h4obH1NWhiT7ZtpBEKmu9mo+bIgBl?=
 =?Windows-1252?Q?kD3kHao9T5PPbjII4x4y0qkP6Vb5ki3ykGd4TPCnP8jhljnkucV8qW84?=
 =?Windows-1252?Q?a54Nf6rkwG9VBaNjM/tVhbt41LCsLEiIAlR5xgdp0fF1osqXMwiOmyKR?=
 =?Windows-1252?Q?i14rqRSDdgmhc4mr6sYFXfsf2vgYMkfuy/FszmpAg+4ylQEVRK6NcQ/T?=
 =?Windows-1252?Q?t4tSI1Ekf34OYglZzH+pT0J8XNDW0o2csoqd1bRLkIOGMN0TbRiPJ1/r?=
 =?Windows-1252?Q?UcKtz/oNaLIF7GNwVxrFkQnJ5hnwsN6oExjUMzdaWPlrnkFQF0FWNsIm?=
 =?Windows-1252?Q?qXSVX/za05d5td3HMpbGkq1Jx+xc6WllGKKSiKIeVeLch61JlTemZvmw?=
 =?Windows-1252?Q?cIw+ZnXkockG3YJxLRGt7znv5jty1VYLnqbNykewBsP2zZEq3UIXVSCT?=
 =?Windows-1252?Q?14k3KW6Sbri0uuIfPMetdDOAMUUpLTCewN/aE+VCvXEZrU29l+TYFJWo?=
 =?Windows-1252?Q?5YcrjpMtHFmoPjqVH0oFype9tpoAAwn/D/S56hOPKHReDGXU0tt3qo8P?=
 =?Windows-1252?Q?u4LC96EjaAE7EvfPW4ZhzCMY2RcFkcuDLK8bo/RZ4wGOm3NE/+U0+t8P?=
 =?Windows-1252?Q?1ejC3O0fqTRvL4LuHs49Q4GfAkFyFe+IOCZ32xGgZAa9vTzlORmG4jSm?=
 =?Windows-1252?Q?i60WMNOZsjt22gF+LxinKT1j85sfA+eZmqnKXXw5B0ooe7WqbkHI24Ke?=
 =?Windows-1252?Q?De5lAurWqIZSbrEgjOT8kzREOOm1ED7v55YzmXnKUS8A23SBzDvwKnn8?=
 =?Windows-1252?Q?JUqzeSpmfAbRqrEMSZuBzMu4hDv4ooldHShP1K26/KXB7J4f+HgSma5o?=
 =?Windows-1252?Q?pjf/oKTGn4IDVKKObs9Tbav/+7PC7fsph1079gnfq3Rtjdwv?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 faff33b1-de39-4d25-8c29-08db0ce77222
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:53:59.4433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5040
Message-ID-Hash: JZXE7MXKRL4NTRN32QULUVSDOOVYIDHZ
X-Message-ID-Hash: JZXE7MXKRL4NTRN32QULUVSDOOVYIDHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMF32GCXKHECGA2R7KTCREECYWF3XFGE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Go ahead keep having that conversation your shit is going to be shit down r=
eal soon. Y=92all are the reason women get abortions and I hope they keep g=
etting them:
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
