Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 208775A0613
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 03:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B058F846;
	Thu, 25 Aug 2022 03:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B058F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661391524;
	bh=t5O6RUjBZhbn9aIEIA2AHCOFz0aMjGqBBg0mfLE94gA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoXq1h7LJHEVK4u+i0L6Kr+/Ttx6Iv1R3kgTWFTUR2+UekIQTTDq9xYgpGzqX+0AV
	 yO0NAs83mJD0cixZuGssac0Dc2r6OpqnC3/dRKVI6sMB+dx7LHYw6kVgDlNhC92USa
	 TPFfTUNlB6aa36G8NcwFG+vocwDw5/R1Ot19DfTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C90BF80506;
	Thu, 25 Aug 2022 03:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5DEF80528; Thu, 25 Aug 2022 03:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62A2F80506
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 03:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62A2F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c8K8+wJF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4509161ACA;
 Thu, 25 Aug 2022 01:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332B7C433D7;
 Thu, 25 Aug 2022 01:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391438;
 bh=t5O6RUjBZhbn9aIEIA2AHCOFz0aMjGqBBg0mfLE94gA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c8K8+wJFdFISPqD29vb15d3pNQujAA+EjFuzqj5SaKsMdPO2O8p47VKzejn5pB/jq
 olIhdpLCw7uoxcgK+c586RMlyrMLtCPK70yma25IPn7koWx0zAOZLnUsI9HCgYoB1Q
 YZVwwSnL4VjvyK9mRSqL5Md4+xtMHxBgF5FMc8wO4V3wBaQG1kY0J1x48oMq5owmUo
 O8l511GPuk935AMpP2ny1PXz2SeA1GHwh6BiE6Dvmhby5tS6drpeUfo2NjeLfxKdBD
 rMpGHClX+C797NknGKzSIEoEMNawnNC0ToBnDLnhqsPM06dzWYBWqOx4bFPPf8uKtW
 UB6hHNEmtFPAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/20] ASoC: sh: rz-ssi: Improve error handling
 in rz_ssi_probe() error path
Date: Wed, 24 Aug 2022 21:36:54 -0400
Message-Id: <20220825013713.22656-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013713.22656-1-sashal@kernel.org>
References: <20220825013713.22656-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, geert+renesas@glider.be,
 Pavel Machek <pavel@denx.de>, prabhakar.mahadev-lad.rj@bp.renesas.com,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 p.zabel@pengutronix.de, Biju Das <biju.das.jz@bp.renesas.com>,
 hkallweit1@gmail.com
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

From: Biju Das <biju.das.jz@bp.renesas.com>

[ Upstream commit c75ed9f54ce8d349fee557f2b471a4d637ed2a6b ]

We usually do cleanup in reverse order of init. Currently in case of
error rz_ssi_release_dma_channels() done in the reverse order. This
patch improves error handling in rz_ssi_probe() error path.

While at it, use "goto cleanup" style to reduce code duplication.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Link: https://lore.kernel.org/r/20220728092612.38858-1-biju.das.jz@bp.renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rz-ssi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 6d794eaaf4c3..2e33a1fa0a6f 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -1022,32 +1022,36 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
-		rz_ssi_release_dma_channels(ssi);
-		return PTR_ERR(ssi->rstc);
+		ret = PTR_ERR(ssi->rstc);
+		goto err_reset;
 	}
 
 	reset_control_deassert(ssi->rstc);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		pm_runtime_disable(ssi->dev);
-		reset_control_assert(ssi->rstc);
-		return dev_err_probe(ssi->dev, ret, "pm_runtime_resume_and_get failed\n");
+		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed\n");
+		goto err_pm;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &rz_ssi_soc_component,
 					      rz_ssi_soc_dai,
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-
-		pm_runtime_put(ssi->dev);
-		pm_runtime_disable(ssi->dev);
-		reset_control_assert(ssi->rstc);
 		dev_err(&pdev->dev, "failed to register snd component\n");
+		goto err_snd_soc;
 	}
 
+	return 0;
+
+err_snd_soc:
+	pm_runtime_put(ssi->dev);
+err_pm:
+	pm_runtime_disable(ssi->dev);
+	reset_control_assert(ssi->rstc);
+err_reset:
+	rz_ssi_release_dma_channels(ssi);
+
 	return ret;
 }
 
-- 
2.35.1

