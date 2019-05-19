Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33192268D
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E841E1689;
	Sun, 19 May 2019 12:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E841E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260343;
	bh=NS5QzBpAUgA9NCHYYBdXYCKoAzlCK92yC1nRemcLqM0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcLcedGxW+Gs0NLeGpOOUPWQiQ7XYm+Xvqzi/Z7iIrIPeCwILrs5Nhpx+87vWvZib
	 Bvgbi69o/GmMRBQVFYAvbhh2SzCR83TjCgpag8WRe4sV76oALUatLqmX8Z/nN5fqiT
	 OnbePkpMBaVoAdbXi8DVSP4zp+MdvWodLzaS+mLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEB8F89735;
	Sun, 19 May 2019 12:01:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B31F89717; Sun, 19 May 2019 12:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25EC9F89709
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EC9F89709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cDEFVdQc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k/4+iCF9"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5589C2202A;
 Sun, 19 May 2019 06:01:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lyAJo8UxT6Ikf
 Vln0y5UUE/iK0sXzwUp+Ob9rDpx1K4=; b=cDEFVdQcUyTLzMwSkXMuRguBoFkhw
 xvfqCdl2JDaNka7OYEX5P5Ll+Dc42V6xW/E3p3Rkcb4zNO1XKwPZGGph4hxaibcD
 7OiyLED4f6mjnIdEDvZFT0fbg4cc8AX9hkbChreShOfNtwN2wCGhCZOixIybO4sK
 aVba33UGfLDWkKdsBDApmEQknD2qvGAFDQOe1AiOLKHDRomemO13yEB+5GtY8APl
 7Pyh3nVlzJWMwO+/EYuUhjO9e6q8X5zciximceDRiW3bBRotAsO3NFY1sO9rK/9o
 7ppIhJQ3ORQjEwngvQX7YifVHK24GHyr+1DCI79LOPSl+zA85gzJElzow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lyAJo8UxT6IkfVln0y5UUE/iK0sXzwUp+Ob9rDpx1K4=; b=k/4+iCF9
 b1Z/OqabC/wAwI/nE2qULH6q9yrFKad1RWGoVROuQxbi2y9A1eIG9Tobq3spTQye
 DHqpcpTkL6ie15rrj0JdSTBtQvjNGVaQi7SwWVKKjWJLucTH5nTPoyOIhSafxsXI
 lO002JEO668cF5w6V7qZWe3e/Z6cReXppsXor4MoVTtuscX94NnPzNDoQuav0QwX
 fFTKdS3cQ3RC8SgRveYxDRABNpTC+SMdTIJc/ylhcQVpNdM0lkA20n0PO+HuVr+Y
 Wfc8Fng1b0AS8o+S0bqlDSxnvjSZyvul5U5DCwwTVlXjLEwC4fqhpmACHFIJZiB5
 5uDS3XuJdn/RXg==
X-ME-Sender: <xms:bynhXLUZLGoES_Y0wveouvbRJDW20apmPhPyOX5tnyn8pLvuY3NMFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bynhXO_CqBn1jW0TmLFtthrzvvMsJMtSuYatERcVjplPAvt03TB85A>
 <xmx:bynhXFK8uZGEbQFkbNrwiMsT2mqF5dBjstIlv7O1aCKcsxKVuQfWlA>
 <xmx:bynhXM0RDnEkty6jXmVzuvNZRwmivOrlVf_7go85tzq2QrGW4Sm5Tw>
 <xmx:bynhXLX8PCXfX2b-FvCaUG1tCTgb-Q2QV0mrZCII9aIwu6CfbjtoJA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0208F103CF;
 Sun, 19 May 2019 06:01:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:07 +0900
Message-Id: <20190519100109.14167-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
References: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/5] firewire-lib: use the same unit for
	payload argument in tracing events
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

The most of tracing event in this module have the size of payload in
byte unit, however 'in_packet_without_header' event have the argument
in quadlet unit.

This commit change the unit for argument to be consistent.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 12 ++++++------
 sound/firewire/amdtp-stream.c       |  6 ++----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 95343fb17583..30c547552cd2 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -39,7 +39,7 @@ TRACE_EVENT(in_packet,
 		__entry->dest = fw_parent_device(s->unit)->card->node_id;
 		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
 		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
-		__entry->payload_quadlets = payload_length / 4;
+		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks;
 		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
@@ -89,7 +89,7 @@ TRACE_EVENT(out_packet,
 		__entry->dest = fw_parent_device(s->unit)->node_id;
 		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
 		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
-		__entry->payload_quadlets = payload_length / 4;
+		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks;
 		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
@@ -114,8 +114,8 @@ TRACE_EVENT(out_packet,
 );
 
 TRACE_EVENT(in_packet_without_header,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, unsigned int payload_quadlets, unsigned int data_blocks, unsigned int index),
-	TP_ARGS(s, cycles, payload_quadlets, data_blocks, index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
+	TP_ARGS(s, cycles, payload_length, data_blocks, index),
 	TP_STRUCT__entry(
 		__field(unsigned int, second)
 		__field(unsigned int, cycle)
@@ -135,7 +135,7 @@ TRACE_EVENT(in_packet_without_header,
 		__entry->channel = s->context->channel;
 		__entry->src = fw_parent_device(s->unit)->node_id;
 		__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		__entry->payload_quadlets = payload_quadlets;
+		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks,
 		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
@@ -179,7 +179,7 @@ TRACE_EVENT(out_packet_without_header,
 		__entry->channel = s->context->channel;
 		__entry->src = fw_parent_device(s->unit)->card->node_id;
 		__entry->dest = fw_parent_device(s->unit)->node_id;
-		__entry->payload_quadlets = payload_length / 4;
+		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks,
 		__entry->data_block_counter = s->data_block_counter,
 		__entry->packet_index = s->packet_index;
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 67b60490e505..15ae1f2989e5 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -659,16 +659,14 @@ static int handle_in_packet_without_header(struct amdtp_stream *s,
 			unsigned int index)
 {
 	__be32 *buffer;
-	unsigned int payload_quadlets;
 	unsigned int data_blocks;
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
 	buffer = s->buffer.packets[s->packet_index].buffer;
-	payload_quadlets = payload_length / 4;
-	data_blocks = payload_quadlets / s->data_block_quadlets;
+	data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
 
-	trace_in_packet_without_header(s, cycle, payload_quadlets, data_blocks,
+	trace_in_packet_without_header(s, cycle, payload_length, data_blocks,
 				       index);
 
 	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, NULL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
