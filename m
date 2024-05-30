Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91E8D42F1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:31:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D050186F;
	Thu, 30 May 2024 03:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D050186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032677;
	bh=dWJ9aiL0KPdEdwUWlUtMQzWpBBRw5tjhFlKXxKwqj90=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OZo1RKtXQCpHRYOBKf1me2VprKxwgTQkWMf6GCK5dlOUridcc351+L/UY7X9YQpuh
	 5VJS0bxSqT25M0fRb3cQ3497rcfHcvbG+6eNIOkzYSbOIQQ0mGo7ln2ZAnmBfNaZXh
	 LkpObYAQ8lS/9ozfrp3AMPacTcYbgOqFZptDA6Fc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9857BF805D8; Thu, 30 May 2024 03:29:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E853F80656;
	Thu, 30 May 2024 03:29:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04D22F804FF; Thu, 30 May 2024 03:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF86DF80149
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF86DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NO3IfGGJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHMXs9beX3cuhMm7wI9Pc6oQBStx5EZJw2LfCI+lyVGYwNfkLiWDFwhhmhN/ixlpsM7VZHjNls8PRbGISnA6OzzAhfUSFDJxil37pblFvTWMXEgQTP2eCn5LA98mXofbpmJT9C3LDGOe7UIaHOExQT9wfwklE7VlxSNekw9ISh1fpTl8cnJeSJ+LXo0R2XhowTle1D0yhSCYb5MCq6uKgPqbkdPVMXIKT/gYlAUlSd7nSgkfvkX/YaPMp3bGSB5mxss+rW7Iuk5OHZWA/PtXjK2RAfTSet3lIyBow3aAiLTBxfnDy91YN0iyWbliF7nKl5Y1IqcjP6RVTP4t4VpKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=oTG31RkD5k6/0Qn8BR4Y6OHwCBv61H8w6nFf+0xBpuVMOaGFFy2WBncG6U2NVi3Hk1XBpCcbTgiqbQPEAfB+lKc7Fe+k6JLoWOGNysK1Eh6cfEAMQmWnlV9IrKslgfaCkXgK0SipVZR9/Zc3CeDww6r8yJ+66Suq0ACHQfUENrrumtln1cpXUuQqZEJ/ImydSxHWoc/3idbTsUKDVD4wCyXWDQnuNN/Q4c20sM0ksbBbMnTWviNlT3bD9S4bE+KbZIGbGmoxzL1SkXJXGuMK+dHtWzLM7hf6mzpjCRoRR09Gdm7FXRvMpTLi+FELfR1FTzC1KFfoBDOoJ0el4BZXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=NO3IfGGJHsJJ+AIV1NCalZff/oY502MnxRIkMt2Fp+oal8xr0dvxUXPniIjCtyyJMEFXzQFMVHPk9F5ifeyYRIETIjgAtZ9UxS/Qt8xw7CNAT02fj9TisrOxcd628m9gWyn1q2sVCFWViE5D0y9su/If863Dq6N9UjOTGE3BYbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:36 +0000
Message-ID: <87sey0oznl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 08/12] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
References: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:29:34 +0000
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ab454f-e4d2-476e-2088-08dc8047f76d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N5zbw9d+SbU7ZTFyLhUJIJbkugumL2i6XkLd1h8VmqIm0ly5bL4gCzzkJ9UG?=
 =?us-ascii?Q?FxmmNVgYZ+r6cTkPa/nyuXOJdObQYmUhrLgAvXwurmgm/E5VLzczGTUYYSNj?=
 =?us-ascii?Q?m6U+Q2oA2KvB9r/kV2Fbst9g+keV0INTYWS2eEWNwISMXp0UH9V42+uiq49a?=
 =?us-ascii?Q?eOqxaxb9z8e+1Ovs0zKMrou9FiOnsr2vdrlkhKz0giqOifs2E1qPlvQABoOb?=
 =?us-ascii?Q?p7hFNOIwb9iVqZs+lVPX8krTybzex3LfLvKKB/DIhWI3PV9Ox5mR1L56iy0T?=
 =?us-ascii?Q?ZGKtcGKH+OLmF/nNxWGTXRhr6tYTPSjapcaHxcJM58ciaxv4H+cJUSfkfhbG?=
 =?us-ascii?Q?RRrEaApmY1/5Bm5WrPqvoBYtQYwouB+vBB0WTxMF2Cv6f22EOogBYWya7DUz?=
 =?us-ascii?Q?toZjeuvhTkUIZZO043qM19wq9pEqycRgp2Bj1nllqfr3PBm40oVaqQ/yxFA/?=
 =?us-ascii?Q?pEpHuCMzJ6LbXla2uEqpb0zWHOaIgu2A9pY1FfuTjmOJ8+lBHpLD4gUmw2pt?=
 =?us-ascii?Q?w9EGcJ3y91UD2BsmGy31rofq4ot6hFD2O9rSod4ltE/1KdG65nnPDvOYlbdY?=
 =?us-ascii?Q?/56VZ25IJ2Q+kVT0jHxvaLAIpv/uNTCrU7/XzvfULpBjwoPXESyk0Mb3foS/?=
 =?us-ascii?Q?Y+xzVjHN9JxaR2VF+PMgJS6WwIyFtu48nD72VlpXX/Qh4FuoM4cXEvlsz7F6?=
 =?us-ascii?Q?bGZIrpwDo9ArA4xupW6VadR4VkHN8o24NWYhpRcIX0WZiAnyYvnOXqaBCTj+?=
 =?us-ascii?Q?b9Z3jWzaKxte40oiEDnA/RCFc5xYQtX8zWgYrKZq09izYL15im1pmCBnSR+P?=
 =?us-ascii?Q?dKbg3xw8qME6T6O1oq+kwb64TKchSHPLqHNx8N1KZnLfAfx7St1dWyEqIpOT?=
 =?us-ascii?Q?2oonMnpuvauV9cCmhYdXA6KJxXi8MtoSk46fFk6rvhgPn/PtzeZL9qHTB4P8?=
 =?us-ascii?Q?xh+jGN4rZidFWql6LX8T5ZMks0sqxzSZ8vad2DOo6UzpixMdMjxfKMwoT0+6?=
 =?us-ascii?Q?7cpZNRUtR5LeYJApwfGbLZosSpzOBHM5iYrMPQq5Oc8OEq+zkGeQXAVWC914?=
 =?us-ascii?Q?jo9mDICZYpFdTL0uFIwbeZ48fNIuLdTKbSFI2dwUxNIZPqnaL3std2NOFPqi?=
 =?us-ascii?Q?2r/r1HjgxXZq2XiAhl4iV9sejYxNjS/hVy8RTuAv5I7uSoCbuuEFLgF73hL6?=
 =?us-ascii?Q?gZk1YfPe0bp+C6P/Ai6LfxPP3lX3dmGHwIOr8iLpHI+fPPrTTmeWO+NBhY6n?=
 =?us-ascii?Q?rYG/Q/BsXhVnkeJuK5iUMm4Hol3DRwcE3ANJHzTWCVffKsSQoINJrYoiBDjw?=
 =?us-ascii?Q?dDEzHWtVK7D9o6N+szX62DeGlU10Pmopu8Wq3KrMmW2aa3axc31LzLliezQ9?=
 =?us-ascii?Q?rjesnSQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F4VLcJp3xab1LyK8ETLDislXCKs1exTwE7oMdku+cY6LHw7wsxIvRl3+dkvx?=
 =?us-ascii?Q?7AI+D/qaU36v5Zts1DoJgUtWN80OXSr2Iat5s4Kk19oxJwzHbH8s81H23n3V?=
 =?us-ascii?Q?CO97ecjLSgb8TDZ7LwSp45QAguEKdigcFVoWLOmubRTkkZlnsSc5eyFnLwJ5?=
 =?us-ascii?Q?SUGNAOiqqhWJceB0vXHsqWS2K2kjQztKlBsIwmEva5fP2RzNlD4B4GigaWf5?=
 =?us-ascii?Q?p/mIIruiTDxQ4k3BUsR6HwSFeMdN0JINFUKHoxS1hLZlw0p6rSdFrdz5RXIu?=
 =?us-ascii?Q?LbpOzUEVIRzjxbCxhMrTSf31OtF1hNIwoIHffkp5ik9FEI6gnJE8d7pgzhmx?=
 =?us-ascii?Q?mUXmCmDlDqm+8dkVXAQIn0obbQtzB12USptJU+prYtMgMVcsm83/81egBgnd?=
 =?us-ascii?Q?Om4i4TRQUTDYQUcJlo2E4SYTI10VfdgZq/c6vLzP5Nn1SYq+3PNKWq2O0nMQ?=
 =?us-ascii?Q?iFIxFrcqXFGHdoAzGXEmjaUxrMU6q9Eb+TVcN4fNDzue170pdaQ+Gu52JgKk?=
 =?us-ascii?Q?DW/puKub1N1nTDgoIDKD8eqy9JkLTWbrJBHCXfH4bUGGQ9K5YSrbCGlp3bSX?=
 =?us-ascii?Q?bNT4wnVh+PEteiki7zV2VIzcdEQgsRTqeJVBWI+mU1Nn5yxgIlmDSQLDeo2F?=
 =?us-ascii?Q?ne9Xa+OYLLFzh1bLXtKeOa52EaV7RpK3LanMPcDHlUT0gqbPBCN3WBPFJvS+?=
 =?us-ascii?Q?/OuXTE2i5N8kPwED5MDAfs69JU9vvh0fkV1yjfS72k3rdoAoYY7b2Ib1DElG?=
 =?us-ascii?Q?yemrjUDpLia+ITRuikp0v3BFMtn+6MRnicLvCpnF0hsociA+pGBd7VYr2dVF?=
 =?us-ascii?Q?hQHlB2wzlmbWao/Bs0PIMnEv40OWZXKc+pCN5njvvcSphpfYIr85s6+AuJ/e?=
 =?us-ascii?Q?uvHWoONP2tYe9WZbj7+IXDyAVLSuwmbQpUoZ8pJcEOpnltkM0WI5AxmLYyWb?=
 =?us-ascii?Q?ZExETsWVYTBBNn4GT3t7KtYajH0XQqHTbDq63NxKVoGS8P18ow3MoiaaEp9e?=
 =?us-ascii?Q?qzNEeR7U6Q1sXKG3nil/pGUj9ke6i+wTvxEBvEf0RkOuQyzDBPWme/g6s1gE?=
 =?us-ascii?Q?EdUsOvWt0hjgPUyOCIC7TUEth8SQevV9VWhWG4W5oVI7DndvClVz5LMqEE3Q?=
 =?us-ascii?Q?svGQ/QIuvt/Et1ljxPgEq6JC5fY3EW4Fyg8WfUuWUEQvgEfKRFL9JHfL+n46?=
 =?us-ascii?Q?MKLNcORaWPhhsHkxL2Ln9x0ogAiz5m//S++Rm9TxLfhrOcNSfBJfZjZIPK8H?=
 =?us-ascii?Q?8BQ+cbLXc1B0iEUNggjqidyNbj48u1w9NiAznEIL88syhY1oysqwzxbO7b0t?=
 =?us-ascii?Q?gUZbufrpDORhv4FFHMVsw8rg9gdp9qFQ0gtvVvKFx0nFHiWXmBU80VncTVdf?=
 =?us-ascii?Q?YZamb5fVaKlVpC08dqTllA/YSCyYpGDOv04sIWbrirBO+i8G1GecOeuVH7/l?=
 =?us-ascii?Q?EMjrVJByXUFPWCGMbnqxBmsam1nKnHIXQcYebaKQ3xM/kz8HJjcU6h9EN0/k?=
 =?us-ascii?Q?TcP+1h3HUkeF9O3W/Bv2inuJy3Gkhx+uTb0MyPzlFqjXLZMCiyQ8jmVoMmPA?=
 =?us-ascii?Q?kuwTeEJ7xg/0KgEf6wiJ5QQxWwOm/kPMHMvnVE46cggTo+1P0tIfYkKPuzKJ?=
 =?us-ascii?Q?gTDCMXduCELvwRsGkFGXgcU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6ab454f-e4d2-476e-2088-08dc8047f76d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:36.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TRelUNAME/QPwgHLD+gXRUBdnH6LIFCOEFtU3JYPKevJYUQbNQEoP7G1+wsfKvabq8dLS2eNr5IvFBrj9oQdnkmEjp6PRSIeVTlM6o25MYkIvp+JOJMRqarI3f58BNE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: H7DGNZNIC2JSVANI5WCSY6NEHHJRDCHR
X-Message-ID-Hash: H7DGNZNIC2JSVANI5WCSY6NEHHJRDCHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7DGNZNIC2JSVANI5WCSY6NEHHJRDCHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22f..a0c55246f424b 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,19 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		return -ENOMEM;
 
 	if (rtd->dai_link->dynamic) {
+		int playback = 1;
+		int capture  = 1;
+
+		if (rtd->dai_link->capture_only)
+			playback = 0;
+		if (rtd->dai_link->playback_only)
+			capture = 0;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +631,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.43.0

