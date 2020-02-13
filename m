Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318915B9AD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 07:40:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22691670;
	Thu, 13 Feb 2020 07:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22691670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581576008;
	bh=P5k0jgZcm8PlId2d9lp0MPAqfRnpFD0kOH4xIftNIkM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4Uw4ImpKbzlTkyyFdkYjcNdnKRaUsSx3k+qvZNjoUugHbgbAuNA8CqaD2+5UxaqD
	 S2wqXN0c2PkY1RQMuS/rcHhx/aq2wbl0j1PErG3df37qZWBSNDaDydr+mY/qbdWS/J
	 vdn8pJXPLP6YFuv4dIfuRRjYKEvkFkuyeRfTIDd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3AEF8028B;
	Thu, 13 Feb 2020 07:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 790BBF80218; Thu, 13 Feb 2020 07:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 834DAF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 834DAF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="KR3NcI60"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Se+kasIG"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BBA3D56AB;
 Thu, 13 Feb 2020 01:11:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Feb 2020 01:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2WBzH4ndEnXh6
 eRe45H5/jBNPccuMIpJihLO9aYDojQ=; b=KR3NcI60t7lq1r1h/RZep01GXq9x5
 XMf6hm3Ay/w3bekhAJguNnvuFpGkmXpHNfeHR+xFLu+oVctuIaiwaB+yRy8kvOmC
 XD42pFow/q4A6MGhohQVR67bVr9rlrK2Emd0FRIGqVAwpTXdfOebIk3j51A5wK2E
 Q7RMNzia6OD9w5Dl2iY/MMDMN9HR3Ay5dyUBjmasBJEpWX8ecZVTV0dSmS8sYi1A
 dwm5Rr/GtiK2D9mOQNNisTwacIzxr6ZLhIKivwzajrPVeY78K4Xb+w0SDdR6n6t8
 q46x6c430S6oPzB//CEoly1OfMuHtsL9ZB+PL9nRmTvH/STkyVsIwEuOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2WBzH4ndEnXh6eRe45H5/jBNPccuMIpJihLO9aYDojQ=; b=Se+kasIG
 Uz0WZ6f66py6NAWXZJI4TANjigpt/Qo2QFq+ovdv3C1/RszSsiULh62gobPqn+ZF
 lJhlQodnWdOrd+cqZ/sMuLKZJFa4PnrGvC6+6mcP3vUYZ9vc71ZjI58uRGS2ATmD
 Vc3SbCizrJ4O5EIOM7G7eYXXvjlJ2q5xk6342aT/GaJd4XqizR9ZdTpQMKVuwjJG
 ovqib58wD47BFzu/ivVMwOw7LboHi0+KvV9sNU7zojexjErYZX/GldSF26x8d/HN
 MMgi2klcmPwYKEbYuR0xv7Bf92QOcXqn2wmGfTfrmaJ/BdWdxoMnQKlLi1og43ng
 nmAQM8N/9zOC6A==
X-ME-Sender: <xms:puhEXvTeqj4tKfunuB9yVcM3PI62p9bniBrfEFtCLt0KHXTTEp3sCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:puhEXmy7w1Up5H1NBuGn1sZzHifhJabuDE1orQ9SzqTIU2WGHD8MGg>
 <xmx:puhEXvB-lGv0RpBBFd6evyf6IObRXe1axGmnU1r2CWf64ODuZp3Q0A>
 <xmx:puhEXi4sGriHhiPcYBVM9Wn6c3u4UzMxG7Qk6UkrvMum2bH_Is8slg>
 <xmx:puhEXoqan9HwIYsYi_4fLv682CAbF_dTUJVz0RJeSUWM_LpZHDE0tQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D86A23280068;
 Thu, 13 Feb 2020 01:11:49 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 00:11:45 -0600
Message-Id: <20200213061147.29386-3-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213061147.29386-1-samuel@sholland.org>
References: <20200213061147.29386-1-samuel@sholland.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 07:36:42 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/4] ALSA: pcm: Make snd_pcm_limit_hw_rates
	take hw directly
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

It can be useful to derive min/max rates of a snd_pcm_hardware without
having a snd_pcm_runtime, such as before constructing an ASoC DAI link.

Since snd_pcm_limit_hw_rates only uses runtime->hw, it does not actually
need the snd_pcm_runtime. Modify it to take a pointer to hw directly.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |  2 +-
 include/sound/pcm.h                                |  2 +-
 sound/arm/aaci.c                                   |  2 +-
 sound/arm/pxa2xx-ac97.c                            |  2 +-
 sound/core/pcm_misc.c                              | 14 +++++++-------
 sound/firewire/dice/dice-pcm.c                     |  2 +-
 sound/firewire/digi00x/digi00x-pcm.c               |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c           |  2 +-
 sound/firewire/motu/motu-pcm.c                     |  2 +-
 sound/firewire/tascam/tascam-pcm.c                 |  2 +-
 sound/pci/atiixp.c                                 |  2 +-
 sound/pci/cs5535audio/cs5535audio_pcm.c            |  4 ++--
 sound/pci/hda/hda_controller.c                     |  4 ++--
 sound/pci/intel8x0.c                               |  2 +-
 sound/pci/sis7019.c                                |  2 +-
 sound/pci/via82xx.c                                |  4 ++--
 sound/soc/soc-pcm.c                                |  4 ++--
 sound/usb/caiaq/audio.c                            |  4 ++--
 18 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 2b7539701b42..33f7bcf992a4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -328,7 +328,7 @@ static int dw_hdmi_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	ret = snd_pcm_limit_hw_rates(runtime);
+	ret = snd_pcm_limit_hw_rates(&runtime->hw);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8a89fa6fdd5e..203b79d2712a 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1121,7 +1121,7 @@ snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
 	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
 }
 
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime);
+int snd_pcm_limit_hw_rates(struct snd_pcm_hardware *hw);
 unsigned int snd_pcm_rate_to_rate_bit(unsigned int rate);
 unsigned int snd_pcm_rate_bit_to_rate(unsigned int rate_bit);
 unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index b5399b0090a7..5052689247f9 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -413,7 +413,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 	runtime->private_data = aacirun;
 	runtime->hw = aaci_hw_info;
 	runtime->hw.rates = aacirun->pcm->rates;
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		runtime->hw.channels_max = 6;
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index acfaf1d4ec25..cfb23073471e 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -77,7 +77,7 @@ static int pxa2xx_ac97_pcm_open(struct snd_pcm_substream *substream)
 	i = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		AC97_RATES_FRONT_DAC : AC97_RATES_ADC;
 	runtime->hw.rates = pxa2xx_ac97_ac97->rates[i];
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 
 	platform_ops = substream->pcm->card->dev->platform_data;
 	if (platform_ops && platform_ops->startup) {
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index c4eb561d2008..435688855ed0 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -474,25 +474,25 @@ EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
 /**
  * snd_pcm_limit_hw_rates - determine rate_min/rate_max fields
- * @runtime: the runtime instance
+ * @runtime: the pcm hw instance
  *
  * Determines the rate_min and rate_max fields from the rates bits of
- * the given runtime->hw.
+ * the given hw.
  *
  * Return: Zero if successful.
  */
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
+int snd_pcm_limit_hw_rates(struct snd_pcm_hardware *hw)
 {
 	int i;
 	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_min = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_min = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
 	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_max = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_max = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index be79d659eedf..85941d945067 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -117,7 +117,7 @@ static int limit_channels_and_rates(struct snd_dice *dice,
 		hw->channels_max = max(hw->channels_max, channels);
 	}
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(hw);
 
 	return 0;
 }
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 57cbce4fd836..0709070ab5af 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -78,7 +78,7 @@ static int pcm_init_hw_params(struct snd_dg00x *dg00x,
 		    SNDRV_PCM_RATE_48000 |
 		    SNDRV_PCM_RATE_88200 |
 		    SNDRV_PCM_RATE_96000;
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(hw);
 
 	err = snd_pcm_hw_rule_add(substream->runtime, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index e69896d748df..2ee8e98ea2b6 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -149,7 +149,7 @@ pcm_init_hw_params(struct snd_efw *efw,
 
 	/* limit rates */
 	runtime->hw.rates = efw->supported_sampling_rate,
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 
 	limit_channels(&runtime->hw, pcm_channels);
 
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 005970931030..338eb0572890 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -92,7 +92,7 @@ static void limit_channels_and_rates(struct snd_motu *motu,
 		hw->channels_max = max(hw->channels_max, pcm_channels);
 	}
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(hw);
 }
 
 static int init_hw_info(struct snd_motu *motu,
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 8e9b444c8bff..6722c1a65a42 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -35,7 +35,7 @@ static int pcm_init_hw_params(struct snd_tscm *tscm,
 		    SNDRV_PCM_RATE_48000 |
 		    SNDRV_PCM_RATE_88200 |
 		    SNDRV_PCM_RATE_96000;
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(hw);
 
 	return amdtp_tscm_add_pcm_hw_constraints(stream, runtime);
 }
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 1e1ededf8eb2..d7af407306b7 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1039,7 +1039,7 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 	dma->ac97_pcm_type = pcm_type;
 	if (pcm_type >= 0) {
 		runtime->hw.rates = chip->pcms[pcm_type]->rates;
-		snd_pcm_limit_hw_rates(runtime);
+		snd_pcm_limit_hw_rates(&runtime->hw);
 	} else {
 		/* direct SPDIF */
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4642e5384e83..7ce1664a8148 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -84,7 +84,7 @@ static int snd_cs5535audio_playback_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = snd_cs5535audio_playback;
 	runtime->hw.rates = cs5535au->ac97->rates[AC97_RATES_FRONT_DAC];
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	cs5535au->playback_substream = substream;
 	runtime->private_data = &(cs5535au->dmas[CS5535AUDIO_DMA_PLAYBACK]);
 	if ((err = snd_pcm_hw_constraint_integer(runtime,
@@ -343,7 +343,7 @@ static int snd_cs5535audio_capture_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = snd_cs5535audio_capture;
 	runtime->hw.rates = cs5535au->ac97->rates[AC97_RATES_ADC];
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	cs5535au->capture_substream = substream;
 	runtime->private_data = &(cs5535au->dmas[CS5535AUDIO_DMA_CAPTURE]);
 	if ((err = snd_pcm_hw_constraint_integer(runtime,
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index ba56b59b3e17..3728dbfae7b0 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -605,7 +605,7 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw.channels_max = hinfo->channels_max;
 	runtime->hw.formats = hinfo->formats;
 	runtime->hw.rates = hinfo->rates;
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
 	/* avoid wrap-around with wall-clock */
@@ -648,7 +648,7 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 		azx_release_device(azx_dev);
 		goto powerdown;
 	}
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	/* sanity check */
 	if (snd_BUG_ON(!runtime->hw.channels_min) ||
 	    snd_BUG_ON(!runtime->hw.channels_max) ||
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 12374ba08ca2..7f85a30291a1 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -1119,7 +1119,7 @@ static int snd_intel8x0_pcm_open(struct snd_pcm_substream *substream, struct ich
 	ichdev->substream = substream;
 	runtime->hw = snd_intel8x0_stream;
 	runtime->hw.rates = ichdev->pcm->rates;
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	if (chip->device_type == DEVICE_SIS) {
 		runtime->hw.buffer_bytes_max = 64*1024;
 		runtime->hw.period_bytes_max = 64*1024;
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index ef7dd290ae05..4d8e852d438f 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -681,7 +681,7 @@ static int sis_capture_open(struct snd_pcm_substream *substream)
 	runtime->private_data = voice;
 	runtime->hw = sis_capture_hw_info;
 	runtime->hw.rates = sis->ac97[0]->rates[AC97_RATES_ADC];
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 						9, 0xfff9);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 30c817b6b635..8a55153a6ea3 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1180,7 +1180,7 @@ static int snd_via82xx_pcm_open(struct via82xx *chip, struct viadev *viadev,
 	if (chip->spdif_on && viadev->reg_offset == 0x30) {
 		/* DXS#3 and spdif is on */
 		runtime->hw.rates = chip->ac97->rates[AC97_RATES_SPDIF];
-		snd_pcm_limit_hw_rates(runtime);
+		snd_pcm_limit_hw_rates(&runtime->hw);
 	} else if (chip->dxs_fixed && viadev->reg_offset < 0x40) {
 		/* fixed DXS playback rate */
 		runtime->hw.rates = SNDRV_PCM_RATE_48000;
@@ -1195,7 +1195,7 @@ static int snd_via82xx_pcm_open(struct via82xx *chip, struct viadev *viadev,
 	} else if (! ratep->rate) {
 		int idx = viadev->direction ? AC97_RATES_ADC : AC97_RATES_FRONT_DAC;
 		runtime->hw.rates = chip->ac97->rates[idx];
-		snd_pcm_limit_hw_rates(runtime);
+		snd_pcm_limit_hw_rates(&runtime->hw);
 	} else {
 		/* a fixed rate */
 		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01e7bc03d92f..bd7b3cfcfa62 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -416,7 +416,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		hw->formats = formats & cpu_stream->formats;
 	hw->rates = snd_pcm_rate_mask_intersect(rates, cpu_stream->rates);
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(hw);
 
 	hw->rate_min = max(hw->rate_min, cpu_stream->rate_min);
 	hw->rate_min = max(hw->rate_min, rate_min);
@@ -1951,7 +1951,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 
 	dpcm_set_fe_runtime(fe_substream);
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 
 	ret = dpcm_apply_symmetry(fe_substream, stream);
 	if (ret < 0) {
diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 970eb0865ba3..242f50ebc63a 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -145,7 +145,7 @@ static int snd_usb_caiaq_substream_open(struct snd_pcm_substream *substream)
 
 	dev_dbg(dev, "%s(%p)\n", __func__, substream);
 	substream->runtime->hw = cdev->pcm_info;
-	snd_pcm_limit_hw_rates(substream->runtime);
+	snd_pcm_limit_hw_rates(&substream->runtime->hw);
 
 	return 0;
 }
@@ -243,7 +243,7 @@ static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 		if (runtime->rate == rates[i])
 			cdev->pcm_info.rates = 1 << i;
 
-	snd_pcm_limit_hw_rates(runtime);
+	snd_pcm_limit_hw_rates(&runtime->hw);
 
 	bytes_per_sample = BYTES_PER_SAMPLE;
 	if (cdev->spec.data_alignment >= 2)
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
