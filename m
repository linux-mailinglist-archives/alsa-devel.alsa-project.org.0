Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED822B4CAE
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 18:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBBF9176C;
	Mon, 16 Nov 2020 18:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBBF9176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605547579;
	bh=BvO1UMGpaA8mWhTkZ6W1UlWZwD7ilJA1yRPKj9Tsjao=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UtDGZ4QeYcYbpZhD6q/mL2jyz6TACFxH1acnZEGjGBlQNt1VCG6J+V8lqZrUk98Uo
	 cVznHfRjlrqYTbtYvuRVIIwUyOKJvLazFLQlYRp0p0y8Z1xAn2BvUe/N9oFZrv5+kg
	 cEP7bTP52ygI4b4Z/xLO8Ockr13CIdeklcqzx8N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDECF8016C;
	Mon, 16 Nov 2020 18:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F13F80168; Mon, 16 Nov 2020 18:24:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D2A7F8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 18:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D2A7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="NFxvcrQE"
Received: by mail-wm1-x343.google.com with SMTP id m125so13087899wmm.3
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtMD9HUNCd7ZhC138zP7kvjxUP0uAPHZgUTaa91+Qcc=;
 b=NFxvcrQEPFkb93g/IBtJ/uRqBozR3l3vlNfcc3pD1YOP/jYIgX5hH75BkC3XJiPcKV
 GNPWB1vBbrQWhHeC+i/oychqXkOU/ddKdJPT3K5aug5fayuGyLFhdjnoEJ8LJztn+qeI
 9OTSt8sfTbVjrybvdp4TcZ2vCj3BfcutkR69qe0iHDFlqQZwMbKPVFuWhsPMKe/udgAM
 zbb0tSAxaj8ReqS+miXkzIhNk7yNw6a4R/k8U2xe5GeAnvdfbMEHlIn0EhC/T/rru/00
 UMzvzcmarWLLB1ErQmgrsr7RznPI4XAnbs47fCRvlMOk8RwzmYr6MZu/w4MIBjTFkPdi
 jkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtMD9HUNCd7ZhC138zP7kvjxUP0uAPHZgUTaa91+Qcc=;
 b=Spv8ptafdDNlZs5QLSSQxi9kybChiDDrjRw3FQBO7P9w9H6/zi7tb41ijn3uydfLm7
 SDsiBkHfFdvQ8qNiWx1qRDPa0PetlmiE9pNeGpyPsPmPv3o4/43iPLREEPiCphU8S6j1
 vs4yyzcCxoEw5dKHwmV3zpxJNSDMClV7952OFHYyTlWo4b0hSSH61QW/X2p54vPN4eEZ
 /4Rrgq31oz/rZs/yePgKaCdxrlG8TaDq6Hp08cFuu10kRCYK+XalVQSybbS6oCOVwJtG
 RFsSGf5TSKDVKd3pP7BN5CqibmQ7xoXuVmppTc51huridCf2iohxjzbcqilPRAVC8YXc
 noTg==
X-Gm-Message-State: AOAM530LtKs95LcqABDmtQr6txks27MRUOM5dqpN9FyoUgz6oDG6UFQF
 cZ7Ma47qidWCwlYyf1Xfi/zudw==
X-Google-Smtp-Source: ABdhPJzR+k3v4Mwybe0vCGdYqAqSGoEIjkYxAtsoASKSWzdNHfe23t1SJRHTenco765aUJ4maCS1dQ==
X-Received: by 2002:a05:600c:209:: with SMTP id
 9mr16522232wmi.89.1605547472634; 
 Mon, 16 Nov 2020 09:24:32 -0800 (PST)
Received: from starbuck.lan (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.googlemail.com with ESMTPSA id 34sm24128949wrq.27.2020.11.16.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:24:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: fix COMPILE_TEST error
Date: Mon, 16 Nov 2020 18:24:23 +0100
Message-Id: <20201116172423.546855-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
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

When compiled with CONFIG_HAVE_CLK, the kernel need to get provider for the
clock API. This is usually selected by the platform and the sound drivers
should not really care about this. However COMPILE_TEST is special and the
platform required may not have been selected, leading to this type of
error:

> aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'

Since we need a sane provider of the API with COMPILE_TEST, depends on
COMMON_CLK.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 363dc3b1bbe4..ce0cbdc69b2e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "ASoC support for Amlogic platforms"
-	depends on ARCH_MESON || COMPILE_TEST
+	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
-- 
2.28.0

