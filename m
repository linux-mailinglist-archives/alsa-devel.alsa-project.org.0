Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50276C1C3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39C7950;
	Wed,  2 Aug 2023 02:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39C7950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937892;
	bh=1tssLB8s1SncyG/VKkpVypke/Xmef4dq12lkLT728AM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Md3X5IuOKaziiMFw9Tu3aTi/iZMB3YthVXJ8CDLInOg+2WkRubMQ9wSND9jLNdFNJ
	 N6Xu1QH1zKAx3zAmv8cu5uu9no1e8ITVVHXFG3IZacOZlCiP9vODelxIZRO4WtDWZo
	 1wfOkqV3UDAcdhL+0WJo42b4i0h28W3k2jh7EBEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 332F1F80535; Wed,  2 Aug 2023 02:55:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E71D9F80535;
	Wed,  2 Aug 2023 02:55:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A694AF805A0; Wed,  2 Aug 2023 02:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A04B5F80535
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04B5F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RznJV4FT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0lvL59QNC1nSHKCitcdlTs2QtE1Ql8kdXB2K4bwCgLWipVwnz6x5WFgwBEIFFkRmqGiCkeMqdAOZjPYQLxklJrzsWg47XRhAxbU1HELkyCwFUvakkmMUlBbRVMnmtk1IKiVJntJBqOiEkupLgOUdHmGBDPUNWAUrLh49K/JCqF4NL0YHLxzTsErfMmj36pXuiHIjQP5IFxYvqdttaVMaQjNNi23XWhGZIJg0HPSiNG00md9vyk1xvRiYJ/phHJnnu+kn5EaADh8Tq/HAhvm+c/LXccPArjzdXL/3SX/2MSXwQ7M0KrC9yxQxLs6jofrV4pAdVuNWssnCvEnoPBbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/a67ST9VSaFBJGLDrllDQIeR0IlpOMroh3cZ7C4noU=;
 b=i16lztC7IwbnyYYQQBn5PRTZVfkMKTXQgNSYvkAnKZoeLFGBZrWIo1RnVnR0lFfh42x8/orQjkYoyq/udyK4wg0XoIh6j17QMm4FCyTsEtpWnNKZyJIPxAC5EsC9L7/IOasR4zK0FH8j9KN7xTXQF+jPps6XvFkEYd/uYj/BAA5ed8prOSPt51ZKxn9uht0v3/4d4kdeIzcDpM3tIhhpzggjLp8JcoYrLnLeirKkZe6pD3rnmsTT98GIkK7lHMr6j4MNeYkONEKqyvlDruNvdJJc8oTd8Keh+2B+NqljZWW097N9RYF7JSw8N/GMeg/haACn3CkNXCKUOptn5gzFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/a67ST9VSaFBJGLDrllDQIeR0IlpOMroh3cZ7C4noU=;
 b=RznJV4FT+5eOG0i1P6IrhAh7wax5kj6wfl18zRjZKitcOPuTCP1YWe1DjUq9FgBzJy69jeFm2AxoKL5G2soE5eAiuFA9pYQOr78s1Ajyxd+Sup5j/dJbtDePgoWsTd0ZfGtFYF8eb2qUnNFvvfvNuN+TqZ1vIb6cBTP35RTH9MQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:53 +0000
Message-ID: <87jzuetg9u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>, Ban Tao <fengzheng923@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 18/38] ASoC: sunxi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:53 +0000
X-ClientProxiedBy: TYXPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:403:a::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: bb27e16a-4aa8-4204-b3e1-08db92f31558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tKqlYUIq8JO0nqdHzMC70INU/S6zUinA2ts0peohFGCyiHhOlM27Er1i3K+d1uUHEc/rSKdq2GBxnbNOXUxrBxJXor6aOORhaM9lBaZsM8Fy0V3j+/f/2hCzN59lvzhEp1bTU22yqh/Ulyd7+iPzta+cREATuAE4EHGkHMOB+uyUB1AVeAjgHEy4CqOJzTOmWLhHijTIQD8VqWQ9gDQZ1lbc4pstDr4MEonyGV6R6YxJtziqB0Ziw8uDYBqdhxMb8l6iU3KQx1evNXg9gmMQuaEBW+KHoUcwX57xNAIFmXwnbZCzf5zd3jOmHF5qfJzBzrHATE+vo8Ma2hF6+53mCMjgegowogruBDL2DxsW9bW7iiIObwa+2pusATXtAnxU/QVzsBAPyhUnUCbdt79vyQGXeAlF2b99j1ee7AMRUpKxjQ/ZDCXbUxKpOizuI0QhDqsLK1bTHGj8pIja7/j1lNLLMBFm4XkVpA9vDHOR9gmXNI2AHe88ZaIWZHRuU62+xi370nDuBd+6plHvaDspWqxDTW5iqFW/OTN4wPqKYHjVddmOsCpsmdGYRp8x5bYVMzhencx/Vo5T7fo9SXM0cqWxKQDLZ1t3r88yaIek95ezjm1S4Bzez74WWA8C9zt2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(7416002)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rp1V5+/mBFsMHHFhDs9TcFBQvFzIaEEweZzUwUbCMzYRPmDiAyd9EFaU+ZK4?=
 =?us-ascii?Q?OOpnV1EEAtoNcMylYrxgLryNl7W7rQ8K0rkhjeByjGEt5VXmxBvnjF81sL52?=
 =?us-ascii?Q?5+l1PB137W12ZmsCWtSsDcf7ofsngfJSE0Q8Cj1RmfC7wR5zKEkX2wGLMkXr?=
 =?us-ascii?Q?8rbFYHl9J5Atli1TrsOrJid2acX8PInXR0LzXdxXjAFDkgHUfEqUfnUM2ULY?=
 =?us-ascii?Q?0TKSYzQJgDQ0bzdyLLAFticAkgXFAhd78X1yKi/FrN1HF5wOric5VtR5USlo?=
 =?us-ascii?Q?AsR8yORic3pkpmxsPx8VPGN0ZT6unPAgE3sfMM5fs8FKT+dymam6tTT96JuN?=
 =?us-ascii?Q?zqZ0JnoVNTJoNG+xxXuFYfd/+542ZFJ2pUgC6mc0Db7XuJDjfR2nFKkaP8op?=
 =?us-ascii?Q?FRvERD09ztbDr0bRZmGEawKkzZepL7ZQIg2PHtseY6d3qSzIrFo4fn4bDF1g?=
 =?us-ascii?Q?Taespgs8o6NEEpVWXmZD0Cp6WNQ3r1FQLAj4PVcCExKzq9wi6G9j2V6ny6jg?=
 =?us-ascii?Q?cF/k1ruIhT5KyUDtYVn0vDAVYzQraVlB9jQadfn6zw+HlKnwlN9B20uhfAnW?=
 =?us-ascii?Q?9iuC5NbKY3dijcDE2V+7d1QkDzfX4tfe89e3BcaN4MXQcxg/bTZ9nwQo/U2R?=
 =?us-ascii?Q?5ntN0zYHau+RX19QWSy++Q3Ac1jLKlv+IFSWJxbcmvqRdhcOa6coOA5kC1fF?=
 =?us-ascii?Q?W9V8fjkr3YPjQ12bEoJomwJ859CTPFg5Z70OKSoZZUmKlfXSwBXBM/1Ac6Tw?=
 =?us-ascii?Q?XjXd62jgiwmsANOO2om687cMrGwjPU2Bbyei3xcj6jEmxLTlHYpXmfASHJre?=
 =?us-ascii?Q?fBHFNG0knsciwSgI8SXKs8UUTV1c7cB+Uk5mDWyNEo7v8j5O1ldXAL3q6tJ7?=
 =?us-ascii?Q?uUXJFL9JbI3cYzQNg0ucX2oKBWI2losmwiY2AHfDfG9jz+IUe+1rYqaI/WKk?=
 =?us-ascii?Q?4JkCD45yNQh5bCj26qjQMS08v5UV6d0HeoU3v+oWYcna0k3yNGicvySI3voN?=
 =?us-ascii?Q?louyKC9YGeo1zS6avhWnRNBGeFJaoSWmgoc7zcm19R8o174eooaN5BphDd1w?=
 =?us-ascii?Q?YgUe15asucxbvKNZ0sC3jldapP200akOSpRWy1EOTzxXCrNNLf+ir0kUvV1z?=
 =?us-ascii?Q?+eU0QsV7Aorm6CeVOLHSKHkSMIYB46SRotJQ9Xpie30570h1yoP+6xHvm8QI?=
 =?us-ascii?Q?2CihNjW8AHRnFruRJTXMdxG82bCbCd21D1KZHA23n9d0s5ZauYZdfQSDEpyG?=
 =?us-ascii?Q?n/yVugHwmfIT54EdOWFUyI6DWm8pW6OOlZ9GspyPsimFPPTI1R1/v8mTW1DF?=
 =?us-ascii?Q?jcK3si/UeKOxwMMB+l5fv2C5pOV6bPcLJZeLt+JTEXI32mX20cqU9JjCFvkc?=
 =?us-ascii?Q?UUqLbviBkMaL+XCU8y1GE7c2tMgnEDwEFod+Z39IZm2r9WG13SpkGcYDNPjT?=
 =?us-ascii?Q?hEet3Zsxi8+/TszRSDwGwd8zbpfIBdcEKARPWnK7l137Kpxcwkt7VTMnTgOb?=
 =?us-ascii?Q?Jl3H1PcCky73CQEysrbSM9Tg/UAKKtjczN3zX7UOwci1tgE+L15Ax19VwWJ3?=
 =?us-ascii?Q?4zVhroFewdUJ0nP4Xi451bM+FQ2d3nXSVh6QPVCrnT+OiQQjrq7erPkB6Dak?=
 =?us-ascii?Q?ajmJwiRoqefckTsG6FQ0UhU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb27e16a-4aa8-4204-b3e1-08db92f31558
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:53.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yyLcft0cGiLsIsJNty5eufXJ4NfEIqwSkSfLOYSgZZhTpS0XohXVS/zlyYToXR2wxLEv7KsWQiUDS1Bn9+a2dhGUjTfNNkkwJv3xl9PmMiZjoxFlZ8zeCstsfJwmyNkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: 7APR7WDCQNQ34HXXBA2ZOCTNTIFLF3TE
X-Message-ID-Hash: 7APR7WDCQNQ34HXXBA2ZOCTNTIFLF3TE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7APR7WDCQNQ34HXXBA2ZOCTNTIFLF3TE/>
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
 sound/soc/sunxi/sun4i-codec.c |  6 +++++-
 sound/soc/sunxi/sun4i-i2s.c   | 18 +++++++++---------
 sound/soc/sunxi/sun4i-spdif.c |  2 +-
 sound/soc/sunxi/sun50i-dmic.c |  2 +-
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 55328850aef5..f0a5fd901101 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1252,9 +1252,12 @@ static int sun4i_codec_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops dummy_dai_ops = {
+	.probe	= sun4i_codec_dai_probe,
+};
+
 static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.name	= "sun4i-codec-cpu-dai",
-	.probe	= sun4i_codec_dai_probe,
 	.playback = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
@@ -1271,6 +1274,7 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 		.formats 	= SUN4I_CODEC_FORMATS,
 		.sig_bits	= 24,
 	 },
+	.ops = &dummy_dai_ops,
 };
 
 static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 669d712bbe9f..5124b6c9ceb4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1081,14 +1081,6 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
-	.hw_params	= sun4i_i2s_hw_params,
-	.set_fmt	= sun4i_i2s_set_fmt,
-	.set_sysclk	= sun4i_i2s_set_sysclk,
-	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
-	.trigger	= sun4i_i2s_trigger,
-};
-
 static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -1100,12 +1092,20 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
+	.probe		= sun4i_i2s_dai_probe,
+	.hw_params	= sun4i_i2s_hw_params,
+	.set_fmt	= sun4i_i2s_set_fmt,
+	.set_sysclk	= sun4i_i2s_set_sysclk,
+	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
+	.trigger	= sun4i_i2s_trigger,
+};
+
 #define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S20_LE | \
 			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
-	.probe = sun4i_i2s_dai_probe,
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 1,
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index ff18d4113aac..28bf6f4dca46 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -508,6 +508,7 @@ static int sun4i_spdif_soc_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops sun4i_spdif_dai_ops = {
+	.probe		= sun4i_spdif_soc_dai_probe,
 	.startup	= sun4i_spdif_startup,
 	.trigger	= sun4i_spdif_trigger,
 	.hw_params	= sun4i_spdif_hw_params,
@@ -533,7 +534,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai = {
 		.rates = SUN4I_RATES,
 		.formats = SUN4I_FORMATS,
 	},
-	.probe = sun4i_spdif_soc_dai_probe,
 	.ops = &sun4i_spdif_dai_ops,
 	.name = "spdif",
 };
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c10439b9e0a2..2599683a582d 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -236,6 +236,7 @@ static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
+	.probe		= sun50i_dmic_soc_dai_probe,
 	.startup        = sun50i_dmic_startup,
 	.trigger        = sun50i_dmic_trigger,
 	.hw_params      = sun50i_dmic_hw_params,
@@ -260,7 +261,6 @@ static struct snd_soc_dai_driver sun50i_dmic_dai = {
 		.formats = SUN50I_DMIC_FORMATS,
 		.sig_bits = 21,
 	},
-	.probe = sun50i_dmic_soc_dai_probe,
 	.ops = &sun50i_dmic_dai_ops,
 	.name = "dmic",
 };
-- 
2.25.1

