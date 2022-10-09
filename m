Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1E5F89A3
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8C6166C;
	Sun,  9 Oct 2022 08:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8C6166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296362;
	bh=6l9WlQxy5Fdmo6xajeZ744h3gfGY1km0TlD/0OQBP/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/Q8GTVkR3FqS7T/hKK3Xm0RCum+2rvZkUExxBZMfUN2qx8uiEu+V2R+vA8mm5sn6
	 6/oxZ605k3hRZz2l122eYlSg8Nved4iM21BU602d94SUIArBg5ss6WdsEOB7bBEG7Z
	 FF6ZoJYBTEmcx1lKu/t3X8Ac+r9/ZcSSGPTwsyhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FB0FF8052D;
	Sun,  9 Oct 2022 08:18:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37EFEF80256; Sun,  9 Oct 2022 08:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF579F80256
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF579F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vnn3OC5a"
Received: by mail-lj1-x22c.google.com with SMTP id f9so10009757ljk.12
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i4xfQIyuSmS7q/zccFt7uuXnpmr0dTN+JLFy1qBP9+Q=;
 b=Vnn3OC5a+mBIFdJXtXSfziRoydRuVChhA33DdoMnFHX0DViEwCcwPSdpt/1gVJSal+
 mBsdNBle9TetrxuuLfCxKd0pDzV1xBDiYmblUiUyRmLEYhyb9gODDpnRNSQpmp7ae7A5
 ReMDI/3VB4odYyBAbX/78NFsBy/wqhPSZBnXlO+3dtVBSDE+oeuoB266nLgnQ1lO9YLR
 q8sjQHmlc4TaoBuRFneYVZDLIMgtS6atuTXiKSLSPH6YlGtcUia6tWTlvd5TKs96y6fL
 thGeokKYXBuL0U6QCyLkXxNijT2/cdGsZjOUzEw6ZQmqwFsJGjYAQwU4aq/48KndbgKc
 fMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i4xfQIyuSmS7q/zccFt7uuXnpmr0dTN+JLFy1qBP9+Q=;
 b=K3NdkJaJBckT6FjiJwwbcbzTKHgfbA9/+bE1ui6oTJx6oByepqQW+e+UAT34H40kU1
 LGnlwrqLUJHiDAeQB1d79b+HhLHHiem31NDzBwai7tIK4lvEmmGqlsG6XpKAOkttcrMk
 MJNc14RKTG+DfidGrStQkAOoUO8wjXEhtWnzBzapLzwdh55aPwqR8b6W21D/tZuXndQs
 h1OA4az3PSNZ/g/Ds/kPs3JK5QTn+tQBaId1B31TIdYqxieqzFVZj40l8oFYgpuDbZPm
 1YXMjShg5oWH9nrMTcjiKh3qnMWaKxwKABAPLsABJdlg14UbBlMGAXagZ5OgklwpXltR
 oPKw==
X-Gm-Message-State: ACrzQf1ifCJIcuwWz2C5AWuoBuX+idjcUmJCBBRZC41aLKOIe3oOa4Gl
 yFdUNm3Vn8B4lGnuggM5VxqwImk/AzEcMXJypsg=
X-Google-Smtp-Source: AMsMyM6vOS0rpU4QAxo6gdqNHlV/KsQBH4SrBvGhQVncrsdlz6ri/aA09LrNxwK1tQwAGXy1BJkpVNIygl7ySBczrgQ=
X-Received: by 2002:a2e:a1c8:0:b0:261:e4e5:1cc3 with SMTP id
 c8-20020a2ea1c8000000b00261e4e51cc3mr4852152ljm.248.1665296300917; Sat, 08
 Oct 2022 23:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-5-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-5-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:18:09 +0800
Message-ID: <CAA+D8AMtPhW_sXhF3BBHwkKW-hvZevH7xn9RxZb3N1Zrd2jmog@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] ASoC: imx-pcm-rpmsg: Multi-channel support for
 sound card based on rpmsg
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

> Some sound card based on rpmsg may support multi-channel. The number of
> channels can be sent to Cortex-M in rpmsg for process.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 3157cd5a837e..2f310994f7ee 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct
> snd_soc_component *component,
>                 msg->s_msg.param.channels = RPMSG_CH_STEREO;
>                 break;
>         default:
> -               ret = -EINVAL;
> +               msg->s_msg.param.channels = params_channels(params);
>                 break;
>         }
>
> --
> 2.25.1
>
>
