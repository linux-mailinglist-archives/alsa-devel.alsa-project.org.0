Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0664D26596
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF7F1615;
	Wed, 22 May 2019 16:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF7F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534834;
	bh=KRHnuIB/Ehv7fDi1Nevec12Yi5ABfhBnbbi7QDdRyDM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2y7bMqLeCgHh9HnWlNFOS1XwFYd6rt/6KbepjJptf9D9pNAeDmKaLufa6CFlRGj9
	 fLzoK2D6leIJpe2kUwQz1bvBoTrqP8B6cvpSb26BUM7Y8Ewa7DAHRa/Bn35PfaP7DY
	 z08TCH6RwrYr09pqSrA6xJl/gTRXErxI5kHCrMXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D977F8972A;
	Wed, 22 May 2019 16:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D13DF89718; Wed, 22 May 2019 16:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5AA3F89630
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AA3F89630
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XnYeeBV+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LS4phXRN"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EBFA62213F;
 Wed, 22 May 2019 10:17:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QGossWTJAH/E9
 7883IZW1ndPthE/JQKqe5ls1UUgXuQ=; b=XnYeeBV+ssmkwVJas2AM1TRYbSwGu
 SqZ5QBAyDOGxie6a3pTOw0Db8xwTxqzOUqKkKrZygTfjYCjV1ISIsnpILzC7e3rm
 kz00SPgodr9Rt4XCITKsCEerKNId7r7F04sSfUnIitQdLIVCtELZ2fm/PDtfOqiu
 Pw/EHb9QipkdnFWAcpAC23ZFJgAvRYYbLlayHx44TVDPaQ/6y1jLJJiSeZBt/GGj
 ZC5wct9VimQLmgnG0hkt7ISB7uHumEwQIHb+2yjrGFs1ICuz0kU0Y1eqEzOhAvFR
 7ydHncSC+KdemW8TO0w1rZAJZVnNLUdec7x32Pliw4MNiifwHQX+x4ybw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QGossWTJAH/E97883IZW1ndPthE/JQKqe5ls1UUgXuQ=; b=LS4phXRN
 k5upCBeQOg+U3pssDrE4fclP7etGrkeM6dxi0HOFAIrt4QrgPiPFwDBrJ/+Sv5bG
 5TWb+Hjli07UEk7pJNyjGoISGZgXsmTL6x7ax8U6CpnzlP++Agvf076SX92RNtQa
 OTSoBmm7VNvbkxhFd4W7O2pgz5qLyhQUlwNgfJ1P5xz+EOpihoYmfhc8jo+e5yvh
 oslnFaocbhcxKMhv7EdLpWqv/xedIIEhMLl446EvD5z1Q3gGelKn+L+cWbonIXVj
 CPu3rdVe8VhcTzoIDLFkQcBt+rcgZ+ZI9EPfAgl9tdKvuYLakNwdU/M88NheNOF3
 0FJRQxBEie8gAQ==
X-ME-Sender: <xms:7VnlXFL0S-S2h4NKdpSZfqaKFn68KABzn6aaxBrNjad_xO9EP9UOoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:7VnlXH6d0IYaLbJwI5pwzI46t1pxE9SLqXY0M-3B95sbRk-QsKY6RA>
 <xmx:7VnlXF03LC5ykJlEEhI85t_601v3F3ldcilFptwl3z1IfvhK5vAGHw>
 <xmx:7VnlXHNGyXgfmd92pUNa0nExMm7Y-ea09ckFoXiJzQ5tP3GxWQQ2SQ>
 <xmx:7VnlXMpz-C2DtdhhZKlzmD0ymxpc-2_WkC2gBo1fyezNO1FaD-_RxQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65F39380087;
 Wed, 22 May 2019 10:17:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:05 +0900
Message-Id: <20190522141708.29159-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: firewire-lib: compute pointer to
	payload buffer in context handler
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

The value of pointer to payload buffer is computed in each packet
handler, however the pointer can be decided before call of packet
handler.

This commit adds an argument for the pointer to the packet handler to
reduce codes to compute for the pointer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 28 +++++++++++++---------------
 sound/firewire/amdtp-stream.h |  3 ++-
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 4584525a7f30..ab9dc7e9ffa4 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -475,16 +475,15 @@ static inline int queue_in_packet(struct amdtp_stream *s)
 }
 
 static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
-			     const __be32 *ctx_header, unsigned int index)
+			     const __be32 *ctx_header, __be32 *buffer,
+			     unsigned int index)
 {
-	__be32 *buffer;
 	unsigned int syt;
 	unsigned int data_blocks;
 	unsigned int pcm_frames;
 	unsigned int payload_length;
 	struct snd_pcm_substream *pcm;
 
-	buffer = s->buffer.packets[s->packet_index].buffer;
 	syt = calculate_syt(s, cycle);
 	data_blocks = calculate_data_blocks(s, syt);
 	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
@@ -522,16 +521,14 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 
 static int handle_out_packet_without_header(struct amdtp_stream *s,
 				unsigned int cycle, const __be32 *ctx_header,
-				unsigned int index)
+				__be32 *buffer, unsigned int index)
 {
-	__be32 *buffer;
 	unsigned int syt;
 	unsigned int data_blocks;
 	unsigned int pcm_frames;
 	unsigned int payload_length;
 	struct snd_pcm_substream *pcm;
 
-	buffer = s->buffer.packets[s->packet_index].buffer;
 	syt = calculate_syt(s, cycle);
 	data_blocks = calculate_data_blocks(s, syt);
 	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
@@ -553,9 +550,9 @@ static int handle_out_packet_without_header(struct amdtp_stream *s,
 }
 
 static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
-			    const __be32 *ctx_header, unsigned int index)
+			    const __be32 *ctx_header, __be32 *buffer,
+			    unsigned int index)
 {
-	__be32 *buffer;
 	unsigned int payload_length;
 	u32 cip_header[2];
 	unsigned int sph, fmt, fdf, syt;
@@ -573,7 +570,6 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		return -EIO;
 	}
 
-	buffer = s->buffer.packets[s->packet_index].buffer;
 	cip_header[0] = be32_to_cpu(buffer[0]);
 	cip_header[1] = be32_to_cpu(buffer[1]);
 
@@ -678,17 +674,15 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 
 static int handle_in_packet_without_header(struct amdtp_stream *s,
 				unsigned int cycle, const __be32 *ctx_header,
-				unsigned int index)
+				__be32 *buffer, unsigned int index)
 {
-	__be32 *buffer;
 	unsigned int payload_length;
 	unsigned int data_blocks;
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
 	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
-	buffer = s->buffer.packets[s->packet_index].buffer;
-	data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
+	data_blocks = payload_length / 4 / s->data_block_quadlets;
 
 	trace_amdtp_packet(s, cycle, NULL, payload_length, data_blocks, index);
 
@@ -753,10 +747,12 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; ++i) {
 		u32 cycle;
+		__be32 *buffer;
 
 		cycle = compute_it_cycle(*ctx_header);
+		buffer = s->buffer.packets[s->packet_index].buffer;
 
-		if (s->handle_packet(s, cycle, ctx_header, i) < 0) {
+		if (s->handle_packet(s, cycle, ctx_header, buffer, i) < 0) {
 			cancel_stream(s);
 			return;
 		}
@@ -783,10 +779,12 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; i++) {
 		u32 cycle;
+		__be32 *buffer;
 
 		cycle = compute_cycle_count(ctx_header[1]);
+		buffer = s->buffer.packets[s->packet_index].buffer;
 
-		if (s->handle_packet(s, cycle, ctx_header, i) < 0)
+		if (s->handle_packet(s, cycle, ctx_header, buffer, i) < 0)
 			break;
 
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index d317fdc6ab5f..5aa9683593d2 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -109,7 +109,8 @@ struct amdtp_stream {
 	int packet_index;
 	int tag;
 	int (*handle_packet)(struct amdtp_stream *s, unsigned int cycle,
-			     const __be32 *ctx_header, unsigned int index);
+			     const __be32 *ctx_header, __be32 *buffer,
+			     unsigned int index);
 	union {
 		struct {
 			unsigned int ctx_header_size;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
