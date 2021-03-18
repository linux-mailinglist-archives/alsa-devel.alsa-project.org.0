Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032D340524
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 13:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB961686;
	Thu, 18 Mar 2021 13:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB961686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616069157;
	bh=YWqitOY8xk6h2M1bD4f3bDeksTkYKZueOCAz8xx+Si8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vI5enUI+EY8myE19qbyTmj7E9ezbkf88vmyT8DU6W4U9s4zEcnlUFrtG5F4dW2IEx
	 L930+awj9VD8oSF/wTal6HYCXS+TBZC2oOphbtLMPxoD7aliRcuq6WLJsHhZVrrfvB
	 LaE6ct/b/sIjEFfeC2P3k+V7PO1LYJet49KMbldw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AEACF80171;
	Thu, 18 Mar 2021 13:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07D1F80165; Thu, 18 Mar 2021 13:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5919F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 13:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5919F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ap4uKFGV"
Received: by mail-wm1-x331.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so5269430wml.2
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xum7hU7Buh/ybJs7GYj6/HKviIdPR2mNxFcfJLPwDyk=;
 b=Ap4uKFGVcHzvMK6zfaSpw4C8ttu0WPdK9xeTEF/pBrsmZkR7x3LjXatvlWBe88OGoe
 mwCyrAi/MYJF38b9+bqk+I7n3nt7elkcGT6A66uWF6AzSs3a/IAUmwDkbjYVRT74RRrf
 cXhUN7d1InPve/zAvjXCkSR4+DPQ5g72l8KngsMa1w8lKMRnOiTg7su849dGilMRO0t2
 N86vQB0g/ZmDb8CU/3PshixD1PCwY4scC9UZEN05WrwWaUm/T+bhOrZOfgonXSNYbEOK
 FjNQ9vL8qaDrkjjYC8Gmlq+CPiLNPmqpt4iXBIMOVVjEEghfK0W/MTtzdhzzrq63ykcC
 qzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xum7hU7Buh/ybJs7GYj6/HKviIdPR2mNxFcfJLPwDyk=;
 b=b0XZILHFnFgpFMb7NFn61YwQb4WahVBNeVtbHyrT3fHQ0f3umYqhfNUEj01SLNFmn3
 BZxHQJy9c5A6ixhdNWSX7MhGAC0rE3sJV0Q8597ZBMYNtR8PTO7dOnH4yQjYc/FFoHzd
 hjbfn7J/GgNoy3+/faP171DgTdq0CR8ndlVgRyu8xL3c1lBMFpFFKx+SiquyjfL6ysZ5
 N71wHbBH2b2WyRe4Id398hw55GguCY8BWm79wh4692N9OXjdSvF+k17nv+ORXolDykjW
 AXsrgFujnN1A2PmesPYOA4EY39/9YhnaZZQ/3cRJcB8IeppMJ+wXW5trAacBM+fqcfaW
 XbWw==
X-Gm-Message-State: AOAM531QuOXDo62zuF7xEmCPRhaGsljbFFbEUfb3cafwwR06uw2Q4D+8
 B2qv7RGMikstA8dQ47Jk1M6UdA==
X-Google-Smtp-Source: ABdhPJyUpILZg3HpSywgdY3xU/+DmUGTRNpVADBlwF5KmdHhOKtRJqHOTVLO5cKxKKA7q05u5Ev/9w==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3380029wml.86.1616069052384; 
 Thu, 18 Mar 2021 05:04:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q19sm2055432wmc.44.2021.03.18.05.04.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 05:04:11 -0700 (PDT)
Subject: Re: ASoC topology loading vs card bind
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org
References: <09c77d7e-3def-0643-b838-94d748529333@linaro.org>
 <4a4c96df-b145-5bb7-ad91-e5d3644f704c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5b10ad71-44f0-d0f7-431e-18447e11596b@linaro.org>
Date: Thu, 18 Mar 2021 12:04:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a4c96df-b145-5bb7-ad91-e5d3644f704c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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



On 17/03/2021 17:00, Amadeusz Sławiński wrote:
> On 3/17/2021 4:16 PM, Srinivas Kandagatla wrote:
>> Hi All,
>>
>> Am trying to load a FrontEnd/pcm dai definition from ASoC topology 
>> however I hit a catch 22 situation here. Topology is loaded as part of 
>> component probe() but component probe is only called as part of 
>> sound-card bind().
>>
>> Any pointers on how is this supposed to work?
>>
>>
>> Thanks,
>> srini
>>
> 
> Hi,
> 
> I would say I partially described how it works, when writing topology 
> kunit tests, here is link to cover letter:
> https://lore.kernel.org/alsa-devel/20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com/ 
> 

Thanks for the link.

> 
> To sum it up, there is no predefined order in which component and card 
> should be created. After each one of them is created ASoC tries to 
> rebind everything together and it should call component probe if 
> everything connects correctly.

Probe defer is not the issue here. All the relevant components are 
successfully probed, however the FE dais did not get chance to register 
from topology due to the below situation.

> 
> I'm not sure what problem you are seeing, but if you look at topology 
> test cases I only define BE in it, no FEs. So I guess you can look at it.
> 

This will work because BE dais are not defined in topology file.


Am trying to load FE dais from topology file along with the graph 
definition.

Ex:
Lets say we have a dai link in soundcard which has cpus->dai_name 
pointing to an FE dai ("MultiMedia1") available in topology file.

In this situation, sound card will be probed defered unless 
"MultiMedia1" dai is registered! However "MultiMedia1" dai can only be 
registered when the ASoC component("X") responsible for loading/reading 
tplg firmware is component->probed. This component("X") is only 
component->probed as part of soc_probe_link_components() during card bind.

So we are in catch 22 situation where in dai will not be registered 
because soc_probe_link_components() will not be called as dai is not 
registered.


> You can also look at skylake (sound/soc/intel/skylake) or SOF 
> (sound/soc/sof/) driver code which are real use cases of topology.
> 
> skylake and SOF code have pcm part which creates component and registers 
> probe function responsible for loading topology. Separate part are 
> machine drivers which create card (sound/soc/intel/boards).

Sure, I will dig in and see if I can find anything interesting  :-)

--srini
> 
