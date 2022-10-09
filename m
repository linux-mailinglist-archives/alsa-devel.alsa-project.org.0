Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 917265F89A4
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0385B1652;
	Sun,  9 Oct 2022 08:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0385B1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296406;
	bh=gyGDswWqcjEzrIAKStPaxvbWGmF3T/lQuGf2ZT7P0vQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLGFO9GDw2WObPc3lfuG+CMIZJ6/DVrULB5rXE/xYdbK0gm6Lw7E3+ZRYsyO12rkC
	 lmnawfKG3IzwV7aZLVlDzrhqhPlEs6ygByiTn9yffjFBA7K2kJybUDGb6J+2rgTcYL
	 lDgAyw6duILcJbOUgewMNdVOgGq4yrGkwutCffJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7020F8052E;
	Sun,  9 Oct 2022 08:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45799F800B8; Sun,  9 Oct 2022 08:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04D64F800B8
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D64F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PPyhE01b"
Received: by mail-lf1-x130.google.com with SMTP id g1so12479474lfu.12
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FwFtbnuHXctfwVd3JKQNg+pvdLuGE81h0Vad0SlZEM8=;
 b=PPyhE01bnzN0uGGFHXvZs8G49heZgoCMbrpmPh6O9CBwul7F+CG8MU28S0rMtx4viR
 +VW4N4zfwg4wUkLdxghB41OUAaSc+zy28EIkzuft3Z/rSYqnasvExxrWgcWGS4VVTMfk
 3gkl62gGMq740AjC48/I3ggs9tWUv7nbbEVH0nLWnJhWWkczYWCHcTAcY0p0KUW0hD3U
 ILE5K1UyvxakJahOdLObdXWBRvQaN63JDkuqLOuZ8fM4Dlab0N28ayLREFFvLZLK/2HZ
 IiEZF0iBiD3g5U8slIJXXa7wKQ5F0XUpUiwia5ErCzv2TNg5P5opGEMdeCGPc/t34cqp
 GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FwFtbnuHXctfwVd3JKQNg+pvdLuGE81h0Vad0SlZEM8=;
 b=NMwE10dsrg9LU1HLwoUQH42w2U2l/60IJ1cGVzyNtKjUy23o9zVE+mhAAA05gwsbPU
 6c/yC1f37XPaJJrWaz4gyxhCBvz5rtQjcmb0G4uc39TLYbhTGfIiqky6J38fAqydagfN
 48RoT2Tq/o3u+qUaMfWwQRI/Z9wlIwTc8nY4/XfoK0mRKw6cK0Xn+v63w/pojlWp+BxY
 S4P+jY2BdDht/tLuqWAAZBOGCGWIqwahXnSgGyEDt25nPCwmkxurXawQWKmZo+EzLxex
 Sw/MIRduGc+Tv2CBz5jV4w4LOA7tiQ0Ggaxy1WC/iOt99PAy7ljL+bVmBFnXcNQ8BJjX
 aVEQ==
X-Gm-Message-State: ACrzQf1g6BSj9/O1oG5U7hNg5wf2liz8cn/pgxD7shqnVvDhpBccWPz+
 y4ygrNVMXyRq8ICz6f2Vo8csLZGyoAicwAQkj1Q=
X-Google-Smtp-Source: AMsMyM4mwpBj9E5VmiZkhu50z2NUYKyEvBld8q+mnFLoSzMC2flw0ou8454LOgpGciwCmURlMc8O5kJM1wuW3bv4ZcI=
X-Received: by 2002:ac2:4d46:0:b0:4a2:473f:1fb3 with SMTP id
 6-20020ac24d46000000b004a2473f1fb3mr4163640lfp.408.1665296345775; Sat, 08 Oct
 2022 23:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-6-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-6-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:18:54 +0800
Message-ID: <CAA+D8AOUxRK7_DrCVsCXpRmri3=ejdoYakSfusmzFVaZf9B2wQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] ASoC: fsl_rpmsg: Register different ASoC machine
 devices
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 festevam@gmail.com
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

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> This driver helps register ASoC machine device thus use of
> PLATFORM_DEVID_AUTO macro in API can automatically create device for
> each sound card based on rpmsg.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index bf94838bdbef..fde3d5006ce0 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device
> *pdev)
>
>         rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
>                                                          "imx-audio-rpmsg",
> -
> PLATFORM_DEVID_NONE,
> +
> PLATFORM_DEVID_AUTO,
>                                                          NULL,
>                                                          0);
>         if (IS_ERR(rpmsg->card_pdev)) {
> --
> 2.25.1
>
>
