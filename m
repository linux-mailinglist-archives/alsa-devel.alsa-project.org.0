Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A297632F07D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 17:59:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9781799;
	Fri,  5 Mar 2021 17:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9781799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614963567;
	bh=Ij9NdIHa1L6ovVRgikybeOCo0HbAtjrSVeINrIrK9ks=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULCO9RPYV2TyBRNY/qWCqEOzcOyV/iynCY0tAZebbnXQVmsYPsMCDw9ndBNU6/fRd
	 wWWseKZgux9TebErLaigVMmLR7wEIz2NonXJx47JvwTpfMY4y2hkjCDYEqGYKz9hzO
	 uPdFOLKUdZLLPQCoVnWZTkNk5K8Xr+t8OgdnxMT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F55EF8026A;
	Fri,  5 Mar 2021 17:57:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46EEFF8025E; Fri,  5 Mar 2021 17:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C3F2F800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 17:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3F2F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IMmBhWIQ"
Received: by mail-wm1-x332.google.com with SMTP id o2so2054736wme.5
 for <alsa-devel@alsa-project.org>; Fri, 05 Mar 2021 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KCqXF6DhvLeATztmzz0XQr9+I4zPUB4uuBIegF8P6nE=;
 b=IMmBhWIQWHQ9j6NO3Sxd6z737s2HBldvIlXMi5+KS0PAbALJQgLBT2dPVJPi6J3azO
 1krAjPTgVoI+Idf1hYw93K98TIgxepR+ZJhFMEo5bKQy38ghn2VWqbQUl4BS0QyVlLfl
 jgr+lAWxVH88y66NNvvrhMnPQ8x/b1R8VWbATAjH8eZ7TpyGKrgum2GRxqe3AHzdgkYi
 /iBYSuC8o3NoD89iwtOf4O26Odv0Dpw7S0Lpip3sKdN+yKxnGb7ArIzJc3JKQzil3OSX
 Q7GIQhTC/vWWTYYMbsDWunZzsAj+dHH2KezBwkKNX6E+OghPTb2Inq/7Zcja6ONlX4+l
 yt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KCqXF6DhvLeATztmzz0XQr9+I4zPUB4uuBIegF8P6nE=;
 b=DVTK6owHj7mMbWXSCoHK0hrvebgXxstOM/jshvW1Jp7Q+7yP3mqmvrv52MaRSmaxIW
 azXxmBwTVcdNdugCcgTdHNk22spcgT/jaYIiMs/7e8km2kVPGSMleaHFIo6jneBoRyr7
 RTyHeAbknLPlt2dF+CXUBp3BwHafHVc+4y/F6qDsBVPOZmOYuhyVE0SyGv9AyEdaNBpz
 afN6v/igJRdl4iTZxlx3Vbt8GAG8By1Yi9XR4OIdDCgi03wYpxvsuqPIzvpCl1o54KN2
 +Quz9rUtw2XEJkaIHq9Ac4/dGNsBe63ducn6H/QHJX2bS51Y5oWr+kMdL2BHNLiTu4dl
 UH3g==
X-Gm-Message-State: AOAM533fWpR8Cm4gr176vWwIpEy6lpVZ9fHSHu9HtvproGgXVii5ZaDw
 BTCoEw3fH0wR7I2UYuuQFYTU0TRTA/y6/A==
X-Google-Smtp-Source: ABdhPJydVHPdsB7IJQiJn5tz58VfcEp05KbBoQ+X6A9ge2JOOLS46OV37tlIyXxO7COzJkjS6SUg0A==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr9880933wmj.26.1614963463274; 
 Fri, 05 Mar 2021 08:57:43 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l2sm5272464wrv.50.2021.03.05.08.57.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 08:57:42 -0800 (PST)
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
 <5b067c8d-0d90-1531-a1b1-118fa73c0078@linaro.org>
 <46e297dc-487f-1959-1b84-22978fd9a19b@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a9129fe5-c505-920f-d3d4-85282ce83120@linaro.org>
Date: Fri, 5 Mar 2021 16:57:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <46e297dc-487f-1959-1b84-22978fd9a19b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 05/03/2021 16:19, Pierre-Louis Bossart wrote:
>>>
>>>
>>> The question is: what happens if that device is NOT described in the 
>>> Device Tree data? The loop over bus->slaves will not find this device 
>>> by comparing with known devID values, so the set_bit(i, 
>>> bus->assigned) will not happen.
>>
>> yes, that is true, There is no way we can assign a dev_number to the 
>> device which is not enumerated on the bus!
>>
>> Am sure this is the same behavior with soundwire core too, atleast 
>> form the code I can see it sets the assigned bit for only the devices 
>> that are enumerated on the bus! Not all the devices specified in DT!
>> Unless I missed something!
> 
> I am talking about the other way around, where a device is present and 
> enumerated on the bus but not listed in DT. In that case the hardware 
> did assign a device number but bus->assigned will not be set.

thanks for your patience!

Ah, I understand it now!, yes that part is missing!

adding Something like what core does in qcom driver should fix it!

if (!found) {
	sdw_slave_add(bus, &id, NULL);
	dev_err(bus->dev, "Slave Entry not found\n");
}

--srini
