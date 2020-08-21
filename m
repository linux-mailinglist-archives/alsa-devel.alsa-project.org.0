Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C6224CFB7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4F0169E;
	Fri, 21 Aug 2020 09:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4F0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995704;
	bh=iLpf9j3bHT8tVO3YogU0k313skhdEyHAAGgtsoCaLYU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFjFNONM1WL1eb9Wcbr8f1TmuPWr+Lxlqb1EheVHjPHNtY741n+QKjnH4IGOj495A
	 ssP5wcuQW84gj21YKX24m+vldFMwR6GEsrlPkHUZMWhFxwwpOmMmyeEExok2K6S2Gk
	 FTZM4CcQcdcus5Hpv09Amd49dKQHUxTiRvbzkkWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3796F8034F;
	Fri, 21 Aug 2020 09:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C792FF80317; Fri, 21 Aug 2020 09:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA5CFF80218
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA5CFF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OUlZJHhi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IkHv2Ous"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 129F48D5;
 Fri, 21 Aug 2020 03:31:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0Do/PKfM1uNzR
 ZmES9ekz1wc/pZqDt02aIEOkzvwxjg=; b=OUlZJHhiOt06Cjimyu6yDfmR27HR/
 2SnQEODovz+fqj/scoHTD+FeH/mP9+om+1MTyByUjszbXOisilw2iO3vWkeGfRMp
 JBSSbTkv2Mxr4uDE4BB5LE2ZgMZQ1hHLX1lERejAMCWNPRSWK4aKP+7GcDKiDgQ/
 6sM+N+LecrkWUdTQoH7OgpBzSwAOUgxtQJC1qACk/aWYDRbS/hfxFuEATdHz3nqS
 2iZj/SlJOY5cCVQxt8M4EiK93txB7YWEAgjRord6n/L2gFCyIBj1v4bMWSIvtpma
 ArKaAhQAQMJ4cxMd52DMtBhvL3uKZ/sC6mp8YerP7OsZkrjlcDrk0mOpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0Do/PKfM1uNzRZmES9ekz1wc/pZqDt02aIEOkzvwxjg=; b=IkHv2Ous
 dKN93r5EgY3j1rYwZRB+u4Ax++2WiBWgW+4vV4h/vERqSTCoMG3c76TfFWj1FnLz
 zmuMrG3X9aZMGCSS3AUIF5vcwdHhwhM2b3xpRoC9kJFCpI42UyQ4cnmuUALaHMzA
 UKTMtwmscIjeF7287Lpf6uqpCATI9NnBel9boStYyFaHEV3D3RalwAu/tkGye8oW
 UilvPWP1pB5yFn6dUSz5u8Ik9KV7PfqWEkfj/DN4K9K96Gxk/L2XbHKszn8eHw5B
 Q/BT24UEEm/cJ/gr087IDvNtkpj7krzMhphxaVDG3DHN1PNiNMz0DJKJWXShjdB5
 ZgAIo53ifCSbCg==
X-ME-Sender: <xms:W3g_XzRnA6qQo1H_KiMOZqKOQFpOMua7p4EZtoS6nWuc7XrwF6tQ0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:W3g_X0zFEfZUqOPPbbamOJ6KY4iUyTkACEEDmPVZQ8WYJReP7BrxcA>
 <xmx:W3g_X42hQ36S6PB6wpf5R-ZrGxnu0PezBvpbdnnbsPkqbl9DIAcGeQ>
 <xmx:W3g_XzDjz_7frMg2V3Ed2U_avZExThDhgllYl3zIb1-fqL8-DHrI3Q>
 <xmx:W3g_X4YkLrjNA_Hvor7AUvI8tNbCSrnIzV-YGCP7yts_r0xYPEYOyw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 656EC30600B4;
 Fri, 21 Aug 2020 03:31:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 14/25] efw-downloader: subcmd-device: check supported models
 or not
Date: Fri, 21 Aug 2020 16:31:00 +0900
Message-Id: <20200821073111.134857-15-o-takashi@sakamocchi.jp>
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

This commit checks whether the device for node is supported models or not.
When it's unsupported, the runtime exits with EXIT_FAILURE.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/subcmd-device.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
index e1be025..b93d62d 100644
--- a/efw-downloader/src/subcmd-device.c
+++ b/efw-downloader/src/subcmd-device.c
@@ -6,6 +6,7 @@
 #include <assert.h>
 
 #include "efw-proto.h"
+#include "config-rom.h"
 
 #define report_error(error, msg)                                                    \
         fprintf(stderr, "Fail to %s: %s %d %s\n",                                   \
@@ -55,6 +56,9 @@ int subcmd_device(int argc, char **argv)
     const char *path;
     const char *op_name;
     HinawaFwNode *node;
+    const guint8 *rom;
+    gsize length;
+    guint32 vendor_id, model_id;
     EfwProto *proto;
     int err;
     int i;
@@ -83,8 +87,21 @@ int subcmd_device(int argc, char **argv)
         goto err;
     }
 
-    entry->op(argc, argv, proto, &error);
+    hinawa_fw_node_get_config_rom(node, &rom, &length, &error);
+    if (error != NULL) {
+        report_error(error, "get config rom");
+        goto err_node;
+    }
 
+    if (!config_rom_detect_vendor_and_model(rom, &vendor_id, &model_id)) {
+        fprintf(stderr, "The node is not for Fireworks device: %s\n", path);
+        g_set_error_literal(&error, G_FILE_ERROR, g_file_error_from_errno(ENXIO),
+                            "The node is not for Fireworks device");
+        goto err_node;
+    }
+
+    entry->op(argc, argv, proto, &error);
+err_node:
     g_object_unref(node);
 err:
     if (error != NULL) {
-- 
2.25.1

