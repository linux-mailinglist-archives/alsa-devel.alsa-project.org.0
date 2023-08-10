Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC9877886B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652A0829;
	Fri, 11 Aug 2023 09:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652A0829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691739674;
	bh=l1ZlnRn8z//foXTOvzBOYTGNCY67v+UDIv8VT9EnzPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SCINSjAFK59KMO2fq4sx3WZVIIzgANEczzzbrs9oCE2Z4/n8FMevuZRE+Cgk4wmyb
	 Xn7LLiyEmVtT1DG4+10nexvIVNHBcPaOro/LAnzvp1uPO8l/bCtuP1C10yLPSYmvac
	 ylZLVWsZ6MoT4nRBmeU33s8Vg/cJ5sfxzQl7cANM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E2B2F8057E; Fri, 11 Aug 2023 09:39:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07931F8057D;
	Fri, 11 Aug 2023 09:39:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE23FF8016E; Fri, 11 Aug 2023 00:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-127.mta0.migadu.com (out-127.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::7f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A7BF80166
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 00:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A7BF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=G9D1ygqU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691707796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dL6Ngh+RAsXyB4bL14IUKXOWyHxi2/XnqLmZv3QLPZQ=;
	b=G9D1ygqU6bbwFGM7Kci4Z/8jwSyUr8F/yB30/CiYLshmPVQBjrE6hbeiDs0EpOveaKmXdN
	abyrTmC6w5uXLqUAqv6nXO4vdpnyGm2vkIaCUcqKdpOpHEeae7AKXB75xTLPF5mhRp+iOL
	Rdu1P3R3GnLiOWu8MdOte7DD9Tx8D1TPZfAAk/6146hGldYLfclp14L7G71CyDQHSq4HKG
	h6rEBXWFAaN3rtgXktGERljrZLgCjd9TFQVl6YaznzZ+OkMlYT/G/5jITG2vSQHB5Iu2lR
	8AT2tG8Tgrrq0PLx5Rg1848NOX3W7AySaIWc2EJZ1UaQs2YOeiv3xqhC8DqxSg==
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
Subject: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
Date: Fri, 11 Aug 2023 08:49:30 +1000
Message-ID: <20230810224930.3216717-4-contact@jookia.org>
In-Reply-To: <20230810224930.3216717-1-contact@jookia.org>
References: <20230810224930.3216717-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5XHIDE5L7QDQXS27KJYYSDAUZNFND4J3
X-Message-ID-Hash: 5XHIDE5L7QDQXS27KJYYSDAUZNFND4J3
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:39:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XHIDE5L7QDQXS27KJYYSDAUZNFND4J3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The WM8782 can safely support rates higher than 48kHz by changing the
value of the FSAMPEN pin.

Allow specifying the maximum support rate the hardware configuration
supports in the device tree.

Signed-off-by: John Watts <contact@jookia.org>
---
 Documentation/devicetree/bindings/sound/wm8782.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8782.txt b/Documentation/devicetree/bindings/sound/wm8782.txt
index 256cdec6ec4d..a68061a3e671 100644
--- a/Documentation/devicetree/bindings/sound/wm8782.txt
+++ b/Documentation/devicetree/bindings/sound/wm8782.txt
@@ -7,6 +7,7 @@ Required properties:
  - compatible  : "wlf,wm8782"
  - Vdda-supply : phandle to a regulator for the analog power supply (2.7V - 5.5V)
  - Vdd-supply  : phandle to a regulator for the digital power supply (2.7V - 3.6V)
+ - max-rate    : max supported audio rate configured by FSAMPEN pin, defaults to 48000
 
 Example:
 
@@ -14,4 +15,5 @@ wm8782: stereo-adc {
 	compatible = "wlf,wm8782";
 	Vdda-supply = <&vdda_supply>;
 	Vdd-supply = <&vdd_supply>;
+	max-rate = <96000>; /* FSAMPEN is 1 */
 };
-- 
2.41.0

