Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CA6F820
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFF91762;
	Mon, 22 Jul 2019 05:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFF91762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767411;
	bh=+G0UBP9F3NGbZUOh0fvE0TYSRa9dM+roC/qn7cMVEmo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3gK52Pkr/2tsI6VXYOVg+kpgEFNlghJ2CnHf9XbR01B2rKkPN2OKYdg/Pca55XVd
	 RT6qtL/lzg7dNFxhR/u36glyo+237uavwruDC3ewBynh5UCWWmyC8Y03P69Ej4SJ9k
	 kmeAf9JrxakkpAIy3JVrPnVLBGsXOr8G8tU6boL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F177F8067C;
	Mon, 22 Jul 2019 05:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26EDCF8053B; Mon, 22 Jul 2019 05:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E464F80529
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E464F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="e6uShdD6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YtskrtxS"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8706820FBE;
 Sun, 21 Jul 2019 23:37:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=glxrra586rLKe
 zx2ZPJ5f+hgZOkQe4Mq4rlzsBRwXzU=; b=e6uShdD6zXzeFAV+ObnMVhZXecxQ6
 LtGv94yh64H7x03BWy0vwOrZShbz+ddFn8RNzGqt5S6bnck75pbaPLTKqydzsTm5
 6uN6VnhI5epZ/u6jZ2qzYdufO10cHfrINfzyW+1Q2ThM3OL1jXrNK2tNIWlVFMyt
 9dfk1znUqmrnXVnYkwnMkzyn4R8YZ20zRHE1eXLU7GjNOM6Tr+T0y/fnFvs4Bqer
 2OCAR5xFO7bjbUoq/HYgeVIfxXhRcMpDSnasl1eXctJUu+BFOurVkb99f6CRbmow
 IkMTy0FBfOhZGb9E7JXYQzUjcASQCs5rMZY0JTR21lvnBcByXnzidi76Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=glxrra586rLKezx2ZPJ5f+hgZOkQe4Mq4rlzsBRwXzU=; b=YtskrtxS
 bA3uiq74VTH2TotwhIBOYricK9JU2C+NkiYjTVXwIJ+vxDPMCsWx+OwaGdPbQJ3h
 csHSy5e5Zc8LcS1VF6aHyc/sy0yLlJmCDp4szdUM2gDtvUpwTXUu4qIlSxcEg+ky
 K53Bo/jmi4cuVZA1YiTTt2ef3daq3jKTMDduBY8uvGHdD6Ff4qq4kBuaoA/5Ayls
 2yfho9JxthwiNtXueHaRmMwfJLBr3HuXqxOeFML76gkJQf2zH3PhdShGPfkzhYNS
 R/B25r0eU4pR8scgczLMlLmUx/vvsVn/PQwLhhqmcaA7j7seUzORXKbGJQNF/tVF
 rvq0yNdg3ePeGw==
X-ME-Sender: <xms:hC81XcV9KdPlpT2BSZwRfKPRpIQbFmJWmysfIlZOux6nuOFcmbEVjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduhe
X-ME-Proxy: <xmx:hC81XW8JsEkiHC6rtuiIco8Z5Dkw43HaQalmPlBwhEHhKc_rrft1pw>
 <xmx:hC81Xcrfsfk_HmpTIoKFLdpyKZwmvX36_38JfIYFqbgcQ7ZTVtkALQ>
 <xmx:hC81XZJkcf_gK3S6vmM7JLPs3-ATbQG9C76hEEn7Lsr2ygOvlP2aHA>
 <xmx:hC81XYxFzZF0syEOentWX9pK-TMFexGxIK16RD7rxhQrad5vhaoUgg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24B2B80059;
 Sun, 21 Jul 2019 23:37:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:06 +0900
Message-Id: <20190722033710.28107-17-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 16/20] ALSA: firewire-tascam: code refactoring
	for TASCAM data block processing layer
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

This is code refactoring for TASCAM data block processing layer so that
it can receive list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/amdtp-tascam.c | 55 ++++++++++++++++------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 970b1c4a8ea6..3c9abf422f24 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -32,19 +32,24 @@ int amdtp_tscm_set_parameters(struct amdtp_stream *s, unsigned int rate)
 	return amdtp_stream_set_parameters(s, rate, data_channels);
 }
 
-static void write_pcm_s32(struct amdtp_stream *s,
-			  struct snd_pcm_substream *pcm,
-			  __be32 *buffer, unsigned int frames)
+static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			  __be32 *buffer, unsigned int frames,
+			  unsigned int pcm_frames)
 {
 	struct amdtp_tscm *p = s->protocol;
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
@@ -57,19 +62,24 @@ static void write_pcm_s32(struct amdtp_stream *s,
 	}
 }
 
-static void read_pcm_s32(struct amdtp_stream *s,
-			 struct snd_pcm_substream *pcm,
-			 __be32 *buffer, unsigned int frames)
+static void read_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			 __be32 *buffer, unsigned int frames,
+			 unsigned int pcm_frames)
 {
 	struct amdtp_tscm *p = s->protocol;
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
 
 	/* The first data channel is for event counter. */
 	buffer += 1;
@@ -169,13 +179,12 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = desc->data_blocks;
-	} else {
-		pcm_frames = 0;
+		read_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			     pcm_frames);
+		pcm_frames += desc->data_blocks;
 	}
 
 	read_status_messages(s, desc->ctx_payload, desc->data_blocks);
@@ -187,14 +196,14 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
-		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = desc->data_blocks;
+		write_pcm_s32(s, pcm, desc->ctx_payload, desc->data_blocks,
+			      pcm_frames);
+		pcm_frames += desc->data_blocks;
 	} else {
 		write_pcm_silence(s, desc->ctx_payload, desc->data_blocks);
-		pcm_frames = 0;
 	}
 
 	return pcm_frames;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
