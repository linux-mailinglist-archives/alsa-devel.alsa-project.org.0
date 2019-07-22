Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE486F81B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 513131732;
	Mon, 22 Jul 2019 05:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 513131732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767289;
	bh=lLK/31ggkkVKbLx1wwksRKTDRPbvT3j67evFLHqa0a0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPuuyb1M7aH3B+WHf4hWvdALeuG1qcuP+wOMNweR9ciGRfh/ST1qvPkY7/z6XT3MV
	 IvXEoOHAPtnQBX37clZ2FFEyj+qlNC8Juq/Og8JfXGhxFY30Q3T+k8gM1NsSWshMTs
	 9AcxKzbQ/SeamNb+IdqsDREn3P2RE+75oaIlvseI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DDC7F8065C;
	Mon, 22 Jul 2019 05:38:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAFA5F80533; Mon, 22 Jul 2019 05:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66873F80507
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66873F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GPV+fPq4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NJmuQEl1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8AF0521F14;
 Sun, 21 Jul 2019 23:37:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=NMIN+BL8GV6ZU
 S8JS5bU/UJlsaVjtaP/LxUALDF692U=; b=GPV+fPq4IalH5WD6PtHuUB1D3JiT1
 8UVOfj6A9/oX2if9D/8oFBjnwnGp24eJIHrq/tln0dD+4ax6eCX4CQAoqkm82TqX
 sGXG4ckkNZye0a7v+ke2jVGTiXpZYHv8cemnDlwoGpn0IUmK9dAmPrZ9I19lIJLQ
 GQYIfUtjHvmXV1r+XKqkBJ43hLeKTL6f1r+oAnuSxcFibibKDGlf0Bnry3v22uzO
 4V0tQf573hfXzGUHzsmh9ocFePOhRLjgew4e5dXQ9sMBHaCeqhX8AkpWTxmXZFpk
 hDAOUWCLlMfMTtK87LLi5U7uH0oXggzw7XxoORxFNurmtnMyY5CqkO9Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NMIN+BL8GV6ZUS8JS5bU/UJlsaVjtaP/LxUALDF692U=; b=NJmuQEl1
 8c8MGifWyASOe1GZTD5EnNy4mE9rCPsFssdcJmkZT/UQdFHHU0zID4eh1FB5g2wT
 j7YjKaZDvsSD+nutP3Fr8sJOCUADtZGaK+SFGgGty4cE30IQXxBoeVUto9YkWqzw
 DVnyPAYQjPt0sJzBN1EhEgdzRMylc/V3pD99N3bQA/KTaK5fUfn3Hj4Nh2m+Pyiu
 3TMsZVi9+c5W2OKMRs5PIhYtCtj4/cckOp8yfiiqSPiR5LrrDXR/If+UYAPs+Gyf
 lOtc82slDQlQIiCyLyFxmsEOJ1QnWxCpRTRzYCMvo14jmOGzUNM/BICaumJjTwWr
 KPpHX7HL1G4K2g==
X-ME-Sender: <xms:gS81XSozKWJwjwh1g-qCILGlgEk2qfWU0ucLeTl1jkB1CZ_N7V6DOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:gS81XQ17g5oUZsV7puuR3Nn11OoiG3Degfu_mfa_zeC81oThNgaejQ>
 <xmx:gS81XZBbX8jDIBO6SWJKai6SR9v8hPlzLuC3DJV_FCT7_tLNt-8YnQ>
 <xmx:gS81XQfaYy-IYRs9ReSfe0wGFhGP52AnRBQrvz97v1rfkD_wtup7fA>
 <xmx:gS81XTsNhjjZ4UKx8vFbtlV--1PUW4ozhahma07e9xRprGK9Dotylg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B95B8005B;
 Sun, 21 Jul 2019 23:37:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:04 +0900
Message-Id: <20190722033710.28107-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 14/20] ALSA: firewire-lib: code refactoring for
	AM824 data block processing layer
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

This is code refactoring for AM824 data block processing layer so that
it can receive list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c | 51 +++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index ff089ffa3374..5d2952a1a9b2 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -146,19 +146,24 @@ void amdtp_am824_set_midi_position(struct amdtp_stream *s,
 }
 EXPORT_SYMBOL_GPL(amdtp_am824_set_midi_position);
 
-static void write_pcm_s32(struct amdtp_stream *s,
-			  struct snd_pcm_substream *pcm,
-			  __be32 *buffer, unsigned int frames)
+static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			  __be32 *buffer, unsigned int frames,
+			  unsigned int pcm_frames)
 {
 	struct amdtp_am824 *p = s->protocol;
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
 
 	for (i = 0; i < frames; ++i) {
 		for (c = 0; c < channels; ++c) {
@@ -172,19 +177,24 @@ static void write_pcm_s32(struct amdtp_stream *s,
 	}
 }
 
-static void read_pcm_s32(struct amdtp_stream *s,
-			 struct snd_pcm_substream *pcm,
-			 __be32 *buffer, unsigned int frames)
+static void read_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			 __be32 *buffer, unsigned int frames,
+			 unsigned int pcm_frames)
 {
 	struct amdtp_am824 *p = s->protocol;
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
 
 	for (i = 0; i < frames; ++i) {
 		for (c = 0; c < channels; ++c) {
@@ -340,14 +350,14 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			      pcm_frames);
 		pcm_frames = desc->data_blocks * p->frame_multiplier;
 	} else {
 		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = 0;
 	}
 
 	if (p->midi_ports) {
@@ -363,13 +373,12 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 					   struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			     pcm_frames);
 		pcm_frames = desc->data_blocks * p->frame_multiplier;
-	} else {
-		pcm_frames = 0;
 	}
 
 	if (p->midi_ports) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
