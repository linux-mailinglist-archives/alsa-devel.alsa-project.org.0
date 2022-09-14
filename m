Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213D5B83BB
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4270E1840;
	Wed, 14 Sep 2022 11:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4270E1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146193;
	bh=y3lictP4Z1ea/tN0nU39rv17F8R5VC4Bbf21giCC80o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ubSGV0lZKLqTEklfSgTgmy5Fet16//oEJxVjgGzXP8ilPCjcN2hNiSp0mQ5GtwzMy
	 xTnPpqJ81QqcCOyeyDjc/KSXvJVous8Nb4D+h3r1lvaMZ0QcIDprPtOkG24FJuRW15
	 QceS+w4SIYtYUOSk4qQAlKqoa4lsIsaC7ehjGyf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDB2F80535;
	Wed, 14 Sep 2022 11:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E4C9F80533; Wed, 14 Sep 2022 11:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49913F8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49913F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iqbXSldu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17C70B81629;
 Wed, 14 Sep 2022 09:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE70C433C1;
 Wed, 14 Sep 2022 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146086;
 bh=y3lictP4Z1ea/tN0nU39rv17F8R5VC4Bbf21giCC80o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqbXSlduODJ0Wluth+F1g0GZNhI5LNbSlB+IomSy1i0AUIqr6GEE3EbBjzqrwCfPx
 XMXNOvVIY4cd07q134ThxLug/VOEllW7BU9KtIQqn27MRiVBd+D6+hWM3pgd1xRFN6
 MTM6OttLn4N0p2jHxv8cQLwN8AV1EBboz42pXCfUiSxteZi9aE81fUBWGDEv26v4kW
 gjU1LBidt6a9PIxY0xSwsXr3OslPo6X5rZ3ypTVBUiWyiuEypaqa/mfjQIBZ9yqWBn
 YGf8mQzP1c7bw6SEBoZLNczMOOWUfyp0CjTlzojD7Bc7R2c4Y/B9QkvhFGXW7rX881
 LB6A1mh+3fr2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 06/22] ASoC: fsl_aud2htx: Add error handler for
 pm_runtime_enable
Date: Wed, 14 Sep 2022 05:00:47 -0400
Message-Id: <20220914090103.470630-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090103.470630-1-sashal@kernel.org>
References: <20220914090103.470630-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, shengjiu.wang@gmail.com
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit b1cd3fd42db7593a2d24c06f1c53b8c886592080 ]

Call pm_runtime_disable() when error happens in probe()

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1661430460-5234-2-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_aud2htx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index e09015e7e3c7c..38f3863739f4d 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -240,6 +240,7 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to pcm register\n");
+		pm_runtime_disable(&pdev->dev);
 		return ret;
 	}
 
@@ -248,6 +249,7 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 					      &fsl_aud2htx_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+		pm_runtime_disable(&pdev->dev);
 		return ret;
 	}
 
-- 
2.35.1

