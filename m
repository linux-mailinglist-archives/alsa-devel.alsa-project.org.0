Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4C67C54A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 08:59:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D66828;
	Thu, 26 Jan 2023 08:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D66828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719985;
	bh=KldSq3aXCO493zU+rGJP8fTfea8tUFHQwK+Yuf9djvA=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ILflxTAHvqVteVXdHX2EzAoWJyII4H3okk39T1Erp4FOhibEuzodU5B6ObPFtlrs/
	 BCItdr6Ze4/DmnLX3QoD598Vjr7TrXb68fUQFSYSGBeSxmY7HeuDN+Sserb1LaI8I4
	 tmWpAyHlN4yQMeuyPwbq7IZJeku3NTnrEoVMCW+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABDCAF805B3;
	Thu, 26 Jan 2023 08:55:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C5AAF800FB; Wed, 25 Jan 2023 17:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2064.outbound.protection.outlook.com [40.92.23.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16964F800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 17:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16964F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=XTTfYYyb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgskMUiisDjRmNMOM3UlEcyNxmF551SHs3lQT2yteqNzc8jrZ4vTfdaqIkr6tPnVDyt/Osl1dEsIjOkfAqlAORzzLxm+sEZAbFQRUfS7j5hmUY7nFUAFEAgc+GDSDc6NlmxsoCq0n5dgx6Wl4JGUDrxCnkplpgNyn+w/sUD4Z02bvmIP1XH3PpuKgUQJsZlfuCd+SxPkRrKDV7K2NXDFwtznRndX5HMkkb3pSWzhOOLmbHpiVo/u3//xUemXOB/y8BLGf66Z/PP8KE/pD6xzg5g/gNiq4+GEnyrahl2Jd7EFRbiyIsxVHLMXcInhxBdLuO6/fDRayb/hY5YkitARng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xIhJUQrsV440/zYx/f0h5EZT8XQV29UKc1tFxhG+Ds=;
 b=aeQwAP21Y47pv5507W4OoC1FQJ/5b3aIHFKDP8NYlCmHUx/FTV7E8AkEvXdo+QwwPoAB/LJuKxEkc04tGEELPGKOQrAO85YJ4Vk0We/CUrwWHSt20GHw9/ryqAjU93DpZhmn83KTXMj0DKcnIgsmBo10OtQxlRxlsC3W9RzRDTrJgSfmZzhan5eDR6xPLDqYmazoKW53xfvHty9IoftPrPYX0NY2MZWpJ8LE4CmcP6Xql529gSVg53kk3Py1hsZtBkr/h1IEpcypnret4zYmGBZidcrCMGbMjRS8q0PPSCZcb6i3wFV5l38Miq6QW18cYaTcBW7TU4lMYKEVgKNKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xIhJUQrsV440/zYx/f0h5EZT8XQV29UKc1tFxhG+Ds=;
 b=XTTfYYybvKSF5HHBr7LTZnLt3im4q+X0TbLzN/4uOUEuGzmjnU+y0VYUnXmcxZZBED4qxkwjeA1r80ECXQN0i2QsEA1PKpxs5rHZvAhOnWddFSQK1Xpfn4SusAs/7oDP1nvnqNW0pxDwJo3v5kCxwa59HxBCo2R9hYTHxz6O+TDF0whXoarOOL2zNJ2i+YKKjdGcOybLGU4Sa8xpIuVTph1gKCwHav1cOdC8hiqfkHrS1wuxT560eGYOj8XyT853TJyDQ92sOxiUS/Kw4rVZ7X1bj6d+SYUDYRYTN1223zPtPC0yaEdJT8LcTQqYaxdfcFDvXznV1Q9fI+IKH3GEBw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MW4PR17MB4604.namprd17.prod.outlook.com (2603:10b6:303:101::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 16:59:16 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 16:59:16 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Topic: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Index: AQHZMEgIrioCItITZU2shGV9idtdpq6vUwWAgAAI5+o=
Date: Wed, 25 Jan 2023 16:59:16 +0000
Message-ID: <MN2PR17MB3375A0A6EA306A2019787EE2B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230124230048.371144-1-robh@kernel.org>
 <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
In-Reply-To: <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [tmO7UEPfYJjwsMhfvOrCm3XW6718YxKa]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MW4PR17MB4604:EE_
x-ms-office365-filtering-correlation-id: e08392b1-5658-4bf6-bdb0-08dafef57e0f
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zglBrVmltIZGmBgbPxT2393w0uBnhl2zri57VKh15OIZ8baU4OjGcCCwEH48rDKv4nkvfgJpbNhQYMEriJn9p0rUujOj0O8f4ilaYtYHCDoF2dnFOvv3Hz6OSZqR7AIrYdnlGNdhcbMIAv1kdjjYV9IKnOjmjS1uT+iZ66d6ApQ2A4GdF2/Cp68GZXL72SDmkF/UOQ8b48nJ2RsG/tPm2eLfb/PIw0E2u/UmGlSvvG/ZEPiWIcsPBfKYbsvDA0W5WKXr7hvL3kOXiJyyxnUmqqE7hZRuUadseIWFyfRG4P70u0QF3bmwqFj4VyUEw0/lbT0ShAhestm7ZDpR3LsgaoTxGZYasd6XkFU/Wg460gw7Pe3lKvJGOrq8JupE8tG5yA3mSv35GASS0KnppY3R+vxnXqn6WdyiI7vkl66T0v2VtRF3D+TZGzWK1xdJs7ca12Ax+AG7f0z7vysvjbeCxcwx8sZKBrrcL7Ngi4gB37sSzi4maIlgyAquHOQV+iGb2h3800pzrwtx6KNyu+TvQQWQIfigo/OymaFrD/qVT6MIcAqkJbcr3MR3CMIHX5qP3fg9zFUotIDtbR7JhjFPp3kv5xoB6KTkgGwV2fnJyR/SNQpsY73nFiGphXcN/n4NATYqbx7mnBvoHofys1boW8M6Wy1oWB9PWxWmXMJ1HJM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?PElxOh/6jQCKFrrys0sp2DS9QH+NYiy1xlI3GteaEpyiq56O5YH+QZkw?=
 =?Windows-1252?Q?WHgWDu1rWVD8G4SxBkg+e8u7XClX0FIG4fDRtgs+gsWODxFdmJ1GOErb?=
 =?Windows-1252?Q?tFtT1auBjOQqqtQJ8EvybxyerdZzAo2TFibuvk/MNgHUrjndYmtX73+i?=
 =?Windows-1252?Q?k1IzWH2kJUeHfG6dHJIAotwZ5kibueiir/9mX55ee/mmcKY5PDi8qF+y?=
 =?Windows-1252?Q?4sdc/sMmc1/pKWmtn/Nk/RMM2B1fhRUi1x4jU2qvxSXWEnXFqe6/mCn8?=
 =?Windows-1252?Q?qozVDvDYLkdUuizSzOqBLhCd99dhZfaARwXB75dLBEPvw7uh+BTJzO5k?=
 =?Windows-1252?Q?OZ/K+danAsxEe3PNT3BbUANPMrhmwu05Scutt8kdJxZNvU2Zj3sxxeNg?=
 =?Windows-1252?Q?/8rZ37zfQM8lo1G1dHQH4ZkVeRk5FRYjyK+vgB7hP//4cPUeM5AaP7wM?=
 =?Windows-1252?Q?aGIiTX+616nTTq1No2jmoFptBGYouxn1rSZ8b4rjR72e0DbMkXCCGJNv?=
 =?Windows-1252?Q?41SDCWFJFW3MVUTkjgtwbGaBZVjk3gidnwDlsgwEXtCEbncLIFZc0LqJ?=
 =?Windows-1252?Q?oIeKu1rwtzpi96FTaF1pWapFFYSQQEVWnnm9b8IlNDbeRSYL2lkgrIZv?=
 =?Windows-1252?Q?Pf2YLBhjtXBirIaS+aBvhjF/dX1GxAR+0G+ucz7JfKB4G30rHSFNrlZf?=
 =?Windows-1252?Q?P4XsuPGvZ6cfTqv6ylhPvPk1Sq1ukAxdUCqE+D8dCn+Uj+HTvgk+9LoX?=
 =?Windows-1252?Q?FOOjK6/rfiiftJS+FMsLsKiwTQDzKMcEUPW1YdLldJ+I9VqViuAwUN3D?=
 =?Windows-1252?Q?vgjkjAKbmEjF21Q//uRIucOo3geCd0W1KiGuNmgkw+FYuCpmFMXFLLI+?=
 =?Windows-1252?Q?gYDzOXRjIlc6tXfnw3kB1zJ5aNyXUzGpsg8LnuGTaYSm86sU86UcqSX1?=
 =?Windows-1252?Q?hT2nbsGexvw3AtChcQdm0xxpXRKH0JfdyeJiak2U65LluHeq3UOvp+xL?=
 =?Windows-1252?Q?K4/vRfYnTuCO7+XfZsKtrvO4c+mkP7ECGhS0rXBVIkHy4BiTCiBQX4dx?=
 =?Windows-1252?Q?DGWVJLW+H/B3cMXTKi+RMykbIZtpwAPZkZoi2O8kWk2In5h/E/KREbEy?=
 =?Windows-1252?Q?iy0fORBNgTFRix5JJI3QqYn5orWY5udx9G2xo3nl+RihIOso1CgqN+mU?=
 =?Windows-1252?Q?EPk+NL0B06bZBAM21Oas1lKNivaNEEUl2sZ5ASDjjBzz3IbSZBTo9ZS7?=
 =?Windows-1252?Q?mrWlrRXYp5pYHiBhp2bpTNds3x4uELCGVDXphRxEVV2g2628PiqsC1Kb?=
 =?Windows-1252?Q?91+1/ly/ehobfutYmBrQpsJW+KjWMuE7aHqp3QqMyuS56SlU?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e08392b1-5658-4bf6-bdb0-08dafef57e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 16:59:16.1593 (UTC)
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
