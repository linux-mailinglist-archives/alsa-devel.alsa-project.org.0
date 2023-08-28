Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC078AA08
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 12:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C01D7F1;
	Mon, 28 Aug 2023 12:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C01D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693217928;
	bh=OYxRDe+mEOOEHQSZAwkDSOjrlyPclwtmIeVRxWs9lb0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HJphM8kwVY6E64qmBqJhGmrov1WZ1EMYjYkrPUiHbTEKHHc2ECs/raZeH73yGEO4j
	 +Rq9DMWufqpu8xnd7lD/hJgD7RXWo7wUynkpckLdjj7JuSrIyRXVC0NA80EwREfpN2
	 5LaSXpRKxKyNGYjWvnutDMVUuzrEq3mxdPnkcUY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851ABF80155; Mon, 28 Aug 2023 12:17:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E54A2F80155;
	Mon, 28 Aug 2023 12:17:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059DCF80158; Mon, 28 Aug 2023 12:17:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30D5FF80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 12:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D5FF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rTt2ajYA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AF2E6371C;
	Mon, 28 Aug 2023 10:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E16C433C8;
	Mon, 28 Aug 2023 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693217827;
	bh=OYxRDe+mEOOEHQSZAwkDSOjrlyPclwtmIeVRxWs9lb0=;
	h=From:To:Cc:Subject:Date:From;
	b=rTt2ajYAMhgsehEZ9mYarH2zigBKtYnX4zEtrVlAw4VqYH6wTKJUzj4QYKYKcHGW5
	 0n7MHnrunkERaxsbTylDFYr+Z0NBsz0dcFzn9M4rM+PTbUw0qCMJ5M3yY3xXVKDdka
	 34thtqm7n1txlCMr/8BabL8jkyTiuPBJK5E+Y6yggvvQm+VmPnJFYuEcANYm5JURRL
	 WKnfU8QwOvXp6od5xKjK6zvCj4BtLgKOJqKvrYTHmbi5pNTA0PplkGmNGOFowdiNMr
	 8C/czlOt2UoiXvaZzcYoeTb6i34tYNCm0kdnv5cvzaXMfinin8u6hmUUzGgPWNATU5
	 C6TiMyF/EWEFA==
Message-ID: <8c4fe69de8214f27e2de1e1c37a70dce.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC updates for v6.6
Date: Mon, 28 Aug 2023 11:16:49 +0100
Message-ID-Hash: U2XK6NJTORMMFARBKYO3QIHHHZRTCHTU
X-Message-ID-Hash: U2XK6NJTORMMFARBKYO3QIHHHZRTCHTU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2XK6NJTORMMFARBKYO3QIHHHZRTCHTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit ab0b5072d184bdb013c9c2419cb21c593fa3802a:

  ASoC: cs35l56: Update ACPI HID and property (2023-08-17 18:36:28 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.6

for you to fetch changes up to 199cd64140f222c66b68ebe288a3fcd0570e2e41:

  ASoC: soc-core.c: Do not error if a DAI link component is not found (2023-08-24 21:10:45 +0100)

----------------------------------------------------------------
ASoC: Updates for v6.6

The rest of the updates for v6.6, some of the highlights include:

 - A big API cleanup from Morimoto-san, rationalising the places we put
   functions.
 - Lots of work on the SOF framework, AMD and Intel drivers, including a
   lot of cleanup and new device support.
 - Standardisation of the presentation of jacks from drivers.
 - Provision of some generic sound card DT properties.
 - Conversion oof more drivers to the maple tree register cache.
 - New drivers for AMD Van Gogh, AWInic AW88261, Cirrus Logic cs42l43,
   various Intel platforms, Mediatek MT7986, RealTek RT1017 and StarFive
   JH7110.

----------------------------------------------------------------
Ajye Huang (1):
      ASoC: Intel: Add rpl_nau8318_8825 driver

Alper Nebi Yasak (29):
      ASoC: amd: acp-da7219-max98357a: Map missing jack kcontrols
      ASoC: amd: acp-rt5645: Map missing jack kcontrols
      ASoC: amd: acp: Map missing jack kcontrols
      ASoC: amd: acp3x-rt5682-max9836: Map missing jack kcontrols
      ASoC: Intel: avs: da7219: Map missing jack kcontrols
      ASoC: Intel: bxt_da7219_max98357a: Map missing Line Out jack kcontrol
      ASoC: Intel: bytcr_wm5102: Map missing Line Out jack kcontrol
      ASoC: Intel: kbl_da7219_max98357a: Map missing Line Out jack kcontrol
      ASoC: Intel: kbl_da7219_max98927: Map missing Line Out jack kcontrol
      ASoC: Intel: sof_da7219_max98373: Map missing Line Out jack kcontrol
      ASoC: imx-es8328: Map missing jack kcontrols
      ASoC: mediatek: mt8173-max98090: Configure jack as a Headset jack
      ASoC: mediatek: mt8173-rt5650-rt5514: Map missing jack kcontrols
      ASoC: mediatek: mt8173-rt5650-rt5676: Map missing jack kcontrols
      ASoC: mediatek: mt8173-rt5650: Map missing jack kcontrols
      ASoC: mediatek: mt8183-da7219-max98357: Map missing jack kcontrols
      ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: Map missing jack kcontrols
      ASoC: mediatek: mt8186-mt6366-da7219-max98357: Map missing jack kcontrols
      ASoC: qcom: apq8016_sbc: Map missing jack kcontrols
      ASoC: qcom: sc7180: Map missing jack kcontrols
      ASoC: qcom: sc7280: Map missing jack kcontrols
      ASoC: qcom: sdm845: Map missing jack kcontrols
      ASoC: rk3399-gru-sound: Map missing Line Out jack kcontrol
      ASoC: rockchip: rockchip_rt5645: Map missing jack kcontrols
      ASoC: samsung: littlemill: Map missing jack kcontrols
      ASoC: samsung: lowland: Split Line Out jack kcontrol from Headphone
      ASoC: samsung: midas_wm1811: Map missing jack kcontrols
      ASoC: amd: acp3x-rt5682-max9836: Configure jack as not detecting Line Out
      ASoC: amd: acp: Add kcontrols and widgets per-codec in common code

Amadeusz Sławiński (17):
      ASoC: Intel: avs: Add rt5663 machine board
      ASoC: Intel: avs: Load rt5663 board on KBL-based platforms
      PCI: Sort Intel PCI IDs by number
      PCI: Add Intel Audio DSP devices to pci_ids.h
      ASoC: SOF: Remove unused Broxton PCI ID
      ALSA: Remove unused Broxton PCI ID
      ALSA: hda: Add controller matching macros
      ALSA: hda: Use global PCI match macro
      ALSA: hda/i915: Use global PCI match macro
      ASoC: Intel: Skylake: Use global PCI match macro
      ALSA: intel-dsp-config: Convert to PCI device IDs defines
      ALSA: hda: Convert to PCI device IDs defines
      ASoC: Intel: avs: Convert to PCI device IDs defines
      ASoC: Intel: avs: Convert to PCI device IDs defines
      ASoC: Intel: Skylake: Convert to PCI device IDs defines
      ASoC: SOF: Intel: Convert to PCI device IDs defines
      ASoC: Intel: sst: Convert to PCI device IDs defines

Andreas Kemnade (1):
      ASoC: ti: omap-mcbsp: Ignore errors for getting fck_src

Andy Shevchenko (9):
      ASoC: rt5677: Refactor GPIO support code
      ASoC: rt5677: Use agnostic irq_domain_create_linear()
      ASoC: rt5677: Use device_get_match_data()
      ASoC: rt5677: Sort headers alphabetically
      lib/math: Move dvb_math.c into lib/math/int_log.c
      lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
      lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX identifier
      ASoC: nau8825: Replace copied'n'pasted intlog10()
      Documentation: core-api: Drop :export: for int_log.h

Arnd Bergmann (2):
      ASoC: amd: acp: fix SND_SOC_AMD_ACP_PCI depdenencies
      ASoC: codecs: aw88261: avoid uninitialized variable warning

Balamurugan C (4):
      ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 0 in RPL match table
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in RPL match table.
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in RPL match table
      ASoC: Intel: RPL: Add entry for HDMI-In capture support on non-I2S codec boards.

Bard Liao (2):
      ASoC: Intel: sof_sdw: rename link_id to be_id
      ASoC: Intel: sof_sdw: break earlier when a adr link contains different codecs

Biju Das (1):
      ASoC: ak4613: Simplify probe()

Bjorn Andersson (1):
      ASoC: codecs: lpass: Log clk_get() failures

Brent Lu (2):
      ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
      ASoC: Intel: maxim-common: get codec number from ACPI table

Cezary Rojewski (6):
      ASoC: codecs: es8316: Add support for 24 MHz MCLK
      ASoC: codecs: es8316: Add support for S24_3LE format
      ASoC: Intel: avs: Add es8336 machine board
      ASoC: Intel: avs: Load es8336 board on KBL-based platforms
      ASoC: Intel: avs: rt5682: Add missing components
      ASoC: Intel: avs: rt5682: Tidy up hw_params()

Chancel Liu (6):
      ASoC: imx-pcm-rpmsg: Set PCM hardware parameters separately
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
      ASoC: fsl_rpmsg: Add support for i.MX93 platform
      ASoC: fsl_micfil: Add new registers and new bit definition
      ASoC: fsl_micfil: Add fsl_micfil_use_verid function
      ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM

Chao Song (3):
      ASoC: Intel: sof_sdw: add cs35l56 codec info
      ASoC: Intel: soc-acpi: add support for Dell SKU0C87 devices
      ASoC: SOF: Intel: Refactor code for HDA stream creation

Charles Keepax (31):
      ASoC: intel: sof_sdw: Use consistent variable naming for links
      ASoC: intel: sof_sdw: Rename codec_idx to codec_dlc_index
      ASoC: intel: sof_sdw: Remove some extra line breaks
      ASoC: intel: sof_sdw: Use a module device table
      ASoC: intel: sof_sdw: Simplify find_codec_info_acpi
      ASoC: intel: sof_sdw: Constify parameter to find_codec_part_info
      ASoC: intel: sof_sdw: Minor tidy up of mc_probe
      ASoC: intel: sof_sdw: Remove redundant parameters in dai creation
      ASoC: intel: sof_sdw: Move amp_num initialisation to mc_probe
      ASoC: intel: sof_sdw: Allow direct specification of CODEC name
      ASoC: intel: sof_sdw: Clean up DAI link counting
      ASoC: intel: sof_sdw: Merge codec_conf_alloc into dailink_info
      ASoC: intel: sof_sdw: Move group_generated logic
      ASoC: soc-acpi: Add missing kernel doc
      ASoC: intel: sof_sdw: Printk's should end with a newline
      ASoC: intel: sof_sdw: Remove duplicate NULL check on adr_link
      ASoC: intel: sof_sdw: Check link mask validity in get_dailink_info
      ASoC: intel: sof-sdw: Move check for valid group id to get_dailink_info
      ASoC: intel: sof_sdw: Add helper to create a single codec DLC
      ASoC: intel: sof_sdw: Pull device loop up into create_sdw_dailink
      ASoC: intel: sof_sdw: Update DLC index each time one is added
      ASoC: intel: sof_sdw: Move range check of codec_conf into inner loop
      ASoC: intel: sof_sdw: Device loop should not always start at adr_index
      ASoC: intel: sof_sdw: Support multiple groups on the same link
      ASoC: intel: sof_sdw: Allow different devices on the same link
      ASoC: intel: sof_sdw: Simplify get_slave_info
      dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
      mfd: cs42l43: Add support for cs42l43 core driver
      pinctrl: cs42l43: Add support for the cs42l43
      ASoC: cs42l43: Add support for the cs42l43
      ASoC: cs42l43: Use new-style PM runtime macros

Cristian Ciocaltea (4):
      ASoC: amd: vangogh: Make use of DRV_NAME
      ASoC: amd: vangogh: Use dmi_first_match() for DMI quirk handling
      ASoC: amd: vangogh: Add support for NAU8821/MAX98388 variant
      ASoC: soc-core.c: Do not error if a DAI link component is not found

Curtis Malainey (1):
      ASoC: SOF: Deprecate invalid enums in IPC3

Dan Carpenter (1):
      ASoC: amd: acp: delete unnecessary NULL check

David Heidelberg (1):
      dt-bindings: sound: gtm601: convert to YAML

Derek Fang (1):
      ASoC: rt1017: Add RT1017 SDCA amplifier driver

Fabio Estevam (2):
      ASoC: dt-bindings: wlf,wm8960: Describe the power supplies
      ASoC: wm8960: Add support for the power supplies

Francesco Dolcini (3):
      ASoC: dt-bindings: nau8822: Add #sound-dai-cells
      ASoC: dt-bindings: nau8822: Add MCLK clock
      ASoC: dt-bindings: wm8904: Convert to dtschema

Frank Li (1):
      ASoC: codec: wm8960: add additional probe check for codec identification

Guido Günther (1):
      dt-bindings: sound: gtm601: Add description

Guiting Shen (1):
      ASoC: tlv320aic32x4: Fix the divide by zero

Hans de Goede (1):
      ASoC: lower "no backend DAIs enabled for ... Port" log severity

Harshit Mogalapalli (1):
      ASoC: codecs: Fix error code in aw88261_i2c_probe()

Herve Codina (14):
      ASoC: dt-bindings: Add audio-iio-aux
      ASoC: dt-bindings: simple-card: Add additional-devs subnode
      iio: inkern: Check error explicitly in iio_channel_read_max()
      iio: consumer.h: Fix raw values documentation notes
      iio: inkern: Remove the 'unused' variable usage in iio_channel_read_max()
      iio: inkern: Fix headers inclusion order
      minmax: Introduce {min,max}_array()
      iio: inkern: Use max_array() to get the maximum value from an array
      iio: inkern: Replace a FIXME comment by a TODO one
      iio: inkern: Add a helper to query an available minimum raw value
      ASoC: soc-dapm.h: Convert macros to return a compound literal
      ASoC: codecs: Add support for the generic IIO auxiliary devices
      ASoC: simple-card: Handle additional devices
      ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t values handling

Jack Yu (2):
      ASoC: rt722-sdca: Remove redundant sdca mask
      ASoC: rt715: Add software reset in io init

Jiapeng Chong (1):
      ASoC: rt1017: Remove unused function

Justin Stitt (2):
      ASoC: 88pm860x: refactor deprecated strncpy
      ASoC: fsl_micfil: refactor deprecated strncpy

Jyri Sarha (2):
      ASoC: dapm: Add a flag for not having widget name in kcontrol name
      ASoC: SOF: topology: Add a token for dropping widget name in kcontrol name

Kai Vehmanen (2):
      ALSA: hda: add HD Audio PCI ID for Intel Arrow Lake-S
      ALSA: hda/i915: extend connectivity check to cover Intel ARL

Konrad Dybcio (1):
      ASoC: Convert pm8916-wcd-analog-codec to YAML

Krzysztof Kozlowski (17):
      ASoC: dt-bindings: Convert maxim,max98925 to DT schema
      ASoC: codecs: max9892x: Unify interleave mode OF property
      ASoC: codecs: max9892x: Reformat to coding style
      ASoC: codecs: tlv320aic32x4: Fix Wvoid-pointer-to-enum-cast warning
      ASoC: codecs: wm8904: Fix Wvoid-pointer-to-enum-cast warning
      ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning
      ASoC: dt-bindings: Add common sound card properties
      ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
      ASoC: dt-bindings: samsung,aries-wm8994: use common sound card
      ASoC: dt-bindings: samsung,midas-audio: use common sound card
      ASoC: dt-bindings: samsung,odroid: use common sound card
      ASoC: dt-bindings: samsung,tm2: use common sound card
      ASoC: samsung: odroid: use of_property_present to check for property
      ASoC: samsung: aries_wm8994: parse audio-routing
      ASoC: samsung: midas_wm1811: parse audio-routing
      ASoC: samsung: odroid: parse audio-routing
      ASoC: samsung: tm2_wm5110: parse audio-routing

Kuninori Morimoto (103):
      ASoC: soc-core.c: initialize dlc on snd_soc_get_dai_id()
      ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
      ASoC: soc-core: protect dlc->of_node under mutex
      ASoC: soc-dai.c: add DAI get/match functions
      ASoC: soc-core.c: enable multi Component
      ASoC: soc-core.c: add snd_soc_get_dai_via_args()
      ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
      ASoC: soc-core.c: add snd_soc_copy_dai_args()
      ASoC: simple-card-utils.c: enable multi Component support
      ASoC: simple-card.c: enable multi Component support
      ASoC: rsnd: use DAI driver ID instead of DAI ID
      ASoC: rsnd: cleanup rsnd_dai_of_node()
      ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
      ASoC: dt-bindings: renesas,rsnd.yaml: add common port-def
      ASoC: dt-bindings: renesas,rsnd.yaml: enable multi ports for multi Component support
      ASoC: rsnd: call of_node_put() when break
      ASoC: soc-dai.h: merge DAI call back functions into ops
      ASoC: ti: merge DAI call back functions into ops
      ASoC: adi: merge DAI call back functions into ops
      ASoC: adi: merge DAI call back functions into ops
      ASoC: amd: merge DAI call back functions into ops
      ASoC: dwc: merge DAI call back functions into ops
      ASoC: pxa: merge DAI call back functions into ops
      ASoC: bcm: merge DAI call back functions into ops
      ASoC: fsl: merge DAI call back functions into ops
      ASoC: img: merge DAI call back functions into ops
      ASoC: sof: merge DAI call back functions into ops
      ASoC: sti: merge DAI call back functions into ops
      ASoC: stm: merge DAI call back functions into ops
      ASoC: pxa: merge DAI call back functions into ops
      ASoC: rsnd: merge DAI call back functions into ops
      ASoC: qcom: merge DAI call back functions into ops
      ASoC: au1x: merge DAI call back functions into ops
      ASoC: ux500: merge DAI call back functions into ops
      ASoC: sunxi: merge DAI call back functions into ops
      ASoC: tegra: merge DAI call back functions into ops
      ASoC: atmel: merge DAI call back functions into ops
      ASoC: intel: merge DAI call back functions into ops
      ASoC: meson: merge DAI call back functions into ops
      ASoC: jz4740: merge DAI call back functions into ops
      ASoC: cirrus: merge DAI call back functions into ops
      ASoC: drm/vc4: merge DAI call back functions into ops
      ASoC: samsung: merge DAI call back functions into ops
      ASoC: mediatek: merge DAI call back functions into ops
      ASoC: rockchip: merge DAI call back functions into ops
      ASoC: uniphier: merge DAI call back functions into ops
      ASoC: loongson: merge DAI call back functions into ops
      ASoC: starfive: merge DAI call back functions into ops
      ASoC: hisilicon: merge DAI call back functions into ops
      ASoC: codecs/wm*: merge DAI call back functions into ops
      ASoC: soc-topology: merge DAI call back functions into ops
      ASoC: codecs/cs47lxx: merge DAI call back functions into ops
      ASoC: codecs/cx2072x: merge DAI call back functions into ops
      ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
      ASoC: soc-dai.h: remove unused call back functions
      ASoC: soc-dai.h: merge DAI call back functions into ops
      ASoC: ti: merge DAI call back functions into ops
      ASoC: adi: merge DAI call back functions into ops
      ASoC: adi: merge DAI call back functions into ops
      ASoC: amd: merge DAI call back functions into ops
      ASoC: dwc: merge DAI call back functions into ops
      ASoC: pxa: merge DAI call back functions into ops
      ASoC: bcm: merge DAI call back functions into ops
      ASoC: fsl: merge DAI call back functions into ops
      ASoC: img: merge DAI call back functions into ops
      ASoC: sof: merge DAI call back functions into ops
      ASoC: sti: merge DAI call back functions into ops
      ASoC: stm: merge DAI call back functions into ops
      ASoC: pxa: merge DAI call back functions into ops
      ASoC: rsnd: merge DAI call back functions into ops
      ASoC: qcom: merge DAI call back functions into ops
      ASoC: au1x: merge DAI call back functions into ops
      ASoC: ux500: merge DAI call back functions into ops
      ASoC: sunxi: merge DAI call back functions into ops
      ASoC: tegra: merge DAI call back functions into ops
      ASoC: atmel: merge DAI call back functions into ops
      ASoC: intel: merge DAI call back functions into ops
      ASoC: meson: merge DAI call back functions into ops
      ASoC: jz4740: merge DAI call back functions into ops
      ASoC: cirrus: merge DAI call back functions into ops
      ASoC: drm/vc4: merge DAI call back functions into ops
      ASoC: samsung: merge DAI call back functions into ops
      ASoC: mediatek: merge DAI call back functions into ops
      ASoC: rockchip: merge DAI call back functions into ops
      ASoC: uniphier: merge DAI call back functions into ops
      ASoC: loongson: merge DAI call back functions into ops
      ASoC: starfive: merge DAI call back functions into ops
      ASoC: hisilicon: merge DAI call back functions into ops
      ASoC: codecs/wm*: merge DAI call back functions into ops
      ASoC: soc-topology: merge DAI call back functions into ops
      ASoC: codecs/cs47lxx: merge DAI call back functions into ops
      ASoC: codecs/cx2072x: merge DAI call back functions into ops
      ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
      ASoC: soc-dai.h: remove unused call back functions
      ASoC: pxa: merge DAI call back functions into ops
      ASoC: fsl: merge DAI call back functions into ops
      ASoC: rsnd: enable clk_i approximate rate usage
      ASoC: rsnd: setup clock-out only when all conditions are right
      ASoC: rsnd: tidyup brga/brgb default value
      ASoC: rsnd: remove default division of clock out
      ASoC: rsnd: setup BRGCKR/BRRA/BRRB on rsnd_adg_clk_control()
      ASoC: audio-graph-card2: add comment for format property
      ASoC: audio-graph-card.c: move audio_graph_parse_of()

Li Zetao (3):
      ASoC: imx-audio-rpmsg: Remove redundant initialization owner in imx_audio_rpmsg_driver
      ASoC: tas5805m: Use devm_kmemdup to replace devm_kmalloc + memcpy
      ASoC: SOF: ipc3: Use devm_kmemdup to replace devm_kmalloc + memcpy

Linus Walleij (20):
      ASoC: rt1011: Drop GPIO includes
      ASoC: rt1015: Drop GPIO include
      ASoC: rt1015p: Drop legacy GPIO include
      ASoC: rt1016: Drop GPIO include
      ASoC: rt1019: Drop GPIO include
      ASoC: rt1305: Drop GPIO includes
      ASoC: rt1308: Drop GPIO includes
      ASoC: rt5514-spi: Drop GPIO include
      ASoC: rt5514: Drop GPIO include
      ASoC: rt5645: Drop legacy GPIO include
      ASoC: rt5659: Drop legacy GPIO include
      ASoC: rt5660: Drop GPIO includes
      ASoC: rt5682-sdw: Drop GPIO includes
      ASoC: rt715: Drop GPIO includes
      ASoC: rt5640: Convert to just use GPIO descriptors
      ASoC: rt5665: Convert to use GPIO descriptors
      ASoC: rt5668: Convert to use GPIO descriptors
      ASoC: rt5682: Convert to use GPIO descriptors
      ASoC: rt5682s: Convert to use GPIO descriptors
      ASoC: Delete UDA134x/L3 audio codec

Lucas Tanure (1):
      soundwire: bus: Allow SoundWire peripherals to register IRQ handlers

Marek Szyprowski (1):
      ASoC: samsung: midas_wm1811: Fix 'Headphone Switch' control creation

Mark Brown (122):
      Merge existing fixes from asoc/for-6.5 into new branch
      Add support for IIO devices in ASoC
      ASoC: remove copy of intlog10()
      ASoC: Intel: avs: New boards and fixes to existing
      AMD Vangogh support for NAU8821/MAX98388
      ASoC: mt8188: add memory-region support
      Add acpi mahine id's for vangogh platform and
      Refactor acp legacy driver and add
      ASoC: rt5677: Refactor GPIO and use
      ASoC: Another set of platform remove conversions
      ASoC: ad1836: Update to use maple tree register cache
      ASoC: ad1980: Update to use maple tree register cache
      ASoC: adau1372: Update to use maple tree register cache
      ASoC: adau1373: Update to use maple tree register cache
      ASoC: adau1701: Update to use maple tree register cache
      ASoC: adau1761: Update to use maple tree register cache
      ASoC: adau1781: Update to use maple tree register cache
      ASoC: adau1977: Update to use maple tree register cache
      ASoC: adau7118: Update to use maple tree register cache
      ASoC: adav80x: Update to use maple tree register cache
      ASoC: ad: Update Analog Devices drivers to maple tree
      ASoC: wcd9335: Update to use maple tree register cache
      ASoC: wcd938x: Update to use maple tree register cache
      ASoC: wsa881x: Update to use maple tree register cache
      ASoC: wsa883x: Update to use maple tree register cache
      ASoC: qcom: Use the maple tree register cache
      Add support for rpmsg sound card on i.MX93 platform
      Add Probe functionality support for amd platforms.
      ASoC: cs35l36: Update to use maple tree register cache
      ASoC: cs35l41: Update to use maple tree register cache
      ASoC: cs35l45: Update to use maple tree register cache
      ASoC: cs35l56: Update to use maple tree register cache
      ASoC: cs42l51: Update to use maple tree register cache
      ASoC: cs4265: Update to use maple tree register cache
      ASoC: cs4270: Update to use maple tree register cache
      ASoC: cs42l52: Update to use maple tree register cache
      ASoC: cs42l56: Update to use maple tree register cache
      ASoC: cs42xx8: Update to use maple tree register cache
      ASoC: cs4349: Update to use maple tree register cache
      ASoC: wm2200: Update to use maple tree register cache
      ASoC: wm5100: Update to use maple tree register cache
      ASoC: wm9081: Update to use maple tree register cache
      ASoC: wm9090: Update to use maple tree register cache
      ASoC: wm8510: Update to use maple tree register cache
      ASoC: wm8523: Update to use maple tree register cache
      ASoC: wm8580: Update to use maple tree register cache
      ASoC: wm8711: Update to use maple tree register cache
      ASoC: wm8728: Update to use maple tree register cache
      ASoC: wm8731: Update to use maple tree register cache
      ASoC: wm8737: Update to use maple tree register cache
      ASoC: wm8741: Update to use maple tree register cache
      ASoC: wm8750: Update to use maple tree register cache
      ASoC: wm8753: Update to use maple tree register cache
      ASoC: wm8770: Update to use maple tree register cache
      ASoC: wm8776: Update to use maple tree register cache
      ASoC: wm8804: Update to use maple tree register cache
      ASoC: wm8900: Update to use maple tree register cache
      ASoC: wm8903: Update to use maple tree register cache
      ASoC: wm8904: Update to use maple tree register cache
      ASoC: wm8960: Update to use maple tree register cache
      ASoC: wm8961: Update to use maple tree register cache
      ASoC: wm8962: Update to use maple tree register cache
      ASoC: wm8991: Update to use maple tree register cache
      ASoC: wm8993: Update to use maple tree register cache
      ASoC: wm8995: Update to use maple tree register cache
      ASoC: wm8996: Update to use maple tree register cache
      ASoC: wm8940: Update to use maple tree register cache
      ASoC: wm8955: Update to use maple tree register cache
      ASoC: wm8971: Update to use maple tree register cache
      ASoC: wm8978: Update to use maple tree register cache
      ASoC: wm8983: Update to use maple tree register cache
      ASoC: wm8985: Update to use maple tree register cache
      ASoC: wm8988: Update to use maple tree register cache
      ASoC: wm9705: Update to use maple tree register cache
      ASoC: wm9712: Update to use maple tree register cache
      ASoC: wm9713: Update to use maple tree register cache
      driver core: Provide stubs for !IOMEM builds
      platform: Provide stubs for !HAS_IOMEM builds
      ALSA: Enable build with UML
      kunit: Enable ASoC in all_tests.config
      ASoC: topology: Add explicit build option
      ASoC: add multi Component support
      ASoC: cirrus: Use the maple tree register cache
      ASoC: Improve coverage in default KUnit runs
      ASoC: dt-bindings: nau8822: minor updates
      ASoC: codecs: msm8916-wcd-analog: Cleanup DT bindings
      ASoC: Merge up fixes from mainline
      ALSA: hda: Adding support for CS35L56 on HDA
      ASoC: sta32x: Update to use maple tree register cache
      ASoC: sta350: Update to use maple tree register cache
      ASoC: sta529: Update to use maple tree register cache
      ASoC: stac9766: Update to use maple tree register cache
      ASoC: sti-sas: Update to use maple tree register cache
      ASoC: st: Use maple tree register cache
      ASoC: Merge up fixes from Linus' tree
      ASoC: wm8960: Read initial MCLK rate from clock API
      ASoC: wm8960: Make automatic the default clocking mode
      ASoC: rsnd: add multi Component support
      ASoC: wm8960: Clocking tweaks
      ASoC/SOF/Intel/AMD: cleanups for GCC11 -fanalyzer
      ASoC: Intel: machine driver updates for 6.6
      ASoC: jz4740: Update to use maple tree register cache
      ASoC: SoundWire codecs: improve pm_runtime handling
      ASoC: codecs: Add awinic AW88261 audio amplifier
      ASoC: Map missing jack kcontrols
      ASoC: SOF: Intel: add LunarLake support
      ASoC: cs35l56: Bugfixes
      ASoC: Merge up fixes
      sound: Remove redundant of_match_ptr() macro
      ASoC: rt: Drop unused GPIO includes
      ASoC: merge DAI call back functions into ops
      ASoC: Intel: RPL/MTL machine updates for 6.6
      ASoC: SOF: topology: simplify kcontrol names with
      Use devm_kmemdup to replace devm_kmalloc + memcpy
      ASoC: cs35l56: Don't patch firmware that is already
      ASoC: Convert remaining Realtek codecs to GPIO
      ASoC: Merge up fixes
      mfd: Immutable branch between MFD, Pinctrl and soundwire due for the v6.6 merge window
      Add cs42l43 PC focused SoundWire CODEC
      ASoC: SOF: ipc4-topology: Fixes for pipelines with SRC
      ASoC: rsnd: tidyup ADG
      Add I2S support for the StarFive JH7110 SoC

Maso Huang (6):
      ASoC: mediatek: mt7986: add common header
      ASoC: mediatek: mt7986: support etdm in platform driver
      ASoC: mediatek: mt7986: add platform driver
      ASoC: mediatek: mt7986: add machine driver with wm8960
      ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
      ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document

Mastan Katragadda (1):
      ASoC: SOF: amd: refactor PSP smn_read

Matus Gajdos (1):
      ASoC: fsl_spdif: Add support for 22.05 kHz sample rate

Maxim Kochetkov (1):
      ASoC: dwc: Add TDM mode support

Min-Hua Chen (1):
      ASoC: q6dsp: q6apm: make g_apm static

Nathan Chancellor (2):
      ASoC: SOF: Intel: Initialize chip in hda_sdw_check_wakeen_irq()
      ASoC: cs42l43: Initialize ret in default case in cs42l43_pll_ev()

Peter Suti (1):
      ASoC: soc-dai: don't call PCM audio ops if the stream is not supported

Peter Ujfalusi (1):
      ASoC: SOF: ipc4-topology: Add module parameter to ignore the CPC value

Pierre-Louis Bossart (52):
      ASoC: SOF: sof-client-probes-ipc4: add checks to prevent static analysis warnings
      ASoC: SOF: ipc3: add checks to prevent static analysis warnings
      ASoC: SOF: topology: simplify code to prevent static analysis warnings
      ASoC: SOF: imx: remove error checks on NULL ipc
      ASoC: SOF: mediatek: remove error checks on NULL ipc
      ASoC: Intel: bdw_rt286: add checks to avoid static analysis warnings
      ASoC: Intel: atom: remove static analysis false positive
      ASoC: amd: acp5x-mach:add checks to avoid static analysis warnings
      ASoC: Intel: sof_sdw: reorder SoundWire codecs in Kconfig
      ASoC: Intel: sof_sdw: allow mockup amplifier to provide feedback
      ASoC: Intel: sof_sdw: add support for SKU 0AFE
      ASoC: SOF: Intel: start simplify the signature of link_slaves_found()
      ASoC: soc-acpi: move link_slaves_found()
      ASoC: soc-acpi: improve log messagesin link_slaves_found()
      PCI: add ArrowLake-S PCI ID for Intel HDAudio subsystem.
      ALSA: hda: intel-dsp-cfg: use common include for MeteorLake
      ALSA: hda: intel-dsp-cfg: add LunarLake support
      ASoC: SoundWire codecs: return error status in probe
      ASoC: SoundWire codecs: make regmap cache-only in probe
      ASoC: rt5682-sdw: make regmap cache-only in probe
      ASoC: rt711: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt711-sdca: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt700: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt1712-sdca: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt712-sdca-dmic: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt715: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt715-sdca: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt1308-sdw: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt1316-sdw: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt1318-sdw: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: rt5682-sdw: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: max98363: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: max98373-sdw: enable pm_runtime in probe, keep status as 'suspended'
      ASoC: SOF: Intel: hda-mlink: fix off-by-one error
      ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
      ASoC: SOF: ipc4-topology: restore gateway config length
      ASoC: SOF: Intel: hda: add interface definitions for ACE2.x
      ASoC: SOF: Intel: split MTL and LNL operations
      ASoC: SOF: Intel: LNL: enable DMIC/SSP offload in probe/resume
      ASoC: SOF: Intel: hda-dai-ops: add/select DMA ops for SSP
      ASoC: SOF: Intel: hda-dai: add ops for SSP
      ASoC: SOF: Intel: hda-dai: add DMIC support
      ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams for first CPU DAI
      ASoC: SOF: Intel: hda-dai-ops: add ops for SoundWire
      ASoC: SOF: Intel: hda-dai: add helpers for SoundWire callbacks
      ASoC: SOF: Intel: hda: add hw_params/free/trigger callbacks
      ASoC: SOF: Intel: add abstraction for SoundWire wake-ups
      ASoC: SOF: Intel: hda-mlink: add helper to get sublink LSDIID register
      ASoC: SOF: Intel: hda-dai-ops: reset device count for SoundWire DAIs
      ASoC: SOF: IPC4: clarify 'pipeline_ids' usage and logs
      ASoC: SOF: Intel: hda-mlink: add sublink to dev_dbg() log
      ASoC: SOF: remove duplicate code due to merge

Randy Dunlap (1):
      ASoC: stac9766: fix build errors with REGMAP_AC97

Ranjani Sridharan (6):
      ASoC: SOF: ipc4: avoid uninitialized default instance 0
      ASoC: SOF: Intel: LNL: Add support for Lunarlake platform
      ASoC: SOF: ipc4-topology: Modify pipeline params based on SRC output format
      ASoC: SOF: ipc4-topology: Fix the output reference params for SRC
      ASoC: SOF: ipc4-topology: Fix pipeline params at the output of copier
      ASoC: SOF: ipc4-topology: Modify the reference output valid_bits for copier

Richard Fitzgerald (10):
      ASoC: cs35l56: Patch soft registers to defaults
      ASoC: cs35l56: Move runtime suspend/resume to shared library
      ASoC: cs35l56: Move cs_dsp init into shared library
      ASoC: cs35l56: Move part of cs35l56_init() to shared library
      ALSA: hda: Fix missing header dependencies
      ASoC: cs35l56: Avoid uninitialized variable in cs35l56_set_asp_slot_positions()
      ASoC: cs35l56: Don't rely on GPIOD_OUT_LOW to set RESET initially low
      ASoC: cs35l56: Wait for control port ready during system-resume
      ASoC: wm_adsp: Support powering-up DSP without trying to load firmware
      ASoC: cs35l56: Don't overwrite a patched firmware

Rob Herring (1):
      ASoC: dt-bindings: audio-graph-card2: Drop incomplete example

Ruan Jinjie (5):
      ASoC: atmel: Remove redundant of_match_ptr()
      ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
      ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
      ASoC: ssm3515: Remove redundant of_match_ptr()
      ALSA: Remove redundant of_match_ptr()

Sebastian Andrzej Siewior (1):
      ASoC: mediatek: mt8186: Remove unused mutex.

Senhong Liu (1):
      ASoC: rt5640: fix typos

Seven Lee (3):
      ASoC: dt-bindings: nau8821: Convert to dtschema
      ASoC: dt-bindings: nau8821: Add single-ended input feature
      ASoC: nau8821: Improve AMIC recording performance.

Shengjiu Wang (1):
      ASoC: wm8960: Add DAC filter characteristics selection

Shuming Fan (4):
      ASoC: rt5645: implement set_jack callback
      ASoC: rt5645: add the system level suspend-resume callback
      ASoC: rt1316: fix key tone missing
      ASoC: rt5645: improve the depop sequences of CBJ detection

Simon Trimmer (9):
      ASoC: cs35l56: Move shared data into a common data structure
      ASoC: cs35l56: Make cs35l56_system_reset() code more generic
      ASoC: cs35l56: Convert utility functions to use common data structure
      ASoC: cs35l56: Move utility functions to shared file
      ASoC: cs35l56: Make common function for control port wait
      ASoC: cs35l56: Make a common function to shutdown the DSP
      ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier
      ASoC: wm_adsp: Expose the DSP power down actions as wm_adsp_power_down()
      ASoC: cs35l56: Call wm_adsp_power_down() before reloading firmware

Stephan Gerhold (5):
      ASoC: dt-bindings: pm8916-analog-codec: Fix misleading example
      ASoC: dt-bindings: pm8916-analog-codec: Drop pointless reg-names
      ASoC: dt-bindings: pm8916-analog-codec: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Properly handle probe errors

Syed Saba Kareem (10):
      ASoC: amd: acp: refactor the acp init and de-init sequence
      ASoC: amd: acp: add acp i2s master clock generation for rembrandt platform
      ASoC: amd: acp: remove the redundant acp enable/disable interrupts functions
      ASoC: amd: acp: store platform device reference created in pci probe call
      ASoC: amd: acp: add pm ops support for acp pci driver
      ASoC: amd: acp: store xfer_resolution of the stream
      ASoC: amd: acp: export config_acp_dma() and config_pte_for_stream() symbols
      ASoC: amd: acp: store the pdm stream channel mask
      ASoC: amd: acp: move pdm macros to common header file
      ASoC: amd: acp: add pm ops support for rembrandt platform

Terry Cheong (1):
      ASoC: Intel: sof_rt5682: add RPL support for MAX98357A speaker

Trevor Wu (5):
      ASoC: mediatek: mt8188: add memory-region support
      ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
      ASoC: mediatek: mt8188: DPCM used FE and BE merged parameters
      ASoC: SOF: ipc3: update dai_link_fixup for SOF_DAI_MEDIATEK_AFE
      ASoC: SOF: mediatek: mt8186 modify dram type as non-cache

Uday M Bhat (1):
      ASoC: Intel: sof_sdw: Update BT offload config for soundwire config

Uwe Kleine-König (2):
      ASoC: amd: ps-sdw-dma: Convert to platform remove callback returning void
      ASoC: starfive: jh7110_tdm: Convert to platform remove callback returning void

V sujith kumar Reddy (3):
      ASoC: SOF: amd: Add Probe functionality support for amd platforms.
      ASoC: SOF: Add acp-probe id to sof probe client driver for registration.
      ASoC: SOF: amd: Add Probe register offset for renoir and rembrandt platform.

Venkata Prasad Potturu (7):
      ASoC: amd: acp: Add machine driver support for nau8821 codec
      ASoC: amd: acp: Add machine driver support for max98388 codec
      ASoC: amd: Add acpi machine id's for vangogh platform
      ASoC: amd: Add new dmi entries to config entry
      ASoC: SOF: amd: Add sof support for vangogh platform
      ASoC: SOF: amd: Add support for signed fw image loading
      ASoC: SOF: amd: Enable signed firmware image loading for Vangogh platform

Vijendar Mukunda (7):
      ASoC: SOF: amd: remove unused sha dma interrupt code
      ASoC: SOF: amd: enable ACP external global interrupt
      ASoC: SOF: amd: add module parameter for firmware debug
      ASoC: SOF: amd: remove redundant clock mux selection register write
      ASoC: SOF: amd: add conditional check for acp_clkmux_sel register
      ASoC: SOF: amd: clear panic mask status when panic occurs
      ASoC: SOF: amd: clear dsp to host interrupt status

Vlad Karpovich (1):
      firmware: cs_dsp: Fix new control name check

Weidong Wang (3):
      ASoC: dt-bindings: Add schema for "awinic,aw88261"
      ASoC: codecs: Add code for bin parsing compatible with aw88261
      ASoC: codecs: Add aw88261 amplifier driver

Xingyu Wu (3):
      ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC support
      ASoC: dwc: Use ops to get platform data
      ASoC: dwc: i2s: Add StarFive JH7110 SoC support

Yang Li (3):
      ASoC: tas2781: No need to set device_driver owner
      ASoC: amd: acp: clean up some inconsistent indentings
      ASoC: SOF: Intel: Remove duplicated include in lnl.c

Yang Yingliang (3):
      ASoC: cs42l51: change cs42l51_of_match to static
      ASoC: ti: davinci-evm: simplify the code with module_platform_driver
      ASoC: SOF: ipc3-dtrace: Switch to memdup_user_nul() helper

Yangtao Li (5):
      ASoC: bcm: bcm63xx-i2s-whistler: Convert to devm_platform_ioremap_resource()
      ASoC: ti: Convert to devm_platform_ioremap_resource_byname()
      ASoC: mediatek: mt8186: Convert to devm_platform_ioremap_resource()
      ASoC: pxa: Use devm_platform_get_and_ioremap_resource()
      ASoC: tegra: tegra20_ac97: Use devm_platform_get_and_ioremap_resource()

YingKun Meng (1):
      ASoC: loongson: drop of_match_ptr for OF device id

Yu Liao (1):
      ASoC: pxa: address unused variable warning

Yue Haibing (2):
      ASoC: q6dsp: Remove unused declaration
      ASoC: cygnus: Remove unused declarations

Zhu Ning (6):
      ASoC: codecs: ES8326: Add es8326_mute function
      ASoC: codecs: ES8326: Change Hp_detect register names
      ASoC: codecs: ES8326: Change Volatile Reg function
      ASoC: codecs: ES8326: Fix power-up sequence
      ASOC: codecs: ES8326: Add calibration support for version_b
      ASoC: codecs: ES8326: Update jact detection function

apoorv (1):
      ASoC: Intel: sof_rt5682 add support for HDMI_In capture

justinstitt@google.com (1):
      ASoC: intel: avs: refactor strncpy usage in topology

mnlife (1):
      ASoC: soc-jack: calling snd_soc_jack_report causes a null pointer access

 Documentation/ABI/testing/sysfs-bus-cxl            |   15 +-
 Documentation/ABI/testing/sysfs-devices-system-cpu |   13 +-
 Documentation/ABI/testing/sysfs-platform-hidma     |    2 +-
 .../ABI/testing/sysfs-platform-hidma-mgmt          |   20 +-
 .../admin-guide/hw-vuln/gather_data_sampling.rst   |  109 +
 Documentation/admin-guide/hw-vuln/index.rst        |   14 +-
 Documentation/admin-guide/hw-vuln/srso.rst         |  150 ++
 Documentation/admin-guide/kdump/vmcoreinfo.rst     |    6 +
 Documentation/admin-guide/kernel-parameters.txt    |   58 +-
 Documentation/core-api/kernel-api.rst              |    6 +-
 .../devicetree/bindings/iio/addac/adi,ad74115.yaml |    3 -
 .../devicetree/bindings/net/mediatek,net.yaml      |    7 +-
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   10 +-
 .../bindings/serial/atmel,at91-usart.yaml          |    4 +-
 .../bindings/sound/amlogic,axg-sound-card.yaml     |   15 +-
 .../bindings/sound/amlogic,gx-sound-card.yaml      |   17 +-
 .../devicetree/bindings/sound/audio-iio-aux.yaml   |   64 +
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |    4 +-
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |  313 +++
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |   18 +-
 .../bindings/sound/google,sc7180-trogdor.yaml      |   17 +-
 .../bindings/sound/google,sc7280-herobrine.yaml    |   17 +-
 Documentation/devicetree/bindings/sound/gtm601.txt |   19 -
 .../devicetree/bindings/sound/imx-audio-card.yaml  |   18 +-
 .../devicetree/bindings/sound/max9892x.txt         |   44 -
 .../devicetree/bindings/sound/maxim,max98925.yaml  |   98 +
 .../bindings/sound/mediatek,mt7986-afe.yaml        |  160 ++
 .../bindings/sound/mediatek,mt7986-wm8960.yaml     |   67 +
 .../bindings/sound/mediatek,mt8188-afe.yaml        |    7 +
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   17 +-
 .../devicetree/bindings/sound/nau8821.txt          |   55 -
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml |  132 ++
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml |   12 +
 .../devicetree/bindings/sound/option,gtm601.yaml   |   42 +
 .../bindings/sound/qcom,msm8916-wcd-analog.txt     |  101 -
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        |  153 ++
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |   60 +-
 .../bindings/sound/samsung,aries-wm8994.yaml       |   16 +-
 .../bindings/sound/samsung,midas-audio.yaml        |   16 +-
 .../devicetree/bindings/sound/samsung,odroid.yaml  |   14 +-
 .../devicetree/bindings/sound/samsung,tm2.yaml     |   16 +-
 .../devicetree/bindings/sound/simple-card.yaml     |   53 +
 .../bindings/sound/snps,designware-i2s.yaml        |  108 +-
 .../bindings/sound/sound-card-common.yaml          |   27 +
 .../devicetree/bindings/sound/wlf,wm8904.yaml      |   74 +
 .../devicetree/bindings/sound/wlf,wm8960.yaml      |   20 +
 Documentation/devicetree/bindings/sound/wm8904.txt |   33 -
 Documentation/driver-api/media/dtv-common.rst      |    9 -
 Documentation/filesystems/locking.rst              |    5 +-
 Documentation/filesystems/porting.rst              |   25 +-
 MAINTAINERS                                        |   76 +-
 Makefile                                           |    2 +-
 arch/alpha/include/asm/processor.h                 |   13 -
 arch/alpha/kernel/setup.c                          |    3 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   26 +-
 arch/arm/boot/dts/nspire/nspire.dtsi               |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts       |   10 +
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |    2 +-
 arch/arm/mach-pxa/sharpsl_pm.h                     |    1 -
 arch/arm/mach-pxa/spitz_pm.c                       |    1 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |    2 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |    2 +-
 arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi      |    1 -
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |    2 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |    4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    4 +
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |    4 +
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   16 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   16 +-
 arch/arm64/include/asm/el2_setup.h                 |   44 +-
 arch/arm64/include/asm/kvm_asm.h                   |    2 +-
 arch/arm64/include/asm/kvm_emulate.h               |   21 +-
 arch/arm64/include/asm/processor.h                 |    8 -
 arch/arm64/kernel/fpsimd.c                         |    9 +-
 arch/arm64/kernel/ptrace.c                         |   10 +-
 arch/arm64/kvm/arm.c                               |   61 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |    1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c                      |   15 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |    2 +-
 arch/ia64/include/asm/processor.h                  |    3 -
 .../asm/mach-cavium-octeon/cpu-feature-overrides.h |    2 -
 arch/parisc/Kconfig.debug                          |    2 +-
 arch/parisc/boot/compressed/misc.c                 |   10 +-
 arch/parisc/include/asm/dma.h                      |    2 +
 arch/parisc/include/asm/ftrace.h                   |    4 +
 arch/parisc/include/asm/spinlock.h                 |    2 -
 arch/parisc/include/asm/spinlock_types.h           |    6 +
 arch/parisc/kernel/firmware.c                      |    8 +-
 arch/parisc/kernel/ftrace.c                        |    2 +-
 arch/parisc/kernel/parisc_ksyms.c                  |    7 +-
 arch/parisc/kernel/pci-dma.c                       |   12 +-
 arch/parisc/kernel/pdt.c                           |    4 +-
 arch/parisc/kernel/perf.c                          |    2 +-
 arch/parisc/kernel/processor.c                     |    1 +
 arch/parisc/kernel/setup.c                         |   48 -
 arch/parisc/kernel/signal.c                        |    2 +-
 arch/parisc/kernel/sys_parisc.c                    |   15 +-
 arch/parisc/kernel/syscall.S                       |   23 +-
 arch/parisc/kernel/unaligned.c                     |   19 +-
 arch/parisc/lib/ucmpdi2.c                          |    3 +-
 arch/parisc/mm/fault.c                             |   50 +-
 arch/parisc/mm/fixmap.c                            |    3 -
 arch/parisc/mm/init.c                              |   38 +-
 arch/parisc/mm/ioremap.c                           |    9 +-
 arch/powerpc/include/asm/processor.h               |    3 -
 arch/powerpc/include/asm/word-at-a-time.h          |    2 +-
 arch/powerpc/kernel/head_64.S                      |    3 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S        |    9 +-
 arch/powerpc/mm/init_64.c                          |    3 +-
 arch/powerpc/platforms/85xx/smp.c                  |    2 +-
 arch/powerpc/platforms/powermac/time.c             |    6 +-
 arch/riscv/include/asm/acpi.h                      |    2 +-
 arch/riscv/include/asm/cacheflush.h                |    4 +
 arch/riscv/include/asm/mmio.h                      |   16 +-
 arch/riscv/include/asm/pgtable.h                   |    2 +
 arch/riscv/include/asm/vmalloc.h                   |    4 +-
 arch/riscv/kernel/acpi.c                           |    4 +-
 arch/riscv/kernel/cpu.c                            |    5 +
 arch/riscv/kernel/crash_core.c                     |    2 +
 arch/riscv/kernel/elf_kexec.c                      |    3 +-
 arch/riscv/kernel/smp.c                            |    5 -
 arch/riscv/mm/init.c                               |   16 +-
 arch/riscv/mm/kasan_init.c                         |    1 -
 arch/s390/configs/debug_defconfig                  |   11 +-
 arch/s390/configs/defconfig                        |    9 +-
 arch/s390/configs/zfcpdump_defconfig               |    1 -
 arch/s390/include/uapi/asm/ptrace.h                |    2 +
 arch/s390/kernel/sthyi.c                           |    6 +-
 arch/s390/kvm/intercept.c                          |    9 +-
 arch/s390/mm/vmem.c                                |    2 +
 arch/sparc/include/asm/processor_64.h              |    3 -
 arch/x86/Kconfig                                   |   26 +
 arch/x86/boot/compressed/idt_64.c                  |    9 +-
 arch/x86/boot/compressed/sev.c                     |   37 +-
 arch/x86/entry/vdso/vma.c                          |    4 +-
 arch/x86/hyperv/hv_apic.c                          |    4 +-
 arch/x86/hyperv/hv_init.c                          |   21 +
 arch/x86/hyperv/hv_vtl.c                           |    4 +
 arch/x86/hyperv/ivm.c                              |    7 +-
 arch/x86/hyperv/mmu.c                              |   12 +-
 arch/x86/hyperv/nested.c                           |   11 +-
 arch/x86/include/asm/acpi.h                        |    2 +
 arch/x86/include/asm/cpufeatures.h                 |   14 +-
 arch/x86/include/asm/linkage.h                     |    2 +-
 arch/x86/include/asm/mshyperv.h                    |    2 +-
 arch/x86/include/asm/msr-index.h                   |   12 +
 arch/x86/include/asm/nospec-branch.h               |   23 +-
 arch/x86/include/asm/processor.h                   |   12 +-
 arch/x86/include/asm/segment.h                     |    2 +-
 arch/x86/kernel/acpi/boot.c                        |    4 +
 arch/x86/kernel/cpu/amd.c                          |   39 +
 arch/x86/kernel/cpu/bugs.c                         |  337 +++
 arch/x86/kernel/cpu/common.c                       |   44 +-
 arch/x86/kernel/cpu/cpu.h                          |    1 +
 arch/x86/kernel/traps.c                            |    2 +
 arch/x86/kernel/vmlinux.lds.S                      |   35 +-
 arch/x86/kvm/cpuid.c                               |    3 +
 arch/x86/kvm/svm/sev.c                             |  124 +-
 arch/x86/kvm/svm/svm.c                             |    4 +-
 arch/x86/kvm/svm/svm.h                             |   26 +
 arch/x86/kvm/svm/vmenter.S                         |    3 +
 arch/x86/kvm/x86.c                                 |    5 +-
 arch/x86/lib/retpoline.S                           |   83 +-
 block/blk-core.c                                   |    6 -
 block/blk-iocost.c                                 |    5 +-
 block/fops.c                                       |    7 +-
 drivers/accel/ivpu/ivpu_gem.c                      |    8 +
 drivers/acpi/resource.c                            |   64 +
 drivers/acpi/scan.c                                |    1 +
 drivers/android/binder.c                           |    1 +
 drivers/android/binder_alloc.c                     |    6 +
 drivers/android/binder_alloc.h                     |    1 +
 drivers/ata/libata-scsi.c                          |    7 +
 drivers/base/cpu.c                                 |   85 +-
 drivers/block/rbd.c                                |   28 +-
 drivers/block/zram/zram_drv.c                      |   32 +-
 drivers/char/tpm/tpm-chip.c                        |   83 +-
 drivers/char/tpm/tpm_crb.c                         |   30 +
 drivers/char/tpm/tpm_tis.c                         |   20 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/imx/clk-imx93.c                        |    2 +-
 drivers/clk/mediatek/clk-mt8183.c                  |   27 +
 drivers/clk/meson/clk-pll.c                        |    4 +-
 drivers/counter/Kconfig                            |   14 +-
 drivers/cpufreq/amd-pstate.c                       |   10 +-
 drivers/cpuidle/cpuidle-psci-domain.c              |   39 +-
 drivers/cpuidle/dt_idle_genpd.c                    |   24 +
 drivers/cpuidle/dt_idle_genpd.h                    |    7 +
 drivers/cxl/core/mbox.c                            |   45 +-
 drivers/cxl/core/memdev.c                          |   19 +
 drivers/cxl/cxlmem.h                               |   16 +
 drivers/dma/Kconfig                                |    2 +
 drivers/dma/idxd/device.c                          |    4 +-
 drivers/dma/mcf-edma.c                             |   13 +-
 drivers/dma/owl-dma.c                              |    2 +-
 drivers/dma/pl330.c                                |   18 +-
 drivers/dma/xilinx/xdma.c                          |    6 +-
 drivers/firmware/arm_scmi/mailbox.c                |    4 +-
 drivers/firmware/arm_scmi/raw_mode.c               |    5 +-
 drivers/firmware/arm_scmi/smc.c                    |   21 +-
 drivers/firmware/cirrus/cs_dsp.c                   |    3 +-
 drivers/firmware/smccc/soc_id.c                    |    5 +-
 drivers/gpio/gpio-sim.c                            |    1 +
 drivers/gpio/gpio-ws16c48.c                        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   26 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    4 -
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   13 -
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   20 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   12 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    4 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    6 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  140 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |   21 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   16 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   17 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    2 +-
 drivers/gpu/drm/i915/i915_active.c                 |   99 +-
 drivers/gpu/drm/i915/i915_request.c                |   11 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |   48 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c  |   10 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     |   13 -
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   17 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    3 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    6 +-
 drivers/hv/connection.c                            |   13 +-
 drivers/hv/hv_balloon.c                            |    2 +-
 drivers/hv/hv_common.c                             |   10 +-
 drivers/hwmon/aquacomputer_d5next.c                |   37 +-
 drivers/hwmon/pmbus/bel-pfe.c                      |   16 +-
 drivers/iio/adc/ad7192.c                           |   16 +-
 drivers/iio/adc/ina2xx-adc.c                       |    9 +-
 drivers/iio/adc/meson_saradc.c                     |   23 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |    2 +-
 drivers/iio/frequency/admv1013.c                   |    5 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |    2 +-
 drivers/iio/industrialio-core.c                    |    5 +-
 drivers/iio/inkern.c                               |   86 +-
 drivers/iio/light/rohm-bu27008.c                   |   22 +-
 drivers/iio/light/rohm-bu27034.c                   |   22 +-
 drivers/infiniband/core/umem.c                     |    3 +-
 drivers/infiniband/hw/bnxt_re/main.c               |    4 +-
 drivers/infiniband/hw/bnxt_re/qplib_res.c          |    1 +
 drivers/infiniband/hw/hfi1/chip.c                  |    1 +
 drivers/interconnect/qcom/bcm-voter.c              |    5 +
 drivers/interconnect/qcom/icc-rpmh.h               |    2 +
 drivers/interconnect/qcom/sa8775p.c                |    1 +
 drivers/interconnect/qcom/sm8450.c                 |    9 +
 drivers/interconnect/qcom/sm8550.c                 |   17 +
 drivers/isdn/hardware/mISDN/hfcpci.c               |   10 +-
 drivers/isdn/mISDN/dsp.h                           |    2 +-
 drivers/isdn/mISDN/dsp_cmx.c                       |    2 +-
 drivers/isdn/mISDN/dsp_core.c                      |    2 +-
 drivers/media/dvb-core/Makefile                    |    2 +-
 drivers/media/dvb-frontends/af9013_priv.h          |    2 +-
 drivers/media/dvb-frontends/af9033_priv.h          |    2 +-
 drivers/media/dvb-frontends/cxd2820r_priv.h        |    2 +-
 drivers/media/dvb-frontends/cxd2841er.c            |    2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt2_mon.c             |    2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt_mon.c              |    2 +-
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c  |    2 +-
 drivers/media/dvb-frontends/dib7000p.c             |    2 +-
 drivers/media/dvb-frontends/dib8000.c              |    2 +-
 drivers/media/dvb-frontends/dib9000.c              |    2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |    2 +-
 drivers/media/dvb-frontends/lgdt3305.c             |    2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |    2 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    2 +-
 drivers/media/dvb-frontends/m88ds3103_priv.h       |    2 +-
 drivers/media/dvb-frontends/mn88443x.c             |    2 +-
 drivers/media/dvb-frontends/mn88472_priv.h         |    2 +-
 drivers/media/dvb-frontends/mn88473_priv.h         |    2 +-
 drivers/media/dvb-frontends/or51132.c              |    2 +-
 drivers/media/dvb-frontends/or51211.c              |    2 +-
 drivers/media/dvb-frontends/rtl2830_priv.h         |    2 +-
 drivers/media/dvb-frontends/rtl2832_priv.h         |    2 +-
 drivers/media/dvb-frontends/si2165.c               |    2 +-
 drivers/media/dvb-frontends/stv0367.c              |    2 +-
 drivers/media/dvb-frontends/tc90522.c              |    2 +-
 drivers/media/dvb-frontends/tda10048.c             |    2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    4 +-
 drivers/memory/tegra/mc.c                          |   37 +
 drivers/memory/tegra/tegra194.c                    |    1 +
 drivers/memory/tegra/tegra234.c                    |   27 +-
 drivers/mfd/Kconfig                                |   23 +
 drivers/mfd/Makefile                               |    3 +
 drivers/mfd/cs42l43-i2c.c                          |   98 +
 drivers/mfd/cs42l43-sdw.c                          |  239 ++
 drivers/mfd/cs42l43.c                              | 1188 ++++++++++
 drivers/mfd/cs42l43.h                              |   28 +
 drivers/misc/cardreader/rts5227.c                  |    2 +-
 drivers/misc/cardreader/rts5228.c                  |   18 -
 drivers/misc/cardreader/rts5249.c                  |    3 +-
 drivers/misc/cardreader/rts5260.c                  |   18 -
 drivers/misc/cardreader/rts5261.c                  |   18 -
 drivers/misc/cardreader/rtsx_pcr.c                 |    5 +-
 drivers/misc/tps6594-esm.c                         |   19 +-
 drivers/mmc/host/moxart-mmc.c                      |    8 +-
 drivers/mmc/host/sdhci_f_sdh30.c                   |   60 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |    2 +-
 drivers/mtd/nand/raw/meson_nand.c                  |    3 +-
 drivers/mtd/nand/raw/omap_elm.c                    |   24 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |   45 +-
 drivers/mtd/nand/spi/toshiba.c                     |    4 +-
 drivers/mtd/nand/spi/winbond.c                     |    4 +-
 drivers/mtd/spi-nor/spansion.c                     |    4 +-
 drivers/net/bonding/bond_main.c                    |    4 +-
 drivers/net/dsa/bcm_sf2.c                          |    8 +-
 drivers/net/dsa/microchip/ksz_common.c             |   35 +-
 drivers/net/dsa/ocelot/felix.c                     |    2 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   85 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h          |    2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c      |   14 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h      |    2 +-
 drivers/net/ethernet/freescale/enetc/enetc_pf.c    |  111 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    4 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c    |   14 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c |    4 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   29 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |    2 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.h  |    1 +
 drivers/net/ethernet/ibm/ibmvnic.c                 |  112 +-
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c     |    5 +-
 drivers/net/ethernet/intel/iavf/iavf_fdir.c        |   11 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |   18 +
 drivers/net/ethernet/intel/igc/igc.h               |    4 +
 drivers/net/ethernet/intel/igc/igc_main.c          |   34 +-
 drivers/net/ethernet/korina.c                      |    3 +-
 .../ethernet/marvell/octeon_ep/octep_ctrl_mbox.c   |    3 +
 .../net/ethernet/marvell/prestera/prestera_pci.c   |    3 +-
 .../ethernet/marvell/prestera/prestera_router.c    |   14 +-
 .../mellanox/mlx5/core/diag/reporter_vnic.c        |  116 +-
 .../ethernet/mellanox/mlx5/core/en/tc_tun_encap.c  |    9 +-
 .../net/ethernet/mellanox/mlx5/core/en/xsk/rx.c    |    5 +-
 .../mellanox/mlx5/core/en_accel/ipsec_fs.c         |    4 +-
 .../mellanox/mlx5/core/en_accel/ipsec_rxtx.c       |    4 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ktls.c    |    8 -
 .../ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c |   29 +-
 .../mellanox/mlx5/core/en_accel/macsec_fs.c        |    1 +
 drivers/net/ethernet/mellanox/mlx5/core/en_arfs.c  |   10 +
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |   40 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |   20 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   42 +-
 .../mellanox/mlx5/core/esw/bridge_debugfs.c        |    2 +-
 .../ethernet/mellanox/mlx5/core/esw/devlink_port.c |    2 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |   17 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_cmd.c   |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_cmd.h   |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c  |  107 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.h  |    2 +-
 .../net/ethernet/mellanox/mlx5/core/lag/port_sel.c |    2 +-
 .../net/ethernet/mellanox/mlx5/core/lib/clock.c    |    5 +
 .../ethernet/mellanox/mlx5/core/lib/fs_chains.c    |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/main.c     |    3 +-
 .../net/ethernet/mellanox/mlx5/core/mlx5_core.h    |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/sriov.c    |    3 +-
 .../mellanox/mlx5/core/steering/dr_action.c        |    2 +-
 .../ethernet/mellanox/mlx5/core/steering/dr_cmd.c  |    5 +-
 .../mellanox/mlx5/core/steering/dr_domain.c        |   19 +-
 .../ethernet/mellanox/mlx5/core/steering/dr_ptrn.c |    2 +-
 .../mellanox/mlx5/core/steering/dr_ste_v0.c        |    7 +-
 .../mellanox/mlx5/core/steering/dr_ste_v1.c        |    7 +-
 .../mellanox/mlx5/core/steering/dr_types.h         |    2 +-
 .../ethernet/mellanox/mlx5/core/steering/fs_dr.c   |    4 +-
 .../ethernet/mellanox/mlx5/core/steering/mlx5dr.h  |    2 +-
 drivers/net/ethernet/microsoft/mana/mana_en.c      |   37 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |   23 +-
 drivers/net/ethernet/qlogic/qed/qed_dev_api.h      |   16 +
 drivers/net/ethernet/qlogic/qed/qed_fcoe.c         |   19 +-
 drivers/net/ethernet/qlogic/qed/qed_fcoe.h         |   17 +-
 drivers/net/ethernet/qlogic/qed/qed_hw.c           |   26 +-
 drivers/net/ethernet/qlogic/qed/qed_iscsi.c        |   19 +-
 drivers/net/ethernet/qlogic/qed/qed_iscsi.h        |    8 +-
 drivers/net/ethernet/qlogic/qed/qed_l2.c           |   19 +-
 drivers/net/ethernet/qlogic/qed/qed_l2.h           |   24 +
 drivers/net/ethernet/qlogic/qed/qed_main.c         |    6 +-
 drivers/net/ethernet/sfc/falcon/selftest.c         |   23 +-
 drivers/net/ethernet/sfc/selftest.c                |   23 +-
 drivers/net/ethernet/sfc/siena/selftest.c          |   23 +-
 drivers/net/ethernet/socionext/netsec.c            |   11 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  |    3 +-
 drivers/net/ethernet/xilinx/ll_temac_main.c        |   12 +-
 drivers/net/macsec.c                               |   28 +-
 drivers/net/phy/at803x.c                           |   47 +-
 drivers/net/tap.c                                  |    2 +-
 drivers/net/tun.c                                  |    4 +-
 drivers/net/usb/cdc_ether.c                        |   21 +
 drivers/net/usb/lan78xx.c                          |    7 +-
 drivers/net/usb/qmi_wwan.c                         |    1 +
 drivers/net/usb/zaurus.c                           |   21 +
 drivers/net/vxlan/vxlan_vnifilter.c                |   11 +-
 drivers/net/wireguard/allowedips.c                 |    8 +-
 drivers/net/wireguard/selftest/allowedips.c        |   16 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |    1 -
 drivers/net/wireless/ath/ath11k/pcic.c             |    1 -
 drivers/net/wireless/ath/ath12k/wmi.c              |    3 +-
 drivers/net/wireless/ath/ath6kl/Makefile           |    5 -
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |    5 +
 .../broadcom/brcm80211/brcmfmac/fwil_types.h       |    7 +-
 drivers/net/wireless/legacy/rayctl.h               |    2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c |    6 +-
 drivers/net/wireless/realtek/rtw89/mac.c           |    2 +-
 drivers/net/xen-netback/netback.c                  |   15 +-
 drivers/nvme/host/core.c                           |   10 +-
 drivers/nvme/host/ioctl.c                          |    2 -
 drivers/nvme/host/pci.c                            |    3 +-
 drivers/nvme/host/rdma.c                           |    3 +-
 drivers/nvme/host/tcp.c                            |    3 +-
 drivers/parisc/sba_iommu.c                         |    6 +
 drivers/parport/parport_gsc.c                      |   28 +-
 drivers/parport/parport_gsc.h                      |    7 -
 drivers/pci/bus.c                                  |    4 +-
 drivers/pci/controller/Kconfig                     |    1 -
 drivers/pci/controller/dwc/pcie-designware-host.c  |   13 +-
 drivers/pci/controller/dwc/pcie-designware.c       |   20 +-
 drivers/pci/controller/dwc/pcie-designware.h       |    1 -
 drivers/pci/hotplug/acpiphp_glue.c                 |    8 +-
 drivers/pci/of.c                                   |    5 -
 drivers/pinctrl/cirrus/Kconfig                     |   11 +
 drivers/pinctrl/cirrus/Makefile                    |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  609 ++++++
 drivers/platform/x86/amd/pmf/sps.c                 |    3 +-
 .../x86/intel/speed_select_if/isst_if_common.c     |    4 +-
 drivers/platform/x86/lenovo-ymc.c                  |   25 +
 drivers/platform/x86/mlx-platform.c                |   23 +-
 drivers/platform/x86/msi-ec.c                      |   18 +-
 drivers/platform/x86/serial-multi-instantiate.c    |   14 +
 drivers/powercap/intel_rapl_common.c               |   14 +-
 drivers/powercap/intel_rapl_msr.c                  |   49 +-
 drivers/powercap/intel_rapl_tpmi.c                 |   17 +-
 drivers/s390/net/qeth_core.h                       |    1 -
 drivers/s390/net/qeth_core_main.c                  |    2 -
 drivers/s390/net/qeth_l2_main.c                    |    9 +-
 drivers/s390/net/qeth_l3_main.c                    |    8 +-
 drivers/s390/scsi/zfcp_fc.c                        |    6 +-
 drivers/scsi/53c700.c                              |    2 +-
 drivers/scsi/fnic/fnic.h                           |    2 +-
 drivers/scsi/fnic/fnic_scsi.c                      |    6 +-
 drivers/scsi/lpfc/lpfc_scsi.c                      |   20 +-
 drivers/scsi/pm8001/pm8001_init.c                  |    3 +-
 drivers/scsi/qedf/qedf_main.c                      |   18 +
 drivers/scsi/qedi/qedi_main.c                      |   23 +-
 drivers/scsi/raid_class.c                          |    1 +
 drivers/scsi/scsi_proc.c                           |   30 +-
 drivers/scsi/sd.c                                  |    9 +-
 drivers/scsi/snic/snic_disc.c                      |    1 +
 drivers/scsi/storvsc_drv.c                         |    8 +-
 drivers/soc/imx/imx8mp-blk-ctrl.c                  |    2 +-
 drivers/soundwire/bus.c                            |   32 +
 drivers/soundwire/bus_type.c                       |   12 +
 .../intel/int340x_thermal/processor_thermal_rapl.c |   16 +-
 drivers/thunderbolt/tb.c                           |    2 +
 drivers/thunderbolt/tmu.c                          |    4 +-
 drivers/ufs/host/ufs-renesas.c                     |    2 +-
 drivers/usb/common/usb-conn-gpio.c                 |    6 +-
 drivers/usb/dwc3/gadget.c                          |    9 +-
 drivers/usb/gadget/udc/core.c                      |    9 +
 drivers/usb/storage/alauda.c                       |   12 +-
 drivers/usb/typec/altmodes/displayport.c           |   18 +-
 drivers/usb/typec/mux/Kconfig                      |    1 +
 drivers/usb/typec/mux/nb7vpq904m.c                 |   25 +-
 drivers/usb/typec/tcpm/tcpm.c                      |    7 +
 fs/btrfs/block-group.c                             |   17 +-
 fs/btrfs/block-group.h                             |    2 +
 fs/btrfs/disk-io.c                                 |   13 +-
 fs/btrfs/extent-tree.c                             |    5 +-
 fs/btrfs/extent_io.c                               |   13 +-
 fs/btrfs/inode.c                                   |   10 +-
 fs/btrfs/relocation.c                              |   45 +-
 fs/btrfs/tree-checker.c                            |   14 +
 fs/ceph/dir.c                                      |    5 +-
 fs/ceph/mds_client.c                               |    4 +-
 fs/ceph/mds_client.h                               |    5 +
 fs/ceph/super.c                                    |   10 +
 fs/coda/dir.c                                      |   20 +-
 fs/erofs/super.c                                   |    2 -
 fs/erofs/zdata.c                                   |    7 +-
 fs/exfat/balloc.c                                  |    6 +-
 fs/exfat/dir.c                                     |   39 +-
 fs/exportfs/expfs.c                                |    2 +-
 fs/file.c                                          |   18 +-
 fs/gfs2/file.c                                     |    4 +-
 fs/gfs2/trans.c                                    |   14 +-
 fs/inode.c                                         |    3 -
 fs/jfs/namei.c                                     |    3 +-
 fs/nfsd/vfs.c                                      |    9 +-
 fs/nilfs2/inode.c                                  |    8 +
 fs/nilfs2/segment.c                                |    2 +
 fs/nilfs2/the_nilfs.h                              |    2 +
 fs/ntfs/dir.c                                      |    3 +-
 fs/ocfs2/file.c                                    |    5 +-
 fs/open.c                                          |    2 +-
 fs/overlayfs/readdir.c                             |    3 +-
 fs/proc/base.c                                     |    2 +-
 fs/proc/kcore.c                                    |   30 +-
 fs/readdir.c                                       |   68 +-
 fs/smb/client/dfs.c                                |    6 +-
 fs/smb/server/smb2misc.c                           |   10 +-
 fs/smb/server/smb2pdu.c                            |    9 +-
 fs/vboxsf/dir.c                                    |    3 +-
 fs/vboxsf/shfl_hostintf.h                          |    6 +-
 fs/zonefs/file.c                                   |  111 +-
 fs/zonefs/super.c                                  |    9 +-
 fs/zonefs/zonefs.h                                 |    2 -
 include/asm-generic/mshyperv.h                     |    2 +-
 include/asm-generic/word-at-a-time.h               |    2 +-
 include/linux/bio.h                                |    2 +-
 include/linux/blkdev.h                             |    1 -
 include/linux/cpu.h                                |    4 +
 include/linux/cpumask.h                            |    8 +-
 include/linux/device.h                             |   26 +
 include/linux/firmware/imx/dsp.h                   |    6 -
 include/linux/firmware/mediatek/mtk-adsp-ipc.h     |    6 -
 include/linux/fs.h                                 |    8 +-
 include/linux/hyperv.h                             |    3 -
 include/linux/iio/consumer.h                       |   37 +-
 include/{media/dvb_math.h => linux/int_log.h}      |   18 +-
 include/linux/intel_rapl.h                         |   14 +-
 include/linux/mfd/cs42l43-regs.h                   | 1184 ++++++++++
 include/linux/mfd/cs42l43.h                        |  102 +
 include/linux/minmax.h                             |   64 +
 include/linux/pci_ids.h                            |  106 +-
 include/linux/platform_device.h                    |   28 +
 include/linux/prefetch.h                           |    7 +-
 include/linux/skmsg.h                              |    1 +
 include/linux/soundwire/sdw.h                      |   14 +
 include/linux/soundwire/sdw_intel.h                |    7 +-
 include/linux/spi/corgi_lcd.h                      |    2 +
 include/linux/spi/spi-mem.h                        |    4 +
 include/linux/tpm.h                                |    1 +
 include/net/cfg80211.h                             |    3 +
 include/net/gro.h                                  |   43 +
 include/net/inet_sock.h                            |    7 +-
 include/net/ip.h                                   |    2 +-
 include/net/netfilter/nf_tables.h                  |  120 +-
 include/net/route.h                                |    4 +-
 include/net/vxlan.h                                |    4 +-
 include/scsi/scsi_device.h                         |    1 +
 include/soc/tegra/mc.h                             |    3 +
 include/sound/cs35l56.h                            |   29 +-
 include/sound/cs42l43.h                            |   17 +
 include/sound/designware_i2s.h                     |    3 +
 include/sound/hda-mlink.h                          |    4 +
 include/sound/hda_codec.h                          |    3 -
 include/sound/hdaudio.h                            |   26 +
 include/sound/l3.h                                 |   28 -
 include/sound/rt5665.h                             |    2 -
 include/sound/rt5668.h                             |    3 -
 include/sound/rt5682.h                             |    3 -
 include/sound/rt5682s.h                            |    3 -
 include/sound/simple_card_utils.h                  |    5 +-
 include/sound/soc-acpi.h                           |    7 +
 include/sound/soc-dai.h                            |   29 +-
 include/sound/soc-dapm.h                           |  139 +-
 include/sound/soc.h                                |    6 +
 include/sound/sof/topology.h                       |    4 +-
 include/sound/uda134x.h                            |   24 -
 include/trace/events/tcp.h                         |    5 +-
 include/uapi/linux/pkt_cls.h                       |    4 +-
 include/uapi/sound/sof/tokens.h                    |    6 +-
 io_uring/io_uring.c                                |    3 +
 io_uring/openclose.c                               |    6 +-
 kernel/bpf/cpumap.c                                |   35 +-
 kernel/power/hibernate.c                           |    2 +-
 kernel/trace/bpf_trace.c                           |   17 +-
 kernel/workqueue.c                                 |   43 +-
 lib/Kconfig.debug                                  |    2 +-
 lib/Makefile                                       |    6 +
 lib/cpumask.c                                      |    5 +-
 lib/math/Makefile                                  |    2 +-
 .../dvb-core/dvb_math.c => lib/math/int_log.c      |   26 +-
 lib/scatterlist.c                                  |    2 +-
 lib/test_bitmap.c                                  |    8 +-
 mm/compaction.c                                    |    8 +-
 mm/damon/core.c                                    |    1 +
 mm/hugetlb.c                                       |   75 +-
 mm/ksm.c                                           |    2 +
 mm/memory-failure.c                                |   29 +-
 mm/memory.c                                        |    3 +
 mm/swapfile.c                                      |    8 +-
 mm/zsmalloc.c                                      |   14 +-
 net/8021q/vlan.c                                   |    3 +-
 net/can/raw.c                                      |    2 +-
 net/ceph/osd_client.c                              |   20 +-
 net/core/bpf_sk_storage.c                          |    5 +-
 net/core/filter.c                                  |    6 -
 net/core/rtnetlink.c                               |    8 +-
 net/core/skmsg.c                                   |   10 +-
 net/core/sock.c                                    |   71 +-
 net/core/sock_map.c                                |   12 +-
 net/dcb/dcbnl.c                                    |    2 +-
 net/dccp/ipv6.c                                    |    4 +-
 net/dccp/output.c                                  |    2 +-
 net/dccp/proto.c                                   |   10 +-
 net/dsa/port.c                                     |    9 +-
 net/ipv4/inet_diag.c                               |    4 +-
 net/ipv4/ip_output.c                               |   17 +-
 net/ipv4/ip_sockglue.c                             |    2 +-
 net/ipv4/ip_tunnel_core.c                          |    2 +-
 net/ipv4/nexthop.c                                 |   28 +-
 net/ipv4/raw.c                                     |    2 +-
 net/ipv4/route.c                                   |    4 +-
 net/ipv4/tcp_ipv4.c                                |    4 +-
 net/ipv4/tcp_metrics.c                             |   70 +-
 net/ipv4/udp.c                                     |    8 +-
 net/ipv4/udp_offload.c                             |    7 +-
 net/ipv6/ip6mr.c                                   |    2 +-
 net/ipv6/ndisc.c                                   |    3 +-
 net/ipv6/ping.c                                    |    2 +-
 net/ipv6/raw.c                                     |    6 +-
 net/ipv6/route.c                                   |    7 +-
 net/ipv6/tcp_ipv6.c                                |    9 +-
 net/ipv6/udp.c                                     |   12 +-
 net/ipv6/udp_offload.c                             |    7 +-
 net/l2tp/l2tp_ip6.c                                |    2 +-
 net/mptcp/protocol.c                               |    4 +-
 net/mptcp/protocol.h                               |    1 -
 net/mptcp/sockopt.c                                |    2 +-
 net/mptcp/subflow.c                                |   58 +-
 net/netfilter/nf_tables_api.c                      |  307 ++-
 net/netfilter/nft_set_hash.c                       |   85 +-
 net/netfilter/nft_set_pipapo.c                     |   66 +-
 net/netfilter/nft_set_rbtree.c                     |  146 +-
 net/netfilter/nft_socket.c                         |    2 +-
 net/netfilter/xt_socket.c                          |    4 +-
 net/packet/af_packet.c                             |   28 +-
 net/sched/cls_flower.c                             |    5 +-
 net/sched/cls_fw.c                                 |    1 -
 net/sched/cls_route.c                              |    1 -
 net/sched/cls_u32.c                                |   57 +-
 net/sched/em_meta.c                                |    4 +-
 net/sched/sch_taprio.c                             |   15 +-
 net/smc/af_smc.c                                   |   79 +-
 net/smc/smc.h                                      |    2 +-
 net/smc/smc_clc.c                                  |    4 +-
 net/smc/smc_core.c                                 |   25 +-
 net/smc/smc_sysctl.c                               |   10 +-
 net/tls/tls_device.c                               |   64 +-
 net/tls/tls_main.c                                 |    3 -
 net/unix/af_unix.c                                 |    2 +-
 net/wireless/nl80211.c                             |    5 +-
 net/wireless/scan.c                                |    2 +-
 net/xdp/xsk.c                                      |    3 +-
 net/xfrm/xfrm_policy.c                             |    2 +-
 rust/Makefile                                      |    2 +-
 rust/bindings/bindings_helper.h                    |    1 +
 rust/kernel/allocator.rs                           |   74 +-
 rust/kernel/sync/arc.rs                            |    3 +-
 rust/kernel/types.rs                               |   22 +-
 scripts/kallsyms.c                                 |    1 +
 security/keys/sysctl.c                             |    2 +-
 sound/Kconfig                                      |    4 -
 sound/drivers/serial-generic.c                     |    2 +-
 sound/hda/hdac_i915.c                              |   21 +-
 sound/hda/intel-dsp-config.c                       |  134 +-
 sound/pci/hda/Kconfig                              |   31 +
 sound/pci/hda/Makefile                             |    6 +
 sound/pci/hda/cs35l56_hda.c                        |  995 +++++++++
 sound/pci/hda/cs35l56_hda.h                        |   48 +
 sound/pci/hda/cs35l56_hda_i2c.c                    |   69 +
 sound/pci/hda/cs35l56_hda_spi.c                    |   68 +
 sound/pci/hda/hda_auto_parser.h                    |    2 +
 sound/pci/hda/hda_generic.h                        |    3 +
 sound/pci/hda/hda_intel.c                          |  375 ++--
 sound/soc/Kconfig                                  |   11 +
 sound/soc/adi/axi-i2s.c                            |    2 +-
 sound/soc/adi/axi-spdif.c                          |    2 +-
 sound/soc/amd/Kconfig                              |    5 +-
 sound/soc/amd/acp-config.c                         |   33 +
 sound/soc/amd/acp-da7219-max98357a.c               |   41 +-
 sound/soc/amd/acp-rt5645.c                         |   22 +-
 sound/soc/amd/acp/Kconfig                          |    8 +
 sound/soc/amd/acp/Makefile                         |    2 +
 sound/soc/amd/acp/acp-i2s.c                        |   26 +-
 sound/soc/amd/acp/acp-legacy-common.c              |  347 +++
 sound/soc/amd/acp/acp-legacy-mach.c                |   22 +-
 sound/soc/amd/acp/acp-mach-common.c                |  525 ++++-
 sound/soc/amd/acp/acp-mach.h                       |    2 +
 sound/soc/amd/acp/acp-pci.c                        |   57 +-
 sound/soc/amd/acp/acp-pdm.c                        |   13 +-
 sound/soc/amd/acp/acp-platform.c                   |    6 +-
 sound/soc/amd/acp/acp-rembrandt.c                  |  187 +-
 sound/soc/amd/acp/acp-renoir.c                     |  117 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   33 +-
 sound/soc/amd/acp/amd.h                            |   52 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |   23 +-
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/amd/ps/ps-sdw-dma.c                      |    5 +-
 sound/soc/amd/vangogh/acp5x-mach.c                 |  152 +-
 sound/soc/atmel/atmel-i2s.c                        |   18 +-
 sound/soc/atmel/atmel-pdmic.c                      |    2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   26 +-
 sound/soc/atmel/mchp-pdmc.c                        |   18 +-
 sound/soc/atmel/mchp-spdifrx.c                     |   16 +-
 sound/soc/atmel/mchp-spdiftx.c                     |   20 +-
 sound/soc/atmel/tse850-pcm5142.c                   |    2 +-
 sound/soc/au1x/ac97c.c                             |   10 +-
 sound/soc/au1x/psc-ac97.c                          |    2 +-
 sound/soc/bcm/bcm2835-i2s.c                        |   24 +-
 sound/soc/bcm/bcm63xx-i2s-whistler.c               |   16 +-
 sound/soc/bcm/cygnus-ssp.h                         |    2 -
 sound/soc/cirrus/ep93xx-i2s.c                      |    2 +-
 sound/soc/codecs/88pm860x-codec.c                  |    4 +-
 sound/soc/codecs/Kconfig                           |   58 +-
 sound/soc/codecs/Makefile                          |   14 +-
 sound/soc/codecs/ad1836.c                          |    2 +-
 sound/soc/codecs/ad1980.c                          |    2 +-
 sound/soc/codecs/adau1372.c                        |    2 +-
 sound/soc/codecs/adau1373.c                        |    2 +-
 sound/soc/codecs/adau1701.c                        |    2 +-
 sound/soc/codecs/adau1761.c                        |    2 +-
 sound/soc/codecs/adau1781.c                        |    2 +-
 sound/soc/codecs/adau1977.c                        |    2 +-
 sound/soc/codecs/adau7118-i2c.c                    |    2 +-
 sound/soc/codecs/adav80x.c                         |    2 +-
 sound/soc/codecs/ak4613.c                          |   11 +-
 sound/soc/codecs/audio-iio-aux.c                   |  344 +++
 sound/soc/codecs/aw88261.c                         | 1300 +++++++++++
 sound/soc/codecs/aw88261.h                         |  459 ++++
 sound/soc/codecs/aw88395/aw88395_lib.c             |  193 +-
 sound/soc/codecs/aw88395/aw88395_reg.h             |    1 +
 sound/soc/codecs/cs35l36.c                         |    2 +-
 sound/soc/codecs/cs35l41-lib.c                     |    4 +-
 sound/soc/codecs/cs35l45-tables.c                  |    4 +-
 sound/soc/codecs/cs35l56-i2c.c                     |   14 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   72 +-
 sound/soc/codecs/cs35l56-shared.c                  |  482 ++++-
 sound/soc/codecs/cs35l56-spi.c                     |   10 +-
 sound/soc/codecs/cs35l56.c                         |  699 ++----
 sound/soc/codecs/cs35l56.h                         |   15 +-
 sound/soc/codecs/cs4265.c                          |    2 +-
 sound/soc/codecs/cs4270.c                          |    2 +-
 sound/soc/codecs/cs42l43-jack.c                    |  946 ++++++++
 sound/soc/codecs/cs42l43-sdw.c                     |   74 +
 sound/soc/codecs/cs42l43.c                         | 2278 ++++++++++++++++++++
 sound/soc/codecs/cs42l43.h                         |  131 ++
 sound/soc/codecs/cs42l51-i2c.c                     |    2 +-
 sound/soc/codecs/cs42l51.c                         |    2 +-
 sound/soc/codecs/cs42l52.c                         |    2 +-
 sound/soc/codecs/cs42l56.c                         |    2 +-
 sound/soc/codecs/cs42xx8.c                         |    2 +-
 sound/soc/codecs/cs4349.c                          |    2 +-
 sound/soc/codecs/cs47l15.c                         |    6 +-
 sound/soc/codecs/cs47l24.c                         |    8 +-
 sound/soc/codecs/cs47l35.c                         |    8 +-
 sound/soc/codecs/cs47l85.c                         |    8 +-
 sound/soc/codecs/cs47l90.c                         |    8 +-
 sound/soc/codecs/cs47l92.c                         |    6 +-
 sound/soc/codecs/cx2072x.c                         |   11 +-
 sound/soc/codecs/es8316.c                          |    5 +-
 sound/soc/codecs/es8326.c                          |  385 +++-
 sound/soc/codecs/es8326.h                          |   30 +-
 sound/soc/codecs/hdmi-codec.c                      |   44 +-
 sound/soc/codecs/jz4740.c                          |    2 +-
 sound/soc/codecs/l3.c                              |  132 --
 sound/soc/codecs/lpass-rx-macro.c                  |   10 +-
 sound/soc/codecs/lpass-tx-macro.c                  |   10 +-
 sound/soc/codecs/lpass-va-macro.c                  |    6 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   10 +-
 sound/soc/codecs/max98363.c                        |   41 +-
 sound/soc/codecs/max98373-sdw.c                    |   47 +-
 sound/soc/codecs/max98926.c                        |    3 +-
 sound/soc/codecs/max98927.c                        |  357 ++-
 sound/soc/codecs/msm8916-wcd-analog.c              |   56 +-
 sound/soc/codecs/nau8821.c                         |   42 +-
 sound/soc/codecs/nau8821.h                         |   25 +
 sound/soc/codecs/nau8825.c                         |   93 +-
 sound/soc/codecs/rt1011.c                          |    2 -
 sound/soc/codecs/rt1015.c                          |    1 -
 sound/soc/codecs/rt1015p.c                         |    1 -
 sound/soc/codecs/rt1016.c                          |    1 -
 sound/soc/codecs/rt1017-sdca-sdw.c                 |  824 +++++++
 sound/soc/codecs/rt1017-sdca-sdw.h                 |  183 ++
 sound/soc/codecs/rt1019.c                          |    1 -
 sound/soc/codecs/rt1305.c                          |    2 -
 sound/soc/codecs/rt1308-sdw.c                      |   54 +-
 sound/soc/codecs/rt1308.c                          |    2 -
 sound/soc/codecs/rt1316-sdw.c                      |   56 +-
 sound/soc/codecs/rt1318-sdw.c                      |   43 +-
 sound/soc/codecs/rt5514-spi.c                      |    1 -
 sound/soc/codecs/rt5514.c                          |    1 -
 sound/soc/codecs/rt5640.c                          |   59 +-
 sound/soc/codecs/rt5640.h                          |    2 +-
 sound/soc/codecs/rt5645.c                          |   65 +-
 sound/soc/codecs/rt5659.c                          |    1 -
 sound/soc/codecs/rt5660.c                          |    2 -
 sound/soc/codecs/rt5665.c                          |   17 +-
 sound/soc/codecs/rt5668.c                          |   17 +-
 sound/soc/codecs/rt5677.c                          |  117 +-
 sound/soc/codecs/rt5677.h                          |   92 +-
 sound/soc/codecs/rt5682-i2c.c                      |   11 +-
 sound/soc/codecs/rt5682-sdw.c                      |   63 +-
 sound/soc/codecs/rt5682.c                          |   23 +-
 sound/soc/codecs/rt5682.h                          |    3 +
 sound/soc/codecs/rt5682s.c                         |   16 +-
 sound/soc/codecs/rt5682s.h                         |    2 +
 sound/soc/codecs/rt700-sdw.c                       |    7 +-
 sound/soc/codecs/rt700.c                           |   46 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |    3 +-
 sound/soc/codecs/rt711-sdca.c                      |   48 +-
 sound/soc/codecs/rt711-sdw.c                       |    7 +-
 sound/soc/codecs/rt711.c                           |   47 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |   47 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |    3 +-
 sound/soc/codecs/rt712-sdca.c                      |   45 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |    5 +-
 sound/soc/codecs/rt715-sdca.c                      |   41 +-
 sound/soc/codecs/rt715-sdw.c                       |    9 +-
 sound/soc/codecs/rt715.c                           |  100 +-
 sound/soc/codecs/rt715.h                           |    7 +
 sound/soc/codecs/rt722-sdca-sdw.c                  |    2 +-
 sound/soc/codecs/rt722-sdca.c                      |    3 +-
 sound/soc/codecs/ssm3515.c                         |    2 +-
 sound/soc/codecs/sta32x.c                          |    2 +-
 sound/soc/codecs/sta350.c                          |    2 +-
 sound/soc/codecs/sta529.c                          |    2 +-
 sound/soc/codecs/stac9766.c                        |    2 +-
 sound/soc/codecs/sti-sas.c                         |    2 +-
 sound/soc/codecs/tas2781-i2c.c                     |    1 -
 sound/soc/codecs/tas5805m.c                        |    3 +-
 sound/soc/codecs/tlv320aic32x4-clk.c               |   16 +-
 sound/soc/codecs/tlv320aic32x4.c                   |    2 +-
 sound/soc/codecs/tlv320aic32x4.h                   |    5 +-
 sound/soc/codecs/uda134x.c                         |  587 -----
 sound/soc/codecs/uda134x.h                         |   33 -
 sound/soc/codecs/wcd9335.c                         |    2 +-
 sound/soc/codecs/wcd938x-sdw.c                     |    2 +-
 sound/soc/codecs/wm2200.c                          |   14 +-
 sound/soc/codecs/wm5100.c                          |    2 +-
 sound/soc/codecs/wm5102.c                          |    6 +-
 sound/soc/codecs/wm5110.c                          |    8 +-
 sound/soc/codecs/wm8510.c                          |    2 +-
 sound/soc/codecs/wm8523.c                          |    2 +-
 sound/soc/codecs/wm8580.c                          |    2 +-
 sound/soc/codecs/wm8711.c                          |    2 +-
 sound/soc/codecs/wm8728.c                          |    2 +-
 sound/soc/codecs/wm8731.c                          |    2 +-
 sound/soc/codecs/wm8737.c                          |    2 +-
 sound/soc/codecs/wm8741.c                          |    2 +-
 sound/soc/codecs/wm8750.c                          |    2 +-
 sound/soc/codecs/wm8753.c                          |    2 +-
 sound/soc/codecs/wm8770.c                          |    2 +-
 sound/soc/codecs/wm8776.c                          |    2 +-
 sound/soc/codecs/wm8804.c                          |    2 +-
 sound/soc/codecs/wm8900.c                          |    2 +-
 sound/soc/codecs/wm8903.c                          |    2 +-
 sound/soc/codecs/wm8904.c                          |    4 +-
 sound/soc/codecs/wm8940.c                          |    2 +-
 sound/soc/codecs/wm8955.c                          |    2 +-
 sound/soc/codecs/wm8960.c                          |   54 +-
 sound/soc/codecs/wm8960.h                          |    4 +-
 sound/soc/codecs/wm8961.c                          |    2 +-
 sound/soc/codecs/wm8962.c                          |    2 +-
 sound/soc/codecs/wm8971.c                          |    2 +-
 sound/soc/codecs/wm8978.c                          |    2 +-
 sound/soc/codecs/wm8983.c                          |    2 +-
 sound/soc/codecs/wm8985.c                          |    2 +-
 sound/soc/codecs/wm8988.c                          |    2 +-
 sound/soc/codecs/wm8991.c                          |    2 +-
 sound/soc/codecs/wm8993.c                          |    2 +-
 sound/soc/codecs/wm8994.c                          |    2 +-
 sound/soc/codecs/wm8995.c                          |    2 +-
 sound/soc/codecs/wm8996.c                          |    2 +-
 sound/soc/codecs/wm9081.c                          |    2 +-
 sound/soc/codecs/wm9090.c                          |    2 +-
 sound/soc/codecs/wm9705.c                          |    2 +-
 sound/soc/codecs/wm9712.c                          |    2 +-
 sound/soc/codecs/wm9713.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |   24 +-
 sound/soc/codecs/wm_adsp.h                         |    3 +-
 sound/soc/codecs/wsa881x.c                         |    2 +-
 sound/soc/codecs/wsa883x.c                         |    2 +-
 sound/soc/dwc/dwc-i2s.c                            |  379 +++-
 sound/soc/dwc/dwc-pcm.c                            |    8 +-
 sound/soc/dwc/local.h                              |   25 +
 sound/soc/fsl/fsl_asrc.c                           |   16 +-
 sound/soc/fsl/fsl_aud2htx.c                        |   10 +-
 sound/soc/fsl/fsl_easrc.c                          |   16 +-
 sound/soc/fsl/fsl_esai.c                           |   20 +-
 sound/soc/fsl/fsl_micfil.c                         |  116 +-
 sound/soc/fsl/fsl_micfil.h                         |   64 +
 sound/soc/fsl/fsl_qmc_audio.c                      |   28 +-
 sound/soc/fsl/fsl_rpmsg.c                          |    8 +
 sound/soc/fsl/fsl_sai.c                            |   24 +-
 sound/soc/fsl/fsl_spdif.c                          |   25 +-
 sound/soc/fsl/fsl_spdif.h                          |    6 +-
 sound/soc/fsl/fsl_ssi.c                            |    3 +-
 sound/soc/fsl/fsl_xcvr.c                           |   16 +-
 sound/soc/fsl/imx-audio-rpmsg.c                    |    1 -
 sound/soc/fsl/imx-es8328.c                         |   25 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   12 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |    2 +-
 sound/soc/generic/audio-graph-card.c               |  143 +-
 .../generic/audio-graph-card2-custom-sample.dtsi   |    7 +
 sound/soc/generic/audio-graph-card2.c              |   14 +-
 sound/soc/generic/simple-card-utils.c              |   23 +-
 sound/soc/generic/simple-card.c                    |   66 +-
 sound/soc/hisilicon/hi6210-i2s.c                   |    2 +-
 sound/soc/img/img-i2s-in.c                         |   14 +-
 sound/soc/img/img-i2s-out.c                        |   14 +-
 sound/soc/img/img-parallel-out.c                   |   14 +-
 sound/soc/img/img-spdif-in.c                       |   12 +-
 sound/soc/img/img-spdif-out.c                      |   12 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    2 +-
 sound/soc/intel/atom/sst/sst.c                     |   14 +-
 sound/soc/intel/atom/sst/sst.h                     |    7 +-
 sound/soc/intel/atom/sst/sst_pci.c                 |    4 +-
 sound/soc/intel/atom/sst/sst_stream.c              |   13 +-
 sound/soc/intel/avs/board_selection.c              |   26 +-
 sound/soc/intel/avs/boards/Kconfig                 |   20 +
 sound/soc/intel/avs/boards/Makefile                |    4 +
 sound/soc/intel/avs/boards/da7219.c                |   34 +-
 sound/soc/intel/avs/boards/es8336.c                |  315 +++
 sound/soc/intel/avs/boards/rt5663.c                |  254 +++
 sound/soc/intel/avs/boards/rt5682.c                |   67 +-
 sound/soc/intel/avs/core.c                         |   16 +-
 sound/soc/intel/avs/probes.c                       |   10 +-
 sound/soc/intel/avs/topology.c                     |    6 +-
 sound/soc/intel/boards/Kconfig                     |   10 +-
 sound/soc/intel/boards/Makefile                    |    2 +-
 sound/soc/intel/boards/bdw_rt286.c                 |    6 +
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    7 +
 sound/soc/intel/boards/bytcr_wm5102.c              |    7 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    7 +
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    7 +
 sound/soc/intel/boards/sof_da7219_max98373.c       |   10 +
 sound/soc/intel/boards/sof_es8336.c                |   10 +
 sound/soc/intel/boards/sof_maxim_common.c          |  170 +-
 sound/soc/intel/boards/sof_maxim_common.h          |   21 +-
 sound/soc/intel/boards/sof_nau8825.c               |   10 +
 sound/soc/intel/boards/sof_rt5682.c                |  172 +-
 sound/soc/intel/boards/sof_sdw.c                   |  608 +++---
 sound/soc/intel/boards/sof_sdw_common.h            |    7 +
 sound/soc/intel/boards/sof_sdw_cs_amp.c            |   47 +
 sound/soc/intel/boards/sof_ssp_amp.c               |    9 +
 sound/soc/intel/catpt/pcm.c                        |    8 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |    7 +
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   12 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   52 +
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c  |   69 +
 sound/soc/intel/keembay/kmb_platform.c             |    4 +-
 sound/soc/intel/skylake/skl-messages.c             |   16 +-
 sound/soc/intel/skylake/skl-pcm.c                  |    3 +-
 sound/soc/intel/skylake/skl.c                      |   36 +-
 sound/soc/jz4740/jz4740-i2s.c                      |    3 +-
 sound/soc/loongson/loongson_card.c                 |    2 +-
 sound/soc/loongson/loongson_i2s.c                  |   16 +-
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt7986/Makefile                 |    9 +
 sound/soc/mediatek/mt7986/mt7986-afe-common.h      |   49 +
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c         |  622 ++++++
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c        |  411 ++++
 sound/soc/mediatek/mt7986/mt7986-reg.h             |  196 ++
 sound/soc/mediatek/mt7986/mt7986-wm8960.c          |  196 ++
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |    2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   23 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   23 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   23 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   43 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   53 +-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c         |    2 -
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |    4 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |    6 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |    8 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |   15 +
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |   56 +-
 sound/soc/meson/aiu-acodec-ctrl.c                  |    4 +-
 sound/soc/meson/aiu-codec-ctrl.c                   |    4 +-
 sound/soc/meson/aiu-fifo-i2s.c                     |    3 +
 sound/soc/meson/aiu-fifo-spdif.c                   |    3 +
 sound/soc/meson/aiu.c                              |    6 -
 sound/soc/meson/axg-frddr.c                        |    4 +-
 sound/soc/meson/axg-pdm.c                          |   18 +-
 sound/soc/meson/axg-spdifin.c                      |    4 +-
 sound/soc/meson/axg-tdm-interface.c                |    6 +-
 sound/soc/meson/axg-toddr.c                        |    4 +-
 sound/soc/meson/g12a-toacodec.c                    |    4 +-
 sound/soc/meson/g12a-tohdmitx.c                    |    4 +-
 sound/soc/pxa/mmp-sspa.c                           |    2 +-
 sound/soc/pxa/pxa-ssp.c                            |   12 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   17 +-
 sound/soc/qcom/apq8016_sbc.c                       |   37 +-
 sound/soc/qcom/lpass-apq8016.c                     |    4 -
 sound/soc/qcom/lpass-cpu.c                         |   40 +-
 sound/soc/qcom/lpass-ipq806x.c                     |    1 -
 sound/soc/qcom/lpass-sc7180.c                      |    5 +-
 sound/soc/qcom/lpass-sc7280.c                      |    2 -
 sound/soc/qcom/lpass.h                             |    4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   88 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |    2 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |    2 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |    3 -
 sound/soc/qcom/sc7180.c                            |   40 +-
 sound/soc/qcom/sc7280.c                            |   34 +-
 sound/soc/qcom/sdm845.c                            |   32 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |    7 +-
 sound/soc/rockchip/rockchip_i2s.c                  |    2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |    2 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    4 +-
 sound/soc/rockchip/rockchip_rt5645.c               |   22 +-
 sound/soc/rockchip/rockchip_spdif.c                |    2 +-
 sound/soc/samsung/aries_wm8994.c                   |   10 +-
 sound/soc/samsung/i2s.c                            |    5 +-
 sound/soc/samsung/littlemill.c                     |   27 +-
 sound/soc/samsung/lowland.c                        |    8 +-
 sound/soc/samsung/midas_wm1811.c                   |   34 +-
 sound/soc/samsung/odroid.c                         |   15 +-
 sound/soc/samsung/pcm.c                            |   18 +-
 sound/soc/samsung/tm2_wm5110.c                     |   10 +-
 sound/soc/sh/rcar/adg.c                            |   68 +-
 sound/soc/sh/rcar/core.c                           |  175 +-
 sound/soc/sh/rcar/rsnd.h                           |    4 +
 sound/soc/soc-acpi.c                               |   73 +
 sound/soc/soc-core.c                               |  273 ++-
 sound/soc/soc-dai.c                                |   55 +-
 sound/soc/soc-dapm.c                               |    2 +
 sound/soc/soc-jack.c                               |    2 +-
 sound/soc/soc-topology.c                           |    6 +-
 sound/soc/sof/amd/Kconfig                          |   20 +-
 sound/soc/sof/amd/Makefile                         |    5 +-
 sound/soc/sof/amd/acp-common.c                     |    4 +
 sound/soc/sof/amd/acp-dsp-offset.h                 |    9 +-
 sound/soc/sof/amd/acp-ipc.c                        |   30 +
 sound/soc/sof/amd/acp-loader.c                     |   42 +-
 sound/soc/sof/amd/acp-probes.c                     |  147 ++
 sound/soc/sof/amd/acp.c                            |  106 +-
 sound/soc/sof/amd/acp.h                            |   35 +-
 sound/soc/sof/amd/pci-rmb.c                        |    2 +
 sound/soc/sof/amd/pci-rn.c                         |    2 +
 sound/soc/sof/amd/pci-vangogh.c                    |  105 +
 sound/soc/sof/amd/vangogh.c                        |  162 ++
 sound/soc/sof/intel/Kconfig                        |   16 +
 sound/soc/sof/intel/Makefile                       |    4 +-
 sound/soc/sof/intel/cnl.c                          |    2 +
 sound/soc/sof/intel/hda-dai-ops.c                  |  179 +-
 sound/soc/sof/intel/hda-dai.c                      |  211 +-
 sound/soc/sof/intel/hda-mlink.c                    |   45 +-
 sound/soc/sof/intel/hda-stream.c                   |   68 +-
 sound/soc/sof/intel/hda.c                          |  140 +-
 sound/soc/sof/intel/hda.h                          |   21 +
 sound/soc/sof/intel/icl.c                          |    1 +
 sound/soc/sof/intel/lnl.c                          |  188 ++
 sound/soc/sof/intel/mtl.c                          |   23 +-
 sound/soc/sof/intel/mtl.h                          |   22 +-
 sound/soc/sof/intel/pci-apl.c                      |    8 +-
 sound/soc/sof/intel/pci-cnl.c                      |   15 +-
 sound/soc/sof/intel/pci-icl.c                      |   12 +-
 sound/soc/sof/intel/pci-lnl.c                      |   71 +
 sound/soc/sof/intel/pci-mtl.c                      |    3 +-
 sound/soc/sof/intel/pci-skl.c                      |    6 +-
 sound/soc/sof/intel/pci-tgl.c                      |   45 +-
 sound/soc/sof/intel/pci-tng.c                      |    3 +-
 sound/soc/sof/intel/shim.h                         |    1 +
 sound/soc/sof/intel/tgl.c                          |    4 +
 sound/soc/sof/ipc3-dtrace.c                        |   12 +-
 sound/soc/sof/ipc3-pcm.c                           |   17 +
 sound/soc/sof/ipc3.c                               |    7 +-
 sound/soc/sof/ipc4-pcm.c                           |   21 +-
 sound/soc/sof/ipc4-topology.c                      |  167 +-
 sound/soc/sof/ipc4-topology.h                      |    4 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |   40 +-
 sound/soc/sof/sof-client-probes-ipc4.c             |    9 +
 sound/soc/sof/sof-client-probes.c                  |    7 +-
 sound/soc/sof/topology.c                           |   29 +-
 sound/soc/starfive/jh7110_tdm.c                    |   21 +-
 sound/soc/sti/sti_uniperif.c                       |    6 +-
 sound/soc/stm/stm32_i2s.c                          |    2 +-
 sound/soc/stm/stm32_sai_sub.c                      |   18 +-
 sound/soc/stm/stm32_spdifrx.c                      |    2 +-
 sound/soc/sunxi/sun4i-codec.c                      |    6 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   18 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    4 +-
 sound/soc/sunxi/sun50i-dmic.c                      |    2 +-
 sound/soc/tegra/tegra20_ac97.c                     |   13 +-
 sound/soc/tegra/tegra20_i2s.c                      |    2 +-
 sound/soc/tegra/tegra20_spdif.c                    |    2 +-
 sound/soc/tegra/tegra210_admaif.c                  |   12 +-
 sound/soc/tegra/tegra30_i2s.c                      |    2 +-
 sound/soc/ti/davinci-evm.c                         |   13 +-
 sound/soc/ti/davinci-i2s.c                         |   22 +-
 sound/soc/ti/davinci-mcasp.c                       |   27 +-
 sound/soc/ti/omap-dmic.c                           |   26 +-
 sound/soc/ti/omap-mcbsp.c                          |   32 +-
 sound/soc/ti/omap-mcpdm.c                          |   25 +-
 sound/soc/uniphier/aio-cpu.c                       |  161 +-
 sound/soc/uniphier/aio-ld11.c                      |   62 +-
 sound/soc/uniphier/aio-pxs2.c                      |   55 +-
 sound/soc/uniphier/aio.h                           |   10 +-
 sound/soc/ux500/ux500_msp_dai.c                    |    2 +-
 tools/arch/x86/include/asm/cpufeatures.h           |    2 +-
 tools/arch/x86/include/asm/msr-index.h             |    1 +
 tools/counter/Makefile                             |    3 +-
 tools/hv/vmbus_testing                             |    4 +-
 tools/objtool/arch/x86/decode.c                    |    5 +-
 tools/perf/arch/arm64/util/pmu.c                   |    7 +-
 tools/perf/arch/powerpc/util/skip-callchain-idx.c  |    4 +
 tools/perf/tests/parse-events.c                    |   12 +-
 .../tests/shell/test_uprobe_from_different_cu.sh   |    8 +-
 tools/perf/util/machine.c                          |    5 -
 tools/perf/util/parse-events.c                     |   58 +-
 tools/perf/util/pmu.c                              |   11 +
 tools/perf/util/pmu.h                              |    1 +
 tools/perf/util/pmus.c                             |   16 +-
 tools/perf/util/stat-display.c                     |    5 +
 tools/testing/kunit/configs/all_tests.config       |    5 +
 tools/testing/radix-tree/regression1.c             |    2 +-
 .../selftests/bpf/prog_tests/sockmap_listen.c      |   74 +-
 .../selftests/bpf/progs/test_sockmap_listen.c      |   14 +
 tools/testing/selftests/cgroup/test_kmem.c         |    4 +
 tools/testing/selftests/mm/ksm_tests.c             |    1 +
 tools/testing/selftests/net/fib_nexthops.sh        |   10 +
 .../testing/selftests/net/forwarding/bridge_mdb.sh |   59 +-
 .../selftests/net/forwarding/bridge_mdb_max.sh     |   19 +-
 tools/testing/selftests/net/forwarding/ethtool.sh  |    2 +
 .../net/forwarding/ethtool_extended_state.sh       |    2 +
 .../testing/selftests/net/forwarding/ethtool_mm.sh |   18 +-
 .../selftests/net/forwarding/hw_stats_l3_gre.sh    |    2 +
 .../net/forwarding/ip6_forward_instats_vrf.sh      |    2 +
 tools/testing/selftests/net/forwarding/lib.sh      |   17 +
 tools/testing/selftests/net/forwarding/settings    |    1 +
 .../testing/selftests/net/forwarding/tc_actions.sh |    6 +-
 .../testing/selftests/net/forwarding/tc_flower.sh  |    8 +-
 .../selftests/net/forwarding/tc_flower_l2_miss.sh  |   13 +-
 .../selftests/net/forwarding/tc_tunnel_key.sh      |    9 +-
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |    6 +-
 tools/testing/selftests/net/pmtu.sh                |   35 +
 tools/testing/selftests/net/so_incoming_cpu.c      |    2 +-
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |    2 -
 tools/testing/selftests/rseq/Makefile              |    4 +-
 tools/testing/selftests/rseq/rseq.c                |    2 +
 .../tc-testing/tc-tests/qdiscs/taprio.json         |   25 +
 tools/testing/vsock/Makefile                       |    2 +-
 1156 files changed, 30266 insertions(+), 8849 deletions(-)
 create mode 100644 Documentation/admin-guide/hw-vuln/gather_data_sampling.rst
 create mode 100644 Documentation/admin-guide/hw-vuln/srso.rst
 create mode 100644 Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/gtm601.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/max9892x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98925.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/option,gtm601.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-analog.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt
 delete mode 120000 arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
 create mode 100644 drivers/mfd/cs42l43-i2c.c
 create mode 100644 drivers/mfd/cs42l43-sdw.c
 create mode 100644 drivers/mfd/cs42l43.c
 create mode 100644 drivers/mfd/cs42l43.h
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs42l43.c
 rename include/{media/dvb_math.h => linux/int_log.h} (63%)
 create mode 100644 include/linux/mfd/cs42l43-regs.h
 create mode 100644 include/linux/mfd/cs42l43.h
 create mode 100644 include/sound/cs42l43.h
 delete mode 100644 include/sound/l3.h
 delete mode 100644 include/sound/uda134x.h
 rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (84%)
 create mode 100644 sound/pci/hda/cs35l56_hda.c
 create mode 100644 sound/pci/hda/cs35l56_hda.h
 create mode 100644 sound/pci/hda/cs35l56_hda_i2c.c
 create mode 100644 sound/pci/hda/cs35l56_hda_spi.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-common.c
 create mode 100644 sound/soc/codecs/audio-iio-aux.c
 create mode 100644 sound/soc/codecs/aw88261.c
 create mode 100644 sound/soc/codecs/aw88261.h
 create mode 100644 sound/soc/codecs/cs42l43-jack.c
 create mode 100644 sound/soc/codecs/cs42l43-sdw.c
 create mode 100644 sound/soc/codecs/cs42l43.c
 create mode 100644 sound/soc/codecs/cs42l43.h
 delete mode 100644 sound/soc/codecs/l3.c
 create mode 100644 sound/soc/codecs/rt1017-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt1017-sdca-sdw.h
 delete mode 100644 sound/soc/codecs/uda134x.c
 delete mode 100644 sound/soc/codecs/uda134x.h
 create mode 100644 sound/soc/intel/avs/boards/es8336.c
 create mode 100644 sound/soc/intel/avs/boards/rt5663.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs_amp.c
 create mode 100644 sound/soc/mediatek/mt7986/Makefile
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c
 create mode 100644 sound/soc/sof/amd/acp-probes.c
 create mode 100644 sound/soc/sof/amd/pci-vangogh.c
 create mode 100644 sound/soc/sof/amd/vangogh.c
 create mode 100644 sound/soc/sof/intel/lnl.c
 create mode 100644 sound/soc/sof/intel/pci-lnl.c
 create mode 100644 tools/testing/selftests/net/forwarding/settings
