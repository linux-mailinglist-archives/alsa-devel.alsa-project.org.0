Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865364A2F68
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331E71769;
	Sat, 29 Jan 2022 13:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331E71769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459198;
	bh=Qolsdtak86SEENTZPUaLfQJjKAa7MJpZCa/1z9a9wRg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9cO0v65hcIrXs+28/TemRmStVbJi/2n+ZTXAqYdZYHTnP5U2Ix4tNN76tBi2SidJ
	 GWNgvHOH4o5jhgdqg5sIxJldTfN4WWgg6UrC14w5jq9jbqgwQfhrhLtGVVaQg+BjRg
	 qrTM2p6ZSXnkLWzQHbFVcnrxIa0xoS2tN3lCj1ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE242F80520;
	Sat, 29 Jan 2022 13:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE6B8F80510; Sat, 29 Jan 2022 13:24:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC7EF80515
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC7EF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="nxIXBXA0"
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 805F13F203
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459075;
 bh=WHnGp+/co0yjLFJTld0gSMGvtw/E8RuZJ7zwbzyKcNU=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nxIXBXA0ALLdeBN8GDiaqVxef49iz4HTbGo5K+WfUScHf8SIHJWG1og/x3F90FZNE
 oql5zpzbnGXb3z2Sxzt3GO/6zNEbKu+izgN6xNJRLrKZlvJhjenuD5Gt4h0BEX4BiK
 hiCoIYzkwcDc5vGjzAdJlb0xJ+WtpxNmlsmbQnPbZQfoNP3uc/q6R8xPS7PlbAnlL9
 J30GyTTjYExEAFXwdAFCDE755v/3lQ+uQ2FQkWRSFz5bppUAnCaOM3JjhZGenJ4Pj4
 Rxf5Hn9ZDsNtRlMKbwQRjlNIQth3PWoDl1g0XtNPDD+2EAxOaRFGY2dcaxj/lrQ0m6
 q0EDdApMcWSWw==
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfbbc1000000b001df54394cebso2126784wrg.20
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WHnGp+/co0yjLFJTld0gSMGvtw/E8RuZJ7zwbzyKcNU=;
 b=JV1tT7Coj04DVnXcKys4zo1w0Hb6ILPlgJ09XiO4L503gX16cR/9xwax9sGufpibn0
 Tg9FDLCGBlW7Jeax3ZY2RRA93pXefoldWaP8wL36cN78oU6NePX56Cy8CChTxsuyZ5ca
 z9c0pxh0awL3YX8NEMHayn2LslEhBTZBOjkc9lsgWBYmwF96J3YyMt/ADJz3nUPZJBjB
 qPUAGOCLIT6HC2oIJh3FTus+EopQ9VZPBTlUrjV9A44zhXUFmb7X8wC+QehgruIlO40v
 /VBNsXVWiq/CdQB77wnruEQw4yv7L01nyvVHbimDA3wOx2arASVPWGGOedbDTuIr9T4t
 3c7Q==
X-Gm-Message-State: AOAM532n7U6PsoWlifrQKacP5SFFI2w2Ne24JLsaAnosmQvHermq2gh7
 Fbg4C6njRksl1WIZhaV/ufSqm73IuTwExH7OhtU5nbbPsNg92ysiMgmNDgSvzCHBlvCwhwocdPH
 /tE6tcfRWeuU14rHI4ElFVY8oRqvVCkYk/uCbtk+p
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr10768241wma.175.1643459075061; 
 Sat, 29 Jan 2022 04:24:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEYEjraGsXvaSH5x5kd6wGHrIGvpR2dGZG+9P2CfNNVi65TtZt1Y5RbfP/w5kfBPlc33FJqA==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr10768229wma.175.1643459074936; 
 Sat, 29 Jan 2022 04:24:34 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm1106875wms.34.2022.01.29.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:24:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: dt-bindings: samsung,arndale: document ALC5631
Date: Sat, 29 Jan 2022 13:24:27 +0100
Message-Id: <20220129122430.45694-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
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

