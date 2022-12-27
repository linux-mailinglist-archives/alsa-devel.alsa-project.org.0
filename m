Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CA656CF1
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 17:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49ADF5CBE;
	Tue, 27 Dec 2022 17:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49ADF5CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672158797;
	bh=wqm56mrg/ajr9v5aDcEhUBJlTH2a7we+4xTEox2D2ak=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AH7tM6biPlMz3pq+y03rn8C1VBfR2WEN2Goiuwc5xjWRWagjwYoHNUQioLX5/wLv/
	 TkpmC0289jC5J/L8r+Ui0NzPS9kRrpjtKy+7QG6UfH8tPn7WuPo1c03POP9sVkkpsD
	 VTtP8dZ6U0hnMhEtaH7eq7MfsR1v9ldb03Paq5kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 805D9F8027B;
	Tue, 27 Dec 2022 17:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A02D7F8023B; Tue, 27 Dec 2022 17:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1311F8023B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 17:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1311F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aCSdFPp3
Received: by mail-lf1-x133.google.com with SMTP id bf43so20270691lfb.6
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 08:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vKtFWde8ag1p6V6juNXXh4nFSRBR0CPIqIm4A+AUkI=;
 b=aCSdFPp3ybPM5fn1ZC9OofVvgotn9V4jc7wxsDPkHRan+nIu4hrvuxCQ45s7NtchTJ
 SsI1slzKPtFhR9Jzz2WWxAOBpHR0IL1b8CaPbS9WonCOcfAk6eNJYm9I7wKTAQjRnKm2
 xn4fTnvQMQdI76EMG097ThjtRn68C83kaxi3w94D1JgRWKLIuAhRA82BlQk2FW6Bvgnn
 ryxjYjCcd/R8dLWgpXP/vJ1gK0RRjqn6EKHWgoqjND0RoGdLYT0VDbMnNLou9UO3hU4t
 q/mDvwpi6WiMVxNid83fVGMnEYjlcSI0kXmLOV8wTq5SUc1EUbbJDIAfuU84cNIgBybh
 WNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vKtFWde8ag1p6V6juNXXh4nFSRBR0CPIqIm4A+AUkI=;
 b=qAYdDzyV0h06nGSI7ni/FXHnxAly9P4hDarhyiHkzcf+0PVVfiVwIEWBgG7UCroTTY
 FmlVQJSdzCo5YWiSj0hYMlEojUT6d41UGHXnjTdCx8hwZLEUROWVvzr78Ar5xxzdDUZ/
 NPcnyIS830tffwdadOEsEkvcz16A9WFi/nvkBmJVw2r2OSTqUIYrWFDPcRk/Dw+ohtC4
 oZg3BiKPIeNy+HBVoQU32t84VISvntcgZbLRUIk6dawG18LTpNcoMWejcXQ6fboBAOYO
 mJJpZNJr/r0CsM9TLbbZwlh3FSQJQCUkVRa7R1xsFL5PwV2ScBZwIbOwtFnify/Cqb5C
 S0Mw==
X-Gm-Message-State: AFqh2krsECYdvdU2b1cEYmLHBopZM6+nT9mbv8QTrvoNp4HzLUWz/gaR
 lThkCkjtRMa1ZZNLhzNxR7QYcA==
X-Google-Smtp-Source: AMrXdXsi1Yf+1sfjPFQxih5hmhW2m86/4RfbGkn0PY6lv0SikoXPrs5jrTzZX0V5FNf/qJhcAX9dPw==
X-Received: by 2002:a05:6512:e85:b0:4b5:aa59:28 with SMTP id
 bi5-20020a0565120e8500b004b5aa590028mr7251601lfb.38.1672158699757; 
 Tue, 27 Dec 2022 08:31:39 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a056512348900b004a46a9cebe2sm2318019lfr.289.2022.12.27.08.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 08:31:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: dt-bindings: qcom,
 lpass-cpu: Fix DAI children pattern
Date: Tue, 27 Dec 2022 17:31:34 +0100
Message-Id: <20221227163135.102559-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
References: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DAI children (as subnodes) can come with two-digit unit addresses:

  sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('dai-link@19', 'dai-link@25' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index f00fc1051d4d..16248629f659 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -78,7 +78,7 @@ properties:
     const: 0
 
 patternProperties:
-  "^dai-link@[0-9a-f]$":
+  "^dai-link@[0-9a-f]+$":
     type: object
     description: |
       LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
-- 
2.34.1

