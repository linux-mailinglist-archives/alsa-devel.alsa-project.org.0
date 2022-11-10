Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919262435A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09482166C;
	Thu, 10 Nov 2022 14:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09482166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668087393;
	bh=8PUONxWAjFpmb83TNdl7hLR0baapSlS5jaZvaSDjkSE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXeH5NbXI/lDou7rr5GEYARGcH/0PLTd+YoFUYuoCQVZE0RXVtrVsTng3rffpPByl
	 w23+N5Ms/OiLZ8/Nas9MCLspl1b4aUby7csGVOqgPJY9sldjtJpambR2JEQndnkOlU
	 FLSo4U17pIFtDbBf4JRHPTEkTt1xA01hWjEUgFzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7125AF802E8;
	Thu, 10 Nov 2022 14:35:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97800F802E8; Thu, 10 Nov 2022 14:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47C29F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C29F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aHLYA+6x"
Received: by mail-lj1-x22e.google.com with SMTP id h12so1163990ljg.9
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVYq2N7Rct5i92MPe3IgInkaL5zJNoRo/Ju3+MkjpVM=;
 b=aHLYA+6xo0R01ED2csKLZEyU5drBe0n7gYOHCzxbSi5EqgfZxi2pGxMv+sefXP/L0j
 VmuRoM+0PKVqaomTrPcj5wBVGNtAhukRrEvIpS1E321pynM+zGJ6ASHPX2KFg4bag4EU
 ZzE5sZhB7nJaITsz/ddH8ZuAffQp+u4e/jUQVIte4af8F7SOPf8UH7WA/LRh6zcBV7Vr
 AXxzq8/CbX14HV3L/Q9XmJtNY/LeHFNVAVImJMEKVfOH9vs/k6T6pT9wZtN9MQBmbpFw
 66Pquh1lhM1B7Mp0hnscP1TrRIUobtEoUhbcoRhrFKw+MtrDynZmTir+qqjbvuv+Yx0x
 xPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVYq2N7Rct5i92MPe3IgInkaL5zJNoRo/Ju3+MkjpVM=;
 b=rNXXBJSlgXDgbt7xjD9bsUtrw6zn9IU+g597ea3ZoF/9cOIJiJTPGtH0hzEs1MBvz+
 LHgwtolBNTSCtbQ3BMAS2+9+ppSQG5rTIqxbUPjhKvMFBpqK7ssCE9/GCNYvYEkGHh/n
 2L2A2MdKVlCbGr6MjW1O20sReYZi6kzy9RxpLo1bWJmuLS6ppq5I9Fsw6bWRzzXP8l/z
 cNPdH5XR1Ka5gVQtXntmVCizTuRNDg4RHi+c6Zlf/njmi6tU+6p/2ng+7Y0OoPXTEX8t
 pfrq4etEPUOkqouNBk5z80Op8pMlbpHl5jqe/Af6Iy5UaXP+GWRDbWK6u4/cwlbY0R+Z
 PqfA==
X-Gm-Message-State: ACrzQf2rkWBCv4FsY3fPnm62lzkPbkipP4jQGLF9fg/lF2Svf1vn4Kbg
 mx5BXCdmOOXU0QBF8AyAzOc64A==
X-Google-Smtp-Source: AMsMyM5uuuy6vzbm6Wss8li0CVLMJd7xDK+0FdYwv7VWxMESFwlGkAuH/yOIdWdL1vP4Kcok92FBvg==
X-Received: by 2002:a2e:8602:0:b0:277:2217:c7e1 with SMTP id
 a2-20020a2e8602000000b002772217c7e1mr8784168lji.407.1668087327523; 
 Thu, 10 Nov 2022 05:35:27 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a0565123a8e00b004ad5f5c2b28sm2752576lfu.119.2022.11.10.05.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:35:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: codecs: wsa883x: Use proper shutdown GPIO
 polarity
Date: Thu, 10 Nov 2022 14:35:12 +0100
Message-Id: <20221110133512.478831-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
References: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

The shutdown GPIO is active low (SD_N), but this depends on actual board
layout.  Linux drivers should only care about logical state, where high
(1) means shutdown and low (0) means do not shutdown.

Invert the GPIO to match logical value.

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index c7b10bbfba7e..77a7dd3cf495 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1392,7 +1392,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	}
 
 	wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa883x->sd_n)) {
 		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
 		ret = PTR_ERR(wsa883x->sd_n);
@@ -1411,7 +1411,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 1);
+	gpiod_direction_output(wsa883x->sd_n, 0);
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-- 
2.34.1

