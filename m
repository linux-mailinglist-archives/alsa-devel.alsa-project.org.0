Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384E84044C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 12:54:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7C2B60;
	Mon, 29 Jan 2024 12:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7C2B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706529261;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WL/GRf8A6d6xShfSrmemtwIV2kSJXSmB96stNajK+QIKgMMvOeYgUL9E6k0uDk/Lq
	 nmsIE84uhRJEYabjDH3vZk1JErT+24zhazoL+ZacVwLByWzDO9+HTMAYO3Tc5X+wxj
	 YLSUalERa56LaYOsGJCkhdLZHEqfHThlzcLN9jxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26EF6F80637; Mon, 29 Jan 2024 12:52:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E30ABF80620;
	Mon, 29 Jan 2024 12:52:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2981F805EB; Mon, 29 Jan 2024 12:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85D9AF80425
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 12:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D9AF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S/HxEfTu
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so2501382a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529152; x=1707133952;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=S/HxEfTuu0P9UaRZIy+BhpuNnXqPZNsIixWSYUn0qrHkaA36kW3Zpj14yYwQ+pqYfn
         Ci0lykoADfTCUL3ZTE206HXOhdmGybZkT4IH4PHKq8oSuhim4pf1Lz1xGzQhzrwLXPle
         lE8BcuQY2CxR/fNgEl2SuIxv3YvAUzkAl+NYIGUdy4+vBW8RfnKRcLVYe0gFbxg27X2Z
         uKmDwP2Z1QdX9YMPo/o1e+idDecBdYDp6so42WWCycAgIjwlpu96LD/Q6QDMG7K+xAB1
         2G+UbeB6uPvmYfJnIBi/W4buaH2ykT9wGdEt3teSgTYFCxl/g4mmCVGo/dWtA6V6ypa+
         lboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529152; x=1707133952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=flTgcwwwzCssufA6pUzZrx/tKyQx8UArt+WzNGSEKxCjW0AYoCF2e6Y1BKjofo2GMr
         IQHwfIakmji/nltVG0c4cq1T5fwWZO3YuVEuxRj5WfgaLfPF9vg38gipoGkNtMBy4ljW
         ZKIxHy0K7InWDowIVdgQiEI5ST90JcxApHlaxXN0FLAW9vhuYbVhy9ucYTrI3RvAOnPD
         odDhMOO5qgUs4a30CkHb0WqXU9JgRWkMbm2AkxOC9aBLlH+kCVjT2ZSNHV0l4xSUDLpi
         nQc66VrMpKrPVs/WyhX7kHn6X0quoxM6LowptGIBENwYXCDhbEafM6c8YAfqn7DqVGSw
         EDgw==
X-Gm-Message-State: AOJu0YxQOrM6QKlgSD8vugICrmUIHUKPCTqk9Ctl0dc+7D2jKwsz5rgs
	e1zgh/xgWbFAoeGHp4/H+SextBbIUZUijbd8VwO3w+Cfzm7hIFV1xwVvUpOxq0Y=
X-Google-Smtp-Source: 
 AGHT+IFDB1cwKRTLnQ9gFJhaKmMAvmpkWXV6hf7V+Jjgh/DxIPtnqqWmUvLckWsARwnj54wstPEtRA==
X-Received: by 2002:a05:6402:2709:b0:55d:3787:fa06 with SMTP id
 y9-20020a056402270900b0055d3787fa06mr4268042edd.26.1706529152297;
        Mon, 29 Jan 2024 03:52:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:31 -0800 (PST)
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
Subject: [PATCH v6 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Mon, 29 Jan 2024 12:52:15 +0100
Message-Id: <20240129115216.96479-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5C5B7MH5Q7OYUZN4FEOAOCSH46U34XQB
X-Message-ID-Hash: 5C5B7MH5Q7OYUZN4FEOAOCSH46U34XQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5C5B7MH5Q7OYUZN4FEOAOCSH46U34XQB/>
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

