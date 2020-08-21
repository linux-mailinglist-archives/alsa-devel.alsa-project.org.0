Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E060C24CFCA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EA0169E;
	Fri, 21 Aug 2020 09:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EA0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995815;
	bh=NsDj5mhAOHE3U5SLAhjBIClS4OgP64OspdNDURlL1tQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGOmROKwC5/DZQLGP8KOFLEy+voNTRu4JE14HrfKD/j6XF6VE15kVo/0IOQh8/cz1
	 OcO6Dq+j+X2UNJhtfJnURjqO6CoqWfdG5f1+TXlxxr0RZ3SqMFbLRovogV9TFQXsMU
	 KTIxgFD9ByFQgCJN9B1GNg8IsstmKmCVjFOMrl1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA7AF80370;
	Fri, 21 Aug 2020 09:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24751F8033F; Fri, 21 Aug 2020 09:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C50E2F80307
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C50E2F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BaBGAXdV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nl7qShPG"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id F2D0A88D;
 Fri, 21 Aug 2020 03:31:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=K/QPuC3ZdcnZY
 7jTjKWi3t1nnUTZaUy5ObXDqQ9utho=; b=BaBGAXdVo3qb0KJVuaxuPP1QtE4D3
 2gXzFKaP50OnKQhl5k5niklWZ6Or3u+Sa4XjwY2ZmkeeLIwXtg6LdyRtWWnb6GEz
 XOdUywJtqMzzmitizUqY6nyFVxyzQf4OCHL8WwA7zHldHu9Alf9kI23Uw1mrELpI
 helpEpLfyWZmbxOu0wmzliuiP85ZE3imUyiJgcjVPHv076wKBAvWwhCzcrhd9FQN
 pmGtdsMuJTQ2S+OYapKVwNMfmBn6G5nIUHAcsUjNmqwUfXEXpxFCXyqZSMsI9Is5
 7EJ/suC6BPBYAGASfoBnlYt1mHFI6Yv1VcWjmzBRQnjTBVZiNm2uCHU0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=K/QPuC3ZdcnZY7jTjKWi3t1nnUTZaUy5ObXDqQ9utho=; b=nl7qShPG
 bhh7TJJxPS5zP77aWxnBo0XvCkvv78C0+e1AUzORfqaWZXFypmaasoj+tcGvmOLP
 4j4SjT3H/qQ9XiwTHxuLKb6Q0ZEbah6LG24nMBCcoxWSCX3EyAPGxP2lZcArapoX
 4As+JQnujXmS91dBtG07E16JV4i1nc/7VVNmjMkGD9dbQVjyP3hW0+8h428Vovrh
 0g5fCUS6Hd30qcxZ/Qf/LIw61CeFbAsBxZljZAyrEBOznJpxrznGYphHAq4E5Vwb
 wMANtJj2wNiOMxwJB6xexZl750mUR+uMdl8kX8VL9imrsHVwODh+xVE8Kxx6XXn/
 a705Z1RL1+mmHA==
X-ME-Sender: <xms:Z3g_XziWOFYaaE17AJgB3rx6ZQcSUojwfjLEKs6uPqUEW5oIDi43sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepudelnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Z3g_XwBipOD49oI10_st-yUuPJo3Otqs2R3wmxTV0iZO2MRWsRDhZg>
 <xmx:Z3g_XzESaqXsxxJhYIh-47rX62p29S9E4P7D_kFziTFeOvKLVkEEgA>
 <xmx:Z3g_XwQxkUKdJajq7ErDNUxz5wtx3E39k_uTsTnXnOk_eUH_ElR9-g>
 <xmx:Z3g_X9rYE29B2j4Csv17fy61OjanmW3W-T-9p5K9uPmwOVMV21uIwA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AD4A30600A6;
 Fri, 21 Aug 2020 03:31:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 21/25] efw-downloader: file-cntr: add parser for data binary
 shipped by Echo Digital Audio corporation
Date: Fri, 21 Aug 2020 16:31:07 +0900
Message-Id: <20200821073111.134857-22-o-takashi@sakamocchi.jp>
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

Echo Digital Audio corporation designed data format of firmware. The
format seems to be suitable for their SDK for customers and closed.

FFADO project implements the format parser in libffado2. Although the
implementation is not enough in several points, it's good point to guess
the format.

I captured asynchronous packet by bus analyzer during updating firmware by
Windows driver, aggregated the content of packet by script, then compared
it to content of firmware. Some points are cleared (but not all).

This commit adds parser for data binary shipped by Echo Digital Audio
corporation. I note that driver package shipped by vendors for Fireworks
based devices includes no EULA. I think this kind of reimplementation
is not limited in the case.

The content of file consists of two parts; header after magic bytes, and
payload. The header includes metadata about the data of payload. There are
four kind of data; for DSP, for IceLynx Micro, for arbitrary data, and
for FPGA.

The content except for magic bytes is hexadecimal string,
therefore it's possible to print out by simple dump tool; cat(1) and
less(1). The header includes CRC32 value of the decoded data and checksum
of every bytes of the decoded data.

When the header includes a flag, the CRC32 value is written to the end of
area for firmware.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/file-cntr.c | 183 +++++++++++++++++++++++++++++++++
 efw-downloader/src/file-cntr.h |  39 +++++++
 efw-downloader/src/meson.build |   5 +
 3 files changed, 227 insertions(+)
 create mode 100644 efw-downloader/src/file-cntr.c
 create mode 100644 efw-downloader/src/file-cntr.h

diff --git a/efw-downloader/src/file-cntr.c b/efw-downloader/src/file-cntr.c
new file mode 100644
index 0000000..1e159f7
--- /dev/null
+++ b/efw-downloader/src/file-cntr.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+
+#include <zlib.h>
+
+#include "file-cntr.h"
+
+#define MAGIC_BYTES             "1651 1 0 0 0\r\n"
+#define PAYLOAD_OFFSET_QUADS    0x3f
+
+static int parse_entry(FILE *handle, uint32_t *val)
+{
+    char buf[16];
+    char *end;
+    size_t len;
+    int err = 0;
+
+    if (fgets(buf, sizeof(buf), handle) != buf) {
+        if (ferror(handle))
+            err = -errno;
+        else
+            err = INT_MAX;  // Use the value for EOF.
+        return err;
+    }
+
+    len = strlen(buf);
+    if (buf[0] != '0' || buf[1] != 'x' || buf[len - 2] != '\r' || buf[len - 1] != '\n')
+        return -EPROTO;
+    buf[len - 2] = '\0';
+
+    *val = strtoul(buf, &end, 16);
+    if (*end != '\0')
+        return -EPROTO;
+
+    return err;
+}
+
+static int parse_header(FILE *handle, struct file_cntr_header *header)
+{
+    uint32_t *buf = (uint32_t *)header;
+    int err = 0;
+    int i;
+
+    for (i = 0; i < 8; ++i) {
+        uint32_t val;
+
+        err = parse_entry(handle, &val);
+        if (err != 0)
+            break;
+
+        buf[i] = val;
+    }
+
+    if (err == INT_MAX)
+        err = -ENODATA;
+
+    return err;
+}
+
+static int parse_payload(FILE *handle, unsigned int quads, uint32_t *blob)
+{
+    int err = 0;
+    int i;
+
+    for (i = 0; i < quads; ++i) {
+        uint32_t val;
+
+        err = parse_entry(handle, &val);
+        if (err != 0)
+            break;
+
+        blob[i] = val;
+    }
+
+    if (i != quads || err == INT_MAX)
+        err = -ENODATA;
+
+    return err;
+}
+
+static int check_crc32(struct file_cntr *cntr)
+{
+    uint32_t blob_crc32;
+
+    blob_crc32 = crc32(0ul, (const uint8_t *)cntr->payload.blob,
+                       cntr->payload.count * sizeof(*cntr->payload.blob));
+    if (blob_crc32 != cntr->header.blob_crc32)
+        return -EINVAL;
+
+    return 0;
+}
+
+static int check_checksum(struct file_cntr *cntr)
+{
+    uint32_t checksum = 0;
+    int i, j;
+
+    for (i = 0; i < cntr->payload.count; ++i) {
+        for (j = 3; j >= 0; --j)
+            checksum += (cntr->payload.blob[i] >> (j * 8)) & 0xff;
+    }
+
+    if (checksum != cntr->header.blob_checksum)
+        return -EINVAL;
+
+    return 0;
+}
+
+int file_cntr_parse(struct file_cntr *cntr, const char *filepath)
+{
+    FILE *handle;
+    char buf[16];
+    size_t till_data;
+    int err = 0;
+
+    handle = fopen(filepath, "r");
+    if (handle == NULL)
+        return -errno;
+
+    // Check magic bytes.
+    if (fgets(buf, sizeof(buf), handle) != buf) {
+        if (ferror(handle))
+            err = -errno;
+        else
+            err = -ENODATA;
+        goto end;
+    }
+
+    if (memcmp(buf, MAGIC_BYTES, sizeof(MAGIC_BYTES))) {
+        err = -EPROTO;
+        goto end;
+    }
+
+    // Parse header.
+    err = parse_header(handle, &cntr->header);
+    if (err < 0)
+        goto end;
+
+    // Skip to area for data.
+    till_data = (PAYLOAD_OFFSET_QUADS - 7) * 12;
+    if (fseek(handle, till_data, SEEK_CUR) < 0) {
+        err = -errno;
+        goto end;
+    }
+
+    cntr->payload.blob = calloc(cntr->header.blob_quads, sizeof(*cntr->payload.blob));
+    if (cntr->payload.blob == NULL) {
+        err = -ENOMEM;
+        goto end;
+    }
+    cntr->payload.count = cntr->header.blob_quads;
+
+    err = parse_payload(handle, cntr->header.blob_quads, cntr->payload.blob);
+    if (err < 0) {
+        free(cntr->payload.blob);
+        goto end;
+    }
+
+    err = check_crc32(cntr);
+    if (err < 0) {
+        free(cntr->payload.blob);
+        goto end;
+    }
+
+    err = check_checksum(cntr);
+    if (err < 0)
+        free(cntr->payload.blob);
+end:
+    fclose(handle);
+
+    return err;
+}
+
+void file_cntr_release(struct file_cntr *cntr)
+{
+    if (cntr->payload.blob != NULL)
+        free(cntr->payload.blob);
+    cntr->payload.blob = NULL;
+}
diff --git a/efw-downloader/src/file-cntr.h b/efw-downloader/src/file-cntr.h
new file mode 100644
index 0000000..c4657f1
--- /dev/null
+++ b/efw-downloader/src/file-cntr.h
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#ifndef __FILE_CNTR__
+#define __FILE_CNTR__
+
+#include <stdint.h>
+
+enum blob_type {
+    BLOB_TYPE_DSP = 0,
+    BLOB_TYPE_ICELYNX = 1,
+    BLOB_TYPE_DATA = 2,
+    BLOB_TYPE_FPGA = 3,
+};
+
+struct file_cntr_header {
+    enum blob_type type;
+    uint32_t offset_addr;
+    uint32_t blob_quads;
+    uint32_t blob_crc32;
+    uint32_t blob_checksum;
+    uint32_t version;
+    uint32_t crc_in_region_end;
+    uint32_t cntr_quads;
+};
+
+struct file_cntr_payload {
+    uint32_t *blob;
+    size_t count;
+};
+
+struct file_cntr {
+    struct file_cntr_header header;
+    struct file_cntr_payload payload;
+};
+
+int file_cntr_parse(struct file_cntr *cntr, const char *filepath);
+void file_cntr_release(struct file_cntr *cntr);
+
+#endif
diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index 8738d76..05d491d 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -11,12 +11,15 @@ hinawa = dependency('hinawa',
   version: '>=2.1',
 )
 
+zlib = dependency('zlib')
+
 sources = [
   'main.c',
   'efw-proto.c',
   'config-rom.c',
   'node-dispatcher.c',
   'efw-commands.c',
+  'file-cntr.c',
   'subcmd-device.c',
   'op-device-read.c',
 ]
@@ -26,6 +29,7 @@ headers = [
   'config-rom.h',
   'node-dispatcher.h',
   'efw-commands.h',
+  'file-cntr.h',
   'subcmds.h',
 ]
 
@@ -42,6 +46,7 @@ executable('efw-downloader',
   dependencies: [
     gobject,
     hinawa,
+    zlib,
   ],
   install: true,
 )
-- 
2.25.1

