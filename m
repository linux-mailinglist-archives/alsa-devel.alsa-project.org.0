Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292083A37C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 08:48:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8106084A;
	Wed, 24 Jan 2024 08:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8106084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706082486;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LMjOMfGRL3XvFAZdcv76eGgxXpy0nvXduFpul3KG3ektHhytPJu92oG18SjSuyCkJ
	 swvbIeqmgJnJgZ3FwLrgS2ZFtelKnE6bk8uYwLq5NYDxLJz/H2r8Zbw9/ssbJqKeXh
	 jcxrirDnPN3H3ny6B9F1Dkfn4Ovav78ZM81dC5Tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E68EFF805CB; Wed, 24 Jan 2024 08:47:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 675D3F80564;
	Wed, 24 Jan 2024 08:47:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B01F805AB; Wed, 24 Jan 2024 08:47:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BE55F802E8
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 08:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE55F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WHQMJzlX
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55a6833c21eso3847290a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 23:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082343; x=1706687143;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=WHQMJzlXZSEDKLNZnqdgQIx9e9p3nwfq/oZyEdE6o/jle5XIoEX+8n2ok6zjhsfz1y
         GMlbQvsJ//FTHUFMK67dFhzyU/G3R0JhIAz3flQpaVB+5tZTLDtr8LNqrrjwngB00kdO
         q0i1Q+C2SoDqovUzvZPuy+n/JYKpJn6VTSFIcCTiox+OFuq9wxXWekx0yxvM3rKiDwkI
         vEdBBiEz2GoWgJ4dEqM9jq3wdfBqJ/ECU6hvwYFmZDHAQY7QqqZUrY/lCDOe3TBBhi2u
         RXuDpBz1OOQP1Ybrzo0INmc6hqjEfN02M+d+Zq/ohd86i+bvhsfkwmgfJp3sSGLSLVd3
         UsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082343; x=1706687143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=n8kYlNzZOiYvIO49kowj8GF/xbMklaVjUKueSyg0/QuCHfvX7lpHA3tSz2y793vpov
         HkiCgkQ9KKqLCUI5YDODwdLEl+7gZofVcF5hrcvcsFknDNN5xrb3vTlajzSAfofWMv0t
         +K2SoBfzqjYXhn5xI/q+RHD2dZBYQZ7glu5/FI1km6dqNf/UAN6E+OrRUrLL6Mk69/Go
         LiTMpx59932g9bgP7ersiwFNZL9Cgf8bDCL+/DvROz9qCKBKXpkkzx3N7niNRzRWSjde
         P16iQ6MaKUD8BG5BFEEBXon9KoHx5lWoaJJxOhUt+IhuQAb1faL5Z6bH3ZTAYnzcnrRD
         LCdg==
X-Gm-Message-State: AOJu0YxsPxHLV2puGQey/I9iGEdpUIfih8WYiJuSqQi45odTVV9LJlZs
	YaZ3D18eGXDYpbehsyUifQMml0ZOcvuJ+7TRC4qgfj3ru9UFWhT+H5DIauiy5+c=
X-Google-Smtp-Source: 
 AGHT+IHjvR2GP5elLnS6zJWZVP9iOwh9lBECo8gB0qAFYYejK9jRMliygooQE5Cn4oU3IbvZ9gNFzw==
X-Received: by 2002:a50:8e44:0:b0:55a:7cbf:a801 with SMTP id
 4-20020a508e44000000b0055a7cbfa801mr1929863edx.79.1706082342872;
        Tue, 23 Jan 2024 23:45:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a056402100400b0055c8a30152bsm1306951edu.83.2024.01.23.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:45:42 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Wed, 24 Jan 2024 08:45:26 +0100
Message-Id: <20240124074527.48869-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFYPRUINJDGPEI2RO5VBQ4WDNNGMHJ7P
X-Message-ID-Hash: FFYPRUINJDGPEI2RO5VBQ4WDNNGMHJ7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFYPRUINJDGPEI2RO5VBQ4WDNNGMHJ7P/>
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

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
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

