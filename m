Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 913FB6F823
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EAF1762;
	Mon, 22 Jul 2019 05:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EAF1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767485;
	bh=O/WkDDGuauIXHIFFzkyXC69MAXypQXN4bAoCesHOlV4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJ2kER3GWUXB/6jEqba0QuKBNweC+8FrLA5xotOavEPXtisPMFkQSDNRk+Gcr7m4J
	 4w3sjbpuNrd6U4v5PTPJ3Vb+HVRZ8w7uMJimnPUYB57fHWsRJDlJs4G7E89fGOJt6O
	 8yxf9lvrkF8pQvqLSxOVh2qihfSC1kwO57TBnWCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C2AF806F0;
	Mon, 22 Jul 2019 05:38:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4340F80533; Mon, 22 Jul 2019 05:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51A79F80533
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51A79F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d0ez3Egu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ziRSaxLZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F97621FC2;
 Sun, 21 Jul 2019 23:37:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4E95XDvFsUnC9
 GZc1MGY8pvxhoUJHvgrud4/4XJKFhE=; b=d0ez3EguLwXDwWlIDIxdC+70EYq0G
 dj+wOFqouHe3gY4BzXj/TjLmwtTcVRUA4TYPsIIO7yFRnwM5ik1K1HwBgFbTe3fb
 4XdpIOnYEMwdQL8FtgF3cW8cQcoDioiBjIiaV7HbrcLuZJT8fBNSFZdeG8yLM2gC
 3R3MQDb6tIDTJD7i8NEfkOTsEtbfWgf16jhWpGI5KauAeCYpKH8vtyOh1H8qehA1
 yRCoAoNkFawgFAWwYYPiBeTPfq5W+gsF3HR+5vlR8uYashiq/CiHRhoUDLXik9+X
 Y8B0PjoEqw3L7OCmgvv5krBBhrfNlzU5BrtTMH0zlhvywaFZ9GDUb/QEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4E95XDvFsUnC9GZc1MGY8pvxhoUJHvgrud4/4XJKFhE=; b=ziRSaxLZ
 aHThWsBBbArhOrmOg5amLh83Ov6mzllYLxbuBOJRvHWqf+dgYkWZxD2UBDAcmrBZ
 ZtwJ5dHZp+93G6MLWwxSdJ4XP0zs8LcFN1AI7+iiZr3ywlEuRcNnAoHFzsQYdx+G
 aX6xSqzFFlmGzT8w6dx1P9SR8zwEVdmcxsp1chQCuWuFZL6G/AyyqbC7MrkBjxiR
 VOMaAmbCl8PTDfab2kGeA45fMw9HGXBiBiTNA0RtFQzi9ByOcMfdaE7TX0MvMGuj
 vzKbj1iG9SZk/DG4WrGvdrcmO2icVMWDuU5m3/pqw2qLtFLUII2H4uCAQXkuj4vR
 jn4yucWfo8aclA==
X-ME-Sender: <xms:hy81XRJYMsfMmOJavjr3tmPZoIMQG6uSqNWcUyeDsisxKJ0A77AVMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduhe
X-ME-Proxy: <xmx:hy81XUJsVjuJIqGtjYqtrhfFxneHS0XmlFhR9DYa3Izttt25T7OOfQ>
 <xmx:hy81Xetx0V-fnZONUKn4u4sPOFjtRtkr4gUx9tBbftNwHQ8izULX3w>
 <xmx:hy81XRSxSqCPFVlHNPdkfRQCYCnD1khhKJ9sqRDb5XPpOFM4DNmlzQ>
 <xmx:hy81XQLna_E5lTsYIKzBHq9NNaLLeb_xAnf2mePHDO2x-T8IpJr5NA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 324498005A;
 Sun, 21 Jul 2019 23:37:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:08 +0900
Message-Id: <20190722033710.28107-19-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 18/20] ALSA: fireface: code refactoring for FF
	data block processing layer
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

This is code refactoring for FF data block processing layer so that
it can receive list of packet descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/amdtp-ff.c | 49 +++++++++++++++++-------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index c36232fc4d3e..cb2073cf146b 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -27,19 +27,24 @@ int amdtp_ff_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	return amdtp_stream_set_parameters(s, rate, data_channels);
 }
 
-static void write_pcm_s32(struct amdtp_stream *s,
-			  struct snd_pcm_substream *pcm,
-			  __le32 *buffer, unsigned int frames)
+static void write_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			  __le32 *buffer, unsigned int frames,
+			  unsigned int pcm_frames)
 {
 	struct amdtp_ff *p = s->protocol;
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
@@ -52,19 +57,24 @@ static void write_pcm_s32(struct amdtp_stream *s,
 	}
 }
 
-static void read_pcm_s32(struct amdtp_stream *s,
-			 struct snd_pcm_substream *pcm,
-			 __le32 *buffer, unsigned int frames)
+static void read_pcm_s32(struct amdtp_stream *s, struct snd_pcm_substream *pcm,
+			 __le32 *buffer, unsigned int frames,
+			 unsigned int pcm_frames)
 {
 	struct amdtp_ff *p = s->protocol;
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
@@ -106,16 +116,15 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
 		write_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
-			      desc->data_blocks);
+			      desc->data_blocks, pcm_frames);
 		pcm_frames = desc->data_blocks;
 	} else {
 		write_pcm_silence(s, (__le32 *)desc->ctx_payload,
 				  desc->data_blocks);
-		pcm_frames = 0;
 	}
 
 	return pcm_frames;
@@ -125,14 +134,12 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 					   const struct pkt_desc *desc,
 					   struct snd_pcm_substream *pcm)
 {
-	unsigned int pcm_frames;
+	unsigned int pcm_frames = 0;
 
 	if (pcm) {
 		read_pcm_s32(s, pcm, (__le32 *)desc->ctx_payload,
-			     desc->data_blocks);
+			     desc->data_blocks, pcm_frames);
 		pcm_frames = desc->data_blocks;
-	} else {
-		pcm_frames = 0;
 	}
 
 	return pcm_frames;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
