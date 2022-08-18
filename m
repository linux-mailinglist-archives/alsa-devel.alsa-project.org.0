Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AD5984A6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07011679;
	Thu, 18 Aug 2022 15:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07011679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830563;
	bh=FT7z4vQhnnbi9lZl7kcqAX+BfydEMOzPXHKASp6uZNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My1pZ9a/3cdFrfL9Hd1Vxeuif4HLq45KL5GM5IZ7vZQOMZJK+bvMrElI8TJKgWhzw
	 QNujIfDQ/TakEslPmRshq9IkpHoqrC2+IPlpkCHtgsglQ4gJqtZgR5g2n+QqNvARfx
	 +eB12bCh4ou5We7jo/KO63E+JpTOAEAnC4zhZdqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AF6F80551;
	Thu, 18 Aug 2022 15:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D02F80557; Thu, 18 Aug 2022 15:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0460EF8013D
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0460EF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FRPtHFtE"
Received: by mail-wr1-x432.google.com with SMTP id bs25so1812892wrb.2
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pm1xUFE92YkVKDTJvx9M7ZRTfenlhIEpPrzTXw0dBmU=;
 b=FRPtHFtEQMFDYkm9zWB+sRZd4LDzYcg9DTqbKkGNU0b4auFyL0kIkekOHeFJJun8sF
 RFhcYKOoH8gJv+QYGWJftcKr1q4UdWYZz9Nldm6E3/diLsDc08FI53gZkmuJPvHYz9/Y
 K5bktp6W3JdaEua4zRBff7rPdsvNftE7SZKhE94oEXcU9s2H9fGmq3qG60XPXrf6YZC7
 JoRwt1jN7mgv4J5P1etit3Ako+lHsXJBfp9ePuehwam0+CpBpJJ9FTLbjszdVIu/cEY0
 xVPfusFo079QyvKAOSQDi5vpEqj1Nw7p+gx9I/oSPPaSK6zRPMDF+Zq2WzK0G5UBLCOj
 0zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pm1xUFE92YkVKDTJvx9M7ZRTfenlhIEpPrzTXw0dBmU=;
 b=ibIDWxJJax1R12mtFbYmalPw0R+OrMARv5ADDNLiG2rrTAGt748gzPdflZ613yYMdt
 jII6r1SweR9ce/98vnMnnrtHhfdYH4TyR7hoYBKRKfSbYnsjqptU8Z+xmtEbiTs+pceI
 grJgEbvhLwNm0sJ7iZq2OTVu7Q5vdFLqc4NBTCKN+scZhYu6b+JPeoG5mL840CZXhDH0
 wIeA/P4QdYaVm6iFxcLGD/2rOYYSBeI0d5ZsFpuHC8Q/5sb7AkLCvJLyo32ovP0cdPJY
 hZ/qJQLzJewDJGTtaQPL5xkKe3lVjw7bKZL1+m5wOLH+5aIeqf31w8YfIVZ84TZxpmDy
 7/gg==
X-Gm-Message-State: ACgBeo3jAA9VL7yKs0nGRw45+h9aCqVhYlKUqKDsIWJJ3JKo0fR1aB1c
 UhzQfAztw4AB7h091oR6M1cCDQ==
X-Google-Smtp-Source: AA6agR7FKPqQnWzhAQx/K94hRrogeUHNRn696ul+WTtCZ12rYD4X5lPuuDq6bj4Kl+K6uGsGVef2uw==
X-Received: by 2002:a5d:6789:0:b0:225:2787:d44f with SMTP id
 v9-20020a5d6789000000b002252787d44fmr1606748wru.343.1660830408315; 
 Thu, 18 Aug 2022 06:46:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/6] ASoC: codecs: rx-macro: add support for sm8450 and
 sc8280xp
Date: Thu, 18 Aug 2022 14:46:17 +0100
Message-Id: <20220818134619.3432-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3143f9cd7277..fa8a174ba7c0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3659,6 +3659,8 @@ static int rx_macro_remove(struct platform_device *pdev)
 static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.21.0

