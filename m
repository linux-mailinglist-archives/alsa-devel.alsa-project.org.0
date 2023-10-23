Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E77D2F37
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6B3844;
	Mon, 23 Oct 2023 11:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6B3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055037;
	bh=mt3YCmb8lPCu1uqF1GwtVtpW3ERnj1j1XEFZctgKCSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TpcLmQfWOxgk4qjvTW7Sbtjr8T4+oIpTsVJED5DO23I6tGrZC5NtwTUEi462oSLF8
	 1wHCNYkp25M6CGh+yLOKuXjhtgTgSRmUNAE6BOt78X6FC5Efplpd0OLpo6ZpG3tV04
	 qkBGyVqoKcbzQJQQSC6MuEEn0ncplDfC6jgbvkcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FF25F805B4; Mon, 23 Oct 2023 11:54:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 221D5F80571;
	Mon, 23 Oct 2023 11:54:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0971F8055A; Mon, 23 Oct 2023 11:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09A0BF8032D
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09A0BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fAqE4lFf
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32db8f8441eso2495982f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054882; x=1698659682;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=fAqE4lFfvEd4AGg21XFRQlT6QBJckpZHovW31VlhQRD+L9paNxRZEDcwYpWzLuIXQO
         /A/jJKfmgFd1SmuoCALJHKo/obci9eSQYP7DgFK+lKnyAQYlgqO12QnDvC4WGJdXS1Cr
         S7izAkkhyRLgctrjOOuX8fEGTWFehgeKDn8ql8GbPvW7JN+IMNjXva1xMnTQPzHwoBug
         OWGpVTLKwww2TUvkd4b6tbH3fqcnmSCiei6/nzqrV8hGx05HGcdhpFNk+bmZKBMCNd/9
         qEwYA50ihfH8J7EzZO6Gh8rG/iQJxmNaJf1e8r4z+3lOLjxw7Y460frI9r56FQF85nCx
         nGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054882; x=1698659682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=iKlzCXKHd9Vx3vkJrKaxe5WiuOFqhxPoFXb0EiuqHDe2mE9ttscp0/tASX/wui4LQK
         aykYk6ifKmI26Nja4QYsfmv80mJEcuPUAW49r/w9WXG5pbCkWCifV4IH2vNcPmpAu5fq
         inpkgr790ZaHa4mzUUO+I0GFxo8+l9h9L/rMEpkZtFJ3yRsJNhNi5jd2iSVIAYru/6pY
         laorXijAYpzZJOOwEatOHd9UMsZXuN6st7qNUHDaRy94CQK1Ij0PU2z2rnX+37JQrkii
         +Ud6ALxEf/WAomZr/MQe46CHB9eAV1pIl1IA2iNME2sHcET95prqd2p6T9cOZK/1tjG+
         xhVw==
X-Gm-Message-State: AOJu0YzQ+esL9hKUzQity2VZ4Fueu/Q/zZhsV9GsNWmLBpV7duHvoWai
	uqWt+FQZ8jE73bFTtt1HLKWnDDKc4EsVugW0FJI=
X-Google-Smtp-Source: 
 AGHT+IG3Sib29NO6K06c5CyIqf4YSqLzbtzzhUEleL/6uhtgyT7dZmxfyYTlGNAw3kPpeYYlW/TKCQ==
X-Received: by 2002:a05:6000:152:b0:31f:8999:c409 with SMTP id
 r18-20020a056000015200b0031f8999c409mr6421464wrx.66.1698054882090;
        Mon, 23 Oct 2023 02:54:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/17] ASoC: codecs: lpass-rx-macro: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:15 +0200
Message-Id: <20231023095428.166563-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q2XQ3ZC7FI7YN2U7LGXCXAKUZOOHPABU
X-Message-ID-Hash: Q2XQ3ZC7FI7YN2U7LGXCXAKUZOOHPABU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2XQ3ZC7FI7YN2U7LGXCXAKUZOOHPABU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 29197d34ec09..f35187d69cac 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2906,14 +2906,14 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG4);
-	if (!(strcmp(w->name, "RX MIX TX0 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX0 MUX")))
 		ec_tx = ((val & 0xf0) >> 0x4) - 1;
-	else if (!(strcmp(w->name, "RX MIX TX1 MUX")))
+	else if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX1 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG5);
-	if (!(strcmp(w->name, "RX MIX TX2 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX2 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	if (ec_tx < 0 || (ec_tx >= RX_MACRO_EC_MUX_MAX)) {
-- 
2.34.1

