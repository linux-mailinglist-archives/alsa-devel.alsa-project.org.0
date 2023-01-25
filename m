Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9C67C54E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16530E11;
	Thu, 26 Jan 2023 08:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16530E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720032;
	bh=CzDdb1QCExsy+8xWdBQE5cRf8XQGXaRyj0Ccrj3grqA=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Spf3GWExP41Yq4srZVsLpx/UXMrooxhD9ehc+lNSkWetc5tFuFhIqPAteUAh8qI/V
	 HBy57aGdYEmMhmtg9Szdascmzu55wfI2Noax86C19DTaHWiXm0kKEqMIZ4V/sDKbKE
	 l0pghAR9fAMDVPMDhGFFamKEo7CYZkHBHgkvXap4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8090F805C5;
	Thu, 26 Jan 2023 08:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D14F802E8; Wed, 25 Jan 2023 18:07:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04olkn2060.outbound.protection.outlook.com [40.92.46.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC28F800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 18:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC28F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ph3nemlU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGija7C1Wny5qlOSSV4YukWWRQFm742IXf+zkXx/ICIPRZTzrZMPoIVt22jlc/BARLZAdArVP5KCls1hiPmH/HqViFSb61eABVYXQR9++HQOX9vHkvq3Ek6HQlbIQNP1RfVZCllLxJwtcl4bo2WLP7cPaz7DG1JL9bcC0TLuLVu2nP51QbX+jprTKkSFPakvU8Ht7p4AHEwVFCykpUQbYStd3KKFLU/3GcuFjTFzVO0JmhdxlUoKt9oMdehv7w8iK8cyH9jTITiX/MzM+bUEj2P0ko+aXGHgE4PbNkK93V0eYXxOG66Yj035rrlpBuh7eHMBzJNpps4yN5+xxmU5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou9Y3f7Kc5Wkvn5YhGTroZBn+egn7hfTfSxbxRG5caE=;
 b=FC8ex4LYHcX3dLPNc7nb9IoUF4JaM57Ay1KLKLI3dFxa+q/Z2du2w7qoSq97yQ4jnK1xi2BrpsPchduVIxufTw+a+2f/opwOQDDR4W8XzTq6Abs7dvTRYEDIDjBRuKqHOTjbyxbbHSXObifDgnZjx3Ip3hglc2nu+tPLCfOAv/Bqnps6dPQHcia9eVr+kbYOKWh8DtqJgBSwDpcRovrDsSIdvXQxc4kdps/5f+JBsIWflbYtgbRLshIG5rkbqMaRphZcgovXVGv5lFsl7bRrRvRcL8IsGA5A2l48TaFa5vdBED3I09cTffolTureaLMZvHIpHA3GSRMXD6mHMR0Qvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou9Y3f7Kc5Wkvn5YhGTroZBn+egn7hfTfSxbxRG5caE=;
 b=ph3nemlU3y0XSbFqc/dLTp+i9ExPzJezS3txlDSqUO1mxPSaFxZ0z/A7NvAqpFHjeahmMLrrRlZKhhkEddTyL02mxe8qWggC10dyeEvhrzojKXRztbmutUkfKxiKwLeD14uQX0v/hUb49U2Aizwmbopdx3bfZgKo6zZsuyTEgf0C/QAxh+/FyEeh2cJjPzkkMz2eCt3Les/Kpf4qKkKufEmJndPMXLPS6AjasXGocB0K1LfjX43trWT/soYFqVtoZAT2696CYTeKKCIDfMrXq6eKmzrL2576B8uukdCSFntY3aWhr1VxcsbjCpSr7QWEDfsXiXI3G3dq9TUfdRW9MQ==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by PH7PR17MB6132.namprd17.prod.outlook.com (2603:10b6:510:1f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 17:07:31 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 17:07:31 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Topic: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Index: AQHZMEgIrioCItITZU2shGV9idtdpq6vGdaAgABCgXmAAAIc0Q==
Date: Wed, 25 Jan 2023 17:07:31 +0000
Message-ID: <MN2PR17MB3375BDD22E021A53D54514C5B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230124230048.371144-1-robh@kernel.org>
 <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
 <MN2PR17MB3375499A91290982CA0B8DD8B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: <MN2PR17MB3375499A91290982CA0B8DD8B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [37N1l4QWcSMv531tTAZtmOa55BfoGCp6]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|PH7PR17MB6132:EE_
x-ms-office365-filtering-correlation-id: 560c2ccf-f74c-47b5-5601-08dafef6a542
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5ODHWcgMW8jNIoDkNCax7MFMzj3debGBEkoz5HeYBpR4kJR9RiTzRgea3T/sn4tHeyTtwsanty2l6xent4GkBp4EYbTPEya1bheEv/HUmI95W8T4u8Zw83Xr9JnTgL0XzHBik0HH5GOQPGmVi1X0cIsrqsh2zhlURYdBHeTxOJ6+wW0gssji1oIsP3Tw4Nrtce3Chdl0ahoICmQ33GXKP5e9Rld2K8/PFlaQegupch+ZreQv24p7iRnsntTyLQ/kCMEyYJhl7WdyYCT9KxiXCsmDonmKeV6GJPIdfMNwPW8NAJjH8RUcj8D2FI+Am/sBYd3GT90ADeRhWDBFgnr23OmKejDb1W+k1iGrfFzeJjPll/Kms0IWXyA8/2hC3+pkqVIJJmaXepME/eH3Ek+cXEl8Bje44cwoXf3GOh1Mbz3AqGhGI6KU5rs1gO7rU6vOdYBE+E68ljvNq+/fzryWN5P9TOX42m0FPMfrIECzlwbQfO8Qb56Zh2GXPCXg2IQ9rZcjgSyNWe8Q7lDgqoo2h8yuzdYbWfuOs17rpK6TlZOtL5NHx4BIFkwstI3yOKSGLwu3gSlbIhOl4G4+5KkvVkxmaNy1xRN389tl/vAYEPR4dAPlR8GaSp09U7/N3vSQ4tggmmkzt5aYKtGdSGiY7oz2fLK9TKtk5j8DaBTM5I=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?AHuiK45mBZoUAbGtnQLNKcSAbmt9q+w6XTE2qi7s+UlrfoU/IYcDkGt+?=
 =?Windows-1252?Q?TwbiSrEkaOJ84pb4jvPVuJ9DPP8LgkOKMp5wnWeyi7MlLjvpna27CmIW?=
 =?Windows-1252?Q?M+MX/LKhhiy7zXlL5tDzG0HmyQccWhVhDox87uAus7DexwwNikp8T4ea?=
 =?Windows-1252?Q?VquwvKJ1/7AaBEhuBEDHZD3Yd8ApU/3w8TBIRqep0n8WtWLcy9/632El?=
 =?Windows-1252?Q?8KTwpIY3HaZqXJy/xWN7TPXtjXo1DwBRYDScq+T/A5yaip8PhcuLqGh9?=
 =?Windows-1252?Q?EARw7ALpSEsoXIwfjAWBwFdeKz4rGpBGSYWnjiFW8WoSHR2X+EdFC6fm?=
 =?Windows-1252?Q?65reksGOo8p8/+Mn6uxZvmjf+nb9yKlZudgDIOaZFd9IfmZ5tPDYM+F+?=
 =?Windows-1252?Q?Bl0RreYEZi0qVRo2PhPVSKrwliCunPdeBFr8Dk2DLLyjgTgNOA4LlYvc?=
 =?Windows-1252?Q?kXZIuUMv4q2sCqd+Bd/yqKgxu1l1G9QUgAky93ZcgbCwbo0Rdzuy7dDS?=
 =?Windows-1252?Q?9/Vf+j0S6vvExmTIRq+e6X10Lhg5QM/LgJcQ4OD1SbesABBL7oOdkkOK?=
 =?Windows-1252?Q?tuW6LNEO8wR+OVCablFGuvk5HRFWI8VJ/IoEIjk+D2uC2u7rUVJNoDvN?=
 =?Windows-1252?Q?be4GNu2l/nmsgkjbI+XBLaFhirSJrrVrTCgChRkzuoCYtwXoEVGRUq66?=
 =?Windows-1252?Q?atuol+4uc88G3/JIGumOnMpuwPBszBpyPlcfkkJjCThcw9bU0MgVsWpA?=
 =?Windows-1252?Q?naeByMoW2rKGSt0iilBkEPJSDH0qGA82e8pZ5Q55z8DZ38eO6KGzU6wS?=
 =?Windows-1252?Q?OW24/JkBUcaCiZ2kF5k3PBaFwCpDtIhIvH5syEC8InLPoGY8XsV8593j?=
 =?Windows-1252?Q?mhYvxEIrneDtzW0SJokAqlIzdVHnhOuEh5X0DjVKiKu+W9FfEMOcT+RG?=
 =?Windows-1252?Q?N2+L8HUuqx3L85WZqy4Y/0ELPI1i/NHFANPt4ek41kjg3ho1xRtOqvJn?=
 =?Windows-1252?Q?50agJvVixDevl08vr771AWUBjPOJugIMnAy7sEnQ8VqO96sO6KVz4Ew8?=
 =?Windows-1252?Q?IKCWOMimbkBM0bFI8J1yjHgjSBw/GYjrnbqSwPJQAlvWg2ZlTQwQfuuz?=
 =?Windows-1252?Q?7MR5Rm5kYNi/uqINActyLBswoDWvkfdkuGeuveh/tt47PDjVQFJCtXhi?=
 =?Windows-1252?Q?Ye004anLR9sBkeNo1rb/eP+5sNy9PNpK5bRzJuWZsr9jgc7FGxQPzfhH?=
 =?Windows-1252?Q?9Ks+kCdlZdZ20FpIGEL0CXKPJOtR+i58/0Uw7zuhqfDNujB64QaYWLj4?=
 =?Windows-1252?Q?ehZ88QgwRv5uL8dlIEUNKJa9vj8CBuU8toUKTbH3qQlRi2LR?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 560c2ccf-f74c-47b5-5601-08dafef6a542
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 17:07:31.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6132
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
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
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
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Nobody has to work with your delusional ass. Oh your a .ORG ??? In America?=
?? I'm supposed to TRUST a mentally insane institutionalized country govern=
ment system that RAPED slaves and lets men RAPE women and make them prove i=
t???? A country who's own president raped slaves. That nasty genuwine looki=
ng mother fucker sitting on Oprah next to that white DUMB as bitch. You are=
 a disgusting disgraceful piece of shit as human being you deserve to eat y=
eah and literal human feces until you DIE motherfucker. You dumb fuck. Have=
 nothing better to do. KEEP talking motherfucker KEEP FUCKING talking. YOUR=
 DELUSIONAL. It=92s sad


News flash not everyone in Africa were slaves or barbaric animals or walkin=
g around naked like the US gov tought to white lids when black kids did it =
have education rights. Sat there nasty tea drinking frail pale ugly asses u=
p there and lied about ALL African people. You think ima sit here like a du=
mb bitch and let YOU harass me???!!!!! You got it coming to you dipshit.
You are a disgusting disgraceful piece of shit as human being you deserve t=
o eat yeah and literal human feces until you DIE motherfucker. You dumb fuc=
k. Have nothing better to do. KEEP talking motherfucker KEEP FUCKING talkin=
g. YOUR DELUSIONAL. It=92s sad

Keep going

________________________________
From: Vanessa Page <Vebpe@outlook.com>
Sent: Wednesday, January 25, 2023 12:00 PM
To: Bartosz Golaszewski <brgl@bgdev.pl>; Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; David Airlie <=
airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Jean Delvare <jdelvare=
@suse.com>; Guenter Roeck <linux@roeck-us.net>; Thomas Gleixner <tglx@linut=
ronix.de>; Marc Zyngier <maz@kernel.org>; Jassi Brar <jassisinghbrar@gmail.=
com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Lee Jones <lee@kernel.org=
>; Ulf Hansson <ulf.hansson@linaro.org>; Richard Weinberger <richard@nod.at=
>; Vignesh Raghavendra <vigneshr@ti.com>; Sebastian Reichel <sre@kernel.org=
>; Mark Brown <broonie@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; =
Daniel Lezcano <daniel.lezcano@linaro.org>; Greg Kroah-Hartman <gregkh@linu=
xfoundation.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@li=
sts.infradead.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-=
hwmon@vger.kernel.org <linux-hwmon@vger.kernel.org>; linux-media@vger.kerne=
l.org <linux-media@vger.kernel.org>; openbmc@lists.ozlabs.org <openbmc@list=
s.ozlabs.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux=
-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; linux-pm@vger.ker=
nel.org <linux-pm@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel=
@alsa-project.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; =
linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Prope=
rties on child node schemas

You are a disgusting disgraceful piece of shit as human being you deserve t=
o eat yeah and literal human feces until you DIE motherfucker. You dumb fuc=
k. Have nothing better to do. KEEP talking motherfucker KEEP FUCKING talkin=
g. YOUR DELUSIONAL. It=92s sad

________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Bartos=
z Golaszewski <brgl@bgdev.pl>
Sent: Wednesday, January 25, 2023 8:01 AM
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; David Airlie <=
airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Jean Delvare <jdelvare=
@suse.com>; Guenter Roeck <linux@roeck-us.net>; Thomas Gleixner <tglx@linut=
ronix.de>; Marc Zyngier <maz@kernel.org>; Jassi Brar <jassisinghbrar@gmail.=
com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Lee Jones <lee@kernel.org=
>; Ulf Hansson <ulf.hansson@linaro.org>; Richard Weinberger <richard@nod.at=
>; Vignesh Raghavendra <vigneshr@ti.com>; Sebastian Reichel <sre@kernel.org=
>; Mark Brown <broonie@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; =
Daniel Lezcano <daniel.lezcano@linaro.org>; Greg Kroah-Hartman <gregkh@linu=
xfoundation.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@li=
sts.infradead.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-=
hwmon@vger.kernel.org <linux-hwmon@vger.kernel.org>; linux-media@vger.kerne=
l.org <linux-media@vger.kernel.org>; openbmc@lists.ozlabs.org <openbmc@list=
s.ozlabs.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux=
-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; linux-pm@vger.ker=
nel.org <linux-pm@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel=
@alsa-project.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; =
linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Prope=
rties on child node schemas

On Wed, Jan 25, 2023 at 12:00 AM Rob Herring <robh@kernel.org> wrote:
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

[...]

>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 7f26f6b1eea1..31906c253940 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    "^.*-pins?$":
>      $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
>
>      properties:
>        pins:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
