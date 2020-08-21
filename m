Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8D24CFD1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89C3166F;
	Fri, 21 Aug 2020 09:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89C3166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995915;
	bh=w42RtQqrjsrW1k7evi5ZzzKLwzbO+Wr2+b8FX2fyrhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muXLqr1WFiQEe7aIc3XyhcHntAezFWDh1NTPNY0MaNtVhRcvP5DIMW8+xm9IaHLkt
	 y4vFQPYTQKkUMgHK0Hn/r1BrYtMfYgVDCXB8iQ0q8cl7uyqPhn4j1BtSHP8G58MasK
	 CXNpuIK0W6OejCfjr2jmV8C398EPtq7kiMMe/uDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0655F8038E;
	Fri, 21 Aug 2020 09:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4398F80343; Fri, 21 Aug 2020 09:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E536F80322
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E536F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XB9qIwos"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dV7jXK9/"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 898F68D6;
 Fri, 21 Aug 2020 03:31:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=h4YioK3sQj4FJ
 w+dGh9BBRLRZzKMT9AN+fJGXzo4fGw=; b=XB9qIwosgscxokqfEvIXFAmQNan9U
 nLpQPT5yIU3E40Uv1g27MlF1DL9gPejg6ui0RJsb5o1dwITJLK2rMUTeGyIhRcr4
 62dS1AX8CK//fH2hbux0icnZkDjFWzEhqwZuTIWkoIea78NgnEFxuh3OU2hV7uO0
 pVVZsjMwwdH/DR03T3ys4XlIxk944gV6Uy+nDD7/l6sUwHw1yODXZLWak5yKfXHw
 pXAkuXtnvIV0w0TRWQTIhDilED0492IQ4+UxhZ7NC9xOoGGRVIKyg02iuCFs0Cvm
 Nre7RVrZKoYrvRI96G8p0ldDDvXFLQr1bEphstqnGL6XDlNHH/PMHOwJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=h4YioK3sQj4FJw+dGh9BBRLRZzKMT9AN+fJGXzo4fGw=; b=dV7jXK9/
 JIGiYHuY/Fc+dRdvaSQ4OX6uywMzz4xYuduwjFPHsBa5URQmjpeM70X8OXlIHPRH
 /m5nqjaeDuGEjuRPWr8LEPdRH5qNPBdvkdWuf93LFWdhJEw5+QrACzirrQLO/CIT
 Z37hua2sESf3FLd3Dz2lySAUC2lXel72JrvEscjGjULosbD3IPZzZZsvDm+Rrcqn
 jD2KzUFXEPC2F2y44k2IViz1fsiH34/qT7CueYXiKHeYm8auzyaArMO6JmvjUpQ+
 bO3Gi+g7wSrtvHQJRxzmeosvvczIWtqAfczbi/3QYJLfV+ScjesgfL36BgdZ+Dba
 szb3LW769gGUkw==
X-ME-Sender: <xms:aXg_Xy_J0g1l3m0Gx_Z_JIFhxpP7RrJ7oQhWAqApCqm_AVp8-lsOkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepudelnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:aXg_Xyv_ycR0ITKL48pgEUbg9lhMQtQZYRf1NHvjAoMH7LbtF5GVbg>
 <xmx:aXg_X4CfRsKFnsDH-wISJ9Xi5HQ_3t1hNcvASPMBOXYcvvElIs4-WA>
 <xmx:aXg_X6dVQnqi_lg3lK0VWoCXwxH2UcY-1L5azW_bvfQ1LGxs2EdmLw>
 <xmx:aXg_X93OOStRkKZgRM8b1amf8zFHuifNWBgsMv9MbYyJyDwNRNTNVw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D14C230600B1;
 Fri, 21 Aug 2020 03:31:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 22/25] efw-downloader: subcmd-file: add 'file' sub command
Date: Fri, 21 Aug 2020 16:31:08 +0900
Message-Id: <20200821073111.134857-23-o-takashi@sakamocchi.jp>
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

This commit adds 'file' subcommand to handle firmware files.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/meson.build   |  1 +
 efw-downloader/src/subcmd-file.c | 85 ++++++++++++++++++++++++++++++++
 efw-downloader/src/subcmds.h     |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 efw-downloader/src/subcmd-file.c

diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index 05d491d..7d11332 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -22,6 +22,7 @@ sources = [
   'file-cntr.c',
   'subcmd-device.c',
   'op-device-read.c',
+  'subcmd-file.c',
 ]
 
 headers = [
diff --git a/efw-downloader/src/subcmd-file.c b/efw-downloader/src/subcmd-file.c
new file mode 100644
index 0000000..0ee7653
--- /dev/null
+++ b/efw-downloader/src/subcmd-file.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <assert.h>
+
+#include "subcmds.h"
+
+static void print_help()
+{
+    printf("Usage\n"
+           "  efw-downloader file FILEPATH OPERATION ARGUMENTS\n"
+           "\n"
+           "where:\n"
+           "  FILEPATH: The path to file.\n"
+           "  OPERATION:\n"
+           "    help:   print this help message\n"
+           "  ARGUMENTS:\n"
+           "    depending on the OPERATION\n");
+}
+
+static int parse_args(int argc, char **argv, const char **filepath, const char **op_name)
+{
+    if (argc < 2)
+        return -EINVAL;
+    assert(strncmp(argv[1], "file", sizeof("file")) == 0);
+
+    if (argc < 3)
+        return -EINVAL;
+    *filepath = argv[2];
+
+    if (argc < 4)
+        return -EINVAL;
+    *op_name = argv[3];
+
+    return 0;
+}
+
+int subcmd_file(int argc, char **argv)
+{
+    struct {
+        const char *name;
+        size_t size;
+        int (*op)(int argc, char **argv, struct file_cntr *cntr);
+    } *entry, entries[] = {
+    };
+    const char *op_name;
+    const char *filepath;
+    struct file_cntr cntr = {0};
+    int err;
+    int i;
+
+    err = parse_args(argc, argv, &filepath, &op_name);
+    if (err < 0) {
+        print_help();
+        return EXIT_FAILURE;
+    }
+
+    for (i = 0; i < sizeof(entries) / sizeof(entries[0]); ++i) {
+        entry = entries + i;
+        if (strncmp(op_name, entry->name, entry->size) == 0)
+            break;
+    }
+    if (i == sizeof(entries) / sizeof(entries[0])) {
+        print_help();
+        return EXIT_FAILURE;
+    }
+
+    err = file_cntr_parse(&cntr, filepath);
+    if (err < 0) {
+        printf("Fail to parse: %s\n", strerror(-err));
+        return EXIT_FAILURE;
+    }
+
+    err = entry->op(argc, argv, &cntr);
+
+    file_cntr_release(&cntr);
+
+    if (err < 0)
+        return EXIT_FAILURE;
+
+    return EXIT_SUCCESS;
+}
diff --git a/efw-downloader/src/subcmds.h b/efw-downloader/src/subcmds.h
index 70cbb5a..b1810b3 100644
--- a/efw-downloader/src/subcmds.h
+++ b/efw-downloader/src/subcmds.h
@@ -4,8 +4,10 @@
 #define __SUBCMDS_H__
 
 #include "efw-proto.h"
+#include "file-cntr.h"
 
 int subcmd_device(int argc, char **argv);
+int subcmd_file(int argc, char **argv);
 
 void op_device_read(int argc, char **argv, EfwProto *proto, GError **error);
 
-- 
2.25.1

