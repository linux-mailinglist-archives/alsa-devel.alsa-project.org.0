Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A84ABE7E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:21:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D2216C9;
	Mon,  7 Feb 2022 13:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D2216C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236469;
	bh=EoFt8LIREhC/1Gc4psZWg8oxeHH4OgGPAVH24iZLi18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rpwDWfkQxjlNwI6Ev5/Dsd5GAWNwbi24apsvDYO9SNAMu1DHl+053QnEpJD3k/OK2
	 gscj31feIe68kE5fQ7T8THHSIXplXjjeLpQldojhTxeNxThtN9dM+WVnorOYK55Pks
	 SpymlF8f/8eV3mf4re0CrAM5Sd07cID786Lr9FFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 882F1F80520;
	Mon,  7 Feb 2022 13:19:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99974F80516; Mon,  7 Feb 2022 13:19:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A738F80240
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A738F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lS78vz4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236363; x=1675772363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EoFt8LIREhC/1Gc4psZWg8oxeHH4OgGPAVH24iZLi18=;
 b=lS78vz4FhQIyA95Ml7U6uF7kIyp1qg/d9ccspJqQTuCOf65qYd4ydrCc
 msD5Wl/AnH/PP2WdZ6fe3+44VjbeIXarYJgk72qdt+VBOlTsf8lOO4pvv
 FBsE7HcRwSFp0SIO4tA18WgN5+ITzwUTiH/BKXLRZKWA7dvtGxsCrHPyj
 T8yOHmGcYThZ6TZ4IDpiQNNXvO3LP1nBtsD4nffBuVUOZBoOvnZAq4Jzd
 YoIXaw1Xq2yXDOiltZcWeb2QewhUVbLjBYUe7OvjticeB8KNN3LqigomX
 5QHGJxtgvTDFBh0rTuWGAse5D8fiy0WJ8CW0HmCK5cIQ2rIroKWBe8EBO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914801"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112439"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:19:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Date: Mon,  7 Feb 2022 13:20:55 +0100
Message-Id: <20220207122108.3780926-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Implement the IPC between Intel audio firmware and kernel driver. The
IPC allows transmission of requests, handling of responses as well as
unsolicited (i.e. firmware-generated) notifications.

A subscription mechanism is added to enable different parts of the
driver to register for specific notifications.

The boot process involving ROM-code requires specific handling with
'unstall' operations which are not required post-boot with normal IPC so
separate set of send-message handlers is added for each of the usecases.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   2 +-
 sound/soc/intel/avs/avs.h       |  93 ++++++++
 sound/soc/intel/avs/ipc.c       | 404 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h  | 170 ++++++++++++++
 sound/soc/intel/avs/registers.h |  45 ++++
 5 files changed, 713 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/ipc.c
 create mode 100644 sound/soc/intel/avs/messages.h

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 5f7976a95fe2..e243806dd38a 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o
+snd-soc-avs-objs := dsp.o ipc.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 7ece210b0777..8620d2f7fee0 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <sound/hda_codec.h>
+#include "messages.h"
 
 struct avs_dev;
 
@@ -18,6 +19,9 @@ struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
+	irqreturn_t (* const irq_handler)(int, void *);
+	irqreturn_t (* const irq_thread)(int, void *);
+	void (* const int_control)(struct avs_dev *, bool);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -34,6 +38,18 @@ struct avs_spec {
 
 	const u32 core_init_mask;	/* used during DSP boot */
 	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
+	const u32 sram_base_offset;
+	const u32 sram_window_size;
+
+	const u32 rom_status;
+	const u32 hipc_req_offset;
+	const u32 hipc_req_ext_offset;
+	const u32 hipc_req_busy_mask;
+	const u32 hipc_ack_offset;
+	const u32 hipc_ack_done_mask;
+	const u32 hipc_rsp_offset;
+	const u32 hipc_rsp_busy_mask;
+	const u32 hipc_ctl_offset;
 };
 
 struct avs_dev {
@@ -42,6 +58,9 @@ struct avs_dev {
 
 	void __iomem *adsp_ba;
 	const struct avs_spec *spec;
+	struct avs_ipc *ipc;
+
+	struct completion fw_ready;
 };
 
 /* from hda_bus to avs_dev */
@@ -61,4 +80,78 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
 int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
 int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
 
+/* Inter Process Communication */
+
+struct avs_ipc_msg {
+	union {
+		u64 header;
+		union avs_global_msg glb;
+		union avs_reply_msg rsp;
+	};
+	void *data;
+	size_t size;
+};
+
+struct avs_ipc {
+	struct device *dev;
+
+	struct avs_ipc_msg rx;
+	u32 default_timeout_ms;
+	bool ready;
+
+	bool rx_completed;
+	spinlock_t rx_lock;
+	struct mutex msg_mutex;
+	struct completion done_completion;
+	struct completion busy_completion;
+};
+
+#define AVS_EIPC	EREMOTEIO
+/*
+ * IPC handlers may return positive value (firmware error code) what denotes
+ * successful HOST <-> DSP communication yet failure to process specific request.
+ *
+ * Below macro converts returned value to linux kernel error code.
+ * All IPC callers MUST use it as soon as firmware error code is consumed.
+ */
+#define AVS_IPC_RET(ret) \
+	(((ret) <= 0) ? (ret) : -AVS_EIPC)
+
+static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
+			       const char *name, int error)
+{
+	/*
+	 * If IPC channel is blocked e.g.: due to ongoing recovery,
+	 * -EPERM error code is expected and thus it's not an actual error.
+	 */
+	if (error == -EPERM)
+		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
+			tx->glb.primary, tx->glb.ext.val, error);
+	else
+		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
+			tx->glb.primary, tx->glb.ext.val, error);
+}
+
+irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
+irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
+void avs_dsp_process_response(struct avs_dev *adev, u64 header);
+int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev,
+				struct avs_ipc_msg *request,
+				struct avs_ipc_msg *reply, int timeout,
+				bool wake_d0i0);
+int avs_dsp_send_pm_msg(struct avs_dev *adev,
+			struct avs_ipc_msg *request,
+			struct avs_ipc_msg *reply, bool wake_d0i0);
+int avs_dsp_send_msg_timeout(struct avs_dev *adev,
+			     struct avs_ipc_msg *request,
+			     struct avs_ipc_msg *reply, int timeout);
+int avs_dsp_send_msg(struct avs_dev *adev,
+		     struct avs_ipc_msg *request, struct avs_ipc_msg *reply);
+int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
+				 struct avs_ipc_msg *request, int timeout);
+int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request);
+void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
+int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
+void avs_ipc_block(struct avs_ipc *ipc);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
new file mode 100644
index 000000000000..69178b5d39b1
--- /dev/null
+++ b/sound/soc/intel/avs/ipc.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "messages.h"
+#include "registers.h"
+
+#define AVS_IPC_TIMEOUT_MS	300
+
+static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
+{
+	struct avs_ipc *ipc = adev->ipc;
+	union avs_reply_msg msg = AVS_MSG(header);
+
+	ipc->rx.header = header;
+	if (!msg.status)
+		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
+			      ipc->rx.size);
+}
+
+static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
+{
+	struct avs_notify_mod_data mod_data;
+	union avs_notify_msg msg = AVS_MSG(header);
+	size_t data_size = 0;
+	void *data = NULL;
+
+	if (!adev->ipc->ready && msg.notify_msg_type != AVS_NOTIFY_FW_READY) {
+		dev_dbg(adev->dev, "FW not ready, skip notification: 0x%08x\n",
+			msg.primary);
+		return;
+	}
+
+	/* Calculate notification payload size. */
+	switch (msg.notify_msg_type) {
+	case AVS_NOTIFY_FW_READY:
+		break;
+
+	case AVS_NOTIFY_PHRASE_DETECTED:
+		data_size = sizeof(struct avs_notify_voice_data);
+		break;
+
+	case AVS_NOTIFY_RESOURCE_EVENT:
+		data_size = sizeof(struct avs_notify_res_data);
+		break;
+
+	case AVS_NOTIFY_MODULE_EVENT:
+		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
+		data_size = sizeof(mod_data) + mod_data.data_size;
+		break;
+
+	default:
+		dev_warn(adev->dev, "unknown notification: 0x%08x\n",
+			 msg.primary);
+		break;
+	}
+
+	if (data_size) {
+		data = kmalloc(data_size, GFP_KERNEL);
+		if (!data)
+			return;
+
+		memcpy_fromio(data, avs_uplink_addr(adev), data_size);
+	}
+
+	/* Perform notification-specific operations. */
+	switch (msg.notify_msg_type) {
+	case AVS_NOTIFY_FW_READY:
+		dev_dbg(adev->dev, "FW READY 0x%08x\n", msg.primary);
+		adev->ipc->ready = true;
+		complete(&adev->fw_ready);
+		break;
+
+	default:
+		break;
+	}
+
+	kfree(data);
+}
+
+void avs_dsp_process_response(struct avs_dev *adev, u64 header)
+{
+	struct avs_ipc *ipc = adev->ipc;
+
+	if (avs_msg_is_reply(header)) {
+		/* Response processing is invoked from IRQ thread. */
+		spin_lock_irq(&ipc->rx_lock);
+		avs_dsp_receive_rx(adev, header);
+		ipc->rx_completed = true;
+		spin_unlock_irq(&ipc->rx_lock);
+	} else {
+		avs_dsp_process_notification(adev, header);
+	}
+
+	complete(&ipc->busy_completion);
+}
+
+irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+	struct avs_ipc *ipc = adev->ipc;
+	const struct avs_spec *const spec = adev->spec;
+	u32 adspis, hipc_rsp, hipc_ack;
+	irqreturn_t ret = IRQ_NONE;
+
+	adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
+	if (adspis == UINT_MAX || !(adspis & AVS_ADSP_ADSPIS_IPC))
+		return ret;
+
+	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc_ack_offset);
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc_rsp_offset);
+
+	/* DSP acked host's request */
+	if (hipc_ack & spec->hipc_ack_done_mask) {
+		/* mask done interrupt */
+		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
+				      AVS_ADSP_HIPCCTL_DONE, 0);
+
+		complete(&ipc->done_completion);
+
+		/* tell DSP it has our attention */
+		snd_hdac_adsp_updatel(adev, spec->hipc_ack_offset,
+				      spec->hipc_ack_done_mask,
+				      spec->hipc_ack_done_mask);
+		/* unmask done interrupt */
+		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
+				      AVS_ADSP_HIPCCTL_DONE,
+				      AVS_ADSP_HIPCCTL_DONE);
+		ret = IRQ_HANDLED;
+	}
+
+	/* DSP sent new response to process */
+	if (hipc_rsp & spec->hipc_rsp_busy_mask) {
+		/* mask busy interrupt */
+		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
+				      AVS_ADSP_HIPCCTL_BUSY, 0);
+
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
+
+irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+	union avs_reply_msg msg;
+	u32 hipct, hipcte;
+
+	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
+	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
+
+	/* ensure DSP sent new response to process */
+	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
+		return IRQ_NONE;
+
+	msg.primary = hipct;
+	msg.ext.val = hipcte;
+	avs_dsp_process_response(adev, msg.val);
+
+	/* tell DSP we accepted its message */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT,
+			      SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
+	/* unmask busy interrupt */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
+			      AVS_ADSP_HIPCCTL_BUSY, AVS_ADSP_HIPCCTL_BUSY);
+
+	return IRQ_HANDLED;
+}
+
+static bool avs_ipc_is_busy(struct avs_ipc *ipc)
+{
+	struct avs_dev *adev = to_avs_dev(ipc->dev);
+	const struct avs_spec *const spec = adev->spec;
+	u32 hipc_rsp;
+
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc_rsp_offset);
+	return hipc_rsp & spec->hipc_rsp_busy_mask;
+}
+
+static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
+{
+	int ret;
+
+again:
+	ret = wait_for_completion_timeout(&ipc->busy_completion,
+					  msecs_to_jiffies(timeout));
+	/*
+	 * DSP could be unresponsive at this point e.g. manifested by
+	 * EXCEPTION_CAUGHT notification. If so, no point in continuing.
+	 */
+	if (!ipc->ready)
+		return -EPERM;
+
+	if (!ret) {
+		if (!avs_ipc_is_busy(ipc))
+			return -ETIMEDOUT;
+		/*
+		 * Firmware did its job, either notification or reply
+		 * has been received - now wait until it's processed.
+		 */
+		wait_for_completion_killable(&ipc->busy_completion);
+	}
+
+	/* Ongoing notification's bottom-half may cause early wakeup */
+	spin_lock(&ipc->rx_lock);
+	if (!ipc->rx_completed) {
+		/* Reply delayed due to notification. */
+		reinit_completion(&ipc->busy_completion);
+		spin_unlock(&ipc->rx_lock);
+		goto again;
+	}
+
+	spin_unlock(&ipc->rx_lock);
+	return 0;
+}
+
+static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg *reply)
+{
+	lockdep_assert_held(&ipc->rx_lock);
+
+	ipc->rx.header = 0;
+	ipc->rx.size = reply ? reply->size : 0;
+	ipc->rx_completed = false;
+
+	reinit_completion(&ipc->done_completion);
+	reinit_completion(&ipc->busy_completion);
+}
+
+static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg *tx)
+{
+	const struct avs_spec *const spec = adev->spec;
+
+	tx->header |= spec->hipc_req_busy_mask;
+
+	if (tx->size)
+		memcpy_toio(avs_downlink_addr(adev), tx->data, tx->size);
+	snd_hdac_adsp_writel(adev, spec->hipc_req_ext_offset, tx->header >> 32);
+	snd_hdac_adsp_writel(adev, spec->hipc_req_offset, tx->header & UINT_MAX);
+}
+
+static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+			       struct avs_ipc_msg *reply, int timeout)
+{
+	struct avs_ipc *ipc = adev->ipc;
+	int ret;
+
+	if (!ipc->ready)
+		return -EPERM;
+
+	mutex_lock(&ipc->msg_mutex);
+
+	spin_lock(&ipc->rx_lock);
+	avs_ipc_msg_init(ipc, reply);
+	avs_dsp_send_tx(adev, request);
+	spin_unlock(&ipc->rx_lock);
+
+	ret = avs_ipc_wait_busy_completion(ipc, timeout);
+	if (ret) {
+		if (ret == -ETIMEDOUT) {
+			dev_crit(adev->dev, "communication severed: %d, rebooting dsp..\n",
+				 ret);
+
+			avs_ipc_block(ipc);
+		}
+		goto exit;
+	}
+
+	ret = ipc->rx.rsp.status;
+	if (reply) {
+		reply->header = ipc->rx.header;
+		if (reply->data && ipc->rx.size)
+			memcpy(reply->data, ipc->rx.data, reply->size);
+	}
+
+exit:
+	mutex_unlock(&ipc->msg_mutex);
+	return ret;
+}
+
+static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
+				     struct avs_ipc_msg *request,
+				     struct avs_ipc_msg *reply, int timeout,
+				     bool wake_d0i0, bool schedule_d0ix)
+{
+	return avs_dsp_do_send_msg(adev, request, reply, timeout);
+}
+
+int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
+			     struct avs_ipc_msg *reply, int timeout)
+{
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
+					 false, false);
+}
+
+int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+		     struct avs_ipc_msg *reply)
+{
+	return avs_dsp_send_msg_timeout(adev, request, reply,
+					adev->ipc->default_timeout_ms);
+}
+
+int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev,
+				struct avs_ipc_msg *request,
+				struct avs_ipc_msg *reply, int timeout,
+				bool wake_d0i0)
+{
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
+					 wake_d0i0, false);
+}
+
+int avs_dsp_send_pm_msg(struct avs_dev *adev,
+			struct avs_ipc_msg *request,
+			struct avs_ipc_msg *reply, bool wake_d0i0)
+{
+	return avs_dsp_send_pm_msg_timeout(adev, request, reply,
+					   adev->ipc->default_timeout_ms,
+					   wake_d0i0);
+}
+
+static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+				   int timeout)
+{
+	struct avs_ipc *ipc = adev->ipc;
+	int ret;
+
+	mutex_lock(&ipc->msg_mutex);
+
+	spin_lock(&ipc->rx_lock);
+	avs_ipc_msg_init(ipc, NULL);
+	avs_dsp_send_tx(adev, request);
+	spin_unlock(&ipc->rx_lock);
+
+	/* ROM messages must be sent before main core is unstalled */
+	ret = avs_dsp_op(adev, stall, AVS_MAIN_CORE_MASK, false);
+	if (!ret) {
+		ret = wait_for_completion_timeout(&ipc->done_completion,
+						  msecs_to_jiffies(timeout));
+		ret = ret ? 0 : -ETIMEDOUT;
+	}
+
+	mutex_unlock(&ipc->msg_mutex);
+
+	return ret;
+}
+
+int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
+				 struct avs_ipc_msg *request, int timeout)
+{
+	return avs_dsp_do_send_rom_msg(adev, request, timeout);
+}
+
+int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request)
+{
+	return avs_dsp_send_rom_msg_timeout(adev, request,
+					    adev->ipc->default_timeout_ms);
+}
+
+void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
+{
+	const struct avs_spec *const spec = adev->spec;
+	u32 value;
+
+	value = enable ? AVS_ADSP_ADSPIC_IPC : 0;
+	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPIC,
+			      AVS_ADSP_ADSPIC_IPC, value);
+
+	value = enable ? AVS_ADSP_HIPCCTL_DONE : 0;
+	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE, value);
+
+	value = enable ? AVS_ADSP_HIPCCTL_BUSY : 0;
+	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
+			      AVS_ADSP_HIPCCTL_BUSY, value);
+}
+
+int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
+{
+	ipc->rx.data = devm_kzalloc(dev, AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!ipc->rx.data)
+		return -ENOMEM;
+
+	ipc->dev = dev;
+	ipc->ready = false;
+	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
+	init_completion(&ipc->done_completion);
+	init_completion(&ipc->busy_completion);
+	spin_lock_init(&ipc->rx_lock);
+	mutex_init(&ipc->msg_mutex);
+
+	return 0;
+}
+
+void avs_ipc_block(struct avs_ipc *ipc)
+{
+	ipc->ready = false;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
new file mode 100644
index 000000000000..003e634f5547
--- /dev/null
+++ b/sound/soc/intel/avs/messages.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_MSGS_H
+#define __SOUND_SOC_INTEL_AVS_MSGS_H
+
+struct avs_dev;
+
+#define AVS_MAILBOX_SIZE 4096
+
+enum avs_msg_target {
+	AVS_FW_GEN_MSG = 0,
+	AVS_MOD_MSG = 1
+};
+
+enum avs_msg_direction {
+	AVS_MSG_REQUEST = 0,
+	AVS_MSG_REPLY = 1
+};
+
+enum avs_global_msg_type {
+	AVS_GLB_NOTIFICATION = 27,
+};
+
+union avs_global_msg {
+	u64 val;
+	struct {
+		union {
+			u32 primary;
+			struct {
+				u32 rsvd:24;
+				u32 global_msg_type:5;
+				u32 msg_direction:1;
+				u32 msg_target:1;
+			};
+		};
+		union {
+			u32 val;
+		} ext;
+	};
+} __packed;
+
+struct avs_tlv {
+	u32 type;
+	u32 length;
+	u32 value[];
+} __packed;
+
+union avs_module_msg {
+	u64 val;
+	struct {
+		union {
+			u32 primary;
+			struct {
+				u32 module_id:16;
+				u32 instance_id:8;
+				u32 module_msg_type:5;
+				u32 msg_direction:1;
+				u32 msg_target:1;
+			};
+		};
+		union {
+			u32 val;
+		} ext;
+	};
+} __packed;
+
+union avs_reply_msg {
+	u64 val;
+	struct {
+		union {
+			u32 primary;
+			struct {
+				u32 status:24;
+				u32 global_msg_type:5;
+				u32 msg_direction:1;
+				u32 msg_target:1;
+			};
+		};
+		union {
+			u32 val;
+		} ext;
+	};
+} __packed;
+
+enum avs_notify_msg_type {
+	AVS_NOTIFY_PHRASE_DETECTED = 4,
+	AVS_NOTIFY_RESOURCE_EVENT = 5,
+	AVS_NOTIFY_FW_READY = 8,
+	AVS_NOTIFY_MODULE_EVENT = 12,
+};
+
+union avs_notify_msg {
+	u64 val;
+	struct {
+		union {
+			u32 primary;
+			struct {
+				u32 rsvd:16;
+				u32 notify_msg_type:8;
+				u32 global_msg_type:5;
+				u32 msg_direction:1;
+				u32 msg_target:1;
+			};
+		};
+		union {
+			u32 val;
+		} ext;
+	};
+} __packed;
+
+#define AVS_MSG(hdr) { .val = hdr }
+
+#define AVS_GLOBAL_REQUEST(msg_type)		\
+{						\
+	.global_msg_type = AVS_GLB_##msg_type,	\
+	.msg_direction = AVS_MSG_REQUEST,	\
+	.msg_target = AVS_FW_GEN_MSG,		\
+}
+
+#define AVS_MODULE_REQUEST(msg_type)		\
+{						\
+	.module_msg_type = AVS_MOD_##msg_type,	\
+	.msg_direction = AVS_MSG_REQUEST,	\
+	.msg_target = AVS_MOD_MSG,		\
+}
+
+#define AVS_NOTIFICATION(msg_type)		\
+{						\
+	.notify_msg_type = AVS_NOTIFY_##msg_type,\
+	.global_msg_type = AVS_GLB_NOTIFICATION,\
+	.msg_direction = AVS_MSG_REPLY,		\
+	.msg_target = AVS_FW_GEN_MSG,		\
+}
+
+#define avs_msg_is_reply(hdr) \
+({ \
+	union avs_reply_msg __msg = AVS_MSG(hdr); \
+	__msg.msg_direction == AVS_MSG_REPLY && \
+	__msg.global_msg_type != AVS_GLB_NOTIFICATION; \
+})
+
+/* Notification types */
+
+struct avs_notify_voice_data {
+	u16 kpd_score;
+	u16 reserved;
+} __packed;
+
+struct avs_notify_res_data {
+	u32 resource_type;
+	u32 resource_id;
+	u32 event_type;
+	u32 reserved;
+	u32 data[6];
+} __packed;
+
+struct avs_notify_mod_data {
+	u32 module_instance_id;
+	u32 event_id;
+	u32 data_size;
+	u32 data[];
+} __packed;
+
+#endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index e0b6c8ffe633..c1db10269c62 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -12,6 +12,11 @@
 /* Intel HD Audio General DSP Registers */
 #define AVS_ADSP_GEN_BASE		0x0
 #define AVS_ADSP_REG_ADSPCS		(AVS_ADSP_GEN_BASE + 0x04)
+#define AVS_ADSP_REG_ADSPIC		(AVS_ADSP_GEN_BASE + 0x08)
+#define AVS_ADSP_REG_ADSPIS		(AVS_ADSP_GEN_BASE + 0x0C)
+
+#define AVS_ADSP_ADSPIC_IPC		BIT(0)
+#define AVS_ADSP_ADSPIS_IPC		BIT(0)
 
 #define AVS_ADSPCS_CRST_MASK(cm)	(cm)
 #define AVS_ADSPCS_CSTALL_MASK(cm)	((cm) << 8)
@@ -19,4 +24,44 @@
 #define AVS_ADSPCS_CPA_MASK(cm)		((cm) << 24)
 #define AVS_MAIN_CORE_MASK		BIT(0)
 
+#define AVS_ADSP_HIPCCTL_BUSY		BIT(0)
+#define AVS_ADSP_HIPCCTL_DONE		BIT(1)
+
+/* SKL Intel HD Audio Inter-Processor Communication Registers */
+#define SKL_ADSP_IPC_BASE		0x40
+#define SKL_ADSP_REG_HIPCT		(SKL_ADSP_IPC_BASE + 0x00)
+#define SKL_ADSP_REG_HIPCTE		(SKL_ADSP_IPC_BASE + 0x04)
+#define SKL_ADSP_REG_HIPCI		(SKL_ADSP_IPC_BASE + 0x08)
+#define SKL_ADSP_REG_HIPCIE		(SKL_ADSP_IPC_BASE + 0x0C)
+#define SKL_ADSP_REG_HIPCCTL		(SKL_ADSP_IPC_BASE + 0x10)
+
+#define SKL_ADSP_HIPCI_BUSY		BIT(31)
+#define SKL_ADSP_HIPCIE_DONE		BIT(30)
+#define SKL_ADSP_HIPCT_BUSY		BIT(31)
+
+/* Constants used when accessing SRAM, space shared with firmware */
+#define AVS_FW_REG_BASE(adev)		((adev)->spec->sram_base_offset)
+#define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
+#define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
+
+#define AVS_FW_REGS_SIZE		PAGE_SIZE
+#define AVS_FW_REGS_WINDOW		0
+/* DSP -> HOST communication window */
+#define AVS_UPLINK_WINDOW		AVS_FW_REGS_WINDOW
+/* HOST -> DSP communication window */
+#define AVS_DOWNLINK_WINDOW		1
+
+/* registry I/O helpers */
+#define avs_sram_offset(adev, window_idx) \
+	((adev)->spec->sram_base_offset + \
+	 (adev)->spec->sram_window_size * (window_idx))
+
+#define avs_sram_addr(adev, window_idx) \
+	((adev)->adsp_ba + avs_sram_offset(adev, window_idx))
+
+#define avs_uplink_addr(adev) \
+	(avs_sram_addr(adev, AVS_UPLINK_WINDOW) + AVS_FW_REGS_SIZE)
+#define avs_downlink_addr(adev) \
+	avs_sram_addr(adev, AVS_DOWNLINK_WINDOW)
+
 #endif /* __SOUND_SOC_INTEL_AVS_REGS_H */
-- 
2.25.1

