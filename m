Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7714CFF5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92CB61687;
	Wed, 29 Jan 2020 18:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92CB61687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580320601;
	bh=D9/dk7ZDYpfybQt7GQwHC7Tw3fRs7NWN8hpqim3Pkgg=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hi2v5RbcwZVUI5vPV6HyJNel5FsztOqebA5gxJIeRnQm4AbYos2/HILna3brfGq/n
	 j96jdvqPyBadWsTm3ZKupgtqLL2CzltWn1xnpvE2SvTfyT/NkCtasnsYDu7h0RyOyi
	 XTiB9OMi5iY1mt+iF/dd3R2ZTJiFeJnvGiPoCD6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48BABF80253;
	Wed, 29 Jan 2020 18:54:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A44F3F8023F; Wed, 29 Jan 2020 18:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 36664F8023F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36664F8023F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFA4328;
 Wed, 29 Jan 2020 09:54:20 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B79FE3F67D;
 Wed, 29 Jan 2020 09:54:18 -0800 (PST)
Date: Wed, 29 Jan 2020 17:54:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200127192831.14057-3-tiwai@suse.de>
Message-Id: <applied-20200127192831.14057-3-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt700: Add __maybe_unused to PM
	callbacks" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============1851433537731327082=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============1851433537731327082==
Content-Type: text/plain

The patch

   ASoC: rt700: Add __maybe_unused to PM callbacks

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

From 809a9b63323278e94f73d8b1f85b64e347f639ba Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 Jan 2020 20:28:29 +0100
Subject: [PATCH] ASoC: rt700: Add __maybe_unused to PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the compile warnings by adding __maybe_unused to PM callbacks:
  sound/soc/codecs/rt700-sdw.c:503:12: warning: ‘rt700_dev_resume’ defined but not used [-Wunused-function]
  sound/soc/codecs/rt700-sdw.c:489:12: warning: ‘rt700_dev_suspend’ defined but not used [-Wunused-function]

Fixes: 7d2a5f9ae41e ("ASoC: rt700: add rt700 codec driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200127192831.14057-3-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt700-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index a4b95425886f..d4e0f953bcce 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -486,7 +486,7 @@ static const struct sdw_device_id rt700_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt700_id);
 
-static int rt700_dev_suspend(struct device *dev)
+static int __maybe_unused rt700_dev_suspend(struct device *dev)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
 
@@ -500,7 +500,7 @@ static int rt700_dev_suspend(struct device *dev)
 
 #define RT700_PROBE_TIMEOUT 2000
 
-static int rt700_dev_resume(struct device *dev)
+static int __maybe_unused rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
-- 
2.20.1


--===============1851433537731327082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1851433537731327082==--
