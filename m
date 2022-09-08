Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44C5B14BA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 08:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49B7716AD;
	Thu,  8 Sep 2022 08:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49B7716AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662618990;
	bh=gHCXcOehl5TG75hl4UdRCoAh9V6ruw9ULVkhp/re6Oo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sT/sXem8J1UlR1jl+GOPGsOpqhfbsQCVO8PCn/IxL8UaCnEIsZbWHsqwRNtiO3TUi
	 8FdUc5rFU2+qmM2NwfLLJLgKfZNjvvy6NqUXgdxRUBpCYJNS5pBo+nsdJ5eQ//Yb3i
	 L0SKUb+pvgKHDd5Jmj7fl0cG5zxyNJCu26u2XgIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8259F80515;
	Thu,  8 Sep 2022 08:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49613F80527; Thu,  8 Sep 2022 08:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E607F8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 08:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E607F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sib4vZSo"
Received: by mail-wm1-x336.google.com with SMTP id
 n17-20020a05600c3b9100b003b3235574dbso551497wms.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WTkzv8YEOlbdjLC6KXa6QEDUYut5q0I2wNQAEMPRcK0=;
 b=Sib4vZSou3PdVVHgBYUS1T1bEQ4RIm/nW5UZK4b0o1pGgpJV9d92Hu/FdX2wgGH7ik
 uFGjKuOIOMXAKrA/atvXUEUp9tXXQLKrTURSXmSYl4vdtvcyI6gIJF5QsvlNoSakK/zd
 Qq/RZ5/S/qjWzornY9hRMCXAEUmIVt7FXLde7CP5Vqp4WaOMop6+U+W7mmx91BNXu/z2
 pG0ILb+ibuvo25Gb77U4kfrO/DO5mxFmhYnDCpb89JFXK2LfUTUvIYB4ycoAlXN1QpdO
 xFpFSJHnEIV9FrswjC6MgtJ5v/XoS97dnqjUB0++CsyIXr2GxN4ZExhJROn4VHYvRADG
 Aakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WTkzv8YEOlbdjLC6KXa6QEDUYut5q0I2wNQAEMPRcK0=;
 b=vsFSFJqk59jpcs+19widis0fVz4SbCRw+Vi/EZrzM4n4VND/KF55Kqx7GYen0awkWV
 G6+1pb2HLcifoJqbYcukBxNwsu6WPs8dxbUmawqONo0f4g7FcWZfwi4mc0nLdW7y94lc
 XcALY0df9V2uTDeSEpOJo57tWObtXVfp0URY5+J8i+jWTitEkm7a/GNnfdFx3CRMJc3r
 yTqU0A29AaEfaEXFD5M1f5g3wY7B4/RseiLhOinY8b/H+ruXn2mWjJgxQDkKACXQsXKO
 1mNrF2tgWigkxswZaxMUK7dCausMTZrDA5PyaovnxT8Hp3TuYhSH2tEiMQ2iTSLKtnPU
 EdkA==
X-Gm-Message-State: ACgBeo1sMJ+2UDGFcfJj3UoeHP9I1JI2r/5nBuDyr9G+mVzbbPibjXEe
 NFw+XSKSuhDd/jGdG6o3PPJUoA==
X-Google-Smtp-Source: AA6agR5mozG3Wx6d3MD3h4jByC/+SyO9pXAW/PlfvvU4Go+7CKyO7+PxIGHFX+EhLYNQCDi1HfHWxQ==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id
 f15-20020a7bcd0f000000b003a5ec59daf0mr1071842wmj.13.1662618893648; 
 Wed, 07 Sep 2022 23:34:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a2e92edeccsm1549598wmq.46.2022.09.07.23.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 23:34:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 2/4] ASoC: dt-bindings: qcom,
 sm8250: add compatibles for sm8450 and sm8250
Date: Thu,  8 Sep 2022 07:34:46 +0100
Message-Id: <20220908063448.27102-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
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

