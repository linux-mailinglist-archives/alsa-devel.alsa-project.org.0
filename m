Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02A4B5FCD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 02:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209521856;
	Tue, 15 Feb 2022 02:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209521856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644887216;
	bh=qYK0ndQ1gcCzWd/vdocdLUPyJVpNeFBvjq2pahK91VA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EbbUoI1npDmvmLAgPnDiIQyZh+xZbxzavgqHh8fDI0V+mSoR0NSihyiGUPhFj/bNK
	 IgCHOL26jtlzBLjU1+Wm6SnX3ugPoCAgFK1KiCbqdcv8bMyTUmmIYFc7EL4l6HxJVw
	 dy1NaOMWNbVB1sIP7iBQxQsvh91HdcJnZj7IzNIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A87F80430;
	Tue, 15 Feb 2022 02:05:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE5FF80310; Tue, 15 Feb 2022 02:05:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B4CF800C0
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 02:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B4CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="S/NpqL9/"
Received: by mail-ot1-x32c.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso12726580otv.13
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RgimEFXarng+CHJGO74owebgIrlsqSjainYTmRZCU0k=;
 b=S/NpqL9/qAIdkV/WGVMxj+X9fr42dFGU/nVFDcntxJriCJu2R236PSnfzJLMvfHkJQ
 GHesSnaYC1+XSqwVlvff8Xz1DyEr6bh2eNgKCL3hSPPuKOArzF4kLlt+gO8CtqrtGfAc
 3gMh4sbT3GZIwl/oth65y3m2W+4cnY0z7jiOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RgimEFXarng+CHJGO74owebgIrlsqSjainYTmRZCU0k=;
 b=p8eS9Niqgjxw3XFE9msUsUxMy35R/L5pQXefFjYM0eMVH0q2WHF7xpexlWGTqTCIYu
 kgeGodMQdgO/EU8H2zpphaP59R35zkRPosyuWuA92u3/rK+Ir9N/8QSOIXZgz5xj9DKT
 yFyW58Q6PG94IcKttZ5Cd5hKZYrasJWJpe2uWw6ydtbM1KVepO2BKDoTeNAB7HngP8zn
 Y7+86dBUBXK4YpfE1f3SbK/RGtQ+jek2PQ7d7Megu+Zqn1UDTlAUx/tCBy7tDqDM2Oge
 krYa1KxQlcBMZtHsPE4g+CcxtqAbMzNsxkANfMZYq7GTSc49gZGFo8m92oHr//2GhBO6
 HOBQ==
X-Gm-Message-State: AOAM530SEi7n6YdHDCmL0oLB28Ud/Z0qxl4b6lwIXKlF44ZJSZ9TcdFQ
 hnQLhOsLFOv2gFFxmkhPc3LGIpIZ8rS8AgHIdmUn8Q==
X-Google-Smtp-Source: ABdhPJxWDJ5gPlokWpJThKiJIS8Wv5ZL9BFOQR+6R8559UBoAOYOBJZXG6u3ikHTU/ctiT8pWDQh6Rj/RgnLjyYnxGk=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id
 y15mr585565oti.77.1644887140462; 
 Mon, 14 Feb 2022 17:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:05:40 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-4-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 14 Feb 2022 17:05:39 -0800
Message-ID: <CAE-0n53dXfwsJ=mh7cNH6Lq0Um+h+oTJDvqsXALh8L=wfONLjw@mail.gmail.com>
Subject: Re: [RESEND v13 03/10] ASoC: qcom: lpass: Add dma fields for codec
 dma lpass interface
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:21)
> Add lpass interface memebers to support audio path over codec dma.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/lpass.h | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index f0d21cd..7cc3763 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -234,12 +294,66 @@ struct lpass_variant {
>         struct reg_field wrdma_enable;
>         struct reg_field wrdma_dyncclk;
>
> +       /*CDC RXTX RD_DMA */

Please add space after /*

> +       struct reg_field rxtx_rdma_intf;
> +       struct reg_field rxtx_rdma_bursten;
> +       struct reg_field rxtx_rdma_wpscnt;
> +       struct reg_field rxtx_rdma_fifowm;
> +       struct reg_field rxtx_rdma_enable;
> +       struct reg_field rxtx_rdma_dyncclk;
> +       struct reg_field rxtx_rdma_burst8;
> +       struct reg_field rxtx_rdma_burst16;
> +       struct reg_field rxtx_rdma_dynburst;
> +       struct reg_field rxtx_rdma_codec_enable;
> +       struct reg_field rxtx_rdma_codec_pack;
> +       struct reg_field rxtx_rdma_codec_intf;
> +       struct reg_field rxtx_rdma_codec_fs_sel;
> +       struct reg_field rxtx_rdma_codec_ch;
> +       struct reg_field rxtx_rdma_codec_fs_delay;
> +
> +       /*CDC RXTX WR_DMA */

Same

> +       struct reg_field rxtx_wrdma_intf;
> +       struct reg_field rxtx_wrdma_bursten;
> +       struct reg_field rxtx_wrdma_wpscnt;
> +       struct reg_field rxtx_wrdma_fifowm;
> +       struct reg_field rxtx_wrdma_enable;
> +       struct reg_field rxtx_wrdma_dyncclk;
> +       struct reg_field rxtx_wrdma_burst8;
> +       struct reg_field rxtx_wrdma_burst16;
> +       struct reg_field rxtx_wrdma_dynburst;
> +       struct reg_field rxtx_wrdma_codec_enable;
> +       struct reg_field rxtx_wrdma_codec_pack;
> +       struct reg_field rxtx_wrdma_codec_intf;
> +       struct reg_field rxtx_wrdma_codec_fs_sel;
> +       struct reg_field rxtx_wrdma_codec_ch;
> +       struct reg_field rxtx_wrdma_codec_fs_delay;
> +
> +       /*CDC VA WR_DMA */
> +       struct reg_field va_wrdma_intf;
> +       struct reg_field va_wrdma_bursten;
> +       struct reg_field va_wrdma_wpscnt;
> +       struct reg_field va_wrdma_fifowm;
> +       struct reg_field va_wrdma_enable;
> +       struct reg_field va_wrdma_dyncclk;
> +       struct reg_field va_wrdma_burst8;
> +       struct reg_field va_wrdma_burst16;
> +       struct reg_field va_wrdma_dynburst;
> +       struct reg_field va_wrdma_codec_enable;
> +       struct reg_field va_wrdma_codec_pack;
> +       struct reg_field va_wrdma_codec_intf;
> +       struct reg_field va_wrdma_codec_fs_sel;
> +       struct reg_field va_wrdma_codec_ch;
> +       struct reg_field va_wrdma_codec_fs_delay;
> +
>         /**

This shouldn't have two stars as it isn't kerneldoc

>          * on SOCs like APQ8016 the channel control bits start
>          * at different offset to ipq806x
>          **/
>         u32     dmactl_audif_start;
>         u32     wrdma_channel_start;
> +       u32     rxtx_wrdma_channel_start;
> +       u32     va_wrdma_channel_start;
> +
>         /* SOC specific initialization like clocks */
>         int (*init)(struct platform_device *pdev);
>         int (*exit)(struct platform_device *pdev);
> @@ -251,10 +365,12 @@ struct lpass_variant {
>         int num_dai;
>         const char * const *dai_osr_clk_names;
>         const char * const *dai_bit_clk_names;
> +       const char * const *cdc_dma_clk_names;
>
>         /* SOC specific clocks configuration */
>         const char **clk_name;
>         int num_clks;
> +       int cdc_dma_num_clks;

Why not size_t? Negative numbers are useful here?
