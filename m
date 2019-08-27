Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A5A1D70
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60953168D;
	Thu, 29 Aug 2019 16:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60953168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089835;
	bh=YvXkb6ppTGYjTHvkrCApg/CRv1sLTGtbCC8lLluj+Ak=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZYv7H0I2EdeH4iRpdJ7rvyAYPLxg6zJt7O1p8Rs5zIbEkrQ2xOIrvOQcveW7pXgYc
	 w8s4rbFGnAFzjiPunT7P7pWjD1LoGcPD0LLsjvAgYa44SAR4Yd4RVc/1PD1dGNnD37
	 LZgXfAj5cetI95MrRYn9S22UnJ8/+EZfECJHA2xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D2BF8064C;
	Tue, 27 Aug 2019 21:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F501F8064C; Tue, 27 Aug 2019 21:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A20F9F8063C
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20F9F8063C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sI9cXxqe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eh2Bqn1HU9pG1FKde+0Wh38v6oHDofMbM5lmPpHqqII=; b=sI9cXxqehsaw
 AxbJ9fuuT1Q5bG4SlqBVghaPP6aeJvmfwNQ5MiO9QcyIxYUeXeiVxJehgqBJCHj3WLmr572oEpMh/
 qGTTQMjolQITeQUt+fpPQsr/BaMapvi+hDVw/pxHwhGfPJf1DNjRcIhFgPgNs64Nuc6WhmAU2rRFT
 QQ0OI=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hb8-0001BS-PI; Tue, 27 Aug 2019 19:57:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 50AB0D02CE9; Tue, 27 Aug 2019 20:57:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195744.50AB0D02CE9@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:57:44 +0100 (BST)
Cc: Dong Aisheng <aisheng.dong@nxp.com>, brian.austin@cirrus.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42xx8: Force suspend/resume during
	system suspend/resume" to the asoc tree
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

   ASoC: cs42xx8: Force suspend/resume during system suspend/resume

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From b429ca49406501e2c48c2a137eab12910c21ad0c Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Tue, 27 Aug 2019 18:13:46 -0400
Subject: [PATCH] ASoC: cs42xx8: Force suspend/resume during system
 suspend/resume

Use force_suspend/resume to make sure clocks are disabled/enabled
accordingly during system suspend/resume.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 5b049fcdba20..94b1adb088fd 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -684,6 +684,8 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 #endif
 
 const struct dev_pm_ops cs42xx8_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
 };
 EXPORT_SYMBOL_GPL(cs42xx8_pm);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
