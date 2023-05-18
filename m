Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D627B7079D7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3986B82B;
	Thu, 18 May 2023 07:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3986B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389037;
	bh=gjEtTOuwdHygB00M0mSD28h7HCIjauQDLvcJrmQxA18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dD1c4epQaRmIKKDoDSsRmxeo6CdjAsgXRff5VlORQt7KuJ6QJU30+moMmW227/eFG
	 6FtBVRYord5bua4ouHMWAs7gY1KGDRlfyI4O7S4UtnAfaVB7RDO2isYAVCkHCOxOw7
	 oBf3xxxrcGIHovCrDsjohIeQ4eODXkg4NmO+Ymk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27F1EF8057B; Thu, 18 May 2023 07:48:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A43F8016A;
	Thu, 18 May 2023 07:48:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97CE8F80431; Thu, 18 May 2023 07:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2683AF8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2683AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VluKqYfP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNQc/s/6opq0tWKvoPb6Ep0SxatKvnqi3ijrsyai9J9mw8Qj9KCh/jI8pjYdNhuUKvUb37Ibo2FL+gLahQkPfTYDN5T2PpcBf0Pa5Fzk5GEhzHoV118k7XoL7+EDA2kCoqk5QMnM727ntXewbHXY6a85K1RD/f7a92w/Bys495R1GoCIMtdp7uQsgSpd1SEqe89mDGAXbRl15sMIRPQEH5qaszkLeXcav5n7y6PE0NLImci0Yuo+XPHEl8Qs1XD5fnephrzH0Gnbq3F+SEyFMnRLHpPbKIY6+EhHvvmmvSWlPay1dNFm7cEm5Krct3SuuXtsd5/sk6LsBuM5Kg58FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=iKSLCQ/fTdEGV0lH1uSHeOpmTJBpq2z81LoaJMhoom1KxIAF8TIL90feHjx6bS3xmscF3QocTFed5Sdsd2A77cw9fars/yxPRFNxO+mN1gbtu4BwAbYkkozGHXWk50jPTlCs1O4LOg9fUAyZ69RMBxQjDKGpFsZOWRH6v2S9f6BZht4cY6f4YRIQCxWisCTVtM2PAeh2vpgVwISkbwcd2H61ITKYoOinC9CyjwGyQH7MdyYGYpENq5uJ2unzvDzUnebjRSIHY4sxSNSPNLHeOQQPrnT4qWu+cl972m6DIKwyO4ZeynjHDDf3M5hnC/vl4rS1veQU0FQueqPPeXtJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=VluKqYfPyNNDN3J11775lPsQdCsq+MptmergqC5bR61Ztf0DppUgss0ddej22wyveo3yq6nGKLiXI4Q3dVdcHrucMUNhKw2XXNfLJRFlCr3/4uJ2wlDhgc76Gg5A84N/+oLsoPJwLVDWBaOZu1uhGVT2VfMD1NbU2ndl5S+2kRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:48:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:48:08 +0000
Message-ID: <87o7mip4vc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/20] ASoC: fsl: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:48:08 +0000
X-ClientProxiedBy: TYAPR01CA0215.jpnprd01.prod.outlook.com
 (2603:1096:404:29::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 586d1b1c-6703-4d1b-1045-08db5763753c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EYRh+6n1zB1PUVqnxx+Tapt/RDnZAxg+fo31Nj+ejLxnm2cOSfkD74Y6Yl70pJYyiYqnZD8KyiU3HkeFUWO3xb9TiwmxcvlyfCFa1t7dhB3/qtMjviLUBgPKbxiCXO9XtQ4tBOyrHr2pDf5uSIHtbOmjIRmU06dVp8IrZycye/CX9/BHVTQP6PeloeQv+Xp7KW7bP8xBQRJvF/9kxDE/r++k6auRmrj0cKZQxOlGBVdzU0QO7VQVQVU+F7/RtveCbVIHncQdEMcmDvDasBu3bhUh/E1Ni7MflkorNiAASHSMSrtGCOFl69FKm5jc7W8UgnGv2Hd5gDqXGBAk5iAe45igeAkg66l9+7H7bHpLfQnYQujWTA/ZiaHZW7/CAiI7J/dzMDTfpz/4kH53HMGZ2eL09A8S0gh/BSN+Md0FSoOaB4g1jN1tH1MyuUDOOe3RO3I4+qRX9OVdasis577WcRE7pJS94XOOMNKhPhXA8aQigBsSzzcF+/kwjm12IpzE9Eh/pPIaRolnOXzb2UUoRjp4EEr/IjbhNzjLJIPQiRnPmWm1KvOIBvkl5JDygIgtFu1OPBqaOmJ0WPmyEToxGLuN69Fs3osuo99lgk7tsqIfz/eu82frVqZBrDdHEWT6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(54906003)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(7416002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CshsrsGL9p9jaTxfCXbEwm9h3XvbTxz+B8KiXiQNxto1ftgtnQ7261XbCJjA?=
 =?us-ascii?Q?+6BflGXCR1lZeVPZp8spRzU9OjdvgFdzXqbXtVRXWIHqa6YQlcoM2TiCOojZ?=
 =?us-ascii?Q?TfBwhK4RRgSbLi2caWMjpO1I0Aw6j57RTtlIsxrzERGFa/bWHota2b/1qMez?=
 =?us-ascii?Q?pDm1hlA3sI2QxCeWtFExNOglzSQDoygvVr2ul5d8d3Zxr9ReWK7I9kCV7Ajq?=
 =?us-ascii?Q?OnBYt6hLMROz0CrMeKPrSm1xBBudDXZvd0we479UVPm7LCjBUotwClx30u9o?=
 =?us-ascii?Q?RZcFcrFHyja+8QTwierO+87JhV3yJvTcm/q1jtboj4pKxyOOZ8LRo9WFmuiV?=
 =?us-ascii?Q?cHIUaaz3/WtHLCrE5Y/CyvCo7+Oatf866Y7S/wDyOY7qwS+hSUsl9EasBFH3?=
 =?us-ascii?Q?8Z6lda8t3yvITryHYOs4sPBfvPjMmF4CUmr++hqoDLT5QQFnwDEXEvw8mZJj?=
 =?us-ascii?Q?IulVwfU4iav+gLYdSI0R85wnqkKnBhUWhWICjtb09Km+GT1HU2LjnAXxVyeE?=
 =?us-ascii?Q?Gamwq4ruOiJf2hf49gQ/u1F3DwQaw2lQtZoaC1ySGFt2NZQw2DCDjsZJOEaw?=
 =?us-ascii?Q?g3+MP4SUlh0AK8DExREJgZK6FmU5K1AnWMRUqCYHqf/YVlRmKlE2v3GcH1e3?=
 =?us-ascii?Q?UZoT2Vle7uSu0Zh80wIRzVBWPMfxBWubn1SdpUr9jk+/DzyGCAoQegSjJhxn?=
 =?us-ascii?Q?rqbTyWNQ3ZIUcaRL1P+0ZT2fgPmOJML1FIc+eKepDUgiG/J6JgimFQAjyY4b?=
 =?us-ascii?Q?XdfpA6NKbwoU1/XTc6Thb3kFzRI71z4S9J6Cxtat6D1bOTWyNQc9p6nNqHVA?=
 =?us-ascii?Q?Rcbob8S6UBUKIXVxAyJCHBaqP+/UEc0tp2aKF7yEZrZHegsTAIhjuYed3hvb?=
 =?us-ascii?Q?2baKAxuWJoBwfYkAJunK0Vz00LHFGUN1PcUpmmk92eaNWhJI7m41+yBnbvBs?=
 =?us-ascii?Q?gp8ViHEGv+Nz3wSCEewdHubw1QdnSYl1BVtRjdy7w/QscWcBq0l15TeT1fMM?=
 =?us-ascii?Q?GCV5fyV+16gqI+D5MRlDupyiD5T2xCnWCr3vZ5akBgxwjqow6YmnUbUm3wrq?=
 =?us-ascii?Q?M/akcbH8UfOyrdT1CZA1U871qG3L8fKOOqyz2n4tgzRBnUEyugurRoUaaGcn?=
 =?us-ascii?Q?t4XB9c+DnnovtRENdh4HCtx7fR208fNqwc3T4JYbq/YyqzbCpX32OGlfvlye?=
 =?us-ascii?Q?m06pc7is7xtyYJ2u/phILAiuz4D3p/6g2G6wLVeV1QfAxlJNZT3FYMaITsYG?=
 =?us-ascii?Q?O3I8N5fD/JcpoBaNwmUUKsSj+tzjfKKmmRtaJ3mDmcETqxLMWMllRKrid/N5?=
 =?us-ascii?Q?Ht2gvafLOdJFIcEEF2w0czCIaDh0fk800iN4vR5NbbiUUYWudVNxNTVBlHX9?=
 =?us-ascii?Q?B+GLnOmEMqqK/cal/821Bstpcuc35vb7XLWeOyZmkyd7wr+txyVqOLlJhpu+?=
 =?us-ascii?Q?kxpfRxDzJbk360dru1pZu0r51hRdqZfjXvYD7y+lVHooKpIfJVFfBs9lFIzN?=
 =?us-ascii?Q?EQORa18foemS8/8uxxRhnqqZGNHPFR1UveyvGw0QuGkM1YMnwHRuwYRVwzsg?=
 =?us-ascii?Q?7krsEATCAWBEV5wRzkLtlffcVlDfQ2iphoEbjELT1kkVHyEc+YD05Sez8D/r?=
 =?us-ascii?Q?S2F7VSSS9KdqbAUU/go+wcU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 586d1b1c-6703-4d1b-1045-08db5763753c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:48:08.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DtCNlumH+B1y2Ch8vOVyihuZ5NGA/Zx1tzd/fEUkz231h9G9pAnKFGYuT3fhgMHMWilAaaYnALUGrNlNWDVPJVBJrldTYmV5ztLgqgB40zA1wV6jXcPSlhMpEYQjDwY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: NLXKUIXKF4X7KFVES4S3T6MBIAKZKXT2
X-Message-ID-Hash: NLXKUIXKF4X7KFVES4S3T6MBIAKZKXT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLXKUIXKF4X7KFVES4S3T6MBIAKZKXT2/>
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

