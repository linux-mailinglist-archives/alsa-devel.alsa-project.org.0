Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF81977E49
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB8B9E8E;
	Fri, 13 Sep 2024 13:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB8B9E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226038;
	bh=MjTDozSO25dJqutHnvvKIt+CxnDOzKA6MZ7DnQLbgE4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PopNYrnY/B8Lh4Y7HoFv78lp0MU8wuJZTXNr4NoyYkbrLEoUHJNa3FZV9jMzeuZom
	 sN4vVCDqSkpD5P3kB83JFoRtf87Bt/kqNSH4n551rTLGX3d1wfkPl0J2w+q+rD9J4z
	 26z3pF4zjknYOiUbAhcQ3MZ4rIMyQ4/nqWF08BqQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6038F806B9; Fri, 13 Sep 2024 13:12:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2F1F805F9;
	Fri, 13 Sep 2024 13:12:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A74AF801F5; Tue, 10 Sep 2024 10:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D69EF80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 10:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D69EF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=EJ0Tmd/A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725956649; x=1757492649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MjTDozSO25dJqutHnvvKIt+CxnDOzKA6MZ7DnQLbgE4=;
  b=EJ0Tmd/ABCA2vh/rkyr104sszpEYzOXWkHPCmRqNN9x282F0y0f1X/nC
   V0n/HBFl8t3tmQG5vSlkdv1uugow+awX4glBt8C9V5ytTfUQViFuLi6Oz
   7q2YxoYhEC51FH64+au55ATiI4fDSK8m/VhZefK/RAaH0cyhIUs4h0zAQ
   LEkyuLzbywQIlhvy6f02HF3WAS21+4kahVMwV47fqIrNRlqzluf9U/vWI
   mtbGdMMlgUCraMaJqG1uzD6rlkeWSv3Cp9OJ3e+JvYeIvWg2dfM2BSlfd
   lMg1CQdHSqcb/3uJHmmn7TwX1ZfewAYuouAskRyHjRMnYAKsynMgV5egl
   A==;
X-CSE-ConnectionGUID: iHNlYK4jRDu9l7omWRWKHQ==
X-CSE-MsgGUID: TlHYxewcTX+SMSNajrhm9w==
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600";
   d="scan'208";a="32196567"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2024 01:24:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 10 Sep 2024 01:23:49 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 10 Sep 2024 01:23:45 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <codrin.ciubotariu@microchip.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH] ASoC: dt-bindings: microchip,sama7g5-spdifrx: Add common DAI
 reference
Date: Tue, 10 Sep 2024 11:22:03 +0300
Message-ID: <20240910082202.45972-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=976abeccf=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7NOQT4J6GM4KEXEDYB6FLN6MHLHW76E6
X-Message-ID-Hash: 7NOQT4J6GM4KEXEDYB6FLN6MHLHW76E6
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NOQT4J6GM4KEXEDYB6FLN6MHLHW76E6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the spdifrx yaml file to reference the dai-common.yaml schema,
enabling the use of the 'sound-name-prefix' property

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 .../devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
index 2f43c684ab88..7fbab5871be4 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
@@ -13,6 +13,9 @@ description:
   The Microchip Sony/Philips Digital Interface Receiver is a serial port
   compliant with the IEC-60958 standard.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   "#sound-dai-cells":
     const: 0
@@ -53,7 +56,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
-- 
2.34.1

