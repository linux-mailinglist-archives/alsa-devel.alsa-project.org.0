Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864818310D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3591D1702;
	Thu, 12 Mar 2020 14:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3591D1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584019026;
	bh=O3u33Z/i2lGBhCK8D4N+BtJBwEIB9Ku0dgN8i6x/a8Q=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dBE4JKz3Pv/0OZm8RDDJ1nUscLfbcJ1zqV2ZdfOJyCq1VfpLPFZVCiErY53vwM20J
	 6wRFnnaEywSIvya4uw3V1/sAoOzGFKPbsoDkLsagOhj+3blRpOcq/tDshIb+JwxvKM
	 p3VZiTwcXC22lnP+prpFAzR5Twje3WxnMHEvCXzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20226F802A8;
	Thu, 12 Mar 2020 14:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7E3FF802A0; Thu, 12 Mar 2020 14:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F73FF8028B
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F73FF8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CABEAFEC;
 Thu, 12 Mar 2020 06:13:07 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FA9B3F534;
 Thu, 12 Mar 2020 06:13:07 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:13:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: qdsp6: q6asm-dai: only enable dais from device tree"
 to the asoc tree
In-Reply-To: <20200311180422.28363-2-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200311180422.28363-2-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

The patch

   ASoC: qdsp6: q6asm-dai: only enable dais from device tree

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9b60441692d94effcd37a141035c6106a91ddf8c Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 11 Mar 2020 18:04:21 +0000
Subject: [PATCH] ASoC: qdsp6: q6asm-dai: only enable dais from device tree

Existing code enables all the playback and capture dais even
if there is no device tree entry. This can lead to
un-necessary dais in the system which will never be used.
So honour whats specfied in device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200311180422.28363-2-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c0d422d0ab94..8b48815ff918 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -69,6 +69,8 @@ struct q6asm_dai_rtd {
 };
 
 struct q6asm_dai_data {
+	struct snd_soc_dai_driver *dais;
+	int num_dais;
 	long long int sid;
 };
 
@@ -889,7 +891,7 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.compr_ops	= &q6asm_dai_compr_ops,
 };
 
-static struct snd_soc_dai_driver q6asm_fe_dais[] = {
+static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
 	Q6ASM_FEDAI_DRIVER(1),
 	Q6ASM_FEDAI_DRIVER(2),
 	Q6ASM_FEDAI_DRIVER(3),
@@ -903,10 +905,22 @@ static struct snd_soc_dai_driver q6asm_fe_dais[] = {
 static int of_q6asm_parse_dai_data(struct device *dev,
 				    struct q6asm_dai_data *pdata)
 {
-	static struct snd_soc_dai_driver *dai_drv;
+	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream empty_stream;
 	struct device_node *node;
-	int ret, id, dir;
+	int ret, id, dir, idx = 0;
+
+
+	pdata->num_dais = of_get_child_count(dev->of_node);
+	if (!pdata->num_dais) {
+		dev_err(dev, "No dais found in DT\n");
+		return -EINVAL;
+	}
+
+	pdata->dais = devm_kcalloc(dev, pdata->num_dais, sizeof(*dai_drv),
+				   GFP_KERNEL);
+	if (!pdata->dais)
+		return -ENOMEM;
 
 	memset(&empty_stream, 0, sizeof(empty_stream));
 
@@ -917,7 +931,8 @@ static int of_q6asm_parse_dai_data(struct device *dev,
 			continue;
 		}
 
-		dai_drv = &q6asm_fe_dais[id];
+		dai_drv = &pdata->dais[idx++];
+		*dai_drv = q6asm_fe_dais_template[id];
 
 		ret = of_property_read_u32(node, "direction", &dir);
 		if (ret)
@@ -955,11 +970,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, pdata);
 
-	of_q6asm_parse_dai_data(dev, pdata);
+	rc = of_q6asm_parse_dai_data(dev, pdata);
+	if (rc)
+		return rc;
 
 	return devm_snd_soc_register_component(dev, &q6asm_fe_dai_component,
-					q6asm_fe_dais,
-					ARRAY_SIZE(q6asm_fe_dais));
+					       pdata->dais, pdata->num_dais);
 }
 
 static const struct of_device_id q6asm_dai_device_id[] = {
-- 
2.20.1

