Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D987522C45B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71E5116A8;
	Fri, 24 Jul 2020 13:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71E5116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589916;
	bh=wJ/8CCV/8/OS/6gNL3izPmJcRw7z/5qyCxVGSjg+OMI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3WyM0HYQoodYdacMTTDCTRV0lV1FF2b5cQqBiSdHaCxA4CakGsRsMNIMVfITCexI
	 X7UPHQhKC2mbOdBJOY/l8CQ4eU30M4ezopjocR1h8lR08GCkRzXpA0TDVhuy0bBQvF
	 58e+ZVnXBHbub3hWKLRK8quJfTKAx85uFmIr92SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DC8F802DF;
	Fri, 24 Jul 2020 13:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85A7F802DD; Fri, 24 Jul 2020 13:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9915F802DB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9915F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KrRpNFDp"
Received: by mail-wm1-x342.google.com with SMTP id x5so7072745wmi.2
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GazPbHUQLsK8S7tpuO7AvOa0IiPz4pR+J44UaDqobHk=;
 b=KrRpNFDpBZHHWPx0ETVhUqNHKnHacZ6r/gaay6WB7CS6mzqX5jorQsoiNCm9OqQcBl
 vn7wpZGL/D2B4UwfH2LgfbjDEIh7Foz8/z7K/TCE6wAMpanMQOmDw+QkdhqmRS4bzNle
 397s4Y+2q+fZhfj4/arSsxnViNt3HFGoVURr7YnynB++Exs/V9T5Tek+q7K/nfV3Uo0F
 Y8m5px4KvbjmZVv3FS+mpGRsSnyoDcg3r4eBpmGyTV5SqGYyNS8Lfg3vaQf+D+6KAS3f
 buZh9+8VeBnzqjOX9hyKTU/xIRqpDcsGFzwik6zJAJ/Vj27bgN2Fy/SOHZMyxzNnmtDq
 82dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GazPbHUQLsK8S7tpuO7AvOa0IiPz4pR+J44UaDqobHk=;
 b=KiQPyd5wheMbPGcTY7Aj3vUBsB/qodpeqSHNB6qEpce/IIThldi8jUGnSlK9Pes3lD
 acqDtsntTCcMWHlRnlUGaVpUkVPb+IRNoHqTxK92f8u5UZUW0H8q/myRZHfIZv41Ti9E
 0ovS0gg364UNA3Rbgq6OZveDg0FUrpAFbfED3vCsxe7fJva2vQTICDThkz+lBfnbsGH/
 G4gNuSki3l17W+B7uuBFjKYdDZS1sns6aEwJrcvVgntaRRIvfST+tZOVAX/2UIaCEQk1
 bQv4fUPPg/UMHUve2E3bNniliEW4CA4CrIaWaR86U5HF0RzQJYUjRNuNe/zgmqVxK4Yh
 SJiw==
X-Gm-Message-State: AOAM533RVTLBjR+yLJb4S2I9icrh/bHeUGMAgIV5Jt26bxmI8uMAVV6g
 uOu5swI+s2FMawFcJFsPsA2wag==
X-Google-Smtp-Source: ABdhPJzuISAaEC6wI6jIFPRKdMJneQLwLQbmOnvS88iKf9FErm/LSyy4iq1BlJvn6CgSM6jT0oW0fA==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr7724232wmi.120.1595589728701; 
 Fri, 24 Jul 2020 04:22:08 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id y20sm6394145wmi.8.2020.07.24.04.22.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 04:22:08 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] ASoC: qcom: lpass-cpu: Use platform_get_resource
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-11-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c0789d98-599a-6b67-ac42-9083a6c251f3@linaro.org>
Date: Fri, 24 Jul 2020 12:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-11-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 22/07/2020 11:31, Rohit kumar wrote:
> platform_get_resource_byname() is used when there
> is list of reg entries. As lpass-cpu node has only
> one reg entry, use platform_get_resource() instead.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 5d84f63..1ee6d8b 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> 
