Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D007B9B97
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19898826;
	Thu,  5 Oct 2023 09:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19898826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492516;
	bh=KjJoUPZD8S3SwhAQcLnQJUCXJQjKXFjDaYw3mETGzIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OwdBXIoMI7Gulq15dUgK6fUCOcVz3fO6CJ+R+7d+UHsHmMX9w2oue8Q9Mkncu9DuM
	 nGX3nT4xxIspVOAjtYdLWbx6d1Uc9wX3qetObDGOKbd6vDlAh4KTMg8Hi9UxJWbp+q
	 vLVcppqWME9LhQ8rWAmmRTpGAahYU01ITAL0QC4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47505F80602; Thu,  5 Oct 2023 09:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5390F80602;
	Thu,  5 Oct 2023 09:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF659F8047D; Tue,  3 Oct 2023 22:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C1D3F80130
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 22:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C1D3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iMT7ld3w
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40666aa674fso13934595e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696365972; x=1696970772;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6Lqo6EXcJhqD7YAD47SfErx0K73IWhi7QqvFI+/oWo=;
        b=iMT7ld3wWx72pITMu9cV4ILQPUMXH4Eco99w1vqLm/f9eTMaQatg9k5VX+PRnzsQD0
         yCQIAexsnFhHY2Mq7paIJdoCF1WgszhiOLT5R83BESYG+0D88n14/IKd4YwZdTnjr95t
         rvM06Giy2C+BXMKYmAzNBk+s2fYvt4pm7XVrHlvImNAbKc+Qiyh+0CgoMtQZR7aVHSNp
         gMu5r6fvdB4hyzweqKChnoYFfVypYkeavVnHuIGZMf7tN/WaoxX19dqnzwWMNx6IQYUO
         hjyg0ArMWfq5hHeGqIGxZ3860PBfuHJ9HMJOpzuTVusV1RdONQzcIsUwidShYJQUKumX
         /IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696365972; x=1696970772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6Lqo6EXcJhqD7YAD47SfErx0K73IWhi7QqvFI+/oWo=;
        b=NRTWRMGCVN0+zhCI7N6BOFt/Jx5KN5gzw7f2zZd/i3Pyk9Twtj1RR/Aai5eYq7Z5sk
         8YpQjAx9MRvm3K8LZaos1z9ti7T93jLasv8eqr9aLTaRHnbGcRK8olIVoWCenCSZYJC1
         C6mfpOOKTLlDVuUbZUu4ybCROrcDelzXVhJmaTsLdLic81B4RIHZ84QO0boHym70qM9J
         0r1WNrJr+DnvBcYN5MGL1m1UJrq7I9uBPQ5oiUdxeJwwa9ye1ETg58yYvs6h7LB3HH2x
         JDF/JkLE0L48552JCDCPqEKasY2S4lPPTX3rfYsulPJiQVAYiYzXgdVJS+w+oFRQS8S4
         HcbQ==
X-Gm-Message-State: AOJu0Yyr/MeKZY/O/O3BDpA3Lf0CMw6NSaq93a7V7oZtAr1swSTK62Mt
	LYOmCictM3t5B7bUemUppz4=
X-Google-Smtp-Source: 
 AGHT+IFlB2I0tpfgMNGi5Et2M0Gs5p8+TB82XqkW3yDkZZneS8tvsZaesKCYyvaz/7o0dmUQWRFB8A==
X-Received: by 2002:a05:600c:220d:b0:406:5301:317c with SMTP id
 z13-20020a05600c220d00b004065301317cmr478470wml.6.1696365972052;
        Tue, 03 Oct 2023 13:46:12 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id
 l15-20020a1c790f000000b00404719b05b5sm6983wme.27.2023.10.03.13.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 13:46:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH RESEND 1/5] ASoC: Explicitly include correct DT includes
Date: Tue, 03 Oct 2023 22:46:08 +0200
Message-ID: <2157599.irdbgypaU6@jernej-laptop>
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-1-05b5d6447e5a@kernel.org>
References: 
 <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
 <20231003-dt-asoc-header-cleanups-v1-1-05b5d6447e5a@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZK6PCQO74ZE57EZJADSWHUNB5R5KC5BM
X-Message-ID-Hash: ZK6PCQO74ZE57EZJADSWHUNB5R5KC5BM
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:51:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZK6PCQO74ZE57EZJADSWHUNB5R5KC5BM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne torek, 03. oktober 2023 ob 20:13:10 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  sound/soc/atmel/atmel_wm8904.c                             | 1 -
>  sound/soc/atmel/mchp-i2s-mcc.c                             | 2 +-
>  sound/soc/atmel/tse850-pcm5142.c                           | 1 -
>  sound/soc/bcm/cygnus-ssp.c                                 | 2 +-
>  sound/soc/codecs/adau1701.c                                | 1 -
>  sound/soc/codecs/adau1977-spi.c                            | 1 -
>  sound/soc/codecs/ak4104.c                                  | 2 +-
>  sound/soc/codecs/ak4118.c                                  | 2 +-
>  sound/soc/codecs/ak4375.c                                  | 2 +-
>  sound/soc/codecs/ak4458.c                                  | 2 +-
>  sound/soc/codecs/ak4613.c                                  | 2 +-
>  sound/soc/codecs/ak4642.c                                  | 2 +-
>  sound/soc/codecs/ak5558.c                                  | 2 +-
>  sound/soc/codecs/cs35l32.c                                 | 2 +-
>  sound/soc/codecs/cs35l33.c                                 | 2 --
>  sound/soc/codecs/cs35l34.c                                 | 2 +-
>  sound/soc/codecs/cs35l35.c                                 | 3 +--
>  sound/soc/codecs/cs35l36.c                                 | 3 +--
>  sound/soc/codecs/cs35l41-i2c.c                             | 2 +-
>  sound/soc/codecs/cs35l41.c                                 | 1 -
>  sound/soc/codecs/cs4270.c                                  | 2 +-
>  sound/soc/codecs/cs42l42.c                                 | 1 -
>  sound/soc/codecs/cs42l56.c                                 | 2 +-
>  sound/soc/codecs/cs42xx8-i2c.c                             | 2 +-
>  sound/soc/codecs/cs43130.c                                 | 3 +--
>  sound/soc/codecs/cs4349.c                                  | 2 +-
>  sound/soc/codecs/da7213.c                                  | 2 +-
>  sound/soc/codecs/da7219.c                                  | 2 +-
>  sound/soc/codecs/da9055.c                                  | 1 -
>  sound/soc/codecs/es8328.c                                  | 1 -
>  sound/soc/codecs/gtm601.c                                  | 2 +-
>  sound/soc/codecs/lpass-macro-common.c                      | 2 +-
>  sound/soc/codecs/mt6351.c                                  | 2 +-
>  sound/soc/codecs/mt6358.c                                  | 2 +-
>  sound/soc/codecs/mt6359-accdet.c                           | 4 ----
>  sound/soc/codecs/mt6359.c                                  | 2 +-
>  sound/soc/codecs/nau8540.c                                 | 2 +-
>  sound/soc/codecs/pcm1681.c                                 | 2 --
>  sound/soc/codecs/rt715.c                                   | 2 --
>  sound/soc/codecs/sgtl5000.c                                | 2 +-
>  sound/soc/codecs/sma1303.c                                 | 2 +-
>  sound/soc/codecs/sta32x.c                                  | 3 +--
>  sound/soc/codecs/sta350.c                                  | 3 +--
>  sound/soc/codecs/tas571x.c                                 | 2 +-
>  sound/soc/codecs/uda1334.c                                 | 2 +-
>  sound/soc/codecs/wm8510.c                                  | 2 +-
>  sound/soc/codecs/wm8523.c                                  | 2 +-
>  sound/soc/codecs/wm8524.c                                  | 2 +-
>  sound/soc/codecs/wm8580.c                                  | 2 +-
>  sound/soc/codecs/wm8711.c                                  | 2 +-
>  sound/soc/codecs/wm8728.c                                  | 2 +-
>  sound/soc/codecs/wm8731-i2c.c                              | 2 +-
>  sound/soc/codecs/wm8731-spi.c                              | 2 +-
>  sound/soc/codecs/wm8737.c                                  | 2 +-
>  sound/soc/codecs/wm8741.c                                  | 2 +-
>  sound/soc/codecs/wm8750.c                                  | 2 +-
>  sound/soc/codecs/wm8753.c                                  | 2 +-
>  sound/soc/codecs/wm8770.c                                  | 2 +-
>  sound/soc/codecs/wm8776.c                                  | 2 +-
>  sound/soc/codecs/wm8804.c                                  | 1 -
>  sound/soc/fsl/efika-audio-fabric.c                         | 4 ++--
>  sound/soc/fsl/fsl_aud2htx.c                                | 3 +--
>  sound/soc/fsl/fsl_mqs.c                                    | 2 +-
>  sound/soc/fsl/fsl_rpmsg.c                                  | 3 +--
>  sound/soc/fsl/fsl_sai.c                                    | 3 +--
>  sound/soc/fsl/fsl_spdif.c                                  | 4 +---
>  sound/soc/fsl/imx-audmux.c                                 | 1 -
>  sound/soc/fsl/imx-card.c                                   | 3 +--
>  sound/soc/fsl/imx-rpmsg.c                                  | 3 ++-
>  sound/soc/fsl/mpc5200_dma.c                                | 4 ++--
>  sound/soc/fsl/mpc5200_psc_ac97.c                           | 3 +--
>  sound/soc/fsl/mpc5200_psc_i2s.c                            | 3 +--
>  sound/soc/fsl/mpc8610_hpcd.c                               | 2 +-
>  sound/soc/fsl/p1022_ds.c                                   | 2 +-
>  sound/soc/fsl/p1022_rdk.c                                  | 2 +-
>  sound/soc/fsl/pcm030-audio-fabric.c                        | 3 +--
>  sound/soc/generic/audio-graph-card.c                       | 2 --
>  sound/soc/generic/audio-graph-card2.c                      | 2 --
>  sound/soc/generic/simple-card.c                            | 2 +-
>  sound/soc/generic/test-component.c                         | 2 +-
>  sound/soc/mediatek/mt2701/mt2701-afe-pcm.c                 | 2 --
>  sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 2 +-
>  sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 2 +-
>  sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c  | 2 +-
>  sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c   | 2 +-
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c                  | 2 +-
>  sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 2 +-
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 2 +-
>  sound/soc/mxs/mxs-saif.c                                   | 1 -
>  sound/soc/mxs/mxs-sgtl5000.c                               | 1 -
>  sound/soc/qcom/apq8096.c                                   | 2 +-
>  sound/soc/qcom/qdsp6/q6apm-dai.c                           | 2 +-
>  sound/soc/qcom/qdsp6/q6asm-dai.c                           | 2 +-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c                  | 1 -
>  sound/soc/qcom/qdsp6/q6routing.c                           | 3 +--
>  sound/soc/qcom/sc7180.c                                    | 2 +-
>  sound/soc/qcom/sc7280.c                                    | 2 +-
>  sound/soc/qcom/sc8280xp.c                                  | 2 +-
>  sound/soc/qcom/sdm845.c                                    | 2 +-
>  sound/soc/qcom/sm8250.c                                    | 2 +-
>  sound/soc/rockchip/rockchip_i2s_tdm.c                      | 4 +---
>  sound/soc/rockchip/rockchip_max98090.c                     | 3 +--
>  sound/soc/rockchip/rockchip_pdm.c                          | 1 -
>  sound/soc/samsung/aries_wm8994.c                           | 1 -
>  sound/soc/samsung/arndale.c                                | 2 +-
>  sound/soc/samsung/i2s.c                                    | 2 --
>  sound/soc/samsung/midas_wm1811.c                           | 2 --
>  sound/soc/samsung/odroid.c                                 | 1 -
>  sound/soc/samsung/smdk_wm8994.c                            | 1 -
>  sound/soc/samsung/snow.c                                   | 1 -
>  sound/soc/sh/fsi.c                                         | 1 -
>  sound/soc/sh/rcar/core.c                                   | 1 +
>  sound/soc/sh/rcar/rsnd.h                                   | 4 +---
>  sound/soc/sh/rcar/src.c                                    | 1 +
>  sound/soc/sh/rcar/ssi.c                                    | 2 ++
>  sound/soc/sh/rz-ssi.c                                      | 1 -
>  sound/soc/sunxi/sun4i-codec.c                              | 4 ----
>  sound/soc/sunxi/sun4i-i2s.c                                | 2 +-
>  sound/soc/sunxi/sun4i-spdif.c                              | 3 +--
>  sound/soc/sunxi/sun50i-codec-analog.c                      | 3 +--
>  sound/soc/sunxi/sun50i-dmic.c                              | 2 +-
>  sound/soc/sunxi/sun8i-codec-analog.c                       | 1 -
>  sound/soc/sunxi/sun8i-codec.c                              | 2 +-

For sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  sound/soc/tegra/tegra186_asrc.c                            | 3 +--
>  sound/soc/tegra/tegra186_dspk.c                            | 2 +-
>  sound/soc/tegra/tegra20_spdif.c                            | 2 +-
>  sound/soc/tegra/tegra210_adx.c                             | 3 +--
>  sound/soc/tegra/tegra210_amx.c                             | 3 +--
>  sound/soc/tegra/tegra210_dmic.c                            | 2 +-
>  sound/soc/tegra/tegra210_i2s.c                             | 2 +-
>  sound/soc/tegra/tegra210_mixer.c                           | 3 +--
>  sound/soc/tegra/tegra210_mvc.c                             | 3 +--
>  sound/soc/tegra/tegra210_ope.c                             | 3 +--
>  sound/soc/tegra/tegra210_peq.c                             | 1 -
>  sound/soc/tegra/tegra210_sfc.c                             | 1 -
>  sound/soc/tegra/tegra30_i2s.c                              | 1 -
>  sound/soc/tegra/tegra_asoc_machine.c                       | 1 -
>  sound/soc/tegra/tegra_audio_graph_card.c                   | 2 +-
>  sound/soc/ti/omap-dmic.c                                   | 2 +-
>  sound/soc/ti/omap-mcpdm.c                                  | 2 +-
>  140 files changed, 109 insertions(+), 181 deletions(-)



