Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CC24CF64
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9BD169C;
	Fri, 21 Aug 2020 09:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9BD169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995457;
	bh=B11VIHrx2Cr0vmED2Icrqgcvqnif5YeQqF5gQGwUscc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scfnFyxY9zcNY9CiSMf4ztWBZAeA6pXXQABM7gnvKpNhlnxSuv0IJrNu8SSzeRJyz
	 CUWC8B9crJzvCM9pUCuW4QJXc5jzvnzXbsCzFWAhgEex5zHmv1mnZWkZFkHYJ85oN1
	 jdP1VPvXyeS1vSZPrvPApZGTMvRZH8OIRdcPs5DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 506FDF80323;
	Fri, 21 Aug 2020 09:32:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC47F80303; Fri, 21 Aug 2020 09:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F14FCF80257
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F14FCF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OZYl7xPq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="usRBNots"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 2AB66353;
 Fri, 21 Aug 2020 03:31:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Esvn1uBkEGqFy
 4AR844sK6dGLVtVJaEX7qo7Vmz95ig=; b=OZYl7xPqAqFBIW1GJ1VyHwcz9JMZd
 CxLpOHtXo/KubAQV7Apq2/ImqWeWfKJlBdZi1QwIw7hB+M50KstuPdll51H2ZLCM
 jwYp2Q2avrWgQvQlzc9OpJJ3u99FoNJ7WwIu8JnNj4bc/gE+wjQ7KxE9l9dws9kH
 9nwvde+S2BRbWxxNA6F1++q3gtruMB9km44KBXtpRWFmB1ZG/aPWsYuX6KVYUxrm
 +hGo6Gy8n5oBDn0JasTSSraw0wi6JK1CiXV8B/Rg/KAgIHr66kiCQIYAzqPXSUGe
 QZvsy51/sykQxVTcrwsgyBBVDet+QYNxF9uGxP0z6M/BByzTy6xczjaXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Esvn1uBkEGqFy4AR844sK6dGLVtVJaEX7qo7Vmz95ig=; b=usRBNots
 7lMuBJi9+vLH5w6KOr/JKiAy76tHxOBzmXs65MeJvOPM7L3TV+HeaCpVI1aA6b5q
 vGQKdxMInfQSvzk0r85xTGxOMLEuzsoANltogt1iOSRVhWV0rPI+jEnL1QO5bCft
 wCp11piOnZ9aPCzSrd/1ATyV001JJxCSjf3ei/WgcTTDZWCVFvL1xWop7XSDWiST
 wxkY0xPOJlUmm3KrzozzHvxzJn9aAJpNCwPXMDevKQu4ruHdj1AOVryg0ZN+xrdz
 TEilEAZwRndlp9DY3ro64HaGygn1gBlEIY51XssZVf21x7Vxir9qprBnYYXV0Nhn
 ZjPLhH0Ao3P/iw==
X-ME-Sender: <xms:UHg_XzlQsC0VEXa6dm7ndVl76r8VQn4PdWgFZVUiiM7Fu0qM9zHVow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:UHg_X216p4Zpa7nIeo-qTfKc7t5OHJDWSXjnyE7Pmi3wojQU8U96qw>
 <xmx:UHg_X5pmKSctuy3R29cdC9sVvFlv8zCfJ7u5t_gmZKnQ5PVSpVxlXg>
 <xmx:UHg_X7l3qkXgOj8E8QfG7m2CiQhVhf6UEOAS3EBqaYhmrRhy4VBr7A>
 <xmx:UHg_Xy9haSuDpac7n6xm3eLJccju5JBIOkY3OFDx8qczYmYdrMzukA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7479230600B4;
 Fri, 21 Aug 2020 03:31:27 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 08/25] efw-downloader: efw-proto: add function to finish
 transaction for command frame
Date: Fri, 21 Aug 2020 16:30:54 +0900
Message-Id: <20200821073111.134857-9-o-takashi@sakamocchi.jp>
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

In Fireworks protocol, asynchronous transaction is used to deliver command
frame from software to device. The transaction is done to offset
0xecc000000000 with variable length of data up to 0x200.

The transaction includes header and data in its payload. The header
includes sequence field. The target device increments the value of
sequence field, then transfers response frame with the value so that
software can correspond the response frame with command frame according
to the sequence numbers. The header also includes version field but
version 1 is always used as long as I investigate. The header includes
category and command field to determine the type of data. The status
field is used to report operation result from the target device.

This commit adds a function to finish transaction for command frame.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/efw-proto.c | 86 +++++++++++++++++++++++++++++++++-
 efw-downloader/src/efw-proto.h |  4 ++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index bef81b3..cb8dad1 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -5,6 +5,8 @@
 
 #include <sound/firewire.h>
 
+#include <libhinawa/fw_req.h>
+
 /**
  * SECTION:efw_proto
  * @Title: EfwProto
@@ -19,11 +21,16 @@
  */
 struct _EfwProtoPrivate {
     guint32 *buf;
+    guint32 seqnum;
+    HinawaFwNode *node;
+    GMutex mutex;
 };
 G_DEFINE_TYPE_WITH_PRIVATE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
 
+#define EFW_CMD_ADDR            0xecc000000000ull
 #define EFW_RESP_ADDR           0xecc080000000ull
 #define EFW_MAX_FRAME_SIZE      0x200u
+#define MINIMUM_VERSION         1
 
 enum efw_proto_sig_type {
     EFW_PROTO_SIG_TYPE_RESPONDED = 1,
@@ -34,9 +41,12 @@ static guint efw_proto_sigs[EFW_PROTO_SIG_COUNT] = { 0 };
 static void proto_finalize(GObject *obj)
 {
     EfwProto *self = EFW_PROTO(obj);
+    EfwProtoPrivate *priv = efw_proto_get_instance_private(self);
 
     efw_proto_unbind(self);
 
+    g_mutex_clear(&priv->mutex);
+
     G_OBJECT_CLASS(efw_proto_parent_class)->finalize(obj);
 }
 
@@ -78,7 +88,10 @@ static void efw_proto_class_init(EfwProtoClass *klass)
 
 static void efw_proto_init(EfwProto *self)
 {
-    return;
+    EfwProtoPrivate *priv = efw_proto_get_instance_private(self);
+
+    priv->seqnum = 0;
+    g_mutex_init(&priv->mutex);
 }
 
 /**
@@ -113,6 +126,7 @@ void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error)
         return;
 
     priv->buf = g_malloc0(EFW_MAX_FRAME_SIZE);
+    priv->node = node;
 }
 
 /**
@@ -131,6 +145,76 @@ void efw_proto_unbind(EfwProto *self)
     hinawa_fw_resp_release(HINAWA_FW_RESP(self));
 
     g_free(priv->buf);
+    priv->buf = NULL;
+    priv->node = NULL;
+}
+
+/**
+ * efw_proto_command:
+ * @self: A #EfwProto.
+ * @category: One of category for the transaction.
+ * @command: One of category for the transaction.
+ * @args: (array length=arg_count)(nullable): An array with elements for quadlet data as arguments
+ *        for command.
+ * @arg_count: The number of quadlets in the args array.
+ * @resp_seqnum: (out): The sequence number for response transaction.
+ * @error: A #GError. Error can be generated with two domains of #hinawa_fw_req_error_quark() and
+ *         #hinawa_fw_req_error_quark().
+ *
+ * Transfer asynchronous transaction for command frame of Fireworks protocol. When receiving
+ * asynchronous transaction for response frame, #EfwProto::responded GObject signal is emitted.
+ */
+void efw_proto_command(EfwProto *self, guint category, guint command,
+                       const guint32 *args, gsize arg_count, guint32 *resp_seqnum,
+                       GError **error)
+{
+    EfwProtoPrivate *priv;
+    HinawaFwReq *req;
+    gsize length;
+    struct snd_efw_transaction *frame;
+    int i;
+
+    g_return_if_fail(EFW_IS_PROTO(self));
+    g_return_if_fail(sizeof(*args) * arg_count + sizeof(*frame) < EFW_MAX_FRAME_SIZE);
+    g_return_if_fail(resp_seqnum != NULL);
+    g_return_if_fail(error == NULL || *error == NULL);
+
+    priv = efw_proto_get_instance_private(self);
+
+    length = sizeof(*frame);
+    if (args != NULL)
+        length += sizeof(guint32) * arg_count;
+
+    frame = g_malloc0(length);
+
+    // Fill request frame for transaction.
+    frame->length = GUINT32_TO_BE(length / sizeof(guint32));
+    frame->version = GUINT32_TO_BE(MINIMUM_VERSION);
+    frame->category = GUINT32_TO_BE(category);
+    frame->command = GUINT32_TO_BE(command);
+    if (args != NULL) {
+        for (i = 0; i < arg_count; ++i)
+            frame->params[i] = GUINT32_TO_BE(args[i]);
+    }
+
+    // Increment the sequence number for next transaction.
+    g_mutex_lock(&priv->mutex);
+    frame->seqnum = GUINT32_TO_BE(priv->seqnum);
+    *resp_seqnum = priv->seqnum + 1;
+    priv->seqnum += 2;
+    if (priv->seqnum > SND_EFW_TRANSACTION_USER_SEQNUM_MAX)
+        priv->seqnum = 0;
+    g_mutex_unlock(&priv->mutex);
+
+    // Send this request frame.
+    req = hinawa_fw_req_new();
+
+    hinawa_fw_req_transaction_sync(req, priv->node, HINAWA_FW_TCODE_WRITE_BLOCK_REQUEST,
+                                   EFW_CMD_ADDR, length, (guint8 *const *)&frame, &length, 100,
+                                   error);
+
+    g_object_unref(req);
+    g_free(frame);
 }
 
 static HinawaFwRcode proto_handle_response(HinawaFwResp *resp, HinawaFwTcode tcode)
diff --git a/efw-downloader/src/efw-proto.h b/efw-downloader/src/efw-proto.h
index bc179dc..94f4a94 100644
--- a/efw-downloader/src/efw-proto.h
+++ b/efw-downloader/src/efw-proto.h
@@ -62,6 +62,10 @@ EfwProto *efw_proto_new();
 void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error);
 void efw_proto_unbind(EfwProto *self);
 
+void efw_proto_command(EfwProto *self, guint category, guint command,
+                       const guint32 *args, gsize arg_count, guint32 *resp_seqnum,
+                       GError **exception);
+
 G_END_DECLS
 
 #endif
-- 
2.25.1

