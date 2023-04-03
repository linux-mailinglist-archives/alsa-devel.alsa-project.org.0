Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9D6D4C16
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FD77F1;
	Mon,  3 Apr 2023 17:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FD77F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536361;
	bh=cB27IzkAafy+IWw9S5kJqvtMcIEUaK/BrwzsF3n4r1A=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B/jbyC0X6CMSdxLsJgePMo8BvuOQc7yqn1M3lgwB34eyH+OB5tzKbrFLSYAceJC4K
	 z9y70JMWUA2JwPlC2sHR+ppNc5/nUBgMRNHqlW35mc2zMBmk12QwJOm56LchARby+8
	 qqI3qdEZSCOk8bjwd9V3SkaoGr9RTrNfGjf/Vz7s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F5BF8057A;
	Mon,  3 Apr 2023 17:36:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23193F8024C; Mon,  3 Apr 2023 17:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 713CAF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 713CAF80171
Received: from LAPTOP-6NFQSDTK.localdomain ([10.12.182.145])
	(user=yll@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 333FRJ5h024979-333FRJ5i024979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Apr 2023 23:27:24 +0800
From: Liliang Ye <yll@hust.edu.cn>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH 1/2] ASoC: fsl_mqs: move of_node_put() to the correct location
Date: Mon,  3 Apr 2023 23:26:47 +0800
Message-Id: <20230403152647.17638-1-yll@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: yll@hust.edu.cn
X-MailFrom: yll@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RDPLHPWY4JEHD7JI7DUF7DWSNY4ZBZPS
X-Message-ID-Hash: RDPLHPWY4JEHD7JI7DUF7DWSNY4ZBZPS
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:51 +0000
CC: hust-os-kernel-patches@googlegroups.com, Liliang Ye <yll@hust.edu.cn>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDPLHPWY4JEHD7JI7DUF7DWSNY4ZBZPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

of_node_put() should have been done directly after
mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
otherwise it creates a reference leak on the success path.

To fix this, of_node_put() is moved to the correct location, and change
all the gotos to direct returns.

Fixes: a9d273671440 ("ASoC: fsl_mqs: Fix error handling in probe")
Signed-off-by: Liliang Ye <yll@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/fsl/fsl_mqs.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 4922e6795b73..32d20d351bbf 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -210,10 +210,10 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 		}
 
 		mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
+		of_node_put(gpr_np);
 		if (IS_ERR(mqs_priv->regmap)) {
 			dev_err(&pdev->dev, "failed to get gpr regmap\n");
-			ret = PTR_ERR(mqs_priv->regmap);
-			goto err_free_gpr_np;
+			return PTR_ERR(mqs_priv->regmap);
 		}
 	} else {
 		regs = devm_platform_ioremap_resource(pdev, 0);
@@ -242,8 +242,7 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	if (IS_ERR(mqs_priv->mclk)) {
 		dev_err(&pdev->dev, "failed to get the clock: %ld\n",
 			PTR_ERR(mqs_priv->mclk));
-		ret = PTR_ERR(mqs_priv->mclk);
-		goto err_free_gpr_np;
+		return PTR_ERR(mqs_priv->mclk);
 	}
 
 	dev_set_drvdata(&pdev->dev, mqs_priv);
@@ -252,13 +251,9 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
 			&fsl_mqs_dai, 1);
 	if (ret)
-		goto err_free_gpr_np;
-	return 0;
-
-err_free_gpr_np:
-	of_node_put(gpr_np);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int fsl_mqs_remove(struct platform_device *pdev)
-- 
2.34.1

