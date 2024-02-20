Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA685BCD9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C902F84D;
	Tue, 20 Feb 2024 14:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C902F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434478;
	bh=csyouZw8RBz0O87Tqthq8qlDT5GA20abpHjXlv93IGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0STsgVne5iDS7IjFE96xfVkqG5trt5m2ljnw71+v/qEkKpzIuvqaRu7Bbp1p3iQp
	 e05otGH6Smj7xNKCahNa566su6/ebOSNYa6RKxiXQdEZVTnqewdgHzGq5A51fe11TK
	 J5hHLwhQtPKySCwJlPOUZwj6YhbbF3dcDi42RYug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B70F805C7; Tue, 20 Feb 2024 14:07:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E633CF805D2;
	Tue, 20 Feb 2024 14:07:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E30F8057A; Tue, 20 Feb 2024 14:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 942BDF80496
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942BDF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JCKPdpu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434222; x=1739970222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=csyouZw8RBz0O87Tqthq8qlDT5GA20abpHjXlv93IGU=;
  b=JCKPdpu7g9n+6ipQs9IkWa4njPgzwuWBIuYxsujaEMMwtD7DhKZLpPQb
   o0ICvn/zYX6fv5shGGZdwdLOv3L7YLqkmqvk1VHllFeiBWHd2S4XlXxKz
   VHlk2sIldqztDtgYMT6GDDwVq1GJIfCGvqR0rtzE8nB0iDwxofZqoSbGZ
   TeLIBTyToyKkwpc1p3gTDj1KI0QNZ2Tms1qUGSMl1tXxiFrNHTKDKOzW2
   +Zzd+7o8/wvA0Qd8WaV4OM0CDs0w6x9psH2XUrCW//iuc/45AUVRtfoTO
   JPLO8UmNWrkrhMxL4/lC16Ul+dmcN7RXhD2OwR+cY4ac8XKXvvARLmgep
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988979"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4751001"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:25 -0800
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
Subject: [PATCH 05/10] ASoC: Intel: avs: Abstract IRQ handling
Date: Tue, 20 Feb 2024 12:50:30 +0100
Message-Id: <20240220115035.770402-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EBZ7QJZOEAKLHJ74H2O4DV6Z5332ULV3
X-Message-ID-Hash: EBZ7QJZOEAKLHJ74H2O4DV6Z5332ULV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBZ7QJZOEAKLHJ74H2O4DV6Z5332ULV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Servicing IPCs on CNL platforms and onward differs from the existing
one. To make room for these, relocate SKL-based platforms specific code
into the skl.c file leaving only the genering irq_handler in the common
code.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c  |  4 ++--
 sound/soc/intel/avs/avs.h  |  8 ++++----
 sound/soc/intel/avs/core.c | 14 ++++++++++++++
 sound/soc/intel/avs/ipc.c  | 30 +-----------------------------
 sound/soc/intel/avs/skl.c  | 29 +++++++++++++++++++++++++++--
 5 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 24c06568b3e8..6382543a9cdb 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -236,8 +236,8 @@ const struct avs_dsp_ops avs_apl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
-	.irq_handler = avs_dsp_irq_handler,
-	.irq_thread = avs_dsp_irq_thread,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b93f38515403..2cd690a78b5c 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -46,8 +46,8 @@ struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
-	irqreturn_t (* const irq_handler)(int, void *);
-	irqreturn_t (* const irq_thread)(int, void *);
+	irqreturn_t (* const irq_handler)(struct avs_dev *);
+	irqreturn_t (* const irq_thread)(struct avs_dev *);
 	void (* const int_control)(struct avs_dev *, bool);
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
@@ -242,8 +242,7 @@ struct avs_ipc {
 #define AVS_IPC_RET(ret) \
 	(((ret) <= 0) ? (ret) : -AVS_EIPC)
 
-irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
-irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
+irqreturn_t avs_irq_handler(struct avs_dev *adev);
 void avs_dsp_process_response(struct avs_dev *adev, u64 header);
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
 			     struct avs_ipc_msg *reply, int timeout, const char *name);
@@ -265,6 +264,7 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
+irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
 int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
 
 /* Firmware resources management */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 46162d637573..4d1d3445cac1 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -321,6 +321,20 @@ static irqreturn_t hdac_bus_irq_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+
+	return avs_dsp_op(adev, irq_handler);
+}
+
+static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+
+	return avs_dsp_op(adev, irq_thread);
+}
+
 static int avs_hdac_acquire_irq(struct avs_dev *adev)
 {
 	struct hdac_bus *bus = &adev->base.core;
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 29c7f508a7d6..ad0e535b3c2e 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -301,9 +301,8 @@ void avs_dsp_process_response(struct avs_dev *adev, u64 header)
 	complete(&ipc->busy_completion);
 }
 
-irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
+irqreturn_t avs_irq_handler(struct avs_dev *adev)
 {
-	struct avs_dev *adev = dev_id;
 	struct avs_ipc *ipc = adev->ipc;
 	const struct avs_spec *const spec = adev->spec;
 	u32 adspis, hipc_rsp, hipc_ack;
@@ -350,33 +349,6 @@ irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
-irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
-{
-	struct avs_dev *adev = dev_id;
-	union avs_reply_msg msg;
-	u32 hipct, hipcte;
-
-	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
-	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
-
-	/* ensure DSP sent new response to process */
-	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
-		return IRQ_NONE;
-
-	msg.primary = hipct;
-	msg.ext.val = hipcte;
-	avs_dsp_process_response(adev, msg.val);
-
-	/* tell DSP we accepted its message */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT,
-			      SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
-	/* unmask busy interrupt */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
-			      AVS_ADSP_HIPCCTL_BUSY, AVS_ADSP_HIPCCTL_BUSY);
-
-	return IRQ_HANDLED;
-}
-
 static bool avs_ipc_is_busy(struct avs_ipc *ipc)
 {
 	struct avs_dev *adev = to_avs_dev(ipc->dev);
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 7ea8d91b54d2..d19f8953993f 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -12,6 +12,31 @@
 #include "avs.h"
 #include "messages.h"
 
+irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
+{
+	union avs_reply_msg msg;
+	u32 hipct, hipcte;
+
+	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
+	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
+
+	/* Ensure DSP sent new response to process. */
+	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
+		return IRQ_NONE;
+
+	msg.primary = hipct;
+	msg.ext.val = hipcte;
+	avs_dsp_process_response(adev, msg.val);
+
+	/* Tell DSP we accepted its message. */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
+	/* Unmask busy interrupt. */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL, AVS_ADSP_HIPCCTL_BUSY,
+			      AVS_ADSP_HIPCCTL_BUSY);
+
+	return IRQ_HANDLED;
+}
+
 static int __maybe_unused
 avs_skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
@@ -103,8 +128,8 @@ const struct avs_dsp_ops avs_skl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
-	.irq_handler = avs_dsp_irq_handler,
-	.irq_thread = avs_dsp_irq_thread,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_cldma_load_basefw,
 	.load_lib = avs_cldma_load_library,
-- 
2.25.1

