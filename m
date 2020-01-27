Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD914A848
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 17:45:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8559E83D;
	Mon, 27 Jan 2020 17:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8559E83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580143538;
	bh=MqPayl3uVTYDYG45wXheKehJm2H87Z7kBpUHTiHn3mc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AEDTt81bzVpoRZOVML+b0AWKejMNx3MuRVvLMqxDvqxO9UAO3dqQh/r3Nk6CmOmoA
	 Z6e0TLCrkGOu3dNRnAv3odLY1unCr+hJOay33ehUWlYbXx4oGU1ZnLPo4WG0te6awN
	 m63i4/woCZ8p7TdNDQGOTQPvLQnCHXTZ/QIezsUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82882F80234;
	Mon, 27 Jan 2020 17:43:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161A3F8021E; Mon, 27 Jan 2020 17:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 56B3FF80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 17:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B3FF80082
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5AD31B;
 Mon, 27 Jan 2020 08:43:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F3953F67D;
 Mon, 27 Jan 2020 08:43:46 -0800 (PST)
Date: Mon, 27 Jan 2020 16:43:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200127164344.GA3763@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Hangover, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates for v5.6
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
Content-Type: multipart/mixed; boundary="===============8738884944790781642=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8738884944790781642==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit def9d2780727cec3313ed3522d0123158d87224d:

  Linux 5.5-rc7 (2020-01-19 16:02:49 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.6

for you to fetch changes up to a7196caf83ea9e9b56c5c8c95fbfe0d45acec46b:

  Merge branch 'asoc-5.6' into asoc-next (2020-01-23 12:36:45 +0000)

----------------------------------------------------------------
ASoC: Updates for v5.6

A pretty big release this time around, a lot of new drivers and both
Morimoto-san and Takashi were doing subsystem wide updates as well:

 - Further big refactorings from Morimoto-san simplifying the core
   interfaces and moving things to the component level.
 - Transition of drivers to managed buffer allocation and removal of
   redundant PCM ioctls.
 - New driver support for Ingenic JZ4770, Mediatek MT6660, Qualcomm
   WCD934x and WSA881x, and Realtek RT700, RT711, RT715, RT1011, RT1015
   and RT1308.

----------------------------------------------------------------
Angus Ainslie (Purism) (2):
      ASoC: gtm601: add Broadmobi bm818 sound profile
      dt-bindings: sound: gtm601: add the broadmobi interface

Arnd Bergmann (1):
      ASoC: gtm601: fix build warning

Bard Liao (4):
      ASoC: SOF: Intel: hda: solve MSI issues by merging ipc and stream irq handlers
      soundwire: intel: update headers for interrupts
      soundwire: intel: add link_list to handle interrupts with a single thread
      ASoC: Intel: common: add match tables for ICL w/ SoundWire

Ben Zhang (1):
      ASoC: intel: Add Broadwell rt5650 machine driver

Cezary Rojewski (3):
      ASoC: compress: Add pm_runtime support
      ASoC: SOF: Intel: hda: Fix SKL dai count
      ASoC: Intel: skl_hda_dsp_common: Fix global-out-of-bounds bug

Charles Keepax (7):
      ASoC: madera: Enable clocks for input pins when used as a direct clock
      ASoC: madera: Enable clocks for input pins when used for the FLL
      ASoC: wm_adsp: Correct cache handling of new kernel control API
      ASoC: madera: Update handling of DAPM routes for mono muxed outputs
      ASoC: madera: Correct error path handling in madera_out1_demux_put
      ASoC: madera: Correct DMIC only input hook ups
      ASoC: madera: Correct some kernel doc

Chen Zhou (1):
      ASoC: atmel: fix build error with CONFIG_SND_ATMEL_SOC_DMA=m

Christophe JAILLET (1):
      ASoC: cs47l92: Simplify error handling code in 'cs47l92_probe()'

Damian van Soelen (1):
      ASoC: Intel: cht_bsw_rt5645: Remove unnecessary string buffers and snprintf calls

Daniel Baluta (2):
      ASoC: SOF: Make creation of machine device from SOF core optional
      ASoC: SOF: Remove unused drv_name in sof_pdata

Dmitry Torokhov (1):
      ASoC: Intel: bytcr_rt5651: switch to using devm_fwnode_gpiod_get()

Dragos Tarcatu (1):
      ASoC: topology: Prevent use-after-free in snd_soc_get_pcm_runtime()

Eason Yen (2):
      ASoC: mediatek: common: add some helpers to control mtk_memif
      ASoC: mediatek: common: refine hw_params and hw_prepare

Erik Bussing (1):
      ASoC: Intel: bytcr_rt5640: Remove code duplication in byt_rt5640_codec_fixup

Geert Uytterhoeven (1):
      ASoC: rsnd: Calculate DALIGN inversion at run-time

Guido Roncarolo (2):
      ASoC: SOF: imx: Describe SAI parameters to be sent to DSP
      ASoC: SOF: imx: Read SAI parameters and send them to DSP

Jack Yu (2):
      ASoC: rt715: add RT715 codec driver
      ASoC: rt1015: add rt1015 amplifier driver

Jaroslav Kysela (4):
      ASoC: intel/skl/hda - export number of digital microphones via control components
      ASoC: Intel - use control components to describe card config
      ASoC: Intel - do not describe I/O configuration in the long card name
      ASoC: topology: fix soc_tplg_fe_link_create() - link->dobj initialization order

Jeff Chang (1):
      ASoC: Add MediaTek MT6660 Speaker Amp Driver

Jerome Brunet (5):
      ASoC: hdmi-codec: re-introduce mutex locking again
      ASoC: meson: axg-fifo: add fifo depth to the bindings documentation
      ASoC: meson: axg-fifo: fix fifo threshold setup
      ASoC: meson: axg-fifo: improve depth handling
      ASoC: meson: axg-fifo: relax period size constraints

Jordy Ubink (1):
      ASoC: Intel: bytcr_rt5651: Remove unnecessary string buffers and snprintf calls

Julia Lawall (2):
      ASoC: qdsp6: q6asm-dai: constify copied structure
      ASoC: SOF: imx8: use resource_size

Kai Vehmanen (7):
      ASoC: SOF: Intel: make common HDMI driver default
      ASoC: Intel: boards: make common HDMI driver the default for SOF
      ASoC: hdac_hdmi: Drop support for Icelake
      ASoC: SOF: Intel: add codec_mask module parameter
      ASoC: SOF: Intel: drop HDA codec upon probe failure
      ASoC: Intel: boards: fix incorrect HDMI Kconfig dependency
      ASoC: SOF: fix PCM playback through ALSA OSS emulation

Karol Trzcinski (2):
      ASoC: SOF: define struct with compiler name and version
      ASoC: SOF: log compiler name and version information

Kuninori Morimoto (66):
      ASoC: soc-core: remove dai_link_list
      ASoC: soc-core: remove snd_soc_disconnect_sync()
      ASoC: soc-core: remove snd_soc_get_dai_substream()
      ASoC: soc-core: move snd_soc_get_pcm_runtime()
      ASoC: soc-core: find rtd via dai_link pointer at snd_soc_get_pcm_runtime()
      ASoC: soc-core: move snd_soc_find_dai_link()
      ASoC: soc-core: rename snd_soc_add_dai_link() to snd_soc_add_pcm_runtime()
      ASoC: soc-core: rename snd_soc_remove_dai_link() to snd_soc_remove_pcm_runtime()
      ASoC: soc-core: move soc_link_dai_pcm_new()
      ASoC: soc-core: rename soc_link_dai_pcm_new() to soc_dai_pcm_new()
      ASoC: soc-core: move soc_link_init()
      ASoC: soc-core: add missing return value check for soc_link_init()
      ASoC: soc-core: rename soc_link_init() to soc_init_pcm_runtime()
      ASoC: soc-core: soc_set_name_prefix(): tidyup loop condition
      ASoC: soc-core: soc_set_name_prefix(): get component device_node at out of loop
      ASoC: soc-core: merge soc_set_name_prefix() and soc_set_of_name_prefix()
      ASoC: soc-core: tidyup for CONFIG_DMI
      ASoC: soc-core: tidyup for CONFIG_DEBUG_FS
      ASoC: soc-core: support snd_soc_dai_link_component for codec_conf
      ASoC: fsl: imx-audmix: use snd_soc_dai_link_component for codec_conf
      ASoC: intel: kbl_da7219_max98927: use snd_soc_dai_link_component for codec_conf
      ASoC: intel: kbl_rt5663_max98927: use snd_soc_dai_link_component for codec_conf
      ASoC: intel: kbl_rt5663_rt5514_max98927: use snd_soc_dai_link_component for codec_conf
      ASoC: intel: skl_nau88l25_ssm4567: use snd_soc_dai_link_component for codec_conf
      ASoC: mediatek: mt8173-rt5650-rt5514: use snd_soc_dai_link_component for codec_conf
      ASoC: mediatek: mt8173-rt5650-rt5676: use snd_soc_dai_link_component for codec_conf
      ASoC: mediatek: mt8183-da7219-max98357: use snd_soc_dai_link_component for codec_conf
      ASoC: samsung: bells: use snd_soc_dai_link_component for codec_conf
      ASoC: samsung: lowland: use snd_soc_dai_link_component for codec_conf
      ASoC: samsung: neo1973_wm8753: use snd_soc_dai_link_component for codec_conf
      ASoC: samsung: speyside: use snd_soc_dai_link_component for codec_conf
      ASoC: ti: rx51: use snd_soc_dai_link_component for codec_conf
      ASoC: soc-core: remove legacy style of codec_conf
      ASoC: soc-core: remove snd_soc_rtdcom_list
      ASoC: soc-core: rename snd_soc_rtdcom_add() to snd_soc_rtd_add_component()
      ASoC: soc-core: care .ignore_suspend for Component suspend
      ASoC: soc-core: remove duplicate pinctrl operation when suspend
      ASoC: soc-core: do pinctrl_pm_select_xxx() as component
      ASoC: soc-core: add snd_soc_close_delayed_work()
      ASoC: soc-dapm: add snd_soc_dapm_stream_stop()
      ASoC: soc-pcm/soc-compress: use snd_soc_dapm_stream_stop() for SND_SOC_DAPM_STREAM_STOP
      ASoC: rt715: use dev_to_sdw_dev() instead of to_sdw_slave_device()
      ASoC: bcm: cygnus-ssp: move .suspend/.resume to component
      ASoC: atmel: atmel_ssc_dai: move .suspend/.resume to component
      ASoC: cirrus: ep93xx-i2s: move .suspend/.resume to component
      ASoC: jz4740: jz4740-i2s: move .suspend/.resume to component
      ASoC: mediatek: move .suspend/.resume to component
      ASoC: samsung: s3c24xx-i2s: move .suspend/.resume to component
      ASoC: samsung: spdif: move .suspend/.resume to component
      ASoC: sti: sti_uniperif: move .suspend/.resume to component
      ASoC: ti: omap-mcpdm: move .suspend/.resume to component
      ASoC: uniphier: move .suspend/.resume to component
      ASoC: dwc: dwc-i2s: move .suspend/.resume to component
      ASoC: samsung: i2s: move .suspend/.resume to component
      ASoC: ux500: ux500_msp_dai: remove unused DAI .suspend/.resume
      ASoC: pxa: pxa-ssp: move .suspend/.resume to component
      ASoC: pxa: pxa2xx-i2s: move .suspend/.resume to component
      ASoC: soc-core: remove DAI suspend/resume
      ASoC: soc-core: remove bus_control
      ASoC: soc-pcm: add soc_rtd_startup()
      ASoC: soc-pcm: add soc_rtd_shutdown()
      ASoC: soc-pcm: add soc_rtd_prepare()
      ASoC: soc-pcm: add soc_rtd_hw_params()
      ASoC: soc-pcm: add soc_rtd_hw_free()
      ASoC: soc-pcm: add soc_rtd_trigger()
      ASoC: soc-core: remove null_snd_soc_ops

Marek Szyprowski (3):
      ASoC: max98090: fix incorrect helper in max98090_dapm_put_enum_double()
      ASoC: max98090: fix incorrect helper in max98090_dapm_put_enum_double()
      ASoC: max98090: fix lockdep warning

Marek Vasut (3):
      regulator: core: Add regulator_is_equal() helper
      ASoC: sgtl5000: Fix VDDA and VDDIO comparison
      ASoC: sgtl5000: add multi endpoint support

Mark Brown (11):
      Merge branch 'for-5.5' of https://git.kernel.org/.../broonie/sound into asoc-5.6
      ASoC: max98090: Remove empty suspend function
      Merge branch 'for-5.5' of https://git.kernel.org/.../broonie/sound into asoc-5.6
      Merge tag 'sdw_interfaces_5.6' of git://git.kernel.org/.../vkoul/soundwire into asoc-5.6
      Merge branch 'for-5.5' of https://git.kernel.org/.../broonie/sound into asoc-5.6
      ASoC: max98090: Drop incorrectly applied duplicate commit
      Merge tag 'regulator-eq' of https://git.kernel.org/.../broonie/regulator into asoc-5.6
      Merge branch 'topic/equal' of https://git.kernel.org/.../broonie/regulator into asoc-5.6
      Merge tag 'asoc-fix-v5.5-rc6' into asoc-5.6
      Merge branch 'asoc-5.5' into asoc-linus
      Merge branch 'asoc-5.6' into asoc-next

Matthias Brugger (1):
      ASoC: dt-bindings: rt5645: add suppliers

Michael Walle (1):
      ASoC: fsl_sai: add IRQF_SHARED

Nariman Etemadi (1):
      ASoC: Intel: bytcr_rt5640: Remove unnecessary string buffers and snprintf calls

Nikita Yushchenko (2):
      ASoC: tlv320aic31xx: Add HP output driver pop reduction controls
      ASoC: tlv320aic31xx: Add Volume Soft Stepping control

Olivier Moysan (1):
      ASoC: cs42l51: add dac mux widget in codec routes

Pan Xiuli (1):
      ASoC: Intel: broadwell: change cpu_dai and platform components for SOF

Paul Burton (1):
      ASoC: txx9: Remove unused rtd variable

Paul Cercueil (2):
      dt-bindings: sound: Convert jz47*-codec doc to YAML
      ASoC: codecs: Add jz4770-codec driver

Peter Ujfalusi (1):
      ASoC: ti: davinci-mcasp: Improve the sysclk selection

Pierre-Louis Bossart (48):
      ASoC: SOF: Intel: byt: fixup topology filename for BYT-CR
      soundwire: sdw_slave: add probe_complete structure and new fields
      soundwire: sdw_slave: add enumeration_complete structure
      soundwire: sdw_slave: add initialization_complete definition
      soundwire: sdw_slave: track unattach_request to handle all init sequences
      soundwire: intel: update interfaces between ASoC and SoundWire
      soundwire: intel: add mutex for shared SHIM register access
      soundwire: intel: add clock stop quirks
      ASoC: Intel: cml_rt1011_rt5682: fix codec_conf by removing legacy style
      ASoC: SOF: Intel: add module namespace for legacy IPC
      ASoC: SOF: Intel: add namespaces for BAYTRAIL and MERRIFIELD
      ASoC: SOF: Intel: add namespace for BROADWELL
      ASoC: SOF: remove references to Haswell
      ASoC: SOF: Intel: add namespace for HDA_COMMON
      ASoC: SOF: Intel: hda: add namespace for hda-codec functionality
      ASoC: SOF: move arch_ops under ops
      ASoC: SOF: Intel: add namespace for XTENSA
      ASoC: Intel: boards: hda_dsp_common: use NULL pointer assignment, not 0
      ASoC: soc-topology: fix endianness issues
      ASoC: SOF: pci: change the default firmware path when the community key is used
      ASoC: SOF: loader: add dynamic debug trace
      ASoC: Intel: bdw-rt5677: fix Kconfig dependencies
      ASoC: Intel: bdw-rt5677: change cpu_dai and platform components for SOF
      ASoC: Intel: bdw-rt5650: change cpu_dai and platform components for SOF
      ASoC: soc-acpi: add _ADR-based link descriptors
      ASoC: Intel: common: soc-acpi: declare new tables for SoundWire
      ASoC: Intel: common: add match tables for TGL w/ SoundWire
      ASoC: SOF: Intel: reference SoundWire machine lists
      ASoC: rt715: remove warnings
      ASoC: SOF: Intel: hda-dai: fix compilation warning in pcm_prepare
      ASoC: Intel: bxt_da7219_max98357a: rename shadowed variable
      ASoC: Intel: bxt_rt298: rename shadowed variable
      ASoC: Intel: glk_rt5682_max98357a: rename shadowed variable
      ASoC: Intel: glk_rt5682_max98357a: removed unused variables
      ASoC: Intel: kbl_da7219_max98357a: rename shadowed variable
      ASoC: Intel: kbl_da7219_max98927: test return value on route add
      ASoC: Intel: kbl_da7219_max98927: rename shadowed variable
      ASoC: Intel: kbl_da7219_max98927: remove unnecessary initialization
      ASoC: Intel: kbl_rt5660: rename shadowed variable
      ASoC: Intel: kbl_rt5663_max98927: rename shadowed variable
      ASoC: Intel: kbl_rt5663_rt5514_max98927: rename shadowed variable
      ASOC: Intel: kbl_rt5663_rt5514_max98927: remove useless initialization
      ASoC: Intel: skl_nau88l25_max98357a: rename shadowed variable
      ASoC: Intel: skl_nau88l25_ssm4567: rename shadowed variable
      ASoC: Intel: skl_rt286: rename shadowed variable
      ASoC: Intel: bytcht_es8316: removed unused variable
      ASoC: Intel: bytcr_rt5640: remove unused variable
      ASoC: Intel: bytcr_rt5651: remove unused variable

Rander Wang (3):
      soundwire: intel: update stream callbacks for hwparams/free stream operations
      soundwire: intel: add prototype for WAKEEN interrupt processing
      ASoC: Intel: common: add match tables for CNL/CFL/CML w/ SoundWire

Randy Dunlap (1):
      ASoC: fix soc-core.c kernel-doc warning

Ranjani Sridharan (9):
      ASoC: SOF: topology: remove snd_sof_init_topology()
      ASoC: SOF: core: modify the signature for snd_sof_create_page_table
      ASoC: SOF: core: move check for runtime callbacks to core
      ASoC: SOF: Introduce default_fw_filename member in sof_dev_desc
      ASoC: SOF: partition audio-related parts from SOF core
      ASoC: SOF: intel: hda: Modify signature for hda_codec_probe_bus()
      ASoC: SOF: remove nocodec_fw_filename
      ASoC: SOF: nocodec: Amend arguments for sof_nocodec_setup()
      ASoC: SOF: Introduce state machine for FW boot

Ravulapati Vishnu vardhan rao (8):
      ASoC: amd: Create multiple I2S platform device endpoint
      ASoC: amd: Refactoring of DAI from DMA driver
      ASoC: amd: Enabling I2S instance in DMA and DAI
      ASoC: amd: add ACP3x TDM mode support
      ASoC: amd: Handle ACP3x I2S-SP Interrupts.
      ASoC: amd: Added ACP3x system resume and runtime pm
      ASoC: amd MMAP_INTERLEAVED Support
      ASoC: amd: Additional DAI for I2S SP instance.

Sam McNally (1):
      ASoC: Intel: sof_rt5682: Ignore the speaker amp when there isn't one.

Sameer Pujar (1):
      ASoC: soc-pcm: crash in snd_soc_dapm_new_dai

Sathyanarayana Nujella (5):
      ASoC: intel: sof_rt5682: Add quirk for number of HDMI DAI's
      ASoC: intel: sof_rt5682: Add support for tgl-max98357a-rt5682
      ASoC: Intel: common: Add mach table for tgl-max98357a-rt5682
      ASoC: SOF: Intel: hda: Add iDisp4 DAI
      ASoC: hdac_hda: Update hdac hda dai table to include intel-hdmi-hifi4

Seppo Ingalsuo (1):
      ASoC: SOF: Add asynchronous sample rate converter topology support

Shengjiu Wang (3):
      ASoC: dt-bindings: fsl_asrc: add compatible string for imx8qm & imx8qxp
      ASoC: fsl_asrc: Add support for imx8qm & imx8qxp
      ASoC: soc-generic-dmaengine-pcm: Fix error handling

Shuming Fan (4):
      ASoC: rt711: add rt711 codec driver
      ASoC: rt700: add rt700 codec driver
      ASoC: rt1308-sdw: add rt1308 SdW amplifier driver
      ASoC: rt1011: set the different setting for QFN/WLCSP package

Slawomir Blauciak (1):
      ASoC: SOF: ipc: channel map structures

Srinivas Kandagatla (10):
      ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
      ASoC: wcd934x: add support to wcd9340/wcd9341 codec
      ASoC: wcd934x: add basic controls
      ASoC: wcd934x: add playback dapm widgets
      ASoC: wcd934x: add capture dapm widgets
      ASoC: wcd934x: add audio routings
      ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
      ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga
      dt-bindings: ASoC: Add WSA881x bindings
      ASoC: codecs: add wsa881x amplifier support

Stephan Gerhold (2):
      ASoC: msm8916-wcd-analog: Simplify MIC BIAS Internal
      ASoC: msm8916-wcd-analog: Add MIC BIAS Internal3

Stephen Rothwell (1):
      regulator fix for "regulator: core: Add regulator_is_equal() helper"

Takashi Iwai (47):
      ASoC: amd: Use managed buffer allocation
      ASoC: amd: Drop superfluous ioctl PCM ops
      ASoC: atmel: Drop superfluous ioctl PCM ops
      ASoC: au1x: Drop superfluous ioctl PCM ops
      ASoC: bcm: Drop superfluous ioctl PCM ops
      ASoC: dwc: Drop superfluous ioctl PCM ops
      ASoC: fsl: Drop superfluous ioctl PCM ops
      ASoC: intel: Drop superfluous ioctl PCM ops
      ASoC: kirkwood: Drop superfluous ioctl PCM ops
      ASoC: mediatek: Drop superfluous ioctl PCM ops
      ASoC: meson: Drop superfluous ioctl PCM ops
      ASoC: pxa: Drop superfluous ioctl PCM ops
      ASoC: qcom: Drop superfluous ioctl PCM ops
      ASoC: samsung: Drop superfluous ioctl PCM ops
      ASoC: generic-dmaengine: Drop superfluous ioctl PCM ops
      ASoC: SOF: Drop superfluous ioctl PCM ops
      ASoC: sprd: Drop superfluous ioctl PCM ops
      ASoC: txx9: Drop superfluous ioctl PCM ops
      ASoC: xilinx: Drop superfluous ioctl PCM ops
      ASoC: xtensa: Drop superfluous ioctl PCM ops
      ASoC: utils: Drop superfluous ioctl PCM ops
      ASoC: au1x: Use managed buffer allocation
      ASoC: dwc: Use managed buffer allocation
      ASoC: meson: Use managed buffer allocation
      ASoC: dma-sh7760: Use managed buffer allocation
      ASoC: rcar: Use managed buffer allocation
      ASoC: generic-dmaengine-pcm: Use managed buffer allocation
      ASoC: stm32: Use managed buffer allocation
      ASoC: txx9: Use managed buffer allocation
      ASoC: xilinx: Use managed buffer allocation
      ASoC: xtensa: Use managed buffer allocation
      ASoC: cros_ec_codec: Use managed buffer allocation
      ASoC: rt5514-spi: Use managed buffer allocation
      ASoC: rt5677-spi: Use managed buffer allocation
      ASoC: intel: atom: Use managed buffer allocation
      ASoC: intel: baytrail: Use managed buffer allocation
      ASoC: intel: haswell: Use managed buffer allocation
      ASoC: intel: skylake: Use managed buffer allocation
      ASoC: fsi: Use managed buffer allocation
      ASoC: siu_pcm: Use managed buffer allocation
      ASoC: uniphier: Use managed buffer allocation
      ASoC: sh: Drop superfluous ioctl PCM ops
      ASoC: uniphier: Drop superfluous ioctl PCM ops
      ASoC: Drop snd_soc_pcm_lib_ioctl()
      ASoC: mediatek: Use managed buffer allocation
      ASoC: SOF: Use managed buffer allocation
      ASoC: intel: skylake: Remove superfluous bus ops

Tzung-Bi Shih (4):
      ASoC: max98090: save and restore SHDN when changing sensitive registers
      ASoC: max98090: revert "ASoC: max98090: fix lockdep warning"
      ASoC: dapm: add snd_soc_dapm_put_enum_double_locked
      ASoC: max98090: fix deadlock in max98090_dapm_put_enum_double()

Wei Yongjun (4):
      ASoC: amd: acp3x: Fix return value check in acp3x_dai_probe()
      ASoC: rt700: fix return value check in rt700_sdw_probe()
      ASoC: rt711: fix return value check in rt711_sdw_probe()
      ASoC: rt715: fix return value check in rt715_sdw_probe()

Yong Zhi (1):
      ASoC: Intel: Add machine driver for da7219_max98373

YueHaibing (4):
      ASoC: Intel: kbl_da7219_max98357a: remove unused variable 'constraints_16000' and 'ch_mono'
      ASoC: rt711: remove unused including <linux/version.h>
      ASoC: rt700: remove unused including <linux/version.h>
      ASoC: rt715: remove unused including <linux/version.h>

 .../devicetree/bindings/sound/amlogic,axg-fifo.txt |    4 +
 .../devicetree/bindings/sound/fsl,asrc.txt         |   12 +-
 Documentation/devicetree/bindings/sound/gtm601.txt |   10 +-
 .../devicetree/bindings/sound/ingenic,codec.yaml   |   55 +
 .../bindings/sound/ingenic,jz4725b-codec.txt       |   20 -
 .../bindings/sound/ingenic,jz4740-codec.txt        |   20 -
 .../devicetree/bindings/sound/qcom,sdm845.txt      |    5 +-
 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |  175 +
 .../devicetree/bindings/sound/qcom,wsa881x.yaml    |   68 +
 Documentation/devicetree/bindings/sound/rt1015.txt |   17 +
 Documentation/devicetree/bindings/sound/rt5645.txt |    4 +
 drivers/regulator/helpers.c                        |   14 +
 drivers/soundwire/intel.c                          |   20 +-
 drivers/soundwire/intel.h                          |   13 +-
 drivers/soundwire/intel_init.c                     |   32 +-
 include/linux/regulator/consumer.h                 |    7 +
 include/linux/soundwire/sdw.h                      |   19 +
 include/linux/soundwire/sdw_intel.h                |  156 +-
 include/sound/soc-acpi-intel-match.h               |    6 +
 include/sound/soc-acpi.h                           |   21 +
 include/sound/soc-dai.h                            |    3 -
 include/sound/soc-dapm.h                           |    3 +
 include/sound/soc.h                                |   52 +-
 include/sound/sof.h                                |    9 +-
 include/sound/sof/channel_map.h                    |   61 +
 include/sound/sof/dai-imx.h                        |   20 +
 include/sound/sof/dai.h                            |    1 +
 include/sound/sof/info.h                           |   15 +
 include/sound/sof/topology.h                       |   27 +
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/tokens.h                    |    9 +-
 sound/soc/amd/acp-pcm-dma.c                        |   59 +-
 sound/soc/amd/raven/Makefile                       |    2 +
 sound/soc/amd/raven/acp3x-i2s.c                    |  358 ++
 sound/soc/amd/raven/acp3x-pcm-dma.c                |  679 +--
 sound/soc/amd/raven/acp3x.h                        |  115 +-
 sound/soc/amd/raven/pci-acp3x.c                    |  264 +-
 sound/soc/atmel/Kconfig                            |    2 +
 sound/soc/atmel/atmel-pcm-pdc.c                    |    1 -
 sound/soc/atmel/atmel_ssc_dai.c                    |   18 +-
 sound/soc/au1x/ac97c.c                             |    1 -
 sound/soc/au1x/dbdma2.c                            |   15 +-
 sound/soc/au1x/dma.c                               |   22 +-
 sound/soc/au1x/psc-ac97.c                          |    1 -
 sound/soc/bcm/cygnus-pcm.c                         |    1 -
 sound/soc/bcm/cygnus-ssp.c                         |   39 +-
 sound/soc/cirrus/ep93xx-ac97.c                     |    1 -
 sound/soc/cirrus/ep93xx-i2s.c                      |   16 +-
 sound/soc/codecs/Kconfig                           |   82 +
 sound/soc/codecs/Makefile                          |   18 +
 sound/soc/codecs/cros_ec_codec.c                   |    8 +-
 sound/soc/codecs/cs42l51.c                         |   16 +-
 sound/soc/codecs/cs47l15.c                         |   21 +-
 sound/soc/codecs/cs47l35.c                         |   18 +-
 sound/soc/codecs/cs47l85.c                         |   20 +-
 sound/soc/codecs/cs47l90.c                         |   20 +-
 sound/soc/codecs/cs47l92.c                         |   76 +-
 sound/soc/codecs/gtm601.c                          |   32 +-
 sound/soc/codecs/hdac_hda.c                        |   16 +
 sound/soc/codecs/hdac_hda.h                        |    3 +-
 sound/soc/codecs/hdac_hdmi.c                       |   63 +-
 sound/soc/codecs/hdmi-codec.c                      |   32 +-
 sound/soc/codecs/jz4770.c                          |  948 ++++
 sound/soc/codecs/madera.c                          |  178 +-
 sound/soc/codecs/madera.h                          |    6 +-
 sound/soc/codecs/max98090.c                        |  440 +-
 sound/soc/codecs/max98090.h                        |    3 +-
 sound/soc/codecs/msm8916-wcd-analog.c              |  116 +-
 sound/soc/codecs/mt6660.c                          |  509 ++
 sound/soc/codecs/mt6660.h                          |   77 +
 sound/soc/codecs/rt1011.c                          |   17 +-
 sound/soc/codecs/rt1011.h                          |    1 +
 sound/soc/codecs/rt1015.c                          |  993 ++++
 sound/soc/codecs/rt1015.h                          |  375 ++
 sound/soc/codecs/rt1308-sdw.c                      |  736 +++
 sound/soc/codecs/rt1308-sdw.h                      |  169 +
 sound/soc/codecs/rt5514-spi.c                      |   10 +-
 sound/soc/codecs/rt5677-spi.c                      |   10 +-
 sound/soc/codecs/rt700-sdw.c                       |  551 +++
 sound/soc/codecs/rt700-sdw.h                       |  335 ++
 sound/soc/codecs/rt700.c                           | 1237 +++++
 sound/soc/codecs/rt700.h                           |  174 +
 sound/soc/codecs/rt711-sdw.c                       |  552 +++
 sound/soc/codecs/rt711-sdw.h                       |  281 ++
 sound/soc/codecs/rt711.c                           | 1292 +++++
 sound/soc/codecs/rt711.h                           |  227 +
 sound/soc/codecs/rt715-sdw.c                       |  613 +++
 sound/soc/codecs/rt715-sdw.h                       |  337 ++
 sound/soc/codecs/rt715.c                           |  872 ++++
 sound/soc/codecs/rt715.h                           |  221 +
 sound/soc/codecs/sgtl5000.c                        |   11 +-
 sound/soc/codecs/tlv320aic31xx.c                   |   40 +-
 sound/soc/codecs/tlv320aic31xx.h                   |    3 -
 sound/soc/codecs/wcd934x.c                         | 5084 ++++++++++++++++++++
 sound/soc/codecs/wm_adsp.c                         |   98 +-
 sound/soc/codecs/wsa881x.c                         | 1185 +++++
 sound/soc/dwc/dwc-i2s.c                            |   32 +-
 sound/soc/dwc/dwc-pcm.c                            |   25 +-
 sound/soc/fsl/fsl-asoc-card.c                      |    2 +-
 sound/soc/fsl/fsl_asrc.c                           |  125 +-
 sound/soc/fsl/fsl_asrc.h                           |   64 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   42 +-
 sound/soc/fsl/fsl_dma.c                            |    1 -
 sound/soc/fsl/fsl_sai.c                            |    3 +-
 sound/soc/fsl/fsl_ssi.c                            |    1 -
 sound/soc/fsl/imx-audmix.c                         |    2 +-
 sound/soc/fsl/imx-pcm-fiq.c                        |    1 -
 sound/soc/fsl/imx-ssi.c                            |    1 -
 sound/soc/fsl/mpc5200_dma.c                        |    1 -
 sound/soc/fsl/mpc5200_psc_ac97.c                   |    2 -
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |   26 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |   20 +-
 sound/soc/intel/boards/Kconfig                     |   51 +
 sound/soc/intel/boards/Makefile                    |    5 +
 sound/soc/intel/boards/bdw-rt5650.c                |  327 ++
 sound/soc/intel/boards/bdw-rt5677.c                |   10 +-
 sound/soc/intel/boards/broadwell.c                 |   10 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   10 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    8 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   21 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  112 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   72 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   26 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |    8 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   18 +-
 sound/soc/intel/boards/hda_dsp_common.c            |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |   23 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   27 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    4 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |   14 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   14 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |   21 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    8 +
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |   10 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |   14 +-
 sound/soc/intel/boards/skl_rt286.c                 |   10 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |  371 ++
 sound/soc/intel/boards/sof_rt5682.c                |   43 +-
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c  |    5 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   89 +
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |    5 +
 .../intel/common/soc-acpi-intel-hsw-bdw-match.c    |    7 +
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |   98 +
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |    7 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   64 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c          |   18 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   27 +-
 sound/soc/intel/skylake/skl.c                      |    7 +-
 sound/soc/jz4740/jz4740-i2s.c                      |   18 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |    1 -
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |  377 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.h         |   20 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |   13 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.h  |    2 -
 sound/soc/mediatek/common/mtk-base-afe.h           |   28 +-
 sound/soc/mediatek/common/mtk-btcvsd.c             |    1 -
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   14 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    2 -
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |    2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |    2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |    2 -
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    2 +-
 sound/soc/meson/axg-fifo.c                         |   61 +-
 sound/soc/meson/axg-fifo.h                         |    9 +-
 sound/soc/meson/axg-frddr.c                        |   36 +-
 sound/soc/meson/axg-toddr.c                        |   24 +-
 sound/soc/pxa/mioa701_wm9713.c                     |    2 +-
 sound/soc/pxa/mmp-pcm.c                            |    1 -
 sound/soc/pxa/pxa-ssp.c                            |   17 +-
 sound/soc/pxa/pxa2xx-ac97.c                        |    4 -
 sound/soc/pxa/pxa2xx-i2s.c                         |   13 +-
 sound/soc/pxa/pxa2xx-pcm.c                         |    1 -
 sound/soc/qcom/lpass-platform.c                    |    1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    3 +-
 sound/soc/qcom/sdm845.c                            |   86 +-
 sound/soc/samsung/bells.c                          |   14 +-
 sound/soc/samsung/i2s.c                            |   13 +-
 sound/soc/samsung/idma.c                           |    1 -
 sound/soc/samsung/littlemill.c                     |   10 +-
 sound/soc/samsung/lowland.c                        |    2 +-
 sound/soc/samsung/neo1973_wm8753.c                 |    2 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |    8 +-
 sound/soc/samsung/snow.c                           |    2 +-
 sound/soc/samsung/spdif.c                          |   18 +-
 sound/soc/samsung/speyside.c                       |    6 +-
 sound/soc/samsung/tm2_wm5110.c                     |    6 +-
 sound/soc/samsung/tobermory.c                      |    6 +-
 sound/soc/sh/dma-sh7760.c                          |   15 +-
 sound/soc/sh/fsi.c                                 |   19 +-
 sound/soc/sh/hac.c                                 |    1 -
 sound/soc/sh/rcar/core.c                           |   57 +-
 sound/soc/sh/siu_pcm.c                             |   40 +-
 sound/soc/soc-component.c                          |   33 +-
 sound/soc/soc-compress.c                           |  143 +-
 sound/soc/soc-core.c                               |  641 +--
 sound/soc/soc-dai.c                                |   12 -
 sound/soc/soc-dapm.c                               |   77 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |   30 +-
 sound/soc/soc-pcm.c                                |  237 +-
 sound/soc/soc-topology.c                           |   95 +-
 sound/soc/soc-utils.c                              |    1 -
 sound/soc/sof/Kconfig                              |    2 +-
 sound/soc/sof/Makefile                             |    2 +-
 sound/soc/sof/control.c                            |   55 +-
 sound/soc/sof/core.c                               |  288 +-
 sound/soc/sof/imx/imx8.c                           |    3 +-
 sound/soc/sof/intel/Kconfig                        |    1 +
 sound/soc/sof/intel/apl.c                          |   14 +-
 sound/soc/sof/intel/bdw.c                          |   41 +-
 sound/soc/sof/intel/byt.c                          |  110 +-
 sound/soc/sof/intel/cnl.c                          |   26 +-
 sound/soc/sof/intel/hda-codec.c                    |   38 +-
 sound/soc/sof/intel/hda-ctrl.c                     |   13 +
 sound/soc/sof/intel/hda-dai.c                      |    8 +-
 sound/soc/sof/intel/hda-ipc.c                      |   23 +-
 sound/soc/sof/intel/hda-loader.c                   |    1 -
 sound/soc/sof/intel/hda-pcm.c                      |    4 +-
 sound/soc/sof/intel/hda-stream.c                   |   21 +-
 sound/soc/sof/intel/hda.c                          |  304 +-
 sound/soc/sof/intel/hda.h                          |   21 +-
 sound/soc/sof/intel/intel-ipc.c                    |    8 +-
 sound/soc/sof/intel/shim.h                         |    6 +-
 sound/soc/sof/ipc.c                                |   33 +-
 sound/soc/sof/loader.c                             |   61 +-
 sound/soc/sof/nocodec.c                            |   12 -
 sound/soc/sof/ops.h                                |   34 +
 sound/soc/sof/pcm.c                                |  225 +-
 sound/soc/sof/pm.c                                 |  240 +-
 sound/soc/sof/sof-acpi-dev.c                       |   63 +-
 sound/soc/sof/sof-audio.c                          |  445 ++
 sound/soc/sof/sof-audio.h                          |  211 +
 sound/soc/sof/sof-of-dev.c                         |   24 +-
 sound/soc/sof/sof-pci-dev.c                        |  108 +-
 sound/soc/sof/sof-priv.h                           |  214 +-
 sound/soc/sof/topology.c                           |  521 +-
 sound/soc/sof/trace.c                              |    4 +-
 sound/soc/sof/utils.c                              |   60 +
 sound/soc/sof/xtensa/core.c                        |    2 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |    1 -
 sound/soc/sti/sti_uniperif.c                       |   12 +-
 sound/soc/stm/stm32_adfsdm.c                       |   29 +-
 sound/soc/tegra/tegra20_ac97.c                     |    1 -
 sound/soc/tegra/tegra_wm8903.c                     |    2 +-
 sound/soc/ti/davinci-mcasp.c                       |   35 +-
 sound/soc/ti/davinci-mcasp.h                       |    4 +
 sound/soc/ti/omap-mcpdm.c                          |   16 +-
 sound/soc/ti/rx51.c                                |   12 +-
 sound/soc/txx9/txx9aclc-ac97.c                     |    1 -
 sound/soc/txx9/txx9aclc.c                          |   16 +-
 sound/soc/uniphier/aio-cpu.c                       |   31 +-
 sound/soc/uniphier/aio-dma.c                       |   31 +-
 sound/soc/uniphier/aio-ld11.c                      |   18 -
 sound/soc/uniphier/aio-pxs2.c                      |   14 -
 sound/soc/uniphier/aio.h                           |    2 -
 sound/soc/ux500/ux500_msp_dai.c                    |    2 -
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   14 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   10 +-
 258 files changed, 24107 insertions(+), 4145 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ingenic,codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rt1015.txt
 create mode 100644 include/sound/sof/channel_map.h
 create mode 100644 sound/soc/amd/raven/acp3x-i2s.c
 create mode 100644 sound/soc/codecs/jz4770.c
 create mode 100644 sound/soc/codecs/mt6660.c
 create mode 100644 sound/soc/codecs/mt6660.h
 create mode 100644 sound/soc/codecs/rt1015.c
 create mode 100644 sound/soc/codecs/rt1015.h
 create mode 100644 sound/soc/codecs/rt1308-sdw.c
 create mode 100644 sound/soc/codecs/rt1308-sdw.h
 create mode 100644 sound/soc/codecs/rt700-sdw.c
 create mode 100644 sound/soc/codecs/rt700-sdw.h
 create mode 100644 sound/soc/codecs/rt700.c
 create mode 100644 sound/soc/codecs/rt700.h
 create mode 100644 sound/soc/codecs/rt711-sdw.c
 create mode 100644 sound/soc/codecs/rt711-sdw.h
 create mode 100644 sound/soc/codecs/rt711.c
 create mode 100644 sound/soc/codecs/rt711.h
 create mode 100644 sound/soc/codecs/rt715-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdw.h
 create mode 100644 sound/soc/codecs/rt715.c
 create mode 100644 sound/soc/codecs/rt715.h
 create mode 100644 sound/soc/codecs/wcd934x.c
 create mode 100644 sound/soc/codecs/wsa881x.c
 create mode 100644 sound/soc/intel/boards/bdw-rt5650.c
 create mode 100644 sound/soc/intel/boards/sof_da7219_max98373.c
 create mode 100644 sound/soc/sof/sof-audio.c
 create mode 100644 sound/soc/sof/sof-audio.h

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4vEz8ACgkQJNaLcl1U
h9A9SAf/fONHYA+mPtnzek5V8bDbvquymxdRVu5h/i0QaOFhO64w7HRLgJwUTXx7
RSlXZ7j9eMfLDXk328UBf+vwCCnwZGJfd3sZ4uDhn4tTfjusD0Fsx5viF8d2Idnz
R2zOR6WGi610Uw4uAzI85M+0ubN3SpmrAqknwYwBsQ5wHkrm4DdnqcaywKCJ1kpx
UgdkPGMsRt1ygPP7bLHCgBHWUlNgwiOUrGhkJVnxV36ViY9FYbNDlx8fKlMS1VJC
i3WZcN27YXTlOQ9cK77W+GlN3VaX8BOjJicjEx5Iyl5M4GADd6UBZaPjB5hnpywg
vWg6jNAKTmd0V9gbvkruyJ94OXS6Aw==
=xW7T
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

--===============8738884944790781642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8738884944790781642==--
