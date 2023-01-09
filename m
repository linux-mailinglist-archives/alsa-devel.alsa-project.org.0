Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF56632F7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 22:33:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F8FC8AE;
	Mon,  9 Jan 2023 22:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F8FC8AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673300027;
	bh=i1sriP5bv+aVMfDT8XA98r032B8Mn+4bQ8MhfD3yFmg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tEkckCRlpFOBamuDZE47JjfWNsr+3e/KMbaJf6xrBgf7WKmATAjPSv8BbZDIcba28
	 w7wmDK8TgT3H1EPEE8J2jvHV27X80PUZrdxtOhlKuxQOBWlSlYmKpkOOKljLkylebf
	 o9qqn09HZ5eHuvmMY4L2mG8YnhTuZEoapeGsUm9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47805F803DC;
	Mon,  9 Jan 2023 22:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 294DAF8030F; Mon,  9 Jan 2023 22:32:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF1C6F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 22:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1C6F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=R2BkCzk7; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aTCWPRdo
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B5AF5C01A7;
 Mon,  9 Jan 2023 16:32:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 09 Jan 2023 16:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673299957; x=1673386357; bh=BGm7ovjamC
 R3hfJoHVl9R5EgA/7UGDRR7wFYjBiOAiE=; b=R2BkCzk7Huok7VaaigSnzlYzG/
 Nxf4cwKEvjlxXiam5dCjbvzm81o2Uv7IQCh0mWQVj+TBb3jLmllfdXDH5IXGQQwT
 aYnrEnkSK+QEtmA6an8wRJSSOfbLVJrGQQ0iJosB1a/O6ZNRAx/uaJ1O8K/NM8rB
 yTBriwL5csp+lZXMp9Y3ycw4LuZaE0OcSu4eBqwH7DK1sqpIBsHAz1aLm9tD3vNo
 NMM78CVlTWvS6g8E4doWGdEndz9tNuj6nxY1IG40255bO7pK3+K3W+lWEomSfFZA
 TAlr5ceW54ANJb6dlAY32V+eQH7NtWL4YxjlWBw1JBaLyOou+Vt3jmdcMcpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673299957; x=1673386357; bh=BGm7ovjamCR3hfJoHVl9R5EgA/7UGDRR7wF
 YjBiOAiE=; b=aTCWPRdo9ez1bVZ2qyv5IcNkA5aEgbKUeQSy6qMhp0XOZK01E6h
 FGPBZkFIHVELrRWj74wsR8pmpVH4YvXVGK7YRCY65Jp08v9sOYtKMP0zMtoQxXi4
 gGBBZVdVKBVQ9W3AXEq3630YKDPQdexoo5/bfxEkLyv8NXFtAFGoZwh7B6xSazHW
 wdwLVGk2OawLBHdqxR44k7CUBgTiEnvPvteyVdQAjQHbu1dn79eRnlHIwUFpks61
 lXWQ3EKzjAm+dDAIcP/YfDf0kXFH2ZdOKD3oDSG92mthbqB8q/tuS8sJnygflecl
 x0XzzMix+gxzN5DpFW4eD4kT6zAjMH6CVbA==
X-ME-Sender: <xms:9Ie8Y518Ij5VBubgisnRr6VwIvjK_GCnwDDiTbcb_eoXP67X__0plA>
 <xme:9Ie8YwE5Vr-EwiwgkCGYSQ0QgGwtRJEUlg2QEFZTtR2UVxQtXCBTXvAiomuP-6XdE
 yNnTZNKqbClHM3kH3s>
X-ME-Received: <xmr:9Ie8Y56DOVESFIztRDuZP5Tbflu7VJlXmYKAiaKvsuezGmT6uZPyH2PxFdoxmspAiFSktaz4WxFk6lxib6aXeTCwo87VFxWD2YUc3nemvGr15FvWSY2e8GU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
 ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:9Ie8Y21qSODJTYo9Njj95LAoSZ9BPisl_IbQAokyJycjD5pi1LL0Dg>
 <xmx:9Ie8Y8ECM2008DhFjUtlwQt-beH3-xdvlaBJLoHfcgxtK21DC1eZEQ>
 <xmx:9Ie8Y38uBLxHY1RiNnbfQn_H_kPjWH2DguuFEyEgcqZUo5kI4jE2wA>
 <xmx:9Ye8Y2N2hxOK8y-pN2grKUoq7jmsQ8-DFBMUzI8iG0F4CzVhLpwmZg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jan 2023 16:32:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: extend tracepoints event including
 CYCLE_TIME of 1394 OHCI
Date: Tue, 10 Jan 2023 06:32:31 +0900
Message-Id: <20230109213231.138223-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
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

A commit baa914cd81f5 ("firewire: add kernel API to access CYCLE_TIME
register") allow unit drivers to read CYCLE_TIME of 1394 OHCI controller.
The value expresses monotonic time with 42.195 Mhz resolution and wrapping
around every 128 seconds. The controller uses the time to govern
isochronous cycle.

This commit extends tracepoints event including the value so that event
parser can compute gap between current isochronous cycle and the latest
isochronous cycle in which packet is processed (in IR context) or scheduled
(in IT context). It loses backward compatibility to former format of the
tracepoints event.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h |  9 ++++++---
 sound/firewire/amdtp-stream.c       | 21 +++++++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 5fd2aeccdfc2..208f97cf8de6 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -14,9 +14,10 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(amdtp_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int data_block_counter, unsigned int packet_index, unsigned int index),
-	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, data_block_counter, packet_index, index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int data_block_counter, unsigned int packet_index, unsigned int index, u32 curr_cycle_time),
+	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, data_block_counter, packet_index, index, curr_cycle_time),
 	TP_STRUCT__entry(
+		__field(unsigned int, cycle_time)
 		__field(unsigned int, second)
 		__field(unsigned int, cycle)
 		__field(int, channel)
@@ -31,6 +32,7 @@ TRACE_EVENT(amdtp_packet,
 		__field(unsigned int, index)
 	),
 	TP_fast_assign(
+		__entry->cycle_time = curr_cycle_time;
 		__entry->second = cycles / CYCLES_PER_SECOND;
 		__entry->cycle = cycles % CYCLES_PER_SECOND;
 		__entry->channel = s->context->channel;
@@ -53,7 +55,8 @@ TRACE_EVENT(amdtp_packet,
 		__entry->index = index;
 	),
 	TP_printk(
-		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u %s",
+		"%08x %02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u %s",
+		__entry->cycle_time,
 		__entry->second,
 		__entry->cycle,
 		__entry->src,
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 430b33dc60b3..65720ae866cb 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -674,7 +674,7 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 				struct fw_iso_packet *params, unsigned int header_length,
 				unsigned int data_blocks,
 				unsigned int data_block_counter,
-				unsigned int syt, unsigned int index)
+				unsigned int syt, unsigned int index, u32 curr_cycle_time)
 {
 	unsigned int payload_length;
 	__be32 *cip_header;
@@ -691,7 +691,7 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length + header_length, data_blocks,
-			   data_block_counter, s->packet_index, index);
+			   data_block_counter, s->packet_index, index, curr_cycle_time);
 }
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
@@ -793,7 +793,8 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       const __be32 *ctx_header,
 			       unsigned int *data_blocks,
 			       unsigned int *data_block_counter,
-			       unsigned int *syt, unsigned int packet_index, unsigned int index)
+			       unsigned int *syt, unsigned int packet_index, unsigned int index,
+			       u32 curr_cycle_time)
 {
 	unsigned int payload_length;
 	const __be32 *cip_header;
@@ -838,7 +839,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, *data_blocks,
-			   *data_block_counter, packet_index, index);
+			   *data_block_counter, packet_index, index, curr_cycle_time);
 
 	return 0;
 }
@@ -889,9 +890,13 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 	unsigned int dbc = s->data_block_counter;
 	unsigned int packet_index = s->packet_index;
 	unsigned int queue_size = s->queue_size;
+	u32 curr_cycle_time;
 	int i;
 	int err;
 
+	if (trace_amdtp_packet_enabled())
+		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
+
 	*desc_count = 0;
 	for (i = 0; i < packet_count; ++i) {
 		unsigned int cycle;
@@ -936,7 +941,7 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 		}
 
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &data_blocks, &dbc, &syt,
-					  packet_index, i);
+					  packet_index, i, curr_cycle_time);
 		if (err < 0)
 			return err;
 
@@ -1050,6 +1055,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	struct pkt_desc *desc = s->packet_descs_cursor;
 	unsigned int pkt_header_length;
 	unsigned int packets;
+	u32 curr_cycle_time;
 	bool need_hw_irq;
 	int i;
 
@@ -1078,6 +1084,9 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 		need_hw_irq = false;
 	}
 
+	if (trace_amdtp_packet_enabled())
+		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
+
 	for (i = 0; i < packets; ++i) {
 		struct {
 			struct fw_iso_packet params;
@@ -1087,7 +1096,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 
 		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
 				    desc->data_blocks, desc->data_block_counter,
-				    desc->syt, i);
+				    desc->syt, i, curr_cycle_time);
 
 		if (s == s->domain->irq_target) {
 			event_count += desc->data_blocks;
-- 
2.37.2

