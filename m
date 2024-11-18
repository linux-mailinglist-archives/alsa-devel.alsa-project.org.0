Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF419D11F7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2024 14:33:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2ECC83B;
	Mon, 18 Nov 2024 14:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2ECC83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731936793;
	bh=kIxJwIMH4ETe3CCSNyTtuaWUv2NgcHPZw6XCEJQ2yiQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kqx/8smhc89ewG5Kq/6WFZ2ocd/tchMMaqKIly702/I8uFG9EetEKHmoZN0s1R2CH
	 zNOhOPuHBvQ2FBmQrpOQjakgugLsOKO+egT6pgEdwBNSUsX9t+ge0lqaUmAir6Y3Fs
	 M3ZM+K7MTM8KlliEf36okmYgx6IhdD/jRwLwXZNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413C3F805C0; Mon, 18 Nov 2024 14:32:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F40DDF805BD;
	Mon, 18 Nov 2024 14:32:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D62C1F8026D; Mon, 18 Nov 2024 14:32:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89708F800BA
	for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2024 14:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89708F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NWPUXFhh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1148FA41B81;
	Mon, 18 Nov 2024 13:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1F1C4CED0;
	Mon, 18 Nov 2024 13:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731936747;
	bh=kIxJwIMH4ETe3CCSNyTtuaWUv2NgcHPZw6XCEJQ2yiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NWPUXFhhWi0tgGl3gPX520sV8Mtr0mA8l94PdvooD+oGke8F+jLU8qU2HFL1byS/1
	 86RKqbgJnf23u/hgkvfJUrlLqAylvtMs/ZDQv0/o4G0JcbbS88Wp2RNK6ie6LdFUFP
	 u/2D7xw09i9gg2EH+N9XPr/vRhFJWhM/LvPl178H/xtCEuOdzLVeK1nR1qGDyDi7Bg
	 S/TKwwwfbx/g3cwBgYQhEDYxtKyG9GSLY15w+0030sa+Vg4LJGbrwSVvzPxsCQWV4p
	 LqpjnuG1KKBbMUsE7nMi0v8tiG/ohrfzX5mvX9B0yUvl9Jmoqkj1xFEQlI6Pmdm1VV
	 HIyWRV2WII6+w==
Message-ID: <448e5dfb7b1c48b7b4a544d2ece10c7e.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.13
Date: Mon, 18 Nov 2024 13:32:14 +0000
Message-ID-Hash: 32GRNMBSYZ7MPYZSC52DN3RTDAW7A3ZM
X-Message-ID-Hash: 32GRNMBSYZ7MPYZSC52DN3RTDAW7A3ZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32GRNMBSYZ7MPYZSC52DN3RTDAW7A3ZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 2ae6da569e34e1d26c5275442d17ffd75fd343b3:

  ASoC: max9768: Fix event generation for playback mute (2024-11-12 13:16:37 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.13

for you to fetch changes up to 82ff5abc2edcfba0c0f1a1be807795e2876f46e9:

  ASoC: hdmi-codec: reorder channel allocation list (2024-11-15 13:43:00 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.13

This release was mainly about new drivers, there's a very large batch of
new drivers and devices including quite a few from newer vendors which
is great to see.  Other than the new drivers and the usual routine fixes
and enhancements the bulk of the work has been Morimoto-san's continuing
work on simplifiying APIs, plus a few other bits:

 - More API simplifications from Morimoto-san.
 - Renaming of the sh directory to Renesas to reflect the focus on other
   architectures.
 - Factoring out of some of the common code for Realtek devices.
 - Support for Allwinner H616, AMD ACP 6.3 systems, AWInic AW88081,
   Cirrus Logic CS32L84, Everest ES8328, Iron Devices SMA1307, Longsoon
   I2S, NeoFidelity NTP8918 and NTP8835, Philips UDA1342, Qualcomm
   SM8750, RealTek RT721, and ST Microelectronics STM32MP25.

----------------------------------------------------------------
Advait Dhamorikar (1):
      ASoC: tlv320adc3xxx: Fix unsigned int compared against 0

Alexey Klimov (1):
      ASoC: qcom: sm8250: add handling of secondary MI2S clock

Amadeusz Sławiński (2):
      ASoC: Intel: Remove unused code
      ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()

Andy Shevchenko (1):
      ASoC: codecs: wcd937x: Remove unused of_gpio.h

Anne Onciulescu (1):
      ASoC: SOF: sof-of-dev: add parameter to override tplg/fw_filename

Arnd Bergmann (3):
      ASoC: loongson: make loongson-i2s.o a separate module
      ASoC: cs42l84: remove incorrect of_match_ptr()
      ASoC: sma1307: fix uninitialized variable refence

Balamurugan C (1):
      ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for MTL.

Bard Liao (6):
      soundwire: sdw_intel: include linux/acpi.h
      ASoC: rt-sdw-common: fix rt_sdca_index_update_bits function parameter description
      ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
      ASoC: Intel: Kconfig: select SND_SOC_SDCA by SND_SOC_ACPI_INTEL_SDCA_QUIRKS
      ASoC: sdca: test adev before calling acpi_dev_for_each_child
      ASoC: Intel: soc-acpi-intel-lnl-match: add rt712_vb + rt1320 support

Biju Das (1):
      ASoC: sh: rz-ssi: Use SSIFCR_FIFO_RST macro

Binbin Zhou (7):
      ASoC: dt-bindings: Add Everest ES8323 Codec
      ASoC: codecs: Add support for ES8323
      ASoC: dt-bindings: Add NXP uda1342 Codec
      ASoC: codecs: Add uda1342 codec driver
      ASoC: dt-bindings: Add Loongson I2S controller
      ASoC: loongson: Add I2S controller driver as platform device
      ASoC: loongson: Fix build warning when !CONFIG_PCI

Chancel Liu (2):
      ASoC: imx-card: Set mclk for codec
      ASoC: imx-card: Add CS42888 support

Charles Keepax (4):
      ASoC: sdw_utils: Add support for exclusion DAI quirks
      ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be ignored
      ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
      ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops

Claudiu Beznea (3):
      ASoC: da7213: Populate max_register to regmap_config
      ASoC: da7213: Return directly the value of regcache_sync()
      ASoC: da7213: Add suspend to RAM support

Codrin Ciubotariu (4):
      ASoC: atmel: atmel_ssc_dai: Add stream names
      ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to single channel limitation
      ASoC: atmel: mchp-spdiftx: Remove interface name from stream_name
      ASoC: atmel: mchp-spdifrx: Remove interface name from stream_name

Colin Ian King (3):
      ASoC: codecs: aw88395: Fix spelling mistake "unsupport" -> "unsupported"
      ASoC: codecs: aw88399: Fix spelling mistake "unsupport" -> "unsupported"
      ASoC: SOF: ipc4-topology: remove redundant assignment to variable ret

Cristian Ciocaltea (1):
      ASoC: dt-bindings: everest,es8328: Document audio graph port

Daniel Baluta (1):
      ASoC: SOF: ipc3: Use standard dev_dbg API

Deep Harsora (1):
      ASoC: Intel: sof_sdw: Add missing quirks from some new Dell

Dharageswari R (2):
      ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
      ASoC: intel: sof_sdw: add RT722 SDCA card for PTL platform

Dr. David Alan Gilbert (1):
      ASoC: soc-devres: Remove unused devm_snd_soc_register_dai

Everest K.C (2):
      ASoC: rt721-sdca: Clean logically deadcode in rt721-sdca.c
      ASoC: rt722-sdca: Remove logically deadcode in rt722-sdca.c

Fabio Estevam (1):
      ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx compatible fallback

Fei Shao (3):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,adsp property
      ASoC: dt-bindings: everest,es8326: Document interrupt property
      ASoC: dt-bindings: maxim,max98390: Reference common DAI properties

Frank Li (2):
      ASoC: dt-bindings: fsl-esai: Add power-domains for fsl,imx8qm-esai
      ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai

Geert Uytterhoeven (2):
      ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
      ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio

Hao Bui (2):
      ASoC: da7213: Avoid setting PLL when closing audio stream
      ASoC: da7213: Extend support for the MCK in range [2, 50] MHz

Harshit Mogalapalli (1):
      ASoC: codecs: fix error code in ntp8835_i2c_probe()

Heiko Stuebner (1):
      ASoC: dt-bindings: rockchip,rk3036-codec: convert to yaml

Hendrik v. Raven (2):
      ASoc: simple-mux: add idle-state support
      ASoC: dt-bindings: simple-mux: add idle-state property

Herve Codina (1):
      ASoC: fsl: fsl_qmc_audio: Remove the logging when parsing channels

Hongbo Li (5):
      ASoC: improve macro definition on TWL4030_OUTPUT_PGA
      ASoC: remove unused substream in macro soc_component_mark_pop
      ASoC: remove unused substream in macro soc_dai_mark_pop
      ASoC: remove unused substream in macro soc_link_mark_pop
      ASoC: stm: fix macro definition on STM_SAI_HAS_EXT_SYNC

Igor Prusov (6):
      dt-bindings: vendor-prefixes: Add NeoFidelity, Inc
      ASoC: codecs: Add NeoFidelity Firmware helpers
      ASoC: dt-bindings: Add NeoFidelity NTP8918
      ASoC: codecs: Add NeoFidelity NTP8918 codec
      ASoC: dt-bindings: Add NeoFidelity NTP8835
      ASoC: codecs: Add NeoFidelity NTP8835 codec

Ingyu Jang (2):
      ASoC: uniphier: Handle regmap_write errors in aio_src_set_param()
      ASoC: uniphier: Handle regmap_write errors in aio_iecout_set_enable()

Jack Yu (6):
      ASoC: rt-sdw-common: Common functions for Realtek soundwire driver
      ASoC: rt721-sdca: Add RT721 SDCA driver
      ASoC: rt721-sdca: Fix issue of warning message
      ASoC: Intel: Add rt721-sdca support for PTL platform
      ASoC: rt-sdw-common: Enhance switch case to prevent uninitialized variable
      ASoC: rt721-sdca: change interrupt mask from XU to GE

James Calligeros (1):
      ASoC: cs42l84: leverage ring sense IRQs to correctly detect headsets

Javier Carrasco (1):
      ASoC: constify snd_soc_component_driver struct

Jerome Brunet (1):
      ASoC: meson: axg-iface: set continuous rates

Jiapeng Chong (1):
      ASoC: cs42l84: Remove unused including <linux/version.h>

John Watts (1):
      ASoC: test-component: Support continuous rates for test component

Jonas Karlman (1):
      ASoC: hdmi-codec: reorder channel allocation list

Kiseok Jo (2):
      ASoC: dt-bindings: irondevice,sma1307: Add initial DT
      ASoC: sma1307: Add driver for Iron Device SMA1307

Krzysztof Kozlowski (5):
      ASoC: qcom: sm8250: correct typo in shutdown function name
      ASoC: dt-bindings: qcom: Add SM8750 LPASS macro codecs
      ASoC: qcom: x1e80100: Support boards with two speakers
      ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound card
      ASoC: qcom: sc8280xp Add SM8750 sound card

Kuninori Morimoto (24):
      ASoC: makes snd_soc_set_runtime_hwparams() inline
      ASoC: amd: remove dpcm_xxx flags
      ASoC: fsl: remove dpcm_xxx flags
      ASoC: sof: remove dpcm_xxx flags
      ASoC: intel: remove dpcm_xxx flags
      ASoC: samsung: remove dpcm_xxx flags
      ASoC: mediatek: remove dpcm_xxx flags
      ASoC: soc-core: remove dpcm_xxx flags
      ASoC: soc-compress: remove dpcm_xxx flags
      ASoC: soc-topology: remove dpcm_xxx flags
      ASoC: intel: boards: remove dpcm_xxx flags
      ASoC: soc-pcm: remove dpcm_xxx flags
      ASoC: doc: remove dpcm_xxx flags
      ASoC: soc-pcm: merge DPCM and non-DPCM validation check
      ASoC: rename rtd->num to rtd->id
      ASoC: fsl: switch to use rtd->id from rtd->num
      ASoC: meson: switch to use rtd->id from rtd->num
      ASoC: sh: switch to use rtd->id from rtd->num
      ASoC: generic: switch to use rtd->id from rtd->num
      ASoC: remove rtd->num
      ASoC: soc-core: do rtd->id trick at snd_soc_add_pcm_runtime()
      ASoC: cleanup function parameter for rtd and its id
      ASoC: add symmetric_ prefix for dai->rate/channels/sample_bits
      ASoC: simple-card-utils: care simple_util_dai for dummy DAI

Lad Prabhakar (6):
      ASoC: rsnd: Refactor port handling with helper for endpoint node selection
      ASoC: Rename "sh" to "renesas"
      ASoC: renesas, rsnd: Update file path
      ASoC: audio-graph-card2: Update comment with renamed file path
      MAINTAINERS: Add entry for Renesas R-Car and FSI ASoC drivers
      MAINTAINERS: Add entry for Renesas RZ ASoC driver

Liu Jing (1):
      ASoC: rx651: Use card->dev in replace of the &pdev->dev argument in the dev_err function

Mac Chiang (3):
      ASoC: sdw_utils: Add quirk to exclude amplifier function
      ASoC: intel: sof_sdw: add quirk for Dell SKU
      ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support

Macpaul Lin (1):
      ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode

Marcus Cooper (2):
      ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
      ASoC: sun4i-codec: Add playback only flag to quirks

Marek Vasut (3):
      ASoC: max98088: Remove duplicate DACs
      ASoC: max98088: Add left/right DAC volume control
      ASoC: max98088: Add headphone mixer switch

Mario Limonciello (1):
      ASoC: amd: acp: Add stream name to ACP PDM DMIC devices

Mark Brown (41):
      ASoC: bcm2835-i2s: Use maple tree register cache
      ASoC: fsl: Use maple tree register cache
      ASoC: fsl_micfil: fix and improvement
      ASoC: amd: acp: refactor acp version
      ASoC: improve some macro definitions and usages
      Updates for Atmel SSC DAI
      ASoC: Updates for mchp-spdif(tx/rx)
      {ASoC,media}: constify snd_soc_component_driver
      ASoC: Add NTP8918 and NTP8835 codecs support
      ASoC: Clean up {hp,mic}-det-gpio handling
      ASoC: Intel: sof_rt5682: add supports for new
      ASoC: Merge up v6.12
      Fixes and improvements related to amd soundwire
      ASoC: Intel: add rt722/rt721 support for PTL platform
      ASoC: SOF: ipc4-topology: Rework the module audio
      ASoC: Some issues about loongson i2s
      ASoC/SoundWire: Simply interrupt enabling for Intel
      ASoC: imx-card: add cs42888 codec support
      ASoC: Merge up fixes
      ASoC: add support for some new Lenovo laptops with
      ASoC/soundwire: add initial support for SDCA
      ASoC: fsl_xcvr: enable some interrupts
      ASoC: SOF: core: Module parameter updates
      ASoC: remove dpcm_xxx flags
      ASoC: add Allwinner H616 audio codec support
      ASoC: add CS42L84 codec driver
      ASoC: Intel: add rt722 and rt1320 support
      ASoC: codecs: adau1373: drop platform data
      ASoC: Rename "sh" to "renesas"
      ASoC: cleasnup rtd and its ID
      Soundwire dai link init logic refactor
      ASoC: codecs: Add aw88081 amplifier driver
      ASoC: Intel: Kconfig: fix undefined symbol:
      ASoC: SOF: ipc3-loader: Handle PROBE_INFO ext_manifest
      Add a driver for the Iron Device SMA1307 Amp
      ASoC: Intel: Fix Kconfig for ACPI=n
      ASoC: stm32: sai: add stm32mp25 support
      ASoC: stm32: i2s: add stm32mp25 support
      ASoC: Merge up fixes
      Add generic AMD Soundwire machine driver for Legacy(No
      ASoc: simple-mux: Allow to specify an idle-state

Markus Elfring (1):
      ASoC: tas5805m: Improve a size determination in tas5805m_i2c_probe()

Martin Povišer (2):
      ASoC: cs42l84: Add new codec driver
      ASoC: dt-bindings: Add CS42L84 codec

Masahiro Yamada (1):
      ASoC: codecs: wcd9335: remove unnecessary MODULE_ALIAS()

Murad Masimov (1):
      ASoC: amd: acp: drop bogus NULL check from i2s_irq_handler

Naveen Manohar (2):
      ASoC: intel/sdw_utils: refactor RT multifunction sdca speaker codecs
      ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721 support

Neil Armstrong (1):
      ASoC: dt-bindings: realtek,rt5640: Convert to dtschema

Nuno Sa (5):
      ASoC: codecs: adau1372: add match table
      ASoC: codecs: adau1373: add some kconfig text
      ASoC: dt-bindings: document the adau1373 Codec
      ASoC: codecs: adau1373: drop patform_data
      ASoC: codecs: adau1373: add powerdown gpio

Olivier Moysan (6):
      ASoC: dt-bindings: add stm32mp25 support for sai
      ASoC: stm32: sai: add stm32mp25 support
      ASoC: dt-bindings: add stm32mp25 support for i2s
      ASoC: stm32: i2s: add stm32mp25 support
      ASoC: dt-bindings: stm32: add missing port property
      ASoC: stm32: dfsdm: change rate upper limits

Peter Ujfalusi (16):
      ASoC: SOF: ipc4-topology: Drop the 'index' from 'Pin index' of format print
      ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_input_audio_fmt()
      ASoC: SOF: ipc4-topology: Remove redundant check in sof_ipc4_init_input_audio_fmt()
      ASoC: SOF: ipc4-topology: Simplify match format print in sof_ipc4_init_input_audio_fmt()
      ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_output_audio_fmt()
      ASoC: SOF: ipc4-topology: Simplify code to deal with process modules without output
      ASoC: SOF: ipc4-topology: Concentrate prints inside of sof_ipc4_init_output_audio_fmt()
      ASoC: SOF: ipc4-topology: Add helper function to print the module's in/out audio format
      ASoC: SOF: core: Add debug module parameters to set IPC and boot timeout
      ASoC: SOF: core: Add fw, tplg and ipc type override parameters
      ASoC: SOF: ext_manifest: Add missing ext_manifest type for PROBE_INFO
      ASoC: SOF: ipc3-loader: 'Handle' PROBE_INFO ext_manifest type when parsing
      ASoC: SOF: Intel: hda-stream: Always use at least two BDLE for transfers
      ASoC: SOF: Intel: hda: Add support for persistent Code Loader DMA buffers
      ASoC: Intel: Kconfig: Only select SND_SOC_SDCA if ACPI is enabled
      ASoC: Intel: Kconfig: Revert make SND_SOC_ACPI_INTEL_MATCH depend on ACPI

Pierre-Louis Bossart (12):
      ASoC: SOF: Intel: hda-mlink: expose unlocked interrupt enable routine
      ASoC/SoundWire: Intel: lnl: enable interrupts after first power-up/before last power-down
      ASoC/soundwire: remove sdw_slave_extended_id
      ASoC: SDCA: add initial module
      soundwire: slave: lookup SDCA version and functions
      ASoC: SDCA: add quirk function for RT712_VB match
      ASoC: rt712-sdca: detect the SMART_MIC function during the probe stage
      ASoC: soc-acpi: introduce new 'machine check' callback
      ASoC: sdw_utils: add SmartMic DAI for RT712 VB
      ASoC: sdw_utils: add SmartMic DAI for RT713 VB
      ASoC: Intel: soc-acpi: add is_device_rt712_vb() helper
      ASoC: SOF: Intel: hda: use machine_check() for SoundWire

Qiu-ji Chen (1):
      ASoC: codecs: Fix atomicity violation in snd_soc_component_get_drvdata()

Ranjani Sridharan (1):
      ASoC: SOF: Intel: hda: handle only paused streams in hda_dai_suspend()

Ritu Chaudhary (1):
      ASoC: tegra: Add support for S24_LE audio format

Ryan Roberts (1):
      ASoC: soc-utils: Remove PAGE_SIZE compile-time constant assumption

Ryan Walklin (2):
      ASoC: sun4i-codec: support allwinner H616 codec
      ASoC: dt-bindings: allwinner: add H616 sun4i audio codec binding

Shengjiu Wang (6):
      ASoC: fsl_micfil: fix regmap_write_bits usage
      ASoC: fsl_micfil: Add mclk enable flag
      ASoC: fsl_micfil: Enable micfil error interrupt
      ASoC: fsl_xcvr: enable interrupt of cmdc status update
      ASoC: fsl_xcvr: reset RX dpath after wrong preamble
      ASoC: fsl_mqs: Support accessing registers by scmi interface

Shuming Fan (4):
      ASoC: rt1320: reads patch code from firmware file
      ASoC: rt1320: fix the range of patch code address
      ASoC: rt1320: add mic function
      ASoC: rt722: change the interrupt mask for jack type detection

Stanislav Jakubek (2):
      ASoC: dt-bindings: sprd,pcm-platform: convert to YAML
      ASoC: dt-bindings: sprd,sc9860-mcdt: convert to YAML

Suraj Sonawane (2):
      ASoC: bcm63xx-pcm-whistler: fix uninit-value in i2s_dma_isr
      ASoc: SOF: ipc4-pcm: fix uninit-value in sof_ipc4_pcm_dai_link_fixup_rate

Tang Bin (7):
      ASoC: tas2781: Fix redundant parameter assignment
      ASoC: codecs: Fix error check in es8323_i2c_probe
      ASoC: mediatek: mt8188: Remove unnecessary variable assignments
      ASoC: mediatek: mt8188: remove unnecessary variable assignment
      ASoC: ux500: Remove redundant casts
      ASoC: mediatek: mt8183: Remove unnecessary variable assignments
      ASoC: sma1307: Fix invalid logical judgement

Venkata Prasad Potturu (1):
      ASoC: amd: acp: Fix for ACP SOF dmic tplg component load failure

Vijendar Mukunda (20):
      ASoC: amd: acp: simplify platform conditional checks code
      ASoC: amd: acp: use acp_rev for platform specific conditional checks
      ASoC: amd: acp: use acp pci revision id for platform differntiation
      ASoC: amd: acp: store acp pci rev id in platform driver private structure
      ASoC: amd: acp: pass acp pci revision id as platform data
      ASoC: amd: acp: update mach_params subsystem_rev field
      ASoC: amd: acp: remove unused variable from acp_card_drvdata structure
      ASoC: amd: acp: replace adata->platform conditional check
      ASoC: amd: acp: remove unused variable from acp platform driver
      ASoC: amd: acp: fix for inconsistent indenting
      ASoC: amd: acp: fix for cpu dai index logic
      ASoC: amd: acp: refactor sof_card_dai_links_create() function
      ASoC: sdw_utils/intel/amd: refactor dai link init logic
      ASoC: sdw_utils: Update stream_name in dai_links structure
      ASoC: amd: acp: add rt722 based soundwire machines
      ASoC: amd: acp: add RT711, RT714 & RT1316 support for acp 6.3 platform
      ASoC: amd: ps: add soundwire machines for acp6.3 platform
      ASoC: amd: acp: move get_acp63_cpu_pin_id() to common file
      ASoC: amd: acp: add soundwire machine driver for legacy stack
      ASoC: amd: ps: fix the pcm device numbering for acp 6.3 platform

Vitaliy Shevtsov (1):
      ASoC: nau8821: check regmap_raw_read/regmap_raw_write for failure

Weidong Wang (2):
      ASoC: dt-bindings: Add schema for "awinic,aw88081"
      ASoC: codecs: Add aw88081 amplifier driver

Yang Li (1):
      ASoC: codecs: Remove unneeded semicolon

Zhang Yi (2):
      ASoC: codecs: ES8326: Modify the configuration of and micbias
      ASoC: codecs: ES8326: Reduce pop noise

Zhu Jun (1):
      ASoC: aw88399: Correct error handling in aw_dev_get_dsp_status function

anish kumar (2):
      ASoC: doc: update clock api details
      ASoC: machine: update documentation

 .mailmap                                           |   17 +-
 CREDITS                                            |   58 +-
 Documentation/admin-guide/LSM/ipe.rst              |    7 +-
 Documentation/admin-guide/kernel-parameters.txt    |    2 +-
 Documentation/admin-guide/mm/transhuge.rst         |    2 +-
 Documentation/admin-guide/pm/cpufreq.rst           |   20 +-
 Documentation/core-api/protection-keys.rst         |   38 +-
 .../bindings/display/elgin,jg10309-01.yaml         |   54 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   24 +-
 .../bindings/display/mediatek/mediatek,split.yaml  |   19 +
 .../devicetree/bindings/firmware/arm,scmi.yaml     |    2 +-
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    |   21 +
 .../devicetree/bindings/iio/dac/adi,ad5686.yaml    |   53 +-
 .../devicetree/bindings/iio/dac/adi,ad5696.yaml    |    3 +-
 .../interrupt-controller/fsl,ls-extirq.yaml        |   26 +-
 .../devicetree/bindings/misc/fsl,qoriq-mc.yaml     |    2 +-
 .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    1 +
 .../devicetree/bindings/net/xlnx,axi-ethernet.yaml |    2 +-
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |    5 +-
 .../devicetree/bindings/sound/adi,adau1373.yaml    |  111 +
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml  |   53 +-
 .../devicetree/bindings/sound/audio-graph.yaml     |    6 +
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |    4 +-
 .../devicetree/bindings/sound/cirrus,cs42l84.yaml  |   56 +
 .../devicetree/bindings/sound/everest,es8316.yaml  |    4 +-
 .../devicetree/bindings/sound/everest,es8326.yaml  |    4 +
 .../devicetree/bindings/sound/everest,es8328.yaml  |    4 +
 .../devicetree/bindings/sound/fsl,esai.yaml        |   28 +-
 .../devicetree/bindings/sound/fsl,spdif.yaml       |   27 +-
 .../devicetree/bindings/sound/inno-rk3036.txt      |   20 -
 .../bindings/sound/irondevice,sma1307.yaml         |   53 +
 .../bindings/sound/loongson,ls2k1000-i2s.yaml      |   68 +
 .../devicetree/bindings/sound/maxim,max98390.yaml  |    8 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |    7 +
 .../devicetree/bindings/sound/mt6359.yaml          |   10 +-
 .../bindings/sound/neofidelity,ntp8835.yaml        |   73 +
 .../bindings/sound/neofidelity,ntp8918.yaml        |   70 +
 .../devicetree/bindings/sound/nxp,uda1342.yaml     |   42 +
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |    1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |    1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |    1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |    1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    1 +
 .../devicetree/bindings/sound/realtek,rt5640.yaml  |  146 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |    2 +-
 .../bindings/sound/rockchip,rk3036-codec.yaml      |   58 +
 Documentation/devicetree/bindings/sound/rt5640.txt |   97 -
 .../bindings/sound/simple-audio-mux.yaml           |    5 +
 .../devicetree/bindings/sound/simple-card.yaml     |   12 +
 .../bindings/sound/sprd,pcm-platform.yaml          |   56 +
 .../bindings/sound/sprd,sc9860-mcdt.yaml           |   47 +
 .../devicetree/bindings/sound/sprd-mcdt.txt        |   19 -
 .../devicetree/bindings/sound/sprd-pcm.txt         |   23 -
 .../devicetree/bindings/sound/st,stm32-i2s.yaml    |   36 +-
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |   26 +-
 .../bindings/sound/st,stm32-spdifrx.yaml           |    4 +
 .../devicetree/bindings/trivial-devices.yaml       |    2 -
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/filesystems/caching/cachefiles.rst   |    2 +-
 Documentation/filesystems/iomap/operations.rst     |    2 +-
 Documentation/filesystems/netfs_library.rst        |    1 -
 Documentation/iio/ad7380.rst                       |   13 +-
 Documentation/mm/damon/maintainer-profile.rst      |   38 +-
 Documentation/netlink/specs/mptcp_pm.yaml          |    1 -
 Documentation/networking/j1939.rst                 |    2 +-
 Documentation/networking/packet_mmap.rst           |    5 +-
 Documentation/networking/tcp_ao.rst                |   20 +-
 Documentation/process/maintainer-netdev.rst        |   17 +
 Documentation/process/maintainer-soc.rst           |   42 +-
 Documentation/rust/arch-support.rst                |    2 +-
 Documentation/scheduler/sched-ext.rst              |    2 +-
 Documentation/sound/soc/clocking.rst               |   12 +
 Documentation/sound/soc/dpcm.rst                   |   11 +-
 Documentation/sound/soc/machine.rst                |   26 +
 Documentation/userspace-api/mseal.rst              |  307 +-
 Documentation/virt/kvm/api.rst                     |   16 +-
 Documentation/virt/kvm/locking.rst                 |    2 +-
 MAINTAINERS                                        |  247 +-
 Makefile                                           |    2 +-
 arch/Kconfig                                       |   26 +-
 arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts |    2 +-
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |    4 +-
 arch/arm/boot/dts/rockchip/rk3036.dtsi             |   14 +-
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi   |   12 +-
 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi     |    4 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   12 +
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |    1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    6 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-vpu.dtsi  |    8 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |    2 +-
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |    2 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |    2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |    2 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |   10 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    2 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |    2 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |    2 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   53 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    1 -
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |    4 +-
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |    2 -
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |    3 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  |    2 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |    2 -
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    2 +-
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts   |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    6 +-
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts     |    3 -
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   20 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |    1 -
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |    4 +-
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |    1 -
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    1 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |    1 -
 arch/arm64/include/asm/kvm_asm.h                   |    1 +
 arch/arm64/include/asm/kvm_host.h                  |    7 +
 arch/arm64/include/asm/kvm_mmu.h                   |    3 +-
 arch/arm64/include/asm/kvm_nested.h                |    4 +-
 arch/arm64/include/asm/mman.h                      |   10 +-
 arch/arm64/include/asm/topology.h                  |    4 -
 arch/arm64/include/asm/uprobes.h                   |    8 +-
 arch/arm64/kernel/asm-offsets.c                    |    1 +
 arch/arm64/kernel/fpsimd.c                         |    1 +
 arch/arm64/kernel/probes/decode-insn.c             |   16 +-
 arch/arm64/kernel/probes/simulate-insn.c           |   18 +-
 arch/arm64/kernel/probes/uprobes.c                 |    4 +-
 arch/arm64/kernel/process.c                        |    3 +
 arch/arm64/kernel/signal.c                         |   92 +-
 arch/arm64/kernel/smccc-call.S                     |   35 +-
 arch/arm64/kvm/arm.c                               |    5 +
 arch/arm64/kvm/hyp/nvhe/hyp-init.S                 |   52 +-
 arch/arm64/kvm/hypercalls.c                        |   12 +-
 arch/arm64/kvm/mmu.c                               |   15 +-
 arch/arm64/kvm/nested.c                            |   53 +-
 arch/arm64/kvm/sys_regs.c                          |   77 +-
 arch/arm64/kvm/vgic/vgic-init.c                    |   41 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c              |    7 +-
 arch/arm64/net/bpf_jit_comp.c                      |   12 +-
 arch/loongarch/include/asm/bootinfo.h              |    4 +
 arch/loongarch/include/asm/kasan.h                 |    2 +-
 arch/loongarch/include/asm/loongarch.h             |    2 +-
 arch/loongarch/include/asm/pgalloc.h               |   11 +
 arch/loongarch/include/asm/pgtable.h               |   35 +-
 arch/loongarch/kernel/process.c                    |   16 +-
 arch/loongarch/kernel/setup.c                      |    3 +-
 arch/loongarch/kernel/traps.c                      |    5 +
 arch/loongarch/kernel/vdso.c                       |    8 +-
 arch/loongarch/kvm/timer.c                         |    7 +-
 arch/loongarch/kvm/vcpu.c                          |    2 +-
 arch/loongarch/mm/init.c                           |    2 +
 arch/loongarch/mm/pgtable.c                        |   20 +
 arch/mips/kernel/cmpxchg.c                         |    1 +
 arch/parisc/include/asm/mman.h                     |    5 +-
 arch/powerpc/kernel/head_8xx.S                     |    1 +
 arch/powerpc/kvm/book3s_hv.c                       |   12 +
 arch/powerpc/platforms/powernv/opal-irqchip.c      |    1 +
 arch/riscv/Kconfig                                 |    2 +-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |    6 +-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |    2 -
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |    3 +-
 arch/riscv/errata/Makefile                         |    6 +
 arch/riscv/kernel/Makefile                         |    5 +
 arch/riscv/kernel/acpi.c                           |    4 +-
 arch/riscv/kernel/asm-offsets.c                    |    2 -
 arch/riscv/kernel/cacheinfo.c                      |    7 +-
 arch/riscv/kernel/cpu-hotplug.c                    |    2 +-
 arch/riscv/kernel/efi-header.S                     |    2 +-
 arch/riscv/kernel/pi/Makefile                      |    6 +-
 arch/riscv/kernel/traps_misaligned.c               |    2 -
 arch/riscv/kernel/vdso/Makefile                    |    1 +
 arch/riscv/kvm/aia_imsic.c                         |    8 +-
 arch/riscv/net/bpf_jit_comp64.c                    |    8 +-
 arch/s390/configs/debug_defconfig                  |   13 +-
 arch/s390/configs/defconfig                        |   14 +-
 arch/s390/configs/zfcpdump_defconfig               |    1 +
 arch/s390/include/asm/io.h                         |    2 +
 arch/s390/include/asm/perf_event.h                 |    1 +
 arch/s390/kvm/diag.c                               |    2 +-
 arch/s390/kvm/gaccess.c                            |    4 +
 arch/s390/kvm/gaccess.h                            |   14 +-
 arch/s390/pci/pci_event.c                          |   17 +-
 arch/x86/Kconfig                                   |    1 +
 arch/x86/entry/entry.S                             |    5 +
 arch/x86/entry/entry_32.S                          |    6 +-
 arch/x86/include/asm/amd_nb.h                      |    5 +-
 arch/x86/include/asm/cpufeatures.h                 |    4 +-
 arch/x86/include/asm/nospec-branch.h               |   11 +-
 arch/x86/include/asm/runtime-const.h               |    4 +-
 arch/x86/include/asm/topology.h                    |    5 -
 arch/x86/include/asm/uaccess_64.h                  |   43 +-
 arch/x86/kernel/acpi/cppc.c                        |    7 +-
 arch/x86/kernel/amd_nb.c                           |    2 +
 arch/x86/kernel/apic/apic.c                        |   14 +-
 arch/x86/kernel/cpu/amd.c                          |    3 +-
 arch/x86/kernel/cpu/bugs.c                         |   32 +
 arch/x86/kernel/cpu/common.c                       |   13 +
 arch/x86/kernel/cpu/microcode/amd.c                |   51 +-
 arch/x86/kernel/cpu/resctrl/core.c                 |    4 +-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c          |   23 +-
 arch/x86/kernel/kvm.c                              |    4 +
 arch/x86/kernel/traps.c                            |   12 +-
 arch/x86/kernel/vmlinux.lds.S                      |    1 +
 arch/x86/kvm/mmu/mmu.c                             |   27 +-
 arch/x86/kvm/svm/nested.c                          |    6 +-
 arch/x86/kvm/vmx/vmx.c                             |    6 +-
 arch/x86/lib/getuser.S                             |    9 +-
 arch/x86/virt/svm/sev.c                            |    2 +
 arch/x86/xen/enlighten_pv.c                        |    4 +
 block/blk-map.c                                    |   58 +-
 block/blk-mq.c                                     |    8 +-
 block/blk-rq-qos.c                                 |    2 +-
 block/elevator.c                                   |   21 +-
 crypto/algapi.c                                    |    2 +-
 crypto/testmgr.c                                   |   23 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |    9 +
 drivers/accel/ivpu/ivpu_hw.c                       |    1 +
 drivers/accel/ivpu/ivpu_hw.h                       |    1 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |    5 +-
 drivers/accel/qaic/qaic_control.c                  |    2 +-
 drivers/accel/qaic/qaic_data.c                     |    6 +-
 drivers/acpi/button.c                              |   11 +
 drivers/acpi/cppc_acpi.c                           |   37 +-
 drivers/acpi/prmt.c                                |   29 +-
 drivers/acpi/processor_driver.c                    |    9 +
 drivers/acpi/resource.c                            |   79 +-
 drivers/ata/libata-eh.c                            |   19 +-
 drivers/base/arch_topology.c                       |    6 +-
 drivers/base/core.c                                |   48 +-
 drivers/base/module.c                              |    4 -
 drivers/base/power/common.c                        |   25 +-
 drivers/block/drbd/drbd_int.h                      |    1 -
 drivers/block/drbd/drbd_main.c                     |   14 -
 drivers/block/ublk_drv.c                           |   11 +-
 drivers/bluetooth/btusb.c                          |   19 +-
 drivers/cdrom/cdrom.c                              |    2 +-
 drivers/char/tpm/tpm-chip.c                        |   14 +-
 drivers/char/tpm/tpm-dev-common.c                  |    3 +
 drivers/char/tpm/tpm-interface.c                   |   30 +-
 drivers/char/tpm/tpm2-sessions.c                   |  100 +-
 drivers/char/virtio_console.c                      |   18 +-
 drivers/clk/clk_test.c                             |   61 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |    2 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   12 +-
 drivers/clk/qcom/videocc-sm8350.c                  |    4 +-
 drivers/clk/rockchip/clk.c                         |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |    1 +
 drivers/cpufreq/amd-pstate.c                       |   30 +-
 drivers/cpufreq/intel_pstate.c                     |   26 +-
 drivers/crypto/marvell/cesa/hash.c                 |   12 +-
 drivers/cxl/Kconfig                                |    1 +
 drivers/cxl/Makefile                               |   20 +-
 drivers/cxl/acpi.c                                 |    7 +
 drivers/cxl/core/cdat.c                            |    3 +
 drivers/cxl/core/hdm.c                             |   50 +-
 drivers/cxl/core/port.c                            |   13 +-
 drivers/cxl/core/region.c                          |   91 +-
 drivers/cxl/core/trace.h                           |   17 +-
 drivers/cxl/cxl.h                                  |    3 +-
 drivers/cxl/port.c                                 |   17 +-
 drivers/dax/device.c                               |    2 +-
 drivers/dma/ep93xx_dma.c                           |    9 +-
 drivers/dma/sh/rz-dmac.c                           |   25 +-
 drivers/dma/ti/k3-udma.c                           |   62 +-
 drivers/edac/qcom_edac.c                           |    8 +-
 drivers/firewire/core-topology.c                   |    2 +-
 drivers/firmware/arm_ffa/driver.c                  |   13 +-
 drivers/firmware/arm_scmi/bus.c                    |    7 +-
 drivers/firmware/arm_scmi/common.h                 |    2 +
 drivers/firmware/arm_scmi/driver.c                 |   14 +-
 drivers/firmware/arm_scmi/transports/Makefile      |    6 +-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   32 +-
 drivers/firmware/arm_sdei.c                        |    2 +-
 drivers/firmware/microchip/mpfs-auto-update.c      |   42 +-
 drivers/firmware/qcom/qcom_scm.c                   |   17 +-
 drivers/firmware/smccc/smccc.c                     |    4 -
 drivers/gpio/gpio-aspeed.c                         |    4 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |    4 +-
 drivers/gpio/gpiolib-swnode.c                      |    2 +-
 drivers/gpio/gpiolib.c                             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   26 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   25 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   13 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   45 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |    1 +
 .../drm/amd/display/modules/power/power_helpers.c  |    2 +
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   62 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    4 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   |  132 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   38 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  140 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    8 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    2 +
 drivers/gpu/drm/ast/ast_sil164.c                   |    2 +
 drivers/gpu/drm/ast/ast_vga.c                      |    2 +
 drivers/gpu/drm/bridge/aux-bridge.c                |    3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    1 +
 drivers/gpu/drm/drm_fbdev_dma.c                    |    3 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    1 -
 drivers/gpu/drm/i915/Kconfig                       |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   40 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   13 +
 drivers/gpu/drm/i915/display/intel_fb.h            |    1 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   10 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   11 +
 drivers/gpu/drm/imagination/pvr_context.c          |   33 +
 drivers/gpu/drm/imagination/pvr_context.h          |   21 +
 drivers/gpu/drm/imagination/pvr_device.h           |   10 +
 drivers/gpu/drm/imagination/pvr_drv.c              |    3 +
 drivers/gpu/drm/imagination/pvr_vm.c               |   22 +-
 drivers/gpu/drm/imagination/pvr_vm.h               |    1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |    4 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |    2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |   10 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |    2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   74 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    7 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   85 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |    7 +
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |    1 +
 drivers/gpu/drm/mediatek/mtk_plane.c               |   15 +-
 drivers/gpu/drm/mediatek/mtk_plane.h               |    4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   38 -
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   14 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |    5 -
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |    5 -
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |    5 -
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   10 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   10 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |    5 -
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   10 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |    5 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   77 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   68 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   19 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |    9 -
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    2 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |   12 +-
 drivers/gpu/drm/panthor/panthor_device.c           |    4 +
 drivers/gpu/drm/panthor/panthor_fw.c               |    4 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   11 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   18 +-
 drivers/gpu/drm/panthor/panthor_mmu.h              |    1 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   20 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |    9 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   17 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    3 -
 drivers/gpu/drm/radeon/radeon_object.c             |    1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   14 +-
 drivers/gpu/drm/tegra/drm.c                        |    4 +-
 drivers/gpu/drm/tegra/gr3d.c                       |   46 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |   24 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |    8 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   42 +
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    9 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   34 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |    9 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   65 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    8 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    5 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |    2 +-
 drivers/gpu/drm/xe/xe_device.c                     |   16 +-
 drivers/gpu/drm/xe/xe_device.h                     |   14 +
 drivers/gpu/drm/xe/xe_device_types.h               |    9 -
 drivers/gpu/drm/xe/xe_exec.c                       |   25 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    6 +
 drivers/gpu/drm/xe/xe_force_wake.c                 |   12 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   10 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |    2 +
 drivers/gpu/drm/xe/xe_gt.c                         |    5 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |   15 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |    4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   31 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |    1 -
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   53 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  126 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |    7 -
 drivers/gpu/drm/xe/xe_pm.c                         |    6 +-
 drivers/gpu/drm/xe/xe_query.c                      |    6 +-
 drivers/gpu/drm/xe/xe_sync.c                       |    5 +-
 drivers/gpu/drm/xe/xe_vm.c                         |    8 +-
 drivers/gpu/drm/xe/xe_wa.c                         |    4 +
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |   10 +-
 drivers/gpu/host1x/context.c                       |    1 +
 drivers/gpu/host1x/dev.c                           |   18 +-
 drivers/hid/amd-sfh-hid/amd_sfh_client.c           |   14 +-
 drivers/hid/hid-core.c                             |    2 +-
 drivers/hid/hid-ids.h                              |    4 +
 drivers/hid/hid-lenovo.c                           |    8 +
 drivers/hid/hid-multitouch.c                       |   13 +
 drivers/hid/hid-plantronics.c                      |   23 +
 drivers/hid/i2c-hid/i2c-hid-core.c                 |   10 +
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c        |    2 +-
 drivers/hid/wacom_wac.c                            |    2 +
 drivers/hwmon/Kconfig                              |    6 +
 drivers/hwmon/adt7475.c                            |    3 +-
 drivers/hwmon/intel-m10-bmc-hwmon.c                |    2 +-
 drivers/hwmon/jc42.c                               |    2 +-
 drivers/i2c/busses/i2c-designware-common.c         |    6 +-
 drivers/i2c/busses/i2c-designware-core.h           |    1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   |    4 +-
 drivers/iio/accel/Kconfig                          |    2 +
 drivers/iio/accel/bma400_core.c                    |    3 +-
 drivers/iio/adc/Kconfig                            |   11 +
 drivers/iio/adc/ad7124.c                           |    2 +-
 drivers/iio/adc/ad7380.c                           |  136 +-
 drivers/iio/amplifiers/Kconfig                     |    1 +
 drivers/iio/chemical/Kconfig                       |    2 +
 .../iio/common/hid-sensors/hid-sensor-trigger.c    |    2 +-
 drivers/iio/dac/Kconfig                            |    9 +-
 drivers/iio/dac/ltc2664.c                          |   17 +-
 drivers/iio/frequency/Kconfig                      |   34 +-
 drivers/iio/imu/bmi323/bmi323_core.c               |   23 +-
 drivers/iio/industrialio-gts-helper.c              |    4 +-
 drivers/iio/light/Kconfig                          |    2 +
 drivers/iio/light/opt3001.c                        |    4 +
 drivers/iio/light/veml6030.c                       |    7 +-
 drivers/iio/magnetometer/Kconfig                   |    2 +
 drivers/iio/pressure/Kconfig                       |    4 +
 drivers/iio/proximity/Kconfig                      |    2 +
 drivers/iio/resolver/Kconfig                       |    3 +
 drivers/infiniband/core/addr.c                     |    2 +
 drivers/infiniband/core/nldev.c                    |    2 +
 drivers/infiniband/hw/bnxt_re/hw_counters.c        |    2 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.c           |    6 +-
 drivers/infiniband/hw/bnxt_re/main.c               |   47 +-
 drivers/infiniband/hw/bnxt_re/qplib_fp.c           |    9 +
 drivers/infiniband/hw/bnxt_re/qplib_fp.h           |    2 +-
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c         |   40 +-
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.h         |    2 +
 drivers/infiniband/hw/bnxt_re/qplib_res.c          |   21 +-
 drivers/infiniband/hw/bnxt_re/qplib_sp.c           |   11 +-
 drivers/infiniband/hw/bnxt_re/qplib_sp.h           |    1 +
 drivers/infiniband/hw/cxgb4/cm.c                   |    9 +-
 drivers/infiniband/hw/cxgb4/provider.c             |    1 +
 drivers/infiniband/hw/irdma/cm.c                   |    2 +-
 drivers/infiniband/hw/mlx5/qp.c                    |    4 +-
 drivers/infiniband/sw/siw/siw_qp_tx.c              |    2 +
 drivers/infiniband/ulp/srpt/ib_srpt.c              |   80 +-
 drivers/input/input.c                              |  134 +-
 drivers/input/joystick/xpad.c                      |    3 +
 drivers/input/keyboard/adp5588-keys.c              |    6 +-
 drivers/input/touchscreen/edt-ft5x06.c             |   19 +-
 drivers/input/touchscreen/zinitix.c                |   34 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |    4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c         |    4 +-
 drivers/iommu/intel/iommu.c                        |    4 +-
 drivers/irqchip/Kconfig                            |    7 -
 drivers/irqchip/irq-gic-v3-its.c                   |   28 +-
 drivers/irqchip/irq-gic-v3.c                       |    7 +
 drivers/irqchip/irq-mscc-ocelot.c                  |   10 +-
 drivers/irqchip/irq-renesas-rzg2l.c                |   16 +-
 drivers/irqchip/irq-riscv-imsic-platform.c         |    2 +-
 drivers/irqchip/irq-riscv-intc.c                   |   19 +-
 drivers/irqchip/irq-sifive-plic.c                  |   29 +-
 drivers/md/dm-cache-target.c                       |   59 +-
 drivers/md/dm-unstripe.c                           |    4 +-
 drivers/md/dm-verity-target.c                      |    9 +-
 drivers/md/dm-verity.h                             |    1 +
 drivers/md/dm.c                                    |    4 +-
 drivers/md/md.c                                    |   24 +-
 drivers/md/raid10.c                                |    7 +-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    6 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |    2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |    3 +
 drivers/media/common/videobuf2/videobuf2-core.c    |   28 +-
 drivers/media/dvb-core/dvb_frontend.c              |    4 +-
 drivers/media/dvb-core/dvb_vb2.c                   |    8 +-
 drivers/media/dvb-core/dvbdev.c                    |   16 +-
 drivers/media/dvb-frontends/cx24116.c              |    7 +-
 drivers/media/dvb-frontends/stb0899_algo.c         |    2 +-
 drivers/media/i2c/adv7604.c                        |   26 +-
 drivers/media/i2c/ar0521.c                         |    4 +-
 drivers/media/pci/mgb4/mgb4_cmt.c                  |    2 +
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |   17 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    2 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |    4 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |    2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |    2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   17 +-
 drivers/misc/cardreader/Kconfig                    |    3 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c  |    2 +
 drivers/misc/mei/client.c                          |    4 +-
 drivers/misc/sgi-gru/grukservices.c                |    2 -
 drivers/misc/sgi-gru/grumain.c                     |    4 -
 drivers/misc/sgi-gru/grutlbpurge.c                 |    2 -
 drivers/mmc/core/queue.c                           |    3 +-
 drivers/mmc/host/mvsdio.c                          |   71 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c                |    8 +
 drivers/mmc/host/sdhci-pci-gli.c                   |   38 +-
 drivers/net/can/c_can/c_can_main.c                 |    7 +-
 drivers/net/can/cc770/Kconfig                      |    2 +-
 drivers/net/can/m_can/m_can.c                      |    3 +-
 drivers/net/can/rockchip/Kconfig                   |    3 +-
 drivers/net/can/sja1000/Kconfig                    |    2 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c     |    8 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c      |   10 +-
 drivers/net/dsa/b53/b53_common.c                   |   17 +-
 drivers/net/dsa/lan9303-core.c                     |   29 +
 drivers/net/dsa/microchip/ksz_common.c             |   21 +-
 drivers/net/dsa/mv88e6xxx/chip.c                   |    2 +-
 drivers/net/dsa/mv88e6xxx/chip.h                   |    6 +-
 drivers/net/dsa/mv88e6xxx/port.c                   |    1 +
 drivers/net/dsa/mv88e6xxx/ptp.c                    |  108 +-
 drivers/net/dsa/sja1105/sja1105_main.c             |    1 -
 drivers/net/dsa/vitesse-vsc73xx-core.c             |    1 -
 drivers/net/ethernet/adi/adin1110.c                |    4 +-
 drivers/net/ethernet/aeroflex/greth.c              |    3 +-
 drivers/net/ethernet/amd/mvme147.c                 |    7 +-
 drivers/net/ethernet/arc/emac_main.c               |   27 +-
 drivers/net/ethernet/arc/emac_mdio.c               |    9 +-
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   |    1 +
 drivers/net/ethernet/broadcom/bcmsysport.c         |    1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   22 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c      |   70 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.h      |   12 +-
 drivers/net/ethernet/cadence/macb_main.c           |   14 +-
 drivers/net/ethernet/emulex/benet/be_main.c        |   10 +-
 drivers/net/ethernet/faraday/ftgmac100.c           |    7 +-
 .../net/ethernet/freescale/dpaa/dpaa_eth_trace.h   |    2 +-
 drivers/net/ethernet/freescale/enetc/enetc.c       |   56 +-
 drivers/net/ethernet/freescale/enetc/enetc.h       |    1 +
 drivers/net/ethernet/freescale/enetc/enetc_pf.c    |   18 +-
 drivers/net/ethernet/freescale/enetc/enetc_vf.c    |    9 +-
 drivers/net/ethernet/freescale/fec_main.c          |    6 +-
 drivers/net/ethernet/freescale/fman/mac.c          |   68 +-
 drivers/net/ethernet/freescale/fman/mac.h          |    6 +-
 drivers/net/ethernet/hisilicon/hns3/hnae3.c        |    5 +-
 drivers/net/ethernet/i825xx/sun3_82586.c           |    1 +
 drivers/net/ethernet/ibm/emac/mal.c                |    4 +-
 drivers/net/ethernet/ibm/ibmvnic.c                 |    6 +-
 drivers/net/ethernet/intel/e1000e/hw.h             |    4 +-
 drivers/net/ethernet/intel/e1000e/ich8lan.c        |   17 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |    4 +-
 drivers/net/ethernet/intel/i40e/i40e.h             |    1 +
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c     |    1 +
 drivers/net/ethernet/intel/i40e/i40e_main.c        |   13 +-
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c |    2 +
 .../net/ethernet/intel/ice/devlink/devlink_port.c  |    6 +
 drivers/net/ethernet/intel/ice/ice_ddp.c           |   58 +-
 drivers/net/ethernet/intel/ice/ice_ddp.h           |    4 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c          |   76 +-
 drivers/net/ethernet/intel/ice/ice_eswitch.c       |    3 +-
 drivers/net/ethernet/intel/ice/ice_eswitch_br.c    |    5 +-
 drivers/net/ethernet/intel/ice/ice_eswitch_br.h    |    1 +
 drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c  |    3 +-
 drivers/net/ethernet/intel/ice/ice_fdir.h          |    4 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |   39 +-
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c        |   21 +-
 drivers/net/ethernet/intel/ice/ice_ptp_hw.h        |    1 +
 drivers/net/ethernet/intel/ice/ice_sriov.c         |   19 +-
 drivers/net/ethernet/intel/ice/ice_switch.c        |    2 -
 drivers/net/ethernet/intel/ice/ice_tc_lib.c        |   11 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.c        |    9 +-
 .../net/ethernet/intel/ice/ice_vf_lib_private.h    |    1 -
 drivers/net/ethernet/intel/ice/ice_vsi_vlan_lib.c  |   57 +
 drivers/net/ethernet/intel/ice/ice_vsi_vlan_lib.h  |    1 +
 drivers/net/ethernet/intel/idpf/idpf.h             |    4 +-
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c     |   11 +-
 drivers/net/ethernet/intel/idpf/idpf_lib.c         |    5 +-
 drivers/net/ethernet/intel/idpf/idpf_vf_dev.c      |    1 +
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c    |   14 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |    6 +-
 drivers/net/ethernet/marvell/octeon_ep/octep_rx.c  |   82 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_nix.c    |    4 +-
 drivers/net/ethernet/mediatek/airoha_eth.c         |    9 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        |    2 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h         |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/cmd.c      |    8 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eq.c       |    6 +
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c  |    5 +-
 .../mellanox/mlx5/core/steering/hws/mlx5hws_bwc.c  |    4 +-
 .../mlx5/core/steering/hws/mlx5hws_context.h       |    1 +
 .../mlx5/core/steering/hws/mlx5hws_definer.c       |    4 +-
 .../mellanox/mlx5/core/steering/hws/mlx5hws_send.c |   22 +-
 drivers/net/ethernet/mellanox/mlxsw/pci.c          |   25 +-
 .../net/ethernet/mellanox/mlxsw/spectrum_ipip.c    |   26 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c |    7 +
 .../net/ethernet/mellanox/mlxsw/spectrum_router.c  |    9 +-
 drivers/net/ethernet/microchip/lan743x_ptp.c       |   35 +-
 .../net/ethernet/microchip/sparx5/sparx5_mirror.c  |   12 +-
 .../net/ethernet/microchip/vcap/vcap_api_kunit.c   |    2 +
 .../net/ethernet/pensando/ionic/ionic_bus_pci.c    |    1 +
 drivers/net/ethernet/realtek/r8169_main.c          |    4 +-
 drivers/net/ethernet/renesas/ravb_main.c           |   25 +-
 drivers/net/ethernet/renesas/rtsn.c                |    1 +
 drivers/net/ethernet/sfc/efx_channels.c            |    3 +-
 drivers/net/ethernet/sfc/siena/efx_channels.c      |    3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  |   14 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |    8 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |    2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   25 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c           |   97 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.h           |    6 +-
 drivers/net/ethernet/ti/icssg/icssg_config.c       |    2 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c       |    1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h       |    2 +
 drivers/net/ethernet/vertexcom/mse102x.c           |    5 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c  |    6 +-
 drivers/net/gtp.c                                  |   22 +-
 drivers/net/hyperv/netvsc_drv.c                    |   30 +
 drivers/net/macsec.c                               |   21 +-
 drivers/net/mctp/mctp-i2c.c                        |    3 +
 drivers/net/mdio/mdio-bcm-unimac.c                 |    1 +
 drivers/net/netconsole.c                           |    8 +-
 drivers/net/netdevsim/dev.c                        |   15 +-
 drivers/net/netdevsim/fib.c                        |    4 +-
 drivers/net/phy/aquantia/aquantia_main.c           |   51 +-
 drivers/net/phy/bcm84881.c                         |    4 +-
 drivers/net/phy/dp83822.c                          |    4 +-
 drivers/net/phy/dp83848.c                          |    2 +
 drivers/net/phy/dp83869.c                          |    1 -
 drivers/net/phy/phy_device.c                       |    5 +-
 drivers/net/phy/realtek.c                          |   24 +-
 drivers/net/plip/plip.c                            |    2 +-
 drivers/net/ppp/ppp_async.c                        |    2 +-
 drivers/net/pse-pd/pse_core.c                      |   15 +-
 drivers/net/slip/slhc.c                            |   57 +-
 drivers/net/usb/qmi_wwan.c                         |    2 +
 drivers/net/usb/r8152.c                            |    1 +
 drivers/net/usb/usbnet.c                           |    4 +-
 drivers/net/virtio_net.c                           |  121 +-
 drivers/net/vmxnet3/vmxnet3_xdp.c                  |    2 +-
 drivers/net/vxlan/vxlan_core.c                     |    6 +-
 drivers/net/vxlan/vxlan_private.h                  |    2 +-
 drivers/net/vxlan/vxlan_vnifilter.c                |   19 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c          |    7 +-
 drivers/net/wireless/ath/ath10k/wmi.c              |    2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c            |    7 +-
 drivers/net/wireless/ath/wil6210/txrx.c            |    2 +-
 drivers/net/wireless/broadcom/brcm80211/Kconfig    |    1 +
 drivers/net/wireless/intel/ipw2x00/ipw2100.c       |    2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2200.h       |    2 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |   15 +-
 drivers/net/wireless/intel/iwlegacy/common.h       |   12 +
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c       |   96 +-
 drivers/net/wireless/intel/iwlwifi/fw/init.c       |    4 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c       |   28 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.h       |    3 +
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c        |    2 +
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |   10 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   12 +-
 .../net/wireless/intel/iwlwifi/mvm/mld-mac80211.c  |   34 +-
 drivers/net/wireless/intel/iwlwifi/mvm/scan.c      |    6 +-
 drivers/net/wireless/marvell/libertas/radiotap.h   |    4 +-
 drivers/net/wireless/mediatek/mt76/mcu.c           |    7 +-
 drivers/net/wireless/microchip/wilc1000/mon.c      |    4 +-
 .../net/wireless/realtek/rtlwifi/rtl8192du/sw.c    |    1 -
 drivers/net/wireless/realtek/rtw88/usb.c           |    1 -
 drivers/net/wireless/realtek/rtw89/coex.c          |    2 +
 drivers/net/wireless/realtek/rtw89/pci.c           |   48 +-
 drivers/net/wireless/virtual/mac80211_hwsim.c      |    4 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c         |    2 +-
 drivers/net/wwan/wwan_core.c                       |    2 +-
 drivers/nvme/host/core.c                           |  118 +-
 drivers/nvme/host/ioctl.c                          |    7 +-
 drivers/nvme/host/multipath.c                      |   40 +-
 drivers/nvme/host/nvme.h                           |    1 +
 drivers/nvme/host/pci.c                            |   19 +-
 drivers/nvme/host/tcp.c                            |    7 +-
 drivers/nvme/target/auth.c                         |    1 +
 drivers/nvme/target/loop.c                         |   13 +
 drivers/nvme/target/passthru.c                     |    6 +-
 drivers/nvme/target/rdma.c                         |   56 +-
 drivers/of/of_kunit_helpers.c                      |   15 +
 drivers/of/of_private.h                            |    3 +
 drivers/of/of_test.c                               |    3 +
 drivers/of/overlay_test.c                          |    5 +-
 drivers/opp/core.c                                 |    4 +-
 drivers/parport/procfs.c                           |   22 +-
 drivers/pci/pci.c                                  |   14 +-
 drivers/pci/probe.c                                |    2 +
 drivers/pci/pwrctl/pci-pwrctl-pwrseq.c             |   55 +-
 drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c  |   12 +-
 drivers/phy/broadcom/phy-brcm-usb-init.c           |    2 +
 drivers/phy/cadence/phy-cadence-sierra.c           |   21 +-
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c         |   10 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |    3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |    8 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c     |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |    1 +
 drivers/phy/rockchip/Kconfig                       |    1 +
 drivers/phy/starfive/phy-jh7110-usb.c              |   16 +
 drivers/phy/tegra/xusb.c                           |    2 +
 drivers/phy/ti/phy-j721e-wiz.c                     |    4 +-
 drivers/pinctrl/intel/Kconfig                      |    1 +
 drivers/pinctrl/intel/pinctrl-intel-platform.c     |    5 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |    2 +-
 drivers/pinctrl/pinctrl-apple-gpio.c               |    3 +
 drivers/pinctrl/pinctrl-aw9523.c                   |    6 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    8 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c            |    2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    9 +-
 drivers/platform/x86/amd/pmc/pmc.c                 |    5 +
 drivers/platform/x86/amd/pmf/core.c                |    1 +
 drivers/platform/x86/amd/pmf/spc.c                 |    1 +
 drivers/platform/x86/asus-wmi.c                    |   10 +
 drivers/platform/x86/dell/dell-smbios-base.c       |    1 +
 drivers/platform/x86/dell/dell-wmi-base.c          |   15 +
 drivers/platform/x86/ideapad-laptop.c              |    3 +
 drivers/platform/x86/intel/pmc/adl.c               |    2 -
 drivers/platform/x86/intel/pmc/cnp.c               |    2 -
 drivers/platform/x86/intel/pmc/core.c              |   46 -
 drivers/platform/x86/intel/pmc/core.h              |    8 -
 drivers/platform/x86/intel/pmc/core_ssram.c        |    4 +-
 drivers/platform/x86/intel/pmc/icl.c               |    2 -
 drivers/platform/x86/intel/pmc/mtl.c               |    2 -
 drivers/platform/x86/intel/pmc/tgl.c               |    2 -
 drivers/platform/x86/thinkpad_acpi.c               |   28 +-
 drivers/pmdomain/qcom/cpr.c                        |    2 +-
 drivers/powercap/dtpm_devfreq.c                    |    2 +-
 drivers/powercap/intel_rapl_msr.c                  |    2 +
 drivers/powercap/intel_rapl_tpmi.c                 |   19 +-
 drivers/pwm/pwm-imx-tpm.c                          |    4 +-
 drivers/regulator/rk808-regulator.c                |    2 +
 drivers/regulator/rtq2208-regulator.c              |    2 +-
 drivers/reset/reset-npcm.c                         |    4 +-
 drivers/reset/starfive/reset-starfive-jh71x0.c     |    3 +
 drivers/rpmsg/qcom_glink_native.c                  |   10 +-
 drivers/s390/char/sclp.c                           |    3 +-
 drivers/s390/char/sclp_vt220.c                     |    4 +-
 drivers/s390/crypto/ap_bus.c                       |    3 +-
 drivers/s390/crypto/ap_bus.h                       |    2 +-
 drivers/s390/crypto/ap_queue.c                     |   28 +-
 drivers/s390/crypto/pkey_pckmo.c                   |    1 +
 drivers/scsi/fnic/fnic_main.c                      |    2 +-
 drivers/scsi/mpi3mr/mpi3mr.h                       |    4 +-
 drivers/scsi/mpi3mr/mpi3mr_transport.c             |   42 +-
 drivers/scsi/scsi_debug.c                          |   10 +-
 drivers/scsi/scsi_transport_fc.c                   |    4 +-
 drivers/scsi/sd_zbc.c                              |    3 +-
 drivers/scsi/wd33c93.c                             |    2 +-
 drivers/soc/fsl/qe/qmc.c                           |   11 +-
 drivers/soc/qcom/llcc-qcom.c                       |    3 +
 drivers/soc/qcom/pmic_glink.c                      |   25 +-
 drivers/soc/qcom/socinfo.c                         |    8 +-
 drivers/soundwire/Kconfig                          |    1 +
 drivers/soundwire/amd_init.c                       |   12 +-
 drivers/soundwire/intel_ace2x.c                    |    7 +
 drivers/soundwire/intel_init.c                     |   13 +-
 drivers/soundwire/slave.c                          |   14 +
 drivers/spi/spi-fsl-dspi.c                         |    6 +-
 drivers/spi/spi-geni-qcom.c                        |    8 +-
 drivers/spi/spi-mtk-snfi.c                         |    2 +-
 drivers/spi/spi-stm32.c                            |    1 +
 drivers/staging/iio/frequency/ad9832.c             |    7 +-
 drivers/staging/media/av7110/av7110.h              |    4 +-
 drivers/staging/media/av7110/av7110_ca.c           |   25 +-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |    6 +-
 drivers/target/target_core_device.c                |    2 +-
 drivers/target/target_core_user.c                  |    2 +-
 .../int340x_thermal/processor_thermal_device_pci.c |    2 -
 .../intel/int340x_thermal/processor_thermal_rapl.c |   70 +-
 drivers/thermal/qcom/lmh.c                         |    7 +
 drivers/thermal/thermal_core.c                     |    5 +-
 drivers/thermal/thermal_core.h                     |    3 +
 drivers/thermal/thermal_netlink.c                  |    9 +-
 drivers/thermal/thermal_of.c                       |   21 +-
 drivers/thunderbolt/retimer.c                      |    7 +-
 drivers/thunderbolt/tb.c                           |   48 +-
 drivers/thunderbolt/usb4.c                         |    2 +-
 drivers/tty/n_gsm.c                                |    2 +
 drivers/tty/serial/imx.c                           |   15 +
 drivers/tty/serial/qcom_geni_serial.c              |  103 +-
 drivers/tty/vt/vt.c                                |    2 +-
 drivers/ufs/core/ufs-mcq.c                         |   15 +-
 drivers/ufs/core/ufshcd.c                          |   41 +-
 drivers/usb/core/usb-acpi.c                        |    4 +-
 drivers/usb/dwc2/params.c                          |    1 -
 drivers/usb/dwc3/core.c                            |   48 +-
 drivers/usb/dwc3/core.h                            |    7 +-
 drivers/usb/dwc3/gadget.c                          |   21 +-
 drivers/usb/gadget/function/f_uac2.c               |    6 +-
 drivers/usb/gadget/udc/core.c                      |    1 +
 drivers/usb/gadget/udc/dummy_hcd.c                 |   20 +-
 drivers/usb/host/xhci-dbgcap.h                     |    1 +
 drivers/usb/host/xhci-dbgtty.c                     |   55 +-
 drivers/usb/host/xhci-pci.c                        |   11 +-
 drivers/usb/host/xhci-ring.c                       |   84 +-
 drivers/usb/host/xhci-tegra.c                      |    2 +-
 drivers/usb/host/xhci.h                            |    2 +-
 drivers/usb/misc/Kconfig                           |   12 +
 drivers/usb/misc/onboard_usb_dev.c                 |    6 +-
 drivers/usb/misc/yurex.c                           |   21 +-
 drivers/usb/musb/sunxi.c                           |    2 -
 drivers/usb/phy/phy.c                              |    2 +-
 drivers/usb/serial/io_edgeport.c                   |    8 +-
 drivers/usb/serial/option.c                        |   14 +
 drivers/usb/serial/qcserial.c                      |    2 +
 drivers/usb/storage/unusual_devs.h                 |   11 +
 drivers/usb/typec/class.c                          |    9 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   10 +-
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |    8 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |    1 -
 drivers/usb/typec/tcpm/tcpm.c                      |   10 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |    2 +
 drivers/vdpa/octeon_ep/octep_vdpa_hw.c             |   12 +-
 drivers/vhost/scsi.c                               |   27 +-
 drivers/video/fbdev/Kconfig                        |   15 +-
 drivers/video/fbdev/Makefile                       |    1 -
 drivers/video/fbdev/amifb.c                        |    4 +-
 drivers/video/fbdev/arcfb.c                        |    2 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    2 +-
 drivers/video/fbdev/au1100fb.c                     |    2 +-
 drivers/video/fbdev/au1200fb.c                     |    2 +-
 drivers/video/fbdev/broadsheetfb.c                 |    2 +-
 drivers/video/fbdev/bw2.c                          |    4 +-
 drivers/video/fbdev/cg14.c                         |    4 +-
 drivers/video/fbdev/cg3.c                          |    4 +-
 drivers/video/fbdev/cg6.c                          |    4 +-
 drivers/video/fbdev/clps711x-fb.c                  |    2 +-
 drivers/video/fbdev/cobalt_lcdfb.c                 |    2 +-
 drivers/video/fbdev/da8xx-fb.c                     | 1665 -----
 drivers/video/fbdev/ep93xx-fb.c                    |    2 +-
 drivers/video/fbdev/ffb.c                          |    4 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    6 +-
 drivers/video/fbdev/gbefb.c                        |    6 +-
 drivers/video/fbdev/goldfishfb.c                   |    2 +-
 drivers/video/fbdev/grvga.c                        |    2 +-
 drivers/video/fbdev/hecubafb.c                     |    2 +-
 drivers/video/fbdev/hgafb.c                        |    2 +-
 drivers/video/fbdev/hitfb.c                        |    2 +-
 drivers/video/fbdev/imxfb.c                        |    2 +-
 drivers/video/fbdev/leo.c                          |    4 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    2 +-
 drivers/video/fbdev/metronomefb.c                  |    2 +-
 drivers/video/fbdev/nvidia/nv_hw.c                 |    8 +-
 drivers/video/fbdev/ocfb.c                         |    2 +-
 drivers/video/fbdev/offb.c                         |    4 +-
 drivers/video/fbdev/omap/omapfb_main.c             |    2 +-
 .../omap2/omapfb/displays/connector-analog-tv.c    |    2 +-
 .../fbdev/omap2/omapfb/displays/connector-dvi.c    |    2 +-
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |    2 +-
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |    2 +-
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |    2 +-
 .../omap2/omapfb/displays/encoder-tpd12s015.c      |    2 +-
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |    2 +-
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |    2 +-
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/core.c        |    6 +-
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c       |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c         |    4 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss.c         |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c       |    6 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c       |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c         |    6 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |    6 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    2 +-
 drivers/video/fbdev/p9100.c                        |    4 +-
 drivers/video/fbdev/platinumfb.c                   |    2 +-
 drivers/video/fbdev/pxa168fb.c                     |    2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                   |    8 +-
 drivers/video/fbdev/pxafb.c                        |    2 +-
 drivers/video/fbdev/s1d13xxxfb.c                   |    2 +-
 drivers/video/fbdev/s3c-fb.c                       |    2 +-
 drivers/video/fbdev/sbuslib.c                      |    2 +-
 drivers/video/fbdev/sbuslib.h                      |    2 +-
 drivers/video/fbdev/sh7760fb.c                     |    2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    2 +-
 drivers/video/fbdev/simplefb.c                     |    2 +-
 drivers/video/fbdev/sm501fb.c                      |    2 +-
 drivers/video/fbdev/sstfb.c                        |    9 +-
 drivers/video/fbdev/tcx.c                          |    4 +-
 drivers/video/fbdev/uvesafb.c                      |    2 +-
 drivers/video/fbdev/vesafb.c                       |    2 +-
 drivers/video/fbdev/vfb.c                          |    2 +-
 drivers/video/fbdev/vga16fb.c                      |    2 +-
 drivers/video/fbdev/via/via-gpio.c                 |    2 +-
 drivers/video/fbdev/via/via_i2c.c                  |    2 +-
 drivers/video/fbdev/vt8500lcdfb.c                  |    2 +-
 drivers/video/fbdev/wm8505fb.c                     |    2 +-
 drivers/video/fbdev/wmt_ge_rops.c                  |    2 +-
 drivers/video/fbdev/xilinxfb.c                     |    2 +-
 drivers/virtio/virtio_ring.c                       |    2 +-
 drivers/xen/Kconfig                                |    1 -
 drivers/xen/acpi.c                                 |   24 +
 drivers/xen/privcmd.c                              |    6 +-
 drivers/xen/xen-pciback/pci_stub.c                 |   11 +-
 fs/9p/fid.c                                        |    5 +-
 fs/9p/v9fs.h                                       |   34 +-
 fs/9p/v9fs_vfs.h                                   |    2 +-
 fs/9p/vfs_inode.c                                  |  129 +-
 fs/9p/vfs_inode_dotl.c                             |  112 +-
 fs/9p/vfs_super.c                                  |    2 +-
 fs/Kconfig                                         |    2 +-
 fs/afs/dir.c                                       |   25 +
 fs/afs/dir_edit.c                                  |   91 +-
 fs/afs/internal.h                                  |    4 +
 fs/afs/rxrpc.c                                     |   83 +-
 fs/autofs/dev-ioctl.c                              |    5 +-
 fs/backing-file.c                                  |    8 +-
 fs/bcachefs/alloc_background.c                     |   47 +-
 fs/bcachefs/alloc_background.h                     |    3 +
 fs/bcachefs/alloc_foreground.c                     |   21 +-
 fs/bcachefs/bcachefs.h                             |    1 +
 fs/bcachefs/bcachefs_format.h                      |    3 +-
 fs/bcachefs/bkey.c                                 |    7 +-
 fs/bcachefs/btree_cache.c                          |  107 +-
 fs/bcachefs/btree_cache.h                          |    2 +
 fs/bcachefs/btree_gc.c                             |   27 +-
 fs/bcachefs/btree_io.c                             |    7 +-
 fs/bcachefs/btree_iter.c                           |   19 +-
 fs/bcachefs/btree_iter.h                           |   10 +
 fs/bcachefs/btree_node_scan.c                      |    5 +-
 fs/bcachefs/btree_update.c                         |    4 +-
 fs/bcachefs/btree_update.h                         |    2 +-
 fs/bcachefs/btree_update_interior.c                |   34 +-
 fs/bcachefs/buckets.c                              |    7 +-
 fs/bcachefs/buckets.h                              |   31 +-
 fs/bcachefs/chardev.c                              |    1 +
 fs/bcachefs/darray.c                               |   15 +-
 fs/bcachefs/data_update.c                          |   22 +-
 fs/bcachefs/data_update.h                          |    3 +-
 fs/bcachefs/dirent.c                               |    7 -
 fs/bcachefs/dirent.h                               |    7 +
 fs/bcachefs/disk_accounting.c                      |  155 +-
 fs/bcachefs/ec.c                                   |  112 +-
 fs/bcachefs/errcode.h                              |    6 +-
 fs/bcachefs/error.c                                |    5 +-
 fs/bcachefs/extents.c                              |   86 +-
 fs/bcachefs/extents.h                              |   15 +-
 fs/bcachefs/fs-io-buffered.c                       |    6 +
 fs/bcachefs/fs-io-direct.c                         |    3 +-
 fs/bcachefs/fs-io-pagecache.c                      |   70 +-
 fs/bcachefs/fs-io.c                                |   19 +-
 fs/bcachefs/fs.c                                   |  134 +-
 fs/bcachefs/fs.h                                   |    9 +-
 fs/bcachefs/fsck.c                                 |  645 +-
 fs/bcachefs/fsck.h                                 |    1 +
 fs/bcachefs/inode.c                                |  302 +-
 fs/bcachefs/inode.h                                |   11 +
 fs/bcachefs/inode_format.h                         |    9 +-
 fs/bcachefs/io_misc.c                              |    2 +-
 fs/bcachefs/io_read.c                              |   18 +-
 fs/bcachefs/io_write.c                             |   11 +-
 fs/bcachefs/journal.c                              |   23 +-
 fs/bcachefs/journal.h                              |    2 +-
 fs/bcachefs/journal_io.c                           |    2 +
 fs/bcachefs/move.c                                 |    2 +-
 fs/bcachefs/opts.c                                 |   12 +-
 fs/bcachefs/opts.h                                 |    3 +-
 fs/bcachefs/quota.c                                |    2 +-
 fs/bcachefs/rebalance.c                            |    4 +-
 fs/bcachefs/recovery.c                             |   26 +-
 fs/bcachefs/recovery_passes.c                      |    6 +
 fs/bcachefs/recovery_passes_types.h                |    1 +
 fs/bcachefs/replicas.c                             |   39 +-
 fs/bcachefs/sb-downgrade.c                         |    8 +-
 fs/bcachefs/sb-errors_format.h                     |   10 +-
 fs/bcachefs/sb-members.c                           |   10 +-
 fs/bcachefs/snapshot.c                             |  129 +-
 fs/bcachefs/snapshot.h                             |    3 -
 fs/bcachefs/str_hash.h                             |   60 +-
 fs/bcachefs/subvolume.c                            |    7 +-
 fs/bcachefs/super-io.c                             |    5 +
 fs/bcachefs/super.c                                |   36 +-
 fs/bcachefs/tests.c                                |    9 +-
 fs/bcachefs/xattr.c                                |    2 +-
 fs/btrfs/bio.c                                     |   37 +-
 fs/btrfs/bio.h                                     |    3 +
 fs/btrfs/block-group.c                             |    2 +
 fs/btrfs/defrag.c                                  |   10 +-
 fs/btrfs/delayed-ref.c                             |   57 +-
 fs/btrfs/delayed-ref.h                             |   10 +-
 fs/btrfs/dir-item.c                                |    4 +-
 fs/btrfs/disk-io.c                                 |    2 +-
 fs/btrfs/extent-tree.c                             |   26 +-
 fs/btrfs/extent_io.c                               |   31 +-
 fs/btrfs/extent_map.c                              |   38 +-
 fs/btrfs/free-space-cache.c                        |    4 +-
 fs/btrfs/free-space-cache.h                        |    6 +
 fs/btrfs/inode.c                                   |    9 +-
 fs/btrfs/qgroup.c                                  |   23 +-
 fs/btrfs/qgroup.h                                  |    2 +
 fs/btrfs/send.c                                    |    4 +-
 fs/btrfs/super.c                                   |   37 +-
 fs/btrfs/tree-log.c                                |    6 +-
 fs/btrfs/volumes.c                                 |    1 +
 fs/btrfs/volumes.h                                 |    6 +
 fs/btrfs/zoned.c                                   |    2 +-
 fs/dax.c                                           |   45 +-
 fs/erofs/super.c                                   |   17 +-
 fs/erofs/zdata.c                                   |   29 +-
 fs/erofs/zmap.c                                    |   32 +-
 fs/f2fs/file.c                                     |    3 +-
 fs/fat/namei_vfat.c                                |    2 +-
 fs/fuse/file.c                                     |   18 +-
 fs/fuse/passthrough.c                              |    9 +-
 fs/inode.c                                         |   10 +-
 fs/iomap/buffered-io.c                             |  128 +-
 fs/jfs/jfs_dmap.c                                  |    2 +-
 fs/namespace.c                                     |    4 +-
 fs/netfs/buffered_read.c                           |   47 +-
 fs/netfs/locking.c                                 |    3 +-
 fs/netfs/read_collect.c                            |    2 +
 fs/nfs/callback_xdr.c                              |    2 +
 fs/nfs/client.c                                    |    4 +-
 fs/nfs/delegation.c                                |    5 +
 fs/nfs/inode.c                                     |   70 +-
 fs/nfs/localio.c                                   |   10 +-
 fs/nfs/nfs42proc.c                                 |    2 +-
 fs/nfs/nfs4proc.c                                  |    4 +
 fs/nfs/nfs4state.c                                 |    2 +-
 fs/nfs/super.c                                     |   10 +-
 fs/nfs_common/nfslocalio.c                         |   28 +-
 fs/nfsd/filecache.c                                |    6 +-
 fs/nfsd/localio.c                                  |    2 +-
 fs/nfsd/nfs4proc.c                                 |    8 +-
 fs/nfsd/nfs4state.c                                |   51 +-
 fs/nfsd/nfssvc.c                                   |   10 +-
 fs/nfsd/state.h                                    |    2 +
 fs/nfsd/trace.h                                    |    6 +-
 fs/nfsd/vfs.c                                      |   13 +-
 fs/nilfs2/dir.c                                    |   48 +-
 fs/nilfs2/namei.c                                  |   42 +-
 fs/nilfs2/nilfs.h                                  |    2 +-
 fs/nilfs2/page.c                                   |    7 +-
 fs/ntfs3/attrib.c                                  |   96 +-
 fs/ntfs3/attrlist.c                                |   53 -
 fs/ntfs3/file.c                                    |  185 +-
 fs/ntfs3/frecord.c                                 |   97 +-
 fs/ntfs3/fslog.c                                   |   19 +-
 fs/ntfs3/inode.c                                   |   20 +-
 fs/ntfs3/lib/lzx_decompress.c                      |    3 +-
 fs/ntfs3/lznt.c                                    |    3 +
 fs/ntfs3/namei.c                                   |   10 +-
 fs/ntfs3/ntfs_fs.h                                 |   10 +-
 fs/ntfs3/record.c                                  |   31 +-
 fs/ntfs3/run.c                                     |    8 +-
 fs/ntfs3/super.c                                   |   70 +-
 fs/ntfs3/xattr.c                                   |    2 +-
 fs/ocfs2/file.c                                    |   17 +-
 fs/ocfs2/xattr.c                                   |    3 +-
 fs/open.c                                          |    2 +
 fs/overlayfs/file.c                                |    9 +-
 fs/proc/fd.c                                       |    2 +-
 fs/proc/kcore.c                                    |   36 +-
 fs/proc/softirqs.c                                 |    2 +-
 fs/proc/task_mmu.c                                 |   16 +-
 fs/proc/vmcore.c                                   |    9 +-
 fs/smb/client/cifs_unicode.c                       |   17 +-
 fs/smb/client/cifsfs.c                             |    2 +-
 fs/smb/client/cifsproto.h                          |    9 -
 fs/smb/client/compress.c                           |    4 -
 fs/smb/client/connect.c                            |   26 +-
 fs/smb/client/fs_context.c                         |    7 +
 fs/smb/client/reparse.c                            |  164 +-
 fs/smb/client/sess.c                               |   32 -
 fs/smb/client/smb2inode.c                          |    3 +-
 fs/smb/client/smb2ops.c                            |    3 +-
 fs/smb/client/smb2pdu.c                            |    9 +
 fs/smb/client/smb2proto.h                          |    1 +
 fs/smb/server/auth.c                               |    6 +-
 fs/smb/server/connection.c                         |    1 +
 fs/smb/server/connection.h                         |    1 +
 fs/smb/server/ksmbd_netlink.h                      |   17 +
 fs/smb/server/mgmt/user_config.c                   |   45 +-
 fs/smb/server/mgmt/user_config.h                   |    5 +-
 fs/smb/server/mgmt/user_session.c                  |   41 +-
 fs/smb/server/mgmt/user_session.h                  |    4 +
 fs/smb/server/server.c                             |   18 +-
 fs/smb/server/smb2pdu.c                            |    8 +-
 fs/smb/server/smb_common.c                         |   25 +-
 fs/smb/server/smb_common.h                         |    2 +-
 fs/smb/server/transport_ipc.c                      |   64 +-
 fs/smb/server/transport_ipc.h                      |    2 +
 fs/squashfs/file_direct.c                          |    9 +-
 fs/super.c                                         |   26 +-
 fs/tracefs/inode.c                                 |   12 +-
 fs/unicode/mkutf8data.c                            |   70 -
 fs/unicode/utf8data.c_shipped                      | 6703 ++++++++++----------
 fs/userfaultfd.c                                   |   28 +
 fs/xfs/libxfs/xfs_ag.c                             |   75 +-
 fs/xfs/libxfs/xfs_ag.h                             |   11 +-
 fs/xfs/libxfs/xfs_alloc.c                          |    9 +-
 fs/xfs/libxfs/xfs_alloc.h                          |    4 +-
 fs/xfs/libxfs/xfs_attr.c                           |  190 +-
 fs/xfs/libxfs/xfs_attr_leaf.c                      |   40 +-
 fs/xfs/libxfs/xfs_attr_leaf.h                      |    2 +-
 fs/xfs/libxfs/xfs_bmap.c                           |  140 +-
 fs/xfs/libxfs/xfs_da_btree.c                       |    5 +-
 fs/xfs/scrub/bmap_repair.c                         |    2 +-
 fs/xfs/scrub/ialloc_repair.c                       |    4 +-
 fs/xfs/scrub/repair.c                              |    8 +-
 fs/xfs/xfs_aops.c                                  |    4 +-
 fs/xfs/xfs_bmap_util.c                             |   10 +-
 fs/xfs/xfs_bmap_util.h                             |    2 +-
 fs/xfs/xfs_buf_item_recover.c                      |   70 +
 fs/xfs/xfs_file.c                                  |  146 +-
 fs/xfs/xfs_filestream.c                            |   99 +-
 fs/xfs/xfs_fsops.c                                 |   20 +-
 fs/xfs/xfs_icache.c                                |   37 +-
 fs/xfs/xfs_inode.c                                 |    2 +-
 fs/xfs/xfs_inode.h                                 |    5 +
 fs/xfs/xfs_ioctl.c                                 |    4 +-
 fs/xfs/xfs_iomap.c                                 |   69 +-
 fs/xfs/xfs_log.h                                   |    2 -
 fs/xfs/xfs_log_cil.c                               |   11 +-
 fs/xfs/xfs_log_recover.c                           |    9 +-
 fs/xfs/xfs_mount.c                                 |    9 +-
 fs/xfs/xfs_reflink.c                               |    3 +
 fs/xfs/xfs_reflink.h                               |   19 +
 fs/xfs/xfs_trace.h                                 |   15 +-
 include/acpi/cppc_acpi.h                           |    2 +-
 include/acpi/processor.h                           |    2 +
 include/drm/drm_kunit_helpers.h                    |    4 +
 include/linux/alloc_tag.h                          |   16 +-
 include/linux/arch_topology.h                      |    4 -
 include/linux/arm-smccc.h                          |   32 +-
 include/linux/backing-file.h                       |    2 +-
 include/linux/bpf.h                                |   14 +-
 include/linux/bpf_mem_alloc.h                      |    3 +
 include/linux/bpf_types.h                          |    1 +
 include/linux/closure.h                            |   35 +
 include/linux/compiler-gcc.h                       |    4 +
 include/linux/device.h                             |    3 +
 include/linux/fs.h                                 |    7 +-
 include/linux/fs_context.h                         |    6 +
 include/linux/fsl/enetc_mdio.h                     |    3 +-
 include/linux/host1x.h                             |    1 +
 include/linux/huge_mm.h                            |   18 +
 include/linux/input.h                              |   10 +-
 include/linux/iomap.h                              |   39 +-
 include/linux/irqchip/arm-gic-v4.h                 |    4 +-
 include/linux/ksm.h                                |   10 +-
 include/linux/kvm_host.h                           |    2 -
 include/linux/mm.h                                 |    3 +-
 include/linux/mman.h                               |   28 +-
 include/linux/mmzone.h                             |    8 +-
 include/linux/netdevice.h                          |   12 +
 include/linux/nfs_fs_sb.h                          |    1 +
 include/linux/nfslocalio.h                         |   18 +-
 include/linux/page-flags.h                         |    8 +
 include/linux/percpu.h                             |    6 +-
 include/linux/sched.h                              |    9 +-
 include/linux/sched/mm.h                           |   17 +-
 include/linux/security.h                           |    4 +-
 include/linux/soc/qcom/geni-se.h                   |    2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |    2 +
 include/linux/soundwire/sdw.h                      |    9 +-
 include/linux/soundwire/sdw_amd.h                  |    7 +-
 include/linux/soundwire/sdw_intel.h                |   10 +-
 include/linux/swap.h                               |    1 +
 include/linux/task_work.h                          |    5 +-
 include/linux/tick.h                               |    8 +
 include/linux/uaccess.h                            |   21 +-
 include/linux/user_namespace.h                     |    3 +-
 include/linux/userfaultfd_k.h                      |    5 +
 include/net/bluetooth/bluetooth.h                  |    1 +
 include/net/cfg80211.h                             |   44 +
 include/net/genetlink.h                            |    3 +-
 include/net/ieee80211_radiotap.h                   |   43 +-
 include/net/ip_tunnels.h                           |    2 +-
 include/net/mctp.h                                 |    2 +-
 include/net/netfilter/nf_tables.h                  |    4 +
 include/net/netns/xfrm.h                           |    1 -
 include/net/rtnetlink.h                            |   17 +
 include/net/sch_generic.h                          |    1 -
 include/net/sock.h                                 |    7 +
 include/net/xfrm.h                                 |   28 +-
 include/sound/adau1373.h                           |   33 -
 include/sound/hda-mlink.h                          |    4 +
 include/sound/sdca.h                               |   62 +
 include/sound/sdca_function.h                      |   55 +
 include/sound/soc-acpi.h                           |    8 +-
 include/sound/soc-dai.h                            |   11 +-
 include/sound/soc.h                                |   26 +-
 include/sound/soc_sdw_utils.h                      |   10 +-
 include/sound/sof/ext_manifest.h                   |    1 +
 include/trace/events/afs.h                         |    7 +-
 include/trace/events/dma.h                         |   16 +-
 include/trace/events/huge_memory.h                 |    4 +-
 include/trace/events/netfs.h                       |    1 -
 include/trace/events/rxrpc.h                       |    1 +
 include/uapi/linux/bpf.h                           |   16 +-
 include/uapi/linux/ublk_cmd.h                      |    8 +-
 include/video/da8xx-fb.h                           |   94 -
 include/xen/acpi.h                                 |   14 +-
 init/Kconfig                                       |    8 +-
 io_uring/io_uring.h                                |   10 +-
 io_uring/rsrc.c                                    |    3 +-
 io_uring/rw.c                                      |   67 +-
 kernel/bpf/bpf_lsm.c                               |    4 -
 kernel/bpf/btf.c                                   |   15 +-
 kernel/bpf/cgroup.c                                |   19 +-
 kernel/bpf/devmap.c                                |   11 +-
 kernel/bpf/helpers.c                               |   64 +-
 kernel/bpf/inode.c                                 |    5 +-
 kernel/bpf/log.c                                   |    3 +-
 kernel/bpf/lpm_trie.c                              |    2 +-
 kernel/bpf/memalloc.c                              |   14 +-
 kernel/bpf/ringbuf.c                               |   14 +-
 kernel/bpf/syscall.c                               |   45 +-
 kernel/bpf/task_iter.c                             |    2 +-
 kernel/bpf/verifier.c                              |  134 +-
 kernel/cgroup/cgroup.c                             |    4 +-
 kernel/events/core.c                               |    4 +-
 kernel/fork.c                                      |   14 +-
 kernel/freezer.c                                   |    7 +-
 kernel/irq/msi.c                                   |    2 +-
 kernel/kthread.c                                   |    2 +
 kernel/rcu/tasks.h                                 |    9 +
 kernel/rcu/tree_nocb.h                             |    8 +-
 kernel/resource.c                                  |    4 +-
 kernel/resource_kunit.c                            |   18 +-
 kernel/sched/core.c                                |   84 +-
 kernel/sched/deadline.c                            |    2 +-
 kernel/sched/ext.c                                 |  265 +-
 kernel/sched/ext.h                                 |    2 +-
 kernel/sched/fair.c                                |   52 +-
 kernel/sched/sched.h                               |   39 +-
 kernel/sched/stats.h                               |   48 +-
 kernel/sched/syscalls.c                            |   13 +-
 kernel/signal.c                                    |    3 +-
 kernel/task_work.c                                 |   15 +-
 kernel/time/posix-clock.c                          |    3 +
 kernel/time/tick-sched.c                           |    6 +
 kernel/trace/bpf_trace.c                           |   42 +-
 kernel/trace/fgraph.c                              |   41 +-
 kernel/trace/ring_buffer.c                         |   53 +-
 kernel/trace/trace.c                               |   10 +-
 kernel/trace/trace_eprobe.c                        |    7 +-
 kernel/trace/trace_fprobe.c                        |    6 +-
 kernel/trace/trace_kprobe.c                        |    6 +-
 kernel/trace/trace_probe.c                         |    2 +-
 kernel/trace/trace_selftest.c                      |    2 +-
 kernel/trace/trace_uprobe.c                        |   13 +-
 kernel/ucount.c                                    |    9 +-
 lib/Kconfig.debug                                  |    2 +-
 lib/buildid.c                                      |    5 +
 lib/codetag.c                                      |    3 +
 lib/crypto/mpi/mpi-mul.c                           |    2 +-
 lib/iov_iter.c                                     |   25 +-
 lib/maple_tree.c                                   |   14 +-
 lib/objpool.c                                      |   18 +-
 lib/slub_kunit.c                                   |    2 +-
 mm/Kconfig                                         |    1 -
 mm/damon/core.c                                    |   42 +-
 mm/damon/tests/sysfs-kunit.h                       |    1 +
 mm/filemap.c                                       |    2 +-
 mm/gup.c                                           |   33 +-
 mm/huge_memory.c                                   |   71 +-
 mm/internal.h                                      |   55 +-
 mm/kasan/init.c                                    |    8 +-
 mm/kasan/kasan_test_c.c                            |   27 -
 mm/khugepaged.c                                    |    6 +-
 mm/memcontrol-v1.c                                 |   25 +
 mm/memcontrol.c                                    |    9 +-
 mm/memory.c                                        |   32 +-
 mm/migrate.c                                       |    9 +-
 mm/mlock.c                                         |    9 +-
 mm/mmap.c                                          |  229 +-
 mm/mprotect.c                                      |    2 +-
 mm/mremap.c                                        |   11 +-
 mm/nommu.c                                         |    9 +-
 mm/numa_memblks.c                                  |    2 +-
 mm/page_alloc.c                                    |   26 +-
 mm/page_io.c                                       |    4 +-
 mm/pagewalk.c                                      |   16 +-
 mm/rmap.c                                          |    9 +-
 mm/secretmem.c                                     |    4 +-
 mm/shmem.c                                         |   12 +-
 mm/shrinker.c                                      |    8 +-
 mm/slab_common.c                                   |   33 +-
 mm/sparse-vmemmap.c                                |    5 +
 mm/swap.c                                          |    4 +-
 mm/swapfile.c                                      |   58 +-
 mm/vma.c                                           |   37 +-
 mm/vma.h                                           |   32 +-
 mm/vmscan.c                                        |  110 +-
 mm/zswap.c                                         |    1 -
 net/9p/Kconfig                                     |    2 +
 net/9p/client.c                                    |   12 +-
 net/bluetooth/af_bluetooth.c                       |   25 +
 net/bluetooth/bnep/core.c                          |    3 +-
 net/bluetooth/hci_conn.c                           |    3 +
 net/bluetooth/hci_core.c                           |   24 +-
 net/bluetooth/hci_sync.c                           |   30 +-
 net/bluetooth/iso.c                                |   24 +-
 net/bluetooth/rfcomm/sock.c                        |    2 -
 net/bluetooth/sco.c                                |   18 +-
 net/bpf/test_run.c                                 |    1 +
 net/bridge/br_netfilter_hooks.c                    |    5 +
 net/bridge/br_netlink.c                            |    6 +-
 net/bridge/br_private.h                            |    5 +-
 net/bridge/br_vlan.c                               |   19 +-
 net/core/dev.c                                     |    4 +
 net/core/dst.c                                     |   17 +-
 net/core/filter.c                                  |   50 +-
 net/core/rtnetlink.c                               |   33 +-
 net/core/sock_map.c                                |   12 +
 net/dsa/user.c                                     |   11 +-
 net/ipv4/devinet.c                                 |   35 +-
 net/ipv4/inet_connection_sock.c                    |   21 +-
 net/ipv4/ip_tunnel.c                               |    2 +-
 net/ipv4/netfilter/nft_fib_ipv4.c                  |    4 +-
 net/ipv4/tcp_bpf.c                                 |    7 +-
 net/ipv4/tcp_input.c                               |   42 +-
 net/ipv4/tcp_output.c                              |    5 +-
 net/ipv4/udp.c                                     |    4 +-
 net/ipv4/xfrm4_policy.c                            |   40 +-
 net/ipv6/netfilter/nf_reject_ipv6.c                |   15 +-
 net/ipv6/netfilter/nft_fib_ipv6.c                  |    5 +-
 net/ipv6/udp.c                                     |    4 +-
 net/ipv6/xfrm6_policy.c                            |   31 +-
 net/l2tp/l2tp_netlink.c                            |    4 +-
 net/mac80211/Kconfig                               |    2 +-
 net/mac80211/cfg.c                                 |   25 +-
 net/mac80211/ieee80211_i.h                         |   10 +-
 net/mac80211/key.c                                 |   42 +-
 net/mac80211/link.c                                |    7 +-
 net/mac80211/main.c                                |    2 +
 net/mctp/af_mctp.c                                 |    6 +-
 net/mctp/device.c                                  |   30 +-
 net/mctp/neigh.c                                   |   31 +-
 net/mctp/route.c                                   |   33 +-
 net/mpls/af_mpls.c                                 |   32 +-
 net/mptcp/mib.c                                    |    3 +
 net/mptcp/mib.h                                    |    3 +
 net/mptcp/mptcp_pm_gen.c                           |    1 -
 net/mptcp/pm_netlink.c                             |    6 +-
 net/mptcp/pm_userspace.c                           |    3 +-
 net/mptcp/protocol.c                               |   26 +-
 net/mptcp/protocol.h                               |    1 +
 net/mptcp/subflow.c                                |   17 +-
 net/netfilter/nf_bpf_link.c                        |    7 +-
 net/netfilter/nf_tables_api.c                      |   41 +-
 net/netfilter/nft_payload.c                        |    3 +
 net/netfilter/x_tables.c                           |    2 +-
 net/netfilter/xt_CHECKSUM.c                        |   33 +-
 net/netfilter/xt_CLASSIFY.c                        |   16 +-
 net/netfilter/xt_CONNSECMARK.c                     |   36 +-
 net/netfilter/xt_CT.c                              |  106 +-
 net/netfilter/xt_IDLETIMER.c                       |   59 +-
 net/netfilter/xt_LED.c                             |   39 +-
 net/netfilter/xt_NFLOG.c                           |   36 +-
 net/netfilter/xt_RATEEST.c                         |   39 +-
 net/netfilter/xt_SECMARK.c                         |   27 +-
 net/netfilter/xt_TRACE.c                           |   36 +-
 net/netfilter/xt_addrtype.c                        |   15 +-
 net/netfilter/xt_cluster.c                         |   33 +-
 net/netfilter/xt_connbytes.c                       |    4 +-
 net/netfilter/xt_connlimit.c                       |   39 +-
 net/netfilter/xt_connmark.c                        |   28 +-
 net/netfilter/xt_mark.c                            |   42 +-
 net/netlink/af_netlink.c                           |    3 +-
 net/netlink/genetlink.c                            |   28 +-
 net/phonet/pn_netlink.c                            |   28 +-
 net/rxrpc/ar-internal.h                            |    2 +-
 net/rxrpc/conn_client.c                            |    4 +
 net/rxrpc/io_thread.c                              |   10 +-
 net/rxrpc/local_object.c                           |    2 +-
 net/rxrpc/sendmsg.c                                |   10 +-
 net/sched/act_api.c                                |   23 +-
 net/sched/cls_api.c                                |    1 +
 net/sched/sch_api.c                                |    9 +-
 net/sched/sch_generic.c                            |    8 +-
 net/sched/sch_taprio.c                             |   21 +-
 net/sctp/sm_statefuns.c                            |    2 +-
 net/sctp/socket.c                                  |   18 +-
 net/smc/af_smc.c                                   |    4 +-
 net/smc/smc_ib.c                                   |    8 +-
 net/smc/smc_inet.c                                 |   11 +
 net/smc/smc_pnet.c                                 |    6 +-
 net/smc/smc_wr.c                                   |    6 +-
 net/socket.c                                       |    7 +-
 net/sunrpc/svc.c                                   |   11 +-
 net/sunrpc/xprtrdma/ib_client.c                    |    1 +
 net/sunrpc/xprtsock.c                              |    1 +
 net/vmw_vsock/virtio_transport.c                   |    8 +-
 net/vmw_vsock/virtio_transport_common.c            |   14 +-
 net/vmw_vsock/vsock_bpf.c                          |    8 -
 net/wireless/core.c                                |    8 +
 net/wireless/nl80211.c                             |    8 +-
 net/wireless/scan.c                                |    4 +
 net/xfrm/xfrm_device.c                             |   11 +-
 net/xfrm/xfrm_policy.c                             |   53 +-
 net/xfrm/xfrm_user.c                               |   10 +-
 rust/kernel/device.rs                              |   15 +-
 rust/kernel/firmware.rs                            |    2 +-
 scripts/Kconfig.include                            |    3 +
 scripts/Makefile.compiler                          |   14 +-
 scripts/Makefile.package                           |    7 +-
 scripts/kconfig/menu.c                             |   13 +-
 scripts/mod/file2alias.c                           |   12 +-
 scripts/mod/sumversion.c                           |    5 +-
 scripts/package/builddeb                           |    2 +-
 scripts/package/install-extmod-build               |    6 +-
 scripts/package/mkdebian                           |   10 +-
 scripts/rustc-llvm-version.sh                      |   22 +
 security/ipe/Kconfig                               |   19 +
 security/ipe/policy.c                              |   18 +-
 security/keys/keyring.c                            |    7 +-
 security/keys/trusted-keys/trusted_dcp.c           |    9 +-
 security/security.c                                |   10 +-
 sound/Kconfig                                      |    2 +-
 sound/core/ump.c                                   |    2 +-
 sound/firewire/amdtp-stream.c                      |    3 +
 sound/firewire/tascam/amdtp-tascam.c               |    2 +-
 sound/hda/intel-sdw-acpi.c                         |   33 +-
 sound/pci/hda/Kconfig                              |    2 +-
 sound/pci/hda/patch_conexant.c                     |   21 +-
 sound/pci/hda/patch_cs8409.c                       |    5 +-
 sound/pci/hda/patch_realtek.c                      |  162 +-
 sound/soc/Kconfig                                  |    3 +-
 sound/soc/Makefile                                 |    3 +-
 sound/soc/amd/acp-da7219-max98357a.c               |   20 +-
 sound/soc/amd/acp-es8336.c                         |    2 -
 sound/soc/amd/acp/Kconfig                          |   29 +
 sound/soc/amd/acp/Makefile                         |    4 +
 sound/soc/amd/acp/acp-i2s.c                        |   38 +-
 sound/soc/amd/acp/acp-legacy-common.c              |   24 +-
 sound/soc/amd/acp/acp-legacy-mach.c                |    8 +-
 sound/soc/amd/acp/acp-mach-common.c                |   63 +-
 sound/soc/amd/acp/acp-mach.h                       |   12 +-
 sound/soc/amd/acp/acp-pci.c                        |    7 +-
 sound/soc/amd/acp/acp-pdm.c                        |    2 +-
 sound/soc/amd/acp/acp-platform.c                   |   18 +-
 sound/soc/amd/acp/acp-rembrandt.c                  |    4 +-
 sound/soc/amd/acp/acp-renoir.c                     |    4 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |  486 ++
 sound/soc/amd/acp/acp-sdw-mach-common.c            |   64 +
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |  104 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |    6 +-
 sound/soc/amd/acp/acp63.c                          |    4 +-
 sound/soc/amd/acp/acp70.c                          |   14 +-
 sound/soc/amd/acp/acp_common.h                     |   19 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c           |   54 +
 sound/soc/amd/acp/amd.h                            |    9 +-
 sound/soc/amd/acp/soc_amd_sdw_common.h             |    4 +
 sound/soc/amd/acp3x-rt5682-max9836.c               |    6 +-
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/amd/ps/pci-ps.c                          |    4 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    2 +
 sound/soc/amd/vangogh/acp5x-mach.c                 |    6 -
 sound/soc/atmel/atmel_ssc_dai.c                    |    5 +-
 sound/soc/atmel/mchp-spdifrx.c                     |    2 +-
 sound/soc/atmel/mchp-spdiftx.c                     |    2 +-
 sound/soc/au1x/dbdma2.c                            |    2 +-
 sound/soc/au1x/dma.c                               |    2 +-
 sound/soc/bcm/bcm2835-i2s.c                        |    2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |    6 +-
 sound/soc/bcm/cygnus-pcm.c                         |    2 +-
 sound/soc/codecs/Kconfig                           |   69 +-
 sound/soc/codecs/Makefile                          |   20 +
 sound/soc/codecs/adau1372-i2c.c                    |    1 +
 sound/soc/codecs/adau1372-spi.c                    |    1 +
 sound/soc/codecs/adau1372.c                        |    8 +
 sound/soc/codecs/adau1372.h                        |    1 +
 sound/soc/codecs/adau1373.c                        |  200 +-
 sound/soc/codecs/aw88081.c                         | 1087 ++++
 sound/soc/codecs/aw88081.h                         |  286 +
 sound/soc/codecs/aw88395/aw88395_device.c          |    2 +-
 sound/soc/codecs/aw88395/aw88395_lib.c             |    2 +-
 sound/soc/codecs/aw88399.c                         |    2 +-
 sound/soc/codecs/cpcap.c                           |    2 +-
 sound/soc/codecs/cs42l84.c                         | 1111 ++++
 sound/soc/codecs/cs42l84.h                         |  210 +
 sound/soc/codecs/da7213.c                          |   27 +-
 sound/soc/codecs/da7213.h                          |    1 +
 sound/soc/codecs/da7219.c                          |    9 +-
 sound/soc/codecs/es8323.c                          |  792 +++
 sound/soc/codecs/es8323.h                          |   78 +
 sound/soc/codecs/es8326.c                          |   20 +-
 sound/soc/codecs/hdmi-codec.c                      |  140 +-
 sound/soc/codecs/max98088.c                        |   86 +-
 sound/soc/codecs/nau8821.c                         |    9 +-
 sound/soc/codecs/ntp8835.c                         |  480 ++
 sound/soc/codecs/ntp8918.c                         |  397 ++
 sound/soc/codecs/ntpfw.c                           |  137 +
 sound/soc/codecs/ntpfw.h                           |   23 +
 sound/soc/codecs/pcm186x.c                         |    4 +-
 sound/soc/codecs/pcm5102a.c                        |    2 +-
 sound/soc/codecs/rt-sdw-common.c                   |  238 +
 sound/soc/codecs/rt-sdw-common.h                   |   66 +
 sound/soc/codecs/rt1320-sdw.c                      | 3668 ++---------
 sound/soc/codecs/rt1320-sdw.h                      |    6 +
 sound/soc/codecs/rt712-sdca-sdw.c                  |    1 +
 sound/soc/codecs/rt712-sdca.c                      |   38 +-
 sound/soc/codecs/rt712-sdca.h                      |    1 +
 sound/soc/codecs/rt721-sdca-sdw.c                  |  546 ++
 sound/soc/codecs/rt721-sdca-sdw.h                  |  150 +
 sound/soc/codecs/rt721-sdca.c                      | 1545 +++++
 sound/soc/codecs/rt721-sdca.h                      |  269 +
 sound/soc/codecs/rt722-sdca-sdw.c                  |   12 +-
 sound/soc/codecs/rt722-sdca.c                      |   15 +-
 sound/soc/codecs/simple-mux.c                      |   39 +-
 sound/soc/codecs/sma1307.c                         | 2049 ++++++
 sound/soc/codecs/sma1307.h                         |  444 ++
 sound/soc/codecs/spdif_receiver.c                  |    2 +-
 sound/soc/codecs/spdif_transmitter.c               |    2 +-
 sound/soc/codecs/tas2781-i2c.c                     |   35 +-
 sound/soc/codecs/tas5805m.c                        |    2 +-
 sound/soc/codecs/tas6424.c                         |    2 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    2 +-
 sound/soc/codecs/twl4030.c                         |   12 +-
 sound/soc/codecs/uda1342.c                         |  347 +
 sound/soc/codecs/uda1342.h                         |   78 +
 sound/soc/codecs/wcd9335.c                         |    1 -
 sound/soc/codecs/wcd937x.c                         |    1 -
 sound/soc/fsl/Kconfig                              |    1 +
 sound/soc/fsl/fsl-asoc-card.c                      |   32 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    2 +-
 sound/soc/fsl/fsl_easrc.c                          |    2 +-
 sound/soc/fsl/fsl_micfil.c                         |   51 +-
 sound/soc/fsl/fsl_mqs.c                            |   41 +
 sound/soc/fsl/fsl_qmc_audio.c                      |    2 -
 sound/soc/fsl/fsl_xcvr.c                           |   94 +-
 sound/soc/fsl/fsl_xcvr.h                           |    5 +
 sound/soc/fsl/imx-audmix.c                         |   18 +-
 sound/soc/fsl/imx-card.c                           |   69 +-
 sound/soc/generic/audio-graph-card2.c              |    2 +-
 sound/soc/generic/simple-card-utils.c              |   16 +-
 sound/soc/generic/test-component.c                 |    2 +-
 sound/soc/intel/Kconfig                            |    8 +-
 sound/soc/intel/avs/boards/da7219.c                |    2 -
 sound/soc/intel/avs/boards/dmic.c                  |    4 +-
 sound/soc/intel/avs/boards/es8336.c                |    2 -
 sound/soc/intel/avs/boards/hdaudio.c               |    4 -
 sound/soc/intel/avs/boards/i2s_test.c              |    2 -
 sound/soc/intel/avs/boards/max98357a.c             |    2 +-
 sound/soc/intel/avs/boards/max98373.c              |    2 -
 sound/soc/intel/avs/boards/max98927.c              |    2 -
 sound/soc/intel/avs/boards/nau8825.c               |    2 -
 sound/soc/intel/avs/boards/rt274.c                 |    2 -
 sound/soc/intel/avs/boards/rt286.c                 |    2 -
 sound/soc/intel/avs/boards/rt298.c                 |    2 -
 sound/soc/intel/avs/boards/rt5514.c                |    2 +-
 sound/soc/intel/avs/boards/rt5663.c                |    2 -
 sound/soc/intel/avs/boards/rt5682.c                |    2 -
 sound/soc/intel/avs/boards/ssm4567.c               |    2 -
 sound/soc/intel/avs/pcm.c                          |    2 +-
 sound/soc/intel/boards/Kconfig                     |    1 +
 sound/soc/intel/boards/bdw-rt5650.c                |    4 -
 sound/soc/intel/boards/bdw-rt5677.c                |    4 -
 sound/soc/intel/boards/bdw_rt286.c                 |   10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    6 +-
 sound/soc/intel/boards/bytcht_da7213.c             |    6 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    6 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |    6 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    6 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    6 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    6 +-
 sound/soc/intel/boards/ehl_rt5660.c                |   14 +-
 sound/soc/intel/boards/hsw_rt5640.c                |   10 +-
 sound/soc/intel/boards/sof_board_helpers.c         |   15 +-
 sound/soc/intel/boards/sof_es8336.c                |    8 +-
 sound/soc/intel/boards/sof_pcm512x.c               |    9 +-
 sound/soc/intel/boards/sof_rt5682.c                |   15 +
 sound/soc/intel/boards/sof_sdw.c                   |  117 +-
 sound/soc/intel/boards/sof_wm8804.c                |    2 -
 sound/soc/intel/common/Makefile                    |    6 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   63 +
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   65 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   58 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |   75 +-
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  |   42 +
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |   14 +
 sound/soc/intel/common/sst-dsp-priv.h              |  101 -
 sound/soc/intel/common/sst-dsp.c                   |  250 -
 sound/soc/intel/common/sst-dsp.h                   |   61 -
 sound/soc/intel/common/sst-ipc.c                   |  294 -
 sound/soc/intel/common/sst-ipc.h                   |   86 -
 sound/soc/loongson/Kconfig                         |   32 +-
 sound/soc/loongson/Makefile                        |    9 +-
 sound/soc/loongson/loongson_i2s.c                  |    5 +
 sound/soc/loongson/loongson_i2s_plat.c             |  185 +
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |   20 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |    6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c          |   24 +-
 sound/soc/mediatek/mt7986/mt7986-wm8960.c          |    6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |    6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |    6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   10 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   34 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |    7 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   34 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c          |   86 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c        |    1 -
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c        |    5 +-
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c         |    2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |   58 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   78 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c         |    2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |   60 +-
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |    6 +-
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |    2 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |   14 +-
 sound/soc/meson/axg-card.c                         |    6 +-
 sound/soc/meson/axg-tdm-interface.c                |   12 +-
 sound/soc/meson/axg-tdm.h                          |    2 -
 sound/soc/meson/gx-card.c                          |    2 +-
 sound/soc/qcom/sc8280xp.c                          |    1 +
 sound/soc/qcom/sm8250.c                            |   12 +-
 sound/soc/qcom/x1e80100.c                          |   40 +-
 sound/soc/{sh => renesas}/Kconfig                  |    0
 sound/soc/{sh => renesas}/Makefile                 |    0
 sound/soc/{sh => renesas}/dma-sh7760.c             |    0
 sound/soc/{sh => renesas}/fsi.c                    |    0
 sound/soc/{sh => renesas}/hac.c                    |    0
 sound/soc/{sh => renesas}/migor.c                  |    0
 sound/soc/{sh => renesas}/rcar/Makefile            |    0
 sound/soc/{sh => renesas}/rcar/adg.c               |    0
 sound/soc/{sh => renesas}/rcar/cmd.c               |    0
 sound/soc/{sh => renesas}/rcar/core.c              |   32 +-
 sound/soc/{sh => renesas}/rcar/ctu.c               |    0
 sound/soc/{sh => renesas}/rcar/debugfs.c           |    0
 sound/soc/{sh => renesas}/rcar/dma.c               |    0
 sound/soc/{sh => renesas}/rcar/dvc.c               |    0
 sound/soc/{sh => renesas}/rcar/gen.c               |    0
 sound/soc/{sh => renesas}/rcar/mix.c               |    0
 sound/soc/{sh => renesas}/rcar/rsnd.h              |    0
 sound/soc/{sh => renesas}/rcar/src.c               |    0
 sound/soc/{sh => renesas}/rcar/ssi.c               |    0
 sound/soc/{sh => renesas}/rcar/ssiu.c              |    0
 sound/soc/{sh => renesas}/rz-ssi.c                 |    6 +-
 sound/soc/{sh => renesas}/sh7760-ac97.c            |    0
 sound/soc/{sh => renesas}/siu.h                    |    0
 sound/soc/{sh => renesas}/siu_dai.c                |    0
 sound/soc/{sh => renesas}/siu_pcm.c                |    0
 sound/soc/{sh => renesas}/ssi.c                    |    0
 sound/soc/samsung/odroid.c                         |   11 +-
 sound/soc/sdca/Kconfig                             |   11 +
 sound/soc/sdca/Makefile                            |    5 +
 sound/soc/sdca/sdca_device.c                       |   67 +
 sound/soc/sdca/sdca_functions.c                    |  177 +
 sound/soc/sdw_utils/Makefile                       |    3 +-
 sound/soc/sdw_utils/soc_sdw_rt712_sdca.c           |   48 -
 sound/soc/sdw_utils/soc_sdw_rt722_sdca.c           |   41 -
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c           |   90 +
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c  |    8 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   80 +-
 sound/soc/soc-acpi.c                               |   30 +-
 sound/soc/soc-component.c                          |   14 +-
 sound/soc/soc-compress.c                           |   28 +-
 sound/soc/soc-core.c                               |   70 +-
 sound/soc/soc-dai.c                                |   14 +-
 sound/soc/soc-devres.c                             |   37 -
 sound/soc/soc-link.c                               |   10 +-
 sound/soc/soc-pcm.c                                |  152 +-
 sound/soc/soc-topology-test.c                      |    2 -
 sound/soc/soc-topology.c                           |    4 +-
 sound/soc/soc-utils.c                              |    4 +-
 sound/soc/sof/amd/acp-common.c                     |    3 +-
 sound/soc/sof/core.c                               |   64 +
 sound/soc/sof/intel/hda-dai.c                      |    4 +
 sound/soc/sof/intel/hda-dsp.c                      |    5 -
 sound/soc/sof/intel/hda-loader.c                   |  100 +-
 sound/soc/sof/intel/hda-mlink.c                    |   18 +
 sound/soc/sof/intel/hda-stream.c                   |   32 +-
 sound/soc/sof/intel/hda.c                          |   27 +-
 sound/soc/sof/intel/hda.h                          |   14 +-
 sound/soc/sof/intel/lnl.c                          |   10 -
 sound/soc/sof/ipc3-loader.c                        |    3 +
 sound/soc/sof/ipc3.c                               |    2 +-
 sound/soc/sof/ipc4-pcm.c                           |    3 +
 sound/soc/sof/ipc4-topology.c                      |  376 +-
 sound/soc/sof/nocodec.c                            |    7 +-
 sound/soc/sof/sof-acpi-dev.c                       |    4 +-
 sound/soc/sof/sof-of-dev.c                         |   14 +-
 sound/soc/sof/sof-pci-dev.c                        |   12 +-
 sound/soc/stm/stm32_adfsdm.c                       |    4 +-
 sound/soc/stm/stm32_i2s.c                          |  211 +-
 sound/soc/stm/stm32_sai.c                          |   58 +-
 sound/soc/stm/stm32_sai.h                          |    6 +
 sound/soc/stm/stm32_sai_sub.c                      |  146 +-
 sound/soc/sunxi/sun4i-codec.c                      |  298 +-
 sound/soc/tegra/tegra186_dspk.c                    |    3 +
 sound/soc/tegra/tegra210_admaif.c                  |   11 +-
 sound/soc/tegra/tegra210_adx.c                     |    9 +-
 sound/soc/tegra/tegra210_amx.c                     |    9 +-
 sound/soc/tegra/tegra210_dmic.c                    |    7 +-
 sound/soc/tegra/tegra210_i2s.c                     |   14 +-
 sound/soc/tegra/tegra210_i2s.h                     |    9 +-
 sound/soc/tegra/tegra210_mixer.c                   |    9 +-
 sound/soc/tegra/tegra210_mvc.c                     |    9 +-
 sound/soc/tegra/tegra210_ope.c                     |    9 +-
 sound/soc/tegra/tegra210_sfc.c                     |    9 +-
 sound/soc/ti/rx51.c                                |   12 +-
 sound/soc/uniphier/aio-core.c                      |   25 +-
 sound/soc/uniphier/evea.c                          |    2 +-
 sound/soc/ux500/ux500_msp_dai.c                    |    6 +-
 sound/usb/line6/capture.c                          |    2 +-
 sound/usb/line6/capture.h                          |    2 +-
 sound/usb/line6/driver.c                           |    4 +-
 sound/usb/line6/driver.h                           |    2 +-
 sound/usb/line6/midi.c                             |    2 +-
 sound/usb/line6/midi.h                             |    2 +-
 sound/usb/line6/midibuf.c                          |    2 +-
 sound/usb/line6/midibuf.h                          |    2 +-
 sound/usb/line6/pcm.c                              |    2 +-
 sound/usb/line6/pcm.h                              |    2 +-
 sound/usb/line6/playback.c                         |    2 +-
 sound/usb/line6/playback.h                         |    2 +-
 sound/usb/line6/pod.c                              |    2 +-
 sound/usb/line6/toneport.c                         |    2 +-
 sound/usb/line6/variax.c                           |    2 +-
 sound/usb/mixer.c                                  |    1 +
 sound/usb/mixer_quirks.c                           |    3 +
 sound/usb/mixer_scarlett2.c                        |    2 +
 sound/usb/quirks.c                                 |    2 +
 sound/usb/stream.c                                 |    1 +
 tools/arch/arm64/include/asm/cputype.h             |    4 +
 tools/arch/arm64/vdso                              |    1 -
 tools/arch/loongarch/vdso                          |    1 -
 tools/arch/powerpc/vdso                            |    1 -
 tools/arch/s390/vdso                               |    1 -
 tools/arch/x86/include/asm/msr-index.h             |   36 +-
 tools/arch/x86/include/uapi/asm/kvm.h              |    1 +
 tools/arch/x86/include/uapi/asm/unistd_32.h        |    3 +
 tools/arch/x86/include/uapi/asm/unistd_64.h        |    3 +
 tools/arch/x86/vdso                                |    1 -
 tools/build/feature/Makefile                       |    5 +-
 tools/include/linux/bits.h                         |   15 +
 tools/include/linux/unaligned.h                    |   11 +-
 tools/include/uapi/linux/bits.h                    |    3 +
 tools/include/uapi/linux/bpf.h                     |   25 +-
 tools/include/uapi/linux/const.h                   |   17 +
 tools/include/uapi/linux/in.h                      |    2 +-
 tools/include/vdso/unaligned.h                     |   15 +
 tools/lib/thermal/Makefile                         |    4 +-
 tools/lib/thermal/sampling.c                       |    2 +
 tools/mm/page-types.c                              |    9 +-
 tools/mm/slabinfo.c                                |    4 +-
 tools/perf/Makefile.config                         |   11 +-
 tools/perf/builtin-trace.c                         |    2 +-
 .../perf/check-header_ignore_hunks/lib/list_sort.c |   31 +
 tools/perf/check-headers.sh                        |   30 +-
 .../shell/base_probe/test_adding_blacklisted.sh    |   69 +-
 .../beauty/arch/x86/include/asm/irq_vectors.h      |    4 +-
 tools/perf/trace/beauty/fs_at_flags.sh             |    5 +
 tools/perf/trace/beauty/include/linux/socket.h     |    1 +
 tools/perf/trace/beauty/include/uapi/linux/fcntl.h |   84 +-
 tools/perf/trace/beauty/include/uapi/linux/sched.h |    1 +
 .../perf/trace/beauty/include/uapi/sound/asound.h  |   17 +-
 tools/perf/trace/beauty/msg_flags.c                |    4 +
 .../util/bpf_skel/augmented_raw_syscalls.bpf.c     |   22 +-
 tools/perf/util/cap.c                              |   10 +-
 tools/perf/util/cs-etm.c                           |    2 +-
 tools/perf/util/dwarf-aux.h                        |    1 +
 tools/perf/util/python.c                           |    3 +
 tools/perf/util/symbol.c                           |    3 +
 tools/perf/util/syscalltbl.c                       |   10 +
 tools/perf/util/vdso.c                             |    4 +-
 tools/sched_ext/include/scx/common.bpf.h           |    8 +-
 tools/sched_ext/scx_qmap.bpf.c                     |    4 +-
 tools/testing/cxl/test/cxl.c                       |  200 +-
 tools/testing/cxl/test/mem.c                       |    1 +
 tools/testing/radix-tree/maple.c                   |  110 +
 tools/testing/selftests/Makefile                   |    9 +-
 tools/testing/selftests/bpf/Makefile               |   22 +-
 .../selftests/bpf/bpf_test_modorder_x/Makefile     |   19 +
 .../bpf/bpf_test_modorder_x/bpf_test_modorder_x.c  |   39 +
 .../selftests/bpf/bpf_test_modorder_y/Makefile     |   19 +
 .../bpf/bpf_test_modorder_y/bpf_test_modorder_y.c  |   39 +
 .../bpf/map_tests/lpm_trie_map_get_next_key.c      |  109 +
 tools/testing/selftests/bpf/prog_tests/bpf_iter.c  |   27 +-
 .../selftests/bpf/prog_tests/cgroup_ancestor.c     |    2 +-
 tools/testing/selftests/bpf/prog_tests/cpumask.c   |    1 +
 .../selftests/bpf/prog_tests/fill_link_info.c      |   18 +-
 .../selftests/bpf/prog_tests/kfunc_module_order.c  |   55 +
 .../bpf/prog_tests/netfilter_link_attach.c         |   42 +-
 tools/testing/selftests/bpf/prog_tests/verifier.c  |   21 +
 .../selftests/bpf/prog_tests/xdp_devmap_attach.c   |  125 +-
 tools/testing/selftests/bpf/progs/cpumask_common.h |    5 +
 .../testing/selftests/bpf/progs/cpumask_failure.c  |   35 +
 .../testing/selftests/bpf/progs/cpumask_success.c  |   78 +-
 .../selftests/bpf/progs/kfunc_module_order.c       |   30 +
 .../bpf/progs/test_xdp_with_devmap_helpers.c       |    2 +-
 .../selftests/bpf/progs/verifier_bits_iter.c       |   61 +-
 .../selftests/bpf/progs/verifier_bpf_fastcall.c    |   55 -
 tools/testing/selftests/bpf/progs/verifier_const.c |   31 +-
 .../selftests/bpf/progs/verifier_linked_scalars.c  |   34 +
 tools/testing/selftests/bpf/progs/verifier_movsx.c |   40 +
 tools/testing/selftests/bpf/progs/verifier_mtu.c   |   18 +
 .../selftests/bpf/progs/verifier_scalar_ids.c      |   67 +
 .../selftests/bpf/progs/verifier_search_pruning.c  |   23 +
 tools/testing/selftests/bpf/testing_helpers.c      |   34 +-
 tools/testing/selftests/bpf/testing_helpers.h      |    2 +
 tools/testing/selftests/bpf/veristat.cfg           |    1 +
 .../ftrace/test.d/00basic/mount_options.tc         |  101 +
 .../ftrace/test.d/00basic/test_ownership.tc        |   16 +-
 .../ftrace/test.d/ftrace/fgraph-profiler.tc        |   31 +
 tools/testing/selftests/ftrace/test.d/functions    |   25 +
 tools/testing/selftests/hid/Makefile               |    1 +
 tools/testing/selftests/intel_pstate/run.sh        |    9 +-
 tools/testing/selftests/kvm/Makefile               |    3 +
 tools/testing/selftests/kvm/aarch64/set_id_regs.c  |   16 +-
 tools/testing/selftests/kvm/x86_64/cpuid_test.c    |    2 +-
 tools/testing/selftests/mm/hmm-tests.c             |    2 +-
 tools/testing/selftests/mm/hugetlb_dio.c           |   19 +-
 tools/testing/selftests/mm/khugepaged.c            |    2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c       |    5 +
 .../selftests/mount_setattr/mount_setattr_test.c   |    9 +
 tools/testing/selftests/net/.gitignore             |    1 +
 .../selftests/net/forwarding/ip6gre_flat.sh        |   14 +
 .../selftests/net/forwarding/ip6gre_flat_key.sh    |   14 +
 .../selftests/net/forwarding/ip6gre_flat_keys.sh   |   14 +
 .../selftests/net/forwarding/ip6gre_hier.sh        |   14 +
 .../selftests/net/forwarding/ip6gre_hier_key.sh    |   14 +
 .../selftests/net/forwarding/ip6gre_hier_keys.sh   |   14 +
 .../testing/selftests/net/forwarding/ip6gre_lib.sh |   80 +
 .../selftests/net/forwarding/no_forwarding.sh      |    2 +-
 tools/testing/selftests/net/lib/py/nsim.py         |    1 +
 tools/testing/selftests/net/mptcp/mptcp_connect.sh |    9 +
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |  115 +-
 tools/testing/selftests/net/netfilter/Makefile     |    1 +
 tools/testing/selftests/net/netfilter/config       |    2 +
 .../selftests/net/netfilter/conntrack_dump_flush.c |    6 +-
 .../selftests/net/netfilter/conntrack_vrf.sh       |   33 +
 .../selftests/net/netfilter/nft_flowtable.sh       |   39 +-
 .../selftests/net/netfilter/vxlan_mtu_frag.sh      |  121 +
 tools/testing/selftests/net/rds/.gitignore         |    1 +
 tools/testing/selftests/net/rds/Makefile           |    2 +-
 tools/testing/selftests/net/rds/test.py            |    5 +-
 tools/testing/selftests/net/ynl.mk                 |    4 +
 tools/testing/selftests/rseq/rseq.c                |  110 +-
 tools/testing/selftests/rseq/rseq.h                |   10 +-
 tools/testing/selftests/sched_ext/Makefile         |   73 +-
 tools/testing/selftests/sched_ext/create_dsq.bpf.c |    6 +-
 .../selftests/sched_ext/ddsp_bogus_dsq_fail.bpf.c  |    4 +-
 .../selftests/sched_ext/ddsp_vtimelocal_fail.bpf.c |    4 +-
 .../testing/selftests/sched_ext/dsp_local_on.bpf.c |    8 +-
 .../sched_ext/enq_last_no_enq_fails.bpf.c          |    8 +
 .../selftests/sched_ext/enq_last_no_enq_fails.c    |   10 +-
 .../selftests/sched_ext/enq_select_cpu_fails.bpf.c |    4 +-
 tools/testing/selftests/sched_ext/exit.bpf.c       |   22 +-
 tools/testing/selftests/sched_ext/hotplug.bpf.c    |    8 +-
 .../selftests/sched_ext/init_enable_count.bpf.c    |    8 +-
 tools/testing/selftests/sched_ext/maximal.bpf.c    |   58 +-
 tools/testing/selftests/sched_ext/maybe_null.bpf.c |    6 +-
 .../selftests/sched_ext/maybe_null_fail_dsp.bpf.c  |    4 +-
 .../selftests/sched_ext/maybe_null_fail_yld.bpf.c  |    4 +-
 tools/testing/selftests/sched_ext/prog_run.bpf.c   |    2 +-
 .../selftests/sched_ext/select_cpu_dfl.bpf.c       |    2 +-
 .../sched_ext/select_cpu_dfl_nodispatch.bpf.c      |    6 +-
 .../selftests/sched_ext/select_cpu_dispatch.bpf.c  |    2 +-
 .../sched_ext/select_cpu_dispatch_bad_dsq.bpf.c    |    4 +-
 .../sched_ext/select_cpu_dispatch_dbl_dsp.bpf.c    |    4 +-
 .../selftests/sched_ext/select_cpu_vtime.bpf.c     |   12 +-
 tools/testing/selftests/vDSO/Makefile              |    6 +-
 tools/testing/selftests/vDSO/vdso_test_chacha.c    |   36 +-
 tools/testing/selftests/vDSO/vdso_test_getrandom.c |   76 +-
 tools/testing/selftests/vDSO/vgetrandom-chacha.S   |   18 +
 tools/testing/selftests/watchdog/watchdog-test.c   |    6 +
 tools/testing/vma/vma.c                            |   40 +
 tools/usb/usbip/src/usbip_detach.c                 |    1 +
 virt/kvm/kvm_main.c                                |   14 +-
 1901 files changed, 36883 insertions(+), 19854 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/elgin,jg10309-01.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1373.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/inno-rk3036.txt
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/neofidelity,ntp8835.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,uda1342.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3036-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5640.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sprd,pcm-platform.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/sprd,sc9860-mcdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sprd-mcdt.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sprd-pcm.txt
 delete mode 100644 drivers/video/fbdev/da8xx-fb.c
 delete mode 100644 include/sound/adau1373.h
 create mode 100644 include/sound/sdca.h
 create mode 100644 include/sound/sdca_function.h
 delete mode 100644 include/video/da8xx-fb.h
 create mode 100755 scripts/rustc-llvm-version.sh
 create mode 100644 sound/soc/amd/acp/acp-sdw-legacy-mach.c
 create mode 100644 sound/soc/amd/acp/acp-sdw-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp_common.h
 create mode 100644 sound/soc/codecs/aw88081.c
 create mode 100644 sound/soc/codecs/aw88081.h
 create mode 100644 sound/soc/codecs/cs42l84.c
 create mode 100644 sound/soc/codecs/cs42l84.h
 create mode 100644 sound/soc/codecs/es8323.c
 create mode 100644 sound/soc/codecs/es8323.h
 create mode 100644 sound/soc/codecs/ntp8835.c
 create mode 100644 sound/soc/codecs/ntp8918.c
 create mode 100644 sound/soc/codecs/ntpfw.c
 create mode 100644 sound/soc/codecs/ntpfw.h
 create mode 100644 sound/soc/codecs/rt-sdw-common.c
 create mode 100644 sound/soc/codecs/rt-sdw-common.h
 create mode 100644 sound/soc/codecs/rt721-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt721-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt721-sdca.c
 create mode 100644 sound/soc/codecs/rt721-sdca.h
 create mode 100644 sound/soc/codecs/sma1307.c
 create mode 100644 sound/soc/codecs/sma1307.h
 create mode 100644 sound/soc/codecs/uda1342.c
 create mode 100644 sound/soc/codecs/uda1342.h
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
 delete mode 100644 sound/soc/intel/common/sst-dsp-priv.h
 delete mode 100644 sound/soc/intel/common/sst-dsp.c
 delete mode 100644 sound/soc/intel/common/sst-dsp.h
 delete mode 100644 sound/soc/intel/common/sst-ipc.c
 delete mode 100644 sound/soc/intel/common/sst-ipc.h
 create mode 100644 sound/soc/loongson/loongson_i2s_plat.c
 rename sound/soc/{sh => renesas}/Kconfig (100%)
 rename sound/soc/{sh => renesas}/Makefile (100%)
 rename sound/soc/{sh => renesas}/dma-sh7760.c (100%)
 rename sound/soc/{sh => renesas}/fsi.c (100%)
 rename sound/soc/{sh => renesas}/hac.c (100%)
 rename sound/soc/{sh => renesas}/migor.c (100%)
 rename sound/soc/{sh => renesas}/rcar/Makefile (100%)
 rename sound/soc/{sh => renesas}/rcar/adg.c (100%)
 rename sound/soc/{sh => renesas}/rcar/cmd.c (100%)
 rename sound/soc/{sh => renesas}/rcar/core.c (98%)
 rename sound/soc/{sh => renesas}/rcar/ctu.c (100%)
 rename sound/soc/{sh => renesas}/rcar/debugfs.c (100%)
 rename sound/soc/{sh => renesas}/rcar/dma.c (100%)
 rename sound/soc/{sh => renesas}/rcar/dvc.c (100%)
 rename sound/soc/{sh => renesas}/rcar/gen.c (100%)
 rename sound/soc/{sh => renesas}/rcar/mix.c (100%)
 rename sound/soc/{sh => renesas}/rcar/rsnd.h (100%)
 rename sound/soc/{sh => renesas}/rcar/src.c (100%)
 rename sound/soc/{sh => renesas}/rcar/ssi.c (100%)
 rename sound/soc/{sh => renesas}/rcar/ssiu.c (100%)
 rename sound/soc/{sh => renesas}/rz-ssi.c (99%)
 rename sound/soc/{sh => renesas}/sh7760-ac97.c (100%)
 rename sound/soc/{sh => renesas}/siu.h (100%)
 rename sound/soc/{sh => renesas}/siu_dai.c (100%)
 rename sound/soc/{sh => renesas}/siu_pcm.c (100%)
 rename sound/soc/{sh => renesas}/ssi.c (100%)
 create mode 100644 sound/soc/sdca/Kconfig
 create mode 100644 sound/soc/sdca/Makefile
 create mode 100644 sound/soc/sdca/sdca_device.c
 create mode 100644 sound/soc/sdca/sdca_functions.c
 delete mode 100644 sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
 delete mode 100644 sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
 delete mode 120000 tools/arch/arm64/vdso
 delete mode 120000 tools/arch/loongarch/vdso
 delete mode 120000 tools/arch/powerpc/vdso
 delete mode 120000 tools/arch/s390/vdso
 delete mode 120000 tools/arch/x86/vdso
 create mode 100644 tools/include/vdso/unaligned.h
 create mode 100644 tools/perf/check-header_ignore_hunks/lib/list_sort.c
 create mode 100644 tools/testing/selftests/bpf/bpf_test_modorder_x/Makefile
 create mode 100644 tools/testing/selftests/bpf/bpf_test_modorder_x/bpf_test_modorder_x.c
 create mode 100644 tools/testing/selftests/bpf/bpf_test_modorder_y/Makefile
 create mode 100644 tools/testing/selftests/bpf/bpf_test_modorder_y/bpf_test_modorder_y.c
 create mode 100644 tools/testing/selftests/bpf/map_tests/lpm_trie_map_get_next_key.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/kfunc_module_order.c
 create mode 100644 tools/testing/selftests/bpf/progs/kfunc_module_order.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_mtu.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/mount_options.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-profiler.tc
 create mode 100755 tools/testing/selftests/net/netfilter/vxlan_mtu_frag.sh
 create mode 100644 tools/testing/selftests/net/rds/.gitignore
 create mode 100644 tools/testing/selftests/vDSO/vgetrandom-chacha.S
