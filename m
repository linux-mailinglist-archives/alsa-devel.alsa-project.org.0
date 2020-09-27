Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64A27A2DE
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499F91AFF;
	Sun, 27 Sep 2020 21:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499F91AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235605;
	bh=+RfYBz/Rj8O5KxCb8uCFafkT4TJfTlahyp2IDTlfBgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGuso5RdNs5CM8jKlcow/rbU7hB/6LDjhTiu5yrCVpPxbCLBzcDMiJkhi6Ex9v/+z
	 sjyRnKk07O+Du+nBVDEuMi1TciZINtE1jhmfkpOVHgwM/mb/WnEPSFJ9sgQWcGPT4O
	 nfPtIrSUDRlp5xJ9SOfF38W4FudfuUNdw1CvK1HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40849F8034B;
	Sun, 27 Sep 2020 21:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 916E6F80303; Sun, 27 Sep 2020 21:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F6B0F8029A
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6B0F8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BTvsFbJm"
Received: by mail-wm1-x343.google.com with SMTP id s13so4378234wmh.4
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=BTvsFbJmBED9nWWFx0ySyEfb1ek2Lk+a2RoS+gWg+3xw8sD3JEgL0GgtQjZeGmVUOc
 DWM1C0N/ZoxPbw+FwNOb9JCEx3jP5cEO/eC/maZPLG7eBgGGBngVaOoIug4LFiaQp760
 sfUdzB3WQk03K2iVs+JADPUFO3Rcx3bNV1i4Og+NeewSxdaycKCfHTndcyag/3EJUHOA
 PbsZW0PmaRvM2a37Az7bPf30z8K5EkHAfZvWJ2HpKI+lkClZqvIll7rMAWmeWLikhw4P
 HATjfrZsgNynX90bCbYvga2B+JLvTR6e1V68dxRv/QxlH/AeyIyrYRCDfo5zuZxeEVpJ
 SMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=kGpSkBFGYi1QKXwsSJOmJGa+z2wnOeuh9N8Lzmn3OE/b1vXlaiJKpbEfVZiYkqJ103
 hsFu5RJYQ0s21pC73jB+LQahaKPf9ZyDuCjn7V1GpbQ9lzPWpO9C3L7oii5NgCdId/eq
 7uS9Kj6Dg2iT1g4ydKTsmefGoQlRvtjJ12OBbBNYPF6fXAHvFHH373lO4XT8uyPD3meg
 nvkFZEEFC8jP/wWOcEV+YV7HsmJbDYAAA8yX92Icz7Jdn7c5SbE8XVHZAM9sx/hiyVIU
 PPZ3cT3DlP/ggfzJ2LI9cUPFgCxdzF0TH+Q6vXABYe/Xoydid/ej0uUXz9DSorXrEHtW
 X2EA==
X-Gm-Message-State: AOAM533XoGvuy4ZevLQ2VhQNTx4EvSkILa6ut3YldtqCAFN4NPFLmyPH
 I4RGELy86cv46dZ3c/kJ+NI=
X-Google-Smtp-Source: ABdhPJwCdIQR98e1axxF8yYJ0f+R6ecrEmDf4R2AGdjdcLpkVOow5lcdLgZ30NtEJrSCvDX/+bjH4Q==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr7842009wmj.19.1601234974395; 
 Sun, 27 Sep 2020 12:29:34 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:33 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 15/20] arm64: dts: allwinner: a64: Add HDMI audio to Pine64
Date: Sun, 27 Sep 2020 21:29:07 +0200
Message-Id: <20200927192912.46323-16-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Enable HDMI audio on Pine64.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 329cf276561e..b54b02e59085 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -99,6 +99,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 };
@@ -107,6 +111,10 @@ &i2c1_pins {
 	bias-pull-up;
 };
 
+&i2s2 {
+	status = "okay";
+};
+
 &mdio {
 	ext_rmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

