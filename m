Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4887CA1D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:43:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C021923;
	Fri, 15 Mar 2024 09:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C021923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492193;
	bh=ybkbzx+DIvWdFpyy8EDoKSIvtWeGkBDccrQr3+eS2DI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jqeCF8PwounBg1aaN9LDBU+1HPRkx5CVlu53YXGwdVPhvoPf+zZk8bl5LYrA5htI1
	 xcJn2E/YY/1g7izGo2mws66CTfRd+nQhf+6EYVqA2AZ+nnT7KZe8d7RlvoYa+TNCIs
	 V/4vmWy7wJLW6zpHcFfJwGE698NouTh/YEPTurV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B8DF805FD; Fri, 15 Mar 2024 09:40:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A59B7F805FB;
	Fri, 15 Mar 2024 09:40:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C7A9F80578; Fri, 15 Mar 2024 00:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E26F8057C
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E26F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=pmWgkXaJ
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C2A15120012;
	Fri, 15 Mar 2024 02:23:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C2A15120012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458586;
	bh=9SRIX/FvqDap0SMfdebaXOrywr2NEUWz33l2V3WObDM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=pmWgkXaJSxRnY2mr5czzY/iGGINaK0+pU7azMlmYipUFsMcwF9rY+yRy3nkG4tXhI
	 h2emBkJj73eur4HHgzAvK2iDeQHORBbLT/QWiW7uzbkaIitQSQItPYflNW+VEYDcC6
	 A1sdhRNU4DeQNrK/nbK9uBZKi3zcbleBIlZMg5Agrqd9GPCTR5FxoeibVlSu1gWReA
	 U2RLXn7gdbNpy8fyHwxgfX1+y/ACrMsZ5Z8JMgVh/8cwK/OVYZvuYb5D/zT/5a+/i5
	 rFFP+gp6rfElFV+4AgcN3FfjOGBGU1qaSo2zmQ8v5W5YTJBL8xcbMkVNffkNWsJeUb
	 S+K2xl1zKyVEQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:06 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:06 +0300
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
Subject: [PATCH 17/25] ASoC: dt-bindings: meson: axg-fifo: claim support of A1
 SoC family
Date: Fri, 15 Mar 2024 02:21:53 +0300
Message-ID: <20240314232201.2102178-18-jan.dakinevich@salutedevices.com>
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
Message-ID-Hash: JQSQIEY2OV7KCE7EPFJAVGBGCLXUSO4Q
X-Message-ID-Hash: JQSQIEY2OV7KCE7EPFJAVGBGCLXUSO4Q
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQSQIEY2OV7KCE7EPFJAVGBGCLXUSO4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add "amlogic,a1-toddr" and "amlogic,a1-frddr" compatible string aliases
to "amlogic,sm1-toddr" and "amlogic,sm1-frddr" respectevely.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../devicetree/bindings/sound/amlogic,axg-fifo.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
index b1b48d683101..1e809c7c2179 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -25,6 +25,14 @@ properties:
               - amlogic,g12a-frddr
               - amlogic,sm1-frddr
           - const: amlogic,axg-frddr
+      - items:
+          - const: amlogic,a1-toddr
+          - const: amlogic,sm1-toddr
+          - const: amlogic,axg-toddr
+      - items:
+          - const: amlogic,a1-frddr
+          - const: amlogic,sm1-frddr
+          - const: amlogic,axg-frddr
 
   reg:
     maxItems: 1
-- 
2.34.1

