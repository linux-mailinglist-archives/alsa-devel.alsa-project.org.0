Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC751118AD2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:29:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C06F169C;
	Tue, 10 Dec 2019 15:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C06F169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988140;
	bh=13WzXn5sHxfQPlDFbQafgJp/5S2+FPNl7/Ro2OQC3I4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2ipamr1Wj7gzLsOBb8Qktg1PEy1L0XhINW/EaC0LL3WfDllo1KWzGlyz1gv12evY
	 4PDCFGBRqgD6+A8RAM7ZUys/aMPWlJEX6DLnKICtjc6gujeU/SBN8xG0aK4hOKq3JA
	 DXt+7YS4jjm+39XcqN9CmC6S+ByCf/RQRLQBj7TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADCDF80217;
	Tue, 10 Dec 2019 15:26:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B8F9F80265; Tue, 10 Dec 2019 15:26:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F858F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F858F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C234DB1FD;
 Tue, 10 Dec 2019 14:26:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:54 +0100
Message-Id: <20191210142614.19405-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 03/23] ASoC: dwc: Use managed buffer
	allocation
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

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
hw_free and pcm_destruct ops became empty and got removed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/dwc/dwc-pcm.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index 4771eb5fbe2a..6d69e5a5b0e2 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -162,7 +162,6 @@ static int dw_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dw_i2s_dev *dev = runtime->private_data;
-	int ret;
 
 	switch (params_channels(hw_params)) {
 	case 2:
@@ -187,18 +186,7 @@ static int dw_pcm_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	ret = snd_pcm_lib_malloc_pages(substream,
-			params_buffer_bytes(hw_params));
-	if (ret < 0)
-		return ret;
-	else
-		return 0;
-}
-
-static int dw_pcm_hw_free(struct snd_soc_component *component,
-			  struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int dw_pcm_trigger(struct snd_soc_component *component,
@@ -256,28 +244,20 @@ static int dw_pcm_new(struct snd_soc_component *component,
 {
 	size_t size = dw_pcm_hardware.buffer_bytes_max;
 
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
+	snd_pcm_set_managed_buffer_all(rtd->pcm,
 			SNDRV_DMA_TYPE_CONTINUOUS,
 			NULL, size, size);
 	return 0;
 }
 
-static void dw_pcm_free(struct snd_soc_component *component,
-			struct snd_pcm *pcm)
-{
-	snd_pcm_lib_preallocate_free_for_all(pcm);
-}
-
 static const struct snd_soc_component_driver dw_pcm_component = {
 	.open		= dw_pcm_open,
 	.close		= dw_pcm_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= dw_pcm_hw_params,
-	.hw_free	= dw_pcm_hw_free,
 	.trigger	= dw_pcm_trigger,
 	.pointer	= dw_pcm_pointer,
 	.pcm_construct	= dw_pcm_new,
-	.pcm_destruct	= dw_pcm_free,
 };
 
 int dw_pcm_register(struct platform_device *pdev)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
