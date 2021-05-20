Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271CD389C51
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B27BB16A4;
	Thu, 20 May 2021 06:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B27BB16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483581;
	bh=P2rzXv/fZm8Ti3/xsKvo5NaUsVQzXFqacb+woY37ucc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igG9k8Bo5O2fxb6lHRbsFodeJMJREx4HdyhrnueQTgTsMEwLEojgciu04qOfysxXj
	 5KvTOgSK4+wEboMR7yBnl+JZDNA5s37UoTqIyfOXVXTxOB7GEWSs8bQRZTujQHdBYK
	 sY6741FrJGg72+fB49pwKoXM91nsrzm9cM7hgcaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D71E5F804E0;
	Thu, 20 May 2021 06:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F1E6F804AD; Thu, 20 May 2021 06:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40EE2F80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40EE2F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dgxyUHZj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dgEkq1O3"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 75A735C00DD;
 Thu, 20 May 2021 00:02:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 20 May 2021 00:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mP+Q3IZcZrPMa
 Z6h6iaO9BClYEAUyHlcCDDTPY88nCg=; b=dgxyUHZjZtGPIzO0s8dbIboHUqkEF
 1zX7B4JXbkudRl+IB2ztQDQiT5stQ+RujfNRri+K4P+3TX9QVcX2whz1hGskbwsS
 oFyspGCaqvhhtY7rvPa+8jgnp8fIKyjZpXTQTO90TdtS0cMHMpab4IEREXJLAUeT
 DUPj7bSpJPwLk87VCh9NQvPZ3APJXfSWLExQYCDBw/TZODnm8Z6p3rqBCwiJBxpr
 LcQp4Lz1nbJUhmFItwxPemJ4DBBTQQrDMtdPggaA1rgfd6VLwDx7eZdAotsSLoQS
 +ZSeaEjUS2VNEZIdbqe4bqmHaaH34eGFMNx/eQTotXr6islATJlxGZRLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mP+Q3IZcZrPMaZ6h6iaO9BClYEAUyHlcCDDTPY88nCg=; b=dgEkq1O3
 Fy7a7CDw3yyCeSUfOstKzyg5bIr630gf8d09+TGCtb3cGPF48wDjNqnPbitr9+op
 9ffV9yoLqLIMsLrJjjmVlWT32iTKuscD+OHAohu/Twqp6pg3K8QhmOKD+rVx+9fi
 wL2kS3sQwAltSwI/f4+f8n1naRlDa51bETrcEfiLNTidpO8D6yAj/ETztK+hh5iT
 S+YAccp/zGpCjQZGCkcReqxM8o4nCv8SvLv01oJZtwM80Aou/spfQjdgLG0YJLhc
 HaBbjBBe9FhdoeZjSAu52RojXYmhbAcmzVBq7HpAm7dTehpEMv+AAp8aNufc7usr
 j3fGf6N83VmOIg==
X-ME-Sender: <xms:QN-lYJ9xzx-3AgZUTn6sWBJQWbE_nBO2XYQdn0eTApnp0e9pyxh-sg>
 <xme:QN-lYNtW8tOj163DE2VRlTYMtRn8-QwyzF77MG9UoKxW6vZe6xCTcQzryevZPuca3
 2yCcCvFBveejjYV8MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:QN-lYHAVfOuoGu6cyJw5grZ0losr4OgJH6dWOPGh8IFLJAHYT9FKgA>
 <xmx:QN-lYNcsO-e1U4LqibZz4O1uOpvUQS2Q-zvKoCfLIVENjFYChEEFHA>
 <xmx:QN-lYOMF86I9NccGIYW5GZZzwN7fzD3JzHmVDsUeNqiaaCkremdiVA>
 <xmx:QN-lYIVwzD1OjgaboW4mhGmD9ORdlozuLhYMxG0L7OYXchoohZwOsA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:07 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 7/8] ALSA: firewire-lib: start processing content of packet at
 the same cycle in several IT contexts
Date: Thu, 20 May 2021 13:01:53 +0900
Message-Id: <20210520040154.80450-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
References: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
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

DICE ASICs support several pairs of isochronous packet streaming and
expect software to queue packets with the same timing information into
the same isochronous cycle.

This commit adds structure member to manage the cycle to start
processing packet in several IT contexts. The cycle is decided when
batch of isochronous cycle is skipped in callback to isochronous context
for IRQ target.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c    | 177 ++++++++++++++++++++++++++-----
 sound/firewire/amdtp-stream.h    |   2 +-
 sound/firewire/motu/amdtp-motu.c |   9 +-
 3 files changed, 156 insertions(+), 32 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b244fd863ca9..e9bdb609f2eb 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -894,14 +894,13 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 		update_pcm_pointers(s, pcm, pcm_frames);
 }
 
-static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
-				size_t header_length, void *header,
-				void *private_data)
+static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+			       void *header, void *private_data)
 {
 	struct amdtp_stream *s = private_data;
 	const struct amdtp_domain *d = s->domain;
 	const __be32 *ctx_header = header;
-	unsigned int events_per_period = d->events_per_period;
+	const unsigned int events_per_period = d->events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
 	unsigned int pkt_header_length;
 	unsigned int packets;
@@ -958,6 +957,89 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	s->ctx_data.rx.event_count = event_count;
 }
 
+static void skip_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+			    void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	const __be32 *ctx_header = header;
+	unsigned int packets;
+	unsigned int cycle;
+	int i;
+
+	if (s->packet_index < 0)
+		return;
+
+	packets = header_length / sizeof(*ctx_header);
+
+	cycle = compute_ohci_it_cycle(ctx_header[packets - 1], s->queue_size);
+	s->next_cycle = increment_ohci_cycle_count(cycle, 1);
+
+	for (i = 0; i < packets; ++i) {
+		struct fw_iso_packet params = {
+			.header_length = 0,
+			.payload_length = 0,
+		};
+		bool sched_irq = (s == d->irq_target && i == packets - 1);
+
+		if (queue_out_packet(s, &params, sched_irq) < 0) {
+			cancel_stream(s);
+			return;
+		}
+	}
+}
+
+static void irq_target_callback(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+				void *header, void *private_data);
+
+static void process_rx_packets_intermediately(struct fw_iso_context *context, u32 tstamp,
+					size_t header_length, void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	__be32 *ctx_header = header;
+	const unsigned int queue_size = s->queue_size;
+	unsigned int packets;
+	unsigned int offset;
+
+	if (s->packet_index < 0)
+		return;
+
+	packets = header_length / sizeof(*ctx_header);
+
+	offset = 0;
+	while (offset < packets) {
+		unsigned int cycle = compute_ohci_it_cycle(ctx_header[offset], queue_size);
+
+		if (compare_ohci_cycle_count(cycle, d->processing_cycle.rx_start) >= 0)
+			break;
+
+		++offset;
+	}
+
+	if (offset > 0) {
+		unsigned int length = sizeof(*ctx_header) * offset;
+
+		skip_rx_packets(context, tstamp, length, ctx_header, private_data);
+		if (amdtp_streaming_error(s))
+			return;
+
+		ctx_header += offset;
+		header_length -= length;
+	}
+
+	if (offset < packets) {
+		process_rx_packets(context, tstamp, header_length, ctx_header, private_data);
+		if (amdtp_streaming_error(s))
+			return;
+
+		if (s == d->irq_target)
+			s->context->callback.sc = irq_target_callback;
+		else
+			s->context->callback.sc = process_rx_packets;
+	}
+}
+
 static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
 			       void *header, void *private_data)
 {
@@ -1116,34 +1198,22 @@ static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 	d->seq.tail = seq_tail;
 }
 
-static void irq_target_callback(struct fw_iso_context *context, u32 tstamp,
-				size_t header_length, void *header,
-				void *private_data)
+static void process_ctxs_in_domain(struct amdtp_domain *d)
 {
-	struct amdtp_stream *irq_target = private_data;
-	struct amdtp_domain *d = irq_target->domain;
-	unsigned int packets = header_length / sizeof(__be32);
 	struct amdtp_stream *s;
 
-	// Record enough entries with extra 3 cycles at least.
-	pool_ideal_seq_descs(d, packets + 3);
-
-	out_stream_callback(context, tstamp, header_length, header, irq_target);
-	if (amdtp_streaming_error(irq_target))
-		goto error;
-
 	list_for_each_entry(s, &d->streams, list) {
-		if (s != irq_target && amdtp_stream_running(s)) {
+		if (s != d->irq_target && amdtp_stream_running(s))
 			fw_iso_context_flush_completions(s->context);
-			if (amdtp_streaming_error(s))
-				goto error;
-		}
+
+		if (amdtp_streaming_error(s))
+			goto error;
 	}
 
 	return;
 error:
-	if (amdtp_stream_running(irq_target))
-		cancel_stream(irq_target);
+	if (amdtp_stream_running(d->irq_target))
+		cancel_stream(d->irq_target);
 
 	list_for_each_entry(s, &d->streams, list) {
 		if (amdtp_stream_running(s))
@@ -1151,6 +1221,61 @@ static void irq_target_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 }
 
+static void irq_target_callback(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+				void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	unsigned int packets = header_length / sizeof(__be32);
+
+	pool_ideal_seq_descs(d, packets);
+
+	process_rx_packets(context, tstamp, header_length, header, private_data);
+	process_ctxs_in_domain(d);
+}
+
+static void irq_target_callback_intermediately(struct fw_iso_context *context, u32 tstamp,
+					size_t header_length, void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	unsigned int packets = header_length / sizeof(__be32);
+
+	pool_ideal_seq_descs(d, packets);
+
+	process_rx_packets_intermediately(context, tstamp, header_length, header, private_data);
+	process_ctxs_in_domain(d);
+}
+
+static void irq_target_callback_skip(struct fw_iso_context *context, u32 tstamp,
+				     size_t header_length, void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	unsigned int cycle;
+
+	skip_rx_packets(context, tstamp, header_length, header, private_data);
+	process_ctxs_in_domain(d);
+
+	// Decide the cycle count to begin processing content of packet in IT contexts. All of IT
+	// contexts are expected to start and get callback when reaching here.
+	cycle = s->next_cycle;
+	list_for_each_entry(s, &d->streams, list) {
+		if (s->direction != AMDTP_OUT_STREAM)
+			continue;
+
+		if (compare_ohci_cycle_count(s->next_cycle, cycle) > 0)
+			cycle = s->next_cycle;
+
+		if (s == d->irq_target)
+			s->context->callback.sc = irq_target_callback_intermediately;
+		else
+			s->context->callback.sc = process_rx_packets_intermediately;
+	}
+
+	d->processing_cycle.rx_start = cycle;
+}
+
 // this is executed one time.
 static void amdtp_stream_first_callback(struct fw_iso_context *context,
 					u32 tstamp, size_t header_length,
@@ -1176,13 +1301,11 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 		cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
 		if (s == d->irq_target)
-			context->callback.sc = irq_target_callback;
+			context->callback.sc = irq_target_callback_skip;
 		else
-			context->callback.sc = out_stream_callback;
+			context->callback.sc = skip_rx_packets;
 	}
 
-	s->start_cycle = cycle;
-
 	context->callback.sc(context, tstamp, header_length, header, s);
 
 	// Decide the cycle count to begin processing content of packet in IR contexts.
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index ebd040560791..7725d9793458 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -170,7 +170,6 @@ struct amdtp_stream {
 	/* To wait for first packet. */
 	bool callbacked;
 	wait_queue_head_t callback_wait;
-	u32 start_cycle;
 	unsigned int next_cycle;
 
 	/* For backends to process data blocks. */
@@ -291,6 +290,7 @@ struct amdtp_domain {
 	struct {
 		unsigned int tx_init_skip;
 		unsigned int tx_start;
+		unsigned int rx_start;
 	} processing_cycle;
 
 	struct {
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index edb31ac26868..9ccde07d6295 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -377,8 +377,8 @@ static inline void compute_next_elapse_from_start(struct amdtp_motu *p)
 		p->next_seconds -= 128;
 }
 
-static void write_sph(struct amdtp_stream *s, __be32 *buffer,
-		      unsigned int data_blocks)
+static void write_sph(struct amdtp_stream *s, __be32 *buffer, unsigned int data_blocks,
+		      const unsigned int rx_start_cycle)
 {
 	struct amdtp_motu *p = s->protocol;
 	unsigned int next_cycles;
@@ -386,7 +386,7 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer,
 	u32 sph;
 
 	for (i = 0; i < data_blocks; i++) {
-		next_cycles = (s->start_cycle + p->next_cycles) % 8000;
+		next_cycles = (rx_start_cycle + p->next_cycles) % 8000;
 		sph = ((next_cycles << 12) | p->next_ticks) & 0x01ffffff;
 		*buffer = cpu_to_be32(sph);
 
@@ -401,6 +401,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 					    unsigned int packets,
 					    struct snd_pcm_substream *pcm)
 {
+	const unsigned int rx_start_cycle = s->domain->processing_cycle.rx_start;
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_frames = 0;
 	int i;
@@ -423,7 +424,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		// TODO: how to interact control messages between userspace?
 
-		write_sph(s, buf, data_blocks);
+		write_sph(s, buf, data_blocks, rx_start_cycle);
 	}
 
 	// For tracepoints.
-- 
2.27.0

