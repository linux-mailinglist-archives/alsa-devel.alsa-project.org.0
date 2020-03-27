Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EDB195A03
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:37:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8F2167A;
	Fri, 27 Mar 2020 16:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8F2167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323428;
	bh=Ya3HsJty2c7Rcc6MSbgmBnrHTkfuGQO8uXIYAVoFNTM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SFb/eKqbp0tuFv0x/GWu38yHvcFOSFRsTp6gV4b9riVRqblTZmSKwpvo4Mg0FdVMb
	 hu0OcQkksKRVQf17PmuhdD6ZEBXmV/krEdrU60NPTRF5jnG5vLtm4XUS/errzhtL9d
	 BoPT4SFxtQP8LiyPG6uYzNbDW4l/FYhjfoDKixcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E148F8029B;
	Fri, 27 Mar 2020 16:33:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DC6F80299; Fri, 27 Mar 2020 16:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EDDAF8011B
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDDAF8011B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAA6E1FB;
 Fri, 27 Mar 2020 08:33:40 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E73A3F71F;
 Fri, 27 Mar 2020 08:33:40 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:33:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Rander Wang <rander.wang@intel.com>
Subject: Applied "Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in
 irq thread" to the asoc tree
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

   Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in irq thread

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

From 90de3281c86ae5378e951e84c76c4759390ff34d Mon Sep 17 00:00:00 2001
From: Rander Wang <rander.wang@intel.com>
Date: Wed, 25 Mar 2020 16:50:26 -0500
Subject: [PATCH] Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in
 irq thread

If pci device is in D0, wakeen interrupt will be
aggregated at cAVS level as interrupt. This commit
check the wakeen status and process it in irq thread

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-11-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7d1aa4c7d82c..211e91e79eae 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -241,6 +241,19 @@ static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return sdw_intel_thread(irq, context);
 }
 
+static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+	if (hdev->sdw &&
+	    snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+			     HDA_DSP_REG_SNDW_WAKE_STS))
+		return true;
+
+	return false;
+}
+
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
@@ -684,6 +697,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_sdw_irq(sdev))
 		hda_dsp_sdw_thread(irq, hdev->sdw);
 
+	if (hda_sdw_check_wakeen_irq(sdev))
+		hda_sdw_process_wakeen(sdev);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6f1765b1ed1d..e9825798de77 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -233,6 +233,7 @@
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
 #define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+#define HDA_DSP_REG_SNDW_WAKE_STS      0x2C192
 
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
@@ -709,6 +710,11 @@ static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
+static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
-- 
2.20.1

