Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33233226E
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C001686;
	Sun,  2 Jun 2019 09:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C001686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460230;
	bh=F/u10/nUFl67MWe/D4rNi6Z1+NFY1YJFXH289yAKgpI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUDeyXxP+VM0Vm7IvZZc+Tx02E4Due8Th89eN20cEe4BAxefwSni/wHi9DkNGPlOM
	 SeM5gILLAWl25aeYQsW2/6WGq0JEVeFMUrQc6qN7zPmOlnVKteLh/XSl+GEdzqTMox
	 xl0VcNVA0QjVmE53XZ65KqdViU0faAzuXb5Bayd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C6CF8977C;
	Sun,  2 Jun 2019 09:13:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A248F89756; Sun,  2 Jun 2019 09:13:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD416F8974A
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD416F8974A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sdOpBUQt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GKzN/nr/"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE58B20F20;
 Sun,  2 Jun 2019 03:13:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RvsAcMEO45Jk6
 LNU1pjPGOaCCZ2zLlPdOIrW4c7fomo=; b=sdOpBUQtA1NzsmxGfJomY8S0r+kjQ
 GAUva5eZ683LZwchqnjf8gO9ajKrY69hanYgUFTOdBLTQyMDUfkiOpUMA5MoCdwT
 eJhM1DmT7SYbq0DoTucN8b4IzzyCweT2O84KpQW3sdyyKP3+0IXVl5we7V2JRluP
 UbRSGXuMA+j/9wdzviKUfDG+CyjU5TFljOsZdo7GqcbEUzCTiPXZA2POXvqqlIKk
 jRSVuFeq3enVQrFYa/0wSmW9jL3Y+3g/mvNhcAKIU+Igu50/INzDVjmIPvqwEvE3
 NhfpDbxiaEMINi39o9II84sJmDakgoAjgI/PI4zEvhjngjvVoFK0FmHZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RvsAcMEO45Jk6LNU1pjPGOaCCZ2zLlPdOIrW4c7fomo=; b=GKzN/nr/
 JjIqMtab9k6daZmIbEN+8EZxEqINagwuQ0/LnlvjYgHnoOW08mH7uao1ZKHQxg+i
 thOMhFjnVVFT8AHvVkzAZhIzbqVKk8LpGs0/qUKZ5v2bpSxU2hQcljExQX/8x5sK
 kIpEN0+l/ca2qt2hHPtriGX66uV5rUXF/dNJW3UZ+XjhfeEyVb4tuuQKzHHnetuo
 PL2K92Q6qrB8KYSUKD7NHH7prNt2e1F0ToQRQRKRKvaeniNWwt7oN+pw+Fwxg+sz
 SefXs9I7vKtSHnnzb1lH8NnxKYrhp5eeXpRcwm5PKIzBP9gZHIHqLMczY1ATs8yy
 SzxIXTnMdRanfA==
X-ME-Sender: <xms:FHfzXCbnElvbSGreb4Jy7abRa-bAJl2dJbTJMeamk_E0xpszr6qvjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:FHfzXK6uXxhxUnp3npaMas4LFE-5uO2qhrEC-L4LhszqIG_Ojs9o6Q>
 <xmx:FHfzXFRLMKYSWQ3rhJpGdfJLuqUaj8_r2zw1z3UZeRgLnsRyfSvbxg>
 <xmx:FHfzXCtKZAs1HFeTBTmvBcwrIGNrAeqJ4OYU0Xb7prXtG7vuHF8VAg>
 <xmx:FHfzXD9iYuyAmqqnhdCQSfQXan52Q9pvY7bzu0of5ayepwxgd_EukQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AB5D8005C;
 Sun,  2 Jun 2019 03:13:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:57 +0900
Message-Id: <20190602071259.21622-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 13/15] ALSA: fireface: update isochronous
	resources when starting packet streaming after bus-reset
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

After bus reset, isochronous resource manager releases all of allocated
isochronous resources. The nodes to restart packet streaming should
request reallocation of the resources.

However, between the bus-reset and invocation of 'struct fw_driver.update'
handler, ALSA PCM application can detect this situation by XRUN because
the target device cancelled to transmit packets once bus-reset occurs.

Due to the above mechanism, ALSA fireface driver just stops packet
streaming in the update handler, thus pcm.prepare handler should
request the reallocation.

This commit requests the reallocation in pcm.prepare callback when
bus generation is changed.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 34 ++++++++++++++------
 sound/firewire/fireface/ff-protocol-latter.c | 11 +++++++
 sound/firewire/fireface/ff-stream.c          |  5 +--
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 0517eb718f54..bf44cad7985e 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -374,8 +374,15 @@ static int ff800_allocate_resources(struct snd_ff *ff, unsigned int rate)
 
 static int ff800_begin_session(struct snd_ff *ff, unsigned int rate)
 {
+	unsigned int generation = ff->rx_resources.generation;
 	__le32 reg;
 
+	if (generation != fw_parent_device(ff->unit)->card->generation) {
+		int err = fw_iso_resources_update(&ff->rx_resources);
+		if (err < 0)
+			return err;
+	}
+
 	reg = cpu_to_le32(0x80000000);
 	reg |= cpu_to_le32(ff->tx_stream.data_block_quadlets);
 	if (fw_parent_device(ff->unit)->max_speed == SCODE_800)
@@ -480,13 +487,22 @@ static int ff400_allocate_resources(struct snd_ff *ff, unsigned int rate)
 
 static int ff400_begin_session(struct snd_ff *ff, unsigned int rate)
 {
+	unsigned int generation = ff->rx_resources.generation;
 	__le32 reg;
 	int err;
 
-	/*
-	 * Set isochronous channel and the number of quadlets of received
-	 * packets.
-	 */
+	if (generation != fw_parent_device(ff->unit)->card->generation) {
+		err = fw_iso_resources_update(&ff->tx_resources);
+		if (err < 0)
+			return err;
+
+		err = fw_iso_resources_update(&ff->rx_resources);
+		if (err < 0)
+			return err;
+	}
+
+	// Set isochronous channel and the number of quadlets of received
+	// packets.
 	reg = cpu_to_le32(((ff->rx_stream.data_block_quadlets << 3) << 8) |
 			  ff->rx_resources.channel);
 	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
@@ -494,11 +510,9 @@ static int ff400_begin_session(struct snd_ff *ff, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/*
-	 * Set isochronous channel and the number of quadlets of transmitted
-	 * packet.
-	 */
-	/* TODO: investigate the purpose of this 0x80. */
+	// Set isochronous channel and the number of quadlets of transmitted
+	// packet.
+	// TODO: investigate the purpose of this 0x80.
 	reg = cpu_to_le32((0x80 << 24) |
 			  (ff->tx_resources.channel << 5) |
 			  (ff->tx_stream.data_block_quadlets));
@@ -507,7 +521,7 @@ static int ff400_begin_session(struct snd_ff *ff, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/* Allow to transmit packets. */
+	// Allow to transmit packets.
 	reg = cpu_to_le32(0x00000001);
 	return snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
 				 FF400_ISOC_COMM_START, &reg, sizeof(reg), 0);
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index 3d12ba5b2a9b..8d6ebb638e93 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -175,6 +175,7 @@ static int latter_allocate_resources(struct snd_ff *ff, unsigned int rate)
 
 static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 {
+	unsigned int generation = ff->rx_resources.generation;
 	unsigned int flag;
 	u32 data;
 	__le32 reg;
@@ -189,6 +190,16 @@ static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 	else
 		return -EINVAL;
 
+	if (generation != fw_parent_device(ff->unit)->card->generation) {
+		err = fw_iso_resources_update(&ff->tx_resources);
+		if (err < 0)
+			return err;
+
+		err = fw_iso_resources_update(&ff->rx_resources);
+		if (err < 0)
+			return err;
+	}
+
 	data = (ff->tx_resources.channel << 8) | ff->rx_resources.channel;
 	reg = cpu_to_le32(data);
 	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index d9d1b469a8e9..4f40dfb11979 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -234,15 +234,12 @@ void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 
 void snd_ff_stream_update_duplex(struct snd_ff *ff)
 {
-	/* The device discontinue to transfer packets.  */
+	// The device discontinue to transfer packets.
 	amdtp_stream_pcm_abort(&ff->tx_stream);
 	amdtp_stream_stop(&ff->tx_stream);
 
 	amdtp_stream_pcm_abort(&ff->rx_stream);
 	amdtp_stream_stop(&ff->rx_stream);
-
-	fw_iso_resources_update(&ff->tx_resources);
-	fw_iso_resources_update(&ff->rx_resources);
 }
 
 void snd_ff_stream_lock_changed(struct snd_ff *ff)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
