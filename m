Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03538D2CD
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 03:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFF716B8;
	Sat, 22 May 2021 03:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFF716B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621647297;
	bh=Fnj7Qf+JIbqGyTJWf9Z1340dYKWJUxsSCjcnPS8tQTY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9ag60LvZlSLYS1ohs6vMNXuzy3Oz57heDcsqA6AMw2Jnox6qPAjRQfSU4ipdhfTS
	 0EFhGLMiOhLmKancy4NYWgNmt5AqSasAmjX5R2G3r7CdeXxqoQMUwZmhGOwWSxjxBj
	 nRN6kezqV4fdrQCD9U0BsUeuNb4TeTRZnumZaobw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E58D7F8027D;
	Sat, 22 May 2021 03:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6C0AF80217; Sat, 22 May 2021 03:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CB87F80217
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 03:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB87F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hqFwxRwG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="g07jMXaz"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C519F5C024A;
 Fri, 21 May 2021 21:33:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 21 May 2021 21:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1PnkI9x3FpNx3
 pObvJwkKgeAegiijK8QkociNPtQ0RI=; b=hqFwxRwGJxbpMX92ADh7Gkiw+ik+t
 4HleQV0LeBvSLBlSMDsR3GlsXgeggGCG4MDhSNkyJvu6XwHFUb5fZiZgwwIO+rPw
 Hm9C8K4sqzX9W5FCRRLugRC8Jc60LBaXNaZzudajWGnkLwGZhWS5SLRSXUZVJwnq
 AL7z8bmXrMYNMcMtlCYnuRnKWy/XUTCfbxATMgpB3gn1Dl+0F1tT9aXXx7xruCLE
 GM/EG3TNuyBOdWk3eh9yj7sgoT/aOLBlZZXKE15cSCMs4sKWHJmESYb2wQ/a7ehR
 oCoqtmd1qQl0ILdXPnHwC2UD2Vou3p/ymR6Q3Nyr9uqf+QVf9bW/gFCjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1PnkI9x3FpNx3pObvJwkKgeAegiijK8QkociNPtQ0RI=; b=g07jMXaz
 hq+Hwp1X3en1fdp/0Qo9/48FcWJc8S0w8pqHVbmbbczgE7C4RDOlCfIuY4Z/HBn4
 0sQxihMa/AtqxzK7xOQhQkxNuV+b5QY8FW/p5TNnGQWPWFNJYiYZndPS05CgR9Mb
 nf6X3xHuB3YnEN2zi99PzlXCxcoRylffX/TVHM5x7g+ujQDs4/sHGa8Y3QkIT2Jy
 GiSD3uwib3oi+EZWOktvLu1UY83Knxg72VsV+vh7xY/WTnRtsuQPNithU3Nw27/S
 M6XhyYICWczwzyZ+qNGhsMBEbrtZ4wwOqw2E2o7IPqVd+Pu2INie7kKT6OZYewqO
 hr2ArzZa9ZbvCA==
X-ME-Sender: <xms:Vl-oYL0gbR9T2QlIe47Fy56f8iloxGETi4WUiXYH19lNtmRTt9SKpQ>
 <xme:Vl-oYKHaEsnbz895Xs6pwgQDkmF-Mz_t74l81_4z3qFZDb9bpnFYlU0wx2-QO_HFu
 7vCfC5pTvX7cdobM9Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieetueeuvd
 elfedvteejteeiheeugeelvedvkeeffeffuedutdeifeeukeeutefgnecuffhomhgrihhn
 pehrgidruggrthgrnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgr
 mhhotggthhhirdhjph
X-ME-Proxy: <xmx:Vl-oYL4UQK-XPSx3_tukLT6B_Ry75yoeWRpnRUiZhllheDSsq3oeGA>
 <xmx:Vl-oYA319ljEgAl1puaGWUM7Fbl_WiY__SDJ-ziJkw5og9wCMW04rA>
 <xmx:Vl-oYOHIjyv19bF7gpxOXunFPlFAEOvd7Jr1QTN0rf4dXlhJSYEoUg>
 <xmx:Vl-oYJPL540zZ0MMyux-gTcazummLn92vt9M9ElyKJrDRUJya83deQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 21:33:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/6] ALSA: firewire-lib: pool sequence of packet in IT context
 independently
Date: Sat, 22 May 2021 10:32:59 +0900
Message-Id: <20210522013303.49596-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210522013303.49596-1-o-takashi@sakamocchi.jp>
References: <20210522013303.49596-1-o-takashi@sakamocchi.jp>
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

Current implementation pools the sequence in AMDTP domain. This is convenient
regarding to memory usage and computation time, however inconvenient for the
devices such that several rx streams are expected to transfer timing
information independently.

This commit refactors to pool the sequence per rx packet stream.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 150 ++++++++++++++--------------------
 sound/firewire/amdtp-stream.h |  22 ++---
 2 files changed, 72 insertions(+), 100 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 7e763f46e5a4..cf4fbbd18756 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -441,6 +441,30 @@ static unsigned int calculate_syt_offset(unsigned int *last_syt_offset,
 	return syt_offset;
 }
 
+static void pool_ideal_seq_descs(struct amdtp_stream *s, unsigned int count)
+{
+	unsigned int seq_tail = s->ctx_data.rx.seq.tail;
+	const unsigned int seq_size = s->ctx_data.rx.seq.size;
+	const unsigned int syt_interval = s->syt_interval;
+	const enum cip_sfc sfc = s->sfc;
+	const bool is_blocking = !!(s->flags & CIP_BLOCKING);
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		struct seq_desc *desc = s->ctx_data.rx.seq.descs + seq_tail;
+
+		desc->syt_offset = calculate_syt_offset(&s->ctx_data.rx.last_syt_offset,
+					&s->ctx_data.rx.syt_offset_state, sfc);
+		desc->data_blocks = calculate_data_blocks(&s->ctx_data.rx.data_block_state,
+				is_blocking, desc->syt_offset == CIP_SYT_NO_INFO,
+				syt_interval, sfc);
+
+		seq_tail = (seq_tail + 1) % seq_size;
+	}
+
+	s->ctx_data.rx.seq.tail = seq_tail;
+}
+
 static void update_pcm_pointers(struct amdtp_stream *s,
 				struct snd_pcm_substream *pcm,
 				unsigned int frames)
@@ -833,14 +857,14 @@ static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
 			       unsigned int seq_size)
 {
 	unsigned int dbc = s->data_block_counter;
-	unsigned int seq_index = s->ctx_data.rx.seq_index;
+	unsigned int seq_head = s->ctx_data.rx.seq.head;
 	bool aware_syt = !(s->flags & CIP_UNAWARE_SYT);
 	int i;
 
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % s->queue_size;
-		const struct seq_desc *seq = seq_descs + seq_index;
+		const struct seq_desc *seq = seq_descs + seq_head;
 
 		desc->cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
@@ -863,13 +887,13 @@ static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
 
 		desc->ctx_payload = s->buffer.packets[index].buffer;
 
-		seq_index = (seq_index + 1) % seq_size;
+		seq_head = (seq_head + 1) % seq_size;
 
 		++ctx_header;
 	}
 
 	s->data_block_counter = dbc;
-	s->ctx_data.rx.seq_index = seq_index;
+	s->ctx_data.rx.seq.head = seq_head;
 }
 
 static inline void cancel_stream(struct amdtp_stream *s)
@@ -911,8 +935,10 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	generate_pkt_descs(s, s->pkt_descs, ctx_header, packets, d->seq.descs,
-			   d->seq.size);
+	pool_ideal_seq_descs(s, packets);
+
+	generate_pkt_descs(s, s->pkt_descs, ctx_header, packets, s->ctx_data.rx.seq.descs,
+			   s->ctx_data.rx.seq.size);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
@@ -1152,51 +1178,6 @@ static void process_tx_packets_intermediately(struct fw_iso_context *context, u3
 	}
 }
 
-static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
-{
-	struct amdtp_stream *irq_target = d->irq_target;
-	unsigned int seq_tail = d->seq.tail;
-	unsigned int seq_size = d->seq.size;
-	unsigned int min_avail;
-	struct amdtp_stream *s;
-
-	min_avail = d->seq.size;
-	list_for_each_entry(s, &d->streams, list) {
-		unsigned int seq_index;
-		unsigned int avail;
-
-		if (s->direction == AMDTP_IN_STREAM)
-			continue;
-
-		seq_index = s->ctx_data.rx.seq_index;
-		avail = d->seq.tail;
-		if (seq_index > avail)
-			avail += d->seq.size;
-		avail -= seq_index;
-
-		if (avail < min_avail)
-			min_avail = avail;
-	}
-
-	while (min_avail < packets) {
-		struct seq_desc *desc = d->seq.descs + seq_tail;
-
-		desc->syt_offset = calculate_syt_offset(&d->last_syt_offset,
-					&d->syt_offset_state, irq_target->sfc);
-		desc->data_blocks = calculate_data_blocks(&d->data_block_state,
-				!!(irq_target->flags & CIP_BLOCKING),
-				desc->syt_offset == CIP_SYT_NO_INFO,
-				irq_target->syt_interval, irq_target->sfc);
-
-		++seq_tail;
-		seq_tail %= seq_size;
-
-		++min_avail;
-	}
-
-	d->seq.tail = seq_tail;
-}
-
 static void process_ctxs_in_domain(struct amdtp_domain *d)
 {
 	struct amdtp_stream *s;
@@ -1225,9 +1206,6 @@ static void irq_target_callback(struct fw_iso_context *context, u32 tstamp, size
 {
 	struct amdtp_stream *s = private_data;
 	struct amdtp_domain *d = s->domain;
-	unsigned int packets = header_length / sizeof(__be32);
-
-	pool_ideal_seq_descs(d, packets);
 
 	process_rx_packets(context, tstamp, header_length, header, private_data);
 	process_ctxs_in_domain(d);
@@ -1238,9 +1216,6 @@ static void irq_target_callback_intermediately(struct fw_iso_context *context, u
 {
 	struct amdtp_stream *s = private_data;
 	struct amdtp_domain *d = s->domain;
-	unsigned int packets = header_length / sizeof(__be32);
-
-	pool_ideal_seq_descs(d, packets);
 
 	process_rx_packets_intermediately(context, tstamp, header_length, header, private_data);
 	process_ctxs_in_domain(d);
@@ -1415,7 +1390,31 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		s->ctx_data.tx.max_ctx_payload_length = max_ctx_payload_size;
 		s->ctx_data.tx.ctx_header_size = ctx_header_size;
 	} else {
-		s->ctx_data.rx.seq_index = 0;
+		static const struct {
+			unsigned int data_block;
+			unsigned int syt_offset;
+		} *entry, initial_state[] = {
+			[CIP_SFC_32000]  = {  4, 3072 },
+			[CIP_SFC_48000]  = {  6, 1024 },
+			[CIP_SFC_96000]  = { 12, 1024 },
+			[CIP_SFC_192000] = { 24, 1024 },
+			[CIP_SFC_44100]  = {  0,   67 },
+			[CIP_SFC_88200]  = {  0,   67 },
+			[CIP_SFC_176400] = {  0,   67 },
+		};
+
+		s->ctx_data.rx.seq.descs = kcalloc(queue_size, sizeof(*s->ctx_data.rx.seq.descs), GFP_KERNEL);
+		if (!s->ctx_data.rx.seq.descs)
+			goto err_context;
+		s->ctx_data.rx.seq.size = queue_size;
+		s->ctx_data.rx.seq.tail = 0;
+		s->ctx_data.rx.seq.head = 0;
+
+		entry = &initial_state[s->sfc];
+		s->ctx_data.rx.data_block_state = entry->data_block;
+		s->ctx_data.rx.syt_offset_state = entry->syt_offset;
+		s->ctx_data.rx.last_syt_offset = TICKS_PER_CYCLE;
+
 		s->ctx_data.rx.event_count = 0;
 	}
 
@@ -1471,6 +1470,8 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 err_pkt_descs:
 	kfree(s->pkt_descs);
 err_context:
+	if (s->direction == AMDTP_OUT_STREAM)
+		kfree(s->ctx_data.rx.seq.descs);
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
 err_buffer:
@@ -1581,7 +1582,8 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
 	kfree(s->pkt_descs);
 
-	s->callbacked = false;
+	if (s->direction == AMDTP_OUT_STREAM)
+		kfree(s->ctx_data.rx.seq.descs);
 
 	mutex_unlock(&s->mutex);
 }
@@ -1613,8 +1615,6 @@ int amdtp_domain_init(struct amdtp_domain *d)
 
 	d->events_per_period = 0;
 
-	d->seq.descs = NULL;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_init);
@@ -1665,18 +1665,6 @@ EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
  */
 int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
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
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
 	unsigned int queue_size;
@@ -1705,17 +1693,6 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 	queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
 				  amdtp_rate_table[d->irq_target->sfc]);
 
-	d->seq.descs = kcalloc(queue_size, sizeof(*d->seq.descs), GFP_KERNEL);
-	if (!d->seq.descs)
-		return -ENOMEM;
-	d->seq.size = queue_size;
-	d->seq.tail = 0;
-
-	entry = &initial_state[s->sfc];
-	d->data_block_state = entry->data_block;
-	d->syt_offset_state = entry->syt_offset;
-	d->last_syt_offset = TICKS_PER_CYCLE;
-
 	list_for_each_entry(s, &d->streams, list) {
 		unsigned int idle_irq_interval = 0;
 
@@ -1734,8 +1711,6 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 error:
 	list_for_each_entry(s, &d->streams, list)
 		amdtp_stream_stop(s);
-	kfree(d->seq.descs);
-	d->seq.descs = NULL;
 	return err;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_start);
@@ -1760,8 +1735,5 @@ void amdtp_domain_stop(struct amdtp_domain *d)
 
 	d->events_per_period = 0;
 	d->irq_target = NULL;
-
-	kfree(d->seq.descs);
-	d->seq.descs = NULL;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_stop);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 6c4d277dc0dd..fc653fe95405 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -142,13 +142,23 @@ struct amdtp_stream {
 		struct {
 			// To calculate CIP data blocks and tstamp.
 			unsigned int transfer_delay;
-			unsigned int seq_index;
 
 			// To generate CIP header.
 			unsigned int fdf;
 
 			// To generate constant hardware IRQ.
 			unsigned int event_count;
+
+			struct {
+				struct seq_desc *descs;
+				unsigned int size;
+				unsigned int tail;
+				unsigned int head;
+			} seq;
+
+			unsigned int data_block_state;
+			unsigned int syt_offset_state;
+			unsigned int last_syt_offset;
 		} rx;
 	} ctx_data;
 
@@ -281,16 +291,6 @@ struct amdtp_domain {
 		unsigned int tx_start;
 		unsigned int rx_start;
 	} processing_cycle;
-
-	struct {
-		struct seq_desc *descs;
-		unsigned int size;
-		unsigned int tail;
-	} seq;
-
-	unsigned int data_block_state;
-	unsigned int syt_offset_state;
-	unsigned int last_syt_offset;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
-- 
2.27.0

