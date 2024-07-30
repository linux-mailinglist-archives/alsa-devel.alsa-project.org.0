Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E73940317
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAA3E76;
	Tue, 30 Jul 2024 03:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAA3E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722301630;
	bh=YmGwjc52Pg/rg6c5XvUuJ1GiVFvUFEF1ILm+k0568ZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KHntiYUwiASZwVJtzktA6GeM1EolNj6Zpk+Uxg4meugikQwHVEn2Bj1+D2KjQTtOk
	 rlP89cLoU/ulIcf0LwJwt1J39vCi/Wz7PfUg6QFwmdmGNzqjJ6YadsoZ7ZIlVAwZn5
	 wHtEdDI6sWsSOrIxxiVrFY16ytfzVk7KE3OjiRa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5582AF805EB; Tue, 30 Jul 2024 03:06:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44880F805BD;
	Tue, 30 Jul 2024 03:06:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 749A4F802DB; Tue, 30 Jul 2024 03:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE5E6F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE5E6F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=F8rd/IaS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRJTzJanXep7DIO6q0wroWYtKFgKkMhQcbZZO2yURdJgl4uqzhMt/vH7TSAClAq/cFZA5GFD1F169oFYTRx8SYtBd4C2I0821udJw6hhcOkXKglbsBkQ6VvWUMWCmwwPmaVYKlLdKUz8DE8WTZED+l4/3CoPLWyDo0Jv9lP//P6R+wUDMXxL6ffl6ESqJg1NPPc3PwqTfBQ0eDd2IrG/S9pAiML8rykTI1TumQHDQj7irp1BPzLGCQm5xKXwohsPiOWFYA9DGax8y2z4IoEovx9Z/NUsvPzPAyXDORKRpjV1fF+jIZSZAPd0hkSLF34+h+/Xzw5628lrDwv3ddvJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2RWZ1TbORupgUj5d7AzuSCLVdIxvvk3nLVYV31WKrE=;
 b=p+ceDcXN5e/jegWxdgUVWZFTUz479j1Sm0W+dgzEkmOkL1WU1Tij0zLuBFXTywn+sk3TlgTqYLFMBrmH0Q4DCKywVf0WTVOparLwYCD7w+qBi3bx91dBQ2PNI+8U+Z1GqcMgG46XLUxYn6qtPTqGFO7KE1hyUztBwrpxZIzNDjnyyQw81jWBKoDKN1rn1JAVw0CDZU0/r2C2I/Bz1UrmmE1jfISiGhFj+W/nSPjDsL1i7gXIGFse8RUkWdilC9fGR2VqM+VMJSYTX1H3E/8yIEiHA35FwTGKHdAJx14xBTkTdETnhBTV9Dwzjlqz0doy/UdQqN1l02PMKj78+i+fyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2RWZ1TbORupgUj5d7AzuSCLVdIxvvk3nLVYV31WKrE=;
 b=F8rd/IaSdy27yXeZUJvpi/kiKlzoB4wwbVOyoaDyrcHQQBRFKczblVVo0HWpmbU9nXLF0mbhzFSLP0MiSe7qDvZhaI93Ijvmb5PdfsDY0TR/PGPkcxn7qPJRic5RzJzD90J3CISI5oABAWz1Axpm0I5tAOGf/0hQ/3Zz5hO2Krg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12484.jpnprd01.prod.outlook.com
 (2603:1096:604:2f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 01:02:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:02:48 +0000
Message-ID: <87a5hzlmja.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:02:41 +0000
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12484:EE_
X-MS-Office365-Filtering-Correlation-Id: f81f5d7b-3352-47da-36d0-08dcb0335068
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sGZFXNe8xS4alkQn1w+aK5PTncGYie3d7SpkuVi4FMMATs7rZ8vTf+SwIRc5?=
 =?us-ascii?Q?9DKgrUDuMeZJbEhgi+HP78oH8FNfBWyAtnLMGWQNrQxhcxgTCUbXR8m41Sdc?=
 =?us-ascii?Q?VtUbKx5cH19r+Owgz9F2y4tJg9Qv5OX3Rrh51QSjxtwmGUpwqSHq/N1N8/RC?=
 =?us-ascii?Q?45ZTxxi0pzsnIAg4tzoG+yErUvcqFdGl2jKUXMFg1Y4cOnfCQ3E6vHGQuAJA?=
 =?us-ascii?Q?moseiSEjSIohPrC0qZy0HBnX/Xn3fkb2ApYGDcKKsUWCvJauFuCEklhNhfBr?=
 =?us-ascii?Q?7IxQAxkiAmzK9MwFFWOczVJV27hc3Iz72VCI6/vNQGlvO2UP973rnoB/1M58?=
 =?us-ascii?Q?2T7DpZP4IWphmTBn/EBLHx0WAtSUGf1rYdiRMKpB1mlgtkCi0FoVWrWY3mmJ?=
 =?us-ascii?Q?jbJY4gk7FtZuiRl1L8WAHQMuU0UjAIPZrMDfXn+00dYc3KuZM/GLvo+z0aaW?=
 =?us-ascii?Q?4fti+eZcXxJzt+qn6QEUaa9FnrhnlPDBLSqvBXFMeZVYq0vxEK3APJsndBIU?=
 =?us-ascii?Q?F/ZVZxk9ESNfmFVPFI3+tfn9lJ7/BRz2qIAPYERJAIVdyt7+/WzL6HwG3FgL?=
 =?us-ascii?Q?cvPw78emaIbaPoX1oYj4I+j8f4JEavNoX1YS8zabA0JRi3j4hRu8UH0QP5n5?=
 =?us-ascii?Q?dDo1aR7CTPuJuTENIwl+xMFQ2EEAKXX5ba/UPpF2cWDEk+50kdM0reqirxm4?=
 =?us-ascii?Q?I4rk+BZjrovw2DZC3D/ckwkQ9hYLICd1Rc9iiNmaEM9nwucUXU0QjZVPMjeI?=
 =?us-ascii?Q?kckcozVobi7RQ1zcOGIPrkaH1RgjvJCAkFnbzmSwJWjE/ED+ZisuvpOg8cnZ?=
 =?us-ascii?Q?ky57HSyRtESnqKAyK0ppTFWqvvUhQONfTUff8eRvFpRs7mAA0ZVmlK+PpxAw?=
 =?us-ascii?Q?0Gv6B0WI6xbpCLsGMQQ4DsfezVwBYWBZzE3vvugLONLfBMU0CczhjSKvjqry?=
 =?us-ascii?Q?5NhUKYrfJbgNmhXyPktRozT+Ja7s/hqBGPYjbZV0JoVucCd8BUqbUi+IAWSE?=
 =?us-ascii?Q?1UPX9Y8NRNDMwr3Bl+rn4IVZqtl1+Z9S2CNF6Q7zehyEEQDlz27cN2qruy2l?=
 =?us-ascii?Q?S0Ok6ZGfNFmn3UU7MOzbvWEAedHjHTCIEd10LKY3AIve5H8NVPMcPGrLeZEF?=
 =?us-ascii?Q?A3TJ/+zeUx7lJyaL57zOuHyOHsPELEgbNpBJlAlSXJxlR+DWqYRVcQcljr/8?=
 =?us-ascii?Q?4MapvWkrXK8E4X3CGgG+p7ZOWPLRBg73gYJ5u7cHeElXuHo6hNXrBMH5qBZe?=
 =?us-ascii?Q?CBb6rdMpI83u084KsAVaOxk382vLFkk+NDiKQNdJ+ce/ROfOflNKyEQX83TL?=
 =?us-ascii?Q?bt8YdCgiSDrHZ6kCTEl0qj+njskBipOwpOUJz9nQqgvoqvjOiw+qLHk+GWBV?=
 =?us-ascii?Q?3wv8ak6s1IBnInGFbEy29EZH2uW0bRkltD2xrFlzCLtM4TjiLpdFZqCCoIWU?=
 =?us-ascii?Q?zQH9sAVYwWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v7MMdfxz/vmqVP3kAbYjSGajsakdq83TeDSEXMUU2QwJJXxvLmYTkB8+T3KD?=
 =?us-ascii?Q?ziXBfSoSs9WAJtEJE5CcSy4Ku4og5euQ0DstpYMpqIwHEXdSDEuuCxb2YnY7?=
 =?us-ascii?Q?4d6co0IiErRJDCmR3C6dRWzy6DWr/JyXENis5W7MrRFgR3iQGIhKQVlARbTn?=
 =?us-ascii?Q?7vpmXs3N5cDJG2ulKYuJ6wVpWF2wzR2zETbL4xJBODzCyeRQUoLUIu22vsl0?=
 =?us-ascii?Q?Q65sk3rCyFHrki7AAP9TnlXF7PrAjVqPfhVr56TL7YkON/SadeAuw/cCgehT?=
 =?us-ascii?Q?6Pc0FCynZtJGR0HVSIi9Cqc1edLMwkksVhbPvittJsgcWnaj1Pa8V41R3KZg?=
 =?us-ascii?Q?j5I025QQ16TyfibuJVvpoGedT3Bts/9btBfwfb29CvINaHpYrw7jSNIF8VHW?=
 =?us-ascii?Q?uVpl+37vlMnHq3G0NSFCHN9qMhTyDlvhwmnfUQfGZIqaiw0jBP6gvkTn0o5P?=
 =?us-ascii?Q?HpnLh0pm8HQQq7u9kevjdMx/xyCbDGn0c9+SvlFVq81E8ZHCj8dMFHXm6cF5?=
 =?us-ascii?Q?gFk+omW7PNkDir3nEa6RQs4NTgnDXseZDj3MRZOVaYaopNyienE2oSweR9xX?=
 =?us-ascii?Q?ac+f+ahMwrK5hZTfNG01nsWogjCw0eaZG/phA0zXubFV+Uj0cufrt7u/5Vk/?=
 =?us-ascii?Q?dyb6zxvIraximX0AXEGvvzHMJQMd3XqeAfXOJCjWYRpcstQW7iGJLom1/F13?=
 =?us-ascii?Q?YWzOPCsM3kYSQAut6g1sDYaX5ORSw4fL7i45Izkn4SH9OVIj+iDMw1fqGAr/?=
 =?us-ascii?Q?j/+vXVnvKW4gSeGsdIRTdGCxaf2QiVqjxS9hiUh86T0I6OFSndYtmAmtSXyB?=
 =?us-ascii?Q?l09ydgKbfD9tZc3excr9h3sjE3TexK78OkGaYxM3D9zvrJljbO3NA87re+pp?=
 =?us-ascii?Q?Hg0NRWP/Sf7VM8GsQrGbLkeOAlEpP/TdYCnEZSRAHKNad6CE7QUlyQucJu3W?=
 =?us-ascii?Q?jIeimdwYBvzsFKhDfOrIEiLF85JdBsV9NBvpJATKDYniwin0gx3XYP5R3OWx?=
 =?us-ascii?Q?GrhlY6ISA/deE+rSS96Sin1IuFtDWP0bZu6sqehLDBUllGe9E8vxb5OjjFRM?=
 =?us-ascii?Q?Xu6T6KN/bgUByacBgme4wXVazBEV2+P35Nr18G5GIGAhptNwe7XJt9npxC/8?=
 =?us-ascii?Q?kfCFOOYMqpSBEN1HZJ746VZo+R4dKEoQzZTxF4qVhRIHTOwOAFk2gPkWv/E+?=
 =?us-ascii?Q?W9mp7dWRIQNSGgSxQK7YHEoZzs3k49AS4okxKuxh3+YnCfRjHV6QfixtCY4U?=
 =?us-ascii?Q?1cNmFIsbU/mfuMeGK1wE3DHsXUYcFxx2otPLNFGRMfokFot39C5pE+0f/eF9?=
 =?us-ascii?Q?4kiU1ZN4SPPCQ3mcMO3BH31hbPTLbCmD5X0V499oVQc2XQPnpZ/EaLWzrOH9?=
 =?us-ascii?Q?mpd0OQ11uC9KZDDT0pc5IrsJE6g9SpzQig8QdtrdjsiMZtlgJwZTbEv0TY1F?=
 =?us-ascii?Q?EkZ4q9glxjzTg7igbx3avjSADtfdMmtsU72EVl17sCeoOkHTI8loTpuoqxjW?=
 =?us-ascii?Q?hmAxHe4ze0KBDTb1t9Ks/n8B1GnDqpo6C+2GMdxqgttXmh8NjnfgZe77tv/l?=
 =?us-ascii?Q?1eRI09Ll4lvyOUTehhIC5ccqEeuwvLa7axIm9SNvZaKT7QbsRoUzH6FLCWGO?=
 =?us-ascii?Q?A1yWoMOLNkKkAeTLEw+d8iY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f81f5d7b-3352-47da-36d0-08dcb0335068
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:02:43.9276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 G6dt0I0XPlyYYDRI3OdHVkCDQ9JFDZj5Bnme8OEHq7n4+Kj9P28/LTLcRLqZ6HdyCMD8oqgJqE9Eep3tp/ldOffFpHOXdO/SV0q29W0On+L9TD3iI/f4Nmsnw4iXA51k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12484
Message-ID-Hash: NMLFTIF2TF52VB7KRSQMILOAF73VHL2M
X-Message-ID-Hash: NMLFTIF2TF52VB7KRSQMILOAF73VHL2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMLFTIF2TF52VB7KRSQMILOAF73VHL2M/>
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
index bbb72ad4c9518..04f1d75e04b2b 100644
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
index 3425fbbcbd7e9..1bdcfc4d4222e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -279,8 +279,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 56f7f946882e8..051adb5673972 100644
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
index d2588f1ea54e5..42c60b92cca5c 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -291,8 +291,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
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
index 56b4a3654aec3..928cf5cb59997 100644
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
index 9e47053419c16..d8b0e1f500460 100644
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

