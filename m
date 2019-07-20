Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F646F089
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 21:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C750C170B;
	Sat, 20 Jul 2019 21:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C750C170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563652273;
	bh=atM1TfeLIk23NDirG0S2lXTI4slj0uB/dT/9yR6YKTs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYHmIcWsUDmQ+JGfERGi0K6Y39DV58unYdZW74MBhy3QejyfFSh6iPi/xHMo1PYAx
	 YhQ4GgRIlVw1FDk/Gtgw1J4yX1y5+cRDsYouDDWEp8/6sxdeGAdMQxBd9O5sZYup7X
	 DEfNnBZelGzFDYHwVDiPgt3Fa+Rpl5f4GDWOxju4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8889AF8048D;
	Sat, 20 Jul 2019 21:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1A6F80444; Sat, 20 Jul 2019 21:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CECCBF803D0
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 21:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CECCBF803D0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 12:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="176592952"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2019 12:46:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 20 Jul 2019 21:45:31 +0200
Message-Id: <20190720194532.23682-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720194532.23682-1-cezary.rojewski@intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 4/5] ASoC: Intel: Skylake: Align with updated
	request-reply model
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is struct sst_ipc_message instance representing request and reply
each, and params: header, data and size need no longer to be declared
explicitly. Align with that model.

Update reply processing function to save RX header within message
container.

Despite the range of changes, status quo is achieved.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/cnl-sst.c     |   6 +-
 sound/soc/intel/skylake/skl-sst-ipc.c | 110 ++++++++++++++++----------
 2 files changed, 70 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 2d748a335bcf..4f64f097e9ae 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -366,10 +366,10 @@ static struct sst_dsp_device cnl_dev = {
 
 static void cnl_ipc_tx_msg(struct sst_generic_ipc *ipc, struct ipc_message *msg)
 {
-	struct skl_ipc_header *header = (struct skl_ipc_header *)(&msg->header);
+	struct skl_ipc_header *header = (struct skl_ipc_header *)(&msg->tx.header);
 
-	if (msg->tx_size)
-		sst_dsp_outbox_write(ipc->dsp, msg->tx_data, msg->tx_size);
+	if (msg->tx.size)
+		sst_dsp_outbox_write(ipc->dsp, msg->tx.data, msg->tx.size);
 	sst_dsp_shim_write_unlocked(ipc->dsp, CNL_ADSP_REG_HIPCIDD,
 				    header->extension);
 	sst_dsp_shim_write_unlocked(ipc->dsp, CNL_ADSP_REG_HIPCIDR,
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index ee1493acc9a8..a2b69a02aab2 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -281,7 +281,7 @@ void skl_ipc_tx_data_copy(struct ipc_message *msg, char *tx_data,
 		size_t tx_size)
 {
 	if (tx_size)
-		memcpy(msg->tx_data, tx_data, tx_size);
+		memcpy(msg->tx.data, tx_data, tx_size);
 }
 
 static bool skl_ipc_is_dsp_busy(struct sst_dsp *dsp)
@@ -295,10 +295,10 @@ static bool skl_ipc_is_dsp_busy(struct sst_dsp *dsp)
 /* Lock to be held by caller */
 static void skl_ipc_tx_msg(struct sst_generic_ipc *ipc, struct ipc_message *msg)
 {
-	struct skl_ipc_header *header = (struct skl_ipc_header *)(&msg->header);
+	struct skl_ipc_header *header = (struct skl_ipc_header *)(&msg->tx.header);
 
-	if (msg->tx_size)
-		sst_dsp_outbox_write(ipc->dsp, msg->tx_data, msg->tx_size);
+	if (msg->tx.size)
+		sst_dsp_outbox_write(ipc->dsp, msg->tx.data, msg->tx.size);
 	sst_dsp_shim_write_unlocked(ipc->dsp, SKL_ADSP_REG_HIPCIE,
 						header->extension);
 	sst_dsp_shim_write_unlocked(ipc->dsp, SKL_ADSP_REG_HIPCI,
@@ -447,11 +447,12 @@ void skl_ipc_process_reply(struct sst_generic_ipc *ipc,
 		return;
 	}
 
+	msg->rx.header = *ipc_header;
 	/* first process the header */
 	if (reply == IPC_GLB_REPLY_SUCCESS) {
 		dev_dbg(ipc->dev, "ipc FW reply %x: success\n", header.primary);
 		/* copy the rx data from the mailbox */
-		sst_dsp_inbox_read(ipc->dsp, msg->rx_data, msg->rx_size);
+		sst_dsp_inbox_read(ipc->dsp, msg->rx.data, msg->rx.size);
 		switch (IPC_GLB_NOTIFY_MSG_TYPE(header.primary)) {
 		case IPC_GLB_LOAD_MULTIPLE_MODS:
 		case IPC_GLB_LOAD_LIBRARY:
@@ -635,7 +636,7 @@ int skl_ipc_create_pipeline(struct sst_generic_ipc *ipc,
 		u16 ppl_mem_size, u8 ppl_type, u8 instance_id, u8 lp_mode)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -646,9 +647,10 @@ int skl_ipc_create_pipeline(struct sst_generic_ipc *ipc,
 	header.primary |= IPC_PPL_MEM_SIZE(ppl_mem_size);
 
 	header.extension = IPC_PPL_LP_MODE(lp_mode);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s header=%d\n", __func__, header.primary);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: create pipeline fail, err: %d\n", ret);
 		return ret;
@@ -661,16 +663,17 @@ EXPORT_SYMBOL_GPL(skl_ipc_create_pipeline);
 int skl_ipc_delete_pipeline(struct sst_generic_ipc *ipc, u8 instance_id)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_DELETE_PPL);
 	header.primary |= IPC_INSTANCE_ID(instance_id);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s header=%d\n", __func__, header.primary);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: delete pipeline failed, err %d\n", ret);
 		return ret;
@@ -684,7 +687,7 @@ int skl_ipc_set_pipeline_state(struct sst_generic_ipc *ipc,
 		u8 instance_id, enum skl_ipc_pipeline_state state)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -692,9 +695,10 @@ int skl_ipc_set_pipeline_state(struct sst_generic_ipc *ipc,
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_SET_PPL_STATE);
 	header.primary |= IPC_INSTANCE_ID(instance_id);
 	header.primary |= IPC_PPL_STATE(state);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s header=%d\n", __func__, header.primary);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: set pipeline state failed, err: %d\n", ret);
 		return ret;
@@ -707,7 +711,7 @@ int
 skl_ipc_save_pipeline(struct sst_generic_ipc *ipc, u8 instance_id, int dma_id)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -716,8 +720,10 @@ skl_ipc_save_pipeline(struct sst_generic_ipc *ipc, u8 instance_id, int dma_id)
 	header.primary |= IPC_INSTANCE_ID(instance_id);
 
 	header.extension = IPC_DMA_ID(dma_id);
+	request.header = *(u64 *)(&header);
+
 	dev_dbg(ipc->dev, "In %s header=%d\n", __func__, header.primary);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: save pipeline failed, err: %d\n", ret);
 		return ret;
@@ -730,16 +736,17 @@ EXPORT_SYMBOL_GPL(skl_ipc_save_pipeline);
 int skl_ipc_restore_pipeline(struct sst_generic_ipc *ipc, u8 instance_id)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_RESTORE_PPL);
 	header.primary |= IPC_INSTANCE_ID(instance_id);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s header=%d\n", __func__, header.primary);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: restore  pipeline failed, err: %d\n", ret);
 		return ret;
@@ -753,7 +760,7 @@ int skl_ipc_set_dx(struct sst_generic_ipc *ipc, u8 instance_id,
 		u16 module_id, struct skl_ipc_dxstate_info *dx)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request;
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
@@ -762,10 +769,13 @@ int skl_ipc_set_dx(struct sst_generic_ipc *ipc, u8 instance_id,
 	header.primary |= IPC_MOD_INSTANCE_ID(instance_id);
 	header.primary |= IPC_MOD_ID(module_id);
 
+	request.header = *(u64 *)(&header);
+	request.data = dx;
+	request.size = sizeof(*dx);
+
 	dev_dbg(ipc->dev, "In %s primary =%x ext=%x\n", __func__,
 			 header.primary, header.extension);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header,
-				dx, sizeof(*dx), NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: set dx failed, err %d\n", ret);
 		return ret;
@@ -779,7 +789,7 @@ int skl_ipc_init_instance(struct sst_generic_ipc *ipc,
 		struct skl_ipc_init_instance_msg *msg, void *param_data)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request;
 	int ret;
 	u32 *buffer = (u32 *)param_data;
 	 /* param_block_size must be in dwords */
@@ -799,10 +809,13 @@ int skl_ipc_init_instance(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_PARAM_BLOCK_SIZE(param_block_size);
 	header.extension |= IPC_DOMAIN(msg->domain);
 
+	request.header = *(u64 *)(&header);
+	request.data = param_data;
+	request.size = msg->param_data_size;
+
 	dev_dbg(ipc->dev, "In %s primary =%x ext=%x\n", __func__,
 			 header.primary, header.extension);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, param_data,
-			msg->param_data_size, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: init instance failed\n");
@@ -817,7 +830,7 @@ int skl_ipc_bind_unbind(struct sst_generic_ipc *ipc,
 		struct skl_ipc_bind_unbind_msg *msg)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	u8 bind_unbind = msg->bind ? IPC_MOD_BIND : IPC_MOD_UNBIND;
 	int ret;
 
@@ -831,10 +844,11 @@ int skl_ipc_bind_unbind(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_DST_MOD_INSTANCE_ID(msg->dst_instance_id);
 	header.extension |= IPC_DST_QUEUE(msg->dst_queue);
 	header.extension |= IPC_SRC_QUEUE(msg->src_queue);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s hdr=%x ext=%x\n", __func__, header.primary,
 			 header.extension);
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(ipc->dev, "ipc: bind/unbind failed\n");
 		return ret;
@@ -854,7 +868,7 @@ int skl_ipc_load_modules(struct sst_generic_ipc *ipc,
 				u8 module_cnt, void *data)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request;
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -862,8 +876,11 @@ int skl_ipc_load_modules(struct sst_generic_ipc *ipc,
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_LOAD_MULTIPLE_MODS);
 	header.primary |= IPC_LOAD_MODULE_CNT(module_cnt);
 
-	ret = sst_ipc_tx_message_nowait(ipc, *ipc_header, data,
-				(sizeof(u16) * module_cnt));
+	request.header = *(u64 *)(&header);
+	request.data = data;
+	request.size = sizeof(u16) * module_cnt;
+
+	ret = sst_ipc_tx_message_nowait(ipc, request);
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: load modules failed :%d\n", ret);
 
@@ -875,7 +892,7 @@ int skl_ipc_unload_modules(struct sst_generic_ipc *ipc, u8 module_cnt,
 							void *data)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request;
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -883,8 +900,11 @@ int skl_ipc_unload_modules(struct sst_generic_ipc *ipc, u8 module_cnt,
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_UNLOAD_MULTIPLE_MODS);
 	header.primary |= IPC_LOAD_MODULE_CNT(module_cnt);
 
-	ret = sst_ipc_tx_message_wait(ipc, *ipc_header, data,
-				(sizeof(u16) * module_cnt), NULL, 0);
+	request.header = *(u64 *)(&header);
+	request.data = data;
+	request.size = sizeof(u16) * module_cnt;
+
+	ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: unload modules failed :%d\n", ret);
 
@@ -896,7 +916,7 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 		struct skl_ipc_large_config_msg *msg, u32 *param)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request;
 	int ret = 0;
 	size_t sz_remaining, tx_size, data_offset;
 
@@ -923,9 +943,11 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 			header.primary, header.extension);
 		dev_dbg(ipc->dev, "transmitting offset: %#x, size: %#x\n",
 			(unsigned)data_offset, (unsigned)tx_size);
-		ret = sst_ipc_tx_message_wait(ipc, *ipc_header,
-					  ((char *)param) + data_offset,
-					  tx_size, NULL, 0);
+
+		request.header = *(u64 *)(&header);
+		request.data = ((char *)param) + data_offset;
+		request.size = tx_size;
+		ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 		if (ret < 0) {
 			dev_err(ipc->dev,
 				"ipc: set large config fail, err: %d\n", ret);
@@ -950,7 +972,7 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 		struct skl_ipc_large_config_msg *msg, u32 *param)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0}, reply = {0};
 	int ret = 0;
 	size_t sz_remaining, rx_size, data_offset;
 
@@ -974,9 +996,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 		if (rx_size == sz_remaining)
 			header.extension |= IPC_FINAL_BLOCK(1);
 
-		ret = sst_ipc_tx_message_wait(ipc, *ipc_header, NULL, 0,
-					      ((char *)param) + data_offset,
-					      msg->param_data_size);
+		request.header = *(u64 *)(&header);
+		reply.data = ((char *)param) + data_offset;
+		reply.size = msg->param_data_size;
+		ret = sst_ipc_tx_message_wait(ipc, request, &reply);
 		if (ret < 0) {
 			dev_err(ipc->dev,
 				"ipc: get large config fail, err: %d\n", ret);
@@ -1001,7 +1024,7 @@ int skl_sst_ipc_load_library(struct sst_generic_ipc *ipc,
 				u8 dma_id, u8 table_id, bool wait)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret = 0;
 
 	header.primary = IPC_MSG_TARGET(IPC_FW_GEN_MSG);
@@ -1009,12 +1032,12 @@ int skl_sst_ipc_load_library(struct sst_generic_ipc *ipc,
 	header.primary |= IPC_GLB_TYPE(IPC_GLB_LOAD_LIBRARY);
 	header.primary |= IPC_MOD_INSTANCE_ID(table_id);
 	header.primary |= IPC_MOD_ID(dma_id);
+	request.header = *(u64 *)(&header);
 
 	if (wait)
-		ret = sst_ipc_tx_message_wait(ipc, *ipc_header,
-					NULL, 0, NULL, 0);
+		ret = sst_ipc_tx_message_wait(ipc, request, NULL);
 	else
-		ret = sst_ipc_tx_message_nowait(ipc, *ipc_header, NULL, 0);
+		ret = sst_ipc_tx_message_nowait(ipc, request);
 
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: load lib failed\n");
@@ -1026,7 +1049,7 @@ EXPORT_SYMBOL_GPL(skl_sst_ipc_load_library);
 int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc, struct skl_ipc_d0ix_msg *msg)
 {
 	struct skl_ipc_header header = {0};
-	u64 *ipc_header = (u64 *)(&header);
+	struct sst_ipc_message request = {0};
 	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
@@ -1037,6 +1060,7 @@ int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc, struct skl_ipc_d0ix_msg *msg)
 
 	header.extension = IPC_D0IX_WAKE(msg->wake);
 	header.extension |= IPC_D0IX_STREAMING(msg->streaming);
+	request.header = *(u64 *)(&header);
 
 	dev_dbg(ipc->dev, "In %s primary=%x ext=%x\n", __func__,
 			header.primary,	header.extension);
@@ -1044,7 +1068,7 @@ int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc, struct skl_ipc_d0ix_msg *msg)
 	/*
 	 * Use the nopm IPC here as we dont want it checking for D0iX
 	 */
-	ret = sst_ipc_tx_message_nopm(ipc, *ipc_header, NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_nopm(ipc, request, NULL);
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: set d0ix failed, err %d\n", ret);
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
