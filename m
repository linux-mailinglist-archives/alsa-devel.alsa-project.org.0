Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A667C5B147B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 08:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0959D169A;
	Thu,  8 Sep 2022 08:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0959D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662617706;
	bh=12ExutlKcEytTEX44mGCYJcOotVZuLRiUKgvdCHRt1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nM0nWzBWDlcUd+ZqKpOjVQTKFRhOE3AkpJQLGkm8BqzayAug/HELET11Fs4sbTw2G
	 vCMSjIecBiE4YNvmzH4juI7F7WDNepgTGDInKmhEsdvvDtl37ahIAajnZg5UHnSqko
	 fNY9Xf6tDa5ptb27ERSQHvQliwkXbBr/gAN3wpEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 783FDF8023B;
	Thu,  8 Sep 2022 08:14:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B96F80217; Thu,  8 Sep 2022 08:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6F74F8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 08:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F74F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UXmoGztA"
Received: by mail-pj1-x102b.google.com with SMTP id pj10so6318186pjb.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ngoKgI+Gpj5SpGutpSICvbZM5VaeXyWj2yjGsVSlTyI=;
 b=UXmoGztAvkbEq8ev/rCGPZB8yRP3yewWsjk2wn+kToOvlBnkUnfjcJmlUy8VZsh+6o
 upACSRU/9FbMwwZ0C7zy+5PrqftYa6eaR7WnqSL246uw0EdmMQrmF6AgaDl+zSXdCyNB
 m/UM8PnMtSCCyBrBgLy1MsippYNrhWJQveq8t9ROubqbcEiHnTm09hZwdEansfEacwkj
 DYIgydyEQYygV7VI8u9Y3RUTSw1sCWBJle01kKRs9OqS75pscLYWm+W25hx5bjCaPkoP
 TqRr3PCqqduYYIfGksN50DVKUhwOnLD5NHhCOTsMdvP3YmH/fEICOtblI/FqZi++qURU
 oDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ngoKgI+Gpj5SpGutpSICvbZM5VaeXyWj2yjGsVSlTyI=;
 b=DDlMZBCEA++QdfvqUBNjepRnFWS0AgT/RlwZkdmY8uuEN19y3h0KSUbML30bMPCxLZ
 4OPq6KNdoK9kqaoJDwnanM9WxUgo5w2eATqEBISxs1u2gfQB1KfTlse2bSDVKSP0oifW
 B2dJecrSmqZ/A4iC6dpH6SD0L4OQy2ZRWbh2xMw0GWjfvPkEwYYyWh27ficA8yKL7zyj
 xOENim6wEGgMRkCLetG6npCtP5qYVSAjqLO9Qps8FSf+GmCYzh/9LEBzHOfKME19+Q82
 K2ATbMGfLfwZAt1mLKW3a+enSwoPUgvInBwBqa2hS13nkUzeN2QiIyFVbBibV1nVh/fe
 33fg==
X-Gm-Message-State: ACgBeo2eD6FMLDhI++KlknuNXV3r5PHmFfbfOkj3BNLCw6TJcRO42OZF
 eBsPCuJtCmiK2/OjD4CrmJ8=
X-Google-Smtp-Source: AA6agR7vc1mfwDN0ui9GNVakudcVSEUPlFZb5nXcrH5tmYMdajmFL8Dk3nYYXQrt6R5mZvx9uqSPDA==
X-Received: by 2002:a17:90b:4a09:b0:1fd:d4be:fed4 with SMTP id
 kk9-20020a17090b4a0900b001fdd4befed4mr2578331pjb.6.1662617639152; 
 Wed, 07 Sep 2022 23:13:59 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a170902f68800b00176b7dcf2c0sm7775886plg.240.2022.09.07.23.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 23:13:58 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [v2] ASoC: max98390: Remove unnecessary amp on/off conrtol
Date: Thu,  8 Sep 2022 15:03:59 +0900
Message-Id: <20220908060359.13606-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Steve Lee <steve.lee.analog@gmail.com>, ryans.lee@analog.com,
 krzk@kernel.org
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

 The Amp is already control in userspace before trigger calibrate function.
Remove unnecessary control in calibrate function and
add condition to check calibration is ready.

Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
---
 sound/soc/codecs/max98390.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 91c0bf3d76fc..4b2ee70c29d7 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -635,10 +635,19 @@ static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
 static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
+	unsigned int val;
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
 
-	max98390_dsm_calibrate(component);
+	regmap_read(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, &val);
+	if (val == 0x1)
+		max98390_dsm_calibrate(component);
+	else {
+		dev_err(component->dev, "AMP is not ready to run calibration\n");
+		return -ECANCELED;
+	}
 
 	return 0;
 }
@@ -826,9 +835,6 @@ static int max98390_dsm_calibrate(struct snd_soc_component *component)
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
-	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x81);
-	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x01);
-
 	regmap_read(max98390->regmap,
 		THERMAL_RDC_RD_BACK_BYTE1, &rdc);
 	regmap_read(max98390->regmap,
@@ -847,9 +853,6 @@ static int max98390_dsm_calibrate(struct snd_soc_component *component)
 	dev_info(component->dev, "rdc resistance about %d.%02d ohm, reg=0x%X temp reg=0x%X\n",
 		 rdc_integer, rdc_factor, rdc_cal_result, temp);
 
-	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x00);
-	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
-
 	return 0;
 }
 
-- 
2.17.1

