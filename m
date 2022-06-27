Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33555BA88
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07E71699;
	Mon, 27 Jun 2022 16:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07E71699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656340538;
	bh=BgtpkStqR9PVXGg42VLMj9qORkrXdeVEfLpfd1TMmHo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sALxgWWzzIwnF/+uRIOErpibHRTSGkg1ahlIXj2uisBY3Uox2+Dc8gMsRF+DTITRx
	 Hp+shsRRaZ91e4VTyhexcq8ZumrDGPTWxdEVO1nOIcdrESR/lnEYQtme8k+LhPjf2y
	 RvOLymKWqwAFeViNoEItu7d4QJhLC3YqG2zTJADo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363A0F800E9;
	Mon, 27 Jun 2022 16:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0E5F8028D; Mon, 27 Jun 2022 16:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 422FDF800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422FDF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T/5ehi/+"
Received: by mail-wr1-x42e.google.com with SMTP id w17so13352450wrg.7
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RulnywGDRCN4Up1alBesmQISI/vXS+eDPdIZtvq/DHE=;
 b=T/5ehi/+YQa6nBm0drA1PW1R6m5Oo11fA/Ze5NurtYii6uKm8f9uLM5U0/INzxSlDZ
 Ts40K4Ha+eRjzpRJNfX9zIPHYv856PbSw4/aqvJpf8fY3Ror7+XnVhOO7pWQhd9du6BO
 kR7qwiNons3UzV6/NS+XvePSlOCBkyr5TYc5e48e1JLOFmeejyczJHqQlTw0RKlf87Ou
 NqgRziypXltJJqZ8yFg76wt/faQHLusNBPt1U9GrUrlrWXqEGYBktEzirD5lnl8p5sSb
 bw93L98AaoVoYIVxo0YDsOWC+79yhl8pEmIDY5WvMjnwdueBK/Yg2l3cjXQvhua/AfUC
 Fj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RulnywGDRCN4Up1alBesmQISI/vXS+eDPdIZtvq/DHE=;
 b=b3IIHKVqOh6pk9dGxvaKRWg0Zklsg/YWp76ao9Ny09L4v64uyNOUgC2DIqueWdGKLQ
 pgW9988H/02QB8UdLFwYvTsKEhMJJkFxG0ukRTzBPYbzA4SkPWEE7h4LRVRa7xv8vnlx
 55+mpA0P6SQAvixKpi+kngK1hUdrAdcvhondFIaRu9n+/xT1woushbSQTKEcrvgp4Vof
 myEcPupLKLKYxGu38KcUPDcpUtwblENrVgKyUbsw9LaHhoLk1BJutdXhJvPsc7g9+7uR
 68GQkmx98eOTyL7IrYxsmM7adGlmdIs6hbP8A9PQqPyu0AN+Okm/iLtmjHUZCNCINTrW
 uyjg==
X-Gm-Message-State: AJIora8V5NOE6YnSvb/mFpZMDkyHrczaqG/yg52hlw3+JpQdu0IiEjqq
 RKhaWX4LSkVhDVvPfzgiyUizMg==
X-Google-Smtp-Source: AGRyM1vPwQLpT1whbo/vMPp0t4ykErcdUKzGyeUSBtjebvJh9JnkbgixAK4/Q/LwHWbjIB/vcN8KwA==
X-Received: by 2002:adf:dc51:0:b0:21b:a045:9730 with SMTP id
 m17-20020adfdc51000000b0021ba0459730mr13008944wrj.134.1656340473269; 
 Mon, 27 Jun 2022 07:34:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b0021a39f5ba3bsm10662853wrw.7.2022.06.27.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:34:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: samsung: s3c24xx-i2s: Drop unneeded gpio.h include
Date: Mon, 27 Jun 2022 16:34:11 +0200
Message-Id: <20220627143412.477226-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627143412.477226-1-krzysztof.kozlowski@linaro.org>
References: <20220627143412.477226-1-krzysztof.kozlowski@linaro.org>
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

The module does not use anything from gpio.h header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/s3c24xx-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index c1a314b86b15..44e93dc16fc3 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include <sound/soc.h>
-- 
2.34.1

