Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEB17C15F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE2F2828;
	Fri,  6 Mar 2020 16:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE2F2828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507483;
	bh=FY3u+WV0GytbAi8I5Sv52VY+RDCRUhthWj0EhuBZIm4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YI0mU649TmHA3knZpF0es+/8Urx5EAqyz2p6q1zq1NyPybof6tqRhgZwHkLFip+VN
	 zfOv58jQKMXwQam+81jiwuBGBss8vaNznmwul+sfcdwG2JG2HJ1yVBgKvQtP6Hg/5H
	 owMefAi02kz29YMS8NigyOrs6z77xYPtjOVNoBvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE0DF80307;
	Fri,  6 Mar 2020 16:03:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E92DF80306; Fri,  6 Mar 2020 16:03:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 80616F802FB
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80616F802FB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49A1E30E;
 Fri,  6 Mar 2020 07:03:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C21B63F237;
 Fri,  6 Mar 2020 07:03:51 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: wcd934x: fix High Accuracy Buck enable" to the asoc
 tree
In-Reply-To: <20200306132806.19684-2-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200306132806.19684-2-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

The patch

   ASoC: wcd934x: fix High Accuracy Buck enable

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 820766c1e16651b46bfb771afae8d789da1986cf Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 6 Mar 2020 13:28:05 +0000
Subject: [PATCH] ASoC: wcd934x: fix High Accuracy Buck enable

High Accuracy buck is not applicable when we use RCO Band Gap source,
so move it back to correct place.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200306132806.19684-2-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index aefaadfba8a1..83d643a07775 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1202,11 +1202,6 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
 				   WCD934X_ANA_RCO_BG_EN_MASK, 0);
 		usleep_range(100, 110);
-	} else if (sido_src == SIDO_SOURCE_RCO_BG) {
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
-				   WCD934X_ANA_RCO_BG_EN_MASK,
-				   WCD934X_ANA_RCO_BG_ENABLE);
-		usleep_range(100, 110);
 		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
 				   WCD934X_ANA_BUCK_PRE_EN1_MASK,
 				   WCD934X_ANA_BUCK_PRE_EN1_ENABLE);
@@ -1219,6 +1214,11 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 				   WCD934X_ANA_BUCK_HI_ACCU_EN_MASK,
 				   WCD934X_ANA_BUCK_HI_ACCU_ENABLE);
 		usleep_range(100, 110);
+	} else if (sido_src == SIDO_SOURCE_RCO_BG) {
+		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
+				   WCD934X_ANA_RCO_BG_EN_MASK,
+				   WCD934X_ANA_RCO_BG_ENABLE);
+		usleep_range(100, 110);
 	}
 	wcd->sido_input_src = sido_src;
 
-- 
2.20.1

