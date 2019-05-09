Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B051933D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 22:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E470D189C;
	Thu,  9 May 2019 22:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E470D189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557432901;
	bh=mL75C60N7Xzo7cTYC+u2bPDqXuwwwCwO2Ri51nbaY6Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEhc2G6xz7eRthl3cvc0KM8hamxBqFLc7H/VNGhliW3kaVeV5k2GZ0Z5TkfO8O0XO
	 Z/2mtSMHfJfCQ50Mjwz5txXfcwJOMb/VTUknqleC7HsxYoKMIw1KyydrJYTA4NtxR1
	 PU3iuWNmktEv9NHX0Z3r+PQcvtB/fUN/0KoxLU14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 231F8F89734;
	Thu,  9 May 2019 22:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFA6F89728; Thu,  9 May 2019 22:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B01F8073C
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 22:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B01F8073C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 13:10:36 -0700
X-ExtLoop1: 1
Received: from kli-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.111.224])
 by fmsmga005.fm.intel.com with ESMTP; 09 May 2019 13:10:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  9 May 2019 15:10:24 -0500
Message-Id: <20190509201027.3906-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509201027.3906-1-pierre-louis.bossart@linux.intel.com>
References: <20190509201027.3906-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: SOF: pcm: remove runtime PM calls
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

pm_runtime_get_sync()/pm_runtime_put_autosuspend() calls are
already invoked by the ASoC core in soc_pcm_open() and
soc_pcm_close(). So the SOF component driver does not need
to call them again.

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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
