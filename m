Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC695BE717
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB341614;
	Tue, 20 Sep 2022 15:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB341614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663680559;
	bh=1fcbXZeScQcLotv0gPiS1nNUsEdY9jyJFjsJdQHPPQI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ku0EyITMoBxQFsO3OLFDla32sbrdzZpFZbt23Zdz0kdsqV8Ah7D7bbXDGN6I6VvDt
	 f4kqeOIG1r/kl5dDwVefeh2IGGgOXH044TuVI5+xMJj9a9DY3ynYJVqjKyqPif8HW6
	 q6bhmVcDJcmfvnlsneXPiEw7YgfeawiCHkT5ITzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 532CCF8053B;
	Tue, 20 Sep 2022 15:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB42F80538; Tue, 20 Sep 2022 15:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D63F801D5
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D63F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n+FRQAnx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C4AAB82939;
 Tue, 20 Sep 2022 13:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AF0C4347C;
 Tue, 20 Sep 2022 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663680451;
 bh=1fcbXZeScQcLotv0gPiS1nNUsEdY9jyJFjsJdQHPPQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n+FRQAnxkPyOxYuPptioo1CnZfLJ4GXyMQm14RjccLhABRTQZ/A1kp9/IfxmH1QIM
 HG2yNpVQwu8TxZwklm8QhHfhzEO0kSPlHsHCEa5fWQ20oO+Gnga7PCnkb1kWWPbPwK
 1UbDtg9j+k6ac0FRy2E6FZyQiOLzjLEfklchKHFEE3s1ydrQy4YhRkD2jXrGOpgOiw
 L/rHEZtYF71vffBn2KBUkCQLnypLGNzZNWF1eKiDe6xTZRKYVX9917hKJPFlszNmcZ
 iZVfNgqq7qIBxFC5oRyVZ/u7kgNFLhrPLKU2+2571HDR4sH42Z6OIh3VQC9IFG7orb
 tbgofw/Ivi1fA==
Received: by pali.im (Postfix)
 id E25DB2E12; Tue, 20 Sep 2022 15:27:29 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 5/5] ARM: dts: turris-omnia: Define S/PDIF audio card
Date: Tue, 20 Sep 2022 15:26:48 +0200
Message-Id: <20220920132648.2008-6-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220920132648.2008-1-pali@kernel.org>
References: <20220920132648.2008-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Turris Omnia has GPIO51 exported on pin header U16, which works in S/PDIF
output mode. So define S/PDIF audio output card for this pin.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/arm/boot/dts/armada-385-turris-omnia.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boot/dts/armada-385-turris-omnia.dts
index d1e0db6e5730..fd0960157589 100644
--- a/arch/arm/boot/dts/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
@@ -105,6 +105,33 @@
 		 */
 		status = "disabled";
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SPDIF";
+		simple-audio-card,format = "i2s";
+
+		simple-audio-card,cpu {
+			sound-dai = <&audio_controller 1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
+};
+
+&audio_controller {
+	/* Pin header U16, GPIO51 in SPDIFO mode */
+	pinctrl-0 = <&spdif_pins>;
+	pinctrl-names = "default";
+	spdif-mode;
+	status = "okay";
 };
 
 &bm {
-- 
2.20.1

