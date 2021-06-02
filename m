Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3C397E1A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 03:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 593AF16F0;
	Wed,  2 Jun 2021 03:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 593AF16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622597815;
	bh=9nEdwCE5e/d9jtVh9UHSicFvEeZ/3NsH3xucVQmMZsA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3F7hE0/wmDjWok79cuGllF2XzbJp3a9udR4pGd6r4dmI3UJ9kjyrBbasrqKZF2/y
	 siU14niI43oE/v1la3n2T/1zlT7ZG1xWxFpXXELBUx+Di6n1ySIpKuCVo0y/IHgte/
	 Bh913RpVtwA4KMU5fybk7AfkKPa8sFZz6GukxjmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95B3F804C2;
	Wed,  2 Jun 2021 03:34:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F913F804BC; Wed,  2 Jun 2021 03:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E417F80424
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 03:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E417F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TugkynzX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RaBMbkyR"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7A53015C4;
 Tue,  1 Jun 2021 21:34:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 01 Jun 2021 21:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IcNBCVh3Rc2tV
 REYPvaobN2lnamIDMDPPIMKZ1xOl4s=; b=TugkynzXmQhrJ1ZG+0LWX0NTV3Poj
 Ri1qJMro8vnS9nVnAkE3XAirxhCCO5JJX9ygSE4fFU0niYPFdhHqRON2MQTNqHAO
 OdzwTDR6uo05aSwQK0GD5A93FtOVil2BMt4Xs8aZZcsySQqs3IWHSOY/goO/mTYd
 LPovOymHZc1E2cBhXBUt5Vbe4CyeNAZgu8Uxj8btpsbEL6WbQoih1QRA0SmCdH/p
 zTQ7rwElIPEffp/KL0RyBs8L7qm9znjibBBrSUyU+4QZBqp0PqXBCxm9SCx/eCG5
 zHqo8nYLsOGWOuGHSAFyY1elu/gl6L5SybExifBcVDuEM8lDKMqjleZ0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IcNBCVh3Rc2tVREYPvaobN2lnamIDMDPPIMKZ1xOl4s=; b=RaBMbkyR
 UoXR6cLlzxbxFbJ3N7NuF6YK1NkixtjDB7CEu/z++wAUNj828vIxXd6PCoi3l2rH
 vbnAHoNH/C2ixiMht4lznw57qk03h7U0XmS4G4aEUkPLAIhygTKK9zqF/r/SeIMw
 FP1JOYn4wzxTVnns7Dz8h/XOVBQn8Pk0ouQSnYDJIfTVVnr90uNmWSWMteJrxYAV
 wlB8rGWJfyCcpSDr7vDwVTrfGZQNaG6RZ/2jTHGXTwgPe51g+Y1Bu7XzSpW7JVeH
 7FuCMVRKbHKK/2QpFLrCry0s54cTEoUCsgcCMYT3SpoOO6H398EYTQD265frw3Bv
 yE/qB0clHOpoBA==
X-ME-Sender: <xms:GeC2YIUqf-twGD1frGWuRYHD80ugkaB_4EVqK47fwYmxrSNzKA9jzg>
 <xme:GeC2YMm06lUaWlPGY1sIjSJHxkj6_I3RdN6Pp1Y0z5EEyBpi7bprJsNYIpUGKMO0Z
 OhNyT_ajU-viHrlMZA>
X-ME-Received: <xmr:GeC2YMbnB2JYuW5P46jlpB4G5MgCAnWRC1-l4gI_glpNXxbuQL3IXoD-9_wrQxjrNEqWl6vTqaBnAaNkVNDQCFIiHd5VyRfYhraaeZejiUjJRHxlZq10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeliedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:GeC2YHX_BHtUoKESVL0i0b-AqxcLaiYk1HOfJwGDhCF1arAnSmCqsg>
 <xmx:GeC2YCmnwxCv2EVlrZ4FHyhGXp6JQziXDXyDc56_Hhids7wsrTno7w>
 <xmx:GeC2YMeeLxTg23QfSEBJnwdjzGXfBtU7VQo-IU4vJwEXH5qMDDU-wg>
 <xmx:GeC2YGukjqjvdohcqU43qYq1J8cltZk-8oXGGCww3thyaRm-69aS0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 21:34:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-motu: sequence replay for source packet
 header
Date: Wed,  2 Jun 2021 10:34:06 +0900
Message-Id: <20210602013406.26442-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602013406.26442-1-o-takashi@sakamocchi.jp>
References: <20210602013406.26442-1-o-takashi@sakamocchi.jp>
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

This commit takes ALSA firewire-motu driver to perform sequence replay for
media clock recovery.

Unlike the other types of device, the devices in MOTU FireWire series
require two levels of sequence replay; the sequence of the number of
data blocks per packet and the sequence of source packet header per data
block. The former is already cached by ALSA IEC 61883-1/6 packet streaming
engine and ready to be replayed. The latter is also cached by ALSA
firewire-motu driver itself with a previous patch. This commit takes
the driver to replay both of them from the caches.

The sequence replay is tested with below models:

 * 828 mkII
 * Traveler
 * UltraLite
 * 828 mk3 FireWire
 * 828 mk3 Hybrid (except for high sampling transfer frequency
 * UltraLite mk3 FireWire
 * 4pre
 * AudioExpress

Unfortunately, below models still don't generate better sound, requires
more work:

 * 8pre
 * 828 mk3 Hybrid at high sampling transfer frequency

As long as I know, MOTU protocol version 1 requires extra care of the
format of data block, thus below models are not supported yet in this
time:

 * 828
 * 896

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c  | 91 ++++++-------------------------
 sound/firewire/motu/motu-stream.c |  7 ++-
 sound/firewire/motu/motu.h        |  2 +
 3 files changed, 26 insertions(+), 74 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 1741ceb381c7..5388b85fb60e 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -20,10 +20,6 @@
 #define CYCLES_PER_SECOND	8000
 #define TICKS_PER_SECOND	(TICKS_PER_CYCLE * CYCLES_PER_SECOND)
 
-#define IEEE1394_SEC_MODULUS	128
-
-#define TRANSFER_DELAY_TICKS	0x2e00 /* 479.17 microseconds */
-
 #define CIP_SPH_CYCLE_SHIFT	12
 #define CIP_SPH_CYCLE_MASK	0x01fff000
 #define CIP_SPH_OFFSET_MASK	0x00000fff
@@ -35,14 +31,6 @@
 #define MIDI_BYTES_PER_SECOND	3093
 
 struct amdtp_motu {
-	/* For timestamp processing.  */
-	unsigned int quotient_ticks_per_event;
-	unsigned int remainder_ticks_per_event;
-	unsigned int next_ticks;
-	unsigned int next_accumulated;
-	unsigned int next_cycles;
-	unsigned int next_seconds;
-
 	unsigned int pcm_chunks;
 	unsigned int pcm_byte_offset;
 
@@ -61,20 +49,8 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			      unsigned int midi_ports,
 			      struct snd_motu_packet_format *formats)
 {
-	static const struct {
-		unsigned int quotient_ticks_per_event;
-		unsigned int remainder_ticks_per_event;
-	} params[] = {
-		[CIP_SFC_44100]  = { 557, 123 },
-		[CIP_SFC_48000]  = { 512,   0 },
-		[CIP_SFC_88200]  = { 278, 282 },
-		[CIP_SFC_96000]  = { 256,   0 },
-		[CIP_SFC_176400] = { 139, 141 },
-		[CIP_SFC_192000] = { 128,   0 },
-	};
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_chunks, data_chunks, data_block_quadlets;
-	unsigned int delay;
 	unsigned int mode;
 	int i, err;
 
@@ -111,18 +87,6 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	p->midi_db_count = 0;
 	p->midi_db_interval = rate / MIDI_BYTES_PER_SECOND;
 
-	delay = TRANSFER_DELAY_TICKS;
-
-	// For no-data or empty packets to adjust PCM sampling frequency.
-	delay += TICKS_PER_SECOND * s->syt_interval / rate;
-
-	p->next_seconds = 0;
-	p->next_cycles = delay / TICKS_PER_CYCLE;
-	p->quotient_ticks_per_event = params[s->sfc].quotient_ticks_per_event;
-	p->remainder_ticks_per_event = params[s->sfc].remainder_ticks_per_event;
-	p->next_ticks = delay % TICKS_PER_CYCLE;
-	p->next_accumulated = 0;
-
 	return 0;
 }
 
@@ -400,47 +364,26 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 	return pcm_frames;
 }
 
-static inline void compute_next_elapse_from_start(struct amdtp_motu *p)
+static void write_sph(struct amdtp_motu_cache *cache, __be32 *buffer, unsigned int data_blocks,
+		      unsigned int data_block_quadlets)
 {
-	p->next_accumulated += p->remainder_ticks_per_event;
-	if (p->next_accumulated >= 441) {
-		p->next_accumulated -= 441;
-		p->next_ticks++;
-	}
-
-	p->next_ticks += p->quotient_ticks_per_event;
-	if (p->next_ticks >= TICKS_PER_CYCLE) {
-		p->next_ticks -= TICKS_PER_CYCLE;
-		p->next_cycles++;
-	}
-
-	if (p->next_cycles >= CYCLES_PER_SECOND) {
-		p->next_cycles -= CYCLES_PER_SECOND;
-		p->next_seconds++;
-	}
-
-	if (p->next_seconds >= IEEE1394_SEC_MODULUS)
-		p->next_seconds -= IEEE1394_SEC_MODULUS;
-}
-
-static void write_sph(struct amdtp_stream *s, __be32 *buffer, unsigned int data_blocks,
-		      const unsigned int rx_start_cycle)
-{
-	struct amdtp_motu *p = s->protocol;
-	unsigned int next_cycles;
-	unsigned int i;
-	u32 sph;
+	unsigned int *event_offsets = cache->event_offsets;
+	const unsigned int cache_size = cache->size;
+	unsigned int cache_head = cache->head;
+	unsigned int base_tick = cache->rx_cycle_count * TICKS_PER_CYCLE;
+	int i;
 
 	for (i = 0; i < data_blocks; i++) {
-		next_cycles = (rx_start_cycle + p->next_cycles) % CYCLES_PER_SECOND;
-		sph = ((next_cycles << CIP_SPH_CYCLE_SHIFT) | p->next_ticks) &
-		      (CIP_SPH_CYCLE_MASK | CIP_SPH_OFFSET_MASK);
+		unsigned int tick = (base_tick + event_offsets[cache_head]) % TICKS_PER_SECOND;
+		u32 sph = ((tick / TICKS_PER_CYCLE) << CIP_SPH_CYCLE_SHIFT) | (tick % TICKS_PER_CYCLE);
 		*buffer = cpu_to_be32(sph);
 
-		compute_next_elapse_from_start(p);
-
-		buffer += s->data_block_quadlets;
+		cache_head = (cache_head + 1) % cache_size;
+		buffer += data_block_quadlets;
 	}
+
+	cache->head = cache_head;
+	cache->rx_cycle_count = (cache->rx_cycle_count + 1) % CYCLES_PER_SECOND;
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
@@ -448,11 +391,13 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 					    unsigned int packets,
 					    struct snd_pcm_substream *pcm)
 {
-	const unsigned int rx_start_cycle = s->domain->processing_cycle.rx_start;
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_frames = 0;
 	int i;
 
+	if (p->cache->rx_cycle_count == UINT_MAX)
+		p->cache->rx_cycle_count = (s->domain->processing_cycle.rx_start % CYCLES_PER_SECOND);
+
 	// For data block processing.
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = descs + i;
@@ -471,7 +416,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		// TODO: how to interact control messages between userspace?
 
-		write_sph(s, buf, data_blocks, rx_start_cycle);
+		write_sph(p->cache, buf, data_blocks, s->data_block_quadlets);
 	}
 
 	// For tracepoints.
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 369002568b2d..43ff5be32b15 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -274,8 +274,13 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 
 		motu->cache.tail = 0;
 		motu->cache.tx_cycle_count = UINT_MAX;
+		motu->cache.head = 0;
+		motu->cache.rx_cycle_count = UINT_MAX;
 
-		err = amdtp_domain_start(&motu->domain, 0, false, false);
+		// NOTE: The device requires both of replay; the sequence of the number of data
+		// blocks per packet, and the sequence of source packet header per data block as
+		// presentation time.
+		err = amdtp_domain_start(&motu->domain, 0, true, false);
 		if (err < 0)
 			goto stop_streams;
 
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 10ba87062e81..674e3dc4e45d 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -44,6 +44,8 @@ struct amdtp_motu_cache {
 	unsigned int size;
 	unsigned int tail;
 	unsigned int tx_cycle_count;
+	unsigned int head;
+	unsigned int rx_cycle_count;
 };
 
 struct snd_motu {
-- 
2.27.0

