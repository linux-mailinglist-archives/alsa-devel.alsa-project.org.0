Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3D6F088
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 21:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D2B1704;
	Sat, 20 Jul 2019 21:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D2B1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563652226;
	bh=SLa8VmC6ocL1+j/pzCvJP+9eHpwmFzisO3i9x0Fmn+U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=heAPgO5V1WgrpnL9CT2NVrPsen87RijOqCxyGtZu/Pe2oBigkvfvSk4KPSyZXVMM0
	 vPlbW0tJHdbY5uKA8+vIeisgQNiH6BPGuos0z4Qm/p8rqv5TXLYF6a12G3MW2IItZy
	 0O89lCnJ2H+x39mJ6Eerj5e21MX7Z9f62hM1HLPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED730F80447;
	Sat, 20 Jul 2019 21:47:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3585F80444; Sat, 20 Jul 2019 21:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BCD3F803CF
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 21:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCD3F803CF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 12:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="176592937"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2019 12:46:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 20 Jul 2019 21:45:29 +0200
Message-Id: <20190720194532.23682-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720194532.23682-1-cezary.rojewski@intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 2/5] ASoC: Intel: Haswell: Align with updated
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
 sound/soc/intel/haswell/sst-haswell-ipc.c | 164 ++++++++++++----------
 1 file changed, 88 insertions(+), 76 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index a83b92d6bea8..5c73b11375e3 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -511,7 +511,7 @@ static void hsw_notification_work(struct work_struct *work)
 static void hsw_stream_update(struct sst_hsw *hsw, struct ipc_message *msg)
 {
 	struct sst_hsw_stream *stream;
-	u32 header = msg->header & ~(IPC_STATUS_MASK | IPC_GLB_REPLY_MASK);
+	u32 header = msg->tx.header & ~(IPC_STATUS_MASK | IPC_GLB_REPLY_MASK);
 	u32 stream_id = msg_get_stream_id(header);
 	u32 stream_msg = msg_get_stream_type(header);
 
@@ -552,6 +552,7 @@ static int hsw_process_reply(struct sst_hsw *hsw, u32 header)
 		return -EIO;
 	}
 
+	msg->rx.header = header;
 	/* first process the header */
 	switch (reply) {
 	case IPC_GLB_REPLY_PENDING:
@@ -562,13 +563,13 @@ static int hsw_process_reply(struct sst_hsw *hsw, u32 header)
 	case IPC_GLB_REPLY_SUCCESS:
 		if (msg->pending) {
 			trace_ipc_pending_reply("completed", header);
-			sst_dsp_inbox_read(hsw->dsp, msg->rx_data,
-				msg->rx_size);
+			sst_dsp_inbox_read(hsw->dsp, msg->rx.data,
+				msg->rx.size);
 			hsw->ipc.pending = false;
 		} else {
 			/* copy data from the DSP */
-			sst_dsp_outbox_read(hsw->dsp, msg->rx_data,
-				msg->rx_size);
+			sst_dsp_outbox_read(hsw->dsp, msg->rx.data,
+				msg->rx.size);
 		}
 		break;
 	/* these will be rare - but useful for debug */
@@ -810,11 +811,13 @@ static irqreturn_t hsw_irq_thread(int irq, void *context)
 int sst_hsw_fw_get_version(struct sst_hsw *hsw,
 	struct sst_hsw_ipc_fw_version *version)
 {
+	struct sst_ipc_message request = {0}, reply = {0};
 	int ret;
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc,
-		IPC_GLB_TYPE(IPC_GLB_GET_FW_VERSION),
-		NULL, 0, version, sizeof(*version));
+	request.header = IPC_GLB_TYPE(IPC_GLB_GET_FW_VERSION);
+	reply.data = version;
+	reply.size = sizeof(*version);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, &reply);
 	if (ret < 0)
 		dev_err(hsw->dev, "error: get version failed\n");
 
@@ -840,7 +843,7 @@ int sst_hsw_stream_set_volume(struct sst_hsw *hsw,
 	struct sst_hsw_stream *stream, u32 stage_id, u32 channel, u32 volume)
 {
 	struct sst_hsw_ipc_volume_req *req;
-	u32 header;
+	struct sst_ipc_message request;
 	int ret;
 
 	trace_ipc_request("set stream volume", stream->reply.stream_hw_id);
@@ -848,11 +851,11 @@ int sst_hsw_stream_set_volume(struct sst_hsw *hsw,
 	if (channel >= 2 && channel != SST_HSW_CHANNELS_ALL)
 		return -EINVAL;
 
-	header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE) |
+	request.header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE) |
 		IPC_STR_TYPE(IPC_STR_STAGE_MESSAGE);
-	header |= (stream->reply.stream_hw_id << IPC_STR_ID_SHIFT);
-	header |= (IPC_STG_SET_VOLUME << IPC_STG_TYPE_SHIFT);
-	header |= (stage_id << IPC_STG_ID_SHIFT);
+	request.header |= (stream->reply.stream_hw_id << IPC_STR_ID_SHIFT);
+	request.header |= (IPC_STG_SET_VOLUME << IPC_STG_TYPE_SHIFT);
+	request.header |= (stage_id << IPC_STG_ID_SHIFT);
 
 	req = &stream->vol_req;
 	req->target_volume = volume;
@@ -877,8 +880,9 @@ int sst_hsw_stream_set_volume(struct sst_hsw *hsw,
 		req->channel = channel;
 	}
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, req,
-		sizeof(*req), NULL, 0);
+	request.data = req;
+	request.size = sizeof(*req);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(hsw->dev, "error: set stream volume failed\n");
 		return ret;
@@ -905,7 +909,7 @@ int sst_hsw_mixer_set_volume(struct sst_hsw *hsw, u32 stage_id, u32 channel,
 	u32 volume)
 {
 	struct sst_hsw_ipc_volume_req req;
-	u32 header;
+	struct sst_ipc_message request;
 	int ret;
 
 	trace_ipc_request("set mixer volume", volume);
@@ -933,18 +937,19 @@ int sst_hsw_mixer_set_volume(struct sst_hsw *hsw, u32 stage_id, u32 channel,
 		req.channel = channel;
 	}
 
-	header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE) |
+	request.header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE) |
 		IPC_STR_TYPE(IPC_STR_STAGE_MESSAGE);
-	header |= (hsw->mixer_info.mixer_hw_id << IPC_STR_ID_SHIFT);
-	header |= (IPC_STG_SET_VOLUME << IPC_STG_TYPE_SHIFT);
-	header |= (stage_id << IPC_STG_ID_SHIFT);
+	request.header |= (hsw->mixer_info.mixer_hw_id << IPC_STR_ID_SHIFT);
+	request.header |= (IPC_STG_SET_VOLUME << IPC_STG_TYPE_SHIFT);
+	request.header |= (stage_id << IPC_STG_ID_SHIFT);
 
 	req.curve_duration = hsw->curve_duration;
 	req.curve_type = hsw->curve_type;
 	req.target_volume = volume;
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, &req,
-		sizeof(req), NULL, 0);
+	request.data = &req;
+	request.size = sizeof(req);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(hsw->dev, "error: set mixer volume failed\n");
 		return ret;
@@ -983,7 +988,7 @@ struct sst_hsw_stream *sst_hsw_stream_new(struct sst_hsw *hsw, int id,
 
 int sst_hsw_stream_free(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
 {
-	u32 header;
+	struct sst_ipc_message request;
 	int ret = 0;
 	struct sst_dsp *sst = hsw->dsp;
 	unsigned long flags;
@@ -1000,10 +1005,11 @@ int sst_hsw_stream_free(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
 	trace_ipc_request("stream free", stream->host_id);
 
 	stream->free_req.stream_id = stream->reply.stream_hw_id;
-	header = IPC_GLB_TYPE(IPC_GLB_FREE_STREAM);
+	request.header = IPC_GLB_TYPE(IPC_GLB_FREE_STREAM);
+	request.data = &stream->free_req;
+	request.size = sizeof(stream->free_req);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, &stream->free_req,
-		sizeof(stream->free_req), NULL, 0);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(hsw->dev, "error: free stream %d failed\n",
 			stream->free_req.stream_id);
@@ -1175,9 +1181,7 @@ int sst_hsw_stream_set_module_info(struct sst_hsw *hsw,
 
 int sst_hsw_stream_commit(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
 {
-	struct sst_hsw_ipc_stream_alloc_req *str_req = &stream->request;
-	struct sst_hsw_ipc_stream_alloc_reply *reply = &stream->reply;
-	u32 header;
+	struct sst_ipc_message request, reply = {0};
 	int ret;
 
 	if (!stream) {
@@ -1192,10 +1196,13 @@ int sst_hsw_stream_commit(struct sst_hsw *hsw, struct sst_hsw_stream *stream)
 
 	trace_ipc_request("stream alloc", stream->host_id);
 
-	header = IPC_GLB_TYPE(IPC_GLB_ALLOCATE_STREAM);
+	request.header = IPC_GLB_TYPE(IPC_GLB_ALLOCATE_STREAM);
+	request.data = &stream->request;
+	request.size = sizeof(stream->request);
+	reply.data = &stream->reply;
+	reply.size = sizeof(stream->reply);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, str_req,
-		sizeof(*str_req), reply, sizeof(*reply));
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, &reply);
 	if (ret < 0) {
 		dev_err(hsw->dev, "error: stream commit failed\n");
 		return ret;
@@ -1235,23 +1242,22 @@ void sst_hsw_stream_set_silence_start(struct sst_hsw *hsw,
  ABI to be opaque to client PCM drivers to cope with any future ABI changes */
 int sst_hsw_mixer_get_info(struct sst_hsw *hsw)
 {
-	struct sst_hsw_ipc_stream_info_reply *reply;
-	u32 header;
+	struct sst_ipc_message request = {0}, reply = {0};
 	int ret;
 
-	reply = &hsw->mixer_info;
-	header = IPC_GLB_TYPE(IPC_GLB_GET_MIXER_STREAM_INFO);
+	request.header = IPC_GLB_TYPE(IPC_GLB_GET_MIXER_STREAM_INFO);
+	reply.data = &hsw->mixer_info;
+	reply.size = sizeof(hsw->mixer_info);
 
 	trace_ipc_request("get global mixer info", 0);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, NULL, 0,
-		reply, sizeof(*reply));
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, &reply);
 	if (ret < 0) {
 		dev_err(hsw->dev, "error: get stream info failed\n");
 		return ret;
 	}
 
-	trace_hsw_mixer_info_reply(reply);
+	trace_hsw_mixer_info_reply(&hsw->mixer_info);
 
 	return 0;
 }
@@ -1260,16 +1266,15 @@ int sst_hsw_mixer_get_info(struct sst_hsw *hsw)
 static int sst_hsw_stream_operations(struct sst_hsw *hsw, int type,
 	int stream_id, int wait)
 {
-	u32 header;
+	struct sst_ipc_message request = {0};
 
-	header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE) | IPC_STR_TYPE(type);
-	header |= (stream_id << IPC_STR_ID_SHIFT);
+	request.header = IPC_GLB_TYPE(IPC_GLB_STREAM_MESSAGE);
+	request.header |= IPC_STR_TYPE(type) | (stream_id << IPC_STR_ID_SHIFT);
 
 	if (wait)
-		return sst_ipc_tx_message_wait(&hsw->ipc, header,
-			NULL, 0, NULL, 0);
+		return sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	else
-		return sst_ipc_tx_message_nowait(&hsw->ipc, header, NULL, 0);
+		return sst_ipc_tx_message_nowait(&hsw->ipc, request);
 }
 
 /* Stream ALSA trigger operations */
@@ -1377,8 +1382,8 @@ int sst_hsw_device_set_config(struct sst_hsw *hsw,
 	enum sst_hsw_device_id dev, enum sst_hsw_device_mclk mclk,
 	enum sst_hsw_device_mode mode, u32 clock_divider)
 {
+	struct sst_ipc_message request;
 	struct sst_hsw_ipc_device_config_req config;
-	u32 header;
 	int ret;
 
 	trace_ipc_request("set device config", dev);
@@ -1394,10 +1399,11 @@ int sst_hsw_device_set_config(struct sst_hsw *hsw,
 
 	trace_hsw_device_config_req(&config);
 
-	header = IPC_GLB_TYPE(IPC_GLB_SET_DEVICE_FORMATS);
+	request.header = IPC_GLB_TYPE(IPC_GLB_SET_DEVICE_FORMATS);
+	request.data = &config;
+	request.size = sizeof(config);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, &config,
-		sizeof(config), NULL, 0);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0)
 		dev_err(hsw->dev, "error: set device formats failed\n");
 
@@ -1409,16 +1415,20 @@ EXPORT_SYMBOL_GPL(sst_hsw_device_set_config);
 int sst_hsw_dx_set_state(struct sst_hsw *hsw,
 	enum sst_hsw_dx_state state, struct sst_hsw_ipc_dx_reply *dx)
 {
-	u32 header, state_;
+	struct sst_ipc_message request, reply = {0};
+	u32 state_;
 	int ret, item;
 
-	header = IPC_GLB_TYPE(IPC_GLB_ENTER_DX_STATE);
 	state_ = state;
+	request.header = IPC_GLB_TYPE(IPC_GLB_ENTER_DX_STATE);
+	request.data = &state_;
+	request.size = sizeof(state_);
+	reply.data = dx;
+	reply.size = sizeof(*dx);
 
 	trace_ipc_request("PM enter Dx state", state);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header, &state_,
-		sizeof(state_), dx, sizeof(*dx));
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, &reply);
 	if (ret < 0) {
 		dev_err(hsw->dev, "ipc: error set dx state %d failed\n", state);
 		return ret;
@@ -1878,7 +1888,7 @@ int sst_hsw_module_enable(struct sst_hsw *hsw,
 	u32 module_id, u32 instance_id)
 {
 	int ret;
-	u32 header = 0;
+	struct sst_ipc_message request;
 	struct sst_hsw_ipc_module_config config;
 	struct sst_module *module;
 	struct sst_module_runtime *runtime;
@@ -1907,10 +1917,10 @@ int sst_hsw_module_enable(struct sst_hsw *hsw,
 		return -ENXIO;
 	}
 
-	header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
+	request.header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
 			IPC_MODULE_OPERATION(IPC_MODULE_ENABLE) |
 			IPC_MODULE_ID(module_id);
-	dev_dbg(dev, "module enable header: %x\n", header);
+	dev_dbg(dev, "module enable header: %x\n", (u32)request.header);
 
 	config.map.module_entries_count = 1;
 	config.map.module_entries[0].module_id = module->id;
@@ -1932,8 +1942,9 @@ int sst_hsw_module_enable(struct sst_hsw *hsw,
 		config.scratch_mem.size, config.scratch_mem.offset,
 		config.map.module_entries[0].entry_point);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header,
-			&config, sizeof(config), NULL, 0);
+	request.data = &config;
+	request.size = sizeof(config);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0)
 		dev_err(dev, "ipc: module enable failed - %d\n", ret);
 	else
@@ -1946,7 +1957,7 @@ int sst_hsw_module_disable(struct sst_hsw *hsw,
 	u32 module_id, u32 instance_id)
 {
 	int ret;
-	u32 header;
+	struct sst_ipc_message request = {0};
 	struct sst_module *module;
 	struct device *dev = hsw->dev;
 	struct sst_dsp *dsp = hsw->dsp;
@@ -1967,11 +1978,11 @@ int sst_hsw_module_disable(struct sst_hsw *hsw,
 		return -ENXIO;
 	}
 
-	header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
+	request.header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
 			IPC_MODULE_OPERATION(IPC_MODULE_DISABLE) |
 			IPC_MODULE_ID(module_id);
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header,  NULL, 0, NULL, 0);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0)
 		dev_err(dev, "module disable failed - %d\n", ret);
 	else
@@ -1985,15 +1996,16 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 	u32 param_size, char *param)
 {
 	int ret;
-	u32 header = 0;
-	u32 payload_size = 0, transfer_parameter_size = 0;
+	struct sst_ipc_message request = {0};
+	u32 payload_size = 0;
 	struct sst_hsw_transfer_parameter *parameter;
 	struct device *dev = hsw->dev;
 
-	header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
+	request.header = IPC_GLB_TYPE(IPC_GLB_MODULE_OPERATION) |
 			IPC_MODULE_OPERATION(IPC_MODULE_SET_PARAMETER) |
 			IPC_MODULE_ID(module_id);
-	dev_dbg(dev, "sst_hsw_module_set_param header=%x\n", header);
+	dev_dbg(dev, "sst_hsw_module_set_param header=%x\n",
+			(u32)request.header);
 
 	payload_size = param_size +
 		sizeof(struct sst_hsw_transfer_parameter) -
@@ -2003,14 +2015,14 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 
 	if (payload_size <= SST_HSW_IPC_MAX_SHORT_PARAMETER_SIZE) {
 		/* short parameter, mailbox can contain data */
-		dev_dbg(dev, "transfer parameter size : %d\n",
-			transfer_parameter_size);
+		dev_dbg(dev, "transfer parameter size : %lu\n",
+			request.size);
 
-		transfer_parameter_size = ALIGN(payload_size, 4);
-		dev_dbg(dev, "transfer parameter aligned size : %d\n",
-			transfer_parameter_size);
+		request.size = ALIGN(payload_size, 4);
+		dev_dbg(dev, "transfer parameter aligned size : %lu\n",
+			request.size);
 
-		parameter = kzalloc(transfer_parameter_size, GFP_KERNEL);
+		parameter = kzalloc(request.size, GFP_KERNEL);
 		if (parameter == NULL)
 			return -ENOMEM;
 
@@ -2022,9 +2034,9 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 
 	parameter->parameter_id = parameter_id;
 	parameter->data_size = param_size;
+	request.data = parameter;
 
-	ret = sst_ipc_tx_message_wait(&hsw->ipc, header,
-		parameter, transfer_parameter_size , NULL, 0);
+	ret = sst_ipc_tx_message_wait(&hsw->ipc, request, NULL);
 	if (ret < 0)
 		dev_err(dev, "ipc: module set parameter failed - %d\n", ret);
 
@@ -2041,8 +2053,8 @@ static struct sst_dsp_device hsw_dev = {
 static void hsw_tx_msg(struct sst_generic_ipc *ipc, struct ipc_message *msg)
 {
 	/* send the message */
-	sst_dsp_outbox_write(ipc->dsp, msg->tx_data, msg->tx_size);
-	sst_dsp_ipc_msg_tx(ipc->dsp, msg->header);
+	sst_dsp_outbox_write(ipc->dsp, msg->tx.data, msg->tx.size);
+	sst_dsp_ipc_msg_tx(ipc->dsp, msg->tx.header);
 }
 
 static void hsw_shim_dbg(struct sst_generic_ipc *ipc, const char *text)
@@ -2063,7 +2075,7 @@ static void hsw_shim_dbg(struct sst_generic_ipc *ipc, const char *text)
 static void hsw_tx_data_copy(struct ipc_message *msg, char *tx_data,
 	size_t tx_size)
 {
-	memcpy(msg->tx_data, tx_data, tx_size);
+	memcpy(msg->tx.data, tx_data, tx_size);
 }
 
 static u64 hsw_reply_msg_match(u64 header, u64 *mask)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
