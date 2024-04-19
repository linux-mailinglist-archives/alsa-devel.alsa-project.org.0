Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE78AAADD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0BF84A;
	Fri, 19 Apr 2024 10:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0BF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516514;
	bh=Aax1u3tz3WsCze1ctd0Ldcv1272HZCvYHNtHkgOINb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erQHSV+rm6AfECH9jMiSRgJk0k/Atlyon6ioaTi/rJIBVmr8vT7qbqXrLuiuwKrAj
	 3we4oioS5V0YHUBfl9ZPfwsYhNZI6eo1MZ4u0bHtGP4oFRERt9Wp89wS3P0K0O2Efl
	 AerstiHVxqD4H4Vky0kvPB2kxdOsfyA2hCTZVNAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 916EBF805F5; Fri, 19 Apr 2024 10:47:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 094C8F80578;
	Fri, 19 Apr 2024 10:47:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3C6DF805E5; Fri, 19 Apr 2024 10:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30B0CF80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30B0CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=esz3DiW6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516446; x=1745052446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aax1u3tz3WsCze1ctd0Ldcv1272HZCvYHNtHkgOINb4=;
  b=esz3DiW6H/NY7c5N/r0mrjyDZ51vCJhK7NgtxSB2qwjIeLSGoCQMI/+d
   JVahqTC9W2VlCvO6LOIa6rk+AghPCJpoIMXpb71VQNZLVEnLxYswlY5WF
   02mwU20ktFp6ccyKczorBlxIovkdrJ3NN1IL+F8QZItCY5UOuN7317rXh
   I8ESnV56KONhPufzvjLBPe/3wHcOcMkv4PdqWnLWopQ3cMee8wqyEjSp+
   kaTvZx7pBe7rmpqX2Q1OIfyxakMXIH5nl5U69eVbI2aM+bEl7VIh5WLOI
   hzbz/m/HRdVVUf/bFwMgJxwkG/4fwNTHWUTaYq4SrOdMvmTasLdBRQwKS
   g==;
X-CSE-ConnectionGUID: bccITQDwTSKd+Y4k2quV4w==
X-CSE-MsgGUID: 4hfMttjJTSeDcInRaphOvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12941990"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="12941990"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:47:23 -0700
X-CSE-ConnectionGUID: 3/FugEtRSvC+3HvULr1qGA==
X-CSE-MsgGUID: 7Gboj7oWTu27trvfTyfAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="46551816"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 01:47:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Remove unused IRQ-related code
Date: Fri, 19 Apr 2024 10:48:57 +0200
Message-Id: <20240419084857.2719593-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084857.2719593-1-cezary.rojewski@intel.com>
References: <20240419084857.2719593-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SRZUOJVAK3EAHODJLDP3JMDK7I2QPU3
X-Message-ID-Hash: 2SRZUOJVAK3EAHODJLDP3JMDK7I2QPU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SRZUOJVAK3EAHODJLDP3JMDK7I2QPU3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Most IRQ-related code is duplicated in the driver. Switch to the new
implementation and remove unused members.

While the change is non-trivial, from functional perspective status quo
is achieved.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c   |  2 -
 sound/soc/intel/avs/avs.h   |  5 --
 sound/soc/intel/avs/cldma.c | 45 ++----------------
 sound/soc/intel/avs/cnl.c   | 34 --------------
 sound/soc/intel/avs/core.c  | 91 ++-----------------------------------
 sound/soc/intel/avs/icl.c   |  2 -
 sound/soc/intel/avs/ipc.c   | 48 -------------------
 sound/soc/intel/avs/skl.c   | 27 -----------
 sound/soc/intel/avs/tgl.c   |  2 -
 9 files changed, 7 insertions(+), 249 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index a186d88430b9..bf97e4e428a4 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -255,8 +255,6 @@ const struct avs_dsp_ops avs_apl_dsp_ops = {
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
 	.dsp_interrupt = avs_apl_dsp_interrupt,
-	.irq_handler = avs_irq_handler,
-	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 75ae8f3addb8..c905ecd0a108 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -47,8 +47,6 @@ struct avs_dsp_ops {
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
 	irqreturn_t (* const dsp_interrupt)(struct avs_dev *);
-	irqreturn_t (* const irq_handler)(struct avs_dev *);
-	irqreturn_t (* const irq_thread)(struct avs_dev *);
 	void (* const int_control)(struct avs_dev *, bool);
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
@@ -246,7 +244,6 @@ struct avs_ipc {
 #define AVS_IPC_RET(ret) \
 	(((ret) <= 0) ? (ret) : -AVS_EIPC)
 
-irqreturn_t avs_irq_handler(struct avs_dev *adev);
 void avs_dsp_process_response(struct avs_dev *adev, u64 header);
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
 			     struct avs_ipc_msg *reply, int timeout, const char *name);
@@ -268,8 +265,6 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
-irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
-irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev);
 void avs_skl_ipc_interrupt(struct avs_dev *adev);
 irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev);
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index c79b126f376d..945ea376d031 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -248,28 +248,6 @@ void hda_cldma_setup(struct hda_cldma *cl)
 	snd_hdac_stream_writel(cl, CL_SPBFCTL, 1);
 }
 
-static irqreturn_t cldma_irq_handler(int irq, void *dev_id)
-{
-	struct hda_cldma *cl = dev_id;
-	u32 adspis;
-
-	adspis = snd_hdac_adsp_readl(cl, AVS_ADSP_REG_ADSPIS);
-	if (adspis == UINT_MAX)
-		return IRQ_NONE;
-	if (!(adspis & AVS_ADSP_ADSPIS_CLDMA))
-		return IRQ_NONE;
-
-	cl->sd_status = snd_hdac_stream_readb(cl, SD_STS);
-	dev_warn(cl->dev, "%s sd_status: 0x%08x\n", __func__, cl->sd_status);
-
-	/* disable CLDMA interrupt */
-	snd_hdac_adsp_updatel(cl, AVS_ADSP_REG_ADSPIC, AVS_ADSP_ADSPIC_CLDMA, 0);
-
-	complete(&cl->completion);
-
-	return IRQ_HANDLED;
-}
-
 void hda_cldma_interrupt(struct hda_cldma *cl)
 {
 	/* disable CLDMA interrupt */
@@ -284,7 +262,6 @@ void hda_cldma_interrupt(struct hda_cldma *cl)
 int hda_cldma_init(struct hda_cldma *cl, struct hdac_bus *bus, void __iomem *dsp_ba,
 		   unsigned int buffer_size)
 {
-	struct pci_dev *pci = to_pci_dev(bus->dev);
 	int ret;
 
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, bus->dev, buffer_size, &cl->dmab_data);
@@ -292,8 +269,10 @@ int hda_cldma_init(struct hda_cldma *cl, struct hdac_bus *bus, void __iomem *dsp
 		return ret;
 
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, bus->dev, BDL_SIZE, &cl->dmab_bdl);
-	if (ret < 0)
-		goto alloc_err;
+	if (ret < 0) {
+		snd_dma_free_pages(&cl->dmab_data);
+		return ret;
+	}
 
 	cl->dev = bus->dev;
 	cl->bus = bus;
@@ -301,27 +280,11 @@ int hda_cldma_init(struct hda_cldma *cl, struct hdac_bus *bus, void __iomem *dsp
 	cl->buffer_size = buffer_size;
 	cl->sd_addr = dsp_ba + AZX_CL_SD_BASE;
 
-	ret = pci_request_irq(pci, 0, cldma_irq_handler, NULL, cl, "CLDMA");
-	if (ret < 0) {
-		dev_err(cl->dev, "Failed to request CLDMA IRQ handler: %d\n", ret);
-		goto req_err;
-	}
-
 	return 0;
-
-req_err:
-	snd_dma_free_pages(&cl->dmab_bdl);
-alloc_err:
-	snd_dma_free_pages(&cl->dmab_data);
-
-	return ret;
 }
 
 void hda_cldma_free(struct hda_cldma *cl)
 {
-	struct pci_dev *pci = to_pci_dev(cl->dev);
-
-	pci_free_irq(pci, 0, cl);
 	snd_dma_free_pages(&cl->dmab_data);
 	snd_dma_free_pages(&cl->dmab_bdl);
 }
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index c021c0f51a53..0d03e1e03c11 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -10,38 +10,6 @@
 #include "avs.h"
 #include "messages.h"
 
-irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev)
-{
-	union avs_reply_msg msg;
-	u32 hipctdr, hipctdd, hipctda;
-
-	hipctdr = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDR);
-	hipctdd = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDD);
-
-	/* Ensure DSP sent new response to process. */
-	if (!(hipctdr & CNL_ADSP_HIPCTDR_BUSY))
-		return IRQ_NONE;
-
-	msg.primary = hipctdr;
-	msg.ext.val = hipctdd;
-	avs_dsp_process_response(adev, msg.val);
-
-	/* Tell DSP we accepted its message. */
-	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDR,
-			      CNL_ADSP_HIPCTDR_BUSY, CNL_ADSP_HIPCTDR_BUSY);
-	/* Ack this response. */
-	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDA,
-			      CNL_ADSP_HIPCTDA_DONE, CNL_ADSP_HIPCTDA_DONE);
-	/* HW might have been clock gated, give some time for change to propagate. */
-	snd_hdac_adsp_readl_poll(adev, CNL_ADSP_REG_HIPCTDA, hipctda,
-				 !(hipctda & CNL_ADSP_HIPCTDA_DONE), 10, 1000);
-	/* Unmask busy interrupt. */
-	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCCTL,
-			      AVS_ADSP_HIPCCTL_BUSY, AVS_ADSP_HIPCCTL_BUSY);
-
-	return IRQ_HANDLED;
-}
-
 static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
 {
 	const struct avs_spec *spec = adev->spec;
@@ -109,8 +77,6 @@ const struct avs_dsp_ops avs_cnl_dsp_ops = {
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
 	.dsp_interrupt = avs_cnl_dsp_interrupt,
-	.irq_handler = avs_irq_handler,
-	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 25759f4f0213..a059bb6888d8 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -257,85 +257,6 @@ static void hdac_update_stream(struct hdac_bus *bus, struct hdac_stream *stream)
 	}
 }
 
-static irqreturn_t hdac_bus_irq_handler(int irq, void *context)
-{
-	struct hdac_bus *bus = context;
-	u32 mask, int_enable;
-	u32 status;
-	int ret = IRQ_NONE;
-
-	if (!pm_runtime_active(bus->dev))
-		return ret;
-
-	spin_lock(&bus->reg_lock);
-
-	status = snd_hdac_chip_readl(bus, INTSTS);
-	if (status == 0 || status == UINT_MAX) {
-		spin_unlock(&bus->reg_lock);
-		return ret;
-	}
-
-	/* clear rirb int */
-	status = snd_hdac_chip_readb(bus, RIRBSTS);
-	if (status & RIRB_INT_MASK) {
-		if (status & RIRB_INT_RESPONSE)
-			snd_hdac_bus_update_rirb(bus);
-		snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
-	}
-
-	mask = (0x1 << bus->num_streams) - 1;
-
-	status = snd_hdac_chip_readl(bus, INTSTS);
-	status &= mask;
-	if (status) {
-		/* Disable stream interrupts; Re-enable in bottom half */
-		int_enable = snd_hdac_chip_readl(bus, INTCTL);
-		snd_hdac_chip_writel(bus, INTCTL, (int_enable & (~mask)));
-		ret = IRQ_WAKE_THREAD;
-	} else {
-		ret = IRQ_HANDLED;
-	}
-
-	spin_unlock(&bus->reg_lock);
-	return ret;
-}
-
-static irqreturn_t hdac_bus_irq_thread(int irq, void *context)
-{
-	struct hdac_bus *bus = context;
-	u32 status;
-	u32 int_enable;
-	u32 mask;
-	unsigned long flags;
-
-	status = snd_hdac_chip_readl(bus, INTSTS);
-
-	snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream);
-
-	/* Re-enable stream interrupts */
-	mask = (0x1 << bus->num_streams) - 1;
-	spin_lock_irqsave(&bus->reg_lock, flags);
-	int_enable = snd_hdac_chip_readl(bus, INTCTL);
-	snd_hdac_chip_writel(bus, INTCTL, (int_enable | mask));
-	spin_unlock_irqrestore(&bus->reg_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
-{
-	struct avs_dev *adev = dev_id;
-
-	return avs_dsp_op(adev, irq_handler);
-}
-
-static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
-{
-	struct avs_dev *adev = dev_id;
-
-	return avs_dsp_op(adev, irq_thread);
-}
-
 static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
 {
 	irqreturn_t ret = IRQ_NONE;
@@ -359,7 +280,6 @@ static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
 	return ret;
 }
 
-__maybe_unused
 static irqreturn_t avs_hda_irq_handler(int irq, void *dev_id)
 {
 	struct hdac_bus *bus = dev_id;
@@ -375,7 +295,6 @@ static irqreturn_t avs_hda_irq_handler(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
-__maybe_unused
 static irqreturn_t avs_hda_irq_thread(int irq, void *dev_id)
 {
 	struct hdac_bus *bus = dev_id;
@@ -391,16 +310,14 @@ static irqreturn_t avs_hda_irq_thread(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-__maybe_unused
-static irqreturn_t avs_dsp_irq_handler2(int irq, void *dev_id)
+static irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
 {
 	struct avs_dev *adev = dev_id;
 
 	return avs_hda_irq_handler(irq, &adev->base.core);
 }
 
-__maybe_unused
-static irqreturn_t avs_dsp_irq_thread2(int irq, void *dev_id)
+static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
 {
 	struct avs_dev *adev = dev_id;
 	struct hdac_bus *bus = &adev->base.core;
@@ -429,7 +346,7 @@ static int avs_hdac_acquire_irq(struct avs_dev *adev)
 		return ret;
 	}
 
-	ret = pci_request_irq(pci, 0, hdac_bus_irq_handler, hdac_bus_irq_thread, bus,
+	ret = pci_request_irq(pci, 0, avs_hda_irq_handler, avs_hda_irq_thread, bus,
 			      KBUILD_MODNAME);
 	if (ret < 0) {
 		dev_err(adev->dev, "Failed to request stream IRQ handler: %d\n", ret);
@@ -610,8 +527,6 @@ static void avs_pci_shutdown(struct pci_dev *pci)
 	snd_hdac_bus_stop_chip(bus);
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 
-	if (avs_platattr_test(adev, CLDMA))
-		pci_free_irq(pci, 0, &code_loader);
 	pci_free_irq(pci, 0, adev);
 	pci_free_irq(pci, 0, bus);
 	pci_free_irq_vectors(pci);
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 004fe71505dd..3a96c4304ca6 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -189,8 +189,6 @@ const struct avs_dsp_ops avs_icl_dsp_ops = {
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
 	.dsp_interrupt = avs_cnl_dsp_interrupt,
-	.irq_handler = avs_irq_handler,
-	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_icl_load_basefw,
 	.load_lib = avs_hda_load_library,
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index ad0e535b3c2e..f9b302215c37 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -301,54 +301,6 @@ void avs_dsp_process_response(struct avs_dev *adev, u64 header)
 	complete(&ipc->busy_completion);
 }
 
-irqreturn_t avs_irq_handler(struct avs_dev *adev)
-{
-	struct avs_ipc *ipc = adev->ipc;
-	const struct avs_spec *const spec = adev->spec;
-	u32 adspis, hipc_rsp, hipc_ack;
-	irqreturn_t ret = IRQ_NONE;
-
-	adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
-	if (adspis == UINT_MAX || !(adspis & AVS_ADSP_ADSPIS_IPC))
-		return ret;
-
-	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
-	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
-
-	/* DSP acked host's request */
-	if (hipc_ack & spec->hipc->ack_done_mask) {
-		/*
-		 * As an extra precaution, mask done interrupt. Code executed
-		 * due to complete() found below does not assume any masking.
-		 */
-		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
-				      AVS_ADSP_HIPCCTL_DONE, 0);
-
-		complete(&ipc->done_completion);
-
-		/* tell DSP it has our attention */
-		snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset,
-				      spec->hipc->ack_done_mask,
-				      spec->hipc->ack_done_mask);
-		/* unmask done interrupt */
-		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
-				      AVS_ADSP_HIPCCTL_DONE,
-				      AVS_ADSP_HIPCCTL_DONE);
-		ret = IRQ_HANDLED;
-	}
-
-	/* DSP sent new response to process */
-	if (hipc_rsp & spec->hipc->rsp_busy_mask) {
-		/* mask busy interrupt */
-		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
-				      AVS_ADSP_HIPCCTL_BUSY, 0);
-
-		ret = IRQ_WAKE_THREAD;
-	}
-
-	return ret;
-}
-
 static bool avs_ipc_is_busy(struct avs_ipc *ipc)
 {
 	struct avs_dev *adev = to_avs_dev(ipc->dev);
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 25abfead9f63..fceed353449a 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -13,31 +13,6 @@
 #include "cldma.h"
 #include "messages.h"
 
-irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
-{
-	union avs_reply_msg msg;
-	u32 hipct, hipcte;
-
-	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
-	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
-
-	/* Ensure DSP sent new response to process. */
-	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
-		return IRQ_NONE;
-
-	msg.primary = hipct;
-	msg.ext.val = hipcte;
-	avs_dsp_process_response(adev, msg.val);
-
-	/* Tell DSP we accepted its message. */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
-	/* Unmask busy interrupt. */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL, AVS_ADSP_HIPCCTL_BUSY,
-			      AVS_ADSP_HIPCCTL_BUSY);
-
-	return IRQ_HANDLED;
-}
-
 void avs_skl_ipc_interrupt(struct avs_dev *adev)
 {
 	const struct avs_spec *spec = adev->spec;
@@ -190,8 +165,6 @@ const struct avs_dsp_ops avs_skl_dsp_ops = {
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
 	.dsp_interrupt = avs_skl_dsp_interrupt,
-	.irq_handler = avs_irq_handler,
-	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_cldma_load_basefw,
 	.load_lib = avs_cldma_load_library,
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index e3723ef38a33..b985a8299b72 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -40,8 +40,6 @@ const struct avs_dsp_ops avs_tgl_dsp_ops = {
 	.reset = avs_tgl_dsp_core_reset,
 	.stall = avs_tgl_dsp_core_stall,
 	.dsp_interrupt = avs_cnl_dsp_interrupt,
-	.irq_handler = avs_irq_handler,
-	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_icl_load_basefw,
 	.load_lib = avs_hda_load_library,
-- 
2.25.1

