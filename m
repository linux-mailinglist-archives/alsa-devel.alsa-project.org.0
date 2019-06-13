Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C749E435A6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618621809;
	Thu, 13 Jun 2019 13:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618621809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426358;
	bh=JsIqOkJnOwElWgA2p/GLjh8jvLIQcSguXp+CkrCskAo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0sCNcxb09Twj3gbnUUg2voi79LoIn3N9FnoGeS5WsBXRgmnFuMyW0r610PoNPttv
	 Y+6YzeZulNXuuYltdx9YVPZdSrfcsZYhmXXE3B1OGGX0cyljuS5RVzqDzq3C8C7nNu
	 oA48rGdkoyBehGYwHsm6j+Lexa11VLD8zBV+oO1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CACA7F89734;
	Thu, 13 Jun 2019 13:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5075F89711; Thu, 13 Jun 2019 13:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF4C6F89703
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4C6F89703
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="aIGGQGLj"
Received: by mail-wm1-x342.google.com with SMTP id u8so9778963wmm.1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxfr2UqrJP7k7q7uBFspyYkIYB+P3tVp1PAw4xsHiNQ=;
 b=aIGGQGLj/J0XH6peWf/aEST4UK1CqwMrpUkQjobNWMtvBILe/l8TNhNg5Gzc41WnWL
 F4hhER2TzHu8OTkgAHyLHRi0LjDuY1KEpg2IqFxv/igN0L1QST+UPKkVOO+GzkHAd7sn
 e1cBnlrPNcVUOmgYhgm4ADGOlRHXukuC1YbQPIpd5si/3/GpQxqW8/lzKwooILMTP1gg
 Snh1Fa/jMuc54U8S27WXRam9qRpA8iIkVHWWGd00/2fyhA/4yJRJZ6wH7dcwSbw3b/PW
 QWEv9MpalZosI8UghJPlwZeX5KAmerfAuTq5rFurUSeyS/aRtX2aztvMj6zTHq/9r25V
 q4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxfr2UqrJP7k7q7uBFspyYkIYB+P3tVp1PAw4xsHiNQ=;
 b=ZqsVf7Qr7IKFHYP19mdPxwZx80gKrTvhOQBqp+6QbKF/Hz33kufpdleLeAxyamLunu
 PFFh/atYvdP0AL9P7yG1dKtAMRGMYPd78nMVKTnGff0T7PH2K69ZaW29yiW+uxFQ/L9b
 GLTlV9aumvOg852FG/0W9y/cjJWR3coFYzThTmJGQXvKosKKSlI/iRPadbvD2vwCuh6J
 ZdUi1ulcK4GeB8mtYtEJzYdWZ6R/26N6pGxfBZC7lfEvPrKQJkFIH1FJs1g9MLiweAGR
 IfB9Xv/RNb15NQK78LkBTI6ORGYyIXUpcoLh6Px2QbNEVbMqnLUO09LXJu8+Yd2QZE32
 1Ruw==
X-Gm-Message-State: APjAAAUc4cBZ8WYft6o387sNz1uXVNgqGd+0tqY1MVBBQg4vBf4skQnR
 gVRnhohCUMWHnHUk1Rwq9hO6yg==
X-Google-Smtp-Source: APXvYqw3l8gXPruJhWBk60j/WsaoYnaNmb1Oiya7p9axR4/l3hNwB1waenTIOkkffv+68dM5m29SWw==
X-Received: by 2002:a1c:4956:: with SMTP id w83mr3327094wma.67.1560426161191; 
 Thu, 13 Jun 2019 04:42:41 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 13 Jun 2019 13:42:31 +0200
Message-Id: <20190613114233.21130-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: meson: axg-tdmout: right_j is not
	supported
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

Right justified format is actually not supported by the amlogic tdm output
encoder.

Fixes: c41c2a355b86 ("ASoC: meson: add tdm output driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmout.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 527bfc4487e0..86537fc0ecb5 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -137,7 +137,6 @@ static int axg_tdmout_prepare(struct regmap *map,
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
 		skew += 1;
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
