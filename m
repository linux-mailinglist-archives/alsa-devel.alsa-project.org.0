Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01287253E0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 17:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5686E168A;
	Tue, 21 May 2019 17:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5686E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558452411;
	bh=kBUE+WvsXxvX43VgLkEsQRoUVaPZyEXNoOucKgQVpdg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1gaZWHB2zzCNyGbQZYgA+EDNfUPTsUhm8IEMYrX9MK6oChxrCB2Ps0z2hdhdZHwN
	 1VIPfVVE3qQZk7s7yZWZMaZIlr2X6G08u2i+SHwNo9v0lYSZqWrivMs1mx6hUv6FEP
	 q7dRAfzKPkurK6sYaZtqqTJ6DEH98HuyXmaSfX2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C02E3F89728;
	Tue, 21 May 2019 17:25:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0FFF89674; Tue, 21 May 2019 17:11:56 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 405A3F8970E
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 405A3F8970E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cCoVdET6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="4HisCKS7"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C59AD21B10;
 Tue, 21 May 2019 10:57:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 21 May 2019 10:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tB9R1xkt1rlzi
 2s2Vq77IAjB4Pjf3JY1WMoBoJshIHM=; b=cCoVdET6RPcKE7nquPCF/+Zwl2kpF
 2nEUDq5vmGpppLiJPAh5pkBrLZu/2WSOglqsp+pIF9qwgxOzpdkUHvrMS1XHFj9I
 eOB+wu1CrxYaiVv44k+xZSYsR8gBnGPOVOTgHRT3KxZDBY5JvtWVrZxqn5JFb5Ox
 Wj3Auro5AJMIuRO3IzMpowckSACp0z70JG8nFgQkYvsGctJ7jLTSmcB9NaVd7V54
 TTucpPtLMSq1ooRKw3iSyZAugXoCZkfzA35EBQMIXQ3fXsen6GBCw5rKy5vtzSSd
 aNrvZ4koAyFizO5l0MxKmSQwIQnKput5aCeA1jtsIg6MKUfLiZNacYI9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tB9R1xkt1rlzi2s2Vq77IAjB4Pjf3JY1WMoBoJshIHM=; b=4HisCKS7
 OMyrKELbIq5LDnm5l7ofwru+jq8aM2MDwxQoV7kLw3z4wflR7KPYbCvGgi1RRKXv
 qU8qof8Ces5ZUIcHxcueSxC/Rv3Cca1rHGDqyDqeaMwdzouWJqFaZJ9qi71SgfTC
 R65iXvEueiXJ+cLYhl4Df8Jt3p7Aq81HYAYkQQqPMCr0N6sy3BvXVfQRs1nEjXWF
 RJo45Lj0pLjJiVsk3pS9+DqdKgpZJ4qKOz0M9vYOA6ThPdkWfiwV25P2G8v2oCgq
 N58IQ+CCX0En5buL8oGn03emQdsh/TAJggKnKhEMitoTHL2UejrgLRuIKADABNjV
 5wmraPJ2+MTHWg==
X-ME-Sender: <xms:6BHkXFuU25S3pz12-kCNtkrZ1zX0Onc1dc9ESil9DEmIVe35lxeTkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehrgidruggrthgrne
 cukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdht
 rghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6BHkXGFlY07djFD92nGXH5DnmnELKnT_--Le3r5SbnUTjX89vRU3mQ>
 <xmx:6BHkXI9XnFZOZddAyz1teFr24nWGN9uritAZnqsI1nkCdNlkVqhkDg>
 <xmx:6BHkXEOn0XeBObRNb1_XpW9d9GA1mndup-Z_1R6MR6d9sUcHzj5Xzw>
 <xmx:6BHkXDrYuKr3kJ8xjNkmXt_bY-V5Ns0OZVnVz52Xvakb_J7aTxS_0g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3EC3103D8;
 Tue, 21 May 2019 10:57:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 21 May 2019 23:57:34 +0900
Message-Id: <20190521145737.11809-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
References: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/4] ALSA: firewire-lib: use union for
	directional parameters
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

Some parameters of struct amdtp_stream is dependent on direction.

This commit uses union for such parameters to distinguish from
common parameters.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c                |  2 +-
 sound/firewire/amdtp-stream.c               | 97 ++++++++++++---------
 sound/firewire/amdtp-stream.h               | 35 +++++---
 sound/firewire/digi00x/amdtp-dot.c          |  2 +-
 sound/firewire/fireworks/fireworks_stream.c |  4 +-
 sound/firewire/motu/amdtp-motu.c            |  2 +-
 sound/firewire/tascam/amdtp-tascam.c        |  2 +-
 7 files changed, 87 insertions(+), 57 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 4210e5c6262e..7019a2143581 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -83,7 +83,7 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (err < 0)
 		return err;
 
-	s->fdf = AMDTP_FDF_AM824 | s->sfc;
+	s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
 
 	p->pcm_channels = pcm_channels;
 	p->midi_ports = midi_ports;
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 6b3f936fab91..6977fbbef755 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -260,11 +260,18 @@ int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	s->data_block_quadlets = data_block_quadlets;
 	s->syt_interval = amdtp_syt_intervals[sfc];
 
-	/* default buffering in the device */
-	s->transfer_delay = TRANSFER_DELAY_TICKS - TICKS_PER_CYCLE;
-	if (s->flags & CIP_BLOCKING)
-		/* additional buffering needed to adjust for no-data packets */
-		s->transfer_delay += TICKS_PER_SECOND * s->syt_interval / rate;
+	// default buffering in the device.
+	if (s->direction == AMDTP_OUT_STREAM) {
+		s->ctx_data.rx.transfer_delay =
+					TRANSFER_DELAY_TICKS - TICKS_PER_CYCLE;
+
+		if (s->flags & CIP_BLOCKING) {
+			// additional buffering needed to adjust for no-data
+			// packets.
+			s->ctx_data.rx.transfer_delay +=
+				TICKS_PER_SECOND * s->syt_interval / rate;
+		}
+	}
 
 	return 0;
 }
@@ -321,10 +328,10 @@ static unsigned int calculate_data_blocks(struct amdtp_stream *s,
 	/* Non-blocking mode. */
 	} else {
 		if (!cip_sfc_is_base_44100(s->sfc)) {
-			/* Sample_rate / 8000 is an integer, and precomputed. */
-			data_blocks = s->data_block_state;
+			// Sample_rate / 8000 is an integer, and precomputed.
+			data_blocks = s->ctx_data.rx.data_block_state;
 		} else {
-			phase = s->data_block_state;
+			phase = s->ctx_data.rx.data_block_state;
 
 		/*
 		 * This calculates the number of data blocks per packet so that
@@ -343,7 +350,7 @@ static unsigned int calculate_data_blocks(struct amdtp_stream *s,
 				data_blocks = 11 * (s->sfc >> 1) + (phase == 0);
 			if (++phase >= (80 >> (s->sfc >> 1)))
 				phase = 0;
-			s->data_block_state = phase;
+			s->ctx_data.rx.data_block_state = phase;
 		}
 	}
 
@@ -355,9 +362,10 @@ static unsigned int calculate_syt(struct amdtp_stream *s,
 {
 	unsigned int syt_offset, phase, index, syt;
 
-	if (s->last_syt_offset < TICKS_PER_CYCLE) {
+	if (s->ctx_data.rx.last_syt_offset < TICKS_PER_CYCLE) {
 		if (!cip_sfc_is_base_44100(s->sfc))
-			syt_offset = s->last_syt_offset + s->syt_offset_state;
+			syt_offset = s->ctx_data.rx.last_syt_offset +
+				     s->ctx_data.rx.syt_offset_state;
 		else {
 		/*
 		 * The time, in ticks, of the n'th SYT_INTERVAL sample is:
@@ -369,21 +377,21 @@ static unsigned int calculate_syt(struct amdtp_stream *s,
 		 *   1386 1386 1387 1386 1386 1386 1387 1386 1386 1386 1387 ...
 		 * This code generates _exactly_ the same sequence.
 		 */
-			phase = s->syt_offset_state;
+			phase = s->ctx_data.rx.syt_offset_state;
 			index = phase % 13;
-			syt_offset = s->last_syt_offset;
+			syt_offset = s->ctx_data.rx.last_syt_offset;
 			syt_offset += 1386 + ((index && !(index & 3)) ||
 					      phase == 146);
 			if (++phase >= 147)
 				phase = 0;
-			s->syt_offset_state = phase;
+			s->ctx_data.rx.syt_offset_state = phase;
 		}
 	} else
-		syt_offset = s->last_syt_offset - TICKS_PER_CYCLE;
-	s->last_syt_offset = syt_offset;
+		syt_offset = s->ctx_data.rx.last_syt_offset - TICKS_PER_CYCLE;
+	s->ctx_data.rx.last_syt_offset = syt_offset;
 
 	if (syt_offset < TICKS_PER_CYCLE) {
-		syt_offset += s->transfer_delay;
+		syt_offset += s->ctx_data.rx.transfer_delay;
 		syt = (cycle + syt_offset / TICKS_PER_CYCLE) << 12;
 		syt += syt_offset % TICKS_PER_CYCLE;
 
@@ -457,7 +465,8 @@ static inline int queue_out_packet(struct amdtp_stream *s,
 
 static inline int queue_in_packet(struct amdtp_stream *s)
 {
-	return queue_packet(s, IR_HEADER_SIZE, s->max_payload_length);
+	return queue_packet(s, s->ctx_data.tx.ctx_header_size,
+			    s->ctx_data.tx.max_payload_length);
 }
 
 static int handle_out_packet(struct amdtp_stream *s,
@@ -484,9 +493,9 @@ static int handle_out_packet(struct amdtp_stream *s,
 				((s->sph << CIP_SPH_SHIFT) & CIP_SPH_MASK) |
 				s->data_block_counter);
 	buffer[1] = cpu_to_be32(CIP_EOH |
-				((s->fmt << CIP_FMT_SHIFT) & CIP_FMT_MASK) |
-				((s->fdf << CIP_FDF_SHIFT) & CIP_FDF_MASK) |
-				(syt & CIP_SYT_MASK));
+			((s->fmt << CIP_FMT_SHIFT) & CIP_FMT_MASK) |
+			((s->ctx_data.rx.fdf << CIP_FDF_SHIFT) & CIP_FDF_MASK) |
+			(syt & CIP_SYT_MASK));
 
 	if (!(s->flags & CIP_DBC_IS_END_EVENT))
 		s->data_block_counter =
@@ -610,14 +619,14 @@ static int handle_in_packet(struct amdtp_stream *s,
 		data_block_counter = s->data_block_counter;
 
 	if (((s->flags & CIP_SKIP_DBC_ZERO_CHECK) &&
-	     data_block_counter == s->tx_first_dbc) ||
+	     data_block_counter == s->ctx_data.tx.first_dbc) ||
 	    s->data_block_counter == UINT_MAX) {
 		lost = false;
 	} else if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 		lost = data_block_counter != s->data_block_counter;
 	} else {
-		if (data_blocks > 0 && s->tx_dbc_interval > 0)
-			dbc_interval = s->tx_dbc_interval;
+		if (data_blocks > 0 && s->ctx_data.tx.dbc_interval > 0)
+			dbc_interval = s->ctx_data.tx.dbc_interval;
 		else
 			dbc_interval = data_blocks;
 
@@ -740,11 +749,11 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	if (s->packet_index < 0)
 		return;
 
-	/* The number of packets in buffer */
-	packets = header_length / IR_HEADER_SIZE;
+	// The number of packets in buffer.
+	packets = header_length / s->ctx_data.tx.ctx_header_size;
 
 	/* For buffer-over-run prevention. */
-	max_payload_length = s->max_payload_length;
+	max_payload_length = s->ctx_data.tx.max_payload_length;
 
 	for (i = 0; i < packets; i++) {
 		u32 iso_header = be32_to_cpu(ctx_header[0]);
@@ -765,7 +774,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		if (s->handle_packet(s, payload_length, cycle, i) < 0)
 			break;
 
-		ctx_header += IR_HEADER_SIZE / sizeof(__be32);
+		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
 	}
 
 	/* Queueing error or detecting invalid payload. */
@@ -837,7 +846,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	static const struct {
 		unsigned int data_block;
 		unsigned int syt_offset;
-	} initial_state[] = {
+	} *entry, initial_state[] = {
 		[CIP_SFC_32000]  = {  4, 3072 },
 		[CIP_SFC_48000]  = {  6, 1024 },
 		[CIP_SFC_96000]  = { 12, 1024 },
@@ -846,7 +855,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 		[CIP_SFC_88200]  = {  0,   67 },
 		[CIP_SFC_176400] = {  0,   67 },
 	};
-	unsigned int header_size;
+	unsigned int ctx_header_size;
 	enum dma_data_direction dir;
 	int type, tag, err;
 
@@ -858,23 +867,26 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 		goto err_unlock;
 	}
 
-	if (s->direction == AMDTP_IN_STREAM)
+	if (s->direction == AMDTP_IN_STREAM) {
 		s->data_block_counter = UINT_MAX;
-	else
+	} else {
+		entry = &initial_state[s->sfc];
+
 		s->data_block_counter = 0;
-	s->data_block_state = initial_state[s->sfc].data_block;
-	s->syt_offset_state = initial_state[s->sfc].syt_offset;
-	s->last_syt_offset = TICKS_PER_CYCLE;
+		s->ctx_data.rx.data_block_state = entry->data_block;
+		s->ctx_data.rx.syt_offset_state = entry->syt_offset;
+		s->ctx_data.rx.last_syt_offset = TICKS_PER_CYCLE;
+	}
 
 	/* initialize packet buffer */
 	if (s->direction == AMDTP_IN_STREAM) {
 		dir = DMA_FROM_DEVICE;
 		type = FW_ISO_CONTEXT_RECEIVE;
-		header_size = IR_HEADER_SIZE;
+		ctx_header_size = IR_HEADER_SIZE;
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
-		header_size = OUT_PACKET_HEADER_SIZE;
+		ctx_header_size = OUT_PACKET_HEADER_SIZE;
 	}
 	err = iso_packets_buffer_init(&s->buffer, s->unit, QUEUE_LENGTH,
 				      amdtp_stream_get_max_payload(s), dir);
@@ -882,8 +894,8 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 		goto err_unlock;
 
 	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
-					   type, channel, speed, header_size,
-					   amdtp_stream_first_callback, s);
+					  type, channel, speed, ctx_header_size,
+					  amdtp_stream_first_callback, s);
 	if (IS_ERR(s->context)) {
 		err = PTR_ERR(s->context);
 		if (err == -EBUSY)
@@ -894,8 +906,11 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 
 	amdtp_stream_update(s);
 
-	if (s->direction == AMDTP_IN_STREAM)
-		s->max_payload_length = amdtp_stream_get_max_payload(s);
+	if (s->direction == AMDTP_IN_STREAM) {
+		s->ctx_data.tx.max_payload_length =
+						amdtp_stream_get_max_payload(s);
+		s->ctx_data.tx.ctx_header_size = ctx_header_size;
+	}
 
 	if (s->flags & CIP_NO_HEADER)
 		s->tag = TAG_NO_CIP_HEADER;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index e45de3eecfe3..1945ef59ab92 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -111,7 +111,31 @@ struct amdtp_stream {
 	int (*handle_packet)(struct amdtp_stream *s,
 			unsigned int payload_quadlets, unsigned int cycle,
 			unsigned int index);
-	unsigned int max_payload_length;
+	union {
+		struct {
+			unsigned int ctx_header_size;
+
+			// limit for payload of iso packet.
+			unsigned int max_payload_length;
+
+			// For quirks of CIP headers.
+			// Fixed interval of dbc between previos/current
+			// packets.
+			unsigned int dbc_interval;
+			// Indicate the value of dbc field in a first packet.
+			unsigned int first_dbc;
+		} tx;
+		struct {
+			// To calculate CIP data blocks and tstamp.
+			unsigned int transfer_delay;
+			unsigned int data_block_state;
+			unsigned int last_syt_offset;
+			unsigned int syt_offset_state;
+
+			// To generate CIP header.
+			unsigned int fdf;
+		} rx;
+	} ctx_data;
 
 	/* For CIP headers. */
 	unsigned int source_node_id_field;
@@ -119,19 +143,10 @@ struct amdtp_stream {
 	unsigned int data_block_counter;
 	unsigned int sph;
 	unsigned int fmt;
-	unsigned int fdf;
-	/* quirk: fixed interval of dbc between previos/current packets. */
-	unsigned int tx_dbc_interval;
-	/* quirk: indicate the value of dbc field in a first packet. */
-	unsigned int tx_first_dbc;
 
 	/* Internal flags. */
 	enum cip_sfc sfc;
 	unsigned int syt_interval;
-	unsigned int transfer_delay;
-	unsigned int data_block_state;
-	unsigned int last_syt_offset;
-	unsigned int syt_offset_state;
 
 	/* For a PCM substream processing. */
 	struct snd_pcm_substream *pcm;
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 4a884a335248..3fb1997dca30 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -128,7 +128,7 @@ int amdtp_dot_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (err < 0)
 		return err;
 
-	s->fdf = AMDTP_FDF_AM824 | s->sfc;
+	s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
 
 	p->pcm_channels = pcm_channels;
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 827161bc269c..74e122e6e68a 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -165,13 +165,13 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 	    (efw->firmware_version == 0x5070000 ||
 	     efw->firmware_version == 0x5070300 ||
 	     efw->firmware_version == 0x5080000))
-		efw->tx_stream.tx_first_dbc = 0x02;
+		efw->tx_stream.ctx_data.tx.first_dbc = 0x02;
 	/* AudioFire9 always reports wrong dbs. */
 	if (efw->is_af9)
 		efw->tx_stream.flags |= CIP_WRONG_DBS;
 	/* Firmware version 5.5 reports fixed interval for dbc. */
 	if (efw->firmware_version == 0x5050000)
-		efw->tx_stream.tx_dbc_interval = 8;
+		efw->tx_stream.ctx_data.tx.dbc_interval = 8;
 
 	err = init_stream(efw, &efw->rx_stream);
 	if (err < 0) {
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index cb0c967dea63..62685f2528ce 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -429,7 +429,7 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		return err;
 
 	s->sph = 1;
-	s->fdf = MOTU_FDF_AM824;
+	s->ctx_data.rx.fdf = MOTU_FDF_AM824;
 
 	return 0;
 }
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index a52d1f76c610..1cf0f9470449 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -224,7 +224,7 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 		return 0;
 
 	/* Use fixed value for FDF field. */
-	s->fdf = 0x00;
+	s->ctx_data.rx.fdf = 0x00;
 
 	/* This protocol uses fixed number of data channels for PCM samples. */
 	p = s->protocol;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
