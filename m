Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368D73DE34
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EB6154B;
	Mon, 26 Jun 2023 13:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EB6154B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780316;
	bh=gWdG1M4a98myWhCn/Z/YhDxBcdp1hi0QIENk+llzqZo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YIBqI/mIj9k6Fg6pxii351fPntSrTcIYCttCXLNNI3VHPoazWttNPfW7YW/yk9LQt
	 yus/Bt1/o0zq77pN1s62FXpR23QFstUq9tOU53NnqTjRTJwcQ3dNDRKjwK/1+T4x8s
	 jYuilzQ6mX3qTVyLmxK05NGNbdBOhMHUxacYdfvo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A04F806DF; Mon, 26 Jun 2023 13:43:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1009BF806D6;
	Mon, 26 Jun 2023 13:43:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22C50F80553; Mon, 26 Jun 2023 13:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54F66F80544
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F66F80544
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 81E1024E199;
	Mon, 26 Jun 2023 19:09:11 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:11 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:10 +0800
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
Subject: [PATCH v1 0/5] Add PWM-DAC audio support for StarFive JH7110 RISC-V
 SoC
Date: Mon, 26 Jun 2023 19:09:04 +0800
Message-ID: <20230626110909.38718-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
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
Message-ID-Hash: MOW6C7X5S3NYVXMHEK7LN6WJ3ZHRBFXA
X-Message-ID-Hash: MOW6C7X5S3NYVXMHEK7LN6WJ3ZHRBFXA
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOW6C7X5S3NYVXMHEK7LN6WJ3ZHRBFXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
The PWM-DAC module does not require a hardware codec, so add a dummy code=
c
driver for it.

The fourth patch depends on the patch [1].
The fifth patch depends on the patchset [2], patch [3].

[1] https://lore.kernel.org/all/20230526145402.450-3-walker.chen@starfive=
tech.com/
[2] https://lore.kernel.org/all/20230518101234.143748-1-xingyu.wu@starfiv=
etech.com/
[3] https://lore.kernel.org/all/20230322094820.24738-5-walker.chen@starfi=
vetech.com/

Hal Feng (5):
  ASoC: dt-bindings: Add StarFive JH7110 dummy PWM-DAC transmitter
  ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC transmitter driver
  ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
  ASoC: starfive: Add JH7110 PWM-DAC driver
  riscv: dts: starfive: Add JH7110 PWM-DAC support

 .../sound/starfive,jh7110-pwmdac-dit.yaml     |  38 +
 .../sound/starfive,jh7110-pwmdac.yaml         |  76 ++
 MAINTAINERS                                   |   8 +
 .../jh7110-starfive-visionfive-2.dtsi         |  50 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  13 +
 sound/soc/codecs/Kconfig                      |   4 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/jh7110_pwmdac_transmitter.c  |  74 ++
 sound/soc/starfive/Kconfig                    |   9 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh7110_pwmdac.c            | 787 ++++++++++++++++++
 11 files changed, 1062 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh71=
10-pwmdac-dit.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh71=
10-pwmdac.yaml
 create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c


base-commit: 45a3e24f65e90a047bef86f927ebdc4c710edaa1
prerequisite-patch-id: 8c735dffc6d5388a35a76b16e914a2f9722ad979
prerequisite-patch-id: ffa1f5831e75722c9f41603f009f762c9fd525e2
prerequisite-patch-id: 36e69700dfc0375b950b0e23086ed3b722cb84a4
prerequisite-patch-id: 0b49b996d7a404ea548e1734c12933ec749e92b9
prerequisite-patch-id: 81f7c65712c4901a7a178ddcd98ffc55f3b473ff
prerequisite-patch-id: f342fbf594014b072378528bea94c01fb2186e1a
prerequisite-patch-id: 39e1be2a3d1593577ab997f55f59367cba665aa7
prerequisite-patch-id: 0159f09bb0a1ff711a00ae17ef5b12662c9c7d3d
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: d5abfba63fc07ff97b5023911513c260bb7a53e1
prerequisite-patch-id: b37ac15032973e1fcd918f157c82a0606775c9e9
prerequisite-patch-id: 6abf359fa445f4104432ddee27044dfbfb128417
prerequisite-patch-id: 2f7aca99e714a4c590a91baa015080ac0902814d
prerequisite-patch-id: 32cabbc4e7a97ec14d5c28a477fa483784f86709
prerequisite-patch-id: d449b1957dd77c2537c38585daa75974c94c529a
--=20
2.38.1

