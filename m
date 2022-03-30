Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2B4EC701
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 16:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9D9E11;
	Wed, 30 Mar 2022 16:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9D9E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648651690;
	bh=Ob3mB6kJCb3VcxN/7e9S17Y0oQkjOPIyl3r3qE2WeXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+wZgHiJ6nN7S8EifLXRZFcaKfRgQ/qC0lv2DdyXvOwm8gnlksnKBrXabCl0zh8Ws
	 jyoXOTD23M0kgPEEtaZt0FaCr7xHbDC+o+aUwWG62Ed/qsvFejAbWQG0O0k4l/oLIr
	 4j0FqYhdg3Kej+04yBbRjp/ID/ZfzgpqXzRfqMy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 462D1F8025A;
	Wed, 30 Mar 2022 16:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D67AFF80425; Wed, 30 Mar 2022 16:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734CFF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 16:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734CFF800F2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[223.73.211.113])
 by rmsmtp-lg-appmail-19-12022 (RichMail) with SMTP id 2ef662446d35717-f0abb;
 Wed, 30 Mar 2022 22:46:45 +0800 (CST)
X-RM-TRANSID: 2ef662446d35717-f0abb
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v5 2/4] update tas27xx.h to support either TAS2764 or TAS2780
Date: Wed, 30 Mar 2022 22:45:24 +0800
Message-Id: <20220330144526.498-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330144526.498-1-13691752556@139.com>
References: <20220330144526.498-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/tas27xx.h | 131 ++++++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 61 deletions(-)

diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
index 67d6fd903c42..95923e437a38 100644
--- a/sound/soc/codecs/tas27xx.h
+++ b/sound/soc/codecs/tas27xx.h
@@ -1,92 +1,101 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
+ * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780 Mono Audio Amplifier
  *
- * Copyright (C) 2020 Texas Instruments Incorporated -  https://www.ti.com
+ * Copyright (C) 2020-2022 Texas Instruments Incorporated - https://www.ti.com
  *
- * Author: Dan Murphy <dmurphy@ti.com>
+ * Author: Raphael Xu <raphael-xu@ti.com>
  */
 
-#ifndef __TAS2764__
-#define __TAS2764__
+#ifndef __TAS27XX_H__
+#define __TAS27XX_H__
 
 /* Book Control Register */
-#define TAS2764_BOOKCTL_PAGE	0
-#define TAS2764_BOOKCTL_REG	127
-#define TAS2764_REG(page, reg)	((page * 128) + reg)
+#define TAS27XX_BOOKCTL_PAGE	0
+#define TAS27XX_BOOKCTL_REG	127
+#define TAS27XX_REG(page, reg)	((page * 128) + reg)
 
 /* Page */
-#define TAS2764_PAGE		TAS2764_REG(0X0, 0x00)
-#define TAS2764_PAGE_PAGE_MASK	255
+#define TAS27XX_PAGE		TAS27XX_REG(0X0, 0x00)
+#define TAS27XX_PAGE_PAGE_MASK	255
 
 /* Software Reset */
-#define TAS2764_SW_RST	TAS2764_REG(0X0, 0x01)
-#define TAS2764_RST	BIT(0)
+#define TAS27XX_SW_RST	TAS27XX_REG(0X0, 0x01)
+#define TAS27XX_RST	BIT(0)
 
 /* Power Control */
-#define TAS2764_PWR_CTRL		TAS2764_REG(0X0, 0x02)
-#define TAS2764_PWR_CTRL_MASK		GENMASK(1, 0)
-#define TAS2764_PWR_CTRL_ACTIVE		0x0
-#define TAS2764_PWR_CTRL_MUTE		BIT(0)
-#define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)
+#define TAS27XX_PWR_CTRL		TAS27XX_REG(0X0, 0x02)
+#define TAS27XX_PWR_CTRL_MASK		GENMASK(1, 0)
+#define TAS27XX_PWR_CTRL_ACTIVE		0x0
+#define TAS27XX_PWR_CTRL_MUTE		BIT(0)
+#define TAS27XX_PWR_CTRL_SHUTDOWN	BIT(1)
 
-#define TAS2764_VSENSE_POWER_EN		3
-#define TAS2764_ISENSE_POWER_EN		4
+#define TAS27XX_VSENSE_POWER_EN		3
+#define TAS27XX_ISENSE_POWER_EN		4
 
 /* Digital Volume Control */
-#define TAS2764_DVC	TAS2764_REG(0X0, 0x1a)
-#define TAS2764_DVC_MAX	0xc9
+#define TAS27XX_DVC	TAS27XX_REG(0X0, 0x1a)
+#define TAS27XX_DVC_MAX	0xc9
 
-#define TAS2764_CHNL_0  TAS2764_REG(0X0, 0x03)
+#define TAS27XX_CHNL_0  TAS27XX_REG(0X0, 0x03)
 
 /* TDM Configuration Reg0 */
-#define TAS2764_TDM_CFG0		TAS2764_REG(0X0, 0x08)
-#define TAS2764_TDM_CFG0_SMP_MASK	BIT(5)
-#define TAS2764_TDM_CFG0_SMP_48KHZ	0x0
-#define TAS2764_TDM_CFG0_SMP_44_1KHZ	BIT(5)
-#define TAS2764_TDM_CFG0_MASK		GENMASK(3, 1)
-#define TAS2764_TDM_CFG0_44_1_48KHZ	BIT(3)
-#define TAS2764_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
+#define TAS27XX_TDM_CFG0		TAS27XX_REG(0X0, 0x08)
+#define TAS27XX_TDM_CFG0_SMP_MASK	BIT(5)
+#define TAS27XX_TDM_CFG0_SMP_48KHZ	0x0
+#define TAS27XX_TDM_CFG0_SMP_44_1KHZ	BIT(5)
+#define TAS27XX_TDM_CFG0_MASK		GENMASK(3, 1)
+#define TAS27XX_TDM_CFG0_44_1_48KHZ	BIT(3)
+#define TAS27XX_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
 
 /* TDM Configuration Reg1 */
-#define TAS2764_TDM_CFG1		TAS2764_REG(0X0, 0x09)
-#define TAS2764_TDM_CFG1_MASK		GENMASK(5, 1)
-#define TAS2764_TDM_CFG1_51_SHIFT	1
-#define TAS2764_TDM_CFG1_RX_MASK	BIT(0)
-#define TAS2764_TDM_CFG1_RX_RISING	0x0
-#define TAS2764_TDM_CFG1_RX_FALLING	BIT(0)
+#define TAS27XX_TDM_CFG1		TAS27XX_REG(0X0, 0x09)
+#define TAS27XX_TDM_CFG1_MASK		GENMASK(5, 1)
+#define TAS27XX_TDM_CFG1_51_SHIFT	1
+#define TAS27XX_TDM_CFG1_RX_MASK	BIT(0)
+#define TAS27XX_TDM_CFG1_RX_RISING	0x0
+#define TAS27XX_TDM_CFG1_RX_FALLING	BIT(0)
 
 /* TDM Configuration Reg2 */
-#define TAS2764_TDM_CFG2		TAS2764_REG(0X0, 0x0a)
-#define TAS2764_TDM_CFG2_RXW_MASK	GENMASK(3, 2)
-#define TAS2764_TDM_CFG2_RXW_16BITS	0x0
-#define TAS2764_TDM_CFG2_RXW_24BITS	BIT(3)
-#define TAS2764_TDM_CFG2_RXW_32BITS	(BIT(3) | BIT(2))
-#define TAS2764_TDM_CFG2_RXS_MASK	GENMASK(1, 0)
-#define TAS2764_TDM_CFG2_RXS_16BITS	0x0
-#define TAS2764_TDM_CFG2_RXS_24BITS	BIT(0)
-#define TAS2764_TDM_CFG2_RXS_32BITS	BIT(1)
-#define TAS2764_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
-#define TAS2764_TDM_CFG2_SCFG_I2S	0x0
-#define TAS2764_TDM_CFG2_SCFG_LEFT_J	BIT(4)
-#define TAS2764_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
+#define TAS27XX_TDM_CFG2		TAS27XX_REG(0X0, 0x0a)
+#define TAS27XX_TDM_CFG2_RXW_MASK	GENMASK(3, 2)
+#define TAS27XX_TDM_CFG2_RXW_16BITS	0x0
+#define TAS27XX_TDM_CFG2_RXW_24BITS	BIT(3)
+#define TAS27XX_TDM_CFG2_RXW_32BITS	(BIT(3) | BIT(2))
+#define TAS27XX_TDM_CFG2_RXS_MASK	GENMASK(1, 0)
+#define TAS27XX_TDM_CFG2_RXS_16BITS	0x0
+#define TAS27XX_TDM_CFG2_RXS_24BITS	BIT(0)
+#define TAS27XX_TDM_CFG2_RXS_32BITS	BIT(1)
+#define TAS27XX_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
+#define TAS27XX_TDM_CFG2_SCFG_I2S	0x0
+#define TAS27XX_TDM_CFG2_SCFG_LEFT_J	BIT(4)
+#define TAS27XX_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
 
 /* TDM Configuration Reg3 */
-#define TAS2764_TDM_CFG3		TAS2764_REG(0X0, 0x0c)
-#define TAS2764_TDM_CFG3_RXS_MASK	GENMASK(7, 4)
-#define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
-#define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
+#define TAS27XX_TDM_CFG3		TAS27XX_REG(0X0, 0x0c)
+#define TAS27XX_TDM_CFG3_RXS_MASK	GENMASK(7, 4)
+#define TAS27XX_TDM_CFG3_RXS_SHIFT	0x4
+#define TAS27XX_TDM_CFG3_MASK		GENMASK(3, 0)
+
+/* TDM Configuration Reg4 */
+#define TAS27XX_TDM_CFG4		TAS27XX_REG(0X0, 0x0d)
+#define TAS27XX_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
 
 /* TDM Configuration Reg5 */
-#define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
-#define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
-#define TAS2764_TDM_CFG5_VSNS_ENABLE	BIT(6)
-#define TAS2764_TDM_CFG5_50_MASK	GENMASK(5, 0)
+#define TAS27XX_TDM_CFG5		TAS27XX_REG(0X0, 0x0e)
+#define TAS27XX_TDM_CFG5_VSNS_MASK	BIT(6)
+#define TAS27XX_TDM_CFG5_VSNS_ENABLE	BIT(6)
+#define TAS27XX_TDM_CFG5_50_MASK	GENMASK(5, 0)
 
 /* TDM Configuration Reg6 */
-#define TAS2764_TDM_CFG6		TAS2764_REG(0X0, 0x0f)
-#define TAS2764_TDM_CFG6_ISNS_MASK	BIT(6)
-#define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
-#define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
+#define TAS27XX_TDM_CFG6		TAS27XX_REG(0X0, 0x0f)
+#define TAS27XX_TDM_CFG6_ISNS_MASK	BIT(6)
+#define TAS27XX_TDM_CFG6_ISNS_ENABLE	BIT(6)
+#define TAS27XX_TDM_CFG6_50_MASK	GENMASK(5, 0)
+
+/* INT&CLK CFG */
+#define TAS27XX_CLK_CFG			TAS27XX_REG(0X0, 0x5c)
+#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
+#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
 
-#endif /* __TAS2764__ */
+#endif /* __TAS27XX_H__ */
-- 
2.35.1


