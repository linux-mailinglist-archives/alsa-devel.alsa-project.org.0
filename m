Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B16CA5A7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8606C886;
	Mon, 27 Mar 2023 15:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8606C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923458;
	bh=kKMyB31bv0rF99zXKaDze44ogQ06pDYf0RyVy+Tb2ek=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KiB2QhuE5axnRU6j1jzAk68vDOMaiBQI+xFHD0UXwkfGwuPiFGMxl9PGGDRyl1KT8
	 VWdAlkNgKsg8l6U1xTW0c1x7U1TB65mpp014XEGwcQQqdwP60nFsxxrqX9jXOZbI7F
	 AUu7NJuakzlRwVPmB0kMCKTtLhsCLYPB12aq2ZYI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6085CF8053D;
	Mon, 27 Mar 2023 15:23:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F8BF8053B; Mon, 27 Mar 2023 15:23:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A240F80482
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A240F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IiDkvh0e
Received: by mail-ed1-x52a.google.com with SMTP id h8so36132847ede.8
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4SWFLm+fv3A0ySINaCNR8lIIUv5v6wsF3OLQGhunvA=;
        b=IiDkvh0ejQBbFpPsdHJyK18wy5TKG0EelJXbBMmzTJ5kaiva8pulY7S24sFjqBGI0U
         E1TWncUtQipI9yn+Jjcdg1rvFMJLCxDG5F12kk2ktaqDu7s6Ksp174UkdnOGbmyLr0xU
         xZpuifrtD63hgs7W/3/Lir2QgmsYA/HyHq530eh7l3JdMOmOSkaDJBznEC4JL/UkyV/R
         vhJf0zVwOjqMiGn/rAUm3jJVaqPg+5VOMr2J9hBZfQ+Vk/41NnKHDulfF4zP+3kHRW1H
         0uZXszlwK7VtXqDuApLNz3xy/m33C1SyWXWyYrfnclfK/I60X22bYn7xB80iAPdaDtEw
         twjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4SWFLm+fv3A0ySINaCNR8lIIUv5v6wsF3OLQGhunvA=;
        b=l7JYxp94SLRNdvGwx1RiNDcBt8ofHe/9SR68Y1Zj7JZHRivZEJAPmDBwoCEd3Fa4C6
         YUfWlIZpo4d1c2ZBkGYpReaOc1mGPBU9u9BeGn/ntE4/8EXVj4CEAh2OeE8K9/mrAoOA
         h5ucLl/3eJOqMt2GTQ408NuEjQm8Sw6EhFfuFFYNT5x+8LyJ8WknHhYC19I1Xym/iK6v
         gqxwdIEhaJG05W1OFRpWqavVAlQasyYGyXL2qovzNFPZnN3MhkI9uMjpel4f438oCWzq
         Wf7Qw5SVootTDnnKop8SrmH/juMUjRZq7O7WEziUXL70lWgnvuOPbJm8eJDkSBCdb9G0
         hw0g==
X-Gm-Message-State: AAQBX9cQCiJQcxMx7o57RolFUE4nE/iu/mp2+ChfQ+AIT85VoWZP0xm/
	aZz/T1Iz5YiLJ6+rh6NYWB6D28pH3euA86ycEkM=
X-Google-Smtp-Source: 
 AKy350Zi4gbqJ8JQAJAptTP29tPI/Ta9y7VGPm750r05GvqYJLrb0dD5M7SIgOgUrq1fGW1LVsGH+Q==
X-Received: by 2002:a17:906:5010:b0:92a:77dd:f6f with SMTP id
 s16-20020a170906501000b0092a77dd0f6fmr13047882ejj.73.1679923391718;
        Mon, 27 Mar 2023 06:23:11 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550
 RX macro
Date: Mon, 27 Mar 2023 15:22:46 +0200
Message-Id: <20230327132254.147975-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DTJF5NL22XR3WE3TEA534OO7VOZS57ZU
X-Message-ID-Hash: DTJF5NL22XR3WE3TEA534OO7VOZS57ZU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTJF5NL22XR3WE3TEA534OO7VOZS57ZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the RX macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index babf2ac20afb..ec4b0ac8ad68 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
       - qcom,sm8450-lpass-rx-macro
+      - qcom,sm8550-lpass-rx-macro
       - qcom,sc8280xp-lpass-rx-macro
 
   reg:
@@ -92,6 +93,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

