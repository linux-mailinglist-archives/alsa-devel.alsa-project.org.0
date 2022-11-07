Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A799C61ED1C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3156583B;
	Mon,  7 Nov 2022 09:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3156583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667810576;
	bh=hfrCMfLDtm4CiuInc323SYBub2cHvTxjc7ZAY2r8v7o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vtdnsbIp06wUK8vsKDVwBg8+20yot+27EGsiA/Nz2vKaxJyOwWU4tNZNRYemD84tJ
	 dyq2ONwI58NU4o+bSA/vjvHw6vpj8nEdhLyeUlrSY4mTWAcR4dm/ZaeX54vsL8o1fK
	 1MLWNia1+QCU5Lg7m653H3vYq+8fiOj6dV3iHHOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9CDF804BD;
	Mon,  7 Nov 2022 09:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F0A6F8025A; Mon,  7 Nov 2022 09:41:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 971CDF80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971CDF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KuNKuxAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667810513; x=1699346513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hfrCMfLDtm4CiuInc323SYBub2cHvTxjc7ZAY2r8v7o=;
 b=KuNKuxAcksVw4hgWwQDkIa4wpcWo5QIG9C/X1sj8t6jtLym2ToDQgZ4g
 yu/Xz05SnN583ZJIESlhLISSoe25zSXmG5HM06jZckIylpayvqj/91NmI
 UUyViYfJJGn40KPtOk3Tl70SLi+hvHMaGp0TU2JqBHzaWK+UHKLBcjph3
 AHzWEoFgk6drKU8lJeVnDdKvuVP+Ia57WJY+vPe9pbuAQtxES5NZnGz//
 nAOH0nVOjVam17EMGPkjhZo809A3f6AG4w+NV6rpmPksvaUhfHbaQ3+hS
 ZEeGkmCvsnBCbM1C+P7qSc9IZihorbQonGmkjtYBkXCtRp+rleJOb9uRz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="312124142"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="312124142"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:41:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635826810"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="635826810"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:41:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: Implement tear_down_all_pipelines
 callback
Date: Mon,  7 Nov 2022 10:41:58 +0200
Message-Id: <20221107084158.26629-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

During system suspend there is a chance that the running stream undergo
an xrun and instead of the expected SNDRV_PCM_TRIGGER_SUSPEND trigger
we will receive SNDRV_PCM_TRIGGER_STOP.

The handling of SUSPEND and STOP triggers differ that case of the later
the sof_pcm_stream_free() will be called with free_widget_list = false.
But we must make sure that all active widgets and streams are free before
entering suspend in order to be able to resume without error.

We can utilize the tear_down_all_pipelines to put the system to an expected
state and to fix the suspend/resume error.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ab85dde4303b..c31b7f065c1d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1813,6 +1813,39 @@ static int sof_ipc4_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	return -EINVAL;
 }
 
+static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verify)
+{
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	/*
+	 * This function is called during system suspend, we need to make sure
+	 * that all streams have been freed up.
+	 * Freeing might have been skipped when xrun happened just at the start
+	 * of the suspend and it sent a SNDRV_PCM_TRIGGER_STOP to the active
+	 * stream. This will call sof_pcm_stream_free() with
+	 * free_widget_list = false which will leave the kernel and firmware out
+	 * of sync during suspend/resume.
+	 *
+	 * This will also make sure that paused streams handled correctly.
+	 */
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for_each_pcm_streams(dir) {
+			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
+
+			if (!substream || !substream->runtime)
+				continue;
+
+			if (spcm->stream[dir].list) {
+				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+	return 0;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1913,4 +1946,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.dai_config = sof_ipc4_dai_config,
 	.parse_manifest = sof_ipc4_parse_manifest,
 	.dai_get_clk = sof_ipc4_dai_get_clk,
+	.tear_down_all_pipelines = sof_ipc4_tear_down_all_pipelines,
 };
-- 
2.38.1

