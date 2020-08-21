Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25824CF6B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074DD166B;
	Fri, 21 Aug 2020 09:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074DD166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995540;
	bh=Un9gcCkuhjkfDslARqhayeEeecn/Amxz9mQCFQ8OTl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml1P+rGYe9c3sLlGJK1bIK0hFGGg/sc7BBWXVzaV79m7C+5JvmCeARSLWBsT20rOE
	 srPMOHUZInyd1va43DqfmzBluNuN1SZyhJqtKosOme77/bUujEoJh90PXbEfFSVp9H
	 o8R2HhlhR0DBzt+SGZ9Cc8xVLHRAxLu5f4jJ5wag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D8AFF80336;
	Fri, 21 Aug 2020 09:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9051F80303; Fri, 21 Aug 2020 09:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F50AF802DC
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F50AF802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jzzAi2Rc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tg/bXBPn"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B90B135B;
 Fri, 21 Aug 2020 03:31:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4IJgN3kapfojz
 XX3lCjkvMyQ0pm2+CwQAbJceSsrHTc=; b=jzzAi2RcyWOL/WdgnUeKepPgQvIoQ
 pbTs86YEVzCV+ZklXb3uwQ5E2aafdvgr3o6wYpgXTUeYWRsRqL6gmpPJOm0t6rCf
 Jn9ySuMqXQaHU4g9wKkRaNRdW1DQRSE8TgnYNjsO5SDdmT6bSwh5bgc9+qOxTF4L
 wdJIpbGw0JTROMDm6isckm5QPtEbGtbOR5kQDHSoWizUFR6NXumAVmM+cVzAwosp
 WplLJed9RVSLTpdeGudEhQmP+brWMvfc1vVBC37/v1pCLP5eNpruSOS8jvy2yvd8
 dmbgHE7y9Bu0dcvDN17cO5SmIQY1hqyYzB6AHsie0jPlcmd6NNcnsLmRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4IJgN3kapfojzXX3lCjkvMyQ0pm2+CwQAbJceSsrHTc=; b=tg/bXBPn
 +c/g2tiwKWX3xbTvh5R8nYlziQM0gPaQjKTSfLoDZE+oA40hRpjzVJscHClxTAiu
 X5i03T7dov8aLwo5l5Df+S9WCFYRSWJve1M+CwrM9jkogNiIw4gUndHYQ6+hT/aM
 COSSMsZJzjUuW6yeztdUIvlnUHDZ5tJ3+9ocd/HUHKaOlVjaONbpyYN828wHklSl
 iNGlDam1IM8K4/MzyQ8lljzaF35+uL60g5IEZSxzSTJWVuACwHAsD6bekIxixulR
 c8/WiAMEKOycSI7VvQO81B9SBHfxORjMoRyVzCIrfQny3munBNlynx+rK/r+GTfg
 jEiTZG1M5Ajukw==
X-ME-Sender: <xms:VXg_X8KN9TXOKCwBX1gJhAdcpAogs_gH2kvTUSr949egIlK0BXbmrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:VXg_X8LDt8n0mJRrzZMhn8sp9LbhNsqOn_bzKiAkoCj38Wb4sNnPaQ>
 <xmx:VXg_X8v9Vqcb1UJ2WYjVbcGcIwNAvv01qRXBRTBrcNzojSwCUpczhA>
 <xmx:VXg_X5bdFa588RkFj9e4QjbDGh5XEyGR3d1cv6Bc2CKBdTwuJZFC8w>
 <xmx:VXg_X6zFdlFPkr5YBG22ViRVZYTzLbB-wM6KXrUPsHM-n85p9_9hHg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E097D30600B1;
 Fri, 21 Aug 2020 03:31:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 10/25] efw-downloader: add parser for sub commands
Date: Fri, 21 Aug 2020 16:30:56 +0900
Message-Id: <20200821073111.134857-11-o-takashi@sakamocchi.jp>
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

This tool consists of sub commands for different functionalities.

This commit adds parser for sub commands. Actual implementation for
each sub command will be added in future commits.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/main.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/efw-downloader/src/main.c b/efw-downloader/src/main.c
index 31ac349..499e67e 100644
--- a/efw-downloader/src/main.c
+++ b/efw-downloader/src/main.c
@@ -1,8 +1,48 @@
 // SPDX-License-Identifier: GPL-3.0-or-later
 // Copyright (c) 2020 Takashi Sakamoto
+#include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
+
+static void print_help()
+{
+    printf("Usage\n"
+           "  efw-downloader SUBCOMMAND OPTIONS\n"
+           "\n"
+           "where:\n"
+           "  SUBCOMMAND:\n"
+           "    help:       print help\n"
+           "  OPTIONS:      optional arguments dependent on the subcommand\n");
+}
 
 int main(int argc, char **argv)
 {
-    return EXIT_SUCCESS;
+    static const struct {
+        const char *name;
+    size_t size;
+        int (*op)(int argc, char **argv);
+    } *entry, entries[] = {
+    };
+    const char *subcmd;
+    int i;
+
+    if (argc < 2) {
+        print_help();
+        return EXIT_FAILURE;
+    }
+    subcmd = argv[1];
+
+    for (i = 0; i < sizeof(entries) / sizeof(entries[0]); ++i) {
+        entry = entries + i;
+        if (strncmp(subcmd, entry->name, entry->size) == 0) {
+            entry = &entries[i];
+            break;
+        }
+    }
+    if (i == sizeof(entries) / sizeof(entries[0])) {
+        print_help();
+        return EXIT_FAILURE;
+    }
+
+    return entry->op(argc, argv);
 }
-- 
2.25.1

