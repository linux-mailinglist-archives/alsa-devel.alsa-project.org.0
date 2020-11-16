Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674AD2B4E7F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 18:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F8D173D;
	Mon, 16 Nov 2020 18:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F8D173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605549260;
	bh=01bBWQt5m1BIflz7aF7nD81bGfvALRAb9nF6NGbIkcU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxmIHyUWNOYCO5A6H9yAEoSOD1fxJmELzCGgBWPSNpabSWZKj2hlZEj8FhVJHg/4W
	 wa3QrqqtP5qeYG/ZgKXnAvmxNna6c3uB00/K61o6Mm6AFjPVMgy59TObgcyV4RsVp2
	 cYSlhzLHB0O9FermJIpYhlFhMFnKajClIubVTlWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA430F804C2;
	Mon, 16 Nov 2020 18:52:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F232CF8016D; Mon, 16 Nov 2020 18:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C39DF80168
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 18:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C39DF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U2UW4VXW"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DF3D206D9;
 Mon, 16 Nov 2020 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549105;
 bh=01bBWQt5m1BIflz7aF7nD81bGfvALRAb9nF6NGbIkcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2UW4VXWuTDtBuFpoj1xY+LVIZTNLSkksUJ1l2FtrLmYrgVqUb2At42olz/GaNfpx
 5nOw8xiTubsQUOsqncgjLFzyGIs43D/4A2ivwhvOpaAVwur+ZNLmXSCexvhN4RAjlo
 xIns/j1qFCUCWQ3EZl2cyuAZenpc1ZZnEvWyWO7M=
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
Subject: [PATCH 2/4] ASoC: sh: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:51:31 +0100
Message-Id: <20201116175133.402553-2-krzk@kernel.org>
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

The SH4 FSI sound drivers use SuperH clocks thus they cannot be built on
platforms without proper clock support (e.g. compile test on MIPS with
RALINK and SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/sh/fsi.o: in function `fsi_clk_set_rate_external':
    fsi.c:(.text+0x2714): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sh/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index ef8a29b9f641..346c806ba390 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -23,6 +23,7 @@ config SND_SOC_SH4_SSI
 
 config SND_SOC_SH4_FSI
 	tristate "SH4 FSI support"
+	depends on SUPERH || COMMON_CLK
 	select SND_SIMPLE_CARD
 	help
 	  This option enables FSI sound support
-- 
2.25.1

