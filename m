Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD954323090
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D59168B;
	Tue, 23 Feb 2021 19:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D59168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614104609;
	bh=BgVXZuyme4bdE/ErwL5mQe5p5qim7XkbnJU07pOF+RU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mU2Ny7PaYUFk1Ie3ddXBZy0aK7mqijETG+vHUuZzSx8iMzz/5O4U8KCAx97FO1/yI
	 qzwet27b2MPTehwwfYHy3xpVglHshkROinbHPGusyuwsRz83hJkjYWv9BpPQdfOCQU
	 NeAJKzitzDv0heR650iHNbjsRNI7RQUIFP376IFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 329B3F80475;
	Tue, 23 Feb 2021 19:20:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B25BBF80482; Tue, 23 Feb 2021 19:20:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE34CF80430
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE34CF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="E/jkUeU7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614104426; x=1645640426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BgVXZuyme4bdE/ErwL5mQe5p5qim7XkbnJU07pOF+RU=;
 b=E/jkUeU7RisuuTxTc28kLl/Iras7nhJDGUzvmGi2b27jyH7p3QvUULlR
 GnD+JWuYZB94YcfJ953xNVuJtQim4GNrCES+ov7h04oBn9molw2IFdz8Z
 mBhzcOHnCZSenbq9u4GyqAOkwtA7kUFfwgUquC9YTl1MVeMQI/3uUT+tD
 PzBrCfXxmuPHvXEb44cDhx34MedVY8GWhdXkW3y3PMS9T0TXwy4omjUn1
 XEmwHN2MRl3CWvhEQp9YJzW8u3GJLE2YPB1lgu0T2HDwnTw7IBrprPkwp
 nhIyZKE7pk/NTo7ojU3d7UBCpHJozfarZtg9JBbX1pFqrYW+LdIjjrzY6 A==;
IronPort-SDR: N189BDjrhaPK/tbPXWj5427t5qSJbA1DXzINjVZHjy6UbF6340AQG+kQNUyjbmhJN5M2HBSMtd
 9ooAE13bx00fAmivYCpPU7YB+aHJORCIWPseAufU6ah9G+vyBaRj6b3lwDTAz4YpQoj7XKx1SF
 LijII990F901uEvsUgESdQDRziEcR+K0ScWDp7iBlud5QY9O4iOJjJgjKN1rnz6FYXMyJv4fDv
 xP7wp7KPpdB6ww3gor+XSUrDDiPRbf4yaTDhGXpbwhlYohj5yTIi4naI3BS5K0jqgCE8ZLVebQ
 64o=
X-IronPort-AV: E=Sophos;i="5.81,200,1610434800"; d="scan'208";a="116310894"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2021 11:20:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 23 Feb 2021 11:20:18 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 23 Feb 2021 11:20:15 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/7] ASoC: mchp-i2s-mcc: Add support to select TDM pins
Date: Tue, 23 Feb 2021 20:19:28 +0200
Message-ID: <20210223181929.444640-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
References: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

SAMA7G5's I2S-MCC has 4 pairs of DIN/DOUT pins. Since TDM only uses a
single pair of pins for synchronous capture and playback, the controller
needs to be told which of the pair is connected. This can be mentioned
using the "microchip,tdm-data-pair" property from DT. The property is
optional, useful only if TDM is used. If it's missing, DIN/DOUT 0 pins
will be used by default.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 52 +++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 52d3f43148dc..3d13efb11444 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -100,6 +100,8 @@
 #define MCHP_I2SMCC_MRA_DATALENGTH_8_BITS_COMPACT	(7 << 1)
 
 #define MCHP_I2SMCC_MRA_WIRECFG_MASK		GENMASK(5, 4)
+#define MCHP_I2SMCC_MRA_WIRECFG_TDM(pin)	(((pin) << 4) & \
+						 MCHP_I2SMCC_MRA_WIRECFG_MASK)
 #define MCHP_I2SMCC_MRA_WIRECFG_I2S_1_TDM_0	(0 << 4)
 #define MCHP_I2SMCC_MRA_WIRECFG_I2S_2_TDM_1	(1 << 4)
 #define MCHP_I2SMCC_MRA_WIRECFG_I2S_4_TDM_2	(2 << 4)
@@ -245,6 +247,7 @@ struct mchp_i2s_mcc_dev {
 	unsigned int				frame_length;
 	int					tdm_slots;
 	int					channels;
+	u8					tdm_data_pair;
 	unsigned int				gclk_use:1;
 	unsigned int				gclk_running:1;
 	unsigned int				tx_rdy:1;
@@ -589,6 +592,8 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 		if (!frame_length)
 			frame_length = 2 * params_physical_width(params);
 	} else if (dev->fmt & SND_SOC_DAIFMT_DSP_A) {
+		mra |= MCHP_I2SMCC_MRA_WIRECFG_TDM(dev->tdm_data_pair);
+
 		if (dev->tdm_slots) {
 			if (channels % 2 && channels * 2 <= dev->tdm_slots) {
 				/*
@@ -914,6 +919,45 @@ static const struct of_device_id mchp_i2s_mcc_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mchp_i2s_mcc_dt_ids);
 #endif
 
+static int mchp_i2s_mcc_soc_data_parse(struct platform_device *pdev,
+				       struct mchp_i2s_mcc_dev *dev)
+{
+	int err;
+
+	if (!dev->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
+
+	if (dev->soc->data_pin_pair_num == 1)
+		return 0;
+
+	err = of_property_read_u8(pdev->dev.of_node, "microchip,tdm-data-pair",
+				  &dev->tdm_data_pair);
+	if (err < 0 && err != -EINVAL) {
+		dev_err(&pdev->dev,
+			"bad property data for 'microchip,tdm-data-pair': %d",
+			err);
+		return err;
+	}
+	if (err == -EINVAL) {
+		dev_info(&pdev->dev,
+			"'microchip,tdm-data-pair' not found; assuming DIN/DOUT 0 for TDM\n");
+		dev->tdm_data_pair = 0;
+	} else {
+		if (dev->tdm_data_pair > dev->soc->data_pin_pair_num - 1) {
+			dev_err(&pdev->dev,
+				"invalid value for 'microchip,tdm-data-pair': %d\n",
+				dev->tdm_data_pair);
+			return -EINVAL;
+		}
+		dev_dbg(&pdev->dev, "TMD format on DIN/DOUT %d pins\n",
+			dev->tdm_data_pair);
+	}
+
+	return 0;
+}
+
 static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 {
 	struct mchp_i2s_mcc_dev *dev;
@@ -966,10 +1010,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	}
 
 	dev->soc = of_device_get_match_data(&pdev->dev);
-	if (!dev->soc) {
-		dev_err(&pdev->dev, "failed to get soc data\n");
-		return -ENODEV;
-	}
+	err = mchp_i2s_mcc_soc_data_parse(pdev, dev);
+	if (err < 0)
+		return err;
+
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
-- 
2.27.0

