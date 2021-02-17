Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DD31DF5B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 20:03:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D7915E4;
	Wed, 17 Feb 2021 20:02:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D7915E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613588604;
	bh=j/Hhg/jVSMUWJek3+cJCwzqXo/0UvwATTToxueVEoaQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jmOmafQzTp/RNrKJA/7XAudr8pa+bY6zzOPYgv36tKQkQmYBobrlyhnrYnXbdtx8P
	 BXQeE7wUrnTz6XyXmPruDItPuhu+F/q3Z/WRH3mkqnJknauwfmRhZ19gux3LanLApK
	 Go/tO2hElCe0hFIk3r81dCdU3PEWmFdFDZz/Apjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A0DF8025B;
	Wed, 17 Feb 2021 20:01:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8ED7F80258; Wed, 17 Feb 2021 20:01:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_141,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E46B0F800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 20:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46B0F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K1GnCW/z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B7DC6186A;
 Wed, 17 Feb 2021 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613588503;
 bh=j/Hhg/jVSMUWJek3+cJCwzqXo/0UvwATTToxueVEoaQ=;
 h=From:To:Cc:Subject:Date:From;
 b=K1GnCW/z7YUa7Kr+foD0FCo5HQIy/MHZ1a5JGOTAP7OtbpciZabgBlsvxnC1vRjjQ
 7/I5aqM+HbU3q3NWeijmlpHyZSGXccZBqhL+0WuWrf7F1b7y+thg0wGMEIkyLpZLo3
 N7fh6ubPxf/t5zovJptPEY6euYifa/doSblc2GhT+OmfuAYP+C2hdYyV2hbyLurixr
 gxajYyRC2eG8blpUg5BitNxzuvWBZifi4wUCkP9Qhsi5spMh1ySamhrcXZNfN9iYrY
 i0itG3/3t8xs74CfssVoALQ0bwLlYzE0CD0bRmgEE94De5gbtp8ntir2ggI6WD/JBH
 y7kZh+mR7Yi7g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.12
Date: Wed, 17 Feb 2021 19:00:39 +0000
Message-Id: <20210217190143.1B7DC6186A@mail.kernel.org>
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

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.12

for you to fetch changes up to 0969db0d8d15caee41cd817154670c38d9ed7f61:

  Merge remote-tracking branch 'asoc/for-5.12' into asoc-linus (2021-02-17 18:52:26 +0000)

----------------------------------------------------------------
ASoC: Updates for v5.12

Another quiet release in terms of features, though several of the
drivers got quite a bit of work and there were a lot of general changes
resulting from Morimoto-san's ongoing cleanup work.

 - As ever, lots of hard work by Morimoto-san cleaning up the code and
   making it more consistent.
 - Many improvements in the Intel drivers including a wide range of
   quirks and bug fixes.
 - A KUnit testsuite for the topology code.
 - Support for Ingenic JZ4760(B), Intel AlderLake-P, DT configured
   nVidia cards, Qualcomm lpass-rx-macro and lpass-tx-macro
 - Removal of obsolete SIRF prima/atlas, Txx9 and ZTE zx drivers.

----------------------------------------------------------------
Adam Ford (1):
      ASoC: wm8962: Add optional mclk device tree binding

Amadeusz Sławiński (6):
      ASoC: topology: KUnit: Add KUnit tests passing various arguments to snd_soc_tplg_component_load
      ASoC: topology: KUnit: Add KUnit tests passing empty topology with variants to snd_soc_tplg_component_load
      ASoC: topology: KUnit: Add KUnit tests passing topology with PCM to snd_soc_tplg_component_load
      ASoC: topology: Ensure that needed parameters are set
      ASoC: topology: Check if ops is set before dereference
      ASoC: topology: KUnit: Convert from cpu to data format

Andy Shevchenko (2):
      catpt: Switch to use list_entry_is_head() helper
      ASoC: sprd: Switch to use list_entry_is_head() helper

Arnd Bergmann (4):
      ASoC: mediatek: add MTK_PMIC_WRAP dependency
      ASoC: fsl_aud2htx: select SND_SOC_IMX_PCM_DMA
      ASoC: remove sirf prima/atlas drivers
      ASoC: remove zte zx drivers

Bard Liao (8):
      ASoC: SOF: Intel: hda: use snd_sof_dsp_core_power_up/down API
      ASoC: SOF: Intel: hda-loader: keep init cores alive
      ASoC: SOF: update dsp core power status in common APIs
      ASoC: SOF: Filter out unneeded core power up/downs
      ASoC: SOF: intel: hda-loader: use snd_sof_dsp_core_power_down/up APIs
      ASoC: rt5682: do nothing in rt5682_suspend/resume in sdw mode
      ASoC: Intel: boards: max98373: get dapm from cpu_dai
      ASoC: intel: sof_sdw: add trace for dai links

Bjorn Helgaas (1):
      ASoC: q6asm: fix 'physical' typos

Charles Keepax (1):
      ASoC: wm_adsp: Remove unused control callback structure

Chris Chiu (4):
      ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
      ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series
      ASoC: rt5645: add inv_hp_det flag
      ASoC: rt5645: Enable internal microphone and JD on ECS EF20

Christophe Branchereau (1):
      ASoC: codec: Add driver for JZ4760 internal codec

Christophe JAILLET (1):
      ASoC: Intel: common: Fix some typos

Curtis Malainey (2):
      ASoC: SOF: add missing pm debug
      ASoC: SOF: fix string format for errors

Dan Carpenter (2):
      ASoC: soc-pcm: Fix an uninitialized error code
      ASoC: cs42l56: fix up error handling in probe

Dmitry Osipenko (3):
      ASoC: tegra: ahub: Add missing resets
      ASoC: tegra: ahub: Use clk_bulk helpers
      ASoC: tegra: ahub: Reset hardware properly

Fabio Estevam (7):
      ASoC: fsl_ssi: Use of_device_get_match_data()
      ASoC: fsl_micfil: Use of_device_get_match_data()
      ASoC: fsl_xcvr: Remove unused of_id variable
      ASoC: fsl_asrc: Remove of_device_get_match_data() error check
      ASoC: fsl_esai: Remove of_device_get_match_data() error check
      ASoC: fsl_spdif: Remove of_device_get_match_data() error check
      ASoC: fsl_esai: Remove unused 'imx' field

Fred Oh (1):
      ASoC: SOF: ext_manifest: use explicit number for elem_type

Geert Uytterhoeven (2):
      ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend on SND_SOC_TEGRA
      ASoC: dt-bindings: renesas, rsnd: Group tuples in playback/capture properties

Guennadi Liakhovetski (3):
      ASoC: SOF: remove unused functions
      ASoC: SOF: HDA: (cosmetic) simplify hda_dsp_d0i3_work()
      ASoC: SOF: Intel: HDA: don't keep a temporary variable

Hans de Goede (14):
      ASoC: Intel: bytcht_es8316: Remove comment about SSP0 being untested
      ASoC: Intel: bytcr_rt5640: Add new BYT_RT5640_NO_SPEAKERS quirk-flag
      ASoC: Intel: bytcr_rt5640: Add new BYT_RT5640_NO_INTERNAL_MIC_MAP input-mapping
      ASoC: Intel: bytcr_rt5640: Add quirk for the Mele PCG03 Mini PC
      ASoC: Intel: cht_bsw_nau8824: Move snd_soc_dai_set_tdm_slot call to cht_codec_fixup
      ASoC: es8316: Fix possible NULL pointer deref in es8316_disable_jack_detect()
      mfd: arizona: Add MODULE_SOFTDEP("pre: arizona_ldo1")
      mfd: arizona: Replace arizona_of_get_type() with device_get_match_data()
      mfd: arizona: Add support for ACPI enumeration of WM5102 connected over SPI
      ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()
      ASoC: Intel: bytcr_rt5640: Add quirk for the Estar Beauty HD MID 7316R tablet
      ASoC: Intel: bytcr_rt5640: Add quirk for the Voyo Winpad A15 tablet
      ASoC: Intel: bytcr_rt5651: Add quirk for the Jumper EZpad 7 tablet
      ASoC: Intel: bytcr_rt5640: Add quirk for the Acer One S1002 tablet

Hui Wang (1):
      ASoC: SOF: debug: Fix a potential issue on string buffer termination

Jack Yu (1):
      ASoC: rt1015: modify calibration sequence for better performance

Jiaxin Yu (1):
      ASoC: mediatek: mt8183-mt6358: set playback and capture constraints

Judy Hsiao (1):
      ASoC: max98373: Fixes a typo in max98373_feedback_get

Jun Nie (1):
      ASoC: qcom: lpass: Fix i2s ctl register bit map

Kai Vehmanen (7):
      ASoC: SOF: Intel: initial support to AlderLake-P
      ASoC: SOF: add a pointer to download repo in case FW request fails
      ASoC: Intel: remove duplicate MODULE_LICENSE/DESCRIPTION tags
      ASoC: SOF: fix runtime pm usage mismatch after probe errors
      ASoC: SOF: relax ABI checks and avoid unnecessary warnings
      ASoC: soc-pcm: fix hwparams min/max init for dpcm
      ASoC: soc-pcm: fix hw param limits calculation for multi-DAI

Keyon Jie (5):
      ASoC: SOF: add mutex to protect the dsp_power_state access
      ASoC: SOF: add .shutdown() callback to snd_sof_dsp_ops
      ASoC: SOF: add snd_sof_device_shutdown() helper for shutdown
      ASoC: SOF: sof-pci-dev: add .shutdown() callback
      ASoC: SOF: Intel: tgl: do thorough remove at .shutdown() callback

Kuninori Morimoto (56):
      ASoC: soc-pcm: move dpcm_set_fe_update_state()
      ASoC: soc-pcm: add dpcm_set_be_update_state()
      ASoC: soc-pcm: add soc_pcm_set_dai_params()
      ASoC: soc-pcm: cleanup soc_pcm_apply_symmetry()
      ASoC: soc-pcm: revert soc_pcm_apply_symmetry()
      ASoC: sync parameter naming : rate / sample_bits
      ASoC: adi: sync parameter naming (rate/sample_bits)
      ASoC: atmel: sync parameter naming (rate/sample_bits)
      ASoC: au1x: sync parameter naming (rate/sample_bits)
      ASoC: bcm: sync parameter naming (rate/sample_bits)
      ASoC: cirrus: sync parameter naming (rate/sample_bits)
      ASoC: tegra: sync parameter naming (rate/sample_bits)
      ASoC: rockchip: sync parameter naming (rate/sample_bits)
      ASoC: samsung: sync parameter naming (rate/sample_bits)
      ASoC: sh: sync parameter naming (rate/sample_bits)
      ASoC: ti: sync parameter naming (rate/sample_bits)
      ASoC: pxa: sync parameter naming (rate/sample_bits)
      ASoC: mediatek: sync parameter naming (rate/sample_bits)
      ASoC: fsl: sync parameter naming (rate/sample_bits)
      ASoC: wm*: sync parameter naming (rate/sample_bits)
      ASoC: tlv*: sync parameter naming (rate/sample_bits)
      ASoC: rt*: sync parameter naming (rate/sample_bits)
      ASoC: nau*: sync parameter naming (rate/sample_bits)
      ASoC: tas*: sync parameter naming (rate/sample_bits)
      ASoC: da*: sync parameter naming (rate/sample_bits)
      ASoC: es*: sync parameter naming (rate/sample_bits)
      ASoC: max*: sync parameter naming (rate/sample_bits)
      ASoC: cs*: sync parameter naming (rate/sample_bits)
      ASoC: tscs*: sync parameter naming (rate/sample_bits)
      ASoC: ak*: sync parameter naming (rate/sample_bits)
      ASoC: adau*: sync parameter naming (rate/sample_bits)
      ASoC: jz4740: sync parameter naming (rate/sample_bits)
      ASoC: sunxi: sync parameter naming (rate/sample_bits)
      ASoC: zl38060: sync parameter naming (rate/sample_bits)
      ASoC: ssm2602: sync parameter naming (rate/sample_bits)
      ASoC: sgtl5000: sync parameter naming (rate/sample_bits)
      ASoC: mc13783: sync parameter naming (rate/sample_bits)
      ASoC: mt6660: sync parameter naming (rate/sample_bits)
      ASoC: lochnagar-sc: sync parameter naming (rate/sample_bits)
      ASoC: ab8500: sync parameter naming (rate/sample_bits)
      ASoC: alc5632: sync parameter naming (rate/sample_bits)
      ASoC: cx2072x: sync parameter naming (rate/sample_bits)
      ASoC: inno_rk3036: sync parameter naming (rate/sample_bits)
      ASoC: lm49453: sync parameter naming (rate/sample_bits)
      ASoC: ml26124: sync parameter naming (rate/sample_bits)
      ASoC: soc-dai.h: remove symmetric_rates/samplebits
      ASoC: soc-pcm: cleanup soc_pcm_apply_symmetry()
      ASoC: soc-pcm: cleanup soc_pcm_params_symmetry()
      ASoC: soc-pcm: tidyup pcm setting
      ASoC: soc-pcm: add soc_get_playback_capture() and simplify soc_new_pcm()
      ASoC: soc-pcm: add soc_create_pcm() and simplify soc_new_pcm()
      ASoC: soc-pcm: use snd_pcm_hardware at dpcm_runtime_merge_xxx()
      ASoC: soc-pcm: fixup snd_pcm_limit_hw_rates() timing
      ASoC: soc-pcm: add soc_pcm_hw_update_rate()
      ASoC: soc-pcm: add soc_pcm_hw_update_chan()
      ASoC: soc-pcm: add soc_pcm_hw_update_format()

Lars-Peter Clausen (4):
      ASoC: meson: Use managed DMA buffer allocation
      ASoC: atmel-pdc: Use managed DMA buffer allocation
      ASoC: bcm: cygnus: Use managed DMA buffer allocation
      ASoC: kirkwood: Use managed DMA buffer allocation

Libin Yang (3):
      ASoC: SOF: allow soundwire use desc->default_fw_filename
      ASoC: Intel: tgl: remove sof_fw_filename set for tgl_3_in_1_default
      ASoC: Intel: adl: remove sof_fw_filename setting in ADL snd_soc_acpi_mach

Mark Brown (35):
      Merge existing fixes from asoc/for-5.11
      Merge series "ASoC: rt1015: apply some refactors" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "Enable DMA mode on Intel Keem Bay platform" from Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>:
      Merge series "ASoC: rt5645: Enable internal mic and headset on ECS EF20" from Chris Chiu <chiu@endlessos.org>:
      Merge series "ASoC: Intel: bytcr_rt5640: Add support for devices with only a headphone jack (no speakers/mic)" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: soc-pcm: cleanup code" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge v5.11-rc3
      Merge series "ASoC: qcom: Minor code cleanups for lpass-cpu" from Stephen Boyd <swboyd@chromium.org>:
      Merge series "ASoC/SoundWire: fix timeout values" from Bard Liao <yung-chuan.liao@linux.intel.com>:
      Merge series "ASoC: Simplify with dma_set_mask_and_coherent()" from Takashi Iwai <tiwai@suse.de>:
      Merge series "Tegra210 audio graph card" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ASoC: remove obsolete drivers" from Arnd Bergmann <arnd@kernel.org> Arnd Bergmann <arnd@arndb.de>:
      Merge series "ASoC: mediatek: mt8192-mt6359: support DP audio" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "Add KUNIT tests for ASoC topology" from Amadeusz Sławiński<amadeuszx.slawinski@linux.intel.com>:
      Merge series "ASoC: sync parameter naming : rate / sample_bits" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "Add sanity checks for topology API calls" from Amadeusz Sławiński<amadeuszx.slawinski@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: hda: Enable DMI L1 for power savings" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "ASoC: SOF: use common code for DSP core pm" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "Tegra186 and Tegra194 audio graph card" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ASoC: soc-pcm: cleanup soc_new_pcm() and bugfix" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: mediatek: mt8192: apply some cleanup" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: SOF/Intel/SoundWire: add missing quirks and DMIC support" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge branch 'asoc-5.11' into asoc-5.12
      Merge series "ASoC: stm32: i2s: add master clock provider" from Olivier Moysan <olivier.moysan@foss.st.com>:
      Merge series "Rename audio graph export functions" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "Add HDMI support for Intel KeemBay I2S" from Sia Jee Heng <jee.heng.sia@intel.com>:
      Merge tag 'ib-mfd-asoc-v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into asoc-5.12
      Merge series "MFD/ASoC: Add support for Intel Bay Trail boards with WM5102 codec" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: SOF/Intel/SoundWire: add missing quirks and DMIC support" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: cleanups" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: dapm/pins: handle component prefix" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Use clocks property in a device node" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ASoC: Intel: bytcr_rt5640: Add quirks for 4 more tablet / 2-in-1 models" from Hans de Goede <hdegoede@redhat.com>:
      Merge remote-tracking branch 'asoc/for-5.11' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.12' into asoc-linus

Michael Sit Wei Hong (3):
      ASoC: Intel: KMB: Enable DMA transfer mode
      ASoC: intel, keembay-i2s: Add info for device to use DMA
      ASoC: intel, keembay-i2s: Fix dt binding errors

Oder Chiou (1):
      ASoC: rt5645: Remove the redundant delay time

Olivier Moysan (2):
      ASoC: dt-bindings: add mclk provider support to stm32 i2s
      ASoC: stm32: i2s: add master clock provider

Paul Cercueil (2):
      ASoC: codec/ingenic: Depend on MACH_INGENIC
      ASoC: Add compatible strings for JZ4760(B) SoC

Pierre-Louis Bossart (17):
      ASoC: codecs: soundwire: increase resume timeout
      ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A5E
      ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A32
      ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A3E
      ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend
      ASoC: rt711-sdw: use cancel_work_sync() for .remove
      ASoC: rt5682-sdw: cancel_work_sync() in .remove and .suspend
      ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102
      ASoC: SOF: sof-pci-dev: add missing Up-Extreme quirk
      ASoC: Intel: sof_sdw: reorganize quirks by generation
      ASoC: Intel: sof-sdw: indent and add quirks consistently
      ASoC: Intel: sof_sdw: add quirk for HP Spectre x360 convertible
      ASoC: Intel: sof_sdw: add mic:dmic and cfg-mics component strings
      ASoC: Intel: soc-acpi: add ACPI matching table for HP Spectre x360
      ASoC: SOF: Intel: SoundWire: refine ACPI match
      ASoC: SOF: Intel: detect DMIC number in SoundWire mixed config
      ASoC: SOF: Intel: hda: add dev_dbg() when DMIC number is overridden

Rander Wang (2):
      ASoC: SOF: add be_hw_params_fixup() for ALH
      ASoC: Intel: sof_sdw: detect DMIC number based on mach params

Ranjani Sridharan (4):
      ASoC: SOF: Intel: hda: enable DMI L1 for D0i3-compatible streams
      ASoC: SOF: Intel: hda: Enable DMI L1 for trace
      ASoC: SOF: Intel: hda: cancel D0i3 work during runtime suspend
      ASoC: SOF: topology: Prevent NULL pointer dereference with no TLV

Richard Fitzgerald (4):
      ASoC: wm_adsp: Improve handling of raw byte streams
      ASoC: wm_adsp: Only use __be32 for big-endian data
      ASoC: wm_adsp: Use snd_ctl_elem_type_t for control types
      ASoC: wm_adsp: Fix uninitialized variable warnings

Rikard Falkeborn (1):
      ASoC: fsl: constify static snd_soc_dai_ops structs

Sameer Pujar (12):
      ASoC: audio-graph-card: Drop remote-endpoint as required property
      ASoC: dt-bindings: tegra: Add graph bindings
      ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
      ASoC: tegra: Add audio graph based card driver
      ASoC: dt-bindings: rt5659: Update binding doc
      ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
      ASoC: audio-graph-card: Add clocks property to endpoint node
      ASoC: rt5659: Add Kconfig prompt
      ASoC: audio-graph: Rename functions needed for export
      ASoC: tegra: Add driver remove() callback
      ASoC: simple-card-utils: Fix device module clock
      ASoC: audio-graph-card: Drop device node clocks property

Sathyanarayana Nujella (1):
      ASoC: rt5682: Fix panic in rt5682_jack_detect_handler happening during system shutdown

Sebastian Reichel (1):
      ASoC: cpcap: fix microphone timeslot mask

Shengjiu Wang (2):
      ASoC: dmaengine_pcm: add peripheral configuration
      ASoC: soc-pcm: change error message to debug message

Shuming Fan (4):
      ASoC: rt5682: fix getting the wrong device id when the suspend_stress_test
      ASoC: rt5682: enable fast discharge for headset unplugging
      ASoC: rt5682: remove connection with LDO2 in DAPM graph
      ASoC: dapm: use component prefix when checking widget names

Sia Jee Heng (3):
      ASoC: codec: hdmi-codec: Support IEC958 encoded PCM format
      ASoC: Intel: KMB: Support IEC958 encoded PCM format
      ASoC: Intel, Keembay-i2s: Add hdmi-i2s compatible string

Souptick Joarder (1):
      ASoC: soc-pcm: return correct -ERRNO in failure path

Srinivas Kandagatla (11):
      ASoC: soc-component: add snd_soc_component_read/write_field()
      ASoC: codecs: lpass-wsa-macro: make use of snd_soc_component_read_field()
      ASoC: soc-component: fix undefined reference to __ffssi2
      ASoC: codecs: add missing max_register in regmap config
      ASoC: qcom: dt-bindings: add bindings for lpass rx macro codec
      ASoC: codecs: lpass-rx-macro: add support for lpass rx macro
      ASoC: codecs: lpass-rx-macro: add dapm widgets and route
      ASoC: codecs: lpass-rx-macro: add iir widgets
      ASoC: qcom: dt-bindings: add bindings for lpass tx macro codec
      ASoC: codecs: lpass-tx-macro: add support for lpass tx macro
      ASoC: codecs: lpass-tx-macro: add dapm widgets and route

Srinivasa Rao Mandadapu (2):
      ASoC: qcom: lpass-cpu: Remove bit clock state check
      ASoC: qcom: Fix typo error in HDMI regmap config callbacks

Stephan Gerhold (1):
      ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai

Stephen Boyd (5):
      ASoC: qcom: Remove useless debug print
      ASoC: qcom: Add some names to regmap configs
      ASoC: qcom: Stop casting away __iomem for error pointers
      ASoC: qcom: Remove duplicate error messages on ioremap
      ASoC: da7218: Drop CONFIG_OF ifdef

Takashi Iwai (4):
      ASoC: intel: skl: Simplify with dma_set_mask_and_coherent()
      ASoC: SOF: intel: Simplify with dma_set_mask_and_coherent()
      ASoC: tegra: Simplify with dma_set_mask_and_coherent()
      ASoC: siu: Fix build error by a wrong const prefix

Tang Bin (1):
      ASoC: fsl_spdif: Utilize the defined parameter to clear code

Thomas Bogendoerfer (1):
      ASoC: txx9: Remove driver

Tony Lindgren (1):
      ASoC: cpcap: Implement set_tdm_slot for voice call support

Tzung-Bi Shih (16):
      ASoC: rt1015: sort header inclusions
      ASoC: rt1015: save boost_mode only if valid
      ASoC: rt1015: return error if any when setting bypass_boost
      ASoC: rt1015: refactor retry loop and rt1015_priv allocation
      ASoC: rt1015: remove unneeded variables in rt1015_priv
      ASoC: rt1015: re-calibrate again when resuming
      ASoC: rt1015: remove bclk_ratio
      ASoC: mediatek: mt8192-mt6359: move headset_jack to card specific data
      ASoC: mediatek: mt8192-mt6359: simplify mt8192_rt5682_init
      ASoC: mediatek: mt8192: change mclk_multiple of TDM from 128 to 512
      ASoC: dt-bindings: mt8192-mt6359: add hdmi-codec property
      ASoC: mediatek: mt8192-mt6359: support audio over DP
      ASoC: mt6359: reduce log verbosity for optional DT properties
      ASoC: mediatek: mt8192-mt6359: use asoc_substream_to_rtd()
      ASoC: mediatek: mt8192: use asoc_substream_to_rtd()
      ASoC: mediatek: mt8192-mt6359: simplify ops for Capture1 DAI link

Xu Wang (2):
      ASoC: es8328: Remove redundant null check before clk_disable_unprepare
      ASoC: adau17x1: Remove redundant null check before clk_disable_unprepare

Yang Li (1):
      ASoC: Intel: catpt: remove unneeded semicolon

Yu-Hsuan Hsu (2):
      cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
      ASoC: cros_ec_codec: Reset I2S RX when probing

朱灿灿 (1):
      ASoC: soc-pcm: disconnect BEs if the FE is not ready

 .../bindings/sound/audio-graph-port.yaml           |    3 -
 .../devicetree/bindings/sound/ingenic,codec.yaml   |   11 +-
 .../bindings/sound/intel,keembay-i2s.yaml          |   13 +
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |    5 +
 .../sound/nvidia,tegra-audio-graph-card.yaml       |  190 ++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |   18 +-
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   13 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   13 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |   18 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |   18 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   62 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |   67 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |    6 +-
 Documentation/devicetree/bindings/sound/rt5659.txt |   11 +
 .../devicetree/bindings/sound/sirf-audio-codec.txt |   17 -
 .../devicetree/bindings/sound/sirf-usp.txt         |   27 -
 .../devicetree/bindings/sound/st,stm32-i2s.yaml    |    4 +
 Documentation/devicetree/bindings/sound/wm8962.txt |    4 +
 .../devicetree/bindings/sound/zte,tdm.txt          |   30 -
 .../devicetree/bindings/sound/zte,zx-aud96p22.txt  |   24 -
 .../devicetree/bindings/sound/zte,zx-i2s.txt       |   45 -
 .../devicetree/bindings/sound/zte,zx-spdif.txt     |   27 -
 drivers/mfd/arizona-core.c                         |   11 -
 drivers/mfd/arizona-i2c.c                          |   11 +-
 drivers/mfd/arizona-spi.c                          |  138 +-
 drivers/mfd/arizona.h                              |    9 -
 include/linux/platform_data/cros_ec_commands.h     |    1 +
 include/sound/dmaengine_pcm.h                      |    5 +
 include/sound/graph_card.h                         |    6 +-
 include/sound/hdmi-codec.h                         |    5 +
 include/sound/rt5645.h                             |    2 +
 include/sound/soc-component.h                      |    6 +
 include/sound/soc-dai.h                            |    4 +-
 include/sound/soc.h                                |    4 +-
 include/sound/sof/ext_manifest.h                   |    6 +-
 sound/core/pcm_dmaengine.c                         |    2 +
 sound/soc/Kconfig                                  |   20 +-
 sound/soc/Makefile                                 |    8 +-
 sound/soc/adi/axi-i2s.c                            |    2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |    4 +-
 sound/soc/atmel/atmel-i2s.c                        |    2 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |   78 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |    4 +-
 sound/soc/au1x/i2sc.c                              |    2 +-
 sound/soc/bcm/bcm2835-i2s.c                        |    4 +-
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |    2 +-
 sound/soc/bcm/cygnus-pcm.c                         |  107 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |    2 +-
 sound/soc/codecs/Kconfig                           |   31 +-
 sound/soc/codecs/Makefile                          |   10 +-
 sound/soc/codecs/ab8500-codec.c                    |    4 +-
 sound/soc/codecs/adau1372.c                        |    2 +-
 sound/soc/codecs/adau1373.c                        |    6 +-
 sound/soc/codecs/adau1701.c                        |    2 +-
 sound/soc/codecs/adau17x1.c                        |    3 +-
 sound/soc/codecs/ak4554.c                          |    2 +-
 sound/soc/codecs/ak4613.c                          |    2 +-
 sound/soc/codecs/ak4641.c                          |    4 +-
 sound/soc/codecs/ak4642.c                          |    2 +-
 sound/soc/codecs/alc5632.c                         |    2 +-
 sound/soc/codecs/cpcap.c                           |  139 +-
 sound/soc/codecs/cros_ec_codec.c                   |   12 +
 sound/soc/codecs/cs35l32.c                         |    2 +-
 sound/soc/codecs/cs35l33.c                         |    2 +-
 sound/soc/codecs/cs35l34.c                         |    2 +-
 sound/soc/codecs/cs35l35.c                         |    2 +-
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs4234.c                          |    2 +-
 sound/soc/codecs/cs4271.c                          |    2 +-
 sound/soc/codecs/cs42l56.c                         |    3 +-
 sound/soc/codecs/cs42l73.c                         |    6 +-
 sound/soc/codecs/cs43130.c                         |    6 +-
 sound/soc/codecs/cs4341.c                          |    2 +-
 sound/soc/codecs/cs4349.c                          |    2 +-
 sound/soc/codecs/cs47l15.c                         |   12 +-
 sound/soc/codecs/cs47l24.c                         |   12 +-
 sound/soc/codecs/cs47l35.c                         |   12 +-
 sound/soc/codecs/cs47l85.c                         |   16 +-
 sound/soc/codecs/cs47l90.c                         |   16 +-
 sound/soc/codecs/cs47l92.c                         |   12 +-
 sound/soc/codecs/cs53l30.c                         |    2 +-
 sound/soc/codecs/cx2072x.c                         |    2 +-
 sound/soc/codecs/da7210.c                          |    2 +-
 sound/soc/codecs/da7213.c                          |    2 +-
 sound/soc/codecs/da7218.c                          |    8 +-
 sound/soc/codecs/da7219.c                          |    4 +-
 sound/soc/codecs/da9055.c                          |    2 +-
 sound/soc/codecs/es8316.c                          |    5 +-
 sound/soc/codecs/es8328.c                          |    5 +-
 sound/soc/codecs/hdmi-codec.c                      |    4 +-
 sound/soc/codecs/inno_rk3036.c                     |    2 +-
 sound/soc/codecs/jz4740.c                          |    2 +-
 sound/soc/codecs/jz4760.c                          |  889 +++++
 sound/soc/codecs/lm49453.c                         |    2 +-
 sound/soc/codecs/lochnagar-sc.c                    |   12 +-
 sound/soc/codecs/lpass-rx-macro.c                  | 3599 ++++++++++++++++++++
 sound/soc/codecs/lpass-tx-macro.c                  | 1862 ++++++++++
 sound/soc/codecs/lpass-wsa-macro.c                 |   43 +-
 sound/soc/codecs/max98373-sdw.c                    |    4 +-
 sound/soc/codecs/max98373.c                        |    2 +-
 sound/soc/codecs/max9860.c                         |    2 +-
 sound/soc/codecs/max9867.c                         |    2 +-
 sound/soc/codecs/mc13783.c                         |    2 +-
 sound/soc/codecs/ml26124.c                         |    2 +-
 sound/soc/codecs/mt6359.c                          |   18 +-
 sound/soc/codecs/mt6660.c                          |    4 +-
 sound/soc/codecs/nau8810.c                         |    2 +-
 sound/soc/codecs/nau8822.c                         |    2 +-
 sound/soc/codecs/rt1015.c                          |  122 +-
 sound/soc/codecs/rt1015.h                          |    5 -
 sound/soc/codecs/rt1308-sdw.c                      |    2 +-
 sound/soc/codecs/rt274.c                           |    2 +-
 sound/soc/codecs/rt286.c                           |    4 +-
 sound/soc/codecs/rt298.c                           |    4 +-
 sound/soc/codecs/rt5645.c                          |   78 +-
 sound/soc/codecs/rt5670.c                          |    4 +-
 sound/soc/codecs/rt5682-i2c.c                      |    3 +
 sound/soc/codecs/rt5682-sdw.c                      |   25 +-
 sound/soc/codecs/rt5682.c                          |   16 +-
 sound/soc/codecs/rt5682.h                          |    2 +-
 sound/soc/codecs/rt700-sdw.c                       |    6 +-
 sound/soc/codecs/rt711-sdw.c                       |    6 +-
 sound/soc/codecs/rt715-sdw.c                       |    2 +-
 sound/soc/codecs/sgtl5000.c                        |    2 +-
 sound/soc/codecs/sirf-audio-codec.c                |  575 ----
 sound/soc/codecs/ssm2602.c                         |    4 +-
 sound/soc/codecs/tas2764.c                         |    2 +-
 sound/soc/codecs/tas2770.c                         |    2 +-
 sound/soc/codecs/tlv320adcx140.c                   |    2 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    4 +-
 sound/soc/codecs/tlv320aic32x4.c                   |    2 +-
 sound/soc/codecs/tlv320aic3x.c                     |    2 +-
 sound/soc/codecs/tscs42xx.c                        |    4 +-
 sound/soc/codecs/tscs454.c                         |   12 +-
 sound/soc/codecs/wm5102.c                          |   12 +-
 sound/soc/codecs/wm5110.c                          |   12 +-
 sound/soc/codecs/wm8510.c                          |    2 +-
 sound/soc/codecs/wm8731.c                          |    2 +-
 sound/soc/codecs/wm8770.c                          |    2 +-
 sound/soc/codecs/wm8804.c                          |    2 +-
 sound/soc/codecs/wm8903.c                          |    2 +-
 sound/soc/codecs/wm8904.c                          |    2 +-
 sound/soc/codecs/wm8940.c                          |    2 +-
 sound/soc/codecs/wm8960.c                          |    2 +-
 sound/soc/codecs/wm8962.c                          |    2 +-
 sound/soc/codecs/wm8974.c                          |    2 +-
 sound/soc/codecs/wm8978.c                          |    2 +-
 sound/soc/codecs/wm8983.c                          |    2 +-
 sound/soc/codecs/wm8985.c                          |    2 +-
 sound/soc/codecs/wm8988.c                          |    2 +-
 sound/soc/codecs/wm8993.c                          |    2 +-
 sound/soc/codecs/wm8994.c                          |    4 +-
 sound/soc/codecs/wm8997.c                          |    8 +-
 sound/soc/codecs/wm8998.c                          |   12 +-
 sound/soc/codecs/wm9713.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |  108 +-
 sound/soc/codecs/wmfw.h                            |    6 +-
 sound/soc/codecs/wsa881x.c                         |    1 +
 sound/soc/codecs/zl38060.c                         |    4 +-
 sound/soc/codecs/zx_aud96p22.c                     |  401 ---
 sound/soc/fsl/Kconfig                              |    1 +
 sound/soc/fsl/fsl_asrc.c                           |    5 -
 sound/soc/fsl/fsl_easrc.c                          |    2 +-
 sound/soc/fsl/fsl_esai.c                           |   13 +-
 sound/soc/fsl/fsl_micfil.c                         |    9 +-
 sound/soc/fsl/fsl_sai.c                            |    8 +-
 sound/soc/fsl/fsl_spdif.c                          |   14 +-
 sound/soc/fsl/fsl_ssi.c                            |   12 +-
 sound/soc/fsl/fsl_xcvr.c                           |    7 +-
 sound/soc/generic/audio-graph-card.c               |   17 +-
 sound/soc/generic/simple-card-utils.c              |   13 +-
 sound/soc/intel/Kconfig                            |    2 +
 sound/soc/intel/boards/Kconfig                     |   12 +
 sound/soc/intel/boards/Makefile                    |    2 +
 sound/soc/intel/boards/bytcht_es8316.c             |    3 -
 sound/soc/intel/boards/bytcr_rt5640.c              |   89 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   13 +
 sound/soc/intel/boards/bytcr_wm5102.c              |  465 +++
 sound/soc/intel/boards/cht_bsw_nau8824.c           |   15 +-
 sound/soc/intel/boards/sof_maxim_common.c          |    5 +-
 sound/soc/intel/boards/sof_rt5682.c                |    7 -
 sound/soc/intel/boards/sof_sdw.c                   |  131 +-
 sound/soc/intel/catpt/pcm.c                        |   14 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |    1 -
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |   19 +-
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |    5 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |    3 -
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c    |    3 -
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-skl-match.c  |    3 -
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   32 +-
 sound/soc/intel/common/soc-intel-quirks.h          |   25 +
 sound/soc/intel/keembay/kmb_platform.c             |  230 +-
 sound/soc/intel/keembay/kmb_platform.h             |   10 +
 sound/soc/intel/skylake/skl.c                      |    8 +-
 sound/soc/jz4740/jz4740-i2s.c                      |    2 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |   79 +-
 sound/soc/mediatek/Kconfig                         |    2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   10 +-
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c         |    8 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    6 -
 sound/soc/mediatek/mt8183/mt8183-dai-pcm.c         |    8 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   47 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |    4 +-
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c         |    8 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c         |    2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   84 +-
 sound/soc/meson/aiu-fifo-i2s.c                     |    1 -
 sound/soc/meson/aiu-fifo-spdif.c                   |    1 -
 sound/soc/meson/aiu-fifo.c                         |   18 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |    2 +-
 sound/soc/qcom/lpass-apq8016.c                     |    2 +-
 sound/soc/qcom/lpass-cpu.c                         |   47 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |    3 -
 sound/soc/qcom/lpass-sc7180.c                      |    2 +-
 sound/soc/qcom/lpass.h                             |    1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |   21 +
 sound/soc/qcom/qdsp6/q6asm.c                       |    2 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |   18 -
 sound/soc/rockchip/rockchip_i2s.c                  |    4 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    2 +-
 sound/soc/samsung/i2s.c                            |    2 +-
 sound/soc/samsung/pcm.c                            |    2 +-
 sound/soc/sh/rcar/core.c                           |    4 +-
 sound/soc/sh/siu.h                                 |    2 +-
 sound/soc/sh/siu_pcm.c                             |    2 +-
 sound/soc/sirf/Kconfig                             |   21 -
 sound/soc/sirf/Makefile                            |    8 -
 sound/soc/sirf/sirf-audio-port.c                   |   86 -
 sound/soc/sirf/sirf-audio.c                        |  160 -
 sound/soc/sirf/sirf-usp.c                          |  435 ---
 sound/soc/sirf/sirf-usp.h                          |  292 --
 sound/soc/soc-component.c                          |   54 +
 sound/soc/soc-dapm.c                               |   13 +-
 sound/soc/soc-pcm.c                                |  465 ++-
 sound/soc/soc-topology-test.c                      |  843 +++++
 sound/soc/soc-topology.c                           |   30 +-
 sound/soc/sof/core.c                               |   19 +
 sound/soc/sof/debug.c                              |    2 +-
 sound/soc/sof/intel/hda-compress.c                 |    4 +-
 sound/soc/sof/intel/hda-dsp.c                      |   24 +-
 sound/soc/sof/intel/hda-loader.c                   |   17 +-
 sound/soc/sof/intel/hda-pcm.c                      |   18 +-
 sound/soc/sof/intel/hda-stream.c                   |   38 +-
 sound/soc/sof/intel/hda-trace.c                    |    8 +-
 sound/soc/sof/intel/hda.c                          |  277 +-
 sound/soc/sof/intel/hda.h                          |    7 +-
 sound/soc/sof/intel/tgl.c                          |    3 +-
 sound/soc/sof/ipc.c                                |    4 +-
 sound/soc/sof/loader.c                             |    8 +-
 sound/soc/sof/ops.h                                |   43 +-
 sound/soc/sof/pcm.c                                |    7 +-
 sound/soc/sof/pm.c                                 |    1 -
 sound/soc/sof/sof-pci-dev.c                        |   22 +-
 sound/soc/sof/sof-priv.h                           |    8 +-
 sound/soc/sof/topology.c                           |   14 +-
 sound/soc/sprd/sprd-mcdt.c                         |   10 +-
 sound/soc/stm/stm32_i2s.c                          |  310 +-
 sound/soc/sunxi/sun4i-i2s.c                        |    2 +-
 sound/soc/sunxi/sun8i-codec.c                      |   12 +-
 sound/soc/tegra/Kconfig                            |   42 +-
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra186_dspk.c                    |    2 +-
 sound/soc/tegra/tegra20_i2s.c                      |    2 +-
 sound/soc/tegra/tegra210_dmic.c                    |    2 +-
 sound/soc/tegra/tegra210_i2s.c                     |    2 +-
 sound/soc/tegra/tegra30_ahub.c                     |   64 +-
 sound/soc/tegra/tegra30_ahub.h                     |    5 +-
 sound/soc/tegra/tegra30_i2s.c                      |    2 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |  252 ++
 sound/soc/tegra/tegra_pcm.c                        |    6 +-
 sound/soc/ti/davinci-mcasp.c                       |    2 +-
 sound/soc/txx9/Kconfig                             |   30 -
 sound/soc/txx9/Makefile                            |   12 -
 sound/soc/txx9/txx9aclc-ac97.c                     |  230 --
 sound/soc/txx9/txx9aclc-generic.c                  |   88 -
 sound/soc/txx9/txx9aclc.c                          |  422 ---
 sound/soc/txx9/txx9aclc.h                          |   71 -
 sound/soc/zte/Kconfig                              |   26 -
 sound/soc/zte/Makefile                             |    4 -
 sound/soc/zte/zx-i2s.c                             |  452 ---
 sound/soc/zte/zx-spdif.c                           |  363 --
 sound/soc/zte/zx-tdm.c                             |  458 ---
 291 files changed, 10822 insertions(+), 5986 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sirf-audio-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sirf-usp.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,tdm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-aud96p22.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
 create mode 100644 sound/soc/codecs/jz4760.c
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c
 delete mode 100644 sound/soc/codecs/sirf-audio-codec.c
 delete mode 100644 sound/soc/codecs/zx_aud96p22.c
 create mode 100644 sound/soc/intel/boards/bytcr_wm5102.c
 delete mode 100644 sound/soc/sirf/Kconfig
 delete mode 100644 sound/soc/sirf/Makefile
 delete mode 100644 sound/soc/sirf/sirf-audio-port.c
 delete mode 100644 sound/soc/sirf/sirf-audio.c
 delete mode 100644 sound/soc/sirf/sirf-usp.c
 delete mode 100644 sound/soc/sirf/sirf-usp.h
 create mode 100644 sound/soc/soc-topology-test.c
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c
 delete mode 100644 sound/soc/txx9/Kconfig
 delete mode 100644 sound/soc/txx9/Makefile
 delete mode 100644 sound/soc/txx9/txx9aclc-ac97.c
 delete mode 100644 sound/soc/txx9/txx9aclc-generic.c
 delete mode 100644 sound/soc/txx9/txx9aclc.c
 delete mode 100644 sound/soc/txx9/txx9aclc.h
 delete mode 100644 sound/soc/zte/Kconfig
 delete mode 100644 sound/soc/zte/Makefile
 delete mode 100644 sound/soc/zte/zx-i2s.c
 delete mode 100644 sound/soc/zte/zx-spdif.c
 delete mode 100644 sound/soc/zte/zx-tdm.c
