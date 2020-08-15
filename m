Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65772450EC
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Aug 2020 13:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667FF1664;
	Sat, 15 Aug 2020 13:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667FF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597490842;
	bh=xczCMJRGBiUN9AMEvVb6iKVJb39HhkFQW7e0K/8AmZs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrgarqwk5mM0sRQVVi5yBU1pxMK4aIDpCixqTjvcvrjeJobZlsHZNjE5b+yaiFmMg
	 +EUaN03pvQJbSSAaN34ro/pJZvmiFXlkpCEkMvlVs4YvpqkotHhCD1YZRwyO5KQ6c+
	 6lnVgL29hzsGeN59jPnJsR5mS4SGcX6SgXImTarg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA10DF800D3;
	Sat, 15 Aug 2020 13:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4827F8014C; Sat, 15 Aug 2020 13:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1A25F8014B
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 13:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A25F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RcfBisNl"
Received: by mail-ej1-x642.google.com with SMTP id jp10so12598214ejb.0
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vsYRcSKJo5heCkEhByxTesr3qnuVqbFBvI7V/761LSM=;
 b=RcfBisNl6UXEMchW7A5g1HzcineDtMdGJxg8pSBUgnHND0LmggU7y/FoNRZZeVV6LN
 kNoLIXGm2vsaptDdsioIb7Q1olsgv5yc9DZ7ZGWYs84pZGUEaSrkLHHsauzmBWiliNLJ
 80chWYLTncWt/Jn7133ZQq7xz08lJlaVVQg+nbfazl1Bn44rEMsKTlSa9ycZI25VWsv4
 3tKh/FXwvsoemyuyw7up/EWnbpZvXB84YUjxwzz5HccfgU5N+sgEKI25flqUq8EgAKmH
 Ot8Ll9fuLtHmGErjcgq0T57ZyaLQZta4Af5awtIVFZs5UMtVIg5YEQBNcaGl3mzJNPTP
 4uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vsYRcSKJo5heCkEhByxTesr3qnuVqbFBvI7V/761LSM=;
 b=GDu6sPILRHkgwaF7Q19QiMXMAscUDxM3LvuZ7vcwkR2UYHqeXNJZJwk6C1+IpyChHf
 fEJpZdd8TdoLI1+JG5AYcgWgMSLUsJRaiQEs9TQ5yqQX5bI5PW7+uhexO/3iy2eBYwRG
 BkzSooxeQC73uThixtdEE8ADl5DFS/fkngyWePo0oVt+aHFCr09PPRBVXFdQCHkgQZrS
 k2sn/qRBuVf9yF9Xzv9qjQsl3VdSC+0pEdq9vysSsuI9MYif+J+DKgD3o/cP/dj6tH5G
 satk0GfQsz2Lsi3FGzC/VxwqtRO2sWrsOv+9rX4CEB7uVhNIW4RSmoG+v17ZeAhoBkLD
 260Q==
X-Gm-Message-State: AOAM531YtkhSJs62wsTrWLaxjV+/KFqJpUrbLAC9kpyGKVHMiBTTAqwf
 s352jWITxCvZ0mFHqsoKg0c=
X-Google-Smtp-Source: ABdhPJyxOEsEOhMyUIA4+Iz32TqEEjVTsSegFwkW+dd6LEVTbpRkB7b+vARNNelBhUeQw25VyZM0Rg==
X-Received: by 2002:a17:906:dd5:: with SMTP id
 p21mr6862906eji.416.1597490686713; 
 Sat, 15 Aug 2020 04:24:46 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id g19sm9106505ejz.5.2020.08.15.04.24.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Aug 2020 04:24:46 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [RFC PATCH v1 2/2] arm64: dts: rockchip: change fallback string
 rockchip, rk3308-spdif
Date: Sat, 15 Aug 2020 13:24:37 +0200
Message-Id: <20200815112437.6662-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200815112437.6662-1-jbx6244@gmail.com>
References: <20200815112437.6662-1-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
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

A test with the command below shows that the compatible string

"rockchip,rk3308-spdif", "rockchip,rk3328-spdif"

is already in use, but is not added to a document.
The current fallback string "rockchip,rk3328-spdif" points to a data
set enum RK_SPDIF_RK3366 in rockchip_spdif.c that is not used both
in the mainline as in the manufacturer kernel.
(Of the enum only RK_SPDIF_RK3288 is used.)
So if the properties don't change we might as well use the first SoC
in line as fallback string and add the description for rk3308 as:

"rockchip,rk3308-spdif", "rockchip,rk3066-spdif"

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/rockchip-spdif.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
enum rk_spdif_type {
	RK_SPDIF_RK3066,
	RK_SPDIF_RK3188,
	RK_SPDIF_RK3288,
	RK_SPDIF_RK3366,
};

static const struct of_device_id rk_spdif_match[] = {
	{ .compatible = "rockchip,rk3066-spdif",
	  .data = (void *)RK_SPDIF_RK3066 },
	{ .compatible = "rockchip,rk3188-spdif",
	  .data = (void *)RK_SPDIF_RK3188 },
	{ .compatible = "rockchip,rk3228-spdif",
	  .data = (void *)RK_SPDIF_RK3366 },
	{ .compatible = "rockchip,rk3288-spdif",
	  .data = (void *)RK_SPDIF_RK3288 },
	{ .compatible = "rockchip,rk3328-spdif",
	  .data = (void *)RK_SPDIF_RK3366 },
	{ .compatible = "rockchip,rk3366-spdif",
	  .data = (void *)RK_SPDIF_RK3366 },
	{ .compatible = "rockchip,rk3368-spdif",
	  .data = (void *)RK_SPDIF_RK3366 },
	{ .compatible = "rockchip,rk3399-spdif",
	  .data = (void *)RK_SPDIF_RK3366 },
	{},
};
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index e8b754d41..2560b9877 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -574,7 +574,7 @@
 	};
 
 	spdif_tx: spdif-tx@ff3a0000 {
-		compatible = "rockchip,rk3308-spdif", "rockchip,rk3328-spdif";
+		compatible = "rockchip,rk3308-spdif", "rockchip,rk3066-spdif";
 		reg = <0x0 0xff3a0000 0x0 0x1000>;
 		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru SCLK_SPDIF_TX>, <&cru HCLK_SPDIFTX>;
-- 
2.11.0

