Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91089DB1B6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248B11699;
	Thu, 17 Oct 2019 17:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248B11699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571328040;
	bh=YTYov3D7ABU0CqV2Tkdlz8YXjleh6otmWpEWhX+khWM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TKVAyL/lnuBSzSBLLcKIaEWwzm94nbP4V8KxMlpisFrub/4sjuBh/VGqmlPplp8aJ
	 g+76Awkt+noOzYqZzwa/0udbcRVSz19cggwpp0dBqPZn3WJTi1BDADNPtCePJyNwsi
	 h0X9pfijolwPMwf5G2UTtMSqR2MhVmXmNCErFIw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 762BAF80671;
	Thu, 17 Oct 2019 17:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B73BAF805FD; Thu, 17 Oct 2019 17:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30951F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30951F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GzY/Tqtg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j8YIOJgZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6BB8950F;
 Thu, 17 Oct 2019 11:54:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=IIl8faiefvA+V
 F3+YFJAOrNrZJS9rTmdi90M6wdmcWg=; b=GzY/TqtgHHoU644XcHKyC6g7bw0Hv
 chxBqC6L/W2LgnhY0ILg3ueef23yD/dCw2mLfIH3knVQpXt+NIf7Ucr00n571KNb
 poSjTEQ4JyhOn6fn+QBJugzL7odSnAxL6TvXeVouRfD7Y4lJ6OB2BqZUfJU5FMIH
 VlzPQEKgMs+HKX0wVayH1m74d6oHZaHfPR3U/JBmpi/F8HLI8FT3woeNPGZ2Y3YB
 8HKRanoSXriuawBlEzCIIk6msqrg0XWLUxEnsfwxaP6/vC3QJy8eEqmiABs99b8d
 yyUmfjA6b70ei5HTw4D+NYbNVLJ3pKkcvUsBScFGMbPw2rqRS7dYcbd5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IIl8faiefvA+VF3+YFJAOrNrZJS9rTmdi90M6wdmcWg=; b=j8YIOJgZ
 KLNEGTaDm746jv5dJEhXmp28Im+2nCwOdiIEsatzDfsSKavMexbe11XFBcNwkdI7
 FKmWEjgO9HTEkNsKxSxyKsIA0cRrH2BsqKpFfjS4hsIWkAfze0NTmkZRYl7O64vz
 PEswuH3m0g8EcsWAovUDsDlIBOjFqLMOvTkfgACw9WWcaVbaEOyzBCU5l2LlkrJW
 vmzfcrbbQCLmtTq51YjdGX4Zkdpj1JMZUGMIg9pVjybJ1AHQLtnG12iru0wanfaY
 n0XVE/4qwGJUrLyD9v0cTQIrT5GxTcZ/gKhKbW0jrUxn4KHeecKo1TqN8FtTgQL7
 Yb6zew0uHbZlVQ==
X-ME-Sender: <xms:vo6oXVF4nyu8ROnAtU22izy2wpiP0fmRSwrkqmLEUE5dIVOGHGcK_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:vo6oXagcAL_5k50I7GSrhDQFq7GeZeYFuX3mocaD8LlHbrrwxVl8zA>
 <xmx:vo6oXZyIjttMTP6MoHzOd8O34H-JDYN5ahEDBWHNuG7Bl_c6ReZltw>
 <xmx:vo6oXWpJvBi0jiw_02qDhbItdZF2becnw_9OS8ZiPj4La6AaYch4Og>
 <xmx:v46oXdZdhInZz4Qgx-18CQIkuODn3Vl-VHsbfaLj2tPLLfgBJeparA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A21F8005B;
 Thu, 17 Oct 2019 11:54:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:18 +0900
Message-Id: <20191017155424.885-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/12] ALSA: firewire-digi00x: share PCM buffer
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

This commit allows ALSA firewire-digi00x driver to share PCM buffer
size for both capture and playback PCM substream. When AMDTP domain
starts for one of the PCM substream, buffer size of the PCM substream
is stores to AMDTP domain structure. Some AMDTP streams have already
run with the buffer size when another PCM substream starts, therefore
the PCM substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-midi.c   |  2 +-
 sound/firewire/digi00x/digi00x-pcm.c    | 12 +++++++++++-
 sound/firewire/digi00x/digi00x-stream.c |  5 +++--
 sound/firewire/digi00x/digi00x.h        |  3 ++-
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index a407e795d8e7..68eb8c39afa6 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		return err;
 
 	mutex_lock(&dg00x->mutex);
-	err = snd_dg00x_stream_reserve_duplex(dg00x, 0, 0);
+	err = snd_dg00x_stream_reserve_duplex(dg00x, 0, 0, 0);
 	if (err >= 0) {
 		++dg00x->substreams_counter;
 		err = snd_dg00x_stream_start_duplex(dg00x);
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 8dbfb3ff17f6..c9a833dff20d 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -135,6 +135,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
 	    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
 		unsigned int frames_per_period = d->events_per_period;
+		unsigned int frames_per_buffer = d->events_per_buffer;
 		unsigned int rate;
 
 		err = snd_dg00x_stream_get_external_rate(dg00x, &rate);
@@ -153,6 +154,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&dg00x->mutex);
 				goto err_locked;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&dg00x->mutex);
+				goto err_locked;
+			}
 		}
 	}
 
@@ -189,10 +198,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&dg00x->mutex);
 		err = snd_dg00x_stream_reserve_duplex(dg00x, rate,
-						      frames_per_period);
+					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++dg00x->substreams_counter;
 		mutex_unlock(&dg00x->mutex);
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 83659fc0ef25..0c539188ba18 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -284,7 +284,8 @@ void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x)
 }
 
 int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
-				    unsigned int frames_per_period)
+				    unsigned int frames_per_period,
+				    unsigned int frames_per_buffer)
 {
 	unsigned int curr_rate;
 	int err;
@@ -318,7 +319,7 @@ int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&dg00x->domain,
-							 frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			fw_iso_resources_free(&dg00x->rx_resources);
 			fw_iso_resources_free(&dg00x->tx_resources);
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index d93694282568..129de8edd5ea 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -142,7 +142,8 @@ int snd_dg00x_stream_check_external_clock(struct snd_dg00x *dg00x,
 					  bool *detect);
 int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x);
 int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
-				    unsigned int frames_per_period);
+				    unsigned int frames_per_period,
+				    unsigned int frames_per_buffer);
 int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
