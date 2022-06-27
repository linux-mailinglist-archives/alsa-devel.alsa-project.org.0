Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584EA55BA5F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF47915C3;
	Mon, 27 Jun 2022 16:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF47915C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656339611;
	bh=WmeDp8AjUqBi7MbsbkPUf3eU/MKrNivBTQ86+KSAg9k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oEFNrLdwrNEi9rHqKJaMRAHDwmh/xfk30U6bTpZ33jyg1p59A9XyBOv4OJ7tFwdA4
	 mDXSoDy/n0Ss4iQt6RDCz9sKU8L4L10s8ZsEzddht9td3qKb2u5MIliqlTk+6iBg7X
	 ONlPjo2952CCNntLLwXVv0MeZWmAcz82w7CVFK/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CACF8028D;
	Mon, 27 Jun 2022 16:19:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA29DF8028B; Mon, 27 Jun 2022 16:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9B6BF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B6BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xFR4kWDP"
Received: by mail-wr1-x42e.google.com with SMTP id d17so7660019wrc.10
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etbyC6+DcjuUYPYEggX53K5pNY+3Oq3KA+YfrpJk3l0=;
 b=xFR4kWDPyiw6BBcuKsZN9XPw30MhlmzCP7Dx7I9hj6EPes9x0Frv1pyCzN/vNpIZB3
 AJTwYUKUKTvULghGgqyFKKeDbSj21OaSafAP1VJ4+dh4KopA5XaBSY9Z8KYs5lur+8MQ
 AGQmp/19c58xwDaH6j+abpT8/q9EWgTefiWPQCRY9VljoqQpdH9dTmEXMlSoZvgQPIEq
 2D/BK4SCSox+Ci0E4uoqdN5Z36BUPsfqN1dlyIvwLg4vY5Ak1/ROun3eQIsOy6gIvzFV
 +WHhcJvAgPND7/iVJdguMtWtu6qaMHgdG1kK0TSpMjvBVEIumHW/b9fl1vSFcQt51BoR
 o4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etbyC6+DcjuUYPYEggX53K5pNY+3Oq3KA+YfrpJk3l0=;
 b=bW+nGnVFYzQGX/6lsg5wCJGDbuj9dtter3+xoGuOHezoNl7oTw/WZfq2sT05N1khnL
 wnlBqcUh4eqy4jrGnfRENwlhIsYpmcbI0RkdZ6PVEbCm3FtIjXGayziZbcAQWmKUv4l0
 YtyyfPIEi3/BrAHidv4mk8R19Cc9QUg7pHhKfD8KvQCDJUmhiSfBmdd6qcjA7Iojd3Yr
 TAKttAZQ0D4qfYkFEvEAcas62FDUFtAww7OuVYIaAxzFEWwK2ahvpq6h6+k9N/nugumP
 bj/jp7fRg4tzt5OpRByVXmMrO3iYoc/92DUeqxgOTT0ZR5VEpWAty2imn923Lc8ECbHq
 awSg==
X-Gm-Message-State: AJIora+w8hkN/EoOql/TqPvYQOuHhefenue4EPxhFDHWpMBZ1XwaRMKL
 +DazdN6riEaA5Pnu1uUeq081Mg==
X-Google-Smtp-Source: AGRyM1vaYtefBK9d+YZR3or0A5F0tEaouPxAFBusj6zsA6PDz2Hem6+/ZHpDHTfTMQMRdd1A+A0lYQ==
X-Received: by 2002:a5d:568b:0:b0:21b:995c:eb4e with SMTP id
 f11-20020a5d568b000000b0021b995ceb4emr12762633wrv.325.1656339543211; 
 Mon, 27 Jun 2022 07:19:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003974a00697esm18944196wmq.38.2022.06.27.07.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:19:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: h1940_uda1380: include proepr GPIO consumer
 header
Date: Mon, 27 Jun 2022 16:19:00 +0200
Message-Id: <20220627141900.470469-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

h1940_uda1380 uses gpiod*/GPIOD* so it should include GPIO consumer
header.

Fixes: 9666e27f90b9 ("ASoC: samsung: h1940: turn into platform driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/h1940_uda1380.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index 907266aee839..fa45a54ab18f 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -8,7 +8,7 @@
 // Based on version from Arnaud Patard <arnaud.patard@rtp-net.org>
 
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 
 #include <sound/soc.h>
-- 
2.34.1

