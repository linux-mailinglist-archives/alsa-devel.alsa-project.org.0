Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25725441D5C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 16:22:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B31916C5;
	Mon,  1 Nov 2021 16:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B31916C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635780129;
	bh=EGnSWrP2loVUHZ2QC35mqqUP3Q/SlVmMKS1IjEe/0A8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mx2Z4qA3MRBRos8MXzZiD5yLM9A+8fmTK4JRONf5CZn/513lF2+dEGwHQLJDw0cmS
	 J6MOFyOCdVe3G9xQCwiak9F3/rwkMqKaaen6S/SN18niAtXmI+9fUQWS6bm5BGYMUO
	 UY7CLgG/ScEiciB+AVyeg9hkZe99ME3BYSvhQ5ZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C24CF800F8;
	Mon,  1 Nov 2021 16:20:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82241F80269; Mon,  1 Nov 2021 16:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E79F800F8
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 16:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E79F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XTf87zvF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF9B060F3A;
 Mon,  1 Nov 2021 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635780037;
 bh=EGnSWrP2loVUHZ2QC35mqqUP3Q/SlVmMKS1IjEe/0A8=;
 h=From:To:Cc:Subject:Date:From;
 b=XTf87zvFDvvInVtZonLfaFcP3BmkVEWk9Hs5c/bZjU6AQtUhlY+zb1H/73t3dWGAR
 4ppJwVL2YGiMnk8N5A4MJIRdbV8RUQMIRUkdSOVxRdZ8a6lYCMP+CDQtdryoN4DgNi
 MATtbMJnbIb/T6gU7XAy+cwQ2+Qr7+yFEoWND5OuaUbMfKps5WAin5JzaCkovibX7V
 mCwXimo/vI6Z+nks1D7BA3E2lx0zqQdn90lT4N59k0jhDrTRoSwgpoUiLHHCw+MPGE
 VvPFNI/lyD7unOs0tuxm/kEprVacvwQuvtCZ/juDBKt6uJvH87IIsjjrCUXuYZMesf
 C3iFJ6nI9IzKg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.16
Date: Mon, 01 Nov 2021 15:20:17 +0000
Message-Id: <20211101152036.EF9B060F3A@mail.kernel.org>
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

The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.16

for you to fetch changes up to 318a54c0ee4aaa3bfd69fdf505588510c7672c0c:

  Merge remote-tracking branch 'asoc/for-5.16' into asoc-next (2021-10-29 22:00:00 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.16

This is an unusually large set of updates, mostly a large crop of
unusually big drivers coupled with extensive overhauls of existing code.
There's a SH change here for the DAI format terminology, the change is
straightforward and the SH maintainers don't seem very active.

 - A new version of the audio graph card which supports a wider range of
   systems.
 - Move of the Cirrus DSP framework into drivers/firmware to allow for
   future use by non-audio DSPs.
 - Several conversions to YAML DT bindings.
 - Continuing cleanups to the SOF and Intel code.
 - A very big overhaul of the cs42l42 driver, correcting many problems.
 - Support for AMD Vangogh and Yelow Cap, Cirrus CS35L41, Maxim
   MAX98520 and MAX98360A, Mediatek MT8195, Nuvoton NAU8821, nVidia
   Tegra210, NXP i.MX8ULP, Qualcomm AudioReach, Realtek ALC5682I-VS,
   RT5682S, and RT9120 and Rockchip RV1126 and RK3568

----------------------------------------------------------------
Ajit Kumar Pandey (10):
      ASoC: amd: Kconfig: Select fch clock support with machine driver
      ASoC: amd: Add common framework to support I2S on ACP SOC
      ASoC: amd: acp: Add I2S support on Renoir platform
      ASoC: amd: acp: Add callback for machine driver on ACP
      ASoC: amd: acp: Add generic machine driver support for ACP cards
      ASoC: amd: acp: Add legacy sound card support for Chrome audio
      ASoC: amd: acp: Add SOF audio support on Chrome board
      ASoC: amd: acp: Add support for Maxim amplifier codec
      ASoC: amd: acp: Add support for RT5682-VS codec
      ASoC: amd: acp: Add acp_machine struct for renoir platform.

Alejandro Tafalla (2):
      ASoC: max98927: Handle reset gpio when probing i2c
      ASoC: max98927: Add reset-gpios optional property

Alexander Stein (1):
      ASoC: meson: t9015: Add missing AVDD-supply property

Amadeusz Sławiński (5):
      ASoC: core: Remove invalid snd_soc_component_set_jack call
      ASoC: topology: Check for dapm widget completeness
      ASoC: topology: Use correct device for prints
      ASoC: topology: Change topology device to card device
      ASoC: Stop dummy from overriding hwparams

Andy Shevchenko (12):
      ASoC: Intel: bytcht_es8316: Get platform data via dev_get_platdata()
      ASoC: Intel: bytcht_es8316: Use temporary variable for struct device
      ASoC: Intel: bytcht_es8316: Switch to use gpiod_get_optional()
      ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to avoid log saturation
      ASoC: Intel: bytcr_rt5640: Get platform data via dev_get_platdata()
      ASoC: Intel: bytcr_rt5640: Use temporary variable for struct device
      ASoC: Intel: bytcr_rt5640: use devm_clk_get_optional() for mclk
      ASoC: Intel: bytcr_rt5640: Utilize dev_err_probe() to avoid log saturation
      ASoC: Intel: bytcr_rt5651: Get platform data via dev_get_platdata()
      ASoC: Intel: bytcr_rt5651: Use temporary variable for struct device
      ASoC: Intel: bytcr_rt5651: use devm_clk_get_optional() for mclk
      ASoC: Intel: bytcr_rt5651: Utilize dev_err_probe() to avoid log saturation

AngeloGioacchino Del Regno (1):
      ASoC: rt5682-i2c: Use devm_clk_get_optional for optional clock

Arnd Bergmann (3):
      ASoC: samsung: add missing "fallthrough;"
      ASoC: amd: acp: fix Kconfig dependencies
      ASoC: amd: acp: select CONFIG_SND_SOC_ACPI

Bard Liao (1):
      ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK/BCLK_ES bits

Bixuan Cui (1):
      ASoC: mediatek: mt8195: Add missing of_node_put()

Brent Lu (9):
      ASoC: Intel: sof_rt5682: support ALC5682I-VS codec
      ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015p board
      ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015 board
      ASoC: intel: sof_rt5682: support jsl_rt5682s_mx98360a board
      ASoC: intel: sof_rt5682: update platform device name for Maxim amplifier
      ASoC: Intel: glk_rt5682_max98357a: support ALC5682I-VS codec
      ASoC: soc-acpi: add comp_ids field for machine driver matching
      ASoC: Intel: sof_rt5682: detect codec variant in probe function
      ASoC: Intel: sof_rt5682: use comp_ids to enumerate rt5682s

Bud Liviu-Alexandru (1):
      ASoC: SOF: Make Intel IPC stream ops generic

Cai Huoqing (1):
      ASoC: mediatek: mt8195: Make use of the helper function devm_platform_ioremap_resource()

Cezary Rojewski (1):
      ASoC: topology: Add header payload_size verification

Charles Keepax (10):
      ASoC: cs35l41: Fix use of an uninitialised variable
      ASoC: cs35l41: Use regmap_read_poll_timeout to wait for OTP boot
      ASoC: cs35l41: Combine adjacent register writes
      ASoC: cs35l41: Don't overwrite returned error code
      ASoC: cs35l41: Fixup the error messages
      ASoC: cs35l41: Fix a bunch of trivial code formating/style issues
      misc: cs35l41: Remove unused pdn variable
      ASoC: wm_adsp: Move check for control existence
      ASoC: wm_adsp: Switch to using wm_coeff_read_ctrl for compressed buffers
      ASoC: wm_adsp: Move sys_config_size to wm_adsp

ChiYuan Huang (4):
      ASoC: dt-bindings: rt9120: Add initial bindings
      ASoC: rt9120: Add rt9210 audio amplifier support
      ASoC: dt-bindings: rt9120: Add initial bindings
      ASoC: rt9120: Add rt9210 audio amplifier support

Christian Hewitt (1):
      ASoC: meson: implement driver_name for snd_soc_card in meson-card-utils

Christophe JAILLET (1):
      ASoC: rsnd: Fix an error handling path in 'rsnd_node_count()'

Colin Ian King (7):
      ASoC: mediatek: mt8195: Fix unused initialization of pointer etdm_data
      ASoC: mediatek: mt8195: make array adda_dai_list static const
      ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" -> "Frontend"
      ASoC: codecs: Fix spelling mistake "Unsupport" -> "Unsupported"
      ASoC: meson: aiu: Fix spelling mistake "Unsupport" -> "Unsupported"
      ASoC: rockchip: i2s-tdm: Remove call to rockchip_i2s_ch_to_io
      ASoC: rockchip: i2s-tdm: Fix error handling on i2s_tdm_prepare_enable_mclk failure

Daniel Baluta (4):
      ASoC: SOF: OF: Add fw_path and tplg_path parameters
      ASoC: SOF: Introduce snd_sof_mailbox_read / snd_sof_mailbox_write callbacks
      ASoC: SOF: imx: Use newly introduced generic IPC stream ops
      ASoC: SOF: Introduce fragment elapsed notification API

David Lin (2):
      ASoC: nau8825: add set_jack coponment support
      ASoC: nau8825: add clock management for power saving

David Rhodes (3):
      ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
      ASoC: cs35l41: Add bindings for CS35L41
      ASoC: cs35l41: Binding fixes

Derek Fang (11):
      ASoC: rt5682s: Add driver for ALC5682I-VS codec
      ASoC: dt-bindings: rt5682s: add bindings for rt5682s
      ASoC: rt5682s: Remove the volatile SW reset register from reg_default
      ASoC: rt5682s: Use dev_dbg instead of pr_debug
      ASoC: rt5682s: Revise the macro RT5682S_PLLB_SRC_MASK
      ASoC: dt-bindings: rt5682s: fix the device-tree schema errors
      ASoC: rt5682s: Enable ASRC auto-disable to fix pop during jack plug-in while playback
      ASoC: rt5682s: Fix HP noise caused by SAR mode switch when the system resumes
      ASoC: rt5682s: Fix hp pop produced immediately after resuming
      ASoC: rt5682: fix a little pop while playback
      ASoC: rt5682s: Downsizing the DAC volume scale

Dmitry Osipenko (2):
      ASoC: tegra: Restore AC97 support
      ASoC: tegra: Set default card name for Trimslice

Geert Uytterhoeven (7):
      ASoC: dt-bindings: wlf,wm8978: Fix I2C address in example
      ASoC: dt-bindings: rockchip: i2s-tdm: Fix rockchip,i2s-[rt]x-route
      ASoC: wm8962: Convert to devm_clk_get_optional()
      ASoC: dt-bindings: wlf,wm8962: Convert to json-schema
      ASoC: amd: acp: Wrap AMD Audio ACP components in SND_SOC_AMD_ACP_COMMON
      ASoC: amd: acp: SND_SOC_AMD_{LEGACY_MACH,SOF_MACH} should depend on X86 && PCI && I2C
      ASoC: amd: acp: SND_SOC_AMD_ACP_COMMON should depend on X86 && PCI

George Song (2):
      ASoC: dt-bindings: max98520: add initial bindings
      ASoC: max98520: add max98520 audio amplifier driver

Guennadi Liakhovetski (1):
      ASoC: SOF: add error handling to snd_sof_ipc_msg_data()

Guenter Roeck (1):
      spi: tegra20-slink: Declare runtime suspend and resume functions conditionally

Guo Zhengkui (1):
      ASoC: wm_adsp: remove a repeated including

Hans de Goede (6):
      ASoC: es8316: Use IRQF_NO_AUTOEN when requesting the IRQ
      ASoC: rt5651: Use IRQF_NO_AUTOEN when requesting the IRQ
      ASoC: nau8824: Fix NAU8824_JACK_LOGIC define
      ASoC: nau8824: Add DMI quirk mechanism for active-high jack-detect
      ASoC: nau8824: Add a nau8824_components() helper
      ASoC: Intel: cht_bsw_nau8824: Set card.components string

Jack Yu (2):
      ASoC: rt1011: add i2s reference control for rt1011
      ASoC: rt5682: move clk related code to rt5682_i2c_probe

Jerome Brunet (2):
      ASoC: meson: axg-card: make links nonatomic
      ASoC: meson: axg-tdm-interface: manage formatters in trigger

Jiapeng Chong (1):
      ASoC: rt5682s: make rt5682s_aif2_dai_ops and rt5682s_soc_component_dev

John Keeping (1):
      ASoC: doc: update codec example code

Julian Braha (4):
      ASoC: fix unmet dependency on GPIOLIB
      ASoC: fix unmet dependency on GPIOLIB for SND_SOC_MAX98357A
      ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_DMIC
      ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_RT1015P

Krzysztof Kozlowski (1):
      ASoC: dt-bindings: rt5682s: correct several errors

Kunihiko Hayashi (1):
      ASoC: dt-bindings: uniphier: Add description of each port number

Kuninori Morimoto (21):
      ASoC: test-component: add Test Component YAML bindings
      ASoC: test-component: add Test Component for Sound debug/test
      ASoC: simple-card-utils: add asoc_graph_is_ports0()
      ASoC: simple-card-utils: add codec2codec support
      ASoC: add Audio Graph Card2 driver
      ASoC: audio-graph-card2: add Multi CPU/Codec support
      ASoC: audio-graph-card2: add DPCM support
      ASoC: audio-graph-card2: add Codec2Codec support
      ASoC: add Audio Graph Card2 Yaml Document
      ASoC: add Audio Graph Card2 Custom Sample
      ASoC: audio-graph-card2-custom-sample.dtsi: add Sample DT for Normal (Single)
      ASoC: audio-graph-card2-custom-sample.dtsi: add Sample DT for Normal (Nulti)
      ASoC: audio-graph-card2-custom-sample.dtsi: add DPCM sample (Single)
      ASoC: audio-graph-card2-custom-sample.dtsi: add DPCM sample (Multi)
      ASoC: audio-graph-card2-custom-sample.dtsi: add Codec2Codec sample (Single)
      ASoC: audio-graph-card2-custom-sample.dtsi: add Codec2Codec sample (Multi)
      ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step1
      ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step2
      ASoC: soc-component: add snd_soc_component_is_codec()
      ASoC: soc-core: tidyup empty function
      ASoC: soc-core: accept zero format at snd_soc_runtime_set_dai_fmt()

Malik_Hsu (1):
      ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp

Marc Herbert (1):
      ASoC: SOF: prefix some terse and cryptic dev_dbg() with __func__

Mark Brown (93):
      Merge existing fixes from asoc/for-5.15
      Merge series "Convert name-prefix doc to json-schema" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ARM: dts: Last round of DT schema fixes" from Maxime Ripard <maxime@cerno.tech>:
      Merge series "Cirrus Logic CS35L41 Amplifier" from David Rhodes <drhodes@opensource.cirrus.com>:
      Merge series "Patches to update for rockchip pdm" from Sugar Zhang <sugar.zhang@rock-chips.com>:
      Merge series "Support ALC5682I-VS codec" from Brent Lu <brent.lu@intel.com>:
      Merge series "ASoC: SOF: Intel: hda: Cleanups for local function uses" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      Merge series "ASoC: SOF: Remove unused members from struct sof_dev_desc" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      ASoC: atmel: Convert to new style DAI format definitions
      ASoC: au1x: Convert to modern terminology for DAI clocking
      Merge series "ASoC: SOF: Clean up the probe support" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      Merge series "ASoC: cs42l42: Implement Manual Type detection as fallback" from Vitaly Rodionov <vitalyr@opensource.cirrus.com>:
      ASoC: 88pm860x: Update to modern clocking terminology
      Merge series "ASoC: SOF: ipc: Small cleanups for message handler functions" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      ASoC: ab8500: Update to modern clocking terminology
      Merge series "Extend AHUB audio support for Tegra210 and later" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ASoC: compress: Support module_get on stream open" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      ASoC: Drop mistakenly applied SPI patch
      ASoC: cros_ec_codec: Use modern ASoC DAI format terminology
      ASoC: eureka-tlv320: Update to modern clocking terminology
      ASoC: fsl-asoc-card: Update to modern clocking terminology
      ASoC: fsl-audmix: Update to modern clocking terminology
      ASoC: fsl-esai: Update to modern clocking terminology
      ASoC: fsl-mqs: Update to modern clocking terminology
      ASoC: fsl_sai: Update to modern clocking terminology
      ASoC: fsl_ssi: Update to modern clocking terminology
      ASoC: imx-audmix: Update to modern clocking terminology
      ASoC: imx-card: Update to modern clocking terminology
      ASoC: imx-es8328: Update to modern clocking terminology
      ASoC: imx-hdmi: Update to modern clocking terminology
      ASoC: imx-rpmsg: Update to modern clocking terminology
      ASoC: imx-sgtl5000: Update to modern clocking terminology
      ASoC: mpc8610_hpcd: Update to modern clocking terminology
      ASoC: pl1022_ds: Update to modern clocking terminology
      ASoC: pl1022_rdk: Update to modern clocking terminology
      ASoC: zl38060: Update to modern clocking terminology
      ASoC: ak4118: Update to modern clocking terminology
      ASoC: ak4104: Update to modern clocking terminology
      ASoC: alc5632: Use modern ASoC DAI format terminology
      ASoC: ak4642: Use modern ASoC DAI format terminology
      ASoC: ep93xx: Convert to modern clocking terminology
      ASoC: ad1836: Update to modern clocking terminology
      ASoC: adau1372: Update to modern clocking terminology
      ASoC: adau1373: Update to modern clocking terminology
      ASoC: adau1701: Update to modern clocking terminology
      ASoC: adau17x1: Update to modern clocking terminology
      ASoC: adau1977: Update to modern clocking terminology
      ASoC: adav80x: Update to modern clocking terminology
      ASoC: ad193x: Update to modern clocking terminology
      ASoC: cpcap: Use modern ASoC DAI format terminology
      ASoC: bcm: Convert to modern clocking terminology
      ASoC: alc5623: Use modern ASoC DAI format terminology
      ASoC: ak4671: Use modern ASoC DAI format terminology
      ASoC: dwc-i2s: Update to modern clocking terminology
      ASoC: ak5558: Use modern ASoC DAI format terminology
      ASoC: ak4458: Use modern ASoC DAI format terminology
      Merge series "add driver to support firmware loading on Cirrus Logic DSPs" from Simon Trimmer <simont@opensource.cirrus.com>:
      Merge series "Add support for on demand pipeline setup/destroy" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      Merge series "ASoC: SOF: topology: minor updates" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: add flags to turn on SSP clocks early" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.16" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Rockchip I2S/TDM controller" from Nicolas Frattaroli <frattaroli.nicolas@gmail.com>:
      Merge series "ASoC: SOF: Improvements for debugging" from Peter Ujfalusi <peter.ujfalusi@linux.intel.com>:
      Merge series "Introduce new SOF helpers" from Daniel Baluta <daniel.baluta@oss.nxp.com> Daniel Baluta <daniel.baluta@nxp.com>:
      Merge series "Add reset-gpios handling for max98927" from Alejandro Tafalla <atafalla@dnyon.com>:
      Merge series "ASoC: Intel: bytcht_es8316: few cleanups" from Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
      Merge series "ASoC: rt9120: Add Richtek RT9120 supprot" from cy_huang <u0084500@gmail.com> ChiYuan Huang <cy_huang@richtek.com>:
      sh: Use modern ASoC DAI format terminology
      Merge series "ASoC: Intel: bytcr_rt5651: few cleanups" from Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
      ASoC: rt9120: Drop rt9210 audio amplifier support
      Merge series "ASoC: rt9120: Add Richtek RT9120 supprot" from cy_huang <u0084500@gmail.com> ChiYuan Huang <cy_huang@richtek.com>:
      Merge series "ASoC: Add Audio Graph Card2 support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge tag 'v5.15-rc6' into asoc-5.16
      Merge series "ASoC: cleanup / tidyup soc-pcm/core/component" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge branch 'asoc-5.15' into asoc-5.16
      Merge series "ASoC: qcom: sm8250: add support for TX and RX Macro dais" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge branch 'asoc-5.15' into asoc-5.16
      Merge series "ASoC: meson: axg: fix TDM channel order sync" from Jerome Brunet <jbrunet@baylibre.com>:
      Merge series "Add Yellow Carp platform ASoC driver" from Vijendar Mukunda <Vijendar.Mukunda@amd.com>:
      Merge series "ASoC: Add common modules support for ACP hw block" from Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>:
      Merge series "ASoC: wm8962: Conversion to json-schema and fix" from Geert Uytterhoeven <geert+renesas@glider.be>:
      ASoC: topology: Fix stub for snd_soc_tplg_component_remove()
      Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into v11_20211026_srinivas_kandagatla_asoc_qcom_add_audioreach_support for audioreach support
      Merge series "ASoC: qcom: Add AudioReach support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "Update Lpass digital codec macro drivers" from Srinivasa Rao Mandadapu <srivasam@codeaurora.org>:
      Merge series "ASoC: cs42l42: Fixes to power-down" from Richard Fitzgerald <rf@opensource.cirrus.com>:
      Merge series "ASoC: minor cleanup of warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Make genaral and simple for new sof machine driver" from David Lin <CTLIN0@nuvoton.com>:
      Merge series "ASoC: cs42l42: Fix definition and handling of jack switch invert" from Richard Fitzgerald <rf@opensource.cirrus.com>:
      Merge series "ASoC: Sanity checks and soc-topology updates" from Cezary Rojewski <cezary.rojewski@intel.com>:
      Merge series "Multiple headphone codec driver support" from Brent Lu <brent.lu@intel.com>:
      Merge remote-tracking branch 'asoc/for-5.15' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.16' into asoc-next

Masahiro Yamada (1):
      ASoC: ti: rename CONFIG_SND_SOC_DM365_VOICE_CODEC_MODULE

Masanari Iida (1):
      ASoC: q6afe: q6asm: Fix typos in qcom,q6afe.txt and qcom,q6asm.txt

Maxime Ripard (4):
      ASoC: dt-bindings: Add WM8978 Binding
      ASoC: dt-bindings: Convert Bluetooth SCO Link binding to a schema
      ASoC: dt-bindings: Convert SPDIF Transmitter binding to a schema
      ASoC: dt-bindings: Convert Simple Amplifier binding to a schema

Nathan Chancellor (1):
      ASoC: qdsp6: audioreach: Fix clang -Wimplicit-fallthrough

Nicolas Frattaroli (5):
      ASoC: rockchip: add support for i2s-tdm controller
      ASoC: dt-bindings: rockchip: add i2s-tdm bindings
      ASoC: rockchip: i2s-tdm: Strip out direct CRU use
      ASoC: dt-bindings: rockchip: i2s-tdm: Drop rockchip,cru property
      ASoC: rockchip: i2s-tdm: Fix refcount test

Peter Ujfalusi (56):
      ASoC: soc-topology: Move template info print soc_tplg_dapm_widget_create()
      ASoC: SOF: Handle control change notification from firmware
      ASoC: SOF: intel: Do no initialize resindex_dma_base
      ASoC: SOF: Drop resindex_dma_base, dma_engine, dma_size from sof_dev_desc
      ASoC: SOF: Intel: hda-dsp: Declare locally used functions as static
      ASoC: SOF: Intel: hda: Remove boot_firmware skl and iccmax_icl declarations
      ASoC: SOF: Intel: hda: Relocate inline definitions from hda.h to hda.c for sdw
      ASoC: SOF: loader: load_firmware callback is mandatory, treat it like that
      ASoC: SOF: Intel: bdw: Set the mailbox offset directly in bdw_probe
      ASoC: SOF: ipc: Remove snd_sof_dsp_mailbox_init()
      ASoC: SOF: imx: Do not initialize the snd_sof_dsp_ops.read64
      ASoC: SOF: loader: No need to export snd_sof_fw_parse_ext_data()
      ASoC: SOF: core: Do not use 'bar' as parameter for block_read/write
      ASoC: SOF: debug: Add generic API and ops for DSP regions
      ASoC: SOF: imx: Provide debugfs_add_region_item ops for core
      ASoC: SOF: Intel: Provide debugfs_add_region_item ops for core
      ASoC: SOF: loader: Use the generic ops for region debugfs handling
      ASoC: SOF: debug: No need to export the snd_sof_debugfs_io_item()
      ASoC: SOF: ipc: Add probe message logging to ipc_log_header()
      ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS reference
      ASoC: SOF: probe: Merge and clean up the probe and compress files
      ASoC: SOF: Intel: Rename hda-compress.c to hda-probes.c
      ASoC: SOF: sof-probes: Correct the function names used for snd_soc_cdai_ops
      ASoC: SOF: core: Move probe work related code under a single if () branch
      ASoC: SOF: ipc: Clarify the parameter name for ipc_trace_message()
      ASoC: SOF: ipc: Print 0x prefix for errors in ipc_trace/stream_message()
      ASoC: SOF: ipc: Remove redundant error check from sof_ipc_tx_message_unlocked
      ASoC: SOF: Rename sof_arch_ops to dsp_arch_ops
      ASoC: soc-component: Convert the mark_module to void*
      ASoC: compress/component: Use module_get_when_open/put_when_close for cstream
      ASoC: SOF: Remove struct sof_ops_table and sof_get_ops() macro
      ASoC: Intel: boards: Update to modern clocking terminology
      ASoC: SOF: Intel: hda-stream: Print stream name on STREAM_SD_OFFSET timeout
      ASoC: SOF: ipc: Make the error prints consistent in tx_wait_done()
      ASoC: SOF: Change SND_SOC_SOF_TOPLEVEL from config to menuconfig
      ASoC: SOF: debug: Swap the dsp_dump and ipc_dump sequence for fw_exception
      ASoC: SOF: ipc and dsp dump: Add markers for better visibility
      ASoC: SOF: Print the dbg_dump and ipc_dump once to reduce kernel log noise
      ASoC: SOF: loader: Print the DSP dump if boot fails
      ASoC: SOF: intel: atom: No need to do a DSP dump in atom_run()
      ASoC: SOF: debug/ops: Move the IPC and DSP dump functions out from the header
      ASoC: SOF: debug: Add SOF_DBG_DUMP_OPTIONAL flag for DSP dumping
      ASoC: SOF: intel: hda-loader: Use snd_sof_dsp_dbg_dump() for DSP dump
      ASoC: SOF: Drop SOF_DBG_DUMP_FORCE_ERR_LEVEL and sof_dev_dbg_or_err
      ASoC: SOF: debug: Print out the fw_state along with the DSP dump
      ASoC: SOF: ipc: Re-enable dumps after successful IPC tx
      ASoC: SOF: ops: Force DSP panic dumps to be printed
      ASoC: SOF: Introduce macro to set the firmware state
      ASoC: SOF: intel: hda: Drop 'error' prefix from error dump functions
      ASoC: SOF: core: Clean up snd_sof_get_status() prints
      ASoC: SOF: loader: Drop SOF_DBG_DUMP_REGS flag when firmware start fails
      ASoC: SOF: Intel: hda-loader: Drop SOF_DBG_DUMP_REGS flag from dbg_dump calls
      ASoC: SOF: Intel: hda: Dump registers and stack when SOF_DBG_DUMP_REGS is set
      ASoC: SOF: pipelines: Harmonize all functions to use struct snd_sof_dev
      ASoC: rt1011: Fix 'I2S Reference' enum control caused error
      ASoC: rt1011: Fix 'I2S Reference' enum control

Pierre-Louis Bossart (29):
      ASoC: amd: acp: declare and add prefix to 'bt_uart_enable' symbol
      ASoC: SOF: core: allow module parameter to override dma trace Kconfig
      ASoC: SOF: imx: add header file for ops
      ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices based on ES8336 codec
      ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec
      ASoC: Intel: add machine driver for SOF+ES8336
      ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA single amp
      ASoC: Intel: sof_sdw: add missing quirk for Dell SKU 0A45
      ASoC: SOF: dai: mirror group_id definition added in firmware
      ASoC: SOF: dai: include new flags for DAI_CONFIG
      ASoC: SOF: Intel: hda: add new flags for DAI_CONFIG
      ASoC: SOF: Intel: hda-dai: improve SSP DAI handling for dynamic pipelines
      ASoC: SOF: topology: show clks_control value in dynamic debug
      ASoC: SOF: topology: allow for dynamic pipelines override for debug
      ASoC: SOF: core: debug: force all processing on primary core
      ASoC: soc-pcm: restore mixer functionality
      ASoC: topology: handle endianness warning
      ASoC: rt5682s: use 'static' qualifier
      ASoC: nau8821: fix kernel-doc
      ASoC: nau8821: clarify out-of-bounds check
      ASoC: mediatek: remove unnecessary initialization
      ASoC: mediatek: mt8195: rename shadowed array
      ASoC: mediatek: mt8195: fix return value
      ASoC: rockchip: i2s_tdm: improve return value handling
      ASoC: Intel: soc-acpi: add entry for ESSX8336 on JSL
      ASoC: es8316: add support for ESSX8336 ACPI _HID
      ASoC: Intel: soc-acpi-byt: shrink tables using compatible IDs
      ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs
      ASoC: Intel: soc-acpi: use const for all uses of snd_soc_acpi_codecs

Rander Wang (2):
      ASoC: SOF: control: fix a typo in put operations for kcontrol
      ASoC: SOF: prepare code to allocate IPC messages in fw_ready

Ranjani Sridharan (16):
      ASoC: SOF: compress: move and export sof_probe_compr_ops
      ASoC: SOF: pm: fix a stale comment
      ASoC: topology: change the complete op in snd_soc_tplg_ops to return int
      ASoC: SOF: control: Add access field in struct snd_sof_control
      ASoC: SOF: topology: Add new token for dynamic pipeline
      ASoC: SOF: sof-audio: add helpers for widgets, kcontrols and dai config set up
      AsoC: dapm: export a couple of functions
      ASoC: SOF: Add new fields to snd_sof_route
      ASoC: SOF: restore kcontrols for widget during set up
      ASoC: SOF: Don't set up widgets during topology parsing
      ASoC: SOF: Introduce widget use_count
      ASoC: SOF: Intel: hda: make sure DAI widget is set up before IPC
      ASoC: SOF: Add support for dynamic pipelines
      ASoC: SOF: topology: Add kernel parameter for topology verification
      ASoC: SOF: topology: return error if sof_connect_dai_widget() fails
      ASoC: SOF: topology: do not power down primary core during topology removal

Richard Fitzgerald (18):
      ASoC: cs42l42: Don't reconfigure the PLL while it is running
      ASoC: cs42l42: Always configure both ASP TX channels
      ASoC: cs42l42: Correct some register default values
      ASoC: cs42l42: Don't set defaults for volatile registers
      ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
      ASoC: cs42l42: Don't claim to support 192k
      ASoC: cs42l42: Use PLL for SCLK > 12.288MHz
      ASoC: cs42l42: Allow time for HP/ADC to power-up after enable
      ASoC: cs42l42: Set correct SRC MCLK
      ASoC: cs42l42: Mark OSC_SWITCH_STATUS register volatile
      ASoC: cs42l42: Fix WARN in remove() if running without an interrupt
      ASoC: cs42l42: Always enable TS_PLUG and TS_UNPLUG interrupts
      ASoC: cs42l42: Remove unused runtime_suspend/runtime_resume callbacks
      ASoC: cs42l42: Prevent NULL pointer deref in interrupt handler
      ASoC: cs42l42: Reset and power-down on remove() and failed probe()
      ASoC: cs42l42: free_irq() before powering-down on probe() fail
      ASoC: dt-bindings: cs42l42: Correct description of ts-inv
      ASoC: cs42l42: Correct configuring of switch inversion from ts-inv

Rikard Falkeborn (9):
      ASoC: fsl: Constify static snd_soc_ops
      ASoC: tegra: Constify static snd_soc_dai_ops structs
      ASoC: ti: Constify static snd_soc_ops
      ASoC: ux500: mop500: Constify static snd_soc_ops
      ASoC: tegra: Constify static snd_soc_ops
      ASoC: qcom: apq8096: Constify static snd_soc_ops
      ASoC: amd: acp-rt5645: Constify static snd_soc_ops
      ASoC: mediatek: Constify static snd_soc_ops
      ASoC: amd: vangogh: constify static struct snd_soc_dai_ops

Sameer Pujar (14):
      ASoC: Add json-schema documentation for sound-name-prefix
      ASoC: Use schema reference for sound-name-prefix
      ASoC: Remove name-prefix.txt
      ASoC: soc-pcm: Don't reconnect an already active BE
      ASoC: simple-card-utils: Increase maximum DAI links limit to 512
      ASoC: audio-graph: Fixup CPU endpoint hw_params in a BE<->BE link
      ASoC: dt-bindings: tegra: Few more Tegra210 AHUB modules
      ASoC: tegra: Add routes for few AHUB modules
      ASoC: tegra: Add Tegra210 based MVC driver
      ASoC: tegra: Add Tegra210 based SFC driver
      ASoC: tegra: Add Tegra210 based AMX driver
      ASoC: tegra: Add Tegra210 based ADX driver
      ASoC: tegra: Add Tegra210 based Mixer driver
      ASoC: Fix warning related to 'sound-name-prefix' binding

Sebastian Andrzej Siewior (1):
      ASoC: mediatek: mt8195: Remove unsued irqs_lock.

Seven Lee (1):
      ASoC: nau8821: new driver

Shengjiu Wang (3):
      ASoC: fsl_rpmsg: add soc specific data structure
      ASoC: fsl_spdif: Add support for i.MX8ULP
      ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP

Simon Trimmer (14):
      ASoC: wm_adsp: Remove use of snd_ctl_elem_type_t
      ASoC: wm_adsp: Cancel ongoing work when removing controls
      ASoC: wm_adsp: Rename generic DSP support
      ASoC: wm_adsp: Introduce cs_dsp logging macros
      ASoC: wm_adsp: Separate some ASoC and generic functions
      ASoC: wm_adsp: Split DSP power operations into helper functions
      ASoC: wm_adsp: Separate generic cs_dsp_coeff_ctl handling
      ASoC: wm_adsp: Move check of dsp->running to better place
      ASoC: wm_adsp: Pass firmware names as parameters when starting DSP core
      ASoC: wm_adsp: move firmware loading to client
      ASoC: wm_adsp: Split out struct cs_dsp from struct wm_adsp
      ASoC: wm_adsp: Separate wm_adsp specifics in cs_dsp_client_ops
      firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs
      ASoC: soc-component: Remove conditional definition of debugfs data members

Srinivas Kandagatla (25):
      soc: dt-bindings: qcom: apr: convert to yaml
      soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
      soc: qcom: apr: make code more reuseable
      soc: dt-bindings: qcom: add gpr bindings
      soc: qcom: apr: Add GPR support
      ASoC: soc-component: improve error reporting for register access
      ASoC: qcom: sm8250: add support for TX and RX Macro dais
      ASoC: qcom: sm8250: Add Jack support
      ASoC: dt-bindings: move LPASS dai related bindings out of q6afe
      ASoC: dt-bindings: move LPASS clocks related bindings out of q6afe
      ASoC: dt-bindings: rename q6afe.h to q6dsp-lpass-ports.h
      ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
      ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
      ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai compatible
      ASoC: dt-bindings: lpass-clocks: add q6prm clocks compatible
      ASoC: dt-bindings: add q6apm digital audio stream bindings
      ASoC: qdsp6: audioreach: add basic pkt alloc support
      ASoC: qdsp6: audioreach: add q6apm support
      ASoC: qdsp6: audioreach: add module configuration command helpers
      ASoC: qdsp6: audioreach: add Kconfig and Makefile
      ASoC: qdsp6: audioreach: add topology support
      ASoC: qdsp6: audioreach: add q6apm-dai support
      ASoC: qdsp6: audioreach: add q6apm lpass dai support
      ASoC: qdsp6: audioreach: add q6prm support
      ASoC: qdsp6: audioreach: add support for q6prm-clocks

Srinivasa Rao Mandadapu (7):
      ASoC: dt-bindings: lpass: add binding headers for digital codecs
      ASoC: dt-bindings: lpass: add binding headers for digital codecs
      ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for sc7280
      ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital codecs
      ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
      ASoC: codecs: tx-macro: Update tx default values
      ASoC: codecs: Change bulk clock voting to optional voting in digital codecs

Stefan Binding (2):
      ASoC: cs42l42: Implement Manual Type detection as fallback
      ASoC: cs42l42: Use two thresholds and increased wait time for manual type detection

Stephan Gerhold (1):
      ASoC: qcom: common: Respect status = "disabled" on DAI link nodes

Sugar Zhang (9):
      ASoC: rockchip: Add support for rv1126 pdm
      ASoC: dt-bindings: rockchip: Add binding for rv1126 pdm
      ASoC: rockchip: pdm: Add support for rk3568 pdm
      ASoC: dt-bindings: rockchip: Add binding for rk3568 pdm
      ASoC: rockchip: pdm: Add support for path map
      ASoC: dt-bindings: rockchip: pdm: Document property 'rockchip,path-map'
      ASoC: dt-bindings: rockchip: Convert pdm bindings to yaml
      ASoC: dmaengine: Introduce module option prealloc_buffer_size_kbytes
      ASoC: rockchip: Use generic dmaengine code

Trevor Wu (7):
      ASoC: mt8195: remove unnecessary CONFIG_PM
      ASoC: mediatek: mt6359: Fix unexpected error in bind/unbind flow
      ASoC: mediatek: mt8195: add missing of_node_put in probe
      ASoC: mediatek: mt8195: move of_node_put to remove function
      ASoC: mediatek: mt8195: update audsys clock parent name
      ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and rt5682
      ASoC: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682 bindings document

Tzung-Bi Shih (2):
      ASoC: dt-bindings: mediatek: mt8192: re-add audio afe document
      ASoC: dt-bindings: mediatek: rename reset controller headers in DT example

Uwe Kleine-König (5):
      ASoC: tlv320aic32x4: Make aic32x4_remove() return void
      ASoc: wm8731: Drop empty spi_driver remove callback
      ASoc: wm8900: Drop empty spi_driver remove callback
      ASoC: cs35l41: Make cs35l41_remove() return void
      ASoC: tlv320aic3x: Make aic3x_remove() return void

Vijendar Mukunda (16):
      ASoc: amd: create platform device for VG machine driver
      ASoC: amd: add vangogh machine driver
      ASoC: amd: enable vangogh platform machine driver build
      ASoC: amd: add Yellow Carp ACP6x IP register header
      ASoC: amd: add Yellow Carp ACP PCI driver
      ASoC: amd: add acp6x init/de-init functions
      ASoC: amd: add platform devices for acp6x pdm driver and dmic driver
      ASoC: amd: add acp6x pdm platform driver
      ASoC: amd: add acp6x irq handler
      ASoC: amd: add acp6x pdm driver dma ops
      ASoC: amd: add acp6x pci driver pm ops
      ASoC: amd: add acp6x pdm driver pm ops
      ASoC: amd: enable Yellow carp acp6x drivers build
      ASoC: amd: create platform device for acp6x machine driver
      ASoC: amd: add YC machine driver using dmic
      ASoC: amd: enable Yellow Carp platform machine driver build

Vincent Knecht (1):
      ASoC: codecs: tfa989x: Add support for tfa9897 RCV bit

Viorel Suman (2):
      ASoC: SOF: imx8m: add SAI1 info
      ASoC: fsl_spdif: implement bypass mode from in to out

Vitaly Rodionov (1):
      ASoC: cs42l42: Minor fix all errors reported by checkpatch.pl script

Wolfram Sang (1):
      ASoC: codecs: max98390: simplify getting the adapter of a client

Yang Yingliang (1):
      ASoC: amd: acp: Fix return value check in acp_machine_select()

Yassine Oudjana (1):
      ASoC: wcd9335: Use correct version to initialize Class H

gearhead (1):
      ASoC: pcm5102a: increase rate from 192k to 384k

 .../devicetree/bindings/soc/qcom/qcom,apr.txt      |  134 -
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |  177 +
 .../devicetree/bindings/sound/amlogic,t9015.yaml   |    6 +
 .../bindings/sound/audio-graph-card2.yaml          |   57 +
 Documentation/devicetree/bindings/sound/bt-sco.txt |   13 -
 .../devicetree/bindings/sound/cirrus,cs35l41.yaml  |  157 +
 .../devicetree/bindings/sound/cs42l42.txt          |   13 +-
 .../devicetree/bindings/sound/linux,bt-sco.yaml    |   38 +
 .../devicetree/bindings/sound/linux,spdif-dit.yaml |   32 +
 .../devicetree/bindings/sound/max9892x.txt         |    3 +
 .../devicetree/bindings/sound/maxim,max98520.yaml  |   36 +
 .../devicetree/bindings/sound/mt8192-afe-pcm.yaml  |  100 +
 .../sound/mt8195-mt6359-rt1011-rt5682.yaml         |   47 +
 .../devicetree/bindings/sound/name-prefix.txt      |   24 -
 .../devicetree/bindings/sound/name-prefix.yaml     |   21 +
 .../devicetree/bindings/sound/nau8821.txt          |   55 +
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |    9 +-
 .../bindings/sound/nvidia,tegra210-adx.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   20 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |    9 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |    9 +-
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |   74 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |   73 +
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |    9 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |    4 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |    4 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |    4 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |    4 +-
 .../devicetree/bindings/sound/qcom,q6afe.txt       |  181 -
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |   53 +
 .../devicetree/bindings/sound/qcom,q6asm.txt       |    2 +-
 .../bindings/sound/qcom,q6dsp-lpass-clocks.yaml    |   77 +
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  205 ++
 .../devicetree/bindings/sound/realtek,rt5682s.yaml |  117 +
 .../devicetree/bindings/sound/richtek,rt9120.yaml  |   59 +
 .../bindings/sound/rockchip,i2s-tdm.yaml           |  182 +
 .../devicetree/bindings/sound/rockchip,pdm.txt     |   46 -
 .../devicetree/bindings/sound/rockchip,pdm.yaml    |  120 +
 Documentation/devicetree/bindings/sound/rt5659.txt |    2 +-
 .../devicetree/bindings/sound/simple-amplifier.txt |   17 -
 .../bindings/sound/simple-audio-amplifier.yaml     |   45 +
 .../bindings/sound/simple-audio-mux.yaml           |    9 +-
 .../bindings/sound/socionext,uniphier-aio.yaml     |   22 +-
 .../bindings/sound/socionext,uniphier-evea.yaml    |    6 +-
 .../bindings/sound/spdif-transmitter.txt           |   10 -
 .../devicetree/bindings/sound/test-component.yaml  |   33 +
 .../devicetree/bindings/sound/wlf,wm8962.yaml      |  118 +
 .../devicetree/bindings/sound/wlf,wm8978.yaml      |   58 +
 Documentation/devicetree/bindings/sound/wm8962.txt |   43 -
 Documentation/sound/alsa-configuration.rst         |    9 +
 Documentation/sound/soc/codec.rst                  |    8 +-
 MAINTAINERS                                        |   18 +
 arch/sh/boards/mach-ecovec24/setup.c               |    2 +-
 arch/sh/boards/mach-se/7724/setup.c                |    2 +-
 drivers/firmware/Kconfig                           |    1 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/cirrus/Kconfig                    |    5 +
 drivers/firmware/cirrus/Makefile                   |    3 +
 drivers/firmware/cirrus/cs_dsp.c                   | 3109 +++++++++++++++++
 drivers/soc/qcom/Kconfig                           |    2 +-
 drivers/soc/qcom/apr.c                             |  287 +-
 include/dt-bindings/soc/qcom,gpr.h                 |   19 +
 include/dt-bindings/sound/qcom,lpass.h             |   31 +
 include/dt-bindings/sound/qcom,q6afe.h             |  203 +-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |  208 ++
 include/linux/firmware/cirrus/cs_dsp.h             |  242 ++
 .../linux/firmware/cirrus}/wmfw.h                  |    8 +-
 include/linux/soc/qcom/apr.h                       |   70 +-
 include/sound/cs35l41.h                            |   34 +
 include/sound/graph_card.h                         |   21 +
 include/sound/rt5682s.h                            |   48 +
 include/sound/simple_card_utils.h                  |    6 +-
 include/sound/soc-acpi.h                           |    3 +
 include/sound/soc-component.h                      |   21 +-
 include/sound/soc-dpcm.h                           |    1 +
 include/sound/soc-topology.h                       |    5 +-
 include/sound/sof.h                                |    5 -
 include/sound/sof/dai-intel.h                      |    4 +
 include/sound/sof/dai.h                            |   10 +-
 include/uapi/sound/snd_ar_tokens.h                 |  208 ++
 include/uapi/sound/sof/tokens.h                    |    1 +
 sound/hda/intel-dsp-config.c                       |   22 +-
 sound/soc/amd/Kconfig                              |   40 +-
 sound/soc/amd/Makefile                             |    2 +
 sound/soc/amd/acp-da7219-max98357a.c               |    6 +-
 sound/soc/amd/acp-pcm-dma.c                        |    6 +-
 sound/soc/amd/acp-rt5645.c                         |    2 +-
 sound/soc/amd/acp.h                                |    2 +
 sound/soc/amd/acp/Kconfig                          |   61 +
 sound/soc/amd/acp/Makefile                         |   26 +
 sound/soc/amd/acp/acp-i2s.c                        |  340 ++
 sound/soc/amd/acp/acp-legacy-mach.c                |  104 +
 sound/soc/amd/acp/acp-mach-common.c                |  600 ++++
 sound/soc/amd/acp/acp-mach.h                       |   57 +
 sound/soc/amd/acp/acp-platform.c                   |  315 ++
 sound/soc/amd/acp/acp-renoir.c                     |  163 +
 sound/soc/amd/acp/acp-sof-mach.c                   |  131 +
 sound/soc/amd/acp/amd.h                            |  145 +
 sound/soc/amd/acp/chip_offset_byte.h               |   76 +
 sound/soc/amd/vangogh/Makefile                     |    2 +
 sound/soc/amd/vangogh/acp5x-i2s.c                  |    2 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 |  386 +++
 sound/soc/amd/vangogh/acp5x.h                      |    2 +-
 sound/soc/amd/vangogh/pci-acp5x.c                  |    3 +
 sound/soc/amd/yc/Makefile                          |    9 +
 sound/soc/amd/yc/acp6x-mach.c                      |  194 ++
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |  448 +++
 sound/soc/amd/yc/acp6x.h                           |  107 +
 sound/soc/amd/yc/acp6x_chip_offset_byte.h          |  444 +++
 sound/soc/amd/yc/pci-acp6x.c                       |  338 ++
 sound/soc/atmel/atmel-i2s.c                        |    6 +-
 sound/soc/atmel/atmel_ssc_dai.c                    |   26 +-
 sound/soc/atmel/atmel_wm8904.c                     |    2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   10 +-
 sound/soc/atmel/mikroe-proto.c                     |    4 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |    2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |    2 +-
 sound/soc/au1x/db1200.c                            |    6 +-
 sound/soc/au1x/i2sc.c                              |    6 +-
 sound/soc/au1x/psc-i2s.c                           |   10 +-
 sound/soc/bcm/bcm2835-i2s.c                        |   56 +-
 sound/soc/bcm/cygnus-ssp.c                         |    6 +-
 sound/soc/cirrus/edb93xx.c                         |    2 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |   10 +-
 sound/soc/cirrus/snappercl15.c                     |    2 +-
 sound/soc/codecs/88pm860x-codec.c                  |   18 +-
 sound/soc/codecs/Kconfig                           |   46 +
 sound/soc/codecs/Makefile                          |   12 +
 sound/soc/codecs/ab8500-codec.c                    |   20 +-
 sound/soc/codecs/ad1836.c                          |    6 +-
 sound/soc/codecs/ad193x.c                          |   10 +-
 sound/soc/codecs/adau1372.c                        |   14 +-
 sound/soc/codecs/adau1373.c                        |   14 +-
 sound/soc/codecs/adau1701.c                        |    6 +-
 sound/soc/codecs/adau17x1.c                        |    6 +-
 sound/soc/codecs/adau1977.c                        |   31 +-
 sound/soc/codecs/adav80x.c                         |    6 +-
 sound/soc/codecs/ak4104.c                          |    4 +-
 sound/soc/codecs/ak4118.c                          |   20 +-
 sound/soc/codecs/ak4458.c                          |   12 +-
 sound/soc/codecs/ak4642.c                          |    8 +-
 sound/soc/codecs/ak4671.c                          |    6 +-
 sound/soc/codecs/ak5558.c                          |   10 +-
 sound/soc/codecs/alc5623.c                         |    8 +-
 sound/soc/codecs/alc5632.c                         |    8 +-
 sound/soc/codecs/cpcap.c                           |   18 +-
 sound/soc/codecs/cros_ec_codec.c                   |    4 +-
 sound/soc/codecs/cs35l41-i2c.c                     |  115 +
 sound/soc/codecs/cs35l41-spi.c                     |  140 +
 sound/soc/codecs/cs35l41-tables.c                  |  594 ++++
 sound/soc/codecs/cs35l41.c                         | 1445 ++++++++
 sound/soc/codecs/cs35l41.h                         |  775 +++++
 sound/soc/codecs/cs42l42.c                         |  481 +--
 sound/soc/codecs/cs42l42.h                         |   64 +-
 sound/soc/codecs/cs4341.c                          |    7 +
 sound/soc/codecs/cs47l15.c                         |   26 +-
 sound/soc/codecs/cs47l24.c                         |   20 +-
 sound/soc/codecs/cs47l35.c                         |   26 +-
 sound/soc/codecs/cs47l85.c                         |   34 +-
 sound/soc/codecs/cs47l90.c                         |   36 +-
 sound/soc/codecs/cs47l92.c                         |   20 +-
 sound/soc/codecs/es8316.c                          |    8 +-
 sound/soc/codecs/lpass-rx-macro.c                  |    3 +-
 sound/soc/codecs/lpass-tx-macro.c                  |   25 +-
 sound/soc/codecs/lpass-va-macro.c                  |    3 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |    1 +
 sound/soc/codecs/madera.c                          |   18 +-
 sound/soc/codecs/max98390.c                        |    2 +-
 sound/soc/codecs/max98520.c                        |  769 +++++
 sound/soc/codecs/max98520.h                        |  159 +
 sound/soc/codecs/max98927.c                        |   25 +
 sound/soc/codecs/max98927.h                        |    1 +
 sound/soc/codecs/mt6359.c                          |    2 +-
 sound/soc/codecs/nau8821.c                         | 1714 ++++++++++
 sound/soc/codecs/nau8821.h                         |  533 +++
 sound/soc/codecs/nau8824.c                         |   74 +-
 sound/soc/codecs/nau8824.h                         |    3 +-
 sound/soc/codecs/nau8825.c                         |   48 +-
 sound/soc/codecs/pcm179x-spi.c                     |    1 +
 sound/soc/codecs/pcm5102a.c                        |    2 +-
 sound/soc/codecs/pcm512x.c                         |    2 +
 sound/soc/codecs/rt1011.c                          |   10 +
 sound/soc/codecs/rt1015.c                          |    2 +-
 sound/soc/codecs/rt1016.c                          |    2 +-
 sound/soc/codecs/rt1019.c                          |    2 +-
 sound/soc/codecs/rt1305.c                          |    2 +-
 sound/soc/codecs/rt1308.c                          |    2 +-
 sound/soc/codecs/rt5514.c                          |    2 +-
 sound/soc/codecs/rt5616.c                          |    2 +-
 sound/soc/codecs/rt5640.c                          |    2 +-
 sound/soc/codecs/rt5645.c                          |    2 +-
 sound/soc/codecs/rt5651.c                          |    9 +-
 sound/soc/codecs/rt5659.c                          |    2 +-
 sound/soc/codecs/rt5660.c                          |    2 +-
 sound/soc/codecs/rt5663.c                          |    2 +-
 sound/soc/codecs/rt5665.c                          |    2 +-
 sound/soc/codecs/rt5668.c                          |    2 +-
 sound/soc/codecs/rt5670.c                          |    2 +-
 sound/soc/codecs/rt5677.c                          |    2 +-
 sound/soc/codecs/rt5682-i2c.c                      |   17 +
 sound/soc/codecs/rt5682.c                          |  132 +-
 sound/soc/codecs/rt5682.h                          |   23 +
 sound/soc/codecs/rt5682s.c                         | 3197 ++++++++++++++++++
 sound/soc/codecs/rt5682s.h                         | 1474 ++++++++
 sound/soc/codecs/rt9120.c                          |  495 +++
 sound/soc/codecs/tfa989x.c                         |   21 +
 sound/soc/codecs/tlv320aic32x4-i2c.c               |    4 +-
 sound/soc/codecs/tlv320aic32x4-spi.c               |    4 +-
 sound/soc/codecs/tlv320aic32x4.c                   |    4 +-
 sound/soc/codecs/tlv320aic32x4.h                   |    2 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    4 +-
 sound/soc/codecs/tlv320aic3x-spi.c                 |    4 +-
 sound/soc/codecs/tlv320aic3x.c                     |    3 +-
 sound/soc/codecs/tlv320aic3x.h                     |    2 +-
 sound/soc/codecs/wcd9335.c                         |    2 +-
 sound/soc/codecs/wcd938x.c                         |    6 +-
 sound/soc/codecs/wm2200.c                          |   30 +-
 sound/soc/codecs/wm5102.c                          |   16 +-
 sound/soc/codecs/wm5110.c                          |   24 +-
 sound/soc/codecs/wm8731.c                          |    6 -
 sound/soc/codecs/wm8900.c                          |    6 -
 sound/soc/codecs/wm8960.c                          |   13 +-
 sound/soc/codecs/wm8962.c                          |   13 +-
 sound/soc/codecs/wm_adsp.c                         | 3303 ++----------------
 sound/soc/codecs/wm_adsp.h                         |  105 +-
 sound/soc/codecs/zl38060.c                         |    4 +-
 sound/soc/dwc/dwc-i2s.c                            |   12 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    2 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   54 +-
 sound/soc/fsl/fsl_audmix.c                         |    8 +-
 sound/soc/fsl/fsl_esai.c                           |   28 +-
 sound/soc/fsl/fsl_mqs.c                            |    4 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   47 +-
 sound/soc/fsl/fsl_rpmsg.h                          |   12 +
 sound/soc/fsl/fsl_sai.c                            |   34 +-
 sound/soc/fsl/fsl_sai.h                            |    2 +-
 sound/soc/fsl/fsl_spdif.c                          |   85 +
 sound/soc/fsl/fsl_ssi.c                            |   38 +-
 sound/soc/fsl/fsl_xcvr.c                           |   17 +-
 sound/soc/fsl/imx-audmix.c                         |   12 +-
 sound/soc/fsl/imx-card.c                           |    6 +-
 sound/soc/fsl/imx-es8328.c                         |    2 +-
 sound/soc/fsl/imx-hdmi.c                           |    6 +-
 sound/soc/fsl/imx-rpmsg.c                          |    2 +-
 sound/soc/fsl/imx-sgtl5000.c                       |    2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   16 +-
 sound/soc/fsl/p1022_ds.c                           |   16 +-
 sound/soc/fsl/p1022_rdk.c                          |    2 +-
 sound/soc/generic/Kconfig                          |   20 +
 sound/soc/generic/Makefile                         |    6 +
 sound/soc/generic/audio-graph-card.c               |    4 +-
 .../soc/generic/audio-graph-card2-custom-sample.c  |  183 +
 .../generic/audio-graph-card2-custom-sample.dtsi   |  227 ++
 sound/soc/generic/audio-graph-card2.c              | 1281 +++++++
 sound/soc/generic/simple-card-utils.c              |   50 +-
 sound/soc/generic/test-component.c                 |  659 ++++
 sound/soc/intel/boards/Kconfig                     |   18 +-
 sound/soc/intel/boards/Makefile                    |    2 +
 sound/soc/intel/boards/bdw-rt5650.c                |    2 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    2 +-
 sound/soc/intel/boards/broadwell.c                 |    2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    4 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    4 +-
 sound/soc/intel/boards/bytcht_da7213.c             |    4 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   41 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |    4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  120 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |  122 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |    4 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    4 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   56 +-
 sound/soc/intel/boards/haswell.c                   |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    4 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    6 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |    6 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |    4 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |    4 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |    4 +-
 sound/soc/intel/boards/skl_rt286.c                 |    2 +-
 sound/soc/intel/boards/sof_es8336.c                |  569 ++++
 sound/soc/intel/boards/sof_rt5682.c                |   96 +-
 sound/soc/intel/boards/sof_sdw.c                   |   10 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   24 +-
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |    8 +-
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |   68 +-
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |   69 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |    8 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |   17 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   27 +-
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |   12 +-
 sound/soc/intel/common/soc-acpi-intel-skl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   60 +-
 sound/soc/intel/skylake/skl-topology.c             |    6 +-
 sound/soc/mediatek/Kconfig                         |   23 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |    3 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |    2 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |    2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    2 +-
 sound/soc/mediatek/mt8195/Makefile                 |    1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |   10 +-
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c      |  152 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c        |    8 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |    4 +-
 .../mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c  | 1155 +++++++
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  |   54 +-
 sound/soc/meson/aiu-encoder-spdif.c                |    2 +-
 sound/soc/meson/axg-card.c                         |    1 +
 sound/soc/meson/axg-tdm-interface.c                |   26 +-
 sound/soc/meson/meson-card-utils.c                 |    1 +
 sound/soc/meson/meson-codec-glue.c                 |    3 -
 sound/soc/qcom/Kconfig                             |   25 +-
 sound/soc/qcom/apq8096.c                           |    2 +-
 sound/soc/qcom/common.c                            |    4 +-
 sound/soc/qcom/qdsp6/Makefile                      |   11 +-
 sound/soc/qcom/qdsp6/audioreach.c                  | 1130 +++++++
 sound/soc/qcom/qdsp6/audioreach.h                  |  726 ++++
 sound/soc/qcom/qdsp6/q6afe-clocks.c                |  187 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  689 +---
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  416 +++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |  260 ++
 sound/soc/qcom/qdsp6/q6apm.c                       |  822 +++++
 sound/soc/qcom/qdsp6/q6apm.h                       |  152 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |  186 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h          |   30 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |  627 ++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h           |   22 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   85 +
 sound/soc/qcom/qdsp6/q6prm.c                       |  202 ++
 sound/soc/qcom/qdsp6/q6prm.h                       |   78 +
 sound/soc/qcom/qdsp6/topology.c                    | 1113 ++++++
 sound/soc/qcom/sm8250.c                            |   79 +
 sound/soc/rockchip/Kconfig                         |   11 +
 sound/soc/rockchip/Makefile                        |    5 +-
 sound/soc/rockchip/rockchip_i2s.c                  |    3 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 1762 ++++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h              |  398 +++
 sound/soc/rockchip/rockchip_pcm.c                  |   44 -
 sound/soc/rockchip/rockchip_pcm.h                  |   11 -
 sound/soc/rockchip/rockchip_pdm.c                  |  112 +-
 sound/soc/rockchip/rockchip_pdm.h                  |    6 +
 sound/soc/samsung/s3c-i2s-v2.c                     |    2 +
 sound/soc/sh/rcar/core.c                           |    1 +
 sound/soc/soc-acpi.c                               |   24 +-
 sound/soc/soc-component.c                          |   87 +-
 sound/soc/soc-compress.c                           |   43 +-
 sound/soc/soc-core.c                               |   55 +-
 sound/soc/soc-dapm.c                               |   15 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |    6 +-
 sound/soc/soc-pcm.c                                |   27 +-
 sound/soc/soc-topology.c                           |   52 +-
 sound/soc/soc-utils.c                              |   13 +
 sound/soc/sof/Kconfig                              |    6 +-
 sound/soc/sof/Makefile                             |    6 +-
 sound/soc/sof/compress.c                           |  158 +-
 sound/soc/sof/compress.h                           |   32 -
 sound/soc/sof/control.c                            |  192 +-
 sound/soc/sof/core.c                               |   35 +-
 sound/soc/sof/debug.c                              |   87 +-
 sound/soc/sof/imx/Kconfig                          |    2 +
 sound/soc/sof/imx/imx-ops.h                        |   10 +
 sound/soc/sof/imx/imx8.c                           |   47 +-
 sound/soc/sof/imx/imx8m.c                          |   41 +-
 sound/soc/sof/intel/Makefile                       |    5 +-
 sound/soc/sof/intel/apl.c                          |    7 +-
 sound/soc/sof/intel/atom.c                         |    5 +-
 sound/soc/sof/intel/bdw.c                          |   19 +-
 sound/soc/sof/intel/byt.c                          |   30 +-
 sound/soc/sof/intel/cnl.c                          |    7 +-
 sound/soc/sof/intel/hda-dai.c                      |  262 +-
 sound/soc/sof/intel/hda-dsp.c                      |   61 +-
 sound/soc/sof/intel/hda-ipc.c                      |   15 +-
 sound/soc/sof/intel/hda-loader.c                   |   11 +-
 .../soc/sof/intel/{hda-compress.c => hda-probes.c} |    0
 sound/soc/sof/intel/hda-stream.c                   |   92 +-
 sound/soc/sof/intel/hda.c                          |  232 +-
 sound/soc/sof/intel/hda.h                          |   52 +-
 sound/soc/sof/intel/icl.c                          |    7 +-
 sound/soc/sof/intel/pci-apl.c                      |    2 -
 sound/soc/sof/intel/pci-cnl.c                      |    3 -
 sound/soc/sof/intel/pci-icl.c                      |    2 -
 sound/soc/sof/intel/pci-tgl.c                      |    5 -
 sound/soc/sof/intel/pci-tng.c                      |   16 +-
 sound/soc/sof/intel/tgl.c                          |    7 +-
 sound/soc/sof/ipc.c                                |  217 +-
 sound/soc/sof/loader.c                             |  161 +-
 sound/soc/sof/ops.c                                |    3 +
 sound/soc/sof/ops.h                                |   77 +-
 sound/soc/sof/pcm.c                                |   71 +-
 sound/soc/sof/pm.c                                 |   12 +-
 sound/soc/sof/probe.h                              |   85 -
 sound/soc/sof/sof-audio.c                          |  715 +++-
 sound/soc/sof/sof-audio.h                          |   52 +-
 sound/soc/sof/sof-of-dev.c                         |   24 +-
 sound/soc/sof/sof-priv.h                           |  154 +-
 sound/soc/sof/{probe.c => sof-probes.c}            |  280 +-
 sound/soc/sof/sof-probes.h                         |   38 +
 sound/soc/sof/{intel/intel-ipc.c => stream-ipc.c}  |   56 +-
 sound/soc/sof/topology.c                           |  417 +--
 sound/soc/sof/trace.c                              |    5 +-
 sound/soc/sof/utils.c                              |   28 +-
 sound/soc/sof/xtensa/core.c                        |    2 +-
 sound/soc/tegra/Kconfig                            |   48 +
 sound/soc/tegra/Makefile                           |   10 +
 sound/soc/tegra/tegra210_adx.c                     |  531 +++
 sound/soc/tegra/tegra210_adx.h                     |   72 +
 sound/soc/tegra/tegra210_ahub.c                    |  511 ++-
 sound/soc/tegra/tegra210_amx.c                     |  600 ++++
 sound/soc/tegra/tegra210_amx.h                     |   93 +
 sound/soc/tegra/tegra210_mixer.c                   |  674 ++++
 sound/soc/tegra/tegra210_mixer.h                   |  100 +
 sound/soc/tegra/tegra210_mvc.c                     |  645 ++++
 sound/soc/tegra/tegra210_mvc.h                     |  117 +
 sound/soc/tegra/tegra210_sfc.c                     | 3549 ++++++++++++++++++++
 sound/soc/tegra/tegra210_sfc.h                     |   78 +
 sound/soc/tegra/tegra_asoc_machine.c               |   62 +-
 sound/soc/tegra/tegra_asoc_machine.h               |    1 +
 sound/soc/ti/Kconfig                               |    2 +-
 sound/soc/ti/davinci-evm.c                         |    2 +-
 sound/soc/ti/omap-abe-twl6040.c                    |    2 +-
 sound/soc/ux500/mop500_ab8500.c                    |    2 +-
 sound/soc/ux500/mop500_ab8500.h                    |    2 +-
 429 files changed, 46511 insertions(+), 7638 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/bt-sco.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98520.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/simple-amplifier.txt
 create mode 100644 Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/spdif-transmitter.txt
 create mode 100644 Documentation/devicetree/bindings/sound/test-component.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8962.txt
 create mode 100644 drivers/firmware/cirrus/Kconfig
 create mode 100644 drivers/firmware/cirrus/Makefile
 create mode 100644 drivers/firmware/cirrus/cs_dsp.c
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
 create mode 100644 include/linux/firmware/cirrus/cs_dsp.h
 rename {sound/soc/codecs => include/linux/firmware/cirrus}/wmfw.h (91%)
 create mode 100644 include/sound/cs35l41.h
 create mode 100644 include/sound/rt5682s.h
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/amd/acp/Kconfig
 create mode 100644 sound/soc/amd/acp/Makefile
 create mode 100644 sound/soc/amd/acp/acp-i2s.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c
 create mode 100644 sound/soc/amd/acp/acp-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp-mach.h
 create mode 100644 sound/soc/amd/acp/acp-platform.c
 create mode 100644 sound/soc/amd/acp/acp-renoir.c
 create mode 100644 sound/soc/amd/acp/acp-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd.h
 create mode 100644 sound/soc/amd/acp/chip_offset_byte.h
 create mode 100644 sound/soc/amd/vangogh/acp5x-mach.c
 create mode 100644 sound/soc/amd/yc/Makefile
 create mode 100644 sound/soc/amd/yc/acp6x-mach.c
 create mode 100644 sound/soc/amd/yc/acp6x-pdm-dma.c
 create mode 100644 sound/soc/amd/yc/acp6x.h
 create mode 100644 sound/soc/amd/yc/acp6x_chip_offset_byte.h
 create mode 100644 sound/soc/amd/yc/pci-acp6x.c
 create mode 100644 sound/soc/codecs/cs35l41-i2c.c
 create mode 100644 sound/soc/codecs/cs35l41-spi.c
 create mode 100644 sound/soc/codecs/cs35l41-tables.c
 create mode 100644 sound/soc/codecs/cs35l41.c
 create mode 100644 sound/soc/codecs/cs35l41.h
 create mode 100644 sound/soc/codecs/max98520.c
 create mode 100644 sound/soc/codecs/max98520.h
 create mode 100644 sound/soc/codecs/nau8821.c
 create mode 100644 sound/soc/codecs/nau8821.h
 create mode 100644 sound/soc/codecs/rt5682s.c
 create mode 100644 sound/soc/codecs/rt5682s.h
 create mode 100644 sound/soc/codecs/rt9120.c
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample.c
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2.c
 create mode 100644 sound/soc/generic/test-component.c
 create mode 100644 sound/soc/intel/boards/sof_es8336.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h
 create mode 100644 sound/soc/qcom/qdsp6/q6prm-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.h
 create mode 100644 sound/soc/qcom/qdsp6/topology.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.h
 delete mode 100644 sound/soc/rockchip/rockchip_pcm.c
 delete mode 100644 sound/soc/rockchip/rockchip_pcm.h
 delete mode 100644 sound/soc/sof/compress.h
 create mode 100644 sound/soc/sof/imx/imx-ops.h
 rename sound/soc/sof/intel/{hda-compress.c => hda-probes.c} (100%)
 delete mode 100644 sound/soc/sof/probe.h
 rename sound/soc/sof/{probe.c => sof-probes.c} (52%)
 create mode 100644 sound/soc/sof/sof-probes.h
 rename sound/soc/sof/{intel/intel-ipc.c => stream-ipc.c} (56%)
 create mode 100644 sound/soc/tegra/tegra210_adx.c
 create mode 100644 sound/soc/tegra/tegra210_adx.h
 create mode 100644 sound/soc/tegra/tegra210_amx.c
 create mode 100644 sound/soc/tegra/tegra210_amx.h
 create mode 100644 sound/soc/tegra/tegra210_mixer.c
 create mode 100644 sound/soc/tegra/tegra210_mixer.h
 create mode 100644 sound/soc/tegra/tegra210_mvc.c
 create mode 100644 sound/soc/tegra/tegra210_mvc.h
 create mode 100644 sound/soc/tegra/tegra210_sfc.c
 create mode 100644 sound/soc/tegra/tegra210_sfc.h
