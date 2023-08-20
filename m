Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B90781F16
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 19:58:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C349220C;
	Sun, 20 Aug 2023 19:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C349220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692554289;
	bh=8Dnlvdwn8HLCEL4DDM2Oj1woISavzoCV6oVbVukMwJk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c+iP0x2pjezb0cchfIH3KLtPy1qszgVbMvPxO/sRPMuMFH01+soyJ3sWwZ4MKXVz9
	 xLoFZ6BTZcATaSEcKKSKWifSYk3MUdMSjvv0Pu6nkHfnSUTvndtjxWWqaY1EIrjJo9
	 SPN3PBOnWbL3+yGLOzb62utocYSZurHkOnnkWVe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC81F8025E; Sun, 20 Aug 2023 19:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4214F8016C;
	Sun, 20 Aug 2023 19:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AB07F8025F; Sun, 20 Aug 2023 19:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BD90F800D1
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD90F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mhZ2LEg+
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7920f16433fso41793939f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692554226; x=1693159026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXY/Krf60fo7q+81YL5YMclpFtMXwbOMF3FlcrEqWFo=;
        b=mhZ2LEg+30bcqlPupOeWQyaJcyeOtTdxUUQByAJUQ0ZzU4l6oZzyLsY2N02UlVU/Le
         twL5BuPsuNJK32HF1G5daDI/Oynwul+3RXyhYJK3+XyXx6t24IaeWyFwS9PTdlEZyYi5
         8zSeZF3Nw8SN1hVXKRTEkgc9Rf2c6RyZJ4V3Sys+XwE2OmegtUwEFdPElE00Q0gQjYk1
         /RAz9/zLVdwOy0+vQugkySE13Rk7Yr8txyddPRS12525+ZsjYiu+uWdxtrvlyInFpkGV
         Gm/+RVQDcVtymWL0Grn0HXATp3g0EO5IdM90xMsw7SMwRM6IHwMo+khGCVGTsFKmmxhj
         FFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692554226; x=1693159026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXY/Krf60fo7q+81YL5YMclpFtMXwbOMF3FlcrEqWFo=;
        b=A++MTeEmiUTMgCZwvWL2oDVnRdxDcQHg+qE9mVvYR8EDwD69cUBDvp0e5XCdfmLAzf
         +yzCaKP77U9OUXMDt+iP/aH1MP/msePvz2jpgoN1ATIzjd3TNfrN35qYleGfIGspu1U1
         HCHKG0/rMzznCXZ+J/WOZTHf72p/sT9nWneLGP6u/5vge15TJIvkXzg7gU3XT6zkoIs3
         kifiQi/lgKAYh5OJaC90uyyOB7UtY5NyaK6MFfTLagrBIJVfqzxMr2LnVfUM0NFrRWfY
         4EmC91TR1TvysdLDSSZp0dVG6Mk+5Aty+P4gptMA9NwqE0RcnAUVwxGjpFb663jCtgcn
         y/Ow==
X-Gm-Message-State: AOJu0Yx60xiFzV9E8Q6WL0sfDx9hEuWzaNktytKqfLNNE+Rx0d1fyprK
	jIO9nRpkp3P8ylla5+jK6sY=
X-Google-Smtp-Source: 
 AGHT+IFrfP5c5XIMgf3S3xbbTbPNs+f9WD+0g5o9TE7WqZLcxF+SnWESznNvSWXbIC4K02+UoMwEPg==
X-Received: by 2002:a05:6e02:1be9:b0:34a:9320:b7c4 with SMTP id
 y9-20020a056e021be900b0034a9320b7c4mr5584188ilv.6.1692554226129;
        Sun, 20 Aug 2023 10:57:06 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:4e93:5643:7a4:7606])
        by smtp.gmail.com with ESMTPSA id
 gn16-20020a0566382c1000b0042b3a328ee0sm692448jab.166.2023.08.20.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 10:57:05 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Date: Sun, 20 Aug 2023 12:56:53 -0500
Message-Id: <20230820175655.206723-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 27QSXKEUZWUDU2OBEIM4WW3CRHLUAAUJ
X-Message-ID-Hash: 27QSXKEUZWUDU2OBEIM4WW3CRHLUAAUJ
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27QSXKEUZWUDU2OBEIM4WW3CRHLUAAUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The i.MX8MP appears to have the same easrc support as the Nano, so
add imx8mp as an option with a fallback to imx8mn.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index bdde68a1059c..2d53b3b10f2c 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -14,7 +14,11 @@ properties:
     pattern: "^easrc@.*"
 
   compatible:
-    const: fsl,imx8mn-easrc
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx8mp-easrc
+          - const: fsl,imx8mn-easrc
 
   reg:
     maxItems: 1
-- 
2.39.2

