Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF611B96B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC551657;
	Wed, 11 Dec 2019 17:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC551657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083593;
	bh=s8Get93RhsxdtALxyWhjW2SVFsccNdHaxsZz8blMCJ8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N0oxYnXJXKIrjVGNYu66IZI6UkTFamSsswXrUnjpkJHXrGqpMeIezctHsFANQRxpb
	 R43LpPjTS3hbwMzTMdVJWfTolc0uimgSzmIW2JOtFCYjcv919pa0PTrKu3cafvgnZO
	 EYhg3Y+zyRPXKqBk3huiHUw9XLSKAlFrylVA1jLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834DEF802A8;
	Wed, 11 Dec 2019 17:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3210F8028B; Wed, 11 Dec 2019 17:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0124BF8028B
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0124BF8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69E88DA7;
 Wed, 11 Dec 2019 08:53:24 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3693F802;
 Wed, 11 Dec 2019 08:53:23 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-22-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-22-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: baytrail: Use managed buffer
	allocation" to the asoc tree
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

   ASoC: intel: baytrail: Use managed buffer allocation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From d9c7824aa29d064b205957033463563ac3205fcb Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:26:12 +0100
Subject: [PATCH] ASoC: intel: baytrail: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The hw_free callback became superfluous and got dropped.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-22-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/baytrail/sst-baytrail-pcm.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
index 775c3b0b209e..53383055c8dc 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
@@ -102,8 +102,6 @@ static int sst_byt_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-
 	ret = sst_byt_stream_buffer(byt, pcm_data->stream,
 				    substream->dma_buffer.addr,
 				    params_buffer_bytes(params));
@@ -121,17 +119,6 @@ static int sst_byt_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int sst_byt_pcm_hw_free(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-
-	dev_dbg(rtd->dev, "PCM: hw_free\n");
-	snd_pcm_lib_free_pages(substream);
-
-	return 0;
-}
-
 static int sst_byt_pcm_restore_stream_context(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -315,9 +302,8 @@ static int sst_byt_pcm_new(struct snd_soc_component *component,
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream ||
 	    pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
 		size = sst_byt_pcm_hardware.buffer_bytes_max;
-		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      pdata->dma_dev,
-						      size, size);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					       pdata->dma_dev, size, size);
 	}
 
 	return 0;
@@ -374,7 +360,6 @@ static const struct snd_soc_component_driver byt_dai_component = {
 	.open		= sst_byt_pcm_open,
 	.close		= sst_byt_pcm_close,
 	.hw_params	= sst_byt_pcm_hw_params,
-	.hw_free	= sst_byt_pcm_hw_free,
 	.trigger	= sst_byt_pcm_trigger,
 	.pointer	= sst_byt_pcm_pointer,
 	.mmap		= sst_byt_pcm_mmap,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
