Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C0C98FD0
	for <lists+alsa-devel@lfdr.de>; Mon, 01 Dec 2025 21:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D85060206;
	Mon,  1 Dec 2025 21:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D85060206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764620274;
	bh=tdaP4z3hTukds2uW/f2oRW9DMTIm+IlvY1ci/ePuxXo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oTeTMz+bvLCozXlwSbMuZCRkALFI9sdAE0GkSlWNbAg4fEvuD8DyO/OvBRYv8QHIT
	 Czn/175yDV6AYCDElMLlpzST1TseBa7bNdqgqBShVUB2WZtlGZS88QyKNHPEtwrDQk
	 kMvNazIfB1cNzQwrsrlUc4pIw5WZIoN1MkydvEss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E5F5F805D4; Mon,  1 Dec 2025 21:17:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06719F805C6;
	Mon,  1 Dec 2025 21:17:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE857F8049C; Mon,  1 Dec 2025 21:17:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,PP_MIME_FAKE_ASCII_TEXT,T_SPF_HELO_TEMPERROR,
	T_SPF_TEMPERROR shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F9B5F800B5
	for <alsa-devel@alsa-project.org>; Mon,  1 Dec 2025 21:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F9B5F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iWzee2ta
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C52456014A;
	Mon,  1 Dec 2025 20:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E9DC4CEF1;
	Mon,  1 Dec 2025 20:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764620210;
	bh=tdaP4z3hTukds2uW/f2oRW9DMTIm+IlvY1ci/ePuxXo=;
	h=From:To:Cc:Subject:Date:From;
	b=iWzee2ta+dVwNMSZV1ZJlAKMMPgxl+lyhCRYEZVtCUburJD0WuX1K5zXdQqAXl9Ay
	 rfyHIAiowCuTWPgkjh4OaoffFMXTNRq/lWY1rzicfQGubyXkfflKs8soILF8WQbypw
	 PXGH72YfbXaChNtrfK5M9t8fuFrkqwwQ7D1S76WGbADc/MPEo+5bA5Ih5UW4LyUeLY
	 mtZRlIAoaqUa7Thcarw1ls1RVY8sfi6V1obT4sFahWdkm7CCs2Pk+ATKtC0afwW8XD
	 d8xdKGTA7m6Ocg960YxSLeCPlfQgPSK14/4yHG2ciS+ANeham7rPuVKzr+gxKxAftX
	 MHnXqnpukiDTg==
Message-ID: <fd193c0585cf7316a3b13eda44196a30@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.19
Date: Mon, 01 Dec 2025 20:16:35 +0000
Message-ID-Hash: 6XSAE6A6CD646WY2LX5P5FORNLAWM33E
X-Message-ID-Hash: 6XSAE6A6CD646WY2LX5P5FORNLAWM33E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XSAE6A6CD646WY2LX5P5FORNLAWM33E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.19

for you to fetch changes up to c5fae31f60a91dbe884ef2789fb3440bb4cddf05:

  ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.19

This is a very large set of updates, as well as some more extensive
cleanup work from Morimto-san we've also added a generic SCDA class
driver for SoundWire devices enabling us to support many chips with
no custom code.  There's also a batch of new drivers added for both
SoCs and CODECs.

 - Added a SoundWire SCDA generic class driver, pulling in a little
   regmap work to support it.
 - A *lot* of cleaup and API improvement work from Morimoto-san.
 - Lots of work on the existing Cirrus, Intel, Maxim and Qualcomm
   drivers.
 - Support for Allwinner A523, Mediatek MT8189, Qualcomm QCM2290,
   QRB2210 and SM6115, SpacemiT K1, and TI TAS2568, TAS5802, TAS5806,
   TAS5815, TAS5828 and TAS5830.

This also pulls in some gpiolib changes supporting shared GPIOs in the
core there so we can convert some of the ASoC drivers open coding
handling of that to the core functionality.

----------------------------------------------------------------
Alex Tran (1):
      ASoC: codecs: rt5670: use SOC_VALUE_ENUM_SINGLE_DECL for DAC2 L/R MX-1B

Alexander Stein (1):
      ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return

Alexey Klimov (2):
      ASoC: dt-bindings: qcom,sm8250: add QRB2210 soundcard
      ASoC: qcom: sm8250: add qrb2210-sndcard compatible string

Balamurugan C (1):
      ASoC: Intel: sof_rt5682: Add quirk override support

Baojun Xu (6):
      ASoC: tas2781: Add TAS5802, TAS5815, and TAS5828
      ASoC: dt-bindings: ti,tas2781: Add TAS5802, TAS5815, and TAS5828
      ASoC: tas2781: Add tas5822 support
      ASoC: dt-bindings: ti,tas2781: Add TAS5822 support
      ASoC: dt-bindings: ti,tas2781: Add TAS2568/2574/5806M/5806MD/5830 support
      ASoC: tas2781: Add tas2568/2574/5806m/5806md/5830 support

Bard Liao (22):
      ASoC: SOF: Don't print the monolithic topology name if function topology may be used
      ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
      ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
      ASoC: Intel: export sof_sdw_get_tplg_files
      ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
      ASoC: SOF: add platform name into sof_intel_dsp_desc
      ASoC: SOF: don't check the existence of dummy topology
      ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
      ASoC: sof-function-topology-lib: escalate the log when missing function topoplogy
      ASoC: SOF: Don't print the monolithic topology name if function topology may be used
      ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
      ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
      ASoC: Intel: export sof_sdw_get_tplg_files
      ASoC: soc_sdw_utils: export asoc_sdw_get_dai_type
      ASoC: SOF: add platform name into sof_intel_dsp_desc
      ASoC: SOF: don't check the existence of dummy topology
      ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
      ASoC: sof-function-topology-lib: escalate the log when missing function topoplogy
      ASoC: soc_sdw_utils: add cs35l57 support
      ASoC: SOF: Intel: select SND_SOC_SDW_UTILS in SND_SOC_SOF_HDA_GENERIC
      ASoC: SOF: Intel: remove hyphen from AMP<index> name_prexix
      ASoC: Intel: sof_sdw: create BT dai link if bt_link_mask is set

Bartosz Golaszewski (8):
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup

Cezary Rojewski (8):
      ASoC: Intel: avs: Allow the topology to carry NHLT data
      ASoC: Intel: avs: Honor NHLT override when setting up a path
      ASoC: Intel: catpt: Fix offset checks
      ASoC: Intel: catpt: Switch to resource_xxx() API
      ASoC: Intel: catpt: Fix error path in hw_params()
      ASoC: Intel: catpt: Fix probing order of driver components
      ASoC: Intel: catpt: Do not ignore errors on runtime resume
      ASoC: Intel: catpt: Do not block the system from suspending

Chancel Liu (2):
      ASoC: fsl_micfil: Add default quality for different platforms
      ASoC: fsl_micfil: Set channel range control

Charles Keepax (38):
      ASoC: SDCA: Rename SoundWire struct device variables
      regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
      ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
      ASoC: SDCA: Pass SoundWire slave to HID
      ASoC: SDCA: Pass device register map from IRQ alloc to handlers
      ASoC: SDCA: Update externally_requested flag to cover all requests
      ASoC: SDCA: Factor out a helper to find SDCA IRQ data
      ASoC: SDCA: Rely less on the ASoC component in IRQ handling
      ASoC: SDCA: Force some SDCA Controls to be volatile
      ASoC: SDCA: Parse XU Entity properties
      ASoC: SDCA: Parse Function Reset max delay
      ASoC: SDCA: Add UMP buffer helper functions
      ASoC: SDCA: Add completion for FDL start and stop
      ASoC: SDCA: Add UMP timeout handling for FDL
      ASoC: SDCA: Add early IRQ handling
      ASoC: SDCA: Add HID button IRQ
      ASoC: SDCA: Add companion amp Function
      ASoC: SDCA: Add stubs for FDL helper functions
      ASoC: SDCA: Remove duplicated module macros
      ASoC: SDCA: Fix missing dash in HIDE DisCo property
      ASoC: SDCA: Add missing forward declaration in header
      ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
      ASoC: SDCA: Add comment for function reset polling
      ASoC: SDCA: Move most of the messages from info to debug
      ASoC: SDCA: Use helper macros for control identification
      ASoC: SDCA: Factor out helper to process Control defaults
      ASoC: SDCA: Populate regmap cache for readable Controls
      ASoC: SDCA: Add helper to write initialization writes
      ASoC: SDCA: Add basic SDCA class driver
      ASoC: SDCA: Add basic SDCA function driver
      ASoC: SDCA: Align mute controls to ALSA expectations
      ASoC: SDCA: Add terminal type into input/output widget name
      ASoC: sdw_utils: Add codec_conf for every DAI
      ASoC: sdw_utils: Move codec_name to dai info
      ASoC: intel: sof_sdw: Add ability to have auxiliary devices
      ASoC: sdw_utils: Add cs42l45 support functions
      ASoC: intel: sof_sdw: Add codec_info for cs42l45
      ASoC: SDCA: Fixup some more Kconfig issues

Chen-Yu Tsai (4):
      ASoC: SOF: Fix function topology name check in profile info output
      ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
      ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
      ASoC: sun4i-spdif: Support SPDIF output on A523 family

Christophe JAILLET (2):
      ASoC: renesas: fsi: Constify struct fsi_stream_handler
      ASoC: fsl_spdif: Constify some structures

Cyril Chao (10):
      ASoC: mediatek: mt8189: add common header
      ASoC: mediatek: mt8189: support audio clock control
      ASoC: mediatek: mt8189: support ADDA in platform driver
      ASoC: mediatek: mt8189: support I2S in platform driver
      ASoC: mediatek: mt8189: support TDM in platform driver
      ASoC: mediatek: mt8189: support PCM in platform driver
      ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
      ASoC: mediatek: mt8189: add platform driver
      ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825 document
      ASoC: mediatek: mt8189: add machine driver with nau8825

Dan Carpenter (6):
      ASoC: codecs: va-macro: Clean up on error path in probe()
      ASoC: codecs: simplify aw87390_init() argument a bit
      ASoC: codecs: aw88261: pass pointer directly instead of passing the address
      ASoC: SDCA: Fix NULL vs IS_ERR() bug in sdca_dev_register_functions()
      ASoC: mediatek: mt8189: remove unnecessary NULL check
      ASoC: nau8325: Delete a stray tab

Dario Binacchi (1):
      ASoC: mxs-saif: support usage with simple-audio-card

Francesco Lavra (1):
      ASoC: tegra: remove Kconfig dependency on TEGRA20_APB_DMA

Frank Li (1):
      ASoC: dt-bindings: consolidate simple audio codec to trivial-codec.yaml

Goko Mell (1):
      ASoC: spacemit: fix incorrect error check for sspa clock

HariKrishna Sagala (5):
      ASoC: codec: wm8400: replace printk() calls with dev_*() device aware logging
      ASoC: soc-core: check ops & auto_selectable_formats in snd_soc_dai_get_fmt() to prevent dereference error
      ASoC: tas2781: Replace deprecated strcpy() with strscpy()
      ASoC: SOF: sof-client-probes: Replace snprintf() with scnprintf()
      ASoC: Intel: avs: Replace snprintf() with scnprintf()

Herve Codina (3):
      ASoC: cs4271: Disable regulators in component_probe() error path
      ASoC: dt-bindings: cirrus,cs4271: Document mclk clock
      ASoC: cs4271: Add support for the external mclk

Jaroslav Kysela (2):
      ASoC: nau8325: use simple i2c probe function
      ASoC: nau8325: add missing build config

Johan Hovold (5):
      ASoC: stm32: sai: fix device leak on probe
      ASoC: stm32: sai: fix clk prepare imbalance on probe failure
      ASoC: stm32: sai: fix OF node leak on probe
      ASoC: stm32: sai: clean up probe error path
      ASoC: codecs: wcd939x: fix regmap leak on probe failure

Jonathan Marek (8):
      ASoC: codecs: lpass-wsa-macro: remove unnecessary bounds check
      ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence
      ASoC: codecs: lpass-wsa-macro: remove mix path event
      ASoC: codecs: lpass-wsa-macro: fix path clock dependencies
      ASoC: codecs: lpass-wsa-macro: add volume controls for mix path
      ASoC: codecs: lpass-wsa-macro: remove main path event
      ASoC: codecs: lpass-wsa-macro: remove unused WSA_MACRO_RX_MIX enum
      ASoC: codecs: lpass-rx-macro: fix mute_stream affecting all paths

Kai Vehmanen (1):
      ASoC: Intel: boards: fix HDMI playback lookup when HDMI-In capture used

Konrad Dybcio (1):
      ASoC: codecs: va-macro: Rework version checking

Krzysztof Kozlowski (2):
      ASoC: codecs: pm4125: Fix potential conflict when probing two devices
      ASoC: codecs: pm4125: Remove irq_chip on component unbind

Kuninori Morimoto (431):
      ASoC: greybus: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: atmel: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: 88pm860x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: ab8500: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: adav80x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: ak4458: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: ak4619: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: ak4641: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: arizona: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw87390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw88081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw88166: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw88261: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw88395: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: aw88399: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: bd28623: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cros_ec: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs35l36: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs35l45: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs4234: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs4270: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs4271: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs42l42: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs42l43: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs42l51: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs42l84: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs43130: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs47l15: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs48l32: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: cs530x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da7210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da7213: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da7218: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da7219: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da732x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: da9055: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: es8328: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: fs210x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: idt821034: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: lpass-rx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: lpass-tx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: lpass-va-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: lpass-wsa-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: madera: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max9759: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max9768: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max98088: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max98090: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max98095: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max98390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max9867: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: max98925: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: msm8916-wcd-digital: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: mt6358: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: mt6359: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: mt6660: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: nau8810: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: nau8822: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: ntp8835: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: pcm1681: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: pcm512x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: pcm6240: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: peb2466: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: pm4125: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt1011: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt1015: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt1318: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt5631: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt5659: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt5665: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt5670: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt711-sdca: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: rt9123: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: sgtl5000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: sma1303: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: sma1307: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: sta32x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: sta350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas2562: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas2781: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas5086: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas571x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas5720: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tas5805m: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tfa989x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tlv320adc3xxx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tlv320adcx140: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tlv320aic23: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tlv320dac33: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tscs42xx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: tscs454: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: twl4030: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: twl6040: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: uda1334: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wcd9335: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wcd934x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wcd937x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wcd938x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wcd939x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm2000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm5102: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm5110: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8400: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8580: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8731: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8753: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8903: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8904: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8955: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8958: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8960: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8962: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8983: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8985: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8990: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8991: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8994: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm8996: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm9081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm_adsp: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wm_hubs: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wsa881x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wsa883x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: codecs: wsa884x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: fsl: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: intel: atom: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: intel: catpt: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: common: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: mt8183: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: mt8186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: mt8188: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: mt8192: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: mediatek: mt8195: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: rockchip: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: tegra: tegra186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: tegra: tegra210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: uniphier: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
      ASoC: soc.h: remove snd_soc_kcontrol_component()
      ASoC: arizona-haptics: convert to snd_soc_dapm_xxx()
      ASoC: arizona-micsupp: convert to snd_soc_dapm_xxx()
      ASoC: audio_codec: convert to snd_soc_dapm_xxx()
      ASoC: audio_helper: convert to snd_soc_dapm_xxx()
      ASoC: audio_topology: convert to snd_soc_dapm_xxx()
      ASoC: soc.h: convert to snd_soc_dapm_xxx()
      ASoC: asoc.h: convert to snd_soc_dapm_xxx()
      ASoC: amd: acp-mach-common: convert to snd_soc_dapm_xxx()
      ASoC: amd: acp3x-es83xx: convert to snd_soc_dapm_xxx()
      ASoC: amd: acp5x-mach: convert to snd_soc_dapm_xxx()
      ASoC: atmel: sam9g20_wm8731: convert to snd_soc_dapm_xxx()
      ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
      ASoC: codecs: 88pm860x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ad1836: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ad193x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adau1761: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adau1781: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adau17x1: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adau1977: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adau7118: convert to snd_soc_dapm_xxx()
      ASoC: codecs: adav80x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ak4641: convert to snd_soc_dapm_xxx()
      ASoC: codecs: alc5623: convert to snd_soc_dapm_xxx()
      ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
      ASoC: codecs: audio-iio-aux: convert to snd_soc_dapm_xxx()
      ASoC: codecs: aw88261: convert to snd_soc_dapm_xxx()
      ASoC: codecs: aw88395: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cpcap: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs35l33: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs35l41: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs35l45: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs35l56: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs4234: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l43-jack: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l43: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l51: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l52: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l56: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42l73: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs42xx8: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l15: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l24: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l35: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l85: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l90: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs47l92: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs48l32: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs530x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs53l30: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cx20442: convert to snd_soc_dapm_xxx()
      ASoC: codecs: cs2072x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da7213: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da7218: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da7219-aad: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da7219: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da732x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: da9055: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es7134: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es8311: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es8316: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es8326: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es8328: convert to snd_soc_dapm_xxx()
      ASoC: codecs: es8389: convert to snd_soc_dapm_xxx()
      ASoC: codecs: hda: convert to snd_soc_dapm_xxx()
      ASoC: codecs: hdac_hda: convert to snd_soc_dapm_xxx()
      ASoC: codecs: hdac_hdmi: convert to snd_soc_dapm_xxx()
      ASoC: codecs: hdmi-codec: convert to snd_soc_dapm_xxx()
      ASoC: codecs: jz4740: convert to snd_soc_dapm_xxx()
      ASoC: codecs: jz4760: convert to snd_soc_dapm_xxx()
      ASoC: codecs: jz4770: convert to snd_soc_dapm_xxx()
      ASoC: codecs: lm49453: convert to snd_soc_dapm_xxx()
      ASoC: codecs: lpass-rx-macro: convert to snd_soc_dapm_xxx()
      ASoC: codecs: lpass-tx-macro: convert to snd_soc_dapm_xxx()
      ASoC: codecs: lpass-va-macro: convert to snd_soc_dapm_xxx()
      ASoC: codecs: lpass-wsa-macro: convert to snd_soc_dapm_xxx()
      ASoC: codecs: madera: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98088: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98090: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98095: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98373: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98390: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max98396: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max9850: convert to snd_soc_dapm_xxx()
      ASoC: codecs: max9867: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ml26124: convert to snd_soc_dapm_xxx()
      ASoC: codecs: mt6357: convert to snd_soc_dapm_xxx()
      ASoC: codecs: mt6358: convert to snd_soc_dapm_xxx()
      ASoC: codecs: mt6359: convert to snd_soc_dapm_xxx()
      ASoC: codecs: nau8810: convert to snd_soc_dapm_xxx()
      ASoC: codecs: nau8821: convert to snd_soc_dapm_xxx()
      ASoC: codecs: nau8822: convert to snd_soc_dapm_xxx()
      ASoC: codecs: nau8824: convert to snd_soc_dapm_xxx()
      ASoC: codecs: nau8825: convert to snd_soc_dapm_xxx()
      ASoC: codecs: pcm186x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt1011: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt1015: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt274: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt286: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt298: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5514: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5516: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5631: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5640: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5645: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5651: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5659: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5660: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5663: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5665: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5668: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5670: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5677: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5682: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt5682s: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt700: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt711-sdca: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt711: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt712-sdca-dmic: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt712-sdca: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt715-sdca: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt715: convert to snd_soc_dapm_xxx()
      ASoC: codecs: rt721-sdca: convert to snd_soc_dapm_xxx()
      ASoC: codecs: simple-mux: convert to snd_soc_dapm_xxx()
      ASoC: codecs: sma1303: convert to snd_soc_dapm_xxx()
      ASoC: codecs: sma1307: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ssm2518: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ssm2602: convert to snd_soc_dapm_xxx()
      ASoC: codecs: ssm4567: convert to snd_soc_dapm_xxx()
      ASoC: codecs: sta32x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: sta350: convert to snd_soc_dapm_xxx()
      ASoC: codecs: sta529: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tas571x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tas6424: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tlv320adc3xxx: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tlv320aic31xx: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tlv320aic32x4: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tlv320aic3x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: tlv320dac33: convert to snd_soc_dapm_xxx()
      ASoC: codecs: twl4030: convert to snd_soc_dapm_xxx()
      ASoC: codecs: twl6040: convert to snd_soc_dapm_xxx()
      ASoC: codecs: uda1380: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wcd9335: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wcd934x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wcd937x: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm0010: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm5100: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm5102: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm5110: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8350: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8400: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8510: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8523: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8580: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8711: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8728: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8731: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8737: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8750: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8753: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8770: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8776: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8804: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8900: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8903: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8904: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8940: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8955: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8960: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8961: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8962: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8971: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8974: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8978: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8983: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8985: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8988: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8990: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8991: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8993: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8994: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8995: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8996: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8997: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm8998: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm9081: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm9090: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm9712: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm9713: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm_adsp: convert to snd_soc_dapm_xxx()
      ASoC: codecs: wm_hubs: convert to snd_soc_dapm_xxx()
      ASoC: fsl: fsl-asoc-card: convert to snd_soc_dapm_xxx()
      ASoC: fsl: imx-rpmsg: convert to snd_soc_dapm_xxx()
      ASoC: generic: audio-graph-card: convert to snd_soc_dapm_xxx()
      ASoC: intel: atom: sst-atom-controls: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: da7219: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: es8336: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: nau8825: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: rt274: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: rt5514: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: rt5640: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: control: convert to snd_soc_dapm_xxx()
      ASoC: intel: avs: pcm: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bdw-rt5677: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bytcht_cx2072x: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bytcht_es8316: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bytcr_rt5640: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bytcr_rt5651: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: bytcr_wm5102: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: cht_bsw_max98090_ti: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: cht_bsw_rt5645: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: cht_bsw_rt5672: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_board_helpers: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_cirrus_common: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_da7219: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_es8336: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_maxim_common: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_nau8825: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_nuvoton_common: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_pcm512x: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_realtek_common: convert to snd_soc_dapm_xxx()
      ASoC: intel: boards: sof_rt5682: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mtk-afe-platform-driver: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mtk-dsp-sof-common: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mt8186-mt6366-common: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mt8186-mt6366: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mt8188-mt6359: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mt8195-mt6359: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: mt8365-afe-pcm: convert to snd_soc_dapm_xxx()
      ASoC: meson: aiu-acodec-ctrl: convert to snd_soc_dapm_xxx()
      ASoC: meson: aiu-codec-ctrl: convert to snd_soc_dapm_xxx()
      ASoC: meson: axg-spdifout: convert to snd_soc_dapm_xxx()
      ASoC: meson: axg-tdm-interface: convert to snd_soc_dapm_xxx()
      ASoC: meson: g12a-toacodec: convert to snd_soc_dapm_xxx()
      ASoC: meson: g12a-tohdmitx: convert to snd_soc_dapm_xxx()
      ASoC: meson: t9015: convert to snd_soc_dapm_xxx()
      ASoC: pxa: spitz: convert to snd_soc_dapm_xxx()
      ASoC: qcom: q6routing: convert to snd_soc_dapm_xxx()
      ASoC: qcom: q6usb: convert to snd_soc_dapm_xxx()
      ASoC: qcom: topology: convert to snd_soc_dapm_xxx()
      ASoC: qcom: sc7180: convert to snd_soc_dapm_xxx()
      ASoC: rockchip: rk3288_hdmi_analog: convert to snd_soc_dapm_xxx()
      ASoC: rockchip: rockchip_max98090: convert to snd_soc_dapm_xxx()
      ASoC: samsung: aries_wm8994: convert to snd_soc_dapm_xxx()
      ASoC: samsung: bells: convert to snd_soc_dapm_xxx()
      ASoC: samsung: littlemill: convert to snd_soc_dapm_xxx()
      ASoC: samsung: lowland: convert to snd_soc_dapm_xxx()
      ASoC: samsung: midas_wm1811: convert to snd_soc_dapm_xxx()
      ASoC: samsung: smdk_wm8994: convert to snd_soc_dapm_xxx()
      ASoC: samsung: speyside: convert to snd_soc_dapm_xxx()
      ASoC: samsung: tm2_wm5110: convert to snd_soc_dapm_xxx()
      ASoC: samsung: tobermory: convert to snd_soc_dapm_xxx()
      ASoC: sdca: sdca_asoc: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_bridge_cs35l56: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_cs42l42: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_cs42l43: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_cs_amp: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_dmic: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_maxim: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt5682: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt700: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt711: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt_amp: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt_mf_sdca: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_rt_sdca_jack_common: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_ti_amp: convert to snd_soc_dapm_xxx()
      ASoC: sdw_utils: soc_sdw_utils: convert to snd_soc_dapm_xxx()
      ASoC: soc-core: convert to snd_soc_dapm_xxx()
      ASoC: soc-dapm: convert to snd_soc_dapm_xxx()
      ASoC: soc-jack: convert to snd_soc_dapm_xxx()
      ASoC: soc-pcm: convert to snd_soc_dapm_xxx()
      ASoC: soc-topology: convert to snd_soc_dapm_xxx()
      ASoC: sof-client-probes: convert to snd_soc_dapm_xxx()
      ASoC: sunxi: sun4i-codec: convert to snd_soc_dapm_xxx()
      ASoC: sunxi: sun50i-codec-analog: convert to snd_soc_dapm_xxx()
      ASoC: sunxi: sun8i-codec-analog: convert to snd_soc_dapm_xxx()
      ASoC: sunxi: sun8i-codec: convert to snd_soc_dapm_xxx()
      ASoC: tegra: tegra210_ahub: convert to snd_soc_dapm_xxx()
      ASoC: tegra: tegra_asoc_machine: convert to snd_soc_dapm_xxx()
      ASoC: tegra: tegra_wm8903: convert to snd_soc_dapm_xxx()
      ASoC: ti: ams-delta: convert to snd_soc_dapm_xxx()
      ASoC: ti: davinci-evm: convert to snd_soc_dapm_xxx()
      ASoC: ti: j721e-evm: convert to snd_soc_dapm_xxx()
      ASoC: ti: n810: convert to snd_soc_dapm_xxx()
      ASoC: ti: omap-abe-twl6040: convert to snd_soc_dapm_xxx()
      ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()
      ASoC: ti: omap3pandora: convert to snd_soc_dapm_xxx()
      ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
      ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()
      ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()

Laurentiu Mihalcea (1):
      ASoC: SOF: imx9: use SCMI API for LM management

Lukas Bulwahn (1):
      MAINTAINERS: refer to trivial-codec.yaml in relevant sections

Mac Chiang (4):
      ASoC: Intel: soc-acpi-intel-ptl-match: Add support for rt722_l0_rt1320_l23
      ASoC: Intel: sof_sdw: Add quirk to exclude RT722 speaker
      ASoC: Intel: soc-acpi-ptl-match: add cs42l43_agg_l3_cs35l56_2 support
      ASoC: Intel: sof_sdw: add codec speaker support for the SKU

Maciej Strozek (3):
      ASoC: SDCA: Add SDCA FDL data parsing
      ASoC: SDCA: Add FDL library for XU entities
      ASoC: SDCA: Add FDL-specific IRQ processing

Marco Crivellari (1):
      ASoC: replace use of system_wq with system_dfl_wq

Mark Brown (36):
      ASoC: use sof_sdw as default Intel SOF SDW machine
      Add tegra264 audio device tree support
      ASoC: use sof_sdw as default Intel SOF SDW machine
      Add Audio Support for Kaanapali MTP Boards
      ASoC: amd: ps: Propagate the PCI subsystem Vendor and
      ASoC: spacemit: add i2s support to K1 SoC
      ASoC: use snd_kcontrol_chip() instead of
      ASoC: Merge up fixes
      ALSA: cs35l56: Add support for factory calibration
      Sndcard compatible for qrb2210/qcm2290
      allwinner: a523: Enable I2S and SPDIF TX
      ASoC: spacemit: fix build warning and error
      Add support for Cirrus Logic CS530x DAC and CODEC
      Add SDCA UMP/FDL support
      ASoC: tas2783: Fix build for SoundWire API update
      ASoC: qcom: sdw: fix memory leak
      Add support for an external Master Clock in the
      ASoC: qcom: q6dsp: fixes and updates
      ASoC: Merge up fixes
      ASoC: Intel: machine driver updates for 6.19
      ASoC: cs35l56: Support for restoring calibration on
      ASoC: codecs: lpass-macro: complete sm6115 support
      ASoC: codecs: pm4125: Two minor fixes for
      ASoC: Intel: avs: Allow for NHLT configuration
      ASoC: convert to snd_soc_dapm_xxx()
      ASoC: mediatek: Add support for MT8189 SoC
      gpio: improve support for shared GPIOs
      firmware: cs_dsp: Cleanup debugfs for wmfw and bin
      Add SDCA class driver
      ASoC: cs35l56: Set access permissions on volatile
      nau8325 build fixes
      ASoC: stm32: sai: fix device and OF node leaks on
      Add support for cs42l45 into the Intel machine driver
      ASoC: Intel: catpt: Round of fixes and PM changes
      firmware: cs_dsp: Remove need for clients to supply
      ASoC: fsl_micfil: Set default quality and channel

Markus Elfring (1):
      ASoC: rockchip: i2s-tdm: Omit a variable reassignment in rockchip_i2s_tdm_probe()

Peter Ujfalusi (3):
      ASoC: SOF: pcm: Set the PCM device name for HDMI
      ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
      ASOC: Intel: sof_sdw: add quirk for Avell B.ON (OEM rebranded NUC15)

Pierre-Louis Bossart (1):
      ASoC: SDCA: add function devices

Prasad Kumpatla (3):
      ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
      ASoC: qcom: sc8280xp: Add support for Kaanapali
      ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs

Randy Dunlap (1):
      firmware: cs_dsp: fix kernel-doc warnings in a header file

Ranganath V N (1):
      ASoC: dt-bindings: ti,pcm1862: convert to dtschema

Richard Fitzgerald (29):
      ASoC: cs35l56: Read silicon ID during initialization and save it
      ASoC: cs-amp-lib: Add helpers for factory calibration
      ASoC: cs35l56: Add common code for factory calibration
      ASoC: cs35l56: Create debugfs files for factory calibration
      ALSA: hda/cs35l56: Create debugfs files for factory calibration
      ASoC: cs-amp-lib-test: Add cases for factory calibration helpers
      ASoC: cs-amp-lib: Return attributes from cs_amp_get_efi_variable()
      ASoC: cs-amp-lib: Add function to write calibration to UEFI
      ASoC: cs35l56: Add calibration command to store into UEFI
      ALSA: hda/cs35l56: Set cal_index to the amp index
      ASoC: cs-amp-lib-test: Add test cases for cs_amp_set_efi_calibration_data()
      ASoC: cs35l56: Alter error codes for calibration routine
      ASoC: cs35l56: Add control to read CAL_SET_STATUS
      ASoC: cs35l56: Allow restoring factory calibration through ALSA control
      firmware: cs_dsp: Factor out common debugfs string read
      firmware: cs_dsp: Append \n to debugfs string during read
      ASoC: soc.h: Add SOC_ENUM_EXT_ACC() to allow setting access flags
      ASoC: soc.h: Add SND_SOC_BYTES_E_ACC() to allow setting access flags
      ASoC: cs35l56: Use SOC_ENUM_EXT_ACC() for CAL_SET_STATUS control
      ASoC: cs35l56: Use SND_SOC_BYTES_E_ACC() for CAL_DATA_RB control
      firmware: cs_dsp: Store control length as 32-bit
      ASoC: cs-amp-lib: Remove redundant calls to kunit_deactivate_static_stub()
      firmware: cs_dsp: Remove redundant download buffer allocator
      firmware: cs_dsp: Take pwr_lock around reading controls debugfs
      firmware: cs_dsp: Use kvzalloc() to allocate control caches
      ASoC: cs-amp-lib: Use __free(kfree) instead of manual freeing
      firmware: cs_dsp: Don't require client to provide a struct cs_dsp_client_ops
      firmware: cs_dsp: Add test cases for client_ops == NULL
      ASoC: cs35l56: Log a message if firmware is missing

Sharique Mohammad (6):
      ASoC: max98090/91: added DAPM widget for digital output for max98091
      ASoC: max98090/91: fixing a space
      ASoC: max98090/91: adding DAPM routing for digital output for max98091
      ASoC: max98090/91: fixing the stream index
      ASoC: max98090/91: adding two virtual Mux widgets for digital mics
      ASoC: max98090/91: adding the two virtual Mux widgets in the routes

Shengjiu Wang (1):
      ASoC: fsl_aud2htx: add IEC958_SUBFRAME_LE format in supported list

Shuming Fan (3):
      ASoC: SOF: Intel: add hyphen between name and index to amp name_prefix
      ASoC: sdw_utils: add name_prefix for rt1321 part id
      ASoC: SDCA: support Q7.8 volume format

Simon Trimmer (5):
      ASoC: amd: ps: Propagate the PCI subsystem Vendor and Device IDs
      ASoC: amd: amd_sdw: Propagate the PCI subsystem Vendor and Device IDs
      ASoC: cs530x: Add CODEC and DAC support
      ASoC: cs530x: Check the DEVID matches the devtype
      ASoC: cs530x: Rename i2c related structures

Srinivas Kandagatla (32):
      ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
      ASoC: qcom: sdw: remove redundant code
      ASoC: qcom: sdm845: make use of common helpers
      ASoC: qcom: sc7280: make use of common helpers
      ASoC: codecs: va-macro: fix revision checking
      ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
      ASoC: qcom: q6adm: the the copp device only during last instance
      ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
      ASoC: qcom: q6asm-dai: perform correct state check before closing
      ASoC: qcom: q6asm: handle the responses after closing
      ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp under-runs
      ASoC: qcom: q6asm: add q6asm_get_hw_pointer
      ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
      ASoC: qcom: q6asm: set runtime correctly for each stream
      ASoc: qcom: audioreach: remove unused variables
      ASoc: qcom: audioreach: Use automatic cleanup of kfree()
      ASoc: qcom: q6adm: Use automatic cleanup of kfree()
      ASoc: qcom: q6afe: Use automatic cleanup of kfree()
      ASoc: qcom: q6apm: Use automatic cleanup of kfree()
      ASoc: qcom: q6prm: Use automatic cleanup of kfree()
      ASoc: qcom: q6asm: Use automatic cleanup of kfree()
      ASoC: qcom: q6afe: Use guard() for spin locks
      ASoC: qcom: q6apm-dai: Use guard() for spin locks
      ASoC: qcom: q6asm-dai: Use guard() for spin locks
      ASoC: qcom: q6asm: Use guard() for spin locks
      ASoC: codecs: pm4125: remove duplicate code
      ASoC: codecs: lpass-tx-macro: fix SM6115 support
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
      ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
      ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
      ASoC: codecs: lpass-va-macro: add SM6115 compatible
      ASoC: codecs: lpass-rx-macro: add SM6115 compatible

Tang Bin (2):
      ASoc: tas2783A: Remove unneeded variable assignment
      ASoC: codecs: Fix the error of excessive semicolons

Thomas Weißschuh (1):
      ASoC: stm32: dfsdm: don't use %pK through printk

Thorsten Blum (1):
      ASoC: Intel: atom: Replace strcpy() with strscpy()

Troy Mitchell (5):
      ASoC: dt-bindings: Add bindings for SpacemiT K1
      ASoC: spacemit: add i2s support for K1 SoC
      ASoC: spacemit: add failure check for spacemit_i2s_init_dai()
      ASoC: spacemit: use `depends on` instead of `select`
      ASoC: spacemit: add failure check for spacemit_i2s_init_dai()

Vitaly Rodionov (9):
      ASoC: cs530x: Update the copyright headers
      ASoC: cs530x: Sort #include directives and tydy up whitespaces
      ASoC: cs530x: Remove unused struct members and constants
      ASoC: cs530x: Correct constant naming
      ASoC: dt-bindings: sound: cirrus: cs530x: Add cs530x
      ASoC: cs530x: Rename bitfield to reflect common use for ADC and DAC
      ASoC: cs530x: Correct MCLK reference frequency values
      ASoC: dt-bindings: sound: cirrus: cs530x: Add SPI bus support
      ASoC: cs530x: Add SPI bus support for cs530x parts

Weidong Wang (1):
      ASoC: codecs: Modify awinic amplifier dsp read and write functions

Wolfram Sang (1):
      ASoC: dt-bindings: don't check node names

jempty.liang (1):
      ASoC: soc-core: Pre-check zero CPU/codec DAIs, handle early rtd->dais alloc failure

sheetal (1):
      dt-bindings: sound: Update ADMAIF bindings for tegra264

 .../devicetree/bindings/sound/adi,max98363.yaml    |    60 -
 .../devicetree/bindings/sound/adi,ssm2602.txt      |    19 -
 .../devicetree/bindings/sound/adi,ssm3515.yaml     |    49 -
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |     4 +-
 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |    44 +-
 .../devicetree/bindings/sound/cirrus,cs4271.yaml   |    10 +
 .../devicetree/bindings/sound/cirrus,cs530x.yaml   |     8 +
 Documentation/devicetree/bindings/sound/cs4265.txt |    29 -
 Documentation/devicetree/bindings/sound/cs4341.txt |    22 -
 Documentation/devicetree/bindings/sound/cs4349.txt |    19 -
 Documentation/devicetree/bindings/sound/da9055.txt |    22 -
 .../bindings/sound/mediatek,mt8189-afe-pcm.yaml    |   178 +
 .../bindings/sound/mediatek,mt8189-nau8825.yaml    |   101 +
 .../devicetree/bindings/sound/nuvoton,nau8540.yaml |    40 -
 .../devicetree/bindings/sound/nuvoton,nau8810.yaml |    45 -
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   106 +-
 .../devicetree/bindings/sound/nxp,tfa9879.yaml     |    44 -
 .../devicetree/bindings/sound/nxp,uda1342.yaml     |    42 -
 .../devicetree/bindings/sound/pcm1789.txt          |    22 -
 .../devicetree/bindings/sound/pcm179x.txt          |    27 -
 .../devicetree/bindings/sound/pcm186x.txt          |    42 -
 .../devicetree/bindings/sound/pcm5102a.txt         |    13 -
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |    19 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |     1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |    50 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |     1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |     2 +
 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |     2 +-
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |    87 +
 .../devicetree/bindings/sound/ti,pcm1862.yaml      |    76 +
 .../devicetree/bindings/sound/ti,tas2781.yaml      |    58 +-
 .../devicetree/bindings/sound/trivial-codec.yaml   |    79 +
 .../devicetree/bindings/sound/wlf,wm8510.yaml      |    41 -
 .../devicetree/bindings/sound/wlf,wm8523.yaml      |    40 -
 .../devicetree/bindings/sound/wlf,wm8580.yaml      |    42 -
 .../devicetree/bindings/sound/wlf,wm8711.yaml      |    40 -
 .../devicetree/bindings/sound/wlf,wm8728.yaml      |    40 -
 .../devicetree/bindings/sound/wlf,wm8737.yaml      |    40 -
 .../devicetree/bindings/sound/wlf,wm8750.yaml      |    42 -
 .../devicetree/bindings/sound/wlf,wm8753.yaml      |    62 -
 .../devicetree/bindings/sound/wlf,wm8776.yaml      |    41 -
 .../devicetree/bindings/sound/wlf,wm8961.yaml      |    43 -
 .../devicetree/bindings/sound/wlf,wm8974.yaml      |    41 -
 Documentation/devicetree/bindings/sound/wm8770.txt |    16 -
 MAINTAINERS                                        |     8 +-
 drivers/base/regmap/regmap-sdw-mbq.c               |    23 +-
 drivers/firmware/cirrus/cs_dsp.c                   |   175 +-
 .../firmware/cirrus/test/cs_dsp_test_callbacks.c   |     1 +
 drivers/gpio/Kconfig                               |    17 +
 drivers/gpio/Makefile                              |     2 +
 drivers/gpio/gpio-shared-proxy.c                   |   333 +
 drivers/gpio/gpiolib-shared.c                      |   558 +
 drivers/gpio/gpiolib-shared.h                      |    71 +
 drivers/gpio/gpiolib.c                             |    70 +-
 drivers/gpio/gpiolib.h                             |     2 +
 drivers/input/misc/arizona-haptics.c               |    14 +-
 drivers/regulator/arizona-micsupp.c                |     8 +-
 drivers/staging/greybus/audio_codec.c              |    16 +-
 drivers/staging/greybus/audio_helper.c             |     9 +-
 drivers/staging/greybus/audio_topology.c           |    24 +-
 include/linux/firmware/cirrus/cs_dsp.h             |     6 +-
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |    18 +-
 include/linux/gpio/consumer.h                      |     9 +
 include/linux/regmap.h                             |    21 +-
 include/linux/soundwire/sdw_registers.h            |     2 +
 include/linux/string.h                             |    18 +
 include/sound/cs-amp-lib.h                         |    25 +-
 include/sound/cs35l56.h                            |    50 +
 include/sound/sdca.h                               |    19 +
 include/sound/sdca_fdl.h                           |   105 +
 include/sound/sdca_function.h                      |   126 +-
 include/sound/sdca_hid.h                           |    21 +-
 include/sound/sdca_interrupts.h                    |    19 +-
 include/sound/sdca_regmap.h                        |     2 +
 include/sound/sdca_ump.h                           |    50 +
 include/sound/soc-acpi.h                           |     8 +-
 include/sound/soc.h                                |    39 +-
 include/sound/soc_sdw_utils.h                      |    19 +-
 include/sound/tas2781.h                            |     6 +
 include/trace/events/asoc.h                        |     4 +-
 include/uapi/sound/intel/avs/tokens.h              |     6 +
 lib/tests/string_kunit.c                           |    13 +
 sound/hda/codecs/side-codecs/Kconfig               |    15 +
 sound/hda/codecs/side-codecs/cs35l56_hda.c         |   116 +-
 sound/hda/codecs/side-codecs/cs35l56_hda.h         |     6 +
 sound/soc/Kconfig                                  |     1 +
 sound/soc/Makefile                                 |     1 +
 sound/soc/amd/acp/acp-mach-common.c                |    40 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |    23 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |    12 +-
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |    10 +-
 sound/soc/amd/ps/acp63.h                           |     2 +
 sound/soc/amd/ps/pci-ps.c                          |     9 +
 sound/soc/amd/vangogh/acp5x-mach.c                 |     3 +-
 sound/soc/atmel/atmel-pdmic.c                      |     4 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |     2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |    32 +-
 sound/soc/codecs/88pm860x-codec.c                  |    11 +-
 sound/soc/codecs/Kconfig                           |    49 +
 sound/soc/codecs/Makefile                          |     8 +-
 sound/soc/codecs/ab8500-codec.c                    |    18 +-
 sound/soc/codecs/ad1836.c                          |     2 +-
 sound/soc/codecs/ad193x.c                          |     4 +-
 sound/soc/codecs/adau1761.c                        |     9 +-
 sound/soc/codecs/adau1781.c                        |     2 +-
 sound/soc/codecs/adau17x1.c                        |    14 +-
 sound/soc/codecs/adau1977.c                        |     5 +-
 sound/soc/codecs/adau7118.c                        |     7 +-
 sound/soc/codecs/adav80x.c                         |    10 +-
 sound/soc/codecs/ak4458.c                          |     4 +-
 sound/soc/codecs/ak4619.c                          |     4 +-
 sound/soc/codecs/ak4641.c                          |     7 +-
 sound/soc/codecs/alc5623.c                         |     2 +-
 sound/soc/codecs/arizona-jack.c                    |     8 +-
 sound/soc/codecs/arizona.c                         |    22 +-
 sound/soc/codecs/audio-iio-aux.c                   |     2 +-
 sound/soc/codecs/aw87390.c                         |    14 +-
 sound/soc/codecs/aw88081.c                         |    24 +-
 sound/soc/codecs/aw88166.c                         |   159 +-
 sound/soc/codecs/aw88166.h                         |     5 -
 sound/soc/codecs/aw88261.c                         |    34 +-
 sound/soc/codecs/aw88395/aw88395.c                 |    30 +-
 sound/soc/codecs/aw88395/aw88395_device.c          |    39 +-
 sound/soc/codecs/aw88395/aw88395_device.h          |     8 +-
 sound/soc/codecs/aw88399.c                         |   253 +-
 sound/soc/codecs/aw88399.h                         |     5 -
 sound/soc/codecs/bd28623.c                         |     6 +-
 sound/soc/codecs/cpcap.c                           |    21 +-
 sound/soc/codecs/cros_ec_codec.c                   |    10 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |  1522 ++-
 sound/soc/codecs/cs-amp-lib.c                      |   372 +-
 sound/soc/codecs/cs35l33.c                         |     4 +-
 sound/soc/codecs/cs35l36.c                         |     6 +-
 sound/soc/codecs/cs35l41.c                         |     2 +-
 sound/soc/codecs/cs35l45.c                         |    12 +-
 sound/soc/codecs/cs35l56-shared.c                  |   439 +-
 sound/soc/codecs/cs35l56.c                         |   252 +-
 sound/soc/codecs/cs35l56.h                         |     6 +
 sound/soc/codecs/cs4234.c                          |     7 +-
 sound/soc/codecs/cs4270.c                          |     2 +-
 sound/soc/codecs/cs4271.c                          |    36 +-
 sound/soc/codecs/cs42l42.c                         |     2 +-
 sound/soc/codecs/cs42l43-jack.c                    |    14 +-
 sound/soc/codecs/cs42l43.c                         |    38 +-
 sound/soc/codecs/cs42l51.c                         |     6 +-
 sound/soc/codecs/cs42l52.c                         |     5 +-
 sound/soc/codecs/cs42l56.c                         |     5 +-
 sound/soc/codecs/cs42l73.c                         |     3 +-
 sound/soc/codecs/cs42l84.c                         |     4 +-
 sound/soc/codecs/cs42xx8.c                         |     2 +-
 sound/soc/codecs/cs43130.c                         |     2 +-
 sound/soc/codecs/cs47l15.c                         |    11 +-
 sound/soc/codecs/cs47l24.c                         |     4 +-
 sound/soc/codecs/cs47l35.c                         |     5 +-
 sound/soc/codecs/cs47l85.c                         |     5 +-
 sound/soc/codecs/cs47l90.c                         |     5 +-
 sound/soc/codecs/cs47l92.c                         |    11 +-
 sound/soc/codecs/cs48l32.c                         |    40 +-
 sound/soc/codecs/cs530x-i2c.c                      |    24 +-
 sound/soc/codecs/cs530x-spi.c                      |    92 +
 sound/soc/codecs/cs530x.c                          |   526 +-
 sound/soc/codecs/cs530x.h                          |    90 +-
 sound/soc/codecs/cs53l30.c                         |     9 +-
 sound/soc/codecs/cx20442.c                         |     5 +-
 sound/soc/codecs/cx2072x.c                         |     6 +-
 sound/soc/codecs/da7210.c                          |     4 +-
 sound/soc/codecs/da7213.c                          |    21 +-
 sound/soc/codecs/da7218.c                          |    21 +-
 sound/soc/codecs/da7219-aad.c                      |    10 +-
 sound/soc/codecs/da7219.c                          |    29 +-
 sound/soc/codecs/da732x.c                          |     7 +-
 sound/soc/codecs/da9055.c                          |     6 +-
 sound/soc/codecs/es7134.c                          |     2 +-
 sound/soc/codecs/es8311.c                          |     3 +-
 sound/soc/codecs/es8316.c                          |     4 +-
 sound/soc/codecs/es8326.c                          |    16 +-
 sound/soc/codecs/es8328.c                          |     8 +-
 sound/soc/codecs/es8389.c                          |     4 +-
 sound/soc/codecs/fs210x.c                          |     2 +-
 sound/soc/codecs/hda.c                             |     2 +-
 sound/soc/codecs/hdac_hda.c                        |     4 +-
 sound/soc/codecs/hdac_hdmi.c                       |    35 +-
 sound/soc/codecs/hdmi-codec.c                      |     2 +-
 sound/soc/codecs/idt821034.c                       |     8 +-
 sound/soc/codecs/jz4740.c                          |     3 +-
 sound/soc/codecs/jz4760.c                          |     7 +-
 sound/soc/codecs/jz4770.c                          |     8 +-
 sound/soc/codecs/lm49453.c                         |     3 +-
 sound/soc/codecs/lpass-rx-macro.c                  |   116 +-
 sound/soc/codecs/lpass-tx-macro.c                  |    19 +-
 sound/soc/codecs/lpass-va-macro.c                  |   104 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   169 +-
 sound/soc/codecs/madera.c                          |    48 +-
 sound/soc/codecs/max9759.c                         |     8 +-
 sound/soc/codecs/max9768.c                         |     4 +-
 sound/soc/codecs/max98088.c                        |    18 +-
 sound/soc/codecs/max98090.c                        |    54 +-
 sound/soc/codecs/max98095.c                        |    27 +-
 sound/soc/codecs/max98373.c                        |     3 +-
 sound/soc/codecs/max98390.c                        |    22 +-
 sound/soc/codecs/max98396.c                        |    11 +-
 sound/soc/codecs/max9850.c                         |     3 +-
 sound/soc/codecs/max9867.c                         |    15 +-
 sound/soc/codecs/max98925.c                        |     2 +-
 sound/soc/codecs/ml26124.c                         |     3 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |     6 +-
 sound/soc/codecs/mt6357.c                          |     2 +-
 sound/soc/codecs/mt6358.c                          |    25 +-
 sound/soc/codecs/mt6359.c                          |    18 +-
 sound/soc/codecs/mt6660.c                          |     3 +-
 sound/soc/codecs/nau8325.c                         |     5 +-
 sound/soc/codecs/nau8810.c                         |     7 +-
 sound/soc/codecs/nau8821.c                         |    28 +-
 sound/soc/codecs/nau8822.c                         |    20 +-
 sound/soc/codecs/nau8824.c                         |    10 +-
 sound/soc/codecs/nau8825.c                         |     6 +-
 sound/soc/codecs/ntp8835.c                         |     4 +-
 sound/soc/codecs/pcm1681.c                         |     4 +-
 sound/soc/codecs/pcm186x.c                         |     6 +-
 sound/soc/codecs/pcm512x.c                         |    25 +-
 sound/soc/codecs/pcm6240.c                         |     9 +-
 sound/soc/codecs/peb2466.c                         |     6 +-
 sound/soc/codecs/pm4125-sdw.c                      |    64 +-
 sound/soc/codecs/pm4125.c                          |   104 +-
 sound/soc/codecs/pm4125.h                          |    18 +-
 sound/soc/codecs/rk3308_codec.c                    |     3 +-
 sound/soc/codecs/rt1011.c                          |    36 +-
 sound/soc/codecs/rt1015.c                          |    17 +-
 sound/soc/codecs/rt1318.c                          |     4 +-
 sound/soc/codecs/rt274.c                           |     5 +-
 sound/soc/codecs/rt286.c                           |     8 +-
 sound/soc/codecs/rt298.c                           |     9 +-
 sound/soc/codecs/rt5514.c                          |     8 +-
 sound/soc/codecs/rt5616.c                          |     5 +-
 sound/soc/codecs/rt5631.c                          |    10 +-
 sound/soc/codecs/rt5640.c                          |    19 +-
 sound/soc/codecs/rt5645.c                          |    15 +-
 sound/soc/codecs/rt5651.c                          |    13 +-
 sound/soc/codecs/rt5659.c                          |    13 +-
 sound/soc/codecs/rt5660.c                          |     5 +-
 sound/soc/codecs/rt5663.c                          |    10 +-
 sound/soc/codecs/rt5665.c                          |     6 +-
 sound/soc/codecs/rt5668.c                          |     3 +-
 sound/soc/codecs/rt5670.c                          |    43 +-
 sound/soc/codecs/rt5677.c                          |    14 +-
 sound/soc/codecs/rt5682.c                          |    10 +-
 sound/soc/codecs/rt5682s.c                         |     5 +-
 sound/soc/codecs/rt700.c                           |    28 +-
 sound/soc/codecs/rt711-sdca.c                      |    13 +-
 sound/soc/codecs/rt711.c                           |    28 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |     9 +-
 sound/soc/codecs/rt712-sdca.c                      |    20 +-
 sound/soc/codecs/rt715-sdca.c                      |     9 +-
 sound/soc/codecs/rt715.c                           |    35 +-
 sound/soc/codecs/rt721-sdca.c                      |     9 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |     4 +-
 sound/soc/codecs/rt9123.c                          |     6 +-
 sound/soc/codecs/sgtl5000.c                        |     8 +-
 sound/soc/codecs/simple-mux.c                      |     7 +-
 sound/soc/codecs/sma1303.c                         |    31 +-
 sound/soc/codecs/sma1307.c                         |    95 +-
 sound/soc/codecs/ssm2518.c                         |     3 +-
 sound/soc/codecs/ssm2602.c                         |     4 +-
 sound/soc/codecs/ssm4567.c                         |     3 +-
 sound/soc/codecs/sta32x.c                          |    10 +-
 sound/soc/codecs/sta350.c                          |    10 +-
 sound/soc/codecs/sta529.c                          |     3 +-
 sound/soc/codecs/tas2562.c                         |     4 +-
 sound/soc/codecs/tas2781-i2c.c                     |   104 +-
 sound/soc/codecs/tas2783-sdw.c                     |     4 +-
 sound/soc/codecs/tas5086.c                         |     4 +-
 sound/soc/codecs/tas571x.c                         |     7 +-
 sound/soc/codecs/tas5720.c                         |     4 +-
 sound/soc/codecs/tas5805m.c                        |     6 +-
 sound/soc/codecs/tas6424.c                         |     4 +-
 sound/soc/codecs/tfa989x.c                         |     2 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |     8 +-
 sound/soc/codecs/tlv320adcx140.c                   |     6 +-
 sound/soc/codecs/tlv320aic23.c                     |     4 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    14 +-
 sound/soc/codecs/tlv320aic32x4.c                   |     3 +-
 sound/soc/codecs/tlv320aic3x.c                     |    11 +-
 sound/soc/codecs/tlv320dac33.c                     |     9 +-
 sound/soc/codecs/tscs42xx.c                        |     6 +-
 sound/soc/codecs/tscs454.c                         |     6 +-
 sound/soc/codecs/twl4030.c                         |    14 +-
 sound/soc/codecs/twl6040.c                         |    15 +-
 sound/soc/codecs/uda1334.c                         |     4 +-
 sound/soc/codecs/uda1380.c                         |     3 +-
 sound/soc/codecs/wcd9335.c                         |    34 +-
 sound/soc/codecs/wcd934x.c                         |    44 +-
 sound/soc/codecs/wcd937x.c                         |    20 +-
 sound/soc/codecs/wcd938x.c                         |    27 +-
 sound/soc/codecs/wcd939x-sdw.c                     |     8 +-
 sound/soc/codecs/wcd939x.c                         |    24 +-
 sound/soc/codecs/wm0010.c                          |     5 +-
 sound/soc/codecs/wm2000.c                          |     8 +-
 sound/soc/codecs/wm5100.c                          |     4 +-
 sound/soc/codecs/wm5102.c                          |    12 +-
 sound/soc/codecs/wm5110.c                          |    16 +-
 sound/soc/codecs/wm8350.c                          |     7 +-
 sound/soc/codecs/wm8400.c                          |    14 +-
 sound/soc/codecs/wm8510.c                          |     3 +-
 sound/soc/codecs/wm8523.c                          |     3 +-
 sound/soc/codecs/wm8580.c                          |     8 +-
 sound/soc/codecs/wm8711.c                          |     3 +-
 sound/soc/codecs/wm8728.c                          |     3 +-
 sound/soc/codecs/wm8731.c                          |     9 +-
 sound/soc/codecs/wm8737.c                          |     6 +-
 sound/soc/codecs/wm8750.c                          |     3 +-
 sound/soc/codecs/wm8753.c                          |     7 +-
 sound/soc/codecs/wm8770.c                          |     3 +-
 sound/soc/codecs/wm8776.c                          |     3 +-
 sound/soc/codecs/wm8804.c                          |     4 +-
 sound/soc/codecs/wm8900.c                          |    12 +-
 sound/soc/codecs/wm8903.c                          |    10 +-
 sound/soc/codecs/wm8904.c                          |    23 +-
 sound/soc/codecs/wm8940.c                          |     6 +-
 sound/soc/codecs/wm8955.c                          |    10 +-
 sound/soc/codecs/wm8958-dsp2.c                     |    32 +-
 sound/soc/codecs/wm8960.c                          |    16 +-
 sound/soc/codecs/wm8961.c                          |     5 +-
 sound/soc/codecs/wm8962.c                          |    30 +-
 sound/soc/codecs/wm8971.c                          |     3 +-
 sound/soc/codecs/wm8974.c                          |     3 +-
 sound/soc/codecs/wm8978.c                          |     9 +-
 sound/soc/codecs/wm8983.c                          |     7 +-
 sound/soc/codecs/wm8985.c                          |     9 +-
 sound/soc/codecs/wm8988.c                          |     3 +-
 sound/soc/codecs/wm8990.c                          |     9 +-
 sound/soc/codecs/wm8991.c                          |     5 +-
 sound/soc/codecs/wm8993.c                          |    13 +-
 sound/soc/codecs/wm8994.c                          |    46 +-
 sound/soc/codecs/wm8995.c                          |     7 +-
 sound/soc/codecs/wm8996.c                          |    13 +-
 sound/soc/codecs/wm8997.c                          |     4 +-
 sound/soc/codecs/wm8998.c                          |     8 +-
 sound/soc/codecs/wm9081.c                          |     7 +-
 sound/soc/codecs/wm9090.c                          |     5 +-
 sound/soc/codecs/wm9712.c                          |     7 +-
 sound/soc/codecs/wm9713.c                          |     7 +-
 sound/soc/codecs/wm_adsp.c                         |    21 +-
 sound/soc/codecs/wm_hubs.c                         |    10 +-
 sound/soc/codecs/wsa881x.c                         |     9 +-
 sound/soc/codecs/wsa883x.c                         |    19 +-
 sound/soc/codecs/wsa884x.c                         |     8 +-
 sound/soc/fsl/fsl-asoc-card.c                      |     4 +-
 sound/soc/fsl/fsl_aud2htx.h                        |     3 +-
 sound/soc/fsl/fsl_micfil.c                         |   136 +-
 sound/soc/fsl/fsl_spdif.c                          |    16 +-
 sound/soc/fsl/fsl_xcvr.c                           |    86 +-
 sound/soc/fsl/imx-rpmsg.c                          |     2 +-
 sound/soc/generic/audio-graph-card.c               |     4 +-
 sound/soc/intel/atom/sst-atom-controls.c           |    15 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |     3 +-
 sound/soc/intel/avs/boards/da7219.c                |     3 +-
 sound/soc/intel/avs/boards/es8336.c                |     5 +-
 sound/soc/intel/avs/boards/nau8825.c               |     3 +-
 sound/soc/intel/avs/boards/rt274.c                 |     6 +-
 sound/soc/intel/avs/boards/rt5514.c                |     3 +-
 sound/soc/intel/avs/boards/rt5640.c                |     3 +-
 sound/soc/intel/avs/control.c                      |     7 +-
 sound/soc/intel/avs/debugfs.c                      |     9 +-
 sound/soc/intel/avs/path.c                         |    13 +-
 sound/soc/intel/avs/pcm.c                          |     2 +-
 sound/soc/intel/avs/topology.c                     |   113 +-
 sound/soc/intel/avs/topology.h                     |     8 +
 sound/soc/intel/boards/bdw-rt5677.c                |     9 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |     3 +-
 sound/soc/intel/boards/bytcht_es8316.c             |     9 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    25 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    18 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    14 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |     5 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    12 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |     8 +-
 sound/soc/intel/boards/hda_dsp_common.c            |    15 +-
 sound/soc/intel/boards/sof_board_helpers.c         |    10 +-
 sound/soc/intel/boards/sof_cirrus_common.c         |     5 +-
 sound/soc/intel/boards/sof_da7219.c                |     5 +-
 sound/soc/intel/boards/sof_es8336.c                |    14 +-
 sound/soc/intel/boards/sof_maxim_common.c          |    22 +-
 sound/soc/intel/boards/sof_nau8825.c               |     2 +-
 sound/soc/intel/boards/sof_nuvoton_common.c        |     5 +-
 sound/soc/intel/boards/sof_pcm512x.c               |     5 +-
 sound/soc/intel/boards/sof_realtek_common.c        |    34 +-
 sound/soc/intel/boards/sof_rt5682.c                |    17 +-
 sound/soc/intel/boards/sof_sdw.c                   |    80 +-
 sound/soc/intel/catpt/device.c                     |    26 +-
 sound/soc/intel/catpt/loader.c                     |    18 +-
 sound/soc/intel/catpt/pcm.c                        |    31 +-
 sound/soc/intel/catpt/sysfs.c                      |     2 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |    79 +
 sound/soc/intel/common/sof-function-topology-lib.c |     8 +-
 sound/soc/mediatek/Kconfig                         |    31 +
 sound/soc/mediatek/Makefile                        |     1 +
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |     7 +-
 sound/soc/mediatek/common/mtk-btcvsd.c             |    24 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     |     5 +-
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c        |     4 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |     4 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |    12 +-
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c        |     4 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c         |     4 +-
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c         |     4 +-
 sound/soc/mediatek/mt8186/mt8186-misc-control.c    |    12 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c   |     2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c          |    19 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |    10 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c        |     4 +-
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c        |     2 +-
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c        |     3 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    17 +-
 sound/soc/mediatek/mt8189/Makefile                 |    18 +
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c         |   750 ++
 sound/soc/mediatek/mt8189/mt8189-afe-clk.h         |    76 +
 sound/soc/mediatek/mt8189/mt8189-afe-common.h      |   240 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c         |  2615 +++++
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c        |  1228 +++
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c         |  1463 +++
 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c         |   332 +
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c         |   672 ++
 sound/soc/mediatek/mt8189/mt8189-interconnection.h |    97 +
 sound/soc/mediatek/mt8189/mt8189-nau8825.c         |  1178 ++
 sound/soc/mediatek/mt8189/mt8189-reg.h             | 10773 +++++++++++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c        |    12 +-
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         |     4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |     6 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c        |     8 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |     3 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |    21 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         |     3 +-
 sound/soc/meson/aiu-acodec-ctrl.c                  |     6 +-
 sound/soc/meson/aiu-codec-ctrl.c                   |     6 +-
 sound/soc/meson/axg-spdifout.c                     |     4 +-
 sound/soc/meson/axg-tdm-interface.c                |     4 +-
 sound/soc/meson/g12a-toacodec.c                    |     6 +-
 sound/soc/meson/g12a-tohdmitx.c                    |    12 +-
 sound/soc/meson/t9015.c                            |     4 +-
 sound/soc/mxs/mxs-saif.c                           |   123 +-
 sound/soc/pxa/spitz.c                              |     9 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |   234 +-
 sound/soc/qcom/qdsp6/q6adm.c                       |   179 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |    49 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |    25 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |    57 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    87 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   203 +-
 sound/soc/qcom/qdsp6/q6asm.h                       |     1 +
 sound/soc/qcom/qdsp6/q6prm.c                       |    27 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |     6 +-
 sound/soc/qcom/qdsp6/q6usb.c                       |     3 +-
 sound/soc/qcom/qdsp6/topology.c                    |    12 +-
 sound/soc/qcom/sc7180.c                            |    10 +-
 sound/soc/qcom/sc7280.c                            |    67 +-
 sound/soc/qcom/sc8280xp.c                          |    34 +-
 sound/soc/qcom/sdm845.c                            |    53 +-
 sound/soc/qcom/sdw.c                               |   128 +-
 sound/soc/qcom/sdw.h                               |     7 +-
 sound/soc/qcom/sm8250.c                            |    34 +-
 sound/soc/qcom/x1e80100.c                          |    33 +-
 sound/soc/renesas/fsi.c                            |     8 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |     3 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |     3 +-
 sound/soc/rockchip/rockchip_max98090.c             |     2 +-
 sound/soc/rockchip/rockchip_sai.c                  |     8 +-
 sound/soc/samsung/aries_wm8994.c                   |     6 +-
 sound/soc/samsung/bells.c                          |     6 +-
 sound/soc/samsung/littlemill.c                     |     8 +-
 sound/soc/samsung/lowland.c                        |     3 +-
 sound/soc/samsung/midas_wm1811.c                   |     8 +-
 sound/soc/samsung/smdk_wm8994.c                    |    30 +-
 sound/soc/samsung/speyside.c                       |    24 +-
 sound/soc/samsung/tm2_wm5110.c                     |     7 +-
 sound/soc/samsung/tobermory.c                      |     6 +-
 sound/soc/sdca/Kconfig                             |    28 +
 sound/soc/sdca/Makefile                            |    10 +-
 sound/soc/sdca/sdca_asoc.c                         |    89 +-
 sound/soc/sdca/sdca_class.c                        |   304 +
 sound/soc/sdca/sdca_class.h                        |    37 +
 sound/soc/sdca/sdca_class_function.c               |   460 +
 sound/soc/sdca/sdca_device.c                       |    20 +
 sound/soc/sdca/sdca_fdl.c                          |   504 +
 sound/soc/sdca/sdca_function_device.c              |   117 +
 sound/soc/sdca/sdca_function_device.h              |    15 +
 sound/soc/sdca/sdca_functions.c                    |   310 +-
 sound/soc/sdca/sdca_hid.c                          |    59 +-
 sound/soc/sdca/sdca_interrupts.c                   |   280 +-
 sound/soc/sdca/sdca_regmap.c                       |    98 +-
 sound/soc/sdca/sdca_ump.c                          |   262 +
 sound/soc/sdw_utils/Makefile                       |     1 +
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c       |     5 +-
 sound/soc/sdw_utils/soc_sdw_cs42l42.c              |     3 +-
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |     9 +-
 sound/soc/sdw_utils/soc_sdw_cs42l45.c              |    80 +
 sound/soc/sdw_utils/soc_sdw_cs_amp.c               |     3 +-
 sound/soc/sdw_utils/soc_sdw_dmic.c                 |     5 +-
 sound/soc/sdw_utils/soc_sdw_maxim.c                |     8 +-
 sound/soc/sdw_utils/soc_sdw_rt5682.c               |     3 +-
 sound/soc/sdw_utils/soc_sdw_rt700.c                |     3 +-
 sound/soc/sdw_utils/soc_sdw_rt711.c                |     3 +-
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |     5 +-
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c           |     3 +-
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c  |    11 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c               |     3 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |   158 +-
 sound/soc/soc-core.c                               |    42 +-
 sound/soc/soc-dai.c                                |     5 +-
 sound/soc/soc-dapm.c                               |   196 +-
 sound/soc/soc-jack.c                               |     2 +-
 sound/soc/soc-ops.c                                |    62 +-
 sound/soc/soc-pcm.c                                |    38 +-
 sound/soc/soc-topology.c                           |    10 +-
 sound/soc/sof/fw-file-profile.c                    |    13 +-
 sound/soc/sof/imx/Kconfig                          |     1 +
 sound/soc/sof/imx/imx9.c                           |    36 +-
 sound/soc/sof/intel/Kconfig                        |     1 +
 sound/soc/sof/intel/apl.c                          |     1 +
 sound/soc/sof/intel/cnl.c                          |     4 +-
 sound/soc/sof/intel/hda-ipc.c                      |     2 +-
 sound/soc/sof/intel/hda.c                          |   213 +-
 sound/soc/sof/intel/icl.c                          |     1 +
 sound/soc/sof/intel/lnl.c                          |     1 +
 sound/soc/sof/intel/mtl.c                          |     2 +
 sound/soc/sof/intel/ptl.c                          |     2 +
 sound/soc/sof/intel/shim.h                         |     1 +
 sound/soc/sof/intel/skl.c                          |     1 +
 sound/soc/sof/intel/tgl.c                          |     4 +
 sound/soc/sof/pcm.c                                |    18 +
 sound/soc/sof/sof-client-probes-ipc4.c             |     2 +-
 sound/soc/sof/sof-client-probes.c                  |    11 +-
 sound/soc/sof/topology.c                           |     7 +-
 sound/soc/spacemit/Kconfig                         |    15 +
 sound/soc/spacemit/Makefile                        |     5 +
 sound/soc/spacemit/k1_i2s.c                        |   461 +
 sound/soc/stm/stm32_adfsdm.c                       |     2 +-
 sound/soc/stm/stm32_sai.c                          |    14 +-
 sound/soc/stm/stm32_sai_sub.c                      |    57 +-
 sound/soc/sunxi/sun4i-codec.c                      |     3 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    26 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |     2 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |    14 +-
 sound/soc/sunxi/sun8i-codec.c                      |     4 +-
 sound/soc/tegra/Kconfig                            |     2 +-
 sound/soc/tegra/tegra186_asrc.c                    |    24 +-
 sound/soc/tegra/tegra186_dspk.c                    |    24 +-
 sound/soc/tegra/tegra210_admaif.c                  |    16 +-
 sound/soc/tegra/tegra210_adx.c                     |     4 +-
 sound/soc/tegra/tegra210_ahub.c                    |     6 +-
 sound/soc/tegra/tegra210_amx.c                     |     4 +-
 sound/soc/tegra/tegra210_dmic.c                    |    24 +-
 sound/soc/tegra/tegra210_i2s.c                     |    32 +-
 sound/soc/tegra/tegra210_mbdrc.c                   |    24 +-
 sound/soc/tegra/tegra210_mixer.c                   |     4 +-
 sound/soc/tegra/tegra210_mvc.c                     |    12 +-
 sound/soc/tegra/tegra210_ope.c                     |     4 +-
 sound/soc/tegra/tegra210_peq.c                     |     8 +-
 sound/soc/tegra/tegra210_sfc.c                     |    16 +-
 sound/soc/tegra/tegra_asoc_machine.c               |    11 +-
 sound/soc/tegra/tegra_wm8903.c                     |     3 +-
 sound/soc/ti/ams-delta.c                           |     8 +-
 sound/soc/ti/davinci-evm.c                         |    11 +-
 sound/soc/ti/j721e-evm.c                           |     2 +-
 sound/soc/ti/n810.c                                |    12 +-
 sound/soc/ti/omap-abe-twl6040.c                    |     2 +-
 sound/soc/ti/omap-twl4030.c                        |     2 +-
 sound/soc/ti/omap3pandora.c                        |    36 +-
 sound/soc/ti/rx51.c                                |    17 +-
 sound/soc/uniphier/aio-cpu.c                       |     4 +-
 sound/soc/uniphier/evea.c                          |    12 +-
 sound/soc/ux500/mop500_ab8500.c                    |     2 +-
 571 files changed, 32195 insertions(+), 5513 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2602.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4265.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4341.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/cs4349.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/da9055.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8810.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nxp,uda1342.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm1789.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm179x.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm186x.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm5102a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/trivial-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8523.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8580.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8711.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8728.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8737.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8750.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8776.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8974.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8770.txt
 create mode 100644 drivers/gpio/gpio-shared-proxy.c
 create mode 100644 drivers/gpio/gpiolib-shared.c
 create mode 100644 drivers/gpio/gpiolib-shared.h
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/codecs/cs530x-spi.c
 create mode 100644 sound/soc/mediatek/mt8189/Makefile
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-reg.h
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdca/sdca_class_function.c
 create mode 100644 sound/soc/sdca/sdca_fdl.c
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h
 create mode 100644 sound/soc/sdca/sdca_ump.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs42l45.c
 create mode 100644 sound/soc/spacemit/Kconfig
 create mode 100644 sound/soc/spacemit/Makefile
 create mode 100644 sound/soc/spacemit/k1_i2s.c
