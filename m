Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A7851CF2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 19:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB5B86E;
	Mon, 12 Feb 2024 19:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB5B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707763134;
	bh=DXZJ8SdU6CyY1sR3YPxqZTR4REG8xqBS+RKXIMzNoAQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GppLCvBPjiWXnUXIy19oBNeUiwl2SNZ0Yvc5d/nxgQ7PlWZ8qFNpF6xkXUZc2Aay5
	 +uO5TvZPVd0lX/Bv4MXKRbw8oG5Na95faHeRSuo2zQGl/WB6hbhm7arFsU6gwGl0kW
	 1FVbJgCZcOqSC1hNtWpMjXp4kCk5KRp9r/i6R6ZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F244F80567; Mon, 12 Feb 2024 19:38:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A812F805A0;
	Mon, 12 Feb 2024 19:38:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C06BF80238; Mon, 12 Feb 2024 19:38:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE4B1F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 19:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4B1F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U6dlmkDN
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b960e3b8fso335499f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 10:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707763090; x=1708367890;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yfY1ZB/UR7wkcYg1UUPlepgpCujw5oq7QYtIrjgAB+Y=;
        b=U6dlmkDNAUsjzl5i2HL7cKyjxtThGdeW4bHH+/mCF4GDQjskOzkPYk9GIi1aUHZeNd
         VGU//08eQC9k8SqGmylx2swkjK7Aip5TTW4wjS9DwRsidVvw7CSZoDdmmxlAsNWsza8T
         +ExJGML536LW6TyizfroqDr8B4GFATSaA0itm17nxvlllR9OwP2yV2SZ3nwik7NRLG1Q
         IAHTQ+zyn7mEC1a5NY/SDAYHXgmvuUO4iqJdBHK5eSYCerUm6YL24U7APURmcplGq4Yq
         i7i+jxw8gUqPGyRlmEcrKoSt26NpCp/EAdR4kMComD/H6/uJR40okv+/V6yk/4Oj8HLT
         ZZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763090; x=1708367890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfY1ZB/UR7wkcYg1UUPlepgpCujw5oq7QYtIrjgAB+Y=;
        b=wfJVGaY6u5UvpCcVuYYM4h7R7IhgqWYBL0//0WwjpupTD307UJyxW+c+pyYab/HlIu
         MdApMC6sw5Mgl/jTSqosslH37mpIXzvlt/TgyUm2pr/IJIk4SSYU0+d7OrU5HqDEiJhp
         vCvUeG4DtDfD0C6KJr6ElGixBWl98aEPncaXNRIz7dn+xNVO1oo/z2SHof/0uLhPQZes
         USkYE76CyZ+UuBZSY1OMD+N1g+PwmLgZTNslaR/ll74mCi70vrPpqHam01CUX6vmrnxO
         LX1tgiTlnIL/z+lMEmy8LjCuM/DJC01G/N8jU54OgwMohLTydtahTaUN8pUgKHhPrVSS
         XZOg==
X-Gm-Message-State: AOJu0Ywq/+etjA18prkImWYoQJ+bufOHFkpRYt6J8/ywKy4uXuICfChW
	ufg8FFuY2q6o9Zm4wDJyD7JAy3BY6j5sTGjNZxlwBeB03O9szQDmYE3SoyhhRT0=
X-Google-Smtp-Source: 
 AGHT+IF/hwYTN5gLQ3qKoL/DyWJ6yvMswElKu2UQ/C7ATTeBnESdqrjORtlS1g8/T6sopeOxxWDqTA==
X-Received: by 2002:adf:e6c9:0:b0:33b:26be:c5c4 with SMTP id
 y9-20020adfe6c9000000b0033b26bec5c4mr5070145wrm.58.1707763089714;
        Mon, 12 Feb 2024 10:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7FwCqc3uSItW9zR6KcTc+WJpnm2J7Ag+uFwzHbEezPbTiJaygZkxJx+XyzmpzoumVzh/kUWE9s+ujy3btOIRxOBbWcTsl3baVUVjAW+kBNP58Zgh5iyJBuq+OYyr1hm9XfVfZcJOXrn125Gd7Wu5NwnW8n8C8E4+zzpr1eMqYM4HKfr68ddz6O7DChsNT/g9geQCsrKcdzrUsUUk/3XyneUs7a6yOEPxmejAY5avb12SGkt1FXm3xZBJYLvGGSwWg6G6qSeDOZcEJNxZQyNsOnn2bsSvA1UN5G8/lDQQVCzTIqc4iuHTt3iLmYk4EAcjWyfeum7hjE4CIlKxEJstNCZTNs9hGnBGy1NlfwYdRL0m75u2j9Z4+fCAwqgGhxoMD3OPza07sIlgT5Obg1+sIsGIa8O5TSLURBB9AtFC7qdQEZTTCnQM7l81GDdg3J6kDDFvh0stEkP7uxYICEW5K
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a5d43c8000000b0033b512b2031sm7447163wrr.114.2024.02.12.10.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 10:38:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,sm8250: Allow up to 8 codec DAIs
Date: Mon, 12 Feb 2024 19:38:00 +0100
Message-Id: <20240212183800.243017-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LI4S7V2Y2LJDFUV32KCOGWDK45VXKXVF
X-Message-ID-Hash: LI4S7V2Y2LJDFUV32KCOGWDK45VXKXVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI4S7V2Y2LJDFUV32KCOGWDK45VXKXVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sound card on Qualcomm X1E80100 CRD board has eight DAIs in one DAI
link (for WSA speakers).  Boards with older SoCs could technically have
similar setup, even if it was not observed on mainlined devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

DTS with X1E80100 sound card using this:
https://lore.kernel.org/linux-devicetree/20240212172335.124845-5-krzysztof.kozlowski@linaro.org/T/#u
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 6f419747273e..2ab6871e89e5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -107,7 +107,7 @@ patternProperties:
         properties:
           sound-dai:
             minItems: 1
-            maxItems: 4
+            maxItems: 8
 
     required:
       - link-name
-- 
2.34.1

