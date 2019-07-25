Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DFC75514
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D3A1ED7;
	Thu, 25 Jul 2019 19:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D3A1ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564074349;
	bh=Wp3siBEAhpYT7yActjX/sX41QrL30YMJKsqzcrKAS3M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/vtnoaX4o1Y4XuA6zOIm2nXjfyA7iy4hsBMUfeHjI9yxTCVVkMaw+75p58+eNrtg
	 gUkXkN0kC8GaAQKotJtY0UuCcrM4CxNFFOuRQKxJNAWl1e2N/xWW1srFKchFEsrfWX
	 rBTUXMzms6d69M3YxHzVKEJctF6CqIFujLkfOcDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE10F80539;
	Thu, 25 Jul 2019 19:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4906EF8048F; Thu, 25 Jul 2019 19:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D73F8045F
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D73F8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="JHL5b6yj"
Received: by mail-wm1-x342.google.com with SMTP id v15so45663612wml.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbYdutAm45vnNpTOgncZbQOVHMX6IrCJM1Bp1BbX570=;
 b=JHL5b6yjq498WqGFuxUL/3bR4AEmuQubYpax4UgNdWtxexCUwcLOEgfLEK6IEeOV9j
 ZEQ/VPp/zAPPlSOpJ2P7cK/l0jbzfN93PS9DUEChu69bt2XEmoBULnR82eIPbgYt71dv
 9MVzSFF95J4xkl9e4ZrDs5TF6h1wxTdijRA/El6uPPOXG5PtDW22GgkqXaHKN7nmpWiy
 tNTYcx0HpmJWfDM8WY1uIfBpx6ANJt4h3QXSAJBMv6qu87JdtXBVvA7dgq0liy7XTGVc
 b6TRBWvAHXzIz76zWg5hhAg3zQ3fo6818Qrn6vkqSuW5T89PJJP3JH46GsppTjysOvBD
 b4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbYdutAm45vnNpTOgncZbQOVHMX6IrCJM1Bp1BbX570=;
 b=tP1bufLHK0nwhZqt/qPuY5I7DF4zxy5ZAwWUZNCFDM5nrG0rExrNUj4M+wS7wSUkNc
 JHr9JoT4hCSC/IrK9OTIhT6CXmjNys8u6CvB3izK7JLmiFH/nJU3Si4AF88pER1MhqK8
 OQgOMiWEy054fwY+N8XeknsG4Yuba2MGf+BpSq+wLhmTBJi89JjERH+Ee9pJljzHKZ+R
 rMdeB81cy1xo0uDFDXD6yr8RhiEa5K//OLyScdcjEH0Y9VV1pG4VZyUKPT0Id1tlXp/H
 aaj8v6/R4yrMZgL/zU5zk62V0MFjBmTxeHnTzDV0SFBdLHsBM2szZH83/albD4qLv62I
 3rLA==
X-Gm-Message-State: APjAAAUoGKZJBAAqKcMP5Bt8LqdgyYoHJAivowSReQ8fjBZSuaeYrZdC
 WirpNRlaJKAzBs1IzgMzx72liw==
X-Google-Smtp-Source: APXvYqyoB5DTPbPo8blqtf5tmVRdEJqQhC7XQYxzoSLPmCRuk3ksWFESivbnEbmeeLuvKYeRRNAl7g==
X-Received: by 2002:a1c:988a:: with SMTP id
 a132mr78758639wme.165.1564073998535; 
 Thu, 25 Jul 2019 09:59:58 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:49 +0200
Message-Id: <20190725165949.29699-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 6/6] ASoC: codec2codec: fill some of the
	runtime stream parameters
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

Set the information provided struct snd_soc_pcm_stream in the
struct snd_pcm_runtime of the codec to codec link.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3e3b81ae87dd..fadc804be89c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3872,6 +3872,11 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		dapm_update_dai_unlocked(substream, params, sink);
 	}
 
+	runtime->format = params_format(params);
+	runtime->subformat = params_subformat(params);
+	runtime->channels = params_channels(params);
+	runtime->rate = params_rate(params);
+
 out:
 	if (ret < 0)
 		kfree(runtime);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
