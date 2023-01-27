Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53767E475
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:03:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D6CEC0;
	Fri, 27 Jan 2023 13:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D6CEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821002;
	bh=H3MuiZXEd2x/7QMkMjwGfQ6eGimV78IlHXWNjuFSlN0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TfduLLZJ4uvDf2GEpEX/9n+OeY7e8E078nR1NiRDbYrMvgRvsJC7gfulOn95Xs7El
	 eTCAqv7qX/ddZA4yefJ3Ekaocdetgn7+SH2OlDdHiI2PKPJRSh1lEhBJHXdFj9Uqfj
	 Ad9pJnUONnay7j3ZEU5W/M9VXvmyL1SpILqDF198=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D5CF8057B;
	Fri, 27 Jan 2023 13:01:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFA4F8055B; Fri, 27 Jan 2023 13:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA7AAF80544
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7AAF80544
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WYmr3OcI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820843; x=1706356843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3MuiZXEd2x/7QMkMjwGfQ6eGimV78IlHXWNjuFSlN0=;
 b=WYmr3OcIbuJbeut6OC1ETP149Ye4RYdxhtuBbUj41U8QguSa4qvVMcHn
 9Wp+16Xhcsr/Rs6rp498iysxYliMNx44Pi10C39XwkGzApf2tXHpxvmzF
 lWICawG7cd1Af6N5OeEmERkyMNJianmXaqls+WqkSellnLyyxnyyCSK8e
 CvkF0tG+IZbHnQHyAKHmfx3l1/YcUEABf/zKEfHm8hoYW228LeWfsz4qW
 TIW0H0aeOIAga8no/yhhp+OLnLUwfHjYuealvtDdsEwe9nUJ0TNT9x8tz
 HqgOJB7MvC9Cty7KjmzgAsdrrtGBu41lKFm5QGUe0xXLeI+LWkRJpv7HI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091839"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782150"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782150"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/18] ASoC: SOF: topology: Set IPC-specific trigger order for
 DAI links
Date: Fri, 27 Jan 2023 14:00:19 +0200
Message-Id: <20230127120031.10709-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new topology IPC op to set up DAI links and set the link trigger
order to match the expectation based on the IPC type. Note that the
link_setup op implementations for IPC3 and IPC4 are not identical and
have contrasting trigger orders for playback and capture.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 19 +++++++++++++++++++
 sound/soc/sof/ipc4-topology.c | 19 +++++++++++++++++++
 sound/soc/sof/sof-audio.h     |  2 ++
 sound/soc/sof/topology.c      | 25 +++++++------------------
 4 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 72ac1725af0d..3f52dfb19e01 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2426,6 +2426,24 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
 	return 0;
 }
 
+static int sof_ipc3_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link *link)
+{
+	if (link->no_pcm)
+		return 0;
+
+	/*
+	 * set default trigger order for all links. Exceptions to
+	 * the rule will be handled in sof_pcm_dai_link_fixup()
+	 * For playback, the sequence is the following: start FE,
+	 * start BE, stop BE, stop FE; for Capture the sequence is
+	 * inverted start BE, start FE, stop FE, stop BE
+	 */
+	link->trigger[SNDRV_PCM_STREAM_PLAYBACK] = SND_SOC_DPCM_TRIGGER_PRE;
+	link->trigger[SNDRV_PCM_STREAM_CAPTURE] = SND_SOC_DPCM_TRIGGER_POST;
+
+	return 0;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -2537,4 +2555,5 @@ const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.set_up_all_pipelines = sof_ipc3_set_up_all_pipelines,
 	.tear_down_all_pipelines = sof_ipc3_tear_down_all_pipelines,
 	.parse_manifest = sof_ipc3_parse_manifest,
+	.link_setup = sof_ipc3_link_setup,
 };
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3938ff2d998b..b07a405516b1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2038,6 +2038,24 @@ static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	return 0;
 }
 
+static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link *link)
+{
+	if (link->no_pcm)
+		return 0;
+
+	/*
+	 * set default trigger order for all links. Exceptions to
+	 * the rule will be handled in sof_pcm_dai_link_fixup()
+	 * For playback, the sequence is the following: start BE,
+	 * start FE, stop FE, stop BE; for Capture the sequence is
+	 * inverted start FE, start BE, stop BE, stop FE
+	 */
+	link->trigger[SNDRV_PCM_STREAM_PLAYBACK] = SND_SOC_DPCM_TRIGGER_POST;
+	link->trigger[SNDRV_PCM_STREAM_CAPTURE] = SND_SOC_DPCM_TRIGGER_PRE;
+
+	return 0;
+}
+
 static enum sof_tokens common_copier_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -2144,4 +2162,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.parse_manifest = sof_ipc4_parse_manifest,
 	.dai_get_clk = sof_ipc4_dai_get_clk,
 	.tear_down_all_pipelines = sof_ipc4_tear_down_all_pipelines,
+	.link_setup = sof_ipc4_link_setup,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 8e4abb1f5f73..28062a0c3a43 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -180,6 +180,7 @@ struct sof_ipc_tplg_widget_ops {
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
  * @parse_manifest: Function pointer for ipc4 specific parsing of topology manifest
+ * @link_setup: Function pointer for IPC-specific DAI link set up
  *
  * Note: function pointers (ops) are optional
  */
@@ -201,6 +202,7 @@ struct sof_ipc_tplg_ops {
 	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*parse_manifest)(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_tplg_manifest *man);
+	int (*link_setup)(struct snd_sof_dev *sdev, struct snd_soc_dai_link *link);
 };
 
 /** struct snd_sof_tuple - Tuple info
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 560771ba8fb9..f67c39c47930 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1813,26 +1813,15 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 	}
 	link->platforms->name = dev_name(scomp->dev);
 
-	/*
-	 * Set nonatomic property for FE dai links as their trigger action
-	 * involves IPC's.
-	 */
+	if (tplg_ops && tplg_ops->link_setup) {
+		ret = tplg_ops->link_setup(sdev, link);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set nonatomic property for FE dai links as their trigger action involves IPC's */
 	if (!link->no_pcm) {
 		link->nonatomic = true;
-
-		/*
-		 * set default trigger order for all links. Exceptions to
-		 * the rule will be handled in sof_pcm_dai_link_fixup()
-		 * For playback, the sequence is the following: start FE,
-		 * start BE, stop BE, stop FE; for Capture the sequence is
-		 * inverted start BE, start FE, stop FE, stop BE
-		 */
-		link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
-					SND_SOC_DPCM_TRIGGER_PRE;
-		link->trigger[SNDRV_PCM_STREAM_CAPTURE] =
-					SND_SOC_DPCM_TRIGGER_POST;
-
-		/* nothing more to do for FE dai links */
 		return 0;
 	}
 
-- 
2.39.1

