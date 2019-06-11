Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6C3CCFB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A30C175B;
	Tue, 11 Jun 2019 15:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A30C175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259803;
	bh=CecyYJ1X0OlSGGq5tNGMI7jUIP/cze13qC8A2nsyY6o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BdrC1rsAh0vV8OqiV3wQHlAbU3pegqzloXvNNNUFBq+Q47mh1TagmkNRC+tI+KIe7
	 jWcDJauQwo8UchRbIlIx+/B09kO+lLunErbMOdGD1wiUgX/dGPZOKLxHQOcJ9o0tLL
	 EVowCC6HTJtkRoLwCU/CcWN45CL83LED4x+fkzjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC638F89767;
	Tue, 11 Jun 2019 15:21:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB331F89730; Tue, 11 Jun 2019 15:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56BA1F89733
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BA1F89733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QJ5MHOWf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HoWQQxeT"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EE50222B8;
 Tue, 11 Jun 2019 09:21:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=g5Sa3iPdRgZqJ
 iLRo32Jo5ngbGkKzYaUvEioM97yYP0=; b=QJ5MHOWfwboSvRg0f5guQKpzqxiAX
 UjEs7Z0nai6k1GQkvwMOpfzi2DSzxkqWUr0ubaBuzvoDLTEHV8FBjygReY/GRXV8
 wMCfSH+hP8pMArBfn+7WHwL8pNPyvc1YI45e2EAhEF8ERovPA3tnd652Mo9m+DkC
 6sHNmMXpL5CydPPMEQ2HM0amDEvIvSILJs3LQuuxMo/5U+Eg9LTsnZbFM44H2o3v
 LoHvEVsC1SULLOUc2rLClkjh0THdKSRh53FkP60j17rMsL9e7ZbvqRcwy9WVMz//
 ENRly4cluaCxQVZ/zxhPJgr0ZvkNHq3jsaGMBNgw6IAe3iXrhM5rq9dRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=g5Sa3iPdRgZqJiLRo32Jo5ngbGkKzYaUvEioM97yYP0=; b=HoWQQxeT
 th9zucH2EF0StOfD7+FRDjFA2p8ydDGI/cpOH9rxvFs95cyLU4uQBIvVMKjW46e+
 nPXIkKblkZTEeUrhEwz4VGGrICNHezGKTqtBXJPrMjfTRO9ImfBL7wIL2vvw/PDs
 pisXWOJsroYtzLLQU91YTO0k3P8wy7z34i/gtiNgfNmWbc4BQsJzLoKvoyceWwOF
 2CPy1kuTNghdZ1fzIkWNmIFYOQGsSimgKHg1LRiMZOwylQpizM/ZgOgo5f60tJyk
 CsZ+em92/SFDI8cqLcdHpMRm+7HVwmq/fmUbXcH6vC1JIl4KFoObkoulV9uNdT/p
 gBVwf0+V8CMvNQ==
X-ME-Sender: <xms:5ar_XHWUu3Qd5jfJxVp2IxVBJ491z1TFVnOGzcITLcd9wnTcEg1okg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeple
X-ME-Proxy: <xmx:5ar_XENzImDX8gTANmKdA_dJq8W22ErqmZIJLgIbgVK_k6TJls_EfA>
 <xmx:5ar_XGGucIIoPY53UwfrUzH9DFDIyeYbhJ2R6dmUcGWH2B388MMHVQ>
 <xmx:5ar_XBoMvzjQpKCLV50Xo6VbQFa0PlWsWeC0cwspZk2RLbex7C42_g>
 <xmx:5ar_XPEgB-_ThMyj5Hatcfa-Y2AxwoR3ktAkx1HC0OAoSnIleuFkBQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CA71380083;
 Tue, 11 Jun 2019 09:21:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:16 +0900
Message-Id: <20190611132118.8378-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/12] ALSA: dice: reserve/release isochronous
	resources in pcm.hw_params/hw_free callbacks
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

Once allocated, isochronous resources are available for packet
streaming, even if the streaming is cancelled. For this reason,
current implementation handles allocation of the resources and
starting packet streaming at the same time. However, this brings
complicated procedure to start packet streaming.

This commit separates the allocation and starting. The allocation is
done in pcm.hw_params callback and available till pcm.hw_free callback.
Even if any XRUN occurs, pcm.prepare callback is done to restart
packet streaming without releasing/allocating the resources.

There are two points to stop packet streaming; in pcm.hw_params and
pcm.prepare callbacks. The former point is a case that packet streaming
is already started for any MIDI substream then packet streaming is
requested with different sampling transfer frequency for any PCM
substream. The latter point is cases of any XRUN or packet queueing
error.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-midi.c   |  10 +-
 sound/firewire/dice/dice-pcm.c    |  26 ++--
 sound/firewire/dice/dice-stream.c | 218 ++++++++++++++++--------------
 sound/firewire/dice/dice.h        |   4 +-
 4 files changed, 143 insertions(+), 115 deletions(-)

diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 84eca8a51a02..6172dad87c4e 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -18,8 +18,11 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&dice->mutex);
 
-	dice->substreams_counter++;
-	err = snd_dice_stream_start_duplex(dice, 0);
+	err = snd_dice_stream_reserve_duplex(dice, 0);
+	if (err >= 0) {
+		++dice->substreams_counter;
+		err = snd_dice_stream_start_duplex(dice);
+	}
 
 	mutex_unlock(&dice->mutex);
 
@@ -35,8 +38,9 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&dice->mutex);
 
-	dice->substreams_counter--;
+	--dice->substreams_counter;
 	snd_dice_stream_stop_duplex(dice);
+	snd_dice_stream_release_duplex(dice);
 
 	mutex_unlock(&dice->mutex);
 
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index bb3ef5ff3488..6c7a6b7ed743 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -243,12 +243,16 @@ static int capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&dice->mutex);
-		dice->substreams_counter++;
+		err = snd_dice_stream_reserve_duplex(dice, rate);
+		if (err >= 0)
+			++dice->substreams_counter;
 		mutex_unlock(&dice->mutex);
 	}
 
-	return 0;
+	return err;
 }
 static int playback_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *hw_params)
@@ -262,12 +266,16 @@ static int playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&dice->mutex);
-		dice->substreams_counter++;
+		err = snd_dice_stream_reserve_duplex(dice, rate);
+		if (err >= 0)
+			++dice->substreams_counter;
 		mutex_unlock(&dice->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int capture_hw_free(struct snd_pcm_substream *substream)
@@ -277,9 +285,10 @@ static int capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&dice->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		dice->substreams_counter--;
+		--dice->substreams_counter;
 
 	snd_dice_stream_stop_duplex(dice);
+	snd_dice_stream_release_duplex(dice);
 
 	mutex_unlock(&dice->mutex);
 
@@ -293,9 +302,10 @@ static int playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&dice->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		dice->substreams_counter--;
+		--dice->substreams_counter;
 
 	snd_dice_stream_stop_duplex(dice);
+	snd_dice_stream_release_duplex(dice);
 
 	mutex_unlock(&dice->mutex);
 
@@ -309,7 +319,7 @@ static int capture_prepare(struct snd_pcm_substream *substream)
 	int err;
 
 	mutex_lock(&dice->mutex);
-	err = snd_dice_stream_start_duplex(dice, substream->runtime->rate);
+	err = snd_dice_stream_start_duplex(dice);
 	mutex_unlock(&dice->mutex);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(stream);
@@ -323,7 +333,7 @@ static int playback_prepare(struct snd_pcm_substream *substream)
 	int err;
 
 	mutex_lock(&dice->mutex);
-	err = snd_dice_stream_start_duplex(dice, substream->runtime->rate);
+	err = snd_dice_stream_start_duplex(dice);
 	mutex_unlock(&dice->mutex);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(stream);
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 010cbf02de4f..6bbf7421a53c 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -138,18 +138,9 @@ static int get_register_params(struct snd_dice *dice,
 
 static void release_resources(struct snd_dice *dice)
 {
-	unsigned int i;
-
-	for (i = 0; i < MAX_STREAMS; i++) {
-		if (amdtp_stream_running(&dice->tx_stream[i])) {
-			amdtp_stream_pcm_abort(&dice->tx_stream[i]);
-			amdtp_stream_stop(&dice->tx_stream[i]);
-		}
-		if (amdtp_stream_running(&dice->rx_stream[i])) {
-			amdtp_stream_pcm_abort(&dice->rx_stream[i]);
-			amdtp_stream_stop(&dice->rx_stream[i]);
-		}
+	int i;
 
+	for (i = 0; i < MAX_STREAMS; ++i) {
 		fw_iso_resources_free(&dice->tx_resources[i]);
 		fw_iso_resources_free(&dice->rx_resources[i]);
 	}
@@ -164,10 +155,14 @@ static void stop_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 	for (i = 0; i < params->count; i++) {
 		reg = cpu_to_be32((u32)-1);
 		if (dir == AMDTP_IN_STREAM) {
+			amdtp_stream_stop(&dice->tx_stream[i]);
+
 			snd_dice_transaction_write_tx(dice,
 					params->size * i + TX_ISOCHRONOUS,
 					&reg, sizeof(reg));
 		} else {
+			amdtp_stream_stop(&dice->rx_stream[i]);
+
 			snd_dice_transaction_write_rx(dice,
 					params->size * i + RX_ISOCHRONOUS,
 					&reg, sizeof(reg));
@@ -288,6 +283,65 @@ static void finish_session(struct snd_dice *dice, struct reg_params *tx_params,
 	snd_dice_transaction_clear_enable(dice);
 }
 
+int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate)
+{
+	unsigned int curr_rate;
+	int err;
+
+	// Check sampling transmission frequency.
+	err = snd_dice_transaction_get_rate(dice, &curr_rate);
+	if (err < 0)
+		return err;
+	if (rate == 0)
+		rate = curr_rate;
+
+	if (dice->substreams_counter == 0 || curr_rate != rate) {
+		struct reg_params tx_params, rx_params;
+
+		err = get_register_params(dice, &tx_params, &rx_params);
+		if (err < 0)
+			return err;
+
+		finish_session(dice, &tx_params, &rx_params);
+
+		release_resources(dice);
+
+		// Just after owning the unit (GLOBAL_OWNER), the unit can
+		// return invalid stream formats. Selecting clock parameters
+		// have an effect for the unit to refine it.
+		err = ensure_phase_lock(dice, rate);
+		if (err < 0)
+			return err;
+
+		// After changing sampling transfer frequency, the value of
+		// register can be changed.
+		err = get_register_params(dice, &tx_params, &rx_params);
+		if (err < 0)
+			return err;
+
+		err = keep_dual_resources(dice, rate, AMDTP_IN_STREAM,
+					  &tx_params);
+		if (err < 0)
+			goto error;
+
+		err = keep_dual_resources(dice, rate, AMDTP_OUT_STREAM,
+					  &rx_params);
+		if (err < 0)
+			goto error;
+	}
+
+	return 0;
+error:
+	release_resources(dice);
+	return err;
+}
+
+void snd_dice_stream_release_duplex(struct snd_dice *dice)
+{
+	if (dice->substreams_counter == 0)
+		release_resources(dice);
+}
+
 static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 			 unsigned int rate, struct reg_params *params)
 {
@@ -295,10 +349,6 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 	int i;
 	int err;
 
-	err = keep_dual_resources(dice, rate, dir, params);
-	if (err < 0)
-		return err;
-
 	for (i = 0; i < params->count; i++) {
 		struct amdtp_stream *stream;
 		struct fw_iso_resources *resources;
@@ -342,102 +392,39 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 	return err;
 }
 
-static int start_duplex_streams(struct snd_dice *dice, unsigned int rate)
-{
-	struct reg_params tx_params, rx_params;
-	int i;
-	int err;
-
-	err = get_register_params(dice, &tx_params, &rx_params);
-	if (err < 0)
-		return err;
-
-	// Stop transmission.
-	finish_session(dice, &tx_params, &rx_params);
-	release_resources(dice);
-
-	err = ensure_phase_lock(dice, rate);
-	if (err < 0) {
-		dev_err(&dice->unit->device, "fail to ensure phase lock\n");
-		return err;
-	}
-
-	/* Likely to have changed stream formats. */
-	err = get_register_params(dice, &tx_params, &rx_params);
-	if (err < 0)
-		return err;
-
-	/* Start both streams. */
-	err = start_streams(dice, AMDTP_IN_STREAM, rate, &tx_params);
-	if (err < 0)
-		goto error;
-	err = start_streams(dice, AMDTP_OUT_STREAM, rate, &rx_params);
-	if (err < 0)
-		goto error;
-
-	err = snd_dice_transaction_set_enable(dice);
-	if (err < 0) {
-		dev_err(&dice->unit->device, "fail to enable interface\n");
-		goto error;
-	}
-
-	for (i = 0; i < MAX_STREAMS; i++) {
-		if ((i < tx_params.count &&
-		    !amdtp_stream_wait_callback(&dice->tx_stream[i],
-						CALLBACK_TIMEOUT)) ||
-		    (i < rx_params.count &&
-		     !amdtp_stream_wait_callback(&dice->rx_stream[i],
-						 CALLBACK_TIMEOUT))) {
-			err = -ETIMEDOUT;
-			goto error;
-		}
-	}
-
-	return 0;
-error:
-	finish_session(dice, &tx_params, &rx_params);
-	release_resources(dice);
-	return err;
-}
-
 /*
  * MEMO: After this function, there're two states of streams:
  *  - None streams are running.
  *  - All streams are running.
  */
-int snd_dice_stream_start_duplex(struct snd_dice *dice, unsigned int rate)
+int snd_dice_stream_start_duplex(struct snd_dice *dice)
 {
-	unsigned int curr_rate;
+	struct reg_params tx_params, rx_params;
 	unsigned int i;
+	unsigned int rate;
 	enum snd_dice_rate_mode mode;
 	int err;
 
 	if (dice->substreams_counter == 0)
 		return -EIO;
 
-	/* Check sampling transmission frequency. */
-	err = snd_dice_transaction_get_rate(dice, &curr_rate);
-	if (err < 0) {
-		dev_err(&dice->unit->device,
-			"fail to get sampling rate\n");
+	err = get_register_params(dice, &tx_params, &rx_params);
+	if (err < 0)
 		return err;
-	}
-	if (rate == 0)
-		rate = curr_rate;
-	if (rate != curr_rate)
-		goto restart;
 
-	/* Check error of packet streaming. */
+	// Check error of packet streaming.
 	for (i = 0; i < MAX_STREAMS; ++i) {
-		if (amdtp_streaming_error(&dice->tx_stream[i]))
-			break;
-		if (amdtp_streaming_error(&dice->rx_stream[i]))
+		if (amdtp_streaming_error(&dice->tx_stream[i]) ||
+		    amdtp_streaming_error(&dice->rx_stream[i])) {
+			finish_session(dice, &tx_params, &rx_params);
 			break;
+		}
 	}
-	if (i < MAX_STREAMS)
-		goto restart;
 
-	/* Check required streams are running or not. */
+	// Check required streams are running or not.
+	err = snd_dice_transaction_get_rate(dice, &rate);
+	if (err < 0)
+		return err;
 	err = snd_dice_stream_get_rate_mode(dice, rate, &mode);
 	if (err < 0)
 		return err;
@@ -449,12 +436,40 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice, unsigned int rate)
 		    !amdtp_stream_running(&dice->rx_stream[i]))
 			break;
 	}
-	if (i < MAX_STREAMS)
-		goto restart;
+	if (i < MAX_STREAMS) {
+		// Start both streams.
+		err = start_streams(dice, AMDTP_IN_STREAM, rate, &tx_params);
+		if (err < 0)
+			goto error;
+
+		err = start_streams(dice, AMDTP_OUT_STREAM, rate, &rx_params);
+		if (err < 0)
+			goto error;
+
+		err = snd_dice_transaction_set_enable(dice);
+		if (err < 0) {
+			dev_err(&dice->unit->device,
+				"fail to enable interface\n");
+			goto error;
+		}
+
+		for (i = 0; i < MAX_STREAMS; i++) {
+			if ((i < tx_params.count &&
+			    !amdtp_stream_wait_callback(&dice->tx_stream[i],
+							CALLBACK_TIMEOUT)) ||
+			    (i < rx_params.count &&
+			     !amdtp_stream_wait_callback(&dice->rx_stream[i],
+							 CALLBACK_TIMEOUT))) {
+				err = -ETIMEDOUT;
+				goto error;
+			}
+		}
+	}
 
 	return 0;
-restart:
-	return start_duplex_streams(dice, rate);
+error:
+	finish_session(dice, &tx_params, &rx_params);
+	return err;
 }
 
 /*
@@ -466,13 +481,10 @@ void snd_dice_stream_stop_duplex(struct snd_dice *dice)
 {
 	struct reg_params tx_params, rx_params;
 
-	if (dice->substreams_counter > 0)
-		return;
-
-	if (get_register_params(dice, &tx_params, &rx_params) >= 0)
-		finish_session(dice, &tx_params, &rx_params);
-
-	release_resources(dice);
+	if (dice->substreams_counter == 0) {
+		if (get_register_params(dice, &tx_params, &rx_params) >= 0)
+			finish_session(dice, &tx_params, &rx_params);
+	}
 }
 
 static int init_stream(struct snd_dice *dice, enum amdtp_stream_direction dir,
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 9699adc2a96d..f95073b85010 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -205,10 +205,12 @@ extern const unsigned int snd_dice_rates[SND_DICE_RATES_COUNT];
 
 int snd_dice_stream_get_rate_mode(struct snd_dice *dice, unsigned int rate,
 				  enum snd_dice_rate_mode *mode);
-int snd_dice_stream_start_duplex(struct snd_dice *dice, unsigned int rate);
+int snd_dice_stream_start_duplex(struct snd_dice *dice);
 void snd_dice_stream_stop_duplex(struct snd_dice *dice);
 int snd_dice_stream_init_duplex(struct snd_dice *dice);
 void snd_dice_stream_destroy_duplex(struct snd_dice *dice);
+int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate);
+void snd_dice_stream_release_duplex(struct snd_dice *dice);
 void snd_dice_stream_update_duplex(struct snd_dice *dice);
 int snd_dice_stream_detect_current_formats(struct snd_dice *dice);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
