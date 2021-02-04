Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1FB30F42D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3371739;
	Thu,  4 Feb 2021 14:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3371739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612446789;
	bh=I5FAwdAowxjNg1dKZPJMdEFXVOC2okaJJy3ye3JbNns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nOStQUVVhH3PQwi9aQH0N94bXPWnWBDHJGc6RD6crk46aP08uSkbKx2kLTlKthIva
	 Js6sjTk5vc45YRys4m1OFfnfUARGSisE8+XBY9USYhm8TYxfnYy+jT1HonUIYPUV+L
	 3IcHeLUQWyyGmkLPeEwIlmPZywgwonePeH6Q1nXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BEAF80277;
	Thu,  4 Feb 2021 14:50:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CFACF80275; Thu,  4 Feb 2021 14:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2288F8023E
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2288F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nA553Q5Q"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601bfbaf0006>; Thu, 04 Feb 2021 05:50:39 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:39 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 3/3] ASoC: tegra: Add driver remove() callback
Date: Thu, 4 Feb 2021 19:20:12 +0530
Message-ID: <1612446612-32613-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
References: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612446639; bh=N/HUC5nO63V7ziFfbl7mA/9IeZbh8vyGK/1MWRYaR/M=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=nA553Q5Qn/JAbDDXTpn6CciLcUf8jDFG17YMMiyYR+RWB0OM4xc8ghkCF6fo2Qlsg
 s3Jw9WUO4QR++Xp3mMvaqExOfhTHsssYYrvL6LQwwR8ZM/26NZMBvJVrV4Vu/1L5RX
 OIHxtfYp4SJY5rlZQtXyV30vI/q3H5dyO8vuaXfCxF37sWlUhxpZj75/iXDUtZb7i1
 XYMxuolQiUlz0alJRecNZbASBfEuGXlL+5X0eat8Yfa0Ymy+HelZ8AQo/K2x8zb4L9
 KfCgzDeK3v7q7yzIKDiFSPk1spXkVQueuY8sytS16jPWDs625jMbn/aUvAOzMcs/yk
 cCVeYvYCReQBA==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

There is cleanup required, related to release of phandles, during driver
removal and hence point remove function pointer to audio_graph_remove().

Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
Depends-on: "ASoC: audio-graph: Rename functions needed for export"
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 121e572..ddedf18 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -2,7 +2,7 @@
 //
 // tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
 //
-// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2020-2021 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -243,6 +243,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
+	.remove = audio_graph_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
-- 
2.7.4

