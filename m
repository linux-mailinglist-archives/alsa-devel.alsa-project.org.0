Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2525CAFA
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B7A192B;
	Thu,  3 Sep 2020 22:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B7A192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165441;
	bh=K4dmeNGtrcbmftZRBPeJGLx+M++AXOW7aIu4gnDm/Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNPKbZZXQiTyV89tZlEuv2h1fAI6KUHiWmz3vCMJqSqSpsdWKRI5rJOeyv1LigqGJ
	 fCdlBDvlycQvAiEmFpl9m1RkY2894RELiP0FYzVcv/zg5EaOZ6qJeigFs8hdKUC6GV
	 /279c4b2JrJwAm4Bb7ZAMlJJvjPvkxluOeDVzLDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A37CF8033D;
	Thu,  3 Sep 2020 22:31:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 642A6F80338; Thu,  3 Sep 2020 22:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83870F802F8
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83870F802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WyrthnaZ"
Received: by mail-wr1-x444.google.com with SMTP id w5so4573698wrp.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=WyrthnaZYSFEr7XddYF7H50hOI5GPE+Pd6cDfZvu4PnQF0Psq5EF8p+RpdbuBXkK+/
 ia3x8aYxZm6VnrBWzUiTkhyelVCLcQW3ICV9JNF8XvdMaiJwwHeUBWuBZxOJuJyXQIVn
 HhvWKkZ5sWEyp98yw1kWt3E/1d0jRChRYpYnldSHC+UnvXRdQ/I4wol3ON/0QxcN94TY
 dyWN2ySMCsNUQW7ZFFHhOcReTI+ZP8TrNDygFxNr3QQiEKQ15O0+x7qaxJsPfuU2T5/0
 3FuDrAg/+zCRQcmevfiqKs+bir8srVfRPxrJeSaYahVPrXe5JLRwdukunX2sHHpszb16
 b3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=hHVg3jWVO5Y1CfC4mPoCUqwHzQavZ6G5oXxv4O/sDJIPCiAZRbmGAdJI3VQa0EyHvu
 L1hZu3w0gVYcaTumbEn2QnrMlKspa8OVqOJwJPPuPFFsmio12q+wTCxjDylhm1TlaIbp
 9HRzywXiqo2ZDFed/V0/u2rBtigaCqcL7JE7EUxErR9D720Xdbp2mVN/DLzECvWX8KOK
 BRsQgWNytWTHKzmHGvvKWY506wdfi5E1h/Wsw0c3L0Pv8vgTpdZfKk4N+Up9RkY7b1iR
 CXXb5AH3hDqUIQyqIE3bNaqrjyEP7OzdmPov7KYOdSyV+agH9Thm/4de4N0f0z1xLYaI
 aTMQ==
X-Gm-Message-State: AOAM530dvXNOwCbeuE2i5FHWYBN8IzcLGpS19UiSurPB54J84Z3Vgv7l
 +lXbU5j8VZYeAiZx5Oas3Ro=
X-Google-Smtp-Source: ABdhPJyRYKqLTYuj65U35HowZN4mMgwJQgbTH6FKusmQCLCKBfVDNA7p4bBA6gxOvKQPOqkec1Ho9w==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr4175622wrt.159.1599165059655; 
 Thu, 03 Sep 2020 13:30:59 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:58 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 14/20] arm: sun8i: h3: Add HDMI audio to Orange Pi 2
Date: Thu,  3 Sep 2020 22:30:28 +0200
Message-Id: <20200903203034.1057334-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

