Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECA140E55
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4841F1759;
	Fri, 17 Jan 2020 16:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4841F1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276389;
	bh=DpwiwGNqGW8X/J8Qy+pxA7VFh3mZxW9K21mbipceqBM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=l1GaD9CJdFZGL6G0GBp1bxkUdRpqhHbSYlf47hNWSvDbz7fN/8Tq2p9lTNyXmwMHK
	 YViMnP+wvLqzyKGx9NIPg7Tqk25FiloIqyYKnKHP8xRVniC/6Je/GHiqEGa7k5Tzjp
	 ldVCkdPj9IV8SkwFGaXZzl0OMfD9lQ8m5xUsCWao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3187F802DF;
	Fri, 17 Jan 2020 16:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E0EF801EB; Fri, 17 Jan 2020 16:44:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00657F801F7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00657F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bK8g+eoi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nTgcYnW1bBqfkqgXrC6bADcDL5m+JJlT4b9lz90Hafo=; b=bK8g+eoibs1c
 sshSw5ILQoPvUH2r+fGkJP36wgQioTIfHtdNDfPbwWA9DmXb/4rq0s+zW/8lr66WUmrgq4UzBGnrj
 GBnZUn9FN81lrYV3PnDWFEtBW9Pb1HIP22SVx5Qbi4ooTjqCeBqgp46ujjrM/Ck9Vok6c6HgwOERw
 Id7wc=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTn9-0006rx-Qz; Fri, 17 Jan 2020 15:44:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 83ED6D02C26; Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1579261510-12580-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Message-Id: <applied-1579261510-12580-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 moderated@sirena.org.uk, "Cc:"@sirena.org.uk, Mark Brown <broonie@kernel.org>,
 Ravulapati@sirena.org.uk, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>, Vishnu@sirena.org.uk
Subject: [alsa-devel] Applied "ASoC: amd: Additional DAI for I2S SP
	instance." to the asoc tree
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

   ASoC: amd: Additional DAI for I2S SP instance.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From a174a6c226796824cb2f78157c0b183ed472fa3f Mon Sep 17 00:00:00 2001
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Date: Fri, 17 Jan 2020 17:15:09 +0530
Subject: [PATCH] ASoC: amd: Additional DAI for I2S SP instance.

I2S SP instance has separate BCLK and LRCLK for Tx and Rx.
Creating additional DAI for Rx.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Link: https://lore.kernel.org/r/1579261510-12580-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x.h     | 2 +-
 sound/soc/amd/raven/pci-acp3x.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index b6a80dc0b641..21e7ac017f2b 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -13,7 +13,7 @@
 #define TDM_ENABLE 1
 #define TDM_DISABLE 0
 
-#define ACP3x_DEVS		3
+#define ACP3x_DEVS		4
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
 #define	ACP3x_I2S_MODE	0
 #define	ACP3x_REG_START	0x1240000
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 2f9f52905853..65330bb50e74 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -225,7 +225,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		pdevinfo[2].id = 1;
 		pdevinfo[2].parent = &pci->dev;
 		pdevinfo[2].num_res = 1;
-		pdevinfo[2].res = &adata->res[2];
+		pdevinfo[2].res = &adata->res[1];
+
+		pdevinfo[3].name = "acp3x_i2s_playcap";
+		pdevinfo[3].id = 2;
+		pdevinfo[3].parent = &pci->dev;
+		pdevinfo[3].num_res = 1;
+		pdevinfo[3].res = &adata->res[2];
 		for (i = 0; i < ACP3x_DEVS; i++) {
 			adata->pdev[i] =
 				platform_device_register_full(&pdevinfo[i]);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
