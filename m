Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AADBDA3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D102168B;
	Fri, 18 Oct 2019 08:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D102168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379874;
	bh=bcSRnvfcdPKtO9/SZo228d+jV/y/d87MIR2w7aUcE0k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pi5PyZdjyuEmrGEc/fOUERJcyevhYVHoy3hm8PAD9DOyzDTO6bcKZlvaHYOI0mi02
	 e0sfBT+aKGK5yt4M3ReHRhyXP/+L+euHa1T6qTwOKZ0VxxrJwllCdqsOMDMhX6xRV4
	 pNKocjlaWWYnh7v0ZKszNA0RLVEGKr3pfxJZmbhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CAE4F8064C;
	Fri, 18 Oct 2019 08:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37570F805FF; Fri, 18 Oct 2019 08:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EEB3F805F5
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEB3F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Zsj64ytv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Fv+2Udsa"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C144B435;
 Fri, 18 Oct 2019 02:19:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4zlG53Fnbka4s
 oR2yyp017jEEawHxtg3AOAe3pxYXHU=; b=Zsj64ytvVb+q9k8afwFpt5zIcy8xd
 cSdmNrdZYTAa6GakbCQUMgXJI/iv1CfT4BS5qJ3HR5oqfbfW4vry231z+y6OyGt9
 YEES1sDL70J0HLrDvUCOwMmvwxmIgxxdQxH5lVLkkubPIMrlT8XjqIQrm33LyH1Y
 KXOdrvn3gA51BkUe/XUa+QycJUrpYMZSzl97z1vw7XfpA309wV43P8LIUVHgRJpC
 GBWVcmrYG6lMjEeejhG2+eyCVVOmpa0Iz8feRy25mGuB40wAPverkORQRi6oP1vl
 T8x1xI+c2tQ3+S05IOCncSsKj3Ho83ZrAMW529X5FG006PIlbEQQtOfXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4zlG53Fnbka4soR2yyp017jEEawHxtg3AOAe3pxYXHU=; b=Fv+2Udsa
 JW9TIOpTBCZRV52LgerAQWGqwly9ENe8k2c+HC7/dHN8kMTvm7999VHSY/1MwVLg
 N/Id71f7vzPP0f+9su7Q2s7Ug6Wb7DF5byvd4DR63J3NgkDZ6K+kuhAKJv2HFa53
 piyrs91+SpvE0Gat343lLHA9KN1tQlKSSNHIdrqOKgZa5DYN7xRuR6/WKBGq6Amp
 6FliA8XoQ7sa0HMsQ+8+qFHc88WyrlndNUl5sLIwDsFFvric+yI4fHb1wwjmXn04
 U6DVtITgBN7x+YnqLjo8OsOWYS5mbtSat/n22wwPdiBky1jyBWG+HW5AFcXODl8v
 7qyi0CGdt8Hn4Q==
X-ME-Sender: <xms:bFmpXR8DzL7_mUtM8TI28OhXGpYPNojhNWTDpGIoByiD8KlRIPYkhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehrgidrvghvvghnth
 hsnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpeho
 qdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:bFmpXV0OR7gI0kN2d4jF0zuQjVT7iP-0fZcxDJPrgiUeiRerfNnUkg>
 <xmx:bFmpXc0Juys5nYDMSTZhGjRocc5ZrgTap-HNGfYBFA-XcwjkkkhW2w>
 <xmx:bFmpXZuZYgx2-i2mM8TGAL1P-ErASdwK1LMn6oStCS6qPjEukxFGbQ>
 <xmx:bFmpXQwKh8LpVyi0W6Y6FOax5pza-eXdBjm8iP41VB12wjZy2sRJwA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC1198005B;
 Fri, 18 Oct 2019 02:19:22 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:10 +0900
Message-Id: <20191018061911.24909-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/6] ALSA: firewire-lib: handle several AMDTP
	streams in callback handler of IRQ target
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

This commit changes AMDTP domain to run on an IT context of 1394 OHCI as
IRQ target. No hardware interrupt is scheduled for the other isoc
contexts. All of the isoc context are processed in a callback for an isoc
context of IRQ target.

The IRQ target is automatically selected from a list of AMDTP streams,
thus users of AMDTP domain should add an AMDTP stream for IT context
at least.

The reason to select IT context as IRQ target is that the IT context
runs on local 1394 OHCI controller and it can be used as reliable,
constant IRQ generator. On the other hand, IR context can include skip
cycle according to isoc packet transferred by device.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 179 ++++++++++++++++++++++++++--------
 sound/firewire/amdtp-stream.h |   7 +-
 2 files changed, 140 insertions(+), 46 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 36c3f1f9dbff..48be31eae9a5 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -482,13 +482,13 @@ static inline int queue_out_packet(struct amdtp_stream *s,
 }
 
 static inline int queue_in_packet(struct amdtp_stream *s,
-				  struct fw_iso_packet *params, bool sched_irq)
+				  struct fw_iso_packet *params)
 {
 	// Queue one packet for IR context.
 	params->header_length = s->ctx_data.tx.ctx_header_size;
 	params->payload_length = s->ctx_data.tx.max_ctx_payload_length;
 	params->skip = false;
-	return queue_packet(s, params, sched_irq);
+	return queue_packet(s, params, false);
 }
 
 static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
@@ -790,15 +790,24 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 		update_pcm_pointers(s, pcm, pcm_frames);
 }
 
+static void amdtp_stream_master_callback(struct fw_iso_context *context,
+					 u32 tstamp, size_t header_length,
+					 void *header, void *private_data);
+
+static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
+					u32 tstamp, size_t header_length,
+					void *header, void *private_data);
+
 static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				size_t header_length, void *header,
 				void *private_data)
 {
 	struct amdtp_stream *s = private_data;
 	const __be32 *ctx_header = header;
-	unsigned int events_per_period = s->events_per_period;
-	unsigned int event_count = s->event_count;
+	unsigned int events_per_period = s->ctx_data.rx.events_per_period;
+	unsigned int event_count = s->ctx_data.rx.event_count;
 	unsigned int packets;
+	bool is_irq_target;
 	int i;
 
 	if (s->packet_index < 0)
@@ -811,6 +820,10 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
+	is_irq_target =
+		!!(context->callback.sc == amdtp_stream_master_callback ||
+		   context->callback.sc == amdtp_stream_master_first_callback);
+
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
 		unsigned int syt;
@@ -829,10 +842,12 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				    desc->data_blocks, desc->data_block_counter,
 				    syt, i);
 
-		event_count += desc->data_blocks;
-		if (event_count >= events_per_period) {
-			event_count -= events_per_period;
-			sched_irq = true;
+		if (is_irq_target) {
+			event_count += desc->data_blocks;
+			if (event_count >= events_per_period) {
+				event_count -= events_per_period;
+				sched_irq = true;
+			}
 		}
 
 		if (queue_out_packet(s, &template.params, sched_irq) < 0) {
@@ -841,7 +856,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		}
 	}
 
-	s->event_count = event_count;
+	s->ctx_data.rx.event_count = event_count;
 }
 
 static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
@@ -850,8 +865,6 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
-	unsigned int events_per_period = s->events_per_period;
-	unsigned int event_count = s->event_count;
 	unsigned int packets;
 	int i;
 	int err;
@@ -873,31 +886,47 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 
 	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = s->pkt_descs + i;
 		struct fw_iso_packet params = {0};
-		bool sched_irq = false;
-
-		if (err >= 0) {
-			event_count += desc->data_blocks;
-			if (event_count >= events_per_period) {
-				event_count -= events_per_period;
-				sched_irq = true;
-			}
-		} else {
-			sched_irq =
-				!((s->packet_index + 1) % s->idle_irq_interval);
-		}
 
-		if (queue_in_packet(s, &params, sched_irq) < 0) {
+		if (queue_in_packet(s, &params) < 0) {
 			cancel_stream(s);
 			return;
 		}
 	}
+}
+
+static void amdtp_stream_master_callback(struct fw_iso_context *context,
+					 u32 tstamp, size_t header_length,
+					 void *header, void *private_data)
+{
+	struct amdtp_domain *d = private_data;
+	struct amdtp_stream *irq_target = d->irq_target;
+	struct amdtp_stream *s;
+
+	out_stream_callback(context, tstamp, header_length, header, irq_target);
+	if (amdtp_streaming_error(irq_target))
+		goto error;
 
-	s->event_count = event_count;
+	list_for_each_entry(s, &d->streams, list) {
+		if (s != irq_target && amdtp_stream_running(s)) {
+			fw_iso_context_flush_completions(s->context);
+			if (amdtp_streaming_error(s))
+				goto error;
+		}
+	}
+
+	return;
+error:
+	if (amdtp_stream_running(irq_target))
+		cancel_stream(irq_target);
+
+	list_for_each_entry(s, &d->streams, list) {
+		if (amdtp_stream_running(s))
+			cancel_stream(s);
+	}
 }
 
-/* this is executed one time */
+// this is executed one time.
 static void amdtp_stream_first_callback(struct fw_iso_context *context,
 					u32 tstamp, size_t header_length,
 					void *header, void *private_data)
@@ -928,18 +957,39 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	context->callback.sc(context, tstamp, header_length, header, s);
 }
 
+static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
+					       u32 tstamp, size_t header_length,
+					       void *header, void *private_data)
+{
+	struct amdtp_domain *d = private_data;
+	struct amdtp_stream *s = d->irq_target;
+	const __be32 *ctx_header = header;
+
+	s->callbacked = true;
+	wake_up(&s->callback_wait);
+
+	s->start_cycle = compute_it_cycle(*ctx_header, s->queue_size);
+
+	context->callback.sc = amdtp_stream_master_callback;
+
+	context->callback.sc(context, tstamp, header_length, header, d);
+}
+
 /**
  * amdtp_stream_start - start transferring packets
  * @s: the AMDTP stream to start
  * @channel: the isochronous channel on the bus
  * @speed: firewire speed code
+ * @d: the AMDTP domain to which the AMDTP stream belongs
+ * @is_irq_target: whether isoc context for the AMDTP stream is used to generate
+ *		   hardware IRQ.
  *
  * The stream cannot be started until it has been configured with
  * amdtp_stream_set_parameters() and it must be started before any PCM or MIDI
  * device can be started.
  */
 static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
-			      struct amdtp_domain *d)
+			      struct amdtp_domain *d, bool is_irq_target)
 {
 	static const struct {
 		unsigned int data_block;
@@ -955,10 +1005,13 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	};
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
+	unsigned int idle_irq_interval;
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
 	int type, tag, err;
+	fw_iso_callback_t ctx_cb;
+	void *ctx_data;
 
 	mutex_lock(&s->mutex);
 
@@ -969,6 +1022,12 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	}
 
 	if (s->direction == AMDTP_IN_STREAM) {
+		// NOTE: IT context should be used for constant IRQ.
+		if (is_irq_target) {
+			err = -EINVAL;
+			goto err_unlock;
+		}
+
 		s->data_block_counter = UINT_MAX;
 	} else {
 		entry = &initial_state[s->sfc];
@@ -1008,22 +1067,29 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if (events_per_buffer == 0)
 		events_per_buffer = events_per_period * 3;
 
-	s->idle_irq_interval =
-			DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
-				     amdtp_rate_table[s->sfc]);
+	idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
+					 amdtp_rate_table[s->sfc]);
 	s->queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
 				     amdtp_rate_table[s->sfc]);
-	s->events_per_period = events_per_period;
-	s->event_count = 0;
 
 	err = iso_packets_buffer_init(&s->buffer, s->unit, s->queue_size,
 				      max_ctx_payload_size, dir);
 	if (err < 0)
 		goto err_unlock;
 
+	if (is_irq_target) {
+		s->ctx_data.rx.events_per_period = events_per_period;
+		s->ctx_data.rx.event_count = 0;
+		ctx_cb = amdtp_stream_master_first_callback;
+		ctx_data = d;
+	} else {
+		ctx_cb = amdtp_stream_first_callback;
+		ctx_data = s;
+	}
+
 	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
 					  type, channel, speed, ctx_header_size,
-					  amdtp_stream_first_callback, s);
+					  ctx_cb, ctx_data);
 	if (IS_ERR(s->context)) {
 		err = PTR_ERR(s->context);
 		if (err == -EBUSY)
@@ -1054,14 +1120,20 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	s->packet_index = 0;
 	do {
 		struct fw_iso_packet params;
-		bool sched_irq;
 
-		sched_irq = !((s->packet_index + 1) % s->idle_irq_interval);
 		if (s->direction == AMDTP_IN_STREAM) {
-			err = queue_in_packet(s, &params, sched_irq);
+			err = queue_in_packet(s, &params);
 		} else {
+			bool sched_irq = false;
+
 			params.header_length = 0;
 			params.payload_length = 0;
+
+			if (is_irq_target) {
+				sched_irq = !((s->packet_index + 1) %
+					      idle_irq_interval);
+			}
+
 			err = queue_out_packet(s, &params, sched_irq);
 		}
 		if (err < 0)
@@ -1276,17 +1348,33 @@ int amdtp_domain_start(struct amdtp_domain *d)
 	struct amdtp_stream *s;
 	int err = 0;
 
+	// Select an IT context as IRQ target.
 	list_for_each_entry(s, &d->streams, list) {
-		err = amdtp_stream_start(s, s->channel, s->speed, d);
-		if (err < 0)
+		if (s->direction == AMDTP_OUT_STREAM)
 			break;
 	}
+	if (!s)
+		return -ENXIO;
+	d->irq_target = s;
 
-	if (err < 0) {
-		list_for_each_entry(s, &d->streams, list)
-			amdtp_stream_stop(s);
+	list_for_each_entry(s, &d->streams, list) {
+		if (s != d->irq_target) {
+			err = amdtp_stream_start(s, s->channel, s->speed, d,
+						 false);
+			if (err < 0)
+				goto error;
+		}
 	}
 
+	s = d->irq_target;
+	err = amdtp_stream_start(s, s->channel, s->speed, d, true);
+	if (err < 0)
+		goto error;
+
+	return 0;
+error:
+	list_for_each_entry(s, &d->streams, list)
+		amdtp_stream_stop(s);
 	return err;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_start);
@@ -1299,12 +1387,17 @@ void amdtp_domain_stop(struct amdtp_domain *d)
 {
 	struct amdtp_stream *s, *next;
 
+	if (d->irq_target)
+		amdtp_stream_stop(d->irq_target);
+
 	list_for_each_entry_safe(s, next, &d->streams, list) {
 		list_del(&s->list);
 
-		amdtp_stream_stop(s);
+		if (s != d->irq_target)
+			amdtp_stream_stop(s);
 	}
 
 	d->events_per_period = 0;
+	d->irq_target = NULL;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_stop);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 470e77ca0061..c4bde69c2d4f 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -143,11 +143,12 @@ struct amdtp_stream {
 			// To generate CIP header.
 			unsigned int fdf;
 			int syt_override;
+
+			// To generate constant hardware IRQ.
+			unsigned int event_count;
+			unsigned int events_per_period;
 		} rx;
 	} ctx_data;
-	unsigned int event_count;
-	unsigned int events_per_period;
-	unsigned int idle_irq_interval;
 
 	/* For CIP headers. */
 	unsigned int source_node_id_field;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
