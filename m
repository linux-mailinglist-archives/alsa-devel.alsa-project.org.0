Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FD5762D4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 15:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F95617EE;
	Fri, 15 Jul 2022 15:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F95617EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657891980;
	bh=caZBvKay9wZscrpZUMSAxhe6S9u0lzkNJHFg5d+KfLw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h+shhiSwji2FRJfKybpPmAW/Ft2Zy7xsM2y4IetCWM5ARejPP+dU40mOYbC47Vt74
	 qsmWsYarHbZX5stM5ebIT44V/2DFPNJR5tNaOLwYzONQh+/L5BhXRxent+/IBZQqdK
	 qnzx8UM/7V8ZiCJl2vec5yFDXTihOBeEnhItXStg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB135F80212;
	Fri, 15 Jul 2022 15:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7679CF8015B; Fri, 15 Jul 2022 15:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40C97F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 15:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C97F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SB7VdAyf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ABAA62398;
 Fri, 15 Jul 2022 13:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5205C34115;
 Fri, 15 Jul 2022 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657891903;
 bh=caZBvKay9wZscrpZUMSAxhe6S9u0lzkNJHFg5d+KfLw=;
 h=From:To:Cc:Subject:Date:From;
 b=SB7VdAyfks1xuOb0RzqfNboeYz/Of7AFhYxZidHZZmyOpDbpUfpsnmtJF/jRDXTwx
 /0kxFVad9W0k404F0pLJShUTsSrH+n2WPHHiohqpAQ/vkxmhOOhd1cCZP3rkFoWKI2
 l0bqs8JoJVmNz+5sB/63+qYL2qURbIu7zFxhS5xnJBvj1OC4sdlQtemHeOt0Lkbdr4
 Ipr1ops4xbQ4yJyT/lDAqm7E4U4EduJZOICky1mSvqBa4lp06GNWPyZrGCUy0H8zaj
 FOQXAYQzRHS8YtHG+Z0lMdVddbEcvDGZ9YS/IHsZpltAECa5HXqoxCkV6TX87bNV6K
 4wWXq6IBI7aPg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.20
Date: Fri, 15 Jul 2022 14:31:32 +0100
Message-Id: <20220715133142.D5205C34115@smtp.kernel.org>
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

The following changes since commit fc976f5629afb4160ee77798b14a693eac903ffd:

  ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array (2022-07-07 17:16:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.20

for you to fetch changes up to 7fb72b7bf167a8047204d30e0e8affe6023363d9:

  ASoC: Merge up revert of v5.19 version of the rockchip BCLK management (2022-07-14 16:42:29 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.20

This is a big release thus far and there will probably be more changes
to come, it's a combination of a larger than usual crop of new drivers
and some subsysetm wide cleanups from Charles rather than anything
structural.  The SOF and Intel DSP code both also continue to be very
actively developed.

 - Restructing of the set_fmt() callbacks to be specified in terms of
   the device rather than with semantics depending on if the device is
   supposed to be a CODEC or SoC, making things clearer in situations
   like CODEC to CODEC links.
 - Clean up of the way we flag which DAI naming scheme we use to reflect
   the progress that's been made modernising things.
 - Merge of more of the Intel AVS driver stack, including some board
   integrations.
 - New version 4 mechanism for communication with SOF DSPs.
 - Suppoort for dynamically selecting the PLL to use at runtime on i.MX
   platforms.
 - Improvements for CODEC to CODEC support in the generic cards.
 - Support for AMD Jadeite and various machines, Intel MetorLake DSPs,
   Mediatek MT8186 DSPs and MT6366, nVidia Tegra MDDRC, OPE and PEQ, NXP
   TFA9890, Qualcomm SDM845, WCD9335 and WAS883x, and Texas Instruments
   TAS2780.

----------------------------------------------------------------
Aidan MacDonald (2):
      ASoC: jz4740-i2s: Remove Open Firmware dependency
      ASoC: jz4740-i2s: Refactor DMA channel setup

Ajit Kumar Pandey (2):
      ASoC: SOF: amd: Add SOF pm ops callback for Renoir
      ASoC: SOF: topology: add code to parse config params for ACPDMIC dai

Alexander Martinz (2):
      ASoC: codecs: tfa989x: Add support for tfa9890
      ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support

Alexandru Elisei (1):
      ASoC: rockchip: i2s: Fix NULL pointer dereference when pinctrl is not found

Amadeusz Sławiński (10):
      ASoC: Intel: avs: Add max98373 machine board
      ASoC: Intel: avs: Fix parsing UUIDs in topology
      ASoC: Remove unused hw_write_t type
      ASoC: Intel: avs: Set max DMA segment size
      ASoC: Intel: avs: Use helper function to set up DMA
      ASoC: codecs: rt298: Fix NULL jack in interrupt
      ASoC: codecs: rt298: Fix jack detection
      ASoC: codecs: rt286: Set component to NULL on remove
      ASoC: codecs: rt298: Set component to NULL on remove
      ASoC: codecs: rt274: Set component to NULL on remove

Andy Shevchenko (4):
      ASoC: madera: Replace kernel.h with the necessary inclusions
      ASoC: Intel: catpt: remove duplicating driver data retrieval
      ASoC: SOF: Intel: bdw: remove duplicating driver data retrieval
      ASoC: SOF: Intel: byt: remove duplicating driver data retrieval

Arnaud Ferraris (2):
      ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
      ASoC: sun50i-codec-analog: Add support for internal bias

Bard Liao (7):
      ASoC: SOF: Intel: add MeteorLake machines
      ASoC: SOF: IPC4: add sdw blob
      ASoC: SOF: ipc4-topology: add SoundWire/ALH aggregation support
      ASoC: SOC: Intel: introduce cl_init callback
      ASoC: SOF: Intel: Add support for MeteorLake (MTL)
      soundwire: Intel: add trigger callback
      ASoC: SOF: Intel: add trigger callback into sdw_callback

Brent Lu (2):
      ASoC: Intel: sof_cs42l42: support BT offload audio
      ASoC: Intel: sof_cs42l42: add adl_mx98360a_cs4242 board config

Bryan O'Donoghue (1):
      ASoC: qcom: lpass: Fix apq8016 compat string to match yaml

Cezary Rojewski (43):
      ALSA: Add snd_pcm_direction_name() helper
      ASoC: codecs: Add HD-Audio codec driver
      ASoC: Intel: avs: Add HDAudio machine board
      ASoC: Intel: avs: Add DMIC machine board
      ASoC: Intel: avs: Add I2S-test machine board
      ASoC: Intel: avs: Add rt274 machine board
      ASoC: Intel: avs: Add rt286 machine board
      ASoC: Intel: avs: Add rt298 machine board
      ASoC: Intel: avs: Add rt5682 machine board
      ASoC: Intel: avs: Add nau8825 machine board
      ASoC: Intel: avs: Add ssm4567 machine board
      ASoC: Intel: avs: Add max98357a machine board
      ASoC: Intel: avs: Add da7219 machine board
      ASoC: codecs: rt274: Always init jack_detect_work
      ASoC: codecs: rt286: Reorganize jack detect handling
      ASoC: codecs: rt298: Reorganize jack detect handling
      ASoC: Intel: Rename haswell source file to hsw_rt5640
      ASoC: Intel: hsw_rt5640: Reword prefixes of all driver members
      ASoC: Intel: hsw_rt5640: Reword driver name
      ASoC: Intel: hsw_rt5640: Update code indentation
      ASoC: Intel: hsw_rt5640: Update file comments
      ASoC: Intel: hsw_rt5640: Improve probe() function quality
      ASoC: Intel: hsw_rt5640: Improve hw_params() debug-ability
      ASoC: Intel: Rename broadwell source file to bdw_rt286
      ASoC: Intel: bdw_rt286: Reword prefixes of all driver members
      ASoC: Intel: bdw_rt286: Reword driver name
      ASoC: Intel: bdw_rt286: Update code indentation
      ASoC: Intel: bdw_rt286: Update file comments
      ASoC: Intel: bdw_rt286: Improve probe() function quality
      ASoC: Intel: bdw_rt286: Improve hw_params() debug-ability
      ASoC: Intel: bdw_rt286: Improve codec_init() quality
      ASoC: Intel: bdw_rt286: Remove FE DAI ops
      ASoC: Intel: avs: Fix i2s_test card name initialization
      ASoC: Intel: avs: Register HDAudio ext-bus operations
      ASoC: Intel: avs: Assign I2S gateway when parsing topology
      ASoC: Intel: avs: Relax DSP core transition timings
      ASoC: Intel: avs: Copy only as many RX bytes as necessary
      ASoC: Intel: avs: Shield LARGE_CONFIG_GETs against zero payload_size
      ASoC: Intel: avs: Block IPC channel on suspend
      ASoC: Intel: avs: Recognize FW_CFG_RESERVED
      ASoC: Intel: avs: Replace hardcodes with SD_CTL_STREAM_RESET
      ASoC: Intel: avs: Lower UNLOAD_MULTIPLE_MODULES IPC timeout
      ASoC: Intel: avs: Update AVS_FW_INIT_TIMEOUT_US declaration

Charles Keepax (168):
      ASoC: core: Add set_fmt_new callback that directly specifies provider
      ASoC: amd: vangogh: Update to use set_fmt_new callback
      ASoC: atmel: Update to use set_fmt_new callback
      ASoC: au1x: Update to use set_fmt_new callback
      ASoC: bcm: Update to use set_fmt_new callback
      ASoC: ep93xx: Update to use set_fmt_new callback
      ASoC: dwc: Update to use set_fmt_new callback
      ASoC: fsl: Update to use set_fmt_new callback
      ASoC: hisilicon: Update to use set_fmt_new callback
      ASoC: img: Update to use set_fmt_new callback
      ASoC: Intel: Update to use set_fmt_new callback
      ASoC: js4740-i2s: Update to use set_fmt_new callback
      ASoC: mediatek: Update to use set_fmt_new callback
      ASoC: meson: Update to use set_fmt_new callback
      ASoC: mxs-saif: Update to use set_fmt_new callback
      ASoC: pxa: Update to use set_fmt_new callback
      ASoC: qcom: Update to use set_fmt_new callback
      ASoC: rockchip: Update to use set_fmt_new callback
      ASoC: samsung: Update to use set_fmt_new callback
      ASoC: sh: Update to use set_fmt_new callback
      ASoC: stm: Update to use set_fmt_new callback
      ASoC: sunxi: Update to use set_fmt_new callback
      ASoC: tegra: Update to use set_fmt_new callback
      ASoC: test-component: Update to use set_fmt_new callback
      ASoC: ti: Update to use set_fmt_new callback
      ASoC: ux500: Update to use set_fmt_new callback
      ASoC: xtensa: Update to use set_fmt_new callback
      ASoC: core: Always send the CPU DAI a direct clock specifier
      ASoC: amd: vangogh: Rename set_fmt_new back to set_fmt
      ASoC: atmel: Rename set_fmt_new back to set_fmt
      ASoC: au1x: Rename set_fmt_new back to set_fmt
      ASoC: bcm: Rename set_fmt_new back to set_fmt
      ASoC: ep93xx: Rename set_fmt_new back to set_fmt
      ASoC: dwc: Rename set_fmt_new back to set_fmt
      ASoC: fsl: Rename set_fmt_new back to set_fmt
      ASoC: hisilicon: Rename set_fmt_new back to set_fmt
      ASoC: img: Rename set_fmt_new back to set_fmt
      ASoC: Intel: Rename set_fmt_new back to set_fmt
      ASoC: jz4740-i2s: Rename set_fmt_new back to set_fmt
      ASoC: mediatek: Rename set_fmt_new back to set_fmt
      ASoC: meson: Rename set_fmt_new back to set_fmt
      ASoC: mxs-saif: Rename set_fmt_new back to set_fmt
      ASoC: pxa: Rename set_fmt_new back to set_fmt
      ASoC: qcom: Rename set_fmt_new back to set_fmt
      ASoC: rockchip: Rename set_fmt_new back to set_fmt
      ASoC: samsung: Rename set_fmt_new back to set_fmt
      ASoC: sh: Rename set_fmt_new back to set_fmt
      ASoC: stm: Rename set_fmt_new back to set_fmt
      ASoC: sunxi: Rename set_fmt_new back to set_fmt
      ASoC: tegra: Rename set_fmt_new back to set_fmt
      ASoC: test-component: Rename set_fmt_new back to set_fmt
      ASoC: ti: Rename set_fmt_new back to set_fmt
      ASoC: ux500: Rename set_fmt_new back to set_fmt
      ASoC: xtensa: Rename set_fmt_new back to set_fmt
      ASoC: soc-dai: Remove set_fmt_new callback
      ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local
      ASoC: cs42l52: Fix TLV scales for mixer controls
      ASoC: cs35l36: Update digital volume TLV
      ASoC: cs53l30: Correct number of volume levels on SX controls
      ASoC: cs42l52: Correct TLV for Bypass Volume
      ASoC: cs42l56: Correct typo in minimum level for SX volume controls
      ASoC: cs42l51: Correct minimum value for SX volume control
      ASoC: sun8i-codec: Partial revert to fix clock specifiers
      ASoC: mediatek: mt8186: Use new direct clock defines
      ASoC: cs35l45: Add endianness flag in snd_soc_component_driver
      ASoC: wm_adsp: Fix event for preloader
      ASoC: wm5110: Fix DRE control
      ASoC: cs35l41: Correct some control names
      ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
      ASoC: dapm: Move stereo autodisable check
      ASoC: soc-component: Add legacy_dai_naming flag
      soundwire: intel: Migrate to new style legacy DAI naming flag
      drm/vc4: Migrate to new style legacy DAI naming flag
      ASoC: img: Migrate to new style legacy DAI naming flag
      ASoC: spear: Migrate to new style legacy DAI naming flag
      ASoC: jz4740-i2c: Migrate to new style legacy DAI naming flag
      ASoC: ep93xx: Migrate to new style legacy DAI naming flag
      ASoC: stm32: Migrate to new style legacy DAI naming flag
      ASoC: bcm: Migrate to new style legacy DAI naming flag
      ASoC: sh: Migrate to new style legacy DAI naming flag
      ASoC: tegra: Migrate to new style legacy DAI naming flag
      ASoC: hisilicon: Migrate to new style legacy DAI naming flag
      ASoC: xilinx: Migrate to new style legacy DAI naming flag
      ASoC: sunxi: Migrate to new style legacy DAI naming flag
      ASoC: Intel: Migrate to new style legacy DAI naming flag
      ASoC: meson: Migrate to new style legacy DAI naming flag
      ASoC: sti-uniperf: Migrate to new style legacy DAI naming flag
      ASoC: amd: Migrate to new style legacy DAI naming flag
      ASoC: atmel: Migrate to new style legacy DAI naming flag
      ASoC: fsl: Migrate to new style legacy DAI naming flag
      ASoC: xtensa: Migrate to new style legacy DAI naming flag
      ASoC: adi: Migrate to new style legacy DAI naming flag
      ASoC: dwc: Migrate to new style legacy DAI naming flag
      ASoC: qcom: Migrate to new style legacy DAI naming flag
      ASoC: test-component: Migrate to new style legacy DAI naming flag
      ASoC: rockchip: Migrate to new style legacy DAI naming flag
      ASoC: au1x: Migrate to new style legacy DAI naming flag
      ASoC: pxa: Migrate to new style legacy DAI naming flag
      ASoC: sof: Migrate to new style legacy DAI naming flag
      ASoC: ux500: Migrate to new style legacy DAI naming flag
      ASoC: ti: Migrate to new style legacy DAI naming flag
      ASoC: mxs-saif: Migrate to new style legacy DAI naming flag
      ASoC: samsung: Migrate to new style legacy DAI naming flag
      ASoC: core: Switch core to new DAI naming flag
      media: TDA1997x: Remove now redundant non_legacy_dai_naming flag
      ASoC: fsl: Remove now redundant non_legacy_dai_naming flag
      ASoC: meson: Remove now redundant non_legacy_dai_naming flag
      ASoC: pistachio: Remove now redundant non_legacy_dai_naming flag
      ASoC: samsung: Remove now redundant non_legacy_dai_naming flag
      ASoC: soc-utils: Remove now redundant non_legacy_dai_naming flag
      ASoC: sunxi: Remove now redundant non_legacy_dai_naming flag
      ASoC: tegra: Remove now redundant non_legacy_dai_naming flag
      ASoC: test-component: Remove now redundant non_legacy_dai_naming flag
      ASoC: topology: KUnit: Remove now redundant non_legacy_dai_naming flag
      ASoC: uniphier: Remove now redundant non_legacy_dai_naming flag
      ASoC: ad*: Remove now redundant non_legacy_dai_naming flag
      ASoC: ak*: Remove now redundant non_legacy_dai_naming flag
      ASoC: alc*: Remove now redundant non_legacy_dai_naming flag
      ASoC: cs*: Remove now redundant non_legacy_dai_naming flag
      ASoC: da*: Remove now redundant non_legacy_dai_naming flag
      ASoC: es*: Remove now redundant non_legacy_dai_naming flag
      ASoC: max*: Remove now redundant non_legacy_dai_naming flag
      ASoC: msm*: Remove now redundant non_legacy_dai_naming flag
      ASoC: nau*: Remove now redundant non_legacy_dai_naming flag
      ASoC: pcm*: Remove now redundant non_legacy_dai_naming flag
      ASoC: rt*: Remove now redundant non_legacy_dai_naming flag
      ASoC: spdif: Remove now redundant non_legacy_dai_naming flag
      ASoC: ssm*: Remove now redundant non_legacy_dai_naming flag
      ASoC: sta*: Remove now redundant non_legacy_dai_naming flag
      ASoC: tas*: Remove now redundant non_legacy_dai_naming flag
      ASoC: tfa*: Remove now redundant non_legacy_dai_naming flag
      ASoC: tlv320*: Remove now redundant non_legacy_dai_naming flag
      ASoC: twl*: Remove now redundant non_legacy_dai_naming flag
      ASoC: uda*: Remove now redundant non_legacy_dai_naming flag
      ASoC: wm*: Remove now redundant non_legacy_dai_naming flag
      ASoC: 88pm860x: Remove now redundant non_legacy_dai_naming flag
      ASoC: ab8500: Remove now redundant non_legacy_dai_naming flag
      ASoC: ac97: Remove now redundant non_legacy_dai_naming flag
      ASoC: ads117x: Remove now redundant non_legacy_dai_naming flag
      ASoC: bd28623: Remove now redundant non_legacy_dai_naming flag
      ASoC: bt-sco: Remove now redundant non_legacy_dai_naming flag
      ASoC: cpcap: Remove now redundant non_legacy_dai_naming flag
      ASoC: cq93vc: Remove now redundant non_legacy_dai_naming flag
      ASoC: cx20442: Remove now redundant non_legacy_dai_naming flag
      ASoC: dmic: Remove now redundant non_legacy_dai_naming flag
      ASoC: gtm601: Remove now redundant non_legacy_dai_naming flag
      ASoC: hdac_hdmi: Remove now redundant non_legacy_dai_naming flag
      ASoC: hdmi-codec: Remove now redundant non_legacy_dai_naming flag
      ASoC: ics43432: Remove now redundant non_legacy_dai_naming flag
      ASoC: inno_rk3036: Remove now redundant non_legacy_dai_naming flag
      ASoC: Intel: avs: Remove now redundant non_legacy_dai_naming flag
      ASoC: isabelle: Remove now redundant non_legacy_dai_naming flag
      ASoC: jz4740: Remove now redundant non_legacy_dai_naming flag
      ASoC: lm49453: Remove now redundant non_legacy_dai_naming flag
      ASoC: lochnagar: Remove now redundant non_legacy_dai_naming flag
      ASoC: mc13783: Remove now redundant non_legacy_dai_naming flag
      ASoC: ml26124: Remove now redundant non_legacy_dai_naming flag
      ASoC: rk817: Remove now redundant non_legacy_dai_naming flag
      ASoC: sgtl5000: Remove now redundant non_legacy_dai_naming flag
      ASoC: si476x: Remove now redundant non_legacy_dai_naming flag
      ASoC: stac9766: Remove now redundant non_legacy_dai_naming flag
      ASoC: sti-sas: Remove now redundant non_legacy_dai_naming flag
      ASoC: tscs42xx: Remove now redundant non_legacy_dai_naming flag
      ASoC: wl1273: Remove now redundant non_legacy_dai_naming flag
      ASoC: zl38060: Remove now redundant non_legacy_dai_naming flag
      ASoC: soc-component: Remove non_legacy_dai_naming flag
      ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
      ASoC: wm_adsp: Minor clean and redundant code removal

Chen-Yu Tsai (1):
      ASoC: rockchip: i2s: Fix crash on missing pinctrl

Christophe JAILLET (2):
      ASoC: ux500: Remove some leftover from the "Replace GPLv2 boilerplate/reference with SPDX" rules
      ASoC: ab8500: Remove some leftover from the "Replace GPLv2 boilerplate/reference with SPDX" rules

Claudiu Beznea (1):
      ASoC: atmel: mchp-pdmc: remove space in front of mchp_pdmc_dt_init()

Colin Ian King (2):
      ASoC: mediatek: mt8186: Fix a handful of spelling mistakes
      ASoC: Intel: Skylake: remove redundant re-assignments to pointer array

Conor Dooley (1):
      ASoC: dt-bindings: convert designware-i2s to dt-schema

Cristian Ciocaltea (1):
      ASoC: cs35l41: Add support for CLSA3541 ACPI device ID

Dan Carpenter (4):
      ASoC: SOF: mediatek: Fix error code in probe
      ASoC: SOF: ipc4-topology: Fix error code in sof_ipc4_volume_put()
      ASoC: amd: Fix error pointer dereference
      ASoC: SOF: ipc-msg-injector: fix copy in sof_msg_inject_ipc4_dfs_write()

Daniel Baluta (4):
      ASoC: SOF: compress: Dynamically allocate pcm params struct
      ASoC: SOF: Copy compress parameters into extended data
      ASoC: SOF: compress: Prevent current kernel running with older FW
      uapi: sof: abi: Bump SOF ABI for ext_data_length

Daniel Mack (7):
      ASoC: dt-bindings: max98396: add voltage supplies
      ASoC: dt-bindings: max98396: Document adi,bypass-slot-no
      ASoC: max98396: add voltage regulators
      ASoC: max98396: Improve some error prints
      ASoC: max98396: Fix register access for PCM format settings
      ASoC: max98396: Implement DSP speaker monitor
      ASoC: max98396: Fix TDM mode BSEL settings

David Lin (1):
      ASoC: nau8825: Declare 2 channels for DAI of capture stream

Fabio Estevam (1):
      ASoC: imx-audmux: Silence a clang warning

Fei Shao (1):
      ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request

Francesco Dolcini (1):
      ASoC: sgtl5000: Fix noise on shutdown/remove

Gaosheng Cui (1):
      ASoC: codecs: wsa883x: fix warning using-module-alias-sdw.cocci

Hans de Goede (1):
      ASoC: Intel: bytcr_wm5102: Fix GPIO related probe-ordering problem

Hui Wang (2):
      ASoC: nau8822: Disable internal PLL if freq_out is zero
      ASoC: nau8822: Add operation for internal PLL off and on

Javier Martinez Canillas (6):
      regmap: Re-introduce bulk read support check in regmap_bulk_read()
      regmap: Make regmap_noinc_read() return -ENOTSUPP if map->read isn't set
      regmap: Wire up regmap_config provided bulk write in missed functions
      regmap: Re-introduce bulk read support check in regmap_bulk_read()
      regmap: Make regmap_noinc_read() return -ENOTSUPP if map->read isn't set
      regmap: Wire up regmap_config provided bulk write in missed functions

Jiapeng Chong (3):
      ASoC: rockchip: i2s: Fix missing error code in rockchip_i2s_probe()
      ASoC: codecs: max98088: Clean up some inconsistent indenting
      ASoC: tegra20_ac97: Fix missing error code in tegra20_ac97_platform_probe()

Jiasheng Jiang (1):
      ASoC: codecs: da7210: add check for i2c_add_driver

Jiaxin Yu (12):
      ASoC: mediatek: mt6366: support for mt6366 codec
      ASoC: mediatek: mt8186: support audsys clock control
      ASoC: mediatek: mt8186: support adda in platform driver
      ASoC: mediatek: mt8186: support hostless in platform driver
      ASoC: mediatek: mt8186: support hw gain in platform driver
      ASoC: mediatek: mt8186: support i2s in platform driver
      ASoC: mediatek: mt8186: support pcm in platform driver
      ASoC: mediatek: mt8186: support src in platform driver
      ASoC: mediatek: mt8186: support tdm in platform driver
      ASoC: mediatek: mt8186: support audio clock control in platform driver
      ASoC: mediatek: mt8186: support gpio control in platform driver
      ASoC: mediatek: mt8186: add misc driver and register definitions

Judy Hsiao (6):
      ASoC: rockchip: i2s: switch BCLK to GPIO
      ASoC: rockchip: i2s: switch BCLK to GPIO
      ASoC: dt-bindings: rockchip: Document pinctrl-names for i2s
      ASoC: rockchip: i2s: Fix the debug level on missing pinctrl
      ASoC: rockchip: i2s: Remove unwanted dma settings in rockchip_i2s_probe
      ASoC: rockchip: i2s: Fix error code when fail to read I2S_CLR

Julia Lawall (2):
      ASoC: amd: acp: fix typo in comment
      ASoC: stm32: dfsdm: fix typo in comment

Krzysztof Kozlowski (5):
      ASoC: samsung: s3c-i2s-v2: Allow build for unsupported hardware
      ASoC: samsung: s3c24xx-i2s: Drop unneeded gpio.h include
      ASoC: samsung: Enable compile test
      ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
      ASoC: dt-bindings: qcom,sm8250: add SDM845 sound

Kuninori Morimoto (11):
      ASoC: simple-card-utils: rename asoc_simple_init_dai_link_params() to asoc_simple_init_for_codec2codec()
      ASoC: ak4613: cares Simple-Audio-Card case for TDM
      ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
      ASoC: soc-core.c: share code for snd_soc_of_get_dai_link_cpus/codecs()
      ASoC: audio-graph-card2.c: use of_property_read_u32() for rate
      ASoC: audio-graph-card2.c: make Codec2Codec settings optional
      ASoC: audio-graph-card2.c: remove pre-alloced Codec2Codec space
      ASoC: audio-graph-card2-custom-sample.dtsi: add verbose explanation
      ASoC: simple-card-utils.c: ignore Codec2Codec setting if it already have
      ASoC: simple-card-utils.c: care Codec2Codec vs DPCM:BE
      ASoC: rsnd: care default case on rsnd_ssiu_busif_err_irq_ctrl()

Li Chen (2):
      regmap: provide regmap_field helpers for simple bit operations
      ASoC: sunxi: Use {regmap/regmap_field}_{set/clear}_bits helpers

Li kunyu (1):
      ASoC: tegra: delete a semicolon

Liang He (3):
      ASoC: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
      ASoc: audio-graph-card2: Fix refcount leak bug in __graph_get_type()
      ASoC: mt6359: Fix refcount leak bug

Libin Yang (2):
      ASoC: SOF: ipc4-topology: check dai->private in ipc_free()
      ASoC: SOF: ipc4-topology: free memories allocated in sof_ipc4_get_audio_fmt

Lukas Bulwahn (1):
      ASoC: Intel: avs: correct config reference for I2S test board

Marco Felsch (2):
      ASoC: fsl_sai: use local device pointer
      ASoC: fsl_sai: add error message in case of missing imx-pcm-dma support

Marek Vasut (1):
      ASoC: doc: Update dead links

Mark Brown (93):
      Merge existing fixes from asoc/for-5.19 into new branch
      ASoC: ssm2518: Use modern ASoC DAI format terminology
      ASoC: ssm2602: Use modern ASoC DAI format terminology
      ASoC: ssm4567: Use modern ASoC DAI format terminology
      ASoC: ops: Clarify snd_soc_info_volsw_sx()
      ASoC: nau8822: Don't reconfigure PLL to the same values
      ASoC: ops: Remove unneeded delay.h inclusion
      ASoC: tfa9879: Use modern ASoC DAI format terminology
      ASoC: max9860: Use modern ASoC DAI format terminology
      ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
      ASoC: cx2072x: Use modern ASoC DAI format terminology
      ASoC: max98090: Use modern ASoC DAI format terminology
      ASoC: rk3328: Use modern ASoC DAI format terminology
      ASoC: sta32x: Use modern ASoC DAI format terminology
      ASoC: sta350: Use modern ASoC DAI format terminology
      ASoC: sti-sas: Use modern ASoC DAI format terminology
      ASoC: tas2552: Use modern ASoC DAI format terminology
      ASoC: tas2770: Use modern ASoC DAI format terminology
      ASoC: tas5086: Use modern ASoC DAI format terminology
      ASoC: tas5720: Use modern ASoC DAI format terminology
      ASoC: tas6424: Use modern ASoC DAI format terminology
      ASoC: uda1334: Use modern ASoC DAI format terminology
      ASoC: tlv320adc3xxx: Use modern ASoC DAI format terminology
      ASoC: tlv320adcx140: Use modern ASoC DAI format terminology
      ASoC: tlv320aic23: Use modern ASoC DAI format terminology
      ASoC: tlv320aic26: Use modern ASoC DAI format terminology
      ASoC: tlv320aic31xx: Use modern ASoC DAI format terminology
      ASoC: tlv320aic32x4: Use modern ASoC DAI format terminology
      ASoC: tlv320aic33: Use modern ASoC DAI format terminology
      ASoC: tlv320dac3x: Use modern ASoC DAI format terminology
      ALSA: hda: cirrus: Add initial DSP support and firmware loading
      ASoC: Intel: soc-acpi and machine driver updates
      ASoC: Intel: avs: Machine boards and HDA codec support
      OPE support on Tegra210 and later
      ASoC: trivial changes for cppcheck warnings
      Switch to use internal PLL for iMCLK
      ASoC: Drop some i2c noop remove callbacks
      Add Machine driver support for nau8825, max98560 and rt5682s, rt1019
      ASoC: SOF: AMD/Mediatek updates for 5.20
      ASoC: ssm: Use modern ASoC DAI format terminology
      ASoC: DAI clocking terminology modernisation
      ASoC: harden SoundWire codec/machine drivers used on Intel platforms
      Specify clock provider directly to CPU DAIs
      ASoC: codecs: Series of fixes for realtek codecs used on RVPs
      ASoC: codecs: qualcomm move gain to S8_TLV
      ASoC: SOF: ipc3-dtrace: Handle race during initialization
      ASoC: SOF: Add support ctx_save with IPC4
      ASoC: wcd9335: Fix spurious event generation
      ASoC: hdmi-codec: Update to modern DAI terminology
      ASoC: wcd938x: Fix event generation for some controls
      ASoC: SOF: IPC4: Add topology, control and PCM ops
      ASoC: Merge fixes
      ASoC: ops: Don't modify the driver's plaform_max when reading state
      ASoC: ops: Fix boolean/integer detection for simple controls
      ASoC: SOF: Intel: Add support for MeteorLake
      ASoC: Add regmap_field helpers for simple bit operations
      ASoC: SOF/Intel: remove __func__ from dev_dbg()
      ASoC: minor kernel-doc corrections
      ASoC: Intel: Chromebooks: remap jack pins
      ASoC: SOF: Intel: fix resume from hibernate
      ASoC: SOF/soundwire: use resume_and_get on component probe
      remap: Some fixes for bulk read/write callbacks in regmap_config support
      ASoC: Merge fixes
      Add MT8186 ADSP dt-binding
      ASoC: rockchip: i2s: switch BCLK to GPIO
      ASoC: Intel: haswell and broadwell boards update
      ASoC: Merge up fixes
      ASoC: sun50i-codec-analog: Internal bias support
      ASoC: max98396: Some assorted fixes and additions
      ASoC: use pm_runtime_resume_and_get() when possible
      Add PDM/DSD/dataline configuration support
      ASoC: codecs: add WSA883x support
      ASoC: Refactor non_legacy_dai_naming flag
      ASoC: dt-bindings: Add bindings for WCD9335 DAIs
      ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
      Add support of two Audio PLL source
      I2S driver changes for Jadeite platform
      ASoC: cleanups and improvements for jz4740-i2s
      ASoC: Intel: sof_cs42l42: adding support for ADL configuration and BT offload
      ASoC: audio-graph-card2.c: make Codec2Codec settings optional
      ASoC: Merge up fixes
      ASoC: SOF: ipc4-topology: fix error and memory handling
      ADD legacy audio driver support for rembrandt
      ASoC: codecs: Series of fixes for realtek codecs used on RVPs
      ASoC: Intel: avs: Updates and cleanups
      ASoC: SOF: Intel: hda: Use cold/purge boot after firmware crash
      ASoC: SOF: Intel: hda-dai: No need to decouple host/link DMA twice
      ASoC: SOF: Intel: Do not process IPC reply before firmware boot
      Extend ipc stream parameters sent to DSP
      ASoC: SOF: Intel: hda: Correct Firmware State Register use
      ASoC/SoundWire: Intel: add sdw BE dai trigger
      ASoC: rockchip-i2s: Undo BCLK pinctrl changes
      ASoC: Merge up revert of v5.19 version of the rockchip BCLK management

Martin Povišer (1):
      ASoC: Introduce 'fixup_controls' card method

Mauro Carvalho Chehab (1):
      ASoC: wm8731: update wlf,wm8731.yaml reference

Miaoqian Lin (5):
      ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
      ASoC: samsung: Fix error handling in aries_audio_probe
      ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
      ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
      ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe

Minghao Chi (2):
      ASoC: mediatek: remove unnecessary check of clk_disable_unprepare
      ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable

Oder Chiou (1):
      ASoC: rt5640: Add the MICBIAS1 to the dapm routing

Peter Ujfalusi (27):
      ASoC: SOF: Intel: hda-dsp: Expose hda_dsp_core_power_up()
      ASoC: SOF: Intel: hda-loader: Make sure that the fw load sequence is followed
      ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow
      ASoC: SOF: ipc3-topology: Move and correct size checks in sof_ipc3_control_load_bytes()
      ASoC: SOF: make ctx_store and ctx_restore as optional
      ASoC: SOF: sof_ipc_pm_ops: Add support for DSP core power management
      ASoC: SOF: ipc3: Add set_core_state pm_ops implementation
      ASoC: SOF: ipc4: Add set_core_state pm_ops implementation
      ASoC: SOF: Intel: Switch to use the generic pm_ops.set_core_state
      ASoC: SOF: ipc4: implement pm ctx_save callback
      ASoC: SOF: ipc3-dtrace: Introduce SOF_DTRACE_INITIALIZING state
      ASoC: SOF: ipc3-dtrace: Add helper function to update the sdev->host_offset
      ASoC: SOF: ipc3-dtrace: Return from dtrace_read if there is no new data available
      ASoC: SOF: debug: Clarify the IPC timeout handling path
      ASoC: SOF: Compile and runtime IPC version selection
      ASoC: SOF: Intel: IPC4: enable IMR boot
      ASoC: SOF: Intel: hda: Fix compressed stream position tracking
      ASoC: twl4030: Drop legacy, non DT boot support
      ASoC: SOF: Intel: cnl: Do not process IPC reply before firmware boot
      ASoC: SOF: Intel: hda-ipc: Do not process IPC reply before firmware boot
      ASoC: SOF: Intel: mtl: Do not process IPC reply before firmware boot
      ASoC: SOF: Intel: hda: Introduce skip_imr_boot flag
      ASoC: SOF: Intel: hda: Correct the ROM/FW state reporting code
      ASoC: SOF: Intel: hda-dai: Drop misleading comment regarding dma_data
      ASoC: SOF: Intel: hda-dai: Do snd_hdac_ext_stream_decouple() only once
      ASoC: SOF: sof-client-probes: Only load the driver if IPC3 is used
      ASoC: SOF: ipc3-topology: Prevent double freeing of ipc_control_data via load_bytes

Pierre-Louis Bossart (74):
      ASoC: cs35l45: typo in argument definition
      ASoC: cs42l42: remove redundant test
      ASoC: wcd-mbhc-v2: remove useless initialization
      ASoC: wcd9335: remove redundant tests
      ASoC: Intel: atom: sst: remove useless initialization
      ASoC: Intel: atom: sst_ipc: remove redundant test
      ASoC: Intel: atom: sst_ipc: remove useless initializations
      ASoC: Intel: atom: controls: remove useless initializations
      ASoC: Intel: boards: reset acpi_chan_package
      ASoC: Intel: sof_pcm512x: remove unnecessary init
      ASoC: mediatek: mt8195: simplify error handling
      ASoC: qcom: q6dsp: q6adm: remove useless initializations
      ASoC: qcom: q6dsp: remove spurious space
      ASoC: rockchip: simplify error handling
      ASoC: samsung: snow: simplify error handling
      ASoC: meson: remove useless initialization
      ASoC: Intel: sof_sdw: allow HDaudio/HDMI disable
      ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove
      ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
      ASoC: Intel: sof_sdw: handle errors on card registration
      ASoC: rt711: fix calibrate mutex initialization
      ASoC: rt7*-sdw: harden jack_detect_handler
      ASoC: codecs: rt700/rt711/rt711-sdca: initialize workqueues in probe
      ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in .set_jack_detect
      ASoC: SOF: ipc3-dtrace: use pm_runtime_resume_and_get()
      MAINTAINERS: update ASoC/Intel/SOF maintainers
      ASoC: SOF: Intel: hda-dai: enhance debug messages
      ASoC: SOF: reduce default verbosity of IPC logs
      ASoC: SOF: pm: add explicit behavior for ACPI S1 and S2
      ASoC: SOF: pm: add definitions for S4 and S5 states
      ASoC: SOF: Intel: disable IMR boot when resuming from ACPI S4 and S5 states
      ASoC: cs4270: update kernel-doc
      ASoC: sunxi: sun4i-i2s: update kernel-doc
      ASoC: Intel: skl_nau88l25_max98357a: remap jack pins
      ASoC: Intel: skl_nau88l25_ssm4567: remap jack pins
      ASoC: Intel: kbl_rt5663_max98927: remap jack pins
      ASoC: Intel: kbl_da7219_max98357a: remap jack pins
      ASoC: Intel: kbl_da7219_max98927: remap jack pins
      ASoC: Intel: kbl_rt5663_rt5514_max98927: remap jack pins
      ASoC: Intel: bxt_da7219_max98357a: remap jack pins
      ASoC: Intel: glk_rt5682_max98357a: remap jack pins
      ASoC: Intel: cml_rt1011_rt5682: remap jack pins
      ASoC: Intel: sof_cs42l42: remap jack pins
      ASoC: Intel: sof_da7219_max98373: remap jack pins
      ASoC: Intel: sof_nau8825: remap jack pins
      ASoC: Intel: sof_rt5682: remap jack pins
      ASoC: SOF: Intel: hda-dsp: report error on power-up/down
      ASoC: SOF: Intel: hda-stream: report error on stream not opened
      ASoC: SOF: Intel: hda-dai: remove use of __func__ in dev_dbg
      ASoC: SOF: Intel: hda-stream: remove use of __func__ in dev_dbg
      ASoC: SOF: Intel: mtl: remove use of __func__ in dev_dbg
      ASoC: SOF: ipc3-dtrace: remove use of __func__ in dev_dbg
      ASoC: SOF: ipc3-loader: remove use of __func__ in dev_dbg
      ASoC: SOF: ipc3-topology: remove use of __func__ in dev_dbg
      ASoC: SOF: ipc4-topology remove use of __func__ in dev_dbg
      ASoC: SOF: sof-client: remove use of __func__ in dev_dbg
      ASoC: SOF: ipc4: remove use of __func__ in dev_dbg
      ASoC: Intel: boards: hda: remove use of __func__ in dev_dbg
      ASoC: Intel: boards: sof_sdw: remove use of __func__ in dev_dbg
      ASoC: SOF: pcm: use pm_resume_and_get() on component probe
      ASoC: codecs: soundwire: call pm_runtime_resume() in component probe
      ASoC: Intel: catpt: use pm_runtime_resume_and_get()
      ASoC: Intel: skylake: skl-pcm: use pm_runtime_resume_and_get()
      ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()
      ASoC: wsa881x: use pm_runtime_resume_and_get()
      ASoC: rockchip: i2s_tdm: use pm_runtime_resume_and_get()
      ASoC: fsl: fsl_sai: use pm_runtime_resume_and_get()
      ASoC: img: img-i2s-out: use pm_runtime_resume_and_get()
      ASoC: rockchip: pdm: use pm_runtime_resume_and_get()
      ASoC: tas2552: use pm_runtime_resume_and_get()
      ASoC: ti: davinci-mcasp: use pm_runtime_resume_and_get()
      ASoC: amd: acp-es8336: use static variables
      ASoC: SOF: remove warning on ABI checks
      ASoC: soc-pcm: demote warnings on non-atomic BE connection

Randy Dunlap (2):
      ASoC: max98390: use linux/gpio/consumer.h to fix build
      ASoC: amd: fix Jadeite kconfig warning and build errors

Ranjani Sridharan (23):
      ASoC: SOF: Add topology tokens for IPC4
      ASoC: SOF: IPC4: Introduce topology ops
      ASoC: SOF: ipc4-topology: Add support for parsing AIF_IN/AIF_OUT widgets
      ASoC: SOF: ipc4-topology: Add support for parsing DAI_IN/DAI_OUT widgets
      ASoC: SOF: ipc4-topology: Add prepare op for AIF type widgets
      ASoC: SOF: ipc4-topology: Add prepare op for DAI type widgets
      ASoC: SOF: ipc4-topology: Add support for parsing and preparing pga widgets
      ASoC: SOF: ipc4-topology: Add support for parsing mixer widgets
      ASoC: SOF: ipc4-topology: Add control_setup op
      ASoC: SOF: ipc4-topology: Add control IO ops
      ASoC: SOF: IPC4: Add pcm ops
      ASoC: SOF: ipc4-topology: Add widget_setup/widget_free ops
      ASoC: SOF: ipc4-topology: Add route_setup/route_free ops
      ASoC: SOF: ipc4-topology: Add the dai_config op
      ASoC: SOF: ipc4-pcm: Expose sof_ipc4_set_pipeline_state()
      ASoC: SOF: IPC4: set the BE DAI ops
      ASoC: SOF: Add ops_free
      ASoC: SOF: Intel: hda: init NHLT for IPC4
      ASoC: SOF: Add two new structures for topology manifest data
      ASoC: SOF: Add a new IPC op for parsing topology manifest
      ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's
      AsoC: SOF: ipc4-topology: Add dai_get_clk op
      ASoC: SOF: topology: remove unused variable

Raphael-Xu (2):
      ASoC: add tas2780 driver
      ASoC: add tas2780 DT binding

Sameer Pujar (5):
      ASoC: tegra: Add binding doc for OPE module
      ASoC: tegra: Add Tegra210 based OPE driver
      ASoC: tegra: AHUB routes for OPE module
      ASoC: tegra: Fix clock DAI format on Tegra210
      ASoC: tegra: Fix MBDRC bypass mode check

Sascha Hauer (2):
      ASoC: fsl_asrc_dma: Use dmaengine_terminate_async()
      ASoC: audio_graph_card2: Fix port numbers in example

Seven Lee (1):
      ASoC: nau8821: Add headset button detection

Shengjiu Wang (25):
      ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
      ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data
      ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
      ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX93 platform
      ASoC: fsl_mqs: Add support for i.MX93 platform
      ASoC: fsl_sai: Add PDM daifmt support
      ASoC: fsl_sai: Add DSD bit format support
      ASoC: fsl_sai: Add support for more sample rates
      ASoc: fsl_sai: Add pinctrl operation for PDM and DSD
      ASoC: fsl_sai: Make res a member of struct fsl_sai
      ASoC: dt-bindings: fsl-sai: Add new property to configure dataline
      ASoC: fsl_sai: Configure dataline/FIFO information from dts property
      ASoC: fsl_micfil: change micfil default settings
      ASoC: dt-bindings: fsl,micfil: Convert format to json-schema
      ASoC: fsl_micfil: Add legacy_dai_naming flag
      ASoC: fsl_asrc_dma: Add legacy_dai_naming flag
      ASoC: fsl_utils: Add function to handle PLL clock source
      ASoC: fsl_spdif: Add support for PLL switch at runtime.
      ASoC: fsl_micfil: Add support for PLL switch at runtime
      ASoC: fsl_sai: Add support for PLL switch at runtime
      ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
      ASoC: dt-bindings: fsl-sai: Add two PLL clock source
      ASoC: imx-card: Fix DSD/PDM mclk frequency
      ASoC: fsl_utils: Don't use plain integer as NULL pointer
      ASoC: fsl_utils: Drop usage of __clk_get_name()

Shuming Fan (1):
      ASoC: rt711-sdca: fix kernel NULL pointer dereference when IO error

Srinivas Kandagatla (11):
      ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
      ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
      ASoC: qdsp6: q6apm-dai: unprepare stream if its already prepared
      MAINTAINERS: update ASoC Qualcomm maintainer email-id
      ASoC: dt-bindings: Add WSA883x bindings
      ASoC: codecs: add wsa883x amplifier support
      MAINTAINERS: add ASoC Qualcomm codecs
      ASoC: codecs: wsa883x: add control, dapm widgets and map
      ASoC: codecs: wsa881x: handle timeouts in resume path
      ASoC: codecs: wsa883x: handle timeouts in resume path
      ASoC: codecs: wsa883x: add missing break statement

Srinivasa Rao Mandadapu (3):
      ASoC: qcom: soundwire: Add support for controlling audio CGCR from HLOS
      ASoC: qcom: lpass-platform: Update VMA access permissions in mmap callback
      ASoC: qcom: Add driver support for audioreach solution

Stefan Binding (4):
      ASoC: cs35l41: Move cs35l41 exit hibernate function into shared code
      ASoC: cs35l41: Add common cs35l41 enter hibernate function
      ASoC: cs35l41: Do not print error when waking from hibernation
      ASoC: ops: Fix integer detection for when max possible values > 1

Tang Bin (1):
      ASoC: stm32: sai: Remove useless define

Tinghan Shen (4):
      dt-bindings: dsp: mediatek: Use meaningful names for mbox
      firmware: mediatek: Use meaningful names for mbox
      dt-bindings: dsp: mediatek: Add mt8186 dsp document
      ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings

Tom Rix (2):
      ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
      ASoC: samsung: change neo1973_audio from a global to static

Uwe Kleine-König (17):
      ASoC: ak4642: Drop no-op remove function
      ASoC: da7219: Drop no-op remove function
      ASoC: lm49453: Drop no-op remove function
      ASoC: da732x: Drop no-op remove function
      ASoC: cs35l45: Make cs35l45_remove() return void
      ASoC: Intel: broadwell: Make broadwell_disable_jack() return void
      ASoC: simple-card-utils: Make asoc_simple_clean_reference() return void
      ASoC: core: Make snd_soc_unregister_card() return void
      ASoC: amd: acp: Fix error handling in .remove()
      ASoC: topology: KUnit: Followup prototype change of snd_soc_unregister_card()
      ASoC: xilinx: Suppress second error message about reset failure in .remove()
      ASoC: tegra: tegra20_das: Fold header file into only user
      ASoC: tegra: tegra20_das: Remove unused function tegra20_das_read
      ASoC: tegra: tegra20_das: Get rid of global pointer for driver data
      ASoC: tegra: tegra20_das: Make helper functions return void
      ASoC: tegra: tegra20_das: Drop write-only driver data member
      ASoC: rsnd: Emit useful error messages in .remove()

V sujith kumar Reddy (5):
      ASoC: amd: acp: Add support for nau8825 and max98360 card
      ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs instance
      ASoC: amd: acp: Remove rt1019_1 codec conf from machine driver
      ASoC: amd: acp: ACP code generic to support newer platforms
      ASoC: amd: acp: Add legacy audio driver support for Rembrandt platform

Vijendar Mukunda (7):
      ASoC: amd: add I2S MICSP instance support
      ASoC: amd: add Machine driver for Jadeite platform
      ASoC: amd: enable machine driver build for Jadeite platform
      ASoC: amd: fix ACPI dependency compile errors and warnings
      ASoC: amd: remove unused header file inclusion
      ASoC: amd: drop machine driver remove function
      ASoC: amd: fix for variable set but not used warning

YC Hung (4):
      ASoC: SOF: mediatek: revise mt8195 clock sequence
      ASoC: SOF: mediatek: Add shared_size for mediatek common chip information
      ASoC: SOF: mediatek: mt8195 modify dram type as non-cache
      ASoC: SOF: mediatek: mt8195 suspend check dsp idle

Yang Li (1):
      ASoC: amd: Remove duplicated include in acp-es8336.c

Yang Yingliang (1):
      ASoC: fsl: pcm030-audio-fabric: use platform_device_unregsiter()

Yassine Oudjana (3):
      ASoC: wcd9335: Remove RX channel from old list before adding it to a new one
      ASoC: dt-bindings: Add bindings for WCD9335 DAIs
      ASoC: wcd9335: Use DT bindings instead of local DAI definitions

Yong Zhi (2):
      ASoC: Intel: boards: rename RTL1019 compatible driver to rt1019p
      ASoC: intel: sof_sdw: add RT711 SDCA card for MTL platform

Zhongjun Tan (1):
      ASoC: mediatek: mt8186: Remove condition with no effect

Zhu Ning (1):
      ASoC: codes: Add support for ES8316 producer mode

xliu (1):
      ASoC: Intel: cirrus-common: fix incorrect channel mapping

zhangqilong (1):
      ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe

 .../bindings/dsp/mediatek,mt8186-dsp.yaml          |   91 +
 .../bindings/dsp/mediatek,mt8195-dsp.yaml          |   10 +-
 .../devicetree/bindings/sound/adi,max98396.yaml    |   30 +-
 .../sound/allwinner,sun50i-a64-codec-analog.yaml   |    5 +
 .../bindings/sound/atmel-sam9x5-wm8731-audio.txt   |    2 +-
 .../devicetree/bindings/sound/designware-i2s.txt   |   35 -
 .../devicetree/bindings/sound/fsl,micfil.txt       |   33 -
 .../devicetree/bindings/sound/fsl,micfil.yaml      |   85 +
 .../devicetree/bindings/sound/fsl,mqs.txt          |    2 +-
 .../devicetree/bindings/sound/fsl,spdif.yaml       |    4 +
 .../devicetree/bindings/sound/fsl-sai.txt          |   11 +
 .../devicetree/bindings/sound/nau8821.txt          |    2 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    4 +
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml      |   47 +
 .../bindings/sound/nvidia,tegra210-ope.yaml        |   87 +
 .../bindings/sound/nvidia,tegra210-peq.yaml        |   48 +
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |    1 +
 .../devicetree/bindings/sound/qcom,sdm845.txt      |   91 -
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    3 +
 .../devicetree/bindings/sound/qcom,wsa883x.yaml    |   74 +
 .../devicetree/bindings/sound/rockchip-i2s.yaml    |    7 +
 .../bindings/sound/snps,designware-i2s.yaml        |   94 +
 .../devicetree/bindings/sound/tas2780.yaml         |   72 +
 Documentation/process/kernel-docs.rst              |    2 +-
 Documentation/sound/soc/codec.rst                  |    2 +-
 Documentation/sound/soc/platform.rst               |    2 +-
 MAINTAINERS                                        |    5 +
 drivers/base/regmap/regmap.c                       |   37 +-
 drivers/firmware/mtk-adsp-ipc.c                    |   36 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    8 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    6 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    8 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    1 +
 drivers/media/i2c/tda1997x.c                       |    1 -
 drivers/soundwire/intel.c                          |   14 +-
 drivers/soundwire/qcom.c                           |   10 +
 include/dt-bindings/sound/qcom,wcd9335.h           |   15 +
 include/linux/regmap.h                             |   37 +
 include/linux/soundwire/sdw_intel.h                |    3 +
 include/sound/cs35l41.h                            |    3 +
 include/sound/hdmi-codec.h                         |    4 +-
 include/sound/madera-pdata.h                       |    2 +-
 include/sound/pcm.h                                |   19 +-
 include/sound/simple_card_utils.h                  |    5 +-
 include/sound/soc-acpi-intel-match.h               |    2 +
 include/sound/soc-card.h                           |    1 +
 include/sound/soc-component.h                      |    7 +-
 include/sound/soc-dai.h                            |    6 +
 include/sound/soc.h                                |   15 +-
 include/sound/sof.h                                |    1 +
 include/sound/sof/dai-amd.h                        |    7 +
 include/sound/sof/dai.h                            |    2 +-
 include/sound/sof/ipc4/header.h                    |    8 +
 include/sound/sof/stream.h                         |    6 +-
 include/uapi/sound/sof/abi.h                       |    4 +-
 include/uapi/sound/sof/header.h                    |   30 +
 include/uapi/sound/sof/tokens.h                    |   44 +
 sound/pci/ens1370.c                                |    2 +-
 sound/soc/adi/axi-i2s.c                            |    1 +
 sound/soc/adi/axi-spdif.c                          |    1 +
 sound/soc/amd/Kconfig                              |   12 +
 sound/soc/amd/Makefile                             |    2 +
 sound/soc/amd/acp-config.c                         |   30 +
 sound/soc/amd/acp-es8336.c                         |  318 +++
 sound/soc/amd/acp-pcm-dma.c                        |   50 +-
 sound/soc/amd/acp.h                                |   13 +
 sound/soc/amd/acp/Kconfig                          |   12 +
 sound/soc/amd/acp/Makefile                         |    2 +
 sound/soc/amd/acp/acp-i2s.c                        |  169 +-
 sound/soc/amd/acp/acp-legacy-mach.c                |   32 +
 sound/soc/amd/acp/acp-mach-common.c                |  301 +-
 sound/soc/amd/acp/acp-mach.h                       |    9 +
 sound/soc/amd/acp/acp-pci.c                        |    6 +
 sound/soc/amd/acp/acp-pdm.c                        |   10 +-
 sound/soc/amd/acp/acp-platform.c                   |   47 +-
 sound/soc/amd/acp/acp-rembrandt.c                  |  401 +++
 sound/soc/amd/acp/acp-renoir.c                     |   48 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   30 +
 sound/soc/amd/acp/amd.h                            |   86 +-
 sound/soc/amd/acp/chip_offset_byte.h               |   40 +-
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/amd/raven/acp3x-i2s.c                    |    3 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |   13 +-
 sound/soc/amd/vangogh/acp5x-i2s.c                  |    5 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |   13 +-
 sound/soc/atmel/atmel-classd.c                     |    1 +
 sound/soc/atmel/atmel-i2s.c                        |    7 +-
 sound/soc/atmel/atmel-pdmic.c                      |    1 +
 sound/soc/atmel/atmel_ssc_dai.c                    |   25 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   11 +-
 sound/soc/atmel/mchp-pdmc.c                        |    7 +-
 sound/soc/atmel/mchp-spdifrx.c                     |    3 +-
 sound/soc/atmel/mchp-spdiftx.c                     |    3 +-
 sound/soc/atmel/mikroe-proto.c                     |    4 +-
 sound/soc/au1x/ac97c.c                             |    3 +-
 sound/soc/au1x/i2sc.c                              |    5 +-
 sound/soc/au1x/psc-ac97.c                          |    3 +-
 sound/soc/au1x/psc-i2s.c                           |    7 +-
 sound/soc/bcm/bcm2835-i2s.c                        |   23 +-
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |    1 +
 sound/soc/bcm/cygnus-ssp.c                         |   11 +-
 sound/soc/cirrus/ep93xx-ac97.c                     |    3 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |   11 +-
 sound/soc/codecs/88pm860x-codec.c                  |    1 -
 sound/soc/codecs/Kconfig                           |   28 +
 sound/soc/codecs/Makefile                          |    6 +
 sound/soc/codecs/ab8500-codec.c                    |    3 -
 sound/soc/codecs/ab8500-codec.h                    |    2 -
 sound/soc/codecs/ac97.c                            |    1 -
 sound/soc/codecs/ad1836.c                          |    1 -
 sound/soc/codecs/ad193x.c                          |    1 -
 sound/soc/codecs/ad1980.c                          |    1 -
 sound/soc/codecs/ad73311.c                         |    1 -
 sound/soc/codecs/adau1373.c                        |    1 -
 sound/soc/codecs/adau1701.c                        |    1 -
 sound/soc/codecs/adau1761.c                        |    1 -
 sound/soc/codecs/adau1781.c                        |    1 -
 sound/soc/codecs/adau1977.c                        |    1 -
 sound/soc/codecs/adau7002.c                        |    1 -
 sound/soc/codecs/adau7118.c                        |    1 -
 sound/soc/codecs/adav80x.c                         |    1 -
 sound/soc/codecs/ads117x.c                         |    1 -
 sound/soc/codecs/ak4104.c                          |    1 -
 sound/soc/codecs/ak4118.c                          |    1 -
 sound/soc/codecs/ak4375.c                          |    1 -
 sound/soc/codecs/ak4458.c                          |    2 -
 sound/soc/codecs/ak4535.c                          |    1 -
 sound/soc/codecs/ak4554.c                          |    1 -
 sound/soc/codecs/ak4613.c                          |    7 -
 sound/soc/codecs/ak4641.c                          |    1 -
 sound/soc/codecs/ak4642.c                          |    1 -
 sound/soc/codecs/ak4671.c                          |    1 -
 sound/soc/codecs/ak5386.c                          |    1 -
 sound/soc/codecs/ak5558.c                          |    2 -
 sound/soc/codecs/alc5623.c                         |    1 -
 sound/soc/codecs/alc5632.c                         |    1 -
 sound/soc/codecs/bd28623.c                         |    1 -
 sound/soc/codecs/bt-sco.c                          |    1 -
 sound/soc/codecs/cpcap.c                           |    1 -
 sound/soc/codecs/cq93vc.c                          |    1 -
 sound/soc/codecs/cros_ec_codec.c                   |    1 +
 sound/soc/codecs/cs35l32.c                         |    1 -
 sound/soc/codecs/cs35l33.c                         |    1 -
 sound/soc/codecs/cs35l34.c                         |    1 -
 sound/soc/codecs/cs35l35.c                         |    1 -
 sound/soc/codecs/cs35l36.c                         |    1 -
 sound/soc/codecs/cs35l41-lib.c                     |   82 +-
 sound/soc/codecs/cs35l41-spi.c                     |    1 +
 sound/soc/codecs/cs35l41.c                         |   71 +-
 sound/soc/codecs/cs35l45-i2c.c                     |    4 +-
 sound/soc/codecs/cs35l45.c                         |    6 +-
 sound/soc/codecs/cs35l45.h                         |    4 +-
 sound/soc/codecs/cs4234.c                          |    1 -
 sound/soc/codecs/cs4265.c                          |    1 -
 sound/soc/codecs/cs4270.c                          |    2 -
 sound/soc/codecs/cs4271.c                          |    1 -
 sound/soc/codecs/cs42l42.c                         |    4 +-
 sound/soc/codecs/cs42l51.c                         |    1 -
 sound/soc/codecs/cs42l52.c                         |    1 -
 sound/soc/codecs/cs42l56.c                         |    1 -
 sound/soc/codecs/cs42l73.c                         |    1 -
 sound/soc/codecs/cs42xx8.c                         |    1 -
 sound/soc/codecs/cs43130.c                         |    1 -
 sound/soc/codecs/cs4341.c                          |    1 -
 sound/soc/codecs/cs4349.c                          |    1 -
 sound/soc/codecs/cs47l15.c                         |    1 -
 sound/soc/codecs/cs47l24.c                         |    1 -
 sound/soc/codecs/cs47l35.c                         |    1 -
 sound/soc/codecs/cs47l85.c                         |    1 -
 sound/soc/codecs/cs47l90.c                         |    1 -
 sound/soc/codecs/cs47l92.c                         |    1 -
 sound/soc/codecs/cs53l30.c                         |    1 -
 sound/soc/codecs/cx20442.c                         |    1 -
 sound/soc/codecs/cx2072x.c                         |   17 +-
 sound/soc/codecs/da7210.c                          |    3 +-
 sound/soc/codecs/da7213.c                          |    1 -
 sound/soc/codecs/da7218.c                          |    1 -
 sound/soc/codecs/da7219.c                          |    7 -
 sound/soc/codecs/da732x.c                          |    7 -
 sound/soc/codecs/da9055.c                          |    1 -
 sound/soc/codecs/dmic.c                            |    1 -
 sound/soc/codecs/es7134.c                          |    1 -
 sound/soc/codecs/es7241.c                          |    1 -
 sound/soc/codecs/es8316.c                          |   21 +-
 sound/soc/codecs/es8328.c                          |    1 -
 sound/soc/codecs/gtm601.c                          |    1 -
 sound/soc/codecs/hda-dai.c                         |  102 +
 sound/soc/codecs/hda.c                             |  395 +++
 sound/soc/codecs/hda.h                             |   19 +
 sound/soc/codecs/hdac_hdmi.c                       |    1 -
 sound/soc/codecs/hdmi-codec.c                      |   19 +-
 sound/soc/codecs/ics43432.c                        |    1 -
 sound/soc/codecs/inno_rk3036.c                     |    1 -
 sound/soc/codecs/isabelle.c                        |    1 -
 sound/soc/codecs/jz4740.c                          |    2 -
 sound/soc/codecs/lm49453.c                         |    7 -
 sound/soc/codecs/lochnagar-sc.c                    |    1 -
 sound/soc/codecs/max98088.c                        |   33 +-
 sound/soc/codecs/max98090.c                        |   13 +-
 sound/soc/codecs/max98095.c                        |    1 -
 sound/soc/codecs/max98357a.c                       |    1 -
 sound/soc/codecs/max98371.c                        |    1 -
 sound/soc/codecs/max98373.c                        |   16 +-
 sound/soc/codecs/max98390.c                        |    3 +-
 sound/soc/codecs/max98396.c                        |  271 +-
 sound/soc/codecs/max98396.h                        |   10 +-
 sound/soc/codecs/max9850.c                         |    1 -
 sound/soc/codecs/max98520.c                        |    1 -
 sound/soc/codecs/max9860.c                         |    7 +-
 sound/soc/codecs/max9867.c                         |    1 -
 sound/soc/codecs/max98925.c                        |    1 -
 sound/soc/codecs/max98926.c                        |    1 -
 sound/soc/codecs/max98927.c                        |    1 -
 sound/soc/codecs/mc13783.c                         |    1 -
 sound/soc/codecs/ml26124.c                         |    1 -
 sound/soc/codecs/msm8916-wcd-analog.c              |    1 -
 sound/soc/codecs/msm8916-wcd-digital.c             |   47 +-
 sound/soc/codecs/mt6358.c                          |    1 +
 sound/soc/codecs/mt6359-accdet.c                   |    1 +
 sound/soc/codecs/mt6359.c                          |    1 +
 sound/soc/codecs/nau8315.c                         |    1 -
 sound/soc/codecs/nau8540.c                         |    1 -
 sound/soc/codecs/nau8810.c                         |    1 -
 sound/soc/codecs/nau8821.c                         |   36 +-
 sound/soc/codecs/nau8821.h                         |    1 +
 sound/soc/codecs/nau8822.c                         |   15 +-
 sound/soc/codecs/nau8822.h                         |    2 +
 sound/soc/codecs/nau8824.c                         |    1 -
 sound/soc/codecs/nau8825.c                         |    3 +-
 sound/soc/codecs/pcm1681.c                         |    1 -
 sound/soc/codecs/pcm1789.c                         |    1 -
 sound/soc/codecs/pcm179x.c                         |    1 -
 sound/soc/codecs/pcm186x.c                         |    2 -
 sound/soc/codecs/pcm3008.c                         |    1 -
 sound/soc/codecs/pcm3168a.c                        |    1 -
 sound/soc/codecs/pcm5102a.c                        |    1 -
 sound/soc/codecs/pcm512x.c                         |    1 -
 sound/soc/codecs/rk3328_codec.c                    |    6 +-
 sound/soc/codecs/rk817_codec.c                     |    1 -
 sound/soc/codecs/rt1011.c                          |    1 -
 sound/soc/codecs/rt1015.c                          |    1 -
 sound/soc/codecs/rt1015p.c                         |    1 -
 sound/soc/codecs/rt1016.c                          |    1 -
 sound/soc/codecs/rt1019.c                          |    1 -
 sound/soc/codecs/rt1305.c                          |    1 -
 sound/soc/codecs/rt1308-sdw.c                      |   12 +
 sound/soc/codecs/rt1308.c                          |    1 -
 sound/soc/codecs/rt1316-sdw.c                      |   12 +
 sound/soc/codecs/rt274.c                           |   11 +-
 sound/soc/codecs/rt286.c                           |   19 +-
 sound/soc/codecs/rt286.h                           |    2 -
 sound/soc/codecs/rt298.c                           |   61 +-
 sound/soc/codecs/rt298.h                           |    2 -
 sound/soc/codecs/rt5514.c                          |    1 -
 sound/soc/codecs/rt5616.c                          |    1 -
 sound/soc/codecs/rt5631.c                          |    1 -
 sound/soc/codecs/rt5640.c                          |   13 +-
 sound/soc/codecs/rt5645.c                          |    1 -
 sound/soc/codecs/rt5651.c                          |    1 -
 sound/soc/codecs/rt5659.c                          |    1 -
 sound/soc/codecs/rt5660.c                          |    1 -
 sound/soc/codecs/rt5663.c                          |    1 -
 sound/soc/codecs/rt5665.c                          |    1 -
 sound/soc/codecs/rt5668.c                          |    1 -
 sound/soc/codecs/rt5670.c                          |    1 -
 sound/soc/codecs/rt5677.c                          |    1 -
 sound/soc/codecs/rt5682.c                          |    1 -
 sound/soc/codecs/rt5682s.c                         |    1 -
 sound/soc/codecs/rt700.c                           |    5 +
 sound/soc/codecs/rt711-sdca.c                      |    5 +
 sound/soc/codecs/rt711.c                           |    5 +
 sound/soc/codecs/rt715-sdca.c                      |   12 +
 sound/soc/codecs/rt715.c                           |   12 +
 sound/soc/codecs/sgtl5000.c                        |    1 -
 sound/soc/codecs/si476x.c                          |    1 -
 sound/soc/codecs/spdif_receiver.c                  |    1 -
 sound/soc/codecs/spdif_transmitter.c               |    1 -
 sound/soc/codecs/ssm2518.c                         |    5 +-
 sound/soc/codecs/ssm2602.c                         |    7 +-
 sound/soc/codecs/ssm4567.c                         |    5 +-
 sound/soc/codecs/sta32x.c                          |    5 +-
 sound/soc/codecs/sta350.c                          |    5 +-
 sound/soc/codecs/sta529.c                          |    1 -
 sound/soc/codecs/stac9766.c                        |    2 -
 sound/soc/codecs/sti-sas.c                         |    7 +-
 sound/soc/codecs/tas2552.c                         |   13 +-
 sound/soc/codecs/tas2562.c                         |    2 -
 sound/soc/codecs/tas2764.c                         |    1 -
 sound/soc/codecs/tas2770.c                         |    7 +-
 sound/soc/codecs/tas2780.c                         |  663 +++++
 sound/soc/codecs/tas2780.h                         |  101 +
 sound/soc/codecs/tas5086.c                         |    3 +-
 sound/soc/codecs/tas571x.c                         |    1 -
 sound/soc/codecs/tas5720.c                         |    6 +-
 sound/soc/codecs/tas5805m.c                        |    1 -
 sound/soc/codecs/tas6424.c                         |    7 +-
 sound/soc/codecs/tfa9879.c                         |    5 +-
 sound/soc/codecs/tfa989x.c                         |   31 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    3 +-
 sound/soc/codecs/tlv320adcx140.c                   |   11 +-
 sound/soc/codecs/tlv320aic23.c                     |    8 +-
 sound/soc/codecs/tlv320aic26.c                     |   16 +-
 sound/soc/codecs/tlv320aic31xx.c                   |   20 +-
 sound/soc/codecs/tlv320aic32x4.c                   |   11 +-
 sound/soc/codecs/tlv320aic3x.c                     |   12 +-
 sound/soc/codecs/tlv320dac33.c                     |   13 +-
 sound/soc/codecs/tscs42xx.c                        |    1 -
 sound/soc/codecs/twl4030.c                         |  102 +-
 sound/soc/codecs/twl6040.c                         |    1 -
 sound/soc/codecs/uda1334.c                         |    3 +-
 sound/soc/codecs/uda134x.c                         |    1 -
 sound/soc/codecs/uda1380.c                         |    1 -
 sound/soc/codecs/wcd-mbhc-v2.c                     |   12 +-
 sound/soc/codecs/wcd9335.c                         |   98 +-
 sound/soc/codecs/wl1273.c                          |    1 -
 sound/soc/codecs/wm0010.c                          |    1 -
 sound/soc/codecs/wm1250-ev1.c                      |    1 -
 sound/soc/codecs/wm2000.c                          |    1 -
 sound/soc/codecs/wm2200.c                          |    1 -
 sound/soc/codecs/wm5100.c                          |    1 -
 sound/soc/codecs/wm5102.c                          |    1 -
 sound/soc/codecs/wm5110.c                          |    1 -
 sound/soc/codecs/wm8350.c                          |    1 -
 sound/soc/codecs/wm8400.c                          |    1 -
 sound/soc/codecs/wm8510.c                          |    1 -
 sound/soc/codecs/wm8523.c                          |    1 -
 sound/soc/codecs/wm8524.c                          |    1 -
 sound/soc/codecs/wm8580.c                          |    1 -
 sound/soc/codecs/wm8711.c                          |    1 -
 sound/soc/codecs/wm8727.c                          |    1 -
 sound/soc/codecs/wm8728.c                          |    1 -
 sound/soc/codecs/wm8731.c                          |    1 -
 sound/soc/codecs/wm8737.c                          |    1 -
 sound/soc/codecs/wm8741.c                          |    1 -
 sound/soc/codecs/wm8750.c                          |    1 -
 sound/soc/codecs/wm8753.c                          |    1 -
 sound/soc/codecs/wm8770.c                          |    1 -
 sound/soc/codecs/wm8776.c                          |    1 -
 sound/soc/codecs/wm8782.c                          |    1 -
 sound/soc/codecs/wm8804.c                          |    1 -
 sound/soc/codecs/wm8900.c                          |    1 -
 sound/soc/codecs/wm8903.c                          |    1 -
 sound/soc/codecs/wm8904.c                          |    1 -
 sound/soc/codecs/wm8940.c                          |    1 -
 sound/soc/codecs/wm8955.c                          |    1 -
 sound/soc/codecs/wm8960.c                          |    1 -
 sound/soc/codecs/wm8961.c                          |    1 -
 sound/soc/codecs/wm8962.c                          |    1 -
 sound/soc/codecs/wm8971.c                          |    1 -
 sound/soc/codecs/wm8974.c                          |    1 -
 sound/soc/codecs/wm8978.c                          |    1 -
 sound/soc/codecs/wm8983.c                          |    1 -
 sound/soc/codecs/wm8985.c                          |    1 -
 sound/soc/codecs/wm8988.c                          |    1 -
 sound/soc/codecs/wm8990.c                          |    1 -
 sound/soc/codecs/wm8991.c                          |    1 -
 sound/soc/codecs/wm8993.c                          |    1 -
 sound/soc/codecs/wm8994.c                          |    1 -
 sound/soc/codecs/wm8995.c                          |    1 -
 sound/soc/codecs/wm8996.c                          |    2 -
 sound/soc/codecs/wm8997.c                          |    1 -
 sound/soc/codecs/wm8998.c                          |    1 -
 sound/soc/codecs/wm9081.c                          |    1 -
 sound/soc/codecs/wm9090.c                          |    1 -
 sound/soc/codecs/wm9705.c                          |    1 -
 sound/soc/codecs/wm9712.c                          |    1 -
 sound/soc/codecs/wm9713.c                          |    1 -
 sound/soc/codecs/wm_adsp.c                         |   25 +-
 sound/soc/codecs/wsa881x.c                         |   16 +-
 sound/soc/codecs/wsa883x.c                         | 1511 ++++++++++
 sound/soc/codecs/zl38060.c                         |    1 -
 sound/soc/dwc/dwc-i2s.c                            |   15 +-
 sound/soc/fsl/Kconfig                              |    3 +
 sound/soc/fsl/fsl_asrc_dma.c                       |   19 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    3 +-
 sound/soc/fsl/fsl_audmix.c                         |    6 +-
 sound/soc/fsl/fsl_easrc.c                          |    7 +-
 sound/soc/fsl/fsl_esai.c                           |   11 +-
 sound/soc/fsl/fsl_micfil.c                         |   55 +-
 sound/soc/fsl/fsl_micfil.h                         |    9 +
 sound/soc/fsl/fsl_mqs.c                            |  136 +-
 sound/soc/fsl/fsl_rpmsg.c                          |    3 +-
 sound/soc/fsl/fsl_sai.c                            |  375 ++-
 sound/soc/fsl/fsl_sai.h                            |   28 +-
 sound/soc/fsl/fsl_spdif.c                          |   51 +-
 sound/soc/fsl/fsl_ssi.c                            |   23 +-
 sound/soc/fsl/fsl_utils.c                          |   69 +
 sound/soc/fsl/fsl_utils.h                          |    7 +
 sound/soc/fsl/fsl_xcvr.c                           |   12 +-
 sound/soc/fsl/imx-audmix.c                         |    4 +-
 sound/soc/fsl/imx-audmux.c                         |   24 +-
 sound/soc/fsl/imx-card.c                           |   16 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |    3 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |    8 +-
 .../generic/audio-graph-card2-custom-sample.dtsi   |  101 +-
 sound/soc/generic/audio-graph-card2.c              |   74 +-
 sound/soc/generic/simple-card-utils.c              |   44 +-
 sound/soc/generic/test-component.c                 |   20 +-
 sound/soc/hisilicon/hi6210-i2s.c                   |   19 +-
 sound/soc/img/img-i2s-in.c                         |    7 +-
 sound/soc/img/img-i2s-out.c                        |   21 +-
 sound/soc/img/img-parallel-out.c                   |    3 +-
 sound/soc/img/img-spdif-in.c                       |    3 +-
 sound/soc/img/img-spdif-out.c                      |    3 +-
 sound/soc/img/pistachio-internal-dac.c             |    1 -
 sound/soc/intel/Kconfig                            |    5 +-
 sound/soc/intel/atom/sst-atom-controls.c           |    8 +-
 sound/soc/intel/atom/sst/sst.c                     |    2 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |    8 +-
 sound/soc/intel/avs/Makefile                       |    3 +
 sound/soc/intel/avs/boards/Kconfig                 |  121 +
 sound/soc/intel/avs/boards/Makefile                |   27 +
 sound/soc/intel/avs/boards/da7219.c                |  282 ++
 sound/soc/intel/avs/boards/dmic.c                  |   93 +
 sound/soc/intel/avs/boards/hdaudio.c               |  294 ++
 sound/soc/intel/avs/boards/i2s_test.c              |  180 ++
 sound/soc/intel/avs/boards/max98357a.c             |  154 ++
 sound/soc/intel/avs/boards/max98373.c              |  239 ++
 sound/soc/intel/avs/boards/nau8825.c               |  353 +++
 sound/soc/intel/avs/boards/rt274.c                 |  310 +++
 sound/soc/intel/avs/boards/rt286.c                 |  281 ++
 sound/soc/intel/avs/boards/rt298.c                 |  281 ++
 sound/soc/intel/avs/boards/rt5682.c                |  340 +++
 sound/soc/intel/avs/boards/ssm4567.c               |  271 ++
 sound/soc/intel/avs/cldma.c                        |   12 +-
 sound/soc/intel/avs/core.c                         |   13 +-
 sound/soc/intel/avs/dsp.c                          |   11 +-
 sound/soc/intel/avs/ipc.c                          |    1 +
 sound/soc/intel/avs/loader.c                       |    2 +-
 sound/soc/intel/avs/messages.c                     |   18 +-
 sound/soc/intel/avs/pcm.c                          |    2 -
 sound/soc/intel/avs/topology.c                     |   27 +
 sound/soc/intel/boards/Kconfig                     |    5 +-
 sound/soc/intel/boards/Makefile                    |    4 +-
 sound/soc/intel/boards/bdw_rt286.c                 |  279 ++
 sound/soc/intel/boards/broadwell.c                 |  336 ---
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   21 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    2 +-
 sound/soc/intel/boards/bytcht_da7213.c             |    2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    2 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |    2 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    4 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    4 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    3 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    8 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    2 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |   23 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   21 +-
 sound/soc/intel/boards/haswell.c                   |  202 --
 sound/soc/intel/boards/hda_dsp_common.c            |    4 +-
 sound/soc/intel/boards/hsw_rt5640.c                |  176 ++
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |   21 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   21 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |   21 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   21 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    4 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |   19 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |   19 +-
 sound/soc/intel/boards/skl_rt286.c                 |    2 +-
 sound/soc/intel/boards/sof_cs42l42.c               |  109 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |   23 +-
 sound/soc/intel/boards/sof_nau8825.c               |   23 +-
 sound/soc/intel/boards/sof_pcm512x.c               |    2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   24 +-
 sound/soc/intel/boards/sof_realtek_common.h        |    6 +-
 sound/soc/intel/boards/sof_rt5682.c                |   25 +-
 sound/soc/intel/boards/sof_sdw.c                   |   34 +-
 sound/soc/intel/catpt/device.c                     |    5 +-
 sound/soc/intel/catpt/pcm.c                        |   26 +-
 sound/soc/intel/catpt/sysfs.c                      |    4 +-
 sound/soc/intel/common/Makefile                    |    1 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |    7 +
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c    |    6 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   72 +
 sound/soc/intel/keembay/kmb_platform.c             |   18 +-
 sound/soc/intel/skylake/skl-pcm.c                  |    5 +-
 sound/soc/intel/skylake/skl-topology.c             |    6 -
 sound/soc/jz4740/Kconfig                           |    2 +-
 sound/soc/jz4740/jz4740-i2s.c                      |   43 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c          |    6 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    9 +-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c         |  651 +++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h         |  106 +
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |  243 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h        |   19 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c      |  150 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h      |   15 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h    |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c        |  871 ++++++
 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c    |  298 ++
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c     |  236 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c         | 1286 +++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c         |  423 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c         |  695 +++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c         |  698 +++++
 sound/soc/mediatek/mt8186/mt8186-interconnection.h |   69 +
 sound/soc/mediatek/mt8186/mt8186-misc-control.c    |  252 ++
 sound/soc/mediatek/mt8186/mt8186-reg.h             | 2913 ++++++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |    8 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |    6 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c         |    6 +-
 sound/soc/meson/aiu-acodec-ctrl.c                  |    1 -
 sound/soc/meson/aiu-codec-ctrl.c                   |    1 -
 sound/soc/meson/aiu-encoder-i2s.c                  |    2 +-
 sound/soc/meson/axg-frddr.c                        |    3 +
 sound/soc/meson/axg-pdm.c                          |    4 +-
 sound/soc/meson/axg-spdifin.c                      |    1 +
 sound/soc/meson/axg-spdifout.c                     |    1 +
 sound/soc/meson/axg-tdm-interface.c                |   14 +-
 sound/soc/meson/axg-toddr.c                        |    3 +
 sound/soc/meson/g12a-toacodec.c                    |    2 -
 sound/soc/meson/g12a-tohdmitx.c                    |    1 -
 sound/soc/meson/meson-codec-glue.c                 |    2 +-
 sound/soc/meson/t9015.c                            |    1 -
 sound/soc/mxs/mxs-saif.c                           |    7 +-
 sound/soc/pxa/magician.c                           |    8 +-
 sound/soc/pxa/mmp-sspa.c                           |   15 +-
 sound/soc/pxa/pxa-ssp.c                            |   43 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   27 +-
 sound/soc/qcom/apq8016_sbc.c                       |    2 +-
 sound/soc/qcom/lpass-apq8016.c                     |    1 +
 sound/soc/qcom/lpass-cpu.c                         |    7 +
 sound/soc/qcom/qdsp6/audioreach.c                  |    4 +-
 sound/soc/qcom/qdsp6/q6adm.c                       |    6 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |    6 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |   23 +-
 sound/soc/qcom/sc7180.c                            |    2 +-
 sound/soc/qcom/sc7280.c                            |   33 +
 sound/soc/qcom/sdm845.c                            |    6 +-
 sound/soc/qcom/sm8250.c                            |    4 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |    4 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   98 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |   13 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    7 +-
 sound/soc/rockchip/rockchip_spdif.c                |    1 +
 sound/soc/samsung/Kconfig                          |   20 +-
 sound/soc/samsung/aries_wm8994.c                   |    7 +-
 sound/soc/samsung/h1940_uda1380.c                  |    2 +-
 sound/soc/samsung/i2s.c                            |    8 +-
 sound/soc/samsung/neo1973_wm8753.c                 |    2 +-
 sound/soc/samsung/pcm.c                            |    7 +-
 sound/soc/samsung/rx1950_uda1380.c                 |    4 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |   17 +-
 sound/soc/samsung/s3c2412-i2s.c                    |    7 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |   14 +-
 sound/soc/samsung/snow.c                           |    2 +-
 sound/soc/samsung/spdif.c                          |    7 +-
 sound/soc/sh/fsi.c                                 |    6 +-
 sound/soc/sh/hac.c                                 |    3 +-
 sound/soc/sh/rcar/core.c                           |   30 +-
 sound/soc/sh/rcar/ssiu.c                           |    2 +
 sound/soc/sh/rz-ssi.c                              |   11 +-
 sound/soc/sh/siu_pcm.c                             |   17 +-
 sound/soc/sh/ssi.c                                 |   13 +-
 sound/soc/soc-card.c                               |    6 +
 sound/soc/soc-core.c                               |  167 +-
 sound/soc/soc-dai.c                                |    3 +-
 sound/soc/soc-dapm.c                               |   10 +-
 sound/soc/soc-ops.c                                |   51 +-
 sound/soc/soc-pcm.c                                |    3 +-
 sound/soc/soc-topology-test.c                      |   37 +-
 sound/soc/soc-utils.c                              |    1 -
 sound/soc/sof/Kconfig                              |    7 +
 sound/soc/sof/Makefile                             |   16 +-
 sound/soc/sof/amd/Kconfig                          |    1 +
 sound/soc/sof/amd/acp-dsp-offset.h                 |    2 +
 sound/soc/sof/amd/acp.c                            |   36 +
 sound/soc/sof/amd/acp.h                            |    4 +
 sound/soc/sof/amd/pci-rn.c                         |    4 +
 sound/soc/sof/amd/renoir.c                         |    4 +
 sound/soc/sof/compress.c                           |   73 +-
 sound/soc/sof/core.c                               |    7 +-
 sound/soc/sof/debug.c                              |    5 +-
 sound/soc/sof/imx/Kconfig                          |    1 +
 sound/soc/sof/intel/Kconfig                        |   27 +
 sound/soc/sof/intel/Makefile                       |    4 +-
 sound/soc/sof/intel/apl.c                          |    1 +
 sound/soc/sof/intel/bdw.c                          |    7 +-
 sound/soc/sof/intel/byt.c                          |    5 +-
 sound/soc/sof/intel/cnl.c                          |   39 +-
 sound/soc/sof/intel/hda-dai.c                      |  226 +-
 sound/soc/sof/intel/hda-dsp.c                      |   26 +-
 sound/soc/sof/intel/hda-ipc.c                      |   39 +-
 sound/soc/sof/intel/hda-loader.c                   |   28 +-
 sound/soc/sof/intel/hda-stream.c                   |    6 +-
 sound/soc/sof/intel/hda.c                          |  149 +-
 sound/soc/sof/intel/hda.h                          |   70 +
 sound/soc/sof/intel/icl.c                          |    1 +
 sound/soc/sof/intel/mtl.c                          |  805 ++++++
 sound/soc/sof/intel/mtl.h                          |   76 +
 sound/soc/sof/intel/pci-apl.c                      |    1 +
 sound/soc/sof/intel/pci-cnl.c                      |    1 +
 sound/soc/sof/intel/pci-icl.c                      |    1 +
 sound/soc/sof/intel/pci-mtl.c                      |   71 +
 sound/soc/sof/intel/pci-tgl.c                      |    1 +
 sound/soc/sof/intel/shim.h                         |    2 +
 sound/soc/sof/intel/tgl.c                          |   34 +-
 sound/soc/sof/ipc.c                                |   24 +-
 sound/soc/sof/ipc3-dtrace.c                        |   55 +-
 sound/soc/sof/ipc3-loader.c                        |   11 +-
 sound/soc/sof/ipc3-pcm.c                           |    8 +-
 sound/soc/sof/ipc3-topology.c                      |   73 +-
 sound/soc/sof/ipc3.c                               |   36 +-
 sound/soc/sof/ipc4-control.c                       |  216 ++
 sound/soc/sof/ipc4-pcm.c                           |  230 ++
 sound/soc/sof/ipc4-priv.h                          |    7 +
 sound/soc/sof/ipc4-topology.c                      | 1811 ++++++++++++
 sound/soc/sof/ipc4-topology.h                      |  245 ++
 sound/soc/sof/ipc4.c                               |   45 +-
 sound/soc/sof/mediatek/Kconfig                     |    1 +
 sound/soc/sof/mediatek/adsp_helper.h               |    1 +
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c         |    4 +-
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c         |    7 +
 sound/soc/sof/mediatek/mt8195/mt8195.c             |   50 +-
 sound/soc/sof/mediatek/mt8195/mt8195.h             |    5 +
 sound/soc/sof/ops.h                                |    6 +
 sound/soc/sof/pcm.c                                |   13 +
 sound/soc/sof/sof-audio.h                          |   12 +
 sound/soc/sof/sof-client-ipc-msg-injector.c        |   29 +-
 sound/soc/sof/sof-client-probes.c                  |    5 +
 sound/soc/sof/sof-client.c                         |    4 +-
 sound/soc/sof/sof-priv.h                           |   14 +-
 sound/soc/sof/topology.c                           |  121 +-
 sound/soc/spear/spdif_in.c                         |    3 +-
 sound/soc/spear/spdif_out.c                        |    3 +-
 sound/soc/sti/sti_uniperif.c                       |    3 +-
 sound/soc/stm/stm32_adfsdm.c                       |    3 +-
 sound/soc/stm/stm32_i2s.c                          |    9 +-
 sound/soc/stm/stm32_sai_sub.c                      |   11 +-
 sound/soc/stm/stm32_spdifrx.c                      |    1 +
 sound/soc/sunxi/sun4i-codec.c                      |   85 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   23 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    3 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |    8 +
 sound/soc/sunxi/sun8i-codec.c                      |    7 +-
 sound/soc/tegra/Kconfig                            |    9 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra20_ac97.c                     |    5 +-
 sound/soc/tegra/tegra20_das.c                      |  198 +-
 sound/soc/tegra/tegra20_das.h                      |  120 -
 sound/soc/tegra/tegra20_i2s.c                      |    9 +-
 sound/soc/tegra/tegra20_spdif.c                    |    1 +
 sound/soc/tegra/tegra210_adx.c                     |    2 +-
 sound/soc/tegra/tegra210_ahub.c                    |   39 +-
 sound/soc/tegra/tegra210_i2s.c                     |    7 +-
 sound/soc/tegra/tegra210_mbdrc.c                   | 1014 +++++++
 sound/soc/tegra/tegra210_mbdrc.h                   |  215 ++
 sound/soc/tegra/tegra210_ope.c                     |  419 +++
 sound/soc/tegra/tegra210_ope.h                     |   90 +
 sound/soc/tegra/tegra210_peq.c                     |  434 +++
 sound/soc/tegra/tegra210_peq.h                     |   56 +
 sound/soc/tegra/tegra30_i2s.c                      |    9 +-
 sound/soc/ti/davinci-i2s.c                         |   35 +-
 sound/soc/ti/davinci-mcasp.c                       |   16 +-
 sound/soc/ti/davinci-vcif.c                        |    3 +-
 sound/soc/ti/omap-dmic.c                           |    3 +-
 sound/soc/ti/omap-hdmi.c                           |    1 +
 sound/soc/ti/omap-mcbsp.c                          |   15 +-
 sound/soc/ti/omap-mcpdm.c                          |    7 +-
 sound/soc/uniphier/evea.c                          |    1 -
 sound/soc/ux500/mop500.c                           |    2 -
 sound/soc/ux500/mop500_ab8500.c                    |    2 -
 sound/soc/ux500/mop500_ab8500.h                    |    2 -
 sound/soc/ux500/ux500_msp_dai.c                    |   41 +-
 sound/soc/ux500/ux500_msp_dai.h                    |    2 -
 sound/soc/ux500/ux500_msp_i2s.c                    |    2 -
 sound/soc/ux500/ux500_msp_i2s.h                    |    2 -
 sound/soc/ux500/ux500_pcm.c                        |    2 -
 sound/soc/ux500/ux500_pcm.h                        |    2 -
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   18 +-
 sound/soc/xilinx/xlnx_i2s.c                        |    1 +
 sound/soc/xilinx/xlnx_spdif.c                      |    1 +
 sound/soc/xtensa/xtfpga-i2s.c                      |   19 +-
 679 files changed, 27894 insertions(+), 3270 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/tas2780.yaml
 create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h
 create mode 100644 sound/soc/amd/acp-es8336.c
 create mode 100644 sound/soc/amd/acp/acp-rembrandt.c
 create mode 100644 sound/soc/codecs/hda-dai.c
 create mode 100644 sound/soc/codecs/hda.c
 create mode 100644 sound/soc/codecs/hda.h
 create mode 100644 sound/soc/codecs/tas2780.c
 create mode 100644 sound/soc/codecs/tas2780.h
 create mode 100644 sound/soc/codecs/wsa883x.c
 create mode 100644 sound/soc/intel/avs/boards/Kconfig
 create mode 100644 sound/soc/intel/avs/boards/Makefile
 create mode 100644 sound/soc/intel/avs/boards/da7219.c
 create mode 100644 sound/soc/intel/avs/boards/dmic.c
 create mode 100644 sound/soc/intel/avs/boards/hdaudio.c
 create mode 100644 sound/soc/intel/avs/boards/i2s_test.c
 create mode 100644 sound/soc/intel/avs/boards/max98357a.c
 create mode 100644 sound/soc/intel/avs/boards/max98373.c
 create mode 100644 sound/soc/intel/avs/boards/nau8825.c
 create mode 100644 sound/soc/intel/avs/boards/rt274.c
 create mode 100644 sound/soc/intel/avs/boards/rt286.c
 create mode 100644 sound/soc/intel/avs/boards/rt298.c
 create mode 100644 sound/soc/intel/avs/boards/rt5682.c
 create mode 100644 sound/soc/intel/avs/boards/ssm4567.c
 create mode 100644 sound/soc/intel/boards/bdw_rt286.c
 delete mode 100644 sound/soc/intel/boards/broadwell.c
 delete mode 100644 sound/soc/intel/boards/haswell.c
 create mode 100644 sound/soc/intel/boards/hsw_rt5640.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-mtl-match.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-src.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-misc-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h
 create mode 100644 sound/soc/sof/intel/mtl.c
 create mode 100644 sound/soc/sof/intel/mtl.h
 create mode 100644 sound/soc/sof/intel/pci-mtl.c
 create mode 100644 sound/soc/sof/ipc4-control.c
 create mode 100644 sound/soc/sof/ipc4-pcm.c
 create mode 100644 sound/soc/sof/ipc4-topology.c
 create mode 100644 sound/soc/sof/ipc4-topology.h
 delete mode 100644 sound/soc/tegra/tegra20_das.h
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.c
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.h
 create mode 100644 sound/soc/tegra/tegra210_ope.c
 create mode 100644 sound/soc/tegra/tegra210_ope.h
 create mode 100644 sound/soc/tegra/tegra210_peq.c
 create mode 100644 sound/soc/tegra/tegra210_peq.h
