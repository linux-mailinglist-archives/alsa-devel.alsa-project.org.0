Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495A618914
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 20:55:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4CA1657;
	Thu,  3 Nov 2022 20:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4CA1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667505316;
	bh=hQ80LLZtCNH9LUuFinlwN0uczraFCRu+X4ZAG02gtFs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thiUhfqQJPhenyEJW7ETCpgjBat3UKQHRP6JzSIIHip1uzpRXBZTES0+mPKBMbGO/
	 nNPTw69NoddK+Ssb4Au3eJoC7a8H3ZCaSBVEBSmlLepuzGobuho7r93W4bR3RtPeTu
	 LZQhfOS+KXt1b1ic0b2aZVRZ3T/+DQX6pucVtXqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F032F8052F;
	Thu,  3 Nov 2022 20:53:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4285F8051F; Thu,  3 Nov 2022 20:53:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B73FF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 20:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B73FF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hyOVUena"
Received: by mail-qv1-xf36.google.com with SMTP id c8so1865482qvn.10
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 12:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
 b=hyOVUenakbhimpBLe4rmEpbp4laB8yVoIzkgZ0Go7fnS1YY/EUj0RndvLYOdyp21hc
 AoSMLyQHYqqCqG+g0NgFxbVStOY5sxLOPrMSu2sDNW/L7jxNT0v/h30XE7o4eRGb1CM2
 p+hwpbfgLIGIUM2Y5kzXfZ/EdzsDrryoP3pEnxfiAbpRz94QjhY0QKcuVd683sqJuadN
 I2HlhLzw7b8Z0E9GGv1l6RFEZh6CKrMUl+StnZ31qbx6tFuKsMqbELu2vse2lUiAZ0hY
 nfzdkoGWpo8F2RurQkdkczNaar0/e92wH0V8NdUypy9ULrgRpuMicbvRkjwvjq7CApAM
 U4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
 b=TRusX7+sTAgdUKiKQYBo1Cw4mYnbADlL0xyMBVUmKytWxpaRzyUQ4tYVlbjZkqXlWt
 SLFPFVjVUHNLEaQavpynmljId8ZyoB4F59OTN0DjJhtI1tnazIwVAcypmqF/T+u4yd78
 PPuv0YLzQwrwZH2tF2GUuas5i6p104m6PIVEF6l0yMvlCufwMH9ByQoZlg95TOqhxo1x
 FDwUIEnOEDWJjKaC+fF78muPzng2Cv195H2rudFKhImIxvbG+PCafO1m5JykHq3LDAgS
 xRE3YMrUq2yZ7MturQfgbJEhS79NpWolOzKHY70xLeD1Z8FUze/e6+GKivTHmBnr4Tbg
 H1EA==
X-Gm-Message-State: ACrzQf2H5rxu9uFNHOojefgUe/+kFoVigEt5f5fnZHemOXypPGMlDAEt
 YTVjm2QRMKvR6yaBbySFKVDA7Q==
X-Google-Smtp-Source: AMsMyM67CGOGnsKJJ2m829zic/y/kudxtYEKdM/yBMe08cw4Li7s1lduovri1Y843bkDlJ8rGOUcoA==
X-Received: by 2002:a05:6214:20e2:b0:4bb:7aa5:bf0a with SMTP id
 2-20020a05621420e200b004bb7aa5bf0amr28398378qvk.112.1667505226196; 
 Thu, 03 Nov 2022 12:53:46 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 de41-20020a05620a372900b006b615cd8c13sm1328892qkb.106.2022.11.03.12.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:53:45 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: parse clock-output-names
Date: Thu,  3 Nov 2022 15:53:40 -0400
Message-Id: <20221103195341.174972-2-krzysztof.kozlowski@linaro.org>
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

