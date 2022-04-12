Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA54FE0C4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 14:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D8517B7;
	Tue, 12 Apr 2022 14:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D8517B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649767719;
	bh=bKf/m+iL7XSe2/hlNMPIITDeaugxg3/497YSX4CFjUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EU3x6onNSceEEhElPxVC7s3ILPtj26TrZktjGA3o6ONa+rQWal19ZDjcRR4Q1qjzz
	 ME81AlHZCdRALeczL+OWCpOOfC1xMPeWKbDXpVvytXBUIEZeExrSpEbNLGB/e7G+04
	 Z80cmggTjTfgkGbfuTHpdwa7dyveyYnKSKGSsJuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FCEF80109;
	Tue, 12 Apr 2022 14:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E2C8F80154; Tue, 12 Apr 2022 14:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F582F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 14:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F582F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dq9qCWRi"
Received: by mail-qv1-xf29.google.com with SMTP id e22so15993640qvf.9
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uf26CSHYkOwDOB1S0eT0on3rfsA2SjwMHNO70E9q4Js=;
 b=Dq9qCWRiRMN4ZEqYz8M2dm2clZzXHRuZqiiISLpIpoDvZRvHyjtag0GBlxFyJQSVHX
 mVnLr2hMYFKjOyIsTz/6wZHRDgaNcKYj5JCHhL7SXy4RxSk47Y7GvJeLDlfMkiRjVgCx
 q4k1gl0YUPkRfBSIv8UsOzJq45wOMu1nO4IRCN+xviMhVgkxiBIKrY05OFQ0acA0EhlO
 lwSj2P6Tucc4KcEvOKcUWfelPojX9saLs7eIkAj+u2f/KDk9gzt20gHYExhPzOUXmmKq
 qFs+nFcIHs6JzGeDAdLmGodUoqqBXauvYlf+BFm6fxNA8fd4Atw0jcoHyNf0O7Mj+Xdn
 NczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uf26CSHYkOwDOB1S0eT0on3rfsA2SjwMHNO70E9q4Js=;
 b=kpT90TCmydu+YzdP28n44amoOsWvhpLpehY6MODVgvqs2BxdWyrkiX5Z+dTF17zBhn
 FDocSneMTTDqERQqG72W1u/dm9VCvMy6ZkDyJXM79x9+WMbmxbORdUdMArYA33xSbIW+
 RCGVf/HW6LkIfKYiortlgNtmm/plyVkeVcrIv/iA9qpeW+7kz6dtK3VZYLyqtjYAApiC
 2VSHewp4HbofmycMimvYOmQuBPgiYoiAXiinbWl2SyTNEKhgL2VXcZYn3aJGmJX2h6ae
 Z0f31J5d+qf9ZZ3mmpWaSxGogVLkqdL91IKZ+XzE7W4CAnx/uKws54uuhzWLA6U/qnAN
 zelg==
X-Gm-Message-State: AOAM533wyIXb0EAssleMbb6dUyFgp1jew0OwccH1zOpD3m5gNCBjsC7v
 +JCjphGmZWeyXPWi9AvMuMWNrjkGIwtfTo3fB2Q=
X-Google-Smtp-Source: ABdhPJxnM7Wj2F53tbYjAgDmzH+nyL1exL8AJ/2RdnJ8VCCrQfgFGN5WFA/IuZe11jsUiH/VqA4JvKlaGkzczYdlHSM=
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id
 kc18-20020a056214411200b0044107208434mr31667346qvb.23.1649767647528; Tue, 12
 Apr 2022 05:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 12 Apr 2022 20:47:16 +0800
Message-ID: <CAA+D8APHhp9esL-vVMvYQL+m2mPbUrW=i=bGbgTWMO2Fj8AcZw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
To: cgel.zte@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Zeal Robot <zealci@zte.com.cn>,
 Liam Girdwood <lgirdwood@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 12, 2022 at 4:30 PM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_esai.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ed444e8f1d6b..1a2bdf8e76f0 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device
> *pdev)
>                         goto err_pm_disable;
>         }
>
> -       ret = pm_runtime_get_sync(&pdev->dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
>                 goto err_pm_get_sync;
> -       }
>
>         ret = fsl_esai_hw_init(esai_priv);
>         if (ret)
> --
> 2.25.1
>
>
