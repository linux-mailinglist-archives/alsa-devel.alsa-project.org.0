Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35D809B2
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E82166E;
	Sun,  4 Aug 2019 08:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E82166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900390;
	bh=WBwPnQZl/BGj81SEUbpok/M6G3nsPx8dv+EvFiZM4Pg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1xVnkzo8l5Zbw1a/jk3jleCWa4CioBHELxZqSrx89JfL9LyJsbTLentrn6lU53JD
	 bmgG6wyl0JrTqUTKpIGOdfcmLY7DTmeyZXISjbouNoEDyi2EGK2cVmtIRPnVWHSAtL
	 Y02wxLS32KNRiYM3L8yAM0yh/BPFmyd5vONMkyAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA9FF80717;
	Sun,  4 Aug 2019 08:22:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16906F804CA; Sun,  4 Aug 2019 08:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70C6F804CA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70C6F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ONXnF02E"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cCG41JdK"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 20F67218BB;
 Sun,  4 Aug 2019 02:22:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BoIgAYADyTg4d
 BMd5MavERt6TzlrimK2ihh1IDFZhLc=; b=ONXnF02ERqt8jyDFU+4kMHUZtlORx
 Nz7C63LoX2Snd/uXNBgnfWo5+a/D5e5BVhAgNcJHQG+U4H9vTjTB52c+Va8xeXDp
 pO/UrYhwSV1PIdelB7C+++Lgz2e88cywRGEfmlP6e3Pd/o/4yXZ/h6gx72yKc+B1
 Ud41RQPJX8dUokEpkgCpS1oMBA/6wKDdRxa/DLdE+YojmHFOEPmsNGwryqnuc+wP
 57xSmgbdkTl9exC88m9cyEpFuD3mvE+WUKKuOWGN8gSwil2GCIv7t9MlXXVW7eI4
 eiga6xE/nbWsKh7Wb4X37NOeOqmhoG51QM3eiUe9hVRUIGe76SLLnIlNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BoIgAYADyTg4dBMd5MavERt6TzlrimK2ihh1IDFZhLc=; b=cCG41JdK
 KI6f16iynNiLq/wEv5eO1W8Dr24msa4WcxJwyWzPciPC8Icva8ODj66qNXYzz9DS
 MUDqW1mTC7mo4Hw2knoi5G1Amr8qk3PPDxT+qGSrvxJwIce80GKk7MTwkflpmWAR
 sjAuy1+327mnsJ5czS7h5sbetshuMaKxnjTDRtpaJZp+8CJuWfZ3EODcFzjA0JL6
 9RUtGnCPuGvZm3BZMkqAj0ASnqCuqq76HbN7DbxMcJW/90abDuk+rW/j9Cxa09/Z
 ln8gyu5ehon793rSrE5gDyfISGRiaH4ol/BOleF9REQQmACGRJkHW6nqfvziFqsa
 SHsdzVAkagEUSw==
X-ME-Sender: <xms:i3lGXbZOsIChe1GqdkpBM8DWzOZwoWwPtlAUQbDrpeefSt7fKypdKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddt
X-ME-Proxy: <xmx:i3lGXWv0O1d-RO_GgOWeoUgjTYrxZzkjbL81MrbVMnObg_4XYmHeUg>
 <xmx:i3lGXQs9wi0jO5hXvUCGyUWN4kvWVt_wIq1OvAXGSd4KGR39sFvhxQ>
 <xmx:i3lGXTd_Q6c4GI9pl7u772M31ryVFLLXu9RD9yZvwdgcxl7aksd4AA>
 <xmx:jHlGXYYoqMtIXZoJgBw_W8XmzoFVDtjE6blHn0XDiEy44mYRe0s_sg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A36D7380083;
 Sun,  4 Aug 2019 02:22:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:33 +0900
Message-Id: <20190804062138.1217-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 14/19] ALSA: dice: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA dice driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 32 ++++++++++++++++++++++++-------
 sound/firewire/dice/dice.h        |  2 ++
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index a9f0c77734c3..af8c5a2c28f3 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -154,14 +154,10 @@ static void stop_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 	for (i = 0; i < params->count; i++) {
 		reg = cpu_to_be32((u32)-1);
 		if (dir == AMDTP_IN_STREAM) {
-			amdtp_stream_stop(&dice->tx_stream[i]);
-
 			snd_dice_transaction_write_tx(dice,
 					params->size * i + TX_ISOCHRONOUS,
 					&reg, sizeof(reg));
 		} else {
-			amdtp_stream_stop(&dice->rx_stream[i]);
-
 			snd_dice_transaction_write_rx(dice,
 					params->size * i + RX_ISOCHRONOUS,
 					&reg, sizeof(reg));
@@ -297,10 +293,11 @@ int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate)
 	if (dice->substreams_counter == 0 || curr_rate != rate) {
 		struct reg_params tx_params, rx_params;
 
+		amdtp_domain_stop(&dice->domain);
+
 		err = get_register_params(dice, &tx_params, &rx_params);
 		if (err < 0)
 			return err;
-
 		finish_session(dice, &tx_params, &rx_params);
 
 		release_resources(dice);
@@ -377,7 +374,8 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 				return err;
 		}
 
-		err = amdtp_stream_start(stream, resources->channel, max_speed);
+		err = amdtp_domain_add_stream(&dice->domain, stream,
+					      resources->channel, max_speed);
 		if (err < 0)
 			return err;
 	}
@@ -410,6 +408,7 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 	for (i = 0; i < MAX_STREAMS; ++i) {
 		if (amdtp_streaming_error(&dice->tx_stream[i]) ||
 		    amdtp_streaming_error(&dice->rx_stream[i])) {
+			amdtp_domain_stop(&dice->domain);
 			finish_session(dice, &tx_params, &rx_params);
 			break;
 		}
@@ -456,6 +455,10 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 			goto error;
 		}
 
+		err = amdtp_domain_start(&dice->domain);
+		if (err < 0)
+			goto error;
+
 		for (i = 0; i < MAX_STREAMS; i++) {
 			if ((i < tx_params.count &&
 			    !amdtp_stream_wait_callback(&dice->tx_stream[i],
@@ -471,6 +474,7 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 
 	return 0;
 error:
+	amdtp_domain_stop(&dice->domain);
 	finish_session(dice, &tx_params, &rx_params);
 	return err;
 }
@@ -485,8 +489,10 @@ void snd_dice_stream_stop_duplex(struct snd_dice *dice)
 	struct reg_params tx_params, rx_params;
 
 	if (dice->substreams_counter == 0) {
-		if (get_register_params(dice, &tx_params, &rx_params) >= 0)
+		if (get_register_params(dice, &tx_params, &rx_params) >= 0) {
+			amdtp_domain_stop(&dice->domain);
 			finish_session(dice, &tx_params, &rx_params);
+		}
 
 		release_resources(dice);
 	}
@@ -567,6 +573,14 @@ int snd_dice_stream_init_duplex(struct snd_dice *dice)
 			break;
 		}
 	}
+
+	err = amdtp_domain_init(&dice->domain);
+	if (err < 0) {
+		for (i = 0; i < MAX_STREAMS; ++i) {
+			destroy_stream(dice, AMDTP_OUT_STREAM, i);
+			destroy_stream(dice, AMDTP_IN_STREAM, i);
+		}
+	}
 end:
 	return err;
 }
@@ -579,6 +593,8 @@ void snd_dice_stream_destroy_duplex(struct snd_dice *dice)
 		destroy_stream(dice, AMDTP_IN_STREAM, i);
 		destroy_stream(dice, AMDTP_OUT_STREAM, i);
 	}
+
+	amdtp_domain_destroy(&dice->domain);
 }
 
 void snd_dice_stream_update_duplex(struct snd_dice *dice)
@@ -596,6 +612,8 @@ void snd_dice_stream_update_duplex(struct snd_dice *dice)
 	dice->global_enabled = false;
 
 	if (get_register_params(dice, &tx_params, &rx_params) == 0) {
+		amdtp_domain_stop(&dice->domain);
+
 		stop_streams(dice, AMDTP_IN_STREAM, &tx_params);
 		stop_streams(dice, AMDTP_OUT_STREAM, &rx_params);
 	}
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index c6304e5e9fc4..fa6d74303f54 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -112,6 +112,8 @@ struct snd_dice {
 	bool global_enabled;
 	struct completion clock_accepted;
 	unsigned int substreams_counter;
+
+	struct amdtp_domain domain;
 };
 
 enum snd_dice_addr_type {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
