Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD06886B5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:38:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1B9EBE;
	Thu,  2 Feb 2023 19:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1B9EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363115;
	bh=jPhJ0w/caLAg+lwWjFwGWLSpTe+WTiUVxsBlNix8P8c=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F9K1epXQxZ+1fRImWusFgWAuNHKptUUrL9DwDWDQoVVbYBslG/ZVGuXuZJRXqEHFq
	 vQvRXKYYlugpCONzN9TzIumHeqZBFjAIvT1ZPsQ+mlArHbDNygEowF9tBsmKoRICWt
	 KlvZfc+crKcrnIIDMCO7jLQXpOuqFgaKOHsKdMos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93CC2F80271;
	Thu,  2 Feb 2023 19:37:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5104F804E0; Thu,  2 Feb 2023 19:37:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18FFCF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18FFCF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=IbFgd4TJ
Received: by mail-wr1-x435.google.com with SMTP id q5so2605795wrv.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H85BNtbicOdZEb38uhjtGBMxJZW5JkXIotuHsx7Jfnk=;
 b=IbFgd4TJ33+H4SaOwRyEWu6cWJiQiPeX9lhQApCcR7ems5iUP2ftxi1ogXy60RDAH3
 EQB5FEo0lzHU016yPfz3Gl0swVHOUsKVKlXteWQI40qYhCT6YWBM/ZZtLck1TpU+HdJF
 oiUWrOki6KugGbsRQ0bo0aUuADU2QZEr3VUD58M8KhGjy5GPcDjaHUFnxEFJuyrDEqZh
 rL6IHIAKB6OGmXwnjw1Qc7KXXM4YXNuKQzn6x1yT52ZA+Temm2XxFL+dxOV9dacF22Y8
 EIsPjJlVBSVT4QNR/qfs5kNDYvzjK8dcFTjsZ5ThvMYirB+641tpIWORaVrYJDGGjwiN
 bGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H85BNtbicOdZEb38uhjtGBMxJZW5JkXIotuHsx7Jfnk=;
 b=erS5WR/FYXVNA0UlPJYe8Cu+LE0FwS5IqXD2MTd3xDDdUOK8SwFfI2UAH4J7VYbSK2
 eBo2jknCyCzbG4l2a2ypCZY/RjUji2Mzvlvr0DSA6y54Hbrjba7aMmmeQIdoWzx8V/wO
 maLmwgcp3tvPci+Y1bszDwiAUDFWxTXNH6rUomizuH1wJB1lxIPOHT1l3wepYVwcxlHO
 K6mo6pmEwWYs8IlX5QwjYxd7qP9h5c6Q4EFV9gC2nHTGtmwAnvS6YVXBUt3uv5sOAHXh
 tE9PUz7bPV/ekfKguI86Syv3L1JaW1c9he8clYGaGhx37wL1iNdv2raZm6k2pA/MuaLa
 A+wg==
X-Gm-Message-State: AO0yUKWuwf/xlZz/OqhELAdc6DvgSRjyOcvlFUonffDpxKKBGdSbNtje
 2cLUwAI61LGAHn7BHptBaYT/hg==
X-Google-Smtp-Source: AK7set+VKQzzzrAghb4KlHvOyHw5gRfGxFCvlSyBRvRuD7rBtzhM9j1p4cLIk2Ze/JvU6OPDnwyIHw==
X-Received: by 2002:a05:6000:188f:b0:2bf:bd69:234b with SMTP id
 a15-20020a056000188f00b002bfbd69234bmr8166688wri.32.1675363043086; 
 Thu, 02 Feb 2023 10:37:23 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/9] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Thu,  2 Feb 2023 19:36:44 +0100
Message-Id: <20230202183653.486216-1-jbrunet@baylibre.com>
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

Jerome Brunet (9):
  ASoC: dt-bindings: create component common schema
  ASoC: dt-bindings: meson: fix gx-card codec node regex
  ASoC: dt-bindings: meson: convert axg tdm interface to schema
  ASoC: dt-bindings: meson: convert axg tdm formatters to schema
  ASoC: dt-bindings: meson: convert axg pdm to schema
  ASoC: dt-bindings: meson: convert axg fifo to schema
  ASoC: dt-bindings: meson: convert axg spdif input to schema
  ASoC: dt-bindings: meson: convert axg spdif output to schema
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 116 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  86 +++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 182 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  90 +++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  83 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  90 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  59 ++++++
 .../bindings/sound/amlogic,gx-sound-card.yaml |   2 +-
 .../bindings/sound/component-common.yaml      |  21 ++
 .../devicetree/bindings/sound/dai-common.yaml |  11 +-
 17 files changed, 731 insertions(+), 306 deletions(-)
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
 create mode 100644 Documentation/devicetree/bindings/sound/component-common.yaml

-- 
2.39.0

