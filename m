Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D599387978
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE5416BB;
	Tue, 18 May 2021 15:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE5416BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343020;
	bh=EDofhnRvkprAQnFCxk7g6LWPPccnhOt5DFpM3SB42SI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9SQjTm75xjh9tXLMLsRHlqR6U95RuSZA1w1lueT67GBaGx/BarXxc85wHmrGNXdz
	 EsGdFbhFbpRV19f3RjdiavDLAHlo2+lvE45Y6ggYznsUlkqV9T4r0aU4HRU/jWz5u+
	 Bu9sjvElnWKWLir2VLhpASQfKh84aomJvX9Q7MT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1499CF8042F;
	Tue, 18 May 2021 15:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ACD5F802C8; Tue, 18 May 2021 15:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56E89F80257
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56E89F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vrp52MZK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XjcsG23J"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B43D65C0218;
 Tue, 18 May 2021 09:00:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 18 May 2021 09:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=olMw+orqa0zaF
 +zrvN99aV5ejV31uDyid0u4Srw4hts=; b=vrp52MZKQHA0ukDflv5eDgLXza1K9
 bFGIu2CLzKt39+r/78wFU3WGG+tsdA9/TriI+Vw2Og35Pe2pgTdVnvaZcr8Ck+4M
 zh6rzIUDuL4ssh9Btebl/9raYELjq54lR/Zh4TOfVjwAmFShzIhKcbA2wy7fBcYR
 D68bjXy/P7KbvIUQa0d43JqJzACXDsZ3Zaw0pRsJy+4DCkhAWuZOBuLchorljaPK
 b0poNqrPdf0uQ8VJJkjpnwaa6fQP+DoKX2hNYO9frOH8H56L34mtGlFQVBhD+n4u
 XnXzAy9Ugv4hsSOFgLI7RmCMStZ/LPvSpG+lz+ejJGdyxzPVGi02s5gbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=olMw+orqa0zaF+zrvN99aV5ejV31uDyid0u4Srw4hts=; b=XjcsG23J
 AIOMCrjCXYLwrFZJ0JimmpQOcVuMh1uw6awpp+7RVIQCAFebXMefKQDiLgHnptOK
 gxvwzqKnblrQZk5uDDyCjkni1eT/u/IcyO1y/89s8/yE9qegQ5DVPu3bF5SAsZdi
 BCYTkjK6J+pAt7Qv9TKE7Z4NOnv0EHQR71jsnK7+DoSwcj7q8j3rWLj2+xLNeIq2
 sUOfb736Pr8fStfwoct9M1TN/8xpbe2+DX93crVFkH2liaHuTS918PGfROQ/ft1c
 SdUBJV4iJvkEni/7P3og8xEmlGP9Y2VrcPBZA3NIMdTZjc8CafGgt1nBUaOEQ7wX
 UxGgyRhV3H3I9g==
X-ME-Sender: <xms:i7qjYJA3iWju3suaCr-IacxB0iKGuOKn8IXmPUQzEW2jhOSlVIcWdA>
 <xme:i7qjYHgkDittxjS2DZfOTy3xia7-kZXE_1fgAgtc_g1snwKqQ6B793-2-WyUIO8aE
 UrXndzrbJP7xs1sJzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:i7qjYEmvya8S2kKHRRydYD4ul6vOQiCQCiW4K97EncpvaZzPgkSppQ>
 <xmx:i7qjYDykijZkAfcTxsVQ5HSswFEHrgn5yc9h8TaxRGmHieVOSDt0yg>
 <xmx:i7qjYOSZKXRHvYNdPb9NviL5bd2NE3rP6at4AOGBiPQDVkGGVYuL5g>
 <xmx:i7qjYH4MuMECqIev6ma_wy-6F7SNvm3Qzo0cg3Oervi-BjyJJSmwGw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/8] ALSA: firewire-lib: code refactoring for helper function
 to compute OHCI 1394 cycle
Date: Tue, 18 May 2021 22:00:43 +0900
Message-Id: <20210518130048.146596-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
References: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
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

Some macros and functions are renamed so that they compute isochronous
cycle within maximum count of second in isochronous context of 1394
OHCI.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 739e73207fda..ed8aea3cb1a1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -20,7 +20,7 @@
 #define CYCLES_PER_SECOND	8000
 #define TICKS_PER_SECOND	(TICKS_PER_CYCLE * CYCLES_PER_SECOND)
 
-#define OHCI_MAX_SECOND		8
+#define OHCI_SECOND_MODULUS		8
 
 /* Always support Linux tracing subsystem. */
 #define CREATE_TRACE_POINTS
@@ -688,17 +688,17 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
 // the other hand, in DMA descriptors of 1394 OHCI, 3 bits are used to represent
 // it. Thus, via Linux firewire subsystem, we can get the 3 bits for second.
-static inline u32 compute_cycle_count(__be32 ctx_header_tstamp)
+static inline u32 compute_ohci_cycle_count(__be32 ctx_header_tstamp)
 {
 	u32 tstamp = be32_to_cpu(ctx_header_tstamp) & HEADER_TSTAMP_MASK;
 	return (((tstamp >> 13) & 0x07) * 8000) + (tstamp & 0x1fff);
 }
 
-static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
+static inline u32 increment_ohci_cycle_count(u32 cycle, unsigned int addend)
 {
 	cycle += addend;
-	if (cycle >= OHCI_MAX_SECOND * CYCLES_PER_SECOND)
-		cycle -= OHCI_MAX_SECOND * CYCLES_PER_SECOND;
+	if (cycle >= OHCI_SECOND_MODULUS * CYCLES_PER_SECOND)
+		cycle -= OHCI_SECOND_MODULUS * CYCLES_PER_SECOND;
 	return cycle;
 }
 
@@ -706,11 +706,11 @@ static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
 // This module queued the same number of isochronous cycle as the size of queue
 // to kip isochronous cycle, therefore it's OK to just increment the cycle by
 // the size of queue for scheduled cycle.
-static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp,
-				   unsigned int queue_size)
+static inline u32 compute_ohci_it_cycle(const __be32 ctx_header_tstamp,
+					unsigned int queue_size)
 {
-	u32 cycle = compute_cycle_count(ctx_header_tstamp);
-	return increment_cycle_count(cycle, queue_size);
+	u32 cycle = compute_ohci_cycle_count(ctx_header_tstamp);
+	return increment_ohci_cycle_count(cycle, queue_size);
 }
 
 static int generate_device_pkt_descs(struct amdtp_stream *s,
@@ -731,7 +731,7 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 		unsigned int data_blocks;
 		unsigned int syt;
 
-		cycle = compute_cycle_count(ctx_header[1]);
+		cycle = compute_ohci_cycle_count(ctx_header[1]);
 
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
 					  &data_blocks, &dbc, &syt, packet_index, i);
@@ -784,7 +784,7 @@ static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
 		const struct seq_desc *seq = seq_descs + seq_index;
 		unsigned int syt;
 
-		desc->cycle = compute_it_cycle(*ctx_header, s->queue_size);
+		desc->cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
 		syt = seq->syt_offset;
 		if (syt != CIP_SYT_NO_INFO) {
@@ -1025,11 +1025,11 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	wake_up(&s->callback_wait);
 
 	if (s->direction == AMDTP_IN_STREAM) {
-		cycle = compute_cycle_count(ctx_header[1]);
+		cycle = compute_ohci_cycle_count(ctx_header[1]);
 
 		context->callback.sc = in_stream_callback;
 	} else {
-		cycle = compute_it_cycle(*ctx_header, s->queue_size);
+		cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
 		if (s == s->domain->irq_target)
 			context->callback.sc = irq_target_callback;
-- 
2.27.0

