Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AE4B5FDF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 02:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E828187A;
	Tue, 15 Feb 2022 02:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E828187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644887604;
	bh=Csb8tXvYcVOULEiRRrelWyXGsvh/KMlU+5XdOuJ41yY=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGrDpK5W4XyliylicUX4j6FOBCKJMx6MNYkNYky3y0UHl8Lp4ofaeApGF6OfXGc6c
	 89XGXGWpYgvFoSFPcQKzgE8iYWtRZxAxAY4OpIZH7q194PtXIQmH3/4jauB4hkl73G
	 N1ds9Bqv0gcAZhvknhel2NxWPFnc7moqBbIxrDCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A94AF800D8;
	Tue, 15 Feb 2022 02:12:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BF4F8012F; Tue, 15 Feb 2022 02:12:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E193CF8012F
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 02:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E193CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Q85Iy1x0"
Received: by mail-oo1-xc2d.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so21456004ooq.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2z0HLBtdwl7RuykFNoLcrOpeQoN2RrPQlxsn50U+srI=;
 b=Q85Iy1x0nXlLnvvWd0qW9X3s9tgMAJ7AnlBSq3D89DE5VcsaJ25zy163dK52rAgG+C
 G1Rp6kBsRRKD5HB17M3DH8DPVV2g7hkKKTDgG9GLsFrH4GEKh57ytrF0L8TgjrWgWNpx
 beKuRv5pUE2ndVw+oZhC8NrzutWuu1E2niMDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2z0HLBtdwl7RuykFNoLcrOpeQoN2RrPQlxsn50U+srI=;
 b=Ky5NeBYVU+suf5iIndevZwSM2aFAUPtWugwAoxWHqhrJ/35xS6sybVWQnYmq+jhqXL
 Sm+gHiKY7kjiGhhwsba1V7OFss1vxbcFMkr7BFXuk1bcTBj/4iOzUKssVkC0MxAXpAqF
 itn47NvwAGNZPDfogoOg9HykCDEmZw7MTxjEhrkfNrbUJBPNANWnUF/boq74Mz/YT8eS
 0KWYLQ/M4i/1i3MO8vhWbuBCdrkmTI16PHOFiyDfU0l9YQcjwu+hGva5NChWJAl+kMYT
 tf9VELRg4aU1WjOBY27wHyS0A/1IWpzrL/ccbuSG+BBwbkCHEV2Ma2msW7dh9X2TV3Z+
 3TkQ==
X-Gm-Message-State: AOAM532A/AIMF/Etj0IRI85SSwlFyXYWvCU3IL7SQlY6vRZIbSf+KOso
 9G3x+BX4ThxfO3igu2FBmqyZGGlbu8WnbvqoqeVp5g==
X-Google-Smtp-Source: ABdhPJzqr0qj+6PGWqY06otbFxJxLPzm/naHHRbTzZGQw8jz3YGa4aV1SMC/JucpyLkPPx1hqwG9ibRXSdkd51IAglA=
X-Received: by 2002:a05:6870:d413:: with SMTP id
 i19mr598159oag.54.1644887528729; 
 Mon, 14 Feb 2022 17:12:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:12:08 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-6-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-6-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 14 Feb 2022 17:12:08 -0800
Message-ID: <CAE-0n53iKwT8u=d2KG5KX8fJgFs1JhTnaGCfG=OLarhvLdmf3Q@mail.gmail.com>
Subject: Re: [RESEND v13 05/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:23)
> This patch adds register definitions for codec read dma and write dma

 git grep "This patch" -- Documentation/process/

> lpass interface.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 7cc3763..e059c4a 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -39,6 +39,29 @@
>                         return -EINVAL;         \
>         } while (0)
>
> +static inline bool is_cdc_dma_port(int dai_id)
> +{
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +               return true;
> +       default:

Drop case

> +               return false;
> +       }

return false;

would be shorter.

> +}
> +
> +static inline bool is_rxtx_cdc_dma_port(int dai_id)
> +{
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               return true;
> +       default:
> +               return false;
> +       }

Same.

> +}
> +
>  struct lpaif_i2sctl {
>         struct regmap_field *loopback;
>         struct regmap_field *spken;
