Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E22F93DE
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED68017AE;
	Sun, 17 Jan 2021 17:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED68017AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899921;
	bh=gA+9UWlUdeha3xxLUfXwJnmxCl/h7745Aq8gS7xvDSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irXB+SGo6IG1SHP6PQaMgTX05GGVq/O7Z6USdxSqbiOQGlSotLqJg78A8mpdc6h6v
	 wBfvJ0GDCZBGSCmSctRR5tyKX51INjI9tHX9ycJqxwbgjHpokIvQGSX40uf9styN5k
	 bPsU0yQVggVmg1GpOlWEDr6oMRR0miezJ5aJb3QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9129F80526;
	Sun, 17 Jan 2021 17:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A16DF804E2; Sun, 17 Jan 2021 17:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3081AF8026A
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3081AF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="B45JFnuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPpDVW4Z7epgF4/Pf2+S8J+h+2S2GVmGKe2F3fVzvTc=;
 b=B45JFnuVQ/DU2Jb4IJNEa8iqoopRY10a7Pbd78C+7Ggoq5aNsU6d+hAzzAZqeiOpFnFH1K
 B/V//3kF5HOtfK2PSJSb5I3fG5/OsY2DgcOdnGorzJBlWlZu5m5QkR7IgQB/FMIZNDHTpj
 HXr3zOwRgEQs552TfBbYP6KN9wN7Krc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-GDoRi8D0ONK9KGdwyXutLQ-1; Sun, 17 Jan 2021 11:06:24 -0500
X-MC-Unique: GDoRi8D0ONK9KGdwyXutLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A3D15720;
 Sun, 17 Jan 2021 16:06:22 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED135C266;
 Sun, 17 Jan 2021 16:06:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 07/12] ASoC: arizona-jack: Use arizona->dev for runtime-pm
Date: Sun, 17 Jan 2021 17:05:50 +0100
Message-Id: <20210117160555.78376-8-hdegoede@redhat.com>
In-Reply-To: <20210117160555.78376-1-hdegoede@redhat.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use arizona->dev for runtime-pm as the main shared/libray code from
sound/soc/codecs/arizona.c does.

This is part of a patch series converting the arizona extcon driver into
a helper library for letting the arizona codec-drivers directly report jack
state through the standard sound/soc/soc-jack.c functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/arizona-jack.c | 42 ++++++++++++++-------------------
 sound/soc/codecs/arizona.h      |  1 -
 2 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index c81c3b20f94e..a6e8071f84ab 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -251,7 +251,7 @@ static void arizona_start_mic(struct arizona_priv *info)
 	unsigned int mode;
 
 	/* Microphone detection can't use idle mode */
-	pm_runtime_get(info->dev);
+	pm_runtime_get_sync(arizona->dev);
 
 	if (info->detecting) {
 		ret = regulator_allow_bypass(info->micvdd, false);
@@ -296,7 +296,7 @@ static void arizona_start_mic(struct arizona_priv *info)
 		dev_err(arizona->dev, "Failed to enable micd: %d\n", ret);
 	} else if (!change) {
 		regulator_disable(info->micvdd);
-		pm_runtime_put_autosuspend(info->dev);
+		pm_runtime_put_autosuspend(arizona->dev);
 	}
 }
 
@@ -341,8 +341,8 @@ static void arizona_stop_mic(struct arizona_priv *info)
 
 	if (change) {
 		regulator_disable(info->micvdd);
-		pm_runtime_mark_last_busy(info->dev);
-		pm_runtime_put_autosuspend(info->dev);
+		pm_runtime_mark_last_busy(arizona->dev);
+		pm_runtime_put_autosuspend(arizona->dev);
 	}
 }
 
@@ -534,7 +534,7 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 		info->num_hpdet_res = 0;
 		info->hpdet_retried = true;
 		arizona_start_hpdet_acc_id(info);
-		pm_runtime_put(info->dev);
+		pm_runtime_put(arizona->dev);
 		return -EAGAIN;
 	}
 
@@ -631,7 +631,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		arizona_start_mic(info);
 
 	if (info->hpdet_active) {
-		pm_runtime_put_autosuspend(info->dev);
+		pm_runtime_put_autosuspend(arizona->dev);
 		info->hpdet_active = false;
 	}
 
@@ -656,7 +656,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 	dev_dbg(arizona->dev, "Starting HPDET\n");
 
 	/* Make sure we keep the device enabled during the measurement */
-	pm_runtime_get(info->dev);
+	pm_runtime_get_sync(arizona->dev);
 
 	info->hpdet_active = true;
 
@@ -685,7 +685,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 
 err:
 	arizona_extcon_hp_clamp(info, false);
-	pm_runtime_put_autosuspend(info->dev);
+	pm_runtime_put_autosuspend(arizona->dev);
 
 	/* Just report headphone */
 	ret = extcon_set_state_sync(info->edev, EXTCON_JACK_HEADPHONE, true);
@@ -708,7 +708,7 @@ static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
 	dev_dbg(arizona->dev, "Starting identification via HPDET\n");
 
 	/* Make sure we keep the device enabled during the measurement */
-	pm_runtime_get_sync(info->dev);
+	pm_runtime_get_sync(arizona->dev);
 
 	info->hpdet_active = true;
 
@@ -1006,7 +1006,7 @@ static void arizona_micd_detect(struct work_struct *work)
 	else
 		arizona_button_reading(info);
 
-	pm_runtime_mark_last_busy(info->dev);
+	pm_runtime_mark_last_busy(arizona->dev);
 	mutex_unlock(&info->lock);
 }
 
@@ -1090,7 +1090,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	pm_runtime_get_sync(info->dev);
+	pm_runtime_get_sync(arizona->dev);
 
 	mutex_lock(&info->lock);
 
@@ -1110,7 +1110,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 		dev_err(arizona->dev, "Failed to read jackdet status: %d\n",
 			ret);
 		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(info->dev);
+		pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
 	}
 
@@ -1210,8 +1210,8 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	mutex_unlock(&info->lock);
 
-	pm_runtime_mark_last_busy(info->dev);
-	pm_runtime_put_autosuspend(info->dev);
+	pm_runtime_mark_last_busy(arizona->dev);
+	pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
 }
@@ -1366,7 +1366,6 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	mutex_init(&info->lock);
 	info->arizona = arizona;
-	info->dev = &pdev->dev;
 	info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
 	INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
 	INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
@@ -1617,9 +1616,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	arizona_extcon_set_mode(info, 0);
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_idle(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(arizona->dev);
 
 	if (info->micd_clamp) {
 		jack_irq_rise = ARIZONA_IRQ_MICD_CLAMP_RISE;
@@ -1689,7 +1686,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		goto err_hpdet;
 	}
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(arizona->dev);
 
 	return 0;
 
@@ -1706,8 +1703,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 err_rise:
 	arizona_free_irq(arizona, jack_irq_rise, info);
 err_pm:
-	pm_runtime_put(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put(arizona->dev);
 err_gpio:
 	gpiod_put(info->micd_pol_gpio);
 	return ret;
@@ -1747,7 +1743,7 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 			ret);
 	} else if (change) {
 		regulator_disable(info->micvdd);
-		pm_runtime_put(info->dev);
+		pm_runtime_put(arizona->dev);
 	}
 
 	regmap_update_bits(arizona->regmap,
@@ -1759,8 +1755,6 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 
 	gpiod_put(info->micd_pol_gpio);
 
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index d1a263a67bba..7132dbc3c840 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -93,7 +93,6 @@ struct arizona_priv {
 	bool dvfs_cached;
 
 	/* Variables used by arizona-jack.c code */
-	struct device *dev;
 	struct mutex lock;
 	struct delayed_work hpdet_work;
 	struct delayed_work micd_detect_work;
-- 
2.28.0

