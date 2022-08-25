Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FE5A12DD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE711621;
	Thu, 25 Aug 2022 16:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE711621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661436095;
	bh=vIjZxASKWtThHouzQLkhcll/VfdOISlTs4DTsWDKfR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDfEltr+FtbV+2oC5RCmb1SlSCmIXolGqzi0Fe3HCTd79RzA1sbWrvsEYm0guwv9E
	 yehr/oHrEaviIHwfci29HzCBDvqtA9+v0kzqB5lgBwzNE3n6H+F79QUKehqHlUkagt
	 aw9nEiafypT/DTslSXC3tDrc8Z7tQCLJvETVySck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B712F80525;
	Thu, 25 Aug 2022 16:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0F59F8025A; Thu, 25 Aug 2022 16:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 6114FF800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 15:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6114FF800BD
Received: from hq-00021.fritz.box (p57bc9ceb.dip0.t-ipconnect.de
 [87.188.156.235])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 4CC14421360;
 Thu, 25 Aug 2022 13:59:26 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 2/2] ASoC: max98396: Make data monitor featured configurable
Date: Thu, 25 Aug 2022 15:59:20 +0200
Message-Id: <20220825135920.2290959-2-daniel@zonque.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825135920.2290959-1-daniel@zonque.org>
References: <20220825135920.2290959-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
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

Allow the data monitor features to be enabled explicitly, and enable control
over their details.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 sound/soc/codecs/max98396.c | 103 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98396.h |  14 +++++
 2 files changed, 117 insertions(+)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 42479f3ab663..e1577d20c42f 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1486,6 +1486,87 @@ static int max98396_probe(struct snd_soc_component *component)
 			   MAX98396_CLK_MON_AUTO_RESTART_MASK,
 			   MAX98396_CLK_MON_AUTO_RESTART_MASK);
 
+	regmap_update_bits(max98396->regmap,
+			   MAX98396_R203F_ENABLE_CTRLS,
+			   MAX98396_CTRL_DMON_STUCK_EN_MASK,
+			   max98396->dmon_stuck_enable ?
+				MAX98396_CTRL_DMON_STUCK_EN_MASK : 0);
+
+	regmap_update_bits(max98396->regmap,
+			   MAX98396_R203F_ENABLE_CTRLS,
+			   MAX98396_CTRL_DMON_MAG_EN_MASK,
+			   max98396->dmon_mag_enable ?
+				MAX98396_CTRL_DMON_MAG_EN_MASK : 0);
+
+	switch (max98396->dmon_duration) {
+	case 64:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_DURATION_MASK, 0);
+		break;
+	case 256:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_DURATION_MASK, 1);
+		break;
+	case 1024:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_DURATION_MASK, 2);
+		break;
+	case 4096:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_DURATION_MASK, 3);
+		break;
+	default:
+		dev_err(component->dev, "Invalid DMON duration %d\n",
+			max98396->dmon_duration);
+	}
+
+	switch (max98396->dmon_stuck_threshold) {
+	case 15:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_STUCK_THRESH_MASK,
+				   0 << MAX98396_DMON_STUCK_THRESH_SHIFT);
+		break;
+	case 13:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_STUCK_THRESH_MASK,
+				   1 << MAX98396_DMON_STUCK_THRESH_SHIFT);
+		break;
+	case 22:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_STUCK_THRESH_MASK,
+				   2 << MAX98396_DMON_STUCK_THRESH_SHIFT);
+		break;
+	case 9:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_STUCK_THRESH_MASK,
+				   3 << MAX98396_DMON_STUCK_THRESH_SHIFT);
+		break;
+	default:
+		dev_err(component->dev, "Invalid DMON stuck threshold %d\n",
+			max98396->dmon_stuck_threshold);
+	}
+
+	switch (max98396->dmon_mag_threshold) {
+	case 2 ... 5:
+		regmap_update_bits(max98396->regmap,
+				   MAX98396_R2039_DATA_MON_CTRL,
+				   MAX98396_DMON_STUCK_THRESH_MASK,
+				   (5 - max98396->dmon_mag_threshold)
+					<< MAX98396_DMON_MAG_THRESH_SHIFT);
+		break;
+	default:
+		dev_err(component->dev, "Invalid DMON magnitude threshold %d\n",
+			max98396->dmon_mag_threshold);
+	}
+
 	/* Speaker Amplifier PCM RX Enable by default */
 	regmap_update_bits(max98396->regmap,
 			   MAX98396_R205E_PCM_RX_EN,
@@ -1619,6 +1700,28 @@ static void max98396_read_device_property(struct device *dev,
 		max98396->bypass_slot = value & 0xF;
 	else
 		max98396->bypass_slot = 0;
+
+	max98396->dmon_stuck_enable =
+		device_property_read_bool(dev, "adi,dmon-stuck-enable");
+
+	if (!device_property_read_u32(dev, "adi,dmon-stuck-threshold-bits", &value))
+		max98396->dmon_stuck_threshold = value;
+	else
+		max98396->dmon_stuck_threshold = 15;
+
+	max98396->dmon_mag_enable =
+		device_property_read_bool(dev, "adi,dmon-magnitude-enable");
+
+	if (!device_property_read_u32(dev, "adi,dmon-magnitude-threshold-bits", &value))
+		max98396->dmon_mag_threshold = value;
+	else
+		max98396->dmon_mag_threshold = 5;
+
+	if (!device_property_read_u32(dev, "adi,dmon-duration-msecs", &value))
+		max98396->dmon_duration = value;
+	else
+		max98396->dmon_duration = 64;
+
 }
 
 static void max98396_core_supplies_disable(void *priv)
diff --git a/sound/soc/codecs/max98396.h b/sound/soc/codecs/max98396.h
index 7278c779989a..d396aa3e698b 100644
--- a/sound/soc/codecs/max98396.h
+++ b/sound/soc/codecs/max98396.h
@@ -212,8 +212,17 @@
 #define MAX98396_CLK_MON_AUTO_RESTART_MASK	(0x1 << 0)
 #define MAX98396_CLK_MON_AUTO_RESTART_SHIFT	(0)
 
+/* MAX98396_R2039_DATA_MON_CTRL */
+#define MAX98396_DMON_MAG_THRESH_SHIFT		(4)
+#define MAX98396_DMON_MAG_THRESH_MASK		(0x3 << MAX98396_DMON_MAG_THRESH_SHIFT)
+#define MAX98396_DMON_STUCK_THRESH_SHIFT	(2)
+#define MAX98396_DMON_STUCK_THRESH_MASK		(0x3 << MAX98396_DMON_STUCK_THRESH_SHIFT)
+#define MAX98396_DMON_DURATION_MASK		(0x3)
+
 /* MAX98396_R203F_ENABLE_CTRLS */
 #define MAX98396_CTRL_CMON_EN_SHIFT		(0)
+#define MAX98396_CTRL_DMON_STUCK_EN_MASK	(0x1 << 1)
+#define MAX98396_CTRL_DMON_MAG_EN_MASK		(0x1 << 2)
 
 /* MAX98396_R2041_PCM_MODE_CFG */
 #define MAX98396_PCM_MODE_CFG_FORMAT_MASK	(0x7 << 3)
@@ -305,6 +314,11 @@ struct max98396_priv {
 	unsigned int i_slot;
 	unsigned int spkfb_slot;
 	unsigned int bypass_slot;
+	bool dmon_stuck_enable;
+	unsigned int dmon_stuck_threshold;
+	bool dmon_mag_enable;
+	unsigned int dmon_mag_threshold;
+	unsigned int dmon_duration;
 	bool interleave_mode;
 	bool tdm_mode;
 	int tdm_max_samplerate;
-- 
2.37.2

