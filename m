Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C6680D12
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 13:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AD5BE83;
	Mon, 30 Jan 2023 13:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AD5BE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675080590;
	bh=v/tEkZndHLSFZQ+dXZe20waQvOgf9abYz/CSFTYQntc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IIP/R3ro6jSkkd+7GfLVNLAXfDucwBublSY0EG3CnQosdGaVgTsvMI0Xxep8qHeg9
	 skP39WBqHdci9EXRYwuNE+MqHiJqdmMxv/8MC2MBsbLfyC9w9OEnZ+XzFlQhezh2IE
	 wghAbvTFyYqNwR9Z0utPFU0mQjDvG9Yjgg0rkrkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E833F80564;
	Mon, 30 Jan 2023 13:07:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D44F80553; Mon, 30 Jan 2023 13:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08452F8047D
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 13:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08452F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=tgpxk4sH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675080455; x=1706616455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/tEkZndHLSFZQ+dXZe20waQvOgf9abYz/CSFTYQntc=;
 b=tgpxk4sHI8SS0knvMmM1p08dpP1r6Zql+MmwI5qT58gXxdoEV7gtEL9q
 1lGj1CZHD7KheRLdTu58cAZjirtysSSZw8Un9k+t2VOjNqwHZAJfaJztF
 826ikpqLVO9tq6TGp15mvQwnHAs9QhE4kE4u2knnLd/0SyEmhMkSjz1bZ
 RBWFPK1AQjrIt7JIuj600zM6Fd+SME0YnK/WtjIo6ySntqnVDDfXrvhp+
 rxC9RUefERVgjJvC35GEIplGlLymOx+Rt+8KOns73J28Cr+Kx8UpnmQ/U
 oQN6ehGNxrA2txBKXmdhRj55pv8lVNJwr8kT32wlx7VpUJ9lBSD/m7vhc w==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; d="scan'208";a="194432936"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2023 05:07:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:07:24 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 05:07:20 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/8] ASoC: mchp-spdifrx: fix controls which rely on rsr
 register
Date: Mon, 30 Jan 2023 14:06:40 +0200
Message-ID: <20230130120647.638049-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The SPDIFRX block is clocked by 2 clocks: peripheral and generic clocks.
Peripheral clock feeds user interface (registers) and generic clock feeds
the receiver.

To enable the receiver the generic clock needs to be enabled and also the
ENABLE bit of MCHP_SPDIFRX_MR register need to be set.

The signal control exported by mchp-spdifrx driver reports wrong status
when the receiver is disabled. This can happen when requesting the signal
and the capture was not previously started. To solve this the receiver
needs to be enabled (by enabling generic clock and setting ENABLE bit of
MR register) before reading the signal status.

As with this fix there are 2 paths now that need to control the generic
clock and ENABLE bit of SPDIFRX_MR register (one path though controls, one
path though configuration) a mutex has been introduced. We can't rely on
subsystem locking as the controls are protected by
struct snd_card::controls_rwsem semaphore and configuration is protected
by a different lock (embedded in snd_pcm_stream_lock_irq()).

The introduction of mutex is also extended to other controls which rely on
SPDIFRX_RSR.ULOCK bit as it has been discovered experimentally that having
both clocks enabled but not the receiver (through ENABLE bit of SPDIFRX.MR)
leads to inconsistent values of SPDIFRX_RSR.ULOCK. Thus on some controls we
rely on software state (dev->trigger_enabled protected by mutex) to
retrieve proper values.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 192 ++++++++++++++++++++++++---------
 1 file changed, 142 insertions(+), 50 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index ec0705cc40fa..2d86e0ec930f 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -233,11 +233,13 @@ struct mchp_spdifrx_dev {
 	struct mchp_spdifrx_mixer_control	control;
 	spinlock_t				blockend_lock;	/* protect access to blockend_refcount */
 	int					blockend_refcount;
+	struct mutex				mlock;
 	struct device				*dev;
 	struct regmap				*regmap;
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
+	unsigned int				trigger_enabled;
 	unsigned int				gclk_enabled:1;
 };
 
@@ -353,47 +355,40 @@ static int mchp_spdifrx_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
-	u32 mr;
-	int running;
-	int ret;
-
-	regmap_read(dev->regmap, SPDIFRX_MR, &mr);
-	running = !!(mr & SPDIFRX_MR_RXEN_ENABLE);
+	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (!running) {
-			mr &= ~SPDIFRX_MR_RXEN_MASK;
-			mr |= SPDIFRX_MR_RXEN_ENABLE;
-			/* enable overrun interrupts */
-			regmap_write(dev->regmap, SPDIFRX_IER,
-				     SPDIFRX_IR_OVERRUN);
-		}
+		mutex_lock(&dev->mlock);
+		/* Enable overrun interrupts */
+		regmap_write(dev->regmap, SPDIFRX_IER, SPDIFRX_IR_OVERRUN);
+
+		/* Enable receiver. */
+		regmap_update_bits(dev->regmap, SPDIFRX_MR, SPDIFRX_MR_RXEN_MASK,
+				   SPDIFRX_MR_RXEN_ENABLE);
+		dev->trigger_enabled = true;
+		mutex_unlock(&dev->mlock);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (running) {
-			mr &= ~SPDIFRX_MR_RXEN_MASK;
-			mr |= SPDIFRX_MR_RXEN_DISABLE;
-			/* disable overrun interrupts */
-			regmap_write(dev->regmap, SPDIFRX_IDR,
-				     SPDIFRX_IR_OVERRUN);
-		}
+		mutex_lock(&dev->mlock);
+		/* Disable overrun interrupts */
+		regmap_write(dev->regmap, SPDIFRX_IDR, SPDIFRX_IR_OVERRUN);
+
+		/* Disable receiver. */
+		regmap_update_bits(dev->regmap, SPDIFRX_MR, SPDIFRX_MR_RXEN_MASK,
+				   SPDIFRX_MR_RXEN_DISABLE);
+		dev->trigger_enabled = false;
+		mutex_unlock(&dev->mlock);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
-	if (ret) {
-		dev_err(dev->dev, "unable to enable/disable RX: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return ret;
 }
 
 static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
@@ -413,13 +408,6 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	regmap_read(dev->regmap, SPDIFRX_MR, &mr);
-
-	if (mr & SPDIFRX_MR_RXEN_ENABLE) {
-		dev_err(dev->dev, "PCM already running\n");
-		return -EBUSY;
-	}
-
 	if (params_channels(params) != SPDIFRX_CHANNELS) {
 		dev_err(dev->dev, "unsupported number of channels: %d\n",
 			params_channels(params));
@@ -445,6 +433,13 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	mutex_lock(&dev->mlock);
+	if (dev->trigger_enabled) {
+		dev_err(dev->dev, "PCM already running\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	if (dev->gclk_enabled) {
 		clk_disable_unprepare(dev->gclk);
 		dev->gclk_enabled = 0;
@@ -455,19 +450,24 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 		dev_err(dev->dev,
 			"unable to set gclk min rate: rate %u * ratio %u + 1\n",
 			params_rate(params), SPDIFRX_GCLK_RATIO_MIN);
-		return ret;
+		goto unlock;
 	}
 	ret = clk_prepare_enable(dev->gclk);
 	if (ret) {
 		dev_err(dev->dev, "unable to enable gclk: %d\n", ret);
-		return ret;
+		goto unlock;
 	}
 	dev->gclk_enabled = 1;
 
 	dev_dbg(dev->dev, "GCLK range min set to %d\n",
 		params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
 
-	return regmap_write(dev->regmap, SPDIFRX_MR, mr);
+	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
+
+unlock:
+	mutex_unlock(&dev->mlock);
+
+	return ret;
 }
 
 static int mchp_spdifrx_hw_free(struct snd_pcm_substream *substream,
@@ -475,10 +475,12 @@ static int mchp_spdifrx_hw_free(struct snd_pcm_substream *substream,
 {
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
 
+	mutex_lock(&dev->mlock);
 	if (dev->gclk_enabled) {
 		clk_disable_unprepare(dev->gclk);
 		dev->gclk_enabled = 0;
 	}
+	mutex_unlock(&dev->mlock);
 	return 0;
 }
 
@@ -627,10 +629,24 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 	u32 val;
 	bool ulock_old = ctrl->ulock;
 
-	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
-	ctrl->ulock = !(val & SPDIFRX_RSR_ULOCK);
+	mutex_lock(&dev->mlock);
+
+	/*
+	 * The RSR.ULOCK has wrong value if both pclk and gclk are enabled
+	 * and the receiver is disabled. Thus we take into account the
+	 * dev->trigger_enabled here to return a real status.
+	 */
+	if (dev->trigger_enabled) {
+		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+		ctrl->ulock = !(val & SPDIFRX_RSR_ULOCK);
+	} else {
+		ctrl->ulock = 0;
+	}
+
 	uvalue->value.integer.value[0] = ctrl->ulock;
 
+	mutex_unlock(&dev->mlock);
+
 	return ulock_old != ctrl->ulock;
 }
 
@@ -643,8 +659,22 @@ static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
 	u32 val;
 	bool badf_old = ctrl->badf;
 
-	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
-	ctrl->badf = !!(val & SPDIFRX_RSR_BADF);
+	mutex_lock(&dev->mlock);
+
+	/*
+	 * The RSR.ULOCK has wrong value if both pclk and gclk are enabled
+	 * and the receiver is disabled. Thus we take into account the
+	 * dev->trigger_enabled here to return a real status.
+	 */
+	if (dev->trigger_enabled) {
+		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+		ctrl->badf = !!(val & SPDIFRX_RSR_BADF);
+	} else {
+		ctrl->badf = 0;
+	}
+
+	mutex_unlock(&dev->mlock);
+
 	uvalue->value.integer.value[0] = ctrl->badf;
 
 	return badf_old != ctrl->badf;
@@ -656,11 +686,48 @@ static int mchp_spdifrx_signal_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
-	u32 val;
+	u32 val = ~0U, loops = 10;
+	int ret;
 	bool signal_old = ctrl->signal;
 
-	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
-	ctrl->signal = !(val & SPDIFRX_RSR_NOSIGNAL);
+	mutex_lock(&dev->mlock);
+
+	/*
+	 * To get the signal we need to have receiver enabled. This
+	 * could be enabled also from trigger() function thus we need to
+	 * take care of not disabling the receiver when it runs.
+	 */
+	if (!dev->trigger_enabled) {
+		ret = clk_prepare_enable(dev->gclk);
+		if (ret)
+			goto unlock;
+
+		regmap_update_bits(dev->regmap, SPDIFRX_MR, SPDIFRX_MR_RXEN_MASK,
+				   SPDIFRX_MR_RXEN_ENABLE);
+
+		/* Wait for RSR.ULOCK bit. */
+		while (--loops) {
+			regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+			if (!(val & SPDIFRX_RSR_ULOCK))
+				break;
+			usleep_range(100, 150);
+		}
+
+		regmap_update_bits(dev->regmap, SPDIFRX_MR, SPDIFRX_MR_RXEN_MASK,
+				   SPDIFRX_MR_RXEN_DISABLE);
+
+		clk_disable_unprepare(dev->gclk);
+	} else {
+		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+	}
+
+unlock:
+	mutex_unlock(&dev->mlock);
+
+	if (!(val & SPDIFRX_RSR_ULOCK))
+		ctrl->signal = !(val & SPDIFRX_RSR_NOSIGNAL);
+	else
+		ctrl->signal = 0;
 	uvalue->value.integer.value[0] = ctrl->signal;
 
 	return signal_old != ctrl->signal;
@@ -685,18 +752,32 @@ static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
 	u32 val;
 	int rate;
 
-	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
-
-	/* if the receiver is not locked, ISF data is invalid */
-	if (val & SPDIFRX_RSR_ULOCK || !(val & SPDIFRX_RSR_IFS_MASK)) {
+	mutex_lock(&dev->mlock);
+
+	/*
+	 * The RSR.ULOCK has wrong value if both pclk and gclk are enabled
+	 * and the receiver is disabled. Thus we take into account the
+	 * dev->trigger_enabled here to return a real status.
+	 */
+	if (dev->trigger_enabled) {
+		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+		/* If the receiver is not locked, ISF data is invalid. */
+		if (val & SPDIFRX_RSR_ULOCK || !(val & SPDIFRX_RSR_IFS_MASK)) {
+			ucontrol->value.integer.value[0] = 0;
+			goto unlock;
+		}
+	} else {
+		/* Reveicer is not locked, IFS data is invalid. */
 		ucontrol->value.integer.value[0] = 0;
-		return 0;
+		goto unlock;
 	}
 
 	rate = clk_get_rate(dev->gclk);
 
 	ucontrol->value.integer.value[0] = rate / (32 * SPDIFRX_RSR_IFS(val));
 
+unlock:
+	mutex_unlock(&dev->mlock);
 	return 0;
 }
 
@@ -913,7 +994,18 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 			"failed to get the PMC generated clock: %d\n", err);
 		return err;
 	}
+
+	/*
+	 * Signal control need a valid rate on gclk. hw_params() configures
+	 * it propertly but requesting signal before any hw_params() has been
+	 * called lead to invalid value returned for signal. Thus, configure
+	 * gclk at a valid rate, here, in initialization, to simplify the
+	 * control path.
+	 */
+	clk_set_min_rate(dev->gclk, 48000 * SPDIFRX_GCLK_RATIO_MIN + 1);
+
 	spin_lock_init(&dev->blockend_lock);
+	mutex_init(&dev->mlock);
 
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
-- 
2.34.1

