Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287DD2C78
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32C4168F;
	Thu, 10 Oct 2019 16:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32C4168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717667;
	bh=9IdMQGLuYB4CW2DGkHkjN7qqF3/JwY/fPGBMNF20a1Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UzQ3l/8vvzSbF00OG9cB0BgzyARCvm/mohozTFpzcPmtSFvU+YlidNfB96m9jtLey
	 ubaToa7lHt5VwuIAJMUgaWINpWnyWH9KGsMba/1/b4oTEUAAoH1OTGCD8WFZ2qqRSh
	 U7NaC5NtQE0Ahc4AoBVObTe9yjb2XnPxiOwiHQzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DFDF8063C;
	Thu, 10 Oct 2019 16:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A38E9F805FF; Thu, 10 Oct 2019 16:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF1CF8038F
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF1CF8038F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Bq6NmWRO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Vu26j0pkksd5a+5AFHdMUJqu3g0GR+no5stRlOk1dVY=; b=Bq6NmWRO4EiN
 YqLGK1KjfixASfBlpa9xCr++pzXvPUXqXBSIHokhAER9TQDwoUf3wdMYj95SP2Ks/VmPVCN5V4o1k
 40pSAZMkFXFsff2/sdn707LhoJywC06bspd/oFhgkx4SrnySk+TZVTy+S5ma+LYMBVKEo59FxZvkk
 45VTU=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKq-0001Zj-2v; Thu, 10 Oct 2019 14:22:32 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id AD5CAD0003D; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191008164443.1358-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.AD5CAD0003D@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "Revert "ASoC: SOF: Force polling mode on CFL
	and CNL"" to the asoc tree
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

   Revert "ASoC: SOF: Force polling mode on CFL and CNL"

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 902fd492d5ea2c02666ddadc1da977ca94e6b52c Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 8 Oct 2019 11:44:36 -0500
Subject: [PATCH] Revert "ASoC: SOF: Force polling mode on CFL and CNL"

This reverts commit 64ca9d9fcb3e3c86b1417e3d17a90b43dd660f81.

The workaround is no longer needed after configuring HDAC
bus with sync_write=1.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 5a5163eef2ef..103f4273c4d3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -32,9 +32,6 @@
 /* platform specific devices */
 #include "shim.h"
 
-#define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
-#define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
-
 #define EXCEPT_MAX_HDR_SIZE	0x400
 
 /*
@@ -262,10 +259,6 @@ static int hda_init(struct snd_sof_dev *sdev)
 	/* HDA bus init */
 	sof_hda_bus_init(bus, &pci->dev);
 
-	/* Workaround for a communication error on CFL (bko#199007) and CNL */
-	if (IS_CFL(pci) || IS_CNL(pci))
-		bus->polling_mode = 1;
-
 	bus->use_posbuf = 1;
 	bus->bdl_pos_adj = 0;
 	bus->sync_write = 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
