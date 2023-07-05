Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A9749701
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 10:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA507850;
	Thu,  6 Jul 2023 10:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA507850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688630560;
	bh=uwv5vX0EvbUJFyybNY7YJL2N7qs1n1kED892nmOMY70=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LI55CAKnqwpmCPwDQ/+oUMm0qjyaYSvNDqOSAa8Q011kL5if5FkE4KZyAKMl3s9JW
	 gqWGsAqflt3V6IBTs8naS2NWDl6uC7b2lI9QQOlEuLX59LtpWsO9vLaCUKFLwP6qwM
	 9hp8AYieUnXS4WtzUVAMWlzoW+S69AXijzh4Z6vU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CA9F80558; Thu,  6 Jul 2023 10:01:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B73F80558;
	Thu,  6 Jul 2023 10:01:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B3A4F80125; Wed,  5 Jul 2023 21:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF99EF80132
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF99EF80132
Received: from p200300ccff0adc001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:dc00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mk-0017Y1-DS; Wed, 05 Jul 2023 21:03:30 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mj-001UQu-3D;
	Wed, 05 Jul 2023 21:03:30 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: bcousson@baylibre.com,
	tony@atomide.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@gmail.com,
	jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com,
	andreas@kemnade.info,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ARM: dts: omap4: embt2ws: Add audio support
Date: Wed,  5 Jul 2023 21:03:24 +0200
Message-Id: <20230705190324.355282-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705190324.355282-1-andreas@kemnade.info>
References: <20230705190324.355282-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3ONSV6X6FP2JVDRPUY5MO3CSLI7YAJLC
X-Message-ID-Hash: 3ONSV6X6FP2JVDRPUY5MO3CSLI7YAJLC
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:00:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ONSV6X6FP2JVDRPUY5MO3CSLI7YAJLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a headset jack on the connection between control unit
and display. Wire things up to have audio output with MCBSP2 as a master.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap4-epson-embt2ws.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/omap4-epson-embt2ws.dts
index 5e9a997f686b0..ee86981b2e448 100644
--- a/arch/arm/boot/dts/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/omap4-epson-embt2ws.dts
@@ -46,6 +46,24 @@ key-lock {
 		};
 	};
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "BT2 Sound";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+
+		sound_master: simple-audio-card,cpu {
+			system-clock-frequency = <24000000>;
+			sound-dai = <&mcbsp2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&tlv320aic3x>;
+			system-clock-frequency = <24000000>;
+		};
+	};
+
 	unknown_supply: unknown-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "unknown";
@@ -274,6 +292,9 @@ &mcbsp2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
+	assigned-clocks = <&abe_clkctrl OMAP4_MCBSP2_CLKCTRL 24>;
+	assigned-clock-parents = <&abe_clkctrl OMAP4_MCBSP2_CLKCTRL 26>;
+
 	status = "okay";
 };
 
-- 
2.39.2

