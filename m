Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829515AF14E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 18:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28916AEA;
	Tue,  6 Sep 2022 18:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28916AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483427;
	bh=gHCXcOehl5TG75hl4UdRCoAh9V6ruw9ULVkhp/re6Oo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lsLaCpH73M5z3g8LU7mlziNUT5vGlng3OoNXR70CRVdLlSRAeHhnWMl1GlhPSS/Nh
	 cFPQu/+ryaH9MnH+q+bLx3XWdkgLZZTJB8KdC0nttZpfeMfguYXIxyMA7KUlVPT0jm
	 NznIT24etNBPMSxOHD1H1/R73FiQPplhjdBsuEp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B533BF80537;
	Tue,  6 Sep 2022 18:55:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61562F80528; Tue,  6 Sep 2022 18:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3106F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 18:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3106F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M99jl9E1"
Received: by mail-wr1-x429.google.com with SMTP id k9so16419291wri.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WTkzv8YEOlbdjLC6KXa6QEDUYut5q0I2wNQAEMPRcK0=;
 b=M99jl9E1fkmNyQPxB13ujz9bbQG38dvTwdVUXZ+h2hq7isW+SWcDwtKkOtq34A9fGl
 p2DE+KNbvX1+54o3ORqIooc+0NQImu296zkr7H+4Gn6z07nLsXdWM63oGIehl8ZpHQ91
 xyzzbg5NKkEisYZBb8JuxfoZX09XJWk27GQYj17UI4gcejt2iyPejPFeE1EKF8yW74V1
 22fENXnNAyCdEbXRVMs6X80SSB3c5N+H5OzdRameVlyIn1XV0O+8QbSMdJEmOvwf7jEm
 HKRomii94W4alukBmcU052ewtW15aikKaXtNtlI2FfiPXxq6UwB+FASfvNYL/s+N6Cnp
 w2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WTkzv8YEOlbdjLC6KXa6QEDUYut5q0I2wNQAEMPRcK0=;
 b=a+iDc/28/76mkezk04zx651mBKHlDgqGfd3LBWpD4qMSRH+ANNL10DVAwKXHYtKtc7
 i4brYqG8UqtJABOL3AD4Ygr6Fd9xXJUBvdyNzM/O6lqmw0wee/NDsKP4KUxStPjDE2Iq
 y7FrqgPf5813EqlMuR0zBv1KJyKz3vxdjPIelL3HDd8ujMS1LWSUIZoTOUGP6ybmLm80
 5VaNUl8LxNLgVknVRsu/b+tZV8mGlfYVCUCCYboc2UUJBs/OmK4du6EFHVatWpYqkVEL
 UKCxYJrHCS/qsXs8lC2tulEdoC2LGm6wi5o4425U0vs+zAOy8IgeWjwFn22FS1kxOYgD
 yggA==
X-Gm-Message-State: ACgBeo0irmEupXZqCLAkGzLP7iDCzZg9q+mx7shXDIr+si/tE1nuGKM4
 oMqT+DX6OejyRtTmVdZ+AU6vxg==
X-Google-Smtp-Source: AA6agR7vkq9erMeoQXQL44pl4mfL0mPcVPCVM2Z3j8r0QTxXy6VMH44pXUXX9TU4JiHig1nhvMy9fg==
X-Received: by 2002:a5d:5983:0:b0:221:7cbd:df50 with SMTP id
 n3-20020a5d5983000000b002217cbddf50mr27462758wri.420.1662483316833; 
 Tue, 06 Sep 2022 09:55:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm13775906wrb.40.2022.09.06.09.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 09:55:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/4] ASoC: dt-bindings: qcom,
 sm8250: add compatibles for sm8450 and sm8250
Date: Tue,  6 Sep 2022 17:55:06 +0100
Message-Id: <20220906165508.30801-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

Add compatibles for sm8450 and sm8250xp based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a3a4289f713e..58b9c6463364 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sm8450-sndcard
+      - qcom,sc8280xp-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

