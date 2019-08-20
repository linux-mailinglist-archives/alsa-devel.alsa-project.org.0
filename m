Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F395738
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 08:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7033E1669;
	Tue, 20 Aug 2019 08:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7033E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566281894;
	bh=iJ1564dHQep52XPSsoKD+AD8WaABs8jqALMN/t9RLN4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=odDZJj60hAs4cBqZUNVP2LMIgftnBa+IPmSgDiVaEe+AM1YugLl6RjwEkE6GHFP/0
	 xwBk4WSKYaOuaM0B+ny9gTUo+NBIJ1k2mayfhLDM0xWvXzqR/9EGAFHdq6ZECbiMOD
	 VyA0F2h+dG/AP+3la7jLVoP37dBSpo6Zgd89Sys0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AAC5F8036E;
	Tue, 20 Aug 2019 08:16:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A7E7F8036E; Tue, 20 Aug 2019 08:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by alsa1.perex.cz (Postfix) with ESMTP id EFB2FF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 08:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB2FF800BF
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 20 Aug 2019 15:16:18 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by iyokan-ex.css.socionext.com (Postfix) with ESMTP id CFEDF605F8;
 Tue, 20 Aug 2019 15:16:18 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Tue, 20 Aug 2019 15:16:18 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
 by kinkan.css.socionext.com (Postfix) with ESMTP id 4DF4B1A04FC;
 Tue, 20 Aug 2019 15:16:18 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Tue, 20 Aug 2019 15:16:04 +0900
Message-Id: <1566281764-14059-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-arm-kernel@lists.infradead.org,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: uniphier: Fix double reset assersion
	when transitioning to suspend state
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When transitioning to supend state, uniphier_aio_dai_suspend() is called
and asserts reset lines and disables clocks.

However, if there are two or more DAIs, uniphier_aio_dai_suspend() are
called multiple times, and double reset assersion will cause.

This patch defines the counter that has the number of DAIs at first, and
whenever uniphier_aio_dai_suspend() are called, it decrements the
counter. And only if the counter is zero, it asserts reset lines and
disables clocks.

In the same way, uniphier_aio_dai_resume() are called, it increments the
counter after deasserting reset lines and enabling clocks.

Fixes: 139a34200233 ("ASoC: uniphier: add support for UniPhier AIO CPU DAI driver")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 sound/soc/uniphier/aio-cpu.c | 31 +++++++++++++++++++++----------
 sound/soc/uniphier/aio.h     |  1 +
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index ee90e6c..2ae582a 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -424,8 +424,11 @@ int uniphier_aio_dai_suspend(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 
-	reset_control_assert(aio->chip->rst);
-	clk_disable_unprepare(aio->chip->clk);
+	aio->chip->num_wup_aios--;
+	if (!aio->chip->num_wup_aios) {
+		reset_control_assert(aio->chip->rst);
+		clk_disable_unprepare(aio->chip->clk);
+	}
 
 	return 0;
 }
@@ -439,13 +442,15 @@ int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
 	if (!aio->chip->active)
 		return 0;
 
-	ret = clk_prepare_enable(aio->chip->clk);
-	if (ret)
-		return ret;
+	if (!aio->chip->num_wup_aios) {
+		ret = clk_prepare_enable(aio->chip->clk);
+		if (ret)
+			return ret;
 
-	ret = reset_control_deassert(aio->chip->rst);
-	if (ret)
-		goto err_out_clock;
+		ret = reset_control_deassert(aio->chip->rst);
+		if (ret)
+			goto err_out_clock;
+	}
 
 	aio_iecout_set_enable(aio->chip, true);
 	aio_chip_init(aio->chip);
@@ -458,7 +463,7 @@ int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
 
 		ret = aio_init(sub);
 		if (ret)
-			goto err_out_clock;
+			goto err_out_reset;
 
 		if (!sub->setting)
 			continue;
@@ -466,11 +471,16 @@ int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
 		aio_port_reset(sub);
 		aio_src_reset(sub);
 	}
+	aio->chip->num_wup_aios++;
 
 	return 0;
 
+err_out_reset:
+	if (!aio->chip->num_wup_aios)
+		reset_control_assert(aio->chip->rst);
 err_out_clock:
-	clk_disable_unprepare(aio->chip->clk);
+	if (!aio->chip->num_wup_aios)
+		clk_disable_unprepare(aio->chip->clk);
 
 	return ret;
 }
@@ -619,6 +629,7 @@ int uniphier_aio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->rst);
 
 	chip->num_aios = chip->chip_spec->num_dais;
+	chip->num_wup_aios = chip->num_aios;
 	chip->aios = devm_kcalloc(dev,
 				  chip->num_aios, sizeof(struct uniphier_aio),
 				  GFP_KERNEL);
diff --git a/sound/soc/uniphier/aio.h b/sound/soc/uniphier/aio.h
index ca6ccba..a7ff7e5 100644
--- a/sound/soc/uniphier/aio.h
+++ b/sound/soc/uniphier/aio.h
@@ -285,6 +285,7 @@ struct uniphier_aio_chip {
 
 	struct uniphier_aio *aios;
 	int num_aios;
+	int num_wup_aios;
 	struct uniphier_aio_pll *plls;
 	int num_plls;
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
