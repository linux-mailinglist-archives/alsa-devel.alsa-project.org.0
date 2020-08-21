Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C718224CFC5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708BC1692;
	Fri, 21 Aug 2020 09:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708BC1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995746;
	bh=lzoyOM1XJAP/fbsMw7XN6WHTcvxGO+7/OIZUtr+Inuc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdZW5NOlCpaOi9dMtbzth/YhB5+5Ti3liNtnrNdmy4rL3YKDRjujZgFv+CvmYWlSp
	 J8PIPT6O3boRTFLayvW1kL4PEo5+7fgAOr79k4mTJHavPQblbSu2d3jTWad/OOvzpT
	 V9lNFL3w2nMtlGQmzYhk6JlczwsVZDXOEryL4Ls8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB858F80361;
	Fri, 21 Aug 2020 09:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2958CF802E9; Fri, 21 Aug 2020 09:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D95ACF80260
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D95ACF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n358xPkX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uB7N8Vax"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1ED06896;
 Fri, 21 Aug 2020 03:31:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VoOoFW+q3+2EB
 HGoml9SX+R4sH5rVMML8h8pqfWEvyE=; b=n358xPkXqNYPk2tk3ZyuGTQqAyoVJ
 Z2U5Bw41AD+RT8vQgqvuyvuqWwa68dQH1zlVS8JCdZlbgysCIxq2gDe68zE3m8IW
 qj7y19htYif1G7SPAYY/ArXpPjTzfy/RIKloSQUcgjHUoh43gwMINbPs/JOLfAKW
 3CyK6nLvA9Rg2tCikk3GifIOekkDOGZ+ebyPUIPqbphPATiHWVtNpNhLaA/XAo0X
 ietSzMIphJD7W3xs4oWTrEK47YuD3NKFlYAj7tmY11XVDIThhApnshnMjiIESp+s
 SAugFaww4tkAYDCaGkFW3yKpmdCU4M1t2rmX5yDl/obt3RoFms3xQy82A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VoOoFW+q3+2EBHGoml9SX+R4sH5rVMML8h8pqfWEvyE=; b=uB7N8Vax
 qUbQrfj/UTv0I8maY1QVcUixNmH2+S1ViUnJsqtZXYXXMQMsfUuTZVyfY6kVAEs8
 Uu8ZdMAUQeBYdsGiTxgKZIj9gx//+WgdmydTZdErI/tdr+Tr3XQdZGf3uSHimK6D
 Yj6u1tSP/qMtJzje/1o9AcI7TcqVb9gMlps8wJvnoRr9oIp3xanA4QSBWM7Nt+li
 pqQ1nnheUYjHX3AugsonI4VIB1OsPiIJPA6f2i9/AmhghvNiSAOp6FxyjfHfy0Ra
 yXpMN5qGZjDwsH9eSX+rxuvISOXgvcKG1ZshuUX4n8Jr3nDBrQysJZ24OgegAD+b
 NQh3zQtNZppArg==
X-ME-Sender: <xms:Xng_X8spPpTBofRkxwPbgtOaV9SaVFQcd4Ow_AaZgcxY1WVjeM33Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Xng_X5dJHtE6rJRRdhIotCFdEv3x5g1uzTYzBU_hqBD7WAmq8DknTA>
 <xmx:Xng_X3xXlwB6NAQIULQH0_12Doe25rNbYmBGt3NEJ4A9VHr3AMOGUw>
 <xmx:Xng_X_MTPaxUhTBvGi_1hsaSkdWK1Q3Uf4obq6F8sodXfhlKU_a5GA>
 <xmx:Xng_X6mKuQ1oxLBw-eW9uvSesCt7lPJzFwjTy0tojNQLOoUqkWbgoQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6275030600B9;
 Fri, 21 Aug 2020 03:31:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 16/25] efw-downloader: node_dispatcher: add event dispatcher
 utilizing GLib MainContext/MainLoop
Date: Fri, 21 Aug 2020 16:31:02 +0900
Message-Id: <20200821073111.134857-17-o-takashi@sakamocchi.jp>
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

HinawaFwNode creates GSource for GLib MainContext. It's easy to GLib
MainLoop as event dispatcher.

This commit adds local application of GLib MainContext/MainLoop to dispatch
events for HinawaFwNode.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/meson.build       |  2 +
 efw-downloader/src/node-dispatcher.c | 86 ++++++++++++++++++++++++++++
 efw-downloader/src/node-dispatcher.h | 21 +++++++
 efw-downloader/src/subcmd-device.c   | 10 ++++
 4 files changed, 119 insertions(+)
 create mode 100644 efw-downloader/src/node-dispatcher.c
 create mode 100644 efw-downloader/src/node-dispatcher.h

diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index c006c8b..c43c332 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -15,12 +15,14 @@ sources = [
   'main.c',
   'efw-proto.c',
   'config-rom.c',
+  'node-dispatcher.c',
   'subcmd-device.c',
 ]
 
 headers = [
   'efw-proto.h',
   'config-rom.h',
+  'node-dispatcher.h',
   'subcmds.h',
 ]
 
diff --git a/efw-downloader/src/node-dispatcher.c b/efw-downloader/src/node-dispatcher.c
new file mode 100644
index 0000000..8394600
--- /dev/null
+++ b/efw-downloader/src/node-dispatcher.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include "node-dispatcher.h"
+#include <time.h>
+
+struct thread_arg {
+    GMainLoop *loop;
+    GCond cond;
+    GMutex mutex;
+};
+
+static gpointer run_node_dispatcher(gpointer data)
+{
+    struct thread_arg *args = (struct thread_arg *)data;
+
+    g_mutex_lock(&args->mutex);
+    g_cond_signal(&args->cond);
+    g_mutex_unlock(&args->mutex);
+
+    g_main_loop_run(args->loop);
+
+    return NULL;
+}
+
+void node_dispatcher_start(struct node_dispatcher *dispatcher, HinawaFwNode *node, GError **error)
+{
+    struct thread_arg args;
+    GSource *src;
+
+    dispatcher->ctx = g_main_context_new();
+
+    hinawa_fw_node_create_source(node, &src, error);
+    if (*error != NULL)
+        return;
+
+    g_source_attach(src, dispatcher->ctx);
+    g_source_unref(src);
+
+    dispatcher->loop = g_main_loop_new(dispatcher->ctx, FALSE);
+
+    args.loop = dispatcher->loop;
+    g_cond_init(&args.cond);
+    g_mutex_init(&args.mutex);
+
+    dispatcher->th = g_thread_try_new("node-dispatcher", run_node_dispatcher, &args, error);
+    if (*error != NULL) {
+        g_main_loop_quit(dispatcher->loop);
+        g_main_loop_unref(dispatcher->loop);
+        dispatcher->loop = NULL;
+
+        g_main_context_unref(dispatcher->ctx);
+        dispatcher->ctx = NULL;
+
+        goto end;
+    }
+
+    g_mutex_lock(&args.mutex);
+    while (!g_main_loop_is_running(dispatcher->loop))
+        g_cond_wait(&args.cond, &args.mutex);
+    g_mutex_unlock(&args.mutex);
+end:
+    g_cond_clear(&args.cond);
+    g_mutex_clear(&args.mutex);
+}
+
+void node_dispatcher_stop(struct node_dispatcher *dispatcher)
+{
+    if (dispatcher->loop != NULL)
+        g_main_loop_quit(dispatcher->loop);
+
+    if (dispatcher->th != NULL) {
+        g_thread_join(dispatcher->th);
+        g_thread_unref(dispatcher->th);
+        dispatcher->th = NULL;
+    }
+
+    if (dispatcher->loop != NULL) {
+        g_main_loop_unref(dispatcher->loop);
+        dispatcher->loop = NULL;
+    }
+
+    if (dispatcher->ctx != NULL) {
+        g_main_context_unref(dispatcher->ctx);
+        dispatcher->ctx = NULL;
+    }
+}
diff --git a/efw-downloader/src/node-dispatcher.h b/efw-downloader/src/node-dispatcher.h
new file mode 100644
index 0000000..9e47e00
--- /dev/null
+++ b/efw-downloader/src/node-dispatcher.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#ifndef __NODE_DISPATCHER_H__
+#define __NODE_DISPATCHER_H__
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include <libhinawa/fw_node.h>
+#include <libhinawa/fw_resp.h>
+
+struct node_dispatcher {
+    GMainContext *ctx;
+    GMainLoop *loop;
+    GThread *th;
+};
+
+void node_dispatcher_start(struct node_dispatcher *dispatcher, HinawaFwNode *node, GError **error);
+void node_dispatcher_stop(struct node_dispatcher *dispatcher);
+
+#endif
diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
index 1bfa1f2..5ac0ac6 100644
--- a/efw-downloader/src/subcmd-device.c
+++ b/efw-downloader/src/subcmd-device.c
@@ -7,6 +7,7 @@
 
 #include "efw-proto.h"
 #include "config-rom.h"
+#include "node-dispatcher.h"
 
 #define report_error(error, msg)                                                    \
         fprintf(stderr, "Fail to %s: %s %d %s\n",                                   \
@@ -60,6 +61,7 @@ int subcmd_device(int argc, char **argv)
     gsize length;
     guint32 vendor_id, model_id;
     EfwProto *proto;
+    struct node_dispatcher dispatcher = {0};
     int err;
     int i;
 
@@ -116,8 +118,16 @@ int subcmd_device(int argc, char **argv)
         goto err_node;
     }
 
+    node_dispatcher_start(&dispatcher, node, &error);
+    if (error != NULL) {
+        report_error(error, "begin dispatcher");
+        goto err_proto;
+    }
+
     entry->op(argc, argv, proto, &error);
 
+    node_dispatcher_stop(&dispatcher);
+err_proto:
     efw_proto_unbind(proto);
     g_object_unref(proto);
 err_node:
-- 
2.25.1

