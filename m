Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E233785
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B052A168A;
	Mon,  3 Jun 2019 20:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B052A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585303;
	bh=H2IVZLp8nH2E2h5xAatrBMa/uW//DVDLqZPWA4PQoeQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F1hVXcgQ/jOOU8CctgdfGpGiwDxZUosLRUhfLp4zvdpQAlaiq77hR6NUkLZb/koch
	 sd/5oZxC7xaj1bfYe40Yh+DKjrZ3Z1dq3yjf9aJOaWTjSEEGkxGzahJXb5rR/YZATf
	 gxU/s2tyycYoH3ErWO4qtX79rZd+k0le8enOBWrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E59F89758;
	Mon,  3 Jun 2019 20:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F148F8973B; Mon,  3 Jun 2019 20:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20CB9F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20CB9F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aAwkripc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cRHTL5muTxJlsDAHCTKwd6PCs1BSN5ZrCZGjgiVkNwI=; b=aAwkripc75GT
 7y6kUOZ9VZgaVBe4Wqrt0j5IkiCZB2P9ZdGgu/7r28Ahcz8naW4nQVhV14sM/3SwGxRQujhSuLGIa
 bXuTTV2xjAE9HtO8PJhLsXnEXAamcC2ui+Zgoiw4K45zzSd5hWi4mn7tPDuyIAoAwoHhOUnUmGj4n
 1WARs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHV-0003Yw-34; Mon, 03 Jun 2019 18:02:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3D368440046; Mon,  3 Jun 2019 19:02:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
In-Reply-To: <20190603162032.7626-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180200.3D368440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:02:00 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Do not send cmd via SHIM register"
	to the asoc tree
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

   ASoC: SOF: Do not send cmd via SHIM register

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

From 6fbbc18ead0f4f64a722f7e325046e5860d2c52b Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 3 Jun 2019 11:20:25 -0500
Subject: [PATCH] ASoC: SOF: Do not send cmd via SHIM register

We use shim registers only to notify the other
side that a message was sent. The actual information
for the message is transmitted via mailbox.

cmd information inside shim register is not used by
the DSP, so we remove it to avoid confusion.

Signed-off-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/byt.c     | 5 +----
 sound/soc/sof/intel/cnl.c     | 4 +---
 sound/soc/sof/intel/hda-ipc.c | 4 +---
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 9e4c07eb889b..8765eedfcf54 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -373,13 +373,10 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 
 static int byt_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
-	u64 cmd = msg->header;
-
 	/* send the message */
 	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
 			  msg->msg_size);
-	snd_sof_dsp_write64(sdev, BYT_DSP_BAR, SHIM_IPCX,
-			    cmd | SHIM_BYT_IPCX_BUSY);
+	snd_sof_dsp_write64(sdev, BYT_DSP_BAR, SHIM_IPCX, SHIM_BYT_IPCX_BUSY);
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e59d180da7e2..fd86269b5037 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -151,13 +151,11 @@ static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev)
 static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
 			    struct snd_sof_ipc_msg *msg)
 {
-	u32 cmd = msg->header;
-
 	/* send the message */
 	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
 			  msg->msg_size);
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
-			  cmd | CNL_DSP_REG_HIPCIDR_BUSY);
+			  CNL_DSP_REG_HIPCIDR_BUSY);
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 51b285103394..728dd1e075a4 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -56,13 +56,11 @@ static void hda_dsp_ipc_dsp_done(struct snd_sof_dev *sdev)
 
 int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
-	u32 cmd = msg->header;
-
 	/* send IPC message to DSP */
 	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
 			  msg->msg_size);
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI,
-			  cmd | HDA_DSP_REG_HIPCI_BUSY);
+			  HDA_DSP_REG_HIPCI_BUSY);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
