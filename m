Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08C26598
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E5F1664;
	Wed, 22 May 2019 16:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E5F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534899;
	bh=/wIRlsJ+fEEItQvnH/DOXO8XGHoeUGStT2G1YYnQMzM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uypsE9Iq8prIRrnq0BjDAQHJYMRThBjNBS/fMb/CKtqBqI75vOV3IBYmouC6cJtbg
	 JtBz3pk1NW0B7aLbpt2pocq1AfsAi0GVDsytSO2nHFkJdjTdcCnbntoUBVbW/RAPIo
	 o7OVhBp9lL5MO/VJvlDkVXwhbMHclZXfIiZXEeTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD15F89734;
	Wed, 22 May 2019 16:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A23F8972A; Wed, 22 May 2019 16:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E524FF8963E
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E524FF8963E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Qxs0rhPT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="1kpXsbAi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0995920D84;
 Wed, 22 May 2019 10:17:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zs0V63y5ka9Q9
 zGBPmPSxQ3+e+Vi3JJoEhV/irZgFXw=; b=Qxs0rhPTFMmycIX2XTjsp2IRBo8HL
 1NgFeSQETDyolIPEeAPgxmAA8GujhAqH+fulPbk4RxOtqF7h35/lXG5lcOfZn4rT
 W8LCZ5GzVW36V8/q5jWNcR+xBF0xSrSIz04UMOnzC4lKpIZY/B+1n6aEqcDLWpef
 w23b4IJAiq86QlUOCbSwqG6l9tAlX5ALTA0Rty9dXDI3QVHims8cVu1QmwXGAQN9
 fJDHUqw7SG8aOsSgPyz8TLH7KGY8id3jPCb7muVUFYw89enM0XVrn1txl9HtN16D
 vq4Gg6WCQYnZQhCQQqgyTpDuvDsqE6kPizjmi6Jg+Dfdc5BgNsX3ZjP9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zs0V63y5ka9Q9zGBPmPSxQ3+e+Vi3JJoEhV/irZgFXw=; b=1kpXsbAi
 H5G87KRQ2JSYeSDC0rHGDSrRdNqKX7/TKgg2czVgysekv7dF43SIYHAV9kK+/yEe
 kq+yodbMaB2ieDS1sRmbERBLK6HgtUxb4zSkst5P9LOss49MoEtSlOAWT1LCX4Um
 Rg/ZPGh3KVo+gUFhoKjkXrKaTiCU0pMH2cuvtED0vgNni0ob/yTqNUPO8efoGh1D
 AuGBkNQDumk+/uZClOolayluA4sIHUOkeL5JCX69eGmZsjI2GH9CQVRVqzZPT4ww
 ZlbBORw5t5Q1ITMSuUwfZsVlpf+vpOnf7XYywuz865o5cSzprCahFUVwT2Xm5C6L
 gzasy4itA4rilA==
X-ME-Sender: <xms:8FnlXLJ0xs9ML19N8h-b7I55b60a8FbXnl-OI-lCJDwRv2nP0g0NuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:8FnlXLdl8WFDa1jwhcHOIfj5d6r5BY8xehja7WfcLi-iQKnVfa8gKg>
 <xmx:8FnlXFVb1MVq8kWu_5DDfzp_HuHzvMnyQB5Uf_WMzBNqL_I8EjIDww>
 <xmx:8FnlXBgAGje1t_RxYSn-bNSbsO3BeCxaU2qNiURvYNd7rUIzZK_j-w>
 <xmx:8FnlXGkt7BVoGN3HYn6KWHdWyyU9y2MStuAM1J7O-dfrTbDHHvModA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98ADC380087;
 Wed, 22 May 2019 10:17:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:07 +0900
Message-Id: <20190522141708.29159-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/6] ALSA: firewire-lib: use 16 bytes IR
	context header to separate CIP header
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

In IR context, some quadlets of packet payload can be included into
context header. This is good for packet with CIP header because the
context payload buffer can includes data blocks only for with-CIP and
without-CIP pakets.

This commit uses 16 bytes IR context header for this purpose.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 37 ++++++++++++++++++++++++-----------
 sound/firewire/amdtp-stream.h |  2 +-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e9976a877944..fa99210f5a48 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -56,7 +56,10 @@
 #define INTERRUPT_INTERVAL	16
 #define QUEUE_LENGTH		48
 
-#define IR_HEADER_SIZE		8	// For header and timestamp.
+// For iso header, tstamp and 2 CIP header.
+#define IR_CTX_HEADER_SIZE_CIP		16
+// For iso header and tstamp.
+#define IR_CTX_HEADER_SIZE_NO_CIP	8
 #define HEADER_TSTAMP_MASK	0x0000ffff
 
 static void pcm_period_tasklet(unsigned long data);
@@ -471,7 +474,7 @@ static inline int queue_out_packet(struct amdtp_stream *s,
 
 static inline int queue_in_packet(struct amdtp_stream *s)
 {
-	return queue_packet(s, s->ctx_data.tx.max_payload_length);
+	return queue_packet(s, s->ctx_data.tx.max_ctx_payload_length);
 }
 
 static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
@@ -656,6 +659,7 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 			    unsigned int index)
 {
 	unsigned int payload_length;
+	const __be32 *cip_header;
 	unsigned int syt;
 	unsigned int data_blocks;
 	struct snd_pcm_substream *pcm;
@@ -663,14 +667,17 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 	int err;
 
 	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
-	if (payload_length > s->ctx_data.tx.max_payload_length) {
+	if (payload_length > s->ctx_data.tx.ctx_header_size +
+					s->ctx_data.tx.max_ctx_payload_length) {
 		dev_err(&s->unit->device,
 			"Detect jumbo payload: %04x %04x\n",
-			payload_length, s->ctx_data.tx.max_payload_length);
+			payload_length, s->ctx_data.tx.max_ctx_payload_length);
 		return -EIO;
 	}
 
-	err = check_cip_header(s, buffer, payload_length, &data_blocks, &syt);
+	cip_header = ctx_header + 2;
+	err = check_cip_header(s, cip_header, payload_length, &data_blocks,
+			       &syt);
 	if (err < 0) {
 		if (err != -EAGAIN)
 			return err;
@@ -678,9 +685,10 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		goto end;
 	}
 
-	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
+	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+			   index);
 
-	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
+	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
 end:
 	if (queue_in_packet(s) < 0)
 		return -EIO;
@@ -883,6 +891,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 		[CIP_SFC_176400] = {  0,   67 },
 	};
 	unsigned int ctx_header_size;
+	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
 	int type, tag, err;
 
@@ -909,14 +918,21 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	if (s->direction == AMDTP_IN_STREAM) {
 		dir = DMA_FROM_DEVICE;
 		type = FW_ISO_CONTEXT_RECEIVE;
-		ctx_header_size = IR_HEADER_SIZE;
+		if (!(s->flags & CIP_NO_HEADER))
+			ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
+		else
+			ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
 		ctx_header_size = 0;	// No effect for IT context.
 	}
+
+	max_ctx_payload_size = amdtp_stream_get_max_payload(s) -
+			       ctx_header_size;
+
 	err = iso_packets_buffer_init(&s->buffer, s->unit, QUEUE_LENGTH,
-				      amdtp_stream_get_max_payload(s), dir);
+				      max_ctx_payload_size, dir);
 	if (err < 0)
 		goto err_unlock;
 
@@ -934,8 +950,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	amdtp_stream_update(s);
 
 	if (s->direction == AMDTP_IN_STREAM) {
-		s->ctx_data.tx.max_payload_length =
-						amdtp_stream_get_max_payload(s);
+		s->ctx_data.tx.max_ctx_payload_length = max_ctx_payload_size;
 		s->ctx_data.tx.ctx_header_size = ctx_header_size;
 	}
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 5aa9683593d2..234483a31df5 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -116,7 +116,7 @@ struct amdtp_stream {
 			unsigned int ctx_header_size;
 
 			// limit for payload of iso packet.
-			unsigned int max_payload_length;
+			unsigned int max_ctx_payload_length;
 
 			// For quirks of CIP headers.
 			// Fixed interval of dbc between previos/current
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
