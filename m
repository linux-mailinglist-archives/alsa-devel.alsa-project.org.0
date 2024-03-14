Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A787CA0D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B20192C;
	Fri, 15 Mar 2024 09:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B20192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492010;
	bh=YgYS3RkelOTEkhUj4bVVmVrIgp/NrO8aKhUpHUD7bt4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aVRLuib2EHefrL3SVdgPFk7FSxpOUpHLzZTC6Y5O6/meWEttmaUfEgSGsWP37wxqS
	 Ar8tiLYuixxzv3fOpcp+TLzgCdrKZeD6bqPyEnU+gvXO4WO9234m5ABdERtKL1wH1r
	 LpKCFh+zPyqBfIsMKmWX7S+sf3q8PEi75WB0SNYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC40F805FF; Fri, 15 Mar 2024 09:39:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D690FF805E5;
	Fri, 15 Mar 2024 09:39:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B15D0F804E7; Fri, 15 Mar 2024 00:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAA0FF8025F
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA0FF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=D1qg+4UM
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 60CE810000E;
	Fri, 15 Mar 2024 02:23:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 60CE810000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458580;
	bh=k/KjHQTEMbNbNQoJ8kJxtt3YqCKnhYgeapWc9/6QS/4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=D1qg+4UMdHIDAvwEQXQNNqThdhmlSxF9/GZZ7ZfnkfIZcsDRvPNSq0WUmPDfFNcVc
	 4j3UhMUwYnw2FPlEVh1BxaCgbWmhdz45D5vx1oLqwFuZS22lbK+ZRmxWCn7MwJCnXj
	 Fbms0j6G7g9rqb06AITwWzzWMOph30aCkz4ty9skD7vqzK1f+PgSTau7H1TupHlZLz
	 PO/G2oZcY9ApS4cL2Ko4He0w6EEfVfvyewuvSN/1rJF+9XTXjUFODM/GtmvZE+u7gp
	 QXer2VmNd2/uta0LFwyYWqmrVre5Q0mgQx4NEPQYGjuUquK5/SbgH8f9CuKIucykfW
	 1CmMcIoQ+Ap6Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:00 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:22:59 +0300
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
Subject: [PATCH 00/25] Introduce support of audio for Amlogic A1 SoC family
Date: Fri, 15 Mar 2024 02:21:36 +0300
Message-ID: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
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
Message-ID-Hash: NQ2UTWGPUKC73D6JK4MGYF7GVC2QZIFI
X-Message-ID-Hash: NQ2UTWGPUKC73D6JK4MGYF7GVC2QZIFI
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQ2UTWGPUKC73D6JK4MGYF7GVC2QZIFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series includes the following:

 - new audio clock and reset controller data and adaptation for it of existing
   code (patches 0001..0004);

 - adaptation of existing audio components for A1 Soc (patches 0005..0021);

 - handy cosmetics for dai-link naming (patches 0022..0023);

 - integration of audio devices into common trees (patch 0024);

 - audio support bring up on Amlogic ad402 reference board (patch 0025). This
   patch is not actually checked on real hardware (because all ad402 that we had
   were burned out). This patch is based on ad402's schematics and on experience
   with our own hardware (which is very close to reference board);

Dmitry Rokosov (2):
  ASoC: dt-bindings: meson: introduce link-name optional property
  ASoC: meson: implement link-name optional property in meson card utils

Jan Dakinevich (23):
  clk: meson: a1: restrict an amount of 'hifi_pll' params
  clk: meson: axg: move reset controller's code to separate module
  dt-bindings: clock: meson: add A1 audio clock and reset controller
    bindings
  clk: meson: a1: add the audio clock controller driver
  ASoC: meson: codec-glue: add support for capture stream
  ASoC: meson: g12a-toacodec: fix "Lane Select" width
  ASoC: meson: g12a-toacodec: rework the definition of bits
  ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
  ASoC: meson: g12a-toacodec: add support for A1 SoC family
  ASoC: meson: t9015: prepare to adding new platforms
  ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
  ASoC: meson: t9015: add support for A1 SoC family
  ASoC: dt-bindings: meson: axg-pdm: document 'sysrate' property
  ASoC: meson: axg-pdm: introduce 'sysrate' property
  pinctrl/meson: fix typo in PDM's pin name
  ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
    family
  ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
  ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
  ASoC: dt-bindings: meson: axg-sound-card: claim support of A1 SoC
    family
  ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
    family
  ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC
    family
  arm64: dts: meson: a1: add audio devices
  arm64: dts: ad402: enable audio

 .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 +++
 .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
 .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
 .../bindings/sound/amlogic,axg-pdm.yaml       |   5 +
 .../sound/amlogic,axg-sound-card.yaml         |  12 +-
 .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |   6 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
 .../bindings/sound/amlogic,gx-sound-card.yaml |   6 +
 .../bindings/sound/amlogic,t9015.yaml         |   4 +-
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 471 +++++++++++++++
 drivers/clk/meson/Kconfig                     |  18 +
 drivers/clk/meson/Makefile                    |   2 +
 drivers/clk/meson/a1-audio.c                  | 556 ++++++++++++++++++
 drivers/clk/meson/a1-audio.h                  |  58 ++
 drivers/clk/meson/a1-pll.c                    |   8 +-
 drivers/clk/meson/axg-audio.c                 |  95 +--
 drivers/clk/meson/meson-audio-rstc.c          | 109 ++++
 drivers/clk/meson/meson-audio-rstc.h          |  12 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c      |   6 +-
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
 .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
 sound/soc/meson/axg-pdm.c                     |  10 +-
 sound/soc/meson/g12a-toacodec.c               | 298 ++++++++--
 sound/soc/meson/meson-card-utils.c            |  12 +-
 sound/soc/meson/meson-codec-glue.c            | 174 ++++--
 sound/soc/meson/meson-codec-glue.h            |  23 +
 sound/soc/meson/t9015.c                       | 326 +++++++++-
 30 files changed, 2394 insertions(+), 223 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-audio.c
 create mode 100644 drivers/clk/meson/a1-audio.h
 create mode 100644 drivers/clk/meson/meson-audio-rstc.c
 create mode 100644 drivers/clk/meson/meson-audio-rstc.h
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

-- 
2.34.1

