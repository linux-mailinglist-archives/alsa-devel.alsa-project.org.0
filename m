Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268964E26AC
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 13:36:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB0D1713;
	Mon, 21 Mar 2022 13:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB0D1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647866202;
	bh=4aPbCzSvirFhNxUBen2bVzSiFDxITWERfbNwQC6qKUc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NVLJF6P6oonzT8p6scHICidHdxwhAvCv9+qzwu6Kab9Idtegnj1eFyWVWlPqZi4Vv
	 Or0ppQe6hAIThyIpu1mu4yxPw9QvfthKGe7wygKGoVF4KLLXq0VJUidvEa+aqLb7SX
	 I9qc1ODtk7EaxWhc74CG1Vg8I+xU25nLi+33V7Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE04F80238;
	Mon, 21 Mar 2022 13:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239D7F80227; Mon, 21 Mar 2022 13:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A538F800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 13:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A538F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ryuW52kG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56E0F60BC3;
 Mon, 21 Mar 2022 12:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF63C340E8;
 Mon, 21 Mar 2022 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647866123;
 bh=4aPbCzSvirFhNxUBen2bVzSiFDxITWERfbNwQC6qKUc=;
 h=From:To:Cc:Subject:Date:From;
 b=ryuW52kGrheE9cAL4rzq+RB0xF9vyMNnHbhMmUWtXBWGLC/hVlt5Fn/zSjmhfY7HD
 WlZXNU4iPUepYETO0JeqNZ5LgehMdiqpeSn51sJ9V4PZh8FQ/FaPAq/1JjvSU3NE5S
 W+67ePUL8TxL+ypmXA2dxDiCzkO3thTyzakow+/N2S456thyGKkWhKazspThVbVRuS
 jJyjezTGouhXtnRD6eaEY41OtApPL25oYt8AoHLsNJgXex+feVDwDDZyV1G839kv/y
 MkTv2rEL/0IYExJuG3/iabkh1AyycAGtbF7c4Da89CACAMfY0IU5sPtRHcOKB+xNto
 jqPKZv92RYfcw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.18
Date: Mon, 21 Mar 2022 12:35:04 +0000
Message-Id: <20220321123523.0CF63C340E8@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.18

for you to fetch changes up to 49a24e9d9c740d3bd8b1200f225f67d45e3d68a5:

  Make the SOF control, PCM and PM code IPC agnostic (2022-03-18 20:11:08 +0000)

----------------------------------------------------------------
ASoC: Updates for v5.18

Quite a quiet release for ASoC, lots of work on drivers and platforms
but nothing too groundbreaking but not much on the core itself:

 - Start of moving SoF to support multiple IPC mechanisms.
 - Use of NHLT ACPI table to reduce the amount of quirking required for
   Intel systems.
 - Some building blocks for use in forthcoming Intel AVS driver for
   legacy Intel DSP firmwares.
 - Support for AMD PDM, Atmel PDMC, Awinic AW8738, i.MX cards with
   TLV320AIC31xx, Intel machines with CS35L41 and ESSX8336, Mediatek
   MT8181 wideband bluetooth, nVidia Tegra234, Qualcomm SC7280, Renesas
   RZ/V2L, Texas Instruments TAS585M

----------------------------------------------------------------
Ahmad Fatoum (2):
      ASoC: fsl_sai: simplify register poking in fsl_sai_set_bclk
      ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support

Ajit Kumar Pandey (13):
      ASoC: amd: acp: Add generic support for PDM controller on ACP
      ASoC: amd: acp: Add PDM controller based dmic dai for Renoir
      ASoC: amd: acp: Add generic PCI driver module for ACP device
      ASoC: amd: acp: Add ACP init()/deinit() callback for Renoir.
      ASoC: amd: acp: acp-legacy: Add DMIC dai link support for Renoir
      ASoC: amd: renoir: Add check for acp configuration flags
      ASoC: amd: acp: Change card name for Guybrush Machine
      ASoC: amd: acp-legacy: Add legacy card support for new machines
      ASoC: amd: acp: Add DMIC machine driver ops
      ASoC: SOF: amd: Flush cache after ATU_BASE_ADDR_GRP register update
      ASoC: SOF: amd: Use semaphore register to synchronize ipc's irq
      ASoC: SOF: amd: Move group register configuration to acp-loader
      ASoC: SOF: amd: Increase ACP_HW_SEM_RETRY_COUNT value

Ajye Huang (2):
      ASoC: Intel: sof_rt5682: Add support for platform without amplifier
      ASoC: SOF: Intel: Add topology overwrite for Felwinter

Alviro Iskandar Setiawan (1):
      ASoC: atmel: mchp-pdmc: Fix `-Wpointer-bool-conversion` warning

Amadeusz Sławiński (3):
      ASoC: topology: Remove superfluous error prints
      ASoC: topology: Allow TLV control to be either read or write
      ASoC: topology: Optimize soc_tplg_dapm_graph_elems_load behavior

Anthony I Gilea (1):
      ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"

Ariel D'Alessandro (6):
      ASoC: bindings: fsl-asoc-card: Add mclk-id optional property
      ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
      ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
      ASoC: Rename tlv320aic31xx-micbias.h as tlv320aic31xx.h
      ASoC: tlv320aic31xx: Define PLL clock inputs
      ASoC: bindings: fsl-asoc-card: Add compatible for tlv320aic31xx codec

Bard Liao (2):
      ASoC: SOF: Intel: match sdw version on link_slaves_found
      ASoC: SOF: Intel: Compare sdw adr directly

Brent Lu (5):
      ASoC: Intel: boards: create sof-realtek-common module
      ASoC: Intel: sof_rt1308: move rt1308 code to common module
      ASoC: Intel: cirrus-common: support cs35l41 amplifier
      ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier
      ASoC: SOF: Intel: add topology overwrite for Taniks

Brian Norris (2):
      drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
      ASoC: rk3399_gru_sound: Wire up DP jack detection

Cezary Rojewski (17):
      ALSA: hda: Add helper macros for DSP capable devices
      ASoC: Export DAI register and widget ctor and dctor functions
      ASoC: Intel: Introduce AVS driver
      ASoC: Intel: avs: Inter process communication
      ASoC: Intel: avs: Add code loading requests
      ASoC: Intel: avs: Add pipeline management requests
      ASoC: Intel: avs: Add module management requests
      ASoC: Intel: avs: Add power management requests
      ASoC: Intel: avs: Add ROM requests
      ASoC: Intel: avs: Add basefw runtime-parameter requests
      ASoC: Intel: avs: Firmware resources management utilities
      ASoC: Intel: avs: Declare module configuration types
      ASoC: Intel: avs: Dynamic firmware resources management
      ASoC: Intel: avs: General code loading flow
      ASoC: Intel: avs: Implement CLDMA transfer
      ASoC: Intel: avs: Code loading over CLDMA
      ASoC: Intel: avs: Code loading over HDA

Charles Keepax (3):
      ASoC: wm8962: Allow switching between analog and digital inputs
      ASoC: madera: Add dependencies on MFD
      ASoC: wm_adsp: Make compressed buffers optional

Claudiu Beznea (1):
      ASoC: mchp-spdifrx: fix typo

Codrin Ciubotariu (4):
      ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
      ASoC: dt-bindings: Document Microchip's PDMC
      ASoC: atmel: mchp-pdmc: add PDMC driver
      ASoC: atmel: mchp-pdmc: print the correct property name

Colin Ian King (3):
      ASoC: tegra20: spdif: make const array rates static
      ASoC: atmel: mchp-pdmc: Fix spelling mistake "microchopnes" -> "microphones"
      ASoC: ti: Fix spelling mistake "cant" -> "can't"

Curtis Malainey (1):
      ASoC: SOF: fix 32 signed bit overflow

Dan Carpenter (5):
      ASoC: qcom: Fix error code in lpass_platform_copy()
      ASoC: amd: acp: Fix signedness bug in renoir_audio_probe()
      ASoC: amd: pcm-dma: Fix signedness bug in acp_pdm_audio_probe()
      ASoC: amd: pcm-dma: Fix signedness bug in acp3x_audio_probe()
      ASoC: amd: vg: fix signedness bug in acp5x_audio_probe()

Daniel Baluta (3):
      ASoC: SOF: compr: Add compress ops implementation
      ASoC: SOF: compr: Mark snd_compress_ops static
      ASoC: SOF: pcm: Add compress_ops for SOF platform component driver

Daniel Beer (2):
      ASoC: add support for TAS5805M digital amplifier
      ASoC: dt-bindings: add bindings for TI TAS5805M.

Derek Fang (1):
      ASoC: rt5682s: Stabilize the combo jack detection

Gongjun Song (1):
      ASoC: SOF: Intel: pci-tgl: add RPL-S support

Jayesh Choudhary (1):
      ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema

Jia-Ju Bai (2):
      ASoC: rt5663: check the return value of devm_kzalloc() in rt5663_parse_dp()
      ASoC: acp: check the return value of devm_kzalloc() in acp_legacy_dai_links_create()

Jiapeng Chong (3):
      ASoC: SOF: amd: Remove unneeded semicolon
      ASoC: SOF: amd: Remove unneeded semicolon
      ASoC: atmel: mchp-pdmc: Remove unnecessary print function dev_err()

Jiasheng Jiang (9):
      ASoC: codecs: Check for error pointer after calling devm_regmap_init_mmio
      ASoC: ti: davinci-i2s: Add check for clk_enable()
      ASoC: mxs-saif: Handle errors for clk_enable
      ASoC: atmel_ssc_dai: Handle errors for clk_enable
      ASoC: dwc-i2s: Handle errors for clk_enable
      ASoC: soc-compress: prevent the potentially use of null pointer
      ASoC: wm8350: Handle error for wm8350_register_irq
      ASoC: fsi: Add check for clk_enable
      ASoC: soc-compress: Change the check for codec_dai

Jiaxin Yu (2):
      ASoC: bt-sco: fix bt-sco-pcm-wb dai widget don't connect to the endpoint
      ASoC: mediatek: mt8183: support wb bt audio

Jonathan Albrieux (1):
      ASoC: codecs: Add Awinic AW8738 audio amplifier driver

Julia Lawall (1):
      ASoC: Intel: bytcr_wm5102: use GFP_KERNEL

Kai Vehmanen (1):
      ASoC: SOF: Intel: enable DMI L1 for playback streams

Keyon Jie (4):
      ASoC: SOF: add _D3_PERSISTENT flag to fw_ready message
      ASoC: SOF: Intel: hda-loader: add SSP helper
      ASoC: SOF: Intel: hda-loader: add IMR restore support
      ASoC: SOF: add flag to disable IMR restore to sof_debug

Krzysztof Kozlowski (6):
      ASoC: dt-bindings: samsung,aries-wm8994: require sound-dai property
      ASoC: dt-bindings: samsung,arndale: convert to dtschema
      ASoC: dt-bindings: samsung,arndale: document ALC5631
      ASoC: dt-bindings: samsung,smdk5250: convert to dtschema
      ASoC: dt-bindings: samsung,snow: convert to dtschema
      ASoC: dt-bindings: samsung,tm2: convert to dtschema

Lad Prabhakar (8):
      ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
      ASoC: sh: rz-ssi: Make the data structures available before registering the handlers
      ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
      ASoC: sh: rz-ssi: Make return type of rz_ssi_stream_is_valid() to bool
      ASoC: sh: rz-ssi: Use a do-while loop in rz_ssi_pio_recv()
      ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
      ASoC: sh: rz-ssi: Remove duplicate macros
      ASoC: dt-bindings: renesas,rz-ssi: Document RZ/V2L SoC

Lianjie Zhang (1):
      ASoC: Intel: catpt: use asoc_substream_to_rtd()

Libin Yang (1):
      ASoC: Intel: soc-acpi: add entries in ADL match table

Lucas Tanure (2):
      ASoC: cs35l41: Fix max number of TX channels
      ASoC: cs35l41: Remove unnecessary param

Mac Chiang (1):
      ASoC: Intel: sof_rt5682: add 512FS MCLK clock configuration

Mark Brown (83):
      Merge existing fixes from asoc/for-5.17 into new branch
      ASoC: topology: Fixes
      ASoC: SOF: Intel: don't download firmware at each resume
      ASoC: Xilinx fixes
      ASoC: sh: rz-ssi: Code cleanup and fixes
      ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
      ASoC: SOF: Intel: improve SoundWire _ADR handling
      ASOC: cs42l42: Add support for system suspend
      ASoC: add support for TAS5805M digital amplifier
      ASoC: Intel: sof_rt5682: add two derivative options
      Tegra234 APE support
      (Re)enable DP/HDMI audio for RK3399 Gru
      SoC: SOF: ipc: Optimizations for tx message
      ASOC: amd: acp: Add generic PDM and PCI driver support for ACP
      ASoC: samsung: Explicitly include gpiolib header
      ASoC: sun4i-i2s: Support for Allwinner R329 and D1 SoCs
      ASoC: dmic: Remove spurious gpiolib select
      ASoC: rt9120: Remove spurious gpiolib select
      ASoC: simple-amplifier: Remove spurious gpiolib select
      ASoC: max9759: Remove spurious gpiolib select
      ASoC: zl38060: Remove spurious gpiolib select
      ASoC: simple-mux: Depend on gpiolib rather than selecting it
      ASoC: Fix gpiolib dependencies
      ASoC: SOF: dma-trace: Change trace_init() ops parameter list
      Machine driver to support LPASS SC7280 sound card registration
      ASoC: dt-bindings: samsung: convert to dtschema
      ASoC: SOF: IPC client infrastructure
      ASoC: wm8731: Delete empty remove() function
      ASoC: pcm3168a: code cleanup
      ASoC: Add Euro Headset support for wcd938x codec
      ASoC: sc7280: Really depends on SOUNDWIRE
      Add support for audio on SC7280 based targets
      ASoC: codecs: add pm runtime support for Qualcomm codecs
      ASoC: lm49453: Use modern ASoC DAI format terminology
      ASoC: tscs42xx: Use modern ASoC DAI format terminology
      ASoC: tscs454: Use modern ASoC DAI format terminology
      ASoC: sti-sas: Use modern ASoC DAI format terminology
      ASoC: si476x: Use modern ASoC DAI format terminology
      ASoC: uda1380: Use modern ASoC DAI format terminology
      ASoC: uda1334: Use modern ASoC DAI format terminology
      ASoC: twl4030: Use modern ASoC DAI format terminology
      ASoC: es7134: Use modern ASoC DAI format terminology
      ASoC: wl1273: Use modern ASoC DAI format terminology
      ASoC: es8316: Use modern ASoC DAI format terminology
      ASoC: inno_rk3036: Use modern ASoC DAI format terminology
      ASoC: es8328: Use modern ASoC DAI format terminology
      ASoC: isabelle: Use modern ASoC DAI format terminology
      ASoC: mc13783: Use modern ASoC DAI format terminology
      ASoC: pcm3060: Use modern ASoC DAI format terminology
      ASoC: pcm1681: Use modern ASoC DAI format terminology
      ASoC: pcm186x: Use modern ASoC DAI format terminology
      ASoC: pcm3168a: Use modern ASoC DAI format terminology
      ASoC: pcm512x: Use modern ASoC DAI format terminology
      ASoC: ml26124: Use modern ASoC DAI format terminology
      ASoC: uda134x: Use modern ASoC DAI format terminology
      ASoC: max98088: Use modern ASoC DAI format terminology
      ASoC: max98095: Use modern ASoC DAI format terminology
      ASoC: max98371: Use modern ASoC DAI format terminology
      ASoC: max98390: Use modern ASoC DAI format terminology
      ASoC: max9850: Use modern ASoC DAI format terminology
      ASoC: max9860: Use modern ASoC DAI format terminology
      ASoC: max9867: Use modern ASoC DAI format terminology
      ASoC: max98925: Use modern ASoC DAI format terminology
      ASoC: max98926: Use modern ASoC DAI format terminology
      ASoC: max98927: Use modern ASoC DAI format terminology
      ASoC: es7241: Use modern ASoC DAI format terminology
      ASoC: Add power domains support for digital macro codecs
      ASoC: Intel: machine driver updates for 5.18
      ASoC: codecs: Add Awinic AW8738 audio amplifier driver
      ASoC: audio_graph_card2: Support variable slot widths
      ASoC: Intel: boards: cleanups for 5.18
      ASoC: SOF: updates for 5.18
      ASoC: fsl_sai: Cleanups and 1:1 bclk:mclk ratio support
      Add driver for SAMA7G5's PDMC
      Clean ups and preparation for IPC abstraction in the SOF driver
      ALSA/ASoC/SOF/Intel: improve support for ES8336-based platforms
      Clean ups and preparation for IPC abstraction in the SOF driver
      ASoC: Intel: AVS - Audio DSP for cAVS
      ASoC: mediatek: Add mt8195 reset control support
      ASoC: SOF/Intel: small fixes and updates for 5.18
      Make the SOF pcm_hw_params DSP op IPC agnostic
      Introduce IPC abstraction for SOF topology parsing
      Make the SOF control, PCM and PM code IPC agnostic

Mauro Carvalho Chehab (1):
      ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021

Meng Tang (4):
      ASoC: amd: Use platform_get_irq_byname() to get the interrupt
      ASoC: amd: pcm-dma: Use platform_get_irq() to get the interrupt
      ASoC: hdac_hda: Avoid unexpected match when pcm_name is "Analog"
      ASoC: amd: Fix reference to PCM buffer address

Miaoqian Lin (13):
      ASoC: atmel: Add missing of_node_put() in at91sam9g20ek_audio_probe
      ASoC: atmel: Fix error handling in snd_proto_probe
      ASoC: rockchip: i2s: Fix missing clk_disable_unprepare() in rockchip_i2s_probe
      ASoC: SOF: Add missing of_node_put() in imx8m_probe
      ASoC: mediatek: mt8192-mt6359: Fix error handling in mt8192_mt6359_dev_probe
      ASoC: rk817: Fix missing clk_disable_unprepare() in rk817_platform_probe
      ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
      ASoC: msm8916-wcd-digital: Fix missing clk_disable_unprepare() in msm8916_wcd_digital_probe
      ASoC: atmel: Fix error handling in sam9x5_wm8731_driver_probe
      ASoC: mediatek: Fix error handling in mt8183_da7219_max98357_dev_probe
      ASoC: msm8916-wcd-analog: Fix error handling in pm8916_wcd_analog_spmi_probe
      ASoC: mediatek: mt8195: Fix error handling in mt8195_mt6359_rt1019_rt5682_dev_probe
      ASoC: codecs: wcd934x: Add missing of_node_put() in wcd934x_codec_parse_data

Minghao Chi (3):
      ASoC: codecs: remove redundant ret variable
      ASoC: samsung: remove unneeded ret variable
      ASoC: ak4642: Use of_device_get_match_data()

Mohan Kumar (1):
      ASoC: tegra: Update AHUB driver for Tegra234

Muralidhar Reddy (1):
      ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw in ADL match table

Nicolin Chen (1):
      MAINTAINERS: Add Shengjiu to maintainer list of sound/soc/fsl

Nikita Yushchenko (4):
      ASoC: pcm3168a: cleanup unintuitive mask usage
      ASoC: pcm3168a: refactor hw_params routine
      ASoC: pcm3168a: refactor format handling
      ASoC: pcm3168a: remove numeric PCM3168A_NUM_SUPPLIES

Nikolai Kostrigin (1):
      ASoC: Intel: soc-acpi: add ESSX8336 support on Cannon Lake machines

Oder Chiou (1):
      ASoC: rt5640: Remove the sysclk and sysclk_src checking

Peter Ujfalusi (31):
      ASoC: SOF: trace: Simplify count adjustment in trace_read
      ASoC: SOF: Intel: cnl: Use pm_gate->hdr.cmd in cnl_compact_ipc_compress()
      ASoC: SOF: ipc: Drop header parameter from sof_ipc_tx_message_unlocked()
      ASoC: SOF: ipc: Do not allocate buffer for msg_data
      ASoC: SOF: intel: hda-trace: Pass the dma buffer pointer to hda_dsp_trace_prepare
      ASoC: SOF: dma-trace: Pass pointer to params_ext struct in trace_init()
      ASoC: SOF: Drop unused DSP power states: D3_HOT and D3_COLD
      ASoC: SOF: Move the definition of enum sof_dsp_power_states to global header
      ASoC: SOF: ipc: Read and pass the whole message to handlers for IPC events
      ASoC: SOF: Split up utils.c into sof-utils and iomem-utils
      ASoC: SOF: Introduce IPC SOF client support
      ASoC: SOF: sof-client: Add support for clients not managed by pm framework
      ASoC: SOF: Convert the generic IPC message injector into SOF client
      ASoC: SOF: Convert the generic probe support to SOF client
      ASoC: SOF: Makefile: Fix randconfig sof-client build when SND_SOC_SOF=y
      ASoC: SOF: Declare sof_compress_ops in sof-priv.h
      ASoC: SOF: sof-priv: Drop duplicate sof_compressed_ops declaration
      ASoC: SOF: amd: acp-pcm: Take buffer information directly from runtime
      ASoC: SOF: amd: Do not set ipc_pcm_params ops as it is optional
      ASoC: SOF: ipc-msg-injector: Use devm_kzalloc() for the rx_buffer
      ASoC: SOF: trace: Use proper DMA direction for the trace data buffer
      ASoC: SOF: sof-priv: Remove stale snd_sof_ipc_stream_pcm_params() declaration
      ASoC: SOF: Make pcm_hw_params snd_sof_dsp_ops callback IPC neutral
      ASoC: SOF: pcm: Remove sof_pcm_dsp_params() wrapper
      ASoC: SOF: Introduce optional callback to configure stream data offset
      ASoC: SOF: Mark snd_sof_dsp_ops.ipc_pcm_params() callback optional
      ASoC: SOF: stream-ipc: Add sof_set_stream_data_offset()
      ASoC: SOF: Intel: hda-ipc: Add hda_set_stream_data_offset()
      ASoC: SOF: Intel: Convert to use the generic set_stream_data_offset ops
      ASoC: SOF: imx: Convert to use the generic set_stream_data_offset ops
      ASoC: SOF: Remove ipc_pcm_params() ops

Pierre-Louis Bossart (30):
      ASoC: SOF: Intel: use inclusive language for SSP clocks
      ASoC: SOF: Intel: hdac_ext_stream: consistent prefixes for variables/members
      ASoC: SOF: core: unregister clients and machine drivers in .shutdown
      ASoC: soc-acpi: remove sof_fw_filename
      ASoC: Intel: boards: fix spelling in comments
      ASoC: SOF: debug: clarify operator precedence
      ASoC: SOF: Intel: hda: clarify operator precedence
      ASoC: Intel: boards: remove explicit dependency on GPIOLIB when DMIC is used"
      ASoC: Intel: boards: add GPIOLIB dependency where missed
      ASoC: SOF: sof-audio: removed unused function
      ASoC: soc-acpi: fix kernel-doc descriptor
      ASoC: soc-acpi: add information on I2S/TDM link mask
      ASoC: SOF: Intel: hda: retrieve DMIC number for I2S boards
      ALSA: intel-nhlt: add helper to detect SSP link mask
      ASoC: SOF: Intel: hda: report SSP link mask to machine driver
      ASoC: Intel: soc-acpi: quirk topology filename dynamically
      ALSA: intel-dsp-config: add more ACPI HIDs for ES83x6 devices
      ASoC: Intel: soc-acpi: add more ACPI HIDs for ES83x6 devices
      ALSA: intel-dspconfig: add ES8336 support for CNL
      ASoC: Intel: sof_es8336: make gpio optional
      ASoC: Intel: sof_es8336: get codec device with ACPI instead of bus search
      ASoC: Intel: Revert "ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021"
      ASoC: Intel: sof_es8336: use NHLT information to set dmic and SSP
      ASoC: Intel: sof_es8336: log all quirks
      ASoC: Intel: sof_es8336: move comment to the right place
      ASoC: Intel: sof_es8336: add support for JD inverted quirk
      ASoC: Intel: sof_es8336: extend machine driver to support ES8326 codec
      ASoC: Intel: sof_es8336: add cfg-dmics component for UCM support
      ASoC: Intel: bytcht_es8316: move comment to the right place
      ASoC: Intel: boards: fix randconfig issue

Rander Wang (1):
      ASoC: SOF: move definition of snd_sof_ipc to header file

Randy Dunlap (1):
      ASoC: max98927: add missing header file

Ranjani Sridharan (55):
      ASoC: SOF: Intel: hda: Remove link assignment limitation
      ASoC: SOF: Convert the generic IPC flood test into SOF client
      ASoC: SOF: remove snd_sof_pipeline_find()
      ASoC: SOF: simplify snd_sof_device_remove()
      ASoC: SOF: set swidget's core for scheduler widget
      ASoC: SOF: topology: remove redundant code
      ASoC: SOF: topology: remove redundant code in sof_link_afe_load()
      ASoC: SOF: topology: Drop the size parameter from struct sof_topology_token
      ASoC: SOF: topology: Modify the get_token op for string tokens
      ASoC: SOF: topology: expose some get_token ops
      ASoC: SOF: change comp_dai to a pointer in struct snd_sof_dai
      ASoC: SOF: make struct snd_sof_widget IPC agnostic
      ASoC: SOF: topology: make sof_route_load() IPC agnostic
      ASoC: SOF: Add a tuples array to struct snd_sof_widget
      ASoC: SOF: topology: Modify signature for token parsing functions
      ASoC: SOF: topology: Rename arguments in sof_parse_token_sets()
      ASoC: SOF: topology: Rename arguments in sof_parse_tokens()
      ASoC: SOF: make struct snd_sof_dai IPC agnostic
      ASoC: SOF: Introduce struct snd_sof_dai_link
      ASoC: SOF: IPC: Introduce IPC ops
      ASoC: SOF: topology: Add helper function for processing tuple arrays
      ASoC: SOF: Introduce IPC3 ops
      ASoC: SOF: topology: Make scheduler widget parsing IPC agnostic
      ASoC: SOF: topology: Make buffer widget parsing IPC agnostic
      ASoC: SOF: topology: Make pga widget parsing IPC agnostic
      ASoC: SOF: topology: Make mixer widget parsing IPC agnostic
      ASoC: SOF: topology: Make mux/demux widget parsing IPC agnostic
      ASoC: SOF: topology: Make src widget parsing IPC agnostic
      ASoC: SOF: topology: Make asrc widget parsing IPC agnostic
      ASoC: SOF: topology: Make siggen widget parsing IPC agnostic
      ASoC: SOF: topology: Make effect widget parsing IPC agnostic
      ASoC: SOF: topology: Make route setup IPC agnostic
      ASoC: SOF: topology: Make DAI widget parsing IPC agnostic
      ASoC: SOF: topology: Make control parsing IPC agnostic
      ASoC: SOF: topology: Make widget binding IPC agnostic
      ASoC: SOF: topology: remove snd_sof_complete_pipeline()
      ASoC: SOF: set up scheduler widget before all other widgets in the pipeline
      ASoC: SOF: Make sof_widget_setup/free IPC agnostic
      ASoC: SOF: Make sof_suspend/resume IPC agnostic
      ASoC: SOF: Introduce IPC ops for kcontrol IO
      ASoC: SOF: Add IPC3 topology control ops
      ASoC: SOF: Add volume_get/put IPC3 ops
      ASoC: SOF: Add switch get/put IPC3 ops
      ASoC: SOF: Add enum_get/put control ops for IPC3
      ASoC: SOF: Add bytes_get/put control IPC ops for IPC3
      ASoC: SOF: Add bytes_ext control IPC ops for IPC3
      ASoC: SOF: Introduce IPC-specific PCM ops
      ASoC: SOF: pcm: expose the sof_pcm_setup_connected_widgets() function
      ASoC: SOF: Introduce IPC3 PCM hw_free op
      ASoC: SOF: Define hw_params PCM op for IPC3
      ASoC: SOF: Add trigger PCM op for IPC3
      ASoC: SOF: Add dai_link_fixup PCM op for IPC3
      ASoC: SOF: expose sof_route_setup()
      ASoC: SOF: topology: Add ops for setting up and tearing down pipelines
      ASoC: SOF: Add a new dai_get_clk topology IPC op

Ricard Wanderlof (1):
      ASoC: tlv320adc3xxx: Add IIR filter configuration

Richard Fitzgerald (6):
      ASoC: cs42l42: Report full jack status when plug is detected
      ASoC: cs42l42: Change jack_detect_mutex to a lock of all IRQ handling
      ASoC: cs42l42: Handle system suspend
      ASoC: dt-bindings: audio-graph-port: Add dai-tdm-slot-width-map
      ASoC: audio_graph_card2: Add support for variable slot widths
      ASoC: cs42l42: Add warnings about DETECT_MODE and PLL_START

Rob Herring (2):
      ASoC: dt-bindings: realtek,rt5682s: Drop Tegra specifics from example
      ASoC: dt-bindings: Fix patternProperties with fixed strings

Robert Hancock (6):
      ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
      ASoC: xilinx: xlnx_i2s: create drvdata structure
      ASoC: xilinx: xlnx_i2s: Handle sysclk setting
      ASoC: simple-card-utils: Set sysclk on all components
      ASoC: dt-bindings: simple-card: document new system-clock-fixed flag
      ASoC: simple-card-utils: Add new system-clock-fixed flag

Sameer Pujar (2):
      ASoC: Document Tegra234 APE support
      ASoC: simple-card-utils: Don't reset clock of active DAI

Samuel Holland (3):
      ASoC: dt-bindings: sun4i-i2s: Add compatibles for R329 and D1
      ASoC: sun4i-i2s: Update registers for more channels
      ASoC: sun4i-i2s: Add support for the R329/D1 variant

Sascha Hauer (8):
      ASoC: fsl_sai: Enable combine mode soft
      ASoC: fsl: Drop unused argument from imx_pcm_dma_init()
      ASoC: soc-generic-dmaengine-pcm: set period_bytes_min based on maxburst
      ASoC: fsl_sai: Drop unnecessary defines
      ASoC: fsl_sai: simplify irq return value
      ASoC: fsl_sai: store full version instead of major/minor
      ASoC: fsl_sai: Use better variable names
      ASoC: fsl_sai: use DIV_ROUND_CLOSEST() to calculate divider

Shengjiu Wang (5):
      ASoC: soc-generic-dmaengine-pcm: separate max_buffer_size assignment
      ASoC: soc-core: skip zero num_dai component in searching dai name
      ASoC: fsl_rpmsg: Remove SET_SYSTEM_SLEEP_PM_OPS callback
      ASoC: fsl_spdif: Disable TX clock when stop
      ASoC: fsl_spdif: Add new registers included on i.MX8ULP

Shuming Fan (1):
      ASoC: rt1308-sdw: get calibration params after power on

Simon Trimmer (1):
      ASoC: wm_adsp: Expand firmware loading search options

Srinivas Kandagatla (18):
      ASoC: codecs: va-macro: move to individual clks from bulk
      ASoC: codecs: rx-macro: move clk provider to managed variants
      ASoC: codecs: tx-macro: move clk provider to managed variants
      ASoC: codecs: rx-macro: move to individual clks from bulk
      ASoC: codecs: tx-macro: move to individual clks from bulk
      ASoC: codecs: wsa-macro: move to individual clks from bulk
      ASoC: codecs: wsa-macro: setup soundwire clks correctly
      ASoC: codecs: tx-macro: setup soundwire clks correctly
      ASoC: codecs: rx-macro: setup soundwire clks correctly
      ASoC: codecs: va-macro: add runtime pm support
      ASoC: codecs: wsa-macro: add runtime pm support
      ASoC: codecs: rx-macro: add runtime pm support
      ASoC: codecs: tx-macro: add runtime pm support
      ASoC: codecs: wcd938x: add simple clk stop support
      ASoC: codecs: wcd-mbhc: add runtime pm support
      ASoC: codecs: wsa881x: add runtime pm support
      ASoC: qcom: select correct WCD938X config for SC7280
      ASoC: qcom: fix Kconfig for SC7280

Srinivasa Rao Mandadapu (19):
      ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
      ASoC: qcom: Add macro for lpass DAI id's max limit
      ASoC: qcom: SC7280: Add machine driver
      ASoC: codec: wcd938x: Add switch control for selecting CTIA/OMTP Headset
      ASoC: dt-bindings: wcd938x: Add gpio property for selecting CTIA/OMTP headset
      ASoC: codec: wcd938x: Update CTIA/OMTP switch control
      ASoC: qcom: Move lpass_pcm_data structure to lpass header
      ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
      ASoC: qcom: Add helper function to get dma control and lpaif handle
      ASoC: qcom: Add register definition for codec rddma and wrdma
      ASoC: qcom: Add regmap config support for codec dma driver
      ASoC: qcom: Add support for codec dma driver
      ASoC: qcom: Add lpass CPU driver for codec dma control
      ASoC: dt-bindings: Add SC7280 lpass cpu bindings
      ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
      ASoC: qcom: lpass-platform: Update warning print to control excess logging
      ASoC: codecs: Add power domains support in digital macro codecs
      ASoC: qcom: dt-bindings: Add bindings for power domains in lpass digital codecs
      ASoC: codecs: Fix misplaced lpass_macro_pds_exit call

Stephan Gerhold (1):
      ASoC: dt-bindings: Add schema for "awinic,aw8738"

Stephen Kitt (1):
      ASoC: SOF: Replace zero-length array with flexible-array member

Takashi Iwai (1):
      ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call

Trevor Wu (3):
      ASoC: mediatek: mt8195: enable apll tuner
      ASoC: mediatek: mt8195: add reset controller
      dt-bindings: mediatek: mt8195: add reset property

Uwe Kleine-König (1):
      ASoC: cs42l51: Improve error handling in cs42l51_remove()

V sujith kumar Reddy (1):
      ASoC: amd: sof-mach: Add support for RT5682S and RT1019 card

Vijendar Mukunda (4):
      ASoC: amd: vg: fix for pm resume callback sequence
      ASoC: amd: vg: update DAI link name
      ASoC: amd: vg: remove warnings and errors pointed out by checkpatch pl
      ASoC: amd: vangogh: fix uninitialized symbol warning in machine driver

Viorel Suman (2):
      ASoC: codec: wm8960: complete discharge on BIAS OFF->STANDBY
      ASoC: fsl_spdif: keep all TxClk sources by txclk array

Vlad Karpovich (1):
      ASoC: wm_adsp: Add trace caps to speaker protection FW

Wang Wensheng (1):
      ASoC: imx-es8328: Fix error return code in imx_es8328_probe()

Weiguo Li (1):
      ASoC: SOF: compress: fix null check after dereference

Xiaoke Wang (1):
      ASoC: samsung: i2s: check the return value of kstrdup()

Yang Li (1):
      ASoC: mediatek: mt8195: Remove unnecessary print function dev_err()

Yihao Han (1):
      ASoC: SOF: topology: Use kmemdup() to replace kzalloc + memcpy

Yong Zhi (1):
      ASoC: Intel: sof_rt5682: add support for systems without i915 audio

YueHaibing (2):
      ASoC: amd: acp5x-pcm-dma: Fix signedness bug
      ASoC: amd: acp3x: Fix signedness bug in acp3x

Zhen Ni (1):
      ASoC: amd: use asoc_substream_to_rtd()

balamurugan.c (1):
      ASoC: Intel: add RT1308 I2S machine driver and HDMI-in capture via I2S support.

zhangqilong (1):
      ASoC: rockchip: Fix PM usage reference of rockchip_i2s_tdm_resume

 .../bindings/bus/nvidia,tegra210-aconnect.yaml     |    1 +
 .../bindings/dma/nvidia,tegra210-adma.yaml         |    4 +-
 .../bindings/interrupt-controller/arm,gic.yaml     |    1 +
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |    5 +
 .../devicetree/bindings/sound/arndale.txt          |   25 -
 .../bindings/sound/audio-graph-port.yaml           |   20 +
 .../devicetree/bindings/sound/awinic,aw8738.yaml   |   54 +
 .../bindings/sound/davinci-mcasp-audio.txt         |   86 -
 .../bindings/sound/davinci-mcasp-audio.yaml        |  201 ++
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |    3 +
 .../bindings/sound/google,sc7280-herobrine.yaml    |  180 ++
 .../devicetree/bindings/sound/microchip,pdmc.yaml  |  100 +
 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml  |   10 +
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |    4 +-
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |    4 +-
 .../bindings/sound/nvidia,tegra210-adx.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |    3 +
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |    1 +
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |   75 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |    8 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |    8 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |    8 +
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |    4 +
 .../devicetree/bindings/sound/realtek,rt5682s.yaml |    8 +-
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |   16 +-
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |    3 +-
 .../bindings/sound/samsung,aries-wm8994.yaml       |    4 +
 .../devicetree/bindings/sound/samsung,arndale.yaml |   45 +
 .../bindings/sound/samsung,smdk-wm8994.txt         |   14 -
 .../bindings/sound/samsung,smdk5250.yaml           |   38 +
 .../devicetree/bindings/sound/samsung,snow.yaml    |   74 +
 .../bindings/sound/samsung,tm2-audio.txt           |   42 -
 .../devicetree/bindings/sound/samsung,tm2.yaml     |   80 +
 .../devicetree/bindings/sound/simple-card.yaml     |   53 +-
 Documentation/devicetree/bindings/sound/snow.txt   |   31 -
 .../devicetree/bindings/sound/tas5805m.yaml        |   56 +
 .../devicetree/bindings/sound/tlv320aic31xx.txt    |    2 +-
 MAINTAINERS                                        |    5 +-
 arch/arm/boot/dts/am43x-epos-evm.dts               |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   28 +
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    4 +
 drivers/soundwire/dmi-quirks.c                     |    2 +-
 include/dt-bindings/sound/microchip,pdmc.h         |   13 +
 include/dt-bindings/sound/tlv320aic31xx-micbias.h  |    9 -
 include/dt-bindings/sound/tlv320aic31xx.h          |   14 +
 include/sound/hdaudio.h                            |    3 +
 include/sound/hdaudio_ext.h                        |   50 +
 include/sound/intel-nhlt.h                         |   22 +-
 include/sound/simple_card_utils.h                  |   12 +
 include/sound/soc-acpi.h                           |   29 +-
 include/sound/soc-dapm.h                           |    1 +
 include/sound/sof.h                                |    8 +
 include/sound/sof/dai.h                            |    5 +
 include/sound/sof/header.h                         |    2 +-
 include/sound/sof/info.h                           |    1 +
 include/sound/sof/topology.h                       |   10 +-
 include/uapi/sound/sof/abi.h                       |    4 +-
 sound/hda/intel-dsp-config.c                       |   36 +-
 sound/hda/intel-nhlt.c                             |   22 +
 sound/soc/amd/Kconfig                              |    1 +
 sound/soc/amd/acp-config.c                         |    9 +
 sound/soc/amd/acp-pcm-dma.c                        |   11 +-
 sound/soc/amd/acp/Kconfig                          |   10 +
 sound/soc/amd/acp/Makefile                         |    4 +
 sound/soc/amd/acp/acp-legacy-mach.c                |   38 +-
 sound/soc/amd/acp/acp-mach-common.c                |   50 +
 sound/soc/amd/acp/acp-pci.c                        |  160 +
 sound/soc/amd/acp/acp-pdm.c                        |  193 ++
 sound/soc/amd/acp/acp-renoir.c                     |  189 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   14 +
 sound/soc/amd/acp/amd.h                            |   23 +-
 sound/soc/amd/acp/chip_offset_byte.h               |   26 +
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   11 +-
 sound/soc/amd/raven/acp3x.h                        |    2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |   10 +-
 sound/soc/amd/renoir/rn-pci-acp3x.c                |    7 +-
 sound/soc/amd/renoir/rn_acp3x.h                    |    3 +
 sound/soc/amd/vangogh/acp5x-mach.c                 |   14 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |   78 +-
 sound/soc/amd/vangogh/acp5x.h                      |    2 +-
 sound/soc/atmel/Kconfig                            |   16 +
 sound/soc/atmel/Makefile                           |    2 +
 sound/soc/atmel/atmel_ssc_dai.c                    |    5 +-
 sound/soc/atmel/mchp-pdmc.c                        | 1083 +++++++
 sound/soc/atmel/mchp-spdifrx.c                     |    2 +-
 sound/soc/atmel/mikroe-proto.c                     |   20 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    1 +
 sound/soc/atmel/sam9x5_wm8731.c                    |   13 +-
 sound/soc/codecs/Kconfig                           |   39 +-
 sound/soc/codecs/Makefile                          |    6 +
 sound/soc/codecs/ak4613.c                          |   11 +-
 sound/soc/codecs/aw8738.c                          |  104 +
 sound/soc/codecs/bt-sco.c                          |    8 +-
 sound/soc/codecs/cpcap.c                           |    2 +
 sound/soc/codecs/cs35l41.c                         |    8 +-
 sound/soc/codecs/cs42l42.c                         |  179 +-
 sound/soc/codecs/cs42l42.h                         |   16 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    4 +-
 sound/soc/codecs/cs42l51.c                         |   11 +-
 sound/soc/codecs/cs42l51.h                         |    2 +-
 sound/soc/codecs/es7134.c                          |    2 +-
 sound/soc/codecs/es7241.c                          |   30 +-
 sound/soc/codecs/es8316.c                          |    4 +-
 sound/soc/codecs/es8328.c                          |   16 +-
 sound/soc/codecs/hdac_hda.c                        |    7 +-
 sound/soc/codecs/inno_rk3036.c                     |    6 +-
 sound/soc/codecs/isabelle.c                        |    6 +-
 sound/soc/codecs/lm49453.c                         |   10 +-
 sound/soc/codecs/lpass-macro-common.c              |   67 +
 sound/soc/codecs/lpass-macro-common.h              |   17 +
 sound/soc/codecs/lpass-rx-macro.c                  |  180 +-
 sound/soc/codecs/lpass-tx-macro.c                  |  180 +-
 sound/soc/codecs/lpass-va-macro.c                  |  116 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  159 +-
 sound/soc/codecs/max9759.c                         |    3 +-
 sound/soc/codecs/max98088.c                        |   24 +-
 sound/soc/codecs/max98095.c                        |   36 +-
 sound/soc/codecs/max98371.c                        |    4 +-
 sound/soc/codecs/max98390.c                        |   10 +-
 sound/soc/codecs/max98390.h                        |    2 +-
 sound/soc/codecs/max9850.c                         |    8 +-
 sound/soc/codecs/max9860.c                         |    6 +-
 sound/soc/codecs/max9867.c                         |   14 +-
 sound/soc/codecs/max98925.c                        |   13 +-
 sound/soc/codecs/max98926.c                        |    4 +-
 sound/soc/codecs/max98927.c                        |   12 +-
 sound/soc/codecs/max98927.h                        |    2 +-
 sound/soc/codecs/mc13783.c                         |   15 +-
 sound/soc/codecs/ml26124.c                         |    7 +-
 sound/soc/codecs/msm8916-wcd-analog.c              |   22 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |    5 +-
 sound/soc/codecs/pcm1681.c                         |    4 +-
 sound/soc/codecs/pcm186x.c                         |   19 +-
 sound/soc/codecs/pcm3060.c                         |   14 +-
 sound/soc/codecs/pcm3060.h                         |    2 +-
 sound/soc/codecs/pcm3168a.c                        |  172 +-
 sound/soc/codecs/pcm512x.c                         |   32 +-
 sound/soc/codecs/rk817_codec.c                     |    6 +-
 sound/soc/codecs/rt1308-sdw.c                      |   73 +-
 sound/soc/codecs/rt5640.c                          |    3 -
 sound/soc/codecs/rt5663.c                          |    2 +
 sound/soc/codecs/rt5682s.c                         |   47 +-
 sound/soc/codecs/si476x.c                          |    2 +-
 sound/soc/codecs/sti-sas.c                         |    6 +-
 sound/soc/codecs/tas5805m.c                        |  567 ++++
 sound/soc/codecs/tlv320adc3xxx.c                   |  143 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    2 +-
 sound/soc/codecs/tscs42xx.c                        |    6 +-
 sound/soc/codecs/tscs454.c                         |   28 +-
 sound/soc/codecs/twl4030.c                         |   12 +-
 sound/soc/codecs/uda1334.c                         |    2 +-
 sound/soc/codecs/uda134x.c                         |    6 +-
 sound/soc/codecs/uda1380.c                         |   10 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     |   26 +
 sound/soc/codecs/wcd934x.c                         |    1 +
 sound/soc/codecs/wcd938x-sdw.c                     |    1 +
 sound/soc/codecs/wcd938x.c                         |   27 +
 sound/soc/codecs/wl1273.c                          |    4 +-
 sound/soc/codecs/wm8350.c                          |   28 +-
 sound/soc/codecs/wm8731.c                          |    6 -
 sound/soc/codecs/wm8960.c                          |   13 +-
 sound/soc/codecs/wm8962.c                          |   21 +-
 sound/soc/codecs/wm8971.c                          |    5 +-
 sound/soc/codecs/wm_adsp.c                         |  162 +-
 sound/soc/codecs/wm_adsp.h                         |    1 +
 sound/soc/codecs/wsa881x.c                         |   53 +
 sound/soc/dwc/dwc-i2s.c                            |   17 +-
 sound/soc/fsl/fsl-asoc-card.c                      |    7 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    2 +-
 sound/soc/fsl/fsl_esai.c                           |    2 +-
 sound/soc/fsl/fsl_rpmsg.c                          |    2 -
 sound/soc/fsl/fsl_sai.c                            |  111 +-
 sound/soc/fsl/fsl_sai.h                            |   10 +-
 sound/soc/fsl/fsl_spdif.c                          |   97 +-
 sound/soc/fsl/fsl_spdif.h                          |   14 +
 sound/soc/fsl/fsl_ssi.c                            |    2 +-
 sound/soc/fsl/imx-es8328.c                         |    1 +
 sound/soc/fsl/imx-pcm-dma.c                        |    2 +-
 sound/soc/fsl/imx-pcm.h                            |    7 +-
 sound/soc/generic/audio-graph-card2.c              |    4 +
 sound/soc/generic/simple-card-utils.c              |  187 +-
 sound/soc/generic/simple-card.c                    |   26 +-
 sound/soc/intel/Kconfig                            |   12 +
 sound/soc/intel/Makefile                           |    1 +
 sound/soc/intel/avs/Makefile                       |    6 +
 sound/soc/intel/avs/avs.h                          |  247 ++
 sound/soc/intel/avs/cldma.c                        |  316 ++
 sound/soc/intel/avs/cldma.h                        |   29 +
 sound/soc/intel/avs/core.c                         |   61 +
 sound/soc/intel/avs/dsp.c                          |  302 ++
 sound/soc/intel/avs/ipc.c                          |  382 +++
 sound/soc/intel/avs/loader.c                       |  608 ++++
 sound/soc/intel/avs/messages.c                     |  695 ++++
 sound/soc/intel/avs/messages.h                     |  752 +++++
 sound/soc/intel/avs/registers.h                    |   75 +
 sound/soc/intel/avs/utils.c                        |  301 ++
 sound/soc/intel/boards/Kconfig                     |   77 +-
 sound/soc/intel/boards/Makefile                    |   12 +-
 sound/soc/intel/boards/bdw-rt5650.c                |    2 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    2 +-
 sound/soc/intel/boards/broadwell.c                 |    2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    2 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    2 +-
 sound/soc/intel/boards/bytcht_da7213.c             |    2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    2 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    2 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    4 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |    2 +-
 sound/soc/intel/boards/haswell.c                   |    2 +-
 sound/soc/intel/boards/sof_cirrus_common.c         |  163 +
 sound/soc/intel/boards/sof_cirrus_common.h         |   25 +
 sound/soc/intel/boards/sof_es8336.c                |  134 +-
 sound/soc/intel/boards/sof_realtek_common.c        |  107 +
 sound/soc/intel/boards/sof_realtek_common.h        |    4 +
 sound/soc/intel/boards/sof_rt5682.c                |   56 +-
 sound/soc/intel/boards/sof_sdw.c                   |    2 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |  483 +++
 sound/soc/intel/catpt/pcm.c                        |    6 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   63 +-
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |   18 +-
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |   11 -
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |   12 -
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   23 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   18 +-
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |    1 -
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |   18 +-
 sound/soc/intel/common/soc-acpi-intel-hda-match.c  |    2 -
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c    |    5 -
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |    5 -
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   19 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   31 +-
 sound/soc/mediatek/Kconfig                         |    2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   23 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    6 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   18 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |  282 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h         |   11 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |   23 +-
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  |    4 +-
 sound/soc/mxs/mxs-saif.c                           |    5 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |    3 +
 sound/soc/qcom/Kconfig                             |   26 +
 sound/soc/qcom/Makefile                            |    6 +
 sound/soc/qcom/lpass-cdc-dma.c                     |  301 ++
 sound/soc/qcom/lpass-cpu.c                         |  253 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  127 +-
 sound/soc/qcom/lpass-platform.c                    |  635 +++-
 sound/soc/qcom/lpass-sc7280.c                      |  438 +++
 sound/soc/qcom/lpass.h                             |  142 +
 sound/soc/qcom/sc7280.c                            |  284 ++
 sound/soc/rockchip/rk3399_gru_sound.c              |   20 +
 sound/soc/rockchip/rockchip_i2s.c                  |   15 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |    2 +-
 sound/soc/samsung/i2s.c                            |    4 +
 sound/soc/samsung/idma.c                           |    5 +-
 sound/soc/samsung/midas_wm1811.c                   |    1 +
 sound/soc/sh/fsi.c                                 |   19 +-
 sound/soc/sh/rz-ssi.c                              |  109 +-
 sound/soc/soc-compress.c                           |    5 +
 sound/soc/soc-core.c                               |    3 +-
 sound/soc/soc-dapm.c                               |   15 +
 sound/soc/soc-generic-dmaengine-pcm.c              |   20 +-
 sound/soc/soc-topology.c                           |  103 +-
 sound/soc/sof/Kconfig                              |   33 +-
 sound/soc/sof/Makefile                             |   18 +-
 sound/soc/sof/amd/acp-dsp-offset.h                 |    1 +
 sound/soc/sof/amd/acp-ipc.c                        |   22 +-
 sound/soc/sof/amd/acp-loader.c                     |    9 +
 sound/soc/sof/amd/acp-pcm.c                        |   15 +-
 sound/soc/sof/amd/acp-stream.c                     |    3 +
 sound/soc/sof/amd/acp-trace.c                      |   38 +-
 sound/soc/sof/amd/acp.c                            |   29 +-
 sound/soc/sof/amd/acp.h                            |    9 +-
 sound/soc/sof/amd/renoir.c                         |    1 -
 sound/soc/sof/compress.c                           |  274 +-
 sound/soc/sof/control.c                            |  545 +---
 sound/soc/sof/core.c                               |   73 +-
 sound/soc/sof/debug.c                              |  567 +---
 sound/soc/sof/imx/imx8.c                           |    4 +-
 sound/soc/sof/imx/imx8m.c                          |    3 +-
 sound/soc/sof/intel/Kconfig                        |   19 +-
 sound/soc/sof/intel/apl.c                          |   15 +-
 sound/soc/sof/intel/bdw.c                          |    2 +-
 sound/soc/sof/intel/byt.c                          |    4 +-
 sound/soc/sof/intel/cnl.c                          |   21 +-
 sound/soc/sof/intel/hda-dai.c                      |  204 +-
 sound/soc/sof/intel/hda-dsp.c                      |   20 +-
 sound/soc/sof/intel/hda-ipc.c                      |   18 +-
 sound/soc/sof/intel/hda-loader.c                   |  118 +-
 sound/soc/sof/intel/hda-pcm.c                      |   31 +-
 sound/soc/sof/intel/hda-probes.c                   |  104 +-
 sound/soc/sof/intel/hda-stream.c                   |  122 +-
 sound/soc/sof/intel/hda-trace.c                    |   23 +-
 sound/soc/sof/intel/hda.c                          |  307 +-
 sound/soc/sof/intel/hda.h                          |   90 +-
 sound/soc/sof/intel/icl.c                          |   15 +-
 sound/soc/sof/intel/pci-tgl.c                      |    2 +
 sound/soc/sof/intel/pci-tng.c                      |    3 +-
 sound/soc/sof/intel/tgl.c                          |   15 +-
 sound/soc/sof/{utils.c => iomem-utils.c}           |   61 +-
 sound/soc/sof/ipc.c                                |  142 +-
 sound/soc/sof/ipc3-control.c                       |  594 ++++
 sound/soc/sof/ipc3-ops.h                           |   21 +
 sound/soc/sof/ipc3-pcm.c                           |  372 +++
 sound/soc/sof/ipc3-topology.c                      | 2393 ++++++++++++++
 sound/soc/sof/ipc3.c                               |   45 +
 sound/soc/sof/ops.h                                |   68 +-
 sound/soc/sof/pcm.c                                |  353 +--
 sound/soc/sof/pm.c                                 |   93 +-
 sound/soc/sof/sof-audio.c                          |  546 +---
 sound/soc/sof/sof-audio.h                          |  235 +-
 sound/soc/sof/sof-client-ipc-flood-test.c          |  396 +++
 sound/soc/sof/sof-client-ipc-msg-injector.c        |  192 ++
 sound/soc/sof/sof-client-probes.c                  |  821 +++++
 sound/soc/sof/sof-client-probes.h                  |   31 +
 sound/soc/sof/sof-client.c                         |  469 +++
 sound/soc/sof/sof-client.h                         |   67 +
 sound/soc/sof/sof-pci-dev.c                        |   16 +
 sound/soc/sof/sof-priv.h                           |  221 +-
 sound/soc/sof/sof-probes.c                         |  364 ---
 sound/soc/sof/sof-probes.h                         |   38 -
 sound/soc/sof/sof-utils.c                          |   77 +
 sound/soc/sof/sof-utils.h                          |   19 +
 sound/soc/sof/stream-ipc.c                         |    9 +-
 sound/soc/sof/topology.c                           | 3312 +++++---------------
 sound/soc/sof/trace.c                              |   21 +-
 sound/soc/sti/uniperif_player.c                    |    6 +-
 sound/soc/sti/uniperif_reader.c                    |    2 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   68 +-
 sound/soc/tegra/tegra20_spdif.c                    |    2 +-
 sound/soc/tegra/tegra210_ahub.c                    |  146 +-
 sound/soc/tegra/tegra210_ahub.h                    |    4 +-
 sound/soc/ti/davinci-i2s.c                         |    5 +-
 sound/soc/ti/omap-dmic.c                           |    2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   52 +-
 sound/soc/xilinx/xlnx_i2s.c                        |  147 +-
 348 files changed, 21931 insertions(+), 7219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/arndale.txt
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,arndale.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,snow.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/snow.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
 create mode 100644 include/dt-bindings/sound/microchip,pdmc.h
 delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
 create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
 create mode 100644 sound/soc/amd/acp/acp-pci.c
 create mode 100644 sound/soc/amd/acp/acp-pdm.c
 create mode 100644 sound/soc/atmel/mchp-pdmc.c
 create mode 100644 sound/soc/codecs/aw8738.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.h
 create mode 100644 sound/soc/codecs/tas5805m.c
 create mode 100644 sound/soc/intel/avs/Makefile
 create mode 100644 sound/soc/intel/avs/avs.h
 create mode 100644 sound/soc/intel/avs/cldma.c
 create mode 100644 sound/soc/intel/avs/cldma.h
 create mode 100644 sound/soc/intel/avs/core.c
 create mode 100644 sound/soc/intel/avs/dsp.c
 create mode 100644 sound/soc/intel/avs/ipc.c
 create mode 100644 sound/soc/intel/avs/loader.c
 create mode 100644 sound/soc/intel/avs/messages.c
 create mode 100644 sound/soc/intel/avs/messages.h
 create mode 100644 sound/soc/intel/avs/registers.h
 create mode 100644 sound/soc/intel/avs/utils.c
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.c
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.h
 create mode 100644 sound/soc/intel/boards/sof_ssp_amp.c
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c
 create mode 100644 sound/soc/qcom/sc7280.c
 rename sound/soc/sof/{utils.c => iomem-utils.c} (59%)
 create mode 100644 sound/soc/sof/ipc3-control.c
 create mode 100644 sound/soc/sof/ipc3-ops.h
 create mode 100644 sound/soc/sof/ipc3-pcm.c
 create mode 100644 sound/soc/sof/ipc3-topology.c
 create mode 100644 sound/soc/sof/ipc3.c
 create mode 100644 sound/soc/sof/sof-client-ipc-flood-test.c
 create mode 100644 sound/soc/sof/sof-client-ipc-msg-injector.c
 create mode 100644 sound/soc/sof/sof-client-probes.c
 create mode 100644 sound/soc/sof/sof-client-probes.h
 create mode 100644 sound/soc/sof/sof-client.c
 create mode 100644 sound/soc/sof/sof-client.h
 delete mode 100644 sound/soc/sof/sof-probes.c
 delete mode 100644 sound/soc/sof/sof-probes.h
 create mode 100644 sound/soc/sof/sof-utils.c
 create mode 100644 sound/soc/sof/sof-utils.h
