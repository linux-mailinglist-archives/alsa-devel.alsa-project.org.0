Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D27392E9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 01:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7881E845;
	Thu, 22 Jun 2023 01:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7881E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687389120;
	bh=RDNhVWrm1b4YTWmP7UXTVO+WMl/D9hvXSpvyv/KFd+k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bf5/f8hcYU02p2U1eJ4xEcOC/M9aS5E7AEtpKApJful8S2G1ndJVgxzV1meQkGZ7g
	 OGDUuiK24i/0hhd6bAfSNyyw8tYnyX8rwDhlg9pzmB4FWQL1CVM73xvroGEwZRHO7v
	 pDWy6BU3+NIBZz38USWaV+0CGmD8hNCb+6M8EK4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1624FF80124; Thu, 22 Jun 2023 01:11:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68263F80141;
	Thu, 22 Jun 2023 01:11:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C51F80163; Thu, 22 Jun 2023 01:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EBDCF80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 01:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EBDCF80124
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so248463039f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Jun 2023 16:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687389056; x=1689981056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cdXzYmnF96v1E71Zu6XrOKF8Cb4IXXwU3O5Owr5fQE=;
        b=g0N6NhCzUF4IDveX/D2NyatgLr0UQCkwoXUt1tkf6BwdofbDzwhGVKVfFkTbDYk+K6
         lj6FoVVSTdrXRmjawgoHtp+MXwxCPjymkn+rkdSExVMBpO5ae/BxyXg4hHy1XgRfRge8
         ozqPKu9tVX+e9Ey+kL0W1A3mCYKrs0UVKc//LMzHgaa5ZpAJ3sfxG5vM9v3DJ0UkXTrX
         yZiUNf/LRh5LajurElevH8XQgN3q316KWgic87DGoFbgKaCzddsku05qsifklcMvlGUi
         fOtv+CBQn9HWVbbXL98Lv/QbzozR5dNdpZvQe+I+zx0wf0iNfYPq60Nf7v0ykB+b6q07
         9bbQ==
X-Gm-Message-State: AC+VfDwjhWSpe8P7dS9iPktKFFlRU4auMIpCoAY9lnxKYpy1JuqZx458
	7D+Ckax4sFv8hWLZwMqXYQ==
X-Google-Smtp-Source: 
 ACHHUZ5uH+NDPqnnnHYVHfXFn8cPMNXTTm0JQH1Rj/SmPeaUvcuYRyrweK9eZTYGvcZh5/iyNIhF0Q==
X-Received: by 2002:a6b:6107:0:b0:77e:52:a52a with SMTP id
 v7-20020a6b6107000000b0077e0052a52amr13773135iob.17.1687389055089;
        Wed, 21 Jun 2023 16:10:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a02c004000000b0042683fb069csm1704205jai.46.2023.06.21.16.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 16:10:54 -0700 (PDT)
Received: (nullmailer pid 3817127 invoked by uid 1000);
	Wed, 21 Jun 2023 23:10:53 -0000
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify
 "microchip,mic-pos" constraints
Date: Wed, 21 Jun 2023 17:10:44 -0600
Message-Id: <20230621231044.3816914-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P3FFY5R7TCWOY5GIUPR4GYTLWOCCHX2R
X-Message-ID-Hash: P3FFY5R7TCWOY5GIUPR4GYTLWOCCHX2R
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3FFY5R7TCWOY5GIUPR4GYTLWOCCHX2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"enum" values should be integers or strings, not arrays (though json-schema
does allow arrays, we do not). In this case, all possible combinations are
allowed anyways, so there's little point in expressing as an array.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
index 9b40268537cb..9aa65c975c4e 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
@@ -56,13 +56,9 @@ properties:
     items:
       items:
         - description: value for DS line
+          enum: [0, 1]
         - description: value for sampling edge
-      anyOf:
-        - enum:
-            - [0, 0]
-            - [0, 1]
-            - [1, 0]
-            - [1, 1]
+          enum: [0, 1]
     minItems: 1
     maxItems: 4
     uniqueItems: true
-- 
2.40.1

