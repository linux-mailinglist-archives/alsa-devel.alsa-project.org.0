Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26422AA2B0
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 14:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB6D168D;
	Thu,  5 Sep 2019 14:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB6D168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567685246;
	bh=Egx0YUUddOHvAQWb/dxzkvuhZmXs8Yii5FqPtZ6DWNI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ad+79E8O/zaQojsoLeP5/OnyaOk9ql7FsQ9ezuXz2B6JNPYuBKet9sISbF22kdOEh
	 MD8lBYyEdfDLqpqQp/AEI704GXjnY82d7o+MHHt5hW23g2KgRBxI0dB5vzeD8Imu83
	 CXYg5K5Ho2INr5SnYhBUwCp7Oc/2c6WZKEi76EKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E464CF80642;
	Thu,  5 Sep 2019 14:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38A5F805FF; Thu,  5 Sep 2019 14:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79651F802DF
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 14:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79651F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="qVswcN+P"
Received: by mail-wm1-x341.google.com with SMTP id k1so2491976wmi.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klSkJhbs0NB+xI0c1ebxNosV7pVJl7beazxfFo4LBZg=;
 b=qVswcN+PucNQH6v4EQigxCZdHKTEzMwj6G2zSXUlL9Q3vyaySUauYMtEwxR5tBfkTX
 Vl/wABaSlML2K61iULZEg9ci45M0aAYXwsUTPRKD55tXQk4EtDd41q/6q033f5nkHvfJ
 +qHF+b/8Kowqxp9iuzSOMwteKYzNFPmUoAVTW0FBnhdvtWeVvCGHIFLNS+b55o5njqS4
 2EVfcQ5qtdUqtDgwR9T7GbXyUujllGe+DCGRPCI9M5s0RC35d/GTQ9b+eHNo/BPRTHAs
 109aM4zFeYs3qeABFt6PzFK8FWOj5EyNdbvW3NeM23Ykr/vHc2xeAA3Q5sFRzOaJ6WV9
 yi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klSkJhbs0NB+xI0c1ebxNosV7pVJl7beazxfFo4LBZg=;
 b=eBSyERBl7ZSsi37pgxCCSdRD5FGZKWI6HedqscV/KX7sQxI3gey45phpelZ4JL7f/2
 tFp+znsjGfFP9qGPp7iL2vnj2xntTBLbrT44QvQK/GqhltcWgfUW9yr7OuWiBc+7LOjJ
 tPwxlQVs3QpDJQLWp/zx6QIWXFFHc5zaEi5pj/PoXiCLfamv0okPfFKvuu793WU/03U1
 jSBbqkoIAfs90DX5bXc5a0nzHe2av9sP3vyu2ScP//dQCC/F5r2rHpIVZWs7BAYuerO5
 KO195noNm0T3ie8S5JyIqUFIRyPDZFQ4lVRKPiuCORll4yJeXaXPGON52hcqZi6/V6ro
 9AQA==
X-Gm-Message-State: APjAAAWQHC/JCwnLRmuRI+K7kwaa9rw4fxbcShJM51OZUJWJ2buTmyKJ
 1p/K2N91U3QEeaa6JFvJ7tCJhQ==
X-Google-Smtp-Source: APXvYqzMpRsgyQhdaXkYR6VhupFXcKpJSMlYFG0Sb+nF3uP8ydsPZns1A+Qc1CimphV2UL/tqKaqyQ==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr2607200wmr.30.1567684896038; 
 Thu, 05 Sep 2019 05:01:36 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu,  5 Sep 2019 14:01:20 +0200
Message-Id: <20190905120120.31752-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 8/8] ASoC: meson: tdmout: add sm1 support
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

On the sm1, the TDMOUT number of input is extended and the
the gain enable bit moved to accommodate this extension

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmout.c | 103 ++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 86537fc0ecb5..418ec314b37d 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -24,6 +24,7 @@
 #define TDMOUT_CTRL1			0x04
 #define  TDMOUT_CTRL1_TYPE_MASK		GENMASK(6, 4)
 #define  TDMOUT_CTRL1_TYPE(x)		((x) << 4)
+#define  SM1_TDMOUT_CTRL1_GAIN_EN	7
 #define  TDMOUT_CTRL1_MSB_POS_MASK	GENMASK(12, 8)
 #define  TDMOUT_CTRL1_MSB_POS(x)	((x) << 8)
 #define  TDMOUT_CTRL1_SEL_SHIFT		24
@@ -51,25 +52,6 @@ static const struct regmap_config axg_tdmout_regmap_cfg = {
 	.max_register	= TDMOUT_MASK_VAL,
 };
 
-static const struct snd_kcontrol_new axg_tdmout_controls[] = {
-	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
-	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
-	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
-	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
-	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
-		   TDMOUT_CTRL1_GAIN_EN, 1, 0),
-};
-
-static const char * const tdmout_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2",
-};
-
-static SOC_ENUM_SINGLE_DECL(axg_tdmout_sel_enum, TDMOUT_CTRL1,
-			    TDMOUT_CTRL1_SEL_SHIFT, tdmout_sel_texts);
-
-static const struct snd_kcontrol_new axg_tdmout_in_mux =
-	SOC_DAPM_ENUM("Input Source", axg_tdmout_sel_enum);
-
 static struct snd_soc_dai *
 axg_tdmout_get_be(struct snd_soc_dapm_widget *w)
 {
@@ -197,6 +179,25 @@ static int axg_tdmout_prepare(struct regmap *map,
 	return axg_tdm_formatter_set_channel_masks(map, ts, TDMOUT_MASK0);
 }
 
+static const struct snd_kcontrol_new axg_tdmout_controls[] = {
+	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
+	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
+	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
+		   TDMOUT_CTRL1_GAIN_EN, 1, 0),
+};
+
+static const char * const axg_tdmout_sel_texts[] = {
+	"IN 0", "IN 1", "IN 2",
+};
+
+static SOC_ENUM_SINGLE_DECL(axg_tdmout_sel_enum, TDMOUT_CTRL1,
+			    TDMOUT_CTRL1_SEL_SHIFT, axg_tdmout_sel_texts);
+
+static const struct snd_kcontrol_new axg_tdmout_in_mux =
+	SOC_DAPM_ENUM("Input Source", axg_tdmout_sel_enum);
+
 static const struct snd_soc_dapm_widget axg_tdmout_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -252,6 +253,67 @@ static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
 	},
 };
 
+static const struct snd_kcontrol_new sm1_tdmout_controls[] = {
+	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
+	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
+	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
+		   SM1_TDMOUT_CTRL1_GAIN_EN, 1, 0),
+};
+
+static const char * const sm1_tdmout_sel_texts[] = {
+	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4",
+};
+
+static SOC_ENUM_SINGLE_DECL(sm1_tdmout_sel_enum, TDMOUT_CTRL1,
+			    TDMOUT_CTRL1_SEL_SHIFT, sm1_tdmout_sel_texts);
+
+static const struct snd_kcontrol_new sm1_tdmout_in_mux =
+	SOC_DAPM_ENUM("Input Source", sm1_tdmout_sel_enum);
+
+static const struct snd_soc_dapm_widget sm1_tdmout_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0, &sm1_tdmout_in_mux),
+	SND_SOC_DAPM_PGA_E("ENC", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   axg_tdm_formatter_event,
+			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+	SND_SOC_DAPM_AIF_OUT("OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route sm1_tdmout_dapm_routes[] = {
+	{ "SRC SEL", "IN 0", "IN 0" },
+	{ "SRC SEL", "IN 1", "IN 1" },
+	{ "SRC SEL", "IN 2", "IN 2" },
+	{ "SRC SEL", "IN 3", "IN 3" },
+	{ "SRC SEL", "IN 4", "IN 4" },
+	{ "ENC", NULL, "SRC SEL" },
+	{ "OUT", NULL, "ENC" },
+};
+
+static const struct snd_soc_component_driver sm1_tdmout_component_drv = {
+	.controls		= sm1_tdmout_controls,
+	.num_controls		= ARRAY_SIZE(sm1_tdmout_controls),
+	.dapm_widgets		= sm1_tdmout_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_tdmout_dapm_widgets),
+	.dapm_routes		= sm1_tdmout_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(sm1_tdmout_dapm_routes),
+};
+
+static const struct axg_tdm_formatter_driver sm1_tdmout_drv = {
+	.component_drv	= &sm1_tdmout_component_drv,
+	.regmap_cfg	= &axg_tdmout_regmap_cfg,
+	.ops		= &axg_tdmout_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk = true,
+		.skew_offset = 2,
+	},
+};
+
 static const struct of_device_id axg_tdmout_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmout",
@@ -259,6 +321,9 @@ static const struct of_device_id axg_tdmout_of_match[] = {
 	}, {
 		.compatible = "amlogic,g12a-tdmout",
 		.data = &g12a_tdmout_drv,
+	}, {
+		.compatible = "amlogic,sm1-tdmout",
+		.data = &sm1_tdmout_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmout_of_match);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
