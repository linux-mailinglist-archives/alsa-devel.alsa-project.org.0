Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D81189F0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C92F165F;
	Tue, 10 Dec 2019 14:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C92F165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984916;
	bh=x7DNL0H7KIreqHka0KdL1J6mp2tql1UqPisIeYAzLKw=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Y99JG931ugLW/lfNLYAIx6BLvQOhvJOA/s+ElNzwLPx1XHEuGoeoulD/sUBWiBT6p
	 mdBGlu0NeNJPMkbo3tqZs5YoQ+OPX2tDKH90l6CtFcrOk33Zgf2JvKF3qTgkLqRLgi
	 AkAQTeRF6gbvmoTA1sHFp+VxS0GQ6XzM4ENcx1+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1997CF80323;
	Tue, 10 Dec 2019 14:23:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5988CF80317; Tue, 10 Dec 2019 14:23:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D8F6EF802F7
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F6EF802F7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F151045;
 Tue, 10 Dec 2019 05:23:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891CA3F52E;
 Tue, 10 Dec 2019 05:23:11 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191210004854.16845-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210004854.16845-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: add codec_mask module
	parameter" to the asoc tree
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

   ASoC: SOF: Intel: add codec_mask module parameter

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

From 4f6250b82cb8f950a1b1bea62843a88bbb208187 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon, 9 Dec 2019 18:48:51 -0600
Subject: [PATCH] ASoC: SOF: Intel: add codec_mask module parameter

Add a module parameter 'codec_mask' to filter out unwanted
HDA codecs from driver probe. E.g. on most systems,
codec_mask=4 will limit to HDMI audio and exclude any
external HDA codecs.

Similar to 'probe_mask' module parameter of snd-hda-intel.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191210004854.16845-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index df1909e1d950..871b71a15a63 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -15,11 +15,18 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include "../ops.h"
 #include "hda.h"
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static int hda_codec_mask = -1;
+module_param_named(codec_mask, hda_codec_mask, int, 0444);
+MODULE_PARM_DESC(codec_mask, "SOF HDA codec mask for probing");
+#endif
+
 /*
  * HDA Operations.
  */
@@ -206,6 +213,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
 		dev_dbg(bus->dev, "codec_mask = 0x%lx\n", bus->codec_mask);
 	}
+
+	if (hda_codec_mask != -1) {
+		bus->codec_mask &= hda_codec_mask;
+		dev_dbg(bus->dev, "filtered codec_mask = 0x%lx\n",
+			bus->codec_mask);
+	}
 #endif
 
 	/* clear stream status */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
