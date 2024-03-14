Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37387CA33
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA22A14DE;
	Fri, 15 Mar 2024 09:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA22A14DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492342;
	bh=yqiIwjG/S7XDJV/pa1WQy2erlDBpjOznaZZknYGr6Bk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4QbQIzF1fvywtJGGP5EE3ibWCLmkxRQZRo9b/aOiNyljXtTohQjvt+2yhjcUzcQk
	 WNZ1xvQX0fvgmuK0f8hG1gK+ihzcUUFAzI/2r9i/TjQT+759TUS0TKerTEyjNXueDd
	 uRyRejeOJ66uCDeU42ho+llNhFZamN2KVBZOoqS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FC08F80C96; Fri, 15 Mar 2024 09:40:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F116AF80C6F;
	Fri, 15 Mar 2024 09:40:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A9ABF8028D; Fri, 15 Mar 2024 00:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD50F8057F
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD50F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=F5+hAxaA
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 089C110001B;
	Fri, 15 Mar 2024 02:23:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 089C110001B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458588;
	bh=KNZWo7RkvOeyvRwAeuVGN8+SUS+q1CnUsbKOy62L+dA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=F5+hAxaAuDoDnxTAqPYowmUkkX/zJKODl8ftawtc03dmmjCxhn8MTZVcYf4q6FgsS
	 SHYEHSeJFJiglmOka3LVsX0BD9hxLA1CprfiPvvlo16P3uluxgV4X4L2jPEQn+RrMh
	 BGCW+nQuaPxLoxyr2qyTMd8phuzS3lXBB4s5YAXoBpn5zlbTc6NE+k3M/uN9l8lrLK
	 7+19l6E6fiYcj/t2+4es17KU8ajQtYABzmOlSKQJuNBjSQmQdXb1LRotSOgvD2HhdG
	 Jyrt8MJoejggzhXQZRDOIaX+SUvE0v7uxSL7YVColylFONTEPvHrU0wX8y7LuVAYzD
	 6nUconXFqKSBA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:07 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:07 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 20/25] ASoC: dt-bindings: meson: axg-tdm-formatters: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 02:21:56 +0300
Message-ID: <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from},
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S77Q3Z25AB6AIJIZGYNEGOTRDMWLW3HP
X-Message-ID-Hash: S77Q3Z25AB6AIJIZGYNEGOTRDMWLW3HP
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S77Q3Z25AB6AIJIZGYNEGOTRDMWLW3HP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add "amlogic,a1-tdmout" and "amlogic,a1-tdmin" compatible string aliases
to "amlogic,sm1-tdmout" and "amlogic,sm1-tdmin" respectevely.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../sound/amlogic,axg-tdm-formatters.yaml     | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
index 719ca8fc98c7..154522488020 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
@@ -11,14 +11,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,g12a-tdmout
-      - amlogic,sm1-tdmout
-      - amlogic,axg-tdmout
-      - amlogic,g12a-tdmin
-      - amlogic,sm1-tdmin
-      - amlogic,axg-tdmin
-
+    oneOf:
+      - enum:
+          - amlogic,g12a-tdmout
+          - amlogic,sm1-tdmout
+          - amlogic,axg-tdmout
+          - amlogic,g12a-tdmin
+          - amlogic,sm1-tdmin
+          - amlogic,axg-tdmin
+      - items:
+          - const: amlogic,a1-tdmout
+          - const: amlogic,sm1-tdmout
+      - items:
+          - const: amlogic,a1-tdmin
+          - const: amlogic,sm1-tdmin
   clocks:
     items:
       - description: Peripheral clock
-- 
2.34.1

