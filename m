Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A799C6936D4
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F6984A;
	Sun, 12 Feb 2023 11:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F6984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676196942;
	bh=W7vnt/MBIu/UcfkFeG1B1cIoQOpU9Ly358LOAQ/AI7k=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uej0Qf9zDAwVmIeGjvY3LnIy4WTIEO2F6nNtj2hSNB25K1hIaBmf2BUWk2mot5VP1
	 a0i50o9IRBaIP33Wjf39mrZmBUb2d26A8BeQCiiSZByLdksY5OAojc/+aJqypV0Nnz
	 pMCFRLsYQf/2a+324KqvHSLlO0FhDN9iPVn8ZuP4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EE6F80527;
	Sun, 12 Feb 2023 11:14:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE80F804B0; Sun, 12 Feb 2023 11:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2081c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::81c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6785F8012A
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6785F8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=nNxpN1lg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajSm5X8AkjUuHaaulafaQhsp2V4tyusAnSd+tjRdbacenl+SDuqD9CxwndJoj8NiylsUiL031/qhMVC3G/kzRaUBS+2JfGfxUmo00bSPBmYDgp2xN0chaQkgbUeJqlFAnP9XQ1TmM9ybiDGIgY2ZMJq5oN+m3AJ9x/XLbYXdoRUqZU/PLMPqsOcvF5sppKpr61rgpppjKDtJzLseHur+SADurC1x5peXdQH3jS1MQHxLZKLJ831svrZJXad8X5LkvbO+zPla1Cp3YwdDzClnaDwT05o5Maw0HPd0ah+HkVNwHsCPUt25+dgMky//q7kglhltMboRZ7hEIbfDDTQbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVEDXR+ef5LC1NZwODtSBg+7V+aNv1JLF1Ej5e5uoTw=;
 b=UsvX+cqzUP/1K2WVEbaHyPaKEn5NPKtZnG8NkptRwEu/yIjBmLzeYQXUrPlv9bm2u53nQXQwShdyqUeGHG3+qEo2V18zSXl6OOIlsz60dGJRrw4TRGqkhgatWPetYedUmMYe6LTCuO5A/Vt+X14P5ztO5/PI2fH67y7WZeR8msx/qnyYanjL1T3TriZ9oq3Dkbw3NLTH3O3uwtZFxLb4Ev1CudImIgUzgxsPSGFUwlzgiW9o+wszLnlhvk5n2CQn3Hx4pEso484Tk9IW/pnhrTzwIoAo9MsEkRpHDcCWmEQOrZGJOAnS25HfhtiwqBzX9KhzFSMk/9Cyk2h8jH1REQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVEDXR+ef5LC1NZwODtSBg+7V+aNv1JLF1Ej5e5uoTw=;
 b=nNxpN1lgT7XZTfY+W5qlkU6Fji0BE3YClM0B1tD2eu1dPvqglupGjtWY86QxajnwzxxvSuJgHblup+tTigtBQ5TNdzmBdrNuWlIWYyvQ/hS6VvkX3KRSQH3zHI7NoU0WpK+dgV8f6qjl0sxI0XBvblIS34O1ad6eGsIbxOaSvCvVnNjzPcI3+IufkSGQJHxIBvLuLNOWWHKsxmM9wjKxGFshuDkI1GD4lTzmMgJTPzAt3xXB/OQzlO4qhGlTDJhE3BXYmqyEevMcXHD+E2rF438JSn+Q76gvkmLG6AFHiV5pzJkCaPCQfAtCkYElvhf6MU1ulyjb5LzFTpW66taHZw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MW4PR17MB4700.namprd17.prod.outlook.com (2603:10b6:303:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 10:13:45 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:13:45 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzT
Date: Sun, 12 Feb 2023 10:13:45 +0000
Message-ID: 
 <MN2PR17MB3375C10DF139D4FFA7F3F657B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
In-Reply-To: 
 <MN2PR17MB33753450B555F0E4E65D7C62B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [xfQ4NxRR6jpJCtlpiJ9OWsArudsVC0iH]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MW4PR17MB4700:EE_
x-ms-office365-filtering-correlation-id: 71c4de67-0f04-4ead-8e6f-08db0ce1d338
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IJeAmYfJ+5bDPcdSH78qkXui9AjsCGk8tWy8WN8rZuiYGj8RiqO06IqMkHdEUwOVIcb+o5OP285pt+ERUeYFzKtGhIi49IIly+ZbgQHPrdGp/OYM+EBgqrLF+gGyoUXyvYfWTwuknJJjYkSlvIvh9cArqiTbqoewC69s1bDoIoUA3yPSNUBdtt8expF+dIGr0MFwPT5JuknM8QkDpfO3DCvDmZtTmXMNO1+TSnNwR1IOFMP6+QEs92gnVWf0VgCdOFSxRMwXjcI8ULAzB/CHVbASDNy3CEnsrLukuNWP4P4wlRljaV2WZBa09SinBr59/0gsXQHfZXlxC9YW4g5HvOPRyKxdmE5ByeEaMfbF2pu4VNvnqgS9IBJ5dEf2vP67qtb0zUbQdZBtMrli9MqYCKbya59GdSpuhSu9FlcYjyWB9zPbVtTdfFGs0BM0V4enKzxzEx9rJWiHFQSlo7wcmTmbawkBb4NKCTRJVKVjE/Md2mQWaSRrnIaaAar54Re9D9BUidyUd0QLc73+LgKq+gk8pGxyaFUtcTFwRuKvGwbNy3nmdh9zGSRdkEqN0wgJbR8SEVBs0cbDanLxQovYG2ZQMkc1abEvOvY/rl5XARZGUwXJZ6tji9mJ/a1toMoSLJGPTHlY1kCMvvsizcDndeD4wqbW32/HbHF7kvLhnYA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?L4pQgORE6iVdeSuYfGgb3zGRHgvNz41fvYTyfP7BfsVFBu47xefzfmJEya?=
 =?iso-8859-1?Q?fZo0RFRB5rAViKaxpXHeRF7PObV3J/UfAkEqgk5MfxXPEBiPOH4H9TvvKe?=
 =?iso-8859-1?Q?e0OKbgGE+aCohDe+WVBcMVtL2AWA9ctg54493aI5f63AmV4P6PKuHzDTaI?=
 =?iso-8859-1?Q?doqOificn6gieSKezPmP2mLOq8VRUj9MMWXPuJaap5QrykE+kS+rohqxCZ?=
 =?iso-8859-1?Q?QBdmBa6EXiD51yNa/a4wSt4BenURe3K+4SjDQUOy7m/fQMTCEljkImyUfM?=
 =?iso-8859-1?Q?cBdKQFowwp/0ndDtKr9PnD2Qfn+LS5nF5sgQbK6+mc2gih8LBoNhx8N+o9?=
 =?iso-8859-1?Q?jGnyIsnMKtCGT4lFjYXxDb/bj6DVQzeyewfJa1Vw/evELmpJ9I/Rh58igE?=
 =?iso-8859-1?Q?MU4NbKY9rWOeqnGhTBtMcEh/pjyEc7yzryUWht/+nBOymTyXvwGyKAN1Yw?=
 =?iso-8859-1?Q?tAgM4c4MPx49ImO2e89hhu2PnSqn/XT60t6P+Um4atLFbIT37cjKDseTJY?=
 =?iso-8859-1?Q?l3P/nLDa1tvxiQr4iC/Si1OlYwGAJIXpDBvmMd7Yyvbh0Ug8/lw7xU9V3O?=
 =?iso-8859-1?Q?Mj8O7cYWyXgfCEHeYyNQZ4/MQXbO7mX3CmvELNcc5r2fWxJqu0RtNSAdDl?=
 =?iso-8859-1?Q?+BCNGIMxfZ/NNjQkaXYr70LE7UrPfYDrW9y5urG9MuaaVfG/apbtmC2FFi?=
 =?iso-8859-1?Q?vnMgbCbZwJYSc6awKVcTLy/TDDAdLE1/eCJbykwkZmQXVwvwloQruqDY6Q?=
 =?iso-8859-1?Q?BwSDv2eEGzUbTvhmA0EUCSVOEVKOHByxJPye1JfEi0rMN/BnT/55Mulv1U?=
 =?iso-8859-1?Q?Wca0Ol2HrCl00Xk98MIQbYfFVBwSLnBGtky7/uHkiuUsda5Gix7BMQJNp9?=
 =?iso-8859-1?Q?nR4qD/5mm4JWEEAbcjz2lJa/oE3iq/TCXw1ktd0dHnWwbacHF3XcuFEvd1?=
 =?iso-8859-1?Q?Yul3pJXUZ9POHG9Qna820/TDmscLHb2JB5yEPNIx/VPxY3+S3mFo/PYIEp?=
 =?iso-8859-1?Q?I4iq6TYTnhDmKre/+ousbcgoftggx7+ojk2lXx2IV1gmAGpjOEgMbN0hI+?=
 =?iso-8859-1?Q?8dZr9EMiPaCgWzwqjrvXNa2w6rrhUxdr8HYf09nGONAoGT91n2FZDmfV/8?=
 =?iso-8859-1?Q?ez8Z0r7bsYAYbrMK58vSYsSMxF+B+6JDioC9t+Rv6N3glw5x1eh+OzWvsj?=
 =?iso-8859-1?Q?EzjatTfFMtraK1CME16i+orFt0FwOjTZgUKc+nqVbxBH+QH2b/UeCW3alD?=
 =?iso-8859-1?Q?X626yFFo+RVhE1ytC1M7YTmBphxEaQRH89x0cCIq6owg33Vg1bNO6XHp++?=
 =?iso-8859-1?Q?b2rn?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71c4de67-0f04-4ead-8e6f-08db0ce1d338
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:13:45.3774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4700
Message-ID-Hash: JJ4BJLLAC2OAW4H75XP4ZXZDZ677BVPO
X-Message-ID-Hash: JJ4BJLLAC2OAW4H75XP4ZXZDZ677BVPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPXKNAHHXVUOR3GNU36QDPAVPOLXFJCB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
