Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E0948E29
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 13:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5BA38C7;
	Tue,  6 Aug 2024 13:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5BA38C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722945071;
	bh=6V65vXM8FQwUV7v0SXbiGpzXztfTEZwxdLqnBCxG6/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lZF5KZiO1BadetGehFdC104JOnOEd1ON7M7ZXeNZ8KW5rVeVi0J+bgwbghk1raRVx
	 y3s/Sx63l5AF3eTV9x/fUjhJly2QmAvJ4PSb97FFXHYYkSSLeWy9yPAs2klUrGUQ7w
	 GRmu/6fRB/DeVwjl6ZQIPa2s3IiH/AENdRJG836o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDE6AF805D6; Tue,  6 Aug 2024 13:50:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6BCF805DA;
	Tue,  6 Aug 2024 13:50:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56A3EF8047C; Tue,  6 Aug 2024 13:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA5B1F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 13:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA5B1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E5CJhHm0
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so3649245e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944979; x=1723549779;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=E5CJhHm0Eo+d24zaegm0+1D3aRS3eKUAyh4ZswegGNpQ3cjJyiXHdMItiX7b/qkxj1
         rBaDtfr/oM5Oon4GPhM3ImjtOa1WybDn9DTaAHQp39TQWPOpGam6eflsuVyggEJFOaJt
         a3Bz1fFWGh4NHodkPb7xzcsh99s+MmOc4/Huz6jdn4gnxKai/9+hrIVvr1vBOQvXNC7G
         Hg7iFi283KrjgVAQXhERK/+qsd6b7NPSvvWonLb0eNieMkOYpwSE+KY/HP8U+Nc3qf1m
         CNvp51p/F3vswuroRpgcqdIP/vOYxZsNS7LEN7W3N1QxiDFv0Pmo4xPPvksuLxK9ZyZU
         1rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944979; x=1723549779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=Qp2Zxgj0oI3V7OFfRZflvWOMQ6zWf4/XBoG5OUkWAQ/aH28eiSaQ7vmBL/o1UAc8dy
         OI9apk52aBTmeZDBllm+CwI/TQwKFRQUXhQEu2wxx4AzcZML3j6b6tp7Rt902Re7rDwu
         rYjtLdbXyha9/nnM3n/m3EQ6UyXynB9QsFvZtDRFA+BbfcU60OdN01pR4gKW7n+UOn/R
         UGFnJb+h4KkH9h3QZfK+xWpdN3RPG25rpdbLnq23qq04QBfDZj7JPDRDLSK8yEjLi4cE
         y62uml7uoj4Efd49OMmRP95gdn+QK6Ee3kEIM9/SE7XNeq9qth7ggloVoDTR1XSx2e2a
         0Rdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgfrAzaH+PLsBAMCOE+FXDPc9S0Bez3junq9QpBFNa8B8kryaMA5UhpqATorTb5mrN01EgPfGA5uTc2CvtFS7eXhIg6+Nv2IM26ic=
X-Gm-Message-State: AOJu0Yw0NUGlrcFVd1+phgLUf9rc4Sjxvi4GVnicYNwLNFSAEVZZ2093
	bWJQLbyYQse1vhz+5bTTWWYlW+AvGt/Ng+kdvsP2et+FC/TcyvUPyGJCOUpwpsU=
X-Google-Smtp-Source: 
 AGHT+IHdNQyl3G6YqRv/AULLacN9IkO3UKdGEkDTc1z/CSIyS1focn/fP6c1AdbO/8YkYsQAvDZDYA==
X-Received: by 2002:a05:600c:4513:b0:426:63b4:73b0 with SMTP id
 5b1f17b1804b1-428e6b96e50mr97378085e9.34.1722944979504;
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO
 polarity in example
Date: Tue,  6 Aug 2024 13:49:29 +0200
Message-ID: <20240806114931.40090-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5Q74FFFGZY54TEPLWPYURHZDCJCNS5FV
X-Message-ID-Hash: 5Q74FFFGZY54TEPLWPYURHZDCJCNS5FV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Q74FFFGZY54TEPLWPYURHZDCJCNS5FV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The reset GPIO of WCD9340/WCD9341 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index beb0ff0245b0..a65b1d1d5fdd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -199,10 +199,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec@1,0{
         compatible = "slim217,250";
         reg = <1 0>;
-        reset-gpios = <&tlmm 64 0>;
+        reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
         slim-ifc-dev = <&wcd9340_ifd>;
         #sound-dai-cells = <1>;
         interrupt-parent = <&tlmm>;
-- 
2.43.0

