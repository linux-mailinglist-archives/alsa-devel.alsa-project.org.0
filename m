Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8D282A25
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1BE1682;
	Sun,  4 Oct 2020 12:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1BE1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601806162;
	bh=GL3EMLh16xBS+buSFl3FO4eTClMVEoTlV5NGXNJcMiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STZHKFov9P79/2UySvymZLoqbabVdPyhhOaODEXXkcaL5L/lqJaTGSWiwR8jUmpmz
	 OOlJ6aKehw+/LSPmdoHos+6HSwLC28vxmCJuae7Vqo3NGPGqCd5vVclnxILwNGzCpZ
	 TOi0sABCrYLc63GI3uHrhKbi9pAxQXYvl72lBhr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A34F80346;
	Sun,  4 Oct 2020 12:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25D35F80323; Sun,  4 Oct 2020 12:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B6CFF802EA
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6CFF802EA
IronPort-SDR: wzn6NgZ3xyuEmBuR+QrQFvA9R/kxaKBj8vKH8ASAO8NglHrN13EL+qUnIkP71OqwawgG1ARoFc
 8BJ2zmj8s3BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="163384006"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="163384006"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:02:10 -0700
IronPort-SDR: stfZFq4OKTvhtGI4+afSroLpnZNscdzXhJMjMWZv4XhLUn9lkL5R5WG3CN67Uxsb3MGTPMw/e7
 DdKqN1upRrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527927"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:02:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/13] ASoC: Intel: Remove unused DSP operations
Date: Sun,  4 Oct 2020 12:01:23 +0200
Message-Id: <20201004100128.5842-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004100128.5842-1-cezary.rojewski@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

sound/soc/intel/common/ declares several helper functions for /intel/
solutions. In practice, differences between these - /haswell/ and
/skylake/ especially - led to many of the helpers being used only by a
single solution. As /skylake/ makes no use of these and /haswell/ and
/baytail/ are no more, remove the unused functions.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h |  13 ---
 sound/soc/intel/common/sst-dsp.c      | 162 --------------------------
 sound/soc/intel/common/sst-dsp.h      |  26 -----
 sound/soc/intel/common/sst-ipc.c      |  27 -----
 sound/soc/intel/common/sst-ipc.h      |   1 -
 5 files changed, 229 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 6b6738a289dc..3787ef07b840 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -146,19 +146,6 @@ struct sst_dsp {
 	struct snd_dma_buffer dmab;
 };
 
-/* Size optimised DRAM/IRAM memcpy */
-static inline void sst_dsp_write(struct sst_dsp *sst, void *src,
-	u32 dest_offset, size_t bytes)
-{
-	sst->ops->ram_write(sst, sst->addr.lpe + dest_offset, src, bytes);
-}
-
-static inline void sst_dsp_read(struct sst_dsp *sst, void *dest,
-	u32 src_offset, size_t bytes)
-{
-	sst->ops->ram_read(sst, dest, sst->addr.lpe + src_offset, bytes);
-}
-
 static inline void *sst_dsp_get_thread_context(struct sst_dsp *sst)
 {
 	return sst->thread_context;
diff --git a/sound/soc/intel/common/sst-dsp.c b/sound/soc/intel/common/sst-dsp.c
index 36c077aa386e..229d09d61afb 100644
--- a/sound/soc/intel/common/sst-dsp.c
+++ b/sound/soc/intel/common/sst-dsp.c
@@ -44,38 +44,6 @@ u64 sst_shim32_read64(void __iomem *addr, u32 offset)
 }
 EXPORT_SYMBOL_GPL(sst_shim32_read64);
 
-static inline void _sst_memcpy_toio_32(volatile u32 __iomem *dest,
-	u32 *src, size_t bytes)
-{
-	int i, words = bytes >> 2;
-
-	for (i = 0; i < words; i++)
-		writel(src[i], dest + i);
-}
-
-static inline void _sst_memcpy_fromio_32(u32 *dest,
-	const volatile __iomem u32 *src, size_t bytes)
-{
-	int i, words = bytes >> 2;
-
-	for (i = 0; i < words; i++)
-		dest[i] = readl(src + i);
-}
-
-void sst_memcpy_toio_32(struct sst_dsp *sst,
-	void __iomem *dest, void *src, size_t bytes)
-{
-	_sst_memcpy_toio_32(dest, src, bytes);
-}
-EXPORT_SYMBOL_GPL(sst_memcpy_toio_32);
-
-void sst_memcpy_fromio_32(struct sst_dsp *sst, void *dest,
-	void __iomem *src, size_t bytes)
-{
-	_sst_memcpy_fromio_32(dest, src, bytes);
-}
-EXPORT_SYMBOL_GPL(sst_memcpy_fromio_32);
-
 /* Public API */
 void sst_dsp_shim_write(struct sst_dsp *sst, u32 offset, u32 value)
 {
@@ -100,29 +68,6 @@ u32 sst_dsp_shim_read(struct sst_dsp *sst, u32 offset)
 }
 EXPORT_SYMBOL_GPL(sst_dsp_shim_read);
 
-void sst_dsp_shim_write64(struct sst_dsp *sst, u32 offset, u64 value)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sst->spinlock, flags);
-	sst->ops->write64(sst->addr.shim, offset, value);
-	spin_unlock_irqrestore(&sst->spinlock, flags);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_write64);
-
-u64 sst_dsp_shim_read64(struct sst_dsp *sst, u32 offset)
-{
-	unsigned long flags;
-	u64 val;
-
-	spin_lock_irqsave(&sst->spinlock, flags);
-	val = sst->ops->read64(sst->addr.shim, offset);
-	spin_unlock_irqrestore(&sst->spinlock, flags);
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_read64);
-
 void sst_dsp_shim_write_unlocked(struct sst_dsp *sst, u32 offset, u32 value)
 {
 	sst->ops->write(sst->addr.shim, offset, value);
@@ -135,18 +80,6 @@ u32 sst_dsp_shim_read_unlocked(struct sst_dsp *sst, u32 offset)
 }
 EXPORT_SYMBOL_GPL(sst_dsp_shim_read_unlocked);
 
-void sst_dsp_shim_write64_unlocked(struct sst_dsp *sst, u32 offset, u64 value)
-{
-	sst->ops->write64(sst->addr.shim, offset, value);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_write64_unlocked);
-
-u64 sst_dsp_shim_read64_unlocked(struct sst_dsp *sst, u32 offset)
-{
-	return sst->ops->read64(sst->addr.shim, offset);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_read64_unlocked);
-
 int sst_dsp_shim_update_bits_unlocked(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value)
 {
@@ -167,24 +100,6 @@ int sst_dsp_shim_update_bits_unlocked(struct sst_dsp *sst, u32 offset,
 }
 EXPORT_SYMBOL_GPL(sst_dsp_shim_update_bits_unlocked);
 
-int sst_dsp_shim_update_bits64_unlocked(struct sst_dsp *sst, u32 offset,
-				u64 mask, u64 value)
-{
-	bool change;
-	u64 old, new;
-
-	old = sst_dsp_shim_read64_unlocked(sst, offset);
-
-	new = (old & (~mask)) | (value & mask);
-
-	change = (old != new);
-	if (change)
-		sst_dsp_shim_write64_unlocked(sst, offset, new);
-
-	return change;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_update_bits64_unlocked);
-
 /* This is for registers bits with attribute RWC */
 void sst_dsp_shim_update_bits_forced_unlocked(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value)
@@ -214,19 +129,6 @@ int sst_dsp_shim_update_bits(struct sst_dsp *sst, u32 offset,
 }
 EXPORT_SYMBOL_GPL(sst_dsp_shim_update_bits);
 
-int sst_dsp_shim_update_bits64(struct sst_dsp *sst, u32 offset,
-				u64 mask, u64 value)
-{
-	unsigned long flags;
-	bool change;
-
-	spin_lock_irqsave(&sst->spinlock, flags);
-	change = sst_dsp_shim_update_bits64_unlocked(sst, offset, mask, value);
-	spin_unlock_irqrestore(&sst->spinlock, flags);
-	return change;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_shim_update_bits64);
-
 /* This is for registers bits with attribute RWC */
 void sst_dsp_shim_update_bits_forced(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value)
@@ -279,70 +181,6 @@ int sst_dsp_register_poll(struct sst_dsp *ctx, u32 offset, u32 mask,
 }
 EXPORT_SYMBOL_GPL(sst_dsp_register_poll);
 
-void sst_dsp_dump(struct sst_dsp *sst)
-{
-	if (sst->ops->dump)
-		sst->ops->dump(sst);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_dump);
-
-void sst_dsp_reset(struct sst_dsp *sst)
-{
-	if (sst->ops->reset)
-		sst->ops->reset(sst);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_reset);
-
-int sst_dsp_boot(struct sst_dsp *sst)
-{
-	if (sst->ops->boot)
-		sst->ops->boot(sst);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_boot);
-
-int sst_dsp_wake(struct sst_dsp *sst)
-{
-	if (sst->ops->wake)
-		return sst->ops->wake(sst);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_wake);
-
-void sst_dsp_sleep(struct sst_dsp *sst)
-{
-	if (sst->ops->sleep)
-		sst->ops->sleep(sst);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_sleep);
-
-void sst_dsp_stall(struct sst_dsp *sst)
-{
-	if (sst->ops->stall)
-		sst->ops->stall(sst);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_stall);
-
-void sst_dsp_ipc_msg_tx(struct sst_dsp *dsp, u32 msg)
-{
-	sst_dsp_shim_write_unlocked(dsp, SST_IPCX, msg | SST_IPCX_BUSY);
-	trace_sst_ipc_msg_tx(msg);
-}
-EXPORT_SYMBOL_GPL(sst_dsp_ipc_msg_tx);
-
-u32 sst_dsp_ipc_msg_rx(struct sst_dsp *dsp)
-{
-	u32 msg;
-
-	msg = sst_dsp_shim_read_unlocked(dsp, SST_IPCX);
-	trace_sst_ipc_msg_rx(msg);
-
-	return msg;
-}
-EXPORT_SYMBOL_GPL(sst_dsp_ipc_msg_rx);
-
 int sst_dsp_mailbox_init(struct sst_dsp *sst, u32 inbox_offset, size_t inbox_size,
 	u32 outbox_offset, size_t outbox_size)
 {
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index ebd0dc5706a0..427970add9c7 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -212,10 +212,6 @@ void sst_dsp_shim_write(struct sst_dsp *sst, u32 offset, u32 value);
 u32 sst_dsp_shim_read(struct sst_dsp *sst, u32 offset);
 int sst_dsp_shim_update_bits(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value);
-void sst_dsp_shim_write64(struct sst_dsp *sst, u32 offset, u64 value);
-u64 sst_dsp_shim_read64(struct sst_dsp *sst, u32 offset);
-int sst_dsp_shim_update_bits64(struct sst_dsp *sst, u32 offset,
-				u64 mask, u64 value);
 void sst_dsp_shim_update_bits_forced(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value);
 
@@ -224,10 +220,6 @@ void sst_dsp_shim_write_unlocked(struct sst_dsp *sst, u32 offset, u32 value);
 u32 sst_dsp_shim_read_unlocked(struct sst_dsp *sst, u32 offset);
 int sst_dsp_shim_update_bits_unlocked(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value);
-void sst_dsp_shim_write64_unlocked(struct sst_dsp *sst, u32 offset, u64 value);
-u64 sst_dsp_shim_read64_unlocked(struct sst_dsp *sst, u32 offset);
-int sst_dsp_shim_update_bits64_unlocked(struct sst_dsp *sst, u32 offset,
-					u64 mask, u64 value);
 void sst_dsp_shim_update_bits_forced_unlocked(struct sst_dsp *sst, u32 offset,
 				u32 mask, u32 value);
 
@@ -236,21 +228,6 @@ void sst_shim32_write(void __iomem *addr, u32 offset, u32 value);
 u32 sst_shim32_read(void __iomem *addr, u32 offset);
 void sst_shim32_write64(void __iomem *addr, u32 offset, u64 value);
 u64 sst_shim32_read64(void __iomem *addr, u32 offset);
-void sst_memcpy_toio_32(struct sst_dsp *sst,
-			void __iomem *dest, void *src, size_t bytes);
-void sst_memcpy_fromio_32(struct sst_dsp *sst,
-			  void *dest, void __iomem *src, size_t bytes);
-
-/* DSP reset & boot */
-void sst_dsp_reset(struct sst_dsp *sst);
-int sst_dsp_boot(struct sst_dsp *sst);
-int sst_dsp_wake(struct sst_dsp *sst);
-void sst_dsp_sleep(struct sst_dsp *sst);
-void sst_dsp_stall(struct sst_dsp *sst);
-
-/* Msg IO */
-void sst_dsp_ipc_msg_tx(struct sst_dsp *dsp, u32 msg);
-u32 sst_dsp_ipc_msg_rx(struct sst_dsp *dsp);
 
 /* Mailbox management */
 int sst_dsp_mailbox_init(struct sst_dsp *sst, u32 inbox_offset,
@@ -262,7 +239,4 @@ void sst_dsp_outbox_read(struct sst_dsp *sst, void *message, size_t bytes);
 int sst_dsp_register_poll(struct sst_dsp  *ctx, u32 offset, u32 mask,
 		 u32 target, u32 time, char *operation);
 
-/* Debug */
-void sst_dsp_dump(struct sst_dsp *sst);
-
 #endif
diff --git a/sound/soc/intel/common/sst-ipc.c b/sound/soc/intel/common/sst-ipc.c
index 6068bb697e22..89c10724d2a3 100644
--- a/sound/soc/intel/common/sst-ipc.c
+++ b/sound/soc/intel/common/sst-ipc.c
@@ -254,33 +254,6 @@ void sst_ipc_tx_msg_reply_complete(struct sst_generic_ipc *ipc,
 }
 EXPORT_SYMBOL_GPL(sst_ipc_tx_msg_reply_complete);
 
-void sst_ipc_drop_all(struct sst_generic_ipc *ipc)
-{
-	struct ipc_message *msg, *tmp;
-	unsigned long flags;
-	int tx_drop_cnt = 0, rx_drop_cnt = 0;
-
-	/* drop all TX and Rx messages before we stall + reset DSP */
-	spin_lock_irqsave(&ipc->dsp->spinlock, flags);
-
-	list_for_each_entry_safe(msg, tmp, &ipc->tx_list, list) {
-		list_move(&msg->list, &ipc->empty_list);
-		tx_drop_cnt++;
-	}
-
-	list_for_each_entry_safe(msg, tmp, &ipc->rx_list, list) {
-		list_move(&msg->list, &ipc->empty_list);
-		rx_drop_cnt++;
-	}
-
-	spin_unlock_irqrestore(&ipc->dsp->spinlock, flags);
-
-	if (tx_drop_cnt || rx_drop_cnt)
-		dev_err(ipc->dev, "dropped IPC msg RX=%d, TX=%d\n",
-			tx_drop_cnt, rx_drop_cnt);
-}
-EXPORT_SYMBOL_GPL(sst_ipc_drop_all);
-
 int sst_ipc_init(struct sst_generic_ipc *ipc)
 {
 	int ret;
diff --git a/sound/soc/intel/common/sst-ipc.h b/sound/soc/intel/common/sst-ipc.h
index 08c4831b2664..9c1f59d88636 100644
--- a/sound/soc/intel/common/sst-ipc.h
+++ b/sound/soc/intel/common/sst-ipc.h
@@ -82,7 +82,6 @@ struct ipc_message *sst_ipc_reply_find_msg(struct sst_generic_ipc *ipc,
 void sst_ipc_tx_msg_reply_complete(struct sst_generic_ipc *ipc,
 	struct ipc_message *msg);
 
-void sst_ipc_drop_all(struct sst_generic_ipc *ipc);
 int sst_ipc_init(struct sst_generic_ipc *ipc);
 void sst_ipc_fini(struct sst_generic_ipc *ipc);
 
-- 
2.17.1

