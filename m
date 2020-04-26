Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B231B8FB9
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 14:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81CF1683;
	Sun, 26 Apr 2020 14:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81CF1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587902841;
	bh=UVw8JHYo47VkKu8Rjy/hcv8ErZb46swMtSAuvRH4tR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qovIcXyqmZIiTJtkAiFwJHcLXJtIiE2f1crvPPyjSHcGRjr+ziUIYnCMtA8fGyMPl
	 RjlPOK8dnY0NDr/pWA2Cen8m+qSTeLTCym5BfZ8rpBzBQqvPX9IhsIqLOvZ+PwOrjX
	 LiKSK7E3pTKrWnSOsNndZKRvnrh96iMnJHjTRCn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FADEF80245;
	Sun, 26 Apr 2020 14:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E79FDF80113; Sun, 26 Apr 2020 14:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E0D2F80136
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 14:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E0D2F80136
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PuhG3pd4"
Received: by mail-wm1-x341.google.com with SMTP id h4so3107288wmb.4
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JenE0fEHUuGOY59D+9+b4JVrWQ5bnv0TWy8Is92oGAI=;
 b=PuhG3pd4LENiw+3akKIphd684cvbNp+m+e7wETgmmogANBMf2IUlTiUv6/+ZR3twmm
 8PKUDRzyH1LZ9uTW0ChOX7OLnh6J1jFnuGyF5GQLqXvj/rpbRGM2M+aclTd/tlaA8I9S
 zoOWMUSnJXnuu3Mya8aOTklwTL67oTm398/l+tYSrhKMq0UxjjHh+//Yy9As7Jq6vUvE
 yHkYY1e+IMKM7Eud7FGWEuFZTHdqDCQY2TXTlzJX43QVU5wBEdu9IxSw9MrD7YJVirl2
 FR+1Ctk7uTjHB7otGlPl/LZb0YhL5CTw4UAcuSywFP/jD3c6ZXUJ6zv3+B6BGY1C9Fs3
 1hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JenE0fEHUuGOY59D+9+b4JVrWQ5bnv0TWy8Is92oGAI=;
 b=q7cJirbiJPSoQWWHWZ8mA7xQ8dnuvyP67e/2t0jLs9rwzE5F++Fn9vIyqpl+GvK4pA
 AH99Sy/6uhfomCASDj/2xeTykzhesxgHOQeI49+R1ByTxUQJ/u6e+Y/qt0QCQF6nucXR
 uKMNiYfKP2zo93JnKJjK30mwbBHbfoBa3bQOT7R2MO7vjGpTRMHi9PGjtukk906djqNQ
 x05wCfBsOH7c7tZcHc5gA6hQKJlxApK+xhCctuyR6VdEBz6QYhYrpyyXbFLHGhWfDjub
 mStYx4OVQ7jyBhRgCJUaNQMiUPDrPDO/A+brqh05Hwhgsg7O7G37VWsG2bKur6pJ0021
 Nirw==
X-Gm-Message-State: AGi0PuZrzxp0Bsz0hGD01t1gPgax9l9yP7mkak8t/t8HUVdXd+OTSRqM
 zJrOs+tZukiN4BMsptjjHUQ=
X-Google-Smtp-Source: APiQypIEJTvJUtupeAfilLnksXm+HBYSzaFmjg+EIAPU4aLI3y84HQ3t53IugQfHHJS+CiIW0H3ifQ==
X-Received: by 2002:a7b:c850:: with SMTP id c16mr19592486wml.108.1587902687908; 
 Sun, 26 Apr 2020 05:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 s24sm11120026wmj.28.2020.04.26.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 05:04:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/7] arm: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Sun, 26 Apr 2020 14:04:36 +0200
Message-Id: <20200426120442.11560-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426120442.11560-1-peron.clem@gmail.com>
References: <20200426120442.11560-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
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

Add the new DAI block for I2S2 which is used for HDMI audio.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 22d533d18992..9be13378d4df 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -662,6 +662,19 @@
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
-- 
2.20.1

