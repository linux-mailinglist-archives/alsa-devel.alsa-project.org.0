Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E8769D47
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DD096C0;
	Mon, 31 Jul 2023 18:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DD096C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822590;
	bh=Op9cMqyP0N9fnTxXXmF0x5RG7F8UQsd6/mwWqa5XzG8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K5LBJ6CmjVDakKZEO01rK/LcrAxj1ccfUXxjixQqJ3q2GLhGlZSoWy6yvI23jgJXT
	 FFzP9ieRiW5FREq5/cclLnrijBJY0rhijJHPiBOtdUPrCEcAW2E5qj/5fZoLxIvW3G
	 Os/OCQXbycWEtpdVN4ce7KR3u3kmn3CtWfu8sIvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C46D8F8053B; Mon, 31 Jul 2023 18:55:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C96F80163;
	Mon, 31 Jul 2023 18:55:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C34F8016D; Mon, 31 Jul 2023 18:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5217DF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5217DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Rw05xMge
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so6493780e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690822528; x=1691427328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpT8nlEbctAiS0l82doDIjU49cpafv/Kh1hBxCyIFMo=;
        b=Rw05xMgeodHctFTvKIC6laouQfNYMrrCy85KAbY3jUEwE/zAzGSE7inbQ1dCSG3OvU
         nJ6lmmm58KV+hhoYyFvzr/6gVyymsQPXPkO8eBpKoGGitA6MHsDcLVT6ile8EKsu5wAc
         Ux7AxuAPnCOrxOoQRMg4BtENAtstKNE2jWV887AvuHdhi94vHi+gLKHvJRGYjF/JKFm+
         p5TvphCnkP8CGtAiQgSb5N+D5Llrz5PrfGODaO14DFc2R8f/SDIkTqy8kq0SD+qFifqC
         ciK2YXicb6C0aTPVn3pECwELMaVncon34fL8AoOsKI2g/0tCmXXKFTs/1sLMjtOqwNq9
         vUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690822528; x=1691427328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpT8nlEbctAiS0l82doDIjU49cpafv/Kh1hBxCyIFMo=;
        b=VaXPW+0xr1t2/6sORz9Ao81go+qyJVNplG7WD/5wN+93CQqiYNNR7jyC5g7c0GSSuI
         T6yPiH8gNmYSN+ThA/qcZgp1mINki8BXjs4/4EEdDo/yH9pWmYqRemdXcuUyVjkCY6HO
         BhOsjL5v+Rj/bZujUb+yL+sKEn6MiY2spUIVHYiqLNbDBhFfsTNhGfC6pd+GwqFajA6z
         BEA7n/A4krXlZ1WyilzIMG0l+NBc7DNlJmkwF1PhBFhRVbhBuG20bGat4AWuxOphn3/P
         /TJLMZJqp/7Y1RYpE4JaHXQrIBUhGubnL6SOx4Ly9QogV/HgQ1Rl3Fy7WbX8tSrln/H2
         LFXw==
X-Gm-Message-State: ABy/qLbDlGo7S/l+aQAYRwfnPgPW9rjiUGurLw5janZS2lcDuxylTwHa
	ZvAXaTVdgeFv9aFvhkH2LgLmtQ==
X-Google-Smtp-Source: 
 APBJJlEH5+oK+Q7hPPqgktOZNUuPZU1PTqLvEGDjNa8eYUYojlkbc2qdz2IzV3gGcoZzoec2GACWHQ==
X-Received: by 2002:ac2:5e6b:0:b0:4f8:5905:8e0a with SMTP id
 a11-20020ac25e6b000000b004f859058e0amr240314lfr.6.1690822527751;
        Mon, 31 Jul 2023 09:55:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a170906c30400b009926928d486sm6374444ejz.35.2023.07.31.09.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 09:55:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: rx-macro: Enable RX path clock to match
 POST_PMD
Date: Mon, 31 Jul 2023 18:55:22 +0200
Message-Id: <20230731165522.328301-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V4H4AMKDYYG6KWZT4TUHJXU5QXOPL4A6
X-Message-ID-Hash: V4H4AMKDYYG6KWZT4TUHJXU5QXOPL4A6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4H4AMKDYYG6KWZT4TUHJXU5QXOPL4A6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver disables RX path clock in SND_SOC_DAPM_POST_PMD of
rx_macro_enable_interp_clk() and rx_macro_enable_mix_path().  Make the
code symmetrical by enabling the clock in SND_SOC_DAPM_PRE_PMU.  This
also matches downstream Qualcomm driver for Qualcomm SM8550 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 685ca95ef4a9..a758ef4f575a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2529,6 +2529,9 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 						      CDC_RX_PATH_PGA_MUTE_MASK, 0x1);
 			snd_soc_component_write_field(component, dsm_reg,
 						      CDC_RX_RXn_DSM_CLK_EN_MASK, 0x1);
+			snd_soc_component_update_bits(component, main_reg,
+						      CDC_RX_PATH_CLK_EN_MASK,
+						      CDC_RX_PATH_CLK_ENABLE);
 			snd_soc_component_update_bits(component, rx_cfg2_reg,
 					CDC_RX_RXn_HPF_CUT_FREQ_MASK, 0x03);
 			rx_macro_load_compander_coeff(component, rx, interp_idx, event);
@@ -2595,6 +2598,9 @@ static int rx_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		rx_macro_enable_interp_clk(component, event, w->shift);
+		snd_soc_component_update_bits(component, mix_reg,
+					      CDC_RX_RXn_MIX_CLK_EN_MASK,
+					      CDC_RX_RXn_MIX_CLK_EN_MASK);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
 		snd_soc_component_write(component, gain_reg,
-- 
2.34.1

