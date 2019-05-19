Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DF2268A
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169B21694;
	Sun, 19 May 2019 12:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169B21694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260229;
	bh=cDBsg+6ToMn+UBGjZQYBx+tPazSKOX0jWO0Ah3w5njc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dISWTplay0LuNq4H8ZkICs1tvFuYRvhgNdbv+klksswn6zFrHxdymDh3Gev5VoBz+
	 YGf1T4lSjp26zZrInnWvMJ1ZKL73aRfWNVv7RpnIVkOJWYf+Yenn+Dkkon1ZEcKmKP
	 EmUn/olX+9fzE/T9I6FO2oFmw0JmdE570RDt4AOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E085F89709;
	Sun, 19 May 2019 12:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59658F89670; Sun, 19 May 2019 12:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D056F89630
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D056F89630
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tShC5Dx0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XUmgnFyg"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EAC2F2208C;
 Sun, 19 May 2019 06:01:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vIWloC/hh0TS4
 3thHtaTPVAweh5rEfH2PVLt2rCBme4=; b=tShC5Dx00Hi8p1AIq39WVq4rXh459
 d21A2X0tBxjgfi5Gi/oSGjKBSk+P7WeWlH24y7lnBClp5UQ2yb5GgNRQUg0tRE/h
 AHtAAopEip9na2mDo6sZdCB0YQmRobXOl6O7EEFq14Rr99bglT+NwAQgJ6lhYocp
 y32/WjLE/RTk/EldkU9S3XUHEXQ4HSkO05SM7u+tY5Q4A/IJ6YL1gfb74uxd4tjg
 oEm61Fa58VCSXQ8hShku0yVleiludBLGVBiX5Gyel+CtAhD0gL/8T1w+gveuEVQ8
 mn180+K4IKyklvr8Dz4Ts/2mncb9KnVUgQb9g90vihjVyX9p03CQkUW/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vIWloC/hh0TS43thHtaTPVAweh5rEfH2PVLt2rCBme4=; b=XUmgnFyg
 ai05N+vkPUOQITIChjjB5EQLZ28H129BD8B/b0Pvc9MdgUBSQ4d/otPxH4GMw8RJ
 i8YJYUECuoGbTCys8TVmYLSXAaRtoJeW/cRS0A33DOQpSaJ5r7fPVNCnPjmRBG8W
 BayPcH6ae+yNuhcoo6RIJ+MZ1qLWyvDY1RYqDYkqAD1Xtf3pM6mbCGNpMdgQN4Cs
 xWjxR7qR5x9ds8K9DD13SsPOzn6qGh9NURPAYmE/ZJh8KygfcE/PtzM/eJ4v2WNt
 h8F3tzuKgQ/K1NR1GbNFQw3AxwEU8OaHHbs78tnEom0N3S0UvCn06rZTZcdF+3LW
 WKvmZu2u+InuXg==
X-ME-Sender: <xms:bSnhXJ3czookCdz95p25rMWZH6nDo1CxA7TNbzDLdR2O9CFFl0mhew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bSnhXGCGV40tK62Z3cm-U7q9Ct9au6ZXS_YmVpvrCdn6PDpOLLRlpQ>
 <xmx:bSnhXDmCw_jRUnm_eZ9vqGF_vOgCW12c3toQPGorKPv4zcwjNwUaGQ>
 <xmx:bSnhXHrM5f-F6VCPgggvDqyyW_3S7pMmR4fbU7HEtoNKqUumaCOA-w>
 <xmx:bSnhXJBIRViDOCa7XeHJuyPwWeE0MaSoYbTi4q8_gx03nwwdy6kG_g>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A06910378;
 Sun, 19 May 2019 06:01:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:06 +0900
Message-Id: <20190519100109.14167-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
References: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/5] firewire-lib: add
	data_blocks/data_block_counter parameter to
	in_packet/out_packet tracing events
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

Tracing events for packets without CIP header have a parameter of
data_blocks/data_block_counter, but events for packets with CIP header
don't. This is not good to unify these events.

This commit adds the missing parameters to the events. In timing to
probe 'in_packet' event, data_blocks and data_block_counter are not
calculated yet. This commit also changes the timing.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 24 ++++++++++++++++++------
 sound/firewire/amdtp-stream.c       |  6 +++---
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index a86a827eab90..95343fb17583 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -14,8 +14,8 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(in_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int index),
-	TP_ARGS(s, cycles, cip_header, payload_length, index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
+	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, index),
 	TP_STRUCT__entry(
 		__field(unsigned int, second)
 		__field(unsigned int, cycle)
@@ -25,6 +25,8 @@ TRACE_EVENT(in_packet,
 		__field(u32, cip_header0)
 		__field(u32, cip_header1)
 		__field(unsigned int, payload_quadlets)
+		__field(unsigned int, data_blocks)
+		__field(unsigned int, data_block_counter)
 		__field(unsigned int, packet_index)
 		__field(unsigned int, irq)
 		__field(unsigned int, index)
@@ -38,12 +40,14 @@ TRACE_EVENT(in_packet,
 		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
 		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
 		__entry->payload_quadlets = payload_length / 4;
+		__entry->data_blocks = data_blocks;
+		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
 		__entry->irq = !!in_interrupt();
 		__entry->index = index;
 	),
 	TP_printk(
-		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %01u %02u",
+		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %03u %02u %01u %02u",
 		__entry->second,
 		__entry->cycle,
 		__entry->src,
@@ -52,14 +56,16 @@ TRACE_EVENT(in_packet,
 		__entry->cip_header0,
 		__entry->cip_header1,
 		__entry->payload_quadlets,
+		__entry->data_blocks,
+		__entry->data_block_counter,
 		__entry->packet_index,
 		__entry->irq,
 		__entry->index)
 );
 
 TRACE_EVENT(out_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, __be32 *cip_header, unsigned int payload_length, unsigned int index),
-	TP_ARGS(s, cycles, cip_header, payload_length, index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
+	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, index),
 	TP_STRUCT__entry(
 		__field(unsigned int, second)
 		__field(unsigned int, cycle)
@@ -69,6 +75,8 @@ TRACE_EVENT(out_packet,
 		__field(u32, cip_header0)
 		__field(u32, cip_header1)
 		__field(unsigned int, payload_quadlets)
+		__field(unsigned int, data_blocks)
+		__field(unsigned int, data_block_counter)
 		__field(unsigned int, packet_index)
 		__field(unsigned int, irq)
 		__field(unsigned int, index)
@@ -82,12 +90,14 @@ TRACE_EVENT(out_packet,
 		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
 		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
 		__entry->payload_quadlets = payload_length / 4;
+		__entry->data_blocks = data_blocks;
+		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
 		__entry->irq = !!in_interrupt();
 		__entry->index = index;
 	),
 	TP_printk(
-		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %01u %02u",
+		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %03u %02u %01u %02u",
 		__entry->second,
 		__entry->cycle,
 		__entry->src,
@@ -96,6 +106,8 @@ TRACE_EVENT(out_packet,
 		__entry->cip_header0,
 		__entry->cip_header1,
 		__entry->payload_quadlets,
+		__entry->data_blocks,
+		__entry->data_block_counter,
 		__entry->packet_index,
 		__entry->irq,
 		__entry->index)
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 2614fa551e24..67b60490e505 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -493,7 +493,7 @@ static int handle_out_packet(struct amdtp_stream *s,
 				(s->data_block_counter + data_blocks) & 0xff;
 	payload_length = 8 + data_blocks * 4 * s->data_block_quadlets;
 
-	trace_out_packet(s, cycle, buffer, payload_length, index);
+	trace_out_packet(s, cycle, buffer, payload_length, data_blocks, index);
 
 	if (queue_out_packet(s, payload_length) < 0)
 		return -EIO;
@@ -555,8 +555,6 @@ static int handle_in_packet(struct amdtp_stream *s,
 	cip_header[0] = be32_to_cpu(buffer[0]);
 	cip_header[1] = be32_to_cpu(buffer[1]);
 
-	trace_in_packet(s, cycle, buffer, payload_length, index);
-
 	/*
 	 * This module supports 'Two-quadlet CIP header with SYT field'.
 	 * For convenience, also check FMT field is AM824 or not.
@@ -635,6 +633,8 @@ static int handle_in_packet(struct amdtp_stream *s,
 		return -EIO;
 	}
 
+	trace_in_packet(s, cycle, buffer, payload_length, data_blocks, index);
+
 	syt = be32_to_cpu(buffer[1]) & CIP_SYT_MASK;
 	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
