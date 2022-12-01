Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C663F64C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5575817DB;
	Thu,  1 Dec 2022 18:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5575817DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916498;
	bh=v8tvg6vAeBgApAzccWiMZov4CD5WfpL8Xm6BZJmYC4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfdKmm63TJuMb71Fur6pRerCghmrulGI2T1/wi9N1vFIDbAt7bga0A4BdwFt4wo0Q
	 9ROS+B4/zCv3fL5TLGD2/BeHlKfrSNXjSJCMcI+qjgYp65K2GoBXWps/mAGrRXgDV1
	 IMuZ+zDPg7K+JNEsqOdXgdFhgJA5417zPAu0sMZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7FAF80570;
	Thu,  1 Dec 2022 18:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D791F8055A; Thu,  1 Dec 2022 18:39:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D0AFF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0AFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CTLC6SC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916368; x=1701452368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8tvg6vAeBgApAzccWiMZov4CD5WfpL8Xm6BZJmYC4w=;
 b=CTLC6SC/NjoVUk2MrPRPcTY1fSaqN2TfX2Rx42gGylw3T7prcQ0aizSR
 eECPCNf/Y2y0I+vWQKESVi1HuEVoUFWpiuncI0GHvpPIrWO/6mcw7zOAs
 UtygcVbiG/gnAWKUkyRPUdMbvB8eSlit+aKn0hGA6wE3kEDgO6JvmtCWn
 w/xlsan7CqQGyD2MSGr8z0HA4mkbt2jxns/F2xpPgofg/3toiu9Ld1vzp
 dD+I3Wu8kdScC97LGQDI3xSYnoKm/mLw6yoyG34LIZFvtUQSvPtlwIdm0
 OdpfuLnNILRkCudYt9dJ00+3BIWA78yLxTd/e2uWFMjm8Uep/oHMxrT07 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908331"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908331"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823924"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823924"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:23 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/16] ASoC: Intel: avs: Introduce
 avs_log_buffer_status_locked()
Date: Thu,  1 Dec 2022 18:56:07 +0100
Message-Id: <20221201175619.504758-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Simplify locking of firmware log gathering by providing single location
for such purpose.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c |  5 +----
 sound/soc/intel/avs/avs.h | 12 ++++++++++++
 sound/soc/intel/avs/ipc.c |  2 +-
 sound/soc/intel/avs/skl.c |  7 +------
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 7c8ce98eda9d..821d5a9ad25f 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -50,7 +50,6 @@ static int apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32
 static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 {
 	struct apl_log_buffer_layout layout;
-	unsigned long flags;
 	void __iomem *addr, *buf;
 
 	addr = avs_log_buffer_addr(adev, msg->log.core);
@@ -59,7 +58,6 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 
 	memcpy_fromio(&layout, addr, sizeof(layout));
 
-	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
 	if (!kfifo_initialized(&adev->dbg.trace_fifo))
 		/* consume the logs regardless of consumer presence */
 		goto update_read_ptr;
@@ -78,7 +76,6 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 	wake_up(&adev->dbg.trace_waitq);
 
 update_read_ptr:
-	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
 	writel(layout.write_ptr, addr);
 	return 0;
 }
@@ -140,7 +137,7 @@ static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 		 * gathered before dumping stack
 		 */
 		lbs_msg.log.core = msg->ext.coredump.core_id;
-		avs_dsp_op(adev, log_buffer_status, &lbs_msg);
+		avs_log_buffer_status_locked(adev, &lbs_msg);
 	}
 
 	pos = dump + AVS_FW_REGS_SIZE;
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 8d05b27608fe..1c89af6240d2 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -344,6 +344,18 @@ unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
 			 (avs_sram_addr(adev, AVS_DEBUG_WINDOW) + __offset); \
 })
 
+static inline int avs_log_buffer_status_locked(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
+	ret = avs_dsp_op(adev, log_buffer_status, msg);
+	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+
+	return ret;
+}
+
 struct apl_log_buffer_layout {
 	u32 read_ptr;
 	u32 write_ptr;
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index af8a260093f4..bdf013c3dd12 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -266,7 +266,7 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		break;
 
 	case AVS_NOTIFY_LOG_BUFFER_STATUS:
-		avs_dsp_op(adev, log_buffer_status, &msg);
+		avs_log_buffer_status_locked(adev, &msg);
 		break;
 
 	case AVS_NOTIFY_EXCEPTION_CAUGHT:
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index dc98b5cf900f..ff690e99d960 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -55,15 +55,11 @@ int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
 static int
 skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 {
-	unsigned long flags;
 	void __iomem *buf;
 	u16 size, write, offset;
 
-	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
-	if (!kfifo_initialized(&adev->dbg.trace_fifo)) {
-		spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+	if (!kfifo_initialized(&adev->dbg.trace_fifo))
 		return 0;
-	}
 
 	size = avs_log_buffer_size(adev) / 2;
 	write = readl(avs_sram_addr(adev, AVS_FW_REGS_WINDOW) + FW_REGS_DBG_LOG_WP(msg->log.core));
@@ -74,7 +70,6 @@ skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 	buf = avs_log_buffer_addr(adev, msg->log.core) + offset;
 	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf, size, &adev->dbg.fifo_lock);
 	wake_up(&adev->dbg.trace_waitq);
-	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
 
 	return 0;
 }
-- 
2.25.1

