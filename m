Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD574C016C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:34:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2077D17F1;
	Tue, 22 Feb 2022 19:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2077D17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554856;
	bh=heFBunNEzcKo1/YHzW+SVhtP2cY4hixXzjDRPiXeaU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7TSttnJxqqR0pxfasgFarsiXHW6cUmJxJMP6Q55kG0mz0NKWEDeoG19FIQCjvZOX
	 kMDY8wmoJGY66GJjpJMZyESlS+jltVhayauXsfMq6CUVmKXXjUTuNiszZyjTVwe6mf
	 8kWdHNpuZxJSyMbekh4Wzd+M52YuaDfPMh/XPSHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4AFDF80519;
	Tue, 22 Feb 2022 19:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F608F80518; Tue, 22 Feb 2022 19:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A5CFF8012C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5CFF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZRF1c5KW"
Received: by mail-wr1-x430.google.com with SMTP id j22so9005138wrb.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y7JyAd12ezNQnJ94i2wAgEHL19WtPs4b74x+OoJQPCY=;
 b=ZRF1c5KWu1lErY1nstOF8ndQJAhL3OMRzAu+M+DBn6wQu90FPCZWvWArtKYbBI9B0E
 I9/pQfiglr4/04Zc6rU58HkkAo8k2CAHxvLG3M7gJFbSYpsPBZqq8MhU64bN/TtC60zB
 7hDOi/CpZ4Ly278O2Z52mKbNDsbfwRfC1UZBWKNODDtc137sj8SPqBUDrNwtmP+blOVM
 BwBvwyWUjb7CaHr8BDgGLLxl68nVIGtrql+Qq/pmvl2glAxpEyUgYyvicuJtDQoOfHQn
 ixAuwvAK05NI100h0h8VNDjEzDknibdb/0M4l5h/x0awufU0zXh+JP1GB4acjrVOkwQC
 zHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y7JyAd12ezNQnJ94i2wAgEHL19WtPs4b74x+OoJQPCY=;
 b=k01G6XmNQFyzKp4Y950wf9vzS3OuwgQseLT8/6uxbs7xlHJ7wxcko52ZJ5DHKg9YS5
 nEw4WsLvRmErXiPomX5Ja7TWLgsGx4yp645G/6K4L6dS3yRqoDXmvDgJXDKeYKJwJW/6
 8uCRyguyl+Ak4RJ+Hs0DXzWxeDyuDXsUiq9eYfgzbuv+cknddq1jshbvfFbRks7IyjvJ
 TdHQKGgXJNU9x9cdti0OOgATMj9cUTEQZQrpJNy1ADj5VAzPz+QqmWdZqiUluCo3k984
 R0I9wwpO70DvMG9cNyvDk5kUqNInI93sKaAOB3xAPOMPknA/s1y5YKSsBr7erTc5TeCP
 74oA==
X-Gm-Message-State: AOAM532Yv51QIGnBZsBLL9yf/9sZQvgwaEExoohfbQU+mhSbDMJxFSCG
 MgHyr3hIIYQC8bH3q6+i9R0ulg==
X-Google-Smtp-Source: ABdhPJzzZEScQ57B6/CcC6Fpa02neArlpb11/SFHUaZIBQjmk3T7P1DGV5DjJkeXijhoqkp+6cQtVw==
X-Received: by 2002:a05:6000:104f:b0:1e4:b53a:85d9 with SMTP id
 c15-20020a056000104f00b001e4b53a85d9mr20384283wrx.594.1645554748244; 
 Tue, 22 Feb 2022 10:32:28 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/9] ASoC: codecs: rx-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 18:32:05 +0000
Message-Id: <20220222183212.11580-3-srinivas.kandagatla@linaro.org>
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

Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 32e85d2e9b90..3a3dc0539d92 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2272,7 +2272,7 @@ static int rx_macro_mux_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] =
+	ucontrol->value.enumerated.item[0] =
 			rx->rx_port_value[widget->shift];
 	return 0;
 }
@@ -2284,7 +2284,7 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update *update = NULL;
-	u32 rx_port_value = ucontrol->value.integer.value[0];
+	u32 rx_port_value = ucontrol->value.enumerated.item[0];
 	u32 aif_rst;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
@@ -2396,7 +2396,7 @@ static int rx_macro_get_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = rx->hph_pwr_mode;
+	ucontrol->value.enumerated.item[0] = rx->hph_pwr_mode;
 	return 0;
 }
 
@@ -2406,7 +2406,7 @@ static int rx_macro_put_hph_pwr_mode(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
-	rx->hph_pwr_mode = ucontrol->value.integer.value[0];
+	rx->hph_pwr_mode = ucontrol->value.enumerated.item[0];
 	return 0;
 }
 
-- 
2.21.0

