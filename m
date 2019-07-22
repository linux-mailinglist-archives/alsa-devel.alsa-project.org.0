Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1696F821
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D58176D;
	Mon, 22 Jul 2019 05:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D58176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767447;
	bh=tQ+J+g5FZbj73LOTa4+9+Ws9RxnGYcMcoYUhzYTfyKY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/DE1p/S32zzzL0i6Qpz2cp1uCsTFBPXLJOsLOl6FmrRrx52Rd2ht9JxOsW6eDm55
	 sHOg2ZPXOsjPdvhB9Zzy1nEpv31W59ieqAcygzBWP1LNiETpb7CmMUrg8+dOc572uT
	 Z/e1LlUkJDEDSlkTIRoujr4Ztp0/1nPSvGly0qHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25CAAF806E5;
	Mon, 22 Jul 2019 05:38:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C72EF8058C; Mon, 22 Jul 2019 05:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 045AEF80507
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045AEF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T+fQBFs+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k+NzfZe6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B8F421C7D;
 Sun, 21 Jul 2019 23:37:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=rdQtIuMOtNKu3
 SwIiwfasFt9StiD1N903OrKEShYz9M=; b=T+fQBFs+zpkzMi5YTHOWYjsQFcQB9
 7C+XzAuVltCEwbZjciefZ+b3dT4LtPE/QSSS2sJzt2XSobHwQges5hTAt1pJ8fDn
 CbsAysr6LtUVSRbJH76suuN1VrOh5Fla7mn6e+Ap+oa/DGYFKUDp76iKj6rojT/+
 6rAJ37HflGAQ92O6bcOhGTCPM6tYAEm04XOqcr7OMEF4dfsHRkcbNyLGtPJD7OP8
 qelqIh+TSZJHhIm1LTutXNXmkm3bk/luN+vfu2KCD/ozGxV/pcizG3k1w9v72xhX
 RJAFyXxTvV3/SKcFxm7UXp8V6UTC8+498XJNCloWyLxzpEniKaa6EnOmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rdQtIuMOtNKu3SwIiwfasFt9StiD1N903OrKEShYz9M=; b=k+NzfZe6
 cz73+la9pVPVmNbPZj5cxQUxVOQGAkPtuaLAPIKPP4rPhC9JhjUxnOBGlT6T7sd4
 Y+O0leqgZLxr8HjRUWJYIfoLuySUqBedH7bOr9yBS7h/tbNwQ4567vx1yTcABQ/j
 yRsTc8DOBoewYN3TJd/ApD83ZNBlZinUjYwm+OF4UtLAdaxsEw+A1rub4kvN1xfj
 QuIG+M6E1Ee6h0EFIYnUmdgHvHnryY9iLHAxPuTa4IeiWUPksGF+ATSJpm9Ea2Cu
 mxfTva/7Lc88mDttLzbpM9uucfVA9BXZbmln+k8/RybCZcL9mvs1Cr1lWrGPTs3Q
 4jDze6iWJdWX7A==
X-ME-Sender: <xms:hS81XXla3RijOkYcYl9_mSXMHqaYHFhZQTxP3389u5yTzewxfDoIsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduhe
X-ME-Proxy: <xmx:hS81XYYXWLY1DsrMXcw0w-jYKpgI5slG4p1xPVSpP4DvsxhGs4It2g>
 <xmx:hS81XUHW2zpNVfXhBqv_a15AzLP3mrOEeFuxkjjvEExiQ3vVf-b2Rg>
 <xmx:hS81XRJ0ubv6AVLTT16oQ2inqFzEc3sCgZJ1WayqX7dwmgs2vC8zMg>
 <xmx:hi81XciTNoFgz1PouM8-OYo9dSfZYlyenC3TMAKaWyDEmoK6CYF88g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB1DF8005B;
 Sun, 21 Jul 2019 23:37:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:07 +0900
Message-Id: <20190722033710.28107-18-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 17/20] ALSA: firewire-motu: code refactoring
	for MOTU data block processing layer
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

This is code refactoring for MOTU data block processing layer so that
it can receive list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c | 57 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 36ee2c1dd667..21c6bfdf47c0 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -117,19 +117,25 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	return 0;
 }
 
-static void read_pcm_s32(struct amdtp_stream *s,
-			 struct snd_pcm_runtime *runtime,
-			 __be32 *buffer, unsigned int data_blocks)
+static void read_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			 __be32 *buffer, unsigned int data_blocks,
+			 unsigned int pcm_frames)
 {
 	struct amdtp_motu *p = s->protocol;
-	unsigned int channels, remaining_frames, i, c;
+	unsigned int channels = p->pcm_chunks;
+	struct snd_pcm_runtime *runtime = pcm->runtime;
+	unsigned int pcm_buffer_pointer;
+	int remaining_frames;
 	u8 *byte;
 	u32 *dst;
+	int i, c;
+
+	pcm_buffer_pointer = s->pcm_buffer_pointer + pcm_frames;
+	pcm_buffer_pointer %= runtime->buffer_size;
 
-	channels = p->pcm_chunks;
 	dst = (void *)runtime->dma_area +
-			frames_to_bytes(runtime, s->pcm_buffer_pointer);
-	remaining_frames = runtime->buffer_size - s->pcm_buffer_pointer;
+				frames_to_bytes(runtime, pcm_buffer_pointer);
+	remaining_frames = runtime->buffer_size - pcm_buffer_pointer;
 
 	for (i = 0; i < data_blocks; ++i) {
 		byte = (u8 *)buffer + p->pcm_byte_offset;
@@ -147,19 +153,25 @@ static void read_pcm_s32(struct amdtp_stream *s,
 	}
 }
 
-static void write_pcm_s32(struct amdtp_stream *s,
-			  struct snd_pcm_runtime *runtime,
-			  __be32 *buffer, unsigned int data_blocks)
+static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			  __be32 *buffer, unsigned int data_blocks,
+			  unsigned int pcm_frames)
 {
 	struct amdtp_motu *p = s->protocol;
-	unsigned int channels, remaining_frames, i, c;
+	unsigned int channels = p->pcm_chunks;
+	struct snd_pcm_runtime *runtime = pcm->runtime;
+	unsigned int pcm_buffer_pointer;
+	int remaining_frames;
 	u8 *byte;
 	const u32 *src;
+	int i, c;
+
+	pcm_buffer_pointer = s->pcm_buffer_pointer + pcm_frames;
+	pcm_buffer_pointer %= runtime->buffer_size;
 
-	channels = p->pcm_chunks;
 	src = (void *)runtime->dma_area +
-			frames_to_bytes(runtime, s->pcm_buffer_pointer);
-	remaining_frames = runtime->buffer_size - s->pcm_buffer_pointer;
+				frames_to_bytes(runtime, pcm_buffer_pointer);
+	remaining_frames = runtime->buffer_size - pcm_buffer_pointer;
 
 	for (i = 0; i < data_blocks; ++i) {
 		byte = (u8 *)buffer + p->pcm_byte_offset;
@@ -303,7 +315,7 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	trace_data_block_sph(s, desc->data_blocks, desc->ctx_payload);
 	trace_data_block_message(s, desc->data_blocks, desc->ctx_payload);
@@ -312,11 +324,9 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 		read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
 
 	if (pcm) {
-		read_pcm_s32(s, pcm->runtime, desc->ctx_payload,
-			     desc->data_blocks);
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			     pcm_frames);
 		pcm_frames = desc->data_blocks;
-	} else {
-		pcm_frames = 0;
 	}
 
 	return pcm_frames;
@@ -368,8 +378,8 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	struct amdtp_motu *p = (struct amdtp_motu *)s->protocol;
-	unsigned int pcm_frames;
+	struct amdtp_motu *p = s->protocol;
+	unsigned int pcm_frames = 0;
 
 	/* TODO: how to interact control messages between userspace? */
 
@@ -377,12 +387,11 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 		write_midi_messages(s, desc->ctx_payload, desc->data_blocks);
 
 	if (pcm) {
-		write_pcm_s32(s, pcm->runtime, desc->ctx_payload,
-			      desc->data_blocks);
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			      pcm_frames);
 		pcm_frames = desc->data_blocks;
 	} else {
 		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = 0;
 	}
 
 	write_sph(s, desc->ctx_payload, desc->data_blocks);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
