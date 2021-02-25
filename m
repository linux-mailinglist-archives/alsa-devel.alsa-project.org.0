Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FB32553A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:10:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF821681;
	Thu, 25 Feb 2021 19:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF821681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276618;
	bh=tinjTZNkQvCUbQplVHShktV++um/6xwaavLBueCRgKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZfNBuLJofd84br8WrvTyx3t48vnnlPUbXNRInV1iywlLkWxbh0uuqZQkPFgjc0jtC
	 HwX1Sy6zWqdjSU9fJtozbwZoIJr/4s1RQBc8ciXm7Qr5elD/SlyxBcaQfHhYJ1bpJY
	 NTWPj4UQj19SzlonnHvyPLhF5M/jnNpczoOjQ+PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCCDF804AB;
	Thu, 25 Feb 2021 19:07:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78FE0F8032D; Thu, 25 Feb 2021 19:07:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA8FF80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA8FF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XIReX4Iu"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6037e7320000>; Thu, 25 Feb 2021 10:06:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb
 2021 18:06:41 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 18:06:39 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>
Subject: [RFC PATCH 2/5] ASoC: soc-dai: Add sysclk source to
 snd_soc_dai_set_sysclk()
Date: Thu, 25 Feb 2021 23:36:01 +0530
Message-ID: <1614276364-13655-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614276402; bh=3ljsfZEGvDwYGPHBG+AAM4MPQ30jRmiD9MH7xP1sUtA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=XIReX4IuKY45lywnEmo/Rc2Nt44akEx/YxQs8wECF3508nFf5m3zv9OI9eiQ03Nv5
 CCc7bGo32jsxoy0Ftgrxbw0TyQ0o13CKe8djOwPghNJUOkT3a+sxjP74O0oK9bkwDb
 a3zB4IqqynXptHJ0Qw5R/p3/KGYJSesfegPUuMBt7GgfCEzKhKBEzyvjQOvTJCxscJ
 +CEj1D3JiZf1ktmVe0tqCHb7GjPwOVlcgyLnvkpGcJgS0x62zsiQJsGRVxF8m1+SKG
 si+4e2xAPB9ijNmj09c0q0wwzXppIicZI8j1FTPyhmEXxF05iySYNl1pfx+lZkdoN4
 o8J9HpICNYEpw==
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

The snd_soc_dai_set_sysclk() does not take any argument for system clock
(sysclk) source. It has "clk_id" argument which some drivers use for
describing sysclk source and others use it to identify a specific clock.
Hence there seems to be an inconsistency in the way "clk_id" is used.
Few such examples below:
  - sound/soc/atmel/sam9g20_wm8731.c      (clk_id used as sysclk source)
  - sound/soc/atmel/sam9x5_wm8731.c       (clk_id used as sysclk source)
  - sound/soc/intel/boards/bytcr_wm5102.c (clk_id used to identify specific
    clock)

Moreover snd_soc_component_set_sysclk() has both "clk_id" and "source"
argument. This is invoked by snd_soc_dai_set_sysclk() which hard codes
the "source" field for the component to 0. There is no way to propagate
sysclk source info to the component from snd_soc_dai_set_sysclk().

To allow selection of a particular source for sysclk, when a device has
multiple sources for it, and to address above, "source" argument is added
to snd_soc_dai_set_sysclk(). This is reflected across all the drivers
where this callback is used. These drivers continue to use the way they
have been using "clk_id". Though ideally we should have a consistent usage
for it and this is not in the scope of current patch to fix that.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/soc-dai.h                            |  4 ++--
 sound/soc/amd/acp-da7219-max98357a.c               |  2 +-
 sound/soc/amd/acp-rt5645.c                         |  2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c               |  4 ++--
 sound/soc/atmel/atmel_wm8904.c                     |  2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |  2 +-
 sound/soc/atmel/mikroe-proto.c                     |  2 +-
 sound/soc/atmel/sam9g20_wm8731.c                   |  2 +-
 sound/soc/atmel/sam9x5_wm8731.c                    |  2 +-
 sound/soc/bcm/cygnus-ssp.c                         |  2 +-
 sound/soc/cirrus/edb93xx.c                         |  2 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |  2 +-
 sound/soc/cirrus/snappercl15.c                     |  4 ++--
 sound/soc/codecs/88pm860x-codec.c                  |  2 +-
 sound/soc/codecs/ad193x.c                          |  2 +-
 sound/soc/codecs/adau1373.c                        |  2 +-
 sound/soc/codecs/adau17x1.c                        |  2 +-
 sound/soc/codecs/ak4535.c                          |  2 +-
 sound/soc/codecs/ak4613.c                          |  2 +-
 sound/soc/codecs/ak4641.c                          |  2 +-
 sound/soc/codecs/ak4642.c                          |  2 +-
 sound/soc/codecs/ak4671.c                          |  2 +-
 sound/soc/codecs/alc5623.c                         |  2 +-
 sound/soc/codecs/alc5632.c                         |  2 +-
 sound/soc/codecs/arizona.c                         |  2 +-
 sound/soc/codecs/cpcap.c                           |  4 ++--
 sound/soc/codecs/cq93vc.c                          |  2 +-
 sound/soc/codecs/cs35l34.c                         |  2 +-
 sound/soc/codecs/cs35l35.c                         |  2 +-
 sound/soc/codecs/cs35l36.c                         |  2 +-
 sound/soc/codecs/cs4265.c                          |  2 +-
 sound/soc/codecs/cs4270.c                          |  2 +-
 sound/soc/codecs/cs4271.c                          |  2 +-
 sound/soc/codecs/cs42l42.c                         |  2 +-
 sound/soc/codecs/cs42l51.c                         |  2 +-
 sound/soc/codecs/cs42l52.c                         |  2 +-
 sound/soc/codecs/cs42l56.c                         |  2 +-
 sound/soc/codecs/cs42l73.c                         |  2 +-
 sound/soc/codecs/cs42xx8.c                         |  2 +-
 sound/soc/codecs/cs43130.c                         |  2 +-
 sound/soc/codecs/cs53l30.c                         |  2 +-
 sound/soc/codecs/cx2072x.c                         |  2 +-
 sound/soc/codecs/da7210.c                          |  2 +-
 sound/soc/codecs/da7218.c                          |  2 +-
 sound/soc/codecs/da7219.c                          |  2 +-
 sound/soc/codecs/da732x.c                          |  2 +-
 sound/soc/codecs/da9055.c                          |  2 +-
 sound/soc/codecs/es7134.c                          |  2 +-
 sound/soc/codecs/es7241.c                          |  2 +-
 sound/soc/codecs/es8316.c                          |  2 +-
 sound/soc/codecs/es8328.c                          |  2 +-
 sound/soc/codecs/lm49453.c                         |  2 +-
 sound/soc/codecs/madera.c                          |  3 ++-
 sound/soc/codecs/max98088.c                        |  3 ++-
 sound/soc/codecs/max98090.c                        |  2 +-
 sound/soc/codecs/max98095.c                        |  2 +-
 sound/soc/codecs/max98390.c                        |  2 +-
 sound/soc/codecs/max9850.c                         |  2 +-
 sound/soc/codecs/max9867.c                         |  2 +-
 sound/soc/codecs/max98925.c                        |  2 +-
 sound/soc/codecs/max98927.c                        |  2 +-
 sound/soc/codecs/mc13783.c                         |  6 +++---
 sound/soc/codecs/ml26124.c                         |  2 +-
 sound/soc/codecs/nau8810.c                         |  2 +-
 sound/soc/codecs/nau8822.c                         |  2 +-
 sound/soc/codecs/pcm186x.c                         |  2 +-
 sound/soc/codecs/pcm3060.c                         |  2 +-
 sound/soc/codecs/pcm3168a.c                        |  2 +-
 sound/soc/codecs/rt1011.c                          |  2 +-
 sound/soc/codecs/rt1305.c                          |  2 +-
 sound/soc/codecs/rt274.c                           |  2 +-
 sound/soc/codecs/rt286.c                           |  2 +-
 sound/soc/codecs/rt298.c                           |  2 +-
 sound/soc/codecs/rt5514.c                          |  2 +-
 sound/soc/codecs/rt5616.c                          |  2 +-
 sound/soc/codecs/rt5631.c                          |  2 +-
 sound/soc/codecs/rt5640.c                          |  2 +-
 sound/soc/codecs/rt5645.c                          |  2 +-
 sound/soc/codecs/rt5651.c                          |  2 +-
 sound/soc/codecs/rt5660.c                          |  2 +-
 sound/soc/codecs/rt5663.c                          |  2 +-
 sound/soc/codecs/rt5677.c                          |  2 +-
 sound/soc/codecs/sgtl5000.c                        |  2 +-
 sound/soc/codecs/ssm2602.c                         |  2 +-
 sound/soc/codecs/sta32x.c                          |  2 +-
 sound/soc/codecs/sta350.c                          |  2 +-
 sound/soc/codecs/sti-sas.c                         |  2 +-
 sound/soc/codecs/tas2552.c                         |  2 +-
 sound/soc/codecs/tas5086.c                         |  2 +-
 sound/soc/codecs/tlv320aic23.c                     |  2 +-
 sound/soc/codecs/tlv320aic26.c                     |  2 +-
 sound/soc/codecs/tlv320aic31xx.c                   |  2 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  2 +-
 sound/soc/codecs/tlv320aic3x.c                     |  2 +-
 sound/soc/codecs/tlv320dac33.c                     |  2 +-
 sound/soc/codecs/tscs454.c                         |  2 +-
 sound/soc/codecs/twl4030.c                         |  4 ++--
 sound/soc/codecs/twl6040.c                         |  2 +-
 sound/soc/codecs/uda1334.c                         |  2 +-
 sound/soc/codecs/uda134x.c                         |  2 +-
 sound/soc/codecs/wm8350.c                          |  2 +-
 sound/soc/codecs/wm8400.c                          |  2 +-
 sound/soc/codecs/wm8523.c                          |  2 +-
 sound/soc/codecs/wm8524.c                          |  2 +-
 sound/soc/codecs/wm8580.c                          |  2 +-
 sound/soc/codecs/wm8711.c                          |  2 +-
 sound/soc/codecs/wm8731.c                          |  2 +-
 sound/soc/codecs/wm8737.c                          |  2 +-
 sound/soc/codecs/wm8741.c                          |  2 +-
 sound/soc/codecs/wm8750.c                          |  2 +-
 sound/soc/codecs/wm8753.c                          |  2 +-
 sound/soc/codecs/wm8770.c                          |  2 +-
 sound/soc/codecs/wm8776.c                          |  2 +-
 sound/soc/codecs/wm8804.c                          |  2 +-
 sound/soc/codecs/wm8903.c                          |  2 +-
 sound/soc/codecs/wm8904.c                          |  2 +-
 sound/soc/codecs/wm8940.c                          |  2 +-
 sound/soc/codecs/wm8955.c                          |  2 +-
 sound/soc/codecs/wm8960.c                          |  2 +-
 sound/soc/codecs/wm8961.c                          |  2 +-
 sound/soc/codecs/wm8962.c                          |  2 +-
 sound/soc/codecs/wm8971.c                          |  2 +-
 sound/soc/codecs/wm8974.c                          |  2 +-
 sound/soc/codecs/wm8978.c                          |  2 +-
 sound/soc/codecs/wm8983.c                          |  2 +-
 sound/soc/codecs/wm8985.c                          |  2 +-
 sound/soc/codecs/wm8988.c                          |  2 +-
 sound/soc/codecs/wm8990.c                          |  2 +-
 sound/soc/codecs/wm8993.c                          |  2 +-
 sound/soc/codecs/wm8994.c                          |  2 +-
 sound/soc/codecs/wm8995.c                          |  2 +-
 sound/soc/codecs/wm8996.c                          |  2 +-
 sound/soc/fsl/eukrea-tlv320.c                      |  4 ++--
 sound/soc/fsl/fsl-asoc-card.c                      |  8 ++++----
 sound/soc/fsl/fsl_esai.c                           |  2 +-
 sound/soc/fsl/fsl_micfil.c                         |  2 +-
 sound/soc/fsl/fsl_sai.c                            |  8 ++++----
 sound/soc/fsl/imx-audmix.c                         |  2 +-
 sound/soc/fsl/imx-hdmi.c                           |  2 +-
 sound/soc/fsl/imx-sgtl5000.c                       |  2 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |  2 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |  2 +-
 sound/soc/fsl/p1022_ds.c                           |  2 +-
 sound/soc/generic/simple-card-utils.c              | 10 +++++-----
 sound/soc/intel/boards/bdw-rt5650.c                |  2 +-
 sound/soc/intel/boards/bdw-rt5677.c                |  4 ++--
 sound/soc/intel/boards/broadwell.c                 |  2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |  2 +-
 sound/soc/intel/boards/bxt_rt298.c                 |  2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |  2 +-
 sound/soc/intel/boards/bytcht_da7213.c             |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |  4 ++--
 sound/soc/intel/boards/bytcr_rt5651.c              |  4 ++--
 sound/soc/intel/boards/bytcr_wm5102.c              |  2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |  2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c           |  2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |  4 ++--
 sound/soc/intel/boards/cht_bsw_rt5672.c            |  4 ++--
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |  2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |  2 +-
 sound/soc/intel/boards/haswell.c                   |  2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |  2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c       |  2 +-
 sound/soc/intel/boards/skl_rt286.c                 |  2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c       |  2 +-
 sound/soc/intel/boards/sof_realtek_common.c        |  2 +-
 sound/soc/intel/boards/sof_rt5682.c                |  4 ++--
 sound/soc/intel/boards/sof_sdw_rt1308.c            |  2 +-
 sound/soc/intel/boards/sof_wm8804.c                |  2 +-
 sound/soc/jz4740/jz4740-i2s.c                      |  2 +-
 sound/soc/kirkwood/armada-370-db.c                 |  2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |  2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |  4 ++--
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |  4 ++--
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |  2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |  2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |  2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |  2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  8 ++++----
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c         |  2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c         |  2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  6 +++---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         |  2 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c         |  2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  8 ++++----
 sound/soc/meson/aiu-encoder-i2s.c                  |  2 +-
 sound/soc/meson/axg-tdm-interface.c                |  2 +-
 sound/soc/meson/meson-card-utils.c                 |  4 ++--
 sound/soc/mxs/mxs-saif.c                           |  2 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |  4 ++--
 sound/soc/pxa/brownstone.c                         |  4 ++--
 sound/soc/pxa/corgi.c                              |  4 ++--
 sound/soc/pxa/hx4700.c                             |  4 ++--
 sound/soc/pxa/imote2.c                             |  4 ++--
 sound/soc/pxa/magician.c                           |  4 ++--
 sound/soc/pxa/mmp-sspa.c                           |  2 +-
 sound/soc/pxa/poodle.c                             |  4 ++--
 sound/soc/pxa/pxa-ssp.c                            |  2 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |  2 +-
 sound/soc/pxa/spitz.c                              |  4 ++--
 sound/soc/pxa/z2.c                                 |  4 ++--
 sound/soc/pxa/zylonite.c                           |  2 +-
 sound/soc/qcom/apq8096.c                           |  2 +-
 sound/soc/qcom/lpass-cpu.c                         |  2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  2 +-
 sound/soc/qcom/sc7180.c                            |  6 +++---
 sound/soc/qcom/sdm845.c                            | 22 +++++++++++-----------
 sound/soc/qcom/sm8250.c                            |  2 +-
 sound/soc/qcom/storm.c                             |  2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |  4 ++--
 sound/soc/rockchip/rk3399_gru_sound.c              | 14 +++++++-------
 sound/soc/rockchip/rockchip_i2s.c                  |  2 +-
 sound/soc/rockchip/rockchip_max98090.c             |  4 ++--
 sound/soc/rockchip/rockchip_rt5645.c               |  4 ++--
 sound/soc/samsung/aries_wm8994.c                   |  6 +++---
 sound/soc/samsung/arndale.c                        |  8 ++++----
 sound/soc/samsung/bells.c                          |  6 +++---
 sound/soc/samsung/h1940_uda1380.c                  |  2 +-
 sound/soc/samsung/i2s.c                            |  6 +++---
 sound/soc/samsung/jive_wm8750.c                    |  2 +-
 sound/soc/samsung/littlemill.c                     | 14 +++++++-------
 sound/soc/samsung/midas_wm1811.c                   | 10 +++++-----
 sound/soc/samsung/neo1973_wm8753.c                 |  4 ++--
 sound/soc/samsung/odroid.c                         |  2 +-
 sound/soc/samsung/pcm.c                            |  2 +-
 sound/soc/samsung/rx1950_uda1380.c                 |  2 +-
 sound/soc/samsung/s3c24xx-i2s.c                    |  2 +-
 sound/soc/samsung/s3c24xx_simtec.c                 |  4 ++--
 sound/soc/samsung/s3c24xx_uda134x.c                |  4 ++--
 sound/soc/samsung/smartq_wm8987.c                  |  6 +++---
 sound/soc/samsung/smdk_spdif.c                     |  2 +-
 sound/soc/samsung/smdk_wm8580.c                    |  2 +-
 sound/soc/samsung/smdk_wm8994.c                    |  2 +-
 sound/soc/samsung/smdk_wm8994pcm.c                 |  4 ++--
 sound/soc/samsung/snow.c                           |  2 +-
 sound/soc/samsung/spdif.c                          |  2 +-
 sound/soc/samsung/speyside.c                       |  8 ++++----
 sound/soc/samsung/tm2_wm5110.c                     |  6 +++---
 sound/soc/samsung/tobermory.c                      |  6 +++---
 sound/soc/sh/migor.c                               |  4 ++--
 sound/soc/sh/siu_dai.c                             |  2 +-
 sound/soc/sh/ssi.c                                 |  2 +-
 sound/soc/soc-dai.c                                |  9 +++++----
 sound/soc/sti/uniperif_player.c                    |  2 +-
 sound/soc/stm/stm32_adfsdm.c                       |  2 +-
 sound/soc/stm/stm32_i2s.c                          |  2 +-
 sound/soc/stm/stm32_sai_sub.c                      |  2 +-
 sound/soc/sunxi/sun4i-i2s.c                        |  2 +-
 sound/soc/tegra/tegra_alc5632.c                    |  2 +-
 sound/soc/tegra/tegra_max98090.c                   |  2 +-
 sound/soc/tegra/tegra_rt5640.c                     |  2 +-
 sound/soc/tegra/tegra_rt5677.c                     |  2 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |  2 +-
 sound/soc/tegra/tegra_wm8753.c                     |  2 +-
 sound/soc/tegra/tegra_wm8903.c                     |  2 +-
 sound/soc/tegra/trimslice.c                        |  2 +-
 sound/soc/ti/davinci-evm.c                         |  4 ++--
 sound/soc/ti/davinci-mcasp.c                       |  2 +-
 sound/soc/ti/j721e-evm.c                           |  8 ++++----
 sound/soc/ti/n810.c                                |  2 +-
 sound/soc/ti/omap-abe-twl6040.c                    |  6 +++---
 sound/soc/ti/omap-dmic.c                           |  2 +-
 sound/soc/ti/omap-mcbsp.c                          |  2 +-
 sound/soc/ti/omap3pandora.c                        |  4 ++--
 sound/soc/ti/rx51.c                                |  2 +-
 sound/soc/uniphier/aio-cpu.c                       |  4 ++--
 sound/soc/ux500/ux500_msp_dai.c                    |  2 +-
 268 files changed, 380 insertions(+), 377 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 1358a0c..d87de60 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -119,7 +119,7 @@ struct snd_soc_dai;
 struct snd_ac97_bus_ops;
 
 /* Digital Audio Interface clocking API.*/
-int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 	unsigned int freq, int dir);
 
 int snd_soc_dai_set_clkdiv(struct snd_soc_dai *dai,
@@ -226,7 +226,7 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_sysclk)(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir);
+		int clk_id, int source, unsigned int freq, int dir);
 	int (*set_pll)(struct snd_soc_dai *dai, int pll_id, int source,
 		unsigned int freq_in, unsigned int freq_out);
 	int (*set_clkdiv)(struct snd_soc_dai *dai, int div_id, int div);
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 849288d..89f921d 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -59,7 +59,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 0,
 				     CZ_PLAT_CLK, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index d6ba946..0558807 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -57,7 +57,7 @@ static int cz_aif1_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 0,
 				params_rate(params) * 512, SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index cea320a..ae555d4 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -67,7 +67,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	/* Set codec sysclk */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2, 0,
 			RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev,
@@ -145,7 +145,7 @@ static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 						64 * srate, 256 * srate);
 		if (ret < 0)
 			return ret;
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL, 0,
 					256 * srate, SND_SOC_CLOCK_IN);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 9e23758..438e55e 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -42,7 +42,7 @@ static int atmel_asoc_wm8904_hw_params(struct snd_pcm_substream *substream,
 	 * so calling set_sysclk won't care freq parameter
 	 * then we pass 0
 	 */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8904_CLK_FLL,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8904_CLK_FLL, 0,
 			0, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		pr_err("%s -failed to set wm8904 SYSCLK\n", __func__);
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 6d5ae18..481ca8e 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -289,7 +289,7 @@ static irqreturn_t mchp_i2s_mcc_interrupt(int irq, void *dev_id)
 }
 
 static int mchp_i2s_mcc_set_sysclk(struct snd_soc_dai *dai,
-				   int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
 
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index f9a85fd..a648e55 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -24,7 +24,7 @@ static int snd_proto_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set proto sysclk */
-	int ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
+	int ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, 0,
 					 XTAL_RATE, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "Failed to set WM8731 SYSCLK: %d\n",
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index ed1f69b..dee3ddb 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -102,7 +102,7 @@ static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 
 	dev_dbg(dev, "%s called\n", __func__);
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_MCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_MCLK, 0,
 				     MCLK_RATE, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set WM8731 SYSCLK: %d\n", ret);
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 9fbc3c1..1b540b7 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -47,7 +47,7 @@ static int sam9x5_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 	dev_dbg(dev, "%s called\n", __func__);
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, 0,
 				     MCLK_RATE, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set WM8731 SYSCLK: %d\n", ret);
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 6e634b4..08eec08 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -713,7 +713,7 @@ static int cygnus_ssp_hw_params(struct snd_pcm_substream *substream,
  * This function sets the mclk frequency for pll clock
  */
 static int cygnus_ssp_set_sysclk(struct snd_soc_dai *dai,
-			int clk_id, unsigned int freq, int dir)
+			int clk_id, int source, unsigned int freq, int dir)
 {
 	int sel;
 	u32 value;
diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 7b6cdc9..21ab6ff 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -38,7 +38,7 @@ static int edb93xx_hw_params(struct snd_pcm_substream *substream,
 	else
 		mclk_rate = rate * 64 * 2;
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_rate,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk_rate,
 				     SND_SOC_CLOCK_IN);
 	if (err)
 		return err;
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 0d26550..8973a7f 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -352,7 +352,7 @@ static int ep93xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int ep93xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
+static int ep93xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct ep93xx_i2s_info *info = snd_soc_dai_get_drvdata(cpu_dai);
diff --git a/sound/soc/cirrus/snappercl15.c b/sound/soc/cirrus/snappercl15.c
index c4b1129..b1a39bc 100644
--- a/sound/soc/cirrus/snappercl15.c
+++ b/sound/soc/cirrus/snappercl15.c
@@ -27,12 +27,12 @@ static int snappercl15_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int err;
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, CODEC_CLOCK, 
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, CODEC_CLOCK,
 				     SND_SOC_CLOCK_IN);
 	if (err)
 		return err;
 
-	err = snd_soc_dai_set_sysclk(cpu_dai, 0, CODEC_CLOCK, 
+	err = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, CODEC_CLOCK,
 				     SND_SOC_CLOCK_OUT);
 	if (err)
 		return err;
diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index cac7e55..464d0c3 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -999,7 +999,7 @@ static int pm860x_pcm_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int pm860x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct pm860x_priv *pm860x = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index f37ab7ed..3e16f0a 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -279,7 +279,7 @@ static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int ad193x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 9887aa6..c176bc1 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1155,7 +1155,7 @@ static int adau1373_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int adau1373_set_dai_sysclk(struct snd_soc_dai *dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct adau1373 *adau1373 = snd_soc_component_get_drvdata(dai->component);
 	struct adau1373_dai *adau1373_dai = &adau1373->dais[dai->id];
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 546ee81..2707321 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -371,7 +371,7 @@ static int adau17x1_set_dai_pll(struct snd_soc_dai *dai, int pll_id,
 }
 
 static int adau17x1_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(dai->component);
 	struct adau *adau = snd_soc_component_get_drvdata(dai->component);
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index 91e7a57..5916dcb 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -246,7 +246,7 @@ static const struct snd_soc_dapm_route ak4535_audio_map[] = {
 };
 
 static int ak4535_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ak4535_priv *ak4535 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index fe208cf..663ea5d 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -312,7 +312,7 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 }
 
 static int ak4613_dai_set_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index 04aef0e..a6ff2a5 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -302,7 +302,7 @@ static const struct snd_soc_dapm_route ak4641_audio_map[] = {
 };
 
 static int ak4641_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index c49c58e..7858456 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -333,7 +333,7 @@ static void ak4642_dai_shutdown(struct snd_pcm_substream *substream,
 }
 
 static int ak4642_dai_set_sysclk(struct snd_soc_dai *codec_dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ak4642_priv *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index eb43523..d355ca7 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -465,7 +465,7 @@ static int ak4671_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int ak4671_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int ak4671_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 		unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index 54f4898..63ea777 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -615,7 +615,7 @@ static int get_coeff(struct snd_soc_component *component, int rate)
  * Clock after PLL and dividers
  */
 static int alc5623_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct alc5623_priv *alc5623 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 7981388..9273f0b 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -788,7 +788,7 @@ static int get_coeff(struct snd_soc_component *component, int rate)
  * Clock after PLL and dividers
  */
 static int alc5632_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct alc5632_priv *alc5632 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index e32871b..e6b1885 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1908,7 +1908,7 @@ static const char *arizona_dai_clk_str(int clk_id)
 }
 
 static int arizona_dai_set_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 05bbacd..7577298 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1132,7 +1132,7 @@ static int cpcap_hifi_hw_params(struct snd_pcm_substream *substream,
 	return cpcap_set_samprate(cpcap, CPCAP_DAI_HIFI, rate);
 }
 
-static int cpcap_hifi_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
+static int cpcap_hifi_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id, int source,
 				     unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
@@ -1290,7 +1290,7 @@ static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int cpcap_voice_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
+static int cpcap_voice_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id, int source,
 				      unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
diff --git a/sound/soc/codecs/cq93vc.c b/sound/soc/codecs/cq93vc.c
index 0aae579..1375cd6 100644
--- a/sound/soc/codecs/cq93vc.c
+++ b/sound/soc/codecs/cq93vc.c
@@ -47,7 +47,7 @@ static int cq93vc_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int cq93vc_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	switch (freq) {
 	case 22579200:
diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 110ee2d..c7f0559 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -598,7 +598,7 @@ static int cs35l34_set_tristate(struct snd_soc_dai *dai, int tristate)
 }
 
 static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs35l34_private *cs35l34 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 55d529a..d4bf159 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -649,7 +649,7 @@ static int cs35l35_pdm_startup(struct snd_pcm_substream *substream,
 }
 
 static int cs35l35_dai_set_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs35l35_private *cs35l35 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 4451ca9..3ab86f8 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -905,7 +905,7 @@ static int cs35l36_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int cs35l36_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int cs35l36_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index d76be44f..1d4d872 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -316,7 +316,7 @@ static int cs4265_get_clk_index(int mclk, int rate)
 	return -EINVAL;
 }
 
-static int cs4265_set_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
+static int cs4265_set_sysclk(struct snd_soc_dai *codec_dai, int clk_id, int source,
 			unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index ddd95c8..1686fad 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -255,7 +255,7 @@ static bool cs4270_reg_is_volatile(struct device *dev, unsigned int reg)
  * that from a machine's driver 'hw_param' hook.
  */
 static int cs4270_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs4270_private *cs4270 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 7663f89..fe8b1f7 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -195,7 +195,7 @@ static const struct snd_soc_dapm_route cs4271_dapm_routes[] = {
  * ratios listed in cs4271_mclk_fs_ratios table
  */
 static int cs4271_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 210fcbe..87d17b6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -839,7 +839,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index c61b17d..e715fa3 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -384,7 +384,7 @@ static struct cs42l51_ratios master_ratios[] = {
 };
 
 static int cs42l51_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs42l51_private *cs42l51 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 796b894..85f191f 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -710,7 +710,7 @@ static int cs42l52_get_clk(int mclk, int rate)
 }
 
 static int cs42l52_set_sysclk(struct snd_soc_dai *codec_dai,
-			int clk_id, unsigned int freq, int dir)
+			int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs42l52_private *cs42l52 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index c44a5cd..711fc3c 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -712,7 +712,7 @@ static int cs42l56_get_mclk_ratio(int mclk, int rate)
 }
 
 static int cs42l56_set_sysclk(struct snd_soc_dai *codec_dai,
-			int clk_id, unsigned int freq, int dir)
+			int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs42l56_private *cs42l56 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index c3f974e..32a4c97 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -905,7 +905,7 @@ static int cs42l73_set_mclk(struct snd_soc_dai *dai, unsigned int freq)
 }
 
 static int cs42l73_set_sysclk(struct snd_soc_dai *dai,
-			      int clk_id, unsigned int freq, int dir)
+			      int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l73_private *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 5d6ef66..298dd7a 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -201,7 +201,7 @@ static const struct cs42xx8_ratios cs42xx8_ratios[] = {
 };
 
 static int cs42xx8_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 80bc7c1..7e36348 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1534,7 +1534,7 @@ static int cs43130_dsd_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 }
 
 static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 3d67cbf..6ab57bb 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -543,7 +543,7 @@ static int cs53l30_get_mclk_coeff(int mclk_rate, int srate)
 }
 
 static int cs53l30_set_sysclk(struct snd_soc_dai *dai,
-			      int clk_id, unsigned int freq, int dir)
+			      int clk_id, int source, unsigned int freq, int dir)
 {
 	struct cs53l30_private *priv = snd_soc_component_get_drvdata(dai->component);
 	int mclkx_coeff;
diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 8ab2281..2fe5774 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -989,7 +989,7 @@ static int cx2072x_set_dai_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int cx2072x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int cx2072x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *codec = dai->component;
diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 8af344b..fe70f9c 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -940,7 +940,7 @@ static int da7210_mute(struct snd_soc_dai *dai, int mute, int direction)
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static int da7210_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7210_priv *da7210 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index ea426d9..e9ee244 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -1807,7 +1807,7 @@ static const struct snd_soc_dapm_route da7218_audio_map[] = {
  */
 
 static int da7218_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 13009d0..ade2e10 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1155,7 +1155,7 @@ static const struct snd_soc_dapm_route da7219_audio_map[] = {
  */
 
 static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index d43ee71..b7052c7 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1177,7 +1177,7 @@ static int da732x_set_dai_pll(struct snd_soc_component *component, int pll_id,
 	return 0;
 }
 
-static int da732x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int da732x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index a9676b2..d508049 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1234,7 +1234,7 @@ static int da9055_mute(struct snd_soc_dai *dai, int mute, int direction)
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static int da9055_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da9055_priv *da9055 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index e2b7987..93df610 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -75,7 +75,7 @@ static int es7134_hw_params(struct snd_pcm_substream *substream,
 	return es7134_check_mclk(dai, priv, params_rate(params));
 }
 
-static int es7134_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int es7134_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq, int dir)
 {
 	struct es7134_data *priv = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 2344a0b..a447b8c 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -109,7 +109,7 @@ static int es7241_hw_params(struct snd_pcm_substream *substream,
 	return -EINVAL;
 }
 
-static int es7241_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int es7241_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq, int dir)
 {
 	struct es7241_data *priv = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index d632055..0ed6392 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -361,7 +361,7 @@ static const struct snd_soc_dapm_route es8316_dapm_routes[] = {
 };
 
 static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9632afc..1aa89fb 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -549,7 +549,7 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int es8328_set_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index eb3dd0b..5c1dbd3 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1191,7 +1191,7 @@ static int lm49453_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
-static int lm49453_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int lm49453_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index f4ed7e0..65fbf0b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3231,7 +3231,8 @@ static int madera_is_syncclk(int clk_id)
 }
 
 static int madera_dai_set_sysclk(struct snd_soc_dai *dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq,
+				 int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct snd_soc_dapm_context *dapm =
diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 4be24e7..db609c7 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1093,7 +1093,8 @@ static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int max98088_dai_set_sysclk(struct snd_soc_dai *dai,
-                                  int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq,
+				   int dir)
 {
        struct snd_soc_component *component = dai->component;
        struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 06276ff..7e01316 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1976,7 +1976,7 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
  * PLL / Sysclk
  */
 static int max98090_dai_set_sysclk(struct snd_soc_dai *dai,
-				   int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 736cd70..9da5ea3 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1119,7 +1119,7 @@ static int max98095_dai3_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int max98095_dai_set_sysclk(struct snd_soc_dai *dai,
-				   int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index bb736c4..05a2f33 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -455,7 +455,7 @@ static int max98390_dai_tdm_slot(struct snd_soc_dai *dai,
 }
 
 static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98390_priv *max98390 =
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index dec5189..64a220b 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -149,7 +149,7 @@ static int max9850_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int max9850_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct max9850_priv *max9850 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 09b2d73..62ebb76 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -396,7 +396,7 @@ static int max9867_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int max9867_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index ddaccc2..d390e52 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -458,7 +458,7 @@ static int max98925_dai_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int max98925_dai_set_sysclk(struct snd_soc_dai *dai,
-				   int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98925_priv *max98925 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 8b206ee..385bfc4 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -477,7 +477,7 @@ static int max98927_dai_tdm_slot(struct snd_soc_dai *dai,
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static int max98927_dai_set_sysclk(struct snd_soc_dai *dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98927_priv *max98927 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index a210725..f49aaf8 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -268,19 +268,19 @@ static int mc13783_set_sysclk(struct snd_soc_dai *dai,
 }
 
 static int mc13783_set_sysclk_dac(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	return mc13783_set_sysclk(dai, clk_id, freq, dir, MC13783_AUDIO_DAC);
 }
 
 static int mc13783_set_sysclk_codec(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	return mc13783_set_sysclk(dai, clk_id, freq, dir, MC13783_AUDIO_CODEC);
 }
 
 static int mc13783_set_sysclk_sync(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	int ret;
 
diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 4d7c0be..654486b 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -435,7 +435,7 @@ static int ml26124_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int ml26124_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ml26124_priv *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 13676b5..44de91d 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -510,7 +510,7 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 };
 
 static int nau8810_set_sysclk(struct snd_soc_dai *dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct nau8810 *nau8810 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 5812339..a349676 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -609,7 +609,7 @@ static const struct snd_soc_dapm_route nau8822_dapm_routes[] = {
 	{"Right DAC", NULL, "Digital Loopback"},
 };
 
-static int nau8822_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int nau8822_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index b8845f4..90760bc 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -461,7 +461,7 @@ static int pcm186x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
-static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index b235806..8b8deda 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -13,7 +13,7 @@
 
 /* dai */
 
-static int pcm3060_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int pcm3060_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			      unsigned int freq, int dir)
 {
 	struct snd_soc_component *comp = dai->component;
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 821e739..52e5880 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -301,7 +301,7 @@ static int pcm3168a_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int pcm3168a_set_dai_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(dai->component);
 	int ret;
diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 098ecf1..aa3c918 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1537,7 +1537,7 @@ static int rt1011_hw_params(struct snd_pcm_substream *substream,
 		dev_warn(component->dev, "Force using PLL ");
 		snd_soc_dai_set_pll(dai, 0, RT1011_PLL1_S_BCLK,
 			rt1011->lrck * 64, rt1011->lrck * 256);
-		snd_soc_dai_set_sysclk(dai, RT1011_FS_SYS_PRE_S_PLL1,
+		snd_soc_dai_set_sysclk(dai, RT1011_FS_SYS_PRE_S_PLL1, 0,
 			rt1011->lrck * 256, SND_SOC_CLOCK_IN);
 		pre_div = 0;
 	}
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 4e9dfd2..4a80aad 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -636,7 +636,7 @@ static int rt1305_hw_params(struct snd_pcm_substream *substream,
 		dev_warn(component->dev, "Force using PLL ");
 		snd_soc_dai_set_pll(dai, 0, RT1305_PLL1_S_BCLK,
 			rt1305->lrck * 64, rt1305->lrck * 256);
-		snd_soc_dai_set_sysclk(dai, RT1305_FS_SYS_PRE_S_PLL1,
+		snd_soc_dai_set_sysclk(dai, RT1305_FS_SYS_PRE_S_PLL1, 0,
 			rt1305->lrck * 256, SND_SOC_CLOCK_IN);
 		pre_div = 0;
 	}
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 0d3773c..41a0cc8 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -801,7 +801,7 @@ static int rt274_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 }
 
 static int rt274_set_dai_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt274_priv *rt274 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 8abe232..71f2828 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -798,7 +798,7 @@ static int rt286_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt286_set_dai_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 32cc9b6..a4c906f 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -867,7 +867,7 @@ static int rt298_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt298_set_dai_sysclk(struct snd_soc_dai *dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 7081142..2186d25 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -860,7 +860,7 @@ static int rt5514_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5514_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index fd0d3a0..8c5e015 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1060,7 +1060,7 @@ static int rt5616_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5616_set_dai_sysclk(struct snd_soc_dai *dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5616_priv *rt5616 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 653da3e..3f9c7c8 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1454,7 +1454,7 @@ static int rt5631_hifi_codec_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int rt5631_hifi_codec_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 1414ad1..1791e1f 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1831,7 +1831,7 @@ static int rt5640_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5640_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 63a7e05..6bd9d9f 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -2862,7 +2862,7 @@ static int rt5645_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5645_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index d198e19..0f1f00d 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -1408,7 +1408,7 @@ static int rt5651_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5651_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5651_priv *rt5651 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 0edf09d..ed8ebd6 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -968,7 +968,7 @@ static int rt5660_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5660_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5660_priv *rt5660 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 619fb9a..d344d8e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -2854,7 +2854,7 @@ static int rt5663_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static int rt5663_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int rt5663_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 	unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 9e449d3..e90b463 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4446,7 +4446,7 @@ static int rt5677_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int rt5677_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 73551e3..248f177 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -860,7 +860,7 @@ static int sgtl5000_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 /* set codec sysclk */
 static int sgtl5000_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				   int clk_id, unsigned int freq, int dir)
+				   int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 7964e92..9c87bb4 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -353,7 +353,7 @@ static int ssm2602_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int ssm2602_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct ssm2602_priv *ssm2602 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 86528b9..b26642d 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -578,7 +578,7 @@ static int mcs_ratio_table[3][7] = {
  * that from a machine's driver 'hw_param' hook.
  */
 static int sta32x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 75d3b06..b4a4fe4 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -607,7 +607,7 @@ static int mcs_ratio_table[3][6] = {
  * time for ALSA.
  */
 static int sta350_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index ec9933b..34b1a68 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -257,7 +257,7 @@ static bool sti_sas_volatile_register(struct device *dev, unsigned int reg)
  * sti_sas_set_sysclk:
  * get MCLK input frequency to check that MCLK-FS ratio is coherent
  */
-static int sti_sas_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int sti_sas_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			      unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index bd00c35..42761c0 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -390,7 +390,7 @@ static int tas2552_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static int tas2552_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int tas2552_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 7831c96..99e2f29 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -294,7 +294,7 @@ static int tas5086_put_deemph(struct snd_kcontrol *kcontrol,
 
 
 static int tas5086_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct tas5086_private *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 2400093..7196152 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -469,7 +469,7 @@ static int tlv320aic23_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int tlv320aic23_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				      int clk_id, unsigned int freq, int dir)
+				      int clk_id, int source, unsigned int freq, int dir)
 {
 	struct aic23 *aic23 = snd_soc_dai_get_drvdata(codec_dai);
 	aic23->mclk = freq;
diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index c7baef8..d56170e 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -153,7 +153,7 @@ static int aic26_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int aic26_set_sysclk(struct snd_soc_dai *codec_dai,
-			    int clk_id, unsigned int freq, int dir)
+			    int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct aic26 *aic26 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 51870d5..945901f 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1121,7 +1121,7 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 }
 
 static int aic31xx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index f04f88c..41764e2 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -589,7 +589,7 @@ const struct regmap_config aic32x4_regmap_config = {
 EXPORT_SYMBOL(aic32x4_regmap_config);
 
 static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct clk *mclk;
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index db14441..9dbce5d 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1234,7 +1234,7 @@ static int aic3x_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int aic3x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index d905e03..412f7e3 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1279,7 +1279,7 @@ static snd_pcm_sframes_t dac33_dai_delay(
 }
 
 static int dac33_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index 1bafc9d..5338901 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -2626,7 +2626,7 @@ static struct snd_soc_dapm_route const tscs454_intercon[] = {
 
 /* This is used when BCLK is sourcing the PLLs */
 static int tscs454_set_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index e059711..3f1edd9 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -1804,7 +1804,7 @@ static int twl4030_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int twl4030_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
+static int twl4030_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id, int source,
 				  unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
@@ -2007,7 +2007,7 @@ static int twl4030_voice_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int twl4030_voice_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-					int clk_id, unsigned int freq, int dir)
+					int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index b372033..e30b4f6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -930,7 +930,7 @@ static int twl6040_prepare(struct snd_pcm_substream *substream,
 }
 
 static int twl6040_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 21ab8c5..89e4b4e 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -122,7 +122,7 @@ static void uda1334_shutdown(struct snd_pcm_substream *substream,
 }
 
 static int uda1334_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/uda134x.c b/sound/soc/codecs/uda134x.c
index bf9182c..58b9eeb 100644
--- a/sound/soc/codecs/uda134x.c
+++ b/sound/soc/codecs/uda134x.c
@@ -243,7 +243,7 @@ static int uda134x_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int uda134x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index 15d42ce..5a8bd9a 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -749,7 +749,7 @@ static const struct snd_soc_dapm_route wm8350_dapm_routes[] = {
 };
 
 static int wm8350_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8350_data *wm8350_data = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index bf5e77c..2cffd51 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -830,7 +830,7 @@ static const struct snd_soc_dapm_route wm8400_dapm_routes[] = {
  * Clock after FLL and dividers
  */
 static int wm8400_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8400_priv *wm8400 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index c8b50aa..d6a2b90 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -206,7 +206,7 @@ static int wm8523_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int wm8523_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8523_priv *wm8523 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 4e9ab54..3ccd660 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -90,7 +90,7 @@ static void wm8524_shutdown(struct snd_pcm_substream *substream,
 }
 
 static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 85ad2f0..c399c62 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -747,7 +747,7 @@ static int wm8580_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-static int wm8580_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8580_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index bc4d161..2c9549c 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -218,7 +218,7 @@ static int wm8711_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int wm8711_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8711_priv *wm8711 =  snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index dcee7b2..d603342 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -379,7 +379,7 @@ static int wm8731_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int wm8731_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 7a3f9fb..10016ac 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -377,7 +377,7 @@ static int wm8737_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int wm8737_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8737_priv *wm8737 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 0e39943..9644b36 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -256,7 +256,7 @@ static int wm8741_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int wm8741_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8741_priv *wm8741 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 9491817..1fa459b 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -497,7 +497,7 @@ static inline int get_coeff(int mclk, int rate)
 }
 
 static int wm8750_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8750_priv *wm8750 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index deaa54b..fb4ff9b 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -859,7 +859,7 @@ static int get_coeff(int mclk, int rate)
  * Clock after PLL and dividers
  */
 static int wm8753_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8753_priv *wm8753 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index 5f39406..00640e9 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -482,7 +482,7 @@ static int wm8770_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int wm8770_set_sysclk(struct snd_soc_dai *dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component;
 	struct wm8770_priv *wm8770;
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 554acf5..7df958b 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -317,7 +317,7 @@ static int wm8776_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 static int wm8776_set_sysclk(struct snd_soc_dai *dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8776_priv *wm8776 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 21bf0cf..c153fc7 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -446,7 +446,7 @@ static int wm8804_set_pll(struct snd_soc_dai *dai, int pll_id,
 }
 
 static int wm8804_set_sysclk(struct snd_soc_dai *dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component;
 
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 026603a..e99808e 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1210,7 +1210,7 @@ static int wm8903_set_bias_level(struct snd_soc_component *component,
 }
 
 static int wm8903_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index a02a77f..c42e502 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1796,7 +1796,7 @@ static int wm8904_set_fll(struct snd_soc_dai *dai, int fll_id, int source,
 	return 0;
 }
 
-static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 440d048..7722c89e 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -612,7 +612,7 @@ static int wm8940_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 }
 
 static int wm8940_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8940_priv *wm8940 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 513df47..6c33993 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -635,7 +635,7 @@ static int wm8955_hw_params(struct snd_pcm_substream *substream,
 }
 
 
-static int wm8955_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8955_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index df35151..6c3a8c2 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1279,7 +1279,7 @@ static int wm8960_set_bias_level(struct snd_soc_component *component,
 	return wm8960->set_bias_level(component, level);
 }
 
-static int wm8960_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8960_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 					unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index ef80d9f..2de1151 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -589,7 +589,7 @@ static int wm8961_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wm8961_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8961_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			     unsigned int freq,
 			     int dir)
 {
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index ce4666a..d9da8b6 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2610,7 +2610,7 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wm8962_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8962_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index 21ae55c..a7938f0 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -427,7 +427,7 @@ static int get_coeff(int mclk, int rate)
 }
 
 static int wm8971_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8971_priv *wm8971 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index fdc68ab..6ffa244 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -431,7 +431,7 @@ static int wm8974_update_clocks(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static int wm8974_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int wm8974_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 4b5ecd1..51444e9 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -604,7 +604,7 @@ static int wm8978_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 /*
  * @freq:	when .set_pll() us not used, freq is codec MCLK input frequency
  */
-static int wm8978_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
+static int wm8978_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index d8ed22a..bdb5ea5 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -821,7 +821,7 @@ static int wm8983_set_pll(struct snd_soc_dai *dai, int pll_id,
 }
 
 static int wm8983_set_sysclk(struct snd_soc_dai *dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8983_priv *wm8983 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index a7e0110..61aa0d2 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -916,7 +916,7 @@ static int wm8985_set_pll(struct snd_soc_dai *dai, int pll_id,
 }
 
 static int wm8985_set_sysclk(struct snd_soc_dai *dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component;
 	struct wm8985_priv *wm8985;
diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 1d2f881..ce1ae27 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -550,7 +550,7 @@ static const struct snd_pcm_hw_constraint_list constraints_12 = {
  * Note that this should be called from init rather than from hw_params.
  */
 static int wm8988_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8988_priv *wm8988 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 9389407..b723d69 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -874,7 +874,7 @@ static int wm8990_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
  * Clock after PLL and dividers
  */
 static int wm8990_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8990_priv *wm8990 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index c4f4169..64cfc91 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1065,7 +1065,7 @@ static int wm8993_set_bias_level(struct snd_soc_component *component,
 }
 
 static int wm8993_set_sysclk(struct snd_soc_dai *codec_dai,
-			     int clk_id, unsigned int freq, int dir)
+			     int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8993_priv *wm8993 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index f117ec0c..4d2651b 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2502,7 +2502,7 @@ static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
 }
 
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index b896d9c..459eafc 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1903,7 +1903,7 @@ static int wm8995_set_fll(struct snd_soc_dai *dai, int id,
 }
 
 static int wm8995_set_dai_sysclk(struct snd_soc_dai *dai,
-				 int clk_id, unsigned int freq, int dir)
+				 int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component;
 	struct wm8995_priv *wm8995;
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index d303ef7..89f18e1 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1808,7 +1808,7 @@ static int wm8996_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int wm8996_set_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index e13271e..6ea0d86 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -35,7 +35,7 @@ static int eukrea_tlv320_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0,
 				     CODEC_CLOCK, SND_SOC_CLOCK_OUT);
 	if (ret) {
 		dev_err(cpu_dai->dev,
@@ -45,7 +45,7 @@ static int eukrea_tlv320_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_tdm_slot(cpu_dai, 0x3, 0x3, 2, 0);
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, IMX_SSP_SYS_CLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, IMX_SSP_SYS_CLK, 0, 0,
 				SND_SOC_CLOCK_IN);
 	/* fsl_ssi lacks the set_sysclk ops */
 	if (ret && ret != -EINVAL) {
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f62f81c..267fc7f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -175,7 +175,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 
 	/* Specific configurations of DAIs starts from here */
 	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
-				     cpu_priv->sysclk_freq[tx],
+				     0, cpu_priv->sysclk_freq[tx],
 				     cpu_priv->sysclk_dir[tx]);
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(dev, "failed to set sysclk for cpu dai\n");
@@ -208,7 +208,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
-					     codec_priv->fll_id,
+					     codec_priv->fll_id, 0,
 					     pll_out, SND_SOC_CLOCK_IN);
 
 		if (ret && ret != -ENOTSUPP) {
@@ -237,7 +237,7 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
 		/* Force freq to be 0 to avoid error message in codec */
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
-					     codec_priv->mclk_id,
+					     codec_priv->mclk_id, 0,
 					     0,
 					     SND_SOC_CLOCK_IN);
 		if (ret) {
@@ -515,7 +515,7 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 		return 0;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
+	ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id, 0,
 				     codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(dev, "failed to set sysclk in %s\n", __func__);
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 08056fa..714d201 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -256,7 +256,7 @@ static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
  *
  * Note: If the direction is input, we do not care about clk_id.
  */
-static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				   unsigned int freq, int dir)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 5935af2..d1f232d 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -362,7 +362,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				     unsigned int freq, int dir)
 {
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e65b45..4044bd2 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -166,7 +166,7 @@ static int fsl_sai_set_dai_bclk_ratio(struct snd_soc_dai *dai,
 }
 
 static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
-		int clk_id, unsigned int freq, int fsl_dir)
+		int clk_id, int source, unsigned int freq, int fsl_dir)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int ofs = sai->soc_data->reg_offset;
@@ -197,21 +197,21 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
 }
 
 static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	int ret;
 
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq,
+	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, 0, freq,
 					FSL_FMT_TRANSMITTER);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx sysclk: %d\n", ret);
 		return ret;
 	}
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq,
+	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, 0, freq,
 					FSL_FMT_RECEIVER);
 	if (ret)
 		dev_err(cpu_dai->dev, "Cannot set rx sysclk: %d\n", ret);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index cbdc0a2..ffda572 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -91,7 +91,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), FSL_SAI_CLK_MAST1, 0, dir);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), FSL_SAI_CLK_MAST1, 0, 0, dir);
 	if (ret) {
 		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
 		return ret;
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index dbbb761..f0412cd 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -46,7 +46,7 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* MCLK always is (256 or 192) * rate. */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
+	ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx], 0,
 				     8 * slot_width * params_rate(params),
 				     tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
 	if (ret && ret != -ENOTSUPP) {
diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index f45cb4b..11227f1 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -31,7 +31,7 @@ static int imx_sgtl5000_dai_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), SGTL5000_SYSCLK,
-				     data->clk_frequency, SND_SOC_CLOCK_IN);
+				     0, data->clk_frequency, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(dev, "could not set codec driver clock params\n");
 		return ret;
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 3149d59..5aacbb1 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -85,7 +85,7 @@ static int psc_i2s_hw_params(struct snd_pcm_substream *substream,
  * @dir: SND_SOC_CLOCK_IN (clock slave) or SND_SOC_CLOCK_OUT (clock master)
  */
 static int psc_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
-			      int clk_id, unsigned int freq, int dir)
+			      int clk_id, int source, unsigned int freq, int dir)
 {
 	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(cpu_dai);
 	dev_dbg(psc_dma->dev, "psc_i2s_set_sysclk(cpu_dai=%p, dir=%i)\n",
diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index eccc833..12e5c67 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -115,7 +115,7 @@ static int mpc8610_hpcd_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0, 0,
 				     machine_data->clk_frequency,
 				     machine_data->codec_clk_direction);
 	if (ret < 0) {
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index ac68d22..485fb4e 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -138,7 +138,7 @@ static int p1022_ds_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0, mdata->clk_frequency,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0, 0, mdata->clk_frequency,
 				     mdata->codec_clk_direction);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver clock params\n");
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index ab31045..f1012e9 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -219,8 +219,8 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 		simple_priv_to_props(priv, rtd->num);
 
 	if (dai_props->mclk_fs) {
-		snd_soc_dai_set_sysclk(codec_dai, 0, 0, SND_SOC_CLOCK_IN);
-		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
+		snd_soc_dai_set_sysclk(codec_dai, 0, 0, 0, SND_SOC_CLOCK_IN);
+		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, 0, SND_SOC_CLOCK_OUT);
 	}
 
 	asoc_simple_clk_disable(dai_props->cpu_dai);
@@ -270,12 +270,12 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP)
 			goto err;
 
-		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 					     SND_SOC_CLOCK_OUT);
 		if (ret && ret != -ENOTSUPP)
 			goto err;
@@ -307,7 +307,7 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 		return 0;
 
 	if (simple_dai->sysclk) {
-		ret = snd_soc_dai_set_sysclk(dai, 0, simple_dai->sysclk,
+		ret = snd_soc_dai_set_sysclk(dai, 0, 0, simple_dai->sysclk,
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index c5122d3..e1fd9de 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -121,7 +121,7 @@ static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
 	 * 24.576MHz to satisfy the requirement of rl6231_get_clk_info.
 	 * ASRC is enabled on AD and DA filters to ensure good audio quality.
 	 */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 24576000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 0, 24576000,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 021bc59..413ba20 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -157,7 +157,7 @@ static int bdw_rt5677_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, 24576000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, 0, 24576000,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
@@ -174,7 +174,7 @@ static int bdw_rt5677_dsp_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 24576000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 0, 24576000,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 3c3aff9..d423ddd 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -104,7 +104,7 @@ static int broadwell_rt286_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 0, 24000000,
 		SND_SOC_CLOCK_IN);
 
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 0c0a7178..811b343 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -219,7 +219,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	else
 		clk_freq = 19200000;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 0, clk_freq,
 				     SND_SOC_CLOCK_IN);
 
 	if (ret) {
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 0f3157d..b1bc5b9 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -228,7 +228,7 @@ static int broxton_rt298_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL, 0,
 					19200000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 2bfe3e4..3732180 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -81,7 +81,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 
 	/* set the default PLL rate, the clock is handled by the codec driver */
 	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
-				     19200000, SND_SOC_CLOCK_IN);
+				     0, 19200000, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->dev, "Could not set sysclk\n");
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index cfeba27..d22a3a0 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -109,7 +109,7 @@ static int aif1_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7213_CLKSRC_MCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7213_CLKSRC_MCLK, 0,
 				     19200000, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(codec_dai->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 06df2d4..cfc22bd 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -211,7 +211,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		dev_err(card->dev, "unable to enable MCLK\n");
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0), 0, 19200000,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0), 0, 0, 19200000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec clock %d\n", ret);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 782f2b4..19987c3 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -211,7 +211,7 @@ static int byt_rt5640_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_PLL1, 0,
 				     rate * 512, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->component->dev, "can't set clock %d\n", ret);
@@ -259,7 +259,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		 * turning off the platform clock. Codec needs clock
 		 * for Jack detection and button press
 		 */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_RCCLK,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_RCCLK, 0,
 					     48000 * 512,
 					     SND_SOC_CLOCK_IN);
 		if (!ret) {
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 148b7b1..912eb87 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -158,7 +158,7 @@ static int byt_rt5651_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5651_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5651_SCLK_S_PLL1, 0,
 				     rate * 512, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->component->dev, "can't set clock %d\n", ret);
@@ -202,7 +202,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		 * turning off the platform clock. Codec needs clock
 		 * for Jack detection and button press
 		 */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5651_SCLK_S_RCCLK,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5651_SCLK_S_RCCLK, 0,
 					     48000 * 512,
 					     SND_SOC_CLOCK_IN);
 		if (!ret)
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index f38850e..321addd 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -75,7 +75,7 @@ static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK, 0,
 				     rate * 512, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(codec_component->dev, "Error setting clock: %d\n", ret);
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 1318823..5ff928d 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -116,7 +116,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, M98090_REG_SYSTEM_CLOCK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, M98090_REG_SYSTEM_CLOCK, 0,
 				     CHT_PLAT_CLK_3_HZ, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index da5a5cb..2ea4d2f 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -76,7 +76,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8824_CLK_FLL_FS, 0,
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8824_CLK_FLL_FS, 0, 0,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 6fea554..b4970df 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -95,7 +95,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		 * runtime suspended. Codec needs clock for jack detection and button
 		 * press. MCLK is turned off with clock framework or ACPI.
 		 */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_RCCLK,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_RCCLK, 0,
 					48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
@@ -219,7 +219,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 0,
 				params_rate(params) * 512, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 10c88ef..bcafa7b 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -79,7 +79,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		}
 
 		/* set codec sysclk source to PLL */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_PLL1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_PLL1, 0,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
@@ -156,7 +156,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set codec sysclk source to PLL */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_PLL1, 0,
 				     params_rate(params) * 512,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 14813be..0578259 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -213,7 +213,7 @@ static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
 		dev_warn(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, 0,
 				     pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_warn(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 62cca51..ca0a93e 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -149,7 +149,7 @@ static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, 0,
 					RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index c763bfe..5699b35 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -56,7 +56,7 @@ static int haswell_rt5640_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 0, 12288000,
 		SND_SOC_CLOCK_IN);
 
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index dc3d897..b403b0c 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -165,7 +165,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24576000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 0, 24576000,
 						SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index cc9a2509..07a4425 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -76,7 +76,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	}
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24576000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 0, 24576000,
 				     SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(card->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 5a0c64a..4dbf179 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -232,7 +232,7 @@ static int skylake_rt286_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 0, 24000000,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "set codec sysclk failed: %d\n", ret);
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index f3cb077..58b81e0 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -145,7 +145,7 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24000000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 0, 24000000,
 				     SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index f3cf73c..b4451e3 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -80,7 +80,7 @@ static int rt1011_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1011_FS_SYS_PRE_S_PLL1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1011_FS_SYS_PRE_S_PLL1, 0,
 					     256 * srate, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 55505e2..0104913 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -283,7 +283,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, 0,
 				     pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
@@ -331,7 +331,7 @@ static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		/* Configure sysclk for codec */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL, 0,
 					     params_rate(params) * 256,
 					     SND_SOC_CLOCK_IN);
 		if (ret < 0) {
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt1308.c
index 0d476f6..dafce85 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1308.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1308.c
@@ -112,7 +112,7 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Set rt1308 sysclk */
-	err = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, pll_out,
+	err = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, 0, pll_out,
 				     SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "Failed to set RT1308 SYSCLK: %d\n", err);
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index a46ba13..5eb5d65 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -126,7 +126,7 @@ static int sof_wm8804_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_clkdiv(codec_dai, WM8804_MCLK_DIV, mclk_div);
 	snd_soc_dai_set_pll(codec_dai, 0, 0, sysclk, mclk_freq);
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8804_TX_CLKSRC_PLL,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8804_TX_CLKSRC_PLL, 0,
 				     sysclk, SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(rtd->card->dev,
diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 52ba0e3..1f6e670 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -299,7 +299,7 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 	unsigned int freq, int dir)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index 8132642..0ee891b 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -35,7 +35,7 @@ static int a370db_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	return snd_soc_dai_set_sysclk(codec_dai, 0, freq, SND_SOC_CLOCK_IN);
+	return snd_soc_dai_set_sysclk(codec_dai, 0, 0, freq, SND_SOC_CLOCK_IN);
 }
 
 static const struct snd_soc_ops a370db_ops = {
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d5cffe7..86df7d1 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -262,7 +262,7 @@ static int mt2701_afe_i2s_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mt2701_afe_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int mt2701_afe_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				     unsigned int freq, int dir)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 44a8d5c..b2d9dd4 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -138,10 +138,10 @@ static int mt2701_cs42448_be_ops_hw_params(struct snd_pcm_substream *substream,
 	mclk_rate = rate * div_bck_over_lrck * div_mclk_over_bck;
 
 	/* mt2701 mclk */
-	snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_rate, SND_SOC_CLOCK_OUT);
+	snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk_rate, SND_SOC_CLOCK_OUT);
 
 	/* codec mclk */
-	snd_soc_dai_set_sysclk(codec_dai, 0, mclk_rate, SND_SOC_CLOCK_IN);
+	snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk_rate, SND_SOC_CLOCK_IN);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 414e422..86cf29df 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -34,8 +34,8 @@ static int mt2701_wm8960_be_ops_hw_params(struct snd_pcm_substream *substream,
 
 	mclk_rate = rate * div_bck_over_lrck * div_mclk_over_bck;
 
-	snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_rate, SND_SOC_CLOCK_OUT);
-	snd_soc_dai_set_sysclk(codec_dai, 0, mclk_rate, SND_SOC_CLOCK_IN);
+	snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk_rate, SND_SOC_CLOCK_OUT);
+	snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk_rate, SND_SOC_CLOCK_IN);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index fc94314..bb4c7ec 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -55,7 +55,7 @@ static int mt8173_max98090_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
-	return snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256,
+	return snd_soc_dai_set_sysclk(codec_dai, 0, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_IN);
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 0f28dc2..66626aa 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -55,7 +55,7 @@ static int mt8173_rt5650_rt5514_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 
 		/* sysclk from pll */
-		ret = snd_soc_dai_set_sysclk(codec_dai, 1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 1, 0,
 					     params_rate(params) * 512,
 					     SND_SOC_CLOCK_IN);
 		if (ret)
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 077c6ee..3b3a73b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -59,7 +59,7 @@ static int mt8173_rt5650_rt5676_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 
 		/* sysclk from pll */
-		ret = snd_soc_dai_set_sysclk(codec_dai, 1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 1, 0,
 					     params_rate(params) * 512,
 					     SND_SOC_CLOCK_IN);
 		if (ret)
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index c28ebf8..ea5b1fc 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -85,7 +85,7 @@ static int mt8173_rt5650_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 
 		/* sysclk from pll */
-		ret = snd_soc_dai_set_sysclk(codec_dai, 1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 1, 0,
 					     params_rate(params) * 512,
 					     SND_SOC_CLOCK_IN);
 		if (ret)
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a4d26a6..b06f68d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -38,7 +38,7 @@ static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
 	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
-				      0, mclk_fs, SND_SOC_CLOCK_OUT);
+				      0, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
 static const struct snd_soc_ops mt8183_mt6358_i2s_ops = {
@@ -56,7 +56,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret = 0, j;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
@@ -64,7 +64,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, DA7219_DEV_NAME)) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
-						     DA7219_CLKSRC_MCLK,
+						     DA7219_CLKSRC_MCLK, 0,
 						     mclk_fs,
 						     SND_SOC_CLOCK_IN);
 			if (ret < 0)
@@ -134,7 +134,7 @@ mt8183_da7219_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 
 			ret = snd_soc_dai_set_sysclk(codec_dai,
-						     RT1015_SCLK_S_PLL,
+						     RT1015_SCLK_S_PLL, 0,
 						     rate * 256,
 						     SND_SOC_CLOCK_IN);
 			if (ret) {
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 138591d..f678f46 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -793,7 +793,7 @@ static int mtk_dai_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
index 0d69cf4..34d5708 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
@@ -613,7 +613,7 @@ static int mtk_dai_tdm_trigger(struct snd_pcm_substream *substream,
 }
 
 static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 271413e..4f6ee03 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -48,7 +48,7 @@ static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
 	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
-				      0, mclk_fs, SND_SOC_CLOCK_OUT);
+				      0, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
 static const struct snd_soc_ops mt8183_mt6358_i2s_ops = {
@@ -75,7 +75,7 @@ mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL, 0,
 				rate * 256, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "failed to set sysclk\n");
@@ -84,7 +84,7 @@ mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
-				      0, mclk_fs, SND_SOC_CLOCK_OUT);
+				      0, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
 static const struct snd_soc_ops mt8183_mt6358_rt1015_i2s_ops = {
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 5b29340..301084bc 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -1772,7 +1772,7 @@ static int mtk_dai_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index f5de1d7..48f8429 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -626,7 +626,7 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133..1e927b1 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -59,7 +59,7 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		ret = snd_soc_dai_set_sysclk(codec_dai,
-					     RT1015_SCLK_S_PLL,
+					     RT1015_SCLK_S_PLL, 0,
 					     params_rate(params) * 256,
 					     SND_SOC_CLOCK_IN);
 		if (ret) {
@@ -68,7 +68,7 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
 static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -106,7 +106,7 @@ static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
-				     RT5682_SCLK_S_PLL1,
+				     RT5682_SCLK_S_PLL1, 0,
 				     params_rate(params) * 512,
 				     SND_SOC_CLOCK_IN);
 	if (ret) {
@@ -114,7 +114,7 @@ static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
 static const struct snd_soc_ops mt8192_rt1015_i2s_ops = {
diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 9322245..c36556d 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -296,7 +296,7 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				      unsigned int freq, int dir)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 87cac44..e107bb3 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -96,7 +96,7 @@ int axg_tdm_set_tdm_slots(struct snd_soc_dai *dai, u32 *tx_mask,
 }
 EXPORT_SYMBOL_GPL(axg_tdm_set_tdm_slots);
 
-static int axg_tdm_iface_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int axg_tdm_iface_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				    unsigned int freq, int dir)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 300ac8b..d796b38 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -24,13 +24,13 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 	mclk = params_rate(params) * mclk_fs;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 07f8cf9..12a383d 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -46,7 +46,7 @@ static struct mxs_saif *mxs_saif[2];
  */
 
 static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-			int clk_id, unsigned int freq, int dir)
+			int clk_id, int source, unsigned int freq, int dir)
 {
 	struct mxs_saif *saif = snd_soc_dai_get_drvdata(cpu_dai);
 
diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index a6407f4..cfd3611 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -37,7 +37,7 @@ static int mxs_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Set SGTL5000's SYSCLK (provided by SAIF MCLK) */
-	ret = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, 0, mclk, 0);
 	if (ret) {
 		dev_err(codec_dai->dev, "Failed to set sysclk to %u.%03uMHz\n",
 			mclk / 1000000, mclk / 1000 % 1000);
@@ -45,7 +45,7 @@ static int mxs_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* The SAIF MCLK should be the same as SGTL5000_SYSCLK */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, MXS_SAIF_MCLK, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, MXS_SAIF_MCLK, 0, mclk, 0);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Failed to set sysclk to %u.%03uMHz\n",
 			mclk / 1000000, mclk / 1000 % 1000);
diff --git a/sound/soc/pxa/brownstone.c b/sound/soc/pxa/brownstone.c
index f310a8e..8fcf8ae 100644
--- a/sound/soc/pxa/brownstone.c
+++ b/sound/soc/pxa/brownstone.c
@@ -58,12 +58,12 @@ static int brownstone_wm8994_hw_params(struct snd_pcm_substream *substream,
 		sspa_mclk = params_rate(params) * 64;
 	}
 
-	snd_soc_dai_set_sysclk(cpu_dai, MMP_SSPA_CLK_AUDIO, freq_out, 0);
+	snd_soc_dai_set_sysclk(cpu_dai, MMP_SSPA_CLK_AUDIO, 0, freq_out, 0);
 	snd_soc_dai_set_pll(cpu_dai, MMP_SYSCLK, 0, freq_out, sysclk);
 	snd_soc_dai_set_pll(cpu_dai, MMP_SSPA_CLK, 0, freq_out, sspa_mclk);
 
 	/* set wm8994 sysclk */
-	snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1, sysclk, 0);
+	snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1, 0, sysclk, 0);
 
 	return 0;
 }
diff --git a/sound/soc/pxa/corgi.c b/sound/soc/pxa/corgi.c
index 8ee2dea..6511740 100644
--- a/sound/soc/pxa/corgi.c
+++ b/sound/soc/pxa/corgi.c
@@ -136,13 +136,13 @@ static int corgi_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, 0, clk,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 7334fac..ff7fd21 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -59,14 +59,14 @@ static int hx4700_hw_params(struct snd_pcm_substream *substream,
 	int ret = 0;
 
 	/* set the I2S system clock as output */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
 
 	/* inform codec driver about clock freq *
 	 * (PXA I2S always uses divider 256)    */
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 256 * params_rate(params),
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, 256 * params_rate(params),
 			SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/imote2.c b/sound/soc/pxa/imote2.c
index a575676..330a99c 100644
--- a/sound/soc/pxa/imote2.c
+++ b/sound/soc/pxa/imote2.c
@@ -31,13 +31,13 @@ static int imote2_asoc_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, clk,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, clk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, clk,
 		SND_SOC_CLOCK_OUT);
 
 	return ret;
diff --git a/sound/soc/pxa/magician.c b/sound/soc/pxa/magician.c
index a5f326c..0e9fae1 100644
--- a/sound/soc/pxa/magician.c
+++ b/sound/soc/pxa/magician.c
@@ -106,7 +106,7 @@ static int magician_playback_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* set audio clock as clock source */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA_SSP_CLK_AUDIO, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA_SSP_CLK_AUDIO, 0, 0,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
@@ -140,7 +140,7 @@ static int magician_capture_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* set the I2S system clock as output */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 4803972..37b48cd 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -104,7 +104,7 @@ static void mmp_sspa_shutdown(struct snd_pcm_substream *substream,
  * Set the SSP ports SYSCLK.
  */
 static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-				    int clk_id, unsigned int freq, int dir)
+				    int clk_id, int source, unsigned int freq, int dir)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 	struct device *dev = cpu_dai->component->dev;
diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 323ba3e..8572340 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -110,13 +110,13 @@ static int poodle_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL, 0, clk,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b941adc..0102dc2 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -198,7 +198,7 @@ static void pxa_ssp_set_scr(struct ssp_device *ssp, u32 div)
  * Set the SSP ports SYSCLK.
  */
 static int pxa_ssp_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct ssp_device *ssp = priv->ssp;
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index bcde4a9..eeabdd7 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -145,7 +145,7 @@ static int pxa2xx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 }
 
 static int pxa2xx_i2s_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	if (clk_id != PXA2XX_I2S_SYSCLK)
 		return -ENODEV;
diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 7c1384a86..9fcdaf0 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -137,13 +137,13 @@ static int spitz_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, 0, clk,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/z2.c b/sound/soc/pxa/z2.c
index edf2b9e..49f1313 100644
--- a/sound/soc/pxa/z2.c
+++ b/sound/soc/pxa/z2.c
@@ -54,13 +54,13 @@ static int z2_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, 0, clk,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the I2S system clock as input (unused) */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA2XX_I2S_SYSCLK, 0, 0,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/pxa/zylonite.c b/sound/soc/pxa/zylonite.c
index bb89a53..b2e5ac0 100644
--- a/sound/soc/pxa/zylonite.c
+++ b/sound/soc/pxa/zylonite.c
@@ -102,7 +102,7 @@ static int zylonite_voice_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA_SSP_CLK_AUDIO, 0, 1);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, PXA_SSP_CLK_AUDIO, 0, 0, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 1a69bae..3db7734 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -83,7 +83,7 @@ static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_dai_set_channel_map(codec_dai, ARRAY_SIZE(tx_ch),
 					tx_ch, ARRAY_SIZE(rx_ch), rx_ch);
 
-	snd_soc_dai_set_sysclk(codec_dai, 0, WCD9335_DEFAULT_MCLK_RATE,
+	snd_soc_dai_set_sysclk(codec_dai, 0, 0, WCD9335_DEFAULT_MCLK_RATE,
 				SNDRV_PCM_STREAM_PLAYBACK);
 
 	return 0;
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c642e5f..15d5dc8 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -55,7 +55,7 @@ static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
 	return 0;
 }
 
-static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 		unsigned int freq, int dir)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 4e1f101..dcd541d 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -544,7 +544,7 @@ static int q6slim_set_channel_map(struct snd_soc_dai *dai,
 }
 
 static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
-		int clk_id, unsigned int freq, int dir)
+		int clk_id, int source, unsigned int freq, int dir)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct q6afe_port *port = dai_data->port[dai->id];
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 768566b..586606d 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -134,7 +134,7 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	case MI2S_PRIMARY:
 		if (++data->pri_mi2s_clk_count == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-					       LPASS_MCLK0,
+					       LPASS_MCLK0, 0,
 					       DEFAULT_MCLK_RATE,
 					       SNDRV_PCM_STREAM_PLAYBACK);
 		}
@@ -153,7 +153,7 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 		}
 
 		/* Configure sysclk for codec */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, 0,
 					     RT5682_PLL1_FREQ,
 					     SND_SOC_CLOCK_IN);
 		if (ret)
@@ -205,7 +205,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 	case MI2S_PRIMARY:
 		if (--data->pri_mi2s_clk_count == 0) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-					       LPASS_MCLK0,
+					       LPASS_MCLK0, 0,
 					       0,
 					       SNDRV_PCM_STREAM_PLAYBACK);
 		}
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 6c2760e..988e41c 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -188,7 +188,7 @@ static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
 			RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
 			RT5663_CLK_SEL_I2S1_ASRC);
 		ret = snd_soc_dai_set_sysclk(
-			codec_dai, RT5663_SCLK_S_MCLK, DEFAULT_MCLK_RATE,
+			codec_dai, RT5663_SCLK_S_MCLK, 0, DEFAULT_MCLK_RATE,
 			SND_SOC_CLOCK_IN);
 		if (ret < 0)
 			dev_err(rtd->dev,
@@ -285,7 +285,7 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			if (rval != 0 && rval != -ENOTSUPP)
 				return rval;
 
-			snd_soc_dai_set_sysclk(codec_dai, 0,
+			snd_soc_dai_set_sysclk(codec_dai, 0, 0,
 					       WCD934X_DEFAULT_MCLK_RATE,
 					       SNDRV_PCM_STREAM_PLAYBACK);
 		}
@@ -316,10 +316,10 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
 		if (++(data->pri_mi2s_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_MCLK_1,
+				Q6AFE_LPASS_CLK_ID_MCLK_1, 0,
 				DEFAULT_MCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, 0,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
@@ -330,7 +330,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		if (++(data->sec_mi2s_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT, 0,
 				MI2S_BCLK_RATE,	SNDRV_PCM_STREAM_CAPTURE);
 		}
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
@@ -338,7 +338,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		break;
 	case QUATERNARY_MI2S_RX:
 		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
+			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT, 0,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
 
@@ -349,7 +349,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 	case QUATERNARY_TDM_TX_0:
 		if (++(data->quat_tdm_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT, 0,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 
@@ -402,10 +402,10 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	case PRIMARY_MI2S_TX:
 		if (--(data->pri_mi2s_clk_count) == 0) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_MCLK_1,
+				Q6AFE_LPASS_CLK_ID_MCLK_1, 0,
 				0, SNDRV_PCM_STREAM_PLAYBACK);
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, 0,
 				0, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		break;
@@ -413,7 +413,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	case SECONDARY_MI2S_TX:
 		if (--(data->sec_mi2s_clk_count) == 0) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT, 0,
 				0, SNDRV_PCM_STREAM_CAPTURE);
 		}
 		break;
@@ -422,7 +422,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	case QUATERNARY_TDM_TX_0:
 		if (--(data->quat_tdm_clk_count) == 0) {
 			snd_soc_dai_set_sysclk(cpu_dai,
-				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT, 0,
 				0, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		break;
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index fe8fd73..1dab92e 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -46,7 +46,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
+			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT, 0,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 80c9cf2..2102889 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -39,7 +39,7 @@ static int storm_ops_hw_params(struct snd_pcm_substream *substream,
 	 */
 	sysclk_freq = rate * bitwidth * 2 * STORM_SYSCLK_MULT;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(soc_runtime, 0), 0, 0, sysclk_freq, 0);
 	if (ret) {
 		dev_err(card->dev, "error setting sysclk to %u: %d\n",
 			sysclk_freq, ret);
diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 33a0077..a05da08 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -94,7 +94,7 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 
 	if (ret && ret != -ENOTSUPP) {
@@ -102,7 +102,7 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_IN);
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index e2d52d8..6bd9d58 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -70,7 +70,7 @@ static int rockchip_sound_max98357a_hw_params(struct snd_pcm_substream *substrea
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
@@ -91,14 +91,14 @@ static int rockchip_sound_rt5514_hw_params(struct snd_pcm_substream *substream,
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(rtd->card->dev, "Can't set cpu clock out %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5514_SCLK_S_MCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5514_SCLK_S_MCLK, 0,
 				     mclk, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
@@ -141,14 +141,14 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "Can't set cpu clock out %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "Can't set codec clock in %d\n", ret);
@@ -171,7 +171,7 @@ static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* We need default MCLK and PLL settings for the accessory detection */
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 12288000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, 12288000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "Init can't set codec clock in %d\n", ret);
@@ -221,7 +221,7 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0740764..0f1b124 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -413,7 +413,7 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int rockchip_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
+static int rockchip_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id, int source,
 				   unsigned int freq, int dir)
 {
 	struct rk_i2s_dev *i2s = to_info(cpu_dai);
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index c8f1a28..15c2c9c 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -169,14 +169,14 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Can't set cpu dai clock %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_IN);
 
 	/* HDMI codec dai does not need to set sysclk. */
diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 16ca2ad9..3e267c1 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -80,14 +80,14 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0ac5956..650a629 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -278,7 +278,7 @@ static int aries_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1, 0,
 				pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -293,7 +293,7 @@ static int aries_hw_free(struct snd_pcm_substream *substream)
 	int ret;
 
 	/* Switch sysclk to MCLK1 */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1, 0,
 				ARIES_MCLK1_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -330,7 +330,7 @@ static int aries_baseband_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 
 	/* Set the codec system clock */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL2,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL2, 0,
 			pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 2858737..6824430 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -30,18 +30,18 @@ static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
 
 	rclk = params_rate(params) * rfs;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK, 0,
 					0, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0, 0,
 					0, SND_SOC_CLOCK_OUT);
 
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk, SND_SOC_CLOCK_OUT);
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, rclk, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
 
@@ -76,7 +76,7 @@ static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
 	 * The CODEC uses clk API and the value will be rounded hence the MCLK1
 	 * clock's frequency will still be exact multiple of the sample rate.
 	 */
-	return snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
+	return snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1, 0,
 					rclk + 1, SND_SOC_CLOCK_IN);
 }
 
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 8b83f39..962d780 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -173,7 +173,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0, 0);
 	if (ret != 0)
 		dev_err(aif1_dai->dev, "Failed to set AIF1 clock: %d\n", ret);
 
@@ -197,7 +197,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_CP]);
 	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0, 0);
 	if (ret != 0) {
 		dev_err(aif2_dai->dev, "Failed to set AIF2 clock: %d\n", ret);
 		return ret;
@@ -210,7 +210,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	aif3_dai = asoc_rtd_to_cpu(rtd, 0);
 	wm9081_dai = asoc_rtd_to_codec(rtd, 0);
 
-	ret = snd_soc_dai_set_sysclk(aif3_dai, ARIZONA_CLK_SYSCLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(aif3_dai, ARIZONA_CLK_SYSCLK, 0, 0, 0);
 	if (ret != 0) {
 		dev_err(aif1_dai->dev, "Failed to set AIF1 clock: %d\n", ret);
 		return ret;
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index 8aa78ff..9ff9302 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -86,7 +86,7 @@ static int h1940_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* select clock source */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C24XX_CLKSRC_PCLK, rate,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C24XX_CLKSRC_PCLK, 0, rate,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b043183..3cbaf26 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -494,7 +494,7 @@ static inline void i2s_fifo(struct i2s_dai *i2s, u32 flush)
 	writel(readl(fic) & ~flush, fic);
 }
 
-static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
+static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source, unsigned int rfs,
 			  int dir)
 {
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
@@ -682,7 +682,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		 * clock configuration assigned in DT is not overwritten.
 		 */
 		if (priv->rclk_srcrate == 0 && priv->clk_data.clks == NULL)
-			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0,
+			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0, 0,
 							0, SND_SOC_CLOCK_IN);
 		break;
 	default:
@@ -1076,7 +1076,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 
 	/* Gate CDCLK by default */
 	if (!is_opened(other))
-		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
+		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK, 0,
 				0, SND_SOC_CLOCK_IN);
 	pm_runtime_put(dai->dev);
 
diff --git a/sound/soc/samsung/jive_wm8750.c b/sound/soc/samsung/jive_wm8750.c
index 40a85f5..67681c2 100644
--- a/sound/soc/samsung/jive_wm8750.c
+++ b/sound/soc/samsung/jive_wm8750.c
@@ -57,7 +57,7 @@ static int jive_hw_params(struct snd_pcm_substream *substream,
 				s3c_i2sv2_get_clock(cpu_dai));
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, 0, clk,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index a1ff140..74770f7 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -44,7 +44,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 			}
 
 			ret = snd_soc_dai_set_sysclk(aif1_dai,
-						     WM8994_SYSCLK_FLL1,
+						     WM8994_SYSCLK_FLL1, 0,
 						     sample_rate * 512,
 						     SND_SOC_CLOCK_IN);
 			if (ret < 0) {
@@ -77,7 +77,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
-		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, 0,
 					     32768, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			pr_err("Failed to switch away from FLL1: %d\n", ret);
@@ -119,7 +119,7 @@ static int littlemill_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
-				     WM8994_SYSCLK_FLL1,
+				     WM8994_SYSCLK_FLL1, 0,
 				     sample_rate * 512,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
@@ -193,7 +193,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_FLL2,
+		ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_FLL2, 0,
 					     8000 * 256,
 					     SND_SOC_CLOCK_IN);
 		if (ret < 0) {
@@ -202,7 +202,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_MCLK2,
+		ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_MCLK2, 0,
 					     32768, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			pr_err("Failed to switch away from FLL2: %d\n", ret);
@@ -270,12 +270,12 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, 0,
 				     32768, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_MCLK2,
+	ret = snd_soc_dai_set_sysclk(aif2_dai, WM8994_SYSCLK_MCLK2, 0,
 				     32768, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 1f9a553..41f05e8 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -56,7 +56,7 @@ static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 
 	if (rate != priv->fll1_rate && priv->fll1_rate) {
 		/* while reconfiguring, switch to MCLK2 for SYSCLK */
-		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, 0,
 					     MCLK2_RATE, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
@@ -72,14 +72,14 @@ static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 	}
 	priv->fll1_rate = rate;
 
-	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_FLL1,
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_FLL1, 0,
 				     priv->fll1_rate, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "Failed to set SYSCLK source: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0, 0,
 				     SAMSUNG_I2S_OPCLK_PCLK);
 	if (ret < 0) {
 		dev_err(card->dev, "Failed to set OPCLK source: %d\n", ret);
@@ -96,7 +96,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, 0,
 				     MCLK2_RATE, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
@@ -297,7 +297,7 @@ static int midas_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	/* Use MCLK2 as SYSCLK for boot */
-	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, MCLK2_RATE,
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, 0, MCLK2_RATE,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(aif1_dai->dev, "Failed to switch to MCLK2: %d\n", ret);
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 9266070..69fa81f 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -63,7 +63,7 @@ static int neo1973_hifi_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8753_MCLK, pll_out,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8753_MCLK, 0, pll_out,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -130,7 +130,7 @@ static int neo1973_voice_hw_params(struct snd_pcm_substream *substream,
 	pcmdiv = WM8753_PCM_DIV_6; /* 2.048 MHz */
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8753_PCMCLK, 12288000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8753_PCMCLK, 0, 12288000,
 		SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ca643a4..223ee40 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -100,7 +100,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 	if (rtd->num_codecs > 1) {
 		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 1);
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, rclk_freq,
 					     SND_SOC_CLOCK_IN);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index bfd76e9..3c949de 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -404,7 +404,7 @@ static int s3c_pcm_set_clkdiv(struct snd_soc_dai *cpu_dai,
 }
 
 static int s3c_pcm_set_sysclk(struct snd_soc_dai *cpu_dai,
-				  int clk_id, unsigned int freq, int dir)
+				  int clk_id, int source, unsigned int freq, int dir)
 {
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(cpu_dai);
 	void __iomem *regs = pcm->regs;
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index 400a7f7..1f61f38 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -173,7 +173,7 @@ static int rx1950_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* select clock source */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, clk_source, rate,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, clk_source, 0, rate,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 50c0800..6c8fadd 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -271,7 +271,7 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
  * Set S3C24xx Clock source
  */
 static int s3c24xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
-	int clk_id, unsigned int freq, int dir)
+	int clk_id, int source, unsigned int freq, int dir)
 {
 	u32 iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 
diff --git a/sound/soc/samsung/s3c24xx_simtec.c b/sound/soc/samsung/s3c24xx_simtec.c
index 3cddd11..fc22263 100644
--- a/sound/soc/samsung/s3c24xx_simtec.c
+++ b/sound/soc/samsung/s3c24xx_simtec.c
@@ -164,7 +164,7 @@ static int simtec_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0,
 				     CODEC_CLOCK, SND_SOC_CLOCK_IN);
 	if (ret) {
 		pr_err( "%s: failed setting codec sysclk\n", __func__);
@@ -172,7 +172,7 @@ static int simtec_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (pdata->use_mpllin) {
-		ret = snd_soc_dai_set_sysclk(cpu_dai, S3C24XX_CLKSRC_MPLL,
+		ret = snd_soc_dai_set_sysclk(cpu_dai, S3C24XX_CLKSRC_MPLL, 0,
 					     0, SND_SOC_CLOCK_OUT);
 
 		if (ret) {
diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 6272070..39b14fc 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -167,7 +167,7 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, clk_source , clk,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, clk_source, 0, clk,
 			SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -187,7 +187,7 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, clk,
 			SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/smartq_wm8987.c b/sound/soc/samsung/smartq_wm8987.c
index c95629b..b12e9d2 100644
--- a/sound/soc/samsung/smartq_wm8987.c
+++ b/sound/soc/samsung/smartq_wm8987.c
@@ -47,19 +47,19 @@ static int smartq_hifi_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Use PCLK for I2S signal generation */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0, 0,
 					0, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* Gate the RCLK output on PAD */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK, 0,
 					0, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
 
 	/* set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, clk,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8750_SYSCLK, 0, clk,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 6f3eeb7..7f79db5 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -130,7 +130,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* Set S/PDIF uses internal source clock */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK, 0,
 					rclk_rate, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index ed753a2..881f243 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -75,7 +75,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8580_CLKSRC_PLLA,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8580_CLKSRC_PLLA, 0,
 				     pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 681b244..b24d10d 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -62,7 +62,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1, 0,
 					pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index a016405..a1b692c 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -61,7 +61,7 @@ static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	mclk_freq = params_rate(params) * rfs;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1, 0,
 					mclk_freq, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -72,7 +72,7 @@ static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* Set PCM source clock on CPU */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C_PCM_CLKSRC_MUX,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C_PCM_CLKSRC_MUX, 0,
 					mclk_freq, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 989af62..321963c 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -115,7 +115,7 @@ static int snow_late_probe(struct snd_soc_card *card)
 		codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set the MCLK rate for the codec */
-	return snd_soc_dai_set_sysclk(codec_dai, 0,
+	return snd_soc_dai_set_sysclk(codec_dai, 0, 0,
 				FIN_PLL_RATE, SND_SOC_CLOCK_IN);
 }
 
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 226c359..c062deb 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -117,7 +117,7 @@ static void spdif_snd_txctrl(struct samsung_spdif_info *spdif, int on)
 }
 
 static int spdif_set_sysclk(struct snd_soc_dai *cpu_dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct samsung_spdif_info *spdif = to_info(cpu_dai);
 	u32 clkcon;
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index f5f6ba0..acd7682 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -32,7 +32,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
-		ret = snd_soc_dai_set_sysclk(codec_dai, WM8996_SYSCLK_MCLK2,
+		ret = snd_soc_dai_set_sysclk(codec_dai, WM8996_SYSCLK_MCLK2, 0,
 					     32768, SND_SOC_CLOCK_IN);
 		if (ret < 0)
 			return ret;
@@ -78,7 +78,7 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 			}
 
 			ret = snd_soc_dai_set_sysclk(codec_dai,
-						     WM8996_SYSCLK_FLL,
+						     WM8996_SYSCLK_FLL, 0,
 						     MCLK_AUDIO_RATE,
 						     SND_SOC_CLOCK_IN);
 			if (ret < 0)
@@ -134,7 +134,7 @@ static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(dai, 0, MCLK_AUDIO_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(dai, 0, 0, MCLK_AUDIO_RATE, 0);
 	if (ret < 0)
 		return ret;
 
@@ -147,7 +147,7 @@ static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 32768, 0);
+	ret = snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 0, 32768, 0);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 9300fef..c30e6b5 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -242,7 +242,7 @@ static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0,
 					0, SAMSUNG_I2S_OPCLK_PCLK);
 	if (ret < 0)
 		return ret;
@@ -318,7 +318,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	aif1_dai = asoc_rtd_to_codec(rtd, 0);
 	priv->component = asoc_rtd_to_codec(rtd, 0)->component;
 
-	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0, 0);
 	if (ret < 0) {
 		dev_err(aif1_dai->dev, "Failed to set SYSCLK: %d\n", ret);
 		return ret;
@@ -327,7 +327,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF2]);
 	aif2_dai = asoc_rtd_to_codec(rtd, 0);
 
-	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0, 0);
 	if (ret < 0) {
 		dev_err(aif2_dai->dev, "Failed to set ASYNCCLK: %d\n", ret);
 		return ret;
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index c962d2c..ec525dc 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -38,7 +38,7 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 				pr_err("Failed to start FLL: %d\n", ret);
 
 			ret = snd_soc_dai_set_sysclk(codec_dai,
-						     WM8962_SYSCLK_FLL,
+						     WM8962_SYSCLK_FLL, 0,
 						     sample_rate * 512,
 						     SND_SOC_CLOCK_IN);
 			if (ret < 0) {
@@ -73,7 +73,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
-		ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK,
+		ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK, 0,
 					     32768, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			pr_err("Failed to switch away from FLL: %d\n", ret);
@@ -184,7 +184,7 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	component = asoc_rtd_to_codec(rtd, 0)->component;
 	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK, 0,
 				     32768, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/sh/migor.c b/sound/soc/sh/migor.c
index 7082c12..a6ab0ab 100644
--- a/sound/soc/sh/migor.c
+++ b/sound/soc/sh/migor.c
@@ -50,7 +50,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	unsigned int rate = params_rate(params);
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, WM8978_PLL, 13000000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8978_PLL, 0, 13000000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		return ret;
@@ -67,7 +67,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 	clk_set_rate(&siumckb_clk, codec_freq);
 	dev_dbg(codec_dai->dev, "%s: configure %luHz\n", __func__, codec_freq);
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT, 0,
 				     codec_freq / 2, SND_SOC_CLOCK_IN);
 
 	if (!ret)
diff --git a/sound/soc/sh/siu_dai.c b/sound/soc/sh/siu_dai.c
index f2a386f..1fd9a59 100644
--- a/sound/soc/sh/siu_dai.c
+++ b/sound/soc/sh/siu_dai.c
@@ -622,7 +622,7 @@ static int siu_dai_set_fmt(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int siu_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int siu_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			      unsigned int freq, int dir)
 {
 	struct clk *siu_clk, *parent_clk;
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index 15b01bc..42faf1f 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -205,7 +205,7 @@ static int ssi_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int ssi_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
+static int ssi_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id, int source,
 			  unsigned int freq, int dir)
 {
 	struct ssi_priv *ssi = &ssi_cpu_data[cpu_dai->id];
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index cd3bb9a..609ff1f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -49,17 +49,18 @@ static inline int _soc_dai_ret(struct snd_soc_dai *dai,
  *
  * Configures the DAI master (MCLK) or system (SYSCLK) clocking.
  */
-int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 			   unsigned int freq, int dir)
 {
 	int ret;
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->set_sysclk)
-		ret = dai->driver->ops->set_sysclk(dai, clk_id, freq, dir);
+		ret = dai->driver->ops->set_sysclk(dai, clk_id, source, freq,
+						   dir);
 	else
-		ret = snd_soc_component_set_sysclk(dai->component, clk_id, 0,
-						   freq, dir);
+		ret = snd_soc_component_set_sysclk(dai->component, clk_id,
+						   source, freq, dir);
 
 	return soc_dai_ret(dai, ret);
 }
diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 2ed92c9..af04a8e 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -721,7 +721,7 @@ static int uni_player_startup(struct snd_pcm_substream *substream,
 				   -1);
 }
 
-static int uni_player_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int uni_player_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				 unsigned int freq, int dir)
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 47fae8d..fdedf99 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -106,7 +106,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int stm32_adfsdm_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int stm32_adfsdm_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				   unsigned int freq, int dir)
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 7d1672c..87bc0f7 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -611,7 +611,7 @@ static int stm32_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 }
 
 static int stm32_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret = 0;
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3aa1cf2..13fa2f7 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -548,7 +548,7 @@ static irqreturn_t stm32_sai_isr(int irq, void *devid)
 }
 
 static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
-				int clk_id, unsigned int freq, int dir)
+				int clk_id, int source, unsigned int freq, int dir)
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 78506c3..4fe9db9 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1035,7 +1035,7 @@ static int sun4i_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				unsigned int freq, int dir)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 0a0efd2..f2ff3e3 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -52,7 +52,7 @@ static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 00c1970..1d0a80c 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -72,7 +72,7 @@ static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 9afba37..87c7d24 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -55,7 +55,7 @@ static int tegra_rt5640_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index d30f8b6..6731fe4 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -56,7 +56,7 @@ static int tegra_rt5677_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 8853321..065a490 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -61,7 +61,7 @@ static int tegra_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, 0, mclk,
 				     SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index efd7938..db374eb 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -65,7 +65,7 @@ static int tegra_wm8753_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, WM8753_MCLK, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, WM8753_MCLK, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index e4863fa..ba81bdd 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -72,7 +72,7 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 6c1cc3d..4e3c76e 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -50,7 +50,7 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
 		dev_err(card->dev, "codec_dai clock not set\n");
diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index b043a00..9f07441 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -61,12 +61,12 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 			   snd_soc_card_get_drvdata(soc_card))->sysclk;
 
 	/* set the codec system clock */
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, sysclk, SND_SOC_CLOCK_OUT);
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, sysclk, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		return ret;
 
 	/* set the CPU system clock */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, sysclk, SND_SOC_CLOCK_OUT);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, sysclk, SND_SOC_CLOCK_OUT);
 	if (ret < 0 && ret != -ENOTSUPP)
 		return ret;
 
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b942203..1735e85 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -662,7 +662,7 @@ static int davinci_mcasp_set_clkdiv(struct snd_soc_dai *dai, int div_id,
 	return __davinci_mcasp_set_clkdiv(mcasp, div_id, div, 1);
 }
 
-static int davinci_mcasp_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int davinci_mcasp_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				    unsigned int freq, int dir)
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index a7c0484..26bab67 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -339,7 +339,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 
 	sysclk_rate = priv->hsdiv_rates[domain->parent_clk_id];
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, sysclk_rate,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, sysclk_rate,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(priv->dev,
@@ -349,7 +349,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, MCASP_CLK_HCLK_AUXCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, MCASP_CLK_HCLK_AUXCLK, 0,
 				     sysclk_rate, SND_SOC_CLOCK_IN);
 
 	if (ret && ret != -ENOTSUPP) {
@@ -406,13 +406,13 @@ static int j721e_audio_init(struct snd_soc_pcm_runtime *rtd)
 
 	sysclk_rate = priv->hsdiv_rates[domain->parent_clk_id];
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, sysclk_rate,
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, sysclk_rate,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, MCASP_CLK_HCLK_AUXCLK,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, MCASP_CLK_HCLK_AUXCLK, 0,
 				     sysclk_rate, SND_SOC_CLOCK_IN);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index ed217b3..65a891d 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -105,7 +105,7 @@ static int n810_hw_params(struct snd_pcm_substream *substream,
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, 12000000,
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, 0, 12000000,
 					    SND_SOC_CLOCK_IN);
 
 	return err;
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 16ea039..1b87df036 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -61,7 +61,7 @@ static int omap_abe_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* set the codec mclk */
-	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id, freq,
+	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id, 0, freq,
 				SND_SOC_CLOCK_IN);
 	if (ret) {
 		printk(KERN_ERR "can't set codec system clock\n");
@@ -81,13 +81,13 @@ static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_SYSCLK_PAD_CLKS,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_SYSCLK_PAD_CLKS, 0,
 				     19200000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		printk(KERN_ERR "can't set DMIC cpu system clock\n");
 		return ret;
 	}
-	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_ABE_DMIC_CLK, 2400000,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_ABE_DMIC_CLK, 0, 2400000,
 				     SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		printk(KERN_ERR "can't set DMIC output clock\n");
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index a26588e..419b412 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -387,7 +387,7 @@ static int omap_dmic_select_outclk(struct omap_dmic *dmic, int clk_id,
 	return ret;
 }
 
-static int omap_dmic_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int omap_dmic_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				    unsigned int freq, int dir)
 {
 	struct omap_dmic *dmic = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6025b30..cbd683d 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1203,7 +1203,7 @@ static int omap_mcbsp_dai_set_clkdiv(struct snd_soc_dai *cpu_dai,
 }
 
 static int omap_mcbsp_dai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-					 int clk_id, unsigned int freq,
+					 int clk_id, int source, unsigned int freq,
 					 int dir)
 {
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index a287e97..95307fd 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -37,7 +37,7 @@ static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* Set the codec system clock for DAC and ADC */
-	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 26000000,
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, 26000000,
 					    SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		pr_err(PREFIX "can't set codec system clock\n");
@@ -45,7 +45,7 @@ static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Set McBSP clock to external */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_MCBSP_SYSCLK_CLKS_EXT,
+	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_MCBSP_SYSCLK_CLKS_EXT, 0,
 				     256 * params_rate(params),
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index a2629cc..0080d97 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -106,7 +106,7 @@ static int rx51_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set the codec system clock for DAC and ADC */
-	return snd_soc_dai_set_sysclk(codec_dai, 0, 19200000,
+	return snd_soc_dai_set_sysclk(codec_dai, 0, 0, 19200000,
 				      SND_SOC_CLOCK_IN);
 }
 
diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 25c40c2..963e025 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -143,7 +143,7 @@ static int find_divider(struct uniphier_aio *aio, int pll_id, unsigned int freq)
 	return -ENOTSUPP;
 }
 
-static int uniphier_aio_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+static int uniphier_aio_set_sysclk(struct snd_soc_dai *dai, int clk_id, int source,
 				   unsigned int freq, int dir)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
@@ -302,7 +302,7 @@ static int uniphier_aio_hw_params(struct snd_pcm_substream *substream,
 			params_rate(params));
 		return -EINVAL;
 	}
-	ret = snd_soc_dai_set_sysclk(dai, AUD_CLK_A,
+	ret = snd_soc_dai_set_sysclk(dai, AUD_CLK_A, 0,
 				     freq, SND_SOC_CLOCK_OUT);
 	if (ret)
 		return ret;
diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 2105237..03f1e81 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -619,7 +619,7 @@ static int ux500_msp_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 
 static int ux500_msp_dai_set_dai_sysclk(struct snd_soc_dai *dai,
-					int clk_id, unsigned int freq, int dir)
+					int clk_id, int source, unsigned int freq, int dir)
 {
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
 
-- 
2.7.4

