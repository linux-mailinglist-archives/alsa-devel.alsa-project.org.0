Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34C272143
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40F41715;
	Mon, 21 Sep 2020 12:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40F41715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684601;
	bh=K4dmeNGtrcbmftZRBPeJGLx+M++AXOW7aIu4gnDm/Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEOvG71s1aTNSTV2+LeR8JjqEfE1Sr+9yzmipfHNmH9pDceEWOdIbBVO325iOKOnz
	 dTyQpof3rk5dY8m7XfgRd0dPbVpRqUT8MXZzjvOrVmop/BCpo/v/qfoCCvcDHkeyXh
	 abQuIL1UJip3qrW0jw50n9k1eG5awXMZ14wshI6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24333F80348;
	Mon, 21 Sep 2020 12:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AEB5F80316; Mon, 21 Sep 2020 12:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7012F8021C
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7012F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k/Xa4p+S"
Received: by mail-wr1-x443.google.com with SMTP id c18so12147704wrm.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=k/Xa4p+SoiUfT5X/VXAMV+xAsc1Hr2ImHs8MB/Z+C82JHo35tHgnrpuszHeaXCNzlS
 WuIsy6ejmTU1M/NYjSa6Cs60JpHurVeIvzz2PBDOiTOO6XveuudlxZeMHHT6S8v8psBP
 v2ALL+Czs6/cSfpbtJeETASnBIzgeINCsgEavfLhHX+cnDky3RSMxd4WAOfoi+vFcXar
 NOO+aVfZZlRRhXBTr/dJmrW7EnSj8sC7LtEEJ4ydCBRrUGKJtZ/HJi/VRvYkaj3QGWi1
 qJ57DHKVSo1GrI/wjzG6etScyejdKlGNElcgy3MjqbqVnC/vT01suZ+TWCcidgqK6ae/
 OZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=hGmT9Q7evurOjzTWjbo0o7Z9dBsL0qkfMoanjhpjGTMPvwIBsvBpy8SM1s1oNbIDVY
 WjXOf0nl0CL23uoEDyjMumwe/2orkXJ+IdJYL9dt+x2qTNR4vQ6MVWBt+MOXGzeUwMfH
 lvqnbpzZ5wxsdXmmaHgIXwL4FJEEpmvJD2+xiiG2w0Yx65CcTexRttAWafO2w4QEldO5
 DdCmNUv9ydYqSDqEQsgIohfOiFvNT0jbOZ06JjxC36qdCuHq0HzPSQ6fqFKfX7dGyh2o
 gYpqN5e5LVOGVTZzdj8EQWzZJp7+63D29bYbUg94a/u2EfG3jzfAZxuFE5j48x1/vN7l
 8iHQ==
X-Gm-Message-State: AOAM532PGSkGV2ig31eFTR4M8memUW0cIPszp0oZoqXVJ4NrYIj8DW3c
 yRLKtNerzOdoOX+LgbDB7zI=
X-Google-Smtp-Source: ABdhPJx8Qo1RygVdBAmbHQewn4Q9oZkh/TL4S1CIJ6mrwHEIScVsMQIFKEvAZswsM/ZdHm/HjeU7PQ==
X-Received: by 2002:adf:e952:: with SMTP id m18mr50809719wrn.171.1600684073929; 
 Mon, 21 Sep 2020 03:27:53 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 15/22] arm: sun8i: h3: Add HDMI audio to Orange Pi 2
Date: Mon, 21 Sep 2020 12:27:24 +0200
Message-Id: <20200921102731.747736-16-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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

