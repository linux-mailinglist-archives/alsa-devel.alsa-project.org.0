Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1C14A984
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 19:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70AB822;
	Mon, 27 Jan 2020 19:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70AB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580148857;
	bh=RS+hf4hMaXgHEXhZlmEFL4x2r2D6NB272ol2cDGuaiM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cc2bgAv7kAm4V0SqGv6lcV9w38P18Z9W0phnIY4oxvDdSATgb9dBiU3qc5vsgsYg/
	 M6C/AVmrkZ8thCJv5BzzMV4WrUHl5ZBqLTbwG8pOu0/JFj3dlQVV2xFdfcPERxAtMv
	 wpM/Lz8koDlp2PVm6kMAq+1QjLVGrYJdzCFjJH6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B71F80273;
	Mon, 27 Jan 2020 19:11:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B30F80256; Mon, 27 Jan 2020 19:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 601B9F80218
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 19:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 601B9F80218
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0D511045;
 Mon, 27 Jan 2020 10:11:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59EAD3F67D;
 Mon, 27 Jan 2020 10:11:22 -0800 (PST)
Date: Mon, 27 Jan 2020 18:11:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20200124213625.30186-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200124213625.30186-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pci: add missing default_fw_name
	of JasperLake" to the asoc tree
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

   ASoC: SOF: pci: add missing default_fw_name of JasperLake

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

From e3b9f5f4ef92801f62c58665283c61cece0af905 Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Fri, 24 Jan 2020 15:36:23 -0600
Subject: [PATCH] ASoC: SOF: pci: add missing default_fw_name of JasperLake

jsl_desc missed default_fw_name, this will fail the probe in
nocodec or generice HDA mode due the firmware path is intel/sof/(null)

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200124213625.30186-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index d855bc2b76ad..bf01b92f0dac 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -235,6 +235,7 @@ static const struct sof_dev_desc jsl_desc = {
 	.chip_info = &jsl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-jsl.ri",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
