Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C849AA21DD4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2025 14:24:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8926018F;
	Wed, 29 Jan 2025 14:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8926018F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738157049;
	bh=Dbs6/fr/nsZKKnmuztNKTU/xcp3rDtWO3xIWAgdgxjk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ncTL1QsWQ6MA/paEkrExVm1kUtqp9Qa/s0hKItn3/ENAgMmI7DX5M8lSy2J6/Hspu
	 H0rpIkCDNvEQbklwWtu0lAa/BU5kgBjB5zLQjLnnq+BbkEa7PlAL+CGudBoTnSxG+h
	 9O0+8hgU03ED7H1H8OkmYaaBHRcOZD41JYsVSEWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46703F805B1; Wed, 29 Jan 2025 14:23:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 301DEF8051D;
	Wed, 29 Jan 2025 14:23:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38A1F804F3; Wed, 29 Jan 2025 14:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B44EDF800E3
	for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2025 14:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44EDF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u1ot/L1G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11CB75C0236;
	Wed, 29 Jan 2025 13:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C34FC4CED3;
	Wed, 29 Jan 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738157004;
	bh=Dbs6/fr/nsZKKnmuztNKTU/xcp3rDtWO3xIWAgdgxjk=;
	h=From:To:Cc:Subject:Date:From;
	b=u1ot/L1G0sRX7z7ocl0HlGwuyB9Na9IRFv+0K1zrWC/hMTRuj+/ym4lkuLA1GJtH+
	 O+Ik94JJn2cClaaeKvcIQUQf2Tb5zUQcnk8V4WHjtZo0MYJRb+EZkZDB5nMQi6dcmM
	 wc9K/yIsQ7CNznvXGCLhWZgntTgjkhRoW5mos601qa1KwcPav2IUXW1xiek6y5j9iM
	 OlqHlgZoXMs4TdEVGs5P5NNq9MXblYuUcmgm5sNZpIpg7uWVc5QLARidS6aqF4hQt4
	 w7KlsIxsyQMRdmf2x3T0OOKOJosiSCuDZN4AwtnVJ8KNpfBzGoKemlB8dp2so21ans
	 fxcBQ9gAej0Nw==
Message-ID: <5553a88a7f8fd2ec9b1ebb0ceec1e12f.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-merge-window
Date: Wed, 29 Jan 2025 13:23:08 +0000
Message-ID-Hash: 655NMTHXNPFFLNQFKX64FEJ5YHP3BTIF
X-Message-ID-Hash: 655NMTHXNPFFLNQFKX64FEJ5YHP3BTIF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/655NMTHXNPFFLNQFKX64FEJ5YHP3BTIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit fee89ddd76e45841a2b01d87b481bc02483f4572:

  ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled() (2025-01-16 15:20:41 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-merge-window

for you to fetch changes up to 6c1bb4031729871fa203983bd77bed1ee3c61347:

  ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control (2025-01-27 16:22:37 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A bunch of fixes that came in during the merge window, plus a few new
device IDs.  The i.MX changes are a little large since they add some new
quirk data as well as device IDs, and the audio graph card change for
picking the correct endpoint for links is large due to updating a number
of call sites.

----------------------------------------------------------------
Alexander Boehm (1):
      ASoC: SOF: imx8m: add SAI2,5,6,7

Arnd Bergmann (1):
      ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER

Claudiu Beznea (1):
      ASoC: da7213: Initialize the mutex

Daniel Baluta (2):
      ASoC: SOF: imx: Add mach entry to select cs42888 topology
      ASoC: amd: acp: Fix possible deadlock

Detlev Casanova (1):
      ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback

Fabio Estevam (1):
      ASoC: dt-bindings: ti,pcm1681: Fix the binding title

Geert Uytterhoeven (2):
      ASoC: renesas: SND_SIU_MIGOR should depend on DMADEVICES
      firmware: cs_dsp: FW_CS_DSP_KUNIT_TEST should not select REGMAP

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V

Iuliana Prodan (3):
      dt-bindings: arm: imx: Add board revisions for i.MX8MP, i.MX8QM and i.MX8QXP
      ASoC: SOF: imx8: Add entries for new 8QM and 8QXP revisions
      ASoC: SOF: imx8m: Add entry for new 8M Plus revision

Ivaylo Dimitrov (1):
      ASoC: audio-graph-card2: use correct endpoint when getting link parameters

Luoxi Li (1):
      ASoC: use to_platform_device() instead of container_of()

Mario Limonciello (1):
      ASoC: acp: Support microphone from Lenovo Go S

Mark Brown (2):
      ASoC: fsl: two fixes for asrc memory to memory
      Add SOF support for new board revisions

Ondrej Jirman (1):
      ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control

Shengjiu Wang (2):
      ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
      ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()

Zhang Yi (1):
      ASoC: codecs: ES8326: Improved PSRR

 Documentation/devicetree/bindings/arm/fsl.yaml     |  3 ++
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  2 +-
 drivers/firmware/cirrus/Kconfig                    |  6 +--
 sound/soc/amd/acp/acp-i2s.c                        |  1 +
 sound/soc/amd/yc/acp6x-mach.c                      | 28 ++++++++++
 sound/soc/codecs/da7213.c                          |  2 +
 sound/soc/codecs/es8316.c                          |  2 +-
 sound/soc/codecs/es8326.c                          |  4 +-
 sound/soc/codecs/rt5514.c                          |  3 +-
 sound/soc/fsl/Kconfig                              |  1 +
 sound/soc/fsl/fsl_asrc_m2m.c                       | 16 +++---
 sound/soc/generic/audio-graph-card2.c              | 62 ++++++++++------------
 sound/soc/intel/boards/bytcr_rt5640.c              | 17 +++++-
 sound/soc/renesas/Kconfig                          |  2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 31 ++++++++++-
 sound/soc/sof/imx/imx8.c                           | 24 ++++++++-
 sound/soc/sof/imx/imx8m.c                          | 52 +++++++++++++++++-
 sound/soc/sof/imx/imx8ulp.c                        |  3 +-
 sound/soc/sof/intel/bdw.c                          |  3 +-
 sound/soc/sof/intel/byt.c                          |  3 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  6 +--
 22 files changed, 205 insertions(+), 68 deletions(-)
