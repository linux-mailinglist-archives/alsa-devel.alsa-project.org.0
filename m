Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BD280C7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 17:16:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1B91664;
	Thu, 23 May 2019 17:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1B91664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558624600;
	bh=eF3I6phcHsStD3ZIKhP7GnJ9es73E1imaGzr1B3PLTo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQ32HcjfkxVvJWfpYgL4OPnDtKjUFfQ9w9LmmHNG+7vynhll/PYeN9kne0/Lz/9Mm
	 dwR5T8WXew/d3dkdJzmEhDmXKgG7ZqKUwM16kSqbDrla40qwdS3WYr27p9DLcMUEYv
	 smC1iXnqkJJHsUhQPJ1hh8TX4lMM84CZqUlP3nkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 325D5F89707;
	Thu, 23 May 2019 17:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EACAF8079B; Thu, 23 May 2019 17:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC0FF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC0FF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fSAgoKBX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="a6cbG1y+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D5FC37DDC;
 Thu, 23 May 2019 11:14:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 May 2019 11:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+ES85RX80tVDi
 6mCI4BZCDSoT+9xAXAkgtSrOyrL8i4=; b=fSAgoKBXHkWjYfxfa2MgjA9jUorGq
 6XGOiGOvna16CULjCyd5+xVjthSCOPMKXGFZMGBLWysfRxZNKaJh0HPcvxyUkQOY
 sicWoKiIcm9oUPyAByZ2q9Ci0UtqugXYdAdXBdcn1TvknlIv3JW4vak5HpK+4cI0
 DBXNiaNcwdIhKD98cfu5YXwbiOIYiLPnKzEIkhraybsZ+3Piae2tYnivjtJLEdSr
 mk7mkLIm9VHDBTBSAmT7oyMx6ObaeOrte0WXzURweOhfSVZUwvI9O/I6ZwGvz7Bf
 c5rfylmlmJ3v6OZ6HeWwLPbRC1Jj5lW7wDbiAWBABp9Aqhdkwlk2aVyNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+ES85RX80tVDi6mCI4BZCDSoT+9xAXAkgtSrOyrL8i4=; b=a6cbG1y+
 jJIUA+Y2kv8FNW+UA2YyeBhZ+IBBmO/PS01Yvfi6yqeAZGnL+vAV/1cwAvRw3Kfi
 R6H853lAN3U/sbrjUbrNuUKX3Q1cy/GwSBZ2GW/X7B3cN+se6E//O5m0UaryBofw
 fnbyLPXIij2UhmHPc+I5cObz0IN7gL/y+SApQi30zpL9pWDMUOjit4yFM5w2Uzjy
 5PP9FM47QoQ8Lm1ZMih0HAVFWHOzLagTfY4FzLZcXKv4pmYqpQ6Ti7MTnpVL64mm
 FJqraalAqOvmHcUn9qPgCu6KDF1+C6McyIh06iCM8hcL9lO6SXECAh6EwyACgu1c
 ghObVs9/sKR2Wg==
X-ME-Sender: <xms:5rjmXJNjmhwNq3JSabnNFM75ZQRkSxKPjo995Y1peqoObQaRcEsOCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5rjmXHK1tfh-RCFcvPjHRRnyaxe82EOaDHhw0khkQF4Xvp3A9dDyRw>
 <xmx:5rjmXMErs4OI0ulcmwA_6UngPJSmkwTlB00kosFlZbtkDYZqo3xeww>
 <xmx:5rjmXAANMp8eD2WnM5b7E4xw0vOeC8IA-Sy_v6n_yc4djk7K6m8mPQ>
 <xmx:57jmXLmj9rcJNoRpTSRPDX91oQwTT4d4PfPuSHNKR4YIDsKGsx0fyA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92FA938008B;
 Thu, 23 May 2019 11:14:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 00:14:37 +0900
Message-Id: <20190523151440.5127-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/4] ALSA: firewire-lib: split helper function
	to generate CIP header
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

This is minor code refactoring to split a function to generate CIP
header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 2d9c764061d1..25985663bb2b 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -477,6 +477,19 @@ static inline int queue_in_packet(struct amdtp_stream *s)
 	return queue_packet(s, s->ctx_data.tx.max_ctx_payload_length);
 }
 
+static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
+				unsigned int syt)
+{
+	cip_header[0] = cpu_to_be32(READ_ONCE(s->source_node_id_field) |
+				(s->data_block_quadlets << CIP_DBS_SHIFT) |
+				((s->sph << CIP_SPH_SHIFT) & CIP_SPH_MASK) |
+				s->data_block_counter);
+	cip_header[1] = cpu_to_be32(CIP_EOH |
+			((s->fmt << CIP_FMT_SHIFT) & CIP_FMT_MASK) |
+			((s->ctx_data.rx.fdf << CIP_FDF_SHIFT) & CIP_FDF_MASK) |
+			(syt & CIP_SYT_MASK));
+}
+
 static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 			     const __be32 *ctx_header, __be32 *buffer,
 			     unsigned int index)
@@ -495,14 +508,7 @@ static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
 
-	buffer[0] = cpu_to_be32(READ_ONCE(s->source_node_id_field) |
-				(s->data_block_quadlets << CIP_DBS_SHIFT) |
-				((s->sph << CIP_SPH_SHIFT) & CIP_SPH_MASK) |
-				s->data_block_counter);
-	buffer[1] = cpu_to_be32(CIP_EOH |
-			((s->fmt << CIP_FMT_SHIFT) & CIP_FMT_MASK) |
-			((s->ctx_data.rx.fdf << CIP_FDF_SHIFT) & CIP_FDF_MASK) |
-			(syt & CIP_SYT_MASK));
+	generate_cip_header(s, buffer, syt);
 
 	if (!(s->flags & CIP_DBC_IS_END_EVENT))
 		s->data_block_counter =
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
