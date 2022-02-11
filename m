Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A34B1F82
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 08:44:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B9017FD;
	Fri, 11 Feb 2022 08:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B9017FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644565473;
	bh=g7Ug7dLxyn2Fq1ichXaivbLK5yRLWUTThKIlBpaO79c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2hOP/atWjjCaXwviTjD/nToohlSyYjhLrPbBE/a6rGiIPVCDT0iZylgwqZG3qNao
	 yelWP+SMdNHD2ZMbq0rci5ZmRnNd1X2xFFcgP0FUvUEDmQOJ6xVL5S5n1zXKovt7KU
	 VTDwBjLYtT+HOBvlIrKo1FLw8qQ0zU1M2VrjVvtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53901F8013D;
	Fri, 11 Feb 2022 08:43:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE350F80125; Fri, 11 Feb 2022 08:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A363F80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 08:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A363F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ha+F/6T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644565395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+JoBX4dv2Ujy4kHFl4q2D9yIGmIdd5volu8AUosqWE=;
 b=ha+F/6T3htbpCetzvgXWoOy/M93Uaf+bB8W3FgRmCBkuNDviial83WHWpbBOA87C9NgUbn
 OoxYcJryHfwxDraKtfPwZWINUMLIjSuScEQ9ALnPHFgUrqpmb+e/AMh7mtfSxh+EKk42vf
 b/hRlM49R9Byj5bneFUng4qiUX9psaY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Cw407PM0Otu0god3Yel5hA-1; Fri, 11 Feb 2022 02:43:12 -0500
X-MC-Unique: Cw407PM0Otu0god3Yel5hA-1
Received: by mail-ej1-f70.google.com with SMTP id
 l18-20020a1709063d3200b006a93f7d4941so3756388ejf.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 23:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q+JoBX4dv2Ujy4kHFl4q2D9yIGmIdd5volu8AUosqWE=;
 b=NJMvquDqsEiuCDYBTIlbl7MqUwy3ChvKCfyHqaU5RR2hFfKJlHPi8JPRVgmTQBVtd2
 4tfWrcqcLCC+XAnglg6Up46UV7XL5ZKe8sRKwkPwk7fGYgpH9jPuR6oQdH6lf20gCZmn
 6MShC8hHO+oSQGu7QyZVRClL85Us5mYkdb+kdl8SByTkpNFS3pbYBmJfGwBa5eRUSSxM
 OlTXL1lLSsMfZW3KPqPOT8MCmyRFAk7gVUq5cKRGbmALrcjZLqpSvPVl2OW7eJ3O05hW
 QHx+o758fYbpCi7vvOaHN3HW7Ra05yfBj5ERqEfjHLZgRMVJifwnzYFPui6hyqMcQcvc
 x2Qg==
X-Gm-Message-State: AOAM532lI3uGaCfpf1x0BQ8l+l57biDWu17WIB4BasPHEoxVHd1Pt1+j
 PdtdOC0sToCv6eVchTdpOUdYcH/kw6g68DBPrINcKQm0HdZwWeZIHW8FnMhhmo3LAv6YoN/CTll
 xmcFulzGdti8m6pVQy8+kSfA=
X-Received: by 2002:a17:906:5d14:: with SMTP id
 g20mr322474ejt.37.1644565391012; 
 Thu, 10 Feb 2022 23:43:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEfQpRtLobU4UAs4SWOVNcJDhEjOkbQmmbly0Xr2tW7hupHSA1QdZZhCzrr2fKvmPOHvfu0w==
X-Received: by 2002:a17:906:5d14:: with SMTP id
 g20mr322469ejt.37.1644565390811; 
 Thu, 10 Feb 2022 23:43:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id g15sm4632241edz.100.2022.02.10.23.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 23:43:10 -0800 (PST)
Message-ID: <d4425819-78c0-ad53-841d-fd59a59c2736@redhat.com>
Date: Fri, 11 Feb 2022 08:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/9] ASoC: Intel: bytcr_wm5102: use GFP_KERNEL
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-4-Julia.Lawall@inria.fr>
 <d26561a1-ddd4-aea0-792d-efce104ad44f@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d26561a1-ddd4-aea0-792d-efce104ad44f@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

Hi,

On 2/11/22 01:20, Pierre-Louis Bossart wrote:
> 
> 
> On 2/10/22 14:42, Julia Lawall wrote:
>> Platform_driver probe functions aren't called with locks held
>> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
>>
>> Problem found with Coccinelle.
> 
> Thanks Julia, indeed it's the only case where GFP_ATOMIC is used for
> machine drivers.
> 
> This was already present in the initial Android driver from Intel (2013)
> [1] and missed in the multiple passes to get this upstream.
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Yeah I should have caught this when I upstreamed the machine driver:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> [1]
> https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
> 
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>
>> ---
>>  sound/soc/intel/boards/bytcr_wm5102.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
>> index 504ef4cab111..8d8e96e3cd2d 100644
>> --- a/sound/soc/intel/boards/bytcr_wm5102.c
>> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
>> @@ -389,7 +389,7 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
>>  	bool sof_parent;
>>  	int ret;
>>  
>> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_ATOMIC);
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>>
> 

