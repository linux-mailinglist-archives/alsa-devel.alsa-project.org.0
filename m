Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B2786F6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 10:04:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5F9182D;
	Mon, 29 Jul 2019 10:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5F9182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564387443;
	bh=9iHmSLfegOZZ4GVmcY+ZHibvDZOzJbC6Iz+wml7I7n0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I7S2H6tZOLAv1DVg1Qo/KLJQaQf/DushLIv7UHMyJnTpIA71HiCb/ujJJSpl06h58
	 LP7irlkmBcShmPw+6yDPHBBlHlZ3y7e8bWb1He9f0An7Z6eVraAJnFAsfVbcUzmReN
	 agCKus3jqrGXjLQJz1G6LS1UMgIPZwCpd2fLFAI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A17F80483;
	Mon, 29 Jul 2019 10:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7D0F8048D; Mon, 29 Jul 2019 10:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C6A8F800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 10:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C6A8F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="MTNriKxV"
Received: by mail-wr1-x444.google.com with SMTP id 31so60750024wrm.1
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RA94ICutOEe48WXCPH8Kz/PFpg7/2L2e8y1Aso6Yrg=;
 b=MTNriKxVQBKmei1wel/XbIBlCJK8WQMMHKPY/R+8DD7Vq1DWOv1c1p03soQwYEWuC6
 wDN0boNiENDCEG/tur73v8PTxB5MHU/KgHEJeinhTsC9L48LMY3ptVFTd8HZGN1snVJ0
 RAC1JXik9zm4Vh32++d84mg93S4QM8lS6WWa3PwPZdotjTD+WkIVvv/hXI8UgpOQBAP4
 +HTO9KpM5XX5MF45h1ijxg8+W88UBododOIvtUYi2TpzHPigukzxN5NrrRY7mpf407YK
 0mNb1iNHOcsqp3NkSYIqlcgGRF+fexOs76a19uHu8BfxJWnq+iKWfAlCNmwO0+mmlmnt
 4FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RA94ICutOEe48WXCPH8Kz/PFpg7/2L2e8y1Aso6Yrg=;
 b=O0ctfriTyYZ1kkcHcjlWkxDoki8kiH8DEsCyWhQIJ5JaXMCf1BXpU0JdHxMrG2425K
 BHueeP1ul/XYzAJ6SACoV+FCm1U7UTHcmkK88rFepBceu/fyJyo1g5TMkJqz+h5NnqJj
 Cu0BKxcrrrk7WE7XYF8Tjv6JzrbFqwFGKgL09WBTOB3kNNqARQL1kHtoeW1TEemOaBRN
 nnXUGFfhbGtdhlivLxU5akTaJeXGxVPuyc4pnEfRvOpyfuOksp+BcRr6LwzvwoRPeeFv
 EU5CuohJEOcDwYg6ApEZgDNln2wVtuYflP54hSxv470PKTNgjpPs56xftP9J8G+pQ11M
 WMXQ==
X-Gm-Message-State: APjAAAWfhTFi2fU7/4JK41ej4Efh0yYRq5F8Q7P2e6dZqNjUATQIZjSc
 cd2u+nOkd7jUe8W2hmY9W/3XEw==
X-Google-Smtp-Source: APXvYqwADxrFEOUZ64tv0Wk/f+cSLqtMt/lXaNmVznyzUgfsI7zu68MZijDvv18qher7+QJCrrQplQ==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr16431382wrp.287.1564387334288; 
 Mon, 29 Jul 2019 01:02:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.googlemail.com with ESMTPSA id a2sm62043546wmj.9.2019.07.29.01.02.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 01:02:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Mon, 29 Jul 2019 10:01:39 +0200
Message-Id: <20190729080139.32068-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: g12a-tohdmitx: override
	codec2codec params
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

So far, forwarding the hw_params of the input to output relied on the
.hw_params() callback of the cpu side of the codec2codec link to be called
first. This is a bit weak.

Instead, override the stream params of the codec2codec to link to set it up
correctly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/g12a-tohdmitx.c | 34 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 707ccb192e4c..9943c807ec5d 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -28,7 +28,7 @@
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
 struct g12a_tohdmitx_input {
-	struct snd_pcm_hw_params params;
+	struct snd_soc_pcm_stream params;
 	unsigned int fmt;
 };
 
@@ -225,26 +225,17 @@ static int g12a_tohdmitx_input_hw_params(struct snd_pcm_substream *substream,
 {
 	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
 
-	/* Save the stream params for the downstream link */
-	memcpy(&data->params, params, sizeof(*params));
+	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
+	data->params.rate_min = params_rate(params);
+	data->params.rate_max = params_rate(params);
+	data->params.formats = 1 << params_format(params);
+	data->params.channels_min = params_channels(params);
+	data->params.channels_max = params_channels(params);
+	data->params.sig_bits = dai->driver->playback.sig_bits;
 
 	return 0;
 }
 
-static int g12a_tohdmitx_output_hw_params(struct snd_pcm_substream *substream,
-					  struct snd_pcm_hw_params *params,
-					  struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *in_data =
-		g12a_tohdmitx_get_input_data(dai->capture_widget);
-
-	if (!in_data)
-		return -ENODEV;
-
-	memcpy(params, &in_data->params, sizeof(*params));
-
-	return 0;
-}
 
 static int g12a_tohdmitx_input_set_fmt(struct snd_soc_dai *dai,
 				       unsigned int fmt)
@@ -266,6 +257,14 @@ static int g12a_tohdmitx_output_startup(struct snd_pcm_substream *substream,
 	if (!in_data)
 		return -ENODEV;
 
+	if (WARN_ON(!rtd->dai_link->params)) {
+		dev_warn(dai->dev, "codec2codec link expected\n");
+		return -EINVAL;
+	}
+
+	/* Replace link params with the input params */
+	rtd->dai_link->params = &in_data->params;
+
 	if (!in_data->fmt)
 		return 0;
 
@@ -278,7 +277,6 @@ static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
 };
 
 static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
-	.hw_params	= g12a_tohdmitx_output_hw_params,
 	.startup	= g12a_tohdmitx_output_startup,
 };
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
