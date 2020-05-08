Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB41CA252
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1081831;
	Fri,  8 May 2020 06:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1081831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912716;
	bh=5yPflB5Y9LJTLWvEsOCpS7T/YTyXVse1E7paO16DyS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNJ4b1qMihuBAw8vBCiNhnr+b2yuKWp7YlHjrhaJTH6U3ncpam1t57R1+HkCGOyvR
	 ORxrvNH55WSpvT3rrn2bu4mas4L6eSubUggjM0hnF+sNGa+inxbcgb64za2J+Y/3Dv
	 N411merT2ATyp3WulKKOTSEw5bpwXl9PalRZXvGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349B5F80291;
	Fri,  8 May 2020 06:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B588F8028F; Fri,  8 May 2020 06:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA441F800AD
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA441F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="A5xq3dCU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Pk7UpFQH"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 26F4745D;
 Fri,  8 May 2020 00:36:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TBxPRGDXCNp0n
 7Gy7fmkzwzglwselvuFDp2YKtIZupY=; b=A5xq3dCUjeru5bBCYmrV4pG1jCjHQ
 m9IFh9/2f02kxt0HPEL7fPoDnH4t4iW72y6d/3Cv0Dh33/XpFZeLcciq7R6xLwQz
 dM4iAL7+lU82JgFZdGjlJMA5DFmcWvidTCcqXW8AKyKZVLVjq/Vfo/61ujez05ah
 RVIjwOwcQG8CpFiRtgoKtoXOz6QQaEpPAOm+BRb/MwR0/4I6pTQEDeI3tIRxJu9F
 e+WhRowJuizlAuovJVRTI3eASDzcO14bukJw1uDJ9TBsSYJmEJ58F341rUCYwJce
 YJa+yGdRLeZwvL+6UVyghiF0twLWeGd+OLJWSu+hEbhddbLtJoRmOCWqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TBxPRGDXCNp0n7Gy7fmkzwzglwselvuFDp2YKtIZupY=; b=Pk7UpFQH
 ULCO02CWfVhSLM8nfbfiuu8RrqCIER4yXWD7j82e/Td/bYnOBuY8nJyCMTXK02As
 H8yq7J055ihSEJdG31KWvPZdpgSy4a3LY3m4k376UQhvWRJWOx1zshzyNsjStgIn
 04PkrVZjJuhPpPyh/FyErwA4AhBuoahvhzMED5n62X81dxZbyW4+fsromLV4wJjT
 vjAEH5Hz+BaQXg1E98xDdR85x6mboOI6cU0CuTEkdjXrSxYdmxKofLT0tu9JNHUB
 s9rVrRnTWWygHgZjdpQ+NJSiY9cz5EDA/zpoLKcRgkbqKpuyZFtK8xA0O9eLU14I
 O77pXxk10flQBA==
X-ME-Sender: <xms:2eG0XqfCWCzsNU-CkRsAd3qUYWhmj_6I0nXRRncnZ0Wo0_MaXs2f3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeiveffvdehue
 dtlefffeegiedutedtvdejfeduteevueelheeuvdetveejtedtgeenucffohhmrghinhep
 rhigrdgvvhgvnhhtshenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2eG0XrPshILMAZSdWXDdJoQHgAzeVXVF1lkSY4tTuKJpfbsYsBA9Tw>
 <xmx:2eG0XnC7qF_GYP0XfJQXfjJ1TBtJHRfh5SoN6j9Nd9lVoeTwHA3K9g>
 <xmx:2eG0XhyMQrCzFQpLaReO6iEoEDJhfxvXC3whXkuE8Q97d3QHaHusBQ>
 <xmx:2eG0XppXjXhHHgQhzGv97ke-7GeQZU-3ALzOhjgAFTDDDjyYgedwjg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D741F3280063;
 Fri,  8 May 2020 00:36:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 03/10] ALSA: firewire-lib: add reference to domain structure
 from stream structure
Date: Fri,  8 May 2020 13:36:28 +0900
Message-Id: <20200508043635.349339-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

In current implementation, AMDTP domain structure and AMDTP stream
structure has one way of reference from the former to the latter. For
future extension, bidirectional reference is needed.

This commit adds a member into stream structure to refer to domain
structure to which the stream belongs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 75 ++++++++++-------------------------
 sound/firewire/amdtp-stream.h |  3 ++
 2 files changed, 23 insertions(+), 55 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fcde01b54d11..ce63ff6b7f03 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -793,14 +793,6 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 		update_pcm_pointers(s, pcm, pcm_frames);
 }
 
-static void amdtp_stream_master_callback(struct fw_iso_context *context,
-					 u32 tstamp, size_t header_length,
-					 void *header, void *private_data);
-
-static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
-					u32 tstamp, size_t header_length,
-					void *header, void *private_data);
-
 static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				size_t header_length, void *header,
 				void *private_data)
@@ -810,7 +802,6 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	unsigned int events_per_period = s->ctx_data.rx.events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
 	unsigned int packets;
-	bool is_irq_target;
 	int i;
 
 	if (s->packet_index < 0)
@@ -823,10 +814,6 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
-	is_irq_target =
-		!!(context->callback.sc == amdtp_stream_master_callback ||
-		   context->callback.sc == amdtp_stream_master_first_callback);
-
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
 		unsigned int syt;
@@ -845,7 +832,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				    desc->data_blocks, desc->data_block_counter,
 				    syt, i);
 
-		if (is_irq_target) {
+		if (s == s->domain->irq_target) {
 			event_count += desc->data_blocks;
 			if (event_count >= events_per_period) {
 				event_count -= events_per_period;
@@ -898,12 +885,12 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 }
 
-static void amdtp_stream_master_callback(struct fw_iso_context *context,
-					 u32 tstamp, size_t header_length,
-					 void *header, void *private_data)
+static void irq_target_callback(struct fw_iso_context *context, u32 tstamp,
+				size_t header_length, void *header,
+				void *private_data)
 {
-	struct amdtp_domain *d = private_data;
-	struct amdtp_stream *irq_target = d->irq_target;
+	struct amdtp_stream *irq_target = private_data;
+	struct amdtp_domain *d = irq_target->domain;
 	struct amdtp_stream *s;
 
 	out_stream_callback(context, tstamp, header_length, header, irq_target);
@@ -952,7 +939,10 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	} else {
 		cycle = compute_it_cycle(*ctx_header, s->queue_size);
 
-		context->callback.sc = out_stream_callback;
+		if (s == s->domain->irq_target)
+			context->callback.sc = irq_target_callback;
+		else
+			context->callback.sc = out_stream_callback;
 	}
 
 	s->start_cycle = cycle;
@@ -960,32 +950,11 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	context->callback.sc(context, tstamp, header_length, header, s);
 }
 
-static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
-					       u32 tstamp, size_t header_length,
-					       void *header, void *private_data)
-{
-	struct amdtp_domain *d = private_data;
-	struct amdtp_stream *s = d->irq_target;
-	const __be32 *ctx_header = header;
-
-	s->callbacked = true;
-	wake_up(&s->callback_wait);
-
-	s->start_cycle = compute_it_cycle(*ctx_header, s->queue_size);
-
-	context->callback.sc = amdtp_stream_master_callback;
-
-	context->callback.sc(context, tstamp, header_length, header, d);
-}
-
 /**
  * amdtp_stream_start - start transferring packets
  * @s: the AMDTP stream to start
  * @channel: the isochronous channel on the bus
  * @speed: firewire speed code
- * @d: the AMDTP domain to which the AMDTP stream belongs
- * @is_irq_target: whether isoc context for the AMDTP stream is used to generate
- *		   hardware IRQ.
  * @start_cycle: the isochronous cycle to start the context. Start immediately
  *		 if negative value is given.
  *
@@ -994,7 +963,6 @@ static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
  * device can be started.
  */
 static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
-			      struct amdtp_domain *d, bool is_irq_target,
 			      int start_cycle)
 {
 	static const struct {
@@ -1009,15 +977,14 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		[CIP_SFC_88200]  = {  0,   67 },
 		[CIP_SFC_176400] = {  0,   67 },
 	};
-	unsigned int events_per_buffer = d->events_per_buffer;
-	unsigned int events_per_period = d->events_per_period;
+	bool is_irq_target = (s == s->domain->irq_target);
+	unsigned int events_per_buffer;
+	unsigned int events_per_period;
 	unsigned int idle_irq_interval;
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
 	int type, tag, err;
-	fw_iso_callback_t ctx_cb;
-	void *ctx_data;
 
 	mutex_lock(&s->mutex);
 
@@ -1068,6 +1035,8 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	// This is a case that AMDTP streams in domain run just for MIDI
 	// substream. Use the number of events equivalent to 10 msec as
 	// interval of hardware IRQ.
+	events_per_buffer = s->domain->events_per_buffer;
+	events_per_period = s->domain->events_per_period;
 	if (events_per_period == 0)
 		events_per_period = amdtp_rate_table[s->sfc] / 100;
 	if (events_per_buffer == 0)
@@ -1086,16 +1055,11 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if (is_irq_target) {
 		s->ctx_data.rx.events_per_period = events_per_period;
 		s->ctx_data.rx.event_count = 0;
-		ctx_cb = amdtp_stream_master_first_callback;
-		ctx_data = d;
-	} else {
-		ctx_cb = amdtp_stream_first_callback;
-		ctx_data = s;
 	}
 
 	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
 					  type, channel, speed, ctx_header_size,
-					  ctx_cb, ctx_data);
+					  amdtp_stream_first_callback, s);
 	if (IS_ERR(s->context)) {
 		err = PTR_ERR(s->context);
 		if (err == -EBUSY)
@@ -1340,6 +1304,7 @@ int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 
 	s->channel = channel;
 	s->speed = speed;
+	s->domain = d;
 
 	return 0;
 }
@@ -1428,15 +1393,15 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 		}
 
 		if (s != d->irq_target) {
-			err = amdtp_stream_start(s, s->channel, s->speed, d,
-						 false, cycle_match);
+			err = amdtp_stream_start(s, s->channel, s->speed,
+						 cycle_match);
 			if (err < 0)
 				goto error;
 		}
 	}
 
 	s = d->irq_target;
-	err = amdtp_stream_start(s, s->channel, s->speed, d, true, -1);
+	err = amdtp_stream_start(s, s->channel, s->speed, -1);
 	if (err < 0)
 		goto error;
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index f2d44e2dc3c8..477fbfe713e5 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -108,6 +108,8 @@ typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
 						const struct pkt_desc *desc,
 						unsigned int packets,
 						struct snd_pcm_substream *pcm);
+
+struct amdtp_domain;
 struct amdtp_stream {
 	struct fw_unit *unit;
 	enum cip_flags flags;
@@ -180,6 +182,7 @@ struct amdtp_stream {
 	int channel;
 	int speed;
 	struct list_head list;
+	struct amdtp_domain *domain;
 };
 
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
-- 
2.25.1

