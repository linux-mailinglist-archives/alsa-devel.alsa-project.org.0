Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF94DCD03
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1750A1959;
	Thu, 17 Mar 2022 18:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1750A1959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539810;
	bh=qWisgQRCiDNAtpHZOy5FO5/vMlRPNwTm17WeTY5QnTE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeErqlB/ymwel8OPFPSjRNkYKEJWM8nAd3kAzeReyCvoy8YGU4UAcyIu80haeNGqS
	 C1X1ObKUh8E9COargAkia4zTG9kVxn3mbGD1pMuRQUXzfZdRqZ3raXrRzEXh0Sk4Ub
	 q6ANmOOcexM48+qWJsUgwMjFgeW5BLV62rVqW/IM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE9FF80564;
	Thu, 17 Mar 2022 18:52:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B04F8051B; Thu, 17 Mar 2022 18:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D82F3F8051D
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D82F3F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M1bewocM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539517; x=1679075517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWisgQRCiDNAtpHZOy5FO5/vMlRPNwTm17WeTY5QnTE=;
 b=M1bewocMzZT/3sYES8ThvnXpkyTUjttrrWQvvupV3AUpBmhVPNDSXBXH
 S+yK4vybwUBh66075b1wDCXmjEe9R+UwU18r8i5X2fyI47HdtvnpofGO6
 nJOMIQB3llrO/5e0TIFU0HNmt5lHc+9yHPJYWrBmmYpDtk6RRTXny5sqy
 PuVdgk4m+bxyP87gU5aH91CoTG+hxzYkhZO0GSfKmx5rOUyqv7T3Bk8Fh
 Up5F2r0NRybiI6k0iERVTeqS/kjLb5JI58HSSyK6PUfNhY5fFEIklCkAn
 6n/1g5CVkZUI0J+MzGoPkuuN0pAeUc876QENLS43HQT24JQkLWG5cjyQU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492931"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431155"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/19] ASoC: SOF: Add trigger PCM op for IPC3
Date: Thu, 17 Mar 2022 10:50:40 -0700
Message-Id: <20220317175044.1752400-16-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add the trigger PCM op for IPC3 and use it.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c | 43 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/pcm.c      | 23 ++++++---------------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index b715199a2aaa..d83d54540bbe 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -137,7 +137,50 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 	return ret;
 }
 
+static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
+	stream.comp_id = spcm->stream[substream->stream].comp_id;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_PAUSE;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
+		break;
+	case SNDRV_PCM_TRIGGER_START:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_STOP:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
+		break;
+	default:
+		dev_err(component->dev, "Unhandled trigger cmd %d\n", cmd);
+		return -EINVAL;
+	}
+
+	/* send IPC to the DSP */
+	return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
+				  sizeof(stream), &reply, sizeof(reply));
+}
+
 const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
 	.hw_params = sof_ipc3_pcm_hw_params,
 	.hw_free = sof_ipc3_pcm_hw_free,
+	.trigger = sof_ipc3_pcm_trigger,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8a194c130981..dc55a04a1588 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -274,13 +274,12 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 	struct snd_sof_pcm *spcm;
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	bool reset_hw_params = false;
 	bool free_widget_list = false;
 	bool ipc_first = false;
-	int ret;
+	int ret = 0;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -293,17 +292,11 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: trigger stream %d dir %d cmd %d\n",
 		spcm->pcm.pcm_id, substream->stream, cmd);
 
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_PAUSE;
 		ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
 		break;
 	case SNDRV_PCM_TRIGGER_START:
 		if (spcm->stream[substream->stream].suspend_ignored) {
@@ -315,7 +308,6 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			spcm->stream[substream->stream].suspend_ignored = false;
 			return 0;
 		}
-		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		if (sdev->system_suspend_target == SOF_SUSPEND_S0IX &&
@@ -332,13 +324,11 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		free_widget_list = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
 		ipc_first = true;
 		reset_hw_params = true;
 		break;
 	default:
-		dev_err(component->dev, "error: unhandled trigger cmd %d\n",
-			cmd);
+		dev_err(component->dev, "Unhandled trigger cmd %d\n", cmd);
 		return -EINVAL;
 	}
 
@@ -349,11 +339,10 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	if (!ipc_first)
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
+	if (pcm_ops->trigger)
+		ret = pcm_ops->trigger(component, substream, cmd);
 
-	/* need to STOP DMA even if STOP IPC failed */
+	/* need to STOP DMA even if trigger IPC failed */
 	if (ipc_first)
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
-- 
2.25.1

