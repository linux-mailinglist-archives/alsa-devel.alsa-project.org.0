Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9A3CCFA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174F51759;
	Tue, 11 Jun 2019 15:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174F51759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259775;
	bh=5c2AcVV99KcMosZwtg9LYq5XY2o44G2skXdJqEfxQtY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCymFTxzbktrhp/mU5tqrZXB14zuhXm1BWeiz1wueICunhwsyjLQMgKf36ln5hPIT
	 GnT1UwplIooUG2Z105zaA/P/81AVQHnlMMr/KvOCd1zV39d1zGqpLGHvrz1U3PJbBI
	 z0iDMYOAzx3COivIheuujcVzV18Uq/+BB1YOWCMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB629F89762;
	Tue, 11 Jun 2019 15:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C7B3F8973E; Tue, 11 Jun 2019 15:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2AFF89730
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2AFF89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sDjia9d/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Tfmsp4QP"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 742EE2224B;
 Tue, 11 Jun 2019 09:21:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=++/vHHezfJwyh
 aJM/0WTktA/ffL4YanXjKyIFRJXL4Q=; b=sDjia9d/ffT97sA8cIvZhTGjktJJG
 ySf8XfHK9lTZhfxxDi3XXBh4YIJkHklzmMyS48R3YPKZZYCtKBhT9SZ4kg1Q29pu
 VUdjdlsv3xdgY2kpVRBagEr4hJI6uQ1Lt+VfO2kbC961f6/6EajdBX9viHDzsWj2
 GAnJLh5LMu3euIf7318Flqu6LMEIvCuS9TT8Dt+fsTvTMbvu4AcsAYERUOrhz7bn
 MPVqwOB3rPLDDn004F+ItiuIFSURnqNxNVvRdBbjbQyhoMfSvj18eBwX3tkjZCD+
 UL+deNfWwLYZ2c31sqlwtEd37YrafVVJZ9X5eOKMnhoZliKPeMZm+sAJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=++/vHHezfJwyhaJM/0WTktA/ffL4YanXjKyIFRJXL4Q=; b=Tfmsp4QP
 DpAC8wiFYCkqGaEu3D4iL3PPGMWOXZIhexSrX3rzMJhgcDOvbAbaVVXO5f7LWzRa
 h3crS7yZ75OmlQU6y9p7C/x9eoDhJ4dskay0I8T+T9Pk5kvTPiyOFmR4/YbyRTeb
 SgBrpXRvrsqGQedkCuulJ7VDUgVOx2r57QrLL5PufND7xDOSt6kQ/jzCECzkkPFV
 GZpxAtXBDBJTamFlIsnpQ172vydWnUxrjpVFHdxpMjyHGNtJdkKWCHr5SBCCxDcJ
 AMui9qmLhp96UR57khZ3f9jwNnZvfA85jlmRDy142flCxnG2C2hg+WV193agQnnI
 2+6io9tGpuESKA==
X-ME-Sender: <xms:46r_XJ6IMYU1ULaO6Ayg-b3mE4lwuN8m3NdnAlOlViHSo4_7VFm51Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:46r_XFUcQAD3zCAtNNtRdZ0dhgtl-qLhTuXhr5LO7kDOrJoATx9Cxg>
 <xmx:46r_XDP50aW-Rn9CTqsdJzqTUDVeUNXa0xTDMrY0z0x-lKIYS2K5DA>
 <xmx:46r_XG-yxYy0X9jG1qKEz9YrgnogpazrIWoQBxkfv3JyGWGvNI3eSQ>
 <xmx:46r_XBMTJXJ_gpfZ3PrMTanu1SYSWUOdAO5XofYp5Lx9rnBIL1lBBQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A20E3380083;
 Tue, 11 Jun 2019 09:21:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:15 +0900
Message-Id: <20190611132118.8378-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/12] ALSA: dice: code refactoring to keep
	isochronous resources
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

This commit is a part of preparation to perform allocation/release
of isochronous resources in pcm.hw_params/hw_free callbacks.

This commit adds a helper function to allocate isochronous resources,
separated from operations to start packet streaming, I note that some
dice-based devices have two pair of endpoints for isochronous packet
straeming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 133 +++++++++++++++++-------------
 1 file changed, 74 insertions(+), 59 deletions(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 8bce923dc4bd..010cbf02de4f 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -175,35 +175,22 @@ static void stop_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 	}
 }
 
-static int keep_resources(struct snd_dice *dice,
-			  enum amdtp_stream_direction dir, unsigned int index,
-			  unsigned int rate, unsigned int pcm_chs,
-			  unsigned int midi_ports)
+static int keep_resources(struct snd_dice *dice, struct amdtp_stream *stream,
+			  struct fw_iso_resources *resources, unsigned int rate,
+			  unsigned int pcm_chs, unsigned int midi_ports)
 {
-	struct amdtp_stream *stream;
-	struct fw_iso_resources *resources;
 	bool double_pcm_frames;
 	unsigned int i;
 	int err;
 
-	if (dir == AMDTP_IN_STREAM) {
-		stream = &dice->tx_stream[index];
-		resources = &dice->tx_resources[index];
-	} else {
-		stream = &dice->rx_stream[index];
-		resources = &dice->rx_resources[index];
-	}
-
-	/*
-	 * At 176.4/192.0 kHz, Dice has a quirk to transfer two PCM frames in
-	 * one data block of AMDTP packet. Thus sampling transfer frequency is
-	 * a half of PCM sampling frequency, i.e. PCM frames at 192.0 kHz are
-	 * transferred on AMDTP packets at 96 kHz. Two successive samples of a
-	 * channel are stored consecutively in the packet. This quirk is called
-	 * as 'Dual Wire'.
-	 * For this quirk, blocking mode is required and PCM buffer size should
-	 * be aligned to SYT_INTERVAL.
-	 */
+	// At 176.4/192.0 kHz, Dice has a quirk to transfer two PCM frames in
+	// one data block of AMDTP packet. Thus sampling transfer frequency is
+	// a half of PCM sampling frequency, i.e. PCM frames at 192.0 kHz are
+	// transferred on AMDTP packets at 96 kHz. Two successive samples of a
+	// channel are stored consecutively in the packet. This quirk is called
+	// as 'Dual Wire'.
+	// For this quirk, blocking mode is required and PCM buffer size should
+	// be aligned to SYT_INTERVAL.
 	double_pcm_frames = rate > 96000;
 	if (double_pcm_frames) {
 		rate /= 2;
@@ -230,49 +217,40 @@ static int keep_resources(struct snd_dice *dice,
 				fw_parent_device(dice->unit)->max_speed);
 }
 
-static void finish_session(struct snd_dice *dice, struct reg_params *tx_params,
-			   struct reg_params *rx_params)
+static int keep_dual_resources(struct snd_dice *dice, unsigned int rate,
+			       enum amdtp_stream_direction dir,
+			       struct reg_params *params)
 {
-	stop_streams(dice, AMDTP_IN_STREAM, tx_params);
-	stop_streams(dice, AMDTP_OUT_STREAM, rx_params);
-
-	snd_dice_transaction_clear_enable(dice);
-}
-
-static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
-			 unsigned int rate, struct reg_params *params)
-{
-	__be32 reg[2];
 	enum snd_dice_rate_mode mode;
-	unsigned int i, pcm_chs, midi_ports;
-	struct amdtp_stream *streams;
-	struct fw_iso_resources *resources;
-	struct fw_device *fw_dev = fw_parent_device(dice->unit);
-	int err = 0;
-
-	if (dir == AMDTP_IN_STREAM) {
-		streams = dice->tx_stream;
-		resources = dice->tx_resources;
-	} else {
-		streams = dice->rx_stream;
-		resources = dice->rx_resources;
-	}
+	int i;
+	int err;
 
 	err = snd_dice_stream_get_rate_mode(dice, rate, &mode);
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < params->count; i++) {
+	for (i = 0; i < params->count; ++i) {
+		__be32 reg[2];
+		struct amdtp_stream *stream;
+		struct fw_iso_resources *resources;
 		unsigned int pcm_cache;
 		unsigned int midi_cache;
+		unsigned int pcm_chs;
+		unsigned int midi_ports;
 
 		if (dir == AMDTP_IN_STREAM) {
+			stream = &dice->tx_stream[i];
+			resources = &dice->tx_resources[i];
+
 			pcm_cache = dice->tx_pcm_chs[i][mode];
 			midi_cache = dice->tx_midi_ports[i];
 			err = snd_dice_transaction_read_tx(dice,
 					params->size * i + TX_NUMBER_AUDIO,
 					reg, sizeof(reg));
 		} else {
+			stream = &dice->rx_stream[i];
+			resources = &dice->rx_resources[i];
+
 			pcm_cache = dice->rx_pcm_chs[i][mode];
 			midi_cache = dice->rx_midi_ports[i];
 			err = snd_dice_transaction_read_rx(dice,
@@ -284,7 +262,7 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 		pcm_chs = be32_to_cpu(reg[0]);
 		midi_ports = be32_to_cpu(reg[1]);
 
-		/* These are important for developer of this driver. */
+		// These are important for developer of this driver.
 		if (pcm_chs != pcm_cache || midi_ports != midi_cache) {
 			dev_info(&dice->unit->device,
 				 "cache mismatch: pcm: %u:%u, midi: %u:%u\n",
@@ -292,34 +270,71 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 			return -EPROTO;
 		}
 
-		err = keep_resources(dice, dir, i, rate, pcm_chs, midi_ports);
+		err = keep_resources(dice, stream, resources, rate, pcm_chs,
+				     midi_ports);
 		if (err < 0)
 			return err;
+	}
+
+	return 0;
+}
+
+static void finish_session(struct snd_dice *dice, struct reg_params *tx_params,
+			   struct reg_params *rx_params)
+{
+	stop_streams(dice, AMDTP_IN_STREAM, tx_params);
+	stop_streams(dice, AMDTP_OUT_STREAM, rx_params);
+
+	snd_dice_transaction_clear_enable(dice);
+}
+
+static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
+			 unsigned int rate, struct reg_params *params)
+{
+	unsigned int max_speed = fw_parent_device(dice->unit)->max_speed;
+	int i;
+	int err;
+
+	err = keep_dual_resources(dice, rate, dir, params);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < params->count; i++) {
+		struct amdtp_stream *stream;
+		struct fw_iso_resources *resources;
+		__be32 reg;
+
+		if (dir == AMDTP_IN_STREAM) {
+			stream = dice->tx_stream + i;
+			resources = dice->tx_resources + i;
+		} else {
+			stream = dice->rx_stream + i;
+			resources = dice->rx_resources + i;
+		}
 
-		reg[0] = cpu_to_be32(resources[i].channel);
+		reg = cpu_to_be32(resources->channel);
 		if (dir == AMDTP_IN_STREAM) {
 			err = snd_dice_transaction_write_tx(dice,
 					params->size * i + TX_ISOCHRONOUS,
-					reg, sizeof(reg[0]));
+					&reg, sizeof(reg));
 		} else {
 			err = snd_dice_transaction_write_rx(dice,
 					params->size * i + RX_ISOCHRONOUS,
-					reg, sizeof(reg[0]));
+					&reg, sizeof(reg));
 		}
 		if (err < 0)
 			return err;
 
 		if (dir == AMDTP_IN_STREAM) {
-			reg[0] = cpu_to_be32(fw_dev->max_speed);
+			reg = cpu_to_be32(max_speed);
 			err = snd_dice_transaction_write_tx(dice,
 					params->size * i + TX_SPEED,
-					reg, sizeof(reg[0]));
+					&reg, sizeof(reg));
 			if (err < 0)
 				return err;
 		}
 
-		err = amdtp_stream_start(&streams[i], resources[i].channel,
-					 fw_dev->max_speed);
+		err = amdtp_stream_start(stream, resources->channel, max_speed);
 		if (err < 0)
 			return err;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
