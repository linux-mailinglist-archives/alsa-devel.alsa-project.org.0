Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170926597
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1946166D;
	Wed, 22 May 2019 16:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1946166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534854;
	bh=+cVmup2w8IHy7cV5ko2VvvOOwucJFYTHFufq8A1gtR8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faVGeft0c4gAECSJ7O1aCJOr7Qf+4YlPhmncwFJ9jEwy1oRCWNRlBJuUf/AAsBHwZ
	 TX+hmKiDN17pR/J8BAMese71xXIvEHY5B0baBK2jckJJrV0jPqh4CI9LizXesUXaiK
	 pe/sTO6O2btSled6wxGnad8GfQXQ1cgRy2hNdtg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C78F89732;
	Wed, 22 May 2019 16:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE21DF8972A; Wed, 22 May 2019 16:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5517FF8962C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5517FF8962C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BRs21rJ5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="P5TS5NxG"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8990E245D3;
 Wed, 22 May 2019 10:17:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mq+rUTj3dSI5I
 DDwx14kNxUBMxQNEA168BvvAGEgU5Q=; b=BRs21rJ5CUC4wJbPN+v3bM1PnxLBb
 th7Zr/rpRkLWOKDbAFIFxPnydGlvI++nIGOS0bXT3biKrTBetasWqtZU1a1p5uUZ
 giOGPqemvuqXCqgNvIgOLvg0Bqegm5byWGICTRKnV+m8OaZgc8w44WkYjOoO9Pol
 sLlggVw4LCKnCxV4SaSZ5VW2vKg7R+hAeDclurIehwRnamyHRv784iWpJdZOjGXR
 hafuhkERixvAPehwsuvqrqMrC+sRARI9vPojizExusG08aBOlzvu64Tfb/5P2Lte
 uWi5j2wa6nZdkHV/PXZfnkaq5E2eNgCU9/cD+lC8odHVPTgTlvZng6DUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mq+rUTj3dSI5IDDwx14kNxUBMxQNEA168BvvAGEgU5Q=; b=P5TS5NxG
 f8Rvxl3hp2tJPb4P6gT/7tnUPgQxzyFr2/vCd+xELbqRom59RK5NV7VFjqBRfxWo
 41ZE0eBP5h7RIXKGDbllNAtSlMOKHasQj56bzgwUfCEkEXtw5b2gqY3lTvHr8w/b
 03nGGDnaOgluL85zqsOs7UokA+3wXfl93ddG1Tu+yJt/DHGuh1fHmvy2gcIE2whT
 Z8pbkAX9PSv1SQBtgS4Z8KjDIleMBtY2Hwr2WOW+A4+7kuLl4GJkpB7lkAu3unF5
 +QgBGucPyoC5LUntbmmM5DnKpPTTLBaJYb8VZ8dGuqdUrY6mtocIdhh4PU2PmYwr
 2AP/7R378LmmZA==
X-ME-Sender: <xms:71nlXM12oylybYTpu9feN5C-Y3qZsJxr_1VL8NRG2snCFqd504uRRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:71nlXLqOU_qtrOZhckiRCwoD2yAJUsnsH1ZJDiGqgxScUwCP4lid9g>
 <xmx:71nlXKVk96YoHCVvaabR9hVykuxeitGfO1cGp7tkYyZ8b2GVassEEg>
 <xmx:71nlXIeAzJwgl3zX3Ud2Rvk0HhjNVfFsLqSGTh6viURsGqWbSbyl0g>
 <xmx:71nlXLUL4co6nO8SO5qjnHvetoYlPHrjB5s66lQcdwFhumlV8dWODg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E0AD380087;
 Wed, 22 May 2019 10:17:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:06 +0900
Message-Id: <20190522141708.29159-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: firewire-lib: split helper function
	to check incoming CIP header
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

A parser for CIP header in incoming packet is enough large.

This commit splits it into a helper function to better looks of packet
handler.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 100 ++++++++++++++++++++--------------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ab9dc7e9ffa4..e9976a877944 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -549,29 +549,19 @@ static int handle_out_packet_without_header(struct amdtp_stream *s,
 	return 0;
 }
 
-static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
-			    const __be32 *ctx_header, __be32 *buffer,
-			    unsigned int index)
+static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
+			    unsigned int payload_length,
+			    unsigned int *data_blocks, unsigned int *syt)
 {
-	unsigned int payload_length;
 	u32 cip_header[2];
-	unsigned int sph, fmt, fdf, syt;
-	unsigned int data_block_quadlets, data_block_counter, dbc_interval;
-	unsigned int data_blocks;
-	struct snd_pcm_substream *pcm;
-	unsigned int pcm_frames;
+	unsigned int sph;
+	unsigned int fmt;
+	unsigned int fdf;
+	unsigned int data_block_counter;
 	bool lost;
 
-	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
-	if (payload_length > s->ctx_data.tx.max_payload_length) {
-		dev_err(&s->unit->device,
-			"Detect jumbo payload: %04x %04x\n",
-			payload_length, s->ctx_data.tx.max_payload_length);
-		return -EIO;
-	}
-
-	cip_header[0] = be32_to_cpu(buffer[0]);
-	cip_header[1] = be32_to_cpu(buffer[1]);
+	cip_header[0] = be32_to_cpu(buf[0]);
+	cip_header[1] = be32_to_cpu(buf[1]);
 
 	/*
 	 * This module supports 'Two-quadlet CIP header with SYT field'.
@@ -583,9 +573,7 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		dev_info_ratelimited(&s->unit->device,
 				"Invalid CIP header for AMDTP: %08X:%08X\n",
 				cip_header[0], cip_header[1]);
-		data_blocks = 0;
-		pcm_frames = 0;
-		goto end;
+		return -EAGAIN;
 	}
 
 	/* Check valid protocol or not. */
@@ -595,19 +583,17 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		dev_info_ratelimited(&s->unit->device,
 				     "Detect unexpected protocol: %08x %08x\n",
 				     cip_header[0], cip_header[1]);
-		data_blocks = 0;
-		pcm_frames = 0;
-		goto end;
+		return -EAGAIN;
 	}
 
 	/* Calculate data blocks */
 	fdf = (cip_header[1] & CIP_FDF_MASK) >> CIP_FDF_SHIFT;
-	if (payload_length < 12 ||
+	if (payload_length < sizeof(__be32) * 2 ||
 	    (fmt == CIP_FMT_AM && fdf == AMDTP_FDF_NO_DATA)) {
-		data_blocks = 0;
+		*data_blocks = 0;
 	} else {
-		data_block_quadlets =
-			(cip_header[0] & CIP_DBS_MASK) >> CIP_DBS_SHIFT;
+		unsigned int data_block_quadlets =
+				(cip_header[0] & CIP_DBS_MASK) >> CIP_DBS_SHIFT;
 		/* avoid division by zero */
 		if (data_block_quadlets == 0) {
 			dev_err(&s->unit->device,
@@ -618,13 +604,13 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		if (s->flags & CIP_WRONG_DBS)
 			data_block_quadlets = s->data_block_quadlets;
 
-		data_blocks = (payload_length / 4 - 2) /
+		*data_blocks = (payload_length / sizeof(__be32) - 2) /
 							data_block_quadlets;
 	}
 
 	/* Check data block counter continuity */
 	data_block_counter = cip_header[0] & CIP_DBC_MASK;
-	if (data_blocks == 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC) &&
+	if (*data_blocks == 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC) &&
 	    s->data_block_counter != UINT_MAX)
 		data_block_counter = s->data_block_counter;
 
@@ -635,10 +621,12 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 	} else if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 		lost = data_block_counter != s->data_block_counter;
 	} else {
-		if (data_blocks > 0 && s->ctx_data.tx.dbc_interval > 0)
+		unsigned int dbc_interval;
+
+		if (*data_blocks > 0 && s->ctx_data.tx.dbc_interval > 0)
 			dbc_interval = s->ctx_data.tx.dbc_interval;
 		else
-			dbc_interval = data_blocks;
+			dbc_interval = *data_blocks;
 
 		lost = data_block_counter !=
 		       ((s->data_block_counter + dbc_interval) & 0xff);
@@ -651,16 +639,48 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		return -EIO;
 	}
 
-	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
-
-	syt = be32_to_cpu(buffer[1]) & CIP_SYT_MASK;
-	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
+	*syt = cip_header[1] & CIP_SYT_MASK;
 
-	if (s->flags & CIP_DBC_IS_END_EVENT)
+	if (s->flags & CIP_DBC_IS_END_EVENT) {
 		s->data_block_counter = data_block_counter;
-	else
+	} else {
 		s->data_block_counter =
-				(data_block_counter + data_blocks) & 0xff;
+				(data_block_counter + *data_blocks) & 0xff;
+	}
+
+	return 0;
+}
+
+static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
+			    const __be32 *ctx_header, __be32 *buffer,
+			    unsigned int index)
+{
+	unsigned int payload_length;
+	unsigned int syt;
+	unsigned int data_blocks;
+	struct snd_pcm_substream *pcm;
+	unsigned int pcm_frames;
+	int err;
+
+	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
+	if (payload_length > s->ctx_data.tx.max_payload_length) {
+		dev_err(&s->unit->device,
+			"Detect jumbo payload: %04x %04x\n",
+			payload_length, s->ctx_data.tx.max_payload_length);
+		return -EIO;
+	}
+
+	err = check_cip_header(s, buffer, payload_length, &data_blocks, &syt);
+	if (err < 0) {
+		if (err != -EAGAIN)
+			return err;
+		pcm_frames = 0;
+		goto end;
+	}
+
+	trace_amdtp_packet(s, cycle, buffer, payload_length, data_blocks, index);
+
+	pcm_frames = s->process_data_blocks(s, buffer + 2, data_blocks, &syt);
 end:
 	if (queue_in_packet(s) < 0)
 		return -EIO;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
