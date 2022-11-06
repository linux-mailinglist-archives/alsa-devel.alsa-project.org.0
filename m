Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D361D61E4B9
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:15:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734CC1691;
	Sun,  6 Nov 2022 18:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734CC1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754939;
	bh=vczTo+3PmWL+4BALxrRkYT1pHu2q6iwT5EFYiSxxAF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzURtU2hNpN+qaVHOxkHJfQBH85O1kPQZFv9LiQ4ns8RtAIZqBre4qJFYkqHoU2nP
	 3hjQSGy1auSLSTLoEZERDDUb3VT9ox64AicoFe9eOSdUeGbsdz+eAzvBPIku95KirM
	 TBCafFZUT1AVQTkNsDUGG1QWzP19Y+XHqz63nnpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF03BF80636;
	Sun,  6 Nov 2022 18:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D083EF80588; Sun,  6 Nov 2022 18:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21DAF80588
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21DAF80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jMSEztp/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5C6260CF8;
 Sun,  6 Nov 2022 17:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16762C433D6;
 Sun,  6 Nov 2022 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754403;
 bh=vczTo+3PmWL+4BALxrRkYT1pHu2q6iwT5EFYiSxxAF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jMSEztp/vsaP4t5itGy/Bk8LiJ99K0owQ52ttJQ9g3V17bcQkWmOf7dWONLE5xdjN
 mTQEUQdeLGoL3N6mv1Zwp1RhyX/3NQ0lLW/wN70BfnKrJx0aO+jV/CaKSFIxuuSR3s
 Jbi38R8iVZL6ES6/y/broHfiZ9YqIkVKktASc5/KXCaFJ98wsGdWrSIT+sZkClepmj
 fIUSENga6MMZ5R4eu+pVSLKMIzvCppuD9BD2HsZilntxS5bUJYQ8GQ9RkNiFPZTabH
 iTLNR07MX3Qexr2V2mI7LgrQ4bULhBh+YlZXSj+rM+IgBA7+MzqZMeAz3TDJvupraa
 y6jWEdEhMgGNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/12] ASoC: wm5110: Revert "ASoC: wm5110: Fix PM
 disable depth imbalance in wm5110_probe"
Date: Sun,  6 Nov 2022 12:06:26 -0500
Message-Id: <20221106170637.1580802-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170637.1580802-1-sashal@kernel.org>
References: <20221106170637.1580802-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Zhang Qilong <zhangqilong3@huawei.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

From: Zhang Qilong <zhangqilong3@huawei.com>

[ Upstream commit 7d4e966f4cd73ff69bf06934e8e14a33fb7ef447 ]

This reverts commit 86b46bf1feb83898d89a2b4a8d08d21e9ea277a7.

The pm_runtime_disable is redundant when error returns in
wm5110_probe, we just revert the old patch to fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20221010114852.88127-3-zhangqilong3@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm5110.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index bbe9fdfb423c..06ec3f48c808 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2452,6 +2452,9 @@ static int wm5110_probe(struct platform_device *pdev)
 		regmap_update_bits(arizona->regmap, wm5110_digital_vu[i],
 				   WM5110_DIG_VU, WM5110_DIG_VU);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_idle(&pdev->dev);
+
 	ret = arizona_request_irq(arizona, ARIZONA_IRQ_DSP_IRQ1,
 				  "ADSP2 Compressed IRQ", wm5110_adsp2_irq,
 				  wm5110);
@@ -2484,9 +2487,6 @@ static int wm5110_probe(struct platform_device *pdev)
 		goto err_spk_irqs;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_idle(&pdev->dev);
-
 	return ret;
 
 err_spk_irqs:
-- 
2.35.1

