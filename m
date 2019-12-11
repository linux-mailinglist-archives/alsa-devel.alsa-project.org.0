Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39B11B9F1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:20:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E57C168F;
	Wed, 11 Dec 2019 18:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E57C168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084806;
	bh=9DlrSJ7XSfy7HSPqsqRIT5sTUwpzzdmJJYtlFZiuNxQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tQ15cBcwDmXHFnnW8TL0fvBoCz2KjYffs/OB82f1qX4CsEGE7jjE3JX1vFVKZ0DdS
	 OpJ/62tUFbvO/BHbCxoe5R9YPRuvB6YRNng0c5gOOlZ2nLOXXZrYPSxvuG+EaVm7aK
	 RB7WGy3AhNd9HXoNl5d0B/240g10vDaiT0g6mZoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC6DF8045F;
	Wed, 11 Dec 2019 17:54:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF29F80442; Wed, 11 Dec 2019 17:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E498FF803DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E498FF803DF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ED9230E;
 Wed, 11 Dec 2019 08:54:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D23793F52E;
 Wed, 11 Dec 2019 08:54:37 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-9-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-9-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: Drop superfluous ioctl PCM
	ops" to the asoc tree
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

   ASoC: kirkwood: Drop superfluous ioctl PCM ops

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

From 13fd6f07f5b1cab528271f908df531a49e0bdcde Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:51 +0100
Subject: [PATCH] ASoC: kirkwood: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210145406.21419-9-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index e28fb3449f1d..f882b4003edf 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -316,7 +316,6 @@ const struct snd_soc_component_driver kirkwood_soc_component = {
 	.name		= DRV_NAME,
 	.open		= kirkwood_dma_open,
 	.close		= kirkwood_dma_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= kirkwood_dma_hw_params,
 	.hw_free	= kirkwood_dma_hw_free,
 	.prepare	= kirkwood_dma_prepare,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
