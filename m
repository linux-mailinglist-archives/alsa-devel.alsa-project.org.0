Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA6195A00
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:36:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51A6166B;
	Fri, 27 Mar 2020 16:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51A6166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323410;
	bh=F5gOv9fTqMGEDj48fZUMD0I5Itb8kwU9thmcfGBpd+U=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nhw/Lbh6UAJ9V3I6YUG0cK7XIqDhywkF4lTOD7Wk56mk76567RnbeoZnf/xqTHvbY
	 JW6K0b+QKv1Z9WW/8zxD2ZJvd0aEdHHldh2HWrDwEA9wext/IlKpKxP9Ce4qHsUWih
	 zokNajsLkwK05gSG/3J7eYA6ujhTRZzUAPCSIbJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F38CDF80291;
	Fri, 27 Mar 2020 16:33:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C676BF8028C; Fri, 27 Mar 2020 16:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C1991F801DA
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1991F801DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DBA8101E;
 Fri, 27 Mar 2020 08:33:36 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A033F71F;
 Fri, 27 Mar 2020 08:33:35 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:33:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda-ctrl: add reset cycle before parsing
 capabilities" to the asoc tree
In-Reply-To: <20200325215027.28716-12-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325215027.28716-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: SOF: Intel: hda-ctrl: add reset cycle before parsing capabilities

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

From f09e9c7f6331a5a8a5f48ac3d118b641210cbd16 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Mar 2020 16:50:27 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-ctrl: add reset cycle before parsing
 capabilities

Without this cycle, HDaudio capability parsing fails on some devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-12-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index f88dbcc4ba66..6288b2f99540 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -65,15 +65,32 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	u32 cap, offset, feature;
 	int count = 0;
+	int ret;
+
+	/*
+	 * On some devices, one reset cycle is necessary before reading
+	 * capabilities
+	 */
+	ret = hda_dsp_ctrl_link_reset(sdev, true);
+	if (ret < 0)
+		return ret;
+	ret = hda_dsp_ctrl_link_reset(sdev, false);
+	if (ret < 0)
+		return ret;
 
 	offset = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_LLCH);
 
 	do {
-		cap = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, offset);
-
 		dev_dbg(sdev->dev, "checking for capabilities at offset 0x%x\n",
 			offset & SOF_HDA_CAP_NEXT_MASK);
 
+		cap = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, offset);
+
+		if (cap == -1) {
+			dev_dbg(bus->dev, "Invalid capability reg read\n");
+			break;
+		}
+
 		feature = (cap & SOF_HDA_CAP_ID_MASK) >> SOF_HDA_CAP_ID_OFF;
 
 		switch (feature) {
@@ -106,8 +123,8 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 			bus->mlcap = bus->remap_addr + offset;
 			break;
 		default:
-			dev_vdbg(sdev->dev, "found capability %d at 0x%x\n",
-				 feature, offset);
+			dev_dbg(sdev->dev, "found capability %d at 0x%x\n",
+				feature, offset);
 			break;
 		}
 
-- 
2.20.1

