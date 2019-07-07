Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE50614E7
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EA81694;
	Sun,  7 Jul 2019 14:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EA81694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501642;
	bh=PPND+F+C+xhcOs/jZZLFjLlOUQs7yNhEfYK3HZY/sJQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nuZHTp8z8+VTqPqkwBgvv7xWo5LTlLPnNdoIbCRk7j1AHJ6TPw8bC9/i5OiZJhwjo
	 zgpCUTTSDOI8+YjSpLalfOP10RsV+F7YM2rarSNU6WPr7RJND/TKBWWvk4xZZ1VRzQ
	 QUjRrYifWYuPAhGJc5A6y/lYE5Pl/pfjBIkFPycU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A7BF80323;
	Sun,  7 Jul 2019 14:08:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9788DF802A0; Sun,  7 Jul 2019 14:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6824F8026F
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6824F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HGZJDVxl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TlHwJ87C"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 243C842E;
 Sun,  7 Jul 2019 08:08:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=02Fn3vNKMMVYe
 l+dq5B4aP+zXfxIaA7shVrHQr/myz4=; b=HGZJDVxltsBi1gTwy8ND/3tHfcOpo
 PhJULM70eu9+nvY/pFPl07KIszx5l/HnTT8OqgNwyl8swLgq0Go2Ye8sdnIgCNsK
 LrmDaBQX8mML6mvDXdCFNPoPLkcJbc8w2s3lCGAmvL2NTDBe2zZu5RHUgBPey4ih
 XkfnBW9lwrOPCE0/SENcha7sgBXSkjLo7dl/pE0Q0FsStW59y6u60tnSWN+dhIsQ
 7S54zW28QgVhB/wZvMWKnm7sxLzRPDyWs8SQUDMVdDhau1PDG0TeGWXIyM+6Zwka
 njkU6QeHRIDy83fpitlFqEzyCNzZ8guNv05ThdaG8Uj3p3hy2iV8j4MVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=02Fn3vNKMMVYel+dq5B4aP+zXfxIaA7shVrHQr/myz4=; b=TlHwJ87C
 5LeCtOGRd02AGvZPAQZ88z5WF0HuaYOok5pnAzOa7EVmote0dmVXWwklv8pKIpTc
 /MEDIN8FnplhS8bGEFsC2boZzh+yRxy9+zmQOHuuZYbVzjlTpyQ0zz0zbm3QuKN9
 MQjPEb5y87ayPQd8LIyo7LU/6IYf93Qg2Aav/PdVoP6sP8Rum/vv4e3qh9zGcht/
 4caSb2yInjiTSxfb5sxbahpXOeQVarjrMiDEil/1a6lxJXBAC++FrkmczJVKHVXg
 FiSJi/yKFJetdzI2ycjHXiWLeFqylQxObC9qanTwvou/kwl05B32VxMPK9n9woJf
 PeRriYZXQPb83A==
X-ME-Sender: <xms:reAhXYPDVHOKqd5D4N3jal7viiKAlEry1XgTBe2rxXIhC8_T3z3blg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:reAhXZHCU3zPv0RdH9B4xZ1_pOjU6pSf7HLhXt7Y3P1xVpIGY7LQxA>
 <xmx:reAhXUSndl4Uos9_VP9DJ0w9mZz71SWlPOow_tiwXwxD5pbLza9Z3w>
 <xmx:reAhXU1bwQQ7jWvC1zNSLtLpLLm0Ht53WRsbBOdVMEVHyNZD-FSC0Q>
 <xmx:reAhXTnMr_pY1momQR2_aqjMOd3HtPQ5FUroEYq83OA5sWLee6H2cw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5868880059;
 Sun,  7 Jul 2019 08:08:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:58 +0900
Message-Id: <20190707120759.16371-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/7] ALSA: firewire-lib: code refactoring for
	post operation to data block counter
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

As a result of former commits, post operation to data block count for
cases without CIP_DBC_IS_END_EVENT can be done just with
data_block_counter member of amdtp_stream structure.

This commit adds code refactoring to obsolete local variable for
data block counter.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 8c4564a560f6..81af191627db 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -616,9 +616,10 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       const __be32 *ctx_header,
 			       unsigned int *payload_length,
-			       unsigned int *data_blocks, unsigned int *dbc,
-			       unsigned int *syt, unsigned int index)
+			       unsigned int *data_blocks, unsigned int *syt,
+			       unsigned int index)
 {
+	unsigned int dbc;
 	const __be32 *cip_header;
 	int err;
 
@@ -634,7 +635,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = ctx_header + 2;
 		err = check_cip_header(s, cip_header, *payload_length,
-				       data_blocks, dbc, syt);
+				       data_blocks, &dbc, syt);
 		if (err < 0)
 			return err;
 	} else {
@@ -645,12 +646,12 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		*syt = 0;
 
 		if (s->data_block_counter != UINT_MAX)
-			*dbc = s->data_block_counter;
+			dbc = s->data_block_counter;
 		else
-			*dbc = 0;
+			dbc = 0;
 	}
 
-	s->data_block_counter = *dbc;
+	s->data_block_counter = dbc;
 
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
 			   index);
@@ -758,7 +759,6 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		u32 cycle;
 		unsigned int payload_length;
 		unsigned int data_blocks;
-		unsigned int dbc;
 		unsigned int syt;
 		__be32 *buffer;
 		unsigned int pcm_frames = 0;
@@ -768,7 +768,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 		cycle = compute_cycle_count(ctx_header[1]);
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
-					  &data_blocks, &dbc, &syt, i);
+					  &data_blocks, &syt, i);
 		if (err < 0 && err != -EAGAIN)
 			break;
 
@@ -778,8 +778,8 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 							    data_blocks, &syt);
 
 			if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
-				s->data_block_counter =
-						(dbc + data_blocks) & 0xff;
+				s->data_block_counter += data_blocks;
+				s->data_block_counter &= 0xff;
 			}
 		}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
