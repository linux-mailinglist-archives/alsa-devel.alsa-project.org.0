Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739876C1CB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:00:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0FC2829;
	Wed,  2 Aug 2023 02:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0FC2829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938048;
	bh=z9r330xFjBOxtKFIuYSrv5JOeU2K1COzYNgUm3MQuWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMoNuhZyoyoBgDM37yZncte0+OOwAb1W/eGNAdXc6E3+Yv2AeM/FMVmCKDoelJer1
	 rooVd7CRYCe1N10KKz62pAxxBqC7RdIWjKwgR6EvKN7kysQTwM/1YcKyOQur4GEqtn
	 DDz90V7ZT5Bi4J3fQmBkcnPgm1xZzqdCO9xhDORg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28C5AF80587; Wed,  2 Aug 2023 02:56:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76E08F80587;
	Wed,  2 Aug 2023 02:56:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CFBDF80631; Wed,  2 Aug 2023 02:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE07DF8062E
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE07DF8062E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kyY5y40A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWFL1c34QONTYZd4ocOiNdX3911FRywdxrqwZTbseZHzT9hBQZrbK4QWUCHHuCRvcoHsHOjAIcLdSIpnOcQxO1CoNVwHgIVhx9kenYpFyYISPgl59HQ0cKUdB2dgREluD2ZsBKq2wUqFFEh/rnyfEJ9zkEdKe8GAzIoua54VkOero+Ux3YL6R4MBFsJcASs5shEg42HsQq/E4yT9mBcF6kJ+4RoK9S4zq8/n5udklu6Sq7VrGNFNUin5dc09ZPIBMI1GNJU4io9q6c2TegRkVxaCQlPN2+lu6/XWp9eVfcqoVCk4m8EDMX+13DhCyHbCLuzy4BSR/FIm/eUxfpUh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydmZ/P1vKnABLLAxksIh2R5k9rL2ZzeMrA7Fv13c6zA=;
 b=AT4fCOKgJY8QnzqNDDoHtXJBkgWNshG2u8E+IS+dDI0JpOII+YbbI155RLgVPhBTTM5SXaS84VUI32NSjMC2JUfN1A5OPX4OvXt7scOlzz/Cj8XTF/C5EX+5FIC/k7yeEhVQgnePPfGBcbYIfQEqAqmCiRzOLVPpQp3cxEFH0WQeiHVdzQY1kkI5S8Ft/wsDDRVkTXBWLtRDK5tPFywRTsFu0RPquVtFs1fqdUynKCcJsrxo0VauOnbOtsOjvZ5d6eaaiKzLj3rhTJa0W7Fq1P1R29AJw+M0LlEcTQRK1yAd6ZeDhshSRc06HZ5ycORBYQ5KDNCKbwIj7XD2wTsECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydmZ/P1vKnABLLAxksIh2R5k9rL2ZzeMrA7Fv13c6zA=;
 b=kyY5y40AHYSHagWKGyMeLwjv7Tj3zsiXnBdTb1I5tus8aVOJ44HdHKmW6UMF5f6/iX4g+HJRlJJm3MSo45IT1Wonn9yl3xrVA1YaG3erfLcjHyvokJr1nD3cJvVL70loeqMchrnk6yC6v75CRKeA3AlUg3KdX0o2qoIVhpEmfdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:56:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:56:40 +0000
Message-ID: <878rautg6w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 26/38] ASoC: samsung: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:56:40 +0000
X-ClientProxiedBy: TYAPR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d564cb-56e3-4c39-f99e-08db92f3550b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FqmscHYnvlZ3VUS6cKYvKQOvRhJsLNstQnIbYzecoWEnEDCxGuNrgJwBL96OqJWcCfwlsQ/YGgKmwvJILRyEa8OfLGrXPf4V7JgdoChY+6TzVKlYb/f72Yn+XOysUdssqvzsSBW+vwBGgKvSAECTuyz54vm2jesgNVgeX89vuBIkEvL0dCC6DUvxr5MRgJGXqwjeTX0erqju34NyhButx79EbqirW9lj4/2razLzmuqN6FoewSicWmQcRBIAiNm+qpwBC22tF4+cwHjm/NQiCpcHp+tE4JozRQDXGaT+Opw/zeSEeyGenkChHJstm2ZOeqep30jdqmSyENrfJOWloBZOMcxl6mnF8+T/+xwYrV6KVR2ZYhxo4kS5mRW7cWNG138acKqZ5i/Ghlxvd3xKvesPY9ss+SzGlXUV/zb8ink+2MmDpMLQOtYjxYTqi9ICSEHPlxg/P4NfTTJmavPmyroozhWwA8ZaEcVhTpygwknBvcVHkaRz6cJeqCuUUA+mJb++vN7r88/2VxXYeXpi7z3bF8uetHhCdLa5D1gIPKPbLuQIK30WDc/oIGgEQYiRinqn5UFZeXe0d5hYHX0VU3sI/so37IwZCxR1A+iopvbxbW3LebYzBpYEwUnWOo9n
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h/0B5xx3Wty4lPJ5n+hLwMpEJaOxN0fG0FA9ZR+TdhTSIhIvzw8cB35KhojT?=
 =?us-ascii?Q?7DkI7MP02ogBV6fUwIu3nmPheM18KP/mAamNBOd9XDoxcxUoJk00Ksxj3PMZ?=
 =?us-ascii?Q?Mt+E9EA20U/XB4vtkUfcydHJN5G8Qdfnz549gPp1Z7Gq7msEuEW6gBLThw8m?=
 =?us-ascii?Q?pCxcjkYRS3Ct32/eyVjP8SqddrrYDy193/RWE0S/n/UeTH1V/T9lYdp4VqZB?=
 =?us-ascii?Q?AJJlk1Lhghx+YXXQ6PZkcICYeubvOrqVQEBko4ppGy6O09yK+6Vc+yu8+Zx0?=
 =?us-ascii?Q?HYUODsbX/a898sgYgKkIiaCC9yuwq1050PgJz2D+y3tmSzgAZh/XnRBvGTqf?=
 =?us-ascii?Q?JDC9TJzGGAQXTBLstb1WPjlBNbMg9xzida51vn3eoaV8QRAd13Pyg+HZBm3Z?=
 =?us-ascii?Q?xQWGlMLX0iBqMZ/Nfxhjsnvl+bU2IZzbotISyfnMU9lQvWRjoGz042sbi36+?=
 =?us-ascii?Q?t74fbprBXf1OTa5ElPwLJthkRlFQ0pfCDzCxJjjjA7eLyh8otzpx6XZftqAA?=
 =?us-ascii?Q?w8+LKMdFa2UvAVYgq8zt/HtV8KqIa2DNajgTH1YGuwZNiMK8vww3pQSc9THi?=
 =?us-ascii?Q?bQWBtGPaH0GGqjTjyFF1GqY6blqZh1BDjveQktxcyCUZqs+ZK2faarlTU65d?=
 =?us-ascii?Q?jkTttXMaBkMoG8/bFBn/GrSRZ2V5mmCpNDG8pvhoHD3CSuK+DMNGFSyCQ7r6?=
 =?us-ascii?Q?CDpNdnyCVyR41wUzuqY5Hb/raLSiBOWVVXNYw3DzRCny20xoXtXj/6O/kiws?=
 =?us-ascii?Q?1VaV0OZF4FBOmcb2ydzqnU/Pl6Hd45CNUzWVLR99Tscb1sgCt6rG5Rda2/Xe?=
 =?us-ascii?Q?pF4PYNZKghxGwPcUuwYqyIvqqFc1q8Zf9XIpNqqMiwAeMhh+ic2BObLyOv7r?=
 =?us-ascii?Q?fL35pr81AFuaOw2bM4KmwnVnn7f03nxRrvxs21dzrl01W+ges6bUt/v61wUl?=
 =?us-ascii?Q?zGse2soIpJZ2v43cl2+9LgM3VoQf/WNkTgF+EswbfcfKtvsBWJv6CLhfXT9p?=
 =?us-ascii?Q?Bgws4KD4RAxCQ9OdVvMfH7HdRFOakFYXgZ6rP6bOAsLfaeKwVhZ2DKipVeX6?=
 =?us-ascii?Q?V0yxVXmuLWzk7reJVwuXq6eS7/cwPHv13p/3saCVnYmh4qy0DRyA+XPEQJU1?=
 =?us-ascii?Q?dZOvbVI0k5ynXey3GBgW/QaiUMKieHI5l/nO1rOIb6KlUo8WWZKc6ZZBHJw1?=
 =?us-ascii?Q?FHxYiZy/qhMYzqIXEA2CFb5o/j+FYNwzBvSC/PoCY/43u7PMBcbnhRRSe0QM?=
 =?us-ascii?Q?BLqXEpghDo+xZ3Qzf6p0ozYIDGxDMR+u6IYAmDmJJHh1g9U7ir+3BSK5qQVr?=
 =?us-ascii?Q?3Si8KINtDgv9FoTw1VF+jMyoIs5DNn3UB1e7siou9BSh3ysdstfez/HY4Fgq?=
 =?us-ascii?Q?sti3vC5hn2g8ynQ63bGTiFpY2KuNhRaUgc8iwsVdtZezVa0UOyti6nZ/abOR?=
 =?us-ascii?Q?hS3U5PlOnNPjvo6Pi3zVZykSLYMXAc0/VSFmGrLqSl7EYBL6ibeABcbp67yA?=
 =?us-ascii?Q?q/duFS1CluaxhskzJPW+c9SvpOnpF/yyXSwLqJ5qhzlU+1YnKrOqsKTd5ZPQ?=
 =?us-ascii?Q?fxyxAccCy3MbckOAUnI4RFb78IZTq8RHCtnBHJdLHIN/LRuMdqDLESQ2XJLu?=
 =?us-ascii?Q?/IMBlhMtOXTJIJV31LAEGBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79d564cb-56e3-4c39-f99e-08db92f3550b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:56:40.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pakr95EYzPgVnkX/PofIbzSJHJ2JRM4D2gE0WntTQY46v1o2rqz9/G3pPm8S1ByOXvcH4f9KTEJPXA4y5lr8bkWjOSftNgvWm/ploDtkbL1U6f11mXGQ8fSrRlanr61u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: EOK3VMXX2FWYJGMYPUEO2VKB7IFOLJKW
X-Message-ID-Hash: EOK3VMXX2FWYJGMYPUEO2VKB7IFOLJKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOK3VMXX2FWYJGMYPUEO2VKB7IFOLJKW/>
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
 sound/soc/samsung/i2s.c |  5 ++---
 sound/soc/samsung/pcm.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f3d98abd5f0d..3af48c9b5ab7 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1120,6 +1120,8 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
+	.probe = samsung_i2s_dai_probe,
+	.remove = samsung_i2s_dai_remove,
 	.trigger = i2s_trigger,
 	.hw_params = i2s_hw_params,
 	.set_fmt = i2s_set_fmt,
@@ -1188,9 +1190,6 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 	for (i = 0; i < num_dais; i++) {
 		dai_drv = &priv->dai_drv[i];
 
-		dai_drv->probe = samsung_i2s_dai_probe;
-		dai_drv->remove = samsung_i2s_dai_remove;
-
 		dai_drv->symmetric_rate = 1;
 		dai_drv->ops = &samsung_i2s_dai_ops;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 335fe5cb9cfc..d2cdc5c8e05b 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -432,14 +432,6 @@ static int s3c_pcm_set_sysclk(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
-	.set_sysclk	= s3c_pcm_set_sysclk,
-	.set_clkdiv	= s3c_pcm_set_clkdiv,
-	.trigger	= s3c_pcm_trigger,
-	.hw_params	= s3c_pcm_hw_params,
-	.set_fmt	= s3c_pcm_set_fmt,
-};
-
 static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(dai);
@@ -449,11 +441,19 @@ static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
+	.probe		= s3c_pcm_dai_probe,
+	.set_sysclk	= s3c_pcm_set_sysclk,
+	.set_clkdiv	= s3c_pcm_set_clkdiv,
+	.trigger	= s3c_pcm_trigger,
+	.hw_params	= s3c_pcm_hw_params,
+	.set_fmt	= s3c_pcm_set_fmt,
+};
+
 #define S3C_PCM_RATES  SNDRV_PCM_RATE_8000_96000
 
 #define S3C_PCM_DAI_DECLARE			\
 	.symmetric_rate = 1,					\
-	.probe = s3c_pcm_dai_probe,				\
 	.ops = &s3c_pcm_dai_ops,				\
 	.playback = {						\
 		.channels_min	= 2,				\
-- 
2.25.1

