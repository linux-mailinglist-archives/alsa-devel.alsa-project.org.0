Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D01586AFF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 14:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6627F844;
	Mon,  1 Aug 2022 14:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6627F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659357697;
	bh=M0F1x94vcEYeCtEikPvxwWyjXzliBowYYoorAFdZGvs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kj9o0VEmLEp5myGGkp+6Aj0pgQk0lqTDpOJUXtTWaPmkyo80PNqOh+tjciij351lr
	 7PRnBqXKh94LDfeQhaLxZCHe7YI5aAk234KQ4YXz2BRa6ClI+lQHHccxxDe3BGggGL
	 7us16/hFLIjE1IqNYyJ2VWfyWsOU4gb9peIFRRSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4CC7F80246;
	Mon,  1 Aug 2022 14:40:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862C7F8023B; Mon,  1 Aug 2022 14:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64680F80139
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 14:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64680F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DxcmfSFs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 013ACB81190;
 Mon,  1 Aug 2022 12:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00C1C433D6;
 Mon,  1 Aug 2022 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659357628;
 bh=M0F1x94vcEYeCtEikPvxwWyjXzliBowYYoorAFdZGvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DxcmfSFsujpT2AEozc1UriJPsGkb7cT22/LRHCgnXGeDOWXd0Vs1YQczaFwJRGSpS
 5B0mM6ogGtIT8EjbSHu5PQ7x4h53J4aYenFyEHbSoFpM2NaCT0CPY96gwHGPkfxi9E
 SSgwWeDeVj343djb/cCMP1QwCJdwNlqA9pIB5uUWMt2aefozwTR03itW4XHndtf3TS
 7WpnBi3HD30XjFceg/dVd+eioD9WY39mDz1ErUxw+eI4c+q03jEXTZOYSwo7PLUNMz
 aoJ8beN4Af8hTgX6dWCqiO2mtMCMhg8GD/vn/q7JOH4lz+VZpvdi9FFDj8SHaeubgD
 09nFHDJGN7jYw==
Date: Mon, 1 Aug 2022 13:40:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC updates for v5.20-2
Message-ID: <YufJuOFztRhfIyuD@sirena.org.uk>
References: <20220801123734.29C86C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+3yaWUI6Cwc8KFPI"
Content-Disposition: inline
In-Reply-To: <20220801123734.29C86C433C1@smtp.kernel.org>
X-Cookie: Dieters live life in the fasting lane.
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


--+3yaWUI6Cwc8KFPI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2022 at 01:37:20PM +0100, Mark Brown wrote:
> The following changes since commit 1e347f861da8ddb17e1d1b3113cb6c188e0de3=
e5:
>=20
>   ASoC: rockchip-i2s: Undo BCLK pinctrl changes (2022-07-14 13:25:52 +010=
0)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-v5.20-2
>=20
> for you to fetch changes up to 40d060b8158e26438398bf1132925f666e3b6480:
>=20
>   ASoC: q6asm: use kcalloc() instead of kzalloc() (2022-07-28 11:59:10 +0=
100)
>=20
> ----------------------------------------------------------------
> ASoC: More updates for v5.20
>=20
> More updates that came in since the last pull request I sent, a series
> of driver specific changes:
>=20
>  - Support for AMD RPL, some Intel platforms and Mediatek MT8186.

=2E..and against my prior v5.20 pull request:

The following changes since commit 7fb72b7bf167a8047204d30e0e8affe6023363d9:

  ASoC: Merge up revert of v5.19 version of the rockchip BCLK management (2=
022-07-14 16:42:29 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.20-2

for you to fetch changes up to 40d060b8158e26438398bf1132925f666e3b6480:

  ASoC: q6asm: use kcalloc() instead of kzalloc() (2022-07-28 11:59:10 +010=
0)

----------------------------------------------------------------
ASoC: More updates for v5.20

More updates that came in since the last pull request I sent, a series
of driver specific changes:

 - Support for AMD RPL, some Intel platforms and Mediatek MT8186.

----------------------------------------------------------------
Aidan MacDonald (1):
      ASoC: jz4740-i2s: Remove unused 'mem' resource

Amadeusz S=C5=82awi=C5=84ski (2):
      ASoC: Makefile: Fix simultaneous build of KUNIT tests
      ASoC: Intel: avs: Use lookup table to create modules

Andrey Turkin (2):
      ASoC: Intel: sof_es8336: Fix GPIO quirks set via module option
      ASoC: Intel: sof_es8336: ignore GpioInt when looking for speaker/head=
set GPIO lines

Bard Liao (1):
      ASoC: SOF: ipc4-topology: move ida allocate/free to widget_setup/free

Brent Lu (1):
      ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_AON bit

Cezary Rojewski (4):
      ASoC: Intel: hsw_rt5640: Mark BE DAI as nonatomic
      ASoC: Intel: bdw_rt286: Mark BE DAI as nonatomic
      ASoC: Intel: bdw_rt5650: Mark BE DAI as nonatomic
      ASoC: Intel: bdw_rt5677: Mark BE DAI as nonatomic

Charles Keepax (2):
      firmware: cs_dsp: Add pre_stop callback
      firmware: cs_dsp: Add memory chunk helpers

Christophe JAILLET (1):
      ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()

Chunxu Li (1):
      ASoC: mediatek: mt8195: extract SOF common code

Claudiu Beznea (6):
      ASoC: atmel_ssc_dai: remove #ifdef CONFIG_PM
      ASoC: mchp-spdifrx: use single tab indent for structure
      ASoC: mchp-spdiftx: return directly ret
      ASoC: mchp-spdiftx: add and remove black line around MODULE_DEVICE_TA=
BLE()
      ASoC: mchp-spdifrx: disable end of block interrupt on failures
      ASoC: mchp-spdiftx: remove references to mchp_i2s_caps

Cristian Ciocaltea (1):
      ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41

Gustavo A. R. Silva (1):
      ASoC: q6asm: use kcalloc() instead of kzalloc()

Jiaxin Yu (10):
      ASoC: mediatek: mt8186: add platform driver
      ASoC: mediatek: mt8186: add mt8186-mt6366 common driver
      ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and ma=
x98357
      ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt=
5682s
      ASoC: mediatek: mt6358: add new compatible for using mt6366
      ASoC: mediatek: mt8186: add audio afe document
      ASoC: mediatek: mt8186: add mt8186-mt6366-da7219-max98357 document
      ASoC: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s document
      ASoC: mediatek: mt8186: set the correct string to strncmp()
      ASoC: mediatek: mt8186: remove unnecessary judgments

Krzysztof Kozlowski (2):
      ASoC: dt-bindings: qcom,wcd934x: use absolute path to other schema
      ASoC: dt-bindings: use spi-peripheral-props.yaml

Liang He (2):
      ASoC: audio-graph-card: Add of_node_put() in fail path
      ASoC: audio-graph-card2: Add of_node_put() in fail path

Mario Limonciello (1):
      ASoC: amd: yc: Decrease level of error message

Mark Brown (13):
      Read _SUB from ACPI to be able to identify firmware
      ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
      ASoC: SOF: Intel: add support for SoundWire-based HP Omen16
      ASoC: nau8821: Don't unconditionally free interrupt
      ASoC: SOF: mediatek: fix boot sequences
      ASoC: SOF: Intel: updates and cleanups
      ASoC: dt-bindings: atmel-classd: Convert to
      ASoC: mediatek: Add support for MT8186 SoC
      ASoC: fsl: Fix sparse warning
      ASoC: SOF: minor updates for 5.20
      ASoC: Intel: machine driver updates for 5.20
      ASoC: atmel: one fix and few cleanups
      ASoC: atmel: one fix and one cleanup

Muralidhar Reddy (3):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ADL match table
      ASoC: Intel: sof_es8336: add support for HDMI_In capture
      ASoC: Intel: sof_es8336: reset the num_links during probe

Nathan Chancellor (1):
      ASoC: amd: acp: Fix initialization of ext_intr_stat1 in i2s_irq_handl=
er()

Peter Ujfalusi (2):
      ASoC: SOF: ipc3-loader: Print out the non matching ext_man magic numb=
er
      ASoC: SOF: Intel: atom: don't keep a temporary string in fixup_tplg_n=
ame

Pierre-Louis Bossart (11):
      ASoC: Intel: sof_sdw: avoid oops in error handling
      ASoC: Intel: soc-acpi: add table for HP Omen 16-k0005TX
      ASoC: Intel: sof_sdw: add quirk for HP Omen 16-k0005TX
      ASoC: SOF: Intel: enable dmic handling with 2 or fewer SoundWire links
      ASoC: SOF: Intel: hda: don't set fw_filename
      ASoC: SOF: Intel: hda: only fixup topology name if not set already
      ASoC: SOF: probes: rename assign/free callbacks as startup/shutdown
      ASoC: SOF: Intel: hda-stream: test DMA buffer first in hw_params
      ASoC: SOF: Intel: hda: add sanity check on SSP index reported by NHLT
      ASoC: Intel: sof_sdw: add support for Dell SKU 0AF0
      ASoC: Intel: sof_es8336: remove hard-coded SSP selection

Rander Wang (3):
      ASoC: SOF: ipc4-pcm: set pcm rate to dai setting
      ASoC: SOF: add ipc4 SRC module support
      ASoC: SOF: ipc4-topology: set domain bit based on dp domain type

Raphael-Xu (1):
      ASoC: dt-bindings: tas2780: remove tas2780 and will merge it to tas27=
xx

Ren Zhijie (1):
      ASoC: mediatek: mt8186: fix Kconfig dependency

Rob Herring (1):
      ASoC: dt-bindings: sgtl5000: Add missing type to 'micbias-voltage-m-v=
olts'

Ryan Wanner (3):
      ASoC: dt-bindings: atmel-classd: Convert to json-schema
      ASoC: dt-bindings: atmel-classd: PDMIC convert to json-schema
      ASoC: dt-bindings: atmel-i2s: Convert to json-schema

Shengjiu Wang (5):
      ASoC: fsl_sai: Don't use plain integer as NULL pointer
      ASoC: fsl_asrc: force cast the asrc_format type
      ASoC: fsl-asoc-card: force cast the asrc_format type
      ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
      ASoC: imx-card: use snd_pcm_format_t type for asrc_format

Stefan Binding (2):
      ACPI: utils: Add api to read _SUB from ACPI
      ASoC: cs35l41: Read System Name from ACPI _SUB to identify firmware

Syed Saba Kareem (5):
      ASoC: amd: add RPL Platform acp header file
      ASoC: amd: add ACP PCI driver for RPL platform
      ASoC: amd: add RPL Platform init/de-init functions
      ASoC: amd: add RPL Platform pci driver pm-ops
      ASoC: amd: enable RPL Platform acp drivers build

Venkata Prasad Potturu (4):
      ASoC: amd: acp: Modify local variables name to generic
      ASoC: amd: acp: Drop superfluous mmap callback
      ASoC: amd: acp: Modify const resource struct variable to generic
      ASoC: amd: acp: Add error handling cases

Wallace Lin (1):
      ASoC: nau8821: add new widget to control system clock

YC Hung (3):
      ASoC: SOF: mediatek: Revise mt8195 boot flow
      ASoC: SOF: mediatek: fix mt8195 StatvectorSel wrong setting
      ASoC: SOF: Add cont_update_posn to platform parameters

Yong Zhi (4):
      ASoC: SOF: Intel: MTL: remove redundant snd_sof_dsp_read() call
      ASoC: Intel: sof_rt5682: Add support for mtl_mx98357_rt5682
      ASoC: Intel: sof_rt5682: Perform quirk check first in card late probe
      ASoC: Intel: sof_nau8825: Move quirk check to the front in late probe

syed sabakareem (1):
      ASoC: amd: yc: Update DMI table entries

 .../devicetree/bindings/sound/adi,adau1977.yaml    |    7 +-
 .../bindings/sound/atmel,sama5d2-classd.yaml       |  100 +
 .../bindings/sound/atmel,sama5d2-i2s.yaml          |   85 +
 .../bindings/sound/atmel,sama5d2-pdmic.yaml        |   98 +
 .../devicetree/bindings/sound/atmel-classd.txt     |   55 -
 .../devicetree/bindings/sound/atmel-i2s.txt        |   46 -
 .../devicetree/bindings/sound/atmel-pdmic.txt      |   55 -
 Documentation/devicetree/bindings/sound/mt6358.txt |    4 +-
 .../devicetree/bindings/sound/mt8186-afe-pcm.yaml  |  175 ++
 .../sound/mt8186-mt6366-da7219-max98357.yaml       |   75 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |   75 +
 .../devicetree/bindings/sound/qcom,wcd934x.yaml    |    2 +-
 .../devicetree/bindings/sound/sgtl5000.yaml        |    1 +
 .../devicetree/bindings/sound/tas2780.yaml         |   72 -
 .../devicetree/bindings/sound/wlf,wm8731.yaml      |    9 +-
 drivers/acpi/utils.c                               |   38 +
 drivers/firmware/cirrus/cs_dsp.c                   |  107 +
 include/linux/acpi.h                               |    6 +
 include/linux/firmware/cirrus/cs_dsp.h             |   77 +-
 include/sound/sof/dai-intel.h                      |    2 +
 include/uapi/sound/sof/abi.h                       |    2 +-
 sound/hda/intel-dsp-config.c                       |    5 +
 sound/soc/Makefile                                 |    4 +-
 sound/soc/amd/Kconfig                              |   10 +
 sound/soc/amd/Makefile                             |    1 +
 sound/soc/amd/acp/acp-pci.c                        |   33 +-
 sound/soc/amd/acp/acp-platform.c                   |   18 +-
 sound/soc/amd/rpl/Makefile                         |    5 +
 sound/soc/amd/rpl/rpl-pci-acp6x.c                  |  227 ++
 sound/soc/amd/rpl/rpl_acp6x.h                      |   36 +
 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h     |   30 +
 sound/soc/amd/vangogh/acp5x-mach.c                 |    3 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   32 +-
 sound/soc/amd/yc/pci-acp6x.c                       |    2 +-
 sound/soc/atmel/atmel_ssc_dai.c                    |    9 +-
 sound/soc/atmel/mchp-spdifrx.c                     |   19 +-
 sound/soc/atmel/mchp-spdiftx.c                     |   22 +-
 sound/soc/codecs/cs35l41.c                         |   30 +
 sound/soc/codecs/nau8821.c                         |   40 +-
 sound/soc/fsl/fsl-asoc-card.c                      |    5 +-
 sound/soc/fsl/fsl_asrc.c                           |    6 +-
 sound/soc/fsl/fsl_easrc.c                          |    9 +-
 sound/soc/fsl/fsl_easrc.h                          |    2 +-
 sound/soc/fsl/fsl_sai.c                            |    2 +-
 sound/soc/fsl/imx-card.c                           |    8 +-
 sound/soc/generic/audio-graph-card.c               |    4 +-
 sound/soc/generic/audio-graph-card2.c              |    4 +-
 sound/soc/intel/avs/path.c                         |   54 +-
 sound/soc/intel/boards/bdw-rt5650.c                |    1 +
 sound/soc/intel/boards/bdw-rt5677.c                |    1 +
 sound/soc/intel/boards/bdw_rt286.c                 |    1 +
 sound/soc/intel/boards/hsw_rt5640.c                |    1 +
 sound/soc/intel/boards/sof_es8336.c                |  160 +-
 sound/soc/intel/boards/sof_nau8825.c               |   10 +-
 sound/soc/intel/boards/sof_rt5682.c                |   26 +-
 sound/soc/intel/boards/sof_sdw.c                   |   19 +
 sound/soc/intel/boards/sof_sdw_rt711.c             |    3 +
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c        |    3 +
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  |   54 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   17 +
 sound/soc/jz4740/jz4740-i2s.c                      |    1 -
 sound/soc/mediatek/Kconfig                         |   45 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/common/Makefile                 |    2 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     |  196 ++
 sound/soc/mediatek/common/mtk-dsp-sof-common.h     |   36 +
 sound/soc/mediatek/common/mtk-soc-card.h           |   17 +
 sound/soc/mediatek/mt8186/Makefile                 |   22 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c         |    3 +-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h         |    2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-common.h      |  195 ++
 sound/soc/mediatek/mt8186/mt8186-afe-control.c     |  255 ++
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         | 3000 ++++++++++++++++=
++++
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c        |    8 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c         |   63 -
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c         |    5 -
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c         |   55 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c   |   57 +
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h   |   17 +
 .../mt8186/mt8186-mt6366-da7219-max98357.c         | 1002 +++++++
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  978 +++++++
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  233 +-
 sound/soc/qcom/qdsp6/q6adm.c                       |    2 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |    2 +-
 sound/soc/sof/intel/atom.c                         |   16 +-
 sound/soc/sof/intel/hda-probes.c                   |   16 +-
 sound/soc/sof/intel/hda-stream.c                   |   15 +-
 sound/soc/sof/intel/hda.c                          |   86 +-
 sound/soc/sof/intel/mtl.c                          |   13 +-
 sound/soc/sof/ipc3-loader.c                        |    6 +-
 sound/soc/sof/ipc3-pcm.c                           |    3 +
 sound/soc/sof/ipc4-pcm.c                           |    4 +
 sound/soc/sof/ipc4-topology.c                      |  156 +-
 sound/soc/sof/ipc4-topology.h                      |   27 +-
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c      |   13 +-
 sound/soc/sof/sof-client-probes.c                  |    8 +-
 sound/soc/sof/sof-client-probes.h                  |    8 +-
 sound/soc/sof/sof-priv.h                           |    1 +
 98 files changed, 7732 insertions(+), 844 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-c=
lassd.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-i=
2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-p=
dmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-classd.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.=
yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-d=
a7219-max98357.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-r=
t1019-rt5682s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2780.yaml
 create mode 100644 sound/soc/amd/rpl/Makefile
 create mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 create mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 create mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
 create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.c
 create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.h
 create mode 100644 sound/soc/mediatek/common/mtk-soc-card.h
 create mode 100644 sound/soc/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357=
=2Ec
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c

--+3yaWUI6Cwc8KFPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLnybcACgkQJNaLcl1U
h9DBXgf7BSQ+QDlpCK0vKQB4YNv5rsDrWX1yQKzF7+tnBWbRb7iRZHzs30SlssBh
dHyJDYm+t6U8bzWW7qyWwnc2DX4DzzHjE00RYZcK7g/lJK+1QMh3WPWIDR4YAlSx
vXv3uJ6C+g81Y92kkWiOv8Jjw6tijnoYWX0UgXaEuLT3aVt5/duwUy0SNJBZY2Nl
hsZXM+yymAlVb2zf03oHGIYvH0GSrqXZB2FRVlekgE6ulIxaPuxZY3JC/iynHmrN
22ut95G24QKoY+cAgjoSubqLiknLzCDC3gweyTfTNNghhhGToDRUZN9dzPMSgTSj
qZ6IBEVcpcuCKknl7daYr1pnXfH2qw==
=Da+P
-----END PGP SIGNATURE-----

--+3yaWUI6Cwc8KFPI--
