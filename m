Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6514D920
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 11:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BE0166D;
	Thu, 30 Jan 2020 11:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BE0166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580380621;
	bh=9IpUcZNP5v+uzu+n9aLzr3AKiHGyGR8t3zMMgaMu6C4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4j4v3bGeXdm46zeGi8kESbkxC73TOQ/T6SzptbojKiinGndclBOpwxq3rOPnvtYD
	 u/mEHbLce68xoDbvW69k2CS7dZ4pmlh4v9DdVxrXOcnZBwS7Nyt1f1Swc45UICV08F
	 W8PFdSGwKP6TOTXAk39GTxzhZTPLGcBT+qe+Zo8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFA9F80274;
	Thu, 30 Jan 2020 11:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CED77F80150; Thu, 30 Jan 2020 11:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1495F80150
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 11:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1495F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="PEMLRh1j"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e32b0f30000>; Thu, 30 Jan 2020 02:33:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jan 2020 02:34:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 02:34:15 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:14 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e32b1210004>; Thu, 30 Jan 2020 02:34:14 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Date: Thu, 30 Jan 2020 16:03:35 +0530
Message-ID: <1580380422-3431-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580380403; bh=KBNVhGw8w/plbegpaXG3oGndaiAOTvHopvV4JtTt+Pg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=PEMLRh1j1xCBILaLgRR1MNtCoqqwRyXo+hwPYxqSQ9dqsKiNUw2jX0KAIXchd/x3u
 w11tfYYoeRGU0hiyMnyUT0GrFClSjzP7vOybAtLz8WfotC3XNYLTWjvdQaMe/l59QO
 sReF3nmfAan1LxXEEpy0W3NyE+eQscVEB7gRsclaK3X8d3K8fIdnSdwGCUO/dIhHMt
 daAl/jjl4kCJJZuVsDPsutceIGFAqH1gFIMmSPudljtGDGmi2ds4TPCiuw/RugjdO9
 AuRdC0uWfENxd7Wj3k7kzf9XwmdBYCZz20T9+a2w45Bf11gBQNFDthXyLKp9RLzirG
 7UYTc7IqJrVNQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: [alsa-devel] [PATCH v2 2/9] ASoC: tegra: add support for CIF
	programming
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Audio Client Interface (CIF) is a proprietary interface employed to route
audio samples through Audio Hub (AHUB) components by inter connecting the
various modules.

This patch exports a helper function tegra_set_cif() which can be used,
for now, to program CIF on Tegra210 and later Tegra generations. Later it
can be extended to include helpers for legacy chips as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Makefile    |  2 ++
 sound/soc/tegra/tegra_cif.c | 34 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra_cif.h | 47 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_cif.c
 create mode 100644 sound/soc/tegra/tegra_cif.h

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index c84f183..261aa21 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -8,9 +8,11 @@ snd-soc-tegra20-i2s-objs := tegra20_i2s.o
 snd-soc-tegra20-spdif-objs := tegra20_spdif.o
 snd-soc-tegra30-ahub-objs := tegra30_ahub.o
 snd-soc-tegra30-i2s-objs := tegra30_i2s.o
+snd-soc-tegra-cif-objs := tegra_cif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-cif.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
 obj-$(CONFIG_SND_SOC_TEGRA20_DAS) += snd-soc-tegra20-das.o
 obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
diff --git a/sound/soc/tegra/tegra_cif.c b/sound/soc/tegra/tegra_cif.c
new file mode 100644
index 0000000..242ae34
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_cif.c - Tegra Audio CIF Programming for AHUB modules
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include "tegra_cif.h"
+
+void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+		   struct tegra_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
+		((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
+		((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
+		(conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
+		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
+}
+EXPORT_SYMBOL_GPL(tegra_set_cif);
+
+MODULE_DESCRIPTION("Tegra Audio Client Interface (ACIF) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
new file mode 100644
index 0000000..fb55812
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra_cif.h - TEGRA Audio CIF Programming
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA_CIF_H__
+#define __TEGRA_CIF_H__
+
+#define TEGRA_ACIF_CTRL_FIFO_TH_SHIFT		24
+#define TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT		20
+#define TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT		16
+#define TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT	12
+#define TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT	8
+#define TEGRA_ACIF_CTRL_EXPAND_SHIFT		6
+#define TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT	4
+#define TEGRA_ACIF_CTRL_REPLICATE_SHIFT		3
+#define TEGRA_ACIF_CTRL_TRUNCATE_SHIFT		1
+#define TEGRA_ACIF_CTRL_MONO_CONV_SHIFT		0
+
+/* AUDIO/CLIENT_BITS values */
+#define TEGRA_ACIF_BITS_8			1
+#define TEGRA_ACIF_BITS_16			3
+#define TEGRA_ACIF_BITS_24			5
+#define TEGRA_ACIF_BITS_32			7
+
+#define TEGRA_ACIF_UPDATE_MASK			0x3ffffffb
+
+struct tegra_cif_conf {
+	unsigned int threshold;
+	unsigned int audio_ch;
+	unsigned int client_ch;
+	unsigned int audio_bits;
+	unsigned int client_bits;
+	unsigned int expand;
+	unsigned int stereo_conv;
+	unsigned int replicate;
+	unsigned int truncate;
+	unsigned int mono_conv;
+};
+
+void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+		   struct tegra_cif_conf *conf);
+
+#endif
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
