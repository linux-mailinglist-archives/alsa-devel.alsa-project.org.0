Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16234985C5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F1E28C7;
	Mon, 24 Jan 2022 18:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F1E28C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043934;
	bh=Qolsdtak86SEENTZPUaLfQJjKAa7MJpZCa/1z9a9wRg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDxOvMFnLCQlJWrsP48lKQMO+JuV1lfxe3gjtsmIjiyILqTz46c/lP87tUDsP08Z6
	 uaZ62Ps0vafXUG7mFwlP9dCWvaEmdmfE2xPMdSTKISk6QFeWMrGhiGqxCFr6XlBjeb
	 V3RknT7k1T55uemX1soHG0Y5AtJYKbCEG9WMsPlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A93BFF80163;
	Mon, 24 Jan 2022 18:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D63FF8030F; Mon, 24 Jan 2022 18:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E818F800E9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E818F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="d7VVSyyF"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8AFC3F1CC
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043863;
 bh=WHnGp+/co0yjLFJTld0gSMGvtw/E8RuZJ7zwbzyKcNU=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=d7VVSyyF+NkJuWtcFqfiTy1bh0gXByt5RSO28+WJtOwe+M9SKalXD3osvvcrWQeWo
 xYmzbQ0uuBTCkzgzpS3Zwk98kFRloZSe8yiXiXXOICRmFTvwNlSbqvyXugNEAW0qkL
 Ar4AmfrfYa6sNEXrV/jBjLh4KeACLtme9TL/E6MtLr8XMAq2ztvfpM7lGYmZP7E3K+
 KkmrYp7J1wrA25DoCB3DshOcaMo5yLVcWE7e6ulaLwLAmmp0kx+ZPjmhl57/VqE+mx
 8f40cZPxR/CrT2018G3oI88sbPc32/9Oe6xJxgVleNvWTMomXLO7PWkSz24lD10RNr
 nuwGMcrnwRkPA==
Received: by mail-ej1-f71.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso2345468ejj.4
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WHnGp+/co0yjLFJTld0gSMGvtw/E8RuZJ7zwbzyKcNU=;
 b=McFm4BwPZ6ekZVXnbaiaX3Ky0RE1boQ34eUYslCmxV6HAx2YXiwmzb4OGMh9XwzKO0
 lbk5l1/Q7rkLB4IJNDsXWUZO1bfi+9y0Ivi1M5X2bmXr0VXnymnROmq26mIdngIi91It
 /gIqtpEi/SDABhstISTo8xMHUBz22Zrymt1WnNobire8TLFRKym9XSUyubpVVLoLsjva
 x8Wb7NHVIZdVFrK90AK1+yInvDneaGfZyxRDYBZpxrfXIPPT083JeKmEXhFy7WWD88KU
 NPupWNqxIX6chLAHXnFA0bNna4SuAgy5n3OUVc9CFr9hHMkroS3nJz7noYwC6gVZ/uAj
 1fXw==
X-Gm-Message-State: AOAM5312F0CP1S/fOOBvsnuJplsxCN1JkIxvD1qnSjgo6/s/uGe3aosm
 UjDQQ6ukbXrtmbTVIaSF2arCi/2RQr3eH4rFriGpFmw4AHvGnWf/AeFIr6VUpM5E7CF0ItLcHVB
 K9o1qS/tBwWQDT445rBMgFYcFLG53/WcAz2S0P7Xi
X-Received: by 2002:a17:906:5596:: with SMTP id
 y22mr8179352ejp.8.1643043862520; 
 Mon, 24 Jan 2022 09:04:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylydnv9+0HE5iRBYqNGtKIgdOAVkwlbhJwvlM+lFHa3jNFMGCzlCqPBbQevZuxHqp1bGdkMw==
X-Received: by 2002:a17:906:5596:: with SMTP id
 y22mr8179330ejp.8.1643043862324; 
 Mon, 24 Jan 2022 09:04:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] ASoC: dt-bindings: samsung,arndale: document ALC5631
Date: Mon, 24 Jan 2022 18:03:33 +0100
Message-Id: <20220124170336.164320-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
References: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Arndale audio complex might come with ALC5631 which is compatible
with RT5631.  Document the compatible since it is used in Linux kernel
sources.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/sound/samsung,arndale.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,arndale.yaml b/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
index e7dc65637f02..cea2bf3544f0 100644
--- a/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - samsung,arndale-alc5631
       - samsung,arndale-rt5631
       - samsung,arndale-wm1811
 
-- 
2.32.0

