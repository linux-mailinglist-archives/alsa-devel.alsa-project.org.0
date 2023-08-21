Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D2786868
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 278F6868;
	Thu, 24 Aug 2023 09:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 278F6868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862509;
	bh=alj8jm8ey1801rpU3vcJXmAu2vPKDP3i+zmMbYa8V4o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YIjU1gHRQL1M9iw0POTxV7OnyEEysVeWwVvoVPw63yy9MG2/VuiK6T3G48YR0dfOF
	 pV/tCB+/hsVb/6An0nBiDJKlnGzUsUuDF3evGbgIZZ7nO1u/G4+fpy1Qeubfk7oEUQ
	 zhUIkTj6I3m9sOvUl/VbST6nNyq2+wPiinWfHkuM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 763BEF805BA; Thu, 24 Aug 2023 09:32:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF81AF805B5;
	Thu, 24 Aug 2023 09:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D51F804DA; Mon, 21 Aug 2023 16:42:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B5E1F8016C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B5E1F8016C
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AECE6807C;
	Mon, 21 Aug 2023 22:41:52 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:52 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:51 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/5] Add I2S support for the StarFive JH7110 SoC
Date: Mon, 21 Aug 2023 22:41:46 +0800
Message-ID: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PQ5LZ3CSU6DVW6ZJ4PC2OJNQ2WHI3GYD
X-Message-ID-Hash: PQ5LZ3CSU6DVW6ZJ4PC2OJNQ2WHI3GYD
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:30:04 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQ5LZ3CSU6DVW6ZJ4PC2OJNQ2WHI3GYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series adds I2S support for the StarFive JH7110 RISC-V
SoC based on Designware I2S controller. There has three I2S channels
(RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and=20
two for playback(TX).

The first patch adds support for the StarFive JH7110 SoC in the
Designware I2S bindings.
The second patch adds the ops to get data from platform bus in the=20
I2S driver.
The third patch adds support for the StarFive JH7110 SoC in
the Designware I2S driver.=20
The fourth patch fixes the name of I2STX1 pinmux.
The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.

This patch series is based on Linux-next(20230818) which is merge
clock, syscon and dma nodes for the StarFive JH7110 SoC.=20

The series has been tested and works normally on the VisionFive 2
board by plugging an audio expansion board.

Changes since v1:
- Added the maxItems of clocks, clock-names and resets on each
  I2S controllers in the binding.
- Dropped the useless settings about dma bus width in the I2S driver.
- Used the 'i2s@' instead of 'i2stx@' or 'i2srx@' in the JH7110 dts.

v1: https://lore.kernel.org/all/20230802084301.134122-1-xingyu.wu@starfiv=
etech.com/

Xingyu Wu (5):
  ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC
    support
  ASoC: dwc: Use ops to get platform data
  ASoC: dwc: i2s: Add StarFive JH7110 SoC support
  riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
  riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1

 .../bindings/sound/snps,designware-i2s.yaml   | 108 ++++++-
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h |   4 +-
 .../jh7110-starfive-visionfive-2.dtsi         |  58 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  65 ++++
 include/sound/designware_i2s.h                |   3 +
 sound/soc/dwc/dwc-i2s.c                       | 306 ++++++++++++++++--
 sound/soc/dwc/local.h                         |   1 +
 7 files changed, 518 insertions(+), 27 deletions(-)

--=20
2.25.1

