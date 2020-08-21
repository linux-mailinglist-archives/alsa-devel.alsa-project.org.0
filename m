Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8C24CF9B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:40:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48A216A4;
	Fri, 21 Aug 2020 09:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48A216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995647;
	bh=Vl9s7JAgREnsqVor5Vpph2X9bS0EiKI1WbybFzrMQhk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMgJ7ZJZ+f7BMoPF8SSVwYhARLFbe0gBTQNsPv9W32BB6hq13PQT4Ftabv/P+uPeL
	 KUB9VwJrsUqDVgQgs83yGO/pKIToQ1Gz6LTeYBFEzaiL8EhnPvJ0rwJacm5Gs0S39p
	 /vbiZPVWhlnXVKqv+fudxFVQAXbzSH/1tXKgKwC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A87F8034B;
	Fri, 21 Aug 2020 09:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 584D9F80321; Fri, 21 Aug 2020 09:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F5F9F802E9
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F5F9F802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VQ9PkG0Y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AW759oA+"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 92F2C8F5;
 Fri, 21 Aug 2020 03:31:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LA6eHpvSCwcym
 rcvvVEvgAPxk6WC1hJ7d//CaT5mpN4=; b=VQ9PkG0YbMJ44JNWNwcma+xisAhUB
 k588B92rzQYvSeXiFt8c4GiWXa+U2UiXZELlqZNgJ6wFW+Zf9eNnU61LGS3ueYIO
 GsAn9vwNtB6okJQYyiGrzFVPh4l/4iFJfWqRAzoBLh0E9ZBJ5wXRsO5Bpk5ai2Vj
 gn9VvSvZN7YtSNvKOmSj+aNeX8yprN2WSCDe0QE0/Heu/SVi+PVt+0Zc0U1fa6vp
 F0IQ8kBH634EwmVEpWWQxLxPLnpnjyKNuevNqnJSaBNY8Ai/YPewj9jg4yUXRmuD
 6yV1ihQbzR9oPBszqce1riUkmO+gX10Kfvzz0kg1T0WuL19pG8z2Da30A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LA6eHpvSCwcymrcvvVEvgAPxk6WC1hJ7d//CaT5mpN4=; b=AW759oA+
 fCXmkKK8x1qdq8iZnlUX24cN5QDIpP1rzDvnuWcOpB0HusmL5qeIEXRKDnF/tn+b
 vMVCBnaiZhs+ZfoyvfEUblACHj3AqcxlLJwd7Ksd+oEFrOJ9xOp1ajERFMSRFTRb
 WTlV5e+AL8SNU5Ti8FoDzKIreQj9mcfOXFHc+rXEgfPiYAWjigOsYH8wG2KmazrZ
 R3XXbzPjtpj/2zAKzHzIpHWIOYGWIVCEbW3WgsebuwFR5F1COJz5SRE0RJgEXBHy
 RVuvbwB0SBZOJ+aUQk3EZt/6+sWb6j9M5v08OTJaqbIcbj556BfiZedhOm09B9Ng
 6+oPan8bZAUN5w==
X-ME-Sender: <xms:XXg_X1O_kqo5OUsZHaTND34VBFztLz8b0-NPiVpnYmnimDJkzxeYzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:XXg_X38k2hoV1mWgYAhHFqJ57FYYCePru0GZJtGFWjc7Nw4eDb_60Q>
 <xmx:XXg_X0T8HyqIhqjwhJC5Cte0IP1t6I1NKX9nMl4THB8PiDPftdbQuw>
 <xmx:XXg_Xxvt1nf0RODTE1vA0TzqMiKFCjrIEu0dAzsT4N-xXYI8rsR9VA>
 <xmx:XXg_X9FgNhUe6GmnpwhS2gXNX06A7VUyt3UKwuJDTsFG50jwox5zFg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6E5430600A6;
 Fri, 21 Aug 2020 03:31:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 15/25] efw-downloader: subcmd-device: bind Fireworks protocol
Date: Fri, 21 Aug 2020 16:31:01 +0900
Message-Id: <20200821073111.134857-16-o-takashi@sakamocchi.jp>
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

This commit binds Fireworks protocol for the given node.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/subcmd-device.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/efw-downloader/src/subcmd-device.c b/efw-downloader/src/subcmd-device.c
index b93d62d..1bfa1f2 100644
--- a/efw-downloader/src/subcmd-device.c
+++ b/efw-downloader/src/subcmd-device.c
@@ -100,7 +100,26 @@ int subcmd_device(int argc, char **argv)
         goto err_node;
     }
 
+    proto = efw_proto_new();
+    efw_proto_bind(proto, node, &error);
+    if (error != NULL) {
+        if (g_error_matches(error, HINAWA_FW_NODE_ERROR, HINAWA_FW_NODE_ERROR_FAILED)) {
+            if (strstr(error->message, "16") != NULL) {
+                fprintf(stderr, "The range of address on 1394 OHCI controller already used by "
+                        "ALSA fireworks driver.\n");
+            } else {
+                report_error(error, "bind protocol");
+            }
+        } else {
+            report_error(error, "bind protocol");
+        }
+        goto err_node;
+    }
+
     entry->op(argc, argv, proto, &error);
+
+    efw_proto_unbind(proto);
+    g_object_unref(proto);
 err_node:
     g_object_unref(node);
 err:
-- 
2.25.1

