Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A471510C968
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:24:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D3116E3;
	Thu, 28 Nov 2019 14:23:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D3116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574947460;
	bh=HOPN78iElmO4YpK5uG04ACg7kCTlYPMur5T2QJ9ZBSA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uwnd5t+p78fWpGXOWmANCuY2l2z0EWyiD0i1TNTodOUu0xhCz15zuLuMXhhkdchPt
	 gla8CTUNVxsKkaebDPsZzitXUZuCZo7TfMIpAqr51a0NpLUrB9cFrY0Js+J1AxSqWa
	 H9SZuRedcyR5YJHOfw4lykzyM33XdCDv2D8JvUl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77744F8024A;
	Thu, 28 Nov 2019 14:18:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79EDEF80240; Thu, 28 Nov 2019 14:18:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8488BF80217
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8488BF80217
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DABB91045;
 Thu, 28 Nov 2019 05:18:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2933F52E;
 Thu, 28 Nov 2019 05:18:37 -0800 (PST)
Date: Thu, 28 Nov 2019 13:18:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191126141533.21601-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191126141533.21601-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: BYT: fix a copy/paste
	mistake in byt_dump()" to the asoc tree
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

   ASoC: SOF: Intel: BYT: fix a copy/paste mistake in byt_dump()

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

From b81eb73be03ac736f1f8d27d64a372c62c7159e5 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Tue, 26 Nov 2019 08:15:33 -0600
Subject: [PATCH] ASoC: SOF: Intel: BYT: fix a copy/paste mistake in byt_dump()

The shim registers in BYT/CHT/BSW are 64bits based, correct the
copy/paste (from bdw.c where the shim registers are 32bits based) error
in byt_dump().

Fixes: 3a9e204d4e36 ("ASoC: SOF: Intel: Add context data to any IPC timeout")
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191126141533.21601-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/byt.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 2abf80b3eb52..b9061b79a57b 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -145,33 +145,33 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[BYT_STACK_DUMP_SIZE];
-	u32 status, panic, imrd, imrx;
+	u64 status, panic, imrd, imrx;
 
 	/* now try generic SOF status messages */
-	status = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IPCD);
-	panic = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IPCX);
+	status = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCD);
+	panic = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCX);
 	byt_get_registers(sdev, &xoops, &panic_info, stack,
 			  BYT_STACK_DUMP_SIZE);
 	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
 			   BYT_STACK_DUMP_SIZE);
 
 	/* provide some context for firmware debug */
-	imrx = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRX);
-	imrd = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRD);
+	imrx = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IMRX);
+	imrd = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IMRD);
 	dev_err(sdev->dev,
-		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
+		"error: ipc host -> DSP: pending %s complete %s raw 0x%llx\n",
 		(panic & SHIM_IPCX_BUSY) ? "yes" : "no",
 		(panic & SHIM_IPCX_DONE) ? "yes" : "no", panic);
 	dev_err(sdev->dev,
-		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
+		"error: mask host: pending %s complete %s raw 0x%llx\n",
 		(imrx & SHIM_IMRX_BUSY) ? "yes" : "no",
 		(imrx & SHIM_IMRX_DONE) ? "yes" : "no", imrx);
 	dev_err(sdev->dev,
-		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
+		"error: ipc DSP -> host: pending %s complete %s raw 0x%llx\n",
 		(status & SHIM_IPCD_BUSY) ? "yes" : "no",
 		(status & SHIM_IPCD_DONE) ? "yes" : "no", status);
 	dev_err(sdev->dev,
-		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
+		"error: mask DSP: pending %s complete %s raw 0x%llx\n",
 		(imrd & SHIM_IMRD_BUSY) ? "yes" : "no",
 		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
