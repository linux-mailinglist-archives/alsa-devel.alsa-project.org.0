Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A23159477
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:09:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FB0168F;
	Tue, 11 Feb 2020 17:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FB0168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437396;
	bh=g/++0FZUmaAwMdJd4qiSGrym4ntYsQnNurm7ZCQ/Hvk=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KPGyDwYAEPJFFXjE/1CmJ5zOSOQqKOh3Y+xQmKBSx0KQPNZdMqCOpMghieYmCHB4k
	 pHtZw5R935xgGzwwyLiQmJuQX6G/UlLtLoaJFIxFTp2a10iUsZKKihmR3KcgC6MeZ/
	 v2ROyXd07ygbjbo1RFaL4Lz/u+dqKFUT/tMkl+uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13526F803F3;
	Tue, 11 Feb 2020 16:49:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A799BF803CB; Tue, 11 Feb 2020 16:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A90C9F803B0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90C9F803B0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 236ED113E;
 Tue, 11 Feb 2020 07:49:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BFE13F68E;
 Tue, 11 Feb 2020 07:49:40 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200203100814.22944-3-olivier.moysan@st.com>
Message-Id: <applied-20200203100814.22944-3-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: stm32: spdifrx: manage error when
	getting reset controller" to the asoc tree
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

The patch

   ASoC: stm32: spdifrx: manage error when getting reset controller

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 7889c0082e6400ae5d07345e5573548d0999b840 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:10 +0100
Subject: [PATCH] ASoC: stm32: spdifrx: manage error when getting reset
 controller

Return an error when the SPDIFRX driver fails to get a reset controller.
Also add an error trace, except on probe defer status.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200203100814.22944-3-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 3769d9ce5dbe..9f80ddf34443 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -978,12 +978,16 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (!IS_ERR(rst)) {
-		reset_control_assert(rst);
-		udelay(2);
-		reset_control_deassert(rst);
+	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rst)) {
+		if (PTR_ERR(rst) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Reset controller error %ld\n",
+				PTR_ERR(rst));
+		return PTR_ERR(rst);
 	}
+	reset_control_assert(rst);
+	udelay(2);
+	reset_control_deassert(rst);
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &stm32_spdifrx_component,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
