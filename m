Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F950A9FE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5EE316FB;
	Thu, 21 Apr 2022 22:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5EE316FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573229;
	bh=7G8dNMQTWwxYMImRIieQsaNrmKqsMm8cM0Erud9YQRM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQdaSBpSMSq7TCFZXKU005S8ya7ejaufCfMEExpC9MJKGjcFhxkPH3FYFdutymUDR
	 cwXGaNMp4JyGEtTTAKlJ7nxqeJbheHwpvGC7xBN3aJqXyZsM+WStO57nlFxm4Q6WK9
	 1AnYt8VZhBiYCTQITDundZ8Y1YwZE6E5llN4Ik/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A59CF80526;
	Thu, 21 Apr 2022 22:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0B2F80519; Thu, 21 Apr 2022 22:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3DD3F804DA
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3DD3F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nlpJdBhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573159; x=1682109159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7G8dNMQTWwxYMImRIieQsaNrmKqsMm8cM0Erud9YQRM=;
 b=nlpJdBhviP3PJ9t/xGsL5VBQ9dwLVPDPYu8MtrROFt5ivAxoysEZ9zxr
 mP8x2dj/xVZWw6CudFO7duAd0CqoGgLvOcDNgua3YVCuS2WmrOc4jUJ1t
 2zaHdGxO/kAhnOGw4Dk04Q7QBJkd4MYTD3GmE2eRCD2ag6qIRI9uHmRw7
 hzUA9hTyxeeKzyginZx11r0ZXCseOVmr1SB+cVR+MnPHMmOTkxhlnMI1C
 oBPr4diiJSsid/NwiB8hkKL5sSC32OR1JeLvG3KdIyPgbW9kG9r7MRHvM
 ZBAWssKcNpEkABwzJTVxKRcVdWIlDy0DfULMKQJPr1TfCU62fjY2LHgom w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047597"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047597"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455746"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/14] ASoC: SOF: remove incorrect clearing of prepared flag
Date: Thu, 21 Apr 2022 15:31:48 -0500
Message-Id: <20220421203201.1550328-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When the system is suspended while a PCM is paused, it doesn't receive
the SUSPEND trigger. So, the SOF driver has to ensure that the PCM and
the widgets associated with the paused PCM are freed in the firmware
during suspend. This is handled in the
sof_tear_down_left_over_pipelines() call. But since the state of this
PCM is SUSPENDED, we end up clearing the prepared flag for the PCM
before freeing it. This results in IPC errors while freeing the widgets.
But because the widget use_counts are reset to 0 even though the IPC
fails, releasing the paused stream after resuming from suspend proceeds
normally.

Fix the IPC errors by removing the clearing of the prepared flag in
sof_set_hw_params_upon_resume(). In fact, we can remove the
sof_set_hw_params_upon_resume() and call
snd_sof_dsp_hw_params_upon_resume() directly. This will ensure that the
PCM is freed in the firmware before the IPC's for freeing the widgets
are sent.

BugLink: https://github.com/thesofproject/linux/issues/3543
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c        |  2 +-
 sound/soc/sof/sof-audio.c | 36 ------------------------------------
 sound/soc/sof/sof-audio.h |  1 -
 3 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 44008dd075c21..fa3f5514c00fb 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -194,7 +194,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* prepare for streams to be resumed properly upon resume */
 	if (!runtime_suspend) {
-		ret = sof_set_hw_params_upon_resume(sdev->dev);
+		ret = snd_sof_dsp_hw_params_upon_resume(sdev);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error: setting hw_params flag during suspend %d\n",
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e2ec60887568b..7ecc84f9872bf 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -413,42 +413,6 @@ bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 	return false;
 }
 
-int sof_set_hw_params_upon_resume(struct device *dev)
-{
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_pcm_substream *substream;
-	struct snd_sof_pcm *spcm;
-	snd_pcm_state_t state;
-	int dir;
-
-	/*
-	 * SOF requires hw_params to be set-up internally upon resume.
-	 * So, set the flag to indicate this for those streams that
-	 * have been suspended.
-	 */
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for_each_pcm_streams(dir) {
-			/*
-			 * do not reset hw_params upon resume for streams that
-			 * were kept running during suspend
-			 */
-			if (spcm->stream[dir].suspend_ignored)
-				continue;
-
-			substream = spcm->stream[dir].substream;
-			if (!substream || !substream->runtime)
-				continue;
-
-			state = substream->runtime->status->state;
-			if (state == SNDRV_PCM_STATE_SUSPENDED)
-				spcm->prepared[dir] = false;
-		}
-	}
-
-	/* set internal flag for BE */
-	return snd_sof_dsp_hw_params_upon_resume(sdev);
-}
-
 int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
 {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a0af7c421fd9b..f36c4f62bc994 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -434,7 +434,6 @@ static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
 
-- 
2.30.2

