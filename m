Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F32704B8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14B216BF;
	Fri, 18 Sep 2020 21:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14B216BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456229;
	bh=vE+zYyWYA4J0yLUF43KossADaLlg5ABNKaYGLrsQJtI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd8Q11EUS7kIakGufwLW7EaJTa2hk/h7JOFDtMHy8dQ0wU/m93L2Vws4d8MHRZXSd
	 lih0W/U0Sho6IaQHDvnL0NtnUSbJrMcDCIv+iQe9HyhmZEUrbNesr/VOsQdLqUu2kf
	 GOQnCpwE7V9Lr+zU9Krubp185GomeqeA8wEO4pXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86650F802EA;
	Fri, 18 Sep 2020 21:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 946F8F802E2; Fri, 18 Sep 2020 21:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FAFEF802D2
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAFEF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aucO90H1"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6BEI086326;
 Fri, 18 Sep 2020 14:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600455971;
 bh=5yA+pFpOpxj991U/d/o9Did1KXbSqklQkdzS0Oc82yY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=aucO90H1hGwfgV+v0RNllJNXMJR5M/eeXJkrHZE7Ws/qoGdSTAYYr5n4hsumZNhxj
 X9dSWLd9HReKK7n/dx7nQcg1YxWF+AVJ8Ake9sFvjJD4JICYUDwOySI6JY0uELh7Xu
 XgD2sgliFRLCsxnT3evAK9Fo86ov/zlK2R0DRN88=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IJ6BVp048258
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 14:06:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:06:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:06:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6BRg083603;
 Fri, 18 Sep 2020 14:06:11 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 6/9] ASoC: tas2770: Convert bit mask to GENMASK in header
Date: Fri, 18 Sep 2020 14:05:45 -0500
Message-ID: <20200918190548.12598-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918190548.12598-1-dmurphy@ti.com>
References: <20200918190548.12598-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Update the hardcoded masks with the GENMASK macro. Also update some of
the hardcoded bits with the BIT macro

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.h | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 96683971ee9b..07e3556fc702 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -19,7 +19,7 @@
 #define TAS2770_RST  BIT(0)
     /* Power Control */
 #define TAS2770_PWR_CTRL  TAS2770_REG(0X0, 0x02)
-#define TAS2770_PWR_CTRL_MASK  0x3
+#define TAS2770_PWR_CTRL_MASK  GENMASK(1, 0)
 #define TAS2770_PWR_CTRL_ACTIVE  0x0
 #define TAS2770_PWR_CTRL_MUTE  BIT(0)
 #define TAS2770_PWR_CTRL_SHUTDOWN  0x2
@@ -37,43 +37,43 @@
 #define TAS2770_TDM_CFG_REG0_SMP_MASK  BIT(5)
 #define TAS2770_TDM_CFG_REG0_SMP_48KHZ  0x0
 #define TAS2770_TDM_CFG_REG0_SMP_44_1KHZ  BIT(5)
-#define TAS2770_TDM_CFG_REG0_31_MASK  0xe
+#define TAS2770_TDM_CFG_REG0_31_MASK  GENMASK(3, 1)
 #define TAS2770_TDM_CFG_REG0_31_44_1_48KHZ  0x6
 #define TAS2770_TDM_CFG_REG0_31_88_2_96KHZ  0x8
 #define TAS2770_TDM_CFG_REG0_31_176_4_192KHZ  0xa
     /* TDM Configuration Reg1 */
 #define TAS2770_TDM_CFG_REG1  TAS2770_REG(0X0, 0x0B)
-#define TAS2770_TDM_CFG_REG1_MASK 0x3e
+#define TAS2770_TDM_CFG_REG1_MASK	GENMASK(5, 1)
 #define TAS2770_TDM_CFG_REG1_51_SHIFT  1
 #define TAS2770_TDM_CFG_REG1_RX_MASK  BIT(0)
 #define TAS2770_TDM_CFG_REG1_RX_RSING  0x0
 #define TAS2770_TDM_CFG_REG1_RX_FALING  BIT(0)
     /* TDM Configuration Reg2 */
 #define TAS2770_TDM_CFG_REG2  TAS2770_REG(0X0, 0x0C)
-#define TAS2770_TDM_CFG_REG2_RXW_MASK  0xc
+#define TAS2770_TDM_CFG_REG2_RXW_MASK	GENMASK(3, 2)
 #define TAS2770_TDM_CFG_REG2_RXW_16BITS  0x0
 #define TAS2770_TDM_CFG_REG2_RXW_24BITS  0x8
 #define TAS2770_TDM_CFG_REG2_RXW_32BITS  0xc
-#define TAS2770_TDM_CFG_REG2_RXS_MASK    0x3
+#define TAS2770_TDM_CFG_REG2_RXS_MASK    GENMASK(1, 0)
 #define TAS2770_TDM_CFG_REG2_RXS_16BITS  0x0
 #define TAS2770_TDM_CFG_REG2_RXS_24BITS  BIT(0)
 #define TAS2770_TDM_CFG_REG2_RXS_32BITS  0x2
     /* TDM Configuration Reg3 */
 #define TAS2770_TDM_CFG_REG3  TAS2770_REG(0X0, 0x0D)
-#define TAS2770_TDM_CFG_REG3_RXS_MASK  0xf0
+#define TAS2770_TDM_CFG_REG3_RXS_MASK  GENMASK(7, 4)
 #define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
-#define TAS2770_TDM_CFG_REG3_30_MASK  0xf
+#define TAS2770_TDM_CFG_REG3_30_MASK  GENMASK(3, 0)
 #define TAS2770_TDM_CFG_REG3_30_SHIFT 0
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
 #define TAS2770_TDM_CFG_REG5_VSNS_ENABLE  BIT(6)
-#define TAS2770_TDM_CFG_REG5_50_MASK  0x3f
+#define TAS2770_TDM_CFG_REG5_50_MASK	GENMASK(5, 0)
     /* TDM Configuration Reg6 */
 #define TAS2770_TDM_CFG_REG6  TAS2770_REG(0X0, 0x10)
 #define TAS2770_TDM_CFG_REG6_ISNS_MASK  BIT(6)
 #define TAS2770_TDM_CFG_REG6_ISNS_ENABLE  BIT(6)
-#define TAS2770_TDM_CFG_REG6_50_MASK  0x3f
+#define TAS2770_TDM_CFG_REG6_50_MASK  GENMASK(5, 0)
     /* Brown Out Prevention Reg0 */
 #define TAS2770_BO_PRV_REG0  TAS2770_REG(0X0, 0x1B)
     /* Interrupt MASK Reg0 */
@@ -116,15 +116,16 @@
     /* Revision and PG ID */
 #define TAS2770_REV_AND_GPID  TAS2770_REG(0X0, 0x7D)
 
-#define TAS2770_POWER_ACTIVE 0
-#define TAS2770_POWER_MUTE 1
-#define TAS2770_POWER_SHUTDOWN 2
-#define ERROR_OVER_CURRENT  0x0000001
-#define ERROR_DIE_OVERTEMP  0x0000002
-#define ERROR_OVER_VOLTAGE  0x0000004
-#define ERROR_UNDER_VOLTAGE 0x0000008
-#define ERROR_BROWNOUT      0x0000010
-#define ERROR_CLASSD_PWR    0x0000020
+#define TAS2770_POWER_ACTIVE	0
+#define TAS2770_POWER_MUTE	BIT(0)
+#define TAS2770_POWER_SHUTDOWN	BIT(1)
+
+#define ERROR_OVER_CURRENT  BIT(0)
+#define ERROR_DIE_OVERTEMP  BIT(1)
+#define ERROR_OVER_VOLTAGE  BIT(2)
+#define ERROR_UNDER_VOLTAGE BIT(3)
+#define ERROR_BROWNOUT      BIT(4)
+#define ERROR_CLASSD_PWR    BIT(5)
 
 struct tas2770_priv {
 	struct device *dev;
-- 
2.28.0

