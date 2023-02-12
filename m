Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1686936D8
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EFE982E;
	Sun, 12 Feb 2023 11:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EFE982E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676197201;
	bh=gPr1RxHtugBQSQm7pvWCXBRVg/9KLaY0pye7H+6vieE=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F7ff5mUHGsauYIl2GWJwn4QLvEODkDScv4HcFWCoZW3mdC0Rupz8ToHu1IcHr+s1r
	 FxTAYmditR5tvAOKWY0O5GYHG9doZVHxB9dN0hkF3nUNAl+jTikxCbJV3McKLDk/hF
	 LsP7pxj1TW/7duPEeq8csIz8lkfUIWYR+qA38AgU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF06F8012A;
	Sun, 12 Feb 2023 11:19:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4DEBF804B0; Sun, 12 Feb 2023 11:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2080f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::80f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67320F8001E
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67320F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=XrhxmrSl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTLPinWf8oV864Hv0i9BGjwmvH+Uh/DmUXSwuWoAcgYj7CbjFqtHkoy5mE4ClQ2pAIYAv4V1mOoXDPYxFjuSBbit4srdIJDgoGHP6a7fOhoNPU2tK+lEiKqeRjXBiIzbRGF6l3q+OHeZIU4fkqp23DLR3/VMx69XHO/RN9SUvdieebMXuZQMGRnK0J8jblSH0SBX8OqKXuFZo9OUEiL5/IpiXCQYNxsFq/YBcqxgJ/5xrtdgU7oOQEthZzCvIL7cr5vWPioMYeJDvFPBW9HMIjLh2IXlfSoXskjFc/iuIVVVYlVdWos23pxLZFVNb1w6k3FfiPWW3spkxMm+w02BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8lGDYN68TCodO1t7AcMXTFHUyNHe36DR3TBffuE56M=;
 b=c8FEIZAj64cJY+hdaFBccPQm2RKj1vOnc9XFRrqfxxKEk1QxyAVNOd7ZKKXu6reDzHZgetMEzkvFoZjx5u5mIrO++FT+m7XWDLkR6TkoVYVdfG366ct/SIrE5ybhFIGlW/AaoJvRhBQc4jR1h4n5KYRQV/Qv5NrqP6JSGS0DR4FyIir6Xiq5wuDwrU+ubcT4WQP7z5QyPzZHXKYbmvdqK25MkgvHRgiJRt7MOEireKT79RBic+DWYipq2bg56a/Oj5+bKgRDLjEcso+WbTmTmxXUnDyrWAD2xq5qG0FauuD6DcQ1mViCMK2P/ZfpE0yfpRPt5BkyERee6I2vArCU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8lGDYN68TCodO1t7AcMXTFHUyNHe36DR3TBffuE56M=;
 b=XrhxmrSlEoG+hUYuBIT0AatjbqMgZx+NofIzNoUJxNPhf9dnZNgiKZee/XyUpDhu/s0zi3NRbOWhjEOYmuy/axvTiTNC/YVDiLl6706N0N7mkDttsdHatwkb3Dtn2+gWu/w2wUv1HDNEaGr9kdOZ9qJO4XlAsibgydL9msDziTi4CQWYzwttxcfscf1/MokCHsFTQavuBYXoWoL1Jt3XPbSMeWdRy0zktb5Zwxp3lMlyNWnbZBGc3vo9fDo4pGqX4xOhOh0ksBpHPAHem6Yz+xri34l+0SW04uNw99TML/d/ntT8+glg9ogtVC1trgdqpXHAO2RhTwqg1/q8SFbkiw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by IA1PR17MB6027.namprd17.prod.outlook.com (2603:10b6:208:389::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sun, 12 Feb
 2023 10:18:58 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:18:58 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2oAAABzTgAABdYM=
Date: Sun, 12 Feb 2023 10:18:58 +0000
Message-ID: 
 <MN2PR17MB33754A3835C945B57B1FDCCBB8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
In-Reply-To: 
 <MN2PR17MB3375C10DF139D4FFA7F3F657B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [EdGO4mdh1vRurDf7qARtfBzquN2p/XB/]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|IA1PR17MB6027:EE_
x-ms-office365-filtering-correlation-id: a319cafd-542b-43e2-9645-08db0ce28dd5
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pag+6UQ7OPw0BtfVnMIaQiHOMU5iegMMN3PDY9eSKcMZr9/xM31+BB7KFo/h3LGu91eaA7ffu0wXGrziYIBEdAfVuM0TJEVJqVb+MxIUwjGvixGB9/LjZTZTaOJ5xnr4fqgY6L8zVVJWumUpTBBriBGATvIr5KKwckED4kpRU1t9tBNoAFsmPj8/JR73ail1QDhJFJNEM7zPHBVIKJ69jZUc7Bam2lIWWdjGXlQHMzhYvESioPvoR1zB4Qg2q2HzBEqmWrxIc41uA0T6Eik5j5FEW59edSuSnUSnZ3eJ5LO8EBS9cK4CMAbOFPizA/soC/oDBu9qitwOicUBHiCr5IwSj//KCqzOL1szDtv28pbDVCvjggTWDBHIC9A9HaIhkNcx/rt+vYqWbn7QtmJY4p/K3zGYNgTQOz3j4OP4IwIRtJthCodyAgL1tHMLSHz8wXKacEAB1KLkTVMPVBQVHvE0JR6mNjs7LBjRtVy+KWw66TpdBZduqB6ZihlHWkHvFXyIimMNDT0Yk63lMs99VfvUkZu+0sE1Heoq1h9AZDPwVmxT/5dCUzqf0Jil3XunMgTHrhw7LORGFI79o9k9Hmet+AS3MIIanB1VMUBeff9M5ISMoG+UjuRYlXZNxgWVDcYUPcM2Om19s8aGRFDI4CoJ/H27Ecve8JPozCRfn80=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kBwwYkuJa+BPtl37FEy/yiTkfUL35JG+RbA9RuWWYi9EKKL8iR1a/zny3q?=
 =?iso-8859-1?Q?gIiRbZgn6xNZLCoLWj+jYoVHWkYQG1awFqqOS49Lj4NVVfFYKCM6sGmSuX?=
 =?iso-8859-1?Q?VteR/SQwGpoczFezKP5uZIgCm9NNSRY31Bsl3aGXirqmf5YG71dVMzkGDz?=
 =?iso-8859-1?Q?RG+yjJLlyEZTWHOoCGZcd+TGPU3XlNEG0RpN4oka6O/x7sjByhrcEu5m/Q?=
 =?iso-8859-1?Q?2Tf6Qu06hzJdBDIG+wYpMOxFu7lKeaRlaA8SmKrc5yy7yE0pkYadtE/x/K?=
 =?iso-8859-1?Q?bTqGtY4tDm3ZSjN4e2sXDrVW6rgFlg2LiZ4JFdxMEvVD4oEsjOcb10vVOu?=
 =?iso-8859-1?Q?hah4ALeCdJ/+bpSh9/RtYAhJ4xKe3bdTVtz7uAHpSKTZSF6GIX+iSs/oi7?=
 =?iso-8859-1?Q?VWSrc8r/BAWl7sH56q+8neZO7xs2tlIwTbSQ5fgRokHlMgCXZXzvOaCcdE?=
 =?iso-8859-1?Q?tHIzcppKoJtyWJxEuVfd4GW5l9am0SMIlR4b33ZyI473qrMG+ZaA7ELEIC?=
 =?iso-8859-1?Q?5BIaqZnqvYizcSyvxglQWgWMa2ZZHdcQgzB+7VBnILwFwE0ntRgy1XRmj9?=
 =?iso-8859-1?Q?b1S4j1rzz2bP1ofs2YAjewsBXJ5HH8lMUiWrDvjx14bZL9ljox82C01r7i?=
 =?iso-8859-1?Q?zktpbf1/0RPQNd6wIjT/UnpPX4ktd8ZzmXpx3UKieCOvajc7e35pKi5SEn?=
 =?iso-8859-1?Q?MGoHe6iBVluz3dM0ITIlPVcVrBNW/stky0y0orSOo51zGGE9tzuh7Wm5Vy?=
 =?iso-8859-1?Q?q1q+rzg3/RaEp0B+OtFuMQQHdaiXJrGOI2SQ7xqyiMyrcMp/dE6NFFvmyR?=
 =?iso-8859-1?Q?tAHnkRPkebOc2xkyP7SXM8KD1pnD2zdJzzASruPxTbMPAAT2EVcdysLjZe?=
 =?iso-8859-1?Q?0kfF/DiTaX68WTV1FxwKnc/tZfGigYk++fwbZikJe4LFV8uxv9Hda0Mg0N?=
 =?iso-8859-1?Q?o40doM7FAVC/5cSGMImdTys3X8cu2ffNN7fsmjOAGZxw/y/d0G2pEs147I?=
 =?iso-8859-1?Q?m4LRMFpsMz5kgJ+HO5q0Gn9xHGFxYwZhpC+49BOsWlmJLzD+bwBnPtNMD2?=
 =?iso-8859-1?Q?2XtjJtwVhf6cEso3ng2DmD7ZTbxflpJIhevQPhl3ixrHWsJ8SYxqJX0Oq0?=
 =?iso-8859-1?Q?9KUku16tSlTf5+GCjbddKMPVN95p/Pl5y+iwzohnMaCQ/Y3LA3D4T3KK5R?=
 =?iso-8859-1?Q?Q5ebnaf33l4Iev93Srx1GNRMLGAQ+qNPXERQ2oYmtEkqqNH4deG/wRyPlW?=
 =?iso-8859-1?Q?Fqf0PIXnPouzo5m/fJFIuSyogAB5lIaNO/ZKTqczloOcOcQyxdGuJSd9Id?=
 =?iso-8859-1?Q?U3QC?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a319cafd-542b-43e2-9645-08db0ce28dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:18:58.4159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR17MB6027
Message-ID-Hash: WLLJM53VS2UEPZWW3VW6HBDUKI3F4R3J
X-Message-ID-Hash: WLLJM53VS2UEPZWW3VW6HBDUKI3F4R3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBMF7NRMGDJSPJ5MYOZNILGJSFFKFC5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
