Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9057163887
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:28:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F331712;
	Wed, 19 Feb 2020 01:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F331712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582072113;
	bh=+ng/STmgaVR7Cot9pXbQ2wXAoEuudGZ3aFb2ykc4jog=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mrM/I5MZNU85deFVKJtYQxQV0YMv30ttR0rJf6+jOuu5aXVTTACXwRg5jNb38pmyj
	 wvVL33+uFsL9FjD7e/WLhdsLS4xRrkNqSNebGKumY1ZR5kvjKiHdvS+XMbJn0cNhSg
	 UU4XHJpf44+ly28UjeNu/VhJ1TqvXqqVCwETrs2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D663F803BD;
	Wed, 19 Feb 2020 01:11:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC1FF803BC; Wed, 19 Feb 2020 01:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 817D4F803B0
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817D4F803B0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4241FEC;
 Tue, 18 Feb 2020 16:11:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 391F33F68F;
 Tue, 18 Feb 2020 16:11:19 -0800 (PST)
Date: Wed, 19 Feb 2020 00:11:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tas2562: Return invalid for when bitwidth is invalid"
 to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: tas2562: Return invalid for when bitwidth is invalid

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 310006cab991fa895cc3a42c53609778b0d50d46 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Tue, 18 Feb 2020 12:52:52 -0600
Subject: [PATCH] ASoC: tas2562: Return invalid for when bitwidth is invalid

If the bitwidth passed in to the set_bitwidth function is not supported
then return an error.

Fixes: 29b74236bd57 ("ASoC: tas2562: Introduce the TAS2562 amplifier")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200218185252.26290-1-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 729acd874c48..5b4803a76719 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -215,7 +215,8 @@ static int tas2562_set_bitwidth(struct tas2562_data *tas2562, int bitwidth)
 		break;
 
 	default:
-		dev_info(tas2562->dev, "Not supported params format\n");
+		dev_info(tas2562->dev, "Unsupported bitwidth format\n");
+		return -EINVAL;
 	}
 
 	ret = snd_soc_component_update_bits(tas2562->component,
-- 
2.20.1

