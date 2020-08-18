Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438C248808
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BD916CE;
	Tue, 18 Aug 2020 16:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BD916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761827;
	bh=rNdK9W1AOmsVgzTs4b71/YxspMHkA2WmOKJwTXrPjX0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jdhqCKNmfhMxwYcfBtHgiVMCyxFw3To8IJQ6WBzB0whM7SecGw289SD3vH+eRaWbY
	 dCjptX74xHocbWPe+hvNZ5T6t2FKrJpiWto4KAoCN9eqny/Xsn53am8JEjOVPPYzt3
	 6o/HGpOajBgNMshXDZfVEq+/MOCepGEyiFHW8VB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A41F802A9;
	Tue, 18 Aug 2020 16:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F23EF802A1; Tue, 18 Aug 2020 16:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC127F8023F
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC127F8023F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uCU2VExU"
Received: by mail-ej1-x644.google.com with SMTP id o18so22356485eje.7
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qW/vPODydHKoIxWkakc/8MljLCi8kAbWI/+HlLycii8=;
 b=uCU2VExUgkOdf0CSnU7p7Lwj0HwQv0QnvrEuM3Q4DtTmfgcqJv7lIMg6wtWsqdRNtr
 g5qApET1RisUjddrmMDVQXhqZkK6RUrIg+S1ft2ZwrIEdCpyOHTTzGA/R5EGMsKRwzj4
 SsCX3rMM8bGiFd+wOqh1oFq4CbRFWaVCVBrrUQDeKee+Pz58Bzul52OIZy27Wlrou1/g
 ECjwdYXY1HW5YzJlKL4uu7XevB8c/LCNUHqQtYNviTU3EXem5NfnQcAJiDbq94SJ3owE
 fDqvczWzkV4IwcqGoE3pAqhNbOppeAUqbJV6zwa33ANkAs+92H9Szw3wOmS0e3n3/6YG
 3HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qW/vPODydHKoIxWkakc/8MljLCi8kAbWI/+HlLycii8=;
 b=r/y/3D7dGT7+EmmJgwN4iqar4N/nWhju+1gYtrSXStVwwhymtuoNGb+om97aswNmsW
 GW97jU3cuwBhDPWOO/PhBWu93lcmzQHSZQFJI4sIEWRmuu+/Rbt1oKauq+ak/nOPGEpa
 ll3j4uESX1gLTXjLwfFm2cXmltALB9F+gOi+Vh9i47nTl7CCxzNmkG/sll2HgYgVUUo5
 lKLuGXGZLAk8GvAxZyllcyFMp2FXAoAzkckp7EmBMoNDRD/Sq9WMd9eGakzxSk9TpSDV
 +IbkeDDKlwMbClQjLB9Z5o9YZomhCcuS5KULPs98R19Wn/ch6c+1NuPIfccESf5hrIlH
 yTpg==
X-Gm-Message-State: AOAM531H4TNhspj7/gpg2YNsWzGVWcTBNeCERvI886uhRWHQzVNLIEmy
 FVHOMFEjOEOtTe7Oefc91zQ=
X-Google-Smtp-Source: ABdhPJwoKdEOnV0Xt2tgEw82my/fzFI9XtM+fHHICmtVeMhwZPUpUjoZ/RyxXNw3xpoCDJrZ+yHTpw==
X-Received: by 2002:a17:906:a18e:: with SMTP id
 s14mr20008133ejy.168.1597761456090; 
 Tue, 18 Aug 2020 07:37:36 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id r25sm16222575edy.93.2020.08.18.07.37.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Aug 2020 07:37:35 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v2 2/2] arm64: dts: rockchip: change fallback string rockchip,
 rk3308-spdif
Date: Tue, 18 Aug 2020 16:37:27 +0200
Message-Id: <20200818143727.5882-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200818143727.5882-1-jbx6244@gmail.com>
References: <20200818143727.5882-1-jbx6244@gmail.com>
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

