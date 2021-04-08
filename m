Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D6358578
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 16:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D8D1658;
	Thu,  8 Apr 2021 16:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D8D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617890457;
	bh=q3q13qMYSyDKU8VayQbJW5NSLwEAwCiiU4ZiReCLz6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ki0EdohGM+9eI/sA0CL4H3uEqgWEug9V4x60oDD75SUSp3SGgRXrSa4WX02bF95zT
	 +4Y8G4Qa2m/GqViqTBXQr2LFEnEhc5Z85Ho3+5oEvbC+yL3pT8B73/r8sEBQiwlq4b
	 XSbvTZ0YNMNYzBAzvMzDSBFQk5xRivUWV9wmT8zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA68CF800BD;
	Thu,  8 Apr 2021 15:59:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB48F8020B; Thu,  8 Apr 2021 15:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8857CF800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 15:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8857CF800BD
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 100D043262;
 Thu,  8 Apr 2021 15:59:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id XvIQduR5ufg4; Thu,  8 Apr 2021 15:59:14 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 9E5B243261;
 Thu,  8 Apr 2021 15:59:14 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: codecs: tlv320aic3x: add AIC3106
Date: Thu,  8 Apr 2021 15:59:08 +0200
Message-Id: <20210408135908.125667-1-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

In DT binding is mentioned that this driver is compatible with 3106.
So added compatibility string and model number.

-v2: Also added in switches "case AIC3X_MODEL_3106:" to have right widgets etc.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x-i2c.c | 2 ++
 sound/soc/codecs/tlv320aic3x-spi.c | 2 ++
 sound/soc/codecs/tlv320aic3x.c     | 3 +++
 sound/soc/codecs/tlv320aic3x.h     | 1 +
 4 files changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
index 4535bb8dbadc..cd0558ed4dd4 100644
--- a/sound/soc/codecs/tlv320aic3x-i2c.c
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -40,6 +40,7 @@ static const struct i2c_device_id aic3x_i2c_id[] = {
 	{ "tlv320aic33", AIC3X_MODEL_33 },
 	{ "tlv320aic3007", AIC3X_MODEL_3007 },
 	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
@@ -49,6 +50,7 @@ static const struct of_device_id aic3x_of_id[] = {
 	{ .compatible = "ti,tlv320aic33" },
 	{ .compatible = "ti,tlv320aic3007" },
 	{ .compatible = "ti,tlv320aic3104" },
+	{ .compatible = "ti,tlv320aic3106" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, aic3x_of_id);
diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
index bd78ab0910da..8c7b6bb9223f 100644
--- a/sound/soc/codecs/tlv320aic3x-spi.c
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -45,6 +45,7 @@ static const struct spi_device_id aic3x_spi_id[] = {
 	{ "tlv320aic33", AIC3X_MODEL_33 },
 	{ "tlv320aic3007", AIC3X_MODEL_3007 },
 	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, aic3x_spi_id);
@@ -54,6 +55,7 @@ static const struct of_device_id aic3x_of_id[] = {
 	{ .compatible = "ti,tlv320aic33" },
 	{ .compatible = "ti,tlv320aic3007" },
 	{ .compatible = "ti,tlv320aic3104" },
+	{ .compatible = "ti,tlv320aic3106" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, aic3x_of_id);
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 2f351747b714..7731593a5509 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1003,6 +1003,7 @@ static int aic3x_add_widgets(struct snd_soc_component *component)
 	switch (aic3x->model) {
 	case AIC3X_MODEL_3X:
 	case AIC3X_MODEL_33:
+	case AIC3X_MODEL_3106:
 		snd_soc_dapm_new_controls(dapm, aic3x_extra_dapm_widgets,
 					  ARRAY_SIZE(aic3x_extra_dapm_widgets));
 		snd_soc_dapm_add_routes(dapm, intercon_extra,
@@ -1580,6 +1581,7 @@ static int aic3x_init(struct snd_soc_component *component)
 	switch (aic3x->model) {
 	case AIC3X_MODEL_3X:
 	case AIC3X_MODEL_33:
+	case AIC3X_MODEL_3106:
 		aic3x_mono_init(component);
 		break;
 	case AIC3X_MODEL_3007:
@@ -1646,6 +1648,7 @@ static int aic3x_component_probe(struct snd_soc_component *component)
 	switch (aic3x->model) {
 	case AIC3X_MODEL_3X:
 	case AIC3X_MODEL_33:
+	case AIC3X_MODEL_3106:
 		snd_soc_add_component_controls(component, aic3x_extra_snd_controls,
 				ARRAY_SIZE(aic3x_extra_snd_controls));
 		snd_soc_add_component_controls(component, aic3x_mono_controls,
diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 00908f1734a7..7e0063913017 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -20,6 +20,7 @@ int aic3x_remove(struct device *dev);
 #define AIC3X_MODEL_33 1
 #define AIC3X_MODEL_3007 2
 #define AIC3X_MODEL_3104 3
+#define AIC3X_MODEL_3106 4
 
 /* AIC3X register space */
 #define AIC3X_CACHEREGNUM		110
-- 
2.25.1

