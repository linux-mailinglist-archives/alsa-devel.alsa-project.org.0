Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7D85D6EF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 12:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F79E7F8;
	Wed, 21 Feb 2024 12:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F79E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708515083;
	bh=QBSDWr0jaVh7zeXBOsel/rJ+6ajgeIvN4uQ8MGcm7Rs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lz5rCBl0p9kN0vEfXbm5HJKGrkxqg2ebQpP/Ya83U2y9Dw6J1NYDU+JPyNoerFtcc
	 r2WX0dS1r/TjlXpQ77Im9OhFlLFOiGLkIacK1hwLbD+Pjivz5h5hf/mOYNhEe1zd1k
	 67LeBDU4aibosT6tsx1G78Czhh89gUxMrG0JxlTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C512F80104; Wed, 21 Feb 2024 12:30:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5CCF80568;
	Wed, 21 Feb 2024 12:30:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E13BFF804CC; Wed, 21 Feb 2024 12:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 135D8F80104
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 12:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 135D8F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kQHyCdF7
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3e706f50beso59646566b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 03:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708515040; x=1709119840;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=kQHyCdF7cjBoWSuz3P3qGuew6JTtlDTk5Di4LVWASB9m/lpbMsh7R2cAZJnplBPuyu
         PfVT+kWWJ/nSb+g8fiL/bTwcrfFbBfGvILy9oiEqcm8h5Q/rIY6tu8O/U+nFHF75Jz3q
         hM3rlIY9GdJxzDeMklB3F6MyIkNTNeU6Opx1QN5VxnHwDbv2ZxHcbC7to/eZxzMPjXkT
         1+3TfLdjNo8pcT1D0+ueMo6OAVWYycz2rIFRnRLG8MpQgonFk7jyXgtd10FylM6O+g+e
         r/QU7UvjJiSZTeTv7Z2pv4SLg/bOMg7Jx9fGSd3jhPAOraSqJ5yEDPQ7tT9pZtb2by93
         qrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515040; x=1709119840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=dZN4FNyHwOCberZg+lsy0Hilzjy6UwLEVkGHSiiyY0nyQPUjQ+Unhf5y7PT/AJ4CXN
         hV7lh2rLIxoz7F29o1Ec8eLTnNWz7qGRWFp7Akz+NHMho+atGf69ww/u0RBdnCuKwzQP
         NkRhTVbQBdH3wWGZq8SHJ3zgalShK4EdxIFsW8e7EELH1JjBS464SFgmbXvkzeUZ9Pyi
         CPSfHLqyE3XOhLyAWgsc5y2aNHWy12WFOSFfgubv7OnWNHD2ZDwr1S/7C7EUkKa19dAj
         8/3lqlDbXhvWppUI7PLp0N4yHgkNBiUhJvUvVFJ5NASTCO8kWtuHSw8qz8CToBeG8LE7
         h7qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFk8dzCcgW2HsItgTCNJx8QeiPsup9FgDXnrfLRGeclsIpUQJuVw9WgSARwE5a4KNzDJPe2aFg8xRgeda9tzpCb0uCytD77TBKZBA=
X-Gm-Message-State: AOJu0YyEC5eYW4/bl5119X/NBRs5RtKDwnqYq7QGLKF8JiiUosHqhG97
	TYl5ZEs+N/Wx6AQzZO2U9KyXKNUgeCeQv2qlL99XgHa5C1tHF+pMdObrNyGoe8M=
X-Google-Smtp-Source: 
 AGHT+IFMtWAXfF6096VkEiNa5/PKLj4TmtqoNEwWGCceJzPnphZEPIX4fokcFB8EcevGHD4Key3dhw==
X-Received: by 2002:a17:906:368a:b0:a3d:bb68:be30 with SMTP id
 a10-20020a170906368a00b00a3dbb68be30mr10815533ejc.6.1708515039933;
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a170906c18100b00a3e278c4a3fsm4393712ejz.53.2024.02.21.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v6 v6 1/2] ASoC: dt-bindings: qcom,wsa8840: Add
 reset-gpios for shared line
Date: Wed, 21 Feb 2024 12:30:35 +0100
Message-Id: <20240221113036.23905-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KJ3Y4WXNVQI7P73OUAU3KKVU7F7BWMLX
X-Message-ID-Hash: KJ3Y4WXNVQI7P73OUAU3KKVU7F7BWMLX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJ3Y4WXNVQI7P73OUAU3KKVU7F7BWMLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because reset part of the patchset was applied, so this can go
independently via ASoC.
https://lore.kernel.org/all/38fda6619769da7240517982adfe734cb653ff5e.camel@pengutronix.de/

Changes in v6
=============
1. Add Rb/Ack tags.

For full changelog, see:
https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

