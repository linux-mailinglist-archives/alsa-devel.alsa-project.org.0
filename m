Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A87B3EF8
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47D1BEC5;
	Sat, 30 Sep 2023 10:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47D1BEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061234;
	bh=JIQkC+0Be4DVYZ+uaLpvlmzAMgNRpGBFxiIdL+YbT3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ooKeDC1PWaCmxAKu1MZ4zD+MrjTt+sazdnZ+88rCKvo4JD6zd08frfVnhzzAyp+6y
	 CGuBm0TY3py39ugnZIGohFn7o/BuYw9FIuXVi+CS6XqpUUb6wlXp8UulhAmOBl1Hss
	 IuR/TZZ0n5aNap73A049yKsPy0jf5aio4ZdBJwCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECCA1F8057D; Sat, 30 Sep 2023 10:06:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBAAF805CB;
	Sat, 30 Sep 2023 10:06:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A995F8016A; Wed, 27 Sep 2023 05:36:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7766F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 05:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7766F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=TzzDq0y5
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3af592b8adcso131999b6e.2
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 20:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695785777; x=1696390577; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=TzzDq0y5TidqYYJ1uWFuc2Wz8/OfYFrpB3XjwfJhG936f3y7To55HjOZmlp/kE+5Hn
         BbnsiK+VjrBv4WB7dDcalRvS2wluvFzkEP3VAaGonN5wlBzose9JXcpuGd41MsZnxSnd
         R38s3Gt9qN47BSurGNRfsMZJwLGVaV/csbcDTKDC6zG6eF6uxYfHp9xN2xW1AYnWrPD8
         3nQfV/AnNwxzzl0xq+OH3GtFWTRUuXeq2tsHpssBzsC7WGm3zd4hv/fHslBbphEdmra+
         9cxR/0BMhAEyTClN+XUlZtyJSS1QgZ6CqW26sZXVBGos4bwKyFlyPjNk9rXGrgloYxVU
         GwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695785777; x=1696390577;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=G+qy7Xw8KuSpabviTLgGv851KBQBVLUbLIH1cGskkDeDtQq7M9MZbFzIAQ5VBrNsKd
         gI+LuwLX9UC+8gX4R4UybjwE2ASRzW8TAVhIZC9gHBQkWncHlCfbOi9JSTpOaDjBn2WR
         5SuQC8H9fm1c55NvM+qx9NJFMCjzIZQ3R2f+76ldC9VUsXiFLKRsC/kIhrGfX7dy258Q
         EV0CzsXym+IzZqeXjgF1pOohef8HrMYercW9Dfsp7V6Bd8W1Ou1l3Uj7aL1PlJ4XhQpU
         APZn59wCuY9uA9DVeiwp7DPPiwgI1+m2IYp5o774velBe0ZI0aVSNvI5FuWzyxjbif3S
         /t2Q==
X-Gm-Message-State: AOJu0YxY0AIYDMwXmcjcU9V5Ll1Z/BU4ITLKE/xShunUGc2BpRz4aINl
	U6/UlUvGwZNginw6jKPtc0Wj4A==
X-Google-Smtp-Source: 
 AGHT+IF5BZGUJqHoSLfj2DRjoGpLaQUe5TymCxTzLvix3ZvUJ19+rOA82XgS0T0SdSB3e+in1QNEEQ==
X-Received: by 2002:a05:6808:141:b0:3a7:390c:4c43 with SMTP id
 h1-20020a056808014100b003a7390c4c43mr859936oie.50.1695785777090;
        Tue, 26 Sep 2023 20:36:17 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b006870ed427b2sm11067570pfo.94.2023.09.26.20.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:36:16 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patchwork-bot@kernel.org
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v3 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Date: Wed, 27 Sep 2023 11:36:07 +0800
Message-Id: 
 <20230927033608.16920-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20230927033608.16920-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20230927033608.16920-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LOWSFX7LRQEZGJP3N5WOYO2BPVPX2N6L
X-Message-ID-Hash: LOWSFX7LRQEZGJP3N5WOYO2BPVPX2N6L
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:05:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOWSFX7LRQEZGJP3N5WOYO2BPVPX2N6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "mediatek,mt8188-rt5682s" to support new board
with rt5682s codec.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..4c8c95057ef7 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682s
 
   audio-routing:
     description:
-- 
2.17.1

