Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA4DB1A1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE251685;
	Thu, 17 Oct 2019 17:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE251685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571327833;
	bh=adr4N4FabglvvxRVgElER1RPJGXr1tgJ/cmWRJCuhZ4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPvtuDOp5dsdxuga3TciJC8PixaFv6MxiwYYW7IRzCNm5fZhhLkzM2YcCQzZ7NUxp
	 6pr5/8JgY8mCA54Pc4SC1caza3l48M1e/OY8WLb7gdx9MfKWYkPKTmCpI8GxsDlU4d
	 7BwuMYOjWeqhqzAJpr/DX+5Wuq0yZsCbNTcaYm7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3472F805FF;
	Thu, 17 Oct 2019 17:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58ECAF80276; Thu, 17 Oct 2019 17:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A558BF80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A558BF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZlrE7+P1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="M36uFNXv"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E24D74FB;
 Thu, 17 Oct 2019 11:54:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=x9FkcCZkxiQUZ
 paFOu04NoRSN2RA4Wvlr4qY6YA6878=; b=ZlrE7+P1cWKXknJegKRV4fTavaNiv
 dMEYkFNPo6DzKsi7CBCCp+hE3zX2c315oegqV9IsCfKZDmRo3qEUit+o9tVAfU77
 1RvMKfx0+zyrevK7LL5pe+9HME7oqAihXVpM++aLmJjVEFQDjPGIPwU0Egw1/x99
 H1zzrVYPCY6h+Ol3OvBCFSmty9nKmqgoDnEg/mymX5382cOl61XdeHcPuYzMunXa
 7o8oDF0r+DFOoo7NaT5XWq9cf3JK6Ql8q54zmROKp9RVm7/Jxur5js5N98zKcq5u
 HaMsUnvlAoomuqpM5bSHnLS9e/ydF7POZr13oXBLHLQ1VmShRlN5Dc0sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=x9FkcCZkxiQUZpaFOu04NoRSN2RA4Wvlr4qY6YA6878=; b=M36uFNXv
 N/f4lJsTDlnKzNxChvaOs4XUThUnIVjtcZ16nx6bwLaA5jrnYk/v9EsJboY1bMdf
 GLna7tkviw4MyqSO8VsvC9LVCbzoSHSeWMt5cebJOqTGcquUstQG77jcKwiBjZrU
 haoBmuEh396ozNvDY37LclB1YW+StVKSFp3roDlOyrdyD5vqkh2kOfd0gd4uc50N
 UfHuULl5ZPx9JHlNcorDYmiySd1BOJC5usQMei011RRByB0apLf2cftFq/JpkQeI
 B268v7yqXUyCSpRuijWkLcPozM5KDVvyCxdKh0afWInMli/qCwPjHfCjkuqvQ7qt
 W+MrVXgngaSjvA==
X-ME-Sender: <xms:t46oXebFK_F7vHUWgiLyZlV-dOYf_WVJwddGFTRhRfkV_NbqqmfDEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:t46oXYboW4USgXJoIPYgTt5LdDPmry0fnIowZYeBtSCT9_wqS3ym1A>
 <xmx:t46oXUeG9duZ2wRaoMM00C_vNFmyvujaJ2cnz-QOyuYSr_YrabaUuA>
 <xmx:t46oXacTZguADzNeRJWXwBJ_qDYhmWmO1AX3KMyX6Las_R7exrUWJw>
 <xmx:t46oXc3aKs9wkGPy7UsUcmRwLaMUfyVdZgiBYdStTIcpdf6YgFFOFw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C07D580065;
 Thu, 17 Oct 2019 11:54:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:13 +0900
Message-Id: <20191017155424.885-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/12] ALSA: firewire-lib: use variable size of
	queue for isoc packets instead of fixed size
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

The number of packets in packet buffer has been fixed number (=48) since
first commit of ALSA IEC 61883-1/6 packet streaming engine.

This commit allows the engine to use variable number of packets in the
buffer. The size is calculated by a parameter in AMDTP domain structure
surely to store the number of events in the packets of buffer. Although
the value of parameter is expected to come from 'period size' parameter
of PCM substream, at present 48 is still used.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c               | 45 +++++++++++++--------
 sound/firewire/amdtp-stream.h               |  6 ++-
 sound/firewire/bebob/bebob_stream.c         |  2 +-
 sound/firewire/dice/dice-stream.c           |  2 +-
 sound/firewire/digi00x/digi00x-stream.c     |  2 +-
 sound/firewire/fireface/ff-stream.c         |  2 +-
 sound/firewire/fireworks/fireworks_stream.c |  2 +-
 sound/firewire/motu/motu-stream.c           |  2 +-
 sound/firewire/oxfw/oxfw-stream.c           |  2 +-
 sound/firewire/tascam/tascam-stream.c       |  2 +-
 10 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 838f695b20de..1f38729c8e74 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -54,7 +54,6 @@
 
 /* TODO: make these configurable */
 #define INTERRUPT_INTERVAL	16
-#define QUEUE_LENGTH		48
 
 // For iso header, tstamp and 2 CIP header.
 #define IR_CTX_HEADER_SIZE_CIP		16
@@ -451,7 +450,7 @@ static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *params)
 		goto end;
 	}
 
-	if (++s->packet_index >= QUEUE_LENGTH)
+	if (++s->packet_index >= s->queue_size)
 		s->packet_index = 0;
 end:
 	return err;
@@ -669,13 +668,14 @@ static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
 }
 
 // Align to actual cycle count for the packet which is going to be scheduled.
-// This module queued the same number of isochronous cycle as QUEUE_LENGTH to
-// skip isochronous cycle, therefore it's OK to just increment the cycle by
-// QUEUE_LENGTH for scheduled cycle.
-static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp)
+// This module queued the same number of isochronous cycle as the size of queue
+// to kip isochronous cycle, therefore it's OK to just increment the cycle by
+// the size of queue for scheduled cycle.
+static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp,
+				   unsigned int queue_size)
 {
 	u32 cycle = compute_cycle_count(ctx_header_tstamp);
-	return increment_cycle_count(cycle, QUEUE_LENGTH);
+	return increment_cycle_count(cycle, queue_size);
 }
 
 static int generate_device_pkt_descs(struct amdtp_stream *s,
@@ -689,7 +689,7 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
-		unsigned int index = (s->packet_index + i) % QUEUE_LENGTH;
+		unsigned int index = (s->packet_index + i) % s->queue_size;
 		unsigned int cycle;
 		unsigned int payload_length;
 		unsigned int data_blocks;
@@ -730,9 +730,9 @@ static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
-		unsigned int index = (s->packet_index + i) % QUEUE_LENGTH;
+		unsigned int index = (s->packet_index + i) % s->queue_size;
 
-		desc->cycle = compute_it_cycle(*ctx_header);
+		desc->cycle = compute_it_cycle(*ctx_header, s->queue_size);
 		desc->syt = calculate_syt(s, desc->cycle);
 		desc->data_blocks = calculate_data_blocks(s, desc->syt);
 
@@ -779,12 +779,15 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	const __be32 *ctx_header = header;
-	unsigned int packets = header_length / sizeof(*ctx_header);
+	unsigned int packets;
 	int i;
 
 	if (s->packet_index < 0)
 		return;
 
+	// Calculate the number of packets in buffer and check XRUN.
+	packets = header_length / sizeof(*ctx_header);
+
 	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
@@ -828,7 +831,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	if (s->packet_index < 0)
 		return;
 
-	// The number of packets in buffer.
+	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / s->ctx_data.tx.ctx_header_size;
 
 	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets);
@@ -874,7 +877,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 
 		context->callback.sc = in_stream_callback;
 	} else {
-		cycle = compute_it_cycle(*ctx_header);
+		cycle = compute_it_cycle(*ctx_header, s->queue_size);
 
 		context->callback.sc = out_stream_callback;
 	}
@@ -894,7 +897,8 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
  * amdtp_stream_set_parameters() and it must be started before any PCM or MIDI
  * device can be started.
  */
-static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
+static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
+			      struct amdtp_domain *d)
 {
 	static const struct {
 		unsigned int data_block;
@@ -908,6 +912,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 		[CIP_SFC_88200]  = {  0,   67 },
 		[CIP_SFC_176400] = {  0,   67 },
 	};
+	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
@@ -953,7 +958,13 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 			max_ctx_payload_size -= IT_PKT_HEADER_SIZE_CIP;
 	}
 
-	err = iso_packets_buffer_init(&s->buffer, s->unit, QUEUE_LENGTH,
+	if (events_per_buffer == 0)
+		events_per_buffer = INTERRUPT_INTERVAL * 3;
+
+	s->queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
+				     amdtp_rate_table[s->sfc]);
+
+	err = iso_packets_buffer_init(&s->buffer, s->unit, s->queue_size,
 				      max_ctx_payload_size, dir);
 	if (err < 0)
 		goto err_unlock;
@@ -981,7 +992,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	else
 		s->tag = TAG_CIP;
 
-	s->pkt_descs = kcalloc(INTERRUPT_INTERVAL, sizeof(*s->pkt_descs),
+	s->pkt_descs = kcalloc(s->queue_size, sizeof(*s->pkt_descs),
 			       GFP_KERNEL);
 	if (!s->pkt_descs) {
 		err = -ENOMEM;
@@ -1196,7 +1207,7 @@ int amdtp_domain_start(struct amdtp_domain *d)
 	int err = 0;
 
 	list_for_each_entry(s, &d->streams, list) {
-		err = amdtp_stream_start(s, s->channel, s->speed);
+		err = amdtp_stream_start(s, s->channel, s->speed, d);
 		if (err < 0)
 			break;
 	}
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index d95a4ed15f20..8d541727e437 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -117,6 +117,7 @@ struct amdtp_stream {
 	/* For packet processing. */
 	struct fw_iso_context *context;
 	struct iso_packets_buffer buffer;
+	unsigned int queue_size;
 	int packet_index;
 	struct pkt_desc *pkt_descs;
 	int tag;
@@ -274,6 +275,7 @@ struct amdtp_domain {
 	struct list_head streams;
 
 	unsigned int events_per_period;
+	unsigned int events_per_buffer;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
@@ -286,9 +288,11 @@ int amdtp_domain_start(struct amdtp_domain *d);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
-						unsigned int events_per_period)
+						unsigned int events_per_period,
+						unsigned int events_per_buffer)
 {
 	d->events_per_period = events_per_period;
+	d->events_per_buffer = events_per_buffer;
 
 	return 0;
 }
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index f1db3ddc3e00..e8e9eca6f116 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -610,7 +610,7 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&bebob->domain,
-							 frames_per_period);
+							 frames_per_period, 0);
 		if (err < 0) {
 			cmp_connection_release(&bebob->out_conn);
 			cmp_connection_release(&bebob->in_conn);
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index ef36bf588d11..b4ef08bd7e8f 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -327,7 +327,7 @@ int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate,
 			goto error;
 
 		err = amdtp_domain_set_events_per_period(&dice->domain,
-							 events_per_period);
+							 events_per_period, 0);
 		if (err < 0)
 			goto error;
 	}
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 96d331e47b07..83659fc0ef25 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -318,7 +318,7 @@ int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&dg00x->domain,
-							 frames_per_period);
+							 frames_per_period, 0);
 		if (err < 0) {
 			fw_iso_resources_free(&dg00x->rx_resources);
 			fw_iso_resources_free(&dg00x->tx_resources);
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index d05e7d3055e1..cbe0e5087b05 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -153,7 +153,7 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
 			return err;
 
 		err = amdtp_domain_set_events_per_period(&ff->domain,
-							 frames_per_period);
+							 frames_per_period, 0);
 		if (err < 0) {
 			fw_iso_resources_free(&ff->tx_resources);
 			fw_iso_resources_free(&ff->rx_resources);
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 0787d5c3b01b..e4d4dd08c60a 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -231,7 +231,7 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&efw->domain,
-							 frames_per_period);
+							 frames_per_period, 0);
 		if (err < 0) {
 			cmp_connection_release(&efw->in_conn);
 			cmp_connection_release(&efw->out_conn);
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 52b7c375bb0b..97245c670732 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -174,7 +174,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&motu->domain,
-							 frames_per_period);
+							 frames_per_period, 0);
 		if (err < 0) {
 			fw_iso_resources_free(&motu->tx_resources);
 			fw_iso_resources_free(&motu->rx_resources);
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 7d2e88c5b73d..318de8217b3a 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -308,7 +308,7 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 		}
 
 		err = amdtp_domain_set_events_per_period(&oxfw->domain,
-							frames_per_period);
+							frames_per_period, 0);
 		if (err < 0) {
 			cmp_connection_release(&oxfw->in_conn);
 			if (oxfw->has_output)
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 8c04a0ad17d9..1e4d44ed8bed 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -416,7 +416,7 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&tscm->domain,
-							frames_per_period);
+							frames_per_period, 0);
 		if (err < 0) {
 			fw_iso_resources_free(&tscm->tx_resources);
 			fw_iso_resources_free(&tscm->rx_resources);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
