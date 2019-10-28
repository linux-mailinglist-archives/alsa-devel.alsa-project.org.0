Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C3E746D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875DA16C7;
	Mon, 28 Oct 2019 16:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875DA16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275216;
	bh=e+wyB+J27UDbDR6ijpOdw/AV8VDlnmQ10GNA8x8NeLA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HVTaBjKBKSmhKkiNAVRYf5nFKNGsKdBvdDRKcLJ2VZtbomEKD1J90W1O+JTGA1EkY
	 R4THeSZdD3Q1Gw52DnqS0n7rjOJZYJYQmN7ush8s1/dlncZu56ROuyj8FXZ788DcVt
	 C32T0aI9SgWcJbhi8gTKA/TtdruQyCMK2/wbzX2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B3E1F8064C;
	Mon, 28 Oct 2019 15:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8E28F8067C; Mon, 28 Oct 2019 15:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2B53F805FC
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B53F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nHP72BnU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+0nCRHV1U3k0C8rtJE3HcMDcXUknd8WR85FOV2JFeuQ=; b=nHP72BnUUvcn
 36GHUv1dChEY3gSQVkss5eUxx6COiAY2igNOzkoCnLb/PSHjHe9LaZbcIvagOj7uFDwegQaTN76IK
 URBb4Mz22v+Mr2/h5+HpFZ36ma77HeDI/th6aQEdLEWVAPsdt4Wg17IO5pngz0ILdEi5fzDmyOFkG
 w0Pb4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rd-0008Pf-J7; Mon, 28 Oct 2019 14:56:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4B07927403FD; Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145631.4B07927403FD@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: HDA: use macro for register
	polling retry count" to the asoc tree
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

   ASoC: SOF: Intel: HDA: use macro for register polling retry count

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

From 92f4beb718d76e93b76343a3ba872df6cb210672 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:07 -0500
Subject: [PATCH] ASoC: SOF: Intel: HDA: use macro for register polling retry
 count

Define macro and use it for the register polling retry count.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-12-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 6 ++----
 sound/soc/sof/intel/hda.h     | 1 +
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 74805a066183..936361bd25e9 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -323,12 +323,11 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    enum sof_d0_substate d0_substate)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	int retry = 50;
 	int ret;
 	u8 value;
 
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
-	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout before D0I3C update!\n");
 		return ret;
@@ -339,8 +338,7 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
-	retry = 50;
-	ret = hda_dsp_wait_d0i3c_done(sdev, retry);
+	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout after D0I3C update!\n");
 		return ret;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0e7c366b8f71..99ec60218c16 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -214,6 +214,7 @@
 #define HDA_DSP_CTRL_RESET_TIMEOUT		100
 #define HDA_DSP_WAIT_TIMEOUT		500	/* 500 msec */
 #define HDA_DSP_REG_POLL_INTERVAL_US		500	/* 0.5 msec */
+#define HDA_DSP_REG_POLL_RETRY_COUNT		50
 
 #define HDA_DSP_ADSPIC_IPC			1
 #define HDA_DSP_ADSPIS_IPC			1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
