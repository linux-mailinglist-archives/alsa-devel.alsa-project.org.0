Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7821B8F02
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 12:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11E15844;
	Sun, 26 Apr 2020 12:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11E15844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587897930;
	bh=CL3ct3ar84Icer7ZAU0Ktyqhis+Ekb26k2vZhNIl3qI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ER+qJlbMBhL+pfDM1ee5H1CH2kQ1hD0aEhwiC9yzd8epwlhj6q5bflC+h2dcT/A1g
	 BRy/9GLDmcG/Jp5Z2uqav7LVkmx5l8IjzerUrJZTbZacoXRNOS7N6POJukbJbHR/xC
	 41rED4MFjtnLBNzaSqwhlbNGlCT+g6YBKJsJQmwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A47F8029B;
	Sun, 26 Apr 2020 12:41:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95478F80292; Sun, 26 Apr 2020 12:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB926F80229
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 12:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB926F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EpGT0O9I"
Received: by mail-wm1-x344.google.com with SMTP id 188so16231021wmc.2
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 03:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPmRG0eokqpdl/q2VMZgNzJBd9cVrpLdjOI8ETo+m6A=;
 b=EpGT0O9Iarn76rrEIWIz78idcptdCG/Ex0bRkE0WB14Sp3hBUGQsGfpbJz2soHss1S
 /6r+2EqiqnXv98wkZN7flIEf6HlTQfO/CVxJ5vf0kchFY3vZzzwrQEkH0sSjAve6amxg
 6jSNxGlqrfmsePNfMBCh9yRL1Xp3EDoqLnMWlGpgKwfaEtL3751QfsdxZ85KsSfbT8Pb
 ytTLHsDCB0wKayozdQp47VkK3ykTeaDMOm3oIfIop8R9rXanGyVX0uzPzuqJjzBYmisi
 6s2CEQc1KyudTuYsY657g0DiNqHh4xOupY0Cza2WgP7ao3Efj8CmIzRGBSBriWg5fihR
 bDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPmRG0eokqpdl/q2VMZgNzJBd9cVrpLdjOI8ETo+m6A=;
 b=l8gaNxrOsuW6irg3BeDHe6fox9Q/HIqFKZdP4Q75sK5Ps2TIGBQ4qF55mJ0rpW6ibb
 /1BzrxtovU98fZYe21RDLkyeCtZwiZGsLKWSHTFma7oSLIlAKkdzo4/Zl8Gq9YBzNXZf
 pVOx2B5T/QVBpv9JH9flB41HUmE6GQD31J/HprmuiDLxioMHGS9LIjAj3V5LRKRmDOFW
 pD0PvBz88/O0EBEubneP09b/GBJSsu6uCXxvJWJppveM4OtxbTQc0mtWhaoROck2TQSF
 Nw+ITrDpNEfw+J7I5xogMyT2938Cv5LzQrh9btJWtZaBRtQ4FRaSCngiYn52poeEg5fv
 RAog==
X-Gm-Message-State: AGi0PuYGJR9qtrM56Rte+t22YZESWdwH8UqlnOXAoewIJ5hNkPYAmJ/3
 psDzC2B+UwZlA6qShLEZzOc=
X-Google-Smtp-Source: APiQypI6n/5+7cpoIEtCz+tkkyK76+2/yd5WP4fqwKKPC90tfsehNHzeXrlr753fWnjqoEVUFPBkCw==
X-Received: by 2002:a1c:24d4:: with SMTP id k203mr20537615wmk.49.1587897684680; 
 Sun, 26 Apr 2020 03:41:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 y10sm10491793wma.5.2020.04.26.03.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 03:41:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 5/7] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sun, 26 Apr 2020 12:41:13 +0200
Message-Id: <20200426104115.22630-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426104115.22630-1-peron.clem@gmail.com>
References: <20200426104115.22630-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

Extend the functionality of the driver to include support of 20 and
24 bits per sample.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 8ea08b49e7fe..277bf566c154 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1063,6 +1066,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1070,14 +1077,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.20.1

