Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B36193134
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 20:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204431688;
	Wed, 25 Mar 2020 20:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204431688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585164948;
	bh=+bvCLOaPLzkG3Mgr6fxtTGGJ/0cGAVIqJYcmIi/IAyo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ST8nQj+yntXibqDP1VM/4+wo287aeUctAwlajM37KAi33Gm5ueEmauTYhGRqUhhGW
	 j8fkatxRhwmjCG6mOTSFBvz0IpJ8coybIsajmrk/wn7eCLi2Q42D1R1mKOc5cRg7xV
	 8/HDMfk5Ct021FQEfQaB2igSKn64Iv9ummTEjOVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C6CBF8015A;
	Wed, 25 Mar 2020 20:34:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469C6F80158; Wed, 25 Mar 2020 20:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83139F80095
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 20:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83139F80095
IronPort-SDR: 9vVED9M0odlGKtdHrB05l4vxXLvonQPuPTyi207pK1Tse/QLSGgA01PA6GyDC0YT3Bhz30D7gE
 1LmWQjZA4TYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 12:33:53 -0700
IronPort-SDR: 3uag0LbJP9I1Roe0yXCS8N9P0ZFOkfzHdKKz6PmDSyK6fjGkbGLnUlWuR3V+Wjwjz7karsTzlt
 HOJdZtbKAg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="420427120"
Received: from mkarvir-mobl.amr.corp.intel.com (HELO [10.251.27.204])
 ([10.251.27.204])
 by orsmga005.jf.intel.com with ESMTP; 25 Mar 2020 12:33:51 -0700
Subject: Re: [PATCH 00/36] ASoC: remove rtd->cpu/codec_dai{s}
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <877dzbk5wm.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0700fce9-7225-8a0a-7aee-1adcd494cc91@linux.intel.com>
Date: Wed, 25 Mar 2020 14:13:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <877dzbk5wm.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 3/23/20 12:16 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> Now, CPU/Codec DAI(s) were replaced by rtd->dais.
> Thus, We don't need rtd->cpu/codec_dai{s} anymore.
> This pathset replaces it by new macro.

No issues detected by the SOF CI:

https://sof-ci.01.org/linuxpr/PR1926/build3375/devicetest/

so for the core/Intel/SOF parts (Patches 1-11-21-33+)

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The only open in my mind is whether the last patch removes 
cpu/codec_dais immediately or is applied with a bit of delay.

Either way is fine for SOF, we've done the changes already to what is 
not upstream just yet.

Thanks Morimoto-san!

> Kuninori Morimoto (36):
>    ASoC: soc-core: add asoc_rtd_to_cpu/codec() macro
>    ASoC: amd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: atmel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: au1x: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: bcm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: cirrus: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: dwc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: fsl: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: generic: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: img: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: kirkwood: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: mediatek: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: meson: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: mxs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: pxa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: qcom: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: rockchip: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: sh: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: sof: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: sprd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: stm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: sunxi: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: tegra: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: ti: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: txx9: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: uniphier: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: ux500: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: xtensa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: arm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: codecs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: soc: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer
>    ASoC: soc-core: set rtd->num_cpu/codec at soc_new_pcm_runtime()
>    ASoC: soc-core: tidyup soc_new_pcm_runtime() rtd setups
>    ASoC: soc-core: remove cpu_dai/codec_dai/cpu_dais/codec_dais
> 
>   include/sound/soc.h                           | 30 +++++++------
>   sound/arm/pxa2xx-pcm-lib.c                    |  8 ++--
>   sound/soc/amd/acp-da7219-max98357a.c          |  2 +-
>   sound/soc/amd/acp-rt5645.c                    |  4 +-
>   sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +--
>   sound/soc/atmel/atmel-pcm-dma.c               |  4 +-
>   sound/soc/atmel/atmel-pcm-pdc.c               |  2 +-
>   sound/soc/atmel/atmel_wm8904.c                |  2 +-
>   sound/soc/atmel/mikroe-proto.c                |  2 +-
>   sound/soc/atmel/sam9g20_wm8731.c              |  2 +-
>   sound/soc/atmel/sam9x5_wm8731.c               |  2 +-
>   sound/soc/au1x/db1200.c                       |  2 +-
>   sound/soc/au1x/dbdma2.c                       |  2 +-
>   sound/soc/au1x/dma.c                          |  2 +-
>   sound/soc/au1x/psc-ac97.c                     |  2 +-
>   sound/soc/bcm/bcm63xx-pcm-whistler.c          | 16 +++----
>   sound/soc/bcm/cygnus-pcm.c                    | 22 +++++-----
>   sound/soc/cirrus/edb93xx.c                    |  4 +-
>   sound/soc/cirrus/snappercl15.c                |  4 +-
>   sound/soc/codecs/cs47l15.c                    |  4 +-
>   sound/soc/codecs/cs47l24.c                    |  6 +--
>   sound/soc/codecs/cs47l35.c                    |  6 +--
>   sound/soc/codecs/cs47l85.c                    |  6 +--
>   sound/soc/codecs/cs47l90.c                    |  6 +--
>   sound/soc/codecs/cs47l92.c                    |  4 +-
>   sound/soc/codecs/wm5110.c                     |  6 +--
>   sound/soc/codecs/wm_adsp.c                    | 10 ++---
>   sound/soc/dwc/dwc-pcm.c                       |  2 +-
>   sound/soc/fsl/eukrea-tlv320.c                 |  4 +-
>   sound/soc/fsl/fsl-asoc-card.c                 | 10 ++---
>   sound/soc/fsl/fsl_asrc_dma.c                  |  6 +--
>   sound/soc/fsl/fsl_spdif.c                     | 10 ++---
>   sound/soc/fsl/fsl_ssi.c                       |  8 ++--
>   sound/soc/fsl/imx-audmix.c                    |  8 ++--
>   sound/soc/fsl/imx-mc13783.c                   |  4 +-
>   sound/soc/fsl/imx-sgtl5000.c                  |  2 +-
>   sound/soc/fsl/mpc5200_dma.c                   | 10 ++---
>   sound/soc/fsl/mpc5200_psc_i2s.c               |  2 +-
>   sound/soc/fsl/mpc8610_hpcd.c                  |  4 +-
>   sound/soc/fsl/mx27vis-aic32x4.c               |  4 +-
>   sound/soc/fsl/p1022_ds.c                      |  4 +-
>   sound/soc/fsl/p1022_rdk.c                     |  4 +-
>   sound/soc/fsl/wm1133-ev1.c                    |  6 +--
>   sound/soc/generic/simple-card-utils.c         | 12 +++---
>   sound/soc/img/img-i2s-in.c                    |  2 +-
>   sound/soc/img/img-i2s-out.c                   |  2 +-
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c  |  6 +--
>   sound/soc/intel/boards/bdw-rt5650.c           |  6 +--
>   sound/soc/intel/boards/bdw-rt5677.c           |  6 +--
>   sound/soc/intel/boards/broadwell.c            |  4 +-
>   sound/soc/intel/boards/bxt_da7219_max98357a.c |  8 ++--
>   sound/soc/intel/boards/bxt_rt298.c            |  8 ++--
>   sound/soc/intel/boards/byt-max98090.c         |  2 +-
>   sound/soc/intel/boards/byt-rt5640.c           |  4 +-
>   sound/soc/intel/boards/bytcht_cx2072x.c       | 10 ++---
>   sound/soc/intel/boards/bytcht_da7213.c        |  8 ++--
>   sound/soc/intel/boards/bytcht_es8316.c        |  8 ++--
>   sound/soc/intel/boards/bytcht_nocodec.c       |  4 +-
>   sound/soc/intel/boards/bytcr_rt5640.c         |  8 ++--
>   sound/soc/intel/boards/bytcr_rt5651.c         |  8 ++--
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +--
>   sound/soc/intel/boards/cht_bsw_nau8824.c      |  4 +-
>   sound/soc/intel/boards/cht_bsw_rt5645.c       | 14 +++----
>   sound/soc/intel/boards/cht_bsw_rt5672.c       |  8 ++--
>   sound/soc/intel/boards/cml_rt1011_rt5682.c    |  6 +--
>   sound/soc/intel/boards/glk_rt5682_max98357a.c | 10 ++---
>   sound/soc/intel/boards/haswell.c              |  2 +-
>   sound/soc/intel/boards/kbl_da7219_max98357a.c |  8 ++--
>   sound/soc/intel/boards/kbl_da7219_max98927.c  |  6 +--
>   sound/soc/intel/boards/kbl_rt5660.c           |  6 +--
>   sound/soc/intel/boards/kbl_rt5663_max98927.c  |  8 ++--
>   .../intel/boards/kbl_rt5663_rt5514_max98927.c |  8 ++--
>   .../soc/intel/boards/skl_nau88l25_max98357a.c | 12 +++---
>   sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 16 +++----
>   sound/soc/intel/boards/skl_rt286.c            |  8 ++--
>   sound/soc/intel/boards/sof_da7219_max98373.c  |  8 ++--
>   sound/soc/intel/boards/sof_pcm512x.c          |  8 ++--
>   sound/soc/intel/boards/sof_rt5682.c           |  6 +--
>   sound/soc/intel/haswell/sst-haswell-pcm.c     | 26 ++++++------
>   sound/soc/intel/skylake/skl-pcm.c             | 10 ++---
>   sound/soc/kirkwood/armada-370-db.c            |  2 +-
>   sound/soc/kirkwood/kirkwood-dma.c             |  2 +-
>   sound/soc/mediatek/common/mtk-afe-fe-dai.c    | 10 ++---
>   .../mediatek/common/mtk-afe-platform-driver.c |  2 +-
>   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    |  2 +-
>   sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  4 +-
>   sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  4 +-
>   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |  2 +-
>   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  2 +-
>   sound/soc/mediatek/mt8173/mt8173-max98090.c   |  4 +-
>   .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  2 +-
>   .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  4 +-
>   sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  6 +--
>   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |  2 +-
>   .../mediatek/mt8183/mt8183-da7219-max98357.c  |  4 +-
>   .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  2 +-
>   sound/soc/meson/aiu-fifo.c                    |  2 +-
>   sound/soc/meson/axg-card.c                    |  8 ++--
>   sound/soc/meson/axg-fifo.c                    |  2 +-
>   sound/soc/meson/meson-card-utils.c            |  2 +-
>   sound/soc/mxs/mxs-sgtl5000.c                  |  4 +-
>   sound/soc/pxa/brownstone.c                    |  4 +-
>   sound/soc/pxa/corgi.c                         |  4 +-
>   sound/soc/pxa/hx4700.c                        |  4 +-
>   sound/soc/pxa/imote2.c                        |  4 +-
>   sound/soc/pxa/magician.c                      |  8 ++--
>   sound/soc/pxa/mioa701_wm9713.c                |  4 +-
>   sound/soc/pxa/mmp-pcm.c                       |  2 +-
>   sound/soc/pxa/mmp-sspa.c                      |  2 +-
>   sound/soc/pxa/poodle.c                        |  4 +-
>   sound/soc/pxa/pxa2xx-i2s.c                    |  2 +-
>   sound/soc/pxa/spitz.c                         |  4 +-
>   sound/soc/pxa/ttc-dkb.c                       |  2 +-
>   sound/soc/pxa/z2.c                            |  4 +-
>   sound/soc/pxa/zylonite.c                      |  6 +--
>   sound/soc/qcom/apq8016_sbc.c                  |  2 +-
>   sound/soc/qcom/apq8096.c                      |  6 +--
>   sound/soc/qcom/lpass-platform.c               |  2 +-
>   sound/soc/qcom/qdsp6/q6asm-dai.c              |  4 +-
>   sound/soc/qcom/qdsp6/q6routing.c              |  2 +-
>   sound/soc/qcom/sdm845.c                       | 22 +++++-----
>   sound/soc/qcom/storm.c                        |  2 +-
>   sound/soc/rockchip/rk3288_hdmi_analog.c       |  4 +-
>   sound/soc/rockchip/rk3399_gru_sound.c         | 16 +++----
>   sound/soc/rockchip/rockchip_max98090.c        |  6 +--
>   sound/soc/rockchip/rockchip_rt5645.c          |  6 +--
>   sound/soc/samsung/arndale.c                   |  6 +--
>   sound/soc/samsung/bells.c                     | 16 +++----
>   sound/soc/samsung/h1940_uda1380.c             |  2 +-
>   sound/soc/samsung/i2s.c                       |  2 +-
>   sound/soc/samsung/jive_wm8750.c               |  4 +-
>   sound/soc/samsung/littlemill.c                | 14 +++----
>   sound/soc/samsung/lowland.c                   |  4 +-
>   sound/soc/samsung/neo1973_wm8753.c            | 10 ++---
>   sound/soc/samsung/odroid.c                    |  2 +-
>   sound/soc/samsung/pcm.c                       |  4 +-
>   sound/soc/samsung/rx1950_uda1380.c            |  2 +-
>   sound/soc/samsung/s3c-i2s-v2.c                |  2 +-
>   sound/soc/samsung/s3c24xx_simtec.c            |  4 +-
>   sound/soc/samsung/s3c24xx_uda134x.c           |  6 +--
>   sound/soc/samsung/smartq_wm8987.c             |  4 +-
>   sound/soc/samsung/smdk_spdif.c                |  2 +-
>   sound/soc/samsung/smdk_wm8580.c               |  2 +-
>   sound/soc/samsung/smdk_wm8994.c               |  2 +-
>   sound/soc/samsung/smdk_wm8994pcm.c            |  4 +-
>   sound/soc/samsung/snow.c                      |  4 +-
>   sound/soc/samsung/spdif.c                     |  8 ++--
>   sound/soc/samsung/speyside.c                  |  8 ++--
>   sound/soc/samsung/tm2_wm5110.c                | 16 +++----
>   sound/soc/samsung/tobermory.c                 |  8 ++--
>   sound/soc/sh/dma-sh7760.c                     | 16 +++----
>   sound/soc/sh/fsi.c                            |  2 +-
>   sound/soc/sh/migor.c                          |  6 +--
>   sound/soc/sh/rcar/core.c                      |  2 +-
>   sound/soc/soc-compress.c                      | 36 ++++++++--------
>   sound/soc/soc-core.c                          | 42 +++++++------------
>   sound/soc/soc-dapm.c                          |  4 +-
>   sound/soc/soc-generic-dmaengine-pcm.c         |  6 +--
>   sound/soc/soc-pcm.c                           | 30 ++++++-------
>   sound/soc/sof/intel/hda-dai.c                 |  6 +--
>   sound/soc/sof/intel/hda-dsp.c                 |  2 +-
>   sound/soc/sprd/sprd-pcm-compress.c            |  4 +-
>   sound/soc/sprd/sprd-pcm-dma.c                 |  2 +-
>   sound/soc/stm/stm32_adfsdm.c                  | 12 +++---
>   sound/soc/stm/stm32_sai_sub.c                 |  2 +-
>   sound/soc/sunxi/sun4i-spdif.c                 |  2 +-
>   sound/soc/tegra/tegra_alc5632.c               |  2 +-
>   sound/soc/tegra/tegra_max98090.c              |  2 +-
>   sound/soc/tegra/tegra_rt5640.c                |  2 +-
>   sound/soc/tegra/tegra_rt5677.c                |  2 +-
>   sound/soc/tegra/tegra_sgtl5000.c              |  2 +-
>   sound/soc/tegra/tegra_wm8753.c                |  2 +-
>   sound/soc/tegra/tegra_wm8903.c                |  6 +--
>   sound/soc/tegra/trimslice.c                   |  2 +-
>   sound/soc/ti/ams-delta.c                      |  4 +-
>   sound/soc/ti/davinci-evm.c                    |  4 +-
>   sound/soc/ti/davinci-vcif.c                   |  4 +-
>   sound/soc/ti/n810.c                           |  2 +-
>   sound/soc/ti/omap-abe-twl6040.c               |  6 +--
>   sound/soc/ti/omap-mcbsp-st.c                  |  2 +-
>   sound/soc/ti/omap-mcbsp.c                     |  4 +-
>   sound/soc/ti/omap-mcpdm.c                     |  2 +-
>   sound/soc/ti/omap3pandora.c                   |  4 +-
>   sound/soc/ti/osk5912.c                        |  2 +-
>   sound/soc/ti/rx51.c                           |  2 +-
>   sound/soc/txx9/txx9aclc.c                     |  2 +-
>   sound/soc/uniphier/aio-compress.c             | 22 +++++-----
>   sound/soc/uniphier/aio-dma.c                  |  6 +--
>   sound/soc/ux500/mop500_ab8500.c               |  6 +--
>   sound/soc/ux500/ux500_pcm.c                   |  8 ++--
>   sound/soc/xtensa/xtfpga-i2s.c                 |  2 +-
>   191 files changed, 573 insertions(+), 577 deletions(-)
> 
