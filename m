Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9D7D181A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 23:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2C784B;
	Fri, 20 Oct 2023 23:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2C784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697837446;
	bh=hRwgsUYDoQDd0sI+QDSzKnt96oPlvu/dSgaf66FLlRU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GuM3o267duw75FCj4mCeHMHf1UmlFU3BfxPP6Sbxo1l8H2KJFL94/MIh1ZqJbAfvj
	 hKdOOLxwOz27z2wErOSmwVxaZmstMqi8xdrfD4ogWE9u8BQqwBVGV29ZA6rWV4vndC
	 XEBdul1yUKS8WZp4RuUdHyZQ5LvRT9p1+vVw2fQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18009F8025F; Fri, 20 Oct 2023 23:29:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59274F8024E;
	Fri, 20 Oct 2023 23:29:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B8E6F8025F; Fri, 20 Oct 2023 23:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB87DF80236
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 23:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB87DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u4ZjPO4T
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BA23623C9;
	Fri, 20 Oct 2023 21:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268F5C433C7;
	Fri, 20 Oct 2023 21:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697837350;
	bh=hRwgsUYDoQDd0sI+QDSzKnt96oPlvu/dSgaf66FLlRU=;
	h=From:To:Cc:Subject:Date:From;
	b=u4ZjPO4TtouWpJgEKgd5+PSePzxRMHCdxrSMQ3WS6Wk1ZYzE6x/MER86Z28MT/97L
	 05Y+gh7dpgw4cOMb9P9En4xY2sczSZiAqUwvebHeNcw4p728W+Ujy44XcKUncILkGm
	 xbTOxL5gH2xTMo1ax14g1PozOwwJRUa1sIHfEddQzmH9iNXtr8qDevnefRpiuTPTum
	 1Yr6XNe1BN9uQwO+FGafNjK2vp4lwYCA8eRAgy3CQCxSjOPILdbpoWUby2Dojy0mz5
	 ub7LiKzovvs9HiKevA4+B50hxYgSHVZ7TfSoP590Dh6/U1h7bFb0JsMIPSWC3HtDCM
	 ryOr652hbkDtw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.7
Date: Fri, 20 Oct 2023 22:28:58 +0100
Message-Id: <20231020212909.268F5C433C7@smtp.kernel.org>
Message-ID-Hash: DSZCI57QHYUQNMOHMEQHDZOFW5VSRJ6O
X-Message-ID-Hash: DSZCI57QHYUQNMOHMEQHDZOFW5VSRJ6O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DSZCI57QHYUQNMOHMEQHDZOFW5VSRJ6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 99d426c6dd2d6f9734617ec12def856ee35b9218:

  ASoC: cs42l43: Update values for bias sense (2023-10-10 12:50:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.7

for you to fetch changes up to 45f1b12e0366a750d65e92307685964488a3b6f4:

  ASoC: Intel: more machine driver updates for 6.7 (2023-10-19 21:02:18 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.7

This is quite a large set of changes but mostly due to API cleanups and
in driver specific ways rather than due to anything subsystem wide.
Highlights include:

 - Standardisation of API prefixes on snd_soc_, removing asoc_.
 - GPIO API usage improvements.
 - Support for HDA patches.
 - Lots of work on SOF, including crash dump support.
 - Support for AMD platforms with es83xx, Awinc AT87390, many Intel
   platforms, many Mediatek platforms, Qualcomm SM6115,  Richtek RTQ9128
   and Texas Instruments TAS575x.

----------------------------------------------------------------
Amadeusz Sławiński (20):
      ASoC: doc: Update codec to codec examples
      ASoC: Intel: avs: Use generic size defines
      ASoC: Intel: avs: Preallocate memory for module configuration
      ASoC: Intel: avs: Remove unused variable
      ASoC: Intel: avs: Only create SSP%d snd_soc_dai_driver when requested
      ASoC: Intel: avs: Introduce helper functions for SSP and TDM handling
      ASoC: Intel: avs: Improve topology parsing of dynamic strings
      ASoC: Intel: avs: i2s_test: Validate machine board configuration
      ASoC: Intel: avs: rt274: Validate machine board configuration
      ASoC: Intel: avs: rt5682: Validate machine board configuration
      ASoC: Intel: avs: max98357a: Validate machine board configuration
      ASoC: Intel: avs: rt298: Validate machine board configuration
      ASoC: Intel: avs: da7219: Validate machine board configuration
      ASoC: Intel: avs: es8336: Validate machine board configuration
      ASoC: Intel: avs: max98373: Validate machine board configuration
      ASoC: Intel: avs: max98927: Validate machine board configuration
      ASoC: Intel: avs: nau8825: Validate machine board configuration
      ASoC: Intel: avs: rt286: Validate machine board configuration
      ASoC: Intel: avs: rt5663: Validate machine board configuration
      ASoC: Intel: avs: ssm4567: Validate machine board configuration

Andy Shevchenko (1):
      ASoC: soc.h: replace custom COUNT_ARGS() & CONCATENATE() implementations

Arun T (2):
      ASoC: Intel: common: add ACPI matching tables for Arrow Lake
      ASoC: SOF: Intel: pci-mtl: use ARL specific firmware definitions

Balamurugan C (2):
      ASoC: Intel: sof_rt5682: add HDMI_In capture feature support for RPL.
      ASoC: Intel: MTL: Add entry for HDMI-In capture support to non-I2S codec boards.

Bard Liao (11):
      ASoC: SOF: ipc4-topology: export sof_ipc4_copier_is_single_format
      ASoC: SOF: ipc4-pcm: fixup dailink based on copier format
      ASoC: intel: sof_sdw: Add CS42L43 CODEC support
      ASoC: hdac_hda: add HDA patch loader support
      ASoC: hdac_hda: fix HDA patch loader support
      ASoC: Intel: soc-acpi-intel-rpl-match: add rt711-l0-rt1316-l12 support
      ASoC: Intel: soc-acpi-intel-mtl-match: add rt713 rt1316 config
      ASoC: Intel: sof_sdw_rt_sdca_jack_common: add rt713 support
      ASoC: Intel: sof_sdw_rt712_sdca: construct cards->components by name_prefix
      ASoC: rt715-sdca: reorder the argument in error log
      ASoC: rt715: reorder the argument in error log

Biju Das (11):
      ASoC: codec: tlv320aic32x4: Add enum aic32x4_type to aic32x4_probe()
      ASoC: tlv320aic32x4-i2c: Simplify probe()
      ASoC: tlv320aic32x4-spi: Simplify probe()
      ASoC: wm8580: Simplify probe()
      ASoC: wm8580: Remove trailing comma in the terminator entry
      ASoC: wm8580: Move OF table
      ASoC: ak4642: Minor cleanups in probe()
      ASoC: ak4642: Simplify probe()
      ASoC: wm8580: Simplify probe()
      ASoC: cs42xx8-i2c: Simplify probe()
      ASoC: tas571x: Simplify probe()

Bragatheswaran Manickavel (2):
      ASoC: dt-bindings: tfa9879: Convert to dtschema
      ASoC: dt-bindings: rt5616: Convert to dtschema

Brent Lu (38):
      ASoC: Intel: sof_rt5682: cleanup unnecessary quirk flag
      ASoC: Intel: ssp-common: support codec detection
      ASoC: Intel: use ACPI HID definition in ssp-common
      ASoC: Intel: sof_rt5682: use ssp-common module to detect codec
      ASoC: Intel: sof_cs42l42: use ssp-common module to detect codec
      ASoC: Intel: sof_ssp_amp: use ssp-common module to detect codec
      ASoC: Intel: sof_nau8825: use ssp-common module to detect codec
      ASoC: Intel: sof_rt5682: add adl_rt5650 board config
      ASoC: Intel: sof_ssp_amp: do not create amp link for nocodec board
      ASoC: Intel: nuvoton-common: support nau8318 amplifier
      ASoC: Intel: sof_nau8825: use nuvoton-common module
      ASoC: Intel: sof_nau8825: use realtek-common module
      ASoC: Intel: sof_da7219: rename driver file and kernel option
      ASoC: Intel: sof_da7219: use maxim-common module
      ASoC: Intel: sof_da7219: add adl_mx98360_da7219 board config
      ASoC: Intel: sof_da7219: use ssp-common module to detect codec
      ASoC: Intel: sof_cs42l42: remove hdac-hdmi support
      ASoC: Intel: sof_da7219: remove hdac-hdmi support
      ASoC: Intel: sof_nau8825: remove hdac-hdmi support
      ASoC: Intel: sof_rt5682: remove hdac-hdmi support
      ASoC: Intel: sof_ssp_amp: remove hdac-hdmi support
      ASoC: Intel: sof_hdmi: add common header for HDMI
      ASoC: Intel: sof_cs42l42: use sof_hdmi_private to init HDMI
      ASoC: Intel: sof_da7219: use sof_hdmi_private to init HDMI
      ASoC: Intel: sof_nau8825: use sof_hdmi_private to init HDMI
      ASoC: Intel: sof_rt5682: use sof_hdmi_private to init HDMI
      ASoC: Intel: sof_sdw: use sof_hdmi_private to init HDMI
      ASoC: Intel: sof_ssp_amp: use sof_hdmi_private to init HDMI
      ASoC: Intel: board_helpers: new module for common functions
      ASoC: Intel: sof_cs42l42: use common module for HDMI link
      ASoC: Intel: sof_nau8825: use common module for HDMI link
      ASoC: Intel: sof_rt5682: use common module for HDMI link
      ASoC: Intel: sof_ssp_amp: use common module for HDMI link
      ASoC: Intel: board_helpers: support dmic link initialization
      ASoC: Intel: sof_cs42l42: use common module for DMIC links
      ASoC: Intel: sof_nau8825: use common module for DMIC links
      ASoC: Intel: sof_rt5682: use common module for DMIC links
      ASoC: Intel: sof_ssp_amp: use common module for DMIC links

Cezary Rojewski (3):
      ASoC: Intel: avs: Move IPC error messages one level down
      ASoC: Intel: avs: Keep module refcount up when gathering traces
      ASoC: Intel: avs: Drop superfluous stream decoupling

Chancel Liu (1):
      ASoC: soc-pcm.c: Make sure DAI parameters cleared if the DAI becomes inactive

Chao Song (1):
      ASoC: Intel: soc-acpi-intel-mtl-match: add acpi match table for cdb35l56-eight-c

Charles Keepax (13):
      ASoC: intel: sof_sdw: Move sdw_pin_index into private struct
      ASoC: intel: sof_sdw: Add simple DAI link creation helper
      ASoC: intel: sof_sdw: Make create_sdw_dailink allocate link components
      ASoC: intel: sof_sdw: Increment be_id in init_dai_link
      ASoC: cs42l43: Lower default type detect time
      ASoC: cs42l43: Enable bias sense by default
      ASoC: cs42l43: Move headset bias sense enable earlier in process
      ASoC: cs42l43: Extend timeout on bias sense timeout
      ASoC: dt-bindings: ASoC: cirrus,cs42l43: Update a couple of default values
      ASoC: intel: sof_sdw: Stop processing CODECs when enough are found
      ASoC: intel: sof_sdw_cs42l43: Some trivial formatting clean ups
      ASoC: intel: sof_sdw_cs42l43: Create separate jacks for hp and mic
      ASoC: intel: sof_sdw: Move the builtin microphones to dataport 1

ChiYuan Huang (4):
      ASoC: dt-bindings: Add Richtek rtq9128 audio amplifier
      ASoC: codecs: Add Richtek rtq9128 audio amplifier support
      ASoC: dt-bindings: rtq9128: Add TDM input source slect property
      ASoC: codecs: rtq9128: Add TDM input source select

Christophe JAILLET (1):
      ASoC: audio-iio-aux: Use flex array to simplify code

Colin Ian King (2):
      ASoC: cs42l43: make const array controls static
      ASoC: tas2781: make const read-only array magic_number static

Cristian Ciocaltea (11):
      ASoC: cs35l41: Handle mdsync_down reg write errors
      ASoC: cs35l41: Handle mdsync_up reg write errors
      ASoC: cs35l41: Initialize completion object before requesting IRQ
      ASoC: cs35l41: Fix broken shared boost activation
      ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
      ASoC: cs35l41: Undo runtime PM changes at driver exit time
      ASoC: cs35l41: Make use of dev_err_probe()
      ASoC: cs35l41: Use modern pm_ops
      ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
      ALSA: hda: cs35l41: Undo runtime PM changes at driver exit time
      ALSA: hda: cs35l41: Consistently use dev_err_probe()

David Rau (1):
      ASoC: da7213: Add new kcontrol for tonegen

Geert Uytterhoeven (1):
      ASoC: sh: dma-sh7760: Use %pad and %zu to format dma_addr_t and size_t

Gustavo A. R. Silva (2):
      ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
      ASoC: sigmadsp: Add __counted_by for struct sigmadsp_data and use struct_size()

Hal Feng (2):
      ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
      ASoC: starfive: Add JH7110 PWM-DAC driver

Hui Wang (1):
      ASoC: fsl-asoc-card: Add comment for mclk in the codec_priv

Jerome Brunet (1):
      ASoC: meson: axg: extend TDM maximum sample rate to 384kHz

Jiapeng Chong (1):
      ASoC: cs42l43: Remove useless else

Joerg Schambacher (2):
      ASoC: Adds support for TAS575x to the pcm512x driver
      ASoC: pcm512x: Adds bindings for TAS575x devices

John Watts (3):
      ASoC: wm8782: Constrain maximum audio rate at runtime
      ASoC: wm8782: Use wlf,fsampen device tree property
      ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen property

Kees Cook (4):
      ASoC: soc-dapm: Annotate struct snd_soc_dapm_widget_list with __counted_by
      MAINTAINERS: Include additional ASoC paths
      MAINTAINERS: Include sof headers under ASoC
      ASoC: apple: mca: Annotate struct mca_data with __counted_by

Konrad Dybcio (2):
      ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
      ASoC: codecs: lpass-tx-macro: Add SM6115 support

Krzysztof Kozlowski (3):
      ASoC: qcom: explicitly include binding headers when used
      ASoC: qcom: reduce number of binding headers includes
      ASoC: codecs: wsa-macro: fix uninitialized stack variables with name prefix

Kuninori Morimoto (61):
      ASoC: rsnd: remove unneeded of_node_put()
      ASoC: da7213: tidyup SND_SOC_DAIFMT_xxx
      ASoC: da7213: add .auto_selectable_formats support
      ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
      ASoC: simple_card_utils.h: convert not to use asoc_xxx()
      ASoC: sh: convert not to use asoc_xxx()
      ASoC: ti: convert not to use asoc_xxx()
      ASoC: arm: convert not to use asoc_xxx()
      ASoC: amd: convert not to use asoc_xxx()
      ASoC: bcm: convert not to use asoc_xxx()
      ASoC: dwc: convert not to use asoc_xxx()
      ASoC: fsl: convert not to use asoc_xxx()
      ASoC: img: convert not to use asoc_xxx()
      ASoC: mxs: convert not to use asoc_xxx()
      ASoC: pxa: convert not to use asoc_xxx()
      ASoC: stm: convert not to use asoc_xxx()
      ASoC: au1x: convert not to use asoc_xxx()
      ASoC: qcom: convert not to use asoc_xxx()
      ASoC: sprd: convert not to use asoc_xxx()
      ASoC: apple: convert not to use asoc_xxx()
      ASoC: atmel: convert not to use asoc_xxx()
      ASoC: meson: convert not to use asoc_xxx()
      ASoC: sunxi: convert not to use asoc_xxx()
      ASoC: tegra: convert not to use asoc_xxx()
      ASoC: ux500: convert not to use asoc_xxx()
      ASoC: google: convert not to use asoc_xxx()
      ASoC: cirrus: convert not to use asoc_xxx()
      ASoC: generic: convert not to use asoc_xxx()
      ASoC: samsung: convert not to use asoc_xxx()
      ASoC: extensa: convert not to use asoc_xxx()
      ASoC: kirkwood: convert not to use asoc_xxx()
      ASoC: loongson: convert not to use asoc_xxx()
      ASoC: rockchip: convert not to use asoc_xxx()
      ASoC: starfive: convert not to use asoc_xxx()
      ASoC: uniphier: convert not to use asoc_xxx()
      ASoC: soundwire: convert not to use asoc_xxx()
      ASoC: intel: avs: convert not to use asoc_xxx()
      ASoC: codec: wm: convert not to use asoc_xxx()
      ASoC: codec: rt5677: convert not to use asoc_xxx()
      ASoC: codec: cs47lxx: convert not to use asoc_xxx()
      ASoC: sof: amd: convert not to use asoc_xxx()
      ASoC: sof: intel: convert not to use asoc_xxx()
      ASoC: sof: mediatek: convert not to use asoc_xxx()
      ASoC: soc-dai: convert not to use asoc_xxx()
      ASoC: soc-pcm: convert not to use asoc_xxx()
      ASoC: soc-core: convert not to use asoc_xxx()
      ASoC: soc-dapm: convert not to use asoc_xxx()
      ASoC: soc-link: convert not to use asoc_xxx()
      ASoC: soc-utils: convert not to use asoc_xxx()
      ASoC: soc-topology: convert not to use asoc_xxx()
      ASoC: soc-compress: convert not to use asoc_xxx()
      ASoC: soc-component: convert not to use asoc_xxx()
      ASoC: soc-generic-dmaengine-pcm: convert not to use asoc_xxx()
      ASoC: amd: convert not to use asoc_xxx()
      ASoC: mediatek: convert not to use asoc_xxx()
      ASoC: starfive: convert not to use asoc_xxx()
      ASoC: intel: convert not to use asoc_xxx()
      ASoC: sof: convert not to use asoc_xxx()
      ASoC: remove asoc_xxx() compatible macro
      sh: boards: Fix Sound Simple-Card struct name
      ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not described

Linus Walleij (31):
      ASoC: max9768: Convert to use GPIO descriptors
      ASoC: max98357a: Drop pointless include
      ASoC: max98373: Convert to use GPIO descriptors
      ASoC: max98388: Correct the includes
      ASoC: max98396: Drop pointless include
      ASoC: max98520: Drop pointless includes
      ASoC: max98927: Drop pointless includes
      ASoC: max9768: Convert to use GPIO descriptors
      ASoC: max98357a: Drop pointless include
      ASoC: max98373: Convert to use GPIO descriptors
      ASoC: max98388: Correct the includes
      ASoC: max98396: Drop pointless include
      ASoC: max98520: Drop pointless includes
      ASoC: max98927: Drop pointless includes
      ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
      ASoC: ti: Convert N810 ASoC to GPIO descriptors
      ASoC: ti: Convert TWL4030 to use GPIO descriptors
      ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      ASoC: ti: osk5912: Drop unused include
      ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      ASoC: rockchip: Drop includes from RK3399
      ASoC: rockchip: Drop includes from Rockchip MAX98090
      ASoC: rockchip: Drop includes from Rockchip RT5645
      gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      ASoC: mt8173-max98090: Drop unused include
      ASoC: mt8173-rt5650-rt5514: Drop unused includes
      ASoC: mt8173-rt5650-rt5676: Drop unused includes
      ASoC: mt8173-rt5650: Drop unused includes
      ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      ASoC: mt8192-afe-gpio: Drop unused include

Luca Weiss (2):
      ASoC: dt-bindings: awinic,aw88395: Remove reset-gpios from AW88261
      ASoC: codecs: aw88261: Remove non-existing reset gpio

Marco Felsch (1):
      ASoC: tlv320aic31xx: switch to gpiod_set_value_cansleep

Marian Postevca (6):
      ASoC: es8316: Enable support for S32 LE format
      ASoC: es8316: Replace NR_SUPPORTED_MCLK_LRCK_RATIOS with ARRAY_SIZE()
      ASoC: es8316: Enable support for MCLK div by 2
      ASoC: amd: acp: Add support for splitting the codec specific code from the ACP driver
      ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
      ASoC: amd: acp: Fix -Wmissing-prototypes warning

Mark Brown (44):
      Add PWM-DAC audio support for StarFive JH7110
      Improve CS35l41-based audio codec drivers
      ASoC: amd: acp: Add sound support for a line of
      Match data improvements for ak4642 driver
      ASoC: mt8188-mt6359: add SOF support
      ASoC: Convert some Maxim codecs to use GPIO
      Match data improvements for tlv320aic32x4 driver
      ASoC: Convert some Maxim codecs to use GPIO
      Match data improvements for wm8580 driver
      ASoC: Update jh7110 PWM DAC for ops move
      SM6115 TX Macro
      ASoC: Merge up fixes
      ASoC: cs35l56: Use PCI SSID to select specific
      ASoC: Intel: machine driver update
      ASoC: cs35l56: Define and export I2C/SPI pm_ops only
      ASoC: SOF: ipc4/Intel: Implement split fw library
      ASoC: intel: sof_sdw: Remove large global CPUs array
      ASoC: SOF: ipc4: Fixup dailink format based on copier
      ASoC: da7213: add .auto_selectable_formats support
      ASoC: SOF: Use generic IPC type identifiers
      ASoC: intel: Add CS42L43 sdw machine driver support
      ASoC: SOF: ipc4-control: Support for Switch and Enum
      ASoC: SOF: ipc4/Intel: Support for firmware exception
      Minor default jack pop performance updates
      ASoC: Add rtq9128 audio amplifier
      ASoC: convert asoc_xxx() to snd_soc_xxx()
      ASoC: Merge up fixes
      ASoC: codecs: rtq9128: Add TDM input source select
      ASoC: codecs: Add aw87390 amplifier driver
      GPIO descriptors for TI ASoC codecs
      Remove reset GPIO for AW88261
      ASoC: cs35l56: Update hibernate/wake sequences and
      ASoC: SOF: ipc4: Take priority into cosideration when
      Convert Rockchip ASoC drivers to GPIO descriptors
      Convert Mediatek ASoC codecs to use GPIO descriptors
      ASoC: DT matching and header cleanups
      ASoC: Merge fixes for consistent cs42l43 schema
      ASoC: mediatek: mt8188-mt6359: add rt5682s support
      Harden SSP boards and add TDM support
      ASoC: Intel: boards: updates for 6.7
      ASoC: codecs: rt715*: update misleading error log
      ASoC: SOF: misc updates for 6.7
      ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
      ASoC: Intel: more machine driver updates for 6.7

Nathan Chancellor (1):
      ASoC: tegra: Fix -Wuninitialized in tegra210_amx_platform_probe()

Peter Ujfalusi (21):
      ASoC: hdac_hdmi: Remove temporary string use in create_fill_jack_kcontrols
      ASoC: SOF: ops.h: Change the error code for not supported to EOPNOTSUPP
      ASoC: SOF: ipc4: Dump the payload also when set_get_data fails
      ASoC: SOF: ipc4: Convert status code 2 and 15 to -EOPNOTSUPP
      ASoC: SOF: Intel: hda: Add definition for SDxFIFOS.FIFOS mask
      ASoC: SOF: ipc4: Add new message type: SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
      ASoC: SOF: Intel: hda-loader: Add support for split library loading
      ASoC: SOF: ipc4-topology: Add definition for generic switch/enum control
      ASoC: SOF: ipc4-control: Add support for ALSA switch control
      ASoC: SOF: ipc4-control: Add support for ALSA enum control
      ASoC: SOF: Introduce generic names for IPC types
      ASoC: SOF: sof-pci-dev: Update the ipc_type module parameter description
      ASoC: SOF: Kconfig: Rename SND_SOC_SOF_INTEL_IPC4 to SND_SOC_SOF_IPC4
      ASoC: SOF: Use generic names for IPC types
      ASoC: SOF: amd: Use generic names for IPC types
      ASoC: SOF: imx: Use generic names for IPC types
      ASoC: SOF: Intel: Use generic names for IPC types
      ASoC: SOF: mediatek: Use generic names for IPC types
      ASoC: SOF: Drop unused IPC type defines
      ASoC: SOF: Intel: hda-dsp: Make sure that no irq handler is pending before suspend
      ASoC: SOF: ipc4: Dump the notification payload

Pierre-Louis Bossart (3):
      ASoC: SOF: sof-client: fix build when only IPC4 is selected
      ASoC: Intel: sof_sdw: update HP Omen match
      ASoC: SOF: make .remove callback return void

Rander Wang (11):
      ASoC: SOF: Xtensa: dump ar registers to restore call stack
      ASoC: SOF: ipc4-mtrace: move debug slot related definitions to header.h
      ASoC: SOF: ipc4: add a helper function to search debug slot
      ASoC: SOF: ipc4: add definition of telemetry slot for exception handling
      ASoC: SOF: ipc4: add exception node in sof debugfs directory
      ASoC: SOF: Intel: add telemetry retrieval support on Intel platforms
      ASoC: SOF: Intel: mtl: dump dsp stack
      ASoC: SOF: Intel: hda: add ipc4 FW panic support on CAVS 2.5+ platforms
      ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification from firmware
      ASoC: SOF: IPC4: get pipeline priority from topology
      ASoC: SOF: IPC4: sort pipeline based on priority

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Checks index of cs35l45_irqs[]

Richard Fitzgerald (8):
      ASoC: soc-card: Add storage for PCI SSID
      ASoC: SOF: Pass PCI SSID to machine driver
      ASoC: Intel: sof_sdw: Copy PCI SSID to struct snd_soc_card
      ASoC: cs35l56: Use PCI SSID as the firmware UID
      ASoC: cs35l56: Use pm_ptr()
      ASoC: cs35l56: Use new export macro for dev_pm_ops
      ASoC: cs35l56: Omit cs35l56_pm_ops_i2c_spi if I2C/SPI not enabled
      ASoC: cs35l56: Enable low-power hibernation mode on SPI

Rob Herring (8):
      ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child node schemas
      ASoC: dt-bindings: Simplify referencing dai-params.yaml
      ASoC: Explicitly include correct DT includes
      ASoC: Drop unnecessary of_match_device() calls
      ASoC: da7218: Use i2c_get_match_data()
      ASoC: qcom/lpass: Constify struct lpass_variant
      ASoC: Use device_get_match_data()
      ASoC: dt-bindings: tas5805m: Disallow undefined properties

Seven Lee (1):
      ASoC: nau8821: Revise MICBIAS control for power saving.

Shenghao Ding (1):
      ASoC: tas2781: fixed compiling issue in m68k

Shuming Fan (1):
      ASoC: rt1015: fix the first word being cut off

Simon Trimmer (5):
      ASoC: cs35l56: Remove unused hibernate wake constants
      ASoC: cs35l56: Initialise a variable to silence possible static analysis error
      ASoC: cs35l56: Change hibernate sequence to use allow auto hibernate
      ASoC: cs35l56: Wake transactions need to be issued twice
      ASoC: cs35l56: Enable low-power hibernation mode on i2c

Takashi Iwai (1):
      ASoC: amd: ps: Fix -Wformat-truncation warning

Terry Cheong (1):
      ASoC: Intel: sof_nau8825: add RPL support for MAX98360A amp

Trevor Wu (3):
      ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
      ASoC: mediatek: common: revise SOF common code
      ASoC: mediatek: mt8188-mt6359: add SOF support

Uday M Bhat (2):
      ASoC: Intel: sof_rt5682: Add support for Rex with discrete BT offload.
      ASoC: Intel: sof_rt5682: Modify number of HDMI to 3 for MTL/Rex devices

Uwe Kleine-König (1):
      ASoC: SOF: Convert to platform remove callback returning void

Vijendar Mukunda (1):
      ASoC: amd: ps: enable wake capability for acp pci driver

Vlad Karpovich (3):
      ASoC: cs35l45: Analog PCM Volume and Amplifier Mode controls
      ASoC: cs35l45: Connect DSP to the monitoring signals
      ASoC: cs35l45: Add AMP Enable Switch control

Weidong Wang (10):
      ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA support
      ASoC: dt-bindings: Add schema for "awinic,aw87390"
      ASoC: codecs: Remove the "fade-enable property"
      ASoC: codecs: Rename "sound-channel" to "awinic,audio-channel"
      ASoC: codecs: Modify the transmission method of parameters
      ASoC: codecs: Modify i2c driver name
      ASoC: codecs: Add code for bin parsing compatible with aw87390
      ASoC: codecs: Rename "sync-flag" to "awinic,sync-flag"
      ASoC: codecs: Modify the transmission mode of function parameters
      ASoC: codecs: Add aw87390 amplifier driver

Wu Zhou (1):
      ASoC: Intel: avs: Disable DSP before loading basefw

Yong Zhi (1):
      ASoC: SOF: ipc4-topology: Add deep buffer size to debug prints

xiazhengqiao (4):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
      ASoC: mediatek: mt8188-mt6359: add rt5682s support
      ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
      ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support

 .../bindings/sound/audio-graph-port.yaml           |  20 +-
 .../devicetree/bindings/sound/audio-graph.yaml     |   9 +-
 .../devicetree/bindings/sound/awinic,aw87390.yaml  |  58 ++
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |  32 +-
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |   4 +-
 .../devicetree/bindings/sound/dai-params.yaml      |  11 +-
 .../devicetree/bindings/sound/dialog,da7219.yaml   |   1 +
 .../devicetree/bindings/sound/fsl,qmc-audio.yaml   |   1 +
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   1 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |   1 +
 .../devicetree/bindings/sound/nxp,tfa9879.yaml     |  44 ++
 .../devicetree/bindings/sound/pcm512x.txt          |   9 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  18 +
 .../devicetree/bindings/sound/realtek,rt5616.yaml  |  49 ++
 .../devicetree/bindings/sound/richtek,rtq9128.yaml |  61 ++
 Documentation/devicetree/bindings/sound/rt5616.txt |  32 -
 .../bindings/sound/starfive,jh7110-pwmdac.yaml     |  76 ++
 .../devicetree/bindings/sound/tas5805m.yaml        |   5 +-
 .../devicetree/bindings/sound/tfa9879.txt          |  23 -
 .../devicetree/bindings/sound/ti,pcm3168a.yaml     |   1 +
 Documentation/devicetree/bindings/sound/wm8782.txt |   7 +
 Documentation/sound/soc/codec-to-codec.rst         |   8 +-
 Documentation/sound/soc/dpcm.rst                   |   3 +-
 MAINTAINERS                                        |  13 +-
 arch/arm/mach-omap2/board-n8x0.c                   |  10 +
 arch/arm/mach-omap2/pdata-quirks.c                 |  10 +
 arch/sh/boards/mach-ecovec24/setup.c               |   2 +-
 arch/sh/boards/mach-se/7724/setup.c                |   2 +-
 drivers/gpio/gpiolib-of.c                          |   4 +
 drivers/soundwire/intel.c                          |   2 +-
 drivers/soundwire/intel_ace2x.c                    |   2 +-
 drivers/soundwire/stream.c                         |   2 +-
 include/linux/platform_data/omap-twl4030.h         |   3 -
 include/sound/cs35l41.h                            |   4 +-
 include/sound/cs35l56.h                            |   3 +-
 include/sound/graph_card.h                         |  16 +-
 include/sound/max9768.h                            |   4 -
 include/sound/simple_card.h                        |   6 +-
 include/sound/simple_card_utils.h                  | 106 +--
 include/sound/soc-acpi-intel-match.h               |   2 +
 include/sound/soc-acpi.h                           |   7 +
 include/sound/soc-card.h                           |  41 +-
 include/sound/soc-dapm.h                           |   2 +-
 include/sound/soc.h                                |  47 +-
 include/sound/sof.h                                |  12 +-
 include/sound/sof/ipc4/header.h                    |  32 +-
 include/sound/tas2781-dsp.h                        |   5 +
 sound/arm/pxa2xx-pcm-lib.c                         |   8 +-
 sound/pci/hda/cs35l41_hda.c                        |  23 +-
 sound/soc/amd/acp-config.c                         |  70 ++
 sound/soc/amd/acp-da7219-max98357a.c               |  28 +-
 sound/soc/amd/acp-es8336.c                         |   6 +-
 sound/soc/amd/acp-pcm-dma.c                        |   2 +-
 sound/soc/amd/acp-rt5645.c                         |   6 +-
 sound/soc/amd/acp/Makefile                         |   2 +-
 sound/soc/amd/acp/acp-legacy-common.c              |   8 +-
 sound/soc/amd/acp/acp-legacy-mach.c                | 102 ++-
 sound/soc/amd/acp/acp-mach-common.c                |  62 +-
 sound/soc/amd/acp/acp-mach.h                       |  67 ++
 sound/soc/amd/acp/acp-renoir.c                     |   4 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      | 444 ++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h      |  12 +
 sound/soc/amd/acp3x-rt5682-max9836.c               |  12 +-
 sound/soc/amd/ps/pci-ps.c                          |   3 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |   2 +-
 sound/soc/amd/raven/acp3x-i2s.c                    |   2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   6 +-
 sound/soc/amd/vangogh/acp5x-i2s.c                  |   2 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 |  12 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |   6 +-
 sound/soc/apple/mca.c                              |  28 +-
 sound/soc/atmel/atmel-classd.c                     |  10 +-
 sound/soc/atmel/atmel-pcm-dma.c                    |   8 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |   4 +-
 sound/soc/atmel/atmel-pdmic.c                      |  12 +-
 sound/soc/atmel/atmel_wm8904.c                     |   5 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   2 +-
 sound/soc/atmel/mikroe-proto.c                     |   2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |   2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |   2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |   1 -
 sound/soc/au1x/db1200.c                            |   4 +-
 sound/soc/au1x/dbdma2.c                            |   4 +-
 sound/soc/au1x/dma.c                               |   4 +-
 sound/soc/au1x/psc-ac97.c                          |   2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  28 +-
 sound/soc/bcm/cygnus-pcm.c                         |  24 +-
 sound/soc/bcm/cygnus-ssp.c                         |   2 +-
 sound/soc/cirrus/edb93xx.c                         |   6 +-
 sound/soc/codecs/Kconfig                           |  30 +-
 sound/soc/codecs/Makefile                          |   4 +
 sound/soc/codecs/adau1701.c                        |   1 -
 sound/soc/codecs/adau1977-spi.c                    |   1 -
 sound/soc/codecs/ak4104.c                          |   2 +-
 sound/soc/codecs/ak4118.c                          |   2 +-
 sound/soc/codecs/ak4375.c                          |   2 +-
 sound/soc/codecs/ak4458.c                          |   2 +-
 sound/soc/codecs/ak4613.c                          |   2 +-
 sound/soc/codecs/ak4642.c                          |  30 +-
 sound/soc/codecs/ak5386.c                          |   7 +-
 sound/soc/codecs/ak5558.c                          |   2 +-
 sound/soc/codecs/audio-iio-aux.c                   |  17 +-
 sound/soc/codecs/aw87390.c                         | 463 ++++++++++++
 sound/soc/codecs/aw87390.h                         |  85 +++
 sound/soc/codecs/aw88261.c                         |  42 +-
 sound/soc/codecs/aw88261.h                         |   4 +-
 sound/soc/codecs/aw88395/aw88395.c                 |   9 +-
 sound/soc/codecs/aw88395/aw88395.h                 |   2 +-
 sound/soc/codecs/aw88395/aw88395_device.c          |  47 +-
 sound/soc/codecs/aw88395/aw88395_device.h          |   6 +-
 sound/soc/codecs/aw88395/aw88395_lib.c             |  25 +-
 sound/soc/codecs/aw88395/aw88395_reg.h             |   1 +
 sound/soc/codecs/cs35l32.c                         |   2 +-
 sound/soc/codecs/cs35l33.c                         |   2 -
 sound/soc/codecs/cs35l34.c                         |   2 +-
 sound/soc/codecs/cs35l35.c                         |   3 +-
 sound/soc/codecs/cs35l36.c                         |   3 +-
 sound/soc/codecs/cs35l41-i2c.c                     |  13 +-
 sound/soc/codecs/cs35l41-lib.c                     |  60 +-
 sound/soc/codecs/cs35l41-spi.c                     |  11 +-
 sound/soc/codecs/cs35l41.c                         |  94 +--
 sound/soc/codecs/cs35l41.h                         |   1 -
 sound/soc/codecs/cs35l45-tables.c                  |   3 +
 sound/soc/codecs/cs35l45.c                         | 193 ++++-
 sound/soc/codecs/cs35l45.h                         |  36 +-
 sound/soc/codecs/cs35l56-i2c.c                     |   3 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   2 +-
 sound/soc/codecs/cs35l56-shared.c                  |  68 +-
 sound/soc/codecs/cs35l56-spi.c                     |   3 +-
 sound/soc/codecs/cs35l56.c                         |  16 +-
 sound/soc/codecs/cs4270.c                          |   2 +-
 sound/soc/codecs/cs4271.c                          |  22 +-
 sound/soc/codecs/cs42l42.c                         |   1 -
 sound/soc/codecs/cs42l43-jack.c                    |  38 +-
 sound/soc/codecs/cs42l43-sdw.c                     |   6 +-
 sound/soc/codecs/cs42l43.c                         |   2 +-
 sound/soc/codecs/cs42l56.c                         |   2 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |  16 +-
 sound/soc/codecs/cs43130.c                         |   3 +-
 sound/soc/codecs/cs4349.c                          |   2 +-
 sound/soc/codecs/cs47l15.c                         |   4 +-
 sound/soc/codecs/cs47l24.c                         |   6 +-
 sound/soc/codecs/cs47l35.c                         |   6 +-
 sound/soc/codecs/cs47l85.c                         |   6 +-
 sound/soc/codecs/cs47l90.c                         |   6 +-
 sound/soc/codecs/cs47l92.c                         |   4 +-
 sound/soc/codecs/da7213.c                          | 203 +++++-
 sound/soc/codecs/da7213.h                          |  64 +-
 sound/soc/codecs/da7218.c                          |  29 +-
 sound/soc/codecs/da7218.h                          |   2 +-
 sound/soc/codecs/da7219.c                          |   2 +-
 sound/soc/codecs/da9055.c                          |   1 -
 sound/soc/codecs/es8316.c                          |  52 +-
 sound/soc/codecs/es8316.h                          |   3 +
 sound/soc/codecs/es8328.c                          |   1 -
 sound/soc/codecs/gtm601.c                          |   2 +-
 sound/soc/codecs/hdac_hda.c                        |  29 +
 sound/soc/codecs/hdac_hda.h                        |   1 +
 sound/soc/codecs/hdac_hdmi.c                       |  13 +-
 sound/soc/codecs/lpass-macro-common.c              |   2 +-
 sound/soc/codecs/lpass-macro-common.h              |   2 +
 sound/soc/codecs/lpass-tx-macro.c                  |  22 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   3 +
 sound/soc/codecs/max9768.c                         |  45 +-
 sound/soc/codecs/max98357a.c                       |   1 -
 sound/soc/codecs/max98373-i2c.c                    |  17 -
 sound/soc/codecs/max98373.c                        |  35 +-
 sound/soc/codecs/max98373.h                        |   2 +-
 sound/soc/codecs/max98388.c                        |   3 +-
 sound/soc/codecs/max98396.c                        |   1 -
 sound/soc/codecs/max98520.c                        |   2 -
 sound/soc/codecs/max98927.c                        |   2 -
 sound/soc/codecs/mt6351.c                          |   2 +-
 sound/soc/codecs/mt6358.c                          |   2 +-
 sound/soc/codecs/mt6359-accdet.c                   |   4 -
 sound/soc/codecs/mt6359.c                          |   2 +-
 sound/soc/codecs/nau8540.c                         |   2 +-
 sound/soc/codecs/nau8821.c                         |   3 +
 sound/soc/codecs/pcm1681.c                         |   2 -
 sound/soc/codecs/pcm512x-i2c.c                     |   4 +
 sound/soc/codecs/pcm512x.c                         |  36 +-
 sound/soc/codecs/rt1015.c                          |  13 +
 sound/soc/codecs/rt5677-spi.c                      |   4 +-
 sound/soc/codecs/rt715-sdca.c                      |   4 +-
 sound/soc/codecs/rt715.c                           |   6 +-
 sound/soc/codecs/rtq9128.c                         | 780 +++++++++++++++++++++
 sound/soc/codecs/sgtl5000.c                        |   2 +-
 sound/soc/codecs/sigmadsp.c                        |   7 +-
 sound/soc/codecs/sma1303.c                         |   2 +-
 sound/soc/codecs/sta32x.c                          |   3 +-
 sound/soc/codecs/sta350.c                          |   3 +-
 sound/soc/codecs/tas2781-fmwlib.c                  | 236 +++----
 sound/soc/codecs/tas5086.c                         |   6 +-
 sound/soc/codecs/tas571x.c                         |  15 +-
 sound/soc/codecs/tlv320aic31xx.c                   |   6 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |  19 +-
 sound/soc/codecs/tlv320aic32x4-spi.c               |  18 +-
 sound/soc/codecs/tlv320aic32x4.c                   |   5 +-
 sound/soc/codecs/tlv320aic32x4.h                   |   3 +-
 sound/soc/codecs/uda1334.c                         |   2 +-
 sound/soc/codecs/wm5110.c                          |   6 +-
 sound/soc/codecs/wm8510.c                          |   2 +-
 sound/soc/codecs/wm8523.c                          |   2 +-
 sound/soc/codecs/wm8524.c                          |   2 +-
 sound/soc/codecs/wm8580.c                          |  28 +-
 sound/soc/codecs/wm8711.c                          |   2 +-
 sound/soc/codecs/wm8728.c                          |   2 +-
 sound/soc/codecs/wm8731-i2c.c                      |   2 +-
 sound/soc/codecs/wm8731-spi.c                      |   2 +-
 sound/soc/codecs/wm8737.c                          |   2 +-
 sound/soc/codecs/wm8741.c                          |   2 +-
 sound/soc/codecs/wm8750.c                          |   2 +-
 sound/soc/codecs/wm8753.c                          |   2 +-
 sound/soc/codecs/wm8770.c                          |   2 +-
 sound/soc/codecs/wm8776.c                          |   2 +-
 sound/soc/codecs/wm8782.c                          |  63 +-
 sound/soc/codecs/wm8804.c                          |   1 -
 sound/soc/codecs/wm_adsp.c                         |  10 +-
 sound/soc/dwc/dwc-i2s.c                            |   2 +-
 sound/soc/dwc/dwc-pcm.c                            |   4 +-
 sound/soc/fsl/efika-audio-fabric.c                 |   4 +-
 sound/soc/fsl/eukrea-tlv320.c                      |   6 +-
 sound/soc/fsl/fsl-asoc-card.c                      |  29 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |  10 +-
 sound/soc/fsl/fsl_aud2htx.c                        |   3 +-
 sound/soc/fsl/fsl_dma.c                            |   2 +-
 sound/soc/fsl/fsl_mqs.c                            |   2 +-
 sound/soc/fsl/fsl_rpmsg.c                          |   3 +-
 sound/soc/fsl/fsl_sai.c                            |   3 +-
 sound/soc/fsl/fsl_spdif.c                          |  24 +-
 sound/soc/fsl/fsl_ssi.c                            |  16 +-
 sound/soc/fsl/imx-audmix.c                         |  18 +-
 sound/soc/fsl/imx-audmux.c                         |   1 -
 sound/soc/fsl/imx-card.c                           |   9 +-
 sound/soc/fsl/imx-hdmi.c                           |   4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  14 +-
 sound/soc/fsl/imx-rpmsg.c                          |   7 +-
 sound/soc/fsl/imx-sgtl5000.c                       |   2 +-
 sound/soc/fsl/imx-spdif.c                          |   2 +-
 sound/soc/fsl/mpc5200_dma.c                        |  25 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |   3 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |   7 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   8 +-
 sound/soc/fsl/p1022_ds.c                           |   8 +-
 sound/soc/fsl/p1022_rdk.c                          |   8 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |   3 +-
 sound/soc/generic/audio-graph-card.c               | 116 ++-
 .../soc/generic/audio-graph-card2-custom-sample.c  |  32 +-
 sound/soc/generic/audio-graph-card2.c              | 110 ++-
 sound/soc/generic/simple-card-utils.c              | 219 +++---
 sound/soc/generic/simple-card.c                    | 149 ++--
 sound/soc/generic/test-component.c                 |   4 +-
 sound/soc/google/chv3-i2s.c                        |  22 +-
 sound/soc/img/img-i2s-in.c                         |   2 +-
 sound/soc/img/img-i2s-out.c                        |   2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |  12 +-
 sound/soc/intel/avs/avs.h                          |  38 +-
 sound/soc/intel/avs/board_selection.c              |   2 +-
 sound/soc/intel/avs/boards/da7219.c                |  21 +-
 sound/soc/intel/avs/boards/es8336.c                |  26 +-
 sound/soc/intel/avs/boards/i2s_test.c              |  57 +-
 sound/soc/intel/avs/boards/max98357a.c             |  18 +-
 sound/soc/intel/avs/boards/max98373.c              |  20 +-
 sound/soc/intel/avs/boards/max98927.c              |  20 +-
 sound/soc/intel/avs/boards/nau8825.c               |  26 +-
 sound/soc/intel/avs/boards/rt274.c                 |  22 +-
 sound/soc/intel/avs/boards/rt286.c                 |  27 +-
 sound/soc/intel/avs/boards/rt298.c                 |  26 +-
 sound/soc/intel/avs/boards/rt5663.c                |  26 +-
 sound/soc/intel/avs/boards/rt5682.c                |  26 +-
 sound/soc/intel/avs/boards/ssm4567.c               |  22 +-
 sound/soc/intel/avs/cldma.h                        |   4 +-
 sound/soc/intel/avs/core.c                         |   5 +
 sound/soc/intel/avs/debugfs.c                      |   4 +
 sound/soc/intel/avs/ipc.c                          |  52 +-
 sound/soc/intel/avs/loader.c                       |   4 +
 sound/soc/intel/avs/messages.c                     | 112 +--
 sound/soc/intel/avs/messages.h                     |   4 +-
 sound/soc/intel/avs/path.c                         |  31 +-
 sound/soc/intel/avs/pcm.c                          |  76 +-
 sound/soc/intel/avs/registers.h                    |   4 +-
 sound/soc/intel/avs/topology.c                     | 102 ++-
 sound/soc/intel/avs/utils.h                        |  65 ++
 sound/soc/intel/boards/Kconfig                     |  39 +-
 sound/soc/intel/boards/Makefile                    |  16 +-
 sound/soc/intel/boards/bdw-rt5650.c                |   6 +-
 sound/soc/intel/boards/bdw-rt5677.c                |  10 +-
 sound/soc/intel/boards/bdw_rt286.c                 |   8 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   8 +-
 sound/soc/intel/boards/bxt_rt298.c                 |  10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |  10 +-
 sound/soc/intel/boards/bytcht_da7213.c             |  12 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   8 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |   4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  10 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |  10 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   8 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |   8 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |  16 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |  10 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |  12 +-
 sound/soc/intel/boards/ehl_rt5660.c                |   8 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |  12 +-
 sound/soc/intel/boards/hsw_rt5640.c                |   4 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |   8 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |  10 +-
 sound/soc/intel/boards/kbl_rt5660.c                |   8 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |  12 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  12 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |   4 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  14 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  18 +-
 sound/soc/intel/boards/skl_rt286.c                 |  10 +-
 sound/soc/intel/boards/sof_board_helpers.c         | 204 ++++++
 sound/soc/intel/boards/sof_board_helpers.h         |  64 ++
 sound/soc/intel/boards/sof_cirrus_common.c         |   2 +-
 sound/soc/intel/boards/sof_cirrus_common.h         |   9 +-
 sound/soc/intel/boards/sof_cs42l42.c               | 354 +++-------
 .../boards/{sof_da7219_max98373.c => sof_da7219.c} | 409 ++++++-----
 sound/soc/intel/boards/sof_es8336.c                |  14 +-
 sound/soc/intel/boards/sof_hdmi_common.h           |  24 +
 sound/soc/intel/boards/sof_maxim_common.c          |   8 +-
 sound/soc/intel/boards/sof_maxim_common.h          |  13 +-
 sound/soc/intel/boards/sof_nau8825.c               | 373 +++-------
 sound/soc/intel/boards/sof_nuvoton_common.c        |  73 ++
 sound/soc/intel/boards/sof_nuvoton_common.h        |  22 +
 sound/soc/intel/boards/sof_pcm512x.c               |  14 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   8 +-
 sound/soc/intel/boards/sof_realtek_common.h        |  37 +-
 sound/soc/intel/boards/sof_rt5682.c                | 730 ++++++++-----------
 sound/soc/intel/boards/sof_sdw.c                   | 307 ++++----
 sound/soc/intel/boards/sof_sdw_common.h            |  21 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c           |   2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c           | 156 +++++
 sound/soc/intel/boards/sof_sdw_hdmi.c              |  32 +-
 sound/soc/intel/boards/sof_sdw_maxim.c             |   4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c            |   2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c             |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c             |   2 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c        |   6 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c            |   4 +-
 .../soc/intel/boards/sof_sdw_rt_sdca_jack_common.c |  10 +-
 sound/soc/intel/boards/sof_ssp_amp.c               | 339 ++++-----
 sound/soc/intel/boards/sof_ssp_common.c            | 101 +++
 sound/soc/intel/boards/sof_ssp_common.h            |  71 ++
 sound/soc/intel/boards/sof_wm8804.c                |   4 +-
 sound/soc/intel/catpt/pcm.c                        |  12 +-
 sound/soc/intel/common/Makefile                    |   1 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |  19 +
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  51 ++
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |  12 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 150 ++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |  39 ++
 sound/soc/intel/keembay/kmb_platform.c             |  17 +-
 sound/soc/intel/skylake/skl-pcm.c                  |  18 +-
 sound/soc/intel/skylake/skl.c                      |   1 +
 sound/soc/kirkwood/armada-370-db.c                 |   4 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |   2 +-
 sound/soc/loongson/loongson_card.c                 |   4 +-
 sound/soc/loongson/loongson_dma.c                  |   4 +-
 sound/soc/mediatek/Kconfig                         |   2 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |  22 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |   4 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     | 113 ++-
 sound/soc/mediatek/common/mtk-dsp-sof-common.h     |   8 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   6 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |  60 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |   6 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |   6 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   4 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |   7 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   6 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   8 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |  10 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   6 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  16 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  20 +-
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |   1 -
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |  12 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c   |   2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |  16 +-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  59 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |   8 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          | 383 +++++++++-
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |   1 -
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |   6 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  24 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |  10 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  28 +-
 sound/soc/meson/aiu-fifo.c                         |   2 +-
 sound/soc/meson/axg-card.c                         |  12 +-
 sound/soc/meson/axg-fifo.c                         |   4 +-
 sound/soc/meson/axg-fifo.h                         |   2 +-
 sound/soc/meson/axg-tdm.h                          |   2 +-
 sound/soc/meson/gx-card.c                          |   2 +-
 sound/soc/meson/meson-card-utils.c                 |   6 +-
 sound/soc/meson/meson-codec-glue.c                 |   2 +-
 sound/soc/mxs/mxs-saif.c                           |   1 -
 sound/soc/mxs/mxs-sgtl5000.c                       |   7 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   4 +-
 sound/soc/pxa/spitz.c                              |   8 +-
 sound/soc/qcom/apq8016_sbc.c                       |   9 +-
 sound/soc/qcom/apq8096.c                           |  10 +-
 sound/soc/qcom/common.c                            |   8 +-
 sound/soc/qcom/lpass-apq8016.c                     |   6 +-
 sound/soc/qcom/lpass-cdc-dma.c                     |  19 +-
 sound/soc/qcom/lpass-cpu.c                         |  44 +-
 sound/soc/qcom/lpass-ipq806x.c                     |   2 +-
 sound/soc/qcom/lpass-platform.c                    |  87 +--
 sound/soc/qcom/lpass-sc7180.c                      |   6 +-
 sound/soc/qcom/lpass-sc7280.c                      |   6 +-
 sound/soc/qcom/lpass.h                             |   2 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c                |   1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   1 +
 sound/soc/qcom/qdsp6/q6afe.c                       |   1 +
 sound/soc/qcom/qdsp6/q6afe.h                       |   2 -
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   6 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |   1 +
 sound/soc/qcom/qdsp6/q6apm.h                       |   1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  13 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   1 +
 sound/soc/qcom/qdsp6/q6asm.h                       |   1 -
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |   1 -
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   2 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |   9 +-
 sound/soc/qcom/sc7180.c                            |  21 +-
 sound/soc/qcom/sc7280.c                            |  30 +-
 sound/soc/qcom/sc8280xp.c                          |  10 +-
 sound/soc/qcom/sdm845.c                            |  38 +-
 sound/soc/qcom/sdw.c                               |   8 +-
 sound/soc/qcom/sm8250.c                            |  12 +-
 sound/soc/qcom/storm.c                             |   4 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |  52 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |  28 +-
 sound/soc/rockchip/rockchip_i2s.c                  |  10 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  24 +-
 sound/soc/rockchip/rockchip_max98090.c             |  12 +-
 sound/soc/rockchip/rockchip_pdm.c                  |   7 +-
 sound/soc/rockchip/rockchip_rt5645.c               |  10 +-
 sound/soc/samsung/aries_wm8994.c                   |  13 +-
 sound/soc/samsung/arndale.c                        |  12 +-
 sound/soc/samsung/bells.c                          |  16 +-
 sound/soc/samsung/i2s.c                            |  14 +-
 sound/soc/samsung/littlemill.c                     |  16 +-
 sound/soc/samsung/lowland.c                        |   4 +-
 sound/soc/samsung/midas_wm1811.c                   |  12 +-
 sound/soc/samsung/odroid.c                         |   9 +-
 sound/soc/samsung/pcm.c                            |   8 +-
 sound/soc/samsung/smdk_spdif.c                     |   4 +-
 sound/soc/samsung/smdk_wm8994.c                    |  32 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |   6 +-
 sound/soc/samsung/snow.c                           |   5 +-
 sound/soc/samsung/spdif.c                          |  14 +-
 sound/soc/samsung/speyside.c                       |   8 +-
 sound/soc/samsung/tm2_wm5110.c                     |  24 +-
 sound/soc/samsung/tobermory.c                      |   8 +-
 sound/soc/sh/dma-sh7760.c                          |  34 +-
 sound/soc/sh/fsi.c                                 |   5 +-
 sound/soc/sh/migor.c                               |  10 +-
 sound/soc/sh/rcar/core.c                           |   8 +-
 sound/soc/sh/rcar/rsnd.h                           |   4 +-
 sound/soc/sh/rcar/src.c                            |   1 +
 sound/soc/sh/rcar/ssi.c                            |   2 +
 sound/soc/sh/rz-ssi.c                              |   5 +-
 sound/soc/soc-component.c                          |  24 +-
 sound/soc/soc-compress.c                           |  36 +-
 sound/soc/soc-core.c                               |  20 +-
 sound/soc/soc-dai.c                                |   8 +-
 sound/soc/soc-dapm.c                               |  14 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |  10 +-
 sound/soc/soc-link.c                               |  14 +-
 sound/soc/soc-pcm.c                                | 111 +--
 sound/soc/soc-topology.c                           |   6 +-
 sound/soc/soc-utils.c                              |   6 +-
 sound/soc/sof/Kconfig                              |   2 +-
 sound/soc/sof/Makefile                             |   6 +-
 sound/soc/sof/amd/acp-pcm.c                        |   2 +-
 sound/soc/sof/amd/acp.c                            |   4 +-
 sound/soc/sof/amd/acp.h                            |   2 +-
 sound/soc/sof/amd/pci-rmb.c                        |  10 +-
 sound/soc/sof/amd/pci-rn.c                         |  10 +-
 sound/soc/sof/amd/pci-vangogh.c                    |  10 +-
 sound/soc/sof/imx/imx8.c                           |  26 +-
 sound/soc/sof/imx/imx8m.c                          |  16 +-
 sound/soc/sof/imx/imx8ulp.c                        |  16 +-
 sound/soc/sof/intel/Kconfig                        |  14 +-
 sound/soc/sof/intel/Makefile                       |   3 +-
 sound/soc/sof/intel/apl.c                          |   4 +-
 sound/soc/sof/intel/bdw.c                          |  12 +-
 sound/soc/sof/intel/byt.c                          |  36 +-
 sound/soc/sof/intel/cnl.c                          |   4 +-
 sound/soc/sof/intel/hda-codec.c                    |   1 +
 sound/soc/sof/intel/hda-dai-ops.c                  |  26 +-
 sound/soc/sof/intel/hda-dai.c                      |  12 +-
 sound/soc/sof/intel/hda-dsp.c                      |   3 +
 sound/soc/sof/intel/hda-loader.c                   |  44 +-
 sound/soc/sof/intel/hda-pcm.c                      |   4 +-
 sound/soc/sof/intel/hda-stream.c                   |   4 +-
 sound/soc/sof/intel/hda.c                          |  20 +-
 sound/soc/sof/intel/hda.h                          |   6 +-
 sound/soc/sof/intel/icl.c                          |   4 +-
 sound/soc/sof/intel/mtl.c                          |   3 +
 sound/soc/sof/intel/pci-apl.c                      |  36 +-
 sound/soc/sof/intel/pci-cnl.c                      |  54 +-
 sound/soc/sof/intel/pci-icl.c                      |  36 +-
 sound/soc/sof/intel/pci-lnl.c                      |  10 +-
 sound/soc/sof/intel/pci-mtl.c                      |  43 +-
 sound/soc/sof/intel/pci-skl.c                      |  20 +-
 sound/soc/sof/intel/pci-tgl.c                      | 144 ++--
 sound/soc/sof/intel/pci-tng.c                      |  10 +-
 sound/soc/sof/intel/telemetry.c                    |  95 +++
 sound/soc/sof/intel/telemetry.h                    |  35 +
 sound/soc/sof/intel/tgl.c                          |   5 +-
 sound/soc/sof/ipc.c                                |   6 +-
 sound/soc/sof/ipc3-dtrace.c                        |   2 +-
 sound/soc/sof/ipc3-pcm.c                           |   6 +-
 sound/soc/sof/ipc4-control.c                       | 175 ++++-
 sound/soc/sof/ipc4-mtrace.c                        |  34 +-
 sound/soc/sof/ipc4-pcm.c                           | 118 +++-
 sound/soc/sof/ipc4-priv.h                          |   3 +
 sound/soc/sof/ipc4-telemetry.c                     |  95 +++
 sound/soc/sof/ipc4-telemetry.h                     |  73 ++
 sound/soc/sof/ipc4-topology.c                      |  76 +-
 sound/soc/sof/ipc4-topology.h                      |  22 +-
 sound/soc/sof/ipc4.c                               |  40 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  28 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  18 +-
 sound/soc/sof/nocodec.c                            |   2 +-
 sound/soc/sof/ops.h                                |  10 +-
 sound/soc/sof/pcm.c                                |  18 +-
 sound/soc/sof/sof-acpi-dev.c                       |  12 +-
 sound/soc/sof/sof-acpi-dev.h                       |   2 +-
 sound/soc/sof/sof-audio.c                          |   7 +
 sound/soc/sof/sof-client-ipc-msg-injector.c        |   4 +-
 sound/soc/sof/sof-client-probes.c                  |   6 +-
 sound/soc/sof/sof-client.c                         |  27 +-
 sound/soc/sof/sof-of-dev.c                         |  10 +-
 sound/soc/sof/sof-of-dev.h                         |   2 +-
 sound/soc/sof/sof-pci-dev.c                        |  10 +-
 sound/soc/sof/sof-priv.h                           |   2 +-
 sound/soc/sof/xtensa/core.c                        |  11 +
 sound/soc/sprd/sprd-pcm-compress.c                 |   4 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |   4 +-
 sound/soc/starfive/Kconfig                         |   9 +
 sound/soc/starfive/Makefile                        |   1 +
 sound/soc/starfive/jh7110_pwmdac.c                 | 529 ++++++++++++++
 sound/soc/starfive/jh7110_tdm.c                    |   2 +-
 sound/soc/stm/stm32_adfsdm.c                       |  24 +-
 sound/soc/stm/stm32_i2s.c                          |   7 +-
 sound/soc/stm/stm32_sai.c                          |   8 +-
 sound/soc/stm/stm32_sai_sub.c                      |  10 +-
 sound/soc/stm/stm32_spdifrx.c                      |   8 +-
 sound/soc/sunxi/sun4i-codec.c                      |  16 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   2 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   7 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |   3 +-
 sound/soc/sunxi/sun50i-dmic.c                      |   4 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |   1 -
 sound/soc/sunxi/sun8i-codec.c                      |   2 +-
 sound/soc/tegra/tegra186_asrc.c                    |   3 +-
 sound/soc/tegra/tegra186_dspk.c                    |   2 +-
 sound/soc/tegra/tegra20_spdif.c                    |   2 +-
 sound/soc/tegra/tegra210_adx.c                     |   3 +-
 sound/soc/tegra/tegra210_amx.c                     |  13 +-
 sound/soc/tegra/tegra210_dmic.c                    |   2 +-
 sound/soc/tegra/tegra210_i2s.c                     |   2 +-
 sound/soc/tegra/tegra210_mixer.c                   |   3 +-
 sound/soc/tegra/tegra210_mvc.c                     |   3 +-
 sound/soc/tegra/tegra210_ope.c                     |   3 +-
 sound/soc/tegra/tegra210_peq.c                     |   1 -
 sound/soc/tegra/tegra210_sfc.c                     |   1 -
 sound/soc/tegra/tegra30_i2s.c                      |   1 -
 sound/soc/tegra/tegra_asoc_machine.c               |   3 +-
 sound/soc/tegra/tegra_audio_graph_card.c           |  24 +-
 sound/soc/tegra/tegra_pcm.c                        |   4 +-
 sound/soc/tegra/tegra_wm8903.c                     |   4 +-
 sound/soc/ti/ams-delta.c                           |   4 +-
 sound/soc/ti/davinci-evm.c                         |  17 +-
 sound/soc/ti/davinci-mcasp.c                       |   9 +-
 sound/soc/ti/j721e-evm.c                           |  12 +-
 sound/soc/ti/n810.c                                |  37 +-
 sound/soc/ti/omap-abe-twl6040.c                    |  10 +-
 sound/soc/ti/omap-dmic.c                           |   2 +-
 sound/soc/ti/omap-hdmi.c                           |   2 +-
 sound/soc/ti/omap-mcbsp-st.c                       |   2 +-
 sound/soc/ti/omap-mcbsp.c                          |  18 +-
 sound/soc/ti/omap-mcpdm.c                          |   4 +-
 sound/soc/ti/omap-twl4030.c                        |  22 +-
 sound/soc/ti/omap3pandora.c                        |  69 +-
 sound/soc/ti/osk5912.c                             |   5 +-
 sound/soc/ti/rx51.c                                |  25 +-
 sound/soc/uniphier/aio-compress.c                  |  22 +-
 sound/soc/uniphier/aio-dma.c                       |  12 +-
 sound/soc/ux500/mop500_ab8500.c                    |  14 +-
 sound/soc/ux500/ux500_pcm.c                        |   4 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   4 +-
 597 files changed, 10333 insertions(+), 5183 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tfa9879.txt
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h
 create mode 100644 sound/soc/codecs/aw87390.c
 create mode 100644 sound/soc/codecs/aw87390.h
 create mode 100644 sound/soc/codecs/rtq9128.c
 create mode 100644 sound/soc/intel/avs/utils.h
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.c
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.h
 rename sound/soc/intel/boards/{sof_da7219_max98373.c => sof_da7219.c} (51%)
 create mode 100644 sound/soc/intel/boards/sof_hdmi_common.h
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.c
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.h
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs42l43.c
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.c
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.h
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-arl-match.c
 create mode 100644 sound/soc/sof/intel/telemetry.c
 create mode 100644 sound/soc/sof/intel/telemetry.h
 create mode 100644 sound/soc/sof/ipc4-telemetry.c
 create mode 100644 sound/soc/sof/ipc4-telemetry.h
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c
