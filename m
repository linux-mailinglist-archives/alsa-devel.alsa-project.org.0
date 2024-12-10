Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537C9ECB27
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:28:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05A927AA;
	Wed, 11 Dec 2024 12:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05A927AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916484;
	bh=1yCY8csuIIkAJNzv1qjS14X6EKiSfNjbmMw/2hqxjeI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=guv9wPC3X1NAMFw9kVUutu/AVea1xruv1ludu0sFHEJqkzCq4R4rHomCLTdrizrPv
	 9vbssBahJA9ZIGf2lLsndgRYEm/laMddsHraSLH9x7fchxzHxCyxYYxFRxgPUUB69Y
	 3hy8E1tqiUkF90JmxgxQ4rwrgWMWuQ2eGBRz3Seo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8612DF805E9; Wed, 11 Dec 2024 12:27:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 466F7F805EC;
	Wed, 11 Dec 2024 12:27:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8FCF80482; Tue, 10 Dec 2024 18:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D85BAF800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85BAF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=qMqc9O0u
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so7278018a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850605; x=1734455405;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=qMqc9O0uhrLY858yrl2frOWiFXxP7NU0qz7Q35axuvzhk0mM74PR7nRUvqmYaPg731
         33BicToQR+0c6juXcGsPMjtKV1O8tXok0kkKAkBTznqaz78yFvPrrNC0P3MTek3Khefr
         2SAbteMtheivU6LR5ubsjWbTk2lBmSNkvFeU2mgNge2Ux90CKztlObMmvzpHs+iZz0We
         AqxTYzxV+G2XBwiAh1HFUqfGq7ABCZ5G8Y9AwvyaiwRpT8vkpSzw0twCEajf9PkcEtD3
         JGX9FfBLsGeoXWeRE0dAZi/hKRm3GCeDqMLv0oJarSadevnBiudBT0O+zkKSQFol6IPt
         g6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850605; x=1734455405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=tyyY4OUhbvBySD5N9GFbcjgszim5wJ2fS+NXI7FcYZtkYyhy33pxoo5i9TOjfhdlhP
         it2+uzdoKAjYNNd8R+vVvehpvNwCNMbnnIULKnDbgv7e2BGNG46NNOnNtoT5/uvpWUf6
         3gUwIJKpHP8mW3VXyAX5VMnLnLALFu75AtBxO+ZeneWdxpuy1SE1BbMjaARrpZZmiunP
         rfbxi80JPGJPg7n0Y4oHquHMPeXWN5jKNYQdQWwjVTQLUMKCsWm4ByFgCMeL48mWKc1p
         X3gen7KHz5J2DCiw0UY1HRG83kxFhk8pOlm2TjQpn6uB0LALFvtS2BM3KM7vgGQ31ljq
         G/UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoUSOzJ98N97+NFQ8rTD+G6LQio6CybBVoDUQ//fi/wu46zCIptZxeYOVJssiD1Nnaey+hWCS9mfAn@alsa-project.org
X-Gm-Message-State: AOJu0YydEQwhT4q2ZOj+VbTE7OSd6O3grJ+GHAlt2L1kDvgP77pSAxdI
	R+u/moSTZdEs9JqdmPXjo05bhPdhrjrgUh/DHLVW84FKFuWpmN9pwCSBbWzJcbM=
X-Gm-Gg: ASbGncuRi45eDZhFAGEp+SDdT7GMyOYQ3dew3kcyApiMKGaR6rKPYGbEvYpJx4icHlC
	Ic+gWkQYWOh46mxzXRHcb7FJAL3ovZQT1yieQXD1RtsTccbkFidAw/UK33qR0ymIG0In8UDDIkj
	fe9Mo/VVptR2LsxNZ4Aj/37Yh79WUz2Jui14yKkrKeRa8jhjjpKy6RF3wlWYwg+uCGNJbmcr0Nm
	rSXRniTDxYRBZhNfzI+tKYmVcjECrZVnX7Sq9h3jdMlcY3IvHG9w5ZLIbG1T6rVS43/ZAqdxWOk
	fmCeHfNI
X-Google-Smtp-Source: 
 AGHT+IHSX6HgwX58RDNMjWxEUiBxZF49DY7PE972rvdQuS2JxVwMHBYkw/019YuVN5dqWY39BwVGSw==
X-Received: by 2002:a05:6402:2696:b0:5d2:719c:8bf3 with SMTP id
 4fb4d7f45d1cf-5d3be67e27fmr16737798a12.9.1733850604950;
        Tue, 10 Dec 2024 09:10:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 00/24] Add audio support for the Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:29 +0200
Message-Id: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DWM7K7HY4DBJRRV7G2BXNHTG2KRVB2V7
X-Message-ID-Hash: DWM7K7HY4DBJRRV7G2BXNHTG2KRVB2V7
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWM7K7HY4DBJRRV7G2BXNHTG2KRVB2V7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series enables the audio support for the Renesas RZ/G3S
SoC along with runtime PM and suspend to RAM.

Patches:
- 01-03/24 - update versaclock3 clock generator driver to support the
             5L35023 hardware variant; versaclock3 provides clocks for
             the audio devices (SSIF, DA7212 codec)
- 04-19/24 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
             were also included
- 20-24/24 - add device tree support

Merge strategy, if any:
- clock patches (01-03/24) can go the clock tree
- audio patches (04-19/24) can go through the audio tree
- device tree patches (20-24/24) can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- added patch 18/24 "ASoC: dt-bindings: renesas,rz-ssi: Remove DMA
  description"
- collected tags
- addressed review comments
- dropped already integrated patches
- the changelog for each patch is detailed within the individual
  patches

Changes in v3:
- use renesas instead of sh in audio patches title
- use proper fixes tag for patch
  "ASoC: renesas: rz-ssi: Terminate all the DMA transactions"
- collected tags

Changes in v2:
- fixed typos pointed out in the review process
- dropped da7213 patches already applied
- dropped patch "ASoC: sh: rz-ssi: Use a proper bitmask for clear bits"
  as requested in the review process


Claudiu Beznea (24):
  clk: versaclock3: Prepare for the addition of 5L35023 device
  dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock
    generator
  clk: versaclock3: Add support for the 5L35023 variant
  ASoC: renesas: rz-ssi: Terminate all the DMA transactions
  ASoC: renesas: rz-ssi: Use only the proper amount of dividers
  ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
  ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
  ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
  ASoC: renesas: rz-ssi: Remove the first argument of
    rz_ssi_stream_is_play()
  ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
  ASoC: renesas: rz-ssi: Use temporary variable for struct device
  ASoC: renesas: rz-ssi: Use goto label names that specify their actions
  ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime
    resume/suspend the SSI
  ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
  ASoC: renesas: rz-ssi: Add runtime PM support
  ASoC: renesas: rz-ssi: Issue software reset in hw_params API
  ASoC: renesas: rz-ssi: Add suspend to RAM support
  ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
  ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add SSI nodes
  arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
  arm64: dts: renesas: Add da7212 audio codec node
  arm64: dts: renesas: rzg3s-smarc: Enable SSI3
  arm64: dts: renesas: rzg3s-smarc: Add sound card

 .../bindings/clock/renesas,5p35023.yaml       |   1 +
 .../bindings/sound/renesas,rz-ssi.yaml        |  19 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  94 ++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  47 +++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  63 +++++
 drivers/clk/clk-versaclock3.c                 |  67 ++++--
 sound/soc/renesas/rz-ssi.c                    | 226 +++++++++++-------
 7 files changed, 388 insertions(+), 129 deletions(-)

-- 
2.39.2

