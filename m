Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E985BCE4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C01E85;
	Tue, 20 Feb 2024 14:10:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C01E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434610;
	bh=UDXF/Cg/VsBvBHKh+Ni51oB/WcFqkOFpqG5C/RVs8oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EX54sSieb5CepK6TnyvxBbmwv5XOcUvOO01BiKoluq9Vpg0OFfwP8fuNOCNa1RpUM
	 BKqVtmd4s2ghgnernyjePkgcZx7GeihDRrqItpNkH4RzTnwVutBgMhzCBaQ+7I8vHC
	 gjFSblbVPmlnnh5zfsBYOtXmzrFFS6m/rbDhs9mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E00AFF80633; Tue, 20 Feb 2024 14:07:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFEAF8068D;
	Tue, 20 Feb 2024 14:07:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A0F6F8047D; Tue, 20 Feb 2024 14:06:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8578F80568
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8578F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DUUGxAix
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434224; x=1739970224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UDXF/Cg/VsBvBHKh+Ni51oB/WcFqkOFpqG5C/RVs8oM=;
  b=DUUGxAixjh+Nq3gQ9tajxnYvRKRofr9b8xSQx1DiRJHh3uFyI1TRRU0d
   Y13/kf4eZt/0ew9BgXpqupJpDGLPNk3y0XqvxxGC0SAzXpD5nRDJq9X3j
   QwbkKjlzhohgQBh3Ca+8Lqt9RE7pyOuio9iJxqLDMM6fQVvePhUohu+f1
   3Yw2qW2yk11ieldqIPF1Lbx6pPmsFg4nNNcHWzjuTaF7OHoRVrmt39IQy
   Mm9P3Bi7zBhVBYcUEX6B/jxLo6tFQa+TkJEIjle/eTUb4Jlq1zpglIIzb
   Ax799NdTohEVtVfpzp+HHUiJ0fiHeAgXpl4CjHN7/anUITrk9aws0JluO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988973"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4750985"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/10] ASoC: Intel: avs: Abstract IPC handling
Date: Tue, 20 Feb 2024 12:50:29 +0100
Message-Id: <20240220115035.770402-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T4VDA5OZ62X7Q35R774W6HW32OJSORO2
X-Message-ID-Hash: T4VDA5OZ62X7Q35R774W6HW32OJSORO2
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4VDA5OZ62X7Q35R774W6HW32OJSORO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Servicing IPCs on CNL platforms and onward differs from the existing
one. To make room for these, enrich platform descriptor with fields
representing crucial IPC registers and utilize them throughout the code.

While cleaning up device descriptors, reduce the number of code lines by
assigning 'min_fw_version' within a single line.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h       | 22 ++++++++++++---
 sound/soc/intel/avs/core.c      | 47 ++++++++++++++++++++-------------
 sound/soc/intel/avs/ipc.c       | 36 ++++++++++++++-----------
 sound/soc/intel/avs/loader.c    |  2 +-
 sound/soc/intel/avs/registers.h |  6 ++---
 5 files changed, 72 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index ca14fcd6550a..b93f38515403 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -73,6 +73,23 @@ extern const struct avs_dsp_ops avs_apl_dsp_ops;
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
 
+struct avs_sram_spec {
+	const u32 base_offset;
+	const u32 window_size;
+	const u32 rom_status_offset;
+};
+
+struct avs_hipc_spec {
+	const u32 req_offset;
+	const u32 req_ext_offset;
+	const u32 req_busy_mask;
+	const u32 ack_offset;
+	const u32 ack_done_mask;
+	const u32 rsp_offset;
+	const u32 rsp_busy_mask;
+	const u32 ctl_offset;
+};
+
 /* Platform specific descriptor */
 struct avs_spec {
 	const char *name;
@@ -82,9 +99,8 @@ struct avs_spec {
 
 	const u32 core_init_mask;	/* used during DSP boot */
 	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
-	const u32 sram_base_offset;
-	const u32 sram_window_size;
-	const u32 rom_status;
+	const struct avs_sram_spec *sram;
+	const struct avs_hipc_spec *hipc;
 };
 
 struct avs_fw_entry {
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 75048a5f00f1..46162d637573 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -730,36 +730,47 @@ static const struct dev_pm_ops avs_dev_pm = {
 	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
 };
 
+static const struct avs_sram_spec skl_sram_spec = {
+	.base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
+	.window_size = SKL_ADSP_SRAM_WINDOW_SIZE,
+	.rom_status_offset = SKL_ADSP_SRAM_BASE_OFFSET,
+};
+
+static const struct avs_sram_spec apl_sram_spec = {
+	.base_offset = APL_ADSP_SRAM_BASE_OFFSET,
+	.window_size = APL_ADSP_SRAM_WINDOW_SIZE,
+	.rom_status_offset = APL_ADSP_SRAM_BASE_OFFSET,
+};
+
+static const struct avs_hipc_spec skl_hipc_spec = {
+	.req_offset = SKL_ADSP_REG_HIPCI,
+	.req_ext_offset = SKL_ADSP_REG_HIPCIE,
+	.req_busy_mask = SKL_ADSP_HIPCI_BUSY,
+	.ack_offset = SKL_ADSP_REG_HIPCIE,
+	.ack_done_mask = SKL_ADSP_HIPCIE_DONE,
+	.rsp_offset = SKL_ADSP_REG_HIPCT,
+	.rsp_busy_mask = SKL_ADSP_HIPCT_BUSY,
+	.ctl_offset = SKL_ADSP_REG_HIPCCTL,
+};
+
 static const struct avs_spec skl_desc = {
 	.name = "skl",
-	.min_fw_version = {
-		.major = 9,
-		.minor = 21,
-		.hotfix = 0,
-		.build = 4732,
-	},
+	.min_fw_version = { 9, 21, 0, 4732 },
 	.dsp_ops = &avs_skl_dsp_ops,
 	.core_init_mask = 1,
 	.attributes = AVS_PLATATTR_CLDMA,
-	.sram_base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
-	.sram_window_size = SKL_ADSP_SRAM_WINDOW_SIZE,
-	.rom_status = SKL_ADSP_SRAM_BASE_OFFSET,
+	.sram = &skl_sram_spec,
+	.hipc = &skl_hipc_spec,
 };
 
 static const struct avs_spec apl_desc = {
 	.name = "apl",
-	.min_fw_version = {
-		.major = 9,
-		.minor = 22,
-		.hotfix = 1,
-		.build = 4323,
-	},
+	.min_fw_version = { 9, 22, 1, 4323 },
 	.dsp_ops = &avs_apl_dsp_ops,
 	.core_init_mask = 3,
 	.attributes = AVS_PLATATTR_IMR,
-	.sram_base_offset = APL_ADSP_SRAM_BASE_OFFSET,
-	.sram_window_size = APL_ADSP_SRAM_WINDOW_SIZE,
-	.rom_status = APL_ADSP_SRAM_BASE_OFFSET,
+	.sram = &apl_sram_spec,
+	.hipc = &skl_hipc_spec,
 };
 
 static const struct pci_device_id avs_ids[] = {
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 65bfc83bd1f0..29c7f508a7d6 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -305,6 +305,7 @@ irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
 {
 	struct avs_dev *adev = dev_id;
 	struct avs_ipc *ipc = adev->ipc;
+	const struct avs_spec *const spec = adev->spec;
 	u32 adspis, hipc_rsp, hipc_ack;
 	irqreturn_t ret = IRQ_NONE;
 
@@ -312,35 +313,35 @@ irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
 	if (adspis == UINT_MAX || !(adspis & AVS_ADSP_ADSPIS_IPC))
 		return ret;
 
-	hipc_ack = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCIE);
-	hipc_rsp = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
+	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
 
 	/* DSP acked host's request */
-	if (hipc_ack & SKL_ADSP_HIPCIE_DONE) {
+	if (hipc_ack & spec->hipc->ack_done_mask) {
 		/*
 		 * As an extra precaution, mask done interrupt. Code executed
 		 * due to complete() found below does not assume any masking.
 		 */
-		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
+		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
 				      AVS_ADSP_HIPCCTL_DONE, 0);
 
 		complete(&ipc->done_completion);
 
 		/* tell DSP it has our attention */
-		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCIE,
-				      SKL_ADSP_HIPCIE_DONE,
-				      SKL_ADSP_HIPCIE_DONE);
+		snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset,
+				      spec->hipc->ack_done_mask,
+				      spec->hipc->ack_done_mask);
 		/* unmask done interrupt */
-		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
+		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
 				      AVS_ADSP_HIPCCTL_DONE,
 				      AVS_ADSP_HIPCCTL_DONE);
 		ret = IRQ_HANDLED;
 	}
 
 	/* DSP sent new response to process */
-	if (hipc_rsp & SKL_ADSP_HIPCT_BUSY) {
+	if (hipc_rsp & spec->hipc->rsp_busy_mask) {
 		/* mask busy interrupt */
-		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
+		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
 				      AVS_ADSP_HIPCCTL_BUSY, 0);
 
 		ret = IRQ_WAKE_THREAD;
@@ -379,10 +380,11 @@ irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
 static bool avs_ipc_is_busy(struct avs_ipc *ipc)
 {
 	struct avs_dev *adev = to_avs_dev(ipc->dev);
+	const struct avs_spec *const spec = adev->spec;
 	u32 hipc_rsp;
 
-	hipc_rsp = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
-	return hipc_rsp & SKL_ADSP_HIPCT_BUSY;
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
+	return hipc_rsp & spec->hipc->rsp_busy_mask;
 }
 
 static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
@@ -440,9 +442,10 @@ static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg *reply)
 
 static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg *tx, bool read_fwregs)
 {
+	const struct avs_spec *const spec = adev->spec;
 	u64 reg = ULONG_MAX;
 
-	tx->header |= SKL_ADSP_HIPCI_BUSY;
+	tx->header |= spec->hipc->req_busy_mask;
 	if (read_fwregs)
 		reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
 
@@ -450,8 +453,8 @@ static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg *tx, bool r
 
 	if (tx->size)
 		memcpy_toio(avs_downlink_addr(adev), tx->data, tx->size);
-	snd_hdac_adsp_writel(adev, SKL_ADSP_REG_HIPCIE, tx->header >> 32);
-	snd_hdac_adsp_writel(adev, SKL_ADSP_REG_HIPCI, tx->header & UINT_MAX);
+	snd_hdac_adsp_writel(adev, spec->hipc->req_ext_offset, tx->header >> 32);
+	snd_hdac_adsp_writel(adev, spec->hipc->req_offset, tx->header & UINT_MAX);
 }
 
 static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
@@ -606,6 +609,7 @@ int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, cons
 
 void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
 {
+	const struct avs_spec *const spec = adev->spec;
 	u32 value, mask;
 
 	/*
@@ -617,7 +621,7 @@ void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
 
 	mask = AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY;
 	value = enable ? mask : 0;
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL, mask, value);
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset, mask, value);
 }
 
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index e83ce6a35755..8e34d3536082 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -306,7 +306,7 @@ avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
 	}
 
 	/* await ROM init */
-	ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
+	ret = snd_hdac_adsp_readq_poll(adev, spec->sram->rom_status_offset, reg,
 				       (reg & 0xF) == AVS_ROM_INIT_DONE ||
 				       (reg & 0xF) == APL_ROM_FW_ENTERED,
 				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 078a0ebafa42..8468acd15c3d 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -57,7 +57,7 @@
 #define APL_ADSP_SRAM_WINDOW_SIZE	0x20000
 
 /* Constants used when accessing SRAM, space shared with firmware */
-#define AVS_FW_REG_BASE(adev)		((adev)->spec->sram_base_offset)
+#define AVS_FW_REG_BASE(adev)		((adev)->spec->sram->base_offset)
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
 #define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
 
@@ -72,8 +72,8 @@
 
 /* registry I/O helpers */
 #define avs_sram_offset(adev, window_idx) \
-	((adev)->spec->sram_base_offset + \
-	 (adev)->spec->sram_window_size * (window_idx))
+	((adev)->spec->sram->base_offset + \
+	 (adev)->spec->sram->window_size * (window_idx))
 
 #define avs_sram_addr(adev, window_idx) \
 	((adev)->dsp_ba + avs_sram_offset(adev, window_idx))
-- 
2.25.1

