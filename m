Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B163377C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BAB61684;
	Mon,  3 Jun 2019 20:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BAB61684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585180;
	bh=QBWJxuUCtfQJH1fyaNL2QMxGSaHDLt+r0I4erHI8GXI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kVILyAm4686YE4JvnVeyw2pdgnXH2ylkvL+gg1/ThsuQqrVKJ0EwOhZ0AeQwBEp8+
	 4vfKlXYLEANvWBL5w2sTVwbxit959fC7R5bpXgkCR9L6XsWmwS3na0NmCLuP5tMhr/
	 lZU7uzGvzPjd7Q6KLpOY4h5FzKW/dS7v8m6vO9xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E76F89739;
	Mon,  3 Jun 2019 20:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B44F89736; Mon,  3 Jun 2019 20:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB235F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB235F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bkzH5dud"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=50IUXVgR2BqJmgI8m5W4TzYY7i6shvMg0SyZsHhDVwA=; b=bkzH5dudVHYJ
 eHFD19hC4gCvP4qRy0mlaj116ZC5YEdsQ9yORYJLtvPHRlqFZI3mVXA/k8yvWGOB8xO6guS+Fy2qK
 ebkI5uY3nM+oAImxhhjI153hPV3bJjlB+cxvQd/ThIk5mXEkQK7bVzB4fJQzc1qWfmgHBh1VWFQFC
 FMzos=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHR-0003YL-8M; Mon, 03 Jun 2019 18:01:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9A4E2440046; Mon,  3 Jun 2019 19:01:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190603162032.7626-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180156.9A4E2440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:56 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: ipc: don't check for
	HIPCCTL register value" to the asoc tree
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

   ASoC: SOF: Intel: ipc: don't check for HIPCCTL register value

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

From 09a173a63fbb89762712a4ec48722ba98d4e1bcc Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 3 Jun 2019 11:20:31 -0500
Subject: [PATCH] ASoC: SOF: Intel: ipc: don't check for HIPCCTL register value

The HIPCCTL register controls the IPC interrupts. It can be set or
cleared to mask or enable these interrupts, but it makes no sense to
read and test its fields in an interrupt (which can only executed if
its fields are set).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c     | 5 +----
 sound/soc/sof/intel/hda-ipc.c | 8 ++------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index b794a881542f..9a4927b6b6ae 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -31,7 +31,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	u32 hipci;
-	u32 hipcctl;
 	u32 hipcida;
 	u32 hipctdr;
 	u32 hipctdd;
@@ -40,14 +39,12 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 	bool ipc_irq = false;
 
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
-	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCCTL);
 	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
 	hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDD);
 	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR);
 
 	/* reply message from DSP */
-	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE &&
-	    hipcctl & CNL_DSP_REG_HIPCCTL_DONE) {
+	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE) {
 		msg_ext = hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
 		msg = hipcida & CNL_DSP_REG_HIPCIDA_MSG_MASK;
 
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 04972f27ffe6..50244b82600c 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -135,7 +135,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	u32 hipcie;
 	u32 hipct;
 	u32 hipcte;
-	u32 hipcctl;
 	u32 msg;
 	u32 msg_ext;
 	bool ipc_irq = false;
@@ -144,13 +143,11 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 				  HDA_DSP_REG_HIPCIE);
 	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
-	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
 	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
 	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
 
 	/* is this a reply message from the DSP */
-	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
-	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
+	if (hipcie & HDA_DSP_REG_HIPCIE_DONE) {
 		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
 		msg_ext = hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
 
@@ -196,8 +193,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	}
 
 	/* is this a new message from DSP */
-	if (hipct & HDA_DSP_REG_HIPCT_BUSY &&
-	    hipcctl & HDA_DSP_REG_HIPCCTL_BUSY) {
+	if (hipct & HDA_DSP_REG_HIPCT_BUSY) {
 		msg = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
 		msg_ext = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
