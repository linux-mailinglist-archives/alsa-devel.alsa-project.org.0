Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA3DB1A3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC0616A0;
	Thu, 17 Oct 2019 17:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC0616A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571327883;
	bh=WEtVc84StKnOjHFHd8uXdMdZK9z2jIM+yzLLS2DaFko=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qn++twxZlaLMIjOK6KiukmUcEkSrSDjTc1P4zrLtpDFztoyzjHZtqvIKaasaMM5/s
	 Dit+FTAPGylCF8w0cfHM1QqXUcyj+OGTeRdonEKaU9AFr8xWaVKZtqpQpNm8Q1Lvc4
	 VREwQp0p3AIEG6lIPEcmLmiYa57zGRKPLrxvzr34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D1AF802A0;
	Thu, 17 Oct 2019 17:54:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2561F805F5; Thu, 17 Oct 2019 17:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9529AF804AA
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9529AF804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lVXoaMD4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bg1A/70L"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3B5434F0;
 Thu, 17 Oct 2019 11:54:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1HDRNW87132kb
 pnxXfdVGKw+cTBGCL1vu/h/+pEQL6k=; b=lVXoaMD4WZse6BjMdWJ5vqpEZ1gYc
 r9H3WBnV+PZzX86LJ3R8gIRbgDaYFlVTpR6fSxcuouXPPiIi9oaNUUggtGE8Hliy
 t+CH6vJFKb8XaY+ZmX2MOCBpmqHh0CQ3D8jzlSXnDXxgfoU6tWEPPrRAVp6DGcMr
 yooUMUoD/SMIOujAiJsnxrwQ6Ot9VO/Zv/qtKUBiPAJFE46ihMI9nmtjTcTUgtnd
 RyMfonYuMtmk+lzHp9SEe5xVDB0hnz6LxkLmQ+2nijcB4t1VtS1n5MqBuocFMlrO
 NaToyBQC3blxi2++yog4Es7XhHjHTP49eCVLdp6kvpqKu22hWlR/HwLRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1HDRNW87132kbpnxXfdVGKw+cTBGCL1vu/h/+pEQL6k=; b=bg1A/70L
 Kh+ZS55K7G8YU5SHelHxmDFBE5+ht7Z+CcKvEaCACQYXyxRetRReG+lI/XDv8q+A
 zJh2p/Ph0aGLpMnfsBb3iwMYYNzqlE/EaR60D0VaS4s3ZZgRuAn1ynPfCyKAGgqO
 Ltm38krbD0fGn1CuRWJrSVHOgBKYn5rjVJwxKeEycqw+KWuzOHFesDf38oF1F+wm
 Eipjg+/UmZEarkPar06+WR9ietvW13ry3XBoYv1pb/jblHRwgcdTX2fLe77hCE6T
 agOmNVxKsWWpczIwekte4AYqbaO35jAghabYeCaTLMBsbcAgSaOMUyXiYgZdzFjg
 chQdxDfQXSdaDQ==
X-ME-Sender: <xms:uI6oXYPhIQ-lvJjG2_oedR1oAiXvx0PyWulr-cdrgV1u1KGviNHMew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:uI6oXZqrrjUkE_QPpCPXRpVylkEGKVE0pbu3aNuQ6iCwacLznrpu7A>
 <xmx:uI6oXTTvTSlDhzclIlyow0ez6yWZEXDPauaHOhXEUW-AaxEDKhDs6Q>
 <xmx:uI6oXRbdo3NC5penoAK7LwcC0Xnh9FJhXpQaFZ4RjZoie4tUS7Z15g>
 <xmx:uI6oXUHnboTBw8PV9SohgOcx39FvJ-oDkjSz0It90qVHGGzXlU182w>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8137780061;
 Thu, 17 Oct 2019 11:54:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:14 +0900
Message-Id: <20191017155424.885-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/12] ALSA: bebob: share PCM buffer size for
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

This commit allows ALSA bebob driver to share PCM buffer size for both
capture and playback PCM substream. When AMDTP domain starts for one
of the PCM substream, buffer size of the PCM substream is stores to
AMDTP domain structure. Some AMDTP streams have already run with the
buffer size when another PCM substream starts, therefore the PCM
substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.h        |  3 ++-
 sound/firewire/bebob/bebob_midi.c   |  2 +-
 sound/firewire/bebob/bebob_pcm.c    | 12 +++++++++++-
 sound/firewire/bebob/bebob_stream.c |  5 +++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 8738c1d8abf7..d1ad9a8451bc 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -218,7 +218,8 @@ int snd_bebob_stream_get_clock_src(struct snd_bebob *bebob,
 int snd_bebob_stream_discover(struct snd_bebob *bebob);
 int snd_bebob_stream_init_duplex(struct snd_bebob *bebob);
 int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
-				    unsigned int frames_per_period);
+				    unsigned int frames_per_period,
+				    unsigned int frames_per_buffer);
 int snd_bebob_stream_start_duplex(struct snd_bebob *bebob);
 void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob);
 void snd_bebob_stream_destroy_duplex(struct snd_bebob *bebob);
diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index e8f9edf50be5..6f597d03e7c1 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		return err;
 
 	mutex_lock(&bebob->mutex);
-	err = snd_bebob_stream_reserve_duplex(bebob, 0, 0);
+	err = snd_bebob_stream_reserve_duplex(bebob, 0, 0, 0);
 	if (err >= 0) {
 		++bebob->substreams_counter;
 		err = snd_bebob_stream_start_duplex(bebob);
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 516c9874f4a1..8b2e0ceffe82 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -157,6 +157,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (src == SND_BEBOB_CLOCK_TYPE_EXTERNAL ||
 	    (bebob->substreams_counter > 0 && d->events_per_period > 0)) {
 		unsigned int frames_per_period = d->events_per_period;
+		unsigned int frames_per_buffer = d->events_per_buffer;
 		unsigned int sampling_rate;
 
 		err = spec->get(bebob, &sampling_rate);
@@ -178,6 +179,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&bebob->mutex);
 				goto err_locked;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&bebob->mutex);
+				goto err_locked;
+			}
 		}
 	}
 
@@ -213,10 +222,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&bebob->mutex);
 		err = snd_bebob_stream_reserve_duplex(bebob, rate,
-						      frames_per_period);
+					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++bebob->substreams_counter;
 		mutex_unlock(&bebob->mutex);
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index e8e9eca6f116..5e4a61458be2 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -555,7 +555,8 @@ static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
 }
 
 int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
-				    unsigned int frames_per_period)
+				    unsigned int frames_per_period,
+				    unsigned int frames_per_buffer)
 {
 	unsigned int curr_rate;
 	int err;
@@ -610,7 +611,7 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&bebob->domain,
-							 frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			cmp_connection_release(&bebob->out_conn);
 			cmp_connection_release(&bebob->in_conn);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
