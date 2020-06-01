Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A91EA39A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 14:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5C8170B;
	Mon,  1 Jun 2020 14:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5C8170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591013720;
	bh=CCNTlPBwsvpOVfTmZzPCM78OjOmM0eH2fLLZ+JK1auM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UAdqpjnvgAvSOVSClpuW6ABI9JGEueLpXhgBB/xT/adp0DTMHOxB3Wbsv0mcPfbOd
	 2HgPF5czyLHZ7i1k9Fb9E/u8bqzGVqF4A7fFhajEh1fD9zjCbkVB3RuhmDx1cAyrIf
	 dtX+2WLV0boY0IwFUZcDER7IOfRChrccPDPRpM8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FE6F801F5;
	Mon,  1 Jun 2020 14:13:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240ADF801ED; Mon,  1 Jun 2020 14:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A08F80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 14:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A08F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A+S+ja3L"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95BEE2065C;
 Mon,  1 Jun 2020 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591013606;
 bh=CCNTlPBwsvpOVfTmZzPCM78OjOmM0eH2fLLZ+JK1auM=;
 h=Date:From:To:Cc:Subject:From;
 b=A+S+ja3Ly9OJoPomHpu0bw9KWxIAxrKnu4iX4VVFlFluWt9aMPV1F+5C5y6lS62jo
 LYkDE5n1pwMwYXL7PvXOUrf2+64L4n0FGSgkqLK73EAYYDmu+Zd8Fl7JhjKqiqmVIe
 SyLg8QS0N6UQzo/CUxL+L1XWztikSjojwBdkvNWQ=
Date: Mon, 1 Jun 2020 13:13:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.8
Message-ID: <20200601121323.GB45647@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
X-Cookie: Help a swallow land at Capistrano.
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


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.8

for you to fetch changes up to 358c7c61fd04d324f83d7968daf8dd9a6ff86a9a:

  Merge remote-tracking branch 'asoc/for-5.8' into asoc-linus (2020-06-01 1=
3:01:15 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.8

This has been another very active release with a bunch of new drivers,
lots of fixes everywhere and continued core improvements from
Morimoto-san:

 - Lots of core cleanups and refactorings from Morimoto-san, factoring
   out common operations and making the card abstraction more solid.
 - Continued work on cleaning up and improving the Intel drivers, along
   with some new platform support for them.
 - Fixes to make the Marvell SSPA driver work upstream.
 - Support for AMD Renoir ACP, Dialog DA7212, Freescale EASRC and
   i.MX8M, Intel Elkhard Lake, Maxim MAX98390, Nuvoton NAU8812 and
   NAU8814 and Realtek RT1016.

----------------------------------------------------------------
Akshu Agrawal (2):
      ASoC: amd :High hw_level while simultaneous capture
      ASoC: amd: raven: Make the driver name consistent across files

Amadeusz S=C5=82awi=C5=84ski (3):
      ASoC: topology: Remove unneeded semicolon
      ASoC: Intel: baytrail: Fix register access
      ASoC: Intel: Use readq to read 64 bit registers

Andy Shevchenko (1):
      ASoC: Intel: Skylake: Replace guid_copy() with import_guid()

Ard Biesheuvel (1):
      ASoC: cros_ec_codec: switch to library API for SHA-256

Arnd Bergmann (7):
      ASoC: component: suppress uninitialized-variable warning
      ASoC: codecs: wm97xx: fix ac97 dependency
      ASoC: fsl_easrc: mark PM functions __maybe_unused
      ASoC: rt5682: fix I2C/Soundwire dependencies
      ASoC: SOF: sort out Kconfig, again
      ASoC: cros_ec_codec: allocate shash_desc dynamically
      ASoC: rt5682: split i2c driver into separate module

Artur Kloniecki (1):
      ASoC: SOF: Add XRUN flags field to struct sof_ipc_buffer.

Bard Liao (9):
      ASoC: intel: sof_sdw: init all aggregated codecs
      ASoC: SOF: topology: fix: handle DAI widget connections properly with=
 multiple CPU DAI's
      ASoC: SOF: align sof_ipc_dai_alh_params with FW
      ASoC: SOF: topology: Get ALH rate amd channels from topology
      ASoC: SOF: topology: fix: parse hda_tokens to &config->hda
      ASoC: SOF: topology: Get HDA rate and channels from topology
      ASoC: SOF: topology: send ipc for all found DAIs in sof_set_dai_config
      ASoC: topology: set component dai_index to ipc dai config dai_index
      ASoC: SOF: topology: replace sof_link_hda_process by sof_set_dai_conf=
ig

Brent Lu (3):
      ASoC: bdw-rt5677: add channel constraint
      ASoC: bdw-rt5650: add channel constraint
      ASoC: broadwell: add channel constraint

Cezary Rojewski (2):
      ASoC: Intel: haswell: Power transition refactor
      ASoC: Intel: Skylake: Update description for HDaudio kconfig

Charles Keepax (1):
      ASoC: dapm: Move dai_link widgets to runtime to fix use after free

ChenTao (1):
      soc: fsl_asrc: Make some functions static

Chris Garren (1):
      ASoC: adau7118: Mark the ADAU7118 reset register as volatile

Christophe JAILLET (2):
      ASoC: ux500: mop500: Fix some refcounted resources issues
      ASoC: ti: omap-mcbsp: Fix an error handling path in 'asoc_mcbsp_probe=
()'

Chuhong Yuan (1):
      ASoC: sta32x: add missed function calls in error paths

Colin Ian King (1):
      ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"

Dan Murphy (9):
      ASoC: tlv320adcx140: Fix mic gain registers
      ASoC: tlv320adcx140: Fix bias config values
      ASoC: tlv320adcx140: Add controls for PDM clk
      ASoC: tlv320adcx140: Add device tree property for PDM edges
      ASoC: tlv320adcx140: Configure PDM sampling edge
      dt-bindings: sound: tlv320adcx140: Add GPI config property
      ASoC: tlv320adcx140: Add support for configuring GPI pins
      ASoC: tlv320adcx140: Fix warnings when using W=3D1
      ASoC: tlv320adcx140: Fix dt-binding-check issue

Daniel Baluta (5):
      ASoC: SOF: imx: Add i.MX8M HW support
      ASoC: SOF: Add i.MX8MP device descriptor
      dt-bindings: dsp: fsl: Add fsl,imx8mp-dsp entry
      ASoC: SOF: Do nothing when DSP PM callbacks are not set
      ASoC: SOF: define INFO_ flags in dsp_ops

Dinghao Liu (6):
      ASoC: ti: Fix runtime PM imbalance in omap2_mcbsp_set_clks_src
      ASoC: tas2552: Fix runtime PM imbalance in tas2552_component_probe
      ASoC: img-spdif-out: Fix runtime PM imbalance on error
      ASoC: img-spdif-in: Fix runtime PM imbalance on error
      ASoC: wm8962: Fix runtime PM imbalance on error
      ASoC: img-i2s-out: Fix runtime PM imbalance on error

Dmitry Osipenko (2):
      ASoC: tegra: tegra_wm8903: Support nvidia, headset property
      ASoC: tegra-wm8903: Document new nvidia, headset property

Fabio Estevam (2):
      ASoC: fsl_micfil: Remove unneeded ifdef's
      ASoC: fsl_micfil: Do not pass irq numbers in comments

Geert Uytterhoeven (1):
      ASoC: Fix misspellings of "Analog Devices"

Gustavo A. R. Silva (2):
      ASoC: soc-core: Replace zero-length array with flexible-array
      ASoC: Intel: Skylake: Replace zero-length array with flexible-array

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore WT8-A tablet

Hui Wang (1):
      ASoC: intel/skl/hda - set autosuspend timeout for hda codecs

Jack Yu (1):
      ASoC: rt1015: Add condition to prevent SoC providing bclk in ratio of=
 50 times of sample rate.

Jaroslav Kysela (1):
      ASoC: snd-sof-intel-hda-common - add hda_model parameter and pass it =
to HDA codec driver

Jaska Uimonen (2):
      ASoC: SOF: topology: stop parsing when all tokens have been found
      ASoC: SOF: topology: handle multiple sets of tuple arrays

Jason Yan (9):
      ASoC: wm8994: remove wm1811_snd_controls and mixin_boost_tlv
      ASoC: wm8991: remove defined but not used 'wm8991_dapm_rxvoice_contro=
ls'
      ASoC: wm8990: remove some defined but unused symbols
      ASoC: wm8900: remove some defined but not used symbols
      ASoC: wcd934x: remove unnecessary comparisons to bool
      ASoC: wcd9335: remove unneeded semicolon
      ASoC: wcd934x: remove unneeded semicolon
      ASoC: soc-core: return true, false in snd_soc_volsw_is_stereo()
      ASoC: ti: remove comparison to bool in omap_mcbsp_dai_set_dai_fmt()

Johan Jonker (1):
      ASoC: rockchip-i2s: add description for rk3308

John Stultz (1):
      ASoC: qcom: q6asm-dai: kCFI fix

Kai Vehmanen (2):
      ASoC: intel/skl/hda - fix oops on systems without i915 audio codec
      ASoC: SOF: Intel: hda: fix generic hda codec support

Kai-Heng Feng (1):
      ASoC: SOF: Update correct LED status at the first time usage of updat=
e_mute_led()

Karol Trzcinski (11):
      ASoC: SOF: Mark get_ext* function ext_hdr arguments as const
      ASoC: SOF: Introduce offset in firmware data
      ASoC: SOF: Introduce extended manifest
      ASoC: SOF: ext_manifest: parse firmware version
      ASoC: SOF: ext_manifest: parse windows
      ASoC: SOF: ext_manifest: parse compiler version
      ASoC: SOF: loader: Adjust validation condition for fw_offset
      ASoC: SOF: Introduce extended manifest
      ASoC: SOF: ext_manifest: parse firmware version
      ASoC: SOF: ext_manifest: parse windows
      ASoC: SOF: ext_manifest: parse compiler version

Keyon Jie (5):
      ASoC: Intel: sof-da7219-max98373: add DMIC widget and route
      ASoC: SOF: topology: add support to smart amplifier
      ASoC: SOF: Intel: BYT: harden IPC initialization and handling
      ASoC: topology: refine and log the header in the correct pass
      ASoC: topology: remove the redundant pass checks

Krzysztof Kozlowski (1):
      dt-bindings: sound: wm8994: Correct required supplies based on actual=
 implementaion

Kuninori Morimoto (78):
      ASoC: soc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI =
pointer
      ASoC: soc-core: set rtd->num_cpu/codec at soc_new_pcm_runtime()
      ASoC: soc-core: tidyup soc_new_pcm_runtime() rtd setups
      ASoC: soc-core: remove cpu_dai/codec_dai/cpu_dais/codec_dais
      soundwire: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro f=
or DAI pointer
      ASoC: soc-compress: add snd_compress_ops
      ASoC: codec: wm_adsp: use snd_compress_ops
      ASoC: uniphier: use snd_compress_ops
      ASoC: qcom: q6sp6: use snd_compress_ops
      ASoC: intel: atom: use snd_compress_ops
      ASoC: sof: use snd_compress_ops
      ASoC: sprd: use snd_compress_ops
      ASoC: soc-compress: remove snd_compr_ops
      ASoC: soc-dai: add soc_dai_err()
      ASoC: soc-dai: don't overwide dai->driver->ops
      ASoC: soc-dai: add snd_soc_pcm_dai_new()
      ASoC: soc-dai: add snd_soc_pcm_dai_prepare()
      ASoC: soc-dai: add snd_soc_pcm_dai_trigger()
      ASoC: soc-dai: add snd_soc_pcm_dai_bespoke_trigger()
      ASoC: soc-dai: add snd_soc_pcm_dai_probe()
      ASoC: soc-dai: add snd_soc_pcm_dai_remove()
      ASoC: soc-dai: add snd_soc_dai_compr_start()
      ASoC: soc-dai: add snd_soc_dai_compr_shutdown()
      ASoC: soc-dai: add snd_soc_dai_compr_trigger()
      ASoC: soc-dai: add snd_soc_dai_compr_set_params()
      ASoC: soc-dai: add snd_soc_dai_compr_get_params()
      ASoC: soc-dai: add snd_soc_dai_compr_ack()
      ASoC: soc-dai: add snd_soc_dai_compr_pointer()
      ASoC: soc-dai: add snd_soc_dai_compr_set_metadata()
      ASoC: soc-dai: add snd_soc_dai_compr_get_metadata()
      ASoC: dt-bindings: simple-card: switch to yaml base Documentation
      ASoC: soc-pcm: replace snd_soc_runtime_activate()/deactivate() to mac=
ro
      ASoC: soc-dai: add snd_soc_dai_action()
      ASoC: soc-dapm: use snd_soc_dai_activate()/deactivate()
      ASoC: soc-dai: add snd_soc_dai_active()
      ASoC: soc-component: add snd_soc_component_active()
      ASoC: soc-dai: add snd_soc_dai_stream_active()
      ASoC: use snd_soc_xxx_active()
      ASoC: atomel: use snd_soc_xxx_active()
      ASoC: bcm: use snd_soc_xxx_active()
      ASoC: cirrus: use snd_soc_xxx_active()
      ASoC: codecs: use snd_soc_xxx_active()
      ASoC: fsl: use snd_soc_xxx_active()
      ASoC: intel: use snd_soc_xxx_active()
      ASoC: jz4740: use snd_soc_xxx_active()
      ASoC: mediatek: use snd_soc_xxx_active()
      ASoC: meson: use snd_soc_xxx_active()
      ASoC: pxa: use snd_soc_xxx_active()
      ASoC: ti: use snd_soc_xxx_active()
      ASoC: uniphier: use snd_soc_xxx_active()
      ASoC: dwc: use snd_soc_xxx_active()
      ASoC: cleanup dai / component active code
      ASoC: add soc-link.c
      ASoC: soc-link: move soc_rtd_xxx()
      ASoC: soc-link: remove unneeded parameter from snd_soc_link_xxx()
      ASoC: soc-link: add snd_soc_link_be_hw_params_fixup()
      ASoC: soc-link: add snd_soc_link_compr_startup()
      ASoC: soc-link: add snd_soc_link_compr_shutdown()
      ASoC: soc-link: add snd_soc_link_compr_set_params()
      ASoC: soc.h: convert bool to bit field for snd_soc_card
      ASoC: add soc-card.c
      ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card
      ASoC: soc-card: move snd_soc_card_jack_new() to soc-card
      ASoC: soc-card: move snd_soc_card_set/get_drvdata() to soc-card
      ASoC: soc-card: move snd_soc_card_get_codec_dai() to soc-card
      ASoC: soc-card: move snd_soc_card_subclass to soc-card
      ASoC: soc-card: add snd_soc_card_suspend_pre()
      ASoC: soc-card: add snd_soc_card_suspend_post()
      ASoC: soc-card: add snd_soc_card_resume_pre()
      ASoC: soc-card: add snd_soc_card_resume_post()
      ASoC: soc-card: add probed bit field to snd_soc_card
      ASoC: soc-card: add snd_soc_card_probe()
      ASoC: soc-card: add snd_soc_card_late_probe()
      ASoC: soc-card: add snd_soc_card_remove()
      ASoC: soc-card: add snd_soc_card_set_bias_level()
      ASoC: soc-card: add snd_soc_card_set_bias_level_post()
      ASoC: soc-card: add snd_soc_card_add_dai_link()
      ASoC: soc-card: add snd_soc_card_remove_dai_link()

Lad Prabhakar (1):
      dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support

Libin Yang (6):
      ALSA: hda: Add ElkhartLake HDMI codec vid
      ASoC: SOF: Intel: add PCI ID for ElkhartLake
      ASoC: Intel: boards: support Elkhart Lake with rt5660
      ASoC: intel: add depends on SND_SOC_SOF_HDA_AUDIO_CODEC for common hd=
mi
      ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC condition
      ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI condition

Lubomir Rintel (12):
      ASoC: mmp-sspa: Flip SNDRV_PCM_FMTBIT_S24_3LE on
      ASoC: mmp-sspa: Drop S20_3LE case
      ASoC: mmp-sspa: A trivial typo fix
      ASoC: mmp-sspa: Get rid of dma_params and phys_base
      ASoC: mmp-sspa: Add support for soc-generic-dmaengine-pcm
      ASoC: mmp-sspa: Remove the embedded struct ssp_device
      ASoC: mmp-sspa: Prepare/unprepare the clocks
      ASoC: mmp-sspa: Add support for the runtime power management
      ASoC: mmp-sspa: Set appropriate bus format for given bit width
      ASoC: mmp-sspa: Add Device Tree support
      ASoC: Add Marvell MMP SSPA binding
      ASoC: mmp-sspa: Fix the error handling in probe()

Mac Chiang (1):
      ASoC: Intel: boards: split woofer and tweeter support

Marcin Rajwa (2):
      ASoC: SOF: add a power_down_notify method
      ASoC: SOF: inform DSP that driver is going to be removed

Mark Brown (37):
      Merge series "ASoC: remove rtd->cpu/codec_dai{s} v2" from Kuninori Mo=
rimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Intel: machine drivers update for 5.8" from Pierr=
e-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Support headset on Tegra boards that use WM8903" from D=
mitry Osipenko <digetx@gmail.com>:
      Merge series "ASoC: SOF: trivial code cleanups" from Pierre-Louis Bos=
sart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: adjust dmesg verbosity" from Pierre-Louis Bo=
ssart <pierre-louis.bossart@linux.intel.com>:
      Merge branch 'asoc-5.7' into asoc-5.8
      Merge series "Add support for SOF on i.MX8M" from Daniel Baluta <dani=
el.baluta@oss.nxp.com> Daniel Baluta <daniel.baluta@nxp.com>:
      Merge series "ASoC: SOF: topology and firmware IPC updates for 5.8" f=
rom Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: Fix dependency issues of SND_SOC" from Wei Li <li=
wei391@huawei.com>:
      Merge series "ASoC: add snd_compress_ops and replace" from Kuninori M=
orimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Add new module driver for new ASRC" from Shengjiu=
 Wang <shengjiu.wang@nxp.com>:
      Merge tag 'tegra-for-5.7-asoc' of git://git.kernel.org/.../tegra/linu=
x into asoc-5.7
      ASoC: SOF: Fix build
      ASoC: dmic: Allow GPIO operations to sleep
      ASoC: SOF: Add missing dependency on IMX_SCU
      Merge branch 'for-5.7' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.8
      Merge series "add channel constraint for BDW machine drivers" from Br=
ent Lu <brent.lu@intel.com>:
      Merge series "Kconfig updates for DMIC and SOF HDMI support" from Ran=
jani Sridharan <ranjani.sridharan@linux.intel.com>:
      Merge series "ASoC: soc-dai: add snd_soc_dai_xxx()" from Kuninori Mor=
imoto <kuninori.morimoto.gx@renesas.com> Kuninori Morimoto <kuninori.morimo=
to.gx@renesas.com>:
      Merge series "SOF topology parsing updates" from Ranjani Sridharan <r=
anjani.sridharan@linux.intel.com>:
      Merge series "ASoC: rt5682: apply some refactors" from Tzung-Bi Shih =
<tzungbi@google.com>:
      Merge branch 'for-5.7' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.8
      Merge branch 'for-5.7' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.8
      Merge series "ASoC: fsl_esai: Add support for imx8qm" from Shengjiu W=
ang <shengjiu.wang@nxp.com>:
      Merge series "ASoC: da7213: support for usage with simple-card" from =
Sebastian Reichel <sebastian.reichel@collabora.com>:
      Merge series "ASoC: Intel: minor fixes to machine drivers" from Pierr=
e-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: codecs: rt*-sdw: memory leaks and simplifications=
" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: cleanup DAI/Component activity" from Kuninori Mor=
imoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: SOF: Intel and IMX updates for 5.8" from Kai Vehm=
anen <kai.vehmanen@linux.intel.com>:
      Merge series "Add Renoir ACP driver" from Vijendar Mukunda <Vijendar.=
Mukunda@amd.com>:
      Merge series "ASoC: SOF: extended manifest support for 5.8" from Kai =
Vehmanen <kai.vehmanen@linux.intel.com>:
      Merge series "ASoC: add soc-link" from Kuninori Morimoto <kuninori.mo=
rimoto.gx@renesas.com>:
      Merge series "ASoC: SOF: finalize Baytrail/CherryTrail support" from =
Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC topology header parsing refinement" from Keyon Jie=
 <yang.jie@linux.intel.com>:
      Merge series "Kconfig updates for DMIC and SOF HDMI support" from Pie=
rre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge remote-tracking branch 'asoc/for-5.7' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.8' into asoc-linus

Mateusz Gorski (3):
      ASoC: Intel: Skylake: Add alternative topology binary name
      ASoC: Intel: Multiple I/O PCM format support for pipe
      ASoC: Intel: Skylake: Automatic DMIC format configuration according t=
o information from NHLT

Oder Chiou (4):
      ASoC: rt1308: Revise the devicetree file mode
      ASoC: rl6231: Add the K bypass for the PLL parameters
      ASoC: rt1016: Add the rt1016 support
      ASoC: rt1016: Add the devicetree file for the rt1016

Pan Xiuli (6):
      ASoC: SOF: add probe support extend data
      ASoC: SOF: add debug ABI version
      ASoC: SOF: change type char to uint8_t in info.h
      ASoC: SOF: change type char to uint8_t in trace.h
      ASoC: SOF: change type char to uint8_t in topology.h
      ASoC: SOF: make sof_ipc_cc_version to fixed length

Paul Cercueil (1):
      ASoC: ingenic: Unconditionally depend on devicetree

Pavel Dobias (7):
      ASoC: max9867: fix volume controls
      ASoC: max9867: fix ADC level control
      ASoC: max9867: don't use regmap defaults
      ASoC: max9867: add filter controls
      ASoC: max9867: add mono playback switch
      ASoC: max9867: add digital microphone controls
      ASoC: max9867: keep ADCs and DACs always on

Payal Kshirsagar (2):
      ASoC: SOF: remove unneeded variables
      ASoC: SOF: Intel: hda: remove unnecessary parentheses

Pierre-Louis Bossart (29):
      ASoC: codecs: rt1308-sdw: reduce verbosity
      ASoC: SOF: Intel: hda: reduce verbosity on SoundWire detection
      ASoC: SOF: Intel: hda: log number of microphones detected in NHLT tab=
les
      ASoC: Intel: sof_sdw_hdmi: fix compilation issue in fallback mode
      ASoC: Intel: sof_sdw_hdmi: remove codec_dai use
      ASoC: Intel: sof_sdw_rt1308: remove codec dai use
      ASoC: Intel: sof_sdw_rt5682: remove codec_dai use
      ASoC: Intel: sof_sdw_rt700: remove codec_dai use
      ASoC: Intel: sof_sdw_rt711: remove codec_dai use
      ASoC: Intel: skl_hda_generic: remove rtd->codec_dai
      ASoC: SOF: imx: fix undefined reference issue
      ASoC: Intel: boards: add explicit dependency on GPIOLIB when DMIC is =
used
      ASoC: Intel: boards: sof-wm8804: support for Hifiberry Digiplus boards
      ASoC: SOF/Intel: clarify SPDX license with GPL-2.0-only
      ASoC: codecs: rt*-sdw: don't assign slave_ops
      ASoC: codecs: rt*-sdw: fix memory leak in set_sdw_stream()
      ASoC: codecs: rt1308-sdw: remove duplicate allocation
      ASoC: SOF: imx: make dsp_ops static
      ASoC: SOF: imx: make imx8m_dsp_ops static
      ASoC: Intel: soc-acpi: change machine driver name for WM8804 platforms
      ASoC: Intel: sof_sdw: fix typo in components string
      ASoC: Intel: sof_sdw_rt711: remap buttons
      ASoC: Intel: sof_sdw_rt700: remap buttons
      ASoC: Intel: cht_bsw_nau8824: remap BTN_0 as KEY_PLAYPAUSE
      ASoC: Intel: bytcr_rt5640/51: remove .ignore_suspend
      ASoC: Intel: byt/cht: add .pm_ops
      ASoC: SOF: Intel: BYT: mask BUSY or DONE interrupts in handler
      ASoC: reduce verbosity of error messages for sof-dai and sof-link
      ASoC: SOF: Intel: Baytrail: fix 'defined but not used' warnings

Qiushi Wu (1):
      ASoC: fix incomplete error-handling in img_i2s_in_probe.

Ranjani Sridharan (6):
      ASoC: soc-core: Add dynamic debug logs in soc_dai_link_sanity_check()
      ASoC: Intel: broadwell: Fix oops during module removal
      ASoC: SOF: Intel: byt: Add PM callbacks
      ASoC: SOF: pm: handle resume on legacy Intel platforms
      ASoC: SOF: ipc: ignore DSP replies received when they are not expected
      ASoC: SOF: Intel: BYT: add .remove op

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Removing unnecessary instance initialization

Robert Jarzmik (1):
      ASoC: pxa: remove Compulab pxa2xx boards

Rong Chen (1):
      ASoC: soc-compress: avoid false-positive Wuninitialized warning

Sebastian Reichel (4):
      ASoC: da7213: Add da7212 DT compatible
      ASoC: da7213: Add regulator support
      ASoC: da7213: move set_sysclk to codec level
      ASoC: da7213: move set_pll to codec level

Sebastiano Carlucci (1):
      ASoC: SOF: topology: Add support for DC Blocker

Seppo Ingalsuo (3):
      ASoC: SOF: Intel: Fix typo in header file comment text
      ASoC: SOF: Intel: Change DMIC load IPC to fixed length
      ASoC: SOF: Intel: Rename deprecated DMIC IPC struct field

Seven Lee (2):
      ASoc: nau8810: add AUX related dapm widgets and routes
      ASoC: nau8810: add I2C device and compatible ID

Shengjiu Wang (16):
      ASoC: fsl_asrc: rename asrc_priv to asrc
      ASoC: dt-bindings: fsl_asrc: Add new property fsl, asrc-format
      ASoC: fsl-asoc-card: Support new property fsl, asrc-format
      ASoC: fsl_asrc: Support new property fsl,asrc-format
      ASoC: fsl_asrc: Move common definition to fsl_asrc_common
      ASoC: dt-bindings: fsl_easrc: Add document for EASRC
      ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
      ASoC: wm8962: set CLOCKING2 as non-volatile register
      ASoC: fsl_esai: Disable exception interrupt before scheduling tasklet
      ASoC: fsl_easrc: Check for null pointer before dereferencing "ctx" in=
 fsl_easrc_hw_free()
      ASoC: wm8524: Add support S32_LE
      ASoC: wm8962: Use force clear for WM8962_SYSCLK_ENA after reset
      ASoC: fsl_esai: introduce SoC specific data
      ASoC: fsl_esai: Add new compatible string for imx8qm
      ASoC: fsl_asrc: Set ASR76K and ASR56K based on processing clock
      ASoC: fsl_asrc: Merge suspend/resume function to runtime_suspend/resu=
me

Sowjanya Komatineni (4):
      ASoC: tegra: Use device managed resource APIs to get the clock
      ASoC: nau8825: Change Tegra clk_out_2 provider to PMC
      ASoC: tegra: Add audio mclk parent configuration
      ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()

Stephan Gerhold (3):
      ASoC: qdsp6: Suggest more generic node names
      dt-bindings: sound: lpass-cpu: Document DAI subnodes
      ASoC: qcom: lpass-cpu: Make I2S SD lines configurable

Steve Lee (1):
      ASoC: max98390: Added Amplifier Driver

Sven Van Asbroeck (2):
      dt-bindings: sound: add Microsemi ZL38060 binding
      ASoC: Add initial ZL38060 driver

Tang Bin (10):
      ASoC: fsl_micfil: Omit superfluous error message in fsl_micfil_probe()
      ASoC: hisilicon: Use IS_ERR() instead of IS_ERR_OR_NULL()
      ASoC: mxs-saif: Avoid unnecessary check
      ASoC: hisilicon: Use the defined variable to clean code
      ASoC: mxs-saif: Fix unused assignment
      ASoC: qcom: Use the defined variable to simplify code
      ASoC: mediatek: Fix error handling
      ASoC: fsl_micfil: Fix indentation to put on one line affected code
      ASoC: fsl_micfil: Fix unused assignment in fsl_set_clock_params()
      ASoC: fsl: imx-audmix: Fix unused assignment to variable 'ret'

Tzung-Bi Shih (8):
      ASoC: rt5682: simplify assertions
      ASoC: rt5682: fix space issues
      ASoC: rt5682: remove empty default case
      ASoC: rt5682: replace message printing from pr_() to dev_()
      ASoC: rt5682: remove duplicate rt5682_reset() calls
      ASoC: rt5682: remove unwanted btn_type assignment
      ASoC: mediatek: mt8183: fix error handling of platform_get_irq()
      ASoC: mediatek: mt8183-da7219: set headset button maps

Vijendar Mukunda (17):
      ASoC: amd: add Renoir ACP3x IP register header
      ASoC: amd: add Renoir ACP PCI driver
      ASoC: amd: add acp init/de-init functions
      ASoC: amd: create acp3x pdm platform device
      ASoC: amd: add ACP3x PDM platform driver
      ASoC: amd: irq handler changes for ACP3x PDM dma driver
      ASoC: amd: add acp3x pdm driver dma ops
      ASoC: amd: add ACP PDM DMA driver dai ops
      ASoC: amd: add Renoir ACP PCI driver PM ops
      ASoC: amd: add ACP PDM DMA driver pm ops
      ASoC: amd: enable Renoir acp3x drivers build
      ASoC: amd: create platform devices for Renoir
      ASoC: amd: RN machine driver using dmic
      ASoC: amd: enable build for RN machine driver
      ASoC: amd: fix kernel warning
      ASoC: amd: refactoring dai_hw_params() callback
      ASoC: amd: return error when acp de-init fails

Wei Li (2):
      ASoC: wm89xx: Fix build errors caused by I2C dependency
      ASoC: Fix wrong dependency of da7210 and wm8983

Wei Yongjun (4):
      ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
      ASoC: rt5677: Use devm_snd_soc_register_component()
      ASoC: SOF: core: fix error return code in sof_probe_continue()
      ASoC: mmp-sspa: Fix return value check in asoc_mmp_sspa_probe()

Wolfram Sang (1):
      ASoC: codecs: max9768: update contact email

Xiyu Yang (2):
      ASoC: davinci-mcasp: Fix dma_chan refcnt leak when getting dma type
      ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed

Yong Zhi (2):
      ASoC: Intel: sof_da7219_max98373: Add BE dailink for dmic16k
      ASoC: max98373: reorder max98373_reset() in resume

Yongbo Zhang (1):
      SoC: rsnd: add interrupt support for SSI BUSIF buffer

YueHaibing (2):
      ASoC: SOF: imx8: Fix randbuild error
      ASoC: SOF: Intel: Fix unused variable warning

derek.fang (1):
      ASoC: rt1015: Enable class-D silence and clock detections

kbuild test robot (1):
      ASoC: fix semicolon.cocci warnings

randerwang (3):
      ASoC: Intel: sof_sdw: add amp number in components string for ucm
      ASoC: SOF: Intel: change trigger sequence to fix pop noise when stopp=
ing playback on sdw platforms
      ASoC: SOF: Intel: sdw: relax sdw machine select constraints

shengjiu wang (1):
      ASoC: fsl_asrc: Fix -Wmissing-prototypes warning

=E6=9C=B1=E7=81=BF=E7=81=BF (1):
      Subject: [PATCH v2] ASoC: soc-pcm: fix BE dai not hw_free and shutdow=
n during mixer update

 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |    2 +
 Documentation/devicetree/bindings/sound/da7213.txt |    8 +-
 .../devicetree/bindings/sound/fsl,asrc.txt         |    4 +
 .../devicetree/bindings/sound/fsl,easrc.yaml       |  101 +
 .../devicetree/bindings/sound/fsl,esai.txt         |    1 +
 .../bindings/sound/marvell,mmp-sspa.yaml           |  122 ++
 .../devicetree/bindings/sound/nau8810.txt          |    5 +-
 .../devicetree/bindings/sound/nau8825.txt          |    2 +-
 .../bindings/sound/nvidia,tegra-audio-wm8903.txt   |    1 +
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |   25 +
 .../devicetree/bindings/sound/qcom,q6adm.txt       |    2 +-
 .../devicetree/bindings/sound/qcom,q6afe.txt       |   46 +-
 .../devicetree/bindings/sound/qcom,q6asm.txt       |    7 +-
 .../devicetree/bindings/sound/qcom,q6core.txt      |    2 +-
 .../devicetree/bindings/sound/renesas,rsnd.txt     |    1 +
 .../devicetree/bindings/sound/rockchip-i2s.yaml    |   12 +-
 Documentation/devicetree/bindings/sound/rt1016.txt |   17 +
 Documentation/devicetree/bindings/sound/rt1308.txt |    0
 .../devicetree/bindings/sound/simple-card.txt      |  351 ----
 .../devicetree/bindings/sound/simple-card.yaml     |  484 +++++
 .../devicetree/bindings/sound/tlv320adcx140.yaml   |   51 +
 Documentation/devicetree/bindings/sound/wm8994.txt |   18 +-
 .../devicetree/bindings/sound/zl38060.yaml         |   69 +
 drivers/soundwire/intel.c                          |    4 +-
 include/sound/soc-acpi.h                           |    2 +-
 include/sound/soc-card.h                           |   69 +
 include/sound/soc-component.h                      |   46 +-
 include/sound/soc-dai.h                            |   62 +-
 include/sound/soc-dapm.h                           |    2 +-
 include/sound/soc-link.h                           |   27 +
 include/sound/soc.h                                |  104 +-
 include/sound/sof.h                                |    5 +-
 include/sound/sof/channel_map.h                    |    2 +-
 include/sound/sof/control.h                        |    2 +-
 include/sound/sof/dai-imx.h                        |    2 +-
 include/sound/sof/dai-intel.h                      |   22 +-
 include/sound/sof/dai.h                            |    2 +-
 include/sound/sof/ext_manifest.h                   |   95 +
 include/sound/sof/header.h                         |    2 +-
 include/sound/sof/info.h                           |   28 +-
 include/sound/sof/pm.h                             |    2 +-
 include/sound/sof/stream.h                         |    2 +-
 include/sound/sof/topology.h                       |   20 +-
 include/sound/sof/trace.h                          |    4 +-
 include/sound/sof/xtensa.h                         |    2 +-
 include/uapi/sound/skl-tplg-interface.h            |    2 +
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/tokens.h                    |    8 +
 sound/hda/intel-nhlt.c                             |    2 +-
 sound/pci/hda/patch_hdmi.c                         |    1 +
 sound/soc/Makefile                                 |    2 +-
 sound/soc/amd/Kconfig                              |   15 +-
 sound/soc/amd/Makefile                             |    1 +
 sound/soc/amd/raven/acp3x-i2s.c                    |    6 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   49 +-
 sound/soc/amd/renoir/Makefile                      |    7 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |  524 +++++
 sound/soc/amd/renoir/acp3x-rn.c                    |   77 +
 sound/soc/amd/renoir/rn-pci-acp3x.c                |  344 ++++
 sound/soc/amd/renoir/rn_acp3x.h                    |   88 +
 sound/soc/amd/renoir/rn_chip_offset_byte.h         |  349 ++++
 sound/soc/atmel/atmel_ssc_dai.c                    |    4 +-
 sound/soc/bcm/bcm2835-i2s.c                        |    6 +-
 sound/soc/bcm/cygnus-ssp.c                         |    4 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |    4 +-
 sound/soc/codecs/Kconfig                           |   40 +-
 sound/soc/codecs/Makefile                          |    6 +
 sound/soc/codecs/ad1980.c                          |    2 +-
 sound/soc/codecs/ad73311.c                         |    2 +-
 sound/soc/codecs/adau7118-i2c.c                    |    7 +
 sound/soc/codecs/adav80x.c                         |    4 +-
 sound/soc/codecs/arizona.c                         |    2 +-
 sound/soc/codecs/cros_ec_codec.c                   |   22 +-
 sound/soc/codecs/cs4271.c                          |    4 +-
 sound/soc/codecs/cs47l15.c                         |    9 +-
 sound/soc/codecs/cs47l24.c                         |    8 +-
 sound/soc/codecs/cs47l35.c                         |    9 +-
 sound/soc/codecs/cs47l85.c                         |    9 +-
 sound/soc/codecs/cs47l90.c                         |    9 +-
 sound/soc/codecs/cs47l92.c                         |    9 +-
 sound/soc/codecs/da7213.c                          |  102 +-
 sound/soc/codecs/da7213.h                          |    9 +
 sound/soc/codecs/dmic.c                            |    4 +-
 sound/soc/codecs/jz4725b.c                         |    4 +-
 sound/soc/codecs/jz4740.c                          |    4 +-
 sound/soc/codecs/jz4770.c                          |    2 +-
 sound/soc/codecs/madera.c                          |    2 +-
 sound/soc/codecs/max9768.c                         |    2 +-
 sound/soc/codecs/max98090.c                        |    6 +-
 sound/soc/codecs/max98373.c                        |    2 +-
 sound/soc/codecs/max98390.c                        | 1040 ++++++++++
 sound/soc/codecs/max98390.h                        |  663 ++++++
 sound/soc/codecs/max9867.c                         |   95 +-
 sound/soc/codecs/max9867.h                         |    1 -
 sound/soc/codecs/nau8810.c                         |   39 +-
 sound/soc/codecs/nau8810.h                         |    8 +
 sound/soc/codecs/rl6231.c                          |   29 +-
 sound/soc/codecs/rl6231.h                          |    1 +
 sound/soc/codecs/rt1015.c                          |   29 +-
 sound/soc/codecs/rt1015.h                          |    1 +
 sound/soc/codecs/rt1016.c                          |  695 +++++++
 sound/soc/codecs/rt1016.h                          |  232 +++
 sound/soc/codecs/rt1308-sdw.c                      |   15 +-
 sound/soc/codecs/rt5677-spi.c                      |   12 +-
 sound/soc/codecs/rt5682-i2c.c                      |  306 +++
 sound/soc/codecs/rt5682-sdw.c                      |  462 ++++-
 sound/soc/codecs/rt5682-sdw.h                      |   20 -
 sound/soc/codecs/rt5682.c                          |  888 +-------
 sound/soc/codecs/rt5682.h                          |   32 +-
 sound/soc/codecs/rt700-sdw.c                       |    3 -
 sound/soc/codecs/rt700.c                           |    3 +
 sound/soc/codecs/rt711-sdw.c                       |    3 -
 sound/soc/codecs/rt711.c                           |    3 +
 sound/soc/codecs/rt715-sdw.c                       |    3 -
 sound/soc/codecs/rt715.c                           |    3 +
 sound/soc/codecs/sta32x.c                          |   11 +-
 sound/soc/codecs/tas2552.c                         |    1 +
 sound/soc/codecs/tlv320adcx140.c                   |   96 +-
 sound/soc/codecs/tlv320adcx140.h                   |   11 +
 sound/soc/codecs/tlv320aic23.c                     |    2 +-
 sound/soc/codecs/tlv320dac33.c                     |    2 +-
 sound/soc/codecs/uda1380.c                         |    2 +-
 sound/soc/codecs/wcd9335.c                         |   44 +-
 sound/soc/codecs/wcd934x.c                         |   30 +-
 sound/soc/codecs/wl1273.c                          |    2 +-
 sound/soc/codecs/wm5102.c                          |    9 +-
 sound/soc/codecs/wm5110.c                          |    8 +-
 sound/soc/codecs/wm8524.c                          |    4 +-
 sound/soc/codecs/wm8711.c                          |    2 +-
 sound/soc/codecs/wm8753.c                          |    4 +-
 sound/soc/codecs/wm8782.c                          |    2 +-
 sound/soc/codecs/wm8900.c                          |    6 -
 sound/soc/codecs/wm8962.c                          |    9 +-
 sound/soc/codecs/wm8990.c                          |   98 -
 sound/soc/codecs/wm8991.c                          |    8 -
 sound/soc/codecs/wm8994.c                          |    8 -
 sound/soc/codecs/wm_adsp.c                         |   18 +-
 sound/soc/codecs/wm_adsp.h                         |   18 +-
 sound/soc/codecs/zl38060.c                         |  638 ++++++
 sound/soc/dwc/dwc-i2s.c                            |    2 +-
 sound/soc/fsl/Kconfig                              |   11 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl-asoc-card.c                      |   24 +-
 sound/soc/fsl/fsl_asrc.c                           |  368 ++--
 sound/soc/fsl/fsl_asrc.h                           |   74 +-
 sound/soc/fsl/fsl_asrc_common.h                    |  106 +
 sound/soc/fsl/fsl_asrc_dma.c                       |   55 +-
 sound/soc/fsl/fsl_audmix.c                         |    4 +-
 sound/soc/fsl/fsl_easrc.c                          | 2117 ++++++++++++++++=
++++
 sound/soc/fsl/fsl_easrc.h                          |  651 ++++++
 sound/soc/fsl/fsl_esai.c                           |   52 +-
 sound/soc/fsl/fsl_micfil.c                         |   17 +-
 sound/soc/fsl/fsl_spdif.c                          |    4 +-
 sound/soc/hisilicon/hi6210-i2s.c                   |   16 +-
 sound/soc/img/img-i2s-in.c                         |    1 +
 sound/soc/img/img-i2s-out.c                        |    8 +-
 sound/soc/img/img-spdif-in.c                       |    4 +-
 sound/soc/img/img-spdif-out.c                      |    4 +-
 sound/soc/intel/Kconfig                            |    8 +-
 sound/soc/intel/Makefile                           |    2 +-
 sound/soc/intel/atom/Makefile                      |    2 +-
 sound/soc/intel/atom/sst-atom-controls.h           |    2 +-
 sound/soc/intel/atom/sst-mfld-platform-compress.c  |   43 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |   16 +-
 sound/soc/intel/atom/sst-mfld-platform.h           |    2 +-
 sound/soc/intel/atom/sst/Makefile                  |    2 +-
 sound/soc/intel/baytrail/sst-baytrail-ipc.c        |    4 +-
 sound/soc/intel/boards/Kconfig                     |   83 +-
 sound/soc/intel/boards/Makefile                    |    6 +-
 sound/soc/intel/boards/bdw-rt5650.c                |   29 +
 sound/soc/intel/boards/bdw-rt5677.c                |   26 +
 sound/soc/intel/boards/broadwell.c                 |   43 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    5 +-
 sound/soc/intel/boards/bytcht_da7213.c             |    3 +
 sound/soc/intel/boards/bytcht_es8316.c             |    3 +
 sound/soc/intel/boards/bytcr_rt5640.c              |   19 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    3 +
 sound/soc/intel/boards/cht_bsw_nau8824.c           |    7 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    3 +
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    3 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |  224 ++-
 sound/soc/intel/boards/ehl_rt5660.c                |  323 +++
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |    2 +-
 sound/soc/intel/boards/hda_dsp_common.c            |    2 +-
 sound/soc/intel/boards/hda_dsp_common.h            |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    2 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |    2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h        |    2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |   33 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |   23 +-
 sound/soc/intel/boards/sof_maxim_common.c          |    2 +-
 sound/soc/intel/boards/sof_maxim_common.h          |    2 +-
 sound/soc/intel/boards/sof_pcm512x.c               |   11 +-
 sound/soc/intel/boards/sof_rt5682.c                |    2 +-
 sound/soc/intel/boards/sof_sdw.c                   |   65 +-
 sound/soc/intel/boards/sof_sdw_common.h            |    2 +-
 sound/soc/intel/boards/sof_sdw_dmic.c              |    2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c              |   11 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c            |    4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |    5 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   13 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   13 +-
 sound/soc/intel/boards/sof_sdw_rt715.c             |    2 +-
 sound/soc/intel/boards/sof_wm8804.c                |  298 +++
 sound/soc/intel/common/Makefile                    |    2 +-
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |    4 +-
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |    9 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-hda-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-skl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |    2 +-
 sound/soc/intel/common/soc-intel-quirks.h          |    2 +-
 sound/soc/intel/common/sst-dsp.c                   |    9 +-
 sound/soc/intel/haswell/sst-haswell-dsp.c          |  185 +-
 sound/soc/intel/skylake/Makefile                   |    2 +-
 sound/soc/intel/skylake/skl-i2s.h                  |    2 +-
 sound/soc/intel/skylake/skl-ssp-clk.c              |    2 +-
 sound/soc/intel/skylake/skl-sst-utils.c            |    2 +-
 sound/soc/intel/skylake/skl-topology.c             |  184 +-
 sound/soc/intel/skylake/skl-topology.h             |    5 +-
 sound/soc/intel/skylake/skl.h                      |    2 +-
 sound/soc/jz4740/Kconfig                           |    2 +-
 sound/soc/jz4740/jz4740-i2s.c                      |   12 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    7 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    8 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |    7 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   16 +-
 sound/soc/meson/axg-tdm-interface.c                |    2 +-
 sound/soc/mxs/mxs-saif.c                           |    5 +-
 sound/soc/pxa/Kconfig                              |   25 +-
 sound/soc/pxa/mmp-sspa.c                           |  445 ++--
 sound/soc/pxa/mmp-sspa.h                           |   32 +-
 sound/soc/pxa/pxa-ssp.c                            |    8 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |    2 +-
 sound/soc/qcom/lpass-apq8016.c                     |    9 +-
 sound/soc/qcom/lpass-cpu.c                         |  235 ++-
 sound/soc/qcom/lpass-lpaif-reg.h                   |   30 +-
 sound/soc/qcom/lpass.h                             |    4 +
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |   55 +-
 sound/soc/sh/rcar/gen.c                            |    8 +
 sound/soc/sh/rcar/rsnd.h                           |    9 +
 sound/soc/sh/rcar/ssi.c                            |  145 ++
 sound/soc/soc-card.c                               |  225 +++
 sound/soc/soc-compress.c                           |  281 ++-
 sound/soc/soc-core.c                               |  245 +--
 sound/soc/soc-dai.c                                |  485 +++--
 sound/soc/soc-dapm.c                               |   30 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |    6 +-
 sound/soc/soc-jack.c                               |   38 -
 sound/soc/soc-link.c                               |  155 ++
 sound/soc/soc-pcm.c                                |  251 +--
 sound/soc/soc-topology.c                           |   96 +-
 sound/soc/sof/Makefile                             |    2 +-
 sound/soc/sof/compress.c                           |    9 +-
 sound/soc/sof/compress.h                           |    9 +-
 sound/soc/sof/control.c                            |    6 +-
 sound/soc/sof/core.c                               |    9 +-
 sound/soc/sof/debug.c                              |    2 +-
 sound/soc/sof/imx/Kconfig                          |   34 +-
 sound/soc/sof/imx/Makefile                         |    4 +-
 sound/soc/sof/imx/imx8.c                           |    4 +-
 sound/soc/sof/imx/imx8m.c                          |  285 +++
 sound/soc/sof/intel/Makefile                       |    2 +-
 sound/soc/sof/intel/apl.c                          |    2 +-
 sound/soc/sof/intel/bdw.c                          |    2 +-
 sound/soc/sof/intel/byt.c                          |  172 +-
 sound/soc/sof/intel/cnl.c                          |    2 +-
 sound/soc/sof/intel/hda-bus.c                      |    2 +-
 sound/soc/sof/intel/hda-codec.c                    |   58 +-
 sound/soc/sof/intel/hda-compress.c                 |    2 +-
 sound/soc/sof/intel/hda-ctrl.c                     |    2 +-
 sound/soc/sof/intel/hda-dai.c                      |    2 +-
 sound/soc/sof/intel/hda-dsp.c                      |   10 +-
 sound/soc/sof/intel/hda-ipc.c                      |    2 +-
 sound/soc/sof/intel/hda-ipc.h                      |    2 +-
 sound/soc/sof/intel/hda-loader.c                   |   11 +-
 sound/soc/sof/intel/hda-pcm.c                      |    2 +-
 sound/soc/sof/intel/hda-stream.c                   |    2 +-
 sound/soc/sof/intel/hda-trace.c                    |    2 +-
 sound/soc/sof/intel/hda.c                          |   28 +-
 sound/soc/sof/intel/hda.h                          |    2 +-
 sound/soc/sof/intel/intel-ipc.c                    |    2 +-
 sound/soc/sof/intel/shim.h                         |    2 +-
 sound/soc/sof/ipc.c                                |   11 +-
 sound/soc/sof/loader.c                             |  213 +-
 sound/soc/sof/nocodec.c                            |    8 +-
 sound/soc/sof/ops.c                                |    2 +-
 sound/soc/sof/ops.h                                |    2 +-
 sound/soc/sof/pcm.c                                |   18 +-
 sound/soc/sof/pm.c                                 |   29 +-
 sound/soc/sof/probe.c                              |    2 +-
 sound/soc/sof/probe.h                              |    2 +-
 sound/soc/sof/sof-acpi-dev.c                       |    2 +-
 sound/soc/sof/sof-audio.c                          |    2 +-
 sound/soc/sof/sof-audio.h                          |    4 +-
 sound/soc/sof/sof-of-dev.c                         |   16 +-
 sound/soc/sof/sof-pci-dev.c                        |    4 +-
 sound/soc/sof/sof-priv.h                           |    7 +-
 sound/soc/sof/topology.c                           |  485 +++--
 sound/soc/sof/trace.c                              |    2 +-
 sound/soc/sof/utils.c                              |    2 +-
 sound/soc/sof/xtensa/Makefile                      |    2 +-
 sound/soc/sof/xtensa/core.c                        |    2 +-
 sound/soc/sprd/sprd-pcm-compress.c                 |   49 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |    2 +-
 sound/soc/sprd/sprd-pcm-dma.h                      |    2 +-
 sound/soc/tegra/tegra_alc5632.c                    |    7 +-
 sound/soc/tegra/tegra_asoc_utils.c                 |  113 +-
 sound/soc/tegra/tegra_asoc_utils.h                 |    1 -
 sound/soc/tegra/tegra_max98090.c                   |   22 +-
 sound/soc/tegra/tegra_rt5640.c                     |   22 +-
 sound/soc/tegra/tegra_rt5677.c                     |    7 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |    7 +-
 sound/soc/tegra/tegra_wm8753.c                     |   22 +-
 sound/soc/tegra/tegra_wm8903.c                     |   42 +-
 sound/soc/tegra/tegra_wm9712.c                     |    8 +-
 sound/soc/tegra/trimslice.c                        |   18 +-
 sound/soc/ti/davinci-mcasp.c                       |    6 +-
 sound/soc/ti/omap-dmic.c                           |    4 +-
 sound/soc/ti/omap-mcbsp.c                          |   21 +-
 sound/soc/ti/omap-mcpdm.c                          |    8 +-
 sound/soc/uniphier/aio-compress.c                  |   45 +-
 sound/soc/uniphier/aio-cpu.c                       |    4 +-
 sound/soc/uniphier/aio-dma.c                       |    2 +-
 sound/soc/uniphier/aio.h                           |    2 +-
 sound/soc/ux500/mop500.c                           |   11 +-
 335 files changed, 15208 insertions(+), 4136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/marvell,mmp-ssp=
a.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rt1016.txt
 mode change 100755 =3D> 100644 Documentation/devicetree/bindings/sound/rt1=
308.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/simple-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/simple-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/zl38060.yaml
 create mode 100644 include/sound/soc-card.h
 create mode 100644 include/sound/soc-link.h
 create mode 100644 include/sound/sof/ext_manifest.h
 create mode 100644 sound/soc/amd/renoir/Makefile
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h
 create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h
 create mode 100644 sound/soc/codecs/max98390.c
 create mode 100644 sound/soc/codecs/max98390.h
 create mode 100644 sound/soc/codecs/rt1016.c
 create mode 100644 sound/soc/codecs/rt1016.h
 create mode 100644 sound/soc/codecs/rt5682-i2c.c
 delete mode 100644 sound/soc/codecs/rt5682-sdw.h
 create mode 100644 sound/soc/codecs/zl38060.c
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h
 create mode 100644 sound/soc/fsl/fsl_easrc.c
 create mode 100644 sound/soc/fsl/fsl_easrc.h
 create mode 100644 sound/soc/intel/boards/ehl_rt5660.c
 create mode 100644 sound/soc/intel/boards/sof_wm8804.c
 create mode 100644 sound/soc/soc-card.c
 create mode 100644 sound/soc/soc-link.c
 create mode 100644 sound/soc/sof/imx/imx8m.c

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7U8OMACgkQJNaLcl1U
h9DVrwf+JTxcvXdL3lA0b9igrtxwzWclS/qYfEY4Kzq1x/xjy8zmvIwE1QZd2Kmu
6SoeHrYNFjVAjbw/wWT3sfj2323TW8b8wo2ZLc1PGklrSVHxeNAsNsUytiRelOAQ
DFj8J0FZmiLlWIQlZR7QuC3NT3icXZ6uSR5L/Rh1vZzejSU8uZ0z/GRW9Uw5id8S
MAPqXXryHUlnHUgp4u0rPzGlt3dbV0fVawMQ5++O+3CFGWIsjRP29gJ/839JJZQp
3INkpiF57HjW8C/pdM4YZvw32pOL7aQ8RtAOT/ux9nzEmLsRwdse/+X4ur9M7rzo
rTi9FcX0J1v6apj4sK18+EWxEDJlNg==
=fL2p
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
