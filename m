Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E714A69
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCB218CC;
	Mon,  6 May 2019 14:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCB218CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557147458;
	bh=MveIWWaL8h8UsfBSga4iKRrwqnRa06LtwY22s/z9MWI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHxHI3F0ZL4X+qppy6PB/lliCV95dqg7bS5xJOcgqrc1c9xtkixr4qkFd29jB9kVX
	 bM8nee1+7pMISzBZ8PcLI1dBeSUU2bPxgpXh7P2US3ZDm9mg4rxySAi/eiEO69sUrR
	 e59ikjT157SvHOz24AjYQVvGL6GqoCUG2yI50mHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D76CF8972C;
	Mon,  6 May 2019 14:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87296F89705; Mon,  6 May 2019 14:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9EE5F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9EE5F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="F0Jm5VSc"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46CkflF011958; Mon, 6 May 2019 14:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=92DnEj1hB/oVaDvk+JizWveVsX8kT8C4r3Oqx0ymrA4=;
 b=F0Jm5VScMzUIeYXbmYaTFg+8vgMGdOj8IzGZMCfFK1GjlpDLqHewaUO7+RLKhUnzR/6B
 tGD8NlOLM26NwONpSWWTqvw/GvE+TzMTIqceXBXCQgqccdUXYXhpclzOphZY8aY1P1Fp
 K89FxPaSG8rUvCxjEPa8BzIAvuWfSCg4T6S4yMROlWNR7TbiUWkKKNb0hdAjZS2sY0cm
 MGx72SXfOn4rOIQJC6GCn9JFM65ZBtqX55pYJQlUNe5+3Zv5S+q2InJ75cBa33mszE9g
 PmHEWrA79Th5qC92zynN6TVb6T2LF+AiWDEqZR6gtvbfNtdNwA6NdnPCKdxfTew/STEl vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c39ge4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:54:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53B0431;
 Mon,  6 May 2019 12:54:27 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30B5E25BA;
 Mon,  6 May 2019 12:54:27 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 14:54:27 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:54:26
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:54:12 +0200
Message-ID: <1557147252-18679-3-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557147252-18679-1-git-send-email-olivier.moysan@st.com>
References: <1557147252-18679-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: stm32: i2s: manage identification
	registers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support of identification registers in STM32 I2S.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_i2s.c | 60 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 8ee697ff1f86..8846f49b2951 100644
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
@@ -865,6 +892,7 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
+	u32 val;
 	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
@@ -903,8 +931,34 @@ static int stm32_i2s_probe(struct platform_device *pdev)
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
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
