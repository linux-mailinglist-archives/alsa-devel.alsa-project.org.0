Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275C8AAADF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FA9847;
	Fri, 19 Apr 2024 10:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FA9847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516526;
	bh=T/auqFeU8XuNI3ERYKCoyJWWmoI23t5xryIvvLyTOCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dlXKmmcadxUsuwqaq4IjQKAxLyBfrIrm0pO6wQtvRGwv1cn8pWXOzr5CQuzrEwgRj
	 Z8w/jGLGSAmD29tYckfPvzWp0RpmJfSe28TZjvVq5ocgjdyOTVdyk7FM+p/Ql2NXFW
	 0IS6UPpLqgqHMyeZM1O/nLJ9TDLH3+N6Z2vjnWu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47924F80605; Fri, 19 Apr 2024 10:47:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD6AF80600;
	Fri, 19 Apr 2024 10:47:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BC82F80124; Fri, 19 Apr 2024 10:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46D3DF80571
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D3DF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fOVPRm04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516445; x=1745052445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/auqFeU8XuNI3ERYKCoyJWWmoI23t5xryIvvLyTOCI=;
  b=fOVPRm04QRubDRAPiBUizyaKt9S8JBiDDTlkNZLus3s7AwYTAFEbs4Cu
   LckeRJMILQ0ZnT5sZmKaVEkagFGlyi4ReBbG0ZfoqA57MBu8wySRaNy91
   McsdD3IZnlin9XpWdSSzQdgW27B74nwJRxHchjO7Qt6SzB7g6eqPh7Vpk
   7yIsZFhjSelykD4/XWcO91daUsufce/eaTp9iiaN1hP14sgf4/OGF4kb6
   qMf+Wmx7jkmxjykxo5YlFHXDIJw9cTlKMHxI5FiYS7V7wxtnEK+MYT2O8
   RZyA2crngRFoLZaCKvC0xTVanYDGXwdNDVvnKM2a2QGZsyNdEU8TkhF7/
   A==;
X-CSE-ConnectionGUID: sg37aIdNRAKfOqmZ3xahVw==
X-CSE-MsgGUID: USE9u6qdRqazutTx+2m/wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12941978"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="12941978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:47:21 -0700
X-CSE-ConnectionGUID: A3cG2ng1SW6goyZEjsiEwg==
X-CSE-MsgGUID: a4+0kmVLRPCRSVI88wmIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="46551806"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 01:47:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: New IRQ handling implementation
Date: Fri, 19 Apr 2024 10:48:56 +0200
Message-Id: <20240419084857.2719593-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084857.2719593-1-cezary.rojewski@intel.com>
References: <20240419084857.2719593-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGXL3KG7NIEEU2C2O4TFQLGUDCQF6RXO
X-Message-ID-Hash: GGXL3KG7NIEEU2C2O4TFQLGUDCQF6RXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGXL3KG7NIEEU2C2O4TFQLGUDCQF6RXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code can be both improved and simplified. To make this
change easier to manage, first add new implementation and then remove
deadcode in a separate patch.

Simplification achieved with:
- reduce the amount of resources requested by the driver i.e.: IPC and
  CLDMA request_irq() merged into one
- reduce the number of DSP ops from 2 to 1:
  irq_handler/thread() vs dsp_interrupt()
- drop ambiguity around CLDMA interrupt, let skl.c handle that
  explicitly as it is the only user

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c   | 18 +++++++++
 sound/soc/intel/avs/avs.h   |  3 ++
 sound/soc/intel/avs/cldma.c | 11 +++++
 sound/soc/intel/avs/cldma.h |  1 +
 sound/soc/intel/avs/cnl.c   | 63 +++++++++++++++++++++++++++++
 sound/soc/intel/avs/core.c  | 80 +++++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/icl.c   |  1 +
 sound/soc/intel/avs/skl.c   | 62 ++++++++++++++++++++++++++++
 sound/soc/intel/avs/tgl.c   |  1 +
 9 files changed, 240 insertions(+)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index c21ecaef9eba..a186d88430b9 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -8,11 +8,28 @@
 
 #include <linux/devcoredump.h>
 #include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "messages.h"
 #include "path.h"
 #include "topology.h"
 
+static irqreturn_t avs_apl_dsp_interrupt(struct avs_dev *adev)
+{
+	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
+	irqreturn_t ret = IRQ_NONE;
+
+	if (adspis == UINT_MAX)
+		return ret;
+
+	if (adspis & AVS_ADSP_ADSPIS_IPC) {
+		avs_skl_ipc_interrupt(adev);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
 #ifdef CONFIG_DEBUG_FS
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
@@ -237,6 +254,7 @@ const struct avs_dsp_ops avs_apl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
+	.dsp_interrupt = avs_apl_dsp_interrupt,
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index eb8c03afdd23..75ae8f3addb8 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -46,6 +46,7 @@ struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
+	irqreturn_t (* const dsp_interrupt)(struct avs_dev *);
 	irqreturn_t (* const irq_handler)(struct avs_dev *);
 	irqreturn_t (* const irq_thread)(struct avs_dev *);
 	void (* const int_control)(struct avs_dev *, bool);
@@ -269,6 +270,8 @@ int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
 irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
 irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev);
+void avs_skl_ipc_interrupt(struct avs_dev *adev);
+irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev);
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
 int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index 585579840b64..c79b126f376d 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -270,6 +270,17 @@ static irqreturn_t cldma_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+void hda_cldma_interrupt(struct hda_cldma *cl)
+{
+	/* disable CLDMA interrupt */
+	snd_hdac_adsp_updatel(cl, AVS_ADSP_REG_ADSPIC, AVS_ADSP_ADSPIC_CLDMA, 0);
+
+	cl->sd_status = snd_hdac_stream_readb(cl, SD_STS);
+	dev_dbg(cl->dev, "%s sd_status: 0x%08x\n", __func__, cl->sd_status);
+
+	complete(&cl->completion);
+}
+
 int hda_cldma_init(struct hda_cldma *cl, struct hdac_bus *bus, void __iomem *dsp_ba,
 		   unsigned int buffer_size)
 {
diff --git a/sound/soc/intel/avs/cldma.h b/sound/soc/intel/avs/cldma.h
index 223d3431ab81..7d95e2747f52 100644
--- a/sound/soc/intel/avs/cldma.h
+++ b/sound/soc/intel/avs/cldma.h
@@ -24,6 +24,7 @@ int hda_cldma_reset(struct hda_cldma *cl);
 
 void hda_cldma_set_data(struct hda_cldma *cl, void *data, unsigned int size);
 void hda_cldma_setup(struct hda_cldma *cl);
+void hda_cldma_interrupt(struct hda_cldma *cl);
 int hda_cldma_init(struct hda_cldma *cl, struct hdac_bus *bus, void __iomem *dsp_ba,
 		   unsigned int buffer_size);
 void hda_cldma_free(struct hda_cldma *cl);
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index 5423c29ecc4e..c021c0f51a53 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -42,10 +42,73 @@ irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev)
 	return IRQ_HANDLED;
 }
 
+static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
+{
+	const struct avs_spec *spec = adev->spec;
+	u32 hipc_ack, hipc_rsp;
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY, 0);
+
+	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
+
+	/* DSP acked host's request. */
+	if (hipc_ack & spec->hipc->ack_done_mask) {
+		complete(&adev->ipc->done_completion);
+
+		/* Tell DSP it has our attention. */
+		snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
+				      spec->hipc->ack_done_mask);
+	}
+
+	/* DSP sent new response to process. */
+	if (hipc_rsp & spec->hipc->rsp_busy_mask) {
+		union avs_reply_msg msg;
+		u32 hipctda;
+
+		msg.primary = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDR);
+		msg.ext.val = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDD);
+
+		avs_dsp_process_response(adev, msg.val);
+
+		/* Tell DSP we accepted its message. */
+		snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDR,
+				      CNL_ADSP_HIPCTDR_BUSY, CNL_ADSP_HIPCTDR_BUSY);
+		/* Ack this response. */
+		snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDA,
+				      CNL_ADSP_HIPCTDA_DONE, CNL_ADSP_HIPCTDA_DONE);
+		/* HW might have been clock gated, give some time for change to propagate. */
+		snd_hdac_adsp_readl_poll(adev, CNL_ADSP_REG_HIPCTDA, hipctda,
+					 !(hipctda & CNL_ADSP_HIPCTDA_DONE), 10, 1000);
+	}
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
+}
+
+irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev)
+{
+	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
+	irqreturn_t ret = IRQ_NONE;
+
+	if (adspis == UINT_MAX)
+		return ret;
+
+	if (adspis & AVS_ADSP_ADSPIS_IPC) {
+		avs_cnl_ipc_interrupt(adev);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
 const struct avs_dsp_ops avs_cnl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
+	.dsp_interrupt = avs_cnl_dsp_interrupt,
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 76782a0f32bc..25759f4f0213 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -336,6 +336,86 @@ static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
 	return avs_dsp_op(adev, irq_thread);
 }
 
+static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
+{
+	irqreturn_t ret = IRQ_NONE;
+	u32 status;
+
+	status = snd_hdac_chip_readl(bus, INTSTS);
+	if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream))
+		ret = IRQ_HANDLED;
+
+	spin_lock_irq(&bus->reg_lock);
+	/* Clear RIRB interrupt. */
+	status = snd_hdac_chip_readb(bus, RIRBSTS);
+	if (status & RIRB_INT_MASK) {
+		if (status & RIRB_INT_RESPONSE)
+			snd_hdac_bus_update_rirb(bus);
+		snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
+		ret = IRQ_HANDLED;
+	}
+
+	spin_unlock_irq(&bus->reg_lock);
+	return ret;
+}
+
+__maybe_unused
+static irqreturn_t avs_hda_irq_handler(int irq, void *dev_id)
+{
+	struct hdac_bus *bus = dev_id;
+	u32 intsts;
+
+	intsts = snd_hdac_chip_readl(bus, INTSTS);
+	if (intsts == UINT_MAX || !(intsts & AZX_INT_GLOBAL_EN))
+		return IRQ_NONE;
+
+	/* Mask GIE, unmasked in irq_thread(). */
+	snd_hdac_chip_updatel(bus, INTCTL, AZX_INT_GLOBAL_EN, 0);
+
+	return IRQ_WAKE_THREAD;
+}
+
+__maybe_unused
+static irqreturn_t avs_hda_irq_thread(int irq, void *dev_id)
+{
+	struct hdac_bus *bus = dev_id;
+	u32 status;
+
+	status = snd_hdac_chip_readl(bus, INTSTS);
+	if (status & ~AZX_INT_GLOBAL_EN)
+		avs_hda_interrupt(bus);
+
+	/* Unmask GIE, masked in irq_handler(). */
+	snd_hdac_chip_updatel(bus, INTCTL, AZX_INT_GLOBAL_EN, AZX_INT_GLOBAL_EN);
+
+	return IRQ_HANDLED;
+}
+
+__maybe_unused
+static irqreturn_t avs_dsp_irq_handler2(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+
+	return avs_hda_irq_handler(irq, &adev->base.core);
+}
+
+__maybe_unused
+static irqreturn_t avs_dsp_irq_thread2(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+	struct hdac_bus *bus = &adev->base.core;
+	u32 status;
+
+	status = readl(bus->ppcap + AZX_REG_PP_PPSTS);
+	if (status & AZX_PPCTL_PIE)
+		avs_dsp_op(adev, dsp_interrupt);
+
+	/* Unmask GIE, masked in irq_handler(). */
+	snd_hdac_chip_updatel(bus, INTCTL, AZX_INT_GLOBAL_EN, AZX_INT_GLOBAL_EN);
+
+	return IRQ_HANDLED;
+}
+
 static int avs_hdac_acquire_irq(struct avs_dev *adev)
 {
 	struct hdac_bus *bus = &adev->base.core;
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 7a1ecf241856..004fe71505dd 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -188,6 +188,7 @@ const struct avs_dsp_ops avs_icl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
+	.dsp_interrupt = avs_cnl_dsp_interrupt,
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index d19f8953993f..25abfead9f63 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
+#include "cldma.h"
 #include "messages.h"
 
 irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
@@ -37,6 +38,66 @@ irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
 	return IRQ_HANDLED;
 }
 
+void avs_skl_ipc_interrupt(struct avs_dev *adev)
+{
+	const struct avs_spec *spec = adev->spec;
+	u32 hipc_ack, hipc_rsp;
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY, 0);
+
+	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
+
+	/* DSP acked host's request. */
+	if (hipc_ack & spec->hipc->ack_done_mask) {
+		complete(&adev->ipc->done_completion);
+
+		/* Tell DSP it has our attention. */
+		snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
+				      spec->hipc->ack_done_mask);
+	}
+
+	/* DSP sent new response to process */
+	if (hipc_rsp & spec->hipc->rsp_busy_mask) {
+		union avs_reply_msg msg;
+
+		msg.primary = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
+		msg.ext.val = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
+
+		avs_dsp_process_response(adev, msg.val);
+
+		/* Tell DSP we accepted its message. */
+		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY,
+				      SKL_ADSP_HIPCT_BUSY);
+	}
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
+}
+
+static irqreturn_t avs_skl_dsp_interrupt(struct avs_dev *adev)
+{
+	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
+	irqreturn_t ret = IRQ_NONE;
+
+	if (adspis == UINT_MAX)
+		return ret;
+
+	if (adspis & AVS_ADSP_ADSPIS_CLDMA) {
+		hda_cldma_interrupt(&code_loader);
+		ret = IRQ_HANDLED;
+	}
+
+	if (adspis & AVS_ADSP_ADSPIS_IPC) {
+		avs_skl_ipc_interrupt(adev);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
 static int __maybe_unused
 avs_skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
@@ -128,6 +189,7 @@ const struct avs_dsp_ops avs_skl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
+	.dsp_interrupt = avs_skl_dsp_interrupt,
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index 0e052e7f6bac..e3723ef38a33 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -39,6 +39,7 @@ const struct avs_dsp_ops avs_tgl_dsp_ops = {
 	.power = avs_tgl_dsp_core_power,
 	.reset = avs_tgl_dsp_core_reset,
 	.stall = avs_tgl_dsp_core_stall,
+	.dsp_interrupt = avs_cnl_dsp_interrupt,
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
-- 
2.25.1

