Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD279F047
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD427886;
	Wed, 13 Sep 2023 19:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD427886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694625497;
	bh=1XlQ9Rivp/8oRqBuqcv7ZtHUa2otWULan0gYT0lZUng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sM8nsomTaQq69NkZHaEy+VLYOHn8HggNbYnBI1ZjIyToZEwJBGcP7eA27E/HHc86E
	 NFLssmZay7BRx/IQQHQ3ca+rNTbyg2pSEaNgMUvSxg30CWr+RCWPkj2VApLZk6xZya
	 0kNdr8b6CuRqFdERXDVEhERh60dmchtPX2QT1jnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C20F8F805A1; Wed, 13 Sep 2023 19:16:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 623C2F8057E;
	Wed, 13 Sep 2023 19:16:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FC16F80587; Wed, 13 Sep 2023 19:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-225.mta0.migadu.com (out-225.mta0.migadu.com
 [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01147F8057B
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01147F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=Eo7GK7lq
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694625390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7MW2tmPsMPWsEPrNQ/SepXgoJLxl3hENl0P4TjZeAI=;
	b=Eo7GK7lq/gTTAwl8Iy1o6l/u1wMdmmidG3pp1PYNMzKEUtD+WJr9xocXAp9ZMJZSwY5uhA
	qKi1EQ+yRFZou1//6N1q5p+JacFDiV0LjBsntUl1g2ZhyNYir1b+IPuyokqE4z1qsQETOz
	Lb/6JJomyGI2HGW0AmFvoixKxa6o5eUMZNMIvrxr7N/NezCHvHYu3lMCBJdc9VHTxWrt3w
	ysEMyzsFcwILr8JB/zSDpBbwyoR1kKQJhVp7AbMNuJo3POkswmSpkrNjgOFU8oXJIu09lz
	E5KlceLKLs4DYHNycBjvgf8ntchf6F8h5bO+z2PhTGej7RrrdIY4B0Je+jJW1g==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Date: Thu, 14 Sep 2023 03:15:52 +1000
Message-ID: <20230913171552.92252-4-contact@jookia.org>
In-Reply-To: <20230913171552.92252-1-contact@jookia.org>
References: <20230913171552.92252-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: WTVBNQ5E2SJGDT7NLSWOJ4UQLSYM6D3D
X-Message-ID-Hash: WTVBNQ5E2SJGDT7NLSWOJ4UQLSYM6D3D
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTVBNQ5E2SJGDT7NLSWOJ4UQLSYM6D3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The WM8782 can safely support rates higher than 48kHz by changing the
value of the FSAMPEN pin.

Allow specifying the FSAMPEN pin value in the device tree.

Signed-off-by: John Watts <contact@jookia.org>
---
 Documentation/devicetree/bindings/sound/wm8782.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8782.txt b/Documentation/devicetree/bindings/sound/wm8782.txt
index 256cdec6ec4d..d217a616e103 100644
--- a/Documentation/devicetree/bindings/sound/wm8782.txt
+++ b/Documentation/devicetree/bindings/sound/wm8782.txt
@@ -8,10 +8,15 @@ Required properties:
  - Vdda-supply : phandle to a regulator for the analog power supply (2.7V - 5.5V)
  - Vdd-supply  : phandle to a regulator for the digital power supply (2.7V - 3.6V)
 
+Optional properties:
+
+ - wlf,fsampen : FSAMPEN pin value, 0 for low, 1 for high, 2 for disconnected
+
 Example:
 
 wm8782: stereo-adc {
 	compatible = "wlf,wm8782";
 	Vdda-supply = <&vdda_supply>;
 	Vdd-supply = <&vdd_supply>;
+	wlf,fsampen = <2>; /* 192KHz */
 };
-- 
2.42.0

