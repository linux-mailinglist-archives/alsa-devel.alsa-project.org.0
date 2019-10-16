Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DECD8C10
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 11:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B761847;
	Wed, 16 Oct 2019 11:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B761847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571216453;
	bh=4Fj7FZfYAX6LwsZzdQ0yWBp4WfNzp+mwDH32z3IdtnE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NGTUfOTDNbGGyOQZtJETjpqnSzNFc0QazutnvGLs6hi0zpC1CV9k+WG7ZrE/EL7Jo
	 +w64+EEGekeQtnDq6IhKo3e2wV2Yw1N5WOi1ZWE0lDrIrN3TB40qKWWS2iUsxENGNN
	 6hHUCLGAZIMKe1KrRXizSQWK9E/U+Bv2YVgU3+SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 399CAF80362;
	Wed, 16 Oct 2019 10:59:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF8C9F80377; Wed, 16 Oct 2019 10:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99684F8036C
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 10:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99684F8036C
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9G8wxJT002135,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9G8wxJT002135
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 16:58:59 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS12.realtek.com.tw (172.21.6.16) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 16:58:58 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 16 Oct 2019 16:58:45 +0800
Message-ID: <20191016085845.11672-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt1011: Read and apply r0 and
	temperature device property
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

From: Shuming Fan <shumingf@realtek.com>

Typically, the r0 (calibration data) and temperature were measured in the factory.
This information is written into the non-volatile area
where keeps data whether factory reset or OS update.
In Chromium OS case, the coreboot will read the info from VPD and create
the device property for each rt1011.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 41 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/rt1011.h |  1 +
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index b927e61b32df..ad049cfddcb0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2328,8 +2328,12 @@ static void rt1011_calibration_work(struct work_struct *work)
 	struct rt1011_priv *rt1011 =
 		container_of(work, struct rt1011_priv, cali_work);
 	struct snd_soc_component *component = rt1011->component;
+	unsigned int r0_integer, r0_factor, format;
 
-	rt1011_calibrate(rt1011, 1);
+	if (rt1011->r0_calib)
+		rt1011_calibrate(rt1011, 0);
+	else
+		rt1011_calibrate(rt1011, 1);
 
 	/*
 	 * This flag should reset after booting.
@@ -2340,6 +2344,39 @@ static void rt1011_calibration_work(struct work_struct *work)
 
 	/* initial */
 	rt1011_reg_init(component);
+
+	/* Apply temperature and calibration data from device property */
+	if (rt1011->temperature_calib) {
+		snd_soc_component_update_bits(component,
+			RT1011_STP_INITIAL_RESISTANCE_TEMP, 0x3ff,
+			(rt1011->temperature_calib << 2));
+	}
+
+	if (rt1011->r0_calib) {
+		rt1011->r0_reg = rt1011->r0_calib;
+
+		format = 2147483648U; /* 2^24 * 128 */
+		r0_integer = format / rt1011->r0_reg / 128;
+		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
+						- (r0_integer * 100);
+		dev_info(component->dev,	"DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
+			r0_integer, r0_factor, rt1011->r0_reg);
+
+		rt1011_r0_load(rt1011);
+	}
+}
+
+static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,temperature_calib",
+		&rt1011->temperature_calib);
+	device_property_read_u32(dev, "realtek,r0_calib",
+		&rt1011->r0_calib);
+
+	dev_dbg(dev, "%s: r0_calib: 0x%x, temperture_calib: 0x%x",
+		__func__, rt1011->r0_calib, rt1011->temperature_calib);
+
+	return 0;
 }
 
 static int rt1011_i2c_probe(struct i2c_client *i2c,
@@ -2356,6 +2393,8 @@ static int rt1011_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, rt1011);
 
+	rt1011_parse_dp(rt1011, &i2c->dev);
+
 	rt1011->regmap = devm_regmap_init_i2c(i2c, &rt1011_regmap);
 	if (IS_ERR(rt1011->regmap)) {
 		ret = PTR_ERR(rt1011->regmap);
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 3f7dea1191ad..68fadc15fa8c 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -690,6 +690,7 @@ struct rt1011_priv {
 
 	int bq_drc_set;
 	unsigned int r0_reg, cali_done;
+	unsigned int r0_calib, temperature_calib;
 	int recv_spk_mode;
 };
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
