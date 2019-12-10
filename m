Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE94118B2C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:38:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DFB41693;
	Tue, 10 Dec 2019 15:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DFB41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988701;
	bh=2+nzGe1wOp90pT88kyQwPbuzG02IUYWj6Nble8sB3D4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OIxvLnGLjITIhSCgDf4t6bbpFSxP09JPqpCX+nJywgLClmBhdZbtKG7/BDYNbBjON
	 Mg9/E3s8JQqPhKgrJyCu+u77fLusm5iGbBKnYIxazGc450VQ4AFUwcHc8uowAD0R+j
	 aHduKed5gSAgBp9ZgO8uQFiFEnRWIOo5hzLS8OIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F9AFF80317;
	Tue, 10 Dec 2019 15:27:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D2F2F802A0; Tue, 10 Dec 2019 15:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46FB2F800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46FB2F800B4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5A8DB21B;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:10 +0100
Message-Id: <20191210142614.19405-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 19/23] ASoC: rt5677-spi: Use managed
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
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5677-spi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 7810b1d7de32..3f40d2751833 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -132,14 +132,12 @@ static int rt5677_spi_hw_params(
 {
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
-	int ret;
 
 	mutex_lock(&rt5677_dsp->dma_lock);
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	rt5677_dsp->substream = substream;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
-	return ret;
+	return 0;
 }
 
 static int rt5677_spi_hw_free(
@@ -153,7 +151,7 @@ static int rt5677_spi_hw_free(
 	rt5677_dsp->substream = NULL;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int rt5677_spi_prepare(
@@ -376,8 +374,8 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 static int rt5677_spi_pcm_new(struct snd_soc_component *component,
 			      struct snd_soc_pcm_runtime *rtd)
 {
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       NULL, 0, 0);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
