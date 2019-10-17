Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714DDB1A8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A55169B;
	Thu, 17 Oct 2019 17:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A55169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571327945;
	bh=qkmC76sBV3yYGcFYGAoAPWYYpHrMc1bw3nbYuoQZ1Uw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyakn8IBJvuFrm21NBYNnhqk1xtKK7LQJ0WbZcmNlaLhMWO8jDWKcNlLq5Hg5bm4g
	 ALorSN4HhYrZPEXPxac2KsyHnLLKXrYaTd6AeXcU229fIkqXEW5vBHOlcjr3f4ud58
	 oDJoZXVocU7M6fXhdTkcjso6dXsEarAtkaiEM58w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEAA3F8063B;
	Thu, 17 Oct 2019 17:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BF47F805FE; Thu, 17 Oct 2019 17:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 207A2F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207A2F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MtKcdqlA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uEfbI+PA"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6137E4FE;
 Thu, 17 Oct 2019 11:54:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qXiiPfhxGEN2S
 M28RKhIC7LnRrtVWbGXo/Exh1W+T1Q=; b=MtKcdqlA/TymfDlNmaf6gT3/I8M6G
 y8GgZI9bleyokFuhLpnz2arOiJ9XKCtMGkwt0yt9KU4IUdloSpdjPD6xpUnymmsM
 zojte8BsGJ4cFcCbRieLXMaBHKYUkU8d7ffmHO7UWrejN9UIfwo/yvPMvwCFV/WF
 jUrTQNfvRu2gwBC6xa1Zf9+JtvSKwNGM7/KkDwyKxTEIfnQXZDmxr/Be/A6wb8z4
 js8IyGCmD8dQJfisv5ZDxtzYp7BxOjfujwrNeHGc8vet8/pWmAOu/StfES9wmj/K
 TqiBO2PEBofEtovf2hSe6eurnk8R/8wUwVccCvb3ycfg/TpZAwv2aCwtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qXiiPfhxGEN2SM28RKhIC7LnRrtVWbGXo/Exh1W+T1Q=; b=uEfbI+PA
 CyhgEHZoeWgT+ih/vpqPUSiKiKMOFQ9hMSi3LEcFXdOujx5D+3zap3rngg8QMsb7
 9IUyNL6Sw7P309/GsHRVI8IzRDP1O1FmjGFIaTbA8O95cMztsNMoU+1AGswAIWM/
 FXnENGF4EZ3BLuy7mu2SuF/xs6NqBXC9buPrNUSOYhwLbNsvEsWvYbsobLRLAWTR
 xbeXIGi9QWJG7NEe3HL2pqTsHXERBaj6EjWAQNfSHo4Kk3LTJ1qadigc8VtKpPr+
 YYIjz6rIN6hI70IbGAEohe4HTQxXDZtnrH7uHRd4t7gue5Y2mr11Ls3V4SePEeRU
 jCCCmuyQv5jIag==
X-ME-Sender: <xms:u46oXa3A2PHuq8S4PAAbgzC0gDNl-Lbllyhs1ohk46Kpra78AbIm3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:u46oXcxMaZLAs-8ZT6XXmeFdJr3XdDr_UfV7LpYkl6AT5uxSaKqo-Q>
 <xmx:u46oXdtAv_gIkfqMUvtnIEHHYzgJ4u4x_rpKBBWBTX4yvGDq-odIXg>
 <xmx:u46oXeQa6I_y24-M1AnsKOIiJarGnG6_AJpb4IkOmIDaI70SiyFoFw>
 <xmx:vI6oXeWqOKlXOTtXq6TLJPP3itJKIbDSdnJrJLOPB9fDl1Z5k-McWg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9508F80066;
 Thu, 17 Oct 2019 11:54:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:16 +0900
Message-Id: <20191017155424.885-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/12] ALSA: oxfw: share PCM buffer size for
	both direction
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

This commit allows ALSA oxfw driver to share PCM buffer size for both
capture and playback PCM substream. When AMDTP domain starts for one
of the PCM substream, buffer size of the PCM substream is stores to
AMDTP domain structure. Some AMDTP streams have already run with the
buffer size when another PCM substream starts, therefore the PCM
substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-midi.c   |  4 ++--
 sound/firewire/oxfw/oxfw-pcm.c    | 17 +++++++++++++++--
 sound/firewire/oxfw/oxfw-stream.c |  5 +++--
 sound/firewire/oxfw/oxfw.h        |  3 ++-
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 72db7a17d0ad..775cba3f1f02 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -18,7 +18,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream, 0, 0, 0);
+	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream, 0, 0, 0, 0);
 	if (err >= 0) {
 		++oxfw->substreams_count;
 		err = snd_oxfw_stream_start_duplex(oxfw);
@@ -45,7 +45,7 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream, 0, 0, 0);
+	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream, 0, 0, 0, 0);
 	if (err >= 0) {
 		++oxfw->substreams_count;
 		err = snd_oxfw_stream_start_duplex(oxfw);
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index f3e25898d270..ba586d1ac91d 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -188,6 +188,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	// at current one.
 	if (oxfw->substreams_count > 0 && d->events_per_period > 0) {
 		unsigned int frames_per_period = d->events_per_period;
+		unsigned int frames_per_buffer = d->events_per_buffer;
 
 		err = limit_to_current_params(substream);
 		if (err < 0) {
@@ -203,6 +204,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&oxfw->mutex);
 				goto err_locked;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&oxfw->mutex);
+				goto err_locked;
+			}
 		}
 	}
 
@@ -239,10 +248,12 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		unsigned int rate = params_rate(hw_params);
 		unsigned int channels = params_channels(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&oxfw->mutex);
 		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream,
-					rate, channels, frames_per_period);
+					rate, channels, frames_per_period,
+					frames_per_buffer);
 		if (err >= 0)
 			++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
@@ -265,10 +276,12 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		unsigned int rate = params_rate(hw_params);
 		unsigned int channels = params_channels(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&oxfw->mutex);
 		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream,
-					rate, channels, frames_per_period);
+					rate, channels, frames_per_period,
+					frames_per_buffer);
 		if (err >= 0)
 			++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 318de8217b3a..995e9c5bd84b 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -245,7 +245,8 @@ static int keep_resources(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 				   struct amdtp_stream *stream,
 				   unsigned int rate, unsigned int pcm_channels,
-				   unsigned int frames_per_period)
+				   unsigned int frames_per_period,
+				   unsigned int frames_per_buffer)
 {
 	struct snd_oxfw_stream_formation formation;
 	enum avc_general_plug_dir dir;
@@ -308,7 +309,7 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 		}
 
 		err = amdtp_domain_set_events_per_period(&oxfw->domain,
-							frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			cmp_connection_release(&oxfw->in_conn);
 			if (oxfw->has_output)
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 422746ef2439..c30e537087b0 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -104,7 +104,8 @@ int snd_oxfw_stream_init_duplex(struct snd_oxfw *oxfw);
 int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 				   struct amdtp_stream *stream,
 				   unsigned int rate, unsigned int pcm_channels,
-				   unsigned int frames_per_period);
+				   unsigned int frames_per_period,
+				   unsigned int frames_per_buffer);
 int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw);
 void snd_oxfw_stream_stop_duplex(struct snd_oxfw *oxfw);
 void snd_oxfw_stream_destroy_duplex(struct snd_oxfw *oxfw);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
