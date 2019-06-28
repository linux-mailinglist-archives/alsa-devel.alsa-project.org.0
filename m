Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050F593DA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 07:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E7F61670;
	Fri, 28 Jun 2019 07:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E7F61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561701419;
	bh=9+s5PuJ+bkjTSrBP0c9zd+lhorUeYpSvkoTG3Us+ykc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMp6FNp2Ob1rSmWcemgv78gULZPK075HG+0ySsCqS05FiW+tfj/FF9SIzNitYSFeR
	 APt8Fn04V/uGUqikqwnft5NPiyjh8KW+SjM6inARkGdaYGsn2u1sNeh24QzwX1NEVS
	 ADnkxPDT4qGjJ3X0Nln46f1eRkz5G1Wko459AUB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6BBDF89730;
	Fri, 28 Jun 2019 07:53:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C5CCF896CB; Fri, 28 Jun 2019 07:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238C0F80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 07:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238C0F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="c4vZl2+1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TGm9qt4L"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A9E5B21C4D;
 Fri, 28 Jun 2019 01:53:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 28 Jun 2019 01:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JCqUvIvCYr8cX
 cWx1KXwpUizQ4qCvN1asM5ajB7ShhM=; b=c4vZl2+1kJWJPJbPczkxuRh4DvzEB
 ncJ1qfkD/OXU9Gp+SV3EhZNZL8FiHcj+m4BC4G1nE/rTlVV3Q+cCNeMHwcGDBfYa
 pY4XVaRB0zVheXxy3oo8qhF+sy0CY267MZMNGBIMnMnoWl7dA9BYfnil/XJjOQnq
 6+5SbmxzhghVyJgYQHheKFzIyJESMd98j5I0ZWrK4ACb+xrT5lhbj20RFIFL3cBR
 zTOhI0gbynvkvt9bmb5oNaMiT6nT0snph2U6EGhGmqsMLWPEVbsUanGYE+BWU0sb
 RfKe5W48SSrPdnsh4Ekn2a65Wyc4NKZvoRC9mhA27Ej0VX5Zih0E1kIDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=JCqUvIvCYr8cXcWx1KXwpUizQ4qCvN1asM5ajB7ShhM=; b=TGm9qt4L
 NcISxUcxK/Wwooh1RWduQOuLC0NFe9uEuQqkeRroYJLFsMFk4Xb1ZYnFYDgKtXLQ
 Xqq9fmConhvRpF0TO/G7V08KkJZnmbZ19+qtSUFBQcFFPGAIpIOBKQHsDJJUxE56
 z1Vb1tnaha3oLk/fIljionmR3uaYekm7lnnGbzTpev+LTUxwbZ5MrlCEbUJPgXOa
 ns+y2esy/WOq1Yz1RG5jhDx/H/Lu6LWfPG9CFnBWnLTAP5R0n+uboOOzqs6GYaGv
 pyepBd+ZvTl5aD5ZXm56sJLM/yukK8VvC+s/tiIKdHFXST9SRdFrYMoSlsmfzfYZ
 kUIQxsD7kHvUbw==
X-ME-Sender: <xms:YasVXeqR1gRAueipZ81fSQtSc45-IGRGJykirUmzg7X-2RgpbdbQwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:YasVXUaf_iAEtzxfqOnYidojhtGopC880FHI8QflrXN3OTYlTkHY-Q>
 <xmx:YasVXYMkHq9TuoxFXci4E8SNziziTo3RqMXlFG-9Pr6vP8ENbUgMSw>
 <xmx:YasVXV74O-n4BBPc8TX_fuUR9i4_Me7HVukr48pXYg2mSFBQCfOTlQ>
 <xmx:YasVXaK_t--Pw4_uyWU_OnlnyYcmeRAIcLmj8zolnY22b5bu6RJkHA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C478380075;
 Fri, 28 Jun 2019 01:53:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 28 Jun 2019 14:53:30 +0900
Message-Id: <20190628055331.1427-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628055331.1427-1-o-takashi@sakamocchi.jp>
References: <20190628055331.1427-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/2] ALSA: firewire-lib: cache next
	data_block_counter after probing tracepoints event for IR context
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

For debugging purpose, ALSA IEC 61883-1/6 engine has tracepoints event.
In current implementation, next data block counter is stored as current
data block counter before probing the event for IR isoc context. It's not
good to check current packet parameter.

This commit changes to assign the next data block counter after probing
the event.

Besides, Fireworks devices has a quirk to transfer isoc packet with
data block counter for the last data block. For this quirk, the
assignment is done before calling data block processing layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 48 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 3aef6a78a188..b341bd86605e 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -519,13 +519,13 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 			    unsigned int payload_length,
-			    unsigned int *data_blocks, unsigned int *syt)
+			    unsigned int *data_blocks, unsigned int *dbc,
+			    unsigned int *syt)
 {
 	u32 cip_header[2];
 	unsigned int sph;
 	unsigned int fmt;
 	unsigned int fdf;
-	unsigned int data_block_counter;
 	bool lost;
 
 	cip_header[0] = be32_to_cpu(buf[0]);
@@ -577,17 +577,17 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 	}
 
 	/* Check data block counter continuity */
-	data_block_counter = cip_header[0] & CIP_DBC_MASK;
+	*dbc = cip_header[0] & CIP_DBC_MASK;
 	if (*data_blocks == 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC) &&
 	    s->data_block_counter != UINT_MAX)
-		data_block_counter = s->data_block_counter;
+		*dbc = s->data_block_counter;
 
 	if (((s->flags & CIP_SKIP_DBC_ZERO_CHECK) &&
-	     data_block_counter == s->ctx_data.tx.first_dbc) ||
+	     *dbc == s->ctx_data.tx.first_dbc) ||
 	    s->data_block_counter == UINT_MAX) {
 		lost = false;
 	} else if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
-		lost = data_block_counter != s->data_block_counter;
+		lost = *dbc != s->data_block_counter;
 	} else {
 		unsigned int dbc_interval;
 
@@ -596,26 +596,18 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 		else
 			dbc_interval = *data_blocks;
 
-		lost = data_block_counter !=
-		       ((s->data_block_counter + dbc_interval) & 0xff);
+		lost = *dbc != ((s->data_block_counter + dbc_interval) & 0xff);
 	}
 
 	if (lost) {
 		dev_err(&s->unit->device,
 			"Detect discontinuity of CIP: %02X %02X\n",
-			s->data_block_counter, data_block_counter);
+			s->data_block_counter, *dbc);
 		return -EIO;
 	}
 
 	*syt = cip_header[1] & CIP_SYT_MASK;
 
-	if (s->flags & CIP_DBC_IS_END_EVENT) {
-		s->data_block_counter = data_block_counter;
-	} else {
-		s->data_block_counter =
-				(data_block_counter + *data_blocks) & 0xff;
-	}
-
 	return 0;
 }
 
@@ -626,6 +618,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			       unsigned int *syt, unsigned int index)
 {
 	const __be32 *cip_header;
+	unsigned int dbc;
 	int err;
 
 	*payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
@@ -640,22 +633,33 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = ctx_header + 2;
 		err = check_cip_header(s, cip_header, *payload_length,
-				       data_blocks, syt);
-		if (err < 0)
-			return err;
+				       data_blocks, &dbc, syt);
+		if (err < 0) {
+			if (err != -EAGAIN)
+				return err;
+
+			*data_blocks = 0;
+			dbc = s->data_block_counter;
+		}
 	} else {
 		cip_header = NULL;
+		err = 0;
 		*data_blocks = *payload_length / sizeof(__be32) /
 			       s->data_block_quadlets;
+		dbc = s->data_block_counter;
 		*syt = 0;
-		s->data_block_counter =
-				(s->data_block_counter + *data_blocks) & 0xff;
 	}
 
+	if (err >= 0 && s->flags & CIP_DBC_IS_END_EVENT)
+		s->data_block_counter = dbc;
+
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
 			   index);
 
-	return 0;
+	if (err >= 0 && !(s->flags & CIP_DBC_IS_END_EVENT))
+		s->data_block_counter = (dbc + *data_blocks) & 0xff;
+
+	return err;
 }
 
 // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
