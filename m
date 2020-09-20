Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFC2716F7
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE051681;
	Sun, 20 Sep 2020 20:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE051681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625655;
	bh=eWiiq5Url4azgTOk6WrrOLGo89ieP4u00auyyK+0BG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sECWBjf58o3+WXu2zWcRNb9+bYCoQOS2OqA0y3drT6uzN96IVqRHfOXF10kuxCe5l
	 eh3dRjmrc+a4/8J6WjeMAq687IT6hfHuVKKgaomjMFqbl2cq0QiCYmxTLFIr0QSSg/
	 ADZJpFVC0mWkvV2y3i0EPbM/mPBo7viIWYeQzQXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E460F80234;
	Sun, 20 Sep 2020 20:08:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E740F802DC; Sun, 20 Sep 2020 20:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F9DF802DC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F9DF802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="od8msnBt"
Received: by mail-wm1-x344.google.com with SMTP id s13so9957049wmh.4
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=od8msnBteZldCebjDA0LhBvuf3owGuNVeXNmfc8zL2GnHQS7hZR0U+kvi5obx8Dq8a
 eOOF3U5APL9OcA2gGUxW4wAB7T6ZZkcqxri2nZxq18s+BtaSkBiqPjqedJy6r/spZIUL
 pkAz8YIn13puAv7TpYjMW9xBCk+mN2vHIJ9Yp9qm/3GPKy8rK2RegOH9IpHw7chDX7F/
 agkswXCDJiqfqNfoy8Kf++GcFQElzxzPBltqWl3BBCMzMxknuCPMEED+9mOiYYk/KMWh
 pkH6DaQ88kcjqIUyr88HzCrXykSicoogxw95gXYjNhVi2Jcie/spXWbTBBIE8/bK/6fU
 lxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=BiykBeLFthywKObYf+/3IoW/1P5keID54eqcFH2QgmVYjFdU2WRf2Dm23Zspv2vFC0
 6F3TdeEPOHn+u5Bm/WUW4Oy6+HFyjPKwImfaicNGDTQ/ggLVVArlGlbcqUfxZoNt9J4m
 cdgcuIOHJfaNiZ5ZYa0F6UtszOF7Ci0UP9nB+26gTD7Dsa30+Kk9ojArWKvxLz2BOgcH
 JB5uvehZvqQ5P7p1RrttOrIwRqypVxBNDXODwwfKMfoSe1wCn6N0V6fsn3IdciSSZC7q
 9woVE85phduD3AqH7c/vMgGJN8bNftkzKykNJcp5mWgFDhHR/5CSgHfb3jAb+q/4uEHk
 n1qg==
X-Gm-Message-State: AOAM530D8f2hu/0LwqacJofLNMojduJBuTaLjixQYEs62GAd97pPeIh5
 R6b6IB0kK+b69fG5/aOXlbs=
X-Google-Smtp-Source: ABdhPJwcGaD0crtgI3afCNwwoShmAF7R7HzisPHTeGnNrjW67KKPM9CR/iaHPhakzxHB9RZkDcIpYQ==
X-Received: by 2002:a7b:ca4a:: with SMTP id m10mr19858849wml.11.1600625299426; 
 Sun, 20 Sep 2020 11:08:19 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 08/19] arm64: dts: allwinner: h6: Enable HDMI sound for
 Beelink GS1
Date: Sun, 20 Sep 2020 20:07:47 +0200
Message-Id: <20200920180758.592217-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Now that HDMI sound node is available in the SoC dtsi.
Enable it for this board.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 3f7ceeb1a767..049c21718846 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -118,6 +118,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s1 {
+	status = "okay";
+};
+
 &mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

