Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9F24CFD9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436C41676;
	Fri, 21 Aug 2020 09:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436C41676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995983;
	bh=OBSwhEBcqI35q6xG/aAUxKl6NhPWCiXlxOhWpXMVifA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0m0wVq7UqxtBtxCLC5LE3i0riu4vM/ersPBq34rQOzICPdGTD7NIOHJExav2NdLk
	 krzSIWzyUYx2UyM24MjkRy9W0M4RZvQ2WrLwgtCxiH9WWgkHprwNU/5ODDiBZsUoPS
	 x8qSIJQxkLQwn7GCVqFy8GXwJUidQ+1aFaIf8F0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB50F803A6;
	Fri, 21 Aug 2020 09:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECEF3F80349; Fri, 21 Aug 2020 09:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2001F80253
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2001F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZKTRxkVV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="d2iz8TXs"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 211F393B;
 Fri, 21 Aug 2020 03:31:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BMe74KewABkkh
 TJIZlnshVWfepeONnyeatFA/AXINs8=; b=ZKTRxkVVIIcKG0rmkyls/+d7EB0Z5
 Nf4Pfy8G1mwn9GofYjzx69szbPRywkRCf+Y8MhuIo/zlUFP8U+9jGxhnGJhGN0q4
 T7NGimaJ8dNUL3WaevMQCQV5fMHTP0MSB8/3Uy0lQ6p4J3aTlvHjexLOK0a3ej+c
 OL91lNJlBoNv2AOddEFdPZnb2OKpcYYVem+ccfXSHGLvctozaV4bKPcfTL+lX6GW
 GWJHsrv6L3WZSGVaQspnGlN0b4JU6ljUr1yKthMsQx5k/IZWvJB1X7GWktp8xaKC
 +cPFX12qCouDkwadcibY3XBwRdnjt5nOIHmHEwe4GqnEQa15fniUTA1bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BMe74KewABkkhTJIZlnshVWfepeONnyeatFA/AXINs8=; b=d2iz8TXs
 4L4CTi48Sj2Ki6YUvzg2Nhnss7WLFFTJTkYwkU+PUk/Cvrsyr646BoatwYHllESr
 rWh3qOi02zeIe9XqmTmKaFpuKeKgKWlHGy/gAWcXLoMRu0guBywCF4dBIkld0Inh
 kKvjZxGxCzCRWnvHUvB1iU3mlppiUynQ9vQpfEKbtr7UHhRf91BTTivjQ2F9W5A0
 z4dImNoJ/9771ZrEfZI+2VnZPBd9a2DLHIXYvudwX2LTKMOGzMVqDYFh9BVYV2TL
 gxNnKXne3zJt1hgnzrVRndn6EU3HJfkEdpV3Km+YtZE1G+n+s+XXVu+2NWyn/dz/
 cdW8SuR9LW/OcQ==
X-ME-Sender: <xms:ang_Xwyw9b_P13-EqEWr3DHeYuMi6M2mjk8NrGy1pMMNTl89L_ea7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepudelnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ang_X0TZzHKkk3CChh_ijOK49fgyj0UZVU_6SF4lqajEAL2Q87zFNg>
 <xmx:ang_XyXyeyYuRtAsF0kwBx7W4ji33J6g0AQP7rbjRtRnOixpVv9KJw>
 <xmx:ang_X-jDUlM56TbZSEaTF_IOB2dYgqRAO1tzptJg8_m9BSRZqTCFNA>
 <xmx:ang_Xz5kN6nuyjRbtgWMUEuK6lvNFUjCgNYy5k2bQJZJJlO7KjNghQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6308A30600A9;
 Fri, 21 Aug 2020 03:31:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 23/25] efw-downloader: subcmd-file: add parse operation
Date: Fri, 21 Aug 2020 16:31:09 +0900
Message-Id: <20200821073111.134857-24-o-takashi@sakamocchi.jp>
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

This commit adds parse operation in file sub command to dump contents of
firmware files.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/main.c          |   2 +
 efw-downloader/src/meson.build     |   1 +
 efw-downloader/src/op-file-parse.c | 106 +++++++++++++++++++++++++++++
 efw-downloader/src/subcmd-file.c   |   2 +
 efw-downloader/src/subcmds.h       |   2 +
 5 files changed, 113 insertions(+)
 create mode 100644 efw-downloader/src/op-file-parse.c

diff --git a/efw-downloader/src/main.c b/efw-downloader/src/main.c
index e150cc8..a9b52eb 100644
--- a/efw-downloader/src/main.c
+++ b/efw-downloader/src/main.c
@@ -14,6 +14,7 @@ static void print_help()
            "where:\n"
            "  SUBCOMMAND:\n"
            "    device:     operate for device for unit on IEEE 1394 bus\n"
+           "    file:       operate for firmware file"
            "    help:       print help\n"
            "  OPTIONS:      optional arguments dependent on the subcommand\n");
 }
@@ -26,6 +27,7 @@ int main(int argc, char **argv)
         int (*op)(int argc, char **argv);
     } *entry, entries[] = {
         { "device", sizeof("device"), subcmd_device },
+        { "file", sizeof("file"), subcmd_file },
     };
     const char *subcmd;
     int i;
diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index 7d11332..8f7e363 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -23,6 +23,7 @@ sources = [
   'subcmd-device.c',
   'op-device-read.c',
   'subcmd-file.c',
+  'op-file-parse.c',
 ]
 
 headers = [
diff --git a/efw-downloader/src/op-file-parse.c b/efw-downloader/src/op-file-parse.c
new file mode 100644
index 0000000..c9c81d2
--- /dev/null
+++ b/efw-downloader/src/op-file-parse.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
+#include <stddef.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <string.h>
+#include <assert.h>
+
+#include "file-cntr.h"
+
+static void print_help()
+{
+    printf("Usage\n"
+           "  efw-downloader file PATH parse [--help | -h]\n"
+           "\n"
+           "where:\n"
+           "  --help, -h: print this help message\n");
+}
+
+static const char *get_blob_type_name(enum blob_type type)
+{
+    const char *name;
+
+    switch (type) {
+    case BLOB_TYPE_DSP:
+        name = "DSP";
+        break;
+    case BLOB_TYPE_ICELYNX:
+        name = "IceLynx";
+        break;
+    case BLOB_TYPE_DATA:
+        name = "data";
+        break;
+    case BLOB_TYPE_FPGA:
+        name = "FPGA";
+        break;
+    default:
+        name = "invalid";
+        break;
+    }
+
+    return name;
+}
+
+static void file_cntr_dump_header(const struct file_cntr *cntr)
+{
+    printf("Container header:\n");
+    printf("  type:               %d (%s)\n", cntr->header.type, get_blob_type_name(cntr->header.type));
+    printf("  offset_addr:        0x%08x\n", cntr->header.offset_addr);
+    printf("  blob_quads:         %u\n", cntr->header.blob_quads);
+    printf("  blob_crc32:         0x%08x\n", cntr->header.blob_crc32);
+    printf("  blob_checksum:      0x%08x\n", cntr->header.blob_checksum);
+    printf("  version:            0x%08x\n", cntr->header.version);
+    printf("  crc_in_region_end:  %d\n", cntr->header.crc_in_region_end);
+    printf("  total_quads:        %d\n", cntr->header.cntr_quads);
+}
+
+static void file_cntr_dump_payload(const struct file_cntr *cntr)
+{
+    int i;
+
+    printf("Container payload:\n");
+    for (i = 0; i < cntr->payload.count; ++i)
+        printf("  %08x: %08x\n", cntr->header.offset_addr + i * 4, cntr->payload.blob[i]);
+}
+
+static int parse_args(int argc, char **argv, bool *help)
+{
+    int i;
+
+    if (argc < 4)
+        return -EINVAL;
+    assert(!strncmp(argv[3], "parse", sizeof("parse")));
+
+    *help = false;
+    for (i = 0; i < argc; ++i) {
+        if (strncmp(argv[i], "--help", sizeof("--help")) == 0 ||
+            strncmp(argv[i], "-h", sizeof("-h")) == 0) {
+            *help = true;
+            break;
+        }
+    }
+
+    return 0;
+}
+
+int op_file_parse(int argc, char **argv, struct file_cntr *cntr)
+{
+    bool help = false;
+    int err;
+
+    err = parse_args(argc, argv, &help);
+    if (err < 0)
+        return err;
+
+    if (help) {
+        print_help();
+        return 0;
+    }
+
+    file_cntr_dump_header(cntr);
+    file_cntr_dump_payload(cntr);
+
+    return 0;
+}
diff --git a/efw-downloader/src/subcmd-file.c b/efw-downloader/src/subcmd-file.c
index 0ee7653..a61378c 100644
--- a/efw-downloader/src/subcmd-file.c
+++ b/efw-downloader/src/subcmd-file.c
@@ -16,6 +16,7 @@ static void print_help()
            "where:\n"
            "  FILEPATH: The path to file.\n"
            "  OPERATION:\n"
+           "    parse:  parse and dump binary blob released by Echo Audio\n"
            "    help:   print this help message\n"
            "  ARGUMENTS:\n"
            "    depending on the OPERATION\n");
@@ -45,6 +46,7 @@ int subcmd_file(int argc, char **argv)
         size_t size;
         int (*op)(int argc, char **argv, struct file_cntr *cntr);
     } *entry, entries[] = {
+        { "parse", sizeof("parse"), op_file_parse },
     };
     const char *op_name;
     const char *filepath;
diff --git a/efw-downloader/src/subcmds.h b/efw-downloader/src/subcmds.h
index b1810b3..99d3bef 100644
--- a/efw-downloader/src/subcmds.h
+++ b/efw-downloader/src/subcmds.h
@@ -11,4 +11,6 @@ int subcmd_file(int argc, char **argv);
 
 void op_device_read(int argc, char **argv, EfwProto *proto, GError **error);
 
+int op_file_parse(int argc, char **argv, struct file_cntr *cntr);
+
 #endif
-- 
2.25.1

