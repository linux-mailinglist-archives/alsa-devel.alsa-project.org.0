Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6810925FEB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B5DF54;
	Wed,  3 Jul 2024 14:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B5DF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008893;
	bh=hcQM/u4gdKEirg5JUeG8TyWsInxszV0wEWN+duol+CY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T9spk35vdn0dYdaL9+hcDG6Jgbj9e+cEna+D4n2wO2t795o093dZ20yWiorEl+Ydj
	 eInaoGYk9zYkQM0DN5zeH6PZGNs+dTh+o1MxAzfdg/Cyrq+9UQEvk/Q0lhPa7xqyN6
	 0dF/J6eIcSMkil6FBFyjt7TYsrsr2dQrD8NN/UK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67C02F805E5; Wed,  3 Jul 2024 14:14:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68180F805BE;
	Wed,  3 Jul 2024 14:14:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49326F8058C; Wed,  3 Jul 2024 14:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8083F8025E
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8083F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RMNeeuaz
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42641dec7c3so2677075e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008673; x=1720613473;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvfHWDLawXK7UTQtN1jPqjdOr/fZ9HhxS6j/T8wlgb0=;
        b=RMNeeuazN2iMLEUGN/MY5GvYfV6X0vayIxJ85HmlKpY4b3FL4qODIIuiZmYzLuKc2U
         yUY8NP8LDArHFaPXSRJRPIGQZ6EKAxZIn7QbHwfxkd2U5cKarPL2yZ9j9LagMXz+g5kR
         GSpyh41fUhW9f1CSwnSk1AfLirmU17cxTXHXuGgghpQw2WP35aObUL9HaxQO9MYL7AKq
         2qXkNL1mwHDP61HSJiROjRdVWR2ehAE4GDFnRLpfC4CbZxS/HxizQx6YUJ9dzexiqiUo
         hYIqq1eZoemCqcGYb/RPk3HShbo2klnmuDxYW9s27n8j/1/5xXxEixUokwCUSEayLna3
         5Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008673; x=1720613473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvfHWDLawXK7UTQtN1jPqjdOr/fZ9HhxS6j/T8wlgb0=;
        b=pT0Ma6Ekp2WgjBWFkUXPMZ+CRisQdDn14Zi/85FYrPgHScTQxAg0gDytK7WLKCyLSZ
         y9Znq0EUZ3z7nGCPvB0/EsPsJn3NifyDiSC52oza6EQyIfrZmqjkQaAuN2lr1PM1DRdF
         xtWkF3YledTaORzxd2F22XOXLlSZsUFA5XmU8ZQzSiZoBfXEtvLyH+20+QiaritEYl8V
         5ACSXgu9ucRRPmgyix5cS9+mKa/Nxn1z3dajm7c2eEnKhdiEZKdBLUZmy65TY9qXtJ8D
         4N4IJ3cqH7vB5ENQsmrRK9Kll6VBtiXWQcSCFKBuH8q2FwgE5mTCKiV89pPmHcnAdM/z
         4aVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlDEpqiNo2KkLvl3p9Jw88RK9GOlcAjmqth4aufDUUt2QALNwAkKb6PxFRYkIlQYzIVbsSRH1Fkdf1v/YhXuzL3cOERgjw3UnOBjM=
X-Gm-Message-State: AOJu0YyyLVIAgOSr5gw5i2NOkGCXuIE536IiGEPQ2VTMyd0eJOBI3RTo
	kuI1VFUhASGYXxOAeIbWxySjAiQqMSTzyblubR5cnrvd3FQ2JRqtn1lrYXr5bK0=
X-Google-Smtp-Source: 
 AGHT+IH/sDmBGQHkKlo6P8bbLVjWf52TOStaaHtlhq8jk1kOVYcLwRGZwRzl7cnPOdgKGkCKo6+RoQ==
X-Received: by 2002:adf:e24e:0:b0:366:ecc4:aa6e with SMTP id
 ffacd0b85a97d-3677569e9e7mr7912505f8f.4.1720008673463;
        Wed, 03 Jul 2024 05:11:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:57 +0200
Subject: [PATCH 03/11] ASoC: codecs: wcd9335: Simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-3-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hcQM/u4gdKEirg5JUeG8TyWsInxszV0wEWN+duol+CY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/TOLcCIz6vRLHZuKKP8eFZ3aNZ0lSBNsBPR
 gPoj0LQArmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0wAKCRDBN2bmhouD
 15lDD/90zgr9CUgmwUMkXnQnamYu6m4EoSre0Pt416O1Wakpe2GuaQQXnXtSAFvkzmCN10TFJZS
 5mtDly3oBv29VLaL69b+0QdddwCyIaiHwr8ZHtoQyRQQbJ96V5mnVIzjvtdwcLji6ImP6o5nqw1
 7wXJnm8S6bE9dTMtmAIVqk7VZsp3HYcC57MFq8tHaNaCIszhbI3ac3d06FT+mEUjh/DK1zHBXrp
 YlAvQWzutJrs63xmHSN5017bL6GJ8WTFqfjN/1zVIZu5LjANy1Q6Pjy14KFkr3BMiAlVOCsI7/v
 UixaWOhI2XyG3sVrfnsI9OC2Tn5/90qd+qsG6yW9ajxs1BQLdfmH/sbF3dt+yH8nzH1uMDrIEuK
 9JaG3EaZj6+sMovJfP7FOkKSZQp2Nh4BGcw1OEuI1hzfOQAUdq4JQ/7aAGuWb5NZ5LK7Mel7Ixd
 FHdoYh5nEFncyG6eylOXFPv18YVRccUV0jLdRQR8qiTs/pdNlpdkMnER5LtZhphvqXfFOZJfiNW
 DxCSuGc/e7LCeRnXNj9bIxhaLPxD6IbRm+gny4Yvj6y3/yOVe21+yLfYFxGNvJlJ+4lQYThBc6g
 0ul+8ij1wZ4eAoA6XHNKr3O3LN6k7/KbGdnaduYaVQyTS5PESikZXMDj/ZbKqwSmli2SPa9+JwI
 QXVLp6ds12r0Jfg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: C4IOJYI3UZ2RT342XKABQWRVM5KCCXB2
X-Message-ID-Hash: C4IOJYI3UZ2RT342XKABQWRVM5KCCXB2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4IOJYI3UZ2RT342XKABQWRVM5KCCXB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1a20131e2a60..373a31ddccb2 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/wait.h>
 #include <linux/bitops.h>
@@ -2714,25 +2715,23 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	unsigned int decimator;
 	char *dec_adc_mux_name = NULL;
-	char *widget_name = NULL;
-	char *wname;
+	char *widget_name;
 	int ret = 0, amic_n;
 	u16 tx_vol_ctl_reg, pwr_level_reg = 0, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
-	if (!widget_name)
+	char *wname __free(kfree) = kmemdup_nul(w->name, 15, GFP_KERNEL);
+	if (!wname)
 		return -ENOMEM;
 
-	wname = widget_name;
+	widget_name = wname;
 	dec_adc_mux_name = strsep(&widget_name, " ");
 	if (!dec_adc_mux_name) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, w->name);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	dec_adc_mux_name = widget_name;
 
@@ -2740,16 +2739,14 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	if (!dec) {
 		dev_err(comp->dev, "%s: decimator index not found\n",
 			__func__);
-		ret =  -EINVAL;
-		goto out;
+		return  -EINVAL;
 	}
 
 	ret = kstrtouint(dec, 10, &decimator);
 	if (ret < 0) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, wname);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	tx_vol_ctl_reg = WCD9335_CDC_TX0_TX_PATH_CTL + 16 * decimator;
@@ -2836,8 +2833,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x00);
 		break;
 	}
-out:
-	kfree(wname);
+
 	return ret;
 }
 

-- 
2.43.0

