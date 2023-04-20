Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FFD6E9329
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:42:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53DB4ED5;
	Thu, 20 Apr 2023 13:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53DB4ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681990968;
	bh=Gqe1FawZIv5RG0Qq4nCgYJmAGWURCpV8qfAgf6NuPSE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKke6NK/wq7LpdLNdrJWuxekWE3rcfQdrg54rGNKixYNkCAzWW+mZ3wgD6h3iLHi1
	 8bjsoeKxnfaNmiDU+v1Ut/F5d9J2MkPJk7VtD1pNxuYeEpICeuRudHE2JOAcTCVZPI
	 0WDDLgxGB0zZwwP8qdFmT/AK+BdZqK/Nu+1SNlsA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20179F804FC;
	Thu, 20 Apr 2023 13:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C619F8019B; Thu, 20 Apr 2023 13:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBE1EF80149
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE1EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q6Ac6oiQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681990862; x=1713526862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gqe1FawZIv5RG0Qq4nCgYJmAGWURCpV8qfAgf6NuPSE=;
  b=Q6Ac6oiQnk2jq8cgBBzdJjOMjARdBpMCjDTZzN3bVDXr4DekL5XiuX7f
   IUcwhH+ncdyRwb9RGLXI4pCn4EvSjEJMi3CnBRPYmpEyTvBP1xFwJPJrn
   hISDQY7MkLleOx2S5YkXvmVf7BFY6NyL3eeA+aRJpzYolYV1K40Xh3bYz
   bkzs9F5SZgJ0BZFM1CBSTLm6+7Ofca6GsjyBl6kFYepiR/O4Bb1H0UD5Q
   MMIga9qpm3lnflf5U3+qQ2YMW5UkpOvtwUKsWgyHnSToidAJ8icEN4FBl
   b/CNsr+N9HQ63xaGk+USMcF3uSWa8aOeBQnkur7s7QYCUe5fsdDAxdI7n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373606530"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="373606530"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021553561"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="1021553561"
Received: from draj-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.253])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:40:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: pcm: Add an option to skip platform trigger
 during stop
Date: Thu, 20 Apr 2023 14:41:37 +0300
Message-Id: <20230420114137.27613-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
References: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3EJRRUSM7OEW5B3BLKYIDSKIE33LWXBE
X-Message-ID-Hash: 3EJRRUSM7OEW5B3BLKYIDSKIE33LWXBE
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EJRRUSM7OEW5B3BLKYIDSKIE33LWXBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In the case of IPC4, a pipeline is only paused during STOP/PAUSE/SUSPEND
triggers and the FW keeps the host DMA running when a pipeline is
paused. The start/stop tests iterate through STOP/START triggers without
involving a hw_free. This means that the pipeline state will only toggle
between PAUSED (during the STOP trigger) and RUNNING (during the START
trigger). So this test should be treated in the same way as a
PAUSE_PUSH/PAUSE_RELEASE test and the DMA should be kept running when
toggling the pipeline states between PAUSED and RUNNING.

Since there is no way to tell if a STOP trigger will be followed by hw_free
or not, this patch proposes to always skip DMA stop during the STOP trigger
and handle it later during hw_free. Introduce a new flag in struct
sof_ipc_pcm_ops, delayed_platform_trigger, that will be used to ensure that
the host DMA will not be stopped during the STOP/PAUSE/RELEASE triggers
and set it for IPC4. The platform_trigger call to stop the DMA will be
invoked during PCM hw_free instead when the pipeline is reset.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c  |  3 ++-
 sound/soc/sof/pcm.c       | 23 +++++++++++++++--------
 sound/soc/sof/sof-audio.c | 22 ++++++++++++++--------
 sound/soc/sof/sof-audio.h |  6 ++++++
 4 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a2cd21256e44..ea19bd0330e2 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -836,5 +836,6 @@ const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.pcm_setup = sof_ipc4_pcm_setup,
 	.pcm_free = sof_ipc4_pcm_free,
 	.delay = sof_ipc4_pcm_delay,
-	.ipc_first_on_start = true
+	.ipc_first_on_start = true,
+	.platform_stop_during_hw_free = true,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 127b68caf9e1..567db32173a8 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -211,16 +211,22 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: free stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	/* free PCM in the DSP */
-	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
-		ret = pcm_ops->hw_free(component, substream);
-		if (ret < 0)
-			err = ret;
+	if (spcm->prepared[substream->stream]) {
+		/* stop DMA first if needed */
+		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
+			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
+
+		/* free PCM in the DSP */
+		if (pcm_ops && pcm_ops->hw_free) {
+			ret = pcm_ops->hw_free(component, substream);
+			if (ret < 0)
+				err = ret;
+		}
 
 		spcm->prepared[substream->stream] = false;
 	}
 
-	/* stop DMA */
+	/* reset DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
 	if (ret < 0) {
 		dev_err(component->dev, "error: platform hw free failed\n");
@@ -362,8 +368,9 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
-		/* invoke platform trigger to stop DMA even if pcm_ops failed */
-		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+		/* invoke platform trigger to stop DMA even if pcm_ops isn't set or if it failed */
+		if (!pcm_ops || (pcm_ops && !pcm_ops->platform_stop_during_hw_free))
+			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 		break;
 	default:
 		break;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7651644fcd62..1cbda595c518 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -805,16 +805,22 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	int ret;
 
-	/* Send PCM_FREE IPC to reset pipeline */
-	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
-		ret = pcm_ops->hw_free(sdev->component, substream);
-		if (ret < 0)
-			return ret;
-	}
+	if (spcm->prepared[substream->stream]) {
+		/* stop DMA first if needed */
+		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
+			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
+
+		/* Send PCM_FREE IPC to reset pipeline */
+		if (pcm_ops && pcm_ops->hw_free) {
+			ret = pcm_ops->hw_free(sdev->component, substream);
+			if (ret < 0)
+				return ret;
+		}
 
-	spcm->prepared[substream->stream] = false;
+		spcm->prepared[substream->stream] = false;
+	}
 
-	/* stop the DMA */
+	/* reset the DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 6c64376858b3..a090a9eb4828 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -108,6 +108,11 @@ struct snd_sof_dai_config_data {
  *				 STOP pcm trigger
  * @ipc_first_on_start: Send IPC before invoking platform trigger during
  *				START/PAUSE_RELEASE triggers
+ * @platform_stop_during_hw_free: Invoke the platform trigger during hw_free. This is needed for
+ *				  IPC4 where a pipeline is only paused during stop/pause/suspend
+ *				  triggers. The FW keeps the host DMA running in this case and
+ *				  therefore the host must do the same and should stop the DMA during
+ *				  hw_free.
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -123,6 +128,7 @@ struct sof_ipc_pcm_ops {
 				   struct snd_pcm_substream *substream);
 	bool reset_hw_params_during_stop;
 	bool ipc_first_on_start;
+	bool platform_stop_during_hw_free;
 };
 
 /**
-- 
2.40.0

