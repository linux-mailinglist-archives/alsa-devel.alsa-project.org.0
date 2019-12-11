Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028811B99B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:07:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A38D1687;
	Wed, 11 Dec 2019 18:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A38D1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084040;
	bh=pTzug3gFubAHhAk/pOG330T9tGL1rHQiKB4LDOc+LWY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rtZmVRuNx3P1OjaGctGmrhcWAZkOrw8x50gnytwWCwv04ydeYDjj0ZsvFBzgfCkFd
	 DVG8lNcBjtaP+GA2oE1nkp9zDYg6Dpbe2EflP6Ps9tjI0XqMcrR2ejimBEOz1NxkIs
	 fNGcjsNfz21b4ZEmN57lD4TkMOSz3h09XpPoDgb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 941FFF80348;
	Wed, 11 Dec 2019 17:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 541CCF80341; Wed, 11 Dec 2019 17:54:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E7C3DF80329
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C3DF80329
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59EE731B;
 Wed, 11 Dec 2019 08:53:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB08A3F52E;
 Wed, 11 Dec 2019 08:53:55 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-4-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-4-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dwc: Use managed buffer allocation" to
	the asoc tree
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

   ASoC: dwc: Use managed buffer allocation

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

From fcf306efab32975e4f8bdf5e9d3e7c34fe4ce48c Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:54 +0100
Subject: [PATCH] ASoC: dwc: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
hw_free and pcm_destruct ops became empty and got removed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-4-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/dwc-pcm.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index bf36c1d29642..4b25aca3804f 100644
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
@@ -256,27 +244,19 @@ static int dw_pcm_new(struct snd_soc_component *component,
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
 	.hw_params	= dw_pcm_hw_params,
-	.hw_free	= dw_pcm_hw_free,
 	.trigger	= dw_pcm_trigger,
 	.pointer	= dw_pcm_pointer,
 	.pcm_construct	= dw_pcm_new,
-	.pcm_destruct	= dw_pcm_free,
 };
 
 int dw_pcm_register(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
