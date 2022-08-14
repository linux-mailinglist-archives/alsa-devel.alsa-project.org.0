Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D1592407
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8DB01678;
	Sun, 14 Aug 2022 18:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8DB01678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494481;
	bh=jld3Qog9SsdZFeVcGy1YR+rTIrPAlZB2z9rTGiZgsQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mnd3MooJVHIULz1tYoZzo38XSu5JViNzLXHsCErY8nY/jvKGcHWg6O0KODFYfE5NZ
	 5wNPBU3hU1aHWqzCSk8dzSqtPdpaLkfXwYxYr4UkOJSuX9PuOvyhPBbDapHm/p8v8T
	 Sgsc70ShXK6oSEqSGVTZ9BmH6Ky0IR8q3zoxcgw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8753F80564;
	Sun, 14 Aug 2022 18:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA1AF80515; Sun, 14 Aug 2022 18:25:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A362F80515
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A362F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hekD7bP9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BC655CE0B12;
 Sun, 14 Aug 2022 16:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC11C433C1;
 Sun, 14 Aug 2022 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494327;
 bh=jld3Qog9SsdZFeVcGy1YR+rTIrPAlZB2z9rTGiZgsQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hekD7bP9IBu7P7CczgVwagAzJ/OuPu9aO9G+fSifaCW+Yy/fuRFZJ2iALq88PH5rC
 cFDZ5bvHlExCz1B5g8LKNIpTVDZ7z1/lmPj6BddWNWKRXG4m0G+az5sd2tByHQMdo1
 prqDAszQ5CR6CNaOgBBCB9G83y7RDoiwMJ0Wia6aorzdWsOhvedF/w/+ndUXcSvezt
 TzMSwww6ITvQhvU6pzmWTHKcZp1DUltQGWdn1ZEKIfUeeXUUgNYvZUf80IcFPO653n
 ps+4l8D7R5nMfXaes88uvoDsY0+SRSWWXw0a3B527hDM2xqm8ettYpQ09aqU9pmIV7
 ykLg5MwKOv1/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 26/39] ASoC: codecs: va-macro: use fsgen as clock
Date: Sun, 14 Aug 2022 12:23:15 -0400
Message-Id: <20220814162332.2396012-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit 30097967e0566cac817273ef76add100f6b0f463 ]

VA Macro fsgen clock is supplied to other LPASS Macros using proper
clock apis, however the internal user uses the registers directly without
clk apis. This approch has race condition where in external users of
the clock might cut the clock while VA macro is actively using this.

Moving the internal usage to clk apis would provide a proper refcounting
and avoid such race conditions.

This issue was noticed while headset was pulled out while recording is
in progress and shifting record patch to DMIC.

Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Link: https://lore.kernel.org/r/20220727124749.4604-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-va-macro.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index d18b56e60433..1ea10dc70748 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -199,6 +199,7 @@ struct va_macro {
 	struct clk *mclk;
 	struct clk *macro;
 	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 	struct lpass_macro *pds;
 
@@ -467,9 +468,9 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		return va_macro_mclk_enable(va, true);
+		return clk_prepare_enable(va->fsgen);
 	case SND_SOC_DAPM_POST_PMD:
-		return va_macro_mclk_enable(va, false);
+		clk_disable_unprepare(va->fsgen);
 	}
 
 	return 0;
@@ -1473,6 +1474,12 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
+	if (IS_ERR(va->fsgen)) {
+		ret = PTR_ERR(va->fsgen);
+		goto err_clkout;
+	}
+
 	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
-- 
2.35.1

