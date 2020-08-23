Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A0E24ED6B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Aug 2020 16:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC6A1684;
	Sun, 23 Aug 2020 16:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC6A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598191373;
	bh=JPApKvGP38xr+NIOHsp9s2+03RdsCeQN1jNfDLjk1TE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4egNwjf741jwIuGKthvo+M1D6MOaj2W30OQWbbFdBeO1jpsv1Gl+ug8rnE91xwIU
	 aGAfa8suCPDGnzKaHvW/s7vERIvooDv5wFKsi4J0Ubuzp9Q/ipcxQZSGw40wsOPbvm
	 k34GwGh7GHrsan8xSVuPPQXTg7tiFxR9iq41naCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 293EEF800EB;
	Sun, 23 Aug 2020 16:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5829BF8025A; Sun, 23 Aug 2020 16:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 911FDF800C0
 for <alsa-devel@alsa-project.org>; Sun, 23 Aug 2020 16:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911FDF800C0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 734AF1A0924;
 Sun, 23 Aug 2020 16:00:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 14F221A0804;
 Sun, 23 Aug 2020 16:00:11 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E3011402E2;
 Sun, 23 Aug 2020 16:00:06 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: ak5558: Add regulator support
Date: Sun, 23 Aug 2020 21:54:37 +0800
Message-Id: <1598190877-9213-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598190877-9213-1-git-send-email-shengjiu.wang@nxp.com>
References: <1598190877-9213-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

"AVDD" is for analog power supply,  "DVDD" is for digital power
supply, they can improve the power management.

As the regulator is enabled in pm runtime resume, which is
behind the component driver probe, so accessing registers in
component driver probe will fail. Fix this issue by enabling
regcache_cache_only after pm_runtime_enable.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak5558.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 8179512129d3..2f076d5ee284 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 #include <sound/initval.h>
@@ -22,8 +23,15 @@
 
 #include "ak5558.h"
 
+#define AK5558_NUM_SUPPLIES 2
+static const char *ak5558_supply_names[AK5558_NUM_SUPPLIES] = {
+	"DVDD",
+	"AVDD",
+};
+
 /* AK5558 Codec Private Data */
 struct ak5558_priv {
+	struct regulator_bulk_data supplies[AK5558_NUM_SUPPLIES];
 	struct snd_soc_component component;
 	struct regmap *regmap;
 	struct i2c_client *i2c;
@@ -299,12 +307,22 @@ static int __maybe_unused ak5558_runtime_suspend(struct device *dev)
 	regcache_cache_only(ak5558->regmap, true);
 	ak5558_power_off(ak5558);
 
+	regulator_bulk_disable(ARRAY_SIZE(ak5558->supplies),
+			       ak5558->supplies);
 	return 0;
 }
 
 static int __maybe_unused ak5558_runtime_resume(struct device *dev)
 {
 	struct ak5558_priv *ak5558 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ak5558->supplies),
+				    ak5558->supplies);
+	if (ret != 0) {
+		dev_err(dev, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
 
 	ak5558_power_off(ak5558);
 	ak5558_power_on(ak5558);
@@ -350,6 +368,7 @@ static int ak5558_i2c_probe(struct i2c_client *i2c)
 {
 	struct ak5558_priv *ak5558;
 	int ret = 0;
+	int i;
 
 	ak5558 = devm_kzalloc(&i2c->dev, sizeof(*ak5558), GFP_KERNEL);
 	if (!ak5558)
@@ -367,6 +386,16 @@ static int ak5558_i2c_probe(struct i2c_client *i2c)
 	if (IS_ERR(ak5558->reset_gpiod))
 		return PTR_ERR(ak5558->reset_gpiod);
 
+	for (i = 0; i < ARRAY_SIZE(ak5558->supplies); i++)
+		ak5558->supplies[i].supply = ak5558_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(ak5558->supplies),
+				      ak5558->supplies);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_codec_dev_ak5558,
 				     &ak5558_dai, 1);
@@ -374,6 +403,7 @@ static int ak5558_i2c_probe(struct i2c_client *i2c)
 		return ret;
 
 	pm_runtime_enable(&i2c->dev);
+	regcache_cache_only(ak5558->regmap, true);
 
 	return 0;
 }
-- 
2.27.0

