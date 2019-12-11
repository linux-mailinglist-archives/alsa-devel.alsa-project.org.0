Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287C11B95F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C7F1666;
	Wed, 11 Dec 2019 17:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C7F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083476;
	bh=bODmcFLgZfc9pb84CZFE3blH8iPFGPACfPzcjrR3OwM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sCDxat8aKhh+QOie24g5OjoBnxFNymoYCtp6BfghjvyP8QkOciRRufHjHWb0nUBwU
	 mcipN8KJ/zLZx93UVAfTcpfU/6OwLOvTXJGg/+XV7MYTYDZ2xXziZc6fZzInEbQYnC
	 4m1nT5qhUyw4yWWo5NMjaRNQwl7nsSxJxuF1Xaio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B23F8027B;
	Wed, 11 Dec 2019 17:53:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83DB7F8026A; Wed, 11 Dec 2019 17:53:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2CBD7F80260
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBD7F80260
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C83E31B;
 Wed, 11 Dec 2019 08:53:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A973F52E;
 Wed, 11 Dec 2019 08:53:16 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-8-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-8-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsi: Use managed buffer allocation" to
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

   ASoC: fsi: Use managed buffer allocation

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

From 55df47f2300e7cdb2bb3ca1209ec0b938459fc8f Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:58 +0100
Subject: [PATCH] ASoC: fsi: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-8-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/fsi.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index e384fdc8d60e..1cebddd76d12 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1732,20 +1732,6 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 	return ret;
 }
 
-static int fsi_hw_params(struct snd_soc_component *component,
-			 struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-static int fsi_hw_free(struct snd_soc_component *component,
-		       struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
 				     struct snd_pcm_substream *substream)
 {
@@ -1765,7 +1751,7 @@ static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
 static int fsi_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
-	snd_pcm_lib_preallocate_pages_for_all(
+	snd_pcm_set_managed_buffer_all(
 		rtd->pcm,
 		SNDRV_DMA_TYPE_DEV,
 		rtd->card->snd_card->dev,
@@ -1816,8 +1802,6 @@ static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
 	.open		= fsi_pcm_open,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
-	.hw_params	= fsi_hw_params,
-	.hw_free	= fsi_hw_free,
 	.pointer	= fsi_pointer,
 	.pcm_construct	= fsi_pcm_new,
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
