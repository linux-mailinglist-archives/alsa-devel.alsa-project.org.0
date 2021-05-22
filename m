Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0B38D2CE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 03:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47CE16C6;
	Sat, 22 May 2021 03:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47CE16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621647311;
	bh=4QBBXAmeC0bHj3fgbbJWs92VxVhWTvSPEeXZRlpZOf8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvzhrjyWONZn86DNPce4DDXKt2SI9IjbTHFrEtrgO9ojCkT1dOISK147/Nd1jtAOE
	 613DHTDY+EUFzWzlAA6qDrOgKFg31aOxIWAbhb7UY9W9eir365g11B4NPUH4YJhbZ8
	 uKXhmxAydITIKtVgCyro7hsZAQHdyTIdqkY7H7/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33ABF8020B;
	Sat, 22 May 2021 03:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474C9F80424; Sat, 22 May 2021 03:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 651C4F80153
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 03:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 651C4F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pwFU46lo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mK5/9s6g"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 829C15C0136;
 Fri, 21 May 2021 21:33:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 21 May 2021 21:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vMqWzAqCcYD5Q
 RFqsriVfFGNLSMQC1q4C8Fur9LTWxE=; b=pwFU46lonX5n6fAuyy/iQ78AVttaB
 oam8QxqMcTPUvyeFRahG0fHW+JhmUtEfavBocn7rdQfNXOpLJAA8MylNTbShZdxO
 jH8nnGOiVoqczUYtRJ7D3c3mRUweDct36DyEzqJzSmtThE79XSPM4805FSTEhg5h
 o+2jXDz0m1r01CMUlETAmpPh9wDBvnvUYOioObqJDpl0eFSI67LcVGptMY1ZqbMA
 ckLT6wWA9YouFc6zHNvYD+mtiSWN2aZtfsPqEd411vOajSmicEVWkYW1wdlL3/Q5
 CiOgm6TQhmB1ou4HseDwOdvuAEbY5UPKCHOy88Rs+r3t4CRqRDH4L1Ecg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vMqWzAqCcYD5QRFqsriVfFGNLSMQC1q4C8Fur9LTWxE=; b=mK5/9s6g
 yQ2W3MP3+mpfnVbHjUyh1nCIg74/0vLa+NUVvUG9c5A3R7/97WPP0kkoUtjJUJnW
 5dfiznPjpYdfRtvwLAR9nxcuedxQPBAHe6h9yCcl/3/i+ozaGb13dOTXl8yC+/2O
 h5CSke+eujBsniGe7Z8kY/2wO/Nry0WIaOrW79BarTcHvi11mjIGVUXHyVn+wvKy
 MsBHzQAT1SY4RVMDdJBuj+m8gRQA9ywoXFLe3SQ1UpJr9lriIpo1QQlrTeTYzB4y
 B4TlfyQTN2zcQbaKoeWzW0G5Giil0HbAGTb49gY+Pfc8i4a0dx0mC3R7qSJdTAtC
 q/uAVUfBs4phzQ==
X-ME-Sender: <xms:VV-oYIYe_eQgAuahh8rxKhrdywxz_bOmWBVSFtuQ-kP94qq-3yWGog>
 <xme:VV-oYDZ_sIhbkvWKflOuD2dBAOlGNF2X9PziQdSessBMRzLVSKqLPmyoj4xVy7ojk
 B9_Jz9GCSBnGiAzmdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:VV-oYC8GmdYNZaeqVnsufJcj_spaq60wCErJBIQ5Cp3mdx_H4tzUKA>
 <xmx:VV-oYCpI7ZQ9cffVcG6G7vXraJa8_lyEORhHV6OrjxaZoQKZMkTcEg>
 <xmx:VV-oYDo62cYvI37redDrhdpHp4Epzh2_ETvhQEnhcdaCaFHEU1YnOA>
 <xmx:VV-oYCQaqfJ76Rj9TRM5XP4QLASBwkjKWv-atPoHUmVXVvRDKgY1UQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 21:33:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/6] ALSA: firewire-lib: add flag to unaware of syt in CIP
 header
Date: Sat, 22 May 2021 10:32:58 +0900
Message-Id: <20210522013303.49596-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210522013303.49596-1-o-takashi@sakamocchi.jp>
References: <20210522013303.49596-1-o-takashi@sakamocchi.jp>
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

Many devices are unaware of syt field in rx CIP for playback timing.

This commit adds a flag to cancel processing syt field. Actually,
syt calculation is required to decide the number of events per rx packet.
The flag put 0xffff to CIP header of rx packet. On the other hand,
The value of syt field in CIP header of tx packet is unavailable. The
sequence of packet descriptor for tx packet includes 0 for the offset
of syt field to avoid computation.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c        | 27 ++++++++++-----------------
 sound/firewire/amdtp-stream.h        |  4 +++-
 sound/firewire/motu/amdtp-motu.c     |  4 +---
 sound/firewire/tascam/amdtp-tascam.c |  6 ++----
 4 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 3713188aac25..7e763f46e5a4 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -113,9 +113,6 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->fmt = fmt;
 	s->process_ctx_payloads = process_ctx_payloads;
 
-	if (dir == AMDTP_OUT_STREAM)
-		s->ctx_data.rx.syt_override = -1;
-
 	return 0;
 }
 EXPORT_SYMBOL(amdtp_stream_init);
@@ -638,7 +635,8 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 
 	*data_block_counter = dbc;
 
-	*syt = cip_header[1] & CIP_SYT_MASK;
+	if (!(s->flags & CIP_UNAWARE_SYT))
+		*syt = cip_header[1] & CIP_SYT_MASK;
 
 	return 0;
 }
@@ -836,22 +834,23 @@ static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
 {
 	unsigned int dbc = s->data_block_counter;
 	unsigned int seq_index = s->ctx_data.rx.seq_index;
+	bool aware_syt = !(s->flags & CIP_UNAWARE_SYT);
 	int i;
 
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % s->queue_size;
 		const struct seq_desc *seq = seq_descs + seq_index;
-		unsigned int syt;
 
 		desc->cycle = compute_ohci_it_cycle(*ctx_header, s->queue_size);
 
-		syt = seq->syt_offset;
-		if (syt != CIP_SYT_NO_INFO) {
-			syt = compute_syt(syt, desc->cycle,
-					  s->ctx_data.rx.transfer_delay);
+		if (aware_syt && seq->syt_offset != CIP_SYT_NO_INFO) {
+			desc->syt = compute_syt(seq->syt_offset, desc->cycle,
+						s->ctx_data.rx.transfer_delay);
+		} else {
+			desc->syt = CIP_SYT_NO_INFO;
 		}
-		desc->syt = syt;
+
 		desc->data_blocks = seq->data_blocks;
 
 		if (s->flags & CIP_DBC_IS_END_EVENT)
@@ -924,21 +923,15 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
-		unsigned int syt;
 		struct {
 			struct fw_iso_packet params;
 			__be32 header[CIP_HEADER_QUADLETS];
 		} template = { {0}, {0} };
 		bool sched_irq = false;
 
-		if (s->ctx_data.rx.syt_override < 0)
-			syt = desc->syt;
-		else
-			syt = s->ctx_data.rx.syt_override;
-
 		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
 				    desc->data_blocks, desc->data_block_counter,
-				    syt, i);
+				    desc->syt, i);
 
 		if (s == s->domain->irq_target) {
 			event_count += desc->data_blocks;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index b362a6499265..6c4d277dc0dd 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -35,6 +35,8 @@
  * @CIP_NO_HEADERS: a lack of headers in packets
  * @CIP_UNALIGHED_DBC: Only for in-stream. The value of dbc is not alighed to
  *	the value of current SYT_INTERVAL; e.g. initial value is not zero.
+ * @CIP_UNAWARE_SYT: For outgoing packet, the value in SYT field of CIP is 0xffff.
+ *	For incoming packet, the value in SYT field of CIP is not handled.
  */
 enum cip_flags {
 	CIP_NONBLOCKING		= 0x00,
@@ -48,6 +50,7 @@ enum cip_flags {
 	CIP_HEADER_WITHOUT_EOH	= 0x80,
 	CIP_NO_HEADER		= 0x100,
 	CIP_UNALIGHED_DBC	= 0x200,
+	CIP_UNAWARE_SYT		= 0x400,
 };
 
 /**
@@ -143,7 +146,6 @@ struct amdtp_stream {
 
 			// To generate CIP header.
 			unsigned int fdf;
-			int syt_override;
 
 			// To generate constant hardware IRQ.
 			unsigned int event_count;
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 9ccde07d6295..18bf433f43b6 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -441,7 +441,7 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	int fmt = CIP_FMT_MOTU;
-	int flags = CIP_BLOCKING;
+	unsigned int flags = CIP_BLOCKING | CIP_UNAWARE_SYT;
 	int err;
 
 	if (dir == AMDTP_IN_STREAM) {
@@ -479,8 +479,6 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 	if (dir == AMDTP_OUT_STREAM) {
 		// Use fixed value for FDF field.
 		s->ctx_data.rx.fdf = MOTU_FDF_AM824;
-		// Not used.
-		s->ctx_data.rx.syt_override = 0xffff;
 	}
 
 	return 0;
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index f823a2ab3544..64d66a802545 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -228,6 +228,7 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir, unsigned int pcm_channels)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
+	unsigned int flags = CIP_NONBLOCKING | CIP_SKIP_DBC_ZERO_CHECK | CIP_UNAWARE_SYT;
 	struct amdtp_tscm *p;
 	unsigned int fmt;
 	int err;
@@ -240,8 +241,7 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 		process_ctx_payloads = process_it_ctx_payloads;
 	}
 
-	err = amdtp_stream_init(s, unit, dir,
-			CIP_NONBLOCKING | CIP_SKIP_DBC_ZERO_CHECK, fmt,
+	err = amdtp_stream_init(s, unit, dir, flags, fmt,
 			process_ctx_payloads, sizeof(struct amdtp_tscm));
 	if (err < 0)
 		return 0;
@@ -249,8 +249,6 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 	if (dir == AMDTP_OUT_STREAM) {
 		// Use fixed value for FDF field.
 		s->ctx_data.rx.fdf = 0x00;
-		// Not used.
-		s->ctx_data.rx.syt_override = 0x0000;
 	}
 
 	/* This protocol uses fixed number of data channels for PCM samples. */
-- 
2.27.0

