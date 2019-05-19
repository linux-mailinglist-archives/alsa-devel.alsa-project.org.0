Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C72268E
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4581665;
	Sun, 19 May 2019 12:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4581665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260385;
	bh=mWW7/iPol5V7Y6ewseDKeKJvKTiNXTexOWmKArSdEts=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkkIQvXsiMbRn38w0YAbuzrgex0liv09Bi0PG4K4MWTed46+TWqfJU+Cy/5PJB6nT
	 qLzbr2VjqJUh35odnPYLU67kJ/MsgodITadRInqtRk7twrN2PPsudTxoniQ/Dtm9cG
	 fN16KEI6veUQM2sydjSXNjTXsfNB8a36sug+p4c8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1993BF8973A;
	Sun, 19 May 2019 12:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72307F89717; Sun, 19 May 2019 12:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C520F8961D
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C520F8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rIAgCP1q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iNjID/Tt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AF0BE20DC2;
 Sun, 19 May 2019 06:01:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RVKAVz+66Qisg
 PnziBAdPpC1/fIkKnDrLK5aZfcag44=; b=rIAgCP1qiuM3RoKrMJtQJUkxTfMNi
 hSp5G0Ya52VOK42M7SlxyB7e/7xHa9vlXKDKRvqieWGpmlOMjhIpL5ge4vYc4W6b
 ctrDEVzrjNzizV7vy0R42BbDqgjVU18ecOO7/VE1i4AMLjJpBkHPjmMaowgegPmf
 6UvXQnDJnRWgVrNgWWkYtrOn4jsrwWglduMmlC/rjaDoMSqVaUJNqbtkareKO86A
 fProXdrxaOsU8ePB249ouuIsW3opv8s8QT2Nx5R0iVWkEIwJhiRZVuH6Zi32DqWs
 kDxMEr2cN1iPfqAODeP6AsyqnKHZeZ06px1lDiMlIOucB3X3aconys0oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RVKAVz+66QisgPnziBAdPpC1/fIkKnDrLK5aZfcag44=; b=iNjID/Tt
 es2SXk4llMfkMBCTaiTlWBLkhUqklDHFJf792zTg0pl6stzCmut4FEdQ2BRWBwoo
 o+1BmJg0GaU/R9XQuBtWmf5BC9bCmaAHi99CJS/mwXMcAft65oKE+xlBIVyFS8JH
 lVzSzK85kqDXIeEWzulXLl7TOiSEShRSZMRYod8R7Pe1IJFspklu8AHysNZbUq5f
 YSi8mP4IaHeODWrNg2STHwzTJ9Q6pfHWjS2ypqkbe1iIezOALVwIyTAe/IBxgncT
 MaReohb4NVJJ1RDjMyI5dTnK3rJDwIaJh8Q6qxVh9b+41kzbMdfeEKTML03uXOjl
 snV/THJtXVFI9w==
X-ME-Sender: <xms:cinhXF4QhQ2Okq_EC2d7DyqbQZikLrJEVMLl9-r-KutQbPw5LZHZgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:cinhXKLY3aoKyVGYVNE50MeVL_MA4IKMHtYFKpJEWtT0nBaBkwdnqg>
 <xmx:cinhXL-Nzm5hrX-BfR3SmoNZJ7veVzJ6QEOrVbShFxMufjBnNUUTew>
 <xmx:cinhXHR8wRu2T6nWYjZOLHqWsAkmiOr-Mf24oeDxtiSgrz212U5WoQ>
 <xmx:cinhXFxq6O-u0jBsbJWjuT8bgBMK0XBwNjCl3Yx7vzV9WlTN14vJOQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 10E1310378;
 Sun, 19 May 2019 06:01:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:09 +0900
Message-Id: <20190519100109.14167-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
References: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/5] firewire-lib: unify tracing events to
	'amdtp_packet' event
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

Now four events of this module have the same arguments and probe timing.
This commit adds a new event, 'amdtp_packet', and replace them. Filtering
functionality of tracing framework is available to pick up events for
inbound/outbound isochronous packets.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 149 ++--------------------------
 sound/firewire/amdtp-stream.c       |  10 +-
 2 files changed, 11 insertions(+), 148 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 614dfd08aa48..ab708857979f 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -13,7 +13,7 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(in_packet,
+TRACE_EVENT(amdtp_packet,
 	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
 	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, index),
 	TP_STRUCT__entry(
@@ -34,60 +34,13 @@ TRACE_EVENT(in_packet,
 		__entry->second = cycles / CYCLES_PER_SECOND;
 		__entry->cycle = cycles % CYCLES_PER_SECOND;
 		__entry->channel = s->context->channel;
-		__entry->src = fw_parent_device(s->unit)->node_id;
-		__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		if (cip_header) {
-			memcpy(__get_dynamic_array(cip_header), cip_header,
-			       __get_dynamic_array_len(cip_header));
+		if (s->direction == AMDTP_IN_STREAM) {
+			__entry->src = fw_parent_device(s->unit)->node_id;
+			__entry->dest = fw_parent_device(s->unit)->card->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->card->node_id;
+			__entry->dest = fw_parent_device(s->unit)->node_id;
 		}
-		__entry->payload_quadlets = payload_length / sizeof(__be32);
-		__entry->data_blocks = data_blocks;
-		__entry->data_block_counter = s->data_block_counter,
-		__entry->packet_index = s->packet_index;
-		__entry->irq = !!in_interrupt();
-		__entry->index = index;
-	),
-	TP_printk(
-		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u %s",
-		__entry->second,
-		__entry->cycle,
-		__entry->src,
-		__entry->dest,
-		__entry->channel,
-		__entry->payload_quadlets,
-		__entry->data_blocks,
-		__entry->data_block_counter,
-		__entry->packet_index,
-		__entry->irq,
-		__entry->index,
-		__print_array(__get_dynamic_array(cip_header),
-			      __get_dynamic_array_len(cip_header),
-			      sizeof(u8)))
-);
-
-TRACE_EVENT(out_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
-	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, index),
-	TP_STRUCT__entry(
-		__field(unsigned int, second)
-		__field(unsigned int, cycle)
-		__field(int, channel)
-		__field(int, src)
-		__field(int, dest)
-		__dynamic_array(u8, cip_header, cip_header ? 8 : 0)
-		__field(unsigned int, payload_quadlets)
-		__field(unsigned int, data_blocks)
-		__field(unsigned int, data_block_counter)
-		__field(unsigned int, packet_index)
-		__field(unsigned int, irq)
-		__field(unsigned int, index)
-	),
-	TP_fast_assign(
-		__entry->second = cycles / CYCLES_PER_SECOND;
-		__entry->cycle = cycles % CYCLES_PER_SECOND;
-		__entry->channel = s->context->channel;
-		__entry->src = fw_parent_device(s->unit)->card->node_id;
-		__entry->dest = fw_parent_device(s->unit)->node_id;
 		if (cip_header) {
 			memcpy(__get_dynamic_array(cip_header), cip_header,
 			       __get_dynamic_array_len(cip_header));
@@ -117,94 +70,6 @@ TRACE_EVENT(out_packet,
 			      sizeof(u8)))
 );
 
-TRACE_EVENT(in_packet_without_header,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
-	TP_ARGS(s, cycles, payload_length, data_blocks, index),
-	TP_STRUCT__entry(
-		__field(unsigned int, second)
-		__field(unsigned int, cycle)
-		__field(int, channel)
-		__field(int, src)
-		__field(int, dest)
-		__field(unsigned int, payload_quadlets)
-		__field(unsigned int, data_blocks)
-		__field(unsigned int, data_block_counter)
-		__field(unsigned int, packet_index)
-		__field(unsigned int, irq)
-		__field(unsigned int, index)
-	),
-	TP_fast_assign(
-		__entry->second = cycles / CYCLES_PER_SECOND;
-		__entry->cycle = cycles % CYCLES_PER_SECOND;
-		__entry->channel = s->context->channel;
-		__entry->src = fw_parent_device(s->unit)->node_id;
-		__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		__entry->payload_quadlets = payload_length / sizeof(__be32);
-		__entry->data_blocks = data_blocks,
-		__entry->data_block_counter = s->data_block_counter,
-		__entry->packet_index = s->packet_index;
-		__entry->irq = !!in_interrupt();
-		__entry->index = index;
-	),
-	TP_printk(
-		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u",
-		__entry->second,
-		__entry->cycle,
-		__entry->src,
-		__entry->dest,
-		__entry->channel,
-		__entry->payload_quadlets,
-		__entry->data_blocks,
-		__entry->data_block_counter,
-		__entry->packet_index,
-		__entry->irq,
-		__entry->index)
-);
-
-TRACE_EVENT(out_packet_without_header,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
-	TP_ARGS(s, cycles, payload_length, data_blocks, index),
-	TP_STRUCT__entry(
-		__field(unsigned int, second)
-		__field(unsigned int, cycle)
-		__field(int, channel)
-		__field(int, src)
-		__field(int, dest)
-		__field(unsigned int, payload_quadlets)
-		__field(unsigned int, data_blocks)
-		__field(unsigned int, data_block_counter)
-		__field(unsigned int, packet_index)
-		__field(unsigned int, irq)
-		__field(unsigned int, index)
-	),
-	TP_fast_assign(
-		__entry->second = cycles / CYCLES_PER_SECOND;
-		__entry->cycle = cycles % CYCLES_PER_SECOND;
-		__entry->channel = s->context->channel;
-		__entry->src = fw_parent_device(s->unit)->card->node_id;
-		__entry->dest = fw_parent_device(s->unit)->node_id;
-		__entry->payload_quadlets = payload_length / sizeof(__be32);
-		__entry->data_blocks = data_blocks,
-		__entry->data_block_counter = s->data_block_counter,
-		__entry->packet_index = s->packet_index;
-		__entry->irq = !!in_interrupt();
-		__entry->index = index;
-	),
-	TP_printk(
-		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u",
-		__entry->second,
-		__entry->cycle,
-		__entry->src,
-		__entry->dest,
-		__entry->channel,
-		__entry->payload_quadlets,
-		__entry->data_blocks,
-		__entry->data_block_counter,
-		__entry->packet_index,
-		__entry->irq,
-		__entry->index)
-);
-
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 15ae1f2989e5..6b3f936fab91 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -493,7 +493,7 @@ static int handle_out_packet(struct amdtp_stream *s,
 				(s->data_block_counter + data_blocks) & 0xff;
 	payload_length = 8 + data_blocks * 4 * s->data_block_quadlets;
 
-	trace_out_packet(s, cycle, buffer, payload_length, data_blocks, index);
+	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
 
 	if (queue_out_packet(s, payload_length) < 0)
 		return -EIO;
@@ -524,8 +524,7 @@ static int handle_out_packet_without_header(struct amdtp_stream *s,
 
 	payload_length = data_blocks * 4 * s->data_block_quadlets;
 
-	trace_out_packet_without_header(s, cycle, payload_length, data_blocks,
-					index);
+	trace_amdtp_packet(s, cycle, NULL, payload_length, data_blocks, index);
 
 	if (queue_out_packet(s, payload_length) < 0)
 		return -EIO;
@@ -633,7 +632,7 @@ static int handle_in_packet(struct amdtp_stream *s,
 		return -EIO;
 	}
 
-	trace_in_packet(s, cycle, buffer, payload_length, data_blocks, index);
+	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
 
 	syt = be32_to_cpu(buffer[1]) & CIP_SYT_MASK;
 	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
@@ -666,8 +665,7 @@ static int handle_in_packet_without_header(struct amdtp_stream *s,
 	buffer = s->buffer.packets[s->packet_index].buffer;
 	data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
 
-	trace_in_packet_without_header(s, cycle, payload_length, data_blocks,
-				       index);
+	trace_amdtp_packet(s, cycle, NULL, payload_length, data_blocks, index);
 
 	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, NULL);
 	s->data_block_counter = (s->data_block_counter + data_blocks) & 0xff;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
