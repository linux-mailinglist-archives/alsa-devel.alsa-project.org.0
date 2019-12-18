Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216D1252C2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8821616;
	Wed, 18 Dec 2019 21:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8821616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576699798;
	bh=MtnPYTKkMqoZbPMkFfpdswe/+Y5nmrKnOzfWffF4FcQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VsPpVJJwEDSJ9DLj6XPY0wHQpO35G4tMYEvZJUHqTZWLgbpZooaRoy68Rb9gjyRHU
	 BsLe46muy/8pa+jtrM9Wq3KhAnD7i7CDw74fDspGk0adIDw0ghSjBFapFA1aCVzNp7
	 VnaDSz8MhrPUFLKWPkAjudYX2BgkqnCAPZzoQ7j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F759F8028E;
	Wed, 18 Dec 2019 21:05:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 181F1F8027B; Wed, 18 Dec 2019 21:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B2A9DF80272
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A9DF80272
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD7311B3;
 Wed, 18 Dec 2019 12:05:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FC0D3F67D;
 Wed, 18 Dec 2019 12:05:37 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20191218172420.1199117-5-jbrunet@baylibre.com>
Message-Id: <applied-20191218172420.1199117-5-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-fifo: relax period size
	constraints" to the asoc tree
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

   ASoC: meson: axg-fifo: relax period size constraints

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

From 42b5ac832b0c3bf5b0bf98ea6d99efa5fb5d5075 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Dec 2019 18:24:20 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: relax period size constraints

Now that the fifo depths and thresholds are properly in the axg-fifo
driver, we can relax the constraints on period. As long as the period is a
multiple of the fifo burst size (8 bytes) things should be OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191218172420.1199117-5-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c | 8 ++++----
 sound/soc/meson/axg-fifo.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c2742a02d866..c12b0d5e8ebf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -34,7 +34,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 	.rate_max = 192000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
-	.period_bytes_min = AXG_FIFO_MIN_DEPTH,
+	.period_bytes_min = AXG_FIFO_BURST,
 	.period_bytes_max = UINT_MAX,
 	.periods_min = 2,
 	.periods_max = UINT_MAX,
@@ -227,17 +227,17 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/*
 	 * Make sure the buffer and period size are multiple of the FIFO
-	 * minimum depth size
+	 * burst
 	 */
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 521b54e98fd3..b63acd723c87 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -31,8 +31,6 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
-#define AXG_FIFO_MIN_CNT		64
-#define AXG_FIFO_MIN_DEPTH		(AXG_FIFO_BURST * AXG_FIFO_MIN_CNT)
 
 #define FIFO_INT_ADDR_FINISH		BIT(0)
 #define FIFO_INT_ADDR_INT		BIT(1)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
