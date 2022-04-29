Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0555150EF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 18:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE74E204;
	Fri, 29 Apr 2022 18:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE74E204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651250044;
	bh=DU8muSHQ0wJ5zpDvL+gTZMhta62EEpUUfOAGve0+3TI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHDn5ihVAtw0TkdPWk/o6pBsHpYD/DdMnfZnLT6C1PXaN1RVuQEN66LfDriqdEtfD
	 K7IFhWsMk6LqPoR7pgcV5jkPJSEjTw7d5yyzYGaFtyMQh+r9DgEZsxWswPnT3J14kf
	 LbMEL3IZwsl4JRh8TnJ4IPIDJa3ZnmI5/PKNpdH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B67F80269;
	Fri, 29 Apr 2022 18:33:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4957F8007E; Fri, 29 Apr 2022 18:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A99D7F8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 18:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A99D7F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ePvqPx9e"
Received: by mail-wr1-x42f.google.com with SMTP id e24so11459219wrc.9
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S4NuDlQ4H333iLs1hPXqfwMkGd7SKFHcf7phIVGCdKU=;
 b=ePvqPx9exwhp1XFBmqykvbTUy9T9vZFmlnlXlKf0CDvmruz0alVYRaew6CPNgZDjqC
 o64hwcYzaoeuItfAe99tpfGXj/nJOr9A5rjv+TSnD8grUFOxs21mZrhAxVD1vxAdBLyJ
 Jjp+qcBp5DCYeJEFrSklrbQk0f3x2HdhwEFYazp9qWgC8yKeixDOe4gRlNIUFxzLnsxF
 tMMocfCW5oC5tSlutya1le9xZZaEwfSBpA57C58BWA1p27fqFy2itWFb4DP93N7wmziH
 2oh/kPTJoXG6fgGPQhscjqqa6FwbtVzV583KA4oqoWarfnjkCrbj+S39iV+sdLoCTBQ7
 PLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S4NuDlQ4H333iLs1hPXqfwMkGd7SKFHcf7phIVGCdKU=;
 b=wrin49rU/JovMOp1fYfOxuIEfCTadp3GJferpSmsV/jq5UGq4QSZ006Xktexd5DNH7
 1ysD+pGDV3UlZ63AWDFG8IERVPCOpFJ1DvpW9Rp2wqTZir38FNTqvDeA/pRDnvSi8D0+
 eir2Mb8EmsUS1GKrJlxjSDFE5lvA3CIxW7CDs8oNtfDzjUqu+KxjvFBVHyCLwp7AtwQc
 jlsdjhmRuoOGzaii2iFmXpA7u3fookzFdjhYwvIyZldSIEIPAbC5rR5PMRAAvZew9BI5
 RDGOpjLSwn35wc4jg3xUG2oaSBa1ZKvGyXi9VN1bawQTm6SgS0mTp27h75GipIMwIqnG
 PNbA==
X-Gm-Message-State: AOAM533vQl8/qWmdIdFHF4Si/wfxwO9xRTf8BUOhWU553gAnJp5+3IUJ
 zyyc3w2RTjmrEsXTMCHjfIUTzA==
X-Google-Smtp-Source: ABdhPJwnv6Sk8kzJ/jkU6fHgBhsL7U0fcKilKFur9FZMXs3z+CS+h066AYkE41m88w6TZU1G404EdQ==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr30662388wru.426.1651249974796; 
 Fri, 29 Apr 2022 09:32:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 o9-20020adf8b89000000b0020adeb916d8sm3019401wra.30.2022.04.29.09.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 09:32:53 -0700 (PDT)
Message-ID: <1c7395c8-10fb-98cd-9046-fa429f268da4@linaro.org>
Date: Fri, 29 Apr 2022 17:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220429160928.24614-1-srinivas.kandagatla@linaro.org>
 <e9f4001d-a9f4-fae7-521a-76f8880ba82b@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e9f4001d-a9f4-fae7-521a-76f8880ba82b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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



On 29/04/2022 17:19, Pierre-Louis Bossart wrote:
> 
> 
> On 4/29/22 11:09, Srinivas Kandagatla wrote:
>> Currently timeout for autoenumeration during probe and bus reset is set to
>> 2 secs which is really a big value. This can have an adverse effect on
>> boot time if the slave device is not ready/reset.
>> This was the case with wcd938x which was not reset yet but we spent 2
>> secs waiting in the soundwire controller probe. Reduce this time to
>> 1/10 of Hz which should be good enough time to finish autoenumeration
>> if any slaves are available on the bus.
> 
> Can I ask why this is dependent on a software configuration you have no control on?
> 
> Why not simply:
> 
> #define TIMEOUT_MS		100
> 
> ?

That will work too.

--srini


> 
>>
>> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index da1ad7ebb1aa..432e5cb9a4d2 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -105,7 +105,7 @@
>>   
>>   #define SWRM_SPECIAL_CMD_ID	0xF
>>   #define MAX_FREQ_NUM		1
>> -#define TIMEOUT_MS		(2 * HZ)
>> +#define TIMEOUT_MS		(HZ/10)
>>   #define QCOM_SWRM_MAX_RD_LEN	0x1
>>   #define QCOM_SDW_MAX_PORTS	14
>>   #define DEFAULT_CLK_FREQ	9600000
