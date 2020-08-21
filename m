Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7F24CF65
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DF31676;
	Fri, 21 Aug 2020 09:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DF31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995499;
	bh=JvandNNP245hzJHkq7tZRYkB6WPc6xjhvjL517RrU9g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svSyjnTVzmHEmL215QrTOr4DtjTz9XgcnVpq/Z8WIW0Ut2rc5cbsxVPnN3B5kXgTv
	 KNtU14g1TYT10nZV0vHOncn42nax/s2r9JCxVUe256Q3Fb9J2HmXmPp92PuvQwPUhf
	 ayg5H9uXg/6Kd+Ut13A8/LHQV8ri283xGy6aWmSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0D3CF8031A;
	Fri, 21 Aug 2020 09:32:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3415BF802DD; Fri, 21 Aug 2020 09:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 569AEF802DD
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 569AEF802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ArKOieeD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="M+HstCdl"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 87F0E89D;
 Fri, 21 Aug 2020 03:31:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nCeOuln1DQD8W
 hM5ui/6o3n/TLutmQMHIgbn/AwpBX8=; b=ArKOieeDXhGrykTrk76UZR9P//hbU
 S5lOJIfoKX7aNC0T9nwnNSx44d3NN6BP+33/ZN+jQkAD0AhK/XKX48sdrIC8Dv0V
 g2NN6C9Rs6qsv2klnf+JfMoOEKCrn6nzHyM1dF/Sh5z2dBcoIGXAC2JYCJXgnVUd
 zqEXDrlJbA2ewJcpeatIfHtqkZC2ovV1mu8uuk8PD2XrLCsqhTdmW5fIjE0yGXM0
 SrLV5z2Ayx7sscNvIVERxOmEZFv5bB/3iym6acRVxyl4fsu/R5kI9HYvvyDHB+bk
 iEltHmDVzxgGr/2UioTMH2r+36NFUHCOGZsFh2yXUcLUlLc+R1E+yAZuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nCeOuln1DQD8WhM5ui/6o3n/TLutmQMHIgbn/AwpBX8=; b=M+HstCdl
 529xK2yDkX3AAnH0Td6I5X1YnHVS6u6axj5JO5MK67Qnt8lXj5OjT49zZXi02i7r
 wP9He2RM6l43TJglCibW+1S2p9AeuJaE7/xcnddkp+39VvkgZwL4na+uSkEr7QdD
 M0jvLwqOjgCQhdrQDZdp2P3mJnP+Lt5x77kZ9LAxRpJfcAeHtd0Kz4JPtpUPH0fH
 QoM2+iueGuDKEXNHdmtrhX1Z2ZkH9B0L8pg98wwwvvbE1QePUfm4lc5L+pJBm4BU
 BnI07RfL9RfDi79QI/7btuD4JGMXrHB5RrErXkTO791LawRWwFTI54+jnWQkBJfl
 dR6WpewIBIR6tQ==
X-ME-Sender: <xms:V3g_X1CeFWyOyH6pv3CHkhrJxQ1475r2mVq-MRl1ZnH4_fWahPijWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:V3g_XzhkJgtQZtAvklFeiQSI0Tos9lqGkLaNFRrdHFSAOsFieFRjYQ>
 <xmx:V3g_XwlUYyhV6fs2qGZLc1Q-_6Z2hy_-0Qr5C0xdvK2fslS110isyA>
 <xmx:V3g_X_xJ-vr4RH_HksG6XRCOXTfQuCVWF2vlhQHUrZovavxnhoTX8Q>
 <xmx:V3g_X9IY-h5m5yJhXpH95MPWNE0uBYhCLjuls-NfdL5eETaQX_AUHA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A42653060272;
 Fri, 21 Aug 2020 03:31:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 11/25] efw-downloader: subcmd-device: implement 'device' sub
 command to operate actual device
Date: Fri, 21 Aug 2020 16:30:57 +0900
Message-Id: <20200821073111.134857-12-o-takashi@sakamocchi.jp>
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

This commit implements 'device' sub command to operate the target device.
This sub command consists of several operations and parser for the
operation will be implemented in future commits.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/main.c          |  4 ++
 efw-downloader/src/meson.build     |  2 +
 efw-downloader/src/subcmd-device.c | 77 ++++++++++++++++++++++++++++++
 efw-downloader/src/subcmds.h       |  8 ++++
 4 files changed, 91 insertions(+)
 create mode 100644 efw-downloader/src/subcmd-device.c
 create mode 100644 efw-downloader/src/subcmds.h

diff --git a/efw-downloader/src/main.c b/efw-downloader/src/main.c
index 499e67e..e150cc8 100644
--- a/efw-downloader/src/main.c
+++ b/efw-downloader/src/main.c
@@ -4,6 +4,8 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include "subcmds.h"
+
 static void print_help()
 {
     printf("Usage\n"
@@ -11,6 +13,7 @@ static void print_help()
            "\n"
            "where:\n"
            "  SUBCOMMAND:\n"
+           "    device:     operate for device for unit on IEEE 1394 bus\n"
            "    help:       print help\n"
            "  OPTIONS:      optional arguments dependent on the subcommand\n");
 }
@@ -22,6 +25,7 @@ int main(int argc, char **argv)
     size_t size;
         int (*op)(int argc, char **argv);
     } *entry, entries[] = {
+        { "device", sizeof("device"), subcmd_device },
     };
     const char *subcmd;
     int i;
diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index ca894d9..07a6182 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -14,10 +14,12 @@ hinawa = dependency('hinawa',
 sources = [
   'main.c',
   'efw-proto.c',
+  'subcmd-device.c',
 ]
 
 headers = [
   'efw-proto.h',
+  'subcmds.h',
 ]
 
 gnome = import('gnome')
diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
new file mode 100644
index 0000000..739944e
--- /dev/null
+++ b/efw-downloader/src/subcmd-device.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <assert.h>
+
+#include "efw-proto.h"
+
+static int print_help()
+{
+    printf("Usage\n"
+           "  efw-downloader device CDEV OPERATION ARGUMENTS\n"
+           "\n"
+           "where:\n"
+           "  CDEV:   The firewire character device corresponding to the node for transaction\n"
+           "  OPERATION:\n"
+           "    help:   print this help message\n"
+           "  ARGUMENTS:\n"
+           "    depending on OPERATION\n"
+           "\n");
+    return EXIT_FAILURE;
+}
+
+static int parse_args(int argc, char **argv, const char **path, const char **op_name)
+{
+    if (argc < 2)
+        return -EINVAL;
+    assert(strncmp(argv[1], "device", sizeof("device")) == 0);
+
+    if (argc < 3)
+        return -EINVAL;
+    *path = argv[2];
+
+    if (argc < 4)
+        return -EINVAL;
+    *op_name = argv[3];
+
+    return 0;
+}
+
+int subcmd_device(int argc, char **argv)
+{
+    struct {
+        const char *name;
+        size_t size;
+        void (*op)(int argc, char **argv, EfwProto *proto, GError **error);
+    } *entry, entries[] = {
+    };
+    GError *error = NULL;
+    const char *path;
+    const char *op_name;
+    EfwProto *proto;
+    int err;
+    int i;
+
+    err = parse_args(argc, argv, &path, &op_name);
+    if (err < 0)
+        return print_help(0, NULL, NULL, NULL);
+
+    for (i = 0; i < G_N_ELEMENTS(entries); ++i) {
+        entry = entries + i;
+        if (strncmp(op_name, entry->name, entry->size) == 0)
+            break;
+    }
+    if (i == G_N_ELEMENTS(entries))
+        return print_help();
+
+    entry->op(argc, argv, proto, &error);
+
+    if (error != NULL) {
+        g_clear_error(&error);
+        return EXIT_FAILURE;
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/efw-downloader/src/subcmds.h b/efw-downloader/src/subcmds.h
new file mode 100644
index 0000000..f10c420
--- /dev/null
+++ b/efw-downloader/src/subcmds.h
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#ifndef __SUBCMDS_H__
+#define __SUBCMDS_H__
+
+int subcmd_device(int argc, char **argv);
+
+#endif
-- 
2.25.1

