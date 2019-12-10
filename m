Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B6118B3D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627BD16BC;
	Tue, 10 Dec 2019 15:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627BD16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988811;
	bh=5BNd3zpPUlyPTCeV5H3gQ42XS1ZDG7ik4/asHnoMS88=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZwBOlyKFVyRMLxr2ummHAVzYezg6iQQl4AvhZgH1gkyOhR18u961i3lRWYT+nqfC
	 DOn86gwQSUm9udgnNiHdomuqoMtxzEPV0BORqF7pm7ZtUJgjvP644DnwXqk/WSCT4K
	 IJJrI7bgTQP4Z6NOvzW3YrY9p45Tv5T4kB3ay3fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15EB4F80338;
	Tue, 10 Dec 2019 15:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC161F802C2; Tue, 10 Dec 2019 15:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A4EFF80264
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4EFF80264
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4C50B21D;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:11 +0100
Message-Id: <20191210142614.19405-21-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH for-5.6 20/23] ASoC: intel: atom: Use managed
	buffer allocation
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
The hw_params and hw_free callbacks became superfluous and got
dropped.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 47e3d1943d7e..08aa46ba5b07 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -387,27 +387,6 @@ static int sst_media_prepare(struct snd_pcm_substream *substream,
 	return ret_val;
 }
 
-static int sst_media_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
-{
-	int ret;
-
-	ret =
-		snd_pcm_lib_malloc_pages(substream,
-				params_buffer_bytes(params));
-	if (ret)
-		return ret;
-	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
-	return 0;
-}
-
-static int sst_media_hw_free(struct snd_pcm_substream *substream,
-		struct snd_soc_dai *dai)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int sst_enable_ssp(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *dai)
 {
@@ -473,8 +452,6 @@ static const struct snd_soc_dai_ops sst_media_dai_ops = {
 	.startup = sst_media_open,
 	.shutdown = sst_media_close,
 	.prepare = sst_media_prepare,
-	.hw_params = sst_media_hw_params,
-	.hw_free = sst_media_hw_free,
 	.mute_stream = sst_media_digital_mute,
 };
 
@@ -677,7 +654,7 @@ static int sst_soc_pcm_new(struct snd_soc_component *component,
 
 	if (dai->driver->playback.channels_min ||
 			dai->driver->capture.channels_min) {
-		snd_pcm_lib_preallocate_pages_for_all(pcm,
+		snd_pcm_set_managed_buffer_all(pcm,
 			SNDRV_DMA_TYPE_CONTINUOUS,
 			snd_dma_continuous_data(GFP_DMA),
 			SST_MIN_BUFFER, SST_MAX_BUFFER);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
