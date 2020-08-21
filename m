Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D524CFCD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC601694;
	Fri, 21 Aug 2020 09:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC601694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995851;
	bh=UZPTzWLbxzFaYWGHqrpSCOVA+RqV9BHgddJXLt0YuLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSQoPaQ/c2mjQDVNlJJXyTX5j6X0QUS/qlXX3gPJgcytP62S0Zwj/MXp+YOb9/hEl
	 sc97QLLKqBo0GU6rY6xF77Eeq1gZvz1gwiCqwbeDkqDlQoNrZ0YBaPvdIuYYhb1nvB
	 eEH/X8kWvzQ+ofGglL+LGdMryJ65KqmsD/RuGfqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E05B6F8037D;
	Fri, 21 Aug 2020 09:32:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF74BF8033E; Fri, 21 Aug 2020 09:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47515F80303
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47515F80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iKLa+juy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OFfFdeCf"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7AFF48B9;
 Fri, 21 Aug 2020 03:31:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=KPYyZhrP1cWcK
 m0GXDuzOYq7JBYXxkQkitzqKvC+u38=; b=iKLa+juyy5TsCh0novAg2MenJkWZh
 yg/htRi1oGOUmc9u6FwYa0ir2J+heKp9hyy7LDXv09U5x1u5FOsyuVN1xnB6hFZK
 FdasippRwfS+/rj2MJwfjGSuFVKsJp4TEqUOZpdTdvpkzBaXYd+RCqKySpmaty/Z
 wMLO73DWnSzj2z8dukvUi/ZxlseIRDB9iIovvq6dYev4ZtkYIKPmZJqI+Kru1vID
 bcT5akrsN1pGN5AoCf171MvXqK+kI0o9s77jaoipibfjR58vxMoYqeo54UKNtgwR
 QSjLWcfBb6wZ/9h5KvkLGRE08KOlxZr1n2AgJTA3h+l54KcypF/pR3R8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KPYyZhrP1cWcKm0GXDuzOYq7JBYXxkQkitzqKvC+u38=; b=OFfFdeCf
 Ln+2joZcIIK+Fx60rqLiXfDPan3DMhpIe52bG+EzKR8wPvCNf0pQHe4UbNelLzzQ
 INDm/wxFkU/3fjaXgy612R8Td7dz4d+zGllETiJrKuMuh+2YbJIQeyccMkEaYFu8
 QH0zcjC94hw/plZ1ckAl96jHvM/0WvURs1X/oaYAYURqrXLFwzy/+rct/gmP6a1t
 x/UOREXecVp1GXnANG5VTA8dN7D3WD2/Cc1yY82TFHtJmGAP9KEHyjvS85TNN8pG
 mo9KUTXMAFPNrll5UO5haMo3Vx053bTuH7VEbV0w4IHjJooBfTcPDsDUIZ12b3tC
 netI6rIOl3ha/Q==
X-ME-Sender: <xms:Zng_X7SOSp4CwwXON-C75HT2qHCpDLNZ6_Z0D3_7Y8XQaFv9o2O1vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepudeinecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Zng_X8yW2k9-NSk0eIvx6H_5qJz_esKhGZTCVdKeKlYzUzl-kAHR5Q>
 <xmx:Zng_Xw3V_UZtrGyeKKghuRR1j7IWnqe37sHnva9WlK81tBBea6NYeg>
 <xmx:Zng_X7DQXDo2KN6pFWg2iGBgyCurTgs2YeMUxfvMZQuDarrrrnqTWA>
 <xmx:Zng_XwZCW8CZR8IhfRuz-FucGGrOzSs25MyMYhC9RWWVlLMTZJCfUQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id B338E30600B1;
 Fri, 21 Aug 2020 03:31:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 20/25] efw-downloader: subcmd-device: add read operation
Date: Fri, 21 Aug 2020 16:31:06 +0900
Message-Id: <20200821073111.134857-21-o-takashi@sakamocchi.jp>
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

This commit add read operation in device sub command. The arbitrary range
of address in on-board flash memory is read and the content is dump in
stdout.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/meson.build      |   1 +
 efw-downloader/src/op-device-read.c | 104 ++++++++++++++++++++++++++++
 efw-downloader/src/subcmd-device.c  |   4 ++
 efw-downloader/src/subcmds.h        |   4 ++
 4 files changed, 113 insertions(+)
 create mode 100644 efw-downloader/src/op-device-read.c

diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index 73a0f36..8738d76 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -18,6 +18,7 @@ sources = [
   'node-dispatcher.c',
   'efw-commands.c',
   'subcmd-device.c',
+  'op-device-read.c',
 ]
 
 headers = [
diff --git a/efw-downloader/src/op-device-read.c b/efw-downloader/src/op-device-read.c
new file mode 100644
index 0000000..a1fa0cf
--- /dev/null
+++ b/efw-downloader/src/op-device-read.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <assert.h>
+
+#include "efw-commands.h"
+
+static void print_help()
+{
+    printf("Usage\n"
+           "  efw-downloader device CDEV read OFFSET LENGTH [OPTIONS]\n"
+           "\n"
+           "where:\n"
+           "  CDEV:   The firewire character device corresponding to the node for proto\n"
+           "  OFFSET: The hexadecimal offset address in on-board flash memory\n"
+           "  LENGTH: The hexadecimal number to read. The value is finally aligned to quadlet.\n"
+           "  OPTIONS:\n"
+           "    --help, -h: Print this help message and exit.\n"
+           "    --debug:    Output debug message to stderr\n");
+}
+
+static int parse_args(int argc, char **argv, size_t *offset, size_t *quads, gboolean *help)
+{
+    unsigned long val;
+    char *end;
+    int i;
+
+    if (argc < 4)
+        return -EINVAL;
+    assert(strncmp(argv[3], "read", sizeof("read")) == 0);
+
+    if (argc < 5)
+        return -EINVAL;
+    val = strtol(argv[4], &end, 16);
+    if (*end != '\0') {
+        printf("Invalid argument for offset address.\n");
+        return -EINVAL;
+    }
+    *offset = (size_t)val;
+
+    if (argc < 6)
+        return -EINVAL;
+    val = strtol(argv[5], &end, 16);
+    if (*end != '\0') {
+        printf("Invalid argument for quadlet count.\n");
+        return -EINVAL;
+    }
+    *quads = (size_t)(val + 3) / 4;
+
+    *help = FALSE;
+    for (i = 0; i < argc; ++i) {
+        if (strncmp(argv[i], "--help", sizeof("--help")) == 0 ||
+            strncmp(argv[i], "-h", sizeof("-h")) == 0) {
+            *help = TRUE;
+        }
+    }
+
+    return 0;
+}
+
+void op_device_read(int argc, char **argv, EfwProto *proto, GError **error)
+{
+    size_t offset;
+    size_t quads;
+    guint32 *buf;
+    gboolean help;
+    int err;
+    int i;
+
+    err = parse_args(argc, argv, &offset, &quads, &help);
+    if (err < 0) {
+        print_help();
+        g_set_error_literal(error, G_FILE_ERROR, G_FILE_ERROR_INVAL, "Invalid arguments");
+        return;
+    }
+
+    if (help) {
+        print_help();
+        return;
+    }
+
+    buf = g_try_malloc0_n(quads, sizeof(*buf));
+    if (buf == NULL) {
+        fprintf(stderr, "Memory allocation fails.\n");
+        g_set_error_literal(error, G_FILE_ERROR, G_FILE_ERROR_NOSPC, "Memory allocation error");
+        return;
+    }
+
+    efw_flash_recursive_read(proto, offset, buf, quads, error);
+    if (*error != NULL) {
+        fprintf(stderr,
+                "Fail to read contents of flash memory: %s %d %s\n",
+                g_quark_to_string((*error)->domain), (*error)->code, (*error)->message);
+        goto end;
+    }
+
+    for (i = 0; i < quads; ++i)
+        printf("  %08lx: %08x\n", offset + 4 * i, buf[i]);
+end:
+    g_free(buf);
+}
diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
index 329eef0..a11450c 100644
--- a/efw-downloader/src/subcmd-device.c
+++ b/efw-downloader/src/subcmd-device.c
@@ -9,6 +9,8 @@
 #include "config-rom.h"
 #include "node-dispatcher.h"
 
+#include "subcmds.h"
+
 #define report_error(error, msg)                                                    \
         fprintf(stderr, "Fail to %s: %s %d %s\n",                                   \
                 msg, g_quark_to_string(error->domain), error->code, error->message)
@@ -21,6 +23,7 @@ static int print_help()
            "where:\n"
            "  CDEV:   The firewire character device corresponding to the node for transaction\n"
            "  OPERATION:\n"
+           "    read:   read from on-board flash memory\n"
            "    help:   print this help message\n"
            "  ARGUMENTS:\n"
            "    depending on OPERATION\n"
@@ -84,6 +87,7 @@ int subcmd_device(int argc, char **argv)
         size_t size;
         void (*op)(int argc, char **argv, EfwProto *proto, GError **error);
     } *entry, entries[] = {
+        { "read", sizeof("read"), op_device_read },
     };
     GError *error = NULL;
     gboolean debug;
diff --git a/efw-downloader/src/subcmds.h b/efw-downloader/src/subcmds.h
index f10c420..70cbb5a 100644
--- a/efw-downloader/src/subcmds.h
+++ b/efw-downloader/src/subcmds.h
@@ -3,6 +3,10 @@
 #ifndef __SUBCMDS_H__
 #define __SUBCMDS_H__
 
+#include "efw-proto.h"
+
 int subcmd_device(int argc, char **argv);
 
+void op_device_read(int argc, char **argv, EfwProto *proto, GError **error);
+
 #endif
-- 
2.25.1

