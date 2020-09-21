Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD527215A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE13F15F9;
	Mon, 21 Sep 2020 12:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE13F15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684759;
	bh=1jaUTW1IS/d+0xKEIaljMnyEL+efvJY6RnPLC7maicM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ID+A+WKg4eG+zuYfBztyIJHxlP9B7dQ76coyYaI04rxTrcAfxasL9u0dxFF+i/KCj
	 CkRnJPMsJqI9DMdVE7QHYA6zyduUeX3vDjvWTMpaz6fT1ZA7XuqKqlXKMIpeCj1jr7
	 K983jD1CDQ4anuyO9YWOrYzTpZybq8zwvabTzt98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 339A5F8036C;
	Mon, 21 Sep 2020 12:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33698F80321; Mon, 21 Sep 2020 12:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BB57F802E7
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BB57F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZW6wrgSM"
Received: by mail-wr1-x444.google.com with SMTP id x14so12119266wrl.12
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=ZW6wrgSMfYxgif33Kz/lroDpkdiTU4iuIn2PtCRXxOXVMe2ksDUa/8wIT1o4s3n+f2
 zQPk6E8LgsYiBzCwK3R5cUF6xsltrWBtsSR4Mi+S21+B6eMDu5+T0ZbBahPWy7u32YSW
 uHap/BiQx53V0PuL+V0zmtgETiMK3WGdjlYG9g3sTxHKkkej/QHS3nDDofkhTn6NBH2u
 sdKRoJMZ2dKz6jJA2+lsYvOqhTa37GFAHT/9qOwDl2GJcXJh9CfzGYM+pT67o3qNDTyO
 ls1w2x4+9ER1E2F88TsMT+RiItGA4ykcmrP/WktLLGM2SK8TnRZR6C+hdEeR8yTMA+sb
 6PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=JUCEvdvM3bQouuzapFEv4wELjWQA6wXjqOE8OJuBU4XaD+ZKtOjyHjU93on4D20Spa
 XVDnhxBIHynbVmSvbNH/SvZJQEoz/eiHhs1Tg/itqnAdPAQU04QU6eZutso6Ms2iiofb
 crRGJAoMDa2NygRJrcJX7FMYEp/4N6MKE9W9gO0njxurUJy2QnM+s7MAa++azEx3OGbd
 K7jSZpYBo5+ymZpaFQTC8xLXaLjYdbyBAbt/f+sa3wiArAuHP5WzHgMPS8LazXYY4tgI
 bKTjUBsI1lQGYtUK5QgGoMtM1f5AxiBV5yjc3G/vrnZYxSLEU0tDqDcRdBWZszfbboOj
 SWFg==
X-Gm-Message-State: AOAM531KZBUNZI4HD/e0VZ9rLcEBtxmVr9bJfzDqQ1MtDepO67omXWKH
 ORjT6L1AG3AXpsPgBbRO+DI=
X-Google-Smtp-Source: ABdhPJw+N0hl60ai0XxfnZRrWPsVOUbJi8FOQfoxT8jn/Ckk1g2vrSblyPH5uY/eNBzU3OU62x1ZXA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr55330946wro.152.1600684077678; 
 Mon, 21 Sep 2020 03:27:57 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 18/22] arm64: dts: allwinner: Enable HDMI audio on Orange
 Pi PC 2
Date: Mon, 21 Sep 2020 12:27:27 +0200
Message-Id: <20200921102731.747736-19-peron.clem@gmail.com>
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

