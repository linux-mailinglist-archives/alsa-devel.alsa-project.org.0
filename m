Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB071051A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 683C4AEA;
	Thu, 25 May 2023 07:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 683C4AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990911;
	bh=gjEtTOuwdHygB00M0mSD28h7HCIjauQDLvcJrmQxA18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JA0nadyjWLBM73qsC+tbo/ux2T7O8Ph9suc1KwAgsjyWMCkb4Dc9EL/2uUE5dA+z0
	 pkke9mas9oabE5Vn1VaJf6h3bFEqwSamKFpethEGC2DLfOQ3E0npZ2MXBFzPjpGd+O
	 EgdBWuAY0vAwULlbKyVmH+5+52ZHos+EguSGwGS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFF1F80637; Thu, 25 May 2023 03:20:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A69EF80637;
	Thu, 25 May 2023 03:20:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1FEF80638; Thu, 25 May 2023 03:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D81FF80636
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D81FF80636
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Z41XBf2M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHm9GToDJh/fKRA7p2RDuZJ4gM8sgavesRnqcW4QJfLWUgzkndoYZ+L/1BXWcmE1S9V4P6U1VChE3ASoztFWXEiGmlerjMHOShLixDp5wx/EIYWNSOhfbA4qP9o2MLwS70H6aLYd/HmVvNR9osdNs0HeAqgOn1Xd0DwyrjvTQ0cKmhucz9ImyybxKJEvJF5QOKjLEA1KZu+f3avZI6V2MNbPmXQfaMSjAvjwh497d6uJICOCCRBJd9z4hpPdA/eaKuF8EL0VHM5baYTJE+3bOZYXclw0KIEHff0hNqoZckqX5H0AtN+4RK8tbFC5oWqBdhBY0YwTxnOJDlLS+aSg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=O1bjlgsZZNHv4DGrD0uB7GR7Ht1qhtEidxULG0SasTO6McPVIegOmrnSzpi0djBnkBEZJS2t7C65dmSvhDwTOQ38UYu2q5SZTNWBFyStBXBwFDiV/4Dd+VQZhv1eJ1XGAeVRMrXWIFDP3DDGsRoW8OQmABYjLl1gOTTm7VK1gxUxGrgMKayTbJ/srcy2F0xBKxeljAKjdLM+bweZi+Rt33II0C016fSEFWRwCFkJw6HGyXG417UBeukJDsyeFxO/nTK4tKBWlGd5PcX97Rany51BBBhqaO47YZHbKcfKUyo5W32W+vyWJKW9efLvM94RQIBmv8/tdVMGFhpBilIyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHDmF0ep9pmzKKDyiOJ8g9YRx3vltGoaH3tV5Fj4OYA=;
 b=Z41XBf2M0QTElqHZdxE96PfIglwF39UaZpCKVmftkPPVcDKfmZ6OWdAtXSzvzdshXXMgAQDVjAbgF8e2PfvqZ6W9Q30OOHq4MLyz4t6ffv4p1lpS/bW60VsZQhM7PsloAndUDV2Dh+3pdd1SFbql50w9KYxR44aRdlXh1D/pvrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:19:53 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:19:53 +0000
Message-ID: <87fs7lgqbq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/21] ASoC: fsl: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:19:53 +0000
X-ClientProxiedBy: TYAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:404:14::27) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e36de8-6f3f-4564-d0c7-08db5cbe24bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DMCHoGSEjt3geRsEaIiw5hUZmSXKFaQVfJE113WJvsSBu0BonrVqPJKPXVCI6pCIL83FtSCDlySttWK7PHiMcDms2Gu3CYgu0axVcNdbqTotrYKEkAnqVfJD+Vcv4fRohqZxg+O8z82nMcCZ1GuLYLPk8mvLjqum5TMuhskkBX6+W/llPVoc16IQO4SU252vBM+0ZHse2HysfdsCaZaAWVbCTrGgpglgzjiva/R7gHtTVaQOycSEi7cBsIBKogmbT0ZAh8yc3zvd2/aKr8dvx8HM742IcJX1lj6Yx5Je2izwiY2l4uQwYFf3g3+dqgVqjHZvBODxSmIzlUtmYilNyaFUQwQfo6J41BXQzs2CeM6tRY9X8PnobJAV7E5fCoV13j4UPsg02AOCVBJYuX3kPX1UZbXgwjLuPqEM7DyaJlVdoifZTPRbeI+ekak2nTW6pLivR8VGvwyeEzL03cRRt3+MVXGZXRl5v6QyodLzTNeZsvMQnHABeohf1vZkuMsJ32FpM5p06+XfJaVz7fQSvLTJkB+qnW/Wk9B22CdzZ2Q0Cuagt1ZZs+PPiV3PTuDVdkEu8TavOjV7YHqrva/XHgRnRH7Ad7r3tf/zA/3BE5GxRjGVc9uga8Oln6l4U0RZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(54906003)(2616005)(26005)(38350700002)(38100700002)(4326008)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(316002)(5660300002)(2906002)(66946007)(7416002)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ifyeL9+MrNpBbnGf4sDSlaS1iISXr08ma6lhQ4LMQrOy6uTZOOgH5yqkObPk?=
 =?us-ascii?Q?IEPU1l3NPY7yRsl6aBW2UmH9ZmPQ8y0yeQCT0QFyopximd4cb97R4w7wSB4c?=
 =?us-ascii?Q?GtKuo4U8SlII2+NQoPLcf0Q7SRkeor/ATXbsqnSJ3N1kWrMXNvuOIY43fSyi?=
 =?us-ascii?Q?j38N419h4uXPQItdV9nDTLZTvaUmdfG2sVn86jDwowNkCF+rMxB6Q5B450vX?=
 =?us-ascii?Q?T4qo7FZeZbvODDmsQy8l7YXE7SUsznuOAPM+IjU81A+KAPen9xBiqxRZUkbw?=
 =?us-ascii?Q?J+gLgQuvE1Lx8AcK9fy2EKhtHEcThodI8e0sbmsrQBJSG3DQC7Ew1XJ2tPGm?=
 =?us-ascii?Q?uQuDWSdt2139K1xjzdbRZd+tJ7gkHyFdjcQJ6dLAPd8h4Xzxy7T6GJ643amB?=
 =?us-ascii?Q?DKwBoerwGJRC8aIsUIl9KEBodA8vnzOty+G00RpEf47haRKiF5PK62cHe2Py?=
 =?us-ascii?Q?pzE199rO+tLoyh7LD1zRHM88uGAxSosmnwKOKR0u0M4qL2f0OnbZrT12lTOr?=
 =?us-ascii?Q?aCVzn3BuYh4kZTpqffCI91VPIB9rLk6+x7nzF90LjxFna3FJXqSBKOu2Z6ra?=
 =?us-ascii?Q?Wh6SVZUV3f/pGKczsoIHw72/AsqOdXe1cRgLdaOgbZS2XJOsVxLn01lc9Rpt?=
 =?us-ascii?Q?LsWxck7oTvOQwe+2hfb3377fw8Icjw7IfZ6zLtUDMYyRBZoUkI5uXsxvYkTR?=
 =?us-ascii?Q?2vgYmsjsRT2gs3BfT6caXL79ZtVzx65dMOQ4VBeAfHXrUsr2xm+3XGhlLNs7?=
 =?us-ascii?Q?/agyT+jO7vRdMr5EORwY2X3WoFs3ZcpUfCloXIq93ehflCbw/VdJp3bW6AIA?=
 =?us-ascii?Q?utmKGhnOETe8ExtH0LnyyHlo1MnwWTx+4kYdtsmyHcPNx0Ja/6HPhZTcP1lb?=
 =?us-ascii?Q?sLr1Xb3us5R9oA42e8K+M0y+Dxzc2dJQfLJt5WNRls9tDGIM9xfqDldSvKWw?=
 =?us-ascii?Q?r/DMD1xiHU+b5wAgbj7IuB+GWxfVWuzHXYiFulc3CiBf+iOCHNT/gyo7Jy5D?=
 =?us-ascii?Q?sVQgGtVum/g11iMK1WxF/PGuzTFvch4bJpMWcUC2Uay8a1WGSr8eK2LIs6jt?=
 =?us-ascii?Q?W/bcvyM/6vdMmadjb3L1mLqDopPrvP2kL8N8p57ANLhAq1VLVECRcBFmDsXd?=
 =?us-ascii?Q?CNP4I1FI7K/2Ndgl7s8kieiV/OwZ1PULOGqCP+OXzx0N+sm71/WkvycAKHCM?=
 =?us-ascii?Q?Nnp79bT9AmGT4pmpF17JQoDcdasaWkBxJW5jjDDLtPylVj3zOzJh1eUsQ+Cb?=
 =?us-ascii?Q?frwQlqAE13oBhl3wWwTlRdqKlxNyeYQl5IVz53t+BSmsYWRswbSF1xkKgS0v?=
 =?us-ascii?Q?4gx+Gzvhup6DTyZYnLm+PQ4dBbuuFv9Sf1UBfrk5ky3p8J/J9FPUWCk80mPO?=
 =?us-ascii?Q?gOunX9aCD3fg47MAV1RYrrGoeEP+pFj8tmv0FGZ8VHIZHz0xS9jdcI+Xey0y?=
 =?us-ascii?Q?6NY9LIBJgHtEnHnRvg2ysYkY7g5z+Z0iM8khsuRRRUY/ehvoJcUmy1qdgdTv?=
 =?us-ascii?Q?0O24ycHntDcKlal+VqW085TJD5zS5/1HCF4GiIZjP9OfapwDkf7+XObdI65R?=
 =?us-ascii?Q?FnjnBciGG4KPA6jhWwLb/qGY42fDBNSvRpjbras9Vsdc5GWjrNQhHSiaevgL?=
 =?us-ascii?Q?tXcUCDyvzZlr/vAeRpgJ87s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67e36de8-6f3f-4564-d0c7-08db5cbe24bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:19:53.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YF0DwridZeQuk7PQCV43ltKiBlF//3dwphXzc+58CZK9OIQnFjw3I6tYY8tx/MY/MtNIHRWV0M105NEBKONAGy6F4eGXRa0/RxsOgYcMHAtj4rtPSxtOiU+blfvHrbAS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: BXXDQPMHK5H5ZLJSUIGKPDQTCAV3OYZK
X-Message-ID-Hash: BXXDQPMHK5H5ZLJSUIGKPDQTCAV3OYZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXXDQPMHK5H5ZLJSUIGKPDQTCAV3OYZK/>
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

