Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B806C660BF8
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 03:33:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAFE7A11;
	Sat,  7 Jan 2023 03:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAFE7A11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673058838;
	bh=YeMFqrTfMqSiGsCbfPs2TsmfNMEegM97cc3OQAdO8Gc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EUE9hpT3HTCmk2MKxgFg9NXP3T35C4WEumQTQviiB9oa+/8ZOhRv1oQsAk3p74GRh
	 rJ9TJrf2TI/HV34T2ShHPuCZtivvnel85XB30VIRrAfEpfnlsnduI7wJHwJefQnm2p
	 f78s3/Jaj/qxL7RlGrqSVPqFmgTiR/zAPEbcicz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4816F8022B;
	Sat,  7 Jan 2023 03:32:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AFB7F804AA; Sat,  7 Jan 2023 03:32:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B478F8025A
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 03:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B478F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=c57oWQ5c; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SgoJcJrZ
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C7724320025E;
 Fri,  6 Jan 2023 21:32:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 06 Jan 2023 21:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673058744; x=
 1673145144; bh=i+1onnelWhky5OjFKWD5ibqwB8NGysvFsqMJFJmFKBw=; b=c
 57oWQ5cdDW3eEw3PwMsGceGiGaIobvpkZVerxZdkl4sa3oAvQXeAzhynrTxB/eaQ
 8p3Q0XhQ4P1CstNjaEWLjrVPtQIc4FAQb6z5Z5N4ICdzG+Bzpv15fs5BF64+YctE
 nn2nrh57gU6AA6/ro0MNbWiIAqtEVtrs5MnaN4ibPkt9rQQljnty7wW+VQsr6AyO
 VLAB2Yg3bA7d6swD36nMptTYXWzvY4iozDcU8i5nDnp+o0btb3zeZtXTHFwKbbjh
 hshxh0jeZOfmNGcb80JPJbhJyuEedAWn5gRx4zx9TgeP32QJE2ApQa8eb0KeaTLd
 JTH8oGzSZhOuNiHpaZwSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1673058744; x=1673145144; bh=i+1onnelWhky5
 OjFKWD5ibqwB8NGysvFsqMJFJmFKBw=; b=SgoJcJrZr/HEDTYRdFJYdiDu3ElsI
 YwFC9cfIgliRlwFUPlaDq4wDfvJwHAs/ShxOOl+lJpo1gbW8h+f0/LBVR93NLVuZ
 QmF3PZ3jXcWQcG4TSwFy9OG1qDqyEF9+1d0LkwPvJAtN5uMglfpK6hDq6g317ENu
 6IBAtcQwD8kgUPY7cMLEU0B+6L+rBIIPu9/wPar9km0RxjC387T6pBqitzLrwdca
 FLZeR0o63quijMlMZp9Ybfh9LFhAWeXb7R9QL03r70X/oPovIYnQGvwVFMmPyPK7
 mMys67H6eCyDvMlReWg1cEE6wqo/PDnSu1FWUw+BKHmSdTLu1LzArtA1Q==
X-ME-Sender: <xms:uNm4YzSY2Vwvu0vOjGM9lSJUt5_-zcCfSMpAuhH_eRBXBC7F2HVEXg>
 <xme:uNm4Y0yiSrcLV6uxgTK0txuMsI57G4txtr6VK56ptQ78bIbZHW7D9gALhxYYvvo1H
 iuUxsW4wUpQbimkHsc>
X-ME-Received: <xmr:uNm4Y426B5bnsutfwLXgb_fmuUVCckxO74cizTOJEl64ThUKhYRO1mVCuNNveYHZ3YUWk0XEGPfLlMuCPFkFwbvYt0lOyL19yEHviZHp3YHl2jbUk8YXQWY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieffjeefle
 ekteefvdduvdelleetvdeuveeiieetudffuefgieeigfdvgedvtdegnecuffhomhgrihhn
 pehrgidruggrthgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:uNm4YzCIxFfFHR6bqw51IAxu298yEs5BMK1Dyma8Rh6TT3JCi9AeZQ>
 <xmx:uNm4Y8jgjFlJ7Vpt2wtdG9jlBX2JfEuVF4WAtmeS83Z-sD7cQpBW_w>
 <xmx:uNm4Y3oBNtzGK3PNt05JMCzu-_zGZnSZZF1FuqqYbgqGBy4ZWl_qlA>
 <xmx:uNm4Y4ZpMvv8UX6WtXT9_bkSXEYnfSwdQeyMNNets7SiMMA46rHE0w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 21:32:23 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/4] ALSA: firewire-lib: code refactoring for pool position in
 rx packets
Date: Sat,  7 Jan 2023 11:32:12 +0900
Message-Id: <20230107023214.29132-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230107023214.29132-1-o-takashi@sakamocchi.jp>
References: <20230107023214.29132-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When scheduling transmission of rx packets, current implementation
fulfils packet descriptors after pooling sequence descriptors. It is for
packet queueing. Besides the implementations do not necessarily have
good readability.

This commit refactors them by adding function local variables and
function arguments.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 33 ++++++++++++++-------------------
 sound/firewire/amdtp-stream.h |  1 -
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 881e30c049fc..172addba7aab 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -558,12 +558,10 @@ static void pool_replayed_seq(struct amdtp_stream *s, struct seq_desc *descs, un
 	s->ctx_data.rx.cache_head = cache_head;
 }
 
-static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
+static void pool_seq_descs(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
+			   unsigned int pos, unsigned int count)
 {
 	struct amdtp_domain *d = s->domain;
-	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
-	const unsigned int size = s->ctx_data.rx.seq.size;
-	unsigned int pos = s->ctx_data.rx.seq.pos;
 	void (*pool_seq_descs)(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
 			       unsigned int pos, unsigned int count);
 
@@ -586,8 +584,6 @@ static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
 	}
 
 	pool_seq_descs(s, descs, size, pos, count);
-
-	s->ctx_data.rx.seq.pos = (pos + count) % size;
 }
 
 static void update_pcm_pointers(struct amdtp_stream *s,
@@ -979,20 +975,22 @@ static unsigned int compute_syt(unsigned int syt_offset, unsigned int cycle,
 	return syt & CIP_SYT_MASK;
 }
 
-static void generate_pkt_descs(struct amdtp_stream *s, const __be32 *ctx_header, unsigned int packets)
+static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *descs,
+				     const __be32 *ctx_header, unsigned int packet_count)
 {
-	struct pkt_desc *descs = s->pkt_descs;
-	const struct seq_desc *seq_descs = s->ctx_data.rx.seq.descs;
-	const unsigned int seq_size = s->ctx_data.rx.seq.size;
+	struct seq_desc *seq_descs = s->ctx_data.rx.seq.descs;
+	unsigned int seq_size = s->ctx_data.rx.seq.size;
+	unsigned int seq_pos = s->ctx_data.rx.seq.pos;
 	unsigned int dbc = s->data_block_counter;
-	unsigned int seq_head = s->ctx_data.rx.seq.head;
 	bool aware_syt = !(s->flags & CIP_UNAWARE_SYT);
 	int i;
 
-	for (i = 0; i < packets; ++i) {
+	pool_seq_descs(s, seq_descs, seq_size, seq_pos, packet_count);
+
+	for (i = 0; i < packet_count; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % s->queue_size;
-		const struct seq_desc *seq = seq_descs + seq_head;
+		const struct seq_desc *seq = seq_descs + seq_pos;
 
 		desc->cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
@@ -1013,13 +1011,13 @@ static void generate_pkt_descs(struct amdtp_stream *s, const __be32 *ctx_header,
 
 		desc->ctx_payload = s->buffer.packets[index].buffer;
 
-		seq_head = (seq_head + 1) % seq_size;
+		seq_pos = (seq_pos + 1) % seq_size;
 
 		++ctx_header;
 	}
 
 	s->data_block_counter = dbc;
-	s->ctx_data.rx.seq.head = seq_head;
+	s->ctx_data.rx.seq.pos = seq_pos;
 }
 
 static inline void cancel_stream(struct amdtp_stream *s)
@@ -1062,9 +1060,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	pool_seq_descs(s, packets);
-
-	generate_pkt_descs(s, ctx_header, packets);
+	generate_rx_packet_descs(s, s->pkt_descs, ctx_header, packets);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
@@ -1644,7 +1640,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		}
 		s->ctx_data.rx.seq.size = queue_size;
 		s->ctx_data.rx.seq.pos = 0;
-		s->ctx_data.rx.seq.head = 0;
 
 		entry = &initial_state[s->sfc];
 		s->ctx_data.rx.data_block_state = entry->data_block;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index baab63d31ddd..dbe6d4bcbb8a 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -160,7 +160,6 @@ struct amdtp_stream {
 				struct seq_desc *descs;
 				unsigned int size;
 				unsigned int pos;
-				unsigned int head;
 			} seq;
 
 			unsigned int data_block_state;
-- 
2.37.2

