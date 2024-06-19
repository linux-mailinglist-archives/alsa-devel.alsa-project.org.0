Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F790E0C2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 02:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F3F4AE8;
	Wed, 19 Jun 2024 02:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F3F4AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718756408;
	bh=7H17/cqIByBaGcq4nac1XNzqB65i/P/KS+ygAUE3Do4=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tOAcnvA3nxPIZxys9z3+0w7C3vW6jaV+DI8RHup0yADcGJQiLia5NI+WAdk7Z9q8s
	 jL0SGrHy8s3KPHLcKqpFcjNbWAxNGbswkOACf9cqyzxhQy4ZBucxvzH1QnDKt9IqzA
	 vQTmgf6xO1OT21WD3arsZgwyREi3sSYs/g3AopeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B2CFF805B6; Wed, 19 Jun 2024 02:19:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 000FCF80266;
	Wed, 19 Jun 2024 02:19:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F02DF8023A; Wed, 19 Jun 2024 02:19:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F10BEF800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 02:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F10BEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N5IlqfVP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHH5oXLqMnymVJ9LRD4gNZpIeWhzPS8kU+J4L1y/5LcS0U2jMxEQ3JRhj66kKvd8ZpcNHeF2AKSsDdOrxOslMN7bsIOnS7JI+pD+IH6LA5KxZTiPCylilZWsjlDMuqAjGKuG+uOPfvQSSHmJEzc/EzwYqpqOaDA1XFIMLQPxV8KbbDLv7TBY5BsXsnNmB+TvhZN9GWt6jfJfgthy9UXiy5vrIwWXzz6qn2UMQrpPUySicYqbztlvgoWdoRImLOY9yDU0Yi+mPV00GjHZmaTpS5WTDRRfK8+4hvXYP0cmjaiSRxnfRoDSX0M+cVEN0JvKiaECRgsXj2TZXB3FnxkdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzIUfAUkpmJnc5HDlT3gu4cFz8es4En+Y0bDg0mUzis=;
 b=mGngiz0KqvlRAeu+Z2Hvb2gEyfLzP3d8IA8ZYkkAq4MTBSdEkRNkPZ6Wd4TGlLSm90GzDzbeePEKpFnpGZl8oKaony+Ensa9WX61mHm21eeC5LQMy89/mXpm6VQ3zYDhO1eGvhf5Jju4bYeLuN2el1mQggaedfnNud/PfJZbBsXWUgAhkj+jPPq+PXQez4Wshb5IDW1yxP7uEZUZW1Dx01Qm8MnVMvmtQ8bUGznD4QDHNap3ZtlUMGApy4j6c2hntMELx1+cjkenv6s/WPhp8g2ri71mJ9PPOlJVH1lw6/4zogMKrdL9W4UOge3Gu4XKOtwrOA6qN4TvEkf+pscTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzIUfAUkpmJnc5HDlT3gu4cFz8es4En+Y0bDg0mUzis=;
 b=N5IlqfVPMtSmKUiIRXdJxnDNEvDzfJoywhmpFTjmBMGsDDNm25HqN1Huc+ToKGInnYzdln6wkodpLpU6I8yWkOVmGYIS4QfxWC6sNLU1G8KrEAssj0NywaDXk4/DnIrqCgA5hVNj1BIMgXCHap+stKHr2d07kyL139TI7dD06eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11717.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:19:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:19:12 +0000
Message-ID: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
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
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 0/4] ASoC: grace time for DPCM cleanup
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:19:11 +0000
X-ClientProxiedBy: TY1PR01CA0195.jpnprd01.prod.outlook.com (2603:1096:403::25)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: da7f3092-eaf6-459a-54e6-08dc8ff571ed
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yf0CWfoKn+sinA22rB3xHlYYdVqDO2L6Kz2kqJ37be77fSy+Ock3ECPvjL30?=
 =?us-ascii?Q?pr01XmSdk2tvpESGR9J7xjXIHI5Cd41imfIYou+T9M/yhMw9LsnLNbKbvgKY?=
 =?us-ascii?Q?NVnXjDqC7/FIxUwWScO42Wr1ovkSiT7rodnnpAl3weiJXQVEoUyPCmqIwd6L?=
 =?us-ascii?Q?X+7G0ZGc6jNFRtXRk6WzbfUtuQEMrwb1Cy8JQ7lrjYTnybYyPRABSYqAH9Sg?=
 =?us-ascii?Q?6j9x81LWzeKjOWfLVm/Abg+R6TFbzXy0r8YD1AJFjltU4KZ0P0cMn1byTfp7?=
 =?us-ascii?Q?BBqJ9TQ1ApS5Aq1a4zXvMR3iQyd05xT9g4a4qWBQccssE6myYrzypBo4Kysj?=
 =?us-ascii?Q?ginCcqFZVLu1oyb893SZaG6AdAGVRyoIrMA/Pu99HUdIwpFv66JZQUUUztW+?=
 =?us-ascii?Q?xxfzDc8F/ZGD5r2XBrxPIxkzwwfOF4BbMQGai+Ysf8FQ7X5dgDwBDYpFx7QZ?=
 =?us-ascii?Q?C50ncuGoO1Avkk6/3+YFhMz0Llp+Jqh5Dl7F9l0cDyPU00ShNQgzS7qcYF/b?=
 =?us-ascii?Q?/dcjItIMn+2nQzCs4yHfeBusubv6PVGy9zpR0e8KTylAEdVdvbjQTc3SJZSv?=
 =?us-ascii?Q?gw5EoaHjHXVc0bFKlZFqmGdBJVNVUwDTvVp9X3nfyOJf5Oz+GCmSFf3ZFe8t?=
 =?us-ascii?Q?j+3Ua+fTILXGOmZZvvQeCrkUR7wQSfRyprNT6csQtiPKLHOgeA3gRTli/oWj?=
 =?us-ascii?Q?4q99JHSmGnysLNlrj7J1/2ANB6cZmmIzJGM9QBCILXFysc/xtem8/0X6FZid?=
 =?us-ascii?Q?pbwHGBgo/Fl7gNxFHR2UA7+3LJmHUgHaNcBdNKVuICXL4iUkSdOJJakya/Ct?=
 =?us-ascii?Q?YkH3HYubM1WK27Fx20lz7tBB8jp6kPykY4AR67tR7pF1fEno+cpb9HaCWLQL?=
 =?us-ascii?Q?tqU2mbZ4SA2s5WR/jnoQXuuJF5GZ/IsnvMwz1etNQ3BNMMwOgHX4eJJGapIv?=
 =?us-ascii?Q?PMDYIOKVKeppb7UaG2S5lAUuf6jzFhiPsFmHLQFq1+aowrjcv8HUiQD95k2H?=
 =?us-ascii?Q?xkbc1d9+nWXe/Cts6UaRLOdeI/NKmJCGZrAotdR0i2NBK7/g2dHQyJWNsIBQ?=
 =?us-ascii?Q?XkuJFXnF1BQUOqTPFdrlE0TLm8/US2tM6/b3KFMyCWAJsj3qh0Y0TIs01VRz?=
 =?us-ascii?Q?I13Xr0SxN+C2jAMbv33f11M+Yt5fogd51fvgfUO+Qi4JFQXDpRaxNFPPocEv?=
 =?us-ascii?Q?6AJSleswXCKIvnn6Fea+Gdt890K7M4EeVXMfZifOMMomAGIp+4YEifyy0wNQ?=
 =?us-ascii?Q?HimGrUi7TcoL4Yro1nWPnR2WTDNwPol9SngWh6xFd0TZ2rW+XHHp1VraYUQz?=
 =?us-ascii?Q?Pr3HpzKiOxlQcvNCwDFZdwi7lLDt3Ce0v4iAYGfJjlcoNQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HfWWv0OWXOtT75X2d+MHuOrohabyHOxEeUYSKHxhAoT0C60WSFP+8b2xVa4V?=
 =?us-ascii?Q?/xFyEMCFPYC0X9I5JzTx5zmhf5a1xOLaOzkr/0YbXr/plyhzYb6UJtYGGCz4?=
 =?us-ascii?Q?YlH21VrQeFL6k+qRe8oblV2dWyPBQW3h+gggq2owyChWo45jXTaktaFMLadC?=
 =?us-ascii?Q?2L08aL5bacANVb/N/neoLy7NMpGDT5Lsk0Yj/I6uCDITSl5zMf5pTLeq6iRw?=
 =?us-ascii?Q?yDSiFANYKVDc9hESKQkNvhS2Ei1vQSe/Q3jfBdzkjBq+iSwbtT8b7ANPuu3S?=
 =?us-ascii?Q?DOFJNCjB4JZIEqoz10TKxIAqZHnPd/1Srj9DKTF/dr7rqC7CLGt0hXJ0usAy?=
 =?us-ascii?Q?LQX1mq1OG9pPsuWZnPUKhC/2DBuGK4NIblOApB5vwWaXg1rcEHxfNXXNx8my?=
 =?us-ascii?Q?aEHLoIyuaomMyg3TP8NWFhjj9kXvXBlLyR04H4oDfnxNU4sPdOt0UM0RCbgn?=
 =?us-ascii?Q?h83FgS6OhdV4IFmghQgoWmvY+4kLzJqBsjBLRqDDynpOSqUV8gvU+zMtOwZx?=
 =?us-ascii?Q?b9sAVbdWru6W8/ptBp+jkQgwM9sFgyQLZiytN8YK068coYS28AxRPNen/aQy?=
 =?us-ascii?Q?CQmnmQqWy3mBBTAGUaUbqH2z8tH8CqM2LoA0yJJdCBBmPjhj+Hzdp3HyHvxu?=
 =?us-ascii?Q?MlqwI6aWcwXe4qsrmuZbSNuxQEMOb6B5SATxGYKkl8zO6CCX0O0zGXtjC7KA?=
 =?us-ascii?Q?153IQ4RFoaZIWJgM9o2bJv23OHchFZHhQtcKCYh6GNMKvd6jtwLUJArmg8lj?=
 =?us-ascii?Q?DmnpF0qtPU+sJUdCQr6+7LZqOzKT/rzAZNRQ0Ea3s8z0A+N8pZLprS+xxJPN?=
 =?us-ascii?Q?xdXL8NwjLgXYxTpapq8zjfPEN0JeQ0LiQP485o77oWpwAVVYPUmgFQPmtdy2?=
 =?us-ascii?Q?pZswKhcd2brof1X5+3MgoS8xWArVAZpzw4IpSaJ9GGtHpY0Z/dm2M2Wcbq+r?=
 =?us-ascii?Q?0ZbPvNsBzi5UawiFtyEYbBREqRF9w/bz7TVAPs2sdIJmTAd31YixuFhChBTI?=
 =?us-ascii?Q?nLP3kqv9YmBYt26ExAcxBD3Nl2VfFGAgzI4l5XpP1a3IGnIUEZ7cJixz1imH?=
 =?us-ascii?Q?Sk8adOxRexxulO1bvCQdsQ/5GwLfSRtaJruWenE0BgY1KuP7TgRfuy+3MTqf?=
 =?us-ascii?Q?Ja9GtU0zJvB+QoeHYiJppXeV9PDq/oqZtHqpSpa0l1DkFxBWA6cz+UU07HKx?=
 =?us-ascii?Q?Wqp8tAy7HNyl7mgmMz1XXEtwPG7gJi4u6iQzeXNTxIGkb5HYuBKUFar9E6hz?=
 =?us-ascii?Q?S6aAMQEr6dZ1XFPJX3rqtgkrkoKS2fd7XrMERyO42v8CRHWyBfU3LXNAw17d?=
 =?us-ascii?Q?WRNI7DIRiN5PqFdzGi5NqXm/JYBnXgieIpyY4M7c4LXujRMY4azJzlOSb/xP?=
 =?us-ascii?Q?m/6T+rD6vBzFkpsaDEmeTZbPxyEZ4bPiQ37Gs1zxepAgc7t6XGIRpPjJU51l?=
 =?us-ascii?Q?I/uE9RTRcELPyjw1WaU2VPO+/1GDqovKZb/0P8X5l5oGK5MTfOShgrMAIDD/?=
 =?us-ascii?Q?G3ewP42bgLmk1a755HpZZwFnR89UGjTI6qOrONmzf0wmsP3E5wN6MbpSztku?=
 =?us-ascii?Q?JAi2fnj8pvmG5Q0EVIniCQcNbAaKiV3WX8bN3/675bqOQF7X5VZkYVHOL0gl?=
 =?us-ascii?Q?CoxZwvl/CAUHavTO907dwoA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da7f3092-eaf6-459a-54e6-08dc8ff571ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:19:12.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PDnJj9xFOOORU1W68hScxn/a2CoQ/iXn/JiohitHn/MmNtERypW0rMVlqqekSXIHnUCFtutlMm/FEu9d3k3bZJ7QFDKhCJkfWRBC1J9MJ8C1IIqrDFUpZjbYXTDFc+0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11717
Message-ID-Hash: XR2OU5CSW66CQRDFTKG26LCW7TO4UVHE
X-Message-ID-Hash: XR2OU5CSW66CQRDFTKG26LCW7TO4UVHE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XR2OU5CSW66CQRDFTKG26LCW7TO4UVHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is resend of v6 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
error, but maybe v6.12 or v6.13 ?
Please check each driver by that time.

Previous patch-set try to check both CPU and Codec in DPCM, but we noticed
that there are some special DAI which we can't handle today [2]. So I will
escape it in this patch-set.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/all/3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com/

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msole5wc.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/871q5tnuok.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/8734pctmte.wl-kuninori.morimoto.gx@renesas.com

v5 -> v6
	- based on latest ASoC branch

v4 -> v5
	- typo fix: limition -> limitation
	- typo fix: catpure  -> capture
	- include Intel patch

v3 -> v4
	- don't check Codec on DPCM
	- include Jerome's dpcm_xxx update patch

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition


Jerome Brunet (1):
  ASoC: amlogic: do not use dpcm_playback/capture flags

Kuninori Morimoto (2):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for
    availability limition
  ASoC: remove snd_soc_dai_link_set_capabilities()

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw: use playback/capture_only flags

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 --
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/intel/boards/sof_sdw.c      |  4 +-
 sound/soc/meson/axg-card.c            | 11 +++--
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/meson/meson-card-utils.c    |  4 +-
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ----------------
 sound/soc/soc-pcm.c                   | 65 +++++++++++++++------------
 13 files changed, 47 insertions(+), 88 deletions(-)

-- 
2.43.0

