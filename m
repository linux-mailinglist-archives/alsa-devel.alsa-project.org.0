Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D93B1563
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1589846;
	Wed, 23 Jun 2021 10:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1589846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435492;
	bh=NrIRB5hbWvNe4rws55gqe50YZS2IW0tjQdgyuC9VulE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CxAiPtya/9ERHH1bXnH7QgpFMRxPA4R42Nw2MauyHwFuO+M6OG0ZzAYN7/Gsqfhad
	 V6DCfL7ybAY9rt7Kymv3DCGoaXbjGGD86UHTQPPaQ1JcZmrxx1cFOyU2pIhg8pPoUV
	 Gql64/3twv40QQLWFa1UCwQWuOEWRSRxeYXsirfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C06AF804FE;
	Wed, 23 Jun 2021 10:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF89F80290; Wed, 23 Jun 2021 10:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27A88F804D8
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 10:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A88F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="yjSKi1P2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bT6VZaA+"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6A1B510B6;
 Wed, 23 Jun 2021 04:00:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 04:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dJGhOpZB+MWwh
 4MZBe7ZBkYPSO0TEr90sHKwrNbIGA8=; b=yjSKi1P2N08d0gf/AWf02pKBAevpX
 pa5YxMN0bzVZ/8/OTKtKuzFqsxl9exZQpXqNa/QcGnbYYAZCcXSaGDfx+nYvD/Dr
 2yfS9t5ZrRQxbJnIUeCng+pf5tq0mAB0UTbmAtANjOjYYMBcQR05fV3MP/SDnCyt
 OAErnN2xCWm+7D9JdaJRWFxLEw+0fcZkuOcBAyqDI2fTXIhymHe86y9S+iGxrlEk
 Nf5v1oJzKfgEnqF9MNJthmg5gkuSyktP9AHpvf/Lh40OikAXSeJj3Boxmk/qANvI
 r0XYecQ6Lb5rynsqv0KQ6LJ4zDz9g0HfEgVKIfuyW0leQlm9Crw5TcnfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dJGhOpZB+MWwh4MZBe7ZBkYPSO0TEr90sHKwrNbIGA8=; b=bT6VZaA+
 Y0ROOVABdBpiJuBIm+hPQOyM+i1hCy5qp4EeoxpgglW1ciLuPKjseLGIfX40tM1Y
 /DDaSX+hIjRD643TJsTPPaIuSfIIXUDv0RetqdetM3ASw3e9Ls6U4DttI8bZomYz
 lNzPOir6jCtG6CD44aeBoiBK7ObQy0Nfpogg9IFcZZETCsQ9DGrD6rt8ZTeda8Lf
 YNCWY8rDwK25B9pgDzhMFw6gogCBHC1WtBQHzVemstNO9V2VJYReJVQucJz8LDii
 1EOqeNRRpTUAyk7TfOCmx+f/I9XAZHGqDWYTYUkWgMZSIw25YHdfUjHl3N2KKXnC
 ipNugdiHSTAXzw==
X-ME-Sender: <xms:A-rSYKjBLYwH6ybSQ2u-ziQV1RPzF4VdENFDp109OwB-b4yPE5Mw-g>
 <xme:A-rSYLCATkpGv_z1FOFWZzfj8kBO4ZQIAAMIf56_IyQlz0xlHNmfJUGVQo2ApfeQ_
 BNTZE9s-zB0CXZDxCE>
X-ME-Received: <xmr:A-rSYCFDq2T6jKlTSOHZNueZ9lw0OfRbBzBxoCvBTtDLbN80uKmMYO9zAmORJSvCyVxgVrZYckIqpxQyNBzwAur7A5-DqoR6O89DxhNXwkbrlYpQzSxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:A-rSYDSnioB6YWCiq9PZyVnGWD0w98RiUPN5JrRSHKw_bE-iVWtpdA>
 <xmx:A-rSYHytdcUCyyuwD2_FN-ZMepEqnGxdJ-YxQSG_I-1VhBHx_a9E-w>
 <xmx:A-rSYB7iLsSmbIynI1rWsqLWE-fNiyNZbMIBRjriJflH6-s6BmNrRA>
 <xmx:BOrSYArlk0HZu48wutsfo7ikrItfNFTYmH9T1cJ8CoutVfH5olvg2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 04:00:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 8/9] ALSA: firewire-motu: fix register handling for 828
Date: Wed, 23 Jun 2021 16:59:40 +0900
Message-Id: <20210623075941.72562-9-o-takashi@sakamocchi.jp>
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

After further investigation, I find out some mistakes for 828 about its
register. This commit fixes it.

Fixes: d13d6b284d8b ("ALSA: firewire-motu: add support for MOTU 828")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v1.c | 53 +++++++++++++++++---------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v1.c b/sound/firewire/motu/motu-protocol-v1.c
index 65209e617e10..3b766615a9ee 100644
--- a/sound/firewire/motu/motu-protocol-v1.c
+++ b/sound/firewire/motu/motu-protocol-v1.c
@@ -19,7 +19,7 @@
 // 0x00004000: mode of optical output interface.
 //   0x00004000: for S/PDIF signal.
 //   0x00000000: disabled or for ADAT signal.
-// 0x00003f40: monitor input mode.
+// 0x00003f00: monitor input mode.
 //   0x00000800: analog-1/2
 //   0x00001a00: analog-3/4
 //   0x00002c00: analog-5/6
@@ -32,26 +32,32 @@
 //   0x00002d00: analog-6
 //   0x00003600: analog-7
 //   0x00003f00: analog-8
-//   0x00000040: disabled
+// 0x00000080: enable stream input.
+// 0x00000040: disable monitor input.
+// 0x00000008: enable main out.
 // 0x00000004: rate of sampling clock.
 //   0x00000004: 48.0 kHz
 //   0x00000000: 44.1 kHz
 // 0x00000023: source of sampling clock.
+//   0x00000003: source packet header (SPH)
 //   0x00000002: S/PDIF on optical/coaxial interface.
 //   0x00000021: ADAT on optical interface
 //   0x00000001: ADAT on Dsub 9pin
-//   0x00000000: internal or SMPTE
+//   0x00000000: internal
 
 #define CLK_828_STATUS_OFFSET				0x0b00
 #define  CLK_828_STATUS_MASK				0x0000ffff
 #define  CLK_828_STATUS_FLAG_OPT_IN_IFACE_IS_SPDIF	0x00008000
 #define  CLK_828_STATUS_FLAG_OPT_OUT_IFACE_IS_SPDIF	0x00004000
 #define  CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES		0x00000080
-#define  CLK_828_STATUS_FLAG_SRC_IS_NOT_FROM_ADAT_DSUB	0x00000020
-#define  CLK_828_STATUS_FLAG_OUTPUT_MUTE		0x00000008
+#define  CLK_828_STATUS_FLAG_ENABLE_OUTPUT		0x00000008
 #define  CLK_828_STATUS_FLAG_RATE_48000			0x00000004
-#define  CLK_828_STATUS_FLAG_SRC_SPDIF_ON_OPT_OR_COAX	0x00000002
-#define  CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT_OR_DSUB	0x00000001
+#define  CLK_828_STATUS_MASK_SRC			0x00000023
+#define   CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT		0x00000021
+#define   CLK_828_STATUS_FLAG_SRC_SPH			0x00000003
+#define   CLK_828_STATUS_FLAG_SRC_SPDIF			0x00000002
+#define   CLK_828_STATUS_FLAG_SRC_ADAT_ON_DSUB		0x00000001
+#define   CLK_828_STATUS_FLAG_SRC_INTERNAL		0x00000000
 
 // Status register for MOTU 896 (0x'ffff'f000'0b14).
 //
@@ -249,18 +255,29 @@ static int get_clock_source_828(struct snd_motu *motu, enum snd_motu_clock_sourc
 		return err;
 	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
 
-	if (data & CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT_OR_DSUB) {
-		if (data & CLK_828_STATUS_FLAG_SRC_IS_NOT_FROM_ADAT_DSUB)
-			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
-		else
-			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
-	} else if (data & CLK_828_STATUS_FLAG_SRC_SPDIF_ON_OPT_OR_COAX) {
+	switch (data & CLK_828_STATUS_MASK_SRC) {
+	case CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT:
+		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
+		break;
+	case CLK_828_STATUS_FLAG_SRC_SPH:
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
+		break;
+	case CLK_828_STATUS_FLAG_SRC_SPDIF:
+	{
 		if (data & CLK_828_STATUS_FLAG_OPT_IN_IFACE_IS_SPDIF)
-			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
-		else
 			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
-	} else {
+		else
+			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
+		break;
+	}
+	case CLK_828_STATUS_FLAG_SRC_ADAT_ON_DSUB:
+		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
+		break;
+	case CLK_828_STATUS_FLAG_SRC_INTERNAL:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
+		break;
+	default:
+		return -ENXIO;
 	}
 
 	return 0;
@@ -321,13 +338,13 @@ static int switch_fetching_mode_828(struct snd_motu *motu, bool enable)
 		return err;
 	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
 
-	data &= ~(CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_OUTPUT_MUTE);
+	data &= ~(CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_ENABLE_OUTPUT);
 	if (enable) {
 		// This transaction should be initiated after the device receives batch of packets
 		// since the device voluntarily mutes outputs. As a workaround, yield processor over
 		// 100 msec.
 		msleep(100);
-		data |= CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_OUTPUT_MUTE;
+		data |= CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_ENABLE_OUTPUT;
 	}
 
 	reg = cpu_to_be32(data);
-- 
2.30.2

