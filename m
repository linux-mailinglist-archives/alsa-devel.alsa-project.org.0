Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6BA78CC24
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2754CEB0;
	Tue, 29 Aug 2023 20:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2754CEB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333941;
	bh=tIVAi/iFWx6QC+adC/7gXDr7Lb//8AOlKIEOHzHuuig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LUB9ILU8ia+f5pe83ZzcdfL7yXL++QN4cFiDOG+AyVZTWGmGcpUfu+hhzufhdEN34
	 3OXQNF871GtilKFWxp5NRZHipyA5wWeMplk9G9l1kpDsMR0+EGRCv90ogGSGM3CFq0
	 NCo5KKnVxse/SGBdJ85nKDuPmH9+bYJQ1YlhywZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E16CF8065D; Tue, 29 Aug 2023 20:27:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB06F8064C;
	Tue, 29 Aug 2023 20:26:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A37BF80236; Tue, 29 Aug 2023 19:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F909F8023B
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F909F8023B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=OZFbsoxB
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso601414766b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329464; x=1693934264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TRUGa9PL5nV/dnusn+UwSq4N+QNad+BtpjMEE4na6E=;
        b=OZFbsoxBYbtJUhBBQxapgnMGaORPO11QLmwTffX0UwxhOO9s9i5coEpHA085+055+k
         x2iktQWtW72gYg3DJirC4o0W9QCuzVCpCgg1Gq9TYwIcuteNM07twA6BYqfOYdEpO9Io
         alnN55qzVOZz3qYGtXBRHU8IXdI9kiNllXn0qe8Y0YmWO55RgH6+pi4F+ol+JqpXg43t
         LKv+EOx4qMMSIL6Xux72JFIbrawAGnf7QkvbIwIxHzzB57j5vsQdqpoYujPoP79jWn5/
         5gq/p4lZFDf/SOPeI1jh1UaDWIfFIPHyi7l56l85xK4fnVcmf0s7N1wZqxOpeqdKWFO4
         ra7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329464; x=1693934264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TRUGa9PL5nV/dnusn+UwSq4N+QNad+BtpjMEE4na6E=;
        b=j4FXsKRvPEbiaZovJHhritP//Vi4JRmyqeaFs5437sgDzB92lNlZVFqOYflcbkw5BK
         BnGwf3UW6SYvOxAXFQNpiJWOehPeZ9F8xsV0SfIvpS+NGeTtsnlpP1Hm+ACmQ+j3PaGz
         xLcZwhVJu1l7SJsSBD2BxWA2awTF7RIwwXrEnpznVw71JMsrJQI8lm5oU4fT2l951HbT
         TVx4dluYq15UXEKVeumhfnEy5nxP5Gr7segAtOZ61w0Qm3nvgf5L7pOhv+m/bDmTxAp/
         voFKHEvKbc7sTzA62HRLPB0e/NDTQGdTmOQPHl4XepIzt7m1XDnJuFPLrz2hVqm+5oDi
         al2w==
X-Gm-Message-State: AOJu0YxV4kWKzTUTpdvxAAtY1mXzC1b96z++ItiTEocfshM6perQe9AN
	eWJ+ixegGDtb9D2EblJ8sw==
X-Google-Smtp-Source: 
 AGHT+IHSs6leoLR21rpe27haxf2M/3AjrTL1AjjD92jIJAICN7I5rW7t/aMEMKebF0K+otgr7qN1Ig==
X-Received: by 2002:a17:906:5346:b0:9a2:1ce5:1243 with SMTP id
 j6-20020a170906534600b009a21ce51243mr12595166ejo.60.1693329464222;
        Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:43 -0700 (PDT)
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
Subject: [PATCH 20/31] ARM: dts: rockchip: Add extra CPU voltages for RK3126
Date: Tue, 29 Aug 2023 19:16:36 +0200
Message-ID: <20230829171647.187787-21-knaerzche@gmail.com>
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
Message-ID-Hash: UPR5IVD76SI24SIQTY4PBTMJ3ZSD2ZGB
X-Message-ID-Hash: UPR5IVD76SI24SIQTY4PBTMJ3ZSD2ZGB
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPR5IVD76SI24SIQTY4PBTMJ3ZSD2ZGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While RK3126's CPU cores can operate at the same frequencies as RK3128, but
it needs higher voltages.
The values have been taken from vendor's downstream kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3126.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3126.dtsi b/arch/arm/boot/dts/rockchip/rk3126.dtsi
index 7345bd95d29d..09c40f3d69a8 100644
--- a/arch/arm/boot/dts/rockchip/rk3126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3126.dtsi
@@ -7,3 +7,30 @@
 / {
 	compatible = "rockchip,rk3126";
 };
+
+&cpu_opp_table {
+	opp-216000000 {
+		opp-microvolt = <1000000 1000000 1425000>;
+	};
+	opp-408000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-600000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-696000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-816000000 {
+		opp-microvolt = <1200000 1200000 1425000>;
+	};
+	opp-816000000 {
+		opp-microvolt = <1200000 1200000 1425000>;
+	};
+	opp-1008000000 {
+		opp-microvolt = <1350000 1350000 1425000>;
+	};
+	opp-1200000000 {
+		opp-microvolt = <1425000 1425000 1425000>;
+	};
+};
-- 
2.42.0

