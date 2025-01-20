Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB6A16EFD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 16:05:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71BD36022B;
	Mon, 20 Jan 2025 16:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71BD36022B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737385539;
	bh=InxLJIzxA4tX/a0aInTD8VDB7tZ3PA86wBbaHlxSR6k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HfpLmi/Tm+aBkjplcgToZZvyVUovFaSM2iv6hLMkLkkrKmfvoYOVaT3vvhEhKSwsg
	 yVmGRLghD6b8wc341DlnFvZDqd+VB2OgOkZAyFTjOmePXNZaqoknDwcKcoEVH1SmJm
	 fU+0g/JbKzGj+VInnUSxWRK/LhXvWFujVk1Tfbes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C770BF805B1; Mon, 20 Jan 2025 16:05:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC10F805B1;
	Mon, 20 Jan 2025 16:05:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1645BF80482; Mon, 20 Jan 2025 16:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CED59F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 16:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED59F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S0zDpwSf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7308D5C5958;
	Mon, 20 Jan 2025 15:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BBCC4CEDD;
	Mon, 20 Jan 2025 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737385457;
	bh=InxLJIzxA4tX/a0aInTD8VDB7tZ3PA86wBbaHlxSR6k=;
	h=From:To:Cc:Subject:Date:From;
	b=S0zDpwSfpbzVTDhOpsaI0nR9SNx9tWiTNya5AwUbdmmuvabQ9qc8Lnqo2R04AIrr7
	 UPU0BqqKwWNWzucwj6xcCzlHBhSsx8uZPriP2wub+Ke/K7Avz4TEbmB18BL31CFmjg
	 4KYW5JhNpqwc9bR8anRU/USjlkSH26R2Zb4q+Ztfn6rOy8DqbBrNyTSUy/S0SVqiIs
	 HAcCy1w878PC/S7toRzBFRl3aOJj60Qkb0FZYJsMXynm3ZEvyHGIpqGmJNAULgf9G0
	 9haJKUhsKQwwdexx9MdiTyCgMlW+Xo7Hj2H/xWDvXVjcnH3NSYBKir9Ox/+FYBEqCP
	 BCaUMCF8pJ90g==
Message-ID: <ed5e9273a349fd6ad9cb6edc0223ace5.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.14
Date: Mon, 20 Jan 2025 15:04:04 +0000
Message-ID-Hash: QOYCVJN2UA6EKMTMHREOBXV4P4PY6AKR
X-Message-ID-Hash: QOYCVJN2UA6EKMTMHREOBXV4P4PY6AKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOYCVJN2UA6EKMTMHREOBXV4P4PY6AKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.14

for you to fetch changes up to fee89ddd76e45841a2b01d87b481bc02483f4572:

  ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled() (2025-01-16 15:20:41 +0000)

----------------------------------------------------------------
ASoC: Updates for v6.14

This was quite a quiet release for what I imagine are holiday related
reasons, the diffstat is dominated by some Cirrus Logic Kunit tests.
There's the usual mix of small improvements and fixes, plus a few new
drivers and features.  The diffstat includes some DRM changes due to
work on HDMI audio.

 - Allow clocking on each DAI in an audio graph card to be configured
   separately.
 - Improved power management for Renesas RZ-SSI.
 - KUnit testing for the Cirrus DSP framework.
 - Memory to meory operation support for Freescale/NXP platforms.
 - Support for pause operations in SOF.
 - Support for Allwinner suinv F1C100s, Awinc AW88083, Realtek
   ALC5682I-VE

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: qcom: sdm845: add handling of secondary MI2S clock

Amadeusz Sławiński (4):
      ASoC: Intel: avs: Fix init-config parsing
      ASoC: Intel: avs: Print IPC error messages in lower layer
      ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW
      ASoC: Intel: avs: Update ASRC definition

Andrew Davis (21):
      ASoC: ad193x: Remove use of i2c_match_id()
      ASoC: adau1761: Remove use of i2c_match_id()
      ASoC: adau1781: Remove use of i2c_match_id()
      ASoC: adau1977: Remove use of i2c_match_id()
      ASoC: alc5623: Remove use of i2c_match_id()
      ASoC: alc5632: Remove use of i2c_match_id()
      ASoC: max98088: Remove use of i2c_match_id()
      ASoC: max98090: Remove use of i2c_match_id()
      ASoC: max98095: Remove use of i2c_match_id()
      ASoC: pcm186x: Remove use of i2c_match_id()
      ASoc: pcm6240: Remove use of i2c_match_id()
      ASoC: ssm2602: Remove use of i2c_match_id()
      ASoC: tas2562: Remove use of i2c_match_id()
      ASoC: tas2781: Remove use of i2c_match_id()
      ASoC: tas5720: Remove use of i2c_match_id()
      ASoC: tlv320adc3xxx: Remove use of i2c_match_id()
      ASoC: tlv320aic31xx: Remove use of i2c_match_id()
      ASoC: tlv320aic3x: Remove use of i2c_match_id()
      ASoC: tpa6130a2: Remove use of i2c_match_id()
      ASoC: wm8904: Remove use of i2c_match_id()
      ASoC: wm8985: Remove use of i2c_match_id()

Andy Shevchenko (1):
      ASoc: mediatek: mt8365: Don't use "proxy" headers

Arnd Bergmann (1):
      firmware: cs_dsp: avoid large local variables

Bard Liao (7):
      ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
      ASoC: Intel: sof_sdw: correct mach_params->dmic_num
      ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
      ASoC: Intel: sof_sdw: improve the log of DAI link numbers
      ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
      ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13 support
      ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support

Bence Csókás (1):
      ASoC: sun4i-codec: Use new devm clk and reset APIs

Cezary Rojewski (9):
      ASoC: Intel: avs: Do not readq() u32 registers
      ASoC: Intel: avs: Fix the minimum firmware version numbers
      ASoC: Intel: avs: Fix theoretical infinite loop
      ASoC: Intel: avs: Update hda component teardown sequences
      ASoC: Intel: avs: Clearly state assumptions of hw_params()
      ASoC: Intel: avs: Improve logging of firmware loading
      ASoC: Intel: avs: Adjust DSP status register names
      ASoC: Intel: avs: Adjust IPC traces
      ASoC: Intel: avs: Add missing includes

Chancel Liu (4):
      ASoC: fsl_utils: Add function to constrain rates
      ASoC: fsl_micfil: Switch to common sample rate constraint function
      ASoC: fsl_xcvr: Add sample rate constraint
      ASoC: fsl_sai: Add sample rate constraint

Charles Keepax (5):
      ASoC: SDCA: Add missing header includes
      ASoC: SDCA: Clean up error messages
      ASoC: SDCA: Add bounds check for function address
      ASoC: SDCA: Add missing function type names
      ASoC: SDCA: Split function type patching and function naming

Christophe JAILLET (1):
      ASoC: cs42l51: Constify struct i2c_device_id

Claudiu Beznea (16):
      ASoC: renesas: rz-ssi: Terminate all the DMA transactions
      ASoC: renesas: rz-ssi: Use only the proper amount of dividers
      ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
      ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
      ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
      ASoC: renesas: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
      ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
      ASoC: renesas: rz-ssi: Use temporary variable for struct device
      ASoC: renesas: rz-ssi: Use goto label names that specify their actions
      ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
      ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
      ASoC: renesas: rz-ssi: Add runtime PM support
      ASoC: renesas: rz-ssi: Issue software reset in hw_params API
      ASoC: renesas: rz-ssi: Add suspend to RAM support
      ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
      ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC

Colin Ian King (1):
      ASoC: soc-core: remove redundant assignment to variable ret

Csókás Bence (1):
      ASoC: dt-bindings: Add Allwinner suniv F1C100s Audio Codec

Dan Carpenter (1):
      ASoC: renesas: rz-ssi: Add a check for negative sample_space

Derek Fang (1):
      ASoC: rt5682: Support the ALC5682I-VE codec

Dheeraj Reddy Jonnalagadda (1):
      ASoC: rockchip: i2s-tdm: Fix a useless call issue

Dr. David Alan Gilbert (1):
      ASoC: rt715: Remove unused hda_to_sdw

George Lander (1):
      ASoC: sun4i-spdif: Add clock multiplier settings

Krzysztof Kozlowski (3):
      ASoC: codecs: wcd9335: Add define for number of DAIs
      ASoC: dt-bindings: qcom,wcd9335: Drop number of DAIs from the header
      ASoC: dt-bindings: Correct indentation and style in DTS example

Kuninori Morimoto (18):
      ASoC: simple-card-utils: use __free(device_node) for device node
      ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
      ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()
      ASoC: soc-core: tidyup ret handling for card->disable_route_checks
      ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
      ASoC: simple-card-utils: Unify clock direction by clk_direction
      ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
      ASoC: soc-card: remove card check
      ASoC: intel: remove disable_route_checks
      ASoC: remove disable_route_checks
      ASoC: audio-graph-card2: use __free(device_node) for device node
      ASoC: audio-graph-card: use __free(device_node) for device node
      ASoC: simple-card: use __free(device_node) for device node
      ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
      ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
      ASoC: soc-core: Enable to use extra format on each DAI
      ASoC: audio-graph-card2: Use extra format on each DAI
      ASoC: soc-dapm: remove !card check from snd_soc_dapm_set_bias_level()

Marcus Cooper (2):
      ASoC: sun4i-spdif: Always set the valid data to be the MSB
      ASoC: sun4i-spdif: Add working 24bit audio support

Mark Brown (23):
      ASoC: fsl_xcvr: Add suspend and resume support
      ASoC: Correct *-objs usages
      Add support for codec of F1C100s
      ASoC: Splitting cs35l56 SoundWire DAI into separate
      ASoC: Merge up origin to resolve interaction with manline symbol changes
      ASoC: Merge up v6.12-rc2
      ASoC: Intel: boards: updates for 6.14
      ASoC: sun4i-spdif: Add 24bit support
      Add function to constrain rates
      ASoC: simple-card-utils: tidyup for Multi connection
      Add audio support for the Renesas RZ/G3S SoC
      ASoC: SOF: core/Intel: Handle pause supported token
      firmware: cirrus: Add KUnit tests for cs_dsp
      ASoC: fsl: add memory to memory function for ASRC
      ASoC: Intel: Add matches for Cirrus Logic CDB35L56
      Minor debugging improvements
      ASoC: codecs: Add aw88083 amplifier driver
      ASoC: Merge up v6.13-rc6
      ASoC: Intel: avs: Fixes and cleanups
      ASoC: remove disable_route_checks
      ASoC: fsl: Support MQS on i.MX943
      ASoC: extra format on each DAI
      ASoC: fsl: Support micfil on i.MX943

Martin Blumenstingl (2):
      ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
      ASoC: dapm: add support for preparing streams

Mesih Kilinc (2):
      ASoC: sun4i-codec: Add DMA Max Burst field
      ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s

Michal Simek (1):
      ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled()

Neil Armstrong (1):
      ASoC: dt-bindings: convert rt5682.txt to dt-schema

Nícolas F. R. A. Prado (2):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add compatible for mt8390 evk
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow DL_SRC/UL_SRC dai-links

Peter Ujfalusi (4):
      ASoC: SOF: Add support for pause supported tokens from topology
      ASoC: SOF: Intel: hda-pcm: Follow the pause_supported flag to drop PAUSE support
      ASoC: SOF: ipc4-topology: Use macro to set the EXT_PARAM_SIZE in widget setup
      ASoC: SOF: sof-priv: Remove unused SOF_DAI_STREAM() and SOF_FORMATS

Richard Fitzgerald (21):
      ASoC: cs35l56: Split SoundWire DAI into separate playback and capture
      ASoC: sdw_utils: cs_amp: Assign non-overlapping TDM masks for each codec on a bus
      firmware: cs_dsp: Add mock regmap for KUnit testing
      firmware: cs_dsp: Add mock DSP memory map for KUnit testing
      firmware: cs_dsp: Add mock wmfw file generator for KUnit testing
      firmware: cs_dsp: Add mock bin file generator for KUnit testing
      firmware: cs_dsp: Add KUnit testing of bin file download
      firmware: cs_dsp: Add KUnit testing of wmfw download
      firmware: cs_dsp: Add KUnit testing of control parsing
      firmware: cs_dsp: Add KUnit testing of control cache
      firmware: cs_dsp: Add KUnit testing of control read/write
      firmware: cs_dsp: Add KUnit testing of bin error cases
      firmware: cs_dsp: Add KUnit testing of wmfw error cases
      firmware: cs_dsp: Add KUnit testing of client callbacks
      ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
      ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
      ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without CS42L43
      firmware: cs_dsp: Fix kerneldoc typos in cs_dsp_mock_bin.c
      firmware: cs_dsp: Avoid using a u32 as a __be32 in cs_dsp_mock_mem_maps.c
      firmware: cs_dsp: Fix endianness conversion in cs_dsp_mock_wmfw.c
      firmware: cs_dsp: Delete redundant assignments in cs_dsp_test_bin.c

Rob Herring (Arm) (2):
      ASoC: Use of_property_present() for non-boolean properties
      ASoC: simple-card: Drop unnecessary "dai-tdm-slot-width-map" property presence check

Shengjiu Wang (13):
      ASoC: fsl_xcvr: Use regmap for PHY and PLL registers
      ASoC: fsl_xcvr: Add suspend and resume support
      ALSA: compress: Add output rate and output format support
      ASoC: fsl_asrc: define functions for memory to memory usage
      ASoC: fsl_easrc: define functions for memory to memory usage
      ASoC: fsl_asrc_m2m: Add memory to memory function
      ASoC: fsl_asrc: register m2m platform device
      ASoC: fsl_easrc: register m2m platform device
      ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
      ASoC: fsl_mqs: Add i.MX943 platform support
      ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
      ASoC: fsl_micfil: Add i.MX943 platform support
      ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943 platform

Simon Trimmer (4):
      ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
      ASoC: Intel: sof_sdw: Add a dev_dbg message for the SOC_SDW_CODEC_MIC quirk
      ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
      ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops

Stephen Gordon (2):
      ASoC: simple_card: Improve debugging messages
      ASoC: simple_card: Show if link is unidirectional

Takashi Iwai (5):
      ASoC: cs40l50: Use *-y for Makefile
      ASoC: mediatek: mt8365: Use *-y for Makefile
      ASoC: SDCA: Use *-y for Makefile
      ASoC: cs42l84: Use *-y for Makefile
      ASoC: wcd937x: Use *-y for Makefile

Tang Bin (2):
      ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with local dev variable
      ASoC: tas2781: Fix redundant logical jump

Thorsten Blum (4):
      ASoC: SOF: Intel: Use str_yes_no() helper in atom_dump()
      ASoC: madera: Use str_enabled_disabled() helper function
      ASoC: SOF: Intel: Use str_yes_no() to improve bdw_dump()
      ASoC: codecs: Use ARRAY_SIZE() to calculate PEB2466_TLV_SIZE

Uwe Kleine-König (1):
      ASoC: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Vijendar Mukunda (2):
      ASoC: amd: ps: update mach params subsystem_rev variable
      ASoC: amd: ps: add ZSC control register programming sequence

Weidong Wang (2):
      ASoC: dt-bindings: Add schema for "awinic,aw88083"
      ASoC: codecs: Add aw88083 amplifier driver

Wolfram Sang (1):
      ASoC: cs42l43: don't include '<linux/find.h>' directly

Yu-Chun Lin (1):
      ASoC: amd: Add ACPI dependency to fix build error

 .../devicetree/bindings/sound/adi,ssm2518.yaml     |   20 +-
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml  |   31 +
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |    2 +
 .../devicetree/bindings/sound/everest,es71x4.yaml  |   10 +-
 .../devicetree/bindings/sound/everest,es7241.yaml  |   19 +-
 .../devicetree/bindings/sound/fsl,easrc.yaml       |   32 +-
 .../devicetree/bindings/sound/fsl,micfil.yaml      |    1 +
 .../devicetree/bindings/sound/fsl,mqs.yaml         |    2 +
 .../devicetree/bindings/sound/fsl,xcvr.yaml        |   34 +-
 .../bindings/sound/intel,keembay-i2s.yaml          |   32 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   16 +-
 .../bindings/sound/neofidelity,ntp8918.yaml        |   26 +-
 .../devicetree/bindings/sound/realtek,rt5682.yaml  |  156 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |    6 -
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   19 +-
 Documentation/devicetree/bindings/sound/rt5682.txt |   98 -
 .../devicetree/bindings/sound/ti,pcm6240.yaml      |   32 +-
 .../devicetree/bindings/sound/ti,tas2562.yaml      |   30 +-
 .../devicetree/bindings/sound/ti,tas2770.yaml      |   34 +-
 .../devicetree/bindings/sound/ti,tas2781.yaml      |   38 +-
 .../devicetree/bindings/sound/ti,tas27xx.yaml      |   34 +-
 .../devicetree/bindings/sound/ti,tas57xx.yaml      |   36 +-
 MAINTAINERS                                        |    4 +-
 drivers/firmware/cirrus/Kconfig                    |   20 +
 drivers/firmware/cirrus/Makefile                   |    2 +
 drivers/firmware/cirrus/test/Makefile              |   23 +
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     |  199 ++
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |  752 +++++
 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c  |  367 +++
 drivers/firmware/cirrus/test/cs_dsp_mock_utils.c   |   13 +
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |  473 +++
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     | 2556 +++++++++++++++
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |  600 ++++
 .../firmware/cirrus/test/cs_dsp_test_callbacks.c   |  688 ++++
 .../cirrus/test/cs_dsp_test_control_cache.c        | 3282 ++++++++++++++++++++
 .../cirrus/test/cs_dsp_test_control_parse.c        | 1851 +++++++++++
 .../firmware/cirrus/test/cs_dsp_test_control_rw.c  | 2669 ++++++++++++++++
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    | 2211 +++++++++++++
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  | 1347 ++++++++
 drivers/firmware/cirrus/test/cs_dsp_tests.c        |   14 +
 include/dt-bindings/sound/qcom,wcd9335.h           |    1 -
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |  160 +
 include/sound/sdca.h                               |    7 +-
 include/sound/sdca_function.h                      |    3 +
 include/sound/simple_card_utils.h                  |    8 +-
 include/sound/soc-dai.h                            |    3 +
 include/sound/soc.h                                |   12 +-
 include/sound/soc_sdw_utils.h                      |    2 +
 include/uapi/sound/compress_params.h               |   23 +-
 include/uapi/sound/sof/tokens.h                    |    2 +
 sound/soc/amd/Kconfig                              |    2 +-
 sound/soc/amd/ps/pci-ps.c                          |   16 +-
 sound/soc/codecs/Kconfig                           |    2 +-
 sound/soc/codecs/Makefile                          |    8 +-
 sound/soc/codecs/ad193x-i2c.c                      |    3 +-
 sound/soc/codecs/adau1761-i2c.c                    |    5 +-
 sound/soc/codecs/adau1781-i2c.c                    |    5 +-
 sound/soc/codecs/adau1977-i2c.c                    |    5 +-
 sound/soc/codecs/alc5623.c                         |   10 +-
 sound/soc/codecs/alc5632.c                         |    6 +-
 sound/soc/codecs/aw88081.c                         |  333 +-
 sound/soc/codecs/aw88081.h                         |   43 +
 sound/soc/codecs/cs35l56.c                         |    8 +-
 sound/soc/codecs/cs42l43.c                         |    2 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    6 +-
 sound/soc/codecs/cs42l84.c                         |    2 +-
 sound/soc/codecs/es8323.c                          |    2 +-
 sound/soc/codecs/madera.c                          |    7 +-
 sound/soc/codecs/max98088.c                        |    4 +-
 sound/soc/codecs/max98090.c                        |   18 +-
 sound/soc/codecs/max98095.c                        |    4 +-
 sound/soc/codecs/ntp8835.c                         |    2 +-
 sound/soc/codecs/ntp8918.c                         |    2 +-
 sound/soc/codecs/pcm186x-i2c.c                     |    3 +-
 sound/soc/codecs/pcm6240.c                         |    3 +-
 sound/soc/codecs/peb2466.c                         |    3 +-
 sound/soc/codecs/rt5682-i2c.c                      |    6 +
 sound/soc/codecs/rt5682.c                          |   12 +-
 sound/soc/codecs/rt5682.h                          |    2 +
 sound/soc/codecs/rt715-sdw.c                       |   41 -
 sound/soc/codecs/rt715.h                           |    3 -
 sound/soc/codecs/sma1307.c                         |    4 +-
 sound/soc/codecs/ssm2602-i2c.c                     |    5 +-
 sound/soc/codecs/tas2562.c                         |    4 +-
 sound/soc/codecs/tas2781-i2c.c                     |   71 +-
 sound/soc/codecs/tas5720.c                         |   10 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    4 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    6 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    3 +-
 sound/soc/codecs/tpa6130a2.c                       |    4 +-
 sound/soc/codecs/uda1342.c                         |    2 +-
 sound/soc/codecs/wcd9335.c                         |    2 +
 sound/soc/codecs/wm8904.c                          |   13 +-
 sound/soc/codecs/wm8985.c                          |    4 +-
 sound/soc/fsl/Kconfig                              |    2 +
 sound/soc/fsl/Makefile                             |    2 +-
 sound/soc/fsl/fsl-asoc-card.c                      |    2 +-
 sound/soc/fsl/fsl_asrc.c                           |  179 +-
 sound/soc/fsl/fsl_asrc.h                           |    2 +
 sound/soc/fsl/fsl_asrc_common.h                    |   70 +
 sound/soc/fsl/fsl_asrc_m2m.c                       |  727 +++++
 sound/soc/fsl/fsl_easrc.c                          |  261 +-
 sound/soc/fsl/fsl_easrc.h                          |    4 +
 sound/soc/fsl/fsl_micfil.c                         |  131 +-
 sound/soc/fsl/fsl_micfil.h                         |    2 +-
 sound/soc/fsl/fsl_mqs.c                            |   28 +
 sound/soc/fsl/fsl_sai.c                            |    7 +-
 sound/soc/fsl/fsl_sai.h                            |    3 +
 sound/soc/fsl/fsl_utils.c                          |   45 +
 sound/soc/fsl/fsl_utils.h                          |    5 +
 sound/soc/fsl/fsl_xcvr.c                           |  404 ++-
 sound/soc/fsl/fsl_xcvr.h                           |   13 +
 sound/soc/fsl/imx-audmux.c                         |    2 +-
 sound/soc/fsl/imx-card.c                           |    2 +-
 sound/soc/fsl/imx-rpmsg.c                          |    2 +-
 sound/soc/generic/audio-graph-card.c               |   48 +-
 sound/soc/generic/audio-graph-card2.c              |  262 +-
 sound/soc/generic/simple-card-utils.c              |   79 +-
 sound/soc/generic/simple-card.c                    |   58 +-
 sound/soc/intel/avs/apl.c                          |    2 +-
 sound/soc/intel/avs/core.c                         |   24 +-
 sound/soc/intel/avs/debugfs.c                      |    1 +
 sound/soc/intel/avs/ipc.c                          |   25 +-
 sound/soc/intel/avs/loader.c                       |   36 +-
 sound/soc/intel/avs/messages.c                     |   22 +-
 sound/soc/intel/avs/messages.h                     |    3 +-
 sound/soc/intel/avs/pcm.c                          |    5 +-
 sound/soc/intel/avs/registers.h                    |    2 +-
 sound/soc/intel/avs/topology.c                     |    4 +-
 sound/soc/intel/avs/trace.h                        |   38 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    2 -
 sound/soc/intel/boards/sof_sdw.c                   |   33 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   45 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   70 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  289 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  148 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |  194 ++
 sound/soc/intel/keembay/kmb_platform.c             |    2 +-
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |    4 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |   19 +-
 sound/soc/mediatek/mt8365/Makefile                 |    2 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |   11 +-
 sound/soc/qcom/common.c                            |    6 +-
 sound/soc/qcom/sc7180.c                            |    2 +-
 sound/soc/qcom/sdm845.c                            |    5 +-
 sound/soc/renesas/rz-ssi.c                         |  228 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |   28 -
 sound/soc/sdca/Makefile                            |    2 +-
 sound/soc/sdca/sdca_device.c                       |    2 +
 sound/soc/sdca/sdca_functions.c                    |  132 +-
 sound/soc/sdw_utils/soc_sdw_cs_amp.c               |   46 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   13 +-
 sound/soc/soc-card.c                               |    4 +-
 sound/soc/soc-core.c                               |   58 +-
 sound/soc/soc-dai.c                                |   27 +-
 sound/soc/soc-dapm.c                               |   14 +-
 sound/soc/soc-pcm.c                                |   32 +-
 sound/soc/soc-topology.c                           |   10 +-
 sound/soc/sof/intel/atom.c                         |   16 +-
 sound/soc/sof/intel/bdw.c                          |   16 +-
 sound/soc/sof/intel/hda-dai.c                      |   12 +
 sound/soc/sof/intel/hda-pcm.c                      |   15 +
 sound/soc/sof/intel/hda.c                          |    5 +
 sound/soc/sof/ipc4-topology.c                      |    2 +-
 sound/soc/sof/sof-audio.h                          |    1 +
 sound/soc/sof/sof-priv.h                           |    8 -
 sound/soc/sof/topology.c                           |    4 +
 sound/soc/sunxi/sun4i-codec.c                      |  409 ++-
 sound/soc/sunxi/sun4i-spdif.c                      |   24 +-
 sound/soc/xilinx/xlnx_spdif.c                      |   38 +-
 170 files changed, 21739 insertions(+), 1441 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5682.txt
 create mode 100644 drivers/firmware/cirrus/test/Makefile
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_utils.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_bin.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_tests.c
 create mode 100644 include/linux/firmware/cirrus/cs_dsp_test_utils.h
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
