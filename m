Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ABF334DA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0951690;
	Mon,  3 Jun 2019 18:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0951690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579018;
	bh=KmpePNTXOiq/ui4vA8Wqfxx30p+TYyKWdakUlvCipcI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnxkKL3n3P6TKeDnbTURwFIsYBesmF1ylpSo/p0e6Jz/eGn1yqD7k20DKtnu0pGRK
	 I0lBq0jrC3xDyWZkD+FoNfRVLyqRaZ0tn5DRY8TgrNWAz4l5psF9Hp+LFe2F+QUc6m
	 qace5jefZAkqVslclWeZ+tRWIPd+BMXiBWGZ7KLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DD8F8973F;
	Mon,  3 Jun 2019 18:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A21F89730; Mon,  3 Jun 2019 18:18:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C092BF896EE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C092BF896EE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:30 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:17 -0500
Message-Id: <20190603161821.7486-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/9] ASoC: SOF: send time stamp to FW for
	alignment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard liao <yung-chuan.liao@linux.intel.com>

Timer will be reset when DSP is powered down. So the time stamp of trace
log will be reset after resume. Send time stamp to FW can align the time
stamp and avoid reset time stamp in trace log.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
index fdb30078448f..9257d5473d97 100644
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
index 2613dd3e0dfc..84d89206a0e0 100644
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
 
@@ -172,8 +174,16 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
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
