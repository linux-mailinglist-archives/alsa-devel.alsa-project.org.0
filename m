Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA411B9E0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C1CC166B;
	Wed, 11 Dec 2019 18:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C1CC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084685;
	bh=2Iera4Uq025pfSMqzblZMG0GvLRMb3ZijTE0nwiJ5JA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=APvfEnLiWZt/SLZW8enFLn4hr/MvSjgN68xzi+7QnKjQQnx0qMW1kOxaG8E509Y5c
	 vEhHlXlSE9im3ORN+w1xKI3mHEvq8ZK1qAJbnKxCJZVhfn3V10YNpM3doLM/xFJ+Oz
	 WCKuyk2mgj+qKr46wUjLf8KvZKUm2zTLP7fKLlrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 964F4F80437;
	Wed, 11 Dec 2019 17:54:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 159E5F803F4; Wed, 11 Dec 2019 17:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 92D2AF803CD
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D2AF803CD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D67231B;
 Wed, 11 Dec 2019 08:54:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF523F52E;
 Wed, 11 Dec 2019 08:54:30 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-12-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-12-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] Applied "ASoC: pxa: Drop superfluous ioctl PCM ops" to
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

   ASoC: pxa: Drop superfluous ioctl PCM ops

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

From 92e63b552822b51aac65348b7ae46749590a3c8e Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:54 +0100
Subject: [PATCH] ASoC: pxa: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210145406.21419-12-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/mmp-pcm.c     | 1 -
 sound/soc/pxa/pxa-ssp.c     | 1 -
 sound/soc/pxa/pxa2xx-ac97.c | 1 -
 sound/soc/pxa/pxa2xx-i2s.c  | 1 -
 sound/soc/pxa/pxa2xx-pcm.c  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 54a4c9213e83..287b5da739e5 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -225,7 +225,6 @@ static const struct snd_soc_component_driver mmp_soc_component = {
 	.name		= DRV_NAME,
 	.open		= mmp_pcm_open,
 	.close		= mmp_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= mmp_pcm_hw_params,
 	.trigger	= mmp_pcm_trigger,
 	.pointer	= mmp_pcm_pointer,
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 76fdce54f007..f37ea0fb4f3f 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -873,7 +873,6 @@ static const struct snd_soc_component_driver pxa_ssp_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 31e81a6f616f..22fe77955c2c 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -208,7 +208,6 @@ static const struct snd_soc_component_driver pxa_ac97_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index e77d707efde7..d9d366a8df11 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -364,7 +364,6 @@ static const struct snd_soc_component_driver pxa_i2s_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 07b3455a6f23..2b7839715dd5 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -22,7 +22,6 @@ static const struct snd_soc_component_driver pxa2xx_soc_platform = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
