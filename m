Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F98CE00C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96042169E;
	Mon,  7 Oct 2019 13:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96042169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570447066;
	bh=ZZTCOv8tSLvlYJ/bmSuh3ldyzIKam4aXX17s3l7mA0M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3atlVHu3xrr/HbWb+WuX/01wnnCT6Gb8OVPvFB/ma57OFa2I2bX95pYbA+Jf4VMJ
	 YBn8qSU8UudYJMs4+SpidjJUpv6ErBAgvcu7/YdJVFAx4sZCv6xjirH0wt41ahQRtn
	 5K7DzxxfvuoaJvgQ5OhvP8s31+TPeZ4BW+WsEzUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5007F80752;
	Mon,  7 Oct 2019 13:06:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5219F806F7; Mon,  7 Oct 2019 13:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40B6BF8067C
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B6BF8067C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MZnALsdq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="T2cNvNUn"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7285E21903;
 Mon,  7 Oct 2019 07:05:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SV+LwydzTtqR3
 6yStTECLLXf2WwLT1RgvIqLmqGQ4T8=; b=MZnALsdqBbzaDdo13e7M6+CTHh+Qk
 /orjAnDRhF8i2F9eGG2ieQ1OJo8y5lNLOxJ97btdOIMWRG60zHwv5kirz3LdWp+y
 G1i0unLk+HMQFwbT41r/sC3FXxZwla/EaddAnuYLiFjt531EfFe0mbaVP38z/jI8
 iQLbOZP+pXT53Dwpp2WW+UyGjwEx/83i6PgW1vgaj7VC9EbNNXB/ZLNtemFDvNAw
 VCZFz08tjWEJyv2ImeR8nl/lqVLdfjVc0PCjB2WLUJH6u/DFaJH1G26zbg1KFeMw
 nGX5B8q7JDii9ibnYARfXeWlFNJB5YWeAJiPa2syh97OWXefPgOdsJe/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SV+LwydzTtqR36yStTECLLXf2WwLT1RgvIqLmqGQ4T8=; b=T2cNvNUn
 Yz9Ze5X8NiJzwNs/8+u1gKVL253jhrVs/S48h57lCdjL2gDQHQ1KmgWeFyaOe5JC
 Fpi9yT/mBeUsywe3xlQ+8dXvjzIdYWfVUx68JG3jWa4BXTLiEaU4q29TCgBL4hmj
 59pybZTfGUwG2maVTmRgP1cLuiW4j2nDTjsQRfbvvJ97a7tKK1+QBCZ2sjbBp/Ge
 5UEOgExio4oJdiviS2w/07mTj3pCYYKy0jyGGqAlfTH+A5QCVZAYVgAap039ckpi
 ORWltciWZVRZRNgt76lo/feiW1ymNuUmmGtL10uQECA/rtUh0s7UPRNSscLtroF1
 +O0VRdh/LaPlkA==
X-ME-Sender: <xms:FxybXYQSorlqIEYB0kiRliwTFpDRZPQGCmkc7K9qjgYaiwqmaVIV9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:FxybXURnPnD3qFg2vMfPtEd_nJhRAIF0yY44HZbH14ES8_pmbAvvoQ>
 <xmx:FxybXeMF_24pIXQtt3Yt3ChEzS84YKk1_ZJ57d4xHYxz-wpo4lV0hQ>
 <xmx:FxybXd2HZgi9enOsqFVPjLcP_O_pB9EJvWFXv9EIUaQQNM_6MuhWoQ>
 <xmx:FxybXYY4PWhg2xodkGIU8jh5mgtL1O8qMHhhg9ScHb1LBDte_1iYRQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D1DC80059;
 Mon,  7 Oct 2019 07:05:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:30 +0900
Message-Id: <20191007110532.30270-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 15/17] firewire-tascam: use the same size of
	period for PCM substream in AMDTP streams
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

The number of PCM substreams on AMDTP streams in domain is recorded in
own structure. Usage of this count is an alternative of the above check.
This is better because the count is incremented in pcm.hw_params earlier
than pcm.trigger.

This commit replaces the check with the substream count and the value for
the size of PCM period. Unlike the other drivers in ALSA firewire stack,
no MIDI substream is multiplexed into AMDTP stream.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-pcm.c | 34 +++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index cea26d5eff1a..6cd3a420fbdf 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -43,13 +43,13 @@ static int pcm_init_hw_params(struct snd_tscm *tscm,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
+	struct amdtp_domain *d = &tscm->domain;
 	enum snd_tscm_clock clock;
-	unsigned int rate;
 	int err;
 
 	err = snd_tscm_stream_lock_try(tscm);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = pcm_init_hw_params(tscm, substream);
 	if (err < 0)
@@ -59,19 +59,37 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	if (clock != SND_TSCM_CLOCK_INTERNAL ||
-	    amdtp_stream_pcm_running(&tscm->rx_stream) ||
-	    amdtp_stream_pcm_running(&tscm->tx_stream)) {
+	mutex_lock(&tscm->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
+	if (clock != SND_TSCM_CLOCK_INTERNAL || tscm->substreams_counter > 0) {
+		unsigned int frames_per_period = d->events_per_period;
+		unsigned int rate;
+
 		err = snd_tscm_stream_get_rate(tscm, &rate);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&tscm->mutex);
 			goto err_locked;
+		}
 		substream->runtime->hw.rate_min = rate;
 		substream->runtime->hw.rate_max = rate;
+
+		err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+		if (err < 0) {
+			mutex_unlock(&tscm->mutex);
+			goto err_locked;
+		}
 	}
 
+	mutex_unlock(&tscm->mutex);
+
 	snd_pcm_set_sync(substream);
-end:
-	return err;
+
+	return 0;
 err_locked:
 	snd_tscm_stream_lock_release(tscm);
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
