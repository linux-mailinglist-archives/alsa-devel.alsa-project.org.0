Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5E24CF57
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81AF1686;
	Fri, 21 Aug 2020 09:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81AF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995301;
	bh=eZaL1CatvTHWznqV742+LRhjRj4c5Mbt5WbqdEvo2Ck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tnpaF+djj9Y09DV5JJIe+3Um4bcggkZnYpV9nKN3CD82yWi7yn1PSHa7l8ctXu9xv
	 EIEwO80N295Y0Hcd/nJoY1peFMJgzfTwnsgXuEy/R3BjRb/W4NIQsJVfFetVH+Mac3
	 phIIzS5wG44oCW9nzJwdEMYsVrDf8/JbPkPk8b8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E99F802F8;
	Fri, 21 Aug 2020 09:31:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 199E1F802E9; Fri, 21 Aug 2020 09:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F36F80255
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F36F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NvyF0vRd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j0kiJ2uT"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1D2BB338;
 Fri, 21 Aug 2020 03:31:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fA4cTsRV7fXvW
 LR7nLE/higt9EkmbireVuRQmBQEbV4=; b=NvyF0vRdyXSuFEmPsGN11VdEKQ2NB
 IGG31bfxGTP3iMtQxdfjlsrA6hcYk1IW+zWWetE5MdV+zN3yHTZ/bwX+4bFR/hzQ
 QRLu3maGFi+nJKn49lM7Chwu7w7UYrd082nIGzwV+6D0eakvmSaDhSS7xsV5KEIl
 GwO0llumUe7lC65Q/xbgvone0oRoJlQ6MwvcorRtym8DcOIFo+s5h2XqbjIIRVyG
 CzADA7q5uuZVe+L/5diKeFxxieBNzK+dor3xlqx6JJesvzCNSADLCIChoSQI3Oys
 PjP25kJl560IjjI0ptd60Tz70WwqF1xS6Y81CH0oxpziJRU+xCvZh9DDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fA4cTsRV7fXvWLR7nLE/higt9EkmbireVuRQmBQEbV4=; b=j0kiJ2uT
 xNyfTfcJMfMBp9qm4S2K+nTufOKzpEeqEuVfgMwe0nDnq11p9QhQesY4p99EsjrY
 0BvahsEZJ6+M15P8KRBzD7O8Jfg9NK/L2H2mWXJwJDpWBdB3RnyI8lcQoO+dq3S3
 U3Jp92SnJaWjZNzD6chQP10QrM+utnLasHFImrUvyxeIRzeRmFVnV36SON6Y/CNx
 Nml/33CwKmjGOoZUrCXlC7P+I9Tqtuez+lcR++dc6yU6+hWXatdmR6paIoFqBWyF
 gsPsAt0x8n/uYY+oUt1dnYIGTZtTjeEpW3WbSjEiSBJDVAkeJ9rveVGwvXAU7JRu
 ffGCw420rto63A==
X-ME-Sender: <xms:TXg_X3waZdwc5XAiFrC0rBosl7ByQqVTBTd7cPxCkCQciyCcYYrh4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:TXg_X_TKHeePrfAgBHULwfAnK8-M-IO2ZRvkbyhnFxH_-tOj9kT56w>
 <xmx:TXg_XxX6VtRKjJkV6x9tPPV0vIobG3x9NFX1rHZxCGxaugq6Im5_FQ>
 <xmx:TXg_XxjF9pP_eEiEfcSomYihoVMKBlresAJr_k6LR1bKQK2O4K_7AQ>
 <xmx:TXg_X25bCNcp1ID65zQ2_4Y4zDdOZvdEue0w7JQfAoyCzidsVuiE9A>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BF2330600B4;
 Fri, 21 Aug 2020 03:31:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 06/25] efw-downloader: efw-proto: add instance private
 structure
Date: Fri, 21 Aug 2020 16:30:52 +0900
Message-Id: <20200821073111.134857-7-o-takashi@sakamocchi.jp>
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

GObject allows instance to have private data.

This commit adds private structure to EfwProto instance.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/efw-proto.c | 17 ++++++++++++++++-
 efw-downloader/src/efw-proto.h |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index 72b7655..72959ac 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -15,7 +15,10 @@
  * command to a certain address region on 1394 OHCI controller. The instance of #EfwProto reserves
  * the address region at call of #efw_proto_bind(), releases at call of #efw_proto_unbind().
  */
-G_DEFINE_TYPE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
+struct _EfwProtoPrivate {
+    guint32 *buf;
+};
+G_DEFINE_TYPE_WITH_PRIVATE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
 
 #define EFW_RESP_ADDR           0xecc080000000ull
 #define EFW_MAX_FRAME_SIZE      0x200u
@@ -94,9 +97,16 @@ EfwProto *efw_proto_new()
  */
 void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error)
 {
+    EfwProtoPrivate *priv;
+
     g_return_if_fail(EFW_IS_PROTO(self));
+    priv = efw_proto_get_instance_private(self);
 
     hinawa_fw_resp_reserve(HINAWA_FW_RESP(self), node, EFW_RESP_ADDR, EFW_MAX_FRAME_SIZE, error);
+    if (*error != NULL)
+        return;
+
+    priv->buf = g_malloc0(EFW_MAX_FRAME_SIZE);
 }
 
 /**
@@ -107,7 +117,12 @@ void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error)
  */
 void efw_proto_unbind(EfwProto *self)
 {
+    EfwProtoPrivate *priv;
+
     g_return_if_fail(EFW_IS_PROTO(self));
+    priv = efw_proto_get_instance_private(self);
 
     hinawa_fw_resp_release(HINAWA_FW_RESP(self));
+
+    g_free(priv->buf);
 }
diff --git a/efw-downloader/src/efw-proto.h b/efw-downloader/src/efw-proto.h
index fdbcbc8..bc179dc 100644
--- a/efw-downloader/src/efw-proto.h
+++ b/efw-downloader/src/efw-proto.h
@@ -27,9 +27,12 @@ G_BEGIN_DECLS
 
 typedef struct _EfwProto            EfwProto;
 typedef struct _EfwProtoClass       EfwProtoClass;
+typedef struct _EfwProtoPrivate     EfwProtoPrivate;
 
 struct _EfwProto {
     HinawaFwResp parent_instance;
+
+    EfwProtoPrivate *priv;
 };
 
 struct _EfwProtoClass {
-- 
2.25.1

