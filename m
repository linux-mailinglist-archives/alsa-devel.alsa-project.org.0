Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34E394408
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D949616F9;
	Fri, 28 May 2021 16:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D949616F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211508;
	bh=etQv4148XiNjFlFCkrHITfinHD/7B2v2acgKy9+MWrU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGFdfd+3pR6PKJ5vsiOnqLXAqDT7KI5livlMWY2zL6SYqjCol93YQmS4nYZMsmq0+
	 EPKP157OWiWeaD3dG0KxqUDEQ8ReXU8Les4VrsQCsxW0dz0bX+Ax7OBZ6lz5bAPvpv
	 ii/n8+C7h9ADWVIwfiD3h6ZAOPF1jJIUQd4ouzB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D83AF804E1;
	Fri, 28 May 2021 16:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DB8F800F9; Fri, 28 May 2021 12:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E33F80260
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 12:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E33F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="lpZkfxey"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1622199081; bh=etQv4148XiNjFlFCkrHITfinHD/7B2v2acgKy9+MWrU=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=lpZkfxeyJ8p+JHJHogUWEhQVPFdv4A7yOmPfBLK/AXpjbGGBVin+qXJ1gtj+VkbP+
 Nmyme5Y+qXca/cmmmN8LyGg2IBZYXexfP/vj9x+VA4YP0V3t5W4nGAh1fFH+nT009j
 zBFLJu/VzJyil3zWNowUkgYZE4u3mcqf5JZy+Ym8=
Received: by 192.168.90.15 [192.168.90.15] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Fri, 28 May 2021 12:51:21 +0200 (CEST)
X-EA-Auth: bZWbzNMKnaVnjmJ2JWIbsTfsgap0MJP1+XsFBIJF2qthYKxGEPDAuxPbQeIE6hwUSnRHZx8rrrqqnnMDVkcimd5rcYdH9yuYln+A7KOuCX0=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 4/4] ASoC: codecs: tfa989x: Add support for optional
 vddd-supply
Date: Fri, 28 May 2021 12:51:01 +0200
Message-Id: <20210528105101.508254-4-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105101.508254-1-vincent.knecht@mailoo.org>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:27 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>
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

Allow specifying Vddd regulator/supply to be enabled on I2C probing.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/tfa989x.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 6d94865c534b..643b45188b6f 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
 #define TFA989X_STATUSREG		0x00
@@ -51,6 +52,10 @@ struct tfa989x_rev {
 	int (*init)(struct regmap *regmap);
 };
 
+struct tfa989x {
+	struct regulator *vddd_supply;
+};
+
 static bool tfa989x_writeable_reg(struct device *dev, unsigned int reg)
 {
 	return reg > TFA989X_REVISIONNUMBER;
@@ -242,10 +247,18 @@ static int tfa989x_dsp_bypass(struct regmap *regmap)
 				 BIT(TFA989X_SYS_CTRL_AMPC));
 }
 
+static void tfa989x_regulator_disable(void *data)
+{
+	struct tfa989x *tfa989x = data;
+
+	regulator_disable(tfa989x->vddd_supply);
+}
+
 static int tfa989x_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	const struct tfa989x_rev *rev;
+	struct tfa989x *tfa989x;
 	struct regmap *regmap;
 	unsigned int val;
 	int ret;
@@ -256,10 +269,31 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
 		return -ENODEV;
 	}
 
+	tfa989x = devm_kzalloc(dev, sizeof(*tfa989x), GFP_KERNEL);
+	if (!tfa989x)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, tfa989x);
+
+	tfa989x->vddd_supply = devm_regulator_get(dev, "vddd");
+	if (IS_ERR(tfa989x->vddd_supply))
+		return dev_err_probe(dev, PTR_ERR(tfa989x->vddd_supply),
+				     "Failed to get vddd regulator\n");
+
 	regmap = devm_regmap_init_i2c(i2c, &tfa989x_regmap);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	ret = regulator_enable(tfa989x->vddd_supply);
+	if (ret) {
+		dev_err(dev, "Failed to enable vddd regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, tfa989x_regulator_disable, tfa989x);
+	if (ret)
+		return ret;
+
 	/* Bypass regcache for reset and init sequence */
 	regcache_cache_bypass(regmap, true);
 
-- 
2.31.1



