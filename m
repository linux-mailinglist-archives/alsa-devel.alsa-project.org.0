Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AC66388B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 06:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5513EBCB6;
	Tue, 10 Jan 2023 06:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5513EBCB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673328285;
	bh=kU5roQrRtVzEGTxOydnwMSi+aSLvWuZX7gFynICgdHA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aAJ3yPTRO3naRldF0Wq4M6Y7rBukHZO/cSgKRcRHbUEjbtavsY8/wbYMDUWF9PIHe
	 Grn/gwneULEcCl6Uc9XFHIGgZrBB5GBzkcbWnpj+TaNJHsGm8YnnLmAsRe/Vr0kbuJ
	 lmKobPbPtm2zG3WX3ESRblpD+XAR2ZOPptGHi76M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6FCF8019B;
	Tue, 10 Jan 2023 06:23:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A61A3F804C1; Tue, 10 Jan 2023 06:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B116F8019B
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 06:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B116F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AQo4r8Im
Received: by mail-wm1-x332.google.com with SMTP id ja17so7932955wmb.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FXzrl9djvHc/Ic82XNASRxbOHsnDgAYah6B0PYx+irc=;
 b=AQo4r8ImNiqB1m6s5bSFO+OKTmdU76qA69FGUdhAIkDG3bm07k3qKe+kAGEqHPuV+q
 yaJYzggp2bnoHQ+RjJX4Ppxro14aMfFseDwRLOySG6zCVbiig0C0I6SqM48OFg9RUhdd
 w/+0svrmov4Zje/xy2XEhV2LdND6yu8WdVaIzAHaYkxunt3ekF7K1LEwh9JHEdPoY36s
 WpLKCA/Js/l9V3V02WpVsInQl0xF3KzqPVCn34EQUi2wtMvN/pBg4u+QPU+hn7cUqcYv
 TmXZH1MSHS+7qesnUg4iZwld9gCSkk9NKtZ7VB6vWyKzGGZCeAJViUDjOUhf65kq3khV
 WdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXzrl9djvHc/Ic82XNASRxbOHsnDgAYah6B0PYx+irc=;
 b=mMuQPypuMEQP1eL0q7SCiwYtyH4PA+a6JiwuGjtZydxUCp9tY0+XBTpwGNotzphwQ8
 jAyqVsi9MatXDhhi4w4ZJRdqEkSBmf0HmZQI/t26y3anSl7RR0POgioNE0G5sCxrroUx
 HzFRfw5gZZ0ExLScT9JPvHXe1xLPSKxORNdGJFsFDDgddQB7WPbhcDjIwBW5dw3wLl/h
 /Z4O5/X3fOHof5FHszwPKGQbJsPUgJuxiDhjn8H3Lr1ghsHm+9XEMAelv2dAykONsEDK
 0Q+d1Rp6MLUtQtw8AnEffDr0U/Oz2UvEnYvMZxdqKOv7qCALz209hXv70GhfoXDxs+eu
 NY6g==
X-Gm-Message-State: AFqh2kr406Uf8yShZCLtcNClTs05ebfmPz4DHO0vUKSdSfZ+UNCinZJ+
 Lrh5l7pOqXCX1dveOADjXcoh6sLXdD5HkPUTuHno2aj6
X-Google-Smtp-Source: AMrXdXu1UDKUMaSonnsMmdh/62YzvCMqYdhlr+CwDs7i6VJyb/wd8QBdzjVZp7V+/jNGQ2/Rt6ypSvXXSaDKcsvOadA=
X-Received: by 2002:a05:600c:19cc:b0:3d9:fae2:ae48 with SMTP id
 u12-20020a05600c19cc00b003d9fae2ae48mr3610wmq.77.1673328219963; Mon, 09 Jan
 2023 21:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20230106-asoc-fsl-err-log-v1-1-49d845c99434@kernel.org>
In-Reply-To: <20230106-asoc-fsl-err-log-v1-1-49d845c99434@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 10 Jan 2023 13:23:28 +0800
Message-ID: <CAA+D8APbPwMcq_G5s7hGO4VO5MxU-=wkfc5cyMXXSOnPg3tLvA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Log error code when we fail to
 register
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Jan 7, 2023 at 7:13 AM Mark Brown <broonie@kernel.org> wrote:

> The chances are that any error we see here will be EPROBE_DEFER but let's
> actually tell the user so they know.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index c836848ef0a6..58834e56a278 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -855,7 +855,7 @@ static int fsl_asoc_card_probe(struct platform_device
> *pdev)
>
>         ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
>         if (ret) {
> -               dev_err_probe(&pdev->dev, ret, "snd_soc_register_card
> failed\n");
> +               dev_err_probe(&pdev->dev, ret, "snd_soc_register_card
> failed: %d\n", ret);
>                 goto asrc_fail;
>         }
>
>
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20230106-asoc-fsl-err-log-4915ba3fc6c4
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>
