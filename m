Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3E5742EF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB76185E;
	Thu, 14 Jul 2022 06:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB76185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772914;
	bh=uwPXRMAA96VqSh+TZh2f80g4MkVZh92p9R/dw4aDIT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kz7UGTX/WzccsDnMnIgp2GnphcmpuI6ehVlluFV6dSLsh6jyoNOx0UFoeQSI/46zt
	 nq1n3Wf46/Nspielbc1ZljOJ/OV/bzHn+feUe7FXE9tuxs7pOjKCEUuwt+VZUx6LSB
	 xMyktnIDzFYVIERGFyo2DL6neOINng+xuOUQI+ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B434F805E3;
	Thu, 14 Jul 2022 06:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351A4F805E8; Thu, 14 Jul 2022 06:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6ECFF805D9
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6ECFF805D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qyQ88Dqu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5BB05B82371;
 Thu, 14 Jul 2022 04:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959E1C36AE9;
 Thu, 14 Jul 2022 04:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772594;
 bh=uwPXRMAA96VqSh+TZh2f80g4MkVZh92p9R/dw4aDIT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qyQ88DqusZJ+5RQTdFSfFE+Ig+RltJiHorA+O8ByC1jFf8hrzQtr+xHFkC7XzwRgb
 sO6PI5UmHQpwGFg2aq/73jR+6hlNm9GVyjDjJxg82+gp+m6bvKg/naGxXSwNmJx1aE
 wNYd/aYp3JUm98q6gLrYcQ7i8gLwglrXeU5lIV0ClfItc8RN3Kx6yJOvQxIs6FarVI
 nPZ9Muwz+cJmrpu27UnUu4gxuBDTZv+RWM2XyRXjgEDrvKWOe+MVyiNPosDBbP4+yK
 1e8IRilO4r2CWUiMMxbzQ5LGdX39KXKvOBogdrx6WqBuFfTgM3rsURgYRFwGkbnpJC
 r1PIRD/iMFTdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 19/41] ASoC: cs35l41: Correct some control names
Date: Thu, 14 Jul 2022 00:21:59 -0400
Message-Id: <20220714042221.281187-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit c6a5f22f9b4fd5f21414be690ce34046d9712f05 ]

Various boolean controls on cs35l41 are missing the required "Switch" in
the name, add these.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220621102041.1713504-3-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l41.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6b784a62df0c..20c76a53a508 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -392,7 +392,7 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 	SOC_SINGLE("HW Noise Gate Enable", CS35L41_NG_CFG, 8, 63, 0),
 	SOC_SINGLE("HW Noise Gate Delay", CS35L41_NG_CFG, 4, 7, 0),
 	SOC_SINGLE("HW Noise Gate Threshold", CS35L41_NG_CFG, 0, 7, 0),
-	SOC_SINGLE("Aux Noise Gate CH1 Enable",
+	SOC_SINGLE("Aux Noise Gate CH1 Switch",
 		   CS35L41_MIXER_NGATE_CH1_CFG, 16, 1, 0),
 	SOC_SINGLE("Aux Noise Gate CH1 Entry Delay",
 		   CS35L41_MIXER_NGATE_CH1_CFG, 8, 15, 0),
@@ -400,15 +400,15 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 		   CS35L41_MIXER_NGATE_CH1_CFG, 0, 7, 0),
 	SOC_SINGLE("Aux Noise Gate CH2 Entry Delay",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 8, 15, 0),
-	SOC_SINGLE("Aux Noise Gate CH2 Enable",
+	SOC_SINGLE("Aux Noise Gate CH2 Switch",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 16, 1, 0),
 	SOC_SINGLE("Aux Noise Gate CH2 Threshold",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 0, 7, 0),
-	SOC_SINGLE("SCLK Force", CS35L41_SP_FORMAT, CS35L41_SCLK_FRC_SHIFT, 1, 0),
-	SOC_SINGLE("LRCLK Force", CS35L41_SP_FORMAT, CS35L41_LRCLK_FRC_SHIFT, 1, 0),
-	SOC_SINGLE("Invert Class D", CS35L41_AMP_DIG_VOL_CTRL,
+	SOC_SINGLE("SCLK Force Switch", CS35L41_SP_FORMAT, CS35L41_SCLK_FRC_SHIFT, 1, 0),
+	SOC_SINGLE("LRCLK Force Switch", CS35L41_SP_FORMAT, CS35L41_LRCLK_FRC_SHIFT, 1, 0),
+	SOC_SINGLE("Invert Class D Switch", CS35L41_AMP_DIG_VOL_CTRL,
 		   CS35L41_AMP_INV_PCM_SHIFT, 1, 0),
-	SOC_SINGLE("Amp Gain ZC", CS35L41_AMP_GAIN_CTRL,
+	SOC_SINGLE("Amp Gain ZC Switch", CS35L41_AMP_GAIN_CTRL,
 		   CS35L41_AMP_GAIN_ZC_SHIFT, 1, 0),
 	WM_ADSP2_PRELOAD_SWITCH("DSP1", 1),
 	WM_ADSP_FW_CONTROL("DSP1", 0),
-- 
2.35.1

