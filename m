Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86B23A59B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 14:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DF8166A;
	Mon,  3 Aug 2020 14:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DF8166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596458415;
	bh=nCzCWE/OgkQxblhWkylVZ9znc5OVuazGOB1/BQcLml0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G9DlVZLrk1nwam9Wz0zfJA5Bui3U/mdbCzIzJfSYuYUHDGMUzQGGzkHcSNAH2++bw
	 SJWHy30+guRRfGgwscUSS9d66Gja5LWPzvrnUXx8LMAByTelTFUu7CrtyblYyf65Gr
	 O65G0gOa3dDytH8Gf2k/T/iUQe5gunG//ztX4Y2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50900F801F7;
	Mon,  3 Aug 2020 14:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B338F80218; Mon,  3 Aug 2020 14:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 282F9F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 14:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 282F9F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vEoEmFs3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21801204EC;
 Mon,  3 Aug 2020 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596458295;
 bh=nCzCWE/OgkQxblhWkylVZ9znc5OVuazGOB1/BQcLml0=;
 h=From:To:Cc:Subject:Date:From;
 b=vEoEmFs31Fgdb4RKoEd9L/3zxmEFu78iqswjP1uMeFUcbrfarUnlN6Aqizm98nub2
 dB55hrzcLAMGN8AsQLJ3K0Wy28qZNpBMN45/seNjBDECOG1S0vg3pUmhmbrk37xwEz
 B7SFlNKNighRLIaR6sv2yR8oZvSB8MsT5TddBqEU=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.9
Date: Mon, 03 Aug 2020 13:37:37 +0100
Message-Id: <20200803123814.21801204EC@mail.kernel.org>
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

The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.9

for you to fetch changes up to 84569f329f7fcb40b7b1860f273b2909dabf2a2b:

  Merge remote-tracking branch 'asoc/for-5.9' into asoc-next (2020-07-31 19:54:03 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.9

The biggest changes here one again come from Mormioto-san who has
continued his dilligent work cleaning up long standing issues in the
APIs, it's particularly nice to see the transition from digital_mute()
to mute_stream() finally completed. There's also been a lot of work on
the x86 code again, this time a big focus has been on cleaning up some
issues identified by various static tests, and on the Freescale systems.
Otherwise the biggest thing has been a lot of driver additions:

 - Convert users of digital_mute() to mute_stream().
 - Simplify I/O helper functions.
 - Add a helper for getting the RTD from a substream.
 - Many, many fixes and cleanups to the x86 code.
 - New drivers for Freescale MQS and i.MX6sx, Intel KeemBay I2S, Maxim
   MAX98360A and MAX98373 Soundwire, several Mediatek boards, nVidia
   Tegra 186 and 210, RealTek RL6231, Samsung Midas and Aries boards (some
   of the first phones I worked on!) and TI J721e EVM.

----------------------------------------------------------------
Akshu Agrawal (3):
      ASoC: AMD: Use mixer control to switch between DMICs
      ASoC: amd: Enable interrupt in dma_open
      ASoC: AMD: Restore PME_EN state at Power On

Alexander A. Klimov (4):
      ASoC: Replace HTTP links with HTTPS ones
      ASoC: ti: Replace HTTP links with HTTPS ones
      ASoC: fsl: Replace HTTP links with HTTPS ones
      ASoC: omap: Replace HTTP links with HTTPS ones

Alper Nebi Yasak (1):
      ASoC: rk3399_gru_sound: Add DAPM pins, kcontrols for jack detection

Bard Liao (2):
      ASoC: intel: cml_rt1011_rt5682: use for_each_card_prelinks
      ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name

Brent Lu (1):
      ASoC: Intel: bxt-da7219-max98357a: support MAX98390 speaker amp

Cezary Rojewski (3):
      ASoC: core: Relocate and expose snd_soc_component_initialize
      ASoC: core: Simplify snd_soc_component_initialize declaration
      ASoC: core: Two step component registration

Charles Keepax (2):
      ASoC: madera: Add channel numbers to AIFs
      ASoC: soc-core: Fix regression causing sysfs entries to disappear

Codrin Ciubotariu (2):
      ASoC: atmel-classd: remove codec component
      ASoC: atmel-pdmic: remove codec component

Colin Ian King (1):
      ASoC: Intel: bxt-da7219-max98357a: return -EINVAL on unrecognized speaker amplifier

Colton Lewis (1):
      snd/soc: correct trivial kernel-doc inconsistency

Dan Murphy (17):
      ASoC: tas2562: Update shutdown GPIO property
      ASoC: tas2562: Fix format issue for extra space before a comma
      ASoC: tas2562: Fix shut-down gpio property
      ASoC: tas2562: Add right and left channel slot programming
      ASoC: tas2562: Add voltage sense slot configuration
      ASoC: tas2562: Add voltage sense slot property
      ASoC: tlv320adcx140: Add ASI enable for channel 5-8
      ASoC: tlv320adcx140: Add tx offset slot programming
      ASoC: tas2770: Fix reset gpio property name
      ASoC: tas2770: Convert tas2770 binding to yaml
      ASoC: tas2562: Update shutdown GPIO property
      ASoC: tas2562: Convert the tas2562 binding to yaml
      ASoC: tlv320adcx140: Fix various style errors and warnings
      dt-bindings: tlv320adcx140: Add GPO config and drive config
      ASoC: tlv320adcx140: Add GPO configuration and drive output config
      ASoC: tlv320adcx140: Fix GPO register start address
      ASoC: tlv320adcx140: Move device reset to before programming

Daniel Baluta (7):
      ASoC: SOF: define INFO_ flags in dsp_ops for imx8
      ASoC: SOF: imx: Use ARRAY_SIZE instead of hardcoded value
      ASoC: SOF: imx8: Fix ESAI DAI driver name for i.MX8/iMX8X
      ASoC: SOF: imx8m: Fix SAI DAI driver for i.MX8M
      ASoC: SOF: imx8: Add SAI dai driver for i.MX/i.MX8X
      ASoC: SOF: topology: Update SAI config bclk/fsync rate
      ASoC: SOF: pcm: Update rate/channels for SAI/ESAI DAIs

Dharageswari R (3):
      ASoC: Intel: Boards: tgl_max98373: add dai_trigger function
      ASoC: Intel: Boards: tgl_max98373: Fix the comment for max_98373_components
      ASoC: Intel: Boards: tgl_max98373: Update TDM configuration in hw_params

Fabio Estevam (3):
      ASoC: dt-bindings: keembay-i2s: Fix reg descriptions
      ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings
      ASoC: wm8962: Do not access WM8962_GPIO_BASE

Fred Oh (6):
      ASoC: intel: sof_rt5682: move disabling jack to dai link's exit()
      ASoC: intel: cml_rt1011_rt5682: disable jack in dailink .exit()
      ASoC: rt1011: fix KASAN out-of-bounds bug in find_next_bit()
      ASoC: Intel: Boards: cml_rt1011_rt5682: reduce log level for printing quirk
      ASoC: Intel: Boards: cml_rt1011_rt5682: use statically define codec config
      ASoc: Intel: cml_rt1011_rt5682: explicitly access first codec

Fuqian Huang (1):
      ASoC: wm0010: Use kmemdup rather than duplicating its implementation

Gustavo A. R. Silva (2):
      ASoC: codecs: Use fallthrough pseudo-keyword
      ASoC: Intel: Skylake: Avoid the use of one-element array

Hans de Goede (3):
      ASoC: rt5670: Remove struct rt5670_platform_data
      ASoC: rt5670: Rename dev_gpio to gpio1_is_irq
      ASoC: Intel: cht_bsw_rt5672: Improve dai-set-fmt comment in cht_codec_fixup()

Harsha Priya (1):
      ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix kabylake_ssp_fixup function

Hauke Mehrtens (1):
      spi: lantiq-ssc: Fix warning by using WQ_MEM_RECLAIM

Jack Yu (1):
      ASoC: rt1015: Flush DAC data before playback.

James Schulman (1):
      ASoC: wm_adsp: Support new metadata block ID's

Jerome Brunet (7):
      ASoC: meson: imply acodec glue on axg sound card
      ASoC: soc-component: don't report of_xlate_dai_name failures
      ASoC: meson: axg-tdm-interface: fix link fmt setup
      ASoC: meson: axg-tdmin: fix g12a skew
      ASoC: meson: axg-tdm-formatters: fix sclk inversion
      ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties
      ASoC: meson: cards: deal dpcm flag change

Jiaxin Yu (2):
      ASoC: mediatek: mt6358: support DMIC one-wire mode
      ASoC: dt-bindings: mediatek: mt6358: add dmic-mode property

Jing Xiangfeng (1):
      ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback

John Stultz (1):
      ASoC: qcom: Kconfig: Tweak dependencies on SND_SOC_SDM845

Jonathan Bakker (3):
      ASoC: samsung: Add driver for Aries boards
      ASoC: Document wm8994 endpoints
      ASoC: Add bindings for Samsung Aries audio complex

Julia Lawall (2):
      ASoC: Intel: drop unnecessary list_empty
      ASoC: SOF: imx: use resource_size

Kai Vehmanen (8):
      ALSA: hda: export snd_hda_codec_cleanup_for_unbind()
      ALSA: hda: fix snd_hda_codec_cleanup() documentation
      ASoC: Intel: sof_sdw: add support for systems without i915 audio
      ASoC: Intel: sof_sdw: avoid crash if invalid DSP topology loaded
      ASoC: intel/skl/hda - fix probe regression on systems without i915
      ASoC: hdac_hda: call patch_ops.free() on probe error
      ASoC: hdac_hda: fix memleak on module unload
      ASoC: hdac_hda: fix deadlock after PCM open error

Katsuhiro Suzuki (3):
      ASoC: convert rk3328 codec binding to yaml
      ASoC: convert ROHM BD28623 amplifier binding to yaml
      ASoC: convert Everest ES8316 binding to yaml

Kuninori Morimoto (90):
      ASoC: soc-component: add soc_component_pin() and share code
      ASoC: soc-component: move snd_soc_component_xxx_regmap() to soc-component
      ASoC: soc-component: move snd_soc_component_initialize() to soc-component.c
      ASoC: soc-component: add soc_component_err()
      ASoC: soc-component: add snd_soc_pcm_component_prepare()
      ASoC: soc-component: add snd_soc_pcm_component_hw_params()
      ASoC: soc-component: add snd_soc_pcm_component_hw_free()
      ASoC: soc-component: add snd_soc_pcm_component_trigger()
      ASoC: soc-component: add snd_soc_component_init()
      ASoC: soc-component: merge soc-io.c into soc-component.c
      ASoC: soc-component: merge soc_pcm_trigger_start/stop()
      ASoC: soc-component: tidyup Copyright
      ASoC: soc-component: merge snd_soc_component_read() and snd_soc_component_read32()
      ASoC: soc-component: use io_mutex correctly
      ASoC: pxa: rename to snd_soc_component_read()
      ASoC: atmel: rename to snd_soc_component_read()
      ASoC: codecs: rename to snd_soc_component_read()
      ASoC: codecs: wcd*: rename to snd_soc_component_read()
      ASoC: codecs: tlv*: rename to snd_soc_component_read()
      ASoC: codecs: max*: rename to snd_soc_component_read()
      ASoC: codecs: msm*: rename to snd_soc_component_read()
      ASoC: codecs: alc*: rename to snd_soc_component_read()
      ASoC: codecs: wm*: rename to snd_soc_component_read()
      ASoC: codecs: rt*: rename to snd_soc_component_read()
      ASoC: codecs: da*: rename to snd_soc_component_read()
      ASoC: codecs: cs*: rename to snd_soc_component_read()
      ASoC: codecs: ak*: rename to snd_soc_component_read()
      ASoC: remove snd_soc_component_read32()
      ARM: dts: motorola-mapphone-common: remove unneeded "simple-graph-card"
      ASoC: rsnd: don't use discriminatory terms for function names
      ASoC: rsnd: don't use discriminatory terms for comment
      ASoC: fsi: don't use discriminatory terms for comment
      ASoC: siu: don't use discriminatory terms for parameter
      ASoC: ssi: don't use discriminatory terms for debug log
      ASoC: hdmi-codec: return -ENOTSUPP for digital_mute
      ASoC: soc-dai.c: add .no_capture_mute support
      ASoC: hdmi-codec: merge .digital_mute() into .mute_stream()
      ASoC: ti: merge .digital_mute() into .mute_stream()
      ASoC: spear: merge .digital_mute() into .mute_stream()
      ASoC: meson: merge .digital_mute() into .mute_stream()
      ASoC: codecs: merge .digital_mute() into .mute_stream()
      ASoC: codecs: tlv*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: tas*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: ssm*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: pcm*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: max*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: alc*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: wm*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: es*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: da*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: cs*: merge .digital_mute() into .mute_stream()
      ASoC: codecs: ak*: merge .digital_mute() into .mute_stream()
      ASoC: dt-bindings: ak4642: switch to yaml base Documentation
      ASoC: dt-bindings: ak4613: switch to yaml base Documentation
      ASoC: dt-bindings: renesas, fsi: use patternProperties for FSI-A/B
      ASoC: atmel: merge .digital_mute() into .mute_stream()
      ASoC: soc-core: snd_soc_dai_digital_mute() for both CPU/Codec
      ASoC: soc-dai.h: don't use discriminatory terms for comment
      ASoC: soc-dai: remove .digital_mute
      ASoC: soc-xxx: add asoc_substream_to_rtd()
      ASoC: ux500: use asoc_substream_to_rtd()
      ASoC: ti: use asoc_substream_to_rtd()
      ASoC: tegra: use asoc_substream_to_rtd()
      ASoC: sunxi: use asoc_substream_to_rtd()
      ASoC: stm: use asoc_substream_to_rtd()
      ASoC: sof: use asoc_substream_to_rtd()
      ASoC: sh: use asoc_substream_to_rtd()
      ASoC: samsung: use asoc_substream_to_rtd()
      ASoC: pxa: use asoc_substream_to_rtd()
      ASoC: cirrus: use asoc_substream_to_rtd()
      ASoC: rockchip: use asoc_substream_to_rtd()
      ASoC: amd: use asoc_substream_to_rtd()
      ASoC: fsl: use asoc_substream_to_rtd()
      ASoC: mediatek: use asoc_substream_to_rtd()
      ASoC: atmel: use asoc_substream_to_rtd()
      ASoC: qcom: use asoc_substream_to_rtd()
      ASoC: dwc: use asoc_substream_to_rtd()
      ASoC: meson: use asoc_substream_to_rtd()
      ASoC: au1x: use asoc_substream_to_rtd()
      ASoC: bcm: use asoc_substream_to_rtd()
      ASoC: codecs: use asoc_substream_to_rtd()
      ASoC: generic: use asoc_substream_to_rtd()
      ASoC: sprd: use asoc_substream_to_rtd()
      ASoC: kirkwood: use asoc_substream_to_rtd()
      ASoC: xtensa: use asoc_substream_to_rtd()
      ASoC: mxs: use asoc_substream_to_rtd()
      ASoC: uniphier: use asoc_substream_to_rtd()
      ASoC: intel/boards: use asoc_substream_to_rtd()
      ASoC: intel: use asoc_substream_to_rtd()
      ASoC: dt-bindings: ak4613: switch to yaml base Documentation

Lad Prabhakar (1):
      dt-bindings: sound: renesas, rsnd: Document r8a774e1 bindings

Laurent Pinchart (1):
      ASoC: sh: Replace 'select' DMADEVICES 'with depends on'

Lee Jones (9):
      ASoC: codecs: jz4770: Remove defined but never used variable 'mic_boost_tlv'
      ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
      ASoC: sunxi: sun4i-spdif: Fix misspelling of 'reg_dac_txdata' in kernel-doc
      ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
      ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and 'reg_val_TSTDR'
      ASoC: codecs: rt5659: Remove many unused const variables
      ASoC: codecs: tlv320aic26: Demote seemingly unintentional kerneldoc header
      ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
      ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling of 'exists'

Liao Pingfang (1):
      ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()

Libin Yang (1):
      ASoC: Intel: common: change match table ehl-rt5660

Marcin Rajwa (2):
      ASoC: SOF: Intel: fix the suspend procedure to support s0ix entry
      ASoC: SOF: Intel: disable traces when switching to S0Ix D0I3

Mark Brown (51):
      Merge existing fixes from asoc/for-5.8
      Merge series "ASoC: soc-component: collect component functions" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: mediatek: mt6358: support DMIC one-wire mode" from Jiaxin Yu <jiaxin.yu@mediatek.com>:
      Merge series "ASoC: max98357a: support MAX98360A in OF" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: improve core dmesg logs and verbosity" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Intel: Add KeemBay ASoC platform driver" from Sia Jee Heng <jee.heng.sia@intel.com>:
      Merge series "ASoC: fsl_easrc: Fix several warnings" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge series "ASoC: merge snd_soc_component_read() and snd_soc_component_read32()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: add dailink .exit() callback" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.9" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge branch 'for-5.8' of https://git.kernel.org/.../broonie/sound into asoc-5.9
      Merge series "ASoC: ti: Add support for audio on J721e EVM" from Peter Ujfalusi <peter.ujfalusi@ti.com>:
      Merge series "ASoC: Intel: atom: fix kernel-doc and W=1 warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: codecs: wm/cs: fix kernel-doc and W=1 warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: rt5670: 2 small cleanups" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: fsl: fix kernel-doc" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: amd: remove warnings with make W=1" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: qdsp6: add gapless compressed audio support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: topology: fix error handling flow" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: mediatek: mt8183: support machine driver for rt1015" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: Clean-up W=1 build warnings​ - part1" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: codecs: add MAX98373 Soundwire driver" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: mediatek: mt8183-da7219: support machine driver for rt1015" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: fsl_spdif: Clear the validity bit for TX" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge series "ASoC: Clean-up W=1 build warnings​ - part2" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: mediatek: mt8183: support DP audio" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: sh: remove discriminatory terms" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: merge .digital_mute() into .mute_stream()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: fsl-asoc-card: Support hp and mic detection" from Shengjiu Wang <shengjiu.wang@nxp.com>:
      Merge series "ALSA: hda: export snd_hda_codec_cleanup()" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "Add support for SATA/PCIe/USB2[3]/VIN/CSI on R8A774E1" from Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>:
      Merge series "ASoC: merge .digital_mute() into .mute_stream()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.9" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.9" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Add ASoC AHUB components for Tegra210 and later" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.9" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Add ASoC AHUB components for Tegra210 and later" from Sameer Pujar <spujar@nvidia.com>:
      Merge series "SOF IMX fixes" from Daniel Baluta <daniel.baluta@oss.nxp.com> Daniel Baluta <daniel.baluta@nxp.com>:
      Merge series "ASoC: mediatek: mt8183: support machine driver for max98357b" from Tzung-Bi Shih <tzungbi@google.com>:
      Merge series "ASoC: add asoc_substream_to_rtd() macro" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: qcom: Use qcom_snd_parse_of() for apq8016_sbc" from Stephan Gerhold <stephan@gerhold.net>:
      Merge series "ASoC: intel: use asoc_substream_to_rtd()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "SOF Fixes for S0iX suspend/resume sequence" from Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:
      ASoC: ak4613: Undo conversion to YAML bindings
      Merge series "ASoC: meson: tdm fixes" from Jerome Brunet <jbrunet@baylibre.com>:
      Merge series "ASoC: meson: tdm fixes" from Jerome Brunet <jbrunet@baylibre.com>:
      Merge series "ASoC: Intel: KMB: TDM Enablement patches" from Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>:
      Merge series "drop unnecessary list_empty" from Julia Lawall <Julia.Lawall@inria.fr>:
      Merge series "ASoC: core: Two step component registration" from Cezary Rojewski <cezary.rojewski@intel.com>:
      Merge remote-tracking branch 'asoc/for-5.8' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.9' into asoc-next

Masahiro Yamada (2):
      ASoC: Convert UniPhier EVEA codec to json-schema
      ASoC: Convert UniPhier AIO audio system to json-schema

Masanari Iida (1):
      ASoC: samsung: Fix a typo in Kconfig

Michael Sit Wei Hong (2):
      ASoC: Intel: KMB: Add 8kHz audio support
      ASoC: Intel: KMB: Rework disable channel function

Nathan Chancellor (1):
      ASoC: Intel: KeemBay: Fix header guard

Naveen Manohar (2):
      ASoC: Intel: common: add match table for TGL MAX98373 + RT5682 SoundWire driver
      ASoC: Intel: sof_sdw: Add MAX98373 support

Peter Ujfalusi (3):
      ASoC: ti: davinci-mcasp: Specify stream_name for playback/capture
      ASoC: dt-bindings: Add documentation for TI j721e EVM (CPB and IVI)
      ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)

Pierre-Louis Bossart (62):
      ASoC: soc-core: reduce verbosity of BE override message
      ASoC: soc-pcm: improve error messages in soc_pcm_new()
      ASoC: soc-pcm/compress: reduce verbosity on mapping ok messages
      ASoC: Intel: byt*: simplify card names for SOF uses
      ASoC: Intel: cht*: simplify card names for SOF uses
      ASoC: Intel: broadwell: simplify card names for SOF uses
      ASoC: soc-link: introduce exit() callback
      ASoC: Intel: bdw-rt5677: fix module load/unload issues
      ASoC: Intel: kbl-rt5660: use .exit() dailink callback to release gpiod
      ASoC: SOF: nocodec: add missing .owner field
      ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
      ASoC: Intel: sof_sdw: add missing .owner field
      ASoC: Intel: bxt_rt298: add missing .owner field
      ASoC: Intel: sof_sdw: add quirk override with kernel parameter
      ASoC: Intel: boards: byt*.c: remove cast in dev_info quirk log
      ASoC: Intel: atom: fix kernel-doc
      ASoC: Intel: atom: fix 'defined but not used' warning
      ASoC: SOF: sof-acpi-dev: fix 'defined but unused' warning
      ASoC: codecs: cs4270: fix kernel-doc
      ASoC: codecs: cs42l42: remove always-true comparisons
      ASoC: codecs: wm8986: fix missing kernel-doc arguments
      ASoC: codecs: wm8960: fix kernel-doc
      ASoC: codecs: wm9713: remove spurious kernel-doc comment start
      ASoC: codecs: wm8994: fix kernel-doc
      ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc comment start
      ASoC: fsl: fsl_ssi: fix kernel-doc
      ASoC: fsl: fsl-asoc-card: fix kernel-doc
      ASoC: fsl: fsl_spdif: fix kernel-doc
      ASoC: fsl: fsl_asrc: fix kernel-doc
      ASoC: fsl: fsl_esai: fix kernel-doc
      ASoC: soc-ac97: fix kernel-doc
      ASoC: fsl: fsl_ssi: fix kernel-doc
      ASoC: fsl: fsl_asrc: fix kernel-doc
      ASoC: codecs: wm8400: remove unused variables
      ASoC: amd: acp-da7219-max98357a: fix 'defined but not used' warning
      ASoC: amd: acp-rt5645: fix 'defined but not used' warning
      ASoC: amd: raven: acp3x-pcm-dma: fix 'set but not used' warning
      ASoC: amd: raven: acp3x-i2s: fix 'set but not used' warning
      ASoC: amd: raven: acp3x-pcm-dma: remove unused-but-set variable
      ASoC: amd: raven: acp3x-i2s: remove unused-but-set variable
      ASoC: topology: use break on errors, not continue
      ASoC: topology: factor kfree(se) in error handling
      ASoC: topology: add more logs when topology load fails.
      ASoC: codecs: max98373: split I2C and common parts
      ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies
      ASoC: atmel: fix kernel-doc
      ASoC: samsung: spdif: fix kernel-doc
      ASoC: samsung: pcm: fix kernel-doc
      ASoC: tegra: tegra20_das: remove always-true comparison
      ASoC: uniphier: aio-core: fix kernel-doc
      ASoC: codecs: da7210: fix kernel-doc
      ASoC: codecs: da7219: fix 'defined but not used' warning
      ASoC: codecs: cros_ec_codec: fix 'defined but not used' warning
      ASoC: codecs: es8316: fix 'defined but not used' warning
      ASoC: codecs: max98390: fix 'defined but not used' warning
      ASoC: codecs: rt*: fix 'defined but not used' warning
      ASoC: sti: uniperif: fix 'defined by not used' warning
      ASoC: qcom: qdsp6: q6asm: Provide documentation for 'codec_profile'
      ASoC: sunxi: sun4i-i2s: add missing clock and format arguments in kernel-doc
      ASoC: codecs: rt5631: fix spurious kernel-doc start and missing arguments
      ASoC: Intel: sof_sdw_rt711: remove properties in card remove
      ASoC: core: use less strict tests for dailink capabilities

Qiushi Wu (3):
      ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt
      ASoC: img-parallel-out: Fix a reference count leak
      ASoC: tegra: Fix reference count leaks.

Randy Dunlap (5):
      ASoC: Documentation: fix reference to renamed source file
      ASoC: tegra20_das.h: delete duplicated words
      ASoC: wcd9335.h: fix duplicated word
      ASoC: soc-dai.h: drop a duplicated word
      ASoC: ti: fix SND_SOC_J721E_EVM warnings & errors

Ravulapati Vishnu vardhan rao (6):
      ASoC: amd: Removing unnecessary instance initialization
      ASoC: amd: Renaming snd-soc-card structure and fields
      ASoC: amd: Passing card structure based on codec
      ASoC: amd: Adding support for ALC1015 codec in machine driver
      ASoC: amd: Adding DAI LINK for rt1015 codec
      ASoC: amd: Added hw_params support for ALC1015

Rohit kumar (1):
      asoc: Update supported rate and format for dummy dai

Ryan Lee (1):
      ASoC: codecs: max98373: add SoundWire support

Sameer Pujar (8):
      ASoC: dt-bindings: tegra: Add DT bindings for Tegra210
      ASoC: tegra: Add support for CIF programming
      ASoC: tegra: Add Tegra210 based DMIC driver
      ASoC: tegra: Add Tegra210 based I2S driver
      ASoC: tegra: Add Tegra210 based AHUB driver
      ASoC: tegra: Add Tegra186 based DSPK driver
      ASoC: tegra: Add Tegra210 based ADMAIF driver
      ASoC: tegra: Fix build error due to 64-by-32 division

Sebastian Reichel (1):
      ASoC: da7213: add default clock handling

Seung-Woo Kim (1):
      ASoC: bcm2835: Silence clk_get() error on -EPROBE_DEFER

Shengjiu Wang (25):
      ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
      ASoC: fsl_easrc: Fix -Wunused-but-set-variable
      ASoC: fsl_easrc: Fix "Function parameter not described" warnings
      ASoC: bindings: wm8960: Add property for headphone detection
      ASoC: wm8960: Support headphone jack detection function
      ASoC: bindings: fsl-asoc-card: Add compatible string for MQS
      ASoC: fsl-asoc-card: Add MQS support
      ASoC: bindings: fsl_spdif: Add new compatible string for imx6sx
      ASoC: fsl_spdif: Add support for imx6sx platform
      ASoC: fsl_spdif: Add pm runtime function
      ASoC: fsl_easrc: Fix uninitialized scalar variable in fsl_easrc_set_ctx_format
      ASoC: fsl-asoc-card: Add WM8524 support
      ASoC: bindings: fsl-asoc-card: Add compatible string for wm8524
      ASoC: fsl_sai: Refine regcache usage with pm runtime
      ASoC: fsl_asrc: Add an option to select internal ratio mode
      ASoC: fsl_spdif: Clear the validity bit for TX
      ASoC: fsl_spdif: Add kctl for configuring TX validity bit
      ASoC: simple-card-utils: Support configure pin_name for asoc_simple_init_jack
      ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
      ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
      ASoC: soc-component: Add missed return for calling soc_component_ret
      ASoC: fsl_esai: add IRQF_SHARED for devm_request_irq
      ASoC: fsl-asoc-card: Support configuring dai fmt from DT
      ASoC: bindings: fsl-asoc-card: Support properties for configuring dai fmt
      ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK

Shuming Fan (2):
      ASoC: rt5682: disable MICBIAS and Vref2 widget in default
      ASoC: rt5682: optimize the power consumption

Sia Jee Heng (3):
      ASoC: Intel: Add KeemBay platform driver
      ASoC: Intel: Add makefiles and kconfig changes for KeemBay
      ASoC: Add documentation for KeemBay i2s

Simon Shields (1):
      ASoC: samsung: Add sound support for Midas boards

Srinivas Kandagatla (2):
      ASoC: q6asm: add command opcode to timeout error report
      ASoC: qdsp6: use dev_err instead of pr_err

Stephan Gerhold (8):
      ASoC: qcom: Use devm for resource management
      ASoC: qcom: common: Use snd_soc_dai_link_set_capabilities()
      ASoC: q6afe: Remove unused q6afe_is_rx_port() function
      ASoC: qcom: common: Support parsing links without DPCM
      ASoC: qcom: common: Parse properties with "qcom," prefix
      ASoC: qcom: apq8016_sbc: Use qcom_snd_parse_of()
      ASoC: qcom: common: Avoid printing errors for -EPROBE_DEFER
      ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX, TX, RX} defines

Steve Lee (5):
      dt-bindings: Added device tree binding for max98390
      ASoC: max98390: Add Amp init common setting func.
      ASoC: max98390: Fix dac event dapm mixer.
      ASoC: max98390: Update dsm init sequence and condition.
      ASoC: max98390: update dsm param bin max size

Sugar Zhang (1):
      ASoC: rockchip: spdif: Handle clk by pm runtime

Sylwester Nawrocki (1):
      ASoC: samsung: Document DT bindings for Midas sound subsystem

Tang Bin (2):
      ASoC: qcom: qdsp6: Use the defined variable to clean code
      ASoC: qcom: qdsp6: Use IS_ERR() instead of IS_ERR_OR_NULL()

Thierry Reding (1):
      ASoC: sgtl5000: Convert to json-schema

Tzung-Bi Shih (25):
      ASoC: max98357a: add compatible string for MAX98360A
      ASoC: dt-bindings: add compatible string for MAX98360A
      ASoC: mediatek: mt8183-da7219: set playback and capture constraints
      ASoC: core: move definition of enum snd_soc_bias_level
      ASoC: dapm: declare missing structure prototypes
      ASoC: rt1015: add missing header inclusion
      ASoC: mediatek: mt8183: sort header inclusions in alphabetical
      ASoC: mediatek: mt8183: support machine driver with rt1015
      ASoC: mt8183: add compatible string for using rt1015
      ASoC: mediatek: mt8183-da7219: sort header inclusions in alphabetical
      ASoC: mediatek: mt8183-da7219: remove forward declaration of headset_init
      ASoC: mediatek: mt8183-da7219: extract codec and DAI names
      ASoC: mediatek: mt8183-da7219: add compatible string for using rt1015
      ASoC: mediatek: mt8183-da7219: support machine driver with rt1015
      ASoC: dt-bindings: mt8183: add a property "mediatek, hdmi-codec"
      ASoC: mediatek: mt8183: use hdmi-codec
      ASoC: mediatek: mt8183: support HDMI jack reporting
      ASoC: dt-bindings: mt8183-da7219: add a property "mediatek, hdmi-codec"
      ASoC: mediatek: mt8183-da7219: use hdmi-codec
      ASoC: mediatek: mt8183-da7219: support HDMI jack reporting
      ASoC: max98357a: move control of SD_MODE back to DAI ops
      ASoC: mediatek: mt8183: support left justified format for I2S
      ASoC: dt-bindings: mt8183: add compatible string for using max98357b
      ASoC: mediatek: mt8183: support machine driver with max98357b
      ASoC: dapm: don't call pm_runtime_* on card device

Vijendar Mukunda (3):
      ASoC: amd: add logic to check dmic hardware runtime
      ASoC: amd: add ACPI dependency check
      ASoC: amd: fixed kernel warnings

Vlad Karpovich (1):
      ASoC: wm_adsp: Add controls for calibration and diagnostic FW

Wei Yongjun (1):
      ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()

Yong Zhi (2):
      ASoC: intel: sof_rt5682: Add support for jsl-max98360a-rt5682
      ASoC: intel: board: sof_rt5682: Update rt1015 pll input clk freq

derek.fang (3):
      ASoC: rl6231: Add new supports on rl6231
      ASoC: rt5682: Let PLL2 support the freq conversion for 44100Hz sample rate
      ASoC: rt5682: DAI wclk supports 44100 Hz output

randerwang (1):
      ASoC: Intel: sdw_max98373: add card_late_probe support

 .../devicetree/bindings/sound/adi,adau1977.txt     |   6 +-
 Documentation/devicetree/bindings/sound/ak4613.txt |  27 -
 .../devicetree/bindings/sound/ak4613.yaml          |  49 ++
 Documentation/devicetree/bindings/sound/ak4642.txt |  37 -
 .../devicetree/bindings/sound/ak4642.yaml          |  58 ++
 .../devicetree/bindings/sound/everest,es8316.txt   |  23 -
 .../devicetree/bindings/sound/everest,es8316.yaml  |  50 ++
 .../devicetree/bindings/sound/fsl,spdif.txt        |   6 +-
 .../devicetree/bindings/sound/fsl-asoc-card.txt    |  20 +-
 .../bindings/sound/intel,keembay-i2s.yaml          |  70 ++
 .../devicetree/bindings/sound/max98357a.txt        |  12 +-
 .../devicetree/bindings/sound/maxim,max98390.yaml  |  51 ++
 Documentation/devicetree/bindings/sound/mt6358.txt |   6 +
 .../bindings/sound/mt8183-da7219-max98357.txt      |   9 +-
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |   8 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  83 ++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 111 +++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 136 ++++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  83 ++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++
 .../devicetree/bindings/sound/qcom,q6asm.txt       |   9 +-
 .../devicetree/bindings/sound/renesas,fsi.yaml     |  19 +-
 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 .../bindings/sound/rockchip,rk3328-codec.txt       |  28 -
 .../bindings/sound/rockchip,rk3328-codec.yaml      |  69 ++
 .../devicetree/bindings/sound/rohm,bd28623.txt     |  29 -
 .../devicetree/bindings/sound/rohm,bd28623.yaml    |  67 ++
 .../bindings/sound/samsung,aries-wm8994.yaml       | 147 ++++
 .../bindings/sound/samsung,midas-audio.yaml        | 108 +++
 .../devicetree/bindings/sound/sgtl5000.txt         |  60 --
 .../devicetree/bindings/sound/sgtl5000.yaml        | 103 +++
 .../bindings/sound/socionext,uniphier-aio.yaml     |  81 ++
 .../bindings/sound/socionext,uniphier-evea.yaml    |  70 ++
 .../devicetree/bindings/sound/tas2552.txt          |   2 +-
 .../devicetree/bindings/sound/tas2562.txt          |   7 +-
 .../devicetree/bindings/sound/tas2562.yaml         |  69 ++
 .../devicetree/bindings/sound/tas2770.txt          |  37 -
 .../devicetree/bindings/sound/tas2770.yaml         |  76 ++
 .../devicetree/bindings/sound/tas5720.txt          |   6 +-
 .../bindings/sound/ti,j721e-cpb-audio.yaml         |  95 +++
 .../bindings/sound/ti,j721e-cpb-ivi-audio.yaml     | 150 ++++
 .../devicetree/bindings/sound/ti,tas6424.txt       |   2 +-
 .../devicetree/bindings/sound/tlv320adcx140.yaml   |  34 +-
 .../devicetree/bindings/sound/uniphier,aio.txt     |  45 --
 .../devicetree/bindings/sound/uniphier,evea.txt    |  26 -
 Documentation/devicetree/bindings/sound/wm8960.txt |  11 +
 Documentation/devicetree/bindings/sound/wm8994.txt |  23 +
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +-
 Documentation/sound/kernel-api/alsa-driver-api.rst |   2 +-
 Documentation/sound/soc/dai.rst                    |   2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |   4 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   7 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   6 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   7 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   6 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   7 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   6 +-
 drivers/gpu/drm/zte/zx_hdmi.c                      |   7 +-
 drivers/spi/spi-lantiq-ssc.c                       |   2 +-
 include/dt-bindings/sound/qcom,q6asm.h             |   4 +
 include/sound/hda_codec.h                          |   2 +
 include/sound/hdmi-codec.h                         |   6 +-
 include/sound/rt5670.h                             |  26 -
 include/sound/simple_card_utils.h                  |   6 +-
 include/sound/soc-component.h                      |  30 +-
 include/sound/soc-dai.h                            |  14 +-
 include/sound/soc-dapm.h                           |  20 +
 include/sound/soc-link.h                           |   1 +
 include/sound/soc.h                                |  34 +-
 include/sound/wm8960.h                             |  17 +
 sound/pci/hda/hda_codec.c                          |   3 +-
 sound/soc/Makefile                                 |   2 +-
 sound/soc/amd/Kconfig                              |   1 +
 sound/soc/amd/acp-da7219-max98357a.c               |  14 +-
 sound/soc/amd/acp-pcm-dma.c                        |   2 +-
 sound/soc/amd/acp-rt5645.c                         |   4 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               | 236 ++++--
 sound/soc/amd/raven/acp3x-i2s.c                    |  14 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |  12 +-
 sound/soc/amd/raven/pci-acp3x.c                    |  21 +-
 sound/soc/amd/renoir/rn-pci-acp3x.c                |  33 +
 sound/soc/amd/renoir/rn_acp3x.h                    |   2 +
 sound/soc/atmel/atmel-classd.c                     | 141 ++--
 sound/soc/atmel/atmel-pcm-dma.c                    |   6 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |   2 +-
 sound/soc/atmel/atmel-pdmic.c                      | 124 ++-
 sound/soc/atmel/atmel_ssc_dai.c                    |   1 +
 sound/soc/atmel/atmel_wm8904.c                     |   2 +-
 sound/soc/au1x/db1200.c                            |   2 +-
 sound/soc/au1x/dbdma2.c                            |   2 +-
 sound/soc/au1x/dma.c                               |   2 +-
 sound/soc/bcm/bcm2835-i2s.c                        |   9 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  12 +-
 sound/soc/bcm/cygnus-pcm.c                         |  16 +-
 sound/soc/cirrus/edb93xx.c                         |   2 +-
 sound/soc/cirrus/ep93xx-ac97.c                     |   2 +-
 sound/soc/cirrus/snappercl15.c                     |   2 +-
 sound/soc/codecs/88pm860x-codec.c                  |  22 +-
 sound/soc/codecs/Kconfig                           |  20 +-
 sound/soc/codecs/Makefile                          |   4 +
 sound/soc/codecs/ab8500-codec.c                    |  10 +-
 sound/soc/codecs/ad193x.c                          |   5 +-
 sound/soc/codecs/ad1980.c                          |   4 +-
 sound/soc/codecs/adau1701.c                        |   5 +-
 sound/soc/codecs/adau1761.c                        |   4 +-
 sound/soc/codecs/adau17x1.c                        |   4 +-
 sound/soc/codecs/adav80x.c                         |   2 +-
 sound/soc/codecs/ak4458.c                          |  13 +-
 sound/soc/codecs/ak4535.c                          |  10 +-
 sound/soc/codecs/ak4613.c                          |  10 +-
 sound/soc/codecs/ak4641.c                          |   8 +-
 sound/soc/codecs/ak4671.c                          |   8 +-
 sound/soc/codecs/alc5623.c                         |  11 +-
 sound/soc/codecs/alc5632.c                         |  11 +-
 sound/soc/codecs/arizona.c                         |  18 +-
 sound/soc/codecs/cpcap.c                           |  11 +-
 sound/soc/codecs/cq93vc.c                          |   5 +-
 sound/soc/codecs/cros_ec_codec.c                   |   2 +
 sound/soc/codecs/cs4265.c                          |   5 +-
 sound/soc/codecs/cs4270.c                          |  19 +-
 sound/soc/codecs/cs42l42.c                         |  16 +-
 sound/soc/codecs/cs42l51.c                         |  13 +-
 sound/soc/codecs/cs42l52.c                         |   5 +-
 sound/soc/codecs/cs42l56.c                         |   5 +-
 sound/soc/codecs/cs42l73.c                         |   4 +-
 sound/soc/codecs/cs42xx8.c                         |   5 +-
 sound/soc/codecs/cs4341.c                          |   5 +-
 sound/soc/codecs/cs4349.c                          |   5 +-
 sound/soc/codecs/cs47l15.c                         |  36 +-
 sound/soc/codecs/cs47l35.c                         |  58 +-
 sound/soc/codecs/cs47l85.c                         | 102 ++-
 sound/soc/codecs/cs47l90.c                         |  92 +--
 sound/soc/codecs/cs47l92.c                         |  96 +--
 sound/soc/codecs/da7210.c                          |  41 +-
 sound/soc/codecs/da7213.c                          | 112 ++-
 sound/soc/codecs/da7213.h                          |   2 +
 sound/soc/codecs/da7218.c                          |  34 +-
 sound/soc/codecs/da7219-aad.c                      |  16 +-
 sound/soc/codecs/da7219.c                          |  22 +-
 sound/soc/codecs/da732x.c                          |  18 +-
 sound/soc/codecs/da9055.c                          |  19 +-
 sound/soc/codecs/es8316.c                          |   7 +-
 sound/soc/codecs/es8328.c                          |   9 +-
 sound/soc/codecs/hdac_hda.c                        |  30 +-
 sound/soc/codecs/hdmi-codec.c                      |  27 +-
 sound/soc/codecs/inno_rk3036.c                     |   6 +-
 sound/soc/codecs/isabelle.c                        |  15 +-
 sound/soc/codecs/jz4770.c                          |   6 +-
 sound/soc/codecs/lm49453.c                         |  25 +-
 sound/soc/codecs/madera.c                          |  49 +-
 sound/soc/codecs/max98088.c                        |  24 +-
 sound/soc/codecs/max98090.c                        |  26 +-
 sound/soc/codecs/max98095.c                        |  16 +-
 sound/soc/codecs/max98357a.c                       |  51 +-
 sound/soc/codecs/max98373-i2c.c                    | 612 ++++++++++++++
 sound/soc/codecs/max98373-sdw.c                    | 887 ++++++++++++++++++++
 sound/soc/codecs/max98373-sdw.h                    |  72 ++
 sound/soc/codecs/max98373.c                        | 611 +-------------
 sound/soc/codecs/max98373.h                        |  17 +-
 sound/soc/codecs/max98390.c                        |  40 +-
 sound/soc/codecs/max98390.h                        |   2 +-
 sound/soc/codecs/max9850.c                         |   4 +-
 sound/soc/codecs/max9860.c                         |   2 +-
 sound/soc/codecs/max9867.c                         |   5 +-
 sound/soc/codecs/mc13783.c                         |   2 +-
 sound/soc/codecs/ml26124.c                         |   5 +-
 sound/soc/codecs/msm8916-wcd-analog.c              |  16 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |  16 +-
 sound/soc/codecs/mt6358.c                          |  23 +-
 sound/soc/codecs/nau8822.c                         |  11 +-
 sound/soc/codecs/pcm1681.c                         |   5 +-
 sound/soc/codecs/pcm1789.c                         |   5 +-
 sound/soc/codecs/pcm179x.c                         |   5 +-
 sound/soc/codecs/pcm186x-i2c.c                     |   2 +-
 sound/soc/codecs/pcm186x-spi.c                     |   2 +-
 sound/soc/codecs/pcm186x.c                         |   2 +-
 sound/soc/codecs/pcm186x.h                         |   2 +-
 sound/soc/codecs/pcm3168a.c                        |   5 +-
 sound/soc/codecs/pcm512x.c                         |   5 +-
 sound/soc/codecs/rk3328_codec.c                    |   5 +-
 sound/soc/codecs/rl6231.c                          |   2 +
 sound/soc/codecs/rt1011.c                          |  20 +-
 sound/soc/codecs/rt1015.c                          |  35 +-
 sound/soc/codecs/rt1015.h                          |   5 +
 sound/soc/codecs/rt1305.c                          |   2 +-
 sound/soc/codecs/rt274.c                           |   6 +-
 sound/soc/codecs/rt286.c                           |   2 +
 sound/soc/codecs/rt298.c                           |   4 +-
 sound/soc/codecs/rt5616.c                          |   2 +-
 sound/soc/codecs/rt5631.c                          |  40 +-
 sound/soc/codecs/rt5640.c                          |  14 +-
 sound/soc/codecs/rt5645.c                          |  16 +-
 sound/soc/codecs/rt5651.c                          |   6 +-
 sound/soc/codecs/rt5659.c                          |  51 +-
 sound/soc/codecs/rt5660.c                          |   4 +-
 sound/soc/codecs/rt5663.c                          |  34 +-
 sound/soc/codecs/rt5665.c                          |  16 +-
 sound/soc/codecs/rt5668.c                          |  16 +-
 sound/soc/codecs/rt5670.c                          |  93 +--
 sound/soc/codecs/rt5670.h                          |  16 +-
 sound/soc/codecs/rt5677-spi.c                      |   6 +-
 sound/soc/codecs/rt5677.c                          |   2 +-
 sound/soc/codecs/rt5682-i2c.c                      |   4 +-
 sound/soc/codecs/rt5682-sdw.c                      |   2 +-
 sound/soc/codecs/rt5682.c                          |  93 ++-
 sound/soc/codecs/rt5682.h                          |   4 +
 sound/soc/codecs/sgtl5000.c                        |  21 +-
 sound/soc/codecs/ssm2518.c                         |   5 +-
 sound/soc/codecs/ssm2602.c                         |   5 +-
 sound/soc/codecs/ssm4567.c                         |   5 +-
 sound/soc/codecs/sta32x.c                          |   6 +-
 sound/soc/codecs/sta350.c                          |   2 +-
 sound/soc/codecs/sta529.c                          |   5 +-
 sound/soc/codecs/tas2552.c                         |  13 +-
 sound/soc/codecs/tas2552.h                         |   2 +-
 sound/soc/codecs/tas2562.c                         | 166 +++-
 sound/soc/codecs/tas2562.h                         |   7 +-
 sound/soc/codecs/tas2770.c                         |  10 +-
 sound/soc/codecs/tas2770.h                         |   2 +-
 sound/soc/codecs/tas571x.c                         |   5 +-
 sound/soc/codecs/tas5720.c                         |  11 +-
 sound/soc/codecs/tas5720.h                         |   2 +-
 sound/soc/codecs/tas6424.c                         |   7 +-
 sound/soc/codecs/tas6424.h                         |   2 +-
 sound/soc/codecs/tda7419.c                         |   9 +-
 sound/soc/codecs/tfa9879.c                         |   5 +-
 sound/soc/codecs/tlv320adcx140.c                   | 124 ++-
 sound/soc/codecs/tlv320adcx140.h                   |  16 +-
 sound/soc/codecs/tlv320aic23.c                     |  21 +-
 sound/soc/codecs/tlv320aic26.c                     |  11 +-
 sound/soc/codecs/tlv320aic31xx.c                   |  13 +-
 sound/soc/codecs/tlv320aic31xx.h                   |   2 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  21 +-
 sound/soc/codecs/tlv320aic3x.c                     |  19 +-
 sound/soc/codecs/tpa6130a2.c                       |   2 +-
 sound/soc/codecs/tscs42xx.c                        |   4 +-
 sound/soc/codecs/tscs454.c                         |  24 +-
 sound/soc/codecs/twl6040.c                         |   5 +-
 sound/soc/codecs/uda134x.c                         |   5 +-
 sound/soc/codecs/wcd-clsh-v2.c                     |   2 +-
 sound/soc/codecs/wcd9335.c                         |  48 +-
 sound/soc/codecs/wcd9335.h                         |   6 +-
 sound/soc/codecs/wcd934x.c                         |  52 +-
 sound/soc/codecs/wm0010.c                          |   4 +-
 sound/soc/codecs/wm2200.c                          |   4 +-
 sound/soc/codecs/wm5100.c                          |  18 +-
 sound/soc/codecs/wm5110.c                          |   6 +-
 sound/soc/codecs/wm8350.c                          |  37 +-
 sound/soc/codecs/wm8400.c                          |  67 +-
 sound/soc/codecs/wm8510.c                          |  33 +-
 sound/soc/codecs/wm8523.c                          |   6 +-
 sound/soc/codecs/wm8580.c                          |  17 +-
 sound/soc/codecs/wm8711.c                          |  13 +-
 sound/soc/codecs/wm8728.c                          |  15 +-
 sound/soc/codecs/wm8731.c                          |  11 +-
 sound/soc/codecs/wm8741.c                          |   5 +-
 sound/soc/codecs/wm8750.c                          |  13 +-
 sound/soc/codecs/wm8753.c                          |  56 +-
 sound/soc/codecs/wm8770.c                          |   7 +-
 sound/soc/codecs/wm8776.c                          |   7 +-
 sound/soc/codecs/wm8804.c                          |   2 +-
 sound/soc/codecs/wm8900.c                          |  27 +-
 sound/soc/codecs/wm8903.c                          |  27 +-
 sound/soc/codecs/wm8904.c                          |  25 +-
 sound/soc/codecs/wm8940.c                          |  37 +-
 sound/soc/codecs/wm8955.c                          |   9 +-
 sound/soc/codecs/wm8958-dsp2.c                     |  18 +-
 sound/soc/codecs/wm8960.c                          |  49 +-
 sound/soc/codecs/wm8961.c                          |  65 +-
 sound/soc/codecs/wm8962.c                          |  49 +-
 sound/soc/codecs/wm8971.c                          |  13 +-
 sound/soc/codecs/wm8974.c                          |  29 +-
 sound/soc/codecs/wm8978.c                          |  17 +-
 sound/soc/codecs/wm8983.c                          |  15 +-
 sound/soc/codecs/wm8985.c                          |  15 +-
 sound/soc/codecs/wm8988.c                          |  17 +-
 sound/soc/codecs/wm8990.c                          |  23 +-
 sound/soc/codecs/wm8991.c                          |  45 +-
 sound/soc/codecs/wm8993.c                          |  37 +-
 sound/soc/codecs/wm8994.c                          |  77 +-
 sound/soc/codecs/wm8995.c                          |  26 +-
 sound/soc/codecs/wm8996.c                          |  35 +-
 sound/soc/codecs/wm8998.c                          |   8 +-
 sound/soc/codecs/wm9081.c                          |  43 +-
 sound/soc/codecs/wm9090.c                          |   4 +-
 sound/soc/codecs/wm9713.c                          |   4 +-
 sound/soc/codecs/wm_adsp.c                         |  11 +-
 sound/soc/codecs/wm_hubs.c                         |  30 +-
 sound/soc/codecs/wmfw.h                            |   1 +
 sound/soc/dwc/dwc-pcm.c                            |   2 +-
 sound/soc/fsl/Kconfig                              |   1 +
 sound/soc/fsl/eukrea-tlv320.c                      |   2 +-
 sound/soc/fsl/fsl-asoc-card.c                      | 216 ++++-
 sound/soc/fsl/fsl_asrc.c                           | 103 ++-
 sound/soc/fsl/fsl_asrc_dma.c                       |   4 +-
 sound/soc/fsl/fsl_audmix.c                         |  10 +-
 sound/soc/fsl/fsl_dma.c                            |   2 +-
 sound/soc/fsl/fsl_easrc.c                          |  49 +-
 sound/soc/fsl/fsl_esai.c                           |  34 +-
 sound/soc/fsl/fsl_sai.c                            |   8 +-
 sound/soc/fsl/fsl_sai.h                            |   2 +-
 sound/soc/fsl/fsl_spdif.c                          | 233 ++++--
 sound/soc/fsl/fsl_ssi.c                            |  78 +-
 sound/soc/fsl/fsl_ssi_dbg.c                        |   4 +-
 sound/soc/fsl/imx-audmix.c                         |  10 +-
 sound/soc/fsl/imx-audmux.c                         |   2 +-
 sound/soc/fsl/imx-mc13783.c                        |   2 +-
 sound/soc/fsl/mpc5200_dma.c                        |   8 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |   2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   4 +-
 sound/soc/fsl/mx27vis-aic32x4.c                    |   2 +-
 sound/soc/fsl/p1022_ds.c                           |   2 +-
 sound/soc/fsl/p1022_rdk.c                          |   2 +-
 sound/soc/fsl/wm1133-ev1.c                         |   2 +-
 sound/soc/generic/simple-card-utils.c              |  13 +-
 sound/soc/img/img-i2s-in.c                         |   4 +-
 sound/soc/img/img-parallel-out.c                   |   4 +-
 sound/soc/intel/Kconfig                            |   7 +
 sound/soc/intel/Makefile                           |   1 +
 sound/soc/intel/atom/sst-atom-controls.c           |  65 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |   6 +-
 sound/soc/intel/atom/sst/sst_loader.c              |  14 +-
 sound/soc/intel/atom/sst/sst_stream.c              |  43 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |  16 +-
 sound/soc/intel/boards/Kconfig                     |  15 +-
 sound/soc/intel/boards/Makefile                    |   2 +
 sound/soc/intel/boards/bdw-rt5650.c                |  14 +-
 sound/soc/intel/boards/bdw-rt5677.c                |  34 +-
 sound/soc/intel/boards/broadwell.c                 |  14 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      | 117 ++-
 sound/soc/intel/boards/bxt_rt298.c                 |   4 +-
 sound/soc/intel/boards/byt-rt5640.c                |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |  12 +-
 sound/soc/intel/boards/bytcht_da7213.c             |  16 +-
 sound/soc/intel/boards/bytcht_es8316.c             |  17 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  18 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |  18 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |  14 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |  14 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |  19 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |  32 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         | 102 +--
 sound/soc/intel/boards/ehl_rt5660.c                |   2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   2 +-
 sound/soc/intel/boards/haswell.c                   |   2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   8 +-
 sound/soc/intel/boards/kbl_rt5660.c                |  19 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |   4 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  45 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h        |   1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |  17 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |   2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |   2 +-
 sound/soc/intel/boards/skl_rt286.c                 |   2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |   2 +-
 sound/soc/intel/boards/sof_maxim_common.c          |  57 +-
 sound/soc/intel/boards/sof_maxim_common.h          |   3 +
 sound/soc/intel/boards/sof_pcm512x.c               |   4 +-
 sound/soc/intel/boards/sof_rt5682.c                |  69 +-
 sound/soc/intel/boards/sof_sdw.c                   | 103 ++-
 sound/soc/intel/boards/sof_sdw_common.h            |  17 +
 sound/soc/intel/boards/sof_sdw_hdmi.c              |   6 +
 sound/soc/intel/boards/sof_sdw_max98373.c          |  86 ++
 sound/soc/intel/boards/sof_sdw_rt1308.c            |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |  17 +-
 sound/soc/intel/boards/sof_wm8804.c                |   2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |  13 +
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |   2 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |  13 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |  25 +
 sound/soc/intel/haswell/sst-haswell-pcm.c          |  12 +-
 sound/soc/intel/keembay/Makefile                   |   4 +
 sound/soc/intel/keembay/kmb_platform.c             | 668 +++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h             | 146 ++++
 sound/soc/intel/skylake/skl-pcm.c                  |  16 +-
 sound/soc/intel/skylake/skl-topology.c             |   5 +-
 sound/soc/intel/skylake/skl-topology.h             |   2 +-
 sound/soc/kirkwood/armada-370-db.c                 |   2 +-
 sound/soc/mediatek/Kconfig                         |  12 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |  12 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |   2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |   2 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |   2 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |   4 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   2 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   4 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 321 ++++++--
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |  59 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        | 230 +++++-
 sound/soc/meson/Kconfig                            |   1 +
 sound/soc/meson/aiu-encoder-i2s.c                  |   3 +-
 sound/soc/meson/aiu-fifo-i2s.c                     |   3 +-
 sound/soc/meson/aiu-fifo.c                         |   3 +-
 sound/soc/meson/axg-card.c                         |  22 +-
 sound/soc/meson/axg-spdifout.c                     |   5 +-
 sound/soc/meson/axg-tdm-formatter.c                |  11 +-
 sound/soc/meson/axg-tdm-formatter.h                |   1 -
 sound/soc/meson/axg-tdm-interface.c                |  26 +-
 sound/soc/meson/axg-tdmin.c                        |  16 +-
 sound/soc/meson/axg-tdmout.c                       |   3 -
 sound/soc/meson/gx-card.c                          |  20 +-
 sound/soc/meson/meson-card-utils.c                 |   8 +-
 sound/soc/meson/meson-codec-glue.c                 |   2 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |   2 +-
 sound/soc/pxa/brownstone.c                         |   2 +-
 sound/soc/pxa/corgi.c                              |   4 +-
 sound/soc/pxa/hx4700.c                             |   2 +-
 sound/soc/pxa/imote2.c                             |   2 +-
 sound/soc/pxa/magician.c                           |   6 +-
 sound/soc/pxa/mioa701_wm9713.c                     |   8 +-
 sound/soc/pxa/mmp-pcm.c                            |   2 +-
 sound/soc/pxa/poodle.c                             |   4 +-
 sound/soc/pxa/pxa-ssp.c                            |   2 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   2 +-
 sound/soc/pxa/spitz.c                              |   4 +-
 sound/soc/pxa/tosa.c                               |   2 +-
 sound/soc/pxa/z2.c                                 |   2 +-
 sound/soc/pxa/zylonite.c                           |   2 +-
 sound/soc/qcom/Kconfig                             |   5 +-
 sound/soc/qcom/apq8016_sbc.c                       | 120 +--
 sound/soc/qcom/apq8096.c                           |  30 +-
 sound/soc/qcom/common.c                            |  58 +-
 sound/soc/qcom/lpass-platform.c                    |  14 +-
 sound/soc/qcom/qdsp6/q6adm.c                       |   7 +-
 sound/soc/qcom/qdsp6/q6afe.c                       |   8 -
 sound/soc/qcom/qdsp6/q6afe.h                       |   1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  36 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   6 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |   2 +-
 sound/soc/qcom/sdm845.c                            |  54 +-
 sound/soc/qcom/storm.c                             |   2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |   2 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |  25 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   2 +-
 sound/soc/rockchip/rockchip_max98090.c             |   2 +-
 sound/soc/rockchip/rockchip_rt5645.c               |   2 +-
 sound/soc/rockchip/rockchip_spdif.c                |  59 +-
 sound/soc/samsung/Kconfig                          |  23 +-
 sound/soc/samsung/Makefile                         |   4 +
 sound/soc/samsung/aries_wm8994.c                   | 695 ++++++++++++++++
 sound/soc/samsung/arndale.c                        |   4 +-
 sound/soc/samsung/h1940_uda1380.c                  |   2 +-
 sound/soc/samsung/i2s.c                            |   2 +-
 sound/soc/samsung/jive_wm8750.c                    |   2 +-
 sound/soc/samsung/littlemill.c                     |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 543 +++++++++++++
 sound/soc/samsung/neo1973_wm8753.c                 |   8 +-
 sound/soc/samsung/odroid.c                         |   6 +-
 sound/soc/samsung/pcm.c                            |   9 +-
 sound/soc/samsung/rx1950_uda1380.c                 |   2 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |   2 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |   2 +-
 sound/soc/samsung/s3c24xx_uda134x.c                |   6 +-
 sound/soc/samsung/smartq_wm8987.c                  |   2 +-
 sound/soc/samsung/smdk_spdif.c                     |   2 +-
 sound/soc/samsung/smdk_wm8580.c                    |   2 +-
 sound/soc/samsung/smdk_wm8994.c                    |   2 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |   2 +-
 sound/soc/samsung/snow.c                           |   2 +-
 sound/soc/samsung/spdif.c                          |  12 +-
 sound/soc/samsung/tm2_wm5110.c                     |   8 +-
 sound/soc/sh/Kconfig                               |   2 +-
 sound/soc/sh/dma-sh7760.c                          |  12 +-
 sound/soc/sh/fsi.c                                 |   6 +-
 sound/soc/sh/migor.c                               |   4 +-
 sound/soc/sh/rcar/core.c                           |   8 +-
 sound/soc/sh/rcar/rsnd.h                           |   2 +-
 sound/soc/sh/rcar/ssi.c                            |  28 +-
 sound/soc/sh/rcar/ssiu.c                           |   6 +-
 sound/soc/sh/siu_pcm.c                             |   6 +-
 sound/soc/sh/ssi.c                                 |   2 +-
 sound/soc/soc-ac97.c                               |   9 +-
 sound/soc/soc-component.c                          | 670 ++++++++++-----
 sound/soc/soc-compress.c                           |   4 +-
 sound/soc/soc-core.c                               | 158 ++--
 sound/soc/soc-dai.c                                |  36 +-
 sound/soc/soc-dapm.c                               |  41 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |  18 +-
 sound/soc/soc-io.c                                 | 202 -----
 sound/soc/soc-link.c                               |  18 +-
 sound/soc/soc-ops.c                                |  43 +-
 sound/soc/soc-pcm.c                                | 232 +++---
 sound/soc/soc-topology.c                           |  73 +-
 sound/soc/soc-utils.c                              |   5 +-
 sound/soc/sof/imx/imx8.c                           |  24 +-
 sound/soc/sof/imx/imx8m.c                          |   7 +-
 sound/soc/sof/intel/hda-dai.c                      |  10 +-
 sound/soc/sof/intel/hda-dsp.c                      |  50 +-
 sound/soc/sof/intel/hda-pcm.c                      |   2 +-
 sound/soc/sof/nocodec.c                            |   1 +
 sound/soc/sof/pcm.c                                |  26 +-
 sound/soc/sof/sof-acpi-dev.c                       |   8 +-
 sound/soc/sof/topology.c                           |   2 +
 sound/soc/spear/spdif_out.c                        |   8 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |   2 +-
 sound/soc/sti/uniperif.h                           |   2 +-
 sound/soc/stm/stm32_adfsdm.c                       |  21 +-
 sound/soc/stm/stm32_sai_sub.c                      |   2 +-
 sound/soc/sunxi/sun4i-codec.c                      |  12 +-
 sound/soc/sunxi/sun4i-i2s.c                        |  10 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   4 +-
 sound/soc/tegra/Kconfig                            |  56 ++
 sound/soc/tegra/Makefile                           |  10 +
 sound/soc/tegra/tegra186_dspk.c                    | 442 ++++++++++
 sound/soc/tegra/tegra186_dspk.h                    |  70 ++
 sound/soc/tegra/tegra20_das.c                      |   3 +-
 sound/soc/tegra/tegra20_das.h                      |   4 +-
 sound/soc/tegra/tegra210_admaif.c                  | 800 ++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 162 ++++
 sound/soc/tegra/tegra210_ahub.c                    | 676 ++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h                    | 127 +++
 sound/soc/tegra/tegra210_dmic.c                    | 456 +++++++++++
 sound/soc/tegra/tegra210_dmic.h                    |  82 ++
 sound/soc/tegra/tegra210_i2s.c                     | 812 +++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h                     | 126 +++
 sound/soc/tegra/tegra30_ahub.c                     |   4 +-
 sound/soc/tegra/tegra30_i2s.c                      |   4 +-
 sound/soc/tegra/tegra_alc5632.c                    |   2 +-
 sound/soc/tegra/tegra_cif.h                        |  65 ++
 sound/soc/tegra/tegra_max98090.c                   |   2 +-
 sound/soc/tegra/tegra_pcm.c                        | 235 +++++-
 sound/soc/tegra/tegra_pcm.h                        |  21 +-
 sound/soc/tegra/tegra_rt5640.c                     |   2 +-
 sound/soc/tegra/tegra_rt5677.c                     |   2 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   2 +-
 sound/soc/tegra/tegra_wm8753.c                     |   2 +-
 sound/soc/tegra/tegra_wm8903.c                     |   2 +-
 sound/soc/tegra/trimslice.c                        |   2 +-
 sound/soc/ti/Kconfig                               |   9 +
 sound/soc/ti/Makefile                              |   2 +
 sound/soc/ti/ams-delta.c                           |   9 +-
 sound/soc/ti/davinci-evm.c                         |   6 +-
 sound/soc/ti/davinci-mcasp.c                       |   3 +
 sound/soc/ti/davinci-vcif.c                        |   4 +-
 sound/soc/ti/j721e-evm.c                           | 896 +++++++++++++++++++++
 sound/soc/ti/n810.c                                |   4 +-
 sound/soc/ti/omap-abe-twl6040.c                    |   4 +-
 sound/soc/ti/omap-hdmi.c                           |   2 +-
 sound/soc/ti/omap-mcbsp-st.c                       |   3 -
 sound/soc/ti/omap-mcbsp.c                          |   4 +-
 sound/soc/ti/omap-twl4030.c                        |   4 +-
 sound/soc/ti/omap3pandora.c                        |   2 +-
 sound/soc/ti/osk5912.c                             |   2 +-
 sound/soc/ti/rx51.c                                |   4 +-
 sound/soc/ti/sdma-pcm.c                            |   2 +-
 sound/soc/ti/sdma-pcm.h                            |   2 +-
 sound/soc/ti/udma-pcm.c                            |   2 +-
 sound/soc/ti/udma-pcm.h                            |   2 +-
 sound/soc/uniphier/aio-core.c                      |   7 +-
 sound/soc/uniphier/aio-dma.c                       |   6 +-
 sound/soc/ux500/mop500_ab8500.c                    |   8 +-
 sound/soc/ux500/ux500_msp_i2s.c                    |   8 +-
 sound/soc/ux500/ux500_pcm.c                        |   2 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   2 +-
 560 files changed, 16469 insertions(+), 4906 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4613.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ak4613.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4642.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ak4642.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.txt
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98390.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2770.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2770.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/uniphier,aio.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/uniphier,evea.txt
 delete mode 100644 include/sound/rt5670.h
 create mode 100644 sound/soc/codecs/max98373-i2c.c
 create mode 100644 sound/soc/codecs/max98373-sdw.c
 create mode 100644 sound/soc/codecs/max98373-sdw.h
 create mode 100644 sound/soc/intel/boards/sof_sdw_max98373.c
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h
 create mode 100644 sound/soc/samsung/aries_wm8994.c
 create mode 100644 sound/soc/samsung/midas_wm1811.c
 delete mode 100644 sound/soc/soc-io.c
 create mode 100644 sound/soc/tegra/tegra186_dspk.c
 create mode 100644 sound/soc/tegra/tegra186_dspk.h
 create mode 100644 sound/soc/tegra/tegra210_admaif.c
 create mode 100644 sound/soc/tegra/tegra210_admaif.h
 create mode 100644 sound/soc/tegra/tegra210_ahub.c
 create mode 100644 sound/soc/tegra/tegra210_ahub.h
 create mode 100644 sound/soc/tegra/tegra210_dmic.c
 create mode 100644 sound/soc/tegra/tegra210_dmic.h
 create mode 100644 sound/soc/tegra/tegra210_i2s.c
 create mode 100644 sound/soc/tegra/tegra210_i2s.h
 create mode 100644 sound/soc/tegra/tegra_cif.h
 create mode 100644 sound/soc/ti/j721e-evm.c
