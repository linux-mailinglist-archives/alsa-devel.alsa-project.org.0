Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C82E8741
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60E202244;
	Tue, 29 Oct 2019 12:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60E202244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572348993;
	bh=Yco2H4Wz/2GZY+uz1xLsCAeKvY60o0BeTAtCvGUlr2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBH5bGD1wqTMptDmTlC9GQEZUQgDuDOlePRXMeT02cH/oEIkeonCKenfmdaF2xogR
	 X5Af2d0cyg9ubQgnNjf+9Z/7E6wHUQYqvCrMyMQ2DYOPXs2vRgwaGsXmPGzjvobJDr
	 BjleY96u3xuAnlwOTwP/CGNQO+4ge1bO1N/g6rzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B76ABF806FA;
	Tue, 29 Oct 2019 12:29:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 372B9F80649; Tue, 29 Oct 2019 12:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF94F80635
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF94F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="a7btE6bN"
Received: by mail-wm1-x341.google.com with SMTP id x5so2007803wmi.0
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=a7btE6bNZTalO6uJ2Q3J3SGFmmVteAIhrL2W5H4pHkfPFeWdizziBlnvYU1k1l7H1z
 VdrT98Yc2YK24o81kwrEhi25dlcKpAucXw20r5kJuGqR0fzFvFUw8IyUa3TgkZ2+N/t0
 kalOcSQm4sdNPsAmabcWb0eXbbr+cuZ9EAttgV9ScQoeY44mDD7Z2p8rOaFugm7ina25
 mWzB9+MTesKrQxHw6b6ECD69xcpwkkFvtIJszfhMRF/Ixrj+yHOnxxXqXgGK4gF1kTLt
 3V1IwLIrJdwy4tglpaWjmrMYZFXtJAcIj1zPGzAeDvXzO4ghDIJGPkCuTuwW2LyBmXRv
 xIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=BLGTZHvqDmX5pKpEFZyPl7QzPin8CITGeIZaDN5Z1M7EVcz5V0ZJkTXQqyGrgIIxmj
 ZBh7Pu22YyPbsTqzeVvAHFJ4vioH5JwmxHlo4DID0cYt61d4bdnc1LIHmpVqRC01uvhP
 nD0vglzyYykzTLhwBSURjjeW/ShF17iBDXPWE1N8c0T9x70+tTlH5zCz4L/Ryf3bq9qi
 xNPaFHr1JOCKKHcb9corLVUWaFdk11ogQvJIIMcyFL8xD+A/2eV1zNefXZnrVCIRZuO4
 HPNU4Z0T3+kGzSPjJ0SY5KqgjUoDREoz2ixb+IKdf9NqvQ9f9lz7XQpfMeiZMScZ4u+9
 k79Q==
X-Gm-Message-State: APjAAAUVDW+O/vZ7KHplP8gEZwxU4Cx1CVI0wVUUaBG7BO8oSrTKqrPu
 weckdNAfB/faK6XpImbKbrQGiw==
X-Google-Smtp-Source: APXvYqy1tl4LyuCywYWNRuqXZdWjtRzeYlP86wtCjCStz54zWcC6oJciXhUYQAJM9je4iY3Kq745ww==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr3548367wma.65.1572348547207;
 Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:29:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 29 Oct 2019 11:26:59 +0000
Message-Id: <20191029112700.14548-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 10/11] ASoC: qcom: dt-bindings: Add
	compatible for DB845c and Lenovo Yoga
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

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
