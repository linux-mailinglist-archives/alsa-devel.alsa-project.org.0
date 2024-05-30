Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C78D42E2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:29:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D303828;
	Thu, 30 May 2024 03:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D303828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032562;
	bh=LRMNwDbUM9TLpM6p5n8UhD5/Zbxeo5hjnKGo6VgO27g=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HHxq3Sotmf1vA7pl1Hq6I/ybv2CggcI686iJwUMwhTJsq5GG9kjdhR2ma8ic2y5U7
	 rhgDPtBF5zTyJZUTNCYIpodwYiYU/KvNL//mjmOHo5a8LPQGffq/Cv2gZQQuIg9FIg
	 ETMH9rEoLXDy+VhsabF49X3IvqXdLIcQXbJu7woE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC990F80587; Thu, 30 May 2024 03:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AA1F8058C;
	Thu, 30 May 2024 03:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F6A1F80149; Thu, 30 May 2024 03:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1C0DF80051
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C0DF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Iui2k8ww
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N++ySDloS+/azvUAoTgQBMyBRmSlC873fOmhkQSHOLMZDgeQL3BP8cqK6Vj9BJ/hnczd0wWR+nu5dZM71xVF6DGXlCwTFzFovrVnnUJSl4Q7LPcGdmtPmc+49IlBnkg/KpmQ8YPvv+D07bVg0ld+TjpGBo/GSvTBsaTK86TDyMqb4oSR2mfEIH9+2d83VPQXl2eNJas+6tcQnDhKwMILoEUz3nXNCj+eKKNL3YjIYSPWg+9qqd8jV4ycmiCnVjiaAs4xpvDWhvxlBBTV0+HLiPHxPtHYZBqNav/XawuXGBctLZQc02zlLHSzOBOlyaPrAT8l9dILeLU0epKd81HOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRMNwDbUM9TLpM6p5n8UhD5/Zbxeo5hjnKGo6VgO27g=;
 b=iWncu4ImOZ+3OxuxurqAfKGy4snIMz99jph6XWLK6MC88Wo3LAptxzJnqz8SVrJ7rk/miAib0M0/SGAVOWjKo1Xktcj2lnDTT4hEowHtcWRQp5mUA5Hz4bcbFvG2wUtqgFFtVfkk88H8WhZyMgbccUw3lnemh0Zs1/Y+CqMhLrLFQgsk44WNlIge8dOApRNZB493KqWJYA50Wvv0g+GBf/4Q485KXZD6RJQMFl3/p+6lXx9QcrMBoPn6euKr7lzxBsffmaJmrLxmHjxRnXW8YCbpAe0N4fzH/VdnG94FmN45v0x/jOCTW91gbXcdscjgGw0RBZx4L3VWsGF385ZzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRMNwDbUM9TLpM6p5n8UhD5/Zbxeo5hjnKGo6VgO27g=;
 b=Iui2k8wwfU/16Sr7aYefPn6inSmsmVcutatoJqTB3vU4wvLBqwfXEQtOV2xSiymIb/1VdpvukhdvZRa0BvSL1hXp/kg3Zl1Gms9RH5KPW8VNdbtmZkLzCsIe9nBHNFxHi1ziPDq3mobQcA9taDggLn1V0uR8/wmBrvWpXYWNV/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:28:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:28:28 +0000
Message-ID: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [RFC 00/12] ASoC: remove/replace dpcm_xxx flag 
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:28:27 +0000
X-ClientProxiedBy: TYAPR01CA0222.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c90170-dd2d-49b8-a481-08dc8047cf0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IA5yGjEVmC4GeGjdZQ/AEBCconX2lb9XvWMUFMJN+5YxJRr5WDalrqFERBNm?=
 =?us-ascii?Q?5gDE33oahNkPJ4GhSySDXvWAxElJqJzmsL1ATzRMxOrA6+Vy7xGRzz/vHydi?=
 =?us-ascii?Q?nPRA4lj9dHhr1pAVC/LzsNmKJGI1zR5sn1Ay+texDIl8pFh6zntfKrLxblPs?=
 =?us-ascii?Q?FswDG4ZYffkuQ9kYxFQyUaNu5scWjgYhee2aM97xTKK/7p4KCjs1oo/y6+Db?=
 =?us-ascii?Q?Ls/v+miJo2I8PCGp1L7tqDrm11o7Ykusgm2ZYAZfPMJE1UQzjitw0JV2GKEb?=
 =?us-ascii?Q?3qVDUCOj2uROFUct07djO32eBwfnwH4i38OwgQijCiG3H5tXfJ6DTzUNfxQw?=
 =?us-ascii?Q?ZEHZiaviZuYhFcBFKyrbERLjRrqYfdt2AVSD8imshvLRvBhxQieh4j2oGKEU?=
 =?us-ascii?Q?0EazbHT2HGfAo1TP6NShYwNMRbqRy/fJfpSnAAdS+qJ+vIY6bdfaWCjwtItx?=
 =?us-ascii?Q?RTtI3jnwhFn1v8ZhD3vLOT/AR8/dgq655d7EvAR2bVJ/S0YeceEPehJnCE1D?=
 =?us-ascii?Q?fxlm8oXInC2go3eJnUqOBC+ck5LmVkKJIc2mBz4QbygZ1QdLWM3WPYAqfm2u?=
 =?us-ascii?Q?uVpKPWRdmn1vVqeDQm2HyyfPKpHM+Srj7mSrThgtBMa6ThkS23uhCvcTFuNb?=
 =?us-ascii?Q?xmiKU8ZDrVl4QuP/j6vQ2vbNlVNrzc1ZpUqQCvpAqVlVdjMOLqtxI6GSOo8S?=
 =?us-ascii?Q?glTJZ2Lg6j9UjKLj3ez4wVeyBPG+alguPFPaTE83RAdgYoLIl6SlU86JpRZD?=
 =?us-ascii?Q?dReDpfWpDIlWuNi6+QtgOqG5mLhWRUECY64Ew9M4XTgU71fDaDRwcWOl8Hxp?=
 =?us-ascii?Q?eDfM3f5aWLb3XZv7F7hDD3ovl+lPwNJqHQ5XO85/3y7wZVK4sglyfI8Nl3TI?=
 =?us-ascii?Q?v4agRmTYm7WWAb08kI7iiF30o9bdzkSF1cEnV6out9wkqGUh0vfwrGF9/0JL?=
 =?us-ascii?Q?1D6i863ftSs5868Ze8k4WfFQxJpx1nBuCV8OO4S6Lq0kdF8Jqu7T2MO6UXC9?=
 =?us-ascii?Q?kK5bu/A60+91TTArzXvshmRwfbUN0b91lP0eTObo7ftn7f9EEALAjusFAKVB?=
 =?us-ascii?Q?Q74eblqbrLK5sH85J4Siu9zuF3uhWmjosvVB/XJUc62kdToJ7Qpf/dKXm+5c?=
 =?us-ascii?Q?YoH/lDFP+7/fj0J+bvj5veTGs0B2YSkOhJVppfG7RsySXPvQQi2hzzCC/lyI?=
 =?us-ascii?Q?1XmCVqjrZugL9IFTQ773RjdiOdCOCrT6F9fMB2pfKKaIxaI0nQmbLNULKYCz?=
 =?us-ascii?Q?UWRkX95h/h12bg0IKIIjTw5nQXpm9oyhKwu+cqJV48R0++4v1XMt/GvIYBgM?=
 =?us-ascii?Q?KJNtR3OBMkVWKZ4zv4ucsKxTSMeWZuGYSyZkBkqNTSCjxIH/x3vnyvHnVHga?=
 =?us-ascii?Q?fEADqfA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BcoFN07nhMQeYzN+opS1yLEH0vD1ZaEvcES71KlmNhNtyXFUUnM7FdvUmZv6?=
 =?us-ascii?Q?O4PI1V6Mk9/u8H7noJnDcEujku5gW5P6zXuJKsJN6uU5ZKpWGfI6jtkNti4I?=
 =?us-ascii?Q?1+ZT7go7ZeO7RYGB+Di4wsdVFeYUn1X0LaLCLrpcYnuXYfuApx+1QZUNYAg/?=
 =?us-ascii?Q?n7LqnDfd36ttAJTch+x1QZvCb9Aq9JsGIdqgQoOX06K1G7mw8oyYO7vcQNw+?=
 =?us-ascii?Q?FhU8rgDRq/S85/i56LgFbEtyXV1GDCBAaPnn7aceUZAG4ET6AshKrshVgfHD?=
 =?us-ascii?Q?nAKgDfsQVmzuiKaixr0OXu75rAKUZpgy01PSfB9VSL2zZHfG2p2bXYWMfval?=
 =?us-ascii?Q?3t5cheDyjmTXtcGbqUNScHX3+lX78hodAXKH4flHH8QDIWxAIxG7NpZkcUeH?=
 =?us-ascii?Q?B3YvlYDIC3nkYdMK0w6GWGjfRrxnpfdmS7cNwrUOdQMkw939tnk5bP2BmAxd?=
 =?us-ascii?Q?yRGX0i1xthXH5QM8KtcxH0uxiwde2C58/U83HcWSvbW+vUY/kXjQkIQuVXC7?=
 =?us-ascii?Q?5y2JyC9U3pDOeqkoWSck+GTpUue5+5JLnSbkHim++Sn02YHEnQX9jPY758mS?=
 =?us-ascii?Q?8ynuNo/ZuZj2Mm6xuwhAjkQQbswNcYEzmBLQ2H4ihcX/woRCYaUUSYsqpyW/?=
 =?us-ascii?Q?tXhz6hU/nCIF9DUYbbP41jXKHTOHA/z0nDog8bU4vz6xbarV+7V3nDALiAdz?=
 =?us-ascii?Q?yEgbl66cj7GAfzasyg9pxiWWPThE/QM6FVlGqwv1VHtnT6zQn75OP877Dc9y?=
 =?us-ascii?Q?NuaC+0ySypf9/nyhXSWjLK1Bt4UseeT4sMYqB3ciygJLK7Fxr6HzZSKCw6gB?=
 =?us-ascii?Q?m17fwgl+Vn4UTEQHKEtr93YLUgFp5wgSPvjuWUxEhWDw+1S8VExLIH2+m95S?=
 =?us-ascii?Q?J+vwOClnk00oyc0WT0vu5ozYzjxw7PUbxZhoBWh7/dfzYF9RMc5UDenRNSsT?=
 =?us-ascii?Q?kk5/8L0nT5OnAdnHJZbIAHE+pcFzI3VV9Mv1wlz9kjXWtxR6xlEflRvvVTMT?=
 =?us-ascii?Q?/itaw+PViibx6pMw5aOy0bde1lQDieDo/QK7ap77xRBzy+0a3DWUnkKVrzR3?=
 =?us-ascii?Q?YtceYVBQu5zwzyl9OLGNfPZdhsXp/EQ14VINxpIRC/CHPAK36Qi+vWvGiZx0?=
 =?us-ascii?Q?b2ixfniZdSwcfWbRXuwNI87Mv2GMAYSGu54ui4J/w1STb02oO2tYaWnZC4b3?=
 =?us-ascii?Q?kZBgrTwlZSlW0mVwhzQCpDt4DDqN2iPpcii2flraK2I1dEA71KgSgFTq6uZl?=
 =?us-ascii?Q?0X1XghoWSRjrj/yPLNhWB7y99WXRYrA6yBVeFXUCYn+QK4G5JrETMt88d2Q+?=
 =?us-ascii?Q?iaZZo5pa1NRx46gHNzMcmZCWTCIZUMbAYiemgRLz0PUEsFthTHCE+J7JU92k?=
 =?us-ascii?Q?O8ufTgDgNK+x5CHoOqhXwXCfNdIW/RzdQL+StlrR3EPkOPv85K3eRlCjJbL4?=
 =?us-ascii?Q?ndtKteuV+gN9xytBB/NPcUl5qppk/fxZT1WYBfOia34TTT+a/pexNPaLdLEP?=
 =?us-ascii?Q?BtUvnurtmgaK6clX2Hrx52T673TWVlG9AkYKJFIskN6Qacl9aBZeQJ7BJpyY?=
 =?us-ascii?Q?ZRlQahX/OECeykOM8Kq0Fm1vg28iJvmtScGxIu4DyCTIEsx82edW1vtQf7zV?=
 =?us-ascii?Q?5xDVn0ISwK73qL7WM9Tgybg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84c90170-dd2d-49b8-a481-08dc8047cf0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:28:28.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QydoAE/vMI4aHfNzs+O/69D1Gu/+4heds/TlmGaJeEesN7sd+r3NmnpEdYkjVszps4H7F2Xf2NE5izvCKawKHBYTIha+KCLFgk2CT7HbvIzlB0eC2jGv2IG3WYGdeD6B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: BOMMMWOY2L2DMIOE3VGPVVZXIXOMLKXV
X-Message-ID-Hash: BOMMMWOY2L2DMIOE3VGPVVZXIXOMLKXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOMMMWOY2L2DMIOE3VGPVVZXIXOMLKXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi each ASoC driver maintainer

As I posted in "ASoC: grace time for DPCM cleanup", dpcm_xxx flag
will be remove. Then, some driver might got damage.

This patch-set try to remove/replace dpcm_xxx flag, but is not tesed.
It is just "RFC" patch, but I'm happy if you can reuse it on your driver.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
