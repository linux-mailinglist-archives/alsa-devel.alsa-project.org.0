Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C0468F34
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 03:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97E171FC0;
	Mon,  6 Dec 2021 03:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97E171FC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638758152;
	bh=NUxO7r6zW1dUWC1XNaNrRQjlGT5DQxt/OR7GzhBQPMM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufZG60+MVvUjo9wZOmly/LDrJFt/SRDB2VB2muKCCrk1PYFT04Lwh7I57Ogp+BUkk
	 7I8UYRzRc6M+TzS58oiUx63VLYGG8xj+rW45WJujmbP64WeBxqPZsz2zWg0+gUjx0/
	 wG7Q0bIgtDSBTqujeMEHksJt7EnyZS75rKHtr5Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02301F80259;
	Mon,  6 Dec 2021 03:34:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E41DBF80253; Mon,  6 Dec 2021 03:34:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD87F80143
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 03:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD87F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VfAmdIa7"
Received: by mail-oi1-x235.google.com with SMTP id s139so18778286oie.13
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 18:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TTlnq7Wgzp2iX6Ls4tQK0iYVNHZC93S+jeurCSfQZQg=;
 b=VfAmdIa7950nGp7sfvUgTx/o5m/K2ugSiyqUnlGAt7y3DjfeFETtbKV4biPq7ywvei
 xF4wi6g4qFXI2OGXFs1/jxnOMurxZ+YBy851oBsN4o/F8EANSHG7iCh38gtbS24QjbZy
 Nzy2IYEprxBE6EDy5RkFY7NkXf+ktsvCpSka8E93IYlrqc9Rk1O1d0Scua7R+cKL4AqY
 QLG8ZS6bn8aiYGObLtMn9siD6l92rWqVUTKb4yaMWSdUaf1sNiUGIEbvlwxiZBvT8gm9
 bGq3Wl2YdJ5eHYeelFhH9VBArjRCByGjzlSxboWtFb5QqYMgvSncbVsbVHvUMa1Aw+wS
 rV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TTlnq7Wgzp2iX6Ls4tQK0iYVNHZC93S+jeurCSfQZQg=;
 b=km52CGCui+duJVZ4UeMznj4lyi2ZbB3DbT8yjy0yivmzphbaK1uTMXt4l9Oyv55gVA
 4n6NlcUbfmSAxWvk62Mb7EPTUizrPu6En2vh3XelBDsb6GvQGkHmD21HItK2B5xsJNfJ
 nb/5Z0MCn/h+EjF6x9jKdj1f9MhUHuh7F7MXD1rYEZFu+bOF7wElCRhlTPmyIeee5qA+
 /fOwCaRU4FlJq4Day9/m8uO7gSyFRZgzOkX/KJG55lSfpji3zcl+y3pOPYck3DKra9gp
 5zkax8txPtTmhi6qUI9glG8jjwryykMz23sSNAlb7y42pWCEoPx50l6TO2H5K0LcDgp0
 w6iA==
X-Gm-Message-State: AOAM533CmjSLwD/aIvjmOy+3xdjFUq6r/cZga2Db5AmXu0Vw6ZlPyW4W
 OZMC3nAmgWIhI8ynJ2DefYkfLA==
X-Google-Smtp-Source: ABdhPJw574NkW6bD77DqAw/lwQOC13BsjPT9cNCMD5G/pLKoQYLZV9vtlJVZ+99bghWUwhxrwg+WbA==
X-Received: by 2002:a05:6808:1116:: with SMTP id
 e22mr21315983oih.45.1638758063412; 
 Sun, 05 Dec 2021 18:34:23 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p6sm1952823oof.0.2021.12.05.18.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 18:34:23 -0800 (PST)
Date: Sun, 5 Dec 2021 18:35:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
Subject: Re: [PATCH v4 4/5] pinctrl: qcom: Update clock voting as optional
Message-ID: <Ya13Bl66oS1hgHFd@ripper>
References: <1638531140-25899-1-git-send-email-srivasam@codeaurora.com>
 <1638531140-25899-5-git-send-email-srivasam@codeaurora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638531140-25899-5-git-send-email-srivasam@codeaurora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-gpio@vger.kernel.org, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
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

On Fri 03 Dec 03:32 PST 2021, Srinivasa Rao Mandadapu wrote:

> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, these are maintained as power domains and
> operated from lpass audio core cc.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index bcc12f6..c2a1110 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -394,7 +394,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>  				     "Slew resource not provided\n");
>  
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);

If some platforms requires this clock and others doesn't have one, then
please make this statement conditional on the compatible, rather than
making it optional on both.

Thanks,
Bjorn

>  	if (ret)
>  		return dev_err_probe(dev, ret, "Can't get clocks\n");
>  
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
