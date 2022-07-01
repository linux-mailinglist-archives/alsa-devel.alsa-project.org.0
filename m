Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2401562CAB
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 09:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E3716AF;
	Fri,  1 Jul 2022 09:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E3716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656660717;
	bh=frLKryxS4Q5AyEu/VqBFjYdiXHY6/suX9B4Ci/2WNgg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SRk5VpzoKyv1IONDi2Rh9N2wXESWVmfaf/qQhHXvzq6iSl4rfcMp4i7vmQwTx3wbO
	 9kZI/eKJSHxPXShMLbDn49F9RWdUzJOyeUOVBU7WXenng+ifjkVrNdKUBEvsR4WeFw
	 3o9T2wDXOsI6v4sow8GxAC8kLZSKRJQ+DnTD1O0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A004F80256;
	Fri,  1 Jul 2022 09:30:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ABBEF80155; Fri,  1 Jul 2022 09:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B590F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 09:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B590F800E8
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VI-7jtq_1656660640; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VI-7jtq_1656660640) by smtp.aliyun-inc.com;
 Fri, 01 Jul 2022 15:30:47 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: codecs: max98088: Clean up some inconsistent indenting
Date: Fri,  1 Jul 2022 15:30:39 +0800
Message-Id: <20220701073039.64556-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

This was found by coccicheck:

sound/soc/codecs/max98088.c:1761 max98088_i2c_probe() warn: inconsistent indenting.

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/max98088.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 08e5c606ff27..5435a49604cf 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1745,18 +1745,18 @@ MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
 
 static int max98088_i2c_probe(struct i2c_client *i2c)
 {
-       struct max98088_priv *max98088;
-       int ret;
-       const struct i2c_device_id *id;
+	struct max98088_priv *max98088;
+	int ret;
+	const struct i2c_device_id *id;
 
-       max98088 = devm_kzalloc(&i2c->dev, sizeof(struct max98088_priv),
-			       GFP_KERNEL);
-       if (max98088 == NULL)
-               return -ENOMEM;
+	max98088 = devm_kzalloc(&i2c->dev, sizeof(struct max98088_priv),
+				GFP_KERNEL);
+	if (max98088 == NULL)
+		return -ENOMEM;
 
-       max98088->regmap = devm_regmap_init_i2c(i2c, &max98088_regmap);
-       if (IS_ERR(max98088->regmap))
-	       return PTR_ERR(max98088->regmap);
+	max98088->regmap = devm_regmap_init_i2c(i2c, &max98088_regmap);
+	if (IS_ERR(max98088->regmap))
+		return PTR_ERR(max98088->regmap);
 
 	max98088->mclk = devm_clk_get(&i2c->dev, "mclk");
 	if (IS_ERR(max98088->mclk))
@@ -1764,14 +1764,14 @@ static int max98088_i2c_probe(struct i2c_client *i2c)
 			return PTR_ERR(max98088->mclk);
 
 	id = i2c_match_id(max98088_i2c_id, i2c);
-       max98088->devtype = id->driver_data;
+	max98088->devtype = id->driver_data;
 
-       i2c_set_clientdata(i2c, max98088);
-       max98088->pdata = i2c->dev.platform_data;
+	i2c_set_clientdata(i2c, max98088);
+	max98088->pdata = i2c->dev.platform_data;
 
-       ret = devm_snd_soc_register_component(&i2c->dev,
-                       &soc_component_dev_max98088, &max98088_dai[0], 2);
-       return ret;
+	ret = devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_max98088,
+					      &max98088_dai[0], 2);
+	return ret;
 }
 
 #if defined(CONFIG_OF)
-- 
2.20.1.7.g153144c

