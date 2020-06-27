Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42120BEA3
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 06:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F26168A;
	Sat, 27 Jun 2020 06:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F26168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593233837;
	bh=kZ8VlZoIHrQvKQOOvA3QELFPzrwL0Th2CAZeILNromM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opvRgU0uWv7bUWiqIefGrDWSEFemiY62pScZG0TttVM5ybacfR7AYAEFSZCg9cW6M
	 7kYCqaOmrTWhth9M5D7NLavwGlwG4i3Fauhvnbu4uDDftUI5W5EWVMoUDHkFtSEuzv
	 XBhSVUqv9Qt5mNNlh/yN9yxi0bl4XYJ2A/jWmuec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5172F802A1;
	Sat, 27 Jun 2020 06:54:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96C24F8025E; Sat, 27 Jun 2020 06:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD5E4F80096
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD5E4F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="PmNqNJA6"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d0f60000>; Fri, 26 Jun 2020 21:54:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:54:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 26 Jun 2020 21:54:27 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:54:26 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:54:26 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d0fd0000>; Fri, 26 Jun 2020 21:54:26 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 02/23] ASoC: tegra: Add support for CIF programming
Date: Sat, 27 Jun 2020 10:23:24 +0530
Message-ID: <1593233625-14961-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233654; bh=avjJNBmyDs+NaCxpIRi8FaEhEBoDKZ4zb32eB5KFuzY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=PmNqNJA6ZF73lNzFMWvRrn1CB54zY98H6qjPNJgOWWaoZkzDBEMcHc+jqDYF9qxYY
 9BFZVcgywVQ4joAX1w6atMRdS2vXzPYImq6AAK/Woq5DRNtzmJr2cTmh16yKamO7Vc
 OLji5KkFM9mTtA0QJDbZxjTI1Spziko0aY0huN2S6U50hIjwIyQwa6yI/uLKnvS0C6
 kGvqcJ9JMMvLh/fAq1BkH7w7XkXKVBnCqM8iPFL9/sSNf76w76vXDK2fg6SrFlTsU5
 TC9ywOKCm91pm6XkQB0aSw2j6lAFAMZDptcB6h//t9KzMW4QmlxnFFPAssUFFi9fdv
 jazp/XUJfxaew==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

Audio Client Interface (CIF) is a proprietary interface employed to route
audio samples through Audio Hub (AHUB) components by inter connecting the
various modules.

This patch exports an inline function tegra_set_cif() which can be used,
for now, to program CIF on Tegra210 and later Tegra generations. Later it
can be extended to include helpers for legacy chips as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_cif.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_cif.h

diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
new file mode 100644
index 0000000..7cca806
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.h
@@ -0,0 +1,65 @@
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
+#include <linux/regmap.h>
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
+static inline void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+				 struct tegra_cif_conf *conf)
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
+
+#endif
-- 
2.7.4

