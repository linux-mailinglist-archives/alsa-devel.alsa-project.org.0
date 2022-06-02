Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26C53B1D6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 04:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF9D1760;
	Thu,  2 Jun 2022 04:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF9D1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654138383;
	bh=UCYUWy7TFOroiMMaD3+k8wwhXkWNFku8xRYDRbCL70Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kzw3/p4LuRkR83s2NHGBT9MoPkgKT7BYfs+u9GmKQkM0GrPXtvpYiHM3USaaHM0wz
	 bCn35cNa3OB7RjvGNPwm7pjBbJ3vx9vG+lkK5CnBEMICJJHXG3SOhn9j/+hhRxfg/g
	 +sJr/H36EWXTm1pS3aigRoy61YjmFPj6s9R6+fJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B68F8025E;
	Thu,  2 Jun 2022 04:52:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26CF2F80124; Thu,  2 Jun 2022 04:52:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0C9DF80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 04:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C9DF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DLVEVzwa"
Received: by mail-lj1-x22b.google.com with SMTP id m26so3924132ljb.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 19:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TpNrFeAUHEiuJn5JqT+slz/uAK22wiMfabJQ1vnT0bM=;
 b=DLVEVzwa87pZn7j1l6lEeNeQ4lgELbwBF/l6k+A5J2pWd2zKMHwqusGX84wUNeL21l
 kBF3aI64Z8tl6v4MVsVhUMs4QOuUSEylg7huxH6jiIuwRAOG6gNnceakYL6L9VvjaYRC
 GHkY3dZ9OJfktSVKLTCQTjx3IuanijUi5YXkSfVeeLwWasVA4IWYThwiZhXjantCCe4W
 +/pfzMlSHeTV3LnemtdbIf3E5mP+HHgPhPw35a62/P/6chXu7sVPh+CJUpIWn95LeNj5
 kaH8N1dghdAEBj1l6GBLzNbcYtswK/ZvgZYQ7I9AAug1nvNcj2GbJsqcjnOYqFE0cIcj
 S/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TpNrFeAUHEiuJn5JqT+slz/uAK22wiMfabJQ1vnT0bM=;
 b=7y/7o1yXqskUjmKu+Vqmi5bjPMtGg+a3wX556x+5AQccS9EdJel6bBtncrOQXUgIif
 krnRDTv1oQUf8f6pTEEfH7E3ZsC4jgUcRi+yFymZYyiz9HWgetzjPIKiEZAeZaKK8Cad
 CdtVvCkKqt0JOS8uJvaiDX3P+3MfnaSSQobhfdviar1glJdGLFuJNMe82ei1pS52iUXi
 BUSYKe/kK/hia5UwPGmaxmhUxOGFy0eZB8TXE6KNkHrwFrnfsdCf5NLwTtqgzNfbvMws
 iH/b4NagCarOLvBxn9Q+1QNqLpPm5xGg3Swm4dY7D5CZrixCadKL53+kusjZRuuhPKZH
 UbrA==
X-Gm-Message-State: AOAM530Fnl181jmDGvD7Eur/+7fGO74CpIw0mIeBa8czoPjI59DQaCwo
 g6AD82G2QebUSQCPRzulczhmNBI+OAS32Z3Bbno=
X-Google-Smtp-Source: ABdhPJzemaRDxlsjG76/OUGceBVlHUFJwXleU0oYwHmcIUAwSqYDpFWZm5Xu0bQKxO44fiBRTnOLgCzLlVs2JIF0qQw=
X-Received: by 2002:a05:651c:1792:b0:235:1df3:7b8e with SMTP id
 bn18-20020a05651c179200b002351df37b8emr40560873ljb.464.1654138315702; Wed, 01
 Jun 2022 19:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220530083533.52254-1-zhangqilong3@huawei.com>
In-Reply-To: <20220530083533.52254-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 2 Jun 2022 10:51:44 +0800
Message-ID: <CAA+D8AMuZx0CT6GVVh5AhrAKJEFSumFPpAXkNnCdLX5FiwuFFw@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
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

On Mon, May 30, 2022 at 4:33 PM zhangqilong <zhangqilong3@huawei.com> wrote:

> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
>
> v2: add remove to put PM usage counter.


> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>

 The changelog should be in the place after "---"

Best regards
Wang shengjiu

 sound/soc/fsl/fsl_xcvr.c | 9 +++++++++
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
