Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1D7B9B91
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67F5EB4;
	Thu,  5 Oct 2023 09:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67F5EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492420;
	bh=Zx3fESiS/i74KO00IW0q4mV27h8jE9ah2aZl7h8BibY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=derqiQlhsQisGobmfVVunxy2UHJCBA6eFVm2SQXxMJMZPBJvWEg4Rq2xJHOBMhBdU
	 7DKDgJVFZv+V+kCqOutM0klx6fe+mbXDgLH4/DxOWrvNO38M9Bw/TjzFT6K6wyveSn
	 JrJsxtcQEfgvfvXPM1VQZHs/kPjhUQyDLjDRGSL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D8EEF8057B; Thu,  5 Oct 2023 09:51:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE240F8055C;
	Thu,  5 Oct 2023 09:51:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BFA4F80549; Tue,  3 Oct 2023 20:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08FC2F80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 20:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FC2F80166
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cBDgF9Wk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A575EB81AB8;
	Tue,  3 Oct 2023 18:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0E2C433C9;
	Tue,  3 Oct 2023 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696356800;
	bh=Zx3fESiS/i74KO00IW0q4mV27h8jE9ah2aZl7h8BibY=;
	h=From:To:Cc:Subject:Date:From;
	b=cBDgF9Wkv3DGDxeLaFs8i1qxUV1wqSGNonkOM8CxfTyjsRUIhEkpOFPBQ+w4wmgGo
	 eKXXZ0tiWqFNWKcWAKQj2JzoSAxOXyyqtJ+nfz4aoeQuetdYZ5H1lVAQZZifAFn0vJ
	 JLouLftl3zb5r2KD8/bis/57AktFfQpbujSCqKntCJYDLmBEqbem3FWMvoA2X/LiOA
	 nuuAB9yOG/qtUJjMUJPJP6MPrrmQ1hhpSg8BuP8FAHTmbUSKNJZuJep7FMeIGWHeAW
	 9uqaRRAP1R2QMJK83q9u8SVP8ZUUCNCS0HOAyh4USKAfJr7DseWNTCp6ScNyPqPzCo
	 9TwTntgPyaYXQ==
Received: (nullmailer pid 1020034 invoked by uid 1000);
	Tue, 03 Oct 2023 18:13:14 -0000
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Kevin Cernekee <cernekee@chromium.org>, Shengjiu Wang <shengjiu.wang@
 gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <r
 anjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RESEND 0/5] ASoC: DT matching and header cleanups
Date: Tue,  3 Oct 2023 13:13:09 -0500
Message-Id: <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=FdhD=FR=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KGIEDNCTJC7YNCK7SEZQNXNLBRUEGKTG
X-Message-ID-Hash: KGIEDNCTJC7YNCK7SEZQNXNLBRUEGKTG
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:51:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGIEDNCTJC7YNCK7SEZQNXNLBRUEGKTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

(Got a bunch of bounces on the first try. Something weird going on with 
the To header best I can tell. Retrying with git-send-email instead of 
b4.)

This is a series is part of ongoing clean-ups related to device
matching and DT related implicit includes. Essentially of_device.h has
a bunch of implicit includes and generally isn't needed any nore except
for of_match_device(). As we also generally want to get rid of
of_match_device() as well, I've done that so we're not updating the
includes twice.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (5):
      ASoC: Explicitly include correct DT includes
      ASoC: Drop unnecessary of_match_device() calls
      ASoC: da7218: Use i2c_get_match_data()
      ASoC: qcom/lpass: Constify struct lpass_variant
      ASoC: Use device_get_match_data()

 sound/soc/atmel/atmel_wm8904.c                     |  1 -
 sound/soc/atmel/mchp-i2s-mcc.c                     |  2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |  1 -
 sound/soc/bcm/cygnus-ssp.c                         |  2 +-
 sound/soc/codecs/adau1701.c                        |  1 -
 sound/soc/codecs/adau1977-spi.c                    |  1 -
 sound/soc/codecs/ak4104.c                          |  2 +-
 sound/soc/codecs/ak4118.c                          |  2 +-
 sound/soc/codecs/ak4375.c                          |  2 +-
 sound/soc/codecs/ak4458.c                          |  2 +-
 sound/soc/codecs/ak4613.c                          |  2 +-
 sound/soc/codecs/ak4642.c                          |  2 +-
 sound/soc/codecs/ak5386.c                          |  7 +---
 sound/soc/codecs/ak5558.c                          |  2 +-
 sound/soc/codecs/cs35l32.c                         |  2 +-
 sound/soc/codecs/cs35l33.c                         |  2 -
 sound/soc/codecs/cs35l34.c                         |  2 +-
 sound/soc/codecs/cs35l35.c                         |  3 +-
 sound/soc/codecs/cs35l36.c                         |  3 +-
 sound/soc/codecs/cs35l41-i2c.c                     |  2 +-
 sound/soc/codecs/cs35l41.c                         |  1 -
 sound/soc/codecs/cs4270.c                          |  2 +-
 sound/soc/codecs/cs4271.c                          | 22 +++--------
 sound/soc/codecs/cs42l42.c                         |  1 -
 sound/soc/codecs/cs42l56.c                         |  2 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |  2 +-
 sound/soc/codecs/cs43130.c                         |  3 +-
 sound/soc/codecs/cs4349.c                          |  2 +-
 sound/soc/codecs/da7213.c                          |  2 +-
 sound/soc/codecs/da7218.c                          | 29 +--------------
 sound/soc/codecs/da7218.h                          |  2 +-
 sound/soc/codecs/da7219.c                          |  2 +-
 sound/soc/codecs/da9055.c                          |  1 -
 sound/soc/codecs/es8328.c                          |  1 -
 sound/soc/codecs/gtm601.c                          |  2 +-
 sound/soc/codecs/lpass-macro-common.c              |  2 +-
 sound/soc/codecs/mt6351.c                          |  2 +-
 sound/soc/codecs/mt6358.c                          |  2 +-
 sound/soc/codecs/mt6359-accdet.c                   |  4 --
 sound/soc/codecs/mt6359.c                          |  2 +-
 sound/soc/codecs/nau8540.c                         |  2 +-
 sound/soc/codecs/pcm1681.c                         |  2 -
 sound/soc/codecs/rt715.c                           |  2 -
 sound/soc/codecs/sgtl5000.c                        |  2 +-
 sound/soc/codecs/sma1303.c                         |  2 +-
 sound/soc/codecs/sta32x.c                          |  3 +-
 sound/soc/codecs/sta350.c                          |  3 +-
 sound/soc/codecs/tas5086.c                         |  6 +--
 sound/soc/codecs/tas571x.c                         |  2 +-
 sound/soc/codecs/uda1334.c                         |  2 +-
 sound/soc/codecs/wm8510.c                          |  2 +-
 sound/soc/codecs/wm8523.c                          |  2 +-
 sound/soc/codecs/wm8524.c                          |  2 +-
 sound/soc/codecs/wm8580.c                          |  2 +-
 sound/soc/codecs/wm8711.c                          |  2 +-
 sound/soc/codecs/wm8728.c                          |  2 +-
 sound/soc/codecs/wm8731-i2c.c                      |  2 +-
 sound/soc/codecs/wm8731-spi.c                      |  2 +-
 sound/soc/codecs/wm8737.c                          |  2 +-
 sound/soc/codecs/wm8741.c                          |  2 +-
 sound/soc/codecs/wm8750.c                          |  2 +-
 sound/soc/codecs/wm8753.c                          |  2 +-
 sound/soc/codecs/wm8770.c                          |  2 +-
 sound/soc/codecs/wm8776.c                          |  2 +-
 sound/soc/codecs/wm8804.c                          |  1 -
 sound/soc/fsl/efika-audio-fabric.c                 |  4 +-
 sound/soc/fsl/fsl_aud2htx.c                        |  3 +-
 sound/soc/fsl/fsl_mqs.c                            |  2 +-
 sound/soc/fsl/fsl_rpmsg.c                          |  3 +-
 sound/soc/fsl/fsl_sai.c                            |  3 +-
 sound/soc/fsl/fsl_spdif.c                          |  4 +-
 sound/soc/fsl/imx-audmux.c                         |  1 -
 sound/soc/fsl/imx-card.c                           |  3 +-
 sound/soc/fsl/imx-rpmsg.c                          |  3 +-
 sound/soc/fsl/mpc5200_dma.c                        |  4 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |  3 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |  3 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |  2 +-
 sound/soc/fsl/p1022_ds.c                           |  2 +-
 sound/soc/fsl/p1022_rdk.c                          |  2 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |  3 +-
 sound/soc/generic/audio-graph-card.c               |  2 -
 sound/soc/generic/audio-graph-card2.c              |  2 -
 sound/soc/generic/simple-card.c                    |  2 +-
 sound/soc/generic/test-component.c                 |  2 +-
 sound/soc/intel/keembay/kmb_platform.c             | 13 +------
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |  2 -
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |  2 +-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  2 +-
 sound/soc/mxs/mxs-saif.c                           |  1 -
 sound/soc/mxs/mxs-sgtl5000.c                       |  1 -
 sound/soc/qcom/apq8096.c                           |  2 +-
 sound/soc/qcom/lpass-apq8016.c                     |  6 +--
 sound/soc/qcom/lpass-cdc-dma.c                     |  2 +-
 sound/soc/qcom/lpass-cpu.c                         | 43 ++++++++++------------
 sound/soc/qcom/lpass-ipq806x.c                     |  2 +-
 sound/soc/qcom/lpass-platform.c                    | 36 +++++++++---------
 sound/soc/qcom/lpass-sc7180.c                      |  6 +--
 sound/soc/qcom/lpass-sc7280.c                      |  6 +--
 sound/soc/qcom/lpass.h                             |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |  1 -
 sound/soc/qcom/qdsp6/q6routing.c                   |  3 +-
 sound/soc/qcom/sc7180.c                            |  2 +-
 sound/soc/qcom/sc7280.c                            |  2 +-
 sound/soc/qcom/sc8280xp.c                          |  2 +-
 sound/soc/qcom/sdm845.c                            |  2 +-
 sound/soc/qcom/sm8250.c                            |  2 +-
 sound/soc/rockchip/rockchip_i2s.c                  |  8 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 24 ++++--------
 sound/soc/rockchip/rockchip_max98090.c             |  3 +-
 sound/soc/rockchip/rockchip_pdm.c                  |  7 +---
 sound/soc/samsung/aries_wm8994.c                   |  1 -
 sound/soc/samsung/arndale.c                        |  2 +-
 sound/soc/samsung/i2s.c                            |  2 -
 sound/soc/samsung/midas_wm1811.c                   |  2 -
 sound/soc/samsung/odroid.c                         |  1 -
 sound/soc/samsung/smdk_wm8994.c                    | 28 ++------------
 sound/soc/samsung/snow.c                           |  1 -
 sound/soc/sh/fsi.c                                 |  1 -
 sound/soc/sh/rcar/core.c                           |  1 +
 sound/soc/sh/rcar/rsnd.h                           |  4 +-
 sound/soc/sh/rcar/src.c                            |  1 +
 sound/soc/sh/rcar/ssi.c                            |  2 +
 sound/soc/sh/rz-ssi.c                              |  1 -
 sound/soc/stm/stm32_i2s.c                          |  7 +---
 sound/soc/stm/stm32_sai.c                          |  8 ++--
 sound/soc/stm/stm32_sai_sub.c                      |  6 +--
 sound/soc/stm/stm32_spdifrx.c                      |  8 +---
 sound/soc/sunxi/sun4i-codec.c                      |  4 --
 sound/soc/sunxi/sun4i-i2s.c                        |  2 +-
 sound/soc/sunxi/sun4i-spdif.c                      |  3 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |  3 +-
 sound/soc/sunxi/sun50i-dmic.c                      |  2 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |  1 -
 sound/soc/sunxi/sun8i-codec.c                      |  2 +-
 sound/soc/tegra/tegra186_asrc.c                    |  3 +-
 sound/soc/tegra/tegra186_dspk.c                    |  2 +-
 sound/soc/tegra/tegra20_spdif.c                    |  2 +-
 sound/soc/tegra/tegra210_adx.c                     |  3 +-
 sound/soc/tegra/tegra210_amx.c                     | 10 +----
 sound/soc/tegra/tegra210_dmic.c                    |  2 +-
 sound/soc/tegra/tegra210_i2s.c                     |  2 +-
 sound/soc/tegra/tegra210_mixer.c                   |  3 +-
 sound/soc/tegra/tegra210_mvc.c                     |  3 +-
 sound/soc/tegra/tegra210_ope.c                     |  3 +-
 sound/soc/tegra/tegra210_peq.c                     |  1 -
 sound/soc/tegra/tegra210_sfc.c                     |  1 -
 sound/soc/tegra/tegra30_i2s.c                      |  1 -
 sound/soc/tegra/tegra_asoc_machine.c               |  1 -
 sound/soc/tegra/tegra_audio_graph_card.c           |  2 +-
 sound/soc/ti/davinci-evm.c                         |  7 +---
 sound/soc/ti/davinci-mcasp.c                       |  9 ++---
 sound/soc/ti/omap-dmic.c                           |  2 +-
 sound/soc/ti/omap-mcbsp.c                          | 10 ++---
 sound/soc/ti/omap-mcpdm.c                          |  2 +-
 162 files changed, 205 insertions(+), 390 deletions(-)
---
base-commit: c9f2baaa18b5ea8f006a2b3a616da9597c71d15e
change-id: 20231003-dt-asoc-header-cleanups-87f2cf5a2205

Best regards,
-- 
Rob Herring <robh@kernel.org>

