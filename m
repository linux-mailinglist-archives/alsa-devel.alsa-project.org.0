Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C230F32262
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A22A1686;
	Sun,  2 Jun 2019 09:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A22A1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459852;
	bh=1LBn5QB35RW3D8EVk9WMf41gKFnqfvLQVZ/FhY66A6M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ieepPDjbdxn2p5T1CngwOUvSPxQy05XakCUm31c/OAg3AmFfumXT1AfuFkF+C7ONI
	 WQW+VnWXaVhgNRjzYb2V+y/8trjymP8IYQb9f2FmOniyKOR4VFdq9s/j8/mSIMGHTV
	 GlAL6iGR+O2Z7054aS6D4s7V+XuaU41giyFRgico=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE61F8973E;
	Sun,  2 Jun 2019 09:13:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E12F89700; Sun,  2 Jun 2019 09:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAEBFF80CC4
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEBFF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="uglcImDG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iCt7YkUo"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 24C4D21CFD;
 Sun,  2 Jun 2019 03:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Fyi6/yhmeQ4Yb
 tWo34bdJ1BHCpRUW1OBsvAVOP9o/ak=; b=uglcImDGxSIAq/LQdSqVgdKhbRn9I
 WjFWnBS53Kwk89WMTBSb00m7rDhci78FUJzL+Z9cZd/YB8GY6rYhF9LmTBHbkYMV
 INTZEpuJXYzGl2SHOP68iJMJ9vvdXHb7L73M/BKqB5Gw+jQtd3/Xj0pJoheob1w5
 DrCnBMxFFhRtnXDtKrj7OmH52Xb6HVqEaKx8WMQd5EUUbNUEnd+JDvILncfn33kk
 b0hsct9QEtJ1ZQF6/ivQEsSEyBV6Kktbum+Kn49MVlizbwQoxDaNgpqeKmWc5eUR
 U1SrtfojXgwlCAiGe0iSFjF7hBEb5gC1GpJChJGMvuTSI6Gvf8kk0EYtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Fyi6/yhmeQ4YbtWo34bdJ1BHCpRUW1OBsvAVOP9o/ak=; b=iCt7YkUo
 JEfPyOvjl+19DM70bVrtWUWKJMRICrVyM4p7tUa3TuBwVFsd0M1JuzU5nxk0qrDn
 S6/ZwGEbU3r1c+F3jDNsZPEshhlVBx7HzKLtwhaGXe0BrjZZNRQnN5bwHPJ/Go+c
 aL05MAL7O8DqXkcdBfVehs1WU0pjPuAGueoEdCumnQmltg4bdao/Wcf5hhe1R7z3
 ri153AZJm8aKCrvfmfsuRENyE2I+RyLYm9FWEjnIiGk9UI7MUpFSajuxJDzIV/w2
 NvaETQyT1jAZtyXcvRsa6iLy6Bh4UfGTSQniMRaeZxQRlZwdTcZgvkuW1Wwo1q/2
 GGV7wbG67j04DA==
X-ME-Sender: <xms:B3fzXJLUB6wOEnbdU8eCHr7LOpBooY6wTw-UV3xGVfJII8uD8J4p6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:B3fzXH0DVDdY8vRtJFy8IshOmMfCFpDZXAWpBSA1h-O_bobkW_9Oww>
 <xmx:B3fzXPP3WwkYnLHREbsQjNG0rL0YI4GivJLNMONu8whWiB9to3UmVQ>
 <xmx:B3fzXAxXFX8mfIklWr_pCOlnQBw2_4E8x4mTw26kFzzkQ-vKW1nAeQ>
 <xmx:B3fzXChQMJL5vMD3Bv6Mv3-1VFg-xgaRxTU2wwK892GlrPD2leKBYQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9601B80059;
 Sun,  2 Jun 2019 03:13:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:48 +0900
Message-Id: <20190602071259.21622-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/15] ALSA: firewire-tascam: reserve/release
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
packet streaming for allocated the resources.

There are two points to stop packet streaming; in pcm.hw_params and
pcm.prepare callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-pcm.c    | 22 ++++++--
 sound/firewire/tascam/tascam-stream.c | 79 ++++++++++++++++-----------
 sound/firewire/tascam/tascam.h        |  2 +
 3 files changed, 66 insertions(+), 37 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index e4cc8990e195..962ef1212ac0 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -96,12 +96,16 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&tscm->mutex);
-		tscm->substreams_counter++;
+		err = snd_tscm_stream_reserve_duplex(tscm, rate);
+		if (err >= 0)
+			++tscm->substreams_counter;
 		mutex_unlock(&tscm->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
@@ -116,12 +120,16 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&tscm->mutex);
-		tscm->substreams_counter++;
+		err = snd_tscm_stream_reserve_duplex(tscm, rate);
+		if (err >= 0)
+			++tscm->substreams_counter;
 		mutex_unlock(&tscm->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
@@ -131,9 +139,10 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&tscm->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		tscm->substreams_counter--;
+		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
+	snd_tscm_stream_release_duplex(tscm);
 
 	mutex_unlock(&tscm->mutex);
 
@@ -147,9 +156,10 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&tscm->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		tscm->substreams_counter--;
+		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
+	snd_tscm_stream_release_duplex(tscm);
 
 	mutex_unlock(&tscm->mutex);
 
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 6ad149274050..18d554d46be5 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -166,7 +166,7 @@ static int set_stream_formats(struct snd_tscm *tscm, unsigned int rate)
 	__be32 reg;
 	int err;
 
-	/* Set an option for unknown purpose. */
+	// Set an option for unknown purpose.
 	reg = cpu_to_be32(0x00200000);
 	err = snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
 				 TSCM_ADDR_BASE + TSCM_OFFSET_SET_OPTION,
@@ -174,11 +174,7 @@ static int set_stream_formats(struct snd_tscm *tscm, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	err = enable_data_channels(tscm);
-	if (err < 0)
-		return err;
-
-	return set_clock(tscm, rate, INT_MAX);
+	return enable_data_channels(tscm);
 }
 
 static void finish_session(struct snd_tscm *tscm)
@@ -348,38 +344,66 @@ void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm)
 	fw_iso_resources_destroy(&tscm->tx_resources);
 }
 
-int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
+int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
 {
 	unsigned int curr_rate;
 	int err;
 
-	if (tscm->substreams_counter == 0)
-		return 0;
-
 	err = snd_tscm_stream_get_rate(tscm, &curr_rate);
 	if (err < 0)
 		return err;
-	if (curr_rate != rate ||
-	    amdtp_streaming_error(&tscm->rx_stream) ||
-	    amdtp_streaming_error(&tscm->tx_stream)) {
-		finish_session(tscm);
 
+	if (tscm->substreams_counter == 0 || rate != curr_rate) {
 		amdtp_stream_stop(&tscm->rx_stream);
 		amdtp_stream_stop(&tscm->tx_stream);
 
+		finish_session(tscm);
+
 		fw_iso_resources_free(&tscm->tx_resources);
 		fw_iso_resources_free(&tscm->rx_resources);
-	}
 
-	if (!amdtp_stream_running(&tscm->rx_stream)) {
+		err = set_clock(tscm, rate, INT_MAX);
+		if (err < 0)
+			return err;
+
 		err = keep_resources(tscm, rate, &tscm->tx_stream);
 		if (err < 0)
-			goto error;
+			return err;
 
 		err = keep_resources(tscm, rate, &tscm->rx_stream);
-		if (err < 0)
-			goto error;
+		if (err < 0) {
+			fw_iso_resources_free(&tscm->tx_resources);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+void snd_tscm_stream_release_duplex(struct snd_tscm *tscm)
+{
+	if (tscm->substreams_counter == 0) {
+		fw_iso_resources_free(&tscm->tx_resources);
+		fw_iso_resources_free(&tscm->rx_resources);
+	}
+}
+
+int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
+{
+	int err;
+
+	if (tscm->substreams_counter == 0)
+		return 0;
+
+	if (amdtp_streaming_error(&tscm->rx_stream) ||
+	    amdtp_streaming_error(&tscm->tx_stream)) {
+		amdtp_stream_stop(&tscm->rx_stream);
+		amdtp_stream_stop(&tscm->tx_stream);
 
+		finish_session(tscm);
+	}
+
+	if (!amdtp_stream_running(&tscm->rx_stream)) {
 		err = set_stream_formats(tscm, rate);
 		if (err < 0)
 			goto error;
@@ -422,24 +446,17 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 	finish_session(tscm);
 
-	fw_iso_resources_free(&tscm->tx_resources);
-	fw_iso_resources_free(&tscm->rx_resources);
-
 	return err;
 }
 
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 {
-	if (tscm->substreams_counter > 0)
-		return;
-
-	amdtp_stream_stop(&tscm->tx_stream);
-	amdtp_stream_stop(&tscm->rx_stream);
-
-	finish_session(tscm);
+	if (tscm->substreams_counter == 0) {
+		amdtp_stream_stop(&tscm->tx_stream);
+		amdtp_stream_stop(&tscm->rx_stream);
 
-	fw_iso_resources_free(&tscm->tx_resources);
-	fw_iso_resources_free(&tscm->rx_resources);
+		finish_session(tscm);
+	}
 }
 
 void snd_tscm_stream_lock_changed(struct snd_tscm *tscm)
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 6a411ee0dcf1..1cb75c374f11 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -147,6 +147,8 @@ int snd_tscm_stream_get_clock(struct snd_tscm *tscm,
 int snd_tscm_stream_init_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_update_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm);
+int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate);
+void snd_tscm_stream_release_duplex(struct snd_tscm *tscm);
 int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate);
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
