Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD657D2F3B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D0BE11;
	Mon, 23 Oct 2023 11:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D0BE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055063;
	bh=kOSnnEflpSYl+K7uyq8L7+y1wzQ+2f0TsYoSpUhE3uM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n7bPp679ZGs7bQh8eVU3Ocy7s8xvWhdLqvdx15jS3+z82Uvm35M8bCKRo07gRv2Ky
	 hekLgZEPxMPPjMLaCuPVBRzFWRJm/3ytZvphjPLApmCCQcXN5wbFdtHlapzYdkWAsY
	 xXqgU70pbS9K6fcPKIN3JKmRKsMdqT/VDulZEcVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95BDEF805CB; Mon, 23 Oct 2023 11:55:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99DCBF805C4;
	Mon, 23 Oct 2023 11:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 087A7F80578; Mon, 23 Oct 2023 11:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94FD4F8055A
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94FD4F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WhrmvDoD
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so4202005e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054886; x=1698659686;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=WhrmvDoDidLgSh6fTFwW6+EzKxYjI+xVWEN/7uaPXgKYIMUwbDioqf3ztd90btqfht
         kKHT/FU4fQRPQPnONY1/QIYlWksRz/Lu97BV/8736vs+yN2IrisfuQEmlis16zMD9IsD
         BoYTj+GsUBrm0dJPRG4eTMzSP/wF1vbBd8hsUSRXvlFrEwDtqylHVOFGXmgfO3ljm9tD
         +kAwXdVayApMeqBOlXzG3QoveE8VdtXU//NSAYJIh/yzSqUddwYTJtG2eyuN1DEcCMeb
         nNRxHnDA9yt4PecBrdnqHCijDAs6002tFHs6ksD4rPBtHRt2XTJpFfsm84gy4ebxBhhp
         hb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054886; x=1698659686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=kjP+1GH21iwENXs63nhp3+XSr4qBtI9LLYLBGoE8nNxpCvleAUmzVEHT1+eUwEArKY
         d17I5qYt331gXUWBZCOxpkijHyabfsKyRhGE8WxYG7Bc2jmHUfDlnxujTKOTGSbyl8cA
         kwDdHQ9nKlaXPT1XWNgUNmXQBVxucx/BEH9RZlLGE43k64sABgCbQBxVCMDaw8WQ1Ei/
         Iq2pqCdoYrnm3OA/rrHCOgIQCtnKBLeSiGcL6SAK1w9LNTU5o1ttnj1ZnOiWJJUxRzVE
         2cc9/PM+SLTNYfxXP5VNL39nIxGXBjuf1J+NUkYaWWNBNzpT7T0EBeUoHrimR2bu4nUq
         +OfA==
X-Gm-Message-State: AOJu0Yz91Hj7Atehoa9S9rEy2aDgHAftO24+8OhY3yTk7mQs74oBq0gE
	5MwIwwjpZ38QgHJMZYdWVuWLHg==
X-Google-Smtp-Source: 
 AGHT+IGVnDVUzhqtZG2Rxtx8SwcXnzeMCoNHkuKGJvqRY3jD0nxvOcWU8+AB175lzXv5OfVrm4BxmA==
X-Received: by 2002:ac2:4430:0:b0:500:b7ed:105a with SMTP id
 w16-20020ac24430000000b00500b7ed105amr6312430lfl.29.1698054886439;
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
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
Subject: [RFT PATCH 06/17] ASoC: codecs: rt5682s: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:17 +0200
Message-Id: <20231023095428.166563-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QW4MDWBE3ULGQK7UJ7UOLT6R6SUASMX2
X-Message-ID-Hash: QW4MDWBE3ULGQK7UJ7UOLT6R6SUASMX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW4MDWBE3ULGQK7UJ7UOLT6R6SUASMX2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 68ac5ea50396..c261c33c4be7 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1323,9 +1323,9 @@ static int set_i2s_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		on = 1;
 
-	if (!strcmp(w->name, "I2S1") && !rt5682s->wclk_enabled)
+	if (!snd_soc_dapm_widget_name_cmp(w, "I2S1") && !rt5682s->wclk_enabled)
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF1, on);
-	else if (!strcmp(w->name, "I2S2"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "I2S2"))
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF2, on);
 
 	return 0;
-- 
2.34.1

