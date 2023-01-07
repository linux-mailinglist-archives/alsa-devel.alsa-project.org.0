Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F748660BFB
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 03:34:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBE27A42;
	Sat,  7 Jan 2023 03:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBE27A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673058871;
	bh=Bt8/1n3wuQwxy4sQ2AI9sS4DjAo1hSJb0gxv8zPo98E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Tqdy8TM2CVEjlPESxMCSgtjXMiKs5fvTsXhH/Njb5rjRJCGQisvyoAHJaN+XzpaEp
	 76FiiG3wUszqYiVCeDA+aLGURcL//l0r1hi+nlCoAWaA3KdN345G7uC9s2GdwlG83H
	 EN9ZayXa0MFQn8L821eYKvTObnsKmSJEoAzq1V2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7366EF80551;
	Sat,  7 Jan 2023 03:32:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08129F8025A; Sat,  7 Jan 2023 03:32:35 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E7D4F8022B
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 03:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E7D4F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=tRkX4trj; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IQvMsGt9
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9B9E8320069B;
 Fri,  6 Jan 2023 21:32:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 06 Jan 2023 21:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673058742; x=
 1673145142; bh=BtKVY6TdxxlOH/HKR9B4XhuNtsNR7FeY764g2YKgcBc=; b=t
 RkX4trjq4fb5vNNKJOb0bL3mJekGBxr8vpMpxHrqjQnUih0jJLcfrD9s7Ct5CO3d
 U24dQAxrlcJnBmahXySrsVtRTe28GAZpFk0Z2H6tKLW5+XPhe8IYoIXheO7bn4bJ
 7vZr1xzwhZWrAn5RovA6ZDlN70tauF+uU0aTu2HeohlNiwmB+lgYzzWRVTPLsAxe
 lQdqRQZob1dcKyWYF62cQcGXpQ5pEhYAezo1OzCDVxvkG0GPdBYqBhyL2rAVQxKe
 FfiFcvyimAlmX7Wjc63MRgU5hQmY6Y8cX21qiu0XiDhZ0VW51JNtQGd9p9Bo5A8n
 eHbQ4KpRt/NkKBPCCVP8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1673058742; x=1673145142; bh=BtKVY6TdxxlOH
 /HKR9B4XhuNtsNR7FeY764g2YKgcBc=; b=IQvMsGt9DnqQm6/v9qNetJ30cHa+/
 NdMp66g1yS5DnmTeOxDA1SFHIS18L1Sl6EUXhTiRcPlgwYEx5iAHzGfDW5jfkkgE
 p5y8XqY+o9wg8tMR1CGyzlrE7dC/KdPgC+3YOxol+zDD9K9J+jlvBfsZC5KnK8By
 qIcLcnemH7JaktAZW3tf8I5F/cXldrzLSpicp7g1Zj+g40AtKCwwp4HLyFAp10F7
 D/ibq6XUY3k59vXvMUjUd9zGNtv4Pwwrhrm6Jz9SLwk/d4XVGfX//ItUUhNdCjog
 qhliEjbGS2rEkRJ2z/MVpB1DLzq4+Fl4HuiTYUFzAglQG6xrUCQH1P/og==
X-ME-Sender: <xms:tdm4YzIbQbePEuno4055GWZ--aX0QrOSz3ezaweHhJV1H_PYMLAYlQ>
 <xme:tdm4Y3KcNTuviX2c6MYKOTfPFUlGyAuPYMzIh9Wn0304Iuwntlpsm7hAVCJnyYYUG
 FF-q-_0hymKXG2F35o>
X-ME-Received: <xmr:tdm4Y7tg2mwfRWGezUl_P79ppzwb_JPd7c3WXnennrZMY4SSSfjyJu86HRbxVF5lB1FlSBjPIg6Zcl7c83ebeKrxW4HYu_jhgqqq_ABGzxzJv-hnnyriPAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieffjeefle
 ekteefvdduvdelleetvdeuveeiieetudffuefgieeigfdvgedvtdegnecuffhomhgrihhn
 pehrgidruggrthgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:tdm4Y8adKicse5krT-U6nFGhiJVgmMSAqzAeLh1u0hy0Q13BxFQ5SA>
 <xmx:tdm4Y6bVsFkJt-TjCAJKSwuFmgIg2FL0Thf1n9zQ5xaxZlz0H2GULA>
 <xmx:tdm4YwC4LHoQtBIUJBNSp0H-Ot4gDHaoJktD1r9hbaUGYRQkDa9RXQ>
 <xmx:ttm4Y9xbcWfnO-vKJoykiWRV3-RVZkJbGao0pCUOJVKD0ko2l35X3A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 21:32:20 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/4] ALSA: firewire-lib: code refactoring for helper functions
 to pool sequence in rx packets
Date: Sat,  7 Jan 2023 11:32:11 +0900
Message-Id: <20230107023214.29132-2-o-takashi@sakamocchi.jp>
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

When scheduling transmission of rx packets, current implementation pools
sequence descriptors at first for media clock. Two methods are used for
the purpose depending on four cases, while the implementations do not
necessarily have good readability.

This commit refactors them by adding function pointers and functions
arguments.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 65 +++++++++++++++++------------------
 sound/firewire/amdtp-stream.h |  2 +-
 2 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 9be2260e4ca2..881e30c049fc 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -349,26 +349,25 @@ void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 EXPORT_SYMBOL(amdtp_stream_pcm_prepare);
 
 static void pool_blocking_data_blocks(struct amdtp_stream *s, struct seq_desc *descs,
-				      const unsigned int seq_size, unsigned int seq_tail,
-				      unsigned int count)
+				      unsigned int size, unsigned int pos, unsigned int count)
 {
 	const unsigned int syt_interval = s->syt_interval;
 	int i;
 
 	for (i = 0; i < count; ++i) {
-		struct seq_desc *desc = descs + seq_tail;
+		struct seq_desc *desc = descs + pos;
 
 		if (desc->syt_offset != CIP_SYT_NO_INFO)
 			desc->data_blocks = syt_interval;
 		else
 			desc->data_blocks = 0;
 
-		seq_tail = (seq_tail + 1) % seq_size;
+		pos = (pos + 1) % size;
 	}
 }
 
 static void pool_ideal_nonblocking_data_blocks(struct amdtp_stream *s, struct seq_desc *descs,
-					       const unsigned int seq_size, unsigned int seq_tail,
+					       unsigned int size, unsigned int pos,
 					       unsigned int count)
 {
 	const enum cip_sfc sfc = s->sfc;
@@ -376,7 +375,7 @@ static void pool_ideal_nonblocking_data_blocks(struct amdtp_stream *s, struct se
 	int i;
 
 	for (i = 0; i < count; ++i) {
-		struct seq_desc *desc = descs + seq_tail;
+		struct seq_desc *desc = descs + pos;
 
 		if (!cip_sfc_is_base_44100(sfc)) {
 			// Sample_rate / 8000 is an integer, and precomputed.
@@ -403,7 +402,7 @@ static void pool_ideal_nonblocking_data_blocks(struct amdtp_stream *s, struct se
 			state = phase;
 		}
 
-		seq_tail = (seq_tail + 1) % seq_size;
+		pos = (pos + 1) % size;
 	}
 
 	s->ctx_data.rx.data_block_state = state;
@@ -449,8 +448,7 @@ static unsigned int calculate_syt_offset(unsigned int *last_syt_offset,
 }
 
 static void pool_ideal_syt_offsets(struct amdtp_stream *s, struct seq_desc *descs,
-				   const unsigned int seq_size, unsigned int seq_tail,
-				   unsigned int count)
+				   unsigned int size, unsigned int pos, unsigned int count)
 {
 	const enum cip_sfc sfc = s->sfc;
 	unsigned int last = s->ctx_data.rx.last_syt_offset;
@@ -458,11 +456,11 @@ static void pool_ideal_syt_offsets(struct amdtp_stream *s, struct seq_desc *desc
 	int i;
 
 	for (i = 0; i < count; ++i) {
-		struct seq_desc *desc = descs + seq_tail;
+		struct seq_desc *desc = descs + pos;
 
 		desc->syt_offset = calculate_syt_offset(&last, &state, sfc);
 
-		seq_tail = (seq_tail + 1) % seq_size;
+		pos = (pos + 1) % size;
 	}
 
 	s->ctx_data.rx.last_syt_offset = last;
@@ -531,52 +529,49 @@ static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsi
 	s->ctx_data.tx.cache.tail = cache_tail;
 }
 
-static void pool_ideal_seq_descs(struct amdtp_stream *s, unsigned int count)
+static void pool_ideal_seq_descs(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
+				 unsigned int pos, unsigned int count)
 {
-	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
-	unsigned int seq_tail = s->ctx_data.rx.seq.tail;
-	const unsigned int seq_size = s->ctx_data.rx.seq.size;
-
-	pool_ideal_syt_offsets(s, descs, seq_size, seq_tail, count);
+	pool_ideal_syt_offsets(s, descs, size, pos, count);
 
 	if (s->flags & CIP_BLOCKING)
-		pool_blocking_data_blocks(s, descs, seq_size, seq_tail, count);
+		pool_blocking_data_blocks(s, descs, size, pos, count);
 	else
-		pool_ideal_nonblocking_data_blocks(s, descs, seq_size, seq_tail, count);
-
-	s->ctx_data.rx.seq.tail = (seq_tail + count) % seq_size;
+		pool_ideal_nonblocking_data_blocks(s, descs, size, pos, count);
 }
 
-static void pool_replayed_seq(struct amdtp_stream *s, unsigned int count)
+static void pool_replayed_seq(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
+			      unsigned int pos, unsigned int count)
 {
 	struct amdtp_stream *target = s->ctx_data.rx.replay_target;
 	const struct seq_desc *cache = target->ctx_data.tx.cache.descs;
 	const unsigned int cache_size = target->ctx_data.tx.cache.size;
 	unsigned int cache_head = s->ctx_data.rx.cache_head;
-	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
-	const unsigned int seq_size = s->ctx_data.rx.seq.size;
-	unsigned int seq_tail = s->ctx_data.rx.seq.tail;
 	int i;
 
 	for (i = 0; i < count; ++i) {
-		descs[seq_tail] = cache[cache_head];
-		seq_tail = (seq_tail + 1) % seq_size;
+		descs[pos] = cache[cache_head];
 		cache_head = (cache_head + 1) % cache_size;
+		pos = (pos + 1) % size;
 	}
 
-	s->ctx_data.rx.seq.tail = seq_tail;
 	s->ctx_data.rx.cache_head = cache_head;
 }
 
 static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
 {
 	struct amdtp_domain *d = s->domain;
+	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
+	const unsigned int size = s->ctx_data.rx.seq.size;
+	unsigned int pos = s->ctx_data.rx.seq.pos;
+	void (*pool_seq_descs)(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
+			       unsigned int pos, unsigned int count);
 
 	if (!d->replay.enable || !s->ctx_data.rx.replay_target) {
-		pool_ideal_seq_descs(s, count);
+		pool_seq_descs = pool_ideal_seq_descs;
 	} else {
 		if (!d->replay.on_the_fly) {
-			pool_replayed_seq(s, count);
+			pool_seq_descs = pool_replayed_seq;
 		} else {
 			struct amdtp_stream *tx = s->ctx_data.rx.replay_target;
 			const unsigned int cache_size = tx->ctx_data.tx.cache.size;
@@ -584,11 +579,15 @@ static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
 			unsigned int cached_cycles = calculate_cached_cycle_count(tx, cache_head);
 
 			if (cached_cycles > count && cached_cycles > cache_size / 2)
-				pool_replayed_seq(s, count);
+				pool_seq_descs = pool_replayed_seq;
 			else
-				pool_ideal_seq_descs(s, count);
+				pool_seq_descs = pool_ideal_seq_descs;
 		}
 	}
+
+	pool_seq_descs(s, descs, size, pos, count);
+
+	s->ctx_data.rx.seq.pos = (pos + count) % size;
 }
 
 static void update_pcm_pointers(struct amdtp_stream *s,
@@ -1644,7 +1643,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 			goto err_context;
 		}
 		s->ctx_data.rx.seq.size = queue_size;
-		s->ctx_data.rx.seq.tail = 0;
+		s->ctx_data.rx.seq.pos = 0;
 		s->ctx_data.rx.seq.head = 0;
 
 		entry = &initial_state[s->sfc];
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 1f957c946c95..baab63d31ddd 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -159,7 +159,7 @@ struct amdtp_stream {
 			struct {
 				struct seq_desc *descs;
 				unsigned int size;
-				unsigned int tail;
+				unsigned int pos;
 				unsigned int head;
 			} seq;
 
-- 
2.37.2

