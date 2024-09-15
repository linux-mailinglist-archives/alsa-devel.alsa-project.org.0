Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61B979984
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 01:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9C67E72;
	Mon, 16 Sep 2024 01:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9C67E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726442811;
	bh=A3NRY8jBZ0AqlqYiEpa2qrC/OtQSKAuDCkZdUrnGsxI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h4HoMo8YyRsleh92KPyKO35juMf7VmVHMMLZLrifMfIrtEaAST31w5A60EX2tsAwa
	 d+9lJQ37Qr0CHkeOK6jB8gY9Psw7vtgluxnYk6v1ErFiSCchYnnpgM+7E0yXlEoyRQ
	 BZrFj54+KXNfoqKn3qXyjZmHvNzvxn7l/W4xI+bw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71D3F805A8; Mon, 16 Sep 2024 01:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 040A2F80301;
	Mon, 16 Sep 2024 01:26:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8DBFF8020D; Mon, 16 Sep 2024 01:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8432F80074
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 01:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8432F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jp6BPrNW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 589E8A41414;
	Sun, 15 Sep 2024 23:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9A9C4CEC3;
	Sun, 15 Sep 2024 23:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726442766;
	bh=A3NRY8jBZ0AqlqYiEpa2qrC/OtQSKAuDCkZdUrnGsxI=;
	h=From:To:Cc:Subject:Date:From;
	b=Jp6BPrNWiCCdlqq9BLenMBS/sgkmRRC/tfoTf3B5iERES/WEkoIazCz1SkyZLZZX+
	 Zzp5N9KJogZf7lOb/s8bqF45e1JBYu1fhHGguE+W2KkiNyGqjY7T8hWv5oKVgxDZK5
	 fWfGn24MxCueqBsr4THm98pnGsllbcG6AoleFz7WVrjYmQXbb5xKBOYDzQvK3enn/z
	 kRSUpEh9BDTXzBzy9H9MZzlcvDcyhk7IoR1NotLUs1YSof0ljBVR607GneCBMdAptF
	 VmYffcoix75bsp89YGruK1HoeqCJ8tz6Pyr/c2ZjOluBj92ypMYsv5j4A0JqR8UCRn
	 EBeqdTGKnUwPw==
Message-ID: <23466023e6cdb472a39086dc4f7a4b40.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.12
Date: Mon, 16 Sep 2024 00:26:02 +0100
Message-ID-Hash: AU2AGP3DD5MARMHFQKBYD57HA7BOV43O
X-Message-ID-Hash: AU2AGP3DD5MARMHFQKBYD57HA7BOV43O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AU2AGP3DD5MARMHFQKBYD57HA7BOV43O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 839a4ec06f75cec8fec2cc5fc14e921d0c3f7369:

  ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict (2024-08-23 11:02:53 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.12

for you to fetch changes up to 2772ee6de6cf94e5f2a0c0ce6067d0796a4170ba:

  ASoC: topology: Fix redundant logical jump (2024-09-13 19:40:38 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.12

This is a very large set of changes, almost all in drivers rather than
the core.  Even with the addition of several quite large drivers the
overall diffstat is negative thanks to the removal of some old Intel
board support which has been obsoleted by the AVS driver, helped a bit
by some factoring out into helpers (especially around the Soundwire
machine drivers for x86).

Highlights include:

 - More simplifications and cleanups throughout the subsystem from
   Morimoto-san.
 - Extensive cleanups and refactoring of the Soundwire drivers to make
   better use of helpers.
 - Removal of Intel machine support obsoleted by the AVS driver.
 - Lots of DT schema conversions.
 - Machine support for many AMD and Intel x86 platforms.
 - Support for AMD ACP 7.1, Mediatek MT6367 and MT8365, Realtek RTL1320
   SoundWire and rev C, and Texas Instruments TAS2563

----------------------------------------------------------------
Alexandre Mergnat (11):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      ASoC: mediatek: mt8365: Add audio clock control support
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add the AFE driver support
      ASoC: mediatek: Add MT8365 support

Andrei Simion (1):
      ASoC: dt-bindings: microchip,sama7g5-spdifrx: Add common DAI reference

Andrew Kreimer (1):
      ASoC: tlv320aic31xx: Fix typos

Animesh Agarwal (2):
      ASoC: dt-bindings: ti,pcm512x: Convert to dtschema
      ASoC: dt-bindings: fsl,imx-audio-es8328: Convert to dtschema

Arnd Bergmann (2):
      ASoC: mediatek: mt8365: include linux/bitfield.h
      ASoC: mediatek: mt8365: remove unused mt8365_i2s_hd_str

Balamurugan C (4):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL match table
      ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for ARL.
      ASoC: Intel: ARL: Add entry for HDMI-In capture support to non-I2S codec boards.

Baojun Xu (1):
      ASoC: tas2781: Remove unnecessary line feed for tasdevice_codec_remove

Bard Liao (6):
      ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
      ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
      ASoC: Intel: sof_sdw: add rt1320 amp support
      ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
      ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
      ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num

Biju Das (2):
      ASoC: dt-bindings: renesas,rz-ssi: Document port property
      ASoC: sh: rz-ssi: Add full duplex support

Binbin Zhou (7):
      ASoC: loongson: Use BIT() macro
      ASoC: loongson: Simplify probe() with local dev variable
      ASoC: loongson: Simplify with dev_err_probe()
      ASoC: loongson: Simplify if statment in loongson_card_hw_params()
      ASoC: loongson: Replace if with ternary operator
      ASoC: loongson: Factor out loongson_card_acpi_find_device() function
      ASoC: loongson: Factor out loongson i2s enable clock functions

Brent Lu (10):
      ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach
      ASoC: SOF: Intel: hda: support BT link mask in mach_params
      ASoC: Intel: skl_hda_dsp_generic: support BT audio offload
      ASoC: Intel: skl_hda_dsp_generic: remove hdac-hdmi support
      ASoC: Intel: skl_hda_dsp_generic: use sof_hdmi_private to init HDMI
      ASoC: Intel: board_helpers: support HDA link initialization
      ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links
      ASoC: Intel: ehl_rt5660: do not check common_hdmi_codec_drv
      ASoC: Intel: sof_pcm512x: do not check common_hdmi_codec_drv
      ASoC: SOF: Intel: hda: remove common_hdmi_codec_drv

Cezary Rojewski (14):
      ALSA: hda: Move SST device entries to AVS
      ASoC: Intel: Drop skl_machine_pdata usage
      ASoC: Intel: Remove bxt_rt298 board driver
      ASoC: Intel: Remove bxt_da7219_max98357a board driver
      ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
      ASoC: Intel: Remove kbl_rt5663_max98927 board driver
      ASoC: Intel: Remove kbl_rt5660 board driver
      ASoC: Intel: Remove kbl_da7219_max98927 board driver
      ASoC: Intel: Remove kbl_da7219_max98357a board driver
      ASoC: Intel: Remove skl_rt286 board driver
      ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
      ASoC: Intel: Remove skl_nau88l25_max98357a board driver
      ASoC: Intel: Remove skylake driver
      ASoC: Intel: avs: Enable by default for all SST configurations

Charles Keepax (3):
      ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
      ASoC: Intel: soc-acpi: adl: Add match entries for new cs42l43 laptops
      ASoC: Intel: soc-acpi: lnl: Add match entries for new cs42l43 laptops

Chen Ni (4):
      ASoC: mediatek: mt8192: remove redundant null pointer check before of_node_put
      ASoC: cs42l42: Convert comma to semicolon
      ASoC: topology-test: Convert comma to semicolon
      ASoC: Intel: skl_hda_dsp_generic: convert comma to semicolon

Christophe JAILLET (4):
      ASoC: sti-sas: Constify snd_soc_component_driver struct
      ASoC: cs43130: Constify snd_soc_component_driver struct
      ASoC: cs43130: Constify struct reg_sequence and reg_sequences
      ASoC: rt1318: Constify struct reg_sequence

Codrin Ciubotariu (5):
      ASoC: atmel: mchp-i2s-mcc: Improve maxburst calculation for better performance
      ASoC: atmel: mchp-i2s-mcc: Remove interface name from stream_name
      ASoC: atmel: mchp-pdmc: Improve maxburst calculation for better performance
      ASoC: atmel: mchp-pdmc: Add snd_soc_dai_driver name
      ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls

Colin Ian King (1):
      ASoC: codecs: wcd934x: make read-only array minCode_param static const

Dmitry Torokhov (1):
      ASoC: tas5086: use sleeping variants of gpiod API

Fabio Estevam (7):
      ASoC: fsl_audmix: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      ASoC: fsl_mqs: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      ASoC: fsl_rpmsg: Switch to RUNTIME_PM_OPS()
      ASoC: fsl_spdif: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      ASoC: fsl_ssi: Switch to SYSTEM_SLEEP_PM_OPS
      ASoC: imx-audmux: Switch to SYSTEM_SLEEP_PM_OPS
      ASoC: imx-pcm-rpmsg: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()

Frank Li (2):
      ASoC: dt-bindings: convert tlv320aic31xx.txt to yaml
      ASoC: dt-bindings: Convert tpa6130a2.txt to yaml

Fred Oh (1):
      ASoC: SOF: Intel: add PTL specific power control register

Geert Uytterhoeven (1):
      ASoC: dt-bindings: dlg,da7213: Convert to json-schema

Gustavo A. R. Silva (1):
      ASoC: SOF: sof-audio: Avoid -Wflex-array-member-not-at-end warnings

Heiko Stuebner (2):
      ASoC: dt-bindings: realtek,rt5616: document mclk clock
      ASoC: dt-bindings: realtek,rt5616: Document audio graph port

Hongbo Li (2):
      ASoC: dapm: Use IS_ERR_OR_NULL() helper function
      ASoC: adi: Use str_enabled_disabled() helper

Jens Reidel (1):
      ASoC: qcom: sm8250: enable primary mi2s

Jerome Brunet (1):
      ASoC: amlogic: do not use dpcm_playback/capture flags

Krzysztof Kozlowski (16):
      ASoC: codecs: wsa881x: Drop unused version readout
      ASoC: codecs: wsa883x: Handle reading version failure
      ASoC: codecs: wsa883x: Simplify handling variant/version
      ASoC: codecs: wsa884x: Simplify handling variant
      ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to separate binding
      ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in VI mixer
      ASoC: codecs: wsa881x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa883x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa884x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wcd938x: Drop unused defines and enums
      ASoC: codecs: wcd937x: Move max port number defines to enum
      ASoC: codecs: wcd938x: Move max port number defines to enum
      ASoC: codecs: wcd939x: Move max port number defines to enum
      ASoC: dt-bindings: samsung,odroid: drop stale clocks
      ASoC: MAINTAINERS: Drop incorrect tlv320aic31xx.txt path
      ASoC: codecs: wsa884x: Implement temperature reading and hwmon

Kuninori Morimoto (19):
      ASoC: rsnd: remove rsnd_mod_confirm_ssi() under DEBUG
      ASoC: rsnd: use pcm_dmaengine code
      ASoC: stm: use snd_pcm_direction_name()
      ASoC: sof: pcm: use snd_pcm_direction_name()
      ASoC: sof: intel: use snd_pcm_direction_name()
      ASoC: fsl: lpc3xxx-i2s: use snd_pcm_direction_name()
      ASoC: tegra: use snd_pcm_direction_name()
      ASoC: soc-pcm: use snd_pcm_direction_name()
      ASoC: soc-dapm: use snd_pcm_direction_name()
      ASoC: remove bespoke trigger support
      ASoC: soc-pcm: remove snd_soc_dpcm_stream_{lock/unlock}_irq()
      ASoC: soc-pcm: remove snd_soc_dpcm_stream_lock_irqsave_nested()
      ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
      ASoC: remove snd_soc_dai_link_set_capabilities()
      ASoC: Intel: sof_sdw: use playback/capture_only flags
      ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
      ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function
      ASoC: makes rtd->initialized bit field
      ASoC: dt-bindings: renesas,rsnd: add post-init-providers property

Linus Walleij (3):
      ASoC: tas2781-i2c: Drop weird GPIO code
      ASoC: tas2781-i2c: Get the right GPIO line
      ASoC: tas*: Drop unused GPIO includes

Liu Jing (1):
      ASoC: mediatek: mt2701-cs42448: Optimize redundant code in mt2701_cs42448_machine_probe

Luca Ceresoli (3):
      ASoC: dapm-graph: remove the "ROOT" cluster
      ASoC: dapm-graph: visualize component On/Off bias level
      ASoC: dapm-graph: show path name for non-static routes

Lukasz Majewski (1):
      ASoC: dt-bindings: Convert mxs-saif.txt to fsl,saif.yaml (imx28 saif)

Ma Ke (2):
      ASoC: rt5682s: Return devm_of_clk_add_hw_provider to transfer the error
      ASoC: rt5682: Return devm_of_clk_add_hw_provider to transfer the error

Maciej Strozek (1):
      ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops

Marek Vasut (1):
      ASoC: tlv320aic32x4: Add multi endpoint support

Mark Brown (37):
      Add HDMI Audio support
      ASoC: codecs: wsa88xx: Few cleanups
      ASoC: codecs: wsa88xx and wcd93xx: Soundwire port
      AMD SOF based generic SoundWire machine driver
      ALSA/ASoC: use snd_pcm_direction_name()
      ASoC: SOF: reshuffle and optimize structures
      ASoC/SOF/PCI/Intel: add PantherLake support
      ASoC: Merge fixes
      ASoC: tas*: Fix up GPIO usage
      ASoC: Intel: Remove skylake driver
      ALSA/ASoC/SoundWire: Intel: update maximum number
      ASoC: Merge up fixes
      ASoC: grace time for DPCM cleanup
      ASoC: Merge up fixes
      ASoC: dapm-graph: add component on/off and route names
      Add SOF support for ACP7.0 based platform
      ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local
      ASoC: Intel: boards: updates for 6.12
      ASoC: dt-bindings: amlogic-sound-cards: document
      Add audio support for the MediaTek Genio 350-evk
      Fixes for the audio setup on the rk3588-nanopc-t6
      Add i2s/tdm support for acp7.0 and acp7.1 platforms
      Some clean up with helper fucntion
      Add audio support for the MediaTek Genio 350-evk
      ASoC: mt8365: Open code BIT() to avoid spurious warnings
      ASoC: mt8365: Remove spurious unsigned long casts
      ASoC: mt8365: Remove unused prototype for mt8365_afe_clk_group_48k()
      ASoC: mt8365: Make non-exported functions static
      ASoC: mt8365: Remove unused variables
      ASoC: mt8365: Remove unused DMIC IIR coefficient configuration
      ASoC: mt8365: Allow build coverage
      ASoC: loongson: Simplify code formatting
      ASoC: mt8365: Fix -Werror builds
      Add support for primary mi2s on SM8250
      ASoC: Improvements for mchp-pdmc
      ASoC: Intel: boards: updates for 6.12 - part 2
      AMD SoundWire machine driver code refactor

Muhammad Usama Anjum (3):
      ASoC: amd: acp: Return in-case of error
      ASoC: mediatek: mt8365: check validity before usage of i2s_data
      ASoc: mediatek: mt8365: Remove unneeded assignment

Neil Armstrong (2):
      ASoC: dt-bindings: amlogic,axg-sound-card: document clocks property
      ASoC: dt-bindings: amlogic,gx-sound-card: document clocks property

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

Nikita Shubin (1):
      ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema

Pierre-Louis Bossart (11):
      ASoC: Intel: soc-acpi: add PTL match tables
      ASoC: SOF: Intel: add initial support for PTL
      ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
      ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
      ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
      ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
      ALSA/ASoC/SoundWire: Intel: use single definition for SDW_INTEL_MAX_LINKS
      soundwire: intel: add probe-time check on link id
      soundwire: intel: increase maximum number of links
      ASoC: Intel: sof_sdw: make sof_sdw_quirk static
      ASoC: Intel: boards: always check the result of acpi_dev_get_first_match_dev()

Richard Fitzgerald (2):
      ASoC: cs35l56: Make struct regmap_config const
      ASoC: cs-amp-lib: Add KUnit test case for empty calibration entries

Rob Herring (Arm) (2):
      ASoC: Use of_property_present()
      ASoC: Use of_property_read_bool()

Romain Gantois (1):
      ASoC: tlv320aic31xx: Add support for loading filter coefficients

Shen Lichuan (1):
      ASoC: SOF: topology: Use kmemdup_array instead of kmemdup for multiple allocation

Shenghao Ding (7):
      ASoC: tas2781: Add TAS2563 into the Header
      ASoC: tas2781: Fix a compiling warning reported by robot kernel test due to adding tas2563_dvc_table
      ASoc: tas2781: Rename dai_driver name to unify the name between TAS2563 and TAS2781
      ASoc: tas2781: Remove unnecessary line feed and space
      ASoC: tas2781: mark const variables tas2563_dvc_table as __maybe_unused
      ASoC: tas2781: replace devm_kzalloc and scnprintf with devm_kstrdup
      ASoC: tas2781: Add Calibration Kcontrols for Chromebook

Shuming Fan (1):
      ASoC: rt1320: Add support for version C

Simon Trimmer (1):
      ASoC: cs35l56: Use regmap_read_bypassed() to wake the device

Srinivas Kandagatla (1):
      ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250

Takashi Iwai (1):
      ASoC: Use __counted_by() annotation for snd_soc_pcm_runtime

Tang Bin (6):
      ASoC: loongson: remove redundant variable assignments
      ASoC: codecs: fix the right check and simplify code
      ASoC: soc-ac97: Fix the incorrect description
      ASoC: loongson: Add the correct judgement return
      ASoC: mediatek: mt7986-afe-pcm: Remove redundant error message
      ASoC: topology: Fix redundant logical jump

Uwe Kleine-König (1):
      ASoC: Switch back to struct platform_driver::remove()

Venkata Prasad Potturu (12):
      ASoC: amd: acp: Refactor TDM slots selction based on acp revision id
      ASoC: amd: acp: Refactor I2S dai driver
      ASoC: amd: acp: Update pcm hardware capabilities for acp6.3 platform
      ASoC: amd: acp: Add I2S TDM support for acp6.3 platform
      ASoC: amd: acp: Update pcm hardware capabilities for acp7.0 platform
      ASoC: amd: acp: Add I2S master clock generation support for acp7.0 platform
      ASoC: amd: acp: Set i2s clock for acp7.0 platform
      ASoC: amd: acp: Modify max channels and sample rate support for acp70 dai driver
      ASoC: amd: acp: Add I2S TDM support for acp7.0 platform
      ASoC: amd: acp: Add pte configuration for ACP7.0 platform
      ASoC: amd: acp: Add i2s master clock generation support for acp7.1 platform
      ASoC: amd: acp: Add I2S TDM support for acp7.1 platform

Vijendar Mukunda (47):
      ASoC: intel: rename codec_info and dai_info structures names
      ASoC: intel: rename soundwire common header macros
      ASoC: intel: rename soundwire machine driver soc ops
      ASoC: intel: rename soundwire codec helper functions
      ASoC: intel: rename maxim codec macros
      ASoC: intel: rename ignore_pch_dmic variable name
      ASoC: intel/sdw-utils: move soundwire machine driver soc ops
      ASoC: intel: move soundwire machine driver common structures
      ASoC: intel/sdw_utils: move soundwire machine driver helper functions
      ASoC: intel/sdw_utils: move dmic codec helper function
      ASoC: intel/sdw_utils: move rtk dmic helper functions
      ASoC: intel/sdw_utils: move rt712 sdca helper functions
      ASoC: intel/sdw_utils: move rt722 sdca helper functions
      ASoC: intel: split soundwire machine driver private data
      ASoC: intel/sdw_utils: move rt5682 codec helper function
      ASoC: intel/sdw_utils: move rtk jack common helper functions
      ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
      ASoC: intel/sdw_utils: move rtk amp codec helper functions
      ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
      ASoC: intel/sdw_utils: move maxim codec helper functions
      ASoC: intel/sdw_utils: move dai id common macros
      ASoC: intel/sdw_utils: move soundwire dai type macros
      ASoC: intel/sdw_utils: move soundwire codec_info_list structure
      ASoC: intel/sdw_utils: move machine driver dai link helper functions
      ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
      ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()
      ASoC: soc-acpi: add pci revision id field in mach params structure
      ASoC: amd: acp: add soundwire machines for acp6.3 based platform
      ASoC: SOF: amd: add alternate machines for acp6.3 based platform
      ASoC: SOF: amd: update mach params subsystem_rev variable
      ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
      ASoC: amd: acp: remove MODULE_ALIAS for SoundWire machine driver
      ASoC: amd: acp: add ZSC control register programming sequence
      ASoC: SOF: amd: update conditional check for cache register update
      ASoC: amd: acp: Convert comma to semicolon
      ASoC: amd: acp: add legacy driver support for ACP7.1 based platforms
      ASoC: amd: acp: replace desc->rev check with acp pci revision id
      ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
      ASoC: amd: Add acpi machine id for acp7.0 version based platform
      ASoC: SOF: amd: add support for acp7.0 based platform
      ASoC: amd: acp: remove MODULE_ALIAS for legacy machine driver
      ASoC: amd: acp: remove MODULE_ALIAS for sof based generic machine driver
      ASoC: intel: sof_sdw: rename soundwire endpoint and dailink structures
      ASoC: intel: sof_sdw: rename soundwire parsing helper functions
      ASoC: sdw_util/intel: move soundwire endpoint and dai link structures
      ASoC: sdw_utils/intel: move soundwire endpoint parsing helper functions
      ASoC: amd: acp: refactor SoundWire machine driver code

Wu Bo (1):
      ASoC: dwc: change to use devm_clk_get_enabled() helpers

Yue Haibing (2):
      ASoC: fsl: lpc3xxx-i2s: Remove set but not used variable 'savedbitclkrate'
      ASoC: fsl: lpc3xxx: Make some symbols static

Zhang Yi (2):
      ASoC: codecs: ES8326: suspend issue
      ASoC: codecs: ES8326: input issue after init

Zhang Zekun (3):
      ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to simplify code
      ASoC: audio-graph-card2: Use helper function of_get_child_count()
      ASoC: meson: Remove unused declartion in header file

tangbin (3):
      ASoC: loongson: Remove useless variable definitions
      ASoC: loongson: remove unnecessary assignment in i2s_resume()
      ASoC: loongson: fix error release

ying zuxin (1):
      ASoC: codecs: Use devm_clk_get_enabled() helpers

 .mailmap                                           |    1 +
 .../testing/sysfs-bus-i2c-devices-turris-omnia-mcu |    6 +-
 Documentation/admin-guide/cifs/usage.rst           |    2 +-
 Documentation/admin-guide/kernel-parameters.txt    |    4 +-
 Documentation/arch/arm64/silicon-errata.rst        |   18 +
 .../devicetree/bindings/ata/rockchip,dwc-ahci.yaml |    3 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    9 +-
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   21 +
 .../bindings/sound/amlogic,axg-sound-card.yaml     |    7 +
 .../bindings/sound/amlogic,gx-sound-card.yaml      |    7 +
 .../devicetree/bindings/sound/cirrus,cs4271.yaml   |  101 +
 Documentation/devicetree/bindings/sound/cs4271.txt |   57 -
 Documentation/devicetree/bindings/sound/da7213.txt |   45 -
 .../devicetree/bindings/sound/dlg,da7213.yaml      |  103 +
 .../bindings/sound/fsl,imx-audio-es8328.yaml       |  111 +
 .../devicetree/bindings/sound/fsl,saif.yaml        |   83 +
 .../devicetree/bindings/sound/imx-audio-es8328.txt |   60 -
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  130 +
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  107 +
 .../bindings/sound/microchip,sama7g5-spdifrx.yaml  |    5 +-
 .../devicetree/bindings/sound/mxs-saif.txt         |   41 -
 .../devicetree/bindings/sound/pcm512x.txt          |   53 -
 .../bindings/sound/qcom,apq8016-sbc-sndcard.yaml   |  205 ++
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |   22 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  137 -
 .../devicetree/bindings/sound/realtek,rt5616.yaml  |   12 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |    6 +
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |    4 +
 .../devicetree/bindings/sound/samsung,odroid.yaml  |    5 -
 .../devicetree/bindings/sound/ti,pcm512x.yaml      |  101 +
 .../bindings/sound/ti,tlv320dac3100.yaml           |  127 +
 .../devicetree/bindings/sound/ti,tpa6130a2.yaml    |   55 +
 .../devicetree/bindings/sound/tlv320aic31xx.txt    |   77 -
 .../devicetree/bindings/sound/tpa6130a2.txt        |   27 -
 .../devicetree/bindings/usb/microchip,usb2514.yaml |    1 +
 Documentation/driver-api/thermal/sysfs-api.rst     |   65 +-
 Documentation/netlink/specs/ethtool.yaml           |    2 +-
 Documentation/networking/ethtool-netlink.rst       |    1 +
 .../process/embargoed-hardware-issues.rst          |  153 +-
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    4 +-
 Documentation/virt/kvm/api.rst                     |    8 +-
 Documentation/wmi/devices/msi-wmi-platform.rst     |    6 +-
 MAINTAINERS                                        |   13 +-
 Makefile                                           |    2 +-
 arch/alpha/include/asm/io.h                        |    4 +-
 arch/arm/Kconfig                                   |    4 +-
 arch/arm/boot/compressed/Makefile                  |    1 +
 arch/arm/boot/compressed/vmlinux.lds.S             |    2 +-
 arch/arm/boot/dts/arm/versatile-ab.dts             |    2 +-
 arch/arm/include/asm/stacktrace.h                  |    7 +
 arch/arm/include/asm/vmlinux.lds.h                 |    2 +-
 arch/arm/kernel/entry-armv.S                       |    3 +
 arch/arm/kernel/entry-common.S                     |    3 +
 arch/arm/kernel/module.c                           |    5 -
 arch/arm/kernel/perf_callchain.c                   |    3 +-
 arch/arm/kernel/vmlinux-xip.lds.S                  |    4 +-
 arch/arm/kernel/vmlinux.lds.S                      |    6 +-
 arch/arm/mach-alpine/alpine_cpu_pm.c               |    2 +-
 arch/arm/mach-pxa/gumstix.c                        |   11 +-
 arch/arm/mm/proc.c                                 |   20 +-
 arch/arm64/Kconfig                                 |   22 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi  |   22 -
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |    6 -
 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |    2 +
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          |    3 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |    3 +-
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts           |   25 +-
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi         |    4 +-
 arch/arm64/include/asm/cputype.h                   |    4 +
 arch/arm64/include/asm/jump_label.h                |    1 +
 arch/arm64/kernel/Makefile.syscalls                |    2 +-
 arch/arm64/kernel/cpu_errata.c                     |   11 +-
 arch/arm64/kernel/jump_label.c                     |   11 +-
 arch/loongarch/include/asm/hugetlb.h               |    4 +-
 arch/loongarch/include/asm/kfence.h                |    6 +-
 arch/loongarch/include/asm/kvm_host.h              |    2 -
 arch/loongarch/include/asm/kvm_para.h              |    4 +-
 arch/loongarch/include/asm/pgtable.h               |   48 +-
 arch/loongarch/kernel/Makefile.syscalls            |    3 +-
 arch/loongarch/kernel/efi.c                        |    6 +
 arch/loongarch/kvm/mmu.c                           |    8 +-
 arch/loongarch/mm/hugetlbpage.c                    |    6 +-
 arch/loongarch/mm/init.c                           |   10 +-
 arch/loongarch/mm/kasan_init.c                     |   10 +-
 arch/loongarch/mm/pgtable.c                        |    2 +-
 arch/parisc/Kconfig                                |    1 +
 arch/parisc/include/asm/cache.h                    |   11 +-
 arch/parisc/net/bpf_jit_core.c                     |    2 +-
 arch/riscv/kernel/Makefile.syscalls                |    2 +-
 arch/riscv/kernel/cpufeature.c                     |   14 +-
 arch/riscv/kernel/sbi-ipi.c                        |    2 +-
 arch/riscv/mm/fault.c                              |   17 +-
 arch/riscv/mm/init.c                               |   15 +-
 arch/riscv/purgatory/entry.S                       |    2 +
 arch/s390/kernel/alternative.h                     |    0
 arch/s390/kernel/fpu.c                             |    2 +-
 arch/s390/kernel/vmlinux.lds.S                     |   17 +-
 arch/s390/mm/dump_pagetables.c                     |  140 +-
 arch/s390/mm/init.c                                |    9 +-
 arch/s390/mm/vmem.c                                |   13 +-
 arch/um/drivers/mconsole_user.c                    |    2 +
 arch/x86/coco/sev/core.c                           |    2 +-
 arch/x86/entry/syscalls/syscall_64.tbl             |    2 +-
 arch/x86/events/core.c                             |   22 +-
 arch/x86/events/intel/cstate.c                     |    5 +-
 arch/x86/include/asm/cmdline.h                     |    4 +
 arch/x86/include/asm/kvm_host.h                    |    1 +
 arch/x86/include/asm/qspinlock.h                   |   12 +-
 arch/x86/kernel/acpi/madt_wakeup.c                 |    2 +-
 arch/x86/kernel/cpu/amd.c                          |    2 +-
 arch/x86/kernel/cpu/aperfmperf.c                   |    6 +-
 arch/x86/kernel/cpu/mtrr/mtrr.c                    |    2 +-
 arch/x86/kernel/paravirt.c                         |    7 +-
 arch/x86/kernel/setup.c                            |    2 +-
 arch/x86/kvm/Kconfig                               |    4 +-
 arch/x86/kvm/lapic.c                               |    2 +-
 arch/x86/kvm/mmu/mmu.c                             |    7 +-
 arch/x86/kvm/svm/sev.c                             |   17 +-
 arch/x86/kvm/svm/svm.c                             |    1 +
 arch/x86/kvm/x86.c                                 |   12 +-
 arch/x86/lib/cmdline.c                             |   25 +-
 arch/x86/lib/getuser.S                             |    4 +-
 arch/x86/mm/pti.c                                  |   51 +-
 block/blk-throttle.c                               |   11 -
 drivers/android/binder.c                           |   15 +-
 drivers/android/binder_alloc.c                     |    2 +-
 drivers/android/dbitmap.h                          |   22 +-
 drivers/base/core.c                                |   13 +-
 drivers/base/module.c                              |    4 +
 drivers/bluetooth/Kconfig                          |    2 +
 drivers/bluetooth/btintel.c                        |    3 +
 drivers/bluetooth/btmtk.c                          |    5 +-
 drivers/bluetooth/hci_qca.c                        |   19 +-
 drivers/cache/Kconfig                              |    1 +
 drivers/char/ds1620.c                              |    1 +
 drivers/char/nwbutton.c                            |    1 +
 drivers/char/nwflash.c                             |    1 +
 drivers/cpufreq/intel_pstate.c                     |    1 +
 drivers/edac/skx_common.h                          |    1 -
 drivers/firmware/efi/libstub/Makefile              |    7 +-
 drivers/fsi/fsi-core.c                             |    1 +
 drivers/fsi/fsi-master-aspeed.c                    |    1 +
 drivers/fsi/fsi-master-ast-cf.c                    |    3 +-
 drivers/fsi/fsi-master-gpio.c                      |    1 +
 drivers/fsi/fsi-master-hub.c                       |    1 +
 drivers/fsi/fsi-scom.c                             |    1 +
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   36 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   27 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   18 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |    3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    7 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    2 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |    1 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |    4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |    2 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    3 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h |   14 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h |   52 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   86 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    2 +-
 drivers/gpu/drm/ast/ast_dp.c                       |    7 +
 drivers/gpu/drm/ast/ast_drv.c                      |    5 +
 drivers/gpu/drm/ast/ast_drv.h                      |    1 +
 drivers/gpu/drm/ast/ast_mode.c                     |   29 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   14 +-
 drivers/gpu/drm/drm_bridge_connector.c             |    8 +-
 drivers/gpu/drm/drm_buddy.c                        |   25 +-
 drivers/gpu/drm/drm_client.c                       |    2 +-
 drivers/gpu/drm/drm_client_modeset.c               |    5 +
 drivers/gpu/drm/drm_fb_helper.c                    |   11 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |    3 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   55 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   13 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   33 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   30 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    3 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |    1 +
 drivers/gpu/drm/omapdrm/Kconfig                    |    1 +
 drivers/gpu/drm/radeon/evergreen_cs.c              |    2 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |   11 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |    4 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   44 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |  121 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h         |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  127 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |   15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   40 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   62 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  502 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              |   32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  174 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |  280 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |   40 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |    3 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   15 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |    2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |    2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_client.c           |   18 +-
 drivers/hid/bpf/Kconfig                            |    2 +-
 drivers/hid/bpf/hid_bpf_struct_ops.c               |    5 +
 drivers/hid/wacom_wac.c                            |   67 +-
 drivers/hwmon/adt7475.c                            |   24 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |    5 +-
 drivers/i2c/i2c-slave-testunit.c                   |    4 +-
 drivers/i2c/i2c-smbus.c                            |   64 +-
 drivers/input/input-mt.c                           |    3 +
 drivers/input/touchscreen/cyttsp4_core.c           |    2 +-
 drivers/irqchip/irq-loongarch-cpu.c                |    6 +-
 drivers/irqchip/irq-mbigen.c                       |   20 +-
 drivers/irqchip/irq-meson-gpio.c                   |   14 +-
 drivers/irqchip/irq-pic32-evic.c                   |    6 +-
 drivers/irqchip/irq-riscv-aplic-msi.c              |   32 +-
 drivers/irqchip/irq-sun6i-r.c                      |    2 +-
 drivers/irqchip/irq-xilinx-intc.c                  |    2 +-
 drivers/media/dvb-frontends/stv0367_priv.h         |    3 +
 drivers/media/pci/intel/ipu6/Kconfig               |    3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |    8 +-
 drivers/misc/Kconfig                               |    2 +-
 drivers/misc/eeprom/ee1004.c                       |   85 +-
 drivers/net/can/usb/etas_es58x/es58x_devlink.c     |    2 +-
 drivers/net/dsa/bcm_sf2.c                          |    4 +-
 drivers/net/dsa/microchip/ksz_common.c             |   16 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   19 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c  |   16 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c |   14 +-
 drivers/net/ethernet/freescale/fec_ptp.c           |    3 +
 drivers/net/ethernet/google/gve/gve_ethtool.c      |    2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   12 +-
 drivers/net/ethernet/intel/ice/ice.h               |   11 +-
 drivers/net/ethernet/intel/ice/ice_base.c          |    4 +-
 drivers/net/ethernet/intel/ice/ice_ethtool.c       |    8 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |    4 +-
 drivers/net/ethernet/intel/ice/ice_ptp.c           |    4 +
 drivers/net/ethernet/intel/ice/ice_txrx.c          |   10 +-
 drivers/net/ethernet/intel/ice/ice_xsk.c           |  184 +-
 drivers/net/ethernet/intel/ice/ice_xsk.h           |   14 +-
 drivers/net/ethernet/intel/idpf/idpf_lib.c         |   48 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c        |   43 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |   33 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c    |    6 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c |    1 +
 .../mellanox/mlx5/core/en_accel/ipsec_offload.c    |    7 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |    7 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |    5 +-
 .../net/ethernet/mellanox/mlx5/core/irq_affinity.c |   10 +-
 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c  |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/main.c     |    2 +-
 .../ethernet/mellanox/mlx5/core/sf/dev/driver.c    |    1 +
 .../ethernet/mellanox/mlx5/core/steering/dr_rule.c |    2 +-
 drivers/net/ethernet/meta/Kconfig                  |    2 +-
 drivers/net/ethernet/realtek/r8169_main.c          |    8 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |    2 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |    2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c  |    2 +-
 drivers/net/fjes/fjes_main.c                       |    4 +-
 drivers/net/phy/aquantia/aquantia_main.c           |   29 +-
 drivers/net/phy/micrel.c                           |   34 +-
 drivers/net/phy/realtek.c                          |    7 +
 drivers/net/pse-pd/tps23881.c                      |    5 +-
 drivers/net/usb/qmi_wwan.c                         |    2 +
 drivers/net/usb/sr9700.c                           |   11 +-
 drivers/net/virtio_net.c                           |   14 +-
 drivers/net/wan/fsl_qmc_hdlc.c                     |   31 +-
 drivers/net/wireless/ath/ath12k/pci.c              |    3 +-
 drivers/net/wireless/ath/ath12k/wow.c              |    8 +-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |    1 +
 drivers/nfc/pn544/i2c.c                            |    2 -
 drivers/nvme/host/core.c                           |   18 +-
 drivers/nvme/host/nvme.h                           |   13 +-
 drivers/pci/hotplug/pciehp_hpc.c                   |    4 +-
 drivers/pci/pci.c                                  |   15 +-
 drivers/perf/riscv_pmu_sbi.c                       |    2 +-
 drivers/platform/chrome/cros_ec_proto.c            |    2 +
 drivers/platform/cznic/Kconfig                     |   80 +-
 drivers/platform/cznic/Makefile                    |    8 +-
 drivers/platform/cznic/turris-omnia-mcu-base.c     |    4 +
 drivers/platform/cznic/turris-omnia-mcu.h          |   42 +-
 drivers/platform/x86/amd/pmc/pmc.c                 |    2 +
 drivers/platform/x86/amd/pmc/pmc.h                 |    1 +
 drivers/platform/x86/amd/pmf/core.c                |    3 +
 drivers/platform/x86/amd/pmf/pmf-quirks.c          |    9 +-
 drivers/platform/x86/intel/ifs/runtest.c           |    2 +-
 drivers/platform/x86/intel/vbtn.c                  |    9 +
 drivers/platform/x86/sony-laptop.c                 |    1 -
 drivers/power/supply/axp288_charger.c              |   22 +-
 drivers/power/supply/qcom_battmgr.c                |   12 +-
 drivers/power/supply/rt5033_battery.c              |    1 +
 drivers/s390/cio/ccwgroup.c                        |    1 +
 drivers/s390/cio/vfio_ccw_drv.c                    |    1 +
 drivers/scsi/isci/init.c                           |    6 +-
 drivers/scsi/mpi3mr/mpi3mr_os.c                    |   11 +
 drivers/scsi/mpt3sas/mpt3sas_base.c                |   20 +-
 drivers/scsi/sd.c                                  |   20 +-
 drivers/scsi/sr_ioctl.c                            |    2 +-
 drivers/soundwire/intel.h                          |    7 +
 drivers/soundwire/intel_ace2x.c                    |   20 +
 drivers/soundwire/intel_auxdevice.c                |   14 +
 drivers/spi/spi-fsl-lpspi.c                        |    6 +-
 drivers/spi/spi-hisi-kunpeng.c                     |    4 +
 drivers/spi/spidev.c                               |    1 +
 drivers/spmi/spmi-pmic-arb.c                       |   11 +-
 .../pci/hive_isp_css_include/math_support.h        |    5 -
 .../int340x_thermal/processor_thermal_device_pci.c |   29 +-
 drivers/thermal/thermal_trip.c                     |    4 +-
 drivers/tty/serial/sc16is7xx.c                     |   25 +-
 drivers/tty/serial/serial_core.c                   |    8 +
 drivers/tty/vt/conmakehash.c                       |   20 +-
 drivers/ufs/core/ufshcd-priv.h                     |    5 +
 drivers/ufs/core/ufshcd.c                          |   38 +-
 drivers/ufs/host/ufs-exynos.c                      |    3 +
 drivers/usb/gadget/function/f_fs.c                 |   32 +-
 drivers/usb/gadget/function/f_midi2.c              |   21 +-
 drivers/usb/gadget/function/u_audio.c              |   42 +-
 drivers/usb/gadget/function/u_serial.c             |    1 +
 drivers/usb/gadget/udc/core.c                      |   10 +-
 drivers/usb/serial/ch341.c                         |    1 +
 drivers/usb/serial/garmin_gps.c                    |    5 +-
 drivers/usb/serial/mxuport.c                       |    1 +
 drivers/usb/serial/navman.c                        |    1 +
 drivers/usb/serial/qcaux.c                         |    1 +
 drivers/usb/serial/spcp8x5.c                       |   10 -
 drivers/usb/serial/symbolserial.c                  |    1 +
 drivers/usb/serial/usb-serial-simple.c             |    1 +
 drivers/usb/serial/usb_debug.c                     |    8 +
 drivers/usb/typec/mux/fsa4480.c                    |   14 +
 drivers/usb/typec/tcpm/tcpci.c                     |    2 +-
 drivers/usb/typec/tcpm/tcpm.c                      |    2 +-
 drivers/usb/typec/tipd/core.c                      |    4 +-
 drivers/usb/typec/ucsi/ucsi.c                      |   11 +-
 drivers/usb/usbip/vhci_hcd.c                       |    9 +-
 drivers/vdpa/octeon_ep/octep_vdpa_hw.c             |    2 +-
 drivers/vhost/vdpa.c                               |    8 +-
 drivers/virtio/virtio.c                            |   28 +-
 drivers/virtio/virtio_pci_common.c                 |  190 +-
 drivers/virtio/virtio_pci_common.h                 |   16 +-
 drivers/virtio/virtio_pci_modern.c                 |  159 +-
 fs/bcachefs/acl.c                                  |   11 +-
 fs/bcachefs/acl.h                                  |    2 +-
 fs/bcachefs/alloc_background.h                     |   12 +-
 fs/bcachefs/alloc_foreground.c                     |   34 +-
 fs/bcachefs/alloc_foreground.h                     |    9 +-
 fs/bcachefs/bcachefs.h                             |    2 +
 fs/bcachefs/bcachefs_format.h                      |    5 +-
 fs/bcachefs/btree_iter.c                           |    5 +
 fs/bcachefs/btree_update_interior.c                |    2 +-
 fs/bcachefs/buckets.c                              |   12 +-
 fs/bcachefs/buckets.h                              |    2 +-
 fs/bcachefs/disk_accounting.c                      |   65 +-
 fs/bcachefs/disk_accounting_format.h               |   15 +-
 fs/bcachefs/ec.c                                   |   34 +-
 fs/bcachefs/fs.c                                   |    8 +-
 fs/bcachefs/io_misc.c                              |    6 +-
 fs/bcachefs/io_read.c                              |    1 +
 fs/bcachefs/io_write.c                             |    5 +-
 fs/bcachefs/opts.h                                 |    5 +
 fs/bcachefs/replicas.c                             |    1 -
 fs/bcachefs/sb-downgrade.c                         |   27 +-
 fs/bcachefs/sb-errors_format.h                     |    6 +-
 fs/bcachefs/super-io.c                             |    4 +
 fs/bcachefs/super.c                                |    1 -
 fs/bcachefs/sysfs.c                                |    6 +-
 fs/btrfs/block-group.c                             |   13 +-
 fs/btrfs/ctree.h                                   |    1 +
 fs/btrfs/direct-io.c                               |   38 +-
 fs/btrfs/extent-tree.c                             |    3 +-
 fs/btrfs/extent_map.c                              |    2 +-
 fs/btrfs/file.c                                    |   22 +-
 fs/btrfs/free-space-cache.c                        |    4 +-
 fs/btrfs/inode.c                                   |   28 +-
 fs/btrfs/print-tree.c                              |    2 +-
 fs/btrfs/scrub.c                                   |   25 +-
 fs/btrfs/space-info.c                              |    5 +-
 fs/btrfs/space-info.h                              |    1 +
 fs/btrfs/super.c                                   |    5 +-
 fs/btrfs/tests/extent-map-tests.c                  |   99 +
 fs/btrfs/tree-checker.c                            |   49 +-
 fs/ceph/caps.c                                     |   35 +-
 fs/ceph/super.h                                    |    7 +-
 fs/file.c                                          |    1 +
 fs/nfsd/nfsctl.c                                   |    3 +-
 fs/smb/client/cifs_debug.c                         |    2 +-
 fs/smb/client/cifsfs.h                             |    4 +-
 fs/smb/client/cifsglob.h                           |   36 +-
 fs/smb/client/cifsproto.h                          |    2 -
 fs/smb/client/inode.c                              |   17 +-
 fs/smb/client/ioctl.c                              |   32 +-
 fs/smb/client/misc.c                               |   65 +-
 fs/smb/client/reparse.c                            |    4 +
 fs/smb/client/reparse.h                            |   19 +-
 fs/smb/client/smb2inode.c                          |    8 +-
 fs/smb/client/smb2pdu.c                            |    3 +
 fs/smb/client/smbdirect.c                          |    8 +-
 fs/smb/client/trace.h                              |   51 +-
 fs/smb/client/transport.c                          |    2 +-
 fs/tracefs/event_inode.c                           |    4 +-
 fs/tracefs/inode.c                                 |   12 +-
 fs/tracefs/internal.h                              |    5 +-
 fs/xfs/libxfs/xfs_quota_defs.h                     |    2 +-
 fs/xfs/libxfs/xfs_trans_resv.c                     |   28 +-
 fs/xfs/scrub/agheader_repair.c                     |    2 +-
 fs/xfs/scrub/parent.c                              |    2 +-
 fs/xfs/scrub/trace.h                               |   10 +-
 fs/xfs/xfs_attr_list.c                             |    2 +-
 fs/xfs/xfs_trace.h                                 |   10 +-
 fs/xfs/xfs_xattr.c                                 |   19 +-
 include/asm-generic/vmlinux.lds.h                  |   11 +-
 include/drm/drm_buddy.h                            |    2 +
 include/linux/compiler.h                           |    9 +
 include/linux/cpuhotplug.h                         |    2 +-
 include/linux/cpumask.h                            |    2 +-
 include/linux/ethtool.h                            |   10 +-
 include/linux/i2c.h                                |    2 +-
 include/linux/kvm_host.h                           |    9 +-
 include/linux/minmax.h                             |  115 +-
 include/linux/profile.h                            |    1 -
 include/linux/ring_buffer.h                        |    1 -
 include/linux/soundwire/sdw_intel.h                |    8 +
 include/linux/trace_events.h                       |    3 +-
 include/linux/virtio.h                             |    3 +
 include/linux/virtio_config.h                      |    4 -
 include/linux/virtio_net.h                         |   16 +-
 include/sound/cs35l56.h                            |    6 +-
 include/sound/soc-acpi-intel-match.h               |    2 +
 include/sound/soc-acpi.h                           |    6 +-
 include/sound/soc-dai.h                            |    6 +-
 include/sound/soc-dpcm.h                           |   19 -
 include/sound/soc.h                                |    7 +-
 include/sound/soc_sdw_utils.h                      |  247 ++
 include/sound/tas2563-tlv.h                        |  279 ++
 include/sound/tas2781-tlv.h                        |  260 --
 include/sound/tas2781.h                            |   71 +-
 include/sound/ump_convert.h                        |    1 +
 include/trace/events/btrfs.h                       |    8 +
 include/trace/events/mptcp.h                       |    2 +-
 include/uapi/asm-generic/unistd.h                  |    5 +-
 include/ufs/ufshcd.h                               |    1 +
 include/ufs/ufshci.h                               |    1 +
 init/Kconfig                                       |    1 +
 io_uring/napi.c                                    |    2 -
 io_uring/net.c                                     |    7 +-
 io_uring/poll.c                                    |    1 +
 kernel/dma/debug.c                                 |    5 +-
 kernel/irq/irqdesc.c                               |    1 +
 kernel/jump_label.c                                |    4 +-
 kernel/kcov.c                                      |   15 +-
 kernel/kprobes.c                                   |    4 +-
 kernel/ksysfs.c                                    |    7 +
 kernel/locking/lockdep.c                           |    6 +
 kernel/locking/qspinlock_paravirt.h                |    2 +-
 kernel/module/main.c                               |   41 +-
 kernel/padata.c                                    |    7 +
 kernel/profile.c                                   |  242 +-
 kernel/sched/core.c                                |   68 +-
 kernel/sched/cputime.c                             |    6 +
 kernel/sched/stats.c                               |   10 -
 kernel/task_work.c                                 |    6 +
 kernel/time/clocksource.c                          |    2 +-
 kernel/time/ntp.c                                  |    9 +-
 kernel/time/tick-broadcast.c                       |    3 +-
 kernel/time/timekeeping.c                          |    2 +-
 kernel/trace/fgraph.c                              |    2 +-
 kernel/trace/preemptirq_delay_test.c               |    2 -
 kernel/trace/ring_buffer.c                         |   12 -
 kernel/trace/trace.h                               |   23 +
 kernel/trace/trace_events.c                        |   41 +-
 kernel/trace/trace_events_hist.c                   |    4 +-
 kernel/trace/trace_events_inject.c                 |    2 +-
 kernel/trace/trace_events_trigger.c                |    6 +-
 kernel/trace/tracing_map.c                         |    6 +-
 lib/btree.c                                        |    1 -
 lib/decompress_unlzma.c                            |    2 +
 lib/vsprintf.c                                     |    2 +-
 mm/list_lru.c                                      |   28 +-
 mm/memcontrol.c                                    |   22 +-
 mm/shmem.c                                         |   14 +-
 mm/slub.c                                          |    3 +
 mm/zsmalloc.c                                      |    2 -
 net/bluetooth/hci_core.c                           |    7 -
 net/bluetooth/hci_event.c                          |    5 +-
 net/bluetooth/hci_sync.c                           |   35 +
 net/bluetooth/l2cap_core.c                         |    1 +
 net/bridge/br_multicast.c                          |    4 +-
 net/core/dev.c                                     |    1 +
 net/core/link_watch.c                              |    4 +-
 net/core/rtnetlink.c                               |    2 +-
 net/ethtool/ioctl.c                                |   61 +-
 net/ethtool/rss.c                                  |    8 +-
 net/ipv4/netfilter/iptable_nat.c                   |   18 +-
 net/ipv4/tcp_ao.c                                  |   43 +-
 net/ipv4/tcp_input.c                               |   23 +-
 net/ipv4/tcp_offload.c                             |    3 +
 net/ipv4/udp_offload.c                             |    4 +
 net/ipv6/ndisc.c                                   |   34 +-
 net/ipv6/netfilter/ip6table_nat.c                  |   14 +-
 net/iucv/af_iucv.c                                 |    4 +-
 net/l2tp/l2tp_core.c                               |   15 +-
 net/mac80211/cfg.c                                 |    7 +-
 net/mac80211/tx.c                                  |    5 +-
 net/mac80211/util.c                                |    2 +-
 net/mptcp/mib.c                                    |    2 +
 net/mptcp/mib.h                                    |    2 +
 net/mptcp/options.c                                |    5 +-
 net/mptcp/pm.c                                     |   12 +
 net/mptcp/pm_netlink.c                             |   93 +-
 net/mptcp/pm_userspace.c                           |   18 +
 net/mptcp/protocol.c                               |   18 +-
 net/mptcp/protocol.h                               |    4 +
 net/mptcp/subflow.c                                |   26 +-
 net/sched/act_ct.c                                 |    4 +-
 net/sctp/input.c                                   |   19 +-
 net/smc/af_smc.c                                   |    7 +-
 net/smc/smc_stats.h                                |    2 +-
 net/sunrpc/svc.c                                   |    2 +-
 net/wireless/scan.c                                |   11 +-
 net/wireless/sme.c                                 |    1 +
 rust/kernel/firmware.rs                            |    2 +-
 scripts/syscall.tbl                                |    6 +-
 sound/core/seq/seq_ports.h                         |   14 +-
 sound/core/seq/seq_ump_convert.c                   |  132 +-
 sound/core/ump_convert.c                           |   60 +-
 sound/firewire/amdtp-stream.c                      |   38 +-
 sound/firewire/amdtp-stream.h                      |    1 +
 sound/hda/intel-dsp-config.c                       |   57 +-
 sound/hda/intel-sdw-acpi.c                         |    5 +-
 sound/pci/hda/cs35l41_hda.c                        |   13 -
 sound/pci/hda/cs35l56_hda.c                        |   38 +-
 sound/pci/hda/cs35l56_hda.h                        |    1 -
 sound/pci/hda/hda_controller.h                     |    2 +-
 sound/pci/hda/hda_generic.c                        |   63 +
 sound/pci/hda/hda_generic.h                        |    1 +
 sound/pci/hda/hda_intel.c                          |   10 +-
 sound/pci/hda/patch_conexant.c                     |   56 +-
 sound/pci/hda/patch_hdmi.c                         |    2 +
 sound/pci/hda/patch_realtek.c                      |    2 +
 sound/pci/hda/tas2781_hda_i2c.c                    |    2 +-
 sound/soc/Kconfig                                  |    2 +
 sound/soc/Makefile                                 |    1 +
 sound/soc/adi/axi-i2s.c                            |    6 +-
 sound/soc/adi/axi-spdif.c                          |    2 +-
 sound/soc/amd/acp-config.c                         |   12 +
 sound/soc/amd/acp-pcm-dma.c                        |    2 +-
 sound/soc/amd/acp/Kconfig                          |   22 +
 sound/soc/amd/acp/Makefile                         |    4 +
 sound/soc/amd/acp/acp-i2s.c                        |  188 +-
 sound/soc/amd/acp/acp-legacy-common.c              |   40 +-
 sound/soc/amd/acp/acp-legacy-mach.c                |    7 -
 sound/soc/amd/acp/acp-mach-common.c                |    2 +-
 sound/soc/amd/acp/acp-mach.h                       |    1 +
 sound/soc/amd/acp/acp-pci.c                        |    4 +
 sound/soc/amd/acp/acp-pdm.c                        |    7 +-
 sound/soc/amd/acp/acp-platform.c                   |  117 +-
 sound/soc/amd/acp/acp-rembrandt.c                  |    2 +-
 sound/soc/amd/acp/acp-renoir.c                     |    2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |  509 +++
 sound/soc/amd/acp/acp-sof-mach.c                   |    7 -
 sound/soc/amd/acp/acp63.c                          |    2 +-
 sound/soc/amd/acp/acp70.c                          |   87 +-
 sound/soc/amd/acp/amd-acp63-acpi-match.c           |   90 +
 sound/soc/amd/acp/amd.h                            |   27 +-
 sound/soc/amd/acp/chip_offset_byte.h               |   84 +-
 sound/soc/amd/acp/soc_amd_sdw_common.h             |   44 +
 sound/soc/amd/mach-config.h                        |    2 +
 sound/soc/amd/ps/ps-pdm-dma.c                      |    2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |    2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |    2 +-
 sound/soc/apple/mca.c                              |    2 +-
 sound/soc/atmel/atmel-i2s.c                        |    2 +-
 sound/soc/atmel/atmel_wm8904.c                     |    2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   44 +-
 sound/soc/atmel/mchp-pdmc.c                        |   99 +-
 sound/soc/atmel/mchp-spdifrx.c                     |    2 +-
 sound/soc/atmel/mchp-spdiftx.c                     |    2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |    2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |    2 +-
 sound/soc/au1x/ac97c.c                             |    2 +-
 sound/soc/au1x/i2sc.c                              |    2 +-
 sound/soc/au1x/psc-ac97.c                          |    2 +-
 sound/soc/au1x/psc-i2s.c                           |    2 +-
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |    2 +-
 sound/soc/bcm/cygnus-ssp.c                         |    2 +-
 sound/soc/cirrus/edb93xx.c                         |    2 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |    2 +-
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/ak4613.c                          |    4 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |   44 +
 sound/soc/codecs/cs35l56-shared.c                  |   25 +-
 sound/soc/codecs/cs42l42-sdw.c                     |   12 +-
 sound/soc/codecs/cs42l43.c                         |    2 +-
 sound/soc/codecs/cs43130.c                         |  113 +-
 sound/soc/codecs/cs47l15.c                         |    2 +-
 sound/soc/codecs/cs47l24.c                         |    2 +-
 sound/soc/codecs/cs47l35.c                         |    2 +-
 sound/soc/codecs/cs47l85.c                         |    2 +-
 sound/soc/codecs/cs47l90.c                         |    2 +-
 sound/soc/codecs/cs47l92.c                         |    2 +-
 sound/soc/codecs/es8326.c                          |    6 +-
 sound/soc/codecs/inno_rk3036.c                     |    2 +-
 sound/soc/codecs/lpass-rx-macro.c                  |    2 +-
 sound/soc/codecs/lpass-tx-macro.c                  |    2 +-
 sound/soc/codecs/lpass-va-macro.c                  |    2 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   27 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |    2 +-
 sound/soc/codecs/mt6357.c                          | 1855 ++++++++++
 sound/soc/codecs/mt6357.h                          |  660 ++++
 sound/soc/codecs/peb2466.c                         |   14 +-
 sound/soc/codecs/rk817_codec.c                     |    2 +-
 sound/soc/codecs/rt1318.c                          |    3 +-
 sound/soc/codecs/rt1320-sdw.c                      | 2147 +++++++++++-
 sound/soc/codecs/rt1320-sdw.h                      |    3 +
 sound/soc/codecs/rt5682.c                          |    4 +-
 sound/soc/codecs/rt5682s.c                         |    4 +-
 sound/soc/codecs/sti-sas.c                         |   21 +-
 sound/soc/codecs/tas2552.c                         |    1 -
 sound/soc/codecs/tas2764.c                         |    1 -
 sound/soc/codecs/tas2770.c                         |    1 -
 sound/soc/codecs/tas2780.c                         |    1 -
 sound/soc/codecs/tas2781-comlib.c                  |   35 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   61 +-
 sound/soc/codecs/tas2781-i2c.c                     |  953 +++++-
 sound/soc/codecs/tas5086.c                         |    9 +-
 sound/soc/codecs/tlv320aic31xx.c                   |  102 +-
 sound/soc/codecs/tlv320aic32x4.c                   |    9 +
 sound/soc/codecs/wcd934x.c                         |    4 +-
 sound/soc/codecs/wcd937x.c                         |    2 +-
 sound/soc/codecs/wcd937x.h                         |   34 +-
 sound/soc/codecs/wcd938x.c                         |   20 +-
 sound/soc/codecs/wcd938x.h                         |    4 +-
 sound/soc/codecs/wcd939x.c                         |    2 +-
 sound/soc/codecs/wcd939x.h                         |    6 +-
 sound/soc/codecs/wm5102.c                          |    2 +-
 sound/soc/codecs/wm5110.c                          |    2 +-
 sound/soc/codecs/wm8994.c                          |    2 +-
 sound/soc/codecs/wm8997.c                          |    2 +-
 sound/soc/codecs/wm8998.c                          |    2 +-
 sound/soc/codecs/wsa881x.c                         |   44 +-
 sound/soc/codecs/wsa883x.c                         |   75 +-
 sound/soc/codecs/wsa884x.c                         |  240 +-
 sound/soc/dwc/dwc-i2s.c                            |   18 +-
 sound/soc/fsl/fsl_asrc.c                           |    2 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    2 +-
 sound/soc/fsl/fsl_audmix.c                         |   14 +-
 sound/soc/fsl/fsl_dma.c                            |    2 +-
 sound/soc/fsl/fsl_easrc.c                          |    2 +-
 sound/soc/fsl/fsl_esai.c                           |    2 +-
 sound/soc/fsl/fsl_micfil.c                         |    2 +-
 sound/soc/fsl/fsl_mqs.c                            |   13 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   11 +-
 sound/soc/fsl/fsl_sai.c                            |    2 +-
 sound/soc/fsl/fsl_spdif.c                          |   13 +-
 sound/soc/fsl/fsl_ssi.c                            |    8 +-
 sound/soc/fsl/fsl_xcvr.c                           |    2 +-
 sound/soc/fsl/imx-audmux.c                         |    8 +-
 sound/soc/fsl/imx-card.c                           |    3 -
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   16 +-
 sound/soc/fsl/imx-sgtl5000.c                       |    2 +-
 sound/soc/fsl/lpc3xxx-i2s.c                        |   11 +-
 sound/soc/fsl/lpc3xxx-pcm.c                        |    2 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |    2 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |    4 +-
 sound/soc/fsl/p1022_ds.c                           |    2 +-
 sound/soc/fsl/p1022_rdk.c                          |    2 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |    2 +-
 sound/soc/generic/audio-graph-card.c               |   16 +-
 .../soc/generic/audio-graph-card2-custom-sample.c  |    2 +-
 sound/soc/generic/audio-graph-card2.c              |   15 +-
 sound/soc/generic/simple-card.c                    |    4 +-
 sound/soc/generic/test-component.c                 |   11 +-
 sound/soc/img/img-i2s-in.c                         |    2 +-
 sound/soc/img/img-i2s-out.c                        |    2 +-
 sound/soc/img/img-parallel-out.c                   |    2 +-
 sound/soc/img/img-spdif-in.c                       |    2 +-
 sound/soc/img/img-spdif-out.c                      |    2 +-
 sound/soc/img/pistachio-internal-dac.c             |    2 +-
 sound/soc/intel/Kconfig                            |  120 -
 sound/soc/intel/Makefile                           |    1 -
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    2 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |    2 +-
 sound/soc/intel/avs/core.c                         |    8 +-
 sound/soc/intel/boards/Kconfig                     |  156 +-
 sound/soc/intel/boards/Makefile                    |   31 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |  720 ----
 sound/soc/intel/boards/bxt_rt298.c                 |  670 ----
 sound/soc/intel/boards/bytcht_cx2072x.c            |    4 +
 sound/soc/intel/boards/bytcht_da7213.c             |    4 +
 sound/soc/intel/boards/bytcht_es8316.c             |    4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    4 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    4 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    4 +
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    4 +
 sound/soc/intel/boards/ehl_rt5660.c                |    3 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |  688 ----
 sound/soc/intel/boards/kbl_da7219_max98927.c       | 1175 -------
 sound/soc/intel/boards/kbl_rt5660.c                |  567 ---
 sound/soc/intel/boards/kbl_rt5663_max98927.c       | 1073 ------
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  869 -----
 sound/soc/intel/boards/skl_hda_dsp_common.c        |  168 -
 sound/soc/intel/boards/skl_hda_dsp_common.h        |   67 -
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |  242 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  704 ----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  751 ----
 sound/soc/intel/boards/skl_rt286.c                 |  568 ---
 sound/soc/intel/boards/sof_board_helpers.c         |  152 +
 sound/soc/intel/boards/sof_board_helpers.h         |    3 +
 sound/soc/intel/boards/sof_es8336.c                |   14 +-
 sound/soc/intel/boards/sof_pcm512x.c               |    5 +-
 sound/soc/intel/boards/sof_rt5682.c                |    7 +
 sound/soc/intel/boards/sof_sdw.c                   | 1384 +-------
 sound/soc/intel/boards/sof_sdw_common.h            |  172 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c              |   16 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |    6 +
 sound/soc/intel/boards/sof_wm8804.c                |    6 +-
 sound/soc/intel/catpt/device.c                     |    2 +-
 sound/soc/intel/common/Makefile                    |    1 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |  105 +
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  263 ++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |    6 -
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |    1 -
 sound/soc/intel/common/soc-acpi-intel-hda-match.c  |   18 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |    6 -
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |   11 -
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  104 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  145 +
 sound/soc/intel/common/soc-acpi-intel-skl-match.c  |    5 -
 sound/soc/intel/skylake/Makefile                   |   15 -
 sound/soc/intel/skylake/bxt-sst.c                  |  629 ----
 sound/soc/intel/skylake/cnl-sst-dsp.c              |  266 --
 sound/soc/intel/skylake/cnl-sst-dsp.h              |  103 -
 sound/soc/intel/skylake/cnl-sst.c                  |  508 ---
 sound/soc/intel/skylake/skl-debug.c                |  248 --
 sound/soc/intel/skylake/skl-i2s.h                  |   87 -
 sound/soc/intel/skylake/skl-messages.c             | 1419 --------
 sound/soc/intel/skylake/skl-nhlt.c                 |  269 --
 sound/soc/intel/skylake/skl-pcm.c                  | 1507 --------
 sound/soc/intel/skylake/skl-ssp-clk.c              |  428 ---
 sound/soc/intel/skylake/skl-ssp-clk.h              |  108 -
 sound/soc/intel/skylake/skl-sst-cldma.c            |  373 --
 sound/soc/intel/skylake/skl-sst-cldma.h            |  243 --
 sound/soc/intel/skylake/skl-sst-dsp.c              |  462 ---
 sound/soc/intel/skylake/skl-sst-dsp.h              |  256 --
 sound/soc/intel/skylake/skl-sst-ipc.c              | 1071 ------
 sound/soc/intel/skylake/skl-sst-ipc.h              |  169 -
 sound/soc/intel/skylake/skl-sst-utils.c            |  425 ---
 sound/soc/intel/skylake/skl-sst.c                  |  599 ----
 sound/soc/intel/skylake/skl-topology.c             | 3605 --------------------
 sound/soc/intel/skylake/skl-topology.h             |  524 ---
 sound/soc/intel/skylake/skl.c                      | 1177 -------
 sound/soc/intel/skylake/skl.h                      |  207 --
 sound/soc/kirkwood/kirkwood-i2s.c                  |    2 +-
 sound/soc/loongson/loongson_card.c                 |  125 +-
 sound/soc/loongson/loongson_dma.c                  |   25 +-
 sound/soc/loongson/loongson_i2s.c                  |  115 +-
 sound/soc/loongson/loongson_i2s.h                  |   24 +-
 sound/soc/loongson/loongson_i2s_pci.c              |   51 +-
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |    2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |   16 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c         |    9 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |    2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |    4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  421 +++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   32 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  448 +++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2274 ++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  311 ++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  310 ++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  846 +++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 ++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  343 ++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  993 ++++++
 sound/soc/meson/aiu-fifo.h                         |    2 -
 sound/soc/meson/aiu.c                              |    2 +-
 sound/soc/meson/axg-card.c                         |   13 +-
 sound/soc/meson/gx-card.c                          |    3 +-
 sound/soc/meson/meson-card-utils.c                 |    4 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |    2 +-
 sound/soc/pxa/mmp-sspa.c                           |    2 +-
 sound/soc/pxa/pxa2xx-ac97.c                        |    2 +-
 sound/soc/qcom/common.c                            |    1 -
 sound/soc/qcom/lpass-apq8016.c                     |    2 +-
 sound/soc/qcom/lpass-ipq806x.c                     |    2 +-
 sound/soc/qcom/lpass-sc7180.c                      |    2 +-
 sound/soc/qcom/lpass-sc7280.c                      |    2 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |    2 +-
 sound/soc/qcom/sm8250.c                            |    8 +
 sound/soc/rockchip/rockchip_i2s.c                  |    2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |    2 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    2 +-
 sound/soc/rockchip/rockchip_rt5645.c               |    2 +-
 sound/soc/rockchip/rockchip_spdif.c                |    2 +-
 sound/soc/samsung/arndale.c                        |    2 +-
 sound/soc/samsung/i2s.c                            |    2 +-
 sound/soc/samsung/odroid.c                         |    2 +-
 sound/soc/samsung/pcm.c                            |    2 +-
 sound/soc/samsung/snow.c                           |    2 +-
 sound/soc/samsung/spdif.c                          |    2 +-
 sound/soc/sdw_utils/Kconfig                        |    6 +
 sound/soc/sdw_utils/Makefile                       |   11 +
 .../soc_sdw_bridge_cs35l56.c}                      |   56 +-
 .../soc_sdw_cs42l42.c}                             |   13 +-
 .../soc_sdw_cs42l43.c}                             |   38 +-
 .../soc_sdw_cs_amp.c}                              |   18 +-
 .../sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c}    |   10 +-
 .../sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c}  |   56 +-
 .../soc_sdw_rt5682.c}                              |   12 +-
 .../sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c}  |   12 +-
 .../sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c}  |   38 +-
 .../soc_sdw_rt712_sdca.c}                          |   10 +-
 .../soc_sdw_rt722_sdca.c}                          |   10 +-
 .../soc_sdw_rt_amp.c}                              |   43 +-
 .../soc_sdw_rt_amp_coeff_tables.h}                 |    6 +-
 .../soc_sdw_rt_dmic.c}                             |   11 +-
 .../soc_sdw_rt_sdca_jack_common.c}                 |   40 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                | 1170 +++++++
 sound/soc/sh/Kconfig                               |    1 +
 sound/soc/sh/fsi.c                                 |    2 +-
 sound/soc/sh/hac.c                                 |    2 +-
 sound/soc/sh/rcar/adg.c                            |    4 +-
 sound/soc/sh/rcar/core.c                           |   19 +-
 sound/soc/sh/rcar/dma.c                            |   75 +-
 sound/soc/sh/rcar/rsnd.h                           |   10 -
 sound/soc/sh/rcar/ssi.c                            |    2 +-
 sound/soc/sh/rz-ssi.c                              |  259 +-
 sound/soc/sh/siu_dai.c                             |    2 +-
 sound/soc/soc-ac97.c                               |    4 +-
 sound/soc/soc-core.c                               |   21 +-
 sound/soc/soc-dai.c                                |   58 -
 sound/soc/soc-dapm.c                               |    5 +-
 sound/soc/soc-pcm.c                                |  362 +-
 sound/soc/soc-topology-test.c                      |  132 +-
 sound/soc/soc-topology.c                           |    9 +-
 sound/soc/sof/amd/Kconfig                          |   11 +
 sound/soc/sof/amd/Makefile                         |    4 +-
 sound/soc/sof/amd/acp-common.c                     |    3 +
 sound/soc/sof/amd/acp-dsp-offset.h                 |   24 +-
 sound/soc/sof/amd/acp-loader.c                     |    2 +-
 sound/soc/sof/amd/acp.c                            |   88 +-
 sound/soc/sof/amd/acp.h                            |   11 +-
 sound/soc/sof/amd/acp70.c                          |  142 +
 sound/soc/sof/amd/pci-acp63.c                      |    2 +-
 sound/soc/sof/amd/pci-acp70.c                      |  112 +
 sound/soc/sof/amd/pci-rmb.c                        |    1 -
 sound/soc/sof/amd/pci-rn.c                         |    1 -
 sound/soc/sof/amd/pci-vangogh.c                    |    1 -
 sound/soc/sof/imx/imx8.c                           |    2 +-
 sound/soc/sof/imx/imx8m.c                          |    2 +-
 sound/soc/sof/imx/imx8ulp.c                        |    2 +-
 sound/soc/sof/intel/Kconfig                        |   17 +
 sound/soc/sof/intel/Makefile                       |    2 +
 sound/soc/sof/intel/bdw.c                          |    2 +-
 sound/soc/sof/intel/byt.c                          |    2 +-
 sound/soc/sof/intel/hda-dsp.c                      |    1 +
 sound/soc/sof/intel/hda-stream.c                   |    4 +-
 sound/soc/sof/intel/hda.c                          |  282 +-
 sound/soc/sof/intel/hda.h                          |    1 +
 sound/soc/sof/intel/lnl.c                          |   27 +
 sound/soc/sof/intel/mtl.c                          |   16 +-
 sound/soc/sof/intel/mtl.h                          |    2 +
 sound/soc/sof/intel/pci-ptl.c                      |   77 +
 sound/soc/sof/intel/shim.h                         |    1 +
 sound/soc/sof/mediatek/mt8186/mt8186.c             |    2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |    2 +-
 sound/soc/sof/pcm.c                                |    2 +-
 sound/soc/sof/sof-audio.h                          |    8 +-
 sound/soc/sof/sof-priv.h                           |   16 +-
 sound/soc/sof/topology.c                           |    8 +-
 sound/soc/sprd/sprd-mcdt.c                         |    2 +-
 sound/soc/starfive/jh7110_pwmdac.c                 |    2 +-
 sound/soc/starfive/jh7110_tdm.c                    |    2 +-
 sound/soc/stm/stm32_adfsdm.c                       |    2 +-
 sound/soc/stm/stm32_i2s.c                          |    6 +-
 sound/soc/stm/stm32_sai_sub.c                      |    2 +-
 sound/soc/stm/stm32_spdifrx.c                      |    2 +-
 sound/soc/sunxi/sun4i-codec.c                      |    2 +-
 sound/soc/sunxi/sun4i-i2s.c                        |    2 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    2 +-
 sound/soc/sunxi/sun50i-dmic.c                      |    2 +-
 sound/soc/sunxi/sun8i-codec.c                      |    2 +-
 sound/soc/tegra/tegra186_asrc.c                    |    2 +-
 sound/soc/tegra/tegra186_dspk.c                    |    2 +-
 sound/soc/tegra/tegra20_ac97.c                     |    2 +-
 sound/soc/tegra/tegra20_i2s.c                      |    2 +-
 sound/soc/tegra/tegra210_admaif.c                  |    2 +-
 sound/soc/tegra/tegra210_adx.c                     |    2 +-
 sound/soc/tegra/tegra210_ahub.c                    |    2 +-
 sound/soc/tegra/tegra210_amx.c                     |    2 +-
 sound/soc/tegra/tegra210_dmic.c                    |    2 +-
 sound/soc/tegra/tegra210_i2s.c                     |   18 +-
 sound/soc/tegra/tegra210_mixer.c                   |    2 +-
 sound/soc/tegra/tegra210_mvc.c                     |    2 +-
 sound/soc/tegra/tegra210_ope.c                     |    2 +-
 sound/soc/tegra/tegra210_sfc.c                     |    2 +-
 sound/soc/tegra/tegra30_ahub.c                     |    2 +-
 sound/soc/tegra/tegra30_i2s.c                      |    2 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |    2 +-
 sound/soc/tegra/tegra_pcm.c                        |    2 +-
 sound/soc/ti/ams-delta.c                           |    2 +-
 sound/soc/ti/davinci-i2s.c                         |    2 +-
 sound/soc/ti/davinci-mcasp.c                       |    2 +-
 sound/soc/ti/omap-mcbsp.c                          |    2 +-
 sound/soc/uniphier/aio-ld11.c                      |    2 +-
 sound/soc/uniphier/aio-pxs2.c                      |    2 +-
 sound/soc/uniphier/evea.c                          |    2 +-
 sound/soc/ux500/mop500.c                           |    2 +-
 sound/soc/ux500/ux500_msp_dai.c                    |    2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |    2 +-
 sound/soc/xilinx/xlnx_spdif.c                      |    2 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |    2 +-
 sound/usb/line6/driver.c                           |    5 +
 sound/usb/quirks-table.h                           |    4 +
 sound/usb/stream.c                                 |    4 +-
 tools/build/feature/Makefile                       |   53 +-
 tools/perf/Documentation/Build.txt                 |   28 +
 tools/perf/Makefile.config                         |   20 +-
 tools/perf/Makefile.perf                           |   27 +-
 .../pmu-events/arch/riscv/andes/ax45/firmware.json |    2 +-
 .../pmu-events/arch/riscv/riscv-sbi-firmware.json  |    2 +-
 .../pmu-events/arch/riscv/sifive/u74/firmware.json |    2 +-
 .../arch/riscv/starfive/dubhe-80/firmware.json     |    2 +-
 .../arch/riscv/thead/c900-legacy/firmware.json     |    2 +-
 tools/perf/util/callchain.c                        |    2 +-
 tools/sound/dapm-graph                             |   44 +-
 tools/testing/selftests/bpf/Makefile               |    2 +-
 .../selftests/bpf/prog_tests/uprobe_syscall.c      |    4 +-
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c |    4 +-
 tools/testing/selftests/drivers/net/hw/rss_ctx.py  |   37 +-
 tools/testing/selftests/hid/hid_bpf.c              |   26 +
 tools/testing/selftests/hid/progs/hid.c            |    2 +-
 .../testing/selftests/hid/progs/hid_bpf_helpers.h  |    2 +-
 tools/testing/selftests/kselftest/ksft.py          |    2 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |    8 +-
 tools/testing/selftests/mm/Makefile                |    2 +-
 tools/testing/selftests/mm/mremap_test.c           |    2 +
 tools/testing/selftests/net/mptcp/mptcp_connect.c  |    8 +-
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |  158 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c      |    2 +
 virt/kvm/Kconfig                                   |    4 +-
 virt/kvm/guest_memfd.c                             |  227 +-
 virt/kvm/kvm_main.c                                |   49 +-
 984 files changed, 25292 insertions(+), 30662 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs4271.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4271.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/da7213.txt
 create mode 100644 Documentation/devicetree/bindings/sound/dlg,da7213.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,saif.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-es8328.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mxs-saif.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm512x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/tpa6130a2.txt
 delete mode 100644 arch/s390/kernel/alternative.h
 create mode 100644 include/sound/soc_sdw_utils.h
 create mode 100644 include/sound/tas2563-tlv.h
 create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c
 create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h
 create mode 100644 sound/soc/codecs/mt6357.c
 create mode 100644 sound/soc/codecs/mt6357.h
 delete mode 100644 sound/soc/intel/boards/bxt_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/bxt_rt298.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5660.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.c
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.h
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_max98357a.c
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_ssm4567.c
 delete mode 100644 sound/soc/intel/boards/skl_rt286.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ptl-match.c
 delete mode 100644 sound/soc/intel/skylake/Makefile
 delete mode 100644 sound/soc/intel/skylake/bxt-sst.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/cnl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-debug.c
 delete mode 100644 sound/soc/intel/skylake/skl-i2s.h
 delete mode 100644 sound/soc/intel/skylake/skl-messages.c
 delete mode 100644 sound/soc/intel/skylake/skl-nhlt.c
 delete mode 100644 sound/soc/intel/skylake/skl-pcm.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-utils.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.h
 delete mode 100644 sound/soc/intel/skylake/skl.c
 delete mode 100644 sound/soc/intel/skylake/skl.h
 create mode 100644 sound/soc/mediatek/mt8365/Makefile
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-mt6357.c
 create mode 100644 sound/soc/mediatek/mt8365/mt8365-reg.h
 create mode 100644 sound/soc/sdw_utils/Kconfig
 create mode 100644 sound/soc/sdw_utils/Makefile
 rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (63%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (82%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (73%)
 rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (66%)
 rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (71%)
 rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (63%)
 rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (82%)
 rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (81%)
 rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (70%)
 rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (74%)
 rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (68%)
 rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (84%)
 rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)
 rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (70%)
 rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (78%)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c
 create mode 100644 sound/soc/sof/amd/acp70.c
 create mode 100644 sound/soc/sof/amd/pci-acp70.c
 create mode 100644 sound/soc/sof/intel/pci-ptl.c
