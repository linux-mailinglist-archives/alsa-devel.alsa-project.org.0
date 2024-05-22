Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42C8CE51F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3131EB;
	Fri, 24 May 2024 14:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3131EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553115;
	bh=RUCD/05DnTMhqzRRGJ/s8zZRxgcT1gTNXYxSOiZ2QAk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HahdAU6eH4XBg2sPgbwzPKpnOD94T2kuI+e8EK/9Jk4bk6ZqqAS0rZUtXNyANflVe
	 OBwbkcmyJx36CXA9dyMbN8DB/Y5874eidyYuJvsmbAuF+VAmDJwGOXNcNK4w0KSXLi
	 SSeJCPKyvcC5leXy0MOgrubfgOkeshnZ4v2WSeMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7A19F8042F; Fri, 24 May 2024 14:18:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 290E2F805A0;
	Fri, 24 May 2024 14:18:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5502F8026A; Wed, 22 May 2024 04:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2070a.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4494F80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 04:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4494F80051
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJGr8OfkzEPWKbAi0ZXWkt48JERet8MMpJ6e8OdRUOKZMpQEXnHyjrOVLjbrNLqnB9qomBXrhSp/J/OahYzryMwjuNrThPJTyMSDYOqQ4KkYjl2XOVr2P1fmkaMHlX/V7WOMUT5Zx/u2H2m/VB37ikEHXkrx1lznzx5gR489G4XyX8ZgtJ/vOHcWiPwGqxruP+p7OxSN1G2e3QpyaiARce1XV/vbP/tIBZVeDhWXe4qusTMJFnANQDYPE6PDTNGIoNRv1JVoOKcPPb4UExMLy2X15GEWQtjXq0nHkm6pSmSQl4PyxBWmuJM/5/Zjw9J0oItvpvZzxFBOVxEtXv1rVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP56qYh3jO2aZPo0WJrLMAOvBZCGkYh972ZwrNqxYvg=;
 b=C1zqF9r5Q9BFkF9FlTWCvZ64CUgroUU70xo9SSgqeHBclUDO/NhMNowknazLtKXrzupr9LAl7RDYHamQtM5if/UD7BflxJaASmFv4NVbEx+88EBs4ZJn2auWFJ9TEVDdDTYGF7icnnhPCU7oDwlaYMh7JB8FrCFaUH7NS0ghKHrHvzKu0n4E2j9Pl36DtLegSLJr24KczSkwoC2fSPF6V6OrwTMvKddSAgsG+MQClOLfZvL59hxZorlNCVh0JowjZ9Uvii0qQuDu/RWZMjFUeKb3Ylm1FXe6xdqt4zs07b6U74BGMA/9RT+gR9ZH5QNEmvOSGguPQXptDwn6rJAi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Wed, 22 May
 2024 02:11:55 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Wed, 22 May 2024 02:11:55 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: Walker Chen <walker.chen@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	<perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Thread-Topic: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Thread-Index: AQHalVkIdRsOCKK/U0GRbtz/T/P037GiqLtw
Date: Wed, 22 May 2024 02:11:55 +0000
Message-ID: 
 <NTZPR01MB0956BAFCBF0EA32824C3350A9FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
 <20240423083405.263912-3-xingyu.wu@starfivetech.com>
In-Reply-To: <20240423083405.263912-3-xingyu.wu@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
x-ms-office365-filtering-correlation-id: 3b352070-cd88-4434-21c3-08dc7a048d75
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DEW6xTo3m/dFrXgHquL9RPpj057T2Q/qvpenJ6uZR3WEUeGOs5HohaWLviGBvJ1IeOIelE2KYTBRrdRnKpEOVzxWZ/Sc60SKpn4QKeYsd5ri3naaesIUxirTszZ9izZ7xpJ8ViprRQ6PKFy2gMJByp+k5bnbHjEcm8Opf+HP/SeVsWvyi5VWJqTIv4F+RGAjiQgmgXLxVjPe6aBX3bjELMHmDWyxQxEThApG4Z1awAYxZ7EVGevPA46WYhQKjw7JX6tTEwiS4an24tbkLhWwuvQD56aDwVpHrHKM8AdhfxnbGKmxlbbfDAtNp0+eLYM4FsjQgSu8FeFbP0tLT3bhoaCcc6X7vdCw+25M8B+3vsWXXErF10fYvBvCHvl6jeAb5GcmR42H3as3hEuBJNsUd1C804RTtemprKnsfVT6v8JHmVnSmEo5TPwUzwv/ra5KQqIvrtXkLt22NLr+BgGfrQmKocQcT10QbUFKFOR6ZiuKIB534zR2uGVLUk4/TfmdZMPvf6MKxLfYodvvgFunjuczp12CypmP8R0zqp6NFir9cGJ6zvWF3bh9cshZmpCQ3GoM0axbaZcuDYtb/K24eFzhUgDPzdFGjJv2I46jFVy/EatyVkDGpyncd2pSJtJE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vPKj5sBqQd9vV/fVQao+ekkhlFCFB7fgEl/fyad158c/s6hJ9wcMyN9TuhlI?=
 =?us-ascii?Q?fWtwmQViG93v5rIDcqn2k04L7lPVYEh4TTIGnaewaw029CeFyuVotQs0Vfag?=
 =?us-ascii?Q?1rJbOKcZwS8fZ+hP5bIVz6K3I16DLr3OE8UIMmRcSWY5lDsb1G5CibMq9Mpg?=
 =?us-ascii?Q?Hk9e6xMgs5NnhRC3K49u26lQ9NBQjTgrJ8ghfGgsItcCKVO5+G3ZPgZqwOOM?=
 =?us-ascii?Q?50m3ENjzSspjJKopZZGkcYMvu2+yZwugbmGHvbv2LFsuB70YSb5+wqvxu7+D?=
 =?us-ascii?Q?J1aSBz4Rk4qxFI+yjQQTgF4WCmiy1AJmRtbSxzSogoJNf6CgfWMOcfs5lPKF?=
 =?us-ascii?Q?Bv1hEvAx7AGak2RwAqEBxU771ItQj/1hReFTszCwFGtQPe3PFgRBQ3yfcqf3?=
 =?us-ascii?Q?4+IBBkaOrphqi/fy6x48jRF4tIrK1KzDXSbvUQhDr8LDecVUTrHr+htwlW8w?=
 =?us-ascii?Q?mfVwEugp7oV2cGl9QfvjW0NAtU6A7xz19RwMFOieIDVRlOw+i2fynKbVm/Z+?=
 =?us-ascii?Q?WXYp98i73YZD5jELynPhJO7f8sEitmxrCakMjNA2L4EZ5otZ921Ys71hajVB?=
 =?us-ascii?Q?Tjp9nDOOXn8ez+CulZA1jFLUPu1FuRdQfK+8DV2/jhvXAehCJEW7pBBd7zAH?=
 =?us-ascii?Q?oku/2irwswjEdC+5fSSjvdNPUvPflpAFONscaYGAGLJx5g3aO5zjUId9oUoa?=
 =?us-ascii?Q?KeXm6CsDcE+a9hemH8b9gmFc86jPkacdZa5htgtC9xDidqsapnbqRIGOQyJB?=
 =?us-ascii?Q?zy6d3EUO7/M2XuLnQ39AZ5Nb2BUSkgUE/dHE5F+MBFVxUmTiu9jomGf35sXv?=
 =?us-ascii?Q?KfJCnNDNJbeiEl8kGb1cTt7cV/32KXD+Rif+Sa+UO4e3UhfAUzjBj+R/ggJ2?=
 =?us-ascii?Q?Mtf6UNzEewVE0aJ02ctKWBStq4GhzwKlcHfC9s8xBknPjDEf1h+mLYNiUrBU?=
 =?us-ascii?Q?3/M64yGi6V0m3zxH2rkgSwovqpNQ9Ok2hurJb5bFQeh+PlsGXxsFNVXHJ0sR?=
 =?us-ascii?Q?+AlpEOE1yt1i+hww2EQZKEJlDCIsL6vkfszN12L6GxhtZn37wsxF/6udoDBh?=
 =?us-ascii?Q?Q/hCON8NOHErWB4hHFK/QVYatXv7IRWO6Uk6oUVF4kggai6mTXikxmxFmIwP?=
 =?us-ascii?Q?zimSWDmq2Ufh67AFtRqjKvmrlGX76aif/IvqVqV1lHcU0J2/x7Gg0QSQmH2A?=
 =?us-ascii?Q?afq3Y7JifjH3iqCn5StXcu/4GN9nxOvFgkuqqwbQNAoGSACZhJwzoiP2YYRq?=
 =?us-ascii?Q?JxWcV+02YPW+PjB5muqFF0Zqx0Pt2p1A+uvuaLoFcmpPCRyjEdeFSJbGAxpg?=
 =?us-ascii?Q?rG9SGgwdpw13W4pu34jdw68VSgo4X7EslbnztNCxpTYd/xdTj0rEPUm1XupE?=
 =?us-ascii?Q?5tGv3MXI62/q0s6NWA4kpqKlVW23EV/rIet0hulcioFFBzro+1Y0N+xkgbEf?=
 =?us-ascii?Q?5VAns9g/Nv+79UZI8K/O41S6ps1uCL/U0HB+RzkmVU1WC/ZVPcaGk4cvm3dF?=
 =?us-ascii?Q?QT0CwZyBXMdYGgbeV/Y8xMmlByc3KTddJZiLsPcK3Atfi4VmTXTyXChhSqQE?=
 =?us-ascii?Q?DjqT1AOxeGArPJUyBS2cxnO49x7N9qHAg5WHhgVR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b352070-cd88-4434-21c3-08dc7a048d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 02:11:55.1114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 FISAFXJtOdy3zKuPXq/4UpK7/8jEc+4l/P6018toKQE18BRhSGb2j4d0GUmY78B4he+lzFyl+EW8MCRb6PkBfqvCfw4tMk6PlO0CsDw0i10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OZ5SKLPI2UKUSVKSHXFANFHX26GQZ4JD
X-Message-ID-Hash: OZ5SKLPI2UKUSVKSHXFANFHX26GQZ4JD
X-Mailman-Approved-At: Fri, 24 May 2024 12:16:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYBJLW6TY5RGRFJLCEOXWVMQGS5EAB64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Subject: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
>=20
> Add the driver of PDM controller for the StarFive JH8100 SoC.
>=20
> The Pulse Density Modulation (PDM) controller is a digital PDM microphone
> interface controller and decoder that supports up to
> 4 channels. The PDM have two blocks and each block controls stereo audio =
data
> which is transferred to a Inter-IC Sound (I2S) recorder on the JH8100 SoC=
.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  MAINTAINERS                     |   7 +
>  sound/soc/starfive/Kconfig      |   7 +
>  sound/soc/starfive/Makefile     |   1 +
>  sound/soc/starfive/jh8100_pdm.c | 447
> ++++++++++++++++++++++++++++++++
>  4 files changed, 462 insertions(+)
>  create mode 100644 sound/soc/starfive/jh8100_pdm.c
>=20

Hi Mark,

Could you please help to review and give your comment about this PDM driver=
?

Thanks,
Xingyu Wu
