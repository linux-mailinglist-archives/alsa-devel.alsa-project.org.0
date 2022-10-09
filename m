Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 758425F89A7
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D55167E;
	Sun,  9 Oct 2022 08:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D55167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296471;
	bh=lQhcXdQmbTDrRmcZ2RcLxQN94pQURosaxI6eV+nnE/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CF4+tjJFp0+gwXeo4Z5bM2p6pCPBQO+DGYXYtA7t0bUAwGXUybT7/8D4pHD4B87nt
	 1YDfOCTecheT7gOmRHuVNxFZvL2lY1f870YUChlk4B/17eOB6IRvmia7/PXGqsT1uF
	 7ifUOpCtT7EhefNxCGKGythypT8haF7nUxsD7GtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F95F8052D;
	Sun,  9 Oct 2022 08:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A12F80517; Sun,  9 Oct 2022 08:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 771AEF804FA
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771AEF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HTs0JXol"
Received: by mail-lf1-x134.google.com with SMTP id bu25so12531442lfb.3
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CYVzGBZakWG9d944sIFmE1Um+lw85LRPOYMdx05jQf0=;
 b=HTs0JXolMOFf1NCo7bSwEKMRc5FQjFbYrlESC1Me81oA31Q0IN4P2YOHdSd3WH1wcq
 6MAXkyCyJbKdIBzlgzlX9PJFrv7q/ecDL7eBG+7/d7ZKOio5/Oe6W6BxarXqmT0drNOq
 6OsrQy7Q9oCETG4sNQfBG60OaEwmaEMEihgShHMrNWZ+iY2V5RW7AjvZTL7TnDuutDWS
 0bXBBsnZiso8NqB9jF3dbYEKA5SQ5TSgQNESNxT9YcOKMx2xcSU5DERT21q1muqLH5em
 ynsGQ0+3Y4SwKDS7DCA5aXdIJ0Byon4LcJj5WxMOFQaVoX++48n8QVS/gMeuQIyYZqRo
 4Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYVzGBZakWG9d944sIFmE1Um+lw85LRPOYMdx05jQf0=;
 b=NQvbpb3bpVZQdNn2oN1txpaO0M2NhUKMT3ib2ySpzmsPiOGFtdFEjMi4mHAYKzJR7i
 SRc2CI+0NBDozPfc3yNBsDMaUDtqBw2KC6/ooIsqxW6KCwqdhaUBIL3QPq5YpI+x/iJJ
 fAJUmjouveOdQDzCgGgUy5tAe8V4CrSypig/vzX9CmP5+ffesgj6IYD2iP06xN+YwWb3
 H/Vu26hRZyvDbiRlmcVGJDYu5HGNlEQeq8vISASkfogapcsOMFJSRRWbN751Vn5hSedc
 v8aCIQi3QdDf2LB+ydY1+1s03ZDRvDNxtNSIU0f0PFxi+yPSfC8BwirjcLQWHSxyCJnG
 70Pg==
X-Gm-Message-State: ACrzQf1RczGKkr7yJ3L6TuzkrnIugyCytLXp9y5G/mI4xAV1VdIKlcmR
 jHE0GYz5VhXcErzwX5zMw0vnyuM+uY3KREMQ2ZA=
X-Google-Smtp-Source: AMsMyM43EKQc0A3gEi6Srb+0JZUb2qESuXVFgLo4VX4Ys0e9RlkHmCC5gePHFp+U5k/LBvJScniUbU6y3FQPZUYPTos=
X-Received: by 2002:a19:4350:0:b0:4a2:7523:9c6f with SMTP id
 m16-20020a194350000000b004a275239c6fmr4435771lfj.577.1665296410639; Sat, 08
 Oct 2022 23:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-8-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-8-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:19:59 +0800
Message-ID: <CAA+D8AO4_npR6Tm=Dph_E151=NFY+XjZjWth7Y8s6=v7aF+qEQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ASoC: imx-rpmsg: Assign platform driver used by
 machine driver to link with
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

> Each ASoC platform driver is named by rpmsg channel. ASoC machine
> driver can parse "fsl,rpmsg-channel-name" property to figure out which
> ASoC platform driver it should link with.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-rpmsg.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 2e117311e582..57684064c9da 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -36,6 +36,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
>         struct platform_device *rpmsg_pdev = to_platform_device(dev);
>         struct device_node *np = rpmsg_pdev->dev.of_node;
>         struct of_phandle_args args;
> +       const char *platform_name;
>         struct imx_rpmsg *data;
>         int ret = 0;
>
> @@ -81,7 +82,10 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
>         }
>
>         data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
> -       data->dai.platforms->name = IMX_PCM_DRV_NAME;
> +       if (!of_property_read_string(np, "fsl,rpmsg-channel-name",
> &platform_name))
> +               data->dai.platforms->name = platform_name;
> +       else
> +               data->dai.platforms->name = "rpmsg-audio-channel";
>         data->dai.playback_only = true;
>         data->dai.capture_only = true;
>         data->card.num_links = 1;
> --
> 2.25.1
>
>
