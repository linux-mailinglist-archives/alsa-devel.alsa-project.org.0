Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C6627A2D7
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:37:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E7D1AE7;
	Sun, 27 Sep 2020 21:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E7D1AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235472;
	bh=Ffu0p009uCbD0lcNfaK6xKfJNWxF0SG5XCL5X9Lp6GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCIuFPdkJbqfiu4ay95/456QY4zgpcbot+5rFqVUwHNXWcTsAml/1cRbBHTzchJ4U
	 uIyTiBCcf6QntvJTuyHBwlnRRmvjfu7Chk/Ux3QzoJ/Q66FHOUwiVLzTD7/Xc8XP5P
	 l15h5Xg8grmo9MaoElgV53E6DIpW1x+3/T9mE8do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7FAF80335;
	Sun, 27 Sep 2020 21:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E17E3F802EB; Sun, 27 Sep 2020 21:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E51D3F800DF
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51D3F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hKf3qxaT"
Received: by mail-wm1-x342.google.com with SMTP id v12so4627520wmh.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=hKf3qxaTjVKN4DLweISEOSGqgAW29sTg5C75FqFcWoZth2AzalZ9en0t8NWvcBDLK0
 S1L7hJblkLs8vBQjLwkwnF2oveIDWtUyLZDohZSkxcucHOU9VrYU7XBcaeikc1y/FE4w
 kaGs9b4Am42PfOfnlc9dGN9ufD87FmJCFZlF3HmGP0mWrIlq7S37thmWbOk4QdImVNMR
 nXwEyvnwZ+DDxZYCs5Q3DVfAP/MBSOs+3zBiM1L5/XMuNmrZcPfp52EdM9fFzaXWfmBo
 FOUjlPPtAmJyMmXomsulwk8cAE/D0v0vN6qINHfrbwcbQjgSj1J1KKLTgahuwzjmk0ma
 nglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=pxWxnPdZswuQgULB55upB7QMPOPzISCAlwgkOXrpq0ttGA80M9gvMjTEq55Ak4U3s7
 rlNA32A7JgI2UlEarqTklLz1vVpjfEOBSWLrPFJbmbXuYvT5rgIpnJrsDf1MYWW5C8u7
 KOI0st4TfoiqJw0/wkhpj3Pdbq0196Axb0Me3HobNgXXjvufuphJp+weVj8ZHBhabcsA
 bJOtbpZ/NT4ck3DFFwF5vESqg7s/zllL6brYuZfCwElIqXZEnnKVi87AY4q+OhsFt70v
 lSU/MCppuNRWmdGLFNv0yBmLlt5xtX/13RTks9xO0fkrYDV/gLEyQ2y3+wz/zgzrhJ7S
 KPmA==
X-Gm-Message-State: AOAM5310AmGpevKUs1sb1fTIa35yBbW3SLRJF5ND3SuvIgT4q7WGCRxT
 PuR1rrtLcjqjBt5MoCQw7LI=
X-Google-Smtp-Source: ABdhPJw/QDoYhDvnvxpteGvAG0/B8IDFN19JpZcPo/KEqFbSJ+XylG/NliGSOFtjvxUpV4sYmexJZA==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr7934660wml.59.1601234973311; 
 Sun, 27 Sep 2020 12:29:33 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 14/20] arm: sun8i: h3: Add HDMI audio to Beelink X2
Date: Sun, 27 Sep 2020 21:29:06 +0200
Message-Id: <20200927192912.46323-15-peron.clem@gmail.com>
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

Enable HDMI audio on the Beelink X2.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index 45a24441ff18..f9bec6935120 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -142,6 +142,14 @@ hdmi_out_con: endpoint {
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
 	linux,rc-map-name = "rc-tanix-tx3mini";
 	pinctrl-names = "default";
-- 
2.25.1

