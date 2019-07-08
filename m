Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C962E61CF8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 12:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 482E1166A;
	Mon,  8 Jul 2019 12:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 482E1166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562581970;
	bh=Xqh5X8S6bZ9AnHDXDcVINqHuj+Gs3t09L+LZFwZN+nU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FDppy/kfio1fG8OmCv02lau9Pe0zMbg/6JufAdChONr18jarp8ooT/YX78Q0uhYqP
	 r6ODj4FoH0NrITJ0B/dyMqIiqtrzpX22S55+A28TlW7sET6uvvYMfQuU3ejleN0/El
	 KN2Kzjr402YJOLLxMNkBXaju6OkUAMwczjYMZicg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D31F80268;
	Mon,  8 Jul 2019 12:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 658B3F80268; Mon,  8 Jul 2019 12:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5865F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2019 12:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5865F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uzzZHdFC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wYUv++4EnKfhL6tqiqYLAXh3snoRSKCOkHdo8lDPhPI=; b=uzzZHdFCD28pHVLPbJlT0XSAY
 Li03E8PzKeTkdcB6O0YGfk2t4Oi2y16sskTmN5GwJCF4V4HnSA7k9eCJrDs76z1HuHWSY0a+NnF6G
 5i0F30bYsd7I73w11DcgNy1X0U6oBKAlWjmJrp+Xp+kqHh17k8rUzx9pUYS4DuClmNHsA=;
Received: from [217.140.106.54] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hkQv9-0003Cy-8a; Mon, 08 Jul 2019 10:30:55 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id C6341D02D15; Mon,  8 Jul 2019 11:30:54 +0100 (BST)
Date: Mon, 8 Jul 2019 11:30:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190708103054.GA8576@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: optimist, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates for v5.3
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
Content-Type: multipart/mixed; boundary="===============7420767236636539499=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7420767236636539499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6fbc7275c7a9ba97877050335f290341a1fd8dbf:

  Linux 5.2-rc7 (2019-06-30 11:25:36 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.3

for you to fetch changes up to a98429acadefc2b36611220f51659ecb3c1f35d2:

  Merge remote-tracking branch 'asoc/topic/meson' into asoc-next (2019-07-0=
6 12:25:28 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.3

This is a very big update, mainly thanks to Morimoto-san's refactoring
work and some fairly large new drivers.

 - Lots more work on moving towards a component based framework from
   Morimoto-san.
 - Support for force disconnecting muxes from Jerome Brunet.
 - New drivers for Cirrus Logic CS47L35, CS47L85 and CS47L90, Conexant
   CX2072X, Realtek RT1011 and RT1308.

----------------------------------------------------------------
Amadeusz S=C5=82awi=C5=84ski (12):
      ASoC: core: Tell codec that jack is being removed
      ASoC: Intel: Skylake: Initialize lists before access so they are safe=
 to use
      ALSA: hdac: Fix codec name after machine driver is unloaded and reloa=
ded
      ASoC: compress: Fix memory leak from snd_soc_new_compress
      ASoC: Intel: Skylake: Don't return failure on machine driver reload
      ASoC: Intel: Skylake: Add function to cleanup debugfs interface
      ASoC: Intel: Skylake: Properly cleanup on component removal
      ASoC: Intel: Skylake: Fix NULL ptr dereference when unloading clk dev
      ASoC: Intel: hdac_hdmi: Set ops to NULL on remove
      ASoC: topology: Consolidate how dtexts and dvalues are freed
      ASoC: topology: Consolidate and fix asoc_tplg_dapm_widget_*_create fl=
ow
      ASoC: Intel: Skylake: Reset pipeline before its deletion

Amir Goldstein (1):
      ASoC: rename functions that pollute the simple_xxx namespace

Andy Shevchenko (1):
      ASoC: Intel: Skylake: Switch to modern UUID API

Arnd Bergmann (3):
      ASoC: rockchip: pdm: select CONFIG_RATIONAL
      ASoC: cx2072x: mark PM function as __maybe_unused
      ASoC: SOF: disallow building without CONFIG_PCI again

Bard Liao (1):
      ASoC: SOF: dont wake dsp up in kcontrol IO

Bard liao (1):
      ASoC: SOF: send time stamp to FW for alignment

Ben Zhang (2):
      ASoC: rt5677: clear interrupts by polarity flip
      ASoC: rt5677: handle concurrent interrupts

Bjorn Andersson (2):
      ASoC: qcom: common: Mark links as nonatomic
      ASoC: qcom: common: Fix NULL pointer in of parser

Cezary Rojewski (3):
      ASoC: Intel: Skylake: Fix incorrect capture position reporting
      ASoC: Intel: Skylake: Read HIPCT extension before clearing DONE bit
      ASoC: Intel: Common: Fix NULL dereference in tx_wait_done

Charles Keepax (1):
      ASoC: madera: Update SPDX headers

Cl=C3=A9ment P=C3=A9ron (4):
      dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
      ASoC: sun4i-spdif: Move quirks to the top
      ASoC: sun4i-spdif: Add TX fifo bit flush quirks
      ASoC: sun4i-spdif: Add support for H6 SoC

Codrin Ciubotariu (3):
      ASoC: codecs: ad193x: Fix memory corruption on BE 64b systems
      ASoC: codecs: ad193x: Group register initialization at probe
      ASoC: codecs: ad193x: Reset used registers at probe

Colin Ian King (5):
      ASoC: cx2072x: remove redundant assignment to pulse_len
      ASoC: cx2072x: fix integer overflow on unsigned int multiply
      ASoC: cx2072x: fix spelling mistake "configued" -> "configured"
      ASoC: topology: fix memory leaks on sm, se and sbe
      ASoC: rt5665: remove redundant assignment to variable idx

Curtis Malainey (4):
      ASoC: rt5677-spi: Rename driver to differentiate from main codec
      ASoC: rt5677: Add component driver name
      ASoC: rt5677: Add missing voice activation register definitions
      ASoC: rt5677: depop stereo dac

Daniel Baluta (1):
      ASoC: SOF: Do not send cmd via SHIM register

David Lin (1):
      ASoC: nau8822: support master mode

Derek Fang (1):
      ASoC: rt1308: Add RT1308 amplifier driver

Dragos Tarcatu (1):
      ASOC: SOF: ipc: prevent logging trace messages

Dylan Reid (1):
      ASoC: rt5677: use more of the volume range from DACs

Enric Balletbo i Serra (1):
      ASoC: rk3399_gru_sound: Support 32, 44.1 and 88.2 kHz sample rates

Evan Green (2):
      ASoC: SOF: Add Comet Lake PCI IDs
      ASoC: Intel: Skylake: Add Cometlake PCI IDs

Fletcher Woodruff (2):
      ASoC: rt5677: fall back to DT prop names on error
      ASoC: rt5677: move jack-detect init to i2c probe

Geert Uytterhoeven (1):
      ASoC: Add missing newline at end of file

Gen Zhang (1):
      wcd9335: fix a incorrect use of kstrndup()

Greg Kroah-Hartman (2):
      ASoC: wm_adsp: no need to check return value of debugfs_create functi=
ons
      ASoC: fsl: no need to check return value of debugfs_create functions

Gustavo A. R. Silva (5):
      ASoC: dapm: Use struct_size() in krealloc()
      ASoC: Intel: Skylake: Use struct_size() helper
      ASoC: qdsp6: q6core: Use struct_size() in kmemdup()
      ASoC: SOF: topology: Use struct_size() helper
      ASoC: SOF: Use struct_size() in kmemdup()

Gustaw Lewandowski (1):
      ASoC: Intel: Fix race condition in IPC rx list

Janusz Krzysztofik (1):
      ASoC: ti: Fix SDMA users not providing channel names

Jaska Uimonen (2):
      ASoC: SOF: uapi: remove unused sof header files
      ASoC: SOF: topology: add support for mux/demux component

Jerome Brunet (21):
      ASoC: hdmi-codec: remove function name debug traces
      ASoC: hdmi-codec: remove reference to the current substream
      ASoC: hdmi-codec: remove reference to the dai drivers in the private =
data
      ASoC: hdmi-codec: remove ops dependency on the dai id
      ASoC: hdmi-codec: re-introduce mutex locking
      ASoC: meson: axg-card: set link name based on link node name
      ASoC: dapm: allow muxes to force a disconnect
      ASoC: meson: add tohdmitx DT bindings
      ASoC: meson: axg-card: add basic codec-to-codec link support
      ASoC: meson: add g12a tohdmitx control
      ASoC: meson: axg-card: fix null pointer dereference in clean up
      ASoC: meson: axg-tdmin: right_j is not supported
      ASoC: meson: axg-tdmout: right_j is not supported
      ASoC: meson: axg-tdm: fix sample clock inversion
      ASoC: meson: axg-tdm: consistently use SND_SOC_DAIFMT defines
      ASoC: meson: add tohdmitx DT bindings
      ASoC: soc-core: defer card registration if codec component is missing
      ASoC: soc-core: support dai_link with platforms_num !=3D 1
      ASoC: meson: axg-card: remove useless check on codec
      ASoC: meson: axg-tdm-formatter: add reset to the bindings documentati=
on
      ASoC: meson: axg-tdm-formatter: add reset

Jiaxin Yu (3):
      ASoC: Mediatek: MT8183: fix compile error
      ASoC: Mediatek: MT8183: fix compile error
      ASoC: Mediatek: MT8183: enable dev runtime suspend and resume

John Hsu (1):
      ASoC: nau8825: fix fake interruption when booting

Kai Vehmanen (8):
      ASoC: SOF: trace: remove code duplication in sof_wait_trace_avail()
      ASoC: SOF: force end-of-file for debugfs trace at suspend
      ASoC: codec: hdac_hdmi: fix pin connections at cvt enable
      ASoC: SOF: intel: extend IPC dump information
      ASoC: SOF: ignore unrecoverable CTX_SAVE IPC errors at suspend
      ASoC: hdac_hdmi: report codec link up/down status to bus
      ASoC: SOF: add runtime idle callback
      ASoC: SOF: Intel: implement runtime idle for CNL/APL

Kamil Lulko (1):
      ASoC: Intel: Skylake: Strip T and L from TLV IPCs

Keyon Jie (3):
      ASoC: Intel: bxt-da7219-max98357a: add BE dailink for dmic16k
      ASoC: SOF: Intel: hda-stream: fix a deadlock with bus->reg_lock
      ASoC: Intel: sof-rt5682: correct naming for dmic16k

Krzysztof Kozlowski (1):
      Revert "ASoC: core: use component driver name as component name"

Kuninori Morimoto (268):
      ASoC: soc-core: use i on snd_soc_resume()
      ASoC: soc-core: don't use codec_dais on soc_bind_dai_link()
      ASoC: soc-core: tidyup soc_bind_dai_link() comment balance
      ASoC: soc-core: add soc_component_to_node()
      ASoC: soc-core: use soc_find_component() at snd_soc_get_dai_id()
      ASoC: soc.h: fe_compr can be bit field
      ASoC: soc-pcm: do cpu_dai related operation at same place
      ASoC: soc-pcm: add missing cpu_dai->rate =3D 0
      ASoC: soc-pcm: add soc_pcm_components_open()
      ASoC: rsnd: move pcm_new from snd_soc_component_driver to snd_soc_dai=
_driver
      ASoC: soc-core: WARN() is not related to component->driver->probe
      ASoC: soc-pcm: fixup try_module_get()/module_put() timing
      ASoC: soc-core: use snd_soc_dai_link_component for CPU
      ASoC: simple-card: support snd_soc_dai_link_component style for cpu
      ASoC: soc.h: add sound dai_link connection macro
      ASoC: mediatek: mt6797-mt6351: use modern dai_link style
      ASoC: mediatek: mt2701-wm8960: use modern dai_link style
      ASoC: mediatek: mt2701-cs42448: use modern dai_link style
      ASoC: mediatek: mt8173-max98090: use modern dai_link style
      ASoC: mediatek: mt8173-rt5650: use modern dai_link style
      ASoC: mediatek: mt8173-rt5650-rt5676: use modern dai_link style
      ASoC: mediatek: mt8173-rt5650-rt5514: use modern dai_link style
      ASoC: mediatek: mt8183-da7219-max98357: use modern dai_link style
      ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use modern dai_link s=
tyle
      ASoC: samsung: bells: use modern dai_link style
      ASoC: samsung: smdk_wm8580: use modern dai_link style
      ASoC: samsung: smdk_wm8994: use modern dai_link style
      ASoC: samsung: smdk_wm8994pcm: use modern dai_link style
      ASoC: samsung: smdk_spdif: use modern dai_link style
      ASoC: samsung: h1940_uda1380: use modern dai_link style
      ASoC: samsung: arndale_rt5631: use modern dai_link style
      ASoC: samsung: tobermory: use modern dai_link style
      ASoC: samsung: tm2_wm5110: use modern dai_link style
      ASoC: samsung: speyside: use modern dai_link style
      ASoC: samsung: snow: use modern dai_link style
      ASoC: samsung: smartq_wm8987: use modern dai_link style
      ASoC: samsung: s3c24xx_uda134x: use modern dai_link style
      ASoC: samsung: s3c24xx_simtec_tlv320aic23: use modern dai_link style
      ASoC: samsung: s3c24xx_simtec_hermes: use modern dai_link style
      ASoC: samsung: rx1950_uda1380: use modern dai_link style
      ASoC: samsung: odroid: use modern dai_link style
      ASoC: samsung: neo1973_wm8753: use modern dai_link style
      ASoC: samsung: lowland: use modern dai_link style
      ASoC: samsung: littlemill: use modern dai_link style
      ASoC: samsung: jive_wm8750: use modern dai_link style
      ASoC: pxa: brownstone: use modern dai_link style
      ASoC: pxa: corgi: use modern dai_link style
      ASoC: pxa: e740_wm9705: use modern dai_link style
      ASoC: pxa: e750_wm9705: use modern dai_link style
      ASoC: pxa: e800_wm9712: use modern dai_link style
      ASoC: pxa: em-x270: use modern dai_link style
      ASoC: pxa: hx4700: use modern dai_link style
      ASoC: pxa: imote2: use modern dai_link style
      ASoC: pxa: magician: use modern dai_link style
      ASoC: pxa: mioa701_wm9713: use modern dai_link style
      ASoC: pxa: palm27x: use modern dai_link style
      ASoC: pxa: zylonite: use modern dai_link style
      ASoC: pxa: z2: use modern dai_link style
      ASoC: pxa: ttc-dkb: use modern dai_link style
      ASoC: pxa: tosa: use modern dai_link style
      ASoC: pxa: spitz: use modern dai_link style
      ASoC: pxa: poodle: use modern dai_link style
      ASoC: kirkwood: armada-370-db: use modern dai_link style
      ASoC: ti: n810: use modern dai_link style
      ASoC: ti: osk5912: use modern dai_link style
      ASoC: ti: ams-delta: use modern dai_link style
      ASoC: ti: omap3pandora: use modern dai_link style
      ASoC: ti: davinci-evm: use modern dai_link style
      ASoC: ti: omap-hdmi: use modern dai_link style
      ASoC: ti: omap-abe-twl6040: use modern dai_link style
      ASoC: ti: omap-twl4030: use modern dai_link style
      ASoC: ti: rx51: use modern dai_link style
      ASoC: sh: migor: use modern dai_link style
      ASoC: sh: sh7760-ac97: use modern dai_link style
      ASoC: amd: acp-da7219-max98357a: use modern dai_link style
      ASoC: amd: acp-rt5645: use modern dai_link style
      ASoC: atmel: mikroe-proto: use modern dai_link style
      ASoC: atmel: sam9x5_wm8731: use modern dai_link style
      ASoC: atmel: sam9g20_wm8731: use modern dai_link style
      ASoC: atmel: tse850-pcm5142: use modern dai_link style
      ASoC: atmel: atmel-wm8904: use modern dai_link style
      ASoC: atmel: atmel-pdmic: use modern dai_link style
      ASoC: atmel: atmel-classd: use modern dai_link style
      ASoC: au1x: db1000: use modern dai_link style
      ASoC: au1x: db1200: use modern dai_link style
      ASoC: cirrus: edb93xx: use modern dai_link style
      ASoC: cirrus: simone: use modern dai_link style
      ASoC: cirrus: snappercl15: use modern dai_link style
      ASoC: fsl: efika-audio-fabric: use modern dai_link style
      ASoC: fsl: imx-spdif: use modern dai_link style
      ASoC: fsl: mx27vis-aic32x4: use modern dai_link style
      ASoC: fsl: phycore-ac97: use modern dai_link style
      ASoC: fsl: wm1133-ev1: use modern dai_link style
      ASoC: fsl: fsl-asoc-card: use modern dai_link style
      ASoC: fsl: mpc8610_hpcd/p1022_ds/p1022_rdk: use modern dai_link style
      ASoC: fsl: imx-es8328: use modern dai_link style
      ASoC: fsl: eukrea-tlv320: use modern dai_link style
      ASoC: fsl: imx-sgtl5000: use modern dai_link style
      ASoC: fsl: imx-mc13783: use modern dai_link style
      ASoC: fsl: pcm030-audio-fabric: use modern dai_link style
      ASoC: fsl: imx-audmix: use modern dai_link style
      ASoC: jz4740: qi_lb60: use modern dai_link style
      ASoC: meson: axg-card: use modern dai_link style
      ASoC: mxs: mxs-sgtl5000: use modern dai_link style
      ASoC: nuc900: nuc900-audio: use modern dai_link style
      ASoC: qcom: storm: use modern dai_link style
      ASoC: qcom: common: use modern dai_link style
      ASoC: qcom: apq8016_sbc: use modern dai_link style
      ASoC: rockchip: rk3399_gru_sound: use modern dai_link style
      ASoC: rockchip: rk3288_hdmi_analog: use modern dai_link style
      ASoC: rockchip: rockchip_rt5645: use modern dai_link style
      ASoC: rockchip: rockchip_max98090: use modern dai_link style
      ASoC: sirf: sirf-audio: use modern dai_link style
      ASoC: ux500: mop500: use modern dai_link style
      ASoC: sunxi: sun4i-codec: use modern dai_link style
      ASoC: txx9: txx9aclc-generic: use modern dai_link style
      ASoC: tegra: tegra_rt5677: use modern dai_link style
      ASoC: tegra: tegra_wm8753: use modern dai_link style
      ASoC: tegra: trimslice: use modern dai_link style
      ASoC: tegra: tegra_alc5632: use modern dai_link style
      ASoC: tegra: tegra_sgtl5000: use modern dai_link style
      ASoC: tegra: tegra_rt5640: use modern dai_link style
      ASoC: tegra: tegra_wm8903: use modern dai_link style
      ASoC: tegra: tegra_wm9712: use modern dai_link style
      ASoC: tegra: tegra_max98090: use modern dai_link style
      ASoC: soc-topology: use modern dai_link style
      ASoC: vc4: vc4_htmi: use modern dai_link style
      ASoC: sof: use modern dai_link style
      ASoC: Intel: bdw-rt5677: use modern dai_link style
      ASoC: Intel: haswell: use modern dai_link style
      ASoC: Intel: broadwell: use modern dai_link style
      ASoC: Intel: bxt_da7219_max98357a: use modern dai_link style
      ASoC: Intel: bxt_rt298: use modern dai_link style
      ASoC: Intel: byt-rt5640: use modern dai_link style
      ASoC: Intel: byt-max98090: use modern dai_link style
      ASoC: Intel: bytcht_es8316: use modern dai_link style
      ASoC: Intel: bytcht_nocodec: use modern dai_link style
      ASoC: Intel: bytcht_da7213: use modern dai_link style
      ASoC: Intel: bytcht_cx2072x: use modern dai_link style
      ASoC: Intel: bytcr_rt5651: use modern dai_link style
      ASoC: Intel: bytcr_rt5640: use modern dai_link style
      ASoC: Intel: cht_bsw_rt5645: use modern dai_link style
      ASoC: Intel: cht_bsw_max98090_ti: use modern dai_link style
      ASoC: Intel: cht_bsw_rt5672: use modern dai_link style
      ASoC: Intel: cht_bsw_nau8824: use modern dai_link style
      ASoC: Intel: kbl_rt5660: use modern dai_link style
      ASoC: Intel: kbl_rt5663_max98927: use modern dai_link style
      ASoC: Intel: kbl_rt5663_rt5514_max98927: use modern dai_link style
      ASoC: Intel: kbl_da7219_max98927: use modern dai_link style
      ASoC: Intel: kbl_da7219_max98357a: use modern dai_link style
      ASoC: Intel: skl_nau88l25_ssm4567: use modern dai_link style
      ASoC: Intel: skl_rt286: use modern dai_link style
      ASoC: Intel: skl_nau88l25_max98357a: use modern dai_link style
      ASoC: Intel: skl-pcm: use modern dai_link style
      ASoC: Intel: skl_hda_dsp_common: use modern dai_link style
      ASoC: Intel: glk_rt5682_max98357a: use modern dai_link style
      ASoC: Intel: sof_rt5682: use modern dai_link style
      ASoC: soc-core: remove legacy style dai_link
      ASoC: soc.h: fixup for_each_card_links() macro
      ASoC: soc-core: allow no Platform on dai_link
      ASoC: vc4: vc4_hdmi: don't select unnecessary Platform
      ASoC: atmel: atmel-classd: don't select unnecessary Platform
      ASoC: atmel: atmel-pdmic: don't select unnecessary Platform
      ASoC: atmel: atmel_wm8904: don't select unnecessary Platform
      ASoC: atmel: mikroe-proto: don't select unnecessary Platform
      ASoC: atmel: sam9g20_wm8731: don't select unnecessary Platform
      ASoC: atmel: sam9x5_wm8731: don't select unnecessary Platform
      ASoC: atmel: tse850-pcm5142: don't select unnecessary Platform
      ASoC: fsl: eukrea-tlv320: don't select unnecessary Platform
      ASoC: fsl: fsl-asoc-card: don't select unnecessary Platform
      ASoC: fsl: imx-es8328: don't select unnecessary Platform
      ASoC: fsl: imx-sgtl5000: don't select unnecessary Platform
      ASoC: fsl: imx-spdif: don't select unnecessary Platform
      ASoC: fsl: imx-audmix: don't select unnecessary Platform
      ASoC: kirkwood: armada-370-db: don't select unnecessary Platform
      ASoC: mxs: mxs-sgtl5000: don't select unnecessary Platform
      ASoC: qcom: apq8016_sbc: don't select unnecessary Platform
      ASoC: qcom: storm: don't select unnecessary Platform
      ASoC: rockchip: rk3288_hdmi_analog: don't select unnecessary Platform
      ASoC: rockchip: rockchip_max98090: don't select unnecessary Platform
      ASoC: rockchip: rockchip_rt5645: don't select unnecessary Platform
      ASoC: samsung: arndale_rt5631: don't select unnecessary Platform
      ASoC: samsung: smdk_wm8994: don't select unnecessary Platform
      ASoC: samsung: snow: don't select unnecessary Platform
      ASoC: samsung: tm2_wm5110: don't select unnecessary Platform
      ASoC: sirf: sirf-audio: don't select unnecessary Platform
      ASoC: sunxi: sun4i-codec: don't select unnecessary Platform
      ASoC: tegra: tegra_alc5632: don't select unnecessary Platform
      ASoC: tegra: tegra_max98090: don't select unnecessary Platform
      ASoC: tegra: tegra_rt5640: don't select unnecessary Platform
      ASoC: tegra: tegra_rt5677: don't select unnecessary Platform
      ASoC: tegra: tegra_sgtl5000: don't select unnecessary Platform
      ASoC: tegra: tegra_wm8753: don't select unnecessary Platform
      ASoC: tegra: tegra_wm8903: don't select unnecessary Platform
      ASoC: tegra: tegra_wm9712: don't select unnecessary Platform
      ASoC: tegra: trimslice: don't select unnecessary Platform
      ASoC: ti: davinci-evm: don't select unnecessary Platform
      ASoC: ti: omap-abe-twl6040: don't select unnecessary Platform
      ASoC: ti: omap-hdmi: don't select unnecessary Platform
      ASoC: ti: omap-twl4030: don't select unnecessary Platform
      ASoC: ti: rx51: don't select unnecessary Platform
      ASoC: ux500: mop500: don't select unnecessary Platform
      ASoC: simple-card-utils: don't select unnecessary Platform
      ASoC: qcom: don't select unnecessary Platform
      ASoC: rockchip: rk3399_gru_sound: don't select unnecessary Platform
      ASoC: soc-utils: remove dummy Platform
      ASoC: rt5514-spi: don't use snd_soc_lookup_component()
      ASoC: soc-core: call snd_soc_unbind_card() under mutex_lock;
      ASoC: soc-core: move soc_find_component()
      ASoC: soc-core: soc_find_component() uses snd_soc_is_matching_compone=
nt()
      ASoC: soc-core: soc_find_component() uses snd_soc_dai_link_component
      ASoC: soc-core: use soc_find_component() at snd_soc_find_dai()
      ASoC: rsnd: ssiu: tidyup SSI_MODE1/2 settings
      ASoC: rsnd: add missing pin sharing with SSI9
      ASoC: soc-core: don't use soc_find_component() at snd_soc_find_dai()
      ASoC: atmel: atmel-pcm-dma.c: use devm_snd_dmaengine_pcm_register()
      ASoC: vc4: vc4_htmi: consider CPU-Platform possibility
      ASoC: atmel: atmel-classd: consider CPU-Platform possibility
      ASoC: atmel: atmel-pdmic: consider CPU-Platform possibility
      ASoC: atmel: atmel_wm8904: consider CPU-Platform possibility unnecess=
ary Platform"
      ASoC: amtel: mikroe-proto: consider CPU-Platform possibility
      ASoC: atmel: sam9g20_wm8731: consider CPU-Platform possibility
      ASoC: atmel: sam9x5_wm8731: consider CPU-Platform possibility
      ASoC: atmel: tse850-pcm5142: consider CPU-Platform possibility
      ASoC: fsl: eukrea-tlv320: consider CPU-Platform possibility
      ASoC: fsl: fsl-asoc-card: consider CPU-Platform possibility
      ASoC: fsl: imx-es8328: consider CPU-Platform possibility
      ASoC: fsl: imx-sgtl5000: consider CPU-Platform possibility
      ASoC: fsl: imx-spdif: consider CPU-Platform possibility
      ASoC: fsl: imx-audmix: consider CPU-Platform possibility
      ASoC: kirkwood: armada-370-db: consider CPU-Platform possibility
      ASoC: mxs: mxs-sgtl5000: consider CPU-Platform possibility
      ASoC: qcom: apq8016_sbc: consider CPU-Platform possibility
      ASoC: qcom: storm: consider CPU-Platform possibility
      ASoC: rockchip: rk3288_hdmi_analog: consider CPU-Platform possibility
      ASoC: rockchip: rockchip_max98090: consider CPU-Platform possibility
      ASoC: rockchip: rockchip_rt5645: consider CPU-Platform possibility
      ASoC: samsung: arndale_rt5631: consider CPU-Platform possibility
      ASoC: samsung: smdk_wm8994: consider CPU-Platform possibility
      ASoC: samsung: snow: consider CPU-Platform possibility
      ASoC: samsung: tm2_wm5110: consider CPU-Platform possibility
      ASoC: sirf: sirf-audio: consider CPU-Platform possibility
      ASoC: sunxi: sun4i-codec: consider CPU-Platform possibility
      ASoC: tegra: tegra_alc5632: consider CPU-Platform possibility
      ASoC: tegra: tegra_max98090: consider CPU-Platform possibility
      ASoC: tegra: tegra_rt5640: consider CPU-Platform possibility
      ASoC: tegra: tegra_rt5677: consider CPU-Platform possibility
      ASoC: tegra: tegra_sgtl5000: consider CPU-Platform possibility
      ASoC: tegra: tegra_wm8753: consider CPU-Platform possibility
      ASoC: tegra: tegra_wm8903: consider CPU-Platform possibility
      ASoC: tegra: tegra_wm9712: consider CPU-Platform possibility
      ASoC: tegra: trimslice: consider CPU-Platform possibility
      ASoC: ti: davinci-evm: consider CPU-Platform possibility
      ASoC: ti: omap-abe-twl6040: consider CPU-Platform possibility
      ASoC: ti: omap-hdmi: consider CPU-Platform possibility
      ASoC: ti: omap-twl4030: consider CPU-Platform possibility
      ASoC: ti: rx51: consider CPU-Platform possibility
      ASoC: ux500: mop500: consider CPU-Platform possibility
      ASoC: simple-card-utils: consider CPU-Platform possibility
      ASoC: qcom: consider CPU-Platform possibility
      ASoC: rockchip: rk3399_gru_sound: consider CPU-Platform possibility
      ASoC: soc-utils: respawn dummy Platform
      ASoC: au1x: psc-i2s.c: use devm_snd_soc_register_component()
      ASoC: cirrus: ep93xx-i2s.c: use devm_snd_soc_register_component()
      ASoC: rt5682: use devm_snd_soc_register_component()
      ASoC: ak4118: use devm_snd_soc_register_component()
      ASoC: cros_ec_codec: use devm_snd_soc_register_component()
      ASoC: pxa: pxa2xx-ac97.c: use devm_snd_soc_register_component()

Luca Weiss (1):
      ASoC: sunxi: sun50i-codec-analog: Add earpiece

Mac Chiang (2):
      ASoC: Intel: boards: kbl_da7219_max98927: add dai_trigger function
      ASoC: max98357a: avoid speaker pop when playback startup

Mark Brown (11):
      Merge tag 'v5.2-rc1' into asoc-5.3
      Merge branch 'for-5.2' of https://git.kernel.org/.../broonie/sound in=
to asoc-5.3
      Merge branch 'asoc-5.2' into asoc-5.3
      Merge branch 'asoc-5.2' into asoc-5.3
      Merge branch 'asoc-5.2' into asoc-5.3
      ASoC: core: Adapt for debugfs API change
      ASoC: dapm: Adapt for debugfs API change
      Merge tag 'v5.2-rc6' into asoc-5.3
      Merge branch 'asoc-5.2' into asoc-linus
      Merge branch 'asoc-5.3' into asoc-next
      Merge remote-tracking branch 'asoc/topic/meson' into asoc-next

Mauro Carvalho Chehab (1):
      ASoC: dt-bindings: fix some broken links from txt->yaml conversion

Maxime Jourdan (1):
      ASoC: max98357a: Show KConfig entry

Maxime Ripard (5):
      dt-bindings: sound: Convert Allwinner SPDIF binding to YAML
      dt-bindings: sound: sun4i-spdif: Document that the RX channel can be =
missing
      dt-bindings: sound: Convert Allwinner I2S binding to YAML
      dt-bindings: sound: sun4i-i2s: Document that the RX channel can be mi=
ssing
      ASoC: sun4i-i2s: Change SR and WSS computation

Nathan Chancellor (1):
      ASoC: rt1011: Mark format integer literals as unsigned

Nathan Huckleberry (1):
      ASoC: tas571x: Fix -Wunused-const-variable

Nilkanth Ahirrao (1):
      ASoC: rsnd: fixup mod ID calculation in rsnd_ctu_probe_

Olivier Moysan (4):
      ASoC: stm32: spdifrx: manage identification registers
      ASoC: stm32: i2s: manage identification registers
      ASoC: stm32: sai: manage identification registers
      ASoC: stm32: dfsdm: add 16 bits audio record support

Pan Xiuli (1):
      ASoC: SOF: soundwire: add initial soundwire support

Paul Gortmaker (1):
      ASoC: soc-acpi: fix implicit header use of module.h/export.h

Pawe=C5=82 Har=C5=82ozi=C5=84ski (1):
      ASoC: Intel: Skylake: Use recommended SDxFMT programming sequence

Peter Ujfalusi (7):
      ASoC: pcm3168a: Implement set_tdm_slot callback
      bindings: sound: davinci-mcasp: Add support for optional auxclk-fs-ra=
tio
      ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio
      ASoC: ti: davinci-mcasp: Set unused serializers as INACTIVE
      ASoC: ti: davinci-mcasp: Fix slot mask settings when using multiple A=
XRs
      ASoC: pcm3168a: Rename min_frame_size to slot_width
      ASoC: pcm3168a: Add support for multi DIN/DOUT with TDM slots paramet=
er

Pierre-Louis Bossart (15):
      ASoC: Intel: boards: remove unnecessary inclusion of skl.h
      ASoC: Intel: sof-rt5682: fix undefined references with Baytrail-only =
support
      ASoC: Intel: use common helpers to detect CPUs
      ASoC: Intel: boards: remove dependency on asm/platform_sst_audio.h
      ASoC: Intel: boards: Add COMPILE_TEST for new machine drivers
      ASoC: SOF: add COMPILE_TEST for PCI options
      ASoC: SOF: Intel: cnl-ipc: read all IPC registers first
      ASoC: SOF: Intel: cnl-ipc: move code around for clarity
      ASoC: SOF: Intel: cnl-ipc: re-enable IPC IRQ at end of handler
      ASoC: SOF: Intel: hda-ipc: read all IPC registers first
      ASoC: SOF: Intel: hda-ipc: re-enable IPC IRQ at end of handler
      ASoC: SOF: Intel: ipc: don't check for HIPCCTL register value
      ASoC: soc-topology: fix modern dai link style
      ASoC: SOF: uapi: align comments with firmware files
      ASoC: SOF: ipc: clarify operator precedence

Randy Dunlap (1):
      ASoc: fix sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64

Ranjani Sridharan (13):
      ASoC: SOF: pcm: remove runtime PM calls during pcm open/close
      ASoC: SOF: add mode parameter for snd_sof_debugfs_buf_item
      ASoC: SOF: ipc: Introduce SOF_IPC_GLB_TEST_MSG IPC command
      ASoC: SOF: debug: add new debugfs entries for IPC flood test
      ASoC: SOF: Intel: hda: save handle to sdev in sof_intel_hda_stream
      ASoC: SOF: Intel: hda: add new macro hstream_to_sof_hda_stream()
      ASoC: SOF: topology: add cpu_dai_name for DAIs
      ASoC: SOF: Intel: hda: assign link DMA channel at run-time
      ASoC: SOF: Intel: hda: reserve host DMA channel for hostless streams
      ASoC: SOF: Intel: hda: release link DMA for paused streams during sus=
pend
      ASoC: SOF: Intel: hda: couple host and link DMA during FE hw_free
      ASoC: SOF: Intel: hda: modify stream interrupt handler
      ASoC: SOF: Intel: hda: clear stream status and wakests properly

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Reporting accurate hw_ptr for acp3x dma

Richard Fitzgerald (5):
      ASoC: madera: Add DT bindings for Cirrus Logic Madera codecs
      ASoC: madera: Add common support for Cirrus Logic Madera codecs
      ASoC: cs47l35: Add codec driver for Cirrus Logic CS47L35
      ASoC: cs47l85: Add codec driver for Cirrus Logic CS47L85
      ASoC: cs47l90: Add codec driver for Cirrus Logic CS47L90

S.j. Wang (5):
      ASoC: fsl_esai: Add pm runtime function
      ASoC: fsl_asrc: replace the process_option table with function
      ASoC: cs42xx8: Add reset gpio handling
      ASoC: cs42xx8: add reset-gpios in binding document
      ASoC: fsl_asrc: Unify the supported input and output rate

Saravanan Sekar (1):
      ASoC: tlv320aic3x: Add support for high power analog output

Sathya Prakash M R (1):
      ASoC: Intel: sof-rt5682: add newline for clarity

Seppo Ingalsuo (1):
      ASoC: SOF: Add DMIC token for unmute gain ramp time

Shengjiu Wang (2):
      ASoC: fsl_sai: Move clock operation to PM runtime
      ASoC: cs42xx8: Fix build error with CONFIG_GPIOLIB is not set

Shuming Fan (2):
      ASoC: rt1011: Add RT1011 amplifier driver
      ASoC: rt1011: fix warning reported by kbuild test robot and minor iss=
ue

Shunli Wang (3):
      ASoC: Mediatek: add memory interface data align
      ASoC: Mediatek: MT8183: set data align
      ASoC: Mediatek: MT8183: enable IIR filter

Simon Ho (1):
      ASoC: Add support for Conexant CX2072X CODEC

Srinivas Kandagatla (4):
      ASoC: msm8916-wcd-digital: Add sidetone support
      ASoC: core: Return -ENOTSUPP from set_channel_map() if no operation p=
rovided
      ASoC: qdsp6: q6afe-dai: Add missing Slimbus0 audio route
      ASoC: wcd9335: remove multiple defines.

Sylwester Nawrocki (1):
      ASoC: Remove erroneous soc_cleanup_card_resources() call

Takashi Iwai (1):
      ASoC: Intel: Add machine driver for CX2072X on BYT/CHT platforms

Tzung-Bi Shih (5):
      ASoC: max98357a: request GPIO when device get probed
      ASoC: mediatek: mt8183: remove unused DAPM pins
      ASoC: mediatek: mt8183: move card registration to the end of probe
      ASoC: core: use component driver name as component name
      ASoC: Intel: sof_rt5682: use GFP_KERNEL instead of GFP_ATOMIC

Wei Yongjun (1):
      ASoC: SOF: debug: fix possible memory leak in sof_dfsentry_write()

Wen Yang (1):
      ASoC: audio-graph-card: fix use-after-free in graph_for_each_link

Xun Zhang (1):
      ASoC: Intel: sof-rt5682: add MCLK support for BYT platform

Yong Zhi (1):
      ASoC: Intel: glk_rt5682_max98357a: Remap button control-function

YueHaibing (5):
      ASoC: cx2072x: remove set but not used variable 'is_right_j '
      ASoC: mediatek: Make some symbols static
      ASoC: SOF: Intel: hda: remove duplicated include from hda.c
      ASoC: madera: Remove duplicated include from cs47l35.c
      ASoC: rt1308: Fix platform_no_drv_owner.cocci warnings

Zhu Yingjiang (10):
      ASoC: SOF: Intel: ICL: add Icelake SSP count
      ASoC: SOF: Intel: ICL add Icelake chip info struct
      ASoC: SOF: Intel: hda: use the defined ppcap functions
      ASoC: SOF: topology: add min/max step for volume_table
      ASoC: SOF: topology: pass volume min/max linear value to FW
      ASoC: SOF: Intel: hda: use the SOF defined ppcap functions
      ASoC: SOF: Intel: hda: add function for hda stop chip
      ASoC: SOF: Intel: hda: use the defined stop chip in suspend
      ASoC: SOF: Intel: hda: make sure DMA is start/stop by read the RUN bit
      ASoC: SOF: Intel: hda: make sure RUN bit setting to 0 during clear st=
ream status

 .../devicetree/bindings/media/st,stm32-dcmi.txt    |    2 +-
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml    |  132 +
 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |  120 +
 .../bindings/sound/amlogic,axg-tdm-formatters.txt  |    6 +-
 .../bindings/sound/amlogic,g12a-tohdmitx.txt       |   55 +
 .../devicetree/bindings/sound/cs42xx8.txt          |    6 +
 .../bindings/sound/davinci-mcasp-audio.txt         |    3 +
 Documentation/devicetree/bindings/sound/madera.txt |   67 +
 .../devicetree/bindings/sound/max98357a.txt        |    4 +
 Documentation/devicetree/bindings/sound/rt1011.txt |   32 +
 Documentation/devicetree/bindings/sound/rt1308.txt |   17 +
 .../devicetree/bindings/sound/st,stm32-i2s.txt     |    2 +-
 .../devicetree/bindings/sound/st,stm32-sai.txt     |    2 +-
 .../devicetree/bindings/sound/sun4i-i2s.txt        |   45 -
 .../bindings/sound/sunxi,sun4i-spdif.txt           |   42 -
 MAINTAINERS                                        |    7 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   19 +-
 include/dt-bindings/sound/madera.h                 |   25 +
 include/dt-bindings/sound/meson-g12a-tohdmitx.h    |   13 +
 include/linux/mfd/madera/pdata.h                   |    4 +
 include/sound/hda_codec.h                          |    3 +
 include/sound/madera-pdata.h                       |   59 +
 include/sound/simple_card_utils.h                  |   20 +-
 include/sound/soc.h                                |  165 +-
 include/sound/sof/dai-intel.h                      |    3 +-
 include/sound/sof/header.h                         |    7 +-
 include/sound/sof/topology.h                       |    7 +-
 include/sound/sof/trace.h                          |   14 +-
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/eq.h                        |  172 -
 include/uapi/sound/sof/manifest.h                  |  188 -
 include/uapi/sound/sof/tokens.h                    |    1 +
 include/uapi/sound/sof/tone.h                      |   21 -
 include/uapi/sound/sof/trace.h                     |   66 -
 sound/hda/ext/hdac_ext_bus.c                       |    8 +-
 sound/soc/amd/acp-da7219-max98357a.c               |   42 +-
 sound/soc/amd/acp-rt5645.c                         |   21 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   43 +-
 sound/soc/atmel/atmel-classd.c                     |   21 +-
 sound/soc/atmel/atmel-pcm-dma.c                    |    9 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |    5 -
 sound/soc/atmel/atmel-pcm.h                        |    8 -
 sound/soc/atmel/atmel-pdmic.c                      |   21 +-
 sound/soc/atmel/atmel_ssc_dai.c                    |   11 -
 sound/soc/atmel/atmel_wm8904.c                     |   17 +-
 sound/soc/atmel/mikroe-proto.c                     |   21 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |   22 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |   20 +-
 sound/soc/atmel/tse850-pcm5142.c                   |   13 +-
 sound/soc/au1x/db1000.c                            |   10 +-
 sound/soc/au1x/db1200.c                            |   50 +-
 sound/soc/au1x/psc-i2s.c                           |    6 +-
 sound/soc/cirrus/edb93xx.c                         |   10 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |    7 +-
 sound/soc/cirrus/simone.c                          |   10 +-
 sound/soc/cirrus/snappercl15.c                     |   11 +-
 sound/soc/codecs/Kconfig                           |   45 +-
 sound/soc/codecs/Makefile                          |   14 +
 sound/soc/codecs/ad193x.c                          |   68 +-
 sound/soc/codecs/ak4118.c                          |   11 +-
 sound/soc/codecs/cros_ec_codec.c                   |    2 +-
 sound/soc/codecs/cs42xx8.c                         |   13 +
 sound/soc/codecs/cs47l35.c                         | 1777 +++++++++
 sound/soc/codecs/cs47l85.c                         | 2730 +++++++++++++
 sound/soc/codecs/cs47l90.c                         | 2653 +++++++++++++
 sound/soc/codecs/cx2072x.c                         | 1725 ++++++++
 sound/soc/codecs/cx2072x.h                         |  314 ++
 sound/soc/codecs/hdac_hdmi.c                       |   39 +
 sound/soc/codecs/hdmi-codec.c                      |  188 +-
 sound/soc/codecs/madera.c                          | 4177 ++++++++++++++++=
++++
 sound/soc/codecs/madera.h                          |  442 +++
 sound/soc/codecs/max98357a.c                       |   74 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |  282 ++
 sound/soc/codecs/nau8822.c                         |   18 +
 sound/soc/codecs/nau8822.h                         |    7 +
 sound/soc/codecs/nau8825.c                         |    4 +
 sound/soc/codecs/nau8825.h                         |    2 +
 sound/soc/codecs/pcm3168a.c                        |   91 +-
 sound/soc/codecs/rt1011.c                          | 2244 +++++++++++
 sound/soc/codecs/rt1011.h                          |  672 ++++
 sound/soc/codecs/rt1308.c                          |  898 +++++
 sound/soc/codecs/rt1308.h                          |  291 ++
 sound/soc/codecs/rt5514-spi.c                      |    4 +-
 sound/soc/codecs/rt5665.c                          |    2 +-
 sound/soc/codecs/rt5677-spi.c                      |    4 +-
 sound/soc/codecs/rt5677.c                          |  336 +-
 sound/soc/codecs/rt5677.h                          |   46 +-
 sound/soc/codecs/rt5682.c                          |   13 +-
 sound/soc/codecs/tas571x.c                         |    4 +-
 sound/soc/codecs/tlv320aic3x.c                     |   14 +-
 sound/soc/codecs/wcd9335.c                         |    7 +-
 sound/soc/codecs/wm_adsp.c                         |   37 +-
 sound/soc/fsl/efika-audio-fabric.c                 |   22 +-
 sound/soc/fsl/eukrea-tlv320.c                      |   19 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   47 +-
 sound/soc/fsl/fsl_asrc.c                           |  103 +-
 sound/soc/fsl/fsl_esai.c                           |  141 +-
 sound/soc/fsl/fsl_sai.c                            |   54 +-
 sound/soc/fsl/fsl_ssi.c                            |    4 +-
 sound/soc/fsl/fsl_ssi.h                            |    8 +-
 sound/soc/fsl/fsl_ssi_dbg.c                        |   18 +-
 sound/soc/fsl/fsl_utils.c                          |    2 +-
 sound/soc/fsl/imx-audmix.c                         |   45 +-
 sound/soc/fsl/imx-audmux.c                         |   10 +-
 sound/soc/fsl/imx-es8328.c                         |   23 +-
 sound/soc/fsl/imx-mc13783.c                        |   10 +-
 sound/soc/fsl/imx-sgtl5000.c                       |   23 +-
 sound/soc/fsl/imx-spdif.c                          |   20 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   33 +-
 sound/soc/fsl/mx27vis-aic32x4.c                    |   11 +-
 sound/soc/fsl/p1022_ds.c                           |   36 +-
 sound/soc/fsl/p1022_rdk.c                          |   35 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |   20 +-
 sound/soc/fsl/phycore-ac97.c                       |   10 +-
 sound/soc/fsl/wm1133-ev1.c                         |   10 +-
 sound/soc/generic/audio-graph-card.c               |   36 +-
 sound/soc/generic/simple-card-utils.c              |   21 +-
 sound/soc/generic/simple-card.c                    |   47 +-
 sound/soc/intel/Kconfig                            |   25 +
 sound/soc/intel/atom/sst/sst_acpi.c                |   65 +-
 sound/soc/intel/boards/Kconfig                     |   18 +-
 sound/soc/intel/boards/Makefile                    |    2 +
 sound/soc/intel/boards/bdw-rt5677.c                |   22 +-
 sound/soc/intel/boards/broadwell.c                 |   46 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |  163 +-
 sound/soc/intel/boards/bxt_rt298.c                 |  135 +-
 sound/soc/intel/boards/byt-max98090.c              |   10 +-
 sound/soc/intel/boards/byt-rt5640.c                |   10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |  270 ++
 sound/soc/intel/boards/bytcht_da7213.c             |   38 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   51 +-
 sound/soc/intel/boards/bytcht_nocodec.c            |   30 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   60 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   58 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   32 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |   41 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   59 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   39 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |  145 +-
 sound/soc/intel/boards/haswell.c                   |   46 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |  115 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |  286 +-
 sound/soc/intel/boards/kbl_rt5660.c                |   83 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |  184 +-
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  126 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |   67 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    4 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  120 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  132 +-
 sound/soc/intel/boards/skl_rt286.c                 |  118 +-
 sound/soc/intel/boards/sof_rt5682.c                |  165 +-
 sound/soc/intel/common/soc-acpi-intel-byt-match.c  |    8 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |    8 +
 sound/soc/intel/common/soc-intel-quirks.h          |  115 +
 sound/soc/intel/common/sst-ipc.c                   |    2 +-
 sound/soc/intel/skylake/cnl-sst.c                  |    2 +-
 sound/soc/intel/skylake/skl-debug.c                |    9 +
 sound/soc/intel/skylake/skl-messages.c             |   39 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   44 +-
 sound/soc/intel/skylake/skl-ssp-clk.c              |   16 +-
 sound/soc/intel/skylake/skl-sst-dsp.h              |    6 +-
 sound/soc/intel/skylake/skl-sst-ipc.c              |    4 +-
 sound/soc/intel/skylake/skl-sst-utils.c            |   23 +-
 sound/soc/intel/skylake/skl-sst.c                  |    4 +-
 sound/soc/intel/skylake/skl-topology.c             |   72 +-
 sound/soc/intel/skylake/skl-topology.h             |    8 +-
 sound/soc/intel/skylake/skl.c                      |   38 +-
 sound/soc/intel/skylake/skl.h                      |    6 +
 sound/soc/jz4740/qi_lb60.c                         |   10 +-
 sound/soc/kirkwood/armada-370-db.c                 |   42 +-
 sound/soc/mediatek/common/Makefile                 |    2 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |    6 +
 sound/soc/mediatek/common/mtk-base-afe.h           |    2 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |   22 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |   95 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |   34 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c          |  115 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |   34 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   51 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   85 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   74 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   23 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  197 +-
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c        |   14 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  193 +-
 sound/soc/meson/Kconfig                            |    8 +
 sound/soc/meson/Makefile                           |    2 +
 sound/soc/meson/axg-card.c                         |   87 +-
 sound/soc/meson/axg-tdm-formatter.c                |   29 +
 sound/soc/meson/axg-tdm-interface.c                |    4 +-
 sound/soc/meson/axg-tdm.h                          |    2 +-
 sound/soc/meson/axg-tdmin.c                        |    1 -
 sound/soc/meson/axg-tdmout.c                       |    1 -
 sound/soc/meson/g12a-tohdmitx.c                    |  413 ++
 sound/soc/mxs/mxs-sgtl5000.c                       |   27 +-
 sound/soc/nuc900/nuc900-audio.c                    |   10 +-
 sound/soc/pxa/brownstone.c                         |   10 +-
 sound/soc/pxa/corgi.c                              |   10 +-
 sound/soc/pxa/e740_wm9705.c                        |   20 +-
 sound/soc/pxa/e750_wm9705.c                        |   20 +-
 sound/soc/pxa/e800_wm9712.c                        |   21 +-
 sound/soc/pxa/em-x270.c                            |   20 +-
 sound/soc/pxa/hx4700.c                             |   10 +-
 sound/soc/pxa/imote2.c                             |   11 +-
 sound/soc/pxa/magician.c                           |   22 +-
 sound/soc/pxa/mioa701_wm9713.c                     |   20 +-
 sound/soc/pxa/palm27x.c                            |   20 +-
 sound/soc/pxa/poodle.c                             |   10 +-
 sound/soc/pxa/pxa2xx-ac97.c                        |    3 +-
 sound/soc/pxa/spitz.c                              |   10 +-
 sound/soc/pxa/tosa.c                               |   20 +-
 sound/soc/pxa/ttc-dkb.c                            |   10 +-
 sound/soc/pxa/z2.c                                 |   10 +-
 sound/soc/pxa/zylonite.c                           |   30 +-
 sound/soc/qcom/apq8016_sbc.c                       |   19 +-
 sound/soc/qcom/common.c                            |   34 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |    1 +
 sound/soc/qcom/qdsp6/q6core.c                      |   16 +-
 sound/soc/qcom/storm.c                             |   17 +-
 sound/soc/rockchip/Kconfig                         |    1 +
 sound/soc/rockchip/rk3288_hdmi_analog.c            |   21 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |   65 +-
 sound/soc/rockchip/rockchip_max98090.c             |   17 +-
 sound/soc/rockchip/rockchip_rt5645.c               |   33 +-
 sound/soc/samsung/arndale_rt5631.c                 |   25 +-
 sound/soc/samsung/bells.c                          |   87 +-
 sound/soc/samsung/h1940_uda1380.c                  |   10 +-
 sound/soc/samsung/jive_wm8750.c                    |   10 +-
 sound/soc/samsung/littlemill.c                     |   19 +-
 sound/soc/samsung/lowland.c                        |   26 +-
 sound/soc/samsung/neo1973_wm8753.c                 |   18 +-
 sound/soc/samsung/odroid.c                         |   29 +-
 sound/soc/samsung/rx1950_uda1380.c                 |   11 +-
 sound/soc/samsung/s3c24xx_simtec_hermes.c          |   11 +-
 sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c     |   11 +-
 sound/soc/samsung/s3c24xx_uda134x.c                |   10 +-
 sound/soc/samsung/smartq_wm8987.c                  |   10 +-
 sound/soc/samsung/smdk_spdif.c                     |   10 +-
 sound/soc/samsung/smdk_wm8580.c                    |   20 +-
 sound/soc/samsung/smdk_wm8994.c                    |   30 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |   10 +-
 sound/soc/samsung/snow.c                           |   40 +-
 sound/soc/samsung/speyside.c                       |   26 +-
 sound/soc/samsung/tm2_wm5110.c                     |   42 +-
 sound/soc/samsung/tobermory.c                      |   10 +-
 sound/soc/sh/migor.c                               |   10 +-
 sound/soc/sh/rcar/adg.c                            |    1 +
 sound/soc/sh/rcar/core.c                           |  120 +-
 sound/soc/sh/rcar/ctu.c                            |    2 +-
 sound/soc/sh/rcar/ssi.c                            |    1 +
 sound/soc/sh/rcar/ssiu.c                           |   92 +-
 sound/soc/sh/sh7760-ac97.c                         |   11 +-
 sound/soc/sirf/sirf-audio.c                        |   13 +-
 sound/soc/soc-acpi.c                               |    2 +
 sound/soc/soc-compress.c                           |   17 +-
 sound/soc/soc-core.c                               |  382 +-
 sound/soc/soc-dapm.c                               |   23 +-
 sound/soc/soc-pcm.c                                |   88 +-
 sound/soc/soc-topology.c                           |  146 +-
 sound/soc/sof/Kconfig                              |    8 +
 sound/soc/sof/control.c                            |  270 +-
 sound/soc/sof/debug.c                              |  247 +-
 sound/soc/sof/intel/Kconfig                        |   32 +
 sound/soc/sof/intel/apl.c                          |    2 +
 sound/soc/sof/intel/byt.c                          |    5 +-
 sound/soc/sof/intel/cnl.c                          |   79 +-
 sound/soc/sof/intel/hda-ctrl.c                     |   77 +-
 sound/soc/sof/intel/hda-dai.c                      |  293 +-
 sound/soc/sof/intel/hda-dsp.c                      |   63 +-
 sound/soc/sof/intel/hda-ipc.c                      |   43 +-
 sound/soc/sof/intel/hda-stream.c                   |  157 +-
 sound/soc/sof/intel/hda.c                          |   30 +-
 sound/soc/sof/intel/hda.h                          |   22 +-
 sound/soc/sof/ipc.c                                |   18 +-
 sound/soc/sof/loader.c                             |   10 +-
 sound/soc/sof/nocodec.c                            |   21 +-
 sound/soc/sof/ops.h                                |   24 +-
 sound/soc/sof/pcm.c                                |   36 +-
 sound/soc/sof/pm.c                                 |   43 +-
 sound/soc/sof/sof-acpi-dev.c                       |   59 +-
 sound/soc/sof/sof-pci-dev.c                        |   32 +-
 sound/soc/sof/sof-priv.h                           |   23 +-
 sound/soc/sof/topology.c                           |  156 +-
 sound/soc/sof/trace.c                              |   66 +-
 sound/soc/stm/stm32_adfsdm.c                       |   49 +-
 sound/soc/stm/stm32_i2s.c                          |   60 +-
 sound/soc/stm/stm32_sai.c                          |   44 +-
 sound/soc/stm/stm32_sai.h                          |   54 +-
 sound/soc/stm/stm32_sai_sub.c                      |   14 +-
 sound/soc/stm/stm32_spdifrx.c                      |   37 +-
 sound/soc/sunxi/sun4i-codec.c                      |   20 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   71 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   49 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |   50 +
 sound/soc/tegra/Makefile                           |    2 +-
 sound/soc/tegra/tegra_alc5632.c                    |   37 +-
 sound/soc/tegra/tegra_max98090.c                   |   17 +-
 sound/soc/tegra/tegra_rt5640.c                     |   17 +-
 sound/soc/tegra/tegra_rt5677.c                     |   37 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   37 +-
 sound/soc/tegra/tegra_wm8753.c                     |   17 +-
 sound/soc/tegra/tegra_wm8903.c                     |   17 +-
 sound/soc/tegra/tegra_wm9712.c                     |   14 +-
 sound/soc/tegra/trimslice.c                        |   19 +-
 sound/soc/ti/ams-delta.c                           |   10 +-
 sound/soc/ti/davinci-evm.c                         |  105 +-
 sound/soc/ti/davinci-mcasp.c                       |   81 +-
 sound/soc/ti/n810.c                                |   11 +-
 sound/soc/ti/omap-abe-twl6040.c                    |   36 +-
 sound/soc/ti/omap-hdmi.c                           |   20 +-
 sound/soc/ti/omap-mcbsp.c                          |    2 +-
 sound/soc/ti/omap-twl4030.c                        |   36 +-
 sound/soc/ti/omap3pandora.c                        |   20 +-
 sound/soc/ti/osk5912.c                             |   11 +-
 sound/soc/ti/rx51.c                                |   23 +-
 sound/soc/txx9/txx9aclc-generic.c                  |   10 +-
 sound/soc/ux500/mop500.c                           |   36 +-
 sound/usb/bcd2000/Makefile                         |    2 +-
 318 files changed, 26455 insertions(+), 4825 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i=
-a10-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i=
-a10-spdif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-to=
hdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/madera.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rt1011.txt
 create mode 100755 Documentation/devicetree/bindings/sound/rt1308.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sunxi,sun4i-spd=
if.txt
 create mode 100644 include/dt-bindings/sound/madera.h
 create mode 100644 include/dt-bindings/sound/meson-g12a-tohdmitx.h
 create mode 100644 include/sound/madera-pdata.h
 delete mode 100644 include/uapi/sound/sof/eq.h
 delete mode 100644 include/uapi/sound/sof/manifest.h
 delete mode 100644 include/uapi/sound/sof/tone.h
 delete mode 100644 include/uapi/sound/sof/trace.h
 create mode 100644 sound/soc/codecs/cs47l35.c
 create mode 100644 sound/soc/codecs/cs47l85.c
 create mode 100644 sound/soc/codecs/cs47l90.c
 create mode 100644 sound/soc/codecs/cx2072x.c
 create mode 100644 sound/soc/codecs/cx2072x.h
 create mode 100644 sound/soc/codecs/madera.c
 create mode 100644 sound/soc/codecs/madera.h
 create mode 100644 sound/soc/codecs/rt1011.c
 create mode 100644 sound/soc/codecs/rt1011.h
 create mode 100755 sound/soc/codecs/rt1308.c
 create mode 100755 sound/soc/codecs/rt1308.h
 create mode 100644 sound/soc/intel/boards/bytcht_cx2072x.c
 create mode 100644 sound/soc/intel/common/soc-intel-quirks.h
 create mode 100644 sound/soc/meson/g12a-tohdmitx.c

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0jG14ACgkQJNaLcl1U
h9Cgtgf/YUZSbJbWXnQc706vWHZyxPcKNZ5096uX4T47wYYPPOWZmu05i09ZWiy4
abVukrgN5wS+0ATSEEOZa5jz01JWYDMz6zsRDtCj81B66Ucko3XoCieRjGfHMEuO
puP/VrXaEwa2LH1UcowDJlhFc1Gwgw4ymFto/ypwMNLNDKaXH3M/s/ni46Zw9hrA
fJuVEEyYGPsb2WUeqXyNvwxEu6CcufSeUmbtr3p8TW6MX0TYk6lT2BytCT4lm/Kk
fDpbmXCu5mKTdnHnESoie9FJ5Ab9W2aekAx1zbNr6Or2NnZQrWESPcNckLMyhH9y
qREF5XHIz12t6PMV7FyvAXosUwCyog==
=+pkB
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============7420767236636539499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7420767236636539499==--
