Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A335CB442
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C40F16CA;
	Sat, 27 Apr 2019 20:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C40F16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389034;
	bh=g52yxtR5e58GpOKI9d2o7Ex32yAIGsFUOFIwjHaHmQ4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ou8tG4gwhJRIvNtNL2i4t6LUA68faATaKN4fB010aCrDGIM70Z9HN0bQ1vx4O+3mP
	 /b7b6Z4x9MKBhSEE+YBziBG5ryh3G7T0ikrpZoIhsBgk1K8JJkje2IFyPQ25MYvEqt
	 mfYkuoDzILcVXEaOGjRiEMvX28q9wSJHnXRJDoas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4991DF8984E;
	Sat, 27 Apr 2019 19:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F258F89766; Sat, 27 Apr 2019 19:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED70EF8973F;
 Sat, 27 Apr 2019 19:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED70EF8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RmJbeT0F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PXThohsBODDs3KjmOIfGnP5ZOoguXBjtcdlejWRUwDM=; b=RmJbeT0FiGgc
 MRlsG0CsBIueQNMIYRMZUmRXgsnmeHe4MAsO9xwIIsk6DujuO45Qo0Drv+BFVY1kJEb5z6gIZTSB1
 DsoJKGaQAYdh63xQv6P8cl2cUYZ/1KKF6JzECltF1Q6O8lqqpDkmTyusgK7uQIvvcJhHi1O3+2Nzr
 OZfKc=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVU-0004qQ-LY; Sat, 27 Apr 2019 17:53:01 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7A046441D56; Sat, 27 Apr 2019 18:52:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-13-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175257.7A046441D56@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:57 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add Nocodec machine driver
	support" to the asoc tree
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

   ASoC: SOF: Add Nocodec machine driver support

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

From 8017b8fd37bf5ed4e9c0596f83295b019ff1c287 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:17 -0500
Subject: [PATCH] ASoC: SOF: Add Nocodec machine driver support

Add a simple "fallback" machine driver that can be used to enable SOF
on boards with no codec device. This machine driver can also be forced
for debug/development.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h     |   6 +++
 sound/soc/sof/nocodec.c | 109 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 sound/soc/sof/nocodec.c

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 54f65ec33a6c..4640566b54fe 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -12,6 +12,7 @@
 #define __INCLUDE_SOUND_SOF_H
 
 #include <linux/pci.h>
+#include <sound/soc.h>
 #include <sound/soc-acpi.h>
 
 struct snd_sof_dsp_ops;
@@ -91,4 +92,9 @@ struct sof_dev_desc {
 	const struct sof_arch_ops *arch_ops;
 };
 
+int sof_nocodec_setup(struct device *dev,
+		      struct snd_sof_pdata *sof_pdata,
+		      struct snd_soc_acpi_mach *mach,
+		      const struct sof_dev_desc *desc,
+		      const struct snd_sof_dsp_ops *ops);
 #endif
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
new file mode 100644
index 000000000000..f84b4344dcc3
--- /dev/null
+++ b/sound/soc/sof/nocodec.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <sound/sof.h>
+#include "sof-priv.h"
+
+static struct snd_soc_card sof_nocodec_card = {
+	.name = "nocodec", /* the sof- prefix is added by the core */
+};
+
+static int sof_nocodec_bes_setup(struct device *dev,
+				 const struct snd_sof_dsp_ops *ops,
+				 struct snd_soc_dai_link *links,
+				 int link_num, struct snd_soc_card *card)
+{
+	int i;
+
+	if (!ops || !links || !card)
+		return -EINVAL;
+
+	/* set up BE dai_links */
+	for (i = 0; i < link_num; i++) {
+		links[i].name = devm_kasprintf(dev, GFP_KERNEL,
+					       "NoCodec-%d", i);
+		if (!links[i].name)
+			return -ENOMEM;
+
+		links[i].id = i;
+		links[i].no_pcm = 1;
+		links[i].cpu_dai_name = ops->drv[i].name;
+		links[i].platform_name = dev_name(dev);
+		links[i].codec_dai_name = "snd-soc-dummy-dai";
+		links[i].codec_name = "snd-soc-dummy";
+		links[i].dpcm_playback = 1;
+		links[i].dpcm_capture = 1;
+	}
+
+	card->dai_link = links;
+	card->num_links = link_num;
+
+	return 0;
+}
+
+int sof_nocodec_setup(struct device *dev,
+		      struct snd_sof_pdata *sof_pdata,
+		      struct snd_soc_acpi_mach *mach,
+		      const struct sof_dev_desc *desc,
+		      const struct snd_sof_dsp_ops *ops)
+{
+	struct snd_soc_dai_link *links;
+	int ret;
+
+	if (!mach)
+		return -EINVAL;
+
+	sof_pdata->drv_name = "sof-nocodec";
+
+	mach->drv_name = "sof-nocodec";
+	sof_pdata->fw_filename = desc->nocodec_fw_filename;
+	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+
+	/* create dummy BE dai_links */
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+			     ops->num_drv, GFP_KERNEL);
+	if (!links)
+		return -ENOMEM;
+
+	ret = sof_nocodec_bes_setup(dev, ops, links, ops->num_drv,
+				    &sof_nocodec_card);
+	return ret;
+}
+EXPORT_SYMBOL(sof_nocodec_setup);
+
+static int sof_nocodec_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &sof_nocodec_card;
+
+	card->dev = &pdev->dev;
+
+	return devm_snd_soc_register_card(&pdev->dev, card);
+}
+
+static int sof_nocodec_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver sof_nocodec_audio = {
+	.probe = sof_nocodec_probe,
+	.remove = sof_nocodec_remove,
+	.driver = {
+		.name = "sof-nocodec",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(sof_nocodec_audio)
+
+MODULE_DESCRIPTION("ASoC sof nocodec");
+MODULE_AUTHOR("Liam Girdwood");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:sof-nocodec");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
