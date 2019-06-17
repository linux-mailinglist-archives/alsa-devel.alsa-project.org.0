Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 709ED47C0E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0559C175D;
	Mon, 17 Jun 2019 10:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0559C175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759752;
	bh=YeYl9UhMUKlxZ3EeHEeh+okA+3C9h7/Xi5Ty1M/zNcU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3P9Fiumxtq/4S4xBLUbtSCFZF3lr0a6zIsexEOpo82U+/tuVj6T3XhCAf+oRR7LC
	 ez8tzemkwfP3Yc8VYLiyeIfpZfN6jRu/ZBYEBNsr12h06sAhIBopr8gx4pW+iHi1V8
	 VDDkQgOE0hlXRKVg2M82cQjuVHLbM6udQA/t4K/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E77F89755;
	Mon, 17 Jun 2019 10:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39933F89738; Mon, 17 Jun 2019 10:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B55F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B55F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Omx+M1bd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wjubzjvU"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5B3A873A;
 Mon, 17 Jun 2019 04:15:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=i1j3E5kI5MXiR
 NQ5ZfbwLtvsWCfsKVF/JY8Jpp+ZZZQ=; b=Omx+M1bdm4FvZ95lcNzajZ2KPpipK
 tuNzvVAu1RTbaFBaXv9PKXLQGBcprbL4unEd1tuKmz/HiJ5yLaRSmpY/WiUfYnv3
 QVO66pfkMveLYLu5gW/G8agN1G/h44/0e/z6yw9ksgrMMDgqMIs2/y7h/BXipzpn
 Cqi4jP0TijHk0X9sb+YlOoNlU/dlVPSgmqG78NCXD4OwoB73hi2Nmh3D8bBMOwzy
 pmWAgobXAmsRiDCeOIfONg0FyrhBh6/aBb00YckPbuY7MPdEjGF9vay537amyJ9w
 O/mRaUSNHRArwWUd9+Ixh8t4Yamo+EXUWJiGZSZdOp261lVkqF68AgghA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=i1j3E5kI5MXiRNQ5ZfbwLtvsWCfsKVF/JY8Jpp+ZZZQ=; b=wjubzjvU
 HchuP2+K97LA1JYRtPHnc4NcnTA9yx9ESTuatVCwKoACe/H+YLq7dkon0d3xuWf3
 E/2ZcAKawxaGz/HfXKLIZjpgVz6UXCG36wFBMAt9TLZRnYvkJeL349q65tAvMa0q
 ItdnPXGEh5uJXOtYWIHEwRecvSHxZrzGga1PBnJxO/ylr3KPXjF2RhYbeh5G3N9H
 UY0vF6dJgLxCitgxtvdUS6spukBkzx5WJI5cwQmaFV0qgGX1kT+VSfyc42gWLs/K
 SAE99sWzepmYMlF0pu8kjHPsuxDbC6YcwOVigg9J/DF3eQi8ltcSU2CEqFgEvzzD
 sWDuiE1hOr90/Q==
X-ME-Sender: <xms:H0wHXcM8VQYyPiKi8oOx7EiF8fvuaxseDPHbruLOyx_h3l5UW_CC7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:H0wHXRdPLERqTd5TNkJbPkyS7a1DnYiie5Jbjx-wjm87o4htMCO7wQ>
 <xmx:H0wHXaFyHCet82Y3cc2BGztAYFGs3DTGadp-sJfedIYqUBnfLu5a5w>
 <xmx:H0wHXUvA61FvrNkPXYOsYrAKuuzpHcTMCZwBqqoZ2j9VC7q4HMa41w>
 <xmx:H0wHXTae668mFHMBBdZE-JxiEGrhK7gSQ6iNXfBUrt8tvNuwzIsWCg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3919880068;
 Mon, 17 Jun 2019 04:15:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:08 +0900
Message-Id: <20190617081510.11025-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/10] ALSA: firewire-motu: reserve/release
	isochronous resources in pcm.hw_params/hw_free callbacks
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
 sound/firewire/motu/motu-midi.c   |  10 ++-
 sound/firewire/motu/motu-pcm.c    |  26 +++++---
 sound/firewire/motu/motu-stream.c | 100 +++++++++++++++++-------------
 sound/firewire/motu/motu.h        |   4 +-
 4 files changed, 84 insertions(+), 56 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 3b205386ed24..a463730c72bc 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -18,8 +18,11 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->substreams_counter++;
-	err = snd_motu_stream_start_duplex(motu, 0);
+	err = snd_motu_stream_reserve_duplex(motu, 0);
+	if (err >= 0) {
+		++motu->substreams_counter;
+		err = snd_motu_stream_start_duplex(motu);
+	}
 
 	mutex_unlock(&motu->mutex);
 
@@ -35,8 +38,9 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->substreams_counter--;
+	--motu->substreams_counter;
 	snd_motu_stream_stop_duplex(motu);
+	snd_motu_stream_release_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
 
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index b0e5ebf05bec..d4e75d3ee928 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -202,12 +202,16 @@ static int capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&motu->mutex);
-		motu->substreams_counter++;
+		err = snd_motu_stream_reserve_duplex(motu, rate);
+		if (err >= 0)
+			++motu->substreams_counter;
 		mutex_unlock(&motu->mutex);
 	}
 
-	return 0;
+	return err;
 }
 static int playback_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *hw_params)
@@ -221,12 +225,16 @@ static int playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&motu->mutex);
-		motu->substreams_counter++;
+		err = snd_motu_stream_reserve_duplex(motu, rate);
+		if (err >= 0)
+			++motu->substreams_counter;
 		mutex_unlock(&motu->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int capture_hw_free(struct snd_pcm_substream *substream)
@@ -236,9 +244,10 @@ static int capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&motu->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		motu->substreams_counter--;
+		--motu->substreams_counter;
 
 	snd_motu_stream_stop_duplex(motu);
+	snd_motu_stream_release_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
 
@@ -252,9 +261,10 @@ static int playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&motu->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		motu->substreams_counter--;
+		--motu->substreams_counter;
 
 	snd_motu_stream_stop_duplex(motu);
+	snd_motu_stream_release_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
 
@@ -267,7 +277,7 @@ static int capture_prepare(struct snd_pcm_substream *substream)
 	int err;
 
 	mutex_lock(&motu->mutex);
-	err = snd_motu_stream_start_duplex(motu, substream->runtime->rate);
+	err = snd_motu_stream_start_duplex(motu);
 	mutex_unlock(&motu->mutex);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&motu->tx_stream);
@@ -280,7 +290,7 @@ static int playback_prepare(struct snd_pcm_substream *substream)
 	int err;
 
 	mutex_lock(&motu->mutex);
-	err = snd_motu_stream_start_duplex(motu, substream->runtime->rate);
+	err = snd_motu_stream_start_duplex(motu);
 	mutex_unlock(&motu->mutex);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&motu->rx_stream);
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 53c43848b137..5630a8f1f2f1 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -60,20 +60,12 @@ static int keep_resources(struct snd_motu *motu, unsigned int rate,
 				fw_parent_device(motu->unit)->max_speed);
 }
 
-static int begin_session(struct snd_motu *motu, unsigned int rate)
+static int begin_session(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
 	int err;
 
-	err = keep_resources(motu, rate, &motu->tx_stream);
-	if (err < 0)
-		return err;
-
-	err = keep_resources(motu, rate, &motu->rx_stream);
-	if (err < 0)
-		return err;
-
 	// Configure the unit to start isochronous communication.
 	err = snd_motu_transaction_read(motu, ISOC_COMM_CONTROL_OFFSET, &reg,
 					sizeof(reg));
@@ -116,9 +108,6 @@ static void finish_session(struct snd_motu *motu)
 	reg = cpu_to_be32(data);
 	snd_motu_transaction_write(motu, ISOC_COMM_CONTROL_OFFSET, &reg,
 				   sizeof(reg));
-
-	fw_iso_resources_free(&motu->tx_resources);
-	fw_iso_resources_free(&motu->rx_resources);
 }
 
 static int start_isoc_ctx(struct snd_motu *motu, struct amdtp_stream *stream)
@@ -136,11 +125,8 @@ static int start_isoc_ctx(struct snd_motu *motu, struct amdtp_stream *stream)
 	if (err < 0)
 		return err;
 
-	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT)) {
-		amdtp_stream_stop(stream);
-		fw_iso_resources_free(resources);
+	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT))
 		return -ETIMEDOUT;
-	}
 
 	return 0;
 }
@@ -172,6 +158,56 @@ int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
+int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate)
+{
+	unsigned int curr_rate;
+	int err;
+
+	err = motu->spec->protocol->get_clock_rate(motu, &curr_rate);
+	if (err < 0)
+		return err;
+	if (rate == 0)
+		rate = curr_rate;
+
+	if (motu->substreams_counter == 0 || curr_rate != rate) {
+		finish_session(motu);
+
+		fw_iso_resources_free(&motu->tx_resources);
+		fw_iso_resources_free(&motu->rx_resources);
+
+		err = motu->spec->protocol->set_clock_rate(motu, rate);
+		if (err < 0) {
+			dev_err(&motu->unit->device,
+				"fail to set sampling rate: %d\n", err);
+			return err;
+		}
+
+		err = snd_motu_stream_cache_packet_formats(motu);
+		if (err < 0)
+			return err;
+
+		err = keep_resources(motu, rate, &motu->tx_stream);
+		if (err < 0)
+			return err;
+
+		err = keep_resources(motu, rate, &motu->rx_stream);
+		if (err < 0) {
+			fw_iso_resources_free(&motu->tx_resources);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+void snd_motu_stream_release_duplex(struct snd_motu *motu)
+{
+	if (motu->substreams_counter == 0) {
+		fw_iso_resources_free(&motu->tx_resources);
+		fw_iso_resources_free(&motu->rx_resources);
+	}
+}
+
 static int ensure_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
@@ -198,46 +234,23 @@ static int ensure_packet_formats(struct snd_motu *motu)
 					  sizeof(reg));
 }
 
-int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
+int snd_motu_stream_start_duplex(struct snd_motu *motu)
 {
-	const struct snd_motu_protocol *protocol = motu->spec->protocol;
-	unsigned int curr_rate;
 	int err = 0;
 
 	if (motu->substreams_counter == 0)
 		return 0;
 
-	err = snd_motu_stream_cache_packet_formats(motu);
-	if (err < 0)
-		return err;
-
-	// Stop stream if rate is different.
-	err = protocol->get_clock_rate(motu, &curr_rate);
-	if (err < 0) {
-		dev_err(&motu->unit->device,
-			"fail to get sampling rate: %d\n", err);
-		return err;
-	}
-	if (rate == 0)
-		rate = curr_rate;
-	if (rate != curr_rate ||
-	    amdtp_streaming_error(&motu->rx_stream) ||
+	if (amdtp_streaming_error(&motu->rx_stream) ||
 	    amdtp_streaming_error(&motu->tx_stream))
 		finish_session(motu);
 
 	if (!amdtp_stream_running(&motu->rx_stream)) {
-		err = protocol->set_clock_rate(motu, rate);
-		if (err < 0) {
-			dev_err(&motu->unit->device,
-				"fail to set sampling rate: %d\n", err);
-			return err;
-		}
-
 		err = ensure_packet_formats(motu);
 		if (err < 0)
 			return err;
 
-		err = begin_session(motu, rate);
+		err = begin_session(motu);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to start isochronous comm: %d\n", err);
@@ -251,7 +264,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 			goto stop_streams;
 		}
 
-		err = protocol->switch_fetching_mode(motu, true);
+		err = motu->spec->protocol->switch_fetching_mode(motu, true);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to enable frame fetching: %d\n", err);
@@ -264,7 +277,6 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to start IR context: %d", err);
-			amdtp_stream_stop(&motu->rx_stream);
 			goto stop_streams;
 		}
 	}
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index ae4b37cdfade..32cd42873fd0 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -153,7 +153,9 @@ void snd_motu_transaction_unregister(struct snd_motu *motu);
 int snd_motu_stream_init_duplex(struct snd_motu *motu);
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu);
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu);
-int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate);
+int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate);
+void snd_motu_stream_release_duplex(struct snd_motu *motu);
+int snd_motu_stream_start_duplex(struct snd_motu *motu);
 void snd_motu_stream_stop_duplex(struct snd_motu *motu);
 int snd_motu_stream_lock_try(struct snd_motu *motu);
 void snd_motu_stream_lock_release(struct snd_motu *motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
