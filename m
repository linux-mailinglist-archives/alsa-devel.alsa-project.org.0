Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699045B4E8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEB8166E;
	Wed, 24 Nov 2021 08:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEB8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737706;
	bh=UCgKHC2tZnYuYDC6Ipdwr8BV7XMvnDZm9aoIDEwScgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+oMqXXjJxwnKawW3U7PAcJMinbWKreobc2YXdb6vX2g2Q43bKL9AaAnmBPqI+Xej
	 aZtQJ3WqzZkfAuCf7nGIiUcTQ8+w4ZduCic+YtqiAh3iuwrwFI/XPnQPKNtAN2SFJj
	 uyrnI7mZn0+CyYl2DINl4J9mC85LxWCt0yTY2gmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E10F804F1;
	Wed, 24 Nov 2021 08:05:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EF5F804FD; Tue, 23 Nov 2021 17:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03859F804E4
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03859F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QrHPpT7Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANCeXB8012277;
 Tue, 23 Nov 2021 10:31:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Z4waY4CUfZqZb4PuHTMV15Sbyi91pjjmEvXyAxHUB7A=;
 b=QrHPpT7Ym5aDKWrW/3I7oodI+By3k5CQTAhWVXJDwq1AvKddySP+ULwbGEzf/PA99ZX6
 DthhlpNJjgZ+l5f8RI7zqttSmVQPAgWjSWqRc8bqexXHYk+9/22F2zKhl8VTUT5G/gR7
 wlYCSyhYVMMz3pu53i5UBb5/MK1As7hp9RI4SbiCcLsbM0yYyC4G/RV0W6STWVtp4tEJ
 uu1Byyz9YGLHsC65IsGoEhFdBdTo0zbqzNJHqPjkUSWu/TmrR8U1RX965QDi9h06SEkJ
 pnWeXN61CWf6WAUEqG24q2VNL9fAZNFsjZWxM81+iQ+//SNW8UUiaI/Nb41h5GO2YonH qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms21ng-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:31:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:54 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACB6B2A1;
 Tue, 23 Nov 2021 16:31:53 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH 04/11] ASoC: cs35l41: Create function for init array of
 Supplies
Date: Tue, 23 Nov 2021 16:31:42 +0000
Message-ID: <20211123163149.1530535-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: N3BFwnZQAho2AC0-k3McSh0EgDUUl1dq
X-Proofpoint-ORIG-GUID: N3BFwnZQAho2AC0-k3McSh0EgDUUl1dq
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
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

Both ASoC and HDA system have to initialize the arrays of supplies
in the same way, so create a function for that in shared code

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  5 ++++-
 sound/soc/codecs/cs35l41-lib.c | 29 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 23 +++--------------------
 3 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index ced80ede1def..5039e876bad1 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -536,7 +536,6 @@
 #define CS35L41_NUM_OTP_MAPS		5
 
 #define CS35L41_VALID_PDATA		0x80000000
-#define CS35L41_NUM_SUPPLIES            2
 
 #define CS35L41_SCLK_MSTR_MASK		0x10
 #define CS35L41_SCLK_MSTR_SHIFT		4
@@ -724,6 +723,8 @@
 #define CS35L41_SPI_MAX_FREQ		4000000
 #define CS35L41_REGSTRIDE		4
 
+#define CS35L41_NUM_SUPPLIES		2
+
 enum cs35l41_clk_ids {
 	CS35L41_CLKID_SCLK = 0,
 	CS35L41_CLKID_LRCLK = 1,
@@ -762,4 +763,6 @@ struct cs35l41_otp_map_element_t {
 extern struct regmap_config cs35l41_regmap_i2c;
 extern struct regmap_config cs35l41_regmap_spi;
 
+int cs35l41_init_supplies(struct device *dev, struct regulator_bulk_data *supplies);
+
 #endif /* __CS35L41_H */
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 04f59cda5126..4aba0f90b876 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -7,6 +7,7 @@
 // Author: David Rhodes <david.rhodes@cirrus.com>
 // Author: Lucas Tanure <lucas.tanure@cirrus.com>
 
+#include <linux/regulator/consumer.h>
 #include <sound/cs35l41.h>
 
 const struct reg_default cs35l41_reg[] = {
@@ -690,6 +691,11 @@ const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS]
 	},
 };
 
+static const char * const cs35l41_supplies[CS35L41_NUM_SUPPLIES] = {
+	"VA",
+	"VP",
+};
+
 struct regmap_config cs35l41_regmap_i2c = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -720,3 +726,26 @@ struct regmap_config cs35l41_regmap_spi = {
 	.precious_reg = cs35l41_precious_reg,
 	.cache_type = REGCACHE_RBTREE,
 };
+
+int cs35l41_init_supplies(struct device *dev, struct regulator_bulk_data *supplies)
+{
+	int i, ret;
+
+	for (i = 0; i < CS35L41_NUM_SUPPLIES; i++)
+		supplies[i].supply = cs35l41_supplies[i];
+
+	ret = devm_regulator_bulk_get(dev, CS35L41_NUM_SUPPLIES, supplies);
+	if (ret != 0) {
+		dev_err(dev, "Failed to request core supplies: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(CS35L41_NUM_SUPPLIES, supplies);
+	if (ret != 0) {
+		dev_err(dev, "Failed to enable core supplies: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index e8e997efaa8b..c8709de41aaf 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -24,11 +24,6 @@
 
 #include "cs35l41.h"
 
-static const char * const cs35l41_supplies[CS35L41_NUM_SUPPLIES] = {
-	"VA",
-	"VP",
-};
-
 struct cs35l41_pll_sysclk_config {
 	int freq;
 	int clk_cfg;
@@ -1526,7 +1521,7 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 int cs35l41_probe(struct cs35l41_private *cs35l41,
 		  struct cs35l41_platform_data *pdata)
 {
-	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
+	u32 regid, reg_revid, mtl_revid, int_status, chipid_match;
 	int irq_pol = 0;
 	int ret;
 
@@ -1538,21 +1533,9 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 			return ret;
 	}
 
-	for (i = 0; i < CS35L41_NUM_SUPPLIES; i++)
-		cs35l41->supplies[i].supply = cs35l41_supplies[i];
-
-	ret = devm_regulator_bulk_get(cs35l41->dev, CS35L41_NUM_SUPPLIES,
-				      cs35l41->supplies);
-	if (ret != 0) {
-		dev_err(cs35l41->dev, "Failed to request core supplies: %d\n", ret);
+	ret = cs35l41_init_supplies(cs35l41->dev, cs35l41->supplies);
+	if (ret)
 		return ret;
-	}
-
-	ret = regulator_bulk_enable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
-	if (ret != 0) {
-		dev_err(cs35l41->dev, "Failed to enable core supplies: %d\n", ret);
-		return ret;
-	}
 
 	/* returning NULL can be an option if in stereo mode */
 	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
-- 
2.34.0

