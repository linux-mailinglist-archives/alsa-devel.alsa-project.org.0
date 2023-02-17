Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2069AF0C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 16:08:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8E5F3B;
	Fri, 17 Feb 2023 16:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8E5F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676646518;
	bh=dMCSTdE+nM11lnXimVhnu+NYShCdu4ojtnfVzoo7GOc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WnH7sPxjd9acCrfYuR2PCiLnG5UZs9LhbL7FWWuqbnJsD/wn48Js3JFVVWDFMVZ6Z
	 PK3SIqQx31lCGVMJD9jpIpHeV90d+xyceXu6nhYv6vr7ZQKCYHATX+Hf1bKejDpZtv
	 LbWtyn09WlHxRniKT60jvuqxniR5ca+jDVUx+cls=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE75F804B2;
	Fri, 17 Feb 2023 16:06:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A4FEF80171; Fri, 17 Feb 2023 16:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17C84F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 16:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C84F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xltorjJq
Received: by mail-ed1-x52a.google.com with SMTP id m17so5880513edc.9
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfR58zk5Lq0Y4NpQRVcnXrMaw/hr0XQUMG7wTZBuFEA=;
        b=xltorjJqnSMn9avO+CAsyd8bicX3NQVHPp2PNAklprp4tJLGKGevWTMcEr34ls0ZFC
         0bR/EVXvyCS4R+RWN8/dbeBa7h0tRyd1m+OL80XEfzI8MHMmrl3exVUscP7io7EsB+Qa
         QjtZEUk+8K0oUV4OYsdx2ubv3woHrCuuGsCAn+WSQf8t8WfDFfBk+kl+6q9C27hg0+Xu
         L4Jj4rmMKdBgC2Sp2oc01OLN3V9PQk5YFyLPYGBC2FN+EyBcpO3JZveG+9m+/Rc+hAVj
         Q085YiwR1p+xvLr36lC9k811UeBquC44G4SKDBBpsaNBjY4Mo8NqL9CpcjFIrPBTfl5m
         zSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfR58zk5Lq0Y4NpQRVcnXrMaw/hr0XQUMG7wTZBuFEA=;
        b=vx4UCRHbpiMWbH6Siod4dj93Qrkg4Dqdpg2f8yolLqZrhpEv18dfPptHWFDcKCUTAo
         t82+/v2nE+3sNrk2s7C6uzYtiRbOmuEGeEZU1epiXREW+VGiYCtgvjowoPTPcZ7RyjVl
         1PItewQbtWKv+2pAJ4fTuYmZpnP0uBNUXgFMNNnT/8UdadyqApvz9R9gjXn2FgL1Pe+0
         R1ZQyv8zo+f0cGz7wxPm/VrftWEGWcY6oojsDy10ygYDpooPrBSPGi6h7/X9Y6DCDXlI
         KotKHN8UP2GE4vhkZpA1DhPjPsCQcPkgx2rkqXD7IhU0SOEa4qKUpAxl1/QMLdhlrDFU
         X5dw==
X-Gm-Message-State: AO0yUKW4fy5O4CBfvE0XUGN7kpPjV2RZaOyXHJvp2oI7ewkT6s+sZjGr
	LSg2GaAY/xcQbxPSEKON28IUdw==
X-Google-Smtp-Source: 
 AK7set/KwPZmBYn2iAIMR26SlMvThSNNLiKnjZs3zyLE9MpxGJ+X05/w4/XNBlegEFA+gRT9U4tMJw==
X-Received: by 2002:a17:906:5a4c:b0:8b1:811e:cd30 with SMTP id
 my12-20020a1709065a4c00b008b1811ecd30mr2904858ejc.22.1676646401896;
        Fri, 17 Feb 2023 07:06:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 fx15-20020a170906b74f00b008b14ba6c954sm2221303ejb.194.2023.02.17.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:06:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	- <patches@opensource.cirrus.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Randy Li <ayaka@soulik.info>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: exynos: fix WM8960 clock name in Itop Elite
Date: Fri, 17 Feb 2023 16:06:27 +0100
Message-Id: <20230217150627.779764-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R2DCMJLCQIO3SVV5Z5FUG2EYZX7HTCXN
X-Message-ID-Hash: R2DCMJLCQIO3SVV5Z5FUG2EYZX7HTCXN
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2DCMJLCQIO3SVV5Z5FUG2EYZX7HTCXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The WM8960 Linux driver expects the clock to be named "mclk".  Otherwise
the clock will be ignored and not prepared/enabled by the driver.

Cc: <stable@vger.kernel.org>
Fixes: 339b2fb36a67 ("ARM: dts: exynos: Add TOPEET itop elite based board")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index b596e997e451..6260da187e92 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -182,7 +182,7 @@ codec: audio-codec@1a {
 		compatible = "wlf,wm8960";
 		reg = <0x1a>;
 		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clock-names = "mclk";
 		wlf,shared-lrclk;
 		#sound-dai-cells = <0>;
 	};
-- 
2.34.1

