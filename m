Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 451AA6F804
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46C51717;
	Mon, 22 Jul 2019 05:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46C51717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766872;
	bh=C8mH6jGveKuJoSNvVRSfOUOnFOwTQFlI5fcU+HZIwOM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/LWNJq2xksb37ENyEqhuf5KWtqGUq0UxULVCiTgMl/x+tI4SbnNGh8SvTAMeoSfe
	 iDA1rMEAGgrjMvp1+FQDFJAbOzlnV+R23myVzCb37An79zmjvaMhB4exB12/fVepSr
	 +lOcvyj/5inz56ZPds8Ie6Zsj2CkxzB0QfJUxR9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D858F804CB;
	Mon, 22 Jul 2019 05:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A222F80481; Mon, 22 Jul 2019 05:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E41BF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E41BF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="o+Umztm1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Y8RQ3Xtc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 29D7F21E92;
 Sun, 21 Jul 2019 23:37:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=rnjTJuulvayZI
 TnnGRSrHshGDy0meo3d6BbNtfOa4L0=; b=o+Umztm15UKKELXEju+n/G5Yh92oK
 fbtcVEQ5GuUU+3cibdUK+U2+8d3tMh3nWsi0iAy8DMgqlLFRnRL052fCxCigKH1q
 tz2cztwTjliyjPhIYzkkxeZfM1kaXNUrDmEOdneEtDL7p6TuK6saSH1XQILvbWG3
 WyDYWnRxS/wDrSWXsOahYuV/VXawzmkVMesGvNGSrNU1KoGnnrxQ4iAJ+LMoAJBz
 pAqZLnFdTnSpn1Hwz6OraTG4/zFyr+6dqH9QyhebakFFP65f6i2EelUW41hx+KJM
 wNZRPXGIe/OyC16JgW+BaYppWJZsWUQQGPWMiEE3FhVzsYNyWuNflrr8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rnjTJuulvayZITnnGRSrHshGDy0meo3d6BbNtfOa4L0=; b=Y8RQ3Xtc
 2wVSkLdtvKnwtosEq2NHWSGmEjokttAyuMuIpU2lIcD78M+3X/UrYsjSpG/nXJaZ
 RNvkeKI1vb8gwHYzEPu4T5pVU/2XGn5/aG8PieNw0BWoRQhs83ek2xTAKNSdeSXv
 xj4VwEZV6OE1H0xjgliwd4OL6VzsWu2i/7GCT2qKOn9skfb2izR0RQKyzgjzRPK2
 jVhbyQSthqQdrp7p96jUZUrNP/ztPbUP3n7f+XzasmeseDAS/OEpFtXFto6u/3oH
 FQ0j+qK7LoYO1LE1dgX+EE2mogpt36eq/sh1TEQPfE2sJj7OanPMXXN5OYXzNKn9
 USx5xU/8DIfonA==
X-ME-Sender: <xms:cS81XaohCCKADYVHaOSuXhBZt71mePZW-U3e9tzTrwWX15YvBu4v2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ci81XToiSbKF-ZphooPkFZ2TV07WPvEm7sgUPu_1_uqvvScNTr2FwA>
 <xmx:ci81XV0BJEYeCXQBWrD8iWjWvllFrJyE0oOAi2MD1Ce3l5YGq6QJTw>
 <xmx:ci81XXg0kx13EzGRDD4n-PHyqxo8T2fBcsBlZMY2ngu8FGWH-6bdLA>
 <xmx:ci81XbxQ1IiTm1Xvf6WdwgBXV2SmxCp59SHHOXK5lX2pWCH8ZNKmHA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA1FF80060;
 Sun, 21 Jul 2019 23:37:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:54 +0900
Message-Id: <20190722033710.28107-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/20] ALSA: firewire-lib: operate data block
	counter in top level of processing for IT context
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

In ALSA IEC 61883-1/6 packet streaming engine, two types of data block
counter are supported. This commit applies code refactoring to make it
explicitly for IT context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 39 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 40de9fc9d751..c89083ccd729 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -473,12 +473,12 @@ static inline int queue_in_packet(struct amdtp_stream *s,
 }
 
 static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
-				unsigned int syt)
+			unsigned int data_block_counter, unsigned int syt)
 {
 	cip_header[0] = cpu_to_be32(READ_ONCE(s->source_node_id_field) |
 				(s->data_block_quadlets << CIP_DBS_SHIFT) |
 				((s->sph << CIP_SPH_SHIFT) & CIP_SPH_MASK) |
-				s->data_block_counter);
+				data_block_counter);
 	cip_header[1] = cpu_to_be32(CIP_EOH |
 			((s->fmt << CIP_FMT_SHIFT) & CIP_FMT_MASK) |
 			((s->ctx_data.rx.fdf << CIP_FDF_SHIFT) & CIP_FDF_MASK) |
@@ -487,8 +487,9 @@ static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
 
 static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 				struct fw_iso_packet *params,
-				unsigned int data_blocks, unsigned int syt,
-				unsigned int index)
+				unsigned int data_blocks,
+				unsigned int data_block_counter,
+				unsigned int syt, unsigned int index)
 {
 	unsigned int payload_length;
 	__be32 *cip_header;
@@ -496,14 +497,9 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 	payload_length = data_blocks * sizeof(__be32) * s->data_block_quadlets;
 	params->payload_length = payload_length;
 
-	if (s->flags & CIP_DBC_IS_END_EVENT) {
-		s->data_block_counter =
-				(s->data_block_counter + data_blocks) & 0xff;
-	}
-
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = (__be32 *)params->header;
-		generate_cip_header(s, cip_header, syt);
+		generate_cip_header(s, cip_header, data_block_counter, syt);
 		params->header_length = 2 * sizeof(__be32);
 		payload_length += params->header_length;
 	} else {
@@ -511,12 +507,7 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
-			   s->data_block_counter, index);
-
-	if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
-		s->data_block_counter =
-				(s->data_block_counter + data_blocks) & 0xff;
-	}
+			   data_block_counter, index);
 }
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
@@ -709,6 +700,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		u32 cycle;
 		unsigned int syt;
 		unsigned int data_blocks;
+		unsigned int dbc;
 		__be32 *buffer;
 		unsigned int pcm_frames;
 		struct {
@@ -721,11 +713,20 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		syt = calculate_syt(s, cycle);
 		data_blocks = calculate_data_blocks(s, syt);
 		buffer = s->buffer.packets[s->packet_index].buffer;
-		pcm_frames = s->process_data_blocks(s, buffer, data_blocks,
-						s->data_block_counter, &syt);
+		dbc = s->data_block_counter;
+		pcm_frames = s->process_data_blocks(s, buffer, data_blocks, dbc,
+						    &syt);
+
+		if (s->flags & CIP_DBC_IS_END_EVENT)
+			dbc = (dbc + data_blocks) & 0xff;
 
 		build_it_pkt_header(s, cycle, &template.params, data_blocks,
-				    syt, i);
+				    dbc, syt, i);
+
+		if (!(s->flags & CIP_DBC_IS_END_EVENT))
+			dbc = (dbc + data_blocks) & 0xff;
+
+		s->data_block_counter = dbc;
 
 		if (queue_out_packet(s, &template.params) < 0) {
 			cancel_stream(s);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
