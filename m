Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC711B9E5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:18:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23FC3168F;
	Wed, 11 Dec 2019 18:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23FC3168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084724;
	bh=IXZELkDXpGefJzNce5nCzzhWHeB19WhaHMAX+xD3Jl0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f7qt9nx+aPoj3r8VSvgyFGNxm4ptjHQnS17yadwcwdtcCblgPXrx3Nb7AaeB9mGc+
	 b0LEi4ou6qiHnST2cHY0fSR5UvcL+30JDcURHQXU2WKEBY4/FUK5Qr4cJfo0MSReSp
	 4YxFQ0N3JbHm3YJcjRL/v/P4IaVM1Na4NDzrAsxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A37F80429;
	Wed, 11 Dec 2019 17:54:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E26F80405; Wed, 11 Dec 2019 17:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 43E32F803DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E32F803DF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FF331B;
 Wed, 11 Dec 2019 08:54:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 009BE3F52E;
 Wed, 11 Dec 2019 08:54:32 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-11-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-11-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] Applied "ASoC: meson: Drop superfluous ioctl PCM ops"
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

   ASoC: meson: Drop superfluous ioctl PCM ops

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

From a984e214de0c5d592a50bc6bd04b32a335d48a55 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:53 +0100
Subject: [PATCH] ASoC: meson: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191210145406.21419-11-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-frddr.c | 3 ---
 sound/soc/meson/axg-toddr.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 665d75d49d7b..0a7d41257a38 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -151,7 +151,6 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= axg_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -275,7 +274,6 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -345,7 +343,6 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 7fef0b961496..f6023397c8fe 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -183,7 +183,6 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= axg_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -222,7 +221,6 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -292,7 +290,6 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(sm1_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
