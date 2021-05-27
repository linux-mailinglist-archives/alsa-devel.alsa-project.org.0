Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68017392DED
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 14:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC1C6171D;
	Thu, 27 May 2021 14:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC1C6171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622118491;
	bh=4+wup6YQQQbgT0o6UJX3Vbp3lqVZHvkGJt+TtLDtRV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBxBt92LqT2fU1CzTDmyPoyIa1+VgYBbOAnRv6zuN94cMVyrceaKkkoM+kM1zCdjD
	 wL/PIgLnSKkCWzWgF7qK7/q5i2wV0h1ALhkVcAcUD7kjXCL5aGxD4tlWeFFislEr3E
	 LVWjM+3cIKhjMfLjZSgm9H49VWtixKUynUkyq5Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72EA4F80301;
	Thu, 27 May 2021 14:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DAC2F80301; Thu, 27 May 2021 14:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD8FFF800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 14:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8FFF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lsoy/hS4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="D/VIVLgM"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C6B81A5C;
 Thu, 27 May 2021 08:26:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 May 2021 08:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wU4XjLzAinIM1
 ZkLtLYUnbqQao9l+Fsa4OWgF73KzrY=; b=lsoy/hS4QOxi/QTyoK39FH45A7Dxo
 SgDgazoowj7OAvVOAI7ZTZK5m9S0mjWjSEaksnmWIIgKLG+m3Wg25QnQr8GhJ2H6
 6BoS7OhiwlJz2WAQ8nHl6OkaOXdqpQKwT80aKayziCszV4I8CCu9FPRxaLRLVZup
 DzLBLt0tsJAuF443rMQsSov+TR9s9nFBgs+0iQvc1mOCNZlhvWPkS8rUgDQpLhbE
 xmLMbwa9tR5Fy8lzy3YlMrJfS14G54qAJCzRK2x94m1iLTxksFVdSZfnVZkejc9E
 8R84uHzUQHxumk/RwLTozgqHEH1Uq6rSLvIL+QAUR/wgMtgUWVrveF7WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wU4XjLzAinIM1ZkLtLYUnbqQao9l+Fsa4OWgF73KzrY=; b=D/VIVLgM
 yQgwtyLJ4dUzCVOFJX4ERIIfGFgYzAZWz3ILqiKkiAsrJuSfD3q/+L3PiIEQoYQJ
 3j3pB0PYj7e08tUlNofQSIp1hDpwXHk02xjPDgU1SUvEJEiPpVfH+xsg8ucYF3FO
 rDCdeeBqQ8h0DAi30A9law+BrgSIG5jwuvR1RG6/72KXBDsquOzTCTvNpfVtYOhE
 QL4dkYwsD//uB3nLTyLCF6GanBFmNj7FllaWZe/yi8D2TVVLuayV2oKQ2KP7kAoh
 w6WSayUlEpwojPUbtxW1Gx/Hus9IBySi72TKnb0mpjR0g9ZIcrZK4uYwSaKDSRz3
 CyFF0jnBoLXOow==
X-ME-Sender: <xms:64-vYE7nQcZGq4n-Oq4N5DEuXNBcbRSDdmiXm6RKLxF0eyvckX5jtw>
 <xme:64-vYF6svcceNTB_Wlb9ueBLFK1mVrRmsWQGuGDKsC_otHUMZBMo4_m8gTzFsNdAW
 bP4jiM2haevdVfNByc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:64-vYDcwp9b39LQm2aL3aJmBTss39kRijdRs7FhWFa5egvmWE6_42Q>
 <xmx:64-vYJJdGAQPObJZpTYtBdXWYdlwdA00BAo3voK_dP5rSL6xxvfLlA>
 <xmx:64-vYILHTL2P5yl-LaqEoWjLdjD4uI9R1QIdEza-B1ykiARhu8R0LA>
 <xmx:64-vYCx9v8sKyjmYUjCb4w_JvTeV9EszQ37pLYZRl3eSeDC8RJRGmg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:26:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-lib: add replay target to cache sequence
 of packet
Date: Thu, 27 May 2021 21:26:09 +0900
Message-Id: <20210527122611.173711-2-o-takashi@sakamocchi.jp>
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

In design of audio and music unit in IEEE 1394 bus, feedback of
effective sampling transfer frequency (STF) is delivered by packets
transferred from device. The devices supported by ALSA firewire stack
are categorized to three groups regarding to it.

 * Group 1:
   * Echo Audio Fireworks board module
   * Oxford Semiconductor OXFW971 ASIC
   * Digidesign Digi00x family
   * Tascam FireWire series
   * RME Fireface series

 * Group 2:
   * BridgeCo. DM1000/DM1100/DM1500 ASICs for BeBoB solution
   * TC Applied Technologies DICE ASICs

 * Group 3:
   * Mark of the Unicord FireWire series

In group 1, the effective STF is determined by the sequence of the number
of events per packet. In group 2, the sequence of presentation timestamp
expressed in syt field of CIP header is interpreted as well. In group 3,
the presentation timestamp is expressed in source packet header (SPH) of
each data block.

I note that some models doesn't take care of effective STF with large
internal buffer. It's reasonable to name it as group 0:

 * Group 0
   * Oxford Semiconductor OXFW970 ASIC

The effective STF is known to be slightly different from nominal STF for
all of devices, and to be different between the devices. Furthermore, the
effective STF is known to be shifted for long-period transmission. This
makes it hard for software to satisfy the effective STF when processing
packets to the device.

The effective STF is deterministic as a result of analyzing the batch of
packet transferred from the device. For the analysis, caching the sequence
of parameter in the packet is required.

This commit adds an option so that AMDTP domain structure takes AMDTP
stream structure to cache the sequence of parameters in packet transferred
from the device. The parameters are offset ticks of syt field against the
cycle to receive the packet and the number of data blocks per packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c               | 82 ++++++++++++++++++++-
 sound/firewire/amdtp-stream.h               | 12 ++-
 sound/firewire/bebob/bebob_stream.c         |  2 +-
 sound/firewire/dice/dice-stream.c           |  2 +-
 sound/firewire/digi00x/digi00x-stream.c     |  2 +-
 sound/firewire/fireface/ff-stream.c         |  2 +-
 sound/firewire/fireworks/fireworks_stream.c |  2 +-
 sound/firewire/motu/motu-stream.c           |  2 +-
 sound/firewire/oxfw/oxfw-stream.c           |  2 +-
 sound/firewire/tascam/tascam-stream.c       |  2 +-
 10 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 68ffbc33f692..860942ffb1f1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -52,6 +52,7 @@
 #define CIP_FDF_NO_DATA		0xff
 #define CIP_SYT_MASK		0x0000ffff
 #define CIP_SYT_NO_INFO		0xffff
+#define CIP_SYT_CYCLE_MODULUS	16
 #define CIP_NO_DATA		((CIP_FDF_NO_DATA << CIP_FDF_SHIFT) | CIP_SYT_NO_INFO)
 
 #define CIP_HEADER_SIZE		(sizeof(__be32) * CIP_HEADER_QUADLETS)
@@ -473,6 +474,52 @@ static void pool_ideal_syt_offsets(struct amdtp_stream *s, struct seq_desc *desc
 	s->ctx_data.rx.syt_offset_state = state;
 }
 
+static unsigned int compute_syt_offset(unsigned int syt, unsigned int cycle,
+				       unsigned int transfer_delay)
+{
+	unsigned int cycle_lo = (cycle % CYCLES_PER_SECOND) & 0x0f;
+	unsigned int syt_cycle_lo = (syt & 0xf000) >> 12;
+	unsigned int syt_offset;
+
+	// Round up.
+	if (syt_cycle_lo < cycle_lo)
+		syt_cycle_lo += CIP_SYT_CYCLE_MODULUS;
+	syt_cycle_lo -= cycle_lo;
+
+	// Subtract transfer delay so that the synchronization offset is not so large
+	// at transmission.
+	syt_offset = syt_cycle_lo * TICKS_PER_CYCLE + (syt & 0x0fff);
+	if (syt_offset < transfer_delay)
+		syt_offset += CIP_SYT_CYCLE_MODULUS * TICKS_PER_CYCLE;
+
+	return syt_offset - transfer_delay;
+}
+
+static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsigned int desc_count)
+{
+	const unsigned int transfer_delay = s->transfer_delay;
+	const unsigned int cache_size = s->ctx_data.tx.cache.size;
+	struct seq_desc *cache = s->ctx_data.tx.cache.descs;
+	unsigned int cache_tail = s->ctx_data.tx.cache.tail;
+	bool aware_syt = !(s->flags & CIP_UNAWARE_SYT);
+	int i;
+
+	for (i = 0; i < desc_count; ++i) {
+		struct seq_desc *dst = cache + cache_tail;
+		const struct pkt_desc *src = descs + i;
+
+		if (aware_syt && src->syt != CIP_SYT_NO_INFO)
+			dst->syt_offset = compute_syt_offset(src->syt, src->cycle, transfer_delay);
+		else
+			dst->syt_offset = CIP_SYT_NO_INFO;
+		dst->data_blocks = src->data_blocks;
+
+		cache_tail = (cache_tail + 1) % cache_size;
+	}
+
+	s->ctx_data.tx.cache.tail = cache_tail;
+}
+
 static void pool_ideal_seq_descs(struct amdtp_stream *s, unsigned int count)
 {
 	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
@@ -1107,7 +1154,12 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			return;
 		}
 	} else {
+		struct amdtp_domain *d = s->domain;
+
 		process_ctx_payloads(s, s->pkt_descs, desc_count);
+
+		if (d->replay.enable)
+			cache_seq(s, s->pkt_descs, desc_count);
 	}
 
 	for (i = 0; i < packets; ++i) {
@@ -1463,6 +1515,18 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		s->ctx_data.tx.max_ctx_payload_length = max_ctx_payload_size;
 		s->ctx_data.tx.ctx_header_size = ctx_header_size;
 		s->ctx_data.tx.event_starts = false;
+
+		if (s->domain->replay.enable) {
+			// struct fw_iso_context.drop_overflow_headers is false therefore it's
+			// possible to cache much unexpectedly.
+			s->ctx_data.tx.cache.size = max_t(unsigned int, s->syt_interval * 2,
+							  queue_size * 3 / 2);
+			s->ctx_data.tx.cache.tail = 0;
+			s->ctx_data.tx.cache.descs = kcalloc(s->ctx_data.tx.cache.size,
+						sizeof(*s->ctx_data.tx.cache.descs), GFP_KERNEL);
+			if (!s->ctx_data.tx.cache.descs)
+				goto err_context;
+		}
 	} else {
 		static const struct {
 			unsigned int data_block;
@@ -1543,8 +1607,12 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 err_pkt_descs:
 	kfree(s->pkt_descs);
 err_context:
-	if (s->direction == AMDTP_OUT_STREAM)
+	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
+	} else {
+		if (s->domain->replay.enable)
+			kfree(s->ctx_data.tx.cache.descs);
+	}
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
 err_buffer:
@@ -1655,8 +1723,12 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
 	kfree(s->pkt_descs);
 
-	if (s->direction == AMDTP_OUT_STREAM)
+	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
+	} else {
+		if (s->domain->replay.enable)
+			kfree(s->ctx_data.tx.cache.descs);
+	}
 
 	mutex_unlock(&s->mutex);
 }
@@ -1735,8 +1807,10 @@ EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
  * @d: the AMDTP domain.
  * @tx_init_skip_cycles: the number of cycles to skip processing packets at initial stage of IR
  *			 contexts.
+ * @replay_seq: whether to replay the sequence of packet in IR context for the sequence of packet in
+ *		IT context.
  */
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq)
 {
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
@@ -1744,6 +1818,8 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 	struct amdtp_stream *s;
 	int err;
 
+	d->replay.enable = replay_seq;
+
 	// Select an IT context as IRQ target.
 	list_for_each_entry(s, &d->streams, list) {
 		if (s->direction == AMDTP_OUT_STREAM)
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 34294776f9e8..ddfb885b6113 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -141,6 +141,12 @@ struct amdtp_stream {
 
 			// The device starts multiplexing events to the packet.
 			bool event_starts;
+
+			struct {
+				struct seq_desc *descs;
+				unsigned int size;
+				unsigned int tail;
+			} cache;
 		} tx;
 		struct {
 			// To generate CIP header.
@@ -292,6 +298,10 @@ struct amdtp_domain {
 		unsigned int tx_start;
 		unsigned int rx_start;
 	} processing_cycle;
+
+	struct {
+		bool enable;
+	} replay;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
@@ -300,7 +310,7 @@ void amdtp_domain_destroy(struct amdtp_domain *d);
 int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 			    int channel, int speed);
 
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles);
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 91306da1bafe..fb776f871133 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -652,7 +652,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		// MEMO: In the early stage of packet streaming, the device transfers NODATA packets.
 		// After several hundred cycles, it begins to multiplex event into the packet with
 		// syt information.
-		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles);
+		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index a9a0fe9635dd..064f28f1822b 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -459,7 +459,7 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 			goto error;
 		}
 
-		err = amdtp_domain_start(&dice->domain, 0);
+		err = amdtp_domain_start(&dice->domain, 0, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index f11aaff2e248..5daba75a5bf3 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -375,7 +375,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&dg00x->domain, 0);
+		err = amdtp_domain_start(&dg00x->domain, 0, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 53a21fb95add..12779e7caf22 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -199,7 +199,7 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&ff->domain, 0);
+		err = amdtp_domain_start(&ff->domain, 0, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 858cd6085c1f..0106fa6d1eaf 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -272,7 +272,7 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&efw->domain, 0);
+		err = amdtp_domain_start(&efw->domain, 0, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 925241ae2551..5af9d7487cdc 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -260,7 +260,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			goto stop_streams;
 
-		err = amdtp_domain_start(&motu->domain, 0);
+		err = amdtp_domain_start(&motu->domain, 0, false);
 		if (err < 0)
 			goto stop_streams;
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 4121d95e161f..a6e97a37f129 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -354,7 +354,7 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 			}
 		}
 
-		err = amdtp_domain_start(&oxfw->domain, 0);
+		err = amdtp_domain_start(&oxfw->domain, 0, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 296ecf5f6ddc..eb4c7c47f8e9 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -473,7 +473,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&tscm->domain, 0);
+		err = amdtp_domain_start(&tscm->domain, 0, false);
 		if (err < 0)
 			return err;
 
-- 
2.27.0

