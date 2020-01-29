Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3514CFF1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1200C168A;
	Wed, 29 Jan 2020 18:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1200C168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580320510;
	bh=rNo9FWbjqlddfd/6/U9BFZOuMHuAOEpq+kiEJ0r4m1s=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VqH1zhAxM2K9sEJfWehuUoIxs11xlkR1VDlp/LRD+56F/8t3lrY7kd5/DgNMaFl9z
	 a9sQ9syidNAvk8X/fzywdtDQkZ4jpdqllMlrlPcRueydSkFaQTTtsq6CWJTSwRZiVA
	 re29CAY0bZb4RiulO9+If/Yxe/NRkGGBCV6kVeI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05744F80122;
	Wed, 29 Jan 2020 18:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4134DF80234; Wed, 29 Jan 2020 18:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 83539F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83539F80123
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75974328;
 Wed, 29 Jan 2020 09:54:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8CA3F67D;
 Wed, 29 Jan 2020 09:54:03 -0800 (PST)
Date: Wed, 29 Jan 2020 17:54:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200127192831.14057-5-tiwai@suse.de>
Message-Id: <applied-20200127192831.14057-5-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt715: Add __maybe_unused to PM
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
Content-Type: multipart/mixed; boundary="===============0442453214721352996=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============0442453214721352996==
Content-Type: text/plain

The patch

   ASoC: rt715: Add __maybe_unused to PM callbacks

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

From 4099c3295e480907e37b93d51fc17fda81dd5bed Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 Jan 2020 20:28:31 +0100
Subject: [PATCH] ASoC: rt715: Add __maybe_unused to PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the compile warnings by adding __maybe_unused to PM callbacks:
  sound/soc/codecs/rt715-sdw.c:566:12: warning: ‘rt715_dev_resume’ defined but not used [-Wunused-function]
  sound/soc/codecs/rt715-sdw.c:552:12: warning: ‘rt715_dev_suspend’ defined but not used [-Wunused-function]

Fixes: d1ede0641b05 ("ASoC: rt715: add RT715 codec driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200127192831.14057-5-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt715-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 6d892c44c522..64ef56ef0318 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -549,7 +549,7 @@ static const struct sdw_device_id rt715_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt715_id);
 
-static int rt715_dev_suspend(struct device *dev)
+static int __maybe_unused rt715_dev_suspend(struct device *dev)
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
 
@@ -563,7 +563,7 @@ static int rt715_dev_suspend(struct device *dev)
 
 #define RT715_PROBE_TIMEOUT 2000
 
-static int rt715_dev_resume(struct device *dev)
+static int __maybe_unused rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
-- 
2.20.1


--===============0442453214721352996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0442453214721352996==--
