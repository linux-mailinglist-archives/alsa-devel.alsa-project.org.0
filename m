Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E813661C4B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 03:19:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3790C8A3D;
	Mon,  9 Jan 2023 03:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3790C8A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673230783;
	bh=DrCfU/IuAmWewChOVRWON85IbXcUfD7VuJgFc+xwT1E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OmZv0A84P1j6cZ4h1Bov+eTjoJvCxFeFjhcx/7Hf/eG2xxvyZpUS2WeCTcr4EJrUY
	 lYC4Zm1tLaw2193Hc2RgG9XGlXLGc/vF43AoCmhvAuaf7Ch3dj/zRdTIbKHtk6yLUZ
	 Ldzl7k9raTIVixO6+o0rhFm6YWteuiwN2mwMValc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2519EF80558;
	Mon,  9 Jan 2023 03:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF4FF804BD; Mon,  9 Jan 2023 03:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C68BF804BD
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 03:17:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C68BF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=g6JA+CRA; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=I/Dh4eKz
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D01225C0094;
 Sun,  8 Jan 2023 21:17:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 08 Jan 2023 21:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673230666; x=
 1673317066; bh=zgwbMvKHSftrMDX0bIzhtglMebSJF8Z7hUtoDaq+z0o=; b=g
 6JA+CRA0+2+prb626JHgp1qlpmMYZ7osm/8eqRh36ETbsVYCKBrFxm5lbrpDcmct
 MROjqYguacPAA1LlQvJ6c62w3U6b8QTxjOcqWcpK7/cQCZB9ZZf7XbU6mXBTyj+O
 ukarK+5Jd8Ws9KDnIeUCq/TfihHAic+QtFOZOGF9ROWF8TN/3nHIa3t/5/djs6jI
 zX9ITU9wX8ty3OxEgI3YSipOIRFWj6zgUGosRH4PagBNakkHjs6GAjwx2rHoH3rm
 6uWtyHCavPqc6UXEubr2O/zNvLaih+0edTFy+P/uvE9Ski05aO5H42mu9HSAOPz9
 j6miI0oCnhAbsj7XMtZtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673230666; x=1673317066; bh=zgwbMvKHSftrM
 DX0bIzhtglMebSJF8Z7hUtoDaq+z0o=; b=I/Dh4eKzgZIeL4S3prRV/+Yvqo20z
 QbP+N6yEoBbXfQuBwwTBxi7biK3xkro+KqJ734weUySnavb4zZa/fubbSPHaD/UF
 W76nK0PlHQsEsb1zq9AacxrpyJMrKns63du41IIYUYFVg2hQUIcEUrgrdrkC1m4b
 cPVr8/YoFWcKqwzlBqprY5BWt8+UvHCbyK9UZLGF99dmPrKgasOG1N3lv+z/0YvZ
 w0H8uxYCBV5yqo10IToeWKxqLvOSdr6g9gASLyMY7xXE/GAN9wQeayseJpBjwIlJ
 1DArZTOa3kDTzFKEynMfe0rnoujHEy0th5T35rlxWTcmH2/kCxRL84wsg==
X-ME-Sender: <xms:Snm7Y-1HYFf5lMbqmzSVDHGwQ_y13n1KEER-2Da0jv6JGO3hiJfm2w>
 <xme:Snm7YxGqD9GuBkyXymHU7QL9PdBYBOhbkOgzhGbCsukdQiw2I8Ws8Ff-ojdMkxx4K
 gNMXQ4AKtll71uQQyg>
X-ME-Received: <xmr:Snm7Y24Hg5Mj4voRI8t244U94gMlkD-0fWICI9iKjbHG9bV8y32mS1QMH2gxoK27BsJtqFSWZOuYidscDOSt50uVUo4wLDOV9OFlq1_zNDefgA751utitFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Snm7Y_1pwgmsap618zBfJXsHSvOpZuD3sCYY3w5Hn3IAqwjVFzWX5g>
 <xmx:Snm7YxEzgCqU--0sTi1xyPLD-USs1y9BaV_gamUiomzcOCHh1chIOA>
 <xmx:Snm7Y4-gCZmfaBuyCl-fRk7oO5AOBqBpA-7IJczwXciRjVjdpaEJeA>
 <xmx:Snm7Y_PXy5FsZA_RAUuJzwg2q8nCYR1oDgc_I-F_tpn6drJfVvPf5A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 21:17:45 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-lib: use circular linked list for context
 payload processing layer
Date: Mon,  9 Jan 2023 11:17:37 +0900
Message-Id: <20230109021738.75543-3-o-takashi@sakamocchi.jp>
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

The list of packet descriptor is passed to context payload processing
layer so that each driver can copy PCM frames, MIDI messages, and device
specific data between packet payload buffer and intermediate buffer for
user space application.

The list of packet descriptor was replaced by circular linked list in a
previous commit. This commit uses circular linked in context payload
processing layer as well.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c                  | 18 +++----
 sound/firewire/amdtp-stream.c                 |  4 +-
 sound/firewire/amdtp-stream.h                 |  2 +-
 sound/firewire/digi00x/amdtp-dot.c            | 18 +++----
 sound/firewire/fireface/amdtp-ff.c            | 18 +++----
 sound/firewire/motu/amdtp-motu.c              | 48 ++++++++++---------
 .../motu/motu-command-dsp-message-parser.c    | 11 +++--
 .../motu/motu-register-dsp-message-parser.c   | 11 +++--
 sound/firewire/motu/motu.h                    |  8 ++--
 sound/firewire/tascam/amdtp-tascam.c          | 18 +++----
 10 files changed, 87 insertions(+), 69 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index d9c700f652bb..cf55f7784d23 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -347,16 +347,15 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -371,22 +370,23 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 			write_midi_messages(s, buf, data_blocks,
 					    desc->data_block_counter);
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
 }
 
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -399,6 +399,8 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 			read_midi_messages(s, buf, data_blocks,
 					   desc->data_block_counter);
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 794ac693aae6..006dc939065f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1028,13 +1028,13 @@ static inline void cancel_stream(struct amdtp_stream *s)
 
 static void process_ctx_payloads(struct amdtp_stream *s,
 				 const struct pkt_desc *descs,
-				 unsigned int packets)
+				 unsigned int count)
 {
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
 	pcm = READ_ONCE(s->pcm);
-	pcm_frames = s->process_ctx_payloads(s, descs, packets, pcm);
+	pcm_frames = s->process_ctx_payloads(s, descs, count, pcm);
 	if (pcm)
 		update_pcm_pointers(s, pcm, pcm_frames);
 }
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 4bf701796166..84156d0d57b8 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -110,7 +110,7 @@ struct amdtp_stream;
 typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
 						struct amdtp_stream *s,
 						const struct pkt_desc *desc,
-						unsigned int packets,
+						unsigned int count,
 						struct snd_pcm_substream *pcm);
 
 struct amdtp_domain;
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 59b86c8d89e1..fcae7d07aa03 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -342,15 +342,14 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 }
 
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -360,21 +359,22 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 		}
 
 		read_midi_messages(s, buf, data_blocks);
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -387,6 +387,8 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		write_midi_messages(s, buf, data_blocks,
 				    desc->data_block_counter);
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 98177b0666d3..2402e2be87a6 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -113,15 +113,14 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					   const struct pkt_desc *descs,
-					   unsigned int packets,
+					   const struct pkt_desc *desc,
+					   unsigned int count,
 					   struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__le32 *buf = (__le32 *)desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -131,21 +130,22 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 		} else {
 			write_pcm_silence(s, buf, data_blocks);
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
 }
 
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__le32 *buf = (__le32 *)desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -153,6 +153,8 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
 			pcm_frames += data_blocks;
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 2fb52f481d12..ea0063cec5fb 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -284,19 +284,19 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 	}
 }
 
-static void probe_tracepoints_events(struct amdtp_stream *s,
-				     const struct pkt_desc *descs,
-				     unsigned int packets)
+static void probe_tracepoints_events(struct amdtp_stream *s, const struct pkt_desc *desc,
+				     unsigned int count)
 {
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
 		trace_data_block_sph(s, data_blocks, buf);
 		trace_data_block_message(s, data_blocks, buf);
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 }
 
@@ -329,12 +329,13 @@ static void cache_event_offsets(struct amdtp_motu_cache *cache, const __be32 *bu
 }
 
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	struct snd_motu *motu = container_of(s, struct snd_motu, tx_stream);
 	struct amdtp_motu *p = s->protocol;
+	const struct pkt_desc *cursor = desc;
 	unsigned int pcm_frames = 0;
 	int i;
 
@@ -342,8 +343,7 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 		p->cache->tx_cycle_count = (s->domain->processing_cycle.tx_start % CYCLES_PER_SECOND);
 
 	// For data block processing.
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -356,20 +356,20 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		if (p->midi_ports)
 			read_midi_messages(s, buf, data_blocks);
-	}
 
-	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
-		snd_motu_register_dsp_message_parser_parse(motu, descs, packets,
-							   s->data_block_quadlets);
-	} else if (motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP) {
-		snd_motu_command_dsp_message_parser_parse(motu, descs, packets,
-							  s->data_block_quadlets);
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
+	desc = cursor;
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP)
+		snd_motu_register_dsp_message_parser_parse(s, desc, count);
+	else if (motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP)
+		snd_motu_command_dsp_message_parser_parse(s, desc, count);
+
 	// For tracepoints.
 	if (trace_data_block_sph_enabled() ||
 	    trace_data_block_message_enabled())
-		probe_tracepoints_events(s, descs, packets);
+		probe_tracepoints_events(s, desc, count);
 
 	return pcm_frames;
 }
@@ -397,11 +397,12 @@ static void write_sph(struct amdtp_motu_cache *cache, __be32 *buffer, unsigned i
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
+	const struct pkt_desc *cursor = desc;
 	unsigned int pcm_frames = 0;
 	int i;
 
@@ -409,8 +410,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 		p->cache->rx_cycle_count = (s->domain->processing_cycle.rx_start % CYCLES_PER_SECOND);
 
 	// For data block processing.
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -425,12 +425,16 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 			write_midi_messages(s, buf, data_blocks);
 
 		write_sph(p->cache, buf, data_blocks, s->data_block_quadlets);
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
+	desc = cursor;
+
 	// For tracepoints.
 	if (trace_data_block_sph_enabled() ||
 	    trace_data_block_message_enabled())
-		probe_tracepoints_events(s, descs, packets);
+		probe_tracepoints_events(s, desc, count);
 
 	return pcm_frames;
 }
diff --git a/sound/firewire/motu/motu-command-dsp-message-parser.c b/sound/firewire/motu/motu-command-dsp-message-parser.c
index 9efe4d364baf..5d8a86a12f1f 100644
--- a/sound/firewire/motu/motu-command-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-command-dsp-message-parser.c
@@ -80,9 +80,11 @@ int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc
 #define FRAGMENTS_PER_VALUE		4
 #define VALUES_AT_IMAGE_END		0xffffffffffffffff
 
-void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
-					unsigned int desc_count, unsigned int data_block_quadlets)
+void snd_motu_command_dsp_message_parser_parse(const struct amdtp_stream *s,
+					const struct pkt_desc *desc, unsigned int count)
 {
+	struct snd_motu *motu = container_of(s, struct snd_motu, tx_stream);
+	unsigned int data_block_quadlets = s->data_block_quadlets;
 	struct msg_parser *parser = motu->message_parser;
 	unsigned int interval = parser->interval;
 	unsigned long flags;
@@ -90,12 +92,13 @@ void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const stru
 
 	spin_lock_irqsave(&parser->lock, flags);
 
-	for (i = 0; i < desc_count; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buffer = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 		int j;
 
+		desc = amdtp_stream_next_packet_desc(s, desc);
+
 		for (j = 0; j < data_blocks; ++j) {
 			u8 *b = (u8 *)buffer;
 			buffer += data_block_quadlets;
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index 0c587567540f..ef3b0b0f0dab 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -142,9 +142,11 @@ static void queue_event(struct snd_motu *motu, u8 msg_type, u8 identifier0, u8 i
 	parser->push_pos = pos;
 }
 
-void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
-					unsigned int desc_count, unsigned int data_block_quadlets)
+void snd_motu_register_dsp_message_parser_parse(const struct amdtp_stream *s,
+						const struct pkt_desc *desc, unsigned int count)
 {
+	struct snd_motu *motu = container_of(s, struct snd_motu, tx_stream);
+	unsigned int data_block_quadlets = s->data_block_quadlets;
 	struct msg_parser *parser = motu->message_parser;
 	bool meter_pos_quirk = parser->meter_pos_quirk;
 	unsigned int pos = parser->push_pos;
@@ -153,12 +155,13 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 
 	spin_lock_irqsave(&parser->lock, flags);
 
-	for (i = 0; i < desc_count; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buffer = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 		int j;
 
+		desc = amdtp_stream_next_packet_desc(s, desc);
+
 		for (j = 0; j < data_blocks; ++j) {
 			u8 *b = (u8 *)buffer;
 			u8 msg_type = (b[MSG_FLAG_POS] & MSG_FLAG_TYPE_MASK) >> MSG_FLAG_TYPE_SHIFT;
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 4189f2192284..3b1dc98a7be0 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -279,8 +279,8 @@ static inline int snd_motu_protocol_cache_packet_formats(struct snd_motu *motu)
 
 int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu);
-void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
-					unsigned int desc_count, unsigned int data_block_quadlets);
+void snd_motu_register_dsp_message_parser_parse(const struct amdtp_stream *s,
+					const struct pkt_desc *descs, unsigned int count);
 void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
 					struct snd_firewire_motu_register_dsp_meter *meter);
 void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
@@ -290,8 +290,8 @@ bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32
 
 int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc);
-void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
-					unsigned int desc_count, unsigned int data_block_quadlets);
+void snd_motu_command_dsp_message_parser_parse(const struct amdtp_stream *s,
+					const struct pkt_desc *descs, unsigned int count);
 void snd_motu_command_dsp_message_parser_copy_meter(struct snd_motu *motu,
 					struct snd_firewire_motu_command_dsp_meter *meter);
 
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 64d66a802545..c367a6ee6121 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -177,15 +177,14 @@ static void read_status_messages(struct amdtp_stream *s,
 }
 
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -195,21 +194,22 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 		}
 
 		read_status_messages(s, buf, data_blocks);
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *descs,
-					    unsigned int packets,
+					    const struct pkt_desc *desc,
+					    unsigned int count,
 					    struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
 
-	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = descs + i;
+	for (i = 0; i < count; ++i) {
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
@@ -219,6 +219,8 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 		} else {
 			write_pcm_silence(s, buf, data_blocks);
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	return pcm_frames;
-- 
2.37.2

