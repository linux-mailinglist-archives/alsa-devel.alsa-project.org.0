Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7A6BE5A1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 10:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FBBF92;
	Fri, 17 Mar 2023 10:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FBBF92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679045404;
	bh=M0zpwLGC6JXwb/aQz6bXFGEsL1n1tlqc+IroOfV8/xs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U9rMsbnB87d+LetNQbG96QGW+09D8hHNLcfSGkKtoJJ38gJXBEhkOqN4GcDIrYyWj
	 KmjN22zBD1FoynDT3mXtINhbF4GQAqe9s/21SkK8DLw2pssyQUX6evJROb7RMedUYq
	 RjU7eiOfKfXNBnGIS2txJr0H2VSgHLc5kzg/sQFE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D43AAF8032D;
	Fri, 17 Mar 2023 10:29:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D553F80423; Fri, 17 Mar 2023 10:29:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8118F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 10:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8118F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dHheWwzb
Received: by mail-ed1-x52e.google.com with SMTP id fd5so17849744edb.7
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679045342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFUP5BW3Hbh1sE4rPRVXZjxwGcnBYX4/z1UolsFEGZg=;
        b=dHheWwzbQmX3zunqQ5lAYxMiyTxPJKcQeQsBjBQAkgPCqI2LYFPNEkZ6Eri0b7sRmD
         6c8/OTC5spAy6GfOSZhyoo74Q9qA60TGY3wKIgIadeBmoIsOdLzV0E2LWyxMpK3xMuAM
         RlOuLqJCmGoTmpzzKZDyxL/6UgBaogCbp8SSRdzBiF5H1nvvT8NWCWRfy9Gg61Nfdqea
         TVxvMZBrjZkzuNLMdmDG2QJy4+rEyz5pPvLnMTsP/YtqMxGgzoLn5kz5Vxbu8nSZEBqa
         gQkg9OJMH71rH7bgDM0+o0msHp7MLEKp9clbm4gYxJ59NUS/u4XLEgWQMk/Yu2qdorsr
         duXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFUP5BW3Hbh1sE4rPRVXZjxwGcnBYX4/z1UolsFEGZg=;
        b=H0bfZeneMtyVVPQNT/D6Uq+aFrFZ01PGKz6u1lIJGiZo2AK0FW8QtDoXOMBX1Xh+/G
         WUKLNzQ6Xxugev/MUSKBWJJJ7JcGbPXwlFYxU1HzmcvyP4xWKU/ivuLjXsk07/co7JBV
         /cUT7O1xEhRZ0ryXxs56aRWw+rJq2X6oqEHTKf5k+7LDLgin7gk46WRBmZJYXw8odQjv
         JlwIhQ7xvCtRHf12I1OTYp+NGlX2t2gdlXuNe91O1LYhTNlYaPozxJZl+Hgj/QYPWgB+
         L6vNGu6MytQleuylHhRYWL98bqWPT5YWyc5GTKfHf+3xBq2E6h3KjT5QdDkx57/FXblV
         HXtg==
X-Gm-Message-State: AO0yUKUBVSThB0W96jWqm5iV6zRWnGLjKe3XXe+wWT3TiW+xOeTtHCLa
	bE/EPVDudmaTGj/U7jHW0oSo0Q==
X-Google-Smtp-Source: 
 AK7set97O71P2trKPqgfWFwmNAyhaCD6puLvQFOFMU4zjAyg3XBjs8CH/e2ya6Z53yC5PK+oJJaY3w==
X-Received: by 2002:a17:907:3186:b0:932:3536:2369 with SMTP id
 xe6-20020a170907318600b0093235362369mr673097ejb.26.1679045342610;
        Fri, 17 Mar 2023 02:29:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 c25-20020a50f619000000b004bd6e3ed196sm792176edn.86.2023.03.17.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 02:29:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Vijaya Anand <sunrockers8@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: fix indentation and
 example
Date: Fri, 17 Mar 2023 10:29:00 +0100
Message-Id: <20230317092900.16770-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2LKFPBOGF2UQNERK474PO6RZ3QXCVA2U
X-Message-ID-Hash: 2LKFPBOGF2UQNERK474PO6RZ3QXCVA2U
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LKFPBOGF2UQNERK474PO6RZ3QXCVA2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix errors in binding indentation and example:

  adi,adau17x1.yaml:8:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
  adi,adau17x1.example.dts:29.3-30.1 syntax error

Fixes: 87771c940258 ("ASoC: dt-bindings: adi,adau17x1: Convert to DT schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Fix typo in subject
2. Add fixes tag - commit SHA from ASoC next branch
---
 Documentation/devicetree/bindings/sound/adi,adau17x1.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
index 45955f38b6fd..8ef1e7f6ec91 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
@@ -4,8 +4,7 @@
 $id: http://devicetree.org/schemas/sound/adi,adau17x1.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title:
- Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781 Codec
+title: Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781 Codec
 
 maintainers:
   - Lars-Peter Clausen <lars@metafoo.de>
@@ -50,3 +49,4 @@ examples:
         clock-names = "mclk";
         clocks = <&audio_clock>;
       };
+    };
-- 
2.34.1

