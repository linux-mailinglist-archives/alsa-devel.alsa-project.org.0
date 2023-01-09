Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB89661C47
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 03:19:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D548A3C;
	Mon,  9 Jan 2023 03:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D548A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673230757;
	bh=x6wpKG7SiuKXbPgbOV8uFGRKMWza+3OGT5Qklvwr1LI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ElJoznfoINUJQRB3wfFJen1l5E2PRYMuhDpusxC/CxMYZESjjL0fsRYY1MVse65J6
	 rxNXh0WlbYb7fy7zWroojM9bAL1uc4fD13yIVsEuYaVPuf5I8uTODCMU2W6W5qQHL7
	 8n84uhaqUb0w4W9UhlEzMlFkPZLQ6dKcIeaN8MDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF8FF803DC;
	Mon,  9 Jan 2023 03:17:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC7BF804DC; Mon,  9 Jan 2023 03:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC09F804D9
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 03:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC09F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=b3yfLs5j; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=skekFnYa
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A9125C00B0;
 Sun,  8 Jan 2023 21:17:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 08 Jan 2023 21:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673230668; x=
 1673317068; bh=Lb0qaaltjygtBi1wp4EQ+VP3kcbzQrUE+0aGW8KUv78=; b=b
 3yfLs5jQQfc12I6CQIbgdqUCfshftMmVaI6oiW67yjsJCEFuQomHGu44SKUzOL9X
 btd0o+LhhAjavoDIHdFCM1I0xU00TP7iQoUYtSdeIbNVzQTyhoWGdx1Grs80QarP
 i1UsWuqOHNvk1OkiYUja/c/cAWuQz8aQo0oUt80bxl3aS2kX6L58QPNIKU/GZfUl
 iAz/DjYGwz9TNYbSUYoA46jQISwSV16cd9q7hi6RbHIhTtv18kcDHrhRuZFO/+n4
 eumbq5V0SJZejJMCilHzigeLaxwirFfVvq+8c0yU1jZjfg7zHqYAzVXzxOsdpptH
 lSZUIVp12JiKz14dh03NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673230668; x=1673317068; bh=Lb0qaaltjygtB
 i1wp4EQ+VP3kcbzQrUE+0aGW8KUv78=; b=skekFnYa4DR3ova+8PrLAhBOTEQnC
 rsP6FAnpAUZ3Jk+zbLHKoGNdyjtgWc0PFiCd4d68//ZP7xpijCNUbZXStSUOgxEn
 MPZRxvSNjUBN4R+oKAv6m6v/nBT5T+rQFnuOJOUI1sCrz0gLtcB0x7BaTYJQTNIW
 TIXq7UBOiM3/FUvgwTlV1UKVgLa6BTIE9Wno8u5ERfVEq76jAmu60+2TggbXJL30
 V0DfXZHRlFUS0lppFjDjZEbZE3JWCewOOSDG7m48j7glvut/oG65J507KojG96H3
 9vup0kNc2DXGB3PJeLjx+wH9BetnJvBuae8ZqxsO+6X4lKk16FLprhilA==
X-ME-Sender: <xms:THm7YzJ4eV2P3OPb9G8UE4d4ph8c0-pIN8reLKOgS-8_kzYQ0mxmGg>
 <xme:THm7Y3I1w2DS5ILmS01n4LgqRFwlzCptgAqv5P7TPu2xN4eW3nfm8qoC-ETtPQM0-
 s_yN9vrF5AtpkQj7Vk>
X-ME-Received: <xmr:THm7Y7uFmq0evnSJoem6BLKLVrS7t5K79FARi8wCXaTJtHrXTCXw7-DwZGl9fQX5jLdeLTGQFtSB_U5YLizc20CCYmo1dzlOuZbvzqx2EJa0hcR2ud3F10k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:THm7Y8ZeOHaRDjYepdk2EMUNCN1kWZk_aZXrTXsZVJk-kWGi9uAY7Q>
 <xmx:THm7Y6YC8kmKR_cANdRXVLY_WNV6qMz6eGlAMg2ClnYDADeDWwAVgQ>
 <xmx:THm7YwDhWtDEJr6cj1qKGs39uhVZ7c90RNm28WXQJDp6KquJoRK86w>
 <xmx:THm7Y9w8Fgg6Z8bnCSD_ZxC677OGEOa-L_zKmaLhUhtHuWK3AUAObQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 21:17:47 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-lib: keep history to process isochronous
 packet
Date: Mon,  9 Jan 2023 11:17:38 +0900
Message-Id: <20230109021738.75543-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109021738.75543-1-o-takashi@sakamocchi.jp>
References: <20230109021738.75543-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The history to process isochronous packets is useful when computing gap
between current isochronous cycle and the latest isochronous cycle in
which packet is processed (in IR context) and scheduled (in IT context).

This commit stores the most recent packet descriptors to keep the history.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 20 +++++++++++++-------
 sound/firewire/amdtp-stream.h |  3 ++-
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 006dc939065f..430b33dc60b3 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1047,7 +1047,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	const __be32 *ctx_header = header;
 	const unsigned int events_per_period = d->events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
-	struct pkt_desc *desc = s->pkt_descs;
+	struct pkt_desc *desc = s->packet_descs_cursor;
 	unsigned int pkt_header_length;
 	unsigned int packets;
 	bool need_hw_irq;
@@ -1106,6 +1106,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	}
 
 	s->ctx_data.rx.event_count = event_count;
+	s->packet_descs_cursor = desc;
 }
 
 static void skip_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
@@ -1202,7 +1203,7 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 {
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
-	struct pkt_desc *desc = s->pkt_descs;
+	struct pkt_desc *desc = s->packet_descs_cursor;
 	unsigned int packet_count;
 	unsigned int desc_count;
 	int i;
@@ -1228,6 +1229,10 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 
 		if (d->replay.enable)
 			cache_seq(s, desc, desc_count);
+
+		for (i = 0; i < desc_count; ++i)
+			desc = amdtp_stream_next_packet_desc(s, desc);
+		s->packet_descs_cursor = desc;
 	}
 
 	for (i = 0; i < packet_count; ++i) {
@@ -1664,7 +1669,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		err = -ENOMEM;
 		goto err_context;
 	}
-	s->pkt_descs = descs;
+	s->packet_descs = descs;
 
 	INIT_LIST_HEAD(&s->packet_descs_list);
 	for (i = 0; i < s->queue_size; ++i) {
@@ -1672,6 +1677,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		list_add_tail(&descs->link, &s->packet_descs_list);
 		++descs;
 	}
+	s->packet_descs_cursor = list_first_entry(&s->packet_descs_list, struct pkt_desc, link);
 
 	s->packet_index = 0;
 	do {
@@ -1710,8 +1716,8 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 
 	return 0;
 err_pkt_descs:
-	kfree(s->pkt_descs);
-	s->pkt_descs = NULL;
+	kfree(s->packet_descs);
+	s->packet_descs = NULL;
 err_context:
 	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
@@ -1805,8 +1811,8 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
-	kfree(s->pkt_descs);
-	s->pkt_descs = NULL;
+	kfree(s->packet_descs);
+	s->packet_descs = NULL;
 
 	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 84156d0d57b8..a8dd1c3ec8d9 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -126,8 +126,9 @@ struct amdtp_stream {
 	struct iso_packets_buffer buffer;
 	unsigned int queue_size;
 	int packet_index;
-	struct pkt_desc *pkt_descs;
+	struct pkt_desc *packet_descs;
 	struct list_head packet_descs_list;
+	struct pkt_desc *packet_descs_cursor;
 	int tag;
 	union {
 		struct {
-- 
2.37.2

