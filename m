Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3BE6CEF0B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:16:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45687E86;
	Wed, 29 Mar 2023 18:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45687E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106599;
	bh=m6llrBgQEnl9v1dCuLxlweF4NDyC8qZ/MGuA2Kts0D8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TMBfFlssc2edWcMR+TvSfQAKiSZ4Mv0UBWecx+dMj12NRph1KPDQ+/0Kx+zk46l52
	 BDrr0ld5ejjjPhpVbEdHK/Sf7AQAQzhg3mmNcdZSdnsFloESZW1ohgq9k10VcuVTex
	 pIgcxgqKc0d6BOOKjh0gN0MAR0DGXoW0eh0tJ2/8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0E8F805A0;
	Wed, 29 Mar 2023 18:14:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAC7EF8024E; Wed, 29 Mar 2023 17:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF906F80423
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF906F80423
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9F10024E0FC;
	Wed, 29 Mar 2023 23:33:32 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:32 +0800
Received: from localhost.localdomain (113.72.144.76) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:32 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
Subject: [PATCH v1 0/3] Add TDM audio on StarFive JH7110
Date: Wed, 29 Mar 2023 23:33:17 +0800
Message-ID: <20230329153320.31390-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MTZYLZYP356PBLDF6W5IF3KZYPBEZPWM
X-Message-ID-Hash: MTZYLZYP356PBLDF6W5IF3KZYPBEZPWM
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:50 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTZYLZYP356PBLDF6W5IF3KZYPBEZPWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds TDM audio driver for the StarFive JH7110 SoC. The
first patch adds device tree binding for TDM module. The second patch
adds tdm driver support for JH7110 SoC. The last patch adds device node
of tdm and sound card to JH7110 dts.

The series has been tested on the VisionFive 2 boards which equip with
JH7110 SoC and works normally.

The last patch should be applied after the following patchset:
https://lore.kernel.org/all/20230322094820.24738-1-walker.chen@starfivetech.com/

Walker Chen (3):
  dt-bindings: sound: Add TDM for StarFive JH7110
  ASoC: starfive: Add JH7110 TDM driver
  riscv: dts: starfive: add tdm node and sound card

 .../bindings/sound/starfive,jh7110-tdm.yaml   |  95 +++
 MAINTAINERS                                   |   6 +
 .../jh7110-starfive-visionfive-2.dtsi         |  87 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  34 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/starfive/Kconfig                    |  15 +
 sound/soc/starfive/Makefile                   |   2 +
 sound/soc/starfive/jh7110_tdm.c               | 579 ++++++++++++++++++
 sound/soc/starfive/jh7110_tdm.h               | 155 +++++
 10 files changed, 975 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
 create mode 100644 sound/soc/starfive/Kconfig
 create mode 100644 sound/soc/starfive/Makefile
 create mode 100644 sound/soc/starfive/jh7110_tdm.c
 create mode 100644 sound/soc/starfive/jh7110_tdm.h


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
prerequisite-patch-id: c3a6b87df79b338fc97766406d010fedb79ab428
prerequisite-patch-id: b49509523cf7c098f684647bdc4fdaece48b61bc
prerequisite-patch-id: 46cc850aa0e9e03ccf5ed23d8458babfca3d71af
prerequisite-patch-id: a6975e61ee5803fbd74b1c21ab925fd81c3c0eab
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: 044263ef2fb9f1e5a586edbf85d5f67814a28430
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: 9f3dbc9073eee89134e68977e941e457593c2757
prerequisite-patch-id: 8600b156a235be2b3db53be3f834e7a370e2cfb9
prerequisite-patch-id: 1b2d0982b18da060c82134f05bf3ce16425bac8d
prerequisite-patch-id: 090ba4b78d47bc19204916e76fdbc70021785388
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: 4c12d958e3a3d629d86dddb1e4f099d8909393e0
prerequisite-patch-id: bb939c0c7c26b08addfccd890f9d3974b6eaec53
prerequisite-patch-id: 8f5c66dfb14403424044192f6fa05b347ad356a7
prerequisite-patch-id: fd93763b95469912bde9bdfa4cd827c8d5dba9c6
prerequisite-patch-id: 6987950c2eb4b3773b2df8f7934eff434244aeab
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: e7773c977a7b37692e9792b21cc4f17fa58f9215
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 9f911969d0a550648493952c99096d26e05d4d83
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: 398744c61913c76a35754de867c4f820ca7a8d99
prerequisite-patch-id: be3d7a6a13098884ec26cd5e543cc95c39045e35
prerequisite-patch-id: b3ce7955a80d90d992b7d1bca3409f465810b2bb
prerequisite-patch-id: db2f66860cc5b2fd2f71747c4428287b6e3153fb
prerequisite-patch-id: 9da71dcd3af4c68da9d855b43aab6927103e7525
prerequisite-patch-id: 2d9e4f185631549094b6136cf8717a507b68c5bb
prerequisite-patch-id: bb8e071ed43998874b9d98292c0dcdeedc0760ca
prerequisite-patch-id: cd0b464336aabfbfad96c1a3595c0f9ce9401638
prerequisite-patch-id: 24eab3d30274700c2be4727bece743c76d2618bd
prerequisite-patch-id: 584c256c9acb52ee2773d0c81c3f4977fc18155a
prerequisite-patch-id: 2bc43b375b470f7e8bbe937b78678ba3856e3b8f
prerequisite-patch-id: 32deea16304859842af5c2151bc41d91cf6dfc9b
prerequisite-patch-id: d85dbedbb3b36bbd6806f4eb84a2129c8f8963aa
prerequisite-patch-id: c0bdbdd3db98f7ebae0661dd331edac2c84c70f8
prerequisite-patch-id: 6abf359fa445f4104432ddee27044dfbfb128417
-- 
2.17.1

