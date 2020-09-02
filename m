Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAB25AC19
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 15:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02C31857;
	Wed,  2 Sep 2020 15:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02C31857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599053570;
	bh=PAWy/HPTCyiBJJXehMsiFyv52ASflEFQdfpXpet28Os=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aFOX67aYAcFBniaHIRjGjPnC00ILDA4b7FD5exOpeBBL6/C7RuMuCXE3dRv49szIF
	 WXFzHQPmQne1Jvc1tcozl3JMvDhkjbPfNtpPdC/I/7086EM57KZm+Qm+6errto0uKf
	 7Va9RBTOGlxOeKs9VM+uxeKIriAjx8SQct/c/so0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C831CF8024A;
	Wed,  2 Sep 2020 15:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F2A7F800BA; Wed,  2 Sep 2020 15:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DE70F80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 15:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DE70F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.b="NqUyei0u"
IronPort-SDR: ynhBwUvpTDAdxSmhtK0/tq1se06C30r7rSzdg+m1Dczrxvhg6XmwcqpywYWKHseuZyuwsGLGcR
 /NlMEV59mcXRomai5W34hck4enUyq1HQNOTBa63VpRqUvksGnCVhVz5hOsuPYx8XKwrUGVkmk+
 CzcYtsGqAK17X2hO+72ulHQSUy8ycgCoF9CdbSjbgRZO+A8yw3F0/+a+2dGKOt+BOdZFOGWaqA
 69eQOY+2frKVsx8W9tim6HbdhsUTebtWQamrh+30j/7lhwNB8bAdAogIQBh1f5ZsNNcP6FgtEl
 04c=
X-IronPort-AV: E=Sophos;i="5.76,383,1592863200"; d="scan'208";a="13702691"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Sep 2020 15:30:59 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Sep 2020 15:30:59 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Sep 2020 15:30:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1599053459; x=1630589459;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PAWy/HPTCyiBJJXehMsiFyv52ASflEFQdfpXpet28Os=;
 b=NqUyei0uz8oLf9ls68yFwPth03LLEbAkbI3FiUA02HLIOz+TiKPj5r3i
 FbWMYFnPm/ory+OGOZpVLoSKMV6TnUEErbpnI6GM9+IRiNBrcL4/MKgwh
 g0D9+I/NiMyfoPbr/KdrQ2Fl9+ibCfnGulYJ26gkJGuTl40zHaCUDK1xX
 FHmb7xdFQ4K+U1LdDfmzWy5ToI1ddNGcHcJDruuul0YXBJHgNr+siVUH5
 NiNhUzl0I4YsMUwVRIvi2GNnVx7EOcl6BMsnkxhP0IXOMY371mHLBt4/B
 9SwlcPHnVf1kxw8AT2cRmrLbqbI2PZWtddhfteW8o2WPlTtp/t4YoUgYr g==;
IronPort-SDR: rWvoANrAZeIWQdiwCcblue0yI4e69UUmziRI7o7snFdUsgH1nSIycvETIf39GW6hBfLsZ3qlVQ
 bVYBQFfU5xw/f/ahP82HTYq8rzXJwzcRixKrMTUQ87/OL3gydHh/koOuM32nDiMKD6szZQjoja
 F1TbeFqK63RGbC76gImMYscHjVR1qXygpoJb3MPG8MssHpSQTwmSOmC3WDf0ISIXIy1ZqmgINS
 pZ7gKl1UbSVw7NIn/XKHZAic8C28AbaJUht0hvoq1CBXHx5ybGKlElLXcgqAl40sdOv8JJSg20
 m0E=
X-IronPort-AV: E=Sophos;i="5.76,383,1592863200"; d="scan'208";a="13702689"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Sep 2020 15:30:59 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 2FB3D280070;
 Wed,  2 Sep 2020 15:30:59 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: codec: tlv320aic32x4: do software reset before
 clock registration
Date: Wed,  2 Sep 2020 15:30:43 +0200
Message-Id: <20200902133043.19504-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902133043.19504-1-matthias.schiffer@ew.tq-group.com>
References: <20200902133043.19504-1-matthias.schiffer@ew.tq-group.com>
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-kernel@vger.kernel.org
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

To avoid the actual PLL settings to differ from the state expected by
the clock driver, the codec should only be fully reset before the clocks
are registered. But we also need to ensure that the software reset
happens at all before clock registration, as not all boards have a reset
GPIO.

Move the software reset from aic32x4_component_probe() to
aic32x4_probe() and reorder the reset and registration sequence:

1. Reset via GPIO (if available)
2. Reset via software
3. Register component
4. Register clocks

Note that aic32x4_component_probe() is only called after aic32x4_probe()
has finished, so the reset in aic32x4_component_probe() was happening too
late.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index a45fb496082c..470dc0ef0359 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -981,8 +981,6 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_write(component, AIC32X4_RESET, 0x01);
-
 	if (aic32x4->setup)
 		aic32x4_setup_gpios(component);
 
@@ -1226,6 +1224,16 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return ret;
 	}
 
+	if (gpio_is_valid(aic32x4->rstn_gpio)) {
+		ndelay(10);
+		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		mdelay(1);
+	}
+
+	ret = regmap_write(regmap, AIC32X4_RESET, 0x01);
+	if (ret)
+		goto err_disable_regulators;
+
 	ret = devm_snd_soc_register_component(dev,
 			&soc_component_dev_aic32x4, &aic32x4_dai, 1);
 	if (ret) {
@@ -1233,12 +1241,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		goto err_disable_regulators;
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
-		ndelay(10);
-		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
-		mdelay(1);
-	}
-
 	ret = aic32x4_register_clocks(dev, aic32x4->mclk_name);
 	if (ret)
 		goto err_disable_regulators;
-- 
2.17.1

