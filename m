Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E122194725
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:09:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0508166B;
	Thu, 26 Mar 2020 20:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0508166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249774;
	bh=TiB3+XCwwVN0hKu4rQ5rlT/2AvbbLvqMjTtmHi6CmPs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o7WRhfAxXzxyZzUW6VauQNpThx0xMvOvP1k4FyiXGCK1HspUZxUtTkkZJRwuV6chO
	 NIQNc50FFw7RNsKqPOg3m58RQz0kATrsmgaEsS3vGi122/c25mBrzZkTcYkxNZJ2vD
	 5O7YutJU1wC8YBD6U5+9OSBjlgwTeooUw68e7K6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E133DF802BE;
	Thu, 26 Mar 2020 20:05:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 422AFF802BD; Thu, 26 Mar 2020 20:05:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8387BF802A8
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8387BF802A8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D65D87FA;
 Thu, 26 Mar 2020 12:05:06 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6763F71F;
 Thu, 26 Mar 2020 12:05:06 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: do not leave clock gating off upon
 error" to the asoc tree
In-Reply-To: <20200325211233.27394-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325211233.27394-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

   ASoC: SOF: Intel: hda: do not leave clock gating off upon error

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

From aae5a6e92f3f3411fdf6abcf41ecadd771abaa4b Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Wed, 25 Mar 2020 16:12:32 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: do not leave clock gating off upon
 error

The misc clock gating (MISCBDCGE) is disabled for controller reset and
reenabled once reset is complete.

Fix the case when error happens during reset, and clock gating is
left disabled. The clock gating should be reenabled also in this case.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200325211233.27394-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 871b71a15a63..93be6fc51ccd 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -183,7 +183,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		ret = hda_dsp_ctrl_link_reset(sdev, true);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to reset HDA controller\n");
-			return ret;
+			goto err;
 		}
 
 		usleep_range(500, 1000);
@@ -192,7 +192,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		ret = hda_dsp_ctrl_link_reset(sdev, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
-			return ret;
+			goto err;
 		}
 
 		usleep_range(1000, 1200);
@@ -202,7 +202,8 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 	/* check to see if controller is ready */
 	if (!snd_hdac_chip_readb(bus, GCTL)) {
 		dev_dbg(bus->dev, "controller not ready!\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err;
 	}
 
 	/* Accept unsolicited responses */
@@ -268,6 +269,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 
 	bus->chip_init = true;
 
+err:
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
 
 	return ret;
-- 
2.20.1

