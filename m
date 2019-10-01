Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F078C3F34
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB38167E;
	Tue,  1 Oct 2019 19:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB38167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569952817;
	bh=4AkZb/8jQQcfSKLF3bE53F/8gFopSJrYA9IuLtypO1o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FfyeIvktzSfP9CDsaU4lPxEqiy5S5FNhKxM/gWYFl+D2jSDmo07p469GN1YooIZGj
	 vCXoQjcklE5bnNRPkB28z8XqojQ/aGG2/8P8RGxQZB8HjUj5/0gpbe+cwDPHcPKoNV
	 yoiL00z6X2GwoDbhkLfh9jMINWmmQoLqqmCuD1jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E60BF80674;
	Tue,  1 Oct 2019 19:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D7CF8063A; Tue,  1 Oct 2019 19:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8945CF80611
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8945CF80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="A3yeytQv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=36UwyUDtI4B390c+vj7LPmBlXuo3UWZwEJuBfDmi8F0=; b=A3yeytQvoCZ5
 ycOeid7DFmXaVaPS7GK8Ml6FbxAVtl4I5IW7pQz9EzhmwtEepdinEQN/NaIr5g35cawS5NBFMeZ4v
 XEfpgnkWhEeKZ8edNC7QVbNdO5A/QvPSGBoBObUWn0P8eydBWTZwTX0m5gvo5HA53hnTS+cGKwF+0
 SzSSY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOE-0005sS-Af; Tue, 01 Oct 2019 17:56:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D36A527429C0; Tue,  1 Oct 2019 18:56:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190927200538.660-13-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175645.D36A527429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:45 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add context data to any IPC
	timeout." to the asoc tree
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

   ASoC: SOF: Intel: Add context data to any IPC timeout.

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

From 3a9e204d4e36904a464a2e53206b053a7ffc7bad Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:37 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add context data to any IPC timeout.

Helps with FW debug as it provides DSP IPC processing context.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-13-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 22 +++++++++++++++++++++-
 sound/soc/sof/intel/byt.c | 23 ++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index e282179263e8..170c74dc13b1 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -241,7 +241,7 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[BDW_STACK_DUMP_SIZE];
-	u32 status, panic;
+	u32 status, panic, imrx, imrd;
 
 	/* now try generic SOF status messages */
 	status = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCD);
@@ -250,6 +250,26 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 			  BDW_STACK_DUMP_SIZE);
 	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
 			   BDW_STACK_DUMP_SIZE);
+
+	/* provide some context for firmware debug */
+	imrx = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRX);
+	imrd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRD);
+	dev_err(sdev->dev,
+		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
+		panic & SHIM_IPCX_BUSY ? "yes" : "no",
+		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+	dev_err(sdev->dev,
+		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
+		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
+		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+	dev_err(sdev->dev,
+		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
+		status & SHIM_IPCD_BUSY ? "yes" : "no",
+		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+	dev_err(sdev->dev,
+		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
+		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
+		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
 }
 
 /*
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 5e7a6aaa627a..ecbc9c79bcad 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -139,7 +139,7 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[BYT_STACK_DUMP_SIZE];
-	u32 status, panic;
+	u32 status, panic, imrd, imrx;
 
 	/* now try generic SOF status messages */
 	status = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IPCD);
@@ -148,6 +148,27 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 			  BYT_STACK_DUMP_SIZE);
 	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
 			   BYT_STACK_DUMP_SIZE);
+
+	/* provide some context for firmware debug */
+	imrx = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRX);
+	imrd = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRD);
+	dev_err(sdev->dev,
+		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
+		panic & SHIM_IPCX_BUSY ? "yes" : "no",
+		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+	dev_err(sdev->dev,
+		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
+		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
+		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+	dev_err(sdev->dev,
+		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
+		status & SHIM_IPCD_BUSY ? "yes" : "no",
+		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+	dev_err(sdev->dev,
+		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
+		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
+		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
+
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
