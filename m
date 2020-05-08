Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE11CA25A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C391836;
	Fri,  8 May 2020 06:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C391836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912918;
	bh=3g6ZZDbJ4TiuqtBkxQmw5rgeu4/cUCykknxWcsTzTyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1WRs7D95en5ZxQcPiby14KAnqZwAVhdlC7gj5aTH8bLE2Me0q7vo7kt8NjiIunfE
	 iKmrs+/xqJFFWwMhz8fppIw+7zpb2A80o+d2DYkKXTfS6qfxN6QuBDLx8vxZksl2vQ
	 OWizeqnmkuO5uEGSbDsKsauyiCZV0Hym6QkFhzIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36F4F802D2;
	Fri,  8 May 2020 06:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC3F6F802A0; Fri,  8 May 2020 06:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53997F8025F
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53997F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XolrPOti"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SVEtpOm3"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BBF12AE3;
 Fri,  8 May 2020 00:36:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1qUQ5ZQ+VBNqI
 BakUPeFPdKjgj1lYD2IL3vDGUUw6x0=; b=XolrPOtiiO8F8ueEXnGvRL/6QB9ie
 59Eg9iwK/A57xWkUT/5xDTQOF94swjjsMpyNVhhxEePZgyF1V4s+91cuGOYQQWe+
 y0MsZRxtTJxAFEOQcn+DsqrUp7Owzw/hla3oxpAOmzPpqpk7Z9WR+klB3DXEofod
 +/AQbi0/bF2IOFPDl6rF85makIznZPb2n9+PYt0HCUnT0C/LzdDFRqOfhgUWIqUT
 Zpx9UPJ+5cNAi5UDi4shurXRZdJFS5IS4h4UuxCwER6/gigkHxb5Ia49KLLJO6ns
 v0+LIRCmE98014RKUmffmpMv4DsFGPIUufrSA4FVVyd0V6YoVYg2AUKJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1qUQ5ZQ+VBNqIBakUPeFPdKjgj1lYD2IL3vDGUUw6x0=; b=SVEtpOm3
 WA9bVBNbwfNp+RBnsZJl7UibuanH7XNCO90HKYgRjsIy7zaGyHNl/P+bZdbNov52
 XxQdjBu2+OPy2tCn/jqolOZWJ9IggUy+qo3LnQWXe5+tlkWoaSnITXKZAqtM/avP
 3G/UWPcFvD8XjPBTrx18NFI00eL7nFv1ydfIL9MU2gEDZSbJ6aYIQo6SUsfnlUBb
 PTgq8qLvsbIH262E71r7LPhatzTtQL3vhLkVsYUKMrW4RPpeOteOCsFSmjjNr9Hs
 aXw1Xb5BOl0hiurn4RdldOd3S3DFL/VZKZtMaD3jovViYzPu83YU+hzYGxjuLCwg
 VS1vPwtfGsEIfQ==
X-ME-Sender: <xms:3uG0XnZ-G_qnkhlhPxYkmMf0M68LMDA3AbZGGVy0CBrVbxP6GMFD0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeiteeuuedvle
 efvdetjeetieehueegleevvdekfeefffeuuddtieefueekueetgfenucffohhmrghinhep
 rhigrdgurghtrgenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgr
 mhhotggthhhirdhjph
X-ME-Proxy: <xmx:3uG0XtTCRzWA3ty8x7kyTeYMpH54ofzZ9dG6wpqe_gWq3RPnwnQsGA>
 <xmx:3uG0XiT_Gj-af2So1H6Xhqka0EDcgR5-0uMOmBQMO1zDPCSZyw1nRg>
 <xmx:3uG0XpQkihK1G_wKpv34qT0Ln2jkRvYIv1OQTqCb3jBkJjOXJ_u-7w>
 <xmx:3uG0XnvE9zbCIGTWoWXJ2wau1QzlSObBQR6osEhWRmJdPlohXw2bmw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A0493280068;
 Fri,  8 May 2020 00:36:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 07/10] ALSA: firewire-lib: code refactoring for data block
 calculation
Date: Fri,  8 May 2020 13:36:32 +0900
Message-Id: <20200508043635.349339-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

When calculating the number of data blocks per packet, some states are
stored in AMDTP stream structure. This is inconvenient when reuse the
calculation from non-stream structure.

This commit applies refactoring to helper function for the calculation
so that the function doesn't touch AMDTP stream structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 9041510cb6aa..efd1f2a40cf1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -339,25 +339,26 @@ void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 }
 EXPORT_SYMBOL(amdtp_stream_pcm_prepare);
 
-static unsigned int calculate_data_blocks(struct amdtp_stream *s,
-					  unsigned int syt)
+static unsigned int calculate_data_blocks(unsigned int *data_block_state,
+				bool is_blocking, bool is_no_info,
+				unsigned int syt_interval, enum cip_sfc sfc)
 {
-	unsigned int phase, data_blocks;
+	unsigned int data_blocks;
 
 	/* Blocking mode. */
-	if (s->flags & CIP_BLOCKING) {
+	if (is_blocking) {
 		/* This module generate empty packet for 'no data'. */
-		if (syt == CIP_SYT_NO_INFO)
+		if (is_no_info)
 			data_blocks = 0;
 		else
-			data_blocks = s->syt_interval;
+			data_blocks = syt_interval;
 	/* Non-blocking mode. */
 	} else {
-		if (!cip_sfc_is_base_44100(s->sfc)) {
+		if (!cip_sfc_is_base_44100(sfc)) {
 			// Sample_rate / 8000 is an integer, and precomputed.
-			data_blocks = s->ctx_data.rx.data_block_state;
+			data_blocks = *data_block_state;
 		} else {
-			phase = s->ctx_data.rx.data_block_state;
+			unsigned int phase = *data_block_state;
 
 		/*
 		 * This calculates the number of data blocks per packet so that
@@ -367,16 +368,16 @@ static unsigned int calculate_data_blocks(struct amdtp_stream *s,
 		 *    as possible in the sequence (to prevent underruns of the
 		 *    device's buffer).
 		 */
-			if (s->sfc == CIP_SFC_44100)
+			if (sfc == CIP_SFC_44100)
 				/* 6 6 5 6 5 6 5 ... */
 				data_blocks = 5 + ((phase & 1) ^
 						   (phase == 0 || phase >= 40));
 			else
 				/* 12 11 11 11 11 ... or 23 22 22 22 22 ... */
-				data_blocks = 11 * (s->sfc >> 1) + (phase == 0);
-			if (++phase >= (80 >> (s->sfc >> 1)))
+				data_blocks = 11 * (sfc >> 1) + (phase == 0);
+			if (++phase >= (80 >> (sfc >> 1)))
 				phase = 0;
-			s->ctx_data.rx.data_block_state = phase;
+			*data_block_state = phase;
 		}
 	}
 
@@ -769,7 +770,11 @@ static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 		} else {
 			desc->syt = syt_offset;
 		}
-		desc->data_blocks = calculate_data_blocks(s, desc->syt);
+		desc->data_blocks =
+			calculate_data_blocks(&s->ctx_data.rx.data_block_state,
+					      !!(s->flags & CIP_BLOCKING),
+					      desc->syt == CIP_SYT_NO_INFO,
+					      s->syt_interval, s->sfc);
 
 		if (s->flags & CIP_DBC_IS_END_EVENT)
 			dbc = (dbc + desc->data_blocks) & 0xff;
-- 
2.25.1

