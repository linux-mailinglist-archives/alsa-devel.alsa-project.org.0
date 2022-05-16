Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE252884C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 17:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06AB314E;
	Mon, 16 May 2022 17:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06AB314E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652714192;
	bh=kVdW4rYUOyTms/OaR4eWNnVI7oJaNb+BdIMXIgV4va8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pk2jUWx0i2y5Yo+WoKZtA2pC95jndHsAFHgcXCq506k+WOJylNYDDFgKXpzCVZSik
	 3gUS3TomQqfweAm1JcMR6KsBNPcie3xst3FTj0RVwbGT5t/PVmjQIEJ3v/dWvn0oiI
	 /9JxREbiM1/+a404YeORrihxMMy0wNgnZcuTsBww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55986F80171;
	Mon, 16 May 2022 17:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DE92F8014B; Mon, 16 May 2022 17:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD47F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 17:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD47F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dmfC0zUn"
Received: by mail-ot1-x32b.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so10250813otq.12
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aqUacUDD/fnqySsoi3HdJFEi/V1mTy/VfQQMnGzRza8=;
 b=dmfC0zUnM3Da4eBmHuwkOrpuYP643Dic9NsM1QhvrqzZggtptHBQDGNxfy6PdTxadp
 0WuH6KV4+gkux/NZgj8EAnr7WeIeOjpQpaTch577VWirBI7CKJsjc/eySNgOlfbTA6+O
 vfF7AJ0JYNL8acPMBsHIbylCVcn8VAYVcqKGBCjy2bbjQSmniPC7FVH0oWqXWBc1CVE0
 2E58YZqxk95IMCcPfWaPL/21THyhS7lvMivfJsDimueM5vMX0Tu4E0bb5R7nXiAnqGMG
 +SxQubBfyUDFkhNrgmoHlz90Pp0twEahIdAUh4C3BiFtparP46Mxgj1X0+UU/1PsunOs
 nE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aqUacUDD/fnqySsoi3HdJFEi/V1mTy/VfQQMnGzRza8=;
 b=niB48Q/Y0XUNSbqWPdC/0LxItpSmHem3e7gzewZDD3+JZclPtw09vmjyCH/xzArDgt
 0pzbyX5f9RAP7ocxxispy5cj5NkWrShb7TwRHLjnamE8J9J48FsJ843mQwRtzM2Q++Hq
 c5Xd1hXDVq2ulrKwQGxAPgurMAhGhGUwkyL6/VeJVzcRGdvpT+yk3/nbFDv3AIGdop4S
 Dw3adGqomaoCd0th/vFQoke9ofafDanI5AVBow0IZ0U3uomSxYo8xuAaAodwWlQ/tN4T
 pRqK2VZScrtOVPf0x0RKdrAHLvc4q2LVaexL7LLzxKsClkYBYkKssWQLZssMT6uX9zNn
 jvwg==
X-Gm-Message-State: AOAM530mzTmMDpMPS0Uh6gLjGGAzj+aw4mlS6MVtYWBKaiKET/wbOKsf
 v0hVc8+fI/Q+2Hu9q8coDlz6Jg==
X-Google-Smtp-Source: ABdhPJyxCbBtqQzZ9IoSbuL6c4zNV6p71BzBhppEUqHbNuekH9OptVw3cYCBHP8hn3HJmDptoqnELA==
X-Received: by 2002:a9d:2f65:0:b0:609:a162:388d with SMTP id
 h92-20020a9d2f65000000b00609a162388dmr325956otb.331.1652714121253; 
 Mon, 16 May 2022 08:15:21 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 23-20020a9d0317000000b006060322125asm4070722otv.42.2022.05.16.08.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:15:20 -0700 (PDT)
Date: Mon, 16 May 2022 08:17:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant data
 structure for adsp based targets
Message-ID: <YoJrGGg0RviVn2Xj@ripper>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
 <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Wed 04 May 06:56 PDT 2022, Srinivasa Rao Mandadapu wrote:

> Add compatible string and lpi pinctrl variant data structure for adsp enabled
> sc7280 platforms.

This says what the change does, but gives no clue to what this
compatible represents and why the clock is not optional.

Could you please describe here what scenario this compatible is to be
used for etc, so that when someone else adds support for the next
platform they can use the git history to understand which case to
follow.

Thanks,
Bjorn

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 2add9a4..c9e85d9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>  	LPI_FUNCTION(wsa_swr_data),
>  };
>  
> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
> +	.pins = sc7280_lpi_pins,
> +	.npins = ARRAY_SIZE(sc7280_lpi_pins),
> +	.groups = sc7280_groups,
> +	.ngroups = ARRAY_SIZE(sc7280_groups),
> +	.functions = sc7280_functions,
> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = false,
> +};
> +
>  static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  	.pins = sc7280_lpi_pins,
>  	.npins = ARRAY_SIZE(sc7280_lpi_pins),
> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>  	       .data = &sc7280_lpi_data,
>  	},
> +	{
> +		.compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> +		.data = &sc7280_adsp_lpi_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
> -- 
> 2.7.4
> 
