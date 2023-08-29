Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F078CC08
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1AAC1F2;
	Tue, 29 Aug 2023 20:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1AAC1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333694;
	bh=g+t4WVUtiwRver+zHy931Z+AemFY3SzuAjUIP8SqPR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HaJN+sSZL7fOt0iOLvnE+UumQv8E2ubJ47LFmmaGOCsTTJoKh3512PLA1j8SG1cMl
	 Pv2s/Te/CFAuowx+GNvuJnlDbKbY6vHEpcRBycJQawhfWAu76+dq9SLxlMvtcfHJbN
	 5fB22j6jSb4GRM7gTHPYz5VEMYHOYIEyssu+g4qs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D8F4F8057F; Tue, 29 Aug 2023 20:26:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01529F8057F;
	Tue, 29 Aug 2023 20:26:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98C6AF80527; Tue, 29 Aug 2023 19:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68D84F80155
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D84F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=UIFYLrNe
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-986d8332f50so603792066b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329448; x=1693934248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rlz17GtutNw1PX6avQfyxd2FJLVbt0FbIToHal1G+vU=;
        b=UIFYLrNe0gh2pAwnM5MUnuNxEI2N+C+hDeO1RoxlyGw+Dv05W/dM9XAythdMCRIY6K
         Z9nxj4tt6ACJ68ny5AJEt3T2+Td3iRnGFXuDpEEGOKu1ZCi0/xj3r9ftMwbIkD3G91Uu
         U+ldak5sol1qkR+3XD7+yUG1TLmaye0xeGMRwwNqpywQVNXSCXTHRVBbLJQJvccZ/LA9
         LfsLtbCwvE6VCGJqblgyPJH3fqOZ+8kAGnBFIBXvtLQwOoeNKDHvfHDNfwl+3UeJYtEU
         h2pnzMnciPjnl0iSQaYBcpSKtOHjUkwuAJ9DiY+9OzRXC+sMbSIofwBZCO86tFcfg3tY
         qkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329448; x=1693934248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rlz17GtutNw1PX6avQfyxd2FJLVbt0FbIToHal1G+vU=;
        b=UC3kTlKrNCvDjrZL7/RdEWEvfGWFGO/sxr23kFv47hfdjePtLfz0Wp4cyRGX/7K90x
         0uH4ajs2bdtuS0/WjraccwuPbC65UQbzsQPHFcKYwtwoxHL+RJ2mCOysC3tw6KrLOlIz
         4B8qXDSOFm2T6MDwX6nw/Jo+/2aLAzAt5j4zYodYaqCmmQtCGjRklrOUFmXhX49SMGaH
         9fL1IoLKMITpb0OOSiNHF4EalrHUUavgFXIpAJm1kQ86ylNKA6AtMQ7xXFeH2Ts9OFbs
         RrdsAj/kj+9aBD/ri9RBVTnwBRjJZtmsyRiDoEetWn1cE+YdDtc7EPimdmSE7i9nwuBL
         Qjnw==
X-Gm-Message-State: AOJu0YwucKOOBxwse09kfYPlpsaAiGmwwj89ML552d0/nF1aqBlCW7XH
	bAzSMFBVLQBn490UXl1Gug==
X-Google-Smtp-Source: 
 AGHT+IFFkEkxU6fLi6B7Qfna18QFEfdVNppGwFK63NpwdhfSCbGPZ5uGzoW6mAq0vfuONXZvjcBGNA==
X-Received: by 2002:a17:906:8462:b0:9a5:81cf:57b5 with SMTP id
 hx2-20020a170906846200b009a581cf57b5mr8395816ejc.2.1693329448163;
        Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:27 -0700 (PDT)
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
Subject: [PATCH 04/31] dt-bindings: arm: rockchip: Add Geniatech XPI-3128
Date: Tue, 29 Aug 2023 19:16:20 +0200
Message-ID: <20230829171647.187787-5-knaerzche@gmail.com>
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
Message-ID-Hash: 7UBCGM2INK3OAHZKC5SSGXMHNVMTNY2Q
X-Message-ID-Hash: 7UBCGM2INK3OAHZKC5SSGXMHNVMTNY2Q
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UBCGM2INK3OAHZKC5SSGXMHNVMTNY2Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Geniatech XPI-3128, a RK3128 based single board computer.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ecdb72a519cb..e4c1af691b7a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -227,6 +227,11 @@ properties:
           - const: geekbuying,geekbox
           - const: rockchip,rk3368
 
+      - description: Geniatech XPI-3128
+        items:
+          - const: geniatech,xpi-3128
+          - const: rockchip,rk3128
+
       - description: Google Bob (Asus Chromebook Flip C101PA)
         items:
           - const: google,bob-rev13
-- 
2.42.0

