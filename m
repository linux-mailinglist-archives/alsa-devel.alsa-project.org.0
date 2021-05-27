Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BF392DEE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 14:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1AE6170E;
	Thu, 27 May 2021 14:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1AE6170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622118528;
	bh=0z9u/4IUs/Bd97pNy7hfVZwDpQQNM7WFxJrsqSwEj00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0VB+CwI53+f4An5Lc05XPvKxlJZmJuAiZcTLed8Xs/f800qeTehXq1uStcF5exnZ
	 eobDLpPHX2Ce4bcuc9iOoTtbpjpCNGXid31hvo3jQy3/xFLiAjneuP/eEbj/TnHKvE
	 dRRHeM736ik5QJqX2YwBd0A6MCzt5r4kyVbJ3T1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEFE0F804AC;
	Thu, 27 May 2021 14:26:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10E55F80301; Thu, 27 May 2021 14:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1BC1F80147
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 14:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1BC1F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3kgETOXo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rf7ZpOS0"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8B3C3F9E;
 Thu, 27 May 2021 08:26:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 May 2021 08:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tg2rK/+3Uq4US
 C7xdVtQA+dWm4CWGy9vy5TdVKNLu3s=; b=3kgETOXo0MwLghXEG83PiVTDKJz1I
 8Q915OEMqBqdgpZP8+WZSYwy7MB91CIidXSO/WY/8lZH+4sdwrp75u1bX/4NZziS
 LMtiuO2ya1IAsy1ty/Om1hsoCj4KtKJa2v/ugqG35euhUFSk6Alg/GMylqonQm4T
 yuLlf9J4Dr6NTpcvU20FMqx0vo2LBxulYS0gVe994v0anZob8jq7JL7eg70BhNGV
 PcRQ1Owf/+5EKDcZBXZJiZ2DDzdHhxaJKI2/TbySYH6Fa+Fu/DB3TRwVQxnUw2jr
 sPKK1d0//uL53OIu5ShvX9JLcdXMvvOXr/y3f8nX3bNfexQlQFxpiVANA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tg2rK/+3Uq4USC7xdVtQA+dWm4CWGy9vy5TdVKNLu3s=; b=rf7ZpOS0
 Y+4muyWESm6eOX0TbCSKObEpd1kM7gwqbB6jMXupOKtssN/JgdQRw0mPMfzvapsO
 uY6Lhe4v1ay8w6bqxTP/Gqy65HjlIwVo8d2oVq8TBq7F9QSZbcPoIRFXa7r8Kr3u
 EMceC90cGRUVerNXRtImIEHx9nH/YU/1hJAdAyvNT2RN62KQEzXtOzC+Vwdg8MqB
 ma8oo+hrcNpk3gZvfeSeHXsSqklQuza77EqcYxCipN0/RuhhpgMlDIcMUKRdSeDc
 5+dGTuuNUvTvmeCMB0HZqMK4to5yvlZbs4I+0oF5Yu2z6j8JGumvqT2fwqhtgf6K
 oqfTNMtdwuCfOA==
X-ME-Sender: <xms:7Y-vYHq9CnG1otWX2jo9eNxWdGXO9wLZkUSaawZveBxG-WAi3VMPew>
 <xme:7Y-vYBplPIjopZ1XRoV4SEYwGRVnhLMQRXx6YO8m9m5_7JJfpO86U-yKabbUax5lo
 ScYoDGKQZrlcymvIk4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:7Y-vYEPA5PsK9jE5vW_uqVNkA9ZI3TYzAoF4kbV2lhpVUgQ8Y4bzjQ>
 <xmx:7Y-vYK56yWENuNNIFs1mz1z0Oqot0T6BlbNNPLdQ72bZd9LfMtm-SQ>
 <xmx:7Y-vYG5Urd8UUPuvm4adiQez32-V6ohnU7DW73X_MiesGICx_HWSJQ>
 <xmx:7o-vYLiC4hogolOYeavWEYvlrllFRQdtzd5d0Witc69rIA_uqOLRAA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:26:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-lib: replay sequence of incoming packets
 for outgoing packets
Date: Thu, 27 May 2021 21:26:10 +0900
Message-Id: <20210527122611.173711-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527122611.173711-1-o-takashi@sakamocchi.jp>
References: <20210527122611.173711-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

ALSA IEC 61883-1/6 packet streaming engine uses pre-computed parameters
ideal for nominal sampling transfer frequency (STF) to transfer packets
to device since it was added 2011. As a result of user experience for a
decade, it is clear that the sequence is not suitable to some actual
devices. It takes the devices to generate noise, and causes any type of
discontinuity in the series of packet transferred from the device. It's
required for the engine to transfer packets according to effective STF.

The effective STF is given by media clock recovered by the sequence of
packet transferred from the target device. In the previous commit, the
sequence is already cached. The media clock recovery can be achieved by
analyzing the sequence.

In technological world, many ideas are proposed for media clock recovery.
However, the small part of them could be actually adopted in our case
since floating point arithmetic is not mostly available in Linux kernel
land.

This commit adopts the simple way from them; sequence replay, which means
that the sequence of parameters from incoming packet is used as is to
transfer outgoing packets. The media clock is not computed internally,
but the sequence of outgoing packet superficially looks to be generated by
the media clock.

The association between source and destination is decided when starting
AMDTP domain. When the target device supports a pair of isochronous packet
streams, the tx stream is source and the rx stream is destination. When it
supports two pair of streams, each of tx stream is associated to
corresponding rx stream in its order. When it supports less number of tx
streams than rx streams, the fist tx stream is selected for all of rx
streams. When it supports more tx streams than rx streams, the first tx
packet is associated to the rx stream.

As I noted in previous commit, the sequence of parameters from incoming
packet is different between devices, time to time. It is worse idea to
replay the sequence of parameters from a device for the sequence of
packet to the other devices even if they are in the same category of
device.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 153 ++++++++++++++++++++++++++++++----
 sound/firewire/amdtp-stream.h |   3 +
 2 files changed, 142 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 860942ffb1f1..47ea03370858 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -495,6 +495,22 @@ static unsigned int compute_syt_offset(unsigned int syt, unsigned int cycle,
 	return syt_offset - transfer_delay;
 }
 
+// Both of the producer and consumer of the queue runs in the same clock of IEEE 1394 bus.
+// Additionally, the sequence of tx packets is severely checked against any discontinuity
+// before filling entries in the queue. The calculation is safe even if it looks fragile by
+// overrun.
+static unsigned int calculate_cached_cycle_count(struct amdtp_stream *s, unsigned int head)
+{
+	const unsigned int cache_size = s->ctx_data.tx.cache.size;
+	unsigned int cycles = s->ctx_data.tx.cache.tail;
+
+	if (cycles < head)
+		cycles += cache_size;
+	cycles -= head;
+
+	return cycles;
+}
+
 static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsigned int desc_count)
 {
 	const unsigned int transfer_delay = s->transfer_delay;
@@ -536,6 +552,37 @@ static void pool_ideal_seq_descs(struct amdtp_stream *s, unsigned int count)
 	s->ctx_data.rx.seq.tail = (seq_tail + count) % seq_size;
 }
 
+static void pool_replayed_seq(struct amdtp_stream *s, unsigned int count)
+{
+	struct amdtp_stream *target = s->ctx_data.rx.replay_target;
+	const struct seq_desc *cache = target->ctx_data.tx.cache.descs;
+	const unsigned int cache_size = target->ctx_data.tx.cache.size;
+	unsigned int cache_head = s->ctx_data.rx.cache_head;
+	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
+	const unsigned int seq_size = s->ctx_data.rx.seq.size;
+	unsigned int seq_tail = s->ctx_data.rx.seq.tail;
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		descs[seq_tail] = cache[cache_head];
+		seq_tail = (seq_tail + 1) % seq_size;
+		cache_head = (cache_head + 1) % cache_size;
+	}
+
+	s->ctx_data.rx.seq.tail = seq_tail;
+	s->ctx_data.rx.cache_head = cache_head;
+}
+
+static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
+{
+	struct amdtp_domain *d = s->domain;
+
+	if (!d->replay.enable || !s->ctx_data.rx.replay_target)
+		pool_ideal_seq_descs(s, count);
+	else
+		pool_replayed_seq(s, count);
+}
+
 static void update_pcm_pointers(struct amdtp_stream *s,
 				struct snd_pcm_substream *pcm,
 				unsigned int frames)
@@ -1004,7 +1051,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	pool_ideal_seq_descs(s, packets);
+	pool_seq_descs(s, packets);
 
 	generate_pkt_descs(s, ctx_header, packets);
 
@@ -1392,28 +1439,54 @@ static void irq_target_callback_skip(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	struct amdtp_domain *d = s->domain;
-	unsigned int cycle;
+	bool ready_to_start;
 
 	skip_rx_packets(context, tstamp, header_length, header, private_data);
 	process_ctxs_in_domain(d);
 
+	if (d->replay.enable) {
+		unsigned int rx_count = 0;
+		unsigned int rx_ready_count = 0;
+		struct amdtp_stream *rx;
+
+		list_for_each_entry(rx, &d->streams, list) {
+			struct amdtp_stream *tx;
+			unsigned int cached_cycles;
+
+			if (rx->direction != AMDTP_OUT_STREAM)
+				continue;
+			++rx_count;
+
+			tx = rx->ctx_data.rx.replay_target;
+			cached_cycles = calculate_cached_cycle_count(tx, 0);
+			if (cached_cycles > tx->ctx_data.tx.cache.size / 2)
+				++rx_ready_count;
+		}
+
+		ready_to_start = (rx_count == rx_ready_count);
+	} else {
+		ready_to_start = true;
+	}
+
 	// Decide the cycle count to begin processing content of packet in IT contexts. All of IT
 	// contexts are expected to start and get callback when reaching here.
-	cycle = s->next_cycle;
-	list_for_each_entry(s, &d->streams, list) {
-		if (s->direction != AMDTP_OUT_STREAM)
-			continue;
+	if (ready_to_start) {
+		unsigned int cycle = s->next_cycle;
+		list_for_each_entry(s, &d->streams, list) {
+			if (s->direction != AMDTP_OUT_STREAM)
+				continue;
 
-		if (compare_ohci_cycle_count(s->next_cycle, cycle) > 0)
-			cycle = s->next_cycle;
+			if (compare_ohci_cycle_count(s->next_cycle, cycle) > 0)
+				cycle = s->next_cycle;
 
-		if (s == d->irq_target)
-			s->context->callback.sc = irq_target_callback_intermediately;
-		else
-			s->context->callback.sc = process_rx_packets_intermediately;
-	}
+			if (s == d->irq_target)
+				s->context->callback.sc = irq_target_callback_intermediately;
+			else
+				s->context->callback.sc = process_rx_packets_intermediately;
+		}
 
-	d->processing_cycle.rx_start = cycle;
+		d->processing_cycle.rx_start = cycle;
+	}
 }
 
 // This is executed one time. For in-stream, first packet has come. For out-stream, prepared to
@@ -1802,6 +1875,53 @@ int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
 
+// Make the reference from rx stream to tx stream for sequence replay. When the number of tx streams
+// is less than the number of rx streams, the first tx stream is selected.
+static int make_association(struct amdtp_domain *d)
+{
+	unsigned int dst_index = 0;
+	struct amdtp_stream *rx;
+
+	// Make association to replay target.
+	list_for_each_entry(rx, &d->streams, list) {
+		if (rx->direction == AMDTP_OUT_STREAM) {
+			unsigned int src_index = 0;
+			struct amdtp_stream *tx = NULL;
+			struct amdtp_stream *s;
+
+			list_for_each_entry(s, &d->streams, list) {
+				if (s->direction == AMDTP_IN_STREAM) {
+					if (dst_index == src_index) {
+						tx = s;
+						break;
+					}
+
+					++src_index;
+				}
+			}
+			if (!tx) {
+				// Select the first entry.
+				list_for_each_entry(s, &d->streams, list) {
+					if (s->direction == AMDTP_IN_STREAM) {
+						tx = s;
+						break;
+					}
+				}
+				// No target is available to replay sequence.
+				if (!tx)
+					return -EINVAL;
+			}
+
+			rx->ctx_data.rx.replay_target = tx;
+			rx->ctx_data.rx.cache_head = 0;
+
+			++dst_index;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * amdtp_domain_start - start sending packets for isoc context in the domain.
  * @d: the AMDTP domain.
@@ -1818,6 +1938,11 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
 	struct amdtp_stream *s;
 	int err;
 
+	if (replay_seq) {
+		err = make_association(d);
+		if (err < 0)
+			return err;
+	}
 	d->replay.enable = replay_seq;
 
 	// Select an IT context as IRQ target.
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index ddfb885b6113..61b6b5ae8b3b 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -166,6 +166,9 @@ struct amdtp_stream {
 			unsigned int data_block_state;
 			unsigned int syt_offset_state;
 			unsigned int last_syt_offset;
+
+			struct amdtp_stream *replay_target;
+			unsigned int cache_head;
 		} rx;
 	} ctx_data;
 
-- 
2.27.0

