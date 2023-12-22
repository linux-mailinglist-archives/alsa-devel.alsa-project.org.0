Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D937C81CBA9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 16:03:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E951DEF;
	Fri, 22 Dec 2023 16:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E951DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703257409;
	bh=dFCl4eF4q6jOhZtCcJRDUkXxDHixJSWxJ00/Qwj0Qaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3dIcvJJ5kIEiltpZRWXlaJg3x8uJhzW8w6MX8lVqqXSVY77Ad5mNV6R+9ehlCk6I
	 7v1LmsrLg1fYOeQ8WMVmKPfOtxye140UbrZ2seocD+QI5saF9aYCn2d6N37vyfNl5B
	 LVc4GwPDOGoVtzLv+06/p83rbMLv2DIsEpyzcP9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F35AF80604; Fri, 22 Dec 2023 16:02:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 235D5F805FB;
	Fri, 22 Dec 2023 16:02:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1AECF805EF; Fri, 22 Dec 2023 16:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48F96F800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 16:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F96F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pDZTZr5z
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-552fba34d69so2129630a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Dec 2023 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703257313; x=1703862113;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx3v1qGZeqQnkYVSrY5RSwpGT9fxdZloG/62JqqyTmE=;
        b=pDZTZr5z14+ljqNlulLgKvJ12y5x+a+hCC7JmZYZ2eahuJyhOi2pZbFMleg0yyyJQx
         TmBiidNT1fe7BS/+pHvmp9g0Gxd/osqLNtnJ1ClgUv1gXKmZTCF1fw6Wi5eNcy0JJO4x
         cl4jqXVGcZuAw1524tXOM2D0AXY48VUVSoVq9r3yAHl5cKgDjL+Rv8KBnvLHJ3CQjsM2
         gk8oYCZ1PnqZ3KM8fNUNBljkwyzyY40ldh+X1VNhxN3IIhlOpMPeo9rLkil5cfpTsH7e
         uNokPgN2CoPc2Lqi9wFTfBhWLyiL1E5j8LzNodBi4VVOQEcKeWqwKrhkRjs/jHmonb4+
         jRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257313; x=1703862113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx3v1qGZeqQnkYVSrY5RSwpGT9fxdZloG/62JqqyTmE=;
        b=hh3jgAM3S00tbfM0pScjby9Q5GbC58gEY8jqS8Gos8QIVmmn14XgecVxBkFv4kR/9T
         HviKOSANEq4WmdhShih1YxC1bl3r5v6z78iop+VqwFANhM9CZPgExWeN/4xSzxLSPln7
         f0lDVSS/oxqVB5NC+mPeoxOVEDeIzMjsGxg9wYVHp7cChuLan4AjoxtP234MG0/lOqU8
         iJVD5mOnshZZH6gpZhJNfZ/TyfSSmKjfUYtyUSmwdbgDbRAW6ZzLlesM1PaKtZxI2GNm
         6b/uG8LWIDxKBJHD7a9wH+ycsH2cbz1cxJUG1ifLlyBcZRzL9z6gu7ISZUMH4XMN2eXX
         4cgQ==
X-Gm-Message-State: AOJu0YzigbvtAKDeK9DNyoCFFyotDFIGaI+dduvMJC/DoXpq5dSswzM9
	7VqAQY2128NytLLJpz6G6FnELVo/3GXepg==
X-Google-Smtp-Source: 
 AGHT+IFSkPoU1vTjmyalz79sN5kxTWIe8tnjANHRIdEWKTqQBOahgPnI8lq+LbB2c3LndM4iYEf3iw==
X-Received: by 2002:a17:906:eb12:b0:a23:333b:129a with SMTP id
 mb18-20020a170906eb1200b00a23333b129amr888281ejb.53.1703257308319;
        Fri, 22 Dec 2023 07:01:48 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id
 h1-20020a17090791c100b00a26af35c171sm1275671ejz.0.2023.12.22.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:01:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Fri, 22 Dec 2023 16:01:32 +0100
Message-Id: <20231222150133.732662-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PCIL42WSXEBEHO3CX4J3QMFMY2UAMOCJ
X-Message-ID-Hash: PCIL42WSXEBEHO3CX4J3QMFMY2UAMOCJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCIL42WSXEBEHO3CX4J3QMFMY2UAMOCJ/>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..4b4bcbeba9c1 100644
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
 
@@ -37,11 +41,14 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - powerdown-gpios
+  - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

