Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5FA360A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9641677;
	Fri, 30 Aug 2019 13:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9641677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567165969;
	bh=5vyGFy2D+ZyVqxDUS1t6MIZAXjjkBwtsjW8A8E2D3wM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gqE6hnB3w16Q3wsFF5lv8t3Vz0pxhnM9H2camB1oSfTWy3nGDxBKH+zEoI0jg4UVq
	 znO3ExhLJwibxac0YLVEpsKVQseMnlcLI8ZcfsbWrdaHqirH51q0XVs3uddp/UkPyu
	 o5EmpjmW0yuIHPL1b2PlPmrzCZIdoS+elDZV18GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C9AF80671;
	Fri, 30 Aug 2019 13:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA8C9F8060F; Fri, 30 Aug 2019 13:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E1BF805A0
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E1BF805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nmPgfbe5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DL+I+rAtszPH8UUp/xHLiOZjWk7OrZWj8jsDDc/Uib4=; b=nmPgfbe5JVeo
 ZxI1f3cjprmixIdN1Cj/Jcp8qxQ3EVZ6xP+HCWUIBxPZC+RmaQnvwYvFeYeHuTJYc6KTLxzs4QskM
 70wTeoSbBBoYk/WeHxH1CUz3+I/MGApq/ArM6jHSDFNcm8pQO9NEOdaWOAuOsJignBbk2TkjvTonC
 Pt34I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3fLC-0006Ia-UD; Fri, 30 Aug 2019 11:45:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 68C492742CA7; Fri, 30 Aug 2019 12:45:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190822113616.22702-2-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830114518.68C492742CA7@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 12:45:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Haswell: Adjust machine device
	private context" to the asoc tree
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

   ASoC: Intel: Haswell: Adjust machine device private context

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

From ca964edf0ddbfec2cb10b3d251d09598e7ca9b13 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 22 Aug 2019 13:36:13 +0200
Subject: [PATCH] ASoC: Intel: Haswell: Adjust machine device private context

Apart from Haswell machines, all other devices have their private data
set to snd_soc_acpi_mach instance.

Changes for HSW/ BDW boards introduced with series:
https://patchwork.kernel.org/cover/10782035/

added support for dai_link platform_name adjustments within card probe
routines. These take for granted private_data points to
snd_soc_acpi_mach whereas for Haswell, it's sst_pdata instead. Change
private context of platform_device - representing machine board - to
address this.

Fixes: e87055d732e3 ("ASoC: Intel: haswell: platform name fixup support")
Fixes: 7e40ddcf974a ("ASoC: Intel: bdw-rt5677: platform name fixup support")
Fixes: 2d067b2807f9 ("ASoC: Intel: broadwell: platform name fixup support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190822113616.22702-2-cezary.rojewski@intel.com
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/sst-acpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
index 0e8e0a7a11df..5854868650b9 100644
--- a/sound/soc/intel/common/sst-acpi.c
+++ b/sound/soc/intel/common/sst-acpi.c
@@ -141,11 +141,12 @@ static int sst_acpi_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, sst_acpi);
+	mach->pdata = sst_pdata;
 
 	/* register machine driver */
 	sst_acpi->pdev_mach =
 		platform_device_register_data(dev, mach->drv_name, -1,
-					      sst_pdata, sizeof(*sst_pdata));
+					      mach, sizeof(*mach));
 	if (IS_ERR(sst_acpi->pdev_mach))
 		return PTR_ERR(sst_acpi->pdev_mach);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
