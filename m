Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C836B518
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 16:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0039168F;
	Mon, 26 Apr 2021 16:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0039168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619448072;
	bh=FyWtFAR+5YoLLX8Obx/sFfekysZLG+fsCelg4GjJ2Hc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vzjhuo8Cq7FYK+bZP9O7NH6FplP5VNJeaq2Dfy5vfJHe7o6Y/IXDh99kAFFJqEZjM
	 sjZPxu+/xzM40MLPG5ifAJKgylee/gj/gSdDUpC6FnFSXyjnxKZZO/e+Wj4onR1rAQ
	 Zg/1EV/eH0gQz5vsOs9cT0BWogi0c1DN09z0gsMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D90ACF800F0;
	Mon, 26 Apr 2021 16:40:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5979EF8016C; Mon, 26 Apr 2021 16:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF719F80165
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 16:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF719F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nREisoQ+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF0086101B;
 Mon, 26 Apr 2021 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619448005;
 bh=FyWtFAR+5YoLLX8Obx/sFfekysZLG+fsCelg4GjJ2Hc=;
 h=From:To:Cc:Subject:Date:From;
 b=nREisoQ+y/XLv7sqduDFdNMrkwWk1xhfwLzPfiToQ8nJbjbx3ICgEed7aQ/2Ti1iP
 okDLCqpbKlIRWhMeioWTIJy5AlzD4kFTe9tM5YZZvWpPF3V+l6J7l0W2s4LD5hN282
 zlflqjfR3eYCiqFHlVDNoNry6GSYge+1kYBjtVLQL7bnemA3+fUpqMj3pY44zhBc0b
 WiUESgp99m3pci7LUF2csYEIjOPxFtq3RyDxSNRiqEBcTpZZ+2Z5u1S9H7KRsqIAJH
 GqxS0IKBRiwfxjlV/Q6S649LeuW0fomSD7v16UluBrc4yBBvn1i5avQ0HG4zMI6Lc0
 yvtN6vjyR56Xw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.13
Date: Mon, 26 Apr 2021 15:39:14 +0100
Message-Id: <20210426144004.DF0086101B@mail.kernel.org>
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

The following changes since commit bf05bf16c76bb44ab5156223e1e58e26dfe30a88:

  Linux 5.12-rc8 (2021-04-18 14:45:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.13

for you to fetch changes up to ffc9841d5200a484ea0ecc645157b4d7b873f3a6:

  Merge remote-tracking branch 'asoc/for-5.13' into asoc-next (2021-04-23 19:01:02 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.13

A lot of changes here for quite a quiet release in subsystem terms -
there's been a lot of fixes and cleanups all over the subsystem both
from generic work and from people working on specific drivers.

 - More cleanup and consolidation work in the core and the generic card
   drivers from Morimoto-san.
 - Lots of cppcheck fixes for Pierre-Louis Brossart.
 - New drivers for Freescale i.MX DMA over rpmsg, Mediatek MT6358
   accessory detection, and Realtek RT1019, RT1316, RT711 and RT715.

----------------------------------------------------------------
Alexander Shiyan (1):
      ASoC: fsl_ssi: Fix TDM slot setup for I2S mode

Annaliese McDermond (2):
      ASoC: tlv320aic32x4: Increase maximum register in regmap
      ASoC: tlv320aic32x4: Register clocks before registering component

Argus Lin (2):
      ASoC: mt6359: add ASoC mt6359 ASoC accdet jack document
      ASoC: mediatek: mt6359: add MT6359 accdet jack driver

Arnd Bergmann (1):
      ASoC: tegra: mark runtime-pm functions as __maybe_unused

Benjamin Rood (1):
      ASoC: sgtl5000: set DAP_AVC_CTRL register to correct default value on probe

Bhaskar Chowdhury (5):
      ASoC: ti: Fix a typo in the file ams-delta.c
      ASoC: Fix a typo in the file rt5682.txt
      ASoC: Intel: Fix a typo
      ASoC: Intel: Fix a typo
      ASoC: Intel: Fix a typo

Brent Lu (1):
      ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp support

Cezary Rojewski (1):
      ASoC: Intel: Skylake: Compile when any configuration is selected

Chen Lifu (1):
      ASoC: sti: sti_uniperif: add missing MODULE_DEVICE_TABLE

Christophe JAILLET (2):
      ASoC: cs35l35: Fix an error handling path in 'cs35l35_i2c_probe()'
      ASoC: cs35l36: Fix an error handling path in 'cs35l36_i2c_probe()'

Codrin Ciubotariu (7):
      ASoC: mchp-i2s-mcc: Add compatible for SAMA7G5
      ASoC: mchp-i2s-mcc: Add multi-channel support for I2S and LEFT_J formats
      ASoC: mchp-i2s-mcc: Add support to select TDM pins
      ASoC: mchp-i2s-mcc: Add FIFOs support
      ASoC: mchp,i2s-mcc: Add SAMA7G5 to binding
      ASoC: mchp, i2s-mcc: Add property to specify pin pair for TDM
      ASoC: convert Microchip I2SMCC binding to yaml

Colin Ian King (5):
      ASoC: codecs: lpass-rx-macro: Fix uninitialized variable ec_tx
      ASoC: codecs: lpass-rx-macro: remove redundant initialization of variable hph_pwr_mode
      ASoC: Intel: boards: sof-wm8804: add check for PLL setting
      ASoC: fsl: fsl_easrc: Fix uninitialized variable st2_mem_alloc
      ASoC: mediatek: mt6359: Fix spelling mistake "reate" -> "create"

Daniel Baluta (1):
      ASoC: core: Don't set platform name when of_node is set

David Ward (5):
      ASoC: rt286: Fix upper byte in DMIC2 configuration
      ASoC: rt286: Make RT286_SET_GPIO_* readable and writable
      ASoC: rt286: Configure combo jack for headphones
      ASoC: rt298: Configure combo jack for headphones
      ASoC: rt286: Generalize support for ALC3263 codec

Dinghao Liu (1):
      ASoC: codecs: Fix runtime PM imbalance in tas2552_probe

Dmitry Baryshkov (1):
      ASoC: q6afe-clocks: fix reprobing of the driver

Dmitry Osipenko (16):
      ASoC: tegra20: ac97: Add reset control
      ASoC: tegra20: i2s: Add reset control
      ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
      ASoC: tegra30: ahub: Switch to use reset-bulk API
      ASoC: tegra20: spdif: Correct driver removal order
      ASoC: tegra20: spdif: Remove handing of disabled runtime PM
      ASoC: tegra20: i2s: Add system level suspend-resume callbacks
      ASoC: tegra20: i2s: Correct driver removal order
      ASoC: tegra20: i2s: Use devm_clk_get()
      ASoC: tegra20: i2s: Remove handing of disabled runtime PM
      ASoC: tegra30: i2s: Correct driver removal order
      ASoC: tegra30: i2s: Use devm_clk_get()
      ASoC: tegra30: i2s: Remove handing of disabled runtime PM
      ASoC: tegra30: ahub: Reset global variable
      ASoC: tegra30: ahub: Correct suspend-resume callbacks
      ASoC: tegra30: ahub: Remove handing of disabled runtime PM

Fabio Estevam (3):
      ASoC: wm8524: Do not print probe defer error
      ASoC: sgtl5000: Fix identation of .driver elements
      ASoC: mx27vis: Remove unused file

Guangqing Zhu (1):
      ASoC: codecs: wcd934x: Fix missing IRQF_ONESHOT as only threaded handler

Guennadi Liakhovetski (3):
      ASoC: SOF: fix debugfs initialisation error handling
      ASoC: SOF: only allocate debugfs cache buffers for IPC flood entries
      ASoC: SOF: remove superfluous NULL check in debugfs read

Gyeongtaek Lee (1):
      ASoC: soc-compress: lock pcm_mutex to resolve lockdep error

Hans de Goede (33):
      ASoC: rt5670: Remove 'OUT Channel Switch' control
      ASoC: rt5670: Remove 'HP Playback Switch' control
      ASoC: rt5670: Remove ADC vol-ctrl mute bits poking from Sto1 ADC mixer settings
      ASoC: rt5670: Add emulated 'DAC1 Playback Switch' control
      ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX OVCD current threshold
      ASoC: rt5640: Fix dac- and adc- vol-tlv values being off by a factor of 10
      ASoC: rt5651: Fix dac- and adc- vol-tlv values being off by a factor of 10
      ASoC: es8316: Simplify adc_pga_gain_tlv table
      ASoC: rt5645: Move rt5645_platform_data to sound/soc/codecs/rt5645.c
      ASoC: rt5645: The ALC3270 variant does not have a headset-mic pin
      ASoC: Intel: bytcr_rt5640: Enable jack-detect support on Asus T100TAF
      ASoC: rt5640: Rename 'Mono DAC Playback Volume' to 'DAC2 Playback Volume'
      ASoC: Intel: bytcr_rt5640: Add used AIF to the components string
      mfd: arizona: Drop arizona-extcon cells
      extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
      extcon: arizona: Fix various races on driver unbind
      extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
      extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
      ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
      ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
      ASoC: arizona-jack: Use arizona->dev for runtime-pm
      ASoC: arizona-jack: convert into a helper library for codec drivers
      ASoC: arizona-jack: Use snd_soc_jack to report jack events
      ASoC: arizona-jack: Cleanup logging
      ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use the new jack library
      ASoC: Intel: bytcr_wm5102: Add jack detect support
      ASoC: Intel: bytcr_rt5640: Add quirk for the Chuwi Hi8 tablet
      ASoC: Intel: Unify the thinkpad10 and aegex10 byt-match quirks
      ASoC: Intel: Baytrail: Add quirk for the Dell Venue 10 Pro 5055 tablet
      ASoC: Intel: cht_bsw_rt5672: Add support for Bay Trail CR / SSP0
      ASoC: rt5670: Add a quirk for the Dell Venue 10 Pro 5055
      ASoC: rt5670: Add a rt5670_components() helper
      ASoC: Intel: cht_bsw_rt5672: Set card.components string

Jack Yu (13):
      ASoC: rt1015: fix i2c communication error
      ASoC: rt1015: enable BCLK detection after calibration
      ASoC: rt715-sdca: Add RT715 sdca vendor-specific driver
      ASoC: rt1015p: add acpi device id for rt1015p
      ASoC: rt1019: add rt1019 amplifier driver
      ASoC: rt1015: Add bclk detection and dc detection
      ASoC: rt1019: add address-cells and size-cells information
      ASoC: rt1011: remove pack_id check in rt1011
      ASoC: rt1019: remove registers to sync with rt1019 datasheet
      ASoC: rt715: modification for code simplicity
      ASoC: rt715: add main capture switch and main capture volume
      ASoC: rt715: remove kcontrols which no longer be used
      ASoC: rt1015p: add support on format S32_LE

Jaroslav Kysela (6):
      ALSA: control - introduce snd_ctl_notify_one() helper
      ALSA: control - add layer registration routines
      ALSA: control - add generic LED trigger module as the new control layer
      ALSA: HDA - remove the custom implementation for the audio LED trigger
      ALSA: control - add sysfs support to the LED trigger module
      ALSA: led control - add sysfs kcontrol LED marking layer

Jaska Uimonen (3):
      ASoC: SOF: parse multiple SSP DAI and hw configs
      ASoC: SOF: Intel: HDA: add hw params callback for SSP DAIs
      ASoC: SOF: match SSP config with pcm hw params

Jerome Brunet (8):
      ASoC: meson: axg-frddr: set fifo depth according to the period
      ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
      ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
      ASoC: stm32: properly get clk from the provider
      ASoC: wcd934x: use the clock provider API
      ASoC: rt5682: clock driver must use the clock provider API
      ASoC: lpass: use the clock provider API
      ASoC: da7219: properly get clk from the provider

Jiri Prchal (6):
      ASoC: codecs: tlv320aic3x: move model definitions
      ASoC: codecs: tlv320aic3x: rename probe function
      ASoC: codecs: tlv320aic3x: move I2C to separated file
      ASoC: codecs: tlv320aic3x: add SPI support
      ASoC: codecs: tlv320aic3x: add AIC3106
      ASoC: codecs: tlv320aic3x: add SPI to the DT binding

Jon Hunter (1):
      ASoC: soc-core: Prevent warning if no DMI table is present

Julia Lawall (4):
      ASoC: mmp-sspa: drop unneeded snd_soc_dai_set_drvdata
      ASoC: mxs-saif: drop unneeded snd_soc_dai_set_drvdata
      ASoC: sun4i-i2s: drop unneeded snd_soc_dai_set_drvdata
      ASoC: fsl: drop unneeded snd_soc_dai_set_drvdata

Kai Vehmanen (2):
      ASoC: SOF: Intel: hda: turn off display power in resume
      ASoC: SOF: Intel: hda: drop display power on/off in D0i3 flows

Keyon Jie (2):
      ASoC: SOF: add a helper to get topology configured mclk
      ASoC: intel: sof_rt5682: use the topology mclk

Krzysztof Kozlowski (2):
      ASoC: constify of_phandle_args in snd_soc_get_dai_name()
      ASoC: simple-card: fix possible uninitialized single_cpu local variable

Kuninori Morimoto (82):
      ASoC: soc-pcm: remove strange format storing
      ASoC: soc-pcm: unpack dpcm_init_runtime_hw()
      ASoC: soc-pcm: add dpcm_runtime_setup_fe()
      ASoC: soc-pcm: add dpcm_runtime_setup()
      ASoC: soc-pcm: unpack dpcm_set_fe_runtime()
      ASoC: rsnd: cleanup ppcheck warning for ssiu.c
      ASoC: rsnd: cleanup ppcheck warning for ssi.c
      ASoC: rsnd: cleanup ppcheck warning for core.c
      ASoC: rsnd: cleanup ppcheck warning for cmd.c
      ASoC: rsnd: cleanup ppcheck warning for adg.c
      ASoC: soc-pcm: check DAI activity under soc_pcm_apply_symmetry()
      ASoC: soc-pcm: add soc_cpu/codec_dai_name() macro
      ASoC: soc-pcm: direct copy at snd_soc_set_runtime_hwparams()
      ASoC: soc-pcm: add soc_pcm_update_symmetry()
      ASoC: soc-pcm: add soc_hw_sanity_check()
      ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count
      ASoC: soc-pcm: remove unneeded !rtd->dai_link check
      ASoC: soc-pcm: share DPCM BE DAI stop operation
      ASoC: soc-pcm: indicate error message at soc_pcm_open()
      ASoC: soc-pcm: indicate error message at soc_pcm_hw_params()
      ASoC: soc-pcm: indicate error message at soc_pcm_prepare()
      ASoC: soc-pcm: indicate error message at dpcm_path_get()
      ASoC: soc-pcm: indicate error message at dpcm_be_dai_trigger()
      ASoC: soc-pcm: indicate error message at dpcm_apply_symmetry()
      ASoC: soc-pcm: indicate error message at dpcm_run_update_startup/shutdown()
      ASoC: soc-pcm: indicate error message at dpcm_fe/be_dai_startup()
      ASoC: soc-pcm: indicate error message at dpcm_fe/be_dai_hw_params()
      ASoC: soc-pcm: indicate error message at dpcm_fe/be_dai_prepare()
      ASoC: soc-pcm: don't indicate error message for soc_pcm_hw_free()
      ASoC: soc-pcm: don't indicate error message for dpcm_be_dai_hw_free()
      ASoC: don't indicate error message for snd_soc_[pcm_]dai_xxx()
      ASoC: don't indicate error message for snd_soc_[pcm_]component_xxx()
      ASoC: soc.h: add asoc_link_to_cpu/codec/platform() macro
      ASoC: soc.h: fixup return timing for snd_soc_fixup_dai_links_platform_name()
      ASoC: soc.h: return error if multi platform at snd_soc_fixup_dai_links_platform_name()
      ASoC: simple-card-utils.c: remove old comment
      ASoC: simple-card-utils: alloc dai_link information for CPU/Codec/Platform
      ASoC: audio-graph: count DAI / link numbers as in order
      ASoC: audio-graph: cleanup graph_for_each_link()
      ASoC: simple-card: count DAI / link numbers as in order
      ASoC: simple-card: cleanup graph_for_each_link()
      ASoC: soc-core: add comment for rtd freeing
      ASoC: soc-core: use device_unregister() if rtd allocation failed
      ASoC: simple-card-utils: enable flexible CPU/Codec/Platform
      ASoC: simple-card-utils: share dummy DAI and reduce memory
      ASoC: simple-card-utils: setup dai_props cpu_dai/codec_dai at initial timing
      ASoC: simple-card-utils: remove li->dais/li->conf
      ASoC: simple-card-utils: use for_each_prop_xxx()
      ASoC: simple-card-utils: remove asoc_simple_parse_xxx()
      ASoC: simple-card-utils: care multi DAI at asoc_simple_clean_reference()
      ASoC: simple-card-utils: indicate dai_fmt if exist
      ASoC: simple-card-utils: indicate missing CPU/Codec numbers for debug
      ASoC: simple-card-utils: add simple_props_to_xxx() macro
      ASoC: simple-card-utils: multi support at asoc_simple_canonicalize_cpu/platform()
      ASoC: simple-card-utils: tidyup debug info for clock
      ASoC: simple-card-utils: tidyup dev_dbg() to use 1 line
      ASoC: simple-card-utils: tidyup asoc_simple_parse_convert()
      ASoC: rsnd: call rsnd_ssi_master_clk_start() from rsnd_ssi_init()
      ASoC: rsnd: check all BUSIF status when error
      ASoC: rsnd: add rsnd_ssi_busif_err_status_clear()
      ASoC: rsnd: add rsnd_ssi_busif_err_irq_enable/disable()
      ASoC: rsnd: add usage for SRC
      ASoC: simple-card: remove unused variable from simple_parse_of()
      ASoC: simple-card: use asoc_link_to_xxx() macro
      ASoC: simple-card: use simple_props_to_xxx() macro
      ASoC: audio-graph: use asoc_link_to_xxx() macro
      ASoC: audio-graph: use simple_props_to_xxx() macro
      ASoC: soc-pcm: don't use "name" on __soc_pcm_params_symmetry() macro
      ASoC: soc-pcm: indicate DAI name if soc_pcm_params_symmetry() failed
      ASoC: soc-utils: add snd_soc_component_is_dummy()
      ASoC: soc-pcm: ignore dummy-DAI at soc_pcm_params_symmetry()
      ASoC: audio-graph: move audio_graph_card_probe() to simple-card-utils.c
      ASoC: audio-graph: move audio_graph_remove() to simple-card-utils.c
      ASoC: audio-graph: check ports if exists
      ASoC: audio-graph: remove "audio-graph-card, " preix support
      ASoC: audio-graph: remove unused "node" from graph_parse_mclk_fs()
      ASoC: audio-graph: remove Platform support
      ASoC: audio-graph: add graph_parse_node()
      ASoC: audio-graph: add graph_link_init()
      ASoC: simple-card: add simple_parse_node()
      ASoC: simple-card: add simple_link_init()
      ASoC: audio-graph: tidyup graph_dai_link_of_dpcm()

Libin Yang (2):
      ASoC: SOF: Kconfig: fix typo of SND_SOC_SOF_PCI
      ASoC: SOF: Intel: add missing use_acpi_target_states for TGL platforms

Lucas Tanure (12):
      ASoC: cs42l42: Fix Bitclock polarity inversion
      ASoC: cs42l42: Fix channel width support
      ASoC: cs42l42: Fix mixer volume control
      ASoC: cs42l42: Don't enable/disable regulator at Bias Level
      ASoC: cs42l42: Always wait at least 3ms after reset
      ASoC: cs42l42: Remove power if the driver is being removed
      ASoC: cs42l42: Disable regulators if probe fails
      ASoC: cs42l42: Provide finer control on playback path
      ASoC: cs42l42: Set clock source for both ways of stream
      ASoC: cs42l42: Add Capture Support
      ASoC: cs42l42: Report jack and button detection
      ASoC: cs42l42: Use bclk from hw_params if set_sysclk was not called

Lukasz Majczak (1):
      ASoC: Intel: kbl_da7219_max98927: Fix kabylake_ssp_fixup function

Mac Chiang (3):
      ASoC: Intel: add max98390 echo reference support
      ASoC: Intel: Boards: cml_da7219_max98390: add capture stream for echo reference
      ASoc: Intel: board: add BE DAI link for WoV

Mark Brown (57):
      Merge series "ASoC: rt5670: Various kcontrol fixes" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "AsoC: rt5640/rt5651: Volume control fixes" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: qcom: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: rt*: Constify static structs" from Rikard Falkeborn <rikard.falkeborn@gmail.com>:
      Merge series "ASoC: fsl: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "soc-pcm: tidyup snd_pcm_hardware setup for FE/BE" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: samsung: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: core: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: sh: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "drop unneeded snd_soc_dai_set_drvdata" from Julia Lawall <Julia.Lawall@inria.fr>:
      Merge series "ASoC: rsnd: cleanup ppcheck warning for Renesas sound driver" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "Add I2S-MCC support for Microchip's SAMA7G5" from Codrin Ciubotariu <codrin.ciubotariu@microchip.com>:
      Merge series "ASoC: Intel: soc-acpi: remove unused TigerLake configurations" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: realtek: fix cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: remove more make W=1 warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Report jack and button detection + Capture Support" from Lucas Tanure <tanureal@opensource.cirrus.com>:
      Merge series "Add I2S-MCC support for Microchip's SAMA7G5" from Codrin Ciubotariu <codrin.ciubotariu@microchip.com>:
      Merge series "Report jack and button detection + Capture Support" from Lucas Tanure <tanureal@opensource.cirrus.com>:
      Merge series "ASoC: codecs: wolfson: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: mediatek: mt8183-mt6358: support machine driver for rt1015p" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: soc-pcm: cleanup each functions" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: samsung: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "AsoC: rt5640/rt5651: Volume control fixes" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: SOF: debug: cleanups" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Fix reset controls and RPM of NVIDIA Tegra ASoC drivers" from Dmitry Osipenko <digetx@gmail.com>:
      Merge series "ASoC: codecs: remove cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: tidyup error message timing" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge tag 'ib-mfd-extcon-v5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into asoc-5.13
      Merge series "MFD/extcon/ASoC: Rework arizona codec jack-detect support" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: soc.h: small cleanups" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "Add audio driver base on rpmsg on i.MX platform" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge series "Add mediatek MT6359 ASoC accdet jack driver" from Argus Lin <argus.lin@mediatek.com>:
      Merge series "ASoC: simple-card: cleanup and prepare for Multi CPU/Codec support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge tag 'mute-led-rework' of https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.13
      Merge series "ASoC: remove cppcheck warnings for multiple SOCs" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: soc-core: tidyup error handling for rtd" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: dt-bindings: Rework audio-graph-port schema" from Rob Herring <robh@kernel.org>:
      Merge series "ASoC: remove cppchecks warnings on lm49453 and da732x" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "kbl_da7219_max9357a machine changes for wov and MST" from vamshi.krishna.gopal@intel.com Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.corp-partner.google.com>:
      Merge series "Adds SPI support" from Jiri Prchal <jiri.prchal@aksignal.cz>:
      Merge series "ASoC: simple-card-utils: prepare for multi support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: SOF: simplify nocodec mode" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "ASoC: SOF: simplify probe and report errors" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: descriptor corrections for TGL and ADL" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: simple-card-utils: prepare for multi support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: rsnd: tidyup Renesas sound" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "kunit: Fix formatting of KUNIT tests to meet the standard" from Nico Pache <npache@redhat.com>:
      Merge series "ASoC: simple-card/audio-graph: adjust to multi CPU/Codec" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: soc-pcm: ignore dummy-DAI at soc_pcm_params_symmetry()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Intel: add new TGL/ADL configurations" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: remove more cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: rt286/rt298: Fixes for DMIC2 config and combo jack" from David Ward <david.ward@gatech.edu>:
      Merge series "ASoC: rt286/rt298: Fixes for DMIC2 config and combo jack" from David Ward <david.ward@gatech.edu>:
      Merge series "ASoC: audio-graph: cleanups" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      ASoC: simple-card: Fix breakage on kontron-sl28-var3-ads2
      Merge remote-tracking branch 'asoc/for-5.12' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.13' into asoc-next

Mikhail Durnev (1):
      ASoC: rsnd: core: Check convert rate in rsnd_hw_params

Muhammad Usama Anjum (1):
      ASoC: fsl: sunxi: remove redundant dev_err call

Nick Desaulniers (1):
      ASoC: Intel: Skylake: skl-topology: fix -frame-larger-than

Nico Pache (1):
      ASoC: topology: adhere to KUNIT formatting standard

Niklas Carlsson (2):
      ASoC: sigmadsp: Disable cache mechanism for readbacks
      ASoC: adau17x1: Avoid overwriting CHPF

Peter Ujfalusi (2):
      ASoC: SOF: core: Add missing error prints to device probe operation
      ASoC: SOF: Simplify sof_probe_complete handling for acpi/pci/of

Philipp Zabel (1):
      reset: Add reset_control_bulk API

Pierre-Louis Bossart (147):
      ASoC: SOF: Intel: unregister DMIC device on probe error
      ASoC: qcom: lpass-hdmi: remove useless return
      ASoC: qcom: lpass-platform: remove useless assignment
      ASoC: qcom: q6dsp-dai: clarify expression
      ASoC: qcom: q6afe: remove useless assignments
      ASoC: qcom: q6afe: align function prototype
      ASoC: qcom: q6asm: align function prototypes
      ASoC: wcd-clsh-v2: align function prototypes
      ASoC: wcd9335: clarify return value
      ASoC: wcd934x: remove useless return
      ASoC: lpass-wsa-macro: add missing test
      ASoC: fsl: fsl_asrc: remove useless assignment
      ASoC: fsl: fsl_dma: remove unused variable
      ASoC: fsl: fsl_easrc: remove useless assignments
      ASoC: fsl: fsl_esai: clarify expression
      ASoC: fsl: fsl_ssi: remove unnecessary tests
      ASoC: fsl: imx-hdmi: remove unused structure members
      ASoC: fsl: mpc5200: signed parameter in snprintf format
      ASoC: fsl: mpc8610: remove useless assignment
      ASoC: fsl: p1022_ds: remove useless assignment
      ASoC: samsung: i2s: remove unassigned variable
      ASoC: samsung: s3c24xx_simtec: add missing error check
      ASoC: samsung: smdk_wm8994: add missing return
      ASoC: samsung: snow: remove useless test
      ASoC: soc-ops: remove useless assignment
      ASoC: soc-pcm: remove redundant assignment
      ASoC: soc-pcm: remove shadowing variable
      ASoC: soc-pcm: add error log
      ASoC: soc-topology: clarify expression
      ASoC: generic: simple-card-utils: remove useless assignment
      ASoC: sh: dma-sh7760: remove unused variable
      ASoC: sh: rcar: align function prototypes
      ASoC: sh: rcar: simplify return
      ASoC: sh: rcar: ctu: add missing error check
      ASoC: sh: rcar: ssi: remove redundant assignment
      ASoC: sh: siu_pcm: remove useless assignment
      ASoC: sh: siu_pcm: remove unused variable
      ASoC: Intel: soc-acpi: remove unused TGL table with rt5682 only
      ASoC: Intel: soc-acpi: remove TGL RVP mixed SoundWire/TDM config
      ASoC: codecs: nau8825: fix kernel-doc
      ASoC: soc-dai: fix kernel-doc
      ASoC: Intel: atom: fix kernel-doc
      ASoC: rt1011: use logical OR
      ASoC: rt1011: remove redundant test
      ASoC: rt1011: clarify expression
      ASoC: rt1015: clarify expression
      ASoC: rt1016: clarify expression
      ASoC: rt1305: clarify expression
      ASoC: rt1308: clarify expression
      ASoC: rt5640: clarify expression
      ASoC: rt5645: use logical OR
      ASoC: rt5645: clarify expression
      ASoC: rt5651: clarify expression
      ASoC: rt5651: remove useless assignment
      ASoC: rt5659: clarify expression
      ASoC: rt5660: clarify expression
      ASoC: rt5663: clarify expression
      ASoC: rt5665: clarify expression
      ASoC: rt5668: clarify expression
      ASoC: rt5668: remove useless assignments
      ASoC: rt5670: clarify expression
      ASoC: rt5677: clarify expression
      ASoC: rt5677: remove useless assignment
      ASoC: rt5682: clarify expression
      ASoC: rt5682: remove useless assignments
      ASoC: rt5682: remove useless initialization
      ASoC: cs4270: fix kernel-doc
      ASoC: jz4760: fix set but not used warning
      ASoC: rt5631: fix kernel-doc warning
      ASoC: sigmadsp-regmap: fix kernel-doc warning
      ASoC: amd: renoir: remove invalid kernel-doc comment
      ASoC: fsl: fsl_ssi: fix kernel-doc warning
      ASoC: fsl: fsl_easrc: fix kernel-doc warning
      ASoC: Intel: bytcr_wm5102: remove unused static variable
      ASoC: qcom: q6dsp: fix kernel-doc warning
      ASoC: arizona: fix function argument
      ASoC: madera: align function prototype
      ASoC: wm2200: remove unused structure
      ASoC: wm8903: remove useless assignments
      ASoC: wm8958-dsp2: rename local 'control' arrays
      ASoC: wm8978: clarify expression
      ASoC: wm8994: align function prototype
      ASoC: wm8996: clarify expression
      ASoC: wm_adsp: simplify return value
      ASoC: wm_hubs: align function prototype
      ASoC: soc-core: fix DMI handling
      ASoC: mediatek: mtk-btcvsd: remove useless assignment
      ASoC: mediatek: mt2701: align function prototype
      ASoC: mediatek: mt2701: rename shadowed array
      ASoC: mediatek: mt8173: rename local irq variable
      ASoC: samsung: tm2_wm5110: check of of_parse return value
      ASoC: samsung: tm2_wm5110: remove shadowed variable
      ASoC: ab8500-codec: remove useless structure
      ASoC: ad1836: remove useless return
      ASoC: adau1977: remove useless return
      ASoC: cros_ec_codec: remove null pointer dereference warning
      ASoC: cx2070x: remove useless assignment
      ASoC: cx2070x: remove duplicate else branch
      ASoC: da7219-aad: remove useless initialization
      ASoC: hdac_hdmi: remove useless initializations
      ASoC: hdac_hdmi: align function arguments
      ASoC: hdmi-codec: remove useless initialization
      ASoC: hdmi-codec: remove unused spk_mask member
      ASoC: max98090: remove useless assignment
      ASoC: mt6358: remove useless initializations
      ASoC: mt6359: remove useless assignment
      ASoC: nau8825: remove useless assignment
      ASoC: pcm1681: remove useless assignment
      ASoC: sigmadsp: align function prototype
      ASoC: sti-sas: remove unused struct members
      ASoC: tas2562: remove useless assignment
      ASoC: tas2562: remove warning on return value
      ASoC: tas2770: remove useless initialization
      ASoC: tlv320dac33: clarify expression
      ASoC: tscs454: remove useless test on PLL disable
      ASoC: lm49453: fix useless assignment before return
      ASoC: da732x: simplify code
      ASoC: amd: renoir: acp3x-pdm-dma: remove unnecessary assignments
      ASoC: atmel: fix shadowed variable
      ASoC: atmel: atmel-i2s: remove useless initialization
      ASoC: bcm: cygnus_ssp: remove useless initialization
      ASoC: meson: axg-tdmin: remove useless assignment
      ASoC: meson: axg-tdmout: remove useless assignment
      ASoC: pxa: remove useless assignment
      ASoC: sti: sti_uniperif: add missing error check
      ASoC: sti: uniperif: align function prototypes
      ASoC: stm: stm32_adfsdm: fix snprintf format string
      ASoC: sunxi: sun8i-codec: clarify expression
      ASoC: tegra: tegra20_das: clarify expression
      ASoC: tegra: tegra20_das: align function prototypes
      ASoC: ti: omap-abe-twl6040: remove useless assignment
      ASoC: ti: omap-mcsp: remove duplicate test
      ASoC: ux500: mop500: rename shadowing variable
      ASoC: ux500: mop500: align function prototype
      ASoC: SOF: add Kconfig option for probe workqueues
      ASoC: soc-acpi: add new fields for mach_params
      ASoC: SOF: change signature of set_mach_params() callback
      ASoC: SOF: Intel: update set_mach_params()
      ASoC: SOF: pcm: export snd_pcm_dai_link_fixup
      ASOC: SOF: simplify nocodec mode
      ASoC: Intel: soc-acpi: add ADL SoundWire base configurations
      ASoC: Intel: soc-acpi: add ADL jack-less SoundWire configurations
      ASoC: soc-acpi: remove useless initialization
      ASoC: soc-core: fix signed/unsigned issue
      ASoC: soc-core: fix always-false condition
      ASoC: codecs: lpass-rx-macro: remove useless return
      ASoC: codecs: rt5682: clarify expression

Ranjani Sridharan (3):
      ASoC: SOF: Intel: hda: enable async suspend
      ASoC: SOF: topology: remove useless code
      ASoC: SOF: use current DAI config during resume

Richard Fitzgerald (3):
      ASoC: cs42l42: Wait at least 150us after writing SCLK_PRESENT
      ASoC: cs42l42: Only start PLL if it is needed
      ASoC: cs42l42: Wait for PLL to lock before switching to it

Rikard Falkeborn (4):
      ASoC: rt*: Constify static struct sdw_slave_ops
      ASoC: rt*: Constify static struct snd_soc_dai_ops
      ASoC: rt*: Constify static struct acpi_device_id
      ASoc: rt5631: Constify static struct coeff_clk_div

Rob Herring (5):
      ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
      ASoC: dt-bindings: Move port/ports properties out of audio-graph-port.yaml
      ASoC: dt-bindings: Use OF graph schema
      ASoC: dt-bindings: socionext: Use audio-graph-port schema
      ASoC: mt6359: Drop ASoC mt6359 ASoC accdet jack document

Robin Gong (1):
      ASoC: fsl_asrc_dma: request dma channel from specific controller

Ryan Lee (1):
      ASoC: max98373: Added controls for autorestart config

Sathya Prakash M R (1):
      ASoC: SOF: Intel: Update ADL P to use its own descriptor

Shengjiu Wang (25):
      ASoC: ak4458: Add MODULE_DEVICE_TABLE
      ASoC: ak5558: Add MODULE_DEVICE_TABLE
      ASoC: fsl_sai: Add pm qos cpu latency support
      ASoC: wm8962: Relax bit clock divider searching
      ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_spdif: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_easrc: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_audmix: Don't use devm_regmap_init_mmio_clk
      ASoC: fsl_micfil: Don't use devm_regmap_init_mmio_clk
      ASoC: soc-component: Add snd_soc_pcm_component_ack
      ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg
      ASoC: dt-bindings: fsl_rpmsg: Add binding doc for rpmsg audio device
      ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio channel
      ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg
      ASoC: imx-rpmsg: Add machine driver for audio base on rpmsg
      ASoC: fsl-asoc-card: Add support for WM8958 codec
      ASoC: bindings: fsl-asoc-card: add compatible string for WM8958 codec
      ASoC: wm8960: Remove bitclk relax condition in wm8960_configure_sysclk
      ASoC: fsl_rpmsg: initialise pointers to NULL
      ASoC: dt-bindings: ak5558: Add compatible string for ak5552
      ASoC: ak5558: Fix s/show/slow/ typo
      ASoC: ak5558: correct reset polarity
      ASoC: ak5558: change function name to ak5558_reset

Shuming Fan (5):
      ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
      ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver
      ASoC: rt5682: add delay time of workqueue to control next IRQ event
      ASoC: rt711-sdca: change capture switch controls
      ASoC: rt711-sdca: add the notification when volume changed

Sia Jee Heng (1):
      ASoC: Intel: KMB: Fix random noise at the HDMI output

Steve Lee (1):
      ASoC: max98390: Add support for tx slot configuration.

Tang Bin (3):
      ASoC: codec: Omit superfluous error message in jz4760_codec_probe()
      ASoC: fsl_xcvr: Use devm_platform_ioremap_resource_byname() to simplify code
      ASoC: codecs/jz4770: Remove superfluous error message

Thierry Reding (4):
      ASoC: tegra: Set driver name explicitly
      ASoC: simple-card-utils: Propagate errors on too many links
      ASoC: simple-card-utils: Increase maximum number of links to 128
      ASoC: simple-card-utils: Allocate link info structure on heap

Tian Tao (1):
      spi: imx: Use of_device_get_match_data() helper

Tzung-Bi Shih (2):
      ASoC: dt-bindings: mt8183: add compatible string for using rt1015p
      ASoC: mediatek: mt8183: support machine driver with rt1015p

Vamshi Krishna Gopal (2):
      ASoC: Intel: kbl: Add MST route change to kbl machine drivers
      ASoC: Intel: sof_sdw: add quirk for new ADL-P Rvp

Vijendar Mukunda (5):
      ASoC: amd: Add support for RT5682 codec in machine driver
      ASoC: amd: update spdx license for acp machine driver
      ASoC: amd: fix acpi dependency kernel warning
      ASoC: amd: Add support for ALC1015P codec in acp3x machine driver
      ASoC: amd: drop S24_LE format support

Viorel Suman (5):
      ASoC: fsl_xcvr: move reset assert into runtime_resume
      ASoC: fsl_spdif: use snd_ctl_boolean_mono_info
      ASoC: ak5558: Add support for ak5552
      ASoC: ak4458: check reset control status
      ASoC: ak4458: enable daisy chain

Wei Yongjun (4):
      ASoC: rt1316: Fix return value check in rt1316_sdw_probe()
      ASoC: rt715-sdca: Fix return value check in rt715_sdca_sdw_probe()
      ASoC: rt715-sdca: Remove unused including <linux/version.h>
      ASoC: rt1019: make symbol 'rt1019_i2c_driver' static

Yang Li (3):
      ASoC: codecs: fix platform_no_drv_owner.cocci warnings
      ASoC: imx-hdmi: fix platform_no_drv_owner.cocci warnings
      ASoC: cs35l35: remove unused including <linux/version.h>

Ye Bin (16):
      ASoC: codecs: lpass-va-macro: constify static struct snd_soc_dai_ops
      ASoC: codecs: wsa881x: constify static struct snd_soc_dai_ops
      ASoC: tas2764: constify static struct snd_soc_dai_ops
      ASoC: rt1019: constify static struct snd_soc_dai_ops
      ASoC: cx2072x: constify static struct snd_soc_dai_ops
      ASoC: tas2770: Constify static struct snd_soc_dai_ops
      ASoC: amd: raven: acp3x-i2s: Constify static struct snd_soc_dai_ops
      ASoC: codecs: lpass-rx-macro: constify static struct snd_soc_dai_ops
      ASoC: Intel: KMB: Constify static struct snd_soc_dai_ops
      ASoC: rt715-sdca: Constify static struct snd_soc_dai_ops
      ASoC: wcd934x: constify static struct snd_soc_dai_ops
      ASoC: rt711-sdca: Constify static struct snd_soc_dai_ops
      ASoC: codecs: lpass-wsa-macro: constify static struct snd_soc_dai_ops
      ASoC: amd: renoir: acp3x-pdm-dma: constify static struct snd_soc_dai_ops
      ASoC: codecs: lpass-tx-macro: constify static struct snd_soc_dai_ops
      ASoC: wcd9335: constify static struct snd_soc_dai_ops

YueHaibing (1):
      ASoC: dwc: Fix -Wmissing-prototypes warnings

Zhen Lei (1):
      ASoC: intel, keembay-i2s: Fix a dt_binding_check warning

dingsenjie (1):
      ASoC: uniphier: Simplify the return expression of uniphier_aio_startup

 Documentation/devicetree/bindings/sound/ak5558.txt |    2 +-
 .../bindings/sound/audio-graph-port.yaml           |  104 +-
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |  108 ++
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |    2 +
 .../bindings/sound/intel,keembay-i2s.yaml          |    2 +-
 .../bindings/sound/marvell,mmp-sspa.yaml           |    6 +-
 .../devicetree/bindings/sound/mchp,i2s-mcc.yaml    |  108 ++
 .../devicetree/bindings/sound/mchp-i2s-mcc.txt     |   43 -
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |    1 +
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |   11 +-
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   11 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   27 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |   11 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |   11 +-
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |    5 +-
 .../devicetree/bindings/sound/rt1019.yaml          |   35 +
 Documentation/devicetree/bindings/sound/rt5682.txt |    2 +-
 .../bindings/sound/socionext,uniphier-aio.yaml     |    8 +-
 .../bindings/sound/socionext,uniphier-evea.yaml    |    8 +-
 .../devicetree/bindings/sound/tlv320aic3x.txt      |   21 +-
 MAINTAINERS                                        |    3 +-
 drivers/extcon/Kconfig                             |    8 -
 drivers/extcon/Makefile                            |    1 -
 drivers/firmware/dmi_scan.c                        |    1 +
 drivers/mfd/arizona-core.c                         |   20 -
 drivers/reset/core.c                               |  215 +++
 drivers/spi/spi-imx.c                              |    5 +-
 include/linux/platform_data/asoc-mx27vis.h         |   12 -
 include/linux/reset.h                              |  315 ++++
 include/sound/control.h                            |   35 +-
 include/sound/graph_card.h                         |    4 -
 include/sound/rt5645.h                             |   32 -
 include/sound/simple_card_utils.h                  |  128 +-
 include/sound/soc-acpi.h                           |    4 +
 include/sound/soc-component.h                      |    8 +-
 include/sound/soc-dpcm.h                           |   10 +-
 include/sound/soc.h                                |   36 +-
 include/sound/sof.h                                |    4 +-
 sound/core/Kconfig                                 |    6 +
 sound/core/Makefile                                |    2 +
 sound/core/control.c                               |  182 +-
 sound/core/control_led.c                           |  770 ++++++++
 sound/pci/hda/Kconfig                              |    4 +-
 sound/pci/hda/hda_codec.c                          |   69 +-
 sound/pci/hda/hda_generic.c                        |  162 +-
 sound/pci/hda/hda_generic.h                        |   15 +-
 sound/pci/hda/hda_local.h                          |   16 +-
 sound/pci/hda/patch_ca0132.c                       |    4 +-
 sound/pci/hda/patch_realtek.c                      |    2 +-
 sound/pci/hda/patch_sigmatel.c                     |    6 +-
 sound/pci/hda/thinkpad_helper.c                    |    2 +-
 sound/soc/Kconfig                                  |    2 +-
 sound/soc/Makefile                                 |    4 +-
 sound/soc/amd/Kconfig                              |    8 +-
 sound/soc/amd/acp-da7219-max98357a.c               |  386 +++-
 sound/soc/amd/acp3x-rt5682-max9836.c               |   46 +-
 sound/soc/amd/raven/acp3x-i2s.c                    |    8 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    6 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    4 +-
 sound/soc/amd/renoir/rn-pci-acp3x.c                |    2 +-
 sound/soc/atmel/Kconfig                            |    3 +
 sound/soc/atmel/atmel-classd.c                     |    6 +-
 sound/soc/atmel/atmel-i2s.c                        |    2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |  161 +-
 sound/soc/bcm/cygnus-ssp.c                         |    2 +-
 sound/soc/codecs/Kconfig                           |   51 +-
 sound/soc/codecs/Makefile                          |   16 +-
 sound/soc/codecs/ab8500-codec.c                    |    7 -
 sound/soc/codecs/ad1836.c                          |    2 -
 sound/soc/codecs/adau17x1.c                        |   13 +-
 sound/soc/codecs/adau1977.c                        |    2 -
 sound/soc/codecs/ak4458.c                          |   66 +-
 sound/soc/codecs/ak4458.h                          |    1 +
 sound/soc/codecs/ak5558.c                          |  122 +-
 .../soc/codecs/arizona-jack.c                      |  577 +++---
 sound/soc/codecs/arizona.h                         |   46 +-
 sound/soc/codecs/cros_ec_codec.c                   |    2 +-
 sound/soc/codecs/cs35l35.c                         |    3 +-
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs4270.c                          |    1 +
 sound/soc/codecs/cs42l42.c                         |  323 ++--
 sound/soc/codecs/cs42l42.h                         |   28 +-
 sound/soc/codecs/cx2072x.c                         |   13 +-
 sound/soc/codecs/da7219-aad.c                      |    2 +-
 sound/soc/codecs/da7219.c                          |    5 +-
 sound/soc/codecs/da732x.c                          |   17 +-
 sound/soc/codecs/da732x.h                          |   12 +-
 sound/soc/codecs/hdac_hdmi.c                       |   14 +-
 sound/soc/codecs/hdac_hdmi.h                       |    2 +-
 sound/soc/codecs/hdmi-codec.c                      |    3 +-
 sound/soc/codecs/jz4760.c                          |   11 +-
 sound/soc/codecs/jz4770.c                          |    7 +-
 sound/soc/codecs/lm49453.c                         |    2 -
 sound/soc/codecs/lpass-rx-macro.c                  |    7 +-
 sound/soc/codecs/lpass-tx-macro.c                  |    2 +-
 sound/soc/codecs/lpass-va-macro.c                  |    9 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   15 +-
 sound/soc/codecs/madera.h                          |    2 +-
 sound/soc/codecs/max98090.c                        |    2 +-
 sound/soc/codecs/max98373.c                        |   14 +
 sound/soc/codecs/max98373.h                        |    3 +
 sound/soc/codecs/max98390.c                        |   62 +
 sound/soc/codecs/max98390.h                        |    2 +
 sound/soc/codecs/mt6358.c                          |    4 +-
 sound/soc/codecs/mt6359-accdet.c                   | 1080 ++++++++++++
 sound/soc/codecs/mt6359-accdet.h                   |  128 ++
 sound/soc/codecs/mt6359.c                          |    4 +-
 sound/soc/codecs/mt6359.h                          | 1864 ++++++++++++++++++--
 sound/soc/codecs/nau8825.c                         |   11 +-
 sound/soc/codecs/pcm1681.c                         |    2 +-
 sound/soc/codecs/rt1011.c                          |   65 +-
 sound/soc/codecs/rt1011.h                          |    1 -
 sound/soc/codecs/rt1015.c                          |   27 +-
 sound/soc/codecs/rt1015.h                          |   10 +
 sound/soc/codecs/rt1015p.c                         |   13 +-
 sound/soc/codecs/rt1016.c                          |   11 +-
 sound/soc/codecs/rt1019.c                          |  608 +++++++
 sound/soc/codecs/rt1019.h                          |  158 ++
 sound/soc/codecs/rt1305.c                          |    6 +-
 sound/soc/codecs/rt1308-sdw.c                      |    2 +-
 sound/soc/codecs/rt1308.c                          |   10 +-
 sound/soc/codecs/rt1316-sdw.c                      |  744 ++++++++
 sound/soc/codecs/rt1316-sdw.h                      |   55 +
 sound/soc/codecs/rt286.c                           |   34 +-
 sound/soc/codecs/rt298.c                           |    9 +-
 sound/soc/codecs/rt5631.c                          |    4 +-
 sound/soc/codecs/rt5640.c                          |   12 +-
 sound/soc/codecs/rt5645.c                          |   47 +-
 sound/soc/codecs/rt5645.h                          |    2 -
 sound/soc/codecs/rt5651.c                          |    6 +-
 sound/soc/codecs/rt5659.c                          |    4 +-
 sound/soc/codecs/rt5660.c                          |    4 +-
 sound/soc/codecs/rt5663.c                          |    4 +-
 sound/soc/codecs/rt5665.c                          |    4 +-
 sound/soc/codecs/rt5668.c                          |    8 +-
 sound/soc/codecs/rt5670.c                          |   55 +-
 sound/soc/codecs/rt5670.h                          |    2 +
 sound/soc/codecs/rt5677.c                          |    6 +-
 sound/soc/codecs/rt5682-i2c.c                      |    2 +-
 sound/soc/codecs/rt5682-sdw.c                      |    6 +-
 sound/soc/codecs/rt5682.c                          |   20 +-
 sound/soc/codecs/rt5682.h                          |    1 +
 sound/soc/codecs/rt700-sdw.c                       |    2 +-
 sound/soc/codecs/rt700.c                           |    2 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |  425 +++++
 sound/soc/codecs/rt711-sdca-sdw.h                  |   99 ++
 sound/soc/codecs/rt711-sdca.c                      | 1583 +++++++++++++++++
 sound/soc/codecs/rt711-sdca.h                      |  240 +++
 sound/soc/codecs/rt711-sdw.c                       |    2 +-
 sound/soc/codecs/rt711.c                           |    2 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |  278 +++
 sound/soc/codecs/rt715-sdca-sdw.h                  |  170 ++
 sound/soc/codecs/rt715-sdca.c                      | 1075 +++++++++++
 sound/soc/codecs/rt715-sdca.h                      |  136 ++
 sound/soc/codecs/rt715-sdw.c                       |    2 +-
 sound/soc/codecs/rt715.c                           |  369 +++-
 sound/soc/codecs/rt715.h                           |    3 +
 sound/soc/codecs/sgtl5000.c                        |    6 +-
 sound/soc/codecs/sigmadsp-regmap.c                 |    2 +-
 sound/soc/codecs/sigmadsp.c                        |   18 +-
 sound/soc/codecs/sigmadsp.h                        |    2 +-
 sound/soc/codecs/sti-sas.c                         |    3 -
 sound/soc/codecs/tas2552.c                         |    4 +-
 sound/soc/codecs/tas2562.c                         |    3 +-
 sound/soc/codecs/tas2764.c                         |    2 +-
 sound/soc/codecs/tas2770.c                         |    4 +-
 sound/soc/codecs/tlv320aic32x4.c                   |   12 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |   72 +
 sound/soc/codecs/tlv320aic3x-spi.c                 |   78 +
 sound/soc/codecs/tlv320aic3x.c                     |  111 +-
 sound/soc/codecs/tlv320aic3x.h                     |   13 +
 sound/soc/codecs/tlv320dac33.c                     |    2 +-
 sound/soc/codecs/tscs454.c                         |    7 +-
 sound/soc/codecs/wcd-clsh-v2.h                     |    6 +-
 sound/soc/codecs/wcd9335.c                         |    4 +-
 sound/soc/codecs/wcd934x.c                         |   12 +-
 sound/soc/codecs/wm2200.c                          |    7 -
 sound/soc/codecs/wm5102.c                          |   12 +-
 sound/soc/codecs/wm5110.c                          |   12 +-
 sound/soc/codecs/wm8524.c                          |    2 +-
 sound/soc/codecs/wm8903.c                          |    2 -
 sound/soc/codecs/wm8958-dsp2.c                     |   16 +-
 sound/soc/codecs/wm8960.c                          |   12 +-
 sound/soc/codecs/wm8962.c                          |   23 +-
 sound/soc/codecs/wm8978.c                          |    2 +-
 sound/soc/codecs/wm8994.h                          |    2 +-
 sound/soc/codecs/wm8996.c                          |    2 +-
 sound/soc/codecs/wm8997.c                          |   14 +-
 sound/soc/codecs/wm8998.c                          |    9 +
 sound/soc/codecs/wm_adsp.c                         |    2 +-
 sound/soc/codecs/wm_hubs.h                         |    2 +-
 sound/soc/codecs/wsa881x.c                         |    2 +-
 sound/soc/dwc/local.h                              |    6 +-
 sound/soc/fsl/Kconfig                              |   32 +
 sound/soc/fsl/Makefile                             |    6 +
 sound/soc/fsl/fsl-asoc-card.c                      |   17 +-
 sound/soc/fsl/fsl_asrc.c                           |   59 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |    5 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    4 +-
 sound/soc/fsl/fsl_audmix.c                         |    3 +-
 sound/soc/fsl/fsl_dma.c                            |    3 -
 sound/soc/fsl/fsl_easrc.c                          |   13 +-
 sound/soc/fsl/fsl_esai.c                           |   50 +-
 sound/soc/fsl/fsl_micfil.c                         |   27 +-
 sound/soc/fsl/fsl_rpmsg.c                          |  279 +++
 sound/soc/fsl/fsl_rpmsg.h                          |   35 +
 sound/soc/fsl/fsl_sai.c                            |   62 +-
 sound/soc/fsl/fsl_sai.h                            |    4 +
 sound/soc/fsl/fsl_spdif.c                          |   33 +-
 sound/soc/fsl/fsl_ssi.c                            |    7 +-
 sound/soc/fsl/fsl_xcvr.c                           |   19 +-
 sound/soc/fsl/imx-audio-rpmsg.c                    |  140 ++
 sound/soc/fsl/imx-hdmi.c                           |    5 -
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  918 ++++++++++
 sound/soc/fsl/imx-pcm-rpmsg.h                      |  512 ++++++
 sound/soc/fsl/imx-rpmsg.c                          |  150 ++
 sound/soc/fsl/mpc5200_dma.c                        |    2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |    2 +-
 sound/soc/fsl/p1022_ds.c                           |    2 +-
 sound/soc/generic/audio-graph-card.c               |  422 ++---
 sound/soc/generic/simple-card-utils.c              |  299 +++-
 sound/soc/generic/simple-card.c                    |  272 +--
 sound/soc/intel/Makefile                           |    2 +-
 sound/soc/intel/atom/sst-mfld-dsp.h                |    4 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |    2 +-
 sound/soc/intel/atom/sst/sst_loader.c              |    2 +-
 sound/soc/intel/boards/Kconfig                     |    1 +
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    1 +
 sound/soc/intel/boards/bytcr_rt5640.c              |   31 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |   36 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   77 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |   58 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   48 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |   14 +-
 sound/soc/intel/boards/sof_realtek_common.c        |  105 ++
 sound/soc/intel/boards/sof_realtek_common.h        |    7 +
 sound/soc/intel/boards/sof_rt5682.c                |   35 +-
 sound/soc/intel/boards/sof_sdw.c                   |   11 +
 sound/soc/intel/boards/sof_wm8804.c                |    6 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |  223 +++
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |   40 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   13 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   23 -
 sound/soc/intel/keembay/kmb_platform.c             |    7 +-
 sound/soc/intel/skylake/Makefile                   |    2 +-
 sound/soc/intel/skylake/skl-topology.c             |   17 +-
 sound/soc/intel/skylake/skl.h                      |    2 +-
 sound/soc/mediatek/Kconfig                         |    1 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |    2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h  |    4 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |    4 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    6 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   29 +
 sound/soc/meson/aiu-acodec-ctrl.c                  |    2 +-
 sound/soc/meson/aiu-codec-ctrl.c                   |    2 +-
 sound/soc/meson/aiu.c                              |    4 +-
 sound/soc/meson/aiu.h                              |    2 +-
 sound/soc/meson/axg-fifo.c                         |   11 +-
 sound/soc/meson/axg-frddr.c                        |   27 +-
 sound/soc/meson/axg-tdmin.c                        |    2 +-
 sound/soc/meson/axg-tdmout.c                       |    2 +-
 sound/soc/mxs/mxs-saif.c                           |   10 -
 sound/soc/pxa/mmp-pcm.c                            |    2 +-
 sound/soc/pxa/mmp-sspa.c                           |    1 -
 sound/soc/qcom/lpass-cpu.c                         |    2 +-
 sound/soc/qcom/lpass-hdmi.c                        |    4 -
 sound/soc/qcom/lpass-platform.c                    |    2 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c                |  209 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |    4 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |    9 +-
 sound/soc/qcom/qdsp6/q6afe.h                       |    4 +-
 sound/soc/qcom/qdsp6/q6asm.h                       |    6 +-
 sound/soc/samsung/i2s.c                            |    3 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |    5 +
 sound/soc/samsung/smdk_wm8994.c                    |    1 +
 sound/soc/samsung/snow.c                           |    5 +-
 sound/soc/samsung/tm2_wm5110.c                     |    5 +-
 sound/soc/sh/dma-sh7760.c                          |    1 -
 sound/soc/sh/rcar/adg.c                            |   15 +-
 sound/soc/sh/rcar/cmd.c                            |   15 +-
 sound/soc/sh/rcar/core.c                           |  103 +-
 sound/soc/sh/rcar/ctu.c                            |    2 +
 sound/soc/sh/rcar/rsnd.h                           |    6 +-
 sound/soc/sh/rcar/src.c                            |    9 +
 sound/soc/sh/rcar/ssi.c                            |  267 ++-
 sound/soc/sh/rcar/ssiu.c                           |   22 +-
 sound/soc/sh/siu_pcm.c                             |    6 +-
 sound/soc/soc-acpi.c                               |    2 +-
 sound/soc/soc-component.c                          |   16 +-
 sound/soc/soc-compress.c                           |   15 +-
 sound/soc/soc-core.c                               |   55 +-
 sound/soc/soc-dai.c                                |    2 +-
 sound/soc/soc-dapm.c                               |   24 +-
 sound/soc/soc-ops.c                                |    2 +-
 sound/soc/soc-pcm.c                                |  527 +++---
 sound/soc/soc-topology.c                           |   16 +-
 sound/soc/soc-utils.c                              |    6 +
 sound/soc/sof/Kconfig                              |   11 +
 sound/soc/sof/core.c                               |   14 +-
 sound/soc/sof/debug.c                              |   21 +-
 sound/soc/sof/intel/Kconfig                        |    2 +-
 sound/soc/sof/intel/bdw.c                          |    8 +-
 sound/soc/sof/intel/byt.c                          |   22 +-
 sound/soc/sof/intel/hda-dai.c                      |   44 +
 sound/soc/sof/intel/hda-dsp.c                      |   11 +-
 sound/soc/sof/intel/hda.c                          |   10 +-
 sound/soc/sof/intel/hda.h                          |    2 +-
 sound/soc/sof/intel/pci-tgl.c                      |   20 +-
 sound/soc/sof/intel/tgl.c                          |    2 +-
 sound/soc/sof/nocodec.c                            |   39 +-
 sound/soc/sof/ops.h                                |    6 +-
 sound/soc/sof/pcm.c                                |   38 +-
 sound/soc/sof/sof-acpi-dev.c                       |   18 +-
 sound/soc/sof/sof-audio.c                          |   63 +-
 sound/soc/sof/sof-audio.h                          |    2 +
 sound/soc/sof/sof-of-dev.c                         |   18 +-
 sound/soc/sof/sof-pci-dev.c                        |   20 +-
 sound/soc/sof/sof-priv.h                           |    2 +-
 sound/soc/sof/topology.c                           |  250 ++-
 sound/soc/sti/sti_uniperif.c                       |    3 +
 sound/soc/sti/uniperif.h                           |    4 +-
 sound/soc/stm/stm32_adfsdm.c                       |    2 +-
 sound/soc/stm/stm32_sai_sub.c                      |    5 +-
 sound/soc/sunxi/sun4i-codec.c                      |    4 +-
 sound/soc/sunxi/sun4i-i2s.c                        |    2 -
 sound/soc/sunxi/sun8i-codec.c                      |    2 +-
 sound/soc/tegra/tegra20_ac97.c                     |   21 +
 sound/soc/tegra/tegra20_ac97.h                     |    1 +
 sound/soc/tegra/tegra20_das.c                      |    8 +-
 sound/soc/tegra/tegra20_das.h                      |    6 +-
 sound/soc/tegra/tegra20_i2s.c                      |   64 +-
 sound/soc/tegra/tegra20_i2s.h                      |    1 +
 sound/soc/tegra/tegra20_spdif.c                    |   20 +-
 sound/soc/tegra/tegra30_ahub.c                     |  172 +-
 sound/soc/tegra/tegra30_ahub.h                     |    5 +-
 sound/soc/tegra/tegra30_i2s.c                      |   69 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |    5 +-
 sound/soc/ti/ams-delta.c                           |    2 +-
 sound/soc/ti/omap-abe-twl6040.c                    |    2 +-
 sound/soc/ti/omap-mcbsp.c                          |    3 +-
 sound/soc/uniphier/aio-cpu.c                       |    7 +-
 sound/soc/ux500/mop500.c                           |    6 +-
 sound/soc/ux500/mop500_ab8500.h                    |    2 +-
 344 files changed, 17633 insertions(+), 3662 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rt1019.yaml
 delete mode 100644 include/linux/platform_data/asoc-mx27vis.h
 delete mode 100644 include/sound/rt5645.h
 create mode 100644 sound/core/control_led.c
 rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (76%)
 create mode 100644 sound/soc/codecs/mt6359-accdet.c
 create mode 100644 sound/soc/codecs/mt6359-accdet.h
 create mode 100644 sound/soc/codecs/rt1019.c
 create mode 100644 sound/soc/codecs/rt1019.h
 create mode 100644 sound/soc/codecs/rt1316-sdw.c
 create mode 100644 sound/soc/codecs/rt1316-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca.c
 create mode 100644 sound/soc/codecs/rt711-sdca.h
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt715-sdca.c
 create mode 100644 sound/soc/codecs/rt715-sdca.h
 create mode 100644 sound/soc/codecs/tlv320aic3x-i2c.c
 create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c
 create mode 100644 sound/soc/fsl/fsl_rpmsg.c
 create mode 100644 sound/soc/fsl/fsl_rpmsg.h
 create mode 100644 sound/soc/fsl/imx-audio-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.h
 create mode 100644 sound/soc/fsl/imx-rpmsg.c
