Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F23B6395
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 16:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924D11671;
	Mon, 28 Jun 2021 16:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924D11671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624892163;
	bh=hjItT3NbbQvgZqjjDB04Bu+qeuQRp3JgZkXzj5jhH5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zvup8k2VTR3YRylhxVAYy0UEsuynuc3xyCyrtDVgiYTcJtpqhEqs4yLF4ak/DzH1s
	 uI0zCBztJW2QrRWRIW8JO94+ZiE7durM75AObG6ZlDESENcHF/0tdNt1oOSNDwmzYb
	 WT0DdhwALc3e0b+7RsMH/HzuqWZ2YRJqZr6QyHX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DE4F8012A;
	Mon, 28 Jun 2021 16:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9853F80229; Mon, 28 Jun 2021 16:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D037F80137
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 16:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D037F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W9OIm0ol"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C66B661C7F;
 Mon, 28 Jun 2021 14:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624892061;
 bh=hjItT3NbbQvgZqjjDB04Bu+qeuQRp3JgZkXzj5jhH5c=;
 h=From:To:Cc:Subject:Date:From;
 b=W9OIm0ol10MoZzxoHCN/TFcAWo7yIz6IFqwZ2PSI2CdP57j5RLNm517p9Xd3ij+26
 nz740ME3QN/fDpnc6zS2Cg/4QXnhbKdbFw3y9tewOrUibPnMut8S4YEtsaeKNud/mo
 SQXtM27ZBCrlnHcVhPwXtk8VjYRfCcFtzIsP+CosuKSchch04pRlOZtulvcI0+wfrP
 B4MtC9P0v+Uh2LY51qE4y61friTRqPJmPHssGevsRUFttmVQiqL3aoQWDO0la7tLmQ
 7ufho0+h/IDCqfJS8qCRHdqO2KNMLypUGb62b1zL2ER7BZ/RjDXxHhbG+8cs9ossFE
 1TX2ueoXrwx0g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC updates for v5.14
Date: Mon, 28 Jun 2021 15:53:42 +0100
Message-Id: <20210628145420.C66B661C7F@mail.kernel.org>
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

The following changes since commit 13311e74253fe64329390df80bed3f07314ddd61:

  Linux 5.13-rc7 (2021-06-20 15:03:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.14

for you to fetch changes up to 192664528154a84fab4e6d820f9cb2e2e0835544:

  Merge remote-tracking branch 'asoc/for-5.14' into asoc-next (2021-06-25 14:08:03 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.14

This release sees a nice new feature in the core from Morimoto-san,
support for automatic negotiation of DAI formats between the components
on the link.  Otherwise the big highlight was the merging of the Tegra
machine drivers into a single driver avoiding a bunch of duplication.

 - Support for automatic negotiation of DAI formats.
 - Accessory detection support for several Qualcomm parts.
 - Support for IEC958 control with hdmi-codec.
 - Merging of Tegra machine drivers into a single driver.
 - Support for AmLogic SM1 TOACODEC, Intel AlderLake-M, several NXP
   i.MX8 variants, NXP TFA1 and TDF9897, Rockchip RK817, Qualcomm
   Quinary MI2S, Texas Instruments TAS2505

----------------------------------------------------------------
Bard Liao (3):
      ASoC: rt5682-sdw: set regcache_cache_only false before reading RT5682_DEVICE_ID
      ASoC: rt711-sdca-sdw: add readable for SDW_SDCA_CTL() registers
      ASoC: rt711-sdca: handle mbq_regmap in rt711_sdca_io_init

Bertrand Jacquin (1):
      ASoC: snd-soc-lpass requires REGMAP_MMIO

Brent Lu (3):
      ASoC: Intel: maxim-common: support max98357a
      ASoC: Intel: add sof-cs42l42 machine driver
      ASoC: Intel: sof_rt5682: code refactor for max98357a

Charles Keepax (13):
      ASoC: cirrus: Add helper function for reading the device ID
      ASoC: cs35l32: Minor error paths fixups
      ASoC: cs35l33: Minor error paths fixups
      ASoC: cs35l34: Minor error paths fixups
      ASoC: cs35l35: Minor error paths fixups
      ASoC: cs35l35: Correct errata handling
      ASoC: cs42l42: Minor error paths fixups
      ASoC: cs42l73: Minor error paths fixups
      ASoC: cs43130: Minor error paths fixups
      ASoC: cs53l30: Minor error paths fixups
      ASoC: cs35l36: Remove unneeded variable initialisation
      ASoC: cs4265: Minor tidy up of error paths
      ASoC: cs42l52: Minor tidy up of error paths

Chris Morgan (4):
      mfd: Add Rockchip rk817 audio CODEC support
      ASoC: Add Rockchip rk817 audio CODEC support
      dt-bindings: Add Rockchip rk817 audio CODEC support
      ASoC: rk817: fix a warning in rk817_probe()

Christophe JAILLET (1):
      ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'

Claudius Heine (3):
      ASoC: tlv320aic32x4: add type to device private data struct
      ASoC: tlv320aic32x4: add support for TAS2505
      ASoC: tlv320aic32x4: dt-bindings: add TAS2505 to compatible

Codrin Ciubotariu (2):
      ASoC: atmel-i2s: Set symmetric sample bits
      ASoC: atmel-i2s: Fix usage of capture and playback at the same time

Colin Ian King (2):
      ASoC: rsnd: check for zero node count
      ASoC: rk817: remove redundant assignment to pointer node, add missing of_node_put

Dan Carpenter (1):
      ASoC: tegra: Fix a NULL vs IS_ERR() check

David Rhodes (1):
      ASoC: cs35l3x: Use neutral language in amp drivers

Derek Fang (1):
      ASoC: rt1019: Add non_legacy_dai_naming config

Dmitry Osipenko (4):
      ASoC: tegra: Set driver_name=tegra for all machine drivers
      ASoC: tegra: Unify ASoC machine drivers
      ASoC: tegra: Specify components string for each card
      ASoC: tegra: Squash utils into common machine driver

Flavio Suligoi (1):
      ASoC: fsi: fix spelling mistake

Gabriel David (4):
      ASoC: q6afe: dt-bindings: Add QUIN_MI2S_RX/TX
      ASoC: qdsp6: q6afe: Add Quinary MI2S ports
      ASoC: qdsp6: q6afe-dai: Add Quinary MI2S ports
      ASoC: qdsp6: q6routing: Add Quinary MI2S ports

Guido Günther (1):
      ASoC: simple-card: Fill in driver name

Gustavo A. R. Silva (1):
      ASoC: ti: davinci-mcasp: Fix fall-through warning for Clang

Gyeongtaek Lee (1):
      ASoC: soc-dai: fix up hw params only if it is needed

H. Nikolaus Schaller (1):
      ASoC: jz4740-i2s: fix function name

Jack Yu (1):
      ASoC: rt715-sdca: fix clock stop prepare timeout issue

Jaroslav Kysela (1):
      ASoC: soc-pcm: fix the return value in dpcm_apply_symmetry()

Jaska Uimonen (3):
      ASoC: topology: Add support for multiple kcontrol types to a widget
      ASoC: topology: Fix using uninitialized pointer
      ASoC: SOF: topology: fix assignment to use le32_to_cpu

Jiapeng Chong (5):
      ASoC: amd: renoir: Remove redundant assignment to pdm_ctrl and pdm_enable and pdm_dma_enable
      ASoC: rt286: Remove redundant assignment to d_len_code
      ASoC: rk817: Remove unneeded semicolon
      ASoC: codecs: Fix duplicate included sound/soc.h
      ASoC: hdmi-codec: make hdmi_codec_controls static

Kai Vehmanen (4):
      ASoC: SOF: Intel: pci-tgl: add ADL-M support
      ASoC: Intel: sof_sdw: use mach data for ADL RVP DMIC count
      ASoC: Intel: sof_sdw: remove hdac-hdmi support
      ASoC: Intel: skl_hda_dsp_generic: Update Kconfig documentation

Keyon Jie (1):
      ASoC: SOF: ops: print out the polling register

Kuninori Morimoto (39):
      ASoC: dt-bindings: renesas: rsnd: tidyup properties
      ASoC: rsnd: tidyup loop on rsnd_adg_clk_query()
      ASoC: rsnd: add null CLOCKIN support
      ASoC: rsnd: call unregister for null_hw when removed
      ASoC: rsnd: ignore runtime NULL case at rsnd_runtime_channel_original_with_params()
      ASoC: rsnd: attach SSIU when SSI was DMA mode
      ASoC: rsnd: check BUIF error everytime
      ASoC: rsnd: indicate unknown error at rsnd_dai_call()
      ASoC: rsnd: incidate irq error message
      ASoC: rsnd: add debugfs support
      ASoC: rsnd: protect mod->status
      ASoC: rsnd: implement BUSIF related code in ssiu.c
      ASoC: rsnd: tidyup rsnd_ssiu_busif_err_status_clear()
      ASoC: rsnd: tidyup rsnd_ssiu_busif_err_irq_ctrl()
      ASoC: rsnd: tidyup rsnd_parse_connect_common()
      ASoC: rsnd: tidyup rsnd_dma_request_channel()
      ASoC: rsnd: tidyup rsnd_parse_connect_xxx()
      ASoC: rsnd: adjust disabled module
      ASoC: rsnd: adg: supply __printf(x, y) formatting for dbg_msg()
      ASoC: rsnd: adg: tidyup rsnd_adg_get_clkin/out() parameter
      ASoC: rsnd: adg: use more simple method for null_clk
      ASoC: rsnd: adg: check return value for rsnd_adg_get_clkin/out()
      ASoC: rsnd: tidyup __rsnd_mod_xxx macro comments
      ASoC: soc-core: move snd_soc_runtime_set_dai_fmt() to upside
      ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
      ASoC: ak4613: add .auto_selectable_formats support
      ASoC: pcm3168a: add .auto_selectable_formats support
      ASoC: rsnd: add .auto_selectable_formats support
      ASoC: fsi: add .auto_selectable_formats support
      ASoC: hdmi-codec: add .auto_selectable_formats support
      ASoC: soc-core: don't use discriminatory terms on snd_soc_runtime_get_dai_fmt()
      ASoC: soc-core: add snd_soc_daifmt_clock_provider_from_bitmap()
      ASoC: soc-core: add snd_soc_daifmt_clock_provider_fliped()
      ASoC: soc-core: add snd_soc_daifmt_parse_format/clock_provider()
      ASoC: atmel: switch to use snd_soc_daifmt_parse_format/clock_provider()
      ASoC: fsl: switch to use snd_soc_daifmt_parse_format/clock_provider()
      ASoC: meson: switch to use snd_soc_daifmt_parse_format/clock_provider()
      ASoC: simple-card-utils: switch to use snd_soc_daifmt_parse_format/clock_provider()
      ASoC: soc-core: remove snd_soc_of_parse_daifmt()

Libin Yang (1):
      ASoC: Intel: sof_sdw: add SOF_RT715_DAI_ID_FIX for AlderLake

Lucas Tanure (5):
      ASoC: cs42l42: Add support for set_jack calls
      ASoC: cs42l42: Fix 1536000 Bit Clock instability
      ASoC: cs42l42: Add support for 2304000 Bit clock
      ASoC: cs42l42: Add support for 2400000 Bit clock
      ASoC: cs42l42: Check jack status before reporting button events

Marek Vasut (1):
      ASoC: sgtl5000: Add audio-graph-card port

Mark Brown (32):
      Merge existing fixes from asoc/for-5.13
      Merge series "ASoC: Intel: machine driver updates for 5.14" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: SOF: Intel: split Baytrail and Merrifield" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: cppcheck fixes of the week" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "Tidy up device ID reading on legacy Cirrus parts" from Charles Keepax <ckeepax@opensource.cirrus.com>:
      Merge series "PinePhone BT audio bringup" from Samuel Holland <samuel@sholland.org>:
      Merge series "ASoC: SOF/Intel: fix and remove Sparse warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: meson: g12a-toacodec: add support for SM1" from Neil Armstrong <narmstrong@baylibre.com>:
      Merge series "ASoC: rsnd: add D3 support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge branch 'for-5.13' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into asoc-5.14
      Merge series "ASoC: rsnd: adjust disabled module for R-Car D3" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: Constify snd_compress_ops" from Rikard Falkeborn <rikard.falkeborn@gmail.com>:
      Merge series "ASoC: rsnd: tidyup adg and header" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: codecs: wcd934x: add Headset and button detection support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge tag 'tb-mfd-asoc-v5.14-1' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into asoc-5.14
      Merge series "ASoC: adds new .auto_selectable_formats support" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge tag 'v5.13-rc3' into asoc-5.13
      ASoC: rt5645: Avoid upgrading static warnings to errors
      Merge tag 'asoc-hdmi-codec-improvements-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into asoc-5.14
      Merge series "ASoC: codecs: add wcd938x support" from Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
      Merge series "Unify NVIDIA Tegra ASoC machine drivers" from Dmitry Osipenko <digetx@gmail.com>:
      Merge series "ASoC: qdsp6: Add Quinary MI2S ports support" from Gabriel David <ultracoolguy@disroot.org>:
      Merge series "ASoC: stm32: Use devm_platform_get_and_ioremap_resource()" from Yang Yingliang <yangyingliang@huawei.com>:
      Merge series "ASoC: samsung: Use devm_platform_get_and_ioremap_resource()" from Yang Yingliang <yangyingliang@huawei.com>:
      Merge series "ASoC: sunxi: Use devm_platform_get_and_ioremap_resource()" from Yang Yingliang <yangyingliang@huawei.com>:
      Merge series "ASoC: tidyup snd_soc_of_parse_daifmt()" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
      Merge series "ASoC: fsl: Use devm_platform_get_and_ioremap_resource()" from Yang Yingliang <yangyingliang@huawei.com>:
      Merge series "ASoC: Intel: machine driver corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      Merge series "ASoC: tegra: Use devm_platform_get_and_ioremap_resource()" from Yang Yingliang <yangyingliang@huawei.com>:
      Merge series "ASoC: tlv320aic32x4: Add support for TAS2505" from Claudius Heine <ch@denx.de>:
      Merge remote-tracking branch 'asoc/for-5.13' into asoc-linus
      Merge remote-tracking branch 'asoc/for-5.14' into asoc-next

Martin Blumenstingl (1):
      ASoC: rt5640: Make codec selectable

Maxime Ripard (5):
      ALSA: doc: Clarify IEC958 controls iface
      ALSA: iec958: Split status creation and fill
      ASoC: hdmi-codec: Rework to support more controls
      ASoC: hdmi-codec: Add iec958 controls
      ASoC: hdmi-codec: Add a prepare hook

Nathan Chancellor (1):
      ASoC: q6dsp: Undo buggy warning fix

Neil Armstrong (2):
      ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
      ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC

Oder Chiou (1):
      ASoC: rt5682: Fix a problem with error handling in the io init function of the soundwire

Oleksij Rempel (1):
      ASoC: dt-bindings: Convert imx-audmux binding to json schema

Peter Ujfalusi (4):
      ASoC: SOF: Check desc->ops directly in acpi/pci/of probe functions
      ASoC: SOF: pci: No need to cast second time to save the desc
      ASoC: SOF: loader: Use snd_sof_dsp_block_read() instead sof_block_read()
      ASoC: SOF: Intel: hda: Remove conditions against CONFIG_PCI

Pierre-Louis Bossart (36):
      ASoC: SOF: Intel: byt: prepare split between Baytrail and Merrifield
      ASoC: SOF: Intel: move common ATOM stuff to module
      ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
      ASoC: Intel: boards: handle hda-dsp-common as a module
      ASoC: Intel: boards: create sof-maxim-common module
      ASoC: Intel: boards: remove .nonatomic for BE dailinks
      ASoC: codecs: mt6359-accdet: remove useless initialization
      ASoc: codecs: mt6359: remove useless initializations
      ASoC: codecs: rt1019: clarify expression
      ASoC: fsl: imx-pcm-rpmsg: remove useless initialization
      ASoC: SOF: Intel: hda: fix index used in inner loop
      ASoC: Intel: sof_cs42l42: shrink platform id below 20 characters
      ASoC: Intel: bxt_da7219_max98357a: shrink platform_id below 20 characters
      ASoC: SOF: ops: don't return void value
      ASoC: max98373-sdw: add missing memory allocation check
      ASoC: max98373-sdw: use first_hw_init flag on resume
      ASoC: rt1308-sdw: use first_hw_init flag on resume
      ASoC: rt1316-sdw: use first_hw_init flag on resume
      ASoC: rt5682-sdw: use first_hw_init flag on resume
      ASoC: rt700-sdw: use first_hw_init flag on resume
      ASoC: rt711-sdca-sdw: use first_hw_init flag on resume
      ASoC: rt711-sdw: use first_hw_init flag on resume
      ASoC: rt715-sdca-sdw: use first_hw_init flag on resume
      ASoC: rt715-sdw: use first_hw_init flag on resume
      soundwire: export sdw_update() and sdw_update_no_pm()
      ASoC: rt700-sdw: fix race condition on system suspend
      ASoC: rt711-sdw: fix race condition on system suspend
      ASoC: rt5682-sdw: fix race condition on system suspend
      ASoC: rt711-sdca-sdw: fix race condition on system suspend
      ASoC: Intel: sof_rt5682: shrink platform_id names below 20 characters
      ASoC: Intel: glk_rt5682_max98357a: shrink platform_id below 20 characters
      ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters
      ASoC: Intel: sof_da7219_max98373: shrink platform_id below 20 characters
      ASoC: Intel: sof_sdw: fix signed/unsigned warning
      ASoC: Intel: soc-acpi: add ull suffix for SoundWire _ADR values
      ASoC: Intel: use MODULE_DEVICE_TABLE with platform_device_id tables

Pu Lehui (1):
      ASoC: codecs: wcd938x: constify static struct snd_soc_dai_ops

Rafał Miłecki (1):
      ASoC: wm8750: convert to the json-schema

Ranjani Sridharan (2):
      ASoC: SOF: Intel: hda: clean up hda_dsp_dump()
      ASoC: SOF: Intel: hda: don't print ROM status if cl_dsp_init() fails

Richard Fitzgerald (2):
      ASoC: cs42l42: Use device_property API instead of of_property
      ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK

Rikard Falkeborn (5):
      ASoC: cs47125: Constify static struct snd_compress_ops
      ASoC: wm5102: Constify static struct snd_compress_ops
      ASoC: wm5110: Constify static struct snd_compress_ops
      ASoC: qcom: q6asm-dai: Constify static struct snd_compress_ops
      ASoC: SOF: Intel: Constify sof_probe_compressed_ops

Samuel Holland (1):
      ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells

Shaokun Zhang (1):
      ASoC: sigmadsp: Remove the repeated declaration

Shengjiu Wang (9):
      ASoC: imx-pcm-rpmsg: Fix warning of incorrect type in assignment
      ASoC: dt-bindings: imx-card: Add binding doc for imx sound card
      ASoC: imx-card: Add imx-card machine driver
      ASoC: fsl_spdif: Fix error handler with pm_runtime_enable
      ASoC: dt-bindings: fsl,spdif: Add compatible string for imx8ulp
      ASoC: dt-bindings: fsl-sai: Add compatible string for imx8mm/8mn/8mp/8ulp
      ASoC: fsl_xcvr: disable all interrupts when suspend happens
      ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer probe
      ASoC: fsl_spdif: Fix unexpected interrupt after suspend

Shuming Fan (1):
      ASoC: rt711: add two jack detection modes

Simon Trimmer (2):
      ASoC: wm_adsp: mark more data structures with the const qualifier
      ASoC: wm2200: remove include of wmfw.h

Srinivas Kandagatla (17):
      ASoC: dt-bindings: wcd934x: add bindings for Headset Button detection
      ASoC: codecs: wcd: add multi button Headset detection support
      ASoC: codecs: wcd934x: add mbhc support
      ASoC: qcom: sdm845: add jack support for WCD934x
      ASoC: dt-bindings: wcd938x: add bindings for wcd938x
      ASoC: codecs: wcd-clsh: add new version support
      ASoC: codecs: wcd938x: add basic driver
      ASoC: dt-bindings: wcd938x-sdw: add bindings for wcd938x-sdw
      ASoC: codecs: wcd938x-sdw: add SoundWire driver
      ASoC: codecs: wcd938x: add basic controls
      ASoC: codecs: wcd938x: add playback dapm widgets
      ASoC: codecs: wcd938x: add capture dapm widgets
      ASoC: codecs: wcd938x: add audio routing and Kconfig
      ASoC: codecs: wcd938x: remove incorrect module interdependency
      ASoC: codecs: wcd938x: fix unused variable warning
      ASoC: codecs: wcd938x: fix uninitialized symbol warnings
      ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as volatile and readable

Srinivasa Rao Mandadapu (2):
      ASoC: qcom: Fix for DMA interrupt clear reg overwriting
      ASoC: qcom: Add four speaker support on MI2S secondary

Stephan Gerhold (2):
      ASoC: dt-bindings: codecs: Add bindings for nxp, tfa989x
      ASoC: codecs: Add driver for NXP/Goodix TFA989x (TFA1) amplifiers

Stephen Boyd (2):
      ASoC: rt5682: Disable irq on shutdown
      ASoC: rt5682: Implement remove callback

Tan Zhongjun (2):
      ASoC: fsl_easrc: Remove superfluous error message around platform_get_irq()
      ASoC: fsl_spdif: Remove superfluous error message around platform_get_irq()

Tang Bin (1):
      ASoc: Fix unused define in jz4740-i2s.h

Timur Tabi (1):
      MAINTAINERS: remove Timur Tabi from Freescale SOC sound drivers

Tom Rix (1):
      ASoC: codecs: lpass-wsa-macro: handle unexpected input

Vamshi Krishna Gopal (4):
      ASoC: Intel: soc-acpi: add entries for i2s machines in ADL match table
      ASoC: Intel: boards: add support for adl boards in sof-rt5682
      ASoC: Intel: common: Add entries for sdw codecs in ADL match table
      ASoC: Intel: sof_sdw: add quirk support for Brya and BT-offload

Vincent Knecht (4):
      ASoC: dt-bindings: nxp,tfa989x: Add tfa9897 support
      ASoC: codecs: tfa989x: Add support for tfa9897
      ASoC: dt-bindings: nxp, tfa989x: Add vddd-supply property
      ASoC: codecs: tfa989x: Add support for optional vddd-supply

Viorel Suman (1):
      ASoC: fsl_spdif: add support for enabling raw capture mode

Vitaly Rodionov (2):
      ASoC: cs42l42: Add support for ACPI table match entry
      ASoC: cs42l42: make HSBIAS_SENSE_EN optional

Wan Jiabing (3):
      ASoC: codecs: lpass-rx-macro: Remove unneeded semicolon
      ASoC: fsl_xcvr: Remove unneeded semicolon
      ASoC: remove unneeded semicolons in wcd934x.c

Wei Yongjun (2):
      ASoC: imx-card: Make some symbols static
      ASoC: rk817: Constify static struct snd_soc_dai_ops

Yang Li (3):
      ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
      ASoC: codecs: wcd: Remove unneeded semicolon
      ASoC: codecs: wcd938x: fix boolreturn.cocci warning

Yang Yingliang (52):
      ASoC: rk3328: fix missing clk_disable_unprepare() on error in rk3328_platform_probe()
      ASoC: hisilicon: fix missing clk_disable_unprepare() on error in hi6210_i2s_startup()
      ASoC: atmel: sam9x5_wm8731: use devm_snd_soc_register_card()
      ASoC: imx-audio-rpmsg: use module_rpmsg_driver to simplify the code
      ASoC: fsl: imx-es8328: use devm_snd_soc_register_card()
      ASoC: mchp-i2s-mcc: Use devm_platform_get_and_ioremap_resource()
      ASoC: atmel-classd: Use devm_platform_get_and_ioremap_resource()
      ASoC: axi-spdif: Use devm_platform_get_and_ioremap_resource()
      ASoC: axi-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: atmel-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: bcm: cygnus_ssp: Use devm_platform_ioremap_resource_byname()
      ASoC: atmel-pdmic: Use devm_platform_get_and_ioremap_resource()
      ASoC: dwc: dwc-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: img-i2s-in: Use devm_platform_get_and_ioremap_resource()
      ASoC: img-i2s-out: Use devm_platform_get_and_ioremap_resource()
      ASoC: img-parallel-out: Use devm_platform_get_and_ioremap_resource()
      ASoC: img-spdif-in: Use devm_platform_get_and_ioremap_resource()
      ASoC: img-spdif-out: Use devm_platform_get_and_ioremap_resource()
      ASoC: jz4740-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: hisilicon: Use devm_platform_get_and_ioremap_resource()
      ASoC: rockchip: i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: rockchip: pdm: Use devm_platform_get_and_ioremap_resource()
      ASoC: rockchip: spdif: Use devm_platform_get_and_ioremap_resource()
      ASoC: stm32: i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: stm32: sai: Use devm_platform_get_and_ioremap_resource()
      ASoC: stm32: spdifrx: Use devm_platform_get_and_ioremap_resource()
      ASoC: sti: sti_uniperif: Use devm_platform_get_and_ioremap_resource()
      ASoC: sprd: Use devm_platform_get_and_ioremap_resource()
      ASoC: spear: spdif_out: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_asrc: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_aud2htx: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_easrc: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_esai: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_micfil: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_sai: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_spdif: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_ssi: Use devm_platform_get_and_ioremap_resource()
      ASoC: fsl_xcvr: check return value after calling platform_get_resource_byname()
      ASoC: sunxi: sun4i-codec: Use devm_platform_get_and_ioremap_resource()
      ASoC: sun4i-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: sunxi: sun4i-spdif: Use devm_platform_get_and_ioremap_resource()
      ASoC: samsung: i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: samsung: pcm: Use devm_platform_get_and_ioremap_resource()
      ASoC: samsung: s3c2412-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: samsung: s3c24xx-i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: qcom: apq8016_sbc: Use devm_platform_get_and_ioremap_resource()
      ASoC: qcom: lpass-cpu: Use devm_platform_get_and_ioremap_resource()
      ASoC: SOF: imx: Add missing of_node_put() in imx8_probe()
      ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
      ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
      ASoC: tegra: tegra210_admaif: Use devm_platform_get_and_ioremap_resource()
      ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()

Yong Zhi (3):
      ASoC: Intel: Boards: tgl_max98373: Add BT offload support
      ASoC: Intel: sof_sdw: add support for Bluetooth offload
      ASoC: Intel: sof_rt5682: Enable Bluetooth offload on tgl and adl

YueHaibing (8):
      ASoC: soc-core: use DEVICE_ATTR_RO macro
      ASoC: tlv320aic26: use DEVICE_ATTR_RW macro
      ASoC: cs42l56: use DEVICE_ATTR_WO macro
      ASoC: wm8962: Use DEVICE_ATTR_WO macro
      ASoC: cs43130: Use DEVICE_ATTR_RO macro
      ASoC: cs42l52: use DEVICE_ATTR_WO macro
      ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
      ASoC: Intel: Skylake: use DEVICE_ATTR_RO macro

Yufen Yu (1):
      ASoC: img: Fix PM reference leak in img_i2s_in_probe()

Zhen Lei (4):
      ASoC: mediatek: mt8192: Delete a redundant condition branch
      ASoC: soc-core: Fix the error return code in snd_soc_of_parse_audio_routing()
      ASoC: Intel: bdw-rt5677: remove unnecessary oom message
      ASoC: fsl: remove unnecessary oom message

Zou Wei (2):
      ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
      ASoC: imx-rpmsg: fix platform_no_drv_owner.cocci warnings

 Documentation/devicetree/bindings/mfd/rk808.txt    |  188 +
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml  |    8 +-
 .../devicetree/bindings/sound/cs42l42.txt          |    7 +
 .../devicetree/bindings/sound/fsl,spdif.yaml       |    1 +
 .../devicetree/bindings/sound/fsl-sai.txt          |    6 +-
 .../devicetree/bindings/sound/imx-audio-card.yaml  |  122 +
 .../devicetree/bindings/sound/imx-audmux.txt       |   28 -
 .../devicetree/bindings/sound/imx-audmux.yaml      |  119 +
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |   58 +
 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |   30 +
 .../bindings/sound/qcom,wcd938x-sdw.yaml           |   70 +
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |  146 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |   10 +-
 .../devicetree/bindings/sound/sgtl5000.yaml        |    4 +
 .../devicetree/bindings/sound/tlv320aic32x4.txt    |    1 +
 Documentation/devicetree/bindings/sound/wm8750.txt |   18 -
 .../devicetree/bindings/sound/wm8750.yaml          |   42 +
 .../sound/kernel-api/writing-an-alsa-driver.rst    |   13 +-
 MAINTAINERS                                        |    8 +-
 drivers/mfd/rk808.c                                |   81 +
 drivers/soundwire/bus.c                            |   17 +-
 drivers/soundwire/bus.h                            |   13 -
 include/dt-bindings/sound/qcom,q6afe.h             |    2 +
 include/linux/mfd/rk808.h                          |   81 +
 include/linux/mfd/wcd934x/registers.h              |   57 +
 include/linux/soundwire/sdw.h                      |    3 +
 include/sound/hdmi-codec.h                         |   12 +-
 include/sound/pcm_iec958.h                         |    8 +
 include/sound/soc-dai.h                            |   55 +
 include/sound/soc-topology.h                       |    2 +-
 include/sound/soc.h                                |   21 +-
 sound/core/pcm_iec958.c                            |  174 +-
 sound/soc/adi/axi-i2s.c                            |    3 +-
 sound/soc/adi/axi-spdif.c                          |    3 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    4 -
 sound/soc/atmel/atmel-classd.c                     |    3 +-
 sound/soc/atmel/atmel-i2s.c                        |   38 +-
 sound/soc/atmel/atmel-pdmic.c                      |    3 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |    3 +-
 sound/soc/atmel/mikroe-proto.c                     |    9 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |    3 +-
 sound/soc/bcm/cygnus-ssp.c                         |    7 +-
 sound/soc/codecs/Kconfig                           |   41 +-
 sound/soc/codecs/Makefile                          |   10 +
 sound/soc/codecs/ak4613.c                          |   11 +
 sound/soc/codecs/cirrus_legacy.h                   |   21 +
 sound/soc/codecs/cs35l32.c                         |   34 +-
 sound/soc/codecs/cs35l33.c                         |   15 +-
 sound/soc/codecs/cs35l34.c                         |   39 +-
 sound/soc/codecs/cs35l35.c                         |   37 +-
 sound/soc/codecs/cs35l35.h                         |    3 +-
 sound/soc/codecs/cs35l36.c                         |   18 +-
 sound/soc/codecs/cs4265.c                          |   10 +-
 sound/soc/codecs/cs42l42.c                         |  198 +-
 sound/soc/codecs/cs42l42.h                         |    7 +-
 sound/soc/codecs/cs42l52.c                         |   19 +-
 sound/soc/codecs/cs42l56.c                         |    7 +-
 sound/soc/codecs/cs42l73.c                         |   30 +-
 sound/soc/codecs/cs43130.c                         |   55 +-
 sound/soc/codecs/cs47l24.c                         |    2 +-
 sound/soc/codecs/cs53l30.c                         |   22 +-
 sound/soc/codecs/hdmi-codec.c                      |  238 +-
 sound/soc/codecs/lpass-rx-macro.c                  |    2 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |    4 +
 sound/soc/codecs/max98373-sdw.c                    |   14 +-
 sound/soc/codecs/max98373.h                        |    2 +-
 sound/soc/codecs/mt6359-accdet.c                   |    2 +-
 sound/soc/codecs/mt6359.c                          |    2 +-
 sound/soc/codecs/pcm3168a.c                        |   26 +
 sound/soc/codecs/rk3328_codec.c                    |   28 +-
 sound/soc/codecs/rk817_codec.c                     |  541 +++
 sound/soc/codecs/rt1019.c                          |    5 +-
 sound/soc/codecs/rt1308-sdw.c                      |    2 +-
 sound/soc/codecs/rt1316-sdw.c                      |    2 +-
 sound/soc/codecs/rt286.c                           |    1 -
 sound/soc/codecs/rt5645.c                          |   49 +-
 sound/soc/codecs/rt5682-i2c.c                      |   12 +
 sound/soc/codecs/rt5682-sdw.c                      |   57 +-
 sound/soc/codecs/rt5682.h                          |    2 +
 sound/soc/codecs/rt700-sdw.c                       |   36 +-
 sound/soc/codecs/rt700.c                           |    4 +
 sound/soc/codecs/rt700.h                           |    2 +
 sound/soc/codecs/rt711-sdca-sdw.c                  |   58 +-
 sound/soc/codecs/rt711-sdca.c                      |    8 +
 sound/soc/codecs/rt711-sdca.h                      |    2 +
 sound/soc/codecs/rt711-sdw.c                       |   36 +-
 sound/soc/codecs/rt711-sdw.h                       |    2 +
 sound/soc/codecs/rt711.c                           |   34 +
 sound/soc/codecs/rt711.h                           |   31 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |    3 +-
 sound/soc/codecs/rt715-sdca-sdw.h                  |    1 +
 sound/soc/codecs/rt715-sdca.c                      |    9 +-
 sound/soc/codecs/rt715-sdca.h                      |    3 +-
 sound/soc/codecs/rt715-sdw.c                       |    2 +-
 sound/soc/codecs/sigmadsp.h                        |    1 -
 sound/soc/codecs/tfa989x.c                         |  357 ++
 sound/soc/codecs/tlv320aic26.c                     |   12 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |   22 +-
 sound/soc/codecs/tlv320aic32x4-spi.c               |   23 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  139 +-
 sound/soc/codecs/tlv320aic32x4.h                   |   10 +
 sound/soc/codecs/wcd-clsh-v2.c                     |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                     |   16 +
 sound/soc/codecs/wcd-mbhc-v2.c                     | 1475 ++++++++
 sound/soc/codecs/wcd-mbhc-v2.h                     |  340 ++
 sound/soc/codecs/wcd934x.c                         |  884 ++++-
 sound/soc/codecs/wcd938x-sdw.c                     |  320 ++
 sound/soc/codecs/wcd938x.c                         | 3737 ++++++++++++++++++++
 sound/soc/codecs/wcd938x.h                         |  718 ++++
 sound/soc/codecs/wm2200.c                          |    1 -
 sound/soc/codecs/wm5102.c                          |    2 +-
 sound/soc/codecs/wm5110.c                          |    2 +-
 sound/soc/codecs/wm8962.c                          |    7 +-
 sound/soc/codecs/wm_adsp.c                         |   18 +-
 sound/soc/codecs/wm_adsp.h                         |    2 +-
 sound/soc/dwc/dwc-i2s.c                            |    3 +-
 sound/soc/fsl/Kconfig                              |   13 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl-asoc-card.c                      |    9 +-
 sound/soc/fsl/fsl_asrc.c                           |    3 +-
 sound/soc/fsl/fsl_aud2htx.c                        |    3 +-
 sound/soc/fsl/fsl_easrc.c                          |    7 +-
 sound/soc/fsl/fsl_esai.c                           |    3 +-
 sound/soc/fsl/fsl_micfil.c                         |    3 +-
 sound/soc/fsl/fsl_sai.c                            |    3 +-
 sound/soc/fsl/fsl_spdif.c                          |   97 +-
 sound/soc/fsl/fsl_spdif.h                          |    1 +
 sound/soc/fsl/fsl_ssi.c                            |    3 +-
 sound/soc/fsl/fsl_xcvr.c                           |   16 +-
 sound/soc/fsl/imx-audio-rpmsg.c                    |   12 +-
 sound/soc/fsl/imx-audmix.c                         |    4 +-
 sound/soc/fsl/imx-card.c                           |  844 +++++
 sound/soc/fsl/imx-es8328.c                         |   12 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |    6 +-
 sound/soc/fsl/imx-pcm-rpmsg.h                      |    4 +-
 sound/soc/fsl/imx-rpmsg.c                          |    1 -
 sound/soc/generic/simple-card-utils.c              |   16 +-
 sound/soc/generic/simple-card.c                    |    1 +
 sound/soc/hisilicon/hi6210-i2s.c                   |   17 +-
 sound/soc/img/img-i2s-in.c                         |    5 +-
 sound/soc/img/img-i2s-out.c                        |    3 +-
 sound/soc/img/img-parallel-out.c                   |    3 +-
 sound/soc/img/img-spdif-in.c                       |    3 +-
 sound/soc/img/img-spdif-out.c                      |    3 +-
 sound/soc/intel/boards/Kconfig                     |   43 +-
 sound/soc/intel/boards/Makefile                    |   30 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    4 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   11 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    4 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |    1 -
 sound/soc/intel/boards/bytcht_da7213.c             |    1 -
 sound/soc/intel/boards/bytcht_es8316.c             |    1 -
 sound/soc/intel/boards/bytcht_nocodec.c            |    1 -
 sound/soc/intel/boards/bytcr_rt5640.c              |    1 -
 sound/soc/intel/boards/bytcr_rt5651.c              |    1 -
 sound/soc/intel/boards/bytcr_wm5102.c              |    1 -
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    1 -
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    1 -
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |    1 +
 sound/soc/intel/boards/ehl_rt5660.c                |    4 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |    5 +-
 sound/soc/intel/boards/hda_dsp_common.c            |    5 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |    4 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |    5 +-
 sound/soc/intel/boards/kbl_rt5660.c                |    2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |    3 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |    2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    1 +
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |    3 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |    3 +-
 sound/soc/intel/boards/skl_rt286.c                 |    3 +-
 sound/soc/intel/boards/sof_cs42l42.c               |  508 +++
 sound/soc/intel/boards/sof_da7219_max98373.c       |    8 +-
 sound/soc/intel/boards/sof_maxim_common.c          |   84 +-
 sound/soc/intel/boards/sof_maxim_common.h          |   14 +-
 sound/soc/intel/boards/sof_pcm512x.c               |    2 +-
 sound/soc/intel/boards/sof_rt5682.c                |  132 +-
 sound/soc/intel/boards/sof_sdw.c                   |   74 +-
 sound/soc/intel/boards/sof_sdw_common.h            |    9 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c              |   37 +-
 sound/soc/intel/boards/sof_sdw_max98373.c          |    4 +-
 sound/soc/intel/boards/sof_wm8804.c                |    1 -
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   95 +-
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   22 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c  |   14 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |   12 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |    6 +-
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c  |    2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   38 +-
 sound/soc/intel/skylake/skl-nhlt.c                 |    6 +-
 sound/soc/jz4740/jz4740-i2s.c                      |    7 +-
 sound/soc/jz4740/jz4740-i2s.h                      |    2 -
 sound/soc/mediatek/common/mtk-btcvsd.c             |   24 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c        |    2 -
 sound/soc/meson/g12a-toacodec.c                    |  143 +-
 sound/soc/meson/meson-card-utils.c                 |    6 +-
 sound/soc/qcom/apq8016_sbc.c                       |    7 +-
 sound/soc/qcom/lpass-cpu.c                         |   49 +-
 sound/soc/qcom/lpass-platform.c                    |   12 +-
 sound/soc/qcom/lpass-sc7180.c                      |    1 +
 sound/soc/qcom/lpass.h                             |    2 +
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   41 +
 sound/soc/qcom/qdsp6/q6afe.c                       |    8 +
 sound/soc/qcom/qdsp6/q6afe.h                       |    2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    2 +-
 sound/soc/qcom/qdsp6/q6routing.c                   |   11 +
 sound/soc/qcom/sdm845.c                            |    8 +
 sound/soc/rockchip/rockchip_i2s.c                  |    3 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    3 +-
 sound/soc/rockchip/rockchip_spdif.c                |    3 +-
 sound/soc/samsung/i2s.c                            |    3 +-
 sound/soc/samsung/pcm.c                            |    3 +-
 sound/soc/samsung/s3c2412-i2s.c                    |    3 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |    3 +-
 sound/soc/sh/fsi.c                                 |   17 +-
 sound/soc/sh/rcar/Makefile                         |    2 +-
 sound/soc/sh/rcar/adg.c                            |  180 +-
 sound/soc/sh/rcar/cmd.c                            |   14 +
 sound/soc/sh/rcar/core.c                           |  154 +-
 sound/soc/sh/rcar/ctu.c                            |   14 +
 sound/soc/sh/rcar/debugfs.c                        |   96 +
 sound/soc/sh/rcar/dma.c                            |   39 +-
 sound/soc/sh/rcar/dvc.c                            |   16 +-
 sound/soc/sh/rcar/gen.c                            |    9 +
 sound/soc/sh/rcar/mix.c                            |   14 +
 sound/soc/sh/rcar/rsnd.h                           |   75 +-
 sound/soc/sh/rcar/src.c                            |   32 +-
 sound/soc/sh/rcar/ssi.c                            |  160 +-
 sound/soc/sh/rcar/ssiu.c                           |  147 +-
 sound/soc/soc-core.c                               |  377 +-
 sound/soc/soc-dai.c                                |   76 +-
 sound/soc/soc-pcm.c                                |    2 +-
 sound/soc/soc-topology.c                           |  466 ++-
 sound/soc/soc-utils.c                              |   29 +
 sound/soc/sof/compress.c                           |    2 +-
 sound/soc/sof/compress.h                           |    2 +-
 sound/soc/sof/imx/imx8.c                           |    1 +
 sound/soc/sof/intel/Makefile                       |    5 +-
 sound/soc/sof/intel/atom.c                         |  463 +++
 sound/soc/sof/intel/atom.h                         |   74 +
 sound/soc/sof/intel/byt.c                          |  768 +---
 sound/soc/sof/intel/hda-loader.c                   |    5 -
 sound/soc/sof/intel/hda.c                          |   27 +-
 sound/soc/sof/intel/pci-tgl.c                      |    2 +
 sound/soc/sof/intel/pci-tng.c                      |  171 +-
 sound/soc/sof/loader.c                             |    2 +-
 sound/soc/sof/ops.h                                |   10 +-
 sound/soc/sof/sof-acpi-dev.c                       |    5 +-
 sound/soc/sof/sof-of-dev.c                         |    5 +-
 sound/soc/sof/sof-pci-dev.c                        |    7 +-
 sound/soc/sof/topology.c                           |   17 +-
 sound/soc/spear/spdif_out.c                        |    3 +-
 sound/soc/sprd/sprd-mcdt.c                         |    3 +-
 sound/soc/sti/sti_uniperif.c                       |   12 +-
 sound/soc/stm/stm32_i2s.c                          |    3 +-
 sound/soc/stm/stm32_sai_sub.c                      |    3 +-
 sound/soc/stm/stm32_spdifrx.c                      |    3 +-
 sound/soc/sunxi/sun4i-codec.c                      |    3 +-
 sound/soc/sunxi/sun4i-i2s.c                        |    3 +-
 sound/soc/sunxi/sun4i-spdif.c                      |    3 +-
 sound/soc/tegra/Kconfig                            |   12 +
 sound/soc/tegra/Makefile                           |   19 +-
 sound/soc/tegra/tegra20_i2s.c                      |    3 +-
 sound/soc/tegra/tegra20_spdif.c                    |    3 +-
 sound/soc/tegra/tegra210_admaif.c                  |    4 +-
 sound/soc/tegra/tegra30_ahub.c                     |    3 +-
 sound/soc/tegra/tegra_alc5632.c                    |  259 --
 sound/soc/tegra/tegra_asoc_machine.c               |  854 +++++
 sound/soc/tegra/tegra_asoc_machine.h               |   49 +
 sound/soc/tegra/tegra_asoc_utils.c                 |  225 --
 sound/soc/tegra/tegra_asoc_utils.h                 |   38 -
 sound/soc/tegra/tegra_max98090.c                   |  276 --
 sound/soc/tegra/tegra_rt5640.c                     |  222 --
 sound/soc/tegra/tegra_rt5677.c                     |  324 --
 sound/soc/tegra/tegra_sgtl5000.c                   |  211 --
 sound/soc/tegra/tegra_wm8753.c                     |  185 -
 sound/soc/tegra/tegra_wm8903.c                     |  351 +-
 sound/soc/tegra/tegra_wm9712.c                     |  166 -
 sound/soc/tegra/trimslice.c                        |  172 -
 sound/soc/ti/davinci-mcasp.c                       |    1 +
 sound/soc/ti/omap-mcbsp.c                          |    2 +-
 283 files changed, 16600 insertions(+), 4676 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-card.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.txt
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8750.txt
 create mode 100644 Documentation/devicetree/bindings/sound/wm8750.yaml
 create mode 100644 sound/soc/codecs/cirrus_legacy.h
 create mode 100644 sound/soc/codecs/rk817_codec.c
 create mode 100644 sound/soc/codecs/tfa989x.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.h
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h
 create mode 100644 sound/soc/fsl/imx-card.c
 create mode 100644 sound/soc/intel/boards/sof_cs42l42.c
 create mode 100644 sound/soc/sh/rcar/debugfs.c
 create mode 100644 sound/soc/sof/intel/atom.c
 create mode 100644 sound/soc/sof/intel/atom.h
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.c
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c
