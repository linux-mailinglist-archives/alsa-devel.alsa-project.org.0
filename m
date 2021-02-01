Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272530ABF3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B941769;
	Mon,  1 Feb 2021 16:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B941769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194719;
	bh=tzfCR+O+8Vy9rflWLXgBjXx8SmXl677raXGudP/51m8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzbBxAte3zD4Z4i9y7zpqRRtX9WZyINzMw3zJUl+4ipr8e0HUncQcvT7RV75anHgV
	 LGpGVm36Ic8oqpWj809yqLWbU0V/mtZZi8+U7yz/Q0YRwFRszgTriTiVhWZBY/aJS0
	 rJdzrGWQZLU1VGmM+vxXrNpFjwY+TFQflE3qP4tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C87BDF80152;
	Mon,  1 Feb 2021 16:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07929F80153; Mon,  1 Feb 2021 16:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F89F800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F89F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Opy0DmlF"
Received: by mail-wr1-x434.google.com with SMTP id p15so17057358wrq.8
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cAK4vIVBbU+Jp0USNyRNxG4jbh7NlGlG/eznvI/LP9w=;
 b=Opy0DmlFOQRXeOK3t/mO7tnNn976fIQx0Lq1vP6TuBtr6zYhMUjRUypHUnnz8ljMJ7
 eRbi5g9kRv2aImfPx31wgavX0cudZQYGwrZHVdBM0+9rPy2FTIjF3zVy2SB6le5RI9iU
 /R1Uqfu/NAxZ6ua4ZC53bkMz15cyFdDij2p+WviaLz1OoSWS/dx5Dpk8EZanCvKt//6b
 4axwTvarI6tpIbhXFlBJbo/b/6DesjCTG1yWSPhX9lfa93aEWFqZQhXHZv8kv7j12Y5P
 KOMPxj3fQvnWiIUZ0Ut2WYETjo7bZlqFogV1gVWv0c4mc9Pgp3zFbkqO+wMupPasbo0x
 Re8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cAK4vIVBbU+Jp0USNyRNxG4jbh7NlGlG/eznvI/LP9w=;
 b=btDF2dszf6hwPEc8tvwDssb/CEU5CziR7+Fm+IEd52rNvASvsWgQQwLLFj2ntRkzi3
 RMbNvKtc/BuDEhYFQo9GDni7WYXEt2cp/UD+5CZwuo6T0ypvVaVw1VcPE2nm9qKrIV07
 7D5EbrACu5gO8E1pvtBIcNgzi43FevtfkMa7EmXXQ5tAfjrTtjPyjglw+bDmBRRc5qZ6
 po6cFxwRfwcGUcXpOSpP0D/WFtHCRW0b7x84wPzcsdIRjYhYRIpdtPmejkMdH+qRRPrU
 6J9dUo8tpZrMxXwY3HJJawyDmIKuIGXbY9YYNE3xxEtrKrMCrFhccyBqISNZ12Q9Jznz
 Ej2A==
X-Gm-Message-State: AOAM532OKW+jlS2s2DAKWO+XjoMacdaK8mAJvkkE6DM5tyDbUFVKO1X1
 LaWdS0CgZ9UGi4281ydj2y/2w1xVT4j1PA==
X-Google-Smtp-Source: ABdhPJzjFJi56q6RhBCr3OYMoyU2YsNfEwavxL8yzFcgorzJpPyTckDIgXFuY2O0M9eRlijRrnSnyg==
X-Received: by 2002:a5d:4f86:: with SMTP id d6mr19113800wru.246.1612194620054; 
 Mon, 01 Feb 2021 07:50:20 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l11sm26391629wrt.23.2021.02.01.07.50.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:50:19 -0800 (PST)
Subject: Re: [PATCH 1/6] soundwire: qcom: add support to missing transport
 params
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-2-srinivas.kandagatla@linaro.org>
 <29eb1b75-d92f-9641-8181-1fe250b189ec@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3c801cef-0089-721d-d916-bf3eed060c6c@linaro.org>
Date: Mon, 1 Feb 2021 15:50:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <29eb1b75-d92f-9641-8181-1fe250b189ec@linux.intel.com>
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



On 29/01/2021 19:20, Pierre-Louis Bossart wrote:
> 
>>   struct qcom_swrm_port_config {
>>       u8 si;
>>       u8 off1;
>>       u8 off2;
>>       u8 bp_mode;
>> +    u8 hstart;
>> +    u8 hstop;
>> +    u8 word_length;
>> +    u8 bgp_count;
> 
> I couldn't figure out what 'bgp' was and had to search. Not sure how you 
> came up with this abbreviation of "qcom,ports-block-group-count". Adding 
> a comment wouldn't hurt.

I will rename this to blk_group_count which makes more sense!

> 
>> +    u8 lane_control;
> 
> Are you able to use lane_control != 0 ? I thought we were missing stuff 
> at the bus.c level?
Am not sure what is missing in bus.c but we do use lane_control for RX 
slave on WCD938x codec. This uses datalane 1 for HPH and lane0 for 
Compander/Class-H and other ports.

And it works!

--srini
> 
