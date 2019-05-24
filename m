Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5B293CE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 10:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183C416BA;
	Fri, 24 May 2019 10:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183C416BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688171;
	bh=tZIvwm4bG3YkhxotDnTGb1oyc8DIBFQnYk9EeYhZfrU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X6mO7YOXGmuKJfp8OOFw8X3S/VJmcn57UfTPjTZqjNd5ghyl3lY4g4hNUKk+XGsgd
	 rqj8IJ31oWgukQK3lWx3G9hXf4jTz/GhtnsukDrnNE5LybxpFz8bIZrxDvAsL5GW/+
	 cnSh4YwE91J2hj74MnsXhFpHRbuF6AgOk226g/o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1B8F89630;
	Fri, 24 May 2019 10:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6CBAF89630; Fri, 24 May 2019 10:54:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF24F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 10:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF24F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="U7qLd1q8"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ce7b1350000>; Fri, 24 May 2019 01:54:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 24 May 2019 01:54:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 24 May 2019 01:54:18 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 08:54:17 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 24 May 2019 08:54:18 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by
 hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce7b1380001>; Fri, 24 May 2019 01:54:17 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Fri, 24 May 2019 09:54:04 +0100
Message-ID: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1558688053; bh=nLIuj+dWoHUdiLPx4+WIEBrzL5eS8acbrvzehEuKewA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=U7qLd1q8OQQZhGp7qzKaeHeA6i3Xdhy1PU+tomyMsdXeT4AGyOeWMWaCXa08lSbM6
 Ph7h2yRh/+ZedkiWZQnPeGmW0K5ElEw0egotjTyGYhWPBzT205VlCYFU2ppM+kiBFz
 m6eeyCwAzBO5/yYdYJBIWWnlr27Xx09z0RcImMFsqbe39IRJV06XrGA44rpdD6hpqQ
 h/N7mlX7YjWvHukBqJEUgsWu1oC14osKxZbMIztu1lG9IE63xMMpwIwDJLsr79cVTg
 wkmj8u9jXSR5Ma0APD7hh6Y3raoh7J6UeY9SXog8GRaf8PvgiOEWs4vL0SQsWm8P2N
 wpIIL0Of/k6UA==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [alsa-devel] [PATCH] Revert "ASoC: simple-card: Fix configuration
	of DAI format"
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

Revert commit 069d037aea98 ("ASoC: simple-card: Fix configuration of
DAI format"). During further review, it turns out that the actual issue
was caused by an incorrectly formatted device-tree node describing the
soundcard.

The following is incorrect because the simple-audio-card
'bitclock-master' and 'frame-master' properties should not reference the
actual codec phandle ...

	sound {
		compatible = "simple-audio-card";
		...
	=>	simple-audio-card,bitclock-master = <&codec>;
	=>	simple-audio-card,frame-master = <&codec>;
		...

		simple-audio-card,cpu {
			sound-dai = <&xxx>;
		};

		simple-audio-card,codec {
	=>		sound-dai = <&codec>;
		};
	};

Rather, these properties should reference the phandle to the
'simple-audio-card,codec' property as shown below ...

	sound {
		compatible = "simple-audio-card";
		...
	=>	simple-audio-card,bitclock-master = <&codec>;
	=>	simple-audio-card,frame-master = <&codec>;
		...

		simple-audio-card,cpu {
			sound-dai = <&xxx>;
		};

	=>	codec: simple-audio-card,codec { /* simple-card wants here */
			sound-dai = <&xxx>;	 /* not here */
		};
	};

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/generic/simple-card.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index c2a2c5fd0801..d16e894fce2b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -283,6 +283,11 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	codec_dai		=
 	dai_props->codec_dai	= &priv->dais[li->dais++];
 
+	ret = asoc_simple_parse_daifmt(dev, node, codec,
+				       prefix, &dai_link->dai_fmt);
+	if (ret < 0)
+		goto dai_link_of_err;
+
 	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
 
 	ret = asoc_simple_parse_cpu(cpu, dai_link, &single_cpu);
@@ -293,11 +298,6 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_daifmt(dev, node, dai_link->codecs->of_node,
-				       prefix, &dai_link->dai_fmt);
-	if (ret < 0)
-		goto dai_link_of_err;
-
 	ret = asoc_simple_parse_platform(plat, dai_link);
 	if (ret < 0)
 		goto dai_link_of_err;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
