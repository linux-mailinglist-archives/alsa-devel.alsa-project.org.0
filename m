Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59FB8B51A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Sep 2025 23:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA67B601F9;
	Fri, 19 Sep 2025 23:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA67B601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758316806;
	bh=6WVboNOcQvkxCmYkOodmkAYsmhkUiB/nv6DNDonJWT4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GLrV8zmvi930EZvaCyTmbqX3llNqWU/BiefTS0VO2VX8d4FGT8b8+JAPtg/AKjo8J
	 Blv/9GIuD7dY2e4hOGWatJqAujeDfpsyeZztIbk6paKA3Zuv75GJDTEal+drv1AJ1O
	 FO3HsqTQTyhvI28/wvLeXydTe0MmRbxodCQmISuM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF61F805BE; Fri, 19 Sep 2025 23:19:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7EEF805C9;
	Fri, 19 Sep 2025 23:19:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26DD3F8027B; Fri, 19 Sep 2025 23:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F106CF8014C
	for <alsa-devel@alsa-project.org>; Fri, 19 Sep 2025 23:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F106CF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P0pELWuS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDBD241844;
	Fri, 19 Sep 2025 21:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24590C4CEF0;
	Fri, 19 Sep 2025 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758316727;
	bh=6WVboNOcQvkxCmYkOodmkAYsmhkUiB/nv6DNDonJWT4=;
	h=From:To:Cc:Subject:Date:From;
	b=P0pELWuS/xkiZG97R4pj1whVu1M6o+vXRGfWmPLW8SfFg7FncpGPpb+YvXjQkYrJK
	 pW0Uz1UBXRsUdoDPgtn59nUT9+YUajItwDBqN87MgONrguPqJ67rCkb0qlHqvS9Y7e
	 /5lhP4IftCzUylrQ1OwticSmz62YsmYgzSWICkiOn9KRXX3kClROnUcjqA75zifjcC
	 gZ+2HqRnjXQTjOpX1oC58nPx4KTbOdK99LawJYfsqR/zSXta04mIJrbcovdU02oIpu
	 P6lizfeAizb9lM9CKOEqRt1++IlqB8pMcW1Re3eyZwx9ieKjMC+lM4jwgDrAnCeN35
	 +N2wo4fd59jgA==
Message-ID: <361b7c7101944b7f1b159066d9788fe9@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.18
Date: Fri, 19 Sep 2025 22:18:40 +0100
Message-ID-Hash: L67XNVVADA3LWHRIT2RQORDMQFZZQCLC
X-Message-ID-Hash: L67XNVVADA3LWHRIT2RQORDMQFZZQCLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L67XNVVADA3LWHRIT2RQORDMQFZZQCLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.18

for you to fetch changes up to 5998f0d07d2c4bf3d8ecc4e6218e6a324aeb7301:

  ASoC: fsl: fsl_qmc_audio: Reduce amount of (2025-09-19 21:23:48 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.18

A relatively quiet release for ASoC, we've had a lot of maintainance
work going on and several new drivers but really the most remarkable
thing is that we removed a driver, the WL1273 driver used in some old
Nokia systems that have had the underlying system support removed from
the kernel.

 - Morimoto-san continues his work on cleanups of the core APIs and
   enforcement of abstraction layers.
 - Lots of cleanups and conversions of DT bindings.
 - Substantial maintainance work on the Intel AVS drivers.
 - Support for Qualcomm Glymur and PM4125, Realtek RT1321, Shanghai
   FourSemi FS2104/5S, Texas Instruments PCM1754.
 - Remove support for TI WL1273.

----------------------------------------------------------------
Alex Tran (3):
      ASoC: codecs: tlv320dac33: Remove unused struct tlv320dac33_platform_data and header file tlv320dac33-plat.h
      ASoC: codecs: tlv320dac33: Add default value for burst_bclkdiv
      ASoC: codecs: tlv320dac33: Convert to use gpiod api

Alexey Klimov (4):
      ASoC: codecs: add new pm4125 audio codec driver
      MAINTAINERS: add Qualcomm PM4125 audio codec to drivers list
      ASoC: dt-bindings: add bindings for pm4125 audio codec
      ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()

Alvin Šipraga (1):
      ASoC: codecs: pcm1754: add pcm1754 dac driver

Andy Shevchenko (1):
      ASoC: amd: acp: Remove (explicitly) unused header

Arnd Bergmann (2):
      ASoC: add GPIOLIB_LEGACY dependency where needed
      ASoC: pxa: add GPIOLIB_LEGACY dependency

Bagas Sanjaya (1):
      ASoC: doc: Internally link to Writing an ALSA Driver docs

Bard Liao (3):
      ASoC: SOF: Intel: split codec mask detect and programming UNSOL
      ASoC: SOF: Intel: only detect codecs when HDA DSP probe
      ASoC: Intel: hda-sdw-bpt: set persistent_buffer false

Cezary Rojewski (28):
      ASoC: Intel: avs: Parse conditional path tuples
      ASoC: Intel: avs: Conditional-path support
      ASoC: Intel: avs: Separate debug symbols
      ASoC: Intel: avs: Drop pcm.h dependency for probes
      ASoC: Intel: avs: Do not share the name pointer between components
      ASoC: Intel: avs: Streamline register-component function names
      ASoC: Intel: avs: New board registration routines
      ASoC: Intel: avs: Cleanup duplicate members
      ASoC: Intel: avs: Simplify dmi_match_quirk()
      ASoC: Intel: avs: Simplify avs_get_i2s_boards()
      ASoC: Intel: avs: Allow i2s test and non-test boards to coexist
      ASoC: Intel: avs: hda: Adjust platform name
      ASoC: Intel: avs: da7219: Adjust platform name
      ASoC: Intel: avs: dmic: Refactor dai_link creation
      ASoC: Intel: avs: es8336: Adjust platform name
      ASoC: Intel: avs: i2stest: Adjust platform name
      ASoC: Intel: avs: max98357a: Adjust platform name
      ASoC: Intel: avs: max98373: Adjust platform name
      ASoC: Intel: avs: max98927: Adjust platform name
      ASoC: Intel: avs: nau8825: Adjust platform name
      ASoC: Intel: avs: probe: Refactor dai_link creation
      ASoC: Intel: avs: rt274: Adjust platform name
      ASoC: Intel: avs: rt286: Adjust platform name
      ASoC: Intel: avs: rt298: Adjust platform name
      ASoC: Intel: avs: rt5514: Adjust platform name
      ASoC: Intel: avs: rt5663: Adjust platform name
      ASoC: Intel: avs: rt5682: Adjust platform name
      ASoC: Intel: avs: ssm4567: Adjust platform name

Chancel Liu (1):
      ASoC: dmaengine_pcm: Add port_window_size to DAI dma data struct

Charles Han (1):
      ASoC: codecs: fs210x: Add NULL check in fs210x_register_snd_component

Charles Keepax (4):
      ASoC: cs42l43: Rename system suspend callback and fix debug print
      ASoC: cs42l43: Store IRQ domain in codec private data
      ASoC: cs42l43: Disable IRQs in system suspend
      ASoC: cs42l43: Shutdown jack detection on suspend

Chen-Yu Tsai (1):
      ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()

Christophe Leroy (4):
      soc: fsl: qmc: Only set completion interrupt when needed
      ASoC: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
      ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
      ASoC: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan

Colin Ian King (1):
      ASoC: SOF: ipc4-topology: Fix a less than zero check on a u32

Dr. David Alan Gilbert (1):
      ASoC: wl1273: Remove

Geert Uytterhoeven (1):
      ASoC: da7213: Convert to DEFINE_RUNTIME_DEV_PM_OPS()

Jihed Chaibi (5):
      ASoC: dt-bindings: ti,twl4030-audio: convert to DT schema
      ASoC: dt-bindings: omap-twl4030: convert to DT schema
      ASoC: dt-bindings: everest,es8316: Document routing strings
      ASoC: dt-bindings: nuvoton,nau8825: Document routing strings
      ASoC: dt-bindings: wlf,wm8960: Document routing strings (pin names)

Jonas Rebmann (1):
      ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties

Jyri Sarha (6):
      ASoC: SOF: sof-client-probes-ipc4: Implement ipc4_probes_points_info
      ASoC: SOF: IPC4: Add GET macros for module id and module instance id
      ASoC: SOF: sof-client: Add sof_client_ipc4_find_swidget_by_id()
      ASoC: SOF: sof-client-probes-ipc4: Human readable debugfs "probe_points"
      ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
      ASoC: sof: ipc4-topology: Add support to sched_domain attribute

Krzysztof Kozlowski (1):
      ASoC: dt-bindings: Minor whitespace cleanup in example

Kuninori Morimoto (27):
      ASoC: soc-dapm: move snd_soc_dapm_get_bias_level() to soc-dpcm
      ASoC: soc-dapm: move snd_soc_dapm_init_bias_level() to soc-dpcm
      ASoC: soc-component: unpack snd_soc_component_force_bias_level()
      ASoC: soc-component: unpack snd_soc_component_get_bias_level()
      ASoC: soc-component: unpack snd_soc_component_init_bias_level()
      ASoC: renesas: msiof: msiof_update_and_wait() checks whether reg was updated
      ASoC: renesas: msiof: tidyup error message
      ASoC: renesas: msiof: cleanup status clear method
      ASoC: renesas: msiof: start DMAC first
      ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_widget() to snd_soc_dapm_kcontrol_to_widget()
      ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
      ASoC: soc-dapm: rename dapm_kcontrol_get_value() to snd_soc_dapm_kcontrol_get_value()
      ASoC: soc-dapm: rename snd_soc_kcontrol_component() to snd_soc_kcontrol_to_component()
      ASoC: renesas: msiof: Use guard() for spin locks
      ASoC: renesas: rsnd: Use guard() for spin locks
      ASoC: renesas: fsi: Use guard() for spin locks
      ASoC: renesas: rz-ssi: Use guard() for spin locks
      ASoC: soc-dapm: add snd_soc_dapm_to_dev()
      ASoC: soc-dapm: add snd_soc_dapm_to_card()
      ASoC: soc-dapm: use dapm->component instead of container_of()
      ASoC: soc-component: add snd_soc_component_to_dapm()
      ASoC: soc-card: add snd_soc_card_to_dapm()
      ASoC: soc-dapm: remove suspend_bias_off from snd_soc_dapm_context
      ASoC: soc-dapm: tidyup idle_bias handling - step1
      ASoC: soc-dapm: tidyup idle_bias handling - step2
      ASoC: soc-dapm: add snd_soc_dapm_get_bias_level()
      ASoC: soc-dapm: add snd_soc_dapm_set_idle_bias()

Liao Yuanhong (1):
      ASoC: Intel: sst: Remove redundant semicolons

Mahdi Khosravi (1):
      ASoC: dt-bindings: realtek,alc5623: convert to DT schema

Marco Crivellari (1):
      ASoC: replace use of system_unbound_wq with system_dfl_wq

Mark Brown (29):
      ASoC: unpack snd_soc_component_xxx_bias_level()
      ASoC: Intel: avs: Conditional path support
      ASoC: codecs: Add support for FourSemi FS2104/5S
      gpiolib: fence off legacy interfaces
      Handle shared reset GPIO for WSA883x speakers
      ASoC: es8323: power and mixer controls cleanup and
      ASoC: Intel: avs: Code cleanups and separation
      ASoC: qcom: audioreach: cleanup and calibration
      ASoC: dt-bindings: Convert TI TWL4030 sound
      ASoC: Use kcalloc() instead of kzalloc()
      ASoC: renesas: msiof: Make small adjustments to avoid
      ASoC: use int type to store negative error codes
      ASoC: Intel: avs: Refactor machine-board registration
      ASoC: SOF: Intel: only detect codecs when HDA DSP
      ASoC: SOF: sof-client: Enforce client access scope
      ASoC: SOF: sof-client-probes-ipc4: Query available
      ASoC: SOF: ipc4: Add support for 8-bit and float
      ASoC: qcom: audioreach: fix sparse warnings
      ASoC: Intel: avs: Adjust platform names
      ASoC: dt-bindings: Document routing strings for
      Improve cs42l43 suspend/IRQ interactions
      ASoC: Intel: Fix invalid quirk input mapping
      ASoC: renesas: Use guard() for spin locks
      ASoC: codecs: pcm1754: add pcm1754 dac driver
      Add PM4125 audio codec driver
      ASoC: cs35l56: Handle vendor-specific UEFI
      ASoC: soc-dapm: prepare for hiding struct
      ASoC: codecs: wcd93xxx: remove code duplication
      ASoC: fsl: fsl_qmc_audio: Reduce amount of

Matthias Schiffer (1):
      ASoC: tlv320aic32x4: use dev_err_probe() for regulators

Mohammad Rafi Shaik (3):
      ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
      ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
      ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP

Nick Li (5):
      dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
      ASoC: dt-bindings: Add FS2104/5S audio amplifiers
      ASoC: codecs: Add library for FourSemi audio amplifiers
      ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver
      MAINTAINERS: Add entry for FourSemi audio amplifiers

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-pcm: Add fixup for channels
      ASoC: SOF: sof-client: Convert sof_client_dev_to_sof_dev into function
      ASoC: SOF: sof-client: Introduce sof_client_dev_entry structure

Qianfeng Rong (6):
      ASoC: codecs: Use kcalloc() instead of kzalloc()
      ASoC: fsl: Use kcalloc() instead of kzalloc()
      ASoC: test-component: Use kcalloc() instead of kzalloc()
      ASoC: amd: use int type to store negative error codes
      ASoC: adau1977: use int type to store negative error codes
      ASoC: qcom: use int type to store negative error codes

Richard Fitzgerald (6):
      ASoC: cs-amp-lib: Rename defines for Cirrus Logic EFI
      ASoC: cs-amp-lib: Add handling for Lenovo and HP UEFI speaker ID
      ASoC: cs35l56: Check for vendor-specific speaker ID value
      ASoC: cs-amp-lib-test: Add tests for cs_amp_get_vendor_spkid()
      ASoC: cs-amp-lib: Add HP-specific EFI variable for calibration data
      ASoC: cs-amp-lib-test: Add test for getting cal data from HP EFI

Rob Herring (Arm) (3):
      ASoC: dt-bindings: Drop imx-audio-sgtl5000.txt
      ASoC: dt-bindings: Convert brcm,bcm2835-i2s to DT schema
      ASoC: dt-bindings: linux,spdif: Add "port" node

Samasth Norway Ananda (1):
      ASoC: SOF: ipc3-dtrace: fix potential integer overflow in allocation

Seppo Ingalsuo (2):
      ASoC: SOF: ipc4-topology: Add support for 8-bit formats
      ASoC: SOF: ipc4-topology: Add support for float sample type

Shenghao Ding (1):
      ASoC: tas2781: Add keyword "init" in profile section

Shengjiu Wang (1):
      ASoC: imx-hdmi: remove cpu_pdev related code

Shimrra Shai (4):
      ASoC: es8323: enable DAPM power widgets for playback DAC and output
      ASoC: es8323: remove DAC enablement write from es8323_probe
      ASoC: es8323: add proper left/right mixer controls via DAPM
      ASoC: es8323: enable DAPM power widgets for playback DAC

Shuming Fan (2):
      ASoC: rt721: add some vendor registers
      ASoC: rt1321: Add RT1321 amplifier support

Srinivas Kandagatla (28):
      ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
      ASoC: qcom: audioreach: add documentation for i2s interface type
      ASoC: qcom: audioreach: add support for static calibration
      ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
      ASoC: qcom: audioreach: sort modules based on hex ids
      ASoC: qcom: audioreach: add support for SMECNS module
      ASoC: qcom: audioreach: fix potential null pointer dereference
      ASoC: qcom: topology: convert to cpu endainess type before accessing
      ASoC: qcom: audioreach: convert to cpu endainess type before accessing
      ASoC: qcom: x1e80100: set card driver name from match data
      ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
      ASoC: qcom: x1e80100: add compatible for glymur SoC
      ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va macro codecs
      ASoC: codecs: lpass-macro: add Codec version 2.9
      ASoC: codecs: lpass-wsa-macro: add Codev version 2.9
      ASoC: codecs: wcd937x: set the comp soundwire port correctly
      ASoC: codecs: wcd937x: make stub functions inline
      soundwire: bus: add of_sdw_find_device_by_node helper
      soundwire: bus: add sdw_slave_get_current_bank helper
      ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
      ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
      ASoC: codecs: wcd: add common helper for wcd codecs
      ASoC: codecs: wcd-common: move WCD_SDW_CH to common
      ASoC: codecs: wcd-common: move component ops to common
      ASoC: codecs: wcd939x: get regmap directly
      ASoC: codecs: wcd-common: move status_update callback to common
      ASoC: codecs: wcd938x: get regmap directly
      ASoC: codecs: wcd937x: get regmap directly

Stefan Kerkmann (1):
      ASoC: dt-bindings: ti,pcm1754: add binding documentation

Takashi Iwai (3):
      ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
      ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
      ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping

Terry Cheong (1):
      ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks

Waqar Hameed (1):
      ASoC: SOF: imx: Remove error print for devm_add_action_or_reset()

Wolfram Sang (1):
      ASoC: remove unneeded 'fast_io' parameter in regmap_config

Xichao Zhao (3):
      ASoC: cs48l32: Use PTR_ERR_OR_ZERO() to simplify code
      ASoC: fix "dependant"->"dependent"
      ASoC: SOF: imx: Remove the use of dev_err_probe()

 .../devicetree/bindings/mfd/twl4030-audio.txt      |   46 -
 .../devicetree/bindings/sound/alc5623.txt          |   25 -
 .../bindings/sound/asahi-kasei,ak4458.yaml         |    4 +
 .../devicetree/bindings/sound/brcm,bcm2835-i2s.txt |   24 -
 .../bindings/sound/brcm,bcm2835-i2s.yaml           |   51 +
 .../devicetree/bindings/sound/everest,es8316.yaml  |   16 +
 .../bindings/sound/foursemi,fs2105s.yaml           |  101 ++
 .../devicetree/bindings/sound/fsl,easrc.yaml       |    2 +-
 .../devicetree/bindings/sound/fsl,imx-asrc.yaml    |    2 +-
 .../bindings/sound/imx-audio-sgtl5000.txt          |   56 -
 .../devicetree/bindings/sound/linux,spdif.yaml     |    3 +
 .../devicetree/bindings/sound/nuvoton,nau8825.yaml |   14 +
 .../devicetree/bindings/sound/omap-twl4030.txt     |   62 -
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   24 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |    1 +
 .../bindings/sound/qcom,pm4125-codec.yaml          |  134 ++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   79 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    1 +
 .../devicetree/bindings/sound/qcom,wsa883x.yaml    |   11 +-
 .../devicetree/bindings/sound/realtek,alc5623.yaml |   54 +
 .../devicetree/bindings/sound/ti,omap-twl4030.yaml |   98 ++
 .../devicetree/bindings/sound/ti,pcm1754.yaml      |   55 +
 .../bindings/sound/ti,twl4030-audio.yaml           |   90 +
 .../devicetree/bindings/sound/wlf,wm8960.yaml      |   22 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/sound/soc/codec.rst                  |    4 +-
 Documentation/sound/soc/platform.rst               |    4 +-
 MAINTAINERS                                        |   10 +
 drivers/soc/fsl/qe/qmc.c                           |   44 +-
 drivers/soundwire/bus.c                            |   12 +
 drivers/soundwire/slave.c                          |    6 +
 include/linux/soundwire/sdw.h                      |   17 +
 include/sound/cs-amp-lib.h                         |    1 +
 include/sound/dmaengine_pcm.h                      |    5 +
 include/sound/soc-component.h                      |   79 +-
 include/sound/soc-dapm.h                           |   61 +-
 include/sound/soc.h                                |    5 +
 include/sound/sof/ipc4/header.h                    |    4 +
 include/sound/tas2781-dsp.h                        |    8 +
 include/sound/tlv320dac33-plat.h                   |   21 -
 include/uapi/sound/intel/avs/tokens.h              |   15 +
 include/uapi/sound/snd_ar_tokens.h                 |   20 +-
 include/uapi/sound/sof/tokens.h                    |    2 +
 sound/core/pcm_dmaengine.c                         |    2 +
 sound/soc/amd/acp/acp-rembrandt.c                  |    2 +-
 sound/soc/amd/acp/amd-sdw-acpi.c                   |    2 +-
 sound/soc/amd/raven/acp3x-i2s.c                    |    3 +-
 sound/soc/amd/vangogh/acp5x-i2s.c                  |    3 +-
 sound/soc/codecs/Kconfig                           |   53 +-
 sound/soc/codecs/Makefile                          |   18 +-
 sound/soc/codecs/adau1977.c                        |    2 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |  252 ++-
 sound/soc/codecs/cs-amp-lib.c                      |  139 +-
 sound/soc/codecs/cs35l56-shared.c                  |   12 +-
 sound/soc/codecs/cs42l43-jack.c                    |    8 +-
 sound/soc/codecs/cs42l43.c                         |  109 +-
 sound/soc/codecs/cs42l43.h                         |    3 +
 sound/soc/codecs/cs48l32-tables.c                  |    4 +-
 sound/soc/codecs/da7213.c                          |    6 +-
 sound/soc/codecs/es8323.c                          |   17 +-
 sound/soc/codecs/fs-amp-lib.c                      |  265 +++
 sound/soc/codecs/fs-amp-lib.h                      |  150 ++
 sound/soc/codecs/fs210x.c                          | 1586 +++++++++++++++++
 sound/soc/codecs/fs210x.h                          |   75 +
 sound/soc/codecs/lpass-macro-common.h              |    1 +
 sound/soc/codecs/lpass-va-macro.c                  |    2 +
 sound/soc/codecs/lpass-wsa-macro.c                 |    2 +
 sound/soc/codecs/pcm1754.c                         |  185 ++
 sound/soc/codecs/pcm6240.c                         |    4 +-
 sound/soc/codecs/pm4125-sdw.c                      |  545 ++++++
 sound/soc/codecs/pm4125.c                          | 1780 ++++++++++++++++++++
 sound/soc/codecs/pm4125.h                          |  307 ++++
 sound/soc/codecs/rt1320-sdw.c                      |  380 ++++-
 sound/soc/codecs/rt1320-sdw.h                      |   10 +
 sound/soc/codecs/rt721-sdca-sdw.c                  |   10 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   12 +
 sound/soc/codecs/tas2781-i2c.c                     |    6 +
 sound/soc/codecs/tlv320aic32x4.c                   |   18 +-
 sound/soc/codecs/tlv320dac33.c                     |   69 +-
 sound/soc/codecs/wcd-common.c                      |  143 ++
 sound/soc/codecs/wcd-common.h                      |   46 +
 sound/soc/codecs/wcd934x.c                         |   82 +-
 sound/soc/codecs/wcd937x-sdw.c                     |   67 +-
 sound/soc/codecs/wcd937x.c                         |   93 +-
 sound/soc/codecs/wcd937x.h                         |   24 +-
 sound/soc/codecs/wcd938x-sdw.c                     |   83 +-
 sound/soc/codecs/wcd938x.c                         |   99 +-
 sound/soc/codecs/wcd938x.h                         |   26 +-
 sound/soc/codecs/wcd939x-sdw.c                     |   98 +-
 sound/soc/codecs/wcd939x.c                         |  104 +-
 sound/soc/codecs/wcd939x.h                         |   32 +-
 sound/soc/codecs/wl1273.c                          |  500 ------
 sound/soc/codecs/wl1273.h                          |   16 -
 sound/soc/codecs/wm8993.c                          |    2 +-
 sound/soc/codecs/wm8994.c                          |    6 +-
 sound/soc/codecs/wm8994.h                          |   12 +-
 sound/soc/codecs/wm8996.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |    2 +-
 sound/soc/codecs/wsa883x.c                         |   57 +-
 sound/soc/fsl/fsl_qmc_audio.c                      |  125 +-
 sound/soc/fsl/fsl_sai.c                            |    3 +-
 sound/soc/fsl/imx-audmux.c                         |    2 +-
 sound/soc/fsl/imx-hdmi.c                           |   13 +-
 sound/soc/generic/test-component.c                 |    4 +-
 sound/soc/intel/atom/sst/sst.c                     |    2 +-
 sound/soc/intel/avs/apl.c                          |    1 +
 sound/soc/intel/avs/avs.h                          |   90 +-
 sound/soc/intel/avs/board_selection.c              |  309 ++--
 sound/soc/intel/avs/boards/da7219.c                |   15 +-
 sound/soc/intel/avs/boards/dmic.c                  |   80 +-
 sound/soc/intel/avs/boards/es8336.c                |   18 +-
 sound/soc/intel/avs/boards/hdaudio.c               |   13 +-
 sound/soc/intel/avs/boards/i2s_test.c              |   15 +-
 sound/soc/intel/avs/boards/max98357a.c             |   15 +-
 sound/soc/intel/avs/boards/max98373.c              |   15 +-
 sound/soc/intel/avs/boards/max98927.c              |   15 +-
 sound/soc/intel/avs/boards/nau8825.c               |   15 +-
 sound/soc/intel/avs/boards/probe.c                 |   49 +-
 sound/soc/intel/avs/boards/rt274.c                 |   17 +-
 sound/soc/intel/avs/boards/rt286.c                 |   15 +-
 sound/soc/intel/avs/boards/rt298.c                 |   15 +-
 sound/soc/intel/avs/boards/rt5514.c                |   15 +-
 sound/soc/intel/avs/boards/rt5640.c                |    2 +-
 sound/soc/intel/avs/boards/rt5663.c                |   15 +-
 sound/soc/intel/avs/boards/rt5682.c                |   15 +-
 sound/soc/intel/avs/boards/ssm4567.c               |   15 +-
 sound/soc/intel/avs/cnl.c                          |    1 +
 sound/soc/intel/avs/core.c                         |    1 +
 sound/soc/intel/avs/debug.h                        |   91 +
 sound/soc/intel/avs/debugfs.c                      |    1 +
 sound/soc/intel/avs/icl.c                          |    1 +
 sound/soc/intel/avs/ipc.c                          |    1 +
 sound/soc/intel/avs/lnl.c                          |    1 +
 sound/soc/intel/avs/mtl.c                          |    1 +
 sound/soc/intel/avs/path.c                         |  267 +++
 sound/soc/intel/avs/path.h                         |   13 +
 sound/soc/intel/avs/pcm.c                          |   35 +-
 sound/soc/intel/avs/probes.c                       |   23 +-
 sound/soc/intel/avs/ptl.c                          |    1 +
 sound/soc/intel/avs/skl.c                          |    1 +
 sound/soc/intel/avs/tgl.c                          |    1 +
 sound/soc/intel/avs/topology.c                     |  110 ++
 sound/soc/intel/avs/topology.h                     |    8 +
 sound/soc/intel/boards/bytcht_cx2072x.c            |    2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   22 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    9 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   28 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    2 +-
 sound/soc/intel/boards/sof_es8336.c                |    2 +-
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |   19 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c          |    2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    8 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |    2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |    4 +-
 sound/soc/pxa/Kconfig                              |    4 +-
 sound/soc/qcom/lpass-cdc-dma.c                     |    3 +-
 sound/soc/qcom/lpass-hdmi.c                        |    2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |   27 +
 sound/soc/qcom/qdsp6/audioreach.h                  |   18 +-
 sound/soc/qcom/qdsp6/topology.c                    |   45 +-
 sound/soc/qcom/sc8280xp.c                          |    3 +
 sound/soc/qcom/x1e80100.c                          |    5 +-
 sound/soc/renesas/fsi.c                            |   30 +-
 sound/soc/renesas/rcar/core.c                      |   18 +-
 sound/soc/renesas/rcar/msiof.c                     |   58 +-
 sound/soc/renesas/rcar/src.c                       |   19 +-
 sound/soc/renesas/rcar/ssi.c                       |   35 +-
 sound/soc/renesas/rz-ssi.c                         |   14 +-
 sound/soc/soc-core.c                               |    4 +-
 sound/soc/soc-dapm.c                               |  121 +-
 sound/soc/sof/imx/imx-common.c                     |    6 +-
 sound/soc/sof/imx/imx8.c                           |    3 +-
 sound/soc/sof/intel/hda-codec.c                    |    3 -
 sound/soc/sof/intel/hda-ctrl.c                     |    8 +-
 sound/soc/sof/intel/hda-dsp.c                      |    2 +-
 sound/soc/sof/intel/hda-sdw-bpt.c                  |    2 +-
 sound/soc/sof/intel/hda.c                          |    2 +-
 sound/soc/sof/intel/hda.h                          |    2 +-
 sound/soc/sof/ipc3-dtrace.c                        |    2 +-
 sound/soc/sof/ipc4-pcm.c                           |   56 +
 sound/soc/sof/ipc4-topology.c                      |  187 +-
 sound/soc/sof/ipc4-topology.h                      |   16 +
 sound/soc/sof/sof-audio.h                          |    3 +
 sound/soc/sof/sof-client-probes-ipc3.c             |   25 +-
 sound/soc/sof/sof-client-probes-ipc4.c             |  134 +-
 sound/soc/sof/sof-client-probes.c                  |   60 +-
 sound/soc/sof/sof-client-probes.h                  |    9 +-
 sound/soc/sof/sof-client.c                         |  118 +-
 sound/soc/sof/sof-client.h                         |    8 +-
 sound/soc/sof/sof-priv.h                           |    9 +
 193 files changed, 8911 insertions(+), 2552 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl4030-audio.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/alc5623.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-twl4030.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,alc5623.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1754.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
 delete mode 100644 include/sound/tlv320dac33-plat.h
 create mode 100644 sound/soc/codecs/fs-amp-lib.c
 create mode 100644 sound/soc/codecs/fs-amp-lib.h
 create mode 100644 sound/soc/codecs/fs210x.c
 create mode 100644 sound/soc/codecs/fs210x.h
 create mode 100644 sound/soc/codecs/pcm1754.c
 create mode 100644 sound/soc/codecs/pm4125-sdw.c
 create mode 100644 sound/soc/codecs/pm4125.c
 create mode 100644 sound/soc/codecs/pm4125.h
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h
 delete mode 100644 sound/soc/codecs/wl1273.c
 delete mode 100644 sound/soc/codecs/wl1273.h
 create mode 100644 sound/soc/intel/avs/debug.h
