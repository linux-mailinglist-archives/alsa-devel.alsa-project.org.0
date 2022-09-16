Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED335BA917
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748D51A16;
	Fri, 16 Sep 2022 11:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748D51A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663319607;
	bh=m8qICH57sZEFTQtKb+prI+oZVMqLPPlxElPuUrjD0cc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Of9co5sfZ4OY9DvFsjYKPBXeLYWxGWvOXVSotzPCyAwVFv477eSQh8bZKFIfzqj4J
	 hFFhR6t049okqln81PUury+uUC/c89vjPqA+E1ky9K7bFJZ9uUOUzbR6+Xhm1HLSLM
	 /u6Z7LatYRlPWcI1lvq4EvC7CqqERRNDcljeJqDQ=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F68F80496;
	Fri, 16 Sep 2022 11:12:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23115F802BE; Fri, 16 Sep 2022 11:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC223F800B5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 11:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC223F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d2qcsHql"
Received: by mail-wm1-x333.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so19439359wma.2
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mlaT4dkUmey+WYaJiYLCVZ+l1HaRfFbeV5h9SKJM/6M=;
 b=d2qcsHqlhbDrF7hMGXrk69KrkRyLIM0KsG91A88dSqc6m9oNU1AhLqbkfHn8VmenI/
 faZhxTdqbshYTPV9bEjex0lIx+MEaqaRYWNMjODryyYJghYdTfe+IM44WgcXKC0+Xk3E
 tHgLeNzdUd8oDDGNNqs6zSfLOBfoJb9Va6Wu2yltaC76HdSpeKeqiU1PxmT087DesfNO
 YGti+RSQwXKJ1t8reFU09wD/o3J2G7aQa2WkTWfG3TuRUiV26WyvB/CWS/kpYI5PtDD9
 IrF1hnEVclUlYlEZ28m0i2nD++dPzrUOX4OaWIWt1mHoNweIcgpi3xfaMyo+ylLk7oMC
 Nptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mlaT4dkUmey+WYaJiYLCVZ+l1HaRfFbeV5h9SKJM/6M=;
 b=HKP1FnjH3/jI5+Y24YeAQK83GqECAwjwmFedRxgtv34HNy6cEr1H0/Zybb6gPcuHtj
 VqVdtfeNykqt/SIcO2QvUNKuSXxPrZXJqNB1v+wL7NoTM+kagdu/aaJBIrnT092aa7wU
 MANgbj8Yg6ty3vKtF8IS4haBxZjRU8tnjeP0w5YS3UUcLDQ3iwwkKnjGZgq2PVqdiA1N
 fsjXrYssDRT56y4P1xpi6auBhMwryOfm0JUss0OcU/qrX5QBwcvupVIl9+uffEasvOhb
 gCyUxdTgwzEf6z//crRIB/xGsdiYLkEBP1pcQsKwF2jI4K7P03LM5GmOIef1PfHv1+S/
 vX1w==
X-Gm-Message-State: ACrzQf2wYVkP2UEebdf4DlmpLhj6b/RJSj7V/YXDXJDQv7lSrGMhDcLu
 GQlDbCUyoKYnjdExcYnedilyeA==
X-Google-Smtp-Source: AMsMyM79yY6pM1sgA9nNRpDt7+rngES5wrlzIG0j+hKlNPLl69x36Kw8WIt0JsZYVmOh4GFlD5sIKQ==
X-Received: by 2002:a05:600c:3d05:b0:3b4:9a42:10d0 with SMTP id
 bh5-20020a05600c3d0500b003b49a4210d0mr2682614wmb.135.1663319534795; 
 Fri, 16 Sep 2022 02:12:14 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 e4-20020a05600c4e4400b003a6a3595edasm1580200wmq.27.2022.09.16.02.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 02:12:13 -0700 (PDT)
Message-ID: <bffab27c-6e25-5787-6958-648f9f2e2686@linaro.org>
Date: Fri, 16 Sep 2022 10:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
 <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 15/09/2022 14:10, Pierre-Louis Bossart wrote:
> 
> 
> On 9/15/22 14:42, Srinivas Kandagatla wrote:
>> By default autoenumeration is enabled on QCom SoundWire controller
>> which means the core should not be dealing with device 0 w.r.t enumeration.
>> Currently device 0 status is also shared with SoundWire core which confuses
>> the core sometimes and we endup adding 0:0:0:0 slave device.
> 
> The change looks fine, but the description of the issue is surprising.

Thanks Pierre,

> 
> Whether autoenumeration is enabled or not is irrelevant, by spec the
> device0 cannot be in ALERT status and throw in-band interrupts to the
> host with this mechanism.

This issue is more of around enumeration stage in specific during device 
status change interrupt from controller. Sharing the device 0 status 
with core makes it think that there is a device with 0:0:0:0 address and 
it tries to park device to group 13.


--srini

> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index e21a3306bf01..871e4d8b32c7 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -428,7 +428,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>>   
>>   	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>   
>> -	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>> +	for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>   		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>>   
>>   		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
>> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>>   	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>   	ctrl->slave_status = val;
>>   
>> -	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
>> +	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>   		u32 s;
>>   
>>   		s = (val >> (i * 2));
