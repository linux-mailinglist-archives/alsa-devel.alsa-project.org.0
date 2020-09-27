Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CE27A2DF
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B0D1B02;
	Sun, 27 Sep 2020 21:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B0D1B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235628;
	bh=K4dmeNGtrcbmftZRBPeJGLx+M++AXOW7aIu4gnDm/Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g42h57zUriI06UmkxjlIBcHRPtYoOAyJCme/HbQdKYxVTi7XJk2XicnxQdsaIHcLc
	 wKb25FWwBc4ocmilx72cxyhHDPvtq7Ei2U2039rKca1iaxyJZ+Fws+hjhaqccOyBTY
	 IEwDcwSkk5GD4jJFXPh94gNWk2q3CshNvboDJtlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B52DBF8034F;
	Sun, 27 Sep 2020 21:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE66F802FF; Sun, 27 Sep 2020 21:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E402F802DD
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E402F802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WuSM27ih"
Received: by mail-wm1-x343.google.com with SMTP id d4so4376932wmd.5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=WuSM27ihaY7HvK2d2jBbe8/5M6vGm4KLG4Ix/Tru69x7t4pNz83yNOd9vreTdOqWAK
 V61OQsNGlsVPePxpPM5ysIZSglxgADvF0EDAJqhME+KvZLA0wBsUxpEZTSVv4+9qtOjS
 w+9xmT5szD1SZ0updA+1F5x9+PJk4GfTc9BzHRgTwXpxclppGupLuGJm34fwfiyM1Yy/
 MPA/Hn8fsL4Sy0cS6k6zL0IvapMRHPlLnvpMPLi3Lx0bZ1QC8Ngk0c7ndbAHAXGfqlXm
 dNraa+h3+AExmcLQfsFiB+T1Wo5v6rgJvani4PEk3RZtgYw7HG96TTGDgCAEAuLHiGhX
 Aitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=RVnX4TBNXTqzs4M2fcPyglOK1zjOL1usKilenjtOsqcBpSVQXi/YRpJN6nGNpI1+NG
 O24hU5uKmGTrvUpEz6sXqpmKu4Qy5kMHmoZTgNpm3ONACkY0XgP9CZ/RNruvhF37H2s6
 WMqw4msiYPxbZy9vHwvSu2APorFM6FJPwahS1kLLDituFh42C4+8lN50Mj6q2QmTO0P9
 w6TCMQHV4CxMe+7/sFsLwWR0BKFz3ECpizDh2t9BQ7iv8r13xivDdBVkN0ihX6GtZ4G0
 lb7mNsV8A8fzux1XEoF0lTLn8bqYKhUisLcBgC3X3UC5256dsluSJ1fVRL8smqCDV3TT
 cC8w==
X-Gm-Message-State: AOAM531R6MEAqDR7Xa31LSotYNNt/OUwGI1fDr0Q0gG2P8cpQKnuL1iD
 gd0V3W4WLdA+ar2dvvgmJGU=
X-Google-Smtp-Source: ABdhPJyURiLf4YlSa3Qa75suU5D4nme65ur4OltvA877EE1WX/lOUjgff/+olLYacFgpFL3o/xgK/Q==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr7930499wmi.37.1601234972334; 
 Sun, 27 Sep 2020 12:29:32 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:31 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 13/20] arm: sun8i: h3: Add HDMI audio to Orange Pi 2
Date: Sun, 27 Sep 2020 21:29:05 +0200
Message-Id: <20200927192912.46323-14-peron.clem@gmail.com>
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

Enable HDMI audio on the Orange Pi 2.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index 597c425d08ec..64e8e2829f27 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -144,6 +144,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &ir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_ir_rx_pin>;
-- 
2.25.1

