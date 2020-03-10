Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FA180552
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 18:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD440166D;
	Tue, 10 Mar 2020 18:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD440166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583862454;
	bh=acelyU8fWjSrCU+Um3n0BOgdCP59SB7ZYX92upRDZwk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Rl5BVikBLOLyHElDpuqWnExwrh7RNtQgSLD1JdX3N/aw+XebzAsPB5s2b2FV67WIW
	 ssGqp6Q/Rlv6Atc39rNMJm2oV8NLgHpMhWKY3ll6f9wwvqDnJMqQ5rwxI0BC7heVrc
	 VMDCO6DEnn3lhHOUnM+2IPxnfCIaHX1GlKPpojPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3ADAF8028C;
	Tue, 10 Mar 2020 18:44:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9347F8028B; Tue, 10 Mar 2020 18:44:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C139AF80123
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C139AF80123
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0E1A1FB;
 Tue, 10 Mar 2020 10:44:53 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320DA3F67D;
 Tue, 10 Mar 2020 10:44:53 -0700 (PDT)
Date: Tue, 10 Mar 2020 17:44:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: Intel: Skylake: Shield against no-NHLT configurations"
 to the asoc tree
In-Reply-To: <20200305145314.32579-5-cezary.rojewski@intel.com>
Message-Id: <applied-20200305145314.32579-5-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
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

   ASoC: Intel: Skylake: Shield against no-NHLT configurations

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

From 9e6c382f5a6161eb55115fb56614b9827f2e7da3 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 5 Mar 2020 15:53:11 +0100
Subject: [PATCH] ASoC: Intel: Skylake: Shield against no-NHLT configurations

Some configurations expose no NHLT table at all within their
/sys/firmware/acpi/tables. To prevent NULL-dereference errors from
occurring, adjust probe flow and append additional safety checks in
functions involved in NHLT lifecycle.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-5-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-nhlt.c | 3 ++-
 sound/soc/intel/skylake/skl.c      | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 19f328d71f24..d9c8f5cb389e 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -182,7 +182,8 @@ void skl_nhlt_remove_sysfs(struct skl_dev *skl)
 {
 	struct device *dev = &skl->pci->dev;
 
-	sysfs_remove_file(&dev->kobj, &dev_attr_platform_id.attr);
+	if (skl->nhlt)
+		sysfs_remove_file(&dev->kobj, &dev_attr_platform_id.attr);
 }
 
 /*
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index e2e531c96dd1..7ad8a75759bd 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -633,6 +633,9 @@ static int skl_clock_device_register(struct skl_dev *skl)
 	struct platform_device_info pdevinfo = {NULL};
 	struct skl_clk_pdata *clk_pdata;
 
+	if (!skl->nhlt)
+		return 0;
+
 	clk_pdata = devm_kzalloc(&skl->pci->dev, sizeof(*clk_pdata),
 							GFP_KERNEL);
 	if (!clk_pdata)
@@ -1074,7 +1077,8 @@ static int skl_probe(struct pci_dev *pci,
 out_clk_free:
 	skl_clock_device_unregister(skl);
 out_nhlt_free:
-	intel_nhlt_free(skl->nhlt);
+	if (skl->nhlt)
+		intel_nhlt_free(skl->nhlt);
 out_free:
 	skl_free(bus);
 
@@ -1123,7 +1127,8 @@ static void skl_remove(struct pci_dev *pci)
 	skl_dmic_device_unregister(skl);
 	skl_clock_device_unregister(skl);
 	skl_nhlt_remove_sysfs(skl);
-	intel_nhlt_free(skl->nhlt);
+	if (skl->nhlt)
+		intel_nhlt_free(skl->nhlt);
 	skl_free(bus);
 	dev_set_drvdata(&pci->dev, NULL);
 }
-- 
2.20.1

