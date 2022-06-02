Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30753BA2C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B051774;
	Thu,  2 Jun 2022 15:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B051774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178129;
	bh=F2pYS6kIWwAfwRbdvcqGY8oMDkGLureXRfIP8HCsUSk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/wmefACiw4Dp7tKQgqTOg0tvBJdBYpR8tqx90wHWJx1ZKznnuyyEXs+wUh2oc1J5
	 Q2FdxvzsQ6cwF2DTAqJB0HwUgvnfBYqlj6+wb7nW0GWcrduUYHGq02Hhn+wwbH/xby
	 A75qGcCywNU1ivlTS1j4au+1W6I01WQdYuQD90QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B70F80537;
	Thu,  2 Jun 2022 15:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67ECBF8052E; Thu,  2 Jun 2022 15:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AFA6F80236
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AFA6F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cYZKQBXY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 328FE617CF;
 Thu,  2 Jun 2022 13:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0FCC36AE7;
 Thu,  2 Jun 2022 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178005;
 bh=F2pYS6kIWwAfwRbdvcqGY8oMDkGLureXRfIP8HCsUSk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cYZKQBXY5wtbf9ol/9sQYn0emU4Kceyh85hxPM9F79Kssl97btcgTfq2AabITWQlS
 it5/rrpD2ssDMoYG7YMEIjyovYnLJVbvGYmAJmd09BsuXz/WE0m/9pKVBZfktC8DHR
 YeUCKWYjV5s7N+mWQgmXrTf5v41a98CjhEUwuP8LmEyWhUfFGl0Iy6i9sLzE8nbYyW
 IU+BDj7dhF8nyuxwxYLlCh97AcalnsvOmk2kte4CP7C7jLILhgYhOU2vMGAlCyZKeJ
 NBIJFBKiI+Sl1IrNV5/+5714GD5PtupYfrgqyQG+oHcwvSTvVupcvljUnUqa8cHu8C
 M3G8H/x+YZZZA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 02/20] ASoC: max98090: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:52:58 +0200
Message-Id: <20220602135316.3554400-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; h=from:subject;
 bh=F2pYS6kIWwAfwRbdvcqGY8oMDkGLureXRfIP8HCsUSk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqQZB/orjuxiivLZUj7zZsUt155pNezvLhd86nGN83My83ng
 IuDSyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMRNiL/Q9fv4xwqD7bo+bY6X1O09
 tuf1f8fsPE+5xlDrNd68J1kz2sVZPj6szD/4U09ThXnPc+0qD6/fHumh3HtjrO4FB9vLko5/ktF+Ve
 1+9865VtRVrFFbUMZtZKs8/5U3HoHof0Xm+l9U2LZeOvnWtdvkflv05mU9Vd347gIsP03cX5QdlMXX
 f7Hm59pz/v0fp/f+fX+t0X0c98ftfY/tAbk6hiY9NLQW7t/vXfF1+eynGu9/sDkW6JAK7dMl07Natz
 Xxxbmt76ra18YU3W1s/WvfN8UlsU+s+bTw0WnvlE70ST4JVNReGMDOUdtk96FbQnR6zyK1B0PXDqK/
 vkd/uq54TlsB0NXvTGVGFt5hkLAA==
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
the max98090 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 576277a82d41..72471cdb2229 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1591,9 +1591,9 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		cdata->fmt = fmt;
 
 		regval = 0;
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* Set to slave mode PLL - MAS mode off */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			/* Set to consumer mode PLL - MAS mode off */
 			snd_soc_component_write(component,
 				M98090_REG_CLOCK_RATIO_NI_MSB, 0x00);
 			snd_soc_component_write(component,
@@ -1602,8 +1602,8 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 				M98090_USE_M1_MASK, 0);
 			max98090->master = false;
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* Set to master mode */
+		case SND_SOC_DAIFMT_CBP_CFP:
+			/* Set to provider mode */
 			if (max98090->tdm_slots == 4) {
 				/* TDM */
 				regval |= M98090_MAS_MASK |
@@ -1619,8 +1619,6 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 			}
 			max98090->master = true;
 			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-		case SND_SOC_DAIFMT_CBM_CFS:
 		default:
 			dev_err(component->dev, "DAI clock mode unsupported");
 			return -EINVAL;
-- 
2.30.2

