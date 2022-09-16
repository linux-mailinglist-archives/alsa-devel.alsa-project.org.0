Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361DD5BA9AB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D22C01A4E;
	Fri, 16 Sep 2022 11:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D22C01A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663321821;
	bh=Qh3UkP+cbQ0pkxJcwCgsgZ6WmeFjhY/KMRv/ZxZ+EJc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSfM0//er5lRn7nxtVpYUfC/LKpEs6tpZ+joBV8zzbP5LQKUSBXwWLRO6tlKMlO4f
	 u+OJzFqjkvij4BCkr/bYhNb24fU83N7W32RlqCWxtoePWLwCiGLDjtOomQysJ+3Bcf
	 BYA7n3464TI8cYJVCdRYu10W67zGU8Rno9rPiRFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57066F80496;
	Fri, 16 Sep 2022 11:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F016F802BE; Fri, 16 Sep 2022 11:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13F2DF800B5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 11:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F2DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cE8QbI0l"
Received: by mail-wm1-x335.google.com with SMTP id
 r5-20020a1c4405000000b003b494ffc00bso819605wma.0
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=/j9nkENP/q6n9kbcfrpHdp/54X7IRFuMR2LVA0qv9ts=;
 b=cE8QbI0lA5Jgj7boFeCXuuCkXUVczJZyE7yzzXhFRqFMQbqCh0oCeWV3dbWOdfUXFF
 9EtSzsxmzR91LIX4CGrkCFWcjK5OOQVKU1hn0mwnlCr1WgVI9maib83vAVUChytx7uaR
 CmIyV1aWxSyNs4Bw2xEXY3beGpudPmL38SkSp9sFo26jrQnUmgwElYzFWOqSObt2awUK
 tF+XmX3s4UQIJshdwm24Tm2dDh7/K11gr9KwJkycSZr6nrov/j8LopHwEHCkKo/0wwao
 TkL1fhij65qUdlX70XFNV2NPdCXWUbw0EdBOjXTH41WZgxFWOLcufqLtb5MuWeWm544C
 F9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/j9nkENP/q6n9kbcfrpHdp/54X7IRFuMR2LVA0qv9ts=;
 b=QbEwvXtlk5uYAAaFJBzv79LNBiLGTinbf/GVFs6/GkM7NCKlSHBd0xWDPsY6ue8iKd
 vgW1IFCP/PAgMZ3brSAAVTMCH5sLdUNK3vGT7l5htJu8Dk+RNtowTWBFi3j2O6UAkbCm
 sLpAS8yMirxinpW/jtmc7JQuWTHOyPruzaeDM9K1I6XhfGGvXhc2AP29m6IklXQEPnWZ
 +fsPsXc+QfFFI8ut4S8b4A+ZCngZeUHsDNY6AlijqrQJSZLo33fzTqYITfzKyA6XWGwD
 8OL+RSFl0WAph8zCauZEBTW0zLGGciYOPPrYfmIw8oE0gtDc/JuoTePMcPBK02HZwq54
 1b5Q==
X-Gm-Message-State: ACrzQf1O+3iu1qFXK8yBWFNISH/T1G3Zrjh7/mWqOMnNxmTZZJ2rUHHK
 GW0YurW6YnvWaVI0KXDoc3H+Dw==
X-Google-Smtp-Source: AMsMyM7VUZ8JkQEcQ8vUusOPHMBJ6VJW/luZecMrLFw/qRlKHZxicVVQkAl6X4QYntzgUEvmvpAW+w==
X-Received: by 2002:a05:600c:3ba6:b0:3b4:9894:d482 with SMTP id
 n38-20020a05600c3ba600b003b49894d482mr2719232wms.120.1663321755218; 
 Fri, 16 Sep 2022 02:49:15 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 f17-20020a05600c4e9100b003a5bd5ea215sm1747288wmq.37.2022.09.16.02.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 02:49:14 -0700 (PDT)
Message-ID: <4e42389e-c1c4-fe41-3bc8-03cc9a40ac0b@linaro.org>
Date: Fri, 16 Sep 2022 10:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
 <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
 <bffab27c-6e25-5787-6958-648f9f2e2686@linaro.org>
 <2e1b81d2-e20f-db9f-b84e-b3c5ebb312cb@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2e1b81d2-e20f-db9f-b84e-b3c5ebb312cb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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



On 16/09/2022 10:39, Pierre-Louis Bossart wrote:
> 
> 
> On 9/16/22 11:12, Srinivas Kandagatla wrote:
>>
>>
>> On 15/09/2022 14:10, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 9/15/22 14:42, Srinivas Kandagatla wrote:
>>>> By default autoenumeration is enabled on QCom SoundWire controller
>>>> which means the core should not be dealing with device 0 w.r.t
>>>> enumeration.
>>>> Currently device 0 status is also shared with SoundWire core which
>>>> confuses
>>>> the core sometimes and we endup adding 0:0:0:0 slave device.
>>>
>>> The change looks fine, but the description of the issue is surprising.
>>
>> Thanks Pierre,
>>
>>>
>>> Whether autoenumeration is enabled or not is irrelevant, by spec the
>>> device0 cannot be in ALERT status and throw in-band interrupts to the
>>> host with this mechanism.
>>
>> This issue is more of around enumeration stage in specific during device
>> status change interrupt from controller. Sharing the device 0 status
>> with core makes it think that there is a device with 0:0:0:0 address and
>> it tries to park device to group 13.
> Still not clear, sorry, see my comment below.


> 
>>
>>
>> --srini
>>
>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    drivers/soundwire/qcom.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>>> index e21a3306bf01..871e4d8b32c7 100644
>>>> --- a/drivers/soundwire/qcom.c
>>>> +++ b/drivers/soundwire/qcom.c
>>>> @@ -428,7 +428,7 @@ static int
>>>> qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>>>>          ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>>    -    for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>>> +    for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>>>            status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>>>>              if ((status & SWRM_MCP_SLV_STATUS_MASK) ==
>>>> SDW_SLAVE_ALERT) {
> 
> can this really happen?
> 
I have not see this happening, I had to change this line for consistency 
reasons due to other changes in the patch.

Only case the issue was seen is during enumeration.

> Device0 cannot be in alert status, can it? The only this it can do is
> assert PREQ and set the Device0 status to 1 (ATTACHED). I don't get how
> a device status could be 2.
> 
> So even if the status is shared somehow,I don't see how this could be
> related to parking the device as suggested above. If the condition is
> always false then changing the loop counter from 0 to 1 would not have
> an effect?

The reason why core tries to park this device is because it sees 
status[0] as SDW_SLAVE_ATTACHED and start programming the device id, 
however reading DEVID registers return zeros which does not match to any 
of the slaves in the list and the core attempts to park this device to 
Group 13.




--srini

> 
> 
>>>> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct
>>>> qcom_swrm_ctrl *ctrl)
>>>>        ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>>        ctrl->slave_status = val;
>>>>    -    for (i = 0; i <= SDW_MAX_DEVICES; i++) {
>>>> +    for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>>>            u32 s;
>>>>              s = (val >> (i * 2));
