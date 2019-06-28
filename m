Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E462593D8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 07:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 250C71687;
	Fri, 28 Jun 2019 07:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 250C71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561701373;
	bh=1ybQadrZXoW6ILTtAUNMBp42Vu8WAIFEdBWZsERYLks=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuIg1LkW9L1uNfTOpjy40k7048FaGp20YF3cpC6KO1IIW7WDjx2nMIISqjt7XEnuz
	 hGRoDNpZgt+jXYYZ/42PSYyDKMBCAealFsBS8LdbiCVMNSjzUOKfYgrFOPGogLxgmg
	 7zf1JFP0OBd8hFK2L+ktP+8trAD5ZtThzaXX2+aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2754F896B9;
	Fri, 28 Jun 2019 07:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AB55F80058; Fri, 28 Jun 2019 07:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ED7DF896B7
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 07:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ED7DF896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="s8u5RSwW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R0XnRESr"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C2B721E90;
 Fri, 28 Jun 2019 01:53:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 28 Jun 2019 01:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oVga9puNhknlJ
 P1RkjlXff8lRWYSH/spb0WUuQdSg/U=; b=s8u5RSwWzli7OTjKK3hHfd4cJnNeO
 49e1UpDS8yiWe7k23TtOdrmkbQULoNTWgaiy4I//i+ziQ11tqKc1Ky0CRP6Rx2c5
 cR7gBud8VRuDJPkpUzwDbRgiZsFztPJs5BytXOgNDGP2IcKomxsrfcUppDnYOdn7
 qAUWcwlUPgNJoDNyJ2luBe0M7hxXAw/jA+A7J2UQ8AeztBQBLGYSaUDxmdST/Eu4
 hAGqb4jY8vfMOJxSfJy96YkMGqDYiQfBcEI+JBbirAmxrjdCp2Ns5EgHSpV26WUO
 bFLMcXBWfnsXOLxZ4WZcfrtiEcqvTJfCAcwKtAU1+ksmSlHiMdq0aPNzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oVga9puNhknlJP1RkjlXff8lRWYSH/spb0WUuQdSg/U=; b=R0XnRESr
 Da0A8rxwnnGa9V8d8JlC/ra71zN1/tqZH/qKbpNbdNXyw0EiRbedis24nML3lxc8
 JWj2IN4PG/pzzs4aRpIHVM+FHkKKpCkAuFm4o6qShLSLb0yYB4amTFTcUQjpWMTw
 01LxwrYUs+R6qSIt8jOutG02roM9h+8OiSLUmoLbRmr7puF09KAeuvNxgV9swTA9
 G+R1IEwsscXcwzMKqjW3Arb/DCPxMRdY6ijf38aY9lpy9go2opYeUVYkGSM1mwrs
 xmRx8PReQV2oSohHvnEfdHu63vdwbZVaRdkmyx3KQuCG/e4sYPfnslRj20ARnlaD
 ST6XWhrP5nKW+A==
X-ME-Sender: <xms:Y6sVXTsLUbNjBYq8oojvQ5KzEocAe9RYVLOlH4BVW-5fEH6KwJe4RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Y6sVXYaJs0nlzM0x1Et7pfaoaM7VtyjAfUI8hTmtUCw9h4m-gjQmxg>
 <xmx:Y6sVXbWofq71MdFKrdEEX5XUagyYp_6i4Z-UsBBNNZiQwkiq8_Ywgg>
 <xmx:Y6sVXaJ8AqoKTe_jWaWvGazcnl1SBPV_CgefP9wNbwqX4CZngiImRg>
 <xmx:Y6sVXVR7ibL5pElsJANTMmTuherLrQLR4-TGV9baALwF0-GfoAwqKQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3B9D380075;
 Fri, 28 Jun 2019 01:53:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 28 Jun 2019 14:53:31 +0900
Message-Id: <20190628055331.1427-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628055331.1427-1-o-takashi@sakamocchi.jp>
References: <20190628055331.1427-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/2] ALSA: firewire-lib: fix to process MIDI
	conformant data channel for AM824 format
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

In IEC 61883-6, 8 MIDI data streams are multiplexed into single MIDI
conformant data channel. The index of stream is calculated by modulo 8
of the value of data block counter. Therefore data block processing
layer requires valid value of data block counter.

In recent changes of ALSA IEC 61883-1/6 engine, the value of data block
counter is changed before calling data block processing layer. This
brings miss detection of MIDI messages in non-blocking transmission
method is used.

This commit fixes the bug by changing chached data block counter after
calling data block processing layer.

Fixes: e335425b6596 ("ALSA: firewire-lib: split helper function to check incoming CIP header")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b341bd86605e..91b890241840 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -614,11 +614,10 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       const __be32 *ctx_header,
 			       unsigned int *payload_length,
-			       unsigned int *data_blocks,
+			       unsigned int *data_blocks, unsigned int *dbc,
 			       unsigned int *syt, unsigned int index)
 {
 	const __be32 *cip_header;
-	unsigned int dbc;
 	int err;
 
 	*payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
@@ -633,32 +632,28 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = ctx_header + 2;
 		err = check_cip_header(s, cip_header, *payload_length,
-				       data_blocks, &dbc, syt);
+				       data_blocks, dbc, syt);
 		if (err < 0) {
 			if (err != -EAGAIN)
 				return err;
 
 			*data_blocks = 0;
-			dbc = s->data_block_counter;
 		}
 	} else {
 		cip_header = NULL;
 		err = 0;
 		*data_blocks = *payload_length / sizeof(__be32) /
 			       s->data_block_quadlets;
-		dbc = s->data_block_counter;
+		*dbc = s->data_block_counter;
 		*syt = 0;
 	}
 
 	if (err >= 0 && s->flags & CIP_DBC_IS_END_EVENT)
-		s->data_block_counter = dbc;
+		s->data_block_counter = *dbc;
 
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
 			   index);
 
-	if (err >= 0 && !(s->flags & CIP_DBC_IS_END_EVENT))
-		s->data_block_counter = (dbc + *data_blocks) & 0xff;
-
 	return err;
 }
 
@@ -761,7 +756,8 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	for (i = 0; i < packets; i++) {
 		u32 cycle;
 		unsigned int payload_length;
-		unsigned int data_block;
+		unsigned int data_blocks;
+		unsigned int dbc;
 		unsigned int syt;
 		__be32 *buffer;
 		unsigned int pcm_frames = 0;
@@ -771,13 +767,19 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 		cycle = compute_cycle_count(ctx_header[1]);
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
-					  &data_block, &syt, i);
+					  &data_blocks, &dbc, &syt, i);
 		if (err < 0 && err != -EAGAIN)
 			break;
+
 		if (err >= 0) {
 			buffer = s->buffer.packets[s->packet_index].buffer;
 			pcm_frames = s->process_data_blocks(s, buffer,
-							    data_block, &syt);
+							    data_blocks, &syt);
+
+			if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
+				s->data_block_counter =
+						(dbc + data_blocks) & 0xff;
+			}
 		}
 
 		if (queue_in_packet(s, &params) < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
