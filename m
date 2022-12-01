Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F563F64D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C34717C5;
	Thu,  1 Dec 2022 18:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C34717C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916520;
	bh=MVA22SgVccU7nYC02ZMmY1CiVHpLrTesbL06gzdzuEk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQDmrzqXYUnox/smN1vrKExQxJB7gzNXI/EkrTOK1uICZi+ed+Wd2xb7QOxTeuTsX
	 GSv3tT05aBljF9Pv7tcOr7pF25qhnm3ED7P2ehbatBfT3RuNrP0gUcnlHgbZk+ViNk
	 k6lDE76otWzkHAFd0dTVsK1DGq+VugvvM9S5+1Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1941F8057A;
	Thu,  1 Dec 2022 18:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068F7F80563; Thu,  1 Dec 2022 18:39:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C014F8053D
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C014F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a1TRKD8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916369; x=1701452369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVA22SgVccU7nYC02ZMmY1CiVHpLrTesbL06gzdzuEk=;
 b=a1TRKD8piQE7IPIfNCYSOAatK81fqtr29qC69BNxZCtukyvmIBfEW8KC
 Wpge5E58dpaQnR/vyaCs9oN8CxSrGrXIamIrJA56HLqUCBrp3de9BsIcs
 4QJMnYYWJEA8pdC9uzWx/MN0TttKqIvDj3fpLkL44TfB4BvL1xHr3CCBv
 SikZhCXXFzEuJw+Z/CcqnxrDFWjzYFivvig6tqIOizRbBVlbcSi2Tap+n
 o1hEYXU7CpCp9kt7O5BrkCxfBxMfqjlyOzh2PZQQn9WKnwfrb92E1K82n
 iysuqxsv7Fd2lX27hJY018EcDb2KUJKS4mtlos+nPMFwSwwRGff/q74Ii Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908344"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908344"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823932"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823932"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/16] ASoC: Intel: avs: Drop fifo_lock
Date: Thu,  1 Dec 2022 18:56:08 +0100
Message-Id: <20221201175619.504758-6-cezary.rojewski@intel.com>
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

Log gathering is already locked, thanks to ->trace_lock.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c   | 9 ++++-----
 sound/soc/intel/avs/avs.h   | 4 +---
 sound/soc/intel/avs/skl.c   | 2 +-
 sound/soc/intel/avs/utils.c | 6 +-----
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 821d5a9ad25f..66672ffd95df 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -65,13 +65,12 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 	buf = apl_log_payload_addr(addr);
 
 	if (layout.read_ptr > layout.write_ptr) {
-		__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf + layout.read_ptr,
-				      apl_log_payload_size(adev) - layout.read_ptr,
-				      &adev->dbg.fifo_lock);
+		__kfifo_fromio(&adev->dbg.trace_fifo, buf + layout.read_ptr,
+			       apl_log_payload_size(adev) - layout.read_ptr);
 		layout.read_ptr = 0;
 	}
-	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf + layout.read_ptr,
-			      layout.write_ptr - layout.read_ptr, &adev->dbg.fifo_lock);
+	__kfifo_fromio(&adev->dbg.trace_fifo, buf + layout.read_ptr,
+		       layout.write_ptr - layout.read_ptr);
 
 	wake_up(&adev->dbg.trace_waitq);
 
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 1c89af6240d2..957151ecf39a 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -95,7 +95,6 @@ struct avs_fw_entry {
 
 struct avs_debug {
 	struct kfifo trace_fifo;
-	spinlock_t fifo_lock;	/* serialize I/O for trace_fifo */
 	spinlock_t trace_lock;	/* serialize debug window I/O between each LOG_BUFFER_STATUS */
 	wait_queue_head_t trace_waitq;
 	u32 aging_timer_period;
@@ -331,8 +330,7 @@ void avs_unregister_all_boards(struct avs_dev *adev);
 
 /* Firmware tracing helpers */
 
-unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src, unsigned int len,
-				   spinlock_t *lock);
+unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len);
 
 #define avs_log_buffer_size(adev) \
 	((adev)->fw_cfg.trace_log_bytes / (adev)->hw_cfg.dsp_cores)
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index ff690e99d960..936cd44eb73e 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -68,7 +68,7 @@ skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 
 	/* Address is guaranteed to exist in SRAM2. */
 	buf = avs_log_buffer_addr(adev, msg->log.core) + offset;
-	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf, size, &adev->dbg.fifo_lock);
+	__kfifo_fromio(&adev->dbg.trace_fifo, buf, size);
 	wake_up(&adev->dbg.trace_waitq);
 
 	return 0;
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index 13611dee9787..75ad434d7dfb 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -301,14 +301,11 @@ void avs_release_firmwares(struct avs_dev *adev)
 	}
 }
 
-unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src, unsigned int len,
-				   spinlock_t *lock)
+unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len)
 {
 	struct __kfifo *__fifo = &fifo->kfifo;
-	unsigned long flags;
 	unsigned int l, off;
 
-	spin_lock_irqsave(lock, flags);
 	len = min(len, kfifo_avail(fifo));
 	off = __fifo->in & __fifo->mask;
 	l = min(len, kfifo_size(fifo) - off);
@@ -318,7 +315,6 @@ unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
 	/* Make sure data copied from SRAM is visible to all CPUs. */
 	smp_mb();
 	__fifo->in += len;
-	spin_unlock_irqrestore(lock, flags);
 
 	return len;
 }
-- 
2.25.1

