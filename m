Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCC165DE9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 13:54:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9285C16A3;
	Thu, 20 Feb 2020 13:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9285C16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582203278;
	bh=z9nOf1oU0xYTu/GFyQReJSfFTx4y9SLQPKyNDDGJufk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KLHEwiuArScX/Sisr1bPRWXbQCqtNavAtoCqfBcdqVOkIT1RjoDKyLC+p95bVx7Jt
	 H+oSiEr0+JnmDOu8vmhxrOt9OSSW0CVH6AGi4resBs5vOf1NAM9nSAeO1BSZpVfLh1
	 XLseLZrJs11FpvjGs0CKG8ogtbVZ3tBvabx0Rqwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8AF7F80145;
	Thu, 20 Feb 2020 13:52:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5326FF8011D; Thu, 20 Feb 2020 13:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9260CF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 13:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9260CF8011D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2968D31B;
 Thu, 20 Feb 2020 04:52:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A257B3F703;
 Thu, 20 Feb 2020 04:52:08 -0800 (PST)
Date: Thu, 20 Feb 2020 12:52:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: soc-core: fix for_rtd_codec_dai_rollback() macro" to
 the asoc tree
In-Reply-To: <20200219222130.29933-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200219222130.29933-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-core: fix for_rtd_codec_dai_rollback() macro

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

From 63d68382f5fb5f71772357e31841c19c4a133182 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 19 Feb 2020 16:21:30 -0600
Subject: [PATCH] ASoC: soc-core: fix for_rtd_codec_dai_rollback() macro

The use of parentheses to protect the argument is fine for (i)++ but
not for (--i).

Fixes: 83f94a2e293d61 ("ASoC: soc-core: add snd_soc_close_delayed_work()")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200219222130.29933-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..8a2266676b2d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1157,7 +1157,7 @@ struct snd_soc_pcm_runtime {
 	     ((i) < rtd->num_codecs) && ((dai) = rtd->codec_dais[i]); \
 	     (i)++)
 #define for_each_rtd_codec_dai_rollback(rtd, i, dai)		\
-	for (; ((--i) >= 0) && ((dai) = rtd->codec_dais[i]);)
+	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
-- 
2.20.1

