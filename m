Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1A397E19
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 03:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA4D16F4;
	Wed,  2 Jun 2021 03:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA4D16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622597803;
	bh=vECZOQ4xceWiH14FX7Gr6qdLlCnrRLxv/HkePZalm5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJ29tyS5p5F0nItn3LO1jnj1K4gBsSAuKhYAELXK9Tly9Dxg/2BRJ56XiXmeJG06U
	 tchwSU0vqQIRPi/i7eXGiOgPkiF9npnT3TqP6X3KVKfvvSPTxMKgAhZZOVdhKJLE8Z
	 tTPsRgo4/9btCOC+zUSm01hdds17uChx+DooBNcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5A1F80424;
	Wed,  2 Jun 2021 03:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA106F80103; Wed,  2 Jun 2021 03:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4ACDF80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 03:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4ACDF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0/uBdB7r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HbGABeQC"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 78FC815CF;
 Tue,  1 Jun 2021 21:34:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Jun 2021 21:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nqj3IV7pqig3a
 wYigVUQvrgdtHw38viRqXcz1z7UBLo=; b=0/uBdB7ruBN2P19YmQKuFiUMHbGMk
 P6JhW8wnXWzAt4ygmR3h/Pgi0jLjr1Orncurkwe9ToZEBVR36rTZtVZsG6cOdDWP
 5xhNU7njfYdzjNDYINpiWPK5EoskQEbvLOYEdSl6q0pVutpo81QOx5pGtzTy0DX/
 h0gWuMkPIM3pWkzevarY/otQn/ATqj9eet9IYfTmZ4cy23ZpgW+aee0EcT1aH76j
 86swwCb1UimDnTRvl6Xt/YL+8DzEBBGximutlxMKLd+Y9QMx15nr0qB+PMNPKnk+
 P56ibTPFRIt64OYnd8fZvLm/jIIu56svaAa8NP1Pybta+ryg1ZdRYApeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nqj3IV7pqig3awYigVUQvrgdtHw38viRqXcz1z7UBLo=; b=HbGABeQC
 pG5xYFZOipbIQ3lVAlDzGxidXowlNaul7G78B7dpJb567Ls9rZS6RIb8cFBlg/Ub
 iqTUbsMOyTk1V0ZBwXI1GMLGAph/Xrmun23lllkFeqy0cWrPVbnZLPuOPLbqDaz8
 5Mg6GjjEJYHo2og5CtjmvhdljZKL2uN6Rqz2+qCTD2di5CR96Ngm02BGC3TCm+u6
 JeyR6zPGw5OBy85y6FfX6EGjS7xMqPqiOh7CAQzhd5P8Gd+SNPi9xq2M247Ac6YZ
 A/ItyWVRTZ5zW9tMujxDedi8Avtai6A/JKC/2PEDRBP53OzWHby4MbLX6ViF6xAf
 2bDhlRz/2Uj1uw==
X-ME-Sender: <xms:F-C2YKbR9JjvozxHvnKaIMakVUZYtSvjByUNcd8JvycdSclPPyvXvw>
 <xme:F-C2YNaDlpVqGKOu7CjwVxk3Dw68slLJRj2QuNhBCkBDk_Rbf0E4fynTXBgr5mZg7
 Ur-1EnlAf-cH63Pz8U>
X-ME-Received: <xmr:F-C2YE--MAC_3iHZly1sgMRh9dsJlMY6CMfnjKpNApw7v5a-fMaW2-BV9KjiTVVShVFSYp-XnJrDWnynKknP8Pxr79_vTx-eaqMM6AVpCj0oA-cUAOw2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeliedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:F-C2YMptcxfe8uQNdZzrjBSsJjBcsFkMWZGKdKwdrXrMx8VXtxJ1SQ>
 <xmx:F-C2YFr_RE_ojeOxguKdiwtVldEKhsfp2Ku7fHzGWB8Eo-YLjZz5IA>
 <xmx:F-C2YKQxqrE0kTiAzVDIuSxYVWQy43FI_mlDajsXygBcgBc-nxoJlw>
 <xmx:F-C2YGComibEtoxH35H3-ydw0EB31iFgAsrooqCb5JeCiDY9DFRfuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 21:34:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-motu: cache event ticks in source packet
 header per data block
Date: Wed,  2 Jun 2021 10:34:05 +0900
Message-Id: <20210602013406.26442-3-o-takashi@sakamocchi.jp>
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

The devices in MOTU FireWire series put source packet header (SPH) into
each data block of tx packet for presentation time of event. The format
of timestamp is compliant to IEC 61883-1, with cycle and offset fields
without sec field of 32 bit cycle time.

This commit takes ALSA firewire-motu driver to cache the presentation
time as offset from cycle in which the packet is transferred.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c  | 41 ++++++++++++++++++++++++++++++-
 sound/firewire/motu/motu-stream.c | 20 ++++++++++++++-
 sound/firewire/motu/motu.h        | 12 ++++++++-
 3 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 89638e1fbb69..1741ceb381c7 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -53,6 +53,8 @@ struct amdtp_motu {
 
 	int midi_db_count;
 	unsigned int midi_db_interval;
+
+	struct amdtp_motu_cache *cache;
 };
 
 int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
@@ -333,6 +335,34 @@ static void probe_tracepoints_events(struct amdtp_stream *s,
 	}
 }
 
+static void cache_event_offsets(struct amdtp_motu_cache *cache, const __be32 *buf,
+				unsigned int data_blocks, unsigned int data_block_quadlets)
+{
+	unsigned int *event_offsets = cache->event_offsets;
+	const unsigned int cache_size = cache->size;
+	unsigned int cache_tail = cache->tail;
+	unsigned int base_tick = cache->tx_cycle_count * TICKS_PER_CYCLE;
+	int i;
+
+	for (i = 0; i < data_blocks; ++i) {
+		u32 sph = be32_to_cpu(*buf);
+		unsigned int tick;
+
+		tick = ((sph & CIP_SPH_CYCLE_MASK) >> CIP_SPH_CYCLE_SHIFT) * TICKS_PER_CYCLE +
+		       (sph & CIP_SPH_OFFSET_MASK);
+
+		if (tick < base_tick)
+			tick += TICKS_PER_SECOND;
+		event_offsets[cache_tail] = tick - base_tick;
+
+		cache_tail = (cache_tail + 1) % cache_size;
+		buf += data_block_quadlets;
+	}
+
+	cache->tail = cache_tail;
+	cache->tx_cycle_count = (cache->tx_cycle_count + 1) % CYCLES_PER_SECOND;
+}
+
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 					    const struct pkt_desc *descs,
 					    unsigned int packets,
@@ -342,12 +372,17 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 	unsigned int pcm_frames = 0;
 	int i;
 
+	if (p->cache->tx_cycle_count == UINT_MAX)
+		p->cache->tx_cycle_count = (s->domain->processing_cycle.tx_start % CYCLES_PER_SECOND);
+
 	// For data block processing.
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = descs + i;
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
+		cache_event_offsets(p->cache, buf, data_blocks, s->data_block_quadlets);
+
 		if (pcm) {
 			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
 			pcm_frames += data_blocks;
@@ -449,11 +484,12 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
-		    const struct snd_motu_spec *spec)
+		    const struct snd_motu_spec *spec, struct amdtp_motu_cache *cache)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	int fmt = CIP_FMT_MOTU;
 	unsigned int flags = CIP_BLOCKING | CIP_UNAWARE_SYT;
+	struct amdtp_motu *p;
 	int err;
 
 	if (dir == AMDTP_IN_STREAM) {
@@ -493,5 +529,8 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		s->ctx_data.rx.fdf = MOTU_FDF_AM824;
 	}
 
+	p = s->protocol;
+	p->cache = cache;
+
 	return 0;
 }
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 5d8d067f366d..369002568b2d 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -153,6 +153,9 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 		fw_iso_resources_free(&motu->tx_resources);
 		fw_iso_resources_free(&motu->rx_resources);
 
+		kfree(motu->cache.event_offsets);
+		motu->cache.event_offsets = NULL;
+
 		err = snd_motu_protocol_set_clock_rate(motu, rate);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
@@ -181,6 +184,15 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 			fw_iso_resources_free(&motu->rx_resources);
 			return err;
 		}
+
+		motu->cache.size = motu->tx_stream.syt_interval * frames_per_buffer;
+		motu->cache.event_offsets = kcalloc(motu->cache.size, sizeof(*motu->cache.event_offsets),
+						  GFP_KERNEL);
+		if (!motu->cache.event_offsets) {
+			fw_iso_resources_free(&motu->tx_resources);
+			fw_iso_resources_free(&motu->rx_resources);
+			return err;
+		}
 	}
 
 	return 0;
@@ -260,6 +272,9 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			goto stop_streams;
 
+		motu->cache.tail = 0;
+		motu->cache.tx_cycle_count = UINT_MAX;
+
 		err = amdtp_domain_start(&motu->domain, 0, false, false);
 		if (err < 0)
 			goto stop_streams;
@@ -293,6 +308,9 @@ void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 
 		fw_iso_resources_free(&motu->tx_resources);
 		fw_iso_resources_free(&motu->rx_resources);
+
+		kfree(motu->cache.event_offsets);
+		motu->cache.event_offsets = NULL;
 	}
 }
 
@@ -314,7 +332,7 @@ static int init_stream(struct snd_motu *motu, struct amdtp_stream *s)
 	if (err < 0)
 		return err;
 
-	err = amdtp_motu_init(s, motu->unit, dir, motu->spec);
+	err = amdtp_motu_init(s, motu->unit, dir, motu->spec, &motu->cache);
 	if (err < 0)
 		fw_iso_resources_destroy(resources);
 
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 92effb6e6c96..10ba87062e81 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -39,6 +39,13 @@ struct snd_motu_packet_format {
 	unsigned char pcm_chunks[3];
 };
 
+struct amdtp_motu_cache {
+	unsigned int *event_offsets;
+	unsigned int size;
+	unsigned int tail;
+	unsigned int tx_cycle_count;
+};
+
 struct snd_motu {
 	struct snd_card *card;
 	struct fw_unit *unit;
@@ -70,6 +77,8 @@ struct snd_motu {
 	wait_queue_head_t hwdep_wait;
 
 	struct amdtp_domain domain;
+
+	struct amdtp_motu_cache cache;
 };
 
 enum snd_motu_spec_flags {
@@ -125,7 +134,8 @@ extern const struct snd_motu_spec snd_motu_spec_4pre;
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
-		    const struct snd_motu_spec *spec);
+		    const struct snd_motu_spec *spec,
+		    struct amdtp_motu_cache *cache);
 int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			      unsigned int midi_ports,
 			      struct snd_motu_packet_format *formats);
-- 
2.27.0

