Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8F1A8074
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41498167F;
	Tue, 14 Apr 2020 16:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41498167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876020;
	bh=FDDFCvbmNNIrazyB4a3C4tcI4jN7MuoLeLE4oRrfZXI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Al6q87jEyvgZ/10VT5mikO50nd9XUsHc6wW9QlUSjMVsvIwTL5kkFh1GbWCef5nyM
	 3nXUjx/m+MqGMP6clPsbrHAo/vXq6qRg4RpsXw/Y2UL3VFlNvGAHULy6Z50/aawLlp
	 LLFzvU3w9mZY2BBMRlOXZIWO5zWYcbgB1zUqFkB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AAD7F80306;
	Tue, 14 Apr 2020 16:46:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59B0CF80305; Tue, 14 Apr 2020 16:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E62D5F802F8
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E62D5F802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fU0UHxh7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8DE720787;
 Tue, 14 Apr 2020 14:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875605;
 bh=FDDFCvbmNNIrazyB4a3C4tcI4jN7MuoLeLE4oRrfZXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fU0UHxh7MYW8sWqsCaMQ9rvEoF5/KlimNiOsCQamIlayvSslTfs2qV7Tew2+06DT9
 0Qn0xEc6QDZxyWlOyKuzVfl2ntwtw+s0AbXkOG5XDkwdp2zI+7o6ZrvL9o1uM7JTTB
 b2CDtcmp6Gl8pkTk0dpvgdq7YS5Wy7wdkhjpDW2E=
Date: Tue, 14 Apr 2020 15:46:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: Intel: soc-acpi-intel-cml-match: remove useless
 'rt1308_2_adr'" to the asoc tree
In-Reply-To: <20200410081117.21319-2-yanaijie@huawei.com>
Message-Id: <applied-20200410081117.21319-2-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 yanaijie@huawei.com, tiwai@suse.com, yang.jie@linux.intel.com,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 christophe.jaillet@wanadoo.fr, ranjani.sridharan@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
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

   ASoC: Intel: soc-acpi-intel-cml-match: remove useless 'rt1308_2_adr'

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

From a306f04511148fade6bead59920dde864a54f017 Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Fri, 10 Apr 2020 16:11:17 +0800
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-cml-match: remove useless
 'rt1308_2_adr'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/intel/common/soc-acpi-intel-cml-match.c:116:45: warning:
‘rt1308_2_adr’ defined but not used [-Wunused-const-variable=]
 static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
                                             ^~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200410081117.21319-2-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index bcedec6c6117..7d85bd5aff9f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -113,14 +113,6 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
-	{
-		.adr = 0x000210025D130800,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
-	}
-};
-
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
 		.adr = 0x000110025D130800,
-- 
2.20.1

