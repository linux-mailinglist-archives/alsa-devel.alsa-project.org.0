Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEE6F81D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D621733;
	Mon, 22 Jul 2019 05:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D621733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767370;
	bh=3PGIDCfWC9L+ZlnY2dbMl1tYPiYojG2O0uDTMOa7BwU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBFqcWDp5/prZ19O4GXh8Wo89lIh37FFMpoaHHytzrpPVy6RitIcaNM2vybFnxNVj
	 D+DTvBp+cNJ24Gj2q9EOZJN6ULqH1uFx800jGnqQjExI9lYrQlQpLFnGWUnia5h18v
	 8dAlVc3truw+f8qVAjBU5fH4RvC15A+X1jgIFXWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD56F80677;
	Mon, 22 Jul 2019 05:38:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A56BF8053B; Mon, 22 Jul 2019 05:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58AFF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58AFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mU9+Out1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mDGd/x72"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B13E20931;
 Sun, 21 Jul 2019 23:37:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3I0twYiM7bD06
 FUkghPeXdtC/OcUJJejjCPj/mbr7po=; b=mU9+Out1z9NrGFwiXNjFE4+tDgs7Z
 N32Z8hEF8Tgg3bMR8OU+uXab0DVvKsyLVyFXrEOIsiK32sSQ5r8LRjjk8U1Yv2e7
 EwJN1AMLpjh2INypIBSWljJkO8qOhEWhrbQlSEs94HF1Pe6zpEiL3qA2ZZSgkQeK
 n5KIHq99Ki/GI/he1B2KAdoZVmTt9ugmS5/wWwo4TeNncXWLt5WhHvRn6wLCgcXY
 ApdB5EioW2BNK69qG8wfOritZyyInEtrpoR/8KtKGSg8SrDoAKDaiaawTQ3ZLfw6
 //zt2a0a5iIbIuC33KAM1IwO8+FYAcKcP7JcbdmnENR0pLx+VeYMj725w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3I0twYiM7bD06FUkghPeXdtC/OcUJJejjCPj/mbr7po=; b=mDGd/x72
 +tAzEy4x/yUS3CDTepDoLHesYVOjll9mjfNXNCwoLjyUCAi8SvTXrfSy0cb8x9ih
 4UUDe1lExhKm0H69zV4aZFGRSQYtWgQYf1Lz2Yg7KxsaCNv4x2V9amedVeAhfiYs
 15bpTmF/gNPoWNpte1Fg3pSBkvmkEtx7RJPM2czcnX+QWOLU/qpd4Fo8e478XLbN
 1MjI/iHwWmhsecR15Rxx6EOQ/bsKHXt9AO51dOxACyRBq59pNXWlP4jVfgfvnQ40
 U/6jYeQEBh9V8o1SoL3I+c2grmvUNEACDF0JF9h8f0In1zwcyjSbbbEJaWwbsaLS
 lTzCGseu505mdw==
X-ME-Sender: <xms:gi81XYCxHlan9NXRDizQQuMng9nnyNaV9bzLafRVoRbn5GTUqjmUZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:gi81Xcga998Ry9VYFn_kGa8PGJZ_fdHiFS-LF9mK8MdaUc-UHvqBpQ>
 <xmx:gi81Xf7L4DDOn4k5L9ra3BmNlgbHADJ6f7ym5k0bwPJ8XyrohUIB1g>
 <xmx:gi81XW8rCTtGtHgBhlZmuaP6c9my40ydJ9GPo_P3L1NYVs_gkSd4gQ>
 <xmx:gy81XRfuYKEvHRCqgWFYo2BbkVbNHHWpv0tnRcJC8pXOpjSZ25gawQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AFDC80059;
 Sun, 21 Jul 2019 23:37:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:05 +0900
Message-Id: <20190722033710.28107-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 15/20] ALSA: firewire-digi00x: code refactoring
	for DOT data block processing layer
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

This is code refactoring for DOT data block processing layer so that
it can receive list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/amdtp-dot.c | 45 +++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 83ac4b37f26d..cef5caf97236 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -143,17 +143,23 @@ int amdtp_dot_set_parameters(struct amdtp_stream *s, unsigned int rate,
 }
 
 static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
-			  __be32 *buffer, unsigned int frames)
+			  __be32 *buffer, unsigned int frames,
+			  unsigned int pcm_frames)
 {
 	struct amdtp_dot *p = s->protocol;
+	unsigned int channels = p->pcm_channels;
 	struct snd_pcm_runtime *runtime = pcm->runtime;
-	unsigned int channels, remaining_frames, i, c;
+	unsigned int pcm_buffer_pointer;
+	int remaining_frames;
 	const u32 *src;
+	int i, c;
+
+	pcm_buffer_pointer = s->pcm_buffer_pointer + pcm_frames;
+	pcm_buffer_pointer %= runtime->buffer_size;
 
-	channels = p->pcm_channels;
 	src = (void *)runtime->dma_area +
-			frames_to_bytes(runtime, s->pcm_buffer_pointer);
-	remaining_frames = runtime->buffer_size - s->pcm_buffer_pointer;
+				frames_to_bytes(runtime, pcm_buffer_pointer);
+	remaining_frames = runtime->buffer_size - pcm_buffer_pointer;
 
 	buffer++;
 	for (i = 0; i < frames; ++i) {
@@ -169,17 +175,23 @@ static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
 }
 
 static void read_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
-			 __be32 *buffer, unsigned int frames)
+			 __be32 *buffer, unsigned int frames,
+			 unsigned int pcm_frames)
 {
 	struct amdtp_dot *p = s->protocol;
+	unsigned int channels = p->pcm_channels;
 	struct snd_pcm_runtime *runtime = pcm->runtime;
-	unsigned int channels, remaining_frames, i, c;
+	unsigned int pcm_buffer_pointer;
+	int remaining_frames;
 	u32 *dst;
+	int i, c;
+
+	pcm_buffer_pointer = s->pcm_buffer_pointer + pcm_frames;
+	pcm_buffer_pointer %= runtime->buffer_size;
 
-	channels = p->pcm_channels;
 	dst  = (void *)runtime->dma_area +
-			frames_to_bytes(runtime, s->pcm_buffer_pointer);
-	remaining_frames = runtime->buffer_size - s->pcm_buffer_pointer;
+				frames_to_bytes(runtime, pcm_buffer_pointer);
+	remaining_frames = runtime->buffer_size - pcm_buffer_pointer;
 
 	buffer++;
 	for (i = 0; i < frames; ++i) {
@@ -333,13 +345,12 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			     pcm_frames);
 		pcm_frames = desc->data_blocks;
-	} else {
-		pcm_frames = 0;
 	}
 
 	read_midi_messages(s, desc->ctx_payload, desc->data_blocks);
@@ -351,14 +362,14 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			      pcm_frames);
 		pcm_frames = desc->data_blocks;
 	} else {
 		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = 0;
 	}
 
 	write_midi_messages(s, desc->ctx_payload, desc->data_blocks,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
