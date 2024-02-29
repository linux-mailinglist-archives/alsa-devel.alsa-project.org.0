Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81386BF6D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 04:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28BC827;
	Thu, 29 Feb 2024 04:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28BC827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709177066;
	bh=xk46Jj9RTgh6RKQqAdSGUAO0/eL7vnDByFfZswoFJd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cX7KivNru7iwzCdlf/Jnx7P311ueBVBP5c/KPwwOuN5CZDtJ3fo7oo8igK13knPKV
	 JrfxJOQqLm7SDFOjYgINqe8/HkdtPA/103M36k1DBl5i6kNU7rQsb3NzzW+CX9KjyI
	 jpsOTmCEvucMqRvKPO8ka2EpaW/Ir0+ZsaVHSqmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B66F5F80580; Thu, 29 Feb 2024 04:23:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 357C9F8057C;
	Thu, 29 Feb 2024 04:23:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E179AF801C0; Thu, 29 Feb 2024 04:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD7ABF80088
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 04:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD7ABF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=J3Qdeb9F
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51320536bddso330093e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Feb 2024 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709177019; x=1709781819;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnhjCqHLFxHzCoP56tcAkpXqMN7ULXn2w3/bj8hdCI8=;
        b=J3Qdeb9F+OcXGQOZcSJKZ5zM/D/5t7T6QVbDhUO3KxHkjjjA0bru0dC9GzO6aajBFM
         givDzKFBKNSZCP/IvLBbhBXYa3P7mplJYEZoUSpOwG97zMrc7FdKNusePU1C02+OVp0B
         LelumkzabTXtfGTGxR+PrNmXD+LQcg6U5Rh94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177019; x=1709781819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnhjCqHLFxHzCoP56tcAkpXqMN7ULXn2w3/bj8hdCI8=;
        b=DwniOwPo8F8qVLRhnZDail35peLxu+GfG5dEJgGUSSgGl/DZ+xou/8UstEVeux/tD7
         tM3Mgtb7CugAodvAw0iV/ASXPYiuKotRF1ArysWVrcD25QfMTQzwZ9ieJmms68eZOlvV
         E0HspfL6aXzVx1wtBfSXo1F5r16Quj8oa6A9TZhMrYau3CeVqxirUi3io0hkySvuSaiU
         UtpSXkrZzun2nNbhXdZwLiDGSYjmA5xsr+reJrTLuAtzi16fhqltKf6KufGphnJ5p9+c
         aNYm0xr2XOe21SvL9wxiQuyIEt15M0Ptw3Fne6Gj6YjysM+dAADFFBtq08bCmEVM28Bj
         4Gew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEpyRg8uSxGoh04JWH2Tfvz/pNtwggGdIbpp8tAsNjjjbPaYLkY5Ltu6wL4zT3HcTu61xtMJ4ekPyvpHZXTAvfhih38aR0p8Dd6bU=
X-Gm-Message-State: AOJu0YzLh3QSVnLSHB/NV1KYjTRlQhin4uXSO7x88pnmQYR65Emm2hut
	Yxubq2Te9oRWiTYuNni+dvlbRZCfceV4iluS/N5WjJUtO27J5+voVgeZS/PCqZBzsd0EQ0peItr
	mm0xPJnjw2+l9l9T+xzuYEd7RZlTNAPh+r2l6
X-Google-Smtp-Source: 
 AGHT+IGoyjlA5d3MJxIU0XjajX2pLjnv5bjpGNpsYoZpp5aPB53ISOzz1U7B/7xmRxLHgmDVXHiCd+RpSMsLvGtFTsY=
X-Received: by 2002:a05:6512:3d04:b0:513:25b9:6cf8 with SMTP id
 d4-20020a0565123d0400b0051325b96cf8mr294868lfv.19.1709177019347; Wed, 28 Feb
 2024 19:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227120939.290143-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 11:23:28 +0800
Message-ID: 
 <CAGXv+5Edk5tCmE87DCOjVmMsiMcKeRw50=mx8=z1ZacJYd6L1Q@mail.gmail.com>
Subject: Re: [PATCH 01/22] ASoC: mediatek: mt8192-afe-pcm: Convert to
 devm_pm_runtime_enable()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org,
	shane.chien@mediatek.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DL4MFXI64SDMRJMXFNBYXAAPDH2PH33N
X-Message-ID-Hash: DL4MFXI64SDMRJMXFNBYXAAPDH2PH33N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DL4MFXI64SDMRJMXFNBYXAAPDH2PH33N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 27, 2024 at 8:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Switch from pm_runtime_enable() to devm_pm_runtime_enable(), allowing
> to remove all gotos from the probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This also fixes the unwinding order during driver unbinding.


> ---
>  sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 46 ++++++++--------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/media=
tek/mt8192/mt8192-afe-pcm.c
> index bdd1e91824d9..794419d16b01 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
> @@ -2217,21 +2217,20 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>                 return ret;
>         }
>
> -       pm_runtime_enable(&pdev->dev);
> -       if (!pm_runtime_enabled(&pdev->dev))
> -               goto err_pm_disable;
> +       ret =3D devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;
>
>         /* regmap init */
>         afe->regmap =3D syscon_node_to_regmap(dev->parent->of_node);
>         if (IS_ERR(afe->regmap)) {
>                 dev_err(dev, "could not get regmap from parent\n");
> -               ret =3D PTR_ERR(afe->regmap);
> -               goto err_pm_disable;
> +               return PTR_ERR(afe->regmap);
>         }
>         ret =3D regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_co=
nfig);
>         if (ret) {
>                 dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* enable clock for regcache get default value from hw */
> @@ -2241,7 +2240,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>         ret =3D regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_confi=
g);
>         if (ret) {
>                 dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         pm_runtime_put_sync(&pdev->dev);
> @@ -2254,10 +2253,8 @@ static int mt8192_afe_pcm_dev_probe(struct platfor=
m_device *pdev)
>         afe->memif_size =3D MT8192_MEMIF_NUM;
>         afe->memif =3D devm_kcalloc(dev, afe->memif_size, sizeof(*afe->me=
mif),
>                                   GFP_KERNEL);
> -       if (!afe->memif) {
> -               ret =3D -ENOMEM;
> -               goto err_pm_disable;
> -       }
> +       if (!afe->memif)
> +               return -ENOMEM;
>
>         for (i =3D 0; i < afe->memif_size; i++) {
>                 afe->memif[i].data =3D &memif_data[i];
> @@ -2271,26 +2268,22 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>         afe->irqs_size =3D MT8192_IRQ_NUM;
>         afe->irqs =3D devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs=
),
>                                  GFP_KERNEL);
> -       if (!afe->irqs) {
> -               ret =3D -ENOMEM;
> -               goto err_pm_disable;
> -       }
> +       if (!afe->irqs)
> +               return -ENOMEM;
>
>         for (i =3D 0; i < afe->irqs_size; i++)
>                 afe->irqs[i].irq_data =3D &irq_data[i];
>
>         /* request irq */
>         irq_id =3D platform_get_irq(pdev, 0);
> -       if (irq_id < 0) {
> -               ret =3D irq_id;
> -               goto err_pm_disable;
> -       }
> +       if (irq_id < 0)
> +               return irq_id;
>
>         ret =3D devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
>                                IRQF_TRIGGER_NONE, "asys-isr", (void *)afe=
);
>         if (ret) {
>                 dev_err(dev, "could not request_irq for Afe_ISR_Handle\n"=
);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* init sub_dais */
> @@ -2301,7 +2294,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>                 if (ret) {
>                         dev_warn(afe->dev, "dai register i %d fail, ret %=
d\n",
>                                  i, ret);
> -                       goto err_pm_disable;
> +                       return ret;
>                 }
>         }
>
> @@ -2310,7 +2303,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>         if (ret) {
>                 dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\=
n",
>                          ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* others */
> @@ -2329,7 +2322,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>                                               &mt8192_afe_component, NULL=
, 0);
>         if (ret) {
>                 dev_warn(dev, "err_platform\n");
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
> @@ -2338,15 +2331,10 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>                                               afe->num_dai_drivers);
>         if (ret) {
>                 dev_warn(dev, "err_dai_component\n");
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         return 0;
> -
> -err_pm_disable:
> -       pm_runtime_disable(&pdev->dev);
> -
> -       return ret;
>  }
>
>  static void mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
> --
> 2.44.0
>
