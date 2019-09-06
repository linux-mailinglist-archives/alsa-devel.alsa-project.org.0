Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E8AC0E4
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE8B846;
	Fri,  6 Sep 2019 21:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE8B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799410;
	bh=g8egl986clhDxlO5cvnxITtGjNt1/BHnxo+p/7NC0qw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KleINO8EHJ9GNoeuMtDkCaMV0xzYCpuJjxCvAgLqGmkLwDIG2DDWZKGmAyDPZahJQ
	 FHvvNZipux2Zt6+5FvksxXwdgld7DlSYKISywFeBRmGXpGmG5BEt16w3d1Pje3//AU
	 eWKHsnsyR2D7yPevyqTqRv1S4qxAEBFmWFAztG2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0617F805F5;
	Fri,  6 Sep 2019 21:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD266F805E2; Fri,  6 Sep 2019 21:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52DA0F803D6
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52DA0F803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="P1vfjZJW"
Received: by mail-pl1-x642.google.com with SMTP id bd8so3637615plb.6
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLjZnC6r5JtqlbdUGnRN8/ZCpUEOGWMWHxfYOkGlfb0=;
 b=P1vfjZJW04HkNxMQFWVotWmIa8+QmL/qKvlDJWCfMnUcf+JcvpOpM6LvQIhD23xI1Z
 6WwhNDOCZ3i0JyXqgnx4KHB4Es62zLWPC1JNANcJoNsbQhq2vwJTrdBgVD/UWmMOIHXN
 XASgenE7EmRwNzX14lohKjVXtYl0qsw+pjJPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLjZnC6r5JtqlbdUGnRN8/ZCpUEOGWMWHxfYOkGlfb0=;
 b=rSS6OLmeRQfnEs0416QMjWa2MKtwAVae/MPzAxxTX8HTm9p6M13ZdCd9lMRnfIj9c3
 aDHaDlyhBSuKRTudMj0awBVr17cx/I6BPsU6k/crG+lHx+2n36/6Wz9uzl8MnvU1s/cs
 rV+z+eGR4sVGlgGKq3H65PhdLMXZQ8sFZQG4SMNnamw80YCbfWS4ux1Rn1Rsn8c714mk
 ouFCbPDBUcz6EEs/osgo1a0jNgPZu0/gI2bd4PemhyXPLnmn/9bwfyR3zU0fz/VxshTr
 P1a1oG9e0DtRcl4gDZdhr2vuhTJIzNzgidaBGILuO61S/jABNICUFTICcNBZQ447bflR
 l9Ww==
X-Gm-Message-State: APjAAAXjoYKNT44fyA/9/m9167FaPPfzjJe8377k7Xa05VDzJdkGj0TA
 swLqmHBD0VaY4v1O6X7GKe2qZeSakw==
X-Google-Smtp-Source: APXvYqyIhxKwELzZlNRW0EHLfjeBhJBIdt2dAHjtisRZ09MRgLTq2OYNLsDumPKYx9y68fNLlfTjqA==
X-Received: by 2002:a17:902:9889:: with SMTP id
 s9mr11277628plp.100.1567799255767; 
 Fri, 06 Sep 2019 12:47:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id v8sm12728153pje.6.2019.09.06.12.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:47:35 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:23 -0700
Message-Id: <20190906194636.217881-2-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 01/15] ASoC: rt5677: Remove magic number register
	writes
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

In order to simplify understanding what register values are being
written to the codec for debugging more advanced features (such as
hotwording) it is best to remove magic numbers

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index c779dc3474f9..5b6ca3ced13b 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -691,10 +691,12 @@ static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
 	if (on) {
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x2, 0x2);
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP, RT5677_PWR_DSP);
 		rt5677->is_dsp_mode = true;
 	} else {
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x2, 0x0);
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP, 0x0);
 		rt5677->is_dsp_mode = false;
 	}
 }
@@ -4466,7 +4468,8 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 
 			regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
 				RT5677_LDO1_SEL_MASK | RT5677_LDO2_SEL_MASK,
-				0x0055);
+				5 << RT5677_LDO1_SEL_SFT |
+				5 << RT5677_LDO2_SEL_SFT);
 			regmap_update_bits(rt5677->regmap,
 				RT5677_PR_BASE + RT5677_BIAS_CUR4,
 				0x0f00, 0x0f00);
@@ -4491,7 +4494,9 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x0);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG1, 0x0000);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG2, 0x0000);
-		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1, 0x0022);
+		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1,
+			2 << RT5677_LDO1_SEL_SFT |
+			2 << RT5677_LDO2_SEL_SFT);
 		regmap_write(rt5677->regmap, RT5677_PWR_ANLG2, 0x0000);
 		regmap_update_bits(rt5677->regmap,
 			RT5677_PR_BASE + RT5677_BIAS_CUR4, 0x0f00, 0x0000);
@@ -4719,7 +4724,8 @@ static int rt5677_probe(struct snd_soc_component *component)
 
 	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
 			~RT5677_IRQ_DEBOUNCE_SEL_MASK, 0x0020);
-	regmap_write(rt5677->regmap, RT5677_PWR_DSP2, 0x0c00);
+	regmap_write(rt5677->regmap, RT5677_PWR_DSP2,
+			RT5677_PWR_SLIM_ISO | RT5677_PWR_CORE_ISO);
 
 	for (i = 0; i < RT5677_GPIO_NUM; i++)
 		rt5677_gpio_config(rt5677, i, rt5677->pdata.gpio_config[i]);
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
