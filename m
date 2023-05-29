Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D1714186
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E669822;
	Mon, 29 May 2023 03:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E669822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322473;
	bh=3UAWpJyK9GEvSTkQzT/uVHN+RWkQFnJpy2a5VbK9LO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qmrTVhq1AW1aevakz946RX7br9czqhUBZDz5zWEWPTEpg0dABg4auc0EYcgd1oeRL
	 OCUILhL8ZqMBYZ0BkblFqPvsg5M9TiDHAC62voHc1u1Eu6d3elHMek/kE4rpNvmyiS
	 0BsRu18rWiJ1kTigUyS1cAKLvfl2FEL45ogz6im4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CFBFF805BE; Mon, 29 May 2023 03:05:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA91F80557;
	Mon, 29 May 2023 03:05:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CF0F805AF; Mon, 29 May 2023 03:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FD94F80589
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD94F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iWrXBpaS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8Wl0z5xrqOpI+oAmSZoJ9kM39hxl5Vb3eWRZK/2NzAqqwQn9f9fUwfEGwZOnVOK1fU726lFGum4RpkTjxnZymR+0bzZuaVuPgHWjbXC8qna1V2EyMNwADfZ4gPRZ2Iu6N1w91xMNJ0o5tM/PzlFh9rWE7/v+6jWPAGwnutA/M45fCpzz4c/HLxsYafSySYztYu0NCId7DRZyjiy0gbGI+I653brOBc6ObLX5GrLKSIpIDAS4losqtVNkMzgcfqawAr+oJ8ROD0aS2MSOQNFbcH07bQzIDQ4NJYoNrk+eNGGyJhSJzSxnN+x7O4D+JdB+FW9Ct4OgekymZWVGANKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=LQPHroZZ9d1AmfRmfCi1V1m6G8NOyADQ0DmRBoeJb2MoDt9zGXo4TqVFtSSEQADGyNQ1p5AGLLxB7CwT08Gxq0yrbrr4xmHx7G8ORhWmcB4uxtviY68tzJbBuTJwjwPH/VYJGihCIxEe+4TjlFKVENdj++xwPzijLJvxnFrJE/auPxeqBuxcoD8JCa5dwq5yXh4GaiQ6a4sBvkodTcDx2wyRCqI0onFZnV3fzt27UaeiIJ1dR+/UQM56Mfzc7/3MEGQqRUfVL+rpS4W3IV4J+s+aw/XYWTKZ9fDkK+KaQYLLRIdLEPOVntOlTiIJIhMDungwzG1lQJQwWof1MVm1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=iWrXBpaSOnXvkvkEUE5AHSjhX3MYhW6OU2tWqD6y6VXi9fgkBR3NUu+Tt8vwLMUpPKbYPWcu17Aw36MPzxzhZAQzdz70g5cbIXyVmYqm+P9NbxwwQ9opH48QDDbH26ZDYDoq6M+/vBU32HAvKmyxRhPbtMuSD/rTNys8jY3NGuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:06 +0000
Message-ID: <874jnwlzge.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 14/21] ASoC: samsung: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:05:06 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a584671-d898-41dd-544f-08db5fe0bda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1NxmaOoEURYFnlwWITMwru9f7mdXr0uoI1CLtlffF5ca+Yru7LP1LMQhv74mJZ6QcccnYNysCN7lFVTpG4dxAtJE29OSXxBN6MPlGujG04vS/VuD7TNRh+YOFYmCZWoxLZIdCOgwyiMCAv+8G58/XMixC/PSDzZOEc+uRkxvcN/4Iy/cyMZPxc7EILvFxgP8hxXyiKHySAd4jvFtvVVDnmaHuTaa7r4h4ARd8HsM6W4U3Aw1WnaVGwfSHqj84FIskXFb/8H1wLw7X0qgmnfNTeNzq+poUeqLd3qr2mTEzOit0oL9WHqV4E9za/GUrmgeDNgEZf3X2bmi+olu7j2LHumJ7j/OzTwgbaxb8ykPhwc9CqgW8VF/zjRrYGoV34MVS419fcaHTNKkee16x+yZA886IQmSUrTTSuPgkR6fFi7reppDmMmsJiXTLAmd3TNRZEDBwovNMHfGN9cgfDEWML3AkaNlwQ9fkhe4Aauk8BrZaeDM7n73IhoFMOhiBzAWdmlUJYq0CEbMVW/Qfbbe16Q3afcYeAv+N9hKR/5Gv4hR9OzzbUB0VwWvnDGc4czOixy/WKbc1RtZcsmgyWdeZebeuu5/kYEICkAtOLJcMpFk0YSAWeYvu6ti/DZ7xCCD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kUYzBngNvXvMlfEaCfuRHQu7luBdKMBhmIxyJLQAhxWazxiI6pJixM4rVv8n?=
 =?us-ascii?Q?tFT8JColGwWNAoYsz43Hx7cQO+6+UJEahjrSWd2q2+p4IfF1EHLQ7qnpKeQG?=
 =?us-ascii?Q?dcUQJpTt7VmDnTjiSviM+tUjAyvOmd19v2wh0mvydpRl2v5Z/2g0naqVuPl2?=
 =?us-ascii?Q?OLPxsHHF/bmdQIzJtaTg2Q6DyXLBMz9BUZ8U1vcAwlikygrG5fiOMYIXAj9d?=
 =?us-ascii?Q?oSYLTeQmv2jhE07nZn4hrbi9LdNN4G72UA8PcZn5JuKcLacIK4DuRDSSkpJk?=
 =?us-ascii?Q?7vWXBiV1/zrs2OGW1sxfmIg1FyIabFXS4HHUGPkSUWSbRGaJPP34XcZNNa4e?=
 =?us-ascii?Q?RhDzaKl1XjtIIGQE3picSPcLNWpmR+0eexCdRa0g991vxDF4go8jh0vWvkxn?=
 =?us-ascii?Q?DIm8k3Eoo5PpA41EH8abi28PsTKxxoq8FpEJ741Eh2m6l3W9DGzkxCJWEC44?=
 =?us-ascii?Q?LaUbesDnKqC0BI5jydIfd9aa/NCSWbE0iApBnDDUHBDQODHcfxHC+dA1aCOJ?=
 =?us-ascii?Q?eoYpHluKHiJnEBYlPVWpyRiPrgxxojbKX2YqV+R/KeM2OD5L+uXtTiAJCLxz?=
 =?us-ascii?Q?B3x/QMYibwuc2lEVyv4ak6e8ezU69fz2+rxU9VqPWJk+szD+pCUWVCi+IV/d?=
 =?us-ascii?Q?DKILPe4iHIK6H+QZ2x5yYU3dCnDVGiAahfx8r/U52NmGiWruuulzKgeP5HGf?=
 =?us-ascii?Q?yZGx63EOF5gT85DtmRV5NiqAGUH/6374dWpe22zC1aTLQRp+xtUMBBks6Ybw?=
 =?us-ascii?Q?s9nLa0POL1QZrVnsZMs/mDejc+mAUIAxnlkY/kReA239Xi9PN8Mf0XxODy5O?=
 =?us-ascii?Q?kzQCT1HrBFqp159v5qJF5EGleUERKbBqI07qiFjd7YziRt1piYXtakD1zMzw?=
 =?us-ascii?Q?pGJJ88fjbpLQVqL2TWYKlg72RFJSYcSuz+OruXrdICxhNSAoqaFTp9sqQOeS?=
 =?us-ascii?Q?bqafHpG3KBTHYm2dPmyjayyEt3qcxQBwFlujBDX6QIEa7HVj6U2zPOKCsJe2?=
 =?us-ascii?Q?4t62kpSp9oxU+m25eCBz2ZXSrng0OzgB3Qjr9RMSRF2qrVGPN80PK65knSbm?=
 =?us-ascii?Q?rIgYwVBVlC5K739ihcVRQ3KmtonQ97K6OY04ES+5hNP1g6IZi86addvMzodq?=
 =?us-ascii?Q?RGd1mVXcb3wAyOQlzwWsz8NAH2F+VCGPd2V1UWw+cvWgfRkCQSlzJBHuNITa?=
 =?us-ascii?Q?6MOpmqt5HyFEMH+UK39bAsbj3qOdjRIZrxROaDvsjzLW8bt8o2OETozqx86M?=
 =?us-ascii?Q?1M+7HgIFEnVWq4o0v7RjGuPiyJ57AYkwCIbgNOwpbDOxr6Zvcw1/WD7UvbxA?=
 =?us-ascii?Q?x/qyxx6b9x6LJS+KMWEee2E1ENzwBW1r9mG+fJNmG4O5VnKedXWsXINd4wUB?=
 =?us-ascii?Q?uJtewT9Xscd3si4+NhcX30ePkHF7F01JmATviHyJ7rKbnLG8OAmkswgMkK1B?=
 =?us-ascii?Q?iTMgIO5mLkPJzfkXcW1EprPwnQ7PFMu0X3NZvuadDZKM5mfKIhe/49Vx5vOz?=
 =?us-ascii?Q?bkh82er0Kb7jcmwE3jH3xGuyOJNmTg1Wj5K/idCqhoGJ9htiWAQjSWXP/124?=
 =?us-ascii?Q?rkdXCN9Yyyt02Sn2E84W0N/UtK1/H5XreKdqYkFv6MOcYjvfUA4WDgaYRAgn?=
 =?us-ascii?Q?KJ7PKVNVZKkfGD/tO/ibAqA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a584671-d898-41dd-544f-08db5fe0bda7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:06.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hDskkO0zI8VTEq74qsfhwKJc+TNI5PKLeFhSfJd8QQ6xjanngHwY2abFiBm8T+uVRrarnItIc6+TZxKUnSAGb5ssjTCO4ygV1RohhAYGZYrB1cbWVVtS2vLAtq+Z34cC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: 4DC7SQRU3FM4HBGIROKGH6SSB7FEAU4H
X-Message-ID-Hash: 4DC7SQRU3FM4HBGIROKGH6SSB7FEAU4H
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DC7SQRU3FM4HBGIROKGH6SSB7FEAU4H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index fd95a79cc9fa..3fd6a8c2c0fe 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -173,14 +173,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -191,7 +191,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -293,8 +293,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].capture_only = 1;
+		card->dai_link[1].capture_only = 1;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.25.1

