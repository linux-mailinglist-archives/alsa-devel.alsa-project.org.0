Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2D9592A3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AF37832;
	Wed, 21 Aug 2024 04:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AF37832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724206489;
	bh=AJzKVRt2UnX34iH56jKNejVxDVKrOpkI0665exqjc78=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LP6xw9dRSBbzTjlazmDW4i6jJY4NusK7Dz8HqIfotzWiTi1YP7f/9fSlzn9nXWr93
	 31C2a7yUztVQo0AS0DGBPDotPNtIGa+0+H2QVA+chuTxTfzNo7p+QSDjo5JJQXoc7c
	 SeRw4GnF/dkApWkCQFSiOoC7onabb45YuufLyS1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5062BF80589; Wed, 21 Aug 2024 04:14:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E070AF805E0;
	Wed, 21 Aug 2024 04:14:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73774F8057A; Wed, 21 Aug 2024 04:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA41F80496
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA41F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=in4xWKiZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apzt5QODJCBWMW4a/Pihr3I2Fg4NKQhTZvY3s3CMyszgR8uCDmVAgvM316lw8IciS+u/XzjHm8YfQbKHr93EAfDuR//VqkcULG0DOAkpzw0LN/tw4PXNAYxMjZmixR3vCZERitFLKnu2u0CI/eBm1TcWEMnER3lRTE+vCEBI56DYqfWsvUNaIIzCUcGA8WjhpHXmENHpYWStDl227wiK+mT8CmqeN8dWHxv+NXB4/w9d3BpqYYPnqWLzu1kOmVtCO9Illjay/ONPDCk6cfL6skq86vIEJWHsAu1xoqIhj0FCOUtUA60BfTVhMy7u/ziIU5ZUhSG/oZtb2DnrTfAAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg8h68kzgIpZiZQATLjsZMVCmIkNSyyxHaaTFvmvEsY=;
 b=py50g0Dw7lZ1GCJ/UqageQibcvMU+R7XZRYHOrGnhfXsuc2b69ulTZgwTZ+sV7MtD9hM7UCKmlrGEIsoH8t3bQXZbjSiRNy1/1IpXnhNDzrPe9OdKHBB1lXWoFNoD5dEAvMlx3Y1wp62o2r6Rh+AkMpPpSV4Jn/kZ6vHx4QveA/Om8J3ZGrU/rUcDzDpRERWzklswHYSHWe3ceAMsW2NnBPYtBTChCw1HZQKUwgUo1sF7XtnEvvjzdPRwRWMqaesHfGfVtZ+4jG2ECkt5EIylYMvUyC7OyGtCNZxInn5DIbChccAgX47OKqvu7RphIDpmlXwWvaYCv6dBiuyodC7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg8h68kzgIpZiZQATLjsZMVCmIkNSyyxHaaTFvmvEsY=;
 b=in4xWKiZEP+myToYWoYs8Zb1WbHk57g5BnhopdmP5NI1jjtprKSvvhMZvFIQFg7ypghUGdU4laakKUQUNbTHfIXFHe7HTTC6YFTpudI6RLIdT14iXg8Fi663dBm7sG2hmA+wJtmlp7X9FFNfDlCEPVMc3zox+PKsXbc0eUeWVK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11873.jpnprd01.prod.outlook.com
 (2603:1096:400:404::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 02:14:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:14:03 +0000
Message-ID: <87r0aiaahh.wl-kuninori.morimoto.gx@renesas.com>
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:14:02 +0000
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11873:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c9523f-426f-4912-fa4c-08dcc186ed35
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ySTX4I8OslBJJ4IcmaU1Qbg8LW6Tzm0TVIVCk5UczE0c9FFcYGs1tR+VBYpn?=
 =?us-ascii?Q?TjXIvWtMbMLurobjUT4FG0hNrU9w5Km1xUEzpc8M318kX4mUFgSVqf2LEHI8?=
 =?us-ascii?Q?A4r/XKW6a+ca1Z3hKjMPTJZk900HKIOZ/vunzd/3Q+RCOtYyCtl0EY3CpLbl?=
 =?us-ascii?Q?WN7zW9mudx0zK1L2KP5ofmfb5jptHohTt1IOMiFtUv0IMe4n4+N/V7F9OVbl?=
 =?us-ascii?Q?rLJtSocwUOLKFD3SnobrI0b8cQhhQJ7NjbVPUBV8PPg8upGuOJlVtr+vNsHE?=
 =?us-ascii?Q?nK1pJnfXnwfqNSXnuQdJuBCRKdogExQ640ew7LAWy55UEGQ6+TLRuJd3cdDO?=
 =?us-ascii?Q?xOXFjOtHA2YMRnFIBgETnWNLjB57bbdT9DXxbJ/qKRngMLH4QoZnDRVRKEBY?=
 =?us-ascii?Q?whTjYZ01FdnM13rGKsIjRcyAVkn9DNYZtdIcz7WwOAazVVV7dZ2UbF+nRNya?=
 =?us-ascii?Q?YHsmZnJXpEJr7yFUxOChY2F8o0vH3bz1SYATcBVsFq4S0U7UP6pl5HlbpIMc?=
 =?us-ascii?Q?kbkGbzyyi2gUr+ITzRgW/6B1qcCeoZGLTADYBMIc4DcAnxOjF1F16rDOHOc/?=
 =?us-ascii?Q?plUp2fS0qznpWc9LuoiS/tIPcFb/vUm3uTdU3HyOtTJ6GbDDLT5bIGUEyD5y?=
 =?us-ascii?Q?+UIlmjegWkPDS4A1/A4FGwqAYmGiWSpNbMdw+VZUOR4Eu4FyL6WaMOtwWymG?=
 =?us-ascii?Q?IhKjvSZTu9MuqGBHx0NekEN3h1W37omcLvAm+s69asx87b5EexRsMyM7q61h?=
 =?us-ascii?Q?nMpkkmFZ1rZX/NIxesan3dladJpeDxsXMC9LP4UvCfhdT9peJw6Bb2wDcuLV?=
 =?us-ascii?Q?Yk09/BaLOfxZREui79ceKYNeV5XRLW39d7ZHBCUrxCdqTujSPtEdSYm1SVL7?=
 =?us-ascii?Q?iTdzoP2t9yLSIf8n70u/IPcOHkaZ/rOTaVr0bQJc4IftGSCX3ZdSMy1qrKZG?=
 =?us-ascii?Q?v56AacCVWvHVbGHYxAYoFQLhGgNyhN2VuTGwlMyOrsOhmWpWR+etpEaQ7wJW?=
 =?us-ascii?Q?gaf6KM55MFHCKFqkGYrjX+yCUQkkgdiQFOKBV4QjkjliJZzmigJ/a+bfWXQg?=
 =?us-ascii?Q?oxhfUd2h+WaTiMEIxHztyE4eLHfVTLaCHiFqsrTAOgvpgU5mkzLU8pOY/yK5?=
 =?us-ascii?Q?JDOrNej9yDBgkhWf21EB/I8G5ot75vF5yyqnLdGGLLvP1+uM5erHvt5Gt59y?=
 =?us-ascii?Q?FEsk8h0SKRvcTAqUM0hUrmalsWSZIH0wEBEdhLai9iC6E8OGqBsTxtHhlWek?=
 =?us-ascii?Q?igR8bzGr8FaZ6Ss+sNMSuKcXGyfKGOIH5j/76P9aeym3U9BTmuBC0ikzAmjE?=
 =?us-ascii?Q?c9Peg51+MVU2JnYMCc2m6MtwfJIW9lDWSedo3rNfqoN3rPsbzJWnvxKI5nyI?=
 =?us-ascii?Q?xS78YIZVJhS5ePHcUX4nDQaDn7rpQikoR/tiD7ECdNtwWiHGL3AZhUTSyQe0?=
 =?us-ascii?Q?2sprmIHsouI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TPy/jMvb+tcm8VJMBm2koJGpeXVWSDFn7JYDFgYVGeM3H82bdQ34DQMUXmR7?=
 =?us-ascii?Q?Fp9OMKUqKELrOIgUv9V07GWqLgRn6njyRVHlqyf8O7vj5wxkxNXbEkYxz1Es?=
 =?us-ascii?Q?NraXBC+wpZwyYeu4DVRxPuG38t6wtzZCIwTl0JXEmOtF12QwGtJ7kvKmu2fI?=
 =?us-ascii?Q?dVJhk4kJmd3zWj0Vx9If+bJ3MSs3i9NXMMFCF6uAy/XPHC80AltL6PiTrQa0?=
 =?us-ascii?Q?FmaxwAlBeVkfXhlbxOqz/+9i5Hybmz5OG0B+ix5+th4FrU1aqtbMw2IuGUio?=
 =?us-ascii?Q?pN1JwBKAEopDc23DcAOEzu0SMDR61zlJ76HH4Bdg/JOENUCZ19oPgBViW5dy?=
 =?us-ascii?Q?tcQDQjL2wDcNZqAuxKq3kQbNE2FYCfbSqFXXzMGdvMiuymX+Kle1BcPse5hr?=
 =?us-ascii?Q?0o+BbKbQF5fiNBU2zlMcFish1mB6wmz4GzEomiWy+0G3d6LpXjw0YgtLIMzF?=
 =?us-ascii?Q?IYwkMQFdMJ2Xyq4vl0POe304uC1iBKqle1wZIZ1LRrXYFCb+iZNg25p7Aby5?=
 =?us-ascii?Q?8IH5Ip2Z/3sAYHiht3R42YZaKJjbaBa2i4yUHM/qegyXhzQrW5JyBBiytsu4?=
 =?us-ascii?Q?WPMjEZ34afI0bELwRNbvcFizBGe1h1bVnLo8onIDdwnviSPWcBZQ/BWSf53V?=
 =?us-ascii?Q?DxNNwJfGxGiLzhNS91tNwh82U2sFCpdt0vvviRxvFPNp7t2lONNEDuyVe7Zx?=
 =?us-ascii?Q?IG0N6168JYkgGriWTFV9Ji4CRkOnTDDBbfZ/3OgVWi+kQ1CpNl8rQ3fbk1UO?=
 =?us-ascii?Q?C0Jy6bophan8b8NeVklhtERoty04kCkN8cKHNV1HCwcY0gXST9vlcjUG+OT8?=
 =?us-ascii?Q?w4TkbcGUx39iwCw+y1lW7kd34eaE9C7dDW0D4YkaYpaNBtY+acaE6H0tCGbF?=
 =?us-ascii?Q?BlmJqqzK11xpHuzDGOlI1EsUh+9t7XEGTa3TVXa5gWULQZ/R3s0dDU59XGDZ?=
 =?us-ascii?Q?i6dOUszHqR76yEdqY+zBVSKUDXd7Q03/ELeH3DYWlRYOH2kuJ4mOS4pX6+BU?=
 =?us-ascii?Q?Du9uI+jTAOVvFNph7WApVj1Buh1oI4fBuHEYHpIZi4yX/cPpKnaYG7KOhg+Y?=
 =?us-ascii?Q?HEw4Qn5jzyICfQm/J0q2pPB00K8UWu0Y+dOOxmWzhZswJS5RIQ75GRihJv7C?=
 =?us-ascii?Q?nytcu0ZhEL7Gm1NZDAuXBjfDoRCi+RtbbwzTRDNReRNbqFKaSdpleG+a71Nq?=
 =?us-ascii?Q?1Pk7/jI+VJKbKnGYlf2j7eZYz2duQiCM7JgK8KYhpCQOz8HkMiQ9MEHMX8Ho?=
 =?us-ascii?Q?Q4HONWqEH5kTV3CjiHGQAMj5/d7k+4t6fhsurvNYJj6fvSNs/VktVDXr/hyQ?=
 =?us-ascii?Q?Hs9NIEAhw4weqYAxfJHiSjchoJWUOMhPrCXVWpnaL+s5ypXdCn3AEfB9UteX?=
 =?us-ascii?Q?bzA5DMSwMgwW23DHtXdqKfeu/yoCM9EbAKK0HZjWlxoaOxXnwkQRGbOnqyO2?=
 =?us-ascii?Q?39MSPHo/MtRZoL9QFnDckarumhoLo7aMBeP4PXlTalaN0oiarF2Slcj/PGvW?=
 =?us-ascii?Q?uQ07d/0ADGpXoFyMwdG2ERuEetJe8bsrv9wQopGJPlb5hfPZia1bv6GBMxgX?=
 =?us-ascii?Q?QOJHXxpH5cQ4IKwOAiQxPyiU092Z9a7csaGfcMkYpuSAc48lT9er6hw5a5wy?=
 =?us-ascii?Q?RIoOK3CpukU0nUyKLr5v/fw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8c9523f-426f-4912-fa4c-08dcc186ed35
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:14:03.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 isF1YpTPIvexpMZVoA+b/o0s+J6JiqH20dBUhkWc6DuccahgfCzD05/8ndLInPrO7LUNhG8buzqZ7VjAeGNQV5BwxP2xA3IaMubc10kZsTOoCwKTOHmsgHBNB4ga70fR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11873
Message-ID-Hash: PCCV344LJG7WUIO557KRBXQ5Q4T7AITF
X-Message-ID-Hash: PCCV344LJG7WUIO557KRBXQ5Q4T7AITF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCCV344LJG7WUIO557KRBXQ5Q4T7AITF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/capture
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
index ab4e109fe71d..0d1b215f24f4 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 0e18ccabe28c..98b37dd2b901 100644
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
index 3425fbbcbd7e..1bdcfc4d4222 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -279,8 +279,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 56f7f946882e..051adb567397 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -966,8 +966,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index d2588f1ea54e..42c60b92cca5 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -291,8 +291,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, np, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e..09aa36e94c85 100644
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
index f1539e542638..7edca3e49c8f 100644
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
index 56b4a3654aec..928cf5cb5999 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -155,7 +155,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 302ca753a1f3..4e08892d24c6 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
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
2.43.0

