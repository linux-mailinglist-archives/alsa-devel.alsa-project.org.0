Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C569389C4B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76E7166F;
	Thu, 20 May 2021 06:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76E7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483477;
	bh=HocBdUxJy2GCDD6P/4lUERgXb7gZS1yASIduDCi1NBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0O/4wfh+vljtu8NPFNyWA7YFXbVDNMgYuK0EgQLyfK+tSR0bgmtIe3wwSaIdQ1Yc
	 xz4s3S/526nbkyMiqqNUpgc2u8qwPgyj20Rc9qWGQ2A4uH0HjraZR4gyKC14OOHQUp
	 Q5VmI0uJFYaTGIAU16UxWLZ7nZ+i9x8RRydNkKnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B30EF804AA;
	Thu, 20 May 2021 06:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8D7F80475; Thu, 20 May 2021 06:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5302F80217
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5302F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sle6foJA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XJ0T/ljA"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A5DCA5C0103;
 Thu, 20 May 2021 00:02:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 May 2021 00:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zmwM190SEAe4M
 b8bvrU0gl7jNG1ypEhRd46vPJqq2fM=; b=sle6foJAxW68NgSpQZL7tdbxkLHRf
 cJUo6lnda0ca1PCDV3q3WBcZxSByViz7CQY0Zk4AlU11PnBaZXQA/2n975e/NY1D
 e+pwXLA9Iy2iCN1YBYhJOfDHtkCJxU3yFG/kDgRRviuzS0+6vbQlmc/THeLMzJfY
 TEaQln8IcpSAdqxtmJ/IGpKaUNFp+p5U02HTFl5u4rEYTpmOuSYpRRarCF6ufJmC
 KrDo4S0uIV78qoQ16MMpAqi15qBXfqEjAmUDLDEpc88xKnHZKNxSyq1nIfwaM4Bh
 zWfAWtS8q8W/gJgHHCHqTIISjOwnokwI6NrvlkGdVHEFQBgOAE5aCmtNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zmwM190SEAe4Mb8bvrU0gl7jNG1ypEhRd46vPJqq2fM=; b=XJ0T/ljA
 ExirfIEo6643a26forj27hqLDuT50uVTMp9zZE7lug1yYBb6QvDcFxNiuSlYulHK
 UWBxWQqyoA0g9PifcIEepkxwK6cOEYOv2U/H74F3kspV8SqhOU2vAr9yuGjFEXBj
 3zpSP2xKZBUgcx/DndzsTkAVOu9qt7bhyXBS1pKKXRibixyTt2Y0lIv35oWxIeqb
 8+iap/u28tt7ip6CV73SZ4llkpcS9tHO8P5+IOu4UrZODhciBVxJRm5Q1RKOrrHr
 I76lyWPCyfR95dq7D49qoMcO3Tp0ShK1+4CGPOT8iHHwP0rt+uk8KhwjN9c61uYo
 ngbvRmKUeGEONg==
X-ME-Sender: <xms:Od-lYKYUeoh5oeNF1TFO7JjzV1u1-FZ5rpYUSTbKWiUmFONHnDcEHA>
 <xme:Od-lYNYKhg_sQPcwx4eZVSTmPYXOplXH-qOaX83MC-n9KV26OavKCQ8jiI7NDIkKk
 Zb3WcDTCFaIwk00p5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Od-lYE85d5KUPwGpWMgo3o7DwbGq_SnAnlvi_iVtTpHzrC2nFsDnJQ>
 <xmx:Od-lYMrM9xVLNzd_IJaCEsvw5x5fNqrdX7Ard9HvCVnQDuj9EJXL-A>
 <xmx:Od-lYFpy-y5_M7nGI10SEgyiyfy-JS-jmL8_hDbshC03ZPfCsBseOg>
 <xmx:Od-lYESRrm_AlOzZT-8Yb6hMqdqKLrBoAq6wmsbJw1PZFn5gcO_f9g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/8] ALSA: firewire-lib: code refactoring for calculation of
 context payload
Date: Thu, 20 May 2021 13:01:48 +0900
Message-Id: <20210520040154.80450-3-o-takashi@sakamocchi.jp>
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

It's convenient to calculate the size of context payload apart from
the size of isochronous packet payload.

This commit adds a helper function for it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 37 ++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f178cb5f2df3..36135296c144 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -313,6 +313,19 @@ int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
 }
 EXPORT_SYMBOL(amdtp_stream_set_parameters);
 
+// The CIP header is processed in context header apart from context payload.
+static int amdtp_stream_get_max_ctx_payload_size(struct amdtp_stream *s)
+{
+	unsigned int multiplier;
+
+	if (s->flags & CIP_JUMBO_PAYLOAD)
+		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
+	else
+		multiplier = 1;
+
+	return s->syt_interval * s->data_block_quadlets * sizeof(__be32) * multiplier;
+}
+
 /**
  * amdtp_stream_get_max_payload - get the stream's packet size
  * @s: the AMDTP stream
@@ -322,16 +335,14 @@ EXPORT_SYMBOL(amdtp_stream_set_parameters);
  */
 unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 {
-	unsigned int multiplier = 1;
-	unsigned int cip_header_size = 0;
+	unsigned int cip_header_size;
 
-	if (s->flags & CIP_JUMBO_PAYLOAD)
-		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
 	if (!(s->flags & CIP_NO_HEADER))
 		cip_header_size = CIP_HEADER_SIZE;
+	else
+		cip_header_size = 0;
 
-	return cip_header_size +
-		s->syt_interval * s->data_block_quadlets * sizeof(__be32) * multiplier;
+	return cip_header_size + amdtp_stream_get_max_ctx_payload_size(s);
 }
 EXPORT_SYMBOL(amdtp_stream_get_max_payload);
 
@@ -1140,27 +1151,21 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	}
 
 	// initialize packet buffer.
-	max_ctx_payload_size = amdtp_stream_get_max_payload(s);
 	if (s->direction == AMDTP_IN_STREAM) {
 		dir = DMA_FROM_DEVICE;
 		type = FW_ISO_CONTEXT_RECEIVE;
-		if (!(s->flags & CIP_NO_HEADER)) {
-			max_ctx_payload_size -= CIP_HEADER_SIZE;
+		if (!(s->flags & CIP_NO_HEADER))
 			ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
-		} else {
+		else
 			ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
-		}
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
 		ctx_header_size = 0;	// No effect for IT context.
-
-		if (!(s->flags & CIP_NO_HEADER))
-			max_ctx_payload_size -= IT_PKT_HEADER_SIZE_CIP;
 	}
+	max_ctx_payload_size = amdtp_stream_get_max_ctx_payload_size(s);
 
-	err = iso_packets_buffer_init(&s->buffer, s->unit, queue_size,
-				      max_ctx_payload_size, dir);
+	err = iso_packets_buffer_init(&s->buffer, s->unit, queue_size, max_ctx_payload_size, dir);
 	if (err < 0)
 		goto err_unlock;
 	s->queue_size = queue_size;
-- 
2.27.0

