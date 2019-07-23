Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4571743
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:39:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5679E1866;
	Tue, 23 Jul 2019 13:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5679E1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881948;
	bh=G2zNHs4CGUKt7UcCkr3CrC2L4JQhl3HWDvQTwW0/Qus=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kUKoKZfiu1ob2f2KwNMkFcP5twFPKGWR6NHU++fEcqhPPkNistjRYhl1GvxBaJrEe
	 N18m+MHuU+UOdQNrp7NoI0kPBjIA6owhIX39ZdHTQCy5GfGG0DA8d31KzeE/xTXAvK
	 oKzZlvFYYAIPGDYP8U+iNURtj1NInS7+A+ulGSxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB443F8060D;
	Tue, 23 Jul 2019 13:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF878F8049A; Tue, 23 Jul 2019 13:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B69CF8048E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B69CF8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dES57fZ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9Rgnj0aBh71VUsOdVd88sadMKVvH3sz/EXo25RQwzuw=; b=dES57fZ4eGiH
 O7r78q4LAeACollLeNij752NP5dkSDZxhQIEHXbzOVq0grU8mKF7sQcKqd9eb28ALj7tX02JnK53Y
 jsbT74RB2nZjPCuO7OpoJBvDvr7Ik5inu+Ph+DQ2FmxQQwlhFxrwEWjhpJBCs4e3UsAAlEUr3IBhJ
 xuqtQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyo-0003Jh-FK; Tue, 23 Jul 2019 11:29:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F27572742B60; Tue, 23 Jul 2019 12:29:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190722141402.7194-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112913.F27572742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:13 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: loader: Use the BAR provided by
	FW" to the asoc tree
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

   ASoC: SOF: loader: Use the BAR provided by FW

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

From 7198879ef57775df3b1a75c62bb9e313c56876d4 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Mon, 22 Jul 2019 09:13:48 -0500
Subject: [PATCH] ASoC: SOF: loader: Use the BAR provided by FW

Make sure to use the newly introduced function snd_sof_dsp_get_bar_index
that converts the section type to appropriate BAR index.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 952a19091c58..e75da8aa7d4a 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -92,7 +92,7 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				struct snd_sof_mod_hdr *module)
 {
 	struct snd_sof_blk_hdr *block;
-	int count;
+	int count, bar;
 	u32 offset;
 	size_t remaining;
 
@@ -128,6 +128,13 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 		case SOF_FW_BLK_TYPE_IRAM:
 		case SOF_FW_BLK_TYPE_DRAM:
 			offset = block->offset;
+			bar = snd_sof_dsp_get_bar_index(sdev, block->type);
+			if (bar < 0) {
+				dev_err(sdev->dev,
+					"error: no BAR mapping for block type 0x%x\n",
+					block->type);
+				return bar;
+			}
 			break;
 		default:
 			dev_err(sdev->dev, "error: bad type 0x%x for block 0x%x\n",
@@ -145,7 +152,7 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				block->size);
 			return -EINVAL;
 		}
-		snd_sof_dsp_block_write(sdev, sdev->mmio_bar, offset,
+		snd_sof_dsp_block_write(sdev, bar, offset,
 					block + 1, block->size);
 
 		if (remaining < block->size) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
