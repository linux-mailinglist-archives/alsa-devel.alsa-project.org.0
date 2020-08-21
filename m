Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D824CF5B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C711691;
	Fri, 21 Aug 2020 09:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C711691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995342;
	bh=02kgDYO3g8sN0N4zec5cLghBy6Zx2WAnN/DOSYcvCaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iij8SFYDfOCZ/rVe7NZBF5r7wPfU8gr1+65LpdU+LZ4kf43gdn4E/fdk0g5kiNlXO
	 Hy/eEDiOicG72WUVw87wgzCgKavWIW7pnPZ0lwa7d59NmXDnwG+K3W3Rgg0T+uJPEG
	 b/s1ghKDedreqUQZAiU5YUa2u1qhB9i4MIdqBKXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A06F80257;
	Fri, 21 Aug 2020 09:31:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A237F802E7; Fri, 21 Aug 2020 09:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF8DF8025A
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF8DF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Me/ieQ89"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mGz+S2Ql"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id D9EAF874;
 Fri, 21 Aug 2020 03:31:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=s9E+MFXVnhMSF
 mbIpbJVREX6/j7qFbqK6L8U1zPCKac=; b=Me/ieQ89W9wZBQqgqIyaSRjp5IM/a
 snSQC3SpzjItWxhirAcJQK6G1X9qF5ZpjQNeXkvaNC2ePb4pxpmtI9bHvGeQkwYs
 3QhH6Gtj9QkBdgzTt5eapAj5EdrNmZFwHzOiLkbVsUeMkCm+ZfX+h5R8/DGNEl+c
 pIPna5MeA4aM3r1QugN8W7agrcvw0ARrlkysptutBiqNGRuk1XvnwDPpgXPwoY+L
 fYzl7EKgv8xLtqplrbKgM7DaFXV5Vat5iGq/xm8ycC0/JApz5f8jwdFiwepKv9/q
 8iz4wVW++7M+rRwNAQZrzcrv8V3zm1yZlLPIIWRoYfbRnAd24ILH8R+dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=s9E+MFXVnhMSFmbIpbJVREX6/j7qFbqK6L8U1zPCKac=; b=mGz+S2Ql
 LvUr0o0iBmT9UdnIkrSjeQV0MOAFbXm/CyleyozNgsDTOfk7AC9oijKmlSkycv/y
 MVX6XFWSbbe8qSslQrDlA9QH/IN0DOtktNAP91KaTZadOXgbgxOYD+ZZmiqyudVW
 1/KuxGYua5aGlh5YB5qXUTwJzmxi8y3d1iCXE044qi/8bSBxZBsM1AgLozJZ9bgs
 OQkW3xRZMjTsJ1Q5svRPrlX9pN+w//u5F50MyWUkKrmtlAxXKKXln5OSjzAMF9b0
 WjmcVdE01KuwH9QJTLS84qmgUuJWb20iY7twDjkqMOGSgyr6KTbOD/Ekz8arsOnl
 loHun2DhNhp4FQ==
X-ME-Sender: <xms:Sng_X8JjW7djfV5GWUmL8rn6NB6hWNRWWLqOVTRXkkWiNJFWhaX0vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Sng_X8LhV6ilw4yicPSoB2iBYnFpOID-5KA16JcBM0JwhxbDX2m_Rw>
 <xmx:Sng_X8vDd_QDAmrIu6UK_EpcAW3nUUwF1pdycwFcBY6AvDIo4eueRw>
 <xmx:Sng_X5Yr7n7Hb8I1yQDz12UH0KmptcQl472wAuQvFcY0WRLO-XyrBQ>
 <xmx:Sng_X6zTytvN_pw6hH0FlA5CldEhw5zqVeRK89jGEbqRfQG2rUtuSg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E86430600B1;
 Fri, 21 Aug 2020 03:31:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 04/25] efw-downloader: efw-proto: add responded signal
Date: Fri, 21 Aug 2020 16:30:50 +0900
Message-Id: <20200821073111.134857-5-o-takashi@sakamocchi.jp>
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

GObject has a feature of 'signal'. It's emitted in event dispatcher
asynchronously to application which register own callback function in
advance.

This commit adds 'responded' GObject signal to handle data in response
frame. In future commit, the signal is emitted actually.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 .../src/efw-proto-sigs-marshal.list           |  1 +
 efw-downloader/src/efw-proto.c                | 32 +++++++++++++++++++
 efw-downloader/src/efw-proto.h                |  1 +
 efw-downloader/src/meson.build                |  8 +++++
 4 files changed, 42 insertions(+)
 create mode 100644 efw-downloader/src/efw-proto-sigs-marshal.list

diff --git a/efw-downloader/src/efw-proto-sigs-marshal.list b/efw-downloader/src/efw-proto-sigs-marshal.list
new file mode 100644
index 0000000..c489d58
--- /dev/null
+++ b/efw-downloader/src/efw-proto-sigs-marshal.list
@@ -0,0 +1 @@
+VOID:ENUM,UINT,UINT,UINT,POINTER,UINT
diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index a6a6055..6502957 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-3.0-or-later
 // Copyright (c) 2020 Takashi Sakamoto
 #include "efw-proto.h"
+#include "efw-proto-sigs-marshal.h"
 
 /**
  * SECTION:efw_proto
@@ -19,6 +20,12 @@ G_DEFINE_TYPE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
 #define EFW_RESP_ADDR           0xecc080000000ull
 #define EFW_MAX_FRAME_SIZE      0x200u
 
+enum efw_proto_sig_type {
+    EFW_PROTO_SIG_TYPE_RESPONDED = 1,
+    EFW_PROTO_SIG_COUNT,
+};
+static guint efw_proto_sigs[EFW_PROTO_SIG_COUNT] = { 0 };
+
 static void proto_finalize(GObject *obj)
 {
     EfwProto *self = EFW_PROTO(obj);
@@ -33,6 +40,31 @@ static void efw_proto_class_init(EfwProtoClass *klass)
     GObjectClass *gobject_class = G_OBJECT_CLASS(klass);
 
     gobject_class->finalize = proto_finalize;
+
+    /**
+     * EfwProto::responded:
+     * @self: A #EfwProto.
+     * @status: One of #HinawaSndEfwStatus.
+     * @seqnum: The sequence number of response.
+     * @category: The value of category field in the response.
+     * @command: The value of command field in the response.
+     * @frame: (array length=frame_size)(element-type guint32): The array with elements for
+     *         quadlet data of response for Echo Fireworks protocol.
+     * @frame_size: The number of elements of the array.
+     *
+     * When the unit transfers asynchronous packet as response for Fireworks protocol, and the
+     * process successfully reads the content of response from ALSA Fireworks driver, the
+     * #EfwProto::responded signal handler is called with parameters of the response.
+     */
+    efw_proto_sigs[EFW_PROTO_SIG_TYPE_RESPONDED] =
+        g_signal_new("responded",
+            G_OBJECT_CLASS_TYPE(klass),
+            G_SIGNAL_RUN_LAST,
+            0,
+            NULL, NULL,
+            efw_proto_sigs_marshal_VOID__ENUM_UINT_UINT_UINT_POINTER_UINT,
+            G_TYPE_NONE,
+            6, HINAWA_TYPE_SND_EFW_STATUS, G_TYPE_UINT, G_TYPE_UINT, G_TYPE_UINT, G_TYPE_POINTER, G_TYPE_UINT);
 }
 
 static void efw_proto_init(EfwProto *self)
diff --git a/efw-downloader/src/efw-proto.h b/efw-downloader/src/efw-proto.h
index b0e519d..fbd4366 100644
--- a/efw-downloader/src/efw-proto.h
+++ b/efw-downloader/src/efw-proto.h
@@ -7,6 +7,7 @@
 #include <glib-object.h>
 
 #include <libhinawa/fw_resp.h>
+#include <libhinawa/hinawa_enum_types.h>
 
 G_BEGIN_DECLS
 
diff --git a/efw-downloader/src/meson.build b/efw-downloader/src/meson.build
index b7992a2..ca894d9 100644
--- a/efw-downloader/src/meson.build
+++ b/efw-downloader/src/meson.build
@@ -20,6 +20,14 @@ headers = [
   'efw-proto.h',
 ]
 
+gnome = import('gnome')
+marshallers = gnome.genmarshal('efw-proto-sigs-marshal',
+  prefix: 'efw_proto_sigs_marshal',
+  sources: 'efw-proto-sigs-marshal.list',
+  stdinc: true,
+)
+sources += marshallers
+
 executable('efw-downloader',
   sources: sources + headers,
   dependencies: [
-- 
2.25.1

