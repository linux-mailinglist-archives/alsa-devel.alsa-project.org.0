Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FFC3F72
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF922168B;
	Tue,  1 Oct 2019 20:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF922168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953346;
	bh=Iptzsf7V2BTYhwgmoBonA6OK+u9T5au/8Gm06P4904c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fxSYH5+8Oqg7XV5/hNhPuI1LpKTZ4aXvUGrW+O6JFLUPe46mjoaK4QMmfUz8mElIR
	 f5QS9QKdkrYlO9MwadAc4ocEPfOmM4Uz3xGuQMKN1aqYgXDZAKdkp/+INi0boqNuhi
	 syyoolm0dGOPR7EU2tfvLUyS0BBxt7phSrE+dgns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D205F8075C;
	Tue,  1 Oct 2019 19:57:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45331F8067C; Tue,  1 Oct 2019 19:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A154F8063C
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A154F8063C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YU4FeKV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XNgqHZ1IlfmJb5/mkwH5EhuiDzlki9WXcVdjZY8cCy8=; b=YU4FeKV5IYD5
 lZ3jp2USonaca1BilP8UnBhgTADLe3auX+nCFTJ8fUYT5Yzh8JokozcRzRIcb2UMJCCXEXTGXkyv4
 RgMUYjTEVD2sIAt3lLGknCDWkwIFHOQYI9e19baviaG6HXE/FJi6ikrSeQTkmP7EPQjU5SpYC8nbU
 YQijI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOH-0005tX-LD; Tue, 01 Oct 2019 17:56:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1B0882742A30; Tue,  1 Oct 2019 18:56:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190927200538.660-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175649.1B0882742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:49 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pcm: fix resource leak in hw_free"
	to the asoc tree
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

   ASoC: SOF: pcm: fix resource leak in hw_free

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From e66e52c5b7422824cedf0084c0766602dea7e8a7 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:30 -0500
Subject: [PATCH] ASoC: SOF: pcm: fix resource leak in hw_free

Fix a bug in sof_pcm_hw_free() where some cleanup actions were
skipped if STREAM_PCM_FREE IPC was already successfully sent to
DSP when the stream was stopped or suspended. This is incorrect
as hw_free should clean up also other resources, including pcm
lib page allocations, period elapsed work queue and call to
platform hw_free.

Fixes: c29d96c3b9b4 ("ASoC: SOF: reset DMA state in prepare")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e3f6a6dc0f36..fa7769dd825c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -244,7 +244,7 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
-	int ret;
+	int ret, err = 0;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -254,26 +254,26 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (!spcm)
 		return -EINVAL;
 
-	if (!spcm->prepared[substream->stream])
-		return 0;
-
 	dev_dbg(sdev->dev, "pcm: free stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
-	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+	if (spcm->prepared[substream->stream]) {
+		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			err = ret;
+	}
 
 	snd_pcm_lib_free_pages(substream);
 
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
-	if (ret < 0)
-		return ret;
-
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: platform hw free failed\n");
+		err = ret;
+	}
 
-	return ret;
+	return err;
 }
 
 static int sof_pcm_prepare(struct snd_pcm_substream *substream)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
