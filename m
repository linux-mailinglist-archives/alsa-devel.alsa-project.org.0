Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA227980B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 11:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F8A15E2;
	Sat, 26 Sep 2020 11:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F8A15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601110953;
	bh=nzwDIOntP0A60f2vvTDd/Ixzy3t0Wnpbg0YuMPjdFo0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eb82A6AW0kG7ZDFH/vvX9Jc5OaMhR84WK9SkTsaCIXV7ZrMJaFGOkPo3LdXCrQ3TU
	 IiT0p5+YVr7VVhrSVPexR8JooK2BrxMB8mL3fNm2Crd9KjAnFeYPcISoQZ5ISIR7Vc
	 lNCSPq0YHFy8qT7NrYOIds92u5JO86WkcAGw+Lig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5E2F802DD;
	Sat, 26 Sep 2020 10:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26CF3F802C4; Sat, 26 Sep 2020 10:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DE7DF80234
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 10:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DE7DF80234
IronPort-SDR: Y1mWItSExJbHH0imDPF1ndyYLGV6pmXsdtmKol7n2uGqQ6eE7XKtziogqxWr6jJTLpd7smtJZO
 +NdVW+/5S2aQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="149389320"
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="149389320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2020 01:59:25 -0700
IronPort-SDR: gNtlegGpfgMZ7dRc7wqMgXWXNdfL6Ako6AD7wLBNsjNOJze04nOB7j7u7E4QR1nJUCtuUI0TVU
 4nOxgnRFp5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="414198400"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2020 01:59:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Date: Sat, 26 Sep 2020 10:58:58 +0200
Message-Id: <20200926085910.21948-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926085910.21948-1-cezary.rojewski@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

Implement IRQ handlers for immediate and delayed replies and
notifications. Communication is synchronous and allows for serialization
of maximum one message at a time.

DSP may respond with ADSP_PENDING status for a request - known as
delayed reply - and when situation occurs, framework keeps the lock and
awaits upcoming response through IPCD channel which is handled in
bottom-half. Immediate replies spawn no BH at all as their processing is
very short.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h      |  44 ++++
 sound/soc/intel/catpt/ipc.c       | 245 ++++++++++++++++++
 sound/soc/intel/catpt/messages.h  | 401 ++++++++++++++++++++++++++++++
 sound/soc/intel/catpt/registers.h |   1 -
 4 files changed, 690 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/catpt/ipc.c
 create mode 100644 sound/soc/intel/catpt/messages.h

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 48952e93d86f..8819d928e891 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -9,6 +9,8 @@
 #define __SND_SOC_INTEL_CATPT_CORE_H
 
 #include <linux/dma/dw.h>
+#include <linux/irqreturn.h>
+#include "messages.h"
 #include "registers.h"
 
 struct catpt_dev;
@@ -29,6 +31,31 @@ static inline bool catpt_resource_overlapping(struct resource *r1,
 	return true;
 }
 
+struct catpt_ipc_msg {
+	union {
+		u32 header;
+		union catpt_global_msg rsp;
+	};
+	void *data;
+	size_t size;
+};
+
+struct catpt_ipc {
+	struct device *dev;
+
+	struct catpt_ipc_msg rx;
+	struct catpt_fw_ready config;
+	u32 default_timeout;
+	bool ready;
+
+	spinlock_t lock;
+	struct mutex mutex;
+	struct completion done_completion;
+	struct completion busy_completion;
+};
+
+void catpt_ipc_init(struct catpt_ipc *ipc, struct device *dev);
+
 struct catpt_module_type {
 	bool loaded;
 	u32 entry_point;
@@ -59,6 +86,7 @@ struct catpt_spec {
 struct catpt_dev {
 	struct device *dev;
 	struct dw_dma_chip *dmac;
+	struct catpt_ipc ipc;
 
 	void __iomem *pci_ba;
 	void __iomem *lpe_ba;
@@ -83,4 +111,20 @@ int catpt_dma_memcpy_fromdsp(struct catpt_dev *cdev, struct dma_chan *chan,
 			     dma_addr_t dst_addr, dma_addr_t src_addr,
 			     size_t size);
 
+irqreturn_t catpt_dsp_irq_handler(int irq, void *dev_id);
+irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id);
+
+/*
+ * IPC handlers may return positive values which denote successful
+ * HOST <-> DSP communication yet failure to process specific request.
+ * Use below macro to convert returned non-zero values appropriately
+ */
+#define CATPT_IPC_ERROR(err) (((err) < 0) ? (err) : -EREMOTEIO)
+
+int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
+			       struct catpt_ipc_msg request,
+			       struct catpt_ipc_msg *reply, int timeout);
+int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
+		       struct catpt_ipc_msg *reply);
+
 #endif
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
new file mode 100644
index 000000000000..fbc2ed2590e9
--- /dev/null
+++ b/sound/soc/intel/catpt/ipc.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/irqreturn.h>
+#include "core.h"
+#include "messages.h"
+#include "registers.h"
+
+#define CATPT_IPC_TIMEOUT_MS	300
+
+void catpt_ipc_init(struct catpt_ipc *ipc, struct device *dev)
+{
+	ipc->dev = dev;
+	ipc->ready = false;
+	ipc->default_timeout = CATPT_IPC_TIMEOUT_MS;
+	init_completion(&ipc->done_completion);
+	init_completion(&ipc->busy_completion);
+	spin_lock_init(&ipc->lock);
+	mutex_init(&ipc->mutex);
+}
+
+static int catpt_ipc_arm(struct catpt_ipc *ipc, struct catpt_fw_ready *config)
+{
+	/*
+	 * Both tx and rx are put into and received from outbox. Inbox is
+	 * only used for notifications where payload size is known upfront,
+	 * thus no separate buffer is allocated for it.
+	 */
+	ipc->rx.data = devm_kzalloc(ipc->dev, config->outbox_size, GFP_KERNEL);
+	if (!ipc->rx.data)
+		return -ENOMEM;
+
+	memcpy(&ipc->config, config, sizeof(*config));
+	ipc->ready = true;
+
+	return 0;
+}
+
+static void catpt_ipc_msg_init(struct catpt_ipc *ipc,
+			       struct catpt_ipc_msg *reply)
+{
+	lockdep_assert_held(&ipc->lock);
+
+	ipc->rx.header = 0;
+	ipc->rx.size = reply ? reply->size : 0;
+	reinit_completion(&ipc->done_completion);
+	reinit_completion(&ipc->busy_completion);
+}
+
+static void catpt_dsp_send_tx(struct catpt_dev *cdev,
+			      const struct catpt_ipc_msg *tx)
+{
+	u32 header = tx->header | CATPT_IPCC_BUSY;
+
+	memcpy_toio(catpt_outbox_addr(cdev), tx->data, tx->size);
+	catpt_writel_shim(cdev, IPCC, header);
+}
+
+static int catpt_wait_msg_completion(struct catpt_dev *cdev, int timeout)
+{
+	struct catpt_ipc *ipc = &cdev->ipc;
+	int ret;
+
+	ret = wait_for_completion_timeout(&ipc->done_completion,
+					  msecs_to_jiffies(timeout));
+	if (!ret)
+		return -ETIMEDOUT;
+	if (ipc->rx.rsp.status != CATPT_REPLY_PENDING)
+		return 0;
+
+	/* wait for delayed reply */
+	ret = wait_for_completion_timeout(&ipc->busy_completion,
+					  msecs_to_jiffies(timeout));
+	return ret ? 0 : -ETIMEDOUT;
+}
+
+static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
+				 struct catpt_ipc_msg request,
+				 struct catpt_ipc_msg *reply, int timeout)
+{
+	struct catpt_ipc *ipc = &cdev->ipc;
+	unsigned long flags;
+	int ret;
+
+	if (!ipc->ready)
+		return -EPERM;
+	if (request.size > ipc->config.outbox_size ||
+	    (reply && reply->size > ipc->config.outbox_size))
+		return -EINVAL;
+
+	spin_lock_irqsave(&ipc->lock, flags);
+	catpt_ipc_msg_init(ipc, reply);
+	catpt_dsp_send_tx(cdev, &request);
+	spin_unlock_irqrestore(&ipc->lock, flags);
+
+	ret = catpt_wait_msg_completion(cdev, timeout);
+	if (ret) {
+		dev_crit(cdev->dev, "communication severed: %d, rebooting dsp..\n",
+			 ret);
+		ipc->ready = false;
+		/* TODO: attempt recovery */
+		return ret;
+	}
+
+	ret = ipc->rx.rsp.status;
+	if (reply) {
+		reply->header = ipc->rx.header;
+		if (!ret && reply->data)
+			memcpy(reply->data, ipc->rx.data, reply->size);
+	}
+
+	return ret;
+}
+
+int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
+			       struct catpt_ipc_msg request,
+			       struct catpt_ipc_msg *reply, int timeout)
+{
+	struct catpt_ipc *ipc = &cdev->ipc;
+	int ret;
+
+	mutex_lock(&ipc->mutex);
+	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout);
+	mutex_unlock(&ipc->mutex);
+
+	return ret;
+}
+
+int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
+		       struct catpt_ipc_msg *reply)
+{
+	return catpt_dsp_send_msg_timeout(cdev, request, reply,
+					  cdev->ipc.default_timeout);
+}
+
+static void catpt_dsp_copy_rx(struct catpt_dev *cdev, u32 header)
+{
+	struct catpt_ipc *ipc = &cdev->ipc;
+
+	ipc->rx.header = header;
+	if (ipc->rx.rsp.status != CATPT_REPLY_SUCCESS)
+		return;
+
+	memcpy_fromio(ipc->rx.data, catpt_outbox_addr(cdev), ipc->rx.size);
+}
+
+static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
+{
+	union catpt_notify_msg msg = CATPT_MSG(header);
+	struct catpt_ipc *ipc = &cdev->ipc;
+
+	if (msg.fw_ready) {
+		struct catpt_fw_ready config;
+		/* to fit 32b header original address is shifted right by 3 */
+		u32 off = msg.mailbox_address << 3;
+
+		memcpy_fromio(&config, cdev->lpe_ba + off, sizeof(config));
+
+		catpt_ipc_arm(ipc, &config);
+		complete(&cdev->fw_ready);
+		return;
+	}
+
+	switch (msg.global_msg_type) {
+	case CATPT_GLB_REQUEST_CORE_DUMP:
+		break;
+
+	case CATPT_GLB_STREAM_MESSAGE:
+		switch (msg.stream_msg_type) {
+		case CATPT_STRM_NOTIFICATION:
+			break;
+		default:
+			catpt_dsp_copy_rx(cdev, header);
+			/* signal completion of delayed reply */
+			complete(&ipc->busy_completion);
+			break;
+		}
+		break;
+
+	default:
+		dev_warn(cdev->dev, "unknown response: %d received\n",
+			 msg.global_msg_type);
+		break;
+	}
+}
+
+irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id)
+{
+	struct catpt_dev *cdev = dev_id;
+	u32 ipcd;
+
+	ipcd = catpt_readl_shim(cdev, IPCD);
+
+	/* ensure there is delayed reply or notification to process */
+	if (!(ipcd & CATPT_IPCD_BUSY))
+		return IRQ_NONE;
+
+	catpt_dsp_process_response(cdev, ipcd);
+
+	/* tell DSP processing is completed */
+	catpt_updatel_shim(cdev, IPCD, CATPT_IPCD_BUSY | CATPT_IPCD_DONE,
+			   CATPT_IPCD_DONE);
+	/* unmask dsp BUSY interrupt */
+	catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB, 0);
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t catpt_dsp_irq_handler(int irq, void *dev_id)
+{
+	struct catpt_dev *cdev = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	u32 isc, ipcc;
+
+	isc = catpt_readl_shim(cdev, ISC);
+
+	/* immediate reply */
+	if (isc & CATPT_ISC_IPCCD) {
+		/* mask host DONE interrupt */
+		catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCCD, CATPT_IMC_IPCCD);
+
+		ipcc = catpt_readl_shim(cdev, IPCC);
+		catpt_dsp_copy_rx(cdev, ipcc);
+		complete(&cdev->ipc.done_completion);
+
+		/* tell DSP processing is completed */
+		catpt_updatel_shim(cdev, IPCC, CATPT_IPCC_DONE, 0);
+		/* unmask host DONE interrupt */
+		catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCCD, 0);
+		ret = IRQ_HANDLED;
+	}
+
+	/* delayed reply or notification */
+	if (isc & CATPT_ISC_IPCDB) {
+		/* mask dsp BUSY interrupt */
+		catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB, CATPT_IMC_IPCDB);
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
new file mode 100644
index 000000000000..1c51d142c177
--- /dev/null
+++ b/sound/soc/intel/catpt/messages.h
@@ -0,0 +1,401 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SND_SOC_INTEL_CATPT_MSG_H
+#define __SND_SOC_INTEL_CATPT_MSG_H
+
+struct catpt_dev;
+
+/* IPC messages base types  */
+
+enum catpt_reply_status {
+	CATPT_REPLY_SUCCESS = 0,
+	CATPT_REPLY_ERROR_INVALID_PARAM = 1,
+	CATPT_REPLY_UNKNOWN_MESSAGE_TYPE = 2,
+	CATPT_REPLY_OUT_OF_RESOURCES = 3,
+	CATPT_REPLY_BUSY = 4,
+	CATPT_REPLY_PENDING = 5,
+	CATPT_REPLY_FAILURE = 6,
+	CATPT_REPLY_INVALID_REQUEST = 7,
+	CATPT_REPLY_UNINITIALIZED = 8,
+	CATPT_REPLY_NOT_FOUND = 9,
+	CATPT_REPLY_SOURCE_NOT_STARTED = 10,
+};
+
+/* GLOBAL messages */
+
+enum catpt_global_msg_type {
+	CATPT_GLB_GET_FW_VERSION = 0,
+	CATPT_GLB_ALLOCATE_STREAM = 3,
+	CATPT_GLB_FREE_STREAM = 4,
+	CATPT_GLB_STREAM_MESSAGE = 6,
+	CATPT_GLB_REQUEST_CORE_DUMP = 7,
+	CATPT_GLB_SET_DEVICE_FORMATS = 10,
+	CATPT_GLB_ENTER_DX_STATE = 12,
+	CATPT_GLB_GET_MIXER_STREAM_INFO = 13,
+};
+
+union catpt_global_msg {
+	u32 val;
+	struct {
+		u32 status:5;
+		u32 context:19; /* stream or module specific */
+		u32 global_msg_type:5;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+} __packed;
+
+#define CATPT_MSG(hdr) { .val = hdr }
+#define CATPT_GLOBAL_MSG(msg_type) \
+	{ .global_msg_type = CATPT_GLB_##msg_type }
+
+#define BUILD_HASH_SIZE		40
+
+struct catpt_fw_version {
+	u8 build;
+	u8 minor;
+	u8 major;
+	u8 type;
+	u8 build_hash[BUILD_HASH_SIZE];
+	u32 log_providers_hash;
+} __packed;
+
+int catpt_ipc_get_fw_version(struct catpt_dev *cdev,
+			     struct catpt_fw_version *version);
+
+enum catpt_pin_id {
+	CATPT_PIN_ID_SYSTEM = 0,
+	CATPT_PIN_ID_REFERENCE = 1,
+	CATPT_PIN_ID_CAPTURE1 = 2,
+	CATPT_PIN_ID_CAPTURE2 = 3,
+	CATPT_PIN_ID_OFFLOAD1 = 4,
+	CATPT_PIN_ID_OFFLOAD2 = 5,
+	CATPT_PIN_ID_MIXER = 7,
+	CATPT_PIN_ID_BLUETOOTH_CAPTURE = 8,
+	CATPT_PIN_ID_BLUETOOTH_RENDER = 9,
+};
+
+enum catpt_path_id {
+	CATPT_PATH_SSP0_OUT = 0,
+	CATPT_PATH_SSP0_IN = 1,
+	CATPT_PATH_SSP1_OUT = 2,
+	CATPT_PATH_SSP1_IN = 3,
+	/* duplicated audio in capture path */
+	CATPT_PATH_SSP0_IN_DUP = 4,
+};
+
+enum catpt_stream_type {
+	CATPT_STRM_TYPE_RENDER = 0, /* offload */
+	CATPT_STRM_TYPE_SYSTEM = 1,
+	CATPT_STRM_TYPE_CAPTURE = 2,
+	CATPT_STRM_TYPE_LOOPBACK = 3,
+	CATPT_STRM_TYPE_BLUETOOTH_RENDER = 4,
+	CATPT_STRM_TYPE_BLUETOOTH_CAPTURE = 5,
+};
+
+enum catpt_format_id {
+	CATPT_FORMAT_PCM = 0,
+	CATPT_FORMAT_MP3 = 1,
+	CATPT_FORMAT_AAC = 2,
+	CATPT_FORMAT_WMA = 3,
+};
+
+enum catpt_channel_index {
+	CATPT_CHANNEL_LEFT = 0x0,
+	CATPT_CHANNEL_CENTER = 0x1,
+	CATPT_CHANNEL_RIGHT = 0x2,
+	CATPT_CHANNEL_LEFT_SURROUND = 0x3,
+	CATPT_CHANNEL_CENTER_SURROUND = 0x3,
+	CATPT_CHANNEL_RIGHT_SURROUND = 0x4,
+	CATPT_CHANNEL_LFE = 0x7,
+	CATPT_CHANNEL_INVALID = 0xF,
+};
+
+enum catpt_channel_config {
+	CATPT_CHANNEL_CONFIG_MONO	= 0, /* One channel only */
+	CATPT_CHANNEL_CONFIG_STEREO	= 1, /* L & R */
+	CATPT_CHANNEL_CONFIG_2_POINT_1	= 2, /* L, R & LFE; PCM only */
+	CATPT_CHANNEL_CONFIG_3_POINT_0	= 3, /* L, C & R; MP3 & AAC only */
+	CATPT_CHANNEL_CONFIG_3_POINT_1	= 4, /* L, C, R & LFE; PCM only */
+	CATPT_CHANNEL_CONFIG_QUATRO	= 5, /* L, R, Ls & Rs; PCM only */
+	CATPT_CHANNEL_CONFIG_4_POINT_0	= 6, /* L, C, R & Cs; MP3 & AAC only */
+	CATPT_CHANNEL_CONFIG_5_POINT_0	= 7, /* L, C, R, Ls & Rs */
+	CATPT_CHANNEL_CONFIG_5_POINT_1	= 8, /* L, C, R, Ls, Rs & LFE */
+	CATPT_CHANNEL_CONFIG_DUAL_MONO	= 9, /* One channel replicated in two */
+	CATPT_CHANNEL_CONFIG_INVALID	= 10,
+};
+
+enum catpt_interleaving_style {
+	CATPT_INTERLEAVING_PER_CHANNEL = 0,
+	CATPT_INTERLEAVING_PER_SAMPLE  = 1,
+};
+
+struct catpt_audio_format {
+	u32 sample_rate;
+	u32 bit_depth;
+	u32 channel_map;
+	u32 channel_config;
+	u32 interleaving;
+	u8 num_channels;
+	u8 valid_bit_depth;
+	u8 reserved[2];
+} __packed;
+
+struct catpt_ring_info {
+	u32 page_table_addr;
+	u32 num_pages;
+	u32 size;
+	u32 offset;
+	u32 ring_first_page_pfn;
+} __packed;
+
+#define CATPT_MODULE_COUNT (CATPT_MODID_LAST + 1)
+
+enum catpt_module_id {
+	CATPT_MODID_BASE_FW = 0x0,
+	CATPT_MODID_MP3 = 0x1,
+	CATPT_MODID_AAC_5_1 = 0x2,
+	CATPT_MODID_AAC_2_0 = 0x3,
+	CATPT_MODID_SRC = 0x4,
+	CATPT_MODID_WAVES = 0x5,
+	CATPT_MODID_DOLBY = 0x6,
+	CATPT_MODID_BOOST = 0x7,
+	CATPT_MODID_LPAL = 0x8,
+	CATPT_MODID_DTS = 0x9,
+	CATPT_MODID_PCM_CAPTURE = 0xA,
+	CATPT_MODID_PCM_SYSTEM = 0xB,
+	CATPT_MODID_PCM_REFERENCE = 0xC,
+	CATPT_MODID_PCM = 0xD, /* offload */
+	CATPT_MODID_BLUETOOTH_RENDER = 0xE,
+	CATPT_MODID_BLUETOOTH_CAPTURE = 0xF,
+	CATPT_MODID_LAST = CATPT_MODID_BLUETOOTH_CAPTURE,
+};
+
+struct catpt_module_entry {
+	u32 module_id;
+	u32 entry_point;
+} __packed;
+
+struct catpt_module_map {
+	u8 num_entries;
+	struct catpt_module_entry entries[];
+} __packed;
+
+struct catpt_memory_info {
+	u32 offset;
+	u32 size;
+} __packed;
+
+#define CATPT_CHANNELS_MAX	4
+#define CATPT_ALL_CHANNELS_MASK	UINT_MAX
+
+struct catpt_stream_info {
+	u32 stream_hw_id;
+	u32 reserved;
+	u32 read_pos_regaddr;
+	u32 pres_pos_regaddr;
+	u32 peak_meter_regaddr[CATPT_CHANNELS_MAX];
+	u32 volume_regaddr[CATPT_CHANNELS_MAX];
+} __packed;
+
+int catpt_ipc_alloc_stream(struct catpt_dev *cdev,
+			   enum catpt_path_id path_id,
+			   enum catpt_stream_type type,
+			   struct catpt_audio_format *afmt,
+			   struct catpt_ring_info *rinfo,
+			   u8 num_modules,
+			   struct catpt_module_entry *modules,
+			   struct resource *persistent,
+			   struct resource *scratch,
+			   struct catpt_stream_info *sinfo);
+int catpt_ipc_free_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+
+enum catpt_ssp_iface {
+	CATPT_SSP_IFACE_0 = 0,
+	CATPT_SSP_IFACE_1 = 1,
+	CATPT_SSP_IFACE_LAST = CATPT_SSP_IFACE_1,
+};
+
+#define CATPT_SSP_COUNT (CATPT_SSP_IFACE_LAST + 1)
+
+enum catpt_mclk_frequency {
+	CATPT_MCLK_OFF = 0,
+	CATPT_MCLK_FREQ_6_MHZ = 1,
+	CATPT_MCLK_FREQ_21_MHZ = 2,
+	CATPT_MCLK_FREQ_24_MHZ = 3,
+};
+
+enum catpt_ssp_mode {
+	CATPT_SSP_MODE_I2S_CONSUMER = 0,
+	CATPT_SSP_MODE_I2S_PROVIDER = 1,
+	CATPT_SSP_MODE_TDM_PROVIDER = 2,
+};
+
+struct catpt_ssp_device_format {
+	u32 iface;
+	u32 mclk;
+	u32 mode;
+	u16 clock_divider;
+	u8 channels;
+} __packed;
+
+int catpt_ipc_set_device_format(struct catpt_dev *cdev,
+				struct catpt_ssp_device_format *devfmt);
+
+enum catpt_dx_state {
+	CATPT_DX_STATE_D3 = 3,
+};
+
+enum catpt_dx_type {
+	CATPT_DX_TYPE_FW_IMAGE = 0,
+	CATPT_DX_TYPE_MEMORY_DUMP = 1,
+};
+
+struct catpt_save_meminfo {
+	u32 offset;
+	u32 size;
+	u32 source;
+} __packed;
+
+#define SAVE_MEMINFO_MAX	14
+
+struct catpt_dx_context {
+	u32 num_meminfo;
+	struct catpt_save_meminfo meminfo[SAVE_MEMINFO_MAX];
+} __packed;
+
+int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
+			    struct catpt_dx_context *context);
+
+struct catpt_mixer_stream_info {
+	u32 mixer_hw_id;
+	u32 peak_meter_regaddr[CATPT_CHANNELS_MAX];
+	u32 volume_regaddr[CATPT_CHANNELS_MAX];
+} __packed;
+
+int catpt_ipc_get_mixer_stream_info(struct catpt_dev *cdev,
+				    struct catpt_mixer_stream_info *info);
+
+/* STREAM messages */
+
+enum catpt_stream_msg_type {
+	CATPT_STRM_RESET_STREAM = 0,
+	CATPT_STRM_PAUSE_STREAM = 1,
+	CATPT_STRM_RESUME_STREAM = 2,
+	CATPT_STRM_STAGE_MESSAGE = 3,
+	CATPT_STRM_NOTIFICATION = 4,
+};
+
+enum catpt_stage_action {
+	CATPT_STG_SET_VOLUME = 1,
+	CATPT_STG_SET_WRITE_POSITION = 2,
+	CATPT_STG_MUTE_LOOPBACK = 3,
+};
+
+union catpt_stream_msg {
+	u32 val;
+	struct {
+		u32 status:5;
+		u32 reserved:7;
+		u32 stage_action:4;
+		u32 stream_hw_id:4;
+		u32 stream_msg_type:4;
+		u32 global_msg_type:5;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+} __packed;
+
+#define CATPT_STREAM_MSG(msg_type) \
+{ \
+	.stream_msg_type = CATPT_STRM_##msg_type, \
+	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }
+#define CATPT_STAGE_MSG(msg_type) \
+{ \
+	.stage_action = CATPT_STG_##msg_type, \
+	.stream_msg_type = CATPT_STRM_STAGE_MESSAGE, \
+	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }
+
+int catpt_ipc_reset_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_ipc_pause_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_ipc_resume_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+
+/* STREAM messages - STAGE subtype */
+
+enum catpt_audio_curve_type {
+	CATPT_AUDIO_CURVE_NONE = 0,
+	CATPT_AUDIO_CURVE_WINDOWS_FADE = 1,
+};
+
+int catpt_ipc_set_volume(struct catpt_dev *cdev, u8 stream_hw_id,
+			 u32 channel, u32 volume,
+			 u32 curve_duration,
+			 enum catpt_audio_curve_type curve_type);
+
+int catpt_ipc_set_write_pos(struct catpt_dev *cdev, u8 stream_hw_id,
+			    u32 pos, bool eob, bool ll);
+
+int catpt_ipc_mute_loopback(struct catpt_dev *cdev, u8 stream_hw_id, bool mute);
+
+/* NOTIFICATION messages */
+
+enum catpt_notify_reason {
+	CATPT_NOTIFY_POSITION_CHANGED = 0,
+	CATPT_NOTIFY_GLITCH_OCCURRED = 1,
+};
+
+union catpt_notify_msg {
+	u32 val;
+	struct {
+		u32 mailbox_address:29;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+	struct {
+		u32 status:5;
+		u32 reserved:7;
+		u32 notify_reason:4;
+		u32 stream_hw_id:4;
+		u32 stream_msg_type:4;
+		u32 global_msg_type:5;
+		u32 hdr:3; /* fw_ready, done, busy */
+	};
+} __packed;
+
+#define FW_INFO_SIZE_MAX	100
+
+struct catpt_fw_ready {
+	u32 inbox_offset;
+	u32 outbox_offset;
+	u32 inbox_size;
+	u32 outbox_size;
+	u32 fw_info_size;
+	char fw_info[FW_INFO_SIZE_MAX];
+} __packed;
+
+struct catpt_notify_position {
+	u32 stream_position;
+	u32 fw_cycle_count;
+} __packed;
+
+enum catpt_glitch_type {
+	CATPT_GLITCH_UNDERRUN = 1,
+	CATPT_GLITCH_DECODER_ERROR = 2,
+	CATPT_GLITCH_DOUBLED_WRITE_POS = 3,
+};
+
+struct catpt_notify_glitch {
+	u32 type;
+	u64 presentation_pos;
+	u32 write_pos;
+} __packed;
+
+#endif
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
index a051d8b36d88..47280d82842e 100644
--- a/sound/soc/intel/catpt/registers.h
+++ b/sound/soc/intel/catpt/registers.h
@@ -15,7 +15,6 @@
 #define CATPT_SHIM_REGS_SIZE	4096
 #define CATPT_DMA_REGS_SIZE	1024
 #define CATPT_DMA_COUNT		2
-#define CATPT_SSP_COUNT		2
 #define CATPT_SSP_REGS_SIZE	512
 
 /* DSP Shim registers */
-- 
2.17.1

