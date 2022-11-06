Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 981EC61E442
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:09:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D41E12;
	Sun,  6 Nov 2022 18:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D41E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754577;
	bh=+xJaLsec8UslbCPI7l0OXafdrxQf8ut4IN37UUvG8+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVg+J/f7f5ucziHIJdbAlyTnGTAoYp09MDaCW4vQStvgkTZss2R5xEfuXuoN/3JXm
	 zBCEJHDbpbFCJhnJzcvmGJlKTUSWZXRCtEJ+QakF5ndIR/Pe+aszepLH09GcQljrKw
	 +hq51JfSQsNKXLvus+aYAJccTM8oM0DvuOm99dB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F58CF805D2;
	Sun,  6 Nov 2022 18:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 349ECF80566; Sun,  6 Nov 2022 18:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1774F800AB
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1774F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mSZ6aaQO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83D7860CF5;
 Sun,  6 Nov 2022 17:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC6EC433C1;
 Sun,  6 Nov 2022 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754314;
 bh=+xJaLsec8UslbCPI7l0OXafdrxQf8ut4IN37UUvG8+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mSZ6aaQOGH/B+LDg34dn+jjdNxBDtYbOw35qKljvKSn4j5Cll8Rd66s8DGq5w/MEE
 Oi+KCkyhEjZKVbGaicrOck2AcBv/RLo/7IcicESuC2fbU4GdVz4ww/4etxmtjtuv4u
 IKTuJ0LXwabC5AuJ5q05xolFNy4i2BWBGquowqI44rWO053WcOfBctl2rQ8bT3ZF25
 81WxDGOxybhMwbF0Pi1835FfcC6e8oW/1r25wp4w8h+0B6dDli8H8HHlWMmSS9e/gp
 NA+PuYUWdUMxakGCBuXLDA8HBDaZUECLO83z7+8byvbCcnDTt1Q7cL3UUBbx8JpvNN
 9ms3xTR2jwFbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/18] ASoC: wm5110: Revert "ASoC: wm5110: Fix PM
 disable depth imbalance in wm5110_probe"
Date: Sun,  6 Nov 2022 12:04:51 -0500
Message-Id: <20221106170509.1580304-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170509.1580304-1-sashal@kernel.org>
References: <20221106170509.1580304-1-sashal@kernel.org>
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
index 66a4827c16bd..7c6e01720d65 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2458,6 +2458,9 @@ static int wm5110_probe(struct platform_device *pdev)
 		regmap_update_bits(arizona->regmap, wm5110_digital_vu[i],
 				   WM5110_DIG_VU, WM5110_DIG_VU);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_idle(&pdev->dev);
+
 	ret = arizona_request_irq(arizona, ARIZONA_IRQ_DSP_IRQ1,
 				  "ADSP2 Compressed IRQ", wm5110_adsp2_irq,
 				  wm5110);
@@ -2490,9 +2493,6 @@ static int wm5110_probe(struct platform_device *pdev)
 		goto err_spk_irqs;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_idle(&pdev->dev);
-
 	return ret;
 
 err_spk_irqs:
-- 
2.35.1

