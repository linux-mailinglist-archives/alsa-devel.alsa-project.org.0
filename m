Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D76F81C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D401757;
	Mon, 22 Jul 2019 05:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D401757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767323;
	bh=HAcpbX1P4y0fi6NuBOJJQc+6maIy7BrqK/0l1ikpHTk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oz/hmA1IpHmivEVrnPYGh05OTlQW9HC6kpuHk2Hr+OXTK1r7+6DzdhCSzQNKBZsfw
	 95JeV8RrVHfK+hHlDrP3lweenOb4jg/2OetdaKHZexfWIHSB4afsF9v7XRdudMxapm
	 jv4Uiqj+srSZ7Noumtob1QxoaShxCSk1+rc0UCsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A55F8065E;
	Mon, 22 Jul 2019 05:38:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF9CBF80527; Mon, 22 Jul 2019 05:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7902F804FE
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7902F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ro57kd4t"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Pn8w7HdR"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 12FAC20931;
 Sun, 21 Jul 2019 23:37:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yDBlO+BPb3Rl8
 4nKfojvzfP7ETldGewGryOB98zzfuE=; b=ro57kd4tsPwRz9jhwWcp73hFtIN1v
 1maTfN5lh4fE9CKm6fDwWRromvt86P/K7ryX7jkjorWeAw4F+vIlkf1IKzOyuuDW
 CAe+v/nvk+rOMk4k7JXh+Di8ZBWGvuanxzaC6gz1gX5oCvW6Kq8CjoKbeTgDcpyw
 SPwmRAE7K/neh4JZXtvukZyEu9xM+A/FXEctJU6o2gASXzR4kYmEo42A0LEwg3tW
 MWJL+TXmIGqCZ0KArZMRxmWmDVoBnoF7UhQPTgfzs7CoPIMk6e430NRc8RNyrGb3
 4r0Im3NdtFCDyjeomdWs6mKRwOMcrmilkGmpV49lG57hj+w1Mzo5jX1ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yDBlO+BPb3Rl84nKfojvzfP7ETldGewGryOB98zzfuE=; b=Pn8w7HdR
 L/ng7iq0XlB8bFiUfYgrxpI9cPCsgFJ1kBtT+NSVoC7oqC1gn58xrAT+AKGn6v92
 4dUEM+7PYkRxoy6garSgoOJWag34nVHFUzBrIu1OqVwmI2BIX7Oa3d6XPJhJbxzQ
 b3qsMgfRQBvXX2M/ZLwd8tNgfEfTlVpBCwFgzTSct0A2KXBSSyge7+eqlpK4kx4F
 PQPX9kCGPkRzN3J3wQEhGsqHt2M5ZnCSeXyjbTRzCR57GLvkqXmYHfafVBooBRAh
 BOWo1QZFJlbwHRS7ildZx2nbAGIr/6dcIITM2B+wBj36XWFRGTDWL9xn72XM6NlB
 TYn5GYnwCcinlg==
X-ME-Sender: <xms:fy81XdqxQRdMeN1JAUdx3WthxRfuHLDbDVOq7eCL3yHotYks5HaqYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:fy81XbIozZBb-6aYegyUFL_9U0Dd7iRtQnhettNi6_DNd46eVWwDzQ>
 <xmx:fy81XQpqo191dNSiFRBc-M9s1u_1LKy222ALmvMxgMixOLXruT7-5Q>
 <xmx:fy81XTzfJiy8grV_0uzb-gqkfKuQxGDBKMoJtWKMju1M7zLaHDRCdA>
 <xmx:gC81XeGGK5eX37f_kXeGXyMdtiuUdSLdppCh5aI576gKvq4TcIcXbw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61D7580059;
 Sun, 21 Jul 2019 23:37:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:03 +0900
Message-Id: <20190722033710.28107-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 13/20] ALSA: firewire-lib: pass packet
	descriptor to data block processing layer
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

This commit changes signature of callback function to call data block
processing layer with packet descriptor. At present, the layer is called
per packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         | 32 +++++++++--------
 sound/firewire/amdtp-stream.c        |  6 ++--
 sound/firewire/amdtp-stream.h        |  5 ++-
 sound/firewire/digi00x/amdtp-dot.c   | 27 +++++++-------
 sound/firewire/fireface/amdtp-ff.c   | 23 ++++++------
 sound/firewire/motu/amdtp-motu.c     | 53 ++++++++++++++++------------
 sound/firewire/tascam/amdtp-tascam.c | 39 +++++++++++---------
 7 files changed, 97 insertions(+), 88 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 21068b23d528..ff089ffa3374 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -336,44 +336,46 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
-	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
 
 	if (pcm) {
-		write_pcm_s32(s, pcm, buffer, data_blocks);
-		pcm_frames = data_blocks * p->frame_multiplier;
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks * p->frame_multiplier;
 	} else {
-		write_pcm_silence(s, buffer, data_blocks);
+		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
 		pcm_frames = 0;
 	}
 
-	if (p->midi_ports)
-		write_midi_messages(s, buffer, data_blocks, data_block_counter);
+	if (p->midi_ports) {
+		write_midi_messages(s, desc->ctx_payload, desc->data_blocks,
+				    desc->data_block_counter);
+	}
 
 	return pcm_frames;
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
-	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
 
 	if (pcm) {
-		read_pcm_s32(s, pcm, buffer, data_blocks);
-		pcm_frames = data_blocks * p->frame_multiplier;
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks * p->frame_multiplier;
 	} else {
 		pcm_frames = 0;
 	}
 
-	if (p->midi_ports)
-		read_midi_messages(s, buffer, data_blocks, data_block_counter);
+	if (p->midi_ports) {
+		read_midi_messages(s, desc->ctx_payload, desc->data_blocks,
+				   desc->data_block_counter);
+	}
 
 	return pcm_frames;
 }
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 573265113a6f..db2feb68105c 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -768,13 +768,11 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = descs + i;
-		struct snd_pcm_substream *pcm;
+		struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 		unsigned int pcm_frames;
 
-		pcm_frames = s->process_data_blocks(s, desc->ctx_payload,
-				desc->data_blocks, desc->data_block_counter);
+		pcm_frames = s->process_data_blocks(s, desc, pcm);
 
-		pcm = READ_ONCE(s->pcm);
 		if (pcm && pcm_frames > 0)
 			update_pcm_pointers(s, pcm, pcm_frames);
 	}
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 73c492c9a5d5..0e5b85100a04 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -105,9 +105,8 @@ struct pkt_desc {
 struct amdtp_stream;
 typedef unsigned int (*amdtp_stream_process_data_blocks_t)(
 						struct amdtp_stream *s,
-						__be32 *buffer,
-						unsigned int data_blocks,
-						unsigned int data_block_counter);
+						const struct pkt_desc *desc,
+						struct snd_pcm_substream *pcm);
 struct amdtp_stream {
 	struct fw_unit *unit;
 	enum cip_flags flags;
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index c296d1017ed3..83ac4b37f26d 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -330,42 +330,39 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
-	pcm = READ_ONCE(s->pcm);
 	if (pcm) {
-		read_pcm_s32(s, pcm, buffer, data_blocks);
-		pcm_frames = data_blocks;
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks;
 	} else {
 		pcm_frames = 0;
 	}
 
-	read_midi_messages(s, buffer, data_blocks);
+	read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
 
 	return pcm_frames;
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
-	pcm = READ_ONCE(s->pcm);
 	if (pcm) {
-		write_pcm_s32(s, pcm, buffer, data_blocks);
-		pcm_frames = data_blocks;
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks;
 	} else {
-		write_pcm_silence(s, buffer, data_blocks);
+		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
 		pcm_frames = 0;
 	}
 
-	write_midi_messages(s, buffer, data_blocks, data_block_counter);
+	write_midi_messages(s, desc->ctx_payload, desc->data_blocks,
+			    desc->data_block_counter);
 
 	return pcm_frames;
 }
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 31a60dff94ac..c36232fc4d3e 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -103,17 +103,18 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
 
 	if (pcm) {
-		write_pcm_s32(s, pcm, (__le32 *)buffer, data_blocks);
-		pcm_frames = data_blocks;
+		write_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
+			      desc->data_blocks);
+		pcm_frames = desc->data_blocks;
 	} else {
-		write_pcm_silence(s, (__le32 *)buffer, data_blocks);
+		write_pcm_silence(s, (__le32 *)desc->ctx_payload,
+				  desc->data_blocks);
 		pcm_frames = 0;
 	}
 
@@ -121,15 +122,15 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
 
 	if (pcm) {
-		read_pcm_s32(s, pcm, (__le32 *)buffer, data_blocks);
-		pcm_frames = data_blocks;
+		read_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
+			     desc->data_blocks);
+		pcm_frames = desc->data_blocks;
 	} else {
 		pcm_frames = 0;
 	}
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 30d5f87119cc..36ee2c1dd667 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -299,23 +299,27 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
-	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
 
-	trace_data_block_sph(s, data_blocks, buffer);
-	trace_data_block_message(s, data_blocks, buffer);
+	trace_data_block_sph(s, desc->data_blocks, desc->ctx_payload);
+	trace_data_block_message(s, desc->data_blocks, desc->ctx_payload);
 
 	if (p->midi_ports)
-		read_midi_messages(s, buffer, data_blocks);
+		read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
 
-	pcm = READ_ONCE(s->pcm);
-	if (data_blocks > 0 && pcm)
-		read_pcm_s32(s, pcm->runtime, buffer, data_blocks);
+	if (pcm) {
+		read_pcm_s32(s, pcm->runtime, desc->ctx_payload,
+			     desc->data_blocks);
+		pcm_frames = desc->data_blocks;
+	} else {
+		pcm_frames = 0;
+	}
 
-	return data_blocks;
+	return pcm_frames;
 }
 
 static inline void compute_next_elapse_from_start(struct amdtp_motu *p)
@@ -361,29 +365,32 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = (struct amdtp_motu *)s->protocol;
-	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
 
 	/* TODO: how to interact control messages between userspace? */
 
 	if (p->midi_ports)
-		write_midi_messages(s, buffer, data_blocks);
+		write_midi_messages(s, desc->ctx_payload, desc->data_blocks);
 
-	pcm = READ_ONCE(s->pcm);
-	if (pcm)
-		write_pcm_s32(s, pcm->runtime, buffer, data_blocks);
-	else
-		write_pcm_silence(s, buffer, data_blocks);
+	if (pcm) {
+		write_pcm_s32(s, pcm->runtime, desc->ctx_payload,
+			      desc->data_blocks);
+		pcm_frames = desc->data_blocks;
+	} else {
+		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = 0;
+	}
 
-	write_sph(s, buffer, data_blocks);
+	write_sph(s, desc->ctx_payload, desc->data_blocks);
 
-	trace_data_block_sph(s, data_blocks, buffer);
-	trace_data_block_message(s, data_blocks, buffer);
+	trace_data_block_sph(s, desc->data_blocks, desc->ctx_payload);
+	trace_data_block_message(s, desc->data_blocks, desc->ctx_payload);
 
-	return data_blocks;
+	return pcm_frames;
 }
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index bc1f2d2120b4..970b1c4a8ea6 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -166,33 +166,38 @@ static void read_status_messages(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
 
-	pcm = READ_ONCE(s->pcm);
-	if (data_blocks > 0 && pcm)
-		read_pcm_s32(s, pcm, buffer, data_blocks);
+	if (pcm) {
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks;
+	} else {
+		pcm_frames = 0;
+	}
 
-	read_status_messages(s, buffer, data_blocks);
+	read_status_messages(s, desc->ctx_payload, desc->data_blocks);
 
-	return data_blocks;
+	return pcm_frames;
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int data_block_counter)
+					   const struct pkt_desc *desc,
+					   struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
 
-	pcm = READ_ONCE(s->pcm);
-	if (pcm)
-		write_pcm_s32(s, pcm, buffer, data_blocks);
-	else
-		write_pcm_silence(s, buffer, data_blocks);
+	if (pcm) {
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = desc->data_blocks;
+	} else {
+		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
+		pcm_frames = 0;
+	}
 
-	return data_blocks;
+	return pcm_frames;
 }
 
 int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
