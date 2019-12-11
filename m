Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EE11B990
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6F4166F;
	Wed, 11 Dec 2019 18:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6F4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083872;
	bh=Fbk5EZ1TyjZ6vt7G8TLxV/0TDEajCY2zVjR5rkhWHhA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GgKYqdLPPJ2duhuWMuaVCq5V9r5V8vwe6cfbeG9LYs/CvHA8GQBJSFvEJaigbKeNJ
	 URbUIAS3t/hmeQj8v2hNZj4gJK7P1ou36Bw01hGire1m3De5f1dTB0zTSCaFPB/0fq
	 8A5KWJXA80OY8Y/Ojv6nb2Vc6tUAA4LsOugE7oaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CEE1F802FE;
	Wed, 11 Dec 2019 17:53:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAD5F802FF; Wed, 11 Dec 2019 17:53:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 55C0FF802E9
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55C0FF802E9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C211330E;
 Wed, 11 Dec 2019 08:53:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42DF93F52E;
 Wed, 11 Dec 2019 08:53:41 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-14-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-14-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: txx9: Use managed buffer allocation" to
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

   ASoC: txx9: Use managed buffer allocation

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

From ffe119308cf6f174eb65e2a7c023c85178f5109c Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:26:04 +0100
Subject: [PATCH] ASoC: txx9: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The hw_free callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-14-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/txx9/txx9aclc.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 043d9ec1c2b5..dba13543911c 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -54,11 +54,6 @@ static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
-	int ret;
-
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
 
 	dev_dbg(component->dev,
 		"runtime->dma_area = %#lx dma_addr = %#lx dma_bytes = %zd "
@@ -76,12 +71,6 @@ static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int txx9aclc_pcm_hw_free(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int txx9aclc_pcm_prepare(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
@@ -306,7 +295,7 @@ static int txx9aclc_pcm_new(struct snd_soc_component *component,
 			goto exit;
 	}
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 		card->dev, 64 * 1024, 4 * 1024 * 1024);
 	return 0;
 
@@ -407,7 +396,6 @@ static const struct snd_soc_component_driver txx9aclc_soc_component = {
 	.open		= txx9aclc_pcm_open,
 	.close		= txx9aclc_pcm_close,
 	.hw_params	= txx9aclc_pcm_hw_params,
-	.hw_free	= txx9aclc_pcm_hw_free,
 	.prepare	= txx9aclc_pcm_prepare,
 	.trigger	= txx9aclc_pcm_trigger,
 	.pointer	= txx9aclc_pcm_pointer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
