Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EFF78CC34
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2459FCF;
	Tue, 29 Aug 2023 20:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2459FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334134;
	bh=eRWvX9xkPgRDUS3wm6avOC5VY5AigV/HAAII8zdf/mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j0lpc/CFpOkVs/kMOspNSa6OLixGloKdAJAnU5gvuuzcwThEhzssRXSjKeBRgrwtV
	 ItowjcTgNj76XBR2u+tgHt+eem7Q3iIb+UVL1flo8m5lq6VE0Aa/WprTmln/VM7ebx
	 KnQNooEMrHCJTu8Ys2FUSdKPpUPCyVVfweMCL864=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8348DF806A5; Tue, 29 Aug 2023 20:29:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A1A9F80693;
	Tue, 29 Aug 2023 20:29:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2FBBF80155; Tue, 29 Aug 2023 19:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01EC3F804DA
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01EC3F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Yo/oKwwd
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso71240651fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329446; x=1693934246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FenEPRzkF+fCLIr+dUsskF7AjB/E9ox5j4UlAbRUoQo=;
        b=Yo/oKwwdBrMUMDkG5wvtSq8crhNn4CVhpsSAkfHlafXQiHFiaNCwXonEMR1ZDxCS5m
         8YMbkPO77M/H+V8eGgHCiLqFyL8qhL3LoN424+kSeFvcy4Iw6OTRIVTpSCSdd9tCwDyf
         wK/8ORLWL2an1MTEX9kBbYFORB1c6srfOFu6kASEukKSZlOVd+rDH0qqXHzVYYUbjidp
         vAaJcoC5HbbSkmGx74F2zL0RGWprs9ssIYNMNeCUn3cIqf34INO4z4cFqNir0FJsujPG
         QLxlsOanjUlDMPVQsbzFmL8MlsHmUnyQ97SW1Iqn7dN1mY4qZODbo9MMtiCx+VK0783S
         3AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329446; x=1693934246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FenEPRzkF+fCLIr+dUsskF7AjB/E9ox5j4UlAbRUoQo=;
        b=UFnfA1UOZNQyJe+fj6Cw/0Y8qWMgfsU6BMmb4L7Wo8a4hw2/BQtCX7dBCi80KmW98l
         mwMznGmInJREEpBg509ybFKDynLFEkIA8XrIKXGRfxmN+c/15xehWv+IBgCBTdVdHMtw
         xipO7pdd9g8XTEfbZFzMrcJwRbxwu5f5i21g2RVIBiAe55vocxlOiX8O4JAUIcCPDUdn
         oIsG6RqnVFfVlX7VfuaJ6xzKu9gt6U0WUV8pkCD8FE7g/OoSpko2yYaZ467n9vsiNHXX
         qZDHya+FgZ+YQvVyBYbpe5ZvasJJ3LGm0dHcTREe28Yt+ikuHoGDOI7G13/RWP8uMkW8
         8Ipw==
X-Gm-Message-State: AOJu0YwZwVDai43ZASnwlXVXoDI7CZMhZCoEsR/SGN20CWQzRYZZ9v1i
	Fm6Qjt2vL3Er5xCAXgvtFg==
X-Google-Smtp-Source: 
 AGHT+IHBPt21/CoYA6gAD1CvzSK0qv2qopqh1SeqIwu0FZaxDbZLhuYzC+CMcy5Il7uIpCQK4RaODA==
X-Received: by 2002:a05:651c:1315:b0:2bd:1394:583f with SMTP id
 u21-20020a05651c131500b002bd1394583fmr3610948lja.3.1693329446179;
        Tue, 29 Aug 2023 10:17:26 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:25 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	alsa-devel@alsa-project.org,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 02/31] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128
 compatible
Date: Tue, 29 Aug 2023 19:16:18 +0200
Message-ID: <20230829171647.187787-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: knaerzche@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4CG675E5XPTK6XONFOTZKP4G47Y5HTAV
X-Message-ID-Hash: 4CG675E5XPTK6XONFOTZKP4G47Y5HTAV
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CG675E5XPTK6XONFOTZKP4G47Y5HTAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rockchip RK312x SoC family has a Mali400 MP2.
Add a compatible for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 0fae1ef013be..abd4aa335fbc 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -29,6 +29,7 @@ properties:
               - allwinner,sun50i-a64-mali
               - rockchip,rk3036-mali
               - rockchip,rk3066-mali
+              - rockchip,rk3128-mali
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - samsung,exynos4210-mali
-- 
2.42.0

