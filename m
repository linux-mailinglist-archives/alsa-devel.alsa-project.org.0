Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1BD63F651
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:42:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C0817F4;
	Thu,  1 Dec 2022 18:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C0817F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916555;
	bh=j4fRVh7JqO7XwGkD0X2LNVlJObb0km1r7I0KRiPO11o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fag8NPxGYO23ZiQhrsLr+xNDs7KuwX/4Vg8FCfD5i/uUtE24EiBW6G149hlVO18au
	 qg15lWCHpDMc0f+ikBhskL8NvAMtYtOV3WtPNQ4zmF53Lv62/1Poxi3Y7v2aLczq+K
	 y/viR8eZ12WWYJKSZO0IE0GOQvxID5WrOpGf2V/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13636F8059F;
	Thu,  1 Dec 2022 18:39:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80402F8057F; Thu,  1 Dec 2022 18:39:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 484D4F8055C
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484D4F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZMPd30cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916375; x=1701452375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4fRVh7JqO7XwGkD0X2LNVlJObb0km1r7I0KRiPO11o=;
 b=ZMPd30cv9W1C0Ljpq/JWzdPOZx2KsuR9IYdJkEjgF3IJmE1w8chDY9ik
 n7jVU6WmVlumgX5kFS6QAaRigDIm0+vgS/OY+Qh4/smaHBU9cTzbnzx6+
 ccdqggk3SKILEgzrToNkmm9+kAUQYxPva4i2Lbz2+/2MQaZvezZCIHLhG
 OIlcAOwBSgxZjhPaRoaQhGwxhKRWtfZGRG6Eb2HZe1Te7Az29hUStuhlx
 CeDkE7I32RqfVM/0RlF6ocfCGapNveuO+t2/SXfIV/oSl1E88UdzJDpZP
 olxVnkebHllh17gdwV7kusjRQQN+D/lP5w2y4UcTBqcsZ9bUg+SmlUkdi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908375"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908375"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823954"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823954"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:31 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/16] ASoC: Intel: avs: Drop usage of debug members in
 non-debug code
Date: Thu,  1 Dec 2022 18:56:11 +0100
Message-Id: <20221201175619.504758-9-cezary.rojewski@intel.com>
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

