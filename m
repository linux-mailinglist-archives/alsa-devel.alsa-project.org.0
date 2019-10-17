Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61ADB1A5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F213169C;
	Thu, 17 Oct 2019 17:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F213169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571327907;
	bh=dzEEZDkr1DZHyhKKDwHYG6tn66tQRK5rskXJcpyTpxU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrBTX0k5gdHp2rglPkLBEB39UROuyYrLc6WLODW3YaTkDT2cNRFFxstmwRDAsqmI4
	 EOqHMr8EH/DZiYSuS3razpsJZMs05q6nMKbPmW3Ou9sxzwUnEszrlgC5QVAXezeCRp
	 X2wb3BixJagZIUotPRaBvnaf/w1Y2U8PqalqorQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76EDFF80637;
	Thu, 17 Oct 2019 17:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237BCF805FC; Thu, 17 Oct 2019 17:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1332F804AB
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1332F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EodzW4Pf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tvpfbPO5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D9D7B4FD;
 Thu, 17 Oct 2019 11:54:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=p50xw9rcP156q
 MifQ0CIOy5CUPpMx1TEwKG8yw8d49k=; b=EodzW4PfBWvUmAJwS1lnFqVODYBRy
 alwe+/VH3BWzHwTzU/qFkXhJbYo48jl3wSY583CTWDpFn8ayGqizVg/k0ZrWnLo/
 00ErrU8gyuJ8zb2eTSwYOgGe4KbOlFsJcK8qbW/h4tOapYP+fNKAeJbKPikZ74HG
 dlhLpgYnnG+/x2LUEHAV5/bGqkE/wlCiB/ktn/50sktFawWxfmv3IEOTKN4UPPFH
 03OADGkd/Iii+olz24Fq7irq1qx5TYFdRTSDnI0HPsdZOqQJAsdriidnmsQHOjVh
 ekx2NH/twOz07FAPz6siQsTF+aM9dqgg3DGJ9ZcZy2NIpV4gVzSAQZkJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=p50xw9rcP156qMifQ0CIOy5CUPpMx1TEwKG8yw8d49k=; b=tvpfbPO5
 9eFeeHiVLcC/xweZxfogakAQ54q1NMoIi4K3iGBNzOdA2mkryepE0JGILu7URdsR
 GKJzfYEhS9KIeTzURC3tEnDj9gwtvHJOjR+fxuqePPlxePHi5QeraaZz/Xhf1Ut0
 MEjS/CtzSf0IRJdQ8cQ//e8MoI/P58lSzTKBsjJZDkAt/a4CPqlMYk29WkPNKjFP
 M+rnk4leX3Yz8r7W6nEtkr18iB5VQM3cvw3TGqG01GbtLNOnLMc07Fxg+fuQ/9GW
 ISVaS7W7dO7datoqpFIKxttkZF03JBfo4CQorkkbQsbc+5EZCItaMsn65ImNy5C1
 5RYGLmL4F7JGQQ==
X-ME-Sender: <xms:uo6oXYzm_vd2JZgItNEDswi7JqMZmWiblZ5fja22FvHNIErlnRlxDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:uo6oXeU0jtt7KFplvQYqS-LpuWS7iJkA6lZ76upNdWMlxJ2cEKwYpQ>
 <xmx:uo6oXYdJAxFL0M3LbQgvqAY3ezDGUxrGoSwOzWmXvTpZRHcQoUV_UQ>
 <xmx:uo6oXbcMv7goLZMBNy8_az9uAfX3FghlTxHRv5PVVZpx3UUKAkXL1w>
 <xmx:uo6oXfWPaSIatIP3gimqQdgWbHLm2lzMSwV9NFUp0E57v1lkLBDL5A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B41480063;
 Thu, 17 Oct 2019 11:54:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:15 +0900
Message-Id: <20191017155424.885-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/12] ALSA: fireworks: share PCM buffer size
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

This commit allows ALSA fireworks driver to share PCM buffer size for
both capture and playback PCM substream. When AMDTP domain starts for
one of the PCM substream, buffer size of the PCM substream is stores
to AMDTP domain structure. Some AMDTP streams have already run with the
buffer size when another PCM substream starts, therefore the PCM
substream has a constraint to its buffer size.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h        |  3 ++-
 sound/firewire/fireworks/fireworks_midi.c   |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c    | 12 +++++++++++-
 sound/firewire/fireworks/fireworks_stream.c |  5 +++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index fc5f945a49ff..dda797209a27 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -208,7 +208,8 @@ int snd_efw_command_set_sampling_rate(struct snd_efw *efw, unsigned int rate);
 
 int snd_efw_stream_init_duplex(struct snd_efw *efw);
 int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
-				  unsigned int frames_per_period);
+				  unsigned int frames_per_period,
+				  unsigned int frames_per_buffer);
 int snd_efw_stream_start_duplex(struct snd_efw *efw);
 void snd_efw_stream_stop_duplex(struct snd_efw *efw);
 void snd_efw_stream_update_duplex(struct snd_efw *efw);
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index e593f842ee8f..84621e356848 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		goto end;
 
 	mutex_lock(&efw->mutex);
-	err = snd_efw_stream_reserve_duplex(efw, 0, 0);
+	err = snd_efw_stream_reserve_duplex(efw, 0, 0, 0);
 	if (err >= 0) {
 		++efw->substreams_counter;
 		err = snd_efw_stream_start_duplex(efw);
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 314d1f8b8344..abcc53dac8a5 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -197,6 +197,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if ((clock_source != SND_EFW_CLOCK_SOURCE_INTERNAL) ||
 	    (efw->substreams_counter > 0 && d->events_per_period > 0)) {
 		unsigned int frames_per_period = d->events_per_period;
+		unsigned int frames_per_buffer = d->events_per_buffer;
 		unsigned int sampling_rate;
 
 		err = snd_efw_command_get_sampling_rate(efw, &sampling_rate);
@@ -215,6 +216,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 				mutex_unlock(&efw->mutex);
 				goto err_locked;
 			}
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					frames_per_buffer, frames_per_buffer);
+			if (err < 0) {
+				mutex_unlock(&efw->mutex);
+				goto err_locked;
+			}
 		}
 	}
 
@@ -249,10 +258,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
+		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
 		mutex_lock(&efw->mutex);
 		err = snd_efw_stream_reserve_duplex(efw, rate,
-						    frames_per_period);
+					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index e4d4dd08c60a..f35a33d4d4e6 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -182,7 +182,8 @@ static int keep_resources(struct snd_efw *efw, struct amdtp_stream *stream,
 }
 
 int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
-				  unsigned int frames_per_period)
+				  unsigned int frames_per_period,
+				  unsigned int frames_per_buffer)
 {
 	unsigned int curr_rate;
 	int err;
@@ -231,7 +232,7 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
 		}
 
 		err = amdtp_domain_set_events_per_period(&efw->domain,
-							 frames_per_period, 0);
+					frames_per_period, frames_per_buffer);
 		if (err < 0) {
 			cmp_connection_release(&efw->in_conn);
 			cmp_connection_release(&efw->out_conn);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
