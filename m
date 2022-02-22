Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93E4C0575
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB6C18DF;
	Wed, 23 Feb 2022 00:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB6C18DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573417;
	bh=Ov79U4TgPQ+gMDAWw14lQv/noTeCCug2XzBJ0Z4tL+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCX/p/GxDR1Zfp/jucgFUzmeZZEx2ybIi2tkOBAQTTNAamKXnnYrZncK5E7CLiVwZ
	 h4r0BqJe4Gpd7Wn8tsiTWtscOBCl7bfNdGiqxJF6DdtAH7FGalsUwCEPJEUUcfzxCC
	 i9r3OmnWseKMMG4n8XGvlGLtk+YRUQpixlDmU2X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8015EF80533;
	Wed, 23 Feb 2022 00:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D26AF8051F; Wed, 23 Feb 2022 00:40:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F16FF80511
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F16FF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tVBgTdp2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCD8D61136;
 Tue, 22 Feb 2022 23:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48E3C340E8;
 Tue, 22 Feb 2022 23:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573242;
 bh=Ov79U4TgPQ+gMDAWw14lQv/noTeCCug2XzBJ0Z4tL+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tVBgTdp2ouda7n6GYNmALdjgSx4jiyjnZz9y+sf4Ix9Qead8RFXZquPfoN5GVAOid
 0TNb+V56YmQwjZJxk/iTFLPvVe0DNZ/cnSrVweSclo7Co3lGWHZUlNKp9BrttAOmXQ
 RNvRZkNjntZslRLYs6wVOwz7f2Mfvs7vPgNIuZ5Tue8hUGwDyLLpXfK3Qifw3GY3Hp
 v+qay050HY5J2Ble5PEHKfp2KA3IWeU4cTsFmoKNQKbEfZ+ksllVWKOMjOojswI3YV
 4UfEgwfEnYDP/HCvOu16YL9ntQeJ6qvlah2XM1FO10uvhBvMlh7NoU7CUtNbBu7AVa
 7vknKQ8fW6DWg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 08/10] ASoC: max98925: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:24 +0000
Message-Id: <20220222234026.712070-8-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; h=from:subject;
 bh=Ov79U4TgPQ+gMDAWw14lQv/noTeCCug2XzBJ0Z4tL+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQqsYEU5fi1MIHd1r0YJBv1Kvthd9GrL7UDi0Jn
 FEas/8CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0KgAKCRAk1otyXVSH0OV/B/
 0cRVCcSEiKMVSQDx7J063UIzTTOmztr8ET8CyKipkxC1BhrhFQ/d2z7I25mQ9rzktK2VwVs0gUCuag
 s7FPhtkzEhB7x9ESLtxhGsHrGczN0GFLZR6NWWRgi/NCuYATb+U4cgl/LszrHQ5a7qHaVDFriotZjM
 DUzsSoXf37/2WCU0eHICN8+E5UXuBYBlQ9VDqFjUUlSRUin1N0t6XxkuSktj/pGbnq+UKMrtDX5TGq
 +WlqTlHWq+HUMRM7q86XS1eifgI89X3VZki1wiz/TbHIUgMg32U+Ni6wCtgJbDjdGr5nKNczrRycn2
 7OWtjPP8pu/BjciYUgznHVO40/cX4M
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
the max98925 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98925.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index ddaccc24b0cb..f34fa274ae4f 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -300,25 +300,22 @@ static int max98925_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	unsigned int invert = 0;
 
 	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		/* set DAI to slave mode */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		regmap_update_bits(max98925->regmap,
 			MAX98925_DAI_CLK_MODE2,
 			M98925_DAI_MAS_MASK, 0);
 		max98925_set_sense_data(max98925);
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/*
-		 * set left channel DAI to master mode,
-		 * right channel always slave
+		 * set left channel DAI to provider mode,
+		 * right channel always consumer
 		 */
 		regmap_update_bits(max98925->regmap,
 			MAX98925_DAI_CLK_MODE2,
 			M98925_DAI_MAS_MASK, M98925_DAI_MAS_MASK);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
 	default:
 		dev_err(component->dev, "DAI clock mode unsupported");
 		return -EINVAL;
-- 
2.30.2

