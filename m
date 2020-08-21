Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D024CF62
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3C1167C;
	Fri, 21 Aug 2020 09:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3C1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995442;
	bh=1FNxYcdaZ2MqbmSfb6XXlvjUmLr5I0McuKwPUpDAQ68=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnuUU6d8w2lC9QbZ5++nJbz0aAFmLYRRdaNY00Ww9rFw6AsVF8QHXtlgcn+Zw5e9y
	 /8Fr1YsGmdc7x5+uFnjFdNFBeVhx4kIKesAPBt/8CQ+ve+q8QvUXxorCnutHf3nXdd
	 JGcZCpQG0AGeUATrG5do8mnx4ytL9tCNOGeyBvmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE975F80218;
	Fri, 21 Aug 2020 09:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEB30F802F9; Fri, 21 Aug 2020 09:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65FBBF80260
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65FBBF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B8wYT3eY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nRY9f26B"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A29B22E3;
 Fri, 21 Aug 2020 03:31:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=CO1en39JIi6Uz
 AIoH2m+sP93P2k6nrsw1RLmt6kL1wY=; b=B8wYT3eYpaxIukigq8St4HKqRL/qM
 Ie1+EwmgzTbvejof6UdtHHDdLxpeHaziBfUM6WHvsDZMrf1bGgmwtZ09AYxnsTG4
 NdziSwLkiyQEEjPuLIDT8THtBUvbpq4Y+Cl92O1fGUfHow3kRS/oJhAP/aRlw6HP
 iZ3nr1AjAnGL58+vFg0+sFEpVllyg9Ej/BnVjOzu2ZcBg+r057fSucT1ywEm/k51
 M5J0ldcd/J3xQsdX/HQ2w8LTEsVEllk9/qqxLYOyTcJdSImFhxCO6KWE/0cJDlyJ
 ZUQ4S6nZ3WZ/x7ALhoVX1ZL1nCLefhJb3pz4WwdKY6ZXZBNhce+YsZ4ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CO1en39JIi6UzAIoH2m+sP93P2k6nrsw1RLmt6kL1wY=; b=nRY9f26B
 3KrbdBHdoxGZNc3ZZC7cXW7sAlrzBptzYZl6/p3QIFoBC4btwxzV4G3lICSt1bl2
 FpiOkg/Rw8b+mgXtR7ZTUV+gpKoOMLY8FjB76xDR4fVmrexagKBvyQ7NPmN391Vd
 Dh2/6VtXHD2zhpaTOSl8ZTZp6jao10mSLodbtMoZZT3DfgDuIJb/hCx1glGvk5bu
 l+2BUlsSng/f5U2/qm9iRc1lOxOruSjcfw4Fx33cj7UK2QT79SxbTWH3vw0vqqpZ
 NI7t/HEEukdSL8PtTwNrJfCpcxEOvEwBUc+xbJt2Lu8aZyM/acx2AeJV1X16lhkn
 +4WaCXLhyFVdQQ==
X-ME-Sender: <xms:T3g_X1WuLE4kfJgkDhFx0spI1lSVkowjmVkq7iTUIp_bhcqWZ-bgew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:T3g_X1m0-CFWBwpPzO6DWBR-MMV__ohDnU0l2pWNctypCCcQKr-sgA>
 <xmx:T3g_XxYYWVBb3f-6U9G0d9g8frWTqVev58lgKfuAnbp14wjpmKeL2A>
 <xmx:T3g_X4Vxvs7y-GTFUoSoR09Y4kshFsFZJatWdbt9ifGDKkC-OWFrrg>
 <xmx:T3g_X3tIng1uOvvVnhIuCp_Qttf9fUkpjWcy4kr5U5kxCnP0XpR6kA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id EAAA830600B1;
 Fri, 21 Aug 2020 03:31:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 07/25] efw-downloader: efw-proto: emit responded signal at
 receiving response
Date: Fri, 21 Aug 2020 16:30:53 +0900
Message-Id: <20200821073111.134857-8-o-takashi@sakamocchi.jp>
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

HinawaFwResp has class virtual method for applications to handle received
frame on 1394 OHCI controller by overriding the method with own function
implementation.

This commit overrides the class virtual method and emits 'responded'
signal with the data of received response frame. The content of frame
is aligned to host-endianness, then passed to signal handlers.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/efw-proto.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index 72959ac..bef81b3 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -3,6 +3,8 @@
 #include "efw-proto.h"
 #include "efw-proto-sigs-marshal.h"
 
+#include <sound/firewire.h>
+
 /**
  * SECTION:efw_proto
  * @Title: EfwProto
@@ -38,12 +40,16 @@ static void proto_finalize(GObject *obj)
     G_OBJECT_CLASS(efw_proto_parent_class)->finalize(obj);
 }
 
+static HinawaFwRcode proto_handle_response(HinawaFwResp *resp, HinawaFwTcode tcode);
+
 static void efw_proto_class_init(EfwProtoClass *klass)
 {
     GObjectClass *gobject_class = G_OBJECT_CLASS(klass);
 
     gobject_class->finalize = proto_finalize;
 
+    HINAWA_FW_RESP_CLASS(klass)->requested = proto_handle_response;
+
     /**
      * EfwProto::responded:
      * @self: A #EfwProto.
@@ -126,3 +132,40 @@ void efw_proto_unbind(EfwProto *self)
 
     g_free(priv->buf);
 }
+
+static HinawaFwRcode proto_handle_response(HinawaFwResp *resp, HinawaFwTcode tcode)
+{
+    EfwProto *self = EFW_PROTO(resp);
+    EfwProtoPrivate *priv = efw_proto_get_instance_private(self);
+    const guint8 *req_frame = NULL;
+    gsize length = 0;
+    const struct snd_efw_transaction *frame;
+    guint status;
+    guint seqnum;
+    guint category;
+    guint command;
+    guint param_count;
+    int i;
+
+    hinawa_fw_resp_get_req_frame(resp, &req_frame, &length);
+    if (length < sizeof(*frame))
+        return HINAWA_FW_RCODE_DATA_ERROR;
+    frame = (const struct snd_efw_transaction *)req_frame;
+
+    status = GUINT32_FROM_BE(frame->status);
+    if (status > HINAWA_SND_EFW_STATUS_BAD_PARAMETER)
+        status = HINAWA_SND_EFW_STATUS_BAD;
+
+    seqnum = GUINT32_FROM_BE(frame->seqnum);
+    category = GUINT32_FROM_BE(frame->category);
+    command = GUINT32_FROM_BE(frame->command);
+    param_count = GUINT32_FROM_BE(frame->length) - sizeof(*frame) / sizeof(guint32);
+
+    for (i = 0; i < param_count; ++i)
+        priv->buf[i] = GUINT32_FROM_BE(frame->params[i]);
+
+    g_signal_emit(self, efw_proto_sigs[EFW_PROTO_SIG_TYPE_RESPONDED], 0,
+                  status, seqnum, category, command, priv->buf, param_count);
+
+    return HINAWA_FW_RCODE_COMPLETE;
+}
-- 
2.25.1

