Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A1311181
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFEC1739;
	Thu,  2 May 2019 04:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFEC1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764327;
	bh=gvnnDbsYoNXQxFq6mbnANdByP70+sQZl2qNFKkfw1VY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JPGao4KkGb4jIr3sB4xJLwIkX/Rb4vutdR4lAjX8PAU5KY0eDYsH9onHoEDL23VWi
	 ljFYNBHcxyiZvbW3p/VuQRU+5u+nxuFK9xj3u+3cgQIWFVgW0U8EJ4CyMOz008u93n
	 lTVHq6DlPR7qZUyHVGkEXFrucBx4d974ESURpXxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E453BF89785;
	Thu,  2 May 2019 04:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A08F89750; Thu,  2 May 2019 04:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F15BF89724
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F15BF89724
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WHzi9nLT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uN+m0c2baUFZ9aGoRUL5FbqmZq2brn5mpWyYq+S0/58=; b=WHzi9nLTgz+T
 5HfAmFKwfxA4m41XcfbN9zmKaRIg1nOfIqxuHTn6p2QahO+7dU79ozhuYR0iSy2J5hUogQFlBF671
 3vRvhtf06+6osn4D/+aajD2pAHeHw0BA9dmlmWdUsLg2DmCL6s4/9rOsOraotxuhkHSAvzZcWQEv3
 lJdik=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Io-0005rs-UG; Thu, 02 May 2019 02:18:27 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id EEE54441D3D; Thu,  2 May 2019 03:18:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
In-Reply-To: <1554917251-16772-1-git-send-email-yong.zhi@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021823.EEE54441D3D@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:23 +0100 (BST)
Cc: alsa-devel@alsa-project.org, harshapriya.n@intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, tiwai@suse.de, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Naveen Manohar <naveen.m@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: add Geminilake
	Realtek+Maxim machine driver entry" to the asoc tree
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

   ASoC: Intel: common: add Geminilake Realtek+Maxim machine driver entry

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

From d3692cb5c56daa2fb8046a8f4ebe1b2b8b22c895 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Wed, 10 Apr 2019 12:27:31 -0500
Subject: [PATCH] ASoC: Intel: common: add Geminilake Realtek+Maxim machine
 driver entry

This patch adds glk_rt5682_max98357a_i2s machine driver entry into
machine table. Both Skylake and SOF platform drivers can use this
machine drivers.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 3f2061475ae4..616eb09e78a0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -31,6 +31,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-da7219.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "glk_rt5682_max98357a",
+		.fw_filename = "intel/dsp_fw_glk.bin",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &glk_codecs,
+		.sof_fw_filename = "sof-glk.ri",
+		.sof_tplg_filename = "sof-glk-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_glk_machines);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
