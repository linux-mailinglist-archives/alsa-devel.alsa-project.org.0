Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E105627A2DD
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794341AE0;
	Sun, 27 Sep 2020 21:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794341AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235569;
	bh=FtDtCsCG+I5mkYHTFGcWwPmUiqOJd/722cScSNcK4tM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJ09OMlaYVEqst5LITsZyf4wtdgqvi2RcV7Bm+OVLs/iMxMPj3N6O3r1CIYJmDZyZ
	 1PyUb97ye4X/wy7jR6INBk65sCEy3jtPvRH5QLVldQ6HVhavpRQR7GAKwD9Y99O+vI
	 f8HQEWBAI5PhYCUw5u1xRpH4TkXxC10oGKjFj1FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D04BBF80344;
	Sun, 27 Sep 2020 21:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5B4AF802FF; Sun, 27 Sep 2020 21:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C770F802E1
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C770F802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ec/nBSVt"
Received: by mail-wr1-x441.google.com with SMTP id o5so9483098wrn.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=ec/nBSVtLqLm+8O5jvfkUt2ne2fgh2Pk7OHZtZoDFquzebrPCcyATT6JqYLYlyliK5
 pQpn9fx/rYEWCTTDg3ABoUNCrFLyG9OCP0cxSbI8GLXWHd/U9srHGzgmLsn8JvG+Zv62
 mpBkNGhfXP2W5l0w+8du1hSmGOSd7MdzJ3oPe8t3rjKsWl4RoFTWEvT7ebcxiv0rLx/N
 PLNnXFZ8jdvXBXUvhWWef3EgGAYQQYKQbV3NqcVEYq6UevOczWn0sTqZ+rCgpXSzxep0
 KApD6YdLTkEVOC2PLuOg18iOnhexv39YyzHEAKLbZ36OUYxo7LVITGJsruW3wmmQjnxk
 mfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=bcOtE7bGYyhd9ZTowNrrytu11/9Wt8Wpiqbdl6RTKyvziQAMMs4UBivR44LsqpMVTX
 c+7D06QD0y9DMXsyYv4m8EdJgAn/ApphkgECeTywZzOGkNRTZgZoCVUaOb6V/rLO/H9V
 fc2CVJw1/iRD2qkcp4tUNKFJOnYq8vcO4zMUcRipNOJF3iaOJuB1i+6bawdkInRWO3TP
 MR3I2wGZkidjek3zevWTLnzflzTdB+YbSS6BEXw+2UMRlNm2yHhkbxYBeNwnh1iJn78Q
 I28kVSIgt6Yze0Gvoc2uHXURTaiXkeQsCbtQp2Kkfl/mSNh6yrYYRpYa1gASxRUes7oE
 kyrQ==
X-Gm-Message-State: AOAM532yxw/mQqtVBgSaYcll+rqcuTc15y+pls7JSUxrGGkCZpkculZc
 K1FkCVpTYt52dSgM2x3I4DU=
X-Google-Smtp-Source: ABdhPJyv0D+mC53gVQf7mF2GADpU37fvw6wJOGa0nM/DxKoV/zqI5cE4prxkH89c1SvMhlQMw/SmsA==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr16570978wrr.149.1601234976814; 
 Sun, 27 Sep 2020 12:29:36 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 17/20] ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi
 PC/One
Date: Sun, 27 Sep 2020 21:29:09 +0200
Message-Id: <20200927192912.46323-18-peron.clem@gmail.com>
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
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 8 ++++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 4759ba3f2986..a5b45655fcf6 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
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
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 5aff8ecc66cb..ebb12a6f3a9f 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
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

