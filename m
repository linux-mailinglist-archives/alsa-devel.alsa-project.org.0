Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF4184C66
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55691825;
	Fri, 13 Mar 2020 17:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55691825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116658;
	bh=oOxz2CLKSuVbzB/S7Hq5oT8xpJtxiQw+znVYOD+n1cw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XVlBtVYcpuy5t5CTL6b2BPuezTMSnBW89VyyEZh9t5w+dzLY1HwzWNHJSio0nfml5
	 WrD8fk9tPqRPALwWC3BysU9nXdLr8CfNk2r5wsoBmHs3lboN5InOj2mjJ0kiIzGPs4
	 n2gYWI73BaSepXp4mNSlkpBHiAIJKradolGHUG6Y=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EF4F8013E;
	Fri, 13 Mar 2020 17:18:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E14F802DD; Fri, 13 Mar 2020 17:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 16034F8029B
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16034F8029B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A361063;
 Fri, 13 Mar 2020 09:17:52 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2800C3F6CF;
 Fri, 13 Mar 2020 09:17:52 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:17:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: remove
 SND_SOC_SOF_HDA_COMMON_HDMI_CODEC" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: SOF: Intel: hda: remove SND_SOC_SOF_HDA_COMMON_HDMI_CODEC

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

From 42c67753cae12f68b936901792ecd367e8dfca9b Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 12 Mar 2020 14:48:53 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: remove
 SND_SOC_SOF_HDA_COMMON_HDMI_CODEC

To help user-space with HDMI codec driver transition, both
a kernel module parameter and a kernel option were initially
provided to configure default behaviour of SOF on Intel hardware
with commit 139c7febad1a ("ASoC: SOF: Intel: add support for
snd-hda-codec-hdmi").

As hdac-hdmi is already now lagging in features compared to
snd-hda-codec-hdmi, move ahead with the transition and remove
the build option to select between the two, and instead default
to snd-hda-codec-hdmi if it is enabled in kernel build.

The old behaviour of using hdac-hdmi driver can still be forced
via the kernel module parameter.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312194859.4051-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig | 11 -----------
 sound/soc/sof/intel/hda.c   |  3 +--
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 3bc64dee7c39..c9a2bee4b55c 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -324,17 +324,6 @@ config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
 	  Say Y if you want to enable DMI Link L1
 	  If unsure, select "N".
 
-config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
-	bool "SOF common HDA HDMI codec driver"
-	depends on SND_SOC_SOF_HDA_LINK
-	depends on SND_HDA_CODEC_HDMI
-	default SND_HDA_CODEC_HDMI
-	help
-	  This adds support for HDMI audio by using the common HDA
-	  HDMI/DisplayPort codec driver.
-	  Say Y if you want to use the common codec driver with SOF.
-	  If unsure select "Y".
-
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7ca887041a34..1de750a1dd19 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -54,8 +54,7 @@ static int hda_dmic_num = -1;
 module_param_named(dmic_num, hda_dmic_num, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
 
-static bool hda_codec_use_common_hdmi =
-	IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC);
+static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
 module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
 MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
 #endif
-- 
2.20.1

