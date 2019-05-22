Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E326599
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6132166A;
	Wed, 22 May 2019 16:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6132166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534948;
	bh=38cJ+7DA0H0xanjVz7++8pGBNaooyC1vsWyLnqlv6/s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOEqpcHcHrRbv5STuIGTP9g3J4HzMK7S9Ayoy+T8uAc217rJGKob81s9pMJVOvcX3
	 Nkp7ZoynMdoC3fc2a/F2dIq6Vvyrv/900LpJK1OGSdL9bOFYDVDlqAVXek6GeIzXHs
	 d8WsUpacZRiVLSPJDKwLOEzgcSPUEQIWFI+JCTVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BC3F89742;
	Wed, 22 May 2019 16:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C993F8972C; Wed, 22 May 2019 16:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D86DF89630
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D86DF89630
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aUmFMwmA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tn2qL09Y"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B1AF2424B;
 Wed, 22 May 2019 10:17:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=X4CwpVFBm8Kao
 PFZrUyO+9J8i6NWv5N1/x7Kwu0TxR8=; b=aUmFMwmAPpaULIjNDP7bmexskP/FH
 SQvNyQ3Qm+tdlRVKThhPqNJ5iWCh0ZU2PLamejwLEwfaU6IDdrOpMlflSxtefm82
 ZuNu0NRnJPVDMVVZnPzSc+RUDEKl+qaHQoG/0TNdiX3PoTKrZ/UkYNvEG5QauOZy
 jF+PATSmUZ/xeaDFyiRPP9V21XoWGyhWFhUuA//Appy3eQ4OgPuNZZe30vsx9jrE
 X8hdpPlZKEwmttVhoy8/TJq/sSVmiO5v61vI1JcWf4DifkUr59vjcVelWXS4ygDE
 tcgEBQd+VyezzCGzXmgVT4RMvxbCpdPhCiat8uO6uVu0kFy4rAEkEovvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=X4CwpVFBm8KaoPFZrUyO+9J8i6NWv5N1/x7Kwu0TxR8=; b=tn2qL09Y
 3aUv39DeqHlkdfj9wmMLN/EIv7YjC4jYirUzlzlp8xZjtfBc3el5SioLq5BwJjUh
 GXeobeQtn5af/I5OPkt8wu98EsZ4AJ3scYQz47SslWxobHvhUiB3VAPHFExrQIlM
 msIEpj23v7C/LFvuB8g9/AwJx3GQ7OW8/W6A7nzJ5WVk/T01q0phSX1FuTiF5DHb
 VNOn6ihIpxFlEDXnxhoyoMF4cGxvCC28I2Dn4JNHGuVpI/FUzSzWnDB/D8Hd68b/
 tIgEM+ZpaPLTvEB/obRHWG+Jo7BtN4sR78Gzo6GQsoYxSCW0WGc24Qd9a4Sjhz9b
 eb8HqJgaZKkChQ==
X-ME-Sender: <xms:8lnlXIVeHPx8pGfahx4tDKdKlZs5HR4M8ZYjK-tHLZDVxDkEwJD7gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgephe
X-ME-Proxy: <xmx:8lnlXNCDCGk4TgMyWxmKKxHWydY5TdbrNjViAqCPo_rI2mPO4PyYyg>
 <xmx:8lnlXB1Dixc2PAXLZr5sJIpzR9VZ47Af962Wmd5P9nVCr8_ksRaQ2Q>
 <xmx:8lnlXFT4iz8pArXFzSd8C2NWuxWWBjx206aIq45uZ2OJ9zCu9YoA7A>
 <xmx:8lnlXEsM88ICU7PgOFlciu007hNUPzU4lzL3xlyLM7jMUVP_F6SZrQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F8D2380086;
 Wed, 22 May 2019 10:17:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:08 +0900
Message-Id: <20190522141708.29159-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] ALSA: firewire-lib: unify packet handler
	for IR context
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

Usage of 16 bytes IR context header allows to handle context payload by
the same code for with-CIP and without-CIP packets.

This commit unifies both handlers of with-CIP and without-CIP packets.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 54 ++++++++++-------------------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fa99210f5a48..2d9c764061d1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -676,13 +676,20 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	cip_header = ctx_header + 2;
-	err = check_cip_header(s, cip_header, payload_length, &data_blocks,
-			       &syt);
-	if (err < 0) {
-		if (err != -EAGAIN)
-			return err;
-		pcm_frames = 0;
-		goto end;
+	if (!(s->flags & CIP_NO_HEADER)) {
+		cip_header = &ctx_header[2];
+		err = check_cip_header(s, cip_header, payload_length,
+				       &data_blocks, &syt);
+		if (err < 0) {
+			if (err != -EAGAIN)
+				return err;
+			pcm_frames = 0;
+			goto end;
+		}
+	} else {
+		cip_header = NULL;
+		data_blocks = payload_length / 4 / s->data_block_quadlets;
+		syt = 0;
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
@@ -700,33 +707,6 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 	return 0;
 }
 
-static int handle_in_packet_without_header(struct amdtp_stream *s,
-				unsigned int cycle, const __be32 *ctx_header,
-				__be32 *buffer, unsigned int index)
-{
-	unsigned int payload_length;
-	unsigned int data_blocks;
-	struct snd_pcm_substream *pcm;
-	unsigned int pcm_frames;
-
-	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
-	data_blocks = payload_length / 4 / s->data_block_quadlets;
-
-	trace_amdtp_packet(s, cycle, NULL, payload_length, data_blocks, index);
-
-	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, NULL);
-	s->data_block_counter = (s->data_block_counter + data_blocks) & 0xff;
-
-	if (queue_in_packet(s) < 0)
-		return -EIO;
-
-	pcm = READ_ONCE(s->pcm);
-	if (pcm && pcm_frames > 0)
-		update_pcm_pointers(s, pcm, pcm_frames);
-
-	return 0;
-}
-
 // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
 // the other hand, in DMA descriptors of 1394 OHCI, 3 bits are used to represent
 // it. Thus, via Linux firewire subsystem, we can get the 3 bits for second.
@@ -812,7 +792,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		cycle = compute_cycle_count(ctx_header[1]);
 		buffer = s->buffer.packets[s->packet_index].buffer;
 
-		if (s->handle_packet(s, cycle, ctx_header, buffer, i) < 0)
+		if (handle_in_packet(s, cycle, ctx_header, buffer, i) < 0)
 			break;
 
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
@@ -847,10 +827,6 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 		cycle = compute_cycle_count(ctx_header[1]);
 
 		context->callback.sc = in_stream_callback;
-		if (s->flags & CIP_NO_HEADER)
-			s->handle_packet = handle_in_packet_without_header;
-		else
-			s->handle_packet = handle_in_packet;
 	} else {
 		cycle = compute_it_cycle(*ctx_header);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
