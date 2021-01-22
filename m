Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6FC3007B9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 16:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B721F29;
	Fri, 22 Jan 2021 16:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B721F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611330476;
	bh=BAcpmXRcuHZv36PsrGmN0zf/UNtioDrJS61cSFOn46A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olqiHp8DkOpu62SvYVO0IFrkHP1UMx3xg9gIfIdNkKx7/Azna3yd7lY0gBKnk/Lk+
	 3IXc6rR0csQym80xOKOKeQONDrX1bStmuQoIvCHy/zQodMg1HD8CmMG7CTKpxYoRVa
	 rbZFzOqvBSCDl1MpZjlasd+nDLzj9CxlBA87bayY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39246F8019B;
	Fri, 22 Jan 2021 16:46:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5089FF8015B; Fri, 22 Jan 2021 16:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E7CFF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 16:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E7CFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="t2l/9z+E"
Received: by mail-wm1-x336.google.com with SMTP id i63so4705712wma.4
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 07:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6BJVBNYMAJnjXGQAp7Nl9aAWAa4hMHVCTub9r3HEuIs=;
 b=t2l/9z+E+Tiv3gbTjNXHfYhOgbJ8go4nblFHGfFlq1kW9fRXX9/PqfGVW7n1TxtD6P
 xdjzuoB9YDJ+Gp+ixZctAdMrW09FCsOlshd7bxoEWYE03cuv5OrQeyxqtEkbkiQRkc6I
 /M+ZPhQPcBwesVZbazRwMCOLWkOjLe64h3NLBS/POLjVo46YRkuQqa7660kH1W8ocuJQ
 hUEzE3lsFw1L51/ER7hRQOqFy8cOSfIavTedSrP4T26UtifIfcpCB2TXs6nYRm63VuBb
 vrvotGi7XMYbgzosLGkl21WL7IXCqtf+k8lE5VVhh1W50lIwPkDExRNTGZPtMXuLsVpD
 5HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6BJVBNYMAJnjXGQAp7Nl9aAWAa4hMHVCTub9r3HEuIs=;
 b=H2zjMSbiS5dC+wsB3sLsWyD8l4iv10YsbHfQGPcf8jwRvDFyJWujVouOUuF8wMyIxn
 +1rPf3yGOk3bD6FOgCdsgzrCySsZ2QwjTJT+GPiRWBfoJiWsU+iurhGB9+BEUTQXl4Ov
 y2dFT0rJzPUW4eVxM7E0PUG+7kW2j1kX6zGFANRKSlYsCRz9QTifF9JtrVLb2KDOthJd
 8z/tM0o7D08gX6uimlHQWu0uWWt6dcPI1/0qd86M+L7TZyYaSoTjzL4zcWNU8v/4IzWJ
 PvflF3bBuOYwl1a1z+p0vgWahWm1jIoeSJM9YrYAixJ0+hYE7BLmif+j+qvnYFO0L7wT
 d5QQ==
X-Gm-Message-State: AOAM5322I8Z+1dHSXT4uhOrtQLOHfbvh/EydHsdmabPztlebOxgQ5wac
 eCUDLGfbxnQPqzc1evcrNzig8LKaG1HCzQ==
X-Google-Smtp-Source: ABdhPJyFNpDKV7btmzNe492kbobgkiH71L8veh/Za9wqnSB3viv/K7LYABMcZgMPFHF3eTPqZ50V8g==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr4673219wmm.4.1611330377499; 
 Fri, 22 Jan 2021 07:46:17 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n12sm13731221wrg.76.2021.01.22.07.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 07:46:16 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
 <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
Date: Fri, 22 Jan 2021 15:46:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
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



On 22/01/2021 15:32, Pierre-Louis Bossart wrote:
>>
>> Are you suggesting that we have dailink for each usecase like:
>>
>> "headset capture"
>> "Analog MIC1 capture"
>> "Analog MIC2 Capture"
>>
>> ...
>>
>> "Analog MIC4 Capture"
>>
>> ...
>>
>> "DMIC0 capture"
>> "DMIC1 Capture"
>> "DMIC2 Capture"
>>
>> ...
>>
>> "DMIC7 Capture"
>> ..
>> "Headset Playback"
>> "Ear Playback"
>> ..
>> "Aux Playback"
>> ...
>>
>> this is not really doable!
> 
> No, what I was saying is that you need to define multiple streams e.g.
> - headset capture (configured with or without click suppression)
> - mic capture (configured with AMICs or DMICs)
> - playback (or possibly different endpoint specific streams depending on 
> whether concurrency between endpoint is possible)
> 
> if you change the configuration, you have to tear down the stream and 
> reconfigure it - and for this we already have the required API and you 
> can guarantee that the configuration for that stream is consistent 
> between master and slave(s).

Yes, we make sure that new configuration is only applied before the 
stream is started, and not in middle of already started stream.
> 
>> All am saying is that codec can decide which ports it has to select 
>> based on mixer setting before the stream is setup/started. This 
>> updated mapping between slv port and master ports is passed as part of 
>> the port_config in sdw_stream_add_slave().
> 
> if you completely remove the stream and re-add it with updated 
> configuration things should work.

That's exactly what we do currently!

The updated ports due to new configuration ex: for "mic capture" dailink 
needs to be communicated from slave(codec) to master so that it can 
allocate correct ports. That is what this patch is trying to do (share 
current port map information).

--srini
