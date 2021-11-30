Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E9463AFC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:06:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9916222B5;
	Tue, 30 Nov 2021 17:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9916222B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638288398;
	bh=taeENlQ9KcgqBvjK4Q2K97S2jBcDzNPzogaBJ4rGWfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OyojOfXV6fWBMuacmO4wLBkJTqqwNdQfjSco4Z4VxIMlGq9BjlIWxohEKw3dVeqsN
	 7/qZ67g7RKX+ZJhHX93z8+16NGO52e0IKNx1pfsiiAQ+06mi+Wb9vSVKxIFdb1HYVE
	 sNTUem9UaGrw0+4N1xbqICejrvyfGV9RESYenHSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8808DF804EB;
	Tue, 30 Nov 2021 17:05:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7ED3F804EB; Tue, 30 Nov 2021 17:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89EF8F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EF8F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zieBOBgJ"
Received: by mail-wm1-x336.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso15121956wmr.5
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cf22A45pIeR4jTVVQeT79V6xpjlvyZZcaz2Nd53SNwU=;
 b=zieBOBgJlezxLM6a+mgn0ZoGwqWpWXR0ep4C0N3OKYR3G6hMjrB3u2lVsIUIKPB4AF
 IPS6tjfHpQDPGXP3q3eHbMXs6WB5Bqh5f4nCrDfasPgsd47iPhIis9/4Dfh/gdpWZI0C
 S8vIJmUvHq4XgKVlQWISEu3p0RzYMZ4FXdMS5hOWBsue5ewlinM/VhHGicUAVbboEn/E
 emdm14dHBi1MQP7QVli6CKznIhjM0tc1U8wgibKyL7fA+ghefz5xVhlrbs5B+N3eGE/O
 vhbKkOzomFum02wWFxCtWdkUeb96R5GH52kRZcFy8rK/jmBdEqrhD8zrNWtRTv+dcay2
 VKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cf22A45pIeR4jTVVQeT79V6xpjlvyZZcaz2Nd53SNwU=;
 b=UW/M5wdX917KFigIuBNjLgGNdInaChX06RczLDCHu/anbZvXH8gqINB+0t2okubiNv
 DbxojerIhJWcZexN6EsG0HMLBVL8mZMDSPhUITeBH5bv/heQmtev9h0Bx6LtldfFohpA
 UKarNN7PpnAkZJ6jCT202NtSrzvRv9Tc7uekiPtW0onXgpgb2PhGjQhOzyFvUKM1dcg+
 WhlCb1v2H+3SAnNSrK81pA6R4+E5yBP0okaTQrKMzlOZK7QAmfEKq2cBeGf1pERY0Myo
 eqRMcJb6tVA7XgNZL5cSC9Lyx5skm/Mbd5hPDWgwucDO85QC33ec4S+xj9eGBdXKytIm
 mQQA==
X-Gm-Message-State: AOAM530ze5jeurrJEtHTeg/AQFXG3wegUtvBJNAZpdC99SspwgGQXSoX
 XaTRWBsBR2KdqVxrjGPzaFS+QIAS+ShlnQ==
X-Google-Smtp-Source: ABdhPJzLcAC1smNz3lM+4F8KaRwpxqBWaK5zP1R57JU/TzPu4Nnobd90HPstMEfd9+bqfB8qj2ULmA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr347711wmn.93.1638288317080; 
 Tue, 30 Nov 2021 08:05:17 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id g18sm16719409wrv.42.2021.11.30.08.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:05:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: codecs: wcd934x: remove redundant ret variable
Date: Tue, 30 Nov 2021 16:05:05 +0000
Message-Id: <20211130160507.22180-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

return value form snd_soc_dapm_put_enum_double() directly instead
of taking this in another redundant variable.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index eb4e2f2a24ae..3294c685d4d8 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3420,7 +3420,7 @@ static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
 {
 	struct soc_enum *e = (struct soc_enum *)kc->private_value;
 	struct snd_soc_component *component;
-	int reg, val, ret;
+	int reg, val;
 
 	component = snd_soc_dapm_kcontrol_component(kc);
 	val = ucontrol->value.enumerated.item[0];
@@ -3443,9 +3443,7 @@ static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
 					      WCD934X_RX_DLY_ZN_EN_MASK,
 					      WCD934X_RX_DLY_ZN_DISABLE);
 
-	ret = snd_soc_dapm_put_enum_double(kc, ucontrol);
-
-	return ret;
+	return snd_soc_dapm_put_enum_double(kc, ucontrol);
 }
 
 static int wcd934x_dec_enum_put(struct snd_kcontrol *kcontrol,
-- 
2.21.0

