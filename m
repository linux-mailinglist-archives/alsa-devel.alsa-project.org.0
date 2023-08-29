Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C100478CC1E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9C2E96;
	Tue, 29 Aug 2023 20:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9C2E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333871;
	bh=eQsHZ0ILnbzZnvNv/9wGG3s8uLuYyHZHVwG9GfAffMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XzOmeyplAxLPVkeQCG2veLLdXUdWZbY7wBtBt7lY+YCWubmpOsauwTnYbXmim/+RR
	 AzPU9ErLmixVMaZryFDumpmulw2efcXL0A4mF3dxAKMCaQfK3Ra0VqJtV8xcUYjMTb
	 Q2suDEsflWXvgEBuhf8/C0QyhPbktXsr3xMilqvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F72DF8061D; Tue, 29 Aug 2023 20:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F65F80617;
	Tue, 29 Aug 2023 20:26:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2143EF80236; Tue, 29 Aug 2023 19:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C933BF8057A
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C933BF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VUixQxnY
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bed101b70so580717366b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329460; x=1693934260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HORfKlZ4SywXOGQyingnsT/g0xzmPt7r0h5GBjv1Y2o=;
        b=VUixQxnYtqHbxNxKsf0ASLykcCTVDBNkGoP6Rm38KMc6AILysWa8b+lFKAXuD5qslG
         UyjCBLmFLidSKQ0RY7WXdCaq6jbPDDNTkPudF2VqWSQyI8Jia9045Tr7UoVbpy0vadyi
         9I6hOEzja2RK9gkAfFgcBIrsuoCw0g17m2Dt7ih9TXDbMk7/TUdsAaZ/iWM7ntqpdij6
         psUVG0D77RiEOIT04TFhtm/3QirUtJ+5sT5JehV7cPLhkUdT7cql53AtvV0XhVAiaG8R
         +Glt9LWtL2p7QnoIAZznkypP6rY57aC9Sy3a5iDARmcIanhYxdE2wGgn9IpZf9eoxiA8
         aNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329460; x=1693934260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HORfKlZ4SywXOGQyingnsT/g0xzmPt7r0h5GBjv1Y2o=;
        b=FsjDQm1UZSe3JE7k3Hsc+7TyqVlfNCSQL2wcIZZgUwEU2geGary2AlFxQ6GKY5Lot4
         fp7ce9mpF2Hntp+DSNbmQ2A4UxQL/fQ25AVFYlm4inv8BwKosStUw+gM16k9smZT+5Cj
         AyVKNmFVAEctxrx7E4b5yHRHra01LuDrJ6YNkTh7SXo4eWvVIo2m+FLvhGHQolBAxN14
         8NmD4POvWcH7/cwZv5wtpnpCAnP2i6p0lo6rLdvQunzM6GA/QiK09Xr8C6wBddvXEjP/
         5be3FXISVc4gR5rmKNXExJW/SOKYCnNNEwPdwzgKx+ApCbhQUvMZXzzvRyl8C7jFptMX
         AgjA==
X-Gm-Message-State: AOJu0YzD4iKyJvHAnHJsCXjvqub6r8yUzPwvZf4gBj/2KhHJCtaYOwd9
	Ux69qSwrxZ6hZ+7q3CNWjA==
X-Google-Smtp-Source: 
 AGHT+IG2fXAH6X9U8J0RtkYi3Dw+VWCQIj6fcYHWOgIhpDrIwSbMG6tADEykLLjvIrFhPYjoUswF6g==
X-Received: by 2002:a17:907:2cc8:b0:9a5:c9a4:ba1a with SMTP id
 hg8-20020a1709072cc800b009a5c9a4ba1amr1965327ejc.59.1693329460328;
        Tue, 29 Aug 2023 10:17:40 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:39 -0700 (PDT)
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
Subject: [PATCH 16/31] ARM: dts: rockchip: Add SRAM node for RK312x
Date: Tue, 29 Aug 2023 19:16:32 +0200
Message-ID: <20230829171647.187787-17-knaerzche@gmail.com>
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
Message-ID-Hash: 5JW6EBAL4BTRLPUKEBJWPV3N3IW2I3KG
X-Message-ID-Hash: 5JW6EBAL4BTRLPUKEBJWPV3N3IW2I3KG
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JW6EBAL4BTRLPUKEBJWPV3N3IW2I3KG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RK312x SoCs have 8KB of SRAM.
Add the respective device tree node for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 4d3422abf008..7aba97b2c990 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -77,6 +77,14 @@ xin24m: oscillator {
 		#clock-cells = <0>;
 	};
 
+	imem: sram@10080000 {
+		compatible = "mmio-sram";
+		reg = <0x10080000 0x2000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x10080000 0x2000>;
+	};
+
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
-- 
2.42.0

