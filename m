Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF0280E4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 17:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1931677;
	Thu, 23 May 2019 17:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1931677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558624707;
	bh=SQBOw1bi2c0IE1hHQNpfPs1ZCLIB6HGPypH7cL+a8qk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcFPa1nhlxXuoFz8Dl5e2TkeujAIHgz0LPLhynmxQZ1dIEY2LLhmFjfm1kcdX8ZRg
	 n6OZeFuQ4qkBGw44lKn2vqMTxJV+BvANFFmydVIPv7HmCd30K48JwJG1v7oQ24MoPK
	 LGUT9Hw9K1nyLLQiafbPPex/cf2M6ZIrOgW7dgFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E446F89732;
	Thu, 23 May 2019 17:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2EDEF89707; Thu, 23 May 2019 17:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C694BF89674
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C694BF89674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="G6d4IeWy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L9hzU4VF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A22437DAB;
 Thu, 23 May 2019 11:14:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 May 2019 11:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XntJvue0Smulw
 a9zkUNITnZe46BRfTgn17lwV5xcSwk=; b=G6d4IeWyfn7K5jiFgqY92Yh/HRoCK
 qZd595lR+cWujZMXW6cdOXH4Hn8MfwOF3S+oUKLOnVo5Q5r/81LIO7ea1vxqr4GH
 HgGst/RZe8gGG3S5lg5S6txXvXIA+0iI4pli60fjpugB4+NgTBwPy+k4Uj8S0EMP
 hqUwiRHcTXrQ5RI+MwZeX2iNjY9Ly2IgMaZwUKxqHFXxt0k2VUYgryKs6/ZxJ7m1
 xPkUoMtBQwNZsQUWDn93zW3T2Yjsif8XlTIZPkOQtMxjGegSCOnxPCV8Ey0y66hG
 dRfZV1qu20f2KdJY9iq05F2zbklHepD8EGQPjvXRUlF1hVW3k0EkfpkDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XntJvue0Smulwa9zkUNITnZe46BRfTgn17lwV5xcSwk=; b=L9hzU4VF
 djftEnVXLSCdWIXlyK1UEOPX4Qk0xT+yhHZC4Q7P+YRMT/EpZcOoYlTjpbas8vJk
 7G21dYjB64INqKfid6dKGN9/RhzMAzPP8Dl4scyc0yfJgOEtldsNWyB05RrIv/Xr
 n20HxaCaTVb0JTJJy48SBnRmrQRM4wKhIWGITw+vn8Xkb0w4jesQ0IsH3WYrxHh2
 Go8hXeKDjAWdx0C03dbyRUyqkARwyUFCPrUGuz3IRUayrb6KwglaTGt1JCzi7F/x
 /q+Drwy+6+D/1esKzgZINgwszPHnQ+Imk03an5jH4XSgdWjOiIxxZZQbnH9JGPMP
 efoCDRsylKtv2w==
X-ME-Sender: <xms:6LjmXFmm5bxMdR48AYumVWuHPzCc1vuj4gBXIK72KvOZe_pOpMMAhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6LjmXJgXt7u3CvCmQxXJxmsA3Kj0vvP1E8zHb_yYjgWgUYqp7vs86Q>
 <xmx:6LjmXLkwze-ZIc220Let9BDPxpzSdAhaHO76zc0exQup0w79qx_2aQ>
 <xmx:6LjmXCHtEZovJvKp6IKmMAdb5X-0rCunM6wpzoeROHIPsaTvmkDq2Q>
 <xmx:6LjmXMaPvJ6xaKN5KqI8xV6zDBUhSGuPgSbeJQupgaH8_nXo6c_RiA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21B9E38008B;
 Thu, 23 May 2019 11:14:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 00:14:38 +0900
Message-Id: <20190523151440.5127-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/4] ALSA: firewire-lib: unify packet handler
	for IT context
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

The handlers for packet with CIP and without CIP include common codes.
This commit unifies them and remove an member for pointer to callback
function from data structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 59 +++++++++++------------------------
 sound/firewire/amdtp-stream.h |  3 --
 2 files changed, 18 insertions(+), 44 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 25985663bb2b..b11a8d244f89 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -496,56 +496,38 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 {
 	unsigned int syt;
 	unsigned int data_blocks;
-	unsigned int pcm_frames;
 	unsigned int payload_length;
+	__be32 *cip_header;
+	unsigned int pcm_frames;
 	struct snd_pcm_substream *pcm;
 
 	syt = calculate_syt(s, cycle);
 	data_blocks = calculate_data_blocks(s, syt);
-	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
+
+	payload_length = data_blocks * sizeof(__be32) * s->data_block_quadlets;
+	if (!(s->flags & CIP_NO_HEADER)) {
+		cip_header = buffer;
+		buffer += 2;
+		payload_length += 2 * sizeof(__be32);
+	} else {
+		cip_header = NULL;
+	}
+
+	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
 
 	if (s->flags & CIP_DBC_IS_END_EVENT)
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
 
-	generate_cip_header(s, buffer, syt);
+	if (cip_header)
+		generate_cip_header(s, cip_header, syt);
 
 	if (!(s->flags & CIP_DBC_IS_END_EVENT))
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
-	payload_length = 8 + data_blocks * 4 * s->data_block_quadlets;
 
-	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
-
-	if (queue_out_packet(s, payload_length) < 0)
-		return -EIO;
-
-	pcm = READ_ONCE(s->pcm);
-	if (pcm && pcm_frames > 0)
-		update_pcm_pointers(s, pcm, pcm_frames);
-
-	/* No need to return the number of handled data blocks. */
-	return 0;
-}
-
-static int handle_out_packet_without_header(struct amdtp_stream *s,
-				unsigned int cycle, const __be32 *ctx_header,
-				__be32 *buffer, unsigned int index)
-{
-	unsigned int syt;
-	unsigned int data_blocks;
-	unsigned int pcm_frames;
-	unsigned int payload_length;
-	struct snd_pcm_substream *pcm;
-
-	syt = calculate_syt(s, cycle);
-	data_blocks = calculate_data_blocks(s, syt);
-	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
-	s->data_block_counter = (s->data_block_counter + data_blocks) & 0xff;
-
-	payload_length = data_blocks * 4 * s->data_block_quadlets;
-
-	trace_amdtp_packet(s, cycle, NULL, payload_length, data_blocks, index);
+	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+			   index);
 
 	if (queue_out_packet(s, payload_length) < 0)
 		return -EIO;
@@ -554,7 +536,6 @@ static int handle_out_packet_without_header(struct amdtp_stream *s,
 	if (pcm && pcm_frames > 0)
 		update_pcm_pointers(s, pcm, pcm_frames);
 
-	/* No need to return the number of handled data blocks. */
 	return 0;
 }
 
@@ -766,7 +747,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		cycle = compute_it_cycle(*ctx_header);
 		buffer = s->buffer.packets[s->packet_index].buffer;
 
-		if (s->handle_packet(s, cycle, ctx_header, buffer, i) < 0) {
+		if (handle_out_packet(s, cycle, ctx_header, buffer, i) < 0) {
 			cancel_stream(s);
 			return;
 		}
@@ -837,10 +818,6 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 		cycle = compute_it_cycle(*ctx_header);
 
 		context->callback.sc = out_stream_callback;
-		if (s->flags & CIP_NO_HEADER)
-			s->handle_packet = handle_out_packet_without_header;
-		else
-			s->handle_packet = handle_out_packet;
 	}
 
 	s->start_cycle = cycle;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 234483a31df5..3942894c11ac 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -108,9 +108,6 @@ struct amdtp_stream {
 	struct iso_packets_buffer buffer;
 	int packet_index;
 	int tag;
-	int (*handle_packet)(struct amdtp_stream *s, unsigned int cycle,
-			     const __be32 *ctx_header, __be32 *buffer,
-			     unsigned int index);
 	union {
 		struct {
 			unsigned int ctx_header_size;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
