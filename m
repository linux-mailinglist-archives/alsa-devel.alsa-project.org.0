Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF880DB1C4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F4816B5;
	Thu, 17 Oct 2019 18:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F4816B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571328156;
	bh=HbA1W+BbTOeuYbmXGy/WalACCYnbu8iAj50+yTIUbKk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0Yt+fMox/jcnxjHY3f6hxUopr8qpJeb1BjRq60Cs6jjTsu6uH+F+YqPcp8imunvB
	 h8tRIzZi38bz9WiqV8CeOlz7xyOD2mgQuCyPJgp/urieOty3FIlI+gZcxk8X1JOGpe
	 wGomQnJBQ2WQH8f4xlLE3eiqe10kDA5CTM/DqY08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75367F806E8;
	Thu, 17 Oct 2019 17:55:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A84F80611; Thu, 17 Oct 2019 17:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C74A2F805FA
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C74A2F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RZ81IXZC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bSHNz+HC"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F3745514;
 Thu, 17 Oct 2019 11:54:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=chejcVHJqeit+
 pG9G15Iky8qXRcWAzamAYU/kTMsX4w=; b=RZ81IXZCJOkafR0djTkb01PIEckgh
 CN0L6bqTr2pECLEAL94HFRKjZBKa5m1IxylNjMarxf0O9E/AqcJrJ3WbXxnncQ5N
 3Dm6rqLzh4+NxudFPdIRDFdMyHg6wVbjFJJ9kTfkL99Jck3lIZraKpV+sr7ZLYei
 lEBTagn8yI3UXn4IKL9UoOHRRhA5WIZaJV56wUEMEyMbFfN98NcpfMAoGXNctR1w
 xnDLpP4t1cW4MkdefZul2R/v/LjluM14osb+PAXN4vAvkFQ8hTQjcSa5tXeOrtjB
 aDTSkSEj6Cxs/YTYESL6EQViRNQJGhTTnnuTf0cphzrXiOarU9vu/Wngw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=chejcVHJqeit+pG9G15Iky8qXRcWAzamAYU/kTMsX4w=; b=bSHNz+HC
 9Xqa1T5DKJv7GlnSAK00fGo2o1Vgdak0oIN4RZjDqV7cgE/2ONXbH07lI3Er40xR
 89ovOR5bglEWGGKWInknB9vzE+/GRxz9pWHd50yGSe87mcYMipRSg6P3WS5GbFeE
 nVZEg3fhDcg8WxSDNdJApqjTrDTZbov7LKMV0yh6t3oaL0bkxq+ufHlaugXbsMVK
 wnSE1VSGxYyEYU3ZakW08GHxLIHI9FaiC+nlzzL2LjU1xULNOzSX+G1AOTXZTqcn
 1Gzx1IN16G5PPzbhTu7F1sExMB3QjIhzwKeOZleV6+fm/LXyw5kJNHUWdFpBR5B1
 KJuipftUHmIteA==
X-ME-Sender: <xms:w46oXYLyxNUSeYK4Kw3qQG9wJ-Tj5tIf4oLcUU-AN44Lv8W6Fv1zRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:w46oXRMDA5xQAvwl-M9IM88M3iJEWfuRctz4H4QllA95KpYhjEubdw>
 <xmx:w46oXRy--3UVKPcZULbA-1wR_q7JNeew0FCc6JtBB1I81QS_NM9THg>
 <xmx:w46oXRKZrxMlPu0IB4l8EjG60ufACZOAElZD8412FSO8PuHl1BbI0A>
 <xmx:w46oXfB6oMPsAya_eev_Q89S3t1HEaL0zakguJSml8q4uAvyYU6C2g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C0BC80061;
 Thu, 17 Oct 2019 11:54:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:21 +0900
Message-Id: <20191017155424.885-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/12] ALSA: fireface: share PCM buffer size
	for both direction
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

This commit allows ALSA fireface driver to share PCM buffer size for
both capture and playback PCM substream. When AMDTP domain starts for
one of the PCM substream, buffer size of the PCM substream is stores to
AMDTP domain structure. Some AMDTP streams have already run with the
buffer size when another PCM substream starts, therefore the PCM
substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-pcm.c    | 13 ++++++++++++-
 sound/firewire/fireface/ff-stream.c |  5 +++--
 sound/firewire/fireface/ff.h        |  3 ++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 415bc9ccd1c7..005d959f8651 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -180,6 +180,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	} else {
 		if (ff->substreams_counter > 0) {
 			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
 
 			rate = amdtp_rate_table[ff->rx_stream.sfc];
 			substream->runtime->hw.rate_min = rate;
@@ -192,6 +193,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&ff->mutex);
 				goto release_lock;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&ff->mutex);
+				goto release_lock;
+			}
 		}
 	}
 
@@ -229,9 +238,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&ff->mutex);
-		err = snd_ff_stream_reserve_duplex(ff, rate, frames_per_period);
+		err = snd_ff_stream_reserve_duplex(ff, rate, frames_per_period,
+						   frames_per_buffer);
 		if (err >= 0)
 			++ff->substreams_counter;
 		mutex_unlock(&ff->mutex);
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index cbe0e5087b05..a13754f914e8 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -107,7 +107,8 @@ void snd_ff_stream_destroy_duplex(struct snd_ff *ff)
 }
 
 int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
-				 unsigned int frames_per_period)
+				 unsigned int frames_per_period,
+				 unsigned int frames_per_buffer)
 {
 	unsigned int curr_rate;
 	enum snd_ff_clock_src src;
@@ -153,7 +154,7 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
 			return err;
 
 		err = amdtp_domain_set_events_per_period(&ff->domain,
-							 frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			fw_iso_resources_free(&ff->tx_resources);
 			fw_iso_resources_free(&ff->rx_resources);
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 970d4ae571ee..dc7a20f75983 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -140,7 +140,8 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 int snd_ff_stream_init_duplex(struct snd_ff *ff);
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff);
 int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
-				 unsigned int frames_per_period);
+				 unsigned int frames_per_period,
+				 unsigned int frames_per_buffer);
 int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate);
 void snd_ff_stream_stop_duplex(struct snd_ff *ff);
 void snd_ff_stream_update_duplex(struct snd_ff *ff);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
