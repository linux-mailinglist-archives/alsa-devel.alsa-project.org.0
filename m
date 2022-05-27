Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CD535B61
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 10:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC1D169D;
	Fri, 27 May 2022 10:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC1D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653639731;
	bh=h34ru53r/ZWIXkS2uprj7xg/DHqS14cW0qXgZmCF+4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJMjpUvyr6V/UAYnvyQJFrHEDLfML22TmNwJWL18Pe53MXZ/C4qzH3p9jelWgHxYO
	 Xnmxv58pmUKGipbZhCdLEjpYinM9b4Y6IxCN7BWl1Emh27ne2JEfWSwNh2pYc4y4We
	 yT5xgdoRdATUi7j9xGxE5up6V0NYpIoTZydiEJ2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 448C0F800D0;
	Fri, 27 May 2022 10:21:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E0B0F802DB; Fri, 27 May 2022 10:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1469F800D0
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 10:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1469F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FWKNkvb6"
Received: by mail-lj1-x234.google.com with SMTP id g12so4109113lja.3
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1bhxU9R3etbe0aMg7Elh3OdIVGpBwQKqRBhXNWuSOSc=;
 b=FWKNkvb63EkAcAUlzXUvM8I2I69XfNve9rJraEbZH5uCSgEGev1qFT2VW9fTOop6WR
 hZE2bZ7wwWB5FHkfLa67JVv0Rej1wO9lL8YuB04PA+ZFXU244nVt2GBGKWnbOUY/UdQz
 zEfyuqMiSYM9Gm4cV5OUw1a1uz1yOv90r9y6Td+00vWXYGMch6E2S4EQoMy6tgg8RGUN
 r7Q7OdcCtMmDyK2sVn5xOHJoixoMOpdxmorbcF87ECDDedQV4PKKoHu0Qio/5Vk8eDcQ
 KJCq6ZOm11FBwKyMNmOd36Bf+q2lOfjhV2ed9FohDvsbTP2bOiNjOMBwwUL3IMJ01w4v
 FKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1bhxU9R3etbe0aMg7Elh3OdIVGpBwQKqRBhXNWuSOSc=;
 b=Hk2QQ2/P0Sle9NULGU6xc5fXZl4TI9F+4ECSzTi0cUq+yINq/aNarIpO0+2dzoWUJy
 NWzTITjVWPNuiPGrDWcV5/pGN7JTkq86jRy8L0OOcMgK5MxujUJWkdmDBb5/QnXVD00l
 amkYJ+tmGiSKhEZ9z3xRbO2Q89jOK1Uif+35EXutjo0izD1CSKltOF39e7556VdVfZ0S
 nvvVIT0fm0GYMeJCE+VKS3DfELwcMEP6eK/tQYqqdON2CJuQA8/nEEIvwKmJGXF1P1Js
 NHcsG1G7Cle8nAY2NYUCD6U4Mc755YBAtxY2mDt5a3HvZ3/nunvXdn/pFq25MXk8fHin
 U3Ug==
X-Gm-Message-State: AOAM530jmwbRQH4BOOodkiVekq4oiTEoSI0TIMqE7hYDXcscHpGM/B/S
 3v/avNX4GZizKJpfbaTbnxgfY89fQi9unzgqr5k=
X-Google-Smtp-Source: ABdhPJyTHUXDwANLG6wBs8U8ygZ7Gn50fbaiJBAj1wFOlt4Q39yhMaTfZfyh6lxacwcUGmL1cS/NWxWO+5UgrcZKuEA=
X-Received: by 2002:a2e:a78f:0:b0:253:e71f:69a8 with SMTP id
 c15-20020a2ea78f000000b00253e71f69a8mr15839350ljf.432.1653639668071; Fri, 27
 May 2022 01:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526011958.139391-1-zhangqilong3@huawei.com>
In-Reply-To: <20220526011958.139391-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 May 2022 16:20:56 +0800
Message-ID: <CAA+D8AOD=u0Q7Npy0z=r02CyM9qVu+-vbqTD2nGfO95K_t-xFA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
 fsl_xcvr_probe
To: zhangqilong <zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
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

On Thu, May 26, 2022 at 9:18 AM zhangqilong <zhangqilong3@huawei.com> wrote:

> Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
>
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/fsl/fsl_xcvr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index d0556c79fdb1..907435efe121 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1228,6 +1228,7 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>          */
>         ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>         if (ret) {
> +               pm_runtime_disable(dev);
>                 dev_err(dev, "failed to pcm register\n");
>                 return ret;
>         }
> @@ -1235,6 +1236,7 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>         ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
>                                               &fsl_xcvr_dai, 1);
>         if (ret) {
> +               pm_runtime_disable(dev);
>                 dev_err(dev, "failed to register component %s\n",
>                         fsl_xcvr_comp.name);
>         }
>
> Could you please also help add remove() function and add
pm_runtime_disable()
in the remove()?
Thanks.

best regards
wang shengjiu
