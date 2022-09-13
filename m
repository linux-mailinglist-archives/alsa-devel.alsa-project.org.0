Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 607EE5B6CC4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 14:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9EA3174E;
	Tue, 13 Sep 2022 14:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9EA3174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663070912;
	bh=ALmOZ5F/EKblFoGT8Zn6YGXShuTEDGANs7c+iv+dCmY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OW78dKYmwWnaLSOmUF0z3QfG/e0lwyRpJU/Rca/nWZ3LQq3KYAp0YzwH2PFY0MvBO
	 0ko9qSuB0+6Swv2tfjMWvSasir4Znf6oxEoSsio/Iz8fx4qt4GPwwGh8ynMH9LjNhw
	 gK+AOJF0eHIX1g6GVaGl2iELAy+9/VUm6dfJipf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45208F8008E;
	Tue, 13 Sep 2022 14:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C1EF8008E; Tue, 13 Sep 2022 14:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id AFF0AF8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 14:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF0AF8008E
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id AB36D1C80F5C;
 Tue, 13 Sep 2022 20:07:16 +0800 (CST)
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Sep 2022 20:07:16 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Tue, 13 Sep
 2022 20:07:16 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 13 Sep 2022 20:07:15 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: nau8825: Add ADCOUT IO drive strength control
Date: Tue, 13 Sep 2022 20:06:41 +0800
Message-ID: <20220913120641.792502-1-CTLIN0@nuvoton.com>
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
 sound/soc/codecs/nau8825.c | 6 ++++++
 sound/soc/codecs/nau8825.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 8213273f501e..b3cdbe884c05 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1983,6 +1983,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
 	/* Disable short Frame Sync detection logic */
 	regmap_update_bits(regmap, NAU8825_REG_LEFT_TIME_SLOT,
 		NAU8825_DIS_FS_SHORT_DET, NAU8825_DIS_FS_SHORT_DET);
+	/* ADCDAT IO drive strength control */
+	regmap_update_bits(regmap, NAU8825_REG_CHARGE_PUMP,
+			   NAU8825_ADCOUT_DS_MASK,
+			   nau8825->adcout_ds << NAU8825_ADCOUT_DS_SFT);
 }
 
 static const struct regmap_config nau8825_regmap_config = {
@@ -2521,6 +2525,7 @@ static void nau8825_print_device_properties(struct nau8825 *nau8825)
 			nau8825->jack_eject_debounce);
 	dev_dbg(dev, "crosstalk-enable:     %d\n",
 			nau8825->xtalk_enable);
+	dev_dbg(dev, "adcout-drive-strong:  %d\n", nau8825->adcout_ds);
 }
 
 static int nau8825_read_device_properties(struct device *dev,
@@ -2587,6 +2592,7 @@ static int nau8825_read_device_properties(struct device *dev,
 		nau8825->jack_eject_debounce = 0;
 	nau8825->xtalk_enable = device_property_read_bool(dev,
 		"nuvoton,crosstalk-enable");
+	nau8825->adcout_ds = device_property_read_bool(dev, "nuvoton,adcout-drive-strong");
 
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

