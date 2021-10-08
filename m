Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF8426854
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 12:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 404081670;
	Fri,  8 Oct 2021 12:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 404081670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633690527;
	bh=JedjvJ9iBFROmAWhwnVftiHC1u17kAO1y6roosCoyJ8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHJL5bmdV/a2DO8AC7oz39mFdDQP6xGXDkkh5SIydGEBXf9cLTb9pDkOSYmi/hdCL
	 +Scirqybmli5AAgi0Rf5GEmPfFpSWHkBskibWYci6vmVfdDOel56yEhcY5PPE619X5
	 Armnx5QD0L5hP2Qu5ktYrks7RXBX5Z1bisTQs4F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD39F80229;
	Fri,  8 Oct 2021 12:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7CBDF80240; Fri,  8 Oct 2021 12:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 287BFF800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 12:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 287BFF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="t7qHQgIs"
Received: by mail-wr1-x42f.google.com with SMTP id r18so28555317wrg.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kKtYYGgZiFJvuei0yiQ5fmR24Nxd9GVQH20PjQB9cTo=;
 b=t7qHQgIs/f4qDsFUFAY2SVTHbN3Jd4tJFH2VDtmjdG3KA3kr8p2qO4hG+1VNmtXfMw
 NtLFsqTkv0iw2P+vrnBPW1eJXfC1ei9j6glHWVDpEdyg6CQGIWTQil3Vf+I2sjJ6ejYA
 FTp/kqf+yhsbMpvcvNMjHGORPLLuq65hPzx3GScVywgpQxkz4dDYXs81pENbRzsj2xPm
 mtE5VKKZ43dpDDytoq/lMYLop6kL5+mln76Bg0O+IwrApDZoyBbUYGYdfEZtgTakUrDl
 P6ej8zjuLFV0aIEt3zfThdrXbtNWWjfAdg5GpleYxmRRbbHkY6jfW+YRYM7azdVfuqr5
 JgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKtYYGgZiFJvuei0yiQ5fmR24Nxd9GVQH20PjQB9cTo=;
 b=095QEDW/rB0M9dtxdF/Ctd26cSWR/JiRp2+dYx/mFDZDyW4kE7lKw+aEQtDzITUzvL
 0vYTi2uG36wSmztOFMWGiSxkOBwEvv7NSM9reu8UHXCSjiS+vCcGiPxR2aBEadsJesDL
 VT2/wkwmcvQ8n53kidHlZ6hSbp5f3W0M+tDNhGo21EjEq2EtPpz8LNhwR/t0Z4vZZDor
 AC75nedGvsKes707ENIOoulyMmU1nq80RoI1rvYGVENppdEBRzI9Yg/zVjBVORXg7wWO
 YlG2keFeW3n4Uk6pRIAOLzBLMeXCLjEb6W1qdLMCRdUFB46Ytf7CrgVm6m1UAV8yLKZQ
 EEUA==
X-Gm-Message-State: AOAM5304oXVX5xt/hlljTIL4rqsmzxjo+GQlt0OwKT85vU7vfqR351sM
 +Yf5meStWlwZw4SqaE9dyYHZZg==
X-Google-Smtp-Source: ABdhPJzQIZ9XolMu8iQFcvt4FDGHlxb50OFJdQH6HP9nn83ou4f2CIx/s2ewtnDc9wNXJe1sBPnNPQ==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr2662284wmq.16.1633690443692; 
 Fri, 08 Oct 2021 03:54:03 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l2sm1855394wrw.42.2021.10.08.03.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:54:02 -0700 (PDT)
Subject: Re: [PATCH] soundwire: qcom: add debugfs entry for soundwire register
 dump
To: Vinod Koul <vkoul@kernel.org>
References: <20210907105636.3171-1-srinivas.kandagatla@linaro.org>
 <YVaMlSbmFnrQyb0u@matsya>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <465c7753-4b39-c309-f535-a7a1809ae6ff@linaro.org>
Date: Fri, 8 Oct 2021 11:54:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVaMlSbmFnrQyb0u@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 01/10/2021 05:20, Vinod Koul wrote:
> HI Srini,
> 
> On 07-09-21, 11:56, Srinivas Kandagatla wrote:
>> +#ifdef CONFIG_DEBUG_FS
>> +static int swrm_reg_show(struct seq_file *s_file, void *data)
>> +{
>> +	struct qcom_swrm_ctrl *swrm = s_file->private;
>> +	int reg, reg_val;
>> +
>> +	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
>> +		swrm->reg_read(swrm, reg, &reg_val);
> 
> Why not use regmap_read here, that would avoid reading from the bus when
> we already have the values...

Sorry for such late reply.
But these are controller registers which are not exposed as regmaps in 
mmio cases.


> 
> Second make sure later when pm_runtime support is added, this take a
> reference ..
> 
Yes, Am currently working on runtime pm support, I will make sure that 
this is take care.

--srini
> Thanks
> 
