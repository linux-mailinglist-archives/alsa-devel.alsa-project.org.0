Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E9167D6C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 13:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2574716BC;
	Fri, 21 Feb 2020 13:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2574716BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582287877;
	bh=ngWxF7aO5t5MRSt7sNRFkMbY7w8K1HztgdLGyebIsDc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CfUDPUfur/wuLmtnbume0SWBwAkRtLLVPYdr1AMXgskfVXoGOU2dqOIEX9GYriHOS
	 1ziiO92OOVPcvslj/E15TenAFMrUajEPH3amIQrVcsF43xiLLWP9drNsuRx6opI0/g
	 KH9zyjoDpmtn7n5064xdkHiwzPJ92k8KC1xa88JA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7F7F80276;
	Fri, 21 Feb 2020 13:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F63AF80273; Fri, 21 Feb 2020 13:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE5CCF80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 13:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE5CCF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Hzswd1IE"
Received: by mail-wr1-x444.google.com with SMTP id c9so1811207wrw.8
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 04:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BYedZ4pOByhHvdhuJN4fjl+rXQW3qUeEEUr/kFsWVU=;
 b=Hzswd1IEpFgBP9efY9SXOGNd64ap93yVYNG4hX5JRFgq6BqQLP6NMpaXnrsS4yshJr
 d/cfs5VudtvLHi7xt1YxbKlxcbTdIfYFPDd4pbfMC10jwUIEmdupU+I/U319Ue7iQcHZ
 zTXIEVK1lyRXExDAjWQpCwqdmy+CthZHkPEpn4TuEfRuqoQKL9020Dy69beWpRhBEMDG
 8U/JBaYO045Zy7LLbkTq6YQzTkojCkI+UcobfIiQBV7lKe5KUl9fL9wvZZ7TQmI6OSzr
 iPqtJ7k1iNdxG0deDdtmqbUqZrShsZSA6X2Hra92Yigm2T2ltYn6+y7wvAEIK4FZhoRo
 QZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BYedZ4pOByhHvdhuJN4fjl+rXQW3qUeEEUr/kFsWVU=;
 b=lRsim+Jj1kamygNLJ7Y5KK5ow8o2sboZlY79evgeQanAF81HkJS+lytE3OZNJiNoxY
 yPNZQ0sd1yFfQFxHt5cjAXyGMGHEjjOZYmDY+FPojGN4PCpqjrlagiM0hh8YXdSiP6jV
 1DRvaHuywNLP+Tlp5KwunDK0jbyu8OpBNyI5jU7Ro4lfBiAvzu4US87M3w47tC8ufYNZ
 DI0ZyaVW/xC35We8DXVsYzsYIvanJs+zPL0Cr9m7t0maobmm4RXMRcihnptKtcwyKObh
 F9mfdZ0WP9Dy06x4YrXae/oWisF1Zhwe/ttVbfoHRsrKQGhZ85bMXvgqRwwH20m5kxco
 +KJw==
X-Gm-Message-State: APjAAAUPqlErcw35q3xbzuQoh+RstmcfF0RBNyrjGj5r3OUERD5NOl+C
 t3R1kvFzf1Py+Bwx2U+kmbVVhg==
X-Google-Smtp-Source: APXvYqzmjIqVT9st1OIarukP3BJalnkRPkvKDXMRg5ZK7MmjuG/5QwKMBZb6+Mmv5heghIB9nKAzwA==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr49039936wrr.208.1582287768611; 
 Fri, 21 Feb 2020 04:22:48 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/3] ASoC: meson: g12a: add internal audio DAC support
Date: Fri, 21 Feb 2020 13:22:39 +0100
Message-Id: <20200221122242.1500093-1-jbrunet@baylibre.com>
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

Like the gxl, the Amlogic g12a and sm1 SoC families have a t9015 internal
audio DAC. On these more recent SoCs, any of the 3 TDM outputs can be
routed to the internal DAC. This routing is done by a small glue device
called 'toacodec'. This patchset adds support for it.

Jerome Brunet (3):
  ASoC: meson: g12a: add toacodec dt-binding documentation
  ASoC: meson: g12a: add internal DAC glue driver
  ASoC: meson: axg-card: add toacodec support

 .../bindings/sound/amlogic,g12a-toacodec.yaml |  51 ++++
 .../dt-bindings/sound/meson-g12a-toacodec.h   |  10 +
 sound/soc/meson/Kconfig                       |   9 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/axg-card.c                    |   3 +-
 sound/soc/meson/g12a-toacodec.c               | 240 ++++++++++++++++++
 6 files changed, 314 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h
 create mode 100644 sound/soc/meson/g12a-toacodec.c

-- 
2.24.1

