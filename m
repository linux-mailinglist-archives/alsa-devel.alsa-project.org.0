Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B016A90B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:00:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C691682;
	Mon, 24 Feb 2020 15:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C691682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582556411;
	bh=QAdEqTT4ZdnRmwNfpDOupdRp4JgcEHj7pziZG23pl1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cIeWvKtDRR/xpuOOKK8QpxaXJgbzFWswQz2Wbyqu1X7mmBDcyiiaPm8kfRMqSIH+f
	 z3UadJX6QK9QvPZFbctvgvi25KgqdEXBZHcclNqjVPdSEJBZPEyMZ77TqmaB7Np614
	 ofgp7B/OdLtzrMZzg9XqHnG+jPBEZxkzFPHTqWUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE4DBF80171;
	Mon, 24 Feb 2020 15:58:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1CB7F80171; Mon, 24 Feb 2020 15:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84622F800C6
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 15:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84622F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="kCBMljJD"
Received: by mail-wr1-x442.google.com with SMTP id y17so1932687wrn.6
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7uc4ZyvgI1jMGXCbWtx41AYJ+mfMjeXR72GJNbpY18=;
 b=kCBMljJDgEXgQJtO36JYtqdY47PYaeQkiZClS+0usrj9Ixr8jvPES+3Tw1jnf6PdD6
 gwtvcqGKHWH33/s0vQLib0EDKaT5CHV/OjJIteuVTGT4KTEOqw3LM0DiJ/p2f/yGr+RQ
 VYtjCQA7tt6yi300wdDWYyCJhxRYeBtXGKfgmMn4eJoAtnMBgQnXuGyT4lXBRO6aZ7rD
 BR4ND1x2j7TL0Qx91QSTWUHXexmtfFfjwfok5+myttcA7hmC36G+3Zkuwk0JOkv4FwGf
 00bm0cc7zRkFA3kyAr2J0Xoz/XgKb8Y2ukc8jM0Z5pNSgmTJNRidIK2ixISCUYdRXfQm
 CwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7uc4ZyvgI1jMGXCbWtx41AYJ+mfMjeXR72GJNbpY18=;
 b=X8UQTTkLK7NQMrT2X5b2hOElIhhMmaS2POR4tKOjYDdHcPWStEMPvfGvAaJsjqxIl3
 Fni+OAy2DtSqlknUUAXKF8PeworQc2ZcYZDoWb6u2YpPvv+3YD6xgxRl2WNhlWgBHFEd
 sSnuLiqyUNMiyQlJ0SsrIoICWJYdN12/5exm8cRCC8K6ZAlbiUugc7XHWE7qhcMcZLAj
 hF3jFxW/h/9DT6siqYW0yrW87rBCWsXaks2wMm3odRLFMdnI7jaZk9Dcoh1L1JG9hQWU
 EJW/uv9ZqOHFSkfuutrfzxARXW1ZdRorM2HR0RE1E6LhIi/Wk+eBzG/fwbfEeFUdhFuX
 D0uQ==
X-Gm-Message-State: APjAAAXBiiaagVaIJsYAHrZYwTA/HcTAtJh39HGEx1qcIo/qwJmXlQ9D
 LU7HcgGv9UNrQnY7pO1XHZxQOg==
X-Google-Smtp-Source: APXvYqzC5ORHBrCQFw6rGDHx95H9wgru83TXeezmJtNlw/dwPrwN5bmrRu/47VMppijs6JSo1frU1Q==
X-Received: by 2002:a5d:6a07:: with SMTP id m7mr38410390wru.332.1582556304185; 
 Mon, 24 Feb 2020 06:58:24 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/9] ASoC: meson: convert dt-bindings to schema
Date: Mon, 24 Feb 2020 15:58:12 +0100
Message-Id: <20200224145821.262873-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

This patchset converts the amlogic sound devices to schema.

Jerome Brunet (9):
  ASoC: meson: gx-card: fix sound-dai dt schema
  ASoC: meson: convert axg tdm interface to schema
  ASoC: meson: convert axg tdm formatters to schema
  ASoC: meson: convert axg pdm to schema
  ASoC: meson: convert axg fifo to schema
  ASoC: meson: convert axg spdif input to schema
  ASoC: meson: convert axg spdif output to schema
  ASoC: meson: convert g12a tohdmitx control to schema
  ASoC: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 111 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  79 ++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 181 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  84 ++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  77 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  92 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  57 ++++++
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  |  58 ------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml |  53 +++++
 .../bindings/sound/amlogic,gx-sound-card.yaml |   4 +-
 17 files changed, 736 insertions(+), 357 deletions(-)
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
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml

-- 
2.24.1

