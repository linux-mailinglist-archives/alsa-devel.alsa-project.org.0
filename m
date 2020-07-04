Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C92145AE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546E816AC;
	Sat,  4 Jul 2020 13:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546E816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863402;
	bh=6zCMgV1md5O08oZMh2wGxa+FHEFhgrmUinhzD32bOe4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDMOxJsEkB+Yf/XmK01c+/SjSFmgeMSnF5G1sRswBesGCu72He6nQpRqzuas63IP8
	 FOkVXgzzGQ1aEmhBT7bUyrAL8EkMTjtr80/mqN9FDxPxz6whyAB5QYxMJ9peJwR0ks
	 YWxTTkiF/bBskHGDwWO24c8lI+lgUriR67s8gG0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F0F7F8034D;
	Sat,  4 Jul 2020 13:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313DAF802FD; Sat,  4 Jul 2020 13:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C744DF802F8
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C744DF802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JrewqFuc"
Received: by mail-wm1-x343.google.com with SMTP id f139so36655805wmf.5
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1wxiSXb6FjGblsvKrZYztMSCVGGVQHB+0DmuQ/lyxA=;
 b=JrewqFucv5cYOk7OE3oVnmZEW3IbJjLlbiFhIN8TjMDZzUl7L+jK5AKEFgEXWzxTt2
 2pQXxy3Pz1M75SMWDCj/v0RMb9zesYAdX6YFCYIbnYmGaG9U9A/BVMclHljHSKcbD+qe
 YAwDMlcI+nxg14LvyfWNzqkomR1qajrWKg4u814ufNNLKFQAY6e3hDdo729Kvyx+Pcil
 IDKRHP5AQmDyohNs9j0Xia144mKJyU+H5ggVM8MSPXcNsrLv/Pbsxr2TwbtFJf+3XCQy
 89ld2FVKMq24fnhWHiB3dC+gxVF4kpm1vsG8xovGK4fAWvcuKmXsP643kNsh9VlDOEoe
 Kgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1wxiSXb6FjGblsvKrZYztMSCVGGVQHB+0DmuQ/lyxA=;
 b=RyhJDG1oQZHU6d1VgVyKLSrEwE2/FdKNJS6wxRVAdobSt/Ne86i3i1FsEva/LEp/OU
 e9XCIZ+l1mlI8iPQDudhMJKELdLbTW/PULa6KrEuD3BBFAXvA9rEBrKEFygAl3n8cNbH
 ka28XrkiVLwT7KlwbuQaSXf48+seQTBYBMownTpD2DdEFg162IYsH+oyr5WOYbqXssS6
 hrfrHnYha6H0sHWfDa3u6ZaF79r7+VYBJIbEP4isEjSv/ovZ3g/2ptMYdyd6TDiRfe5K
 nUbYAsKkgeRnJpMoB1GOL8X7tn6TcifdJxFKOMzb1TUKsMVcHZRqhxqT5/bQlyuYNcTP
 v3Ig==
X-Gm-Message-State: AOAM530kKcXx3lC3MsdXOscay5UJek82aIKuaFYrvpAbp6i4WmYcRjFL
 RRzav4xIuFdoghr4tEBI1ws=
X-Google-Smtp-Source: ABdhPJwzV34Wu9Tm/bGGoIIBjIyhv/6HbZCqgcw/NraTBYcNKoYfUjnjYieuWUKNkx3O6QBQVusUfg==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr39307080wmi.148.1593862764834; 
 Sat, 04 Jul 2020 04:39:24 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 16/16] arm64: dts: allwinner: a64: Add HDMI audio to Pine64
Date: Sat,  4 Jul 2020 13:39:02 +0200
Message-Id: <20200704113902.336911-17-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
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
index 2165f238af13..c5939ba52f19 100644
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

