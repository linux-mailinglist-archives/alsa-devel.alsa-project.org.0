Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157EB38D2D3
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 03:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F2516BD;
	Sat, 22 May 2021 03:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F2516BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621647438;
	bh=H2ZwPCej+fErmRUM5KUY7uww8ZQMbn42untcqDwztUo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGa4j3Nq+L31a4kksgja7Bzn2W04LOhhozwuF+63OjFmHx4qA63+1jfRSL7iC4VTN
	 TuXYGfi5aDVj/n10cMevaA2J7EIS7e1Y7kOZ3gC58dJ1WpcvaBlLtpvIU206Mh9JyQ
	 qnq6EmJevGFLZyia674HayHUi9DA09W8yU/ME/K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D575F804D8;
	Sat, 22 May 2021 03:33:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E39DF80257; Sat, 22 May 2021 03:33:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D744CF800DF
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 03:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D744CF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="F3ohb6cU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="plYguljF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B9DC5C011A;
 Fri, 21 May 2021 21:33:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 21 May 2021 21:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bZZywP0mtjbMB
 QmsPlCcjWAkEBdwxMscO6uarEuPA1w=; b=F3ohb6cUGKYr84JfOJMCeYOAD3B+y
 9XR5ePSmncegekUE+nnUc2yrlXIWyH8oVps5drVCssMOs5YrSyDZ3J+6koMtsJ+U
 wEBdd2ak0fJUGxwjM4iiJXD34e2lyk9WKjef+J3uTVV75Qiyvs8k78wQtI7dKUpw
 FJOyBWGoyRVYJFLP3T4/G5yUb7XpnUoakhkDgjp6NHgB0mu/IjMXgQnTLa1c/KR9
 Xh6jxfFx/AKGfgaRcKhvJ7Wg72f67qrM/1u1I03dJqUst6peN9eV+jUuJ48ykuBE
 LqybEDte/YgQsyNwJZr4qPYq6sHM7A6PHfO0IgE54rTibvez8kiN8oicg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bZZywP0mtjbMBQmsPlCcjWAkEBdwxMscO6uarEuPA1w=; b=plYguljF
 /07zYTWKrfBmZ8GUZ39IKgbAIB/TOoOE8PgaZ29lTbWj+TrzAF/xAOZz15IFHv6k
 nRI8Bc8PLXTU6wO5sRIEfBpHowIjiXhoe1henFmNOGWKqjuF2V8QOdY1ZkQ+WqoI
 UB174FzaaBDo4/rQnPcI6/YS1NsuXSv0SeVosRgbNcyn2BxgLUPeS9zSSqXg4s+O
 6u+hDorXnn/eRumZC5WWJwXiCOyx6eLQp6gYbCifZ5HOB1gVQtK5WolmLKcmDF44
 cCT5pktfXB1sHbsHq7WvIQddQrrzBIaTIhwSGHKUXiSh699Efj6Wsqb1NRHhiQU9
 be5E7XrgibvqCQ==
X-ME-Sender: <xms:W1-oYC9hwrGh1WcAnFWDE3R_XkdnWPC9gMKdlYVCEu8Dlt8K1gvtrw>
 <xme:W1-oYCu3XfTxYa92OvPMod0g_7dSCOoBEIl93S0sAby-dM-fYYuTDwUF4tQA2kpVt
 H8m2FlBDuxS8OMY1-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieetueeuvd
 elfedvteejteeiheeugeelvedvkeeffeffuedutdeifeeukeeutefgnecuffhomhgrihhn
 pehrgidruggrthgrnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgr
 mhhotggthhhirdhjph
X-ME-Proxy: <xmx:W1-oYID3e1vTBn8-8DcfYMCZWkH3DDnWmvEUC_3yuK0QyWbmIYlGWg>
 <xmx:W1-oYKfNCMP4gdc9Q5xvCLN6OWY_xXHBtL_6qFFB_akW9SztbSyMYw>
 <xmx:W1-oYHNeu5cmWByCtUlx73_O1ugIzwH3Ghi-l7KVJGLU0jB5795zgg>
 <xmx:W1-oYJWEgDdXvKPDCG5vnwIuYRNk1STf5tzZVMwzu8XE5XKxsApMJg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 21:33:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/6] ALSA: firewire-lib: code refactoring for generation of
 data block sequence
Date: Sat, 22 May 2021 10:33:02 +0900
Message-Id: <20210522013303.49596-6-o-takashi@sakamocchi.jp>
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

This commit dissolves sequence generator in terms of the number of data
blocks per packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 73 +++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 77ae75e79a43..26209513199a 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -357,26 +357,41 @@ void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 }
 EXPORT_SYMBOL(amdtp_stream_pcm_prepare);
 
-static unsigned int calculate_data_blocks(unsigned int *data_block_state,
-				bool is_blocking, bool is_no_info,
-				unsigned int syt_interval, enum cip_sfc sfc)
+static void pool_blocking_data_blocks(struct amdtp_stream *s, struct seq_desc *descs,
+				      const unsigned int seq_size, unsigned int seq_tail,
+				      unsigned int count)
 {
-	unsigned int data_blocks;
+	const unsigned int syt_interval = s->syt_interval;
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		struct seq_desc *desc = descs + seq_tail;
 
-	/* Blocking mode. */
-	if (is_blocking) {
-		/* This module generate empty packet for 'no data'. */
-		if (is_no_info)
-			data_blocks = 0;
+		if (desc->syt_offset != CIP_SYT_NO_INFO)
+			desc->data_blocks = syt_interval;
 		else
-			data_blocks = syt_interval;
-	/* Non-blocking mode. */
-	} else {
+			desc->data_blocks = 0;
+
+		seq_tail = (seq_tail + 1) % seq_size;
+	}
+}
+
+static void pool_ideal_nonblocking_data_blocks(struct amdtp_stream *s, struct seq_desc *descs,
+					       const unsigned int seq_size, unsigned int seq_tail,
+					       unsigned int count)
+{
+	const enum cip_sfc sfc = s->sfc;
+	unsigned int state = s->ctx_data.rx.data_block_state;
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		struct seq_desc *desc = descs + seq_tail;
+
 		if (!cip_sfc_is_base_44100(sfc)) {
 			// Sample_rate / 8000 is an integer, and precomputed.
-			data_blocks = *data_block_state;
+			desc->data_blocks = state;
 		} else {
-			unsigned int phase = *data_block_state;
+			unsigned int phase = state;
 
 		/*
 		 * This calculates the number of data blocks per packet so that
@@ -388,18 +403,19 @@ static unsigned int calculate_data_blocks(unsigned int *data_block_state,
 		 */
 			if (sfc == CIP_SFC_44100)
 				/* 6 6 5 6 5 6 5 ... */
-				data_blocks = 5 + ((phase & 1) ^
-						   (phase == 0 || phase >= 40));
+				desc->data_blocks = 5 + ((phase & 1) ^ (phase == 0 || phase >= 40));
 			else
 				/* 12 11 11 11 11 ... or 23 22 22 22 22 ... */
-				data_blocks = 11 * (sfc >> 1) + (phase == 0);
+				desc->data_blocks = 11 * (sfc >> 1) + (phase == 0);
 			if (++phase >= (80 >> (sfc >> 1)))
 				phase = 0;
-			*data_block_state = phase;
+			state = phase;
 		}
+
+		seq_tail = (seq_tail + 1) % seq_size;
 	}
 
-	return data_blocks;
+	s->ctx_data.rx.data_block_state = state;
 }
 
 static unsigned int calculate_syt_offset(unsigned int *last_syt_offset,
@@ -467,24 +483,15 @@ static void pool_ideal_seq_descs(struct amdtp_stream *s, unsigned int count)
 	struct seq_desc *descs = s->ctx_data.rx.seq.descs;
 	unsigned int seq_tail = s->ctx_data.rx.seq.tail;
 	const unsigned int seq_size = s->ctx_data.rx.seq.size;
-	const unsigned int syt_interval = s->syt_interval;
-	const enum cip_sfc sfc = s->sfc;
-	const bool is_blocking = !!(s->flags & CIP_BLOCKING);
-	int i;
 
 	pool_ideal_syt_offsets(s, descs, seq_size, seq_tail, count);
 
-	for (i = 0; i < count; ++i) {
-		struct seq_desc *desc = s->ctx_data.rx.seq.descs + seq_tail;
-
-		desc->data_blocks = calculate_data_blocks(&s->ctx_data.rx.data_block_state,
-				is_blocking, desc->syt_offset == CIP_SYT_NO_INFO,
-				syt_interval, sfc);
-
-		seq_tail = (seq_tail + 1) % seq_size;
-	}
+	if (s->flags & CIP_BLOCKING)
+		pool_blocking_data_blocks(s, descs, seq_size, seq_tail, count);
+	else
+		pool_ideal_nonblocking_data_blocks(s, descs, seq_size, seq_tail, count);
 
-	s->ctx_data.rx.seq.tail = seq_tail;
+	s->ctx_data.rx.seq.tail = (seq_tail + count) % seq_size;
 }
 
 static void update_pcm_pointers(struct amdtp_stream *s,
-- 
2.27.0

