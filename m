Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9C1CA262
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02088178D;
	Fri,  8 May 2020 06:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02088178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588913068;
	bh=Bq4C4iOU+0/WXer4HC9Ph57cOnM7S5KBKYqPqmP2yOs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4AdLsx8Fh6pqV/AtlqH8Vx4Zi79duWM4oLcetkaXn7ZlmmM4Pe5aOHA0iGucCCDr
	 j1W8OSV2VW9CUqj16hXI6CF9xxJQPa/l+Eddm0R69LAwvog9WToBwLj89zryzv65Og
	 b256XET0YLQSq7jtz0VxM/ZKZYZnHfaIVKAv/9wQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC961F80306;
	Fri,  8 May 2020 06:37:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C168F802D2; Fri,  8 May 2020 06:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07D60F800AD
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07D60F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HSjEywK8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mB3LPUcg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 6F649A8C;
 Fri,  8 May 2020 00:36:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Dd2kRud7bbraz
 i33wID4B40zZ3pxJzPHi24BRjGNurI=; b=HSjEywK8yOc8l/fdL8byrNfmstQmh
 UVmJS/X9JCtVlByly4LoOCMZNkVeG+d2cf5z54C3EMpvyydr4XIJtoKvcn52IgeT
 bep4b1XlKUjRLaCz0zm6tPmHy1LX26waePWUrGARUIVrrgkSki/8nhucD+bkvOXx
 ooMeiOXLumFvgBI2HnokbF9XIDok+DO5wJ0HrVHK0xvLQVlBcMZLRZsLu1fbyKwY
 g/6eSqZQMYYjGCKiBD4uhuJNA/j8FMymxG1jhKKQJiPrHcmdn2X6OPB4NdWvE3QS
 cUMcqpIXnXGs8WwI5lLIoAUj9VCCcqdd+307aP2Pyu0fhFWLx8o64GGUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Dd2kRud7bbrazi33wID4B40zZ3pxJzPHi24BRjGNurI=; b=mB3LPUcg
 g7jrfXXM2ejaXKhy01i3+rYhJfYYCH2xhdSh6w4E79lB6NqU9EFqnz4Mz27EW1nS
 2K3PYUtLGMQ9w6T21NywNZJ4uvBa2kZuAUJIgryamcD2mi72VNCuJ/vBHkssxit2
 /hWdpYbYIgGLo4xl0Zq2zT8exZTuqReKrHWA7c6xytLMyJkKV5AvtfE7m85bqlu5
 3zmja93xt//0We+lAtr7n9Kfq78adQvHnQyn42QIO9ONofAf4bFakxPWyRTJuLvm
 M5daaTBV0JvFa3p7UxuigSPrgVxcjU6ducK7MR/hmj13wH6Z9eafNJhcHpRIxDw9
 JiuzaFxEV91ArA==
X-ME-Sender: <xms:4OG0Xi-BtjDLyv_8UN_qhXJKGhbu0E-vC2ryEosjxJwb-vVQA9ZKbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeiveffvdehue
 dtlefffeegiedutedtvdejfeduteevueelheeuvdetveejtedtgeenucffohhmrghinhep
 rhigrdgvvhgvnhhtshenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrh
 fuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4OG0XpqKZbPSl_Yx9MlqFx9PJ8RAGPVl27uowfCB4HbEDIK7SZzw3A>
 <xmx:4OG0XtJ7gbBXev3naKa5lAKymWdPiO7ACiEAplc92JpDgTedd2y02w>
 <xmx:4OG0Xu3yEHOvND87Qh3M5Y3M1HQqj71my-8t9IGcCAbjy_LYNxCKsw>
 <xmx:4eG0XsxDwK_2v9LoTXAKyuaGCT9-GgAShpnb00u0F89kPgLI9Bu7pQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE6763280068;
 Fri,  8 May 2020 00:36:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 09/10] ALSA: firewire-lib: pool ideal sequence of syt offset
 and data block
Date: Fri,  8 May 2020 13:36:34 +0900
Message-Id: <20200508043635.349339-10-o-takashi@sakamocchi.jp>
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

In current implementation, sequence of syt offset and the number of data
blocks is generated when packets for outgoing stream are going to be
queued.

This commit generates and pools the sequence independently of the
processing of outgoing packets for future extension.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 68 +++++++++++++++++++++++++++++++++++
 sound/firewire/amdtp-stream.h |  6 ++++
 2 files changed, 74 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f1c8611cfc70..a2af598e9b9a 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -905,14 +905,63 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 }
 
+static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
+{
+	struct amdtp_stream *irq_target = d->irq_target;
+	unsigned int seq_tail = d->seq_tail;
+	unsigned int seq_size = d->seq_size;
+	unsigned int min_avail;
+	struct amdtp_stream *s;
+
+	min_avail = d->seq_size;
+	list_for_each_entry(s, &d->streams, list) {
+		unsigned int seq_index;
+		unsigned int avail;
+
+		if (s->direction == AMDTP_IN_STREAM)
+			continue;
+
+		seq_index = s->ctx_data.rx.seq_index;
+		avail = d->seq_tail;
+		if (seq_index > avail)
+			avail += d->seq_size;
+		avail -= seq_index;
+
+		if (avail < min_avail)
+			min_avail = avail;
+	}
+
+	while (min_avail < packets) {
+		struct seq_desc *desc = d->seq_descs + seq_tail;
+
+		desc->syt_offset = calculate_syt_offset(&d->last_syt_offset,
+					&d->syt_offset_state, irq_target->sfc);
+		desc->data_blocks = calculate_data_blocks(&d->data_block_state,
+				!!(irq_target->flags & CIP_BLOCKING),
+				desc->syt_offset == CIP_SYT_NO_INFO,
+				irq_target->syt_interval, irq_target->sfc);
+
+		++seq_tail;
+		seq_tail %= seq_size;
+
+		++min_avail;
+	}
+
+	d->seq_tail = seq_tail;
+}
+
 static void irq_target_callback(struct fw_iso_context *context, u32 tstamp,
 				size_t header_length, void *header,
 				void *private_data)
 {
 	struct amdtp_stream *irq_target = private_data;
 	struct amdtp_domain *d = irq_target->domain;
+	unsigned int packets = header_length / sizeof(__be32);
 	struct amdtp_stream *s;
 
+	// Record enough entries with extra 3 cycles at least.
+	pool_ideal_seq_descs(d, packets + 3);
+
 	out_stream_callback(context, tstamp, header_length, header, irq_target);
 	if (amdtp_streaming_error(irq_target))
 		goto error;
@@ -1344,6 +1393,18 @@ static int get_current_cycle_time(struct fw_card *fw_card, int *cur_cycle)
  */
 int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 {
+	static const struct {
+		unsigned int data_block;
+		unsigned int syt_offset;
+	} *entry, initial_state[] = {
+		[CIP_SFC_32000]  = {  4, 3072 },
+		[CIP_SFC_48000]  = {  6, 1024 },
+		[CIP_SFC_96000]  = { 12, 1024 },
+		[CIP_SFC_192000] = { 24, 1024 },
+		[CIP_SFC_44100]  = {  0,   67 },
+		[CIP_SFC_88200]  = {  0,   67 },
+		[CIP_SFC_176400] = {  0,   67 },
+	};
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
 	unsigned int idle_irq_interval;
@@ -1378,6 +1439,11 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	d->seq_size = queue_size;
 	d->seq_tail = 0;
 
+	entry = &initial_state[s->sfc];
+	d->data_block_state = entry->data_block;
+	d->syt_offset_state = entry->syt_offset;
+	d->last_syt_offset = TICKS_PER_CYCLE;
+
 	if (ir_delay_cycle > 0) {
 		struct fw_card *fw_card = fw_parent_device(s->unit)->card;
 
@@ -1414,6 +1480,7 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 		} else {
 			// IT context starts immediately.
 			cycle_match = -1;
+			s->ctx_data.rx.seq_index = 0;
 		}
 
 		if (s != d->irq_target) {
@@ -1427,6 +1494,7 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	s = d->irq_target;
 	s->ctx_data.rx.events_per_period = events_per_period;
 	s->ctx_data.rx.event_count = 0;
+	s->ctx_data.rx.seq_index = 0;
 
 	idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
 					 amdtp_rate_table[d->irq_target->sfc]);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 84a01efa5a85..11cff4cafd90 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -138,6 +138,8 @@ struct amdtp_stream {
 		struct {
 			// To calculate CIP data blocks and tstamp.
 			unsigned int transfer_delay;
+			unsigned int seq_index;
+
 			unsigned int data_block_state;
 			unsigned int last_syt_offset;
 			unsigned int syt_offset_state;
@@ -292,6 +294,10 @@ struct amdtp_domain {
 	struct seq_desc *seq_descs;
 	unsigned int seq_size;
 	unsigned int seq_tail;
+
+	unsigned int data_block_state;
+	unsigned int syt_offset_state;
+	unsigned int last_syt_offset;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
-- 
2.25.1

