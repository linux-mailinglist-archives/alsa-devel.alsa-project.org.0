Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2216159482
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BD1166E;
	Tue, 11 Feb 2020 17:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BD1166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437505;
	bh=7QAJR0IufwyJxaG7GLGnwuWXV1BcQGqGzKQV9Z8P1FY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hcr27b2TpskHzBg2GxqsxpShw/zse5R1cUF5lPN+kcxxCak6DeONwodBNIeJ4u2bg
	 qmA8Fr1qcUFiWEPiyAV7qr5GUp4Bdjp862fI6VM9WPJzFgNsK0+HLN/m855nvX6Q7h
	 ERUeFnNAc8CGcPMwApkRcvlW1xmf9cSqs9eGMcMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D0DCF80436;
	Tue, 11 Feb 2020 16:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D282F803F9; Tue, 11 Feb 2020 16:49:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D30BCF803DF
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30BCF803DF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CF5813D5;
 Tue, 11 Feb 2020 07:49:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D933F68E;
 Tue, 11 Feb 2020 07:49:47 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Derek Fang <derek.fang@realtek.com>
In-Reply-To: <1580970133-14089-1-git-send-email-derek.fang@realtek.com>
Message-Id: <applied-1580970133-14089-1-git-send-email-derek.fang@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rl6231: Add new supports on rl6231" to
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

   ASoC: rl6231: Add new supports on rl6231

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From bbf53b95ed9521625e5867522cc057bd8f1320b1 Mon Sep 17 00:00:00 2001
From: Derek Fang <derek.fang@realtek.com>
Date: Thu, 6 Feb 2020 14:22:13 +0800
Subject: [PATCH] ASoC: rl6231: Add new supports on rl6231

1. Increases the max limit of PLL input frequency
   on RL6231 shared support.
2. Add a new pll preset map.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/1580970133-14089-1-git-send-email-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rl6231.c | 1 +
 sound/soc/codecs/rl6231.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rl6231.c b/sound/soc/codecs/rl6231.c
index a887d5ccb10d..d181c217d835 100644
--- a/sound/soc/codecs/rl6231.c
+++ b/sound/soc/codecs/rl6231.c
@@ -102,6 +102,7 @@ struct pll_calc_map {
 static const struct pll_calc_map pll_preset_table[] = {
 	{19200000,  4096000,  23, 14, 1, false},
 	{19200000,  24576000,  3, 30, 3, false},
+	{3840000,   24576000,  3, 30, 0, true},
 };
 
 static unsigned int find_best_div(unsigned int in,
diff --git a/sound/soc/codecs/rl6231.h b/sound/soc/codecs/rl6231.h
index 31a9643b0afd..6d8ed0377296 100644
--- a/sound/soc/codecs/rl6231.h
+++ b/sound/soc/codecs/rl6231.h
@@ -10,7 +10,7 @@
 #ifndef __RL6231_H__
 #define __RL6231_H__
 
-#define RL6231_PLL_INP_MAX	40000000
+#define RL6231_PLL_INP_MAX	50000000
 #define RL6231_PLL_INP_MIN	256000
 #define RL6231_PLL_N_MAX	0x1ff
 #define RL6231_PLL_K_MAX	0x1f
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
