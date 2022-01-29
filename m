Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3343E4A2F62
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22BE173E;
	Sat, 29 Jan 2022 13:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22BE173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459112;
	bh=SLQNxvcaH2GZMF2JAgDmOpIBFKT8IgZzjgP0ttzRr9Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lRyltlzVEV5g0T1FeR4LkQqfVQxTzS/RJ/QHpqiod6a91efa2e/8kWNLh2bAVrCbn
	 Gb5NmxN2JHXCbQomL5U8helRaAzehUjqEol5koqQGNDL/n8wXUiZCMKt+HFR+l3VVX
	 GCxE/HNAb/Z6ZrqTFZBm04GWxfSpjpOlYjlk6NiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 235B3F801F7;
	Sat, 29 Jan 2022 13:24:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D235F801F7; Sat, 29 Jan 2022 13:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F12E4F800CE
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12E4F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="VZhSXu9v"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C76623F1C6
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459039;
 bh=x4o0tadweuj23sLkh9uK/49Ckg22Ago7xB3yd+9McbM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=VZhSXu9vwBHUaIhkfD0+K9eABZ0anng0dYAXXKmyh+QfNaw6/DPM3ixAf4eK4Y/gE
 4IbsKPDMu5nE0hCUmt1HCMkyZuYGeikFGHpbFXgwBPan3gZBppbPBqEySwIwM8sK7/
 iJ7Z2aZy2alH+Db+HXbXaZtkCxvzT4GKzOy5L9cMV8C5ozKn2nm20Nl3J6XHAdNv/u
 vkDUOioNRQESfUvhPrCMB9+KgbiADRVQQtp9TjEYLRWWmt/2aeCI+ZoytzkMaT53Ny
 s/6dynzOlq6GWY0PejcdZbhAdoXVzSGkI/+Pc1ezIAz6+7PIWA2IVMG42aXw8N/43S
 jsMwbVA/KCGkA==
Received: by mail-wr1-f69.google.com with SMTP id
 g8-20020adfa488000000b001d8e6467fe8so2963905wrb.6
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x4o0tadweuj23sLkh9uK/49Ckg22Ago7xB3yd+9McbM=;
 b=WcTP8054NkKRfTVl3zupNh07mbVwfBfnkSfxWoUnw6tfBAq5ys9wRKnN5q9YTzzI4b
 yUE6tzUapDllt7QXbvO5JTLIHl+EgrTg5ARGvM49ckVieWxsH4otZahccpsA+J669liy
 /0Trl8mPDNGiIMvjFUEcIDRb7S9S+9MQLlhcXCt11ElP7RYtQb8Jw/RZaftSfj+Lv1Ai
 pToLe1g6FU11QA4LTff8Sou5yFMnX5NvesZvRcGB7Rol3ZgFIeYH9WHo8P5fsedUNqZb
 Zz5Os+eIgF6X/v7OWkgTrLh1eKv16wJUm26e2xaUM1UXZ0OleNZeYER8g0ivxE0jxXuo
 FE6w==
X-Gm-Message-State: AOAM532gMhsRSLkLCHucLFjz6vWXaaS/o0Q65WdwhspeqkmH38AZpAyA
 Wt6O+8ZYi9ucg1kql1AERdu3sI3EgX7O3nuv0wb7KY9auLmJq9tssd9wEQiJNaWi+dd0ReuwP5J
 /SlHwIB9Rw6sbz9ilmNfwuVgw68VSuVY4x7fBjtt5
X-Received: by 2002:a05:6000:3ce:: with SMTP id
 b14mr11007108wrg.118.1643459039519; 
 Sat, 29 Jan 2022 04:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygRY/OO3A1gLYNKDwc5YcDp9OYKQQJgKxWDSCXzN4Pa9hV5T3InC2pPxALeSJIge3bJVVrsw==
X-Received: by 2002:a05:6000:3ce:: with SMTP id
 b14mr11007100wrg.118.1643459039297; 
 Sat, 29 Jan 2022 04:23:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z13sm7901534wrm.90.2022.01.29.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:23:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ASoC: dt-bindings: samsung: convert to dtschema
Date: Sat, 29 Jan 2022 13:23:51 +0100
Message-Id: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

The patchset is based on Rob's sound-dai changes:
https://lore.kernel.org/all/20220126231427.1638089-1-robh@kernel.org/

Changes since v1:
1. Correct samsung,snow cpu/sound-dai.

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  ASoC: dt-bindings: samsung,aries-wm8994: require sound-dai property
  ASoC: dt-bindings: samsung,arndale: convert to dtschema
  ASoC: dt-bindings: samsung,arndale: document ALC5631
  ASoC: dt-bindings: samsung,smdk5250: convert to dtschema
  ASoC: dt-bindings: samsung,snow: convert to dtschema
  ASoC: dt-bindings: samsung,tm2: convert to dtschema

 .../devicetree/bindings/sound/arndale.txt     | 25 ------
 .../bindings/sound/samsung,aries-wm8994.yaml  |  4 +
 .../bindings/sound/samsung,arndale.yaml       | 45 +++++++++++
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 ----
 .../bindings/sound/samsung,smdk5250.yaml      | 38 +++++++++
 .../bindings/sound/samsung,snow.yaml          | 74 +++++++++++++++++
 .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
 .../bindings/sound/samsung,tm2.yaml           | 80 +++++++++++++++++++
 .../devicetree/bindings/sound/snow.txt        | 31 -------
 9 files changed, 241 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/arndale.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,arndale.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,snow.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/snow.txt

-- 
2.32.0

