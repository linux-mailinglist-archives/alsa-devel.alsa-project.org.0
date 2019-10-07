Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365AACE003
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C930410E;
	Mon,  7 Oct 2019 13:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C930410E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446905;
	bh=z9pyD49e396GRQXm9IrUubPHnm6zDA1VmiBmNmCcJlw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T9aZ5iQ9c16JjyBSRq6e+t1H7pKMYkbZE921i316HpKqVpfKwmrnJa+oHqjfmmEC8
	 YyIDXaJsiEuuFv7NuHUZoDZpUc/69IkH6Y0ncbPCVonD/bL4AN1zoFgpSXpg++qaj4
	 LtCZNB+47KF4p5kqF949OFB+uV3/4UyIDmGm+0gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9330EF8070E;
	Mon,  7 Oct 2019 13:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3BAF80673; Mon,  7 Oct 2019 13:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A8DFF8063B
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8DFF8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PFu7mh3L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mlYfBmBf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 68BB921BBE;
 Mon,  7 Oct 2019 07:05:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hR/m70CiuZX0g
 Eyvt6mXm9Ex1uS3vqhqhcrA8DtZSfk=; b=PFu7mh3L/GnfAPOoGKNKUzZ5Qn527
 mmC4X2UgUjhcUEyTo7yzr1oqLlbMYFcaQ/qACgAoj73G9He8KSYTi/fQLl3gTjeZ
 /o7L1mGkPsF6yEmJqJDYUd518srVtB+gQncBWh/UiO9kWEWcSSTSUgj6L0aR6LEG
 wGco8zrHvN6+S4trt/lZ7GJknOAWlqjYN4l4oazIcRyCT92vcwyCJw5OBmQq6hzE
 Y8jXR7wt/mjVcbjRGYf9DYjb2Q/S9mwGl5a4h6pjw1zpknHU4rDVdLtd9lIaV7+O
 adwL+NmQGWCYcL9sDFNx0Xs333OiY7REtsT22eFFmlDNa75CJei4OPyCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hR/m70CiuZX0gEyvt6mXm9Ex1uS3vqhqhcrA8DtZSfk=; b=mlYfBmBf
 S8yvRbdqkpdJ7W/y+PjrbPTAElh9UxXh/dZs9CI9wwqZ82KQD+zGSoqWd4P0Shhj
 0i6EfPtjNBdER1vyf35MehlZ1XNurhFF1KS8SP5Vgv+487kM1+KWLAuPaeFO/79p
 ofs4sFq+xClE2HBAz0E53k6zhmVeWUb+Jvb6LVpPBhGVLwyW4IObU7EqOlg3l64n
 550cXXO9Gu95cGwCXkesLXgA182WyAkX6tu4JYj5EOc6eEy3lJtFX8w/YkqmCcoE
 rJlxt40ZuSDXqzqWwtkdM59th1uK/q7HSGLl1guqJClFFX48H+feWR8HkzeoswdO
 UfaWINTbGZglVA==
X-ME-Sender: <xms:ERybXWGXCQg6UWq1ZtYeO_dn1jTUmXGzqM9TW1mMJ6NQu5MCsuI-ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ERybXbmPp1ZjWjqckx-fbqnGLy7qGvkrNGHqQQJZhr0wBRAzsBbi0Q>
 <xmx:ERybXbJUrx6sSEI0Z7sdraD8jhRfRgV0ozPSyjYFxSQhbcJrpBdv2Q>
 <xmx:ERybXUYF1hWiAU1sT7p9bvgg5SvAfxDzkvcNZSB0BHJtvq-o6g2uAQ>
 <xmx:ERybXYau_mOmWNx4bKKPj_fc-JYCUtlij1N05wWn0nMZpuW-AKoTcQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEEE98005A;
 Mon,  7 Oct 2019 07:05:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:26 +0900
Message-Id: <20191007110532.30270-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/17] fireworks: use the same size of period
	for PCM substream in AMDTP streams
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
 sound/firewire/fireworks/fireworks_pcm.c | 39 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 35fc95283423..314d1f8b8344 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -173,13 +173,13 @@ pcm_init_hw_params(struct snd_efw *efw,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
-	unsigned int sampling_rate;
+	struct amdtp_domain *d = &efw->domain;
 	enum snd_efw_clock_source clock_source;
 	int err;
 
 	err = snd_efw_stream_lock_try(efw);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = pcm_init_hw_params(efw, substream);
 	if (err < 0)
@@ -189,23 +189,40 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	/*
-	 * When source of clock is not internal or any PCM streams are running,
-	 * available sampling rate is limited at current sampling rate.
-	 */
+	mutex_lock(&efw->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
 	if ((clock_source != SND_EFW_CLOCK_SOURCE_INTERNAL) ||
-	    amdtp_stream_pcm_running(&efw->tx_stream) ||
-	    amdtp_stream_pcm_running(&efw->rx_stream)) {
+	    (efw->substreams_counter > 0 && d->events_per_period > 0)) {
+		unsigned int frames_per_period = d->events_per_period;
+		unsigned int sampling_rate;
+
 		err = snd_efw_command_get_sampling_rate(efw, &sampling_rate);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&efw->mutex);
 			goto err_locked;
+		}
 		substream->runtime->hw.rate_min = sampling_rate;
 		substream->runtime->hw.rate_max = sampling_rate;
+
+		if (frames_per_period > 0) {
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&efw->mutex);
+				goto err_locked;
+			}
+		}
 	}
 
+	mutex_unlock(&efw->mutex);
+
 	snd_pcm_set_sync(substream);
-end:
-	return err;
+
+	return 0;
 err_locked:
 	snd_efw_stream_lock_release(efw);
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
