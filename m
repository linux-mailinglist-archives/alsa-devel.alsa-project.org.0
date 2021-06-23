Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CA3B155F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B6DF167E;
	Wed, 23 Jun 2021 10:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B6DF167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435451;
	bh=WLOrkjQnDtj0gioStvNhO9QkhCqMiaK4wqcEJPlY52U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mir1dmEvabxi/DkYa7b61PLOAt58+pIQV7UFq2X59iIv1ucoZ3Z6LUfizGqeOFM5E
	 4IPFuFvtog14f+LfWgDCRUPydqmpZ8/tTJvgqBx6qFoIL8f7Kmy8HbZFAO2VTByu2f
	 QuvccO144zJTTnbpLPxdNwQPWTfmNy9DtPcvxvcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE242F8016B;
	Wed, 23 Jun 2021 10:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8830F800B5; Wed, 23 Jun 2021 10:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B5D0F8016B
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 10:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5D0F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="x5SUrStn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GEgUFmwR"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5CDF310CB;
 Wed, 23 Jun 2021 04:00:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 04:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wEz1U8uSpYMst
 cUi949swWU0DVoPNO8nkou+azSgQ3Y=; b=x5SUrStnOkoZ8K/8K/N5pjbrSq1kc
 cMZ2JrQWBNcKfAY36QcRD6XSAFYMZRkPl0UZTJdfs3/p/kZXGQo0MHajVpa6/Doh
 rq4XgCvNrhnPIqrqyE4iOaOmcAForqZhYmZWat+T5aoGyqM1b6GmKNW1frTXp+H7
 PfJxO91RdHX6Ism3sx9mz/CWQYvq8h3gqBRlvdvJUYSRRDD9bKJdUEZk07Vj65Wi
 TIII9k+a7u48SxM2q9WoLCc9MONnsXHmM5Cc+cFPOikMjlZdEfv/mQAqXkDAOZE6
 1wJaLb7qM9hXYCvvehKmzUaxgjxLpvCzSaJQTCDqzrBsKgB3IB4ZcDA7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wEz1U8uSpYMstcUi949swWU0DVoPNO8nkou+azSgQ3Y=; b=GEgUFmwR
 nxj+iw9pYTQRhs6FxFA48M+A19GUODZc9ztrP+1O3RcaYg/j3LiGMENZK871A8Kl
 YliaaDB6FY0+rLM2WUNAMBmz+101sCEBt1QFtO72qWU7MSa1nGDhPGanU4m4A0mL
 TzRsKAGOfxzLSDyCp7lAHCWfqyUS6FpGfQJsykphUgEl1hEI4+hb3cIzS4b0CW7g
 ILRu3dyuwdegEy/yEfCSSnpf95CNgaTz+vPi8VZGFG9cfgckJmdA1gu+x0Xj6gN4
 lvcPEVQhps64Jgl6764BtScEwAb/mh+68JQYeAykE7iXk3ijCiFL9g4DcIgT2sRo
 eI8eIDbOCWL7Yg==
X-ME-Sender: <xms:AerSYFbcWoNtt36iGAYzGx73cT2z0mo5hPDTcDn3bcAhmp3-MCk0Mg>
 <xme:AerSYMYw44owEnFE3ELpCFdt1bHuMvus8vtUNt50zGpS6LAxQ8tRUcbH1Cf_3-Q5r
 8IdPg15fJC_l9Eskl0>
X-ME-Received: <xmr:AerSYH8AduLdxUW4m-vmqty46zEGdcjz0er1wl8mLsooFW-0YFHO-8-paQFV0HSu1S__wFqS85Goc39QVtDPLgmbGhIqXc_Vy_qt5xU4Rq-VmCL14DoV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:AerSYDq8p0yz4ZpIsob9d_pva5Qc7kp1aqnWoJo0SUR50yTuskUQ8Q>
 <xmx:AerSYAoFQ2RNLAvXDyZYvsDqzfHSW2oCKbO_nfaklK_Z3C40PhVZoA>
 <xmx:AerSYJS9Lrn-oTzok_6SvHWS1zKAEXF6wVssioY9y9eA36kUhImbTw>
 <xmx:AurSYNBUQGVRktmsY74IRMCGxWcqqGHLXv46UlNW2JuGeMjKgkprXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 04:00:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 7/9] ALSA: firewire-motu: use macro instead of magic number
 for clock source in v3 protocol
Date: Wed, 23 Jun 2021 16:59:39 +0900
Message-Id: <20210623075941.72562-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
References: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

This commit adds a series of macro for source of sampling clock in
version 3 protocol.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index ab113651107b..56e4504e7ec9 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -13,6 +13,12 @@
 #define  V3_CLOCK_RATE_MASK		0x0000ff00
 #define  V3_CLOCK_RATE_SHIFT		8
 #define  V3_CLOCK_SOURCE_MASK		0x000000ff
+#define   V3_CLOCK_SRC_INTERNAL		0x00
+#define   V3_CLOCK_SRC_WORD_ON_BNC	0x01
+#define   V3_CLOCK_SRC_SPH		0x02
+#define   V3_CLOCK_SRC_SPDIF_ON_COAX	0x10
+#define   V3_CLOCK_SRC_OPT_IFACE_A	0x18
+#define   V3_CLOCK_SRC_OPT_IFACE_B	0x19
 
 #define V3_OPT_IFACE_MODE_OFFSET	0x0c94
 #define  V3_ENABLE_OPT_IN_IFACE_A	0x00000001
@@ -111,20 +117,20 @@ int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
 	data = be32_to_cpu(reg) & V3_CLOCK_SOURCE_MASK;
 
 	switch (data) {
-	case 0x00:
+	case V3_CLOCK_SRC_INTERNAL:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 		break;
-	case 0x01:
+	case V3_CLOCK_SRC_WORD_ON_BNC:
 		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
 		break;
-	case 0x02:
+	case V3_CLOCK_SRC_SPH:
 		*src = SND_MOTU_CLOCK_SOURCE_SPH;
 		break;
-	case 0x10:
+	case V3_CLOCK_SRC_SPDIF_ON_COAX:
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		break;
-	case 0x18:
-	case 0x19:
+	case V3_CLOCK_SRC_OPT_IFACE_A:
+	case V3_CLOCK_SRC_OPT_IFACE_B:
 	{
 		__be32 reg;
 		u32 options;
@@ -135,7 +141,7 @@ int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
 			return err;
 		options = be32_to_cpu(reg);
 
-		if (data == 0x18) {
+		if (data == V3_CLOCK_SRC_OPT_IFACE_A) {
 			if (options & V3_NO_ADAT_OPT_IN_IFACE_A)
 				*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_A;
 			else
-- 
2.30.2

