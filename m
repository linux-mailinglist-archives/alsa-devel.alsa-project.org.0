Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7464090B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:13:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC407850;
	Fri,  2 Dec 2022 16:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC407850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994018;
	bh=v8tvg6vAeBgApAzccWiMZov4CD5WfpL8Xm6BZJmYC4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKsP82sLN7yZZoKUAU0Ws6D0TxC6FXrFg86rECoePn4XCwUXwD536u4VBeJAfidEm
	 I6mcCy4nA34O7BJHyjlIhCFmadm/OUyafcVb8xG33KpdXLbzivrFsyd5wjEDqXgCZu
	 tJNIopMQLiPLSpuPaMXY1y94gRzvjMgyqPCXUPvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5971FF80571;
	Fri,  2 Dec 2022 16:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D351AF80579; Fri,  2 Dec 2022 16:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4336F804E2
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4336F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d4sACnPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993904; x=1701529904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8tvg6vAeBgApAzccWiMZov4CD5WfpL8Xm6BZJmYC4w=;
 b=d4sACnPZxgQ2daG6miKAEP/Ze9gMmkhA3/YkD5gj5Cz8qhmr+8PMI9F8
 mLvMQsRDE800NneH5sut9m41SrG1AdEfwqVcl7Z1Q2HGzBenV+29surGC
 DJN1AYZY5c0upvYPFMmNbPynCu2ATxyl0+IOhqfxTFoim21M977ugRwDr
 t2jN9wE7lxAk1gRUEQg3YmCiG2IVCI9qLJyNCXDvR5Z3P12m22aq+8Yac
 0RtoNu13rDXX8dTn5LDg914Nd9gkbrbGJVp3DHG/eXtP7Vnx8quhEwYFe
 qTpymWxSZqYEKYB5dQN1CdMxdceg3pSEbiZTkeywHpjYos52D+qzTtpgG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251737"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251737"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504680"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504680"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 04/16] ASoC: Intel: avs: Introduce
 avs_log_buffer_status_locked()
Date: Fri,  2 Dec 2022 16:28:29 +0100
Message-Id: <20221202152841.672536-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
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

