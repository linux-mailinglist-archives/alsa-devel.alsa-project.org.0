Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84B100ADD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 18:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86137169B;
	Mon, 18 Nov 2019 18:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86137169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574099556;
	bh=2uOixDNslEAkThuC3VusIciXrMGiKNWnKJ+OHNeOVaw=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tCtXQzOCw0Kt5lOMlJZBxB2VspKcM4AR3qJzbFssUMVtnYEKiVW3xivzn31DgBsSw
	 KOu131Eb17f7Nb0vVtrXGgOaXl17qRFrWJ133cCOqpjIeXSAuzTMdPw0FpJA2NVDpG
	 o3i5XTPVrDv7i2KkTN3Houx+HpV55aKhxUFv4pAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C98AF80160;
	Mon, 18 Nov 2019 18:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D10A1F8015E; Mon, 18 Nov 2019 18:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 93897F80157
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 18:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93897F80157
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2551EDA7;
 Mon, 18 Nov 2019 09:48:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 886893F703;
 Mon, 18 Nov 2019 09:48:54 -0800 (PST)
Date: Mon, 18 Nov 2019 17:48:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Fix build break" to the
	asoc tree
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

   ASoC: SOF: Intel: Fix build break

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

From 302ee055af0201e61be7670f957c1622d6ce176e Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Nov 2019 15:52:47 +0000
Subject: [PATCH] ASoC: SOF: Intel: Fix build break

Commit 130d3e9077 (Fix CFL and CML FW nocodec binary names.) broke the
build in some configurations as it depends on changes in the development
branch, revert it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 2ef927371b23..d66412a77873 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -113,7 +113,7 @@ static const struct sof_dev_desc cnl_desc = {
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
 static const struct sof_dev_desc cfl_desc = {
-	.machines		= snd_soc_acpi_intel_cfl_machines,
+	.machines		= snd_soc_acpi_intel_cnl_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -122,7 +122,7 @@ static const struct sof_dev_desc cfl_desc = {
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-cfl.ri",
+	.nocodec_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -133,7 +133,7 @@ static const struct sof_dev_desc cfl_desc = {
 	IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
 
 static const struct sof_dev_desc cml_desc = {
-	.machines		= snd_soc_acpi_intel_cml_machines,
+	.machines		= snd_soc_acpi_intel_cnl_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -142,7 +142,7 @@ static const struct sof_dev_desc cml_desc = {
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-cml.ri",
+	.nocodec_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
