Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF34DA0A1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 17:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8527518A9;
	Tue, 15 Mar 2022 17:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8527518A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647363520;
	bh=Lxi8cNn+2WUItgtM6AYLH34Da9joHm50+7EfTbHyMtQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUKXXkbPrV/Ki9tzwJMGCspdhhD3KFHl780XmGaYuRCmqn/IgZYVyh+zP+xdsKdka
	 RkmadtxKIjosVHU+foLJ6kVxt2XlSwZ5/vFZ1RCuWHd6btuau59tlPT1pdmoeJ52C3
	 9suAzY5A5Q2GdCJLwm2cFLRA/xxK0U1TCBm+S6Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BF1F801F7;
	Tue, 15 Mar 2022 17:57:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31F0AF80095; Tue, 15 Mar 2022 17:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF44DF80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 17:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF44DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EtQQA78G"
Received: by mail-oo1-xc2d.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so25056157oof.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iwyi6l6mAU8+nYjyk/K7oCC0ixMS0VKyBpljmAjIxm0=;
 b=EtQQA78G9e7DaQ2Bpd2WTtbGypI1MZf7hjLWoX4nrzjd6fi5v2IY5SGEBlkou+L24u
 dKygIqkA9WrpD6R+7NPqxvFwCcj4UdOE7TTyRzItaiP0y6oT1apVV2M4KJp8KQpdetk3
 hLBaaAXh5cOaCm/33y2DLPrD/fjJ/192e1fLW94ZLEKRXgjmLUqPpCLFdFZK4aVd0avP
 YapIkT6wweXDRnGP3BijGy31W8uqrfbtJZYbqDhKU9pm4uArET+9mEJ9TBRC/4XbqyHo
 LUIO9AhepMFLbJx3Aqwe3dWbIm88glVW0mi97CRZ6nudgs9fJtmkJPljBeA+j4HBncJ5
 +FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iwyi6l6mAU8+nYjyk/K7oCC0ixMS0VKyBpljmAjIxm0=;
 b=0kpv6YwJftr0cX/zLPdywCUy84OrGaPNyqK/9mRkqFiB6Btx7ATZJuBCTliSq7ax31
 v3t9gPcVRZUEbntWMojwsqaSlOM1x7PW5NtAYluRQ+krzU8stTnMxL0j70hHdzUiUphl
 9CIXAWHBsvyOn5wSXx2KbWL//hDrsz/JhV4WRX5VazeuASDOEHjEFCABxrtWRSsG3EMB
 ziHlnyi84w17TUmbvF0q0MAOxYukkhDZpVQowO+nDM5iY/Y7RZMXZgC+bzMSlwAtqKSa
 Ijk5XkqIjk8M4U9DHeyr0HeUoLdqZlYEdSyJ3Y+XiVRctX4MMuWyhq9kLQ0/u2o0/b4M
 ZshA==
X-Gm-Message-State: AOAM532QL+W8T9k1ByXvtssu1F5trblWbPDQ/Tv54SGS0F00Ninbz18n
 5UNW24SurQLO8fwKYAeoKX47Fg==
X-Google-Smtp-Source: ABdhPJzzqNiHdVXVH0CXBoLP1udVE9MYmYPmQcCKBtA1PAprIUkgp+/UWSfjGSEtXdadUx3fdyEGxA==
X-Received: by 2002:a05:6871:60e:b0:da:b3f:2b85 with SMTP id
 w14-20020a056871060e00b000da0b3f2b85mr2048202oan.292.1647363443260; 
 Tue, 15 Mar 2022 09:57:23 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a056808020c00b002da28c240dfsm9665261oie.16.2022.03.15.09.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:57:22 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:57:20 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v11 7/7] pinctrl: qcom: Update clock voting as optional
Message-ID: <YjDFcJOA8An58iTe@builder.lan>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647359413-31662-8-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
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

On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:

> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, as these macro and dcodec GDSC switches are
> maintained as power domains and operated from lpass clock drivers.
> 

Sorry for missing your reply on my question on the previous version, I
think this sounds reasonable.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 12 +++++++++---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 0216ca1..3fc473a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -401,9 +401,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>  				     "Slew resource not provided\n");
>  
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	if (data->is_clk_optional) {
> +		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");

Dug into the clk_bulk_get() functions, and __clk_bulk_get() will print
an error telling you which clock it failed to get. So I don't think your
more generic error here doesn't add any value.

Just return ret;

> +	} else {
> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	}

Depending on your taste, you could do:

	if (data->is_clk_optional)
		ret = devm_clk_bulk_get_optional();
	else
		ret = devm_clk_bulk_get();

	if (ret)
		return ret;

>  
>  	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>  	if (ret)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> index afbac2a..3bcede6 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>  	int ngroups;
>  	const struct lpi_function *functions;
>  	int nfunctions;
> +	int is_clk_optional;

bool here please.

>  };
>  
>  int lpi_pinctrl_probe(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index d67ff25..304d8a2 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -142,6 +142,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  	.ngroups = ARRAY_SIZE(sc7280_groups),
>  	.functions = sc7280_functions,
>  	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = 1,

true

Regards,
Bjorn

>  };
>  
>  static const struct of_device_id lpi_pinctrl_of_match[] = {
> -- 
> 2.7.4
> 
