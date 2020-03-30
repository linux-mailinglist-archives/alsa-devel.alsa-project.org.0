Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939A197AE6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 13:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8BA9166D;
	Mon, 30 Mar 2020 13:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8BA9166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585568160;
	bh=j1t6r0PMbEgkNniG/ufTTacqasfWYGdrbjVY89Hn/A4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FZLdUPxHlTUTbbsjfw96t6RX8/VbYzDVE2BStEp58NrROLWzk4tlYP2cY1+w//35c
	 vmU291sUE5JRvyBfPF81lcaxYiPyJd9uDGv/9WwVb//puoRE4778GQWWC8Uaw/ODBn
	 ZeZDfIS3HgTVUvRbtTo5cbbFSdu81oATmhNXNGGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E52BDF800AA;
	Mon, 30 Mar 2020 13:34:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3619FF80148; Mon, 30 Mar 2020 13:34:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 07A9FF800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A9FF800EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD63B31B;
 Mon, 30 Mar 2020 04:34:07 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA12B3F52E;
 Mon, 30 Mar 2020 04:34:06 -0700 (PDT)
Date: Mon, 30 Mar 2020 12:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.7
Message-ID: <20200330113404.GE4792@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
Content-Disposition: inline
X-Cookie: Ahead warp factor one, Mr. Sulu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.7

for you to fetch changes up to 1c521d7e62262793789845989edca57dea24eb7d:

  Merge branch 'asoc-5.7' into asoc-next (2020-03-27 17:29:20 +0000)

----------------------------------------------------------------
ASoC: Updates for v5.7

This is a very big update for the core since Morimoto-san has been
rather busy continuing his refactorings to clean up a lot of the cruft
that we have accumilated over the years.  We've also gained several new
drivers, including initial (but still not complete) parts of the Intel
SoundWire support.

 - Lots of refactorings to modernize the code from Morimoto-san.
 - Conversion of SND_SOC_ALL_CODECS to use imply from Geert Uytterhoeven.
 - Continued refactoring and fixing of the Intel support.
 - Soundwire and more advanced clocking support for Realtek RT5682.
 - Support for amlogic GX, Meson 8, Meson 8B and T9015 DAC, Broadcom
   DSL/PON, Ingenic JZ4760 and JZ4770, Realtek RL6231, and TI TAS2563 and
   TLV320ADCX140.

----------------------------------------------------------------
Akshu Agrawal (4):
      ASoC: amd: Add machine driver for Raven based platform
      ASoC: amd: Allow I2S wake event after ACP is powerd On
      ASoc: amd: Add DMIC switch capability to machine driver
      ASoC: amd: Fix compile warning of argument type

Amadeusz S=C5=82awi=C5=84ski (1):
      ASoC: topology: Perform component check upfront

Amery Song (2):
      ASoC: SOF: Intel: hda: remove unnecessary ROM IPC filter function
      ASoC: SOF: Intel: remove unnecessary waitq before loading firmware

Baolin Wang (1):
      ASoC: sprd: Allow the MCDT driver to build into modules

Bard Liao (5):
      ASoC: Return error if the function does not support multi-cpu
      ASoC: pcm: check if cpu-dai supports a given stream
      ASoC: SOF: Intel: hda-dai: add stream capability
      ASoC: SOF: topology: connect dai widget to all cpu-dais
      ASoC: SOF: Intel: hda: merge IPC, stream and SoundWire interrupt hand=
lers

Benjamin Gaignard (1):
      ASoC: Convert cirrus,cs42l51 to json-schema

Cezary Rojewski (20):
      ALSA: core: Expand DMA buffer information
      ALSA: core: Implement compress page allocation and free routines
      ASoC: SOF: Intel: Account for compress streams when servicing IRQs
      ASoC: SOF: Implement Probe IPC API
      ASoC: SOF: Generic probe compress operations
      ASoC: SOF: Intel: Expose SDnFMT helpers
      ASoC: SOF: Intel: Probe compress operations
      ASoC: SOF: Provide probe debugfs support
      ASoC: SOF: Intel: Add Probe compress CPU DAIs
      ASoC: SOF: Fix probe point getter
      ASoC: Intel: Skylake: Remove superfluous chip initialization
      ASoC: Intel: Skylake: Select hda configuration permissively
      ASoC: Intel: Skylake: Enable codec wakeup during chip init
      ASoC: Intel: Skylake: Shield against no-NHLT configurations
      ASoC: Intel: Allow for ROM init retry on CNL platforms
      ASoC: Intel: Skylake: Await purge request ack on CNL
      ASoC: SOF: Intel: Fix stream cleanup on hw free
      ASoC: Intel: broadwell: Revert back SSP0 link to use dummy components
      ASoC: Intel: bdw-rt5677: Revert SSP0 link to use dummy components
      ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy components

Charles Keepax (1):
      ASoC: samsung: Update dependencies for Arizona machine drivers

Colin Ian King (6):
      ASoC: Intel: mrfld: return error codes when an error occurs
      ASoC: rt5659: remove redundant assignment to variable idx
      ASoC: ti: davinci-mcasp: remove redundant assignment to variable ret
      ASoC: Intel: mrfld: fix incorrect check on p->sink
      ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned
      ASoC: amd: acp3x-pcm-dma: clean up two indentation issues

Curtis Malainey (1):
      ASoC: Intel: Make glk+rt5682 echo ref dynamic

Dafna Hirschfeld (1):
      dt-bindings: Convert the binding file google, cros-ec-codec.txt to ya=
ml format.

Dan Murphy (10):
      ASoC: tas2562: Add support for ISENSE and VSENSE
      dt-bindings: sound: Add TLV320ADCx140 dt bindings
      ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family
      ASoC: tas2562: Add support for digital volume control
      ASoC: tlv320adcx140: Add DRE and AGC support
      ASoC: tlv320adcx140: Add decimation filter support
      ASoC: dt-bindings: Add TAS2563 compatible to the TAS2562 binding
      ASoC: tas2562: Add entries for the TAS2563 audio amplifier
      ASoC: tlv320adcx140: Fix mic_bias and vref device tree verification
      ASoC: tlv320adcx140: Remove undocumented property

Derek Fang (3):
      ASoC: rl6231: Add new supports on rl6231
      ASoC: rt5682: Add CCF usage for providing I2S clks
      ASoC: rt5682: Add DAI clock binding info for WCLK/BCLK CCF usage

Dmitry Osipenko (2):
      ASoC: tegra: tegra_wm8903: Support DAPM events for built-in microphone
      ASoC: tegra-wm8903: Document built-in microphone audio source

Enric Balletbo i Serra (1):
      ASoC: amd: AMD RV RT5682 should depends on CROS_EC

Geert Uytterhoeven (7):
      spi: pxa2xx: Enable support for compile-testing
      ASoC: Use imply for SND_SOC_ALL_CODECS
      ASoC: sh: fsi: Restore devm_ioremap() alignment
      ASoC: Fix SND_SOC_ALL_CODECS imply SPI fallout
      ASoC: Fix SND_SOC_ALL_CODECS imply I2C fallout
      ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout
      ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout

Guennadi Liakhovetski (7):
      ASoC: (cosmetic) simplify dpcm_prune_paths()
      ASoC: export DPCM runtime update functions
      ASoC: codecs: hdac_hdmi: (cosmetic) remove redundant variable initial=
isations
      ASoC: Intel: skylake: (cosmetic) remove redundant variable initialisa=
tions
      ASoC: Intel: (cosmetic) simplify structure member access
      ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()
      ASoC: SOF: fix uninitialised "work" with VirtIO

Gustavo A. R. Silva (1):
      ASoC: wm0010: Replace zero-length array with flexible-array member

Jack Yu (2):
      ASoC: rt1015: fix typo for bypass boost control
      ASoC: rt1015: modify some structure to be static.

James Schulman (1):
      MAINTAINERS: Update Cirrus Logic codec driver maintainers

Jaska Uimonen (1):
      ASoC: SOF: ipc: check ipc return value before data copy

Jeff Chang (1):
      ASoC: MT6660 update to 1.0.8_G

Jerome Brunet (23):
      ASoC: core: allow a dt node to provide several components
      ASoC: meson: g12a: extract codec-to-codec utils
      ASoC: meson: aiu: add audio output dt-bindings
      ASoC: meson: aiu: add i2s and spdif support
      ASoC: meson: aiu: add hdmi codec control support
      ASoC: meson: aiu: add internal dac codec control support
      ASoC: meson: axg: extract sound card utils
      ASoC: meson: gx: add sound card dt-binding documentation
      ASoC: meson: gx: add sound card support
      ASoC: core: ensure component names are unique
      ASoC: meson: aiu: remove unused encoder structure
      ASoC: meson: aiu: fix clk bulk size allocation
      ASoC: meson: aiu: fix irq registration
      ASoC: meson: aiu: fix acodec dai input name init
      ASoC: meson: codec-glue: fix pcm format cast warning
      ASoC: meson: aiu: simplify component addition
      ASoC: fix card registration regression.
      ASoC: meson: add t9015 internal codec binding documentation
      ASoC: meson: add t9015 internal DAC driver
      ASoC: dpcm: remove confusing trace in dpcm_get_be()
      ASoC: meson: g12a: add toacodec dt-binding documentation
      ASoC: meson: g12a: add internal DAC glue driver
      ASoC: meson: axg-card: add toacodec support

Johan Jonker (2):
      dt-bindings: sound: convert rockchip i2s bindings to yaml
      dt-bindings: sound: rockchip-i2s: add #sound-dai-cells property

Jonghwan Choi (1):
      ASoC: tas2562: Fixed incorrect amp_level setting.

Kai Vehmanen (10):
      ASoC: intel/skl/hda - add no-HDMI cases to generic HDA driver
      ASoC: SOF: Intel: hda: allow operation without i915 gfx
      ASoC: soc-pcm: fix state tracking error in snd_soc_component_open/clo=
se()
      MAINTAINERS: add entry for Sound Open Firmware drivers
      ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_HDMI
      ASoC: Intel: sof_pcm512x: drop reverse deps for SND_HDA_CODEC_HDMI
      ASoC: Intel: sof_pcm512x: make HDMI optional for all platforms
      ASoC: SOF: Intel: hda: remove SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
      ASoC: SOF: Intel: hda: do not leave clock gating off upon error
      ASoC: SOF: Intel: hda: call codec wake at chip init

Karol Trzcinski (2):
      ASoC: SOF: Make sof_ipc_ext_data enum more rigid
      ASoC: SOF: Remove SOF_IPC_EXT_DMA_BUFFER

Kevin Li (2):
      ASoC: brcm: Add DSL/PON SoC audio driver
      ASoC: brcm: DSL/PON SoC device tree bindings of audio driver

Keyon Jie (2):
      ASoC: SOF: pcm: skip DMA buffer pre-allocation
      ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after FW_PURGE do=
ne

Kuninori Morimoto (95):
      ASoC: soc-pcm: add snd_soc_runtime_action()
      ASoC: soc-pcm: adjustment for DAI member 0 reset
      ASoC: soc-pcm: add for_each_dapm_widgets() macro
      ASoC: soc-pcm: don't use bit-OR'ed error
      ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once
      ASoC: soc-pcm: call snd_soc_component_open/close() once
      ASoC: soc-pcm: move soc_pcm_close() next to soc_pcm_open()
      ASoC: soc-pcm: tidyup soc_pcm_open() order
      ASoC: soc-pcm: move dai_get_widget()
      ASoC: soc-pcm: use dai_get_widget() at dpcm_get_be()
      ASoC: soc-pcm: use dai_get_widget() at dpcm_end_walk_at_be()
      ASoC: soc-pcm: use dpcm_get_be() at dpcm_end_walk_at_be()
      ASoC: soc-pcm: remove soc_dpcm_be_digital_mute()
      ASoC: soc-pcm: remove snd_soc_dpcm_be_get/set_state()
      ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate code
      ASoC: soc-pcm: use goto and remove multi return
      ASoC: soc-pcm: merge playback/cature_active into stream_active
      ALSA: pcm.h: add for_each_pcm_streams()
      ASoC: soc-core: use for_each_pcm_streams() macro
      ASoC: soc-pcm: use for_each_pcm_streams() macro
      ASoC: soc-generic-dmaengine-pcm: use for_each_pcm_streams() macro
      ASoC: dwc: dwc-i2s: use for_each_pcm_streams() macro
      ASoC: fsl: fsl_asrc_dma: use for_each_pcm_streams() macro
      ASoC: qcom: lpass-platform: use for_each_pcm_streams() macro
      ASoC: sof: sof-audio: use for_each_pcm_streams() macro
      ALSA: usx2y: use for_each_pcm_streams() macro
      ASoC: soundwaire: qcom: use for_each_rtd_codec_dai() macro
      ASoC: qcom: sdm845: use for_each_rtd_codec_dai() macro
      ASoC: qcom: apq8016_sbc: use for_each_rtd_codec_dai() macro
      ASoC: intel: cml_rt1011_rt5682: use for_each_rtd_codec_dai() macro
      ASoC: intel: kbl_da7219_max98927: use for_each_rtd_codec_dai() macro
      ASoC: mediatek: mt8183-da7219-max98357: use for_each_rtd_codec_dai() =
macro
      ASoC: soc-pcm: add snd_soc_dai_get_pcm_stream()
      ASoC: soc-pcm: cleanup soc_pcm_apply_msb()
      ASoC: soc-pcm: add snd_soc_dai_get_widget()
      ASoC: soc-pcm: merge dpcm_run_new/old_update() into dpcm_fe_runtime_u=
pdate()
      ASoC: soc-pcm: move dpcm_path_put() to soc-pcm.c
      ASoC: soc-pcm: move CONFIG_DEBUG_FS functions to top side
      ASoC: soc-pcm: add dpcm_create/remove_debugfs_state()
      ASoC: soc-dapm: don't use rtd->cpu_dai on for_each_rtd_cpu_dai()
      ASoC: soc-pcm: use defined stream
      ASoC: soc-pcm: remove duplicate be check from dpcm_add_paths()
      ASoC: soc-pcm: move dpcm_fe_dai_close()
      ASoC: soc-pcm: add dpcm_fe_dai_cleanup()
      ASoC: soc-pcm: use snd_soc_dai_get_pcm_stream() at dpcm_set_fe_runtim=
e()
      ASoC: soc-pcm: tidyup dulicate handing at dpcm_fe_dai_startup()
      ASoC: soc-pcm: check DAI's activity more simply
      ASoC: soc-pcm: Do Digital Mute for both CPU/Codec in same timing.
      ASoC: simple-card-utils: use for_each_pcm_streams()
      ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro
      ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro
      ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro
      ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro
      ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro
      ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro
      ASoC: soc.h: remove non plural form for_each_xxx macro
      ASoC: soc-dapm: add for_each_card_dapms() macro
      ASoC: soc-dapm: add for_each_card_widgets() macro
      ASoC: soc-core: Merge CPU/Codec DAIs
      ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()
      ASoC: soc-dapm: Merge for_each_rtd_cpu/codec_dais()
      ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()
      ASoC: soc-core: Merge CPU/Codec for soc_dai_pcm_new()
      ASoC: soc-core: add asoc_rtd_to_cpu/codec() macro
      ASoC: amd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: atmel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: au1x: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI=
 pointer
      ASoC: bcm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: cirrus: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for D=
AI pointer
      ASoC: dwc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: fsl: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: generic: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for =
DAI pointer
      ASoC: img: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: kirkwood: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for=
 DAI pointer
      ASoC: mediatek: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for=
 DAI pointer
      ASoC: meson: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: mxs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: pxa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: qcom: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI=
 pointer
      ASoC: rockchip: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for=
 DAI pointer
      ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for =
DAI pointer
      ASoC: sh: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI p=
ointer
      ASoC: sof: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: sprd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI=
 pointer
      ASoC: stm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: sunxi: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: tegra: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: ti: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI p=
ointer
      ASoC: txx9: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI=
 pointer
      ASoC: uniphier: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for=
 DAI pointer
      ASoC: ux500: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DA=
I pointer
      ASoC: xtensa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for D=
AI pointer
      ASoC: arm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: codecs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for D=
AI pointer

Lukas Bulwahn (1):
      ASoC: MT6660: make spdxcheck.py happy

Marek Szyprowski (1):
      ASoC: samsung: Silence warnings during deferred probe

Mark Brown (37):
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      ASoC: soc-pcm cleanup step4
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      SoundWire: ASoC interfaces for multi-cpu dais and DisCo helpers
      ASoC: Add Multi CPU DAI support
      Merge series "ASoC: SOF: updates for 5.7" from Pierre-Louis Bossart <=
pierre-louis.bossart@linux.intel.com>:
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      Merge series "ASoC: wcd934x: minor fixes" from Srinivas Kandagatla <s=
rinivas.kandagatla@linaro.org>:
      Merge series "simple-audio-card codec2codec support" from Samuel Holl=
and <samuel@sholland.org>:
      Merge series "ASoC: soc-pcm cleanup step5" from Kuninori Morimoto <ku=
ninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: soc-pcm cleanup step6" from Kuninori Morimoto <ku=
ninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: rt5682: fix Kconfig/compilation issues when I2C i=
s not selected" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel=
=2Ecom>:
      Merge tag 'v5.6-rc5' into asoc-5.7
      Merge series "ASoC: qdsp6: fix default FE dais and routings." from Sr=
inivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: SOF: preparatory patches" from Guennadi Liakhovet=
ski <guennadi.liakhovetski@linux.intel.com>:
      Merge series "ASoC: brcm: add dsl and pon chip audio driver" from Kev=
in Li <kevin-ke.li@broadcom.com>:
      Merge series "ASoC: Intel: machine driver updates for 5.7" from Pierr=
e-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: multi-cpu dais, IPC and Intel improvements f=
or 5.7" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      Merge series "ALSA: compress: Add wma, alac and ape support" from Vin=
od Koul <vkoul@kernel.org>:
      Merge series "ASoC: sdm845: fix soundwire stream handling" from Srini=
vas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "ASoC: stm32: manage rebind issue" from Olivier Moysan <=
olivier.moysan@st.com>:
      Merge branch 'topic/ro_wordlength' of git://git.kernel.org/.../vkoul/=
soundwire into asoc-5.7
      Merge series "Support built-in Mic on Tegra boards that use WM8903" f=
rom Dmitry Osipenko <digetx@gmail.com>:
      ASoC: pxa: Select regmap from AC'97 machines
      ASoC: pxa: Enable AC'97 bus support for PXA machines
      Merge series "ASoC: SOF: cleanups and improvements" from Pierre-Louis=
 Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Intel: machine driver updates" from Pierre-Louis =
Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: rt1308-sdw: configure amplifier with set_tdm_slot=
()" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: add SoundWire support" from Pierre-Lo=
uis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: remove rtd->cpu/codec_dai{s}" from Kuninori Morim=
oto <kuninori.morimoto.gx@renesas.com>:
      Merge branch 'for-5.6' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.7
      Merge series "ASoC: Intel: add SoundWire machine driver" from Pierre-=
Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge branch 'asoc-5.6' into asoc-linus
      Merge branch 'asoc-5.7' into asoc-next

Martin Blumenstingl (3):
      ASoC: meson: aiu: Document Meson8 and Meson8b support in the dt-bindi=
ngs
      ASoC: meson: aiu: introduce a struct for platform specific information
      ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families

Nathan Chancellor (1):
      ASoC: wcd934x: Remove some unnecessary NULL checks

Naveen Manohar (2):
      ASoC: Intel: common: add match table for TGL RT5682 SoundWire driver
      ASoC: Intel: sof_sdw: Add Volteer support with RT5682 SNDW helper fun=
ction

Oder Chiou (8):
      ASoC: rt5682: Add the field "is_sdw" of private data
      ASoC: rt5682: Add the soundwire support
      ASoC: rt5682: Revise the function name
      ASoC: rt5682: Revise the DAC1 volume setting
      ASoC: rt5682: Fine tune the HP performance in soundwire mode
      ASoC: rt5682: Add a property for DMIC clock rate
      ASoC: rt5682: Add a property for DMIC delay
      ASoC: rt5682: Add the descriptions for the DMIC clock rate and delay =
settings

Olivier Moysan (11):
      ASoC: stm32: sai: manage error when getting reset controller
      ASoC: stm32: spdifrx: manage error when getting reset controller
      ASoC: stm32: i2s: manage error when getting reset controller
      ASoC: stm32: sai: improve error management on probe deferral
      ASoC: stm32: spdifrx: improve error management on probe deferral
      ASoC: stm32: i2s: improve error management on probe deferral
      ASoC: dt-bindings: stm32: convert i2s to json-schema
      ASoC: dt-bindings: stm32: convert spdfirx to json-schema
      ASoC: stm32: spdifrx: fix regmap status check
      ASoC: stm32: spdifrx: manage rebind issue
      ASoC: stm32: i2s: manage rebind issue

Paul Cercueil (6):
      ASoC: jz4740-i2s: Fix divider written at incorrect offset in register
      ASoC: jz4740-i2s: Add local dev variable in probe function
      ASoC: jz4740-i2s: Avoid passing enum as match data
      ASoC: jz4740-i2s: Add support for the JZ4760
      ASoC: jz4740-i2s: Add support for the JZ4770
      ASoC: Convert jz4740-i2s doc to YAML

Paul Olaru (3):
      ASoC: SOF: Rename i.MX8 platform to i.MX8X
      ASoC: SOF: imx8: Add ops for i.MX8QM
      ASoC: SOF: Add i.MX8QM device descriptor

Peter Ujfalusi (5):
      ASoC: ti: Add udma-pcm platform driver for UDMA
      ASoC: ti: davinci-mcasp: Add support for platforms using UDMA
      ALSA: dmaengine_pcm: Consider DMA cache caused delay in pointer callb=
ack
      ALSA: dmaengine_pcm: Consider DMA cache caused delay in pointer callb=
ack
      ALSA: dmaengine_pcm: No need to take runtime reference twice in pcm_p=
ointer

Pierre-Louis Bossart (20):
      ASoC: Intel: sof_pcm512x: add support for SOF platforms with pcm512x
      ASoC: Intel: BXT: switch pcm512x based boards to sof_pcm512x
      ASoC: Intel: CHT: add support for pcm512x boards
      ASoC: soc-dai: add get_sdw_stream() callback
      ASoC: soc-core: disable route checks for legacy devices
      ASoC: Intel: skl_nau88l25_ssm4567: disable route checks
      ASoC: rt5682: fix unmet dependencies
      ASoC: rt5682-sdw: fix 'defined but not used' pm functions
      ASoC: Intel: don't use GFP_ATOMIC for machine driver contexts
      ASoC: rt1308-sdw: add set_tdm_slot() support
      ASoC: rt1308-sdw: use slot and rx_mask to configure stream
      ASoC: soc-acpi: expand description of _ADR-based devices
      ASoC: SOF: Intel: add SoundWire configuration interface
      ASoC: SOF: IPC: dai-intel: move ALH declarations in header file
      ASoC: SOF: Intel: hda: add SoundWire stream config/free callbacks
      ASoC: SOF: Intel: hda: initial SoundWire machine driver autodetect
      ASoC: SOF: Intel: hda: disable SoundWire interrupts on suspend
      ASoC: SOF: Intel: hda: add parameter to control SoundWire clock stop =
quirks
      ASoC: SOF: Intel: hda-ctrl: add reset cycle before parsing capabiliti=
es
      ASoC: Intel: boards: add sof_sdw machine driver

Rander Wang (3):
      ASoC: SOF: Intel: hda: add WAKEEN interrupt support for SoundWire
      Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in irq thread
      ASoC: Intel: soc-acpi: update topology and driver name for SoundWire =
platforms

Ranjani Sridharan (11):
      ASoC: SOF: Do not reset hw_params for streams that ignored suspend
      ASoC: SOF: pm: Unify suspend/resume routines
      ASoC: SOF: Add system_suspend_target field to struct snd_sof_dev
      ASoC: SOF: pm: Introduce DSP power states
      ASoC: SOF: Move DSP power state transitions to platform-specific ops
      ASoC: SOF: audio: Add helper to check if only D0i3 streams are active
      ASoC: SOF: Intel: hda: Amend the DSP state transition diagram
      ASoC: SOF: Intel: cnl: Implement feature to support DSP D0i3 in S0
      ASoC: SOF: Intel: hda: Allow trace DMA in S0 when DSP is in D0I3 for =
debug
      ASoC: SOF: Intel: hda: use snd_sof_dsp_set_power_state() op
      ASoC: SOF: Intel: hda: Improve DSP state logging

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Adding TDM support in hw_params.

Rob Herring (1):
      ASoC: dt-bindings: google, cros-ec-codec: Fix dtc warnings in example

Robin Murphy (2):
      ASoC: dt-bindings: Make RK3328 codec GPIO explicit
      ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit

Samuel Holland (4):
      ASoC: sun8i-codec: Remove unused dev from codec struct
      ALSA: pcm: Add a standalone version of snd_pcm_limit_hw_rates
      ASoC: pcm: Export parameter intersection logic
      ASoC: simple-card: Add support for codec2codec DAI links

Sathyanarayana Nujella (2):
      ASoC: Intel: sof_rt5682: Add support for tgl-max98373-rt5682
      ASoC: Intel: common: Add mach table for tgl-max98373-rt5682

Shreyas NC (4):
      ASoC: Add initial support for multiple CPU DAIs
      ASoC: Add multiple CPU DAI support for PCM ops
      ASoC: Add dapm_add_valid_dai_widget helper
      ASoC: Add multiple CPU DAI support in DAPM

Shuming Fan (3):
      ASoC: rt5682: fix the random recording noise of headset
      ASoC: rt5682: remove noisy debug messages
      ASoC: rt5682: move DAI clock registry to I2S mode

Srinivas Kandagatla (10):
      ASoC: wcd934x: fix High Accuracy Buck enable
      ASoC: wcd934x: remove unused headers
      ASoC: wcd9335: fix address map representation
      ASoC: qdsp6: q6asm-dai: only enable dais from device tree
      ASoC: qdsp6: q6routing: remove default routing
      ASoC: codecs: wsa881x: request gpio direction before setting
      ASoC: soc-dai: return proper error for get_sdw_stream()
      ASoC: codecs: wsa881x: remove soundwire stream handling
      ASoC: qcom: sdm845: handle soundwire stream
      soundwire: stream: Add read_only_wordlength flag to port properties

Stephan Gerhold (1):
      ASoC: soc-pcm: fix regression in soc_new_pcm()

Takashi Iwai (2):
      ASoC: pcm: Fix (again) possible buffer overflow in dpcm state sysfs o=
utput
      ASoC: wm_adsp: Use scnprintf() for the limited buffer output

Tomasz Lauda (1):
      ASoC: SOF: add core id to sof_ipc_comp

Tzung-Bi Shih (12):
      ASoC: mediatek: mt8173-rt5650: support HDMI jack reporting
      drm/mediatek: exit earlier if failed to register audio driver
      drm/mediatek: support HDMI jack status reporting
      ASoC: max98357a: move control of SD_MODE to DAPM
      ASoC: mediatek: mt8183-da7219: add speaker switch
      ASoC: mediatek: mt8183-da7219: change supported formats of DL2 and UL1
      ASoC: mediatek: mt8183-da7219: pull TDM GPIO pins down when probed
      ASoC: mediatek: mt8183-da7219: support TDM out and 8ch I2S out
      ASoC: mediatek: mt8183-da7219: apply some refactors
      drm/mediatek: fix race condition for HDMI jack status reporting
      ASoC: dapm: select sleep_state when initializing PINCTRL widget
      ASoC: mediatek: mt8183-da7219: use SND_SOC_DAPM_PINCTRL in TDM out

Vinod Koul (9):
      ALSA: compress: add wma codec profiles
      ALSA: compress: Add wma decoder params
      ASoC: qcom: q6asm: pass codec profile to q6asm_open_write
      ASoC: qcom: q6asm: add support to wma config
      ASoC: qcom: q6asm-dai: add support to wma decoder
      ALSA: compress: add alac & ape decoder params
      ASoC: qcom: q6asm: add support for alac and ape configs
      ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders
      ALSA: compress: bump the version

Wolfram Sang (1):
      ASoC: pxa: magician: convert to use i2c_new_client_device()

Yong Zhi (4):
      ASoC: Intel: sof_da7219_max98373: Add support for max98360a speaker a=
mp
      ASoC: Intel: sof_rt5682: Add rt1015 speaker amp support
      ASoC: max98357a: Add ACPI HID MAX98360A
      ASoC: intel: sof_da7219_max98373: Add speaker switch

Yu-Hsuan Hsu (1):
      ASoC: cros_ec_codec: Support setting bclk ratio

YueHaibing (6):
      ASoC: Remove unused including <linux/version.h>
      ASoC: wcd934x: Remove set but not unused variable 'hph_comp_ctrl7'
      ASoC: rt5682: Make rt5682_clock_config static
      ASoC: rt1015: set snd_soc_dai_ops in rt1015_dai driver
      ASoc: amd: acp3x: Add missing include <linux/io.h>
      ASoC: wm8974: remove unused variables

derek.fang (1):
      ASoC: rt5682: Enable PLL2 function

kbuild test robot (1):
      ASoC: meson: aiu: fix semicolon.cocci warnings

tangbin (2):
      ASoC: zte: zx-spdif: remove redundant dev_err message
      ASoC: zte: zx-tdm: remove redundant variables dev

 .../devicetree/bindings/sound/amlogic,aiu.yaml     |  113 ++
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   51 +
 .../bindings/sound/amlogic,gx-sound-card.yaml      |  113 ++
 .../devicetree/bindings/sound/amlogic,t9015.yaml   |   58 +
 .../bindings/sound/brcm,bcm63xx-audio.txt          |   29 +
 .../devicetree/bindings/sound/cirrus,cs42l51.yaml  |   69 +
 .../devicetree/bindings/sound/cs42l51.txt          |   33 -
 .../bindings/sound/google,cros-ec-codec.txt        |   44 -
 .../bindings/sound/google,cros-ec-codec.yaml       |   67 +
 .../devicetree/bindings/sound/ingenic,aic.yaml     |   92 ++
 .../bindings/sound/ingenic,jz4740-i2s.txt          |   23 -
 .../bindings/sound/nvidia,tegra-audio-wm8903.txt   |    1 +
 .../bindings/sound/rockchip,rk3328-codec.txt       |    7 +-
 .../devicetree/bindings/sound/rockchip-i2s.txt     |   49 -
 .../devicetree/bindings/sound/rockchip-i2s.yaml    |  111 ++
 Documentation/devicetree/bindings/sound/rt5682.txt |   18 +
 .../devicetree/bindings/sound/st,stm32-i2s.txt     |   62 -
 .../devicetree/bindings/sound/st,stm32-i2s.yaml    |   87 ++
 .../devicetree/bindings/sound/st,stm32-spdifrx.txt |   56 -
 .../bindings/sound/st,stm32-spdifrx.yaml           |   80 +
 .../devicetree/bindings/sound/tas2562.txt          |    2 +-
 .../devicetree/bindings/sound/tlv320adcx140.yaml   |   82 +
 Documentation/sound/soc/codec-to-codec.rst         |    9 +-
 MAINTAINERS                                        |   15 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   54 +-
 drivers/soundwire/qcom.c                           |    7 +-
 drivers/soundwire/stream.c                         |   16 +-
 drivers/spi/Kconfig                                |    2 +-
 include/dt-bindings/sound/meson-aiu.h              |   18 +
 include/dt-bindings/sound/meson-g12a-toacodec.h    |   10 +
 include/linux/soundwire/sdw.h                      |    2 +
 include/sound/compress_driver.h                    |   40 +-
 include/sound/hdaudio.h                            |    2 +
 include/sound/pcm.h                                |   14 +-
 include/sound/rt5682.h                             |   10 +
 include/sound/soc-acpi.h                           |   39 +-
 include/sound/soc-dai.h                            |   44 +-
 include/sound/soc-dapm.h                           |    6 +
 include/sound/soc-dpcm.h                           |   20 +-
 include/sound/soc.h                                |   44 +-
 include/sound/sof/dai-intel.h                      |   18 +-
 include/sound/sof/header.h                         |   11 +
 include/sound/sof/info.h                           |   22 +-
 include/sound/sof/topology.h                       |    3 +-
 include/uapi/sound/compress_offload.h              |    2 +-
 include/uapi/sound/compress_params.h               |   37 +-
 include/uapi/sound/sof/abi.h                       |    2 +-
 sound/arm/pxa2xx-pcm-lib.c                         |    8 +-
 sound/core/compress_offload.c                      |   42 +
 sound/core/pcm_dmaengine.c                         |    6 +-
 sound/core/pcm_misc.c                              |   18 +-
 sound/soc/amd/Kconfig                              |   10 +
 sound/soc/amd/Makefile                             |    2 +
 sound/soc/amd/acp-da7219-max98357a.c               |    2 +-
 sound/soc/amd/acp-rt5645.c                         |    4 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |  376 +++++
 sound/soc/amd/raven/acp3x-i2s.c                    |   44 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    6 +-
 sound/soc/amd/raven/pci-acp3x.c                    |    7 +-
 sound/soc/atmel/atmel-pcm-dma.c                    |    4 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |    2 +-
 sound/soc/atmel/atmel_wm8904.c                     |    2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |    8 +-
 sound/soc/atmel/mikroe-proto.c                     |    2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |    2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |    2 +-
 sound/soc/au1x/db1200.c                            |    2 +-
 sound/soc/au1x/dbdma2.c                            |    2 +-
 sound/soc/au1x/dma.c                               |    2 +-
 sound/soc/au1x/psc-ac97.c                          |    2 +-
 sound/soc/bcm/Kconfig                              |    9 +
 sound/soc/bcm/Makefile                             |    4 +
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |  317 ++++
 sound/soc/bcm/bcm63xx-i2s.h                        |   90 ++
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  485 ++++++
 sound/soc/bcm/cygnus-pcm.c                         |   22 +-
 sound/soc/cirrus/edb93xx.c                         |    4 +-
 sound/soc/cirrus/snappercl15.c                     |    4 +-
 sound/soc/codecs/Kconfig                           |  627 ++++----
 sound/soc/codecs/Makefile                          |    4 +
 sound/soc/codecs/cros_ec_codec.c                   |   25 +-
 sound/soc/codecs/cs4271.c                          |    4 +-
 sound/soc/codecs/cs47l15.c                         |    4 +-
 sound/soc/codecs/cs47l24.c                         |    6 +-
 sound/soc/codecs/cs47l35.c                         |    6 +-
 sound/soc/codecs/cs47l85.c                         |    6 +-
 sound/soc/codecs/cs47l90.c                         |    6 +-
 sound/soc/codecs/cs47l92.c                         |    4 +-
 sound/soc/codecs/hdac_hdmi.c                       |    6 +-
 sound/soc/codecs/max98357a.c                       |   37 +-
 sound/soc/codecs/mt6660.c                          |   81 +-
 sound/soc/codecs/rk3328_codec.c                    |   31 +-
 sound/soc/codecs/rl6231.c                          |    1 +
 sound/soc/codecs/rl6231.h                          |    2 +-
 sound/soc/codecs/rt1015.c                          |   10 +-
 sound/soc/codecs/rt1308-sdw.c                      |   38 +-
 sound/soc/codecs/rt1308-sdw.h                      |    2 +
 sound/soc/codecs/rt5659.c                          |    2 +-
 sound/soc/codecs/rt5682-sdw.c                      |  333 ++++
 sound/soc/codecs/rt5682-sdw.h                      |   20 +
 sound/soc/codecs/rt5682.c                          | 1298 ++++++++++++++--
 sound/soc/codecs/rt5682.h                          |  100 +-
 sound/soc/codecs/tas2562.c                         |  121 +-
 sound/soc/codecs/tas2562.h                         |   12 +-
 sound/soc/codecs/tlv320adcx140.c                   |  920 +++++++++++
 sound/soc/codecs/tlv320adcx140.h                   |  131 ++
 sound/soc/codecs/wcd9335.c                         |   18 +-
 sound/soc/codecs/wcd9335.h                         |    7 +-
 sound/soc/codecs/wcd934x.c                         |   37 +-
 sound/soc/codecs/wm0010.c                          |    2 +-
 sound/soc/codecs/wm5110.c                          |    6 +-
 sound/soc/codecs/wm8974.c                          |    8 -
 sound/soc/codecs/wm_adsp.c                         |   14 +-
 sound/soc/codecs/wsa881x.c                         |   46 +-
 sound/soc/dwc/dwc-i2s.c                            |    8 +-
 sound/soc/dwc/dwc-pcm.c                            |    2 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    4 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   10 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   10 +-
 sound/soc/fsl/fsl_spdif.c                          |   10 +-
 sound/soc/fsl/fsl_ssi.c                            |    8 +-
 sound/soc/fsl/imx-audmix.c                         |    8 +-
 sound/soc/fsl/imx-mc13783.c                        |    4 +-
 sound/soc/fsl/imx-sgtl5000.c                       |    2 +-
 sound/soc/fsl/mpc5200_dma.c                        |   10 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |    2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |    4 +-
 sound/soc/fsl/mx27vis-aic32x4.c                    |    4 +-
 sound/soc/fsl/p1022_ds.c                           |    4 +-
 sound/soc/fsl/p1022_rdk.c                          |    4 +-
 sound/soc/fsl/wm1133-ev1.c                         |    6 +-
 sound/soc/generic/simple-card-utils.c              |   60 +-
 sound/soc/img/img-i2s-in.c                         |    2 +-
 sound/soc/img/img-i2s-out.c                        |    2 +-
 sound/soc/intel/atom/sst-atom-controls.c           |    2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    6 +-
 sound/soc/intel/atom/sst/sst_pci.c                 |    2 +-
 sound/soc/intel/boards/Kconfig                     |   57 +-
 sound/soc/intel/boards/Makefile                    |   12 +-
 sound/soc/intel/boards/bdw-rt5650.c                |   15 +-
 sound/soc/intel/boards/bdw-rt5677.c                |   15 +-
 sound/soc/intel/boards/broadwell.c                 |   13 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   10 +-
 sound/soc/intel/boards/bxt_rt298.c                 |   10 +-
 sound/soc/intel/boards/byt-max98090.c              |    2 +-
 sound/soc/intel/boards/byt-rt5640.c                |    4 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |   10 +-
 sound/soc/intel/boards/bytcht_da7213.c             |   10 +-
 sound/soc/intel/boards/bytcht_es8316.c             |    8 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |    4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    8 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    8 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    8 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   16 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    8 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |   13 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   13 +-
 sound/soc/intel/boards/haswell.c                   |    4 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    8 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   14 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    6 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |   12 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   12 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h        |    4 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |   27 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |   14 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |   19 +-
 sound/soc/intel/boards/skl_rt286.c                 |    8 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |   83 +-
 sound/soc/intel/boards/sof_maxim_common.c          |   80 +
 sound/soc/intel/boards/sof_maxim_common.h          |   24 +
 sound/soc/intel/boards/sof_pcm512x.c               |  448 ++++++
 sound/soc/intel/boards/sof_rt5682.c                |  137 +-
 sound/soc/intel/boards/sof_sdw.c                   |  962 ++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h            |  114 ++
 sound/soc/intel/boards/sof_sdw_dmic.c              |   42 +
 sound/soc/intel/boards/sof_sdw_hdmi.c              |   97 ++
 sound/soc/intel/boards/sof_sdw_rt1308.c            |  151 ++
 sound/soc/intel/boards/sof_sdw_rt5682.c            |  126 ++
 sound/soc/intel/boards/sof_sdw_rt700.c             |  125 ++
 sound/soc/intel/boards/sof_sdw_rt711.c             |  156 ++
 sound/soc/intel/boards/sof_sdw_rt715.c             |   42 +
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |    7 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |  111 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |  103 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   34 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   92 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c          |   26 +-
 sound/soc/intel/skylake/bxt-sst.c                  |    3 -
 sound/soc/intel/skylake/cnl-sst.c                  |   35 +-
 sound/soc/intel/skylake/skl-nhlt.c                 |    3 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   20 +-
 sound/soc/intel/skylake/skl-sst-dsp.h              |    2 +
 sound/soc/intel/skylake/skl.c                      |   33 +-
 sound/soc/jz4740/jz4740-i2s.c                      |   78 +-
 sound/soc/kirkwood/armada-370-db.c                 |    2 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |    2 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   10 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |    2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |    4 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |    4 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |    4 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |    4 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |    6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   23 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  117 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    2 +-
 sound/soc/meson/Kconfig                            |   41 +
 sound/soc/meson/Makefile                           |   19 +
 sound/soc/meson/aiu-acodec-ctrl.c                  |  203 +++
 sound/soc/meson/aiu-codec-ctrl.c                   |  151 ++
 sound/soc/meson/aiu-encoder-i2s.c                  |  365 +++++
 sound/soc/meson/aiu-encoder-spdif.c                |  209 +++
 sound/soc/meson/aiu-fifo-i2s.c                     |  153 ++
 sound/soc/meson/aiu-fifo-spdif.c                   |  186 +++
 sound/soc/meson/aiu-fifo.c                         |  223 +++
 sound/soc/meson/aiu-fifo.h                         |   50 +
 sound/soc/meson/aiu.c                              |  388 +++++
 sound/soc/meson/aiu.h                              |   89 ++
 sound/soc/meson/axg-card.c                         |  414 +----
 sound/soc/meson/axg-fifo.c                         |    2 +-
 sound/soc/meson/g12a-toacodec.c                    |  252 +++
 sound/soc/meson/g12a-tohdmitx.c                    |  219 +--
 sound/soc/meson/gx-card.c                          |  141 ++
 sound/soc/meson/meson-card-utils.c                 |  385 +++++
 sound/soc/meson/meson-card.h                       |   55 +
 sound/soc/meson/meson-codec-glue.c                 |  149 ++
 sound/soc/meson/meson-codec-glue.h                 |   32 +
 sound/soc/meson/t9015.c                            |  333 ++++
 sound/soc/mxs/mxs-sgtl5000.c                       |    4 +-
 sound/soc/pxa/Kconfig                              |   22 +
 sound/soc/pxa/brownstone.c                         |    4 +-
 sound/soc/pxa/corgi.c                              |    4 +-
 sound/soc/pxa/hx4700.c                             |    4 +-
 sound/soc/pxa/imote2.c                             |    4 +-
 sound/soc/pxa/magician.c                           |   14 +-
 sound/soc/pxa/mioa701_wm9713.c                     |    4 +-
 sound/soc/pxa/mmp-pcm.c                            |    2 +-
 sound/soc/pxa/mmp-sspa.c                           |    2 +-
 sound/soc/pxa/poodle.c                             |    4 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |    2 +-
 sound/soc/pxa/spitz.c                              |    4 +-
 sound/soc/pxa/ttc-dkb.c                            |    2 +-
 sound/soc/pxa/z2.c                                 |    4 +-
 sound/soc/pxa/zylonite.c                           |    6 +-
 sound/soc/qcom/Kconfig                             |    2 +-
 sound/soc/qcom/apq8016_sbc.c                       |    9 +-
 sound/soc/qcom/apq8096.c                           |    6 +-
 sound/soc/qcom/lpass-platform.c                    |    4 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  173 ++-
 sound/soc/qcom/qdsp6/q6asm.c                       |  243 ++-
 sound/soc/qcom/qdsp6/q6asm.h                       |   51 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |   21 +-
 sound/soc/qcom/sdm845.c                            |  105 +-
 sound/soc/qcom/storm.c                             |    2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |    4 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |   16 +-
 sound/soc/rockchip/rockchip_max98090.c             |    6 +-
 sound/soc/rockchip/rockchip_rt5645.c               |    6 +-
 sound/soc/samsung/Kconfig                          |    4 +-
 sound/soc/samsung/arndale.c                        |   10 +-
 sound/soc/samsung/bells.c                          |   16 +-
 sound/soc/samsung/h1940_uda1380.c                  |    2 +-
 sound/soc/samsung/i2s.c                            |    2 +-
 sound/soc/samsung/jive_wm8750.c                    |    4 +-
 sound/soc/samsung/littlemill.c                     |   16 +-
 sound/soc/samsung/lowland.c                        |    6 +-
 sound/soc/samsung/neo1973_wm8753.c                 |   10 +-
 sound/soc/samsung/odroid.c                         |    6 +-
 sound/soc/samsung/pcm.c                            |    4 +-
 sound/soc/samsung/rx1950_uda1380.c                 |    2 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |    2 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |    4 +-
 sound/soc/samsung/s3c24xx_uda134x.c                |    6 +-
 sound/soc/samsung/smartq_wm8987.c                  |    4 +-
 sound/soc/samsung/smdk_spdif.c                     |    2 +-
 sound/soc/samsung/smdk_wm8580.c                    |    2 +-
 sound/soc/samsung/smdk_wm8994.c                    |    4 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |    6 +-
 sound/soc/samsung/snow.c                           |    8 +-
 sound/soc/samsung/spdif.c                          |    8 +-
 sound/soc/samsung/speyside.c                       |   10 +-
 sound/soc/samsung/tm2_wm5110.c                     |   19 +-
 sound/soc/samsung/tobermory.c                      |   10 +-
 sound/soc/sh/dma-sh7760.c                          |   16 +-
 sound/soc/sh/fsi.c                                 |    5 +-
 sound/soc/sh/migor.c                               |    6 +-
 sound/soc/sh/rcar/core.c                           |    2 +-
 sound/soc/soc-compress.c                           |    5 +-
 sound/soc/soc-core.c                               |  290 ++--
 sound/soc/soc-dai.c                                |   18 +-
 sound/soc/soc-dapm.c                               |  220 +--
 sound/soc/soc-generic-dmaengine-pcm.c              |   26 +-
 sound/soc/soc-pcm.c                                | 1627 +++++++++-------=
----
 sound/soc/soc-topology.c                           |   24 +-
 sound/soc/sof/Kconfig                              |    9 +
 sound/soc/sof/Makefile                             |    1 +
 sound/soc/sof/compress.c                           |  146 ++
 sound/soc/sof/compress.h                           |   31 +
 sound/soc/sof/core.c                               |   10 +-
 sound/soc/sof/debug.c                              |  226 +++
 sound/soc/sof/imx/imx8.c                           |   57 +-
 sound/soc/sof/intel/Kconfig                        |   20 +-
 sound/soc/sof/intel/Makefile                       |    1 +
 sound/soc/sof/intel/apl.c                          |    9 +
 sound/soc/sof/intel/cnl.c                          |   51 +-
 sound/soc/sof/intel/hda-codec.c                    |   11 +-
 sound/soc/sof/intel/hda-compress.c                 |  114 ++
 sound/soc/sof/intel/hda-ctrl.c                     |   40 +-
 sound/soc/sof/intel/hda-dai.c                      |  130 +-
 sound/soc/sof/intel/hda-dsp.c                      |  331 +++-
 sound/soc/sof/intel/hda-ipc.c                      |   24 +-
 sound/soc/sof/intel/hda-loader.c                   |   40 +-
 sound/soc/sof/intel/hda-pcm.c                      |    8 +-
 sound/soc/sof/intel/hda-stream.c                   |   27 +-
 sound/soc/sof/intel/hda.c                          |  433 +++++-
 sound/soc/sof/intel/hda.h                          |  120 +-
 sound/soc/sof/ipc.c                                |   41 +-
 sound/soc/sof/loader.c                             |    6 -
 sound/soc/sof/ops.h                                |   59 +-
 sound/soc/sof/pcm.c                                |   19 +-
 sound/soc/sof/pm.c                                 |  176 +--
 sound/soc/sof/probe.c                              |  290 ++++
 sound/soc/sof/probe.h                              |   85 +
 sound/soc/sof/sof-audio.c                          |   59 +-
 sound/soc/sof/sof-audio.h                          |    6 +-
 sound/soc/sof/sof-of-dev.c                         |   10 +
 sound/soc/sof/sof-priv.h                           |   71 +-
 sound/soc/sof/topology.c                           |   25 +-
 sound/soc/sprd/Kconfig                             |    2 +-
 sound/soc/sprd/sprd-mcdt.h                         |    2 +-
 sound/soc/sprd/sprd-pcm-compress.c                 |    4 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |    2 +-
 sound/soc/stm/stm32_adfsdm.c                       |   12 +-
 sound/soc/stm/stm32_i2s.c                          |   75 +-
 sound/soc/stm/stm32_sai.c                          |   26 +-
 sound/soc/stm/stm32_sai_sub.c                      |   13 +-
 sound/soc/stm/stm32_spdifrx.c                      |   89 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    2 +-
 sound/soc/sunxi/sun8i-codec.c                      |    3 -
 sound/soc/tegra/tegra_alc5632.c                    |    2 +-
 sound/soc/tegra/tegra_max98090.c                   |    2 +-
 sound/soc/tegra/tegra_rt5640.c                     |    2 +-
 sound/soc/tegra/tegra_rt5677.c                     |    2 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |    2 +-
 sound/soc/tegra/tegra_wm8753.c                     |    2 +-
 sound/soc/tegra/tegra_wm8903.c                     |   24 +-
 sound/soc/tegra/trimslice.c                        |    2 +-
 sound/soc/ti/Kconfig                               |    8 +-
 sound/soc/ti/Makefile                              |    2 +
 sound/soc/ti/ams-delta.c                           |    4 +-
 sound/soc/ti/davinci-evm.c                         |    4 +-
 sound/soc/ti/davinci-mcasp.c                       |   13 +-
 sound/soc/ti/davinci-vcif.c                        |    4 +-
 sound/soc/ti/n810.c                                |    2 +-
 sound/soc/ti/omap-abe-twl6040.c                    |    6 +-
 sound/soc/ti/omap-mcbsp-st.c                       |    2 +-
 sound/soc/ti/omap-mcbsp.c                          |    4 +-
 sound/soc/ti/omap-mcpdm.c                          |    2 +-
 sound/soc/ti/omap3pandora.c                        |    4 +-
 sound/soc/ti/osk5912.c                             |    2 +-
 sound/soc/ti/rx51.c                                |    2 +-
 sound/soc/ti/udma-pcm.c                            |   43 +
 sound/soc/ti/udma-pcm.h                            |   18 +
 sound/soc/txx9/txx9aclc.c                          |    2 +-
 sound/soc/uniphier/aio-compress.c                  |   22 +-
 sound/soc/uniphier/aio-dma.c                       |    6 +-
 sound/soc/ux500/mop500_ab8500.c                    |    6 +-
 sound/soc/ux500/ux500_pcm.c                        |    8 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |    2 +-
 sound/soc/zte/zx-spdif.c                           |    1 -
 sound/soc/zte/zx-tdm.c                             |    3 +-
 sound/usb/usx2y/usbusx2yaudio.c                    |    9 +-
 379 files changed, 17570 insertions(+), 3797 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-to=
acodec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,gx-soun=
d-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.y=
aml
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm63xx-au=
dio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l51.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs42l51.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-=
codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-=
codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ingenic,aic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-=
i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip-i2s.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifr=
x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifr=
x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/tlv320adcx140.y=
aml
 create mode 100644 include/dt-bindings/sound/meson-aiu.h
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h
 create mode 100644 sound/soc/amd/acp3x-rt5682-max9836.c
 create mode 100644 sound/soc/bcm/bcm63xx-i2s-whistler.c
 create mode 100644 sound/soc/bcm/bcm63xx-i2s.h
 create mode 100644 sound/soc/bcm/bcm63xx-pcm-whistler.c
 create mode 100644 sound/soc/codecs/rt5682-sdw.c
 create mode 100644 sound/soc/codecs/rt5682-sdw.h
 create mode 100644 sound/soc/codecs/tlv320adcx140.c
 create mode 100644 sound/soc/codecs/tlv320adcx140.h
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.c
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.h
 create mode 100644 sound/soc/intel/boards/sof_pcm512x.c
 create mode 100644 sound/soc/intel/boards/sof_sdw.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_common.h
 create mode 100644 sound/soc/intel/boards/sof_sdw_dmic.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_hdmi.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1308.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt5682.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt700.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c
 create mode 100644 sound/soc/meson/aiu-acodec-ctrl.c
 create mode 100644 sound/soc/meson/aiu-codec-ctrl.c
 create mode 100644 sound/soc/meson/aiu-encoder-i2s.c
 create mode 100644 sound/soc/meson/aiu-encoder-spdif.c
 create mode 100644 sound/soc/meson/aiu-fifo-i2s.c
 create mode 100644 sound/soc/meson/aiu-fifo-spdif.c
 create mode 100644 sound/soc/meson/aiu-fifo.c
 create mode 100644 sound/soc/meson/aiu-fifo.h
 create mode 100644 sound/soc/meson/aiu.c
 create mode 100644 sound/soc/meson/aiu.h
 create mode 100644 sound/soc/meson/g12a-toacodec.c
 create mode 100644 sound/soc/meson/gx-card.c
 create mode 100644 sound/soc/meson/meson-card-utils.c
 create mode 100644 sound/soc/meson/meson-card.h
 create mode 100644 sound/soc/meson/meson-codec-glue.c
 create mode 100644 sound/soc/meson/meson-codec-glue.h
 create mode 100644 sound/soc/meson/t9015.c
 create mode 100644 sound/soc/sof/compress.c
 create mode 100644 sound/soc/sof/compress.h
 create mode 100644 sound/soc/sof/intel/hda-compress.c
 create mode 100644 sound/soc/sof/probe.c
 create mode 100644 sound/soc/sof/probe.h
 create mode 100644 sound/soc/ti/udma-pcm.c
 create mode 100644 sound/soc/ti/udma-pcm.h

--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6B2SwACgkQJNaLcl1U
h9Acvwf/WT2/1q2+sHMLx0/+jytDp1MJBp/cjcTc0oyMMQqIF4qOKq2z0hfsySBO
htBapLsr+tKm/hWhfwr8M/L1cT7JxBOAsqbTk6AdG+NDG5u44ZIIQ2WnoAwvBdDc
+weuzrlQIIroZMFmyKJCRkfEyF6K23kotGUdt0sk1iItXMYgdUDhnD/LPfbKFikw
kX1kLBo+ogL7ZggSW60NEu++DhhI+Uoq0gTCwfBwuvhFoI02vTlgbVfMenMdOwIO
KPEW4VuJ5IAJfMpdQACFU3vxkiBF6Z+NKiVLYhHw7iMLcT4r6xNhVvqxCgP3oUjb
rRepIxGY3Ey7dC2o+tENfeUYwXo9dA==
=fhQQ
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
