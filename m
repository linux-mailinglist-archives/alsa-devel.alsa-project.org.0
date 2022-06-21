Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35A5539E9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 20:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0AF201A;
	Tue, 21 Jun 2022 20:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0AF201A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655837952;
	bh=2xsWIxZWNcmnA/fSbyReBOaWSpwo1zz6UKyS8jFCJ1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VhzayggYHjNcMeuDVPx2Ges2d6YFNZajrBFELM3PdEK2liDdax+ztXUnGXvc1tB7A
	 cgoVMfsd77jaBGdca0YeOzKNtOEHvd7mih1dh5Jsz9lJvWa0ObDXd09SxC7Ms7S1bY
	 5OSsEFgbt7GfW0ULDDT5ukKDw2V0JO00p70n79pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86EC1F80253;
	Tue, 21 Jun 2022 20:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30E46F80155; Tue, 21 Jun 2022 20:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 369B4F80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 20:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 369B4F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jHnzKEj5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43FB2B80F1A;
 Tue, 21 Jun 2022 18:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DBCC3411C;
 Tue, 21 Jun 2022 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655837879;
 bh=2xsWIxZWNcmnA/fSbyReBOaWSpwo1zz6UKyS8jFCJ1c=;
 h=From:To:Cc:Subject:Date:From;
 b=jHnzKEj5GGG2YK/PcG1gY5A27p4dUbt/IiTwOJaasEvKaNn86EQBy3nSIAVAiGnep
 lMyJYjHaPsCnhs7XJsaSNDhESynN7qiQt62+GVNfrsRuSdVQgjvyb75PqR+Papyd9q
 eMga+hXbSgaoN8RV1C+Ij/1CZ1lZme4ECzxW3n8H9Et3qOw8xDdGijdu307QXXXios
 uqA2yo4W0ymBA8YoRYDujz3RdFQAAaXgi1kz6kUXrCaYdo89mjIxLgtXk9JeVBYZ3a
 eNWj/ihwpkYKGlZkGPMO/NW6K7QcYqdJIUdKw4FvZGLdYufncLfvp6JVWZtRpdSmHP
 5yXlNmZXd9DGw==
Received: by wens.tw (Postfix, from userid 1000)
 id 83D575F9C4; Wed, 22 Jun 2022 02:57:55 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: rockchip: i2s: Fix crash on missing pinctrl
Date: Wed, 22 Jun 2022 02:57:47 +0800
Message-Id: <20220621185747.2782-1-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

From: Chen-Yu Tsai <wens@csie.org>

Commit 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO") added
pinctrl lookups, but did not skip the lookup if there was no pinctrl
device tied to the I2S controller. As a result, the lookup was done
on an invalid pointer in such cases, causing a kernel panic.

Only do the subsequent pinctrl state lookups and switch if a pinctrl
device was found.

i2s_pinctrl_select_bclk_{on,off} already guard against missing pinctrl
device or pinctrl state, so those two functions aren't touched.

Fixes: 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

This is based on next-20220621, which just saw the inclusion of the
commit this patch fixes.

This issue was found and tested on ROC-RK3328-CC. Tried to test on
RK3399, but that has some other DRM driver related crash.

 sound/soc/rockchip/rockchip_i2s.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index be051e48b97b..9fa8ffd712ea 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -808,24 +808,23 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	i2s->bclk_ratio = 64;
 	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(i2s->pinctrl))
+	if (IS_ERR(i2s->pinctrl)) {
 		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
+	} else {
+		i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
+		if (IS_ERR_OR_NULL(i2s->bclk_on))
+			dev_err(&pdev->dev, "failed to find i2s default state\n");
+		else
+			dev_dbg(&pdev->dev, "find i2s bclk state\n");
 
-	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
-				   "bclk_on");
-	if (IS_ERR_OR_NULL(i2s->bclk_on))
-		dev_err(&pdev->dev, "failed to find i2s default state\n");
-	else
-		dev_dbg(&pdev->dev, "find i2s bclk state\n");
-
-	i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
-				  "bclk_off");
-	if (IS_ERR_OR_NULL(i2s->bclk_off))
-		dev_err(&pdev->dev, "failed to find i2s gpio state\n");
-	else
-		dev_dbg(&pdev->dev, "find i2s bclk_off state\n");
+		i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
+		if (IS_ERR_OR_NULL(i2s->bclk_off))
+			dev_err(&pdev->dev, "failed to find i2s gpio state\n");
+		else
+			dev_dbg(&pdev->dev, "find i2s bclk_off state\n");
 
-	i2s_pinctrl_select_bclk_off(i2s);
+		i2s_pinctrl_select_bclk_off(i2s);
+	}
 
 	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
 	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.34.1

