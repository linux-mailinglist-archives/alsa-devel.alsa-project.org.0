Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81088614DE
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74F0166A;
	Sun,  7 Jul 2019 14:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74F0166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501399;
	bh=IJQa0xs4bI9Z8QNDm5A8G8haqG1AOBjztgslQuKe++I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyQ8vl0/J6htW5ctXpt+ut8jd/QhL2edRvP1T2+YijY3kkW63lOHy6ddLTX18HR+k
	 DVnxQliFzN6z5l5mrgxHOmZU9JJ4coasobp/uB2PUSIT9DMiuIGIgh56FzvQCGlcwQ
	 FoLvWx+FcYLF+0OLVKIIHpVMc6dqEnPRZFoM4cIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 009C1F80214;
	Sun,  7 Jul 2019 14:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6174AF80227; Sun,  7 Jul 2019 14:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D8EF801A4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D8EF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Xl17nWap"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="d1BPhKTo"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 28680435;
 Sun,  7 Jul 2019 08:08:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YkUsHo9ZnuTPM
 AQwNkvXQ3qs3RuMSEKT7srJNbcJKTg=; b=Xl17nWapgDxZv4/g9a7uZcrb/oRRg
 w/otuu2PO+8Bcanss7RqIwgMc3rQz5xYaFeS+ZKAmYDsJ/AvefZBCe8+U8B1fBwC
 gVaVesMSO11al82nVCp6ZkkzvOaWken78ccZrD+9JkIzoV38SOoBFM4GEYTnLvqk
 Kv704yxkDCgtfkYC9reZGHaWsKz2r7CVm6xOWL5FM7KgY/NOxbQ3Dq8IRInweDgd
 CFezS9vOWfHgpdf08u3jNimdmFx3Q7mOLRGzkAGFQkz/S1euY6ReKHVL6lBhGUqN
 yTzOnWowe0pMpfUPxFmWtRR4kbO9V5OnCr7nKMORomxRlixHt72St5zoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YkUsHo9ZnuTPMAQwNkvXQ3qs3RuMSEKT7srJNbcJKTg=; b=d1BPhKTo
 PFRtfLosY3ch7ooIKvRQ/Yk+biYFdwHdBia8XpqillBBUTb2vEpO7iE54bwLpA6l
 DOeuf2AjWksAFGYVW2APhBhAwXWQcY6B47dkVrwA3yL7rL1JoRJhsbDYP5RU4Hsh
 ncxziGkgbQwO5IEN24XbzN/A2EjA5h6tOHJll/ptNNlbCoEZudIposPY50iSMq3x
 14nUIbxD6GXZpSarWFqcT3veaW9HkP27IGKe7I1xwAyfPDDwnTHgtPA19wwBBULX
 rpmVV0/eKsD++gLT8WSWRA4hIF/Pb1m3H3pc2V0gAZumEVZEeKexhcToYW1U079R
 iaR5/4YjSHA3WA==
X-ME-Sender: <xms:peAhXXmnCAHTHImnRGCT86ZfasHkrv7CaQkXuJUj6fl2eTUk8u08Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:peAhXWg9WPy_UjZcktyTylcH-Yzu0J0n5iTpdEjLGqqJbdCD3alefw>
 <xmx:peAhXaGWErW0oiWxMnYqkyf4EjILNaXbhnlKykPoVtn7G1mydK0HPg>
 <xmx:peAhXYugyKIb7Gj8LIrHKwKuR4SODt0C-hsd6_-UhDD9VupOEN1NLg>
 <xmx:peAhXYlcr1bKgvparSQdqzbTN-0vGJV3_4tS_-V6KgAG4LoGX41-Yw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 522A080063;
 Sun,  7 Jul 2019 08:08:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:53 +0900
Message-Id: <20190707120759.16371-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/7] ALSA: firewire-lib: fix invalid length of
	rx packet payload for tracepoint events
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

Although CIP header is handled as context header, the length of isochronous
packet includes two quadlets for its payload. In tracepoints event the
value of payload_quadlets should includes the two quadlets. But at present
it doesn't.

This commit fixes the bug.

Fixes: b18f0cfaf16b ("ALSA: firewire-lib: use 8 byte packet header for IT context to separate CIP header from CIP payload")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 91b890241840..6c9f4d026505 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -490,8 +490,12 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 				unsigned int data_blocks, unsigned int syt,
 				unsigned int index)
 {
+	unsigned int payload_length;
 	__be32 *cip_header;
 
+	payload_length = data_blocks * sizeof(__be32) * s->data_block_quadlets;
+	params->payload_length = payload_length;
+
 	if (s->flags & CIP_DBC_IS_END_EVENT) {
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
@@ -501,6 +505,7 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 		cip_header = (__be32 *)params->header;
 		generate_cip_header(s, cip_header, syt);
 		params->header_length = 2 * sizeof(__be32);
+		payload_length += params->header_length;
 	} else {
 		cip_header = NULL;
 	}
@@ -510,11 +515,8 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 				(s->data_block_counter + data_blocks) & 0xff;
 	}
 
-	params->payload_length =
-			data_blocks * sizeof(__be32) * s->data_block_quadlets;
-
-	trace_amdtp_packet(s, cycle, cip_header, params->payload_length,
-			   data_blocks, index);
+	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+			   index);
 }
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
