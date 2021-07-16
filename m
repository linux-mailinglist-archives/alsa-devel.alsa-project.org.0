Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA13CB67C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 12:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F6F16A1;
	Fri, 16 Jul 2021 12:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F6F16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626433161;
	bh=ZiDCGni4m/m4Pk821PHt9Pub0nULMngM7uv2xFU/FNg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PL48CutjCTdGzYC86EhtNpVspH28gdghPFzVWRbFV+C74nTUtXyrh7lz+bZeVFHBU
	 1dF0IoQB89Kkd4WoYe2j4EXqdjVEnHLIBAzqJhBeEBm8GmD1t1JcoH6pIHSYOqBtLl
	 +rGc4WDmB/qiYrvaM60FwLC7smecZ2pCzTHqp+U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5AEF804E1;
	Fri, 16 Jul 2021 12:57:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 399D5F804E0; Fri, 16 Jul 2021 12:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC6FFF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC6FFF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T7pf4GIN"
Received: by mail-wm1-x336.google.com with SMTP id w13so5562944wmc.3
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKfdywkweNu6uAoYJAmHaJ4+OWe5ozT0lTBOuOqLOpk=;
 b=T7pf4GIN3ivs7j02IxO84YPTxsw8V9EprKQUh/Y4IwBAHSAfUKLWU/NqEk95tiWbZY
 OnimKdU4CDwbdDGbAqORSddxkGQYpAWuQyKACSKb2rpKfL7E0pPR8rlPdgZdGlERsRZE
 XYqYhEVLOzpjDgKm/gixOU4gipZrMY+hnUvTUEov8gnEAMh2mILYynTkEblFYu5Kl0nf
 2wsQwIJdfHDXPjVssNNi4mwP2616m8EutLwRE9gcXnJQnIspvMy5N2g5hSDKam8SWGD4
 Wv+EJACq+7QoAHgUrCjNFp6Fw1GZ+altBl5rGqTsV6wE8qfYqWypyhXuXKZ0YpJX7kHJ
 VpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKfdywkweNu6uAoYJAmHaJ4+OWe5ozT0lTBOuOqLOpk=;
 b=YeWp8rLOGL3AVoARC3GQ/3YWkjJi1u2ziWon1oU//dQeHeQMckYDJGS1eRhIjEXXf3
 7dvjk1YSY7ZKAa86DvVNXXiIuhdmd8MaXUHpyyVBpqmmXqrisb8y3RlQDC+ymgP21TT3
 sUaU10WpO7fLcL4ACtvaduKOuphh4YN0pditJLnNd5r+lg8rch+bzavHCBEgtXe+EL+m
 HB/bTKJ5Mzhl+lvhDMxLJWTO8IWY0kQkL4c5F+CLNMupb0Fr+68JQpQr5GnQNEPszQTE
 23KwXRH7jii8MjPXt1ox94xI6+NWxeg8Mr747XolfEXxP+necRib/O7gE8hMZtbPSFQT
 lnTw==
X-Gm-Message-State: AOAM530eTZ1oe9sBBfs/KrYrrVBW6oLs3eiJbr6Ud8BDjx999bf2FfTU
 Ozq5ksEVrZ0nHiKgfxQmO3ED9A==
X-Google-Smtp-Source: ABdhPJzxkpMf6KBdAjhUrcl5RQIJVBosDs5BsQjMLHASK4sk5AjML/Nk4ijSXXVHgkiYsa2EzOD6rA==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr9562287wmq.145.1626433057920; 
 Fri, 16 Jul 2021 03:57:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h130sm464544wmh.1.2021.07.16.03.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:57:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wcd938x: setup irq during component bind
Date: Fri, 16 Jul 2021 11:57:35 +0100
Message-Id: <20210716105735.6073-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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

SoundWire registers are only accessable after sdw components are succesfully
binded. Setup irqs at that point instead of doing at probe.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e32810902383..e5795cd964f7 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3314,13 +3314,6 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 			     (WCD938X_DIGITAL_INTR_LEVEL_0 + i), 0);
 	}
 
-	ret = wcd938x_irq_init(wcd938x, component->dev);
-	if (ret) {
-		dev_err(component->dev, "%s: IRQ init failed: %d\n",
-			__func__, ret);
-		return ret;
-	}
-
 	wcd938x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
 						       WCD938X_IRQ_HPHR_PDM_WD_INT);
 	wcd938x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
@@ -3550,7 +3543,6 @@ static int wcd938x_bind(struct device *dev)
 	}
 	wcd938x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd938x->rxdev);
 	wcd938x->sdw_priv[AIF1_PB]->wcd938x = wcd938x;
-	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
 
 	wcd938x->txdev = wcd938x_sdw_device_get(wcd938x->txnode);
 	if (!wcd938x->txdev) {
@@ -3559,7 +3551,6 @@ static int wcd938x_bind(struct device *dev)
 	}
 	wcd938x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd938x->txdev);
 	wcd938x->sdw_priv[AIF1_CAP]->wcd938x = wcd938x;
-	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
 	wcd938x->tx_sdw_dev = dev_to_sdw_dev(wcd938x->txdev);
 	if (!wcd938x->tx_sdw_dev) {
 		dev_err(dev, "could not get txslave with matching of dev\n");
@@ -3592,6 +3583,15 @@ static int wcd938x_bind(struct device *dev)
 		return PTR_ERR(wcd938x->regmap);
 	}
 
+	ret = wcd938x_irq_init(wcd938x, dev);
+	if (ret) {
+		dev_err(dev, "%s: IRQ init failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
+	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
+
 	ret = wcd938x_set_micbias_data(wcd938x);
 	if (ret < 0) {
 		dev_err(dev, "%s: bad micbias pdata\n", __func__);
-- 
2.21.0

