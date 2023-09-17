Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB07A36EA
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 19:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6DC1CE;
	Sun, 17 Sep 2023 19:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6DC1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694972393;
	bh=1XlQ9Rivp/8oRqBuqcv7ZtHUa2otWULan0gYT0lZUng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I7oWkzJ60kwPZhRRQnW2yQQ6wyg6Vx59vNj5iwsysTGUWJ6bdXlVDANWopTIhooJe
	 gHThujswn0pvJNdBWwOIu/etGXM24ISotEcjX8fghLn/hhrDNtlxhEMMwRaqBbZwi0
	 nn8wTHKeao34AKEJYRyeuIR6m3W9/K1kLr1R27V4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE39F805A0; Sun, 17 Sep 2023 19:38:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 965F8F80580;
	Sun, 17 Sep 2023 19:38:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F212F80587; Sun, 17 Sep 2023 19:38:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-224.mta0.migadu.com (out-224.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::e0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC176F8057D
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 19:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC176F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=wJwlE/Of
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694972278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7MW2tmPsMPWsEPrNQ/SepXgoJLxl3hENl0P4TjZeAI=;
	b=wJwlE/Ofi50/y/H4up8laHm0ljxhap2gvtXoyhHYGjVXcSPeWR37RX4m1+Fbh4XYwDccNT
	UUh3jDu0uE0tPGNslW3C+yMb8RaOdWsyIYb7EuTdKQhPvZYK9UBqczeQr+yryBjykvugX0
	6L5VDCpwSORqm6cakp6VcKqTS6It0gwKsiFp0V9Gyz+/DyDip4tNBWihmbRfu3+oAT6iSs
	PuF9Oun71u4EAl5FhaVfO9KOOPKr2m1OIbxh87ffuKKT1oyT+1QVF65QJLz6e3iScxfXuI
	wskXggUR12+bpSyscBu1p/TpgwgjLQaSnLyTwX1N1qsSMDWNcS7meHwxHRHDCw==
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
Subject: [PATCH v3 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Date: Mon, 18 Sep 2023 03:37:26 +1000
Message-ID: <20230917173726.1916439-4-contact@jookia.org>
In-Reply-To: <20230917173726.1916439-1-contact@jookia.org>
References: <20230917173726.1916439-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: 47O4M5WP4EGYNCPTXFRRRYL3OMIJVUY3
X-Message-ID-Hash: 47O4M5WP4EGYNCPTXFRRRYL3OMIJVUY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47O4M5WP4EGYNCPTXFRRRYL3OMIJVUY3/>
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

