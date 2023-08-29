Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5678CC07
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 841A0AE9;
	Tue, 29 Aug 2023 20:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 841A0AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333679;
	bh=cITMcTod7vurhCmUWCmtAt3VhQfw9hYnbxchVLoaKmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fhCPZ+t/rSZQ63bAtv8GtTPI7RUyP1amAItMmo5i9+6uzEtdXUrvZD+bFWR5mJOfr
	 7M1P5gvtOIKHMZkUDDwMwoaSp9Y+RN/fsRyv5BdTHAXc7P0K/+FRJpDVvZ5s6j92k3
	 //Z9mdivvOfT7Bdedrc33eI/Cq2agg+m5FiVxOFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E38F8057D; Tue, 29 Aug 2023 20:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 999C4F80570;
	Tue, 29 Aug 2023 20:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88A5F80527; Tue, 29 Aug 2023 19:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 061D4F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 061D4F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=NKjq2NpT
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5280ef23593so6119446a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329445; x=1693934245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21iVkiyaMhIOgRnviPspvm+tAmKdNHJ4HpDL49p+DgE=;
        b=NKjq2NpTIzwWtsb4WQ8JGYvGWyLJPvx0NmmkaWHXoHsK2bUZZOLSZlh09hYMZQjyNe
         YRJebTQvSlvRhwarjHsEhi0stN7D8UajKYGCZ3BbcZfLWAg1RK5gHyP0IqpmY0cDuAU4
         aRbXPvPTgdpOt7wC7BTaeD6lmV+1idIhZ3g3RGmvQYqFI+CrnXPcrkLweYOID+NGHEK0
         DRBRLt+Bdc5LLin7QH6zusukVIw5lnnj3z/4E/VDQxPCdazNNIdrT7quG/nRuF3Z/XWt
         gj9SKxmkGlyI3H22Mf9FhJKBQhVJqGWFmcuHK0PaZwCl5qNDJY2RuX5Mr/GDdzGX5RL4
         9TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329445; x=1693934245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21iVkiyaMhIOgRnviPspvm+tAmKdNHJ4HpDL49p+DgE=;
        b=L+Vw0NvWPVJjJNriMdNa8FNZfZS9vrNeZZfJUKRALlGeSwn3BptEz7J6DIBT4uwqoM
         UsTy6p3rDLnG0MKiFpDorsEA9vNNMh0rSG7gBhJhHaUqu6Vh133Bd8p0tFn9Zo3+LS2n
         guH+/4rdRjv6GuDrPlo0KIi6PjNZ7JqpgiQdFEtb7g/Nnsbbmsb8Pu0Ta5IA9i4vvQU1
         hlmYY0dMhkIJDXgbcmc5I65vtc85yNWFU+dfeAIWEmFxark3Nm+onvIVS9m+Pt14zBwV
         DPiE23XN9MlJEzM2GEitEfNo5QalL6hy+Pwq9rGOjR763H/PF8y+zoH7jAv8VIMuJ8gP
         Kgwg==
X-Gm-Message-State: AOJu0YyoZMW8O0Uld3Xbwxs4Afrc6/cil4u2+uxlzwG+eBjyON5Iddfx
	2xgScBFqWzUVVhRBh0kNyA==
X-Google-Smtp-Source: 
 AGHT+IE47kgzk515LSlCQdCMRZcljVGwTMt+S3yLZvAE50B+UB6aWy1SLTFd1oolF0G2c8xX/aHgtw==
X-Received: by 2002:a17:907:7788:b0:993:d617:bdc5 with SMTP id
 ky8-20020a170907778800b00993d617bdc5mr22834649ejc.37.1693329444970;
        Tue, 29 Aug 2023 10:17:24 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:24 -0700 (PDT)
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
Subject: [PATCH 01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos
 compatible
Date: Tue, 29 Aug 2023 19:16:17 +0200
Message-ID: <20230829171647.187787-2-knaerzche@gmail.com>
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
Message-ID-Hash: S5QOPFS73DW6AKGSOLXPEDSPK4ZL4GWB
X-Message-ID-Hash: S5QOPFS73DW6AKGSOLXPEDSPK4ZL4GWB
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5QOPFS73DW6AKGSOLXPEDSPK4ZL4GWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document Rockchip RK3128 SoC compatible for qos registers.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 8103154bbb52..089ad6bf58c5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -61,6 +61,7 @@ properties:
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
+              - rockchip,rk3128-qos
               - rockchip,rk3228-qos
               - rockchip,rk3288-qos
               - rockchip,rk3368-qos
-- 
2.42.0

