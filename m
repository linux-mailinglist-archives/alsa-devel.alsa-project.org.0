Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671D197E59
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 16:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA657166E;
	Mon, 30 Mar 2020 16:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA657166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585578473;
	bh=NCgKYox8kBxzlx6WmJ7s774Zpf7UDB74LJBooOfcG/o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzkgK+LlbWGCjYppYEGtzj9omflxhOAuOChWkSGGdNKN8ZVS4Zjwp97tPcpTm5rf2
	 IoFdRFId5EhiuumE3MqA8OBHqrn2WgpyaJ79s/vGG75d6k3tK64M011Nc4Klh5jVLn
	 3dt0qiyre2Qe73KFp2jt6LYsDO3aDnI/wgA/YGn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE464F80148;
	Mon, 30 Mar 2020 16:26:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3985F80148; Mon, 30 Mar 2020 16:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C9F0F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 16:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C9F0F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v4VSpPJr"
Received: by mail-wm1-x341.google.com with SMTP id z18so20171717wmk.2
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MpBTSEwmaAqAHZkF4ilI23br9Re1qv/0BxVULiNxTeM=;
 b=v4VSpPJrlOBbvaLpBqiz01Xp7dAhnnXtV3FY8mV8gTed7STPBhsFhFWOpTx8CnLMIm
 /TntA0lWKai6wf4PgnH1ZhFdpymAR9EN+QJnMrC2NzOERh6ms/IGca3mxhSUEoAgmXfu
 1vMdcHd72FX4/Wkdm5EEQINdIYUM0SYclk5FiE2xyx/S7T6Xt3+YOgq35Z5xdgrzAHgl
 Jzg+GIxceS14Q7Ft7gC/SHLPWbSVLLFbZl5v5G4f93dGyyEkXsrAUXNXtAMwAicUWpaq
 HGskc1F7qAW+oGSu6lpXHg7HsZY603GO0QPGYCRqxzZu6kzOEthWAMiH0zImJSs5yO34
 Yx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpBTSEwmaAqAHZkF4ilI23br9Re1qv/0BxVULiNxTeM=;
 b=uQd7n8/aqkPOW1og77o6Q17hPmIF99u4QbO1Q3+5BlFqzOvBE0B2lBoVbR9iiOmpl3
 WKPcYMv1KuwsS4BdHAI7JOKagBeQHydwrCoUBhhDNWZPs0C76peOKnfn9nzjHaDWU9Av
 Uzskvn0IM06FEj2K4CQbF+KQ1lGw6rptU8Y1byTstgZDolw462UPVKYQFpigwNpv6KKR
 6uUvKqrc3OMisBFsrXSHZaIA/akIm7IPdkDDWhcjPBW5phSNkrXvxC+SGr/2yZ2XBpZk
 JzXC/8J/FqUlWktY43qWHMRDuQLVOtxnWvBJkFaQUfAUVkwKXILZZOJofiYxUgIwp+nH
 Fa4Q==
X-Gm-Message-State: ANhLgQ39L5/Ig4JbHOhXzWe5ULRClONGItyBo5UUb/JS63d82tgV72oB
 LFFla/vR5HPva3Q8RdLU2A4ZWO99nSQ=
X-Google-Smtp-Source: ADFU+vuTdnoQjJEEIhuFO3cDr41Rvn3vOSfGZ/rgR2arGk6FSeayZuf8P48DzBz528XamNqgBsCNvA==
X-Received: by 2002:a1c:41d4:: with SMTP id o203mr12953168wma.1.1585578360631; 
 Mon, 30 Mar 2020 07:26:00 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a13sm22508279wrh.80.2020.03.30.07.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Mar 2020 07:26:00 -0700 (PDT)
Subject: Re: [PATCH 0/4] ucm2: Add support to SDM845 based platforms
To: Jaroslav Kysela <perex@perex.cz>
References: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
 <41e83744-5164-7cbb-98e6-fb8504c6b44e@linaro.org>
 <8732f355-adff-3a28-34b3-a85a027f297e@perex.cz>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <37d24771-d5ff-56fc-9dcc-3590385c61ad@linaro.org>
Date: Mon, 30 Mar 2020 15:25:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8732f355-adff-3a28-34b3-a85a027f297e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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



On 30/03/2020 15:19, Jaroslav Kysela wrote:
> Dne 30. 03. 20 v 16:10 Srinivas Kandagatla napsal(a):
>> Hi Jaroslav,
>>
>> On 05/03/2020 13:44, Srinivas Kandagatla wrote:
>>> This patchset adds UCM support for WSA881x, WCD934x codec and two 
>>> platforms,
>>> DB845c DragonBoard and Lenovo YOGA C360 Laptop that use these codecs.
>>>
>>> Tested on Ubuntu 20.04 with pulseaudio 13 along with
>>> with this fix
>>>    
>>> https://github.com/pulseaudio/pulseaudio/commit/cabd387e26b5fe03661f4b894826c7c6b58d7efa 
>>>
>>>
>>
>> Are you okay to pick these ucm2 patches?
> 
> Hi,
> 
>    it seems that those changes does not pass through the ucm validator 
> (https://github.com/alsa-project/alsa-tests - python/ucm-validator 
> directory).

Thanks, I did not knew that there was an ucm-validator, I try run it and 
fix those issues before sending a pull request!

--srini

> 
>    I have also some comments, but I would probably prefer to create a 
> pull request on github to do the review for all files with history.
> 
>                  Thank you,
>                      Jaroslav
