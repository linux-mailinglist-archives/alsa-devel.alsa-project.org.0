Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A84C056C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:42:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF78618B9;
	Wed, 23 Feb 2022 00:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF78618B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573337;
	bh=jnWz43F5iE+WKksdHdiiN5/7CIbxMSrEkWTU4Iql3qY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZVJ1eeDNpEn/ModYoYzHuP5T8j/G7lvPUG/mouoBle+r7inGfnVyPQgoCFVrpqea
	 O/ssR9hM9EhAI52NN6zPjZJ4GWlkw3DgRfwpQ1p+e9UpF05rJ5j3/jDr8A3E0BxUoV
	 3l49sgxBFP5x38ife1LoB/SD2yHu6oZxM7fwo86g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BE7F804F2;
	Wed, 23 Feb 2022 00:40:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08ACBF800F5; Wed, 23 Feb 2022 00:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13DA8F8012C
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DA8F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rrULc1Yf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A47161137;
 Tue, 22 Feb 2022 23:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A535BC340F1;
 Tue, 22 Feb 2022 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573233;
 bh=jnWz43F5iE+WKksdHdiiN5/7CIbxMSrEkWTU4Iql3qY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rrULc1YfsyztcczKqR64UCgZ7JEwstWj4lMWKiuS5LMjeMsnDlCYzy7CfiH4T9Z4Y
 olMWKeWNtwcE4ubJr1e90gQ+PXPJ1Etbt9xCNigWVFXG3HOaPc0KzNweTX/eZtcWGz
 YZeYru6FvDPl9kM1A/ak63VE0ZcGDZopPDcf1O+qGGWG07BU2zLlJlS4oZsSZ8nIFT
 i40r44orirmv2Pq2IHXT2Ez7xMLQkCGMY4rbgKmHGcoNIpa/TDMuti+OpzE3Oi8A/L
 AVqLhgJ57GJl4HwTUoJxEAqRe61mRs102GWcnLZ+pbloMtNfn8ZE9XbVuk2jIFOWGC
 hYYj2+zSPpBtQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 02/10] ASoC: max98095: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:18 +0000
Message-Id: <20220222234026.712070-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118; h=from:subject;
 bh=jnWz43F5iE+WKksdHdiiN5/7CIbxMSrEkWTU4Iql3qY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQlPGALgIuXnOD94w/Fx5URH5UuqDCIA0uFwpi7
 q2tR/fuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0JQAKCRAk1otyXVSH0NGsB/
 9RAsZx7VrBQ09/I1MypYQDJ5L0XezoJSztWPibY3cLVMgew+lkUtrdmGu/K5SmkOkgBmPP/VsAtAf0
 TSrZmuUylxdVqQMJgwVcEhnMVwifDmlOmLVMe2S94jVyBLN7UP2DCWSB9nqPV2gGK2dEuk3/ryRVN3
 e45AqhUSIZ5FR37CI40QVMR93wRmy9S/l/cGM4fPzCFuk0MKbKL7UZZxaaMKqgFtBDKeiMKMPQu49s
 1dPXiyvrMbH95YDt07jPifAFv9PvEUG9Hx+UyLMkagxWiTuYeG2omZSNaL3CodNGMXdd6POd7cpxaH
 Gdq3HA3IPkBeqVWgojvM91qI++RSw/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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

As part of moving to remove the old style defines for the bus clocks update
the max98095 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98095.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 736cd70be725..4977b00ddf5f 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1168,20 +1168,18 @@ static int max98095_dai1_set_fmt(struct snd_soc_dai *codec_dai,
 	if (fmt != cdata->fmt) {
 		cdata->fmt = fmt;
 
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* Slave mode PLL */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			/* Consumer mode PLL */
 			snd_soc_component_write(component, M98095_028_DAI1_CLKCFG_HI,
 				0x80);
 			snd_soc_component_write(component, M98095_029_DAI1_CLKCFG_LO,
 				0x00);
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* Set to master mode */
+		case SND_SOC_DAIFMT_CBP_CFP:
+			/* Set to provider mode */
 			regval |= M98095_DAI_MAS;
 			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-		case SND_SOC_DAIFMT_CBM_CFS:
 		default:
 			dev_err(component->dev, "Clock mode unsupported");
 			return -EINVAL;
@@ -1236,20 +1234,18 @@ static int max98095_dai2_set_fmt(struct snd_soc_dai *codec_dai,
 	if (fmt != cdata->fmt) {
 		cdata->fmt = fmt;
 
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* Slave mode PLL */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			/* Consumer mode PLL */
 			snd_soc_component_write(component, M98095_032_DAI2_CLKCFG_HI,
 				0x80);
 			snd_soc_component_write(component, M98095_033_DAI2_CLKCFG_LO,
 				0x00);
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* Set to master mode */
+		case SND_SOC_DAIFMT_CBP_CFP:
+			/* Set to provider mode */
 			regval |= M98095_DAI_MAS;
 			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-		case SND_SOC_DAIFMT_CBM_CFS:
 		default:
 			dev_err(component->dev, "Clock mode unsupported");
 			return -EINVAL;
@@ -1305,20 +1301,18 @@ static int max98095_dai3_set_fmt(struct snd_soc_dai *codec_dai,
 	if (fmt != cdata->fmt) {
 		cdata->fmt = fmt;
 
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* Slave mode PLL */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			/* Consumer mode PLL */
 			snd_soc_component_write(component, M98095_03C_DAI3_CLKCFG_HI,
 				0x80);
 			snd_soc_component_write(component, M98095_03D_DAI3_CLKCFG_LO,
 				0x00);
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* Set to master mode */
+		case SND_SOC_DAIFMT_CBP_CFP:
+			/* Set to provider mode */
 			regval |= M98095_DAI_MAS;
 			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-		case SND_SOC_DAIFMT_CBM_CFS:
 		default:
 			dev_err(component->dev, "Clock mode unsupported");
 			return -EINVAL;
-- 
2.30.2

