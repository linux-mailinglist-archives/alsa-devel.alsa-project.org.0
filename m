Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B042FEF32
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 16:43:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E123E18EF;
	Thu, 21 Jan 2021 16:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E123E18EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611243784;
	bh=d4JLgeZVBNIDCRh+Nk1tgh/LRG1Cr/wVFBlQ00JRJb0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnvntIz8hW8kby0IVSEVuG32HWA7VumHZanfccBIey7PT16EgDAFmxn9EZVlc/UV1
	 q3SQh0caqe/gYIUdudvsfNBJ39auXIatROzMAD+EMsvobofMFb9W8S+yW97FsYoYEI
	 zCdKvzj5X4IGxmiRuhjCKrEi1eVCW7dMXjfaHVCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35285F8026A;
	Thu, 21 Jan 2021 16:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBAD8F80162; Thu, 21 Jan 2021 16:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 896C1F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 16:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 896C1F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="onBsKdxv"
Received: by mail-wm1-x335.google.com with SMTP id j18so1840349wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 07:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yYkGSQxEuVHgVYqPR33Yj58TultHi9vTZtbAI8y9az4=;
 b=onBsKdxvVavssmI8rA12b808rcLn2XtCSJgb41Bvl3//4pD0tRiSupygejhTlK+hlh
 j8L4A6ZdO1pmgDaoCAm12y2CEHVGnUUbZyo/OK8LYp35ILcxLpTwrl69zTc12m6T7BaW
 Zxf7phQdRPfMN/MmQBby9qMcW4ljpqsE2kTU1/ThZz9ZgrR4Rw/qM0PEMSQbpp4DCK1C
 7h3lvVRqTV4qJPygVo4iuwD3ZobeCdmTtlC0C1vezn8rOy6xOBAhoPEMw1ctenF8wDZ/
 /mocORrCmSeDuiQgPYSQr/ZtbXbjFdeHoV7Hl9bjHLYWdf5F9J+A+j4DzWMt5X5WDJLS
 WN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yYkGSQxEuVHgVYqPR33Yj58TultHi9vTZtbAI8y9az4=;
 b=dXH9fs6z3vAJgOSRPca77IA1QE+gd6DU2agu3LILK+rnZOPhqqk6jWGmE0aozLHsrO
 N3fhNM53tKc8xgRUVQ65jnwLkAWHLvezdBq5n71GgMvFqc2ZNCjLQgJUOVsTBPozYjRs
 3v4f01rkW215JE67/9o5lWNygLFtE3UjJkNPj8Y72X+5zv9I3E8aSHd5OWl1h41Dtsnk
 dZ7Rb5K7BLui0PfcDKbk2BRRzkCM0YgHLm6P7Hy288MHrN92fD88vIwzfggjTHnZXjiC
 aaXpgddHgoRie3QIYu2qHtDy3yPmERte7EfG80/uDb2km8wSY2j1997soT5u09gii4HD
 J5wQ==
X-Gm-Message-State: AOAM533JEyf/TFD5OtUdX6LM99khEwm9xcgsftDBytu2GDkRgjP9+zdW
 4Hw78yP4UMOrSOxIKiWFgYLCYw==
X-Google-Smtp-Source: ABdhPJzFImVwxFfXZaO5auJux/Yh75i+5b++ELZ9n6+/zSvtapYTTlq6W1J+hTLH4w0FVli7+5ex/w==
X-Received: by 2002:a1c:e055:: with SMTP id x82mr8433273wmg.185.1611243685461; 
 Thu, 21 Jan 2021 07:41:25 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t67sm8814444wmt.28.2021.01.21.07.41.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:41:24 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
 <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
Date: Thu, 21 Jan 2021 15:41:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 21/01/2021 14:56, Pierre-Louis Bossart wrote:
> 
> 
>> Port allocations are something like this:
>>
>> RX: (Simple)
>> Port 1 -> HPH L/R
>> Port 2 -> CLASS H Amp
>> Port 3 -> COMP
>> Port 4 -> DSD.
>>
>> TX: (This get bit more complicated)
>> Port 1: PCM
>> Port 2: ADC 1 & 2
>> Port 3: ADC 3 & 4
>> Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
>> Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7
>>
>> We handle the port allocation dynamically based on mixer and dapm 
>> widgets in my code! Also channel allocations are different for each 
>> function!
> 
> Sorry, I am not following here. What is dynamic here and use-case 
> dependent? And is this a mapping on the master or the codec sides that 
> you want to modify?

[SLAVE]-------[MASTER]
NA-------------Port 1: PCM
Port 1---------Port 2: ADC 1 & 2
Port 2---------Port 3: ADC 3 & 4
Port 3---------Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
Port 4---------Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7


Mapping is still static however Number of ports selection and channel 
mask will be dynamic here.


Example: for Headset MIC usecase we will be using Slv Port1, Slv Port3 
along with Mstr Port2 and Master Port4

Similarly for usecases like Digital MIC or other Analog MICs.


> 
>>> Does this help and can you align on what Intel started with?
>>
>> Firstly, This is where the issue comes, if we go with the 
>> suggested(dai->id) solution, we would end up with a long list of 
>> dai-links with different combinations of both inputs/output 
>> connections and usecases. Again we have to deal with limited DSP 
>> resources too!
>>
>> Secondly, The check [1] in stream.c will not allow more than one 
>> master port config to be added to master runtime. Ex: RX Port 1, 2, 3 
>> is used for Headset Playback.
> 
> I am confused here, we do have examples in existing codec drivers where 
> we use multiple ports for a single stream, e.g. for IV feedback we use 2 
> ports.

Is this on multi_link? which is why it might be working for you.

> 

Currently we have below check in sdw_stream_add_master().

if (!bus->multi_link && stream->m_rt_count > 0) {
	dev_err(bus->dev, "Multilink not supported, link %d\n", bus->link_id);
	ret = -EINVAL;
	goto unlock;
}

If we have single master(like my case) and dai-links which have more 
then one port  will be calling  sdw_stream_add_master() for each port, 
so m_rt_count above check will fail for the second call!



> In your "RX Port 1, 2, 3" example, are you referring to the codec or the 
> master side? If it's for the codec, it's already supported, see e.g. 

Master side.

> https://github.com/thesofproject/linux/pull/2514, we use DP2 and DP4 for 

This fine on slave side! Issue is on the master side!

> the same stream. This is done with the port_config capability.
> 
> 
