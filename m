Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F974C0171
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3831878;
	Tue, 22 Feb 2022 19:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3831878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554933;
	bh=KDoxNki3YTtua1SYzIGBKYTkslAPS0S1iUjPffwYwzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qmgyRXtEQGYN7CuvwHD8tWrwL4hX99A7MJbPx5Bh+R1+yimpUepD6JpPjXwVeXikp
	 mWPnJSBn2xQ8q9m3T2CtY+ci7bsCfvzXvsQi5ngRLb7XDnHKjyTt12krzZGy7YxTOv
	 hDJThFlhXK4RGO5fXJ9iF0QmG9bgfVW/5fRoVrfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9824FF80533;
	Tue, 22 Feb 2022 19:32:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F465F80311; Tue, 22 Feb 2022 19:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CFBBF80224
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFBBF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JIVjPZX+"
Received: by mail-wr1-x42f.google.com with SMTP id x15so712748wrg.8
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJUEubD8UMpBZteKL+cVLlZyMNg5UU9numn2ZyAs5ps=;
 b=JIVjPZX+CZlzxYoovRe150vIu193GQdJn3n2+d7YaMqvZ/CXwAuZeTFikwrq+ift7s
 AyVTcP32EyjgeoVodaWS80wh2q2Eu54pK39w38+RhTpjZeHKrmPJgzQhdQz9YBTtvjL1
 lZfA2hE9/bzt2t3Zm0dNv1HErSSOqo81KE7b1/lSvO0X8dFvUCWic5udoXaGJpKd+aW3
 CYt8IoPnu6grnaBZy6HgevnnFgPArT3kqa/tueutiQbPjcOd0n1T0ZX5QcZCYkSgbaGz
 8NACenIIFGmqY/78XG5z37ShvtUBVc2KY6gSR6Pqa+x5ri8zwhYU9fqGFVdfOtNkvmLD
 JipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pJUEubD8UMpBZteKL+cVLlZyMNg5UU9numn2ZyAs5ps=;
 b=R5PksVAB3M6o4cptdlThHsY22QVTqowqGg3x4Cs7Ffzp2QOjJN8aOUoRenxWTV2rPo
 mNd9Nwxa8kfQL90E52f7tS1dTEspXiL+pbqBSonNXlwwfQQA6p15wsG5UC4COvjuPS5O
 U7Zm3RbyDnbIVw/iYu9b5WfLqhZ4jO0SwLmsaT5GxPmYTNwAAAqrDrbEhmqL1yrA7VgF
 uRShOCU8WN06OpHjIaCVyF6ZpKaO/JyvXxBKdseY8M9H86W+zLnMyNdMZR3hhv+/0BKn
 8gYY8PLLBjd0YLdxlLM2atSqJkUEC9vTvA8QVyzpZoRkORyT/jnNnyx1vTf5BMNGOWPi
 9WHA==
X-Gm-Message-State: AOAM532y7JaKwi45EEb3dQzSclkv6tKwj1l4t/vpi3MEjRIkvGGlYi7C
 gMOdeGIyHr7d6dkl64Uf23hYAQ==
X-Google-Smtp-Source: ABdhPJzMsf+fs7MdsLfjKZHb5fhJT1XI6B8Km4xMkkbBk+s0Mqk9MZGbT93a2y+fvAq7lAINJUKLvw==
X-Received: by 2002:adf:ec03:0:b0:1e4:98f6:2563 with SMTP id
 x3-20020adfec03000000b001e498f62563mr20446293wrn.168.1645554751362; 
 Tue, 22 Feb 2022 10:32:31 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 5/9] ASoC: codecs: wsa-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 18:32:08 +0000
Message-Id: <20220222183212.11580-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Accessing enums using integer would result in array out of bounds access
on platforms like aarch64 where sizeof(long) is 8 compared to enum size
which is 4 bytes.

Also fix return value of put function, so that change notifications are
sent correctly.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 69d2915f40d8..ddde17e2dc35 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1805,7 +1805,7 @@ static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = wsa->ear_spkr_gain;
+	ucontrol->value.enumerated.item[0] = wsa->ear_spkr_gain;
 
 	return 0;
 }
@@ -1816,7 +1816,7 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	wsa->ear_spkr_gain =  ucontrol->value.integer.value[0];
+	wsa->ear_spkr_gain =  ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
@@ -1830,7 +1830,7 @@ static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
 				snd_soc_dapm_to_component(widget->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] =
+	ucontrol->value.enumerated.item[0] =
 			wsa->rx_port_value[widget->shift];
 	return 0;
 }
@@ -1844,7 +1844,7 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 				snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update *update = NULL;
-	u32 rx_port_value = ucontrol->value.integer.value[0];
+	u32 rx_port_value = ucontrol->value.enumerated.item[0];
 	u32 bit_input;
 	u32 aif_rst;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -1887,7 +1887,7 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(widget->dapm, kcontrol,
 					rx_port_value, e, update);
-	return 0;
+	return 1;
 }
 
 static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
-- 
2.21.0

