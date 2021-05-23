Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B018338DB33
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 14:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31017169A;
	Sun, 23 May 2021 14:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31017169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621773794;
	bh=QTxUunn93IC68qrCwr47tD82DPkvirmnABFkDY+IAL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etVj2nWJR/fEKRP6ICzyzTulDwydz6IjRDvvswmw1LcmDmoEyfBX8cbey7JeKgVHC
	 cKztNApFa+SC1sCHSjF/iZ6XzeFSkuU8oVmHCViZrhH84oFVJCbAzRfRI0+bBdtwy7
	 1L6hwKCHoTN4sBeiGzxB8RC2umxDk140IJyS8PjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D62E7F802DB;
	Sun, 23 May 2021 14:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F393F802DB; Sun, 23 May 2021 14:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8042AF8019D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 14:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8042AF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Btgxvrgi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LC0ZeTgC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B35F116D;
 Sun, 23 May 2021 08:41:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 23 May 2021 08:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fdR/xD18mRvnp
 eC1wTCjElpBIeesFQwkEpADdKEXf3Q=; b=BtgxvrgiLhPAOHrR9xQhKw4LMNuXB
 eNtaqDUX8jjKlx9REW6YP+NUoTdzRxO8J1IUyZVHa/+3gya815Nbfk+YDXxjYhgt
 8iiGbUCaV1whMZHquugY1yXNuxVjJ4VUefo+TRAw86PEBHYa1IK/i6KfqYe5Nx9D
 B0JAo9RHAswd7ZbgzFJgG3ozhVZ8p2Hu+iE4aNUvXPOcLNr7HQndT9PHVWu5PEfa
 5BdQXdiwJW03oLJlTHekFYV5Jgl7ECHOX3PU3BoO1ZwY69Rwdyv8nMxR1XMFnW7o
 yDuNDj1ZD8kL6hMjqwYevNd+AhkeO+ZTtSrx907WhEDmUvSQsZP/c2NTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fdR/xD18mRvnpeC1wTCjElpBIeesFQwkEpADdKEXf3Q=; b=LC0ZeTgC
 0V7evdJ1h3apqE+osclL55q+ysEa0Lq8rfaLFcj4PrbKyHIX1XvebINmj459vGZE
 dg3MXBMnJV5HcjraL5cT96KJCfsRahllWjlYaGkyB4OCcRPk7i60ZF+mHV2rGyEk
 FZEGGmRKvXZEBPgLxx0yABor0aw7/ozq1ZWGHnJ5vD8VU3bOrnDBzzm7BUyG610h
 /OeMj+OW9fUKrsHHXX/BXZA9rI709tf1+gHUGT/D4rvkYXpinf3h84wtKiBJgS2h
 uc5tzw8GPGLgibx2R+1ZcOkeONI780BcM0fgYJ2ktYSTcdofhw3a0+lJA5lN9gyC
 e6AO0BJRv4ya9A==
X-ME-Sender: <xms:cE2qYJr9dsRJ7eW9dtEk-aXyDFPkjtuRhdvzZ2oy7PLwbvajefFTZw>
 <xme:cE2qYLpycCw5r9dN8U66jJJsLHvTCNT_8zff0HFtWPOBUL8S6OTOSMsJfIJ-DmZAh
 Fdc3ApKN9dCVyEFmAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:cE2qYGNNzPnqbeGp2ZKzvzSQmSBFq2dW4KRTz5ffZfjLXUNG5dZscQ>
 <xmx:cE2qYE5Rq18iFYi7c3moY0v7qPobFPm46A7GePqQ3p3M2RFixgnDEA>
 <xmx:cE2qYI52KXvPveZ78EwQl9XZWFv_Fzw5em4gR-nqyzJsHfY4kA0hWA>
 <xmx:cU2qYNiTAuy8r0XISfZLuQbDmcnX757J2KiEhQE0oQhWfpeQK4QOTA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 08:41:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-lib: drop initial NODATA packets or empty
 packets
Date: Sun, 23 May 2021 21:41:12 +0900
Message-Id: <20210523124114.272134-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523124114.272134-1-o-takashi@sakamocchi.jp>
References: <20210523124114.272134-1-o-takashi@sakamocchi.jp>
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

The devices based on BeBoB ASICs or the devices in Tascam FireWire
series transfer a batch of NODATA packet or empty packet in initial step
of streaming. To avoid processing them, current implementation uses an
option to skip processing content of tx packet during some initial
cycles. However, the hard-coded number is not enough useful.

This commit drops content of packets till the packet includes any event.
The function of option is to skip processing content of tx packet with
any event after dropping.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 130 +++++++++++++++++++++++++---------
 sound/firewire/amdtp-stream.h |   3 +
 2 files changed, 100 insertions(+), 33 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 6dceb8cd6e0c..3576cda3f000 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -49,8 +49,10 @@
 #define CIP_FMT_MASK		0x3f000000
 #define CIP_FDF_MASK		0x00ff0000
 #define CIP_FDF_SHIFT		16
+#define CIP_FDF_NO_DATA		0xff
 #define CIP_SYT_MASK		0x0000ffff
 #define CIP_SYT_NO_INFO		0xffff
+#define CIP_NO_DATA		((CIP_FDF_NO_DATA << CIP_FDF_SHIFT) | CIP_SYT_NO_INFO)
 
 #define CIP_HEADER_SIZE		(sizeof(__be32) * CIP_HEADER_QUADLETS)
 
@@ -1198,6 +1200,99 @@ static void process_tx_packets_intermediately(struct fw_iso_context *context, u3
 	}
 }
 
+static void drop_tx_packets_initially(struct fw_iso_context *context, u32 tstamp,
+				      size_t header_length, void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	__be32 *ctx_header;
+	unsigned int count;
+	unsigned int events;
+	int i;
+
+	if (s->packet_index < 0)
+		return;
+
+	count = header_length / s->ctx_data.tx.ctx_header_size;
+
+	// Attempt to detect any event in the batch of packets.
+	events = 0;
+	ctx_header = header;
+	for (i = 0; i < count; ++i) {
+		unsigned int payload_quads =
+			(be32_to_cpu(*ctx_header) >> ISO_DATA_LENGTH_SHIFT) / sizeof(__be32);
+		unsigned int data_blocks;
+
+		if (s->flags & CIP_NO_HEADER) {
+			data_blocks = payload_quads / s->data_block_quadlets;
+		} else {
+			__be32 *cip_headers = ctx_header + IR_CTX_HEADER_DEFAULT_QUADLETS;
+
+			if (payload_quads < CIP_HEADER_QUADLETS) {
+				data_blocks = 0;
+			} else {
+				payload_quads -= CIP_HEADER_QUADLETS;
+
+				if (s->flags & CIP_UNAWARE_SYT) {
+					data_blocks = payload_quads / s->data_block_quadlets;
+				} else {
+					u32 cip1 = be32_to_cpu(cip_headers[1]);
+
+					// NODATA packet can includes any data blocks but they are
+					// not available as event.
+					if ((cip1 & CIP_NO_DATA) == CIP_NO_DATA)
+						data_blocks = 0;
+					else
+						data_blocks = payload_quads / s->data_block_quadlets;
+				}
+			}
+		}
+
+		events += data_blocks;
+
+		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(__be32);
+	}
+
+	drop_tx_packets(context, tstamp, header_length, header, s);
+
+	if (events > 0)
+		s->ctx_data.tx.event_starts = true;
+
+	// Decide the cycle count to begin processing content of packet in IR contexts.
+	{
+		unsigned int stream_count = 0;
+		unsigned int event_starts_count = 0;
+		unsigned int cycle = UINT_MAX;
+
+		list_for_each_entry(s, &d->streams, list) {
+			if (s->direction == AMDTP_IN_STREAM) {
+				++stream_count;
+				if (s->ctx_data.tx.event_starts)
+					++event_starts_count;
+			}
+		}
+
+		if (stream_count == event_starts_count) {
+			unsigned int next_cycle;
+
+			list_for_each_entry(s, &d->streams, list) {
+				if (s->direction != AMDTP_IN_STREAM)
+					continue;
+
+				next_cycle = increment_ohci_cycle_count(s->next_cycle,
+								d->processing_cycle.tx_init_skip);
+				if (cycle == UINT_MAX ||
+				    compare_ohci_cycle_count(next_cycle, cycle) > 0)
+					cycle = next_cycle;
+
+				s->context->callback.sc = process_tx_packets_intermediately;
+			}
+
+			d->processing_cycle.tx_start = cycle;
+		}
+	}
+}
+
 static void process_ctxs_in_domain(struct amdtp_domain *d)
 {
 	struct amdtp_stream *s;
@@ -1287,7 +1382,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	if (s->direction == AMDTP_IN_STREAM) {
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
 
-		context->callback.sc = drop_tx_packets;
+		context->callback.sc = drop_tx_packets_initially;
 	} else {
 		cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
@@ -1298,38 +1393,6 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	}
 
 	context->callback.sc(context, tstamp, header_length, header, s);
-
-	// Decide the cycle count to begin processing content of packet in IR contexts.
-	if (s->direction == AMDTP_IN_STREAM) {
-		unsigned int stream_count = 0;
-		unsigned int callbacked_count = 0;
-
-		list_for_each_entry(s, &d->streams, list) {
-			if (s->direction == AMDTP_IN_STREAM) {
-				++stream_count;
-				if (s->callbacked)
-					++callbacked_count;
-			}
-		}
-
-		if (stream_count == callbacked_count) {
-			unsigned int next_cycle;
-
-			list_for_each_entry(s, &d->streams, list) {
-				if (s->direction != AMDTP_IN_STREAM)
-					continue;
-
-				next_cycle = increment_ohci_cycle_count(s->next_cycle,
-								d->processing_cycle.tx_init_skip);
-				if (compare_ohci_cycle_count(next_cycle, cycle) > 0)
-					cycle = next_cycle;
-
-				s->context->callback.sc = process_tx_packets_intermediately;
-			}
-
-			d->processing_cycle.tx_start = cycle;
-		}
-	}
 }
 
 /**
@@ -1409,6 +1472,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if (s->direction == AMDTP_IN_STREAM) {
 		s->ctx_data.tx.max_ctx_payload_length = max_ctx_payload_size;
 		s->ctx_data.tx.ctx_header_size = ctx_header_size;
+		s->ctx_data.tx.event_starts = false;
 	} else {
 		static const struct {
 			unsigned int data_block;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 467d5021624b..d3ba2e1c1522 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -138,6 +138,9 @@ struct amdtp_stream {
 			// Fixed interval of dbc between previos/current
 			// packets.
 			unsigned int dbc_interval;
+
+			// The device starts multiplexing events to the packet.
+			bool event_starts;
 		} tx;
 		struct {
 			// To generate CIP header.
-- 
2.27.0

