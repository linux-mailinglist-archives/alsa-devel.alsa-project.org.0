Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3961774EDF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275BEE93;
	Wed,  9 Aug 2023 01:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275BEE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535695;
	bh=tTMI3NffjdTCVTjvDhez1gQ4yurAgGMTo8XWl5Aqkxk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3yMD7RmW0Lwk+aTj9Azrpiw2GAuij3DJa2O/Mn80hmHPgxmcIdLmIQ9Ys0hGQZdY
	 QwT7vrPJFm3txXy5F5DuNUPHR+ax5bKoV/OoMysNnMnjLRfRytrBxOtm5m6zXbjM2L
	 rf5MZedjhe7vnfy+4AIPpNk/1B0vypR3JMvVYb+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6D96F80634; Wed,  9 Aug 2023 00:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B358F80631;
	Wed,  9 Aug 2023 00:57:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A4C4F805A1; Wed,  9 Aug 2023 00:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AFD1F805BB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFD1F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HdY+ZFc5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV1zto1nqC+kXxvBhLau4dXXMmhQ6rCCB1LmXUxi3uqujvIxNmDDO7BrGSwgIZEz8lrAZIAs0upXQ0IBrlclc4bqZhhgm+R7qwICB5OcIQO+FZab/xDAL7FgMSvRaXp3c1qRQYRdfZrtl8TwIF6XNU+RZJ0hO4EiXr8Yi+kL7kEWIZZxjNKkq3HgsWOEr2mi4NIrMXnjm8M5bosrvze2IMjMi8iGoxD5cNejXHdq/RhjiGocEtq4JuEdq0BMFCp/LIcICmV/iwH3YjNG/RozxTZdkUohw97L3p5JomgrFuvriJRLZpBW/NEIBzK3wUad/7fAOx+sRonyhwOBiLr7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geDSCqxx0f3whRSRL7RPlEy8zoyarcSGmY6C/LZc1Kk=;
 b=GkdjQWkqW/cje96QJ8T3G87RX3h7YJuu1ZQ/swKRukC1NXnnKdA+gQT6gw8uzwC9cVE2VftPOMHXCWdh/Tg0No+94Jezs7gNIIvbmZMcIUF0EJLo3+LrKby2LUnGFNPo4e2RfSi35Bwm4L3/9fIv8fyTrmpY2C4hZ0zUcB8gYGtvXOY0JinnMa2K5ysOiIikTMDlyloVj0jaaxCvMcYPEydZdkrgL558zVndyuWSGNCGfse6tSk8WwI6jNuls41TAS1Cs8uzBGPkmtWvy7OVbp0RSwT6HhNbmZh/fzFpI650aahn86LCCTtlhFNoe0xJvbEjFxFr8xhuYZNZuJgDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geDSCqxx0f3whRSRL7RPlEy8zoyarcSGmY6C/LZc1Kk=;
 b=HdY+ZFc5UywdJHnxKmm4equxpMe4+bBKXk/YnRn49V/ETunDalOWq3qAYHBiJfhwhvmUBj3uhA2ntluHWTszPN3eTcGM1VgGI9+cn0EYc3l8TkJexol6/zllKHcnbGfFOADaq0yunLemkB0C3Tx55QzjK46ND8FNqNDf8ytgWZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:59 +0000
Message-ID: <874jl9b0sl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 20/39] ASoC: tegra: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:58 +0000
X-ClientProxiedBy: TYCPR01CA0014.jpnprd01.prod.outlook.com (2603:1096:405::26)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: ceccc824-6510-4018-4226-08db9862c56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kBzh1KGwv0Pf//r96vY4KDiacdYRELX33MgF1yKBFc/53FFE4DlQugxnLDcS+kRbhKmZwAoHGwYUEUK09cDARoSN665VQ5DFkD0UNevIEPdZA6HuIeaTTyRsWzxqZfvphmpfVJ7kPWR2ueq45ydLwenByPS55dTD+I8CAT5qgVmbeGWaUsDkNGVc8soXC0ousEh4masbfSPGJ/tdeIeg32eBaLFm6N0RhwNoT5KHlPtK1GvyFncn4GRBr+8n1FANmoXEAp5rT7JZU/Lv6Cg7QODqEpaVR39q9lRBk1veVcOv6dS/eyLB394rlqa4OlRBlSKx/+Da+DLK0Z+g9DXwe3hERiJ4c7cypwv3pQYVDSl8InRnBMixMDjiRIEjJhVBzZsehn0fqclzW8NWpQDKb9c6r7+9sxcsfpieff7m91+HU3QkClo0vKB0Oe0A56T7Se2a86zwhe1CygzV1YcWXhG9idl/Juw9mvnV6IkNC9TWJpnuLKM8pok1pbx8/27SMj2RzKnoiL5jNVDmYn+H1Xs109eYC9VdAN5wb8LE752TesPNG7jGcumBOSMZDigAb2uICv8Px3Xfz4VnHpsx6crtNp7Ydj7h1oodNXtiu0ogpuy0v/Bhsey/NnWtBbXg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WhYj7bp0iqISgbAMFAuyPdscosWPhmMk/kBNIuADNESvY6LH7k+L3X1ZBVJV?=
 =?us-ascii?Q?RsUkLU89FADX9HUymq7szuBLJOUMEYhf/m1BvFXM5867of/vDCCIossNA1Hs?=
 =?us-ascii?Q?f+w4wCIA+wo/lrX96AU2P9l8+snztjPioSakoC6EHzT9YVueFyRa7zHHkBH4?=
 =?us-ascii?Q?usXs5oAInqEcbzHPVcOEdUkHRjePBrjJ3QUBqpAdqEC1vSQtgnHHE9Qysb7O?=
 =?us-ascii?Q?xpSaIc7qr9ayTloNwG6KPcorKHG3XlzPyEaRHLeICaiEjbigx7CVJ8QD4vgS?=
 =?us-ascii?Q?aIMvgCH7KN/17ze9XlaTSZ2C0Vo4ip7103zKTTALQ/AOLyWOGSgzjls2etEb?=
 =?us-ascii?Q?ljlx2Yz7xaw4XrHMy+pq29AaK0GTBOlDy6u/Io/MeWTUhCN2iQRKByq5i4VY?=
 =?us-ascii?Q?gHFzOLLH6RnY0J/tLeFUR/k1O0JvfkR5s7/sQ7N/2gc+i4Qk38xBlX+xMfuH?=
 =?us-ascii?Q?ISaODJA3JvWUICo4JO9onvljYV6lRWptRhc5t1to0DkW1JsOOBxTsl4FyaNZ?=
 =?us-ascii?Q?Z/gSPydvV6BeTkgDoWfweMEol4uM4zulLe8qS7016LabE44RgjOthOdOrVx7?=
 =?us-ascii?Q?gpRm/i6O1kmPW6pj5Zm7S4iWoRhLl8TY9Eeppcq8m4mS/WPE401nvemOke8h?=
 =?us-ascii?Q?yDLajWJWDr4nKBpydVQQceTz6mMeqIDyEh6iiJ7wjlxIhDYpmV+W7qIpQ149?=
 =?us-ascii?Q?iozm62SPr9ZLiP/B00Q90zHM5wo+Gu6ZvPFX4aGbKP1MHwValOitJD2ZPgzY?=
 =?us-ascii?Q?Q9O9gzVbxyQAewBri7Mn19oWWTjOPT3jPfYSi+XaRnxkOqFOOgAo0+hZWApn?=
 =?us-ascii?Q?e9jTLrMLr7lLYJSmmCaDpV11zwfd9EHY8+SWkGf3XBVLbVMwmLOtGG7zHTh7?=
 =?us-ascii?Q?VnMIjWMm3bIW/myO94IyXhp85ZFMF7x8OVWLDKqifueSFbH/S1qDSwvY1BC2?=
 =?us-ascii?Q?1o8tCGvDiCiT5K9ovOGeEvVDUlwYihrz3fBNho4dues/Bog6mZuKOMDRi+0h?=
 =?us-ascii?Q?nQAtRqdsN/cNSE5JWb3aPpMF2vM9q7KSDX75DYEr03AzSYRETFp24t8+ivge?=
 =?us-ascii?Q?Uaus1wI6hp80DDhCRLsrJyOIoTyZFf+LzvfBD9pQlhMO80Z2ebNQF+PWgGb+?=
 =?us-ascii?Q?ca57EjMq1ZrRnhCkDHOaQZZDRPQFUJ+5PbJkzsJqssBfc1c2Uzq5pGi7d9/C?=
 =?us-ascii?Q?j+KVExjTtHyp3Rqas5EkP7Xdq6Q+/z1JtDws8LM3lyDPncHYP2aAb2tEIMdv?=
 =?us-ascii?Q?7GNzoknQQ3Wuf85c9u2TCD/LDEAgoFhg92ejllkdM1KEJ3mwwZEmipsjv56V?=
 =?us-ascii?Q?yoY/JedwWXzxt0YdJcDk4td+twMzHtWmxe26wrq1MNFBV8OkIdntSY54BdPR?=
 =?us-ascii?Q?4zTENwxeM1Hw9daIlm2fwjXKDsenz7NFbbOxmGH5Ug2NI0FTxvoYgodGrQcJ?=
 =?us-ascii?Q?84YPFaT6VsR59nbL4Mo5dD8E0jr2mrRDugK2Erbu9er8zU6O5Yas/2ndcBzF?=
 =?us-ascii?Q?T8Qs/lxhIH19LwYRWwBg62B7S+R+FCYxCztL8f1kkZnoa7J405+tBGRO/8Ni?=
 =?us-ascii?Q?JWCWCNzYH1Zg+QOro37CbgRxfVDY6B4UzH082Jbk7HsTdEaMXXdr9WdsY7sj?=
 =?us-ascii?Q?YJLbF2IDoRCP4VDnxZqZ5dw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ceccc824-6510-4018-4226-08db9862c56b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:59.0193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PkCJXIdKLuyJFShzC2mhlYq8j3Qzp4k/BE0/F15DerPJujiJQp0GM0WY7mp2nnwbpmfDHGsZR5iO8sMwFBPd+q9py9vFsgI6yU8037bNfV46UQq3msWNQC/0u3aY2Dns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: UE4RI7EORW2IP6DVJ453V5VGWWYIKIAZ
X-Message-ID-Hash: UE4RI7EORW2IP6DVJ453V5VGWWYIKIAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UE4RI7EORW2IP6DVJ453V5VGWWYIKIAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_ac97.c    | 10 +++++-----
 sound/soc/tegra/tegra20_i2s.c     |  2 +-
 sound/soc/tegra/tegra20_spdif.c   |  2 +-
 sound/soc/tegra/tegra210_admaif.c | 12 ++++++------
 sound/soc/tegra/tegra30_i2s.c     |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 60e7df41c64c..e713feca25fa 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -203,10 +203,6 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
-	.trigger	= tegra20_ac97_trigger,
-};
-
 static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_ac97 *ac97 = snd_soc_dai_get_drvdata(dai);
@@ -217,9 +213,13 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
+	.probe		= tegra20_ac97_probe,
+	.trigger	= tegra20_ac97_trigger,
+};
+
 static struct snd_soc_dai_driver tegra20_ac97_dai = {
 	.name = "tegra-ac97-pcm",
-	.probe = tegra20_ac97_probe,
 	.playback = {
 		.stream_name = "PCM Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d38b58305c6b..f11618e8f13e 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -310,6 +310,7 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
+	.probe		= tegra20_i2s_probe,
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
@@ -317,7 +318,6 @@ static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
-	.probe = tegra20_i2s_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index d034803695a0..b0670aa4d967 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -241,6 +241,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
+	.probe = tegra20_spdif_probe,
 	.hw_params = tegra20_spdif_hw_params,
 	.trigger = tegra20_spdif_trigger,
 	.startup = tegra20_spdif_startup,
@@ -248,7 +249,6 @@ static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
 	.name = "tegra20-spdif",
-	.probe = tegra20_spdif_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 6868508585a0..9f9334e48049 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -419,11 +419,6 @@ static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
 	}
 }
 
-static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
-	.hw_params	= tegra_admaif_hw_params,
-	.trigger	= tegra_admaif_trigger,
-};
-
 static int tegra210_admaif_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -550,10 +545,15 @@ static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
+	.probe		= tegra_admaif_dai_probe,
+	.hw_params	= tegra_admaif_hw_params,
+	.trigger	= tegra_admaif_trigger,
+};
+
 #define DAI(dai_name)					\
 	{							\
 		.name = dai_name,				\
-		.probe = tegra_admaif_dai_probe,		\
 		.playback = {					\
 			.stream_name = dai_name " Playback",	\
 			.channels_min = 1,			\
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 644280603095..81eaece51130 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -304,6 +304,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
+	.probe		= tegra30_i2s_probe,
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
@@ -311,7 +312,6 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-	.probe = tegra30_i2s_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
-- 
2.25.1

