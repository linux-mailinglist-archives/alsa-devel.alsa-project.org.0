Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADA3FB670
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 14:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096BC172F;
	Mon, 30 Aug 2021 14:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096BC172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630327891;
	bh=BK+gInvOG5tJtTcj6nkc86woxs6gS5QnP5h55GTdJ1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O0kB21qujEnF/tG2lkzUmrXtTFJAXNGjGWrhUfJgk8yF3f3au0RuQQljICdM/9OPA
	 EJCrBd6hstW1BrY8SkCLO284iHxlDIZirOn6EAPO6YxgOb9qBnNcgw7ms11lMO2WTf
	 d4v+E/XmdJL5icv6agnjaDsPt1ysGPVKmuLHsZG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4EDF80256;
	Mon, 30 Aug 2021 14:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 567D1F80227; Mon, 30 Aug 2021 14:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D67E0F80171
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 14:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D67E0F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HDF+om3r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GmGn429HkLWtDr2JSn3tRz0MW7xpcr/moMo1Tlfo2tE=; b=HDF+om3rvhbPyIGT3KhL8LsCpE
 Pqp1PDMrZVopTivtYJ51EDiO+jrmdx4wy0LdJMoTjCc6Mkx9EdDqzD1Sn5zfBgKkOxFirYPKUO47V
 JAI7CjK9+NKctyJ6G5cF8PUUehkdN2bwmHuf3pgjXcUX23OibznirKSfMU29eLdLHfiU=;
Received: from jack.einval.com ([84.45.184.145] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mKgk9-00H5FS-G4; Mon, 30 Aug 2021 12:50:29 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 17507D1B484; Mon, 30 Aug 2021 13:50:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.15
Date: Mon, 30 Aug 2021 13:50:23 +0100
Message-Id: <20210830125029.17507D1B484@fitzroy.sirena.org.uk>
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

The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:

  Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.15

for you to fetch changes up to 38b7673000949ca784fcb8a9feb70d2a802befa6:

  Merge remote-tracking branch 'asoc/for-5.15' into asoc-linus (2021-08-30 12:30:33 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.15

Quite a quiet release this time, mostly a combination of cleanups
and a good set of new drivers.

 - Lots of cleanups and improvements to the Intel drivers,
   including some new systems support.
 - New support for AMD Vangoh, CUI CMM-4030D-261, Mediatek
   Mt8195, Renesas RZ/G2L Mediatek Mt8195, RealTek RT101P,
   Renesas RZ/G2L,, Rockchip RK3568 S/PDIF.

----------------------------------------------------------------
Aakash Hemadri (4):
      ASoC: tegra30: ahub: Use of_device_get_match_data
      ASoC: tegra30: i2s: Use of_device_get_match_data
      ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
      ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data

Angelo Dureghello (3):
      ASoC: ics43432: add CMM-4030D-261 support
      dt-bindings: add compatible vendor prefix for CUI Devices
      ASoC: ics43432: add compatible for CUI Devices

Bard Liao (8):
      ASoC: Intel: sof_sdw: extends SOF_RT711_JDSRC to 4 bits
      ASoC: Intel: sof_sdw: include rt711.h for RT711 JD mode
      soundwire: move intel sdw register definitions to sdw_intel.h
      ASoC: SOF: intel: add sdw_shim/alh_base to sof_intel_dsp_desc
      ASoC: SOF: intel: hda: remove HDA_DSP_REG_SNDW_WAKE_STS definition
      ASoC: SOF: intel: move sof_intel_dsp_desc() forward
      ASoC: SOF: intel: add snd_sof_dsp_check_sdw_irq ops
      soundwire: intel: introduce shim and alh base

Biju Das (8):
      ASoC: dt-bindings: Document RZ/G2L bindings
      ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
      ASoC: sh: Add RZ/G2L SSIF-2 driver
      ASoC: dt-bindings: renesas,rz-ssi: Update slave dma channel configuration parameter
      ASoC: sh: rz-ssi: Add SSI DMAC support
      ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
      ASoC: sh: rz-ssi: Fix wrong operator used issue
      ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function

Brent Lu (6):
      ASoC: SOF: add a helper to get topology configured bclk
      ASoC: Intel: sof_cs42l42: use helper function to get bclk frequency
      ASoC: Intel: sof_cs42l42: support arbitrary DAI link sequence
      ASoC: Intel: maxim-common: support max98360a
      ASoC: Intel: sof_cs42l42: add support for jsl_cs4242_mx98360a
      ASoC: Intel: sof_rt5682: code refactor for max98360a

Cezary Rojewski (5):
      ASoC: Intel: kbl_da7219_max98927: Fix format selection for max98373
      ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
      ASoC: Intel: Skylake: Fix module resource and format selection
      ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
      ASoC: Intel: Skylake: Select first entry for singular pipe config arrays

Changcheng Deng (1):
      ASoC: SOF: intel: remove duplicate include

Charles Keepax (2):
      ASoC: wm_adsp: Remove pointless string comparison
      ASoC: wm_adsp: Put debugfs_remove_recursive back in

Christophe JAILLET (3):
      ASoC: wcd9335: Fix a double irq free in the remove function
      ASoC: wcd9335: Fix a memory leak in the error handling path of the probe function
      ASoC: wcd9335: Disable irq on slave ports in the remove function

Codrin Ciubotariu (1):
      ASoC: codecs: ad193x: add support for 96kHz and 192kHz playback rates

Colin Ian King (7):
      ASoC: codecs: lpass-rx-macro: clean up for-loop indentation in switch statement
      ASoC: Intel: Fix spelling contraction "cant" -> "can't"
      ASoC: rsnd: make some arrays static const, makes object smaller
      ASoC: tlv320aic32x4: make array clocks static, makes object smaller
      ASoC: rt5514: make array div static const, makes object smaller
      ASoC: uniphier: make arrays mul and div static const, makes object smaller
      ASoC: mediatek: mt8195: Fix spelling mistake "bitwiedh" -> "bitwidth"

Curtis Malainey (1):
      ASoC: Intel: Fix platform ID matching

Dan Carpenter (2):
      ASoC: ti: delete some dead code in omap_abe_probe()
      ASoC: amd: fix an IS_ERR() vs NULL bug in probe

Derek Fang (2):
      ASoC: rt5682: Adjust headset volume button threshold again
      ASoC: rt5682: Fix the vol+ button detection issue

Dmitry Osipenko (1):
      ASoC: rt5640: Silence warning message about missing interrupt

Douglas Anderson (2):
      ASoC: rt5682: Properly turn off regulators if wrong device ID
      ASoC: rt5682: Remove unused variable in rt5682_i2c_remove()

Gongjun Song (1):
      ASoC: Intel: soc-acpi: add support for SoundWire of TGL-H-RVP

Gu Shengxian (2):
      ASoC: atmel: fix spelling mistakes
      ASoC: amd: fix spelling mistakes

Gustaw Lewandowski (2):
      ASoC: Intel: Skylake: Fix passing loadable flag for module
      ASoC: Intel: Skylake: Simplify m_state for loadable modules

Hans de Goede (14):
      ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes to the maps for the matching in-/output
      ASoC: Intel: bytcr_rt5640: Add line-out support
      ASoC: Intel: bytcr_rt5640: Add a byt_rt5640_get_codec_dai() helper
      ASoC: Intel: bytcr_rt5640: Add support for a second headphones output
      ASoC: Intel: bytcr_rt5640: Add support for a second headset mic input
      ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 quirk
      ASoC: Intel: bytcr_rt5640: Use cfg-lineout:2 in the components string
      ASoC: rt5640: Move rt5640_disable_jack_detect() up in the rt5640.c file
      ASoC: rt5640: Delay requesting IRQ until the machine-drv calls set_jack
      ASoC: rt5640: Add optional hp_det_gpio parameter to rt5640_detect_headset()
      ASoC: rt5640: Add rt5640_set_ovcd_params() helper
      ASoC: Intel: bytct_rt5640: Add a separate "Headset Mic 2" DAPM pin for the mic on the 2nd jack
      ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2 jack-detect
      ASoC: Intel: bytcr_rt5640: Mark hp_elitepad_1000g2_jack?_check functions static

Heikki Krogerus (1):
      ASoC: Intel: boards: use software node API in Atom boards

Jack Yu (4):
      ASoC: rt1015: Remove unnecessary flush work on rt1015 driver
      ASoC: rt1015p: add new acpi id and comapatible id
      ASoC: dt-bindings: rt1015p: add new compatible id
      ASoC: dt-bindings: rt1015p: fix syntax error in dts-binding document

Jiri Slaby (2):
      ASoC: cx20442: tty_ldisc_ops::write_wakeup is optional
      ASoC: v253_init: eliminate pointer to string

Kareem Shaik (1):
      ASoC: Intel: Skylake: Support multiple format configs

Krzysztof Kozlowski (1):
      ASoC: rt1015p: correct indentation

Kuninori Morimoto (44):
      ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_apply_msb()
      ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_components_close()
      ASoC: soc-pcm: cleanup cppcheck warning at soc_get_playback_capture()
      ASoC: soc-pcm: cleanup cppcheck warning at dpcm_be_is_active()
      ASoC: soc-pcm: cleanup cppcheck warning at dpcm_runtime_setup_be_chan()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_set_dmi_name()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_get_dai_name()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_daifmt_parse_format()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_unregister_component()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_add_controls()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_of_parse_audio_simple_widgets()
      ASoC: soc-core: cleanup cppcheck warning at snd_soc_of_parse_audio_routing()
      ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_process_headers()
      ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dai_elems_load()
      ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_dapm_widget_elems_load()
      ASoC: soc-topology: cleanup cppcheck warning at soc_tplg_kcontrol_elems_load()
      ASoC: soc-topology: cleanup cppcheck warning at snd_soc_find_dai_link()
      ASoC: soc-ops: cleanup cppcheck warning at snd_soc_put_volsw_sx()
      ASoC: soc-ops: cleanup cppcheck warning at snd_soc_limit_volume()
      ASoC: soc-ops: cleanup cppcheck warning at snd_soc_get_xr_sx()
      ASoC: soc-ops: cleanup cppcheck warning at snd_soc_put_xr_sx()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_wcache_lookup()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_connect_mux()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_set_mixer_path_status()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_pga()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_dai_link()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_check_event()
      ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_run()
      ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_del_route()
      ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_add_routes()
      ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_weak_routes()
      ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_new_controls()
      ASoC: soc-dapm: cleanup cppcheck warning at soc_dapm_dai_stream_event()
      ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_hw_params()
      ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_new()
      ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_copy_user()
      ASoC: soc-dai: cleanup cppcheck warning at snd_soc_dai_link_set_capabilities()
      ASoC: soc-dai: cleanup cppcheck warning at snd_soc_pcm_dai_new()
      ASoC: soc-jack: cleanup cppcheck warning at snd_soc_jack_report()
      ASoC: soc-jack: cleanup cppcheck warning for CONFIG_GPIOLIB
      ASoC: soc-component: cleanup cppcheck warning at snd_soc_pcm_component_pm_runtime_get()
      ASoC: soc-ac97: cleanup cppcheck warning
      ASoC: rsnd: core: make some arrays static const, makes object smaller
      ASoC: rsnd: adg: clearly handle clock error / NULL case

Marek Vasut (1):
      ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 channel count

Mario Limonciello (2):
      ASoC: amd: Don't show messages about deferred probing by default
      ASoC: amd: Use dev_probe_err helper

Mark Brown (31):
      Merge existing fixes from asoc/for-5.14
      Merge series "ASoC: Intel: machine driver corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Fix unbalanced pm_runtime_enable in error handle" from Zhang Qilong <zhangqilong3@huawei.com>:
      Merge series "ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4 support" from Peter Ujfalusi <peter.ujfalusi@gmail.com>:
      Merge series "soundwire/ASoC: add mockup codec support" from Bard Liao <yung-chuan.liao@linux.intel.com>:
      Merge series "ASoC: soc-pcm: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: soc-core: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "Add RZ/G2L Sound support" from Biju Das <biju.das.jz@bp.renesas.com>:
      Merge series "ASoC: soc-topology: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2 audio routing" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "soundwire/ASoC: abstract platform-dependent bases" from Bard Liao <yung-chuan.liao@linux.intel.com>:
      Merge series "ASoC: SOF/Intel: machine driver updates" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: soc-ops: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: soc-dapm: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: codecs: cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge some cs42l42 patches into asoc-5.15
      Merge series "ASoC: SOF: Intel: DMI L1 power optimization for HDaudio platforms" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Add RZ/G2L Sound support" from Biju Das <biju.das.jz@bp.renesas.com>:
      Merge series "ASoC: Intel: boards: use software node API" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: soc-xxx: cleanup cppcheck warning" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: tegra30: Fix use of of_device_get_match_data" from Aakash Hemadri <aakashhemadri123@gmail.com>:
      Merge series "ASoC: Intel/rt5640: Add support for HP Elite Pad 1000G2 jack-detect" from Hans de Goede <hdegoede@redhat.com>:
      Merge series "ASoC: Intel: Skylake: Fix and support complex" from Cezary Rojewski <cezary.rojewski@intel.com>:
      Merge series "ASoC: mediatek: Add support for MT8195 SoC" from Trevor Wu <trevor.wu@mediatek.com>:
      Merge branch 'for-5.14' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into asoc-5.15
      Merge series "Patches to update for rockchip spdif" from Sugar Zhang <sugar.zhang@rock-chips.com>:
      Merge series "Patches to update for rockchip i2s" from Sugar Zhang <sugar.zhang@rock-chips.com>:
      Merge series "ASoC: wcd9335: Firx some resources leak in the probe and remove function" from Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
      ASoC: Revert PCM trigger changes
      Merge remote-tracking branch 'asoc/for-5.14' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.15' into asoc-linus

Nobuhiro Iwamatsu (1):
      ASoC: mediatek: mt6359: convert to use module_platform_driver

Pawel Harlozinski (1):
      ASoC: Intel: Skylake: Properly configure modules with generic extension

Peter Ujfalusi (5):
      ASoC: ti: davinci-mcasp: Fix DIT mode support
      ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
      ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
      ASoC: ti: j721e-evm: Convert the audio domain IDs to enum
      ASoC: Intel: bytcr_rt5640: Make rt5640_jack_gpio/rt5640_jack2_gpio static

Pierre-Louis Bossart (24):
      ASoC: codecs: add SoundWire mockup device support
      ASoC: soc-acpi: cnl: add table for SoundWire mockup devices
      ASoC: soc-acpi: tgl: add table for SoundWire mockup devices
      ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests
      ASOC: Intel: sof_sdw: add quirk for Intel 'Bishop County' NUC M15
      ASoC: Intel: sof_sdw: add quirk for Dell XPS 9710
      ASoC: Intel: update sof_pcm512x quirks
      ASoC: Intel: sof_sdw_max98373: remove useless inits
      ASoC: max98090: remove duplicate status reads and useless assignmment
      ASoC: mt6359-accdet.c: remove useless assignments
      ASoC: wcd938x: simplify return value
      ASoC: SOF: Intel: Kconfig: clarify DMI L1 option description
      ASoC: SOF: Intel: hda-stream: remove always true condition
      ASoC: SOF: Intel: simplify logic for DMI_L1 handling
      ASoC: SOF: Intel: make DMI L1 selection more robust
      ASoC: Intel: boards: harden codec property handling
      ASoC: Intel: boards: handle errors with acpi_dev_get_first_match_dev()
      ASoC: Intel: boards: get codec device with ACPI instead of bus search
      ASoC: Intel: sof_sdw: pass card information to init/exit functions
      ASoC: Intel: sof_sdw_rt711*: keep codec device reference until remove
      ASoC: Intel: use software node API in SoundWire machines
      ASoC: Intel: remove device_properties for Atom boards
      ASoC: soc-pcm: protect BE dailink state changes in trigger
      ASoC: soc-pcm: test refcount before triggering

Piotr Maziarz (1):
      ASoC: Intel: Skylake: Select proper format for NHLT blob

Randy Dunlap (1):
      ASoC: atmel: ATMEL drivers don't need HAS_DMA

Richard Fitzgerald (4):
      ASoC: cs42l42: Add PLL configuration for 44.1kHz/16-bit
      ASoC: cs42l42: Validate dai_set_sysclk() frequency
      ASoC: cs42l42: Assume 24-bit samples are in 32-bit slots
      ASoC: cs42l42: Update module authors

Rikard Falkeborn (1):
      ASoC: samsung: Constify static snd_soc_ops

Robin Murphy (1):
      ASoC: dwc: Get IRQ optionally

Samuel Holland (1):
      ASoC: simple-card-utils: Avoid over-allocating DLCs

Shengjiu Wang (2):
      ASoC: fsl_rpmsg: Check -EPROBE_DEFER for getting clocks
      ASoC: imx-rpmsg: change dev_err to dev_err_probe for -EPROBE_DEFER

Shuming Fan (1):
      ASoC: rt5682: enable SAR ADC power saving mode during suspend

Srinivas Kandagatla (4):
      ASoC: codecs: wcd938x: remove unused port-map reference
      ASoC: codecs: wcd938x: add Multi Button Headset Control support
      ASoC: qdsp6: q6asm: fix cppcheck warnings for unnecessary initialization
      ASoC: qdsp6: q6adm: fix cppcheck warnings for unnecessary initialization

Steve Lee (1):
      ASoC: max98390: Add support change dsm param name

Sugar Zhang (13):
      ASoC: rockchip: spdif: Mark SPDIF_SMPDR as volatile
      ASoC: rockchip: spdif: Fix some coding style
      ASoC: rockchip: spdif: Add support for rk3568 spdif
      ASoC: dt-bindings: rockchip: Add compatible for rk3568 spdif
      ASoC: rockchip: i2s: Add support for set bclk ratio
      ASoC: rockchip: i2s: Fixup clk div error
      ASoC: rockchip: i2s: Improve dma data transfer efficiency
      ASoC: rockchip: i2s: Fix regmap_ops hang
      ASoC: dt-bindings: rockchip: Document reset property for i2s
      ASoC: rockchip: i2s: Make playback/capture optional
      ASoC: rockchip: i2s: Add compatible for more SoCs
      ASoC: dt-bindings: rockchip: Add compatible strings for more SoCs
      ASoC: rockchip: i2s: Add support for frame inversion

Szymon Mielczarek (1):
      ASoC: Intel: Skylake: Support modules with generic extension

Takashi Iwai (3):
      ASoC: amd: Drop superfluous mmap callbacks
      ASoC: intel: skylake: Drop superfluous mmap callback
      ASoC: amd: vangogh: Drop superfluous mmap callback

Tang Bin (2):
      ASoC: fsl_xcvr: Omit superfluous error message in fsl_xcvr_probe()
      ASoC: bcm: cygnus-pcm: Fix unused assignment about 'rc'

Trevor Wu (11):
      ASoC: mediatek: mt8195: update mediatek common driver
      ASoC: mediatek: mt8195: support audsys clock control
      ASoC: mediatek: mt8195: support etdm in platform driver
      ASoC: mediatek: mt8195: support adda in platform driver
      ASoC: mediatek: mt8195: support pcm in platform driver
      ASoC: mediatek: mt8195: add platform driver
      dt-bindings: mediatek: mt8195: add audio afe document
      ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682
      ASoC: mediatek: mt8195: add DPTX audio support
      ASoC: mediatek: mt8195: add HDMITX audio support
      dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682 document

Tzung-Bi Shih (1):
      ASoC: rt1015: remove possible unused variable `bclk_ms'

Vijendar Mukunda (12):
      ASoC: amd: add Vangogh ACP5x IP register header
      ASoC: amd: add Vangogh ACP PCI driver
      ASoc: amd: add acp5x init/de-init functions
      ASoC: amd: create acp5x platform devices
      ASoC: amd: add ACP5x PCM platform driver
      ASoC: amd: irq handler changes for ACP5x PCM dma driver
      ASoC: amd: add ACP5x pcm dma driver ops
      ASoC: amd: add vangogh i2s controller driver
      ASoC: amd: add vangogh i2s dai driver ops
      ASoC: amd: add vangogh pci driver pm ops
      ASoC: amd: add vangogh i2s dma driver pm ops
      ASoC: amd: enable vangogh acp5x driver build

Vincent Knecht (1):
      ASoC: qcom: apq8016_sbc: Add SEC_MI2S support

Wolfram Sang (1):
      ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination

Xiaotan Luo (1):
      ASoC: rockchip: i2s: Fixup config for DAIFMT_DSP_A/B

Zhang Qilong (2):
      ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in mt8192_afe_pcm_dev_probe
      ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in mt8183_afe_pcm_dev_probe

jairaj arava (2):
      ASoC: Intel: sof_sdw: update quirk for jack detection in ADL RVP
      ASoC: SOF: Intel: Use DMI string to search for adl_mx98373_rt5682 variant

kernel test robot (1):
      ASoC: codecs: wcd938x: fix returnvar.cocci warnings

 .../bindings/sound/davinci-mcasp-audio.txt         |    1 +
 .../devicetree/bindings/sound/ics43432.txt         |    6 +-
 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml  |  184 ++
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml         |   47 +
 .../devicetree/bindings/sound/realtek,rt1015p.yaml |    4 +-
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |  118 +
 .../devicetree/bindings/sound/rockchip-i2s.yaml    |   11 +
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/soundwire/intel.c                          |   74 -
 drivers/soundwire/intel_init.c                     |   14 +-
 include/linux/platform_data/davinci_asp.h          |    1 +
 include/linux/soundwire/sdw_intel.h                |   87 +
 include/sound/sof.h                                |    1 +
 include/uapi/sound/snd_sst_tokens.h                |    6 +-
 sound/soc/amd/Kconfig                              |    9 +
 sound/soc/amd/Makefile                             |    1 +
 sound/soc/amd/acp-da7219-max98357a.c               |   12 +-
 sound/soc/amd/acp-pcm-dma.c                        |   20 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |   14 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   10 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    8 -
 sound/soc/amd/renoir/acp3x-rn.c                    |    7 +-
 sound/soc/amd/vangogh/Makefile                     |    9 +
 sound/soc/amd/vangogh/acp5x-i2s.c                  |  427 +++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |  517 +++
 sound/soc/amd/vangogh/acp5x.h                      |  193 ++
 sound/soc/amd/vangogh/pci-acp5x.c                  |  326 ++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h        |  337 ++
 sound/soc/atmel/Kconfig                            |    1 -
 sound/soc/atmel/mchp-spdifrx.c                     |    6 +-
 sound/soc/atmel/mchp-spdiftx.c                     |    2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |    2 +-
 sound/soc/bcm/cygnus-pcm.c                         |    2 +-
 sound/soc/codecs/Kconfig                           |   21 +-
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/ad193x.c                          |   30 +-
 sound/soc/codecs/ad193x.h                          |    4 +
 sound/soc/codecs/cs42l42.c                         |   28 +-
 sound/soc/codecs/cx20442.c                         |    8 +-
 sound/soc/codecs/ics43432.c                        |    4 +-
 sound/soc/codecs/lpass-rx-macro.c                  |   65 +-
 sound/soc/codecs/max98090.c                        |    4 +-
 sound/soc/codecs/max98390.c                        |   26 +-
 sound/soc/codecs/max98390.h                        |    1 +
 sound/soc/codecs/mt6359-accdet.c                   |   25 +-
 sound/soc/codecs/rt1015.c                          |   46 +-
 sound/soc/codecs/rt1015.h                          |    2 -
 sound/soc/codecs/rt1015p.c                         |    2 +
 sound/soc/codecs/rt5514.c                          |    2 +-
 sound/soc/codecs/rt5640.c                          |  133 +-
 sound/soc/codecs/rt5640.h                          |    6 +
 sound/soc/codecs/rt5682-i2c.c                      |   15 +-
 sound/soc/codecs/rt5682.c                          |   57 +-
 sound/soc/codecs/sdw-mockup.c                      |  310 ++
 sound/soc/codecs/tlv320aic32x4.c                   |   10 +-
 sound/soc/codecs/wcd9335.c                         |   23 +-
 sound/soc/codecs/wcd938x.c                         |  854 ++++-
 sound/soc/codecs/wcd938x.h                         |    1 -
 sound/soc/codecs/wm_adsp.c                         |    9 +-
 sound/soc/dwc/dwc-i2s.c                            |    2 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   20 +-
 sound/soc/fsl/fsl_xcvr.c                           |    4 +-
 sound/soc/fsl/imx-rpmsg.c                          |    2 +-
 sound/soc/generic/simple-card-utils.c              |    4 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |    2 +-
 sound/soc/intel/boards/Kconfig                     |    1 +
 sound/soc/intel/boards/bytcht_es8316.c             |   31 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  328 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   63 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   55 +-
 sound/soc/intel/boards/sof_cs42l42.c               |  361 ++-
 sound/soc/intel/boards/sof_maxim_common.c          |   17 +-
 sound/soc/intel/boards/sof_maxim_common.h          |    4 +-
 sound/soc/intel/boards/sof_pcm512x.c               |   13 +-
 sound/soc/intel/boards/sof_rt5682.c                |   66 +-
 sound/soc/intel/boards/sof_sdw.c                   |  105 +-
 sound/soc/intel/boards/sof_sdw_common.h            |   64 +-
 sound/soc/intel/boards/sof_sdw_max98373.c          |    7 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c            |    3 +-
 sound/soc/intel/boards/sof_sdw_rt1316.c            |    3 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |    3 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |    3 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   51 +-
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c        |   52 +-
 sound/soc/intel/boards/sof_sdw_rt715.c             |    3 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c        |    3 +-
 sound/soc/intel/common/Makefile                    |    3 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   15 +
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |    8 +
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |    2 +-
 .../intel/common/soc-acpi-intel-sdw-mockup-match.c |  166 +
 .../intel/common/soc-acpi-intel-sdw-mockup-match.h |   17 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   38 +
 sound/soc/intel/skylake/skl-messages.c             |  155 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   33 +-
 sound/soc/intel/skylake/skl-topology.c             |  155 +-
 sound/soc/intel/skylake/skl-topology.h             |   26 +-
 sound/soc/mediatek/Kconfig                         |   24 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h           |   10 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   43 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |   27 +-
 sound/soc/mediatek/mt8195/Makefile                 |   15 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |  441 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h         |  109 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h      |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         | 3281 ++++++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c      |  214 ++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h      |   15 +
 sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h    |   93 +
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c        |  830 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        | 2639 ++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c         |  389 +++
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  | 1087 +++++++
 sound/soc/mediatek/mt8195/mt8195-reg.h             | 2796 +++++++++++++++++
 sound/soc/qcom/apq8016_sbc.c                       |   17 +
 sound/soc/qcom/qdsp6/q6adm.c                       |    2 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |    2 +-
 sound/soc/rockchip/rockchip_i2s.c                  |  212 +-
 sound/soc/rockchip/rockchip_i2s.h                  |   10 +-
 sound/soc/rockchip/rockchip_spdif.c                |   38 +-
 sound/soc/samsung/aries_wm8994.c                   |    2 +-
 sound/soc/samsung/arndale.c                        |    4 +-
 sound/soc/samsung/h1940_uda1380.c                  |    2 +-
 sound/soc/samsung/littlemill.c                     |    2 +-
 sound/soc/samsung/midas_wm1811.c                   |    2 +-
 sound/soc/samsung/neo1973_wm8753.c                 |    4 +-
 sound/soc/samsung/rx1950_uda1380.c                 |    2 +-
 sound/soc/samsung/smartq_wm8987.c                  |    2 +-
 sound/soc/samsung/smdk_wm8580.c                    |    2 +-
 sound/soc/samsung/smdk_wm8994.c                    |    2 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |    2 +-
 sound/soc/samsung/tm2_wm5110.c                     |    6 +-
 sound/soc/samsung/tobermory.c                      |    2 +-
 sound/soc/sh/Kconfig                               |    6 +
 sound/soc/sh/Makefile                              |    4 +
 sound/soc/sh/rcar/adg.c                            |   12 +-
 sound/soc/sh/rcar/core.c                           |    6 +-
 sound/soc/sh/rcar/dma.c                            |    2 +-
 sound/soc/sh/rcar/ssi.c                            |    6 +-
 sound/soc/sh/rz-ssi.c                              | 1074 +++++++
 sound/soc/soc-ac97.c                               |   14 +-
 sound/soc/soc-component.c                          |    4 +-
 sound/soc/soc-core.c                               |   36 +-
 sound/soc/soc-dai.c                                |   18 +-
 sound/soc/soc-dapm.c                               |   65 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |    9 +-
 sound/soc/soc-jack.c                               |   15 +-
 sound/soc/soc-ops.c                                |   21 +-
 sound/soc/soc-pcm.c                                |   22 +-
 sound/soc/soc-topology.c                           |   23 +-
 sound/soc/sof/intel/Kconfig                        |   10 -
 sound/soc/sof/intel/cnl.c                          |    6 +
 sound/soc/sof/intel/hda-pcm.c                      |   16 +-
 sound/soc/sof/intel/hda-stream.c                   |   11 +-
 sound/soc/sof/intel/hda.c                          |   39 +-
 sound/soc/sof/intel/hda.h                          |    8 +-
 sound/soc/sof/intel/icl.c                          |    3 +
 sound/soc/sof/intel/pci-tng.c                      |    1 -
 sound/soc/sof/intel/shim.h                         |    3 +
 sound/soc/sof/intel/tgl.c                          |   12 +
 sound/soc/sof/sof-audio.c                          |   42 +-
 sound/soc/sof/sof-pci-dev.c                        |    9 +
 sound/soc/tegra/tegra30_ahub.c                     |    6 +-
 sound/soc/tegra/tegra30_i2s.c                      |    8 +-
 sound/soc/ti/Kconfig                               |    1 +
 sound/soc/ti/davinci-mcasp.c                       |  176 +-
 sound/soc/ti/j721e-evm.c                           |   30 +-
 sound/soc/ti/omap-abe-twl6040.c                    |    5 -
 sound/soc/uniphier/aio-cpu.c                       |    4 +-
 173 files changed, 18989 insertions(+), 1285 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h
 create mode 100644 sound/soc/codecs/sdw-mockup.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
 create mode 100644 sound/soc/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h
 create mode 100644 sound/soc/sh/rz-ssi.c
