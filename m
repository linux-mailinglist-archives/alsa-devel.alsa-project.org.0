Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E0184C7B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FFB185D;
	Fri, 13 Mar 2020 17:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FFB185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116898;
	bh=rhRvXkqOzjZs7JRoGZlsvdYH1x3z/UacDAbuPOtq4f4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GT6jTx0xGNwAIIah4XDVYs8dne90+Y/i2IeykMoJ+uVaA37ZmJLLHuyu2b9m7mHJJ
	 cmhp3l0IfqntSpSxiAWeOrS1iC5Umo+5jWpaIlpGETqUZ+riFYwUM2nvz2xEvOlJp2
	 E/tE72xVbA+O3DHg4FfSfQbi4TC3LvEie+ldbq0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5CFEF8023E;
	Fri, 13 Mar 2020 17:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE932F802FD; Fri, 13 Mar 2020 17:18:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 330F0F802FD
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 330F0F802FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335E7FEC;
 Fri, 13 Mar 2020 09:18:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB5EF3F6CF;
 Fri, 13 Mar 2020 09:18:23 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:18:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Subject: Applied "ASoC: SOF: Remove SOF_IPC_EXT_DMA_BUFFER" to the asoc tree
In-Reply-To: <20200312200622.24477-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200312200622.24477-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Remove SOF_IPC_EXT_DMA_BUFFER

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From a6096f88a0b344d792606ebfaf1ef1ec2d7e0655 Mon Sep 17 00:00:00 2001
From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Date: Thu, 12 Mar 2020 15:06:19 -0500
Subject: [PATCH] ASoC: SOF: Remove SOF_IPC_EXT_DMA_BUFFER

This enum code, and what's more important, related structures is
unused in whole source code, so it shouldn't be kept.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312200622.24477-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/info.h | 18 +-----------------
 sound/soc/sof/loader.c   |  3 ---
 sound/soc/sof/sof-priv.h |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index cc3b50b6ae52..438a11fcf272 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -28,7 +28,7 @@
 
 /* extended data types that can be appended onto end of sof_ipc_fw_ready */
 enum sof_ipc_ext_data {
-	SOF_IPC_EXT_DMA_BUFFER		= 0,
+	SOF_IPC_EXT_UNUSED		= 0,
 	SOF_IPC_EXT_WINDOW		= 1,
 	SOF_IPC_EXT_CC_INFO		= 2,
 };
@@ -83,22 +83,6 @@ struct sof_ipc_ext_data_hdr {
 	uint32_t type;		/**< SOF_IPC_EXT_ */
 } __packed;
 
-struct sof_ipc_dma_buffer_elem {
-	struct sof_ipc_hdr hdr;
-	uint32_t type;		/**< SOF_IPC_REGION_ */
-	uint32_t id;		/**< platform specific - used to map to host memory */
-	struct sof_ipc_host_buffer buffer;
-} __packed;
-
-/* extended data DMA buffers for IPC, trace and debug */
-struct sof_ipc_dma_buffer_data {
-	struct sof_ipc_ext_data_hdr ext_hdr;
-	uint32_t num_buffers;
-
-	/* host files in buffer[n].buffer */
-	struct sof_ipc_dma_buffer_elem buffer[];
-}  __packed;
-
 struct sof_ipc_window_elem {
 	struct sof_ipc_hdr hdr;
 	uint32_t type;		/**< SOF_IPC_REGION_ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index fc4ab51bacf4..67fc95ace42b 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -95,9 +95,6 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 
 		/* process structure data */
 		switch (ext_hdr->type) {
-		case SOF_IPC_EXT_DMA_BUFFER:
-			ret = 0;
-			break;
 		case SOF_IPC_EXT_WINDOW:
 			ret = get_ext_windows(sdev, ext_hdr);
 			break;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5d16f668d16a..38dce54755a6 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -415,7 +415,6 @@ struct snd_sof_dev {
 	u32 enabled_cores_mask; /* keep track of enabled cores */
 
 	/* FW configuration */
-	struct sof_ipc_dma_buffer_data *info_buffer;
 	struct sof_ipc_window *info_window;
 
 	/* IPC timeouts in ms */
-- 
2.20.1

