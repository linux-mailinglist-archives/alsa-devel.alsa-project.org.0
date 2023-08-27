Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D2E789AF5
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 04:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E40741;
	Sun, 27 Aug 2023 04:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E40741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693103595;
	bh=ERjUgwSYeFdskFgJLOFIN4Bd16MGNrDbQDtCGmGYpWo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bSkgpqPxsYU2CXpAdAUEBGN+y1hV/Q2NIsUMawdC/mYOVCiXDuV52ZmoZgkoaNFXw
	 DSn2sCAlPgDzTGPxS/61zB+JNK4H7D52SRzVk38yBo0CXpWERb23fiQSfg1xQwyvuM
	 snODgPYJ2jHbfo0NLMcQG2rgzntbgaLZIZY4TAkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164B6F80249; Sun, 27 Aug 2023 04:32:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA8BF80155;
	Sun, 27 Aug 2023 04:32:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E900F8023B; Sun, 27 Aug 2023 04:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4295F80074
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 04:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4295F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PvFJv7DE
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-34ca07ea55dso7210475ab.2
        for <alsa-devel@alsa-project.org>;
 Sat, 26 Aug 2023 19:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693103526; x=1693708326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApeSjM7hw/lG6tW2IMrrknm0IVFEfBtJMdeIIJl4q+Q=;
        b=PvFJv7DEd1JHac6VnvYdrQq9eNmK4cH2NHSseTh4VxMV4wpUJxwtFwAC7lWr6k1x1I
         /SKDR8ny/Jz6m9FjH0T4IruqOrpi/jD+kU8xlAW9LOp7uXRef/jCFGzoDZB4RY5GZ8xq
         zgf9jEaBzyuIxhfcJG3I5lDdA8R6y48h07JPnw7rdGgh6mOgPbukw/o0wCDmV+5daXQz
         RU++xsHclF2B2F4okWRXbL1EB7OD2MxsZ6XpgU2+r9h54qk2ZiscHRV4hZsBriGS43pD
         Wko3azTms95mvDdn/QNYzatzvfh2VlOjwgE/TlXz1mz8FaQt6aV5JFuFAsxYnJ2AHahA
         vuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693103526; x=1693708326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApeSjM7hw/lG6tW2IMrrknm0IVFEfBtJMdeIIJl4q+Q=;
        b=KJaBQh4PwBAINmg9eRhlnAr1OoofkiFq1FuSMr5aqbJ1X1tE+CQzcyEZ81DAGr21oX
         pq9qQGhHvHKchItUNB0QcvOJtVGE1Gk5hClxxljyt+AyAzrTnNV5aOMI5E4MFhu2hcwp
         tboXy4LlHVYwgSB959SZUAdTH9SML7M0Ppdezr/BHFo9rFdIVb2jTdOeofCS5hFD4Ps/
         uVz+63o8QcHPW/4Lni6si1i7ifrVQPCODZoB8VOEjGUzeCqfTF04PQx9EYbzn90vViMB
         Lg1R1enW61dRulsHBgRqXl5l5c7BIHUpiE4I4s/JoQZoY5VrlO18PTiP5lTJG0GEy1Xu
         B9xg==
X-Gm-Message-State: AOJu0YwcjXqkf8XxgUTGwtOw+xZVAcGo18tZPwzBFQwAmUYX0XkWUDuI
	/AjAEfKjCNS4Yeo4rKFdBdM=
X-Google-Smtp-Source: 
 AGHT+IF9EVO8eUJZilq7N7KAL3LWOobH19T0XMaJmOkjuahDbmBpbwBT4CoIif1djlm2lsBZ5/NWbQ==
X-Received: by 2002:a05:6e02:1646:b0:348:add7:f8e1 with SMTP id
 v6-20020a056e02164600b00348add7f8e1mr15709100ilu.30.1693103526337;
        Sat, 26 Aug 2023 19:32:06 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:80ee:1859:87ec:6d31])
        by smtp.gmail.com with ESMTPSA id
 n18-20020a056e0208f200b0034202d05fadsm1581533ilt.72.2023.08.26.19.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 19:32:05 -0700 (PDT)
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
Subject: [PATCH V2 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Date: Sat, 26 Aug 2023 21:31:53 -0500
Message-Id: <20230827023155.467807-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5RERVRZUFOBZC4MOQHPEV57SFCOKCGTD
X-Message-ID-Hash: 5RERVRZUFOBZC4MOQHPEV57SFCOKCGTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RERVRZUFOBZC4MOQHPEV57SFCOKCGTD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The i.MX8MP appears to have the same easrc support as the Nano, so
add imx8mp as an option with a fallback to imx8mn.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fixed errors:
     ['fsl,imx8mn-easrc'] is too short
      'fsl,imx8mn-easrc' is not one of ['fsl,imx8mp-easrc']
        
diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index bdde68a1059c..a680d7aff237 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -14,7 +14,13 @@ properties:
     pattern: "^easrc@.*"
 
   compatible:
-    const: fsl,imx8mn-easrc
+    oneOf:
+      - enum:
+          - fsl,imx8mn-easrc
+      - items:
+          - enum:
+              - fsl,imx8mp-easrc
+          - const: fsl,imx8mn-easrc
 
   reg:
     maxItems: 1
-- 
2.39.2

