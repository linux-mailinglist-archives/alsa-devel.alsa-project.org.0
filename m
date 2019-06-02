Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6163226A
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764B01693;
	Sun,  2 Jun 2019 09:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764B01693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460057;
	bh=rjGcRQB9s0shqXRGr/oRqFRKqDyR2mMtW4wRGH2o42M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUGhDvPnsSkiRHEpmwwZ8dSgIyF2ILHLmOYI/M0AnYLp1B732fBwcBYvueuvdH/df
	 cxhxUr+EUxwKLffqrb8FcKxBl3LY9qRd186WWjvH0UqpkgKMUtYJqEEvQwF/CLv+5x
	 uIx57smd9wArt7t/lsAPW9HIxeMzgLVkL5btn0E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F43F8975C;
	Sun,  2 Jun 2019 09:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF4EF89741; Sun,  2 Jun 2019 09:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A8A7F89739
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A8A7F89739
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CIN4t9ZN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2rmS2+X2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B914D216CA;
 Sun,  2 Jun 2019 03:13:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=M7EwPoMdGbcVV
 sP8lQyOm4Hr0udqYv/9u/RBoTBS5Xg=; b=CIN4t9ZNH4Tjs0pJDK0ld87S2KJGd
 7VfUaJvapgCkZ6utxJgzgJqv6dGAZ6BdwvtbcPnY2l9U8KXiOLLWNLDZkUP3lhT2
 Dwb0i0CFlIDJxKXh3udmx67zfpf2gjlFAUjK3iGs5yNt2LcIe6FDrmCSpk7w9kga
 Xg8bNFCXTIt7ZWCwCabZcBP99ja3uBxRi+o3tsOih3aus/DkSP//M/9pnReqy4lq
 LB9KLUWIDNUXAuZboQV83NsWHDglIKx4Onp/xFd4WQURhQuM60RNmznZ0p0TtnZL
 tMFy6o/IgvXhJ+ExzBGoFxDuWjb2/x2N8cUe1T+KPNwuWkCzfUcarCsEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=M7EwPoMdGbcVVsP8lQyOm4Hr0udqYv/9u/RBoTBS5Xg=; b=2rmS2+X2
 5re2P71hdO5HWj/xfERa9TWraFv0UCoUFw6eBAex8ZmNq4T9E4EaXPyexA1YS6zk
 CfcZe4eucIuJx0+isO4gYJUj7v/Vliov1Uix7QfpMOfk43y8ZCqgC72MXbtZ83JO
 cV2qCXvmQkHVUOip37RyDm9h0kVlpUNHfAkfQKwktYV4j9ZSfHg945fodEUK4iEM
 j2DjjRjTEraIvBBFDUorJRds1C8UI6N0o9HscfGMNRI0KI830mtJu+g0D3D15RGE
 6NJhIZgK0G/oUz6avfhfXLrUstSWx/HylCrJ8+3IHOXuuKjAupFk8VZOHaHUgdNf
 Zl21lvvo0QLW7Q==
X-ME-Sender: <xms:DnfzXBKZ7l3T8GGP2Enust2vsOpoe6JxU10ZQZ2BmyngUtps4D4YdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:DnfzXOcJh7IzBrFXyzd0vT0NcVy8NN0hDkT1jlKwOw-8nEeKAPMaOA>
 <xmx:DnfzXOXFh2TEsBmZlGX6nyM5FPuDttz-2jPDx1k9dk9CclRdshqAmQ>
 <xmx:DnfzXFGocnmCflGOcqakKtrcLgZrdEetPuTQdDrO2xCoHA89uBn6Fg>
 <xmx:DnfzXGDgbSKoQvPRSwYCZdcHcQzmNtIw8Z5yQh4qC3CgNWvOcz8ObQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6AA9980059;
 Sun,  2 Jun 2019 03:13:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:53 +0900
Message-Id: <20190602071259.21622-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/15] ALSA: fireface: support
	allocate_resources operation in ff800 protocol
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

This commit implements allocate_resources callback for ff800 protocol.
As I noted in commit fc716397a5c7 ("ALSA: fireface: add support for
packet streaming on Fireface 800"), this unit allocates isochronous
resources for tx stream voluntarily. Therefore, this commit is to
maintain isochronous rsources for rx stream. In the callback,
sampling transfer frequency is configured to the device as well.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 46 ++++++++++----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 8d1c2c6e907b..11575d17d6cc 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -293,27 +293,6 @@ static int former_fill_midi_msg(struct snd_ff *ff,
 
 #define FF800_TX_PACKET_ISOC_CH	0x0000801c0008
 
-static int allocate_rx_resources(struct snd_ff *ff)
-{
-	u32 data;
-	__le32 reg;
-	int err;
-
-	// Controllers should allocate isochronous resources for rx stream.
-	err = fw_iso_resources_allocate(&ff->rx_resources,
-				amdtp_stream_get_max_payload(&ff->rx_stream),
-				fw_parent_device(ff->unit)->max_speed);
-	if (err < 0)
-		return err;
-
-	// Set isochronous channel and the number of quadlets of rx packets.
-	data = ff->rx_stream.data_block_quadlets << 3;
-	data = (data << 8) | ff->rx_resources.channel;
-	reg = cpu_to_le32(data);
-	return snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
-				FF800_RX_PACKET_FORMAT, &reg, sizeof(reg), 0);
-}
-
 static int allocate_tx_resources(struct snd_ff *ff)
 {
 	__le32 reg;
@@ -355,8 +334,9 @@ static int allocate_tx_resources(struct snd_ff *ff)
 	return 0;
 }
 
-static int ff800_begin_session(struct snd_ff *ff, unsigned int rate)
+static int ff800_allocate_resources(struct snd_ff *ff, unsigned int rate)
 {
+	u32 data;
 	__le32 reg;
 	int err;
 
@@ -371,14 +351,31 @@ static int ff800_begin_session(struct snd_ff *ff, unsigned int rate)
 	// Let's sleep for a bit.
 	msleep(100);
 
-	err = allocate_rx_resources(ff);
+	// Controllers should allocate isochronous resources for rx stream.
+	err = fw_iso_resources_allocate(&ff->rx_resources,
+				amdtp_stream_get_max_payload(&ff->rx_stream),
+				fw_parent_device(ff->unit)->max_speed);
 	if (err < 0)
 		return err;
 
-	err = allocate_tx_resources(ff);
+	// Set isochronous channel and the number of quadlets of rx packets.
+	// This should be done before the allocation of tx resources to avoid
+	// periodical noise.
+	data = ff->rx_stream.data_block_quadlets << 3;
+	data = (data << 8) | ff->rx_resources.channel;
+	reg = cpu_to_le32(data);
+	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 FF800_RX_PACKET_FORMAT, &reg, sizeof(reg), 0);
 	if (err < 0)
 		return err;
 
+	return allocate_tx_resources(ff);
+}
+
+static int ff800_begin_session(struct snd_ff *ff, unsigned int rate)
+{
+	__le32 reg;
+
 	reg = cpu_to_le32(0x80000000);
 	reg |= cpu_to_le32(ff->tx_stream.data_block_quadlets);
 	if (fw_parent_device(ff->unit)->max_speed == SCODE_800)
@@ -420,6 +417,7 @@ const struct snd_ff_protocol snd_ff_protocol_ff800 = {
 	.fill_midi_msg		= former_fill_midi_msg,
 	.get_clock		= former_get_clock,
 	.switch_fetching_mode	= former_switch_fetching_mode,
+	.allocate_resources	= ff800_allocate_resources,
 	.begin_session		= ff800_begin_session,
 	.finish_session		= ff800_finish_session,
 	.dump_status		= former_dump_status,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
