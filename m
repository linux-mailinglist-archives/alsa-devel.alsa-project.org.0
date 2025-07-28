Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A5B13A8B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jul 2025 14:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05EAE60253;
	Mon, 28 Jul 2025 14:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05EAE60253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753705966;
	bh=XlhEqqGUz98N8/K8fgb6IpkZEm02Ki0JMsEU9riV3kU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aK4qZmARdAzxJ083HaRHZ7QrZdo28sj6cBxeWzoeokNf8ZC3VpzpeGvfCEfIcCAqS
	 hrXjT55IXHGG61MISSw4tVwzMxiUVyzc4UcBNYQuw7kUHXu/srCDOSBTFFVT6iy6YV
	 6RyooaxV1x7NNzOCRJMeUwFGMbMLXnD7mjJAuSag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B66F0F805BF; Mon, 28 Jul 2025 14:32:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A300AF80494;
	Mon, 28 Jul 2025 14:32:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DCA7F8026A; Mon, 28 Jul 2025 14:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B524DF80152
	for <alsa-devel@alsa-project.org>; Mon, 28 Jul 2025 14:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B524DF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q6cTxD8q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 480E66000A;
	Mon, 28 Jul 2025 12:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1D7C4CEE7;
	Mon, 28 Jul 2025 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753705448;
	bh=XlhEqqGUz98N8/K8fgb6IpkZEm02Ki0JMsEU9riV3kU=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6cTxD8qC7ieQd5gKwDJiXG9o5PNRHUbU69HujEU2daX/pE21BIAZLxqRyrcey77t
	 8W6z5HrqzIoCEW0uh4QBcv+kE6Re5thg1aMJQHXLE65zSwxrxtfaJrNvFKIVj8aKGk
	 GbE01VtGTzJ6/FqRUcF+pbiQ1G8L+hnJZfBwN2Npr92xqdo6Un0PNEf08k8n7qNa+x
	 Ab84klN1L1aB8/BkRh5ZuyUB28+lM387n4atox991pt2cZk7GEyO23aPqn+lS6MwVg
	 t6ZjKqpRGSSIXMc7Pu0JV0hQhV7Oo9Z72bLpwsbWXBfOSraYZLJDeNOgbPWT7WBaN0
	 T7IvC70DsJeVg==
Message-ID: <70f6b7120f5f18eaeae8294cd55b5412.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.17-2
Date: Mon, 28 Jul 2025 13:23:56 +0100
Message-ID-Hash: XYPRLESVXT5PBCXMD7DI4MRQZMOZFEKP
X-Message-ID-Hash: XYPRLESVXT5PBCXMD7DI4MRQZMOZFEKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYPRLESVXT5PBCXMD7DI4MRQZMOZFEKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.17-2

for you to fetch changes up to e95122a32e777309412e30dc638dbc88b9036811:

  ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)

----------------------------------------------------------------
ASoC: More updates for v6.17

A few more updates, mostly fixes and device IDs plus some small
enhancements for the FSL xcvr driver.

----------------------------------------------------------------
Ai Chao (3):
      ASoC: renesas: Use helper function for_each_child_of_node_scoped()
      ASoC: meson: Use helper function for_each_child_of_node_scoped()
      ASoC: imx-card: Use helper function for_each_child_of_node_scoped()

Alexander Stein (1):
      ASoC: codec: tlv320aic32x4: Fix reset GPIO check

Arnd Bergmann (2):
      ASoC: ops: dynamically allocate struct snd_ctl_elem_value
      ASoC: SDCA: fix HID dependency

Balamurugan C (3):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL match table
      ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for PTL.

Bard Liao (2):
      ASoC: sdw_utils: add component_name string to dai_info
      ASoC: sdw_utils: generate combined spk components string

Bram Vlerick (2):
      ASoC: tas571x: add support for tas5753
      ASoC: dt-bindings: tas57xx: add tas5753 compatibility

Brian Masney (6):
      ASoC: codecs: da7219: convert from round_rate() to determine_rate()
      ASoC: codecs: rt5682: convert from round_rate() to determine_rate()
      ASoC: codecs: rt5682s: convert from round_rate() to determine_rate()
      ASoC: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      ASoC: stm: stm32_i2s: convert from round_rate() to determine_rate()
      ASoC: stm: stm32_sai_sub: convert from round_rate() to determine_rate()

Cezary Rojewski (2):
      ASoC: codecs: rt5640: Drop dummy register names
      ASoC: Intel: avs: Add rt5640 machine board

Chancel Liu (1):
      ASoC: imx-card: Add WM8524 support

Charles Keepax (23):
      HID: core: Add bus define for SoundWire bus
      MAINTAINERS: Add SDCA maintainers entry
      ASoC: SDCA: Add missing default in switch in entity_pde_event()
      ASoC: SDCA: Fixup some kernel doc errors
      ASoC: SDCA: Minor selected/detected mode control fixups
      ASoC: SDCA: Add flag for unused IRQs
      ASoC: SDCA: Add some initial IRQ handlers
      ASoC: SDCA: Kconfig/Makefile fixups
      ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
      ASoC: SDCA: Fix off by one error in IRQ bound check
      ASoC: SDCA: Avoid use of uninitialised local name variable
      ASoC: SDCA: Update memory allocations to zero initialise
      ASoC: SDCA: Allow read-only controls to be deferrable
      ASoC: SDCA: Remove overly chatty input pin list warning
      ASoC: SDCA: Move SDCA search functions and export
      ASoC: soc-dai: Add private data to snd_soc_dai
      ASoC: SDCA: Add helper to add DAI constraints
      ASoC: SDCA: Add a helper to get the SoundWire port number
      ASoC: SDCA: Add hw_params() helper function
      ASoC: SDCA: Shrink detected_mode_handler() stack frame
      ASoC: SDCA: Fix implicit cast from le16
      ASoC: SDCA: Fix some holes in the regmap readable/writeable helpers
      ASoC: SDCA: Add support for -cn- value properties

Chen Ni (1):
      ASoC: tegra: AHUB: Remove unneeded semicolon

Chen-Yu Tsai (9):
      ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
      ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
      ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
      ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
      ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
      ASoC: mediatek: use reserved memory or enable buffer pre-allocation
      ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
      ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
      ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks

ChiYuan Huang (2):
      ASoC: dt-bindings: rt9123: Append RTQ9124 description
      ASoC: codecs: Add support for Richtek RTQ9124

Frank Li (1):
      ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to yaml format

Geert Uytterhoeven (2):
      ASoC: renesas: msiof: Convert to <linux/spi/sh_msiof.h>
      ASoC: img: Imagination Technologies sound should depend on MIPS

Jyri Sarha (3):
      ASoC: SOF: ipc4: Add sof_ipc4_pipeline_state_str() for debugging
      ASoC: SOF: ipc4-pcm: Pipe instances to dev_dbg in multi_pipeline_state()
      ASoC: SOF: ipc4-pcm: Harmonize sof_ipc4_set_pipeline_state() dbg print

Krzysztof Kozlowski (20):
      ASoC: codecs: Constify regmap configuration static variables
      ASoC: fsl: Constify reg_default array
      ASoC: codecs: wcd9335: Drop unused sido_input_src field
      ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
      ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
      ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
      ASoC: codecs: wcd938x: Drop unused variant field
      ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields
      ASoC: codecs: wcd937x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd938x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify return from devm_gpiod_get() error
      ASoC: dt-bindings: qcom,wcd939x: Document missing VDD_PX supply
      ASoC: codecs: wcd939x: Add VDD_PX supply
      ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier
      ASoC: codecs: wcd937x: Use simple defines for chipid register value
      ASoC: codecs: wcd938x: Use simple defines for chipid register value
      ASoC: codecs: wcd939x: Use simple defines for chipid register value
      ASoC: codecs: wcd939x: Add defines for major/minor version decoding
      ASoC: dt-bindings: qcom,lpass-va-macro: Define clock-names in top-level

Kuninori Morimoto (62):
      ASoC: soc-core: save ID if param was set in fmt_single_name()
      ASoC: remove component->id
      ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
      ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
      ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
      ASoC: ti: Standardize ASoC menu
      ASoC: adi: Standardize ASoC menu
      ASoC: amd: Standardize ASoC menu
      ASoC: bcm: Standardize ASoC menu
      ASoC: dwc: Standardize ASoC menu
      ASoC: fsl: Standardize ASoC menu
      ASoC: img: Standardize ASoC menu
      ASoC: mxs: Standardize ASoC menu
      ASoC: pxa: Standardize ASoC menu
      ASoC: sti: Standardize ASoC menu
      ASoC: stm: Standardize ASoC menu
      ASoC: sof: Standardize ASoC menu
      ASoC: au1x: Standardize ASoC menu
      ASoC: sdca: Standardize ASoC menu
      ASoC: sprd: Standardize ASoC menu
      ASoC: qcom: Standardize ASoC menu
      ASoC: meson: Standardize ASoC menu
      ASoC: apple: Standardize ASoC menu
      ASoC: atmel: Standardize ASoC menu
      ASoC: intel: Standardize ASoC menu
      ASoC: spear: Standardize ASoC menu
      ASoC: sunxi: Standardize ASoC menu
      ASoC: tegra: Standardize ASoC menu
      ASoC: ux500: Standardize ASoC menu
      ASoC: cirrus: Standardize ASoC menu
      ASoC: google: Standardize ASoC menu
      ASoC: jz4740: Standardize ASoC menu
      ASoC: xilinx: Standardize ASoC menu
      ASoC: xtensa: Standardize ASoC menu
      ASoC: renesas: Standardize ASoC menu
      ASoC: generic: Standardize ASoC menu
      ASoC: samsung: Standardize ASoC menu
      ASoC: kirkwood: Standardize ASoC menu
      ASoC: loongson: Standardize ASoC menu
      ASoC: mediatek: Standardize ASoC menu
      ASoC: rockchip: Standardize ASoC menu
      ASoC: starfive: Standardize ASoC menu
      ASoC: uniphier: Standardize ASoC menu
      ASoC: hisilicon: Standardize ASoC menu
      ASoC: soc-dapm: remove unnecessary definition
      ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() for snd_soc_dapm_free()
      ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
      ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
      ASoC: soc-dapm: reordering function definitions
      ASoC: soc-dapm: reordering header definitions
      ASoC: soc-dapm: use component instead of cmpnt
      ASoC: soc-dapm: use common name for dapm
      ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
      ASoC: soc-dapm: add prefix on dapm_xxx_event()
      ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs
      ASoC: rt700: don't set dapm->bias_level
      ASoC: rt715: don't set dapm->bias_level
      ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
      ASoC: samsung: bell: don't set dapm->bias_level directly
      ASoC: samsung: speyside: don't set dapm->bias_level directly
      ASoC: samsung: tobermory: don't set dapm->bias_level directly
      ASoC: samsung: littlemill: don't set dapm->bias_level directly

Laurentiu Mihalcea (1):
      ASoC: dt-bindings: cirrus,cs42xx8: add 'port' property

Luca Weiss (6):
      ASoC: qcom: sm8250: set card driver name from match data
      ASoC: qcom: sm8250: add DisplayPort Jack support
      ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible

Mac Chiang (2):
      ASoC: Intel: soc-acpi-intel-ptl-match: add support ptl-rt721-l0
      ASoC: Intel: soc-acpi-intel-lnl-match: add rt1320_l12_rt714_l0 support

Maciej Strozek (1):
      ASoC: SDCA: Generic interrupt support

Mark Brown (32):
      ASoC: codecs: wcd93xx: Few simplifications of code and
      ASoC: Intel: avs: Add rt5640 board support
      Use helper function for_each_child_of_node_scoped()
      ASoC: tas571x: add support for tas5753
      ASoC: remove component->id
      Cleanup in rockchip_sai.c
      ASoC: Add Richtek RTQ9124 support
      Add DisplayPort sound support for Fairphone 5
      ASoC: codecs: More const and unused member cleanups
      ASoC: mediatek: use reserved memory or enable
      ASoC: core/topology/Intel:
      ASoC: SOF: ipc4/Intel: Support for partial context
      ASoC: SOF: ipc4-pcm: Harmonize set pipeline state dbg
      ASoC: hdac_hdmi: Rate limit logging on connection and disconnection
      ASoC: codecs: wcd93xx: Drop enums for chipid values
      Add SoundWire machines for ACP7.0/ACP7.1 sof stack
      ASoC: Standardize ASoC menu
      ASoC: sdw_utils: generate combined spk components
      ASoC: Add SDCA IRQ support and some misc fixups
      Add sound card support for QCS8275
      treewide: Remove redundant
      ASoC: soc-dapm: cleanups
      ASoC: Intel: add support for new devices
      ASoC: don't set dapm->bias_level directly
      ASoC: set bias_level at if
      Update SDCA Kconfig
      ASoC: codec: Convert to GPIO descriptors for
      ASoC: convert from clk round_rate() to
      SDCA Bug Fixes
      Add SDCA DAI ops helpers
      More minor SDCA changes
      ASoC: fsl_xcvr: get channel status data in two cases

Pei Xiao (2):
      ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
      ASOC: rockchip: Use helper function devm_clk_get_enabled()

Peng Fan (4):
      ASoC: codec: rockchip_sai: Remove including of_gpio.h
      ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
      ASoC: codec: tlv320aic32x4: Sort headers alphabetically
      ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors

Peter Ujfalusi (13):
      ASoC: topology: Do not call snd_soc_remove_pcm_runtime() for ignored links
      ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
      ASoC: Intel: skl_hda_dsp_generic: Implement add_dai_link to filter HDMI PCMs
      ASoC: Intel: sof_sdw: Implement add_dai_link to filter HDMI PCMs
      ASoC: SOF: ipc4-priv: Add kernel doc for fw_context_save of sof_ipc4_fw_data
      ASoC: SOF: ipc4/Intel: Add support for library restore firmware functionality
      ASoC: SOF: ipc4-pcm: Look for best matching hw_config for SSP
      ASoC: SOF: pcm: Remove local create_page_table() wrapper function
      ASoC: SOF: topology: Parse the dapm_widget_tokens in case of DSPless mode
      ASoC: SOF: pcm: Reverse check for prepared stream in sof_pcm_hw_params()
      ASoC: SOF: Intel: hda: Do not probe Soundwire in nocodec mode
      ASoC: SOF: ipc4-pcm: Enable delay reporting for ChainDMA streams
      ASoC: sdw_utils: Add missed component_name strings for speaker amps

Prasad Kumpatla (2):
      ASoC: dt-bindings: qcom,sm8250: Add QCS8275 sound card
      ASoC: qcom: sc8280xp: Add support for QCS8275

Richard Fitzgerald (1):
      firmware: cs_dsp: Remove unused struct list_head from cs_dsp_coeff_ctl

Rob Herring (Arm) (1):
      ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"

Sachin Mokashi (1):
      ASoC: Intel: Replace deprecated strcpy() with strscpy()

Sakari Ailus (11):
      PM: runtime: Document return values of suspend-related API functions
      PM: runtime: Mark last busy stamp in pm_runtime_put_autosuspend()
      PM: runtime: Mark last busy stamp in pm_runtime_put_sync_autosuspend()
      PM: runtime: Mark last busy stamp in pm_runtime_autosuspend()
      PM: runtime: Mark last busy stamp in pm_request_autosuspend()
      Documentation: PM: *_autosuspend() functions update last busy time
      ASoC: atmel: Remove redundant pm_runtime_mark_last_busy() calls
      ASoC: codecs: Remove redundant pm_runtime_mark_last_busy() calls
      ASoC: Intel: Remove redundant pm_runtime_mark_last_busy() calls
      ASoC: component: Remove redundant pm_runtime_mark_last_busy() calls
      ASoC: SOF: Remove redundant pm_runtime_mark_last_busy() calls

Seppo Ingalsuo (1):
      ASoC: SOF: ipc4-topology: Add load of ASRC component

Shenghao Ding (2):
      ASoC: tas2781: Drop the unnecessary symbol imply
      ASoC: tas2781: Move the "include linux/debugfs.h" into tas2781.h

Shengjiu Wang (6):
      ASoC: wm8524: enable constraints when sysclk is configured.
      ASoC: fsl_mqs: Distinguish different modules by system manager indices
      ASoC: fsl_mqs: rename system manager indices for i.MX95
      ASoC: fsl-asoc-card: add sysclk_ratio for calculate sysclk frequency
      ASoC: fsl_xcvr: get channel status data when PHY is not exists
      ASoC: fsl_xcvr: get channel status data with firmware exists

Shuming Fan (3):
      ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report
      ASoC: SDCA: add a HID device for HIDE entity
      ASoC: SDCA: add route by the number of input pins in MU entity

Srinivas Kandagatla (1):
      ASoC: qcom: use drvdata instead of component to keep id

Stephen Rothwell (1):
      ASoC: SDCA: Check devm_mutex_init() return value

Terry Cheong (1):
      ASoC: hdmi-codec: use SND_JACK_AVOUT as jack status

Varshini Rajendran (1):
      ASoC: dt-bindings: atmel,at91-ssc: add microchip,sam9x7-ssc

Venkata Prasad Potturu (4):
      ASoC: amd: acp: Fix pointer assignments for snd_soc_acpi_mach structures
      ASoC: amd: acp: Add legacy driver support acp7.2 based platforms
      ASoC: amd: acp: Enable I2S support for acp7.2 based platforms
      ASoC: amd: acp: Enable acp7.2 platform based DMIC support in machine driver

Vijendar Mukunda (2):
      ASoC: amd: acp: add soundwire machine for ACP7.0 and ACP7.1 sof stack
      ASoC: SOF: amd: add alternate machines for ACP7.0 and ACP7.1 platforms

Weidong Wang (2):
      ASoC: codecs: Add calibration function to aw88399 chip
      ASoC: codecs: Add acpi_match_table for aw88399 driver

Xinxin Wan (1):
      ASoC: codecs: rt5640: Retry DEVICE_ID verification

 .../devicetree/bindings/sound/atmel,at91-ssc.yaml  |   11 +-
 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |    4 +
 .../bindings/sound/fsl,mxs-audio-sgtl5000.yaml     |   81 ++
 .../bindings/sound/mediatek,mt8173-afe-pcm.yaml    |   98 ++
 .../devicetree/bindings/sound/mt8186-afe-pcm.yaml  |    5 +
 .../devicetree/bindings/sound/mt8192-afe-pcm.yaml  |    5 +
 .../devicetree/bindings/sound/mtk-afe-pcm.txt      |   45 -
 .../bindings/sound/mxs-audio-sgtl5000.txt          |   42 -
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   28 +-
 .../devicetree/bindings/sound/qcom,q6afe.yaml      |   13 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    2 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |    3 +
 .../devicetree/bindings/sound/richtek,rt9123.yaml  |    9 +-
 .../devicetree/bindings/sound/ti,tas57xx.yaml      |    2 +
 Documentation/power/runtime_pm.rst                 |   50 +-
 MAINTAINERS                                        |   11 +
 arch/mips/configs/generic/board-marduk.config      |    1 -
 drivers/firmware/cirrus/cs_dsp.c                   |   45 +-
 drivers/hid/hid-core.c                             |    3 +
 include/linux/firmware/cirrus/cs_dsp.h             |    2 -
 include/linux/firmware/imx/sm.h                    |   20 +-
 include/linux/pm_runtime.h                         |  187 +++-
 include/sound/sdca_asoc.h                          |   19 +
 include/sound/sdca_function.h                      |   85 +-
 include/sound/sdca_hid.h                           |   25 +
 include/sound/sdca_interrupts.h                    |   78 ++
 include/sound/soc-component.h                      |    1 -
 include/sound/soc-dai.h                            |    3 +
 include/sound/soc-dapm.h                           |  236 +++--
 include/sound/soc_sdw_utils.h                      |    1 +
 include/sound/sof/ipc4/header.h                    |    2 +
 include/sound/tas2781.h                            |    4 +
 include/sound/tlv320aic32x4.h                      |    9 -
 include/uapi/linux/input.h                         |    1 +
 sound/soc/Kconfig                                  |    8 +-
 sound/soc/adi/Kconfig                              |    9 +-
 sound/soc/amd/Kconfig                              |    3 +
 sound/soc/amd/acp/Kconfig                          |    1 +
 sound/soc/amd/acp/acp-i2s.c                        |    3 +
 sound/soc/amd/acp/acp-legacy-common.c              |    2 +
 sound/soc/amd/acp/acp-mach-common.c                |    1 +
 sound/soc/amd/acp/acp-pci.c                        |    9 +-
 sound/soc/amd/acp/acp-platform.c                   |    2 +
 sound/soc/amd/acp/acp70.c                          |    1 +
 sound/soc/amd/acp/acp_common.h                     |    1 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c           |   12 +
 sound/soc/amd/acp/amd-acpi-mach.c                  |    4 +-
 sound/soc/amd/acp/amd.h                            |    8 +-
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/apple/Kconfig                            |    4 +
 sound/soc/atmel/Kconfig                            |   11 +-
 sound/soc/atmel/mchp-spdifrx.c                     |    6 -
 sound/soc/au1x/Kconfig                             |    4 +
 sound/soc/bcm/Kconfig                              |    4 +
 sound/soc/cirrus/Kconfig                           |    3 +
 sound/soc/codecs/Kconfig                           |   12 +-
 sound/soc/codecs/Makefile                          |    4 +-
 sound/soc/codecs/arizona-jack.c                    |    2 -
 sound/soc/codecs/aw88395/aw88395_device.h          |   21 +
 sound/soc/codecs/aw88399.c                         |  449 ++++++++-
 sound/soc/codecs/aw88399.h                         |   34 +
 sound/soc/codecs/cros_ec_codec.c                   |   30 +-
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs35l41.c                         |    2 -
 sound/soc/codecs/cs35l45.c                         |    1 -
 sound/soc/codecs/cs35l56-sdw.c                     |    1 -
 sound/soc/codecs/cs35l56.c                         |    1 -
 sound/soc/codecs/cs42l42.c                         |    1 -
 sound/soc/codecs/cs42l43-jack.c                    |    5 -
 sound/soc/codecs/cs42l43.c                         |    2 -
 sound/soc/codecs/cs48l32.c                         |    1 -
 sound/soc/codecs/da7218.c                          |    2 +-
 sound/soc/codecs/da7219.c                          |   68 +-
 sound/soc/codecs/es8375.c                          |    2 +-
 sound/soc/codecs/hda.c                             |    3 -
 sound/soc/codecs/hdac_hdmi.c                       |  307 +-----
 sound/soc/codecs/hdac_hdmi.h                       |   10 -
 sound/soc/codecs/hdmi-codec.c                      |    6 +-
 sound/soc/codecs/lpass-rx-macro.c                  |    1 -
 sound/soc/codecs/lpass-tx-macro.c                  |    1 -
 sound/soc/codecs/lpass-va-macro.c                  |    1 -
 sound/soc/codecs/lpass-wsa-macro.c                 |    1 -
 sound/soc/codecs/max98363.c                        |    3 +-
 sound/soc/codecs/max98373-i2c.c                    |    2 +-
 sound/soc/codecs/max98373-sdw.c                    |    3 +-
 sound/soc/codecs/max98388.c                        |    2 +-
 sound/soc/codecs/max98390.c                        |    2 +-
 sound/soc/codecs/max98396.c                        |    4 +-
 sound/soc/codecs/max98504.c                        |    2 +-
 sound/soc/codecs/max98520.c                        |    2 +-
 sound/soc/codecs/max98927.c                        |    2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    1 -
 sound/soc/codecs/rt1308-sdw.c                      |    1 -
 sound/soc/codecs/rt1316-sdw.c                      |    1 -
 sound/soc/codecs/rt1318-sdw.c                      |    1 -
 sound/soc/codecs/rt1320-sdw.c                      |    1 -
 sound/soc/codecs/rt5640.c                          |   43 +-
 sound/soc/codecs/rt5640.h                          |    6 +-
 sound/soc/codecs/rt5682-sdw.c                      |    1 -
 sound/soc/codecs/rt5682.c                          |   26 +-
 sound/soc/codecs/rt5682s.c                         |   26 +-
 sound/soc/codecs/rt700.c                           |    4 +-
 sound/soc/codecs/rt711-sdca.c                      |    2 -
 sound/soc/codecs/rt711.c                           |    2 -
 sound/soc/codecs/rt712-sdca-dmic.c                 |    1 -
 sound/soc/codecs/rt712-sdca.c                      |    2 -
 sound/soc/codecs/rt715-sdca.c                      |    1 -
 sound/soc/codecs/rt715.c                           |    3 +-
 sound/soc/codecs/rt721-sdca.c                      |    2 -
 sound/soc/codecs/rt722-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/rt722-sdca.c                      |    2 -
 sound/soc/codecs/rt9123.c                          |    3 -
 sound/soc/codecs/rtq9124.c                         |  543 +++++++++++
 sound/soc/codecs/tas2552.c                         |    1 -
 sound/soc/codecs/tas2781-i2c.c                     |    3 -
 sound/soc/codecs/tas571x.c                         |   52 +
 sound/soc/codecs/tlv320aic32x4.c                   |   53 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     |    2 -
 sound/soc/codecs/wcd9335.c                         |    5 -
 sound/soc/codecs/wcd934x.c                         |    4 -
 sound/soc/codecs/wcd937x.c                         |   38 +-
 sound/soc/codecs/wcd937x.h                         |    1 -
 sound/soc/codecs/wcd938x.c                         |   64 +-
 sound/soc/codecs/wcd939x.c                         |   69 +-
 sound/soc/codecs/wm8524.c                          |   55 +-
 sound/soc/codecs/wsa881x.c                         |    5 +-
 sound/soc/codecs/wsa883x.c                         |    3 +-
 sound/soc/codecs/wsa884x.c                         |    3 +-
 sound/soc/dwc/Kconfig                              |    3 +
 sound/soc/fsl/Kconfig                              |    2 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   13 +-
 sound/soc/fsl/fsl_asrc.c                           |    2 +-
 sound/soc/fsl/fsl_mqs.c                            |   11 +-
 sound/soc/fsl/fsl_sai.c                            |    4 +-
 sound/soc/fsl/fsl_xcvr.c                           |   25 +-
 sound/soc/fsl/imx-card.c                           |   53 +-
 sound/soc/generic/Kconfig                          |    4 +
 sound/soc/google/Kconfig                           |    3 +
 sound/soc/hisilicon/Kconfig                        |    4 +
 sound/soc/img/Kconfig                              |   14 +-
 sound/soc/intel/Kconfig                            |    4 +
 sound/soc/intel/atom/sst/sst_pvt.c                 |    1 -
 sound/soc/intel/avs/board_selection.c              |   27 +
 sound/soc/intel/avs/boards/Kconfig                 |   12 +
 sound/soc/intel/avs/boards/Makefile                |    2 +
 sound/soc/intel/avs/boards/rt5640.c                |  270 ++++++
 sound/soc/intel/avs/core.c                         |    1 -
 sound/soc/intel/avs/debugfs.c                      |    2 -
 sound/soc/intel/avs/ipc.c                          |    1 -
 sound/soc/intel/avs/pcm.c                          |    1 -
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    3 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |   13 +
 sound/soc/intel/boards/sof_es8336.c                |   10 +
 sound/soc/intel/boards/sof_rt5682.c                |    7 +
 sound/soc/intel/boards/sof_sdw.c                   |   14 +
 sound/soc/intel/catpt/pcm.c                        |    6 -
 sound/soc/intel/catpt/sysfs.c                      |    1 -
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   34 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |   57 ++
 sound/soc/jz4740/Kconfig                           |    4 +
 sound/soc/kirkwood/Kconfig                         |    3 +
 sound/soc/loongson/Kconfig                         |    2 +-
 sound/soc/mediatek/Kconfig                         |    4 +
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |    4 +-
 sound/soc/mediatek/common/mtk-base-afe.h           |    1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   66 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   56 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |    7 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    4 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |    7 +
 sound/soc/meson/Kconfig                            |    2 +-
 sound/soc/meson/axg-card.c                         |    3 +-
 sound/soc/meson/meson-card-utils.c                 |   16 +-
 sound/soc/mxs/Kconfig                              |    2 +-
 sound/soc/pxa/Kconfig                              |    4 +
 sound/soc/qcom/Kconfig                             |    2 +-
 sound/soc/qcom/lpass-platform.c                    |   27 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |    8 +-
 sound/soc/qcom/sc8280xp.c                          |    1 +
 sound/soc/qcom/sm8250.c                            |   28 +-
 sound/soc/renesas/Kconfig                          |    2 +-
 sound/soc/renesas/rcar/core.c                      |   35 +-
 sound/soc/renesas/rcar/ctu.c                       |    8 +-
 sound/soc/renesas/rcar/dma.c                       |    4 +-
 sound/soc/renesas/rcar/dvc.c                       |    8 +-
 sound/soc/renesas/rcar/mix.c                       |    8 +-
 sound/soc/renesas/rcar/msiof.c                     |   94 +-
 sound/soc/renesas/rcar/src.c                       |   10 +-
 sound/soc/renesas/rcar/ssi.c                       |   18 +-
 sound/soc/renesas/rcar/ssiu.c                      |    7 +-
 sound/soc/rockchip/Kconfig                         |   23 +-
 sound/soc/rockchip/rockchip_sai.c                  |   52 +-
 sound/soc/samsung/Kconfig                          |    2 +-
 sound/soc/samsung/bells.c                          |    2 -
 sound/soc/samsung/littlemill.c                     |    2 -
 sound/soc/samsung/speyside.c                       |    2 -
 sound/soc/samsung/tobermory.c                      |    2 -
 sound/soc/sdca/Kconfig                             |   20 +
 sound/soc/sdca/Makefile                            |    6 +-
 sound/soc/sdca/sdca_asoc.c                         |  469 +++++++--
 sound/soc/sdca/sdca_functions.c                    |  264 ++++-
 sound/soc/sdca/sdca_hid.c                          |  127 +++
 sound/soc/sdca/sdca_interrupts.c                   |  444 +++++++++
 sound/soc/sdca/sdca_regmap.c                       |   29 +-
 sound/soc/sdw_utils/soc_sdw_cs_amp.c               |   10 -
 sound/soc/sdw_utils/soc_sdw_maxim.c                |    9 -
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |    6 -
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c           |    7 -
 sound/soc/sdw_utils/soc_sdw_utils.c                |   38 +
 sound/soc/soc-component.c                          |    1 -
 sound/soc/soc-core.c                               |   25 +-
 sound/soc/soc-dai.c                                |   16 +-
 sound/soc/soc-dapm.c                               | 1018 +++++++++-----------
 sound/soc/soc-ops-test.c                           |   29 +-
 sound/soc/soc-ops.c                                |   26 +-
 sound/soc/soc-topology.c                           |    7 +-
 sound/soc/sof/Kconfig                              |    2 +-
 sound/soc/sof/amd/pci-acp70.c                      |    1 +
 sound/soc/sof/control.c                            |    1 -
 sound/soc/sof/debug.c                              |    1 -
 sound/soc/sof/imx/imx-common.c                     |   36 +-
 sound/soc/sof/intel/hda-loader.c                   |    7 +-
 sound/soc/sof/intel/hda.c                          |    5 +
 sound/soc/sof/ipc3-dtrace.c                        |    1 -
 sound/soc/sof/ipc4-loader.c                        |    7 +-
 sound/soc/sof/ipc4-pcm.c                           |  137 ++-
 sound/soc/sof/ipc4-priv.h                          |    6 +
 sound/soc/sof/ipc4-topology.c                      |   94 +-
 sound/soc/sof/ipc4-topology.h                      |   25 +
 sound/soc/sof/ipc4.c                               |   39 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |   11 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |   11 +-
 sound/soc/sof/pcm.c                                |   27 +-
 sound/soc/sof/sof-client-ipc-flood-test.c          |    1 -
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |    1 -
 sound/soc/sof/sof-client-ipc-msg-injector.c        |    1 -
 sound/soc/sof/sof-client-probes.c                  |    3 -
 sound/soc/sof/topology.c                           |   15 +-
 sound/soc/spear/Kconfig                            |    4 +
 sound/soc/sprd/Kconfig                             |    4 +
 sound/soc/starfive/Kconfig                         |   12 +-
 sound/soc/sti/Kconfig                              |    2 +-
 sound/soc/stm/Kconfig                              |    2 +-
 sound/soc/stm/stm32_i2s.c                          |   21 +-
 sound/soc/stm/stm32_sai_sub.c                      |   14 +-
 sound/soc/sunxi/Kconfig                            |    2 +-
 sound/soc/tegra/Kconfig                            |    4 +
 sound/soc/tegra/tegra210_ahub.c                    |    2 +-
 sound/soc/ti/Kconfig                               |    2 +-
 sound/soc/uniphier/Kconfig                         |   14 +-
 sound/soc/ux500/Kconfig                            |    2 +-
 sound/soc/xilinx/Kconfig                           |    4 +
 sound/soc/xtensa/Kconfig                           |    4 +
 253 files changed, 5171 insertions(+), 2291 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
 create mode 100644 include/sound/sdca_hid.h
 create mode 100644 include/sound/sdca_interrupts.h
 delete mode 100644 sound/soc/codecs/hdac_hdmi.h
 create mode 100644 sound/soc/codecs/rtq9124.c
 create mode 100644 sound/soc/intel/avs/boards/rt5640.c
 create mode 100644 sound/soc/sdca/sdca_hid.c
 create mode 100644 sound/soc/sdca/sdca_interrupts.c
