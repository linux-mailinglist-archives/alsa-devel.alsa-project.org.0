Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B624CF75
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B60E1694;
	Fri, 21 Aug 2020 09:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B60E1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995556;
	bh=epR7CdKBZXBADdEE9REyiu7QqwCEY2gX6F329SgrVwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H00Y2I484OV5rgE6PE4uO3JiEK9k2aYGgPvbkeDCasfa6hwzLD08aVMU/WmFH5kwG
	 3PbQHZKto4cIV9SVVCecAuNuMVc8kkp1PnQnkBEE+i8Da4ILpT7CbUUMt3WeSbljez
	 Ci27Q011aGcGVXIs86aPZVLpa5WvIUp7LGwz0zsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B439BF80337;
	Fri, 21 Aug 2020 09:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC862F802DD; Fri, 21 Aug 2020 09:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A3C1F802C2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A3C1F802C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FcD/Hq7E"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aWbF0+gK"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B246B880;
 Fri, 21 Aug 2020 03:31:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=k7p0I/ezfZWct
 IEf1zoQCaRp1KXbmMCKv61+Y5rS6fc=; b=FcD/Hq7Ee75//GOkmL+Up0Yc+pdsv
 rXVFBrH81I+oGDOpvB4IYwA9bxhMkMcDNLSQ71iaxrnMeGD/kWrbkmWruz+PnlcF
 yxKNOFXFozbw4cTCM6kH7GVzI/Xhn/aZTSiRnomvu0A+Sok/CbI4pRbQEwv33hVI
 IvBmwN45e9xmdLaqyAGjwqzt0IZiRTtMF7aSskjWn014H0kL7ni9DfDDGaRIvtra
 /ISqVMahrD6enMj0azOGmGHpOrsxImfDAyI6wCOT2cCOfW+6eEn+6V835p9pGv1M
 UmHorCDu6HD2oVjO6mPG+weAPvcN2FZgKish05Z23QI2zshUOxm9KLEtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=k7p0I/ezfZWctIEf1zoQCaRp1KXbmMCKv61+Y5rS6fc=; b=aWbF0+gK
 w6Csdq7E/2Sv44fENXkRpzDI8mFiZxUAnfmWvfdIsLB2IYxPFQfHKOP5sOqb+fqa
 cmxsn6XUxGoOXFsvvhOH+1vkdMl8oNj6IwoCkpa3JhRfycYe+hCF1E/vYQRKMUBb
 B5M3JiVqlRTSZ11xDhbViNQsqCHyfJDsXJchkJMGmtq5rvzrFHUOjTYpXc6O/Rm9
 9OjHLJ2/RPbPzZL1giBTynjTQgNcbyWmQ+grBNLMuuuH5FcNWMDncabfC7oS1MNu
 0ZoVeWnrzdVruTfSz6qy4FrxxaTCYiy+bA5djc+n3k8q+UIf5jOUPN/lbfK40Hon
 fEuEGQmYIbVjZQ==
X-ME-Sender: <xms:U3g_X3TzlSrNHJpVA00EgaFZN1FyDx1HqFro5cB-Fj3YsCBfqQLVLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:U3g_X4z8eCnPSSxsdQdNXpXaZ4RydenqUp202Wsp8P3DxriawwkKdg>
 <xmx:U3g_X82n2Ytx4cAgI-wzjYEmOm2YRRAg9Frl0zuJFGj6G5depF6tpQ>
 <xmx:U3g_X3AMTtQYG8QUjBE3_-EsYccZbf2uh4SdrweyxP8tEafJjM6oFA>
 <xmx:U3g_X8Y1UE-AWLkpbzzFbWX6JSG2SMGqbte1IEdA5RfS7lczObASew>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D2D630600B7;
 Fri, 21 Aug 2020 03:31:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 09/25] efw-downloader: efw-proto: add function to finish a
 pair of transactions
Date: Fri, 21 Aug 2020 16:30:55 +0900
Message-Id: <20200821073111.134857-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
References: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

In Fireworks protocol, the target device increments sequence number in
command frame transferred by software, then transfers response frame
with the number so that software can correspond the response frame to
the command frame.

This commit adds function to finish the pair of transactions for command
and response frames. The frames are matched according to sequence number.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/efw-proto.c | 146 +++++++++++++++++++++++++++++++++
 efw-downloader/src/efw-proto.h |   9 ++
 2 files changed, 155 insertions(+)

diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index cb8dad1..f8c1d88 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -27,6 +27,15 @@ struct _EfwProtoPrivate {
 };
 G_DEFINE_TYPE_WITH_PRIVATE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
 
+/**
+ * efw_proto_error_quark:
+ *
+ * Return the GQuark for error domain of GError which has code in #HinawaSndEfwStatus.
+ *
+ * Returns: A #GQuark.
+ */
+G_DEFINE_QUARK(efw-proto-error-quark, efw_proto_error)
+
 #define EFW_CMD_ADDR            0xecc000000000ull
 #define EFW_RESP_ADDR           0xecc080000000ull
 #define EFW_MAX_FRAME_SIZE      0x200u
@@ -217,6 +226,143 @@ void efw_proto_command(EfwProto *self, guint category, guint command,
     g_free(frame);
 }
 
+struct waiter {
+    guint32 seqnum;
+
+    guint32 category;
+    guint32 command;
+    HinawaSndEfwStatus status;
+    guint32 *params;
+    gsize param_count;
+
+    GCond cond;
+    GMutex mutex;
+};
+
+static void handle_responded_signal(EfwProto *self, HinawaSndEfwStatus status, guint32 seqnum,
+                    guint category, guint command,
+                    const guint32 *params, guint32 param_count, gpointer user_data)
+{
+    struct waiter *w = (struct waiter *)user_data;
+
+    if (seqnum == w->seqnum) {
+        g_mutex_lock(&w->mutex);
+
+        if (category != w->category || command != w->command)
+            status = HINAWA_SND_EFW_STATUS_BAD;
+        w->status = status;
+
+        if (param_count > 0 && param_count <= w->param_count)
+            memcpy(w->params, params, param_count * sizeof(*params));
+        w->param_count = param_count;
+
+        g_cond_signal(&w->cond);
+
+        g_mutex_unlock(&w->mutex);
+    }
+}
+
+static const char *const err_msgs[] = {
+    [HINAWA_SND_EFW_STATUS_OK]              = "The transaction finishes successfully",
+    [HINAWA_SND_EFW_STATUS_BAD]             = "The request or response includes invalid header",
+    [HINAWA_SND_EFW_STATUS_BAD_COMMAND]     = "The request includes invalid category or command",
+    [HINAWA_SND_EFW_STATUS_COMM_ERR]        = "The transaction fails due to communication error",
+    [HINAWA_SND_EFW_STATUS_BAD_QUAD_COUNT]  = "The number of quadlets in transaction is invalid",
+    [HINAWA_SND_EFW_STATUS_UNSUPPORTED]     = "The request is not supported",
+    [HINAWA_SND_EFW_STATUS_TIMEOUT]         = "The transaction is canceled due to response timeout",
+    [HINAWA_SND_EFW_STATUS_DSP_TIMEOUT]     = "The operation for DSP did not finish within timeout",
+    [HINAWA_SND_EFW_STATUS_BAD_RATE]        = "The request includes invalid value for sampling frequency",
+    [HINAWA_SND_EFW_STATUS_BAD_CLOCK]       = "The request includes invalid value for source of clock",
+    [HINAWA_SND_EFW_STATUS_BAD_CHANNEL]     = "The request includes invalid value for the number of channel",
+    [HINAWA_SND_EFW_STATUS_BAD_PAN]         = "The request includes invalid value for panning",
+    [HINAWA_SND_EFW_STATUS_FLASH_BUSY]      = "The on-board flash is busy and not operable",
+    [HINAWA_SND_EFW_STATUS_BAD_MIRROR]      = "The request includes invalid value for mirroring channel",
+    [HINAWA_SND_EFW_STATUS_BAD_LED]         = "The request includes invalid value for LED",
+    [HINAWA_SND_EFW_STATUS_BAD_PARAMETER]   = "The request includes invalid value of parameter",
+    [HINAWA_SND_EFW_STATUS_LARGE_RESP]      = "The size of response is larger than expected",
+};
+
+#define generate_error(error, code) \
+    g_set_error_literal(error, EFW_PROTO_ERROR, code, err_msgs[code])
+
+/**
+ * efw_proto_transaction:
+ * @self: A #EfwProto.
+ * @category: One of category for the transaction.
+ * @command: One of category for the transaction.
+ * @args: (array length=arg_count)(nullable): An array with elements for quadlet data as arguments
+ *        for command.
+ * @arg_count: The number of quadlets in the args array.
+ * @params: (array length=param_count)(inout)(nullable): An array with elements for quadlet data to
+ *          save parameters in response frame.
+ * @param_count: The number of quadlets in the params array.
+ * @timeout_ms: The timeout to wait for response of the transaction since request is initiated, in
+ *              milliseconds.
+ * @error: A #GError. Error can be generated with two domains of #hinawa_fw_node_error_quark(),
+ *         #hinawa_fw_req_error_quark(), and #efw_proto_error_quark().
+ *
+ * Transfer asynchronous transaction for command frame of Fireworks protocol. When receiving
+ * asynchronous transaction for response frame, #EfwProto::responded GObject signal is emitted.
+ */
+void efw_proto_transaction(EfwProto *self, guint category, guint command,
+                           const guint32 *args, gsize arg_count,
+                           guint32 *const *params, gsize *param_count,
+                           guint timeout_ms, GError **error)
+{
+    gulong handler_id;
+    struct waiter w;
+    guint64 expiration;
+
+    g_return_if_fail(EFW_IS_PROTO(self));
+    g_return_if_fail(param_count != NULL);
+    g_return_if_fail(error == NULL || *error == NULL);
+
+    // This predicates against suprious wakeup.
+    w.status = 0xffffffff;
+    w.category = category;
+    w.command = command;
+    if (*param_count > 0)
+        w.params = *params;
+    else
+        w.params = NULL;
+    w.param_count = *param_count;
+    g_cond_init(&w.cond);
+    g_mutex_init(&w.mutex);
+
+    handler_id = g_signal_connect(self, "responded", (GCallback)handle_responded_signal, &w);
+
+    // Timeout is set in advance as a parameter of this object.
+    expiration = g_get_monotonic_time() + timeout_ms * G_TIME_SPAN_MILLISECOND;
+
+    efw_proto_command(self, category, command, args, arg_count, &w.seqnum, error);
+    if (*error != NULL) {
+        g_signal_handler_disconnect(self, handler_id);
+        goto end;
+    }
+
+    g_mutex_lock(&w.mutex);
+    while (w.status == 0xffffffff) {
+        // Wait for a response with timeout, waken by the response handler.
+        if (!g_cond_wait_until(&w.cond, &w.mutex, expiration))
+            break;
+    }
+    g_signal_handler_disconnect(self, handler_id);
+    g_mutex_unlock(&w.mutex);
+
+    if (w.status == 0xffffffff)
+        generate_error(error, HINAWA_SND_EFW_STATUS_TIMEOUT);
+    else if (w.status != HINAWA_SND_EFW_STATUS_OK)
+        generate_error(error, w.status);
+    else if (w.param_count > *param_count)
+        generate_error(error, HINAWA_SND_EFW_STATUS_LARGE_RESP);
+    else
+        *param_count = w.param_count;
+end:
+    g_cond_clear(&w.cond);
+    g_mutex_clear(&w.mutex);
+}
+
+
 static HinawaFwRcode proto_handle_response(HinawaFwResp *resp, HinawaFwTcode tcode)
 {
     EfwProto *self = EFW_PROTO(resp);
diff --git a/efw-downloader/src/efw-proto.h b/efw-downloader/src/efw-proto.h
index 94f4a94..0b700a8 100644
--- a/efw-downloader/src/efw-proto.h
+++ b/efw-downloader/src/efw-proto.h
@@ -57,6 +57,10 @@ struct _EfwProtoClass {
                       guint category, guint command, const guint32 *frame, guint frame_size);
 };
 
+#define EFW_PROTO_ERROR     efw_proto_error_quark()
+
+GQuark efw_proto_error_quark();
+
 EfwProto *efw_proto_new();
 
 void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error);
@@ -66,6 +70,11 @@ void efw_proto_command(EfwProto *self, guint category, guint command,
                        const guint32 *args, gsize arg_count, guint32 *resp_seqnum,
                        GError **exception);
 
+void efw_proto_transaction(EfwProto *self, guint category, guint command,
+                           const guint32 *args, gsize arg_count,
+                           guint32 *const *params, gsize *param_count,
+                           guint timeout_ms, GError **error);
+
 G_END_DECLS
 
 #endif
-- 
2.25.1

