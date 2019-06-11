Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BEC3CCDD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC071745;
	Tue, 11 Jun 2019 15:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC071745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259601;
	bh=ELtpwAMcNR4ySCMTvPTi49e241NUbqQJFV4Zpf84Os4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWUqWZ+fsFpCwJIDRLca7s9Fem2HXekPsCOmoZli7XDIthz8klohwjTClA63VRMj/
	 H+hbzIo2W0/16YkTz8bXZw4+c3M/fzf6GRh1H4Bmt4vGE9zDLbss/M9FdEaUunLrlW
	 bxUcruU86442Kl0yzSFOm3C6MZFnczyf1FJuX7EA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F68EF89748;
	Tue, 11 Jun 2019 15:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 458B7F89737; Tue, 11 Jun 2019 15:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B03F89714
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B03F89714
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GH1CIceX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lzkHKRY1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AD9B22304;
 Tue, 11 Jun 2019 09:21:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ntO+YrKBT/tXs
 cipNv9K1fNdQxRsxCZbJUd++jtg1sE=; b=GH1CIceX4QC2gbLHCblssUPsq33X1
 DT1TQS1+oq/7YSnQMGw1/St2d7TRjf9yPPQm75cQ6M6VG6PzjbCRT0wEZseAzhEq
 u7p3VWOtkNFmX6dmafkIOP2++qtZfi8fjEnzYogkV/bBz+bcMhbSa+MWkJ8WwaGq
 thIqMzpgpppZB8Cq1RFnzujxEzhCacNT0958YGhCPZz2PW6vkqtoH+xyHBcCVYW6
 nTdW/zuYKCvqR4HSPCu6YM3KidxePE25P2jn36JBi/G37UOMy/om2oNz+D7SRcQB
 06NfzW8tp9xsBQ6zR3nbVyTZmKXdzzdsS1Hg0A0mT0USGkoUVIbVB7HUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ntO+YrKBT/tXscipNv9K1fNdQxRsxCZbJUd++jtg1sE=; b=lzkHKRY1
 40yHe6NrWmpWOsbNZS1777n5eIGjh5Zfu3/OqWqeSPdCsG07JQ5dlRGWEeOjBl4E
 1lDzzPmNw2NsqRR0E2jCFiwr17kLcVWJjMqMDb2OO+3ianrkb6yaQObC52KigCPa
 s4i6Wy5fVm7O5f6dVIWQ4ZOzwJTfRwB1jmuwi8cJ8/67IS5UcuPFj5g96tLhzF0s
 Lrzl92Lv+XLnTxeCL7+RE80AvBll6STKqDcAQc9JH1nmH3T8SsHYHRnBYjP4NzVl
 LL8oWuTNOZAx4DDxPk3nEr24iR+NOBBa8R3s8uyXxo4I9sGo8eyT/xLY8ZewDaP/
 +WXYAnyYF6mfsQ==
X-ME-Sender: <xms:3Kr_XJHsjDZGr5L8tvqSONsOPgRRcDj9YN0IqeV-_E1QgSGutBYMEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:3Kr_XCn1W0tFCzf8fTEUE4uuLzckK8pgyeDDXeppvwlLRO4iiip1lw>
 <xmx:3Kr_XGIl4QXr1wQEXzakQHtYsmXXmyuaLP_hMsIVHabS2iGw9bn-Qg>
 <xmx:3Kr_XDYAykkHO9QnJrwMtpYswJFISvllIUUxOFVtNwQ52-wVND1d7g>
 <xmx:3Kr_XPZRcDM9F0qn_QfZ7T0zyJAei3ZZ8dRJVL-vEzpRho-br9Yi0Q>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D3A6380083;
 Tue, 11 Jun 2019 09:21:30 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:11 +0900
Message-Id: <20190611132118.8378-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/12] ALSA: firewire-digi00x: reserve/release
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
 sound/firewire/digi00x/digi00x-midi.c   | 10 ++-
 sound/firewire/digi00x/digi00x-pcm.c    | 28 ++++++---
 sound/firewire/digi00x/digi00x-stream.c | 82 ++++++++++++++-----------
 sound/firewire/digi00x/digi00x.h        |  4 +-
 4 files changed, 73 insertions(+), 51 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index 7ab3d0810f6b..cca888cce0d3 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -18,8 +18,11 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		return err;
 
 	mutex_lock(&dg00x->mutex);
-	dg00x->substreams_counter++;
-	err = snd_dg00x_stream_start_duplex(dg00x, 0);
+	err = snd_dg00x_stream_reserve_duplex(dg00x, 0);
+	if (err >= 0) {
+		++dg00x->substreams_counter;
+		err = snd_dg00x_stream_start_duplex(dg00x);
+	}
 	mutex_unlock(&dg00x->mutex);
 	if (err < 0)
 		snd_dg00x_stream_lock_release(dg00x);
@@ -32,8 +35,9 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 	struct snd_dg00x *dg00x = substream->rmidi->private_data;
 
 	mutex_lock(&dg00x->mutex);
-	dg00x->substreams_counter--;
+	--dg00x->substreams_counter;
 	snd_dg00x_stream_stop_duplex(dg00x);
+	snd_dg00x_stream_release_duplex(dg00x);
 	mutex_unlock(&dg00x->mutex);
 
 	snd_dg00x_stream_lock_release(dg00x);
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index fdcff0460c53..1c04747f4fcc 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -167,12 +167,16 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&dg00x->mutex);
-		dg00x->substreams_counter++;
+		err = snd_dg00x_stream_reserve_duplex(dg00x, rate);
+		if (err >= 0)
+			++dg00x->substreams_counter;
 		mutex_unlock(&dg00x->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
@@ -187,12 +191,16 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&dg00x->mutex);
-		dg00x->substreams_counter++;
+		err = snd_dg00x_stream_reserve_duplex(dg00x, rate);
+		if (err >= 0)
+			++dg00x->substreams_counter;
 		mutex_unlock(&dg00x->mutex);
 	}
 
-	return 0;
+	return err;
 }
 
 static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
@@ -202,9 +210,10 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&dg00x->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		dg00x->substreams_counter--;
+		--dg00x->substreams_counter;
 
 	snd_dg00x_stream_stop_duplex(dg00x);
+	snd_dg00x_stream_release_duplex(dg00x);
 
 	mutex_unlock(&dg00x->mutex);
 
@@ -218,9 +227,10 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&dg00x->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		dg00x->substreams_counter--;
+		--dg00x->substreams_counter;
 
 	snd_dg00x_stream_stop_duplex(dg00x);
+	snd_dg00x_stream_release_duplex(dg00x);
 
 	mutex_unlock(&dg00x->mutex);
 
@@ -230,12 +240,11 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
 	mutex_lock(&dg00x->mutex);
 
-	err = snd_dg00x_stream_start_duplex(dg00x, runtime->rate);
+	err = snd_dg00x_stream_start_duplex(dg00x);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&dg00x->tx_stream);
 
@@ -247,12 +256,11 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
 	mutex_lock(&dg00x->mutex);
 
-	err = snd_dg00x_stream_start_duplex(dg00x, runtime->rate);
+	err = snd_dg00x_stream_start_duplex(dg00x);
 	if (err >= 0) {
 		amdtp_stream_pcm_prepare(&dg00x->rx_stream);
 		amdtp_dot_reset(&dg00x->rx_stream);
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 2bddeb3e4bf5..3b903e42d29a 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -189,13 +189,6 @@ static int begin_session(struct snd_dg00x *dg00x)
 	return err;
 }
 
-static void release_resources(struct snd_dg00x *dg00x)
-{
-	/* Release isochronous resources. */
-	fw_iso_resources_free(&dg00x->tx_resources);
-	fw_iso_resources_free(&dg00x->rx_resources);
-}
-
 static int keep_resources(struct snd_dg00x *dg00x, struct amdtp_stream *stream,
 			  unsigned int rate)
 {
@@ -265,45 +258,65 @@ void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x)
 	fw_iso_resources_destroy(&dg00x->tx_resources);
 }
 
-int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate)
+int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 {
 	unsigned int curr_rate;
-	int err = 0;
-
-	if (dg00x->substreams_counter == 0)
-		goto end;
+	int err;
 
-	/* Check current sampling rate. */
 	err = snd_dg00x_stream_get_local_rate(dg00x, &curr_rate);
 	if (err < 0)
-		goto error;
+		return err;
 	if (rate == 0)
 		rate = curr_rate;
-	if (curr_rate != rate ||
-	    amdtp_streaming_error(&dg00x->tx_stream) ||
-	    amdtp_streaming_error(&dg00x->rx_stream)) {
+
+	if (dg00x->substreams_counter == 0 || curr_rate != rate) {
 		finish_session(dg00x);
 
-		release_resources(dg00x);
-	}
+		fw_iso_resources_free(&dg00x->tx_resources);
+		fw_iso_resources_free(&dg00x->rx_resources);
 
-	/*
-	 * No packets are transmitted without receiving packets, reagardless of
-	 * which source of clock is used.
-	 */
-	if (!amdtp_stream_running(&dg00x->rx_stream)) {
 		err = snd_dg00x_stream_set_local_rate(dg00x, rate);
 		if (err < 0)
-			goto error;
+			return err;
 
 		err = keep_resources(dg00x, &dg00x->rx_stream, rate);
 		if (err < 0)
-			goto error;
+			return err;
 
 		err = keep_resources(dg00x, &dg00x->tx_stream, rate);
-		if (err < 0)
-			goto error;
+		if (err < 0) {
+			fw_iso_resources_free(&dg00x->rx_resources);
+			return err;
+		}
+	}
+
+	return 0;
+}
 
+void snd_dg00x_stream_release_duplex(struct snd_dg00x *dg00x)
+{
+	if (dg00x->substreams_counter == 0) {
+		fw_iso_resources_free(&dg00x->tx_resources);
+		fw_iso_resources_free(&dg00x->rx_resources);
+	}
+}
+
+int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
+{
+	int err = 0;
+
+	if (dg00x->substreams_counter == 0)
+		return 0;
+
+	if (amdtp_streaming_error(&dg00x->tx_stream) ||
+	    amdtp_streaming_error(&dg00x->rx_stream))
+		finish_session(dg00x);
+
+	/*
+	 * No packets are transmitted without receiving packets, reagardless of
+	 * which source of clock is used.
+	 */
+	if (!amdtp_stream_running(&dg00x->rx_stream)) {
 		err = begin_session(dg00x);
 		if (err < 0)
 			goto error;
@@ -338,23 +351,18 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 			goto error;
 		}
 	}
-end:
-	return err;
+
+	return 0;
 error:
 	finish_session(dg00x);
 
-	release_resources(dg00x);
-
 	return err;
 }
 
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x)
 {
-	if (dg00x->substreams_counter > 0)
-		return;
-
-	finish_session(dg00x);
-	release_resources(dg00x);
+	if (dg00x->substreams_counter == 0)
+		finish_session(dg00x);
 }
 
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x)
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 4dd1bbf2ed3c..3fb1c49f6f9e 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -140,8 +140,10 @@ int snd_dg00x_stream_get_clock(struct snd_dg00x *dg00x,
 int snd_dg00x_stream_check_external_clock(struct snd_dg00x *dg00x,
 					  bool *detect);
 int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x);
-int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate);
+int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate);
+int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x);
+void snd_dg00x_stream_release_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
