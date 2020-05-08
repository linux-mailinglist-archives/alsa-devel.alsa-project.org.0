Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD11CA25F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8043C16CA;
	Fri,  8 May 2020 06:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8043C16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588913030;
	bh=LwzxLb4VsEdSOR2UnrCUCOprZM5jY7l0Be+TPoutvCY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qU8dAyFfOVIJHsrgbaNL2H9BR0L06lR7fClYUpoVzTaNnlBgKNu/r9nXLrmfrrCUb
	 Jx+oe0wVP+9i3LEPMBO8xX2Ox0qhi/j9SFc/fxru1DNHzoS41A2nD0DFrSCRHeHIio
	 kFUBS3mc7juEOu8Y9Dw9nfR8MwPgGNK6/8QKhnEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7066F802FB;
	Fri,  8 May 2020 06:37:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 392EEF802BD; Fri,  8 May 2020 06:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30A4AF8028F
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A4AF8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mdGwO9iE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gUi8+esH"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 90AF7AD1;
 Fri,  8 May 2020 00:36:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bs9Wz0jd1cNWn
 GiKe12Qd/3nKFtxCeLuIJ3TD6iWrIE=; b=mdGwO9iEROnJIs1c+8Oj7a+M4TDxy
 4QCS0xOncsiM9lNcqbiKyKLY9Pjw0Fv56H7AJlakPztV3Dcolhum0/hJQjFAogTN
 tV+Cp7vR9gX7JX6SGY/7Tlu27y1hJmfqhROGYuxd+zRmZM604I8NpB2rQ3NqzqGn
 ky7N9RJw3hs50/gX1GlGob7CQScpaQ5eJitjqNWhIB9m5P9h3sRByUGVYcXPn099
 TqeqZRrMJz2uLWh1ApNnRZW7ZAZv6HhisunBMrMqY4+5K/aUiCloMZSfse7ziN/U
 F0U8sBFyJ9+cOrKg0A8dNiWfqkNFcpdDXyKenZjPQnkdl3i5x9rX3jjTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bs9Wz0jd1cNWnGiKe12Qd/3nKFtxCeLuIJ3TD6iWrIE=; b=gUi8+esH
 zvmCc/b2LUdhGuuGbKgEI7yH5vt2yzhHXEB+/ESyPIShrPykTbVyXR54UAa2NJzJ
 QXoY6nX4ypYPJhcXHw7zuktEwip1hRIio8YeRe58jQU2i1eNjv293Or5aoBSPfG3
 D/lJIAf8bQK5h/IZMP6GjQuWn5XFhJOt2HzJmHNwI9GUYjDf2+hZfs1yH5rX/vs7
 K2WdS2Nz01OcE+jv25lQb+TPXnxkMVqw2CE+ylRFTOZFfIq8vETXCuFu62dT17yJ
 ZGF2lEd+mvgMAORhEYT6Yiwri4MpuaDQL8S3A2rScDyjuAHjTX5RUSA3c9StxGgR
 uy+gc8hJSFY4Cw==
X-ME-Sender: <xms:4uG0Xr7YmcbfSJr3XXjhi5NeMRVhhcZe7mFz8kYbKxlsLDDTIvSRKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefhheeijedvve
 eljeejheejueegueegteehtdduffehgefgvddutdeikeejteehtdenucffohhmrghinhep
 rhigrdgurghtrgdprhigrdgvvhgvnhhtshenucfkphepudektddrvdefhedrfedrheegne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4uG0XgNa1tuGfxt9Y7eaZZ4nWDNSVTMPF5HxK4H5WjGoxjlxOz-huA>
 <xmx:4uG0Xl9PnH0L9LiIpJSG97ydMO1tzW3g2rS5gyZXTDDPGEUDZBEwaQ>
 <xmx:4uG0Xj4TjF7uWMLOr9QfLHNyETYvrPlU3ydbLIWZfdc7LAkTxJTjCg>
 <xmx:4uG0XhVbVEO5OEz67EMKTIDZhhpH1E-dSqiYhdVa07d1cXkjETxIwQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3DD003280065;
 Fri,  8 May 2020 00:36:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 10/10] ALSA: firewire-lib: use sequence of syt offset and data
 block on pool in AMDTP domain
Date: Fri,  8 May 2020 13:36:35 +0900
Message-Id: <20200508043635.349339-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

In previous commit, the sequence of syt offset and the number of data
blocks per packet is calculated for pool in AMDTP domain structure in
advance of processing outgoing packets.

This commit uses the sequence for outgoing packet processing to obsolete
per-stream processing of the sequence.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 56 +++++++++++++----------------------
 sound/firewire/amdtp-stream.h |  4 ---
 2 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index a2af598e9b9a..f8586f75441d 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -747,34 +747,30 @@ static unsigned int compute_syt(unsigned int syt_offset, unsigned int cycle,
 	return syt & CIP_SYT_MASK;
 }
 
-static void generate_ideal_pkt_descs(struct amdtp_stream *s,
-				     struct pkt_desc *descs,
-				     const __be32 *ctx_header,
-				     unsigned int packets)
+static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
+			       const __be32 *ctx_header, unsigned int packets,
+			       const struct seq_desc *seq_descs,
+			       unsigned int seq_size)
 {
 	unsigned int dbc = s->data_block_counter;
+	unsigned int seq_index = s->ctx_data.rx.seq_index;
 	int i;
 
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % s->queue_size;
-		unsigned int syt_offset;
+		const struct seq_desc *seq = seq_descs + seq_index;
+		unsigned int syt;
 
 		desc->cycle = compute_it_cycle(*ctx_header, s->queue_size);
-		syt_offset = calculate_syt_offset(
-				&s->ctx_data.rx.last_syt_offset,
-				&s->ctx_data.rx.syt_offset_state, s->sfc);
-		if (syt_offset != CIP_SYT_NO_INFO) {
-			desc->syt = compute_syt(syt_offset, desc->cycle,
-						s->ctx_data.rx.transfer_delay);
-		} else {
-			desc->syt = syt_offset;
+
+		syt = seq->syt_offset;
+		if (syt != CIP_SYT_NO_INFO) {
+			syt = compute_syt(syt, desc->cycle,
+					  s->ctx_data.rx.transfer_delay);
 		}
-		desc->data_blocks =
-			calculate_data_blocks(&s->ctx_data.rx.data_block_state,
-					      !!(s->flags & CIP_BLOCKING),
-					      desc->syt == CIP_SYT_NO_INFO,
-					      s->syt_interval, s->sfc);
+		desc->syt = syt;
+		desc->data_blocks = seq->data_blocks;
 
 		if (s->flags & CIP_DBC_IS_END_EVENT)
 			dbc = (dbc + desc->data_blocks) & 0xff;
@@ -786,10 +782,13 @@ static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 
 		desc->ctx_payload = s->buffer.packets[index].buffer;
 
+		seq_index = (seq_index + 1) % seq_size;
+
 		++ctx_header;
 	}
 
 	s->data_block_counter = dbc;
+	s->ctx_data.rx.seq_index = seq_index;
 }
 
 static inline void cancel_stream(struct amdtp_stream *s)
@@ -818,6 +817,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				void *private_data)
 {
 	struct amdtp_stream *s = private_data;
+	const struct amdtp_domain *d = s->domain;
 	const __be32 *ctx_header = header;
 	unsigned int events_per_period = s->ctx_data.rx.events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
@@ -830,7 +830,8 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
+	generate_pkt_descs(s, s->pkt_descs, ctx_header, packets, d->seq_descs,
+			   d->seq_size);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
@@ -1037,18 +1038,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 			      int start_cycle, unsigned int queue_size,
 			      unsigned int idle_irq_interval)
 {
-	static const struct {
-		unsigned int data_block;
-		unsigned int syt_offset;
-	} *entry, initial_state[] = {
-		[CIP_SFC_32000]  = {  4, 3072 },
-		[CIP_SFC_48000]  = {  6, 1024 },
-		[CIP_SFC_96000]  = { 12, 1024 },
-		[CIP_SFC_192000] = { 24, 1024 },
-		[CIP_SFC_44100]  = {  0,   67 },
-		[CIP_SFC_88200]  = {  0,   67 },
-		[CIP_SFC_176400] = {  0,   67 },
-	};
 	bool is_irq_target = (s == s->domain->irq_target);
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
@@ -1072,12 +1061,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 
 		s->data_block_counter = UINT_MAX;
 	} else {
-		entry = &initial_state[s->sfc];
-
 		s->data_block_counter = 0;
-		s->ctx_data.rx.data_block_state = entry->data_block;
-		s->ctx_data.rx.syt_offset_state = entry->syt_offset;
-		s->ctx_data.rx.last_syt_offset = TICKS_PER_CYCLE;
 	}
 
 	/* initialize packet buffer */
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 11cff4cafd90..703b710aaf7f 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -140,10 +140,6 @@ struct amdtp_stream {
 			unsigned int transfer_delay;
 			unsigned int seq_index;
 
-			unsigned int data_block_state;
-			unsigned int last_syt_offset;
-			unsigned int syt_offset_state;
-
 			// To generate CIP header.
 			unsigned int fdf;
 			int syt_override;
-- 
2.25.1

