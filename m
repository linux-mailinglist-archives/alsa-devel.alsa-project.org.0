Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0C34D30A1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 14:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD72F1723;
	Wed,  9 Mar 2022 14:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD72F1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646834292;
	bh=r9XMlhoZ4VkRX9nQrZ3E3W1+GPKTBG7agfmo2oNAdWo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mb+uTrIrLNe9KvhesGgsTFC+9ck3rxBc5uRIIpm0r65VAy7WhrKXJgdlKHnGSxAR4
	 PESRMvI3p7uuhpvMUiSgzBXIWd8Pa+5xZat/mXcK2nQmt4Rl0l49TLRckTNZWOw2Ko
	 kZzr4jVpdaaUyTQBEGiADD1YAQ9D72VgZyOg1+7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A760F80236;
	Wed,  9 Mar 2022 14:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1943EF8016C; Wed,  9 Mar 2022 14:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE61F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 14:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE61F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="TA3tzrxf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=jd9/waKNP/F1EwBvBedqrAz7FUsts5B6xAU46O7mnnA=; b=TA
 3tzrxfbcdR3/g7X6wtwir6MnPmPzrt2+DIhbd7mKVRweYVSO9XTu4QXECx7RVh3lb8uf390t6qMwT
 0jlg3GD+TZjckjee3c5rwlVEBqsZbh9nh4MiwT/nr+rFJUEu2dlKlPXo0enEjJTTitZX/BZStKBuY
 nMnWPN8UCb1rwsK9mDRzcR2k1A1uUX9+1iOq9uEcHI6079iL8p7keo9fcAKDYkvlYSWoiAX0fflg8
 rRA9gHcdUbedYtrWaFsonOTrJOCDE+VOjyxe6jg24ItZIMzHveDrUqimpqwpV+m/fA8+mIlsrSIfY
 4wuz9zQTl7xaCTbQNlKCHTyCeXmHAopw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nRwoA-0002Uf-VE; Wed, 09 Mar 2022 13:56:55 +0000
From: John Keeping <john@metanate.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Date: Wed,  9 Mar 2022 13:56:49 +0000
Message-Id: <20220309135649.195277-1-john@metanate.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Cc: linux-kernel@vger.kernel.org, Daniel Beer <daniel.beer@igorinstitute.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, John Keeping <john@metanate.com>
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

The binding defines the GPIO as "pdn-gpios" so when the GPIO is active
the expectation is that the power down signal is asserted and this is
how all other drivers using this GPIO name interpret the value.

But the tas5805m driver inverts the sense from the normal expectation so
when the powerdown GPIO is logically asserted the chip is running.

This is a new driver that is not yet in a released kernel and has no
in-tree users of the binding so fix the sense of the GPIO so that
logically asserted means that the device is powered down.

Rename the variable to match so that the compiler will catch any places
that should have been updated but have been missed.

Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifier")
Signed-off-by: John Keeping <john@metanate.com>
---
v2:
- Rewrite commit message to make it more obvious that this is a change
  to the interpretation of the GPIO in the binding

 sound/soc/codecs/tas5805m.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index fa0e81ec875a..12146a860ef8 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -155,7 +155,7 @@ static const uint32_t tas5805m_volume[] = {
 
 struct tas5805m_priv {
 	struct regulator		*pvdd;
-	struct gpio_desc		*gpio_pdn_n;
+	struct gpio_desc		*gpio_pdn;
 
 	uint8_t				*dsp_cfg_data;
 	int				dsp_cfg_len;
@@ -444,11 +444,11 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 
 	dev_set_drvdata(dev, tas5805m);
 	tas5805m->regmap = regmap;
-	tas5805m->gpio_pdn_n = devm_gpiod_get(dev, "pdn", GPIOD_OUT_LOW);
-	if (IS_ERR(tas5805m->gpio_pdn_n)) {
+	tas5805m->gpio_pdn = devm_gpiod_get(dev, "pdn", GPIOD_OUT_HIGH);
+	if (IS_ERR(tas5805m->gpio_pdn)) {
 		dev_err(dev, "error requesting PDN gpio: %ld\n",
-			PTR_ERR(tas5805m->gpio_pdn_n));
-		return PTR_ERR(tas5805m->gpio_pdn_n);
+			PTR_ERR(tas5805m->gpio_pdn));
+		return PTR_ERR(tas5805m->gpio_pdn);
 	}
 
 	/* This configuration must be generated by PPC3. The file loaded
@@ -505,7 +505,7 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 	}
 
 	usleep_range(100000, 150000);
-	gpiod_set_value(tas5805m->gpio_pdn_n, 1);
+	gpiod_set_value(tas5805m->gpio_pdn, 0);
 	usleep_range(10000, 15000);
 
 	/* Don't register through devm. We need to be able to unregister
@@ -515,7 +515,7 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 					 &tas5805m_dai, 1);
 	if (ret < 0) {
 		dev_err(dev, "unable to register codec: %d\n", ret);
-		gpiod_set_value(tas5805m->gpio_pdn_n, 0);
+		gpiod_set_value(tas5805m->gpio_pdn, 1);
 		regulator_disable(tas5805m->pvdd);
 		return ret;
 	}
@@ -529,7 +529,7 @@ static int tas5805m_i2c_remove(struct i2c_client *i2c)
 	struct tas5805m_priv *tas5805m = dev_get_drvdata(dev);
 
 	snd_soc_unregister_component(dev);
-	gpiod_set_value(tas5805m->gpio_pdn_n, 0);
+	gpiod_set_value(tas5805m->gpio_pdn, 1);
 	usleep_range(10000, 15000);
 	regulator_disable(tas5805m->pvdd);
 	return 0;
-- 
2.35.1

