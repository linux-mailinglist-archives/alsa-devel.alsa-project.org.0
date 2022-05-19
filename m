Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE2B52D85A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A0F163D;
	Thu, 19 May 2022 17:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A0F163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975072;
	bh=sTOcvBpE6NxPJBUV3rzyxq3z6PwQlhdaTz/HpxgjJU8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SsJdksd2gxgV+0N2q9xtYreSEaiPNHk1yXYgdwkjAPduXg4fyB+rqDbQvfvNYNHyG
	 iaIcLTeGJ9ED+uNybmA8Wg4J2ni6EE8jouzZSEEY5L3HGlsbEbjMfWAbnG1KD7MgjF
	 3vmXBMl098v4Ia3p1MJ2uNHIs7VOIIG0uYiCeIAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67FBF80524;
	Thu, 19 May 2022 17:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A77EF800D1; Thu, 19 May 2022 17:43:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE469F800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE469F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RWaMdznv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11k002261;
 Thu, 19 May 2022 10:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=MlGxWDEhiLEzJWCOMp9mdKZ4UoXGVcox5jqQuGHbxDo=;
 b=RWaMdznvIU2lGGFbbZqLnazWKn7WdbFPod1LyghGyiX1bAYvx1tXUz1khhTPssBL4CvN
 YizXNjIgNZ9sXE2DkOH/p/dMRqkC7mZKDd/rWKkD48PfWzA8n0823+2DxJT1rFsP2Qj2
 EgaHNy5cAU07DAdhIBrSek/8OiHShLZS5aSQ8C576M35GdygnSATUckJxwxoAzdDoyE/
 yHJQxbDkC3VqIMZ6WGeCiSlK5KtsOVZgGBzcI6D8GKIEXN5Pf0lZcAWu1IwL6FTAvSRt
 rJBT7w3B6dZRfekQZXUmfA9mmFODrTKAMvgmhbQZ4ne7BOa2lmpK230EVR5timL7X2l3 Zw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 492E7476;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Date: Thu, 19 May 2022 16:42:22 +0100
Message-ID: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HFsp4N4C1dfLI4kl_Yax3agDBYSk2Vi1
X-Proofpoint-ORIG-GUID: HFsp4N4C1dfLI4kl_Yax3agDBYSk2Vi1
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

Currently the set_fmt callback always passes clock provider/consumer
with respect to the CODEC. This made sense when the framework was
directly broken down into platforms and CODECs. However, as things
are now broken down into components which can be connected as either
the CPU or CODEC side of a DAI link it simplifies things if each
side of the link is just told if it is provider or consumer of the
clocks. Making this change allows us to remove one of the last parts
of the ASoC core that needs to know if a driver is a CODEC driver,
where it flips the clock format specifier if a CODEC driver is used on
the CPU side of a DAI link, as well as just being conceptually more
consistent with componentisation.

The basic idea of this patch chain is to change the set_fmt callback
from specifying if the CODEC is provider/consumer into directly
specifying if the component is provider/consumer. To do this we add
some new defines, and then to preserve bisectability, the migration is
done by adding a new callback, converting over all existing CPU side
drivers, converting the core, and then finally reverting back to the
old callback.

Converting the platform drivers makes sense as the existing defines
are from the perspective of the CODEC and there are more CODEC drivers
than platform drivers.

Obviously a fair amount of this patch chain I was only able to build
test, so any testing that can be done would be greatly appreciated.

Thanks,
Charles

Charles Keepax (56):
  ASoC: core: Add set_fmt_new callback that directly specifies provider
  ASoC: amd: vangogh: Update to use set_fmt_new callback
  ASoC: atmel: Update to use set_fmt_new callback
  ASoC: au1x: Update to use set_fmt_new callback
  ASoC: bcm: Update to use set_fmt_new callback
  ASoC: ep93xx: Update to use set_fmt_new callback
  ASoC: dwc: Update to use set_fmt_new callback
  ASoC: fsl: Update to use set_fmt_new callback
  ASoC: hisilicon: Update to use set_fmt_new callback
  ASoC: img: Update to use set_fmt_new callback
  ASoC: Intel: Update to use set_fmt_new callback
  ASoC: js4740-i2s: Update to use set_fmt_new callback
  ASoC: mediatek: Update to use set_fmt_new callback
  ASoC: meson: Update to use set_fmt_new callback
  ASoC: mxs-saif: Update to use set_fmt_new callback
  ASoC: pxa: Update to use set_fmt_new callback
  ASoC: qcom: Update to use set_fmt_new callback
  ASoC: rockchip: Update to use set_fmt_new callback
  ASoC: samsung: Update to use set_fmt_new callback
  ASoC: sh: Update to use set_fmt_new callback
  ASoC: stm: Update to use set_fmt_new callback
  ASoC: sunxi: Update to use set_fmt_new callback
  ASoC: tegra: Update to use set_fmt_new callback
  ASoC: test-component: Update to use set_fmt_new callback
  ASoC: ti: Update to use set_fmt_new callback
  ASoC: ux500: Update to use set_fmt_new callback
  ASoC: xtensa: Update to use set_fmt_new callback
  ASoC: core: Always send the CPU DAI a direct clock specifier
  ASoC: amd: vangogh: Rename set_fmt_new back to set_fmt
  ASoC: atmel: Rename set_fmt_new back to set_fmt
  ASoC: au1x: Rename set_fmt_new back to set_fmt
  ASoC: bcm: Rename set_fmt_new back to set_fmt
  ASoC: ep93xx: Rename set_fmt_new back to set_fmt
  ASoC: dwc: Rename set_fmt_new back to set_fmt
  ASoC: fsl: Rename set_fmt_new back to set_fmt
  ASoC: hisilicon: Rename set_fmt_new back to set_fmt
  ASoC: img: Rename set_fmt_new back to set_fmt
  ASoC: Intel: Rename set_fmt_new back to set_fmt
  ASoC: jz4740-i2s: Rename set_fmt_new back to set_fmt
  ASoC: mediatek: Rename set_fmt_new back to set_fmt
  ASoC: meson: Rename set_fmt_new back to set_fmt
  ASoC: mxs-saif: Rename set_fmt_new back to set_fmt
  ASoC: pxa: Rename set_fmt_new back to set_fmt
  ASoC: qcom: Rename set_fmt_new back to set_fmt
  ASoC: rockchip: Rename set_fmt_new back to set_fmt
  ASoC: samsung: Rename set_fmt_new back to set_fmt
  ASoC: sh: Rename set_fmt_new back to set_fmt
  ASoC: stm: Rename set_fmt_new back to set_fmt
  ASoC: sunxi: Rename set_fmt_new back to set_fmt
  ASoC: tegra: Rename set_fmt_new back to set_fmt
  ASoC: test-component: Rename set_fmt_new back to set_fmt
  ASoC: ti: Rename set_fmt_new back to set_fmt
  ASoC: ux500: Rename set_fmt_new back to set_fmt
  ASoC: xtensa: Rename set_fmt_new back to set_fmt
  ASoC: soc-dai: Remove set_fmt_new callback
  ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local

 include/sound/soc-component.h                |  5 ---
 include/sound/soc-dai.h                      |  6 ++++
 sound/soc/amd/vangogh/acp5x-i2s.c            |  4 +--
 sound/soc/atmel/atmel-i2s.c                  |  4 +--
 sound/soc/atmel/atmel_ssc_dai.c              | 18 +++++-----
 sound/soc/atmel/mchp-i2s-mcc.c               |  8 ++---
 sound/soc/atmel/mchp-pdmc.c                  |  4 +--
 sound/soc/au1x/i2sc.c                        |  2 +-
 sound/soc/au1x/psc-i2s.c                     |  4 +--
 sound/soc/bcm/bcm2835-i2s.c                  | 20 +++++------
 sound/soc/bcm/cygnus-ssp.c                   |  4 +--
 sound/soc/cirrus/ep93xx-i2s.c                |  4 +--
 sound/soc/dwc/dwc-i2s.c                      |  8 ++---
 sound/soc/fsl/fsl_audmix.c                   |  6 ++--
 sound/soc/fsl/fsl_esai.c                     |  8 ++---
 sound/soc/fsl/fsl_mqs.c                      |  2 +-
 sound/soc/fsl/fsl_sai.c                      |  8 ++---
 sound/soc/fsl/fsl_ssi.c                      | 22 ++++++------
 sound/soc/fsl/imx-audmix.c                   |  4 +--
 sound/soc/fsl/imx-card.c                     |  2 +-
 sound/soc/generic/simple-card-utils.c        |  7 +++-
 sound/soc/generic/test-component.c           | 18 +++++-----
 sound/soc/hisilicon/hi6210-i2s.c             | 18 +++++-----
 sound/soc/img/img-i2s-in.c                   |  4 +--
 sound/soc/img/img-i2s-out.c                  |  6 ++--
 sound/soc/intel/atom/sst-atom-controls.c     |  4 +--
 sound/soc/intel/boards/bytcht_cx2072x.c      |  2 +-
 sound/soc/intel/boards/bytcht_da7213.c       |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c       |  2 +-
 sound/soc/intel/boards/bytcht_nocodec.c      |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c        |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c        |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c        |  2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |  3 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c      |  6 ++--
 sound/soc/intel/boards/cht_bsw_rt5672.c      |  2 +-
 sound/soc/intel/keembay/kmb_platform.c       |  4 +--
 sound/soc/jz4740/jz4740-i2s.c                | 10 +++---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c  |  6 ++--
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c   |  6 ++--
 sound/soc/meson/aiu-encoder-i2s.c            |  2 +-
 sound/soc/meson/axg-tdm-interface.c          | 14 ++++----
 sound/soc/mxs/mxs-saif.c                     |  4 +--
 sound/soc/pxa/magician.c                     |  8 ++---
 sound/soc/pxa/mmp-sspa.c                     |  6 ++--
 sound/soc/pxa/pxa-ssp.c                      | 22 ++++++------
 sound/soc/pxa/pxa2xx-i2s.c                   |  6 ++--
 sound/soc/qcom/apq8016_sbc.c                 |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c            |  4 +--
 sound/soc/qcom/qdsp6/q6afe.c                 |  6 ++--
 sound/soc/qcom/sc7180.c                      |  2 +-
 sound/soc/qcom/sdm845.c                      |  6 ++--
 sound/soc/qcom/sm8250.c                      |  4 +--
 sound/soc/rockchip/rockchip_i2s.c            |  6 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.c        |  6 ++--
 sound/soc/samsung/i2s.c                      |  6 ++--
 sound/soc/samsung/pcm.c                      |  4 +--
 sound/soc/samsung/s3c-i2s-v2.c               |  6 ++--
 sound/soc/samsung/s3c24xx-i2s.c              |  6 ++--
 sound/soc/sh/fsi.c                           |  6 ++--
 sound/soc/sh/rcar/core.c                     |  4 +--
 sound/soc/sh/rz-ssi.c                        |  2 +-
 sound/soc/sh/ssi.c                           | 10 +++---
 sound/soc/soc-core.c                         | 14 ++------
 sound/soc/soc-dai.c                          |  3 +-
 sound/soc/stm/stm32_i2s.c                    |  8 ++---
 sound/soc/stm/stm32_sai_sub.c                |  8 ++---
 sound/soc/sunxi/sun4i-i2s.c                  | 18 +++++-----
 sound/soc/sunxi/sun8i-codec.c                |  6 ++--
 sound/soc/tegra/tegra20_i2s.c                |  6 ++--
 sound/soc/tegra/tegra210_i2s.c               |  6 ++--
 sound/soc/tegra/tegra30_i2s.c                |  6 ++--
 sound/soc/ti/davinci-i2s.c                   | 32 ++++++++---------
 sound/soc/ti/davinci-mcasp.c                 | 10 +++---
 sound/soc/ti/omap-mcbsp.c                    | 12 +++----
 sound/soc/ux500/ux500_msp_dai.c              | 36 ++++++++++----------
 sound/soc/xtensa/xtfpga-i2s.c                |  4 +--
 77 files changed, 279 insertions(+), 283 deletions(-)

-- 
2.30.2

