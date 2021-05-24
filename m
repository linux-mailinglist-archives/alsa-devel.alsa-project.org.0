Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2D38DFD1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 05:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E5F81699;
	Mon, 24 May 2021 05:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E5F81699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621826183;
	bh=Ke+2tzFzl9y9p1oDXkdXtn997PaoN3rOSMIHcfZ+oB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPsjun+CvrcgwpGnTQEw/Ue1nhcZWUoZwqzCo3ORIgAalBIdnd849uvco6cRJrsYC
	 zQv4v9at6y39gp2xynBRXLUdZZ1kWDqJ9qPT3yllXFo21HZptrnrDlK4sCtwtzX2MM
	 Yw/zwrgaIqj/PPIHx27gZxopz39Qvdusz/maG4IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B3BF80424;
	Mon, 24 May 2021 05:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BA05F8042F; Mon, 24 May 2021 05:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A169CF80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 05:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A169CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="P+6zasU+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="orbZHFLq"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D6DAA5C011B;
 Sun, 23 May 2021 23:13:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 23 May 2021 23:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cGf7iftU6iqAz
 sGi2Vc+kz0f8+HmFkwkviHJ2L41SfQ=; b=P+6zasU+XpbRMtXrNcBBho8Nd2Ah6
 koczi5RLAWv1tI6eE4//bXcnf5ZRBS8oa8RE00rXXg+RWAjnlx3xXBiwSrL1EdYQ
 R8voh4vYsbRhSE5p7Q0DBPI+SDbcZNz+rfZzxNeq60htW2tG+h397KN1AeKv0Vht
 OGAyc8fuP9uoZv8y6NfTReiL2TiWpK3c28owKYmZIlxE1WeyXPGODvgakeDnn71x
 ZEpzOHA020Mkmf/EuQgjOD6BBKJzInekJmtTPuAc34IS07RLUZSnV0vPMmtJl+gg
 22TN6vHQOG22BPXME0AoozrPq0gvehx8Avd50QibTUAoD41hp4/rvRWdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cGf7iftU6iqAzsGi2Vc+kz0f8+HmFkwkviHJ2L41SfQ=; b=orbZHFLq
 GLeW3gCDMrJk6UGDDScAE/UCJm51+7MolgiS2qHHmOXYRc7+VZRRPwcDsFp4QyF2
 12fNOKXfNdfk3jMJmFZjOxU4dCHvfupPYLR0oPbHT5+oi47/LDSdld31YjF7UrKS
 qZimm91lw7l8xh5Ddh4iIkxz07uUedu2SQIhht2PYznRL/UkNMqkQz7UX6+xPc1u
 SQSl2TMdwX50Dxt1fk+OobAu4grlCAbMVNha7mm4ttzh80CRP8e9YMFSZf7L68GU
 kKSdlQktjclq1joT2sZaNpEStdBU2KHdQGh6x3bvqqgWjLf1i2a4CXvFpsLsaiSU
 OAsKaZcreFEMsw==
X-ME-Sender: <xms:8hmrYFmi7-UatUXl3N8U9iDM9vhlJXOBJTFaWSqncCvW5SyjC0X8Kw>
 <xme:8hmrYA0y5lKOZ1B5YoJwA_XvfMROoy9AIerDsbIG4-bYsjeJL-7pMGRmESK5Mmk6x
 SATXPoqj-DILMgXPQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8hmrYLpVV35h-yr9vXlFhNvDMFc-Jv5KHW8LGl1AoZV8oBsjaSqXKg>
 <xmx:8hmrYFkIkNpIEMuFb6iBGVm9zJh_7bGXqogExXWRyQhSs2cyV19qmA>
 <xmx:8hmrYD1II5OMpSYweC5j2pRcRGt6wM7SIhoiEeslUcBGHyeRXqLG2A>
 <xmx:8hmrYA-wr5kdoCM7ijLztEAOVlh1QMxRttYUM_NoMJ9Xs5seiOLgAg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 23:13:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 2/4] ALSA: firewire-lib: obsolete callbacked member
Date: Mon, 24 May 2021 12:13:44 +0900
Message-Id: <20210524031346.50539-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
References: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
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

The member of callbacked in AMDTP stream structure is not used anymore.
Instead, ready_processing member is used to wake up yielding task of user
process.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 9 ++-------
 sound/firewire/amdtp-stream.h | 3 +--
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 84608b856322..68ffbc33f692 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -110,7 +110,6 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->packet_index = 0;
 
 	init_waitqueue_head(&s->ready_wait);
-	s->callbacked = false;
 
 	s->fmt = fmt;
 	s->process_ctx_payloads = process_ctx_payloads;
@@ -1365,7 +1364,8 @@ static void irq_target_callback_skip(struct fw_iso_context *context, u32 tstamp,
 	d->processing_cycle.rx_start = cycle;
 }
 
-// this is executed one time.
+// This is executed one time. For in-stream, first packet has come. For out-stream, prepared to
+// transmit first packet.
 static void amdtp_stream_first_callback(struct fw_iso_context *context,
 					u32 tstamp, size_t header_length,
 					void *header, void *private_data)
@@ -1373,10 +1373,6 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	struct amdtp_stream *s = private_data;
 	struct amdtp_domain *d = s->domain;
 
-	// For in-stream, first packet has come.
-	// For out-stream, prepared to transmit first packet
-	s->callbacked = true;
-
 	if (s->direction == AMDTP_IN_STREAM) {
 		context->callback.sc = drop_tx_packets_initially;
 	} else {
@@ -1536,7 +1532,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if ((s->flags & CIP_EMPTY_WITH_TAG0) || (s->flags & CIP_NO_HEADER))
 		tag |= FW_ISO_CONTEXT_MATCH_TAG0;
 
-	s->callbacked = false;
 	s->ready_processing = false;
 	err = fw_iso_context_start(s->context, -1, 0, tag);
 	if (err < 0)
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index d3ba2e1c1522..34294776f9e8 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -183,8 +183,7 @@ struct amdtp_stream {
 
 	// To start processing content of packets at the same cycle in several contexts for
 	// each direction.
-	bool callbacked:1;
-	bool ready_processing:1;
+	bool ready_processing;
 	wait_queue_head_t ready_wait;
 	unsigned int next_cycle;
 
-- 
2.27.0

