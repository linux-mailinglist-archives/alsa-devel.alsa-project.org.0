Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943176920C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57ADC82B;
	Mon, 31 Jul 2023 11:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57ADC82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796655;
	bh=9ln7pdZlK75IyVn7AJylDrsXhRxK3CfcNNSZ+7BgHOg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iiZSwCZMHhIrXa2OgP7OrvXvu1y8I/absse+36lQCC9+2T5yWd1KfprXCVFkgRegN
	 wJpdLBZLw9j4KGRMMm18cFmmxtoHOTkrkdaIbUlkpw5OjIO9+N+wMO2wY/sH119aqf
	 GCihOdYjZMM2MGjE5Waxj/7Mj47mO1GmIaGr/BQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA805F8053B; Mon, 31 Jul 2023 11:43:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7036DF8016D;
	Mon, 31 Jul 2023 11:43:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2196F8016D; Mon, 31 Jul 2023 11:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5552BF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5552BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JRaT/+kf
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe28f92d8eso2275774e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796592; x=1691401392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdDSWpR2PwAaVc6xrPLUrP7cY8hR/WC31iRh9xFaQkU=;
        b=JRaT/+kfL9uh8R15DPTFuDwkvjklHTznvty/KmRSZmAoyGr1+CR9ocuL4kvmw/UjGk
         DJBS0rdn4ScZW5MInEzcVFhbv9GKdTDpJaBzNw0+/WzGByly5NW1xh/6u8bLsw9mtejZ
         +rpLlG+09SagscOFEVnloXPJDybDA5EO57eet55qG0VZVuYHDpeI8C60dzhPYcWcUpSX
         uW2370rK4gNIz6U2gPWBqCl5MRXooZ9CoM7efLE+ynZNjnJlunqSxScERrES7yClxhNT
         37irKwNHH3pa2PC1EXEellvCP2cqF/V5/7TLqTXj/ZTgIkZtTQj025MlucYHe8QE+A1G
         KT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796592; x=1691401392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdDSWpR2PwAaVc6xrPLUrP7cY8hR/WC31iRh9xFaQkU=;
        b=BBMEJu5KEAdB5RB7aqMIzG/k3caL96QtrP69h4Z+YuqKIuztNKMq6MOi8BbFNHnarR
         bT5CaDHdD+l3aNYxgG4Orb2ZSvsx1fJb9sKBsAncn1cKK+WkAAgRQfCvg0zwr/uhqd3n
         LTYtk67pGGQTOzly7XnzMqeI4sKWyKOLcIynWCG25ZetJOACsxc0h4GJi2AWutegqxhD
         SG2XVfPfQvCVPLxCzfKqaaASIfQ3QdqLy+IX8iboA2Cnas0AysZux7ziqH+BJDYxsvk4
         57Bxp6OHW7TJsi/vozo//2fuQbmHPDQg642H9yreePeqO+4txX7JOtxqTydeixGTKhV6
         PI9A==
X-Gm-Message-State: ABy/qLb4MPUmm7AbwiycXoPddhmksuBLUiM0A2rSjuC8hjm1mzf9o8Hg
	0QS1LUCsYjF3hG+uHqQ1MJCi7w==
X-Google-Smtp-Source: 
 APBJJlGki+SUDXYM8c3BbgK1LnBv0fjF2tGeoHiwrwf2124G5mJuEpJE4OQC/hLu1Gd0rntkBAJgrQ==
X-Received: by 2002:a05:6512:1c5:b0:4f8:766f:8dc3 with SMTP id
 f5-20020a05651201c500b004f8766f8dc3mr4904749lfp.32.1690796591857;
        Mon, 31 Jul 2023 02:43:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] ASoC: dt-bindings: Add sound-card-common.yaml
Date: Mon, 31 Jul 2023 11:42:51 +0200
Message-Id: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C5ZFHMCV5JJWBWZFBDIDUMOVNONK6QEP
X-Message-ID-Hash: C5ZFHMCV5JJWBWZFBDIDUMOVNONK6QEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5ZFHMCV5JJWBWZFBDIDUMOVNONK6QEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Almost every board machine / sound cards has "audio-routing" and "model"
properties, so we can make things simpler by introducing one common
binding.  It is also expected that given property has only one definition.

If the patchset looks good, then the next steps will be:
1. Convert more vendor audio-routing properties to audio-routing,
2. Add dai-links children to common binding.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  ASoC: dt-bindings: amlogic,gx-sound-card: correct maxItems constraints
  ASoC: dt-bindings: Add common sound card properties
  ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
  ASoC: dt-bindings: samsung,aries-wm8994: use common sound card
  ASoC: dt-bindings: samsung,midas-audio: use common sound card
  ASoC: dt-bindings: samsung,odroid: use common sound card
  ASoC: dt-bindings: samsung,tm2: use common sound card
  ASoC: samsung: odroid: use of_property_present to check for property
  ASoC: samsung: aries_wm8994: parse audio-routing
  ASoC: samsung: midas_wm1811: parse audio-routing
  ASoC: samsung: odroid: parse audio-routing
  ASoC: samsung: tm2_wm5110: parse audio-routing

 .../sound/amlogic,axg-sound-card.yaml         | 15 +++--------
 .../bindings/sound/amlogic,gx-sound-card.yaml | 16 +++++------
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 17 +++---------
 .../bindings/sound/google,sc7180-trogdor.yaml | 17 +++---------
 .../sound/google,sc7280-herobrine.yaml        | 17 +++---------
 .../bindings/sound/imx-audio-card.yaml        | 18 +++----------
 .../sound/mediatek,mt8188-mt6359.yaml         | 17 +++++-------
 .../bindings/sound/samsung,aries-wm8994.yaml  | 16 +++++------
 .../bindings/sound/samsung,midas-audio.yaml   | 16 +++++------
 .../bindings/sound/samsung,odroid.yaml        | 14 +++++-----
 .../bindings/sound/samsung,tm2.yaml           | 16 +++++------
 .../bindings/sound/sound-card-common.yaml     | 27 +++++++++++++++++++
 sound/soc/samsung/aries_wm8994.c              | 10 ++++---
 sound/soc/samsung/midas_wm1811.c              | 10 ++++---
 sound/soc/samsung/odroid.c                    | 15 ++++++-----
 sound/soc/samsung/tm2_wm5110.c                | 10 ++++---
 16 files changed, 119 insertions(+), 132 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml

-- 
2.34.1

