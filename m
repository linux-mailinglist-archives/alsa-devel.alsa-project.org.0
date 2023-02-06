Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026968C1B6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:36:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD7C1DB;
	Mon,  6 Feb 2023 16:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD7C1DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697765;
	bh=kzxxfG/2ZJJtgZopSYbS2ZLSlwRWvhBL9WFBfPx8yVU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UrVLyecQNYT0Cf6+KL1nm8ocqSgLWKPyPJX2qNmocYBNrAJSCmaWjIIDP1bucXaEo
	 TgjdpIIYzv8o43loMSpwegWsPI/JXedt/Tf1zIPOc3dtwuynq/oGoj46+0GziKHgwI
	 HWnBZ26JWztFkmF12C3J2X4nx2VUvTZFTi/mzlyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A230EF80539;
	Mon,  6 Feb 2023 16:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE029F80537; Mon,  6 Feb 2023 16:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E0F8F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E0F8F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=EmRe6Ocl
Received: by mail-wr1-x433.google.com with SMTP id d14so10744654wrr.9
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pmo77UKoMzXJKQUoQ1g2vDSwLCWdCS5ldkpiJoejADo=;
 b=EmRe6OclOanTEHjba9UzNYrndAHNwQl+yKbKfLh/5PMne20zgrSKN1FV49IGkc5iz6
 qR2HJl8y5sGzInCMlnrLmSn6wxJTfbZImIPB7qhNUxD0iJJmSKruPrjjpOBAwqUa+HtM
 YMix0G2KJDeK8vu/BIOnWLeNUcBDMW5ZXiczIDR3hOOknTXjG26VoLur/VfHALQlba9G
 kKzcVKRb90kC2bM328TYUdLGkaVD62IPETxEjSa8RwhdDf6pOFSMiY7bLpCH9RpMP/Cr
 w4GySQt+OhjaEHNgUFmiW6DDSGGxgXLTleAsZ7K7N6vkKErW8E7qmBCftHw20hc9umjL
 ZtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pmo77UKoMzXJKQUoQ1g2vDSwLCWdCS5ldkpiJoejADo=;
 b=gmZbFj8dL0qIU0nCGy6SxENDk+ZfiwdelJ0dNmbqaR5KL1cDpVhCn5RzJPUfIzVUxs
 fL10rRWH6aLGex69emqXeSOHV/OGh22ydZSxdmCmsmJ5k3YldXYrRqBVGl8OK+V7Fg0a
 fFnl0Z3cFO4dA9vNFoalr5tTGKbq2Sud5uHG7amYLb4AjrLPWKUmCqAH75Cg68MvQWFM
 FWYdi08r8wNrUPZIaQCCX3iMvpsw96CpiEqRfzBmEfbVuSTpC59B6gmbzdlIfear8lW3
 PW5UlJEpY5W+ArDPZkEMIPZyvFkusv6oEPwfDMkkJbypQG3HtJhLFAKGx6t9Ggmwju8X
 I4Dw==
X-Gm-Message-State: AO0yUKU7CzE1iP24tnWZEUn/ART/D9oFhxnShhOQprjynIT3iYLmv1RF
 /HmcHfumCNBKneeJubd8JQpUCA==
X-Google-Smtp-Source: AK7set8VgB8x+u2fKo/xUB5QQ/nIAphdD6XyVN1SVaEXvN+z54+kI6GdvhBPc7hl+Iv0AoY2gWQUMQ==
X-Received: by 2002:a05:6000:14c:b0:2c3:dceb:4743 with SMTP id
 r12-20020a056000014c00b002c3dceb4743mr62208wrx.57.1675697697416; 
 Mon, 06 Feb 2023 07:34:57 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:34:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Mon,  6 Feb 2023 16:34:42 +0100
Message-Id: <20230206153449.596326-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert AXG audio dt-binding documentation to schema

Changes since v1:
* Drop 2 patches applied with v1
* Drop node name patterns
* Fix examples indentation
* Yaml fixups requested by Krzysztof

Jerome Brunet (7):
  ASoC: dt-bindings: meson: convert axg tdm interface to schema
  ASoC: dt-bindings: meson: convert axg tdm formatters to schema
  ASoC: dt-bindings: meson: convert axg pdm to schema
  ASoC: dt-bindings: meson: convert axg fifo to schema
  ASoC: dt-bindings: meson: convert axg spdif input to schema
  ASoC: dt-bindings: meson: convert axg spdif output to schema
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 112 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  82 ++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  86 ++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  79 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  88 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  55 ++++++
 14 files changed, 685 insertions(+), 297 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

-- 
2.39.0

