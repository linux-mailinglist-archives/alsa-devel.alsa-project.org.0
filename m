Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8178CC0C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC53E79;
	Tue, 29 Aug 2023 20:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC53E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333755;
	bh=m/vCTyCzSy0OCWUXs3I1N1Z9W2zoCfW7/H9BqsLIEc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H/9EOwNCGA+vK0BWa1XCEDXQTEacIkWaCel5s5zJeFF0BUAArzC9aZWO5WjHMQH8p
	 zyx4m1zrJuBwZd48efSg4E8OnrVPASvtAxPYRph76Ga4UJSOjpkW/eY5KvLrVRqoSp
	 X1mpPB8EGajKAXE0DxuGSttOnPQRjm1hb9STsLxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87A8FF805CB; Tue, 29 Aug 2023 20:26:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B4FF805B6;
	Tue, 29 Aug 2023 20:26:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06704F80537; Tue, 29 Aug 2023 19:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8346AF80536
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8346AF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=YjhSA4kQ
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99c136ee106so606566566b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329455; x=1693934255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBQAx86WvaOm9XdYlFOZiKDZLABoSR2aNslGbzHlpgw=;
        b=YjhSA4kQm+ny80r016Dc472pNmS42pS1nmBOqM6oVPhNBKNJlGfLb1VzG6ozVtCF6x
         Mlyk33197iTKYGWOJtecIgwjpqlPxkQGfI/pRAOpXj485zDfiV/PQZgJDdgUDsifpH6W
         LVPXNmebt4tPML8gXvgpBgcI6wjLHgTdw+3WflobmCdqdL1TbtTLMeahRuWF8LxtlATr
         IKqdPLOqNzQALqccixO4n4ZLiVXScDyHxok1Foj+nS8E2ValnPtuN4jUWiEOK7qKTwIW
         2H4UL/qePX62A4CF+Z9Lw3aAxUzhqpesyFt7Q4G+715YvpCqNSDPku8LQs0jlfjZU5Cx
         fEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329455; x=1693934255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBQAx86WvaOm9XdYlFOZiKDZLABoSR2aNslGbzHlpgw=;
        b=QLDSv1KSTw1QVsFSbZLV7iohEIeL9Lb6A1xWgiogIX+hlu7YnANvMUwLKv+/0LQ9GE
         bu5A6LnFyVxuukGpNA+WMAPsIVFj91iivZX1nwUcl5fbL0U7i4rglD/glHp4JrkVvQJ5
         5uhnBlGQJWEsT2X10AiAC/ZJH/UolHVngWoS6zBS3XD3ihAZCVgwvfT9Fcqd+TpI7JZG
         dg8Z/TSTkL42takW2OhLoVHMeuuDbFrAa9CVoM6U2BZeZnNB6lFim3VcyQq1GFhGh0Lt
         aQZgJ5TYlwrwtawitC7oE1yBAq75aPYp+0XuAYk17aQHmTPzDFC1MiBkcegwP5/RxYId
         JqOg==
X-Gm-Message-State: AOJu0YwIxVays9zqxmaBRNApVI3QK52IBxkHoD4QXxxouZVK+lxZzB4P
	vzDOYocqqGXCZw1bzICDKA==
X-Google-Smtp-Source: 
 AGHT+IGriq1g6SBECfoMzn6NHKe8g9e4THTgJ8Zp6YWeIKJEJrAB+LeVhbZzVDvMc9306PK2d3bxNw==
X-Received: by 2002:a17:906:150:b0:9a1:d7cd:602d with SMTP id
 16-20020a170906015000b009a1d7cd602dmr14195595ejh.45.1693329455250;
        Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:34 -0700 (PDT)
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
Subject: [PATCH 11/31] ARM: dts: rockchip: Add missing arm timer interrupt for
 RK3128
Date: Tue, 29 Aug 2023 19:16:27 +0200
Message-ID: <20230829171647.187787-12-knaerzche@gmail.com>
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
Message-ID-Hash: CCHJ6I5MAMPHTGURRGMUHHYHNCAH5H5W
X-Message-ID-Hash: CCHJ6I5MAMPHTGURRGMUHHYHNCAH5H5W
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCHJ6I5MAMPHTGURRGMUHHYHNCAH5H5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cortex-A7 timer has 4 interrupts.
Add the mssing one.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 2e345097b9bd..bf55d4575311 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -64,7 +64,8 @@ timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		arm,cpu-registers-not-fw-configured;
 		clock-frequency = <24000000>;
 	};
-- 
2.42.0

