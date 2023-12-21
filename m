Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88A82216B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:54:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA176EC4;
	Tue,  2 Jan 2024 19:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA176EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221639;
	bh=iNW7gUCewPIpmUfayODUr0/5o74U/hDzQamDggIA4z8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dR8AW8xqZTHh8oc0WwW9g62GKgw8I9JmYBdQUBmBFoDMvsNborUfw1EDj+d0GvdKW
	 d42yIY7MlrHEuwTCDWasbu1mPf/HLJ7/afi1LvuCasKHZWgklYJeuUQKoDbg9V1fV1
	 WEIVkPaY/ui86aR86PLutBm2vsrM18gAE546RDsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16BDEF806CB; Tue,  2 Jan 2024 19:50:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D21F806CA;
	Tue,  2 Jan 2024 19:50:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A3DDF8024E; Thu, 21 Dec 2023 04:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4091F800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 04:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4091F800D2
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A003F24E285;
	Thu, 21 Dec 2023 11:32:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 11:32:24 +0800
Received: from localhost.localdomain (113.72.145.47) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 11:32:23 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: [PATCH v1 0/2] Add Cadence I2S controller driver for the
Date: Thu, 21 Dec 2023 11:32:21 +0800
Message-ID: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HQQB6GNRWBVAATT42BXJXARCEWFXL5EG
X-Message-ID-Hash: HQQB6GNRWBVAATT42BXJXARCEWFXL5EG
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:17:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQQB6GNRWBVAATT42BXJXARCEWFXL5EG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cadence I2S Controller implements a function of the multi-channel
(up to 8-channel) bus. Each stereo channel combines functions of a
transmitter and a receiver, and can switch freely between them. Each
channel has independent gating, clock and interruption control. It also
support some of these channels are used as playback and others can also
be used as record in the same time.

Four I2S controllers are used on the StarFive JH8100 SoC. Two of the I2S
controllers use two stereo channels, one of them use four channels, and
one use eight. It had tested on the fpga with WM8960.

Xingyu Wu (2):
  dt-bindings: ASoC: Add Cadence I2S controller for StarFive JH8100 SoC
  ASoC: starfive: Add drivers of Cadence Multi-Channel I2S Controller

 .../bindings/sound/cdns,jh8100-i2s.yaml       | 100 +++
 MAINTAINERS                                   |   7 +
 sound/soc/starfive/Kconfig                    |  18 +
 sound/soc/starfive/Makefile                   |   4 +
 sound/soc/starfive/cdns-jh8100-i2s-pcm.c      | 262 +++++++
 sound/soc/starfive/cdns-jh8100-i2s.c          | 727 ++++++++++++++++++
 sound/soc/starfive/cdns-jh8100-i2s.h          | 171 ++++
 7 files changed, 1289 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,jh8100-i=
2s.yaml
 create mode 100644 sound/soc/starfive/cdns-jh8100-i2s-pcm.c
 create mode 100644 sound/soc/starfive/cdns-jh8100-i2s.c
 create mode 100644 sound/soc/starfive/cdns-jh8100-i2s.h

--=20
2.25.1

