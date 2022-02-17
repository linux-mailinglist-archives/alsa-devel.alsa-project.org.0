Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164204BAA05
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 20:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E98B187D;
	Thu, 17 Feb 2022 20:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E98B187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645126947;
	bh=W4Sqnd57BvaG9V8xqJZ6rNUlDewjsV5a/YNHGjITzyY=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SO2RO6KD1mvNI6vXK7Dt7e4yGRMiC/EZwSk1wXGgUvO7eX3A09IcjdOzyWSfc74J9
	 e0cDP972ne7Qq/RsvPzu9Rceweo99dzIUuFy7G3IDSZYjuhrGVdaLbiIZALx6azBsA
	 dlOBZqeK7Tw8CrnhqGNTOnWl3i4iEgTPR+w/eWjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD58F80246;
	Thu, 17 Feb 2022 20:41:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0AFDF80240; Thu, 17 Feb 2022 20:41:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2F54F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 20:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F54F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JYLlipsv"
Received: by mail-oo1-xc2b.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so900483ooi.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 11:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=3wvP+CouT5s7ckbu1I32aqEIyb+Q3SaOSxhlymVyShY=;
 b=JYLlipsvhfV7sqXYVa9saWxp8b9zR4ENVos6xsFloI664t0SttD4jiRU6dK7Qx9iEt
 S61i1/8tNV3jUM9VR3ZG7wp64r5V9E5vQnsZaBANQYM82bvxAaQ8ox9L1jtOsfI5rKNU
 GTeaDejUOd6Xe6Z2bxX5z5J05qs9XflVLniFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=3wvP+CouT5s7ckbu1I32aqEIyb+Q3SaOSxhlymVyShY=;
 b=fZh6rSLivAk3cV3hP3TkHdSqX+ZCeUvkGM7j8g2KgIaG8IO//hwCsWfP0FM7h29EjM
 YaHLJPSM4qTDgvNjQHL/FDJpyjNflyc5OwtdMANq0aI2pjtEXuIsw2Y9I8PJB5dNejZk
 h9sLpXbXs1eo1Ipryh+PIwUvJeuhcdlTl9OJOLejuynv1JvpXU5Ht52mrVBDfs1+GBMk
 RV+H0N9jtDrRZL6vMfzJesWb6CUOsOnJPEUi5SdKdwnKv6dkKbmvefv2UrwAaHw/bxNE
 AxceBKVtZpTDobM6R9ZKIdXtgILX3i/d2ZV5jNMVLPY/rlhGQjACJPppomW6C9kXrQso
 Y7dg==
X-Gm-Message-State: AOAM531UTTHJHigs6vxB6/A4bu240qOBb8e4x3CdIGOxGnQr0wy0lDTw
 AaW7TIuHxtP54vlXsNVDWQFa1XJHzPsKatJtBWqeeQ==
X-Google-Smtp-Source: ABdhPJzxaar8ksZKNkxlbNXjnGcgtRXh0N8gzo3lIPEiGAozeBu5nup8a4c7u8qz9MRLb9V5pCHw9rvSl1uX+9jgK+s=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr1291325oos.1.1645126868547; Thu, 17 Feb
 2022 11:41:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 11:41:08 -0800
MIME-Version: 1.0
In-Reply-To: <13007276-c827-0cc4-5db1-396c5184bb35@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-5-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n504R0avU9Ybj68jxqDRH-Ya5ro0hPo5GJ=2zC6p2SZ_=g@mail.gmail.com>
 <13007276-c827-0cc4-5db1-396c5184bb35@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Feb 2022 11:41:08 -0800
Message-ID: <CAE-0n538Lhp7U=pEB_7R5EARG6LveeO=jvF+kE7HCCEXUEm-kQ@mail.gmail.com>
Subject: Re: [RESEND v13 04/10] ASoC: qcom: Add helper function to get dma
 control and lpaif handle
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-15 21:11:29)
>
> On 2/15/2022 6:40 AM, Stephen Boyd wrote:
> Thanks for your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:22)
> >> Add support function to get dma control and lpaif handle to avoid
> >> repeated code in platform driver
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> >> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> >> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> >> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/qcom/lpass-platform.c | 113 +++++++++++++++++++++++-----------------
> >>   1 file changed, 66 insertions(+), 47 deletions(-)
> >>
> >> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> >> index a44162c..5d77240 100644
> >> --- a/sound/soc/qcom/lpass-platform.c
> >> +++ b/sound/soc/qcom/lpass-platform.c
> >> @@ -177,6 +177,49 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
> >>          return 0;
> >>   }
> >>
> >> +static void __lpass_get_lpaif_handle(struct snd_pcm_substream *substream,
> > const?
> Okay. will add const to substream pointer.
> >
> >> +                                    struct snd_soc_component *component,
> > const?
> Here const is giving compilation errors in below code.

Ok

> >
> >> +                       l_id = pcm_data->dma_ch;
> >> +                       l_dmactl = drvdata->rd_dmactl;
> >> +               } else {
> >> +                       l_dmactl = drvdata->wr_dmactl;
> >> +                       l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> >> +               }
> >> +               l_map = drvdata->lpaif_map;
> >> +               break;
> >> +       case LPASS_DP_RX:
> >> +               l_id = pcm_data->dma_ch;
> >> +               l_dmactl = drvdata->hdmi_rd_dmactl;
> >> +               l_map = drvdata->hdmiif_map;
> >> +               break;
> >> +       default:
> >> +               break;
> >> +       }
> >> +       if (dmactl)
> >> +               *dmactl = l_dmactl;
> >> +       if (id)
> >> +               *id = l_id;
> >> +       if (map)
> >> +               *map = l_map;
> > Why not 'return 0' here and return -EINVAL in the default case above? Then
> > we can skip the checks for !map or !dmactl below and simply bail out if
> > it failed with an error value.
>
> Here the check is for input params. some users call for only damctl or
> only map.

Yes the check is to make sure there's a pointer to store the value into.
I get that. The users are all internal to this driver though because
the function is static. If the function returned an error because it
couldn't find something then we wouldn't have to test the resulting
pointers for success, instead we could check for a return value.
Similarly, it may be clearer to have a single get for each item and then
return a pointer from the function vs. passing it in to extract
something. It may duplicate some code but otherwise the code would be
clearer because we're getting one thing and can pass an error value
through the pointer with PTR_ERR().
