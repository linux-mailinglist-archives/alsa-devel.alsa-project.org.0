Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD3271703
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A7D16BB;
	Sun, 20 Sep 2020 20:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A7D16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625894;
	bh=Ffu0p009uCbD0lcNfaK6xKfJNWxF0SG5XCL5X9Lp6GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyEThk/3hSugUbQ2qlwx3O+65/3yKpIY6M4c6TQezvBRKzT/eHcBDNdJelIp0SoPI
	 r8O74kb8TJGPg3b+2o889iQFzBGQ6t/Nb2wZCxkBxXFd0Y7MvtHjm//ltVNoZKyq58
	 pjB1zhkZok07Mw4vvbaJ0fMMH7kJLswguG4dHl14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8E4F8034B;
	Sun, 20 Sep 2020 20:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D49F802DC; Sun, 20 Sep 2020 20:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 191F1F802E7
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 191F1F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nAGJogiM"
Received: by mail-wm1-x344.google.com with SMTP id e17so9971226wme.0
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=nAGJogiMQGjo9YZAHft0GpvtGurKMbuQTXDDJfJ2PQs2ccDP3wGSz3v9Gb94E0knTi
 1NbB0txtdgeSTIPzIRro3B3bviuEwLCxohz/3H4GP/B8iIZxpzL6/o6vy2uldACntNZx
 OUBQfx2T340IawIdG00VKquSvi1T5kExWaur9/R9a7X74rabGayD+WHLF5HIgIJKH35E
 STc5fCAs8cVpvHmXTyhLWjDcgdzh58TbOIOuGP4CKrxrAJgC4EnH4t9WWhs2y+atPQL6
 5xfnbp1JcUD/SbnqcKpoTkj0GAF3Sl7AC+yevO3jZmd27ngFJmOlfVhSGI2PvJpB3yIi
 kjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=hCsl/iwfbR8Z3lbC9z9lBsGzE57x0eazSecrJ/TkTHyB5ukFyE5XnpZMA5U5dOeu3i
 fE0NCiFzJ5DXA5DZcoaKPO+lFPfxaNkAhWPvfTC2PTAgsu8Nm7PYGAueqJgSZIGhalvH
 XcOYUf56PFy0FI3Vklr8C6h817MM/yH+FByvQqmPNP4Wqi9rfGJivEhK8roYFt+jYpp2
 Z5Fy18HOVDWpxvVkHZnRsWLS140YTAthm8AdLDoS4sAWPHJDovbL/Tmwtv1RPS8zzXFP
 Mo8FW4/MznSroXX29WEc4Bz5RWd5X9Oe/v8RbgO5MmuSEQJwM6KpLOUV8rqIsml15k8O
 EJfg==
X-Gm-Message-State: AOAM532MvNoqN+4hzZS4g5YHz5t7LdC12wTI2In3mSAtqOhzgQn1zE6+
 WMWb1rX/nA3tj2a2mR+0m6g=
X-Google-Smtp-Source: ABdhPJzuEXxGi+iH0uFwm4f8P1YRMnMIJ+tqW1wXaiWWppRY9NHT0o0Ylxfb/0d7GQj8AWidYkxRFg==
X-Received: by 2002:a1c:f208:: with SMTP id s8mr27082024wmc.85.1600625307570; 
 Sun, 20 Sep 2020 11:08:27 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 14/19] arm: sun8i: h3: Add HDMI audio to Beelink X2
Date: Sun, 20 Sep 2020 20:07:53 +0200
Message-Id: <20200920180758.592217-15-peron.clem@gmail.com>
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

