Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC395B9804
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 11:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133781935;
	Thu, 15 Sep 2022 11:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133781935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663235303;
	bh=LwLtFIRDF4K7/riF6QEYLIACUrMv8bcYqtxDBo07MTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPJq7POg3pK73h/gizAAp/QsmHmPmwi12z2OgxpTIj9oKRjvANCDXNhu93rbi6F/p
	 sFmHqROXzpqvI3ZHffRwqNSpxkStnHw9cOimhiKSYTQZNgCKE9K0b26jUEpW8oPo77
	 mqOP9KVwwmt9Tsw+QYBUDVAx4aH+wfHfQILXCrNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF548F80570;
	Thu, 15 Sep 2022 11:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF48F80552; Thu, 15 Sep 2022 11:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF27BF80424
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 11:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF27BF80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="G6xgM0rr"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663235135; bh=QkNDCDx0U/aAsQx4/+vROBFRgvKACQCU9RfjxhOvKBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G6xgM0rrHVLyrNxwx9hnKCw0GjK7FUwtZ8nu229+b6GUs0uYBKnGLZ3gj9rI3PZLt
 V54934ZLw4MW4JxK4T/IA0vTQ5qE8ntu6LKxNWH00k7fbsVcoboLhpmniNY+htUAqn
 r44N+3xdMHvacdE3zaukF1x7P7YPEY+otdGf3PFE=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v2 06/11] ASoC: cs42l42: Pass component and dai defs into
 common probe
Date: Thu, 15 Sep 2022 11:44:39 +0200
Message-Id: <20220915094444.11434-7-povik+lin@cutebit.org>
In-Reply-To: <20220915094444.11434-1-povik+lin@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Pass pointers to snd_soc_component_driver and snd_soc_dai_driver
objects into cs42l42_common_probe().

This is in preparation for adding SoundWire support.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 156d1b181cef..a4bb6f5d2267 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -579,7 +579,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	return 0;
 }
 
-static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
+static const struct snd_soc_component_driver cs42l42_soc_component = {
 	.set_jack		= cs42l42_set_jack,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
@@ -2219,7 +2219,9 @@ static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
+static int cs42l42_common_probe(struct cs42l42_private *cs42l42,
+				const struct snd_soc_component_driver *component_drv,
+				struct snd_soc_dai_driver *dai)
 {
 	int ret, i;
 
@@ -2275,9 +2277,7 @@ static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
 	}
 
 	/* Register codec now so it can EPROBE_DEFER */
-	ret = devm_snd_soc_register_component(cs42l42->dev,
-					      &soc_component_dev_cs42l42,
-					      &cs42l42_dai, 1);
+	ret = devm_snd_soc_register_component(cs42l42->dev, component_drv, dai, 1);
 	if (ret < 0)
 		goto err;
 
@@ -2416,7 +2416,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
 	cs42l42->regmap = regmap;
 	cs42l42->irq = i2c_client->irq;
 
-	ret = cs42l42_common_probe(cs42l42);
+	ret = cs42l42_common_probe(cs42l42, &cs42l42_soc_component, &cs42l42_dai);
 	if (ret)
 		return ret;
 
-- 
2.33.0

