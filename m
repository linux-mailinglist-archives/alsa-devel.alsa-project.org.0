Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73A5B8A11
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 16:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE5D18D3;
	Wed, 14 Sep 2022 16:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE5D18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663164789;
	bh=qesdwJk+Keiyz+ltyHxZhlWsVe1y4vsPbToY3U10HtU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FKPWZ08D7O+lfZRATWa5kar0De7a2jqr+/GzzQ03nG96SXZvCg1PrckWh2Acardw+
	 pztag/Qyi2qL6RwN5ulX8MlRdi0tNWNbzta0iEqIh3N4aVPPsTAlAYLFuJRIZG5TNs
	 /OxIS4x8Lb2j2E+iPnwZP7dvbYOZ1lYESdRkstCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD57F8008E;
	Wed, 14 Sep 2022 16:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 062F4F8014E; Wed, 14 Sep 2022 16:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C694F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 16:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C694F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=streamunlimited.com
 header.i=@streamunlimited.com header.b="rr9RBoaA"
Received: by mail-qt1-x82a.google.com with SMTP id c11so11204255qtw.8
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamunlimited.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=u0GFiAzqVNqXc141bb93y4ekLsCXre1Zhl8RCgtEfqs=;
 b=rr9RBoaAvNbxbtM3AFcMw4JVYWvwgrOlMfbul6kKm2UcS+HyVaWclk4EPNVop9w6o7
 ZxXWyQ9p+uJm7PJ2brv3Hvn7snxEg0XGU+xKddQipgHbmGjmB41pbWULsgtpGDu+KOXx
 ub/yr2St6nM51euWZjcoXVQsPAh0+cZPdd2ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=u0GFiAzqVNqXc141bb93y4ekLsCXre1Zhl8RCgtEfqs=;
 b=RwnqlMb+ZbZOXz3KJAS/HpF97ikjJ7NkRmQRFBcMwVJjiuf/1zQg/3s0ZKtxb7ojHs
 8LCpZcyXpw+a6BSiS+qGynL/aU9GT6oSuhNxBLYIK4Y6SRfsZoFdjgI42ne/4/FnezU9
 /NlnUOgEoKJXTEzxO618YEEHXXbATf8E8qNI3FrOgpQ08p7l1rMgewPOz7LZcPUXHVlv
 CP3TglUmMS3tCpHXcEFryXAcmcncIEPNGaJgW4tIO2Yc5JyuUM0K+ZMALuKAE39+Q+QM
 sn2RqwUVeOwDdT3sUzCJXsl11X0SHDvWkBMn2mfmYPxL+UqwdS6ZWZdqBJ4FYSMs9X0i
 5aTw==
X-Gm-Message-State: ACgBeo2sdVWj2XeB3B8qlSw4LxMf/zrzBxHUSEMGT69Mvd4AmKT/CKe6
 Mtyz+D2ySJQnXIJRGxYho2o/k9jygjNY/SRZ
X-Google-Smtp-Source: AA6agR75x+7Dos944hI7P369waP6C4qpbQOYNbJjlKaZ8vqROFdVpvd0v31a3uufd/dXTFgoMdsbag==
X-Received: by 2002:a05:622a:1b92:b0:35b:b7b3:6ddf with SMTP id
 bp18-20020a05622a1b9200b0035bb7b36ddfmr11552458qtb.223.1663164722264; 
 Wed, 14 Sep 2022 07:12:02 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
 by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm2109630qkb.89.2022.09.14.07.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 07:12:01 -0700 (PDT)
From: Martin Pietryka <martin.pietryka@streamunlimited.com>
To: alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: codecs: ak4458: only perform reset if any bits actually
 changed
Date: Wed, 14 Sep 2022 16:11:46 +0200
Message-Id: <20220914141146.117340-1-martin.pietryka@streamunlimited.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Pietryka <martin.pietryka@streamunlimited.com>
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

This reduces the amount of small audio artifacts that happen when a reset
is performed as documented in the data-sheet.

Signed-off-by: Martin Pietryka <martin.pietryka@streamunlimited.com>
---
 sound/soc/codecs/ak4458.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index ea33cc83c86c..741c2b69d238 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -349,6 +349,7 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	int pcm_width = max(params_physical_width(params), ak4458->slot_width);
 	u8 format, dsdsel0, dsdsel1, dchn;
 	int nfs1, dsd_bclk, ret, channels, channels_max;
+	int needs_reset = 0;
 
 	nfs1 = params_rate(params);
 	ak4458->fs = nfs1;
@@ -391,15 +392,16 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		snd_soc_component_update_bits(component, AK4458_06_DSD1,
-					      AK4458_DSDSEL_MASK, dsdsel0);
-		snd_soc_component_update_bits(component, AK4458_09_DSD2,
-					      AK4458_DSDSEL_MASK, dsdsel1);
+		needs_reset |= snd_soc_component_update_bits(component, AK4458_06_DSD1,
+							     AK4458_DSDSEL_MASK, dsdsel0);
+		needs_reset |= snd_soc_component_update_bits(component, AK4458_09_DSD2,
+							     AK4458_DSDSEL_MASK, dsdsel1);
 		break;
 	}
 
 	/* Master Clock Frequency Auto Setting Mode Enable */
-	snd_soc_component_update_bits(component, AK4458_00_CONTROL1, 0x80, 0x80);
+	needs_reset |= snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
+						     0x80, 0x80);
 
 	switch (pcm_width) {
 	case 16:
@@ -433,8 +435,8 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
-			    AK4458_DIF_MASK, format);
+	needs_reset |= snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
+						     AK4458_DIF_MASK, format);
 
 	/*
 	 * Enable/disable Daisy Chain if in TDM mode and the number of played
@@ -444,16 +446,18 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 		(ak4458->fmt == SND_SOC_DAIFMT_DSP_B) &&
 		(channels > channels_max) ? AK4458_DCHAIN_MASK : 0;
 
-	snd_soc_component_update_bits(component, AK4458_0B_CONTROL7,
-				      AK4458_DCHAIN_MASK, dchn);
+	needs_reset |= snd_soc_component_update_bits(component, AK4458_0B_CONTROL7,
+						     AK4458_DCHAIN_MASK, dchn);
 
-	ret = ak4458_rstn_control(component, 0);
-	if (ret)
-		return ret;
+	if (needs_reset) {
+		ret = ak4458_rstn_control(component, 0);
+		if (ret)
+			return ret;
 
-	ret = ak4458_rstn_control(component, 1);
-	if (ret)
-		return ret;
+		ret = ak4458_rstn_control(component, 1);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.3

