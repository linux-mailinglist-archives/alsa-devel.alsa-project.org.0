Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2C8C4A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 01:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA251D9;
	Tue, 14 May 2024 01:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA251D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715643839;
	bh=59642dzEbUUzFFNPG1ZgW2DjfDLWllA4cjmsp16msP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEp7LjLTaou+TfLri5chOdocjSG1GRbeoYDMsNNYk2TDjSM2plJ8fA8kXHjRugDbo
	 2W4sPPXfpS5uDQJU6YYgAQztxWvmpG9TsKbd9Re3+OFda8COl/m8mNs48dRP8l0w1Z
	 8IoeAZHyThhMBkvyyGvU29mYRzzkX5pgrINdYMyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA26F80570; Tue, 14 May 2024 01:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 017B9F8059F;
	Tue, 14 May 2024 01:43:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD07BF80224; Tue, 14 May 2024 01:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC8C3F800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 01:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC8C3F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AQLbDKNJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhBuYNeNbXN3zyfNvuLkTMmYBixjdF9sU9urt290ePYId8Y5t6twyMBUwCTecgQ/Xxr0HaTHf7GWTdoMjkG0BxT/dswSuyNAB2poESUVuRcft22sEv6gJJdNmzEUMX7G56NVLMGM1lFeYMtpQ1GAHGHNN+jhSEt7kR7z0vtFYowOD+2qJTYmd/8Ky1D2KRv7aftisr1Dktd4jurJauu2LZV0RRpZ/3lrgJ5wGD+81ZFFhyLVuoS6ubHPVpXwnA2gEdq4xzEOk8z+iGcIrB2bHVzRN3+Xew2fCT1YjQiLhMZe9AYdoFfEq5+bssUTajEV5Qg0KrrFqS5jIkIahUbotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59642dzEbUUzFFNPG1ZgW2DjfDLWllA4cjmsp16msP0=;
 b=dqubSpdq420o7Qg2LXXEA0qq3kuj62w9XYLbT6PcX29OIQmfArtIk9y3W6xVAG1TeXvXOyL5tkElyiFvETYxeGVL/TmH+lAOewnB/EOKYOpMu49RqgoBLPpjaN7v1MyEOs9NLYTCLioWTPp6fSP4dTDiGnWmjiDPuWf1vTJsQU5/74RW3dhchzuUHvuL+09F7se1pg7AUMHpc8vOtJM90UDC8S+XhKLHQvoxGMzD/OuTE67bCMhXlIkWPtramNqB4lo4xO608rVUvNO1D5tPNpVzCULhWo6lijPQZlP0yRcHT25Y0og21kJZTxwqw1MWEZaKEKGClBLRGCi+hqCe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59642dzEbUUzFFNPG1ZgW2DjfDLWllA4cjmsp16msP0=;
 b=AQLbDKNJrub140xmwzjOM1z8Q1Rd9uGRC/cOZewvxlPnwN4H/yFdEcvV9g+lDZuf026zSt/OvH9qQ0ekDYln/Y9xji9KinVw0GxdL0sR0AVR9dQvEm2xnQPsrPdDqVPWzWPpYdn5EdBMJug1t6kAgGWXsQBUF05LHSHu4qD6YNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7423.jpnprd01.prod.outlook.com
 (2603:1096:604:144::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 23:43:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 23:43:02 +0000
Message-ID: <87h6f1jn25.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
	Jiawei Wang <me@jwang.link>,	Jonathan  Corbet <corbet@lwn.net>,	Kai   
 Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,	Matthias   
 Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
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
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
	<1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
	<87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
	<87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
	<1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
	<878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
	<1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
	<87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
	<1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 23:42:59 +0000
X-ClientProxiedBy: TYAPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:404:28::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f160d75-ac62-41ad-71d1-08dc73a66d9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|7416005|366007|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tDp/DSy9NP6XDslBQqV4xgBtCmf0WrZobiYe25kyYKnJXoK76aMw32r+C6eo?=
 =?us-ascii?Q?jBm16HAgB3N9g+dA9TB0UnY9iHqBCptzUWlfUvUmEum74OGovFJHkbBfZiGw?=
 =?us-ascii?Q?bIvxIsYlD3bh7Uq+eTllbVw+lXjulNOYh/bH2pZnnb22wccd1WvOUF/itEp9?=
 =?us-ascii?Q?lP7OwcXJ1o7c0bDghAImaSJpQBrasQQ+l8FOqKR9VNOi3kWnpkwuLyZklisY?=
 =?us-ascii?Q?YuVYD1qiMU6qAG0b8JrY/ltJhO7s9/AfJMY0+pXJGOSWR5OwUDfW44CJLPlQ?=
 =?us-ascii?Q?P5sR6ovzC8ucZ+sDNGqSQLVVc+3fpKiOYRo+S4lrl7SKQxhej2qFfyURpmBy?=
 =?us-ascii?Q?s3IM9KGIYAgM6mvlg60vNVGzsOrKtBqwqwb7jXBjMX11VmqOkH29mhBRZX4D?=
 =?us-ascii?Q?TbrByhIAe9gnRE0e7ohWctuA7MDee+7n3MycTzPR0byfBGO8AEvglmG9jehX?=
 =?us-ascii?Q?jPxMqxUi8/72Cn3LVL5FMxVVdC6SZ0i1yqXcn4Euq8OwatoT74n2HC+6CCPp?=
 =?us-ascii?Q?ShJEiByvDz+lLS7HxP+Cfd7bIYQ65dUD4yg/Y7azMmIyhmmzwAVrWpMLm1u2?=
 =?us-ascii?Q?5rI/1HDJpxrc1JeRhumzejxSmWOm19lkBxJAGCSIRYStgR9xqzPO9SfTrYp6?=
 =?us-ascii?Q?h3GTIY2HyVuA8+RPXkuOCXrGHAPQxbTkZ5nfG5U32bl0NqSdT2+rKo5YTkny?=
 =?us-ascii?Q?ACgF2I9bVgrVeUujbgYMIounT6hHfMV0l0DpzrPDiyVjQu5dWXDCguVG4Q3L?=
 =?us-ascii?Q?u+Jp25xwYhDLYZu4JbJ9mNxkvxg8AXmphw3qFrpo18Os0vaCvR7uYjFUpUxs?=
 =?us-ascii?Q?MfqTQ1co1TIs6IJbPNAZlzxbdxkKUSrwLlH5Ec7Rd6DNz3vR9MtyRdGNqF3W?=
 =?us-ascii?Q?8hxs9zDgxjAPUSYfBNODvzoaYMMPy45c0KgFbGhB+ahR67RW3tbNlq0kHKib?=
 =?us-ascii?Q?p4eUO7pohtSPwcaH8uALS3YZmB7IH7JNu0adaqdhQEymEXMYEZAgdQ0pQ/wH?=
 =?us-ascii?Q?0LGgRX0eBfZMyrVHJRkQRmvfV/Rv72dfQ/7PGBQ0BTN2hIkZ/EyAMv3E3gTJ?=
 =?us-ascii?Q?O5D1Uh5mZeFyo23SZQctdynKQYo+eKPvtFJfwxx78B6tiXOVd+z6xR7HeGgI?=
 =?us-ascii?Q?jlzg6bxdFGHABOueztv0H06taG1BKwLz+rGz1wSyQb+Tw2nxZVfnxkZ+7Xuv?=
 =?us-ascii?Q?0xnvDmSOREiWzBNRHuyJ0luI2aHy66AIz07yX5bKdxGnmcclFi+ECR5r3HS4?=
 =?us-ascii?Q?+ti5wlyBJJ4XPyKXOvatUaiw+NnIfgcn5D6myLf/nvQ8w/GDhXofXYnOOHvA?=
 =?us-ascii?Q?tXv74pPr0gV9HKNmZba0+lmUf7M9W3/kvUVYwsuVmzWa9A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SSH6OUWNpHXuAuBxuulEkki0FEauTAXkzGhQFEXqi0cojdpo8loIEFGS6q3a?=
 =?us-ascii?Q?hYmz4iVJqd5hUfJaFi5NbWPvwLXnitugIJwpOjvlDJ9/RbBtMuDV8ZVqxodJ?=
 =?us-ascii?Q?99anooTGAIHlZ1S3ECiPmLqZ/MCQ65hpNrsiFpHIkCEtmtcFOEj05AOFkUek?=
 =?us-ascii?Q?EeVIdyRRqW8wYrE8RlktOMyY7uLLeRkHuQIkDGypWPANy9ewtoHb8sr3N1s2?=
 =?us-ascii?Q?x9o/H8oYXZZe/c7VTzOzUdkOO7a+GAqmFWYrNkc8IiQ87F+zg90L0YLyNXgI?=
 =?us-ascii?Q?pqjPSARH9sA6VfmXaDOdqhsBjyZ4Qg40iJ4fhIGJNG/uoHq1O8FehbT3KB+U?=
 =?us-ascii?Q?hMY8dUH/U8pgDxmbnBi7ka45TnhpKmkGQ1Vs6HItTiEx1dlNzjqfiTdVpoGl?=
 =?us-ascii?Q?TauJWDrO1VHPR6lEezFF7nkLXjyFDqr3ErwRetHnCoVrOQNi6bn8vnC+t4N/?=
 =?us-ascii?Q?SaKR5tvYWcHisWSvkVO6J4rTPuUR5xPY/5r06tdwhSfYDl6DHerqPLR9+FtN?=
 =?us-ascii?Q?fbE1MZDjURqNx3y/lU2Rhyx3/qOopHXlRLZ8wTMKOXYZ2qdMiVpXcEcvNGkT?=
 =?us-ascii?Q?H8JnlHhYphNvSIKhanxr9YMr5irFPHNOyZoqeqpYtrTjWAVf268Yog+1Bnwp?=
 =?us-ascii?Q?QfD6x3+JnD5r/fin70hPNMdhW33taqTqKu4vjITtLzTCvm/wrvM26xsyyU1Z?=
 =?us-ascii?Q?aYY4ISS66s1RXcddF6VBO9aGpPnnnOhhKJdou3ZIuUsWsM5ttLENXpVLwivL?=
 =?us-ascii?Q?wrbhcpK/SVTQ8iLieWa2lnigroolltzKS0wz2hSrcxeap7PpAGTaTHOOn3mQ?=
 =?us-ascii?Q?gpvCcT/0m4BavGPXUUdzv2PTtBz25rU3pg2Uo7Jd2he2/dAcgzRGeb/rCl9l?=
 =?us-ascii?Q?+Ja/4wAdKFr0yZv+XIQFiDCD5e63hphhduVlN4uECw0Y5EX2718rQXEo+Xns?=
 =?us-ascii?Q?MQLaXGpwCqCFlyUtc0bMsXoUWnncFd4e6fl3aF4rUqoP0Bkv0IooGCMzWxaO?=
 =?us-ascii?Q?1AguBQecU38nJDmBOGpBT9aFmm2rOLvVaaAZsr+UFrMLsGKiX+17eNXW/hCs?=
 =?us-ascii?Q?k7i9srb50rcSv9gz0RaO7dwjdMJYu990mWf3QE1WUYqSTRwRdpY+twk0BcoW?=
 =?us-ascii?Q?imB4rbTqBmpemkV3oD40k39vJEWLKhfEktfSXMzeIKxdQoy91u4zwiSozLTR?=
 =?us-ascii?Q?i8gnN8iq3qrpM6DYrRBHDEE7F4BxqWFoRRwoEsDMT1H1cXtvp4fzXhxkk35A?=
 =?us-ascii?Q?bYYA3p2g+2xZVcaG/jYMB8bvq7qwWgg5TS+AQSm8BVuQHINe+ITgWTalDRmy?=
 =?us-ascii?Q?H9ue2k7yprXCOlD8uxWMScKFKnPd/ocjy7EPdcIuqafVmK/2l2JVcaS2u8Sp?=
 =?us-ascii?Q?AkVUp3fF44Ooj7DEVEtq/3PaXBLe6rKCsHfW+434me9eK743hVuEdSEqoxbX?=
 =?us-ascii?Q?ytTKBlM2fXuJYr9vAGG+RuBzIboD+X/LXoCRf09NQKR3rnBLggIoO+Zl3cvZ?=
 =?us-ascii?Q?eIPLiss7hg0UxEbnQpymZg0k69uIaqrbq3/AajQO7itCCt5lbySde72OZgWH?=
 =?us-ascii?Q?oRFL22T+vpH6RYi/Zd80vpnFjs+F35+4wgjnpCvIgKAqrdYrlCs8mYWeOo9X?=
 =?us-ascii?Q?3ai6SANcmVc6CaYNZxh3Ib0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f160d75-ac62-41ad-71d1-08dc73a66d9f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 23:43:02.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t/T3njUaUSDsJIWXhMNF9bt5NyvVzhCCg9KkAlbbcdIwYIO/X8828JPcKvjTmskCBGaVyZwyo61xoZehZQimnZ4lRGqViXSC2JlaAaKGAejpm4RuXyAjOfzVP4Hz4/cW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7423
Message-ID-Hash: Y4KGLYCBU2WA4WBK22X3NRTMGNQ5GZ2R
X-Message-ID-Hash: Y4KGLYCBU2WA4WBK22X3NRTMGNQ5GZ2R
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4KGLYCBU2WA4WBK22X3NRTMGNQ5GZ2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

Thank you for your reply

> However, I'm a bit confused. If it is handled automatically by the CPUs
> and Codecs settings, does it mean dpcm_playback/capture flags are
> no-ops from now on ?

Yes.
dpcm_playback/capture flag itself will be exist for a while, but it will be
removed soon (v6.11 ? v6.12 ? not yet fixed).

Some driver might is using dpcm_xxx flag as limitation of direction. For
example HW can use both playback/capture, but driver want to use playback
only, in this case, driver might have dpcm_playback flag only.

In this case, driver authoer need to update to use playback_only flag
instead. [1/3] patch will indicate warning about it, for a while.


> Should I update my card drivers to ditch those flags completely ?

If the driver is using dpcm_xxx flag as limitation of direction,
driver author need to update to use xxx_only flag.
If the driver have no such flag miss, I will remove all dpcm_xxx flags
when end of its support.
Of course we can avoid extra problem if each driver author remove/update
it by themself, instead of me ;P

> May I still disable a direction on a link from the card driver, like in
> the case I described above, when a TDM link has no slots for a direction ?

For example, in case of CPU can handle both playback/capture, and Codec
handles playback only, it will be playback only automatically, no Card
settings is needed.

If both CPU/Codec can handle playback/capture, but you want to enable
playback only, you can use playback_only flag.

Is it help you ?



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
