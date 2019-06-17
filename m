Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCA47BF5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE7A176E;
	Mon, 17 Jun 2019 10:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE7A176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759431;
	bh=QHZujfd6QmSwbX9fMXN+mRtsUEki64JYpX/IxNH2Ja4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFQ4DfMD7l4xLkSKZHk5YZ49SlXQBCirUgVfmK58GQRjtZWIjuNUgMua2PrsQ8vqI
	 uk/Ov8pSzctYXfWS4pDt4RhiNvUg9UDZcSA486IqQK1WM4jI7PYitvP5oqQWaZzxWQ
	 anp6Ld/OmwS5T6UBe39M0JNO2kUok7ESooYFRlOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A565CF89693;
	Mon, 17 Jun 2019 10:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83BBAF896F9; Mon, 17 Jun 2019 10:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78241F89693
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78241F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NxNhg9VY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="07Bh9gGB"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 66F7A731;
 Mon, 17 Jun 2019 04:15:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9QLFgYnfN0NIZ
 J91VRhjLxlm6zRtmHE2az5Sx/cCtuI=; b=NxNhg9VYvdfpB+pFh5yDxPI/iTLKT
 9eCkHI19YfZ/OJZpNNrKSnxk5XItgVcatYQYge387iBp5KF40BRHQqHlwE+1Jqxn
 x2nEVc2jLxQfDFUfVmyCCK5PBHCLk/05FkWZF/Yl7XCcPE942KDn55bL6OpMRDsL
 7Nc8ngqqIvXQpcHlRvmVKYiXeIvdWR7+SKTHyAX9rBY92Yot1tbcLocVIb1pH6ci
 OoR41koGWOWK8jfquW1CzpBuJr2fL0AvOhYirB+9mjyCHUgxKQNX4IxY+CriFD6h
 ooeS+2+JUDO+d8JBkEpAV85PXMRTCyV+VSc2j5LpxcNaVpwXKZLl+a/XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9QLFgYnfN0NIZJ91VRhjLxlm6zRtmHE2az5Sx/cCtuI=; b=07Bh9gGB
 TACvNiuFJ2sazT429T3mzm8nq46cTVekvEAmQ+i6XpSnqILF5ZbitloYMgB/sEeU
 xTErKE2NnPb0lBe+bd6ZzeDU4EldFiRcYcpbagVaXVzTpVmBzhfxrvO8lXOJWgVs
 AF0pumI2SHWxl21PtEALrISrIdKmqdADHc68V4uLD7mI8JQBUex1HX+cs6VUuQ5t
 DP9cAg+6+64tYS9e8Kayhpnpe6Bri86fl8Wch2+uCROSvpk/AqFgNQd2IbG/F8X/
 q/G+RgDBB+ame0l3uvfNs7xiOPCsYdGkJm7huxXdvqDHtwzhJz+fUQug/jXlYJjJ
 5GCbwnbEk0lVMQ==
X-ME-Sender: <xms:FEwHXc9oY6LGbwOK_04QW1vRbhTVPZk7MbTrQgP35YklKoTvUgoldQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:FEwHXZ7h0cUoWHOqA0CpvPQmv1VZJxx54fl_aLFFibepU37My0kfnA>
 <xmx:FEwHXVaMI-wiVrJXk72nAksNyI6QCXKurvcurqDhMN9wktqPy1Dg0w>
 <xmx:FEwHXb9DngykN0Npsv7zdcL-ag-Ky38zRhd_1Cp_9qX1PmVvHu_J5w>
 <xmx:FUwHXVKGyicACUAJLUg0KZUl2LHdEThP5YMUYI46WfFqGuIy-CHTgQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92A6480062;
 Mon, 17 Jun 2019 04:15:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:01 +0900
Message-Id: <20190617081510.11025-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/10] ALSA: firewire-motu: unify the count of
	subscriber for packet streaming
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

Two counters are used to maintain isochronous packet streaming for both
directions. However, like the other drivers, they can be replaced with
one counter. This commit unifies them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-midi.c   |  8 ++++----
 sound/firewire/motu/motu-pcm.c    |  8 ++++----
 sound/firewire/motu/motu-stream.c | 17 ++++++-----------
 sound/firewire/motu/motu.h        |  3 +--
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index e55cab6d79c7..b2d339a8ef3f 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -18,7 +18,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->capture_substreams++;
+	motu->substreams_counter++;
 	err = snd_motu_stream_start_duplex(motu, 0);
 
 	mutex_unlock(&motu->mutex);
@@ -40,7 +40,7 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->playback_substreams++;
+	motu->substreams_counter++;
 	err = snd_motu_stream_start_duplex(motu, 0);
 
 	mutex_unlock(&motu->mutex);
@@ -57,7 +57,7 @@ static int midi_capture_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->capture_substreams--;
+	motu->substreams_counter--;
 	snd_motu_stream_stop_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
@@ -72,7 +72,7 @@ static int midi_playback_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	motu->playback_substreams--;
+	motu->substreams_counter--;
 	snd_motu_stream_stop_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index ab69d7e6ac05..b0e5ebf05bec 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -203,7 +203,7 @@ static int capture_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&motu->mutex);
-		motu->capture_substreams++;
+		motu->substreams_counter++;
 		mutex_unlock(&motu->mutex);
 	}
 
@@ -222,7 +222,7 @@ static int playback_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&motu->mutex);
-		motu->playback_substreams++;
+		motu->substreams_counter++;
 		mutex_unlock(&motu->mutex);
 	}
 
@@ -236,7 +236,7 @@ static int capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&motu->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		motu->capture_substreams--;
+		motu->substreams_counter--;
 
 	snd_motu_stream_stop_duplex(motu);
 
@@ -252,7 +252,7 @@ static int playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&motu->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		motu->playback_substreams--;
+		motu->substreams_counter--;
 
 	snd_motu_stream_stop_duplex(motu);
 
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 73e7a5e527fc..c136d7f8c49c 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -207,7 +207,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 	unsigned int curr_rate;
 	int err = 0;
 
-	if (motu->capture_substreams == 0 && motu->playback_substreams == 0)
+	if (motu->substreams_counter == 0)
 		return 0;
 
 	/* Some packet queueing errors. */
@@ -271,8 +271,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 		}
 	}
 
-	if (!amdtp_stream_running(&motu->tx_stream) &&
-	    motu->capture_substreams > 0) {
+	if (!amdtp_stream_running(&motu->tx_stream)) {
 		err = start_isoc_ctx(motu, &motu->tx_stream);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
@@ -291,15 +290,12 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 
 void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 {
-	if (motu->capture_substreams == 0) {
+	if (motu->substreams_counter == 0) {
 		if (amdtp_stream_running(&motu->tx_stream))
 			stop_isoc_ctx(motu, &motu->tx_stream);
 
-		if (motu->playback_substreams == 0) {
-			if (amdtp_stream_running(&motu->rx_stream))
-				stop_isoc_ctx(motu, &motu->rx_stream);
-			stop_both_streams(motu);
-		}
+		if (amdtp_stream_running(&motu->rx_stream))
+			stop_isoc_ctx(motu, &motu->rx_stream);
 	}
 }
 
@@ -372,8 +368,7 @@ void snd_motu_stream_destroy_duplex(struct snd_motu *motu)
 	destroy_stream(motu, AMDTP_IN_STREAM);
 	destroy_stream(motu, AMDTP_OUT_STREAM);
 
-	motu->playback_substreams = 0;
-	motu->capture_substreams = 0;
+	motu->substreams_counter = 0;
 }
 
 static void motu_lock_changed(struct snd_motu *motu)
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 1cd112be7dad..ae4b37cdfade 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -60,8 +60,7 @@ struct snd_motu {
 	struct amdtp_stream rx_stream;
 	struct fw_iso_resources tx_resources;
 	struct fw_iso_resources rx_resources;
-	unsigned int capture_substreams;
-	unsigned int playback_substreams;
+	unsigned int substreams_counter;
 
 	/* For notification. */
 	struct fw_address_handler async_handler;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
