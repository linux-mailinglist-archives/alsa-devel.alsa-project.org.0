Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C563B6F80A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE051721;
	Mon, 22 Jul 2019 05:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE051721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766954;
	bh=diXCqLVdX7f0dlraaLo6Pt3ECiORRNU6igiiVD7MdI8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbLeEpJKZ0Senw1/MjvL1yRvT25IPgeVoYtwSMTmtLiC5Gla1DTZ+6X7IkqHCGow/
	 JpxqqcBF7EpiFnfr5uN48V9dCigsWS/TzKqV45S9pLT95glCVfRAI/wc8SONKKxRSJ
	 SZLySGiwJMMHVOP93snplvSw9DJt0ZKUegA4TMqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DED1F80534;
	Mon, 22 Jul 2019 05:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E86D1F8048F; Mon, 22 Jul 2019 05:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD413F803F4
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD413F803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ilVMMNvd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="N3aglY9r"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A56E821FE9;
 Sun, 21 Jul 2019 23:37:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=G5tSXp4Ujz8Zw
 nA8JZrtqmjwPp+3tXw73rBTb0oDkx8=; b=ilVMMNvdFtDQ4ajwe8N8JfOAtE4Mf
 WiY7yUKxlXwHk7NIyi4awvmCGJaQfm2v5+c38Ams7LKQVWKPsB7GbONG0prPVxWE
 F9KKaDb2wS00XAZxFhodstZmL14qHG/tpCYe4wvtdZ3qurSDGfgHPpFbtVuY2wbq
 IC+Jsz0Dj/SKZycFbz74mH9zZS8beMmZMbzVkAzDw+Z0l4vTl8Ah/HL0zTp8KQ/n
 Y3ma+9npe4YhoWwCjBz7+u0BMcOpFXMfq+Q28AeTujM/krHUXGdtx0/d7qwRKBE4
 vrRKbAMvpjgbQ1KOYc/w8Ln1kdqJgqfsVlhYiwpTM6vW0i/5jLLPeHDvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=G5tSXp4Ujz8ZwnA8JZrtqmjwPp+3tXw73rBTb0oDkx8=; b=N3aglY9r
 XdON8ktGUetHLS7LObcrpKCFy54T6RUSmPFIDy2mvpoEkK+X12lOEc2L/f6blO4J
 hOSkM0zjoPEC2+sRSrDXSC7Ke4VklxToPE/UMT+gtDZQWkrF0iFzdePYxUlkRjPl
 1922dMwyZvescw+30pv7JyH2kI7TUsvcb8wRsuKyqT60/y5YUeWHLAFZ1pEvNAfF
 PfDS7taA+UIVqQ0o0gtDzl0398SxPMDSrCQap7z8fJAgNpGFVGqUTUtmrVkvRzWR
 TXJsPQwTaf1sFu9CUyqYqZ+cfUf3uyDQ16qOvsjCK9kASpwqDLWyM+EAOEXzXgQ4
 H0pABKtZehPQcA==
X-ME-Sender: <xms:cy81XXb9wqJ5HVv8bVX81t4C8JM8ItHXajTjTk6cW67NXbmD72wt5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:cy81XTWtEg3j4gZMCPHidO9BGN9Jxx4C9uglHBR1AT4BSwQ8B1HLig>
 <xmx:cy81XVl7VnBSlnwK2T9XqAb_CGASHvY-LSTTsCk3XawXzmf4hA98Cg>
 <xmx:cy81XWAJ75Nn0K1GFhPNfKl24E-XUt4zR0f-AXJK35Vp52drV38nLA>
 <xmx:cy81XSR0RIerWBnIHAGqLvJrprdGSXuUuilidKPQpSl4zzD2iBEEfQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4323F80059;
 Sun, 21 Jul 2019 23:37:22 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:55 +0900
Message-Id: <20190722033710.28107-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/20] ALSA: firewire-lib: operate data block
	counter in top level of processing for IR context
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

In ALSA IEC 61883-1/6 packet streaming engine, two types of data block
counter are supported. This commit applies code refactoring to make it
explicitly for IR context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 53 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c89083ccd729..3435bef97a8b 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -512,13 +512,14 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 			    unsigned int payload_length,
-			    unsigned int *data_blocks, unsigned int *dbc,
-			    unsigned int *syt)
+			    unsigned int *data_blocks,
+			    unsigned int *data_block_counter, unsigned int *syt)
 {
 	u32 cip_header[2];
 	unsigned int sph;
 	unsigned int fmt;
 	unsigned int fdf;
+	unsigned int dbc;
 	bool lost;
 
 	cip_header[0] = be32_to_cpu(buf[0]);
@@ -570,16 +571,16 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 	}
 
 	/* Check data block counter continuity */
-	*dbc = cip_header[0] & CIP_DBC_MASK;
+	dbc = cip_header[0] & CIP_DBC_MASK;
 	if (*data_blocks == 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC) &&
-	    s->data_block_counter != UINT_MAX)
-		*dbc = s->data_block_counter;
+	    *data_block_counter != UINT_MAX)
+		dbc = *data_block_counter;
 
-	if ((*dbc == 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
-	    s->data_block_counter == UINT_MAX) {
+	if ((dbc == 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
+	    *data_block_counter == UINT_MAX) {
 		lost = false;
 	} else if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
-		lost = *dbc != s->data_block_counter;
+		lost = dbc != *data_block_counter;
 	} else {
 		unsigned int dbc_interval;
 
@@ -588,13 +589,13 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 		else
 			dbc_interval = *data_blocks;
 
-		lost = *dbc != ((s->data_block_counter + dbc_interval) & 0xff);
+		lost = dbc != ((*data_block_counter + dbc_interval) & 0xff);
 	}
 
 	if (lost) {
 		dev_err(&s->unit->device,
 			"Detect discontinuity of CIP: %02X %02X\n",
-			s->data_block_counter, *dbc);
+			*data_block_counter, dbc);
 		return -EIO;
 	}
 
@@ -606,10 +607,10 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       const __be32 *ctx_header,
 			       unsigned int *payload_length,
-			       unsigned int *data_blocks, unsigned int *syt,
-			       unsigned int index)
+			       unsigned int *data_blocks,
+			       unsigned int *data_block_counter,
+			       unsigned int *syt, unsigned int index)
 {
-	unsigned int dbc;
 	const __be32 *cip_header;
 	int err;
 
@@ -625,7 +626,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = ctx_header + 2;
 		err = check_cip_header(s, cip_header, *payload_length,
-				       data_blocks, &dbc, syt);
+				       data_blocks, data_block_counter, syt);
 		if (err < 0)
 			return err;
 	} else {
@@ -635,16 +636,12 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       s->data_block_quadlets;
 		*syt = 0;
 
-		if (s->data_block_counter != UINT_MAX)
-			dbc = s->data_block_counter;
-		else
-			dbc = 0;
+		if (*data_block_counter == UINT_MAX)
+			*data_block_counter = 0;
 	}
 
-	s->data_block_counter = dbc;
-
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
-			   s->data_block_counter, index);
+			   *data_block_counter, index);
 
 	return err;
 }
@@ -761,6 +758,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		u32 cycle;
 		unsigned int payload_length;
 		unsigned int data_blocks;
+		unsigned int dbc;
 		unsigned int syt;
 		__be32 *buffer;
 		unsigned int pcm_frames = 0;
@@ -769,22 +767,23 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		int err;
 
 		cycle = compute_cycle_count(ctx_header[1]);
+		dbc = s->data_block_counter;
 		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
-					  &data_blocks, &syt, i);
+					  &data_blocks, &dbc, &syt, i);
 		if (err < 0 && err != -EAGAIN)
 			break;
 
 		if (err >= 0) {
 			buffer = s->buffer.packets[s->packet_index].buffer;
 			pcm_frames = s->process_data_blocks(s, buffer,
-				data_blocks, s->data_block_counter, &syt);
+				data_blocks, dbc, &syt);
 
-			if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
-				s->data_block_counter += data_blocks;
-				s->data_block_counter &= 0xff;
-			}
+			if (!(s->flags & CIP_DBC_IS_END_EVENT))
+				dbc = (dbc + data_blocks) & 0xff;
 		}
 
+		s->data_block_counter = dbc;
+
 		if (queue_in_packet(s, &params) < 0)
 			break;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
