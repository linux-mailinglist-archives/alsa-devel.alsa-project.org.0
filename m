Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F90224DC
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36961167F;
	Sat, 18 May 2019 22:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36961167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211508;
	bh=o1lIJYx+RcDQEqozduZjWVG/+Sq+41WR28pznrQVxhc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7OMWn6H75J3lGMRwJRsfZvG6LJHQc6iQQd53IlL4Ugl+lnggWopAZogZijkcceNQ
	 350AuMZkSDSQBXX6VbUW8ugoYDxielyRj45zincp/hc4X2CxwysCfT9zk882PP1ZRH
	 5qmeglgM0MbpnRGYpJ+7LftHk8ZiCwC4gTMpGOBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8DCF89735;
	Sat, 18 May 2019 22:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 431F7F89734; Sat, 18 May 2019 22:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01FDF896B9
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01FDF896B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:23 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:56 -0500
Message-Id: <20190518202704.7772-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 04/12] ASoC: SOF: pcm: remove runtime PM calls
	during pcm open/close
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

pm_runtime_get_sync()/pm_runtime_put_autosuspend() calls are
already invoked by the ASoC core in soc_pcm_open() and
soc_pcm_close(). So the SOF component driver does not need
to call them again.

Fixes: 868bd00f495 ("ASoC: SOF: Add PCM operations support")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 649968841dad..4f536c0de0a5 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -416,7 +416,6 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
 	int ret;
-	int err;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -434,14 +433,6 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 
 	caps = &spcm->pcm.caps[substream->stream];
 
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: pcm open failed to resume %d\n",
-			ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
 	/* set any runtime constraints based on topology */
 	snd_pcm_hw_constraint_step(substream->runtime, 0,
 				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
@@ -485,17 +476,8 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	spcm->stream[substream->stream].substream = substream;
 
 	ret = snd_sof_pcm_platform_open(sdev, substream);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: pcm open failed %d\n",
-			ret);
-
-		pm_runtime_mark_last_busy(sdev->dev);
-
-		err = pm_runtime_put_autosuspend(sdev->dev);
-		if (err < 0)
-			dev_err(sdev->dev, "error: pcm close failed to idle %d\n",
-				err);
-	}
+	if (ret < 0)
+		dev_err(sdev->dev, "error: pcm open failed %d\n", ret);
 
 	return ret;
 }
@@ -530,13 +512,6 @@ static int sof_pcm_close(struct snd_pcm_substream *substream)
 		 */
 	}
 
-	pm_runtime_mark_last_busy(sdev->dev);
-
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err(sdev->dev, "error: pcm close failed to idle %d\n",
-			err);
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
