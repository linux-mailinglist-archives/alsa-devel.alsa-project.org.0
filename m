Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D853DFE4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 05:10:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5E516A0;
	Mon,  6 Jun 2022 05:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5E516A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654485002;
	bh=83kE7u8ePokrGDHpBILLbqJh/xC8hweGnqIZnyzW+hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpUz4d6K/zC3z3J48YlchnPlcF4o3hdhUTdQh4Ti0Pu6omLgYZIbC5+yKbo9Epkby
	 6Urq7KRWp2cmmDDuGZSxxGjSFgxNzSGUOJ0AKjzOOgt3k1CISMyQyI4ULUVHDSUwor
	 nf5CqIElmYl+MiPhLTE/n/9TA87aA3c+mrvCvwZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95631F80310;
	Mon,  6 Jun 2022 05:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 900F3F801D8; Mon,  6 Jun 2022 05:09:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EACD4F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 05:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACD4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CCK6R9fY"
Received: by mail-lf1-x132.google.com with SMTP id a2so15173144lfg.5
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 20:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2x6Km6jqmzUcms9TJteVuhDuyeG5cr45Q2FwBy0BUc=;
 b=CCK6R9fYFA6FcUuhSHpVJrg7bqI1Q6u2hrGOxBQr5cCj3b+oYek9Rkz9VhsSa5hVqL
 W3IdO6AMLNyE/IsPHZEBo5+xJYifb7XniGljFIEU8ZyTe4y1zObFV2983/ilcRDfzYnM
 TFMw9bHgvY2Sv3yFGXSeIvKdMC8G0wl8MAnfpYJrzx6jSsyPR7iZkp+C7uP8mYmUTMMN
 5klo/sEoo0vDpy+0krLD7QXWJljBaBUhpr/9DSMR6A5lkeMej1BNTPhE8YZMrcjud2bP
 +YI9cvVMWjA4ZWijXH8KArha7QoQjTSOWll/1I19qlusHOREB/QxWlwa1Jro9jII3DTE
 vd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2x6Km6jqmzUcms9TJteVuhDuyeG5cr45Q2FwBy0BUc=;
 b=pU20RvRaf2u8eeC6647X/28cdS3zhEKepCwCqy+uRJkROpBl7BZpNybeG5sghFqnWp
 4EiK4LifrLBTRm3l0lsvIibRYmIMV3VkynNWX40V9N+HkaqRJe4Q80kGGcWDek7mg+GK
 ZOLw7pFfKGUPvCUWa3ODKpcLkV1N7sva8jg7Viblqe6xknN1VUqy4Kc0dL5XUPCmNOPR
 SsPFbxSLcZ8lrnTjA8eVDP958NPiLM3ObMo8DxRXyLsN0Y79OeLOqn4iUIa4fYtZqP6Y
 JE2KiSKNz7Q5e23EhZQBKzFc9MY0sK2exMvEvXM4X+ycZLtFUqZSQnROWaakMOVSwhD+
 1irQ==
X-Gm-Message-State: AOAM530yjVz/y02+CfFtZOK7Zoyyl9FlEYhWypKOe6ixjIdzBIBmVyLs
 lux/KiMi91eDxrIY7sCe9xKhZoWlpR96PaYIvaw=
X-Google-Smtp-Source: ABdhPJyxIQkRNb/4Awsg9fDOiczn7ze05jH4883awHV7OMNsYV0FAJjOMfHcUI2NJvEU9biFnXSg0O8yCFq0KKTarDw=
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id
 p25-20020a056512139900b004489f0bbf4fmr13663742lfa.67.1654484931130; Sun, 05
 Jun 2022 20:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220602072024.33236-1-zhangqilong3@huawei.com>
In-Reply-To: <20220602072024.33236-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:08:39 +0800
Message-ID: <CAA+D8APj13+dJwTaaNLtJqjiNSmJDCpE7yfReingZYAuXHVOtw@mail.gmail.com>
Subject: Re: [PATCH V4] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
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

On Thu, Jun 2, 2022 at 3:18 PM zhangqilong <zhangqilong3@huawei.com> wrote:

> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
>
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
> v2:
> - Add remove to put PM usage counter.
>
> v3:
> - Modify the commit message.
> ---
>  sound/soc/fsl/fsl_xcvr.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index d0556c79fdb1..55e640cba87d 100644
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
> @@ -1242,6 +1244,12 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>         return ret;
>  }
>
> +static int fsl_xcvr_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
>  static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
>  {
>         struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> @@ -1370,6 +1378,7 @@ static struct platform_driver fsl_xcvr_driver = {
>                 .pm = &fsl_xcvr_pm_ops,
>                 .of_match_table = fsl_xcvr_dt_ids,
>         },
> +       .remove = fsl_xcvr_remove,
>  };
>  module_platform_driver(fsl_xcvr_driver);
>
> --
> 2.31.1
>
>
