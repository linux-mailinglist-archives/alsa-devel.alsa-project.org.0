Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335698C9D45
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F8F15FE;
	Mon, 20 May 2024 14:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F8F15FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208249;
	bh=7Nh/wrV3XQQgh00CKl7TAyPgEp7mylvlQL9DIJCMcGc=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=B0Ajg5wXnNiWlZoAi2vXuXTeuMMwRFaCIgzZRJScwaOlGWUGb4yiOZ0sq2cNAS2C9
	 EnOIUNBPFtCPhp0BFTLFaWmmSEBXT+ISJeOZvIVSssqF2BOetOJ2yOCENZKLEU1jYq
	 6NJyvXUzBt6a11hOm/q3DYitNsBB0ji5QkcRN3u8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03364F8085D; Mon, 20 May 2024 14:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC4FF8085B;
	Mon, 20 May 2024 14:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28DAF8055C; Mon, 20 May 2024 14:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 146D6F8026A
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146D6F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PIII86tf
Received: from TYCPR01MB6913.jpnprd01.prod.outlook.com (2603:1096:400:b8::11)
 by TY3PR01MB10156.jpnprd01.prod.outlook.com (2603:1096:400:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 10:35:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nowdTQqOVCGmqVlm+lrjQ1sTSG8k0w+/mQzB+GPi3FtxbwaYBPYVx51/pqOaWAyoNHRbfqqd5u6ja2Egrbt34CsqGYFPaUw6Fcj6mR8oUNEsra4bhacm2hUbTYMyEOYnCc1jxeVWf8By1Ws2QtBjZB+5ud4wNJ9tE58oyWlYhZmNXChCrzmXyK1GFrY+/EWVv8inhgLf0wJ6WvAzKTMOKXLm471JneSv6FNYvq5zyyZLSe7z9Wm0pjjcjTeg6gwa4ETXjeALNylLUhf3bkVqxg9AhDRXciD9rzH+f4qG8FkaqtZAVbAeKflERHmHf38CmlYPmMQ9gTAuG+9DJMz7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuTY/2mGZUKiPIGdpfwbZQeD+M1Z/e0ZSUcdiLfdP2c=;
 b=nWqoDncgejZZnyXnTd63gCs0E/blhgvSRbqRF8E4H06KLy8azzxW8Y3G17IsZdBAlYHJQgn5VgSHIL95bSV032pp5Tn7FSJuLegQwAd2p6qriGRkK3yEpDnOAfaCbhJ3SH9D7WB4BQTZXCQTY6lQGmm32Nwc+e0tPTDP+NEhJ1E1gpH0mQrxbBXt7157Y5tbmlBb2U09XclmECCPLZnyR3GGNSMWFmCIVTd5ow/Sgi0Wh8evNB19WlfaUJuE1x3fqxEDal/AAEb3SoLVhXolC3UGIJV+bTUI/KycpvfkvE2QUU6eLQthp5SRu4QDq0WTrn1b+bPun6vBaR1/8xnzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuTY/2mGZUKiPIGdpfwbZQeD+M1Z/e0ZSUcdiLfdP2c=;
 b=PIII86tf1QhfYGEdAQBIr6IWwupVK4jhoZvfSgkb/IzbFqaWAowO+ovhdudWErJga09Qtu1oaDTxArrVbKACoZhDR5kDI1dhtb1noLI26SFUW+/IjlGW3PBhdyIus+NtXcpwLMtWTiAyGiRokwjta7arnxI/2lRNqQP3CUzmdeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6913.jpnprd01.prod.outlook.com
 (2603:1096:400:b8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 23:31:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 23:31:30 +0000
Message-ID: <87ikz9e5v1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/3] ASoC: remove snd_soc_dai_link_set_capabilities()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 19 May 2024 23:31:30 +0000
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	TYCPR01MB10914:EE_|TYCPR01MB6913:EE_|TY3PR01MB10156:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d5706b-029d-43d1-877c-08dc785bd006
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?wUP2AplxvdwCG3oImKpXnDq4xeGRZaivgGxIRKxYoXHwrwkPMGGU5FJnFL6H?=
 =?us-ascii?Q?2WLgXBxqO5R+TmWwegG4SPrrUbPAog0PVCK+yzzDAqRYjQI8k7CDAmGP8aOe?=
 =?us-ascii?Q?u0W6/S+eQM2cyununAZbiL/rUBxq2kp1HVhiMBi7szDlFsZwTxf49fY89YEf?=
 =?us-ascii?Q?WcViICMg1aMXOyarND3HUrpD8/HZgrdbnrsYeG/bZ8YuUa3cjO7DuI6Nmolb?=
 =?us-ascii?Q?PZ048lYyhhfHYhJoALoatsDdxrLLqMMwy5BJhZj1p61ZRFlQHLnuHoLgNoq5?=
 =?us-ascii?Q?d8DJEjOJv3FpMCHJjvxfIuD2JE7q9ZWd+H9eNEEQD5DZeHf3kmSTHUh+/nZ8?=
 =?us-ascii?Q?pGhGw0aGmFjJS9/S8tuEOMsaM7rld8u6tre54h/73B7iGjYbDTnYFbVig9ML?=
 =?us-ascii?Q?GVjWgzVUDutW+weDjeC9bjZF45vSH1m5NFPKfiJo1EcmCW4DjAuIaGJF+oBv?=
 =?us-ascii?Q?eeLoTFvwo+xsqlhuyU5/og5gRWJ1WN2cXAv07qK4RKB7hISCAQHwcSyFqZsk?=
 =?us-ascii?Q?yLljpcjlAu/6SibGEncN0OILTh01fySdCw8ekCvGL4n90W1RZNILQKwfty5Q?=
 =?us-ascii?Q?z1tA/Wpv3u+7ZsAuKYTRV4VJZd8WLxx9WSESYHe5I83izHy0xEpLSiyYvs90?=
 =?us-ascii?Q?RdLNr1d+UiO57GgZb7gN2EqAn517smuaHNOweEToH/55VE893jbXPv/qHWHe?=
 =?us-ascii?Q?3Z+cOsPXsotU0gY2MZ4Qc6f/HN/MbVs5nVfeW3B52SGlVT3WF87xgiRVGNST?=
 =?us-ascii?Q?Q49N74ShZGOKXS4s1ahDTtNQhKJqd7Fv45DfswhKxVILTDprZUzh+FX1dZqp?=
 =?us-ascii?Q?a3vRK9W3StA5vAWsfiOyYkyROK6X2bcDi01vPFHM9h7HyULzMSvfM0E86gqb?=
 =?us-ascii?Q?3qv2e+NuzV8tK1sfSui7/pMoUPE4QFKXFMkU4ZLHvkSeMdhS4bvjFFdOG2aA?=
 =?us-ascii?Q?jx4TI1UUHASopM5toC8KYZGjWsroZn7fC50rZm9ZpJJE5Wx6lj15Js0UkgKE?=
 =?us-ascii?Q?z7Tj5KWv3BpV2JdNiniv4MwEM5mWxX6H657dVuDH76ho1bn3tQVwqQ980BlU?=
 =?us-ascii?Q?I//P6NkkPJJSd5EAip279Ds+Kz4LVz9DIRiybwcAvERvihBfUwzeArAokTM7?=
 =?us-ascii?Q?8IlGIfNIHt86GCPCeO/gg1OOfWyjZRMU4NO+6yBGh4XQeO2IbxvOqcNcgdRx?=
 =?us-ascii?Q?N4iHzm1s1JtiTY2QAQ0mMGZd7j7wlSdj/NZZinOdcc6nW6z1N5GA6pqeVW0z?=
 =?us-ascii?Q?IZf0rsQkVxE/PSQ6xit3I+VFIgUd4kAKnUXwvGXpRG1J5EW+rmkoS56/PKLK?=
 =?us-ascii?Q?jB3GcR+zIVHEiNefJ0MmwN4NZhIaRxDJNuwmnSXT16SfIfc21vrY4/IbUa9g?=
 =?us-ascii?Q?e76Doxg=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?VJ7JXB2DG+533Nh0CQX/IHX76qynWfLHOlzqxkAbybi9blV1/WLeq7WvT6Ql?=
 =?us-ascii?Q?SwylIAyX32q7CgUmy0klE+Qweg/Z0Axg819dZEL5h4Hox9IMxdB1plFBxcDp?=
 =?us-ascii?Q?7Rn1rXTPTHiT3QJvgfzW+7ogl7i9fRA1v9wgU+nrXcDKk4whc45ziK1QffNw?=
 =?us-ascii?Q?AMIuO+akg2ddJFbbtJaUaoNSpnICbgqK1IV2Y1lDY+w7Tj0gFTU8W5WkHuN+?=
 =?us-ascii?Q?kK6tXE4T7agcxkn3F4JGyY2eqn9a+xkALMbe67Ps6KIEUpKw+MWurxQRY28l?=
 =?us-ascii?Q?pxtJnmZH5jUVsIffw/Yh2ZZ76LU6CYKFShS+1RSbO5ppKe++KNfBilNemp42?=
 =?us-ascii?Q?esbB8f31y8ZQmVlMJE++e3g9Rp7zWdc/xsoqNLQyOgnNYzgS2WbjThr+K+uD?=
 =?us-ascii?Q?BNmwCWPxSaSW93eUmntd8rVIZWTQTOFDH0Lm1H3ee6kIzBbmC7kZoWweau9o?=
 =?us-ascii?Q?Xsd3msqZxmgQLvGwMb2Z9TX/DDRIXdCIIhZTS4fHzF6lfrBNy74XqL0kIyoT?=
 =?us-ascii?Q?BQ8Ms4Nj9AnEvQjD4qahUgT2NyN73tQxrD7pilxFkYQ3NOyj+5wCJ0CoWggK?=
 =?us-ascii?Q?NW90iJM3K3Kc0sBzr2z6R2uKA1bvjtayMpOn9/FwS7iXaU70KoFo/PBR8rtu?=
 =?us-ascii?Q?l0V1WpY7RZcAnfRGokp2k6swW8qRtl3/QT0BuAFAfAao3OSTr505Jn/Wpc8m?=
 =?us-ascii?Q?ypJ6AhdJ++RsFQeg+VD1djZ92op0q6tOpNV8xWHellyaxFvp3mrHxiiSGten?=
 =?us-ascii?Q?nvMywH5/emVo73NFxsGxOsm1qD9pqhaBA7Ia8rG9w0qI5VjWEfk83u7MESGN?=
 =?us-ascii?Q?eBbHlnUHKUZ95dekpCnMOl0GIYJkJU0PJqUBnG5ha4lHadAxfDaq1LSyc4Au?=
 =?us-ascii?Q?+pVc93bq9Hzla4wCYaieQ3gOHz1yNXttDb4LQnw6WgQr6hDbR21Z2jncy1pK?=
 =?us-ascii?Q?iWZJ3ZXpnax8j5z5Xvh977mGmjnTkr0Z1oLQ/80Ns9a+Oe+57rWQYMrIkkqr?=
 =?us-ascii?Q?V7JRie1fIn2Hx6f3EB7CG+62tQyhdf12RfH+mzv7fLeAwwQyvsTE1dHDlMNO?=
 =?us-ascii?Q?4XXvkBmhbD6a8iyhq61n3jjtUbAPkLyyfFKaLTs/xqpF9h5VlPmSYyEQ9B4q?=
 =?us-ascii?Q?XGGkjroAZVqI89RrVFOdmlu5zicy9P9FQE6F3zO4IXoUqoERuIZTLw8pQu4v?=
 =?us-ascii?Q?VTzr1UvQHLVW6VRFt87OY/HGDSRWT5INMR6DRd/0AX0CCdd3P0XIEww90I6T?=
 =?us-ascii?Q?ahqK/mlKTtBETbzLj2twtCOcOIla/ScCfVZRaZXgRzwL01R3u/haT4XMYZDi?=
 =?us-ascii?Q?1z+ZDEAeR5V+A0Bk0KeOlIFtJM2GIA7g/w847iB5gPxbL93tgFEG+kyUWKjn?=
 =?us-ascii?Q?1W3XZCzD9o0fWUkNgc77HLWMWP9rZzoQiFUDErkzfvSeodfr8Yqn6rBII6wr?=
 =?us-ascii?Q?1VN7CjtqkQBMDfxvelueTzrPyWnX40saJa6GDJmykBGUDKyAm/tynmXmVPfE?=
 =?us-ascii?Q?qkf9O3LanBz9jmU0QmK4bcL7diX8TRmfuvv1WDGodV+kId/FNHSeYucWdZwn?=
 =?us-ascii?Q?Z1CABYIqrOF8ZgqQJ30NL43kNWhjjPPUXTBykwvAdzGnGfNT+Y+f8IgHKp0Y?=
 =?us-ascii?Q?7nL+8pU+iR1yLFdJaRC/5hA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23d5706b-029d-43d1-877c-08dc785bd006
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 23:31:30.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DvZAqLtR37U9WUbceq76qpboJwBUvgSiOzAlHkkbPj1OM95xQpZ2t82pB1AeQDHiHqixvIKKCavZn5VSXcsD/wUTzHIDXknmF1lri6gBwFDOFJv5o21qKh1sbb2NUD5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6913
X-OriginatorOrg: renesas.com
Message-ID-Hash: XEENKS6EOLACBB7KFBJGSJ62HHKDMBXD
X-Message-ID-Hash: XEENKS6EOLACBB7KFBJGSJ62HHKDMBXD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/catpure
were available. Thus converting dpcm_xxx to xxx_only is not needed.
Just remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc-dai.h               |  1 -
 sound/soc/fsl/imx-card.c              |  3 ---
 sound/soc/generic/audio-graph-card.c  |  2 --
 sound/soc/generic/audio-graph-card2.c |  2 --
 sound/soc/generic/simple-card.c       |  2 --
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ---------------------------
 9 files changed, 51 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d3435..69ba1a628eabc 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 0e18ccabe28c3..98b37dd2b9013 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -650,9 +650,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
-		if (link->no_pcm || link->dynamic)
-			snd_soc_dai_link_set_capabilities(link);
-
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd6..714ce1f4a061b 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 81e84095107ed..6aeb578891f68 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -925,8 +925,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, rport, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f0..5e66812ffadfe 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e8..09aa36e94c85b 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -339,7 +339,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 			ret = axg_card_parse_tdm(card, np, index);
 	}
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index f1539e542638d..7edca3e49c8f0 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -107,7 +107,6 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 3d02aa3844f29..11cbcb588336c 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -145,7 +145,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index fefe394dce72d..f8e46bec6f807 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-/*
- * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
- */
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
-{
-	bool supported[SNDRV_PCM_STREAM_LAST + 1];
-	int direction;
-
-	for_each_pcm_streams(direction) {
-		struct snd_soc_dai_link_component *cpu;
-		struct snd_soc_dai_link_component *codec;
-		struct snd_soc_dai *dai;
-		bool supported_cpu = false;
-		bool supported_codec = false;
-		int i;
-
-		for_each_link_cpus(dai_link, i, cpu) {
-			dai = snd_soc_find_dai_with_mutex(cpu);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_cpu = true;
-				break;
-			}
-		}
-		for_each_link_codecs(dai_link, i, codec) {
-			dai = snd_soc_find_dai_with_mutex(codec);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_codec = true;
-				break;
-			}
-		}
-		supported[direction] = supported_cpu && supported_codec;
-	}
-
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
-
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.25.1

