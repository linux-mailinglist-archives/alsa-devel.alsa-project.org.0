Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37E389C4D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:05:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF85169B;
	Thu, 20 May 2021 06:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF85169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483519;
	bh=4tv2SfHeWbL34rA8bT2dizIqxHwLhnbPmHBGKYbgtZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtQDBpHJVX+HjXre+6te6uPg9fHs3ATeAIj32euy2Pd7eJm+vqJ241FHMTCN2qVUK
	 jHI+IKcaMhBTbc6MGy6b16Tue7/ZYrlS6vYlOanh2PHE+9o8JxubjYDTB6xTUC7WM9
	 ggEwj7z2GpyFvoYopernk8Hu8HLTkvLfABsuVkAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD3A3F804AD;
	Thu, 20 May 2021 06:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C15AF804AE; Thu, 20 May 2021 06:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8D7CF80229
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D7CF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mZzCe565"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JTl6pO9t"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 00DC75C00E7;
 Thu, 20 May 2021 00:02:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 May 2021 00:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0nuJr2tzyvSn+
 /z3rmTx+oAAdmgp2PD0SCmA+y0mj1s=; b=mZzCe565TPjc99yGrwCkzJQ4MBo5m
 dC/3sO1hXE9tQnXUDzIx3MkOlNjif+mwxYNZCXLlFuWVrALyyjPQVOLSixTxwpFr
 JoG6zEnWJJk30O7R2+CRmcnXNb3K74SBGN1YBrs6PCV3zuVuUlmab64OejEwJZbp
 l6XA0fxuPSI28q1zJ6hvqO66JvzsjpnMbv4+Q4VMHokhcndDpUwSUp9BEIE9gOVp
 6DL+hpdVu9fV4V3HPTTXUlvEfBMLzkdkbBpo1S2Z+Rq2Wrg4Y0hcvx4ZK4/CBrCa
 PDRvLR/y+4QPVRIgwjjV/gw7Oedt3Gi4YNjREtda7dP+l56CHJqMDQePg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0nuJr2tzyvSn+/z3rmTx+oAAdmgp2PD0SCmA+y0mj1s=; b=JTl6pO9t
 ZxP/WUDRQ+IkD+AJ0jmUwegONF4h04aU0nGrVz3YylpZBFZshmx0YzwgjBRlHD5v
 JjXQtnXG8dImVYwhWudlcPWkZ0MvfPHXoISI1L7yIi3PtfQ36/jD/PeJWAv6EaZ4
 u2+BiKHtEUh7LSyoNrp7nQoDugH/F4XO48sWrESFl4Dc8WEOsuHpW7ddXCw9kXwA
 NCMmasUMJAanJrGiBqA2tCpBRVb5hnsEh20KuyNnp3ISoA42SalmQt4vFkK7KSVO
 2Nmxv25+Ij4ESU8XcQ1eYXr12wR4Rsujkg2habt135eYN2tRl9mSMMcXC0IERWZm
 j5HB4GUkH7G7Gw==
X-ME-Sender: <xms:Ot-lYC9sAN_ansFdCkKj7kwCasekGTn6n1FdgXu5L9GGT1C94o69MA>
 <xme:Ot-lYCtmqhm1HYsinBP6VEHu25Ze3or-pXvZylF-T9_gyMobBRBOKiAQpU46dSNBI
 WcrghKMIIKT9AkG5Gk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Ot-lYIB6XHYQG9-lqTdpbVoCleU8ePzRF4MFK2OD1LO1yk9Pc7ZwAQ>
 <xmx:Ot-lYKeUUq7rkc6D1XBZOAlIquTqUx1dOuU2bwqwqQbtwnT_039TuA>
 <xmx:Ot-lYHMZ74K5qANxZB4kYa1z4T9SlK7RXq0HvDsGcaKxmr7pcpMKKA>
 <xmx:Ot-lYJVnzg5saGa8IOuUozA317JX6rKtmVyUz5TDSMj8BtI1MIwDtw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/8] ALSA: firewire-lib: code refactoring for selection of IT
 context header length
Date: Thu, 20 May 2021 13:01:49 +0900
Message-Id: <20210520040154.80450-4-o-takashi@sakamocchi.jp>
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

This commit refactors regarding to the size of CIP header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 36135296c144..87644cb0d8ab 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -526,7 +526,7 @@ static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
 }
 
 static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
-				struct fw_iso_packet *params,
+				struct fw_iso_packet *params, unsigned int header_length,
 				unsigned int data_blocks,
 				unsigned int data_block_counter,
 				unsigned int syt, unsigned int index)
@@ -537,16 +537,15 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 	payload_length = data_blocks * sizeof(__be32) * s->data_block_quadlets;
 	params->payload_length = payload_length;
 
-	if (!(s->flags & CIP_NO_HEADER)) {
+	if (header_length > 0) {
 		cip_header = (__be32 *)params->header;
 		generate_cip_header(s, cip_header, data_block_counter, syt);
-		params->header_length = 2 * sizeof(__be32);
-		payload_length += params->header_length;
+		params->header_length = header_length;
 	} else {
 		cip_header = NULL;
 	}
 
-	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+	trace_amdtp_packet(s, cycle, cip_header, payload_length + header_length, data_blocks,
 			   data_block_counter, s->packet_index, index);
 }
 
@@ -904,6 +903,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	const __be32 *ctx_header = header;
 	unsigned int events_per_period = d->events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
+	unsigned int pkt_header_length;
 	unsigned int packets;
 	int i;
 
@@ -918,6 +918,11 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
+	if (!(s->flags & CIP_NO_HEADER))
+		pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
+	else
+		pkt_header_length = 0;
+
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
 		unsigned int syt;
@@ -932,7 +937,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		else
 			syt = s->ctx_data.rx.syt_override;
 
-		build_it_pkt_header(s, desc->cycle, &template.params,
+		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
 				    desc->data_blocks, desc->data_block_counter,
 				    syt, i);
 
-- 
2.27.0

