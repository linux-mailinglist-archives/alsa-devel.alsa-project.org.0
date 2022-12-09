Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AB648872
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 19:28:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8D72200;
	Fri,  9 Dec 2022 19:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8D72200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670610510;
	bh=tXJu38czaRTnKWXnYEkK0LxjplLOOSSWU92cl6lVvs4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z6BPqd7p0LMsu9cWmjr8fKVHzOjaA/3h+iYmZvX+1bMwxe9dBWH9GYDHyCvI6bhV8
	 kZl7XwOoeN39cX3RUebkbyETG1dIT4pkDi81vgZuIbJcbgNCWXYjja63Xkwp1isLVW
	 BY5OBUmm/LGeGV4pvnldJlItN9yw4vGqVH+gRAu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B5BF8016E;
	Fri,  9 Dec 2022 19:27:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBFCF8022D; Fri,  9 Dec 2022 19:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C47F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 19:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C47F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=DqcJe469
Received: by mail-pj1-x1035.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9015594pjt.0
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4w6shm/Wpz6ggc4zMRhzb9FfoJ4MU+lSfUxwokG/Em0=;
 b=DqcJe4694wkG976PjUOU2TsLdZ6AqSNNqB4CDir8muiXDWFziOVnaq4bgef+IpjXW8
 BYCQq5+CHK3zagU/kQNl2fkY6yAAgIpwkoAVkUIYm/XP0BCpkFNUmrSx6WUMKNIunWS/
 1ViUlrZGecXnoABDCfXZA+HP7XhWCtki3CYVZNe/URC5mvmJsTg1fmdWfpTdQb+s30jy
 iky6uaWQ1JeV7UkhbEB9sz0HKcP5gFKiIBEMvDIBl6xuabikBdYiLwVnjo5oCpMoS1lp
 pHALstRMOaJaOjvi7AyQNg38g3aS4UMkURCioktQVwm0X3dUqcYQyWVi54s1+DtPa0IZ
 ETeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4w6shm/Wpz6ggc4zMRhzb9FfoJ4MU+lSfUxwokG/Em0=;
 b=MoZDFhc2bu93TQDkmOAr4f091XV1q16s7yxuHINIY+pSzBSk419Ygz4rmTzDEczucE
 E/1KOBJBmoDwE2crZN/0OS61RtSMItLE33eVvdrwtLT6rLhzFK02tMUbBpCt6xOf0Eq3
 zb7ExtDMu0ncuW+Wgs659pSUNMYM/Kg8ZUUfCGOTIXh8CMqjI464lVaQSGZ6eXM6YMjI
 GxpplDTH88mhE4uhzVeiLtskcVPKWwH5+IGSiyhlmD7JiD+KTIv7niMZg9+kW8dW1jc9
 pl/5CNR8vcyKAnKDGhvY74ITwgZRJVHnunMcKmx3MS3mYk3UCVDAnpUqbdX35Bi7NCHI
 FxjQ==
X-Gm-Message-State: ANoB5plWX2JtKkVhgnR441I5s+jjs27aX5gzNfgP719l5uFIYaA6ieEC
 UAl7883Xk3HRfRvq4T9B+Xj6xKQ6oqHV/7G8XIn+Eg==
X-Google-Smtp-Source: AA0mqf52WgiM//CGJflKjihIpmk/MVk3JEVMl+QooKQ81VQl/XzLSTIwuVjhLP1uqMx5c86DO4csqdVJSz8AjkOnz1M=
X-Received: by 2002:a17:90b:290:b0:219:2b00:8d23 with SMTP id
 az16-20020a17090b029000b002192b008d23mr57659625pjb.167.1670610446237; Fri, 09
 Dec 2022 10:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20221209031053.8444-1-yc.hung@mediatek.com>
In-Reply-To: <20221209031053.8444-1-yc.hung@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 9 Dec 2022 10:27:14 -0800
Message-ID: <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio
 active
To: YC Hung <yc.hung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, whalechang@google.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 8, 2022 at 7:11 PM YC Hung <yc.hung@mediatek.com> wrote:
>
> In MT8195 SOF design, both DSP and audio driver would access audio
> registers. Before DSP accesses audio registers, audio power and clock
> should be enabled. DSP will hang up if DSP access audio register but
> audio power and clock are disabled. Therefore, we add audio pm runtime
> active checking before accessing audio registers in SOF BE's callback
> hw_params function to avoid this situation.
>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Acked-by: Curtis Malainey <cujomalainey@chromium.org>

> ---
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> index 61be66f47723..4682748d82be 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> @@ -633,6 +633,32 @@ static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
>         .hw_params = mt8195_rt1011_etdm_hw_params,
>  };
>
> +static int mt8195_sof_be_hw_params(struct snd_pcm_substream *substream,
> +                                  struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +       struct snd_soc_component *cmpnt_afe = NULL;
> +       struct snd_soc_pcm_runtime *runtime;
> +
> +       /* find afe component */
> +       for_each_card_rtds(rtd->card, runtime) {
> +               cmpnt_afe = snd_soc_rtdcom_lookup(runtime, AFE_PCM_NAME);
> +               if (cmpnt_afe)
> +                       break;
> +       }
> +
> +       if (cmpnt_afe && !pm_runtime_active(cmpnt_afe->dev)) {
> +               dev_err(rtd->dev, "afe pm runtime is not active!!\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_ops mt8195_sof_be_ops = {
> +       .hw_params = mt8195_sof_be_hw_params,
> +};
> +
>  static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_soc_card *card = rtd->card;
> @@ -1272,24 +1298,28 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
>                 .name = "AFE_SOF_DL2",
>                 .no_pcm = 1,
>                 .dpcm_playback = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_DL2),
>         },
>         [DAI_LINK_SOF_DL3_BE] = {
>                 .name = "AFE_SOF_DL3",
>                 .no_pcm = 1,
>                 .dpcm_playback = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_DL3),
>         },
>         [DAI_LINK_SOF_UL4_BE] = {
>                 .name = "AFE_SOF_UL4",
>                 .no_pcm = 1,
>                 .dpcm_capture = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_UL4),
>         },
>         [DAI_LINK_SOF_UL5_BE] = {
>                 .name = "AFE_SOF_UL5",
>                 .no_pcm = 1,
>                 .dpcm_capture = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_UL5),
>         },
>  };
> --
> 2.18.0
>
