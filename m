Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883B82BC4F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 09:18:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C041AEBE;
	Fri, 12 Jan 2024 09:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C041AEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705047514;
	bh=E1dUab4UoVx05PuZL3+mpvpdgBuBk7ymLDJZUxuM824=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uEasvVQbkQIZVPB6vp2d/rsWs3LsPYUtLsGpwC7NK8VcCuiQe7lrfuG6F+xCl/kF2
	 X0OA+A4I93VojrjAY0q2FIe4XIHYA4k6KqMTOxGuWH9Pk+/HChnJC0QYYZjfggOsYT
	 jIjvDxcrbni18Y7NKVUPC6YaJJFwF/SI4Re1qwR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90B06F8055C; Fri, 12 Jan 2024 09:18:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 120C3F8057E;
	Fri, 12 Jan 2024 09:18:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 879F9F80254; Fri, 12 Jan 2024 09:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A367FF8014B
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 09:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A367FF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WpCXAiHG
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso73232211fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 00:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705047471; x=1705652271;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLUoJHH9vL1bZ2GgbR3YmRRkEoCjkjm9bBOPWHQDlGA=;
        b=WpCXAiHGfSxGD5+DKVgFCSR3vJKmPgKYwJ1LjJCBWSWeLUbYrs4vdpeWJVOuDh9Qwn
         G6z1jIXm+HvSRMoiCIJEb1pvkN38tXSNLPMEa74cRBkgWjMJRYV7LPV6M8ztx3DP0Y4A
         9d61IgZFY4NMAvE+U3YsldE2fsc55CjSL/0v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705047471; x=1705652271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLUoJHH9vL1bZ2GgbR3YmRRkEoCjkjm9bBOPWHQDlGA=;
        b=HJfY+RBHTKqN9LjV4VLOEVP+zq9jqyd5maTjSo968NZMYHaWaqVIBSjzERTlW9Gg0V
         HIOsBWkkUWIKDvF39Qs0PKUTQuaqX/xK3I/UKu8tjG6tEWLEaf8Q2W92Q3C8bWrj9Nd7
         VnNcUD1ZtYPFwbGu6uae0/e1XfvHuPTR+nXYbkl0q2G+o3qWDM76Kk4Cz0lSngUNpGN/
         LcJv9V5E9y542vQLy1tGg29ooLQyLgea4G86X5jQS7wtGjU8XpprFOPldZTiMhUgjmvx
         xtM71UsuLrIyfsAPjsY6G9uG0NQz6eJE3qYMsYVNUkPR4yHG6KArSMJiNVx7d9efM6MC
         0byg==
X-Gm-Message-State: AOJu0YwP1MvBqZ04OlAOaznW8ii/ZF2GKIKbPjq8QhEEDNy/dRc7QXgl
	5ClvtCo+hbjKkKfipWiULOhoTMOkun32JWDXIGIXkwMq2OkN
X-Google-Smtp-Source: 
 AGHT+IFnPq0abOqgKKGI/Lb7ZpqZ+iFRv9oNGRxuG8trKPUudrojUe1vsbrgqwS0pyK/Y0QND6YXPHJynUU7wm90eOs=
X-Received: by 2002:a2e:8346:0:b0:2cc:e9de:3905 with SMTP id
 l6-20020a2e8346000000b002cce9de3905mr412718ljh.68.1705047471044; Fri, 12 Jan
 2024 00:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
 <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jan 2024 16:17:40 +0800
Message-ID: 
 <CAGXv+5Grq8XrpP9yssduXtetxWBb3PB1z7O6rvvaW=CcSPB8Dg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use
 devm_snd_soc_register_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, ribalda@chromium.org, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AQVDBTQCYLLCLYMTCAXQEZS7XRAC6K5T
X-Message-ID-Hash: AQVDBTQCYLLCLYMTCAXQEZS7XRAC6K5T
X-MailFrom: wenst@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQVDBTQCYLLCLYMTCAXQEZS7XRAC6K5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 11, 2024 at 6:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function devm_snd_soc_register_component() allocates a new struct
> snd_soc_component, adds components and initializes them; since this
> is also devm, it automatically unregisters components and frees
> memory upon destruction.
>
> That's exactly what we're doing in the probe function of this driver:
> switch to that function instead, allowing to remove the last goto and
> to discard the .remove_new() callback for this driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 58 +++-------------------
>  1 file changed, 8 insertions(+), 50 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/media=
tek/mt8173/mt8173-afe-pcm.c
> index ea611730de9c..b887e10635fe 100644
> --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> @@ -1129,72 +1129,31 @@ static int mt8173_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>         afe->runtime_resume =3D mt8173_afe_runtime_resume;
>         afe->runtime_suspend =3D mt8173_afe_runtime_suspend;
>
> -       ret =3D devm_snd_soc_register_component(&pdev->dev,
> -                                        &mtk_afe_pcm_platform,
> -                                        NULL, 0);
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_=
platform, NULL, 0);
>         if (ret)
>                 return ret;
>
> -       comp_pcm =3D devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERN=
EL);
> -       if (!comp_pcm)
> -               return -ENOMEM;
> -
> -       ret =3D snd_soc_component_initialize(comp_pcm,
> -                                          &mt8173_afe_pcm_dai_component,
> -                                          &pdev->dev);
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_p=
cm_dai_component,
> +                                             mt8173_afe_pcm_dais,
> +                                             ARRAY_SIZE(mt8173_afe_pcm_d=
ais));
>         if (ret)
>                 return ret;
>
> -#ifdef CONFIG_DEBUG_FS
> -       comp_pcm->debugfs_prefix =3D "pcm";
> -#endif

To match existing behavior, can you move this to the component driver?
In snd_soc_component_initialize(), component->debugfs_prefix will take
component_driver->debugfs_prefix as default if it is not set.

Same for the HDMI component.

ChenYu

> -
> -       ret =3D snd_soc_add_component(comp_pcm,
> -                                   mt8173_afe_pcm_dais,
> -                                   ARRAY_SIZE(mt8173_afe_pcm_dais));
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_h=
dmi_dai_component,
> +                                             mt8173_afe_hdmi_dais,
> +                                             ARRAY_SIZE(mt8173_afe_hdmi_=
dais));
>         if (ret)
>                 return ret;
>
> -       comp_hdmi =3D devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KE=
RNEL);
> -       if (!comp_hdmi) {
> -               ret =3D -ENOMEM;
> -               goto err_cleanup_components;
> -       }
> -
> -       ret =3D snd_soc_component_initialize(comp_hdmi,
> -                                          &mt8173_afe_hdmi_dai_component=
,
> -                                          &pdev->dev);
> -       if (ret)
> -               goto err_cleanup_components;
> -
> -#ifdef CONFIG_DEBUG_FS
> -       comp_hdmi->debugfs_prefix =3D "hdmi";
> -#endif
> -
> -       ret =3D snd_soc_add_component(comp_hdmi,
> -                                   mt8173_afe_hdmi_dais,
> -                                   ARRAY_SIZE(mt8173_afe_hdmi_dais));
> -       if (ret)
> -               goto err_cleanup_components;
> -
>         ret =3D devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler=
,
>                                0, "Afe_ISR_Handle", (void *)afe);
>         if (ret) {
>                 dev_err(afe->dev, "could not request_irq\n");
> -               goto err_cleanup_components;
> +               return ret;
>         }
>
>         dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
>         return 0;
> -
> -err_cleanup_components:
> -       snd_soc_unregister_component(&pdev->dev);
> -       return ret;
> -}
> -
> -static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
> -{
> -       snd_soc_unregister_component(&pdev->dev);
>  }
>
>  static const struct of_device_id mt8173_afe_pcm_dt_match[] =3D {
> @@ -1215,7 +1174,6 @@ static struct platform_driver mt8173_afe_pcm_driver=
 =3D {
>                    .pm =3D &mt8173_afe_pm_ops,
>         },
>         .probe =3D mt8173_afe_pcm_dev_probe,
> -       .remove_new =3D mt8173_afe_pcm_dev_remove,
>  };
>
>  module_platform_driver(mt8173_afe_pcm_driver);
> --
> 2.43.0
>
>
