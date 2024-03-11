Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C487830E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 16:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F1983E;
	Mon, 11 Mar 2024 16:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F1983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710170241;
	bh=8c6pm8goEkgF6F+sWqHcxZXaC+0Cws2aaQ4WRiFb/Sc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IO/4/7HFcT5VT7agiZh8ddebVZd+WoOuAMwTQvsqM4D+2KBK62kFpkHPcge+Yji8D
	 wGInBgS7nSS7Pfwo2ypJKBNgAfeLfQMBlV/xmHNKOhUg3658A0htiGnkWda4dSqmiw
	 BKnq7Sztaicf2xI351Xi65GB7ZALftxMHz4Lq/pk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932A1F8057B; Mon, 11 Mar 2024 16:16:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03FDFF805A1;
	Mon, 11 Mar 2024 16:16:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A057AF8028D; Mon, 11 Mar 2024 16:13:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 942C6F80088
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 16:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942C6F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RRQtumzI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20D1760EC6;
	Mon, 11 Mar 2024 15:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E821C43399;
	Mon, 11 Mar 2024 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710169954;
	bh=8c6pm8goEkgF6F+sWqHcxZXaC+0Cws2aaQ4WRiFb/Sc=;
	h=From:To:Cc:Subject:Date:From;
	b=RRQtumzIq/WgGx6LRsQy9tLRAI5y/ckzS73C+NX4+au0NMGT8gzHgUxXOVuSF/TnR
	 TAzkMnUx0IinDrYUuZyWTfzeaxqSEilMpgO9QEVDp2d4ujs5gSErL2jyAesCaTiocw
	 n26tBD3fAFKhihyjI2gM2q6TSyH/VsfpD8xMG841tilTyaPZ2PgzFe1Py5c3aZQXgd
	 tcgxaCTClpNgk3i89NnGRCaxiTwkjKwah2wybMkPuB+yI904zzurskjsR0nDUbShJK
	 88SrckG9wChY3Cmyiv7vL/CB8gQJ/hyN9POezscLA2r59XYdqxwbF3WFaPMx3Gk8K2
	 4JezKutcPx4nw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.9
Date: Mon, 11 Mar 2024 15:12:25 +0000
Message-Id: <20240311151234.1E821C43399@smtp.kernel.org>
Message-ID-Hash: IG3ELRP4PPQVMB3S52OIW5DMKGTMTY2G
X-Message-ID-Hash: IG3ELRP4PPQVMB3S52OIW5DMKGTMTY2G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IG3ELRP4PPQVMB3S52OIW5DMKGTMTY2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.9

for you to fetch changes up to 6c023ad32b192dea51a4f842cc6ecf89bb6238c9:

  ASoC: Intel: catpt: Carefully use PCI bitwise constants (2024-03-07 16:47:01 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.9

This has been quite a small release, there's a lot of driver specific
cleanups and minor enhancements but hardly anything on the core and only
one new driver.  Highlights include:

 - SoundWire support for AMD ACP 6.3 systems.
 - Support for reporting version information for AVS firmware.
 - Support DSPless mode for Intel Soundwire systems.
 - Support for configuring CS35L56 amplifiers using EFI calibration
   data.
 - Log which component is being operated on as part of power management
   trace events.
 - Support for Microchip SAM9x7, NXP i.MX95 and Qualcomm WCD939x

----------------------------------------------------------------
Alexander Stein (2):
      ASoC: dt-bindings: fsl-sai: Add power-domains
      ASoC: dt-bindings: fsl-sai: Support Rx-only SAI

Amadeusz Sławiński (3):
      ASoC: Intel: avs: UAPI: Add tokens for initial config feature
      ASoC: Intel: avs: Add topology parsing support for initial config
      ASoC: Intel: avs: Send initial config to module if present

Andy Shevchenko (2):
      ASoC: Intel: atom: sst_ipc: Remove unused intel-mid.h
      ASoC: Intel: catpt: Carefully use PCI bitwise constants

Arnd Bergmann (3):
      ASoC: SOF: amd: fix SND_AMD_SOUNDWIRE_ACPI dependencies
      ASoC: fix SND_SOC_WCD939X dependencies
      ASoC: SOF: amd: fix soundwire dependencies

Bard Liao (12):
      ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
      ASoC: Intel: add get_codec_dai_by_name helper function
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai by name
      ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
      ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
      ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
      ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
      ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
      ASoC: Intel: sof_sdw: add common sdw dai link init
      ASoC: Intel: sof_sdw: remove .init callbacks
      ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id
      ASoC: SOF: ipc4-topology: set config_length based on device_count

Brent Lu (8):
      ASoC: Intel: sof_rt5682: board id cleanup for jsl boards
      ASoC: Intel: sof_rt5682: board id cleanup for tgl boards
      ASoC: Intel: sof_rt5682: board id cleanup for adl boards
      ASoC: Intel: sof_rt5682: board id cleanup for rpl boards
      ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
      ASoC: Intel: sof_rt5682: dmi quirk cleanup for mtl boards
      ASoC: Intel: board_helpers: support DAI link order customization
      ASoC: Intel: sof_cs42l42: use common module for DAI link generation

Cezary Rojewski (17):
      ASoC: Intel: avs: Expose FW version with sysfs
      ASoC: Intel: avs: L1SEN reference counted
      ASoC: Intel: avs: Fix sound clipping in single capture scenario
      ASoC: Intel: avs: Prefix SKL/APL-specific members
      ASoC: Intel: avs: Abstract IPC handling
      ASoC: Intel: avs: Abstract IRQ handling
      ASoC: Intel: avs: CNL-based platforms support
      ASoC: Intel: avs: ICL-based platforms support
      ASoC: Intel: avs: TGL-based platforms support
      ASoC: Intel: avs: ICCMAX recommendations for ICL+ platforms
      ASoC: Intel: avs: Populate board selection with new I2S entries
      ASoC: codecs: da7213: Simplify mclk initialization
      ASoC: codecs: nau8825: Simplify mclk initialization
      ASoC: codecs: rt5514: Simplify mclk initialization
      ASoC: codecs: rt5616: Simplify mclk initialization
      ASoC: codecs: rt5640: Simplify mclk initialization
      ASoC: codecs: rt5660: Simplify mclk initialization

Chancel Liu (4):
      ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
      ASoC: fsl_sai: Add support for i.MX95 platform
      ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95 platform
      ASoC: soc-core.c: Prefer to return dai->driver->name in snd_soc_dai_name_get()

Chao Song (2):
      ASoC: Intel: soc-acpi: add RT712 support for LNL
      ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722 support

Charles Keepax (12):
      ASoC: cs42l43: Tidy up header includes
      ASoC: cs42l43: Minor code tidy ups
      ASoC: cs42l43: Check error from device_property_read_u32_array()
      ASoC: cs42l43: Add pm_ptr around the power ops
      ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
      ASoC: cs42l43: Refactor to use for_each_set_bit()
      ASoC: cs42l43: Use fls to calculate the pre-divider for the PLL
      ASoC: cs42l43: Add clear of stashed pointer on component remove
      ASoC: cs42l43: Sync the hp ilimit works when removing the component
      ASoC: cs42l43: Shut down jack detection on component remove
      ASoC: Intel: ssp-common: Add stub for sof_ssp_get_codec_name
      ASoC: Intel: sof_sdw: Remove unused function prototypes

Colin Ian King (1):
      ASoC: tas2781: Remove redundant initialization of pointer 'data'

Cristian Ciocaltea (8):
      ASoC: amd: acp: Drop redundant initialization of machine driver data
      ASoC: amd: acp: Make use of existing *_CODEC_DAI macros
      ASoC: amd: acp: Add missing error handling in sof-mach
      ASoC: amd: acp: Update MODULE_DESCRIPTION for sof-mach
      ASoC: SOF: amd: Fix memory leak in amd_sof_acp_probe()
      ASoC: SOF: amd: Optimize quirk for Valve Galileo
      ASoC: SOF: core: Skip firmware test for custom loaders
      ASoC: SOF: amd: Compute file paths on firmware load

Dan Carpenter (1):
      ASoC: SOF: Add some bounds checking to firmware data

Daniel Baluta (1):
      ASoC: SOF: imx: Add devicetree support to select topologies

David Lin (1):
      ASoC: nau8540: Add pre-charge actions for input

Dharma Balasubiramani (2):
      ASoC: dt-bindings: atmel,sam9x5-wm8731: Convert to json-schema
      ASoC: dt-bindings: atmel,asoc-wm8904: Convert to json-schema

Erick Archer (2):
      ASoC: qcom: Use devm_kcalloc() instead of devm_kzalloc()
      ASoC: ti: j721e-evm: Use devm_kcalloc() instead of devm_kzalloc()

Gergo Koteles (1):
      ASoC: tas2781: remove unused acpi_subysystem_id

Herve Codina (1):
      ASoC: codecs: Add support for the framer codec

Javier García (1):
      ASoC: dt-bindings: rt1015: Convert to dtschema

Jerome Brunet (8):
      ASoC: meson: aiu: fix function pointer type mismatch
      ASoC: meson: t9015: fix function pointer type mismatch
      ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
      ASoC: meson: axg-tdm-interface: add frame rate constraint
      ASoC: meson: axg-tdm-interface: update error format error traces
      ASoC: meson: axg-spdifin: use max width for rate detection
      ASoC: meson: axg-fifo: take continuous rates
      ASoC: meson: axg-fifo: use FIELD helpers

Konrad Dybcio (1):
      ASoC: dt-bindings: cs35l45: Add interrupts

Krzysztof Kozlowski (11):
      ASoC: dt-bindings: Do not override firmware-name $ref
      ASoC: codecs: constify static sdw_slave_ops struct
      ASoC: dt-bindings: qcom,sm8250: Allow up to 8 codec DAIs
      ASoC: codecs: tx-macro: Drop unimplemented DMIC clock divider
      ASoC: codecs: tx-macro: Mark AMIC control registers as volatile
      ASoC: codecs: tx-macro: Simplify setting AMIC control
      ASoC: Constify pointer to of_phandle_args
      ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
      ASoC: codecs: wsa884x: Allow sharing reset GPIO
      ASoC: codecs: tx-macro: split widgets per different LPASS versions
      ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+

Kuninori Morimoto (4):
      ASoC: ti: use devm_snd_soc_register_card()
      ASoC: fsl: use devm_snd_soc_register_card()
      ASoC: atmel: use devm_snd_soc_register_card()
      ASoC: soc-core: tidyup strcmp() param on snd_soc_is_matching_dai()

Lad Prabhakar (1):
      ASoC: sh: rz-ssi: Fix error message print

Luca Ceresoli (2):
      ASoC: trace: add component to set_bias_level trace events
      ASoC: trace: add event to snd_soc_dapm trace events

Maciej Strozek (1):
      ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for MTL

Mark Brown (15):
      Improve SOF support for Steam Deck OLED
      ASoC: codecs: add support for WCD939x Codec
      ASoC: Merge up fixes
      ASoC: Support SAI and MICFIL on i.MX95 platform
      ASoC: use devm_snd_soc_register_card()
      ASoC: Merge up fixes due to dependency with new changes
      soundwire/SOF: add SoundWire Interface support for
      ASoC: Intel: avs: Add support for sending initial
      ASoC: SOF: Extend ChainDMA and DSPless mode to LNL+
      ASoC: meson: aiu: fix function pointer type
      ASoC: Intel: avs: Fixes and new platforms support
      ALSA: cs35l56: Apply calibration from EFI
      ASoC: codecs: Simplify mclk initialization
      ASoC: meson: axg fixes and clean-up
      ASoC: codecs: ES8326: change members of private

Masahiro Yamada (2):
      ASoC: pxa: remove duplicated CONFIG_SND_PXA2XX_AC97 entry
      ASoC: codecs: remove redundant 'tristate' in sound/soc/codecs/Kconfig

Neil Armstrong (5):
      ASoC: dt-bindings: qcom,wcd938x: move out common properties
      ASoC: dt-bindings: document WCD939x Audio Codec
      ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux
      ASoC: codecs: Add WCD939x Soundwire devices driver
      ASoC: codecs: Add WCD939x Codec driver

Peter Ujfalusi (2):
      ASoC: SOF: Intel: lnl: Do not use LNL specific wrappers in DSPless mode
      ASoC: SOF: Fix runtime pm usage counter balance after fw exception

Pierre-Louis Bossart (14):
      ASoC: SOF: ipc4-topology: change chain_dma handling in dai_config
      ASoC: SOF: ops: add new 'is_chain_dma_supported' callback
      ASoC: SOF: Intel: hda: add 'is_chain_dma_supported' callback
      ASoC: SOF: Intel: hda-dai-ops: enable chain_dma for ALH
      ASoC: SOF: ipc4: store number of playback/capture streams
      ASoC: SOF: ipc4-pcm: fix dma_id for CHAIN_DMA capture
      ASoC: SOF: ipc4-topology: allow chain_dma for all supported DAIs
      ASoC: SOF: Intel: hda-dai: remove dspless special case
      ASoC: SOF: topology: dynamically allocate and store DAI widget->private
      ASoC: SOF: Intel: start SoundWire links earlier for LNL+ devices
      ASoC: SOF: Intel: hda-dai-ops: use dai_type
      ASoC: SOF: Intel: hda-dai-ops: add SoundWire dspless mode
      ASoC: SOF: Intel: hda-dai: add support for dspless mode beyond HDAudio
      ASoC: SOF: Intel: hda-mlink: update incorrect comment

R SUNDAR (1):
      spi: Remove the @multi_cs_cap to prevent kernel-doc warnings

Randy Dunlap (1):
      ASoC: p1022_rdk: fix all kernel-doc warnings

Ranjani Sridharan (1):
      ASoC: SOF: topology: Parse DAI type token for dspless mode

Richard Fitzgerald (9):
      ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
      ASoC: cs-amp-lib: Add helpers for factory calibration data
      ASoC: cs35l56: Add helper functions for amp calibration
      ASoC: cs35l56: Apply amp calibration from EFI data
      ALSA: hda: cs35l56: Apply amp calibration from EFI data
      ASoC: cs35l56: Prevent bad sign extension in cs35l56_read_silicon_uid()
      ASoC: cs-amp-lib: Add KUnit test for calibration helpers
      firmware: cirrus: cs_dsp: Initialize debugfs_root to invalid
      firmware: cirrus: cs_dsp: Remove non-existent member from kerneldoc

Rob Herring (2):
      ASoC: dt-bindings: samsung,tm2: Correct "audio-codec" constraints
      ASoC: dt-bindings: audio-graph-port: Drop type from "clocks"

Sebastian Reichel (1):
      ASoC: dt-bindings: fsl,imx-asrc: convert to YAML

Srinivas Kandagatla (1):
      ASoC: codecs: va-macro: add npl clk

Varshini Rajendran (2):
      ASoC: dt-bindings: atmel-classd: add sam9x7 compatible
      ASoC: dt-bindings: microchip: add sam9x7

Vijendar Mukunda (20):
      ASoC/soundwire: implement generic api for scanning amd soundwire controller
      soundwire: amd: update license
      soundwire: amd: refactor amd soundwire manager device node creation
      soundwire: amd: implement function to extract slave information
      soundwire: amd: refactor soundwire pads enable
      soundwire: amd: refactor register mask structure
      ASoC: SOF: amd: add code for invoking soundwire manager helper functions
      ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
      ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD platforms
      ASoC: SOF: amd: add machine select logic for soundwire based platforms
      ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
      ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based platform
      ASoC: SOF: amd: refactor acp driver pm ops
      ASoC: amd: ps: refactor acp device configuration read logic
      ASoC: amd: ps: refactor acp child platform device creation code
      ASoC: amd: ps: remove acp_reset flag
      ASoC: amd: ps: fix for acp pme wake for soundwire configuration
      ASoC: amd: ps: add machine select and register code
      ASoC: amd: ps: update license
      ASoC: amd: ps: modify ACP register end address macro

Vitaly Rodionov (1):
      ASoC: cs42l42: Remove redundant delays in suspend().

Yang Li (1):
      ASoC: codecs: Remove unneeded semicolon

Yinchuan Guo (1):
      ASoC: codecs: fix TYPO 'reguest' to 'request' in error log

Zhang Yi (2):
      ASoC: codecs: ES8326: Changing members of private structure
      ASoC: codecs: ES8326: change support for ES8326

Zhu Ning (1):
      ASoC: codecs: ES8326: Adding new volume kcontrols

mosomate (1):
      ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710) laptops

 .../ABI/testing/sysfs-bus-pci-devices-avs          |    8 +
 .../bindings/sound/atmel,asoc-wm8904.yaml          |   84 +
 .../bindings/sound/atmel,sam9x5-wm8731-audio.yaml  |   76 +
 .../bindings/sound/atmel,sama5d2-classd.yaml       |    7 +-
 .../bindings/sound/atmel-sam9x5-wm8731-audio.txt   |   35 -
 .../devicetree/bindings/sound/atmel-wm8904.txt     |   55 -
 .../bindings/sound/audio-graph-port.yaml           |    2 +-
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |    3 +
 .../devicetree/bindings/sound/everest,es8326.yaml  |    8 +-
 .../devicetree/bindings/sound/fsl,asrc.txt         |   80 -
 .../devicetree/bindings/sound/fsl,easrc.yaml       |    4 +-
 .../devicetree/bindings/sound/fsl,imx-asrc.yaml    |  162 +
 .../devicetree/bindings/sound/fsl,micfil.yaml      |   14 +-
 .../devicetree/bindings/sound/fsl,sai.yaml         |    6 +
 .../bindings/sound/infineon,peb2466.yaml           |    2 +-
 .../bindings/sound/microchip,sama7g5-i2smcc.yaml   |   11 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    2 +-
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   81 +-
 .../bindings/sound/qcom,wcd939x-sdw.yaml           |   69 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |   96 +
 .../bindings/sound/qcom,wcd93xx-common.yaml        |   95 +
 .../devicetree/bindings/sound/qcom,wsa8840.yaml    |   11 +-
 .../devicetree/bindings/sound/realtek,rt1015.yaml  |   41 +
 Documentation/devicetree/bindings/sound/rt1015.txt |   23 -
 .../devicetree/bindings/sound/samsung,tm2.yaml     |    7 +-
 drivers/firmware/cirrus/cs_dsp.c                   |    7 +-
 drivers/soundwire/Makefile                         |    2 +-
 drivers/soundwire/amd_init.c                       |  235 ++
 drivers/soundwire/amd_init.h                       |   13 +
 drivers/soundwire/amd_manager.c                    |   47 +-
 drivers/soundwire/amd_manager.h                    |   16 +-
 drivers/soundwire/dmi-quirks.c                     |    8 +
 include/linux/firmware/cirrus/cs_dsp.h             |    1 -
 include/linux/soundwire/sdw_amd.h                  |   83 +-
 include/linux/spi/spi.h                            |    2 -
 include/sound/cs-amp-lib.h                         |   66 +
 include/sound/cs35l56.h                            |   10 +
 include/sound/cs42l42.h                            |    5 +-
 include/sound/hda-mlink.h                          |    2 +-
 include/sound/hda_register.h                       |    2 +
 include/sound/soc.h                                |    4 +-
 include/sound/sof/dai-amd.h                        |    7 +
 include/sound/sof/dai.h                            |    2 +
 include/sound/tas2781.h                            |    1 -
 include/trace/events/asoc.h                        |   45 +-
 include/uapi/sound/intel/avs/tokens.h              |    9 +
 include/uapi/sound/sof/tokens.h                    |    4 +
 sound/pci/hda/Kconfig                              |    2 +
 sound/pci/hda/cs35l56_hda.c                        |   39 +-
 sound/pci/hda/tas2781_hda_i2c.c                    |   12 -
 sound/soc/amd/Kconfig                              |   17 +
 sound/soc/amd/Makefile                             |    2 +-
 sound/soc/amd/acp/Kconfig                          |    7 +
 sound/soc/amd/acp/Makefile                         |    2 +
 sound/soc/amd/acp/acp-mach-common.c                |    6 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   26 +-
 sound/soc/amd/acp/amd-sdw-acpi.c                   |   62 +
 sound/soc/amd/ps/Makefile                          |    2 +-
 sound/soc/amd/ps/acp63.h                           |   91 +-
 sound/soc/amd/ps/pci-ps.c                          |  565 +--
 sound/soc/amd/ps/ps-mach.c                         |    2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                      |    2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    2 +-
 sound/soc/atmel/mikroe-proto.c                     |    8 +-
 sound/soc/codecs/Kconfig                           |   55 +-
 sound/soc/codecs/Makefile                          |   13 +
 sound/soc/codecs/cs-amp-lib-test.c                 |  709 ++++
 sound/soc/codecs/cs-amp-lib.c                      |  277 ++
 sound/soc/codecs/cs35l56-sdw.c                     |   20 +
 sound/soc/codecs/cs35l56-shared.c                  |   84 +
 sound/soc/codecs/cs35l56.c                         |   44 +-
 sound/soc/codecs/cs42l42.c                         |    1 -
 sound/soc/codecs/cs42l43-jack.c                    |   27 +-
 sound/soc/codecs/cs42l43-sdw.c                     |    1 +
 sound/soc/codecs/cs42l43.c                         |   82 +-
 sound/soc/codecs/cs42l43.h                         |   21 +-
 sound/soc/codecs/da7213.c                          |   12 +-
 sound/soc/codecs/es8326.c                          |  110 +-
 sound/soc/codecs/es8326.h                          |    5 +-
 sound/soc/codecs/framer-codec.c                    |  413 +++
 sound/soc/codecs/lpass-macro-common.h              |    7 +
 sound/soc/codecs/lpass-tx-macro.c                  |  693 +++-
 sound/soc/codecs/lpass-va-macro.c                  |   57 +
 sound/soc/codecs/max98363.c                        |    2 +-
 sound/soc/codecs/max98373-sdw.c                    |    2 +-
 sound/soc/codecs/nau8540.c                         |  116 +-
 sound/soc/codecs/nau8540.h                         |   13 +-
 sound/soc/codecs/nau8825.c                         |   12 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    2 +-
 sound/soc/codecs/rt274.c                           |    2 +-
 sound/soc/codecs/rt286.c                           |    2 +-
 sound/soc/codecs/rt298.c                           |    2 +-
 sound/soc/codecs/rt5514-spi.c                      |    2 +-
 sound/soc/codecs/rt5514.c                          |    9 +-
 sound/soc/codecs/rt5616.c                          |    9 +-
 sound/soc/codecs/rt5640.c                          |    9 +-
 sound/soc/codecs/rt5645.c                          |    2 +-
 sound/soc/codecs/rt5651.c                          |    2 +-
 sound/soc/codecs/rt5659.c                          |    2 +-
 sound/soc/codecs/rt5660.c                          |    9 +-
 sound/soc/codecs/rt5663.c                          |    2 +-
 sound/soc/codecs/rt5665.c                          |    2 +-
 sound/soc/codecs/rt5668.c                          |    2 +-
 sound/soc/codecs/rt5682-i2c.c                      |    2 +-
 sound/soc/codecs/rt5682s.c                         |    2 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    2 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/tas2781-comlib.c                  |    1 -
 sound/soc/codecs/tas2781-fmwlib.c                  |    2 +-
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1551 ++++++++
 sound/soc/codecs/wcd939x.c                         | 3686 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  989 ++++++
 sound/soc/codecs/wm_adsp.c                         |   27 +-
 sound/soc/codecs/wm_adsp.h                         |    2 +
 sound/soc/codecs/wsa884x.c                         |   53 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    8 +-
 sound/soc/fsl/fsl_sai.c                            |   13 +
 sound/soc/fsl/p1022_rdk.c                          |   33 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |    3 +-
 sound/soc/intel/avs/Makefile                       |    5 +-
 sound/soc/intel/avs/apl.c                          |   58 +-
 sound/soc/intel/avs/avs.h                          |   70 +-
 sound/soc/intel/avs/board_selection.c              |   85 +
 sound/soc/intel/avs/cnl.c                          |   61 +
 sound/soc/intel/avs/core.c                         |  161 +-
 sound/soc/intel/avs/icl.c                          |  197 ++
 sound/soc/intel/avs/ipc.c                          |   66 +-
 sound/soc/intel/avs/loader.c                       |    2 +-
 sound/soc/intel/avs/messages.c                     |    1 +
 sound/soc/intel/avs/messages.h                     |   38 +-
 sound/soc/intel/avs/path.c                         |   33 +
 sound/soc/intel/avs/pcm.c                          |   77 +-
 sound/soc/intel/avs/registers.h                    |   21 +-
 sound/soc/intel/avs/skl.c                          |   59 +-
 sound/soc/intel/avs/sysfs.c                        |   35 +
 sound/soc/intel/avs/tgl.c                          |   54 +
 sound/soc/intel/avs/topology.c                     |  164 +-
 sound/soc/intel/avs/topology.h                     |   13 +
 sound/soc/intel/boards/Kconfig                     |    1 +
 sound/soc/intel/boards/sof_board_helpers.c         |  249 +-
 sound/soc/intel/boards/sof_board_helpers.h         |   29 +
 sound/soc/intel/boards/sof_cs42l42.c               |  236 +-
 sound/soc/intel/boards/sof_rt5682.c                |  151 +-
 sound/soc/intel/boards/sof_sdw.c                   |  106 +-
 sound/soc/intel/boards/sof_sdw_common.h            |   82 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c           |   35 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c           |   25 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c            |    3 +-
 sound/soc/intel/boards/sof_sdw_maxim.c             |    4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |   35 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   35 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   19 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c        |   39 +-
 sound/soc/intel/boards/sof_sdw_rt715.c             |   12 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c        |   12 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c            |   53 +-
 .../soc/intel/boards/sof_sdw_rt_sdca_jack_common.c |   19 +-
 sound/soc/intel/boards/sof_ssp_common.h            |    8 +
 sound/soc/intel/catpt/dsp.c                        |    4 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   12 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   10 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  102 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   61 +-
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |    4 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |    6 +-
 sound/soc/meson/aiu.c                              |   19 +-
 sound/soc/meson/aiu.h                              |    1 -
 sound/soc/meson/axg-fifo.c                         |   25 +-
 sound/soc/meson/axg-fifo.h                         |   14 +-
 sound/soc/meson/axg-frddr.c                        |   13 +-
 sound/soc/meson/axg-spdifin.c                      |    6 +-
 sound/soc/meson/axg-tdm-interface.c                |   31 +-
 sound/soc/meson/axg-toddr.c                        |   30 +-
 sound/soc/meson/t9015.c                            |   20 +-
 sound/soc/pxa/Kconfig                              |    3 -
 sound/soc/qcom/common.c                            |    2 +-
 sound/soc/sh/rz-ssi.c                              |    2 +-
 sound/soc/soc-core.c                               |   21 +-
 sound/soc/soc-dapm.c                               |    8 +-
 sound/soc/sof/amd/Kconfig                          |   18 +
 sound/soc/sof/amd/acp-common.c                     |   65 +-
 sound/soc/sof/amd/acp-dsp-offset.h                 |   10 +
 sound/soc/sof/amd/acp-loader.c                     |   32 +-
 sound/soc/sof/amd/acp.c                            |  232 +-
 sound/soc/sof/amd/acp.h                            |   26 +-
 sound/soc/sof/amd/pci-acp63.c                      |    7 +
 sound/soc/sof/core.c                               |   10 +
 sound/soc/sof/debug.c                              |    8 +-
 sound/soc/sof/fw-file-profile.c                    |   18 +-
 sound/soc/sof/imx/imx8.c                           |   16 +
 sound/soc/sof/imx/imx8m.c                          |   10 +
 sound/soc/sof/imx/imx8ulp.c                        |   10 +
 sound/soc/sof/intel/hda-common-ops.c               |    1 +
 sound/soc/sof/intel/hda-dai-ops.c                  |   51 +-
 sound/soc/sof/intel/hda-dai.c                      |   17 +-
 sound/soc/sof/intel/hda-dsp.c                      |    5 +
 sound/soc/sof/intel/hda-stream.c                   |    9 +
 sound/soc/sof/intel/hda.c                          |   80 +-
 sound/soc/sof/intel/hda.h                          |    5 +
 sound/soc/sof/intel/lnl.c                          |   24 +-
 sound/soc/sof/ipc3-loader.c                        |    2 +
 sound/soc/sof/ipc3-pcm.c                           |   25 +
 sound/soc/sof/ipc3-topology.c                      |   40 +
 sound/soc/sof/ipc4-pcm.c                           |   19 +-
 sound/soc/sof/ipc4-priv.h                          |    4 +
 sound/soc/sof/ipc4-topology.c                      |   28 +-
 sound/soc/sof/ops.h                                |    9 +
 sound/soc/sof/sof-audio.c                          |    8 +-
 sound/soc/sof/sof-audio.h                          |    2 +
 sound/soc/sof/sof-priv.h                           |   10 +
 sound/soc/sof/topology.c                           |   30 +-
 sound/soc/ti/j721e-evm.c                           |    4 +-
 sound/soc/ti/omap-hdmi.c                           |   10 +-
 217 files changed, 13085 insertions(+), 2218 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-wm8904.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,asrc.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt1015.txt
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 include/sound/cs-amp-lib.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c
 create mode 100644 sound/soc/codecs/cs-amp-lib-test.c
 create mode 100644 sound/soc/codecs/cs-amp-lib.c
 create mode 100644 sound/soc/codecs/framer-codec.c
 create mode 100644 sound/soc/codecs/wcd939x-sdw.c
 create mode 100644 sound/soc/codecs/wcd939x.c
 create mode 100644 sound/soc/codecs/wcd939x.h
 create mode 100644 sound/soc/intel/avs/cnl.c
 create mode 100644 sound/soc/intel/avs/icl.c
 create mode 100644 sound/soc/intel/avs/sysfs.c
 create mode 100644 sound/soc/intel/avs/tgl.c
