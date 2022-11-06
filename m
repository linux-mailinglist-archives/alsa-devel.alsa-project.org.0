Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449B61E4A5
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF7E1674;
	Sun,  6 Nov 2022 18:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF7E1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754797;
	bh=7KTEvaEN6pllnL953loH5YZMkruYuS0cDZuxGKvU1Qw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ju8ZAV9YxqyubLNHStGpYJQoWn02ZH6reFPZ070vOdnIuOKbabbXriF7djmJmDmSe
	 0F6nJLGM6F3bPAU1Vpl8dZ9LNMo6nNsI5LUlG9uBVz6KO03UDxjMD2Go2mocqAuUBz
	 Py6nklNO5B39Zzf/oAz/aFtlv/C+FUIxT1MH7JZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60A56F8060B;
	Sun,  6 Nov 2022 18:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D36A0F805F3; Sun,  6 Nov 2022 18:06:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07D9F80601
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07D9F80601
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q0WZoGfm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9DCE60CEC;
 Sun,  6 Nov 2022 17:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B768C433C1;
 Sun,  6 Nov 2022 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754363;
 bh=7KTEvaEN6pllnL953loH5YZMkruYuS0cDZuxGKvU1Qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q0WZoGfm5CAZ3UyzKkhp9baK/szyxh5CepOwfA7J6uR8ZGJcKnZP7pp0ujaxeuIC9
 Ujq5kf09xYoxxkgelGNJfxOop050ocKX3+TzwrRGo5WGhGfO0UY3xOfTB0oG45GyLO
 d85S8QfWPMx3XMcL0pRm7fThWZQQXpaZJyKt0JFMDyX+bSDRjORCrRch6PnjZJu9d8
 gveykBCeU6E8o4RrQhZnVbOxAc7kfdJPQPGxNHXlIppxCflm0kbNUGoCfi5wS780aK
 7TIbArT6/yFq3r8eOPSqwO7QQz5uyYhPxNpTZXpOR69BNUNuhcsST/XU2+N0i4t4Gt
 GXV+ENz4wniSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/16] ASoC: wm8997: Revert "ASoC: wm8997: Fix PM
 disable depth imbalance in wm8997_probe"
Date: Sun,  6 Nov 2022 12:05:40 -0500
Message-Id: <20221106170555.1580584-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
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

[ Upstream commit 68ce83e3bb26feba0fcdd59667fde942b3a600a1 ]

This reverts commit 41a736ac20602f64773e80f0f5b32cde1830a44a.

The pm_runtime_disable is redundant when error returns in
wm8997_probe, we just revert the old patch to fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20221010114852.88127-4-zhangqilong3@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8997.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 07378714b013..229f2986cd96 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1156,6 +1156,9 @@ static int wm8997_probe(struct platform_device *pdev)
 		regmap_update_bits(arizona->regmap, wm8997_digital_vu[i],
 				   WM8997_DIG_VU, WM8997_DIG_VU);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_idle(&pdev->dev);
+
 	arizona_init_common(arizona);
 
 	ret = arizona_init_vol_limit(arizona);
@@ -1174,9 +1177,6 @@ static int wm8997_probe(struct platform_device *pdev)
 		goto err_spk_irqs;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_idle(&pdev->dev);
-
 	return ret;
 
 err_spk_irqs:
-- 
2.35.1

