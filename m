Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A826F805
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F80172F;
	Mon, 22 Jul 2019 05:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F80172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766909;
	bh=mkRALvc4QmQZESfxGQBcBIT7/ZeITyhEN3lV/qJC7Is=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGRmzQAdn3+agQLjdq/YWkxFYs+usrkIxKpZvbWmJHdaUuS4K8/TNCL5NzZYWkCbU
	 oP3YgxG6RJ6e1r3xYa2LZSsApNjBDzs3cechXIT9KEoKBgtZtORVCX8rNX/yEi5uiW
	 4jtd7Zkip6u55mfC739rWhMVdShnCmMVuLfhd4t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A51E2F80518;
	Mon, 22 Jul 2019 05:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FEFF8015B; Mon, 22 Jul 2019 05:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFB1AF803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB1AF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QOZqIr+m"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="x9DAwsU4"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B4F0E21FD7;
 Sun, 21 Jul 2019 23:37:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nUdyH2n2y8UD9
 3DqDcHvc1XSMjKZwlj5JfXwoPR3vrY=; b=QOZqIr+mQURWXVFAxnVqqJ7KVINzE
 25W/WmCTpbOvYMGFb0AYdQsAiVdTicBXGkR59N7Sm+NOavl+e1yCcA7qWvVqtWOh
 PjIoFXbIeyvBUKJubVFVliu6mlsEQNZ2hAJbUSPdtyQC76iWx/Nc3jbKx1mmxm5E
 caEIdnj64CJShxquyYi4oIyW1CvZnbwAh+bR1odbsdmOrVNqLx/4WijJc1isTRfd
 E3HYBAIHqoOHETiWBy1DSWfT+m0dLn/0Dbg5TXqdbblWMiNcIImTX0C8rsYcGfNS
 wVYxDXkA35YX2NNIbxTQ+lYn7yDckuVtND489RlehFrAMqk0pvT2K+k0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nUdyH2n2y8UD93DqDcHvc1XSMjKZwlj5JfXwoPR3vrY=; b=x9DAwsU4
 +LHqMfRqjR/ZqO8Uiu8VUCbO20mDs9hhAMLrb6jSkHSfERfwiv86qzq0R9AXLGSB
 rtfPbYFE/KrD0qYoYDs2CgYUxbUu842dCTxx4//8MDVqR1GPFT0hEpHF/x0SFcae
 gZfMa5xXIXbtkcdARO1G6EWbwHHbH4t0vvn2zzq/YnOcT5FCCTEqh/5XhyGpj29h
 KW9NcZFnCGZRMnHwVniBoi/oKtgnCsEYt9EOKXD7z8lQQo7GIeHeP7tMiniRP1VP
 yt7HeX4kfO7K8QJkS9wmV+tbVA0l7K1Hyo3XJEEZgIqkgsXr3yNKqG0/VOK8rtLf
 z7dc3AvLWoVJtw==
X-ME-Sender: <xms:cC81XUi0IRtg_jgrp3dL2ChOlXvNiix_2Ym6mS1Xazy7QKife7TJoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cC81XVJEsaLqVpZBb9xI5noh6zXYpTbu567FwoVjnpWwST3jxfOVbw>
 <xmx:cC81XbnQDGpyBq16F7Rezu5n8CFXfkNOIuyrxcFPLwQE3OYzuiVtpA>
 <xmx:cC81XVOT8dUenabRjM7AcJe64Z6dWw3LW-ABVitcniy8R_KPTeLB0Q>
 <xmx:cC81XaF5MOqeiHY9LY5bu1q4ZBItO7nsF6b3KCDvOJ-ZZUKSZLqDKA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A2D380059;
 Sun, 21 Jul 2019 23:37:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:53 +0900
Message-Id: <20190722033710.28107-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/20] ALSA: firewire-lib: pass data block
	counter to data block processing layer
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

This is a preparation for future commit that 'struct
amdtp_stream.data_block_count' does not represent the value of
data block count for current data block.

However, data block count is required for calculation of sequence index
in sequence-multiplied data channel. Some of data block processing layer
require it; e.g. for AM824 data block.

This commit passes data block count to the processing layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         | 24 +++++++++++++-----------
 sound/firewire/amdtp-stream.c        |  4 ++--
 sound/firewire/amdtp-stream.h        |  1 +
 sound/firewire/digi00x/amdtp-dot.c   | 16 +++++++---------
 sound/firewire/fireface/amdtp-ff.c   | 10 ++++------
 sound/firewire/motu/amdtp-motu.c     |  8 ++++----
 sound/firewire/tascam/amdtp-tascam.c | 10 ++++------
 7 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 99c567ded7a3..03a7e0533131 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -284,7 +284,7 @@ static void midi_rate_use_one_byte(struct amdtp_stream *s, unsigned int port)
 }
 
 static void write_midi_messages(struct amdtp_stream *s, __be32 *buffer,
-				unsigned int frames)
+			unsigned int frames, unsigned int data_block_counter)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int f, port;
@@ -293,7 +293,7 @@ static void write_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 	for (f = 0; f < frames; f++) {
 		b = (u8 *)&buffer[p->midi_position];
 
-		port = (s->data_block_counter + f) % 8;
+		port = (data_block_counter + f) % 8;
 		if (f < MAX_MIDI_RX_BLOCKS &&
 		    midi_ratelimit_per_packet(s, port) &&
 		    p->midi[port] != NULL &&
@@ -311,8 +311,8 @@ static void write_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 	}
 }
 
-static void read_midi_messages(struct amdtp_stream *s,
-			       __be32 *buffer, unsigned int frames)
+static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
+			unsigned int frames, unsigned int data_block_counter)
 {
 	struct amdtp_am824 *p = s->protocol;
 	int len;
@@ -323,7 +323,7 @@ static void read_midi_messages(struct amdtp_stream *s,
 		unsigned int port = f;
 
 		if (!(s->flags & CIP_UNALIGHED_DBC))
-			port += s->data_block_counter;
+			port += data_block_counter;
 		port %= 8;
 		b = (u8 *)&buffer[p->midi_position];
 
@@ -335,8 +335,9 @@ static void read_midi_messages(struct amdtp_stream *s,
 	}
 }
 
-static unsigned int process_rx_data_blocks(struct amdtp_stream *s, __be32 *buffer,
-					   unsigned int data_blocks, unsigned int *syt)
+static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct amdtp_am824 *p = s->protocol;
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
@@ -351,13 +352,14 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s, __be32 *buffe
 	}
 
 	if (p->midi_ports)
-		write_midi_messages(s, buffer, data_blocks);
+		write_midi_messages(s, buffer, data_blocks, data_block_counter);
 
 	return pcm_frames;
 }
 
-static unsigned int process_tx_data_blocks(struct amdtp_stream *s, __be32 *buffer,
-					   unsigned int data_blocks, unsigned int *syt)
+static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct amdtp_am824 *p = s->protocol;
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
@@ -371,7 +373,7 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s, __be32 *buffe
 	}
 
 	if (p->midi_ports)
-		read_midi_messages(s, buffer, data_blocks);
+		read_midi_messages(s, buffer, data_blocks, data_block_counter);
 
 	return pcm_frames;
 }
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fe1512905a43..40de9fc9d751 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -722,7 +722,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		data_blocks = calculate_data_blocks(s, syt);
 		buffer = s->buffer.packets[s->packet_index].buffer;
 		pcm_frames = s->process_data_blocks(s, buffer, data_blocks,
-						    &syt);
+						s->data_block_counter, &syt);
 
 		build_it_pkt_header(s, cycle, &template.params, data_blocks,
 				    syt, i);
@@ -776,7 +776,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		if (err >= 0) {
 			buffer = s->buffer.packets[s->packet_index].buffer;
 			pcm_frames = s->process_data_blocks(s, buffer,
-							    data_blocks, &syt);
+				data_blocks, s->data_block_counter, &syt);
 
 			if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 				s->data_block_counter += data_blocks;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 5d611122312b..762ac3c7e902 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -99,6 +99,7 @@ typedef unsigned int (*amdtp_stream_process_data_blocks_t)(
 						struct amdtp_stream *s,
 						__be32 *buffer,
 						unsigned int data_blocks,
+						unsigned int data_block_counter,
 						unsigned int *syt);
 struct amdtp_stream {
 	struct fw_unit *unit;
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 45ff73d16074..5c12973c2652 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -234,7 +234,7 @@ static inline void midi_use_bytes(struct amdtp_stream *s,
 }
 
 static void write_midi_messages(struct amdtp_stream *s, __be32 *buffer,
-				unsigned int data_blocks)
+		unsigned int data_blocks, unsigned int data_block_counter)
 {
 	struct amdtp_dot *p = s->protocol;
 	unsigned int f, port;
@@ -242,7 +242,7 @@ static void write_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 	u8 *b;
 
 	for (f = 0; f < data_blocks; f++) {
-		port = (s->data_block_counter + f) % 8;
+		port = (data_block_counter + f) % 8;
 		b = (u8 *)&buffer[0];
 
 		len = 0;
@@ -330,9 +330,8 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
@@ -351,9 +350,8 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm;
 	unsigned int pcm_frames;
@@ -367,7 +365,7 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 		pcm_frames = 0;
 	}
 
-	write_midi_messages(s, buffer, data_blocks);
+	write_midi_messages(s, buffer, data_blocks, data_block_counter);
 
 	return pcm_frames;
 }
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 2938489740b4..71879922ab39 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -103,9 +103,8 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
@@ -122,9 +121,8 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 	unsigned int pcm_frames;
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 7973dedd31ef..9693f37a0032 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -299,8 +299,8 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct amdtp_motu *p = s->protocol;
 	struct snd_pcm_substream *pcm;
@@ -361,8 +361,8 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-				__be32 *buffer, unsigned int data_blocks,
-				unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct amdtp_motu *p = (struct amdtp_motu *)s->protocol;
 	struct snd_pcm_substream *pcm;
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 95fb10b7a737..3a4d1f855f79 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -166,9 +166,8 @@ static void read_status_messages(struct amdtp_stream *s,
 }
 
 static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm;
 
@@ -182,9 +181,8 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 }
 
 static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
-					   __be32 *buffer,
-					   unsigned int data_blocks,
-					   unsigned int *syt)
+			__be32 *buffer, unsigned int data_blocks,
+			unsigned int data_block_counter, unsigned int *syt)
 {
 	struct snd_pcm_substream *pcm;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
