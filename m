Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CF216F70
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A34D1684;
	Tue,  7 Jul 2020 16:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A34D1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133745;
	bh=zcBHyOdMd9eyNgd07yzOrHYnqXgNb80QTPxsx8RCw88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y35fcBVfRiVs6CqC0Ozw2Mq/Rqll0GKa80kxhikAio+A1xrOcpYfE06KPgi+xn3Y7
	 PRRatDkZ5m2ylaKzhcQF59RJhSd1Gwf85ZeVywN6P21JhdD/dxGzDT80gCc39tlHca
	 BbN2eA75KwXiY4zwU0LAfLdbixcDudAc5wk83rLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61F1F803EA;
	Tue,  7 Jul 2020 16:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04DD1F80346; Tue,  7 Jul 2020 16:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94785F80348
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94785F80348
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UD8JHih7"
Received: by mail-wm1-x344.google.com with SMTP id f18so46803476wml.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkgQ5GKpYIPow7Og+7iz9PKlHm4fJKjWVXLF1XFMGh8=;
 b=UD8JHih7QFQAexNXEPUo9QYy4IoMnlLOWLAdsLS0W1nfVGjTq8naimB7im8Phva+RS
 gUUau5HQAMqWLa8YccTr+ow/31k7oHbGvHF5Q/eORpoCsfrYCZ7lOaJ8RzJefh4U3D2D
 PO7tDIF64lZSWfAZsj1I5JyRtDE5LfWqPZltzGBMm7PINEPCfa+tUMwFURt40Ii8wuxn
 /s14XFW1u1fIPanTA+lvRHot2g3gCpv8+2e+01HJOSRiv6j3ooFzsqzsJk27PvXe7IEb
 Q/gPy1PztvuOr6cQqdKmVXjnN+TKN+N08yu2Wwy3fShpP+7bPvUTHqH0a9BB0enQJW0I
 8KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkgQ5GKpYIPow7Og+7iz9PKlHm4fJKjWVXLF1XFMGh8=;
 b=rEGWfxkTZviYT3mKehWmLVE4GiEgzHH3pTXvDY34FmPqAfIFgNtgYS/KMeI1XV+XvM
 9LYaSeST8BQKN6xVFxzqfNQh1matlWsK8oJ1+kkly2i61qunF7YaW3mkQ+6PDeEYboj9
 XXOF6BnHowk20br7syBw4qx+kkPaqdeG178KHkYcHQqahigNjO7ZRWrz4030WALvI7Y5
 cbi5hNYV+vp/OQTq06DWYBlMMUuHThaJ4YN51DPUWFZWIinmLiTkAmsaFyMiORjxO9eP
 DYTvw15iby4j96GRzDjjpJBGSaWKolKEB7WYkw+FSK9UTwuhWX1/T9g5yTEwEJ6PjDCW
 Hrkg==
X-Gm-Message-State: AOAM531dd9d7FKdKPi8U2jby1W3c3BOL/VScXizz+653pnUVgTSdgxk9
 lpRNTbM5FEugyA1cMjfW+M93IQ==
X-Google-Smtp-Source: ABdhPJyaIhhN2E+kYZJHBX3tAa5DHpsKH/SpQGqIHITspt1DcfTehPuTLvLmz0TYDCWQ5N+3uaJdww==
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr4500355wme.171.1594132705122; 
 Tue, 07 Jul 2020 07:38:25 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 28/28] ASoC: codecs: wm8400: Remove a bunch of unused
 variables
Date: Tue,  7 Jul 2020 15:37:42 +0100
Message-Id: <20200707143742.2959960-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/wm8400.c:443:38: warning: ‘wm8400_dapm_rxvoice_controls’ defined but not used [-Wunused-const-variable=]
 443 | static const struct snd_kcontrol_new wm8400_dapm_rxvoice_controls[] = {
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 In file included from include/sound/tlv.h:10,
 from sound/soc/codecs/wm8400.c:26:
 sound/soc/codecs/wm8400.c:78:35: warning: ‘out_omix_tlv’ defined but not used [-Wunused-const-variable=]
 78 | static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
 | ^~~~~~~~~~~~
 include/uapi/sound/tlv.h:64:15: note: in definition of macro ‘SNDRV_CTL_TLVD_DECLARE_DB_SCALE’
 64 | unsigned int name[] = { | ^~~~
 sound/soc/codecs/wm8400.c:78:14: note: in expansion of macro ‘DECLARE_TLV_DB_SCALE’
 78 | static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
 | ^~~~~~~~~~~~~~~~~~~~
 sound/soc/codecs/wm8400.c:70:35: warning: ‘rec_mix_tlv’ defined but not used [-Wunused-const-variable=]
 70 | static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
 | ^~~~~~~~~~~
 include/uapi/sound/tlv.h:64:15: note: in definition of macro ‘SNDRV_CTL_TLVD_DECLARE_DB_SCALE’
 64 | unsigned int name[] = { | ^~~~
 sound/soc/codecs/wm8400.c:70:14: note: in expansion of macro ‘DECLARE_TLV_DB_SCALE’
 70 | static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: patches@opensource.cirrus.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/wm8400.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 2551eb0f1868c..35ffa7765c85c 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -67,16 +67,12 @@ static void wm8400_component_reset(struct snd_soc_component *component)
 	wm8400_reset_codec_reg_cache(wm8400->wm8400);
 }
 
-static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
-
 static const DECLARE_TLV_DB_SCALE(in_pga_tlv, -1650, 3000, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_mix_tlv, -2100, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_pga_tlv, -7300, 600, 0);
 
-static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
-
 static const DECLARE_TLV_DB_SCALE(out_dac_tlv, -7163, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(in_adc_tlv, -7163, 1763, 0);
@@ -439,14 +435,6 @@ static SOC_ENUM_SINGLE_DECL(wm8400_ainrmux_enum,
 static const struct snd_kcontrol_new wm8400_dapm_ainrmux_controls =
 SOC_DAPM_ENUM("Route", wm8400_ainrmux_enum);
 
-/* RXVOICE */
-static const struct snd_kcontrol_new wm8400_dapm_rxvoice_controls[] = {
-SOC_DAPM_SINGLE_TLV("LIN4/RXN", WM8400_INPUT_MIXER5, WM8400_LR4BVOL_SHIFT,
-			WM8400_LR4BVOL_MASK, 0, in_mix_tlv),
-SOC_DAPM_SINGLE_TLV("RIN4/RXP", WM8400_INPUT_MIXER6, WM8400_RL4BVOL_SHIFT,
-			WM8400_RL4BVOL_MASK, 0, in_mix_tlv),
-};
-
 /* LOMIX */
 static const struct snd_kcontrol_new wm8400_dapm_lomix_controls[] = {
 SOC_DAPM_SINGLE("LOMIX Right ADC Bypass Switch", WM8400_OUTPUT_MIXER1,
-- 
2.25.1

