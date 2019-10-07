Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915CFCE007
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DA31692;
	Mon,  7 Oct 2019 13:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DA31692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446952;
	bh=UWXaISDUSmOwdGBg2Y8vALMLC6WadsvVPHWju8p6mlA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrAftJmK17Cbv+yRHxljnp3f2OOnSjcWL8296xbndJEp3Bd/T1t5w4KOwLYxfMouY
	 SZfYSW/CImiGMANh/aOcL0BRckaqkNE0f+Z4ujw7uSEMBcYXEnE4stxai6g/HKyeI8
	 MBz1PbJyBs3G6BjWJeht9sy7Z0H4lRk3wiJDmyQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A03F80722;
	Mon,  7 Oct 2019 13:06:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DAC8F80676; Mon,  7 Oct 2019 13:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6D8AF80659
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D8AF80659
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nJE+1Vjs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oO1uSCh5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EA82121D28;
 Mon,  7 Oct 2019 07:05:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=P1n5PLjaqtfmH
 adHORZ5Z9bIZMDeZHXoVMlAw4YtLsc=; b=nJE+1VjskYm+HoSHw8yy9lYt2QUQH
 +bjnd1oe2UJlhqJdUR46741rX7IHQYDsL2YK6qchQMU2JSvBonWeFJ6xCXstjESt
 mApJWrZoLp/a5cqZk3epYMoktFD3FLrlridGOhCKpqvfFVi5+5nz8xKAp/l8Wsp/
 1lE9uqz9ngyqGpbDjqRH8oTuGdxkceNVm1dZtWditt6oUXdH+3ZJxyXTnNL+8jQD
 W1K2R3375q07+nGlfMLALgkjHJHAH0DKYpPO/8zGYhkZmmpDA36Pt5iFt7F15TvY
 78Y3/D6p+Y8VkWsANW1Hg/CmUBGCjZf6Ol5ZR7m6WfUAIIyqhnVuhR44Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=P1n5PLjaqtfmHadHORZ5Z9bIZMDeZHXoVMlAw4YtLsc=; b=oO1uSCh5
 tZNoBLr2kiKEyVueUhRWH3y+5zChoCai2MxrklPKXl1XA375Em5r8MbN5M35KeVz
 r/ti1+HaZ+AxxeLxDGZb0/GT2XCoETNt04RgU1S33+b610JT1lOw9hOjbKimdqkN
 jzgAK6r4YmZs6RPBiyBmHIY5pMQAErkXgY48mz69bYDfRciyBNmNuj+a6w4CW+8f
 YOvpgNpk4/vdW/YBUDB2KiXXUlWlUnOl6mnLRF21i69f+nTR/FdbYBEyR35Rshb4
 WnurPViqPxHroVGPFD+pZriyU6a+3JzlhXYbnZ3LehR90LJL1bCbTD2P/SpveTIX
 I3bKptfNrXYULA==
X-ME-Sender: <xms:EhybXerRRwGW0K4rv2SlCoy4DJ1pdecwEE7WbApwTzyo7IxeackHZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EhybXeA67EXnmGUV6jBHnpCthLpa0acYTm5zwV_qQlYD9Lr6EfwkzQ>
 <xmx:EhybXQOor-RmpHefhtgxZb45hx74SlB0ebxUaZktvGB8GvYLd2p2Kw>
 <xmx:EhybXVAiU6DsIMkTcGEEC0Q8Ot0daSycSeOENlHH0y76K4XfpcZlAw>
 <xmx:EhybXSsIjfQ_yvOwcRgwm5_6oRxATXksejMwQxbj52wG7LO7d7V_eQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79D5E8005A;
 Mon,  7 Oct 2019 07:05:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:27 +0900
Message-Id: <20191007110532.30270-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/17] oxfw: use the same size of period for
	PCM substream in AMDTP streams
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

In current implementation, when opening a PCM substream, it's needed to
check whether the opposite PCM substream runs. This is to assign
effectual constraints (e.g. sampling rate) to opened PCM substream.

The number of PCM substreams and MIDI substreams on AMDTP streams in
domain is recorded in own structure. Usage of this count is an
alternative of the above check. This is better because the count is
incremented in pcm.hw_params earlier than pcm.trigger.

This idea has one issue because it's incremented for MIDI substreams as
well. In current implementation, for a case that any MIDI substream run
and a PCM substream is going to start, PCM application to start the PCM
substream can decide hardware parameters by restart packet streaming.
Just checking the substream count can brings regression.

Now AMDTP domain structure has a member for the size of PCM period in
PCM substream which starts AMDTP streams in domain. When the value has
zero and the substream count is greater than 1, it means that any MIDI
substream starts AMDTP streams in domain. Usage of the value can resolve
the above issue.

This commit replaces the check with the substream count and the value for
the size of PCM period.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-pcm.c | 39 ++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 2d1b5038f7f6..f3e25898d270 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -170,30 +170,47 @@ static int limit_to_current_params(struct snd_pcm_substream *substream)
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
+	struct amdtp_domain *d = &oxfw->domain;
 	int err;
 
 	err = snd_oxfw_stream_lock_try(oxfw);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = init_hw_params(oxfw, substream);
 	if (err < 0)
 		goto err_locked;
 
-	/*
-	 * When any PCM streams are already running, the available sampling
-	 * rate is limited at current value.
-	 */
-	if (amdtp_stream_pcm_running(&oxfw->tx_stream) ||
-	    amdtp_stream_pcm_running(&oxfw->rx_stream)) {
+	mutex_lock(&oxfw->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
+	if (oxfw->substreams_count > 0 && d->events_per_period > 0) {
+		unsigned int frames_per_period = d->events_per_period;
+
 		err = limit_to_current_params(substream);
-		if (err < 0)
-			goto end;
+		if (err < 0) {
+			mutex_unlock(&oxfw->mutex);
+			goto err_locked;
+		}
+
+		if (frames_per_period > 0) {
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&oxfw->mutex);
+				goto err_locked;
+			}
+		}
 	}
 
+	mutex_unlock(&oxfw->mutex);
+
 	snd_pcm_set_sync(substream);
-end:
-	return err;
+
+	return 0;
 err_locked:
 	snd_oxfw_stream_lock_release(oxfw);
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
