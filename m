Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8982576F
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 17:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C00E9C;
	Fri,  5 Jan 2024 17:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C00E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704470480;
	bh=i7un3vONZnr77R7B2m9eLAG2l16u/2NVCWr/W91lMOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DpYd5SY1y5KtSw1qBKcwMYFtUBV3cWVnaRmhKNDipLG4biVF42ZrQZ8chsNqYSwd+
	 ayCbOXwMGC7xmj1pCGxZkQunpOF+MIE2/VEU/Q6oQ+BI433bURQeZOMm341tVFd9N5
	 6/CsabRLP2t9z8SM36zY7NnrXBgLfs6Q176p9eL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01F57F80612; Fri,  5 Jan 2024 16:59:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06283F8062F;
	Fri,  5 Jan 2024 16:59:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68DE4F805BF; Fri,  5 Jan 2024 16:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 291A4F804B0
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 16:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291A4F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s4n1xXB6
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d41555f9dso16717495e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Jan 2024 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470369; x=1705075169;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=s4n1xXB6M1KzMuQ3qt690wbTWvjzmrNkVGSgFvw1/ortei4UOmmxaZol2Q8RCW3Kbx
         fh7Y42NT/matyeLvlrPkHDLOeJG6u3qo2fKaPrJv+5ICHCjkkuDvO2R9U+VXW4/fc2PQ
         PBdDdmqSN70iFKQLoFfohqJrtBhj1TsvEJmTeWk+BdJyUUuk6pwB0MXSOA9FhzROcge7
         1CKxAs91Kz3Rmbm6/q4j2oxJOpBpqz4SGfgkpmZOXDNahY4IDHdiQjl1sg5rSs7R/Kze
         l2Favr3lXFjiN1/sBqcSw+tDTwEVdeCtVRVdmuXojRObNfUjYJ2mcaDCC444xwf02h51
         C4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470369; x=1705075169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=T/ELgQ4W5JNXf5SzNQwS6XxKu6TW2V69dbEo1Z8ecdywBho5wogQJ7ctLZOmYpHsny
         Phyw03FNxh3q1svgU/O1qjVkdSTfveZcR4Ik6oo/eDIJIHAWjxvWzd/OHc0bC3fqwbP2
         beJ4zuvw7nzdSNSOO8i8/mOijtpyiUc3vHkvxT+G2wHuTox/tIEBhbQKFTRjpVRIaCF3
         AMqi8shAKBDtpCg9gOafveYmAqu9bMBfN/YX+xuHD4qPz+b74mF8PEMnL4rMc/1q3LXj
         XK2Lx5TcLh5nPx54hB45kK8+qrRSdoPrHaA3etcEAuj+XvBLCRt9yhYmYviZDyY1y/ZL
         JoZQ==
X-Gm-Message-State: AOJu0Yyjt+hzxlTorMpk5B9V8MrOmZQyfvRq8QwTtUwgq04p/niBGsGS
	+wRoOQbKpQCHM+qd9O+tH6SrHzsaJwi4uQ==
X-Google-Smtp-Source: 
 AGHT+IH5ut0EXwmAZDo/9DvX++hIFWHA1Cpb3/Vc1PS5kLNAcDr62IMg/U92zdOSnDTc/Xtlv/jLDQ==
X-Received: by 2002:a05:600c:1f83:b0:40d:355e:ab90 with SMTP id
 je3-20020a05600c1f8300b0040d355eab90mr1335180wmb.67.1704470369044;
        Fri, 05 Jan 2024 07:59:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 su8-20020a17090703c800b00a29910a9366sm326024ejb.8.2024.01.05.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:59:28 -0800 (PST)
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 3/4] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Fri,  5 Jan 2024 16:59:17 +0100
Message-Id: <20240105155918.279657-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PERDO5VLZVXPJED32THRJDT7EKKYEH6T
X-Message-ID-Hash: PERDO5VLZVXPJED32THRJDT7EKKYEH6T
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
Archived-At: <>
List-Archive: <>
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

