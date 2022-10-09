Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2515F89A6
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CD11679;
	Sun,  9 Oct 2022 08:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CD11679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296442;
	bh=x9/DxC0fXYiLBRwBxeAp/2e/0wrOmNVN+bh6k6Q2Hd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWZPdWOTRZzSjCpxY0WXRtDf++gSHmP6FZZd3HKJXmOEel0qbv2b91vttrSXvrX9N
	 gwUt+Yk5Z2G7u3mKvUNd5bMNW/A5RR3P5FOn7pIIVPbpbXz7ROXPstUW01WTF4sOBs
	 zxIJA3alDrICfBw67qzSmiYoA6+Rq5wlmJUQR8fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3586EF800B8;
	Sun,  9 Oct 2022 08:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F022F804F1; Sun,  9 Oct 2022 08:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC2A7F800B8
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC2A7F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rjkq4kta"
Received: by mail-lf1-x129.google.com with SMTP id y5so12520287lfl.4
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+85/F+ow+GpPLkelISy1+QscAgeyogx8L8x1L8zwOPQ=;
 b=Rjkq4ktag46yNxR5BMWavl1XjnlHfXO/ctLe46E2T0j941HNzgvGJI4tV2Z3qrYSaN
 q1cCdt+gc/mPThO5HgYpMlEF2lh7QGTxEVFsIJsUWvTNImphLUheXq9C3I6ype1SMckV
 JDVlwxGwKLECBqy4tsdVr/J3yRXCLE9eIKELOsD4+tM4SX158NSz7F7xHA2kW/qM0+ss
 YkRkFLr+zXS7LNM31LO2hJ6I2jknhFzkUSQgerVrRdHxm7Ba7NRi/WWCiTMXXRqcsy+v
 A/tWEGM8uQERokY1zPwY6fFB5e+bqatcsrMjKRDa/P7Y6qJOC+9xxx8Eu1XEqk9cmNvn
 VKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+85/F+ow+GpPLkelISy1+QscAgeyogx8L8x1L8zwOPQ=;
 b=LutJEWmj/yUtpureti7Wz03coaVm/EPrkmtL/r+4ftZiMAOKLuwWt8rqO+DGkxfXTf
 07Z43CTAHcpgVNnNTvcPEGw6o9HqBAch9HKas/qYSyE8s34Ljv5IGvbfE/uAxqACT12q
 8SMUMY5S2f+rqzZ6DfWDJYXphyMuOSmR2SUxkOiRI92Wulzcn4Bhvq31X7r/j+iI6raw
 f8sI/DDO9OPXw/utXEk/mhpcWrkXLcqXyml7NmFHf+PbjbA3SmJSzibMFia6ozfxuhm+
 5tlQvxbPBnf74CNv/XTxVvq9Z3NIsyicUmZ7WvkE+w/u242RKF30beZsYODgLK00TJV8
 QV7g==
X-Gm-Message-State: ACrzQf1XsR9z4FC8qrWflsrD/UXxa8vci/1wXNzGkjTtTt1FMn8/Ou/b
 jw2pVTEp04gAiGARZ5WnfZvuKM83F+vB21f8mYA=
X-Google-Smtp-Source: AMsMyM6TaEIdqx/CL6Om6bzuW2SkJvwoxRCx/R8HfsuGCywVMGka23JHiJILb1pJi+8wbEIwHxw3OCzYOBY5wwj/bO8=
X-Received: by 2002:a05:6512:1093:b0:4a2:69f9:310f with SMTP id
 j19-20020a056512109300b004a269f9310fmr4677852lfg.433.1665296382913; Sat, 08
 Oct 2022 23:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-7-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-7-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:19:31 +0800
Message-ID: <CAA+D8AO=MUhrnyb3tU0p+dsPXmpbEwfKyoVohX-W5qUSCuTmCA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ASoC: fsl_rpmsg: Multi-channel support in CPU DAI
 driver
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

> Some sound card based on rpmsg may support multi-channel. This patch
> expands the maximum channels to 32.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_rpmsg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index fde3d5006ce0..46c7868a2653 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -117,14 +117,14 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
>         .playback = {
>                 .stream_name = "CPU-Playback",
>                 .channels_min = 2,
> -               .channels_max = 2,
> +               .channels_max = 32,
>                 .rates = SNDRV_PCM_RATE_KNOT,
>                 .formats = FSL_RPMSG_FORMATS,
>         },
>         .capture = {
>                 .stream_name = "CPU-Capture",
>                 .channels_min = 2,
> -               .channels_max = 2,
> +               .channels_max = 32,
>                 .rates = SNDRV_PCM_RATE_KNOT,
>                 .formats = FSL_RPMSG_FORMATS,
>         },
> --
> 2.25.1
>
>
