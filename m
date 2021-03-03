Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEAF32B795
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 12:47:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1782418D4;
	Wed,  3 Mar 2021 12:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1782418D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614772072;
	bh=y/5kp/yxDAtV6N4rcb2pCcoN+xFgcu6sOObUr1y4j+E=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/D2w7fEAgaUpgHjyruCPXxE93bPNR/VZ8a4k3QYNmWBYaFwVaPCvsOzkQQ12czqQ
	 wokgbd0QXW9ZeitufpLcxFpF3FXEgvfHeGlvoEUndij63bKXXGQWFH/Vf2fGRly/nZ
	 ZOhwkz6qG6wQQap6JOuI3U2GFanBOHOm46Xgb7NQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39356F8026A;
	Wed,  3 Mar 2021 12:46:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB02BF8025E; Wed,  3 Mar 2021 12:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F065F800B2
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 12:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F065F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HhgsIYii"
Received: by mail-wr1-x42a.google.com with SMTP id u16so5325733wrt.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Mar 2021 03:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MeQqLKfUpWUw4m4oMpwWQScKW8kK3AHyes4EBhAmAkY=;
 b=HhgsIYiiTod2dmWWRk3//eBmB2MYwsQLBC29KvdiN6vETMyE+ZMNnNqWQL9Q/yCDRg
 Yg7jpXpcAlfCciQCb1dhadnF1MPG3VwptYH/Ffc5eM5IfYHwxK1t23w8y4ntWhdpi+hX
 BIdAy9ioa8VWsHKWh1hl1XsGVsLbZ9vzImWgu2vPeKZlly2rSxusiAHRfNCBs86+vq9L
 olhq+VMNM4Pu76UAGBI/m9kUSvPY0HVIku76Yb6QYkeBp3nUkcM8Ef8f8KMwHu3fumMR
 Uk0aD7BckV9mia2RFglhuobhexzKfCjQt53ygUBx6ogiReBN9axN2qTu5jFGUVE/4b0H
 4YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MeQqLKfUpWUw4m4oMpwWQScKW8kK3AHyes4EBhAmAkY=;
 b=htq6zK2FJCoLSO1Ew2ELI37VbnOnR62fpza3Vign/k6PJ84Dfk+CVHjKqlKizSReht
 LVjM0k2QyQy4Nb2Un1tly3NWIKgriIFjgiv9eQjIQ6wuziXyj61ss72MAnUNuhgKxVf9
 351cgmWxRF+M9Y70wjiebuHxC8HJUvcuTjzpWS1T0WMqAx7okYacV7kAQpkxEktzvvQj
 91WbVcVwJ9qZ+NkarLL+0u6yg4S+p/htX1MgC2N8rHTgbiIKun+cvyV+qyY7/K5+HOKv
 b5y/33vRb/7A4VDeBUDlDJj4EX6nDxEYYVJMazsgko15zTXVVo65erAAHeu4okyptc3X
 raXg==
X-Gm-Message-State: AOAM531VSaMOqA62+gU9z1fZLBdhUUvO5KKTu7VHHAgQLX2AHw4q6DYp
 8uureMUvDYsuHAIGkBQ9vk9u9g==
X-Google-Smtp-Source: ABdhPJx6TiVE2WzgqGC5H4bW+t5fZtoXZpTTF4vyAcjFnqKb7ufY0KvoXlWsJCX56BMIZ1QB/VTfFQ==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr26294650wrr.81.1614771973791; 
 Wed, 03 Mar 2021 03:46:13 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y10sm23512424wrl.19.2021.03.03.03.46.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 03:46:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] soundwire: qcom: add clock stop via runtime pm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-4-srinivas.kandagatla@linaro.org>
 <2899ca9e-2938-4d8d-5e56-49eba8cdb920@linux.intel.com>
Message-ID: <75a7a05c-d34d-aa3f-e8e8-4bbb89e1beca@linaro.org>
Date: Wed, 3 Mar 2021 11:46:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2899ca9e-2938-4d8d-5e56-49eba8cdb920@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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

Thanks Pierre for reviewing this in detail!


On 26/02/2021 17:41, Pierre-Louis Bossart wrote:
...

>>       return 0;
>>   err_master_add:
>> @@ -1214,6 +1261,47 @@ static int qcom_swrm_remove(struct 
>> platform_device *pdev)
>>       return 0;
>>   }
>> +static int swrm_runtime_resume(struct device *dev)
>> +{
>> +    struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>> +
>> +    reinit_completion(&ctrl->enumeration);
>> +    clk_prepare_enable(ctrl->hclk);
>> +    ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
>> +    qcom_swrm_get_device_status(ctrl);
>> +    sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>> +    qcom_swrm_init(ctrl);
>> +    wait_for_completion_timeout(&ctrl->enumeration,
>> +                    msecs_to_jiffies(TIMEOUT_MS));
>> +    usleep_range(100, 105);
>> +
>> +    pm_runtime_mark_last_busy(dev);
> 
> Humm, what 'clock stop' are we talking about here?
> 
> In SoundWire 1.x devices, you can stop the BUS clock and not have to 
> redo any enumeration on resume, devices are required to save their 
> context.  You have to also follow the pattern of preparing and 
> broadcasting the CLOCK STOP NOW message.
> 
> It looks like you are stopping something else, and completely resetting 
> the hardware. It's fine, it's just a reset but not clock stop support as 
> defined in the SoundWire spec.
> 

This is clock stop that Soundwire Spec refers to.

However I think I messed up this patch! :-)




>> +
>> +    return 0;
>> +}
>> +
>> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>> +{
>> +    struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>> +
>> +    /* Mask bus clash interrupt */
>> +    ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
>> +    ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
>> +    ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
>> +    /* clock stop sequence */
>> +    qcom_swrm_cmd_fifo_wr_cmd(ctrl, 0x2, 0xF, SDW_SCP_CTRL);
> 
> Humm, this looks like writing in SCP_CTRL::ClockStopNow, so why is 
> enumeration required on restart?
> 
One of the controller instance needed a full reset so there is a mix of 
code for both clock stop and reset here!

Am working on cleaning up this in a better way!

I will also address the runtime pm comments that you have noticed in 
next version!

--srini


> If you take down the bus and reset everything, you don't need to do this 
> sequence. a hardware reset will do...
> 
>> +
>> +    clk_disable_unprepare(ctrl->hclk);
>> +
>> +    usleep_range(100, 105);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops swrm_dev_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
>> +};
>> +
>>   static const struct of_device_id qcom_swrm_of_match[] = {
>>       { .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>>       { .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>> @@ -1228,6 +1316,7 @@ static struct platform_driver qcom_swrm_driver = {
>>       .driver = {
>>           .name    = "qcom-soundwire",
>>           .of_match_table = qcom_swrm_of_match,
>> +        .pm = &swrm_dev_pm_ops,
>>       }
>>   };
>>   module_platform_driver(qcom_swrm_driver);
>>
