Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CCE74A6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:13:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 378582032;
	Mon, 28 Oct 2019 16:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 378582032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275632;
	bh=/Ouv7f+8WA8nqB5sbb2LFaWGxzWy+Vw0q2hOYi7uTcM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ki/xRx7/ItwtkIT+ZsAoHoU3xIcYLJIc1nch+K0WYCdLpGB3hT3joQPLPkCXEe2nb
	 h/p23whCHxiexdtS0mu5cr4eAWfNpzvpnrmdmyzS3BF/9QRWDh/qUwBhLyQbOUxpSb
	 0J9siMaGDhmbrPG4aldK3H9zPGj6/i/ylyd4LSc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE0EF8085D;
	Mon, 28 Oct 2019 15:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B46F80637; Mon, 28 Oct 2019 15:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558DAF80635
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558DAF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WaLh6yTk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LcwEtpsUran12peX9SMVXDczgHs43v+QRsvtZBM6YsE=; b=WaLh6yTkJ7Nh
 gtZN5GH41zdlA2MDdCQ985vx+Fv3tL7PToaLjy3McQ0dCTFhKKqSJbEQ4Ea1lhjLS1drM4jdqsjAq
 Ftgv40IvUsRCbe6uhBv5Z02Ml+sZpgJYUelGcC6aZKIQgKO2qgrwyxl8tfyXbVFgjqq4NLv4QSUtV
 HKwvY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Re-0008Q8-Bv; Mon, 28 Oct 2019 14:56:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B82CE27403EE; Mon, 28 Oct 2019 14:56:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145632.B82CE27403EE@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:32 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-dsp: Add helper for
	setting DSP D0ix substate" to the asoc tree
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

   ASoC: SOF: Intel: hda-dsp: Add helper for setting DSP D0ix substate

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

From 62f8f76604623980d41cf73691ca45288871efd9 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:00 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-dsp: Add helper for setting DSP D0ix
 substate

Adding helper to implement setting dsp to d0i3 or d0i0 status, this will
be needed for driver D0ix support.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 46 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     | 10 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 3ea401646e0c..fa2f1f66c72c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -306,6 +306,52 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
 
+static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev, int retry)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	while (snd_hdac_chip_readb(bus, VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
+		if (!retry--)
+			return -ETIMEDOUT;
+		usleep_range(10, 15);
+	}
+
+	return 0;
+}
+
+int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	int retry = 50;
+	int ret;
+	u8 value;
+
+	/* Write to D0I3C after Command-In-Progress bit is cleared */
+	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	if (ret < 0) {
+		dev_err(bus->dev, "CIP timeout before update D0I3C!\n");
+		return ret;
+	}
+
+	/* Update D0I3C register */
+	value = d0_substate == SOF_DSP_D0I3 ? SOF_HDA_VS_D0I3C_I3 : 0;
+	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
+
+	/* Wait for cmd in progress to be cleared before exiting the function */
+	retry = 50;
+	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	if (ret < 0) {
+		dev_err(bus->dev, "CIP timeout after D0I3C updated!\n");
+		return ret;
+	}
+
+	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
+		 snd_hdac_chip_readb(bus, VS_D0I3C));
+
+	return 0;
+}
+
 static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ea02bf40cb25..0e7c366b8f71 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -64,6 +64,13 @@
 #define SOF_HDA_PPCTL_PIE		BIT(31)
 #define SOF_HDA_PPCTL_GPROCEN		BIT(30)
 
+/*Vendor Specific Registers*/
+#define SOF_HDA_VS_D0I3C		0x104A
+
+/* D0I3C Register fields */
+#define SOF_HDA_VS_D0I3C_CIP		BIT(0) /* Command-In-Progress */
+#define SOF_HDA_VS_D0I3C_I3		BIT(2) /* D0i3 enable bit */
+
 /* DPIB entry size: 8 Bytes = 2 DWords */
 #define SOF_HDA_DPIB_ENTRY_SIZE	0x8
 
@@ -455,6 +462,9 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
+int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate);
+
 int hda_dsp_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
