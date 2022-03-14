Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C8B4D7A7C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 06:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAFE169F;
	Mon, 14 Mar 2022 06:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAFE169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647236878;
	bh=VgYdOZBZufX/I9WQ0v33g4iqgeSkQUbXC8tJSC4t35o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OhRBxL46kaiAiZJvY/WlSAjYbKUSJKj5wj3PARBHnn83OlaWUXI+1+7iH8yXB0p0Z
	 slg9maEaF6HjomdHau4cnrPH08TcgzYQwjp3xfhBl2O2EyfpkHWnLsGTGHyQMYkBGA
	 nQa2MnF1lwZaJspFLC/eolxr6xgH2dU74zr4EBXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08FF3F80095;
	Mon, 14 Mar 2022 06:46:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93449F80139; Mon, 14 Mar 2022 06:46:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg511.qq.com (smtpbg511.qq.com [203.205.250.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F1AF80100
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 06:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F1AF80100
X-QQ-mid: bizesmtp67t1647236789tdocdkcc
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 14 Mar 2022 13:46:24 +0800 (CST)
X-QQ-SSF: 0140000000200070E000B00A0000000
X-QQ-FEAT: UldK9Jsj7VMaphog27S4lw8S9PU+rNC28DUg751c7z6NeXGelP3fAJx6SMVLa
 l20Xt/iZS2Bdt+ynmnbguGsw+2WSBXglsIc3mBtubwdLLamJGGnqKIy1ACfHGxyYWhgQiE4
 ftWYOQ+ldrZpFHYP65yZgPk48WWeX9EzqpEVUIgKyJWmW+tPQt4y7QJj0PyFafPrJ4kV7FN
 KEYzH332IPtsEuODzKYDF/dq2zWvcU1207Y1kwTyKOhNUBeT3ROo/FZUxUwwNwVARnezjok
 oew/bMle8pepnV5L2HS5dMgZcE2rZC41HNALNQkfKsQ3T8P+FuNC2a0BmYrRTRNmZJjdMFr
 2M/M2M8OPDU5FDr+JkxNPE9mbui6tl+ZN3HmM/Q
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH v2] ASoC: Intel: boards: Use temporary variable for struct
 device
Date: Mon, 14 Mar 2022 13:46:21 +0800
Message-Id: <20220314054621.14694-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Use temporary variable for struct device to make code neater.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index b3d7a0725ef2..183edd0fd446 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -538,7 +538,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	bool sof_parent;
 
-	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
 		return -ENOMEM;
 
@@ -559,8 +559,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	}
 
 	/* override platform name, if required */
-	snd_soc_card_cht.dev = &pdev->dev;
-	mach = pdev->dev.platform_data;
+	snd_soc_card_cht.dev = dev;
+	mach = dev->platform_data;
 	platform_name = mach->mach_params.platform;
 
 	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht,
@@ -576,9 +576,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	else
 		mclk_name = "pmc_plt_clk_3";
 
-	drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
+	drv->mclk = devm_clk_get(dev, mclk_name);
 	if (IS_ERR(drv->mclk)) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Failed to get MCLK from %s: %ld\n",
 			mclk_name, PTR_ERR(drv->mclk));
 		return PTR_ERR(drv->mclk);
@@ -594,12 +594,12 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	if (drv->quirks & QUIRK_PMC_PLT_CLK_0) {
 		ret_val = clk_prepare_enable(drv->mclk);
 		if (ret_val < 0) {
-			dev_err(&pdev->dev, "MCLK enable error: %d\n", ret_val);
+			dev_err(dev, "MCLK enable error: %d\n", ret_val);
 			return ret_val;
 		}
 	}
 
-	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+	sof_parent = snd_soc_acpi_sof_parent(dev);
 
 	/* set card and driver name */
 	if (sof_parent) {
@@ -614,9 +614,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	if (sof_parent)
 		dev->driver->pm = &snd_soc_pm_ops;
 
-	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
+	ret_val = devm_snd_soc_register_card(dev, &snd_soc_card_cht);
 	if (ret_val) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"snd_soc_register_card failed %d\n", ret_val);
 		return ret_val;
 	}
-- 
2.20.1



