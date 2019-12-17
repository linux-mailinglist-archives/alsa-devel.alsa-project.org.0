Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945F122C0C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:41:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9617985D;
	Tue, 17 Dec 2019 13:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9617985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576586508;
	bh=A5b/4FUlPRlQ6uu6Pc9zhtcZpOXGmFO5V/9wVMcAOsY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ci19Craw3w3+l5Bnc9WZIBos5XV2H/leIsLaa/zV/yUCHsv9jrbVcPs06XFShWmZY
	 7RInfSF8SMAw9jlx8O8RjOC4OIfYC2NGjBdMiaYk0ACFoBqKbVl9Uetn5roo/0JpBz
	 oz5ek1CDbfRNs0Zp9LwAB8E10TW/of7MD2GkEpRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FC2F80268;
	Tue, 17 Dec 2019 13:39:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AEFFF80100; Tue, 17 Dec 2019 13:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F3116F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3116F80100
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F147DA7;
 Tue, 17 Dec 2019 04:39:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F20B63F718;
 Tue, 17 Dec 2019 04:39:16 -0800 (PST)
Date: Tue, 17 Dec 2019 12:39:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191212191747.19995-1-tiwai@suse.de>
Message-Id: <applied-20191212191747.19995-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: skylake: Remove superfluous bus
	ops" to the asoc tree
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

   ASoC: intel: skylake: Remove superfluous bus ops

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

From ae91a189d2459644e800ceea615a9c1937ee5ae2 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 12 Dec 2019 20:17:47 +0100
Subject: [PATCH] ASoC: intel: skylake: Remove superfluous bus ops

The bus_core_ops values set in skl driver are same as the default
values, so we can drop it and pass NULL to snd_hdac_ext_bus_init()
instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191212191747.19995-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 58ba3e9469ba..f755ca2484cf 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -773,11 +773,6 @@ static void skl_codec_create(struct hdac_bus *bus)
 	}
 }
 
-static const struct hdac_bus_ops bus_core_ops = {
-	.command = snd_hdac_bus_send_cmd,
-	.get_response = snd_hdac_bus_get_response,
-};
-
 static int skl_i915_init(struct hdac_bus *bus)
 {
 	int err;
@@ -888,7 +883,7 @@ static int skl_create(struct pci_dev *pci,
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 	ext_ops = snd_soc_hdac_hda_get_ops();
 #endif
-	snd_hdac_ext_bus_init(bus, &pci->dev, &bus_core_ops, ext_ops);
+	snd_hdac_ext_bus_init(bus, &pci->dev, NULL, ext_ops);
 	bus->use_posbuf = 1;
 	skl->pci = pci;
 	INIT_WORK(&skl->probe_work, skl_probe_work);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
