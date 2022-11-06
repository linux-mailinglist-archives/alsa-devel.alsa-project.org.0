Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62061E483
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:12:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693151F1;
	Sun,  6 Nov 2022 18:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693151F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754748;
	bh=6KG5m9XApVpdHLC3NcSvYAiVS7AmZYt5nk9nikO4EuM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MpyJcreRMggJ70ciqjcHUPWtpAMJ9keWN0GojinVM3vtHE0K1xKcdTtCch3bV3xS2
	 wxR/aC8/YDjKik4iz1pEBatad0QcTQQ1so2FqhdgWC/w+wJjMpx5yl8mtV9JeSn0iy
	 LlC1pLL4oOopkqOah3VIkY+/ScxRfE63f3ZhUUo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE26F80600;
	Sun,  6 Nov 2022 18:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB5EF805FF; Sun,  6 Nov 2022 18:06:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EC31F8057D
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC31F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hSiIf2ra"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DE3560C8F;
 Sun,  6 Nov 2022 17:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F42C433C1;
 Sun,  6 Nov 2022 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754358;
 bh=6KG5m9XApVpdHLC3NcSvYAiVS7AmZYt5nk9nikO4EuM=;
 h=From:To:Cc:Subject:Date:From;
 b=hSiIf2raEPbtw07+OzUccOmdpmlOyImKRk5mPAca8lfI0L4CKQd6n7JDxfADOJKBQ
 8JMG9Ew/Ycgzc+OpLpPj3PLr+Bi9nknBMnyJGI6zjy+ZBpyVnPHasQw5xB4/5J6jK7
 H9zCt9vEFenPChP9ltkxktVTegjuNyisO9hgKyDUrp74aWTnAVbiz2H9H0VJ/U9Ow8
 xQL6p3pX+KDA8iv47/ZHewsKPmm9hXJ5Ia7Ebzuf25n3sS4fqTA/z+sTuDpRbiS2wP
 2HRKtUS2HZSMLalIVtbwEh0LI6D5CRGS2ar0JgjyyzNDUWUxJk6T8z1KGv9tcVauxJ
 3LI3lhB09UMtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 01/16] ASoC: wm5102: Revert "ASoC: wm5102: Fix PM
 disable depth imbalance in wm5102_probe"
Date: Sun,  6 Nov 2022 12:05:38 -0500
Message-Id: <20221106170555.1580584-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
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

[ Upstream commit de71d7567e358effd06dfc3e2a154b25f1331c10 ]

This reverts commit fcbb60820cd3008bb44334a0395e5e57ccb77329.

The pm_runtime_disable is redundant when error returns in
wm5102_probe, we just revert the old patch to fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20221010114852.88127-2-zhangqilong3@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm5102.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b7f5e5391fdb..2ed3fa67027d 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2083,6 +2083,9 @@ static int wm5102_probe(struct platform_device *pdev)
 		regmap_update_bits(arizona->regmap, wm5102_digital_vu[i],
 				   WM5102_DIG_VU, WM5102_DIG_VU);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_idle(&pdev->dev);
+
 	ret = arizona_request_irq(arizona, ARIZONA_IRQ_DSP_IRQ1,
 				  "ADSP2 Compressed IRQ", wm5102_adsp2_irq,
 				  wm5102);
@@ -2115,9 +2118,6 @@ static int wm5102_probe(struct platform_device *pdev)
 		goto err_spk_irqs;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_idle(&pdev->dev);
-
 	return ret;
 
 err_spk_irqs:
-- 
2.35.1

