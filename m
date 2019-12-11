Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE211B986
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49741676;
	Wed, 11 Dec 2019 18:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49741676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083788;
	bh=rykhr9LXfv8d9HBNa+ShnfwyNQ/5UwfxZWzIdvVFNbU=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RDOtxBob+gnjVNcdGXKsKqm1bGWoHyD0PY0ZiMl2d0AlOx0J6mu8VhNtqGXOVBwSE
	 Ls2U1vOdTTsUx5IajYjK0ZNHuB5c2fRDgMW4lLKPoTQFoznpXXOX/5PBCxdTq0Vu34
	 CtNdZngb/GcAOaUkmMhqzVO2spM7XSjyDR0EQtLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B7AF802FB;
	Wed, 11 Dec 2019 17:53:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D02F802E7; Wed, 11 Dec 2019 17:53:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 78DEFF802DC
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DEFF802DC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E176D31B;
 Wed, 11 Dec 2019 08:53:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61D6E3F52E;
 Wed, 11 Dec 2019 08:53:36 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-17-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-17-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: Max Filippov <jcmvbkbc@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: xtensa: Use managed buffer allocation"
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

   ASoC: xtensa: Use managed buffer allocation

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

From bfddcaffd8858973385ec11c6051bb04fa685e6c Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:26:07 +0100
Subject: [PATCH] ASoC: xtensa: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-17-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/xtensa/xtfpga-i2s.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 5dae9c8583b7..bcf442faff7c 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -390,7 +390,6 @@ static int xtfpga_pcm_hw_params(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *hw_params)
 {
-	int ret;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xtfpga_i2s *i2s = runtime->private_data;
 	unsigned channels = params_channels(hw_params);
@@ -422,9 +421,7 @@ static int xtfpga_pcm_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	ret = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	return ret;
+	return 0;
 }
 
 static int xtfpga_pcm_trigger(struct snd_soc_component *component,
@@ -472,8 +469,8 @@ static int xtfpga_pcm_new(struct snd_soc_component *component,
 	struct snd_card *card = rtd->card->snd_card;
 	size_t size = xtfpga_pcm_hardware.buffer_bytes_max;
 
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
-					      card->dev, size, size);
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, size, size);
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
