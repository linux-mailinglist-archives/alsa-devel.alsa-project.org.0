Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D67E5420
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F28C829;
	Wed,  8 Nov 2023 11:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F28C829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440360;
	bh=5rXIoi1MXc6LTP4fHcAOGEl/eDq8k58Hr1UM0isKip4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OWj9XYI5xl+Y6hMtLcadwkQl7Tmnbknh3ZR7vF5ntHqx31DWsrzQIPWYz5MvHsvPy
	 QoivxYHS6Qx61Ax0dbZG61vl5EzKFhsYj//wfo9K1SxsRKx/QR2GnP3WtlNpmuO/lc
	 YRr10C9yWd64zldLZOrA7vPqok4CXT2los7nMkbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A45D0F8057D; Wed,  8 Nov 2023 11:44:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E317FF8057A;
	Wed,  8 Nov 2023 11:44:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE7E1F801F5; Wed,  8 Nov 2023 11:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD536F80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD536F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n3sU+2a/
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso48635175e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440239; x=1700045039;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAjfTJh92uvbCJqXeCi670gcjaUuY+h2OqROwS33rLc=;
        b=n3sU+2a/wtdo4lb2xZcb/lE12IEOwPFs3FYlYWfAZOnmuQDs3GVOpcGig1MP07PaL7
         U1R4elZZsMtpuQ09ZMsXfjRp9KNnm2UixGPqk3LXgdl7Zvlf8CYiSYALxBk176QVqg5j
         oNCsSZDyR7JEVZpIVlMyJxzxJveH+XoUJ3vnKifbL0DU/g3wCOUn8JCUMgySdxSz7Fui
         cBZKclj+zQtzEmPFiAwjaTX3lrHIpC7Gl9uqEAv+XkaTGvT+mrKPzVombfgGN1H4PNRV
         Z5ZuJNont/u/xiE+3uOHkLL7rfUL3qzLHhTtpw+ou1h7+RO1Nu5F2VlAXSosMwK0+Ytz
         WDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440239; x=1700045039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAjfTJh92uvbCJqXeCi670gcjaUuY+h2OqROwS33rLc=;
        b=YKTr82DaFV1S4ORR2OcE4Gr6CSFJOQEetwD2PDxiSe8fUAbN0XLR00CM8s0p5FEKeh
         /7+YQwS9s0dBvi2tTu6ek9yUDKEpmnufuRruFJSyTnr2wugdhKUP0MIJDTUAxBJvDRCe
         q0SyNAzwcjAOYTws1LfavJMj/hi7LBZVWBV++UlllDECSmnibBpekqtaOba+fAsw0ay3
         dztfVdNcY+Qd5SisduFJs24nVQHYQ8tn97NBTO774b1H+qB4Wl59BIzyXICFddeJwtuf
         CgW4Ziv0EpKWkBafYSEfcCtixWzGoX4uMQmumF19h4QhnTGu7lVe6wvuYUeWVQWvXe4y
         lXuQ==
X-Gm-Message-State: AOJu0YwoItF5Pw0GvxE6QRrEcnSKPa2ScBpsqwQ61+VSblLv7rrV15Yc
	gJ/NwBpXIk/nIa+krONjuIHN/w==
X-Google-Smtp-Source: 
 AGHT+IHIdIU7uiCUR0CHcHyVefUtJ+PHqY1ijnjV387qyUxWKGaH50797907TE+JsncllGcRuZSEtA==
X-Received: by 2002:a05:600c:3104:b0:406:3fda:962c with SMTP id
 g4-20020a05600c310400b004063fda962cmr1471144wmo.31.1699440238661;
        Wed, 08 Nov 2023 02:43:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:43:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add
 specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:27 +0100
Message-Id: <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPOADZBMZTSAVDMBRJQQG4GOL4C7PBAU
X-Message-ID-Hash: IPOADZBMZTSAVDMBRJQQG4GOL4C7PBAU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPOADZBMZTSAVDMBRJQQG4GOL4C7PBAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../bindings/hwinfo/samsung,exynos-chipid.yaml  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 95cbdcb56efe..45f3d468db7c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -11,9 +11,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos4210-chipid
-      - samsung,exynos850-chipid
+    oneOf:
+      - enum:
+          - samsung,exynos4210-chipid
+          - samsung,exynos850-chipid
+      - items:
+          - enum:
+              - samsung,exynos5433-chipid
+              - samsung,exynos7-chipid
+          - const: samsung,exynos4210-chipid
+      - items:
+          - enum:
+              - samsung,exynos7885-chipid
+              - samsung,exynosautov9-chipid
+          - const: samsung,exynos850-chipid
 
   reg:
     maxItems: 1
-- 
2.34.1

