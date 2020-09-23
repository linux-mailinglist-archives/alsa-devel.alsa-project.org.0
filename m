Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796402758AF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5631714;
	Wed, 23 Sep 2020 15:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5631714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600867725;
	bh=iS9ijokL5VTiqdy9zSIpEus27bgv5etf+ipxckklrnw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTBzvsfU6ggmGN1ZsuBD9RQ7KKYlDnyxursXHtgsvSSCd0lGQ5Q8JgnJxBQzHFyce
	 RJRo5caunfFmUvtFzQNO6twThCWpVHJ+TtoroicXPGwcNvygm8Nkl9hZi3m7kxybZo
	 go+eQq4TRsaMas2OXJyt2V8KlXAwfVU1V0mIDtxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8BFF8028D;
	Wed, 23 Sep 2020 15:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BA03F8021C; Wed, 23 Sep 2020 15:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6AECF8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6AECF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M/d6XM2s"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NDQCQD079389;
 Wed, 23 Sep 2020 08:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600867572;
 bh=ZKiXsCyFH49FaSg68E/xdxS8xr974JRMhnT+8/P7hzA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=M/d6XM2swew6MCehSRqLwp9wEBofLOVGPt/sGTU0TnZb0HMHMVOFcJBUFeqF9WIKG
 eeRl65d3f1xOtjZ7jzxzzbbmAP51x8wqBf3LpZNTR1nG2icXEUwVIbWEfPGLkl6/hb
 SPNv8+lPV47717IGjqmG9C17b4kmA66n0VYNgBcY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NDQBDt101551
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 08:26:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 08:26:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 08:26:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NDQBMk072993;
 Wed, 23 Sep 2020 08:26:11 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 2/6] ASoC: tas2770: Add shutdown capability via a GPIO
Date: Wed, 23 Sep 2020 08:25:56 -0500
Message-ID: <20200923132600.10652-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923132600.10652-1-dmurphy@ti.com>
References: <20200923132600.10652-1-dmurphy@ti.com>
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

Add the hardware shutdown mechanism to shutdown and wake up the device
via a GPIO.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 53 ++++++++++++++++++++++++++++----------
 sound/soc/codecs/tas2770.h |  1 +
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 386aaa11fa08..9f7363927c50 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -79,28 +79,42 @@ static int tas2770_set_bias_level(struct snd_soc_component *component,
 #ifdef CONFIG_PM
 static int tas2770_codec_suspend(struct snd_soc_component *component)
 {
-	int ret;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					    TAS2770_PWR_CTRL_MASK,
-					    TAS2770_PWR_CTRL_SHUTDOWN);
-	if (ret < 0)
-		return ret;
+	if (tas2770->sdz_gpio) {
+		gpiod_set_value_cansleep(tas2770->sdz_gpio, 0);
+	} else {
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
+		if (ret < 0)
+			return ret;
 
-	return 0;
+		ret = 0;
+	}
+
+	return ret;
 }
 
 static int tas2770_codec_resume(struct snd_soc_component *component)
 {
-	int ret;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					    TAS2770_PWR_CTRL_MASK,
-					    TAS2770_PWR_CTRL_ACTIVE);
-	if (ret < 0)
-		return ret;
+	if (tas2770->sdz_gpio) {
+		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+	} else {
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_ACTIVE);
+		if (ret < 0)
+			return ret;
 
-	return 0;
+		ret = 0;
+	}
+
+	return ret;
 }
 #else
 #define tas2770_codec_suspend NULL
@@ -498,6 +512,9 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 
 	tas2770->component = component;
 
+	if (tas2770->sdz_gpio)
+		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+
 	tas2770_reset(tas2770);
 
 	return 0;
@@ -650,6 +667,14 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = 2;
 	}
 
+	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(tas2770->sdz_gpio)) {
+		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		tas2770->sdz_gpio = NULL;
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 07e3556fc702..b3fc4a487033 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -134,6 +134,7 @@ struct tas2770_priv {
 	int power_state;
 	int asi_format;
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *sdz_gpio;
 	int sampling_rate;
 	int channel_size;
 	int slot_width;
-- 
2.28.0

