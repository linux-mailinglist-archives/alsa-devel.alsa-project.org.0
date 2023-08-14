Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A456177BB9D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A4F851;
	Mon, 14 Aug 2023 16:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A4F851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023368;
	bh=IfpjBB76cwfiHMqLGuXQLetbcP12ok+DxtfEatSu7Ow=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QY/+bJkDdb5Zu792AKUP42VdIWJ7fRyCOxhLJQ2nlITcBB30Hz5zuFptjSRVJHv20
	 UlydQp72KtxlrLfnSbYCVfgEksEDckGpwuNDFPajZRnAOVv9QCWRteVushRJLYC6/6
	 nL7aPwLXzaVnBOtwIFEzUCQSKqPM8k5PaIrZkvl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E7BF805AC; Mon, 14 Aug 2023 16:26:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AAB1F805C1;
	Mon, 14 Aug 2023 16:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B950F80290; Mon, 14 Aug 2023 10:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65F91F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 10:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F91F80074
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7107C24E211;
	Mon, 14 Aug 2023 16:06:20 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:20 +0800
Received: from ubuntu.localdomain (183.27.98.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:19 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Add PWM-DAC audio support for StarFive JH7110 RISC-V
 SoC
Date: Mon, 14 Aug 2023 16:06:15 +0800
Message-ID: <20230814080618.10036-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BBVZPE42S4P3ZSHQNSODLJ2PVBSRZSU6
X-Message-ID-Hash: BBVZPE42S4P3ZSHQNSODLJ2PVBSRZSU6
X-Mailman-Approved-At: Mon, 14 Aug 2023 14:26:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBVZPE42S4P3ZSHQNSODLJ2PVBSRZSU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
The PWM-DAC module does not require a hardware codec, but a dummy codec i=
s
needed for the driver. The dummy spdif codec driver, which is already
upstream, is compatible with the one which JH7110 PWM-DAC needed. So we
use it as the dummy codec driver for the JH7110 PWM-DAC module.

The third patch depends on tag next-20230809 in linux-next branch.

Changes since v2:
- Rebase on tag v6.5-rc6.
- Drop the component controls.
- Use dev_err_probe() instead of dev_err() in some cases.
- Add a new struct jh7110_pwmdac_cfg to save the configuration.
- Add a new function jh7110_pwmdac_init_params() to initialize the
  parameters.

Changes since v1:
- Rebase on tag v6.5-rc3.
- Drop patch 1 and 2.
- Drop the unneeded space and line in patch 3.
- Use the dummy spdif codec driver instead of adding a new one.
- Change "dai_link->stop_dma_first =3D 1" to
  "dai_link->trigger_stop =3D SND_SOC_TRIGGER_ORDER_LDC" in patch 4.
- Drop the unneeded "status =3D "okay;" in patch 5.
- Change some node names in patch 5.

---
v2: https://lore.kernel.org/all/20230731032829.127864-1-hal.feng@starfive=
tech.com/
v1: https://lore.kernel.org/all/20230626110909.38718-1-hal.feng@starfivet=
ech.com/

Hal Feng (3):
  ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
  ASoC: starfive: Add JH7110 PWM-DAC driver
  riscv: dts: starfive: Add JH7110 PWM-DAC support

 .../sound/starfive,jh7110-pwmdac.yaml         |  76 +++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2.dtsi         | 141 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 159 ++++++
 sound/soc/starfive/Kconfig                    |   9 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh7110_pwmdac.c            | 529 ++++++++++++++++++
 7 files changed, 922 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh71=
10-pwmdac.yaml
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c


base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
--=20
2.38.1

