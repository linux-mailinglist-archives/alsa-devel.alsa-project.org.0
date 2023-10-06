Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01017BC016
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 22:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07EB3100;
	Fri,  6 Oct 2023 22:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07EB3100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696623111;
	bh=hj3eOF9mJ6EK9SFtGz9S7AwgxSuLp/3tpVMFUp3mdjs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e3dvtV+R8J4Etha11O0tKf87lRpV53ruNU1bRvnzv8iC6H9UYXChk6jvHyVb43R7v
	 NP6/LlD3sDGwwvK9M/ekpinTSVQUopD7sXV34nPHbPoHd33BvldL8Toegizw7sIP2E
	 o28TETLELmadPHZd73BsDx7vi8gzw0KGkKPu+HXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDF7F8057A; Fri,  6 Oct 2023 22:10:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB5CF80580;
	Fri,  6 Oct 2023 22:10:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0AAF8058C; Fri,  6 Oct 2023 22:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48543F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 22:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48543F80166
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3ae2ec1a222so1586950b6e.2
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 13:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696622973; x=1697227773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KErA21m5/OQ8AOwXNSwDx2ZPMJkH+bkAlEkK8UsmwXU=;
        b=m/dc7NTbWlhQ/1RpMZXSj611T66jZPo/pNO2fIj5pjWyfiqAPBjXXddLMnnwnYclDk
         xDjPdKvGATko6MUUmBD5gFgsI+w/QBykC6E5McNehzk2jFo3RARR8IR0qmOsJoSGSMoW
         2P8fgXf9LQCjBJDWA0UNkFTQcQqLAIJs74Srme/qxJG+pIM8ezwqZ+2PLG+IKK7cWUJZ
         O7eD+QOSN3USapzycMO67V0W9s/LYc4YbSSMT1S3QHdDtq2e+M6B3q2HNu1QyMAbMukw
         QAAv0rqVIiupNjKEkLZNYhNyggb57GgpG7+NIKPEMi3RDDkLLcx1Pp/9oQzddafAoV9e
         WzRg==
X-Gm-Message-State: AOJu0YxRCStlPlrra7/UbGmT+F060a7JNOQKcV0vYA/Jmsk1uRBglskC
	fDmv7b8/TDWYS7VkJANnUKOuwgLIJw==
X-Google-Smtp-Source: 
 AGHT+IFRzMzSgRbTRlSzjsgcoQYZamdCf0TE5qBnvGQNYUylB5iU3Rrie8xQ2uDfKDIWaRgdzAbiSA==
X-Received: by 2002:a05:6808:2d6:b0:3a7:3988:87ee with SMTP id
 a22-20020a05680802d600b003a7398887eemr8329079oid.58.1696622973140;
        Fri, 06 Oct 2023 13:09:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 w16-20020a0568080d5000b003a99bb60815sm706613oik.22.2023.10.06.13.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:09:32 -0700 (PDT)
Received: (nullmailer pid 229122 invoked by uid 1000);
	Fri, 06 Oct 2023 20:09:30 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/5] ASoC: DT matching and header cleanups
Date: Fri, 06 Oct 2023 15:09:09 -0500
Message-Id: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVpIGUC/4WNwQ6CMBAFf8X07Jqllbbx5H8YD6Us0EgKaaHRE
 P7dwkkPxuO85M0sLFJwFNnlsLBAyUU3+AzieGC2M74lcHVmxpGLAlFAPYGJg4WOTE0BbE/Gz2M
 ErRpum9JwjiXL78pEgioYb7v893Pf53EM1LjnnrvdM3cuTkN47fVUbOv/UCoAQaCWUmqUQunrg
 4Kn/jSElm3SxD9F598inkWklJIlarSV/RKt6/oGJuoHuh0BAAA=
To: Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Rosin <peda@axentia.se>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ban Tao <fengzheng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.13-dev
Message-ID-Hash: DGYREG33B47GIF3SEBZT6GW47YMM6BF4
X-Message-ID-Hash: DGYREG33B47GIF3SEBZT6GW47YMM6BF4
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGYREG33B47GIF3SEBZT6GW47YMM6BF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

(trimmed the recipient list due to bounces on v1)

This is a series is part of ongoing clean-ups related to device 
matching and DT related implicit includes. Essentially of_device.h has 
a bunch of implicit includes and generally isn't needed any nore except 
for of_match_device(). As we also generally want to get rid of 
of_match_device() as well, I've done that so we're not updating the 
includes twice.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
- Move some include changes from patch #1 to #5 to fix build with just 
  patch #1 applied.
- Link to v2: https://lore.kernel.org/r/20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org

Changes in v2:
- Add tags
- Link to v1: https://lore.kernel.org/r/20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org
- Link to v1 resend: https://lore.kernel.org/r/20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org/

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

