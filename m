Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F545AFCE5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 08:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7F73E7;
	Wed,  7 Sep 2022 08:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7F73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662533669;
	bh=8112fXUzMtZrQB9RgmxgwcRZVy0Tx/LGcaXkX6RXOKM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bFEiyT/j3IWmpv3wzMwY2rlE9xtlUAoyI7WZ7Unp8y0a+1N+0nrDs0K+t3BvvouQb
	 unf5n5JFmL76HUJN4p4Prg4rwHnStAA8ymuxXT+cNMgdtxRzaKA/8/CNvIOkkYGFiK
	 +54Nmmq+/ssrAR2XpHFyXTjy1+vdzLWPvBiPVfp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 178DCF80423;
	Wed,  7 Sep 2022 08:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695D5F8028D; Wed,  7 Sep 2022 08:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 49681F8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 08:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49681F8023B
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 5C6EB1C80E4A;
 Wed,  7 Sep 2022 14:53:14 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 14:53:14 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 7 Sep 2022 14:53:13 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8825: Add ADCOUT IO drive strength control
Date: Wed, 7 Sep 2022 14:51:27 +0800
Message-ID: <20220907065126.406208-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

Add a property to control the driving of ADCOUT.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 Documentation/devicetree/bindings/sound/nau8825.txt | 2 ++
 sound/soc/codecs/nau8825.c                          | 6 ++++++
 sound/soc/codecs/nau8825.h                          | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
index 388a7bc60b1f..54972cc2ca1a 100644
--- a/Documentation/devicetree/bindings/sound/nau8825.txt
+++ b/Documentation/devicetree/bindings/sound/nau8825.txt
@@ -71,6 +71,8 @@ Optional properties:
 
   - nuvoton,crosstalk-enable: make crosstalk function enable if set.
 
+  - nuvoton,adcout-drive-str: ADCOUT IO drive strength. 0 - normal, 1 - stronger.
+
   - clocks: list of phandle and clock specifier pairs according to common clock bindings for the
       clocks described in clock-names
   - clock-names: should include "mclk" for the MCLK master clock
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 8213273f501e..fc00e600cf2c 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1983,6 +1983,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
 	/* Disable short Frame Sync detection logic */
 	regmap_update_bits(regmap, NAU8825_REG_LEFT_TIME_SLOT,
 		NAU8825_DIS_FS_SHORT_DET, NAU8825_DIS_FS_SHORT_DET);
+	/* ADCDAT IO drive strength control */
+	regmap_update_bits(remap, NAU8825_REG_CHARGE_PUMP,
+			   NAU8825_ADCOUT_DS_MASK,
+			   nau8825->adcout_ds << NAU8825_ADCOUT_DS_SFT);
 }
 
 static const struct regmap_config nau8825_regmap_config = {
@@ -2521,6 +2525,7 @@ static void nau8825_print_device_properties(struct nau8825 *nau8825)
 			nau8825->jack_eject_debounce);
 	dev_dbg(dev, "crosstalk-enable:     %d\n",
 			nau8825->xtalk_enable);
+	dev_dbg(dev, "adcout-drive-str:     %d\n", nau8825->adcout_ds);
 }
 
 static int nau8825_read_device_properties(struct device *dev,
@@ -2587,6 +2592,7 @@ static int nau8825_read_device_properties(struct device *dev,
 		nau8825->jack_eject_debounce = 0;
 	nau8825->xtalk_enable = device_property_read_bool(dev,
 		"nuvoton,crosstalk-enable");
+	nau8825->adcout_ds = device_property_read_bool(dev, "nuvoton,adcout-drive-str");
 
 	nau8825->mclk = devm_clk_get(dev, "mclk");
 	if (PTR_ERR(nau8825->mclk) == -EPROBE_DEFER) {
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 887bbff03ec6..6d112b6145df 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -418,6 +418,8 @@
 #define NAU8825_POWERUP_HP_DRV_L	(1 << 0)
 
 /* CHARGE_PUMP (0x80) */
+#define NAU8825_ADCOUT_DS_SFT	12
+#define NAU8825_ADCOUT_DS_MASK	(1 << NAU8825_ADCOUT_DS_SFT)
 #define NAU8825_JAMNODCLOW	(1 << 10)
 #define NAU8825_POWER_DOWN_DACR	(1 << 9)
 #define NAU8825_POWER_DOWN_DACL	(1 << 8)
@@ -477,6 +479,7 @@ struct nau8825 {
 	int imp_rms[NAU8825_XTALK_IMM];
 	int xtalk_enable;
 	bool xtalk_baktab_initialized; /* True if initialized. */
+	bool adcout_ds;
 };
 
 int nau8825_enable_jack_detect(struct snd_soc_component *component,
-- 
2.25.1

