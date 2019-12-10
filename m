Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D29118B3E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:41:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD22316B6;
	Tue, 10 Dec 2019 15:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD22316B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988859;
	bh=4Y2gCvnpZPjLeiouOtxQmSEfApEs+MSugg/T3TKiMH0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0PRYyRtCXQEQitmYzOeZZITijBdyH9KmP0C0kDoTV4NpdIuqmbwwReaNKt4q7Dbi
	 EzsT7Alka9ereWzFokb+EciRv5DZqIYJQvALCszE5WjwA5rWDnDBpm0bqiMeUNtnc/
	 gEG5HBbbM50ioNvpjzGJly1B/OKzCNggMDUVqy9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 218FFF80343;
	Tue, 10 Dec 2019 15:27:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3112FF802DC; Tue, 10 Dec 2019 15:27:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63208F8025A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63208F8025A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C71A3B221;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:12 +0100
Message-Id: <20191210142614.19405-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH for-5.6 21/23] ASoC: intel: baytrail: Use
	managed buffer allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_free callback became superfluous and got dropped.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/baytrail/sst-baytrail-pcm.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
index 1d780fcc448c..a4435306325a 100644
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
@@ -375,7 +361,6 @@ static const struct snd_soc_component_driver byt_dai_component = {
 	.close		= sst_byt_pcm_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= sst_byt_pcm_hw_params,
-	.hw_free	= sst_byt_pcm_hw_free,
 	.trigger	= sst_byt_pcm_trigger,
 	.pointer	= sst_byt_pcm_pointer,
 	.mmap		= sst_byt_pcm_mmap,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
