Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9573DE3C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 383BC1557;
	Mon, 26 Jun 2023 13:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 383BC1557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780365;
	bh=HE/thYOvJGL/d13OsuGiM1DJPuw8iVo5ji3PwC6FQrQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z5SwwiwMPKoDExJw2HbX08VbdCKqqW78+0n3ILTC3hor49XdkLPAlp92wurq43/Dw
	 L5wF4VSD8L2JKRM8KzuTMJi8RAG9g+b7A9k/KCC5eqbjFqjepyOEsDoguco8PdQWHM
	 zqrPTWdf20Wf3HAxj1M9QSueQ4ERZqksagdjFXII=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 832E7F80710; Mon, 26 Jun 2023 13:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BAC6F806FC;
	Mon, 26 Jun 2023 13:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DF97F80558; Mon, 26 Jun 2023 13:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 063DEF80552
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063DEF80552
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 05EF924DE30;
	Mon, 26 Jun 2023 19:09:12 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:12 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:11 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy PWM-DAC
 transmitter
Date: Mon, 26 Jun 2023 19:09:05 +0800
Message-ID: <20230626110909.38718-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626110909.38718-1-hal.feng@starfivetech.com>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZEGFL7Z5ZGB2VPEIJLH3C2K26W5TDH5P
X-Message-ID-Hash: ZEGFL7Z5ZGB2VPEIJLH3C2K26W5TDH5P
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEGFL7Z5ZGB2VPEIJLH3C2K26W5TDH5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../sound/starfive,jh7110-pwmdac-dit.yaml     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh71=
10-pwmdac-dit.yaml

diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmd=
ac-dit.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwm=
dac-dit.yaml
new file mode 100644
index 000000000000..bc43e3b1e9d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.=
yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac-dit.yaml=
#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Dummy PWM-DAC Transmitter
+
+maintainers:
+  - Hal Feng <hal.feng@starfivetech.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-pwmdac-dit
+
+  "#sound-dai-cells":
+    const: 0
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwmdac-dit {
+        compatible =3D "starfive,jh7110-pwmdac-dit";
+        #sound-dai-cells =3D <0>;
+    };
+
+...
+
--=20
2.38.1

