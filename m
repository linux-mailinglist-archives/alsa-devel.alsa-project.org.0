Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D774618915
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 20:55:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA841167E;
	Thu,  3 Nov 2022 20:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA841167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667505337;
	bh=hQ80LLZtCNH9LUuFinlwN0uczraFCRu+X4ZAG02gtFs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmjumuSHgFJZia8H/QdWhBf5B8I08Tnkwp65Nt9ljJXtsvNEJaq+jTSIA2GW4wGNF
	 h0+QhG3qLojKr5H9Q+zZZ0b4QKJDfqMtl/lbT2o531rt5IDb6L0h4aCCUqljqB47Vn
	 ASErvbQcCQqHOqxVNKE5mXscODntC0UJE93bWOSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A973EF8051C;
	Thu,  3 Nov 2022 20:53:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D41B8F80553; Thu,  3 Nov 2022 20:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7A37F8051C
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 20:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7A37F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cBKnf4Y1"
Received: by mail-qk1-x730.google.com with SMTP id x21so1908417qkj.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
 b=cBKnf4Y1p3+pN9MdezNdYjZKCwgXSR88lGmahi0XjLm9TisFhJ7LKE8GC4wJvyUshH
 B0XrcUJEhnrQ7tDMJ3sDi0VpA7PRZSxVQgH52RiiC9hmvSnLsqnAhHtZP/6p/rGqpH7k
 F4fpsTPXvFw9iTIRgx9h1W3tXABfb4iC1zEye4Y/80iYt5D9u12gqAxREHJoFy4SqKqJ
 ZUrUOMP/okpkL7R9b4QIS/cDSm8zQiQDaDRcSzF5yIoYZWlU4blkusbC6amjtKViFBta
 1SRvnix4Ba5TqRcyeHyY1C/5QFcTiQTj0FipNndPvKgXRaIe1RQk11PgEXU0s5a89rrB
 IwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
 b=q6a/akgHv08QURFanzH0oaHpZOgxzOu339PbVQmNeMp9uNuz4/HnJy52kT9QEiTu3w
 u+NbNNAIUlGu3oDRkOPTFfb6RIdfGMisyGpDJWGf5XOIYSuf99TPuL9MMijs1mxPWMAn
 hTTUYDSWeuzWThrxH+UwjyaQKfCuhEP0dos3H8upy5JBj9PXDKL5Rhk4Am9ZlEBAXU/C
 kVMhK74bONsWEzlpdsA1E5DNf15lGfpWXU+lD4gjGod5Okiwuy6hPabsRbYAbQ1M+woL
 X3nm9g77mZX37/T/uZ1+bIfGC6lwPs99sM5s3GKc2DJQVgvjvi5dNZkdGYqD/lbATLBg
 b6MQ==
X-Gm-Message-State: ACrzQf1BLe2TZeOfnekfLx/gNvJvvo9HyO41TktOW3QYq1alRmg9re4q
 zKF8U1lECPzGtKIGnbVkE7sbFQ==
X-Google-Smtp-Source: AMsMyM4yhWaJCxNpHi/v3VKOjOMfzR/+GK0OT1VhHzDrako56nPe7wmtV4XL2pkQu6H1U4JIPBpB0Q==
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr23610520qkp.389.1667505227505; 
 Thu, 03 Nov 2022 12:53:47 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 de41-20020a05620a372900b006b615cd8c13sm1328892qkb.106.2022.11.03.12.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:53:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: wsa-macro: parse clock-output-names
Date: Thu,  3 Nov 2022 15:53:41 -0400
Message-Id: <20221103195341.174972-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
References: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
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

If we have several instances of WSA macro, each one of them should
register clock with unique name, so parse clock-output-names for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5e0abefe7cce..5cfe96f6e430 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of_clk.h>
@@ -2350,14 +2351,15 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 {
 	struct device *dev = wsa->dev;
 	const char *parent_clk_name;
-	const char *clk_name = "mclk";
 	struct clk_hw *hw;
 	struct clk_init_data init;
 	int ret;
 
 	parent_clk_name = __clk_get_name(wsa->npl);
 
-	init.name = clk_name;
+	init.name = "mclk";
+	of_property_read_string(dev_of_node(dev), "clock-output-names",
+				&init.name);
 	init.ops = &swclk_gate_ops;
 	init.flags = 0;
 	init.parent_names = &parent_clk_name;
-- 
2.34.1

