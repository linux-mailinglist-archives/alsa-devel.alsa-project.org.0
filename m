Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBB253A5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 17:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB72B167D;
	Tue, 21 May 2019 17:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB72B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558451901;
	bh=SnLOujIymvP7Q/7K05nfgxRudHS45Oo1QZQOgSkbvmY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ts4p80MuTr4I0iGsqSME1wwUNGpING/03KaLODq/U7T9myS350C3Ww02OCoN+1Sh/
	 4tZSZ5Olx5qNGLeuiwS3rx1muE89Ah8929h8RQF46RHXW2wkKyZVFD+Cb36RxBX1w1
	 KvHMhpxtDqlM2twyoh0wl8ulvaTwni+UQyVRh/Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DFCF8079B;
	Tue, 21 May 2019 17:16:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08CB2F89670; Tue, 21 May 2019 17:07:58 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C81F89715
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C81F89715
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jr9IIHum"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PQqqDapD"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 008DC24384;
 Tue, 21 May 2019 10:57:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 21 May 2019 10:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/XKfkql/+woDI
 eab442yarTBWSPdraWHDjicXCXZtfY=; b=jr9IIHumRGHjIVh4HEJRyyX+UdjRK
 1Xz9d9BLLAiqRWEsRvuQKpmpnfRi0GgdWwwMHg9uuT5ZR8mvEmFyuf7/qL+a02Jy
 d+TJwXNujm9rKaNF1eqf4jXccwTEhlyr18MSgFrCHVyq3XZHc5GPe4rb75OZAukH
 dbRw61OurVTNwVtXe1PB5seaznk0aA7jmaE987zcz6VUfqNisVSJLXYNqfPmrCnV
 kDAhv7vZqATO+AwzZ23LWBOoZQ3X0vd6ed0xa25+Hvx7c6gulk5LDyl1v/IHEURB
 Ck1M6HsbObuiqiwJmGLDIb3tU7+Cr5DhtCpDFTKX9WTw01oSxyuz4ilVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/XKfkql/+woDIeab442yarTBWSPdraWHDjicXCXZtfY=; b=PQqqDapD
 jjxiUGUQYXrJnXeY72KIJXT0Yu/UHRru8QQloL7RZ2XIjoenIF5DbYLa5UcIyAl8
 KL1PTNA7bEorFCMAiy8h+4GoF9NuMQyNuRC8W+vftolkTBrQ9UDksFolJP90596T
 mlxW+Z580yWVChy7moe9B72/5dBKbMkicW3co51v6bymmvTmzjnZNtWPBUucyXjN
 O8QeBa4GQIAbaPBD+zeQvXKoJH0HsGzKaNGuqRzTTGwTX7zhtmPdoo+pmCrA4pDH
 ZeDFBclFVSMoykcBFW0Ch2beg50itz/dtlORSxjVZVQOdh/yRDErOXdHkg3kGcIH
 jB0rK1Ia8UzYmQ==
X-ME-Sender: <xms:6xHkXIxcy8XrCnGAuFk7Q-Lm3yMlG7bnpY_018gHpxLdnY2pafTEBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6xHkXAs-qfnzsQ7s8k4CY9W5tUSqtCrrmPT6n1sk1NZgMSwRYqCidA>
 <xmx:6xHkXFphKvOQ-bFDFxB0U5IP0cu9_WkiI2BZwklTD_yXjBtgsCZAZw>
 <xmx:6xHkXD37HkqRg-Ouc654gKzJVFC7E1guQDCMjBsDMlGm5RA1hr2JKw>
 <xmx:6xHkXMemiE5A7IVGmZUJ8H3J6uAr2EJXjfzKWyTjTuHrnjM5m_saTg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84602103CF;
 Tue, 21 May 2019 10:57:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 21 May 2019 23:57:36 +0900
Message-Id: <20190521145737.11809-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
References: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/4] ALSA: firewire-lib: obsolete macro for
	header of IT context
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

The header size parameter of 1394 OHCI IT context has no effect.
Besides the header size of queued packet is different from context
header.

This commit cleans codes relevant to these two headers.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ce39cb92a11e..5ebdac2086c0 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -57,7 +57,6 @@
 #define QUEUE_LENGTH		48
 
 #define IR_HEADER_SIZE		8	// For header and timestamp.
-#define OUT_PACKET_HEADER_SIZE	0
 #define HEADER_TSTAMP_MASK	0x0000ffff
 
 static void pcm_period_tasklet(unsigned long data);
@@ -428,8 +427,7 @@ static void pcm_period_tasklet(unsigned long data)
 		snd_pcm_period_elapsed(pcm);
 }
 
-static int queue_packet(struct amdtp_stream *s, unsigned int header_length,
-			unsigned int payload_length)
+static int queue_packet(struct amdtp_stream *s, unsigned int payload_length)
 {
 	struct fw_iso_packet p = {0};
 	int err = 0;
@@ -439,7 +437,15 @@ static int queue_packet(struct amdtp_stream *s, unsigned int header_length,
 
 	p.interrupt = IS_ALIGNED(s->packet_index + 1, INTERRUPT_INTERVAL);
 	p.tag = s->tag;
-	p.header_length = header_length;
+
+	if (s->direction == AMDTP_IN_STREAM) {
+		// Queue one packet for IR context.
+		p.header_length = s->ctx_data.tx.ctx_header_size;
+	} else {
+		// No header for this packet.
+		p.header_length = 0;
+	}
+
 	if (payload_length > 0)
 		p.payload_length = payload_length;
 	else
@@ -460,13 +466,12 @@ static int queue_packet(struct amdtp_stream *s, unsigned int header_length,
 static inline int queue_out_packet(struct amdtp_stream *s,
 				   unsigned int payload_length)
 {
-	return queue_packet(s, OUT_PACKET_HEADER_SIZE, payload_length);
+	return queue_packet(s, payload_length);
 }
 
 static inline int queue_in_packet(struct amdtp_stream *s)
 {
-	return queue_packet(s, s->ctx_data.tx.ctx_header_size,
-			    s->ctx_data.tx.max_payload_length);
+	return queue_packet(s, s->ctx_data.tx.max_payload_length);
 }
 
 static int handle_out_packet(struct amdtp_stream *s,
@@ -888,7 +893,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
-		ctx_header_size = OUT_PACKET_HEADER_SIZE;
+		ctx_header_size = 0;	// No effect for IT context.
 	}
 	err = iso_packets_buffer_init(&s->buffer, s->unit, QUEUE_LENGTH,
 				      amdtp_stream_get_max_payload(s), dir);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
