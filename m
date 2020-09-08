Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78326123D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1E8175A;
	Tue,  8 Sep 2020 15:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1E8175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599573638;
	bh=fLm0+FvS3LRtGnrdUEzpJh7Pa6RIFwYGXm3uT3TfVxQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3UNkArLze3unU24GLL+KqPYHIPTOGVXwLfJTsxbcMix6d1NANflWqy+sRbyLhDIB
	 zNl70ATBaFX7mB2Mi0AzhTUSSytSLEa9q4E8upysaCDzJZqdKk8RuQl6MEAznGRx2e
	 U8eOxra5qR0OVwR08XvZ8YGGxdTWNTcqfzyZPpvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF63F801F2;
	Tue,  8 Sep 2020 15:58:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211B5F8026F; Tue,  8 Sep 2020 15:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1F75F801F2
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 15:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F75F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="mCT551VG"
Received: by mail-qk1-x741.google.com with SMTP id w16so15323789qkj.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+0VeQsmoLvQuU6aBo8zkUNaslkMwNc2y2ovMYLqi8XU=;
 b=mCT551VGMZB94T4mxoyukc4bwxgzEzUfWwL2NvOY75ZaeJdpVQG9CBGM1bGuJrJs2d
 vIOmu8PzXYmtEsQLa/m2JAQSu0eJCPrcPkfvV9Ijc4QajjV3687zmTDPrqeSq1uJuG91
 dsViQvLDQdy6yiU6PEXgnu4e/No+wesobtdBRKR8F3GKNMVVobwe4Q1QlOXue+A4zk2K
 aYi1G2PgHsePs/N6bKyI3DvK2mxmNGCtZMk5tgCkOnw4yYsxg/YOAyvDPeqBTNZj0uyF
 +N6GfQAzFQn/Ey3fK4fQ10k+G/OswU60JOly4rzK2N70fyiOx+Ce+/BJY+P/ccnOv329
 b9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0VeQsmoLvQuU6aBo8zkUNaslkMwNc2y2ovMYLqi8XU=;
 b=dfg/qzoWn1gbvQKpCy2trm4nE3XpMUWHQeL9UcwmBZKJF3+hvE8YMWBlcNzOkGJxMj
 Cs4ahu6Z9LXHZOWBbADjZqNV2IqwH38oRYCpfb1ox+3ZB3BRJPzkX6PKxKZ66J2LMrUE
 bjin269FswgeqCqDaDEYeeCLfAAg2M9ZSit4FwBH1PMtgyvegerXbRz9+4eeW96BcCGr
 Sy6QIGH6kvB7lsOWR15/tbqb9vlzYSRoxzKvBfKCdKETPumW6KoQjPoranhVI2KY4RkR
 B0k78oJsOnimmUtQjnkhViYFwBFuxA3g4AqFIbwzqmKRW+QbohCgGOgVcbbEp0RKn451
 2UwQ==
X-Gm-Message-State: AOAM531wL5dRg8jRZwj/UNuKZJbBKuQHGyt255FxH6oFAF5j1ZehdrCn
 E2MDVJ3HY6lpoo92cdCA37tG3w==
X-Google-Smtp-Source: ABdhPJzENRkC0WQz6clGvHTyG+K0LCw8iXyZ0zOHXituNkpO4M4F4y2QK9X/EX38k0eqbQaYJJPsSw==
X-Received: by 2002:a37:b201:: with SMTP id b1mr224085qkf.10.1599573517558;
 Tue, 08 Sep 2020 06:58:37 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id m1sm10014629qkn.89.2020.09.08.06.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 06:58:36 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] soundwire: qcom: add support for mmio soundwire
 master devices
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-msm@vger.kernel.org
References: <20200905173905.16541-1-jonathan@marek.ca>
 <20200905173905.16541-4-jonathan@marek.ca>
 <ad39f109-bfc9-332e-adc2-355499db1ab7@linux.intel.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <4bf165c2-1458-442b-5c85-5cebabda7232@marek.ca>
Date: Tue, 8 Sep 2020 09:57:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ad39f109-bfc9-332e-adc2-355499db1ab7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 9/8/20 9:56 AM, Pierre-Louis Bossart wrote:
> 
> 
> 
>> @@ -764,8 +786,11 @@ static int qcom_swrm_probe(struct platform_device 
>> *pdev)
>>           if (!ctrl->regmap)
>>               return -EINVAL;
>>       } else {
>> -        /* Only WCD based SoundWire controller is supported */
>> -        return -ENOTSUPP;
>> +        ctrl->reg_read = qcom_swrm_cpu_reg_read;
>> +        ctrl->reg_write = qcom_swrm_cpu_reg_write;
>> +        ctrl->mmio = devm_platform_ioremap_resource(pdev, 0);
>> +        if (IS_ERR(ctrl->mmio))
>> +            return PTR_ERR(ctrl->mmio);
> 
> Shouldn't this be conditional on SLIMBUS being enabled, as done in your 
> patch2?
> 

No, the case above is the SLIMBUS case. This patch is adding support for 
the non-SLIMBUS case.

>>       }
>>       ctrl->irq = of_irq_get(dev->of_node, 0);
>>
