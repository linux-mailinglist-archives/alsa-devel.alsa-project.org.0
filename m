Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882716F086
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 21:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD2516F2;
	Sat, 20 Jul 2019 21:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD2516F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563652184;
	bh=ZfNBNT7ce9zyEEvcGysYayaTpzhf+WoUS76R5H9HYZ8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDR/Sgq2DHKX8IzvZ2KryEx123rv7SHkKT8vvZEUu9tD0+fDF8P7yUPUz+6brhGzD
	 7grgHVdSvbXpN3AnDw8BWRH4zx9N8+Qjy7y3Put+e9covTK7SVV8iNOTZnxDrl5Qwe
	 AftNK5KrV4Igh1DwdOcxxdqk4UuseB1votlPwxqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B872FF803F3;
	Sat, 20 Jul 2019 21:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C815F803D7; Sat, 20 Jul 2019 21:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF568F80390
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 21:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF568F80390
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 12:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="176592928"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2019 12:46:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 20 Jul 2019 21:45:28 +0200
Message-Id: <20190720194532.23682-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720194532.23682-1-cezary.rojewski@intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 1/5] ASoC: Intel: Update request-reply IPC model
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

struct ipc_message contains fields: header, tx_data and tx_size which
represent TX i.e. request while RX is represented by rx_data and rx_size
with reply's header equivalent missing.

Reply header may contain some vital information including, but not
limited to, received payload size. Some IPCs have entire payload found
within RX header instead. Content and value of said header is context
dependent and may vary between firmware versions and target platform.
Current model does not allow such IPCs to function at all.

Rather than appending yet another parameter to an already long list of
such for sst_ipc_tx_message_XXXs, declare message container in form of
struct sst_ipc_message and add them to parent's ipc_message declaration.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-ipc.c | 69 ++++++++++++++++----------------
 sound/soc/intel/common/sst-ipc.h | 27 +++++++------
 2 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/sound/soc/intel/common/sst-ipc.c b/sound/soc/intel/common/sst-ipc.c
index ef5b66af1cd2..1186a03a88d6 100644
--- a/sound/soc/intel/common/sst-ipc.c
+++ b/sound/soc/intel/common/sst-ipc.c
@@ -43,7 +43,7 @@ static struct ipc_message *msg_get_empty(struct sst_generic_ipc *ipc)
 }
 
 static int tx_wait_done(struct sst_generic_ipc *ipc,
-	struct ipc_message *msg, void *rx_data)
+	struct ipc_message *msg, struct sst_ipc_message *reply)
 {
 	unsigned long flags;
 	int ret;
@@ -62,8 +62,11 @@ static int tx_wait_done(struct sst_generic_ipc *ipc,
 	} else {
 
 		/* copy the data returned from DSP */
-		if (rx_data)
-			memcpy(rx_data, msg->rx_data, msg->rx_size);
+		if (reply) {
+			reply->header = msg->rx.header;
+			if (reply->data)
+				memcpy(reply->data, msg->rx.data, msg->rx.size);
+		}
 		ret = msg->errno;
 	}
 
@@ -72,9 +75,9 @@ static int tx_wait_done(struct sst_generic_ipc *ipc,
 	return ret;
 }
 
-static int ipc_tx_message(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes, void *rx_data,
-	size_t rx_bytes, int wait)
+static int ipc_tx_message(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request,
+	struct sst_ipc_message *reply, int wait)
 {
 	struct ipc_message *msg;
 	unsigned long flags;
@@ -87,23 +90,24 @@ static int ipc_tx_message(struct sst_generic_ipc *ipc, u64 header,
 		return -EBUSY;
 	}
 
-	msg->header = header;
-	msg->tx_size = tx_bytes;
-	msg->rx_size = rx_bytes;
+	msg->tx.header = request.header;
+	msg->tx.size = request.size;
+	msg->rx.header = 0;
+	msg->rx.size = reply ? reply->size : 0;
 	msg->wait = wait;
 	msg->errno = 0;
 	msg->pending = false;
 	msg->complete = false;
 
-	if ((tx_bytes) && (ipc->ops.tx_data_copy != NULL))
-		ipc->ops.tx_data_copy(msg, tx_data, tx_bytes);
+	if ((request.size) && (ipc->ops.tx_data_copy != NULL))
+		ipc->ops.tx_data_copy(msg, request.data, request.size);
 
 	list_add_tail(&msg->list, &ipc->tx_list);
 	schedule_work(&ipc->kwork);
 	spin_unlock_irqrestore(&ipc->dsp->spinlock, flags);
 
 	if (wait)
-		return tx_wait_done(ipc, msg, rx_data);
+		return tx_wait_done(ipc, msg, reply);
 	else
 		return 0;
 }
@@ -118,13 +122,13 @@ static int msg_empty_list_init(struct sst_generic_ipc *ipc)
 		return -ENOMEM;
 
 	for (i = 0; i < IPC_EMPTY_LIST_SIZE; i++) {
-		ipc->msg[i].tx_data = kzalloc(ipc->tx_data_max_size, GFP_KERNEL);
-		if (ipc->msg[i].tx_data == NULL)
+		ipc->msg[i].tx.data = kzalloc(ipc->tx_data_max_size, GFP_KERNEL);
+		if (ipc->msg[i].tx.data == NULL)
 			goto free_mem;
 
-		ipc->msg[i].rx_data = kzalloc(ipc->rx_data_max_size, GFP_KERNEL);
-		if (ipc->msg[i].rx_data == NULL) {
-			kfree(ipc->msg[i].tx_data);
+		ipc->msg[i].rx.data = kzalloc(ipc->rx_data_max_size, GFP_KERNEL);
+		if (ipc->msg[i].rx.data == NULL) {
+			kfree(ipc->msg[i].tx.data);
 			goto free_mem;
 		}
 
@@ -136,8 +140,8 @@ static int msg_empty_list_init(struct sst_generic_ipc *ipc)
 
 free_mem:
 	while (i > 0) {
-		kfree(ipc->msg[i-1].tx_data);
-		kfree(ipc->msg[i-1].rx_data);
+		kfree(ipc->msg[i-1].tx.data);
+		kfree(ipc->msg[i-1].rx.data);
 		--i;
 	}
 	kfree(ipc->msg);
@@ -173,8 +177,8 @@ static void ipc_tx_msgs(struct work_struct *work)
 	spin_unlock_irq(&ipc->dsp->spinlock);
 }
 
-int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes, void *rx_data, size_t rx_bytes)
+int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request, struct sst_ipc_message *reply)
 {
 	int ret;
 
@@ -187,8 +191,7 @@ int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc, u64 header,
 		if (ipc->ops.check_dsp_lp_on(ipc->dsp, true))
 			return -EIO;
 
-	ret = ipc_tx_message(ipc, header, tx_data, tx_bytes,
-		rx_data, rx_bytes, 1);
+	ret = ipc_tx_message(ipc, request, reply, 1);
 
 	if (ipc->ops.check_dsp_lp_on)
 		if (ipc->ops.check_dsp_lp_on(ipc->dsp, false))
@@ -198,19 +201,17 @@ int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc, u64 header,
 }
 EXPORT_SYMBOL_GPL(sst_ipc_tx_message_wait);
 
-int sst_ipc_tx_message_nowait(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes)
+int sst_ipc_tx_message_nowait(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request)
 {
-	return ipc_tx_message(ipc, header, tx_data, tx_bytes,
-		NULL, 0, 0);
+	return ipc_tx_message(ipc, request, NULL, 0);
 }
 EXPORT_SYMBOL_GPL(sst_ipc_tx_message_nowait);
 
-int sst_ipc_tx_message_nopm(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes, void *rx_data, size_t rx_bytes)
+int sst_ipc_tx_message_nopm(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request, struct sst_ipc_message *reply)
 {
-	return ipc_tx_message(ipc, header, tx_data, tx_bytes,
-		rx_data, rx_bytes, 1);
+	return ipc_tx_message(ipc, request, reply, 1);
 }
 EXPORT_SYMBOL_GPL(sst_ipc_tx_message_nopm);
 
@@ -230,7 +231,7 @@ struct ipc_message *sst_ipc_reply_find_msg(struct sst_generic_ipc *ipc,
 	}
 
 	list_for_each_entry(msg, &ipc->rx_list, list) {
-		if ((msg->header & mask) == header)
+		if ((msg->tx.header & mask) == header)
 			return msg;
 	}
 
@@ -304,8 +305,8 @@ void sst_ipc_fini(struct sst_generic_ipc *ipc)
 
 	if (ipc->msg) {
 		for (i = 0; i < IPC_EMPTY_LIST_SIZE; i++) {
-			kfree(ipc->msg[i].tx_data);
-			kfree(ipc->msg[i].rx_data);
+			kfree(ipc->msg[i].tx.data);
+			kfree(ipc->msg[i].rx.data);
 		}
 		kfree(ipc->msg);
 	}
diff --git a/sound/soc/intel/common/sst-ipc.h b/sound/soc/intel/common/sst-ipc.h
index ef38600e88f7..08c4831b2664 100644
--- a/sound/soc/intel/common/sst-ipc.h
+++ b/sound/soc/intel/common/sst-ipc.h
@@ -17,15 +17,16 @@
 
 #define IPC_MAX_MAILBOX_BYTES	256
 
-struct ipc_message {
-	struct list_head list;
+struct sst_ipc_message {
 	u64 header;
+	void *data;
+	size_t size;
+};
 
-	/* direction wrt host CPU */
-	char *tx_data;
-	size_t tx_size;
-	char *rx_data;
-	size_t rx_size;
+struct ipc_message {
+	struct list_head list;
+	struct sst_ipc_message tx;
+	struct sst_ipc_message rx;
 
 	wait_queue_head_t waitq;
 	bool pending;
@@ -66,14 +67,14 @@ struct sst_generic_ipc {
 	struct sst_plat_ipc_ops ops;
 };
 
-int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes, void *rx_data, size_t rx_bytes);
+int sst_ipc_tx_message_wait(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request, struct sst_ipc_message *reply);
 
-int sst_ipc_tx_message_nowait(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes);
+int sst_ipc_tx_message_nowait(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request);
 
-int sst_ipc_tx_message_nopm(struct sst_generic_ipc *ipc, u64 header,
-	void *tx_data, size_t tx_bytes, void *rx_data, size_t rx_bytes);
+int sst_ipc_tx_message_nopm(struct sst_generic_ipc *ipc,
+	struct sst_ipc_message request, struct sst_ipc_message *reply);
 
 struct ipc_message *sst_ipc_reply_find_msg(struct sst_generic_ipc *ipc,
 	u64 header);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
