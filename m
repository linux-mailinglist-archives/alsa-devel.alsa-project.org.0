Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA276C1CC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49544BC0;
	Wed,  2 Aug 2023 03:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49544BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938065;
	bh=eotOy8HB3kgdWjjotZ8Xwtl+a8vaS+K4CgTCS/NPes8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bd9T3BJQfqT/4Jv8LW6sizpMhMgq9KytkKQNpKu5tRg2a28q6g8ZS/4zgIiOmJ0R1
	 UcKgQhaWGdimL9KSjA9vA8ag5I7CEROUPeldILTHpbJMrm0ml7zSoO74ZQ4+4fGLeq
	 QwhJC390bBOLpq1FgtIfM/SnlPuRdamss/AsplPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D301DF80553; Wed,  2 Aug 2023 02:57:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FD5F80564;
	Wed,  2 Aug 2023 02:57:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDDE8F805DF; Wed,  2 Aug 2023 02:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D78AF80553
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D78AF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dcvnxMnf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRLs834kE76NTIDd53XSASyF2FinqfeKTPo/zXPOWrSBEv6IP86r6P1/LV0QMKfgyw8OFKM965/bQHBJiaZasUI0q66Q2Up/3N1w7UHtFCm9rRjO/YiztCUjAiJUI3Je4jmvzqw9iq/Gr1uLABgmwL1KuGO7aR/DHVwWrK5KxcbdqpVddDI9gFZ1HC5AqcmfpOC2c2cMuwYLWhTIAstqC+Zj4oYmCJT/iJceFGGCpJhXmsKgya/hRuvXAXpJKByyZHn3GW6srCrwo9e1ZyJfhAM0jHg6t0zPfSDCGwdPZ0dACd+1OQiKff/etNwuwRU7m5v5aoTWOg7b09hpiT5J0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCGZniOyUBCOv/d9HheAVZ3MVwUET3UD3t0K6zlC1MU=;
 b=gb4cvawhhn+Gjk9vcGNMG8yvxAn0/chqzx8X1eP3eAaI8dtYxJY6LS8FG1uBfo0MFfxvylI9jzQnq09dpVloaUg0AM2+2gezUAS8vAdWqgEjR1QAPqP5U8h2c0MM/H7GR+HBJ8qpZeBgtNz/gxhNZ2m9uWZ5i+AX+L9Z6jCY6o/fTS+yT+An0A9VwZZyznLdGhf/SHv0afnX6cSrDPUD5Ixsim/zMKz5kb9QQwpd7N0rBsGL5qA+ASO4ZUt1QWqgyCI99lwESc0lZnUMRz81wi+SEc4Iei0yhTdxgfY80mtyQualumO/OCSyP7zaisF2gAP/JucBFGtCIpHYLnZiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCGZniOyUBCOv/d9HheAVZ3MVwUET3UD3t0K6zlC1MU=;
 b=dcvnxMnf6DlE+yjH//Ls+Z5bRvpeRxjs8LUTA87Gg1nqBMkw5OvfdWDxqOytMg+p5VcqmnxxVJN5PfKDoN5pcnCkzFZVQ+3dAoA6OIJStV8TSs6INWEP7TFKoXjK41aSsCiqznuXfA+oGWUg+ST/J8PlrUpA/lJGImCHdLmvEqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:56:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:56:51 +0000
Message-ID: <877cqetg6l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 27/38] ASoC: mediatek: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:56:50 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b19effb-1e7e-40b0-1753-08db92f35b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QVVhwqhCD+pXRR5c4iPNFklQ8ToMo6DwaILr6Npiry8ttQ99BpDJ8UwYRzTGllVkv6EturEtkGj6lT/RSAlB0utSEzWWzgfIEUx69KQMbjF8xgop96odV8QNQ9+Q58xkvIGjCy7aB1hc628v4POnGrtdoUTjzn4vm+vIY5xGl8yJR+uA8aHoFKSVbeJZDr3XScA+7BdX/6kV7rPucpTL30J3jN6UXTOjaRQ8WyQ6hvmVliDd3bmX5mC/d7UQF/d5mgRtiZsr8Pi3sbGIeyzlCQCuPrpJ/LmYwkArNZ+JcZzvy4sVm6Ct2kwQRvHlqMzPR96owHUqV9bjPH1VSakMWO84G8zqafkHxb4EHzx2wqqMfVufhUlHaagbC/tQV2ztTJyW+4n4xk12JeFsPyAVipWq3Zfm1bxDbI4Br+vr9086inPvrwppNYj55yhBXebCwIQTD7sejXAnBlk2TVjdO8EC1GR69EC2/VBsn+tYi7RP33Ma3Q/IAZZoNCUosdmUer4GyJY7wM2qqQcjcGhomYjPZ5NR2dVxs/RyBwMxa6O52puJTONjqEiRhE8wRXjOfhuILANzrILKVZdwdjkX0u8//nJihGUwEwhmbYzANlU3iGj7BfZuqzWkeKUH4qAe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2iFu0CNvU2TLIL+kdh4FjBaogaWNASBjKc9PDHzMtxJ106Be6ZCrcpIGxMZ0?=
 =?us-ascii?Q?0IP3YntMutNaqdJvS8U5XDuVcjU/FOa1KYYOpIaqprvCcmiq5oQGnlljypn2?=
 =?us-ascii?Q?zy3FuTM6ZlUCa770gipCdKfJBzlLBFRdLVPrGLn6ajiolEp9ot5qzI59SxHl?=
 =?us-ascii?Q?WONk8wRoOV93kZKlzbYYmYJJzepGHaZv3QfsqWALk5cfe5N3JJKEKTJbHD1N?=
 =?us-ascii?Q?flSaVbMQEbWuns3UWTrq98/d5aBmIxluIWBpVKQYVdb9pa/699mJQ+bNLX1u?=
 =?us-ascii?Q?FqItsVkwpzYliMtG7JMKZgBcOKi1X7nOJcaAPINRHf19o9ki0WcSNpnNzdt7?=
 =?us-ascii?Q?kyiGHCyD20/iO6RqRs3Wj5BXnKonQ2HVkHcANKtxvUVcBdFZ6slRWnGS6550?=
 =?us-ascii?Q?4PPDig7zcGqNZIeboH8u0M5fHj3t9qG/vbfDEVFREgYFTpOYUFHfJDPQ/lTS?=
 =?us-ascii?Q?GuCNiO2jEGA1+yA/sbISEkNR0308QzHG8B2KTS/o+0+zBdC6ur3XNA5ROCgc?=
 =?us-ascii?Q?hqXjQSsoTmxpZ0CvX5pC47lEDgqU9DHBLuTdlh6lMOLeaAPQCx8KqQhUO2BI?=
 =?us-ascii?Q?VXlSGFjYSTCIJXr0hm2voxOU/rB69QHqSGaX2j/83g8SMqYqFTOISzSzvf9w?=
 =?us-ascii?Q?4BBnLVWVdSn6mqr+pSUkz066DuIfLbucBrABTZY8YSTHSHBQiF2zG7UmNyDO?=
 =?us-ascii?Q?yVCLDshFWk6JYai2KIkO5MFO0RQurocenD4az/8uxu7gPDmo7KyzxlwNBo6Y?=
 =?us-ascii?Q?d2XzEnd9vNkx69wcq3WMYq1EiHyeDH1hL3R2G9X8p8cbMxC+QiE0+eAamKSn?=
 =?us-ascii?Q?jVHIi3ylLwF2ffe19xPbjKhEn+g16HytroMITszA5DzhJ9YYr8tWLGBTkudf?=
 =?us-ascii?Q?tMxHXVux92MRRNtm9s1of3mpTv3CPpyUmLwiLFhbOTjZcLVZHrjyH9PseMfm?=
 =?us-ascii?Q?iDcm5p5W6U028SiNNhQ+p0psWoL9qQmBhPVmwkjx8JxrcwvfcbTMyZr8onzq?=
 =?us-ascii?Q?9Vo28IRSTtCpuyS+TNAcW4OfaasduN4Q3jv6oN9/x2yCMzJ9NN96vk99Qqcy?=
 =?us-ascii?Q?nAH3hn8C1oNGPa1baNmfC32Qb5lrZID5yaUVYMjnSiu7k/P2B+wUmBeriEjq?=
 =?us-ascii?Q?cp1iVQzPbBgy2s8KVI251uXp8g1fhuhFPgQ0nuFj8LNf/7huCIWoHWiXpXtK?=
 =?us-ascii?Q?pNXhoC4jttYSlQm0jVKzIeVSTNKBTJgJbBZNqaGyZyhEfLd5IaKXiGwsdPW9?=
 =?us-ascii?Q?YaxvoizTOaFEtlg/Hhm2rQibmga8nHbveZICeeGgng+9VH+OpD4sAMWOFJPa?=
 =?us-ascii?Q?pa4ttKTOgTfz1GCgnkZnlvl0XBPwYMfPU32J/nzndB14q/y7bYq+wnEu7rgM?=
 =?us-ascii?Q?S/RCvLqWq3e3DqYpHCFKH3GG8eWvWwsdK5S+7QaFe8wCAV+Sx70WtMTSx2TA?=
 =?us-ascii?Q?WgUaUSldMpnVOO+l9GJlwlbPoNW8IJpLVgJ8AnOHwttZMt5RPYJtUdwx00ak?=
 =?us-ascii?Q?ZWQXqXdppKfFh6mMFxVwY/6cc3ppzcglYA8+kxle4R71seS6nKuVV2nsc85m?=
 =?us-ascii?Q?14TJ9K8rAFTYu7Ul2eyxBKKrxaxbsTpMVrI0xQK7l4nGW/8u/qTEH8v5+ez4?=
 =?us-ascii?Q?SIoRD4krB+TP5IQN20An7lg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b19effb-1e7e-40b0-1753-08db92f35b49
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:56:51.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YldUuLe5BTSGSMRRZn+mVvnc+wblcIMWRON0kFxuiiPnZvkNHnXVdrnFTlri2jDnas0tU+hL2UT0PGvE9a6PkKdGU8wuwrxr+ubrvbd7cA5YKd/5vyOkxeqMFU/ZFa+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: 64D36RUXZTNGAIXUDEL7VCFZD4PSU3JZ
X-Message-ID-Hash: 64D36RUXZTNGAIXUDEL7VCFZD4PSU3JZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64D36RUXZTNGAIXUDEL7VCFZD4PSU3JZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 56 ++++++++++++---------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index eedb9165f911..fd4f9f8f032d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2456,25 +2456,6 @@ static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,
 	return mtk_dai_etdm_cal_mclk(afe, freq, dai->id);
 }
 
-static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
-	.startup = mtk_dai_etdm_startup,
-	.shutdown = mtk_dai_etdm_shutdown,
-	.hw_params = mtk_dai_etdm_hw_params,
-	.trigger = mtk_dai_etdm_trigger,
-	.set_sysclk = mtk_dai_etdm_set_sysclk,
-	.set_fmt = mtk_dai_etdm_set_fmt,
-	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
-};
-
-static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-	.startup	= mtk_dai_hdmitx_dptx_startup,
-	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
-	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
-	.trigger	= mtk_dai_hdmitx_dptx_trigger,
-	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
-	.set_fmt	= mtk_dai_etdm_set_fmt,
-};
-
 /* dai driver */
 #define MTK_ETDM_RATES (SNDRV_PCM_RATE_8000_384000)
 
@@ -2505,6 +2486,36 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
+	.startup	= mtk_dai_hdmitx_dptx_startup,
+	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
+	.trigger	= mtk_dai_hdmitx_dptx_trigger,
+	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+};
+
+static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
+	.probe		= mtk_dai_etdm_probe,
+	.startup	= mtk_dai_hdmitx_dptx_startup,
+	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
+	.trigger	= mtk_dai_hdmitx_dptx_trigger,
+	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+};
+
+static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
+	.probe		= mtk_dai_etdm_probe,
+	.startup	= mtk_dai_etdm_startup,
+	.shutdown	= mtk_dai_etdm_shutdown,
+	.hw_params	= mtk_dai_etdm_hw_params,
+	.trigger	= mtk_dai_etdm_trigger,
+	.set_sysclk	= mtk_dai_etdm_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.set_tdm_slot	= mtk_dai_etdm_set_tdm_slot,
+};
+
 static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 	{
 		.name = "DPTX",
@@ -2529,7 +2540,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM2_IN",
@@ -2542,7 +2552,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM1_OUT",
@@ -2555,7 +2564,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM2_OUT",
@@ -2568,7 +2576,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM3_OUT",
@@ -2580,8 +2587,7 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.rates = MTK_ETDM_RATES,
 			.formats = MTK_ETDM_FORMATS,
 		},
-		.ops = &mtk_dai_hdmitx_dptx_ops,
-		.probe = mtk_dai_etdm_probe,
+		.ops = &mtk_dai_hdmitx_dptx_ops2,
 	},
 };
 
-- 
2.25.1

