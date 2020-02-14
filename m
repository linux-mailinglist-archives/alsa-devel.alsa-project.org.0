Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163315D842
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1528166E;
	Fri, 14 Feb 2020 14:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1528166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686330;
	bh=NhB1e7ZhpR7NNzB8Rp8AtTSurdPpnDzuJhYjTGRTRiI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ycm6kD29RPYVNAKi+EnZrW+dQAMbMNVduCujVlHt5FOZO/PxmQaVvtlA8v3g6YDrc
	 7rz6zYBE6wEDJggxMfHYlhO3h4V3fdL3b0LbRnB4k15iouOavmxz9wYexZgScTNlvQ
	 nzs4RLrER6DVRXS15riQ38bj387y5Yx791Z5e1Ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD310F8029B;
	Fri, 14 Feb 2020 14:14:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A45C5F8028B; Fri, 14 Feb 2020 14:14:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3499DF80228
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3499DF80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="CGm10tVl"
Received: by mail-wm1-x342.google.com with SMTP id s10so9915779wmh.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i72FvbEWLa3zDSTR6a7Xw5ZV70drp4oYObx4m5ZAKZw=;
 b=CGm10tVlypJ+HwiqhcWlQuWRUF0hlJcMq8xVEJ/eDxvmAEJlr2zYS4wpbPjcqL+U93
 IhxLuUYVG+v8BsfHZZcmwHPgSKW3F1HmDtVGCG+xnCaht38WxONG0t4dR9tdd7byyR17
 idJtcPQU6ggpfUipTMm8XhXRfGt63U7vymlcpzZ+mWw1XOmcUqqCj3QjmUjeFxoMCa9p
 vFo3+ZbDa/KqK5nsz2gi6H171NGwxr6GSIBNX3lJUicDseGgghPJUkbtw0b/4wl7WvYp
 +LpnDDehRSkXeApfKWk6+WBIxPM8oXcB1uc0NJqotUalwHIaV7UDpcf+UJ3rL6IIFuDO
 i5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i72FvbEWLa3zDSTR6a7Xw5ZV70drp4oYObx4m5ZAKZw=;
 b=ddO3JLfb8p+npVRGCkPxnCpvlwvpl6cS8XQC7IQfZL9O0q//Ngmn4JwX/PJdpexrpn
 rO1UyqoCrmy9qCzwWYpDwTBSYwiq6mDnhv1FwyZI6zl2jB1DKeuTw285VmslzZ4RGGqa
 W+rhF+4ATBmVTOGjzzuBIMr7/vrzEw4ylqik7sgKZTUQqeq8U44IMi6UfujYxrkiol4c
 TWq7QOlpyOPXidVftGBv54BQi4Ci/Cl4s2WKfuzuVPGdvFIAXL7P0lMQ+u5fLzmv3UCi
 buIWARWzfkS6w0C547bwW1dQ6bYNDN4fxntbAR2U+IyDe1P/9WT1uE+fkAFfbe1e9NRd
 evAA==
X-Gm-Message-State: APjAAAU7tpfrR8l8tmh48p+Mvww7Alvy49agn/hieoHAIdo991zgstCn
 be47RObbUdgkTunQaS5CJdYrfg==
X-Google-Smtp-Source: APXvYqzUVheOHVBk+bnulr6p/1Aot7pY9Y1/9GteYZ9lCoDqBaU0C2n0XPV3QxsnBugGDKHbDB89JA==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr4621941wmi.58.1581686040170; 
 Fri, 14 Feb 2020 05:14:00 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:13:50 +0100
Message-Id: <20200214131350.337968-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/5] ASoC: meson: codec-glue: fix pcm format
	cast warning
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

Clarify the cast of snd_pcm_format_t and fix the sparse warning:
restricted snd_pcm_format_t degrades to integer

Fixes: 9c29fd9bdf92 ("ASoC: meson: g12a: extract codec-to-codec utils")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-codec-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 97bbc967e176..524a33472337 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -74,7 +74,7 @@ int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
 	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
 	data->params.rate_min = params_rate(params);
 	data->params.rate_max = params_rate(params);
-	data->params.formats = 1 << params_format(params);
+	data->params.formats = 1ULL << (__force int) params_format(params);
 	data->params.channels_min = params_channels(params);
 	data->params.channels_max = params_channels(params);
 	data->params.sig_bits = dai->driver->playback.sig_bits;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
