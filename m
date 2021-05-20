Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DE389C4E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D3D1686;
	Thu, 20 May 2021 06:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D3D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483537;
	bh=FJZUC/ZlC0QBhkuVxr0IKrPmpCXHRJMj8V+L0T0I3A8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9EaaNhwgbJgEYdxHncO3wRTyQRplfdlcu5rJZbpmyMWjJ+AzBPR/dQN2gZA6DgQG
	 k/GLjdIENHfqYvjPmMKoaIJOA6Vh52lz+Me6+5+NfsTBvUO7Ebqkeu9sEgT4xjHAwa
	 Sf/fio2G7r8dQKZCVcChhSniwYXj8L+5nHo3IKtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE65F804BD;
	Thu, 20 May 2021 06:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17EE6F804AF; Thu, 20 May 2021 06:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B00CF80257
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B00CF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jBqgbDcS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="b1kityG4"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 96E5F5C00DD;
 Thu, 20 May 2021 00:02:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 20 May 2021 00:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8kAtZcgFj9DzF
 q1boG546K9OcB67JxFw3GRErQHlIXw=; b=jBqgbDcSK+tupDmiT91GrYFBvaqSh
 PxpZQKI50MJTuSbS0kx7ZFTygY1YTsbR8skIzVsJSakvhOe4EPHf/QvuPuMpIneg
 HS9KkpcQXglE1O+pKtGRmrdVb5sz8ryUUCNqG+B+3XAFGZ0WFGYfqtjehmJK+234
 C8CWl0pG9971qGuJWk2FpNbtLbQBJxxi4byxqM0Y95z1gkRzFMDHezVb0Z8i38ZI
 K68Rjge979d8Dd/MLlUtbqpzz8MHpgmVTJQpT8WOIxB0xvYQfViOeZ4j75wHp74T
 rAU64HPF2Bo79xH2xtd+hR55zSlv1UHmfcNaX2u8Kj1K8zgmYrj2fu2yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8kAtZcgFj9DzFq1boG546K9OcB67JxFw3GRErQHlIXw=; b=b1kityG4
 zuy3A34aM6VtWtc5Uc3LbnGVzW9KOb5NhvOpMX98V/i1j5KFISaapScpk4umuT/t
 gftQXeCYWYWiiREYkPQ7yhjbxEuexA0pvznJd3aivXW2/jzQ8YhBMDYpJh6C+Vi0
 1JeRCZzarH+3waJg50bAVNswcHf20W9Tzi1bUDP3KUpB1Wk+ZRVwYY1+VKDrHnxG
 s/TWfPQMwiFNy5UpQyieUNJjz1sHtBhmvMDZrpILWAE0Cy+tyWE/IY2/KiYo2YAA
 klyNleKh75WvuDKg5nGImvaGZTZFVAX0GNfLq6Oopgi9LtqfE0frZcm+/dw3n9Rc
 9uBh6KTPwg8iyg==
X-ME-Sender: <xms:PN-lYK5ELmpIsYzvqMrEnC1DHTxySv1QaLpavfoPPUMlQR_n20vV5w>
 <xme:PN-lYD6uxUOCZoCj5qsJolmcfWXsiEx1Fal5f6FgDGlSO_WUCR7On12_aJR_BMKqV
 S1L0jQufbFlgPmOL7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:PN-lYJc8P9JjLFpEh1rSXtdz30vVPoxfCumceH8vbN_2q0cLDTmMwA>
 <xmx:PN-lYHLic2ekCNnP3uR2gU0hat2t-jDIQoUAkRUufc0WcFXNNk2enQ>
 <xmx:PN-lYOKaJQOvGjmhRb00_1ZRqjLSvJuMVxiwVxv5E_UPf7SZXZoqgg>
 <xmx:PN-lYIy16BOlKGST2Uynto0ZdTxjCggx-Erpg0UYu9f7JRJtwTfTuA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/8] ALSA: firewire-lib: start processing content of packet at
 the same cycle in several IR contexts
Date: Thu, 20 May 2021 13:01:50 +0900
Message-Id: <20210520040154.80450-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
References: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
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

DICE ASICs support several pairs of isochronous packet streaming. It's
convenient for drivers to process content of the packet in the same cycle
timing.

This commit adds structure member to manage the cycle to start
processing packet in several IR contexts. The cycle is decided in the
first callback of the IR contexts. The content of packet is dropped
till the cycle.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 115 ++++++++++++++++++++++++++++++++--
 sound/firewire/amdtp-stream.h |   4 ++
 2 files changed, 113 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 87644cb0d8ab..35925c9666fc 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -958,9 +958,8 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	s->ctx_data.rx.event_count = event_count;
 }
 
-static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
-			       size_t header_length, void *header,
-			       void *private_data)
+static void process_tx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+			       void *header, void *private_data)
 {
 	struct amdtp_stream *s = private_data;
 	__be32 *ctx_header = header;
@@ -996,6 +995,82 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 }
 
+static void drop_tx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
+			    void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	const __be32 *ctx_header = header;
+	unsigned int packets;
+	unsigned int cycle;
+	int i;
+
+	if (s->packet_index < 0)
+		return;
+
+	packets = header_length / s->ctx_data.tx.ctx_header_size;
+
+	ctx_header += (packets - 1) * s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
+	cycle = compute_ohci_cycle_count(ctx_header[1]);
+	s->next_cycle = increment_ohci_cycle_count(cycle, 1);
+
+	for (i = 0; i < packets; ++i) {
+		struct fw_iso_packet params = {0};
+
+		if (queue_in_packet(s, &params) < 0) {
+			cancel_stream(s);
+			return;
+		}
+	}
+}
+
+static void process_tx_packets_intermediately(struct fw_iso_context *context, u32 tstamp,
+					size_t header_length, void *header, void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
+	__be32 *ctx_header;
+	unsigned int packets;
+	unsigned int offset;
+
+	if (s->packet_index < 0)
+		return;
+
+	packets = header_length / s->ctx_data.tx.ctx_header_size;
+
+	offset = 0;
+	ctx_header = header;
+	while (offset < packets) {
+		unsigned int cycle = compute_ohci_cycle_count(ctx_header[1]);
+
+		if (compare_ohci_cycle_count(cycle, d->processing_cycle.tx_start) >= 0)
+			break;
+
+		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(__be32);
+		++offset;
+	}
+
+	ctx_header = header;
+
+	if (offset > 0) {
+		size_t length = s->ctx_data.tx.ctx_header_size * offset;
+
+		drop_tx_packets(context, tstamp, length, ctx_header, s);
+		if (amdtp_streaming_error(s))
+			return;
+
+		ctx_header += length / sizeof(*ctx_header);
+		header_length -= length;
+	}
+
+	if (offset < packets) {
+		process_tx_packets(context, tstamp, header_length, ctx_header, s);
+		if (amdtp_streaming_error(s))
+			return;
+
+		context->callback.sc = process_tx_packets;
+	}
+}
+
 static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 {
 	struct amdtp_stream *irq_target = d->irq_target;
@@ -1082,6 +1157,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 					void *header, void *private_data)
 {
 	struct amdtp_stream *s = private_data;
+	struct amdtp_domain *d = s->domain;
 	const __be32 *ctx_header = header;
 	u32 cycle;
 
@@ -1094,13 +1170,12 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 
 	if (s->direction == AMDTP_IN_STREAM) {
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
-		s->next_cycle = cycle;
 
-		context->callback.sc = in_stream_callback;
+		context->callback.sc = drop_tx_packets;
 	} else {
 		cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
-		if (s == s->domain->irq_target)
+		if (s == d->irq_target)
 			context->callback.sc = irq_target_callback;
 		else
 			context->callback.sc = out_stream_callback;
@@ -1109,6 +1184,34 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	s->start_cycle = cycle;
 
 	context->callback.sc(context, tstamp, header_length, header, s);
+
+	// Decide the cycle count to begin processing content of packet in IR contexts.
+	if (s->direction == AMDTP_IN_STREAM) {
+		unsigned int stream_count = 0;
+		unsigned int callbacked_count = 0;
+
+		list_for_each_entry(s, &d->streams, list) {
+			if (s->direction == AMDTP_IN_STREAM) {
+				++stream_count;
+				if (s->callbacked)
+					++callbacked_count;
+			}
+		}
+
+		if (stream_count == callbacked_count) {
+			list_for_each_entry(s, &d->streams, list) {
+				if (s->direction != AMDTP_IN_STREAM)
+					continue;
+
+				if (compare_ohci_cycle_count(s->next_cycle, cycle) > 0)
+					cycle = s->next_cycle;
+
+				s->context->callback.sc = process_tx_packets_intermediately;
+			}
+
+			d->processing_cycle.tx_start = cycle;
+		}
+	}
 }
 
 /**
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 58769ca184a2..6fad113188fe 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -288,6 +288,10 @@ struct amdtp_domain {
 
 	struct amdtp_stream *irq_target;
 
+	struct {
+		unsigned int tx_start;
+	} processing_cycle;
+
 	struct {
 		struct seq_desc *descs;
 		unsigned int size;
-- 
2.27.0

