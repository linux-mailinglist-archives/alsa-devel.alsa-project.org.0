Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E884C8A69
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 12:14:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95A91ADB;
	Tue,  1 Mar 2022 12:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95A91ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646133289;
	bh=8ztDQ6vW++jFDB9ILvkT9gZu2U21eV1P/s4YROHNx+E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1F82VJqlSSlS3waOsmc0OTV9UKmz/usf/CPGSNRfiQvKgxhz2zjG70fZdSvQ7mhF
	 +qYB8HqT85DvswDxkqYacJbOAyIo0ci/eKHcRpvHMpOxmqyGTugPb+zEKNVVTmz36j
	 A9pXYler2rR+ZqVZ5Q7Ut+rD2z+STIXWs/WO4uPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 566DEF80054;
	Tue,  1 Mar 2022 12:13:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D3AF80227; Tue,  1 Mar 2022 12:13:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 048ECF80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 12:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 048ECF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ekM0x3sE"
Received: by mail-wm1-x336.google.com with SMTP id y5so7331618wmi.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Mar 2022 03:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uCMkFxxVgJxq/k9pyfJ1NQDpPu8aOfdTTyquXtVkJj0=;
 b=ekM0x3sEdznWAkaii/nPUwFz3ZuqhwbVwbinFP3Vec4MDKv0+Vn03k2FzZJokGl57F
 2/0hFrkSCmDUOoz0C9LJmry5Ai9ITrLQni7Z8mvhHl0v/2TRlYDJz7QFb/lN5RD5VQqX
 0OaIf7pSJjCSJr9r9A+2VExOC4ZLEd6auqPKn0oyHt2ORbyydGryahDbamre2tfMuW8a
 2fGbPc9fr7jZryOwucJG6bka9PBdz5NHGj4qQ2DBC+Gws+y3Fs1dC3amJf6Mvbgup8Js
 NxqnoI4UMUPmKYxZRO4JP6gpX3iN300M7FdoB0RCg9T72YvuGSAFLCrLWKDl5CN0Licj
 lElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uCMkFxxVgJxq/k9pyfJ1NQDpPu8aOfdTTyquXtVkJj0=;
 b=2JAgpXKy+zCWhcK2nuBUpDBoTpGnemDp6Z8o7h8Aga9SLP9QSH64K+yXFU13+Z9DCD
 eWnu6ymAk19E0agdePFT5992fP+6noKLS3R4gHw6GKVOs0/cDiEom2uODMnqQMscKUSD
 EJCgO/+DkZ3bN/65OYU9Ri1xgTEYr0oTub746vCFSTg9m2bcIwFtYKl9A3Noznx6+m1S
 WNFWDKmXwlLGQtN9o9V+1Ps3iO2S7BirFhkShHMG6wbZyUHTzMJKgfifZy/zo7Pod6A/
 ESc03nWm2LYob41iPGKND4STR79yaZOJ86EjN4iFIBkbvHbYvEr7kWJIVkPCztevpu2w
 XzVg==
X-Gm-Message-State: AOAM533FXHkgoO+VGVRl/k9VGiqliXRhmNamqmfv4E0/AkbnfcxikFdf
 pfZCiKMM95CZtU0gEs7362JG3A==
X-Google-Smtp-Source: ABdhPJyhMobJHc6nYi9FWMSgpA48zDQKAxS4s3yFZ69WkLJtS4tfOozGS6R14FjXTq20x0J2k/+UWw==
X-Received: by 2002:a05:600c:378b:b0:380:d7b4:c4a1 with SMTP id
 o11-20020a05600c378b00b00380d7b4c4a1mr17104878wmr.171.1646133212000; 
 Tue, 01 Mar 2022 03:13:32 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 v12-20020a5d4a4c000000b001e68ba61747sm13364529wrs.16.2022.03.01.03.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 03:13:31 -0800 (PST)
Message-ID: <c6b0506a-24ed-d4fd-c74e-d95c6dca6fe6@linaro.org>
Date: Tue, 1 Mar 2022 11:13:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
 <28a7aa9b-8322-54df-1cfa-275805e2b044@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <28a7aa9b-8322-54df-1cfa-275805e2b044@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



On 28/02/2022 18:01, Pierre-Louis Bossart wrote:
> 
>> @@ -1424,6 +1464,11 @@ static int swrm_runtime_resume(struct device *dev)
>>   	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> +	if (ctrl->wake_irq > 0) {
>> +		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>> +			disable_irq_nosync(ctrl->wake_irq);
>> +	}
>> +
>>   	clk_prepare_enable(ctrl->hclk);
> 
> This one is quite interesting. If you disable the IRQ mechanism but
> haven't yet resumed the clock, that leaves a time window where the
> peripheral could attempt to drive the line high. what happens in that case?


We did call pm_runtime_get_sync() from Wake IRQ handler, which means 
that resume should be finished as part of Wake IRQ handler. Any new 
Interrupt conditions/status generated by slave in the meantime will be 
cleared while handling SLAVE PEND interrupt.

> 
>>   
>>   	if (ctrl->clock_stop_not_supported) {
>> @@ -1491,6 +1536,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>>   
>>   	usleep_range(300, 305);
>>   
>> +	if (ctrl->wake_irq > 0) {
>> +		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>> +			enable_irq(ctrl->wake_irq);
>> +	}
>> +
> 
> and this one is similar, you could have a case where the peripheral
> signals a wake immediately after the ClockStopNow frame, but you may not
> yet have enabled the wake detection interrupt.
> 
> Would that imply that the wake is missed?
Its Possible it might be missed at that instance, however as the Slave 
interrupt source condition/status (Ex: button Press) is still not 
cleared it should generate a Wake interrupt as soon as its enabled.

--srini
> 
> 
> 
>>   	return 0;
>>   }
>>   
