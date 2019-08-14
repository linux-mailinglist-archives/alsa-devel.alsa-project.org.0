Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA858CBDF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA6B1667;
	Wed, 14 Aug 2019 08:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA6B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763731;
	bh=t9pTo1WaWXJHCMvJdwDyQ6nnga7UKJoez872wlfevzo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WieZJVCB1OXF+deVUPAyVI1orbUomrWLSjfrHSHwGcC+QPHVkWyMxXfgeCvkOELTs
	 +vg6tZOnCqqxGYft8+mN8/sCa9eW2MEGguE4H13NKyrRm6HCNP3vNHvUzAbMNqfag+
	 RvIrsKSttLKTb9a/FN3KVOQaFJRag/nx4k3ZrywU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E83BF80760;
	Wed, 14 Aug 2019 08:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA6E1F806E9; Wed, 14 Aug 2019 08:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A794F8067A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A794F8067A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qzrffdve"
Received: by mail-lf1-x144.google.com with SMTP id c19so78488691lfm.10
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUt25DA3nPbOAehIkkx29Wu4YEVb8BWcE2W2re+0NE8=;
 b=QzrffdvexAezMs4qMJYVZcFcbj6IE7U0mJndLRmd/1BqqRNboSoqBX9wbZeQcI5HoE
 w+8XxVS9TsjVcRzUcV/FkR/2dQI39Xd3c1UNtyEml6R/wNofjTIjHWnQHNAd91WMB9D/
 O5NgoQlUDESnv1urOYAvLTImhvggWvHvzR38HBBvz0PzaWlzTyAAVyAlRNTfIut9E95D
 sG6xu/38nnJgWKN0H4gSncltZzd5pJ3r5OYnnK99Hg7sFkRneR5g4QmK2JxTBaWExZeU
 y1kR1L0VrKuQoWAS3Y51l2dWRyd7jzrx+ItAfegoXkmNpoNHZ8qS7L7tM5FB8DTtr7pK
 GnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUt25DA3nPbOAehIkkx29Wu4YEVb8BWcE2W2re+0NE8=;
 b=LzWqKZ72GeHnEbIIVVcSZMe7sFi8HAZA/g++/ZrJmTIMpfO9fEQjE7nn5eAZnrqLVj
 a7izXg5mcvxbyKZcCng+7ORwGP42CYXtZKYAWGKR+dhtJoUFmfs+jAW2MLIIwos4CxL9
 PYNTCyws9hAR5M/K14VVz0N02GWCA8HshBga/WXTt7pOxcLk8RE1Jx7Zoa+088EgHwvH
 ZRYd8DtZ3CmFT9MTSKf990FXmfJeewNWM5y2oZcIstuh8PcZcK9cwAAArX923qQwk9tZ
 PtZOr6grMuXV+gOmYd5DYGQhyZ1YEjkEuRRQQUI0diNPDjvaD7YZd+KhHTZokXsjd9iH
 bDdA==
X-Gm-Message-State: APjAAAXMGsN8vXyG7GOugQtyrjvJtZv6QZg/+R33+zyvAM3SwfuuSPTV
 vMuKnyKArBD286cKiiOlOsY=
X-Google-Smtp-Source: APXvYqw3HfEmEsNcDcX28N02uPXQDKmFFo7Z9ESeDxVgagfChtjL+ghhnK2wlxr9TTWmXx73KB298w==
X-Received: by 2002:ac2:465e:: with SMTP id s30mr25328482lfo.19.1565762959397; 
 Tue, 13 Aug 2019 23:09:19 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:18 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:53 +0200
Message-Id: <20190814060854.26345-15-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 14/15] ASoc: sun4i-i2s: Add 20,
	24 and 32 bit support
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

From: Marcus Cooper <codekipper@gmail.com>

Extend the functionality of the driver to include support of 20 and
24 bits per sample for the earlier SoCs.

Newer SoCs can also handle 32bit samples.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index a71969167053..d3c8789f70bb 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -690,6 +690,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 20:
+	case 24:
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1015,6 +1020,13 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
+#define SUN8I_FORMATS	(SUN4I_FORMATS | \
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1022,14 +1034,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_i2s_dai_ops,
 	.symmetric_rates = 1,
@@ -1505,6 +1517,11 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	if (i2s->variant->has_fmt_set_lrck_period) {
+		soc_dai->playback.formats = SUN8I_FORMATS;
+		soc_dai->capture.formats = SUN8I_FORMATS;
+	}
+
 	if (!of_property_read_u32(pdev->dev.of_node,
 				  "allwinner,playback-channels", &val)) {
 		if (val >= 2 && val <= 8)
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
