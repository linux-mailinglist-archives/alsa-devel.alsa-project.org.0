Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E5678E14
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 625FDE96;
	Tue, 24 Jan 2023 03:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 625FDE96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526452;
	bh=Ei6/sxm2y7WzrDWSDRD/NVqrvqLpCMMsCv1YcDzL2Hs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OHsnRyZL1HoZhAGTisqXq2j/3518D5/EaIaogC/8Bh6GX0hbttT9Rct6o6DSaupRG
	 vJX0FFKIuN950CszW1a4675BGuNH0Q9NcVoG+1QUMWSyfG61spMuxhlICXiCnPwoeq
	 79u4qEtCojkAXGm23mbtWWQNGQQBTJz9qOaf/780=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1667EF801D5;
	Tue, 24 Jan 2023 03:13:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A2FF803DC; Tue, 24 Jan 2023 03:13:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA18BF8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA18BF8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZCNjedEn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D62z9bekzSviaQdcgUtt0Cje0ToC8p9pHlguBXArhhFdT6n6FtOVpE8hk1TF5BIgDEDXOEEI2ltrz2O0mS/4Lx8GOxDOBGBHNCw3MJ5lW+l/wrxW4hHaBe7Lgf6xSt2vOK8COYo1fixDZYxncmbl2X1SVbr/C/TrhJ9rw2ADfEMM/I1SbfECNhnOYgTGJ/uQ+e1tvLW0nmPz6WkmWrCnhaeCnRNpH6m2a9lBIqE4TRUEx/aWeepJ7gVD98Kgm3knmIuQzSX0mnSr1o3vHJWAT5PoQIBR4vhm1NIEJMXML+EvLsLu3XxQ+OpRiMTaFz89xMpN1bdsyDzkoo2oh9eVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abCmlxjTeJUpbD23/u/q8Igmh45AfePycqqbck2s2Hg=;
 b=DR0XWnuA8FwWW1P+SBacc1u3wafkJA5xsxTpf6zmEA61WdtejupRt9oDU45U0UwHG+4E8Q1CA0IRo2Di2VB7GJUy5N+Tp8TVzpEajYx9VQGZo3TgV8VPREnhklGwA1glCiqSgfmNQdAzKaE03nX1p6UlvlVuCyAnYQwbf8gneam70MIh8qkt1YIpSzT5ARykO5MCOF0z62XFWWiPkyaKcZPtip/t6x9qYJwNE4+1+SMJx2N/1bIyXcqHjQtzNpHma4pdxGSNLhHoZhDSkF3jHEPKPcRuh0fS3JUNpewbvEH+3o+SUvxqAtQJSueElYowYaL/hHEj5PDh2nw8bJzSUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abCmlxjTeJUpbD23/u/q8Igmh45AfePycqqbck2s2Hg=;
 b=ZCNjedEnSbzMMEh13lFy1uMLM22N/PzxNRfT0R7DE9zFi0dwndu3CdscNoDhImGh1xDeSL7Was28GxoBOu7dMeyS5ezboiGIc6X6du0NwZsAya5F/hhMCyJMOkwwryEUUWk3letakSRv1tkZVEHkY4CfAzGUEIvv4+pXg35EFWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11127.jpnprd01.prod.outlook.com (2603:1096:400:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:13:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:13:13 +0000
Message-ID: <87cz74u1c7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 15/25] ASoC: meson: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:13:13 +0000
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11127:EE_
X-MS-Office365-Filtering-Correlation-Id: 4135f367-b573-448d-6c39-08dafdb08c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrMiyDvWpw9bMymVu9Jg0mvtvGZ3U3A96UOLnVvr0wEtsYZxNLc/S16TDMXU5U9ziZBjLpBr6AweEzDfT1+oSgjJFisUORSKVv5x4/JqedrhwgNfDyjGBxeBtwPqZKBlso+I8OPKlH59mqjHPrpAUQBqmrE41FER71Vp3N9c/BcQwfxZOIKawM4kMWL0KSywQs8/7EIY+IdsSZH+NLYjuogLhIEmMD0mX4ZOp17PX/mwfSB6HR+fx5zQMVLzVlGh7pwW9RC3cOHGwJiIEP9k8k9THJS0Yfi5beKL/7227A+Mabi18JzSN2YsPvB0SgBNDKPwxx/uxQW9aiHixHPlscR2vuHSTGrVLjzYDg8Xdsen+ne+QUE9H18/TrsCiDgk18wfMpb8oMunPpBQgMST2inJRb/dY+j2XfiZitOUL6jJ9RECx21SSCyTzVOTtCDwWPLAiikRsMLHhq0KHTTyp0H8t8bW5M/9aeF5DszgqvCD8dMPkr8dKn8t2nJOJLNHq2dGqfhbdKRljDAWxvcfoGSWtLgzYc+yjkVrVYRGnAtnwMu/xXP5F4YBKKM/zGsEsTOu+1LBrPZahxtXgHf2015y0C1rWip3yTi3J3tBZYtnRBvsnq/5Hv1k8+toAqjHCJ8MkNLmCAqHLNO8Jw3Uqa+NXC7vn5cL81dRw8APMANizs7KYaAqP4d4e56l6PUsHZ3oMOdIAxQbJCH93PJhBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(8676002)(54906003)(316002)(86362001)(2906002)(36756003)(4326008)(5660300002)(66476007)(66946007)(66556008)(6916009)(41300700001)(478600001)(6506007)(83380400001)(6486002)(8936002)(38350700002)(52116002)(6512007)(38100700002)(2616005)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q83T1PT9C2M7zEDMgL5NWlEMcnc1yCVTr6gVv8dzuTcQ/E/GIUDK7j9b3SX/?=
 =?us-ascii?Q?v33lqV6cCSFANEZAnhSqioRtH2w9a6yvMrp0t+sPsItFVNpvWFZYgv6/bzgQ?=
 =?us-ascii?Q?YfFzVLoNWfsGhBBxHktGogmYSoAi5ykt4y/A5T5bZ0N0WFLBaVrd8Fy+yWnH?=
 =?us-ascii?Q?mVCG/3/hIkYBNgsVHmSC/9ADVWqXRNUcWE1Vd9fe6Zt1omYX/SGY/hguzqgN?=
 =?us-ascii?Q?cFaWIxh+iXaTT1okrSTcAbN2BdqLTRQVbWfbDHSJ57Xf9X+/MLoIYrPxX4ye?=
 =?us-ascii?Q?DJ7MXsgn+r/Wcb/Icq+Qt/cTUvNhhBP78bAMS64QOXPQSoUondH1u08U4fV3?=
 =?us-ascii?Q?CaIYFUdYNB/12HvHFClv78rEdfNM74MNQrs6DyHfKLKCc6Qf994Ra3rQEhH3?=
 =?us-ascii?Q?RUQQoeqBmbNnIH83a8nR6jM/6nHv2flMOq+ojVzu9OsNUB181xrbGgSC0XvN?=
 =?us-ascii?Q?3ugcY6TmA2Q25qZk6sPQLgnB52Xwa9lK6aRmFe9X8wfjr2xBCCGeMpphhQSw?=
 =?us-ascii?Q?2RvRyudA0DNAFYxlm9xsUN5GNE22rDBHqA2Utd4G6uMhxPpLZKP/SeoBV9h7?=
 =?us-ascii?Q?DkF6agokvfHjdTWTGau9m471FTkFNRXyPNVrMQxjc17OEqYb080q0/GopcTT?=
 =?us-ascii?Q?nS2GlauVQ5ScHu+Cwae/98hrhkPpXSIBDAZKb8mz6+++E7ljzv7jKmRAHI5I?=
 =?us-ascii?Q?SLmrldGDom6qaTa+Zif+pXl/nwOg+xrUyXBQwGdP+XidTd0gA3n8tsEpD2KT?=
 =?us-ascii?Q?VXVkyZDwWG5NY7z3cmcRCJF0bKL3MWWiLaHRy0PC9JRBCY+B66IAz00fxb6q?=
 =?us-ascii?Q?q3yrqAfmk5PxT1tzNmRtPdGSo+ciWOBI93XVx7iFX0t+DaPnQfuMHZL6bsyP?=
 =?us-ascii?Q?GjtF7fMriGCVD8gPlJaoAHH+kST8+SGYbPV3oaBngYIbfY3lo+Gc1zgIxicW?=
 =?us-ascii?Q?hfieyYQOC6REHAt1+ygSi3mCalshyQciVe973vN4RSk9lNzA4hZcAFcdQEiy?=
 =?us-ascii?Q?ODkcBlgLkuIIP+Fu7fA51KRJ9BQ8KRzEFhDruywzUC+m/8wucCHZZc6P14ry?=
 =?us-ascii?Q?Nk3B+Tk3cCFeH7cvqG9nZ9UWCNVIl7TWlSzcHjJCnGQtNYysRuIftUq+wKY4?=
 =?us-ascii?Q?CodDV2eZe3CRllifErsGv56VI5UzHoH4/g8aMZZjrFWSdLm1wVSa+hmII2xX?=
 =?us-ascii?Q?xUuHE5Zvk+DXIlTXhAmCGCOCx5E+OubpHk9xoPzjnb/YnIlWNdaGH4bSxitw?=
 =?us-ascii?Q?1JJVUKAAu8YB+0Y0S+s6m/dBZjefDbxs0COq4jx/Z5LEO/45GKANa4UCgm2G?=
 =?us-ascii?Q?8oS//h9YUGH3kDf60J+pF5bvpLVemjPtm49aid2oE5GUIbtwKegJ56wlnTf2?=
 =?us-ascii?Q?/kFnN7c1DcGFpvJlIE8F865Wd3LaxSI1vf641QQ0bozXi3PMYmQhNbiIC8Hy?=
 =?us-ascii?Q?oU/ig+LpfWaaSet7c61uTDjogleSChdfx3fGMP0VRB2nH2keiJgnABwoi4sW?=
 =?us-ascii?Q?ndP3Jg5Nk4zdeH7+baPd/ysBktZ0s47eIwNyl3a4UMzIWu8eWXeVg3U1i4aS?=
 =?us-ascii?Q?ooFDl1tj/yB4UrLe2NqBqShmAScGWOTmQnKKj/JR6E/0ICy5tyJuDR8SU7Ml?=
 =?us-ascii?Q?0fHdHVNXAvuGOJ91XY9lhGU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4135f367-b573-448d-6c39-08dafdb08c3d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:13:13.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRPp7stQVQCpAox1uEk1R0dSvyLD2p13n+ZdBHUt/LGoXWWcIH6d12NmDCLiRlBalARefWk7rkIwKBBW6a/VMrVCO7070BGPrVMLNRl9Y1J5qCu6QNWSmzU/3lwa1jrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11127
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/aiu-fifo-i2s.c      |  4 ++--
 sound/soc/meson/aiu-fifo-spdif.c    |  2 +-
 sound/soc/meson/aiu-fifo.c          | 21 +++++++++---------
 sound/soc/meson/axg-tdm-interface.c | 34 +++++++++++++++--------------
 sound/soc/meson/axg-tdmin.c         |  2 +-
 sound/soc/meson/axg-tdmout.c        |  2 +-
 sound/soc/meson/meson-codec-glue.c  |  8 +++----
 7 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 57e6e7160d2f..59e00a74b5f8 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -88,7 +88,7 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int val;
 	int ret;
 
@@ -158,7 +158,7 @@ int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_i2s_pcm;
 	fifo->mem_offset = AIU_MEM_I2S_START;
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index 2fb30f89bf7a..ddbd2fc40185 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -173,7 +173,7 @@ int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_spdif_pcm;
 	fifo->mem_offset = AIU_MEM_IEC958_START;
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index d67ff4cdabd5..543d41856c12 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -34,7 +34,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = aiu_fifo_dai(substream);
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
 
@@ -46,7 +46,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 static void aiu_fifo_enable(struct snd_soc_dai *dai, bool enable)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int en_mask = (AIU_MEM_CONTROL_FILL_EN |
 				AIU_MEM_CONTROL_EMPTY_EN);
 
@@ -80,7 +80,7 @@ int aiu_fifo_prepare(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	snd_soc_component_update_bits(component,
 				      fifo->mem_offset + AIU_MEM_CONTROL,
@@ -98,7 +98,7 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	dma_addr_t end;
 
 	/* Setup the fifo boundaries */
@@ -132,7 +132,7 @@ static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
 int aiu_fifo_startup(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, fifo->pcm);
@@ -168,7 +168,7 @@ int aiu_fifo_startup(struct snd_pcm_substream *substream,
 void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	free_irq(fifo->irq, substream);
 	clk_disable_unprepare(fifo->pclk);
@@ -178,7 +178,7 @@ int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	size_t size = fifo->pcm->buffer_bytes_max;
 	int ret;
 
@@ -200,15 +200,16 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
 	if (!fifo)
 		return -ENOMEM;
 
-	dai->playback_dma_data = fifo;
+	snd_soc_dai_dma_data_set_playback(dai, fifo);
 
 	return 0;
 }
 
 int aiu_fifo_dai_remove(struct snd_soc_dai *dai)
 {
-	kfree(dai->playback_dma_data);
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
+
+	kfree(fifo);
 
 	return 0;
 }
-
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index c040c83637e0..7624aafe9009 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -37,10 +37,8 @@ int axg_tdm_set_tdm_slots(struct snd_soc_dai *dai, u32 *tx_mask,
 			  unsigned int slot_width)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
-	struct axg_tdm_stream *tx = (struct axg_tdm_stream *)
-		dai->playback_dma_data;
-	struct axg_tdm_stream *rx = (struct axg_tdm_stream *)
-		dai->capture_dma_data;
+	struct axg_tdm_stream *tx = snd_soc_dai_dma_data_get_playback(dai);
+	struct axg_tdm_stream *rx = snd_soc_dai_dma_data_get_capture(dai);
 	unsigned int tx_slots, rx_slots;
 	unsigned int fmt = 0;
 
@@ -362,11 +360,14 @@ static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 {
-	if (dai->capture_dma_data)
-		axg_tdm_stream_free(dai->capture_dma_data);
+	int stream;
 
-	if (dai->playback_dma_data)
-		axg_tdm_stream_free(dai->playback_dma_data);
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts = snd_soc_dai_dma_data_get(dai, stream);
+
+		if (ts)
+			axg_tdm_stream_free(ts);
+	}
 
 	return 0;
 }
@@ -374,19 +375,20 @@ static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	if (dai->capture_widget) {
-		dai->capture_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->capture_dma_data)
-			return -ENOMEM;
-	}
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts;
+
+		if (!snd_soc_dai_get_widget(dai, stream))
+			continue;
 
-	if (dai->playback_widget) {
-		dai->playback_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->playback_dma_data) {
+		ts = axg_tdm_stream_alloc(iface);
+		if (!ts) {
 			axg_tdm_iface_remove_dai(dai);
 			return -ENOMEM;
 		}
+		snd_soc_dai_dma_data_set(dai, stream, ts);
 	}
 
 	return 0;
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 49b613a1faf2..c8f6ea24ae78 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -83,7 +83,7 @@ axg_tdmin_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->capture_dma_data;
+	return snd_soc_dai_dma_data_get_capture(be);
 }
 
 static void axg_tdmin_enable(struct regmap *map)
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 22d519fc07b2..c4039e4f0847 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -81,7 +81,7 @@ axg_tdmout_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(be);
 }
 
 static void axg_tdmout_enable(struct regmap *map)
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 80c5ed196961..5913486c43ab 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -39,13 +39,13 @@ meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
 static void meson_codec_glue_input_set_data(struct snd_soc_dai *dai,
 					    struct meson_codec_glue_input *data)
 {
-	dai->playback_dma_data = data;
+	snd_soc_dai_dma_data_set_playback(dai, data);
 }
 
 struct meson_codec_glue_input *
 meson_codec_glue_input_get_data(struct snd_soc_dai *dai)
 {
-	return dai->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(dai);
 }
 EXPORT_SYMBOL_GPL(meson_codec_glue_input_get_data);
 
@@ -99,8 +99,8 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct meson_codec_glue_input *in_data =
-		meson_codec_glue_output_get_input_data(dai->capture_widget);
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget_capture(dai);
+	struct meson_codec_glue_input *in_data = meson_codec_glue_output_get_input_data(w);
 
 	if (!in_data)
 		return -ENODEV;
-- 
2.25.1

