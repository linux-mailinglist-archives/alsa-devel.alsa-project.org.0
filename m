Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8214E77BC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:35:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF6C1708;
	Fri, 25 Mar 2022 16:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF6C1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222519;
	bh=NqxcaBnxEjJ53GoQmFpvgu/LQKHpupq2rGbZFe+Xfhs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuM+Du8V+uTww8f0QYwjG63h84QhsF8NgrxlnVJM6Yz2VsAxNF4Y8sVKYw/85Z54e
	 2ub5Iv654v7jV1xU9ECPxz2+jkWWTPj4yqtxn3HFNxAQN6mD3lqzZjD7I48462AFFg
	 Gv9KVj/Vwm+h379xy21tSkVvcIXtwwVe/CD01fM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB31F8051E;
	Fri, 25 Mar 2022 16:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEBF2F800AA; Fri, 25 Mar 2022 16:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CF1DF80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF1DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p/uxxp9v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB2FF60A76;
 Fri, 25 Mar 2022 15:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2213C340EE;
 Fri, 25 Mar 2022 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222388;
 bh=NqxcaBnxEjJ53GoQmFpvgu/LQKHpupq2rGbZFe+Xfhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p/uxxp9vcPACyhy+NmG8+0xgytj21LxQJLJhTorvg5YT81H/ThIueBXOwVS/vRbMU
 tIQs45PmrolDgiIGyagZOvqCVYv3juJETLK9ZsB9cpvb7trXM04a0nLPd6tzaUUvGp
 ONRQ+7V+/ZhLFDrFMox+VMo69YrGNeWgMr+HGTY+avFNqe4dA9c0zWhBy5tb6ejEuw
 m8RBc165INMEhAh65vcC5FQ53NlfqKSHaRszJGrfxdF2EIZM2ct3MeN/595k9lkk3q
 /rxm3MjRBxmP3k/x7eZjzReyjM8qL+4dTQzi0CSoillgJVX6Ek1k4Ighej8eOVRNF7
 ZZ8gusDlRaAog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 3/7] ASoC: wm8731: Move regulator request into wm8731_init()
Date: Fri, 25 Mar 2022 15:31:17 +0000
Message-Id: <20220325153121.1598494-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903; h=from:subject;
 bh=NqxcaBnxEjJ53GoQmFpvgu/LQKHpupq2rGbZFe+Xfhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBF3SU/fe2mm2mwn8h3A1k3PvEbwELJWzyvXrDc
 mZ/ORQKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRQAKCRAk1otyXVSH0JlQB/
 97neGBUydMC/MHDnO/AQGc0ED46I/a0czkEFK3uhW7J47wREQvTpB+vbY6VybnyPihvChrABBKaSYf
 wQ5aCgmQNUxSwcVNbMP7fqdC1CcAlLWz6dKzSFZeuaYljPQ8u6vhMYfLoAua6+P6DJ7auxhJXIenIP
 Xk0/p+S9H+PPEMyxv4SW4b5Ea2QMmHOPCwFHdcQKJO/IbzQHxHbzD80kK0zIxTTP9FZK9EbD9ggV1b
 J3tkaIw3XewgO7vKfDuYeOnbjYSkluhcGoJeDSwR64G9Ku/vV2QmUTDw+u6ARTeJ/w8g3xElVW7Ujx
 Af/XfB+zjtRYrAi4+JeZeldwk3osFa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

The supplies used by the wm8731 do not depend on the bus and there is no
need to do anything with the supplies prior to instantiating the regmap so
move the request into wm8731_init().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 48 +++++++++++++--------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index b2ec03b1afed..334332bb5f22 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -569,8 +569,22 @@ static struct snd_soc_dai_driver wm8731_dai = {
 	.symmetric_rate = 1,
 };
 
-static int wm8731_request_supplies(struct device *dev,
-		struct wm8731_priv *wm8731)
+static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
+	.set_bias_level		= wm8731_set_bias_level,
+	.controls		= wm8731_snd_controls,
+	.num_controls		= ARRAY_SIZE(wm8731_snd_controls),
+	.dapm_widgets		= wm8731_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(wm8731_dapm_widgets),
+	.dapm_routes		= wm8731_intercon,
+	.num_dapm_routes	= ARRAY_SIZE(wm8731_intercon),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
 {
 	int ret = 0, i;
 
@@ -591,28 +605,6 @@ static int wm8731_request_supplies(struct device *dev,
 		return ret;
 	}
 
-	return 0;
-}
-
-static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
-	.set_bias_level		= wm8731_set_bias_level,
-	.controls		= wm8731_snd_controls,
-	.num_controls		= ARRAY_SIZE(wm8731_snd_controls),
-	.dapm_widgets		= wm8731_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(wm8731_dapm_widgets),
-	.dapm_routes		= wm8731_intercon,
-	.num_dapm_routes	= ARRAY_SIZE(wm8731_intercon),
-	.suspend_bias_off	= 1,
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
-static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
-{
-	int ret = 0;
-
 	ret = wm8731_reset(wm8731->regmap);
 	if (ret < 0) {
 		dev_err(dev, "Failed to issue reset: %d\n", ret);
@@ -695,10 +687,6 @@ static int wm8731_spi_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, wm8731);
 
-	ret = wm8731_request_supplies(&spi->dev, wm8731);
-	if (ret != 0)
-		return ret;
-
 	wm8731->regmap = devm_regmap_init_spi(spi, &wm8731_regmap);
 	if (IS_ERR(wm8731->regmap)) {
 		ret = PTR_ERR(wm8731->regmap);
@@ -748,10 +736,6 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, wm8731);
 
-	ret = wm8731_request_supplies(&i2c->dev, wm8731);
-	if (ret != 0)
-		return ret;
-
 	wm8731->regmap = devm_regmap_init_i2c(i2c, &wm8731_regmap);
 	if (IS_ERR(wm8731->regmap)) {
 		ret = PTR_ERR(wm8731->regmap);
-- 
2.30.2

