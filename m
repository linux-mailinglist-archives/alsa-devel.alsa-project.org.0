Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56320BEB6
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C157416A9;
	Sat, 27 Jun 2020 07:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C157416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234170;
	bh=JbG7iRsyEjbRAMGdNNFQgQk2P8PgUjhZLg8zR11Q84Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KxnwSzCJ37aZjnePdiKZN1JyIvN8YmiZq1AUbQL6ue4rzMafY5doVvIq1OjfPh+h9
	 0nRrfRIiFdrg42T5LYvpiA/vWoP25yXj5piwkUhl1xPfl/8Mk6U5LIf7q45ygxXz6W
	 BBaCJL66nGypetB1PLCFr6ehDq0X+2HvXZMsAV3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C067EF80321;
	Sat, 27 Jun 2020 06:55:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2713FF80338; Sat, 27 Jun 2020 06:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B90D5F80321
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B90D5F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Qtcj4hNT"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d1040000>; Fri, 26 Jun 2020 21:54:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:16 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:15 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d12e0000>; Fri, 26 Jun 2020 21:55:15 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
Date: Sat, 27 Jun 2020 10:23:33 +0530
Message-ID: <1593233625-14961-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233668; bh=4ND8txYRt9aF/VJmFfVsaNJ3R7xChBowo2iz1AmLmcg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=Qtcj4hNTqC3Q7adov9wd1dtZ1ybLvIRAxpiPz5zmKfMBKe9JFUucr24CcJ3MW71B5
 ZUPK6huyOiUlgZdWTe7nRsvuiK0weCywanL3+12KixoEiOrLELYclfwwhWAISruYXQ
 QFLv7+fQdHFpCPQbXtdCzeM86zEiOTNn9Dj0rvb9Bp0xCo9WTW1Ivq17DSkcZNwVRU
 kk9Pha2QQnZzfb8BtgTCRyuoGoA8Pk9pO4bQNlOIjeDc24QhRlNNXKwGbnuL1K5v9E
 cRcJbi3Fog/ipRvBqPptrNYYOdXudP8GttIKV8pfjSS/hygTNCRFaCSmM7cCnZAytn
 Fg2CDmADLHGrw==
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

CPU/Codec in DPCM DAI links are connected as CPU<->Dummy and Dummy<->Codec.
Though mostly CPU won't use/require 'mclk-fs' property, looping over
'np' (current child node in a DAI link) can help in cases where multiple
Codecs are defined. This further helps to get rid of 'codec' argument
from simple_dai_link_of_dpcm() function, which gets called for DPCM links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 39cdc71..02d6295 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -107,7 +107,9 @@ static void simple_parse_mclk_fs(struct device_node *top,
 	snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
 	of_property_read_u32(node,	prop, &props->mclk_fs);
 	of_property_read_u32(cpu,	prop, &props->mclk_fs);
-	of_property_read_u32(codec,	prop, &props->mclk_fs);
+
+	if (cpu != codec)
+		of_property_read_u32(codec, prop, &props->mclk_fs);
 
 	of_node_put(node);
 }
@@ -220,7 +222,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	simple_parse_convert(dev, np, &dai_props->adata);
-	simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
+	simple_parse_mclk_fs(top, np, np, dai_props, prefix);
 
 	asoc_simple_canonicalize_platform(dai_link);
 
-- 
2.7.4

