Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C7931685
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 16:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECFBE85;
	Mon, 15 Jul 2024 16:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECFBE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721053093;
	bh=9MuhjQZWaIhlDogbfvExcapAix9MEkW9Drf98chTkKg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a3DJ+ahy21UBGisA8iXhDpgmXYETEY3PIZHaJ3NgwQL5Sm1MQUoqqNK5EysgxQD1K
	 83l4+HNKU0D3et2pbumgS6ziwoK7T86Auy2OxGpEyooulDSVm6ES7K+mVBLcgVZd9j
	 7e8P9xpMmbjVmyxa/oK9WOIS7EAu3xf15MeqEMdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8601AF8059F; Mon, 15 Jul 2024 16:17:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 343ABF8059F;
	Mon, 15 Jul 2024 16:17:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A96E1F804FC; Mon, 15 Jul 2024 16:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C292F8007E
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 16:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C292F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eLViNiOB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0DBA60C3F;
	Mon, 15 Jul 2024 14:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B2AC4AF0D;
	Mon, 15 Jul 2024 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721052874;
	bh=9MuhjQZWaIhlDogbfvExcapAix9MEkW9Drf98chTkKg=;
	h=From:To:Cc:Subject:Date:From;
	b=eLViNiOBbAvrYbP56SEPjHJli+99KsN82eOElsSvYa3slnnqQOKLnYxNY84LePe2b
	 /ktt2TAASCbXh0L83IawYVP0fOrQdJfoVCfgrOJmW4Yjf0lh8wpwY2unYdvqC8rYk9
	 lPsWtIymm8IJy5CuhbpAwrlLmb79rM40iUQSFLhLylpcbL5PSMDS7aAU9lpXU1i5cN
	 ZqRvmT3DkW4wxdUjPDBAPoCokOM8Ej+fjYOmJ7+Q2ElJ07zt37duF+jc3kQSnevpnr
	 swQZVBRsXGxBkxBiIP+L6exRTNzNxvF5RiaAl7aAFpwmECpLuDjXcQilXibZBy8FR9
	 /S0MrMVqJlszw==
Message-ID: <aff174bfa9bc48c5a6fe0de9cc508249.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.11
Date: Mon, 15 Jul 2024 15:14:20 +0100
Message-ID-Hash: Y4WCNF77J4VTHVNFLXBLCKNRN433WABA
X-Message-ID-Hash: Y4WCNF77J4VTHVNFLXBLCKNRN433WABA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4WCNF77J4VTHVNFLXBLCKNRN433WABA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 680e126ec0400f6daecf0510c5bb97a55779ff03:

  firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw files (2024-07-08 15:55:11 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.11

for you to fetch changes up to c51cba4755609ad97ba97713210c16f043c73224:

  Fix the unbalanced pm_runtime_enable in wcd937x-sdw (2024-07-12 17:38:18 +0100)

----------------------------------------------------------------
ASoC: Updates for for v6.11

There are a lot of changes in here, though the big bulk of things is
cleanups and simplifications of various kinds which are internally
rather than externally visible.  A good chunk of those are DT schema
conversions, but there's also a lot of changes in the code.

Highlights:

 - Syncing of features between simple-audio-card and the two
   audio-graph cards so there is no reason to stick with an older
   driver.
 - Support for specifying the order of operations for components within
   cards to allow quirking for unusual systems.
 - New support for Asahi Kasei AK4619, Cirrus Logic CS530x, Everest
   Semiconductors ES8311, NXP i.MX95 and LPC32xx, Qualcomm LPASS v2.5
   and WCD937x, Realtek RT1318 and RT1320 and Texas Instruments PCM5242.

----------------------------------------------------------------
Abdulrasaq Lawani (1):
      dt-bindings: sound: Convert max98088 to dtschema

Aleksandr Mishin (2):
      ASoC: qcom: Adjust issues in case of DT error in asoc_qcom_lpass_cpu_platform_probe()
      ASoC: amd: Adjust error handling in case of absent codec device

Amadeusz Sławiński (13):
      ASoC: topology: Simplify code
      ASoC: topology: Do not do unnecessary dobj management
      ASoC: topology: Properly initialize soc_enum values
      ASoC: topology: Cleanup soc_tplg_dapm_widget_dbytes_create
      ASoC: topology: Cleanup soc_tplg_dapm_widget_dmixer_create
      ASoC: topology: Cleanup soc_tplg_dapm_widget_denum_create
      ASoC: topology: Correctly set shift_r in soc_tplg_denum_create()
      ASoC: topology: Align dynamic object initialization for controls
      ASoC: topology: Rename function creating widget kcontrol
      ASoC: topology: Reshuffle function placement
      ASoC: topology: Unify code for creating standalone and widget bytes control
      ASoC: topology: Unify code for creating standalone and widget mixer control
      ASoC: topology: Unify code for creating standalone and widget enum control

Andrejs Cainikovs (3):
      ASoC: nau8822: move nau8822_set_dai_sysclk()
      ASoC: nau8822: set NAU8822_REFIMP_80K only once
      ASoC: nau8822: add MCLK support

Andy Shevchenko (6):
      ASoC: codecs: Remove unused of_gpio.h
      ASoC: fsl: Remove unused of_gpio.h
      ASoC: rockchip: Remove unused of_gpio.h
      ASoC: codecs: Replace of_gpio.h by proper one
      ASoC: generic: Replace of_gpio.h by proper one
      ASoC: samsung: Replace of_gpio.h by proper one

Animesh Agarwal (11):
      ASoC: dt-bindings: ak4554: Convert to dtschema
      ASoC: dt-bindings: linux,spdif: Convert spdif-reciever.txt to dtschema
      ASoC: dt-bindings: wlf,wm8782: Convert to dtschema
      ASoC: dt-bindings: wlf,wm8804: Convert to dtschema
      ASoC: dt-bindings: realtek,rt5631: Convert to dtschema
      ASoC: dt-bindings: realtek,rt5514: Convert to dtschema
      ASoC: dt-bindings: realtek,rt5659: Convert to dtschema
      ASoC: dt-bindings: realtek,rt5677: Convert to dtschema
      ASoC: dt-bindings: realtek,rt5645: Convert to dtschema
      ASoC: dt-bindings: cirrus,cs4270: Convert to dtschema
      ASoC: dt-bindings: cirrus,cs42xx8: Convert to dtschema

Artur Weber (6):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use SND_SOC_DAPM_REGULATOR_SUPPLY for bias regulators
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate

Bard Liao (8):
      ASoC: Intel: sof_sdw_cs42l42: use dai parameter
      ASoC: Intel: sof_sdw_rt711: use dai parameter
      ASoC: Intel: sof_sdw_rt5682: use dai parameter
      ASoC: Intel: sof_sdw_rt700: use dai parameter
      ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
      ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
      ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43

Brent Lu (8):
      ASoC: SOF: sof-audio: rename dai clock setting query function
      ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots function
      ASoC: SOF: ipc3-topology: support tdm slot number query
      ASoC: SOF: ipc4-topology: support tdm slot number query
      ASoC: Intel: maxim-common: rewrite max_98373_hw_params function
      ASoC: Intel: sof_da7219: remove local max98373 ops
      ASoC: Intel: sof_da7219: disable max98373 speaker pins in late_probe
      ASoC: Intel: maxim-common: add max_98373_get_tx_mask function

Chancel Liu (3):
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX95
      ASoC: fsl_rpmsg: Add support for i.MX95 platform
      ASoC: fsl_xcvr: Improve suspend/resume flow in fsl_xcvr_trigger()

Charles Keepax (3):
      ASoC: Intel: sof_sdw: Add missing controls for cs42l43/cs35l56
      ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops
      ASoC: Intel: sof_sdw: Add quirks for some new Dell laptops

Chen Ni (2):
      ASoC: max98088: Check for clk_prepare_enable() error
      ASoC: Intel: sof_sdw: Convert comma to semicolon

Christian Hewitt (2):
      ASoC: Add support for ti,pcm5242 to the pcm512x driver
      ASoC: dt-bindings: add ti,pcm5242 to pcm512x

Christophe JAILLET (8):
      ASoC: topology: Constify an argument of snd_soc_tplg_component_load()
      ASoC: Intel: avs: Constify struct snd_soc_tplg_ops
      ASoC: qdsp6: audioreach: Constify struct snd_soc_tplg_ops
      ASoC: Intel: Skylake: Constify struct snd_soc_tplg_ops
      ASoC: SOF: topology: Constify struct snd_soc_tplg_ops
      const_structs.checkpatch: add snd_soc_tplg_ops
      ASoC: intel: Constify struct snd_soc_ops
      ASoC: SOF: mediatek: Constify struct mtk_adsp_ipc_ops

Dan Carpenter (1):
      ASoC: samsung: midas_wm1811: Fix error code in probe()

Dr. David Alan Gilbert (3):
      ASoC: codecs: lpass-rx-macro: remove unused struct 'rx_macro_reg_mask_val'
      ASoC: codecs: wm0010: remove unused struct 'wm0010_spi_msg'
      ASoC: codecs: cx2072x: remove unused struct 'cx2072x_eq_ctrl'

Elinor Montmasson (5):
      ASoC: fsl-asoc-card: add support for dai links with multiple codecs
      ASoC: fsl-asoc-card: add second dai link component for codecs
      ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
      ASoC: fsl-asoc-card: merge spdif support from imx-spdif.c
      ASoC: dt-bindings: update fsl-asoc-card bindings after imx-spdif merge

Fabio Estevam (3):
      ASoC: fsl: fsl_aud2htx: Switch to RUNTIME_PM_OPS()
      ASoC: fsl: fsl_easrc: Switch to RUNTIME_PM_OPS()
      ASoC: fsl: fsl_xcvr: Switch to RUNTIME_PM_OPS()

Hao Ge (1):
      ASoc: PCM6240: Return directly after a failed devm_kzalloc() in pcmdevice_i2c_probe()

Herve Codina (10):
      ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
      ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
      ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer handling
      ASoC: fsl: fsl_qmc_audio: Identify the QMC channel involved in completion routines
      ASoC: fsl: fsl_qmc_audio: Introduce qmc_audio_pcm_{read,write}_submit()
      ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
      soc: fsl: cpm1: qmc: Introduce functions to get a channel from a phandle list
      soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
      dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC channels per DAI
      ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.

Jack Yu (1):
      ASoC: rt1318: Add RT1318 audio amplifier driver

Javier Carrasco (9):
      ASoC: cs35l34: Constify struct regmap_config
      ASoC: cs35l35: Constify struct regmap_config
      ASoC: cs35l36: Constify struct regmap_config
      ASoC: cs53l30: Constify struct regmap_config
      ASoC: jz4760: Constify struct regmap_config
      ASoC: jz4770: Constify struct regmap_config
      ASoC: wsa881x: Constify struct regmap_config
      ASoC: wsa883x: Constify struct regmap_config
      ASoC: wsa884x: Constify struct regmap_config

Jeff Johnson (2):
      ASoC: amd: add missing MODULE_DESCRIPTION() macros
      ASoC: fsl: imx-pcm-fiq: add missing MODULE_DESCRIPTION() macro

Jerome Brunet (2):
      ASoC: soc-utils: allow sample rate up to 768kHz for the dummy dai
      ASoC: meson: tdm: add sample rate support up to 768kHz

Jiaxin Yu (1):
      ASoC: mediatek: mt6358: Add "Dmic Mode Switch" kcontrol for switch DMIC mode.

Khanh Le (1):
      ASoC: Add ak4619 codec support

Krzysztof Kozlowski (70):
      ASoC: Constify channel mapping array arguments in set_channel_map()
      ASoC: qcom: q6apm-lpass-dais: Implement proper channel mapping
      ASoC: qcom: qdsp6: Set channel mapping instead of fixed defaults
      ASoC: qcom: x1e80100: Correct channel mapping
      ASoC: codecs: wcd938x: Drop unused duplicated MIC2 bias register defines
      ASoC: codecs: wcd938x: Unify define used for MIC2 bias register
      ASoC: codecs: wcd939x: Unify define used for MIC bias registers
      ASoC: codecs: wcd939x: Minor white-space and define cleanup
      ASoC: codecs: wcd939x: Unify define used for MIC bias VOUT registers
      ASoC: codecs: wcd938x: Drop no-op ADC2_BCS Disable Switch
      ASoC: soc-dai.h: Constify DAI ops auto_selectable_formats
      ASoC: Constify DAI ops auto_selectable_formats
      ASoC: Constify of_phandle_args in snd_soc_dai_driver
      ASoC: Constify of_phandle_args in snd_soc_dai_link_component
      ASoC: Constify passed data to core function
      ASoC: Constify DAI passed to get_channel_map
      ASoC: Constify return of snd_soc_dai_get_pcm_stream()
      ASoC: qcom: x1e80100: Add USB DisplayPort plug support
      ASoC: codecs: wcd-mbhc: Constify passed MBHC reg fields
      ASoC: codecs: wcd9335: Drop unused state container fields
      ASoC: codecs: wcd9335: Constify static data
      ASoC: codecs: wcd9335: Handle nicer probe deferral and simplify with dev_err_probe()
      ASoC: codecs: wcd9335: Drop unneeded error message
      ASoC: codecs: wcd9335: Drop unused dmic rate handling
      ASoC: codecs: wcd934x: Drop unused interp path enum
      ASoC: codecs: wcd934x: Constify static data
      ASoC: codecs: wcd934x: Drop unused mic bias voltage fields
      ASoC: codecs: wcd934x: Handle nicer probe deferral and simplify with dev_err_probe()
      ASoC: codecs: wcd937x: Constify static data
      ASoC: codecs: wcd937x: Constify wcd937x_sdw_ch_info
      ASoC: codecs: wcd937x: Drop unused enums, defines and types
      ASoC: codecs: wcd937x: Drop unused state container fields
      ASoC: codecs: wcd937x: Drop unused chipid member
      ASoC: codecs: wcd938x: Constify static data
      ASoC: codecs: wcd938x: Constify wcd938x_sdw_ch_info
      ASoC: codecs: wcd938x: Drop unused RX/TX direction enum
      ASoC: codecs: wcd938x: Drop unused num_ports field
      ASoC: codecs: wcd939x: Constify static data
      ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
      ASoC: codecs: wcd939x: Drop unused RX/TX direction enum
      ASoC: codecs: wcd939x: Drop unused num_ports field
      ASoC: codecs: lpass-rx-macro: add missing handling of v2.1 codec
      ASoC: codecs: lpass-wsa-macro: Drop unused define
      ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions
      ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version
      ASoC: codecs: lpass-macro: Gracefully handle unknown version
      ASoC: codecs: lpass-macro: Use enum for handling codec version
      ASoC: codecs: lpass-wsa-macro: add missing select of common code
      ASoC: codecs: lpass-rx-macro: Fix using NULL pointer in probe() dev_err
      ASoC: codecs: lpass-wsa-macro: Fix using NULL pointer in probe() dev_err
      ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm
      ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h
      ASoC: codecs: wcd939x: Fix typec mux and switch leak during device removal
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_add_dapms() with cleanup.h
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_probe() with cleanup.h
      ASoC: codecs: wcd9335: Simplify with cleanup.h
      ASoC: codecs: wcd934x: Simplify with cleanup.h
      ASoC: simple-card-utils: Simplify with cleanup.h
      ASoC: audio-graph-card: Use cleanup.h instead of devm_kfree()
      ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
      ASoC: simple-card: Use cleanup.h instead of devm_kfree()
      ASoC: ops: Simplify with cleanup.h
      ASoC: dapm: Simplify dapm_cnew_widget() with cleanup.h
      ASoC: dapm: Simplify snd_soc_dai_link_event_pre_pmu() with cleanup.h
      ASoC: codecs: aw88395: Simplify with cleanup.h
      ASoC: qcom: topology: Simplify with cleanup.h

Kuninori Morimoto (22):
      ASoC: simple-card-utils: remove both playback/capture_only check
      ASoC: audio-graph-card2: add ep_to_port() / port_to_ports()
      ASoC: audio-graph-card2: remove ports node name check
      ASoC: audio-graph-card2: expand dai_link property part
      ASoC: audio-graph-card2: merge graph_parse_mclk_fs() into graph_link_init()
      ASoC: audio-graph-card: add ep_to_port() / port_to_ports()
      ASoC: audio-graph-card: remove ports node name check
      ASoC: audio-graph-card: enable playback/capture_only property
      ASoC: audio-graph-card: merge graph_parse_mclk_fs() into graph_link_init()
      ASoC: simple-audio-card: enable playback/capture_only property
      ASoC: simple-audio-card: merge simple_parse_mclk_fs() into simple_link_init()
      ASoC: audio-graph-card2: add support for aux devices
      ASoC: dt-bindings: audio-graph-card2: add support for aux devices
      ASoC: dt-bindings: ak4619: Add initial DT binding
      ASoC: dt-bindings: add missing vender prefix on filename
      ASoC: audio-graph-port: add link-trigger-order
      ASoC: simple-card-utils: add link-trigger-order support
      ASoC: simple-audio-card: add link-trigger-order support
      ASoC: audio-graph-card: add link-trigger-order support
      ASoC: audio-graph-card2: add link-trigger-order support
      ASoC: simple-audio-mux: enable to select MUX names
      ASoC: dt-bindings: simple-audio-mux: add state-labels property

Linus Walleij (1):
      ASoC: tas5086: Convert to GPIO descriptors

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entries after adding vendor prefix in sound dtbs

Manikantan R (1):
      ASoC: dt-bindings: wsa883x: Document port mapping property

Mark Brown (42):
      Support Tegra I2S client format conversion
      ASoC: Intel: boards: updates for 6.11
      ASoC: qcom: x1e80100: Correct channel mapping
      ASoC: fsl_mqs: Add i.MX95 platform support
      ASoC: codecs: add support for everest-semi es8311
      ASoC: samsung: midas-audio: Add GPIO-based headset
      ASoC: Merge up fixes
      Dead structs in sound/soc/codecs
      ASoC: fsl_xcvr: Support i.MX95 platform
      ASoC: simple-card: sync support
      ASoC: codecs: wcd937x: add wcd937x audio codec
      ACPI/ALSA/soundwire: add acpi_get_local_u64_address()
      ASoC: Drop or replace of_gpio.h
      ASoC: codecs: lpass: add support for v2.5 rx macro
      ASoC: Merge up fixes
      Cirrus Logic Family of ADCs
      tlv320adc3xxx: Allow MICBIAS pins to be used as
      ASoC: dt-bindings: convert everest,es7134.txt &
      ASoC: codecs: wcd family: cleanups
      ASoC: add compatible for ti,pcm5242
      ASoC: Add ak4619 codec support
      ASoC: Few constifications (mostly arguments)
      ASoC: qcom: display port changes
      ASoC: nau8822: add MCLK support
      ASoC: codecs: ES8326: Solving headphone detection and
      ASoC: Intel: boards: updates for 6.11 - part2
      ASoC: simple-card / audio-graph:
      ASoC: imx-audmix: Split capture device to be a new
      Add audio support for LPC32XX CPUs
      ASoC: codecs: wsa88xx: add support for static port
      ASoC: cs35l56: Remove obsolete and redundant code
      ASoC: simple-audio-mux: add state-labels
      Add master clock handling for nau8824
      ASoC: topology: kcontrol registration cleanup
      ASoC: cs35l56: Set correct upper volume limit
      ASoC: codecs: lpass-rx-macro: Few code cleanups
      Add support for non-interleaved mode in qmc_audio
      ASoC: Simplify code with cleanup.h
      ASoC: fsl-asoc-card: add S/PDIF controller support
      firmware: cs_dsp: Some small coding improvements
      ASoC: dt-bindings: convert qcom sound bindings to
      Fix the unbalanced pm_runtime_enable in wcd937x-sdw

Matteo Martelli (2):
      ASoC: es8311: dt-bindings: add everest es8311 codec
      ASoC: codecs: es8311: add everest es8311 codec support

Maxim Kochetkov (2):
      ASoC: dt-bindings: nau8824: Add master clock handling
      ASoC: codecs: nau8824: Add master clock handling

Mithil Bavishi (1):
      ASoC: dt-bindings: omap-mcpdm: Convert to DT schema

Mohammad Rafi Shaik (3):
      ASoC: codecs: wcd937x-sdw: Fix Unbalanced pm_runtime_enable
      ASoC: codecs: wcd937x: Remove the string compare in MIC BIAS widget settings
      ASoC: codecs: wcd937x: Remove separate handling for vdd-buck supply

Mohan Kumar (2):
      ASoC: simple-card-utils: Split simple_fixup_sample_fmt func
      ASoC: tegra: I2S client convert formats handling

Nathan Chancellor (2):
      ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized in lpc32xx_i2s_probe()
      ASoC: fsl: lpc3xxx-i2s: Include bitfield.h for FIELD_PREP

Neil Armstrong (5):
      ASoC: dt-bindings: convert amlogic,g12a-tohdmitx to dt-schema
      ASoC: dt-bindings: convert tas571x.txt to dt-schema
      ASoC: dt-bindings: convert everest,es7241.txt to dt-schema
      ASoC: dt-bindings: convert everest,es7134.txt to dt-schema
      ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems for audio-widgets

Paul Handrigan (4):
      ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
      ASoC: cs530x: Support for cs530x ADCs
      ASoC: cs530x: Calculate proper bclk rate using TDM
      ASoC: cs530x: Remove bclk from private structure

Peter Ujfalusi (4):
      ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob
      ASoC: SOF: Intel: pci-tgl: Align ADL-N sof_dev_desc struct name to convention
      ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input pin format
      ASoC: SOF: ipc4-topology: Use single token list for the copiers

Pierre-Louis Bossart (6):
      ASoC: SOF: Intel: hda: print PCI class info only once
      ACPI: utils: introduce acpi_get_local_u64_address()
      soundwire: slave: simplify code with acpi_get_local_u64_address()
      ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()
      ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
      ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C

Piotr Wojtaszczyk (2):
      ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
      ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs

Prasad Kumpatla (7):
      ASoC: dt-bindings: document wcd937x Audio Codec
      ASoC: codecs: wcd937x-sdw: add SoundWire driver
      ASoC: codecs: wcd937x: add wcd937x codec driver
      ASoC: codecs: wcd937x: add basic controls
      ASoC: codecs: wcd937x: add playback dapm widgets
      ASoC: codecs: wcd937x: add capture dapm widgets
      ASoC: codecs: wcd937x: add audio routing and Kconfig

Rayyan Ansari (2):
      ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
      ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema

Ricard Wanderlof (3):
      ASoC: dt-bindings: tlv320adc3xxx: Fix incorrect GPIO description
      ASoC: dt-bindings: tlv320adc3xxx: Add MICBIAS-as-GPO properties
      ASoC: tlv320adc3xxx: Add support for using MICBIAS pins as GPO

Richard Fitzgerald (10):
      ASoC: cs35l56: Revert support for dual-ownership of ASP registers
      ASoC: cs35l56: Remove support for A1 silicon
      ASoC: cs35l56: Remove redundant clearing of clk_stop_mode1
      firmware: cs_dsp: Don't allow writes to read-only controls
      ASoC: cs35l56: Use header defines for Speaker Volume control definition
      ASoC: cs35l56: Limit Speaker Volume to +12dB maximum
      firmware: cs_dsp: Don't allocate temporary buffer for info text
      firmware: cs_dsp: Make wmfw and bin filename arguments const char *
      firmware: cs_dsp: Clarify wmfw format version log message
      firmware: cs_dsp: Rename fw_ver to wmfw_ver

Rob Herring (Arm) (2):
      ASoC: PCM6240: Use of_property_read_reg()
      ASoC: tas2781: Use of_property_read_reg()

Shenghao Ding (8):
      ASoc: tas2781: Enable RCA-based playback without DSP firmware download
      ASoc: tas2781: Add name_prefix as the prefix name of firmwares and kcontrol to support corresponding TAS2563/TAS2781s
      ASoc: tas2781: Add name_prefix as the prefix name of DSP firmwares and calibrated data files
      ASoc: tas2781: Set "Speaker Force Firmware Load" as the common kcontrol for both tas27871 and tas2563
      ASoc: pcm6240: Remove unnecessary name-prefix for all the controls
      ASoc: TAS2781: replace beXX_to_cpup with get_unaligned_beXX for potentially broken alignment
      ASoc: TAS2781: rename the tas2781_reset as tasdevice_reset
      ASoC: tas2781: Add new Kontrol to set tas2563 digital Volume

Shengjiu Wang (9):
      ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
      ASoC: fsl_mqs: Add i.MX95 platform support
      ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX95
      ASoC: fsl_xcvr: Add support for i.MX95 platform
      ASoC: fsl_sai: Add separate DAI for transmitter and receiver
      ASoC: fsl_audmix: Split playback and capture stream to different DAI
      ASoC: imx-audmix: Split capture device for audmix
      ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
      ASoC: ak4458: remove "reset-gpios" property handler

Shuming Fan (4):
      ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
      ASoC: rt711-sdca: add GE selected mode control
      ASoC: rt712-sdca: change the definition name of SDCA channel number
      ASoC: rt712-sdca: add the function for version B

Simon Trimmer (2):
      ASoC: cs35l56: Attempt to read from cirrus,speaker-id device property first
      ASoC: cs35l56: Accept values greater than 0 as IRQ numbers

Srinivas Kandagatla (9):
      ASoC: codecs: lpass-macro: add helpers to get codec version
      ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      ASoC: codec: lpass-rx-macro: add support for 2.5 codec version
      ASoC: qcom: q6dsp: parse Display port tokens
      ASoC: qcom: common: add Display port Jack function
      ASoC: qcom: sc8280xp: add Display port Jack
      ASoC: codecs: wsa883x: parse port-mapping information
      ASoC: dt-bindings: wsa8840: Document port mapping property
      ASoC: codecs: wsa884x: parse port-mapping information

Tony Luck (1):
      ASoC: Intel: avs: es8336: Switch to new Intel CPU model defines

Uwe Kleine-König (1):
      ASoC: codecs: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Vijendar Mukunda (5):
      ASoC: amd: acp: remove acp_i2s_probe function
      ASoC: amd: acp: remove unused variables from acp_resource structure
      ASoC: amd: acp: modify conditional check for programming i2s mclk
      ASoC: amd: acp: move i2s clock generation sequence
      ASoC: amd: acp: add pcm constraints for buffer size and period size

Xiaxi Shen (1):
      ASoC: dt-bindings: ak4104: convert to dt schema

Yang Li (1):
      ASoC: Remove unneeded semicolon

Zhang Yi (3):
      ASoC: codecs: ES8326: Slove headphone detection issue
      ASoC: codecs: ES8326: Minimize the pop noise
      ASoC: codecs: ES8326: regcache_sync error issue

 Documentation/admin-guide/LSM/tomoyo.rst           |   35 +-
 Documentation/admin-guide/mm/transhuge.rst         |    4 +-
 Documentation/cdrom/cdrom-standard.rst             |    4 +-
 .../devicetree/bindings/arm/stm32/st,mlahb.yaml    |    3 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    6 +-
 .../devicetree/bindings/input/elan,ekth6915.yaml   |   19 +-
 .../devicetree/bindings/input/ilitek,ili2901.yaml  |   66 +
 Documentation/devicetree/bindings/sound/ak4104.txt |   25 -
 Documentation/devicetree/bindings/sound/ak4554.txt |   11 -
 .../bindings/sound/amlogic,g12a-tohdmitx.txt       |   58 -
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml      |   54 +
 .../bindings/sound/amlogic,gx-sound-card.yaml      |    1 -
 .../bindings/sound/asahi-kasei,ak4104.yaml         |   49 +
 .../sound/{ak4375.yaml => asahi-kasei,ak4375.yaml} |    2 +-
 .../bindings/sound/asahi-kasei,ak4554.yaml         |   27 +
 .../sound/{ak4613.yaml => asahi-kasei,ak4613.yaml} |    2 +-
 .../bindings/sound/asahi-kasei,ak4619.yaml         |   62 +
 .../sound/{ak4642.yaml => asahi-kasei,ak4642.yaml} |    2 +-
 .../bindings/sound/audio-graph-card2.yaml          |    5 +
 .../bindings/sound/audio-graph-port.yaml           |    9 +
 .../devicetree/bindings/sound/cirrus,cs4270.yaml   |   59 +
 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |   81 +
 .../devicetree/bindings/sound/cirrus,cs530x.yaml   |   85 +
 Documentation/devicetree/bindings/sound/cs4270.txt |   21 -
 .../devicetree/bindings/sound/cs42xx8.txt          |   34 -
 .../devicetree/bindings/sound/everest,es7134.txt   |   15 -
 .../devicetree/bindings/sound/everest,es71x4.yaml  |   62 +
 .../devicetree/bindings/sound/everest,es7241.txt   |   28 -
 .../devicetree/bindings/sound/everest,es7241.yaml  |   67 +
 .../devicetree/bindings/sound/everest,es8316.yaml  |    7 +-
 .../bindings/sound/fsl,imx-audio-spdif.yaml        |   66 -
 .../devicetree/bindings/sound/fsl,mqs.yaml         |    2 +
 .../devicetree/bindings/sound/fsl,qmc-audio.yaml   |   41 +-
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |    1 +
 .../sound/{sgtl5000.yaml => fsl,sgtl5000.yaml}     |    2 +-
 .../devicetree/bindings/sound/fsl,xcvr.yaml        |   43 +-
 .../devicetree/bindings/sound/fsl-asoc-card.yaml   |   53 +-
 .../{linux,spdif-dit.yaml => linux,spdif.yaml}     |    8 +-
 .../devicetree/bindings/sound/maxim,max98088.txt   |   23 -
 .../devicetree/bindings/sound/maxim,max98088.yaml  |   47 +
 .../sound/{zl38060.yaml => mscc,zl38060.yaml}      |    2 +-
 .../devicetree/bindings/sound/nuvoton,nau8824.yaml |    8 +
 .../devicetree/bindings/sound/nxp,lpc3220-i2s.yaml |   73 +
 .../devicetree/bindings/sound/omap-mcpdm.txt       |   30 -
 .../devicetree/bindings/sound/pcm512x.txt          |    2 +-
 .../devicetree/bindings/sound/qcom,apq8096.txt     |  128 -
 .../sound/qcom,msm8916-wcd-digital-codec.yaml      |   55 +
 .../bindings/sound/qcom,msm8916-wcd-digital.txt    |   20 -
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    1 +
 .../bindings/sound/qcom,wcd937x-sdw.yaml           |   91 +
 .../devicetree/bindings/sound/qcom,wcd937x.yaml    |   82 +
 .../devicetree/bindings/sound/qcom,wsa883x.yaml    |    8 +
 .../devicetree/bindings/sound/qcom,wsa8840.yaml    |    8 +
 .../sound/{rt1019.yaml => realtek,rt1019.yaml}     |    2 +-
 .../devicetree/bindings/sound/realtek,rt5514.yaml  |   70 +
 .../devicetree/bindings/sound/realtek,rt5631.yaml  |   67 +
 .../devicetree/bindings/sound/realtek,rt5645.yaml  |  131 +
 .../devicetree/bindings/sound/realtek,rt5659.yaml  |  129 +
 .../devicetree/bindings/sound/realtek,rt5677.yaml  |  135 +
 Documentation/devicetree/bindings/sound/rt5514.txt |   37 -
 Documentation/devicetree/bindings/sound/rt5631.txt |   48 -
 Documentation/devicetree/bindings/sound/rt5645.txt |   82 -
 Documentation/devicetree/bindings/sound/rt5659.txt |   89 -
 Documentation/devicetree/bindings/sound/rt5677.txt |   78 -
 .../bindings/sound/samsung,midas-audio.yaml        |   33 +
 .../bindings/sound/simple-audio-mux.yaml           |    6 +
 .../devicetree/bindings/sound/spdif-receiver.txt   |   10 -
 .../devicetree/bindings/sound/tas571x.txt          |   49 -
 .../devicetree/bindings/sound/ti,omap4-mcpdm.yaml  |   73 +
 .../sound/{tas2562.yaml => ti,tas2562.yaml}        |    2 +-
 .../sound/{tas2770.yaml => ti,tas2770.yaml}        |    2 +-
 .../sound/{tas27xx.yaml => ti,tas27xx.yaml}        |    2 +-
 .../devicetree/bindings/sound/ti,tas57xx.yaml      |  133 +
 .../sound/{tas5805m.yaml => ti,tas5805m.yaml}      |    2 +-
 .../bindings/sound/ti,tlv320adc3xxx.yaml           |   32 +-
 .../{tlv320adcx140.yaml => ti,tlv320adcx140.yaml}  |    2 +-
 .../sound/{wm8750.yaml => wlf,wm8750.yaml}         |    2 +-
 .../devicetree/bindings/sound/wlf,wm8782.yaml      |   47 +
 .../devicetree/bindings/sound/wlf,wm8804.yaml      |   58 +
 Documentation/devicetree/bindings/sound/wm8782.txt |   24 -
 Documentation/devicetree/bindings/sound/wm8804.txt |   25 -
 Documentation/kbuild/kconfig-language.rst          |   12 +-
 Documentation/networking/af_xdp.rst                |   33 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |    2 +-
 MAINTAINERS                                        |   24 +-
 Makefile                                           |    2 +-
 arch/arm/configs/imx_v6_v7_defconfig               |    1 -
 arch/arm64/configs/defconfig                       |    1 -
 arch/arm64/include/asm/el2_setup.h                 |    6 +-
 arch/arm64/include/asm/io.h                        |   36 +-
 arch/arm64/include/asm/kvm_arm.h                   |    6 +
 arch/arm64/include/asm/kvm_emulate.h               |   71 +-
 arch/arm64/include/asm/kvm_host.h                  |   25 +-
 arch/arm64/include/asm/kvm_hyp.h                   |    4 +-
 arch/arm64/include/asm/kvm_pkvm.h                  |    9 +
 arch/arm64/kernel/armv8_deprecated.c               |    3 +
 arch/arm64/kvm/arm.c                               |   76 +
 arch/arm64/kvm/emulate-nested.c                    |   21 +-
 arch/arm64/kvm/fpsimd.c                            |   11 +-
 arch/arm64/kvm/guest.c                             |    3 +-
 arch/arm64/kvm/hyp/aarch32.c                       |   18 +-
 arch/arm64/kvm/hyp/fpsimd.S                        |    6 +
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   36 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h             |    1 -
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |   84 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                     |   17 +-
 arch/arm64/kvm/hyp/nvhe/setup.c                    |   25 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |   24 +-
 arch/arm64/kvm/hyp/vhe/switch.c                    |   12 +-
 arch/arm64/kvm/nested.c                            |    6 +-
 arch/arm64/kvm/reset.c                             |    3 +
 arch/arm64/mm/contpte.c                            |    4 +-
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts    |    4 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts    |    4 +-
 arch/loongarch/boot/dts/loongson-2k2000-ref.dts    |    2 +-
 arch/loongarch/include/asm/numa.h                  |    1 +
 arch/loongarch/include/asm/stackframe.h            |    2 +-
 arch/loongarch/kernel/head.S                       |    2 +-
 arch/loongarch/kernel/setup.c                      |    6 +-
 arch/loongarch/kernel/smp.c                        |    5 +-
 arch/loongarch/kernel/vmlinux.lds.S                |   10 +-
 arch/riscv/kvm/aia_device.c                        |    7 +-
 arch/riscv/kvm/vcpu_onereg.c                       |    4 +-
 arch/riscv/mm/fault.c                              |    4 +-
 arch/riscv/mm/init.c                               |   21 +-
 arch/s390/kernel/crash_dump.c                      |   54 +-
 arch/x86/include/asm/kvm_host.h                    |    1 +
 arch/x86/include/asm/vmxfeatures.h                 |    2 +-
 arch/x86/kernel/amd_nb.c                           |    9 +-
 arch/x86/kernel/machine_kexec_64.c                 |   11 +-
 arch/x86/kvm/Kconfig                               |   11 +-
 arch/x86/kvm/lapic.c                               |   39 +-
 arch/x86/kvm/lapic.h                               |    2 +-
 arch/x86/kvm/mmu/mmu.c                             |   46 +-
 arch/x86/kvm/mmu/spte.h                            |    9 +
 arch/x86/kvm/mmu/tdp_iter.h                        |    2 +
 arch/x86/kvm/mmu/tdp_mmu.c                         |    2 +-
 arch/x86/kvm/svm/sev.c                             |   19 +-
 arch/x86/kvm/svm/svm.c                             |   69 +-
 arch/x86/kvm/svm/svm.h                             |    4 +-
 arch/x86/kvm/vmx/nested.c                          |    5 +
 arch/x86/kvm/vmx/vmx.c                             |   11 +-
 arch/x86/kvm/x86.c                                 |   11 +-
 drivers/acpi/ac.c                                  |    4 +-
 drivers/acpi/apei/einj-core.c                      |    2 +-
 drivers/acpi/ec.c                                  |    9 +-
 drivers/acpi/sbs.c                                 |    4 +-
 drivers/acpi/utils.c                               |   16 +-
 drivers/ata/pata_macio.c                           |    9 +-
 drivers/block/null_blk/main.c                      |    4 +-
 drivers/char/tpm/tpm.h                             |    2 +-
 drivers/char/tpm/tpm_tis_core.c                    |    3 +-
 drivers/char/tpm/tpm_tis_core.h                    |    2 +-
 drivers/clk/sifive/sifive-prci.c                   |    8 -
 drivers/cpufreq/amd-pstate-ut.c                    |    3 +-
 drivers/cpufreq/amd-pstate.c                       |   36 +-
 {include/linux => drivers/cpufreq}/amd-pstate.h    |   33 -
 drivers/cpufreq/intel_pstate.c                     |    3 +-
 drivers/cxl/core/region.c                          |   18 +-
 drivers/edac/amd64_edac.c                          |    8 +-
 drivers/edac/igen6_edac.c                          |    4 +-
 drivers/firmware/cirrus/cs_dsp.c                   |   71 +-
 drivers/firmware/efi/efi-pstore.c                  |    8 +-
 drivers/firmware/efi/libstub/loongarch.c           |    2 +-
 drivers/firmware/efi/libstub/zboot.lds             |    1 +
 drivers/firmware/efi/runtime-wrappers.c            |   13 +-
 drivers/gpio/Kconfig                               |    2 +-
 drivers/gpio/gpio-gw-pld.c                         |    1 +
 drivers/gpio/gpio-mc33880.c                        |    1 +
 drivers/gpio/gpio-pcf857x.c                        |    1 +
 drivers/gpio/gpio-pl061.c                          |    1 +
 drivers/gpio/gpio-tqmx86.c                         |  110 +-
 drivers/gpu/drm/amd/include/pptable.h              |   91 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   20 +-
 .../gpu/drm/arm/display/komeda/komeda_color_mgmt.c |    5 -
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   60 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |    1 +
 drivers/hid/hid-asus.c                             |    4 +-
 drivers/hid/hid-core.c                             |    1 -
 drivers/hid/hid-debug.c                            |    2 +
 drivers/hid/hid-ids.h                              |    2 +
 drivers/hid/hid-input.c                            |   13 +
 drivers/hid/hid-logitech-dj.c                      |    4 +-
 drivers/hid/hid-logitech-hidpp.c                   |    1 +
 drivers/hid/hid-nintendo.c                         |    6 +-
 drivers/hid/hid-nvidia-shield.c                    |    4 +-
 drivers/hid/i2c-hid/i2c-hid-of-elan.c              |   59 +-
 drivers/hid/intel-ish-hid/ishtp/loader.c           |   79 +-
 drivers/hid/intel-ish-hid/ishtp/loader.h           |   33 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   11 +-
 drivers/input/touchscreen/silead.c                 |   19 +-
 drivers/iommu/amd/amd_iommu.h                      |    3 +-
 drivers/iommu/amd/init.c                           |    9 +
 drivers/iommu/amd/iommu.c                          |   48 +-
 drivers/iommu/amd/ppr.c                            |   25 +-
 drivers/iommu/dma-iommu.c                          |    8 +-
 drivers/irqchip/irq-gic-v3-its.c                   |   44 +-
 drivers/irqchip/irq-riscv-intc.c                   |    9 +-
 drivers/irqchip/irq-sifive-plic.c                  |   34 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |   71 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |    5 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |    5 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |    7 +-
 drivers/net/ethernet/intel/ice/ice.h               |   44 +-
 drivers/net/ethernet/intel/ice/ice_base.c          |    3 +
 drivers/net/ethernet/intel/ice/ice_lib.c           |   27 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  118 +-
 drivers/net/ethernet/intel/ice/ice_nvm.c           |  116 +-
 drivers/net/ethernet/intel/ice/ice_type.h          |   14 +-
 drivers/net/ethernet/intel/ice/ice_xsk.c           |   13 +-
 drivers/net/ethernet/intel/igc/igc_ethtool.c       |    9 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |    4 +
 .../net/ethernet/marvell/octeontx2/af/rvu_npc.c    |   33 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        |  104 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h        |    9 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw.c       |    4 +
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |    8 +
 .../net/ethernet/mellanox/mlx5/core/lag/port_sel.c |    8 +-
 .../net/ethernet/mellanox/mlx5/core/lib/pci_vsc.c  |    4 +
 drivers/net/ethernet/mellanox/mlx5/core/main.c     |    3 +
 drivers/net/ethernet/pensando/ionic/ionic_txrx.c   |    1 +
 drivers/net/phy/micrel.c                           |  104 +-
 drivers/net/virtio_net.c                           |   42 +-
 drivers/net/vmxnet3/vmxnet3_drv.c                  |    2 +-
 drivers/net/vxlan/vxlan_core.c                     |    8 +-
 drivers/net/wireless/ath/ath10k/Kconfig            |    1 +
 drivers/net/wireless/ath/ath11k/core.c             |    2 +-
 drivers/net/wireless/ath/ath11k/mac.c              |   38 +-
 drivers/net/wireless/ath/ath11k/pcic.c             |   25 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c       |    2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c        |   16 +-
 drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c   |    9 +
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |   14 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c  |    2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   39 +-
 .../net/wireless/intel/iwlwifi/mvm/mld-mac80211.c  |    2 -
 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c   |   13 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h       |    1 +
 drivers/net/wireless/intel/iwlwifi/mvm/rs.h        |    9 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c      |    5 +-
 drivers/net/wireless/intel/iwlwifi/mvm/scan.c      |   12 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |   12 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.h       |    5 +
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |    4 +
 drivers/net/wireless/microchip/wilc1000/cfg80211.c |   41 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      |   17 +-
 drivers/net/wireless/microchip/wilc1000/netdev.c   |   43 +-
 drivers/net/wireless/microchip/wilc1000/netdev.h   |   12 +-
 drivers/net/wireless/microchip/wilc1000/wlan.c     |    5 +-
 drivers/net/wireless/realtek/rtlwifi/core.c        |   15 -
 drivers/net/wwan/iosm/iosm_ipc_devlink.c           |    2 +-
 drivers/nvme/host/fabrics.c                        |    6 +-
 drivers/nvme/host/pr.c                             |    2 +-
 drivers/of/irq.c                                   |  125 +-
 drivers/of/of_private.h                            |    3 +
 drivers/of/of_test.c                               |    1 +
 drivers/of/property.c                              |   30 +-
 drivers/pci/access.c                               |    4 -
 drivers/pci/pci.c                                  |    1 -
 drivers/pci/probe.c                                |    3 -
 drivers/platform/x86/Kconfig                       |    1 +
 drivers/platform/x86/amd/hsmp.c                    |   50 +-
 drivers/platform/x86/dell/dell-smbios-base.c       |  103 +-
 drivers/platform/x86/touchscreen_dmi.c             |   59 +-
 drivers/pnp/base.h                                 |    1 +
 drivers/pnp/driver.c                               |    6 +
 drivers/ptp/ptp_chardev.c                          |    3 +-
 drivers/scsi/device_handler/scsi_dh_alua.c         |   31 +-
 drivers/scsi/mpi3mr/mpi3mr_transport.c             |    2 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c               |    4 +-
 drivers/scsi/qedf/qedf.h                           |    1 +
 drivers/scsi/qedf/qedf_main.c                      |   47 +-
 drivers/scsi/scsi.c                                |    7 +
 drivers/scsi/sr.h                                  |    2 +-
 drivers/scsi/sr_ioctl.c                            |    5 +-
 drivers/soc/fsl/qe/qmc.c                           |   32 +-
 drivers/soundwire/slave.c                          |   13 +-
 drivers/thermal/thermal_core.c                     |   35 +-
 drivers/thermal/thermal_core.h                     |    2 +
 drivers/thermal/thermal_debugfs.c                  |   18 +-
 drivers/thermal/thermal_trip.c                     |   20 +-
 drivers/ufs/core/ufs-mcq.c                         |   17 +-
 fs/bcachefs/btree_locking.c                        |    1 +
 fs/bcachefs/move.c                                 |   16 +-
 fs/btrfs/btrfs_inode.h                             |   10 +
 fs/btrfs/disk-io.c                                 |   10 +-
 fs/btrfs/extent_io.c                               |   60 +-
 fs/btrfs/file.c                                    |   16 +
 fs/btrfs/ordered-data.c                            |   31 +
 fs/btrfs/tree-log.c                                |   17 +-
 fs/nilfs2/dir.c                                    |    2 +-
 fs/nilfs2/segment.c                                |    3 +
 fs/proc/base.c                                     |    2 +-
 fs/smb/client/smb2pdu.c                            |    3 -
 fs/smb/client/smb2transport.c                      |    2 +-
 include/dt-bindings/sound/audio-graph.h            |   26 +
 include/linux/acpi.h                               |    1 +
 include/linux/atomic/atomic-arch-fallback.h        |    6 +-
 include/linux/atomic/atomic-instrumented.h         |    8 +-
 include/linux/atomic/atomic-long.h                 |    4 +-
 include/linux/cdrom.h                              |    2 +-
 include/linux/firmware/cirrus/cs_dsp.h             |   10 +-
 include/linux/firmware/mediatek/mtk-adsp-ipc.h     |    2 +-
 include/linux/huge_mm.h                            |   10 +-
 include/linux/i2c.h                                |    1 -
 include/linux/iommu.h                              |    2 +-
 include/linux/ksm.h                                |   17 +-
 include/linux/lockdep.h                            |    5 -
 include/linux/mm_types.h                           |    2 +-
 include/linux/pci.h                                |    2 -
 include/linux/pnp.h                                |    6 +-
 include/net/rtnetlink.h                            |    1 +
 include/net/tcp_ao.h                               |    7 +-
 include/soc/fsl/qe/qmc.h                           |   27 +-
 include/sound/cs35l41.h                            |    4 +-
 include/sound/cs35l56.h                            |   13 +-
 include/sound/rt1318.h                             |   16 +
 include/sound/simple_card_utils.h                  |    8 +-
 include/sound/soc-dai.h                            |   36 +-
 include/sound/soc-dapm.h                           |    2 +-
 include/sound/soc-topology.h                       |    2 +-
 include/sound/soc.h                                |   19 +-
 include/sound/sof.h                                |    1 +
 include/sound/tas2781-dsp.h                        |   11 +-
 include/sound/tas2781-tlv.h                        |  262 +-
 include/sound/tas2781.h                            |   10 +-
 include/uapi/linux/input-event-codes.h             |    2 +
 io_uring/io-wq.c                                   |   10 +-
 io_uring/io_uring.h                                |    2 +-
 io_uring/napi.c                                    |   24 +-
 io_uring/register.c                                |    4 +
 kernel/bpf/devmap.c                                |    3 -
 kernel/bpf/syscall.c                               |   11 +-
 kernel/bpf/verifier.c                              |    4 +
 kernel/events/core.c                               |   13 +
 kernel/trace/bpf_trace.c                           |    2 -
 lib/test_rhashtable.c                              |    1 +
 mm/filemap.c                                       |    2 +-
 mm/huge_memory.c                                   |    8 +-
 mm/hugetlb.c                                       |   16 +-
 mm/kmsan/core.c                                    |   15 +-
 mm/ksm.c                                           |   17 +-
 mm/memcontrol.c                                    |    2 -
 mm/mempool.c                                       |    2 +-
 mm/page_alloc.c                                    |   50 +-
 mm/page_io.c                                       |    2 +-
 mm/slub.c                                          |    5 +-
 mm/util.c                                          |   10 +-
 mm/vmalloc.c                                       |    2 +-
 mm/vmscan.c                                        |    2 +-
 net/ax25/af_ax25.c                                 |    6 +
 net/ax25/ax25_dev.c                                |    2 +-
 net/bpf/test_run.c                                 |    6 +
 net/core/dev.c                                     |    3 +-
 net/core/dst_cache.c                               |    2 +
 net/core/rtnetlink.c                               |   44 +-
 net/ethtool/ioctl.c                                |    2 +-
 net/ethtool/tsinfo.c                               |    6 +-
 net/ipv4/devinet.c                                 |    2 +-
 net/ipv4/fib_frontend.c                            |    7 +-
 net/ipv4/tcp.c                                     |    9 +-
 net/ipv4/tcp_ao.c                                  |   13 +-
 net/ipv6/ila/ila_lwt.c                             |    7 +-
 net/ipv6/ioam6_iptunnel.c                          |    8 +-
 net/ipv6/ip6_fib.c                                 |    6 +-
 net/ipv6/route.c                                   |    1 +
 net/ipv6/rpl_iptunnel.c                            |   14 +-
 net/ipv6/seg6_iptunnel.c                           |   14 +-
 net/mac80211/cfg.c                                 |    9 +-
 net/mac80211/he.c                                  |   10 +-
 net/mac80211/ieee80211_i.h                         |    2 +
 net/mac80211/main.c                                |   10 +-
 net/mac80211/mesh.c                                |    1 +
 net/mac80211/mesh_pathtbl.c                        |   13 +
 net/mac80211/parse.c                               |    2 +-
 net/mac80211/scan.c                                |   14 +-
 net/mac80211/sta_info.c                            |    4 +-
 net/mac80211/util.c                                |    2 +
 net/mptcp/protocol.c                               |    9 +-
 net/ncsi/internal.h                                |    2 +
 net/ncsi/ncsi-manage.c                             |   73 +-
 net/ncsi/ncsi-rsp.c                                |    4 +-
 net/sched/sch_multiq.c                             |    2 +-
 net/sched/sch_taprio.c                             |   15 +-
 net/smc/af_smc.c                                   |   22 +-
 net/sunrpc/auth_gss/svcauth_gss.c                  |    2 +-
 net/unix/af_unix.c                                 |   90 +-
 net/unix/diag.c                                    |   12 +-
 net/wireless/core.c                                |    2 +-
 net/wireless/pmsr.c                                |    8 +-
 net/wireless/rdev-ops.h                            |    6 +-
 net/wireless/scan.c                                |   50 +-
 net/wireless/sysfs.c                               |    4 +-
 net/wireless/util.c                                |    7 +-
 net/xdp/xsk.c                                      |    5 +-
 scripts/atomic/kerneldoc/sub_and_test              |    2 +-
 scripts/const_structs.checkpatch                   |    1 +
 scripts/kconfig/confdata.c                         |   13 -
 scripts/kconfig/expr.c                             |   29 -
 scripts/kconfig/expr.h                             |    1 -
 scripts/kconfig/gconf.c                            |    3 +-
 scripts/kconfig/menu.c                             |    2 -
 scripts/link-vmlinux.sh                            |    2 +-
 scripts/mod/modpost.c                              |    5 +-
 security/tomoyo/Kconfig                            |    2 +-
 security/tomoyo/common.c                           |    2 +-
 sound/hda/intel-sdw-acpi.c                         |    6 +-
 sound/pci/hda/tas2781_hda_i2c.c                    |    4 +-
 sound/soc/amd/acp-es8336.c                         |    4 +-
 sound/soc/amd/acp/acp-i2s.c                        |   19 +-
 sound/soc/amd/acp/acp-legacy-common.c              |    1 +
 sound/soc/amd/acp/acp-pci.c                        |    1 +
 sound/soc/amd/acp/acp-pdm.c                        |    1 +
 sound/soc/amd/acp/acp-platform.c                   |   14 +
 sound/soc/amd/acp/acp-rembrandt.c                  |    7 +-
 sound/soc/amd/acp/acp-renoir.c                     |    2 -
 sound/soc/amd/acp/acp63.c                          |    7 +-
 sound/soc/amd/acp/acp70.c                          |    2 -
 sound/soc/amd/acp/amd.h                            |    3 +-
 sound/soc/amd/ps/ps-mach.c                         |    1 +
 sound/soc/amd/renoir/acp3x-rn.c                    |    1 +
 sound/soc/amd/yc/acp6x-mach.c                      |    1 +
 sound/soc/codecs/Kconfig                           |   56 +
 sound/soc/codecs/Makefile                          |   19 +
 sound/soc/codecs/adau7118.c                        |    6 +-
 sound/soc/codecs/ak4118.c                          |    1 -
 sound/soc/codecs/ak4458.c                          |   12 +-
 sound/soc/codecs/ak4613.c                          |    2 +-
 sound/soc/codecs/ak4619.c                          |  912 ++++++
 sound/soc/codecs/audio-iio-aux.c                   |   83 +-
 sound/soc/codecs/aw87390.c                         |    2 +-
 sound/soc/codecs/aw88261.c                         |    2 +-
 sound/soc/codecs/aw88395/aw88395.c                 |    4 +-
 sound/soc/codecs/aw88395/aw88395_lib.c             |   51 +-
 sound/soc/codecs/aw88399.c                         |    4 +-
 sound/soc/codecs/cs35l34.c                         |    2 +-
 sound/soc/codecs/cs35l35.c                         |    2 +-
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs35l41-lib.c                     |    4 +-
 sound/soc/codecs/cs35l41.c                         |    3 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   75 -
 sound/soc/codecs/cs35l56-shared.c                  |  133 +-
 sound/soc/codecs/cs35l56.c                         |  211 +-
 sound/soc/codecs/cs35l56.h                         |    2 -
 sound/soc/codecs/cs530x-i2c.c                      |   72 +
 sound/soc/codecs/cs530x.c                          |  971 +++++++
 sound/soc/codecs/cs530x.h                          |  223 ++
 sound/soc/codecs/cs53l30.c                         |    3 +-
 sound/soc/codecs/cx2072x.c                         |    5 -
 sound/soc/codecs/da7213.c                          |    2 +-
 sound/soc/codecs/es8311.c                          |  973 +++++++
 sound/soc/codecs/es8311.h                          |  162 ++
 sound/soc/codecs/es8326.c                          |   58 +-
 sound/soc/codecs/framer-codec.c                    |    2 +-
 sound/soc/codecs/hdmi-codec.c                      |    2 +-
 sound/soc/codecs/idt821034.c                       |    2 +-
 sound/soc/codecs/jz4760.c                          |    2 +-
 sound/soc/codecs/jz4770.c                          |    2 +-
 sound/soc/codecs/lpass-macro-common.c              |   23 +
 sound/soc/codecs/lpass-macro-common.h              |   41 +
 sound/soc/codecs/lpass-rx-macro.c                  |  623 ++--
 sound/soc/codecs/lpass-tx-macro.c                  |    2 +-
 sound/soc/codecs/lpass-va-macro.c                  |   31 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  644 ++++-
 sound/soc/codecs/max98088.c                        |   10 +-
 sound/soc/codecs/max98390.c                        |    1 -
 sound/soc/codecs/max98504.c                        |    6 +-
 sound/soc/codecs/mt6358.c                          |   38 +-
 sound/soc/codecs/nau8822.c                         |   76 +-
 sound/soc/codecs/nau8822.h                         |    1 +
 sound/soc/codecs/nau8824.c                         |   21 +-
 sound/soc/codecs/nau8824.h                         |    1 +
 sound/soc/codecs/pcm3168a.c                        |    3 +-
 sound/soc/codecs/pcm512x-i2c.c                     |    2 +
 sound/soc/codecs/pcm512x-spi.c                     |    2 +
 sound/soc/codecs/pcm6240.c                         |   67 +-
 sound/soc/codecs/peb2466.c                         |    2 +-
 sound/soc/codecs/rk817_codec.c                     |    1 -
 sound/soc/codecs/rt1318.c                          | 1354 +++++++++
 sound/soc/codecs/rt1318.h                          |  342 +++
 sound/soc/codecs/rt1320-sdw.c                      | 2260 +++++++++++++++
 sound/soc/codecs/rt1320-sdw.h                      |   94 +
 sound/soc/codecs/rt711-sdca.c                      |   72 +
 sound/soc/codecs/rt711-sdca.h                      |    1 +
 sound/soc/codecs/rt712-sdca-sdw.c                  |   36 +-
 sound/soc/codecs/rt712-sdca-sdw.h                  |   95 +-
 sound/soc/codecs/rt712-sdca.c                      |  665 ++++-
 sound/soc/codecs/rt712-sdca.h                      |   48 +-
 sound/soc/codecs/simple-mux.c                      |   55 +-
 sound/soc/codecs/tas2552.c                         |    1 -
 sound/soc/codecs/tas2764.c                         |    1 -
 sound/soc/codecs/tas2770.c                         |    1 -
 sound/soc/codecs/tas2780.c                         |    1 -
 sound/soc/codecs/tas2781-comlib.c                  |   21 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   89 +-
 sound/soc/codecs/tas2781-i2c.c                     |  235 +-
 sound/soc/codecs/tas5086.c                         |   27 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |  106 +-
 sound/soc/codecs/tlv320adcx140.c                   |    1 -
 sound/soc/codecs/tlv320aic31xx.c                   |    1 -
 sound/soc/codecs/ts3a227e.c                        |    1 -
 sound/soc/codecs/wcd-mbhc-v2.c                     |    4 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    4 +-
 sound/soc/codecs/wcd9335.c                         |  128 +-
 sound/soc/codecs/wcd934x.c                         |   72 +-
 sound/soc/codecs/wcd937x-sdw.c                     | 1137 ++++++++
 sound/soc/codecs/wcd937x.c                         | 2971 ++++++++++++++++++++
 sound/soc/codecs/wcd937x.h                         |  624 ++++
 sound/soc/codecs/wcd938x-sdw.c                     |    4 +-
 sound/soc/codecs/wcd938x.c                         |   36 +-
 sound/soc/codecs/wcd938x.h                         |   10 +-
 sound/soc/codecs/wcd939x-sdw.c                     |    4 +-
 sound/soc/codecs/wcd939x.c                         |  176 +-
 sound/soc/codecs/wcd939x.h                         |   18 +-
 sound/soc/codecs/wm0010.c                          |    8 -
 sound/soc/codecs/wm_adsp.c                         |    2 +-
 sound/soc/codecs/wsa881x.c                         |    2 +-
 sound/soc/codecs/wsa883x.c                         |   11 +-
 sound/soc/codecs/wsa884x.c                         |   10 +-
 sound/soc/fsl/Kconfig                              |   18 +-
 sound/soc/fsl/Makefile                             |    4 +-
 sound/soc/fsl/fsl-asoc-card.c                      |  383 ++-
 sound/soc/fsl/fsl_aud2htx.c                        |   11 +-
 sound/soc/fsl/fsl_audmix.c                         |   16 +-
 sound/soc/fsl/fsl_easrc.c                          |   10 +-
 sound/soc/fsl/fsl_mqs.c                            |   46 +-
 sound/soc/fsl/fsl_qmc_audio.c                      |  591 ++--
 sound/soc/fsl/fsl_rpmsg.c                          |    9 +
 sound/soc/fsl/fsl_sai.c                            |  141 +-
 sound/soc/fsl/fsl_sai.h                            |    4 +-
 sound/soc/fsl/fsl_xcvr.c                           |  181 +-
 sound/soc/fsl/fsl_xcvr.h                           |   91 +
 sound/soc/fsl/imx-audmix.c                         |   79 +-
 sound/soc/fsl/imx-es8328.c                         |    1 -
 sound/soc/fsl/imx-pcm-fiq.c                        |    1 +
 sound/soc/fsl/imx-rpmsg.c                          |    2 -
 sound/soc/fsl/imx-spdif.c                          |  103 -
 sound/soc/fsl/lpc3xxx-i2s.c                        |  375 +++
 sound/soc/fsl/lpc3xxx-i2s.h                        |   80 +
 sound/soc/fsl/lpc3xxx-pcm.c                        |   72 +
 sound/soc/generic/audio-graph-card.c               |  113 +-
 .../soc/generic/audio-graph-card2-custom-sample.c  |    3 +-
 sound/soc/generic/audio-graph-card2.c              |  191 +-
 sound/soc/generic/simple-card-utils.c              |  129 +-
 sound/soc/generic/simple-card.c                    |   71 +-
 sound/soc/generic/test-component.c                 |    2 +-
 sound/soc/intel/avs/boards/es8336.c                |    8 +-
 sound/soc/intel/avs/pcm.c                          |    4 +-
 sound/soc/intel/avs/topology.c                     |    2 +-
 sound/soc/intel/boards/Kconfig                     |    2 +
 sound/soc/intel/boards/bdw-rt5650.c                |    2 +-
 sound/soc/intel/boards/ehl_rt5660.c                |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    4 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    6 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |    8 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |    6 +-
 sound/soc/intel/boards/sof_board_helpers.h         |    2 -
 sound/soc/intel/boards/sof_da7219.c                |   55 +-
 sound/soc/intel/boards/sof_es8336.c                |    2 +-
 sound/soc/intel/boards/sof_maxim_common.c          |  114 +-
 sound/soc/intel/boards/sof_nau8825.c               |    2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |    2 +-
 sound/soc/intel/boards/sof_rt5682.c                |    2 +-
 sound/soc/intel/boards/sof_sdw.c                   |   64 +-
 sound/soc/intel/boards/sof_sdw_common.h            |    6 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c           |   11 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |   11 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   11 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   11 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c            |    2 +-
 sound/soc/intel/boards/sof_sdw_rt_dmic.c           |   14 +-
 .../soc/intel/boards/sof_sdw_rt_sdca_jack_common.c |   11 +-
 sound/soc/intel/boards/sof_wm8804.c                |    2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   50 +
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   50 +
 sound/soc/intel/skylake/skl-topology.c             |    2 +-
 sound/soc/meson/axg-fifo.c                         |    2 +-
 sound/soc/meson/axg-frddr.c                        |    4 +-
 sound/soc/meson/axg-tdm.h                          |    2 +-
 sound/soc/meson/axg-toddr.c                        |    4 +-
 sound/soc/qcom/common.c                            |   35 +
 sound/soc/qcom/common.h                            |    3 +
 sound/soc/qcom/lpass-cpu.c                         |    4 +
 sound/soc/qcom/qdsp6/audioreach.c                  |   30 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |    2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   16 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |    3 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |   21 +-
 sound/soc/qcom/qdsp6/topology.c                    |   38 +-
 sound/soc/qcom/sc8280xp.c                          |   15 +
 sound/soc/qcom/x1e80100.c                          |   38 +
 sound/soc/rockchip/rockchip_i2s.c                  |    1 -
 sound/soc/rockchip/rockchip_spdif.c                |    1 -
 sound/soc/samsung/Kconfig                          |    2 +-
 sound/soc/samsung/aries_wm8994.c                   |    2 +-
 sound/soc/samsung/midas_wm1811.c                   |  348 ++-
 sound/soc/sh/fsi.c                                 |    2 +-
 sound/soc/sh/rcar/core.c                           |    2 +-
 sound/soc/soc-core.c                               |    4 +-
 sound/soc/soc-dai.c                                |   18 +-
 sound/soc/soc-dapm.c                               |   49 +-
 sound/soc/soc-ops.c                                |   26 +-
 sound/soc/soc-pcm.c                                |   26 +-
 sound/soc/soc-topology.c                           |  572 ++--
 sound/soc/soc-utils.c                              |   19 +-
 sound/soc/sof/intel/hda.c                          |    4 +-
 sound/soc/sof/intel/pci-tgl.c                      |    4 +-
 sound/soc/sof/ipc3-topology.c                      |   14 +-
 sound/soc/sof/ipc4-topology.c                      |   71 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |    2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |    2 +-
 sound/soc/sof/sof-audio.c                          |   20 +-
 sound/soc/sof/sof-audio.h                          |    9 +-
 sound/soc/sof/topology.c                           |    4 +-
 sound/soc/tegra/tegra210_i2s.c                     |   71 +-
 sound/soc/tegra/tegra210_i2s.h                     |    2 +
 tools/arch/arm64/include/asm/cputype.h             |    6 +
 tools/arch/x86/include/asm/msr-index.h             |    9 +-
 tools/arch/x86/include/uapi/asm/kvm.h              |   22 +-
 tools/include/uapi/asm-generic/unistd.h            |    5 +-
 tools/include/uapi/drm/i915_drm.h                  |   31 +-
 tools/include/uapi/linux/kvm.h                     |    4 +-
 tools/include/uapi/linux/stat.h                    |    4 +-
 tools/lib/bpf/features.c                           |    3 +-
 tools/perf/Makefile.perf                           |    1 +
 .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  |    1 +
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |    1 +
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |    1 +
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |    3 +-
 tools/perf/builtin-record.c                        |    6 +-
 tools/perf/builtin-trace.c                         |    2 +-
 .../beauty/arch/x86/include/asm/irq_vectors.h      |    8 +-
 tools/perf/trace/beauty/include/linux/socket.h     |    3 +-
 tools/perf/trace/beauty/include/uapi/linux/fcntl.h |   14 +-
 tools/perf/trace/beauty/include/uapi/linux/prctl.h |   22 +
 tools/perf/trace/beauty/include/uapi/linux/stat.h  |    4 +-
 tools/power/cpupower/utils/helpers/amd.c           |   26 +-
 tools/testing/cxl/test/mem.c                       |    1 +
 tools/testing/selftests/alsa/Makefile              |    2 +-
 .../selftests/bpf/progs/test_sk_storage_tracing.c  |    2 +-
 tools/testing/selftests/cachestat/test_cachestat.c |    1 +
 .../selftests/filesystems/overlayfs/dev_in_maps.c  |    1 +
 tools/testing/selftests/ftrace/config              |   26 +-
 .../ftrace/test.d/dynevent/test_duplicates.tc      |    2 +-
 .../ftrace/test.d/filter/event-filter-function.tc  |   20 +-
 .../ftrace/test.d/kprobe/kprobe_eventname.tc       |    3 +-
 tools/testing/selftests/futex/Makefile             |    2 -
 tools/testing/selftests/futex/functional/Makefile  |    2 +-
 .../selftests/futex/functional/futex_requeue_pi.c  |    2 +-
 tools/testing/selftests/kvm/Makefile               |    1 +
 .../selftests/kvm/s390x/shared_zeropage_test.c     |  111 +
 tools/testing/selftests/net/hsr/config             |    1 +
 tools/testing/selftests/net/lib.sh                 |   18 +-
 tools/testing/selftests/openat2/openat2_test.c     |    1 +
 661 files changed, 23899 insertions(+), 5937 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2901.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4104.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4554.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4104.yaml
 rename Documentation/devicetree/bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml} (94%)
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4554.yaml
 rename Documentation/devicetree/bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml} (94%)
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
 rename Documentation/devicetree/bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml} (94%)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4270.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/cs42xx8.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/everest,es7134.txt
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es71x4.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/everest,es7241.txt
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7241.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
 rename Documentation/devicetree/bindings/sound/{sgtl5000.yaml => fsl,sgtl5000.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{linux,spdif-dit.yaml => linux,spdif.yaml} (75%)
 delete mode 100644 Documentation/devicetree/bindings/sound/maxim,max98088.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98088.yaml
 rename Documentation/devicetree/bindings/sound/{zl38060.yaml => mscc,zl38060.yaml} (96%)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
 rename Documentation/devicetree/bindings/sound/{rt1019.yaml => realtek,rt1019.yaml} (90%)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5645.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5514.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5631.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5645.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5659.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5677.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/spdif-receiver.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/tas571x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
 rename Documentation/devicetree/bindings/sound/{tas2562.yaml => ti,tas2562.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{tas2770.yaml => ti,tas2770.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{tas27xx.yaml => ti,tas27xx.yaml} (97%)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
 rename Documentation/devicetree/bindings/sound/{tas5805m.yaml => ti,tas5805m.yaml} (95%)
 rename Documentation/devicetree/bindings/sound/{tlv320adcx140.yaml => ti,tlv320adcx140.yaml} (99%)
 rename Documentation/devicetree/bindings/sound/{wm8750.yaml => wlf,wm8750.yaml} (92%)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8782.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8804.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8782.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8804.txt
 rename {include/linux => drivers/cpufreq}/amd-pstate.h (82%)
 create mode 100644 include/dt-bindings/sound/audio-graph.h
 create mode 100644 include/sound/rt1318.h
 create mode 100644 sound/soc/codecs/ak4619.c
 create mode 100644 sound/soc/codecs/cs530x-i2c.c
 create mode 100644 sound/soc/codecs/cs530x.c
 create mode 100644 sound/soc/codecs/cs530x.h
 create mode 100644 sound/soc/codecs/es8311.c
 create mode 100644 sound/soc/codecs/es8311.h
 create mode 100644 sound/soc/codecs/rt1318.c
 create mode 100644 sound/soc/codecs/rt1318.h
 create mode 100644 sound/soc/codecs/rt1320-sdw.c
 create mode 100644 sound/soc/codecs/rt1320-sdw.h
 create mode 100644 sound/soc/codecs/wcd937x-sdw.c
 create mode 100644 sound/soc/codecs/wcd937x.c
 create mode 100644 sound/soc/codecs/wcd937x.h
 delete mode 100644 sound/soc/fsl/imx-spdif.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c
 create mode 100644 tools/testing/selftests/kvm/s390x/shared_zeropage_test.c
