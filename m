Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4BFDB1C1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB5F16AD;
	Thu, 17 Oct 2019 18:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB5F16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571328114;
	bh=yBRz+24Wx8DJ8akxzH2UPkoqJqThRtKkkgPiH/gP6zc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8MMq2oB/djvbBSUwDEgiCh9czLxKEeYbggUM7boiz6/A/0at/SfBbEPXUlvtvtXR
	 CCDkoid7iIAE+oNj/MFVCyjKF0CSeqXjDtv5SWgriomzWfXnreQRVvZ1xrIeKLx3X+
	 c1KfrjDIdDSLHv3GKE4C8Zq7icj0Hw9xbKF5gtvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 832C7F806E5;
	Thu, 17 Oct 2019 17:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB51F80611; Thu, 17 Oct 2019 17:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 293F0F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293F0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FQYMn5NA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="U5XVf1mJ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 55A45490;
 Thu, 17 Oct 2019 11:54:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=tcavsAfrD/xWZ
 kuSoRC5H01D6ogA2OKoqMXV1ixSXSo=; b=FQYMn5NAZL9LY0wRmBAnfXijJtr+r
 ff3jbDG1+rV++fbX99IwytpeoaBAdJhZJZhAyLJjLelFaO8vKfUYo6APKBpWEqQL
 WzecAkmLhG6iIQWrsVQI38cryZ+WsNnYSsAGsyoO4cluJ8s9X0osTuCl/X+R4kWU
 Z7cigIZjtONJG//ycYEwE9nj8zM8nFGxCRnQOJxzRPAnsxgFy6aTJkslIO3M28c3
 MdPXkWk+mt8UWcXJ2hIKfSXVv4QlIAkOT81RNXAFIpzMUga3lhX1BU1miqMBEF2H
 HKczeNFXnOAudWVjgsfq0PwCSTelfjRVGb6y5OZiU0FVz28Kf9MysTjYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tcavsAfrD/xWZkuSoRC5H01D6ogA2OKoqMXV1ixSXSo=; b=U5XVf1mJ
 W6QJKBt3LnR9VL3bJcTo9xy1RBQyAkz/zHC4ZlXQEY5PNw8N3UDO6hMkgyfm38u7
 0o/h2WhTrDfQwpaOqGdGwW0vmUV2IhB5SU25xWsYz5//86AbvpxcGkf2/AhNFFLa
 BOgJ53X7A/uGoGgpILHYux6Rn+nVNQjcAu1cx5bp5x8Rm0NzKsHFqdxzdHm9l0/M
 yeav/Y1LKvLsBIMvn4je6d5egHu6h+IOlnsr6tPkcPm7k5zsnta9kkTeBcZzbtW1
 //1jwt83/McqIK6oQXyMPrg1xFcGsbhi8KDdobOJkDTNBkbyqKKiAG0g2jUNrA2I
 d9OXQJFhrfRGKQ==
X-ME-Sender: <xms:wY6oXZQmEvKM1b0YtzSqUzUMxALMjUOwlPB43pxamf8Cj2Qj3G2u_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:wY6oXZWIMJqJExv8OY2qYGo-RbEd4hCGLCRoT0OPViw6cEOQ7FT_fA>
 <xmx:wY6oXb7BKpYF4JJmBgQP_LNTVnAB5ZhtnF5IRTZlB3DwbZLaYidMBw>
 <xmx:wY6oXU91IRKlndRouA6vRy1BG9mMNhHC7TCLl-_G9HK2niOmUu61YQ>
 <xmx:wY6oXbyUBXf_DC8NYx_7KuPA41sMOMdqbucJXGY_1WkDB0gv8OAobA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A23DF8005C;
 Thu, 17 Oct 2019 11:54:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:20 +0900
Message-Id: <20191017155424.885-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/12] ALSA: firewire-motu: share PCM buffer
	size for both direction
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

This commit allows ALSA firewire-motu driver to share PCM buffer
size for both capture and playback PCM substream. When AMDTP domain
starts for one of the PCM substream, buffer size of the PCM substream
is stores to AMDTP domain structure. Some AMDTP streams have already
run with the buffer size when another PCM substream starts, therefore
the PCM substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-midi.c   |  2 +-
 sound/firewire/motu/motu-pcm.c    | 12 +++++++++++-
 sound/firewire/motu/motu-stream.c |  5 +++--
 sound/firewire/motu/motu.h        |  3 ++-
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 997dd6c8ec31..2365f7dfde26 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	err = snd_motu_stream_reserve_duplex(motu, 0, 0);
+	err = snd_motu_stream_reserve_duplex(motu, 0, 0, 0);
 	if (err >= 0) {
 		++motu->substreams_counter;
 		err = snd_motu_stream_start_duplex(motu);
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 7bbf8b86a33d..00e693da0cad 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -162,6 +162,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (src != SND_MOTU_CLOCK_SOURCE_INTERNAL ||
 	    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
 		unsigned int frames_per_period = d->events_per_period;
+		unsigned int frames_per_buffer = d->events_per_buffer;
 		unsigned int rate;
 
 		err = protocol->get_clock_rate(motu, &rate);
@@ -179,6 +180,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&motu->mutex);
 				goto err_locked;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&motu->mutex);
+				goto err_locked;
+			}
 		}
 	}
 
@@ -216,10 +225,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&motu->mutex);
 		err = snd_motu_stream_reserve_duplex(motu, rate,
-						     frames_per_period);
+					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++motu->substreams_counter;
 		mutex_unlock(&motu->mutex);
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 97245c670732..9975770c9b1f 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -134,7 +134,8 @@ int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 }
 
 int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
-				   unsigned int frames_per_period)
+				   unsigned int frames_per_period,
+				   unsigned int frames_per_buffer)
 {
 	unsigned int curr_rate;
 	int err;
@@ -174,7 +175,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&motu->domain,
-							 frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			fw_iso_resources_free(&motu->tx_resources);
 			fw_iso_resources_free(&motu->rx_resources);
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index a419e6e7daed..35ed8b6bb8e8 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -155,7 +155,8 @@ int snd_motu_stream_init_duplex(struct snd_motu *motu);
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu);
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu);
 int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
-				   unsigned int frames_per_period);
+				   unsigned int frames_per_period,
+				   unsigned int frames_per_buffer);
 int snd_motu_stream_start_duplex(struct snd_motu *motu);
 void snd_motu_stream_stop_duplex(struct snd_motu *motu);
 int snd_motu_stream_lock_try(struct snd_motu *motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
