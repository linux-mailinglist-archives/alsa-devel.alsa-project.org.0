Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4EA325529
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA751669;
	Thu, 25 Feb 2021 19:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA751669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276502;
	bh=xpjvRH/Kwidg68bZehC5cxbL/OTwJfkTGWCc9PF7R/I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l7r1C4Dht7ic15GsiU1WYmF1Rfb60AiVhB8U0kz19P1NyRnQhWDL/Vxe0xTYQI8mp
	 0mhjH33T9lyYPvl82sl6gaGLwojZ6Numy9VYQV+jduKqTfFYuseHtxCHiV5voVGW7W
	 AQ8Y6/3MHD7dMZuI0M3nZTEpD7a529hxXaZkNqng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837FEF80245;
	Thu, 25 Feb 2021 19:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6726BF8016D; Thu, 25 Feb 2021 19:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD10F800E4
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD10F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Qg/Kqpj7"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6037e72c0001>; Thu, 25 Feb 2021 10:06:36 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb
 2021 18:06:35 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 18:06:33 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>
Subject: [RFC PATCH 0/5] Flexible sysclk/pll configuration
Date: Thu, 25 Feb 2021 23:35:59 +0530
Message-ID: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614276396; bh=gxxMP7OqiMM8DpcE1CtsHVPkt0PT+Ai1EBJJpiR+6vA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=Qg/Kqpj79vjtl23ujzE4nmEFGbuzbG5Di6uRtFLKDAzJ/BKNkX2pA9PjH2pTNw/ku
 Vf3eqFwoK2NI7ouzhsLCzoyIKor5WYVSlgT1dCzDp0KJpMnNr10sDi06mwr3A9Rk7N
 KOAn3WvlCGXW9LKjVZXsHY3kNqE4hE8j+ON1+KRUJtfM04iZlCV5MSLCzaGxn/FK06
 4c87LeyNfV6crtAWz9qMXGnw2x98w11ow6m2lPeN3AQlcHgNETb+d82IdVjc+bal/m
 8VKi9eaRnj1NAogzLotz9YwpFBS3svt/9Ph/82dDK5LAw5hydUGta7/SQozT5x+/l0
 ULY99YMArlaeQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

This series attempts to add flexible system clock (sysclk) and pll
configuration for the DAI controller from simple card or audio graph
card.

Sysclk configuration
====================
  Motivation:
  -----------
    The problem this tries to address is, some Codecs may have
    multiple clocks and multiple sources for its sysclk. For example
    sysclk may depend on MCLK provided by SoC or it may used an
    internal pll. The simple card or audio graph card driver is
    generic and can be used on multiple platforms. So if a platform
    using this driver needs a generic configuration, then the Codec
    specific stuff cannot be hardcoded in the driver. Hence it would
    be better if the info is driven from DT, especially from a
    Codec DAI or endpoint subnode.

  Solution:
  ---------
    "system-clock-id" and "system-clock-source" DT properties can be
    exposed for a flexible sysclk configuration. These properties
    go into a Codec DAI or endpoint subnode.

    Please note that other sysclk related properties like
    "system-clock-frequency" and "system-clock-direction-out" are
    already present.

    Currently snd_soc_dai_set_sysclk() does not have an argument
    for source. This series adds this additional field and updates
    all the required drivers. This is needed because ideally sysclk
    "clk_id" and "source" fields are different. Some drivers are
    making use of "clk_id" field to program source information.
    **May be this needs to be corrected going ahead**


Pll configuration
=================
  Motivation:
  -----------
    Similar to sysclk configuration, pll configuration also needs
    little more flexibility. If a Codec has internal pll and it
    can be sourced from multiple clocks a specific configuration
    may be required for a given platform.

    Some of the cases are:
      - MCLK (supplied by SoC) --> Codec pll -> Codec sysclk
      - SoC I2S bit clock (BCLK) --> Codec pll -> Codec sysclk

  Solution:
  ---------
    Approach is similar to what is done for extending sysclk
    flexibility. Following DT properties are added to address the
    same.

      "pll-id"
      "pll-source"
      "pll-input-reference"
      "pll-output-reference"
      "pll-input-frequency"
      "pll-output-frequency"

    All these are optional properties. Simple card or audio graph
    card drivers can use above info and call snd_soc_dai_set_pll()
    for necessary configuration.

Sameer Pujar (5):
  ASoC: soc-component: Fix return value of snd_soc_component_set_pll()
  ASoC: soc-dai: Add sysclk source to snd_soc_dai_set_sysclk()
  ASoC: audio-graph-card: Add bindings for sysclk and pll
  ASoC: simple-card-utils: Parse sysclk id and source
  ASoC: simple-card-utils: Support pll configuration

 .../bindings/sound/audio-graph-port.yaml           |  71 +++++++++
 include/sound/simple_card_utils.h                  |  35 +++++
 include/sound/soc-dai.h                            |   4 +-
 sound/soc/amd/acp-da7219-max98357a.c               |   2 +-
 sound/soc/amd/acp-rt5645.c                         |   2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |   4 +-
 sound/soc/atmel/atmel_wm8904.c                     |   2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |   2 +-
 sound/soc/atmel/mikroe-proto.c                     |   2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |   2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |   2 +-
 sound/soc/bcm/cygnus-ssp.c                         |   2 +-
 sound/soc/cirrus/edb93xx.c                         |   2 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |   2 +-
 sound/soc/cirrus/snappercl15.c                     |   4 +-
 sound/soc/codecs/88pm860x-codec.c                  |   2 +-
 sound/soc/codecs/ad193x.c                          |   2 +-
 sound/soc/codecs/adau1373.c                        |   2 +-
 sound/soc/codecs/adau17x1.c                        |   2 +-
 sound/soc/codecs/ak4535.c                          |   2 +-
 sound/soc/codecs/ak4613.c                          |   2 +-
 sound/soc/codecs/ak4641.c                          |   2 +-
 sound/soc/codecs/ak4642.c                          |   2 +-
 sound/soc/codecs/ak4671.c                          |   2 +-
 sound/soc/codecs/alc5623.c                         |   2 +-
 sound/soc/codecs/alc5632.c                         |   2 +-
 sound/soc/codecs/arizona.c                         |   2 +-
 sound/soc/codecs/cpcap.c                           |   4 +-
 sound/soc/codecs/cq93vc.c                          |   2 +-
 sound/soc/codecs/cs35l34.c                         |   2 +-
 sound/soc/codecs/cs35l35.c                         |   2 +-
 sound/soc/codecs/cs35l36.c                         |   2 +-
 sound/soc/codecs/cs4265.c                          |   2 +-
 sound/soc/codecs/cs4270.c                          |   2 +-
 sound/soc/codecs/cs4271.c                          |   2 +-
 sound/soc/codecs/cs42l42.c                         |   2 +-
 sound/soc/codecs/cs42l51.c                         |   2 +-
 sound/soc/codecs/cs42l52.c                         |   2 +-
 sound/soc/codecs/cs42l56.c                         |   2 +-
 sound/soc/codecs/cs42l73.c                         |   2 +-
 sound/soc/codecs/cs42xx8.c                         |   2 +-
 sound/soc/codecs/cs43130.c                         |   2 +-
 sound/soc/codecs/cs53l30.c                         |   2 +-
 sound/soc/codecs/cx2072x.c                         |   2 +-
 sound/soc/codecs/da7210.c                          |   2 +-
 sound/soc/codecs/da7218.c                          |   2 +-
 sound/soc/codecs/da7219.c                          |   2 +-
 sound/soc/codecs/da732x.c                          |   2 +-
 sound/soc/codecs/da9055.c                          |   2 +-
 sound/soc/codecs/es7134.c                          |   2 +-
 sound/soc/codecs/es7241.c                          |   2 +-
 sound/soc/codecs/es8316.c                          |   2 +-
 sound/soc/codecs/es8328.c                          |   2 +-
 sound/soc/codecs/lm49453.c                         |   2 +-
 sound/soc/codecs/madera.c                          |   3 +-
 sound/soc/codecs/max98088.c                        |   3 +-
 sound/soc/codecs/max98090.c                        |   2 +-
 sound/soc/codecs/max98095.c                        |   2 +-
 sound/soc/codecs/max98390.c                        |   2 +-
 sound/soc/codecs/max9850.c                         |   2 +-
 sound/soc/codecs/max9867.c                         |   2 +-
 sound/soc/codecs/max98925.c                        |   2 +-
 sound/soc/codecs/max98927.c                        |   2 +-
 sound/soc/codecs/mc13783.c                         |   6 +-
 sound/soc/codecs/ml26124.c                         |   2 +-
 sound/soc/codecs/nau8810.c                         |   2 +-
 sound/soc/codecs/nau8822.c                         |   2 +-
 sound/soc/codecs/pcm186x.c                         |   2 +-
 sound/soc/codecs/pcm3060.c                         |   2 +-
 sound/soc/codecs/pcm3168a.c                        |   2 +-
 sound/soc/codecs/rt1011.c                          |   2 +-
 sound/soc/codecs/rt1305.c                          |   2 +-
 sound/soc/codecs/rt274.c                           |   2 +-
 sound/soc/codecs/rt286.c                           |   2 +-
 sound/soc/codecs/rt298.c                           |   2 +-
 sound/soc/codecs/rt5514.c                          |   2 +-
 sound/soc/codecs/rt5616.c                          |   2 +-
 sound/soc/codecs/rt5631.c                          |   2 +-
 sound/soc/codecs/rt5640.c                          |   2 +-
 sound/soc/codecs/rt5645.c                          |   2 +-
 sound/soc/codecs/rt5651.c                          |   2 +-
 sound/soc/codecs/rt5660.c                          |   2 +-
 sound/soc/codecs/rt5663.c                          |   2 +-
 sound/soc/codecs/rt5677.c                          |   2 +-
 sound/soc/codecs/sgtl5000.c                        |   2 +-
 sound/soc/codecs/ssm2602.c                         |   2 +-
 sound/soc/codecs/sta32x.c                          |   2 +-
 sound/soc/codecs/sta350.c                          |   2 +-
 sound/soc/codecs/sti-sas.c                         |   2 +-
 sound/soc/codecs/tas2552.c                         |   2 +-
 sound/soc/codecs/tas5086.c                         |   2 +-
 sound/soc/codecs/tlv320aic23.c                     |   2 +-
 sound/soc/codecs/tlv320aic26.c                     |   2 +-
 sound/soc/codecs/tlv320aic31xx.c                   |   2 +-
 sound/soc/codecs/tlv320aic32x4.c                   |   2 +-
 sound/soc/codecs/tlv320aic3x.c                     |   2 +-
 sound/soc/codecs/tlv320dac33.c                     |   2 +-
 sound/soc/codecs/tscs454.c                         |   2 +-
 sound/soc/codecs/twl4030.c                         |   4 +-
 sound/soc/codecs/twl6040.c                         |   2 +-
 sound/soc/codecs/uda1334.c                         |   2 +-
 sound/soc/codecs/uda134x.c                         |   2 +-
 sound/soc/codecs/wm8350.c                          |   2 +-
 sound/soc/codecs/wm8400.c                          |   2 +-
 sound/soc/codecs/wm8523.c                          |   2 +-
 sound/soc/codecs/wm8524.c                          |   2 +-
 sound/soc/codecs/wm8580.c                          |   2 +-
 sound/soc/codecs/wm8711.c                          |   2 +-
 sound/soc/codecs/wm8731.c                          |   2 +-
 sound/soc/codecs/wm8737.c                          |   2 +-
 sound/soc/codecs/wm8741.c                          |   2 +-
 sound/soc/codecs/wm8750.c                          |   2 +-
 sound/soc/codecs/wm8753.c                          |   2 +-
 sound/soc/codecs/wm8770.c                          |   2 +-
 sound/soc/codecs/wm8776.c                          |   2 +-
 sound/soc/codecs/wm8804.c                          |   2 +-
 sound/soc/codecs/wm8903.c                          |   2 +-
 sound/soc/codecs/wm8904.c                          |   2 +-
 sound/soc/codecs/wm8940.c                          |   2 +-
 sound/soc/codecs/wm8955.c                          |   2 +-
 sound/soc/codecs/wm8960.c                          |   2 +-
 sound/soc/codecs/wm8961.c                          |   2 +-
 sound/soc/codecs/wm8962.c                          |   2 +-
 sound/soc/codecs/wm8971.c                          |   2 +-
 sound/soc/codecs/wm8974.c                          |   2 +-
 sound/soc/codecs/wm8978.c                          |   2 +-
 sound/soc/codecs/wm8983.c                          |   2 +-
 sound/soc/codecs/wm8985.c                          |   2 +-
 sound/soc/codecs/wm8988.c                          |   2 +-
 sound/soc/codecs/wm8990.c                          |   2 +-
 sound/soc/codecs/wm8993.c                          |   2 +-
 sound/soc/codecs/wm8994.c                          |   2 +-
 sound/soc/codecs/wm8995.c                          |   2 +-
 sound/soc/codecs/wm8996.c                          |   2 +-
 sound/soc/fsl/eukrea-tlv320.c                      |   4 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_esai.c                           |   2 +-
 sound/soc/fsl/fsl_micfil.c                         |   2 +-
 sound/soc/fsl/fsl_sai.c                            |   8 +-
 sound/soc/fsl/imx-audmix.c                         |   2 +-
 sound/soc/fsl/imx-hdmi.c                           |   2 +-
 sound/soc/fsl/imx-sgtl5000.c                       |   2 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |   2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |   2 +-
 sound/soc/fsl/p1022_ds.c                           |   2 +-
 sound/soc/generic/simple-card-utils.c              | 173 +++++++++++++++++++--
 sound/soc/intel/boards/bdw-rt5650.c                |   2 +-
 sound/soc/intel/boards/bdw-rt5677.c                |   4 +-
 sound/soc/intel/boards/broadwell.c                 |   2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   2 +-
 sound/soc/intel/boards/bxt_rt298.c                 |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |   2 +-
 sound/soc/intel/boards/bytcht_da7213.c             |   2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   2 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   4 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   4 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |   2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   4 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   4 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |   2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   2 +-
 sound/soc/intel/boards/haswell.c                   |   2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |   2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |   2 +-
 sound/soc/intel/boards/skl_rt286.c                 |   2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |   2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |   2 +-
 sound/soc/intel/boards/sof_rt5682.c                |   4 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c            |   2 +-
 sound/soc/intel/boards/sof_wm8804.c                |   2 +-
 sound/soc/jz4740/jz4740-i2s.c                      |   2 +-
 sound/soc/kirkwood/armada-370-db.c                 |   2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |   4 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |   4 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |   2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |   2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   8 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |   2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c         |   2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   6 +-
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         |   2 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c         |   2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   8 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |   2 +-
 sound/soc/meson/axg-tdm-interface.c                |   2 +-
 sound/soc/meson/meson-card-utils.c                 |   4 +-
 sound/soc/mxs/mxs-saif.c                           |   2 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |   4 +-
 sound/soc/pxa/brownstone.c                         |   4 +-
 sound/soc/pxa/corgi.c                              |   4 +-
 sound/soc/pxa/hx4700.c                             |   4 +-
 sound/soc/pxa/imote2.c                             |   4 +-
 sound/soc/pxa/magician.c                           |   4 +-
 sound/soc/pxa/mmp-sspa.c                           |   2 +-
 sound/soc/pxa/poodle.c                             |   4 +-
 sound/soc/pxa/pxa-ssp.c                            |   2 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   2 +-
 sound/soc/pxa/spitz.c                              |   4 +-
 sound/soc/pxa/z2.c                                 |   4 +-
 sound/soc/pxa/zylonite.c                           |   2 +-
 sound/soc/qcom/apq8096.c                           |   2 +-
 sound/soc/qcom/lpass-cpu.c                         |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   2 +-
 sound/soc/qcom/sc7180.c                            |   6 +-
 sound/soc/qcom/sdm845.c                            |  22 +--
 sound/soc/qcom/sm8250.c                            |   2 +-
 sound/soc/qcom/storm.c                             |   2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |   4 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |  14 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   2 +-
 sound/soc/rockchip/rockchip_max98090.c             |   4 +-
 sound/soc/rockchip/rockchip_rt5645.c               |   4 +-
 sound/soc/samsung/aries_wm8994.c                   |   6 +-
 sound/soc/samsung/arndale.c                        |   8 +-
 sound/soc/samsung/bells.c                          |   6 +-
 sound/soc/samsung/h1940_uda1380.c                  |   2 +-
 sound/soc/samsung/i2s.c                            |   6 +-
 sound/soc/samsung/jive_wm8750.c                    |   2 +-
 sound/soc/samsung/littlemill.c                     |  14 +-
 sound/soc/samsung/midas_wm1811.c                   |  10 +-
 sound/soc/samsung/neo1973_wm8753.c                 |   4 +-
 sound/soc/samsung/odroid.c                         |   2 +-
 sound/soc/samsung/pcm.c                            |   2 +-
 sound/soc/samsung/rx1950_uda1380.c                 |   2 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |   2 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |   4 +-
 sound/soc/samsung/s3c24xx_uda134x.c                |   4 +-
 sound/soc/samsung/smartq_wm8987.c                  |   6 +-
 sound/soc/samsung/smdk_spdif.c                     |   2 +-
 sound/soc/samsung/smdk_wm8580.c                    |   2 +-
 sound/soc/samsung/smdk_wm8994.c                    |   2 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |   4 +-
 sound/soc/samsung/snow.c                           |   2 +-
 sound/soc/samsung/spdif.c                          |   2 +-
 sound/soc/samsung/speyside.c                       |   8 +-
 sound/soc/samsung/tm2_wm5110.c                     |   6 +-
 sound/soc/samsung/tobermory.c                      |   6 +-
 sound/soc/sh/migor.c                               |   4 +-
 sound/soc/sh/siu_dai.c                             |   2 +-
 sound/soc/sh/ssi.c                                 |   2 +-
 sound/soc/soc-component.c                          |   2 +-
 sound/soc/soc-dai.c                                |   9 +-
 sound/soc/sti/uniperif_player.c                    |   2 +-
 sound/soc/stm/stm32_adfsdm.c                       |   2 +-
 sound/soc/stm/stm32_i2s.c                          |   2 +-
 sound/soc/stm/stm32_sai_sub.c                      |   2 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   2 +-
 sound/soc/tegra/tegra_alc5632.c                    |   2 +-
 sound/soc/tegra/tegra_max98090.c                   |   2 +-
 sound/soc/tegra/tegra_rt5640.c                     |   2 +-
 sound/soc/tegra/tegra_rt5677.c                     |   2 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   2 +-
 sound/soc/tegra/tegra_wm8753.c                     |   2 +-
 sound/soc/tegra/tegra_wm8903.c                     |   2 +-
 sound/soc/tegra/trimslice.c                        |   2 +-
 sound/soc/ti/davinci-evm.c                         |   4 +-
 sound/soc/ti/davinci-mcasp.c                       |   2 +-
 sound/soc/ti/j721e-evm.c                           |   8 +-
 sound/soc/ti/n810.c                                |   2 +-
 sound/soc/ti/omap-abe-twl6040.c                    |   6 +-
 sound/soc/ti/omap-dmic.c                           |   2 +-
 sound/soc/ti/omap-mcbsp.c                          |   2 +-
 sound/soc/ti/omap3pandora.c                        |   4 +-
 sound/soc/ti/rx51.c                                |   2 +-
 sound/soc/uniphier/aio-cpu.c                       |   4 +-
 sound/soc/ux500/ux500_msp_dai.c                    |   2 +-
 271 files changed, 639 insertions(+), 389 deletions(-)

-- 
2.7.4

