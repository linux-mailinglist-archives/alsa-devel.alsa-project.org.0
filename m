Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E217D2F42
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:58:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14235DEC;
	Mon, 23 Oct 2023 11:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14235DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055109;
	bh=xSH/xpyVPhStwFe24/u3gzVA3r1kdQymL5j+3JegQnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+OTdtCgVZn+3MqPmYuk6MGV8T8mrO7+UTgXSp0WqXJIhsUaWUHG2V/zVJ5p4kdqd
	 9GVuLEOXdBA6jwOQWLGXvCWq20hUr71Ln8kt+k/a6EGhtFIdl4rc3OWVcjyW4IRAou
	 wHcuEP8OY38BsLNS8WAhZ+CVEn/NzMPPH16FIuts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D8AF805EB; Mon, 23 Oct 2023 11:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AA9F80134;
	Mon, 23 Oct 2023 11:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED7AF805BD; Mon, 23 Oct 2023 11:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C9EDF80587
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C9EDF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Lqodfggx
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32dbbf3c782so2378930f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054893; x=1698659693;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=Lqodfggxr/xB66DHttvcSxfk/KA2Vagc/IR9grABE923EJfl/wSTbiFHa5/C/kat1E
         m6xNZxLk3E7De0NI7v/++TSRNsJCPJAihcuxySgAIR3vrK53pC0A0cafWQEU1raY4MDb
         P68Ej0WLEXjT+1SI2BgdKbbCBZsSCvDe6Mg+k4a4LuXzQGB21wHiDVcTXEXkXISe8Im8
         A23DJWSUzi+XE28ql/1dxUe0H2I5grM5uVp5mCPuFzNk3qK+MrbIWdzWVvN6WVM5lugq
         P0J68Pw74SyHDUAEgJZCsGa/YAy6N9oKqKYtNRPyqH2WBduuAwtchbD12vZ9cciOeB4J
         rqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054893; x=1698659693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=kJAHWD74IUhStqJhgpI6vX+G3hD6geEza4mWAiuAiVg0F9yO3xupFBcYCO43k1z6KO
         G0svBMOE+D9oykHuxuxI2ZiQcQiwYevK+an8WMqunOOcIwad9EV2G7TTdn6KDBGWllBX
         kCOtcHRtrwujxKLrSQxvX0kopdAPCdiOtEh2nFY41eCxbvfiv7jNzwzNM7IgLSyFXkhu
         cNNghUNFtnPksD0N7OMp38KLYTEfAt6qPOwUuRchaLIv8+YMvInifiJIRTvgMyK+yynZ
         ihaSHw39W0xtdKLEwIEB6eVCABEmiBLKfJxQiHRGu09LhhcGovYsxOVUXLA9FvYRgP+S
         4cXw==
X-Gm-Message-State: AOJu0YxcfZMsaXiUDVDwauDyYJGQEtIHKZ/3tuGu5XGU5k+HOrAzVhxd
	rh/T6jdWL1cRT6O6MeUBna5H/w==
X-Google-Smtp-Source: 
 AGHT+IHTc2UW0PcRRtRg3EJmwXBDKZ0rRGICIe4tZ3tRk+SG6RlHUvnvHSIX5664+drOKrq+nZy8rg==
X-Received: by 2002:a05:6000:92c:b0:32d:81f9:7712 with SMTP id
 cx12-20020a056000092c00b0032d81f97712mr8264026wrb.20.1698054893380;
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
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
Subject: [RFT PATCH 09/17] ASoC: codecs: wm8962: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:20 +0200
Message-Id: <20231023095428.166563-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6QZUVNJZKYJAEOTO3LZ6YGNESXRXC5I
X-Message-ID-Hash: Q6QZUVNJZKYJAEOTO3LZ6YGNESXRXC5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6QZUVNJZKYJAEOTO3LZ6YGNESXRXC5I/>
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
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 83ce5dbecc45..fb90ae6a8a34 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1854,10 +1854,10 @@ static int tp_event(struct snd_soc_dapm_widget *w,
 
 	reg = WM8962_ADDITIONAL_CONTROL_4;
 
-	if (!strcmp(w->name, "TEMP_HP")) {
+	if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_HP")) {
 		mask = WM8962_TEMP_ENA_HP_MASK;
 		val = WM8962_TEMP_ENA_HP;
-	} else if (!strcmp(w->name, "TEMP_SPK")) {
+	} else if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_SPK")) {
 		mask = WM8962_TEMP_ENA_SPK_MASK;
 		val = WM8962_TEMP_ENA_SPK;
 	} else {
-- 
2.34.1

