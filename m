Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C36F085
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 21:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C97216E6;
	Sat, 20 Jul 2019 21:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C97216E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563652162;
	bh=QhMR/QyH4+xlVXVF3WNcKV4T0QCLhxFCxb13QHckUbE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZfSJfj9jM84Ph/jnsJNlO7U47FuhdLIoA/3p0BgN/EE7PzNih3qIX3jweojwJf/M
	 LQVUbKXXQ2EKGYZqnSEVQkK32AGQATFLl07+vx5dHk1ZcK4JQ+73nuDNUssWpSTXtE
	 nYx9aU6kz01cBIxetI2u2hwRygmHJCfNZTuhCmBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE951F80440;
	Sat, 20 Jul 2019 21:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77DC1F803D5; Sat, 20 Jul 2019 21:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6C1F802BC
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 21:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6C1F802BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 12:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="176592948"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2019 12:46:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 20 Jul 2019 21:45:30 +0200
Message-Id: <20190720194532.23682-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720194532.23682-1-cezary.rojewski@intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 3/5] ASoC: Intel: Baytrail: Align with updated
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
 sound/soc/intel/baytrail/sst-baytrail-ipc.c | 65 ++++++++++-----------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-ipc.c b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
index 8bd1eddcc091..74274bd38f7a 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-ipc.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
@@ -211,7 +211,7 @@ static struct sst_byt_stream *sst_byt_get_stream(struct sst_byt *byt,
 static void sst_byt_stream_update(struct sst_byt *byt, struct ipc_message *msg)
 {
 	struct sst_byt_stream *stream;
-	u64 header = msg->header;
+	u64 header = msg->tx.header;
 	u8 stream_id = sst_byt_header_str_id(header);
 	u8 stream_msg = sst_byt_header_msg_id(header);
 
@@ -240,9 +240,10 @@ static int sst_byt_process_reply(struct sst_byt *byt, u64 header)
 	if (msg == NULL)
 		return 1;
 
+	msg->rx.header = header;
 	if (header & IPC_HEADER_LARGE(true)) {
-		msg->rx_size = sst_byt_header_data(header);
-		sst_dsp_inbox_read(byt->dsp, msg->rx_data, msg->rx_size);
+		msg->rx.size = sst_byt_header_data(header);
+		sst_dsp_inbox_read(byt->dsp, msg->rx.data, msg->rx.size);
 	}
 
 	/* update any stream states */
@@ -407,17 +408,18 @@ int sst_byt_stream_buffer(struct sst_byt *byt, struct sst_byt_stream *stream,
 
 int sst_byt_stream_commit(struct sst_byt *byt, struct sst_byt_stream *stream)
 {
-	struct sst_byt_alloc_params *str_req = &stream->request;
-	struct sst_byt_alloc_response *reply = &stream->reply;
-	u64 header;
+	struct sst_ipc_message request, reply = {0};
 	int ret;
 
-	header = sst_byt_header(IPC_IA_ALLOC_STREAM,
-				sizeof(*str_req) + sizeof(u32),
+	request.header = sst_byt_header(IPC_IA_ALLOC_STREAM,
+				sizeof(stream->request) + sizeof(u32),
 				true, stream->str_id);
-	ret = sst_ipc_tx_message_wait(&byt->ipc, header, str_req,
-				      sizeof(*str_req),
-				      reply, sizeof(*reply));
+	request.data = &stream->request;
+	request.size = sizeof(stream->request);
+	reply.data = &stream->reply;
+	reply.size = sizeof(stream->reply);
+
+	ret = sst_ipc_tx_message_wait(&byt->ipc, request, &reply);
 	if (ret < 0) {
 		dev_err(byt->dev, "ipc: error stream commit failed\n");
 		return ret;
@@ -430,7 +432,7 @@ int sst_byt_stream_commit(struct sst_byt *byt, struct sst_byt_stream *stream)
 
 int sst_byt_stream_free(struct sst_byt *byt, struct sst_byt_stream *stream)
 {
-	u64 header;
+	struct sst_ipc_message request = {0};
 	int ret = 0;
 	struct sst_dsp *sst = byt->dsp;
 	unsigned long flags;
@@ -438,8 +440,9 @@ int sst_byt_stream_free(struct sst_byt *byt, struct sst_byt_stream *stream)
 	if (!stream->commited)
 		goto out;
 
-	header = sst_byt_header(IPC_IA_FREE_STREAM, 0, false, stream->str_id);
-	ret = sst_ipc_tx_message_wait(&byt->ipc, header, NULL, 0, NULL, 0);
+	request.header = sst_byt_header(IPC_IA_FREE_STREAM,
+			0, false, stream->str_id);
+	ret = sst_ipc_tx_message_wait(&byt->ipc, request, NULL);
 	if (ret < 0) {
 		dev_err(byt->dev, "ipc: free stream %d failed\n",
 			stream->str_id);
@@ -459,15 +462,13 @@ int sst_byt_stream_free(struct sst_byt *byt, struct sst_byt_stream *stream)
 static int sst_byt_stream_operations(struct sst_byt *byt, int type,
 				     int stream_id, int wait)
 {
-	u64 header;
+	struct sst_ipc_message request = {0};
 
-	header = sst_byt_header(type, 0, false, stream_id);
+	request.header = sst_byt_header(type, 0, false, stream_id);
 	if (wait)
-		return sst_ipc_tx_message_wait(&byt->ipc, header, NULL,
-						0, NULL, 0);
+		return sst_ipc_tx_message_wait(&byt->ipc, request, NULL);
 	else
-		return sst_ipc_tx_message_nowait(&byt->ipc, header,
-						NULL, 0);
+		return sst_ipc_tx_message_nowait(&byt->ipc, request);
 }
 
 /* stream ALSA trigger operations */
@@ -475,19 +476,17 @@ int sst_byt_stream_start(struct sst_byt *byt, struct sst_byt_stream *stream,
 			 u32 start_offset)
 {
 	struct sst_byt_start_stream_params start_stream;
-	void *tx_msg;
-	size_t size;
-	u64 header;
+	struct sst_ipc_message request;
 	int ret;
 
 	start_stream.byte_offset = start_offset;
-	header = sst_byt_header(IPC_IA_START_STREAM,
+	request.header = sst_byt_header(IPC_IA_START_STREAM,
 				sizeof(start_stream) + sizeof(u32),
 				true, stream->str_id);
-	tx_msg = &start_stream;
-	size = sizeof(start_stream);
+	request.data = &start_stream;
+	request.size = sizeof(start_stream);
 
-	ret = sst_ipc_tx_message_nowait(&byt->ipc, header, tx_msg, size);
+	ret = sst_ipc_tx_message_nowait(&byt->ipc, request);
 	if (ret < 0)
 		dev_err(byt->dev, "ipc: error failed to start stream %d\n",
 			stream->str_id);
@@ -623,10 +622,10 @@ EXPORT_SYMBOL_GPL(sst_byt_dsp_wait_for_ready);
 
 static void byt_tx_msg(struct sst_generic_ipc *ipc, struct ipc_message *msg)
 {
-	if (msg->header & IPC_HEADER_LARGE(true))
-		sst_dsp_outbox_write(ipc->dsp, msg->tx_data, msg->tx_size);
+	if (msg->tx.header & IPC_HEADER_LARGE(true))
+		sst_dsp_outbox_write(ipc->dsp, msg->tx.data, msg->tx.size);
 
-	sst_dsp_shim_write64_unlocked(ipc->dsp, SST_IPCX, msg->header);
+	sst_dsp_shim_write64_unlocked(ipc->dsp, SST_IPCX, msg->tx.header);
 }
 
 static void byt_shim_dbg(struct sst_generic_ipc *ipc, const char *text)
@@ -648,9 +647,9 @@ static void byt_tx_data_copy(struct ipc_message *msg, char *tx_data,
 	size_t tx_size)
 {
 	/* msg content = lower 32-bit of the header + data */
-	*(u32 *)msg->tx_data = (u32)(msg->header & (u32)-1);
-	memcpy(msg->tx_data + sizeof(u32), tx_data, tx_size);
-	msg->tx_size += sizeof(u32);
+	*(u32 *)msg->tx.data = (u32)(msg->tx.header & (u32)-1);
+	memcpy(msg->tx.data + sizeof(u32), tx_data, tx_size);
+	msg->tx.size += sizeof(u32);
 }
 
 static u64 byt_reply_msg_match(u64 header, u64 *mask)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
