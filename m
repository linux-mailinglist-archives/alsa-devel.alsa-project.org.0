Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0B2145AD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FFA16BF;
	Sat,  4 Jul 2020 13:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FFA16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863369;
	bh=Ffu0p009uCbD0lcNfaK6xKfJNWxF0SG5XCL5X9Lp6GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivIcSlDSsm7aOyqJ6Xc6grUQLkfk8JlD8zKicOysnc2x+AKXKjsB2OLKKiQm+IhQS
	 U8mTY9pR/bOt5k+ZV0cbMNOY2P90D32d4NpUfMLBany6R1zCVMcufPqZ28hZaOF3Vq
	 7nBhlpXnxt8CL8JQvTYqB7UFqooPAdwkh9R/RAOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55FCDF80346;
	Sat,  4 Jul 2020 13:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96766F802FB; Sat,  4 Jul 2020 13:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28ABDF802E7
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28ABDF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nEzPlgsj"
Received: by mail-wr1-x443.google.com with SMTP id f18so27368380wrs.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=nEzPlgsjcg8TByHn1C+qEUDkohx5ASytPn5nARE3P5jp1RlLAap0qoF2tksdXKE5mF
 zCvOBIHPewVwWvPkuUniNCzwwIZppzy3sKiP38/kR5TRFRYyzL2ZPktCM1K6pIPz0vmK
 VRm7CkHPsmFQxXblNks+kKVp7OFrTVQwtRkkMuilgp2gmQsiR7eG1L95kzN3N2HawTBl
 pIipXNBnZ33YdT+9fq7+qEvE9psc+DTLjtp1cPg9ZFuPDT3LkmZ618o7E+ZLEVuelT/Q
 Pf4wjiKqGkNSODmQQ1D7jb0ev5fXBRDbeTix+kf5/oVIqDWen+0otg7UD1SqU9KU5PYA
 R1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=pf30NOYNYiCJ6eC45G6gXpvFASFc0yYrFiGJHw0HytJu1NTLrArHtN28L+KyeEfcjq
 XMv31Vsq7rKE84BgIqNUeE8aWXdcI98S0yHe2/A6/oj7XldZbNyojTLofBRYsXDjRKOl
 i0JyihXymCa5NWw3X1vdDeOyTlePoiLPJsgCXrQDbSW/5Put0NDIB13H9ZPLILSAuN5A
 UdyaiClDvinPYKSCq4U2D04ZB4QvQoZvNsVDiCaTVYlgt7f9DZKGucMot5M3+KAVOkVd
 TelonAGtQP5XhKpo9wN8m/il8LACpeYV5CUubJSOKsHBTjKOsM7qErWgHahqvHc1puUL
 Bl/g==
X-Gm-Message-State: AOAM531Rs1i59wUiMrBKucMc5k/mk6wu3meWWFib61nzj7wkwxlVfyQq
 uHPEKD50Hwuy58yVWnVvt/0=
X-Google-Smtp-Source: ABdhPJxkbXBecC8xZ3jMYSVWuATOoIm0zg8F41kgzvWYqvmLuAB3pUiqkI1KwEUJaHuj04G4OuoShA==
X-Received: by 2002:adf:f608:: with SMTP id t8mr41463663wrp.308.1593862763538; 
 Sat, 04 Jul 2020 04:39:23 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 15/16] arm: sun8i: h3: Add HDMI audio to Beelink X2
Date: Sat,  4 Jul 2020 13:39:01 +0200
Message-Id: <20200704113902.336911-16-peron.clem@gmail.com>
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

