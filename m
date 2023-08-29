Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D878CC06
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B46886;
	Tue, 29 Aug 2023 20:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B46886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333674;
	bh=AX8UCMN6iCQbaCh9jIovLxHB9mcadcsh5XYyINEpElk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OX4EBSURR6Po/gqyv3nF27NtJW/CCaPaUS8eZEJDvxEz+eIrBDijgtVLiPqZVoArH
	 YUHf/YyR0jgom/3oXM725jTxtDVpf1McEQYbhfakULAa2ZUTPq2JJAeGJe3zpz+xGF
	 mGwWjcPBZFHKf1IyxonXfMmYHx5+35ttQZ9g7uYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B45A1F8055C; Tue, 29 Aug 2023 20:26:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F4014F80527;
	Tue, 29 Aug 2023 20:26:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BADF80537; Tue, 29 Aug 2023 19:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4547F80158
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4547F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HWwZSJR7
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so612265666b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329447; x=1693934247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwaGmtZUPA/dwS41wMl1NXhL27pNtpsYsBs+oXIwgzU=;
        b=HWwZSJR7G5j/UlzgJ/xk2k5cG0brSXt+VPqGoGnypzwtKwlkY10UxvRwUP+LqtPTLb
         /gSA3sT/uvZwI16Ta7YRBOgqw315u4p38rJzQ1ARmo41k3TgI5bh9Q+2NYWq20txZ46j
         mNrmVV6dQrvyn3tWzsy85kHN3SA9rjmJySwAlKu+cRXAnYBTfZTXyqHEjmUpfORjofM2
         bJvoWqHaoFrHmL+gIQClU6YikQJUwBQraSsVNwP9bLl8qVZCVa4J9tBF0LJedLPNFf6s
         3CAeOwU/qcU9eUyUvDzocAqVbWYEyQIbo35bgDFKUnm1gqcDXkeTQQdfzncZ+h/VFzdM
         S3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329447; x=1693934247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwaGmtZUPA/dwS41wMl1NXhL27pNtpsYsBs+oXIwgzU=;
        b=PYqxi2viu4/4FZ/4pvGezZuA/o1aQplJfyqM0M2T6lJ8DnoLIXN35Pf0CxSI+8Xd+b
         QKq/+xYIknZ4m0OIVGK83fTKIzOmpSr9M92QJWvkmHcUbzSBOgWwXHoRorvE+DS2TGOA
         7YumcLC4NG0OjNJdVMiYfor4ynOZ1UR7pL9TSTElT6gG9hzawMFAjOq/rLCMdA0yON6i
         0URkOkChf+nx1SjOOSre7LQlzGV7usS1xtnPyAxBjVched4GyxFqhWi/8rAsQqiC218q
         Zck8kyIjmVVp83Wz6G1Uo6iinhK26Ep75SbiwQbQ4NKmyYBXtI1sdFsZEu7pijj1KvCz
         G+Vw==
X-Gm-Message-State: AOJu0Yw+himM5GQafiid9+WADQnQQoNk5b0l3hU+KhmCWDWvsFn70SNA
	b/Hb+QUckYPq36IAanuyYg==
X-Google-Smtp-Source: 
 AGHT+IHgDpcosA9S74bQEeR2hEnEpLMTHmHxkazGsrlnCTREbmknY2DDkcIyWAd5FuMN90wtDYQDVw==
X-Received: by 2002:a17:906:3195:b0:9a5:d657:47e8 with SMTP id
 21-20020a170906319500b009a5d65747e8mr1405316ejy.52.1693329447156;
        Tue, 29 Aug 2023 10:17:27 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:26 -0700 (PDT)
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
Subject: [PATCH 03/31] dt-bindings: ASoC: rockchip: Add compatible for RK3128
 spdif
Date: Tue, 29 Aug 2023 19:16:19 +0200
Message-ID: <20230829171647.187787-4-knaerzche@gmail.com>
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
Message-ID-Hash: YJUHYIIWX6WCJKJYCRZ46HEVKLRZ6P44
X-Message-ID-Hash: YJUHYIIWX6WCJKJYCRZ46HEVKLRZ6P44
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJUHYIIWX6WCJKJYCRZ46HEVKLRZ6P44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible for RK3128's S/PDIF.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 4f51b2fa82db..c3c989ef2a2c 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -26,6 +26,7 @@ properties:
       - const: rockchip,rk3568-spdif
       - items:
           - enum:
+              - rockchip,rk3128-spdif
               - rockchip,rk3188-spdif
               - rockchip,rk3288-spdif
               - rockchip,rk3308-spdif
-- 
2.42.0

