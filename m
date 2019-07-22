Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB76F825
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F4E1784;
	Mon, 22 Jul 2019 05:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F4E1784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767574;
	bh=DQyht0AExkhnP26cbSGXWq7DGquBiuWm0nim0hkAayU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJiQ5DuYWne31GGmIvjWUWIyw2iyxAD+SjvyTd5caBcMIS4cGN7g3vYMkTquvp0aw
	 8BvEVff1lr+ZVK1nDOUOnwGilwch7LLakTmOQUKmL/ERgOLq+ftR5T/bQaRLNBmhsx
	 41Ao/OtOSrtnaZiKXrmyGTQzX0SGUCUA8Nxj7bSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72682F80746;
	Mon, 22 Jul 2019 05:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3246F805E0; Mon, 22 Jul 2019 05:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C03DF80529
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C03DF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hKaCeiAc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="1dt9+h2A"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EE1F21C7D;
 Sun, 21 Jul 2019 23:37:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yXfZbHzinuBVs
 Uz3ka48zW5iiW1TvOPwAMcB8kymVtU=; b=hKaCeiAcIhjWKspUBnqy/wewTj8r/
 U0oRMF8k6LHDBC/t7uxT+Az1yKrqCgsw75P4WI6TmS3yNm30J4efNr2VaZsyss10
 xdqSbEpTzy9we351fxkWIkbfoGF9qKB1hlTtDBLhdJ1ZkTxCiokcpj60IfcyJuVi
 WDWOPTcys8GdWuYoxvXfmhgaojVcwcNqrQ+95yLy5+19262Uu5A6JndckMXtilw5
 DI/az89xmpw/yXejPHVZWneg7dIttVekhehIXsVW7Y6/9ELRxDPiKkv4bgTRp5ue
 lO3bnk6d65+GbNvB1PPQc7euf0ZuAA2Q8lV3G2V/WSySIqVodU5gufIkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yXfZbHzinuBVsUz3ka48zW5iiW1TvOPwAMcB8kymVtU=; b=1dt9+h2A
 87CjbRdlhJx0E5IMckPPGh75E/EzLSM5+16tQEuwQW4LoqHpZUrtHNrk4nkHxYTy
 7UbpnwMc53unrObeRMm/HGxo/TxUO2ik6TyBoQf+RWNklFJm4Dr4DaY4M8Wg0S9q
 1zpBtaRjw93Svut5BT13TG5OO6CH8MzftOSFCegq+EX2LusOjirIycEa7t/0xRDa
 g3H2W7v3Cww6SvutX6BGyhbkIIJPN5YhecHclu91Y6i5lH11WFbV3jl3aqXy67LA
 ZF17aqhtWsxPPXrcfOlTtRSR944S7RGPlmvZ9tdti7GeZh3DpR4QLeNdpzKvr6r1
 UZ3KjPHYddeDqA==
X-ME-Sender: <xms:iS81XeNj2SKHOviEk622iBgSPHE4a3fTgo0iAotuObXw-bspCWT7Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduhe
X-ME-Proxy: <xmx:iS81XbVjBGm0BC_n_CeQ9nnb55K9aPwyB3tAWg8QQtxatTyesorWzQ>
 <xmx:iS81XRTLugQ1I46Fo1O3Sm5Blf1NIvjDylngcy8dZAL5DQlO51100Q>
 <xmx:iS81XR0GyCRCBSBUG2x5wqEHgkKVEfCymR1sGE1iNmsta2wpMPb68A>
 <xmx:iS81XeYQ8h-zTC4gQJeSdghWG9pzxoacTACqzRGQJIrZBsMUfqwrEA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AD29D80059;
 Sun, 21 Jul 2019 23:37:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:09 +0900
Message-Id: <20190722033710.28107-20-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 19/20] ALSA: firewire-lib: process payload of
	isoc context according to packet descriptors
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

This commit changes each of data block processing layer so that it
receives list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         | 71 +++++++++++++++-----------
 sound/firewire/amdtp-stream.c        | 25 ++++-----
 sound/firewire/amdtp-stream.h        |  7 +--
 sound/firewire/digi00x/amdtp-dot.c   | 66 ++++++++++++++----------
 sound/firewire/fireface/amdtp-ff.c   | 55 ++++++++++++--------
 sound/firewire/motu/amdtp-motu.c     | 76 ++++++++++++++++------------
 sound/firewire/tascam/amdtp-tascam.c | 60 +++++++++++++---------
 7 files changed, 212 insertions(+), 148 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 5d2952a1a9b2..67d735e9a6a4 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -345,45 +345,59 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 	}
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			      pcm_frames);
-		pcm_frames = desc->data_blocks * p->frame_multiplier;
-	} else {
-		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-	}
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	if (p->midi_ports) {
-		write_midi_messages(s, desc->ctx_payload, desc->data_blocks,
-				    desc->data_block_counter);
+		if (pcm) {
+			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks * p->frame_multiplier;
+		} else {
+			write_pcm_silence(s, buf, data_blocks);
+		}
+
+		if (p->midi_ports) {
+			write_midi_messages(s, buf, data_blocks,
+					    desc->data_block_counter);
+		}
 	}
 
 	return pcm_frames;
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			     pcm_frames);
-		pcm_frames = desc->data_blocks * p->frame_multiplier;
-	}
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+
+		if (pcm) {
+			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks * p->frame_multiplier;
+		}
 
-	if (p->midi_ports) {
-		read_midi_messages(s, desc->ctx_payload, desc->data_blocks,
-				   desc->data_block_counter);
+		if (p->midi_ports) {
+			read_midi_messages(s, buf, data_blocks,
+					   desc->data_block_counter);
+		}
 	}
 
 	return pcm_frames;
@@ -400,15 +414,14 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 int amdtp_am824_init(struct amdtp_stream *s, struct fw_unit *unit,
 		     enum amdtp_stream_direction dir, enum cip_flags flags)
 {
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 
 	if (dir == AMDTP_IN_STREAM)
-		process_data_blocks = process_tx_data_blocks;
+		process_ctx_payloads = process_ir_ctx_payloads;
 	else
-		process_data_blocks = process_rx_data_blocks;
+		process_ctx_payloads = process_it_ctx_payloads;
 
 	return amdtp_stream_init(s, unit, dir, flags, CIP_FMT_AM,
-				 process_data_blocks,
-				 sizeof(struct amdtp_am824));
+			process_ctx_payloads, sizeof(struct amdtp_am824));
 }
 EXPORT_SYMBOL_GPL(amdtp_am824_init);
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index db2feb68105c..369e75e33120 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -74,16 +74,16 @@ static void pcm_period_tasklet(unsigned long data);
  * @dir: the direction of stream
  * @flags: the packet transmission method to use
  * @fmt: the value of fmt field in CIP header
- * @process_data_blocks: callback handler to process data blocks
+ * @process_ctx_payloads: callback handler to process payloads of isoc context
  * @protocol_size: the size to allocate newly for protocol
  */
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 		      enum amdtp_stream_direction dir, enum cip_flags flags,
 		      unsigned int fmt,
-		      amdtp_stream_process_data_blocks_t process_data_blocks,
+		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size)
 {
-	if (process_data_blocks == NULL)
+	if (process_ctx_payloads == NULL)
 		return -EINVAL;
 
 	s->protocol = kzalloc(protocol_size, GFP_KERNEL);
@@ -102,7 +102,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->callbacked = false;
 
 	s->fmt = fmt;
-	s->process_data_blocks = process_data_blocks;
+	s->process_ctx_payloads = process_ctx_payloads;
 
 	if (dir == AMDTP_OUT_STREAM)
 		s->ctx_data.rx.syt_override = -1;
@@ -764,18 +764,13 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 				 const struct pkt_desc *descs,
 				 unsigned int packets)
 {
-	int i;
-
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
-		struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
-		unsigned int pcm_frames;
-
-		pcm_frames = s->process_data_blocks(s, desc, pcm);
+	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
 
-		if (pcm && pcm_frames > 0)
-			update_pcm_pointers(s, pcm, pcm_frames);
-	}
+	pcm = READ_ONCE(s->pcm);
+	pcm_frames = s->process_ctx_payloads(s, descs, packets, pcm);
+	if (pcm)
+		update_pcm_pointers(s, pcm, pcm_frames);
 }
 
 static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 0e5b85100a04..50041fa884d9 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -103,9 +103,10 @@ struct pkt_desc {
 };
 
 struct amdtp_stream;
-typedef unsigned int (*amdtp_stream_process_data_blocks_t)(
+typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
 						struct amdtp_stream *s,
 						const struct pkt_desc *desc,
+						unsigned int packets,
 						struct snd_pcm_substream *pcm);
 struct amdtp_stream {
 	struct fw_unit *unit;
@@ -168,13 +169,13 @@ struct amdtp_stream {
 
 	/* For backends to process data blocks. */
 	void *protocol;
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 };
 
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 		      enum amdtp_stream_direction dir, enum cip_flags flags,
 		      unsigned int fmt,
-		      amdtp_stream_process_data_blocks_t process_data_blocks,
+		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size);
 void amdtp_stream_destroy(struct amdtp_stream *s);
 
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index cef5caf97236..d613642a2ce3 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -341,39 +341,53 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 		WRITE_ONCE(p->midi[port], midi);
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			     pcm_frames);
-		pcm_frames = desc->data_blocks;
-	}
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
+		if (pcm) {
+			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		}
+
+		read_midi_messages(s, buf, data_blocks);
+	}
 
 	return pcm_frames;
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			      pcm_frames);
-		pcm_frames = desc->data_blocks;
-	} else {
-		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-	}
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	write_midi_messages(s, desc->ctx_payload, desc->data_blocks,
-			    desc->data_block_counter);
+		if (pcm) {
+			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		} else {
+			write_pcm_silence(s, buf, data_blocks);
+		}
+
+		write_midi_messages(s, buf, data_blocks,
+				    desc->data_block_counter);
+	}
 
 	return pcm_frames;
 }
@@ -381,20 +395,20 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 int amdtp_dot_init(struct amdtp_stream *s, struct fw_unit *unit,
 		 enum amdtp_stream_direction dir)
 {
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	enum cip_flags flags;
 
-	/* Use different mode between incoming/outgoing. */
+	// Use different mode between incoming/outgoing.
 	if (dir == AMDTP_IN_STREAM) {
 		flags = CIP_NONBLOCKING;
-		process_data_blocks = process_tx_data_blocks;
+		process_ctx_payloads = process_ir_ctx_payloads;
 	} else {
 		flags = CIP_BLOCKING;
-		process_data_blocks = process_rx_data_blocks;
+		process_ctx_payloads = process_it_ctx_payloads;
 	}
 
 	return amdtp_stream_init(s, unit, dir, flags, CIP_FMT_AM,
-				 process_data_blocks, sizeof(struct amdtp_dot));
+				process_ctx_payloads, sizeof(struct amdtp_dot));
 }
 
 void amdtp_dot_reset(struct amdtp_stream *s)
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index cb2073cf146b..119c0076b17a 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -112,34 +112,47 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
+static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
+					   const struct pkt_desc *descs,
+					   unsigned int packets,
 					   struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
-
-	if (pcm) {
-		write_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
-			      desc->data_blocks, pcm_frames);
-		pcm_frames = desc->data_blocks;
-	} else {
-		write_pcm_silence(s, (__le32 *)desc->ctx_payload,
-				  desc->data_blocks);
+	int i;
+
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__le32 *buf = (__le32 *)desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+
+		if (pcm) {
+			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		} else {
+			write_pcm_silence(s, buf, data_blocks);
+		}
 	}
 
 	return pcm_frames;
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		read_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
-			     desc->data_blocks, pcm_frames);
-		pcm_frames = desc->data_blocks;
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__le32 *buf = (__le32 *)desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+
+		if (pcm) {
+			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		}
 	}
 
 	return pcm_frames;
@@ -148,13 +161,13 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 int amdtp_ff_init(struct amdtp_stream *s, struct fw_unit *unit,
 		  enum amdtp_stream_direction dir)
 {
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 
 	if (dir == AMDTP_IN_STREAM)
-		process_data_blocks = process_tx_data_blocks;
+		process_ctx_payloads = process_ir_ctx_payloads;
 	else
-		process_data_blocks = process_rx_data_blocks;
+		process_ctx_payloads = process_it_ctx_payloads;
 
 	return amdtp_stream_init(s, unit, dir, CIP_NO_HEADER, 0,
-				 process_data_blocks, sizeof(struct amdtp_ff));
+				 process_ctx_payloads, sizeof(struct amdtp_ff));
 }
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 21c6bfdf47c0..05a6e218b0ad 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -310,23 +310,30 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 	}
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_frames = 0;
+	int i;
+
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	trace_data_block_sph(s, desc->data_blocks, desc->ctx_payload);
-	trace_data_block_message(s, desc->data_blocks, desc->ctx_payload);
+		trace_data_block_sph(s, data_blocks, buf);
+		trace_data_block_message(s, data_blocks, buf);
 
-	if (p->midi_ports)
-		read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
+		if (p->midi_ports)
+			read_midi_messages(s, buf, data_blocks);
 
-	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			     pcm_frames);
-		pcm_frames = desc->data_blocks;
+		if (pcm) {
+			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		}
 	}
 
 	return pcm_frames;
@@ -374,30 +381,37 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer,
 	}
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_frames = 0;
+	int i;
 
-	/* TODO: how to interact control messages between userspace? */
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	if (p->midi_ports)
-		write_midi_messages(s, desc->ctx_payload, desc->data_blocks);
+		// TODO: how to interact control messages between userspace?
 
-	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			      pcm_frames);
-		pcm_frames = desc->data_blocks;
-	} else {
-		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-	}
+		if (p->midi_ports)
+			write_midi_messages(s, buf, data_blocks);
 
-	write_sph(s, desc->ctx_payload, desc->data_blocks);
+		if (pcm) {
+			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		} else {
+			write_pcm_silence(s, buf, data_blocks);
+		}
 
-	trace_data_block_sph(s, desc->data_blocks, desc->ctx_payload);
-	trace_data_block_message(s, desc->data_blocks, desc->ctx_payload);
+		write_sph(s, buf, data_blocks);
+
+		trace_data_block_sph(s, data_blocks, buf);
+		trace_data_block_message(s, data_blocks, buf);
+	}
 
 	return pcm_frames;
 }
@@ -406,13 +420,13 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
 		    const struct snd_motu_protocol *const protocol)
 {
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	int fmt = CIP_FMT_MOTU;
 	int flags = CIP_BLOCKING;
 	int err;
 
 	if (dir == AMDTP_IN_STREAM) {
-		process_data_blocks = process_tx_data_blocks;
+		process_ctx_payloads = process_ir_ctx_payloads;
 
 		/*
 		 * Units of version 3 transmits packets with invalid CIP header
@@ -431,11 +445,11 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 				 CIP_SKIP_DBC_ZERO_CHECK;
 		}
 	} else {
-		process_data_blocks = process_rx_data_blocks;
+		process_ctx_payloads = process_it_ctx_payloads;
 		flags |= CIP_DBC_IS_END_EVENT;
 	}
 
-	err = amdtp_stream_init(s, unit, dir, flags, fmt, process_data_blocks,
+	err = amdtp_stream_init(s, unit, dir, flags, fmt, process_ctx_payloads,
 				sizeof(struct amdtp_motu));
 	if (err < 0)
 		return err;
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 3c9abf422f24..e80bb84c43f6 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -175,35 +175,49 @@ static void read_status_messages(struct amdtp_stream *s,
 	}
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			     pcm_frames);
-		pcm_frames += desc->data_blocks;
-	}
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
 
-	read_status_messages(s, desc->ctx_payload, desc->data_blocks);
+		if (pcm) {
+			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		}
+
+		read_status_messages(s, buf, data_blocks);
+	}
 
 	return pcm_frames;
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   struct snd_pcm_substream *pcm)
+static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
+					    const struct pkt_desc *descs,
+					    unsigned int packets,
+					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
+	int i;
 
-	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
-			      pcm_frames);
-		pcm_frames += desc->data_blocks;
-	} else {
-		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+
+		if (pcm) {
+			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
+			pcm_frames += data_blocks;
+		} else {
+			write_pcm_silence(s, buf, data_blocks);
+		}
 	}
 
 	return pcm_frames;
@@ -212,22 +226,22 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir, unsigned int pcm_channels)
 {
-	amdtp_stream_process_data_blocks_t process_data_blocks;
+	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	struct amdtp_tscm *p;
 	unsigned int fmt;
 	int err;
 
 	if (dir == AMDTP_IN_STREAM) {
 		fmt = AMDTP_FMT_TSCM_TX;
-		process_data_blocks = process_tx_data_blocks;
+		process_ctx_payloads = process_ir_ctx_payloads;
 	} else {
 		fmt = AMDTP_FMT_TSCM_RX;
-		process_data_blocks = process_rx_data_blocks;
+		process_ctx_payloads = process_it_ctx_payloads;
 	}
 
 	err = amdtp_stream_init(s, unit, dir,
-				CIP_NONBLOCKING | CIP_SKIP_DBC_ZERO_CHECK, fmt,
-				process_data_blocks, sizeof(struct amdtp_tscm));
+			CIP_NONBLOCKING | CIP_SKIP_DBC_ZERO_CHECK, fmt,
+			process_ctx_payloads, sizeof(struct amdtp_tscm));
 	if (err < 0)
 		return 0;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
