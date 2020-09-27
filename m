Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B145827A2D8
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298BE1704;
	Sun, 27 Sep 2020 21:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298BE1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235511;
	bh=1jaUTW1IS/d+0xKEIaljMnyEL+efvJY6RnPLC7maicM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2ZdQfqaos4HNoKtk6v4ZdA90qo5+ppgXEJ3PBCEZkvsgeTGsH42qnFBK8HoCKjJg
	 3ITeq9dv/saazT1vP0K2Rg5w3NdKYALSnocvlHJ8xaX2zl+rBzLa2A+JoXmbwMXyMJ
	 /aYYK/qNLJrmigb/mcwNBeLk00DA63ZAsTTqIY6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1FDF8033F;
	Sun, 27 Sep 2020 21:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58053F802F7; Sun, 27 Sep 2020 21:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 907DAF802DC
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907DAF802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F6ph8XTb"
Received: by mail-wr1-x441.google.com with SMTP id k10so6419620wru.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=F6ph8XTb6Jv9FXVYW3glwPA1tIKm8quNpkWf2VOxD1VYzAHBr04NauORR/BY7R90LP
 eEnXgCgWnveW7V5bj8IcbfmBZouffSA38AOLzdbpxg0YdpLFo+BlpWsBpsSCIonaByw0
 brQKxBy3nstw+oiHpawAlRKwiWLlI6F79Cg9pYrTaADg+ZrkEyUD6KwCJCD0JHbpyBMn
 hQPDOUXhyz5OXj3Xel9LuiqeWG9HK8F9yKMLFyf2KtKr8UoPxSo8CweUSrAcKnLVcV/o
 MTZQJe1KJlYdFSrct1B5ImwK50np+sSaSI+xliBNTn4gnipgMfSGH6Nw1NPLgEov0Rts
 H4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=Oj/RHdM38y/IxR7XYvVJBjiAhsNeFunPF4X3te66gq6pofozMzJAg53ADUqoXciggz
 /h6mlzEUcZWeOzO/xoCXL6tmov4f58Kb9PeZTcm+zYaBhQ4yJjRwmP5MN0hgEewU/him
 jKPXHvsrD03A2Hj7burkFdWqhuFqHdNtEb393rhOjoK9eAU1M51eOO8BavBsER8Sm7Ld
 uITDLdNYfC1qZgN4rIJEfkktlwH7k8NTeQ5OfldV8gLho8NCUvuX28zi93utqPJGdbC2
 CTO/45LCe+q0wfeuOu/I4l+i9NtMl8AYawyG5DIpJifxK8Dn/oW8rrzfOI2XtpoCYcZ/
 LuUQ==
X-Gm-Message-State: AOAM531BxdwZx0nJyFG7O/x+0Ja/9Aa8xjN+0EyBnUkWdeQ2y2g8tNBj
 sh8b4L3yXdhFSWKW99GSvdg=
X-Google-Smtp-Source: ABdhPJyyCzYnZGSwRmOTXmFhk6QYvJY31J6KYXHkVdCv7BuScwP2uXyucdfc7nly/WI1HgtWtMG+uw==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr15666769wru.10.1601234975687; 
 Sun, 27 Sep 2020 12:29:35 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 16/20] arm64: dts: allwinner: Enable HDMI audio on Orange
 Pi PC 2
Date: Sun, 27 Sep 2020 21:29:08 +0200
Message-Id: <20200927192912.46323-17-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Ondrej Jirman <megous@megous.com>

The board has HDMI output, enable audio on it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 7d7aad18f078..e6ed8774a17f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
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

