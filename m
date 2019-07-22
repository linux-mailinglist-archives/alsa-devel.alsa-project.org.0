Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB16F814
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47F501737;
	Mon, 22 Jul 2019 05:44:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47F501737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767118;
	bh=65y2W3UeIhXIg483lq1+6ERBAtvGRRh0GT5wM3ikzdY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aunHmc6SEfzddQDlcslnud4DtgI8zwBDgTG1W68zMDVugabemUNNJo+fYzKoJd2/9
	 K6fu9RSezknE8ugCaBfI2lszH5PPXw821Al8FAFT8gqv94h1LTNgR0mXcu8m6cdT6T
	 8MGkObzXNDW/w/GaczrmAJcRXI9mzAfdtd7AT4e0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFCFF805FD;
	Mon, 22 Jul 2019 05:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 135A8F804CB; Mon, 22 Jul 2019 05:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91CC1F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91CC1F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dTShbda/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ishoGvxj"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B5E8E21ADD;
 Sun, 21 Jul 2019 23:37:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=U6d0pcUFLI95e
 Yry7BHOddN1zZ4aLJTBruSXrl0LAH8=; b=dTShbda/nkTYdBqRWb4i7qPhJUG8A
 98gPR+3vs2RMRgVKH0gZrYy4sMX2jI8nDR4YYq64Y8lS+Iz4mZUn69uym1OaJ5G3
 8qIgBtEDX6JpQG7WhqFQiVDlhZ1+S64xOSwUeFxjNAy4hmQQgF1jP6vgaryvXlya
 4RwN6W4d9If9g0O/ggLj+LNDdc6XDFeSue0dYlurjaWeeKb2opQSQPAfR0qUEvB6
 wwsd3ljdTr6Sut0LQErpp9CJ/r0IuWNUReSed9CbxqN4FxP9a/cUt+0jb+q0fst/
 OunsswgjhJuMKBp74ZbPWaqaO+GoBlrOvpTMDWAr960iL5l1e6wUF3KqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=U6d0pcUFLI95eYry7BHOddN1zZ4aLJTBruSXrl0LAH8=; b=ishoGvxj
 0Gq0BDZDt4k4ckrtleHVvRvc81ZH4PTUNYkjaE/qa2Q7uXTOnFW16uY0UQCdXXAT
 eSG4KsL4i5paElJGnNBexfs0SWiWm0AnbbI/ZyJeakS9p3dAxwUAPaf2BigNuLUv
 q1l3fWIDhAX3cW0wGYoL2r2cg7FQhvPyJTFTULwjZqEZJncmyT8WDqlup9SC7/1G
 l9zd0ID54E7kHvG7zYRYO5cruGHEeKEpdrVkJSxRLv8rbiC6haBIIvdFm4NtQkTL
 WKymZAkY0FSvW/cLV43oOV+IEKvxqZ2bzJh6B8OKP3wwQtXEjRGJZwy1jVRA7mzo
 jQAStmqbjSBuCQ==
X-ME-Sender: <xms:eS81XZxBwCI9t2S8vGgqDAcbpI1_OJR5TNsr5_qUdAwVhAADft-8uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:eS81Xa0TpRPBibBE3mh5XKiBE885Nm7z1790Xs9ibARHpF8kwc0eIA>
 <xmx:eS81XZq1Pk4MgLo5fhgXTLiuL7Bt8OUqYsUxePPJjyuxhIirrJpvAg>
 <xmx:eS81XXXneRGlFhIMqhtcA3i9nNKL9SY4bmz1sX8dN5IwPWMuGovRdw>
 <xmx:eS81XSg8rTWFWqKMPT30MurDI87Pm_N4h3TonvfoFxl_qagxDw1qGw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FBFE80059;
 Sun, 21 Jul 2019 23:37:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:59 +0900
Message-Id: <20190722033710.28107-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/20] ALSA: firewire-lib: use packet
	descriptor for IT context
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

This commit uses packet descriptor to parse headers of IT context and
generate timing information for ideal sequence.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 68 ++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 2bea15151d4a..463c7a340a45 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -676,6 +676,38 @@ static inline u32 compute_it_cycle(const __be32 ctx_header_tstamp)
 	return increment_cycle_count(cycle, QUEUE_LENGTH);
 }
 
+static void generate_ideal_pkt_descs(struct amdtp_stream *s,
+				     struct pkt_desc *descs,
+				     const __be32 *ctx_header,
+				     unsigned int packets)
+{
+	unsigned int dbc = s->data_block_counter;
+	int i;
+
+	for (i = 0; i < packets; ++i) {
+		struct pkt_desc *desc = descs + i;
+		unsigned int index = (s->packet_index + i) % QUEUE_LENGTH;
+
+		desc->cycle = compute_cycle_count(*ctx_header);
+		desc->syt = calculate_syt(s, desc->cycle);
+		desc->data_blocks = calculate_data_blocks(s, desc->syt);
+
+		if (s->flags & CIP_DBC_IS_END_EVENT)
+			dbc = (dbc + desc->data_blocks) & 0xff;
+
+		desc->data_block_counter = dbc;
+
+		if (!(s->flags & CIP_DBC_IS_END_EVENT))
+			dbc = (dbc + desc->data_blocks) & 0xff;
+
+		desc->ctx_payload = s->buffer.packets[index].buffer;
+
+		++ctx_header;
+	}
+
+	s->data_block_counter = dbc;
+}
+
 static inline void cancel_stream(struct amdtp_stream *s)
 {
 	s->packet_index = -1;
@@ -696,39 +728,29 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	if (s->packet_index < 0)
 		return;
 
+	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
+
 	for (i = 0; i < packets; ++i) {
-		u32 cycle;
-		unsigned int syt;
-		unsigned int data_blocks;
-		unsigned int dbc;
-		__be32 *buffer;
+		const struct pkt_desc *desc = s->pkt_descs + i;
 		unsigned int pcm_frames;
+		unsigned int syt;
 		struct {
 			struct fw_iso_packet params;
 			__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
 		} template = { {0}, {0} };
 		struct snd_pcm_substream *pcm;
 
-		cycle = compute_it_cycle(*ctx_header);
-		syt = calculate_syt(s, cycle);
-		data_blocks = calculate_data_blocks(s, syt);
-		buffer = s->buffer.packets[s->packet_index].buffer;
-		dbc = s->data_block_counter;
-		pcm_frames = s->process_data_blocks(s, buffer, data_blocks, dbc);
+		pcm_frames = s->process_data_blocks(s, desc->ctx_payload,
+				desc->data_blocks, desc->data_block_counter);
 
-		if (s->flags & CIP_DBC_IS_END_EVENT)
-			dbc = (dbc + data_blocks) & 0xff;
-
-		if (s->ctx_data.rx.syt_override >= 0)
+		if (s->ctx_data.rx.syt_override < 0)
+			syt = desc->syt;
+		else
 			syt = s->ctx_data.rx.syt_override;
 
-		build_it_pkt_header(s, cycle, &template.params, data_blocks,
-				    dbc, syt, i);
-
-		if (!(s->flags & CIP_DBC_IS_END_EVENT))
-			dbc = (dbc + data_blocks) & 0xff;
-
-		s->data_block_counter = dbc;
+		build_it_pkt_header(s, desc->cycle, &template.params,
+				    desc->data_blocks, desc->data_block_counter,
+				    syt, i);
 
 		if (queue_out_packet(s, &template.params) < 0) {
 			cancel_stream(s);
@@ -738,8 +760,6 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		pcm = READ_ONCE(s->pcm);
 		if (pcm && pcm_frames > 0)
 			update_pcm_pointers(s, pcm, pcm_frames);
-
-		++ctx_header;
 	}
 
 	fw_iso_context_queue_flush(s->context);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
