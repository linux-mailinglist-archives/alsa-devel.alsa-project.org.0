Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 184393B023
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850A116B1;
	Mon, 10 Jun 2019 09:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850A116B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560153634;
	bh=RMoT+W0BG9koE2j/jT/FD9BTvfGBLlMe60KGVs+sR7o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuJsJIw6JiDH8GJYLV8CVL2Jbo5vsrbK6IksbWP5peRk6smHDAoC8ojgCThXgE0AY
	 S+w5xQ7LEc+T+pmOritw6pWeKWYd7vTfIV84AY66YMfKSRdPZ2rophOsfAEYXzrJdB
	 3Wu+OJjAed/OiHVHbW0PQ2RYbncYK8ggZvgrkjxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DF5F896C7;
	Mon, 10 Jun 2019 09:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC04FF896E0; Mon, 10 Jun 2019 09:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F73CF896C7
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 09:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F73CF896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tPWiMoaZ"
Received: by mail-wm1-x342.google.com with SMTP id s15so4705990wmj.3
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oWEp6Smq9HgtNsDGiPy/kfOisBvfFm/zGIpQCU//1j8=;
 b=tPWiMoaZTxIg+ivBcwmlElm+0vlw8VlzRSFGWWqzkumTqJVKQsfEOfm4gUr1SwSF4+
 OP6lP+PGVF+WPm9/NMLY3dhw+o06UaurpHiLVOdtsWiVqxgvC6izd2jyAZXigWlBH7D5
 aiQ9L60OxHqg653nyvjbBDHArg4rxY2cmyzHOyqVkcdRI+GnVp9aSJJS0pAbNcwqNHiU
 OrA1dT4U4CBGfefIWHO4/9CkV2/7kWUSxPpF9CGt0MM5rCeDLxtD2pfNh+pPZI1RHDIG
 +qwtX7CpV6YIO/dPqxetlnA9ur6JWfBFz9JWzKi+MWKLQZnKSMkgLGd6uL6uGf/s2TtR
 dHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oWEp6Smq9HgtNsDGiPy/kfOisBvfFm/zGIpQCU//1j8=;
 b=YcpX9MWfRoX8a7YAL9NDrILOtqtx5sj6coi0wgNuybvXtlSszdUjUXqJJj68mX4row
 JqD26u2RtKPmri1PCny99HNXelklrzgpvVJZW5dpRM0fEQnN2X/X5k6a40rMhaTYrSnj
 yYJZcE/J9JHi5hhFx10airEb8HoT7j4dYq6Ftc/zSRcJMqfc4HzNrFMCcq2JIlEheNne
 Z2BQsvsQYJq5oziPzqKgowWSstLn621coq6t/JfeXZ4dfS7I5gDayPnu+JRCNAXFeoBo
 t/r5oDjfoUgDhRwYe3XeQBcy8iGynF4Zpgu5EvnaZ71vCw6R9fne/66XxQEXIZjR113C
 uvuA==
X-Gm-Message-State: APjAAAW6eLBLOwmzK0i0BgwShCCTmx/d+cU6dcShENnA2XabZCNbOZd1
 ixCwhbqut7N0p5G0hnfzzNyvgg==
X-Google-Smtp-Source: APXvYqxX6qNDmm5mRKIsfaOwn9+hQG/rSiP3wiBkr0VL16rtdRvuL/PwPrcJmQD4xKROrWwqko4fcw==
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr11106276wma.48.1560153515330; 
 Mon, 10 Jun 2019 00:58:35 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a81sm4227375wmh.3.2019.06.10.00.58.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 00:58:34 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-2-srinivas.kandagatla@linaro.org>
 <20190610043432.GI9160@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <689065b2-9d5c-68b4-d72f-1e971b903df2@linaro.org>
Date: Mon, 10 Jun 2019 08:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610043432.GI9160@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 1/6] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/06/2019 05:34, Vinod Koul wrote:
> On 07-06-19, 09:56, Srinivas Kandagatla wrote:
>> On platforms which have smart speaker amplifiers connected via
>> soundwire and modeled as aux devices in ASoC, in such usecases machine
>> driver should be able to get sdw master stream from dai so that it can
>> use the runtime stream to setup slave streams.
>>
>> soundwire already as a set function, get function would provide more
>> flexibility to above configurations.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   include/sound/soc-dai.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
>> index f5d70041108f..9f90b936fd9a 100644
>> --- a/include/sound/soc-dai.h
>> +++ b/include/sound/soc-dai.h
>> @@ -177,6 +177,7 @@ struct snd_soc_dai_ops {
>>   
>>   	int (*set_sdw_stream)(struct snd_soc_dai *dai,
>>   			void *stream, int direction);
>> +	void *(*get_sdw_stream)(struct snd_soc_dai *dai, int direction);
> 
> So who would be calling this API? Machine or someone else?

 From Machine driver in my case where smart speaker amplifiers are 
modeled as aux device which is also dai less.

--srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
