Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E845D83B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:26:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2474517BC;
	Thu, 25 Nov 2021 11:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2474517BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637835991;
	bh=FD0ZQKuGsXU7jmfBpcBQMO1Ske9C4kkLZAsFG/npT9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etp3Y8L3w80kE7vq1tVCiHThiWBIraJlcNf9MKOqF5zukyqKideCZOhNdSZdHzDbq
	 vlkYprcreariqydWsAzSNwJ3JsHwjuXG5w7tA+dt03E3EovDGSHQycda3Pgg9v0cxn
	 Pc+duC3pU+cequKTqFncyOjhNZye+MQBJTP+Dw/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CBDF80515;
	Thu, 25 Nov 2021 11:23:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CE9F80511; Thu, 25 Nov 2021 11:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D2DFF804FD
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D2DFF804FD
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="215515262"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="215515262"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 02:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="741672053"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 02:23:34 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/10] ASoC: SOF: Add a helper for freeing PCM stream
Date: Thu, 25 Nov 2021 12:15:16 +0200
Message-Id: <20211125101520.291581-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
References: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Add a helper function to free PCM in the FW, stop the DMA and free the
widget list. These actions are performed both during PCM trigger STOP
and when a paused stream is freed during system suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 11 ++---------
 sound/soc/sof/sof-audio.c | 40 +++++++++++++++++++++++++--------------
 sound/soc/sof/sof-audio.h |  2 ++
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 1d0d90551e8f..3aa708b1ac26 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -466,17 +466,10 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
 	if (!ret && reset_hw_params) {
-		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream,
+					  free_widget_list);
 		if (ret < 0)
 			return ret;
-
-		ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-		if (ret < 0)
-			return ret;
-
-		/* free widget list only for SUSPEND trigger */
-		if (free_widget_list)
-			ret = sof_widget_list_free(sdev, spcm, substream->stream);
 	}
 
 	return ret;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d81071b39825..a275f7b7c812 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -728,6 +728,31 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 	return 0;
 }
 
+int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
+{
+	int ret;
+
+	/* Send PCM_FREE IPC to reset pipeline */
+	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+	if (ret < 0)
+		return ret;
+
+	/* stop the DMA */
+	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
+	if (ret < 0)
+		return ret;
+
+	/* free widget list */
+	if (free_widget_list) {
+		ret = sof_widget_list_free(sdev, spcm, dir);
+		if (ret < 0)
+			dev_err(sdev->dev, "failed to free widgets during suspend\n");
+	}
+
+	return ret;
+}
+
 /*
  * Free the PCM, its associated widgets and set the prepared flag to false for all PCMs that
  * did not get suspended(ex: paused streams) so the widgets can be set up again during resume.
@@ -751,22 +776,9 @@ static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
 				continue;
 
 			if (spcm->stream[dir].list) {
-				/* Free PCM in the DSP */
-				ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-				if (ret < 0)
-					return ret;
-
-				/* stop DMA */
-				ret = snd_sof_pcm_platform_hw_free(sdev, substream);
+				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
 				if (ret < 0)
 					return ret;
-
-				/* free the DAPM widget list */
-				ret = sof_widget_list_free(sdev, spcm, dir);
-				if (ret < 0) {
-					dev_err(sdev->dev, "failed to free widgets during suspend\n");
-					return ret;
-				}
 			}
 		}
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 1c4f59d34717..e419e7082c28 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -267,4 +267,6 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
 			 struct snd_sof_pcm *spcm);
+int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+			struct snd_sof_pcm *spcm, int dir, bool free_widget_list);
 #endif
-- 
2.33.0

