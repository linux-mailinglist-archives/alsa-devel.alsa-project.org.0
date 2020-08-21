Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D859C24CFC7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD061694;
	Fri, 21 Aug 2020 09:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD061694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995789;
	bh=MQtjZaIVZyTzc9dyMPygL4g1QsFUr2tmc+xmbd1ksUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bc3FedvDAtMGf3vnbuhm2kRk6hJ8oAE5faucLXivD6/SjaOtLECj974K570W6ziyI
	 Nr1o4u8rDfmlFcGgct5yitoN0GXpk7GCDxcAqcy75nleridCNo0DMzrSeZJLncjdmv
	 jjDxXGyW34c5t/dCT5mecBIDCQlxqU/vcc0noJaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C385F8036E;
	Fri, 21 Aug 2020 09:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22CFEF80317; Fri, 21 Aug 2020 09:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD62FF802EC
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD62FF802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bhGu4L7i"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="b6ryquQq"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id DD32790F;
 Fri, 21 Aug 2020 03:31:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Y/8SJwzWWXRjh
 6+YEEYfAEplJzDhuvEcF6U2dQH01G8=; b=bhGu4L7i6ELzlRlNHD/6umionDFH2
 /fqMv305MiHDyS43jwjszJ94P9Om0M5SW9PotZTUofAnkgTzRXKscWvr2OmwFZeS
 qTLgjIMPJKcoTkD/XlIclK3raV9SyzSG54Vf4ClOVHLAvK73zRPAF8jz7b35Rrda
 Gv1PsyOWAs128wZsr/f50k62IxZBH1AenD4RPYUK0HHp8mWjUALo4Re1jkT7Sjm/
 PxCshHARsBnf0Tma+GFanL9zhrmH1Zjjk2apT3ogVZm1YITb+jw5bI4lM5ms8Cb+
 pOK34haauAWtkuOLprwRBdIGlPfITOIOUu1nSBSImAOOPhBQAV9AYoFMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Y/8SJwzWWXRjh6+YEEYfAEplJzDhuvEcF6U2dQH01G8=; b=b6ryquQq
 /pCc2RaoDq0ZR8KofYLOUoEBP5ymIYp9tUrunC4xHHPHq6fDgMa7+NcuursSX5n6
 Hqfpiv1PPJrdRK97a9jHVO1sBNIG0PTpbSz4UAReJcneuwVjtyaZUsT/FykAPsKv
 +WZBlEbtArItdIjlhZfqQ581oghbJdB3jaJimuchstaSJLUXeISliPvuD1GCDxFY
 W1SfYrHZjoJHIlqKudJIM+Ls6yXS5MiJ0UrYpFrclbTDvHkDCjX/bcC0V1JkCF0Q
 ZJSGnnHEYOfWiyGtptv+yVZrlbCzNUHRhWJwL3APFNDeSXf/NjJcxyGyebCIPSI2
 FfOWYU/vnNVCrA==
X-ME-Sender: <xms:YHg_Xz84_gjxxQdWg69hOXABUWuFM811HZm1rDTrOto5B2UqkQ4vMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:YHg_X_uo0P5Z0h1EWNwHeOIpoKV4dO_k4yDGwvyvmLrBiX-VpXFHIw>
 <xmx:YHg_XxDNbV8-gRuH6JmEahtezcE8trGMQsIBmlV0_Oh1Ws29NJug0g>
 <xmx:YHg_X_cboHccPclP5C68Rt3O-f4Obm52KtrvaP2SLmlOj2D1Va4WWw>
 <xmx:YHg_Xy0PDGxMtBmlaChnKA7gu06IrJngnfoLD4OgjuhaKGQVC_rfkg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA93030600A6;
 Fri, 21 Aug 2020 03:31:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 17/25] efw-downloader: subcmd-device: support debug output for
 response of Fireworks protocol
Date: Fri, 21 Aug 2020 16:31:03 +0900
Message-Id: <20200821073111.134857-18-o-takashi@sakamocchi.jp>
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

It's helpful to dump communication result optionally.

This commit adds debug option for the purpose.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/subcmd-device.c | 40 ++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
index 5ac0ac6..329eef0 100644
--- a/efw-downloader/src/subcmd-device.c
+++ b/efw-downloader/src/subcmd-device.c
@@ -28,8 +28,31 @@ static int print_help()
     return EXIT_FAILURE;
 }
 
-static int parse_args(int argc, char **argv, const char **path, const char **op_name)
+static void handle_responded_signal(EfwProto *proto, HinawaSndEfwStatus status, guint seqnum,
+                      guint category, guint command, const guint32 *frame, guint frame_size)
 {
+    gchar *label = g_enum_to_string(HINAWA_TYPE_SND_EFW_STATUS, status);
+    int i;
+
+    printf("responded:\n");
+    printf("  status: %s\n", label);
+    printf("  seqnum: %d\n", seqnum);
+    printf("  category; %d\n", category);
+    printf("  command: %d\n", command);
+
+    if (frame_size > 0) {
+        printf("  frame:\n");
+        for (i = 0; i < frame_size; ++i)
+            printf("  [%3x]: %08x\n", i, frame[i]);
+    }
+
+    g_free(label);
+}
+
+static int parse_args(int argc, char **argv, const char **path, const char **op_name, gboolean *debug)
+{
+    int i;
+
     if (argc < 2)
         return -EINVAL;
     assert(strncmp(argv[1], "device", sizeof("device")) == 0);
@@ -42,6 +65,15 @@ static int parse_args(int argc, char **argv, const char **path, const char **op_
         return -EINVAL;
     *op_name = argv[3];
 
+    *debug = FALSE;
+    for (i = 0; i < argc; ++i) {
+        if (strncmp(argv[i], "--debug", sizeof(--debug)) == 0 ||
+            strncmp(argv[i], "-d", sizeof(--debug)) == 0) {
+            *debug = TRUE;
+            break;
+        }
+    }
+
     return 0;
 }
 
@@ -54,6 +86,7 @@ int subcmd_device(int argc, char **argv)
     } *entry, entries[] = {
     };
     GError *error = NULL;
+    gboolean debug;
     const char *path;
     const char *op_name;
     HinawaFwNode *node;
@@ -65,7 +98,7 @@ int subcmd_device(int argc, char **argv)
     int err;
     int i;
 
-    err = parse_args(argc, argv, &path, &op_name);
+    err = parse_args(argc, argv, &path, &op_name, &debug);
     if (err < 0)
         return print_help(0, NULL, NULL, NULL);
 
@@ -103,6 +136,9 @@ int subcmd_device(int argc, char **argv)
     }
 
     proto = efw_proto_new();
+    if (debug)
+        g_signal_connect(proto, "responded", (GCallback)handle_responded_signal, NULL);
+
     efw_proto_bind(proto, node, &error);
     if (error != NULL) {
         if (g_error_matches(error, HINAWA_FW_NODE_ERROR, HINAWA_FW_NODE_ERROR_FAILED)) {
-- 
2.25.1

