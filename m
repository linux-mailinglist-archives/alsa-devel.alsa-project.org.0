Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F160D1D9528
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4170170B;
	Tue, 19 May 2020 13:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4170170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887285;
	bh=p2pWQvMYTa1or3xbYR9l+KdbDEVtYn9QdFqrsJsjQBA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKQzDDWQsrhuXz5S9ViGdmnrBS4dfiLgYuhC8lBjjW8VvfIevrsnbU5T9n4g+XWNu
	 JTuBp6HxjqGS8v5dg3MPMIevZQr6KumZWN5U1vPylJraKped9Ei+HQKMC13tbK/Uy5
	 vL6ZcmNuJdi08IjgTH6AIxvxpwmi0oMtps0I87I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B813AF802A7;
	Tue, 19 May 2020 13:17:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03844F8029A; Tue, 19 May 2020 13:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63B73F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B73F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="eDOrFKZD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nR9L9RI2"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9220C5C0132;
 Tue, 19 May 2020 07:16:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=02z9KJEPcMiW6
 D4zcPtuipaedn7zRDaK0tBe7ykdR0Q=; b=eDOrFKZDT+E5+C20aXzpV4f2OzbWS
 HUhbpYZUTcKWulJ0IEs2fZhtIS/DSkGHK4v7G0mQMRqpLjfKcFhUOTFYDtqX6NpN
 e3V8nN6u6hTeDRkDJhUAFr3OXhGj+EM5CSaiUHrj05H88iHnZc69TwIl6JwKPGjT
 yWuzKNhDEcl9vYuk8dLSb29yVBPGXHrypEoJmEiIeIYkjwVhWzCtzNJyOsSkzdVW
 H1HoT3rIOLVTC/5d+le2IBq/3INRSI2cUukwJzHR19SX74UYGoZLi89gzdSFF42Y
 56OcHBrZdBfZqFNVlf7YHyHghV6AilOppeofagnsSwnjpE8nA94DsL+lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=02z9KJEPcMiW6D4zcPtuipaedn7zRDaK0tBe7ykdR0Q=; b=nR9L9RI2
 dyCGoD0fqrMdpaYg8kND4fNO8flmg1u3CDSH2xUOMmHlfo4fYHSZecyHJ4FHN174
 NbEKabRglnL99bMSwGhQlwmUKUgaMyRy27Gu9z0MHxkSiaOYuqVSB4yA9mSn00Eq
 9v+HBKBH1jUOMKUx3C2S65Jz8KkiGtiuV94BHeFWI4mHgDCJ9YG2eNag1b+1Nls4
 QKb/I02P9LA5z2KkJaTPlE/JcIh5IHbVPOlIO1veOK66KFIQKpqcC8bLYs3qQw1U
 f/KU1imYpb27ZeI7pQJ3ATgAuv6MZ1HIvMlC7w+xIhRRkkQUMRvmsJ/U8zfxhpDt
 PlLZbDPH8a66sA==
X-ME-Sender: <xms:J8DDXluiMgFhymTh_KNQMELrQ5EBKyoIPYMjfc-qowaMBQQbnHfNeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:J8DDXuf-Rt6h2ZM3jGbgbfF1j8WjkCW2xK_iB-JyZPnMWOD0_gmSPA>
 <xmx:J8DDXoxqkrMMvSMa877w1VdTP06ytQH6BaLWI9SJ3Wb3DHzEYio6Yg>
 <xmx:J8DDXsORBOe-5m3mkbu0OGOOE05Zf9Pmoy0sBw9tuSMI-ehN0aHY4w>
 <xmx:J8DDXqKHn3-0TA0DusU3-XBUXfKdDS6pFE0Kz3nGyu-D5o1nRENLoQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 692A03280060;
 Tue, 19 May 2020 07:16:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 06/14] ALSA: firewire-motu: add model-specific table of chunk
 count
Date: Tue, 19 May 2020 20:16:33 +0900
Message-Id: <20200519111641.123211-7-o-takashi@sakamocchi.jp>
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

In MOTU protocol, data block consists of SPH and 24-bit chunks
aligned to quadlet. The number of chunks per data block is specific
to model. For models with optical interface, the number differs
depending on I/O settings for the interface (ADAT, TOSLINK).

Currently the number is calculated from flags in model-specific
data. However this is weak in the case that the model has quirks.
Actually, for quirks of some models, flags are used against their
original meanings.

This commit adds model-specific table of chunk count. For future
integration, this table is based on the calculation.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 10 ++++++++--
 sound/firewire/motu/motu-protocol-v3.c |  7 ++++++-
 sound/firewire/motu/motu.h             |  3 +++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index e2913cb54da8..6cd7a5f1f46c 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -306,7 +306,8 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
 		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-
+	.tx_fixed_pcm_chunks = {14, 14, 0},
+	.rx_fixed_pcm_chunks = {14, 14, 0},
 	.analog_in_ports = 8,
 	.analog_out_ports = 8,
 };
@@ -321,7 +322,8 @@ const struct snd_motu_spec snd_motu_spec_traveler = {
 		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
 		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-
+	.tx_fixed_pcm_chunks = {14, 14, 8},
+	.rx_fixed_pcm_chunks = {14, 14, 8},
 	.analog_in_ports = 8,
 	.analog_out_ports = 8,
 };
@@ -335,6 +337,8 @@ const struct snd_motu_spec snd_motu_spec_ultralite = {
 		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.tx_fixed_pcm_chunks = {14, 14, 0},
+	.rx_fixed_pcm_chunks = {14, 14, 0},
 	.analog_in_ports = 8,
 	.analog_out_ports = 8,
 };
@@ -349,6 +353,8 @@ const struct snd_motu_spec snd_motu_spec_8pre = {
 		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
 		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+	.tx_fixed_pcm_chunks = {10, 6, 0},
+	.rx_fixed_pcm_chunks = {10, 6, 0},
 	.analog_in_ports = 8,
 	.analog_out_ports = 2,
 };
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 8192bcdd1b37..370d22da276e 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -324,7 +324,8 @@ const struct snd_motu_spec snd_motu_spec_828mk3 = {
 		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
 		 SND_MOTU_SPEC_RX_MIDI_3RD_Q |
 		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
-
+	.tx_fixed_pcm_chunks = {18, 18, 14},
+	.rx_fixed_pcm_chunks = {14, 14, 10},
 	.analog_in_ports = 8,
 	.analog_out_ports = 8,
 };
@@ -338,6 +339,8 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
 		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+	.tx_fixed_pcm_chunks = {10, 10, 0},
+	.rx_fixed_pcm_chunks = {10, 10, 0},
 	.analog_in_ports = 2,
 	.analog_out_ports = 4,
 };
@@ -349,6 +352,8 @@ const struct snd_motu_spec snd_motu_spec_4pre = {
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
 		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.tx_fixed_pcm_chunks = {10, 10, 0},
+	.rx_fixed_pcm_chunks = {10, 10, 0},
 	.analog_in_ports = 2,
 	.analog_out_ports = 2,
 };
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index f8274ed94766..790aa34d396f 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -118,6 +118,9 @@ struct snd_motu_spec {
 	enum snd_motu_protocol_version protocol_version;
 	enum snd_motu_spec_flags flags;
 
+	unsigned char tx_fixed_pcm_chunks[3];
+	unsigned char rx_fixed_pcm_chunks[3];
+
 	unsigned char analog_in_ports;
 	unsigned char analog_out_ports;
 };
-- 
2.25.1

