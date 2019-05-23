Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1AB280CF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 17:18:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE401667;
	Thu, 23 May 2019 17:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE401667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558624680;
	bh=mlRxytvKbxS/lwwkmBml+3uAvYICl5uKTeUVb9GMZ1I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyaO9a+9JBJ0Kpsl+y71cgeKy1IchEaSNGhDyKSdjhUGswNMPApkG3x0fhtUZRXB8
	 /rkZG1/xvEOCVQVLgJhARMpcmGSVGmVUoLGBTNgAOXQbfsuF6qibhSOjwJblBRuJhq
	 k8ECoD2o7ophhnEYPsju7cPrjMwWmHQRwPO4CKgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 907A9F8972D;
	Thu, 23 May 2019 17:15:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9FE4F89709; Thu, 23 May 2019 17:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD783F89670
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD783F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VhxKx3QW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dmH8ZNdB"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F21F437DD4;
 Thu, 23 May 2019 11:14:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 May 2019 11:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=omoFkryS/jHEj
 W9aALbE4VHBB1vfXBzmjgCiOnFFxPs=; b=VhxKx3QWv/3mKR7SiS31KHl+rHhan
 RHeDqXnn3nXsDsYFWvZakWFli/5gMKzLa1YQh3neMUWdFOIvufLrpubm4rR2MEZJ
 It4t6/If0THfFxvaAHzQY9JIpYEc1sy3X9NpgMuFPVz3Aqew+Sro3wWjamEX4IFH
 UTKSqiXAK/EEhyt6C1SWwE8n1gsgGvFogaGtj+5xmtTnyYHjJ+dJPi71dn7+X9Bi
 XuJmlK3gUNLqQxxJl4gnLKwehWMuZ1mQTCd9k0yOX4L/1fPKOihuLP1E4J5EVhmf
 86Lkj4V47mRve5XkWoZFlkdDVfqlfygnX8V25nLfq7PND121qwwHiwiMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=omoFkryS/jHEjW9aALbE4VHBB1vfXBzmjgCiOnFFxPs=; b=dmH8ZNdB
 hHB6jPtnW9CVubmSr/A9FKH7mjenUSewdNiOw0t96OE92hipqcOXVu8yGjylzq0K
 VKiAKahC/b7bwWtSrtTSeEfrcNTkc2CY669o+viCUxsZQDgrfvH41qJ6WR+fDayf
 cz2EvW8rkoMLTcWmTnKZmWcuoDRHZI0W/qOIk4dynhLcYyUkDqKnGdaL8h3KpeOG
 3KrZPlQO0dQgK0WIpryNCee4jFlwpNK58L+95ebTrn7Aa+6T0YXRzq6UpyVe6OT6
 R8kHrb68DXc8Vgpuqa2fkyvq3IHhuxcyAs+/bz64TI9vHji2JAKocltm2imy9+8w
 od/IyEva72kzIQ==
X-ME-Sender: <xms:6bjmXAPJnE7g0aghmZG4emofJVPZkAsaKmVjf00Iu6E_sCDZfSC1Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6bjmXPqVjbAF2GuMDeUYef-yvtQQ4vN9L5D0D8LdSax1YzfbIRQFVA>
 <xmx:6bjmXHMMBWMsC9L5xKP2Ejx6HoQtdOq0CL5LdD5ieWJnxrkT4Eo09A>
 <xmx:6bjmXFOXu7PjmWa7E2kcqUJHjLkaKZ18MoVXwS6wWfZ_c-ab-PCiSg>
 <xmx:6bjmXGi4C4ljRbNixNXUmPaWTMtd6PXlMP8wxwjrRFZyXzsVbazWjg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 932EA380088;
 Thu, 23 May 2019 11:14:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 00:14:39 +0900
Message-Id: <20190523151440.5127-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/4] ALSA: firewire-lib: code refactoring to
	queueing packets
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

This commit is a preparation to queue IT packet with header. To enable
packet handler to fill the header, this commit uses kernel stack for
data structure of packet parameter in several part of this file.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 54 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b11a8d244f89..e813d31ff2ad 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -430,30 +430,15 @@ static void pcm_period_tasklet(unsigned long data)
 		snd_pcm_period_elapsed(pcm);
 }
 
-static int queue_packet(struct amdtp_stream *s, unsigned int payload_length)
+static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *params)
 {
-	struct fw_iso_packet p = {0};
-	int err = 0;
-
-	if (IS_ERR(s->context))
-		goto end;
-
-	p.interrupt = IS_ALIGNED(s->packet_index + 1, INTERRUPT_INTERVAL);
-	p.tag = s->tag;
+	int err;
 
-	if (s->direction == AMDTP_IN_STREAM) {
-		// Queue one packet for IR context.
-		p.header_length = s->ctx_data.tx.ctx_header_size;
-	} else {
-		// No header for this packet.
-		p.header_length = 0;
-	}
+	params->interrupt = IS_ALIGNED(s->packet_index + 1, INTERRUPT_INTERVAL);
+	params->tag = s->tag;
+	params->sy = 0;
 
-	if (payload_length > 0)
-		p.payload_length = payload_length;
-	else
-		p.skip = true;
-	err = fw_iso_context_queue(s->context, &p, &s->buffer.iso_buffer,
+	err = fw_iso_context_queue(s->context, params, &s->buffer.iso_buffer,
 				   s->buffer.packets[s->packet_index].offset);
 	if (err < 0) {
 		dev_err(&s->unit->device, "queueing error: %d\n", err);
@@ -467,14 +452,24 @@ static int queue_packet(struct amdtp_stream *s, unsigned int payload_length)
 }
 
 static inline int queue_out_packet(struct amdtp_stream *s,
+				   struct fw_iso_packet *params,
 				   unsigned int payload_length)
 {
-	return queue_packet(s, payload_length);
+	// No header for this packet.
+	params->header_length = 0;
+	params->payload_length = payload_length;
+	params->skip = !!(payload_length == 0);
+	return queue_packet(s, params);
 }
 
-static inline int queue_in_packet(struct amdtp_stream *s)
+static inline int queue_in_packet(struct amdtp_stream *s,
+				  struct fw_iso_packet *params)
 {
-	return queue_packet(s, s->ctx_data.tx.max_ctx_payload_length);
+	// Queue one packet for IR context.
+	params->header_length = s->ctx_data.tx.ctx_header_size;
+	params->payload_length = s->ctx_data.tx.max_ctx_payload_length;
+	params->skip = false;
+	return queue_packet(s, params);
 }
 
 static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
@@ -500,6 +495,7 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 	__be32 *cip_header;
 	unsigned int pcm_frames;
 	struct snd_pcm_substream *pcm;
+	struct fw_iso_packet params = {0};
 
 	syt = calculate_syt(s, cycle);
 	data_blocks = calculate_data_blocks(s, syt);
@@ -529,7 +525,7 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
 			   index);
 
-	if (queue_out_packet(s, payload_length) < 0)
+	if (queue_out_packet(s, &params, payload_length) < 0)
 		return -EIO;
 
 	pcm = READ_ONCE(s->pcm);
@@ -651,6 +647,7 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 	unsigned int data_blocks;
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
+	struct fw_iso_packet params = {0};
 	int err;
 
 	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
@@ -684,7 +681,7 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 
 	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
 end:
-	if (queue_in_packet(s) < 0)
+	if (queue_in_packet(s, &params) < 0)
 		return -EIO;
 
 	pcm = READ_ONCE(s->pcm);
@@ -920,10 +917,11 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 
 	s->packet_index = 0;
 	do {
+		struct fw_iso_packet params;
 		if (s->direction == AMDTP_IN_STREAM)
-			err = queue_in_packet(s);
+			err = queue_in_packet(s, &params);
 		else
-			err = queue_out_packet(s, 0);
+			err = queue_out_packet(s, &params, 0);
 		if (err < 0)
 			goto err_context;
 	} while (s->packet_index > 0);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
