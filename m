Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DF32B63F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 10:40:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC02E18C7;
	Wed,  3 Mar 2021 10:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC02E18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614764401;
	bh=nWbxp0PGZXg0sSMxiUpFCeFhzl68NhXGW5hQDBWemSA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdsO/wbG0kTLcIc501P1NKFOBsUjbvWCizJv1a17LOa2chd49Xw/jiVRwuUIJKhuF
	 7Y5Jivxq5bqQKa7Bt2w5dK0F3OmJntQ2zAi0v9hhkWeGSCIjYsdGGQV5uO9VdVrydl
	 FtPG4ftzs1jcoL8tHXJpueSC9qJ+g+aevONG5ZB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64335F800B2;
	Wed,  3 Mar 2021 10:38:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C61F8025E; Wed,  3 Mar 2021 10:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC0B5F8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 10:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0B5F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RJY5xPj8"
Received: by mail-wm1-x333.google.com with SMTP id n4so5604022wmq.3
 for <alsa-devel@alsa-project.org>; Wed, 03 Mar 2021 01:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gno5LNftd5fU23GdPDJL4/R3qgxi1GRLBhAYz1fO15s=;
 b=RJY5xPj8lMMP5j7PmPVfn8jOsDGJNGDxwte/A3qscYft3Xmf5m3FN+49PUw/+opj9o
 28CoD+lQh4IPPRMWEEL4GesxuLChewgGlUoFO74kPEj0sMatwlsPQJgCgK+WB87b7XuK
 RStDnN95Emvuh0Zv4N5VTQ4mYmyaOADrNycB/x+bsrSZLqiJm1AIDXdUyNPvwa2Na083
 cd20f1bYQezlPQ/RG8Vd3O4qmeOAS1u+KYGdrjh/a4tAKj3bb6HncJEl2c/xle1OLXtq
 dl7aNHG7Jzc3EsXEJl1iC4pSlaEjdMf4Sir6IRAnoNqrXUwZnLoOMoeT7iKP9IjeMLUm
 eXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gno5LNftd5fU23GdPDJL4/R3qgxi1GRLBhAYz1fO15s=;
 b=UZnGFTzRdn7uJAMu+VmlnhTQaEpc+xb2ExjIpfI/GZh2IoB38N5E7uxEBgJrHF31Hi
 lxv38sGXEdCbDp2rzJ4Vivk11F4RIIIBiivRf6aZwKtJs5sszMtAJE1HMZcmdOqqoNw1
 kESeiHZLjquOVMcaMhMLVhIsrF6LGSIEYclxG2I4+MaK6+eg1lK9jeaZ5/hI8VJWQc6o
 Qhsz8+N2yyjAfMcVXXj3OUPhTfhNCf1sWVHVnVOosLRaYwGXv4QRpP76jiSDU5/CxmLL
 ite4HKjkgRKPoe4wqJnmbrMrF8eZTs7TRT+72c45VV/8ILGlMqkbp9yCDwevD6TJps3U
 iYdg==
X-Gm-Message-State: AOAM531lbHdY7np/jHiFNEYMb9fvaonEqGITTQYr4uAvCnVLynD97bOu
 SkMHT5C4GGTOG29/rjMmyT3ar8Wvz1NFew==
X-Google-Smtp-Source: ABdhPJy7H6SvacbZI1FFlL8zT14GA6Isd2F0lFkveXK03mL0huuRpm4RNaQ0DPKl78jybKUPtnvguw==
X-Received: by 2002:a05:600c:d1:: with SMTP id
 u17mr8486821wmm.64.1614764302566; 
 Wed, 03 Mar 2021 01:38:22 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c26sm32565672wrb.87.2021.03.03.01.38.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:38:22 -0800 (PST)
Subject: Re: [PATCH 2/3] soundwire: qcom: add auto enumeration support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
 <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
 <4721dd27-c8ce-f988-3c10-794841390656@linaro.org>
 <01e5ea33-1813-069a-1674-042141947323@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <601b585e-c3e3-4006-b078-d54c3fd36438@linaro.org>
Date: Wed, 3 Mar 2021 09:38:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <01e5ea33-1813-069a-1674-042141947323@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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



On 02/03/2021 14:34, Pierre-Louis Bossart wrote:
> 
> 
>>>> +        if (!val1 && !val2)
>>>> +            break;
>>>> +
>>>> +        addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
>>>> +            ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
>>>> +            ((u64)buf1[0] << 40);
>>>> +
>>>> +        sdw_extract_slave_id(bus, addr, &id);
>>>> +        /* Now compare with entries */
>>>> +        list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>>>> +            if (sdw_compare_devid(slave, id) == 0) {
>>>> +                u32 status = qcom_swrm_get_n_device_status(ctrl, i);
>>>> +                if (status == SDW_SLAVE_ATTACHED) {
>>>> +                    slave->dev_num = i;
>>>> +                    mutex_lock(&bus->bus_lock);
>>>> +                    set_bit(i, bus->assigned);
>>>> +                    mutex_unlock(&bus->bus_lock);
>>>> +
>>>> +                }
>>>
>>> And that part is strange as well. The bus->assigned bit should be set 
>>> even if the Slave is not in the list provided by platform firmware. 
>>> It's really tracking the state of the hardware, and it should not be 
>>> influenced by what software knows to manage.
>>
>> Am not 100% sure If I understand the concern here, but In normal (non 
>> auto enum) cases this bit is set by the bus code while its doing 
>> enumeration to assign a dev number from the assigned bitmap!
>>
>> However in this case where auto enumeration happens it makes sense to 
>> set this here with matching dev number!
>>
>> AFAIU from code, each bit in this bitmap corresponds to slave dev number!
> 
> Yes, but the point was "why do you compare with information coming from 
> platform firmware"? if the hardware reports the presence of devices on 

This is the logic that hardware IP document suggests to use to get get 
the correct the device number associated with the slave!


> the link, why not use the information as is?
> 
> You recently added code that helps us deal with devices that are not 
> listed in DT or ACPI tables, so why would we filter in this specific loop?
> 
>>>> +    complete(&ctrl->enumeration);
>>>
>>> you have init_completion() and complete() in this patch, but no 
>>> wait_for_completion(), so that should be added in a later patch, no?
>>
>> make sense, will move that to other patch!
> 
> Actually on this one comment that I missed last time is that you are 
> using a completion only for the resume() case, and I think it should 
> also be used for the regular probe() case, no?
Good Idea, I can try that and see how to works out!

--srini
> 
