Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E277A195A08
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A09167E;
	Fri, 27 Mar 2020 16:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A09167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323530;
	bh=zLOfE553cWI1C4mlLTcct8+b4Szrb6VpzBWibrpH4wY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HGXZ9jofAxU7wEebUtCt6gvD+5aoedhoJmwes0edN7cjmM5NIGGRavYgE8zB67gY8
	 2pUq2Hv6zJZcP1aILiQHtbwXkFDn3+5w+XnuFVEL4xtFq6uqNoKBeVgfjwfJdPKsSN
	 o9tlkdsF23/E4BY3X8Z3XGCQEqFfsrAMFRjbDiu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D842F802BD;
	Fri, 27 Mar 2020 16:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A099F802C4; Fri, 27 Mar 2020 16:33:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C72EF802BD
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C72EF802BD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 262691FB;
 Fri, 27 Mar 2020 08:33:54 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EAA73F71F;
 Fri, 27 Mar 2020 08:33:53 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:33:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: merge IPC,
 stream and SoundWire interrupt handlers" to the asoc tree
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

   ASoC: SOF: Intel: hda: merge IPC, stream and SoundWire interrupt handlers

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

From 722ba5f1f530a919d28a0dd9e8e0ec63af18270d Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Wed, 25 Mar 2020 16:50:23 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: merge IPC, stream and SoundWire
 interrupt handlers

We have a single irq handler for SOF interrupts. We can further merge
SoundWire ones to completely remove MSI interrupts handling issues
leading to timeouts.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 36 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h | 11 +++++++++++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dea3c385b664..ee4f1ceca883 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -198,6 +198,38 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+
+static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	bool ret = false;
+	u32 irq_status;
+
+	hdev = sdev->pdata->hw_pdata;
+
+	if (!hdev->sdw)
+		return ret;
+
+	/* store status */
+	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS2);
+
+	/* invalid message ? */
+	if (irq_status == 0xffffffff)
+		goto out;
+
+	/* SDW message ? */
+	if (irq_status & HDA_DSP_REG_ADSPIS2_SNDW)
+		ret = true;
+
+out:
+	return ret;
+}
+
+static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+{
+	return sdw_intel_thread(irq, context);
+}
+
 #endif
 
 /*
@@ -618,6 +650,7 @@ static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 
 	/* deal with streams and controller first */
 	if (hda_dsp_check_stream_irq(sdev))
@@ -626,6 +659,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_ipc_irq(sdev))
 		sof_ops(sdev)->irq_thread(irq, sdev);
 
+	if (hda_dsp_check_sdw_irq(sdev))
+		hda_dsp_sdw_thread(irq, hdev->sdw);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 928a3432e9e6..fc104c5ba006 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -232,6 +232,8 @@
 #define HDA_DSP_REG_ADSPIC2		(HDA_DSP_GEN_BASE + 0x10)
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
+#define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
 #define HDA_DSP_REG_HIPCT		(HDA_DSP_IPC_BASE + 0x00)
@@ -696,6 +698,15 @@ static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 }
 
+static inline bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
+static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+{
+	return IRQ_HANDLED;
+}
 #endif
 
 /* common dai driver */
-- 
2.20.1

