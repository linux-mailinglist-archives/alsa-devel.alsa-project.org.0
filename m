Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9125968
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140FB15E0;
	Tue, 21 May 2019 22:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140FB15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471703;
	bh=RcZRNpkZ9bfEcnKoU5rxLKo8nKEZY+MfR89Z3HlM6j8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KpQMzHvtC4OMpT11DL5VTbOApZDaliXuI7LqNK455Daf6dfh/25PHVARtzQzNxgel
	 BNXgIZMS4swnSvHcj2O82qQfaCeFjh1ZLybtbk45XVgLJDuQ861L8x2g0hpPUvBb0F
	 x+Z4q+v6LZTf8pk4uX15GgbApuNdqdgUopmefxLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0701BF8973E;
	Tue, 21 May 2019 22:44:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD9F1F89707; Tue, 21 May 2019 22:44:34 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E6B9F89728
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6B9F89728
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ouhYo7tf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=p0O72aPRVpjVEcqo6LohyIZUGEmLyR0F9H09XPKkv8Y=; b=ouhYo7tf5SvG
 1YCyF5Or3IU7N+dcXkr13WOa5899bo3/dOs5u8vREC3C2AFfyROM64L2PfwAMcGcO7BnHinEl3H4Y
 R2ekZh/UyrfibA5cWY5X26jF9XclscHp35OPe3X5e9jjQdiKfaKmcKmRfQ+GhbsOmpTsSD2VV17iB
 lDqms=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRI-0001yp-06; Tue, 21 May 2019 20:32:48 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 607721126D22; Tue, 21 May 2019 21:32:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
In-Reply-To: <20190518183009.13359-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203243.607721126D22@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:43 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: soc-acpi: Fix machine selection
	order" to the asoc tree
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

   ASoC: Intel: soc-acpi: Fix machine selection order

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 30d9d4ff53532087bc13ed29d7715df868794b5e Mon Sep 17 00:00:00 2001
From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Date: Sat, 18 May 2019 13:30:08 -0500
Subject: [PATCH] ASoC: Intel: soc-acpi: Fix machine selection order

The selection order of m/c in match table is corrected
to use common codec as last in the list.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index df7c52cad5c3..c36c0aa4f683 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -29,17 +29,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
-		.id = "10EC5682",
+		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
+		.quirk_data = &cml_codecs,
 		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682.tplg",
+		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
 	{
-		.id = "MX98357A",
+		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-		.quirk_data = &cml_codecs,
 		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
+		.sof_tplg_filename = "sof-cml-rt5682.tplg",
 	},
 
 	{},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
