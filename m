Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7833751
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:54:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61467165D;
	Mon,  3 Jun 2019 19:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61467165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584494;
	bh=uLPVt3l3AMDC1TYqrY9v9/8/JP71iZlwFj8/88Hoscc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJnLFgfnWZq803U/VKxZdE0l1NO7g/Ye84YK6ua7YIgY+1sE42xJq/ROfiruK5QL8
	 bWD1Zy+wjhZtTpaWaRWbr84bQhVSQ/cAEbx5/88ZLDCrkmkQU+KNcGOGdoS+SHWnEx
	 rRHhGPPfmV2OK39k68CcqkhQQwmv4d5yTeFInsIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A3CAF8975B;
	Mon,  3 Jun 2019 19:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFC0EF89737; Mon,  3 Jun 2019 19:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8862F89734
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8862F89734
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tRrvNk6M"
Received: by mail-lj1-x241.google.com with SMTP id h11so17110876ljb.2
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UmXLhP5CJRrYV/5kmZm3yYVzKnOFlBpoufzcvuG2Euo=;
 b=tRrvNk6MFq/My4QxrLzqARQ0X1xkdCvmj8lkNgEnodNP7Gf3AFQedvHDN8fyOYXFJM
 BjfZ5XKO5THgjPjipBepg7PsO6r+ZStwGCbDK+jDtOBj9cCljJ3xsQUvSr41KeIPLbuw
 lqpSRQm5Ibjn1gy8cNTJKadutrT57tIKtQepI+iPMF7YIPMOTec4YlEadeHM7FMfruif
 0xYMMaMmIK7PRhP/9UflbGqIaVv/htspVrOfI5E+juoUoXWdWwXfMQbCm29HAdn6rcqn
 hETDjMFmrvQmogX/UDjjW0IEB05Wh+TBuIBU2G98qonbhezWK8UmqMnINB879nL/JJlk
 S0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UmXLhP5CJRrYV/5kmZm3yYVzKnOFlBpoufzcvuG2Euo=;
 b=m+D8aQF5YyYXP35kYsiZuquPuZQNEHDEnIh8bBkS5YilLeBTeo2jtIl7PM/1GNMAxc
 WKiVcccKn9BvV/n+YcjpFcDpFdyvawnrUYJhwITRm/lRbaSPGDJ2OV1tUZ09W1AuBpJ/
 QHE9KX5P+OXpKx6PFY76URGy+Z9lf1o2fWZFcCm9QafhCFJITRSaRpJPKtMpPzycWMfC
 8xdPmJRmt3c79J77UCBxjptV+KneBTjEC/GxD6aPJzuM64anY01aoHGtXLGBctkZIPXq
 VlTcl4IQsTGTvTl4oOz4YeX3iKpmWdUX+pw8yu1OGyoEIMUzLS7LchHY7yuqNLc0TohP
 AN0Q==
X-Gm-Message-State: APjAAAW8Q3iXSJlaMds/uJzum2SMWubiGHEKQNUivDdjPYAyZZkJlQJi
 6J3PsNUU1pPHMDuhaCzEPFo=
X-Google-Smtp-Source: APXvYqxRcqPyv/G7uNPKQjW1747BjlGIhlaYcNVX/PqzipfY8FB6b8yvpMVVbeosO930GIJ+VYxDlA==
X-Received: by 2002:a2e:6313:: with SMTP id x19mr5272697ljb.25.1559584065657; 
 Mon, 03 Jun 2019 10:47:45 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:45 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:34 +0200
Message-Id: <20190603174735.21002-9-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 8/9] ASoc: sun4i-i2s: Add 20,
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
 sound/soc/sunxi/sun4i-i2s.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3549a87ed9e9..351b8021173b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -428,6 +428,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -440,7 +445,18 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		sr = 0;
 		wss = 0;
 		break;
-
+	case 20:
+		sr = 1;
+		wss = 1;
+		break;
+	case 24:
+		sr = 2;
+		wss = 2;
+		break;
+	case 32:
+		sr = 4;
+		wss = 4;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported sample width: %d\n",
 			params_width(params));
@@ -722,6 +738,13 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
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
@@ -729,14 +752,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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
@@ -1161,6 +1184,11 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	if (i2s->variant->is_h3_i2s_based) {
+		soc_dai->playback.formats = SUN8I_FORMATS;
+		soc_dai->capture.formats = SUN8I_FORMATS;
+	}
+
 	if (!of_property_read_u32(pdev->dev.of_node,
 				  "allwinner,playback-channels", &val)) {
 		if (val >= 2 && val <= 8)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
