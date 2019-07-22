Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9B6F80F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8BC1736;
	Mon, 22 Jul 2019 05:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8BC1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767042;
	bh=UoTtEjHIDGKto+xV39y333i6F/ysa3A1knb9Oh0gX2w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a56sHvUwP3yAwEWYqs+fdwbfqrqH1iv6gz8QXFJFf0/E8Gf3HvpAILZ/LQkePdsbt
	 t+iVSgku0os1mSYMtJNX84sehc8K9fhRBe4ZIJne0Ixr3XQ5R+AOM7vqkc6vw/5gOw
	 akMVRnoalS0efJ3hJBVjygJg+l3IQ39EvkUpOsZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB61EF805E2;
	Mon, 22 Jul 2019 05:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2ABAF803D5; Mon, 22 Jul 2019 05:37:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86722F8045F
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86722F8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LY/asUCM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jFmq2hlV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B08B821ADD;
 Sun, 21 Jul 2019 23:37:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XjlaW6V8s1wLV
 uNtd08WsvIS7tHVl4EjkTESksZ7KkI=; b=LY/asUCMCGey4j09nwqjMH2VvCCvz
 d21Wg1CPVJMvDgD17Gy/wBAAUNlozBaP94VKqeYwkjYctiv2VIPAzbN8NpKh/59u
 MY32Waq64bgJh1CqqE7Ssx7xhQgaSeDg27nLIjl1R4SWjIHIsL6Q0Ufm/GDTb3fO
 kSgmCVOVsn77xaIrHema2LcYiP66wMD8o2oT82RohSluM+s8LUIUw6WlJNPTWQKO
 KPjBTVHz/9C/WmibqCA54aoRpxVMftCpYPKLj8/C8f+VX3SDuYarmCUTvCNPM3Od
 h88swNKoqQ5xgc8Mv965xSBhP7OZYBHusITw0DbvuzMBOck3S6aNyNwTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XjlaW6V8s1wLVuNtd08WsvIS7tHVl4EjkTESksZ7KkI=; b=jFmq2hlV
 6y1NdIaipvAccXhj4ipYbFoSldwn0+/1ak1WhbqlgH29wqM9UtfVaPHKiLQ4Xleq
 3oy6DgintVrXGW15CM+MqSvnXUB6ZIRszaUlTHRTUMSDMoOjNaS7qfpcLmpwYXSS
 TnR6vbCv3JXsY8pHYyGr88ufG6AsR6AAmrf79k1ZH2KL5rTAwWyT7izSsw2PvHrE
 9mRaVvS/TOVEU2ZECjqzKbeH0S7vYS0loDeBno225d8BGQciGejI6kSKFAxTW5tD
 75+SKSV1KIj1X3v5rf2jGR/qPL38A+gof3AGvJrH2+E0o8v5Vd/drInPOFwJ2OFs
 R6IT3A9ONxCIGQ==
X-ME-Sender: <xms:di81XTlxmq0Hoqvi9UJ_OA6Xfbc4On-bvO_KgywqPg4Ofww9Mgqn8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:di81XcF0BoqjzU8g883pb6nPoSVhIoOIQSBstWw0ZCWB3SuB8qO4ew>
 <xmx:di81XbW7JGo8sARrt_nu1l0llcbvKf78mGQbldI5Sc_XXsYDbT-20w>
 <xmx:di81XTyAbWc29VZJiVQZB8WFicdQBwe52wHtuUQoumNr4odBAyeqJQ>
 <xmx:di81XeDluummhXOm9JMHgCCLD7TAML1Rb4oUmRuee1LoFrI5tsdGGw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 477A180059;
 Sun, 21 Jul 2019 23:37:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:57 +0900
Message-Id: <20190722033710.28107-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/20] ALSA: firewire-lib: pass no syt
	information to data block processing layer
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

In a previous commit, the variable passed from packet streaming layer
for syt variable is useless. This commit obsoletes it.

In my future work, the syt information is passed to data block processing
layer by another way.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         |  8 ++++----
 sound/firewire/amdtp-stream.c        |  5 ++---
 sound/firewire/amdtp-stream.h        |  3 +--
 sound/firewire/digi00x/amdtp-dot.c   |  8 ++++----
 sound/firewire/fireface/amdtp-ff.c   |  8 ++++----
 sound/firewire/motu/amdtp-motu.c     | 11 ++++-------
 sound/firewire/tascam/amdtp-tascam.c | 11 ++++-------
 7 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 03a7e0533131..21068b23d528 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -336,8 +336,8 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct amdtp_am824 *p = s->protocol;
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
@@ -358,8 +358,8 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct amdtp_am824 *p = s->protocol;
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 6242240cd8ee..c8543cdb3c8c 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -714,8 +714,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		data_blocks = calculate_data_blocks(s, syt);
 		buffer = s->buffer.packets[s->packet_index].buffer;
 		dbc = s->data_block_counter;
-		pcm_frames = s->process_data_blocks(s, buffer, data_blocks, dbc,
-						    &syt);
+		pcm_frames = s->process_data_blocks(s, buffer, data_blocks, dbc);
 
 		if (s->flags & CIP_DBC_IS_END_EVENT)
 			dbc = (dbc + data_blocks) & 0xff;
@@ -782,7 +781,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		if (err >= 0) {
 			buffer = s->buffer.packets[s->packet_index].buffer;
 			pcm_frames = s->process_data_blocks(s, buffer,
-				data_blocks, dbc, &syt);
+							    data_blocks, dbc);
 
 			if (!(s->flags & CIP_DBC_IS_END_EVENT))
 				dbc = (dbc + data_blocks) & 0xff;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 5b9d4212e202..5996cc60f166 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -99,8 +99,7 @@ typedef unsigned int (*amdtp_stream_process_data_blocks_t)(
 						struct amdtp_stream *s,
 						__be32 *buffer,
 						unsigned int data_blocks,
-						unsigned int data_block_counter,
-						unsigned int *syt);
+						unsigned int data_block_counter);
 struct amdtp_stream {
 	struct fw_unit *unit;
 	enum cip_flags flags;
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 5c12973c2652..c296d1017ed3 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -330,8 +330,8 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
@@ -350,8 +350,8 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 71879922ab39..31a60dff94ac 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -103,8 +103,8 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
@@ -121,8 +121,8 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 683873699885..30d5f87119cc 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -299,8 +299,8 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct amdtp_motu *p = s->protocol;
 	struct snd_pcm_substream *pcm;
@@ -361,15 +361,12 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct amdtp_motu *p = (struct amdtp_motu *)s->protocol;
 	struct snd_pcm_substream *pcm;
 
-	/* Not used. */
-	*syt = 0xffff;
-
 	/* TODO: how to interact control messages between userspace? */
 
 	if (p->midi_ports)
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 8fba6fb8ba8a..bc1f2d2120b4 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -166,8 +166,8 @@ static void read_status_messages(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm;
 
@@ -181,14 +181,11 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-			__be32 *buffer, unsigned int data_blocks,
-			unsigned int data_block_counter, unsigned int *syt)
+				__be32 *buffer, unsigned int data_blocks,
+				unsigned int data_block_counter)
 {
 	struct snd_pcm_substream *pcm;
 
-	/* This field is not used. */
-	*syt = 0x0000;
-
 	pcm = READ_ONCE(s->pcm);
 	if (pcm)
 		write_pcm_s32(s, pcm, buffer, data_blocks);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
