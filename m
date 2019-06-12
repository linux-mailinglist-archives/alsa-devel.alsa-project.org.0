Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4641F9F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D86F170F;
	Wed, 12 Jun 2019 10:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D86F170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329384;
	bh=IOyQYNpdBoximlAnkXwi8GBcjDd4Xc0iRF7dQfZBtiA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFWutOuJhSNJnWrcnsY3wajv6GvexCnzef43hWXeg2cMiVIyUCZcinwJxAHXdmMlj
	 L3Wa+dYwFLYxB528/fhtLopDpnr1/VcrYOTYWT5mFw8TX3JSRy2zblgGsirxix8bRI
	 5hyXCR85ZpKU6QRK2dfxFPPnX+1DvUMLPcb/tqxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA830F89748;
	Wed, 12 Jun 2019 10:44:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5147BF89716; Wed, 12 Jun 2019 10:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A050F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A050F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dCWnkJ1f"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Mt2TXBlQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0B4205B1;
 Wed, 12 Jun 2019 04:44:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=D0ZU6+diY2e/I
 3r6fUQsOs3GJLrYSPNjCBdUcJLPm9A=; b=dCWnkJ1fVtOIvTR47nJDV2fkHl5gf
 H/Jf4GPAIjj8Dl5k1MFEKcu1j9CNAPWlUathU1ZsEpgaN/LK7eIw2B90Xe2UGy4i
 UXfS8554hbOn9fDZ4BHyEVL5Q2AGBX0EtaaURONyu1glqhYQTvpAunQNBo6ySVeg
 MQ76McvDKTv8kogyyNUzn6iJig+hnlw/dhWB6t1j1/aBK+ouSm3JvnpZ0JokZsS8
 2+EBpkzyLCDUv3YwhhRWdjdICKKfSsK8AkFYZQeNCNYk323Bl3AqHj/ddiRPzKqI
 9FU7O66XV0CSVWZjrfylW0EDRToLEnU9l/mRXtp1e3UmVMQ8qD4hzm4Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=D0ZU6+diY2e/I3r6fUQsOs3GJLrYSPNjCBdUcJLPm9A=; b=Mt2TXBlQ
 wk0dDgYCgb5Ok3W2zOr5lztbPR0zP2hdxyPVThUcxbWLOV0eTSm1nCfGj/RYnALf
 x/zHF3T4vliCnceG6gsbduNWr8ZO3oINFraQ5+qmvucyIyLzh1OjhosLixJSllZs
 GjkHtx4ivO3YESiZVobHeMKyUi3xgT1Xr7PuqCt9U1tU2MdWLTdsjtAFRZAOulKs
 Run9pnSdOM0Z5AHifEM+MtTX/3FWJQG5fV18ztahX3x22mwLz0uBSSTrg7YXrvjX
 i0E/9buJv9KWWxfNwDpYxXmC2lMxhtX2ffrXWjZ/RbV7/NSIDpiYrhHoTGnVWGws
 K5eUXrML62wVOA==
X-ME-Sender: <xms:crsAXXAyg38ecXK-YGRx4-uaK3vipqN9m49H_BUflwmhppyP-PbHAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:crsAXfA1NIvNOWi4mZ0lbhJgv43QvFquXsHNwvFW8umiU5E7-17cng>
 <xmx:crsAXbMlCbzDQUGuGKSDcS9p9zDeW95X8w2ATbJtes49-wA8QUZD2Q>
 <xmx:crsAXbzxIIhglCPn6ljP_FPrpvO-WbscV6CWoi5SXp15Ey0CKmQBbQ>
 <xmx:crsAXZ77XLGnAGJ6KD3541wmN4D2DNyziddVnmBpOYb4BEy6yjpS0Q>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40721380087;
 Wed, 12 Jun 2019 04:44:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:08 +0900
Message-Id: <20190612084422.5344-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/19] ALSA: fireworks: unify substream counter
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

It's inconvenient to handle two isochronous context separately
each other. This commit unifies the counters to handle the two
at the same time.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h        |  3 +--
 sound/firewire/fireworks/fireworks_midi.c   |  8 +++---
 sound/firewire/fireworks/fireworks_pcm.c    |  8 +++---
 sound/firewire/fireworks/fireworks_stream.c | 27 ++++++++-------------
 4 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 9b19c7f05d57..42a73038ba4d 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -89,8 +89,7 @@ struct snd_efw {
 	struct amdtp_stream rx_stream;
 	struct cmp_connection out_conn;
 	struct cmp_connection in_conn;
-	unsigned int capture_substreams;
-	unsigned int playback_substreams;
+	unsigned int substreams_counter;
 
 	/* hardware metering parameters */
 	unsigned int phys_out;
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index f5da2cd4ce42..7e78cdfe699e 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -18,7 +18,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 		goto end;
 
 	mutex_lock(&efw->mutex);
-	efw->capture_substreams++;
+	++efw->substreams_counter;
 	err = snd_efw_stream_start_duplex(efw, 0);
 	mutex_unlock(&efw->mutex);
 	if (err < 0)
@@ -38,7 +38,7 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 		goto end;
 
 	mutex_lock(&efw->mutex);
-	efw->playback_substreams++;
+	++efw->substreams_counter;
 	err = snd_efw_stream_start_duplex(efw, 0);
 	mutex_unlock(&efw->mutex);
 	if (err < 0)
@@ -52,7 +52,7 @@ static int midi_capture_close(struct snd_rawmidi_substream *substream)
 	struct snd_efw *efw = substream->rmidi->private_data;
 
 	mutex_lock(&efw->mutex);
-	efw->capture_substreams--;
+	--efw->substreams_counter;
 	snd_efw_stream_stop_duplex(efw);
 	mutex_unlock(&efw->mutex);
 
@@ -65,7 +65,7 @@ static int midi_playback_close(struct snd_rawmidi_substream *substream)
 	struct snd_efw *efw = substream->rmidi->private_data;
 
 	mutex_lock(&efw->mutex);
-	efw->playback_substreams--;
+	--efw->substreams_counter;
 	snd_efw_stream_stop_duplex(efw);
 	mutex_unlock(&efw->mutex);
 
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index aed566d82726..a66f6a381dac 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -232,7 +232,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&efw->mutex);
-		efw->capture_substreams++;
+		++efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
 	}
 
@@ -251,7 +251,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&efw->mutex);
-		efw->playback_substreams++;
+		++efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
 	}
 
@@ -264,7 +264,7 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&efw->mutex);
-		efw->capture_substreams--;
+		--efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
 	}
 
@@ -278,7 +278,7 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&efw->mutex);
-		efw->playback_substreams--;
+		--efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
 	}
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 74e122e6e68a..2df39befcde0 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -194,9 +194,9 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
 	unsigned int curr_rate;
 	int err = 0;
 
-	/* Need no substreams */
-	if (efw->playback_substreams == 0 && efw->capture_substreams  == 0)
-		goto end;
+	// Need no substreams.
+	if (efw->substreams_counter == 0)
+		return -EIO;
 
 	/*
 	 * Considering JACK/FFADO streaming:
@@ -206,19 +206,15 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
 	if (err < 0)
 		goto end;
 
-	/* packet queueing error */
-	if (amdtp_streaming_error(&efw->tx_stream))
-		stop_stream(efw, &efw->tx_stream);
-	if (amdtp_streaming_error(&efw->rx_stream))
-		stop_stream(efw, &efw->rx_stream);
-
 	/* stop streams if rate is different */
 	err = snd_efw_command_get_sampling_rate(efw, &curr_rate);
 	if (err < 0)
 		goto end;
 	if (rate == 0)
 		rate = curr_rate;
-	if (rate != curr_rate) {
+	if (rate != curr_rate ||
+	    amdtp_streaming_error(&efw->tx_stream) ||
+	    amdtp_streaming_error(&efw->rx_stream)) {
 		stop_stream(efw, &efw->tx_stream);
 		stop_stream(efw, &efw->rx_stream);
 	}
@@ -237,13 +233,12 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
 		}
 	}
 
-	/* start slave if needed */
-	if (efw->capture_substreams > 0 &&
-	    !amdtp_stream_running(&efw->tx_stream)) {
+	if (!amdtp_stream_running(&efw->tx_stream)) {
 		err = start_stream(efw, &efw->tx_stream, rate);
 		if (err < 0) {
 			dev_err(&efw->unit->device,
 				"fail to start AMDTP slave stream:%d\n", err);
+			stop_stream(efw, &efw->tx_stream);
 			stop_stream(efw, &efw->rx_stream);
 		}
 	}
@@ -253,11 +248,9 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
 
 void snd_efw_stream_stop_duplex(struct snd_efw *efw)
 {
-	if (efw->capture_substreams == 0) {
+	if (efw->substreams_counter == 0) {
 		stop_stream(efw, &efw->tx_stream);
-
-		if (efw->playback_substreams == 0)
-			stop_stream(efw, &efw->rx_stream);
+		stop_stream(efw, &efw->rx_stream);
 	}
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
