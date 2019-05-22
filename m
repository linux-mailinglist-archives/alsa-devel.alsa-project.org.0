Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77826594
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE974166E;
	Wed, 22 May 2019 16:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE974166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534784;
	bh=Wemk8u/h2O+N+ae2LwCjE7DbPvweONw7RikaCSQrDl8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZWGPnNJtmLvgk7EKP6leDqDl893WqGeOu7bRT0eY2vKeFNmfI/LTTiLhA9P2Qzi3
	 HEc/xBvc91KnxdPG+SWUowXLRX+Xf+54gKVTCo/2H25BU+EJjx2AYMC8Gir8Wkluxo
	 81pUNvmm20Gf6KcsDgGbIWAQ08CNXFNlriYHkkGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BF4F8962F;
	Wed, 22 May 2019 16:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0436DF89633; Wed, 22 May 2019 16:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B44FCF89625
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44FCF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hs9jjTVU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gDc5M0ef"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 62FE820D84;
 Wed, 22 May 2019 10:17:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BP3RnOVvzDAPX
 S9sXOKCsA+Y17czRf2MQDDYTpqAysQ=; b=hs9jjTVUeVl6Xqd2xo2rwdl/Vh132
 DDu1yCcx8DmuhTrHI7ke54whk+Dy4ZygVqUMpIBuj9D/1ti5tpAl/8qdrlY49h48
 FuSOF0F7+yx7OgprROlmS6WqDaoPR3TrwGPUXUv24HcrE+kV4DwRpyv4NnikqbNK
 JuS7kpX2qAO0waIXe/Y9C162DwfJATqQtmDRoHW7sPgmDfnOjw8P6YMujHunM+xf
 LtLUxk6ijrlol42SZ+OKIjs2mdC82srI/OBsAQAe0IPEa3uEBvzDXQnbkcNkJeOS
 79WAwJgE/uIu31iKj/kpctk325WUMw70ZwV5E3R1QvuBFOexwcfk4Z7aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BP3RnOVvzDAPXS9sXOKCsA+Y17czRf2MQDDYTpqAysQ=; b=gDc5M0ef
 5CZvjIGfA1TZ6C+cHpsWfoA0+6+pDZx6fZDJH5ANJPqM5qHiRC5Pcs2flkH7+OJP
 XzNLQHyLoJzJoKpNZklzMFqTKCOKN1E4rXadkUviAHDxxdPjqGYrOhBGhIfohZj5
 pP3lvnj9UVAgeQOd7zGzrCbTvYH/1e89ibgZVZ1/xxo+ZNjtwJr24SHM5ExnLSJ4
 Df127MfpSGWApVC/b+I2yjpTRmdvCc5IzBz6K3uzDMpDh0zNJcKZALybZghzR9oS
 Pz87eR+7ZUyLoVxn6DQ28XK5owLkDHDA6IK3A53j2+353Q/N0k7KxTt/IacYQjsg
 4wsXu4C8vzLl/w==
X-ME-Sender: <xms:7FnlXG1kh1PPt07Pkqm4Gss7GzVa4GIqgzeOaJYgeMbl4AqM_EdVhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:7FnlXFadBhHbChfj0kmLxWR-nlbgPlulZUu0dM05IMCqjmZo2iRDAg>
 <xmx:7FnlXBpLc9-LWX5XfglV1L1sPSZi5uWgIhlggWUSxDn7qths37H2aQ>
 <xmx:7FnlXJr1G1odLGWoAf2nxBofNT9VsUuDZ8f4xD2dah5r96yzzUO-bA>
 <xmx:7FnlXNHjqPzJhixEKS00psrtTMxbsF8EZ4zeJiLmUvyHpaf7lMpOTQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D98F7380086;
 Wed, 22 May 2019 10:17:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:04 +0900
Message-Id: <20190522141708.29159-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/6] ALSA: firewire-lib: calculate the length
	of packet payload in packet handler
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

In current packet handler, the length of payload is given as an argument
of callback function, however this value is just required to process
payload of transferred isoc packet, thus just for IR context.

This commit replaces the argument for payload of packet with the
argument of context header. As a result, the length of payload is
computed in packet handler for IR context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 49 ++++++++++++++++-------------------
 sound/firewire/amdtp-stream.h |  5 ++--
 2 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 020edf2b1726..4584525a7f30 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -474,14 +474,14 @@ static inline int queue_in_packet(struct amdtp_stream *s)
 	return queue_packet(s, s->ctx_data.tx.max_payload_length);
 }
 
-static int handle_out_packet(struct amdtp_stream *s,
-			     unsigned int payload_length, unsigned int cycle,
-			     unsigned int index)
+static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
+			     const __be32 *ctx_header, unsigned int index)
 {
 	__be32 *buffer;
 	unsigned int syt;
 	unsigned int data_blocks;
 	unsigned int pcm_frames;
+	unsigned int payload_length;
 	struct snd_pcm_substream *pcm;
 
 	buffer = s->buffer.packets[s->packet_index].buffer;
@@ -521,13 +521,14 @@ static int handle_out_packet(struct amdtp_stream *s,
 }
 
 static int handle_out_packet_without_header(struct amdtp_stream *s,
-			unsigned int payload_length, unsigned int cycle,
-			unsigned int index)
+				unsigned int cycle, const __be32 *ctx_header,
+				unsigned int index)
 {
 	__be32 *buffer;
 	unsigned int syt;
 	unsigned int data_blocks;
 	unsigned int pcm_frames;
+	unsigned int payload_length;
 	struct snd_pcm_substream *pcm;
 
 	buffer = s->buffer.packets[s->packet_index].buffer;
@@ -551,11 +552,11 @@ static int handle_out_packet_without_header(struct amdtp_stream *s,
 	return 0;
 }
 
-static int handle_in_packet(struct amdtp_stream *s,
-			    unsigned int payload_length, unsigned int cycle,
-			    unsigned int index)
+static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
+			    const __be32 *ctx_header, unsigned int index)
 {
 	__be32 *buffer;
+	unsigned int payload_length;
 	u32 cip_header[2];
 	unsigned int sph, fmt, fdf, syt;
 	unsigned int data_block_quadlets, data_block_counter, dbc_interval;
@@ -564,6 +565,14 @@ static int handle_in_packet(struct amdtp_stream *s,
 	unsigned int pcm_frames;
 	bool lost;
 
+	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
+	if (payload_length > s->ctx_data.tx.max_payload_length) {
+		dev_err(&s->unit->device,
+			"Detect jumbo payload: %04x %04x\n",
+			payload_length, s->ctx_data.tx.max_payload_length);
+		return -EIO;
+	}
+
 	buffer = s->buffer.packets[s->packet_index].buffer;
 	cip_header[0] = be32_to_cpu(buffer[0]);
 	cip_header[1] = be32_to_cpu(buffer[1]);
@@ -668,14 +677,16 @@ static int handle_in_packet(struct amdtp_stream *s,
 }
 
 static int handle_in_packet_without_header(struct amdtp_stream *s,
-			unsigned int payload_length, unsigned int cycle,
-			unsigned int index)
+				unsigned int cycle, const __be32 *ctx_header,
+				unsigned int index)
 {
 	__be32 *buffer;
+	unsigned int payload_length;
 	unsigned int data_blocks;
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
 
+	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
 	buffer = s->buffer.packets[s->packet_index].buffer;
 	data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
 
@@ -745,7 +756,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 		cycle = compute_it_cycle(*ctx_header);
 
-		if (s->handle_packet(s, 0, cycle, i) < 0) {
+		if (s->handle_packet(s, cycle, ctx_header, i) < 0) {
 			cancel_stream(s);
 			return;
 		}
@@ -762,7 +773,6 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	unsigned int i, packets;
-	unsigned int payload_length, max_payload_length;
 	__be32 *ctx_header = header;
 
 	if (s->packet_index < 0)
@@ -771,25 +781,12 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	// The number of packets in buffer.
 	packets = header_length / s->ctx_data.tx.ctx_header_size;
 
-	/* For buffer-over-run prevention. */
-	max_payload_length = s->ctx_data.tx.max_payload_length;
-
 	for (i = 0; i < packets; i++) {
-		u32 iso_header = be32_to_cpu(ctx_header[0]);
 		u32 cycle;
 
 		cycle = compute_cycle_count(ctx_header[1]);
 
-		/* The number of bytes in this packet */
-		payload_length = iso_header >> ISO_DATA_LENGTH_SHIFT;
-		if (payload_length > max_payload_length) {
-			dev_err(&s->unit->device,
-				"Detect jumbo payload: %04x %04x\n",
-				payload_length, max_payload_length);
-			break;
-		}
-
-		if (s->handle_packet(s, payload_length, cycle, i) < 0)
+		if (s->handle_packet(s, cycle, ctx_header, i) < 0)
 			break;
 
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 1945ef59ab92..d317fdc6ab5f 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -108,9 +108,8 @@ struct amdtp_stream {
 	struct iso_packets_buffer buffer;
 	int packet_index;
 	int tag;
-	int (*handle_packet)(struct amdtp_stream *s,
-			unsigned int payload_quadlets, unsigned int cycle,
-			unsigned int index);
+	int (*handle_packet)(struct amdtp_stream *s, unsigned int cycle,
+			     const __be32 *ctx_header, unsigned int index);
 	union {
 		struct {
 			unsigned int ctx_header_size;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
