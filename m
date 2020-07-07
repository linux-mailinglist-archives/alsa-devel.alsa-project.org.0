Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52F216A64
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44AFB1607;
	Tue,  7 Jul 2020 12:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44AFB1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118086;
	bh=zcBHyOdMd9eyNgd07yzOrHYnqXgNb80QTPxsx8RCw88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iR003FSa5MreenzEhcnA8F3dEXvqwO5/c7sg/nqBReLFmWbRAkMoyqSzeysEkTwbl
	 8jHrJC/c3Ro8qPw4kD25vOJx+OFgbqnNaY7OQmH+l6RVPmnKvA9z9/hrMTb77bIFVn
	 aiFvlYSYqybw46l+rC+5Ee3nCiGme8n5YbO+Aq4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D07F803DE;
	Tue,  7 Jul 2020 12:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E54FF80321; Tue,  7 Jul 2020 12:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32589F80332
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32589F80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="C0uhEvrw"
Received: by mail-wm1-x342.google.com with SMTP id w3so33433047wmi.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkgQ5GKpYIPow7Og+7iz9PKlHm4fJKjWVXLF1XFMGh8=;
 b=C0uhEvrw6Cb6IHyeUQxsYIXDlt3MpDWf+csmiOXGn8Tz+dxr65xSfiRAXDv0HcY7VA
 NvpMy1QsPzCkYFLQA/o8gvCmNN5LUa6IzlRX+YurOnzL/MvvpNS1KRUxqYpOgpLfdjE1
 S2OtbToPGQBg8bUH8J1mfVOMyo4577J/aIDCuTAdvoPMQOHr7bqo4ZA6P7mvSbmnTivp
 QG0NtI5BiM4i5cVDFeBAKf5Ou9B19WCz8jkZYmqAkbgdhl5KYNI6mtDzea4vd0V4DJLI
 uLs+F14Mfcp16TcdvjfEn3NvNcwnkFxvfenN1oYO0taaEW1PJM+hY9kvVQ5vBZcyvZ0W
 JOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkgQ5GKpYIPow7Og+7iz9PKlHm4fJKjWVXLF1XFMGh8=;
 b=ig79k0oM9gEl1ejrM1oRmrKdo9701R2eFyJdRp/GLYYN3bdaS2DiPdGf4EdwMn57O5
 4Rk7IMgk6D4dA8QoWyfQ6U4doV2cTfS3MvgHqXAue8WPe4S9qIbTheAiPMXxR0HMPQck
 g6u8tAEqUSSACvdSevYHo96njaqXtQ/aqYgg/9tVw42RasPwu5aj9xuwCWvS2+PmY9q0
 GxOkrGbByw3h+R82s5mQwVjUbCl3ll1sllQ3ZfQ/KcB8EDij9SmEXPIak7HfBZMprCVh
 XO7iAhdUoS9JkqvOtxkI6nZkd6qvBVhB4Cxj6gwO+dLVKXzmvLxTCl98rxU9laGGL0YZ
 9yKw==
X-Gm-Message-State: AOAM531UitAJXBBCH0MlhGU3Zzx1CTJB12IBBK2n6z9RSp/U/dMpqZ+N
 tkf0hoU3+ocJmxdBisMpTF9GmA==
X-Google-Smtp-Source: ABdhPJyfry+2eTSCxNFY+4n4PKf/X6rv1JuST/nCviW5AF3KdytzTgNqbLpj9UGcP7OiMG0Dy8C7Tg==
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr3624996wmh.106.1594117042719; 
 Tue, 07 Jul 2020 03:17:22 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 28/28] ASoC: codecs: wm8400: Remove a bunch of unused variables
Date: Tue,  7 Jul 2020 11:16:42 +0100
Message-Id: <20200707101642.1747944-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
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

