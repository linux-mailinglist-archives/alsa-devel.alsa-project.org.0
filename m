Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215C2AD336
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45BB116F0;
	Tue, 10 Nov 2020 11:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45BB116F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003085;
	bh=ZRA5ar5oRc9KhH4sv/bc040jD4W2h07i50b8bs/x4TE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/DHqizCk57cl7MU6GbbcN51apVVvdn9WL8GqQu2kZQ4rXeaO2rRHAPY4ve+v2D6v
	 8iL3tRHGQ9XIYwnRu8cQI4M74bfkQVfCmtM0+lh84r8E0DFCgKoyjmzwjsWcERlO2y
	 G+2klEhTR+FTRI7P63F5NgWtwvaKL6WXeuHnWAPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5111F80059;
	Tue, 10 Nov 2020 11:09:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5789F801D5; Tue, 10 Nov 2020 11:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 7C2E1F80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 11:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C2E1F80059
Received: from NTHCCAS04.nuvoton.com (nthccas04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 08E961C80F3D;
 Tue, 10 Nov 2020 18:09:39 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Nov 2020 18:09:38 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.1847.3 via Frontend
 Transport; Tue, 10 Nov 2020 18:09:38 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: nau8315: revise the power event of EN_PIN dapm
 widget for symmetry
Date: Tue, 10 Nov 2020 17:58:25 +0800
Message-ID: <20201110095823.3512447-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102023212.594137-1-CTLIN0@nuvoton.com>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotRedirectTo-PP: TRUE
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

This patch is to revise the power event of EN_PIN dapm widget for symmetry.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8315.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
index e6bc5c0a5036..2b66e3f7a8b7 100644
--- a/sound/soc/codecs/nau8315.c
+++ b/sound/soc/codecs/nau8315.c
@@ -65,7 +65,7 @@ static int nau8315_enpin_event(struct snd_soc_dapm_widget *w,
 	struct nau8315_priv *nau8315 =
 		snd_soc_component_get_drvdata(component);
 
-	if (event & SND_SOC_DAPM_POST_PMU)
+	if (event & SND_SOC_DAPM_PRE_PMU)
 		nau8315->enpin_switch = 1;
 	else if (event & SND_SOC_DAPM_POST_PMD)
 		nau8315->enpin_switch = 0;
@@ -77,7 +77,7 @@ static const struct snd_soc_dapm_widget nau8315_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
 	SND_SOC_DAPM_OUT_DRV_E("EN_Pin", SND_SOC_NOPM, 0, 0, NULL, 0,
 			nau8315_enpin_event,
-			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route nau8315_dapm_routes[] = {
-- 
2.25.1

