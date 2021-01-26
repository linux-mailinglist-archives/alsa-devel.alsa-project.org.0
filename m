Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E853053A8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 07:56:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA4E1764;
	Wed, 27 Jan 2021 07:55:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA4E1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611730593;
	bh=Z6at7IY86JMDVOqRlODNwiHdPs1uFMbDy4R9doyWsHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nqUIjiIAqb3eD7PSbRt9h/ILFdeSCQf18aCerf9skIsupej1cxkWnF7slHkr7Zb1T
	 bTEYaKCbMCyPJLjEp+KVhWBEgm4fhN2F0K3m/oK+wAaoS+ILQFgK0n0alA89lVX8Qb
	 7pIM3vSIaX6mxULmR+j5mMg2wWhrvztH38jy8I7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FFEFF804FA;
	Wed, 27 Jan 2021 07:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 076C1F8015B; Tue, 26 Jan 2021 14:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDD7BF80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 14:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDD7BF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nreZNHla"
Received: by mail-ed1-x535.google.com with SMTP id z22so5030906edb.9
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJsyBSQ5fnIh7z+EGO1ct3NYyuJeKMfKI26SOZHy/5M=;
 b=nreZNHlarXxqqf5v1K41FArfFksX47QMYvpuQazuFPHcwCsFArVTbduVnLIzt9WudS
 TV8fBmKsTd6KRZXO+6PmPol6JoQevANIt/52yoKVyl7u7SOoOLr1JaKVIIBURin13/OS
 ozXZaN2EPwkbo5YSiSjLBn81LbdbKH14+6EUwaxblzZXRq5+WCCvCJmFjTFManR/E0Ml
 zFr3Tk1CYCjXMJELN7gy4dBmw/5tuQTNDQGrds//v6ZcmvXvGYwQmcW2Uwizfp5yJ08b
 LpFFLzJbO0gbmSnkj8OzClOly8qROT5daNyeuDJWHIXgEGW2Zk27TvJNn6Sist2aTXSR
 6/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJsyBSQ5fnIh7z+EGO1ct3NYyuJeKMfKI26SOZHy/5M=;
 b=GPaPqMnWiHJZWmj1Y0A8xPAi2kdLbZqXSrRo/AzRyGp9nJVYUanw0DTgSAsrLtxk2D
 QijqIc1Q7U+8UNXoCf226ZL4Il/ui73V492eu1Qa0pWWjl6M4h0Kw6Q+62k5eQW/ir9a
 /DKYhHmzuZeYWRtSEIOYEI5w2ar/k71APY+3BuuTYZdY7sE8k6kZo2arvqoE96fYXo6/
 dvk3n+8OirlE1vhTvKbci2DgSdPg2oEewNf0Pi0gyFdTAfePtlY7xp4TxoRPIbw1f2y2
 9516CDRjvJB/Tt2Kzq7VlB9PqjwzuhVp3d+a1g3I3XKgl4bAefGU8n+B3zuGJjdfsPiR
 4c/g==
X-Gm-Message-State: AOAM5326semtUkCnvX4J+fLd2riHmXJMbfjZiFyfQoGA06T3LJkWWPj0
 AJrsK0mJAcoIQtdtvSDa6k+xCQ==
X-Google-Smtp-Source: ABdhPJxbhLHk4eGRreEqF4cTHMfjlD/b2feroKVc/aXltYt5dPKG1lCH+uD6Eh2WG04mPRzB26UreQ==
X-Received: by 2002:a05:6402:438d:: with SMTP id
 o13mr4500539edc.135.1611667577953; 
 Tue, 26 Jan 2021 05:26:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:65c9:91eb:731f:f2c8])
 by smtp.gmail.com with ESMTPSA id dh14sm12236010edb.11.2021.01.26.05.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:26:17 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: linus.walleij@linaro.org, robh+dt@kernel.org, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/2] dt-bindings: mediatek: mt8192: Fix dt_binding_check
 warning
Date: Tue, 26 Jan 2021 14:25:31 +0100
Message-Id: <20210126132531.2084711-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210126132531.2084711-1-robert.foss@linaro.org>
References: <20210126132531.2084711-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Jan 2021 07:52:19 +0100
Cc: Robert Foss <robert.foss@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Silence indentation level warning reported by dt_binding_check in
order to reduce noise during routine checks.

$ make dt_binding_check
mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
expected 2 but found 3 (indentation)

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index bf8c8ba25009..54650823b29a 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
 
 maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
 
 description:
   This binding describes the MT8192 sound card.
-- 
2.27.0

