Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9D7617C8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99719150F;
	Tue, 25 Jul 2023 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99719150F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286235;
	bh=B8fNMpxr76x8aITyc9FwSmGXSiZXWxtL45ycn7qEXvw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WKlwop4Tru5ZwCbL6jdQF1zd0CmSufzfVGHNnciW1SmvR/ftem8NJ28r+JqbNhkBM
	 4F7bBdoITlRh0sJUWZ0cgoTwKTsIUK/Qk1fn+4wGQHpz6hZG1rPSlc+eYiGt18b3U8
	 oEVfP5l1ROBInAkisbFISpeGDhpdopr82BC5OLtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A78F80163; Tue, 25 Jul 2023 13:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C60F80163;
	Tue, 25 Jul 2023 13:56:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78289F8019B; Tue, 25 Jul 2023 13:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 986A0F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 13:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 986A0F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SqBIx5v4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 197A46168F;
	Tue, 25 Jul 2023 11:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7ABC433C8;
	Tue, 25 Jul 2023 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690286159;
	bh=B8fNMpxr76x8aITyc9FwSmGXSiZXWxtL45ycn7qEXvw=;
	h=From:To:Cc:Subject:Date:From;
	b=SqBIx5v4XBQtx00L6aU1yrERuTwc8vhgLzEd1bmSdwe5f/ZZismavrLQ5xlwY9Xqf
	 tR4QQUS5epXha7tDNnDu91eniEeYp70q8oRU9jxUElDKscXRgz8DIu1YQZGoG9gQLo
	 uVR9e3i0CVG1UptlvU40FRpiSCngWL6s+PXUcn7l0G5pyf+Dm3TJ2gHWKqE1yt5Vev
	 PU0+o+MZvU7QCkjOFjPdff0c4L3zy+L580MZrVlpd94fBT2E8Iuguipvt55l5Bsm4f
	 fo4xt9Ss4msn0uUFE8LhPvTA0MZ+SGvHbLrLeOHGsky+W2AMBqtOZL0YUiz7GQcTbV
	 EtdoIhXGyIcwg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.6-early
Date: Tue, 25 Jul 2023 12:55:45 +0100
Message-Id: <20230725115558.EA7ABC433C8@smtp.kernel.org>
Message-ID-Hash: EVOORBQRFRLE5WAYAHB5NYYVXI5BHDU4
X-Message-ID-Hash: EVOORBQRFRLE5WAYAHB5NYYVXI5BHDU4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVOORBQRFRLE5WAYAHB5NYYVXI5BHDU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.6-early

for you to fetch changes up to 85d12eda2382cd5b93eed720b5a08f39d42cfef4:

  ALSA: hda: Adding support for CS35L56 on HDA (2023-07-24 18:42:26 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.6

Here's an initial batch of updates for ASoC for this release cycle.
We've got a bunch of new drivers in here, a bit of core work from
Morimoto-san and quite a lot of janitorial work.  There's several
updates that pull in changes from other subsystems in order to build
on them:

 - An adaptor to allow use of IIO DACs and ADCs in ASoC which pulls in
   some IIO changes.
 - Create a library function for intlog10() and use it in the NAU8825
   driver.
 - Include the ASoC tests, including the topology tests, in the default
   KUnit full test coverage.  This also involves enabling UML builds of
   ALSA since that's the default KUnit test environment which pulls in
   the addition of some stubs to the driver.
 - More factoring out from Morimoto-san.
 - Convert a lot of drivers to use the more modern maple tree register
   cache.
 - Support for AMD machines with MAX98388 and NAU8821, Cirrus Logic
   CS35L36, Intel AVS machines with ES8336 and RT5663 and NXP i.MX93.

----------------------------------------------------------------
Amadeusz Sławiński (2):
      ASoC: Intel: avs: Add rt5663 machine board
      ASoC: Intel: avs: Load rt5663 board on KBL-based platforms

Andreas Kemnade (1):
      ASoC: ti: omap-mcbsp: Ignore errors for getting fck_src

Andy Shevchenko (8):
      ASoC: rt5677: Refactor GPIO support code
      ASoC: rt5677: Use agnostic irq_domain_create_linear()
      ASoC: rt5677: Use device_get_match_data()
      ASoC: rt5677: Sort headers alphabetically
      lib/math: Move dvb_math.c into lib/math/int_log.c
      lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
      lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX identifier
      ASoC: nau8825: Replace copied'n'pasted intlog10()

Arnd Bergmann (1):
      ASoC: amd: acp: fix SND_SOC_AMD_ACP_PCI depdenencies

Bjorn Andersson (1):
      ASoC: codecs: lpass: Log clk_get() failures

Brent Lu (1):
      ASoC: Intel: sof_rt5682: add jsl_rt5650 board config

Cezary Rojewski (6):
      ASoC: codecs: es8316: Add support for 24 MHz MCLK
      ASoC: codecs: es8316: Add support for S24_3LE format
      ASoC: Intel: avs: Add es8336 machine board
      ASoC: Intel: avs: Load es8336 board on KBL-based platforms
      ASoC: Intel: avs: rt5682: Add missing components
      ASoC: Intel: avs: rt5682: Tidy up hw_params()

Chancel Liu (3):
      ASoC: imx-pcm-rpmsg: Set PCM hardware parameters separately
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
      ASoC: fsl_rpmsg: Add support for i.MX93 platform

Cristian Ciocaltea (3):
      ASoC: amd: vangogh: Make use of DRV_NAME
      ASoC: amd: vangogh: Use dmi_first_match() for DMI quirk handling
      ASoC: amd: vangogh: Add support for NAU8821/MAX98388 variant

Dan Carpenter (1):
      ASoC: amd: acp: delete unnecessary NULL check

Francesco Dolcini (3):
      ASoC: dt-bindings: nau8822: Add #sound-dai-cells
      ASoC: dt-bindings: nau8822: Add MCLK clock
      ASoC: dt-bindings: wm8904: Convert to dtschema

Frank Li (1):
      ASoC: codec: wm8960: add additional probe check for codec identification

Herve Codina (13):
      ASoC: dt-bindings: Add audio-iio-aux
      ASoC: dt-bindings: simple-card: Add additional-devs subnode
      iio: inkern: Check error explicitly in iio_channel_read_max()
      iio: consumer.h: Fix raw values documentation notes
      iio: inkern: Remove the 'unused' variable usage in iio_channel_read_max()
      iio: inkern: Fix headers inclusion order
      minmax: Introduce {min,max}_array()
      iio: inkern: Use max_array() to get the maximum value from an array
      iio: inkern: Replace a FIXME comment by a TODO one
      iio: inkern: Add a helper to query an available minimum raw value
      ASoC: soc-dapm.h: Convert macros to return a compound literal
      ASoC: codecs: Add support for the generic IIO auxiliary devices
      ASoC: simple-card: Handle additional devices

Jack Yu (1):
      ASoC: rt722-sdca: Remove redundant sdca mask

Konrad Dybcio (1):
      ASoC: Convert pm8916-wcd-analog-codec to YAML

Kuninori Morimoto (10):
      ASoC: soc-core.c: initialize dlc on snd_soc_get_dai_id()
      ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
      ASoC: soc-core: protect dlc->of_node under mutex
      ASoC: soc-dai.c: add DAI get/match functions
      ASoC: soc-core.c: enable multi Component
      ASoC: soc-core.c: add snd_soc_get_dai_via_args()
      ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
      ASoC: soc-core.c: add snd_soc_copy_dai_args()
      ASoC: simple-card-utils.c: enable multi Component support
      ASoC: simple-card.c: enable multi Component support

Mark Brown (88):
      Merge existing fixes from asoc/for-6.5 into new branch
      Add support for IIO devices in ASoC
      ASoC: remove copy of intlog10()
      ASoC: Intel: avs: New boards and fixes to existing
      AMD Vangogh support for NAU8821/MAX98388
      ASoC: mt8188: add memory-region support
      Add acpi mahine id's for vangogh platform and
      Refactor acp legacy driver and add
      ASoC: rt5677: Refactor GPIO and use
      ASoC: Another set of platform remove conversions
      ASoC: ad1836: Update to use maple tree register cache
      ASoC: ad1980: Update to use maple tree register cache
      ASoC: adau1372: Update to use maple tree register cache
      ASoC: adau1373: Update to use maple tree register cache
      ASoC: adau1701: Update to use maple tree register cache
      ASoC: adau1761: Update to use maple tree register cache
      ASoC: adau1781: Update to use maple tree register cache
      ASoC: adau1977: Update to use maple tree register cache
      ASoC: adau7118: Update to use maple tree register cache
      ASoC: adav80x: Update to use maple tree register cache
      ASoC: ad: Update Analog Devices drivers to maple tree
      ASoC: wcd9335: Update to use maple tree register cache
      ASoC: wcd938x: Update to use maple tree register cache
      ASoC: wsa881x: Update to use maple tree register cache
      ASoC: wsa883x: Update to use maple tree register cache
      ASoC: qcom: Use the maple tree register cache
      Add support for rpmsg sound card on i.MX93 platform
      Add Probe functionality support for amd platforms.
      ASoC: cs35l36: Update to use maple tree register cache
      ASoC: cs35l41: Update to use maple tree register cache
      ASoC: cs35l45: Update to use maple tree register cache
      ASoC: cs35l56: Update to use maple tree register cache
      ASoC: cs42l51: Update to use maple tree register cache
      ASoC: cs4265: Update to use maple tree register cache
      ASoC: cs4270: Update to use maple tree register cache
      ASoC: cs42l52: Update to use maple tree register cache
      ASoC: cs42l56: Update to use maple tree register cache
      ASoC: cs42xx8: Update to use maple tree register cache
      ASoC: cs4349: Update to use maple tree register cache
      ASoC: wm2200: Update to use maple tree register cache
      ASoC: wm5100: Update to use maple tree register cache
      ASoC: wm9081: Update to use maple tree register cache
      ASoC: wm9090: Update to use maple tree register cache
      ASoC: wm8510: Update to use maple tree register cache
      ASoC: wm8523: Update to use maple tree register cache
      ASoC: wm8580: Update to use maple tree register cache
      ASoC: wm8711: Update to use maple tree register cache
      ASoC: wm8728: Update to use maple tree register cache
      ASoC: wm8731: Update to use maple tree register cache
      ASoC: wm8737: Update to use maple tree register cache
      ASoC: wm8741: Update to use maple tree register cache
      ASoC: wm8750: Update to use maple tree register cache
      ASoC: wm8753: Update to use maple tree register cache
      ASoC: wm8770: Update to use maple tree register cache
      ASoC: wm8776: Update to use maple tree register cache
      ASoC: wm8804: Update to use maple tree register cache
      ASoC: wm8900: Update to use maple tree register cache
      ASoC: wm8903: Update to use maple tree register cache
      ASoC: wm8904: Update to use maple tree register cache
      ASoC: wm8960: Update to use maple tree register cache
      ASoC: wm8961: Update to use maple tree register cache
      ASoC: wm8962: Update to use maple tree register cache
      ASoC: wm8991: Update to use maple tree register cache
      ASoC: wm8993: Update to use maple tree register cache
      ASoC: wm8995: Update to use maple tree register cache
      ASoC: wm8996: Update to use maple tree register cache
      ASoC: wm8940: Update to use maple tree register cache
      ASoC: wm8955: Update to use maple tree register cache
      ASoC: wm8971: Update to use maple tree register cache
      ASoC: wm8978: Update to use maple tree register cache
      ASoC: wm8983: Update to use maple tree register cache
      ASoC: wm8985: Update to use maple tree register cache
      ASoC: wm8988: Update to use maple tree register cache
      ASoC: wm9705: Update to use maple tree register cache
      ASoC: wm9712: Update to use maple tree register cache
      ASoC: wm9713: Update to use maple tree register cache
      driver core: Provide stubs for !IOMEM builds
      platform: Provide stubs for !HAS_IOMEM builds
      ALSA: Enable build with UML
      kunit: Enable ASoC in all_tests.config
      ASoC: topology: Add explicit build option
      ASoC: add multi Component support
      ASoC: cirrus: Use the maple tree register cache
      ASoC: Improve coverage in default KUnit runs
      ASoC: dt-bindings: nau8822: minor updates
      ASoC: codecs: msm8916-wcd-analog: Cleanup DT bindings
      ASoC: Merge up fixes from mainline
      ALSA: hda: Adding support for CS35L56 on HDA

Mastan Katragadda (1):
      ASoC: SOF: amd: refactor PSP smn_read

Matus Gajdos (1):
      ASoC: fsl_spdif: Add support for 22.05 kHz sample rate

Maxim Kochetkov (1):
      ASoC: dwc: Add TDM mode support

Min-Hua Chen (1):
      ASoC: q6dsp: q6apm: make g_apm static

Randy Dunlap (1):
      ASoC: stac9766: fix build errors with REGMAP_AC97

Richard Fitzgerald (5):
      ASoC: cs35l56: Patch soft registers to defaults
      ASoC: cs35l56: Move runtime suspend/resume to shared library
      ASoC: cs35l56: Move cs_dsp init into shared library
      ASoC: cs35l56: Move part of cs35l56_init() to shared library
      ALSA: hda: Fix missing header dependencies

Rob Herring (1):
      ASoC: dt-bindings: audio-graph-card2: Drop incomplete example

Seven Lee (1):
      ASoC: dt-bindings: nau8821: Convert to dtschema

Shengjiu Wang (1):
      ASoC: wm8960: Add DAC filter characteristics selection

Shuming Fan (2):
      ASoC: rt5645: implement set_jack callback
      ASoC: rt5645: add the system level suspend-resume callback

Simon Trimmer (7):
      ASoC: cs35l56: Move shared data into a common data structure
      ASoC: cs35l56: Make cs35l56_system_reset() code more generic
      ASoC: cs35l56: Convert utility functions to use common data structure
      ASoC: cs35l56: Move utility functions to shared file
      ASoC: cs35l56: Make common function for control port wait
      ASoC: cs35l56: Make a common function to shutdown the DSP
      ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

Stephan Gerhold (5):
      ASoC: dt-bindings: pm8916-analog-codec: Fix misleading example
      ASoC: dt-bindings: pm8916-analog-codec: Drop pointless reg-names
      ASoC: dt-bindings: pm8916-analog-codec: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Properly handle probe errors

Syed Saba Kareem (10):
      ASoC: amd: acp: refactor the acp init and de-init sequence
      ASoC: amd: acp: add acp i2s master clock generation for rembrandt platform
      ASoC: amd: acp: remove the redundant acp enable/disable interrupts functions
      ASoC: amd: acp: store platform device reference created in pci probe call
      ASoC: amd: acp: add pm ops support for acp pci driver
      ASoC: amd: acp: store xfer_resolution of the stream
      ASoC: amd: acp: export config_acp_dma() and config_pte_for_stream() symbols
      ASoC: amd: acp: store the pdm stream channel mask
      ASoC: amd: acp: move pdm macros to common header file
      ASoC: amd: acp: add pm ops support for rembrandt platform

Trevor Wu (3):
      ASoC: mediatek: mt8188: add memory-region support
      ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
      ASoC: mediatek: mt8188: DPCM used FE and BE merged parameters

Uwe Kleine-König (2):
      ASoC: amd: ps-sdw-dma: Convert to platform remove callback returning void
      ASoC: starfive: jh7110_tdm: Convert to platform remove callback returning void

V sujith kumar Reddy (3):
      ASoC: SOF: amd: Add Probe functionality support for amd platforms.
      ASoC: SOF: Add acp-probe id to sof probe client driver for registration.
      ASoC: SOF: amd: Add Probe register offset for renoir and rembrandt platform.

Venkata Prasad Potturu (4):
      ASoC: amd: acp: Add machine driver support for nau8821 codec
      ASoC: amd: acp: Add machine driver support for max98388 codec
      ASoC: amd: Add acpi machine id's for vangogh platform
      ASoC: amd: Add new dmi entries to config entry

Yang Li (2):
      ASoC: tas2781: No need to set device_driver owner
      ASoC: amd: acp: clean up some inconsistent indentings

Yangtao Li (5):
      ASoC: bcm: bcm63xx-i2s-whistler: Convert to devm_platform_ioremap_resource()
      ASoC: ti: Convert to devm_platform_ioremap_resource_byname()
      ASoC: mediatek: mt8186: Convert to devm_platform_ioremap_resource()
      ASoC: pxa: Use devm_platform_get_and_ioremap_resource()
      ASoC: tegra: tegra20_ac97: Use devm_platform_get_and_ioremap_resource()

Zhu Ning (1):
      ASoC: codecs: ES8326: Add es8326_mute function

 Documentation/core-api/kernel-api.rst              |   7 +-
 .../devicetree/bindings/sound/audio-iio-aux.yaml   |  64 ++
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |   1 +
 .../bindings/sound/mediatek,mt8188-afe.yaml        |   7 +
 .../devicetree/bindings/sound/nau8821.txt          |  55 --
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml | 125 +++
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml |  12 +
 .../bindings/sound/qcom,msm8916-wcd-analog.txt     | 101 ---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 153 ++++
 .../devicetree/bindings/sound/simple-card.yaml     |  53 ++
 .../devicetree/bindings/sound/wlf,wm8904.yaml      |  74 ++
 Documentation/devicetree/bindings/sound/wm8904.txt |  33 -
 Documentation/driver-api/media/dtv-common.rst      |   9 -
 drivers/iio/inkern.c                               |  86 +-
 drivers/media/dvb-core/Makefile                    |   2 +-
 drivers/media/dvb-frontends/af9013_priv.h          |   2 +-
 drivers/media/dvb-frontends/af9033_priv.h          |   2 +-
 drivers/media/dvb-frontends/cxd2820r_priv.h        |   2 +-
 drivers/media/dvb-frontends/cxd2841er.c            |   2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt2_mon.c             |   2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt_mon.c              |   2 +-
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c  |   2 +-
 drivers/media/dvb-frontends/dib7000p.c             |   2 +-
 drivers/media/dvb-frontends/dib8000.c              |   2 +-
 drivers/media/dvb-frontends/dib9000.c              |   2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |   2 +-
 drivers/media/dvb-frontends/lgdt3305.c             |   2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |   2 +-
 drivers/media/dvb-frontends/lgdt330x.c             |   2 +-
 drivers/media/dvb-frontends/m88ds3103_priv.h       |   2 +-
 drivers/media/dvb-frontends/mn88443x.c             |   2 +-
 drivers/media/dvb-frontends/mn88472_priv.h         |   2 +-
 drivers/media/dvb-frontends/mn88473_priv.h         |   2 +-
 drivers/media/dvb-frontends/or51132.c              |   2 +-
 drivers/media/dvb-frontends/or51211.c              |   2 +-
 drivers/media/dvb-frontends/rtl2830_priv.h         |   2 +-
 drivers/media/dvb-frontends/rtl2832_priv.h         |   2 +-
 drivers/media/dvb-frontends/si2165.c               |   2 +-
 drivers/media/dvb-frontends/stv0367.c              |   2 +-
 drivers/media/dvb-frontends/tc90522.c              |   2 +-
 drivers/media/dvb-frontends/tda10048.c             |   2 +-
 include/linux/device.h                             |  26 +
 include/linux/iio/consumer.h                       |  37 +-
 include/{media/dvb_math.h => linux/int_log.h}      |  18 +-
 include/linux/minmax.h                             |  64 ++
 include/linux/platform_device.h                    |  28 +
 include/sound/cs35l56.h                            |  29 +-
 include/sound/simple_card_utils.h                  |   5 +-
 include/sound/soc-dai.h                            |   3 +
 include/sound/soc-dapm.h                           | 138 ++-
 include/sound/soc.h                                |   6 +
 lib/math/Makefile                                  |   2 +-
 .../dvb-core/dvb_math.c => lib/math/int_log.c      |  26 +-
 sound/Kconfig                                      |   4 -
 sound/pci/hda/Kconfig                              |  31 +
 sound/pci/hda/Makefile                             |   6 +
 sound/pci/hda/cs35l56_hda.c                        | 995 +++++++++++++++++++++
 sound/pci/hda/cs35l56_hda.h                        |  48 +
 sound/pci/hda/cs35l56_hda_i2c.c                    |  69 ++
 sound/pci/hda/cs35l56_hda_spi.c                    |  68 ++
 sound/pci/hda/hda_auto_parser.h                    |   2 +
 sound/pci/hda/hda_generic.h                        |   3 +
 sound/soc/Kconfig                                  |  11 +
 sound/soc/amd/Kconfig                              |   5 +-
 sound/soc/amd/acp-config.c                         |  33 +
 sound/soc/amd/acp/Kconfig                          |   8 +
 sound/soc/amd/acp/Makefile                         |   2 +
 sound/soc/amd/acp/acp-i2s.c                        |   2 +
 sound/soc/amd/acp/acp-legacy-common.c              | 347 +++++++
 sound/soc/amd/acp/acp-mach-common.c                | 267 ++++++
 sound/soc/amd/acp/acp-mach.h                       |   2 +
 sound/soc/amd/acp/acp-pci.c                        |  57 +-
 sound/soc/amd/acp/acp-pdm.c                        |  13 +-
 sound/soc/amd/acp/acp-platform.c                   |   6 +-
 sound/soc/amd/acp/acp-rembrandt.c                  | 184 ++--
 sound/soc/amd/acp/acp-renoir.c                     | 115 +--
 sound/soc/amd/acp/acp-sof-mach.c                   |  16 +
 sound/soc/amd/acp/amd.h                            |  51 ++
 sound/soc/amd/mach-config.h                        |   1 +
 sound/soc/amd/ps/ps-sdw-dma.c                      |   5 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 | 149 ++-
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |  16 +-
 sound/soc/codecs/Kconfig                           |  13 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/ad1836.c                          |   2 +-
 sound/soc/codecs/ad1980.c                          |   2 +-
 sound/soc/codecs/adau1372.c                        |   2 +-
 sound/soc/codecs/adau1373.c                        |   2 +-
 sound/soc/codecs/adau1701.c                        |   2 +-
 sound/soc/codecs/adau1761.c                        |   2 +-
 sound/soc/codecs/adau1781.c                        |   2 +-
 sound/soc/codecs/adau1977.c                        |   2 +-
 sound/soc/codecs/adau7118-i2c.c                    |   2 +-
 sound/soc/codecs/adav80x.c                         |   2 +-
 sound/soc/codecs/audio-iio-aux.c                   | 344 +++++++
 sound/soc/codecs/cs35l36.c                         |   2 +-
 sound/soc/codecs/cs35l41-lib.c                     |   4 +-
 sound/soc/codecs/cs35l45-tables.c                  |   4 +-
 sound/soc/codecs/cs35l56-i2c.c                     |  14 +-
 sound/soc/codecs/cs35l56-sdw.c                     |  72 +-
 sound/soc/codecs/cs35l56-shared.c                  | 482 +++++++++-
 sound/soc/codecs/cs35l56-spi.c                     |  10 +-
 sound/soc/codecs/cs35l56.c                         | 651 +++-----------
 sound/soc/codecs/cs35l56.h                         |  15 +-
 sound/soc/codecs/cs4265.c                          |   2 +-
 sound/soc/codecs/cs4270.c                          |   2 +-
 sound/soc/codecs/cs42l51.c                         |   2 +-
 sound/soc/codecs/cs42l52.c                         |   2 +-
 sound/soc/codecs/cs42l56.c                         |   2 +-
 sound/soc/codecs/cs42xx8.c                         |   2 +-
 sound/soc/codecs/cs4349.c                          |   2 +-
 sound/soc/codecs/es8316.c                          |   5 +-
 sound/soc/codecs/es8326.c                          |  75 +-
 sound/soc/codecs/es8326.h                          |   9 +-
 sound/soc/codecs/lpass-rx-macro.c                  |  10 +-
 sound/soc/codecs/lpass-tx-macro.c                  |  10 +-
 sound/soc/codecs/lpass-va-macro.c                  |   6 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  10 +-
 sound/soc/codecs/msm8916-wcd-analog.c              |  56 +-
 sound/soc/codecs/nau8825.c                         |  93 +-
 sound/soc/codecs/rt5645.c                          |  50 ++
 sound/soc/codecs/rt5677.c                          | 117 +--
 sound/soc/codecs/rt5677.h                          |  92 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   2 +-
 sound/soc/codecs/rt722-sdca.c                      |   3 +-
 sound/soc/codecs/tas2781-i2c.c                     |   1 -
 sound/soc/codecs/wcd9335.c                         |   2 +-
 sound/soc/codecs/wcd938x-sdw.c                     |   2 +-
 sound/soc/codecs/wm2200.c                          |   2 +-
 sound/soc/codecs/wm5100.c                          |   2 +-
 sound/soc/codecs/wm8510.c                          |   2 +-
 sound/soc/codecs/wm8523.c                          |   2 +-
 sound/soc/codecs/wm8580.c                          |   2 +-
 sound/soc/codecs/wm8711.c                          |   2 +-
 sound/soc/codecs/wm8728.c                          |   2 +-
 sound/soc/codecs/wm8731.c                          |   2 +-
 sound/soc/codecs/wm8737.c                          |   2 +-
 sound/soc/codecs/wm8741.c                          |   2 +-
 sound/soc/codecs/wm8750.c                          |   2 +-
 sound/soc/codecs/wm8753.c                          |   2 +-
 sound/soc/codecs/wm8770.c                          |   2 +-
 sound/soc/codecs/wm8776.c                          |   2 +-
 sound/soc/codecs/wm8804.c                          |   2 +-
 sound/soc/codecs/wm8900.c                          |   2 +-
 sound/soc/codecs/wm8903.c                          |   2 +-
 sound/soc/codecs/wm8904.c                          |   2 +-
 sound/soc/codecs/wm8940.c                          |   2 +-
 sound/soc/codecs/wm8955.c                          |   2 +-
 sound/soc/codecs/wm8960.c                          |  12 +-
 sound/soc/codecs/wm8961.c                          |   2 +-
 sound/soc/codecs/wm8962.c                          |   2 +-
 sound/soc/codecs/wm8971.c                          |   2 +-
 sound/soc/codecs/wm8978.c                          |   2 +-
 sound/soc/codecs/wm8983.c                          |   2 +-
 sound/soc/codecs/wm8985.c                          |   2 +-
 sound/soc/codecs/wm8988.c                          |   2 +-
 sound/soc/codecs/wm8991.c                          |   2 +-
 sound/soc/codecs/wm8993.c                          |   2 +-
 sound/soc/codecs/wm8995.c                          |   2 +-
 sound/soc/codecs/wm8996.c                          |   2 +-
 sound/soc/codecs/wm9081.c                          |   2 +-
 sound/soc/codecs/wm9090.c                          |   2 +-
 sound/soc/codecs/wm9705.c                          |   2 +-
 sound/soc/codecs/wm9712.c                          |   2 +-
 sound/soc/codecs/wm9713.c                          |   2 +-
 sound/soc/codecs/wsa881x.c                         |   2 +-
 sound/soc/codecs/wsa883x.c                         |   2 +-
 sound/soc/dwc/dwc-i2s.c                            |  65 +-
 sound/soc/dwc/dwc-pcm.c                            |   8 +-
 sound/soc/dwc/local.h                              |  24 +
 sound/soc/fsl/fsl_rpmsg.c                          |   8 +
 sound/soc/fsl/fsl_spdif.c                          |   8 +-
 sound/soc/fsl/fsl_spdif.h                          |   6 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  12 +-
 sound/soc/generic/audio-graph-card.c               |   2 +-
 sound/soc/generic/audio-graph-card2.c              |   2 +-
 sound/soc/generic/simple-card-utils.c              |  23 +-
 sound/soc/generic/simple-card.c                    |  66 +-
 sound/soc/intel/avs/board_selection.c              |  16 +
 sound/soc/intel/avs/boards/Kconfig                 |  20 +
 sound/soc/intel/avs/boards/Makefile                |   4 +
 sound/soc/intel/avs/boards/es8336.c                | 315 +++++++
 sound/soc/intel/avs/boards/rt5663.c                | 254 ++++++
 sound/soc/intel/avs/boards/rt5682.c                |  67 +-
 sound/soc/intel/boards/Kconfig                     |   5 +-
 sound/soc/intel/boards/sof_rt5682.c                |  80 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |  12 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |   4 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |   8 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  15 +
 sound/soc/pxa/pxa2xx-i2s.c                         |  13 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |   2 +-
 sound/soc/soc-core.c                               | 273 ++++--
 sound/soc/sof/amd/Kconfig                          |   8 +
 sound/soc/sof/amd/Makefile                         |   1 +
 sound/soc/sof/amd/acp-common.c                     |   4 +
 sound/soc/sof/amd/acp-ipc.c                        |  26 +
 sound/soc/sof/amd/acp-probes.c                     | 147 +++
 sound/soc/sof/amd/acp.c                            |  34 +-
 sound/soc/sof/amd/acp.h                            |  13 +-
 sound/soc/sof/amd/pci-rmb.c                        |   2 +
 sound/soc/sof/amd/pci-rn.c                         |   2 +
 sound/soc/sof/sof-client-probes.c                  |   1 +
 sound/soc/starfive/jh7110_tdm.c                    |   5 +-
 sound/soc/tegra/tegra20_ac97.c                     |   3 +-
 sound/soc/ti/omap-dmic.c                           |   4 +-
 sound/soc/ti/omap-mcbsp.c                          |   4 +-
 sound/soc/ti/omap-mcpdm.c                          |   3 +-
 tools/testing/kunit/configs/all_tests.config       |   5 +
 209 files changed, 5743 insertions(+), 1841 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-analog.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt
 rename include/{media/dvb_math.h => linux/int_log.h} (63%)
 rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (84%)
 create mode 100644 sound/pci/hda/cs35l56_hda.c
 create mode 100644 sound/pci/hda/cs35l56_hda.h
 create mode 100644 sound/pci/hda/cs35l56_hda_i2c.c
 create mode 100644 sound/pci/hda/cs35l56_hda_spi.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-common.c
 create mode 100644 sound/soc/codecs/audio-iio-aux.c
 create mode 100644 sound/soc/intel/avs/boards/es8336.c
 create mode 100644 sound/soc/intel/avs/boards/rt5663.c
 create mode 100644 sound/soc/sof/amd/acp-probes.c
