Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1933792
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A12BE1657;
	Mon,  3 Jun 2019 20:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A12BE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585470;
	bh=ek9c518B1wbTrC9tKaDTrafeqB1uHgjrSfCJSLGkD9w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f8ZpAenDJAFCXFFrpreXCeBnYHGopRCRqFkg3EOwMk9dIVyNLHHiYzrBWJRadLAlL
	 Hni7gC1yJJZYccF/Fn+/4aBbnlVDmyz3WXqVSLAqL7a2jwWa69Ft0SsePh8d5RSaci
	 VNs3ZGL/h11wE/HUAhXSnVXq7jWDTdk3PFPQ9Eag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEAFF8976F;
	Mon,  3 Jun 2019 20:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F52F89749; Mon,  3 Jun 2019 20:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C45CF89736
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C45CF89736
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="woOjCNkX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Yi/ZTP/I0aCZFPZFc4OxkwQBzg+zmtAlLf3lecYnGHo=; b=woOjCNkXXjLC
 oFAYptkmuaX8RVFoLtzIsT97P4oBYsaNPFvmShGrN0XMV/Fl9L8yUs0TVyeoRy6j0Edd8d1+waZ9M
 QQJGXwc+yFlcfM7T9L87I+ubsZ6PgoILCCQQ2weplgWiYtdsseKaP+IZ5FLkC5XJq6VbPdwa7B2+S
 l7wts=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHR-0003YT-RS; Mon, 03 Jun 2019 18:01:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 35290440049; Mon,  3 Jun 2019 19:01:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190603162032.7626-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180157.35290440049@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:57 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-ipc: re-enable IPC IRQ
	at end of handler" to the asoc tree
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

   ASoC: SOF: Intel: hda-ipc: re-enable IPC IRQ at end of handler

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 66e65339b824a597a8c750ddf993af17c847dce6 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 3 Jun 2019 11:20:30 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-ipc: re-enable IPC IRQ at end of
 handler

Align with Skylake driver and enable the IRQ at end of handler,
instead of at beginning.

Also add an error log if we have nothing to do in this handler.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ipc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 1f01897fa6e3..04972f27ffe6 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -131,7 +131,6 @@ static bool hda_dsp_ipc_is_sof(uint32_t msg)
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hipci;
 	u32 hipcie;
 	u32 hipct;
@@ -139,6 +138,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	u32 hipcctl;
 	u32 msg;
 	u32 msg_ext;
+	bool ipc_irq = false;
 
 	/* read IPC status */
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -148,10 +148,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
 	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
 
-	/* reenable IPC interrupt */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
-				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
-
 	/* is this a reply message from the DSP */
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
@@ -196,7 +192,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 		spin_unlock_irq(&sdev->ipc_lock);
 
-		ret = IRQ_HANDLED;
+		ipc_irq = true;
 	}
 
 	/* is this a new message from DSP */
@@ -225,10 +221,22 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 		hda_dsp_ipc_host_done(sdev);
 
-		ret = IRQ_HANDLED;
+		ipc_irq = true;
 	}
 
-	return ret;
+	if (!ipc_irq) {
+		/*
+		 * This interrupt is not shared so no need to return IRQ_NONE.
+		 */
+		dev_err_ratelimited(sdev->dev,
+				    "error: nothing to do in IRQ thread\n");
+	}
+
+	/* re-enable IPC interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	return IRQ_HANDLED;
 }
 
 /* is this IRQ for ADSP ? - we only care about IPC here */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
