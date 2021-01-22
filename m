Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40491300759
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 16:32:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08DA1F26;
	Fri, 22 Jan 2021 16:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08DA1F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611329529;
	bh=Fpgojloro+7ODR3uWgIkpePN77JADiCxfMgzhMW7owU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stFqGoHMtO3MP1oRyh6DqK9C9T5tk7VMjqza1dmYG7B7BzMOies23nSW4DFSS773L
	 wC23EfSvz8FgR6Xfkz+Hy1eyI+MfV/tY8jtaREt7Dov9quHP6vI+vpTuU7B1pqeqw/
	 l5uEoq9C3NVtrqBBYxNlJbQRq0AN28PicwLPOwig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA2AF8019B;
	Fri, 22 Jan 2021 16:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 146B5F8016E; Fri, 22 Jan 2021 16:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFCBCF80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 16:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCBCF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CwbNrVfZ"
Received: by mail-wm1-x334.google.com with SMTP id m2so4667468wmm.1
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 07:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LV930647pP1SvbJIgtJfe/GQ7cAXZFwlra1UOU75jqY=;
 b=CwbNrVfZbiO6IfNzDO7kkL/YiCj9C10K0Qp237DEcs0eriMx4WkZe+qwFubkWS/u68
 i3iOZTXb62M9bzzdo8dThaEfd/3MHEf48rEcOGoIcpUQIKR1paZye8dnBC9bTN06lMQl
 7L1kQER09hJrubYaxx9ebFTbWWHtpG83/+TuE6jzoGD7iXvrkip+PkcDm4upBSR96Q2h
 Nu6wZPjmBQ03/NXBrSgUyOlx+q5BYHJrBqzSFsynLBrFeeDUhfm3+wE9TnyYrGH6QQc9
 LJ24hFKZaS/CiOIZFIybDDpB4MEjrKGM30Vard/j5IDO+nlB/7RMi4DOHJdTd2NaPxpU
 +l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LV930647pP1SvbJIgtJfe/GQ7cAXZFwlra1UOU75jqY=;
 b=RLr/UhSCSYDmoskXY8bl7YjaavEarUyJZp6LFX8+5bm8+d20zF085iB4JCuq0FxRg2
 V4PV3utrMXTHCC4xZwNYDqMIpZMxiHfyAlT1FBDBKxjNhfxQD1RJp7hKRTV7KDCAJ1hT
 VyTkSI89+JQ1Hzk+BdnFBXsiGYBttCqRrs8j/F9uUCv0cbaUd4SMmGisNjh2v3L/04yY
 6EChi0PEHan+CLid6Hz93MQCqRnkHuEB+0mqajgs3CMwvAj+NFmvcs8nsCkFXu6t6LoO
 VQCoGS09zHzVRw0tEV+cGk1gZ4wnd8SH5xYcc9giK75t5wlDaW1RtwWT1xurbN/Rdj/E
 454Q==
X-Gm-Message-State: AOAM531la7u9vrEaI3UL/IyEZ8MftX+RNGPdEtDd22UgNadpxw8xlIsw
 yalt2pP0AQqOzPk1GGKcfYPLSg==
X-Google-Smtp-Source: ABdhPJzuQfdWhBHcYC0rSHiPVQWHFUCoCkwb6hrtB3TWw9jyWxx5QyZIDnFmLYUebZv6IZEtOkW/1w==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr4456581wmj.151.1611329414971; 
 Fri, 22 Jan 2021 07:30:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c16sm12327087wrx.51.2021.01.22.07.30.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 07:30:14 -0800 (PST)
Subject: Re: [PATCH] drivers: slimbus: Fix word resposible -> responsible in
 slimbus.h
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, alsa-devel@alsa-project.org
References: <20210120144006.3587856-1-unixbhaskar@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b95aff6-5faa-a3fb-c30e-a17252983e9d@linaro.org>
Date: Fri, 22 Jan 2021 15:30:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210120144006.3587856-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: rdunlap@infradead.org
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



On 20/01/2021 14:40, Bhaskar Chowdhury wrote:
> s/resposible/responsible/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---



Applied thanks,

--srini
>   drivers/slimbus/slimbus.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
> index 00a7f112574b..503e2a0200f5 100644
> --- a/drivers/slimbus/slimbus.h
> +++ b/drivers/slimbus/slimbus.h
> @@ -368,7 +368,7 @@ struct slim_stream_runtime {
>    * @get_laddr: It is possible that controller needs to set fixed logical
>    *	address table and get_laddr can be used in that case so that controller
>    *	can do this assignment. Use case is when the master is on the remote
> - *	processor side, who is resposible for allocating laddr.
> + *	processor side, who is responsible for allocating laddr.
>    * @wakeup: This function pointer implements controller-specific procedure
>    *	to wake it up from clock-pause. Framework will call this to bring
>    *	the controller out of clock pause.
> --
> 2.30.0
> 
