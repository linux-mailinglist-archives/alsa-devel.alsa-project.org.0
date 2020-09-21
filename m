Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43878272896
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:45:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923CC16BD;
	Mon, 21 Sep 2020 16:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923CC16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600699501;
	bh=HJ0fqNrp+Bhcjke61Potcbjf5sO95xFxNuP7mRzpk34=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTAHr750AeUKxmucanOdKGYmiYwvF053dWUq4k1UyKwrYrk2FSlTbZJpXqQ9b+HwB
	 nBMGnKUML7o85oAUdcHmzQNzvJsPtoVqBA2LfN1sY0bV/0O4TSVhHca+VbCc/ReA6m
	 6WKPrSPiLcvdKbQssdIBrfMJ1Gazb/I0MeBesMD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE08BF802F9;
	Mon, 21 Sep 2020 16:41:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43B87F802E3; Mon, 21 Sep 2020 16:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA2FF802E3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA2FF802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eULxbRvi"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C5A123788;
 Mon, 21 Sep 2020 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699260;
 bh=HJ0fqNrp+Bhcjke61Potcbjf5sO95xFxNuP7mRzpk34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eULxbRviYpdG45f6gzz5eLZ/0ggvSqbMtdHf1pAI2Vqx9n3mAdtFF3bpqI78ydIY9
 gS5euwm4vSLB2uk+S41Xe/KnmmRw72IuXnDrfo7uwx0mLQ1KwFZMs5pi8HLd138l9M
 X691vRzx/pusgQlMICkr+crL8O6KRxowb7ZwhTT0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/15] ASoC: wm8994: Ensure the device is resumed
 in wm89xx_mic_detect functions
Date: Mon, 21 Sep 2020 10:40:43 -0400
Message-Id: <20200921144054.2135602-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144054.2135602-1-sashal@kernel.org>
References: <20200921144054.2135602-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
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

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

[ Upstream commit f5a2cda4f1db89776b64c4f0f2c2ac609527ac70 ]

When the wm8958_mic_detect, wm8994_mic_detect functions get called from
the machine driver, e.g. from the card's late_probe() callback, the CODEC
device may be PM runtime suspended and any regmap writes have no effect.
Add PM runtime calls to these functions to ensure the device registers
are updated as expected.
This suppresses an error during boot
"wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
caused by the regmap access error due to the cache_only flag being set.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200827173357.31891-2-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8994.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 64635f9cdae65..6dbab3fc6537e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3372,6 +3372,8 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(component->dev);
+
 	switch (micbias) {
 	case 1:
 		micdet = &wm8994->micdet[0];
@@ -3419,6 +3421,8 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	snd_soc_dapm_sync(dapm);
 
+	pm_runtime_put(component->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm8994_mic_detect);
@@ -3786,6 +3790,8 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(component->dev);
+
 	if (jack) {
 		snd_soc_dapm_force_enable_pin(dapm, "CLK_SYS");
 		snd_soc_dapm_sync(dapm);
@@ -3854,6 +3860,8 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		snd_soc_dapm_sync(dapm);
 	}
 
+	pm_runtime_put(component->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm8958_mic_detect);
-- 
2.25.1

