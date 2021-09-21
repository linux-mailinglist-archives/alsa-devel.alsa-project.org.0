Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFF413C32
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:16:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF93916AD;
	Tue, 21 Sep 2021 23:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF93916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259017;
	bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PizIFPNH9RApisQ7k7bgRDiQ4HJwIeDMJdOJant9r+O1hBKSn6GlVPo0JNrjuFKnf
	 Kc5VLoLM8Cw+GeNZVgwNZQlKgSKargcojawvmaamELQxiVVmEI+dJNtECJpPni1Y6q
	 lB8DWFAZ2sv6HNTEicTAxCYSHYeGBotECliGKd8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B162CF8053D;
	Tue, 21 Sep 2021 23:12:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B91AF8053D; Tue, 21 Sep 2021 23:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E50FF80535
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E50FF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qZHTV8DO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9BC961159;
 Tue, 21 Sep 2021 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258722;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZHTV8DOHq7oNRYFVVCSsrIyYsBSOmaD6zpecjOgeKkj6FTScP5ozC/FpNYoCPj70
 kwiopUcouOo6pQdJJbII0gCs3EwYrIjEFEs4eiaGJa5tXfnJFJRpVqrl5dvGci7Kdc
 /T7mTh8Xg3nhpsVFt3YScv7m5D0KUN5hEj/Vp/YadIrhdaOgVVZsh1Y1GEu88qu+ZA
 EYf809XbbgxL2x1afyvegTSYuo3ITdazRUA6VtdYJEW6wEDBtd2Q4/3tDRLII1ch3c
 J22HCAbeTZVvLIQXTOKeMsJgpPHJowf0qKxz+C9TGVL75ha+xk2lzXpxevNVixbx76
 myqKO8ARq5d7w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 15/16] ASoC: pl1022_ds: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:39 +0100
Message-Id: <20210921211040.11624-15-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; h=from:subject;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknmraBkqj0wEwEH9n/wZXSoslC7ytCzj5bPJuG2
 iiO9U+uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5gAKCRAk1otyXVSH0HadB/
 9E4fxdlHjmP1lGFzuCqwLhyH6bSW0oO6jyJWZ+YzXftg9Yiz78YzYn0rW0Ms+SjuSNKAd5JeW0Vz8c
 ykNxAUi5p4RrxSdgOkHB9u2LSqOTnJRWrKspCIjuC13Qov2VjaxLZCtlogijLO8zKmbqdNANjJeEIa
 PNpsdGL5h56v6UVG142q8ZanqzvBz/F6teVQckkagOo4GIjuJaPehYwL0JQgxXb6GfM+2yQvj8F9ob
 e9CNwJrG/KXG76p3MGEzS9JIk2NbM3ozVVSPnPhZiymwayMbtE2W6DL5Q4OtUgMg/SACsvHeCSyrCL
 y+iiCUbv6rJPdz5xoSJd++R94sVfVC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
the pl1022_ds driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/p1022_ds.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 317c767b0099..b45742931b0d 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -275,7 +275,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
 
 	if (strcasecmp(sprop, "i2s-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 
@@ -293,37 +293,37 @@ static int p1022_ds_probe(struct platform_device *pdev)
 		mdata->clk_frequency = be32_to_cpup(iprop);
 	} else if (strcasecmp(sprop, "i2s-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "lj-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "lj-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "rj-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "rj-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "ac97-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "ac97-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else {
-- 
2.20.1

