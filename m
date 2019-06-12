Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88B4202E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78413179C;
	Wed, 12 Jun 2019 10:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78413179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329919;
	bh=4sV4kKcBSjQ4sHdqpZjqxyuWUiFnmpuDuCKg5U4cZtM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnzAWPOPENLi5eaAunXBodKHrHLNO5aqdqryrEzf0/poVh4WY0w4C2RYYJZFdnttd
	 QMrF/N7YTJeTVuc8CBy99apGexbPIcHi5meoxP/YhlS5fX53LvFoEkC0P5WwDJkAlt
	 jcwxLxKqbjjkdG+09cnJw22ISA8lcCavNz+tiLzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 186C7F89797;
	Wed, 12 Jun 2019 10:45:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B60FF89765; Wed, 12 Jun 2019 10:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 826AAF89754
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826AAF89754
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bKLUHUJg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bAD26GgW"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EEF37571;
 Wed, 12 Jun 2019 04:44:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wsXljU9fCnHuF
 ogmyU2MF+ejcM6GeWCHxf7I2mVyXv0=; b=bKLUHUJg/jgfU52Bg20fxre2QIMlF
 dtJaFnjO+pDtqehRkwt1a5az6SG8Rwv259rk5X4jioWp878C2u1r02dvj/+xXVkH
 pjOoaWNq3T77/UlSfCFTd/VpugzFJ771PL6zkJH7EtKaeCUX6D0kPtkqe4ItM1it
 ojf2UoPSMtJoIMq6x5n9VEVPprN+6+s8vUzKGvJh8DfzQUC2Rp4s7kacD52xfOIq
 eacZHai9ml5rBDz/1yhCqvhech8MZ0kKvJjewtYoYoLfCAlCYyBAvx/6NpQARUc/
 QBhJ3S0fhDUJ8sCxAquKAOkoOE6sP6zfEvw6qIfFxDsXiRMENx0DjpFnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wsXljU9fCnHuFogmyU2MF+ejcM6GeWCHxf7I2mVyXv0=; b=bAD26GgW
 gZqFA52wurXDsvl/pZmovyuicm92lmqC7xxNqVpsgsqZHrTqlolDakh2ysMOnkVf
 eLKIHdUIYBuZTxrQj9X8JAJ06fxW6jB4oa612zqkIgavPV6sWIldp++OXdwvnfhM
 88Z/x/0JnPmv4K5XGw67ZhX3w4OzSa3UTALhfpzjKS/au2IwwK+7dwo8R5PojtU3
 i02DG3Pamh6ozmrOpePq7bFWwynVBuC2R96M59NJo5jAJ20zuuPaa+2Km+LVj7ua
 YwVy3eqbqA6+vB6dTSedwCHkolbpYoOdf5A8bgIC5PW672Xdfw5D2n6sYxryJKnM
 RCOsUajY/VObFw==
X-ME-Sender: <xms:hrsAXXHyXokXegAE9MA-rrdvZldsQc7j_ItWRk_71vuEzFWA0U-OSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeh
X-ME-Proxy: <xmx:hrsAXYm1j-pGxxmZuc_7fHed9DsrkGyf9d0vHirA0R8RVvH7R-7iUg>
 <xmx:hrsAXUJOQOaPNUoFWseNbukKCgmpeT0LadtlZdNRDjCQs1Z_2K4HNw>
 <xmx:hrsAXZanhz9dx5tugWSt3Ib1HsyK_pPAaeZivEglaxklGAZNSN0kTA>
 <xmx:hrsAXVa-d0uC32isl39kupMDoX8Cp5lns3KlnM6TDLeByjTwfIhscQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25F67380083;
 Wed, 12 Jun 2019 04:44:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:21 +0900
Message-Id: <20190612084422.5344-19-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 18/19] ALSA: oxfw: configure packet format in
	pcm.hw_params callback
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
set packet format in pcm.hw_params callback.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-midi.c   | 14 +++++++---
 sound/firewire/oxfw/oxfw-pcm.c    | 26 +++++++++++-------
 sound/firewire/oxfw/oxfw-stream.c | 44 ++++++++++++++++++++++---------
 sound/firewire/oxfw/oxfw.h        |  7 ++---
 4 files changed, 62 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 092493497f1a..9ba62778add2 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -19,8 +19,11 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	++oxfw->substreams_count;
-	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->tx_stream, 0, 0);
+	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream, 0, 0);
+	if (err >= 0) {
+		++oxfw->substreams_count;
+		err = snd_oxfw_stream_start_duplex(oxfw);
+	}
 
 	mutex_unlock(&oxfw->mutex);
 
@@ -41,8 +44,11 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	++oxfw->substreams_count;
-	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->rx_stream, 0, 0);
+	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream, 0, 0);
+	if (err >= 0) {
+		++oxfw->substreams_count;
+		err = snd_oxfw_stream_start_duplex(oxfw);
+	}
 
 	mutex_unlock(&oxfw->mutex);
 
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 79c8e514bed9..b08b850d53ea 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -219,12 +219,18 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+		unsigned int channels = params_channels(hw_params);
+
 		mutex_lock(&oxfw->mutex);
-		++oxfw->substreams_count;
+		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream,
+						     rate, channels);
+		if (err >= 0)
+			++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
 	}
 
-	return 0;
+	return err;
 }
 static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *hw_params)
@@ -238,8 +244,14 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+		unsigned int channels = params_channels(hw_params);
+
 		mutex_lock(&oxfw->mutex);
-		++oxfw->substreams_count;
+		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream,
+						     rate, channels);
+		if (err >= 0)
+			++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
 	}
 
@@ -280,12 +292,10 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
 	mutex_lock(&oxfw->mutex);
-	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->tx_stream,
-					   runtime->rate, runtime->channels);
+	err = snd_oxfw_stream_start_duplex(oxfw);
 	mutex_unlock(&oxfw->mutex);
 	if (err < 0)
 		goto end;
@@ -297,12 +307,10 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
 	mutex_lock(&oxfw->mutex);
-	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->rx_stream,
-					   runtime->rate, runtime->channels);
+	err = snd_oxfw_stream_start_duplex(oxfw);
 	mutex_unlock(&oxfw->mutex);
 	if (err < 0)
 		goto end;
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index ebfe0777773b..373154d8ee0e 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -236,16 +236,13 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	return 0;
 }
 
-int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
-				 struct amdtp_stream *stream,
-				 unsigned int rate, unsigned int pcm_channels)
+int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
+				   struct amdtp_stream *stream,
+				   unsigned int rate, unsigned int pcm_channels)
 {
 	struct snd_oxfw_stream_formation formation;
 	enum avc_general_plug_dir dir;
-	int err = 0;
-
-	if (oxfw->substreams_count == 0)
-		return -EIO;
+	int err;
 
 	// Considering JACK/FFADO streaming:
 	// TODO: This can be removed hwdep functionality becomes popular.
@@ -266,14 +263,11 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
 	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
 	if (err < 0)
 		return err;
-	if (rate == 0)
+	if (rate == 0) {
 		rate = formation.rate;
-	if (pcm_channels == 0)
 		pcm_channels = formation.pcm;
-
-	if (formation.rate != rate || formation.pcm != pcm_channels ||
-	    amdtp_streaming_error(&oxfw->rx_stream) ||
-	    amdtp_streaming_error(&oxfw->tx_stream)) {
+	}
+	if (formation.rate != rate || formation.pcm != pcm_channels) {
 		amdtp_stream_stop(&oxfw->rx_stream);
 		cmp_connection_break(&oxfw->in_conn);
 
@@ -281,7 +275,10 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
 			amdtp_stream_stop(&oxfw->tx_stream);
 			cmp_connection_break(&oxfw->out_conn);
 		}
+	}
 
+	if (oxfw->substreams_count == 0 ||
+	    formation.rate != rate || formation.pcm != pcm_channels) {
 		err = set_stream_format(oxfw, stream, rate, pcm_channels);
 		if (err < 0) {
 			dev_err(&oxfw->unit->device,
@@ -290,6 +287,27 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
 		}
 	}
 
+	return 0;
+}
+
+int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
+{
+	int err;
+
+	if (oxfw->substreams_count == 0)
+		return -EIO;
+
+	if (amdtp_streaming_error(&oxfw->rx_stream) ||
+	    amdtp_streaming_error(&oxfw->tx_stream)) {
+		amdtp_stream_stop(&oxfw->rx_stream);
+		cmp_connection_break(&oxfw->in_conn);
+
+		if (oxfw->has_output) {
+			amdtp_stream_stop(&oxfw->tx_stream);
+			cmp_connection_break(&oxfw->out_conn);
+		}
+	}
+
 	if (!amdtp_stream_running(&oxfw->rx_stream)) {
 		err = start_stream(oxfw, &oxfw->rx_stream);
 		if (err < 0) {
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index e0c825288a24..d4d4926c28cf 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -99,9 +99,10 @@ int avc_general_inquiry_sig_fmt(struct fw_unit *unit, unsigned int rate,
 				unsigned short pid);
 
 int snd_oxfw_stream_init_duplex(struct snd_oxfw *oxfw);
-int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
-				  struct amdtp_stream *stream,
-				  unsigned int rate, unsigned int pcm_channels);
+int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
+				   struct amdtp_stream *stream,
+				   unsigned int rate, unsigned int pcm_channels);
+int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw);
 void snd_oxfw_stream_stop_duplex(struct snd_oxfw *oxfw);
 void snd_oxfw_stream_destroy_duplex(struct snd_oxfw *oxfw);
 void snd_oxfw_stream_update_duplex(struct snd_oxfw *oxfw);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
