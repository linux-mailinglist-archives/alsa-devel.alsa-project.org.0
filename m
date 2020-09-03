Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECC25CB34
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249D21A99;
	Thu,  3 Sep 2020 22:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249D21A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165563;
	bh=6zCMgV1md5O08oZMh2wGxa+FHEFhgrmUinhzD32bOe4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNtPSQEz/MRqdi+rpZ4t6J7dWRTU2rRllvrPuYue0BUxz9E4sMFDc02rovYbZEBID
	 AkeGaRG8HyrEZ3gGzT656Os1Mngei//xkVTMZXgK0WFi+w1AsLRx9jLqetO/TuKNRP
	 +h65DdHVKCa15tN+0r6uEqBDK5urFiRn6fUH5np8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B755F8034E;
	Thu,  3 Sep 2020 22:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90B01F80346; Thu,  3 Sep 2020 22:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A392EF802FF
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A392EF802FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OL+plDQh"
Received: by mail-wm1-x344.google.com with SMTP id a65so4094879wme.5
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1wxiSXb6FjGblsvKrZYztMSCVGGVQHB+0DmuQ/lyxA=;
 b=OL+plDQh20KZVwoejg2KN9X8Hq8GnRM55YHAPi2BYf4c8ALvLa7S3EudTejkposcwT
 eMojv4lnaCgJ+oxKEaQQPQ5jdKhnHG6ScRtydzpzxok6b3Y70tWKSpHJ5rdil5Av/p1L
 CWnagXRlwS4nPowKltK66LMVDCtEa/1CgxCuC09qMce/jwOohzIoJLXv/gy284vD6YE4
 9rK+KuZMkHvR8yKRw7UpNyZAeyiBFpzF5tFtJCSNKcBvW4Zj843GrYfySVwBOwdqT3Q/
 GSdSHcBx698Y6NltRrlmRAeCZzY0Jcpnl07q8IS9WvnXb4Xg8OLk5HRSTarBW1pRgpOI
 i2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1wxiSXb6FjGblsvKrZYztMSCVGGVQHB+0DmuQ/lyxA=;
 b=GIjLqveDzacpgNJK0QpUrq2QnPnzq1c8aQpTgtaQcntWd/1u75bPw4BBJIYwCVo1Q6
 gKCsf547k3zNk7DBbBS9DjiRgb5K70xJxOA5vKxTKn9ZQatCMlzCaF6N2+mAtEq2I+7q
 45uy3FLYhrF+gxZSpO5UVmJ1aejCRM4Egg6HL9FN/zEu1iWu0/aXTvnu6VegTi8a9a6O
 lr0TzU3cp9xSuUVPNkHPEmci6U9ymZPKP7+mgt/r32b/XR70ZQ5jvxTFchgwXClQbIHI
 X75i20RbBpZb4oki48V1QuGArTrSCAo6k4hfgmoKKokBv28GBiqDxh9Qufd7t9hD3rbh
 CBhQ==
X-Gm-Message-State: AOAM530dl4uvXBV/Nww1KiTUixiZaxhh3b3onULBQAVo6qzofSmdXe3M
 DPMm5j9GWpzBeli37xQxIyF6INQG//SJjQ==
X-Google-Smtp-Source: ABdhPJzkXCUBILkMkPYop6qSrxQHWedhn7UttMrdppk/1h8lrO7MVqPiA9PFSyj4oQrk9Zgvnb+jzw==
X-Received: by 2002:a1c:f30f:: with SMTP id q15mr4187654wmq.60.1599165062201; 
 Thu, 03 Sep 2020 13:31:02 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:31:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 16/20] arm64: dts: allwinner: a64: Add HDMI audio to Pine64
Date: Thu,  3 Sep 2020 22:30:30 +0200
Message-Id: <20200903203034.1057334-17-peron.clem@gmail.com>
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

