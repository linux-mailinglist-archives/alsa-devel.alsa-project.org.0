Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5724CFAC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1D01676;
	Fri, 21 Aug 2020 09:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1D01676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995685;
	bh=GXx1jp7kxwc0AJl58yY1WGSnCP664nmJaqeoKNNBLzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLB5S1cRS15z6n8lnIiybIQyRoSIHLsqUs3t3VGbutLmFexDoAFqQjooL/DRabeK0
	 rWY872M872vKzbAGvBzsiy5mTcFvS8EPETrGGQuJdSqUrfRwW1yjQNN2O16OKxpuOg
	 0p6BWND7ZPEMBx00LixPHdf4ig0BryVxbUt70qSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F57F8034C;
	Fri, 21 Aug 2020 09:32:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7024FF8031A; Fri, 21 Aug 2020 09:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A92EF80253
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A92EF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LPes8KDf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ErGjARVK"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 9B40828A;
 Fri, 21 Aug 2020 03:31:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/1kXJ5EnNWuIn
 wtKakugyFCNGf74wLBdhLPndyx0Y/U=; b=LPes8KDfjmyruabB85yX0dvMzPNes
 iZPHrqperUmeH+HNNgk3iwM5bAIxVpmXJSyax6mS68+42b5pryiix3gvfzWuAm5G
 uompRz3ZF5cH/xgDvujnRBE0nvYWfGo7B7VKLcdLC7nw+ABdtOYfUmWKLv1/Gzf2
 OriP2zWAwWd7fJrM64WYqedvyCTPeMJD2ruskWpudjYx8VF2ZeYbeTJbwr4aHoJa
 ZZxqb9oPtLBO30JsOE1wf2DI0UD1fxoRM25IW9QZ4bXuHMZr3mpnxYSKpZnJsAs/
 +8z4mwTQwR8ui8BGDhXJjcDV7TAROenkAjBJ/AbPjdPfFSzkDMlOSknuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/1kXJ5EnNWuInwtKakugyFCNGf74wLBdhLPndyx0Y/U=; b=ErGjARVK
 AQlJXljhuvw7JEI/B/REUPXTDOBfN9xQXKm8222OqMSAYiBdf6ffhV3KbZHqB+Ku
 L+PWpO43DYA+S2xcxVEAtJn+Chkaq6aMEPDw0j3jmOmciG2XtBD4WrrbD6T91ppG
 KWI1acU7ck3mHEm1jVKdtWhtQ6R+qgLVQScuKOmPaLad0q0xHtSCmlmPn8LAMPQq
 9tKYSMvJIuYdnJGADOYkKR9W2fsjRvp0h/myqF2OEcgk5cuAV0trLHkPcTNp10lO
 CzMt+PXGsNloR2oBKBysb2z0GmismbwZ34a9w/0QGxTpoLwxMpCzmImFG+kwkEMk
 5bBW3wlWKxCrWw==
X-ME-Sender: <xms:Wng_X1WjU--7c2sAbsK8n17xxyB0sxWsQG_yqH-WD1knf6kkhcgpWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Wng_X1kFrZuxyAdwSIz0SuiC6Yp48XJMpFVmGWTuckv_KQeLvaHxxw>
 <xmx:Wng_XxaV5c44qgTOxrVT4JfHwuWPRYAuWbybYAvpwNg0V367LWj8PA>
 <xmx:Wng_X4Wq3SQObhLWfN0uYzeXxrrrl9vxXWGkjy6dtt8IVcfUksQT2A>
 <xmx:Wng_X3uhC8nw-S0MQuuPYU8GLgm3rff7F4oydoN01XKrl6_cCQxXPQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC26A30600B1;
 Fri, 21 Aug 2020 03:31:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 13/25] efw-downloader: config-rom: parse config rom to detect
 supported device
Date: Fri, 21 Aug 2020 16:30:59 +0900
Message-Id: <20200821073111.134857-14-o-takashi@sakamocchi.jp>
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

In IEEE 1394 bus, each node exposes the range of address for data. The data
is used by the other node to identify the node. The data is named as
configuration rom.

This commit adds helper function to parse the configuration rom to detect
supported models.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/config-rom.c | 60 +++++++++++++++++++++++++++++++++
 efw-downloader/src/config-rom.h | 26 ++++++++++++++
 efw-downloader/src/meson.build  |  2 ++
 3 files changed, 88 insertions(+)
 create mode 100644 efw-downloader/src/config-rom.c
 create mode 100644 efw-downloader/src/config-rom.h

diff --git a/efw-downloader/src/config-rom.c b/efw-downloader/src/config-rom.c
new file mode 100644
index 0000000..ce37037
--- /dev/null
+++ b/efw-downloader/src/config-rom.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#include "config-rom.h"
+
+gboolean config_rom_detect_vendor_and_model(const guint8 *rom, guint32 *vendor_id, guint32 *model_id)
+{
+    gboolean detected = FALSE;
+
+    if (rom[24] != 0x03)
+        return FALSE;
+
+    *vendor_id = (rom[25] << 16) | (rom[26] << 8) | rom[27];
+
+    if (rom[32] != 0x17)
+        return FALSE;
+
+    *model_id = (rom[33] << 16) | (rom[34] << 8) | rom[35];
+
+    switch (*vendor_id) {
+    case VENDOR_LOUD:
+        switch (*model_id) {
+        case MODEL_ONYX400F:
+        case MODEL_ONYX1200F:
+            detected = TRUE;
+            break;
+        default:
+            break;
+        }
+        break;
+    case VENDOR_ECHO_AUDIO:
+        switch (*model_id) {
+        case MODEL_AF2:
+        case MODEL_AF4:
+        case MODEL_AF8:
+        case MODEL_AF8P:
+        case MODEL_AF12:
+        case MODEL_AF12HD:
+        case MODEL_AF12_APPLE:
+        case MODEL_FWHDMI:
+            detected = TRUE;
+            break;
+        default:
+            break;
+        }
+        break;
+    case VENDOR_GIBSON:
+        switch (*model_id) {
+        case MODELRIP:
+        case MODELAUDIOPUNK:
+            detected = TRUE;
+            break;
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    return detected;
+}
diff --git a/efw-downloader/src/config-rom.h b/efw-downloader/src/config-rom.h
new file mode 100644
index 0000000..59bdc14
--- /dev/null
+++ b/efw-downloader/src/config-rom.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+// Copyright (c) 2020 Takashi Sakamoto
+#ifndef __CONFIG_ROM_H__
+#define __CONFIG_ROM_H__
+
+#include <glib.h>
+
+#define VENDOR_LOUD         0x000ff2
+#define   MODEL_ONYX400F    0x00400f
+#define   MODEL_ONYX1200F   0x01200f
+#define VENDOR_ECHO_AUDIO   0x001486
+#define   MODEL_AF2         0x000af2
+#define   MODEL_AF4         0x000af4
+#define   MODEL_AF8         0x000af8
+#define   MODEL_AF8P        0x000af9
+#define   MODEL_AF12        0x00af12
+#define   MODEL_AF12HD      0x0af12d
+#define   MODEL_AF12_APPLE  0x0af12a
+#define   MODEL_FWHDMI      0x00afd1
+#define VENDOR_GIBSON       0x00075b
+#define   MODELRIP          0x00afb2
+#define   MODELAUDIOPUNK    0x00afb9
+
+gboolean config_rom_detect_vendor_and_model(const guint8 *rom, guint32 *vendor_id, guint32 *model_id);
+
+#endif
diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index 07a6182..c006c8b 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -14,11 +14,13 @@ hinawa = dependency('hinawa',
 sources = [
   'main.c',
   'efw-proto.c',
+  'config-rom.c',
   'subcmd-device.c',
 ]
 
 headers = [
   'efw-proto.h',
+  'config-rom.h',
   'subcmds.h',
 ]
 
-- 
2.25.1

