Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960987A46
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F2C165E;
	Fri,  9 Aug 2019 14:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F2C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354238;
	bh=VD7v/MUIQFzF2Z0/ycWxSKRh/DKd92Ann8HkGYeDivA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JHLQGf3vYPSvE7qtXWGs4AJoX0LAO854k/rq/I1OQSyPCTmDCQkaO+lG23Glca9HD
	 PQhV4vnn2TTYKP8yBAILZwp0Wl3ltFt+9MId471KGJejLSW+gZoddi+FQqNNfB4cHO
	 BbjzfN3RvkOQ/VATc6NMZmxqj6u1sacVJlWpMdEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C83F8063A;
	Fri,  9 Aug 2019 14:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E722EF805F8; Fri,  9 Aug 2019 14:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12FE1F805A8
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FE1F805A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CRUD7iMK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Jj5j8QEKYHLhLX3iloAYlMSCr/rlHOofttRMQZkKLKw=; b=CRUD7iMKr329
 j+M91C96ahDUwdMMEggKuIix2aIQ6Zzs08Nt0GAamlcPkXXj8wUq1XmgBmbs2FHi+AOetvaeS2Nc8
 D7xagC2+pBBLdq83wG4aSOqDeGYTfxL6qQuQmdpVZdvv7OkGEEYIP+1bkADP71+mSfdHk/r/UBTUP
 Kzzpk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43k-00060x-Ah; Fri, 09 Aug 2019 12:31:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B591727430D0; Fri,  9 Aug 2019 13:31:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190807150203.26359-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123151.B591727430D0@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:51 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Use generic function
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

   ASoC: SOF: Intel: hda: Use generic function for fw ready / mem windows creation

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

From 6eebd3907527764618ee250e1106b9e809c46143 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 7 Aug 2019 10:02:03 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: Use generic function for fw ready /
 mem windows creation

We can use generic sof_fw_ready function and reduce code duplication.
Careful here that we need to provide the implementation for
get_mailbox_offset and get_window_offset.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190807150203.26359-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/apl.c     |   4 +-
 sound/soc/sof/intel/cnl.c     |   4 +-
 sound/soc/sof/intel/hda-ipc.c | 150 +---------------------------------
 sound/soc/sof/intel/hda.h     |   4 +-
 4 files changed, 13 insertions(+), 149 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index fd2e26d79796..8dc7a5558da4 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -46,7 +46,9 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 
 	/* ipc */
 	.send_msg	= hda_dsp_ipc_send_msg,
-	.fw_ready	= hda_dsp_ipc_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index ffd8d4394537..6d7d9c93252c 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -204,7 +204,9 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 
 	/* ipc */
 	.send_msg	= cnl_ipc_send_msg,
-	.fw_ready	= hda_dsp_ipc_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 2ecba91f5219..6aae6f18b3dc 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -266,156 +266,14 @@ irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
 	return ret;
 }
 
-/* IPC Firmware ready */
-
-static void ipc_get_windows(struct snd_sof_dev *sdev)
+int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
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
-			inbox_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			inbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						inbox_offset,
-						elem->size, "inbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			outbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						outbox_offset,
-						elem->size, "outbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "etrace",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "debug",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			stream_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "stream",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "regs",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = elem->offset +
-						SRAM_WINDOW_OFFSET(elem->id);
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
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
+	return HDA_DSP_MBOX_UPLINK_OFFSET;
 }
 
-/* check for ABI compatibility and create memory windows on first boot */
-int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
+int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	u32 offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = HDA_DSP_MBOX_UPLINK_OFFSET;
-
-	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
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
-	snd_sof_fw_parse_ext_data(sdev, sdev->mmio_bar,
-				  HDA_DSP_MBOX_UPLINK_OFFSET +
-				  sizeof(struct sof_ipc_fw_ready));
-
-	ipc_get_windows(sdev);
-
-	return 0;
+	return SRAM_WINDOW_OFFSET(id);
 }
 
 void hda_ipc_msg_data(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 65904c3511df..6db3dcbab3bd 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -519,7 +519,9 @@ int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev,
 			 struct snd_sof_ipc_msg *msg);
 void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev);
-int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
+int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
+int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
+
 irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context);
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
 int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
