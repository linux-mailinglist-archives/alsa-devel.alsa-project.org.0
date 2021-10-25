Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA243966B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43A216D4;
	Mon, 25 Oct 2021 14:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43A216D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635165294;
	bh=r8r8uwAvSIs3ai6nMKWFAD8r9KsbcrEGzcl8wn9wHwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XRWH0+sgIN+XdcrJfD6+NPoafSXnBL5gsk5vY67ptM3bU7bKX6ySCu0sOvKS/nX29
	 y4XwZrsWXcMsR+eL8VPivg3MZMNWpswJ715NXuAnoTAYruw2yavspgLc3q9YkLKUo1
	 g5FJNfoW2WhURO8S7hAVaL0Yy07c7oKlRtTDWTJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B8AF80086;
	Mon, 25 Oct 2021 14:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12A12F8025A; Mon, 25 Oct 2021 14:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 765F6F80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765F6F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D2VZv76o"
Received: by mail-wr1-x431.google.com with SMTP id p14so6582746wrd.10
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GcqNwgbpALEleawoCDqJ8DV36bSI5oY7wMbzHi6pVQA=;
 b=D2VZv76oiAMXVz29+xnbVbS6G7rBVqxOCZK2qgshACCZVR5fVUqYG3ZtcyIKcESOnv
 6OUsmXeQfooFkr+f+XEjx8Nc0mvgNs/76zDP9JPDm4crSRhtm5PFUeORiQAR1nUEN6Sy
 +W1j/DHNt0I+PEK2CiwPPhN1tKH9rlq+hxnKznIltmCht9MhhNaZVXCexc3UmGiPDCzh
 eOBOnRhmySJtPJ7SDrQp+NUj3iYc43pov4fhPIR9oERDn2ilIKN1O0J1Kt7VzjZDNGdJ
 kEo1EHBZB8HeR2pqE0LdpZAqO7PKrDxc8Rj3BIf5u1nQrQwIM1Xfw8p4ZUEVei5rUdGa
 fZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GcqNwgbpALEleawoCDqJ8DV36bSI5oY7wMbzHi6pVQA=;
 b=1KIiOHLzhn5OrSBpQ6V8y/t5CMyGP1K2Kf9i31mWivhfiN4hfPC4imp/3Ms1y8o3qT
 6IrY8MbxCTyB5v/o0Z3LN39KqL4pTEF27/fWTAi6x+1yE2KDxByjvgwlQlSHx+oqLF3/
 tqGphbX4BAwnFqwvFcU9mrHP3C8i+Mk8nQQdY8RS3MZmoKvmXC2n/LK9RkxkHYTeXiWV
 pVrpz9O4ZrdiLLyKIfi9+LENi5tnyqxK1j1DEruMgoKo21jub1nMUYJ76gWFFqeK3sSz
 TUAW83uwc1p+X/I4tFG5sVl0CMOIHbLGBzDWur+H2VgGi5CUapYIOhlAwGBsa0/WoZcA
 5g+A==
X-Gm-Message-State: AOAM530yRAGcT+04BSjaRBcfK9ikpPu2X76KL6F0avPk/aRpLbrxT4f7
 ryw1w+jI/7biKE7CIf4eagyMuWStFcrj+g==
X-Google-Smtp-Source: ABdhPJy739wQBEMe34IC7otn7ek+zurrez4eqQ3guDAFRkRAdFLmYS5xoxq6Pmpgy08IXwpd8JNt9g==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr20512397wrn.38.1635165202726; 
 Mon, 25 Oct 2021 05:33:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id m2sm18724077wml.15.2021.10.25.05.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:33:22 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: common: Respect status = "disabled" on DAI
 link nodes
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20211025105503.49444-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5eccec01-c8d3-32ea-e789-bba560736580@linaro.org>
Date: Mon, 25 Oct 2021 13:33:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025105503.49444-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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



On 25/10/2021 11:55, Stephan Gerhold wrote:
> At the moment, the DAI link nodes in the device tree always have to be
> specified completely in each device tree. However, the available
> interfaces (e.g. Primary/Secondary/Tertiary/Quaternary MI2S) are common
> for all devices of a SoC, so the majority of the definitions can be
> placed in a common device tree include to reduce boilerplate.
> 
> Make it possible to define such stubs in device tree includes by
> respecting the "status" property for the DAI link nodes. This is
> a trivial change that just requires switching to the _available_
> OF functions that check the "status" property additionally. >
> This allows defining a stub like:
> 
> 	sound_dai_quaternary: dai-link-quaternary {
> 		link-name = "Quaternary MI2S";
> 		status = "disabled"; /* Needs extra codec configuration */
> 		cpu {
> 			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
> 		};
> 		platform {
> 			sound-dai = <&q6routing>;
> 		};
> 	};
> 
> where the codec would be filled in by the device-specific device tree.
> 
> For existing device trees this change does not make any difference.
> A missing "status" property is treated like status = "okay".

> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
>   sound/soc/qcom/common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 09af00700700..2e1c618f7529 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -44,7 +44,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>   		return ret;
>   
>   	/* Populate links */
> -	num_links = of_get_child_count(dev->of_node);
> +	num_links = of_get_available_child_count(dev->of_node);
>   
>   	/* Allocate the DAI link array */
>   	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
> @@ -54,7 +54,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>   	card->num_links = num_links;
>   	link = card->dai_link;
>   
> -	for_each_child_of_node(dev->of_node, np) {
> +	for_each_available_child_of_node(dev->of_node, np) {
>   		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
>   		if (!dlc) {
>   			ret = -ENOMEM;
> 
