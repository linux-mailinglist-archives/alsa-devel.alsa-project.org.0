Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F779CCE4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D243E0E;
	Tue, 12 Sep 2023 12:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D243E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513094;
	bh=YjP9zZKBeyKj//Nn0IBzbSrefGNZOZzGHIOUsdEOtfQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bG/a6medJ/S5pRRrLBsKCZt59L3xIUrSlTXcexLcfCOA2Bvr54WyV7ztZcxnCLQe+
	 NTbiumal7n96pVZ97bnK2A1YxVRFzlZ3eX6c7og290G4MMxLZ7ctEKpJwbm578mZ41
	 UJ4/40W276Jn1R1Ftg8U5PnBVNU6vgmlFTUVPK44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C55DF805B0; Tue, 12 Sep 2023 12:02:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3704AF80589;
	Tue, 12 Sep 2023 12:02:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EE47F8056F; Tue, 12 Sep 2023 01:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97469F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97469F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=faLbLL+h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obsrTNOpO+chriKd+GBNEHiV+wY9OWg5+0PfYzyAwEbE4UYAoZYmcLNzaJoKLyRKyfc3YVPoywpKdieUwV1evuA3wDrpWEs/pBKKdsKNNgaG5kcZl0Tt0bt/OXhGdzLv/Vb4yyGyniCQ/feT/IwAi/7gUGrF/HJbDQXI2XbjECyOoQHykVsufnO3EwXd1CQ6qHAKg6Pl5NIV4KrmmfLaSaOY3NgttbuL58CudRAh91bqwJYd500DEdf8lcA7KzHfonxgP0ScTLl+CfsIBC5YDpmwZZQUoaAvCnG8XtQwkRb3TSGgFS0SGPtlYnK8MFRFlvun0xv8ymIK9lmQP8B3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4nMvYGUkREdIQQ3OflR3p8QSuhtbTM7Jse64yE+/8E=;
 b=F55toeskIOz7nYyVRcI+qn5RBAjLaB6gmeBXwOopKECZn+wnOEpWChyqr6MAzaS7Xce8lwwz/4eAQ2mOY0Veytj9dlyko0y/nsGenqo0LAkIl54VmGOmqzih6wz2WcgR61dfePBBHNAnOyeOO+EQ6NRWTMF3asCE8eCSSMLwLXB7Up0qEHB1aR2jMP1igXROuoX6NRWAcZddIuj8a7XJ8yavEZt2kRVt/oxWeXjlxX0mphZYNa0cm9JxGFezH8jNlME82MKRSOSvTawVuu77Qs06IqUyJYV1kPtlyDC0hmCo8ESgHzSbcMWeOwQ7FWr1H2xxiofFP9ZbULyk52T5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4nMvYGUkREdIQQ3OflR3p8QSuhtbTM7Jse64yE+/8E=;
 b=faLbLL+h6sfJkj/p64MEYmnjWASRxY5qAD1UwsD+UxbQ7whrcNZj5pMdNNDTg8poRRbTriGq/R8J8VUXLYcAKAmr5k4N5VAZxytMhJM5bSAHvgx1gkw207pqfJS0hH01W/bG2q47jpx1DYaTsBaVecQ5Zo4/d7CmOc9YtfvzWgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB10735.jpnprd01.prod.outlook.com (2603:1096:400:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:46:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:46:40 +0000
Message-ID: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22Andreas_F=C3=A4r?=
 =?ISO-8859-1?Q?ber=22?= <afaerber@suse.de>, =?ISO-8859-1?Q?=22Martin_Pov?=
 =?ISO-8859-1?Q?i=C5=A1er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22N=C3=ADcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>, =?UTF-8?B?IlBhd2XDhYIgQW5pa2llbCI=?=
 <pan@semihalf.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Ban Tao
 <fengzheng923@gmail.com>, Banajit Goswami <bgoswami@quicinc.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>, Chunxu Li
 <chunxu.li@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Curtis Malainey
 <cujomalainey@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>, Daniel
 Mack <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James
 Schulman <james.schulman@cirrus.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Jason
 Montleon <jmontleo@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Judy Hsiao <judyhsiao@chromium.org>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Rander Wang
 <rander.wang@intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Ricardo
 Ribalda Delgado <ribalda@chromium.org>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Samuel
 Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Simon Trimmer
 <simont@opensource.cirrus.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Syed Saba Kareem
 <Syed.SabaKareem@amd.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, V sujith kumar Reddy
 <Vsujithkumar.Reddy@amd.com>, Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>, Walker Chen
 <walker.chen@starfivetech.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Yangtao Li
 <frank.li@vivo.com>, YingKun Meng <mengyingkun@loongson.cn>, Yong Zhi
 <yong.zhi@intel.com>
Cc: =?ISO-8859-1?Q?=22P=C3=A9ter_Ujfalusi=22?=
 <peter.ujfalusi@linux.intel.com>, Fabio Estevam <festevam@gmail.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>, Takashi
 Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, asahi@lists.linux.dev,
 linux-actions@lists.infradead.org
Subject: [PATCH 00/54] ASoC: convert asoc_xxx() to snd_soc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:46:38 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 14464eba-6f3b-454d-5d38-08dbb32158b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	haJbjFZDVumKl3Hf87kqcfYNtqRqf8mZ1uwRZynii0Wx5ISmjReXLtm9YbX28ZTXvg20rwhO5jOh+esj1JLURdY6KjSKU+iudRm6Q3rRbGhkG/2+erqMNOQ8FiAWbt1B2cJss1bSs+cmHbajwIvd3Fc56BT+yrOqrJea32LAzJViZKtZl2QpSnjyEh5wN8+8qaomWZyI/KVNp8eLFC0Agsoj3+pzxMw18QH4MWD6YELGQ7ocvdfQlZEZH19wO0QN3vNouB6XQp3NvT0S6U3X8ashIi6CKQ4xi25Z6D37OD8POblXQSd/LnaaWmQHqj9rf2n6HrudntX/OQdM1HjUv8TgP8ydEUrCT9J6HTGclSuyN0ThxrQS45XMFq/EpWg0UfvmNCev6+fzRSE1u8rz3rtBa4mhxiptG5BwS2GJfqcDV+nTvZAlLNWIOAMgyXsU5SxjI6fe4rmfbvuR4QaZLYzgcYsuBnOlqO/I3RG/Q4DoYRO/0NlOo7NH68S4dRU43GmwPmSBVjCt5tetXZiLX9iudE/20CrMiyL7Myj8FF+JG9vTtiYh2ep6NrY80sn34eXoPN/IwY0i3a3wg+lfx2VoZPt3t2KGiyWLoyphCwYjFKR/ZCLwFuIDTakpdc/WkZa/gvC4P7kYUngQv6J+RmQbWvvaKJMTbHiMblFUdmUuDxywiVQVXyirtns6NPcihzcpVtNjaHt6E9Z1V+QscQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(966005)(5660300002)(7406005)(6486002)(6506007)(7366002)(7336002)(7416002)(52116002)(26005)(30864003)(478600001)(2906002)(2616005)(83380400001)(8676002)(4326008)(8936002)(921005)(66946007)(41300700001)(1191002)(38100700002)(110136005)(66476007)(66556008)(54906003)(38350700002)(36756003)(316002)(86362001)(21314003)(41080700001)(357404004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yd4yG0AdLzLJ16Owh5zwGSPzSPI0thKLMRnHICA1P2bRiDUQCDLi6nS2rpAe?=
 =?us-ascii?Q?IQSasfeS1CgcOOumm7YSZ5GZvHGqOjKtzId3a/F0d22IDeZ+EKIy+Skz1ns1?=
 =?us-ascii?Q?ClF+CfFIGNqQobMiHXe//43gpeuoX+o6WLchbeh3A3305NYfNSeE9M7e9BhN?=
 =?us-ascii?Q?Ix9ijW1RialfJzFg0vvg6X9e6ZfuRWORW8OuB6L0E/IteN0iZw/hymvESs/c?=
 =?us-ascii?Q?+9aNfcNPndg7IXcF0YHPu1xPqC1V2ZzYe5exZ3ejlIhMm6NQN4fFoO09UkI0?=
 =?us-ascii?Q?sC3Ekmxzhp+4wL4PxJMhBg29vEJ7b/U6ZAww7JukiGQHZiYdiL75ydf029ST?=
 =?us-ascii?Q?H5QneXz7KDnp3Iaz5L96nBM42LAOlsZZVxd9094IKX2P4qzn5MxXM1HBNjUp?=
 =?us-ascii?Q?RCNh2FOn1FB+wwVAqJ4CRn9KuBPJFeUWvWYzQILAvM7xElWLrjbqX6hzlGDJ?=
 =?us-ascii?Q?Pf+raznpiMbZbFjxtqBDnSrROBW1cSqXilmibxlt9WJNAWlhn4IQOd6EY+mL?=
 =?us-ascii?Q?NmvHJ8vXIUFzhqFSTz1frwuEp2z4RJ1i0aoBb2XIKfYpNZPI+KhHvUGnhv8x?=
 =?us-ascii?Q?cT7e0KksOZQQqUYHt9rdNzQHL5aT7bq5bEdGPqDPXjStg8QbicRlkZuZv8wC?=
 =?us-ascii?Q?lAlcjkGt4FsdZ/Psy5J+OQ51HdyXUImxwThMco9urY2Aluzc3biBpJPElgcK?=
 =?us-ascii?Q?iDZsN8rCehPS1BnxdHO/7lugzXWxpKf/v5cSYr0aekNnOBCrPJP9W9TbhhKY?=
 =?us-ascii?Q?rxPuCAWGXSIj4LWayjtTzjBwEwLS46WNDC7v9eIhVDREjtw7D1ahyLQavsOV?=
 =?us-ascii?Q?rBaOiBjwu2My6q2YEiR0Zdooe0wzYMa4cr3UmbuiqrMrFt3/aMjo4g57lbfa?=
 =?us-ascii?Q?l9KfLL0PV7ZZDlSTHEBufqwwv3wkksGVbdLnKikjT6t6jaxbVAjq/wCJz7er?=
 =?us-ascii?Q?ZrevMGGg9FYnN5DhQu+RIm4G0uyUM6XT2+oLjHoJeag78lZTPB/2evaEPeUv?=
 =?us-ascii?Q?AaLI31ruu+kjYHnPwBoNDktMAj9S8/xBwvpz55j4ncD3wQyevmQXs2hCVzcG?=
 =?us-ascii?Q?cUhj4WzdDEsMcO4urJak3hmlu7PkyTBYEBuUSDUB6iQb0Mo+lgeVDnJbNjgF?=
 =?us-ascii?Q?3ZPOxEQniNIWnNZL4vD9a0163xq6BsfHioG0goaePk6MpdKStwRjNW4nP0YK?=
 =?us-ascii?Q?8mM7X3MLn8dUioKYwvpWVPQXSdL1N+L0HWZIFfuB6Q9jUjMSwmqJIwdndPwb?=
 =?us-ascii?Q?vagjtTpp0G0vZdGqvhaizGEJvWnxJUoMkKadau1iE38klUDA7BMWGqnYQRIz?=
 =?us-ascii?Q?4gIIq+xj2z3h4O2AGsINz66PIn8EbXGkOaU7B1s75Kp5gpGoDo/yuOlfkCeU?=
 =?us-ascii?Q?m9t8ZlFDWACR3oKK3Kpd4gXMeZ1daVPSLTR6q5YFK2psrFjDAGqvMSi0Umwn?=
 =?us-ascii?Q?dvUBA20DpJofsSNZyPPzArKSDVN9WWeS2qtpWPwgW6dL5kdXwLHFTeZsn12K?=
 =?us-ascii?Q?PvDcQrBFTkpLFyZF5s1p0/IpS+ldlG+4YRm+5o5YzLG6qfIrsqW18Ha4vOvR?=
 =?us-ascii?Q?gxpox+9d7cX3QdF8HILkdfykjN7Thrl7QIfWcH3ysA1ubkgw1NABIG+Q+XCW?=
 =?us-ascii?Q?U4z8kpt0D+0C69B+046+qP4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14464eba-6f3b-454d-5d38-08dbb32158b2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:46:40.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xRl5WmVhx3hYj+KVec+vDrpEMRMY9UFKgKQTaLzfc4Qyw6JIao+xKlPA3LzNzYt1m2rFT/DOesXcA+/v5dzbpWl8kHR2KdvpCAZ4te8iovTyQ8XkjAF25N7xnUsmFdPk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 3NV7VEJTGDTK2XXB4C5A3ZNX4SBBTNLD
X-Message-ID-Hash: 3NV7VEJTGDTK2XXB4C5A3ZNX4SBBTNLD
X-Mailman-Approved-At: Tue, 12 Sep 2023 10:02:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NV7VEJTGDTK2XXB4C5A3ZNX4SBBTNLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

ASoC is using 2 type of prefix (asoc_xxx() vs snd_soc_xxx()), but there
is no particular reason about that [1].
To reduce confusing, standarding these to snd_soc_xxx() is sensible.

This patch adds asoc_xxx() macro to keep compatible for a while.
It will be removed if all drivers were switched to new style.

Link: https://lore.kernel.org/r/87h6td3hus.wl-kuninori.morimoto.gx@renesas.com [1]


Kuninori Morimoto (54):
  ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
  ASoC: simple_card_utils.h: convert not to use asoc_xxx()
  ASoC: sh: convert not to use asoc_xxx()
  ASoC: ti: convert not to use asoc_xxx()
  ASoC: arm: convert not to use asoc_xxx()
  ASoC: amd: convert not to use asoc_xxx()
  ASoC: bcm: convert not to use asoc_xxx()
  ASoC: dwc: convert not to use asoc_xxx()
  ASoC: fsl: convert not to use asoc_xxx()
  ASoC: img: convert not to use asoc_xxx()
  ASoC: mxs: convert not to use asoc_xxx()
  ASoC: pxa: convert not to use asoc_xxx()
  ASoC: stm: convert not to use asoc_xxx()
  ASoC: au1x: convert not to use asoc_xxx()
  ASoC: qcom: convert not to use asoc_xxx()
  ASoC: sprd: convert not to use asoc_xxx()
  ASoC: apple: convert not to use asoc_xxx()
  ASoC: atmel: convert not to use asoc_xxx()
  ASoC: meson: convert not to use asoc_xxx()
  ASoC: sunxi: convert not to use asoc_xxx()
  ASoC: tegra: convert not to use asoc_xxx()
  ASoC: ux500: convert not to use asoc_xxx()
  ASoC: google: convert not to use asoc_xxx()
  ASoC: cirrus: convert not to use asoc_xxx()
  ASoC: generic: convert not to use asoc_xxx()
  ASoC: samsung: convert not to use asoc_xxx()
  ASoC: extensa: convert not to use asoc_xxx()
  ASoC: kirkwood: convert not to use asoc_xxx()
  ASoC: loongson: convert not to use asoc_xxx()
  ASoC: mediatek: convert not to use asoc_xxx()
  ASoC: rockchip: convert not to use asoc_xxx()
  ASoC: starfive: convert not to use asoc_xxx()
  ASoC: uniphier: convert not to use asoc_xxx()
  ASoC: soundwire: convert not to use asoc_xxx()
  ASoC: intel: convert not to use asoc_xxx()
  ASoC: intel: avs: convert not to use asoc_xxx()
  ASoC: codec: wm: convert not to use asoc_xxx()
  ASoC: codec: rt5677: convert not to use asoc_xxx()
  ASoC: codec: cs47lxx: convert not to use asoc_xxx()
  ASoC: sof: convert not to use asoc_xxx()
  ASoC: sof: amd: convert not to use asoc_xxx()
  ASoC: sof: intel: convert not to use asoc_xxx()
  ASoC: sof: mediatek: convert not to use asoc_xxx()
  ASoC: soc-dai: convert not to use asoc_xxx()
  ASoC: soc-pcm: convert not to use asoc_xxx()
  ASoC: soc-core: convert not to use asoc_xxx()
  ASoC: soc-dapm: convert not to use asoc_xxx()
  ASoC: soc-link: convert not to use asoc_xxx()
  ASoC: soc-utils: convert not to use asoc_xxx()
  ASoC: soc-topology: convert not to use asoc_xxx()
  ASoC: soc-compress: convert not to use asoc_xxx()
  ASoC: soc-component: convert not to use asoc_xxx()
  ASoC: soc-generic-dmaengine-pcm: convert not to use asoc_xxx()
  ASoC: remove asoc_xxx() compatible macro

 drivers/soundwire/intel.c                     |   2 +-
 drivers/soundwire/intel_ace2x.c               |   2 +-
 drivers/soundwire/stream.c                    |   2 +-
 include/sound/graph_card.h                    |  16 +-
 include/sound/simple_card.h                   |   6 +-
 include/sound/simple_card_utils.h             | 106 ++++-----
 include/sound/soc-card.h                      |   4 +-
 include/sound/soc.h                           |  29 +--
 sound/arm/pxa2xx-pcm-lib.c                    |   8 +-
 sound/soc/amd/acp-da7219-max98357a.c          |  28 +--
 sound/soc/amd/acp-es8336.c                    |   6 +-
 sound/soc/amd/acp-pcm-dma.c                   |   2 +-
 sound/soc/amd/acp-rt5645.c                    |   6 +-
 sound/soc/amd/acp/acp-legacy-common.c         |   8 +-
 sound/soc/amd/acp/acp-mach-common.c           |  54 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  12 +-
 sound/soc/amd/ps/ps-sdw-dma.c                 |   2 +-
 sound/soc/amd/raven/acp3x-i2s.c               |   2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c           |   6 +-
 sound/soc/amd/vangogh/acp5x-i2s.c             |   2 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  12 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c         |   6 +-
 sound/soc/apple/mca.c                         |  26 +--
 sound/soc/atmel/atmel-classd.c                |  10 +-
 sound/soc/atmel/atmel-pcm-dma.c               |   8 +-
 sound/soc/atmel/atmel-pcm-pdc.c               |   4 +-
 sound/soc/atmel/atmel-pdmic.c                 |  12 +-
 sound/soc/atmel/atmel_wm8904.c                |   4 +-
 sound/soc/atmel/mikroe-proto.c                |   2 +-
 sound/soc/atmel/sam9g20_wm8731.c              |   2 +-
 sound/soc/atmel/sam9x5_wm8731.c               |   2 +-
 sound/soc/au1x/db1200.c                       |   4 +-
 sound/soc/au1x/dbdma2.c                       |   4 +-
 sound/soc/au1x/dma.c                          |   4 +-
 sound/soc/au1x/psc-ac97.c                     |   2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c          |  28 +--
 sound/soc/bcm/cygnus-pcm.c                    |  24 +-
 sound/soc/cirrus/edb93xx.c                    |   6 +-
 sound/soc/codecs/cs47l15.c                    |   4 +-
 sound/soc/codecs/cs47l24.c                    |   6 +-
 sound/soc/codecs/cs47l35.c                    |   6 +-
 sound/soc/codecs/cs47l85.c                    |   6 +-
 sound/soc/codecs/cs47l90.c                    |   6 +-
 sound/soc/codecs/cs47l92.c                    |   4 +-
 sound/soc/codecs/rt5677-spi.c                 |   4 +-
 sound/soc/codecs/wm5110.c                     |   6 +-
 sound/soc/codecs/wm_adsp.c                    |  10 +-
 sound/soc/dwc/dwc-i2s.c                       |   2 +-
 sound/soc/dwc/dwc-pcm.c                       |   4 +-
 sound/soc/fsl/eukrea-tlv320.c                 |   6 +-
 sound/soc/fsl/fsl-asoc-card.c                 |  28 +--
 sound/soc/fsl/fsl_asrc_dma.c                  |  10 +-
 sound/soc/fsl/fsl_dma.c                       |   2 +-
 sound/soc/fsl/fsl_spdif.c                     |  20 +-
 sound/soc/fsl/fsl_ssi.c                       |  16 +-
 sound/soc/fsl/imx-audmix.c                    |  18 +-
 sound/soc/fsl/imx-card.c                      |   6 +-
 sound/soc/fsl/imx-hdmi.c                      |   4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                 |  14 +-
 sound/soc/fsl/imx-rpmsg.c                     |   4 +-
 sound/soc/fsl/imx-sgtl5000.c                  |   2 +-
 sound/soc/fsl/imx-spdif.c                     |   2 +-
 sound/soc/fsl/mpc5200_dma.c                   |  18 +-
 sound/soc/fsl/mpc5200_psc_i2s.c               |   4 +-
 sound/soc/fsl/mpc8610_hpcd.c                  |   6 +-
 sound/soc/fsl/p1022_ds.c                      |   6 +-
 sound/soc/fsl/p1022_rdk.c                     |   6 +-
 sound/soc/generic/audio-graph-card.c          | 114 ++++-----
 .../generic/audio-graph-card2-custom-sample.c |  32 +--
 sound/soc/generic/audio-graph-card2.c         | 108 ++++-----
 sound/soc/generic/simple-card-utils.c         | 219 +++++++++---------
 sound/soc/generic/simple-card.c               | 147 ++++++------
 sound/soc/generic/test-component.c            |   2 +-
 sound/soc/google/chv3-i2s.c                   |  22 +-
 sound/soc/img/img-i2s-in.c                    |   2 +-
 sound/soc/img/img-i2s-out.c                   |   2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c  |  12 +-
 sound/soc/intel/avs/boards/da7219.c           |   4 +-
 sound/soc/intel/avs/boards/es8336.c           |   8 +-
 sound/soc/intel/avs/boards/i2s_test.c         |   2 +-
 sound/soc/intel/avs/boards/max98373.c         |   2 +-
 sound/soc/intel/avs/boards/max98927.c         |   2 +-
 sound/soc/intel/avs/boards/nau8825.c          |   8 +-
 sound/soc/intel/avs/boards/rt274.c            |   4 +-
 sound/soc/intel/avs/boards/rt286.c            |   8 +-
 sound/soc/intel/avs/boards/rt298.c            |   8 +-
 sound/soc/intel/avs/boards/rt5663.c           |   8 +-
 sound/soc/intel/avs/boards/rt5682.c           |   8 +-
 sound/soc/intel/avs/boards/ssm4567.c          |   4 +-
 sound/soc/intel/avs/pcm.c                     |  44 ++--
 sound/soc/intel/boards/bdw-rt5650.c           |   6 +-
 sound/soc/intel/boards/bdw-rt5677.c           |  10 +-
 sound/soc/intel/boards/bdw_rt286.c            |   8 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   8 +-
 sound/soc/intel/boards/bxt_rt298.c            |  10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |  10 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  12 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   8 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |   4 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  10 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  10 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   8 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   8 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  16 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  10 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  12 +-
 sound/soc/intel/boards/ehl_rt5660.c           |   8 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  12 +-
 sound/soc/intel/boards/hsw_rt5640.c           |   4 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |   8 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  10 +-
 sound/soc/intel/boards/kbl_rt5660.c           |   8 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  12 +-
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  12 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |   4 +-
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  14 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  18 +-
 sound/soc/intel/boards/skl_rt286.c            |  10 +-
 sound/soc/intel/boards/sof_cirrus_common.c    |   2 +-
 sound/soc/intel/boards/sof_cs42l42.c          |  12 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |   8 +-
 sound/soc/intel/boards/sof_es8336.c           |  14 +-
 sound/soc/intel/boards/sof_maxim_common.c     |   8 +-
 sound/soc/intel/boards/sof_nau8825.c          |  12 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  14 +-
 sound/soc/intel/boards/sof_realtek_common.c   |   8 +-
 sound/soc/intel/boards/sof_rt5682.c           |  16 +-
 sound/soc/intel/boards/sof_sdw.c              |  18 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |   2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c         |   2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |   4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |   2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |   2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |   4 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |   2 +-
 sound/soc/intel/boards/sof_ssp_amp.c          |   8 +-
 sound/soc/intel/boards/sof_wm8804.c           |   4 +-
 sound/soc/intel/catpt/pcm.c                   |  12 +-
 sound/soc/intel/keembay/kmb_platform.c        |   4 +-
 sound/soc/intel/skylake/skl-pcm.c             |  18 +-
 sound/soc/kirkwood/armada-370-db.c            |   4 +-
 sound/soc/kirkwood/kirkwood-dma.c             |   2 +-
 sound/soc/loongson/loongson_card.c            |   4 +-
 sound/soc/loongson/loongson_dma.c             |   4 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  22 +-
 .../mediatek/common/mtk-afe-platform-driver.c |   4 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |   6 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   6 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |   6 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |   4 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   4 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |   6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |   8 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |   6 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  14 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  18 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  12 +-
 .../mediatek/mt8186/mt8186-mt6366-common.c    |   2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  14 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  12 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |   8 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  20 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |   6 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  22 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  10 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  26 +--
 sound/soc/meson/aiu-fifo.c                    |   2 +-
 sound/soc/meson/axg-card.c                    |  12 +-
 sound/soc/meson/axg-fifo.c                    |   2 +-
 sound/soc/meson/gx-card.c                     |   2 +-
 sound/soc/meson/meson-card-utils.c            |   6 +-
 sound/soc/meson/meson-codec-glue.c            |   2 +-
 sound/soc/mxs/mxs-sgtl5000.c                  |   6 +-
 sound/soc/pxa/pxa2xx-i2s.c                    |   4 +-
 sound/soc/pxa/spitz.c                         |   8 +-
 sound/soc/qcom/apq8016_sbc.c                  |   8 +-
 sound/soc/qcom/apq8096.c                      |   8 +-
 sound/soc/qcom/common.c                       |   6 +-
 sound/soc/qcom/lpass-cdc-dma.c                |  16 +-
 sound/soc/qcom/lpass-platform.c               |  50 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c              |   4 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  10 +-
 sound/soc/qcom/qdsp6/q6routing.c              |   4 +-
 sound/soc/qcom/sc7180.c                       |  18 +-
 sound/soc/qcom/sc7280.c                       |  26 +--
 sound/soc/qcom/sc8280xp.c                     |   8 +-
 sound/soc/qcom/sdm845.c                       |  36 +--
 sound/soc/qcom/sdw.c                          |   6 +-
 sound/soc/qcom/sm8250.c                       |  10 +-
 sound/soc/qcom/storm.c                        |   4 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c       |   6 +-
 sound/soc/rockchip/rk3399_gru_sound.c         |  26 +--
 sound/soc/rockchip/rockchip_i2s.c             |   2 +-
 sound/soc/rockchip/rockchip_max98090.c        |   8 +-
 sound/soc/rockchip/rockchip_rt5645.c          |   8 +-
 sound/soc/samsung/aries_wm8994.c              |  12 +-
 sound/soc/samsung/arndale.c                   |  10 +-
 sound/soc/samsung/bells.c                     |  16 +-
 sound/soc/samsung/i2s.c                       |  12 +-
 sound/soc/samsung/littlemill.c                |  16 +-
 sound/soc/samsung/lowland.c                   |   4 +-
 sound/soc/samsung/midas_wm1811.c              |  10 +-
 sound/soc/samsung/odroid.c                    |   8 +-
 sound/soc/samsung/pcm.c                       |   8 +-
 sound/soc/samsung/smdk_spdif.c                |   4 +-
 sound/soc/samsung/smdk_wm8994.c               |   4 +-
 sound/soc/samsung/smdk_wm8994pcm.c            |   6 +-
 sound/soc/samsung/snow.c                      |   4 +-
 sound/soc/samsung/spdif.c                     |  14 +-
 sound/soc/samsung/speyside.c                  |   8 +-
 sound/soc/samsung/tm2_wm5110.c                |  24 +-
 sound/soc/samsung/tobermory.c                 |   8 +-
 sound/soc/sh/dma-sh7760.c                     |  28 +--
 sound/soc/sh/fsi.c                            |   4 +-
 sound/soc/sh/migor.c                          |  10 +-
 sound/soc/sh/rcar/core.c                      |   6 +-
 sound/soc/sh/rz-ssi.c                         |   4 +-
 sound/soc/soc-component.c                     |  24 +-
 sound/soc/soc-compress.c                      |  36 +--
 sound/soc/soc-core.c                          |  20 +-
 sound/soc/soc-dai.c                           |   8 +-
 sound/soc/soc-dapm.c                          |  12 +-
 sound/soc/soc-generic-dmaengine-pcm.c         |  10 +-
 sound/soc/soc-link.c                          |  14 +-
 sound/soc/soc-pcm.c                           |  90 +++----
 sound/soc/soc-topology.c                      |   6 +-
 sound/soc/soc-utils.c                         |   6 +-
 sound/soc/sof/amd/acp-pcm.c                   |   2 +-
 sound/soc/sof/intel/hda-dai-ops.c             |  22 +-
 sound/soc/sof/intel/hda-dai.c                 |   8 +-
 sound/soc/sof/intel/hda-pcm.c                 |   4 +-
 sound/soc/sof/intel/hda-stream.c              |   2 +-
 sound/soc/sof/ipc3-pcm.c                      |   6 +-
 sound/soc/sof/ipc4-pcm.c                      |   8 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c        |   2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |   2 +-
 sound/soc/sof/nocodec.c                       |   2 +-
 sound/soc/sof/pcm.c                           |  18 +-
 sound/soc/sprd/sprd-pcm-compress.c            |   4 +-
 sound/soc/sprd/sprd-pcm-dma.c                 |   4 +-
 sound/soc/starfive/jh7110_tdm.c               |   2 +-
 sound/soc/stm/stm32_adfsdm.c                  |  24 +-
 sound/soc/stm/stm32_sai_sub.c                 |   4 +-
 sound/soc/sunxi/sun4i-codec.c                 |  12 +-
 sound/soc/sunxi/sun4i-spdif.c                 |   4 +-
 sound/soc/sunxi/sun50i-dmic.c                 |   2 +-
 sound/soc/tegra/tegra_asoc_machine.c          |   2 +-
 sound/soc/tegra/tegra_audio_graph_card.c      |  22 +-
 sound/soc/tegra/tegra_pcm.c                   |   4 +-
 sound/soc/tegra/tegra_wm8903.c                |   4 +-
 sound/soc/ti/ams-delta.c                      |   4 +-
 sound/soc/ti/davinci-evm.c                    |  10 +-
 sound/soc/ti/j721e-evm.c                      |  12 +-
 sound/soc/ti/n810.c                           |   6 +-
 sound/soc/ti/omap-abe-twl6040.c               |  10 +-
 sound/soc/ti/omap-hdmi.c                      |   2 +-
 sound/soc/ti/omap-mcbsp-st.c                  |   2 +-
 sound/soc/ti/omap-mcbsp.c                     |   8 +-
 sound/soc/ti/omap-mcpdm.c                     |   2 +-
 sound/soc/ti/omap-twl4030.c                   |   2 +-
 sound/soc/ti/omap3pandora.c                   |   6 +-
 sound/soc/ti/osk5912.c                        |   4 +-
 sound/soc/ti/rx51.c                           |   6 +-
 sound/soc/uniphier/aio-compress.c             |  22 +-
 sound/soc/uniphier/aio-dma.c                  |  12 +-
 sound/soc/ux500/mop500_ab8500.c               |  14 +-
 sound/soc/ux500/ux500_pcm.c                   |   4 +-
 sound/soc/xtensa/xtfpga-i2s.c                 |   4 +-
 272 files changed, 1612 insertions(+), 1613 deletions(-)

-- 
2.25.1

