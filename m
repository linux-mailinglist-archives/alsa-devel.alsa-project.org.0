Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1134714182
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A49200;
	Mon, 29 May 2023 03:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A49200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322401;
	bh=gjEtTOuwdHygB00M0mSD28h7HCIjauQDLvcJrmQxA18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhvaxntcgoDLDJwmSrFYmW6Sun0WLKBA8ByUtazYMgW/12xlMZYsu1j9jvcuwbXbJ
	 32ipUYuKHsbl17cqg1xYyG2iTnTaMMf7bHnGkSufdnRXcslkeWlTkvrAJx51Nq8Epj
	 bCJ+LsSLU+gKZl4d4VoPvorOq0i7u1JPwRLia4zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E7FF80570; Mon, 29 May 2023 03:04:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5CE3F8055C;
	Mon, 29 May 2023 03:04:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D95F8055C; Mon, 29 May 2023 03:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C513F80551
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C513F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=X6IhkrK3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLls10CTYyUtfivA18OFWZ2m5V+2wOSMUtK/3xrYTTbO6rJXkzRoRI1pMeiETNbjpOQjruvE1t2yhVaoDjSbj1+PPVjgafvZWnPxP2s6QmjUypS5fNqwLhAoeLrr8LvV+FWzaRhLFlPmZ0xzaEdQgf2LgxRCPd7ulWkLsqFUDLD1mBgddYspOrwl+5HFsZs70OQUb7fjptqMy0dAdIZbMf1nISTu6VLvLNPSH4sSXI/E1UtkQoP+b8b27ScQUy91gD/7XTMB8E0nwNJKArmlCOERAZgyAXdI61FniLZjheycDqX/s30iXIrCHz6DpxlFmUlC84J155IHiXrzmESQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=YHS56e7gREx4q8paDHknZiydjxUbID5W3AUKWBBtIaEVRR1UZr7OlD54wNhuRUmP7bM5yDGyfgOWoeqsJMZU39vAORSD4wY4mlHZuA4YR1F5PYT/Bz3Skgc5ZZqDGxdV21ZP9BqqjmM0TR5iE+cCc9a0uFwElQGGYuGQHlZ/xdkAbwwsFp/CoZHtivkv9iBhgN8f7h7jdZADR3VPOQdsCzks1l7MCGuNdNot+Agted072DY2vmJsQDbuGo94FklJAG1Af6PJLbvNxYFfWytPKH7KvYrpGOWmgYfrS7xcHcbnY204+4LLB9qEJeKJ+OhlDC9BmaudZBQkDIjAGe7Bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=X6IhkrK3aI7aoVxLSNGz1shTCB9n6LjAqLRaqqpKOfgd1++gXNCFjWbSvOoFwsvirrEDOs2/5W51j7zlkGxd5LAtdMP5XKiZvQj5oEPWlukqXocXwLd8nDoisdi2FsKnSEmPciVsXuu3X4sK/Kk1nAAsW4/NPuNC88FFhC91fc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:04:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:04:24 +0000
Message-ID: <87a5xolzhk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/21] ASoC: fsl: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:04:24 +0000
X-ClientProxiedBy: TYAPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:404:29::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 55982121-3ea8-43b5-58ee-08db5fe0a4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gWaFhy3P3LeVOdhzm60zH9VXYFjo8jU6Ohmz9tQ3gs5fi6qWUcO4PzTFEZxYW+523eRQuJspf5K2wwGyp1frAQ9zTBv2jJ4xHMcGOiYMu5AsOUJAsON0X74BYvQvgHYHUN1n5Hx+o81eFH0Sidt/68m2EyFCK8fuTcJGCwq6R67xaUNIfDCPTTdrf8/3lp+UR7/H3tNQp5WpkoDNxwoWYF1uqf6suCVM6AtlLuVRGU0jLKJ5/0itNTCUNQ4XOW4lVeKu6rHm0hw3K29T8VBIRcN/Dxoe+vo3lix7ECptEFjaraGrI2RSP3exJrLLEbNk7Aofn0/PNkDCBLqsk4TvDH/UjomZIBheTZLedRL7iPMsMwDw6J0wpkjAVCF8zPnVKvGjiMIE1t6Fqh+9eU6Z7rXD02tM+vBxY+89DSMdK8nOl3WZKEVe1Vofqw7vFP29bJykRw+0X81PJj/kjiZZpTOQx5Km8zMfeHNa79JFwnNnQya7Sp/WnSrdrfYfA4S2aGI4bTUx/UnC8M6uz4J2AbHAyVVrrbD5fuuRnAi3cLg+1MKYTIyMf9+gnfJFZZDVe+tYsq5mWyhFn5WuDASbwWKJAgc909Kgzg76GGjSKOv09ihkkbbl8TWOhqrnfiCO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(54906003)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(7416002)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+x7rm1RcMPVhkt2uhgSAfIzY0JUhbolbxX13/9ya6vk1Ec72R8kkHYW8+GFz?=
 =?us-ascii?Q?L5xHbd/4SpVPJJp078b+DfO2y1S5K7ZyG460pNnSJ9Al/nd3WH52mmmWpsmH?=
 =?us-ascii?Q?0oolF1KWcrwcX48ARypjcAUxLYQPXPQY0/0Qm3nuchfRl5zralYaLuwN5s1J?=
 =?us-ascii?Q?jW745OjrdgycfPAyxKhuU02M1o5XtY8qwUasW/VVrxSRQB851NFDdjOVs9Eo?=
 =?us-ascii?Q?7V5xY6aCBiAmkaM0dWGXpb7kGu57sL9GszGGXkA/vEG85Z7lrqChrqsC9tiF?=
 =?us-ascii?Q?ijS0RLqdjMHcC1tCk+mq8AH34nyMCLSwZJFosTw+LGS9RDPfrVNN4lvvbxcx?=
 =?us-ascii?Q?pTdIhrL7pNiJoSqfokexuvjznzrJYqmWcp/4qHDqdOZNrcOGRmpE7GY4MiSY?=
 =?us-ascii?Q?iwDulHMZvYeErNDJvUwG9v0o+Yqq5FPZNwcmJO9OQl1FULVzfTsfQtKXhwNL?=
 =?us-ascii?Q?u7t7XRtQht+3/4CbIZrwSpdjaKEQUgg/h/1muNraEXl9PXfeYwPCrvvKyZZ9?=
 =?us-ascii?Q?UEHEhwy+JXnTi3nQ4xtg6HW3YyoXGYep7kBMrWqYYfcV54+PfS0oT1E7ybGF?=
 =?us-ascii?Q?Fv89prwX+dKO00SMVogks2t4NCynmJIf9t6gqby5UN8dXialA8kxtU6Qux0f?=
 =?us-ascii?Q?ehL3HwZzdbZOQfpn7RyRvt7/rrB7NIIgTm64dOMXqW1jmMOqp+bptF13NPE2?=
 =?us-ascii?Q?xQIQjz9gCaspE1hp9yP6b5GZjKzGtcl09dELfzmULLp5cGZrGOcVZ4dNbxAi?=
 =?us-ascii?Q?fIJGq4/4Pjp3QKrY3THmRfcqa67KXFBmuTpclQ2PRdBDDJTSjz/4yj8lXfQY?=
 =?us-ascii?Q?wZOSolwwe7jGHTTzQvZuufSJ9+JBQWSVu/HyqpVI5Y8KiUznQOQ9OjfViBmJ?=
 =?us-ascii?Q?wAHG1gzdiw3wPbv5nNc7Yb1DYe5zesz4qXp4DUUHvSEvBnTcWpErBJWLd8DM?=
 =?us-ascii?Q?Qwj2M3DfoNVEugDtDPeatqR0OxtIhGORhNATc/9UoNifQjFh6PorFfBH0nnF?=
 =?us-ascii?Q?SOA3XpqzGfTPknA7UM3z6N96IgCkAUxEU3Op/IuMgVbv4OXFPXSinaBrkLgd?=
 =?us-ascii?Q?Op+l6XmV09TGzLWgQ7bM22F8VYosckqx8yQgW82t4HpcByJmGmffkEm2LCcP?=
 =?us-ascii?Q?XPK3Q0e224sRItqbpowLwUZzhDmaX7y98IYDFlz1cij/eXOENgSK9gkTNAgI?=
 =?us-ascii?Q?sfRjRPIgqZLOacyOEDcLvab54+Vnc4U924qxbQyf/yJ9vjruugMDrXHweNJJ?=
 =?us-ascii?Q?o2FYRu84jg+tIfP23zAethA2F+sIUOrVrHF/s4ofPRDi5VLNLde5Xf2GRZUf?=
 =?us-ascii?Q?gfnfJ8lI7rh3fqjd2pX0ZOiy/GmZtti10hNHGyPm+iyeMDdWDa4jY9HLq0dQ?=
 =?us-ascii?Q?vS43JrP0ZD1Q8CBLYiEJCJSPd5ghms6nR7S1pqqbfZkJMuA0EN/qB9uVq+Qc?=
 =?us-ascii?Q?Opgb9r9zB4N106SmE/0l7Kmx/xbdvQddQs0UzP2Q/LvvKYyiYrFrvCJx60sY?=
 =?us-ascii?Q?Q+sFGOSXbJJSAa7P+z+24R89JDSZv+tbd20Ln5hBW6XMbsfJ9DJkXNFJnwsh?=
 =?us-ascii?Q?xwjuIeKvkOrR5gHEnj17p6RzWC9aN9mHp5RHrp3D/idmMekOzVXlC9lC5xVg?=
 =?us-ascii?Q?nMT6wy2ViRp03PBNXh1Gcaw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55982121-3ea8-43b5-58ee-08db5fe0a4b0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:04:24.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hfbHOYczDsAb7bq9g//8MoBaRK2PAv8sTdts4qGZe8zdnFGqVFEHTFaH5/RqrKsBVepvRuqHR1/AwX3s61Tj8Qo3kLcJq/7agh+2E4wCsYTG6mp0ulapJRgqzt7jYfeo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: IJ5R4QXSWWLP5VG3URTNIBBGNEPF3B3M
X-Message-ID-Hash: IJ5R4QXSWWLP5VG3URTNIBBGNEPF3B3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJ5R4QXSWWLP5VG3URTNIBBGNEPF3B3M/>
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
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++----------
 sound/soc/fsl/imx-audmix.c    |  6 ++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 40870668ee24..917d9da5c57f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -311,8 +311,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(hifi_fe),
 	},
@@ -321,8 +319,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(hifi_be),
 	},
@@ -633,8 +629,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -660,15 +656,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index efbcd4a65ca8..5cf7bb861698 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -255,10 +255,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
+		if (i)
+			priv->dai[i].playback_only = 1;
 
 		/* Add AUDMIX Backend */
 		be_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
@@ -278,8 +278,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		priv->dai[num_dai + i].dpcm_capture  = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 78e2e3932ba5..6e3ce0817478 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -826,8 +826,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.25.1

