Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D714B98
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 16:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132CC18BD;
	Mon,  6 May 2019 16:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132CC18BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557151986;
	bh=c0at5YnOYoKz83y8bXiaC8LYELUReIqT54cdFNYr49Y=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TUIUMN0KUWMqrgQga1NIz7w14hThkM0MbIVxrkc1HIJ3Ae1W+6Ape85/1V9PlpH//
	 Z+J3m54SiUtJcXfSH6coZpnk0b/Vi7/5iXDv34K5SnVTpcnptzoJdYhnPNLOwiuSLU
	 W9pC3WffOTUB3J2TxMMf1fbhk1QPt3PiByR5YAXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B884F896FF;
	Mon,  6 May 2019 16:11:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE9BDF896F0; Mon,  6 May 2019 16:11:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD5F7F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD5F7F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tyG0CHP2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WhHg19A1+O0lcjHYgfSAZK8i5hnJqHD1EBuNqltagIo=; b=tyG0CHP2P5USxdwNr0ftAFPws
 UZXe5nhvaIdjo8bGVxYW7X4DYYlZJ3294DYZlkfVkPFMdsgwKUFYq9uplES2E+JFwPIM0EqL5pFcs
 z4ktEilYFiQvInRnO6IjgdSA6Am3hUE3Qsl7Q7ByvLT8CIQ3g/Wdur3l6tFyeYjYqKZDw=;
Received: from [2001:268:c0e6:658d:8f3d:d90b:c4e4:2fdf]
 (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNeLM-0001mN-B1; Mon, 06 May 2019 14:11:49 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 4FCDF44000C; Mon,  6 May 2019 15:11:44 +0100 (BST)
Date: Mon, 6 May 2019 23:11:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190506141144.GR14916@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates for v5.2
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
Content-Type: multipart/mixed; boundary="===============7642941767843301097=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7642941767843301097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6T5LqlUZTKFAO7Wr"
Content-Disposition: inline


--6T5LqlUZTKFAO7Wr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.2

for you to fetch changes up to 378d590c494551a68a824b939c711bb9a280e9ef:

  Merge branch 'asoc-5.2' into asoc-next (2019-05-06 22:51:54 +0900)

----------------------------------------------------------------
ASoC: Updates for v5.2

This is a pretty huge set of changes, it's been a pretty active release
all round but the big thing with this release is the Sound Open Firmware
changes from Intel, providing another DSP framework for use with the
DSPs in their SoCs.  This one works with the firmware of the same name
which is free software (unlike the previous DSP firmwares and framework)
and there has been some interest in adoption by other systems already so
hopefully we will see adoption by other vendors in the future.

Other highlights incldue:

 - Support for MCLK/sample rate ratio setting in the generic cards.
 - Support for pin switches in the generic cards.
 - A big set of improvements to the TLV320AIC32x4 drivers from Annaliese
   McDermond.
 - New drivers for Freescale audio mixers, several Intel machines,
   several Mediatek machines, Meson G12A, Sound Open Firmware and
   Spreadtrum compressed audio and DMA devices.

----------------------------------------------------------------
Adam Thomson (4):
      ASoC: da7219: Update DAI clock binding info to cover WCLK/BCLK
      ASoC: da7219: Expose BCLK and WCLK control through CCF
      ASoC: AMD: Update DA7219 DAI clock name to align with codec updates
      ASoC: da7219: Use clk_round_rate to handle enabled bclk/wclk case

Aditya Pakki (1):
      ASoC: sirf-audio: Remove redundant of_match_node call

Agrawal, Akshu (1):
      ASoC: AMD: Configure wclk and bclk of master codec

Anders Roxell (1):
      ASoC: Mediatek: MT8183: TS3A227: fix build error

Andi Kleen (1):
      ASoC: AMD: Fix incorrect extern

Andra Danciu (21):
      ASoC: imx-pcm: Switch to SPDX identifier
      ASoC: eukrea-tlv320: Switch to SPDX identifier
      ASoC: fsl-dma: Switch to SPDX identifier
      ASoC: imx-audmux: Switch to SPDX identifier
      ASoC: imx-es8328: Switch to SPDX identifier
      ASoC: imx-mc13783: Switch to SPDX identifier
      ASoC: imx-pcm-fiq: Switch to SPDX identifier
      ASoC: imx-spdif: Switch to SPDX identifier
      ASoC: imx-ssi: Switch to SPDX identifier
      ASoC: mpc5200_dma: Switch to SPDX identifier
      ASoC: mpc5200_psc_ac97: Switch to SPDX identifier
      ASoC: mpc5200_psc_i2s: Switch to SPDX identifier
      ASoC: mpc8610_hpcd: Switch to SPDX identifier
      ASoC: mx27vis-aic32x4: Switch to SPDX identifier
      ASoC: p1022_ds: Switch to SPDX identifier
      ASoC: p1022_rdk: Switch to SPDX identifier
      ASoC: pcm030-audio-fabric: Switch to SPDX identifier
      ASoC: phycore-ac97: Switch to SPDX identifier
      ASoC: wm1133-ev1: Switch to SPDX identifier
      ASoC: mpc5200_psc_i2s: Fix invalid license ID
      ASoC: mpc5200_dma: Fix invalid license ID

Andrew F. Davis (2):
      ASoC: tlv320aic31xx: Add headphone/headset detection
      ASoC: tlv320aic31xx: Add button press detection

Andy Shevchenko (10):
      ACPI / utils: Introduce acpi_dev_get_first_match_dev() helper
      extcon: axp288: Convert to use acpi_dev_get_first_match_dev()
      gpio: merrifield: Convert to use acpi_dev_get_first_match_dev()
      ASoC: Intel: bytcht_da7213: Convert to use acpi_dev_get_first_match_d=
ev()
      ASoC: Intel: bytcht_es8316: Convert to use acpi_dev_get_first_match_d=
ev()
      ASoC: Intel: bytcr_rt5640: Convert to use acpi_dev_get_first_match_de=
v()
      ASoC: Intel: bytcr_rt5651: Convert to use acpi_dev_get_first_match_de=
v()
      ASoC: Intel: cht_bsw_rt5645: Convert to use acpi_dev_get_first_match_=
dev()
      ASoC: Intel: cht_bsw_rt5672: Convert to use acpi_dev_get_first_match_=
dev()
      ACPI / utils: Remove deprecated function since no user left

Annaliese McDermond (17):
      ASoC: tlv320aic32x4: Break out clock setting into separate function
      ASoC: tlv320aic32x4: Properly Set Processing Blocks
      ASoC: tlv320aic32x4: Model PLL in CCF
      ASoC: tlv320aic32x4: Model CODEC_CLKIN in CCF
      ASoC: tlv320aic32x4: Model DAC/ADC dividers in CCF
      ASoC: tlv320aic32x4: Model BDIV divider in CCF
      ASoC: tlv320aic32x4: Control clock gating with CCF
      ASoC: tlv320aic32x4: Move aosr and dosr setting to separate functions
      ASoC: tlv320aic32x4: Dynamically Determine Clocking
      ASoC: tlv320aic32x4: Restructure set_dai_sysclk
      ASoC: tlv320aic32x4: Remove mclk references
      ASoC: tlv320aic32x4: Allow 192000 Sample Rate
      ASoC: tlv320aic32x4: Update copyright and use SPDX identifier
      ASoC: tlv320aic32x4: Add Switch for Setting Common Mode Voltage
      ASoC: tlv320aic32x4: Add Playback PowerTune Controls
      ASoC: tlv320aic32x4: Fix spacing
      ASoC: tlv320aic32x4: Fix potential uninitialized variable

Arnaud Pouliquen (1):
      ASoC: stm32: sai: simplify dai driver initialisation

Arnd Bergmann (6):
      ASoC: davinci-mcasp: Fix clang warning without CONFIG_PM
      ASoC: qcom: add i2c dependency for SND_SOC_SDM845
      ASoC: ti: remove compat dma probing
      ASoC: ams-delta: remove duplicate 'const'
      ASoC: ti: fix davinci_mcasp_probe dependencies
      ASoC: imx: fix fiq dependencies

Baolin Wang (5):
      ASoC: sprd: Add Spreadtrum audio compress offload support
      ASoC: sprd: Fix the smatch warning
      dt-bindings: ASoC: Add Spreadtrum multi-channel data transfer support
      ASoC: sprd: Add Spreadtrum multi-channel data transfer support
      ASoC: sprd: Add reserved DMA memory support

Bard liao (4):
      ASoC: topology: create tlv before soc_tplg_init_kcontrol
      ASoC: topology: free stream_name of dai_drv
      ASoC: topology: free link string in error
      ASoC: Intel: add sof-rt5682 machine driver

Cao Van Dong (1):
      ASoC: rsnd: Document r8a77470 bindings

Charles Keepax (12):
      ASoC: wm_adsp: Don't export wm_adsp2_lock
      ASoC: wm_adsp: Refactor firmware status reading
      ASoC: wm_adsp: Factor out parsing of firmware ID header
      ASoC: wm_adsp: Factor out DSP specific operations
      ASoC: wm_adsp: Correct some minor issues
      ASoC: lochnagar: Add device tree binding document
      ASoC: wm_adsp: Fix typo in comment
      ASoC: wm_adsp: Remove redundant NULL check in wm_adsp_buffer_free
      ASoC: wm_adsp: Make use of local variables
      ASoC: wm_adsp: Avoid calling snd_compr_stop_error from WDT expiry
      ASoC: wm_adsp: Use DSP ops pointers to stop watchdog in error handlers
      ASoC: wm_adsp: Correct region base typo in wm_halo_setup_algs

Codrin Ciubotariu (2):
      ASoC: mchp-i2s-mcc: dt-bindings: add DT bindings for I2S Multi-Channe=
l Controller
      ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Channel Controller

Colin Ian King (5):
      ASoC: fsl: fix spelling mistake: "missign" -> "missing"
      ASoC: sprd: Fix spelling mistake "faied" -> "failed"
      ASoC: hdmi-codec: fix spelling mistake "plalform" -> "platform"
      ASoC: SOF: Intel: fix spelling mistake "incompatble" -> "incompatible"
      ASoC: SOF: remove redundant null checks of dai

Daniel Baluta (2):
      ASoC: fsl_sai: Update is_slave_mode with correct value
      ASoC: fsl_sai: Add support for runtime pm

Fabien Dessenne (1):
      ASoC: stm32: i2s: return the get_irq error

Guennadi Liakhovetski (1):
      ASoC: SOF: Intel: Add legacy IPC support

Hans de Goede (2):
      ASoC: rt5651: Add support for active-high jack detect
      ASoC: Intel: bytcr_rt5651: Add BYT_RT5651_JD_NOT_INV quirk

Hui Wang (1):
      ASoC: rt5645: Headphone Jack sense inverts on the LattePanda board

Jenny TC (1):
      ASoC: Intel: kbl_da7219_max98927: remove headset

Jerome Brunet (11):
      ASoC: max98357a: add missing supported rates
      ASoC: meson: add g12a compatibles
      ASoC: meson: axg-fifo: add g12a support
      ASoC: meson: axg-toddr: add g12a support
      ASoC: meson: axg-frddr: add g12a support
      ASoC: meson: axg-tdm-formatter: rework quirks settings
      ASoC: meson: axg-tdmout: add g12a support
      ASoC: hdmi-codec: unlock the device on startup errors
      ASoC: fix valid stream condition
      ASoC: skip hw_free on codec dai for which the stream is invalid
      ASoC: hdmi-codec: stream is already locked in hw_params

Jiada Wang (1):
      ASoC: rsnd: src: fix compiler warnings

John Hsu (4):
      ASoC: nau8810: use 64-bit arithmetic instead of 32-bit
      ASoC: nau8810: fix the typo of function name
      ASoC: nau8810: automatic selecting BCLK in I2S master mode
      ASoC: nau8810: fix the issue of 64 bits division

KaiChieh Chuang (2):
      ASoC: dpcm: prevent snd_soc_dpcm use after free
      ASoC: mediatek: btcvsd fix irq mask

Kangjie Lu (2):
      ASoC: rt5645: fix a NULL pointer dereference
      ASoC: cs43130: fix a NULL pointer dereference

Keyon Jie (9):
      ASoC: SOF: Intel: Add hda-bus support and initialization
      ASoC: SOF: Intel: add SKL+ platform DAIs
      ASoC: SOF: Intel: cnl: add pointer ops to use DPIB position
      ASoC: SOF: PCM: add period_elapsed work to fix race condition in inte=
rrupt context
      ASoC: SOF: Intel: use snd_sof_pcm_period_elapsed
      ASoC: SOF: ipc: use snd_sof_pcm_period_elapsed
      ASoC: SOF: Intel: hda-ipc: simplify handling of IPC IRQ
      ASoC: SOF: Intel: hda-stream: store stream capabilities
      ASoC: SOF: Intel: hda-stream: handle real stream interrupts only

Kuninori Morimoto (18):
      ASoC: rsnd: add missing reg/reg-name at Document
      ASoC: rsnd: explain extended Audio DMAC peri peri address
      ASoC: simple-card: rename simple_get_conversion() to simple_parse_con=
vert()
      ASoC: simple-card: add simple_parse_mclk_fs()
      ASoC: audio-graph: rename graph_get_conversion() to graph_parse_conve=
rt()
      ASoC: audio-graph: add graph_parse_mclk_fs()
      ASoC: simple-card-utils: add asoc_simple_debug_info()
      ASoC: simple_card_utils: share common priv for simple-card/audio-graph
      ASoC: simple-card-utils: share asoc_simple_startup()
      ASoC: simple-card-utils: share asoc_simple_shutdown()
      ASoC: simple-card-utils: share asoc_simple_hw_param()
      ASoC: simple-card-utils: share asoc_simple_dai_init()
      ASoC: simple-card-utils: share asoc_simple_be_hw_params_fixup()
      ASoC: simple-card-utils: share asoc_simple_card_init_priv()
      ASoC: simple-card-utils: separate asoc_simple_card_parse_dai()
      ASoC: simple-card-utils: rename asoc_simple_card_xxx() to asoc_simple=
_()
      ASoC: simple-card-utils: test memory allocation
      ASoC: rsnd: fixup 6ch settings to 8ch

Liam Girdwood (28):
      ASoC: topology: Align tplg pointer increment across all kcontrols
      ASoC: SOF: Add Sound Open Firmware driver core
      ASoC: SOF: Add Sound Open Firmware KControl support
      ASoC: SOF: Add driver debug support.
      ASoC: SOF: Add support for IPC IO between DSP and Host
      ASoC: SOF: Add PCM operations support
      ASoC: SOF: Add support for loading topologies
      ASoC: SOF: Add DSP firmware logger support
      ASoC: SOF: Add DSP HW abstraction operations
      ASoC: SOF: Add firmware loader support
      ASoC: SOF: Add userspace ABI support
      ASoC: SOF: Add PM support
      ASoC: SOF: Add Nocodec machine driver support
      ASoC: SOF: Intel: Add BYT, CHT and BSW DSP HW support.
      ASoC: SOF: Intel: Add BDW HW DSP support
      ASoC: SOF: Intel: Add APL/CNL HW DSP support
      ASoC: SOF: Intel: Add HDA controller for Intel DSP
      ASoC: SOF: Intel: Add Intel specific HDA DSP HW operations
      ASoC: SOF: Intel: Add Intel specific HDA IPC mechanisms.
      ASoC: SOF: Add ACPI device support
      ASoC: SOF: Add PCI device support
      ASoC: SOF: Intel: Add Intel specific HDA firmware loader
      ASoC: SOF: Intel: Add Intel specific HDA PCM operations
      ASoC: SOF: Intel: Add Intel specific HDA stream operations
      ASoC: SOF: Intel: Add Intel specific HDA trace operations
      ASoC: SOF: Intel: Add platform differentiation for APL and CNL
      ASoC: SOF: Add Build support for SOF core and Intel drivers
      ASoC: Intel: Make sure BDW based machine drivers build for SOF

Libin Yang (2):
      ASoC: pcm: save fixed-up hw_params of BE
      ASoC: codec: hdac_hdmi add device_link to card device

Logesh (1):
      ASoC: da7213: fix DAI_CLK_EN register bit overwrite

Luca Ceresoli (2):
      ASoC: axi-i2s: let both capture and playback be optional
      ASoC: axi-i2s: make both "rx" and "tx" optional

Mac Chiang (1):
      ASoC: Intel: kbl_da7219_max98357a: Map BTN_0 to KEY_PLAYPAUSE

Mark Brown (11):
      Merge tag 'v5.1-rc1' into asoc-5.2
      Merge branch 'for-5.1' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.2
      Merge branch 'asoc-5.1' into asoc-5.2 for wmadsp
      ASoC: tlv320aic32x4: Only enable with common clock
      Merge branch 'acpi-utils' of git://git.kernel.org/.../rafael/linux-pm=
 into asoc-5.2
      ASoC: sprd: Fix modular build
      Merge branch 'asoc-5.1' into asoc-5.2
      Merge branch 'asoc-5.1' into asoc-5.2
      ASoC: Intel: Make boards more available for compile test
      Merge branch 'asoc-5.1' into asoc-linus
      Merge branch 'asoc-5.2' into asoc-next

Myl=E8ne Josserand (1):
      ASoC: simple-amplifier: Make gpio property optional

Nicolin Chen (1):
      ASoC: fsl_sai: Add missing return 0 in remove()

Oder Chiou (1):
      ASoC: rt5677-spi: Add ACPI ID

Olivier Moysan (14):
      ASoC: stm32: i2s: change trigger traces
      ASoC: stm32: i2s: improve channel capabilities handling
      ASoC: stm32: i2s: use default dai name
      ASoC: stm32: spdifrx: add power management
      ASoC: stm32: dfsdm: add mmap support
      ASoC: stm32: sai: add power management
      ASoC: cs42l51: add multi endpoint support
      ASoC: dt-bindings: update cs42l51 bindings
      ASoC: cs42l51: add regulator management
      ASoC: cs42l51: add reset management
      ASoC: cs42l51: add support of master mode
      ASoC: cs42l51: add power management
      ASoC: cs42l51: add adc volume control
      ASoC: cs42l51: change mic bias DAPM

Pan Xiuli (3):
      ASoC: SOF: IPC: add ipc dump function
      ASoC: SOF: Intel: APL: add ipc dump function
      ASoC: SOF: Intel: CNL: add ipc dump function

Pankaj Bharadiya (1):
      ASoC: dapm: Initialize private_value in snd_soc_dapm_new_dai

Paul Cercueil (7):
      ASoC: jz4740: Depend on MIPS instead of MACH_JZ4740
      ASoC: es8316: Add support for inverted jack detect
      ASoC: Intel: bytcht_es8316: Add quirk for inverted jack detect
      ASoC: Intel: bytcht_es8316: Add quirk for the Teclast X98+ II
      ASoC: doc: simple-card: Add pin-switches property
      ASoC: simple-card-utils: add asoc_simple_parse_pin_switches()
      ASoC: simple-card: Read pin switches conf from devicetree

Peter Ujfalusi (1):
      ASoC: pcm3168a: Enable TDM support for DSP_A/B modes

Pi-Hsun Shih (2):
      ASoC: mediatek: Fix UBSAN warning.
      ASoC: mediatek: Reduce repititive code on mtk_regmap_update_bits.

Pierre-Louis Bossart (15):
      ASoC: core: support driver alias names for FE topology overrides
      ASoC: topology: fix endianness issues
      ASoC: topology: fix big-endian check
      ASoC: Intel: bytcht_es8316: fix compilation warning
      ASoC: Intel: bytcr_rt5640: align quirk override handling
      ASoC: Intel: bytcr_rt5651: align quirk override handling
      ASoC: SOF: Add xtensa support
      ASoC: SOF: Add utils
      ASoC: SOF: Intel: Add support for HDAudio codecs
      ASoC: Intel: Kconfig: expose common option between SST and SOF drivers
      ASoC: Intel: select relevant machine drivers for SOF
      ASoC: SOF: add Kconfig option for strict ABI checks
      ASOC: SOF: ipc: add support for stricter ABI checks
      ASoC: SOF: topology: add support for stricter ABI checks
      ASoC: SOF: Intel: hda-pcm: remove useless dependency on hdac_ext

Piotr Stankiewicz (1):
      ASoC: lochnagar: Add driver to support Lochnagar 2 sound card

Rander Wang (2):
      ASoC: Intel: skl_hda_dsp_generic: add DMIC support
      ASoC: Intel: skl_hda_dsp_generic:refine code style

Randy Dunlap (1):
      ASoC: fix SND_SOC_LOCHNAGAR_SC kconfig warning

Ranjani Sridharan (2):
      ASoC: core: remove link components before cleaning up card resources
      ASoC: SOF: intel: hda: add hw_params_upon_resume flag for hda stream

Richard Fitzgerald (2):
      ASoC: wm_adsp: Move wm_adsp2_set_dspclk to CODEC drivers
      ASoC: wm_adsp: Add HALO MPU fault logging

Ross Zwisler (1):
      ASoC: Intel: avoid Oops if DMA setup fails

S.j. Wang (2):
      ASoC: fsl_esai: Support synchronous mode
      ASoC: fsl_esai: Fix missing break in switch statement

Seppo Ingalsuo (1):
      ASoC: dapm: fix kcontrols for effect widgets

Shunli Wang (5):
      ASoC: Mediatek: MT8183: Add machine driver with TS3A227
      ASoC: Mediatek: Add document for mt8183-mt6358-ts3a227-max98357
      ASoC: Mediatek: MT8183: Add machine driver with DA7219
      ASoC: Mediatek: Add document for mt8183-da7219-max98357
      ASoC: Mediatek: MT8183: add I2S2 control path from UL2 and UL3

Stuart Henderson (1):
      ASoC: wm_adsp: Add WDT expiry IRQ handling support for Halo core

Sugar Zhang (10):
      ASoC: rockchip: pdm: using left justified store mode
      ASoC: rockchip: pdm: add default regs
      ASoC: rockchip: pdm: optimize clear logic
      ASoC: rockchip: pdm: fixup pdm fractional div
      dt-bindings: sound: rockchip: add compatible for rk3308/px30
      ASoC: rockchip: pdm: add compatible for rk1808
      dt-bindings: sound: add compatible for rk1808
      ASoC: rockchip: pdm: adjust waterlevel in frame unit
      ASoC: rockchip: pdm: Correct PDM_CTRL0 reg value
      ASoC: rockchip: pdm: Mark RXFIFO_DATA as volatile and precious

Sylwester Nawrocki (28):
      ASoC: samsung: i2s: Don't use register read to determine slave/master=
 mode
      ASoC: samsung: arndale: Convert to SPDX License Identifier
      ASoC: samsung: bells: Convert to SPDX License Identifier
      ASoC: samsung: dmaengine: Convert to SPDX License Indentifier
      ASoC: samsung: h1940_uda1380: Convert to SPDX License Identifier
      ASoC: samsung: i2s: Convert to SPDX License Identifier
      ASoC: samsung: idma: Convert to SPDX License Identifier
      ASoC: samsung: jive_wm8750: Convert to SPDX License Identifier
      ASoC: samsung: littlemill: Convert to SPDX License Identifier
      ASoC: samsung: lowland: Convert to SPDX License Identifier
      ASoC: samsung: neo1973_wm8753: Convert to SPDX License Identifier
      ASoC: samsung: odroid: Convert to SPDX License Identifier
      ASoC: samsung: pcm: Convert to SPDX License Identifier
      ASoC: samsung: s3c-i2s-v2: Convert to SPDX License Identifier
      ASoC: samsung: s3c24xx-i2s: Convert to SPDX License Identifier
      ASoC: samsung: rx1950_uda1380: Convert to SPDX License Identifier
      ASoC: samsung: s3c2412-i2s: Convert to SPDX License Identifier
      ASoC: samsung: s3c24xx_simtec*: Convert to SPDX License Identifier
      ASoC: samsung: s3c24xx_uda134x: Convert to SPDX License Identifier
      ASoC: samsung: smartq_wm8987: Convert to SPDX License Identifier
      ASoC: samsung: smdk_spdif: Convert to SPDX License Identifier
      ASoC: samsung: smdk_wm8580: Convert to SPDX License Identifier
      ASoC: samsung: smdk_wm8994*: Convert to SPDX License Identifier
      ASoC: samsung: snow: Convert to SPDX License Identifier
      ASoC: samsung: spdif: Convert to SPDX License Identifier
      ASoC: samsung: speyside: Convert to SPDX License Identifier
      ASoC: samsung: tm2_wm5110: Convert to SPDX License Identifier
      ASoC: samsung: tobermory: Convert to SPDX License Identifier

Tzung-Bi Shih (1):
      ASoC: Mediatek: MT8183: change supported formats of DL2 and UL1

Viorel Suman (8):
      ASoC: fsl: Add Audio Mixer CPU DAI driver
      ASoC: add fsl_audmix DT binding documentation
      ASoC: fsl: Add Audio Mixer machine driver
      ASoC: fsl_audmix: Fix kbuild failure
      ASoC: imx-audmix: fix object reference leaks in probe
      ASoC: fsl_audmix: remove "model" attribute from DT document
      ASoC: fsl_audmix: remove "model" attribute
      ASoC: fsl_audmix: cache pdev->dev pointer

Wei Yongjun (2):
      ASoC: sprd: Fix return value check in sprd_mcdt_probe()
      ASoC: sprd: Fix to use list_for_each_entry_safe() when delete items

Wen Shi (1):
      ASoC: wm_adsp: Add support for new Halo core DSPs

Wen Yang (3):
      ASoC: wcd9335: fix a leaked reference by adding missing of_node_put
      ASoC: fsl_utils: fix a leaked reference by adding missing of_node_put
      ASoC: eukrea-tlv320: fix a leaked reference by adding missing of_node=
_put

Xun Zhang (1):
      ASoC: codecs: rt5682: initialize mutex before using

Yong Zhi (1):
      ASoC: Intel: common: add Geminilake Realtek+Maxim machine driver entry

Yu-Hsuan Hsu (1):
      ASoC: da7219: Update the support rate list

YueHaibing (10):
      ASoC: simple-card-utils: remove set but not used variable 'dai_name'
      ASoC: Mediatek: MT8183: Fix build error in mt8183_da7219_max98357_dev=
_probe
      ASoC: Mediatek: MT8183: Fix platform_no_drv_owner.cocci warnings
      ASoC: Mediatek: MT8183: Fix platform_no_drv_owner.cocci warnings
      ASoC: Intel: Haswell: Remove set but not used variable 'stage_type'
      ASoC: Mediatek: MT8183: Fix build err while CONFIG_I2C set to module
      ASoC: fsl_micfil: Remove set but not used variable 'osr'
      ASoC: tlv320aic32x4: Remove set but not used variable 'mclk_rate'
      ASoC: amd: acp3x: Make acp3x_dai_i2s_ops static
      ASoC: atmel: tse850: Make some functions static

Zhu Yingjiang (4):
      ASoC: SOF: Intel: hda: add the SSP Host Device memory space
      ASoC: SOF: Intel: hda: add SSP info to the chip info struct
      ASoC: SOF: Intel: hda: set I2S slave before enabling DSP
      ASoC: SOF: Intel: hda: set bus->idx as 0

kbuild test robot (1):
      ASoC: tlv320aic31xx: aic31xx_set_jack() can be static

 .../devicetree/bindings/sound/adi,axi-i2s.txt      |    7 +-
 .../devicetree/bindings/sound/amlogic,axg-fifo.txt |    4 +-
 .../devicetree/bindings/sound/amlogic,axg-pdm.txt  |    3 +-
 .../bindings/sound/amlogic,axg-spdifin.txt         |    3 +-
 .../bindings/sound/amlogic,axg-spdifout.txt        |    3 +-
 .../bindings/sound/amlogic,axg-tdm-formatters.txt  |    4 +-
 .../devicetree/bindings/sound/cirrus,lochnagar.txt |   39 +
 .../devicetree/bindings/sound/cs42l51.txt          |   16 +
 Documentation/devicetree/bindings/sound/da7219.txt |    8 +-
 .../devicetree/bindings/sound/fsl,audmix.txt       |   50 +
 .../devicetree/bindings/sound/mchp-i2s-mcc.txt     |   43 +
 .../bindings/sound/mt8183-da7219-max98357.txt      |   15 +
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |   15 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |    8 +-
 .../devicetree/bindings/sound/rockchip,pdm.txt     |    5 +
 Documentation/devicetree/bindings/sound/rt5651.txt |    5 +
 .../devicetree/bindings/sound/simple-amplifier.txt |    2 +-
 .../devicetree/bindings/sound/simple-card.txt      |    2 +
 .../devicetree/bindings/sound/sprd-mcdt.txt        |   19 +
 MAINTAINERS                                        |    2 +
 drivers/acpi/utils.c                               |   16 +-
 drivers/extcon/extcon-axp288.c                     |    9 +-
 drivers/gpio/gpio-merrifield.c                     |   18 +-
 include/acpi/acpi_bus.h                            |    4 +-
 include/linux/acpi.h                               |    4 +-
 include/sound/da7219.h                             |    8 +-
 include/sound/simple_card_utils.h                  |  238 +-
 include/sound/sof.h                                |  100 +
 include/sound/sof/control.h                        |  158 +
 include/sound/sof/dai-intel.h                      |  178 ++
 include/sound/sof/dai.h                            |   75 +
 include/sound/sof/header.h                         |  158 +
 include/sound/sof/info.h                           |  118 +
 include/sound/sof/pm.h                             |   48 +
 include/sound/sof/stream.h                         |  148 +
 include/sound/sof/topology.h                       |  256 ++
 include/sound/sof/trace.h                          |   67 +
 include/sound/sof/xtensa.h                         |   44 +
 include/uapi/sound/sof/abi.h                       |   62 +
 include/uapi/sound/sof/eq.h                        |  172 ++
 include/uapi/sound/sof/fw.h                        |   78 +
 include/uapi/sound/sof/header.h                    |   27 +
 include/uapi/sound/sof/manifest.h                  |  188 ++
 include/uapi/sound/sof/tokens.h                    |  107 +
 include/uapi/sound/sof/tone.h                      |   21 +
 include/uapi/sound/sof/trace.h                     |   66 +
 sound/soc/Kconfig                                  |    1 +
 sound/soc/Makefile                                 |    1 +
 sound/soc/adi/axi-i2s.c                            |   68 +-
 sound/soc/amd/acp-da7219-max98357a.c               |   68 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    2 +-
 sound/soc/atmel/Kconfig                            |   14 +
 sound/soc/atmel/Makefile                           |    2 +
 sound/soc/atmel/mchp-i2s-mcc.c                     |  974 ++++++
 sound/soc/atmel/tse850-pcm5142.c                   |   16 +-
 sound/soc/codecs/Kconfig                           |   15 +-
 sound/soc/codecs/Makefile                          |    4 +-
 sound/soc/codecs/cs42l51-i2c.c                     |   13 +-
 sound/soc/codecs/cs42l51.c                         |  225 +-
 sound/soc/codecs/cs42l51.h                         |    3 +
 sound/soc/codecs/cs43130.c                         |    2 +
 sound/soc/codecs/cs47l24.c                         |    4 +-
 sound/soc/codecs/da7213.c                          |    5 +-
 sound/soc/codecs/da7213.h                          |    2 +
 sound/soc/codecs/da7219.c                          |  540 +++-
 sound/soc/codecs/da7219.h                          |    6 +-
 sound/soc/codecs/es8316.c                          |   14 +
 sound/soc/codecs/hdac_hdmi.c                       |   11 +
 sound/soc/codecs/hdmi-codec.c                      |   12 +-
 sound/soc/codecs/lochnagar-sc.c                    |  266 ++
 sound/soc/codecs/max98357a.c                       |    3 +
 sound/soc/codecs/nau8810.c                         |   25 +-
 sound/soc/codecs/pcm3168a.c                        |    7 +-
 sound/soc/codecs/rt5645.c                          |   17 +
 sound/soc/codecs/rt5651.c                          |   47 +-
 sound/soc/codecs/rt5651.h                          |    1 +
 sound/soc/codecs/rt5677-spi.c                      |    8 +
 sound/soc/codecs/rt5682.c                          |    2 +-
 sound/soc/codecs/simple-amplifier.c                |    3 +-
 sound/soc/codecs/sirf-audio-codec.c                |    3 -
 sound/soc/codecs/tlv320aic31xx.c                   |   61 +-
 sound/soc/codecs/tlv320aic31xx.h                   |   12 +
 sound/soc/codecs/tlv320aic32x4-clk.c               |  483 +++
 sound/soc/codecs/tlv320aic32x4-i2c.c               |   14 +-
 sound/soc/codecs/tlv320aic32x4-spi.c               |   14 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  441 +--
 sound/soc/codecs/tlv320aic32x4.h                   |   13 +
 sound/soc/codecs/wcd9335.c                         |    1 +
 sound/soc/codecs/wm5102.c                          |    4 +-
 sound/soc/codecs/wm5110.c                          |    4 +-
 sound/soc/codecs/wm_adsp.c                         | 1032 +++++--
 sound/soc/codecs/wm_adsp.h                         |   50 +-
 sound/soc/codecs/wmfw.h                            |   30 +
 sound/soc/fsl/Kconfig                              |   25 +-
 sound/soc/fsl/Makefile                             |    5 +
 sound/soc/fsl/eukrea-tlv320.c                      |   30 +-
 sound/soc/fsl/fsl_audmix.c                         |  578 ++++
 sound/soc/fsl/fsl_audmix.h                         |  102 +
 sound/soc/fsl/fsl_dma.c                            |   26 +-
 sound/soc/fsl/fsl_dma.h                            |    5 +-
 sound/soc/fsl/fsl_esai.c                           |   23 +-
 sound/soc/fsl/fsl_micfil.c                         |    3 -
 sound/soc/fsl/fsl_sai.c                            |   26 +-
 sound/soc/fsl/fsl_utils.c                          |    1 +
 sound/soc/fsl/imx-audmix.c                         |  331 ++
 sound/soc/fsl/imx-audmux.c                         |   26 +-
 sound/soc/fsl/imx-es8328.c                         |   15 +-
 sound/soc/fsl/imx-mc13783.c                        |   22 +-
 sound/soc/fsl/imx-pcm-fiq.c                        |   21 +-
 sound/soc/fsl/imx-pcm.h                            |    6 +-
 sound/soc/fsl/imx-spdif.c                          |   13 +-
 sound/soc/fsl/imx-ssi.c                            |   57 +-
 sound/soc/fsl/imx-ssi.h                            |    6 +-
 sound/soc/fsl/mpc5200_dma.c                        |   14 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |   16 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |   14 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   18 +-
 sound/soc/fsl/mx27vis-aic32x4.c                    |   29 +-
 sound/soc/fsl/p1022_ds.c                           |   18 +-
 sound/soc/fsl/p1022_rdk.c                          |   32 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |   18 +-
 sound/soc/fsl/phycore-ac97.c                       |   16 +-
 sound/soc/fsl/wm1133-ev1.c                         |   21 +-
 sound/soc/generic/audio-graph-card.c               |  429 ++-
 sound/soc/generic/simple-card-utils.c              |  440 +--
 sound/soc/generic/simple-card.c                    |  383 +--
 sound/soc/intel/Kconfig                            |    7 +-
 sound/soc/intel/boards/Kconfig                     |  117 +-
 sound/soc/intel/boards/Makefile                    |    2 +
 sound/soc/intel/boards/bdw-rt5677.c                |    4 +
 sound/soc/intel/boards/broadwell.c                 |    4 +
 sound/soc/intel/boards/bytcht_da7213.c             |    9 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   51 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   16 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   42 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    9 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    9 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   52 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |   22 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h        |    2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |   19 +-
 sound/soc/intel/boards/sof_rt5682.c                |  563 ++++
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |    6 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |    6 +
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   19 +
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |    9 +
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |    6 +
 sound/soc/intel/common/sst-firmware.c              |    8 +-
 sound/soc/intel/haswell/sst-haswell-ipc.c          |    8 +-
 sound/soc/jz4740/Kconfig                           |    2 +-
 sound/soc/mediatek/Kconfig                         |   27 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   51 +-
 sound/soc/mediatek/common/mtk-btcvsd.c             |    4 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   13 -
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |   16 -
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   16 -
 sound/soc/mediatek/mt8183/Makefile                 |    2 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   18 +
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  471 +++
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  423 +++
 sound/soc/meson/axg-fifo.c                         |   34 +-
 sound/soc/meson/axg-fifo.h                         |    2 +
 sound/soc/meson/axg-frddr.c                        |  143 +-
 sound/soc/meson/axg-tdm-formatter.c                |    6 +-
 sound/soc/meson/axg-tdm-formatter.h                |   11 +-
 sound/soc/meson/axg-tdmin.c                        |   16 +-
 sound/soc/meson/axg-tdmout.c                       |   29 +-
 sound/soc/meson/axg-toddr.c                        |   53 +
 sound/soc/qcom/Kconfig                             |    2 +-
 sound/soc/rockchip/rockchip_pdm.c                  |  205 +-
 sound/soc/rockchip/rockchip_pdm.h                  |   12 +
 sound/soc/samsung/arndale_rt5631.c                 |   17 +-
 sound/soc/samsung/bells.c                          |   15 +-
 sound/soc/samsung/dma.h                            |    8 +-
 sound/soc/samsung/dmaengine.c                      |   22 +-
 sound/soc/samsung/h1940_uda1380.c                  |   22 +-
 sound/soc/samsung/i2s-regs.h                       |    8 +-
 sound/soc/samsung/i2s.c                            |   27 +-
 sound/soc/samsung/i2s.h                            |    8 +-
 sound/soc/samsung/idma.c                           |   20 +-
 sound/soc/samsung/idma.h                           |    9 +-
 sound/soc/samsung/jive_wm8750.c                    |   19 +-
 sound/soc/samsung/littlemill.c                     |   15 +-
 sound/soc/samsung/lowland.c                        |   15 +-
 sound/soc/samsung/neo1973_wm8753.c                 |   25 +-
 sound/soc/samsung/odroid.c                         |   10 +-
 sound/soc/samsung/pcm.c                            |   19 +-
 sound/soc/samsung/pcm.h                            |    8 +-
 sound/soc/samsung/regs-i2s-v2.h                    |   10 +-
 sound/soc/samsung/regs-iis.h                       |    7 +-
 sound/soc/samsung/rx1950_uda1380.c                 |   30 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |   26 +-
 sound/soc/samsung/s3c-i2s-v2.h                     |   11 +-
 sound/soc/samsung/s3c2412-i2s.c                    |   28 +-
 sound/soc/samsung/s3c2412-i2s.h                    |   11 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |   25 +-
 sound/soc/samsung/s3c24xx-i2s.h                    |    6 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |   11 +-
 sound/soc/samsung/s3c24xx_simtec.h                 |   10 +-
 sound/soc/samsung/s3c24xx_simtec_hermes.c          |   11 +-
 sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c     |   11 +-
 sound/soc/samsung/s3c24xx_uda134x.c                |   20 +-
 sound/soc/samsung/smartq_wm8987.c                  |   21 +-
 sound/soc/samsung/smdk_spdif.c                     |   16 +-
 sound/soc/samsung/smdk_wm8580.c                    |   15 +-
 sound/soc/samsung/smdk_wm8994.c                    |    9 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |   16 +-
 sound/soc/samsung/snow.c                           |   15 +-
 sound/soc/samsung/spdif.c                          |   17 +-
 sound/soc/samsung/spdif.h                          |    8 +-
 sound/soc/samsung/speyside.c                       |   15 +-
 sound/soc/samsung/tm2_wm5110.c                     |   17 +-
 sound/soc/samsung/tobermory.c                      |   15 +-
 sound/soc/sh/rcar/core.c                           |   18 +-
 sound/soc/sh/rcar/rsnd.h                           |    1 +
 sound/soc/sh/rcar/ssi.c                            |    2 +
 sound/soc/soc-core.c                               |   18 +-
 sound/soc/soc-dapm.c                               |    5 +-
 sound/soc/soc-pcm.c                                |   14 +-
 sound/soc/soc-topology.c                           |  330 +-
 sound/soc/sof/Kconfig                              |  156 +
 sound/soc/sof/Makefile                             |   18 +
 sound/soc/sof/control.c                            |  552 ++++
 sound/soc/sof/core.c                               |  506 ++++
 sound/soc/sof/debug.c                              |  232 ++
 sound/soc/sof/intel/Kconfig                        |  230 ++
 sound/soc/sof/intel/Makefile                       |   19 +
 sound/soc/sof/intel/apl.c                          |  113 +
 sound/soc/sof/intel/bdw.c                          |  713 +++++
 sound/soc/sof/intel/byt.c                          |  874 ++++++
 sound/soc/sof/intel/cnl.c                          |  268 ++
 sound/soc/sof/intel/hda-bus.c                      |  111 +
 sound/soc/sof/intel/hda-codec.c                    |  171 ++
 sound/soc/sof/intel/hda-ctrl.c                     |  181 ++
 sound/soc/sof/intel/hda-dai.c                      |  356 +++
 sound/soc/sof/intel/hda-dsp.c                      |  471 +++
 sound/soc/sof/intel/hda-ipc.c                      |  455 +++
 sound/soc/sof/intel/hda-loader.c                   |  382 +++
 sound/soc/sof/intel/hda-pcm.c                      |  239 ++
 sound/soc/sof/intel/hda-stream.c                   |  701 +++++
 sound/soc/sof/intel/hda-trace.c                    |   94 +
 sound/soc/sof/intel/hda.c                          |  689 +++++
 sound/soc/sof/intel/hda.h                          |  583 ++++
 sound/soc/sof/intel/intel-ipc.c                    |   92 +
 sound/soc/sof/intel/shim.h                         |  185 ++
 sound/soc/sof/ipc.c                                |  842 ++++++
 sound/soc/sof/loader.c                             |  400 +++
 sound/soc/sof/nocodec.c                            |  109 +
 sound/soc/sof/ops.c                                |  163 +
 sound/soc/sof/ops.h                                |  411 +++
 sound/soc/sof/pcm.c                                |  767 +++++
 sound/soc/sof/pm.c                                 |  388 +++
 sound/soc/sof/sof-acpi-dev.c                       |  312 ++
 sound/soc/sof/sof-pci-dev.c                        |  373 +++
 sound/soc/sof/sof-priv.h                           |  635 ++++
 sound/soc/sof/topology.c                           | 3179 ++++++++++++++++=
++++
 sound/soc/sof/trace.c                              |  297 ++
 sound/soc/sof/utils.c                              |  112 +
 sound/soc/sof/xtensa/Kconfig                       |    2 +
 sound/soc/sof/xtensa/Makefile                      |    5 +
 sound/soc/sof/xtensa/core.c                        |  138 +
 sound/soc/sprd/Kconfig                             |    9 +
 sound/soc/sprd/Makefile                            |    6 +-
 sound/soc/sprd/sprd-mcdt.c                         | 1011 +++++++
 sound/soc/sprd/sprd-mcdt.h                         |  107 +
 sound/soc/sprd/sprd-pcm-compress.c                 |  674 +++++
 sound/soc/sprd/sprd-pcm-dma.c                      |    9 +-
 sound/soc/sprd/sprd-pcm-dma.h                      |   43 +
 sound/soc/stm/stm32_adfsdm.c                       |    2 +-
 sound/soc/stm/stm32_i2s.c                          |   30 +-
 sound/soc/stm/stm32_sai.c                          |   80 +-
 sound/soc/stm/stm32_sai.h                          |    2 +
 sound/soc/stm/stm32_sai_sub.c                      |   88 +-
 sound/soc/stm/stm32_spdifrx.c                      |   42 +-
 sound/soc/ti/Kconfig                               |    4 +-
 sound/soc/ti/ams-delta.c                           |    2 +-
 sound/soc/ti/davinci-mcasp.c                       |    2 +
 sound/soc/ti/edma-pcm.c                            |    5 +-
 sound/soc/ti/sdma-pcm.c                            |    9 +-
 280 files changed, 29423 insertions(+), 2743 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,lochnaga=
r.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,audmix.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mt8183-da7219-m=
ax98357.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mt8183-mt6358-t=
s3a227-max98357.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sprd-mcdt.txt
 create mode 100644 include/sound/sof.h
 create mode 100644 include/sound/sof/control.h
 create mode 100644 include/sound/sof/dai-intel.h
 create mode 100644 include/sound/sof/dai.h
 create mode 100644 include/sound/sof/header.h
 create mode 100644 include/sound/sof/info.h
 create mode 100644 include/sound/sof/pm.h
 create mode 100644 include/sound/sof/stream.h
 create mode 100644 include/sound/sof/topology.h
 create mode 100644 include/sound/sof/trace.h
 create mode 100644 include/sound/sof/xtensa.h
 create mode 100644 include/uapi/sound/sof/abi.h
 create mode 100644 include/uapi/sound/sof/eq.h
 create mode 100644 include/uapi/sound/sof/fw.h
 create mode 100644 include/uapi/sound/sof/header.h
 create mode 100644 include/uapi/sound/sof/manifest.h
 create mode 100644 include/uapi/sound/sof/tokens.h
 create mode 100644 include/uapi/sound/sof/tone.h
 create mode 100644 include/uapi/sound/sof/trace.h
 create mode 100644 sound/soc/atmel/mchp-i2s-mcc.c
 create mode 100644 sound/soc/codecs/lochnagar-sc.c
 create mode 100644 sound/soc/codecs/tlv320aic32x4-clk.c
 create mode 100644 sound/soc/fsl/fsl_audmix.c
 create mode 100644 sound/soc/fsl/fsl_audmix.h
 create mode 100644 sound/soc/fsl/imx-audmix.c
 create mode 100644 sound/soc/intel/boards/sof_rt5682.c
 create mode 100644 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
 create mode 100644 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max9835=
7.c
 create mode 100644 sound/soc/sof/Kconfig
 create mode 100644 sound/soc/sof/Makefile
 create mode 100644 sound/soc/sof/control.c
 create mode 100644 sound/soc/sof/core.c
 create mode 100644 sound/soc/sof/debug.c
 create mode 100644 sound/soc/sof/intel/Kconfig
 create mode 100644 sound/soc/sof/intel/Makefile
 create mode 100644 sound/soc/sof/intel/apl.c
 create mode 100644 sound/soc/sof/intel/bdw.c
 create mode 100644 sound/soc/sof/intel/byt.c
 create mode 100644 sound/soc/sof/intel/cnl.c
 create mode 100644 sound/soc/sof/intel/hda-bus.c
 create mode 100644 sound/soc/sof/intel/hda-codec.c
 create mode 100644 sound/soc/sof/intel/hda-ctrl.c
 create mode 100644 sound/soc/sof/intel/hda-dai.c
 create mode 100644 sound/soc/sof/intel/hda-dsp.c
 create mode 100644 sound/soc/sof/intel/hda-ipc.c
 create mode 100644 sound/soc/sof/intel/hda-loader.c
 create mode 100644 sound/soc/sof/intel/hda-pcm.c
 create mode 100644 sound/soc/sof/intel/hda-stream.c
 create mode 100644 sound/soc/sof/intel/hda-trace.c
 create mode 100644 sound/soc/sof/intel/hda.c
 create mode 100644 sound/soc/sof/intel/hda.h
 create mode 100644 sound/soc/sof/intel/intel-ipc.c
 create mode 100644 sound/soc/sof/intel/shim.h
 create mode 100644 sound/soc/sof/ipc.c
 create mode 100644 sound/soc/sof/loader.c
 create mode 100644 sound/soc/sof/nocodec.c
 create mode 100644 sound/soc/sof/ops.c
 create mode 100644 sound/soc/sof/ops.h
 create mode 100644 sound/soc/sof/pcm.c
 create mode 100644 sound/soc/sof/pm.c
 create mode 100644 sound/soc/sof/sof-acpi-dev.c
 create mode 100644 sound/soc/sof/sof-pci-dev.c
 create mode 100644 sound/soc/sof/sof-priv.h
 create mode 100644 sound/soc/sof/topology.c
 create mode 100644 sound/soc/sof/trace.c
 create mode 100644 sound/soc/sof/utils.c
 create mode 100644 sound/soc/sof/xtensa/Kconfig
 create mode 100644 sound/soc/sof/xtensa/Makefile
 create mode 100644 sound/soc/sof/xtensa/core.c
 create mode 100644 sound/soc/sprd/sprd-mcdt.c
 create mode 100644 sound/soc/sprd/sprd-mcdt.h
 create mode 100644 sound/soc/sprd/sprd-pcm-compress.c

--6T5LqlUZTKFAO7Wr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQQJ8ACgkQJNaLcl1U
h9CTGwf/RPoALHnyjwBr3Uln1sUmgk7u1sH/xiflS/hrIc0JCzxiX68ntln1daIE
JRpPXS1D1CO1jXf+P/BBq/BEkLcSw6202ByW3BXQj9YLSN9ioKbCuoXBpkle7Wcj
rRl6mR7u5blrLLvggLyU3ziBXTzGEl2uD1uZJlF3jpICC1GglWtXNZ5ledEq5Ea8
aZLq96S+hxxzTjhbHIDikvGtK64PhQP2Wo5MLlWocmHtgvJ5U9kVPWm+EOcxnOwa
V6RoDkFz9XKu/tUpIPOuDd2rH9puXK6VzQLtNPsQkHyNw9LbhUJYHtJ9QheWYyYS
w/U0ZDZKzo/wryQxy5MS4AM2lrT5rw==
=pyic
-----END PGP SIGNATURE-----

--6T5LqlUZTKFAO7Wr--

--===============7642941767843301097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7642941767843301097==--
