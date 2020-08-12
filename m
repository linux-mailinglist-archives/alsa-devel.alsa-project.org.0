Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D68243052
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 23:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850B51665;
	Wed, 12 Aug 2020 23:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850B51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597266157;
	bh=Gfn/tz5a68gQ3HC55ztMBTa+wjKUhtDlt4Zmru0tDOc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5gBNgzk5PHZ+66HNcXS4Hr8EOdjHz6F5AlB8gXRIkfNaQqr5RqOwD+ro1ZvUmNrC
	 5LO7aiLtSC6jC0NSO3kgLlLI1EBttFtvKghuzDClZK/IxLKcQd77y68Gzw7N/pmkbL
	 WCvMkH6OGQeMMSs0wakyVFQX4aSvJ7kYQxdfOzQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6987DF802F8;
	Wed, 12 Aug 2020 22:58:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 019D9F802F8; Wed, 12 Aug 2020 22:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF1EBF802DF
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 22:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF1EBF802DF
IronPort-SDR: 0ev3vK1fQ+cFmAMfObd90EZTryUBBjN3gyZqBZOfBcJ1MLO1uyO1F48YFl3SdMYTikRKa8RNkU
 7SpSBG+aUDtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="151729913"
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; d="scan'208";a="151729913"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 13:58:33 -0700
IronPort-SDR: xTcJkSbQP5FnV5oraJfx48R8dXULugS9R5DjiizpXsbim6NOrrTrqSioVUg3vnhYkSeglqxWL0
 LfnRKqhazKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; d="scan'208";a="308837228"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 12 Aug 2020 13:58:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 04/13] ASoC: Intel: catpt: Implement IPC protocol
Date: Wed, 12 Aug 2020 22:57:44 +0200
Message-Id: <20200812205753.29115-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812205753.29115-1-cezary.rojewski@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
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
 sound/soc/intel/catpt/dsp.c |  99 ++++++++++++
 sound/soc/intel/catpt/ipc.c | 298 ++++++++++++++++++++++++++++++++++++
 2 files changed, 397 insertions(+)
 create mode 100644 sound/soc/intel/catpt/ipc.c

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 1474e2e11672..9ebd4af97100 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -5,6 +5,7 @@
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/devcoredump.h>
 #include <linux/dma-mapping.h>
 #include <linux/acpi_dma.h>
 #include <linux/firmware.h>
@@ -495,3 +496,101 @@ int wpt_dsp_power_up(struct catpt_dev *cdev)
 
 	return 0;
 }
+
+#define CATPT_DUMP_MAGIC		0xcd42
+#define CATPT_DUMP_SECTION_ID_FILE	0x00
+#define CATPT_DUMP_SECTION_ID_IRAM	0x01
+#define CATPT_DUMP_SECTION_ID_DRAM	0x02
+#define CATPT_DUMP_SECTION_ID_REGS	0x03
+
+struct catpt_dump_section_hdr {
+	u16 magic;
+	u8 core_id;
+	u8 section_id;
+	u32 size;
+};
+
+int catpt_coredump(struct catpt_dev *cdev)
+{
+	struct catpt_dump_section_hdr *hdr;
+	size_t dump_size, regs_size;
+	u8 *dump, *pos;
+	int i, j;
+
+	regs_size = CATPT_SHIM_REGS_SIZE;
+	regs_size += CATPT_DMA_COUNT * CATPT_DMA_REGS_SIZE;
+	regs_size += CATPT_SSP_COUNT * CATPT_SSP_REGS_SIZE;
+	dump_size = resource_size(&cdev->dram);
+	dump_size += resource_size(&cdev->iram);
+	dump_size += regs_size;
+	dump_size += 4 * sizeof(*hdr) + 20; /* hdrs and fw hash */
+
+	dump = vzalloc(dump_size);
+	if (!dump)
+		return -ENOMEM;
+
+	pos = dump;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_FILE;
+	hdr->size = dump_size - sizeof(*hdr);
+	pos += sizeof(*hdr);
+
+	for (i = j = 0; i < FW_INFO_SIZE_MAX; i++)
+		if (cdev->ipc.config.fw_info[i] == ' ')
+			if (++j == 4)
+				break;
+	for (j = ++i; j < FW_INFO_SIZE_MAX && j - i < 20; j++) {
+		if (cdev->ipc.config.fw_info[j] == ' ')
+			break;
+		*(pos + j - i) = cdev->ipc.config.fw_info[j];
+	}
+	pos += 20;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_IRAM;
+	hdr->size = resource_size(&cdev->iram);
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, cdev->lpe_ba + cdev->iram.start, hdr->size);
+	pos += hdr->size;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_DRAM;
+	hdr->size = resource_size(&cdev->dram);
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, cdev->lpe_ba + cdev->dram.start, hdr->size);
+	pos += hdr->size;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_REGS;
+	hdr->size = regs_size;
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, catpt_shim_addr(cdev), CATPT_SHIM_REGS_SIZE);
+	pos += CATPT_SHIM_REGS_SIZE;
+
+	for (i = 0; i < CATPT_SSP_COUNT; i++) {
+		memcpy_fromio(pos, catpt_ssp_addr(cdev, i),
+			      CATPT_SSP_REGS_SIZE);
+		pos += CATPT_SSP_REGS_SIZE;
+	}
+	for (i = 0; i < CATPT_DMA_COUNT; i++) {
+		memcpy_fromio(pos, catpt_dma_addr(cdev, i),
+			      CATPT_DMA_REGS_SIZE);
+		pos += CATPT_DMA_REGS_SIZE;
+	}
+
+	dev_coredumpv(cdev->dev, dump, dump_size, GFP_KERNEL);
+
+	return 0;
+}
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
new file mode 100644
index 000000000000..a2cec2ba12e7
--- /dev/null
+++ b/sound/soc/intel/catpt/ipc.c
@@ -0,0 +1,298 @@
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
+#include "trace.h"
+
+#define CATPT_IPC_TIMEOUT_MSECS	300
+
+void catpt_ipc_init(struct catpt_ipc *ipc, struct device *dev)
+{
+	ipc->dev = dev;
+	ipc->ready = false;
+	ipc->default_timeout = CATPT_IPC_TIMEOUT_MSECS;
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
+	 * thus no separate buffer is allocated for it
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
+	trace_catpt_ipc_request(header);
+	trace_catpt_ipc_payload(tx->data, tx->size);
+
+	if (tx->size)
+		memcpy_toio(catpt_outbox_addr(cdev), tx->data, tx->size);
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
+	if (ret < 0) {
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
+		if (!ret && reply->data && reply->size)
+			memcpy(reply->data, ipc->rx.data, ipc->rx.size);
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
+static void
+catpt_dsp_notify_stream(struct catpt_dev *cdev, union catpt_notify_msg msg)
+{
+	struct catpt_stream_runtime *stream;
+	struct catpt_notify_position pos;
+	struct catpt_notify_glitch glitch;
+
+	stream = catpt_stream_find(cdev, msg.stream_hw_id);
+	if (!stream) {
+		dev_warn(cdev->dev, "notify %d for non-existent stream %d\n",
+			 msg.notify_reason, msg.stream_hw_id);
+		return;
+	}
+
+	switch (msg.notify_reason) {
+	case CATPT_NOTIFY_POSITION_CHANGED:
+		memcpy_fromio(&pos, catpt_inbox_addr(cdev), sizeof(pos));
+		trace_catpt_ipc_payload((u8 *)&pos, sizeof(pos));
+
+		catpt_stream_update_position(cdev, stream, &pos);
+		break;
+
+	case CATPT_NOTIFY_GLITCH_OCCURRED:
+		memcpy_fromio(&glitch, catpt_inbox_addr(cdev), sizeof(glitch));
+		trace_catpt_ipc_payload((u8 *)&glitch, sizeof(glitch));
+
+		dev_warn(cdev->dev, "glitch %d at pos: 0x%08llx, wp: 0x%08x\n",
+			 glitch.type, glitch.presentation_pos,
+			 glitch.write_pos);
+		break;
+
+	default:
+		dev_warn(cdev->dev, "unknown notification: %d received\n",
+			 msg.notify_reason);
+		break;
+	}
+}
+
+static void catpt_dsp_copy_rx(struct catpt_dev *cdev, u32 header)
+{
+	struct catpt_ipc *ipc = &cdev->ipc;
+
+	ipc->rx.header = header;
+	if (ipc->rx.size && ipc->rx.rsp.status == CATPT_REPLY_SUCCESS) {
+		memcpy_fromio(ipc->rx.data, catpt_outbox_addr(cdev),
+			      ipc->rx.size);
+		trace_catpt_ipc_payload(ipc->rx.data, ipc->rx.size);
+	}
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
+		trace_catpt_ipc_payload((u8 *)&config, sizeof(config));
+
+		catpt_ipc_arm(ipc, &config);
+		complete(&cdev->fw_ready);
+		return;
+	}
+
+	switch (msg.type) {
+	case CATPT_GLB_REQUEST_CORE_DUMP:
+		dev_err(cdev->dev, "ADSP device coredump received\n");
+		ipc->ready = false;
+		catpt_coredump(cdev);
+		/* TODO: attempt recovery */
+		break;
+
+	case CATPT_GLB_STREAM_MESSAGE:
+		switch (msg.subtype) {
+		case CATPT_STRM_NOTIFICATION:
+			catpt_dsp_notify_stream(cdev, msg);
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
+			 msg.type);
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
+	trace_catpt_ipc_notify(ipcd);
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
+	trace_catpt_irq(isc);
+
+	/* immediate reply */
+	if (isc & CATPT_ISC_IPCCD) {
+		/* mask host DONE interrupt */
+		catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCCD, CATPT_IMC_IPCCD);
+
+		ipcc = catpt_readl_shim(cdev, IPCC);
+		trace_catpt_ipc_reply(ipcc);
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
-- 
2.17.1

