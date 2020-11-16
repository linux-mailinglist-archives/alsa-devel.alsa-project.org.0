Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE692B4E80
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 18:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3E11779;
	Mon, 16 Nov 2020 18:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3E11779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605549273;
	bh=eEsYH55eH+FauXTIeKvQAw4mnoGY2nOsaUiqsTf/7WQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAoAojrnVpOCKAfEblm5k4PIelP+nhfBcEt3dIJE7God4jyZQnBiCUGnuMZCxLsqD
	 fr+zHcZxqdfd4rU5jx7kGpb1Zz4EJwrsBF29BVQD8Rzmm5TeoxizHUdGKbV6PbS/SW
	 otkEJy+i3LamMb/UOQCI5DBIr89f8S3m6moj2r3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA3C6F804D8;
	Mon, 16 Nov 2020 18:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4637F804B1; Mon, 16 Nov 2020 18:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF72F80167
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 18:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF72F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ilLlQscx"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 300F820B80;
 Mon, 16 Nov 2020 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549113;
 bh=eEsYH55eH+FauXTIeKvQAw4mnoGY2nOsaUiqsTf/7WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ilLlQscxULowt4Lmlymi7n8TbrOjii1m9ZEPk6XgeI7cDozEVjFUbCO/t7yxdIQtv
 PbKmDIJE0fSsLticdAx3N74gXSbLw3U77x8yrKf/PMn9hQyRP+eG+uFFpq+jQT83PY
 Bxckzm+EH04bt+SaoLDQmmBZIAA//eY4lludgWcs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/4] ASoC: ti: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:51:33 +0100
Message-Id: <20201116175133.402553-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

The TI/OMAP sound drivers use Common Clock Framework thus they cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/davinci-mcasp.o:davinci-mcasp.c:(.text+0x1c64): more undefined references to `clk_set_parent' follow
    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/omap-dmic.o: in function `omap_dmic_set_dai_sysclk':
    omap-dmic.c:(.text+0xa5c): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/ti/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 9775393d46b6..698d7bc84dcf 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -26,6 +26,7 @@ config SND_SOC_DAVINCI_ASP
 
 config SND_SOC_DAVINCI_MCASP
 	tristate "Multichannel Audio Serial Port (McASP) support"
+	depends on COMMON_CLK
 	select SND_SOC_TI_EDMA_PCM
 	select SND_SOC_TI_SDMA_PCM
 	select SND_SOC_TI_UDMA_PCM
@@ -47,7 +48,7 @@ config SND_SOC_DAVINCI_VCIF
 
 config SND_SOC_OMAP_DMIC
 	tristate "Digital Microphone Module (DMIC) support"
-	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST
+	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for DMIC IP found in
@@ -55,7 +56,7 @@ config SND_SOC_OMAP_DMIC
 
 config SND_SOC_OMAP_MCBSP
 	tristate "Multichannel Buffered Serial Port (McBSP) support"
-	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST
+	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for McBSP IP found in
@@ -99,7 +100,7 @@ config SND_SOC_OMAP3_PANDORA
 
 config SND_SOC_OMAP3_TWL4030
 	tristate "SoC Audio support for OMAP3 based boards with twl4030 codec"
-	depends on ARCH_OMAP3 || COMPILE_TEST
+	depends on ARCH_OMAP3 || COMPILE_TEST && COMMON_CLK
 	depends on TWL4030_CORE
 	select SND_SOC_OMAP_MCBSP
 	select SND_SOC_TWL4030
@@ -221,7 +222,7 @@ config SND_SOC_DM365_VOICE_CODEC_MODULE
 
 config SND_SOC_J721E_EVM
 	tristate "SoC Audio support for j721e EVM"
-	depends on ARCH_K3 || COMPILE_TEST
+	depends on ARCH_K3 || COMPILE_TEST && COMMON_CLK
 	depends on I2C
 	select SND_SOC_PCM3168A_I2C
 	select SND_SOC_DAVINCI_MCASP
-- 
2.25.1

