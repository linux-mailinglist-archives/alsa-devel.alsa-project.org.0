Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4610C961
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:21:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0A916E5;
	Thu, 28 Nov 2019 14:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0A916E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574947304;
	bh=K+NAY8si11dnJkqTBuzyZkttyV119ciDY02ZOXt2TR8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GSoOexsDnkLZgd006YAN9spZhdOZYNw7VYQb+yTGiKMFF0NxYcwcEfs54nXjpRnpY
	 NixTm/eg/se4a6KRWSn9+pGTGNut1t4DSDAfHWz0wu2GDoJau4sFVuOqse/7fEpDI6
	 /mfQ6Nfytyt5Z3tmQwKsxByww5pSJPOgHghxM21Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FD1F80228;
	Thu, 28 Nov 2019 14:18:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEDCCF801F2; Thu, 28 Nov 2019 14:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 317B0F801ED
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317B0F801ED
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10D4D30E;
 Thu, 28 Nov 2019 05:18:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B453F52E;
 Thu, 28 Nov 2019 05:18:27 -0800 (PST)
Date: Thu, 28 Nov 2019 13:18:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20191122073114.219945-2-tzungbi@google.com>
Message-Id: <applied-20191122073114.219945-2-tzungbi@google.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, cychiang@google.com,
 pierre-louis.bossart@linux.intel.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: max98090: remove msleep in PLL unlocked
	workaround" to the asoc tree
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

   ASoC: max98090: remove msleep in PLL unlocked workaround

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From acb874a7c049ec49d8fc66c893170fb42c01bdf7 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 22 Nov 2019 15:31:12 +0800
Subject: [PATCH] ASoC: max98090: remove msleep in PLL unlocked workaround

It was observed Baytrail-based chromebooks could cause continuous PLL
unlocked when using playback stream and capture stream simultaneously.
Specifically, starting a capture stream after started a playback stream.
As a result, the audio data could corrupt or turn completely silent.

As the datasheet suggested, the maximum PLL lock time should be 7 msec.
The workaround resets the codec softly by toggling SHDN off and on if
PLL failed to lock for 10 msec.  Notably, there is no suggested hold
time for SHDN off.

On Baytrail-based chromebooks, it would easily happen continuous PLL
unlocked if there is a 10 msec delay between SHDN off and on.  Removes
the msleep().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191122073114.219945-2-tzungbi@google.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index f6bf4cfbea23..12cb87c0d463 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2114,10 +2114,16 @@ static void max98090_pll_work(struct work_struct *work)
 
 	dev_info_ratelimited(component->dev, "PLL unlocked\n");
 
+	/*
+	 * As the datasheet suggested, the maximum PLL lock time should be
+	 * 7 msec.  The workaround resets the codec softly by toggling SHDN
+	 * off and on if PLL failed to lock for 10 msec.  Notably, there is
+	 * no suggested hold time for SHDN off.
+	 */
+
 	/* Toggle shutdown OFF then ON */
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
-	msleep(10);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
