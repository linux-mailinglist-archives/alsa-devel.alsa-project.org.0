Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444A660BF9
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 03:34:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA66F488C;
	Sat,  7 Jan 2023 03:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA66F488C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673058854;
	bh=jfR8JYTlBtxKfNjLLom7vsK+t294HPTzJZURaVsg5M8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NokkKznHWqTgDaxEkGJJdJLrp0mz0AN1Kw+z63nwIkOgRiWjqHvYg5f/kzl9RAb9h
	 yH/1gdlyiq+5m6yUE4xvi6PppV+QeA2a8KXCy8lyjTEENl1PU6dy8GnZkzv9BYmdKO
	 qmrQpntTJeKqQlIdZNr1csAIFw2CoPU9ijD7FNEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8513FF804AD;
	Sat,  7 Jan 2023 03:32:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AAE4F803DC; Sat,  7 Jan 2023 03:32:34 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D51FF80217
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 03:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D51FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=nVYhbDf5; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qZr3/5Wn
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 23276320091A;
 Fri,  6 Jan 2023 21:32:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 Jan 2023 21:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673058746; x=
 1673145146; bh=ujdkTsmt8CcyANkGq7lz6ScdGws2R0WfFF7pkE6mN8I=; b=n
 VYhbDf5iCucG9Ht8hmRULieR/pCBqQLnyL1cpv4CMk13LECrDbSzPsGFGoUoWdpn
 J7rffNC4ShvKiM1SekxU7IbY5ke7UJiVJU3k0DxjHsygl3fClysjlG0LVCFFGeOu
 uknkPZtjz82TYMtUtvBFIsLZx5IAepEWP5HQPtyFrgCFGK0pNRnSAw82coSConom
 +JRX7ythyuvrh7bDRODZiCUgNRXLi3OhKnwnONaCscl63td2uDPPCmJv7YRQHLNT
 eVbxv4OqUN+8c18XgUOjwVuZ6ie3FrNoVOpC+OkGLMONUkMAcJpVw1glWYBD0xZR
 ygltsmrgUsoUyW+h32TBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1673058746; x=1673145146; bh=ujdkTsmt8CcyA
 NkGq7lz6ScdGws2R0WfFF7pkE6mN8I=; b=qZr3/5WnfcE7CnAy/AxTXYQOI5NVn
 FuIg8dYSVjW0cAG6zEGv7e7XIZ63wAXaMKJvnK8LKgogRpMVGxPifYXIj6PR/mGC
 Ruiyxked+85/Rb0RZqpyY4CzlRiKAHR4AGEYqjhLB7zw3H5YAfMzx+fenyWaL+nQ
 VqPSg/Hgtjlp9/ldAAG6FdLEEnY0y3qigA0kRt2m7gVqJNsXqvCT9HgDK8q8JO6K
 8EWMjGO+y2WueNQAD9hve/VFPn94qUQsh9uxldPk0Lv7dgBm9iZ34zL1Jg9RYYCn
 uuYoqV71cKzWqahKYHrFFujkNdCsrAyfvXWN/eUuVkN517McN+oxcr7Sg==
X-ME-Sender: <xms:utm4Y_T1uxRJHQEIBdOX3nqIlftYaUOTzzY3xaTR2hEwfV-pgPHF0A>
 <xme:utm4YwwN509ZQc110SOMyK4ISu8wgiiX1Qst8vMCkHSRjq78X3I42XNJuJtr1krnw
 tpallI9-OW61paDwWI>
X-ME-Received: <xmr:utm4Y02uiQH_ZSZgpOfOCcS7iAsXJEqI92QyZi3KGwqUJs71PpapHDON15pjLHOgV1g6zga-729oIL__Yhj4_NtSDosKDJqo_MQiYoS9c62kANpqY2WajH0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:utm4Y_DQFxTdo8OYUslksvJAH_Fw0kOI8Wb5hIVYABVolv7SdhaBfA>
 <xmx:utm4Y4haX-0C5a6YY-VyeMxTo43tbTRxeIKgzRq09ZxTB20ifp4JnQ>
 <xmx:utm4YzpYNqOw0lcuXq9D8LhX1B-Lv8yyT2jmam8Q74oDUlXz3Reehw>
 <xmx:utm4Y0YK3r_0zDnh0yGfqbSyLBz0Ashce_FFaGAZ8NW0tVahZF364Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 21:32:25 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/4] ALSA: firewire-lib: code refactoring for cache position
 in tx packets
Date: Sat,  7 Jan 2023 11:32:13 +0900
Message-Id: <20230107023214.29132-4-o-takashi@sakamocchi.jp>
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

When sequence replay is enabled for media clock recovery, current
implementation caches sequence descriptors from packet descriptors in tx
packets. Helper function for the purpose do not necessarily have good
readability.

This commit refactors relevant functions by renaming structure members,
function name, and function local variables.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 30 ++++++++++++++----------------
 sound/firewire/amdtp-stream.h |  2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 172addba7aab..08fd61a06e2e 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -495,7 +495,7 @@ static unsigned int compute_syt_offset(unsigned int syt, unsigned int cycle,
 static unsigned int calculate_cached_cycle_count(struct amdtp_stream *s, unsigned int head)
 {
 	const unsigned int cache_size = s->ctx_data.tx.cache.size;
-	unsigned int cycles = s->ctx_data.tx.cache.tail;
+	unsigned int cycles = s->ctx_data.tx.cache.pos;
 
 	if (cycles < head)
 		cycles += cache_size;
@@ -509,12 +509,12 @@ static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsi
 	const unsigned int transfer_delay = s->transfer_delay;
 	const unsigned int cache_size = s->ctx_data.tx.cache.size;
 	struct seq_desc *cache = s->ctx_data.tx.cache.descs;
-	unsigned int cache_tail = s->ctx_data.tx.cache.tail;
+	unsigned int cache_pos = s->ctx_data.tx.cache.pos;
 	bool aware_syt = !(s->flags & CIP_UNAWARE_SYT);
 	int i;
 
 	for (i = 0; i < desc_count; ++i) {
-		struct seq_desc *dst = cache + cache_tail;
+		struct seq_desc *dst = cache + cache_pos;
 		const struct pkt_desc *src = descs + i;
 
 		if (aware_syt && src->syt != CIP_SYT_NO_INFO)
@@ -523,10 +523,10 @@ static void cache_seq(struct amdtp_stream *s, const struct pkt_desc *descs, unsi
 			dst->syt_offset = CIP_SYT_NO_INFO;
 		dst->data_blocks = src->data_blocks;
 
-		cache_tail = (cache_tail + 1) % cache_size;
+		cache_pos = (cache_pos + 1) % cache_size;
 	}
 
-	s->ctx_data.tx.cache.tail = cache_tail;
+	s->ctx_data.tx.cache.pos = cache_pos;
 }
 
 static void pool_ideal_seq_descs(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
@@ -881,11 +881,9 @@ static inline u32 compute_ohci_it_cycle(const __be32 ctx_header_tstamp,
 	return increment_ohci_cycle_count(cycle, queue_size);
 }
 
-static int generate_device_pkt_descs(struct amdtp_stream *s,
-				     struct pkt_desc *descs,
-				     const __be32 *ctx_header,
-				     unsigned int packets,
-				     unsigned int *desc_count)
+static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *descs,
+				    const __be32 *ctx_header, unsigned int packet_count,
+				    unsigned int *desc_count)
 {
 	unsigned int next_cycle = s->next_cycle;
 	unsigned int dbc = s->data_block_counter;
@@ -895,7 +893,7 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 	int err;
 
 	*desc_count = 0;
-	for (i = 0; i < packets; ++i) {
+	for (i = 0; i < packet_count; ++i) {
 		struct pkt_desc *desc = descs + *desc_count;
 		unsigned int cycle;
 		bool lost;
@@ -1199,7 +1197,7 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 {
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
-	unsigned int packets;
+	unsigned int packet_count;
 	unsigned int desc_count;
 	int i;
 	int err;
@@ -1208,10 +1206,10 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 		return;
 
 	// Calculate the number of packets in buffer and check XRUN.
-	packets = header_length / s->ctx_data.tx.ctx_header_size;
+	packet_count = header_length / s->ctx_data.tx.ctx_header_size;
 
 	desc_count = 0;
-	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets, &desc_count);
+	err = generate_tx_packet_descs(s, s->pkt_descs, ctx_header, packet_count, &desc_count);
 	if (err < 0) {
 		if (err != -EAGAIN) {
 			cancel_stream(s);
@@ -1226,7 +1224,7 @@ static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			cache_seq(s, s->pkt_descs, desc_count);
 	}
 
-	for (i = 0; i < packets; ++i) {
+	for (i = 0; i < packet_count; ++i) {
 		struct fw_iso_packet params = {0};
 
 		if (queue_in_packet(s, &params) < 0) {
@@ -1611,7 +1609,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 			// possible to cache much unexpectedly.
 			s->ctx_data.tx.cache.size = max_t(unsigned int, s->syt_interval * 2,
 							  queue_size * 3 / 2);
-			s->ctx_data.tx.cache.tail = 0;
+			s->ctx_data.tx.cache.pos = 0;
 			s->ctx_data.tx.cache.descs = kcalloc(s->ctx_data.tx.cache.size,
 						sizeof(*s->ctx_data.tx.cache.descs), GFP_KERNEL);
 			if (!s->ctx_data.tx.cache.descs) {
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index dbe6d4bcbb8a..094a140baa19 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -145,7 +145,7 @@ struct amdtp_stream {
 			struct {
 				struct seq_desc *descs;
 				unsigned int size;
-				unsigned int tail;
+				unsigned int pos;
 			} cache;
 		} tx;
 		struct {
-- 
2.37.2

