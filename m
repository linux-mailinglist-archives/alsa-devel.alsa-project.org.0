Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A738797D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92C7F16F4;
	Tue, 18 May 2021 15:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92C7F16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343088;
	bh=OiZvZuSMEkvlY5X4jn+JHGle/mBwyHjeQtGF4iflrR4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VySOekxIu69k7bSfCFwKroFkmBCEk64N6vW1Ar3jGZD7lfCNSsDZ+ilkyJbz8Hnau
	 3MNoDagKQy4z3OuovSwAxpmO0ZjtmncS2UFtHI2YGVefEc1odouetyR48gJ4LQ1VMk
	 BtXYK03/Ez4H3NNtvzjJFJ6gq30rL0vM06uiGZEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27835F804B2;
	Tue, 18 May 2021 15:01:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C8F7F80475; Tue, 18 May 2021 15:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08073F8027D
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08073F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dIlb+2ue"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t96ejH3m"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3FB755C01F9;
 Tue, 18 May 2021 09:01:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 May 2021 09:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oWtVp8Z06GLgL
 pDoYN+KEbuOrnjsvwjcGcnHJoN+UDg=; b=dIlb+2uejYDWvtaHA/5PZg40MosqZ
 UQEFmumgJ22bqmh7Ay+J6U2kdZipfgi98k5WNAJe7QEQuprw/7ZHmo3g+FECeJ9q
 xextVThZSU619nrPDcKIQHf9sisJ63Lle7NgmmlTZBLtZWjC4/8+oOjO4RR7NOiQ
 sOTGuEE6HuKLcxKsCPZU4v+Z+lWDMqe8pLlCdHonnIb40kGR6pSNAsGivftmaBS2
 UWLQajgi5hWp4u7ZYa39ttfVJNzt+ZjTJD6uLaV+PDafWrfrXcztuheualF6dG07
 EbA+d9TH3ISAwAExRJ3Jv3YOJOaxmi6nRVKowVuWJyhfrOharb1N78u7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=oWtVp8Z06GLgLpDoYN+KEbuOrnjsvwjcGcnHJoN+UDg=; b=t96ejH3m
 VUkFh9Llw6XFJmRWBeJP7A/QzSdbb9oB4gBNt5s0IZL8ZECUnIHvicwrslAaPwHa
 2842e7mPhfnSdG2npxyO5PcwXgyJCaEEju45ig4vRpmWFq4n3ptjQZgj55hsqCSl
 elp69UIRsRCzEj9fEJc11MvWXnvcEAaLl93tDoF7QoC9uIke5kyJLInvTCc3mY++
 x7RHHB7ltdrK7JSNfBdHi459ZWHUeqRNAfyYI2hmEtUgDv6piU+zUmvr+KcrWeCy
 XPEznYhAi+LpDWI+xk9S/+L8aKvC5o4/nDSp3OjHomauUFrcsUuP2I5DfJel5Eu7
 UQkHYbY6nVOvaw==
X-ME-Sender: <xms:kLqjYPfGaM2Hvd_FyMaam1mQvAuLjSMlak0rXQBsKmuTnZoqrbnZQg>
 <xme:kLqjYFO9CH4eMOTW6N8BcmuMSSWt-sxMxibMq7fRTHojAFEfLFNTes-cKtjdrklLE
 mZsaBhq9S17sjPF3Sc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kLqjYIiGtf3q4NDuIvsi0tWKpJZmoFRZFaSxT2POVP4PqlL-sSX_uA>
 <xmx:kLqjYA_ka1eleq0hRvMufihya7vK9RXcBu1HIEZ2zWjBZC7nyy-W3Q>
 <xmx:kLqjYLtY7aMWRpcGoVBRK_FxrFgGkLkyC2tiSmBQEbgRgyJgLzRKYw>
 <xmx:kbqjYJ3s6YRxhdo4aDMRaGhvh5ndQTaacsezKMZmHfjc9nFSPQ6UVQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:01:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 7/8] ALSA: firewire-lib: check cycle continuity
Date: Tue, 18 May 2021 22:00:46 +0900
Message-Id: <20210518130048.146596-8-o-takashi@sakamocchi.jp>
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

Within devices supported by drivers in ALSA firewire stack, OXFW-based
devices and Fireface devices are known to skip isochronous cycle for
packet transmission. The former is due to the jumbo payload quirk. The
latter is due to vendor protocol in which empty packet is not
transferred in blocking mode.

Although nothing to do just for handling events of the packet, packet
continuity is necessarily for media clock recovery. This commit checks
whether any cycle is continue or not.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 39 ++++++++++++++++++++++++++++++++---
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 1ff25e6b0c78..78b62a452d56 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -699,6 +699,16 @@ static inline u32 increment_ohci_cycle_count(u32 cycle, unsigned int addend)
 	return cycle;
 }
 
+static int compare_ohci_cycle_count(u32 lval, u32 rval)
+{
+	if (lval == rval)
+		return 0;
+	else if (lval < rval && rval - lval < OHCI_SECOND_MODULUS * CYCLES_PER_SECOND / 2)
+		return -1;
+	else
+		return 1;
+}
+
 // Align to actual cycle count for the packet which is going to be scheduled.
 // This module queued the same number of isochronous cycle as the size of queue
 // to kip isochronous cycle, therefore it's OK to just increment the cycle by
@@ -715,6 +725,7 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 				     const __be32 *ctx_header,
 				     unsigned int packets)
 {
+	unsigned int next_cycle = s->next_cycle;
 	unsigned int dbc = s->data_block_counter;
 	unsigned int packet_index = s->packet_index;
 	unsigned int queue_size = s->queue_size;
@@ -724,10 +735,31 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int cycle;
+		bool lost;
 		unsigned int data_blocks;
 		unsigned int syt;
 
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
+		lost = (next_cycle != cycle);
+		if (lost) {
+			if (s->flags & CIP_NO_HEADER) {
+				// Fireface skips transmission just for an isoc cycle corresponding
+				// to empty packet.
+				next_cycle = increment_ohci_cycle_count(next_cycle, 1);
+				lost = (next_cycle != cycle);
+			} else if (s->flags & CIP_JUMBO_PAYLOAD) {
+				// OXFW970 skips transmission for several isoc cycles during
+				// asynchronous transaction.
+				unsigned int safe_cycle = increment_ohci_cycle_count(next_cycle,
+								IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES);
+				lost = (compare_ohci_cycle_count(safe_cycle, cycle) > 0);
+			}
+			if (lost) {
+				dev_err(&s->unit->device, "Detect discontinuity of cycle: %d %d\n",
+					next_cycle, cycle);
+				return -EIO;
+			}
+		}
 
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &data_blocks, &dbc, &syt,
 					  packet_index, i);
@@ -743,12 +775,12 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 		if (!(s->flags & CIP_DBC_IS_END_EVENT))
 			dbc = (dbc + desc->data_blocks) & 0xff;
 
-		ctx_header +=
-			s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
-
+		next_cycle = increment_ohci_cycle_count(next_cycle, 1);
+		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
 		packet_index = (packet_index + 1) % queue_size;
 	}
 
+	s->next_cycle = next_cycle;
 	s->data_block_counter = dbc;
 
 	return 0;
@@ -1022,6 +1054,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 
 	if (s->direction == AMDTP_IN_STREAM) {
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
+		s->next_cycle = cycle;
 
 		context->callback.sc = in_stream_callback;
 	} else {
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 5f5e4d938a0d..58769ca184a2 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -171,6 +171,7 @@ struct amdtp_stream {
 	bool callbacked;
 	wait_queue_head_t callback_wait;
 	u32 start_cycle;
+	unsigned int next_cycle;
 
 	/* For backends to process data blocks. */
 	void *protocol;
-- 
2.27.0

