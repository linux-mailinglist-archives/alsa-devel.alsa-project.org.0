Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA51387980
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4F716F0;
	Tue, 18 May 2021 15:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4F716F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343125;
	bh=EZGwLAA5iXiYEHxfYtBjACPnABuAXlHX1DvsbI7UDcE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fteTnVnR/BuVxQs/O2rABQYPPpS9VE+jVcfD5yz5ivsSUy7TYNy3yQstpWJ2ahJTe
	 53jHKBiEMlKPyyxqDeWXiJk4zGDXMki92NY1XplTqpk0YMG4wmiGDRbtrC2V5+C67l
	 0Bh6xV9wByjY0KkXbKNDg86s+lxuLf+JW85QzHng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0015F804D1;
	Tue, 18 May 2021 15:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AB9AF804A9; Tue, 18 May 2021 15:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE35AF80217
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE35AF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zfE/kiYe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="c9eUP4dY"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F28B45C021E;
 Tue, 18 May 2021 09:01:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 May 2021 09:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mF3hpUrwrtAk1
 Ie3OFRMN8X5OiZd7cmNLrl7DpxqZbY=; b=zfE/kiYeN0GOqc92d93hViatYptIV
 6JDYF6j8BoimWvvZAQtllvldmLX8QSKHOc9DVLwSvEl5ALIGnn52nVHJM7OB5EgC
 m2KO74NXhO7u7e8gnLCLiSvTkLYWvMEVpQLrbMUI0XTQ6mBBJEVWUWoqajwR+leK
 qK8I3HmmYnenF/tO0SiaCFumSTbk2oyOhzBnGo9z4aSrYb1nwOsy52JlQNFRart3
 z4rw7bFtExxS8ZnW81WWcHrccL0ECbVc+N6hT8ry1+ZRQWt81afEOC58pZpEtYRB
 4xImFxDgy1pGi9zNQbFdtrH+UZDk4jX/azSQG7ndEk3JFbbgX36nCt8sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mF3hpUrwrtAk1Ie3OFRMN8X5OiZd7cmNLrl7DpxqZbY=; b=c9eUP4dY
 paX2NtDE5VPYchI8DuniKz+g2p+VXqrhSQHoDhcLidJBg4l6YrTHrKXMPQyoP4R8
 u1A/x6qgOKHxMCsK5GyQSoQ3U9EhjsukJxmFyexGGWuPz47xpEp+2RrNvTCyKqvY
 S7jPRXzjf1PXlUKFES2BvdjyOBIdDykRa1c11P9K7K84DUtpJNly8fEVj+y9v05p
 z1tWDde5/lncMpeWFd+w7J10uKSNsYKIWXeXfgiXrN95LERvhdcHPn0o9JtyApTJ
 XXdQZxGBEnbJHHPDjSROCof2PCLwWd/bDcxFoqUnqTO2TEQ9OSbXC+h2iNJKDe9p
 OQ2exiBtoeDikg==
X-ME-Sender: <xms:krqjYLyl9BZUxTZNdwBVFRe1FPLsNQY5x07pyoElW9gbbtR6T9wgnw>
 <xme:krqjYDSVV6xZ0xhe6YrpboSm1p9iqnFa52E18hWf1jiXiCKK8sT2-1B-NO0b6OuD1
 r3xHr_k22Di-YIxEys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:krqjYFWXp6x-2479297Bd7xQfxDKjHB5jmejT-2ZamuQMJhsztD-1A>
 <xmx:krqjYFg5kZKPyFKRN60kE-EDUxSIBMdsCw0usq7jSrDeFsz_Mabd0g>
 <xmx:krqjYNA-vkoFBWCAMCwV3i3_f60EHyAaP6Ql6B7LSTLrvp3D82QW7Q>
 <xmx:krqjYApqLitkb6CRnR6Vgn8C8ar9qh5ei1MhHVNMFXxgZlRVEdzxWA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:01:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 8/8] ALSA: firewire-lib: insert descriptor for skipped cycle
Date: Tue, 18 May 2021 22:00:47 +0900
Message-Id: <20210518130048.146596-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
References: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit fulfils sequence descriptors for skipped cycle when
it's one cycle. This is preparation for future integration.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 78b62a452d56..af5c3629f1ac 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -723,7 +723,8 @@ static inline u32 compute_ohci_it_cycle(const __be32 ctx_header_tstamp,
 static int generate_device_pkt_descs(struct amdtp_stream *s,
 				     struct pkt_desc *descs,
 				     const __be32 *ctx_header,
-				     unsigned int packets)
+				     unsigned int packets,
+				     unsigned int *desc_count)
 {
 	unsigned int next_cycle = s->next_cycle;
 	unsigned int dbc = s->data_block_counter;
@@ -732,8 +733,9 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 	int i;
 	int err;
 
+	*desc_count = 0;
 	for (i = 0; i < packets; ++i) {
-		struct pkt_desc *desc = descs + i;
+		struct pkt_desc *desc = descs + *desc_count;
 		unsigned int cycle;
 		bool lost;
 		unsigned int data_blocks;
@@ -745,11 +747,25 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 			if (s->flags & CIP_NO_HEADER) {
 				// Fireface skips transmission just for an isoc cycle corresponding
 				// to empty packet.
+				unsigned int prev_cycle = next_cycle;
+
 				next_cycle = increment_ohci_cycle_count(next_cycle, 1);
 				lost = (next_cycle != cycle);
+				if (!lost) {
+					// Prepare a description for the skipped cycle for
+					// sequence replay.
+					desc->cycle = prev_cycle;
+					desc->syt = 0;
+					desc->data_blocks = 0;
+					desc->data_block_counter = dbc;
+					desc->ctx_payload = NULL;
+					++desc;
+					++(*desc_count);
+				}
 			} else if (s->flags & CIP_JUMBO_PAYLOAD) {
 				// OXFW970 skips transmission for several isoc cycles during
-				// asynchronous transaction.
+				// asynchronous transaction. The sequence replay is impossible due
+				// to the reason.
 				unsigned int safe_cycle = increment_ohci_cycle_count(next_cycle,
 								IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES);
 				lost = (compare_ohci_cycle_count(safe_cycle, cycle) > 0);
@@ -776,6 +792,7 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 			dbc = (dbc + desc->data_blocks) & 0xff;
 
 		next_cycle = increment_ohci_cycle_count(next_cycle, 1);
+		++(*desc_count);
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
 		packet_index = (packet_index + 1) % queue_size;
 	}
@@ -927,6 +944,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
 	unsigned int packets;
+	unsigned int desc_count;
 	int i;
 	int err;
 
@@ -936,14 +954,15 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / s->ctx_data.tx.ctx_header_size;
 
-	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets);
+	desc_count = 0;
+	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets, &desc_count);
 	if (err < 0) {
 		if (err != -EAGAIN) {
 			cancel_stream(s);
 			return;
 		}
 	} else {
-		process_ctx_payloads(s, s->pkt_descs, packets);
+		process_ctx_payloads(s, s->pkt_descs, desc_count);
 	}
 
 	for (i = 0; i < packets; ++i) {
-- 
2.27.0

