Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBE6F816
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89B8172B;
	Mon, 22 Jul 2019 05:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89B8172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767157;
	bh=vg8hBoZ3i2IbzuwPLigr1iUA6VImr5lfoJDmnSuLa0w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4jynZHWLylWBnbeYOIDrShvy4B6/hgPz4OajywktOPD9NB7vGMTp/JPG6zuNPDdK
	 7dm6fpCnLBbFCbm4Vr2hLllmm8zR2JnqbG5K12gvKL+9LSInbdTW8uQLveEpfnuPac
	 cPq8dY2I8spV3T9JF7fey3PA3J42le76/73S+/vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2897F805FF;
	Mon, 22 Jul 2019 05:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14535F804FD; Mon, 22 Jul 2019 05:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CDCFF803F4
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CDCFF803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CQAty3sf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VchxWetr"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 311D321FE9;
 Sun, 21 Jul 2019 23:37:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=DAnwCqjjJHebp
 JALnVpIE/HDrn1TVyczXjJKejcv2SQ=; b=CQAty3sfHVcjzvGr5cQDPd1f1IQ9Z
 /TU5IDwlyrUgSAPd7I3GDwNnolhiaa6dWjf2dqAyYL2z4MKyHyA84URF5c+FgJBH
 XIhkWFen86EkYzagJbC+W/nGTLQ/HB1Z82VhB8TnCWpMRQxU5u88EQuT6I2admZR
 /Kknqa1s2yw8HUGTfniiTPIQbzJbDQXZymmUmWk+QOYTA9fEaPpxaKewh0jZUFNF
 HrAWFuV8WEqqu12jMjV4d+4WQ0qmbP5SsBxNwyXqUbQoEf5pML754r1MhkLHU8No
 pPtNg5mUeXm+lvbImlUtSJUN5trB9mgrvLlJeuL7QxUVedVJwjNdBF2cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DAnwCqjjJHebpJALnVpIE/HDrn1TVyczXjJKejcv2SQ=; b=VchxWetr
 NOGr8yQ9mkcr6/QLAohuU/6D/2xTgi0hkhZeRILsGc61LUNqERdXHZVfH3zOdaVR
 0NIFmXmRj9N+7rok99V3P6rLHklvSn3QrsOrkZST8XhGBqXU1xaB1E8tRieMwAgp
 Ov/k6jxsZf6frkaH9uLHlRj6z6rbapHRTFsZdnDHQaSJbqeYENqAqW/FyNb8w0ft
 OEUeAQfp7rve+xy3B84r/d8Z37hifY4tbsHidtfUyAcxEnOMtrCbu0Ss02pcQRHB
 8Rq25icgPnhv5F0oOLd8cG7GZTIZOfD89Ba6+42q93ife5MRNAZNjxQtnq8eAqg2
 SnVAgITpxdZJqg==
X-ME-Sender: <xms:ey81XeirEqjBCFe8vpSRUp4AHyhZmfOqnkcI3-VMVaJCy0tbD_NugA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:ey81XRrhOpTikXQuwrGl3RwZTkX6cE5MqUaebTcYIZkeM2mug_WTSw>
 <xmx:ey81XVniYG05bhbmoTPRHBVR3INy3WHVsCl1XCNtti2_LGNVbSuNWw>
 <xmx:ey81XYlJLiUH073KlkKg04yiJmTr2vFXXWdIswk80br3XFo8IE6F-g>
 <xmx:ey81XeH_j4GoBaOHGvYr9-bQZAHMbvJH5H2lzV_ksVUANFkszvtQ9A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF11980059;
 Sun, 21 Jul 2019 23:37:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:00 +0900
Message-Id: <20190722033710.28107-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/20] ALSA: firewire-lib: use packet
	descriptor for IR context
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

This commit uses packet descriptor to parse headers of IR context and
parse timing information for sequence transferred by target device.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 96 +++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 463c7a340a45..68502a8864b9 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -602,6 +602,8 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 		return -EIO;
 	}
 
+	*data_block_counter = dbc;
+
 	*syt = cip_header[1] & CIP_SYT_MASK;
 
 	return 0;
@@ -676,6 +678,48 @@ static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp)
 	return increment_cycle_count(cycle, QUEUE_LENGTH);
 }
 
+static int generate_device_pkt_descs(struct amdtp_stream *s,
+				     struct pkt_desc *descs,
+				     const __be32 *ctx_header,
+				     unsigned int packets)
+{
+	unsigned int dbc = s->data_block_counter;
+	int i;
+	int err;
+
+	for (i = 0; i < packets; ++i) {
+		struct pkt_desc *desc = descs + i;
+		unsigned int index = (s->packet_index + i) % QUEUE_LENGTH;
+		unsigned int cycle;
+		unsigned int payload_length;
+		unsigned int data_blocks;
+		unsigned int syt;
+
+		cycle = compute_cycle_count(ctx_header[1]);
+
+		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
+					  &data_blocks, &dbc, &syt, i);
+		if (err < 0)
+			return err;
+
+		desc->cycle = cycle;
+		desc->syt = syt;
+		desc->data_blocks = data_blocks;
+		desc->data_block_counter = dbc;
+		desc->ctx_payload = s->buffer.packets[index].buffer;
+
+		if (!(s->flags & CIP_DBC_IS_END_EVENT))
+			dbc = (dbc + desc->data_blocks) & 0xff;
+
+		ctx_header +=
+			s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
+	}
+
+	s->data_block_counter = dbc;
+
+	return 0;
+}
+
 static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 				     struct pkt_desc *descs,
 				     const __be32 *ctx_header,
@@ -770,8 +814,10 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 			       void *private_data)
 {
 	struct amdtp_stream *s = private_data;
-	unsigned int i, packets;
+	unsigned int packets;
 	__be32 *ctx_header = header;
+	int i;
+	int err;
 
 	if (s->packet_index < 0)
 		return;
@@ -779,50 +825,34 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	// The number of packets in buffer.
 	packets = header_length / s->ctx_data.tx.ctx_header_size;
 
+	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets);
+	if (err < 0) {
+		if (err != -EAGAIN) {
+			cancel_stream(s);
+			return;
+		}
+	}
+
 	for (i = 0; i < packets; i++) {
-		u32 cycle;
-		unsigned int payload_length;
-		unsigned int data_blocks;
-		unsigned int dbc;
-		unsigned int syt;
-		__be32 *buffer;
+		const struct pkt_desc *desc = s->pkt_descs;
 		unsigned int pcm_frames = 0;
 		struct fw_iso_packet params = {0};
 		struct snd_pcm_substream *pcm;
-		int err;
-
-		cycle = compute_cycle_count(ctx_header[1]);
-		dbc = s->data_block_counter;
-		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
-					  &data_blocks, &dbc, &syt, i);
-		if (err < 0 && err != -EAGAIN)
-			break;
 
 		if (err >= 0) {
-			buffer = s->buffer.packets[s->packet_index].buffer;
-			pcm_frames = s->process_data_blocks(s, buffer,
-							    data_blocks, dbc);
-
-			if (!(s->flags & CIP_DBC_IS_END_EVENT))
-				dbc = (dbc + data_blocks) & 0xff;
+			pcm_frames = s->process_data_blocks(s,
+					desc->ctx_payload, desc->data_blocks,
+					desc->data_block_counter);
 		}
 
-		s->data_block_counter = dbc;
-
-		if (queue_in_packet(s, &params) < 0)
-			break;
+		if (queue_in_packet(s, &params) < 0) {
+			cancel_stream(s);
+			return;
+		}
 
 		pcm = READ_ONCE(s->pcm);
 		if (pcm && pcm_frames > 0)
 			update_pcm_pointers(s, pcm, pcm_frames);
-
-		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
-	}
-
-	/* Queueing error or detecting invalid payload. */
-	if (i < packets) {
-		cancel_stream(s);
-		return;
 	}
 
 	fw_iso_context_queue_flush(s->context);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
