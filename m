Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714C774ECA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A064C1E4;
	Wed,  9 Aug 2023 00:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A064C1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535530;
	bh=iPfESJ+H8QhvwOWznxTmXHh5IaLheE17tVejepPF1T4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yt5u7+jucBYvNMykr6Sb52fiZU4XmUyFJitMKHCzW92A79VqGhIlxR82S6mhBAUzm
	 TgcOZJuSZcjxGKHn2aZTr4x1+figTqgiBDFDOwycQ+Fe/H68QjMVaFWq5azcXxMJDA
	 F9bRHL3CQ0URTa4sKNdoN/PLqkk+Fyo8eLRdjeDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EE60F80564; Wed,  9 Aug 2023 00:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 599E5F805D5;
	Wed,  9 Aug 2023 00:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E060DF805E7; Wed,  9 Aug 2023 00:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37B69F80564
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B69F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dQZRk9l7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icq25qPLfAjnZ52ofDg9fLOMozMlVBlAKrjQD/O0eWAs6X+vrf3YVW+5s9SYVIrPLbGxz4wZVkqDtogG6qisJFUAuOuQAB+Tq22H/HVfs3GSMl6Nk3lsK6puSDG4uOdXOxSgXiaNvlCNngvKqEXSGjlz/iBBWZZqdXC+4xrlzks7ooDdmASWreI9MbHF9cWIPwVV8Tog8QvcnD7L4Q0g5DiV/BSwUVfkeEtenI09LTBhwgdNcaGi+72lyjAJwKb94jQy3ui9Y7Na5BWds1RJSzJKCAJO2RVnm85lOQucH0LVIM/CJfcTi+z+va3JMAzI+rN9emgKwd9zxciLMUoAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIpirIoWU5KMo3+vn6jBMOS8KvZoxLDqfz7Fa8Z0B4U=;
 b=n85Wm3TPDsjYFEPQvDDBIFtb4NFZ1LkMCdKX/CS8ljRk83GpZoNW18xbKHXXkrF0Aqj/Wb8x2h0fNh2IG0q0ZSYuTxy5Dp5NXTvfYrLwDl+0EROwTmiQ1alBaJlhoKipotEGmCfExdMSe7kMIhYbO8G4iEBXFyDfHVwfi+t/FleDwywloz/bP9AgkO0OyEp5LRQRZnAgEk/baHxObKyEXAWa952vY4DFqvTNVFu5nMUWeV+s0XAbFcW+wqA016T3VtUXp+dEzIUOK9qPX683jNGU4k0rt1iduuthQnlYMHqOAbDTedD5pw3quDASuu15N3pYWyy8GKMB37HyIkakug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIpirIoWU5KMo3+vn6jBMOS8KvZoxLDqfz7Fa8Z0B4U=;
 b=dQZRk9l7cuihyqt6Wq5aaQm1O2869pAuKKUvaYvM5WL1P5+9PpzXBkQZs4G82wRRdZydg4MNFSLLNfbumv+AUeQRHSr7ry6HEf+U4+AOxdDfyXNWfwz6L4uGgOspGV2V+EBuMPE428sUxnpMe2y2jgrjg87JtujvxjpqrEmxrXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:00 +0000
Message-ID: <87il9pb0u8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/39] ASoC: img: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:59 +0000
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 61afdfdb-d2e8-4367-9763-08db9862a225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bjp74NuYp9dJrUdTMaKCFw2f2vlV8lB0KYN8RJeS2T53cG32rCfrKMGew20SnQHtqQSoUUe35hOpRTYgvGJSsGgzMiJm9/xWJhIHEwsSL8b37fn9S3MdlBE2Di2Fl67J1s1sm8bxzDuFZcCaezZEfCid9YrogHMhoRF0Ii6mjDR+cyjHmO+5dvUBAojrrT7xib+/ufEI2qhXo9YNZPS9cjaIhSs5AG1r0Qo98YU2C2yGsi6xW4gr3XZ8ZEvHaVItRg39oj3nOoDHcm1OLZyPIVHxAaGwEa7K21qzPeFKrOyA96/iMG3WPx1lZPi8czTSLCxOyLIw4xSJAlWa71T93FfkRpneUOsZZ8eRk54fiXXuYdrtKFvEJwkOnh4YvO5EFiQuE1geIHaT9+AGJ1JoAGOjAs2VhSoRRoEkdA1slz7VJo01hkE7gpJTo/zR0c9g5tuEEywu690zVl5fg+1cty7pACZ6y98q++8jiYCg1BUNFw3w67J0Tg87Ae5kfLzQ+/QcK6t6ZmuaY8DdCTBauglGzqi61fGH8JTLn/TF7qvRB1NVD8+R5G2mXgNdlIbr5b4Y8f4N7xyt/czL/jgtfCXJaewq08yv6uV5JFnZ+8cvEF9Nn/20QiQS+lujtSjY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j1XXRJ73fFa8rr8B3SqDcaRTT62CTcE8YSy3z+AX6q9Autuv07hwVOyCmsD+?=
 =?us-ascii?Q?N50nlc4hdGOazKfVXCCTcNnisDLcoQx2PEPMqty9JT+ZY6Rgu9sp1mn1qWLf?=
 =?us-ascii?Q?zFZHa4HBGHbiwGvApaQTtScEx6j0zpZ5oXVXQwV+YfZxio/4eJqGe10ya2Ac?=
 =?us-ascii?Q?2ncVvxGrEl7biKGS7kumisPTyLUI/yuRUQ+w2IaqoYefnT5gtmV2g8AKE6Av?=
 =?us-ascii?Q?Fqyh302Xg80Nj5fRu7p2KjECrEtck6JdAh/M6m4d75it0BwduBGLgq+BGJAJ?=
 =?us-ascii?Q?Og+fiHVMGAm+wuWoz9Mp7D3jv4/JadrIrCeg3nRVRR83Y6x8f/1e0apLNXls?=
 =?us-ascii?Q?+07Y7VvbiL1cJcI5Kiart0AlTpIy3B4n1nu+eAhv+9vrpaqlo9mfOhVdkOH4?=
 =?us-ascii?Q?ajo8LXHP3s5FMs7Wi+DF7VCgHMTJKoak6VT2RQURhJ8p3QMR2jVTLB05ZmbW?=
 =?us-ascii?Q?D3i6RVq4V1VCokqsUU03cj2QC5gsaoIJOtKfMPE++ZayehPsdLMoNbwUsuT8?=
 =?us-ascii?Q?XuWLQYxNsj9CYEGjmvLHmYg0qEWXmnQxRQs9IRps8PoKNq0MAGWg3z5x02Vt?=
 =?us-ascii?Q?6HIrJLR1fP9MuHpmIvlwIPe/Xh1CpMjEfEP8TFage35UX4e3NiUl0STdgYS7?=
 =?us-ascii?Q?0l743QbkTahMsd9m+Yw42a2KCWgCTFdFjx9J7nEJ1UVOiXEkz5kdsOGBg0Gg?=
 =?us-ascii?Q?pehOU2yCA9dAm7rAz7e2/molsR4PVepGheRyZfeQUsQqs5eJ6ce7xTKog+M4?=
 =?us-ascii?Q?LxXxQWBIiNUCK+qeaM3bsKfVqm4ps6RxA3OyjHUbWZk4qaQdYSQPUcFdiyJK?=
 =?us-ascii?Q?Wa0rfRy27SqfUaAxyl+X0nCSncLtPE+5yqdUyGpl22/XLO2fLMqAaXoW+Mdr?=
 =?us-ascii?Q?HeoKkJatkxN60GkLBgLAkJCxIQvLXhTLv3gwlfixmOCQxKCTJOwH6bW+J6aT?=
 =?us-ascii?Q?Qu0jGwjwSfI0sXErv7TK6h3gvVIwB9fqgP2Crr/Mn180alg/SOywgBRO+3do?=
 =?us-ascii?Q?2kseV8LgOEoxBRoyzuRBpEv7bzNn76RC7SaiLB+gVH/h86RAqkJlKtMzOGhY?=
 =?us-ascii?Q?O3dSbys7++kLYfk7d37kDswE2i/vACGKX6dfhqrmNCA7M2r2NM2z5eKcP82R?=
 =?us-ascii?Q?nKtL264LtGbVFBIvYFbpsFQPafz/01Tovwh41qw4QzPiGy/3GxmJacdWm9IP?=
 =?us-ascii?Q?H0qEnn0IAM9/V6OzRvm+pQC51dNjGLIb207j49WUlGZoSlfjLmzbIVL/U0B0?=
 =?us-ascii?Q?TreXUd+WyDTGdlMaemn0tPYzxGv6rZ3WpGtfo7B9dU7OxmymgSmBfnacSGsV?=
 =?us-ascii?Q?+Cxp4kvznqfbG7jNmDZxyEcbWSjeJG/JvIXM8OsPmf6j4C2P7ail5Ekqr16+?=
 =?us-ascii?Q?dk29rhUfhLAmpWvmbH+r8RePl/dZTrJUXkeEI07izYq4k7wnFzv0P4taCsCj?=
 =?us-ascii?Q?a/omP2P67a2VgGdHTkkQ4klwZoWOpeM5eiLMn+900GOGRdZHhmLVjy++ui5P?=
 =?us-ascii?Q?v4Xz273M9kz4E8WtVoRlce4SW5h+YrS2vLBHPNkKjmE/BTSPbLkR14CEfRJo?=
 =?us-ascii?Q?fVb7e3YE05inVL2WW86fqWxL0DG9YKOYGWyR3TWJrRZM9te1521Cx8notW9U?=
 =?us-ascii?Q?1rj3Vuk4m2LZ0Cu9JoUiW20=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61afdfdb-d2e8-4367-9763-08db9862a225
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:00.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /pjamttjiuZmdKiLaAYcl0OEq+4jxFhoOQ0I4dwnoE+j7FYmkEW1WDsIQQN4qWbjsK2QGz143UkaKKSWYun8GiK5331HiORjK1NFvF9WzPbX02eyhFCtNzhgUKioWsuD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: HYLYWFYN6DQJWDDOA2FRATAJ6K4CZBLA
X-Message-ID-Hash: HYLYWFYN6DQJWDDOA2FRATAJ6K4CZBLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYLYWFYN6DQJWDDOA2FRATAJ6K4CZBLA/>
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
 sound/soc/img/img-i2s-in.c       | 14 +++++++-------
 sound/soc/img/img-i2s-out.c      | 14 +++++++-------
 sound/soc/img/img-parallel-out.c | 14 +++++++-------
 sound/soc/img/img-spdif-in.c     | 12 ++++++------
 sound/soc/img/img-spdif-out.c    | 12 ++++++------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index b7ab8467b5cf..b6b6339c164b 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -370,12 +370,6 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
-	.trigger = img_i2s_in_trigger,
-	.hw_params = img_i2s_in_hw_params,
-	.set_fmt = img_i2s_in_set_fmt
-};
-
 static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_i2s_in *i2s = snd_soc_dai_get_drvdata(dai);
@@ -385,6 +379,13 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
+	.probe		= img_i2s_in_dai_probe,
+	.trigger	= img_i2s_in_trigger,
+	.hw_params	= img_i2s_in_hw_params,
+	.set_fmt	= img_i2s_in_set_fmt
+};
+
 static const struct snd_soc_component_driver img_i2s_in_component = {
 	.name = "img-i2s-in",
 	.legacy_dai_naming = 1,
@@ -468,7 +469,6 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	i2s->dma_data.addr = res->start + IMG_I2S_IN_RX_FIFO;
 	i2s->dma_data.addr_width = 4;
 
-	i2s->dai_driver.probe = img_i2s_in_dai_probe;
 	i2s->dai_driver.capture.channels_min = 2;
 	i2s->dai_driver.capture.channels_max = i2s->max_i2s_chan * 2;
 	i2s->dai_driver.capture.rates = SNDRV_PCM_RATE_8000_192000;
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index fe95ddfb8407..41ea5ba52181 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -376,12 +376,6 @@ static int img_i2s_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
-	.trigger = img_i2s_out_trigger,
-	.hw_params = img_i2s_out_hw_params,
-	.set_fmt = img_i2s_out_set_fmt
-};
-
 static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_i2s_out *i2s = snd_soc_dai_get_drvdata(dai);
@@ -391,6 +385,13 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
+	.probe		= img_i2s_out_dai_probe,
+	.trigger	= img_i2s_out_trigger,
+	.hw_params	= img_i2s_out_hw_params,
+	.set_fmt	= img_i2s_out_set_fmt
+};
+
 static const struct snd_soc_component_driver img_i2s_out_component = {
 	.name = "img-i2s-out",
 	.legacy_dai_naming = 1,
@@ -504,7 +505,6 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	i2s->dma_data.addr_width = 4;
 	i2s->dma_data.maxburst = 4;
 
-	i2s->dai_driver.probe = img_i2s_out_dai_probe;
 	i2s->dai_driver.playback.channels_min = 2;
 	i2s->dai_driver.playback.channels_max = i2s->max_i2s_chan * 2;
 	i2s->dai_driver.playback.rates = SNDRV_PCM_RATE_8000_192000;
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index df1291ee2b3b..815e68a7048c 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -174,12 +174,6 @@ static int img_prl_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
-	.trigger = img_prl_out_trigger,
-	.hw_params = img_prl_out_hw_params,
-	.set_fmt = img_prl_out_set_fmt
-};
-
 static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_prl_out *prl = snd_soc_dai_get_drvdata(dai);
@@ -189,8 +183,14 @@ static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
+	.probe		= img_prl_out_dai_probe,
+	.trigger	= img_prl_out_trigger,
+	.hw_params	= img_prl_out_hw_params,
+	.set_fmt	= img_prl_out_set_fmt
+};
+
 static struct snd_soc_dai_driver img_prl_out_dai = {
-	.probe = img_prl_out_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 558062a1804a..9646e9d3f0bc 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -682,11 +682,6 @@ static int img_spdif_in_hw_params(struct snd_pcm_substream *substream,
 	return img_spdif_in_do_clkgen_single(spdif, rate);
 }
 
-static const struct snd_soc_dai_ops img_spdif_in_dai_ops = {
-	.trigger = img_spdif_in_trigger,
-	.hw_params = img_spdif_in_hw_params
-};
-
 static int img_spdif_in_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(dai);
@@ -699,8 +694,13 @@ static int img_spdif_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_spdif_in_dai_ops = {
+	.probe		= img_spdif_in_dai_probe,
+	.trigger	= img_spdif_in_trigger,
+	.hw_params	= img_spdif_in_hw_params
+};
+
 static struct snd_soc_dai_driver img_spdif_in_dai = {
-	.probe = img_spdif_in_dai_probe,
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index b13e128e50d6..dfa72afa946e 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -287,11 +287,6 @@ static int img_spdif_out_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_spdif_out_dai_ops = {
-	.trigger = img_spdif_out_trigger,
-	.hw_params = img_spdif_out_hw_params
-};
-
 static int img_spdif_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_spdif_out *spdif = snd_soc_dai_get_drvdata(dai);
@@ -304,8 +299,13 @@ static int img_spdif_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_spdif_out_dai_ops = {
+	.probe		= img_spdif_out_dai_probe,
+	.trigger	= img_spdif_out_trigger,
+	.hw_params	= img_spdif_out_hw_params
+};
+
 static struct snd_soc_dai_driver img_spdif_out_dai = {
-	.probe = img_spdif_out_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

