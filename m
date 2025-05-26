Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3329AC3DDF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 May 2025 12:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824486017D;
	Mon, 26 May 2025 12:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824486017D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748255428;
	bh=BdD3/ZzwlUtZ/zv6FIAq53nt5CTqyjoH7iYX5xpnZ2w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lLEOJVp+zSc13kDogFgR5f0IQqDWIl9Of+8LIZzjcPkrp1fzad6DyRFV00i04ccq+
	 BTtrU4aYIDvBdzh8kzMPhprJA71tk3IaLRg1suVUfKz2uP9daC2VQdBTgNxEq6orE+
	 Sw3CYwr5GX7KsbHC7YX4Cvz9Kg9WnUZa7u32qjeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CAAF805BE; Mon, 26 May 2025 12:29:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF24F80171;
	Mon, 26 May 2025 12:29:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70577F80154; Mon, 26 May 2025 12:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D66A2F800F0
	for <alsa-devel@alsa-project.org>; Mon, 26 May 2025 12:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D66A2F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=coiEvDCq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4868A4ECDF;
	Mon, 26 May 2025 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E200C4CEE7;
	Mon, 26 May 2025 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748255382;
	bh=BdD3/ZzwlUtZ/zv6FIAq53nt5CTqyjoH7iYX5xpnZ2w=;
	h=From:To:Cc:Subject:Date:From;
	b=coiEvDCqQKHkXEMm/Ma8c5PRp3G4Sz402ky5Qc8MPKRK1ytvTSr0Ywd5mnT0ee40Q
	 +899cH8ZBnliDpKavDwmE2mhnP7ZWQsCuotU1ZAg4G/aAl+tURDdp0a0nqGsWSJaRV
	 tIBpKsDKb/kNTAFNU43loULoE8f8RAa47BsHyHAezKBx9j8lYn5Up7+YbDPKV7Mdor
	 1xf9zHm1u4KDSNEt+VA3jkzM/uzxnH878Dydvy1m53P7wuywyYet9fvLOeFlHDbJWW
	 BDFOlNqnkDOuH3hleea6pTgUVDkC8MtA3B3VXGWnqb/wuW3c+5NKZ1oyUx0GzCyLnf
	 vDmu7WS28ac9Q==
Message-ID: <1aabf72ff35fa568604cf5e0aea8c6a9.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.16
Date: Mon, 26 May 2025 11:29:37 +0100
Message-ID-Hash: GGIZVO3CMOHIJOZMFXLZOT2PGVDN7ERX
X-Message-ID-Hash: GGIZVO3CMOHIJOZMFXLZOT2PGVDN7ERX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGIZVO3CMOHIJOZMFXLZOT2PGVDN7ERX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.16

for you to fetch changes up to 7ce3bf76c3adfbfcfa712d5090428f67c97db201:

  Add Tegra264 support in AHUB drivers (2025-05-22 14:38:05 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.16

The changes in this release are quite large, mainly in drivers rather
than the core.  This is partly due to cleanups that touch a lot of
drivers and partly due to several relatively large new drivers.

 - Support for automatically enumerating DAIs from standards conforming
   SoundWire SDCA devices, further work is required for these to be
   useful in an actual card.
 - Conversion of quite a few drivers to newer GPIO APIs.
 - More helpers and cleanups from Mormimoto-san.
 - Support for a wider range of AVS platforms.
 - Support for AMD ACP 7.x platforms, Cirrus Logic CS35L63 and CS48L32,
   Everest Semiconductor ES8389, Longsoon-1 AC'97 controllers, nVidia
   Tegra264, Richtek ALC203 and RT9123 and Rockchip SAI controllers.

----------------------------------------------------------------
Amadeusz Sławiński (27):
      ASoC: Intel: avs: Add boards definitions for FCL platform
      ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
      ASoC: Intel: avs: Use topology information for endpoint numbers
      ASoC: Intel: avs: boards: Change da7219 card name
      ASoC: Intel: avs: boards: Change DMIC card name
      ASoC: Intel: avs: boards: Change es8336 card name
      ASoC: Intel: avs: boards: Change hdaudio card name
      ASoC: Intel: avs: boards: Change sspX-loopback card name
      ASoC: Intel: avs: boards: Change max98357a card name
      ASoC: Intel: avs: boards: Change max98373 card name
      ASoC: Intel: avs: boards: Change max98927 card name
      ASoC: Intel: avs: boards: Change nau8825 card name
      ASoC: Intel: avs: boards: Change pcm3168a card name
      ASoC: Intel: avs: boards: Change probe card name
      ASoC: Intel: avs: boards: Change rt274 card name
      ASoC: Intel: avs: boards: Change rt286 card name
      ASoC: Intel: avs: boards: Change rt298 card name
      ASoC: Intel: avs: boards: Change rt5514 card name
      ASoC: Intel: avs: boards: Change rt5663 card name
      ASoC: Intel: avs: boards: Change rt5682 card name
      ASoC: Intel: avs: boards: Change ssm4567 card name
      ASoC: Intel: avs: Rename AVS_CHANNELS_MAX define
      ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
      ASoC: Intel: avs: Assign unique ID to platform devices
      ASoC: Intel: avs: Iterate over correct number of TDMs
      ASoC: Intel: avs: Support 16 TDMs in dynamic assignment
      ASoC: Intel: avs: Fix NULL pointer dereference

André Apitzsch (1):
      ASoC: wm8998: Add Kconfig prompt

Bard Liao (14):
      ASoC: SOF: topology: allocate string for tuples
      ASoC: SOF: topology: don't convert error code
      ASoC: soc-acpi: add get_function_tplg_files ops
      ASoC: SOF: topology: load multiple topologies
      ASoC: Intel: add sof_sdw_get_tplg_files ops
      ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
      ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
      ASoC: sdw_utils: split asoc_sdw_get_codec_name
      ASoC: soc_sdw_utils: skip the endpoint that doesn't present
      ASoC: SOF: add disable_function_topology flag
      ASoC: SOF: set disable_function_topology if override_tplg_filename is set
      ASoC: SOF: add disable_function_topology module parameter

Bartosz Golaszewski (12):
      ASoC: soc-ac97: use new GPIO line value setter callbacks
      ASoC: ti: davinci-mcasp:: use new GPIO line value setter callbacks
      ASoC: codecs: wm8962: use new GPIO line value setter callbacks
      ASoC: codecs: wm5100: use new GPIO line value setter callbacks
      ASoC: codecs: rt5677: use new GPIO line value setter callbacks
      ASoC: codecs: wm8996: use new GPIO line value setter callbacks
      ASoC: codecs: tlv320adc3xxx: use new GPIO line value setter callbacks
      ASoC: codecs: idt821034: use new GPIO line value setter callbacks
      ASoC: codecs: peb2466: use new GPIO line value setter callbacks
      ASoC: codecs: wm8903: use new GPIO line value setter callbacks
      ASoC: codecs: zl38060: use new GPIO line value setter callbacks
      ALSA: hda: cirrus_scodec_test: use new GPIO line value setter callbacks

Brady Norander (1):
      ASoC: amd: use new ACP dev names for DAI links

Cezary Rojewski (14):
      ASoC: core: Complete support for card rebinding
      ASoC: Intel: avs: Permit deferred card registration
      ALSA: hda: Allow to fetch hlink by ID
      ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
      ASoC: Intel: avs: Read HW capabilities when possible
      ASoC: Intel: avs: Relocate DSP status registers
      ASoC: Intel: avs: PTL-based platforms support
      ASoC: Intel: avs: PCM operations for LNL-based platforms
      ASoC: Intel: avs: Dynamically assign ops for non-HDAudio DAIs
      ASoC: Intel: avs: Conditionally add DMA config when creating Copier
      ALSA: hda: Select avs-driver by default on FCL
      lib/string_helpers: Introduce parse_int_array()
      ALSA: hda: Allow for 16 channels configuration
      ASoC: Intel: avs: Allow for 16 channels configuration

Chancel Liu (2):
      ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
      ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream

Charles Keepax (9):
      ASoC: sdw_utils: Remove num_platforms from simple DAI helper
      ASoC: Intel: sof_sdw: Avoid NULL check fail when re-probing
      ASoC: SDCA: Fix minor typo
      ASoC: SDCA: Remove regmap module macros
      ASoC: SDCA: Move allocation of PDE delays array
      ASoC: dapm: Add component level pin switches
      ASoC: SDCA: Create DAPM widgets and routes from DisCo
      ASoC: SDCA: Create ALSA controls from DisCo
      ASoC: SDCA: Create DAI drivers from DisCo

Chen Ni (8):
      ASoC: sun8i-codec: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      ASoC: sta32x: Remove unnecessary NULL check before clk_disable_unprepare()
      ASoC: tas2781-fmwlib: Remove unnecessary NULL check before release_firmware()
      ASoC: pcm6240: Remove unnecessary NULL check before release_firmware()
      ASoC: wm_adsp: Remove unnecessary NULL check before release_firmware()
      ASoC: tas2781-i2c: Remove unnecessary NULL check before release_firmware()
      ASoC: ak4458: Remove useless return variable
      ASoC: fsl_rpmsg: Remove useless return variable

Chen-Yu Tsai (4):
      ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
      ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
      ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
      ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()

ChiYuan Huang (5):
      ASoC: dt-bindings: Add bindings for Richtek rt9123
      ASoC: codecs: Add support for Richtek rt9123
      ASoC: dt-bindings: Add bindings for Richtek rt9123p
      ASoC: codecs: Add support for Richtek rt9123p
      ASoC: codecs: rt9123: Fix sparse cast warning

Colin Ian King (3):
      ASoC: cs48l32: Fix spelling mistake "exceeeds" -> "exceeds"
      ASoC: rt712-sdca: remove redundant else path of if statement
      ASoC: rt712-sdca: remove redundant else path of if statement

Cristian Ciocaltea (1):
      ASoC: amd: acp: Drop superfluous assignment in acp_sof_probe()

Daniel Baluta (1):
      ASoC: SOF: imx8m: Use reset controller API to control the DSP

Dr. David Alan Gilbert (2):
      ASoC: codecs: Remove unused rt566[58]_sel_asrc_clk_src
      ASoC: Intel: atom: Remove unused functions

Hector Martin (3):
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2764: Enable main IRQs

Helen Koike (1):
      ASoC: Intel: Remove unused SND_SOC_INTEL_DA7219_MAX98357A_GENERIC

I Hsin Cheng (1):
      ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()

James Calligeros (2):
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

Johan Hovold (2):
      ASoC: codecs: wcd938x: fix mux error handling
      ASoC: codecs: wcd938x: drop unnecessary mux flag assignment

Julien Massot (6):
      ASoC: mediatek: mt8195: Move rt5682 specific dapm routes
      ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
      ASoC: mediatek: mt8195: Add mt8195-mt6359 card
      ASoC: dt-bindings: mt8195: add compatible mt8195_mt6359
      ASoC: dt-bindings: mt8195: add missing audio routing and link-name
      ASoC: SOF: topology: Fix null pointer dereference

Kees Cook (1):
      ASoC: SOF: ipc4-pcm: Adjust pipeline_list->pipelines allocation type

Keguang Zhang (4):
      ASoC: dt-bindings: Add Loongson-1 AC97 Controller
      ASoC: dt-bindings: Add Realtek ALC203 Codec
      ASoC: loongson: Add Loongson-1 AC97 Driver
      ASoC: ac97: Add DT support

Konrad Dybcio (1):
      ASoC: q6apm-lpass-dais: Print APM port id in decimal on enable error

Krzysztof Kozlowski (4):
      ASoC: dt-bindings: maxim,max98925: Fix include placement in DTS example
      ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc marker from inner comment
      ASoC: codecs: tas2764: Fix Wvoid-pointer-to-enum-cast warning
      ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider

Kuninori Morimoto (18):
      ASoC: rsnd: use snd_pcm_direction_name()
      ASoC: simple-card-utils: fixup dlc->xxx handling for error case
      spi: sh-msiof: use dev in sh_msiof_spi_probe()
      spi: sh-msiof: ignore driver probing if it was MSIOF Sound
      ASoC: fsl: don't set link->platform if not needed
      dt-bindings: renesas,sh-msiof: Add MSIOF I2S Sound support
      ASoC: renesas: rsnd: allow to use ADG as standalone
      ASoC: renesas: rsnd: care BRGA/BRGB select in rsnd_adg_clk_enable()
      ASoC: renesas: rsnd: enable to use "adg" clock
      ASoC: renesas: add MSIOF sound support
      ASoC: soc-utils: add snd_soc_dlc_is_dummy()
      ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
      ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()
      ASoC: soc.h: remove snd_soc_disconnect_sync()
      ASoC: soc.h: remove unnecessary definitions
      ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
      ASoC: dt-bindings: audio-graph-card2: add missing mic-det-gpios
      ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property

Mac Chiang (2):
      ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
      ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support

Mark Brown (34):
      ASoC: Intel: avs: Update machine board card names
      ASoC: Intel: avs: Add support for FCL platform
      ASoC: Intel: avs: 16 channels support
      ASoC: codec: wcd93xx: Convert to GPIO descriptors
      ASoC: fsl_sai: add several improvements
      ASoC: wcd938x: enable t14s audio headset
      ASoC: tas27{64,70}: improve support for Apple codec
      ASoC: Add Richtek rt9123 and rt9123p support
      ASoC: convert GPIO chips to using new value setters
      Add support for Loongson-1 AC97
      ASoC: skip the endpoint that doesn't present and
      ASoC: Add codec driver for Cirrus Logic CS48L32 DSP
      ASoC: mt8195: Add support for MT8395 Radxa NIO 12L
      Add RK3576 SAI Audio Controller Support
      ASoC: Merge up fixes
      ASoC: codecs: wcd938x: fix mux error handling
      ASoC: codec: tpa6130a2: Convert to GPIO descriptors
      ASoC: add Renesas MSIOF sound driver
      ASoC: codec: twl4030: Convert to GPIO descriptors
      ASoC: soc-utils: add snd_soc_dlc_is_dummy()
      ASoC: SOF: amd: add soundwire IO support for ACP7.0 &
      AsoC: Phase out hybrid PCI devres
      ASoC: codec: cs42l[56,73,52]: Convert to GPIO
      Minor bug fix and tidy up for sof_sdw
      ASoC: SOF: add disable_function_topology flag and
      Add support for CS35L63 Smart Amplifier
      ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Add
      ASoC: codecs: add support for ES8389
      cs35l56: Log tuning unique identifiers during firmware
      ASoC: mediatek: mt8183-afe-pcm: Shorten source code
      Add sound card support for QCS9100 and QCS9075
      ASoC: Add Intel machine driver support for CS35L63
      Add DAPM/ASoC helpers to create SDCA drivers
      Add Tegra264 support in AHUB drivers

Martin Blumenstingl (2):
      ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
      ASoC: meson: meson-card-utils: use of_property_present() for DT parsing

Martin Povišer (3):
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2764: Apply Apple quirks

Michael Sikora (1):
      ASoC: adau7118: Allow dsp_a mode

Mohammad Rafi Shaik (2):
      ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
      ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075

Nathan Chancellor (1):
      ASoC: cs48l32: Use modern PM_OPS

Naveen Manohar (2):
      ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI link/machine tables
      ASoC: Intel: sof_sdw: Add support for wclrvp & ocelot in WCL platform

Nicolas Frattaroli (3):
      ASoC: test-component: add set_tdm_slot stub implementation
      ASoC: dt-bindings: add schema for rockchip SAI controllers
      ASoC: rockchip: add Serial Audio Interface (SAI) driver

Nishanth Menon (1):
      ASoC: tlv320aic3x: Use dev_err_probe

Peng Fan (19):
      ASoC: codec: wcd939x: Convert to GPIO descriptors
      ASoC: codec: wcd938x: Convert to GPIO descriptors
      ASoC: codec: wcd9335: Convert to GPIO descriptors
      ASoC: codec: ak5386: Convert to GPIO descriptors
      ASoC: codec: tpa6130a2: Sort headers alphabetically
      ASoC: codec: tpa6130a2: Remove tpa6130a2_platform_data
      ASoC: codec: tpa6130a2: Convert to GPIO descriptors
      ASoC: codec: twl4030: Sort headers alphabetically
      ASoC: codec: twl4030: Convert to GPIO descriptors
      ASoC: codec: sma1307: Remove including of_gpio.h
      ASoC: codec: cs42l56: Sort headers alphabetically
      ASoC: codec: cs42l56: Drop cs42l56.h
      ASoC: codec: cs42l56: Convert to GPIO descriptors
      ASoC: codec: cs42l73: Sort headers alphabetically
      ASoC: codec: cs42l73: Drop cs42l73.h
      ASoC: codec: cs42l73: Convert to GPIO descriptors
      ASoC: codec: cs42l52: Sort headers alphabetically
      ASoC: codec: cs42l52: Drop cs42l52.h
      ASoC: codec: cs42l52: Convert to GPIO descriptors

Philipp Stanner (5):
      ASoC: loongson: Replace deprecated PCI functions
      ASoC: sof: Use pure devres PCI
      ASoC: intel: avs: Use pure devres PCI
      ASoC: intel: atom: Use pure devres PCI
      ASoC: intel: atom: Return -ENOMEM if pcim_iomap() fails

Richard Fitzgerald (10):
      ASoC: wm_adsp: Use vmemdup_user() instead of open-coding
      ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
      ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP
      ASoC: cs-amp-lib-test: Use flex_array_size()
      ASoC: cs-amp-lib-test: Use faux bus instead of creating a dummy platform device
      firmware: cs_dsp: Add some sanity-checking to test harness
      MAINTAINERS: ASoC: Simplify references to Cirrus Logic include files
      ASoC: wm_adsp: Don't use no_free_ptr() when passing to PTR_ERR()
      ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2
      ASoC: wm_adsp: Make cirrus_dir const

Sheetal (11):
      dt-bindings: ASoC: admaif: Add missing properties
      dt-bindings: ASoC: Document Tegra264 APE support
      ASoC: tegra: CIF: Add Tegra264 support
      ASoC: tegra: ADMAIF: Add Tegra264 support
      ASoC: tegra: ASRC: Update ARAM address
      ASoC: tegra: Update PLL rate for Tegra264
      ASoC: tegra: I2S: Add Tegra264 support
      ASoC: tegra: AMX: Add Tegra264 support
      ASoC: tegra: ADX: Add Tegra264 support
      ASoC: tegra: AHUB: Add Tegra264 support
      ASoC: tegra: Tegra264 support in isomgr_bw

Shenghao Ding (2):
      ASoC: tas2781: Add a debugfs node for acoustic tuning
      ASoC: tas2781: Header file cleanup and Move the macro definitions to fwlib

Shengjiu Wang (7):
      ASoC: fsl_sai: allow to set mclk rate with zero clk_id
      ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
      ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
      ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
      ASoC: dt-bindings: fsl,mqs: Reference common DAI properties
      ASoC: dt-bindings: fsl,mqs: Document audio graph port
      ASoC: fsl_xcvr: update platform driver name

Shuming Fan (3):
      ASoC: rt722: fix pop noise at the beginning of headphone playback
      ASoC: rt722: fix pop noise at the beginning of DMIC recording
      ASoC: rt722: make regmap cache-only in probe

Simon Trimmer (2):
      ASoC: cs35l56: Log tuning unique identifiers during firmware load
      ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load

Srinivas Kandagatla (3):
      ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
      ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
      ASoC: codecs: wcd938x: add mux control support for hp audio mux

Stefan Binding (6):
      ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap config
      ASoC: cs35l56: Add struct to index firmware registers
      ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware register list
      ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
      ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63
      ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver

Talhah Peerbhai (1):
      ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9

Thorsten Blum (6):
      ASoC: codecs: rt5677: Use secs_to_jiffies() instead of msecs_to_jiffies()
      ASoC: cs-amp-lib: Replace offsetof() with struct_size()
      ASoC: cs-amp-lib: Annotate struct cirrus_amp_efi_data with __counted_by()
      ASoC: starfive: Use max() to simplify code in jh7110_tdm_syncdiv()
      ASoC: codecs: Use min() to simplify aw_dev_dsp_update_container()
      ASoC: Intel: avs: Fix kcalloc() sizes

Vijendar Mukunda (12):
      ASoC: SOF: amd: remove else condition in resume sequence
      ASoC: SOF: amd: add missing acp descriptor field
      ASoC: SOF: amd: add ACP7.1 platform support
      ASoC: SOF: amd: update soundwire specific acp descriptor fields
      ASoC: SOF: amd: enable ACP_PME_EN register for ACP7.0 & ACP7.1 platforms
      ASoC: SOF: amd: refactor acp reset sequence
      ASoC: SOF: amd: enable soundwire host wake irq mask
      ASoC: SOF: amd: add soundwire wake irq handling
      ASoC: SOF: amd: add build support for soundwire
      ASoC: amd: amd_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
      ASoC: amd: sof_amd_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
      ASoC: amd: sof_amd_sdw: add logic to get cpu_pin_id for ACP7.0/ACP7.1 platforms

Yuanjun Gong (1):
      ASoC: tegra210_ahub: Add check to of_device_get_match_data()

Zhang Enpei (1):
      ASoC: stm: stm32_sai: Use dev_err_probe()

Zhang Yi (2):
      ASoC: codecs: add support for ES8389
      ASoC: dt-bindings: Add Everest ES8389 audio CODEC

 .../bindings/bus/nvidia,tegra210-aconnect.yaml     |    1 +
 .../bindings/sound/audio-graph-card2.yaml          |    8 +-
 .../devicetree/bindings/sound/cirrus,cs48l32.yaml  |  195 +
 .../devicetree/bindings/sound/everest,es8389.yaml  |   50 +
 .../devicetree/bindings/sound/fsl,mqs.yaml         |   10 +-
 .../bindings/sound/loongson,ls1b-ac97.yaml         |   68 +
 .../devicetree/bindings/sound/maxim,max98925.yaml  |    2 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |    7 +-
 .../sound/mt8186-mt6366-da7219-max98357.yaml       |    7 +-
 .../devicetree/bindings/sound/mt8195-mt6359.yaml   |    4 +
 .../sound/nvidia,tegra-audio-graph-card.yaml       |    1 +
 .../bindings/sound/nvidia,tegra186-asrc.yaml       |    4 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   17 +
 .../bindings/sound/nvidia,tegra210-adx.yaml        |    4 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |    6 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |    4 +-
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-ope.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-peq.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |    1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    2 +
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |    6 +
 .../devicetree/bindings/sound/realtek,alc203.yaml  |   36 +
 .../devicetree/bindings/sound/richtek,rt9123.yaml  |   56 +
 .../devicetree/bindings/sound/richtek,rt9123p.yaml |   48 +
 .../bindings/sound/rockchip,rk3576-sai.yaml        |  144 +
 .../devicetree/bindings/spi/renesas,sh-msiof.yaml  |   43 +-
 MAINTAINERS                                        |   17 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     |    3 +
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |   15 +-
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |    4 +
 drivers/spi/spi-sh-msiof.c                         |   42 +-
 include/dt-bindings/sound/cs48l32.h                |   20 +
 include/linux/pci_ids.h                            |    1 +
 include/linux/string_helpers.h                     |    1 +
 include/sound/cs-amp-lib.h                         |    2 +-
 include/sound/cs35l56.h                            |   29 +
 include/sound/cs42l52.h                            |   29 -
 include/sound/cs42l56.h                            |   45 -
 include/sound/cs42l73.h                            |   19 -
 include/sound/cs48l32.h                            |   47 +
 include/sound/cs48l32_registers.h                  |  530 +++
 include/sound/hdaudio_ext.h                        |    6 +
 include/sound/sdca_asoc.h                          |   42 +
 include/sound/sdca_function.h                      |   71 +-
 include/sound/soc-acpi.h                           |   13 +
 include/sound/soc-dapm.h                           |    4 +
 include/sound/soc.h                                |   15 +-
 include/sound/soc_sdw_utils.h                      |    5 +-
 include/sound/sof.h                                |    1 +
 include/sound/tas2781.h                            |   30 +-
 include/sound/tpa6130a2-plat.h                     |   17 -
 lib/string_helpers.c                               |   39 +-
 sound/hda/ext/hdac_ext_controller.c                |   19 +
 sound/hda/hdac_device.c                            |    2 +-
 sound/hda/intel-dsp-config.c                       |    4 +
 sound/pci/hda/cirrus_scodec_test.c                 |    7 +-
 sound/pci/hda/cs35l56_hda.c                        |   24 +-
 sound/pci/hda/cs35l56_hda_i2c.c                    |    3 +
 sound/pci/hda/cs35l56_hda_spi.c                    |    3 +
 sound/soc/amd/acp-da7219-max98357a.c               |    8 +-
 sound/soc/amd/acp-es8336.c                         |    4 +-
 sound/soc/amd/acp-rt5645.c                         |    6 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |    4 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |   10 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |    2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |    9 +-
 sound/soc/codecs/Kconfig                           |   33 +-
 sound/soc/codecs/Makefile                          |   10 +-
 sound/soc/codecs/ac97.c                            |   10 +
 sound/soc/codecs/adau7118.c                        |    6 +
 sound/soc/codecs/ak4458.c                          |   10 +-
 sound/soc/codecs/ak5386.c                          |   28 +-
 sound/soc/codecs/aw88166.c                         |    7 +-
 sound/soc/codecs/aw88395/aw88395_device.c          |    7 +-
 sound/soc/codecs/aw88399.c                         |    7 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |   70 +-
 sound/soc/codecs/cs-amp-lib.c                      |    3 +-
 sound/soc/codecs/cs35l56-i2c.c                     |   23 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   91 +-
 sound/soc/codecs/cs35l56-shared.c                  |  257 +-
 sound/soc/codecs/cs35l56-spi.c                     |    3 +
 sound/soc/codecs/cs35l56.c                         |   48 +-
 sound/soc/codecs/cs35l56.h                         |    1 +
 sound/soc/codecs/cs42l52.c                         |  112 +-
 sound/soc/codecs/cs42l56.c                         |   90 +-
 sound/soc/codecs/cs42l73.c                         |   70 +-
 sound/soc/codecs/cs48l32-tables.c                  |  540 +++
 sound/soc/codecs/cs48l32.c                         | 4073 ++++++++++++++++++++
 sound/soc/codecs/cs48l32.h                         |  403 ++
 sound/soc/codecs/es8389.c                          |  962 +++++
 sound/soc/codecs/es8389.h                          |  140 +
 sound/soc/codecs/hdmi-codec.c                      |    1 +
 sound/soc/codecs/idt821034.c                       |   17 +-
 sound/soc/codecs/pcm6240.c                         |    3 +-
 sound/soc/codecs/peb2466.c                         |   15 +-
 sound/soc/codecs/rt5665.c                          |   96 -
 sound/soc/codecs/rt5665.h                          |    3 -
 sound/soc/codecs/rt5668.c                          |   43 -
 sound/soc/codecs/rt5668.h                          |    3 -
 sound/soc/codecs/rt5677-spi.c                      |    4 +-
 sound/soc/codecs/rt5677.c                          |    7 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    8 +-
 sound/soc/codecs/rt712-sdca.c                      |    8 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   20 +
 sound/soc/codecs/rt722-sdca-sdw.h                  |    1 +
 sound/soc/codecs/rt722-sdca.c                      |  322 +-
 sound/soc/codecs/rt722-sdca.h                      |    6 +
 sound/soc/codecs/rt9123.c                          |  503 +++
 sound/soc/codecs/rt9123p.c                         |  171 +
 sound/soc/codecs/sma1307.c                         |    1 -
 sound/soc/codecs/sta32x.c                          |    6 +-
 sound/soc/codecs/tas2764-quirks.h                  |  180 +
 sound/soc/codecs/tas2764.c                         |  139 +-
 sound/soc/codecs/tas2764.h                         |    3 +
 sound/soc/codecs/tas2770.c                         |  151 +-
 sound/soc/codecs/tas2770.h                         |    6 +
 sound/soc/codecs/tas2781-fmwlib.c                  |    8 +-
 sound/soc/codecs/tas2781-i2c.c                     |  157 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    8 +-
 sound/soc/codecs/tlv320aic3x.c                     |    6 +-
 sound/soc/codecs/tpa6130a2.c                       |   54 +-
 sound/soc/codecs/twl4030.c                         |   79 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     |    2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    2 +-
 sound/soc/codecs/wcd9335.c                         |   15 +-
 sound/soc/codecs/wcd937x.c                         |    2 +-
 sound/soc/codecs/wcd938x-sdw.c                     |    2 +-
 sound/soc/codecs/wcd938x.c                         |   69 +-
 sound/soc/codecs/wcd939x.c                         |   18 +-
 sound/soc/codecs/wm5100.c                          |   10 +-
 sound/soc/codecs/wm8903.c                          |   12 +-
 sound/soc/codecs/wm8962.c                          |   11 +-
 sound/soc/codecs/wm8996.c                          |   10 +-
 sound/soc/codecs/wm_adsp.c                         |   28 +-
 sound/soc/codecs/wsa883x.c                         |    2 +-
 sound/soc/codecs/wsa884x.c                         |    2 +-
 sound/soc/codecs/zl38060.c                         |   12 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   28 +-
 sound/soc/fsl/fsl_rpmsg.h                          |    2 +-
 sound/soc/fsl/fsl_sai.c                            |   90 +-
 sound/soc/fsl/fsl_sai.h                            |    6 +-
 sound/soc/fsl/fsl_xcvr.c                           |    2 +-
 sound/soc/fsl/imx-card.c                           |    7 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   21 +-
 sound/soc/generic/simple-card-utils.c              |   23 +-
 sound/soc/generic/test-component.c                 |   11 +
 sound/soc/intel/atom/sst/sst.h                     |    6 -
 sound/soc/intel/atom/sst/sst_drv_interface.c       |   24 -
 sound/soc/intel/atom/sst/sst_pci.c                 |   59 +-
 sound/soc/intel/atom/sst/sst_pvt.c                 |   33 -
 sound/soc/intel/avs/Makefile                       |    6 +-
 sound/soc/intel/avs/avs.h                          |   13 +-
 sound/soc/intel/avs/board_selection.c              |  181 +-
 sound/soc/intel/avs/boards/Kconfig                 |    8 +
 sound/soc/intel/avs/boards/da7219.c                |   11 +-
 sound/soc/intel/avs/boards/dmic.c                  |   12 +-
 sound/soc/intel/avs/boards/es8336.c                |   11 +-
 sound/soc/intel/avs/boards/hdaudio.c               |   25 +-
 sound/soc/intel/avs/boards/i2s_test.c              |   15 +-
 sound/soc/intel/avs/boards/max98357a.c             |   11 +-
 sound/soc/intel/avs/boards/max98373.c              |   11 +-
 sound/soc/intel/avs/boards/max98927.c              |   11 +-
 sound/soc/intel/avs/boards/nau8825.c               |   11 +-
 sound/soc/intel/avs/boards/pcm3168a.c              |   16 +-
 sound/soc/intel/avs/boards/probe.c                 |    5 +-
 sound/soc/intel/avs/boards/rt274.c                 |   11 +-
 sound/soc/intel/avs/boards/rt286.c                 |   11 +-
 sound/soc/intel/avs/boards/rt298.c                 |   11 +-
 sound/soc/intel/avs/boards/rt5514.c                |   11 +-
 sound/soc/intel/avs/boards/rt5663.c                |   11 +-
 sound/soc/intel/avs/boards/rt5682.c                |   11 +-
 sound/soc/intel/avs/boards/ssm4567.c               |   11 +-
 sound/soc/intel/avs/core.c                         |   68 +-
 sound/soc/intel/avs/dsp.c                          |    2 -
 sound/soc/intel/avs/lnl.c                          |   27 +
 sound/soc/intel/avs/loader.c                       |   11 +-
 sound/soc/intel/avs/messages.h                     |   34 +-
 sound/soc/intel/avs/mtl.c                          |  200 +
 sound/soc/intel/avs/path.c                         |   59 +-
 sound/soc/intel/avs/pcm.c                          |  156 +-
 sound/soc/intel/avs/probes.c                       |    2 +-
 sound/soc/intel/avs/ptl.c                          |   98 +
 sound/soc/intel/avs/registers.h                    |   40 +-
 sound/soc/intel/avs/topology.c                     |    4 +-
 sound/soc/intel/avs/topology.h                     |    2 +-
 sound/soc/intel/avs/utils.h                        |   16 +-
 sound/soc/intel/boards/Kconfig                     |    8 -
 sound/soc/intel/boards/sof_sdw.c                   |   48 +-
 sound/soc/intel/common/Makefile                    |    2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |    9 +
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   15 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   49 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  124 +-
 sound/soc/intel/common/sof-function-topology-lib.c |  135 +
 sound/soc/intel/common/sof-function-topology-lib.h |   15 +
 sound/soc/loongson/Kconfig                         |   10 +
 sound/soc/loongson/Makefile                        |    2 +
 sound/soc/loongson/loongson1_ac97.c                |  398 ++
 sound/soc/loongson/loongson_i2s_pci.c              |   13 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |  571 +--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    6 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |   45 +-
 sound/soc/meson/meson-card-utils.c                 |    2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |    2 +-
 sound/soc/qcom/sc8280xp.c                          |    2 +
 sound/soc/renesas/Kconfig                          |    7 +
 sound/soc/renesas/rcar/Makefile                    |    3 +
 sound/soc/renesas/rcar/adg.c                       |   32 +-
 sound/soc/renesas/rcar/core.c                      |    9 +-
 sound/soc/renesas/rcar/msiof.c                     |  566 +++
 sound/soc/rockchip/Kconfig                         |   10 +
 sound/soc/rockchip/Makefile                        |    2 +
 sound/soc/rockchip/rockchip_sai.c                  | 1555 ++++++++
 sound/soc/rockchip/rockchip_sai.h                  |  251 ++
 sound/soc/sdca/Makefile                            |    2 +-
 sound/soc/sdca/sdca_asoc.c                         | 1311 +++++++
 sound/soc/sdca/sdca_functions.c                    |   10 +-
 sound/soc/sdca/sdca_regmap.c                       |    3 -
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |    2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |  202 +-
 sound/soc/soc-ac97.c                               |   15 +-
 sound/soc/soc-core.c                               |  130 +-
 sound/soc/soc-dapm.c                               |   84 +-
 sound/soc/soc-devres.c                             |    7 +
 sound/soc/soc-utils.c                              |   13 +
 sound/soc/sof/amd/Kconfig                          |    7 +-
 sound/soc/sof/amd/acp-dsp-offset.h                 |   10 +
 sound/soc/sof/amd/acp.c                            |  133 +-
 sound/soc/sof/amd/acp.h                            |    7 +
 sound/soc/sof/amd/pci-acp70.c                      |   10 +-
 sound/soc/sof/core.c                               |   10 +-
 sound/soc/sof/imx/imx8.c                           |   24 +-
 sound/soc/sof/ipc4-pcm.c                           |    3 +-
 sound/soc/sof/sof-pci-dev.c                        |   16 +-
 sound/soc/sof/topology.c                           |   97 +-
 sound/soc/starfive/jh7110_tdm.c                    |   13 +-
 sound/soc/stm/stm32_sai.c                          |   18 +-
 sound/soc/sunxi/sun8i-codec.c                      |   13 +-
 sound/soc/tegra/tegra186_asrc.c                    |   18 +-
 sound/soc/tegra/tegra186_asrc.h                    |   12 +-
 sound/soc/tegra/tegra210_admaif.c                  |  223 +-
 sound/soc/tegra/tegra210_admaif.h                  |   78 +
 sound/soc/tegra/tegra210_adx.c                     |  229 +-
 sound/soc/tegra/tegra210_adx.h                     |   36 +-
 sound/soc/tegra/tegra210_ahub.c                    |  850 +++-
 sound/soc/tegra/tegra210_ahub.h                    |   52 +-
 sound/soc/tegra/tegra210_amx.c                     |  229 +-
 sound/soc/tegra/tegra210_amx.h                     |   34 +-
 sound/soc/tegra/tegra210_i2s.c                     |  231 +-
 sound/soc/tegra/tegra210_i2s.h                     |   51 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |   14 +-
 sound/soc/tegra/tegra_cif.h                        |   30 +-
 sound/soc/tegra/tegra_isomgr_bw.c                  |    7 +-
 sound/soc/ti/davinci-mcasp.c                       |    8 +-
 260 files changed, 18490 insertions(+), 2212 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls1b-ac97.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,alc203.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 delete mode 100644 include/sound/cs42l52.h
 delete mode 100644 include/sound/cs42l56.h
 delete mode 100644 include/sound/cs42l73.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 include/sound/sdca_asoc.h
 delete mode 100644 include/sound/tpa6130a2-plat.h
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h
 create mode 100644 sound/soc/codecs/rt9123.c
 create mode 100644 sound/soc/codecs/rt9123p.c
 create mode 100644 sound/soc/codecs/tas2764-quirks.h
 create mode 100644 sound/soc/intel/avs/lnl.c
 create mode 100644 sound/soc/intel/avs/mtl.c
 create mode 100644 sound/soc/intel/avs/ptl.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.c
 create mode 100644 sound/soc/intel/common/sof-function-topology-lib.h
 create mode 100644 sound/soc/loongson/loongson1_ac97.c
 create mode 100644 sound/soc/renesas/rcar/msiof.c
 create mode 100644 sound/soc/rockchip/rockchip_sai.c
 create mode 100644 sound/soc/rockchip/rockchip_sai.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c
