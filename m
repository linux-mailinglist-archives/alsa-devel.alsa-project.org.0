Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E624CF56
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC1C844;
	Fri, 21 Aug 2020 09:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC1C844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995285;
	bh=XrZH+LLb4Xp6i3fKT5dN7dzSnnRsamf2oncPMnSy/q8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZwVbCrOdRBBJcf2uTadoQy4CAp7KnfmDg48wUgGhN6oTU4ryxBNbqbNBWeAkBCj6
	 Wj+g+8SU3800eBsN7tdTNRaaF2sZOgPejlD6r5pP7Gqx5ka1VNCvbxwW1ChT+kJ6lr
	 vvYyKBTj8NOmPbAEecPVr88d3/IaqAjaWMxT7KgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49574F802E7;
	Fri, 21 Aug 2020 09:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62649F802EA; Fri, 21 Aug 2020 09:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4924F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4924F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nc/DRFEz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YcFUHwXg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 701C6839;
 Fri, 21 Aug 2020 03:31:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cvkhDFrmVXOO0
 NlRW+1FPGG5nVNKOzj8jgWingxFv4I=; b=nc/DRFEzhYXSWhsTgB82e5r3Elj+n
 2DfgmuSbQkIwY5BzI+NXFoThHk2WZ6hX3B6e3xy454b1d+jgfpAnvQPV84MFu9iT
 BtgpgrHp5yYx2tGiUwCV1jukHudDXHmdEiqrjpsq64BXKdUdCWUdXvzEEYZeYSnC
 LtPBiEQ43DWvZortk4sRk6pUt0R2x2lfcNyszoWqavRsg1LYaBU6qFtfGxBBPeGu
 NG+lGqMbzA9sWQHB88If52wciQ2mR0Ohf+2HVra9yt+VdKz7l5D5pIhi3/Zx4zH2
 WTDC/z3Gvbi9mVkRH94yV6+ctDtxiufE8ZAFsy9HB6DM1NelQqsCJ3CgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cvkhDFrmVXOO0NlRW+1FPGG5nVNKOzj8jgWingxFv4I=; b=YcFUHwXg
 fjDE0YUY9/UwA71Fnbm0TlJ8WTPKDLvm7/ztvdQEEFeAWW+Bhl71n6jZGMgWCYbm
 4h1bpXuYN6CioXYglBDYfFqeTXJIf/lSCuCU2bjMZxn9vm6U+Fh44nEbxs2wDNBs
 tTEDsVyuETZ0P763iw1Oehdjwv5Uu+pTyc53OXDHxEKCbah6iQZlF4b3sAAH1ucY
 kKevwVEFqbPSUzVMZMvRfbjytw9i7ud1Qqnkzpakqb9sqa5IgnQqqBlv+KLEukmI
 mCW/oxR1R/CFlfhJe30HDsgs0FdkTWnqHviUr3YXIeYuyzdZasdaanL8/uI+HBOJ
 +1pJ0O5hAbMzBg==
X-ME-Sender: <xms:SHg_XzesoJgE2JsADJgLcTvbgwl3J824bXo8CL-A7ksxzkHtivffTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:SHg_X5PZzBMJsjzwk-wmr3w34D6eC4Ckjm7RleVnE71n3nOD2K4dLw>
 <xmx:SHg_X8gNl36ePGUvM2CFdwoHtitm1Ucgba3wEcaSfALokBxy6Cpb_Q>
 <xmx:SHg_X0_69QXan6ha2WhrdnU54DSnHc-W083P-Om2ral_N-CL1A0bTg>
 <xmx:SXg_X4Vg7uTMpKY9kKgdUmpNyoNXaujJluMPGq3z2xchU3H82oGrSw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A049130600B4;
 Fri, 21 Aug 2020 03:31:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 03/25] efw-downloader: efw-proto: add constructor, destructor,
 bind, unbind functions
Date: Fri, 21 Aug 2020 16:30:49 +0900
Message-Id: <20200821073111.134857-4-o-takashi@sakamocchi.jp>
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

In Fireworks protocol, response frame from target device arrives at offset
0xecc080000000 on 1394 OHCI controller and the maximum size is 0x200U. It
seems to be inspired by Function Control Protocol in IEC 61883-1.

This commit adds functions to construct and destruct the instance of
EfwProto object, to bind and unbind the Fireworks protocol to the the given
instance of HinawaFwNode. When calling the bind function, the instance
requests Linux firewire subsystem to allocate the range of address.
It's possible to encounter conflict in the case that the range of address
is also allocated by ALSA fireworks driver, thus this tool can not be used
when the driver is loaded.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/src/efw-proto.c | 62 ++++++++++++++++++++++++++++++++--
 efw-downloader/src/efw-proto.h |  5 +++
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/efw-downloader/src/efw-proto.c b/efw-downloader/src/efw-proto.c
index 63fd2c5..a6a6055 100644
--- a/efw-downloader/src/efw-proto.c
+++ b/efw-downloader/src/efw-proto.c
@@ -9,17 +9,73 @@
  * @include: fw_fcp.h
  *
  * Fireworks board module from Echo Digital Audio corporation supports specific protocol based on
- * a pair of asynchronous transactions in IEEE 1394 bus. The EfwProto class is an implementation
- * for the protocol.
+ * a pair of asynchronous transactions in IEEE 1394 bus for command and response. The #EfwProto class
+ * is an implementation for the protocol. The Fireworks device transfers response against the
+ * command to a certain address region on 1394 OHCI controller. The instance of #EfwProto reserves
+ * the address region at call of #efw_proto_bind(), releases at call of #efw_proto_unbind().
  */
 G_DEFINE_TYPE(EfwProto, efw_proto, HINAWA_TYPE_FW_RESP)
 
+#define EFW_RESP_ADDR           0xecc080000000ull
+#define EFW_MAX_FRAME_SIZE      0x200u
+
+static void proto_finalize(GObject *obj)
+{
+    EfwProto *self = EFW_PROTO(obj);
+
+    efw_proto_unbind(self);
+
+    G_OBJECT_CLASS(efw_proto_parent_class)->finalize(obj);
+}
+
 static void efw_proto_class_init(EfwProtoClass *klass)
 {
-    return;
+    GObjectClass *gobject_class = G_OBJECT_CLASS(klass);
+
+    gobject_class->finalize = proto_finalize;
 }
 
 static void efw_proto_init(EfwProto *self)
 {
     return;
 }
+
+/**
+ * efw_proto_new:
+ *
+ * Instantiate and return #EfwProto object.
+ *
+ * Returns: An instance of #EfwProto.
+ */
+EfwProto *efw_proto_new()
+{
+    return g_object_new(EFW_TYPE_PROTO, NULL);
+}
+
+/**
+ * efw_proto_bind:
+ * @self: A #EfwProto.
+ * @node: A #HinawaFwNode.
+ * @error: A #GError. The error can be generated with domain of #hinawa_fw_node_error_quark().
+ *
+ * Bind to Fireworks protocol for communication to the given node.
+ */
+void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error)
+{
+    g_return_if_fail(EFW_IS_PROTO(self));
+
+    hinawa_fw_resp_reserve(HINAWA_FW_RESP(self), node, EFW_RESP_ADDR, EFW_MAX_FRAME_SIZE, error);
+}
+
+/**
+ * efw_proto_unbind:
+ * @self: A #EfwProto.
+ *
+ * Unbind from Fireworks protocol.
+ */
+void efw_proto_unbind(EfwProto *self)
+{
+    g_return_if_fail(EFW_IS_PROTO(self));
+
+    hinawa_fw_resp_release(HINAWA_FW_RESP(self));
+}
diff --git a/efw-downloader/src/efw-proto.h b/efw-downloader/src/efw-proto.h
index 83e52be..b0e519d 100644
--- a/efw-downloader/src/efw-proto.h
+++ b/efw-downloader/src/efw-proto.h
@@ -35,6 +35,11 @@ struct _EfwProtoClass {
     HinawaFwRespClass parent_class;
 };
 
+EfwProto *efw_proto_new();
+
+void efw_proto_bind(EfwProto *self, HinawaFwNode *node, GError **error);
+void efw_proto_unbind(EfwProto *self);
+
 G_END_DECLS
 
 #endif
-- 
2.25.1

