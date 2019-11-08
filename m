Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA117F4B5A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 13:22:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434FD167E;
	Fri,  8 Nov 2019 13:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434FD167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573215757;
	bh=bP5CED4isjNcHTny0vTpepSN2mu5tjmoXwkdukYbAqo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N3urMFg1QIbOz5wEYFGVaonNQ6CqSfbSFhCWFYOvCXKVpl/lqwAMGI2zIcF9qrIxN
	 n70bGAjz0MqUkXnb57gkX5piJsPRmF87n78mfGXENJBVCA9dfwsfv2p7/sUbSqbmMe
	 6JZova1BqE+vyGxVqETXkGW0/qgUCNMGBpY5f1Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA3AF8045F;
	Fri,  8 Nov 2019 13:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F8AF803D0; Fri,  8 Nov 2019 13:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C450AF80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 13:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C450AF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JYmiQ0BG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=43JKsAd5OBxddrCi9aQUMrLKNdGmB8x/z+2C5I5ZRyI=; b=JYmiQ0BGsdGl
 j5XR3Bp+qIVbPrOOt58xWCKuxui39U7+xQJgXjEljxzeNQ00XxLxkr4UKg7Moi3pP1F5j+tq6na9S
 CSXp/mNxSsiTd/QYeoHQROfs4lTAesHqvyGeUsvpeGezKBzjsPqb4CdimL7x/NnuHOfOWjgENVCTH
 xkqPA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT3Ft-0007Ef-PD; Fri, 08 Nov 2019 12:20:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 066E22740C6C; Fri,  8 Nov 2019 12:20:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191101170916.26517-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191108122045.066E22740C6C@ypsilon.sirena.org.uk>
Date: Fri,  8 Nov 2019 12:20:44 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: set L1SEN on S0ix
	suspend" to the asoc tree
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

   ASoC: SOF: Intel: hda: set L1SEN on S0ix suspend

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 16299326a0cbbc88d4d6491a8ceebbfca81064c5 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 1 Nov 2019 12:09:15 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: set L1SEN on S0ix suspend

Set L1SEN to make sure the system can enter S0ix, and restore it on
resume.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101170916.26517-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 15 +++++++++++++++
 sound/soc/sof/intel/hda.h     |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 8cd5ecc01b62..4a4d318f97ff 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -478,9 +478,16 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 
 	if (sdev->s0_suspend) {
+		/* restore L1SEN bit */
+		if (hda->l1_support_changed)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN, 0);
+
 		/* restore and disable the system wakeup */
 		pci_restore_state(pci);
 		disable_irq_wake(pci->irq);
@@ -518,11 +525,19 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 
 int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
 	if (sdev->s0_suspend) {
+		/* enable L1SEN to make sure the system can enter S0Ix */
+		hda->l1_support_changed =
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN,
+						HDA_VS_INTEL_EM2_L1SEN);
+
 		/* enable the system waking up via IPC IRQ */
 		enable_irq_wake(pci->irq);
 		pci_save_state(pci);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5ad73a34b09c..18d7e72bf9b7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -408,6 +408,9 @@ struct sof_intel_hda_dev {
 
 	int irq;
 
+	/* PM related */
+	bool l1_support_changed;/* during suspend, is L1SEN changed or not */
+
 	/* DMIC device */
 	struct platform_device *dmic_dev;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
