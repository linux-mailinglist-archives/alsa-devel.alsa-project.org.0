Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31D403AB9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 15:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9BC8167F;
	Wed,  8 Sep 2021 15:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9BC8167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631107882;
	bh=C1qKWZrdBCi9uXIry9unuRPzKgGMT1Q/5hrnGBgicRI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ig7iDMVIUcS/AFTRZgUN/miCJMKOTq73dgt5kxYqhVAwsPymXjCzDi486m4loLbyp
	 VT6l0Mve3Qb4TGTBOwQ1pLecAUZK/6b/LImSBh8gSV+trKidV6ZUzRMKBIAIiwbEMP
	 PE/mWGK5xIT/cFxLS2dAFo3Svzxgwijp96wVmiac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE84F80166;
	Wed,  8 Sep 2021 15:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A94F802E7; Wed,  8 Sep 2021 15:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6527F80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 15:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6527F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nFRTs74D"
Received: by mail-wm1-x333.google.com with SMTP id g74so1728250wmg.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dHfCdAU1MQvCrPLrk7KscWpwI3q8kBZ1zPpWHECDhYs=;
 b=nFRTs74Digh80FHfz8Qr8OkgCHKOu4FyizjPByn5YqNv/6/m9gPqpVBZa4tGESCFmP
 P6SDfF88xg0cGDiaMSzzDyuEU9jQZ3wdrczSR3OWu9Ak3FXZqu+KipUp65hsUXE63Ue+
 qAQxyd43p3jWxqYwMgQS5xVYYFBIUIfuOAHm4lkTNTrXQMErTc551Xl26NYu+D6FDFXJ
 Y1j0PLHWgeHsW3LZoioqJWrC6q5AzMAQuyO73RMrvuUeVSzfmyA3DAM00ouCjMRKH6zd
 ifIGVORMNYbE0WoVa3KkszHwz4a/BPe+vsQAHzCiwGSp9d1LOtzaTbe+XeZUKueZdpVf
 gP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dHfCdAU1MQvCrPLrk7KscWpwI3q8kBZ1zPpWHECDhYs=;
 b=6BksXgZtmL1sCQBV4s46AfLNVwX0za7+uU4MYl6o8Py7KwG5dyTAY7aPOzirDwvvSP
 3mpY/zGkco1SoqwF/H/ZpSLhiVEI/thsZdx24sPAt4Go1gZTosykHJAI9+RcucqIbtPO
 A5nIx981wGwKAm+wc9iWLI92v2XClwSFCBrwPCnDqcpWSVtZy8TZR6/GZ67MivhS3O+d
 ZpdjVkYMb5ef8L7DOIxgv7GCof4l5aUz/rwXSjBUT2z+AN9iQN6wwcwHCA0Zi28Zubzj
 jBHaOkh8LLTX1NpgzFg2S8dIuRBXgbo/xBsEm5JVLLK/5PstvR5Z+KxCkwQVUl3OAk5C
 c19A==
X-Gm-Message-State: AOAM532d2GDp/aFmXbOMAkAcvnYf4KJfOazBCtt5a+2qFvDmB7ZCTYkP
 f4zP+YtLBjErWjrvtAMaYHQTiQ==
X-Google-Smtp-Source: ABdhPJzGQbzQmhgvNAvccfKL0aUV19j9kOScHFcI7d/gDyLZINqfTFnRtFLo4tuzbQ53AV6XBIMV9Q==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr3624627wmd.33.1631107788964; 
 Wed, 08 Sep 2021 06:29:48 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z5sm2179670wmf.33.2021.09.08.06.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 06:29:48 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] ASoC: qdsp6: audioreach: add q6apm support
To: Mark Brown <broonie@kernel.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-16-srinivas.kandagatla@linaro.org>
 <081e6734-a258-6d21-cf66-f00bfeb38b04@linux.intel.com>
 <b1cfacb4-70b9-7146-00d5-9d680297d900@linaro.org>
 <f8bd8b94-528d-bf6f-9e84-0e41e4c56382@linux.intel.com>
 <0840d2e3-c261-8d85-35ff-8388448ab7fc@linaro.org>
 <20210908122600.GD4112@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e2d534dd-56d5-5a66-e9aa-1d3049023aa6@linaro.org>
Date: Wed, 8 Sep 2021 14:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908122600.GD4112@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org
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



On 08/09/2021 13:26, Mark Brown wrote:
> On Wed, Sep 08, 2021 at 12:28:05PM +0100, Srinivas Kandagatla wrote:
>> On 07/09/2021 16:04, Pierre-Louis Bossart wrote:
> 
>>>>>> +    spin_lock(&apm->lock);
>>>>>> +    idr_alloc(&apm->graph_idr, graph, graph_id,
>>>>>> +          graph_id + 1, GFP_ATOMIC);
>>>>>
>>>>> does this need to be ATOMIC?
>>>>
>>>> We are inside spinlock.
>>>
>>> but this is not used in an interrupt handler or anything that isn't in a
>>> process context, is it?
>>>
>> No, it is in process context only.
> 
> So why is it a spinlock then?
Only reason I ended-up with spin locks is because am guessing that busy 
loops in this case are not going to be for very long as its mostly 
dealing with idr resource.

On the other hand, I don't have any issues in moving this to mutex.

--srini
> 
