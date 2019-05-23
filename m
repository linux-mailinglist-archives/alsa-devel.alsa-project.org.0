Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0962128104
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 17:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB8D167D;
	Thu, 23 May 2019 17:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB8D167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558624752;
	bh=qbspKpb0HGer/kftASrSCvVxwdldFHyvdz0Yo1dJvCA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7vn/dxly5EyXhggW38jnVNxrHcpi4IK763CeZNHeOEiXEYtGi51Dy7hygFU8iiqy
	 JnhRLsopwkKi73Hk/IkRe1851z0xi2TL7bdK2U0/UQiuSOy4UmG5JHs5bYf8jJVgMn
	 vIAEHlXP/50cwkFe1AguHRb4XVYlo8MEguWcZVCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3269F89737;
	Thu, 23 May 2019 17:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A94FF8970D; Thu, 23 May 2019 17:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F208F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F208F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QaIoMZrj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="3Dg1/jlK"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BECF37DAB;
 Thu, 23 May 2019 11:14:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 May 2019 11:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=99il51+DrxaeM
 MP7JfK1YyXn8XT8SHbC6PirE6gxxFw=; b=QaIoMZrjm6sT1EWtnLrf3FPwsXAC6
 xmr0Dl8dev/D6uYye7ZeakDemEf0bEsFEx6o4+C4pUqjKJywehxuOVj1aCBaKFdQ
 WuurCu1k1qc6u2DuHmFqFAg5dP3LA7phi83xU2oBPS8E3FnwT8FcZpX2LaMDdoxX
 1ny3bIKWzK/myID8k6hZ5dCrezLY4Sl8F7HUbY00a0bFt5KfI25SmOEmv5zUceOM
 7+NG7YC3p1QUcTIKMKh9O8E5YUW7NfdWhRwk6p4D+arVAagTfGn5XBE+Bl95yZwj
 BxjaHVBdv0RhTQjFr+Yx7UKsTN9jgr7RypnpQ5lTqya7hzJg9774D4ZrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=99il51+DrxaeMMP7JfK1YyXn8XT8SHbC6PirE6gxxFw=; b=3Dg1/jlK
 N6Dfan7CB5ELsDVdH9YlDK6k7oZP5DvowbYtHAKClV+2WmrRQpGGwe+COPCump9o
 H03OZNEbLE0AeqAUqt3RJZf3hFj+coyfGiEObK0pYJVI2rWmGSCz2k3P4IHGKjSS
 4LXkGF2uarQ7W4aFplJVr8kVnGJVaqgXuxEgYyKdFfoNRkBN89J60LFYuZp5YHKL
 dfgQw9zcMr2oRLZCw+1xRw9oRVJZ3CiZKs5++mp1yvOsZM9aWMiGt7L8TOV3OCFI
 MpCrn81cfjy27D74ffurU7bF83ykpZFoSvconlnL+rUTP5YfjQcfUkGqMcyGUyPH
 OxlGYsUPoCgWMQ==
X-ME-Sender: <xms:67jmXJEpHde5EfKilY9lSNY6dDMl5is0vCP3lpgN3iWSGoD0zjEJIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:67jmXIXnDvAuBktYh3-WX7IWXfdn2Ft9R9vs8QPUiu2n_BvPDAy4rw>
 <xmx:67jmXFMQyAHMFxwI6h7Deij58x4BZAp9vgTJF-YwZ5NXqDPsj5PPlw>
 <xmx:67jmXA1bn6FNtx35AJX8O37bo2X4QQZMCpZCTK1gE2KawXtK_l1fyA>
 <xmx:67jmXK6X4yx4AGfhHe7V3sXzSjGfHjZJuONiv0Mek1tM5X40QMGvxA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DB35380088;
 Thu, 23 May 2019 11:14:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 00:14:40 +0900
Message-Id: <20190523151440.5127-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/4] ALSA: firewire-lib: use 8 byte packet
	header for IT context to separate CIP header from CIP payload
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

In Linux firewire subsystem, for IT context, some quadlets of isochronous
packet payload can be indicated as a part of packet header to queue to
the context.

This commit uses the packet header to split CIP headers from CIP
payload. As a result, regardless of CIP or non-CIP, context payload
includes data blocks only.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 63 +++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e813d31ff2ad..791efa5585c2 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -62,6 +62,9 @@
 #define IR_CTX_HEADER_SIZE_NO_CIP	8
 #define HEADER_TSTAMP_MASK	0x0000ffff
 
+#define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
+#define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
+
 static void pcm_period_tasklet(unsigned long data);
 
 /**
@@ -452,13 +455,10 @@ static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *params)
 }
 
 static inline int queue_out_packet(struct amdtp_stream *s,
-				   struct fw_iso_packet *params,
-				   unsigned int payload_length)
+				   struct fw_iso_packet *params)
 {
-	// No header for this packet.
-	params->header_length = 0;
-	params->payload_length = payload_length;
-	params->skip = !!(payload_length == 0);
+	params->skip =
+		!!(params->header_length == 0 && params->payload_length == 0);
 	return queue_packet(s, params);
 }
 
@@ -491,41 +491,41 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 {
 	unsigned int syt;
 	unsigned int data_blocks;
-	unsigned int payload_length;
 	__be32 *cip_header;
 	unsigned int pcm_frames;
 	struct snd_pcm_substream *pcm;
-	struct fw_iso_packet params = {0};
+	struct {
+		struct fw_iso_packet params;
+		__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
+	} template = { {0}, {0} };
 
 	syt = calculate_syt(s, cycle);
 	data_blocks = calculate_data_blocks(s, syt);
-
-	payload_length = data_blocks * sizeof(__be32) * s->data_block_quadlets;
-	if (!(s->flags & CIP_NO_HEADER)) {
-		cip_header = buffer;
-		buffer += 2;
-		payload_length += 2 * sizeof(__be32);
-	} else {
-		cip_header = NULL;
-	}
-
 	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
 
 	if (s->flags & CIP_DBC_IS_END_EVENT)
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
 
-	if (cip_header)
+	if (!(s->flags & CIP_NO_HEADER)) {
+		cip_header = (__be32 *)template.params.header;
 		generate_cip_header(s, cip_header, syt);
+		template.params.header_length = 2 * sizeof(__be32);
+	} else {
+		cip_header = NULL;
+	}
 
 	if (!(s->flags & CIP_DBC_IS_END_EVENT))
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
 
-	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
-			   index);
+	template.params.payload_length =
+			data_blocks * sizeof(__be32) * s->data_block_quadlets;
+
+	trace_amdtp_packet(s, cycle, cip_header, template.params.payload_length,
+			   data_blocks, index);
 
-	if (queue_out_packet(s, &params, payload_length) < 0)
+	if (queue_out_packet(s, &template.params) < 0)
 		return -EIO;
 
 	pcm = READ_ONCE(s->pcm);
@@ -878,14 +878,18 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 			ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
 		else
 			ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
+
+		max_ctx_payload_size = amdtp_stream_get_max_payload(s) -
+				       ctx_header_size;
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
 		ctx_header_size = 0;	// No effect for IT context.
-	}
 
-	max_ctx_payload_size = amdtp_stream_get_max_payload(s) -
-			       ctx_header_size;
+		max_ctx_payload_size = amdtp_stream_get_max_payload(s);
+		if (!(s->flags & CIP_NO_HEADER))
+			max_ctx_payload_size -= IT_PKT_HEADER_SIZE_CIP;
+	}
 
 	err = iso_packets_buffer_init(&s->buffer, s->unit, QUEUE_LENGTH,
 				      max_ctx_payload_size, dir);
@@ -918,10 +922,13 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	s->packet_index = 0;
 	do {
 		struct fw_iso_packet params;
-		if (s->direction == AMDTP_IN_STREAM)
+		if (s->direction == AMDTP_IN_STREAM) {
 			err = queue_in_packet(s, &params);
-		else
-			err = queue_out_packet(s, &params, 0);
+		} else {
+			params.header_length = 0;
+			params.payload_length = 0;
+			err = queue_out_packet(s, &params);
+		}
 		if (err < 0)
 			goto err_context;
 	} while (s->packet_index > 0);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
