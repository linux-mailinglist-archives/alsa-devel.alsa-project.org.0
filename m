Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1EE5F89A1
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F44161E;
	Sun,  9 Oct 2022 08:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F44161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296306;
	bh=tS+20m8Ynw9D1h0mdHU5p9UtCsQ4xn5oGj7+aW7ebfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2AGQJK7W0wMnlBpHtYekQebNJclXu0ytsi8q2WplJ77soVZgyJdrVI6Tzs/j9m0n
	 2O9VKeTka/jJDQy2eJ1iDJ9oQJBlsUrE/LXhzTyQd6qW2yE0obljbIilF2UlWvdw7I
	 MedGr3gAqSGVMPoY3z0izPLZ6v0lgy/sVCIJ0w7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99171F804F1;
	Sun,  9 Oct 2022 08:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD1ACF804CB; Sun,  9 Oct 2022 08:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 602F1F80137
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602F1F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NiQB3aeW"
Received: by mail-lj1-x231.google.com with SMTP id x18so1463847ljm.1
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e/EErkgAu4+sS/bcjgyuBvc1y8OiXjbSXTk2pNqKv6c=;
 b=NiQB3aeWglXaGIEIV3/i/gSogfgbbLnH7z2zhGaWVC8Ub35+EPLO4wIbZ3w2Enaa9l
 fB7UB5wJWSb36Fch45szcwQU3MZlznBhIlqnGPb0pmsam/81Ks2xHnu5zEXQnAi2qg3i
 dSsS3qLBwN2nRgQiy7WEyA/iYlzFUAe+I0+UZ5rIYslvx4yOek0t8p6ZIcwI1dcemtzD
 wCxogl78aJiSWW4JWgTgmm3LRhzhjI2VrYtJk154WvGbRaFpgo0Rqd0FK57yM6UhW1My
 M3KW0kDTX6pXCCEaK+7tvZNKYZw6O0RQP1r2DShvVSsHV70ENra54bDLdNvk4lvzUoZM
 ivDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/EErkgAu4+sS/bcjgyuBvc1y8OiXjbSXTk2pNqKv6c=;
 b=oxCYwK9NgzTqKt6irHEVBffc59uL5DjMLmCK9WSIh+PdlMnpbLfWABzCMkXxpsquTQ
 9djMhh0ZviPZPNSD6Lw6ye4xXEvJnGjC4a3yYF1uO0HiWks+fRK/3K3ZYT9m3A3yBQ74
 KCzI1jGHCyijerGeQTJPRlw/cjYPC5RLuOdbJANCM3/HdbASKOeH3Dsi78N05ZGS8kWU
 iVTpaAwn7F/0gUB3CVCebJivWpeVCNmeKW9/YAVbg3DJA2W1rTpVCR0rV/xlmWeOeuKZ
 xIlPw59NAl/BKTRMuSFaikXoHjvEwdaWe3VJBNJ0L63Y6kYNWWxCBuxYK1C9qov+CSSx
 vs1A==
X-Gm-Message-State: ACrzQf3AdnP8PxOWs3QuW0uSsde/X9fSo9tN1q5GiqwCWfNG6DGun03v
 iNZ+XTyQKs6KJPepYDCqf+zy3KSPEf2tZ17KAzo=
X-Google-Smtp-Source: AMsMyM74mW1O13BDrUgKjgucSJwkxHRRPwFOF4F1NZN8tz2anvpWrby4cMCRmLTayTpZ4+F7W/YAc9K7fmz95kyZoXI=
X-Received: by 2002:a2e:960e:0:b0:26b:e5ae:cd78 with SMTP id
 v14-20020a2e960e000000b0026be5aecd78mr4454929ljh.129.1665296241279; Sat, 08
 Oct 2022 23:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-3-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:17:09 +0800
Message-ID: <CAA+D8AO5qoPA3m8_-8jq6nYhNOSHaXimDGX3HRqrX54pbcQn3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] ASoC: imx-audio-rpmsg: Create rpmsg channel for
 MICFIL
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

> Rpmsg channel for MICFIL can also be created through rpmsg name service
> announcement. If this driver is probed, Cortex-A can access MICFIL
> which is actually controlled by Cortex-M through rpmsg channel for
> MICFIL. This driver also helps register ASoC platform device thus use
> of PLATFORM_DEVID_AUTO macro in API can automatically create device for
> each rpmsg channel.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-audio-rpmsg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-audio-rpmsg.c
> b/sound/soc/fsl/imx-audio-rpmsg.c
> index 905c3a071300..d5234ac4b09b 100644
> --- a/sound/soc/fsl/imx-audio-rpmsg.c
> +++ b/sound/soc/fsl/imx-audio-rpmsg.c
> @@ -88,7 +88,7 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device
> *rpdev)
>         /* Register platform driver for rpmsg routine */
>         data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
>                                                          IMX_PCM_DRV_NAME,
> -
> PLATFORM_DEVID_NONE,
> +
> PLATFORM_DEVID_AUTO,
>                                                          NULL, 0);
>         if (IS_ERR(data->rpmsg_pdev)) {
>                 dev_err(&rpdev->dev, "failed to register rpmsg
> platform.\n");
> @@ -110,6 +110,7 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device
> *rpdev)
>
>  static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
>         { .name = "rpmsg-audio-channel" },
> +       { .name = "rpmsg-micfil-channel" },
>         { },
>  };
>
> --
> 2.25.1
>
>
