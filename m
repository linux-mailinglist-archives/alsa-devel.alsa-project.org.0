Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CA53BA4D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0DB617E6;
	Thu,  2 Jun 2022 15:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0DB617E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178354;
	bh=hPD9UPXv9laZSn72/ca1ez0hRTUXIdXafWqHrvn5ixI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUbU6YZXPk2PlfXQdgw6gOaSj6GVy8GP7aE50FqpEjdLLk4/kDs0+1sQgLtmD3yIe
	 yLQ8TW1LZK9ve3NgCuyQzzThc74FpNnVWcVru/S+7bvU8AauzpbuAK4URkXyYOfPrs
	 Cj+q7dbyoNHAefcpPRNgnzT04rh2m4sxq0pAbUio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8261AF805C0;
	Thu,  2 Jun 2022 15:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93345F805A0; Thu,  2 Jun 2022 15:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B92FF80571
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B92FF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XIc7m+lZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A336BB81ED6;
 Thu,  2 Jun 2022 13:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B802C385A5;
 Thu,  2 Jun 2022 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178021;
 bh=hPD9UPXv9laZSn72/ca1ez0hRTUXIdXafWqHrvn5ixI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIc7m+lZqp4nN+bFkiUfMf0TERUPyLPQt9Jtd/C/KTnEp8+PWDfT4XR5k9WvqydUh
 xlS8mliGH9MTEoNRZrnF/2Q7fgz78UgY8ADT+EOWeKn045zfP5LN5HLXkhbwF3/skn
 ZMYcXrPm5oowbMNXOBiMX1DXn5Tlh4u6PHbveiVXprZzry21+/w84vHE/pzJ24oB1S
 9erbYM4MxgGXOET7L8tkz+1Cd5rQ86/WvxFC0sLljmKcjhUWmW8tOVsdf+kJPc1kx+
 u0NFY+cY75JC2FNS7zQqC4jLb+D0WeXMQx90Lkb6r6IzcB34cPI1JtuLJ7SGwCSg2b
 rosFo/Nwe7w0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 17/20] ASoC: tlv320aic31xx: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:13 +0200
Message-Id: <20220602135316.3554400-18-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; h=from:subject;
 bh=hPD9UPXv9laZSn72/ca1ez0hRTUXIdXafWqHrvn5ixI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCbxMAjr5QiYgBIhoKJOhyqzNql4pVL0D8qHxWi
 dbLweLyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAmwAKCRAk1otyXVSH0PQTB/
 4lPCgZULI04vXGgdPMniUgR86Bav5YwoQAfpnRNW82UhsDNFOBdn1cgEM+4e00qt6UIkAVhBrAbXmp
 tBGSxbCalIx93MsUs/LlRYCq/ig6VlHMYQawuSflOYUEe+pPWqAZ8OzD9ibma6Xe2g1dYlnk4VfcCP
 FmbBIWsK4RBKI9P88A2s/FBb1TD0k0rsgIAVCUZqiTofb5FGu9Bw4aVxDG2Ta56Yj+CYlOxvaKvc0g
 ZxGD+nk49AuBRsXsjbU4CX0qbwE4ty+9uqwHjsunEud1PyacD3c06bx1b7L+OzhdNI7ZsL8+7+papK
 XTMO/K10jVkF7vkhIyZYER4Ui+t8MA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
the tlv320aic31xx driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index b2e59581c17a..aacee2367992 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1033,8 +1033,8 @@ static int aic31xx_clock_master_routes(struct snd_soc_component *component,
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	fmt &= SND_SOC_DAIFMT_MASTER_MASK;
-	if (fmt == SND_SOC_DAIFMT_CBS_CFS &&
+	fmt &= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+	if (fmt == SND_SOC_DAIFMT_CBC_CFC &&
 	    aic31xx->master_dapm_route_applied) {
 		/*
 		 * Remove the DAPM route(s) for codec clock master modes,
@@ -1051,7 +1051,7 @@ static int aic31xx_clock_master_routes(struct snd_soc_component *component,
 			return ret;
 
 		aic31xx->master_dapm_route_applied = false;
-	} else if (fmt != SND_SOC_DAIFMT_CBS_CFS &&
+	} else if (fmt != SND_SOC_DAIFMT_CBC_CFC &&
 		   !aic31xx->master_dapm_route_applied) {
 		/*
 		 * Add the needed DAPM route(s) for codec clock master modes,
@@ -1083,21 +1083,20 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	dev_dbg(component->dev, "## %s: fmt = 0x%x\n", __func__, fmt);
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface_reg1 |= AIC31XX_BCLK_MASTER | AIC31XX_WCLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		iface_reg1 |= AIC31XX_WCLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		iface_reg1 |= AIC31XX_BCLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		dev_err(component->dev, "Invalid DAI master/slave interface\n");
+		dev_err(component->dev, "Invalid DAI clock provider\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

