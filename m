Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3144417481
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC49191E;
	Wed,  8 May 2019 11:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC49191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306250;
	bh=t0LyxBihSWLV52jGZ5ia8ajkaGbofgThDBV8q0LuLF0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dPD7fl8xTWrLfUIySKP6W9q7PSN2b5uKL4esvAGM2/erPoPO3DPAKsb7vDvALZwj/
	 oaG2iEhpmNeUvHYI6nlC7HOjMDtn9bfVtP4ImUNZCMxVSNeBRGbEgU4pf22uerrw/6
	 HTi3ASe/Lqm4+0wYN0ruKIaaAFdO2260W7eMPTQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5037AF89730;
	Wed,  8 May 2019 11:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E153F89726; Wed,  8 May 2019 11:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E571F89726
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E571F89726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JWKWuMRH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=j0BVhUdSsVNZZmpI2QpfiLV2xfXPtZzCwrFt5yURFYU=; b=JWKWuMRHWILi
 YdbjuGBH0MzGGR++caNDzWDv0M5Sf+mBkpcSJl3TobMeo91jjbvDPHvEpIF57VeJzgW9L+iF/Y6kk
 fiYhbtUEU633ojVYx3CNClm3uWB2PmKPdZ7/kIJ0KLdqUoybRrhTcOa7mHjm/TPrGBwrWi4r5HDG1
 a/DcY=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISD-0007dQ-0A; Wed, 08 May 2019 09:01:36 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 495B0440017; Wed,  8 May 2019 10:01:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <1557147252-18679-3-git-send-email-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090127.495B0440017@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:27 +0100 (BST)
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 tiwai@suse.com, arnaud.pouliquen@st.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: [alsa-devel] Applied "ASoC: stm32: i2s: manage identification
	registers" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: stm32: i2s: manage identification registers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 71ed4bddde08285cd02d6d28c861ea1815d67476 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 6 May 2019 14:54:12 +0200
Subject: [PATCH] ASoC: stm32: i2s: manage identification registers

Add support of identification registers in STM32 I2S.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_i2s.c | 60 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 97d5e9901a0e..9755c49ae7dc 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -16,6 +16,7 @@
  * details.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -37,6 +38,10 @@
 #define STM32_I2S_TXDR_REG	0X20
 #define STM32_I2S_RXDR_REG	0x30
 #define STM32_I2S_CGFR_REG	0X50
+#define STM32_I2S_HWCFGR_REG	0x3F0
+#define STM32_I2S_VERR_REG	0x3F4
+#define STM32_I2S_IPIDR_REG	0x3F8
+#define STM32_I2S_SIDR_REG	0x3FC
 
 /* Bit definition for SPI2S_CR1 register */
 #define I2S_CR1_SPE		BIT(0)
@@ -143,6 +148,23 @@
 #define I2S_CGFR_ODD		BIT(I2S_CGFR_ODD_SHIFT)
 #define I2S_CGFR_MCKOE		BIT(25)
 
+/* Registers below apply to I2S version 1.1 and more */
+
+/* Bit definition for SPI_HWCFGR register */
+#define I2S_HWCFGR_I2S_SUPPORT_MASK	GENMASK(15, 12)
+
+/* Bit definition for SPI_VERR register */
+#define I2S_VERR_MIN_MASK	GENMASK(3, 0)
+#define I2S_VERR_MAJ_MASK	GENMASK(7, 4)
+
+/* Bit definition for SPI_IPIDR register */
+#define I2S_IPIDR_ID_MASK	GENMASK(31, 0)
+
+/* Bit definition for SPI_SIDR register */
+#define I2S_SIDR_ID_MASK	GENMASK(31, 0)
+
+#define I2S_IPIDR_NUMBER	0x00130022
+
 enum i2s_master_mode {
 	I2S_MS_NOT_SET,
 	I2S_MS_MASTER,
@@ -280,6 +302,10 @@ static bool stm32_i2s_readable_reg(struct device *dev, unsigned int reg)
 	case STM32_I2S_SR_REG:
 	case STM32_I2S_RXDR_REG:
 	case STM32_I2S_CGFR_REG:
+	case STM32_I2S_HWCFGR_REG:
+	case STM32_I2S_VERR_REG:
+	case STM32_I2S_IPIDR_REG:
+	case STM32_I2S_SIDR_REG:
 		return true;
 	default:
 		return false;
@@ -711,10 +737,11 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = STM32_I2S_CGFR_REG,
+	.max_register = STM32_I2S_SIDR_REG,
 	.readable_reg = stm32_i2s_readable_reg,
 	.volatile_reg = stm32_i2s_volatile_reg,
 	.writeable_reg = stm32_i2s_writeable_reg,
+	.num_reg_defaults_raw = STM32_I2S_SIDR_REG / sizeof(u32) + 1,
 	.fast_io = true,
 	.cache_type = REGCACHE_FLAT,
 };
@@ -864,6 +891,7 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
+	u32 val;
 	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
@@ -902,8 +930,34 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Set SPI/I2S in i2s mode */
-	return regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-				  I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
+	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
+				 I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(i2s->regmap, STM32_I2S_IPIDR_REG, &val);
+	if (ret)
+		return ret;
+
+	if (val == I2S_IPIDR_NUMBER) {
+		ret = regmap_read(i2s->regmap, STM32_I2S_HWCFGR_REG, &val);
+		if (ret)
+			return ret;
+
+		if (!FIELD_GET(I2S_HWCFGR_I2S_SUPPORT_MASK, val)) {
+			dev_err(&pdev->dev,
+				"Device does not support i2s mode\n");
+			return -EPERM;
+		}
+
+		ret = regmap_read(i2s->regmap, STM32_I2S_VERR_REG, &val);
+
+		dev_dbg(&pdev->dev, "I2S version: %lu.%lu registered\n",
+			FIELD_GET(I2S_VERR_MAJ_MASK, val),
+			FIELD_GET(I2S_VERR_MIN_MASK, val));
+	}
+
+	return ret;
 }
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
