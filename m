Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01765BE71A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501B7163C;
	Tue, 20 Sep 2022 15:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501B7163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663680610;
	bh=j3AJ+gvrSPJXkwy4uwzUn+Y5wSHluaeR3mpbyFCwTGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkksYvmAcTzELiJwPjjZ5Y2ceZhVR/jV8aylLkiL1Fav1xPDCS9k6tKLMEgg+ZnbL
	 CdYHECTvfZWVP7ds+01IpzmUbB87aWgGWDKvhxSxzcGKrHjr6r2OeLPmCoU7d6+68u
	 UYtqlQGwp+TZzsbsx2McV/URf9G50Mjo5ISxd3dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 871D9F80559;
	Tue, 20 Sep 2022 15:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9A82F80553; Tue, 20 Sep 2022 15:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47EFBF80171
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47EFBF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UzwC/fMp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 16023CE185D;
 Tue, 20 Sep 2022 13:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896EBC43142;
 Tue, 20 Sep 2022 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663680451;
 bh=j3AJ+gvrSPJXkwy4uwzUn+Y5wSHluaeR3mpbyFCwTGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UzwC/fMpcZHK84uKl1WNEWXfZiWlnD4YDAVv6EFoTILb4768oyWqSVjTBD6QHuVK5
 xB/Q/fsYK5DxTNoJkfKSwBDNNiuwrFLB8YmCMXAVQtwWk9N20TNplX60AUapFg+ONQ
 ul6/vQRAB99CN2s6op8JgR0AxQNGhwNmbLqonH3JJluEZSZK97kDfRtuKdFPibwaKj
 06Boyk+oJ1B55V+WA/4GHIl9GKFWIXMgWD7FLE7RYAWlXQNRBDTLoEzO40zrYGAacS
 WVsGGLhnCPVzpwd0WDw+lxu+ZjAm5CrkMxsWaaFZAu5xS/rYcmpOg6tGrnvYb8ahii
 qDc2/z+ljCZkw==
Received: by pali.im (Postfix)
 id 08B1B2D7D; Tue, 20 Sep 2022 15:27:29 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 3/5] ARM: mvebu: add audio support to Armada 385 DB
Date: Tue, 20 Sep 2022 15:26:46 +0200
Message-Id: <20220920132648.2008-4-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220920132648.2008-1-pali@kernel.org>
References: <20220920132648.2008-1-pali@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

From: Marcin Wojtas <mw@semihalf.com>

This commit adds the necessary Device Tree information to enable
audio support on the Armada 385 DB platform. In details it:

 * Instantiates the CS42L51 audio codec on the I2C0 bus

 * Adds simple-card DT binding for audio on Armada 385 DB

 * Adds description for both analog I2S and S/PDIF I/O

 * Disabled by default

Signed-off-by: Marcin Wojtas <mw@semihalf.com>
Signed-off-by: Nadav Haklai <nadavh@marvell.com>
Tested-by: Star_Automation <star@marvell.com>
Tested-by: Lior Amsalem <alior@marvell.com>
---
 arch/arm/boot/dts/armada-388-db.dts | 69 +++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/armada-388-db.dts b/arch/arm/boot/dts/armada-388-db.dts
index 5130eccc32af..2bcec5419b66 100644
--- a/arch/arm/boot/dts/armada-388-db.dts
+++ b/arch/arm/boot/dts/armada-388-db.dts
@@ -36,6 +36,11 @@
 			i2c@11000 {
 				status = "okay";
 				clock-frequency = <100000>;
+				audio_codec: audio-codec@4a {
+					#sound-dai-cells = <0>;
+					compatible = "cirrus,cs42l51";
+					reg = <0x4a>;
+				};
 			};
 
 			i2c@11100 {
@@ -99,6 +104,12 @@
 				no-1-8-v;
 			};
 
+			audio-controller@e8000 {
+				pinctrl-0 = <&i2s_pins>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			usb3@f0000 {
 				status = "okay";
 			};
@@ -128,6 +139,64 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Armada 385 DB Audio";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Headphone", "Out Jack",
+			"Line", "In Jack";
+		simple-audio-card,routing =
+			"Out Jack", "HPL",
+			"Out Jack", "HPR",
+			"AIN1L", "In Jack",
+			"AIN1R", "In Jack";
+		status = "disabled";
+
+		simple-audio-card,dai-link@0 {
+			format = "i2s";
+			cpu {
+				sound-dai = <&audio_controller 0>;
+			};
+
+			codec {
+				sound-dai = <&audio_codec>;
+			};
+		};
+
+		simple-audio-card,dai-link@1 {
+			format = "i2s";
+			cpu {
+				sound-dai = <&audio_controller 1>;
+			};
+
+			codec {
+				sound-dai = <&spdif_out>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			format = "i2s";
+			cpu {
+				sound-dai = <&audio_controller 1>;
+			};
+
+			codec {
+				sound-dai = <&spdif_in>;
+			};
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dir";
+	};
 };
 
 &spi0 {
-- 
2.20.1

