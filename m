Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804413FF8BF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 03:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C542D17DA;
	Fri,  3 Sep 2021 03:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C542D17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630634012;
	bh=h8jZ+0CBNopo91U3FFEaSigGAKw61IO8NvubUHlFF6w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6JTFM/JEGrf/GUfIGSmxpFXcYn+VofQzDQTRytRD3Fu3j1qq9zpXgBoWWcw3djG7
	 u/RkbIgFCq/9aTVrIlIpKaF8sX4sGBk0f32S0ExD6IfmUw6cOpX5XjGHhOFY139MDM
	 /rDPyEic7a1F9kA/gNYHSZtxXuY7NuU4FrxD/yXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F3DF80423;
	Fri,  3 Sep 2021 03:51:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33A52F80227; Fri,  3 Sep 2021 03:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 016D0F800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 03:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 016D0F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="L7pcZjDZ"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 226654047F;
 Fri,  3 Sep 2021 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630633898; bh=h8jZ+0CBNopo91U3FFEaSigGAKw61IO8NvubUHlFF6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L7pcZjDZ4a3zBAXT2M7gWtbl9CTBBucpUflyxeNF719MV2IagQpzHXi+z2nfpVgpd
 1YxBg5JPfT2h9e+i7cImTLxIS+DIxS+CNOD3i9wBQYeE4XmqyoGitimCzh/p+VNj+x
 Hz0hORYrNJ0qewf0G/SYmjYJ6WaP0JFdO4WUeDGFj0RvsCV6hXYXJI9bLI6+WlDg/5
 q71VShLMuIWzRFyT5VrZnKHa/D/Pc0ihVpsfj42/5Ox0IXmSVrYlI9IcD0S0n/vZS9
 RAdUsWZhF02FMe0T8f8aeFILPCmEV03dXuaQi0MX6gILCtPCobCFmC+I1PwEpTS7sI
 G5ms8uljFvUkA==
From: Alejandro <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 1/2] ASoC: max98927: Handle reset gpio when probing i2c
Date: Fri,  3 Sep 2021 03:49:50 +0200
Message-Id: <04a18f4115539752429da55fb857834cea0944e5.1630632805.git.atafalla@dnyon.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630632805.git.atafalla@dnyon.com>
References: <cover.1630632805.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>
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

From: Alejandro Tafalla <atafalla@dnyon.com>

Drive the reset gpio if defined in the DTS node.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 sound/soc/codecs/max98927.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 8b206ee77709..daf06b503433 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -868,6 +868,7 @@ static int max98927_i2c_probe(struct i2c_client *i2c,
 	int ret = 0, value;
 	int reg = 0;
 	struct max98927_priv *max98927 = NULL;
+	struct gpio_desc *reset_gpio;
 
 	max98927 = devm_kzalloc(&i2c->dev,
 		sizeof(*max98927), GFP_KERNEL);
@@ -898,6 +899,19 @@ static int max98927_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	reset_gpio
+		= devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio)) {
+		ret = PTR_ERR(reset_gpio);
+		return dev_err_probe(&i2c->dev, ret, "failed to request GPIO reset pin");
+	}
+
+	if (reset_gpio) {
+		usleep_range(8000, 10000);
+		gpiod_set_value_cansleep(reset_gpio, 1);
+		usleep_range(1000, 5000);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98927->regmap,
 		MAX98927_R01FF_REV_ID, &reg);
-- 
2.33.0

