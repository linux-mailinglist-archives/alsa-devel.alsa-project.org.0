Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952F5B9811
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 11:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370E516FB;
	Thu, 15 Sep 2022 11:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370E516FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663235391;
	bh=5c0oUHNYGH5E+YA9eg8WNykJyMBkwvthfujo3ZZpTPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lD1ZkctOamp8cAT9RrcgRevRg1XOwvPBTSHrt0vINl5qpm1yBA5NPiBuVN5OQ//hJ
	 bdoJPwaoGI1A9ah/I0Qxvm87t7NX5rKP2P5Cl2vmRo/xDi4TXopi0z/AgSV76JXAEW
	 aOtqx0n/bRyelU9EubRd9wt3ip+iYJqUXqp8KQx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11945F805B3;
	Thu, 15 Sep 2022 11:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 185E0F8057E; Thu, 15 Sep 2022 11:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 133F0F80495
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 11:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133F0F80495
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="gb+bXPbL"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663235138; bh=cW5w38A8GLInG+MinVkl6F+e++EU/JdqSt9RzpfaksU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gb+bXPbLB9YOA2ZndnvlCuK62asG96OLytjqpzjFrTgE1DVS18ds4rVYtgdOpecbx
 7a5pk6VpIgyFXcREdSV24QKrvsrX6DfaF/H6X9qicskfheJMuY9ttmqTs/fUNPCDQ1
 YnvPXUTUMpeL/c8fvRSuJyMYGgqsBaZIuH0FQeAY=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v2 11/11] ASoC: cs42l42: Switch to dev_err_probe() helper
Date: Thu, 15 Sep 2022 11:44:44 +0200
Message-Id: <20220915094444.11434-12-povik+lin@cutebit.org>
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

Replace dev_err() with dev_err_probe() in the probe path for consistency
with cs42l83-i2c.c.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42-i2c.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-i2c.c b/sound/soc/codecs/cs42l42-i2c.c
index 35fecff0f74f..1900ec75576e 100644
--- a/sound/soc/codecs/cs42l42-i2c.c
+++ b/sound/soc/codecs/cs42l42-i2c.c
@@ -25,11 +25,9 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
 		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
-		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&i2c_client->dev, PTR_ERR(regmap),
+				     "regmap_init() failed\n");
 
 	cs42l42->devid = CS42L42_CHIP_ID;
 	cs42l42->dev = dev;
-- 
2.33.0

