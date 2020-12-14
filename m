Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50852D9A44
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 15:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F14B1779;
	Mon, 14 Dec 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F14B1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607957366;
	bh=kS9AVGu/22DLL4T5AlyaD2Rlg4Faqp80/d6gvNPMvsw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uMmwUNBChNoPohZs1ErukMUCYZMW4gSH/QGRJ2EpCCv/3NS9CxtxkK4NIOT13pSNE
	 ff+XAq+ypvEhaOMsNuJUHUg/IxxAfEsXjYLnWBIvzNRWWbnatkyNu2Kv/4Yvo5lcSz
	 4OSbSApbFBlMMltJ2Nf8j/IgT30xdl52nfW+h5xY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557EBF80240;
	Mon, 14 Dec 2020 15:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF3DF801F7; Mon, 14 Dec 2020 15:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=PRX_BODYSUB_1,PRX_BODY_13,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD64F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 15:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD64F80121
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.11
Date: Mon, 14 Dec 2020 14:47:10 +0000
Message-Id: <20201214144732.1EF9D2253A@mail.kernel.org>
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

The following changes since commit aa4cb898b80a28a610e26d1513e6dd42d995c225:

  ASoC: rt5682: change SAR voltage threshold (2020-11-26 13:06:18 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.11

for you to fetch changes up to 460aa020f56c974a3e7e5b5378b2355fec6a2c11:

  Merge remote-tracking branch 'asoc/for-5.11' into asoc-next (2020-12-11 17:48:04 +0000)

----------------------------------------------------------------
ASoC: Updates for v5.11

There's a lot of changes here but mostly cleanups and driver specific
things, the most user visible change is the support for boot time
selection of Intel DSP firmware which will make it easier for people to
move over to the preferred modern implementations in distros and other
large scale deployments.

This also includes a merge of the new auxillary bus which was done in
anticipation of use by the Intel DSP drivers which didn't quite make it.

 - Lots more cleanups and simplifications from Morimoto-san.
 - Support for some basic DPCM systems in the audio graph card from
   Sameer Pujar.
 - Remove some old pre-DT Freescale drivers for platforms that are now
   DT only.
 - Move selection of which Intel DSP implementation to use to boot time
   rather than requiring it to be selected at build time.
 - Support for Allwinner H6 I2S, Analog Devices ADAU1372, Intel
   Alderlake-S, GMediatek MT8192, NXP i.MX HDMI and XCVR, Realtek RT715,
   Qualcomm SM8250 and simple GPIO based muxes.

----------------------------------------------------------------
Ajit Pandey (1):
      ASoC: qcom: sc7180: Add machine driver for sound card registration

Ajye Huang (2):
      ASoC: google: dt-bindings: modify machine bindings for two MICs case
      ASoC: qcom: sc7180: Modify machine driver for 2mic

Alexandre Belloni (4):
      ASoC: adau1372: Add bindings documentation
      ASoC: adau1372: add missing dependencies
      ASoC: add simple-audio-mux binding
      ASoC: add simple-mux

Alexandru Ardelean (2):
      ASoC: adau1977: remove platform data and move micbias bindings include
      ASoC: adau1977: convert text binding to yaml format

Amadeusz Sławiński (8):
      ASoC: topology: Remove unused functions from topology API
      ASoC: topology: Remove multistep topology loading
      ASoC: topology: Unify all device references
      ASoC: topology: Change allocations to resource managed
      ASoC: topology: Remove empty functions
      ASoC: topology: Simplify remove_widget function
      ASoC: topology: Add missing size check
      ASoC: topology: Fix wrong size check

Arnd Bergmann (4):
      ASoC: cros_ec_codec: fix uninitialized memory read
      ASoC: atmel: mchp-spdifrx needs COMMON_CLK
      ASoC: fsl_aud2htx: mark PM functions as __maybe_unused
      ASoC: qcom: fix QDSP6 dependencies, attempt #3

Bogdan Togorean (1):
      ASoc: adi: Kconfig: Remove depends on for ADI reference designs

Brent Lu (3):
      ASoC: intel: sof_rt5682: Add support for cml_rt1015_rt5682
      ASoC: intel: sof_rt5682: Add quirk for Dooly
      ASoC: intel: sof_rt5682: Add support for tgl_rt1011_rt5682

Cezary Rojewski (4):
      ASoC: pcm: DRAIN support reactivation
      ASoC: Intel: catpt: Optimize applying user settings
      ASoC: Intel: catpt: Streamline power routines across LPT and WPT
      ASoC: Intel: catpt: Cleanup after power routines streamlining

Cheng-Yi Chiang (3):
      ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings
      ASoC: qcom: sc7180: Add missing PM ops
      ASoC: hdmi-codec: Get ELD in before reporting plugged event

Chris Chiu (1):
      ASoC: Intel: bytcr_rt5640: Add quirk for ARCHOS Cesium 140

Christophe Branchereau (2):
      ASoC: codecs/jz4770: Reset interrupt flags in bias PREPARE
      ASoC: codecs/jz4770: Adjust timeouts for cap-coupled outputs

Chuhong Yuan (2):
      ASoC: jz4740-i2s: add missed checks for clk_get()
      ASoC: amd: change clk_get() to devm_clk_get() and add missed checks

Clément Péron (6):
      ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mode
      ASoC: sun4i-i2s: Change set_chan_cfg() params
      ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
      ASoC: sun4i-i2s: Fix sun8i volatile regs
      ASoC: sun4i-i2s: fix coding-style for callback definition
      ASoC: sun4i-i2s: Document H3 with missing RX channel possibility

Codrin Ciubotariu (2):
      ASoC: pcm5102a: Make codec selectable
      ASoC: atmel-i2s: do not warn if muxclk is missing

Colin Ian King (1):
      ASoC: qcom: fix unsigned int bitwidth compared to less than zero

Curtis Malainey (1):
      ASoC: SOF: IPC: fix implicit type overflow

Dan Carpenter (7):
      ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
      ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
      ASoC: qcom: sc7180: initialize the "no_headphone" variable
      ASoC: codecs: lpass-va-macro: remove some dead code
      ASoC: max98390: Fix error codes in max98390_dsm_init()
      ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
      ASoC: mediatek: mt8183: delete some unreachable code

Dave Ertman (1):
      Add auxiliary bus support

David Lin (2):
      ASoC: nau8315: add codec driver
      ASoC: nau8315: revise the power event of EN_PIN dapm widget for symmetry

Derek Fang (1):
      ASoC: rt1015: check the return value of regmap_read during i2c probe

Dharageswari R (1):
      ASoC: Intel: Boards: tgl_max98373: add dpcm_capture flag for speaker_smart_amp

Dmitry Baryshkov (1):
      ASoC: qcom: sm8250: fix HDMI audio playback

Fabio Estevam (8):
      ASoC: wm1133-ev1: Remove unused driver
      ASoC: mx27vis-aic32x4: Remove unused driver
      ASoC: phycore-ac97: Remove unused driver
      ASoC: imx-mc13783: Remove unused driver
      ASoC: fsl: eukrea: Remove the SND_SOC_IMX_SSI selection
      ASoC: imx-ssi: Remove unused driver
      ASoC: imx-audmux: Remove unused .id_table
      ASoC: fsl_audmix: Remove unneeded data field

Fred Oh (5):
      ASoC: SOF: ops: add parse_platform_ext_manifest() op
      ASoC: SOF: Intel: hda: define parse_platform_ext_manifest op
      ASoC: SOF: ext_manifest: parse cavs extra config data elem
      ASoC: SOF: ops: modify the signature of stall op
      ASoC: SOF: Intel: hda: add sof_icl_ops for ICL platforms

Geert Uytterhoeven (3):
      ASoC: fsl: SND_SOC_FSL_AUD2HTX should depend on ARCH_MXC
      ASoC: intel: SND_SOC_INTEL_KEEMBAY should depend on ARCH_KEEMBAY
      ASoC: Fix 7/8 spaces indentation in Kconfig

Greg Kroah-Hartman (3):
      driver core: auxiliary bus: move slab.h from include file
      driver core: auxiliary bus: make remove function return void
      driver core: auxiliary bus: minor coding style tweaks

Gustavo A. R. Silva (1):
      ASoC: codecs: Fix fall-through warnings for Clang

Hans de Goede (2):
      ASoC: Intel: cht_bsw_nau8824: Drop compress-cpu-dai bits
      ASoC: Intel: cht_bsw_nau8824: Change SSP2-Codec DAI id to 0

Jack Yu (3):
      ASoC: rt1015: modification for calibration to get better performance
      ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdca codec driver
      ASoC: rt715: remove unused parameter

Jaroslav Kysela (2):
      ASoC: AMD Raven/Renoir - fix the PCI probe (PCI revision)
      ASoC: AMD Renoir - add DMI table to avoid the ACP mic probe (broken BIOS)

Jaska Uimonen (1):
      ASoC: SOF: control: override volume info callback

Jernej Skrabec (2):
      ASoC: sun4i-i2s: Add support for H6 I2S
      ASoC: sun4i-i2s: Add H6 compatible

Jerome Brunet (1):
      ASoC: meson: fix COMPILE_TEST error

Jiaxin Yu (13):
      ASoC: mediatek: mt6359: add the calibration functions
      ASoC: mediatek: mt8192: add platform driver
      ASoC: mediatek: mt8192: support i2s in platform driver
      ASoC: mediatek: mt8192: support adda in platform driver
      ASoC: mediatek: mt8192: support pcm in platform driver
      ASoC: mediatek: mt8192: support tdm in platform driver
      dt-bindings: mediatek: mt8192: add audio afe document
      ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682
      dt-bindings: mediatek: mt8192: add mt8192-mt6358-rt1015-rt5682 document
      ASoC: mediatek: mt8192: skip first time data at the beginning of DMIC recording
      ASoC: mt8192: revert "add audio afe document"
      ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails for id "LDO_VAUD18"
      ASoC: mt6359: remove unused property for mt6359

Jon Hunter (1):
      ASoC: tegra: Don't warn on probe deferral

Julia Lawall (6):
      ASoC: wm8350: use semicolons rather than commas to separate statements
      ASoC: Intel: bytcr_rt5651: use semicolons rather than commas to separate statements
      ASoC: SOF: Intel: hda: use semicolons rather than commas to separate statements
      ASoC: samsung: snow: use semicolons rather than commas to separate statements
      ASoC: madera: use semicolons rather than commas to separate statements
      ASoC: dapm: use semicolons rather than commas to separate statements

Kai Vehmanen (6):
      ASoC: SOF: loader: do not warn about unknown firmware headers
      ASoC: SOF: Intel: initial support for Alderlake-S
      ASoC: SOF: relax PCM period and buffer size constraints
      ASoC: SOF: Intel: add hw specific PCM constraints
      ASoC: Intel: common: add ACPI matching tables for Alder Lake
      ASoC: SOF: Intel: add SoundWire support for ADL-S

Kaixu Xia (1):
      ASoC: wcd9335: Remove unnecessary conversion to bool

Karol Trzcinski (5):
      ASoC: SOF: ext_manifest: Parse firmware config dictionary
      ASoC: SOF: Improve code alignment in header.h
      ASoC: SOF: Change section comment for SOF_IPC_TEST_
      ASoC: SOF: Add `memory_info` file to debugfs
      ASoC: SOF: trace: Add runtime trace filtering mechanism

Kirill Marinushkin (4):
      ASoC: pcm512x: Fix not setting word length if DAIFMT_CBS_CFS
      ASoC: pcm512x: Rearrange operations in `hw_params()`
      ASoC: pcm512x: Move format check into `set_fmt()`
      ASoC: pcm512x: Add support for more data formats

Krzysztof Kozlowski (43):
      ASoC: sunxi: do not select COMMON_CLK to fix builds
      ASoC: sh: depend on COMMON_CLK to fix compile tests
      ASoC: stm: depend on COMMON_CLK to fix compile tests
      ASoC: ti: depend on COMMON_CLK to fix compile tests
      ASoC: ak5558: mark OF related data as maybe unused
      ASoC: bd28623: mark OF related data as maybe unused
      ASoC: gtm601: mark OF related data as maybe unused
      ASoC: inno_rk3036: mark OF related data as maybe unused
      ASoC: rk3328: mark OF related data as maybe unused
      ASoC: tas571x: mark OF related data as maybe unused
      ASoC: kirkwood: armada-370-db: mark OF related data as maybe unused
      ASoC: meson: t9015: mark OF related data as maybe unused
      ASoC: qcom: mark OF related data as maybe unused
      ASoC: samsung: smdk_wm8994: mark OF related data as maybe unused
      ASoC: rockchip: mark OF related data as maybe unused
      ASoC: ti: davinci: mark OF related data as maybe unused
      ASoC: uniphier: mark OF related data as maybe unused
      ASoC: ak4118: skip of_device_id table when !CONFIG_OF
      ASoC: alc5623: skip of_device_id table when !CONFIG_OF
      ASoC: alc5632: skip of_device_id table when !CONFIG_OF
      ASoC: da7218: skip of_device_id table when !CONFIG_OF
      ASoC: da7219: skip of_device_id table when !CONFIG_OF
      ASoC: da9055: skip of_device_id table when !CONFIG_OF
      ASoC: es8316: skip of_device_id table when !CONFIG_OF
      ASoC: max98090: skip of_device_id table when !CONFIG_OF
      ASoC: max98095: skip of_device_id table when !CONFIG_OF
      ASoC: max98371: skip of_device_id table when !CONFIG_OF
      ASoC: max9867: skip of_device_id table when !CONFIG_OF
      ASoC: max98925: skip of_device_id table when !CONFIG_OF
      ASoC: max98926: skip of_device_id table when !CONFIG_OF
      ASoC: pcm1789: skip of_device_id table when !CONFIG_OF
      ASoC: pcm179x: skip of_device_id table when !CONFIG_OF
      ASoC: rt5660: skip of_device_id table when !CONFIG_OF
      ASoC: tas2562: skip of_device_id table when !CONFIG_OF
      ASoC: tlv320: skip of_device_id table when !CONFIG_OF
      ASoC: ts3a227e: skip of_device_id table when !CONFIG_OF
      ASoC: es7134: mark OF related data as maybe unused
      ASoC: es7241: mark OF related data as maybe unused
      ASoC: samsung: i2s: mark OF related data as maybe unused
      ASoC: max98371: drop driver pm=NULL assignment
      ASoC: max98925: drop driver pm=NULL assignment
      ASoC: max98926: drop driver pm=NULL assignment
      ASoC: samsung: smdk_wm8994: remove redundant of_match_ptr()

Kuninori Morimoto (34):
      ASoC: soc.h: remove for_each_rtd_dais_rollback()
      ASoC: soc-pcm: move soc_pcm_hw_free() next to soc_pcm_hw_params()
      ASoC: soc-link: add mark for snd_soc_link_hw_params/free()
      ASoC: soc-component: add mark for snd_soc_pcm_component_hw_params/free()
      ASoC: soc-dai: add mark for snd_soc_dai_hw_params/free()
      ASoC: soc-pcm: add soc_pcm_hw_clean() and call it from soc_pcm_hw_params/free()
      ASoC: audio-graph-card: switch to yaml base Documentation
      ASoC: renesas, rsnd: switch to yaml base Documentation
      ASoC: renesas,rsnd: Add r8a77961 support
      ASoC: soc-compress: tidyup STREAM vs COMPRESS
      ASoC: soc-compress: assume SNDRV_PCM_STREAM_xxx and SND_COMPRESS_xxx are same
      ASoC: soc-component: add snd_soc_component_compr_open()
      ASoC: soc-component: add snd_soc_component_compr_free()
      ASoC: soc-component: add snd_soc_component_compr_trigger()
      ASoC: soc-component: add snd_soc_component_compr_set_params()
      ASoC: soc-component: add snd_soc_component_compr_get_params()
      ASoC: soc-component: add snd_soc_component_compr_get_caps()
      ASoC: soc-component: add snd_soc_component_compr_get_codec_caps()
      ASoC: soc-component: add snd_soc_component_compr_ack()
      ASoC: soc-component: add snd_soc_component_compr_pointer()
      ASoC: soc-component: add snd_soc_component_compr_copy()
      ASoC: soc-component: add snd_soc_component_compr_set_metadata()
      ASoC: soc-component: add snd_soc_component_compr_get_metadata()
      ASoC: soc-compress: move soc_compr_free() next to soc_compr_open()
      ASoC: soc-dai: add mark for snd_soc_dai_compr_startup/shutdown()
      ASoC: soc-component: add mark for snd_soc_component_compr_open/free()
      ASoC: soc-component: add mark for snd_soc_link_compr_startup/shutdown()
      ASoC: soc-compress: add soc_compr_clean() and call it from soc_compr_open/free()
      ASoC: soc-core: add soc_playback_digital_mute()
      ASoC: soc-core: add soc_dapm_suspend_resume()
      ASoC: soc-core: tidyup jack.h
      ASoC: add soc-jack.h
      ASoC: soc-pcm: remove dpcm_do_trigger()
      ASoC: soc-pcm: care trigger rollback

Kyle Russell (2):
      ASoC: mmp-sspa: clear transmit phase bit for non-stereo formats
      ASoC: mmp-sspa: set phase two word length register

Lars-Peter Clausen (2):
      ASoC: jz4740-i2s: Remove manual DMA peripheral ID assignment
      ASoC: Add ADAU1372 audio CODEC support

Lumi Lee (1):
      ASoC: mediatek: btcvsd fix tx stream assign

Marcus Cooper (2):
      ASoC: sun4i-i2s: Set sign extend sample
      ASoC: sun4i-i2s: Add 20 and 24 bit support

Mark Brown (48):
      Merge existing fixes from asoc/for-5.10
      Merge series "dt-bindings: stm32: convert audio dfsdm to json-schema" from Olivier Moysan <olivier.moysan@st.com>:
      Merge series "ASoC: sun8i-codec: support for AIF2 and AIF3" from Samuel Holland <samuel@sholland.org>:
      Merge series "use semicolons rather than commas to separate statements" from Julia Lawall <Julia.Lawall@inria.fr>:
      Merge series "ASoC: qcom: add support for QRB5165 RB5 machine" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: merge soc_pcm_hw_param() rollback and soc_pcm_hw_free()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "DAI driver for new XCVR IP" from "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com> Viorel Suman <viorel.suman@nxp.com>:
      Merge series "ASoC: SOF: cleanups for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "Add documentation and machine driver for SC7180 sound card" from Cheng-Yi Chiang <cychiang@chromium.org>:
      Merge series "Add rt1015 support to CML boards" from Brent Lu <brent.lu@intel.com>:
      Merge series "ASoC: Mediatek: Add support for MT8192 SoC" from Jiaxin Yu <jiaxin.yu@mediatek.com>:
      Merge series "ASoC: topology: Change to resource managed memory" from Amadeusz Sławiński<amadeuszx.slawinski@linux.intel.com>:
      Merge series "ASoC: dt-bindings: audio-graph-card: switch to yaml base Documentation" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: ti: davinci-mcasp: Handle incomplete DT node gracefully" from Peter Ujfalusi <peter.ujfalusi@ti.com>:
      Merge series "ASoC: soc-compress: tidyup STREAM vs COMPRESS" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "Fix vaud18 power leakage of mt6359" from Shane Chien <shane.chien@mediatek.com> "Shane.Chien" <shane.chien@mediatek.com>:
      Merge series "Modify documentation and machine driver for SC7180 sound card" from Ajye Huang <ajye.huang@gmail.com>:
      Merge series "Audio Graph Updates" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "Fix PM disable depth imbalance on error" from Zhang Qilong <zhangqilong3@huawei.com>:
      Merge series "ASoC: Fix error handling in wm899x" from Zhang Qilong <zhangqilong3@huawei.com>:
      Merge series "ASoC: soundwire: SDCA device quirk and cleanups" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Support SC7180 sound card variation without headset" from xuyuqing <xuyuqing@huaqin.corp-partner.google.com>:
      Merge series "ASoC: SOF: Kconfig corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: use inclusive language for bclk/fsync/topology" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: pcm512x: Patch series to set fmt from `set_fmt()`" from Kirill Marinushkin <kmarinushkin@birdec.com>:
      Merge series "ASoC: Intel: catpt: Offload fixes and code optimization" from Cezary Rojewski <cezary.rojewski@intel.com>:
      Merge series "ASoC: graph card schema rework" from Rob Herring <robh@kernel.org>:
      Merge series "ASoC: soc-component: add snd_soc_component_xxx()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: codecs: add support for LPASS Codec macros" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: Intel/SOF: extend run-time driver selection to ACPI devices" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: mt6359: Fix regulator_dev_lookup() fails for id "LDO_VAUD18"" from Jiaxin Yu <jiaxin.yu@mediatek.com>:
      Merge series "ASoC: fix !OF compile test warnings" from Krzysztof Kozlowski <krzk@kernel.org>:
      Merge series "ASoC: merge soc_compr_open() rollback and soc_compr_free()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: amd: Minor fixes for error handling" from Takashi Iwai <tiwai@suse.de>:
      Merge series "ASoC: tidyup for jack.h" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: SOF: Intel: fix ICL boot sequence" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge branch 'for-5.10' of https://git.kernel.org/.../broonie/sound into asoc-5.11
      Merge tag 'soundwire-for-asoc-5.11' of git://git.kernel.org/.../vkoul/soundwire into asoc-5.11
      Merge branch '20201104_yung_chuan_liao_regmap_soundwire_asoc_add_soundwire_sdca_support' (early part) into asoc-5.11
      Merge series "ASoC: mediatek: mt8192: support new machine rt1015p_rt5682" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge tag 'auxbus-5.11-rc1' of git://git.kernel.org/.../gregkh/driver-core into asoc-5.11
      Merge series "ASoC: Intel: cht_bsw_nau8824: 2 fixes for usage with sof-audio-acpi" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: soc-pcm: trigger cleanup" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: rt1015p: delay 300ms for waiting calibration" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: SOF: Intel: fix to dsp state dump trace levels" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge remote-tracking branch 'asoc/for-5.9' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.10' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.11' into asoc-next

Michał Mirosław (1):
      ASoC: tegra20-spdif: remove "default m"

Oder Chiou (2):
      ASoC: rt5682: Add a new property for the DMIC clock driving
      ASoC: rt5682: Add a new property to the device tree.

Olivier Moysan (3):
      dt-bindings: stm32: dfsdm: update audio properties
      ASoC: dt-bindings: stm32: dfsdm: remove stm32-adfsdm.txt binding
      ASoC: dt-bindings: stm32: convert sai to json-schema

Paul Cercueil (3):
      ASoC: codecs/jz47xx: Use regmap_{set,clear}_bits
      ASoC: codecs/jz4770: Don't change cap-couple setting in HP PMU/PMD
      ASoC: codecs/jz4770: Add DAPM widget to set HP out to cap-less mode

Peter Ujfalusi (4):
      ASoC: ti: davinci-mcasp: Use platform_get_irq_byname_optional
      ASoC: ti: davinci-mcasp: Remove legacy dma_request parsing
      ASoC: ti: davinci-mcasp: Simplify the configuration parameter handling
      ASoC: ti: davinci-mcasp: Handle missing required DT properties

Pierre-Louis Bossart (31):
      ASoC: SOF: control: remove const in sizeof()
      ASoC: SOF: topology: remove const in sizeof()
      ASoC: SOF: sof-audio: remove goto used for force-nocodec support
      ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA device
      ASoC: codecs: rt*.c: remove useless pointer cast
      ASoC: rt711: remove warnings
      ASoC: codecs: max98373-sdw: align regmap use with other codecs
      ASoC: SOF: Intel: fix Kconfig dependency for SND_INTEL_DSP_CONFIG
      ASoC: topology: use inclusive language for bclk and fsync
      ASoC: SOF: use inclusive language for bclk and fsync
      ASoC: Intel: atom: use inclusive language for SSP bclk/fsync
      ASoC: Intel: keembay: use inclusive language for bclk and fsync
      ASoC: Intel: broadwell: add missing pm_ops
      ASoC: Intel: bdw-rt5677: add missing pm_ops
      ALSA: hda: intel-dsp-config: add helper for ACPI DSP driver selection
      ASoC: soc-acpi: add helper to identify parent driver.
      ASoC: Intel: boards: byt/cht: set card and driver name at run time
      ASoC: Intel: byt/cht: set pm ops dynamically
      ASoC: SOF: acpi: add dynamic selection of DSP driver
      ASoC: Intel: Atom: add dynamic selection of DSP driver
      ASoC: SOF: Intel: allow for coexistence between SOF and Atom/SST drivers
      ALSA: hda: intel-dsp-config: add Broadwell ACPI DSP driver selection
      ASoC: Intel: broadwell: set card and driver name dynamically
      ASoC: Intel: catpt: add dynamic selection of DSP driver
      ALSA: hda: intel-dsp-config: ignore dsp_driver parameter for PCI legacy devices
      ASoC: SOF: Intel: allow for coexistence between SOF and catpt drivers
      soundwire: SDCA: detect sdca_cascade interrupt
      soundwire: SDCA: add helper macro to access controls
      regmap/SoundWire: sdw: add support for SoundWire 1.2 MBQ
      ASoC: SOF: control: fix cppcheck warning in snd_sof_volume_info()
      ASoC: SOF: imx: update kernel-doc description

Piotr Maziarz (1):
      ASoC: Intel: catpt: select WANT_DEV_COREDUMP

Randy Dunlap (3):
      ASoC: SOF: imx: fix Kconfig punctuation
      ASoC: SOF: Kconfig: fix Kconfig punctuation and wording
      ASoC: SOF: Intel: fix Kconfig punctuation and wording

Ranjani Sridharan (6):
      ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean
      ASoC: SOF: nocodec: modify DAI link definitions
      ASoC: pcm: send DAPM_STREAM_STOP event in dpcm_fe_dai_shutdown
      ASoC: SOF: Intel: hda: remove duplicated status dump
      ASoC: SOF: modify the SOF_DBG flags
      ASoC: SOF: Intel: hda: fix the condition passed to sof_dev_dbg_or_err

Richard Fitzgerald (1):
      ASoC: wm5102: Use get_unaligned_be16() for dac_comp_coeff

Rob Herring (3):
      ASoC: dt-bindings: marvell, mmp-sspa: Use audio-graph-port schema
      ASoC: dt-bindings: Refine 'frame-master' and 'bitclock-master' type
      ASoC: dt-bindings: renesas, rsnd: Fix duplicate 'allOf' entries

Sameer Pujar (10):
      ASoC: soc-core: Fix component name_prefix parsing
      ASoC: soc-pcm: Get all BEs along DAPM path
      ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
      ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
      ASoC: audio-graph: Support empty Codec endpoint
      ASoC: audio-graph: Expose new members for asoc_simple_priv
      ASoC: audio-graph: Expose helpers from audio graph
      ASoC: audio-graph-card: Refactor schema
      dt-bindings: tegra: Convert HDA doc to json-schema
      dt-bindings: tegra: Add missing HDA properties

Samuel Holland (18):
      ASoC: sun8i-codec: Prepare to extend the DAI driver
      ASoC: sun8i-codec: Program DAI format before clock inversion
      ASoC: sun8i-codec: Enable all supported clock inversions
      ASoC: sun8i-codec: Use the provided word size
      ASoC: sun8i-codec: Round up the LRCK divisor
      ASoC: sun8i-codec: Correct the BCLK divisor calculation
      ASoC: sun8i-codec: Support the TDM slot binding
      ASoC: sun8i-codec: Enforce symmetric DAI parameters
      ASoC: sun8i-codec: Enable all supported sample rates
      ASoC: sun8i-codec: Automatically set the system sample rate
      ASoC: sun8i-codec: Constrain to compatible sample rates
      ASoC: sun8i-codec: Protect the clock rate while streams are open
      ASoC: sun8i-codec: Require an exact BCLK divisor match
      ASoC: sun8i-codec: Enable all supported PCM formats
      ASoC: sun8i-codec: Generalize AIF clock control
      ASoC: sun8i-codec: Add the AIF2 DAI, widgets, and routes
      ASoC: sun8i-codec: Add the AIF3 DAI, widgets, and routes
      ASoC: sun4i-i2s: Fix setting of FIFO modes

Sathyanarayana Nujella (1):
      ASoC: Intel: Boards: tgl_max98373: update TDM slot_width

Shane.Chien (3):
      ASoC: Fix vaud18 power leakage of mt6359
      dt-bindings: mediatek: mt6359: Add new property for mt6359
      ASoC: Remove mt6359_platform_driver_remove

Shengjiu Wang (13):
      ASoC: dt-bindings: fsl_spdif: Add new compatible string for i.MX8QM
      ASoC: fsl_spdif: Add support for i.MX8QM platform
      ASoC: fsl_spdif: Add support for higher sample rates
      ASoC: dt-bindings: fsl_aud2htx: Add binding doc for aud2htx module
      ASoC: fsl_aud2htx: Add aud2htx module driver
      ASoC: fsl_aud2htx: Remove dev_err() usage after platform_get_irq()
      ASoC: fsl_sai: Correct the clock source for mclk0
      ASoC: hdmi-codec: Add RX support
      ASoC: fsl: Fix config name of CONFIG_ARCH_MXC
      ASoC: fsl-asoc-card: Add support for si476x codec
      ASoC: bindings: fsl-asoc-card: add compatible string for si476x codec
      ASoC: dt-bindings: imx-hdmi: Add binding doc for hdmi machine driver
      ASoC: fsl: Add imx-hdmi machine driver

Shuming Fan (1):
      ASoC: rt1015: support TDM slot configuration

Srinivas Kandagatla (17):
      ASoC: qcom: dt-bindings: Add SM8250 sound card bindings
      ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
      ASoC: qcom: qdsp6: make use of devm_of_platform_populate
      ASoC: qcom: sm8250: Fix array out of bounds access
      ASoC: qcom: dt-bindings: sm8250: update compatibles
      ASoC: qcom: sm8250: update compatible with new bindings
      ASoC: qcom: lpass-cpu: fix warning on symbol scope
      ASoC: q6afe-clocks: fix warning on symbol scope
      ASoC: qcom: dt-bindings: add bindings for lpass wsa macro codec
      ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro
      ASoC: codecs: lpass-wsa-macro: add dapm widgets and route
      ASoC: qcom: dt-bindings: add bindings for lpass va macro codec
      ASoC: codecs: lpass-va-macro: Add support to VA Macro
      ASoC: codecs: lpass-va-macro: add dapm widgets and routes
      ASoC: codecs: lpass-va-macro: add missing MODULE_DEVICE_TABLE
      soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized attribute
      ASoC: q6afe-clocks: Add missing parent clock rate

Sudip Mukherjee (1):
      ASoC: mediatek: mt8192: Fix build failure

Takashi Iwai (3):
      ASoC: amd: Downgrade print level for invalid ACP mode
      ASoC: amd: Return -ENODEV for non-existing ACPI call
      ASoC: cx2072x: Fix doubly definitions of Playback and Capture streams

Tom Rix (5):
      ASoC: bcm2835-i2s: remove unneeded semicolon
      ASoC: Intel: remove unneeded semicolon
      ASoC: TSCS454: remove unneeded semicolon
      ASoC: tegra: remove unneeded semicolon
      ASoC: TSCS42xx: remove unneeded semicolon

Tzung-Bi Shih (9):
      ASoC: mediatek: mt8192: rename common symbols
      ASoC: mediatek: mt8192: extract rt1015_rt5682 specific DAI link
      ASoC: mediatek: mt8192: move rt1015_rt5682 specific data
      ASoC: dt-bindings: mt8192-mt6359: fix typo in the example
      ASoC: dt-bindings: mt8192-mt6359: add new compatible for using rt1015p
      ASoC: mediatek: mt8192: support rt1015p_rt5682
      ASoC: rt1015p: move SDB control from trigger to DAPM
      ASoC: rt1015p: delay 300ms after SDB pulling high for calibration
      ASoC: mediatek: mt8183: add PM ops to machine drivers

V Sujith Kumar Reddy (2):
      ASoC: qcom: lpass-sc7180: Add 32 bit format support for capture
      ASoC: qcom: sc7180: Register shutdown handler for lpass platform

Vijendar Mukunda (1):
      ASoC: amd: support other audio modes for raven

Viorel Suman (4):
      ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
      ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
      ASoC: fsl_xcvr: fix break condition
      ASoC: fsl_xcvr: fix potential resource leak

Xu Wang (3):
      ASoC: ti: davinci-evm: Remove redundant null check before clk_disable_unprepare
      ASoC: samsung: i2s: Remove redundant null check before clk_disable_unprepare
      ASoC: pxa: pxa-ssp: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare

Zhang Qilong (4):
      ASoC: ti: davinci-mcasp: remove always zero of davinci_mcasp_get_dt_params
      ASoC: wm8994: Fix PM disable depth imbalance on error
      ASoC: wm8998: Fix PM disable depth imbalance on error
      ASoC: arizona: Fix a wrong free in wm8997_probe

Zou Wei (2):
      ASoC: mediatek: mt8192: Make some symbols static
      ASoC: samsung: fix platform_no_drv_owner.cocci warnings

xuyuqing (3):
      ASoC: google: dt-bindings: add new compatible for sc7180-coachz
      ASoC: qcom: sc7180: Modify machine driver for sound card
      ASoC: qcom: sc7180: fix 32 bit format for adau7002

 CREDITS                                            |    9 +
 Documentation/ABI/README                           |   10 +-
 Documentation/ABI/obsolete/sysfs-class-dax         |    8 +-
 .../ABI/obsolete/sysfs-driver-hid-roccat-pyra      |    3 +
 Documentation/ABI/obsolete/sysfs-gpio              |    2 +
 Documentation/ABI/removed/devfs                    |    1 +
 Documentation/ABI/removed/raw1394                  |    1 +
 Documentation/ABI/removed/sysfs-class-rfkill       |    2 +-
 Documentation/ABI/removed/video1394                |    1 +
 Documentation/ABI/stable/firewire-cdev             |   69 +-
 Documentation/ABI/stable/sysfs-acpi-pmprofile      |   26 +-
 Documentation/ABI/stable/sysfs-bus-firewire        |    3 +
 Documentation/ABI/stable/sysfs-bus-nvmem           |   19 +-
 Documentation/ABI/stable/sysfs-bus-usb             |    6 +-
 Documentation/ABI/stable/sysfs-bus-vmbus           |    7 -
 Documentation/ABI/stable/sysfs-bus-w1              |    1 +
 Documentation/ABI/stable/sysfs-class-backlight     |    1 +
 Documentation/ABI/stable/sysfs-class-infiniband    |   93 +-
 Documentation/ABI/stable/sysfs-class-rfkill        |   13 +-
 Documentation/ABI/stable/sysfs-class-tpm           |  100 +-
 Documentation/ABI/stable/sysfs-devices             |    5 +-
 Documentation/ABI/stable/sysfs-driver-dma-ioatdma  |   10 +-
 .../ABI/stable/sysfs-driver-firmware-zynqmp        |   62 +-
 Documentation/ABI/stable/sysfs-driver-ib_srp       |    1 +
 Documentation/ABI/stable/sysfs-driver-speakup      |    4 +
 Documentation/ABI/stable/sysfs-firmware-efi-vars   |    4 +
 Documentation/ABI/stable/sysfs-firmware-opal-dump  |    5 +
 Documentation/ABI/stable/sysfs-firmware-opal-elog  |    2 +
 Documentation/ABI/stable/sysfs-hypervisor-xen      |    3 +
 Documentation/ABI/stable/vdso                      |   11 +-
 Documentation/ABI/testing/configfs-acpi            |   34 +-
 Documentation/ABI/testing/configfs-most            |  135 +-
 .../ABI/testing/configfs-spear-pcie-gadget         |   36 +-
 Documentation/ABI/testing/configfs-usb-gadget      |   87 +-
 Documentation/ABI/testing/configfs-usb-gadget-ecm  |   12 +-
 Documentation/ABI/testing/configfs-usb-gadget-eem  |   10 +-
 Documentation/ABI/testing/configfs-usb-gadget-hid  |   10 +-
 .../ABI/testing/configfs-usb-gadget-loopback       |    6 +-
 .../ABI/testing/configfs-usb-gadget-mass-storage   |   18 +-
 Documentation/ABI/testing/configfs-usb-gadget-midi |   14 +-
 .../ABI/testing/configfs-usb-gadget-printer        |    6 +-
 .../ABI/testing/configfs-usb-gadget-rndis          |   16 +-
 .../ABI/testing/configfs-usb-gadget-sourcesink     |   18 +-
 .../ABI/testing/configfs-usb-gadget-subset         |   10 +-
 Documentation/ABI/testing/configfs-usb-gadget-uac1 |   18 +-
 Documentation/ABI/testing/configfs-usb-gadget-uac2 |   14 +-
 Documentation/ABI/testing/configfs-usb-gadget-uvc  |  220 +-
 Documentation/ABI/testing/debugfs-cec-error-inj    |    2 +-
 .../ABI/testing/debugfs-driver-habanalabs          |   12 +-
 Documentation/ABI/testing/debugfs-ec               |   11 +-
 Documentation/ABI/testing/debugfs-moxtet           |   30 +-
 Documentation/ABI/testing/debugfs-pfo-nx-crypto    |   28 +-
 Documentation/ABI/testing/debugfs-pktcdvd          |   13 +-
 Documentation/ABI/testing/debugfs-turris-mox-rwtm  |   15 +-
 Documentation/ABI/testing/debugfs-wilco-ec         |   21 +-
 Documentation/ABI/testing/dell-smbios-wmi          |   32 +-
 Documentation/ABI/testing/dev-kmsg                 |   27 +-
 Documentation/ABI/testing/evm                      |   17 +-
 Documentation/ABI/testing/gpio-cdev                |   13 +-
 Documentation/ABI/testing/ima_policy               |   30 +-
 Documentation/ABI/testing/procfs-diskstats         |   46 +-
 Documentation/ABI/testing/procfs-smaps_rollup      |   48 +-
 Documentation/ABI/testing/pstore                   |   19 +-
 Documentation/ABI/testing/sysfs-block              |   38 +-
 Documentation/ABI/testing/sysfs-block-device       |    2 +
 Documentation/ABI/testing/sysfs-block-rnbd         |    4 +-
 Documentation/ABI/testing/sysfs-bus-acpi           |   19 +-
 .../ABI/testing/sysfs-bus-coresight-devices-cti    |   60 +-
 .../ABI/testing/sysfs-bus-coresight-devices-etb10  |   21 +-
 .../ABI/testing/sysfs-bus-coresight-devices-etm3x  |   10 +-
 .../ABI/testing/sysfs-bus-coresight-devices-etm4x  |   76 +-
 .../ABI/testing/sysfs-bus-coresight-devices-stm    |    2 +-
 .../ABI/testing/sysfs-bus-coresight-devices-tmc    |   20 +-
 Documentation/ABI/testing/sysfs-bus-css            |    3 +
 Documentation/ABI/testing/sysfs-bus-dfl            |    2 +
 .../testing/sysfs-bus-event_source-devices-dfl_fme |   14 +-
 .../testing/sysfs-bus-event_source-devices-format  |    3 +-
 .../testing/sysfs-bus-event_source-devices-hv_24x7 |    6 +-
 .../testing/sysfs-bus-event_source-devices-hv_gpci |    7 +-
 Documentation/ABI/testing/sysfs-bus-fcoe           |   68 +-
 Documentation/ABI/testing/sysfs-bus-fsl-mc         |   12 +-
 .../ABI/testing/sysfs-bus-i2c-devices-fsa9480      |   26 +-
 .../ABI/testing/sysfs-bus-i2c-devices-pca954x      |   27 +-
 Documentation/ABI/testing/sysfs-bus-i3c            |    2 +
 Documentation/ABI/testing/sysfs-bus-iio            |   30 +-
 .../testing/sysfs-bus-iio-adc-envelope-detector    |    5 +-
 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435 |    5 +
 Documentation/ABI/testing/sysfs-bus-iio-adc-stm32  |    3 +
 Documentation/ABI/testing/sysfs-bus-iio-cros-ec    |    2 +-
 .../ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32      |    8 +-
 .../ABI/testing/sysfs-bus-iio-distance-srf08       |    7 +-
 .../ABI/testing/sysfs-bus-iio-frequency-ad9523     |    2 +
 .../ABI/testing/sysfs-bus-iio-frequency-adf4371    |   10 +-
 .../ABI/testing/sysfs-bus-iio-health-afe440x       |   12 +-
 .../ABI/testing/sysfs-bus-iio-light-isl29018       |    6 +-
 .../ABI/testing/sysfs-bus-iio-lptimer-stm32        |   29 +-
 .../ABI/testing/sysfs-bus-iio-magnetometer-hmc5843 |   19 +-
 .../ABI/testing/sysfs-bus-iio-temperature-max31856 |   19 +-
 .../ABI/testing/sysfs-bus-iio-timer-stm32          |  143 +-
 .../ABI/testing/sysfs-bus-intel_th-devices-gth     |   11 +-
 .../ABI/testing/sysfs-bus-intel_th-devices-msc     |    4 +
 Documentation/ABI/testing/sysfs-bus-most           |    6 +-
 Documentation/ABI/testing/sysfs-bus-moxtet-devices |    6 +-
 Documentation/ABI/testing/sysfs-bus-nfit           |    2 +-
 Documentation/ABI/testing/sysfs-bus-nvdimm         |    6 +
 Documentation/ABI/testing/sysfs-bus-papr-pmem      |   23 +-
 Documentation/ABI/testing/sysfs-bus-pci            |   22 +-
 .../ABI/testing/sysfs-bus-pci-devices-aer_stats    |  119 +-
 .../ABI/testing/sysfs-bus-pci-devices-catpt        |    1 +
 .../ABI/testing/sysfs-bus-pci-drivers-ehci_hcd     |    4 +-
 Documentation/ABI/testing/sysfs-bus-rapidio        |   23 +-
 Documentation/ABI/testing/sysfs-bus-rbd            |   37 +-
 Documentation/ABI/testing/sysfs-bus-siox           |    3 +
 Documentation/ABI/testing/sysfs-bus-thunderbolt    |   58 +-
 Documentation/ABI/testing/sysfs-bus-usb            |   32 +-
 .../ABI/testing/sysfs-bus-usb-devices-usbsevseg    |    7 +-
 Documentation/ABI/testing/sysfs-bus-vfio-mdev      |   10 +-
 Documentation/ABI/testing/sysfs-c2port             |    7 -
 Documentation/ABI/testing/sysfs-class-backlight    |   60 +
 .../ABI/testing/sysfs-class-backlight-adp8860      |   21 +-
 .../testing/sysfs-class-backlight-driver-adp8870   |   30 +-
 .../testing/sysfs-class-backlight-driver-lm3533    |   26 +-
 Documentation/ABI/testing/sysfs-class-bdi          |    1 -
 Documentation/ABI/testing/sysfs-class-chromeos     |   15 +-
 Documentation/ABI/testing/sysfs-class-cxl          |   23 +-
 Documentation/ABI/testing/sysfs-class-devfreq      |    6 +-
 Documentation/ABI/testing/sysfs-class-devlink      |   30 +-
 Documentation/ABI/testing/sysfs-class-extcon       |   34 +-
 Documentation/ABI/testing/sysfs-class-fpga-manager |    5 +-
 Documentation/ABI/testing/sysfs-class-gnss         |    2 +
 Documentation/ABI/testing/sysfs-class-led          |   28 +-
 .../ABI/testing/sysfs-class-led-driver-el15203000  |  130 -
 .../ABI/testing/sysfs-class-led-driver-lm3533      |   44 +-
 .../ABI/testing/sysfs-class-led-driver-sc27xx      |   22 -
 Documentation/ABI/testing/sysfs-class-led-flash    |   27 +-
 .../ABI/testing/sysfs-class-led-multicolor         |   23 +-
 .../ABI/testing/sysfs-class-led-trigger-netdev     |    7 +
 .../ABI/testing/sysfs-class-led-trigger-pattern    |    4 +-
 .../ABI/testing/sysfs-class-led-trigger-usbport    |    1 +
 Documentation/ABI/testing/sysfs-class-leds-gt683r  |    8 +-
 Documentation/ABI/testing/sysfs-class-mic          |   52 +-
 Documentation/ABI/testing/sysfs-class-net          |   63 +-
 Documentation/ABI/testing/sysfs-class-net-cdc_ncm  |    6 +-
 Documentation/ABI/testing/sysfs-class-net-phydev   |    2 +
 Documentation/ABI/testing/sysfs-class-ocxl         |   17 +-
 Documentation/ABI/testing/sysfs-class-pktcdvd      |   38 +-
 Documentation/ABI/testing/sysfs-class-power        |  525 ++--
 Documentation/ABI/testing/sysfs-class-power-mp2629 |    1 +
 .../ABI/testing/sysfs-class-power-twl4030          |   33 +-
 Documentation/ABI/testing/sysfs-class-power-wilco  |   18 +-
 Documentation/ABI/testing/sysfs-class-rapidio      |   48 +-
 Documentation/ABI/testing/sysfs-class-rc           |   30 +-
 Documentation/ABI/testing/sysfs-class-regulator    |   36 +-
 Documentation/ABI/testing/sysfs-class-remoteproc   |   14 +-
 Documentation/ABI/testing/sysfs-class-rnbd-client  |   93 +-
 .../sysfs-class-rtc-rtc0-device-rtc_calibration    |    1 +
 Documentation/ABI/testing/sysfs-class-rtrs-client  |   23 +-
 Documentation/ABI/testing/sysfs-class-scsi_host    |    7 +-
 Documentation/ABI/testing/sysfs-class-typec        |   12 +-
 Documentation/ABI/testing/sysfs-class-uwb_rc       |   13 +-
 Documentation/ABI/testing/sysfs-class-watchdog     |    7 +-
 Documentation/ABI/testing/sysfs-dev                |    7 +-
 Documentation/ABI/testing/sysfs-devices-mapping    |   41 +-
 Documentation/ABI/testing/sysfs-devices-memory     |   15 +-
 .../ABI/testing/sysfs-devices-platform-ACPI-TAD    |    4 +
 .../testing/sysfs-devices-platform-_UDC_-gadget    |   10 +-
 .../ABI/testing/sysfs-devices-platform-docg3       |   10 +-
 .../ABI/testing/sysfs-devices-platform-ipmi        |   52 +-
 .../sysfs-devices-platform-sh_mobile_lcdc_fb       |    8 +-
 .../testing/sysfs-devices-platform-stratix10-rsu   |   10 +
 Documentation/ABI/testing/sysfs-devices-system-cpu |  101 +-
 .../ABI/testing/sysfs-devices-system-ibm-rtl       |    6 +-
 .../ABI/testing/sysfs-driver-bd9571mwv-regulator   |    4 +
 Documentation/ABI/testing/sysfs-driver-genwqe      |   11 +-
 Documentation/ABI/testing/sysfs-driver-hid-lenovo  |   10 +
 .../ABI/testing/sysfs-driver-hid-logitech-lg4ff    |   18 +-
 Documentation/ABI/testing/sysfs-driver-hid-ntrig   |   13 +-
 .../ABI/testing/sysfs-driver-hid-roccat-kone       |   19 +
 Documentation/ABI/testing/sysfs-driver-hid-wiimote |   12 +-
 .../ABI/testing/sysfs-driver-input-exc3000         |    2 +
 .../ABI/testing/sysfs-driver-jz4780-efuse          |    6 +-
 Documentation/ABI/testing/sysfs-driver-pciback     |    6 +-
 .../ABI/testing/sysfs-driver-samsung-laptop        |   13 +-
 .../ABI/testing/sysfs-driver-toshiba_acpi          |   26 +
 .../ABI/testing/sysfs-driver-toshiba_haps          |    2 +
 Documentation/ABI/testing/sysfs-driver-ufs         |  228 +-
 Documentation/ABI/testing/sysfs-driver-w1_ds28e17  |    3 +
 Documentation/ABI/testing/sysfs-driver-w1_therm    |   75 +-
 Documentation/ABI/testing/sysfs-driver-wacom       |    4 +-
 Documentation/ABI/testing/sysfs-firmware-acpi      |  237 +-
 .../ABI/testing/sysfs-firmware-dmi-entries         |   50 +-
 Documentation/ABI/testing/sysfs-firmware-efi-esrt  |   28 +-
 .../ABI/testing/sysfs-firmware-efi-runtime-map     |   14 +-
 Documentation/ABI/testing/sysfs-firmware-gsmi      |    2 +-
 Documentation/ABI/testing/sysfs-firmware-memmap    |   16 +-
 .../ABI/testing/sysfs-firmware-qemu_fw_cfg         |   20 +-
 Documentation/ABI/testing/sysfs-firmware-sfi       |    6 +-
 Documentation/ABI/testing/sysfs-firmware-sgi_uv    |    6 +-
 .../ABI/testing/sysfs-firmware-turris-mox-rwtm     |   10 +-
 Documentation/ABI/testing/sysfs-fs-ext4            |    4 +-
 Documentation/ABI/testing/sysfs-fs-f2fs            |   48 +-
 Documentation/ABI/testing/sysfs-hypervisor-xen     |   13 +-
 Documentation/ABI/testing/sysfs-kernel-boot_params |   23 +-
 .../ABI/testing/sysfs-kernel-mm-hugepages          |   12 +-
 Documentation/ABI/testing/sysfs-kernel-mm-ksm      |    5 +-
 Documentation/ABI/testing/sysfs-kernel-slab        |    3 +
 Documentation/ABI/testing/sysfs-module             |   17 +-
 .../ABI/testing/sysfs-platform-asus-laptop         |   21 +-
 Documentation/ABI/testing/sysfs-platform-asus-wmi  |    1 +
 Documentation/ABI/testing/sysfs-platform-at91      |   10 +-
 .../ABI/testing/sysfs-platform-dell-laptop         |   10 +-
 .../ABI/testing/sysfs-platform-dell-smbios         |    4 +-
 Documentation/ABI/testing/sysfs-platform-dfl-fme   |   14 +-
 Documentation/ABI/testing/sysfs-platform-dptf      |   11 +-
 .../ABI/testing/sysfs-platform-eeepc-laptop        |   14 +-
 .../ABI/testing/sysfs-platform-i2c-demux-pinctrl   |    4 +-
 .../ABI/testing/sysfs-platform-ideapad-laptop      |    9 +-
 .../testing/sysfs-platform-intel-wmi-sbl-fw-update |    1 +
 .../testing/sysfs-platform-intel-wmi-thunderbolt   |    1 +
 Documentation/ABI/testing/sysfs-platform-kim       |    1 +
 .../ABI/testing/sysfs-platform-mellanox-bootctl    |   50 +-
 .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |   10 +-
 .../ABI/testing/sysfs-platform-renesas_usb3        |   10 +-
 Documentation/ABI/testing/sysfs-platform-sst-atom  |   13 +-
 .../ABI/testing/sysfs-platform-usbip-vudc          |   11 +-
 Documentation/ABI/testing/sysfs-platform-wilco-ec  |    1 +
 Documentation/ABI/testing/sysfs-power              |   21 +-
 Documentation/ABI/testing/sysfs-profiling          |    2 +-
 Documentation/ABI/testing/sysfs-ptp                |    2 +-
 Documentation/ABI/testing/sysfs-uevent             |   28 +-
 Documentation/ABI/testing/sysfs-wusb_cbaf          |    3 +-
 Documentation/ABI/testing/usb-charger-uevent       |   84 +-
 Documentation/ABI/testing/usb-uevent               |   32 +-
 Documentation/Kconfig                              |   10 +
 Documentation/Makefile                             |    9 +
 Documentation/admin-guide/LSM/SafeSetID.rst        |    2 +-
 Documentation/admin-guide/abi-obsolete.rst         |   11 +
 Documentation/admin-guide/abi-removed.rst          |    5 +
 Documentation/admin-guide/abi-stable.rst           |   14 +
 Documentation/admin-guide/abi-testing.rst          |   20 +
 Documentation/admin-guide/abi.rst                  |   11 +
 Documentation/admin-guide/index.rst                |    2 +
 Documentation/admin-guide/pm/cpuidle.rst           |    4 +-
 Documentation/admin-guide/sysctl/net.rst           |    1 +
 Documentation/arm/sunxi.rst                        |   10 +
 Documentation/arm64/memory-tagging-extension.rst   |    4 +-
 Documentation/arm64/silicon-errata.rst             |    2 +
 Documentation/conf.py                              |    5 +-
 Documentation/dev-tools/kasan.rst                  |    2 +
 Documentation/dev-tools/kunit/start.rst            |    2 +-
 Documentation/dev-tools/kunit/usage.rst            |    5 +
 Documentation/devicetree/bindings/arm/actions.yaml |    2 +
 Documentation/devicetree/bindings/arm/altera.yaml  |    3 +
 .../devicetree/bindings/arm/amazon,al.yaml         |    2 +
 Documentation/devicetree/bindings/arm/amlogic.yaml |    3 +
 .../devicetree/bindings/arm/arm,integrator.yaml    |    2 +
 .../devicetree/bindings/arm/arm,realview.yaml      |    2 +
 .../devicetree/bindings/arm/arm,versatile.yaml     |    2 +
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |    2 +
 .../devicetree/bindings/arm/atmel-at91.yaml        |    2 +
 Documentation/devicetree/bindings/arm/axxia.yaml   |    2 +
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |    2 +
 .../devicetree/bindings/arm/bcm/brcm,bcm11351.yaml |    2 +
 .../devicetree/bindings/arm/bcm/brcm,bcm21664.yaml |    2 +
 .../devicetree/bindings/arm/bcm/brcm,bcm23550.yaml |    2 +
 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |    3 +
 .../devicetree/bindings/arm/bcm/brcm,cygnus.yaml   |    2 +
 .../devicetree/bindings/arm/bcm/brcm,hr2.yaml      |    2 +
 .../devicetree/bindings/arm/bcm/brcm,ns2.yaml      |    2 +
 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml      |    2 +
 .../devicetree/bindings/arm/bcm/brcm,stingray.yaml |    2 +
 .../bindings/arm/bcm/brcm,vulcan-soc.yaml          |    2 +
 Documentation/devicetree/bindings/arm/bitmain.yaml |    3 +
 Documentation/devicetree/bindings/arm/calxeda.yaml |    2 +
 .../devicetree/bindings/arm/digicolor.yaml         |    2 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |    2 +
 .../bindings/arm/hisilicon/hisilicon.yaml          |    3 +
 .../devicetree/bindings/arm/intel,keembay.yaml     |    3 +
 .../devicetree/bindings/arm/intel-ixp4xx.yaml      |    2 +
 .../bindings/arm/keystone/ti,k3-sci-common.yaml    |    2 +
 .../bindings/arm/marvell/armada-7k-8k.yaml         |    2 +
 .../devicetree/bindings/arm/mediatek.yaml          |    3 +
 .../devicetree/bindings/arm/microchip,sparx5.yaml  |    2 +
 Documentation/devicetree/bindings/arm/moxart.yaml  |    1 +
 .../devicetree/bindings/arm/mrvl/mrvl.yaml         |    3 +
 .../devicetree/bindings/arm/mstar/mstar.yaml       |    2 +
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       |    2 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 Documentation/devicetree/bindings/arm/rda.yaml     |    2 +
 Documentation/devicetree/bindings/arm/realtek.yaml |    3 +
 Documentation/devicetree/bindings/arm/renesas.yaml |    2 +
 .../devicetree/bindings/arm/rockchip.yaml          |    3 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    2 +
 Documentation/devicetree/bindings/arm/sirf.yaml    |    3 +
 .../bindings/arm/socionext/milbeaut.yaml           |    3 +
 .../bindings/arm/socionext/uniphier.yaml           |    2 +
 Documentation/devicetree/bindings/arm/spear.yaml   |    3 +
 .../devicetree/bindings/arm/sprd/sprd.yaml         |    2 +
 Documentation/devicetree/bindings/arm/sti.yaml     |    3 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   11 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |    2 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |    2 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    3 +
 .../devicetree/bindings/arm/ti/nspire.yaml         |    3 +
 .../devicetree/bindings/arm/ti/ti,davinci.yaml     |    3 +
 Documentation/devicetree/bindings/arm/toshiba.yaml |    3 +
 Documentation/devicetree/bindings/arm/ux500.yaml   |    2 +
 Documentation/devicetree/bindings/arm/vt8500.yaml  |    3 +
 Documentation/devicetree/bindings/arm/xilinx.yaml  |    2 +
 Documentation/devicetree/bindings/arm/zte.yaml     |    2 +
 .../devicetree/bindings/clock/hi6220-clock.txt     |    2 +-
 .../bindings/display/bridge/toshiba,tc358775.yaml  |   38 +-
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    5 +-
 .../display/panel/mantix,mlaf057we51-x.yaml        |    4 +
 .../bindings/edac/amazon,al-mc-edac.yaml           |    1 +
 Documentation/devicetree/bindings/eeprom/at25.yaml |    6 +-
 .../bindings/gpio/kontron,sl28cpld-gpio.yaml       |    4 +-
 .../bindings/i2c/google,cros-ec-i2c-tunnel.yaml    |   66 +
 .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |   39 -
 .../devicetree/bindings/i2c/ingenic,i2c.yaml       |    8 +-
 .../devicetree/bindings/iio/adc/adi,ad7291.yaml    |    3 +-
 .../devicetree/bindings/iio/adc/adi,ad7768-1.yaml  |    3 +-
 .../bindings/iio/adc/cosmic,10001-adc.yaml         |    4 +-
 .../devicetree/bindings/iio/adc/holt,hi8435.yaml   |    2 +-
 .../devicetree/bindings/iio/adc/lltc,ltc2497.yaml  |    2 +
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml       |    7 +-
 .../bindings/iio/humidity/ti,hdc2010.yaml          |    2 +
 .../devicetree/bindings/input/cros-ec-keyb.txt     |   72 -
 .../bindings/input/google,cros-ec-keyb.yaml        |   92 +
 .../interrupt-controller/ti,pruss-intc.yaml        |   12 +-
 .../bindings/interrupt-controller/ti,sci-inta.yaml |   12 +
 .../bindings/interrupt-controller/ti,sci-intr.yaml |    2 +
 .../devicetree/bindings/leds/backlight/common.yaml |    2 +
 Documentation/devicetree/bindings/leds/common.yaml |    2 +-
 .../bindings/leds/leds-class-multicolor.yaml       |    9 +-
 .../devicetree/bindings/leds/leds-lp50xx.yaml      |    8 +
 .../devicetree/bindings/mailbox/mtk-gce.txt        |    2 +-
 .../devicetree/bindings/mfd/ene-kb3930.yaml        |    2 +-
 .../devicetree/bindings/mfd/google,cros-ec.yaml    |   56 +
 .../devicetree/bindings/mips/ingenic/devices.yaml  |    3 +
 .../devicetree/bindings/mips/loongson/devices.yaml |    3 +
 .../devicetree/bindings/mmc/arasan,sdhci.yaml      |    8 +-
 .../bindings/mmc/microchip,dw-sparx5-sdhci.yaml    |    2 +
 .../devicetree/bindings/mmc/sdhci-am654.yaml       |   17 +-
 .../bindings/net/can/can-controller.yaml           |   18 +
 .../devicetree/bindings/net/can/fsl,flexcan.yaml   |  135 +
 .../devicetree/bindings/net/can/fsl-flexcan.txt    |   57 -
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |    2 +
 .../devicetree/bindings/net/ti,dp83822.yaml        |    2 +
 .../bindings/pci/socionext,uniphier-pcie-ep.yaml   |   18 +-
 .../bindings/phy/socionext,uniphier-ahci-phy.yaml  |    6 +-
 .../devicetree/bindings/phy/ti,omap-usb2.yaml      |   22 +-
 .../bindings/pinctrl/actions,s500-pinctrl.yaml     |  102 +-
 .../bindings/pinctrl/pinctrl-mt8192.yaml           |    2 +-
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml     |    6 +-
 .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml |   24 +-
 .../bindings/power/reset/reboot-mode.yaml          |    8 +-
 .../bindings/power/supply/ingenic,battery.yaml     |    8 +-
 .../power/supply/summit,smb347-charger.yaml        |   16 +-
 .../devicetree/bindings/regulator/mps,mp886x.yaml  |    2 +
 .../devicetree/bindings/regulator/pfuze100.yaml    |    2 +
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml |    4 +-
 .../devicetree/bindings/riscv/sifive.yaml          |    3 +
 Documentation/devicetree/bindings/rng/imx-rng.yaml |    6 +-
 .../devicetree/bindings/serial/fsl-imx-uart.yaml   |   34 +-
 .../devicetree/bindings/sound/adi,adau1372.yaml    |   67 +
 .../devicetree/bindings/sound/adi,adau1977.txt     |   61 -
 .../devicetree/bindings/sound/adi,adau1977.yaml    |   92 +
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |    6 +-
 .../devicetree/bindings/sound/audio-graph-card.txt |  337 ---
 .../bindings/sound/audio-graph-card.yaml           |   57 +
 .../bindings/sound/audio-graph-port.yaml           |   84 +
 .../devicetree/bindings/sound/audio-graph.yaml     |   45 +
 .../devicetree/bindings/sound/fsl,aud2htx.yaml     |   66 +
 .../devicetree/bindings/sound/fsl,spdif.yaml       |    1 +
 .../devicetree/bindings/sound/fsl,xcvr.yaml        |  104 +
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |    2 +
 .../bindings/sound/google,cros-ec-codec.yaml       |   26 +-
 .../bindings/sound/google,sc7180-trogdor.yaml      |  138 +
 .../devicetree/bindings/sound/imx-audio-hdmi.yaml  |   52 +
 .../bindings/sound/marvell,mmp-sspa.yaml           |   25 +-
 .../devicetree/bindings/sound/mchp,spdifrx.yaml    |    4 +-
 .../devicetree/bindings/sound/mchp,spdiftx.yaml    |    4 +-
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |   44 +
 .../devicetree/bindings/sound/nau8315.txt          |   18 +
 .../bindings/sound/nvidia,tegra30-hda.txt          |   35 -
 .../bindings/sound/nvidia,tegra30-hda.yaml         |  112 +
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |   40 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   67 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |   69 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  159 +
 .../devicetree/bindings/sound/realtek,rt1015p.yaml |    2 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |  520 ----
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |  447 +++
 Documentation/devicetree/bindings/sound/rt5682.txt |    2 +
 .../bindings/sound/simple-audio-mux.yaml           |   41 +
 .../devicetree/bindings/sound/simple-card.yaml     |    6 +-
 .../devicetree/bindings/sound/st,stm32-adfsdm.txt  |   63 -
 .../devicetree/bindings/sound/st,stm32-sai.txt     |  107 -
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |  200 ++
 .../sram/allwinner,sun4i-a10-system-control.yaml   |    3 +
 .../devicetree/bindings/timer/arm,sp804.yaml       |   12 +-
 .../devicetree/bindings/usb/cdns,usb3.yaml         |    4 +-
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      |    2 +-
 .../devicetree/bindings/w1/fsl-imx-owire.yaml      |    8 +-
 Documentation/driver-api/auxiliary_bus.rst         |  234 ++
 Documentation/driver-api/index.rst                 |    1 +
 Documentation/filesystems/api-summary.rst          |    3 -
 Documentation/filesystems/debugfs.rst              |    2 +-
 Documentation/gpu/amdgpu.rst                       |    7 -
 Documentation/hwmon/adm1266.rst                    |    2 +-
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/mp2975.rst                     |   14 +-
 Documentation/leds/index.rst                       |    2 +
 Documentation/leds/leds-el15203000.rst             |  140 +
 Documentation/leds/leds-sc27xx.rst                 |   27 +
 Documentation/locking/lockdep-design.rst           |   51 +-
 Documentation/misc-devices/index.rst               |    1 -
 Documentation/misc-devices/mic/index.rst           |   16 -
 Documentation/misc-devices/mic/mic_overview.rst    |   85 -
 Documentation/misc-devices/mic/scif_overview.rst   |  108 -
 Documentation/networking/devlink/ice.rst           |    1 +
 Documentation/networking/j1939.rst                 |  120 +-
 Documentation/networking/statistics.rst            |    3 +-
 Documentation/sphinx/automarkup.py                 |   20 +-
 Documentation/sphinx/kernel_abi.py                 |  194 ++
 Documentation/sphinx/kernellog.py                  |    6 +-
 Documentation/userspace-api/index.rst              |    1 +
 Documentation/virt/kvm/cpuid.rst                   |    4 +
 MAINTAINERS                                        |   48 +-
 Makefile                                           |    2 +-
 arch/arc/kernel/head.S                             |   17 +-
 arch/arc/kernel/stacktrace.c                       |    7 +-
 arch/arc/plat-hsdk/platform.c                      |   17 -
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts            |    4 +-
 arch/arm/boot/dts/mmp3.dtsi                        |    2 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |   15 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   17 +
 arch/arm/boot/dts/sun4i-a10.dtsi                   |    2 +-
 arch/arm/configs/imx_v4_v5_defconfig               |    1 +
 arch/arm/configs/imx_v6_v7_defconfig               |    1 +
 arch/arm/configs/multi_v5_defconfig                |    1 +
 arch/arm/configs/multi_v7_defconfig                |    1 +
 arch/arm/kernel/vmlinux.lds.S                      |    4 +
 arch/arm/mach-mvebu/coherency_ll.S                 |    7 +-
 arch/arm/mm/init.c                                 |    4 +-
 arch/arm64/Kconfig                                 |   22 +-
 arch/arm64/Kconfig.platforms                       |    1 +
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |    6 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   52 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    6 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |    3 +
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |   10 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |   10 +-
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   12 +-
 arch/arm64/configs/defconfig                       |    1 +
 arch/arm64/include/asm/brk-imm.h                   |    2 +
 arch/arm64/include/asm/cache.h                     |    1 +
 arch/arm64/include/asm/cpucaps.h                   |    3 +-
 arch/arm64/include/asm/cpufeature.h                |   40 +-
 arch/arm64/include/asm/cputype.h                   |    2 +
 arch/arm64/include/asm/debug-monitors.h            |    1 +
 arch/arm64/include/asm/kprobes.h                   |    2 +-
 arch/arm64/include/asm/kvm_host.h                  |    1 +
 arch/arm64/include/asm/sysreg.h                    |    9 +
 arch/arm64/include/asm/virt.h                      |    9 +-
 arch/arm64/kernel/cpu_errata.c                     |   10 +
 arch/arm64/kernel/cpuinfo.c                        |    7 +-
 arch/arm64/kernel/efi-header.S                     |    2 +-
 arch/arm64/kernel/entry.S                          |    3 +
 arch/arm64/kernel/image-vars.h                     |    1 -
 arch/arm64/kernel/kexec_image.c                    |   41 +-
 arch/arm64/kernel/machine_kexec_file.c             |    9 +-
 arch/arm64/kernel/probes/kprobes.c                 |   69 +-
 arch/arm64/kernel/proton-pack.c                    |    2 -
 arch/arm64/kernel/smp.c                            |    1 +
 arch/arm64/kernel/vdso32/Makefile                  |   23 +-
 arch/arm64/kernel/vmlinux.lds.S                    |    2 +-
 arch/arm64/kvm/arm.c                               |   22 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   21 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h         |    2 +-
 arch/arm64/kvm/hyp/nvhe/host.S                     |    2 -
 arch/arm64/kvm/hyp/nvhe/hyp-init.S                 |   23 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |    2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c                      |    1 -
 arch/arm64/kvm/hyp/pgtable.c                       |    4 +-
 arch/arm64/kvm/hyp/vhe/switch.c                    |    2 +-
 arch/arm64/kvm/hypercalls.c                        |    2 +-
 arch/arm64/kvm/mmu.c                               |   27 +-
 arch/arm64/kvm/sys_regs.c                          |    8 +-
 arch/arm64/lib/memcpy.S                            |    3 +-
 arch/arm64/lib/memmove.S                           |    3 +-
 arch/arm64/lib/memset.S                            |    3 +-
 arch/arm64/mm/fault.c                              |    2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h       |    2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h       |   47 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h       |    9 +-
 arch/powerpc/include/asm/topology.h                |   12 +-
 arch/powerpc/include/asm/uaccess.h                 |    4 +-
 arch/powerpc/kernel/eeh_cache.c                    |    5 +-
 arch/powerpc/kernel/head_40x.S                     |    8 -
 arch/powerpc/kernel/head_8xx.S                     |   46 +-
 arch/powerpc/kernel/head_book3s_32.S               |   12 -
 arch/powerpc/kernel/smp.c                          |    3 +-
 arch/riscv/include/asm/uaccess.h                   |    2 +-
 arch/riscv/kernel/ftrace.c                         |    2 +-
 arch/riscv/kernel/head.S                           |    5 +
 arch/riscv/kernel/vdso/.gitignore                  |    1 +
 arch/riscv/kernel/vdso/Makefile                    |   18 +-
 arch/riscv/kernel/vdso/so2s.sh                     |    6 +
 arch/riscv/mm/fault.c                              |    4 +-
 arch/riscv/mm/init.c                               |   32 +-
 arch/s390/configs/debug_defconfig                  |   10 +-
 arch/s390/configs/defconfig                        |    9 +-
 arch/s390/configs/zfcpdump_defconfig               |    2 +-
 arch/s390/include/asm/pgtable.h                    |   52 +-
 arch/s390/include/asm/sections.h                   |    4 +-
 arch/s390/include/asm/vdso/vdso.h                  |    0
 arch/s390/kernel/asm-offsets.c                     |    8 -
 arch/s390/kernel/smp.c                             |    3 +-
 arch/s390/pci/pci_event.c                          |    4 +
 arch/um/kernel/skas/clone.c                        |    2 +-
 arch/x86/boot/compressed/ident_map_64.c            |    1 +
 arch/x86/boot/compressed/mem_encrypt.S             |   20 +-
 arch/x86/boot/compressed/misc.h                    |    2 +
 arch/x86/crypto/poly1305_glue.c                    |    1 +
 arch/x86/entry/syscalls/syscall_64.tbl             |   10 +-
 arch/x86/hyperv/hv_apic.c                          |   14 +-
 arch/x86/include/uapi/asm/kvm_para.h               |    1 +
 arch/x86/kernel/alternative.c                      |    9 +
 arch/x86/kernel/apic/x2apic_uv_x.c                 |   23 +-
 arch/x86/kernel/cpu/bugs.c                         |   51 +-
 arch/x86/kernel/head_64.S                          |   16 +
 arch/x86/kernel/kexec-bzimage64.c                  |    3 +-
 arch/x86/kernel/sev-es-shared.c                    |   26 +
 arch/x86/kernel/sev-es.c                           |   20 +-
 arch/x86/kernel/sev_verify_cbit.S                  |   89 +
 arch/x86/kernel/traps.c                            |   43 +-
 arch/x86/kernel/unwind_orc.c                       |    9 +-
 arch/x86/kvm/mmu/mmu.c                             |   10 +-
 arch/x86/kvm/mmu/spte.c                            |   16 +-
 arch/x86/kvm/mmu/spte.h                            |   16 +-
 arch/x86/kvm/vmx/evmcs.c                           |    3 +-
 arch/x86/kvm/vmx/evmcs.h                           |    3 +-
 arch/x86/kvm/vmx/vmx.c                             |    6 +-
 arch/x86/kvm/x86.c                                 |    8 +-
 arch/x86/lib/memcpy_64.S                           |    4 +-
 arch/x86/lib/memmove_64.S                          |    4 +-
 arch/x86/lib/memset_64.S                           |    4 +-
 arch/x86/mm/mem_encrypt.c                          |    1 +
 arch/x86/um/stub_segv.c                            |    2 +-
 arch/xtensa/mm/init.c                              |    4 +-
 block/bio.c                                        |   11 +-
 block/blk-cgroup.c                                 |   15 +-
 block/blk-flush.c                                  |    1 +
 drivers/acpi/button.c                              |   13 -
 drivers/acpi/dock.c                                |    3 +-
 drivers/acpi/nfit/core.c                           |    2 +-
 drivers/ata/sata_nv.c                              |    2 +-
 drivers/base/Kconfig                               |    3 +
 drivers/base/Makefile                              |    1 +
 drivers/base/auxiliary.c                           |  274 ++
 drivers/base/core.c                                |   10 +-
 drivers/base/dd.c                                  |    9 +-
 drivers/base/power/runtime.c                       |   57 +-
 drivers/base/regmap/Kconfig                        |    6 +-
 drivers/base/regmap/Makefile                       |    1 +
 drivers/base/regmap/regmap-sdw-mbq.c               |  101 +
 drivers/block/nbd.c                                |    9 +-
 drivers/block/null_blk.h                           |    2 +
 drivers/block/null_blk_zoned.c                     |  138 +-
 drivers/block/xsysace.c                            |   49 +-
 drivers/bluetooth/btintel.h                        |    2 +-
 drivers/char/tpm/eventlog/efi.c                    |    5 +
 drivers/char/tpm/tpm_tis.c                         |   29 +-
 drivers/cpufreq/Kconfig                            |    2 +
 drivers/cpufreq/cpufreq.c                          |   15 +-
 drivers/cpufreq/e_powersaver.c                     |    1 -
 drivers/cpufreq/intel_pstate.c                     |   13 +-
 drivers/cpufreq/longhaul.c                         |    1 -
 drivers/cpufreq/speedstep-lib.c                    |    2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c  |    2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c  |    2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c  |    2 +-
 drivers/dma/Kconfig                                |   18 -
 drivers/dma/Makefile                               |    1 -
 drivers/dma/mic_x100_dma.c                         |  770 -----
 drivers/dma/mic_x100_dma.h                         |  275 --
 drivers/firmware/arm_scmi/base.c                   |    2 +
 drivers/firmware/arm_scmi/clock.c                  |    2 +
 drivers/firmware/arm_scmi/common.h                 |    2 +
 drivers/firmware/arm_scmi/driver.c                 |    8 +
 drivers/firmware/arm_scmi/notify.c                 |   22 +-
 drivers/firmware/arm_scmi/perf.c                   |    2 +
 drivers/firmware/arm_scmi/reset.c                  |    4 +-
 drivers/firmware/arm_scmi/sensors.c                |    2 +
 drivers/firmware/arm_scmi/smc.c                    |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    7 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   27 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    2 +-
 drivers/gpu/drm/amd/display/Kconfig                |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    6 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    5 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    2 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   12 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |   12 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |   33 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |    4 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |    1 +
 drivers/gpu/drm/amd/pm/inc/smumgr.h                |    2 +
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ci_baco.c   |    7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   34 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |   29 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smumgr.c   |    8 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   11 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   36 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   11 +-
 drivers/gpu/drm/drm_dp_helper.c                    |   12 +-
 drivers/gpu/drm/drm_edid.c                         |    2 +-
 drivers/gpu/drm/drm_gem.c                          |    4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    7 +-
 drivers/gpu/drm/drm_prime.c                        |    1 +
 drivers/gpu/drm/i915/display/intel_display.c       |    4 +
 drivers/gpu/drm/i915/display/intel_psr.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   28 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   55 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   31 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   18 +-
 drivers/gpu/drm/i915/gt/intel_timeline_types.h     |    2 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   47 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   15 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    1 +
 drivers/gpu/drm/i915/i915_vma.c                    |    6 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |    2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   77 +
 drivers/gpu/drm/i915/selftests/mock_region.c       |    2 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |   17 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |   10 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |   10 +-
 drivers/gpu/drm/imx/imx-tve.c                      |   40 +-
 drivers/gpu/drm/imx/parallel-display.c             |   20 +-
 drivers/gpu/drm/nouveau/dispnv50/core.h            |    2 +
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |   41 +-
 drivers/gpu/drm/nouveau/dispnv50/core907d.c        |   36 +-
 drivers/gpu/drm/nouveau/dispnv50/core917d.c        |    2 +-
 .../gpu/drm/nouveau/include/nvhw/class/cl507d.h    |    5 +-
 .../gpu/drm/nouveau/include/nvhw/class/cl907d.h    |    4 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   36 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   31 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |   14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   39 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   25 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    5 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    4 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |   14 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |   36 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.h             |    6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_bo.c                       |    9 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   40 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   21 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   19 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    6 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   80 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   12 +-
 drivers/gpu/ipu-v3/ipu-common.c                    |   67 -
 drivers/hv/hv_balloon.c                            |    2 +-
 drivers/hwtracing/coresight/coresight-core.c       |    1 +
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |    7 +
 drivers/hwtracing/coresight/coresight-etm-perf.c   |    2 +-
 drivers/i2c/busses/Kconfig                         |    2 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   52 +-
 drivers/i2c/busses/i2c-mlxbf.c                     |  204 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |    8 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   86 +-
 drivers/idle/intel_idle.c                          |    2 +-
 drivers/infiniband/core/cma.c                      |   48 +-
 drivers/infiniband/core/uverbs_std_types_device.c  |    3 -
 drivers/infiniband/hw/mlx5/main.c                  |    6 +-
 drivers/infiniband/hw/qedr/qedr_iw_cm.c            |    1 +
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h    |    2 +-
 drivers/infiniband/sw/rdmavt/vt.c                  |    7 +-
 drivers/infiniband/sw/rxe/rxe_av.c                 |   35 +-
 drivers/infiniband/sw/rxe/rxe_net.c                |    2 +-
 drivers/infiniband/sw/rxe/rxe_verbs.c              |    6 +-
 drivers/infiniband/sw/siw/siw_main.c               |    7 +-
 drivers/infiniband/ulp/iser/iser_verbs.c           |    2 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c             |    4 +-
 drivers/infiniband/ulp/srpt/ib_srpt.c              |   13 +-
 drivers/infiniband/ulp/srpt/ib_srpt.h              |    1 +
 drivers/interconnect/core.c                        |    3 +
 drivers/interconnect/qcom/icc-rpmh.c               |    7 +
 drivers/interconnect/qcom/sc7180.c                 |    6 +-
 drivers/interconnect/qcom/sdm845.c                 |    8 +-
 drivers/interconnect/qcom/sm8150.c                 |    7 +-
 drivers/interconnect/qcom/sm8250.c                 |    7 +-
 drivers/iommu/amd/amd_iommu_types.h                |    6 +-
 drivers/iommu/intel/iommu.c                        |    3 +
 drivers/iommu/intel/svm.c                          |    8 +-
 drivers/iommu/iommu.c                              |    2 +-
 drivers/irqchip/Kconfig                            |    3 +-
 drivers/irqchip/irq-bcm2836.c                      |    2 +-
 drivers/irqchip/irq-mst-intc.c                     |    4 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c          |    8 +-
 drivers/irqchip/irq-sifive-plic.c                  |   10 +-
 drivers/irqchip/irq-stm32-exti.c                   |    4 +
 drivers/irqchip/irq-ti-sci-inta.c                  |   83 +-
 drivers/message/fusion/mptscsih.c                  |   13 +-
 drivers/misc/Kconfig                               |    1 -
 drivers/misc/Makefile                              |    1 -
 drivers/misc/mei/hw.h                              |    6 +-
 drivers/misc/mic/Kconfig                           |  141 -
 drivers/misc/mic/Makefile                          |   12 -
 drivers/misc/mic/bus/Makefile                      |    9 -
 drivers/misc/mic/bus/cosm_bus.c                    |  130 -
 drivers/misc/mic/bus/cosm_bus.h                    |  125 -
 drivers/misc/mic/bus/mic_bus.c                     |  194 --
 drivers/misc/mic/bus/scif_bus.c                    |  201 --
 drivers/misc/mic/bus/scif_bus.h                    |  125 -
 drivers/misc/mic/bus/vop_bus.c                     |  194 --
 drivers/misc/mic/bus/vop_bus.h                     |  129 -
 drivers/misc/mic/card/Makefile                     |   11 -
 drivers/misc/mic/card/mic_debugfs.c                |   85 -
 drivers/misc/mic/card/mic_device.c                 |  417 ---
 drivers/misc/mic/card/mic_device.h                 |  137 -
 drivers/misc/mic/card/mic_x100.c                   |  347 ---
 drivers/misc/mic/card/mic_x100.h                   |   37 -
 drivers/misc/mic/common/mic_dev.h                  |   55 -
 drivers/misc/mic/cosm/Makefile                     |   11 -
 drivers/misc/mic/cosm/cosm_debugfs.c               |  116 -
 drivers/misc/mic/cosm/cosm_main.c                  |  382 ---
 drivers/misc/mic/cosm/cosm_main.h                  |   61 -
 drivers/misc/mic/cosm/cosm_scif_server.c           |  399 ---
 drivers/misc/mic/cosm/cosm_sysfs.c                 |  449 ---
 drivers/misc/mic/cosm_client/Makefile              |    8 -
 drivers/misc/mic/cosm_client/cosm_scif_client.c    |  269 --
 drivers/misc/mic/host/Makefile                     |   12 -
 drivers/misc/mic/host/mic_boot.c                   |  588 ----
 drivers/misc/mic/host/mic_debugfs.c                |  149 -
 drivers/misc/mic/host/mic_device.h                 |  157 -
 drivers/misc/mic/host/mic_intr.c                   |  635 ----
 drivers/misc/mic/host/mic_intr.h                   |  137 -
 drivers/misc/mic/host/mic_main.c                   |  335 ---
 drivers/misc/mic/host/mic_smpt.c                   |  427 ---
 drivers/misc/mic/host/mic_smpt.h                   |   87 -
 drivers/misc/mic/host/mic_x100.c                   |  585 ----
 drivers/misc/mic/host/mic_x100.h                   |   77 -
 drivers/misc/mic/scif/Makefile                     |   21 -
 drivers/misc/mic/scif/scif_api.c                   | 1485 ----------
 drivers/misc/mic/scif/scif_debugfs.c               |  116 -
 drivers/misc/mic/scif/scif_dma.c                   | 1940 ------------
 drivers/misc/mic/scif/scif_epd.c                   |  357 ---
 drivers/misc/mic/scif/scif_epd.h                   |  200 --
 drivers/misc/mic/scif/scif_fd.c                    |  462 ---
 drivers/misc/mic/scif/scif_fence.c                 |  783 -----
 drivers/misc/mic/scif/scif_main.c                  |  351 ---
 drivers/misc/mic/scif/scif_main.h                  |  274 --
 drivers/misc/mic/scif/scif_map.h                   |  127 -
 drivers/misc/mic/scif/scif_mmap.c                  |  690 -----
 drivers/misc/mic/scif/scif_nm.c                    |  229 --
 drivers/misc/mic/scif/scif_nodeqp.c                | 1349 ---------
 drivers/misc/mic/scif/scif_nodeqp.h                |  221 --
 drivers/misc/mic/scif/scif_peer_bus.c              |  175 --
 drivers/misc/mic/scif/scif_peer_bus.h              |   23 -
 drivers/misc/mic/scif/scif_ports.c                 |  116 -
 drivers/misc/mic/scif/scif_rb.c                    |  240 --
 drivers/misc/mic/scif/scif_rb.h                    |  100 -
 drivers/misc/mic/scif/scif_rma.c                   | 1760 -----------
 drivers/misc/mic/scif/scif_rma.h                   |  477 ---
 drivers/misc/mic/scif/scif_rma_list.c              |  282 --
 drivers/misc/mic/scif/scif_rma_list.h              |   48 -
 drivers/misc/mic/vop/Makefile                      |   10 -
 drivers/misc/mic/vop/vop_debugfs.c                 |  184 --
 drivers/misc/mic/vop/vop_main.c                    |  784 -----
 drivers/misc/mic/vop/vop_main.h                    |  158 -
 drivers/misc/mic/vop/vop_vringh.c                  | 1166 --------
 drivers/mmc/host/sdhci-esdhc.h                     |    2 +
 drivers/mmc/host/sdhci-of-esdhc.c                  |   28 +
 drivers/mmc/host/sdhci.c                           |    6 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |   43 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |   17 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |   15 +-
 drivers/mtd/spi-nor/core.c                         |   13 +-
 drivers/net/can/dev.c                              |   14 +-
 drivers/net/can/flexcan.c                          |   12 +-
 drivers/net/can/peak_canfd/peak_canfd.c            |   11 +-
 drivers/net/can/rx-offload.c                       |    4 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c     |   22 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c   |   18 +-
 drivers/net/can/ti_hecc.c                          |    8 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c       |   51 +-
 drivers/net/can/usb/peak_usb/pcan_usb_fd.c         |   48 +-
 drivers/net/can/xilinx_can.c                       |    6 +-
 drivers/net/dsa/qca8k.c                            |    4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   49 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h          |    1 +
 drivers/net/ethernet/cadence/macb_main.c           |    3 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c  |   56 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_tcb.h        |    4 +
 .../chelsio/inline_crypto/chtls/chtls_cm.c         |   31 +-
 .../chelsio/inline_crypto/chtls/chtls_hw.c         |    3 +
 .../chelsio/inline_crypto/chtls/chtls_io.c         |    7 +-
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c     |   28 +-
 drivers/net/ethernet/freescale/enetc/enetc_qos.c   |    2 +-
 drivers/net/ethernet/freescale/fec.h               |    6 +
 drivers/net/ethernet/freescale/fec_main.c          |   29 +-
 drivers/net/ethernet/freescale/gianfar.c           |   14 +-
 drivers/net/ethernet/freescale/ucc_geth.c          |    2 +-
 drivers/net/ethernet/google/gve/gve_adminq.h       |    2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |    5 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |    2 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |    2 +-
 drivers/net/ethernet/ibm/ibmveth.c                 |    6 -
 drivers/net/ethernet/ibm/ibmvnic.c                 |   44 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/mlx5.h |    5 -
 drivers/net/ethernet/mellanox/mlxsw/core.c         |    5 +
 drivers/net/ethernet/mellanox/mlxsw/spectrum.c     |    9 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum.h     |    1 +
 .../net/ethernet/mellanox/mlxsw/spectrum_ethtool.c |   30 +
 drivers/net/ethernet/pensando/ionic/ionic_dev.c    |    4 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.h    |    2 +
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    |    5 +
 drivers/net/ethernet/pensando/ionic/ionic_fw.c     |    6 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |   29 +-
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |    4 +-
 drivers/net/ethernet/pensando/ionic/ionic_stats.h  |    2 +-
 drivers/net/ethernet/pensando/ionic/ionic_txrx.c   |   47 +-
 drivers/net/ethernet/pensando/ionic/ionic_txrx.h   |    1 -
 drivers/net/ethernet/realtek/r8169_main.c          |   18 +-
 drivers/net/ethernet/renesas/ravb_main.c           |   10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   14 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |    1 +
 drivers/net/ethernet/ti/cpsw_ethtool.c             |    1 -
 drivers/net/ethernet/ti/cpsw_priv.c                |    5 +-
 drivers/net/gtp.c                                  |   16 +-
 drivers/net/ipa/gsi_trans.c                        |   21 +-
 drivers/net/phy/sfp.c                              |    3 +-
 drivers/net/usb/qmi_wwan.c                         |    1 +
 drivers/nvme/host/core.c                           |   10 +-
 drivers/nvme/host/fc.c                             |  270 +-
 drivers/nvme/host/nvme.h                           |    1 +
 drivers/nvme/host/pci.c                            |   23 +-
 drivers/nvme/host/rdma.c                           |   26 +-
 drivers/nvme/host/tcp.c                            |   16 +-
 drivers/nvme/target/core.c                         |    4 +-
 drivers/nvme/target/trace.h                        |   21 +-
 drivers/of/device.c                                |    6 +-
 drivers/of/of_reserved_mem.c                       |   13 +-
 drivers/opp/core.c                                 |    9 +-
 drivers/opp/of.c                                   |    2 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |    8 +-
 drivers/pci/controller/pci-mvebu.c                 |   23 +-
 drivers/pci/pci.c                                  |    9 +-
 drivers/pnp/core.c                                 |    4 +-
 drivers/powercap/intel_rapl_common.c               |    2 +-
 drivers/regulator/core.c                           |    2 +
 drivers/s390/crypto/ap_bus.c                       |   14 +-
 drivers/s390/crypto/pkey_api.c                     |   30 +-
 drivers/s390/crypto/zcrypt_card.c                  |   13 +-
 drivers/s390/crypto/zcrypt_queue.c                 |    6 +-
 drivers/s390/net/ism_drv.c                         |    2 +-
 drivers/scsi/device_handler/scsi_dh_alua.c         |    9 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c              |    2 +-
 drivers/scsi/hpsa.c                                |    4 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |   36 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c                |    7 +
 drivers/scsi/qla2xxx/qla_nvme.c                    |    6 +-
 drivers/scsi/qla2xxx/qla_tmpl.c                    |    4 -
 drivers/scsi/scsi_scan.c                           |    7 +-
 drivers/soc/ti/ti_sci_pm_domains.c                 |    2 +-
 drivers/soundwire/bus.c                            |   28 +-
 drivers/soundwire/sysfs_slave_dpn.c                |    1 +
 drivers/spi/spi-bcm2835.c                          |   15 +-
 drivers/spi/spi-fsl-dspi.c                         |   10 +-
 drivers/spi/spi-imx.c                              |   23 +-
 drivers/staging/comedi/drivers/cb_pcidas.c         |    1 +
 drivers/staging/fieldbus/anybuss/arcx-anybus.c     |    2 +-
 drivers/staging/octeon/ethernet-mdio.c             |    6 -
 drivers/staging/octeon/ethernet-rx.c               |   34 +-
 drivers/staging/octeon/ethernet.c                  |    9 +
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.c  |   19 +-
 .../bindings/net/wireless/silabs,wfx.yaml          |    2 +-
 drivers/staging/wfx/bh.c                           |    2 +-
 drivers/staging/wfx/data_tx.c                      |    6 +-
 drivers/target/target_core_user.c                  |    2 +-
 drivers/tee/tee_core.c                             |    3 +-
 drivers/tty/serial/21285.c                         |   12 +-
 drivers/tty/serial/8250/8250_mtk.c                 |    2 +-
 drivers/tty/serial/Kconfig                         |    1 +
 drivers/tty/serial/fsl_lpuart.c                    |   13 +-
 drivers/tty/serial/serial_txx9.c                   |    3 +
 drivers/tty/tty_io.c                               |    6 +-
 drivers/tty/vt/keyboard.c                          |   39 +-
 drivers/tty/vt/vt.c                                |   24 +-
 drivers/tty/vt/vt_ioctl.c                          |   47 +-
 drivers/usb/cdns3/ep0.c                            |   65 +-
 drivers/usb/cdns3/gadget.c                         |  115 +-
 drivers/usb/cdns3/gadget.h                         |    5 +-
 drivers/usb/class/cdc-acm.c                        |   12 +-
 drivers/usb/class/cdc-acm.h                        |    3 +-
 drivers/usb/core/driver.c                          |   30 +-
 drivers/usb/core/generic.c                         |    4 +-
 drivers/usb/core/quirks.c                          |    3 +
 drivers/usb/core/usb.h                             |    2 +
 drivers/usb/dwc2/platform.c                        |    3 +
 drivers/usb/dwc3/core.c                            |    2 +-
 drivers/usb/dwc3/core.h                            |    2 +-
 drivers/usb/dwc3/dwc3-pci.c                        |    4 +
 drivers/usb/dwc3/ep0.c                             |    3 +-
 drivers/usb/gadget/composite.c                     |    2 +-
 drivers/usb/gadget/legacy/raw_gadget.c             |    5 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |    2 +-
 drivers/usb/gadget/udc/goku_udc.c                  |    2 +-
 drivers/usb/host/ehci-tegra.c                      |    4 +-
 drivers/usb/host/fsl-mph-dr-of.c                   |    9 +-
 drivers/usb/host/xhci-mem.c                        |    4 +-
 drivers/usb/host/xhci-pci.c                        |   17 +
 drivers/usb/host/xhci.c                            |    5 +-
 drivers/usb/host/xhci.h                            |    1 +
 drivers/usb/misc/apple-mfi-fastcharge.c            |   21 +-
 drivers/usb/mtu3/mtu3_gadget.c                     |    1 +
 drivers/usb/serial/cyberjack.c                     |    7 +-
 drivers/usb/serial/option.c                        |   10 +
 drivers/usb/typec/mux.c                            |    2 +-
 drivers/usb/typec/stusb160x.c                      |   24 +-
 drivers/usb/typec/tcpm/tcpm.c                      |    6 +-
 drivers/vdpa/mlx5/core/mr.c                        |    5 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c                   |   33 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c                  |   10 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c             |    2 +-
 drivers/vfio/pci/vfio_pci.c                        |    2 +-
 drivers/vfio/pci/vfio_pci_rdwr.c                   |   43 +-
 drivers/vfio/platform/vfio_platform_common.c       |    3 +-
 drivers/vfio/vfio_iommu_type1.c                    |   17 +-
 drivers/vhost/vdpa.c                               |  173 +-
 drivers/video/fbdev/hyperv_fb.c                    |    9 +-
 fs/afs/cell.c                                      |    3 +-
 fs/afs/dir.c                                       |   12 +-
 fs/afs/dir_edit.c                                  |    6 +-
 fs/afs/file.c                                      |   78 +-
 fs/afs/internal.h                                  |   57 +
 fs/afs/write.c                                     |  105 +-
 fs/afs/xattr.c                                     |    9 +-
 fs/afs/yfsclient.c                                 |    1 +
 fs/binfmt_elf.c                                    |    2 +-
 fs/btrfs/backref.c                                 |   13 +-
 fs/btrfs/block-group.c                             |    1 +
 fs/btrfs/ctree.h                                   |    2 +
 fs/btrfs/dev-replace.c                             |    5 +
 fs/btrfs/disk-io.c                                 |  139 +-
 fs/btrfs/disk-io.h                                 |    3 +
 fs/btrfs/extent-tree.c                             |    2 +-
 fs/btrfs/file.c                                    |    3 +-
 fs/btrfs/inode.c                                   |    8 +-
 fs/btrfs/qgroup.c                                  |   18 +
 fs/btrfs/reada.c                                   |   47 +
 fs/btrfs/tree-checker.c                            |   18 +
 fs/btrfs/volumes.c                                 |    5 +-
 fs/btrfs/volumes.h                                 |   12 +-
 fs/cachefiles/rdwr.c                               |    3 +-
 fs/ceph/caps.c                                     |    2 +-
 fs/ceph/mds_client.c                               |   50 +-
 fs/ceph/mds_client.h                               |    1 +
 fs/ceph/quota.c                                    |    2 +-
 fs/ceph/snap.c                                     |    2 +-
 fs/debugfs/file.c                                  |   15 +-
 fs/ext4/dir.c                                      |   64 +-
 fs/ext4/ext4.h                                     |   20 +-
 fs/ext4/extents.c                                  |   30 +-
 fs/ext4/fast_commit.c                              |   37 +-
 fs/ext4/hash.c                                     |    2 +-
 fs/ext4/inode.c                                    |   15 +-
 fs/ext4/namei.c                                    |   20 +-
 fs/ext4/super.c                                    |   16 +-
 fs/ext4/sysfs.c                                    |    2 +
 fs/gfs2/glock.c                                    |    3 +-
 fs/gfs2/glops.c                                    |   56 +-
 fs/gfs2/glops.h                                    |    1 +
 fs/gfs2/inode.c                                    |    3 +-
 fs/gfs2/lops.c                                     |   31 +-
 fs/gfs2/lops.h                                     |    2 -
 fs/gfs2/ops_fstype.c                               |   14 +-
 fs/gfs2/recovery.c                                 |    2 +-
 fs/gfs2/rgrp.c                                     |    5 +-
 fs/gfs2/super.c                                    |    1 +
 fs/hfs/btree.h                                     |    2 +-
 fs/hfsplus/hfsplus_fs.h                            |    2 +-
 fs/io-wq.c                                         |    4 +
 fs/io_uring.c                                      |  291 +-
 fs/iomap/buffered-io.c                             |   30 +-
 fs/isofs/rock.h                                    |    8 +-
 fs/proc/base.c                                     |    2 +
 fs/proc/cpuinfo.c                                  |    2 +-
 fs/proc/generic.c                                  |    4 +-
 fs/proc/inode.c                                    |    2 +
 fs/proc/stat.c                                     |    2 +-
 fs/select.c                                        |    4 +-
 fs/seq_file.c                                      |   45 +-
 fs/xfs/libxfs/xfs_alloc.c                          |    1 +
 fs/xfs/libxfs/xfs_bmap.h                           |    2 +-
 fs/xfs/scrub/inode.c                               |    3 +-
 fs/xfs/xfs_aops.c                                  |   20 +-
 fs/xfs/xfs_iops.c                                  |   10 +
 fs/xfs/xfs_reflink.c                               |    3 +-
 include/asm-generic/uaccess.h                      |    6 +-
 include/asm-generic/vmlinux.lds.h                  |    1 +
 include/drm/drm_dp_helper.h                        |    2 +-
 include/drm/drm_edid.h                             |    7 -
 include/drm/drm_print.h                            |   20 +-
 include/dt-bindings/sound/adi,adau1977.h           |   15 +
 include/kunit/test.h                               |   16 +-
 include/linux/arm-smccc.h                          |    2 +
 include/linux/auxiliary_bus.h                      |   77 +
 include/linux/blk-mq.h                             |    2 +
 include/linux/can/skb.h                            |   20 +-
 include/linux/cpufreq.h                            |   11 +-
 include/linux/debugfs.h                            |   18 +-
 include/linux/dma/ti-cppi5.h                       |    4 +-
 include/linux/fs.h                                 |    2 +-
 include/linux/io_uring.h                           |    3 +-
 include/linux/iomap.h                              |    2 +-
 include/linux/jbd2.h                               |    7 +-
 include/linux/jhash.h                              |    2 +
 include/linux/mailbox/zynqmp-ipi-message.h         |    2 +-
 include/linux/mic_bus.h                            |  100 -
 include/linux/mlx5/driver.h                        |   18 +
 include/linux/mlx5/mlx5_ifc.h                      |    4 +-
 include/linux/mm.h                                 |    9 +
 include/linux/mod_devicetable.h                    |    8 +
 include/linux/module.h                             |    2 +-
 include/linux/netfilter/nfnetlink.h                |    9 +-
 include/linux/netfilter_ipv4.h                     |    2 +-
 include/linux/netfilter_ipv6.h                     |   10 +-
 include/linux/pagemap.h                            |    8 +-
 include/linux/pgtable.h                            |    4 -
 include/linux/phy.h                                |   40 +-
 include/linux/platform_data/adau1977.h             |   44 -
 include/linux/platform_data/cros_ec_commands.h     |   14 +-
 include/linux/platform_data/cros_ec_proto.h        |    2 +-
 include/linux/pm_runtime.h                         |    6 +-
 include/linux/refcount.h                           |  130 +-
 include/linux/regmap.h                             |   35 +
 include/linux/scif.h                               | 1339 ---------
 include/linux/seq_file.h                           |    1 +
 include/linux/signal.h                             |    2 +
 include/linux/soundwire/sdw.h                      |    4 +
 include/linux/soundwire/sdw_registers.h            |   32 +
 include/linux/time64.h                             |    4 +
 include/linux/usb/composite.h                      |    2 +-
 include/linux/vdpa.h                               |   15 +
 include/net/cfg80211.h                             |    9 +-
 include/net/mac80211.h                             |    7 +-
 include/rdma/rdma_cm.h                             |   14 +-
 include/sound/control.h                            |    2 +-
 include/sound/core.h                               |    3 +-
 include/sound/graph_card.h                         |   16 +
 include/sound/intel-dsp-config.h                   |    7 +
 include/sound/pcm.h                                |    4 +-
 include/sound/rt5682.h                             |    1 +
 include/sound/simple_card_utils.h                  |    3 +
 include/sound/soc-acpi-intel-match.h               |    2 +
 include/sound/soc-acpi.h                           |    6 +
 include/sound/soc-component.h                      |   31 +-
 include/sound/soc-dai.h                            |   42 +-
 include/sound/soc-jack.h                           |  132 +
 include/sound/soc-link.h                           |    9 +-
 include/sound/soc-topology.h                       |   13 +-
 include/sound/soc.h                                |  132 +-
 include/sound/sof.h                                |    6 +-
 include/sound/sof/dai.h                            |   16 +-
 include/sound/sof/debug.h                          |   41 +
 include/sound/sof/ext_manifest.h                   |   21 +
 include/sound/sof/header.h                         |   15 +-
 include/sound/sof/trace.h                          |   28 +
 include/trace/events/afs.h                         |   20 +-
 include/trace/events/asoc.h                        |    1 +
 include/uapi/linux/icmpv6.h                        |    1 +
 include/uapi/linux/mic_common.h                    |  235 --
 include/uapi/linux/mic_ioctl.h                     |   77 -
 include/uapi/linux/vhost.h                         |    4 +
 include/uapi/linux/vhost_types.h                   |    9 +
 include/uapi/sound/asoc.h                          |   22 +-
 include/uapi/sound/compress_offload.h              |    2 +-
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/video/imx-ipu-v3.h                         |    3 -
 kernel/entry/common.c                              |    4 +-
 kernel/events/core.c                               |   12 +-
 kernel/fork.c                                      |   10 +-
 kernel/futex.c                                     |   20 +-
 kernel/hung_task.c                                 |    3 +-
 kernel/irq/Kconfig                                 |    1 +
 kernel/kprobes.c                                   |   25 +-
 kernel/kthread.c                                   |    3 +-
 kernel/locking/lockdep.c                           |   20 +-
 kernel/params.c                                    |    2 +-
 kernel/power/process.c                             |    2 +-
 kernel/printk/printk_ringbuffer.c                  |    2 +-
 kernel/rcu/tree.c                                  |    2 +-
 kernel/sched/cpufreq_schedutil.c                   |   18 +-
 kernel/signal.c                                    |   19 +-
 kernel/stop_machine.c                              |    2 +-
 kernel/time/hrtimer.c                              |    5 -
 kernel/time/itimer.c                               |    4 -
 kernel/time/sched_clock.c                          |    4 +-
 kernel/time/timer.c                                |    5 -
 kernel/trace/ring_buffer.c                         |   58 +-
 kernel/trace/trace.c                               |    6 +-
 kernel/trace/trace.h                               |   26 +-
 kernel/trace/trace_events_synth.c                  |   53 +-
 kernel/trace/trace_selftest.c                      |    9 +-
 kernel/tracepoint.c                                |    2 +-
 lib/Kconfig.debug                                  |    2 +
 lib/crc32test.c                                    |    4 -
 lib/fonts/font_10x18.c                             |    2 +-
 lib/fonts/font_6x10.c                              |    2 +-
 lib/fonts/font_6x11.c                              |    2 +-
 lib/fonts/font_6x8.c                               |    2 +-
 lib/fonts/font_7x14.c                              |    2 +-
 lib/fonts/font_8x16.c                              |    2 +-
 lib/fonts/font_8x8.c                               |    2 +-
 lib/fonts/font_acorn_8x8.c                         |    2 +-
 lib/fonts/font_mini_4x6.c                          |    2 +-
 lib/fonts/font_pearl_8x8.c                         |    2 +-
 lib/fonts/font_sun12x22.c                          |    2 +-
 lib/fonts/font_sun8x16.c                           |    2 +-
 lib/fonts/font_ter16x32.c                          |    2 +-
 lib/scatterlist.c                                  |    2 +-
 lib/test_kasan.c                                   |  149 +-
 mm/hugetlb.c                                       |   20 +-
 mm/memcontrol.c                                    |   25 +-
 mm/mempolicy.c                                     |    6 +-
 mm/memremap.c                                      |   39 +-
 mm/process_vm_access.c                             |    4 +-
 mm/truncate.c                                      |    2 +-
 net/atm/lec.c                                      |    5 +-
 net/bluetooth/msft.c                               |    3 +-
 net/can/Kconfig                                    |    5 +-
 net/can/isotp.c                                    |   26 +-
 net/can/j1939/socket.c                             |    6 +
 net/can/proc.c                                     |    6 +-
 net/core/devlink.c                                 |   30 +-
 net/ipv4/ip_tunnel.c                               |    3 -
 net/ipv4/netfilter.c                               |    8 +-
 net/ipv4/netfilter/iptable_mangle.c                |    2 +-
 net/ipv4/netfilter/nf_reject_ipv4.c                |    2 +-
 net/ipv4/tcp.c                                     |    2 +
 net/ipv4/tcp_input.c                               |    3 +-
 net/ipv4/xfrm4_tunnel.c                            |    4 +-
 net/ipv6/icmp.c                                    |    8 +-
 net/ipv6/ip6_tunnel.c                              |    4 +-
 net/ipv6/netfilter.c                               |    6 +-
 net/ipv6/netfilter/ip6table_mangle.c               |    2 +-
 net/ipv6/reassembly.c                              |   33 +-
 net/ipv6/xfrm6_tunnel.c                            |    4 +-
 net/mac80211/mlme.c                                |    3 +-
 net/mac80211/sta_info.c                            |   18 +
 net/mac80211/sta_info.h                            |    9 +-
 net/mac80211/tx.c                                  |   44 +-
 net/mptcp/protocol.c                               |   10 +
 net/mptcp/token.c                                  |    2 +-
 net/netfilter/ipset/ip_set_core.c                  |    3 +-
 net/netfilter/ipvs/ip_vs_core.c                    |    4 +-
 net/netfilter/nf_nat_proto.c                       |    4 +-
 net/netfilter/nf_synproxy_core.c                   |    2 +-
 net/netfilter/nf_tables_api.c                      |   19 +-
 net/netfilter/nfnetlink.c                          |   22 +-
 net/netfilter/nft_chain_route.c                    |    4 +-
 net/netfilter/utils.c                              |    4 +-
 net/openvswitch/datapath.c                         |   14 +-
 net/openvswitch/flow_table.c                       |    2 +-
 net/rds/ib_cm.c                                    |    5 +-
 net/sched/act_mpls.c                               |    1 +
 net/sched/cls_api.c                                |    4 +-
 net/sched/sch_netem.c                              |    9 +-
 net/sctp/sm_sideeffect.c                           |    4 +-
 net/smc/af_smc.c                                   |    7 +-
 net/smc/smc_clc.h                                  |    4 +-
 net/smc/smc_core.c                                 |    7 +-
 net/tipc/msg.c                                     |    5 +-
 net/vmw_vsock/af_vsock.c                           |    2 +-
 net/wireless/core.c                                |   57 +-
 net/wireless/core.h                                |    5 +-
 net/wireless/nl80211.c                             |    3 +-
 net/wireless/reg.c                                 |    2 +-
 net/xfrm/xfrm_interface.c                          |    8 +-
 net/xfrm/xfrm_state.c                              |    8 +-
 samples/mic/mpssd/.gitignore                       |    2 -
 samples/mic/mpssd/Makefile                         |   28 -
 samples/mic/mpssd/micctrl                          |  162 -
 samples/mic/mpssd/mpss                             |  189 --
 samples/mic/mpssd/mpssd.c                          | 1815 ------------
 samples/mic/mpssd/mpssd.h                          |   89 -
 samples/mic/mpssd/sysfs.c                          |   91 -
 scripts/get_abi.pl                                 |  388 ++-
 scripts/kernel-doc                                 |   21 +-
 scripts/mod/devicetable-offsets.c                  |    3 +
 scripts/mod/file2alias.c                           |    8 +
 security/integrity/ima/ima.h                       |    2 +-
 sound/core/control.c                               |    4 +-
 sound/core/pcm_dmaengine.c                         |    3 +-
 sound/core/pcm_lib.c                               |    2 +-
 sound/core/pcm_native.c                            |    4 +-
 sound/hda/ext/hdac_ext_controller.c                |    2 +
 sound/hda/intel-dsp-config.c                       |  111 +
 sound/pci/hda/hda_codec.c                          |   45 +-
 sound/pci/hda/hda_controller.h                     |    3 +-
 sound/pci/hda/hda_intel.c                          |   63 +-
 sound/pci/hda/patch_realtek.c                      |   67 +-
 sound/soc/adi/Kconfig                              |    1 -
 sound/soc/amd/acp-da7219-max98357a.c               |    9 +-
 sound/soc/amd/raven/pci-acp3x.c                    |    9 +-
 sound/soc/amd/renoir/rn-pci-acp3x.c                |   34 +-
 sound/soc/atmel/Kconfig                            |    1 +
 sound/soc/atmel/atmel-i2s.c                        |    4 +-
 sound/soc/bcm/bcm2835-i2s.c                        |    4 +-
 sound/soc/codecs/Kconfig                           |   63 +-
 sound/soc/codecs/Makefile                          |   19 +
 sound/soc/codecs/adau1372-i2c.c                    |   40 +
 sound/soc/codecs/adau1372-spi.c                    |   58 +
 sound/soc/codecs/adau1372.c                        | 1062 +++++++
 sound/soc/codecs/adau1372.h                        |   21 +
 sound/soc/codecs/adau1977.c                        |    9 +-
 sound/soc/codecs/adav80x.c                         |    1 +
 sound/soc/codecs/ak4118.c                          |    2 +
 sound/soc/codecs/ak5558.c                          |    2 +-
 sound/soc/codecs/alc5623.c                         |    2 +
 sound/soc/codecs/alc5632.c                         |    2 +
 sound/soc/codecs/arizona.c                         |    1 +
 sound/soc/codecs/bd28623.c                         |    2 +-
 sound/soc/codecs/cros_ec_codec.c                   |    2 +-
 sound/soc/codecs/cs42l52.c                         |    1 +
 sound/soc/codecs/cs42l56.c                         |    1 +
 sound/soc/codecs/cs47l92.c                         |    1 +
 sound/soc/codecs/cx2072x.c                         |    4 +-
 sound/soc/codecs/da7218.c                          |    2 +
 sound/soc/codecs/da7219.c                          |    2 +
 sound/soc/codecs/da9055.c                          |    2 +
 sound/soc/codecs/es7134.c                          |    4 +-
 sound/soc/codecs/es7241.c                          |    2 +-
 sound/soc/codecs/es8316.c                          |    2 +
 sound/soc/codecs/gtm601.c                          |    2 +-
 sound/soc/codecs/hdmi-codec.c                      |   43 +-
 sound/soc/codecs/inno_rk3036.c                     |    2 +-
 sound/soc/codecs/jz4725b.c                         |   26 +-
 sound/soc/codecs/jz4740.c                          |   20 +-
 sound/soc/codecs/jz4770.c                          |  109 +-
 sound/soc/codecs/lpass-va-macro.c                  | 1497 ++++++++++
 sound/soc/codecs/lpass-wsa-macro.c                 | 2464 +++++++++++++++
 sound/soc/codecs/lpass-wsa-macro.h                 |   17 +
 sound/soc/codecs/madera.c                          |    4 +-
 sound/soc/codecs/max98090.c                        |    2 +
 sound/soc/codecs/max98095.c                        |    2 +
 sound/soc/codecs/max98371.c                        |    3 +-
 sound/soc/codecs/max98373-sdw.c                    |    2 +-
 sound/soc/codecs/max98390.c                        |    2 +
 sound/soc/codecs/max9867.c                         |    2 +
 sound/soc/codecs/max98925.c                        |    3 +-
 sound/soc/codecs/max98926.c                        |    3 +-
 sound/soc/codecs/mt6359.c                          |  152 +-
 sound/soc/codecs/mt6359.h                          |   15 +-
 sound/soc/codecs/nau8315.c                         |  166 ++
 sound/soc/codecs/pcm1789-i2c.c                     |    2 +
 sound/soc/codecs/pcm179x-i2c.c                     |    2 +
 sound/soc/codecs/pcm512x.c                         |  134 +-
 sound/soc/codecs/rk3328_codec.c                    |    2 +-
 sound/soc/codecs/rt1015.c                          |  211 +-
 sound/soc/codecs/rt1015.h                          |   42 +
 sound/soc/codecs/rt1015p.c                         |   69 +-
 sound/soc/codecs/rt1308-sdw.c                      |    2 +-
 sound/soc/codecs/rt5660.c                          |    2 +
 sound/soc/codecs/rt5682-i2c.c                      |    5 +
 sound/soc/codecs/rt5682-sdw.c                      |    2 +-
 sound/soc/codecs/rt5682.c                          |    3 +
 sound/soc/codecs/rt5682.h                          |   14 +
 sound/soc/codecs/rt700.c                           |    2 +-
 sound/soc/codecs/rt711-sdw.c                       |   15 +-
 sound/soc/codecs/rt711.c                           |    2 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |  278 ++
 sound/soc/codecs/rt715-sdca-sdw.h                  |  170 ++
 sound/soc/codecs/rt715-sdca.c                      |  936 ++++++
 sound/soc/codecs/rt715-sdca.h                      |  124 +
 sound/soc/codecs/rt715.c                           |    2 +-
 sound/soc/codecs/rt715.h                           |    1 -
 sound/soc/codecs/simple-mux.c                      |  124 +
 sound/soc/codecs/tas2562.c                         |    2 +
 sound/soc/codecs/tas571x.c                         |    4 +-
 sound/soc/codecs/tlv320adcx140.c                   |    2 +
 sound/soc/codecs/tlv320aic23-i2c.c                 |    2 +
 sound/soc/codecs/ts3a227e.c                        |    2 +
 sound/soc/codecs/tscs42xx.c                        |    6 +-
 sound/soc/codecs/tscs454.c                         |    8 +-
 sound/soc/codecs/wcd9335.c                         |    2 +-
 sound/soc/codecs/wm5102.c                          |    4 +-
 sound/soc/codecs/wm8350.c                          |    3 +-
 sound/soc/codecs/wm8962.c                          |    1 +
 sound/soc/codecs/wm8994.c                          |    6 +-
 sound/soc/codecs/wm8997.c                          |    2 +
 sound/soc/codecs/wm8998.c                          |    4 +-
 sound/soc/codecs/wm_adsp.c                         |    5 +-
 sound/soc/fsl/Kconfig                              |   77 +-
 sound/soc/fsl/Makefile                             |   16 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   13 +
 sound/soc/fsl/fsl_aud2htx.c                        |  308 ++
 sound/soc/fsl/fsl_aud2htx.h                        |   67 +
 sound/soc/fsl/fsl_audmix.c                         |   13 +-
 sound/soc/fsl/fsl_sai.c                            |   20 +-
 sound/soc/fsl/fsl_sai.h                            |    1 +
 sound/soc/fsl/fsl_spdif.c                          |   73 +-
 sound/soc/fsl/fsl_spdif.h                          |    9 +-
 sound/soc/fsl/fsl_xcvr.c                           | 1360 +++++++++
 sound/soc/fsl/fsl_xcvr.h                           |  266 ++
 sound/soc/fsl/imx-audmux.c                         |   28 +-
 sound/soc/fsl/imx-hdmi.c                           |  236 ++
 sound/soc/fsl/imx-mc13783.c                        |  156 -
 sound/soc/fsl/imx-ssi.c                            |  651 ----
 sound/soc/fsl/mx27vis-aic32x4.c                    |  214 --
 sound/soc/fsl/phycore-ac97.c                       |  121 -
 sound/soc/fsl/wm1133-ev1.c                         |  289 --
 sound/soc/generic/Kconfig                          |    2 +-
 sound/soc/generic/audio-graph-card.c               |  175 +-
 sound/soc/intel/Kconfig                            |    5 +-
 sound/soc/intel/atom/sst-atom-controls.c           |   12 +-
 sound/soc/intel/atom/sst-atom-controls.h           |    4 +-
 sound/soc/intel/atom/sst/sst.c                     |    2 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |    8 +
 sound/soc/intel/boards/Kconfig                     |    3 +-
 sound/soc/intel/boards/Makefile                    |    2 +-
 sound/soc/intel/boards/bdw-rt5650.c                |   17 +-
 sound/soc/intel/boards/bdw-rt5677.c                |   18 +-
 sound/soc/intel/boards/broadwell.c                 |   20 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |   27 +-
 sound/soc/intel/boards/bytcht_da7213.c             |   27 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   29 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   42 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   29 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   29 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |   39 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   38 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   29 +-
 sound/soc/intel/boards/sof_maxim_common.c          |    4 +-
 sound/soc/intel/boards/sof_realtek_common.c        |  138 +
 sound/soc/intel/boards/sof_realtek_common.h        |   24 +
 sound/soc/intel/boards/sof_rt5682.c                |   87 +-
 sound/soc/intel/boards/sof_sdw.c                   |   10 +
 sound/soc/intel/catpt/core.h                       |   10 +-
 sound/soc/intel/catpt/device.c                     |   30 +-
 sound/soc/intel/catpt/dsp.c                        |   56 +-
 sound/soc/intel/catpt/loader.c                     |    2 +-
 sound/soc/intel/catpt/pcm.c                        |  106 +-
 sound/soc/intel/common/Makefile                    |    2 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   52 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   13 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   17 +-
 sound/soc/intel/keembay/kmb_platform.c             |   22 +-
 sound/soc/intel/keembay/kmb_platform.h             |    8 +-
 sound/soc/intel/skylake/skl-topology.c             |    9 +-
 sound/soc/jz4740/jz4740-i2s.c                      |    9 +-
 sound/soc/kirkwood/armada-370-db.c                 |    2 +-
 sound/soc/mediatek/Kconfig                         |   25 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   13 +-
 sound/soc/mediatek/common/mtk-base-afe.h           |    1 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |    2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c         |    1 -
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    1 +
 sound/soc/mediatek/mt8192/Makefile                 |   16 +
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c         |  669 +++++
 sound/soc/mediatek/mt8192/mt8192-afe-clk.h         |  244 ++
 sound/soc/mediatek/mt8192/mt8192-afe-common.h      |  170 ++
 sound/soc/mediatek/mt8192/mt8192-afe-control.c     |  163 +
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |  308 ++
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h        |   19 +
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         | 2389 +++++++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c        | 1471 +++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         | 2110 +++++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c         |  409 +++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c         |  778 +++++
 sound/soc/mediatek/mt8192/mt8192-interconnection.h |   65 +
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  | 1137 +++++++
 sound/soc/mediatek/mt8192/mt8192-reg.h             | 3131 ++++++++++++++++++++
 sound/soc/meson/Kconfig                            |    4 +-
 sound/soc/meson/t9015.c                            |    2 +-
 sound/soc/pxa/Kconfig                              |   14 +-
 sound/soc/pxa/mmp-sspa.c                           |    4 +
 sound/soc/pxa/pxa-ssp.c                            |    6 +-
 sound/soc/qcom/Kconfig                             |   25 +
 sound/soc/qcom/Makefile                            |    4 +
 sound/soc/qcom/apq8016_sbc.c                       |    2 +-
 sound/soc/qcom/common.c                            |   13 +-
 sound/soc/qcom/lpass-apq8016.c                     |    2 +-
 sound/soc/qcom/lpass-cpu.c                         |   12 +-
 sound/soc/qcom/lpass-hdmi.c                        |    2 +-
 sound/soc/qcom/lpass-ipq806x.c                     |    2 +-
 sound/soc/qcom/lpass-sc7180.c                      |   10 +-
 sound/soc/qcom/lpass.h                             |    1 +
 sound/soc/qcom/qdsp6/q6adm.c                       |   10 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c                |    3 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |   10 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   10 +-
 sound/soc/qcom/sc7180.c                            |  391 +++
 sound/soc/qcom/sm8250.c                            |  229 ++
 sound/soc/rockchip/rockchip_i2s.c                  |    2 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    2 +-
 sound/soc/rockchip/rockchip_spdif.c                |    2 +-
 sound/soc/samsung/i2s.c                            |   11 +-
 sound/soc/samsung/midas_wm1811.c                   |    1 -
 sound/soc/samsung/smdk_wm8994.c                    |    4 +-
 sound/soc/samsung/snow.c                           |    2 +-
 sound/soc/sh/Kconfig                               |    1 +
 sound/soc/soc-component.c                          |  318 +-
 sound/soc/soc-compress.c                           |  397 +--
 sound/soc/soc-core.c                               |   90 +-
 sound/soc/soc-dai.c                                |   70 +-
 sound/soc/soc-dapm.c                               |    8 +-
 sound/soc/soc-link.c                               |   53 +-
 sound/soc/soc-pcm.c                                |  217 +-
 sound/soc/soc-topology.c                           |  337 +--
 sound/soc/sof/Kconfig                              |   42 +-
 sound/soc/sof/control.c                            |   42 +-
 sound/soc/sof/debug.c                              |  119 +-
 sound/soc/sof/imx/Kconfig                          |   10 +-
 sound/soc/sof/imx/imx-common.c                     |    2 +
 sound/soc/sof/intel/Kconfig                        |  110 +-
 sound/soc/sof/intel/Makefile                       |    2 +-
 sound/soc/sof/intel/apl.c                          |    3 +
 sound/soc/sof/intel/byt.c                          |    2 +-
 sound/soc/sof/intel/cnl.c                          |   19 +-
 sound/soc/sof/intel/ext_manifest.h                 |   35 +
 sound/soc/sof/intel/hda-dsp.c                      |    2 +-
 sound/soc/sof/intel/hda-loader.c                   |  119 +-
 sound/soc/sof/intel/hda-pcm.c                      |    7 +
 sound/soc/sof/intel/hda.c                          |   10 +-
 sound/soc/sof/intel/hda.h                          |   12 +
 sound/soc/sof/intel/icl.c                          |  145 +
 sound/soc/sof/intel/intel-ipc.c                    |    7 +
 sound/soc/sof/intel/tgl.c                          |   19 +
 sound/soc/sof/ipc.c                                |    9 +
 sound/soc/sof/loader.c                             |   62 +-
 sound/soc/sof/nocodec.c                            |   18 +-
 sound/soc/sof/ops.c                                |    2 +-
 sound/soc/sof/ops.h                                |   14 +-
 sound/soc/sof/pcm.c                                |   14 +-
 sound/soc/sof/sof-acpi-dev.c                       |   14 +-
 sound/soc/sof/sof-audio.c                          |   12 +-
 sound/soc/sof/sof-audio.h                          |    5 +
 sound/soc/sof/sof-pci-dev.c                        |   24 +-
 sound/soc/sof/sof-priv.h                           |   22 +-
 sound/soc/sof/topology.c                           |   33 +-
 sound/soc/sof/trace.c                              |  224 ++
 sound/soc/stm/Kconfig                              |    1 +
 sound/soc/sunxi/Kconfig                            |    1 +
 sound/soc/sunxi/sun4i-i2s.c                        |  388 ++-
 sound/soc/sunxi/sun8i-codec.c                      |  834 +++++-
 sound/soc/tegra/Kconfig                            |    1 -
 sound/soc/tegra/tegra186_dspk.c                    |    6 +-
 sound/soc/tegra/tegra210_dmic.c                    |    6 +-
 sound/soc/tegra/tegra210_i2s.c                     |    6 +-
 sound/soc/tegra/tegra_alc5632.c                    |    4 +-
 sound/soc/tegra/tegra_max98090.c                   |    8 +-
 sound/soc/tegra/tegra_rt5640.c                     |    8 +-
 sound/soc/tegra/tegra_rt5677.c                     |    4 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |    4 +-
 sound/soc/tegra/tegra_wm8753.c                     |    8 +-
 sound/soc/tegra/tegra_wm8903.c                     |    8 +-
 sound/soc/tegra/tegra_wm9712.c                     |    4 +-
 sound/soc/tegra/trimslice.c                        |    8 +-
 sound/soc/ti/Kconfig                               |    9 +-
 sound/soc/ti/davinci-evm.c                         |    3 +-
 sound/soc/ti/davinci-i2s.c                         |    2 +-
 sound/soc/ti/davinci-mcasp.c                       |  298 +-
 sound/soc/uniphier/aio-ld11.c                      |    2 +-
 sound/soc/uniphier/aio-pxs2.c                      |    2 +-
 sound/soc/uniphier/evea.c                          |    2 +-
 sound/usb/pcm.c                                    |    6 +
 sound/usb/quirks.c                                 |    1 +
 tools/arch/arm64/include/uapi/asm/kvm.h            |   25 +
 tools/arch/s390/include/uapi/asm/sie.h             |    2 +-
 tools/arch/x86/include/asm/cpufeatures.h           |    6 +-
 tools/arch/x86/include/asm/disabled-features.h     |    9 +-
 tools/arch/x86/include/asm/msr-index.h             |   10 +
 tools/arch/x86/include/asm/required-features.h     |    2 +-
 tools/arch/x86/include/uapi/asm/kvm.h              |   20 +
 tools/arch/x86/include/uapi/asm/svm.h              |   13 +
 tools/build/feature/test-all.c                     |    1 -
 tools/include/linux/compiler-gcc.h                 |   12 -
 tools/include/linux/compiler.h                     |    3 -
 tools/include/uapi/asm-generic/unistd.h            |    4 +-
 tools/include/uapi/drm/i915_drm.h                  |   59 +-
 tools/include/uapi/linux/fscrypt.h                 |    6 +-
 tools/include/uapi/linux/kvm.h                     |   19 +
 tools/include/uapi/linux/mman.h                    |    1 +
 tools/include/uapi/linux/mount.h                   |    1 +
 tools/include/uapi/linux/perf_event.h              |    2 +-
 tools/include/uapi/linux/prctl.h                   |    9 +
 tools/include/uapi/linux/vhost.h                   |    4 +
 tools/perf/Makefile.config                         |    1 +
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |   11 +-
 tools/perf/builtin-trace.c                         |   15 +-
 .../arch/x86/cascadelakex/clx-metrics.json         |    2 +-
 .../pmu-events/arch/x86/skylakex/skx-metrics.json  |    2 +-
 tools/perf/tests/dwarf-unwind.c                    |   10 +-
 tools/perf/ui/browsers/hists.c                     |    2 +-
 tools/perf/util/build-id.c                         |    2 +
 tools/perf/util/hashmap.c                          |    3 +
 tools/perf/util/hashmap.h                          |   12 +
 tools/perf/util/machine.c                          |   11 +-
 .../util/scripting-engines/trace-event-python.c    |    7 +-
 tools/perf/util/session.c                          |   14 +
 tools/perf/util/symbol.c                           |    7 +
 tools/perf/util/symbol.h                           |    2 +
 tools/testing/kunit/kunit_parser.py                |    3 +-
 tools/testing/kunit/kunit_tool_test.py             |   32 +-
 .../kunit/test_data/test_config_printk_time.log    |    3 +-
 .../test_data/test_interrupted_tap_output.log      |    3 +-
 .../test_data/test_kernel_panic_interrupt.log      |    3 +-
 .../kunit/test_data/test_multiple_prefixes.log     |    3 +-
 .../kunit/test_data/test_pound_no_prefix.log       |    3 +-
 tools/testing/kunit/test_data/test_pound_sign.log  |    1 +
 .../selftests/arm64/mte/check_buffer_fill.c        |    3 +
 .../selftests/arm64/mte/check_child_memory.c       |    3 +
 .../selftests/arm64/mte/check_ksm_options.c        |    4 +
 .../selftests/arm64/mte/check_mmap_options.c       |    4 +
 .../selftests/arm64/mte/check_tags_inclusion.c     |    3 +
 tools/testing/selftests/arm64/mte/check_user_mem.c |    4 +
 .../clone3/clone3_cap_checkpoint_restore.c         |    2 +-
 tools/testing/selftests/core/close_range_test.c    |    8 +-
 .../selftests/filesystems/binderfs/binderfs_test.c |    8 +-
 .../filesystems/epoll/epoll_wakeup_test.c          |   95 +
 .../ftrace/test.d/dynevent/add_remove_kprobe.tc    |    2 +-
 .../ftrace/test.d/dynevent/clear_select_events.tc  |    2 +-
 .../ftrace/test.d/dynevent/generic_clear_event.tc  |    2 +-
 .../test.d/ftrace/func-filter-notrace-pid.tc       |    2 +-
 .../ftrace/test.d/ftrace/func-filter-pid.tc        |    2 +-
 .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |    4 +-
 tools/testing/selftests/ftrace/test.d/functions    |    7 +
 .../ftrace/test.d/kprobe/add_and_remove.tc         |    2 +-
 .../selftests/ftrace/test.d/kprobe/busy_check.tc   |    2 +-
 .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |    4 +-
 .../ftrace/test.d/kprobe/kprobe_args_comm.tc       |    2 +-
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |    4 +-
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   10 +-
 .../ftrace/test.d/kprobe/kprobe_args_type.tc       |    2 +-
 .../ftrace/test.d/kprobe/kprobe_args_user.tc       |    4 +
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |   14 +-
 .../ftrace/test.d/kprobe/kprobe_multiprobe.tc      |    2 +-
 .../ftrace/test.d/kprobe/kprobe_syntax_errors.tc   |   12 +-
 .../ftrace/test.d/kprobe/kretprobe_args.tc         |    4 +-
 .../selftests/ftrace/test.d/kprobe/profile.tc      |    2 +-
 tools/testing/selftests/kselftest_harness.h        |   46 +-
 tools/testing/selftests/kvm/.gitignore             |    1 +
 tools/testing/selftests/kvm/Makefile               |    1 +
 tools/testing/selftests/kvm/include/x86_64/vmx.h   |    6 +
 tools/testing/selftests/kvm/lib/kvm_util.c         |   23 +-
 tools/testing/selftests/kvm/lib/x86_64/vmx.c       |    9 +
 .../selftests/kvm/x86_64/vmx_apic_access_test.c    |  142 +
 tools/testing/selftests/lib.mk                     |    2 +-
 tools/testing/selftests/pidfd/config               |    1 +
 tools/testing/selftests/pidfd/pidfd_getfd_test.c   |    5 +-
 tools/testing/selftests/pidfd/pidfd_open_test.c    |    1 -
 tools/testing/selftests/pidfd/pidfd_poll_test.c    |    1 -
 tools/testing/selftests/pidfd/pidfd_setns_test.c   |    1 -
 tools/testing/selftests/pidfd/pidfd_test.c         |    2 +-
 tools/testing/selftests/proc/proc-loadavg-001.c    |    1 -
 tools/testing/selftests/proc/proc-self-syscall.c   |    1 -
 tools/testing/selftests/proc/proc-uptime-002.c     |    1 -
 tools/testing/selftests/wireguard/netns.sh         |    8 +
 .../testing/selftests/wireguard/qemu/kernel.config |    2 +
 1591 files changed, 42445 insertions(+), 38630 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
 create mode 100644 Documentation/admin-guide/abi-obsolete.rst
 create mode 100644 Documentation/admin-guide/abi-removed.rst
 create mode 100644 Documentation/admin-guide/abi-stable.rst
 create mode 100644 Documentation/admin-guide/abi-testing.rst
 create mode 100644 Documentation/admin-guide/abi.rst
 create mode 100644 Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
 delete mode 100644 Documentation/devicetree/bindings/input/cros-ec-keyb.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
 create mode 100644 Documentation/devicetree/bindings/net/can/can-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/can/fsl-flexcan.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1372.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-port.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nau8315.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
 create mode 100644 Documentation/driver-api/auxiliary_bus.rst
 create mode 100644 Documentation/leds/leds-el15203000.rst
 create mode 100644 Documentation/leds/leds-sc27xx.rst
 delete mode 100644 Documentation/misc-devices/mic/index.rst
 delete mode 100644 Documentation/misc-devices/mic/mic_overview.rst
 delete mode 100644 Documentation/misc-devices/mic/scif_overview.rst
 create mode 100644 Documentation/sphinx/kernel_abi.py
 create mode 100755 arch/riscv/kernel/vdso/so2s.sh
 delete mode 100644 arch/s390/include/asm/vdso/vdso.h
 create mode 100644 arch/x86/kernel/sev_verify_cbit.S
 create mode 100644 drivers/base/auxiliary.c
 create mode 100644 drivers/base/regmap/regmap-sdw-mbq.c
 delete mode 100644 drivers/dma/mic_x100_dma.c
 delete mode 100644 drivers/dma/mic_x100_dma.h
 delete mode 100644 drivers/misc/mic/Kconfig
 delete mode 100644 drivers/misc/mic/Makefile
 delete mode 100644 drivers/misc/mic/bus/Makefile
 delete mode 100644 drivers/misc/mic/bus/cosm_bus.c
 delete mode 100644 drivers/misc/mic/bus/cosm_bus.h
 delete mode 100644 drivers/misc/mic/bus/mic_bus.c
 delete mode 100644 drivers/misc/mic/bus/scif_bus.c
 delete mode 100644 drivers/misc/mic/bus/scif_bus.h
 delete mode 100644 drivers/misc/mic/bus/vop_bus.c
 delete mode 100644 drivers/misc/mic/bus/vop_bus.h
 delete mode 100644 drivers/misc/mic/card/Makefile
 delete mode 100644 drivers/misc/mic/card/mic_debugfs.c
 delete mode 100644 drivers/misc/mic/card/mic_device.c
 delete mode 100644 drivers/misc/mic/card/mic_device.h
 delete mode 100644 drivers/misc/mic/card/mic_x100.c
 delete mode 100644 drivers/misc/mic/card/mic_x100.h
 delete mode 100644 drivers/misc/mic/common/mic_dev.h
 delete mode 100644 drivers/misc/mic/cosm/Makefile
 delete mode 100644 drivers/misc/mic/cosm/cosm_debugfs.c
 delete mode 100644 drivers/misc/mic/cosm/cosm_main.c
 delete mode 100644 drivers/misc/mic/cosm/cosm_main.h
 delete mode 100644 drivers/misc/mic/cosm/cosm_scif_server.c
 delete mode 100644 drivers/misc/mic/cosm/cosm_sysfs.c
 delete mode 100644 drivers/misc/mic/cosm_client/Makefile
 delete mode 100644 drivers/misc/mic/cosm_client/cosm_scif_client.c
 delete mode 100644 drivers/misc/mic/host/Makefile
 delete mode 100644 drivers/misc/mic/host/mic_boot.c
 delete mode 100644 drivers/misc/mic/host/mic_debugfs.c
 delete mode 100644 drivers/misc/mic/host/mic_device.h
 delete mode 100644 drivers/misc/mic/host/mic_intr.c
 delete mode 100644 drivers/misc/mic/host/mic_intr.h
 delete mode 100644 drivers/misc/mic/host/mic_main.c
 delete mode 100644 drivers/misc/mic/host/mic_smpt.c
 delete mode 100644 drivers/misc/mic/host/mic_smpt.h
 delete mode 100644 drivers/misc/mic/host/mic_x100.c
 delete mode 100644 drivers/misc/mic/host/mic_x100.h
 delete mode 100644 drivers/misc/mic/scif/Makefile
 delete mode 100644 drivers/misc/mic/scif/scif_api.c
 delete mode 100644 drivers/misc/mic/scif/scif_debugfs.c
 delete mode 100644 drivers/misc/mic/scif/scif_dma.c
 delete mode 100644 drivers/misc/mic/scif/scif_epd.c
 delete mode 100644 drivers/misc/mic/scif/scif_epd.h
 delete mode 100644 drivers/misc/mic/scif/scif_fd.c
 delete mode 100644 drivers/misc/mic/scif/scif_fence.c
 delete mode 100644 drivers/misc/mic/scif/scif_main.c
 delete mode 100644 drivers/misc/mic/scif/scif_main.h
 delete mode 100644 drivers/misc/mic/scif/scif_map.h
 delete mode 100644 drivers/misc/mic/scif/scif_mmap.c
 delete mode 100644 drivers/misc/mic/scif/scif_nm.c
 delete mode 100644 drivers/misc/mic/scif/scif_nodeqp.c
 delete mode 100644 drivers/misc/mic/scif/scif_nodeqp.h
 delete mode 100644 drivers/misc/mic/scif/scif_peer_bus.c
 delete mode 100644 drivers/misc/mic/scif/scif_peer_bus.h
 delete mode 100644 drivers/misc/mic/scif/scif_ports.c
 delete mode 100644 drivers/misc/mic/scif/scif_rb.c
 delete mode 100644 drivers/misc/mic/scif/scif_rb.h
 delete mode 100644 drivers/misc/mic/scif/scif_rma.c
 delete mode 100644 drivers/misc/mic/scif/scif_rma.h
 delete mode 100644 drivers/misc/mic/scif/scif_rma_list.c
 delete mode 100644 drivers/misc/mic/scif/scif_rma_list.h
 delete mode 100644 drivers/misc/mic/vop/Makefile
 delete mode 100644 drivers/misc/mic/vop/vop_debugfs.c
 delete mode 100644 drivers/misc/mic/vop/vop_main.c
 delete mode 100644 drivers/misc/mic/vop/vop_main.h
 delete mode 100644 drivers/misc/mic/vop/vop_vringh.c
 create mode 100644 include/dt-bindings/sound/adi,adau1977.h
 create mode 100644 include/linux/auxiliary_bus.h
 delete mode 100644 include/linux/mic_bus.h
 delete mode 100644 include/linux/platform_data/adau1977.h
 delete mode 100644 include/linux/scif.h
 create mode 100644 include/sound/graph_card.h
 create mode 100644 include/sound/soc-jack.h
 create mode 100644 include/sound/sof/debug.h
 delete mode 100644 include/uapi/linux/mic_common.h
 delete mode 100644 include/uapi/linux/mic_ioctl.h
 delete mode 100644 samples/mic/mpssd/.gitignore
 delete mode 100644 samples/mic/mpssd/Makefile
 delete mode 100755 samples/mic/mpssd/micctrl
 delete mode 100755 samples/mic/mpssd/mpss
 delete mode 100644 samples/mic/mpssd/mpssd.c
 delete mode 100644 samples/mic/mpssd/mpssd.h
 delete mode 100644 samples/mic/mpssd/sysfs.c
 create mode 100644 sound/soc/codecs/adau1372-i2c.c
 create mode 100644 sound/soc/codecs/adau1372-spi.c
 create mode 100644 sound/soc/codecs/adau1372.c
 create mode 100644 sound/soc/codecs/adau1372.h
 create mode 100644 sound/soc/codecs/lpass-va-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.h
 create mode 100644 sound/soc/codecs/nau8315.c
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt715-sdca.c
 create mode 100644 sound/soc/codecs/rt715-sdca.h
 create mode 100644 sound/soc/codecs/simple-mux.c
 create mode 100644 sound/soc/fsl/fsl_aud2htx.c
 create mode 100644 sound/soc/fsl/fsl_aud2htx.h
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h
 create mode 100644 sound/soc/fsl/imx-hdmi.c
 delete mode 100644 sound/soc/fsl/imx-mc13783.c
 delete mode 100644 sound/soc/fsl/imx-ssi.c
 delete mode 100644 sound/soc/fsl/mx27vis-aic32x4.c
 delete mode 100644 sound/soc/fsl/phycore-ac97.c
 delete mode 100644 sound/soc/fsl/wm1133-ev1.c
 create mode 100644 sound/soc/intel/boards/sof_realtek_common.c
 create mode 100644 sound/soc/intel/boards/sof_realtek_common.h
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-adl-match.c
 create mode 100644 sound/soc/mediatek/mt8192/Makefile
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-reg.h
 create mode 100644 sound/soc/qcom/sc7180.c
 create mode 100644 sound/soc/qcom/sm8250.c
 create mode 100644 sound/soc/sof/intel/ext_manifest.h
 create mode 100644 sound/soc/sof/intel/icl.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/vmx_apic_access_test.c
