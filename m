Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B087A49
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED7115E5;
	Fri,  9 Aug 2019 14:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED7115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354267;
	bh=WYLO7ZeiMhKDNrKSD6oMr9nFa5amENmFocd//JS6eAQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CSbXLVC76ebrBna6TlALp4ffGQpqk/RM/b8V/c1uPSS4RGVtwjOyecGb/2rkCG1we
	 Xj38j6B5OvLMHipnpvQ3bJGp8+I7yVUTRQ+yZYSbd7JyHvsve+4jTgvVJW3NDAqUSy
	 o+GLey5byrcH5ZIFQl335JqRkKKdGw6DD7szkVo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8FFF80641;
	Fri,  9 Aug 2019 14:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A5BF804AB; Fri,  9 Aug 2019 14:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B020F804CA
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B020F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FJHrbbaU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nrL31qLwAXRBy/F0Y/gAwYfM8mazL5N4k2YuFFi6Dg8=; b=FJHrbbaU77uo
 h2nZEfa0TOlVMZmJIMTc8GdHd4AtfFUdcvz/S6VDs0G+ec+Z56tUhJsXi8hIZf6lfCaOZ3HN6M1CK
 tyvqz/hV9V9f5VNs3BAHdZByzYYs9/JJRVa2LkvHrclht2M6Ye0MEUCz1t5cnfwc/r4xx/puvFEel
 LZmbM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43k-000610-FT; Fri, 09 Aug 2019 12:31:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E89FC274303D; Fri,  9 Aug 2019 13:31:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190807150203.26359-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123151.E89FC274303D@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:51 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: bdw: Use generic function
	for fw ready / mem windows creation" to the asoc tree
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

   ASoC: SOF: Intel: bdw: Use generic function for fw ready / mem windows creation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ddf14b640b05839cfe44d686d5a5cc7c55076094 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 7 Aug 2019 10:02:02 -0500
Subject: [PATCH] ASoC: SOF: Intel: bdw: Use generic function for fw ready /
 mem windows creation

bdw_get_windows / bdw_fw_ready is identical with the generic
implementation introduced in a previous patch.

So remove bdw_get_windows / bdw_fw_ready and use the generic
sof_get_windows version.

Do not forget to implement get_mailbox_offset/get_window_offset
so that we export the correct mailbox/memory window offset to
the outside world.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190807150203.26359-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 156 ++++----------------------------------
 1 file changed, 13 insertions(+), 143 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 94be024a99eb..e282179263e8 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -327,148 +327,6 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
-/*
- * IPC Firmware ready.
- */
-static void bdw_get_windows(struct snd_sof_dev *sdev)
-{
-	struct sof_ipc_window_elem *elem;
-	u32 outbox_offset = 0;
-	u32 stream_offset = 0;
-	u32 inbox_offset = 0;
-	u32 outbox_size = 0;
-	u32 stream_size = 0;
-	u32 inbox_size = 0;
-	int i;
-
-	if (!sdev->info_window) {
-		dev_err(sdev->dev, "error: have no window info\n");
-		return;
-	}
-
-	for (i = 0; i < sdev->info_window->num_windows; i++) {
-		elem = &sdev->info_window->window[i];
-
-		switch (elem->type) {
-		case SOF_IPC_REGION_UPBOX:
-			inbox_offset = elem->offset + MBOX_OFFSET;
-			inbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						inbox_offset,
-						elem->size, "inbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset = elem->offset + MBOX_OFFSET;
-			outbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						outbox_offset,
-						elem->size, "outbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "etrace",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "debug",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset = elem->offset + MBOX_OFFSET;
-			stream_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						stream_offset,
-						elem->size, "stream",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "regs",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = elem->offset + MBOX_OFFSET;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "exception",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		default:
-			dev_err(sdev->dev, "error: get illegal window info\n");
-			return;
-		}
-	}
-
-	if (outbox_size == 0 || inbox_size == 0) {
-		dev_err(sdev->dev, "error: get illegal mailbox window\n");
-		return;
-	}
-
-	snd_sof_dsp_mailbox_init(sdev, inbox_offset, inbox_size,
-				 outbox_offset, outbox_size);
-	sdev->stream_box.offset = stream_offset;
-	sdev->stream_box.size = stream_size;
-
-	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
-		inbox_offset, inbox_size);
-	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
-		outbox_offset, outbox_size);
-	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
-		stream_offset, stream_size);
-}
-
-/* check for ABI compatibility and create memory windows on first boot */
-static int bdw_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	u32 offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = MBOX_OFFSET;
-
-	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset %d\n",
-		msg_id, offset);
-
-	/* no need to re-check version/ABI for subsequent boots */
-	if (!sdev->first_boot)
-		return 0;
-
-	/* copy data from the DSP FW ready offset */
-	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
-		       sizeof(*fw_ready));
-
-	/* make sure ABI version is compatible */
-	ret = snd_sof_ipc_valid(sdev);
-	if (ret < 0)
-		return ret;
-
-	/* now check for extended data */
-	snd_sof_fw_parse_ext_data(sdev, sdev->mmio_bar, MBOX_OFFSET +
-				  sizeof(struct sof_ipc_fw_ready));
-
-	bdw_get_windows(sdev);
-
-	return 0;
-}
-
 /*
  * IPC Mailbox IO
  */
@@ -522,6 +380,16 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	msg->reply_error = ret;
 }
 
+static int bdw_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int bdw_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
 static void bdw_host_done(struct snd_sof_dev *sdev)
 {
 	/* clear BUSY bit and set DONE bit - accept new messages */
@@ -672,7 +540,9 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 
 	/* ipc */
 	.send_msg	= bdw_send_msg,
-	.fw_ready	= bdw_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = bdw_get_mailbox_offset,
+	.get_window_offset = bdw_get_window_offset,
 
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
