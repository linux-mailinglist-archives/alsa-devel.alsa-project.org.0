Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D9664251
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 14:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930E9A9BA;
	Tue, 10 Jan 2023 14:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930E9A9BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673358692;
	bh=4oGSJ6FbnspCAIUmDXE7cKoixn7zT1eynXgj/tg+wmY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vRnz8E8Kv3sv+PmHeZ6gj2vNUg+IBXlOJfs+dyprEGSWYA4twnPz85NDUE9J/orRX
	 shbez/GZq5E5VYGsFLzpbwe4e1VPmC+5a0Ad354GBznP9+bpb4A45hE+RBkM9pSDBo
	 /mezE8Sv5O1sMd7gJspGG9bVT1yiwO1EDOCdz/AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C70F8055A;
	Tue, 10 Jan 2023 14:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD535F80558; Tue, 10 Jan 2023 14:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 037BDF8019B
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 14:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 037BDF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=sXDWI1R3; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oJSsyslU
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B8FB5C0145;
 Tue, 10 Jan 2023 08:49:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 10 Jan 2023 08:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673358579; x=
 1673444979; bh=miI7uGTmU797GNjdEiXAgXhylwamx1SsJtp/2vvjRP0=; b=s
 XDWI1R3BjC/KaR2Uv0Q4x5WWQOXZD7lZCiV2LDjD/2DxyM6S6XLa5wHESsWhQWlu
 WHNMBm5NiF71nqsKDK/R6wTJSfXcBhDaFwkjZC+FMc1SmWJIZsl5/jTdxyZGpPXv
 XhVV0emgyvLVzpLtvNyD68ZKm8NzmbpIZED1FYwKps68vuXfImBxv04iwFhtPIfM
 yyi7TYvlORUnFQbajrAbC4ZH/lyB/92rVQKYu/WZbBMprG3VebC8dW8htHowPcPX
 4uFXDeRrjhhp5GmLoRoreRHQbiDlS3uFx4siuJhghJJrbD5laClfyDfoVAsNr7pR
 ci1gW+ZLTvDTN9o6BJsAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673358579; x=1673444979; bh=miI7uGTmU797G
 NjdEiXAgXhylwamx1SsJtp/2vvjRP0=; b=oJSsyslUAq5ivoc+ASYb5qrS50b6F
 1eMeSZjEdFN1ZutO9LfK7ibYD4KUkLjcLvWeCM4BiZjPFxLta7ubA6Rzon0vXVay
 Q/BROyXKqX4nHYImKwZ8L/RB5wNmqx5b26yui7oRzF3sfeUi9MHeocgTskzDjVu1
 I4/bZ0Z2FGnz4u6tHupKegPIWpO5PZBOqbBTROus9jYLrHgG2XbQdcEVPQsEQ4mN
 yPpvSzpHrms/vq7ryvVx1jWOPNu0j7NkX0zoV7tDXfub8GFy/cH0vFF3mTA2/7la
 0gphwpaZRzGgCkMsDK3Nl89mj8zmbm9vA3VFl76YNqITazoZ97BQUYyAQ==
X-ME-Sender: <xms:8my9Y43_hF7cRucEfueWF88kUzutFzaFkOVlbeQFr1r5wuKNSNlzpQ>
 <xme:8my9YzGZK-BucvwtwRmdpKzYXCZxEto50AJFJKrd-IEh5UiSZ50uCjsOlXe9ggbo7
 1NxtCd9clbNSoSAy2g>
X-ME-Received: <xmr:8my9Yw6Yvkz-fXLVIKi7YeCac_X1wQN97QebfHQTrtMgQvbWnOcp0BDJ3-EnrFH6qc5qA9t-JHzX0lN50h2B5iSF8aCGC4pqSINDSxGXluhjRUJi0NR0kAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8my9Yx2-jn-uVMyeqcobBrCQ_-tj-zDftjK6eYy9-4kzaGr0WLaqMw>
 <xmx:8my9Y7HElDM5nbqJU8iVSYukK0OgLcVOL3jcp5xy_1mxHdWRO4Snow>
 <xmx:8my9Y69hIfFkwBso0oL32de9Bc2Ldb_rYTbtIaFSJ16Az4p3AO-hLg>
 <xmx:82y9YxOQArJcGxxNrqc2xtFJbbDYbm_7NfC7FVgK0QukrQOQufcI4g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 08:49:37 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-lib: move parameter for pcm frame
 multiplier from context payload processing layer
Date: Tue, 10 Jan 2023 22:49:31 +0900
Message-Id: <20230110134933.322794-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
References: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The current implementation delegates the task to calculate the number of
processed PCM frames into the context payload processing layer. It looks
good as long as frame calculation is done for a single purpose.
Nevertheless, another purpose, the computation of extra delay for the
runtime of PCM substream, requires frame calculation, too.

This commit refactors the current implementation so that the packet stream
processing layer is responsible for the calculation of PCM frame, too. The
member is moved to stream structure for multiplier between data block
count and PCM frame count.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         | 34 +++++++++++++---------------
 sound/firewire/amdtp-stream.c        | 25 +++++++++++++++-----
 sound/firewire/amdtp-stream.h        |  3 ++-
 sound/firewire/digi00x/amdtp-dot.c   |  2 +-
 sound/firewire/fireface/amdtp-ff.c   |  2 +-
 sound/firewire/motu/amdtp-motu.c     |  2 +-
 sound/firewire/tascam/amdtp-tascam.c |  2 +-
 7 files changed, 41 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index cf55f7784d23..b849f529fcba 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -36,8 +36,6 @@ struct amdtp_am824 {
 
 	u8 pcm_positions[AM824_MAX_CHANNELS_FOR_PCM];
 	u8 midi_position;
-
-	unsigned int frame_multiplier;
 };
 
 /**
@@ -59,8 +57,8 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int midi_channels;
-	unsigned int i;
-	int err;
+	unsigned int pcm_frame_multiplier;
+	int i, err;
 
 	if (amdtp_stream_running(s))
 		return -EINVAL;
@@ -77,8 +75,18 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	    WARN_ON(midi_channels > AM824_MAX_CHANNELS_FOR_MIDI))
 		return -EINVAL;
 
-	err = amdtp_stream_set_parameters(s, rate,
-					  pcm_channels + midi_channels);
+	/*
+	 * In IEC 61883-6, one data block represents one event. In ALSA, one
+	 * event equals to one PCM frame. But Dice has a quirk at higher
+	 * sampling rate to transfer two PCM frames in one data block.
+	 */
+	if (double_pcm_frames)
+		pcm_frame_multiplier = 2;
+	else
+		pcm_frame_multiplier = 1;
+
+	err = amdtp_stream_set_parameters(s, rate, pcm_channels + midi_channels,
+					  pcm_frame_multiplier);
 	if (err < 0)
 		return err;
 
@@ -88,16 +96,6 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	p->pcm_channels = pcm_channels;
 	p->midi_ports = midi_ports;
 
-	/*
-	 * In IEC 61883-6, one data block represents one event. In ALSA, one
-	 * event equals to one PCM frame. But Dice has a quirk at higher
-	 * sampling rate to transfer two PCM frames in one data block.
-	 */
-	if (double_pcm_frames)
-		p->frame_multiplier = 2;
-	else
-		p->frame_multiplier = 1;
-
 	/* init the position map for PCM and MIDI channels */
 	for (i = 0; i < pcm_channels; i++)
 		p->pcm_positions[i] = i;
@@ -361,7 +359,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		if (pcm) {
 			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
-			pcm_frames += data_blocks * p->frame_multiplier;
+			pcm_frames += data_blocks * s->pcm_frame_multiplier;
 		} else {
 			write_pcm_silence(s, buf, data_blocks);
 		}
@@ -392,7 +390,7 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		if (pcm) {
 			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
-			pcm_frames += data_blocks * p->frame_multiplier;
+			pcm_frames += data_blocks * s->pcm_frame_multiplier;
 		}
 
 		if (p->midi_ports) {
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 65720ae866cb..98a033afc5f8 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -271,12 +271,14 @@ EXPORT_SYMBOL(amdtp_stream_add_pcm_hw_constraints);
  * @s: the AMDTP stream to configure
  * @rate: the sample rate
  * @data_block_quadlets: the size of a data block in quadlet unit
+ * @pcm_frame_multiplier: the multiplier to compute the number of PCM frames by the number of AMDTP
+ *			  events.
  *
  * The parameters must be set before the stream is started, and must not be
  * changed while the stream is running.
  */
 int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
-				unsigned int data_block_quadlets)
+				unsigned int data_block_quadlets, unsigned int pcm_frame_multiplier)
 {
 	unsigned int sfc;
 
@@ -298,6 +300,8 @@ int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (s->flags & CIP_BLOCKING)
 		s->transfer_delay += TICKS_PER_SECOND * s->syt_interval / rate;
 
+	s->pcm_frame_multiplier = pcm_frame_multiplier;
+
 	return 0;
 }
 EXPORT_SYMBOL(amdtp_stream_set_parameters);
@@ -1032,16 +1036,25 @@ static inline void cancel_stream(struct amdtp_stream *s)
 }
 
 static void process_ctx_payloads(struct amdtp_stream *s,
-				 const struct pkt_desc *descs,
+				 const struct pkt_desc *desc,
 				 unsigned int count)
 {
 	struct snd_pcm_substream *pcm;
-	unsigned int pcm_frames;
+	int i;
 
 	pcm = READ_ONCE(s->pcm);
-	pcm_frames = s->process_ctx_payloads(s, descs, count, pcm);
-	if (pcm)
-		update_pcm_pointers(s, pcm, pcm_frames);
+	(void)s->process_ctx_payloads(s, desc, count, pcm);
+
+	if (pcm) {
+		unsigned int data_block_count = 0;
+
+		for (i = 0; i < count; ++i) {
+			data_block_count += desc->data_blocks;
+			desc = amdtp_stream_next_packet_desc(s, desc);
+		}
+
+		update_pcm_pointers(s, pcm, data_block_count * s->pcm_frame_multiplier);
+	}
 }
 
 static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a8dd1c3ec8d9..35b48f9ddbf7 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -190,6 +190,7 @@ struct amdtp_stream {
 	struct snd_pcm_substream *pcm;
 	snd_pcm_uframes_t pcm_buffer_pointer;
 	unsigned int pcm_period_pointer;
+	unsigned int pcm_frame_multiplier;
 
 	// To start processing content of packets at the same cycle in several contexts for
 	// each direction.
@@ -216,7 +217,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 void amdtp_stream_destroy(struct amdtp_stream *s);
 
 int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
-				unsigned int data_block_quadlets);
+				unsigned int data_block_quadlets, unsigned int pcm_frame_multiplier);
 unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s);
 
 void amdtp_stream_update(struct amdtp_stream *s);
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index fcae7d07aa03..b3f67af2d3b1 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -123,7 +123,7 @@ int amdtp_dot_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	 * A first data channel is for MIDI messages, the rest is Multi Bit
 	 * Linear Audio data channel.
 	 */
-	err = amdtp_stream_set_parameters(s, rate, pcm_channels + 1);
+	err = amdtp_stream_set_parameters(s, rate, pcm_channels + 1, 1);
 	if (err < 0)
 		return err;
 
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 2402e2be87a6..27943b7f86fa 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -24,7 +24,7 @@ int amdtp_ff_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	p->pcm_channels = pcm_channels;
 	data_channels = pcm_channels;
 
-	return amdtp_stream_set_parameters(s, rate, data_channels);
+	return amdtp_stream_set_parameters(s, rate, data_channels, 1);
 }
 
 static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index ea0063cec5fb..4153527b5e08 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -73,7 +73,7 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	data_chunks = formats->msg_chunks + pcm_chunks;
 	data_block_quadlets = 1 + DIV_ROUND_UP(data_chunks * 3, 4);
 
-	err = amdtp_stream_set_parameters(s, rate, data_block_quadlets);
+	err = amdtp_stream_set_parameters(s, rate, data_block_quadlets, 1);
 	if (err < 0)
 		return err;
 
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index c367a6ee6121..bb4cf2d26d1b 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -29,7 +29,7 @@ int amdtp_tscm_set_parameters(struct amdtp_stream *s, unsigned int rate)
 	if (s->direction == AMDTP_IN_STREAM)
 		data_channels += 2;
 
-	return amdtp_stream_set_parameters(s, rate, data_channels);
+	return amdtp_stream_set_parameters(s, rate, data_channels, 1);
 }
 
 static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
-- 
2.37.2

