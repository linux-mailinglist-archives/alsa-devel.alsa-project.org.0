Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF64253E1
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 17:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65D0E169E;
	Tue, 21 May 2019 17:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65D0E169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558452455;
	bh=cn5rc18erlPl8Xf/OvrIAlRsa0glQC+Nz3jLB/mw3LA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z8cA2632eqZNIu1uJgAzy9t05DyKf2Qhs+Y3KCdNBQS8jgk0Ozw9CQMKOFJ4ysm0V
	 L9QkX9a4vZKNdGVRscw4Xo5Cw24XMhioen3t4nkRPuiw0Khi7xEy0hulxfC9BX/trr
	 /pppqDdq4DEmi+X0HjccOSkbG+ltzSt/a2YfX5tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0494F8972E;
	Tue, 21 May 2019 17:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A554F89715; Tue, 21 May 2019 17:12:05 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2BADF89717
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2BADF89717
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OKeCGRg/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wTcck5K/"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BC98D21E44;
 Tue, 21 May 2019 10:57:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 21 May 2019 10:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2gDbxlc/pGHuY
 6H2m17qxtzbbXPbwXaNfPA5FRYL5vA=; b=OKeCGRg/RUJh1Uw8vKLNuVeu+B83g
 Yk+uSePWrkQTpyrxvUB84XDBqwpk9q04rjbSISEGdxvNeYRjU2qaEYndtWKX08Nz
 o9e+mYCAEoHjuTi2cLIftP7Plz4svR8ja/f7wQJG474OGPOGJrzUZpeXyWpHXgQn
 OSfQ76gEV11oIYwb2rnYwc2GGcOQ5a7XX5wCtHRG6zJc9d03Am/24Nou7qDLNekc
 JQdLvIM71zQTAieUz7DcUl29rpbHAjL9QHThYlnFMSxt5zbe+iBBH5dyK4gv2wOw
 mLisP/f/89hGMjdbJY/co6MuElb0I08k1Kb9k3EqN1a9RNd7u1ls1Misw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2gDbxlc/pGHuY6H2m17qxtzbbXPbwXaNfPA5FRYL5vA=; b=wTcck5K/
 MsPsHKSen+ImlbilaMdXl5Nzsf1yQsQZAxG6+28v8C8xRjMb/YtJPfYb1/nV8Pvm
 oDE481PfPseHo5hWJASTvjdU1+rzKzaEXCIGvfdW5QkzUPrdyaRr7wfZKmTSQW2z
 cJS6P3hvGgZmAaOZ+f51dzOoHnGMmZVoxMe6Az296b16nja12gC5cYgWW1szLPZ8
 Pdi9778BwiIzsLREMCujihp6zY7lQtfKLzDx9IwbFr8vU6NLFoL43FI/iVGexpKs
 pvTHAliTOHNojUqmebhqmPCrlg27yDwi7y6qgqJctFpom6+cym0YjSqviegl8gHm
 37WM+hDR0lcZ1g==
X-ME-Sender: <xms:7RHkXLOMrMBp_6XqIg9ZJW_VFCYjwB9zI-AL1qe5RIMWxTEVES3yyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:7RHkXDwXUQNXMxuGOlSp8nuDeQQCNGb5Ji6UvujQ411O89QFLAoDvg>
 <xmx:7RHkXLJLmdjsRjizY1DRuCPBHMXv8izmIHGfGyxn0OSvONL51bJgYQ>
 <xmx:7RHkXKotN25VydYifO9tungczr1BLZjiyW_onfrjqPc8HFsVYAT_Zg>
 <xmx:7RHkXJatxxVPONfOgECbPT5F2R4APX1fmKx4Nm_C5ofC_SA6DwMrMA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3102F103CF;
 Tue, 21 May 2019 10:57:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 21 May 2019 23:57:37 +0900
Message-Id: <20190521145737.11809-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
References: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/4] ALSA: firewire-lib: use IT context header
	to compute cycle count for scheduling packet
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

In IT context, header includes information of cycle to have processed
queued packet.

This commit uses the per-packet information to compute the cycle for
packet to be queued, instead of callback argument. In current
implementaion of ALSA IEC 61883-1/6 packet streaming engine, 48 packets
are queued at first to skip recent cycle. When IT context calls handler,
cycle information in header plus 48 cycle means the cycle to be going
to queue packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 51 +++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 5ebdac2086c0..f43943fd962d 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -694,13 +694,12 @@ static int handle_in_packet_without_header(struct amdtp_stream *s,
 	return 0;
 }
 
-/*
- * In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
- * the other hand, in DMA descriptors of 1394 OHCI, 3 bits are used to represent
- * it. Thus, via Linux firewire subsystem, we can get the 3 bits for second.
- */
-static inline u32 compute_cycle_count(u32 tstamp)
+// In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
+// the other hand, in DMA descriptors of 1394 OHCI, 3 bits are used to represent
+// it. Thus, via Linux firewire subsystem, we can get the 3 bits for second.
+static inline u32 compute_cycle_count(__be32 ctx_header_tstamp)
 {
+	u32 tstamp = be32_to_cpu(ctx_header_tstamp) & HEADER_TSTAMP_MASK;
 	return (((tstamp >> 13) & 0x07) * 8000) + (tstamp & 0x1fff);
 }
 
@@ -712,6 +711,16 @@ static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
 	return cycle;
 }
 
+// Align to actual cycle count for the packet which is going to be scheduled.
+// This module queued the same number of isochronous cycle as QUEUE_LENGTH to
+// skip isochronous cycle, therefore it's OK to just increment the cycle by
+// QUEUE_LENGTH for scheduled cycle.
+static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp)
+{
+	u32 cycle = compute_cycle_count(ctx_header_tstamp);
+	return increment_cycle_count(cycle, QUEUE_LENGTH);
+}
+
 static inline void cancel_stream(struct amdtp_stream *s)
 {
 	s->packet_index = -1;
@@ -725,23 +734,23 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				void *private_data)
 {
 	struct amdtp_stream *s = private_data;
-	unsigned int i, packets = header_length / 4;
-	u32 cycle;
+	const __be32 *ctx_header = header;
+	unsigned int i, packets = header_length / sizeof(*ctx_header);
 
 	if (s->packet_index < 0)
 		return;
 
-	cycle = compute_cycle_count(tstamp);
+	for (i = 0; i < packets; ++i) {
+		u32 cycle;
 
-	/* Align to actual cycle count for the last packet. */
-	cycle = increment_cycle_count(cycle, QUEUE_LENGTH - packets);
+		cycle = compute_it_cycle(*ctx_header);
 
-	for (i = 0; i < packets; ++i) {
-		cycle = increment_cycle_count(cycle, 1);
 		if (s->handle_packet(s, 0, cycle, i) < 0) {
 			cancel_stream(s);
 			return;
 		}
+
+		++ctx_header;
 	}
 
 	fw_iso_context_queue_flush(s->context);
@@ -767,10 +776,9 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; i++) {
 		u32 iso_header = be32_to_cpu(ctx_header[0]);
-		unsigned int cycle;
+		u32 cycle;
 
-		tstamp = be32_to_cpu(ctx_header[1]) & HEADER_TSTAMP_MASK;
-		cycle = compute_cycle_count(tstamp);
+		cycle = compute_cycle_count(ctx_header[1]);
 
 		/* The number of bytes in this packet */
 		payload_length = iso_header >> ISO_DATA_LENGTH_SHIFT;
@@ -802,9 +810,8 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 					void *header, void *private_data)
 {
 	struct amdtp_stream *s = private_data;
-	__be32 *ctx_header = header;
+	const __be32 *ctx_header = header;
 	u32 cycle;
-	unsigned int packets;
 
 	/*
 	 * For in-stream, first packet has come.
@@ -814,8 +821,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	wake_up(&s->callback_wait);
 
 	if (s->direction == AMDTP_IN_STREAM) {
-		tstamp = be32_to_cpu(ctx_header[1]) & HEADER_TSTAMP_MASK;
-		cycle = compute_cycle_count(tstamp);
+		cycle = compute_cycle_count(ctx_header[1]);
 
 		context->callback.sc = in_stream_callback;
 		if (s->flags & CIP_NO_HEADER)
@@ -823,9 +829,8 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 		else
 			s->handle_packet = handle_in_packet;
 	} else {
-		packets = header_length / 4;
-		cycle = compute_cycle_count(tstamp);
-		cycle = increment_cycle_count(cycle, QUEUE_LENGTH - packets);
+		cycle = compute_it_cycle(*ctx_header);
+
 		context->callback.sc = out_stream_callback;
 		if (s->flags & CIP_NO_HEADER)
 			s->handle_packet = handle_out_packet_without_header;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
