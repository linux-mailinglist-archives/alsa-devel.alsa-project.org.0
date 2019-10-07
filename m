Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FCCE008
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995931685;
	Mon,  7 Oct 2019 13:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995931685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446985;
	bh=Ts/AIQcmMmY/wztLcwKPWeH4aekZZII2ago+A2tl2l8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/Yl0bcQJDi0TON+UNrgGEbNgYNZ7HycAb+/KVCP/EQgfAb9tZqycA8CsVDXpaG77
	 QJ0BpkmHjeifJCu/gtrcB3nasyyxah2L39kMDGPAcVmmjupG0jMLWZXD0K2AVLeVgy
	 DvlgaUY4D9oWPGu/2+439s1Z6bbiTuXecAE+UYdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D819F80730;
	Mon,  7 Oct 2019 13:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A028F8067A; Mon,  7 Oct 2019 13:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B55F80672
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B55F80672
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bprnbukt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iItQ+IUF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D77921D51;
 Mon,  7 Oct 2019 07:05:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=OR9eWcF02NbKF
 R27JXzsCvfYQrWAEbSEShHIEI6mUCY=; b=bprnbuktMNuzedOBliwkjIupyOj+/
 gVUHaqonhTohry6G/nPqQOYHnNumRL+gGmoXnxwnYjrmgTpl2YlhqI4NLbMPNtyF
 v52tm0o3QikPiEr3YrAByxv5oYHQei+1AZwoITUHiQqA7SXUsAB+arO6FUB2GgXO
 CxKSzys614CZbShLhOxtXS6gD4xSMhXANG5u+GsAKrtGVbRTE+MUdym/9q5AbBhO
 9pcM7daHGHQQtFMla7X5KM4vHOw4zo0KWmscLDH2F/kwnhu5j930sGVN2ywFmkRE
 wZ/JugHyMT3k11l+wZmMfD7a4waLGWkY8MvhMGLpV4OQHy3hqw0JCPeRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OR9eWcF02NbKFR27JXzsCvfYQrWAEbSEShHIEI6mUCY=; b=iItQ+IUF
 kgk/tqxZXIpmx4jVgfbmAZ3RwSCpVhaeeatGyrnBGqvf5TT9PjzoEIkbKE6UUecv
 9RqresqhXhqbfdq50Mar2cN+Dd3FLfSo1NCNObJ8d63Fo4HvKDEEWNZltmeWDrXS
 9j1E9ti4BKV9ybt7PsyOfZmfdbOhUovS9nYfFxvnYHQaxrI8BSS+H8PH35QIKjDP
 kpAeDKA+FMm2XhlQJQjujvePXNEKS0G/M2QT7+/oV3ocUDg/5fV2E4ixPxSJrDfn
 pNidmJ+RFMXvV69i/gEOu5T1gpl9osFhO34SvHIeb6Zn0An85LbaekuoU0DV4Z8F
 znRqY6czA9tdiw==
X-ME-Sender: <xms:FBybXX4DOgXZN_9FK3E0I9z862SB2RFrYe4nvr1o1RBSsSIPyT0gfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:FBybXYY7xhfQRAAf-1c9FM75nTfdUL7XVs1YjD0LJ45QGCvXTNe9-w>
 <xmx:FBybXTgLjK9e1Nc8DmXicYTMW-Q2PSwrL083Z-jKK446TCg4nFj7jw>
 <xmx:FBybXXHj5vlCjz_OtxBUXbPQaxNAx12bzu7PWpv4ar7ZiDGzvoSAnQ>
 <xmx:FBybXbgGeBYF6gO6rzosjJR6uHU4KuAqA230vZiMwcHcM_k1Vd62wQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 024EB80059;
 Mon,  7 Oct 2019 07:05:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:28 +0900
Message-Id: <20191007110532.30270-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 13/17] dice: use the same size of period for
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

Dice hardware has a quirk called as 'Dual Wire'. For a case of higher
sampling transmission frequency, this commit performs calculations between
the number of PCM frames and the number of events in AMDTP stream.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-pcm.c | 43 ++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 570456a7751d..813c9ffbeced 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -164,13 +164,14 @@ static int init_hw_info(struct snd_dice *dice,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_dice *dice = substream->private_data;
+	struct amdtp_domain *d = &dice->domain;
 	unsigned int source;
 	bool internal;
 	int err;
 
 	err = snd_dice_stream_lock_try(dice);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = init_hw_info(dice, substream);
 	if (err < 0)
@@ -195,27 +196,45 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	/*
-	 * When source of clock is not internal or any PCM streams are running,
-	 * available sampling rate is limited at current sampling rate.
-	 */
+	mutex_lock(&dice->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
 	if (!internal ||
-	    amdtp_stream_pcm_running(&dice->tx_stream[0]) ||
-	    amdtp_stream_pcm_running(&dice->tx_stream[1]) ||
-	    amdtp_stream_pcm_running(&dice->rx_stream[0]) ||
-	    amdtp_stream_pcm_running(&dice->rx_stream[1])) {
+	    (dice->substreams_counter > 0 && d->events_per_period > 0)) {
+		unsigned int frames_per_period = d->events_per_period;
 		unsigned int rate;
 
 		err = snd_dice_transaction_get_rate(dice, &rate);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&dice->mutex);
 			goto err_locked;
+		}
+
 		substream->runtime->hw.rate_min = rate;
 		substream->runtime->hw.rate_max = rate;
+
+		if (frames_per_period > 0) {
+			// For double_pcm_frame quirk.
+			if (rate > 96000)
+				frames_per_period *= 2;
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&dice->mutex);
+				goto err_locked;
+			}
+		}
 	}
 
+	mutex_unlock(&dice->mutex);
+
 	snd_pcm_set_sync(substream);
-end:
-	return err;
+
+	return 0;
 err_locked:
 	snd_dice_stream_lock_release(dice);
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
