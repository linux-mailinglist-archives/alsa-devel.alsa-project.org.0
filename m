Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47076FDA8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 906DC850;
	Fri,  4 Aug 2023 11:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 906DC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142279;
	bh=u6m+U6lVI6Q35KjMUSP2AZ2QqcKlgGOE4hZUfAPXrQ8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OCMKJ3nToiK9UyKJwMS6scVw5pGiDyaBA+Ika/fyC+y36v2aJpamtU2XiP5QKN0ej
	 5AgCXhjniduLlFFx+zwfw+hsBk/4VglJzmBLmKI84jH3uI5+Sij1ob5N4ZFQrteDbi
	 pfPBSW5EIj8EaHkPTXCn4zCZ+PRD4emrhWgf7Nhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED8ECF80563; Fri,  4 Aug 2023 11:43:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3E9F80563;
	Fri,  4 Aug 2023 11:43:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F87DF801D5; Wed,  2 Aug 2023 10:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DE1CF802BE
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 10:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE1CF802BE
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E2A9924E199;
	Wed,  2 Aug 2023 16:43:02 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:02 +0800
Received: from localhost.localdomain (183.27.98.54) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:01 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Maxim
 Kochetkov" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 0/5] Add I2S support for the StarFive JH7110 SoC
Date: Wed, 2 Aug 2023 16:42:56 +0800
Message-ID: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T2KVFTXJ7HY52A7FTBBQLSKUYYSZ3RAL
X-Message-ID-Hash: T2KVFTXJ7HY52A7FTBBQLSKUYYSZ3RAL
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2KVFTXJ7HY52A7FTBBQLSKUYYSZ3RAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series adds I2S support for the StarFive JH7110 RISC-V
SoC based on Designware I2S controller. There has three I2S channels
(RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and
two for playback(TX).

The first patch adds the ops to get data from platform bus in the
I2S driver.
The second patch adds support for the StarFive JH7110 SoC in
the Designware I2S bindings.
The third patch adds support for the StarFive JH7110 SoC in
the Designware I2S driver.=20
The fourth patch fixes the name of I2STX1 pinmux.
The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.

This patch series is based on Linux-next which is merge clock,
syscon and dma nodes for the StarFive JH7110 SoC. And these
should be applied after the following patchset:
https://lore.kernel.org/all/20230724055440.100947-1-xingyu.wu@starfivetec=
h.com/

The series has been tested and works normally on the VisionFive 2
board by plugging an audio expansion board.

Xingyu Wu (5):
  ASoC: dwc: Use ops to get platform data
  ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC
    support
  ASoC: dwc: i2s: Add StarFive JH7110 SoC support
  riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
  riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1

 .../bindings/sound/snps,designware-i2s.yaml   | 101 +++++-
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h |   4 +-
 .../jh7110-starfive-visionfive-2.dtsi         |  58 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  65 ++++
 include/sound/designware_i2s.h                |   3 +
 sound/soc/dwc/dwc-i2s.c                       | 318 ++++++++++++++++--
 sound/soc/dwc/local.h                         |   1 +
 7 files changed, 523 insertions(+), 27 deletions(-)


base-commit: 0fee53365d051781156b75c6f6e6015757e71fd8
prerequisite-patch-id: 0159f09bb0a1ff711a00ae17ef5b12662c9c7d3d
--=20
2.25.1

