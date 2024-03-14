Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E415687CA37
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11969227C;
	Fri, 15 Mar 2024 09:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11969227C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492408;
	bh=no/BaOcNF/CJFMCkCB326IrOeqdTQjbbbUPW7iPJHDY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PykJrjkEkH/78lHij99KYYQOm4itSSQWW3vYaNervX39lPrvqMiwn+qqkcldHH8mq
	 a+kBPI+5xMUbwzeDY2m6X9aJvhCXhIX4Xd22MZkwIPhTVqZ7kWX/gNIcuGh4LwaluN
	 Br/srEoS6UCFydtvJoeXuj0mcwxMz3atut+pTNcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0890F8028D; Fri, 15 Mar 2024 09:41:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A26CF806FA;
	Fri, 15 Mar 2024 09:41:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4E1FF80571; Fri, 15 Mar 2024 00:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04C28F804B0
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C28F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=XJMIhSsd
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5D8B8120016;
	Fri, 15 Mar 2024 02:23:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5D8B8120016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458588;
	bh=lfafaGrQIktQg/rWyr/aK5n5leCd1McAMyotoMmDk/s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XJMIhSsdEN0VNh5LqWmllNaCWjm6KhGkX598dYM2LT2xyqTJXyNmOH1uARpOqQjrt
	 Y0IBu4MjycToMERvuohkmj/9GVCf6w14ND/wh0LQagQpowKY1HCnDG0Fr0cuegaolg
	 A7DsZZGsiEMIiRDTOCY1hh2RYFKhLyKnYJfmm14Vivg/01FKalrLfggCnTMI7f0qUi
	 IWsnv/c7+XZVpCu+Zw4aIbqVDB0BI1ea3Me55Bklwk3kYvDVeWmKAuzTTzqAxwYk59
	 nGB+UGsLjsJnbxQYPczYegFVjzx3iQHiUQ4vCp8FwgcShUTa1cLr7G5s192v2LTaJE
	 xysw/Jg2nPMYw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:08 +0300 (MSK)
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
Subject: [PATCH 21/25] ASoC: dt-bindings: meson: axg-tdm-iface: claim support
 of A1 SoC family
Date: Fri, 15 Mar 2024 02:21:57 +0300
Message-ID: <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
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
Message-ID-Hash: DW6OTAY7X6ZSY3XCHYZ4E5LFO26RNFBA
X-Message-ID-Hash: DW6OTAY7X6ZSY3XCHYZ4E5LFO26RNFBA
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add "amlogic,a1-tdm-iface" compatible string alias to
"amlogic,axg-tdm-iface".

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
index 45955d8a26d1..7c1af85b52b4 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,axg-tdm-iface
+    oneOf:
+      - const: amlogic,axg-tdm-iface
+      - items:
+          - const: amlogic,a1-tdm-iface
+          - const: amlogic,axg-tdm-iface
 
   "#sound-dai-cells":
     const: 0
-- 
2.34.1

