Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EF11B99D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:07:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808F31614;
	Wed, 11 Dec 2019 18:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808F31614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084076;
	bh=UTcZHy07bhqDuuDOeuwerY6gPNG/+Jmqh9Vf/U1imU4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Aab4ImXa0X5JIAmjz2bQzYbL0PohnZFDXVcK1sBP5V93k7Mfrk7piPxXozqahjfQO
	 9HNY2Lwkj08Ky9IxYLQf6ULeTar/UhWZNA0Siid9BvsS4fZtCDmFJdYRQeS2oQslZl
	 JjpVBMxPF+76do7O28I8gkaIa4WyQaMzAWjI0WOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7C6F8034B;
	Wed, 11 Dec 2019 17:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35555F80343; Wed, 11 Dec 2019 17:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B63EEF80307
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B63EEF80307
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12BC331B;
 Wed, 11 Dec 2019 08:53:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 871A63F52E;
 Wed, 11 Dec 2019 08:53:48 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-9-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-9-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rcar: Use managed buffer allocation" to
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

   ASoC: rcar: Use managed buffer allocation

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

From e494dbcd9be743f41cf842f94ffbc7c56b6b072a Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:59 +0100
Subject: [PATCH] ASoC: rcar: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-9-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6aac25095218..3dfc02092f76 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1218,10 +1218,10 @@ static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
 	for (substream = rtd->pcm->streams[stream].substream;
 	     substream;
 	     substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream,
-					      SNDRV_DMA_TYPE_DEV,
-					      dev,
-					      PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
+		snd_pcm_set_managed_buffer(substream,
+					   SNDRV_DMA_TYPE_DEV,
+					   dev,
+					   PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
 	}
 
 	return 0;
@@ -1400,7 +1400,6 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
 	struct snd_soc_pcm_runtime *fe = substream->private_data;
-	int ret;
 
 	/*
 	 * rsnd assumes that it might be used under DPCM if user want to use
@@ -1433,12 +1432,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 			dev_dbg(dev, "convert rate     = %d\n", io->converted_rate);
 	}
 
-	ret = rsnd_dai_call(hw_params, io, substream, hw_params);
-	if (ret)
-		return ret;
-
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
+	return rsnd_dai_call(hw_params, io, substream, hw_params);
 }
 
 static int rsnd_hw_free(struct snd_soc_component *component,
@@ -1447,13 +1441,8 @@ static int rsnd_hw_free(struct snd_soc_component *component,
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
-	int ret;
-
-	ret = rsnd_dai_call(hw_free, io, substream);
-	if (ret)
-		return ret;
 
-	return snd_pcm_lib_free_pages(substream);
+	return rsnd_dai_call(hw_free, io, substream);
 }
 
 static snd_pcm_uframes_t rsnd_pointer(struct snd_soc_component *component,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
