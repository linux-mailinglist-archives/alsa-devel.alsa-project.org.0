Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93C3225D
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A3BF1695;
	Sun,  2 Jun 2019 09:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A3BF1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459738;
	bh=P6fNsNXrTb3Mdhsz1WCAmx5CaIUs+InpgR0MdTPouKQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYlvK2ryL0brjPjChGHyBFlLJP+KcTDG8O3+C7YM12/fPLR7j4snyGInlTaUdb1rc
	 S2GEwYyuKLrPNBijBocnkbGhZp16nB0bf5lIiqj+bSortwbmonBpW1phbe0UnjjD5V
	 TgrKLkk00wToFMZvdDqmv9kFhW+193taJzdiVpF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09372F896FE;
	Sun,  2 Jun 2019 09:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EC5FF896FE; Sun,  2 Jun 2019 09:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CADF80CC4
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CADF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pGOLdQjO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="V2W99xQN"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 855E221CFD;
 Sun,  2 Jun 2019 03:13:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jV3hbp/+4NoTs
 y43bHdYD3K6BsP7h71m+9lOuMoXjTs=; b=pGOLdQjOumCHUWGCnxFduBDDc/G80
 XTGuThyXfljQU63nYczurfsIjVazUvIUVDsBY2g90fSJo6Uj/4v8/Y7QuAntyiuj
 sUFJUZ4zcqNfXyUdk80LO6aE42KAVF0Hfjj5UIbx11xQXKU9pN54LoxZxLCeibh9
 2dOmLIoo8LKYgz2Ni5BmiQ8FAklTOUd7ApjvEmat71SUqjELkHp0aBBOj4ktzpDS
 0uZ9Wi76ICIGWkY9HAR377+lJGKQg7bkpICTBE+9VtKHft/66huxzxzWzA+wggHA
 1zWrnvXkWrTGnsM31QtHIQtKJO428PsmNL+TSZ6dEkHWtSyTPBQWUeDMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jV3hbp/+4NoTsy43bHdYD3K6BsP7h71m+9lOuMoXjTs=; b=V2W99xQN
 sjfLxIBGHDt5WIqhZhhJdttfM0A8fbrbOYGq7zjvNntGu6n6P1HGHeqshqMZ2J7s
 ZL6UQUtfV7JdOJMIc/letZYMGErI+q+bZbGJPbepLVIR6BpB3O2qHr9IFH7tpqYw
 YBAlqzQ4f0hFWLTGuKVrGu1dYZ1f1c/4Oljv838ixEE+hPSL27icakn5QWhFq7kg
 Hzmio9kOtmr4+Ku9gjBO3VK9SXzHaTJSAtXoJuzpssf4qKrt9XbGEIqEmXDzsgE7
 0rmjmhHpE7+4MT1F9L5N6L6nPSqqgsjhv1AgU6LifrdWpd3N8fONiFQzI3uKJYjY
 Gy3CICwJeWjhRQ==
X-ME-Sender: <xms:AnfzXNokzkweVNT7EO1vUq8YVbkQMMGFU0FJWSjQXaVoAqW8WyCk0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AnfzXKB0SozRmgIkPdtk3UYJIiEyznaZ47WQ6HXQoa1F45DURQFEjA>
 <xmx:AnfzXFzp1H-L0jepOmwQm24gTNdN_yNdFfK88FFfis-OPw-3l9lvsg>
 <xmx:AnfzXC6_v-15d46G82lI-eWtO3Lo3CRETCYSNP6M0weQfUNOB1mrHA>
 <xmx:AnfzXPviKvsTq9YinHlDjShMsLej2mm8XahUjcJ7rc3fmWBdBqYSxw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B72C80060;
 Sun,  2 Jun 2019 03:13:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:45 +0900
Message-Id: <20190602071259.21622-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/15] ALSA: firewire-tascam: code refactoring
	for registration of isochronous channels
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit is a part of preparation to perform allocation/release
of isochronous channels in pcm.hw_params/hw_free callbacks.

The registration of isochronous channels is done just after allocation
of isochronous resources. This commit separates the registration just
before starting packet streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 84 +++++++++++++--------------
 1 file changed, 40 insertions(+), 44 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index f1657a4e0621..7cddd9ece4ee 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -195,6 +195,19 @@ static void finish_session(struct snd_tscm *tscm)
 			   TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_RX_ON,
 			   &reg, sizeof(reg), 0);
 
+	// Unregister channels.
+	reg = cpu_to_be32(0x00000000);
+	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+			   TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_TX_CH,
+			   &reg, sizeof(reg), 0);
+	reg = cpu_to_be32(0x00000000);
+	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+			   TSCM_ADDR_BASE + TSCM_OFFSET_UNKNOWN,
+			   &reg, sizeof(reg), 0);
+	reg = cpu_to_be32(0x00000000);
+	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+			   TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_RX_CH,
+			   &reg, sizeof(reg), 0);
 }
 
 static int begin_session(struct snd_tscm *tscm)
@@ -202,6 +215,30 @@ static int begin_session(struct snd_tscm *tscm)
 	__be32 reg;
 	int err;
 
+	// Register the isochronous channel for transmitting stream.
+	reg = cpu_to_be32(tscm->tx_resources.channel);
+	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_TX_CH,
+				 &reg, sizeof(reg), 0);
+	if (err < 0)
+		return err;
+
+	// Unknown.
+	reg = cpu_to_be32(0x00000002);
+	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 TSCM_ADDR_BASE + TSCM_OFFSET_UNKNOWN,
+				 &reg, sizeof(reg), 0);
+	if (err < 0)
+		return err;
+
+	// Register the isochronous channel for receiving stream.
+	reg = cpu_to_be32(tscm->rx_resources.channel);
+	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_RX_CH,
+				 &reg, sizeof(reg), 0);
+	if (err < 0)
+		return err;
+
 	reg = cpu_to_be32(0x00000001);
 	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
 				 TSCM_ADDR_BASE + TSCM_OFFSET_START_STREAMING,
@@ -216,7 +253,7 @@ static int begin_session(struct snd_tscm *tscm)
 	if (err < 0)
 		return err;
 
-	/* Set an option for unknown purpose. */
+	// Set an option for unknown purpose.
 	reg = cpu_to_be32(0x00002000);
 	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
 				 TSCM_ADDR_BASE + TSCM_OFFSET_SET_OPTION,
@@ -224,7 +261,7 @@ static int begin_session(struct snd_tscm *tscm)
 	if (err < 0)
 		return err;
 
-	/* Start multiplexing PCM samples on packets. */
+	// Start multiplexing PCM samples on packets.
 	reg = cpu_to_be32(0x00000001);
 	return snd_fw_transaction(tscm->unit,
 				  TCODE_WRITE_QUADLET_REQUEST,
@@ -234,30 +271,13 @@ static int begin_session(struct snd_tscm *tscm)
 
 static void release_resources(struct snd_tscm *tscm)
 {
-	__be32 reg;
-
-	/* Unregister channels. */
-	reg = cpu_to_be32(0x00000000);
-	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-			   TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_TX_CH,
-			   &reg, sizeof(reg), 0);
-	reg = cpu_to_be32(0x00000000);
-	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-			   TSCM_ADDR_BASE + TSCM_OFFSET_UNKNOWN,
-			   &reg, sizeof(reg), 0);
-	reg = cpu_to_be32(0x00000000);
-	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-			   TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_RX_CH,
-			   &reg, sizeof(reg), 0);
-
-	/* Release isochronous resources. */
+	// Release isochronous resources.
 	fw_iso_resources_free(&tscm->tx_resources);
 	fw_iso_resources_free(&tscm->rx_resources);
 }
 
 static int keep_resources(struct snd_tscm *tscm, unsigned int rate)
 {
-	__be32 reg;
 	int err;
 
 	/* Keep resources for in-stream. */
@@ -280,30 +300,6 @@ static int keep_resources(struct snd_tscm *tscm, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/* Register the isochronous channel for transmitting stream. */
-	reg = cpu_to_be32(tscm->tx_resources.channel);
-	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_TX_CH,
-				 &reg, sizeof(reg), 0);
-	if (err < 0)
-		goto error;
-
-	/* Unknown */
-	reg = cpu_to_be32(0x00000002);
-	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 TSCM_ADDR_BASE + TSCM_OFFSET_UNKNOWN,
-				 &reg, sizeof(reg), 0);
-	if (err < 0)
-		goto error;
-
-	/* Register the isochronous channel for receiving stream. */
-	reg = cpu_to_be32(tscm->rx_resources.channel);
-	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 TSCM_ADDR_BASE + TSCM_OFFSET_ISOC_RX_CH,
-				 &reg, sizeof(reg), 0);
-	if (err < 0)
-		goto error;
-
 	return 0;
 error:
 	release_resources(tscm);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
