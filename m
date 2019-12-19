Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3B125F55
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 11:40:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22BC826;
	Thu, 19 Dec 2019 11:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22BC826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576752026;
	bh=Yco2H4Wz/2GZY+uz1xLsCAeKvY60o0BeTAtCvGUlr2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVYGe5ymko3mvqRkYEoanQ+7akcEB/e4i5AEACRuGJ6pj8CyoZe+naFVnr08Epl7Q
	 hVqmKAnSbosmTpHU+33gx6ZKw7M3rjThnKrhgn7F4QOcXD9xNQBPQkVlgmqgmJERUp
	 /GpEBfN2JHxVDnA6lU/1LwRWkI+I9YvHJUOJbcL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3181F802E9;
	Thu, 19 Dec 2019 11:33:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44FEF8029B; Thu, 19 Dec 2019 11:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E8ABF80277
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E8ABF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NNOtGjrv"
Received: by mail-wr1-x443.google.com with SMTP id j42so5395753wrj.12
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=NNOtGjrvusypzMTC6MJS8EMtqQcuO5BJE9acFErPQYUgb6qPZe3jFF4p61eL5laUxW
 tuAsMpR75YhavzwfcY99YsJDQOvMJcS/g71uP5dW1poVMEOAiKVXYsRv83f+P2DKINe6
 ZnH8A4QVwNGfb7XhFy+e184o1unmEhWRUyelBx1ihqKbSfSjJnwOu+rwKIZpZOefqAI9
 nV7h4ChVDZFlXPeBKt62DSex2V0RjzmGBNEQt6fObCtHkTLVVufjT5mmTO/dS8i/+hy5
 M8zjIOzc5MQ0W5LhXtQn2eW+HT5wpVfM3JQxOQVqqBIOcvWYf5puQLbrXgFxtBhSU9yK
 krmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=oEm74RcEO5VF6HIlVkdDlh0rC41jn696yAwJTyCt1ImG6NN/Grz1RtsZwZcUnQIBGz
 R8dn/c1eHn1Hwn/EpFCxpMLEF/dUNDlPGykTCvorjKq6EDnITkSmrZwbv8PVife0MQ6y
 KzAJJVk71E7hAfjKF91qJs/87Qoh33d/8eLQEEZoQD5fbaWpjN5AqbXh9QbcZCx5ltiU
 Rv/lj8AZDAispCGMYInbOYegqJESxMkDDadrAhKqIep+g1UbPU3gvZKpodOR5uoC5/Ug
 UhkzUThDrd3RNsnBVC9G+MeTfMvgEHd8PBVnlNp8NzvPoC73BtOEYeLpjkVmVCebEcJa
 xTdg==
X-Gm-Message-State: APjAAAXFPCUyu5fv6d1J2CljRrFsnP79zN6UUxeVs98+1uPK+K9Il4ay
 BjsiOuXPtlrY0fE4xUFlqcI4lA==
X-Google-Smtp-Source: APXvYqxfo0snWNNJZR+HZ3eABwtxFyD/6cnRGxZomqgjOClUfLnrbHXMz0ncmNrqJw8+e8W1kW1oCw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr8529223wrh.272.1576751595154; 
 Thu, 19 Dec 2019 02:33:15 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:33:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	lee.jones@linaro.org,
	linus.walleij@linaro.org
Date: Thu, 19 Dec 2019 10:31:52 +0000
Message-Id: <20191219103153.14875-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 10/11] ASoC: qcom: dt-bindings: Add
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
