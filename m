Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E790738797E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723E716FD;
	Tue, 18 May 2021 15:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723E716FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343108;
	bh=aP6QAdoO9B5f2IVmNueno5MfG30V3TDARb5yXc2Q8Zw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsImt4rLjExsWY/ge7e+r1RNAUuQGK0zIdeB11WHklfnruA1/1ihDMwt/3poOxqUN
	 rwc4R2EXhoryy5wkNQBCOhreXZWEQCTwDM7hmxzEqOlP7dpkT38kIf9cdnOI40Qu6L
	 QHNv+lj7KSvVCh3wd0CKlQhIZHWfn897DiwD1SaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFD6F804CF;
	Tue, 18 May 2021 15:01:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7E72F80475; Tue, 18 May 2021 15:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9609CF80272
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9609CF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="4A4ZO7NP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ejvnBjTh"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EB50C5C0219;
 Tue, 18 May 2021 09:01:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 18 May 2021 09:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EO05u6KqPf/q1
 3T7LEYaijNw5JMQxVVIZOU0w5sSPf8=; b=4A4ZO7NP4m01gCAuAED7SlpislFBe
 LMLuT1IloohlkAYdhbTM/Uf9ASC1Ed+rsLff4qC23wlGcsEzuYLs1ZczP/CH9A7X
 xlhuv1f0qUVkJ0ZL6lf6s4fUffWk/8y/4evL5ccYKtm1yATDD3Ols5S7nMYrkSD8
 1d6KOcpKT+hAaEh/UfdlG9P7qyAKuyaVFjYZUS8PHEfyAYAjDTvhOUJ7f8heuoQf
 etyXNJMEpjI83fM/JBIG0+pPcoPQXiYybQ7eVqsXc1u1zWa48hFp0hFlAHCNeEWu
 hAkDxf0m2fLL5b8onaTccNNo2CYMf6Zl9FIdy5a+eXUUdQGiMFlL6CM7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EO05u6KqPf/q13T7LEYaijNw5JMQxVVIZOU0w5sSPf8=; b=ejvnBjTh
 JcTtbnDgqpURvlaS3IhkKEGDL9o/uJm9RoVX6GZE62xg9UVrmgmkmQOzEQBDmxFF
 54RT6u6kRSYxrQsRYO8yGJ6i8MXGEvueC032wv8JlhUuzjppPg3vu+6VzHXjKZk9
 FnEO//Ubcz1K7g+HBK2bWMc1Ob8F4mbGzc0VhaNOcY3jaD/G5vyW7Qu1pvN83xGt
 Oc9kb1JxbmTNYsPSI0PXtnJFzOXTo5HpLLOWxoeihUlFRpR/mAmuLYMVe+TpZBdQ
 0kqRj9hFh+SaGiJehx9pSRSDYP+RJ3Rk5TQt7fzs0v5kXpkM1AFw3CYra2FcxM38
 iGOQyylsSCtVHA==
X-ME-Sender: <xms:jLqjYOzpWHp7Gn1kaFCPgElETIh9Spgo9v8GjNqq72xIFnCclUjd0A>
 <xme:jLqjYKS9i49HFALtieTJJPHoK5UFiUvVRagGiJyVq9SujSBikXjl5lL7WTJ-TLhlW
 mAgV-DKjXyH14ggVts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jLqjYAVvca1krO0M4aoUoJz6I6G1Ifxd7SjqHUTqtlw16Al0gNA1qQ>
 <xmx:jLqjYEgvirYKYhEUByiVIEVorRqJ0jMnqlUp12VNP7w8FqSfagIykg>
 <xmx:jLqjYACW9CEyNZM4iruLYRqHqtIqC1TBOYiQXr6F5G6NjoVVkrFT1g>
 <xmx:jbqjYLqHmR7ejuhxVjkotU8mRm4n-XFa8r8xzenO4PeX3-wVLkPBow>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/8] ALSA: firewire-lib: code refactoring for parser of IR
 context header
Date: Tue, 18 May 2021 22:00:44 +0900
Message-Id: <20210518130048.146596-6-o-takashi@sakamocchi.jp>
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

This commit refactors regarding to function argument for the length of
isochronous packet payload.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ed8aea3cb1a1..1c530678e56a 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -632,33 +632,33 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 
 static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       const __be32 *ctx_header,
-			       unsigned int *payload_length,
 			       unsigned int *data_blocks,
 			       unsigned int *data_block_counter,
 			       unsigned int *syt, unsigned int packet_index, unsigned int index)
 {
+	unsigned int payload_length;
 	const __be32 *cip_header;
 	unsigned int cip_header_size;
 	int err;
 
-	*payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
+	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
 
 	if (!(s->flags & CIP_NO_HEADER))
 		cip_header_size = 8;
 	else
 		cip_header_size = 0;
 
-	if (*payload_length > cip_header_size + s->ctx_data.tx.max_ctx_payload_length) {
+	if (payload_length > cip_header_size + s->ctx_data.tx.max_ctx_payload_length) {
 		dev_err(&s->unit->device,
 			"Detect jumbo payload: %04x %04x\n",
-			*payload_length, cip_header_size + s->ctx_data.tx.max_ctx_payload_length);
+			payload_length, cip_header_size + s->ctx_data.tx.max_ctx_payload_length);
 		return -EIO;
 	}
 
 	if (cip_header_size > 0) {
-		if (*payload_length >= cip_header_size) {
+		if (payload_length >= cip_header_size) {
 			cip_header = ctx_header + 2;
-			err = check_cip_header(s, cip_header, *payload_length, data_blocks,
+			err = check_cip_header(s, cip_header, payload_length, data_blocks,
 					       data_block_counter, syt);
 			if (err < 0)
 				return err;
@@ -671,15 +671,14 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	} else {
 		cip_header = NULL;
 		err = 0;
-		*data_blocks = *payload_length / sizeof(__be32) /
-			       s->data_block_quadlets;
+		*data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
 		*syt = 0;
 
 		if (*data_block_counter == UINT_MAX)
 			*data_block_counter = 0;
 	}
 
-	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
+	trace_amdtp_packet(s, cycle, cip_header, payload_length, *data_blocks,
 			   *data_block_counter, packet_index, index);
 
 	return err;
@@ -727,14 +726,13 @@ static int generate_device_pkt_descs(struct amdtp_stream *s,
 	for (i = 0; i < packets; ++i) {
 		struct pkt_desc *desc = descs + i;
 		unsigned int cycle;
-		unsigned int payload_length;
 		unsigned int data_blocks;
 		unsigned int syt;
 
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
 
-		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
-					  &data_blocks, &dbc, &syt, packet_index, i);
+		err = parse_ir_ctx_header(s, cycle, ctx_header, &data_blocks, &dbc, &syt,
+					  packet_index, i);
 		if (err < 0)
 			return err;
 
-- 
2.27.0

