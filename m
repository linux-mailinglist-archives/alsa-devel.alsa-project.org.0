Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE44BF7B8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BD817F0;
	Tue, 22 Feb 2022 13:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BD817F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531388;
	bh=lB8OV4dDj2dHTsaucpGM2OONEOzfnwG8IyCDHINaWzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCgZckt1LcMOlsnYTWiEBZFI6w8kQ4+71FM1+HDfoHrrp9yT2DgJYPZi2nRq8H1WQ
	 8bEPX4tP2bk6Eb8zeEAg83cLFv8ZIpOTGI3ovJ2s5z4o3+CxpPBLioVy369QJmOV3i
	 8VfT9oC6grYySsx8YGGzbmKP+Et81p+yYqcpAmV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E50F80520;
	Tue, 22 Feb 2022 13:00:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F780F800D1; Tue, 22 Feb 2022 13:00:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 392EFF800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 392EFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BFcQ0xeG"
Received: by mail-wm1-x334.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so1618330wmq.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4+KoWOLDfBWBNmg8ATzKj3dgQDIuJh9SiDFM0VqDsI=;
 b=BFcQ0xeGjkb5gAjr4AmA0Upb6D/t5gZ3sgiwyOwFnOPwn7x3emUhI03zW9x9tKD9gI
 XhZcTlsxhpPG756DZ4gni1co0nrdMBbo9jTz/H0WsiBSyskEsiKG8jWaROZiOaZ+UONI
 o1ywDWRZqTdZDrb8uuU3dFlLb0E9wTgK21wlnNyClrSvZgt2CpkgteBG1MhxcUavVKie
 yNTf+OT0eaJFVzXCUT5G+JstVJvzlk1f1r0S6zwH3n/vl0rfBQK9AZ5+9hd8329QWaMW
 BWyFMVbrEnnmYz8GL70pMisVsQpkqxveoYDWvgppJKDE+8dK4GIW3Kts4NPiAEwKzyof
 5TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4+KoWOLDfBWBNmg8ATzKj3dgQDIuJh9SiDFM0VqDsI=;
 b=qhUx/vX/YT8TWP5Sw5qthxDQdVP7wIhLsdo83a+557m0zJOB5KNNuoJ85Pqa4cvWii
 S960vUykfjMKqnAajZtJQX2hVTMGcaUGcYxFMKUE+J0Y8HsJApp85Rrok8BQMZV9XWZY
 nqfQAQCZ0ClJU5xXuNGo7ltoPZ4ADFCxLAwQGbOg/8x7d1OJPKWuVoMv4/3Ba7O158r+
 BuumO3VWzDw2PHzS62NvUTKfo1FfhxzZBJto+g5UeXR/pNzRNGPU3kkuYbvlV91XSx92
 hs2N1I4NjeW61bgnmQ+jTzyHTtDo2wL8i8ECWirzEmEiTiUxFW9XM0O9mWAi6rAP/Yme
 wkDA==
X-Gm-Message-State: AOAM533yBFGkNqyouEUoY5oOKTaBdNbmyHXzacn+QZsjHMKlg8MbcpTV
 4jIUZj1LL++gEe96k33Kwelyhg==
X-Google-Smtp-Source: ABdhPJxq6HIDurY9AQGuguDuGeBZZw3FpNl85sCDgC+WPGHKegdDi8iHlSvjQXET7sL/ND1r74vreg==
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id
 13-20020a05600c230d00b0037d5882ec9bmr3053532wmo.162.1645531192803; 
 Tue, 22 Feb 2022 03:59:52 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:52 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 05/16] ASoC: codecs: wsa-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 11:59:22 +0000
Message-Id: <20220222115933.9114-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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
index 05bf18ae10e7..7de09c46264b 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1806,7 +1806,7 @@ static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = wsa->ear_spkr_gain;
+	ucontrol->value.enumerated.item[0] = wsa->ear_spkr_gain;
 
 	return 0;
 }
@@ -1817,7 +1817,7 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	wsa->ear_spkr_gain =  ucontrol->value.integer.value[0];
+	wsa->ear_spkr_gain =  ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
@@ -1831,7 +1831,7 @@ static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
 				snd_soc_dapm_to_component(widget->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] =
+	ucontrol->value.enumerated.item[0] =
 			wsa->rx_port_value[widget->shift];
 	return 0;
 }
@@ -1845,7 +1845,7 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 				snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update *update = NULL;
-	u32 rx_port_value = ucontrol->value.integer.value[0];
+	u32 rx_port_value = ucontrol->value.enumerated.item[0];
 	u32 bit_input;
 	u32 aif_rst;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -1888,7 +1888,7 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(widget->dapm, kcontrol,
 					rx_port_value, e, update);
-	return 0;
+	return 1;
 }
 
 static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
-- 
2.21.0

