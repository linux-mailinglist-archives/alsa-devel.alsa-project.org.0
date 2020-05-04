Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B81C33BB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 09:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E6D516EA;
	Mon,  4 May 2020 09:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E6D516EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588577850;
	bh=FGBlxiagPPnLWZE5h2ji3BkVjMpN9TMxVlr6UZgGRkk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o3Ee2PlzOCLLhZuU1vSkyKtHndjPhGq1hgZt9EBFGJCexwRuBH1M9J3ZpA65m6+Ju
	 H41W8l/PTDHyIZmvSP1qsYURpM+eHn9FNKyhEoMKmjip024O2H+3GKjQHHa2NVBP5Z
	 gc2Ydwn+Q7TWgzatcs4a6pt5tDI4bqFBLPTj/XlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C78F8026F;
	Mon,  4 May 2020 09:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B01EF80259; Mon,  4 May 2020 09:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id CCA51F800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 09:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA51F800E5
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5eafc5bf292-fd714;
 Mon, 04 May 2020 15:35:28 +0800 (CST)
X-RM-TRANSID: 2eeb5eafc5bf292-fd714
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.182.180])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75eafc5bddce-073a0;
 Mon, 04 May 2020 15:35:28 +0800 (CST)
X-RM-TRANSID: 2ee75eafc5bddce-073a0
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, bgoswami@codeaurora.org, plai@codeaurora.org,
 perex@perex.cz
Subject: [PATCH] ASoC: qcom: Remove the unnecessary cast
Date: Mon,  4 May 2020 15:35:58 +0800
Message-Id: <20200504073558.2340-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
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

It's not necessary to specify 'void const __force *' casting
for 'drvdata->lpaif'.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/lpass-cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 885c1f2e7..4242f45ee 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -443,10 +443,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev, 
 						"lpass-lpaif")
-	if (IS_ERR((void const __force *)drvdata->lpaif)) {
+	if (IS_ERR(drvdata->lpaif)) {
 		dev_err(&pdev->dev, "error mapping reg resource: %ld\n",
-				PTR_ERR((void const __force *)drvdata->lpaif));
-		return PTR_ERR((void const __force *)drvdata->lpaif);
+				PTR_ERR(drvdata->lpaif));
+		return PTR_ERR(drvdata->lpaif);
 	}
 
 	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
-- 
2.20.1.windows.1



