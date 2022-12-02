Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB3640914
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:14:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 150341843;
	Fri,  2 Dec 2022 16:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 150341843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994065;
	bh=j4fRVh7JqO7XwGkD0X2LNVlJObb0km1r7I0KRiPO11o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNxLiBOwVD6aLt7EM3BlsauJHnBKAMC2KN7jTrhWlqcteHvsk/scOmP5t4/Yjqmvq
	 P/qN1osqbyYombK5Nx2T0hGSp55HKKIzF0gBFo5wZCphum777QXK/EqWm8IpSeen+s
	 QbRf3DhAg5ATqo6wEI+NX8K+3ccpSy1WhapdPrJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B44AF805A0;
	Fri,  2 Dec 2022 16:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C7FF8059F; Fri,  2 Dec 2022 16:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 986F6F8057A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 986F6F8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fW1IztLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993912; x=1701529912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4fRVh7JqO7XwGkD0X2LNVlJObb0km1r7I0KRiPO11o=;
 b=fW1IztLNvmCdTCDugqq9AYULEf9F0QQC2OIBUZ0iIY8tamNEu+ird1B9
 ko+UcMgPhs746IAsPDnDZf/QLwWo8ifBRTNgNcA9MQRT/gE7Dms4WdzwZ
 Oy/5hNmb0Pkq7IRKXChOsXfS6XvopzLIF8V94//ZgFC2Y0AwdZ8OEdHof
 jTx5OOUiMWZI5R9n1pglN/JQl2SkP3OaQhuYS9VUk+v/qyoVhq97uXxaS
 7cRe/a6mgQYTUPePz30Ij5//KLfhkc6ECacYux+vQHbN7GF0L7NJRk3D2
 DKgsHrl+wsPHq3q4TOfeoy/BBbXAhT8Q+VFhrrF5K1bxuIi5pz3j07Vmi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251776"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251776"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504719"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504719"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:47 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 08/16] ASoC: Intel: avs: Drop usage of debug members in
 non-debug code
Date: Fri,  2 Dec 2022 16:28:33 +0100
Message-Id: <20221202152841.672536-9-cezary.rojewski@intel.com>
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

Switch to debug-context aware wrappers instead of accessing debug
members directly allowing for readable separation of debug and non-debug
related code. Duplicates are removed along the way.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c     | 11 ++++-------
 sound/soc/intel/avs/avs.h     | 16 ++--------------
 sound/soc/intel/avs/debugfs.c | 18 ++++++++++++++++++
 sound/soc/intel/avs/skl.c     |  5 ++---
 sound/soc/intel/avs/utils.c   | 18 ------------------
 5 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index beef308c9428..02683dce277a 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -59,21 +59,18 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 
 	memcpy_fromio(&layout, addr, sizeof(layout));
 
-	if (!kfifo_initialized(&adev->dbg.trace_fifo))
+	if (!avs_logging_fw(adev))
 		/* consume the logs regardless of consumer presence */
 		goto update_read_ptr;
 
 	buf = apl_log_payload_addr(addr);
 
 	if (layout.read_ptr > layout.write_ptr) {
-		__kfifo_fromio(&adev->dbg.trace_fifo, buf + layout.read_ptr,
-			       apl_log_payload_size(adev) - layout.read_ptr);
+		avs_dump_fw_log(adev, buf + layout.read_ptr,
+				apl_log_payload_size(adev) - layout.read_ptr);
 		layout.read_ptr = 0;
 	}
-	__kfifo_fromio(&adev->dbg.trace_fifo, buf + layout.read_ptr,
-		       layout.write_ptr - layout.read_ptr);
-
-	wake_up(&adev->dbg.trace_waitq);
+	avs_dump_fw_log_wakeup(adev, buf + layout.read_ptr, layout.write_ptr - layout.read_ptr);
 
 update_read_ptr:
 	writel(layout.write_ptr, addr);
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f8f11d8b5936..7a9fb27d3845 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -94,15 +94,6 @@ struct avs_fw_entry {
 	struct list_head node;
 };
 
-struct avs_debug {
-	struct kfifo trace_fifo;
-	spinlock_t trace_lock;	/* serialize debug window I/O between each LOG_BUFFER_STATUS */
-	wait_queue_head_t trace_waitq;
-	u32 aging_timer_period;
-	u32 fifo_full_timer_period;
-	u32 logged_resources;	/* context dependent: core or library */
-};
-
 /*
  * struct avs_dev - Intel HD-Audio driver data
  *
@@ -146,7 +137,6 @@ struct avs_dev {
 	spinlock_t path_list_lock;
 	struct mutex path_mutex;
 
-	struct avs_debug dbg;
 	spinlock_t trace_lock;	/* serialize debug window I/O between each LOG_BUFFER_STATUS */
 #ifdef CONFIG_DEBUG_FS
 	struct kfifo trace_fifo;
@@ -339,8 +329,6 @@ void avs_unregister_all_boards(struct avs_dev *adev);
 
 /* Firmware tracing helpers */
 
-unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len);
-
 #define avs_log_buffer_size(adev) \
 	((adev)->fw_cfg.trace_log_bytes / (adev)->hw_cfg.dsp_cores)
 
@@ -356,9 +344,9 @@ static inline int avs_log_buffer_status_locked(struct avs_dev *adev, union avs_n
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
+	spin_lock_irqsave(&adev->trace_lock, flags);
 	ret = avs_dsp_op(adev, log_buffer_status, msg);
-	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+	spin_unlock_irqrestore(&adev->trace_lock, flags);
 
 	return ret;
 }
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index ac3889e21542..78705bcb09fb 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -11,6 +11,24 @@
 #include <linux/wait.h>
 #include "avs.h"
 
+static unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len)
+{
+	struct __kfifo *__fifo = &fifo->kfifo;
+	unsigned int l, off;
+
+	len = min(len, kfifo_avail(fifo));
+	off = __fifo->in & __fifo->mask;
+	l = min(len, kfifo_size(fifo) - off);
+
+	memcpy_fromio(__fifo->data + off, src, l);
+	memcpy_fromio(__fifo->data, src + l, len - l);
+	/* Make sure data copied from SRAM is visible to all CPUs. */
+	smp_mb();
+	__fifo->in += len;
+
+	return len;
+}
+
 bool avs_logging_fw(struct avs_dev *adev)
 {
 	return kfifo_initialized(&adev->trace_fifo);
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index c5edb0b0df14..6bb8bbc70442 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -59,7 +59,7 @@ skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 	void __iomem *buf;
 	u16 size, write, offset;
 
-	if (!kfifo_initialized(&adev->dbg.trace_fifo))
+	if (!avs_logging_fw(adev))
 		return 0;
 
 	size = avs_log_buffer_size(adev) / 2;
@@ -69,8 +69,7 @@ skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 
 	/* Address is guaranteed to exist in SRAM2. */
 	buf = avs_log_buffer_addr(adev, msg->log.core) + offset;
-	__kfifo_fromio(&adev->dbg.trace_fifo, buf, size);
-	wake_up(&adev->dbg.trace_waitq);
+	avs_dump_fw_log_wakeup(adev, buf, size);
 
 	return 0;
 }
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index 75ad434d7dfb..82416b86662d 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -300,21 +300,3 @@ void avs_release_firmwares(struct avs_dev *adev)
 		kfree(entry);
 	}
 }
-
-unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len)
-{
-	struct __kfifo *__fifo = &fifo->kfifo;
-	unsigned int l, off;
-
-	len = min(len, kfifo_avail(fifo));
-	off = __fifo->in & __fifo->mask;
-	l = min(len, kfifo_size(fifo) - off);
-
-	memcpy_fromio(__fifo->data + off, src, l);
-	memcpy_fromio(__fifo->data, src + l, len - l);
-	/* Make sure data copied from SRAM is visible to all CPUs. */
-	smp_mb();
-	__fifo->in += len;
-
-	return len;
-}
-- 
2.25.1

