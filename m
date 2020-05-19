Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0E1D953B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4480617A2;
	Tue, 19 May 2020 13:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4480617A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887473;
	bh=YwW/e6b8SD1U33IcSreD9wzzEjje3sKACqMryBSx2p8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2OOPN4jN+EQR3iCl593oeTAYC1abiVH7OKaKHq3qV6Rots7lWzgJGmQ7Dh93gPqa
	 7jSARfevYuTuP/pA9jE3N7UPY1RM3gIbiK+vG7xDWWeT8B23Xky9FywrMSEj2G+Vpv
	 bXZxiuOGNUWbJQxJPbhQtvQ94yeIUBPko27fs+0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C24F80307;
	Tue, 19 May 2020 13:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 730DDF802A7; Tue, 19 May 2020 13:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D564FF80259
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D564FF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="H1qSJ7Mc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iOYW5MJ0"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 111915C00FC;
 Tue, 19 May 2020 07:17:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eZPBTTR3MMF+O
 6F5bPiZZIXteg6rmSzGjTcthRcSRJU=; b=H1qSJ7McweVJjA+X0IXwR5p1YGgRN
 VxdVCNV27+sUAvNUPeNNW8Lb/sEbQR0AJBVBR2lSJDhYLI+8DBrVDLqLKvRD6WJj
 VaXT2Qppjed8RSTYAo23kTgI0SsOfCo8BAQwoaaZ4HGIhqFbGQmZmaJCnqxbC31y
 dPqfcAIApf18Kqm9XKgjjYqkW8rk/NA/yCC3Jh1a8Im5DlS84MnkIifc8JcGt1N3
 nHUwk8ZCjC4uUUZjZKgjNJSagFK97E191juXj/qpJ/G/HUodPu7uZN71FKAhJPf7
 gTS8xGDL7qoYmV7bKRwHmiV/CmfPk5GjeOjedd64MbedbHeWzkmSLk1Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eZPBTTR3MMF+O6F5bPiZZIXteg6rmSzGjTcthRcSRJU=; b=iOYW5MJ0
 HeW6BZaTBHcnXm3nrLlYQqs3Lt6f9J4CSMJa7qFWvsalLIWHpfHF6XJpn0UlKhPg
 Oy9znDGELls7el8BC7+se6z3TbR1BVLSJXMfeqNh2TSk7naEFaToAd0ei8QdCqDF
 zCTESsdy66IEw/SyTvwekT2Tc9IP13/fakWf8SQNQzNjkO+P1d9UBdOPwua/DARc
 JT0s+OaC5afc47e/qerEBKJPxvIq3I9obMFocw1WKedg7SbC8eYsyuqw2yhOgoOF
 AaCVerg+oacSzZY+poQ1UWrhWRqkYEx6GofhtJQs/bSyoSRJAfF3TkPp//Oi43gP
 6LN9WuPpetRhbQ==
X-ME-Sender: <xms:LcDDXmmpexljN28_GgDGt6on8rnfoWt_KZx6zouBLQLpT2-uGA6Ysw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:LcDDXt2TnXb97rBSAQ6Mt7NRut6yP3-r178rIH7bxaJYEKBd0dRS0A>
 <xmx:LcDDXkrbDAG2a3QOLO8_Q5tAZEzBm86lw-pSX5HfydfymU5U0FjF9g>
 <xmx:LcDDXqlGmZgQdI8O5pSBi1Ng5z70lpAw-i6QmAAX-YYIaKrZSAoEYA>
 <xmx:LcDDXliF2zp3He0JyCWNQtzGG6B8JSmrsjWpoHE_2Yy09m1gBpLtdw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6E16328005E;
 Tue, 19 May 2020 07:16:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 10/14] ALSA: firewire-motu: use table-based calculation of
 packet formats for stream management
Date: Tue, 19 May 2020 20:16:37 +0900
Message-Id: <20200519111641.123211-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

This commit uses table-based calculation of packet formats for stream
management.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c  | 12 ++++--------
 sound/firewire/motu/motu-stream.c |  4 ++--
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 17c9ea8eb4c8..edb31ac26868 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -76,15 +76,11 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (i == ARRAY_SIZE(snd_motu_clock_rates))
 		return -EINVAL;
 
-	pcm_chunks = formats->fixed_part_pcm_chunks[mode] +
-		     formats->differed_part_pcm_chunks[mode];
+	// Each data block includes SPH in its head. Data chunks follow with
+	// 3 byte alignment. Padding follows with zero to conform to quadlet
+	// alignment.
+	pcm_chunks = formats->pcm_chunks[mode];
 	data_chunks = formats->msg_chunks + pcm_chunks;
-
-	/*
-	 * Each data block includes SPH in its head. Data chunks follow with
-	 * 3 byte alignment. Padding follows with zero to conform to quadlet
-	 * alignment.
-	 */
 	data_block_quadlets = 1 + DIV_ROUND_UP(data_chunks * 3, 4);
 
 	err = amdtp_stream_set_parameters(s, rate, data_block_quadlets);
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 87a8d9016f83..2028c5419f6f 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -201,9 +201,9 @@ static int ensure_packet_formats(struct snd_motu *motu)
 	data &= ~(TX_PACKET_EXCLUDE_DIFFERED_DATA_CHUNKS |
 		  RX_PACKET_EXCLUDE_DIFFERED_DATA_CHUNKS|
 		  TX_PACKET_TRANSMISSION_SPEED_MASK);
-	if (motu->tx_packet_formats.differed_part_pcm_chunks[0] == 0)
+	if (motu->spec->tx_fixed_pcm_chunks[0] == motu->tx_packet_formats.pcm_chunks[0])
 		data |= TX_PACKET_EXCLUDE_DIFFERED_DATA_CHUNKS;
-	if (motu->rx_packet_formats.differed_part_pcm_chunks[0] == 0)
+	if (motu->spec->rx_fixed_pcm_chunks[0] == motu->rx_packet_formats.pcm_chunks[0])
 		data |= RX_PACKET_EXCLUDE_DIFFERED_DATA_CHUNKS;
 	data |= fw_parent_device(motu->unit)->max_speed;
 
-- 
2.25.1

