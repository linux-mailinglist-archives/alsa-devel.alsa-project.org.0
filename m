Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFB3FAD54
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Aug 2021 19:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E767816BF;
	Sun, 29 Aug 2021 19:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E767816BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630256975;
	bh=5QaN/XpQgIgjf/BOnDZmch+mx9yG/wxC151DFF3SAUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHYYniMA+TPk2S5Z4LvYXrvThXhFWyh/UvLS9K9Y0eajZGBmedn4KXC+smNQKqrxD
	 wnMxs/xjrVwDvXu03PuoJh44l5xCdAnNq4vXLLzpsxkAvODQhtOPrJxlvWUIZ4KbP0
	 IsK2tTS0H0L96YJL06qm5GYohKIqIo9RaXvNGIEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A03F804D6;
	Sun, 29 Aug 2021 19:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F83CF80290; Sun, 29 Aug 2021 19:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D86ABF80269
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 19:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86ABF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="MrLu3+qx"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id C29BC4044F;
 Sun, 29 Aug 2021 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630256851; bh=5QaN/XpQgIgjf/BOnDZmch+mx9yG/wxC151DFF3SAUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MrLu3+qxwhyaRPX9mSVtQxPmegsKs/jpGx1YZ0agQiYw9gcOJUvW71vdfIPyK59t1
 ulXVPPP/U+IKLGf/rET7tVINIajX2pjkxIH3N0WYwCAebDRJ8bNn+F/zj+dBce2/Wz
 tk7DREGoMnMNUrNflfVXor7z3oYpWHIrPGnneGAZD7F2+YdzIEv9y0TckG1jkUAeUs
 jTCUtIfcTcR03xmisZw37opixzo2BYjFtju2HbLxxeDeHHGrJpvXD24t7NSPI6nBSE
 PVz7zNhXk0DEzP26wGNSTCywQj/gxEDs0vT4tcYyTXDaQ/NGigry+8EdVWp4l/xIqH
 w8fPt9qtQbDVw==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH RESEND 1/2] ASoC: max98927: Handle reset gpio when probing i2c
Date: Sun, 29 Aug 2021 19:00:16 +0200
Message-Id: <20210829170019.384632-2-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829170019.384632-1-atafalla@dnyon.com>
References: <20210829170019.384632-1-atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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

Drive the reset gpio if defined in the DTS node.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 sound/soc/codecs/max98927.c | 16 ++++++++++++++++
 sound/soc/codecs/max98927.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 8b206ee77709..dacf64c4cdf7 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -898,6 +898,22 @@ static int max98927_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	max98927->reset_gpio
+		= devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(max98927->reset_gpio)) {
+		ret = PTR_ERR(max98927->reset_gpio);
+		dev_err(&i2c->dev,
+			"Failed to request GPIO reset pin, error %d\n", ret);
+		return ret;
+	}
+
+	if (max98927->reset_gpio) {
+		gpiod_set_value_cansleep(max98927->reset_gpio, 0);
+		usleep_range(5, 10)
+		gpiod_set_value_cansleep(max98927->reset_gpio, 1);
+		usleep_range(1, 5)
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98927->regmap,
 		MAX98927_R01FF_REV_ID, &reg);
diff --git a/sound/soc/codecs/max98927.h b/sound/soc/codecs/max98927.h
index 05f495db914d..5c04bf38e24a 100644
--- a/sound/soc/codecs/max98927.h
+++ b/sound/soc/codecs/max98927.h
@@ -255,6 +255,7 @@ struct max98927_priv {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
 	struct max98927_pdata *pdata;
+	struct gpio_desc *reset_gpio;
 	unsigned int spk_gain;
 	unsigned int sysclk;
 	unsigned int v_l_slot;
-- 
2.32.0

