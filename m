Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCB17C867
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 23:34:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 080CA167A;
	Fri,  6 Mar 2020 23:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 080CA167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583534054;
	bh=Wxr1s93B99s619Ik9LzjdMF5fsHpB8VlMLh7eajSzK0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQx+x7xvlSKsOiEqnfM9h5fqrRNTv3xTyCKkbkmAlAn1uT6KLJecfXggRLQplAWgo
	 JkIvmL113S/iAB4fa5pRyCGSDpdoLeKH+IA6/Ywiht3rin/3NhKWT0+AzDyp13guj8
	 Bk3DAINiGxuMgAvwgzB7OjZBgRU2OB0zqBCfI6sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA71F802A2;
	Fri,  6 Mar 2020 23:30:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A76DF802A1; Fri,  6 Mar 2020 23:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E326AF80291
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E326AF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="AUaxDo09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583533784; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=et3xssf9jXYhr8qjPkYvKPU7a6v5Pi9/fuLNjUQEHE4=;
 b=AUaxDo09VnVLjRyEvyn8VAx0fMz/9s7OWG93J1ekiE0IQXLcuv0BGM8uz1ahdwMzNmQiYH
 fM/TUjOzy7nVUN+d3tgzIPyh9JqCqTL2aga0izptLIAbrdRjzd71FLVfeBVPGADf4aZIIC
 E68LLyNQhCQJIk+niG25Yp8csQAPZCY=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/6] ASoC: jz4740-i2s: Add support for the JZ4770
Date: Fri,  6 Mar 2020 23:29:31 +0100
Message-Id: <20200306222931.39664-6-paul@crapouillou.net>
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
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

Before the JZ4770, the playback and capture sampling rates had to match.
The JZ4770 supports independent sampling rates for both.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/jz4740/jz4740-i2s.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 253f8d8ba273..6f6f8dad0356 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -87,6 +87,7 @@
 enum jz47xx_i2s_version {
 	JZ_I2S_JZ4740,
 	JZ_I2S_JZ4760,
+	JZ_I2S_JZ4770,
 	JZ_I2S_JZ4780,
 };
 
@@ -286,7 +287,7 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
 		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
 
-		if (i2s->soc_info->version >= JZ_I2S_JZ4780) {
+		if (i2s->soc_info->version >= JZ_I2S_JZ4770) {
 			div_reg &= ~I2SDIV_IDV_MASK;
 			div_reg |= (div - 1) << I2SDIV_IDV_SHIFT;
 		} else {
@@ -469,7 +470,7 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 	.dai = &jz4740_i2s_dai,
 };
 
-static struct snd_soc_dai_driver jz4780_i2s_dai = {
+static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
 	.remove = jz4740_i2s_dai_remove,
 	.playback = {
@@ -487,9 +488,14 @@ static struct snd_soc_dai_driver jz4780_i2s_dai = {
 	.ops = &jz4740_i2s_dai_ops,
 };
 
+static const struct i2s_soc_info jz4770_i2s_soc_info = {
+	.version = JZ_I2S_JZ4770,
+	.dai = &jz4770_i2s_dai,
+};
+
 static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.version = JZ_I2S_JZ4780,
-	.dai = &jz4780_i2s_dai,
+	.dai = &jz4770_i2s_dai,
 };
 
 static const struct snd_soc_component_driver jz4740_i2s_component = {
@@ -502,6 +508,7 @@ static const struct snd_soc_component_driver jz4740_i2s_component = {
 static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4740-i2s", .data = &jz4740_i2s_soc_info },
 	{ .compatible = "ingenic,jz4760-i2s", .data = &jz4760_i2s_soc_info },
+	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ /* sentinel */ }
 };
-- 
2.25.1

