Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12726165076
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CDC016BA;
	Wed, 19 Feb 2020 21:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CDC016BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146022;
	bh=bC1wXQy0ssQaspOauUTabvcEMXoPRo33J3ZTfrwjZCA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qqJ9KE0IAvAIEYc5TTC58e3p3H5GYzdLNgeuU7PIHVbIGb+8sPMFq3DObkyD39b09
	 MHRLIOn4MhKvQZoGlCZJHBjFf1lKwvd0ggJaS9iQAOP11z+FtrpIMm4677MiUq6DHd
	 Zs7ACIwYEAgZnvy5ka5fHxzzCrnErmpXZp4I/mxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03EFFF80142;
	Wed, 19 Feb 2020 21:57:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB2EF80142; Wed, 19 Feb 2020 21:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E824BF80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E824BF80142
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B0BAFEC;
 Wed, 19 Feb 2020 12:57:01 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C55293F68F;
 Wed, 19 Feb 2020 12:57:00 -0800 (PST)
Date: Wed, 19 Feb 2020 20:56:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Subject: Applied "ASoC: topology: Fix memleak in soc_tplg_manifest_load()" to
 the asoc tree
In-Reply-To: <20200207185325.22320-3-dragos_tarcatu@mentor.com>
Message-Id: <applied-20200207185325.22320-3-dragos_tarcatu@mentor.com>
X-Patchwork-Hint: ignore
Cc: mengdong.lin@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

The patch

   ASoC: topology: Fix memleak in soc_tplg_manifest_load()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 242c46c023610dbc0213fc8fb6b71eb836bc5d95 Mon Sep 17 00:00:00 2001
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Date: Fri, 7 Feb 2020 20:53:25 +0200
Subject: [PATCH] ASoC: topology: Fix memleak in soc_tplg_manifest_load()

In case of ABI version mismatch, _manifest needs to be freed as
it is just a copy of the original topology manifest. However, if
a driver manifest handler is defined, that would get executed and
the cleanup is never reached. Fix that by getting the return status
of manifest() instead of returning directly.

Fixes: 583958fa2e52 ("ASoC: topology: Make manifest backward compatible from ABI v4")
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Link: https://lore.kernel.org/r/20200207185325.22320-3-dragos_tarcatu@mentor.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 953517a73298..22c38df40d5a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2544,7 +2544,7 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 {
 	struct snd_soc_tplg_manifest *manifest, *_manifest;
 	bool abi_match;
-	int err;
+	int ret = 0;
 
 	if (tplg->pass != SOC_TPLG_PASS_MANIFEST)
 		return 0;
@@ -2557,19 +2557,19 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 		_manifest = manifest;
 	} else {
 		abi_match = false;
-		err = manifest_new_ver(tplg, manifest, &_manifest);
-		if (err < 0)
-			return err;
+		ret = manifest_new_ver(tplg, manifest, &_manifest);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* pass control to component driver for optional further init */
 	if (tplg->comp && tplg->ops && tplg->ops->manifest)
-		return tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
+		ret = tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
 
 	if (!abi_match)	/* free the duplicated one */
 		kfree(_manifest);
 
-	return 0;
+	return ret;
 }
 
 /* validate header magic, size and type */
-- 
2.20.1

