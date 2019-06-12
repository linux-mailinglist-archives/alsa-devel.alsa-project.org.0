Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D541FB1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEB11760;
	Wed, 12 Jun 2019 10:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEB11760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329509;
	bh=15nw8OcJKuc/e7Pq5IA331+OOh9uHL+pQCApGiHDMT0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdVUQ/NymB3FE2uzaJIj+Mo26mZDgNfC0TMTIQ+rZ3SANa73igLEAv9LEp8S7zgEW
	 lwvdwxRyhnoTPHTMqBGt4XC26zP53ZtU6J9qpceJbewAY4H7VMSxng7LWgfCtmItVc
	 DSJ5nApJjWT8MqF7iEPileQRKEBxML3HjPlIQSJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DA74F8975D;
	Wed, 12 Jun 2019 10:44:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7857DF89740; Wed, 12 Jun 2019 10:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45CFDF89737
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45CFDF89737
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nSqwZny1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e8RierQN"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id AF31C46C;
 Wed, 12 Jun 2019 04:44:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5poLbrQ3fO81p
 dNt8Mvc1UEs8/ubtlQpMUCQK6VMLGo=; b=nSqwZny14Lsi6lsev9aIG5lGPkwFK
 OUNorWoRSUqRQzHWchyoOd9ltu+gB3wIPSF9L6s3r0exSitfmSLTAGofd65OxMGo
 kdwECsxRgP1tVYeQ2vokEGcq73/3nK9p4y1YB0tdqcRtg31D4sZAsFal9jwWah4G
 xXfATqUlXvhEHVKYCzqsoE3Xe3xpEXtzE2KTw6W7fGqTKyltwT0IvXNpchF89KHr
 ovSrFW5sNzjnTndcpPWjl3NWiWmNK+FZy0FuOWeyOx5iZ7dgWdMPKlw/mzawkOEF
 sOeuwdTWtjf/kdAoXfSR0LP8C1eIHWpVKkgrOz03WOn6lVHqmcIjRMlMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5poLbrQ3fO81pdNt8Mvc1UEs8/ubtlQpMUCQK6VMLGo=; b=e8RierQN
 T4z5iyESLwl310orsPSknFKjQFFDTdTk59+0LALUngYpln1FlIpcqdmGVNXb+Hrt
 At76bNBpjJbKpOZnKZuF1Ms5iB0iOcvaWgKQwCIiKUqC4EgYnHehr7esyi6oURlr
 9hwy5Qpe2QIqQTSxInse6Wgg9vJ3pM+3Oce7//cYwEkNFBoA/czKdLPxyqhvhKlS
 hktD7qT2W5CYkxIfK4vU1Jd0ITEA7FDWGUspJFcXuuDUBK9A5H0H7CJAIy1nYEpt
 SwdMBfZC6aEruxAq4L3Zx3qOZeXW7dwAlMck+MKW7XUHSgX6AuiTNzc++l/Twc2W
 zO6uL7ipxTgjBQ==
X-ME-Sender: <xms:d7sAXbtYBrffarZvlD3jZMmVv75KzjdZ-3QotTh-iqjj1yJH0i14MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:d7sAXYy2elku4ULvWmWVtwoNy_WwhBJmowDiO5a3iVguI0vGnsY4Qg>
 <xmx:d7sAXRiLUBkOqEi4jpB99uiMI_Pc-vE1-ehATttJMgMm8f1NxUP39Q>
 <xmx:d7sAXcBo9gbY5U8Mp2Wf5WvGjSGIK4YmpvgXRUK_tBftRyr5Jnp--Q>
 <xmx:d7sAXcetFp6UkLxlqbwjwXMe5gjc2bHVvLh2SiQ9J7aRoV-WYnLNmA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB81D380087;
 Wed, 12 Jun 2019 04:44:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:11 +0900
Message-Id: <20190612084422.5344-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/19] ALSA: fireworks: configure sampling
	transfer frequency in pcm.hw_params callback
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

At present, several operations are done in pcm.prepare callback. To
reduce load of the callback, This commit splits out an operation to
set sampling transfer frequency in pcm.hw_params callback.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h        |  3 +-
 sound/firewire/fireworks/fireworks_midi.c   |  7 ++-
 sound/firewire/fireworks/fireworks_pcm.c    | 14 +++--
 sound/firewire/fireworks/fireworks_stream.c | 65 +++++++++++++--------
 4 files changed, 57 insertions(+), 32 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 42a73038ba4d..0c1802aa7923 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -206,7 +206,8 @@ int snd_efw_command_get_sampling_rate(struct snd_efw *efw, unsigned int *rate);
 int snd_efw_command_set_sampling_rate(struct snd_efw *efw, unsigned int rate);
 
 int snd_efw_stream_init_duplex(struct snd_efw *efw);
-int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate);
+int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate);
+int snd_efw_stream_start_duplex(struct snd_efw *efw);
 void snd_efw_stream_stop_duplex(struct snd_efw *efw);
 void snd_efw_stream_update_duplex(struct snd_efw *efw);
 void snd_efw_stream_destroy_duplex(struct snd_efw *efw);
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index ee5dc7be70b6..6d3d942e2dce 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -18,8 +18,11 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		goto end;
 
 	mutex_lock(&efw->mutex);
-	++efw->substreams_counter;
-	err = snd_efw_stream_start_duplex(efw, 0);
+	err = snd_efw_stream_reserve_duplex(efw, 0);
+	if (err >= 0) {
+		++efw->substreams_counter;
+		err = snd_efw_stream_start_duplex(efw);
+	}
 	mutex_unlock(&efw->mutex);
 	if (err < 0)
 		snd_efw_stream_lock_release(efw);
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 398a6ad04c5f..287fc05d5917 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -231,12 +231,16 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&efw->mutex);
-		++efw->substreams_counter;
+		err = snd_efw_stream_reserve_duplex(efw, rate);
+		if (err >= 0)
+			++efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int pcm_hw_free(struct snd_pcm_substream *substream)
@@ -257,10 +261,9 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	err = snd_efw_stream_start_duplex(efw, runtime->rate);
+	err = snd_efw_stream_start_duplex(efw);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&efw->tx_stream);
 
@@ -269,10 +272,9 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	err = snd_efw_stream_start_duplex(efw, runtime->rate);
+	err = snd_efw_stream_start_duplex(efw);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&efw->rx_stream);
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 2df39befcde0..e1ebead583e9 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -189,47 +189,63 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 	return err;
 }
 
-int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
+int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 {
 	unsigned int curr_rate;
-	int err = 0;
-
-	// Need no substreams.
-	if (efw->substreams_counter == 0)
-		return -EIO;
+	int err;
 
-	/*
-	 * Considering JACK/FFADO streaming:
-	 * TODO: This can be removed hwdep functionality becomes popular.
-	 */
+	// Considering JACK/FFADO streaming:
+	// TODO: This can be removed hwdep functionality becomes popular.
 	err = check_connection_used_by_others(efw, &efw->rx_stream);
 	if (err < 0)
-		goto end;
+		return err;
 
-	/* stop streams if rate is different */
+	// stop streams if rate is different.
 	err = snd_efw_command_get_sampling_rate(efw, &curr_rate);
 	if (err < 0)
-		goto end;
+		return err;
 	if (rate == 0)
 		rate = curr_rate;
-	if (rate != curr_rate ||
-	    amdtp_streaming_error(&efw->tx_stream) ||
-	    amdtp_streaming_error(&efw->rx_stream)) {
+	if (rate != curr_rate) {
 		stop_stream(efw, &efw->tx_stream);
 		stop_stream(efw, &efw->rx_stream);
 	}
 
-	/* master should be always running */
-	if (!amdtp_stream_running(&efw->rx_stream)) {
+	if (efw->substreams_counter == 0 || rate != curr_rate) {
 		err = snd_efw_command_set_sampling_rate(efw, rate);
 		if (err < 0)
-			goto end;
+			return err;
+	}
+
+	return 0;
+}
+
+int snd_efw_stream_start_duplex(struct snd_efw *efw)
+{
+	unsigned int rate;
+	int err = 0;
+
+	// Need no substreams.
+	if (efw->substreams_counter == 0)
+		return -EIO;
+
+	err = snd_efw_command_get_sampling_rate(efw, &rate);
+	if (err < 0)
+		return err;
 
+	if (amdtp_streaming_error(&efw->rx_stream) ||
+	    amdtp_streaming_error(&efw->tx_stream)) {
+		stop_stream(efw, &efw->rx_stream);
+		stop_stream(efw, &efw->tx_stream);
+	}
+
+	/* master should be always running */
+	if (!amdtp_stream_running(&efw->rx_stream)) {
 		err = start_stream(efw, &efw->rx_stream, rate);
 		if (err < 0) {
 			dev_err(&efw->unit->device,
 				"fail to start AMDTP master stream:%d\n", err);
-			goto end;
+			goto error;
 		}
 	}
 
@@ -238,11 +254,14 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw, unsigned int rate)
 		if (err < 0) {
 			dev_err(&efw->unit->device,
 				"fail to start AMDTP slave stream:%d\n", err);
-			stop_stream(efw, &efw->tx_stream);
-			stop_stream(efw, &efw->rx_stream);
+			goto error;
 		}
 	}
-end:
+
+	return 0;
+error:
+	stop_stream(efw, &efw->rx_stream);
+	stop_stream(efw, &efw->tx_stream);
 	return err;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
