Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1B68EB93
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:36:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C0E86E;
	Wed,  8 Feb 2023 10:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C0E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848987;
	bh=wMkWdyYxHDhyhJZBboQ33F9OEZKyqiaE9Vd5KYcjkVk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J+a+Id898Gfvfc7Fhm+G5aNAEP/yx++DZnt8BDFrtrDs4C4kr2BF9VN5rMS1QhjdX
	 s9LHI02OrQABao4nsepcMxo2TRnHbqaFxsdRzAfm+J4spDvOwhDythZ36JzwE138It
	 N4HhttRP3eWI+UayA3DTSocVnNVsrVyVo/iO0d9Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F986F800AA;
	Wed,  8 Feb 2023 10:35:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 325AEF80518; Wed,  8 Feb 2023 10:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6446F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6446F800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=iqGdC41c
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so958094wmb.4
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5Tu8R0oupz/ghiHxU+IGFJ45u5bYP68xNxl3K3/IjE=;
        b=iqGdC41c/7Nav5uKJe7OFSVlN/w+wAHQedSiSAkvS2V0cWV1aa0Vz+pHyXM/Bhgw1t
         kQ+ZYwiGtNowD8cHal8ybws8mppYjq+jtUrl1+kgm2r6TSK2obKank2PdZnBZBOZ5oTn
         5SFe3xDzSSkr653gRrWicS3lePMHkFofroQSRg3NW4mizNyb1SWTxBozNHJuVB2WKl39
         pSOSO7ev/PlYUHMQ55bqc1VAek0gRkRln/clenas4STXF50e+WGhd4yVbLg/PCGaiR6m
         d6+VpLwlrYrPHGiSKfYTAU/0SyfXslc3w8xYu4ap7ns54COAm8pIh1lmLKsW2lkOHiWs
         QEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5Tu8R0oupz/ghiHxU+IGFJ45u5bYP68xNxl3K3/IjE=;
        b=N6MRTnV5R10NjkEx+HNywccZUEIXO1qqGw9dNWKToR1ywFHoMNLvZPsS8H1CJSbK2A
         qiSNYMcJ/TV77sUh1b7EcOfxWztWoQ8+wd6hStX2hpRhPoYdF2A1usShFwtmzObPKrZ/
         +q364U6IV0I2DJKn/JObMHtsamvyJucJcp+V/p50HwpzKk78fX3R1gu5AxEIK+vW8Vgb
         wqf5A3c4SSmarUS9ZVamgBQOQAJ8xscEku6JynRa146asUWoz1bv1mSQ+tXpo3DVwLxg
         l5h+yCHkQGWoWxP7oUD3Ev7a/AblqWqGdQGL6EJSX94OUMHqEJFFzXnwQmqSx5mOW05K
         jRJw==
X-Gm-Message-State: AO0yUKV0d/jBvBGjQDBQVRdWiuZ9SjzG0YeMROavfpXBkZ0CdCu8NwmA
	uMAuzvm8MVTy/Sb11AMvyE/Cqg==
X-Google-Smtp-Source: 
 AK7set/kCIIZcHoJ4TsvPawNaB7DdeTgLnyVQKSy16xqjOEFQfYshN3+RU6iL+FYD1oxwlLAWFVWqg==
X-Received: by 2002:a05:600c:1d8b:b0:3dc:198c:dde with SMTP id
 p11-20020a05600c1d8b00b003dc198c0ddemr5669502wms.41.1675848927019;
        Wed, 08 Feb 2023 01:35:27 -0800 (PST)
Received: from jackdaw.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id
 j23-20020a05600c1c1700b003dc1a525f22sm1375051wms.25.2023.02.08.01.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:35:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Wed,  8 Feb 2023 10:35:18 +0100
Message-Id: <20230208093520.52843-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2OD7UH4UZN44WSN5KHVYYFME42DY2SSA
X-Message-ID-Hash: 2OD7UH4UZN44WSN5KHVYYFME42DY2SSA
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OD7UH4UZN44WSN5KHVYYFME42DY2SSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Continue conversion of AXG audio dt-binding documentation to schema

Changes since v2:
 * Drop 6 patches applied with v2
 * Drop Yaml block style indicator for multiline description

Changes since v1:
* Drop 2 patches applied with v1
* Drop node name patterns
* Fix examples indentation
* Yaml fixups requested by Krzysztof

Jerome Brunet (1):
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
 2 files changed, 183 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml

-- 
2.39.1

