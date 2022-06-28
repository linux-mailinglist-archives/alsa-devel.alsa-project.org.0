Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446355C01A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 12:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2FE844;
	Tue, 28 Jun 2022 12:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2FE844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656411229;
	bh=MKtu2Nuq3KWda5jwxjwaBoLOtaZiIXTFOIRJWpS7Ozo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E8Uqn31H3XOFvQ7ww/a6INpQ5cJiIwkCx3xZRhXHKQiG09BhjbXpRQBOTVz8oy1xx
	 pczIJWxJCDYM4/PJ3Ey+ZVcLr3hZ/IGy8PaxYsdZ691F/jiw6UYo0iuCvN/l7he5hV
	 HrC4rWkhtUXNwf8/WcI1UIQzFYX6fL3MLt2XNYfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C689F8025B;
	Tue, 28 Jun 2022 12:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B32F7F80167; Tue, 28 Jun 2022 12:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C356F80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 12:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C356F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e0z+uzEQ"
Received: by mail-wr1-x434.google.com with SMTP id k22so16937724wrd.6
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTu9XAWen9WoHj1yR5c7Lkpd0pwfwXCy8JkwcyJEXh0=;
 b=e0z+uzEQ0z82O34jFflF1Z/uP+hlboiW2wesXrgX9LNyU6j72yAqAdIdmruyVWKMJj
 45Ez3pLouqJILdv43Jn3QKmhjJ6MlT50n5JqEogop+2q+WveBB2lhwBpuF9E2Rgh+Izs
 oHZBiitOm6aK9vUzh2rVwmpocxE0NyUoKfDrfJFmBNd02pHD00VQNFvREjitCg1Z07F5
 iIGUSDdnihSCUANGK5UDEDsKx44E97geIPm6C0gYrr8gAYQ7zILoigM6oT34GKlQcEjP
 /Ap0cDYMm1/+1l3eNZqlS82PcLRzXm1M7Kl5C6KLADYVJuTKtO0WjCoOm/blbXmIt9pk
 fpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTu9XAWen9WoHj1yR5c7Lkpd0pwfwXCy8JkwcyJEXh0=;
 b=jEA8aZYmT1TiNUtdB8KG9eghS2MgxaKnGKt916/2ijIxtjOHt7QAF+D64Tk0slCPQv
 1zcgf66JK/dUDK85UjqhS7+Nxk5wEBQ1U8E3Gb1+hpwxhyvBbMuTvqb2PINuhE55Vujh
 vFqsmTw83uDOBK2e9MLi9L7/UDGzTJulLn54zfWQ6oLsEQ93mbFgDfQlENydIQeOjGzn
 QshPtt5fC1bPi4GeMOZJwJ3MQdm4C+i90C1WYzf5v/IfWhxxoMgLk91EIB3jo+SxPtIA
 t+b8Jqv5oKltMONnLFdHdmfR04BTeZqqcCotgU6tyRau5OUXTHZihulOmWHooEK1hsYQ
 nhyQ==
X-Gm-Message-State: AJIora9qubgM2lEz7a/zu0Mi1cosJUF/P7r26iCHTP+oYFH/+6GoEiQU
 GcUDMyaPLp/IRhOeKRVPsZF97g==
X-Google-Smtp-Source: AGRyM1uRGv3iuoKnkhxHQdrR1+LULm1cUgtzHMR1gwCAnsz0PMgjk8VPkm4JlKAXFvl+kgHQ/kzUzA==
X-Received: by 2002:a05:6000:1786:b0:21d:2180:1839 with SMTP id
 e6-20020a056000178600b0021d21801839mr1043810wrg.596.1656411160443; 
 Tue, 28 Jun 2022 03:12:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d6b8c000000b0020c5253d8fcsm15750078wrx.72.2022.06.28.03.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:12:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: samsung: h1940_uda1380: Include proper GPIO consumer
 header
Date: Tue, 28 Jun 2022 12:12:34 +0200
Message-Id: <20220628101234.34765-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1:
1. Fix typo in commit subject.
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

