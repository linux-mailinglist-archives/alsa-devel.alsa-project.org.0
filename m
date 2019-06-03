Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918533776
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 279A0165F;
	Mon,  3 Jun 2019 20:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 279A0165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585064;
	bh=6YWSSvSQwWv2lmduVXfxfFxyWwSB0z5ctMHfDo8++w4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EViqcfrGUNcpFqWBPBc8Aj7CvR4TcOc8+8i02IVAuZKzUMaJMbmHfy63htccuW5ZS
	 bfyl0+5IZDSoi8ja5CYWyUFuMGVKBVfuRhRNSTcoIWVGNTzUN8btyP0zT0nAbMVSzr
	 XOIrNUJRGpLk5nAywEV34pDCnjd8IOH8xvhlP+Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 279ECF89717;
	Mon,  3 Jun 2019 20:02:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53F7FF896EE; Mon,  3 Jun 2019 20:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B845EF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B845EF80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="D0Pyi5QA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=G3fKUDU0WyB2QDvcrU0EmSDYUroardZyOhjTGxKpUIU=; b=D0Pyi5QA7guT
 b6N7UuRrt58d55JMIbAZKMP170TBXmhop0kXs+fVpQSGFso/ZawPPHcTfXb3jwB9zlgXUP4lVYcPq
 MkcbDAnDcvUm7MR7pb9kyfaD3AFcUtgdfpuzNAK5y/m3g+P36jEXo5k3yxgpyX96FfCW8gQIQe73i
 PWmig=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHO-0003Y1-Ju; Mon, 03 Jun 2019 18:01:54 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 04DC9440046; Mon,  3 Jun 2019 19:01:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20190603161821.7486-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180154.04DC9440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:53 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: send time stamp to FW for
	alignment" to the asoc tree
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

   ASoC: SOF: send time stamp to FW for alignment

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

From e3adc9495ab26fc4bfe29253d4e7aad47dab2307 Mon Sep 17 00:00:00 2001
From: Bard liao <yung-chuan.liao@linux.intel.com>
Date: Mon, 3 Jun 2019 11:18:17 -0500
Subject: [PATCH] ASoC: SOF: send time stamp to FW for alignment

Timer will be reset when DSP is powered down. So the time stamp of trace
log will be reset after resume. Send time stamp to FW can align the time
stamp and avoid reset time stamp in trace log.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/header.h   |  1 +
 include/sound/sof/trace.h    | 10 ++++++++++
 include/uapi/sound/sof/abi.h |  2 +-
 sound/soc/sof/trace.c        | 16 +++++++++++++---
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 1efcf7b18ec2..ab5862d80afe 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -102,6 +102,7 @@
 /* trace and debug */
 #define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
+#define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
 /* Get message component id */
 #define SOF_IPC_MESSAGE_ID(x)			((x) & 0xffff)
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index 7d211f319a92..2187ff7d07ce 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -19,12 +19,22 @@
 #define SOF_TRACE_FILENAME_SIZE		32
 
 /* DMA for Trace params info - SOF_IPC_DEBUG_DMA_PARAMS */
+/* Deprecated - use sof_ipc_dma_trace_params_ext */
 struct sof_ipc_dma_trace_params {
 	struct sof_ipc_cmd_hdr hdr;
 	struct sof_ipc_host_buffer buffer;
 	uint32_t stream_tag;
 }  __packed;
 
+/* DMA for Trace params info - SOF_IPC_DEBUG_DMA_PARAMS_EXT */
+struct sof_ipc_dma_trace_params_ext {
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_host_buffer buffer;
+	uint32_t stream_tag;
+	uint64_t timestamp_ns; /* in nanosecond */
+	uint32_t reserved[8];
+}  __packed;
+
 /* DMA for Trace params info - SOF_IPC_DEBUG_DMA_PARAMS */
 struct sof_ipc_dma_trace_posn {
 	struct sof_ipc_reply rhdr;
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 0868eb47acf7..92eee681bc62 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 6
+#define SOF_ABI_MINOR 7
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index b02520f8e595..befed975161c 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -161,7 +161,9 @@ static int trace_debugfs_create(struct snd_sof_dev *sdev)
 
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 {
-	struct sof_ipc_dma_trace_params params;
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+	struct sof_ipc_dma_trace_params_ext params;
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
@@ -169,8 +171,16 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 		return -EINVAL;
 
 	/* set IPC parameters */
-	params.hdr.size = sizeof(params);
-	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_PARAMS;
+	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG;
+	/* PARAMS_EXT is only supported from ABI 3.7.0 onwards */
+	if (v->abi_version >= SOF_ABI_VER(3, 7, 0)) {
+		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params_ext);
+		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS_EXT;
+		params.timestamp_ns = ktime_get(); /* in nanosecond */
+	} else {
+		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params);
+		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS;
+	}
 	params.buffer.phy_addr = sdev->dmatp.addr;
 	params.buffer.size = sdev->dmatb.bytes;
 	params.buffer.pages = sdev->dma_trace_pages;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
