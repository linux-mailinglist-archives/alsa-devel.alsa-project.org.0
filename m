Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088550677B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 11:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE87A1725;
	Tue, 19 Apr 2022 11:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE87A1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650359500;
	bh=FbXeMj7sNSapIYcCX/VoUHfiudGG0sTjr+ZLxh+KghY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVKfxSMAVeKH40zOj6SvAl5kAB6lCxgKxyZPDlMmbhO+KjIuP1XkD0uruX6MX12pk
	 3shosdStq2yMo1dnHIYDGYJLEfgynXmng7Wmsz9eK5htaAdHvqfbLLsboqrvhaLGtG
	 O+aQlmkrSTU8MJ/bG9x8KixYmPaNIXC1aNQ+2No4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D283EF80269;
	Tue, 19 Apr 2022 11:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F2FF8025D; Tue, 19 Apr 2022 11:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 014F0F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 014F0F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eWXVtgZA"
Received: by mail-wr1-x429.google.com with SMTP id t1so21535892wra.4
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zF4V/xMqxOt1lzS1W7B1kHA2IPJXPFkf0vVAZ2mtUOI=;
 b=eWXVtgZA+DXI5LtnTRmFH591Bjcrb5vrHiVbW8HPi94dgBRFXPKjOSV9gyPgKRqm52
 rrVlipat7vdond408O5t4VhcN2nPQhhFcZXe2dUFhuvyC5SIV5ByxCO9LoHvOuc/A5QC
 +erFGfnay8ZaZz/QQj4Pqlm5/e0rq543/oAXGambL7Hlvh5Fj4wrl+aQ4+2kuGQhgoYE
 5KGLQALi31ZSh52U7i+orSq01/ZI18TYcR/0o5/Cd65WwNrYPzv74DG/pu07G8hi08/T
 JEu/B/VUKo8ltzPt02H7zx5SBBU7cViBqkWRJuQQrbiu6P9x3aYqHc+OwlgSjKYXvyUT
 axEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zF4V/xMqxOt1lzS1W7B1kHA2IPJXPFkf0vVAZ2mtUOI=;
 b=z/txiFkaL4dh5oX5CQ434SR8VQ/ECvghX6cqAXlIb8zyC3EQ+XD1LIBr4KlrPpnNjW
 TTiGgeeG9GXYeKEI5XBVTsKSjgmhGRs/8cO1+wYeJM1V8NMhYOL60tSJ1bJmUi7Qemwr
 KwFQpr5Vc2n76haw0YVgffEv+W4qMgVkFahFoqpkwBAliNUrPmXhRGETxexMRvkAXKqM
 tiFdHGm+vM2PE6uRcFnJjPnCo5jB/ytQbpnGghlIz+7dvlD9rXzLfgSdw7h457wDeEsU
 gZmHaccCwuf8Hup4Zf0dqCq+0hUHwy5oPTSA0WeQObd6cj+ouKgHazAJ9P9RF6GAhDP9
 XBOw==
X-Gm-Message-State: AOAM532hj+uHm3EjI6ahGuNsCB4ZNjCvAdos936gFBWh+1eqmWq2AbB2
 /m8lDDCxYEGbV9bMujNcqnZPTWALKYUp0g==
X-Google-Smtp-Source: ABdhPJz2TaXo5HkQRvMqgFpi/YCNwh6ssF0uj1RZEHz7LmaUi64xmuEniT+fhOrhuJs7L2SHUMCbgA==
X-Received: by 2002:a05:6000:15cd:b0:20a:aaf7:33e4 with SMTP id
 y13-20020a05600015cd00b0020aaaf733e4mr45876wry.406.1650359430725; 
 Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 j18-20020a05600c1c1200b0039297ba9a6dsm4659679wms.26.2022.04.19.02.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 02:10:29 -0700 (PDT)
Message-ID: <72ca1cd4-da90-9e4c-b326-46eef2e1cb58@linaro.org>
Date: Tue, 19 Apr 2022 10:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robh+dt@kernel.org,
 krzk+dt@kernel.org
References: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
 <20220418230956.3059563-2-bryan.odonoghue@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220418230956.3059563-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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



On 19/04/2022 00:09, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.

Fixes tag is missing.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


other than that it LGTM.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> ---
>   sound/soc/qcom/lpass-apq8016.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..10edc5e9c8ef 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -292,7 +292,7 @@ static struct lpass_variant apq8016_data = {
>   };
>   
>   static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
