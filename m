Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A190A0FD
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 02:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B5FCE68;
	Mon, 17 Jun 2024 02:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B5FCE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718585539;
	bh=BXdEy4rBSsI1XqWIHjU1yHH/aBia4P2YdpMKjHS5KzI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vOzh8FlxBOlRMLPWCzVAqdti4Jva+Um9UjaBEjj+ASyNVcZyEcWxci6mbnaK6UXeR
	 iDhFA1bMELUNQ+WdrgR1kmOX7dW2VWgA0UiuFksfQpKpSuzDaaEZjwn0K7jgg7tics
	 z8czChP1H9GU1oowQ9tpER0oXdFOQGlgnwtZVg90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D49AF805E5; Mon, 17 Jun 2024 02:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 343EFF805F6;
	Mon, 17 Jun 2024 02:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09C1F80266; Mon, 17 Jun 2024 02:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8961F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 02:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8961F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IWnbhFe4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY3qs8vd/qf6TFBZQpQKh1NCMQIfJpEuoISdeFbO9fJqnAsQdkSdYKGEUNz0kUCEHFTOExIiGAOm948X2QxCGn3XPjISpxnIMveKXXA1VZkLXFbmzysqtfU+pUYGBG7mrX1b0/TTkhlQkGAd/LnQ8/PgB96BVleDks422vpJaBSce4HGkJs23jNGGwd+Y4RXaNGuouymdbVID2GwmsAqkIejIWMapZgmMS7sURUa2NLRimqPkfdA66tPdOxEt+/zIz8xK8aJsTVLPQSzjDrkoUMGb4qNcHcHtU20o6VaQ+YEuFs4Tw0oeMqBnoKM5KpkcQrRkntot9hJWY64Q40IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5iITOs5R5cfPgTMhiC2uT7qEz5o6IQP5+fLA9G2rFo=;
 b=Wl0nAWhTmVOiP7KeNqieQ3PZthmUATjmzlHo7FR5TX1DUGo7wykDSbpzlncRZoHKnP9f5zVDf1QrHa0xmXc2NBKN5cgsK3jfLEkXhAIK1CqckdPPXlmak+PBvoMO8mS8mG9TDCmIgsU6Xx0UqJhbR+OxvMeJ6w97g3WV8c0YcEFqW6ok0SsQqKqULdzqt7gVlG9NEAcXEs/sNqFAVL8YJeFlU7j8QvROem61NAWpQXWXh83frMF/qvieNnvvIPhglGglEFKgqJkrpKN4LHtS+nQOw0bM9z8RbphYxykL1Ocr3FViq6w7cwJO7ADl6PlIE6WWmuH6JCxmwGS0mCxIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5iITOs5R5cfPgTMhiC2uT7qEz5o6IQP5+fLA9G2rFo=;
 b=IWnbhFe4GAZIDfBd268mVlnhmwz2wToVPrZq4PKlgTBTzCFOVvuUpyb6C4KuzakXqfPTXivrHzsjQzwc2ODT5S2xogGme0/hfYxxjQRr5C2/SPpzYC61Tj0DXTh1PVvx+ZczwL4M+Aqbg7c4vOs+LBLKHpPYs+2TW8n5SIyTSwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7897.jpnprd01.prod.outlook.com
 (2603:1096:604:178::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 00:50:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:50:40 +0000
Message-ID: <87zfrks881.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 2/4] ASoC: remove
 snd_soc_dai_link_set_capabilities()
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
In-Reply-To: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
References: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:50:38 +0000
X-ClientProxiedBy: TYAPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3e58b1-3758-4c6b-e98f-08dc8e678254
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QSzWGLRcA1rgAxNViOyv8OuK7v+JxZOdOnUwTxOgLRbxdh/YZzXcg73n15jy?=
 =?us-ascii?Q?5vsa61MwqKzf5B3d2vh0HOsPClxrD4+UUduwga4P0wra2uY1sbV3ocKSBkw2?=
 =?us-ascii?Q?mWECMNkhv8TTMdG1bMLY7DFfXMxWT8mOiw9vtw5v2T/fNj/R2gddHtxLkvu7?=
 =?us-ascii?Q?KGrnehYQnE3sa/23FqZr8kMBlwUAyYDpIBvn03j7VMQYJk4R/GsBoOwuHn9o?=
 =?us-ascii?Q?wTqrHsevkt7AL/cS05lA9ergdoUudGlyTMevD2NdBK+ztuAPT+FzlMbNnCnW?=
 =?us-ascii?Q?YZrg5FKzBxxDv5FieyAIi4fEt/ynjjFOj5sISMj1DtV/Zleqy9gY86uVJTz8?=
 =?us-ascii?Q?lUuCzGWIZcUcvjp8fME1mt8hby7S7Cb7EEyXcVhvdeMPzzyFRwkF9eyv86MB?=
 =?us-ascii?Q?ObtQJjPNGwUuwGnXWSEZ9UpLYiJk6Xf2RYheINtQtnMioYdxXT742WkZve+Q?=
 =?us-ascii?Q?5XXX/vVAlXUJW3WVDrmieagu1PVXYSMHlWx/cxoc16llprCpirV6Ye9NASOM?=
 =?us-ascii?Q?PDgrwQGITM6zn8PUYlWKnGEhuAJroPrnX5l6ZTAX+XAYOL8vqPE8xYDQ81tY?=
 =?us-ascii?Q?cwF+OzGC2iPPeP+BiY/3njvycA3FeJlBoUF+U/wjetRBcKM8gPL5XwWhfPo0?=
 =?us-ascii?Q?71T2kjTC3+AxOgTOnLFbrBA4qgqd7F6X/elZqWRe8TzkjGuwY4A/d+aqW0u0?=
 =?us-ascii?Q?ZCr6WiqRwMp9QIeFpKkhiWcUdXAKYVcEMnHQeiigTQWSZCpntOJaSzHYHGfc?=
 =?us-ascii?Q?QayZj8iFoaxyGRBUDB6pq54A9Y1t8oVNkvdBm0UrjuCzidYDmHeDqsa88mfJ?=
 =?us-ascii?Q?rftHyTf0aOjgKrXCdXXE9MY3awlw3nYJdqIpkguyNQS+R0Dy0PLCLWj7Vta0?=
 =?us-ascii?Q?PH+wBE72YgKq274JbM5nQW6eGhSc8pU9BoEu22VE6c79fJeFTwLKKdqUyyIb?=
 =?us-ascii?Q?BsPAw7+CnTtV3hsZb6WEpsmaczPdRguZf0IyqDVTF2vT6iMS71KN35Wp4Iap?=
 =?us-ascii?Q?zkk2mRwi5z/Xqc1+oWVhJb9WOUCu5pmQ/njuVvTsL/ltIm9ECQRiW5jDKfp/?=
 =?us-ascii?Q?uQc4hcb6Q0y2L1XmhnvPSbc1Mj1gZmvbl3xYPc5Y7eyrYu+M7SPhhZEc8qko?=
 =?us-ascii?Q?9ShsAt4fypfFaTTPKUvY6h+1TSOqsafaJcEBskana53xj08eSJ9imYqQx10W?=
 =?us-ascii?Q?42pVOShBy1gJ0NnZB4xuEw1C+BTmrLlkRF3KNfjEiY7NXBdI522tX/qRnd7h?=
 =?us-ascii?Q?wkvwKbBq4H2qCd8dixz+68dEeohbVVApiSkRpkQ9C01HGSHG13dArr6lU6CR?=
 =?us-ascii?Q?7AFPAyXGwiwXe7LH5bObmn1lCBIQnJ92lFLtcVpBuV8l293TtchqFuo9hWaw?=
 =?us-ascii?Q?KizwQqeydagLvHg5KRoGWDsGjvBQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWTDcp1TvAFEfygGQYuI5a6zLuiU6OOpD0PiFfkF/TcAvyFQ2pDASHcXdW47?=
 =?us-ascii?Q?qDfcLvt9omNcFJ1ZL7elPah79UfCmSWoyf2tEETY0SF00qsJSf8Vaw2ILVVK?=
 =?us-ascii?Q?9itfIbAq/3tGpdA9Q82fanubFPP9bpLT5tuEQ47xeFrGFWozIe9sW4fx+KkF?=
 =?us-ascii?Q?rXlZZs+oBsvuZHLS5Dzl859ysMSbiLoWEUbdKalXSDRGcxYZS9T1npc/yw5c?=
 =?us-ascii?Q?Rjo7QaROfy3d4wXEyTyjqcgy1g+mFzXeS/YvgBGbA+EbZKbbD6Xz3yI0Lh5Q?=
 =?us-ascii?Q?qkRmBZwlnTYnmFZeVU2VgHJp/Wkf7SWuKTplDmoIEtv268nZVN1Zcw3sNyIi?=
 =?us-ascii?Q?L24P1oMRNUbO+XUC3E/thG5weptWL+ybw6WcYRpcQbceJB1kanxJPjy4/SPc?=
 =?us-ascii?Q?yb5e6fQaMJD4lXvxhhwBM4j3HCB3vaov5ZvGUs5mZz2FFhnH5uUOzuYgiWmS?=
 =?us-ascii?Q?V5oHRjJaGsFJg4FBHIi+9UAy5rDjLFngi9M+yFXHWYAa29SFlJV3uqOEOm69?=
 =?us-ascii?Q?I49wMlLmmecJK5T+VxHlCytM/sQECWiVyHmWZ8HzT0rlZkn1Zw6qZ2kaSB5L?=
 =?us-ascii?Q?RxovEu5021+Pcz9sNJwxM48S4Mt7G1Hxoeo2vz76rWOQoghqZVpo54Pjx0xX?=
 =?us-ascii?Q?mOoynBuPJ+2IHd7imZwrQAX0Kn41WgGtAbu4ocLv8VNXLh0f5dVtx8pOCM+J?=
 =?us-ascii?Q?v+H5a+ywraov9AdV6Yz5VRCvfHC58op0EC5zqSFokbi25enrVHhYnUw7VV3i?=
 =?us-ascii?Q?TdHTbO29sRUcMtFY8YRHGc2oEXGzT0/0O+4fy3hL1HddXYqxqIVsGqJTSr5S?=
 =?us-ascii?Q?k4XnCcfh915/PkhuRHInWwBYeJXnzCjBVgbYQgrrWLKxPftW4MJUcz15jqIH?=
 =?us-ascii?Q?eGUV96Tkv9JpvRES8jxfQDVURkPDnD3ZRD0qKLozuuYbCIbXVTZ2r8rDmS8H?=
 =?us-ascii?Q?Rma8NnR4o/m0KqDhI939dgYtFxZbF8qTCHEpBHgMPDA5P2uMyzz/+9HxDc6C?=
 =?us-ascii?Q?FfPRl+0ZEJ85FTxJrpEbTJqHBd+Og2VWI0MOFmSWMXdW4i8yWN6WNyodnZfo?=
 =?us-ascii?Q?PZHDZm2lJjXPLJIK3Eg85ZcepnqhK6TxX+2yhesKhCpD3r5G1L8ezkQUw555?=
 =?us-ascii?Q?zf2cdJ7irvDeNZ39MBodMfWtaHFV/s/UFYs+ypVp7N8bOxF3DqnEOkbqozQS?=
 =?us-ascii?Q?+QuVoa9N80r0JKBup/kzVmlSUkBo69Wxo+gJLFfpjAc2T4jS9Jroa4SYa8Jt?=
 =?us-ascii?Q?MbalteFFY6gBMludyBblnKQnukuPVXk+XDkKAlSYWSd4bfuYjXQLV0MTHYGk?=
 =?us-ascii?Q?DV0T2lCSM6iLgwd+fR0O+B5dFmtTvUJHGbJikanmIeCfgWlBPwBkuPnLvwjI?=
 =?us-ascii?Q?rkCgCpDPRH9JI5168WcA71ZyLKa33DRvOuzW+kpKCKupD3PXELu4ygjZC0aB?=
 =?us-ascii?Q?rGLZNg1MF0FYUq5tAOgJIOyPvTUjl+6FRe2RVMzbU5qXVSEIpfYMgcUoaTCs?=
 =?us-ascii?Q?2grWApBx+I01CozDj34Jpggq18RgrYey7ktfevF4bxea2gUaXc/5ioqR+/zK?=
 =?us-ascii?Q?x/edUrUkLzZ7hMn2GF43Wp5OexaNe2N77X2j60Z+WPNupdTCeO1bUyLXQ/go?=
 =?us-ascii?Q?NLWqgBEwAVhnDLljGh6UrqQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f3e58b1-3758-4c6b-e98f-08dc8e678254
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:50:40.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5zJhkyTlhsR+v3Uu3kLpY4Ddo7gR6G+eVtHdvgfFM0lKkVWKJHxDqLPjMGdQ9Z/p7gK7ncWy2Rej+pbwQ0Wk3QZd29mjC6WzqyKuxHGYod/6NKTIskFRmGXpBu9UXDiu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7897
Message-ID-Hash: U5DZCZFN6ZRJNC2I62OSSZQ3OA4ZW7HY
X-Message-ID-Hash: U5DZCZFN6ZRJNC2I62OSSZQ3OA4ZW7HY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5DZCZFN6ZRJNC2I62OSSZQ3OA4ZW7HY/>
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
index 15ef268c98450..e73e906298adc 100644
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
index 7b981aa8690ac..2495b0ca3d2c0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -265,8 +265,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8eea818887580..d7641923fcbb4 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -953,8 +953,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 2de5e6efe947f..0eefb348ecd3a 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -280,8 +280,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, np, codec, li, prefix, dai_name);
 
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
index 03afd5efb24cb..54348a055566a 100644
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
2.43.0

