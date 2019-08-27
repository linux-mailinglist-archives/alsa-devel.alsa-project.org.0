Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C9A1D50
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322FA16AC;
	Thu, 29 Aug 2019 16:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322FA16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089730;
	bh=ZH7KhMIrd7B1juvwrVsqTUnrUhJJd8u0M8fzITzW2dw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Udgv99tQAncxpA4zciAD8KsZwZ/GahJTZNa5dKs7Zv0ZjCzSO4nKxRU+bs58qWQlZ
	 DSilxKS9MCItL1++8ln32MypbWHElqlYxbnA8F8o/A9S+gvpsh28Gg1mTTfJ7xZUt6
	 f/dE7/HqW6sbcSA2JdTAShp1YbksNDpf+JcPWFnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60BCFF80735;
	Tue, 27 Aug 2019 21:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51D87F8070E; Tue, 27 Aug 2019 21:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E04F8065B
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E04F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G2ligliO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z4B62Rk/JMSGgsuF34/JSBkYZVjMAerIvx/5tvsYHFg=; b=G2ligliOmrXs
 YZWZd3Hou4ZJCouG3bc9CcHFsBFJJlm3IF5oK/kAuakkc9bDNmUli4Dg1q9cj2+TP1XF2jc+QfRgc
 raOsoGrNgiR0zQtk1+ODkdl6VZ/0l/5GzOHVJY3F6HMJy2YZ9ilrfxKkvi79IVfzPLUqujlH6znll
 uixJc=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hbY-0001CU-J2; Tue, 27 Aug 2019 19:58:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 443E9D02CE8; Tue, 27 Aug 2019 20:58:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20190826131855.GA6840@mwanda>
X-Patchwork-Hint: ignore
Message-Id: <20190827195810.443E9D02CE8@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:58:10 +0100 (BST)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] Applied "ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL
	check" to the asoc tree
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

   ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check

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

From a325c7bc3a92f1d5ba8cff10d7ab93a989cdeb80 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 16:18:55 +0300
Subject: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check

The device_link_add() function only returns NULL on error, it doesn't
return error pointers.

Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190826131855.GA6840@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index c9d849ced54a..2a22b18e5ec0 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -227,8 +227,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 						DL_FLAG_STATELESS |
 						DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(priv->link[i])) {
-			ret = PTR_ERR(priv->link[i]);
+		if (!priv->link[i]) {
+			ret = -ENOMEM;
 			dev_pm_domain_detach(priv->pd_dev[i], false);
 			goto exit_unroll_pm;
 		}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
