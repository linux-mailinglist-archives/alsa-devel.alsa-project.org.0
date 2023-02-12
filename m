Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0C6936D3
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 11:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E65682C;
	Sun, 12 Feb 2023 11:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E65682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676196891;
	bh=j/QJWZkLmFSb/9Yp0a7iuOZ3vqHcEa1TMawUlnHleaE=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g7ahg/A4n4eJfQu7Gm0Yxti77Ut/iTZiIqN4rUwIS323zF5j3AaG5rD1OsQe+QlN4
	 KwXxq0RDOfROI4ZNO32R4ehL0yrkSJ3t/3gQrhE6D4mwaakNuXZg1LXoNG6tAYKIWl
	 shdyepz1bNNCl28qBOG/8SrQE22YKovYehlDtcNs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A542CF800E4;
	Sun, 12 Feb 2023 11:14:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EBCAF804B4; Sun, 12 Feb 2023 11:13:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10acsn2080b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::80b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ACEAF800E4
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 11:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACEAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=salBQvHy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbdJlFt42pS8Ufb4DLvnv+l7yl2OXvOETb2ys85ist0mANnwn9BanluSUUm6xoH2oGexrY38em0SrUpSAh0AZcmaJ/C08Bh7KYLl8gejxWOA9vKGV4NNEeQVgg2skJAd+Sr3lUZokWn85qSvjf+jXup/7ZBi5bFGLLRdIsUdFOE7jsRq9jLrllQ+wy0dnwC+FdwlVLbJHzp9xJ+s4n4VXON/7WpJab16TmhFLy7mbT9gjnHCoVYIppa6A+GdsV4ok9ICclfFQLlF38Zsbt2hXhLT537n+h1DRIVl9/FgMzF4oj2wYXE3/yWbzp7ukWvTzhKyd2iKKtsmTmfTkjjjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0sziEp/YCIKtePY/g5YYoI23iAjjO+nmIe9Ak/DfHk=;
 b=C8VnzunAx2M8s8ZV1JoEehpgTE0cawBbk+cL+oLE3Qx5tV2AQT9lMD5Bb2Wy6yKi7RWb3+uGABqjPTUD72+EgOiwaWMhCyfXrR5B/NNOPbg0L6zUN/Ugrw+9L9fKoThUnRYv58cetzs98EsUYbIY/fWKk4E1QA1jSprpo25URZ/1P1t5ygQooSH1rjdwOZhguesG9ktvF4Ow9+zmAwFYCxFkf+x4U2ZmMJygduEjjeX0bLqZMPCCo1DZy5DFdIiB4B0aDnL2261XRn6GS1ZUvID6x9qyNV70lZHERXFxYygID0n/i8wahYKIt5immKabWXyTpI7QC9lGNn9nnhIbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0sziEp/YCIKtePY/g5YYoI23iAjjO+nmIe9Ak/DfHk=;
 b=salBQvHyUGokHpeC/XpommDO/q5iq5ExdNBqgMQT+UiAivg8Oul4rwMhMj9Nu81JH9SdQZLmLLICmY6dtzdwcYtutUiZyxXaLrTJBWnLd2rVAZlVPbZPVZEjIlZFmV9OqHyZ1WqHUkIvMfJnNGf5iN+sZx8fRbOpShY616T9T/yG9jvMoO8IDfyki3nkkzmxzYd9GSAV6YFcer9xsd3JSTL4BnVxUSxBPOhY9cLHSGGFhZbyT/g40AuT2OVTNUpH67XPYaV8QhbSQsjk36HRWYOw9LmrfAD4QDrobR/hUiG2BGvWeo+2WjQaYnBuFchAVt5FeavDIMWa6s1UjqE9Bg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MW4PR17MB4700.namprd17.prod.outlook.com (2603:10b6:303:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 10:13:23 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 10:13:23 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rob Landley
	<rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig
	<hch@lst.de>
Subject: Re: remove arch/sh
Thread-Topic: remove arch/sh
Thread-Index: 
 AQHZN58k/f73IBbK60aG0mP3da8Tfq7DN8uAgAETIoCAALNngIAA+k2AgABmVwCABMcN2g==
Date: Sun, 12 Feb 2023 10:13:23 +0000
Message-ID: 
 <MN2PR17MB33753450B555F0E4E65D7C62B8DC9@MN2PR17MB3375.namprd17.prod.outlook.com>
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
In-Reply-To: 
 <ed4a36508c3d047f9e9a882475388be18b790b76.camel@physik.fu-berlin.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [8xKzpDyS83QQk+tDug0O5qQ3FNvu3Yqb]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MW4PR17MB4700:EE_
x-ms-office365-filtering-correlation-id: 9c8a5079-e85e-4e4f-a3bf-08db0ce1c65e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pBDdcRJO/FbmgKZPNYYmey9X+ZNGY3CseSNpSZpB5AFFyh/thH5tsQR+VozCT8/xF9gsDsDPo33Ic756J2JelUZSKMBaAW58gfSktQqz4BQMAO5ikfGh0zLpf8MUMdADrqnuaRpSbFHmICGAbIyhO+Bbe8trG3OZZSBSfu0yoaTsRfCTBAi3602D9Od8BwBuQagPPeQ1cnsqCzjOLwnp7/c/xCCfgycz2P9w3pDH4o8f5QwppP2W8AyoULLOtBD6+3gdSM57bKh9md/b27GjaK8u/o7in+Y2yeDR4A1JD2NGwOM4eGGz2JY69WImyE3xfOLl5conNOuRz4L6K6RjC3uqXejJRieg7yH8v6XlD/2pz/8am73ve7M/y1nQhNs+Q7aOT1dOv2C65L29V0PHVmnNfS5HMc792BeK4iIiI3hCbW+gn3G3ZZWKBzBvXoJGLNAmZwZNTduNJLX/XRQDNIkvrqBm1hWWdJbvtMeZZiR6UK6yLwRZNRYsbzAYtTK8DOc1fXbZZgdxm4Rhco7lt87eEKSx87d/OtFlQJSXBcd8fXWe9C5KNzUcwzX+meb7splLgtiPtOEdh7nnlyIy/V4fCzQN1v/QB+nWX8Te84477FDNnFqvNPqjsch2ay7g4LiOJ85HClObm1q7faZtlkMIdnMXTGfJMKF7k0k0NOM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bNRITfcijrGGW67NU9oBOnn6CqX6EUcB9dYqzKASc3JWHgaM2p5jvFIbMy?=
 =?iso-8859-1?Q?0gapgHXHBI07LnadaqVhNMENAvzI1PDFr9TKsgpzLOspk+Zt77RU7GwGk4?=
 =?iso-8859-1?Q?HXPhsPKJ65bF2WbA0IopzjrWe20U5v6lINaoiAY61ppNWTtVFXfgc2nzdS?=
 =?iso-8859-1?Q?1LkwPxpYMAg4RRg7Gaa7TYr9z5XNmrlghTsI3m6XXpBSQZeqk6agLYpaf1?=
 =?iso-8859-1?Q?A6hcmdjjL0NOrFM1iNarz0P+UJYuqOLnor5ulMmjMIkl/7SFi/g8hr70Z6?=
 =?iso-8859-1?Q?eWmBSneMRtuzPtJaSUvhNZ+EBryhA68v65g/LB8Jp2dpDEe0oDbez9Z91j?=
 =?iso-8859-1?Q?lqRXhZpw/SCVKrnGhqb5tD2ZnWKdFkr/SjXA4dLiegWSpPJMmRZEijuXEE?=
 =?iso-8859-1?Q?5Qcj8IjXrxx6XiGGH7lTLFDDP5coor+guQKGKo1qylbh19BzoF8HK+IE48?=
 =?iso-8859-1?Q?jDohQxnmIfn/oa6I1bOFLl7xlBbJ0cL62q1PCuWiaJFZrYGIFCJ/ekcgD4?=
 =?iso-8859-1?Q?Bcm+XKHU03rxo2Pmq14DQCS7QaSDjtzso14r/YZqkeJbC3kyO4878MAijn?=
 =?iso-8859-1?Q?bpqAVa3KbaWJHm/ULHavNA9+N0VA82oYEFIaFeAciZ+bdSFw8kl/MR3aEL?=
 =?iso-8859-1?Q?qAbq7sOiaJG4BD7QvYy3nJP7OPJtOXsrrrzpl+3sThHZEj02857z4TjiCT?=
 =?iso-8859-1?Q?8vaeOHHe7+oi2olezxZgdI3oylGu5cUmK5XVDE9J8tgCdj483JMuDG8plh?=
 =?iso-8859-1?Q?V9ecU5W9gpZEo8Jm6mrwHcFpLHjOz+QUWhLLFHhExIxQlKCmbitaxh0s+N?=
 =?iso-8859-1?Q?HMVwGb/WfhEEuMKu+xit80vUg9M53kjI61YyqqXjJ8k0V7zfcXtxwRoz60?=
 =?iso-8859-1?Q?xxpVOoWrNFJXZPC535fxI1kkcEQWCI2FdHcIE2e/wVmTMPVkj2yM7GByJr?=
 =?iso-8859-1?Q?jaWL/3glTESi5OPeuj8+aaZ5y844EqIjzgWgJBa7BhgPBwFkFUPWiBas8z?=
 =?iso-8859-1?Q?4irVgmJxYCW+1uVLZNkwA1U58Hjyt33ljRe0dXrFatUkFFngGEOpnOcF1x?=
 =?iso-8859-1?Q?qYJiMin38Z5ZuOmZl2kCqejpGoE5VljK/UGMpLNCNYJNqYXDvHDv7SQpOQ?=
 =?iso-8859-1?Q?PQBIR0TrygUpDZvPr4PiikwK7brhluMtcjmK87XODg6XkWtQIUCQDHcX8w?=
 =?iso-8859-1?Q?c1skMfgJVtUs95Cwgt4T6BdoWI9fuSCVc3r5GiTIVHNbJ5cljF9uR5VYDW?=
 =?iso-8859-1?Q?fJmnYVCnIOCj12zwQti8ZXaT1nYCIjOtG/hg6GNUUXOwhyY6H6UNsTMIWc?=
 =?iso-8859-1?Q?qThD?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c8a5079-e85e-4e4f-a3bf-08db0ce1c65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 10:13:23.7698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4700
Message-ID-Hash: SAFQOU33KMODVESY5EJI24MZZBK246RM
X-Message-ID-Hash: SAFQOU33KMODVESY5EJI24MZZBK246RM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZPJDCXEI2SNGVOWPAHRMSWVCPCHOPOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
