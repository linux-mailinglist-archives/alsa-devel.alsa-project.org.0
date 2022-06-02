Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075753BA4A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D219417DE;
	Thu,  2 Jun 2022 15:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D219417DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178322;
	bh=w26GDr/I+IdfLueq+CV/vjxvXeVOWHryrtibdOth3S4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5QJfmKw2oVKWe/G/6nqOb9ZiXQ4DEIkS64grs3Z/p2YceFa0B0+NTn9GxndNHeXX
	 FwV9VPqjKZhg1Vxb6Lc1icVP3sdkG3cShzSALnm4/bF+KstfB14/3LmVf4VofcKxyd
	 JaBDgtMzU5WgVrKMDosXm9G/JGajAnGd80cfo3cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E133F805B2;
	Thu,  2 Jun 2022 15:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A799F8057D; Thu,  2 Jun 2022 15:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C416DF80563
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C416DF80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dD0J3I6I"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56D70B81F5B;
 Thu,  2 Jun 2022 13:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDC6C3411D;
 Thu,  2 Jun 2022 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178019;
 bh=w26GDr/I+IdfLueq+CV/vjxvXeVOWHryrtibdOth3S4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dD0J3I6IxiDRcQFfwV3jxEsC/ihvNznNttADNg31wv7POHM3qBK3WeUfiXDZIkg+y
 ysYAt9VTWVSruyivZxp2yJpvyeuRBvT5XBg9R38MRwVADQ+C3op0GJ7E4AT417uNAY
 lQ+ouAcSbsqs7TAN0rIPF/8jR4Z65kIQE95HBrGympYQLmMGWJmgfuW/ZbUCXpVuxI
 4MO/GNMZ20e0TNgS/gAO9f3XmpLxrnQna1Y/6w7rfJwNb/kn4QYl+mij97dxo4MrAJ
 glKTQZaAU4Q7jLnATDQG0UUezXYFblMPgmG+fWTMjXOAiriWaQTQyKaQW0J/Glaxpx
 52WfYkOmCrRIg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 15/20] ASoC: tlv320aic23: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:11 +0200
Message-Id: <20220602135316.3554400-16-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; h=from:subject;
 bh=w26GDr/I+IdfLueq+CV/vjxvXeVOWHryrtibdOth3S4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCaQoriQccfch/8J29dqi8qMe4zIKOH7xfVhr/K
 GFlc5KGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAmgAKCRAk1otyXVSH0BEYB/
 41+L5ra4v+dlnh+dQ5K3qJSNpeZDsxlvgi+q8RQKMInp6iIjOCL+DLELKn/WKORIWgvlxLgB7I8PHd
 eBpM4TtTZDOcWX+WI5vlGONjhVnWawRbbQ10LfqJ0DKp10C5ZMBezetPptsa/yOgO6GEjXWTsYHIZI
 XvTmTRUEP+8xj/WZA8esOuaAV2LgEyQ7OLwP2iL47g/vKMbVgNHRB7AfNcrcMYLw1TvLg3kV9bsxnV
 jWiGC05f3bQ01TcYozmVvsj+lthKWdCxGAmAj5BKp79/7cOv+8or2MkbM3FCV/M5yoYFvZXDlwdkSG
 gdajUBwt14utiNSm4l4dC037YLzsZz
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
the tlv320aic23 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic23.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 2400093e2c99..f0d1c470fbf4 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -429,12 +429,11 @@ static int tlv320aic23_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	iface_reg = snd_soc_component_read(component, TLV320AIC23_DIGT_FMT) & (~0x03);
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface_reg |= TLV320AIC23_MS_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		iface_reg &= ~TLV320AIC23_MS_MASTER;
 		break;
 	default:
-- 
2.30.2

