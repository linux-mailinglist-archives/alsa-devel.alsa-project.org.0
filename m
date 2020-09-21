Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC957272160
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D021726;
	Mon, 21 Sep 2020 12:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D021726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684817;
	bh=Rb5wXmBrtBKDogUuv7UZhOrx+urFeYY/Tiyvce3YfbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvhvtIrm+HZHcjFgePhs72sgZCo+CpQzw1g1f1GXxlKVcP8DTVgMAgktj4bTxTvrG
	 4XmtaymMKIBSYDOLDWSwq0E0egz5DaD/ZbR6vnUF6aiBl0GR69p4fiXIkf6MkJzQCG
	 UkgAxrVsGjodqTPIWo9MG3YbO7ooNnqRUSIXObF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1283FF802EA;
	Mon, 21 Sep 2020 12:28:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 323EDF80321; Mon, 21 Sep 2020 12:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8252FF802F8
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8252FF802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h6xYtTsM"
Received: by mail-wm1-x341.google.com with SMTP id w2so11585638wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=h6xYtTsM8vUSYrUZdzsJfHb3nX/o/s/ZsfIgvfy4W64xlB8Y8//XzMw6rs+DL3QRDd
 Y7fQKVv1O8f0qYcpfQhmsXiTH0IjZdTHWpNhNeBNucv+qo4uDFd+NoNOCxlGiwzJFwbH
 lvjl1I0WT7ojz9WlHuBhp2aGEo/oYLW5d0d6vE2elnKxWcZMI/lSXsJxjj6Xd3kucZvb
 rkJfHRFTmD8LjoEgawcqQ0+smQ4kCObAGAmqy/LWxlJJ4SXsMmCShvcqO//Tm4fjC3eM
 rIhe4JaH78ISzJUWmbSjq6WD31xhUP3DDiJixxChh1BMOmc1enQZEnT58EBsoxNkYiQl
 fKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=XY/OCIcomerV2LBwFqfYnFW/KbWcT0nOV/GB3j0cQ3dWOzrYVNMqFTdOxDP4vHHsIt
 a3GnEvGisgv6XUHXTFjM9zsNYkjjXv1JhtplK/dgA0flTO9jWULWVbf4YMTIdn2O9L0z
 sm1qLajiTPCN0kQlcI89/a97GYmWBYG2SUFUy/pNx/5Qeem5YNy06AjSALq2/OgIucg3
 FGQSm3IS2P7XXtpCIrJLDqEk7XAbhxdXzglojT0rwcMUD/OBul07tS8JwU5G07V273dO
 Al5W7jSM6CPtoFtn5Q4PF9ry+8J4RUPRK2oNCCubx/FZrjXf/5YCdD+Gn5tnuVslurr7
 xJqQ==
X-Gm-Message-State: AOAM532P5k53COhEdWLrlb6CyoAUS/tptd4gbRX3AYKxUMW8Lus3ZiNk
 szPtmc2Db6g/Thq8Z9/YQCw=
X-Google-Smtp-Source: ABdhPJyAeyQp9GMNSy+S2cHGsEUh2xBRCZQgRuvb1YXpdy5goNbZMxbQXjnbAtL/QLWaBrI9K3UR7A==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr29150191wmc.142.1600684079969; 
 Mon, 21 Sep 2020 03:27:59 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:59 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 20/22] arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio
Date: Mon, 21 Sep 2020 12:27:29 +0200
Message-Id: <20200921102731.747736-21-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 15c9dd8c4479..193587e78031 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -128,6 +128,14 @@ hdmi_out_con: endpoint {
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
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-- 
2.25.1

