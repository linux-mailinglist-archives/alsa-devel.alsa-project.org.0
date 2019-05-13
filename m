Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4671B6C5
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 669891747;
	Mon, 13 May 2019 15:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 669891747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557753071;
	bh=qCwkprH+0Wv7M2c+blRK8nn6hLXybQsKSPrDA6XrZhg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iHMwrUUkKSrTnKOrH/KND4B5P002y3tDORRWJ/JNzdnI3dCrtz2RYTWoT7ulV/YwZ
	 h+a8wobS1FJdKCkahWzB8zF/RCaUhyximGCZnYIGVf7Y6HJ03vbZrZHsR6BMCp8WUr
	 Ut16OMk9741p0Emn7AxKy8CbddSt8WUw3sJVnnpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD93F89765;
	Mon, 13 May 2019 15:02:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C560F89633; Mon, 13 May 2019 14:38:17 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D188CF89707
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D188CF89707
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fV5gyV8r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Xk4wWwcqDbqN8/qIC8orYjp2tqOwtJP0dvptIrIiMh0=; b=fV5gyV8rNXiq
 zuPy3TMfFB8unTrVhim1ZEgSNS7YETXq/qNi74B3jF9fMcdtxodgDp/dJqKrYAF38M6ERmDCnMLWz
 KNWjiuhGLNwO1ymZ8aMoehRqSpnVwJnp4XZ+jsgNL5u4QzSwmvEeOnjf655Vg75BnWffhdnLRkVgm
 WFDes=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA69-0006X5-Sr; Mon, 13 May 2019 12:30:30 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id CFE011129236; Mon, 13 May 2019 13:30:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190509201027.3906-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123028.CFE011129236@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:28 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pcm: remove runtime PM calls
	during pcm open/close" to the asoc tree
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

The patch

   ASoC: SOF: pcm: remove runtime PM calls during pcm open/close

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 14a2212dd4bcb55a03eddaf66d62068c9cece585 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Thu, 9 May 2019 15:10:24 -0500
Subject: [PATCH] ASoC: SOF: pcm: remove runtime PM calls during pcm open/close

pm_runtime_get_sync()/pm_runtime_put_autosuspend() calls are
already invoked by the ASoC core in soc_pcm_open() and
soc_pcm_close(). So the SOF component driver does not need
to call them again.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
