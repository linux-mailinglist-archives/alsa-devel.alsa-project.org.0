Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3962B11B949
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6282166D;
	Wed, 11 Dec 2019 17:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6282166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083345;
	bh=qhFim6TNqC8r0NpS2s3F8XyHvAdEUcEBW7vh3ufITE0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CtXthd34NL5psj4+Zhhy4s4ha8+tHsrTO0rSGc4N/y8Jn6WkEHMu0tgM36w7w+ECt
	 L+9Smzhxezg99aDT1mdcQgpjLWa5/kR1f9KlqWSMS2fjLslysyuu44LoOqWHGlG143
	 71cFrrEOMkx7P5Tt+aQdhd+MPvxKvMERnZKwqp+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1CCDF8025E;
	Wed, 11 Dec 2019 17:53:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9CCAF80256; Wed, 11 Dec 2019 17:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D8F81F80240
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F81F80240
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC61E30E;
 Wed, 11 Dec 2019 08:53:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B01C3F52E;
 Wed, 11 Dec 2019 08:53:09 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-15-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-15-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sh: Drop superfluous ioctl PCM ops" to
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

   ASoC: sh: Drop superfluous ioctl PCM ops

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

From e91f134c83b1b3319db4c14bb5d9d23dc567b283 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:57 +0100
Subject: [PATCH] ASoC: sh: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210145406.21419-15-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/dma-sh7760.c | 1 -
 sound/soc/sh/fsi.c        | 1 -
 sound/soc/sh/rcar/core.c  | 1 -
 sound/soc/sh/siu_pcm.c    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 4d0f2f738ffa..eee1a1e994cb 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -307,7 +307,6 @@ static int camelot_pcm_new(struct snd_soc_component *component,
 static const struct snd_soc_component_driver sh7760_soc_component = {
 	.open		= camelot_pcm_open,
 	.close		= camelot_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= camelot_hw_params,
 	.prepare	= camelot_prepare,
 	.trigger	= camelot_trigger,
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 1cebddd76d12..89119acfa911 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1801,7 +1801,6 @@ static struct snd_soc_dai_driver fsi_soc_dai[] = {
 static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
 	.open		= fsi_pcm_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= fsi_pointer,
 	.pcm_construct	= fsi_pcm_new,
 };
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 3dfc02092f76..0bfcb77e5f65 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1652,7 +1652,6 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
  */
 static const struct snd_soc_component_driver rsnd_soc_component = {
 	.name		= "rsnd",
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= rsnd_hw_params,
 	.hw_free	= rsnd_hw_free,
 	.pointer	= rsnd_pointer,
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 65637ad93630..6a6ffd6d3192 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -548,7 +548,6 @@ struct const snd_soc_component_driver siu_component = {
 	.name		= DRV_NAME,
 	.open		= siu_pcm_open,
 	.close		= siu_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.prepare	= siu_pcm_prepare,
 	.trigger	= siu_pcm_trigger,
 	.pointer	= siu_pcm_pointer_dma,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
