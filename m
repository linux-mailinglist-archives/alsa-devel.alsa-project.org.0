Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89446245BE2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 07:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04CD51674;
	Mon, 17 Aug 2020 07:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04CD51674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597641840;
	bh=2M2JcGUhht50et0xBsZn/OrYXlAjhrc+4eNupAJBb3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NX9kiStois3E87QhP3VksjHexfkvcNrksNkELe4yTwLlOTY6+K2kln/o8FG8aFpRv
	 xjAUaeG4CE7iWmLDmUTrkVZ2mPMcZ7Kb3K6Yb9HU1oYcPRwGqXXs7GcUv/HEX0Amz6
	 FAOs53qOzrlEpW9Zg0MG15ZTdE9dgSWH1PRu4paY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C634F80255;
	Mon, 17 Aug 2020 07:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CCA3F80218; Mon, 17 Aug 2020 07:22:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7831DF800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 07:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7831DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="oAa2zF06"
Received: by mail-il1-x142.google.com with SMTP id p13so13474007ilh.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Aug 2020 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRhcb2O8AaJEz9eMxliwlOdPhMhMY6WLI2NsdKxl3ko=;
 b=oAa2zF06p04uKthFZQF2bBEkOZ+6UqD8Fz9FQN9KPkJgoTG5nWrnJWfk/NK/fBShsu
 F5mo2GaGqLxt7WlI7Xtqf8VwF/GleJYpbAm/eOn5shh4+eE8jyBihDgisQolBAN5kavD
 OA0Vb5MCyYsfn7TnTanxxPfXeJA6sufkhUjL+bEqXETQ80mITRpTtt+Thb3MapnHYIGQ
 /JCP2jEscmB4IrK8LKAdKT/mcW9LJq6YEVHUYWfvzl8XatvdAWS/dD5RLA3v8V9dqMDE
 1GQNTIts546qkhRyR3m73qd4cf5XC4s1g8FKQhxpag8ukTlSRwU+PXbbWOkTBKG9DdNG
 V/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRhcb2O8AaJEz9eMxliwlOdPhMhMY6WLI2NsdKxl3ko=;
 b=cD+FYMnoaCLSNnlDp1Aqj78viWgavVK9k2U1IsoC2VTxOiap/7rvr28SZvT3TrpvjY
 puq/gPQ3Jk0YBinvLGOeJcFsD6POJLdXJzB9O01hmBWnh4BvQqPao7ZlCX6O0zqo6PaJ
 nsp1XjF6boZineBzyDXOXc4DadswXFJLha3H13mc+iudePFFSG9+/ZPxV0UZ2cvXtDLj
 a7y4yuktjF79VQuRvjF/rl4NqZuFFuK5BQM1M8sDDx6v1p+ijeOS2JCe1J33SdLVb/un
 WSXrxRrU4g+TvWqslcIieipvuWtGNILWFosOZvIUsFJPuVUizXMVEgDJ74tCZ0BxIxsq
 PRkw==
X-Gm-Message-State: AOAM532bXuoYZKzlgE8utqPOwp94LxzmNl2EJWWkpQ6kF1+/4US0Kpjz
 bJB1Ar4VjGeoqk3LOacNRWVOqb0GWBnh1gu/JTkB6Q==
X-Google-Smtp-Source: ABdhPJy14QoC914TSoUO33Pg5xyMVBeF3y5yQDrERQdKF3LGceyD4VnVKTeyYFkawCs5uqbWieDtWQWVooUUStxfbeU=
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr10091979ilc.213.1597641724059; 
 Sun, 16 Aug 2020 22:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <1597511980-16281-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597511980-16281-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597511980-16281-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 13:21:53 +0800
Message-ID: <CA+Px+wX_L3s0-m8YOwAXa1szN3v8dqaY5OYfAVJb4HLTrAt5nQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, bicycle.tasi@mediatek.com,
 eason.yen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Sun, Aug 16, 2020 at 1:20 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> +static int mt6359_platform_driver_probe(struct platform_device *pdev)
[snip]
> +
> +       return devm_snd_soc_register_component(&pdev->dev,
> +                                              &mt6359_soc_component_driver,
> +                                              mt6359_dai_driver,
> +                                              ARRAY_SIZE(mt6359_dai_driver));
> +}
> +
> +static int mt6359_platform_driver_remove(struct platform_device *pdev)
> +{
> +       struct mt6359_priv *priv = dev_get_drvdata(&pdev->dev);
> +       int ret;
> +
> +       dev_dbg(&pdev->dev, "%s(), dev name %s\n",
> +               __func__, dev_name(&pdev->dev));
> +
> +       ret = regulator_disable(priv->avdd_reg);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s(), failed to disable regulator!\n",
> +                       __func__);
> +               return ret;
> +       }
> +
> +       snd_soc_unregister_component(&pdev->dev);

You don't need to unregister the component which is already delegated to devm.
