Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BB661C46
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 03:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9BE18A31;
	Mon,  9 Jan 2023 03:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9BE18A31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673230724;
	bh=QQ+ysRLrKaKEED9EZZcLcwnSHJEnYtESaKwVYm8Xwr4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bh7cI3BnXH6+EzXtfCMUtVTTe7ptzx8W4xZmMbY818SeYY5bBitart6P5BkH3JYgX
	 YH9nij4e3oSyZoe/4ljqUHf1+t8y0k9qLYSwriQLmqj4g5kaKl5DGed98NBCyg+J8d
	 y8S1bwM09jUEEpzwIZH66v2OUoupSNrZTfCrWYZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EECBF80236;
	Mon,  9 Jan 2023 03:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9251F804DC; Mon,  9 Jan 2023 03:17:51 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id B61FFF80236
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 03:17:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61FFF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=IA5Y1GrU; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fop2WOcT
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C2AC5C007A;
 Sun,  8 Jan 2023 21:17:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 08 Jan 2023 21:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673230665; x=
 1673317065; bh=6NqHpuEHWVrn5HpT90XSJk2Abb5pY4uZHPL5ol0KGyU=; b=I
 A5Y1GrU0zosZXZ37PfUFFVOH8fP++m/KG1fo7Bne8rZD1Fy2QYP1ts9VlVdPvUmU
 Uw0ts51gt2vTDj6p2IEvb7n5Wa6ZpjmDSFWWrkgLEA1hnQaEJi78SdtcUUDA3KCb
 QT9rCYQPfRDVtGQjqxBDgGuRDe0IUNRq5KpUgXIwsKgCL/YuG3cAXQROnsMhrp0U
 GKYOkJ4bVlWMEZHviKFcnCDLKelxLj26/QdhYRLU/zcOvUHZuvtQEgRgCw/absQR
 FcTdG9Vi4EX4bx5bYPEgQJImt93atAOIPqARKn7UJcCQIky+4wTSj/cE+E2JXijS
 Yj18/+k4oMEJ2YaOWLNDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673230665; x=1673317065; bh=6NqHpuEHWVrn5
 HpT90XSJk2Abb5pY4uZHPL5ol0KGyU=; b=fop2WOcTwm2+Cr+eWIhNVa8heLZPb
 vzpROBr6+UTVvjFsGec9rPkGpio/qgX8HtHnrhWmcDUtNym2oQllEI/bwWax8RI2
 q1xkiyNkDtcC05j6tbIsemwt6hJnehrozNKuPAq0/ZH6XyfVzj8ACp7mmLWT7Emt
 g4gJSEHofJQ03sDr4KzD2yuEol/IAN/ZmO2aKY29/X2UpINA12At60nqfphqs7Gk
 XhpvxyP6kcWstm5BUoNXRy1udl+08u+Ms14VZ5tiYcf+VPRz+yXitKsb8Gl4mjXY
 fpjsT9ZwWKn4CooGlohmr5s+JDg9EVqoSosVF+gSXqgsOsYSR/NhaHPBA==
X-ME-Sender: <xms:SXm7Y2J749I1n6KCVAZV9Pt469zseDyjzQUcjhTiVii_DQyJBAN1LA>
 <xme:SXm7Y-KwAy5wUQTzul-lCArFCqZxLRSwpJRH45_3iHnfTJKP5ORqaTxgmuNgVFhOC
 WgyR5vvP3X0C2P4Itw>
X-ME-Received: <xmr:SXm7Y2u0NezTiKxL2DQDfFSofFc7xznhHLrqupXcagMMmJvhPxHFW2ujK37KI_j7U5jVgsa8Eas_Rx8QFUXtmuDG_0r1qtD4BCzhGngFlbnKtlSa-4QLMt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:SXm7Y7ZffTS-sP8vaYmOY9UBS4Al5EtHxTAJeNzDfapLyfA--ajjkw>
 <xmx:SXm7Y9YIa0lbjd-zPIEVRc3LknuZ6lgkhxIOoGuRmBnPnaStk5febA>
 <xmx:SXm7Y3Cjsaac0HfB21omV_3DVJjVlZN2sgqggUSYyURPoh46RRnP5A>
 <xmx:SXm7Y8xrQJ1B3r94nhdENuH4U9jk70VHocM1RuVdmPCFDfic1j2h5A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 21:17:44 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-lib: use circular linked list to enumerate
 packet descriptors
Date: Mon,  9 Jan 2023 11:17:36 +0900
Message-Id: <20230109021738.75543-2-o-takashi@sakamocchi.jp>
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

Current implementation uses list of packet descriptor as template to
schedule isochronous packet. The packet descriptors are operated by
position and size, while circular linked list is convenient to enumerate
the packet descriptors.

This commit utilizes circular linked list for the purpose.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 47 ++++++++++++++++++++++-------------
 sound/firewire/amdtp-stream.h | 12 +++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 5ecb449ff6fa..794ac693aae6 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -504,7 +504,7 @@ static unsigned int calculate_cached_cycle_count(struct amdtp_stream *s, unsigne
 	return cycles;
 }
 
-static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsigned int desc_count)
+static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *src, unsigned int desc_count)
 {
 	const unsigned int transfer_delay = s->transfer_delay;
 	const unsigned int cache_size = s->ctx_data.tx.cache.size;
@@ -515,7 +515,6 @@ static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsi
 
 	for (i = 0; i < desc_count; ++i) {
 		struct seq_desc *dst = cache + cache_pos;
-		const struct pkt_desc *src = descs + i;
 
 		if (aware_syt && src->syt != CIP_SYT_NO_INFO)
 			dst->syt_offset = compute_syt_offset(src->syt, src->cycle, transfer_delay);
@@ -524,6 +523,7 @@ static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsi
 		dst->data_blocks = src->data_blocks;
 
 		cache_pos = (cache_pos + 1) % cache_size;
+		src = amdtp_stream_next_packet_desc(s, src);
 	}
 
 	s->ctx_data.tx.cache.pos = cache_pos;
@@ -881,7 +881,7 @@ static inline u32 compute_ohci_it_cycle(const __be32 ctx_header_tstamp,
 	return increment_ohci_cycle_count(cycle, queue_size);
 }
 
-static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *descs,
+static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *desc,
 				    const __be32 *ctx_header, unsigned int packet_count,
 				    unsigned int *desc_count)
 {
@@ -894,7 +894,6 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 
 	*desc_count = 0;
 	for (i = 0; i < packet_count; ++i) {
-		struct pkt_desc *desc = descs + *desc_count;
 		unsigned int cycle;
 		bool lost;
 		unsigned int data_blocks;
@@ -918,7 +917,7 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 					desc->data_blocks = 0;
 					desc->data_block_counter = dbc;
 					desc->ctx_payload = NULL;
-					++desc;
+					desc = amdtp_stream_next_packet_desc(s, desc);
 					++(*desc_count);
 				}
 			} else if (s->flags & CIP_JUMBO_PAYLOAD) {
@@ -951,6 +950,7 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 			dbc = (dbc + desc->data_blocks) & 0xff;
 
 		next_cycle = increment_ohci_cycle_count(next_cycle, 1);
+		desc = amdtp_stream_next_packet_desc(s, desc);
 		++(*desc_count);
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
 		packet_index = (packet_index + 1) % queue_size;
@@ -973,7 +973,7 @@ static unsigned int compute_syt(unsigned int syt_offset, unsigned int cycle,
 	return syt & CIP_SYT_MASK;
 }
 
-static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *descs,
+static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *desc,
 				     const __be32 *ctx_header, unsigned int packet_count)
 {
 	struct seq_desc *seq_descs = s->ctx_data.rx.seq.descs;
@@ -986,7 +986,6 @@ static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *de
 	pool_seq_descs(s, seq_descs, seq_size, seq_pos, packet_count);
 
 	for (i = 0; i < packet_count; ++i) {
-		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % s->queue_size;
 		const struct seq_desc *seq = seq_descs + seq_pos;
 
@@ -1010,6 +1009,7 @@ static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *de
 		desc->ctx_payload = s->buffer.packets[index].buffer;
 
 		seq_pos = (seq_pos + 1) % seq_size;
+		desc = amdtp_stream_next_packet_desc(s, desc);
 
 		++ctx_header;
 	}
@@ -1047,6 +1047,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	const __be32 *ctx_header = header;
 	const unsigned int events_per_period = d->events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
+	struct pkt_desc *desc = s->pkt_descs;
 	unsigned int pkt_header_length;
 	unsigned int packets;
 	bool need_hw_irq;
@@ -1058,9 +1059,9 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	generate_rx_packet_descs(s, s->pkt_descs, ctx_header, packets);
+	generate_rx_packet_descs(s, desc, ctx_header, packets);
 
-	process_ctx_payloads(s, s->pkt_descs, packets);
+	process_ctx_payloads(s, desc, packets);
 
 	if (!(s->flags & CIP_NO_HEADER))
 		pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
@@ -1078,7 +1079,6 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	}
 
 	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = s->pkt_descs + i;
 		struct {
 			struct fw_iso_packet params;
 			__be32 header[CIP_HEADER_QUADLETS];
@@ -1101,6 +1101,8 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			cancel_stream(s);
 			return;
 		}
+
+		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
 
 	s->ctx_data.rx.event_count = event_count;
@@ -1200,6 +1202,7 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 {
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
+	struct pkt_desc *desc = s->pkt_descs;
 	unsigned int packet_count;
 	unsigned int desc_count;
 	int i;
@@ -1212,7 +1215,7 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	packet_count = header_length / s->ctx_data.tx.ctx_header_size;
 
 	desc_count = 0;
-	err = generate_tx_packet_descs(s, s->pkt_descs, ctx_header, packet_count, &desc_count);
+	err = generate_tx_packet_descs(s, desc, ctx_header, packet_count, &desc_count);
 	if (err < 0) {
 		if (err != -EAGAIN) {
 			cancel_stream(s);
@@ -1221,10 +1224,10 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	} else {
 		struct amdtp_domain *d = s->domain;
 
-		process_ctx_payloads(s, s->pkt_descs, desc_count);
+		process_ctx_payloads(s, desc, desc_count);
 
 		if (d->replay.enable)
-			cache_seq(s, s->pkt_descs, desc_count);
+			cache_seq(s, desc, desc_count);
 	}
 
 	for (i = 0; i < packet_count; ++i) {
@@ -1547,7 +1550,8 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
-	int type, tag, err;
+	struct pkt_desc *descs;
+	int i, type, tag, err;
 
 	mutex_lock(&s->mutex);
 
@@ -1655,12 +1659,19 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	else
 		s->tag = TAG_CIP;
 
-	s->pkt_descs = kcalloc(s->queue_size, sizeof(*s->pkt_descs),
-			       GFP_KERNEL);
-	if (!s->pkt_descs) {
+	descs = kcalloc(s->queue_size, sizeof(*descs), GFP_KERNEL);
+	if (!descs) {
 		err = -ENOMEM;
 		goto err_context;
 	}
+	s->pkt_descs = descs;
+
+	INIT_LIST_HEAD(&s->packet_descs_list);
+	for (i = 0; i < s->queue_size; ++i) {
+		INIT_LIST_HEAD(&descs->link);
+		list_add_tail(&descs->link, &s->packet_descs_list);
+		++descs;
+	}
 
 	s->packet_index = 0;
 	do {
@@ -1700,6 +1711,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	return 0;
 err_pkt_descs:
 	kfree(s->pkt_descs);
+	s->pkt_descs = NULL;
 err_context:
 	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
@@ -1794,6 +1806,7 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 	s->context = ERR_PTR(-1);
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
 	kfree(s->pkt_descs);
+	s->pkt_descs = NULL;
 
 	if (s->direction == AMDTP_OUT_STREAM) {
 		kfree(s->ctx_data.rx.seq.descs);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index f021c1f49137..4bf701796166 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -103,6 +103,7 @@ struct pkt_desc {
 	unsigned int data_blocks;
 	unsigned int data_block_counter;
 	__be32 *ctx_payload;
+	struct list_head link;
 };
 
 struct amdtp_stream;
@@ -126,6 +127,7 @@ struct amdtp_stream {
 	unsigned int queue_size;
 	int packet_index;
 	struct pkt_desc *pkt_descs;
+	struct list_head packet_descs_list;
 	int tag;
 	union {
 		struct {
@@ -276,6 +278,16 @@ static inline void amdtp_stream_pcm_trigger(struct amdtp_stream *s,
 	WRITE_ONCE(s->pcm, pcm);
 }
 
+/**
+ * amdtp_stream_next_packet_desc - retrieve next descriptor for amdtp packet.
+ * @s: the AMDTP stream
+ * @desc: the descriptor of packet
+ *
+ * This macro computes next descriptor so that the list of descriptors behaves circular queue.
+ */
+#define amdtp_stream_next_packet_desc(s, desc) \
+	list_next_entry_circular(desc, &s->packet_descs_list, link)
+
 static inline bool cip_sfc_is_base_44100(enum cip_sfc sfc)
 {
 	return sfc & 1;
-- 
2.37.2

