Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91126821D3
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C27C857;
	Tue, 31 Jan 2023 03:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C27C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130634;
	bh=hYqZDX4g7+L1fKSO3sQEEy+epWCS+JZkmubkf8RXX5c=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=khlQrmY7nCtuzq2B2MKkMsTgfos+q3ZDuLTp5NIodmBoed08ubdylJbN27nrmilCy
	 VsrNLB9KtpgydAI2SoYr1tJa/X/OO/DEd+r1F5LLJamGbOyQG+ugBvs5xwHhC8aGUr
	 7wFxz7VQQOU422dv5XUPRUfiXxQICbgZw8cj5d6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B22B9F805AF;
	Tue, 31 Jan 2023 03:01:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD08F805AD; Tue, 31 Jan 2023 03:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B889AF805AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B889AF805AA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CMyNDX/F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOIysz59r1AqNMYrpVhwf3mKQKRgxBnvFjfGQMQNRaVMuSMJsvwWwWIiI6ZueKvYIASvyb3Smke8bVTPdCo3GvyUFNV4pYhHSjRIfK9WV/rGVcbfTe0Ch10gPg7goj7oBMJ7ZOMLmub6BQnT4+FszX7fZF/HHNjVMgeJQ1vm7rUny81IEhB37LDFhxiCww4APWPoeXVWmoAKVupLUAfKIM+VmpZ4zrhQa8IeN75vScd0ZeRCteqZbC6Ce83V+fWK+AExJQXS5QYXAuGIvokBVyRtsxr6OMxpiqV0Y7tj3AhaqqNTpRP4pme0/9IOMUn8qeKrK4BU8QsfTdiA5TVw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N1WfMuE953yiF6f0iUfU38/HT2yYEaSsIaO2U0pbG4=;
 b=mzNqA1o87IbGQ3FCHduXr6ax4TvCLf1TtwMiKFOLZWyRslZ8L/jOLll9zb6/CdwNV+pI8mOw9WDSp8B2NVIjxbXnTbsdfTFoq78GjPYcpIQXqlgYTuqkrVqfuxMkEBPcpYa9IQen4kYlLfFapkyHnTHvnlb3LpDLAPm6+SaXb/C+Hvs4YGt9ZeVtjUuV6iTD8gWVS/hdFq//yXXP8vqRssFi4PZEWALiSnHssNka3TJ2YXcKI0lFIkh7vbVml1OnBUQBjmeQou6knuIIkJKUHNaK28BYx0Camda1kFOBzziwd/6airrr8ih3bszP73ACZlj2Bzma45mWAQfsM6qreQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N1WfMuE953yiF6f0iUfU38/HT2yYEaSsIaO2U0pbG4=;
 b=CMyNDX/FSs1WVVCp4oUD4qibiXkoKcN0PzqZlMhVA5qioTfUx5JPWRi0FGbXwiiFFWQcnVqm0YOenOXwIb3Yzq4jIHoqhm2KwXIYS39NdQRmdXQ8yn9eDEKZqXaXJdqRfx1+v0tYGyJOOE9kojkYrA/MtqsTd2mesbp/Bfjibno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11355.jpnprd01.prod.outlook.com (2603:1096:400:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:00:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:49 +0000
Message-ID: <87sffrea3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 14/25] ASoC: mediatek: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:49 +0000
X-ClientProxiedBy: TY2PR0101CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11355:EE_
X-MS-Office365-Filtering-Correlation-Id: aa32404c-099a-4e19-5193-08db032ef9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9xHm9M4ipBs+T010U/TCm8dd1V+/hb83cxtfwaXPlo9audSspxzHKxJ8/Zmy3O9O8CrE77wpjxYUWIffHgBRaVLJ9DvhpRYAaRdoZe9ubZK1Ob4ULs24sRgByqJKt6j/dOVe0CdaWAif9xXfU2xg3xmnBCgnojucYIe7ZKU0M8Z4SUAHYas2djOsxsZrBAqFUAkAEIZpVsp0a8vqEN5sluIV2sqlTXS4MxEJ1Ne5A+/Zv3Ku9r0ah75d5Z6bv8pqKqHqLwUf9nspHLLI/V566zxeET47YuZcg32nIpo2b5PBIG6XdB4RH7/eueUPE/Y3kYS//qRJ4PXElpV0Nfb3DAZXLKYbtJBDAdaRLDD/cJ37ws1tAVk2gijBQd0wEKDOZd5wdphrFsjs6pbQX7ofpNsHAzFH165cz54S2sDyjET23AGVN8YWezpcGtlUShf+jhVXa9DKGo0WUB28qISxAlMvl1VPDCF6pBLcZC/WBiprb8eGWJKxm24c0uE2pbX6s9OWfFN0ybO3boReQ+6Lj5/5sBmWKcZNzeyNUpnIFTWD/AU4o5dK4PG49pcectPQhX44pnH6jZwj/nnnY+MeHb4sBDiDg0ctzT+oBua/0oK7M/Ja+1tqB34ON6u0Cqo+ZmRhT3cxHIhJeUsiOHbDlDj5edPukmnZV9G9bRAqzmlZqXIdHfjnqbmnqqOmkQdSW9PwBhw8t/Po9NgXiNihkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199018)(5660300002)(36756003)(86362001)(2906002)(38350700002)(38100700002)(2616005)(52116002)(6486002)(6512007)(186003)(26005)(6506007)(478600001)(83380400001)(316002)(66946007)(4326008)(6916009)(8676002)(66476007)(66556008)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQ6MLu2J5OoN0iTmwBgIPNHN6Ed9BlhC3EqmKoGlZMWl1jif5ugUBqevwivt?=
 =?us-ascii?Q?goPsR3Dd6q0j9/5fECVfvV3Oco+ASzsfmyMAWOkjoq1oIZysPXOb8jM3EAWC?=
 =?us-ascii?Q?eTpSArVcZ26ZRXWbzRWtyDXNOgIvASaEEPgEHiAtNCgvPzzviBx8vbqT6ZTS?=
 =?us-ascii?Q?cqvH8TNWXDn+R93gCHee2ZVviMQ+jSwZ18jCF5yfORcnwQR/MtOgwYQRE6BN?=
 =?us-ascii?Q?2ySQP+F7J82wz2w27pNWqdoOJVHrKf9TWNhQBNHjQesfXPUfjcIbGZdYI4na?=
 =?us-ascii?Q?XIiDbbltW8vyojMzPsCyk9n1uVgtmWDVJ1fuopyWWmg550mJKZIRNbknTPPL?=
 =?us-ascii?Q?BW6eylt7bMjGUfKXCtomd5dbp+DeGLpLSDHZCbDYdXUG3347pC1/gUGqNhsl?=
 =?us-ascii?Q?kN5YBsI9+EyLtaE+PQZBkiZJKwckMMml5+OjGOpto054jwfUwMUU2DdNoD5V?=
 =?us-ascii?Q?14WhNc80JvNIvWEIcCtE56JLObhpfaTml28YxF8ANl82unHSTtNNktwEGbhT?=
 =?us-ascii?Q?733yzpM1lYgl6/4RDRfcmFVu7TahVUvcWkWo6Hgk8WeNDdN3zGBspgwkuRzX?=
 =?us-ascii?Q?6ZHqC3S7Ow6KlJp19PZcCBY0Rz10lpT1vHQPJFchj7tQ2Mt2GqxCgMgILKiI?=
 =?us-ascii?Q?nY9yHDENhsTE0bAp6CFvS4FNuhYe2NPTUMKEMNZsuubAll1WDRYeNkupPqyd?=
 =?us-ascii?Q?4Al26YRxqI1v+td7dYXTJBL5z2v4XdZJ+nOW/nGTeGNWgk79C9/L2apOh+Dy?=
 =?us-ascii?Q?z5hjWYxbXa+vKo9qqTWFc3F+l6z7EXwIWRHp59JiQJcJMA5i+C06CmrF4ejx?=
 =?us-ascii?Q?1pHqaavCPfw351YvEAtLmOysaBsjy5gG97KmcDREtTachkR/ZItsRp1b+c8D?=
 =?us-ascii?Q?EUKcQvDz6kQuCDAc2SSw6Cc9i2d9FwFh9PyiCNqaiCPE1b0+igsLNmwaSvgZ?=
 =?us-ascii?Q?OqillrOe64s5XXKKkOOxn6WN6zQktIND6uxuOBPn/Ky2GpuMv8XsaL0ISBEf?=
 =?us-ascii?Q?wlLt52H1ByWp77OBSidgC7GZbE0EuZT+8vzOJMRfqkJoZv7WMruvOR6U43CQ?=
 =?us-ascii?Q?FCdfZxpBteHLPk47Ww8JpLBd27zIhXs0wc94UBBhXH4YrHGffcyV5WbfnkUl?=
 =?us-ascii?Q?c24yCUjQJ1JP6NVpseZrUp+FNGahNa0KwE5b8E1Eztx4Mjqo8C+ZDmR4Yyya?=
 =?us-ascii?Q?vLxpoOH/ECUlwhghJhUptrT2CgLtCUh5SuSdhcpEesXVvYinLBQCTW6AD4BD?=
 =?us-ascii?Q?qrMcDuetQBixmfoZnMc1ePBQlMc3I94J7vDoUiefxszPCgXAzQX+rIq+JgZ0?=
 =?us-ascii?Q?K7y67tFoNqlHIXpZ/xjuu8DT0djeJDdpH5NOUmgDMOjsCurKCBJowCMVhU46?=
 =?us-ascii?Q?bvLeeqyo2LCuYm/ysYyMJG3lgtfg/H5iOAmZUOnFdtVYO2vwnZc170GJig+F?=
 =?us-ascii?Q?0uToOxoTDlse9oRpbaB56brXljQC3k33ZZ4IUh90KIHvCzd/+rZkKuQqEHgy?=
 =?us-ascii?Q?iQ6RJ8cugHAUxXC6uxQi9Y3gctT3eZ/+Pk+JhCtut6TWxVVCEDp81QYtcgC2?=
 =?us-ascii?Q?2itUGijPTJbbJXi/mHdfgcmxvKy2BNKNS9BJk03c0Ptvd3k6y3cbCIE47qnb?=
 =?us-ascii?Q?fbkS66sFuZm9xrjjOOwOa4k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa32404c-099a-4e19-5193-08db032ef9a9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:49.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPv5eugyp4Pp9tVjsisS8R7CnY3TdXE03ibaMlXFh2vzwCGFmEYW7ni7ZbQwut7cDEPYA0TEXgONmQIywzvWt/fCej4R0zgKdKU9cm4saWhNiDOL0+o66T14L2ED4ctv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11355
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 18 +++++++-----------
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c     |  8 +++++---
 sound/soc/mediatek/mt8183/mt8183-dai-pcm.c     |  7 ++++---
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c     |  7 ++++---
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c     |  3 ++-
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c     |  8 +++++---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c     |  7 +++++--
 7 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 8b1b623207be..6fef16306f74 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -32,7 +32,7 @@ int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 				continue;
 
 			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
-				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
+				if (snd_soc_dai_stream_active(cpu_dai, conn->stream_dir) > 0) {
 					sof_dai_link = runtime->dai_link;
 					break;
 				}
@@ -111,21 +111,17 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
 				struct snd_soc_dapm_route route;
 				struct snd_soc_dapm_path *p = NULL;
-				struct snd_soc_dapm_widget *play_widget =
-					cpu_dai->playback_widget;
-				struct snd_soc_dapm_widget *cap_widget =
-					cpu_dai->capture_widget;
+				struct snd_soc_dapm_widget *widget = snd_soc_dai_get_widget(cpu_dai, conn->stream_dir);
+
 				memset(&route, 0, sizeof(route));
-				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
-				    cap_widget) {
-					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
+				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE && widget) {
+					snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 						route.source = conn->sof_dma;
 						route.sink = p->sink->name;
 						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
 					}
-				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
-						play_widget) {
-					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
+				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK && widget) {
+					snd_soc_dapm_widget_for_each_source_path(widget, p) {
 						route.source = p->source->name;
 						route.sink = conn->sof_dma;
 						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
diff --git a/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c b/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
index 51f736f319e4..8a309b0734f7 100644
--- a/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
@@ -183,6 +183,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -193,10 +195,10 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		substream->stream,
 		rate,
 		rate_reg,
-		dai->playback_widget->active,
-		dai->capture_widget->active);
+		p->active,
+		c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c b/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
index 38ce0e36cdb4..4e25287fc0e4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
@@ -183,6 +183,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt8183_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -193,10 +195,9 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		substream->stream,
 		rate,
 		rate_reg,
-		dai->playback_widget->active,
-		dai->capture_widget->active);
+		p->active, c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
index 41221a66111c..a50aa294960b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
@@ -218,6 +218,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	int pcm_id = dai->id;
 	struct mtk_afe_pcm_priv *pcm_priv = afe_priv->dai_priv[pcm_id];
 	unsigned int rate = params_rate(params);
@@ -230,12 +232,11 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int pcm_con = 0;
 
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
-		__func__, dai->id, substream->stream, dai->playback_widget->active,
-		dai->capture_widget->active);
+		__func__, dai->id, substream->stream, p->active, c->active);
 	dev_dbg(afe->dev, "%s(), rate %d, rate_reg %d, data_width %d, wlen_width %d\n",
 		__func__, rate, rate_reg, data_width, wlen_width);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
index 3f1696dcf81c..5bc854a8f3df 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -227,7 +227,8 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (snd_soc_dai_get_widget_playback(dai)->active ||
+	    snd_soc_dai_get_widget_capture(dai)->active)
 		return 0;
 
 	return mtk_dai_pcm_configure(substream, dai);
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
index 239e3f5b53d3..2847a2e747be 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
@@ -273,6 +273,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt8192_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -283,10 +285,10 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		 substream->stream,
 		 rate,
 		 rate_reg,
-		 dai->playback_widget->active,
-		 dai->capture_widget->active);
+		 p->active,
+		 c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index caceb0deb467..051433689ff5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -213,11 +213,14 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
+
 	dev_dbg(dai->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
 		__func__, dai->id, substream->stream,
-		dai->playback_widget->active, dai->capture_widget->active);
+		p->active, c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	return mtk_dai_pcm_configure(substream, dai);
-- 
2.25.1

