Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617E32E693
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 11:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC71117AA;
	Fri,  5 Mar 2021 11:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC71117AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614940888;
	bh=kRR2+3+E95QTt95hpynoR7P3G5ynci4FF8sb+zVnbjk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t0zPd70NEBJnhYu90+6alr7UzgNj1pKHBjhOC6X7YlLgw6bSoxabaO4iPnKZgN7TG
	 ZK+HpaS9a3jp88lH4P6ruMaGAfeox9OPZRgbPQ1X/vNiWzLWG/1i9iEk3dPa40nqsh
	 PV2VMmHWddTnlNFHiyA07Mx/UNrX/iz71oNQFfv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB50F8026A;
	Fri,  5 Mar 2021 11:39:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59444F8025E; Fri,  5 Mar 2021 11:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4973F800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 11:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4973F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zSq01aMN"
Received: by mail-wm1-x32b.google.com with SMTP id u187so996265wmg.4
 for <alsa-devel@alsa-project.org>; Fri, 05 Mar 2021 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QAdiWW4xwrryTGLdOvOtGLA/wZ8tOat9yGLAJoNAxMg=;
 b=zSq01aMNZU/0lbjMkjkR1Uw1zAN1FtTgasQkQglRVDE9fQtiNLSJ346wtKBSn/qbsP
 //qeKC0aTNWf4/I9QENg940YXKDXMaxje+guRsevzMpW931uh2m3y/AFE2jhMXNe1PAD
 NYx587Huhc2tdlTd+Re0llJ8+7Jhrs09WNfp2Li77VNZHS6q5w8f4+oyibgeqE+DsWzR
 LOURo4gs2+u+TOycVrYnOcgUnhJhaH1fVdmbVdGXt7C3lusS7VQRMb2+S96OFXwJY+X9
 ys25kGCEjb0pZyi5/c2guIM0kWkyh5t/BnfA6PRxJ+CqyJW/22VeuRWbdoWUPHBVq+we
 T5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QAdiWW4xwrryTGLdOvOtGLA/wZ8tOat9yGLAJoNAxMg=;
 b=qzd1IvRQ4Rg8vXqhYflApVVLHyS2JhqBLWMrPqMkGs0JTRU4xxfRisMAUTdsWYa3w3
 DweGSH+/SwvUc6etIQ2C7rJSm3Ypfw9Bdtls89y9Y1vAXRtUccdEddqQgjUUOOUoY7sc
 f/kelUW2rM/eBF4Pe9Zd2tS9J341hZfq9s/KeRiES0bef1uH64RljSonBHyf8/OsSdkV
 FRKUIA0ex4scqz9yShHW4wjlR8l4KokYEbErqskjM3ESfufszhZJfbyFUFD5xrKEg8M6
 ktW2dMkoMCdpUD+GIIMjowZGiHFg2wkB7k8vn2l4WIk+TzNm3DreqqegiU6BFLjLW3qV
 at3Q==
X-Gm-Message-State: AOAM533ROP3/e0DnwQ4JPZrCgmD+AuC9F+b8Mjiu3Q3Mf5bVbY3kBrOI
 /7qgUzHTXR6T8VUQs3/M22uQefdw5DHD1Q==
X-Google-Smtp-Source: ABdhPJyg+mYo+eyJo4nlyLEW6IIs5uu8pJlCxPE06eXsjVFve/od1o2v389wAUalmaTvP7K1+U1x6A==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr8192686wmq.102.1614940791595; 
 Fri, 05 Mar 2021 02:39:51 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t8sm4115141wrr.10.2021.03.05.02.39.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:39:51 -0800 (PST)
Subject: Re: [PATCH 2/3] soundwire: qcom: add auto enumeration support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
 <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
 <4721dd27-c8ce-f988-3c10-794841390656@linaro.org>
 <01e5ea33-1813-069a-1674-042141947323@linux.intel.com>
 <601b585e-c3e3-4006-b078-d54c3fd36438@linaro.org>
 <c5fe182d-1769-73ed-0268-5353fd030521@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5b067c8d-0d90-1531-a1b1-118fa73c0078@linaro.org>
Date: Fri, 5 Mar 2021 10:39:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c5fe182d-1769-73ed-0268-5353fd030521@linux.intel.com>
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



On 03/03/2021 16:35, Pierre-Louis Bossart wrote:
> 
> 
> On 3/3/21 3:38 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 02/03/2021 14:34, Pierre-Louis Bossart wrote:
>>>
>>>
>>>>>> +        if (!val1 && !val2)
>>>>>> +            break;
>>>>>> +
>>>>>> +        addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
>>>>>> +            ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
>>>>>> +            ((u64)buf1[0] << 40);
>>>>>> +
>>>>>> +        sdw_extract_slave_id(bus, addr, &id);
>>>>>> +        /* Now compare with entries */
>>>>>> +        list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>>>>>> +            if (sdw_compare_devid(slave, id) == 0) {
>>>>>> +                u32 status = qcom_swrm_get_n_device_status(ctrl, i);
>>>>>> +                if (status == SDW_SLAVE_ATTACHED) {
>>>>>> +                    slave->dev_num = i;
>>>>>> +                    mutex_lock(&bus->bus_lock);
>>>>>> +                    set_bit(i, bus->assigned);
>>>>>> +                    mutex_unlock(&bus->bus_lock);
>>>>>> +
>>>>>> +                }
>>>>>
>>>>> And that part is strange as well. The bus->assigned bit should be 
>>>>> set even if the Slave is not in the list provided by platform 
>>>>> firmware. It's really tracking the state of the hardware, and it 
>>>>> should not be influenced by what software knows to manage.
>>>>
>>>> Am not 100% sure If I understand the concern here, but In normal 
>>>> (non auto enum) cases this bit is set by the bus code while its 
>>>> doing enumeration to assign a dev number from the assigned bitmap!
>>>>
>>>> However in this case where auto enumeration happens it makes sense 
>>>> to set this here with matching dev number!
>>>>
>>>> AFAIU from code, each bit in this bitmap corresponds to slave dev 
>>>> number!
>>>
>>> Yes, but the point was "why do you compare with information coming 
>>> from platform firmware"? if the hardware reports the presence of 
>>> devices on 
>>
>> This is the logic that hardware IP document suggests to use to get get 
>> the correct the device number associated with the slave!
>>
>>
>>> the link, why not use the information as is?
>>>
>>> You recently added code that helps us deal with devices that are not 
>>> listed in DT or ACPI tables, so why would we filter in this specific 
>>> loop?
> 
> I don't think my point was understood, so let me try to explain it 
> differently.
> 
> it's my understanding that the hardware reads the DevID registers and 
> writes a Device Number - so that the entire enumeration sequence started 
> by reading DevID0 and finished by a successful write to SCP_DevNum is 
> handled in hardware.
> 
> The question is: what happens if that device is NOT described in the 
> Device Tree data? The loop over bus->slaves will not find this device by 
> comparing with known devID values, so the set_bit(i, bus->assigned) will 
> not happen.

yes, that is true, There is no way we can assign a dev_number to the 
device which is not enumerated on the bus!

Am sure this is the same behavior with soundwire core too, atleast form 
the code I can see it sets the assigned bit for only the devices that 
are enumerated on the bus! Not all the devices specified in DT!
Unless I missed something!

--srini


--srini
> 
> 
