Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE77D2F1C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644F785D;
	Mon, 23 Oct 2023 11:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644F785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698054987;
	bh=NbEnwE8a+KjhRgiB2luA34lgTX1W5wMgnCBJ6j8UFlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kq87camEA3sUKTADHoEs075Gh8BCVVe1QiPIY7NZtafC7bDWpjXRY94LL7dhNuALy
	 sb2fIL+K3Wb+19lyUPotx2yB6WD+11RfWdsIQjJW5DhJK6w7+Fiy4CDGnDsrfsu+4g
	 z+kf20qgeT9Ow7d2A49LlosZjePeTtFNxSb0xorY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89E06F8055B; Mon, 23 Oct 2023 11:54:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74926F804F3;
	Mon, 23 Oct 2023 11:54:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38CD5F80527; Mon, 23 Oct 2023 11:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 790F7F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790F7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wiH8HnEA
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32db8924201so2093892f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054875; x=1698659675;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=wiH8HnEA1+t142oV7mGf+geuc4/8jugAxY52BTb4hdz54KThSTwn+p+LXBs6kc1MxE
         0Dd8WNsrRHj4ug88UAmElx8R7QxhFwpf73fFFb7H6ixt/1UAxtVVN3KRhfXoqzwy/8UF
         /HyZpL6f8eDQSSI2DnskWArBcYhIQ2OU0Jdj4maAufD35qUCUDwgRUxR9T7Yq+8nNqKB
         g/sZJJP+6pE/Zq43iqcMHWkdeXoXkyHU/mMIsKgcyondogZCsRX4eM6WTSjfhuh6xgUn
         hdCbtt/rWwG6NV88K+lUe4u5q5m0dRh6YfNqknIJIPwU+OUTwq0A8P5e+ZdWAnZ8YLl0
         d47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054875; x=1698659675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=xFy8XowPp1OFTb2GrtcXCwC5jVDAYNFaMCON3NnEpPoKTIB8sQY61sr25tb7OFJMsO
         Jod+XIFrZp3ie8S+QzhiElrdOnXgR5+aTGpkLBL+AzhFecDXq2RRsUHi6Wzes/v4aC+F
         H7aiDDryYAUpHxUyuoezXHkIToemVw67eHy0D7n/OkemP3cuTmnm7Rzk16gS+dcg6J4V
         eh/XCii+to8iIuJ1boqEHkPSDr016nZJ5Y6zzuuxN2s1S62Cu3sykNY8E6meRYx0B92z
         gBLqgBu1sjNUB9BDULiLKKRR1ro7VhWrZA9l+bRb8PA7vBWDQPOsKMV3rfZs7wYPIXf7
         RpTQ==
X-Gm-Message-State: AOJu0YzmBNZMa7t4AqQgZZRmC5O0+WkN+62j8rRDRS6wTMD6ynTkgAUt
	Jt/zZnResF2yZ4D1mYcw2NaG7A==
X-Google-Smtp-Source: 
 AGHT+IEHt7MU0pVVH3QtAU35Dth6+VQAGLU4qZyA/p6jZNdd35Imw6TEqgJZWhxMs2mnHadLP+Eb6A==
X-Received: by 2002:adf:fc09:0:b0:323:10b8:543e with SMTP id
 i9-20020adffc09000000b0032310b8543emr5848249wrr.49.1698054875438;
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
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
Subject: [RFT PATCH 01/17] ASoC: codecs: 88pm860x: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:12 +0200
Message-Id: <20231023095428.166563-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HQ6NRFE4C37EOYICECDYRJCQNUMOZJRH
X-Message-ID-Hash: HQ6NRFE4C37EOYICECDYRJCQNUMOZJRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQ6NRFE4C37EOYICECDYRJCQNUMOZJRH/>
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
 sound/soc/codecs/88pm860x-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index d99b674d574b..be01f0928393 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -400,9 +400,9 @@ static int pm860x_dac_event(struct snd_soc_dapm_widget *w,
 	unsigned int dac = 0;
 	int data;
 
-	if (!strcmp(w->name, "Left DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Left DAC"))
 		dac = DAC_LEFT;
-	if (!strcmp(w->name, "Right DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Right DAC"))
 		dac = DAC_RIGHT;
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.34.1

