Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E570155BA8A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4088E1678;
	Mon, 27 Jun 2022 16:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4088E1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656340582;
	bh=dYsqsIIK2caBm9IYyiRgUaD+Pttd2IRgivdiGi/W5/c=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GXt180EIcq15amtReirGj7oh6ZMqH9usv9GaOdHRVNgLa1nwvjLnOVzoFxDQDfMpg
	 mA2xstiel+q5d6DM5DBRmitwew+CG1QjPaGUu8qxML/7otMJDciwx85ah55vcvyqnW
	 fs+sNb9UDGcB+Ey01e6WSZosUg1DZ+4/AZDaotOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB16F80537;
	Mon, 27 Jun 2022 16:34:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9945BF804FC; Mon, 27 Jun 2022 16:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 012E9F8012F
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 012E9F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vRhaRSdG"
Received: by mail-wr1-x42d.google.com with SMTP id o16so13377428wra.4
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xHFZz8RZkVB6QrSDdCB+Dgt2NiSqLKXwv65gqyA505k=;
 b=vRhaRSdGeHb3qNVgG98bODYQGIV5R8Xntd1otqLzy9xvwjDNXNc4ycsq4AiYSvNrUx
 RPNT/s++mVAUF/bVaavfPrs8sy123BK+8RvtnkVaEXv1AAumF9j6TTyYP1k26A0EuRs+
 eOY+IdGjdkyvYBXdhuSh/7ZOmCMzUszaIV/W66PpYFVVKvdTnJX9/5MrsGXSslaXlhBH
 ABNGZdDMQa8bGqgi1tu+DCCrDN+EsJpo+JBwkCEaX4NhPWC6HnH1Ysu58rN22VTNYHXE
 w73JVJh1NUVGL9AA0DGuaQ9jVi7ukJ+hMJQcG+kn1ttzgAUYj9+IOU9vNh7zpQDf0bpt
 1AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xHFZz8RZkVB6QrSDdCB+Dgt2NiSqLKXwv65gqyA505k=;
 b=RMWmOIMzgT5jJsvc/rsgnQpSU9I4iwuGmchsBwcESd2qbXLmZspUQNzi6UHiZwc9VL
 plOekGdzK/OQBMIn4qP7XVcsG1juS63uxveR6Ybc2wzMSOdJVKHitg+En0MrL7LZ4ZKS
 E5wVUuOqBsh72sldkymRbIto211tAJpWdoaHLTAzwHqtNWZdheWk+tuILltsNKP0FZk1
 QLnR1JTwP18EmLVF1MBAvBThIPUIOGbBARWFGjy4BFSckhK/O2s2dmZ132knkjLy7Bme
 XCg8QLA16KwU7xxwntDzX2+CZTjGQtetwp0FU9JleONI0LxbQayzEhDDhMtLCDFbmaKH
 ZnJw==
X-Gm-Message-State: AJIora8CfW6Nx1ASeDVaVFgg5ExCnL65MsbmAn0xDN31yz+RsefcyFEy
 HklFYUE3daqxpWFQ0WeGgAHgfg==
X-Google-Smtp-Source: AGRyM1vePo96avYvzN+/VbfXPpJbfFzcJOWYoI90juxd+OLG/WT4wbBA6NER5THHL9r98g5G23tATQ==
X-Received: by 2002:adf:e182:0:b0:21b:92c8:b045 with SMTP id
 az2-20020adfe182000000b0021b92c8b045mr12577551wrb.219.1656340472265; 
 Mon, 27 Jun 2022 07:34:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b0021a39f5ba3bsm10662853wrw.7.2022.06.27.07.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:34:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: samsung: s3c-i2s-v2: Allow build for unsupported
 hardware
Date: Mon, 27 Jun 2022 16:34:10 +0200
Message-Id: <20220627143412.477226-1-krzysztof.kozlowski@linaro.org>
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

There is no particular need to restrict building of S3C I2S driver to
supported platforms within the C unit, because Kconfig does it.
Removing such restricting #ifdef from s3c-i2s-v2 allows compile testing
it on other platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/s3c-i2s-v2.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 1bec72246ed0..2b221cb0ed03 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -21,17 +21,6 @@
 #include "regs-i2s-v2.h"
 #include "s3c-i2s-v2.h"
 
-#undef S3C_IIS_V2_SUPPORTED
-
-#if defined(CONFIG_CPU_S3C2412) \
-	|| defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_CPU_S5PV210)
-#define S3C_IIS_V2_SUPPORTED
-#endif
-
-#ifndef S3C_IIS_V2_SUPPORTED
-#error Unsupported CPU model
-#endif
-
 #define S3C2412_I2S_DEBUG_CON 0
 
 static inline struct s3c_i2sv2_info *to_info(struct snd_soc_dai *cpu_dai)
-- 
2.34.1

