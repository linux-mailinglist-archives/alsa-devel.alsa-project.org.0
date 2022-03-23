Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E722A4E4BE8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 05:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F5D1726;
	Wed, 23 Mar 2022 05:28:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F5D1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648009751;
	bh=2gkTWFpYnvGgaMzv+JcgMJAjuWSleOxCy+S0daextVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRz8ss0IUcFzpPtGF2/Lo6gxP90gOwFhH9NLnkGorsXXqStlSGf7E3MrNmKYjIFed
	 nBFR2GVpCbVaLKXte0rATAnjvhKUDQjVd3rvUEM08r++Eg2AXNF08yvY1awR8SDupJ
	 heW60hKM91+4jBMcJaIL6ixJRnwNNkAUFLrsPXzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6508F8051C;
	Wed, 23 Mar 2022 05:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CE0F800C1; Wed, 23 Mar 2022 05:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED02F802DB
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 05:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED02F802DB
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-35-12049 (RichMail) with SMTP id 2f11623aa18b8b8-888f6;
 Wed, 23 Mar 2022 12:27:17 +0800 (CST)
X-RM-TRANSID: 2f11623aa18b8b8-888f6
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v4 3/3] update tas27xx.h to support either TAS2764 or TAS2780
Date: Wed, 23 Mar 2022 12:26:44 +0800
Message-Id: <20220323042644.635-3-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323042644.635-1-13691752556@139.com>
References: <20220323042644.635-1-13691752556@139.com>
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
 sound/soc/codecs/tas27xx.h | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
index 67d6fd903c42..02b29c030d37 100644
--- a/sound/soc/codecs/tas27xx.h
+++ b/sound/soc/codecs/tas27xx.h
@@ -1,18 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
+ * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780
+ *		Mono Audio Amplifier
  *
- * Copyright (C) 2020 Texas Instruments Incorporated -  https://www.ti.com
+ * Copyright (C) 2022 Texas Instruments Incorporated -
+ *		https://www.ti.com
  *
- * Author: Dan Murphy <dmurphy@ti.com>
+ * Author:
  */
 
-#ifndef __TAS2764__
-#define __TAS2764__
+#ifndef __TAS27XX__H_
+#define __TAS27XX__H_
 
 /* Book Control Register */
-#define TAS2764_BOOKCTL_PAGE	0
-#define TAS2764_BOOKCTL_REG	127
+#define TAS27XX_BOOKCTL_PAGE	0
+#define TAS27XX_BOOKCTL_REG	127
 #define TAS2764_REG(page, reg)	((page * 128) + reg)
 
 /* Page */
@@ -77,6 +79,10 @@
 #define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
 #define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
 
+/* TDM Configuration Reg4 */
+#define TAS2764_TDM_CFG4		TAS2764_REG(0X0, 0x0d)
+#define TAS2764_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
+
 /* TDM Configuration Reg5 */
 #define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
 #define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
@@ -89,4 +95,9 @@
 #define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
 #define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
 
-#endif /* __TAS2764__ */
+/* INT&CLK CFG */
+#define TAS27XX_CLK_CFG			TAS2764_REG(0X0, 0x5c)
+#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
+#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
+
+#endif /* __TAS27XX__H_ */
\ No newline at end of file
-- 
2.35.1


